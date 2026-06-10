require("LocalData/StoryactivityLocalData")
require("LocalData/ActivityLocalData")
require("LocalData/AbyssLocalData")
require("LocalData/TimeLocalData")
---@class YueTaData 活动数据
YueTaData = Class("YueTaData")
-------------构造方法-------------
function YueTaData:ctor()
    self.id = 0             ---ID
    self.activityID = 0     ---活动ID
    self.name = ""          ---活动名
    self.resource = ""      ---封面
    self.icon = ""          ---活动图标
    self.plot = ""          ---片头剧情
    self.chapterId = {}     ---卷ID
    self.shopType = 0       ---商店类型
    self.taskId = 0         ---活动成就任务组
    self.dayTaskId = 0      ---活动日常任务组
    self.beginTime = ""     ---开始时间
    self.endTime = ""       ---结束时间
    self.battleEndTime = "0"
    self.music = ""         ---活动主界面bgm
    self.gallary = nil      ---剧情回放跳转
    self.group = nil        ---引导id
end

function YueTaData:PushYueTaData(activityID)
    local config
    for i,v in pairs(AbyssLocalData.tab) do
        if v[2] == activityID then
            config = v
        end
    end
    if config then
        self.id = config[1]
        self.activityID = config[2]
        self.name = config[3]
        self.resource = config[4]
        self.icon = config[5]
        self.plot = config[6]
        local ids = string.split(config[7],",")
        for i,v in pairs(ids) do
            table.insert(self.chapterId, tonumber(v))
        end

        self.music = config[8]
        self.group = config[9]
        self.chapterGroup = config[10]
        ---开始结束时间
        local activeCfg = ActivityLocalData.tab[activityID]
        if activeCfg then
            self.version = activeCfg[6] ---版本
            local time = TimeControl.GetTimeTable(activeCfg[5])
            if time then
                self.beginTime = Global.TimeToDate(time.openTime)    --TimeLocalData.tab[time][6]
                self.endTime = Global.TimeToDate(time.endTime)      --TimeLocalData.tab[time][7]
            end
            
            if activeCfg[15] ~= 0 and TimeControl.GetTimeTable(activeCfg[15]) then
                self.battleEndTime = Global.TimeToDate(TimeControl.GetTimeTable(activeCfg[15]).endTime)     --TimeLocalData.tab[activeCfg[15]][7]               ---战斗结束时间
            end
        end
    end
end

return YueTaData