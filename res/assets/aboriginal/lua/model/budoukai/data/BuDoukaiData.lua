---@class BuDoukaiData 活动数据
BuDoukaiData = Class("BuDoukaiData")
-------------构造方法-------------
function BuDoukaiData:ctor(cfg)
    ---ID
    self.id = cfg.id
    ---活动ID
    self.activityID = cfg.activityid
    ---场景配置
    self.scenes = string.split(cfg.scenes,',')
    ---成就任务组
    self.activeid = cfg.activeid
    ---活动日常任务组
    self.dayTaskId = cfg.daytaskid
    ---玩家上场人数
    self.playnumber = cfg.playnumber
    ---引导组别
    self.group = cfg.group
end


return BuDoukaiData