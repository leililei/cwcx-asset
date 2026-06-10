------------任务VM------------
---待优化及业务逻辑整合
ActivationTaskViewModel = {}
ActivationTaskViewModel.ReceivedCallBack = nil
ActivationTaskViewModel.TurnToTaskPage = false
---统计类型枚举
ActivationTaskViewModel.statisticType =
{
    ACHIEVEMENT = 0,
    NOVICE = 9,
    EVENT_RAID = 51,
    DAY = 1001,
    WEEK = 1002,
    MONTH = 1003,
    ACTIVITY_DAY = 61,
    ACTIVITY_WEEK = 62,
    GUIDE = 10,
    ACTIVE_SUMMER = 5
}
---------------------初始化-----------------------
function ActivationTaskViewModel.Init()
    ActivationTaskViewModel.OpenActivationTaskUI()
end
function ActivationTaskViewModel.Close()
    MgrUI.GoBack()
end
---------------------UI跳转------------------------
function ActivationTaskViewModel.OpenActivationTaskUI()
    MgrUI.GoHide(UID.NewActivationTask02_UI)
end
---------------------业务逻辑------------------------

---获取日常积分任务
function ActivationTaskViewModel.GetIntegralTask(type)
    local array = {}
    array = TaskControl.GetIntegralTaskData(type)
    --table.sort(array, function(a,b)
    --    if a.isComplete > b.isComplete then
    --        return false
    --    elseif a.isComplete < b.isComplete then
    --        return true
    --    else
    --        if a.isReceive > b.isReceive then
    --            return true
    --        elseif a.isReceive < b.isReceive then
    --            return false
    --        else
    --            return a.id < b.id
    --        end
    --    end
    --    return false
    --end)
    return array
end
---获取活动任务
function ActivationTaskViewModel.GetEventRaidTask()
    ---@type DayTaskData[]
    local array = {}
    local tEventData = EventRaidControl.GetEventData()
    array = TaskControl.GetEventRaidTaskData(tEventData.dayTaskId)    --附带判断任务是否解锁
    table.sort(array, function(a,b)     --按照是否已完成和已领取排序
        if a.isComplete > b.isComplete then
            return false
        elseif a.isComplete < b.isComplete then
            return true
        else
            if a.isReceive > b.isReceive then
                return true
            elseif a.isReceive < b.isReceive then
                return false
            else
                return a.id < b.id
            end
        end
    end)
    return array
end

---获取日常任务
function ActivationTaskViewModel.GetDayTask(type)
    ---@type DayTaskData[]
    local array = {}
    array = TaskControl.GetDayTaskData(type)    --附带判断任务是否解锁
    table.sort(array, function(a,b)     --按照是否已完成和已领取排序
        if a.isComplete > b.isComplete then
            return false
        elseif a.isComplete < b.isComplete then
            return true
        else
            if a.isReceive > b.isReceive then
                return true
            elseif a.isReceive < b.isReceive then
                return false
            else
                return a.id < b.id
            end
        end
    end)
    return array
end

---获取统计数值
function ActivationTaskViewModel.GetStatisticValue(type,id)
    local data = nil
    if id == 11001 then     ---特殊情况
    data =  TaskControl.dayStatistics[id]
    elseif type == ActivationTaskViewModel.statisticType.DAY then
        data = TaskControl.dayStatistics[id]
    elseif type == ActivationTaskViewModel.statisticType.WEEK then
        data =  TaskControl.weekStatistics[id]
    elseif type == ActivationTaskViewModel.statisticType.MONTH then
        data =  TaskControl.monthStatistics[id]
    elseif type == ActivationTaskViewModel.statisticType.ACTIVITY_DAY then
        data =  TaskControl.activityDayStatistics[id]
    elseif type == ActivationTaskViewModel.statisticType.ACTIVITY_WEEK then
        data =  TaskControl.activityWeekStatistics[id]
    elseif type == ActivationTaskViewModel.statisticType.ACHIEVEMENT or type == ActivationTaskViewModel.statisticType.NOVICE or type == ActivationTaskViewModel.statisticType.GUIDE or type == ActivationTaskViewModel.statisticType.ACTIVE_SUMMER then
        data = TaskControl.gloryStatistics[id]
    elseif type == ActivationTaskViewModel.statisticType.EVENT_RAID then
        data = TaskControl.EventRaidStatistics[id]
    elseif type == TaskControl.AchievementTaskType.PASSPORT then
        data = TaskControl.gloryStatistics[id]
    end
    return data or 0
end

---提交任务数据返回
function ActivationTaskViewModel.TaskPerformACK(buffer, tag, callback)
    local tab = assert(pb.decode('PBClient.ClientTaskPerformACK',buffer))
    if tag~=0 then
        return
    end
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        if tab.errNo == ServerErrorCode.TaskPerform_560 then
            TaskControl.GetTaskData()
        end
    end
end
function ActivationTaskViewModel.TaskPerformNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTaskPerformNTF',buffer))
    if tag~=0 then
        return
    end
    if tab.reward then
        ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)
    end
    if tab.medal then
        ItemControl.PushGroupItemData(tab.medal,ItemControl.PushEnum.add)
    end
    if tab.taskID ~= nil then
        for i, v in pairs(tab.taskID) do
            TaskControl.CompleteTaskData[v] = v
        end
    end
    if tab.dayScore then
        TaskControl.dayScore = tab.dayScore
    end
    if tab.weekScore then
        TaskControl.weekScore = tab.weekScore
    end
    if tab.monthScore then
        TaskControl.monthScore = tab.monthScore
    end
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    if ActivationTaskViewModel.ReceivedCallBack then
        ActivationTaskViewModel.ReceivedCallBack()
    end
    ---日常埋点
    if tab.taskType == 1001 then
        local tStr = string.format("EveryDayTask_%d", PlayerControl.GetPlayerData().UID)
        local tNum = UnityEngine.PlayerPrefs.GetInt(tStr)
        local tCurDay = Global.GetCreateRoleDays()
        local tLoginDay = Global.GetCreateRoleDays(Global.GetCreateRoleDays(PlayerControl.GetPlayerData().curLoginTime))
        if tCurDay ~= tLoginDay then
            ---跨天清零
            tNum = 0
        end
        if tNum < 7 then
            local taskNum = tNum + #tab.taskID
            for i = tNum+1, taskNum do
                if i == 1 then
                    ---任务完成情况 任务1
                    MgrSdk.FlyFunTrackEvent("mcra81","finsh_mission_1")
                elseif i == 3 then
                    ---任务完成情况 任务3
                    MgrSdk.FlyFunTrackEvent("m8imcx","finsh_mission_3")
                elseif i == 5 then
                    ---任务完成情况 任务5
                    MgrSdk.FlyFunTrackEvent("s3pomx","finsh_mission_5")
                elseif i == 7 then
                    ---任务完成情况 任务7
                    MgrSdk.FlyFunTrackEvent("4v2fra","finsh_mission_7")
                end
            end
            UnityEngine.PlayerPrefs.SetInt(tStr, taskNum)
        end
    end
    ---加载图片重新初始化
    SettingViewModel.LoadingImageInit()
end
---提交任务数据  //taskType 任务类型  1001 日常 1002 周常 1003 月常 51 活动 61 通行证日常 62 通行证周常  //taskID 完成任务id 如果填 非负数 则为完成一条 负数为一键领取
function ActivationTaskViewModel.TaskPerform(taskType,taskID,parentUI,subType,callBack)
    local BaseREQ  =
    {
        taskType = taskType,
        taskID = taskID,
        subType = subType
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTaskPerformREQ',BaseREQ))
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_TASK_PERFORM_REQ,bytes,0,nil, function(...)
        ActivationTaskViewModel.TaskPerformACK(...)
    end, function(...)
        ActivationTaskViewModel.TaskPerformNTF(...)
        if parentUI then
            parentUI:UpdataPanel()
        end
        if callBack then
            callBack()
        end
    end)
end


---提交积分数据返回
function ActivationTaskViewModel.GetScoreRewardACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetScoreRewardACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("activationtaskviewmodel_tips2"),2},true)
    end
end
function ActivationTaskViewModel.GetScoreRewardNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetScoreRewardNTF',buffer))
    if tab.goods then
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
    end
    ---获取玩家数据
    local player = PlayerControl.GetPlayerData()
    ---检查是否升级
    PlayerControl.CheckLevelUp(tab.userLevel)
    ---更新体力
    player:PushVigor(tab.vigor)
    ---更新玩家经验
    player:PushExp(tab.exp)
    ---更新玩家等级
    player:PushLevel(tab.level)
    if tab.scoreID then
        TaskControl.AchievedRewardData[tab.scoreID] = tab.scoreID
    end
    TaskControl.CheckDotReceived()
    if ActivationTaskViewModel.ReceivedCallBack then
        ActivationTaskViewModel.ReceivedCallBack()
    end
end
---提交积分数据
function ActivationTaskViewModel.GetScoreReward(scoreID)
    local BaseREQ  =
    {
        scoreID = scoreID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetScoreRewardREQ',BaseREQ))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_SCORE_REWARD_REQ,bytes,0,nil, ActivationTaskViewModel.GetScoreRewardACK,ActivationTaskViewModel.GetScoreRewardNTF)
end

-- * @description: 通过某一时间点获取时间
-- * @params: @futureDays:0代表的意思是当天,1是明天,@_hour:指的24格式的时间，传入2就是凌晨2点
-- * @return: 时间戳
function ActivationTaskViewModel.GetFutureTime(futureDays, _hour)
    local curTimestamp = Global.GetCurTime()
    local dayTimestamp = 24 * 60 * 60
    local newTime = curTimestamp + dayTimestamp * futureDays
    local newDate = os.date("!*t", newTime + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    --这里返回的是你指定的时间点的时间戳
    return os.time({year = newDate.year, month = newDate.month, day = newDate.day, hour = (newDate.hour >= 5) and _hour or 5, minute = newDate.minute, second = newDate.second}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
end

function ActivationTaskViewModel.GetSeasonFutureTime(futureDays, _hour)
    local curTimestamp = Global.GetCurTime()
    local dayTimestamp = 24 * 60 * 60
    local newTime = curTimestamp + dayTimestamp * futureDays
    local newDate = os.date("!*t", newTime + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    --这里返回的是你指定的时间点的时间戳
    return os.time({year = newDate.year, month = newDate.month, day = newDate.day, hour =  _hour, minute = newDate.minute, second = newDate.second}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
end

function ActivationTaskViewModel.getWeekNum()
    --当前是星期几
    local t = Global.GetCurTime()
    local weekNum = os.date("!*t",t + tonumber(SteamLocalData.tab[112007][2]) * 3600).wday - 1
    return tonumber(weekNum);
end

function ActivationTaskViewModel.GetLastTime(datetype)
    --获取当前时间戳
    local curTimestamp = Global.GetCurTime()
    local timeZone = Global.GetClientTimeZone()
    --curTimestamp = curTimestamp + tonumber(SteamLocalData.tab[112007][2]) * 3600
    local nowDate = os.date("!*t", curTimestamp + tonumber(SteamLocalData.tab[112007][2]) * 3600)    --服务器实际日期
    local result
    if(datetype == "TODAY")then
        --当天
        local newDate = {year = nowDate.year, month = nowDate.month, day =  nowDate.day, hour = (nowDate.hour >= 5) and 29 or 5, minute = 0, second = 0}
        result = os.time(newDate) - (tonumber(SteamLocalData.tab[112007][2]) - timeZone) * 3600
    elseif(datetype == "WEEK")then
        --本周
        local num = ActivationTaskViewModel.getWeekNum() == 0 and 7 or ActivationTaskViewModel.getWeekNum()
        if num == 0 then
            num = 7
        end
        if nowDate.hour < 5 then
            num = num == 1 and 7 or num-1
        end
        local weekNum = 7 - num --本周剩几天
        result = ActivationTaskViewModel.GetFutureTime(weekNum, 29);
    elseif(datetype == "MONTH")then
        --本月
        local newDate
        if nowDate.day == 1 and nowDate.hour < 5 then
            if nowDate.month ~= 1
            then
                local totalDay = Global.GetLastMonthTotalDays()
                newDate = {year = nowDate.year, month = nowDate.month - 1, day = totalDay, hour = 29, minute = 0, second = 0}
            else
                local totalDay = Global.GetLastMonthTotalDays()
                newDate = {year = nowDate.year - 1, month = 12, day = totalDay, hour = 29, minute = 0, second = 0}
            end
        else
            local totalDay = Global.GetTotalDays()
            newDate = {year = nowDate.year, month = nowDate.month, day = totalDay, hour = 29, minute = 0, second = 0}
        end
        result = os.time(newDate) - (tonumber(SteamLocalData.tab[112007][2]) - timeZone) * 3600
    end
    --curTimestamp = curTimestamp - timeZone * 3600
    return result - curTimestamp
end

---获得赛季结算时间 isBig是否是大天梯
function ActivationTaskViewModel.GetSeasonTime(isBig)
    local str = {}
    if isBig then
        str = string.split(SteamLocalData.tab[107004][2],",")
    else
        str = string.split(SteamLocalData.tab[108007][2],",")
    end
    local weekNum = ActivationTaskViewModel.getWeekNum();
    local data = os.date("!*t",Global.GetCurTime() + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    local starNum = ActivationTaskViewModel.getWeekNum();
    ---如果是周一五点前
    if weekNum == 1 and data.hour < (0 - str[2]) then
        weekNum = 7
        starNum = 8
    end
    if weekNum == 0 then
        weekNum = 7
        starNum = 7
    end
    local startTime = ActivationTaskViewModel.GetSeasonFutureTime(7 - starNum, 24 - tonumber(str[1]));
    local endTime = ActivationTaskViewModel.GetFutureTime(7 - weekNum, 24 + math.abs(tonumber(str[2])));
    return startTime,endTime
end

return ActivationTaskViewModel