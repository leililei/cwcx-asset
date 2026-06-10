---@class ChapterTaskData 活动数据
ChapterTaskData = Class("ChapterTaskData")
-------------构造方法-------------
function ChapterTaskData:ctor()
    self.id = 0                     ---ID
    self.activityId = 0             ---活动ID
    self.chapterName = ""           ---活动章节名
    self.taskId = 0                 ---成就任务组
    self.achievementId = 0          ---成就组
    self.chapterReward = {}         ---活动章节奖励
    self.chapterBg = ""             ---活动章节背景图
end

function ChapterTaskData:PushData(data)
    self.id = data.id
    self.activityId = data.activityid
    self.chapterName = data.name
    self.achievementId = data.taskid
    self.taskId = data.activeid
    self.chapterReward = string.split(data.award,',')
    self.chapterBg = data.resource
end

return ChapterTaskData