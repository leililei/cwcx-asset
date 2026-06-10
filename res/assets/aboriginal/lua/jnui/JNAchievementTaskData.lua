require("ReadData/GameData")
require("UI/Form/HttpPostFormSwitch")
JNAchievementTaskData={}
JNAchievementTaskData.PlayerAchievementTaskTab={}
JNAchievementTaskData.Enum_TaskProgress=
{
    Lock = 0,  --未解锁
    Accessable = 1,  --可领取
    Progressing = 2,  --进行中
    Recieved = 3,   --已领取
}
-- @function 创建一个成就任务信息oop对象
function JNAchievementTaskData:new(_ID,_InfoTab,_CurTaskProgress,_ProgressCount)
    -- statements
    local AchievementTask = {}
    setmetatable(AchievementTask,self)
    self.__index = self
    AchievementTask.ID=_ID
    AchievementTask.TaskType=_InfoTab[3]
    AchievementTask.CurTaskProgress = _CurTaskProgress   --当前成就任务状态
    AchievementTask.InfoTab = _InfoTab  --当前成就任务信息表
    AchievementTask.ProgressCount=_ProgressCount
    AchievementTask.ProgressRate = 0
    if _CurTaskProgress == JNAchievementTaskData.Enum_TaskProgress.Recieved then
        -- 已领取的奖励
        AchievementTask.ProgressCount = tonumber(_InfoTab[11])
        AchievementTask.ProgressRate = 1
    else
        if _InfoTab[11] == "0" then
            --没有具体次数的任务类型
            if tonumber(_ProgressCount) == 1 then
                -- 已经达成则进度为1
                AchievementTask.ProgressRate = 1
            else
                -- 未达成进度为0
                AchievementTask.ProgressRate = 0
            end
        else
            AchievementTask.ProgressRate = tonumber(_ProgressCount)/tonumber(_InfoTab[11])
        end
    end
    AchievementTask.RewardTab = {}  --奖励信息表(物品)
    local _RewardInfoTab1 = JNStrTool.strSplit(",", _InfoTab[9])
    for key, value in pairs(_RewardInfoTab1) do
        -- statements
        local _RewardInfoTab2 = JNStrTool.strSplit("_", value)
        table.insert(AchievementTask.RewardTab,_RewardInfoTab2)
    end
    return AchievementTask
end

-- @function 请求当前玩家的成就任务信息表
function JNAchievementTaskData.RequestPlayerAchieveTask(_LuaCallName)
    -- statements
    --HttpCore.GetActivationUIInfo(4,"JNAchievementTaskData.InitPlayerAchievementTaskTab",JNAchievementTaskData.InitPlayerAchievementTaskTab,_LuaCallName)
end

-- @function 初始化当前的玩家成就任务
function JNAchievementTaskData.InitPlayerAchievementTaskTab(_Str,_LuaCallName)
    JNAchievementTaskData.PlayerAchievementTaskTab={}
    if _Str == "" then
        -- 空字符串抛出不更新
        return
    end
    HttpCore.CreatAnalyisJsonData(_Str,"AchieveTaskInfo")
    local _RecievedTaskId=HttpCore.GetAnalyisDataByKey("AchieveTaskInfo","tasksHasGotRewarded")
    local _OnGoingTaskId=HttpCore.GetAnalyisDataByKey("AchieveTaskInfo","tasksDoing")
    local _Tab_AchieveTaskId={} --临时表存储当前玩家的成就任务ID以及对应状态和进度数量 etc. {{"110000",JNAchievementTaskData.Enum_TaskProgress.Recieved,0},...}
    --开始分割已领取任务Id表
    if _RecievedTaskId ~= "" then
        -- statements
        local _RecievedTaskInfoTab=JNStrTool.strSplit(",", _RecievedTaskId)
        for key, value in pairs(_RecievedTaskInfoTab) do
            -- statements
            table.insert(_Tab_AchieveTaskId,{value,JNAchievementTaskData.Enum_TaskProgress.Recieved,0})
        end
    end
    --开始分割进行中任务Id表
    if _OnGoingTaskId ~= "" then
        -- statements
        local _RecievedTaskInfoTab3=JNStrTool.strSplit(",", _OnGoingTaskId)
        for key, value in pairs(_RecievedTaskInfoTab3) do
            -- statements
            local _TempTab3 = JNStrTool.strSplit("_", value)
            if _TempTab3[2] == "null" then
                -- 还未有进度，进行中
                _TempTab3[2] = "0"
                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNAchievementTaskData.Enum_TaskProgress.Progressing,0})
            else
                for i, n in pairs(GameData.tab.task) do
                    -- statements
                    if n[1] == _TempTab3[1] then
                        -- 匹配对应任务id
                        -- print("_TempTab3[2]".._TempTab3[2])
                        if n[11] ~= "0" then
                            -- 如果不为指定任务数量任务则默认是0进度1则为完成
                            if tonumber(_TempTab3[2]) >= tonumber(n[11]) then
                                -- 可领取
                                _TempTab3[2]=""..n[11]
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNAchievementTaskData.Enum_TaskProgress.Accessable,tonumber(_TempTab3[2])})
                            else
                                --进行中
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNAchievementTaskData.Enum_TaskProgress.Progressing,tonumber(_TempTab3[2])})
                            end
                        else
                            --判断当前任务进度是否达到1否则为0（没有指定具体任务数量类型任务）
                            if tonumber(_TempTab3[2]) == 1 then
                                -- statements
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNAchievementTaskData.Enum_TaskProgress.Accessable,1})
                            else
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNAchievementTaskData.Enum_TaskProgress.Progressing,0})
                            end
                        end
                    end
                end
            end
        end
    end

    for key, value in pairs(GameData.tab.task) do
        for i, n in pairs(_Tab_AchieveTaskId) do
            if n[1] == value[1] then
                local _AchieveTaskData=JNAchievementTaskData:new(n[1],value,n[2],n[3])
                table.insert(JNAchievementTaskData.PlayerAchievementTaskTab,_AchieveTaskData)
            end
        end
    end
    local _Func_AchieveTaskSort = function (_a,_b)
        -- statements
        if _a.CurTaskProgress == _b.CurTaskProgress then
            -- statements
            if _a.ProgressRate == _b.ProgressRate then
                -- statements
            else
                --返回当前进度较高的那个
                return _a.ProgressRate > _b.ProgressRate
            end
        else
            --返回类型默认可领取>进行中>已领取
            return _a.CurTaskProgress < _b.CurTaskProgress
        end
    end
    table.sort(JNAchievementTaskData.PlayerAchievementTaskTab,_Func_AchieveTaskSort)
    --最后执行返回的Lua回调方法名进行回调
    if _LuaCallName ~=nil and _LuaCallName ~= "" then
        -- statements
        print("Event go ".._LuaCallName)
        Event.Go(_LuaCallName)
    end
end

return JNAchievementTaskData