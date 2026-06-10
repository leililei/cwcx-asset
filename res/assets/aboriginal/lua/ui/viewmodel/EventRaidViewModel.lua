require("LocalData/RecruitactivityLocalData")
require("LocalData/StoryactivityLocalData")
EventRaidViewModel = {}
---跳转到剧情
EventRaidViewModel.JumpToPlot = false
---当前选择的index
EventRaidViewModel.CurIndex = nil
---当前选择的BOSS关卡ID
EventRaidViewModel.CurID = nil
---是否弹窗过提示了
EventRaidViewModel.PoppedTip = false
---活动Boss血量
local EventRaidBossBlood = {}
EventRaidViewModel.EventRaidBossNowHp = 0
---活动的参数
local EventRaidParameters = nil
---Boss难度
local EventRaidBossHardness = 1

---设置Boss难度
function EventRaidViewModel.SetBossHardness(hardness)
    EventRaidBossHardness = hardness
end
---设置剧情活动参数
function EventRaidViewModel.SetParameters(paras)
    EventRaidParameters = paras
end
---获得剧情活动参数
function EventRaidViewModel.GetParameters()
    return EventRaidParameters
end
---剧情活动信息刷新
function EventRaidViewModel.GetEventRaidData()
    local data = EventRaidControl.GetEventRaidData()
    return data
end

---进入剧情活动
function EventRaidViewModel.EnterStoryActivity()

end
---获取活动节点数据
function EventRaidViewModel.GetStoryPointData()

end
---获取所有新兵训练任务数据
function EventRaidViewModel.GetNoviceActivityData()
    for i,v in pairs(TaskControl.NoviceDataList) do
        if TaskControl.CheckComplete(v.id) then
            v.isComplete = 1
        else
            v.isComplete = 0
        end
        if TaskControl.CheckAchieveReceived(v) then
            v.isReceive = 1
        else
            v.isReceive = 0
        end
    end
    return TaskControl.NoviceDataList
end
---根据任务组ID获取新兵训练任务数据
function EventRaidViewModel.GetNoviceActivityDataByID(taskGroupID)
    local taskGroup = {}
    for i,v in pairs(TaskControl.NoviceDataList) do
        if v.taskGroupID == taskGroupID then
            if TaskControl.CheckComplete(v.id) then
                v.isComplete = 1
            else
                v.isComplete = 0
            end
            if TaskControl.CheckAchieveReceived(v) then
                v.isReceive = 1
            else
                v.isReceive = 0
            end
            table.insert(taskGroup,v)
        end
    end
    return taskGroup
end
---获得活动关卡Boss信息
---@param data StormPointData
function EventRaidViewModel.GetBossData(data,idx)
    local req = {
        type = -1
    }
    ---当前索引
    EventRaidViewModel.CurIndex = idx
    ---当前ID
    EventRaidViewModel.CurID = data.id
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLevelInfoREQ',req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LEVEL_INFO_REQ,bytes,1,nil,EventRaidViewModel.GetBossDataACK,function(...)
        local info = EventRaidViewModel.GetBossDataNTF(...)
        ---获取Boss信息/弹出Boss面板
        MgrUI.Pop(UID.EventBossPop_UI,{data,idx,info},true)
    end)
end
function EventRaidViewModel.GetBossDataACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientLevelInfoACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidviewmodel_tips1"),2},true)
    end
end
function EventRaidViewModel.GetBossDataNTF(buffer,tag,callBack)
    local tab = assert(pb.decode('PBClient.ClientLevelInfoNTF',buffer))
    if tab.hp then
        for i,v in pairs(tab.hp) do
            if EventRaidViewModel.CurID == v.levelId then
                for i = 1,#tab.level do
                    if tab.level[i].levelID == EventRaidViewModel.CurID then
                        BattleManager.CurActivityBossPointInfo = tab.level[i]
                        break
                    end
                end
                ---当前BOSS血量赋值
                if v.nowHp == 0 then
            BattleManager.CurActivityBossHp = v.totalHp
                else
                BattleManager.CurActivityBossHp = v.nowHp
                end
                break
                end
        end
    end

    if callBack then
        callBack()
    end
    return tab
end

---带回调的获取Boss数据
function EventRaidViewModel.GetBossData2(idx,callBack)
    local req = {
        type = -1
    }
    ---当前索引
    EventRaidViewModel.CurIndex = idx
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLevelInfoREQ',req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LEVEL_INFO_REQ,bytes,1,nil,EventRaidViewModel.GetBossDataACK,function(...)
        EventRaidViewModel.GetBossDataNTF(...,nil,callBack)
    end)
end

---获得Boss血量
function EventRaidViewModel.GetBossBlood(idx)
    return EventRaidBossBlood[idx]
end
---设置Boss血量
function EventRaidViewModel.SetBossBlood(idx,percent)
    EventRaidBossBlood[idx] = percent
end
---检查剧情活动红点
function EventRaidViewModel.CheckRot(stateBack)
    local tEventID = { activityId = 20000 }
    local tEventData = EventRaidControl.CreateEventRaidData(tEventID)
    local inMiddle = Global.isMiddleTime(tEventData.beginTime, tEventData.endTime)
    
    if inMiddle and EventRaidControl.GetEventRaidData() then
        if stateBack then
            stateBack()
        end
        if not SysLockControl.CheckSysLock(1106) then
            RedDotControl.GetDotData("EventRaidTask"):SetState(false)
            return
        end
    else
        RedDotControl.GetDotData("EventRaidTask"):SetState(false)
        return
    end

    local CurTaskLoopList = {}
    local tDailyRedState = false
    local tTotalRedState = false
    for i = 1, 2 do
        if i == 1 then
            ---活动任务检查
            ---@type DayTaskData[]
            CurTaskLoopList = ActivationTaskViewModel.GetEventRaidTask()
        else
            ---活动成就任务检查
            ---@type AchievementTaskData[]
            local tEventData = EventRaidControl.GetEventData()
            CurTaskLoopList = AchievementViewModel.GetTask(TaskControl.AchievementTaskType.ACTIVITY_STORY,false,tEventData.taskId)
        end
        for n = 1, #CurTaskLoopList do
            if CurTaskLoopList[n].isComplete == 0 and CurTaskLoopList[n].isReceive == 1 then
                if i == 1 then
                    tDailyRedState = true
                else
                    tTotalRedState = true
                end
                break
            end
        end
    end
    RedDotControl.GetDotData("EventRaidTaskDaily"):SetState(tDailyRedState)
    RedDotControl.GetDotData("EventRaidTaskTotal"):SetState(tTotalRedState)
end

function EventRaidViewModel.Clear()
    EventRaidViewModel.JumpToPlot = false
    EventRaidViewModel.CurIndex = nil
    EventRaidViewModel.CurID = nil
    EventRaidViewModel.PoppedTip = false
    EventRaidBossBlood = {}
    EventRaidParameters = nil
    EventRaidBossHardness = 1
end

return EventRaidViewModel