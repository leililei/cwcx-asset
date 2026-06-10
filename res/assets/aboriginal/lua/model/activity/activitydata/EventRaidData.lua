require("LocalData/StoryactivityLocalData")
require("LocalData/ActivityLocalData")
require("LocalData/TimeLocalData")
---@class EventRaidData 活动数据
EventRaidData = Class("EventRaidData")
-------------构造方法-------------
function EventRaidData:ctor()
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
    self.beginTime_Stamp = 0    ---开始时间时间戳
    self.endTime_Stamp = 0      ---结束时间时间戳
    self.battleEndTime = "0"
    self.music = ""         ---活动主界面bgm
    self.gallary = nil      ---剧情回放跳转
    self.group = nil        ---引导id
    self.npc = {}           ---NPC 1.活动扭蛋 2.活动收藏品 3.活动任务 4.活动技能拓展件
    self.specialItem = {}   ---特殊物品
    self.specialAId = 0     ---特殊物品成就组
    self.bgspine = 0        ---活动主界面spine资源id
    self.actmain = false    ---特殊主界面
    self.LevelType = 0      ---关卡类型(0单线剧情，能配走格子 1分支剧情)
    self.Relevant = nil       ---相关的活动ID
    self.actType = 0        ---活动类型
    self.usmBg = nil         ---视频路径(第一段为跳转视频)
    self.personId = nil     ---个人剧情索引ID
    self.openVoice = nil    ---入场音频
    self.CueName = nil      ---音频包名
end

function EventRaidData:PushData(activityID)
    local config
    for i,v in pairs(StoryactivityLocalData.tab) do
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
        self.shopType = {}
        local tlist = string.split(config[8],',')
        for i,v in pairs(tlist) do
            table.insert(self.shopType, tonumber(v))
        end
        self.taskId = config[9]
        self.dayTaskId = config[10]
        
        self.music = config[11]
        if config[13] ~= "0" then
            self.gallary = string.split(config[13],',')
        end
        self.group = config[12]
        if config[14] ~= "0" then
            local tStr = string.split(config[14],',')
            for i = 1, #tStr do
                local tData = string.split(tStr[i],'_')
                self.npc[tonumber(tData[1])] = tonumber(tData[2])
            end
        end
        self.specialItem = string.split(config[15],",")
        self.specialAId = config[16]
        self.bgspine = config[17]
        self.actmain = config[18]==1
        if config[20] ~= "0" then
            self.usmBg = string.split(config[20],',')
        end
        if config[21] ~= "0" then
            self.personId = tonumber(config[21])
        end
        if config[22] ~= "0" then
            self.openVoice = string.split(config[22],',')
        end
    end
    local activeCfg = ActivityLocalData.tab[activityID]
    if activeCfg then
        local timeCfg = TimeControl.GetTimeTable(activeCfg[5])
        self.actType = activeCfg[2]
        if timeCfg == nil then
            UnityEngine.DebugEx.Log("时间表未找到对应ID:"..activeCfg[5].." 活动ID:"..activityID)
        end
        self.beginTime = Global.TimeToDate(timeCfg.openTime)
        self.endTime = Global.TimeToDate(timeCfg.endTime)
        self.beginTime_Stamp = timeCfg.openTime
        self.endTime_Stamp = timeCfg.endTime
        if activeCfg[15] ~= 0 then
            self.battleEndTime = Global.TimeToDate(TimeControl.GetTimeTable(activeCfg[15]).endTime)           ---战斗结束时间
        end

        if activeCfg[19] ~= "0" then
            self.Relevant = {}
            local tStr = string.split(activeCfg[19],',')
            for i, v in ipairs(tStr) do
                table.insert(self.Relevant,tonumber(v))
            end
        end
    end
end
---播放随机语音
function EventRaidData:PlayRangeVoice()
    if self.openVoice == nil then
        return
    end
    MgrSound.Stop(3)
    local tIdx = math.random(1,#self.openVoice)
    local tAudioName = ActorLinesLocalData.tab[tonumber(self.openVoice[tIdx])]
    --语音
    if tAudioName then
        self.CueName = tAudioName[2]
        MgrSound.AddCue("Audio/role/"..self.CueName..".acb")
        MgrSound.PlayRole(tAudioName[13],nil,nil,false)
    end
end

function EventRaidData:RemoveCue()
    if self.CueName then
        MgrSound.RemoveCue("Audio/role/"..self.CueName..".acb")
        self.CueName = nil
    end
end

return EventRaidData