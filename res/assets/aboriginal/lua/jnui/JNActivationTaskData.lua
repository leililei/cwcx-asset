require("ReadData/GameData")
require("UI/Form/HttpPostFormSwitch")
JNActivationTaskData={}

--当前的已领取活跃任务ID表
JNActivationTaskData.Tab_RecievedSingleTaskId={{"191000"},{"191001"},{"191002"},{"191003"}}
--当前的可领取的活跃任务ID表
JNActivationTaskData.Tab_ReachedSingleTaskId={{"191004"},{"191005"},{"191006"},{"191007"}}
--当前的进行中的活跃任务ID表
JNActivationTaskData.Tab_OnGoingSingleTaskId={{"191200","5"},{"191201","76"},{"191205","777"}}

--当前已领取的活跃度奖励Id
JNActivationTaskData.Tab_RecievedActivationRewardId={"192000","192001"}
--还在进行中的活跃度奖励Id
JNActivationTaskData.Tab_OnGoingActivationRewardId={"192002","192003","192004","192005","192006","192007","192008","192009"}

--当前每日活跃任务是否显示状态点
JNActivationTaskData.bool_IsShowDailyTaskStatusPoint=false
--当前每周活跃任务是否显示状态点
JNActivationTaskData.bool_IsShowWeekTaskStatusPoint=false
--当前每月活跃任务是否显示状态点
JNActivationTaskData.bool_IsShowMonthTaskStatusPoint=false

--当前玩家活跃度
JNActivationTaskData.CurPlayerActivationGoal=600
--当前查看的活跃任务类型
JNActivationTaskData.Int_CurSingleTaskType=1 --1.每日2.每周3.每月
JNActivationTaskData.PlayerActivationTaskTab={} --当前存储的玩家活跃任务信息表
JNActivationTaskData.Enum_TaskProgress=
{
    Lock = 0,  --未解锁
    Accessable = 1,  --可领取
    Progressing = 2,  --进行中
    Recieved = 3,   --已领取
}
-- @function 创建一个活跃任务信息oop对象
function JNActivationTaskData:new(_ID,_InfoTab,_CurTaskProgress,_ProgressCount)
    -- statements
    local ActivationTask = {}
    setmetatable(ActivationTask,self)
    self.__index = self
    ActivationTask.ID=_ID
    ActivationTask.TaskType=_InfoTab[3]
    ActivationTask.CurTaskProgress = _CurTaskProgress   --当前成就任务状态
    ActivationTask.InfoTab = _InfoTab  --当前成就任务信息表
    ActivationTask.ProgressCount=_ProgressCount
    ActivationTask.ProgressRate = 0
    if _CurTaskProgress == JNActivationTaskData.Enum_TaskProgress.Recieved then
        -- 已领取的奖励
        ActivationTask.ProgressCount = tonumber(_InfoTab[6])
        ActivationTask.ProgressRate = 1
    else
        if _InfoTab[6] == "0" then
            --没有具体次数的任务类型
            if tonumber(_ProgressCount) == 1 then
                -- 已经达成则进度为1
                ActivationTask.ProgressRate = 1
            else
                -- 未达成进度为0
                ActivationTask.ProgressRate = 0
            end
        else
            ActivationTask.ProgressRate = tonumber(_ProgressCount)/tonumber(_InfoTab[6])
        end
    end
    ActivationTask.RewardTab = {}  --奖励信息表(物品)
    local _RewardInfoTab1 = JNStrTool.strSplit(",", _InfoTab[7])
    for key, value in pairs(_RewardInfoTab1) do
        -- statements
        local _RewardInfoTab2 = JNStrTool.strSplit("_", value)
        table.insert(ActivationTask.RewardTab,_RewardInfoTab2)
    end
    return ActivationTask
end


--请求更新对应类型活跃任务信息并刷新UI
function JNActivationTaskData.RequestInitActivationTaskIndo(_taskType,_LuaCallBackName)
    -- statements
    --HttpCore.GetActivationUIInfo(_taskType,"JNActivationTaskData.AnalyisActivationInfo",JNActivationTaskData.AnalyisActivationInfo,_LuaCallBackName)
end

--根据请求返回字符串解析当前类型活跃任务信息
function JNActivationTaskData.AnalyisActivationInfo(_Str,_LuaCallName)
    -- statements
    JNActivationTaskData.Tab_RecievedSingleTaskId={}
    JNActivationTaskData.Tab_ReachedSingleTaskId={}
    JNActivationTaskData.Tab_OnGoingSingleTaskId={}
    JNActivationTaskData.Tab_RecievedActivationRewardId={}
    JNActivationTaskData.Tab_OnGoingActivationRewardId={}
    JNActivationTaskData.PlayerActivationTaskTab={}
    if _Str == "" then
        -- 空字符串抛出不更新
        return
    end
    HttpCore.CreatAnalyisJsonData(_Str,"ActivationInfo")
    local _RecievedTaskId=HttpCore.GetAnalyisDataByKey("ActivationInfo","tasksHasGotRewarded")
    local _OnGoingTaskId=HttpCore.GetAnalyisDataByKey("ActivationInfo","tasksDoing")
    local _CurActivationGoal=HttpCore.GetAnalyisDataByKey("ActivationInfo","integral")
    local _RecievedActivationId=HttpCore.GetAnalyisDataByKey("ActivationInfo","integralTasksHasGotRewarded")
    JNActivationTaskData.CurPlayerActivationGoal=tonumber(_CurActivationGoal)
    --开始分割已领取活跃度奖励Id表
    if _RecievedActivationId ~= "" then
        -- statements
        local _RecievedTaskInfoTab2=JNStrTool.strSplit(",", _RecievedActivationId)
        for key, value in pairs(GameData.tab.active_reward) do
            -- 嵌套遍历筛选出与已领取表中id不同的元素加入OnGoing进行中信息表
            local _IsDif =false --判断是否元素不同
            for i, n in pairs(_RecievedTaskInfoTab2) do
                -- statements
                if value[1] ~= n then
                    --没有匹配到相同ID
                    _IsDif=true
                else
                    --有匹配的ID跳出并置为false
                    _IsDif=false
                    break
                end
            end
            if _IsDif == true then
                -- 没有领取的或未完成的活跃奖励
                table.insert(JNActivationTaskData.Tab_OnGoingActivationRewardId, value[1])
            else
                -- 已完成的活跃奖励
                table.insert(JNActivationTaskData.Tab_RecievedActivationRewardId, value[1])
            end
        end
    else
        --没有任何已领取的活跃奖励，将整个活跃进度奖励表添加至进行中
        for key, value in pairs(GameData.tab.active_reward) do
            -- statements
            table.insert(JNActivationTaskData.Tab_OnGoingActivationRewardId, value[1])
        end
    end
    -- --开始分割已领取任务Id表
    -- if _RecievedTaskId ~= "" then
    --     -- statements
    --     local _RecievedTaskInfoTab=JNStrTool.strSplit(",", _RecievedTaskId)
    --     for key, value in pairs(_RecievedTaskInfoTab) do
    --         -- statements
    --         local _TempTab = {}
    --         table.insert(_TempTab, value)
    --         table.insert(JNActivationTaskData.Tab_RecievedSingleTaskId, _TempTab)
    --     end
    -- end

    -- --开始分割进行中任务Id表
    -- if _OnGoingTaskId ~= "" then
    --     -- statements
    --     local _RecievedTaskInfoTab3=JNStrTool.strSplit(",", _OnGoingTaskId)
    --     for key, value in pairs(_RecievedTaskInfoTab3) do
    --         -- statements
    --         local _TempTab3 = JNStrTool.strSplit("_", value)
    --         if _TempTab3[2] == "null" then
    --             -- 还未有进度，进行中
    --             _TempTab3[2] = "0"
    --             table.insert(JNActivationTaskData.Tab_OnGoingSingleTaskId, _TempTab3)
    --         else
    --             for i, n in pairs(GameData.tab.active) do
    --                 -- statements
    --                 if n[1] == _TempTab3[1] then
    --                     -- 匹配对应任务id
    --                     -- print("_TempTab3[2]".._TempTab3[2])
    --                     if tonumber(_TempTab3[2]) >= tonumber(n[6]) then
    --                         -- 可领取
    --                         _TempTab3[2]=""..n[6]
    --                         table.insert(JNActivationTaskData.Tab_ReachedSingleTaskId, _TempTab3)
    --                     else
    --                         --进行中
    --                         table.insert(JNActivationTaskData.Tab_OnGoingSingleTaskId, _TempTab3)
    --                     end
    --                 end
    --             end
    --         end
    --     end
    -- end
    local _Tab_AchieveTaskId={} --临时表存储当前玩家的成就任务ID以及对应状态和进度数量 etc. {{"110000",JNAchievementTaskData.Enum_TaskProgress.Recieved,0},...}
    --开始分割已领取任务Id表
    if _RecievedTaskId ~= "" then
        -- statements
        local _RecievedTaskInfoTab=JNStrTool.strSplit(",", _RecievedTaskId)
        for key, value in pairs(_RecievedTaskInfoTab) do
            -- statements
            table.insert(_Tab_AchieveTaskId,{value,JNActivationTaskData.Enum_TaskProgress.Recieved,0})
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
                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNActivationTaskData.Enum_TaskProgress.Progressing,0})
            else

                for i, n in pairs(GameData.tab.active) do
                    -- statements
                    if n[1] == _TempTab3[1] then
                        -- 匹配对应任务id
                        -- print("_TempTab3[2]".._TempTab3[2])
                        if n[6] ~= "0" then
                            -- 如果不为指定任务数量任务则默认是0进度1则为完成
                            if tonumber(_TempTab3[2]) >= tonumber(n[6]) then
                                -- 可领取
                                _TempTab3[2]=""..n[6]
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNActivationTaskData.Enum_TaskProgress.Accessable,tonumber(_TempTab3[2])})
                            else
                                --进行中
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNActivationTaskData.Enum_TaskProgress.Progressing,tonumber(_TempTab3[2])})
                            end
                        else
                            if tonumber(_TempTab3[2]) == 1 then
                                -- statements
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNActivationTaskData.Enum_TaskProgress.Accessable,1})
                            else
                                table.insert(_Tab_AchieveTaskId,{_TempTab3[1],JNActivationTaskData.Enum_TaskProgress.Progressing,0})
                            end
                        end
                    end
                end
            end
        end
    end

    for key, value in pairs(GameData.tab.active) do
        for i, n in pairs(_Tab_AchieveTaskId) do
            if n[1] == value[1] then
                local _AchieveTaskData=JNActivationTaskData:new(n[1],value,n[2],n[3])
                table.insert(JNActivationTaskData.PlayerActivationTaskTab,_AchieveTaskData)
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
    table.sort(JNActivationTaskData.PlayerActivationTaskTab,_Func_AchieveTaskSort)
    JNStatusBitCodeMGR.RequestInitPlayerStatusCode(_LuaCallName)
    -- if _LuaCallName ~=nil and _LuaCallName ~= "" then
    --     -- statements
    --     print("Event go ".._LuaCallName)
    --     Event.Go(_LuaCallName)
    --     -- Event.Clear(_LuaCallName)
    -- end
end

--点击领取对应类型任务奖励
function JNActivationTaskData.RequestGetTaskReward(_Id,_Type,_LuaCallBackName)
    HttpCore.GetTaskReward(_Id,_Type,"JNActivationTaskData.AnalyisCurTaskRewardInfo",JNActivationTaskData.AnalyisCurTaskRewardInfo,_LuaCallBackName)
end

--根据请求返回字符串解析本次领取到的奖励信息
function JNActivationTaskData.AnalyisCurTaskRewardInfo(_Str,_LuaCallName)
    if _Str == ""or _Str == "[]" then
        --返回空字符串信息
        return
    end
    HttpPostFormSwitch.ClearItemAchieveTab()
    local RewardListCount = HttpRequestMGR.Instance:GetJsonListCount(_Str)
    HttpCore.CreatAnalyisJsonData(_Str,"CurTaskRewardInfo")
    print("_Str".._Str)
    local _TempItemInfoTab={}   --临时存储当前领取到的所有奖励集合{id,count}
    for i = 0, RewardListCount - 1, 1 do
        -- statements
        local ItemInfoTab={}    --临时表用来存储单个奖励的ID和数量
        local _GoodsId=HttpCore.GetAnalyisDataByKey("CurTaskRewardInfo","goodsId",i)
        local _Id=HttpCore.GetAnalyisDataByKey("CurTaskRewardInfo","id",i)
        local _Type=HttpCore.GetAnalyisDataByKey("CurTaskRewardInfo","type",i)
        local _Count=HttpCore.GetAnalyisDataByKey("CurTaskRewardInfo","num",i)
        if _Type ~= "0" then
            table.insert(ItemInfoTab,_GoodsId)
            table.insert(ItemInfoTab,_Count)
            local _Bool_IsAdd = false --当前是否已经存储在 Flag
            for key, value in pairs(_TempItemInfoTab) do
                if value[1] == _GoodsId then
                    -- statements
                    value[2]=""..(tonumber(value[2]) + tonumber(_Count))
                    _Bool_IsAdd=true
                    break
                end
            end
            if not _Bool_IsAdd then
                table.insert(_TempItemInfoTab,ItemInfoTab)
            end
        end
    end
    for key, value in pairs(_TempItemInfoTab) do
        HttpPostFormSwitch.AddItemToItemAchieveTab(value[1],value[2])
    end
    --最后执行返回的Lua回调方法名进行回调
    if _LuaCallName ~=nil and _LuaCallName ~= "" then
        -- statements
        print("Event go ".._LuaCallName)
        Event.Go(_LuaCallName)
    end
end

return JNActivationTaskData