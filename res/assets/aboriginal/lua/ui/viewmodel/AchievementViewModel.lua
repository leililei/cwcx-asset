---成就
AchievementViewModel = {}
AchievementViewModel.ReceivedCallBack = nil
---初始化
function AchievementViewModel.Init()
    AchievementViewModel.OpenUI()
end

---销毁
function AchievementViewModel.Close()
    MgrUI.GoBack()
end

-----------跳转--------------------
---打开UI
function AchievementViewModel.OpenUI()
    MgrUI.GoHide(UID.Achievement_UI)
end

---获取成就任务
---@return AchievementTaskData[]
function AchievementViewModel.GetTask(type,deleteEvent,activeId)
    ---@type AchievementTaskData[]
    local array = {}
    local array2 = {}
    array2 = TaskControl.GetAchievementData(type)
    if not deleteEvent then
        if activeId then
            for i, v in pairs(array2) do
                if v.activeId == activeId then
                    table.insert(array,v)
                end
            end
        else
            array = array2
        end
    else
        --剔除活动相关的数据
        for i,v in pairs(array2) do
            if v.activeId == TaskControl.AchievementSystemType.Achieve then
                table.insert(array,v)
            end
        end
    end

    table.sort(array, function(a,b)
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
function AchievementViewModel.GetStatisticValue(id)
    return TaskControl.gloryStatistics[id] or 0
end


---提交任务数据返回
function AchievementViewModel.TaskPerformACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTaskPerformACK',buffer))
    if tag~=1 then
        return
    end
    print(tab.errNo)
    if tab.errNo~=0 then
        if tab.errNo == TaskPerform_560 then
            TaskControl.GetTaskData()
        end
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
    end
end
function AchievementViewModel.TaskPerformNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTaskPerformNTF',buffer))
    if tag~=1 then
        return
    end
    if tab.reward then
        ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)

        for i, v in ipairs(tab.reward) do
             SettingViewModel.SetLoadingImage(v.goodsID)
        end
    end
    if tab.medal then
        ItemControl.PushGroupItemData(tab.medal,ItemControl.PushEnum.add)
    end
    for i, v in pairs(tab.taskID) do
        TaskControl.CompleteTaskData[v] = v
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
    if AchievementViewModel.ReceivedCallBack then
        AchievementViewModel.ReceivedCallBack()
    end
    if tab.events then
        ActivityControl.SetActivityInfo(tab.events[1].id,tab.events[1])
    end
    ---加载图片重新初始化
    SettingViewModel.LoadingImageInit()
end
---提交任务数据  //taskType 任务类型 0 成就任务 1  日常 2 周常 3 月常  //taskID 完成任务id 如果填 非负数 则为完成一条 0为一键领取  //subType 任务组
function AchievementViewModel.TaskPerform(taskType,taskID,parentUI,subType,subTypeCall)
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
    MgrNet.SendReq(MID.CLIENT_TASK_PERFORM_REQ,bytes,1,nil, AchievementViewModel.TaskPerformACK,function(...)
        AchievementViewModel.TaskPerformNTF(...)
        if parentUI then
            parentUI:UpdataPanel()
        end
        if subTypeCall then
            subTypeCall()
        end
    end)
end

return AchievementViewModel