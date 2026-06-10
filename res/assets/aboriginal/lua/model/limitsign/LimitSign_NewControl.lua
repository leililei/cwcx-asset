require("LocalData/SignineventLocalData")
require("LocalData/SevensignLocalData")
require("LocalData/ActivityLocalData")
require("UI/ViewModel/SignViewModel")---签到
---管理器
LimitSign_NewControl = {}

local LimitSign_NewDataList = {}
local limitSign_New = {} --服务器初始化数据
local ActivityInfo = {}
function LimitSign_NewControl.Init()
    local actList = {}
    for i,v in pairs(ActivityLocalData.tab) do
        if v[2] == ActivityControl.activityTypeEnum.LIMITSIGN_NEW then
            table.insert(actList,v)
            RedDotControl.RegisterChildDot("limitSign_New_"..v[1],"Activity")
        end
    end
    if #actList == 0 then
        return
    end

    for i = 1, #actList do
        local activityid = actList[i][1]
        local tab = {}
        local group = actList[i][6]
        for i, v in ipairs(SignineventLocalData.tab) do
            if group == v.group and activityid == v.activityid then
                table.insert(tab,v)
            end
        end
        LimitSign_NewDataList[activityid] = tab
    end
end


function LimitSign_NewControl.GetActivityInfo()
    return ActivityInfo
end

function LimitSign_NewControl.SetActivityInfo(_ActivityInfo)
    ActivityInfo = _ActivityInfo
end

---限时签到红点
function LimitSign_NewControl.CheckLimitSignRedDot(_actId)
    if _actId then
        if LimitSign_NewControl.GetIsSignDay(_actId) then
            RedDotControl.GetDotData("limitSign_New_".._actId):SetState(true)
        else
            RedDotControl.GetDotData("limitSign_New_".._actId):SetState(false)
        end
    else
        for i, v in pairs(LimitSign_NewDataList) do
            if LimitSign_NewControl.GetIsSignDay(i) then
                RedDotControl.GetDotData("limitSign_New_"..i):SetState(true)
            else
                RedDotControl.GetDotData("limitSign_New_"..i):SetState(false)
            end
        end
    end
end

---获得活动数据
function LimitSign_NewControl.GetLimitSignData(_actId)
    local tab = {}
    for i, v in ipairs(LimitSign_NewDataList[_actId]) do
        table.insert(tab,v)
    end
    return tab
end

---已经签到天数
function LimitSign_NewControl.GetSignDay(_actId)
    if limitSign_New[_actId] and limitSign_New[_actId].day then
        return limitSign_New[_actId].day
    else
        return 0
    end
end

function LimitSign_NewControl.GetInitData(_actId)
    return limitSign_New[_actId]
end

function LimitSign_NewControl.SetInitData(_time,_day,_ableDay,_actId)
    if limitSign_New[_actId] then
        limitSign_New[_actId].day = _day
        limitSign_New[_actId].time = _time
        limitSign_New[_actId].ableDay = _ableDay
    else
        limitSign_New[_actId] = {
            time = _time,
            day = _day,
            ableDay = _ableDay
        }
    end
end

---今天是否可以签到
function LimitSign_NewControl.GetIsSignDay(_actId)
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.LIMITSIGN_NEW) then
        return false
    end
    if limitSign_New[_actId] == nil then
        return true
    else
        if limitSign_New[_actId].ableDay == nil or limitSign_New[_actId].ableDay == 0 then
            return false
        end
        if limitSign_New[_actId].ableDay - limitSign_New[_actId].day > 0 then
            return true
        else
            return false
        end
    end
end

---获取可签到次数
function LimitSign_NewControl.GetSignTimes(_actId)
    if limitSign_New[_actId] and limitSign_New[_actId].ableDay then
        return limitSign_New[_actId].ableDay
    else
        return 0
    end
    --local maxTime = #LimitSign_NewDataList
    --local lastSignTime = clone(tonumber(limitSign_New.time))
    --local totalTime = 0
    --for i = 1, maxTime do
    --    if Global.GetCurTime() > LimitSign_NewControl.GetNextSignTime(lastSignTime) then    --当前时间大于下次签到时间
    --        totalTime = totalTime + 1
    --        lastSignTime = lastSignTime + 86400
    --    end
    --    if totalTime >= maxTime - limitSign_New.day then    --可签到总次数大于 7 - 已签到次数
    --        return totalTime
    --    end
    --end
    --return totalTime
end

function LimitSign_NewControl.GetNextSignTime(timestamp)
    local signDate = os.date("!*t", timestamp + tonumber(SteamLocalData.tab[112007][2]) * 3600 - 18000) --签到的日期(时间上减去5小时)
    return os.time({year = signDate.year, month = signDate.month, day = signDate.day, hour = 29 - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) , min = 0, sec = 0})
end

function LimitSign_NewControl.SendLimitSign2InfoReq(callback)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLimitSign2InfoReq',{}))

    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LIMIT_SIGN2_INFO_REQ,bytes,0,nil,function(buffer,tag) end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientLimitSign2InfoNtf',buffer))
        for i, v in ipairs(tab.info) do
            LimitSign_NewControl.SetInitData(v.time,v.day,v.ableDay,v.activityId)
            ---新限时签到
            LimitSign_NewControl.CheckLimitSignRedDot(v.activityId)
        end
        if callback then
            callback()
        end
    end)
end

function LimitSign_NewControl.Clear()
    limitSign_New = {}
end

return LimitSign_NewControl