require("Model/Time/Data/TimeData")
TimeControl = {}

---@type TimeData[]
local TimeTable = {}
local LinkAct = {}

function TimeControl.Init(TimeInfo)
    if TimeInfo ~= nil then
        for i,timeInfo in ipairs(TimeInfo) do
            TimeTable[timeInfo.ID] = TimeData.New(timeInfo)
        end
    end
    LinkAct = {}
end

function TimeControl.GetTimeTable(TimeID)
    return TimeTable[TimeID]
end
---新增时间
function TimeControl.AddTimeTable(TimeInfo, newActIDList)
    if TimeInfo == nil then
        return
    end
    for i,timeInfo in ipairs(TimeInfo) do
        TimeTable[timeInfo.ID] = TimeData.New(timeInfo)
    end
    --刷新时间
    ActivityControl.RefreshTime()
    ShopControl.RefreshTime()
    CardDrawControl.RefreshTime()

    if newActIDList and next(newActIDList) then
        for i, newActID in ipairs(newActIDList) do
            local tActData = ActivityControl.GetActivityByID(newActID)
            if tActData and tActData.LinkIcon ~= "0" then
                table.insert(LinkAct, newActID)
            end
        end
    end
end
---检测是否新开启的活动，开启弹窗
function TimeControl.CheckOpenPop()
    if next(LinkAct) then
        MgrUI.Pop(UID.NewActivityPop_UI, {LinkAct},true)
    end
    LinkAct = {}
end

return TimeControl