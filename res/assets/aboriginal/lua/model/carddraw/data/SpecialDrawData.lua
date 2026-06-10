---特殊卡池数据
---@class SpecialDrawData
SpecialDrawData = Class('SpecialDrawData')

function SpecialDrawData:ctor(id)
    local config = RarerolerecruitLocalData.tab[id]
    self.id = config.id
    self.name = config.name
    self.minCount = config.guaranteed_big
    self.normalDrawPrice = config.ordinary_1;
    self.tenNormalDrawPrice = config.ordinary_10;
    self.singleDrawPrice = config.elite_1;
    self.fiveDrawPrice = config.elite_5;
    self.limit = config.limit
    self.timeType = config.type
    self.timeId = config.time_open
    self.timeOpen = "0"
    self.timeEnd = "0"
    self.timeOpen_Stamp = 0
    self.timeEnd_Stamp = 0
    --刷新时间
    self:RefreshTime()
    
    self.timeFree = string.split(config.time_free,";")
    self.desc = config.desc
    self.cardBuyType = config.cardbuytype
    self.showRole = config.showrole
    self.sort = config.sort
    self.cardType = config.cardtype
    self.Icon = config.icon
    self.roleatlas = config.roleatlas
    self.show = config.show
    self.tag = config.tag == "0" and "0" or string.split(config.tag, ",")
    self.cardvfx = config.cardvfx
    self.count = 0
    self.lastFreeTime = nil     ---上一次免费抽取的时间
    self.normalBtn = config.ordinaryicon;
    self.eliteBtn = config.eliteicon;
end

function SpecialDrawData:PushData(data)
    if data == nil or next(data) == nil then
        return
    end
    if data.ID == self.id then
        self.lastFreeTime = data.freeTime
        self.count = data.count
    end
end

---获取当前免费抽取状态
function SpecialDrawData:GetFreeState()
    local timeC = TimeControl.GetTimeTable(tonumber(self.timeFree[2]))
    local _timeOpen = "0"
    local _timeEnd = "0"
    if timeC then
        _timeOpen = Global.TimeToDate(timeC.openTime)
        _timeEnd = Global.TimeToDate(timeC.endTime)
    end

    local _inMiddle = Global.isMiddleTime(_timeOpen, _timeEnd)
    local isFree = false   --是否可以免费抽

    if _inMiddle then
        if self.lastFreeTime == nil then
            isFree = true
        else
            --当前时间是否和上次抽取同一天
            if Global.CheckIsSameDay(self.lastFreeTime,Global.GetCurTime()) then
                isFree = false
            else
                isFree = true
            end
        end
    else
        isFree = false
    end

    local arr = {
        tonumber(self.timeFree[1]),
        isFree,
    }
    return arr
end

---是否显示
function SpecialDrawData:WhetherIsOpen()
    if self.show == 0 then
        if self.timeType == 0 then
            return true
        else
            local str = string.split(self.timeOpen, "-")
            local endStr = string.split(self.timeEnd, "-")
            local startTime = os.time({
                year = tonumber(str[1]),
                month = tonumber(str[2]),
                day = tonumber(str[3]),
                hour = tonumber(str[4]),
                min = tonumber(str[5]),
                sec = tonumber(str[6])
            })
            local endTime = os.time({
                year = tonumber(endStr[1]),
                month = tonumber(endStr[2]),
                day = tonumber(endStr[3]),
                hour = tonumber(endStr[4]),
                min = tonumber(endStr[5]),
                sec = tonumber(endStr[6])
            })
            local inMiddle = Global.isMiddleTime(startTime, endTime)
            return inMiddle
        end
    else
        return false
    end
end

---获取保底剩余次数
function SpecialDrawData:GetRemainCount()
    return self.minCount - self.count
end

---刷新时间
function SpecialDrawData:RefreshTime()
    local timeC = TimeControl.GetTimeTable(self.timeId)
    if timeC then
        self.timeOpen = Global.TimeToDate(timeC.openTime)
        self.timeEnd = Global.TimeToDate(timeC.endTime)
        self.timeOpen_Stamp = timeC.openTime
        self.timeEnd_Stamp = timeC.endTime
    end
end

return SpecialDrawData