---@class TimeData 角色数据
TimeData = Class("TimeData")

function TimeData:ctor(TimeInfo)
    self.ID = TimeInfo.ID
    self.dayEndTime = TimeInfo.dayEndTime
    self.dayOpenTime = TimeInfo.dayOpenTime
    self.endTime = TimeInfo.endTime
    self.openTime = TimeInfo.openTime
    self.openWeek = TimeInfo.openWeek
    self.timeType = TimeInfo.timeType
end

return TimeData