---@class Event4PreheatData 共鸣装备数据
Event4PreheatData = Class("Event4PreheatData")
-------------构造方法-------------
function Event4PreheatData:ctor(data)
    ---预热小游戏ID
    self.ID = data[1]
    ---组ID
    self.GroupID = data[2]
    ---特殊奖励
    self.SpecialAward = Event4PreheatData:AddGoods(data[3])
    ---奖励
    self.Award = Event4PreheatData:AddGoods(data[4])
    ---收藏奖励
    self.ShowAward = Event4PreheatData:AddGoods(data[5])
    ---活动ID
    self.ActivityID = data[6]
    self.beginTime = "0"
    
    self.endTime = "0"
    self.battleEndTime = "0"
    local tCfg = ActivityLocalData.tab[self.ActivityID]
    if tCfg then
        if TimeControl.GetTimeTable(tCfg[5]) then
            self.beginTime = TimeControl.GetTimeTable(tCfg[5]).openTime
            self.endTime = TimeControl.GetTimeTable(tCfg[5]).endTime
            if tCfg[15] ~= 0 then
                self.battleEndTime = TimeControl.GetTimeTable(tCfg[15]).endTime               ---战斗结束时间
            end
        end
    end
    ---小游戏对话ID列表
    self.TalkList = {}
    ---商城ID
    self.ShopID = data[7]
    ---背景图
    self.ImgBack = data[8]
    ---文字
    self.dialogue = nil
    ---对话
    self.talkData = nil
    self.talkRole = nil
    local str = string.split(data[9],'_')
    if str[1] == "talk" then
        self.talkData = ActorLinesLocalData.tab[tonumber(str[2])]
        self.talkRole = tonumber(str[3])
    else
        self.dialogue = data[9]
    end
end

function Event4PreheatData:AddGoods(_strItem)
    local group = string.split(_strItem,'_')
    local goods = {
        goodsType = tonumber(group[1]),
        goodsID = tonumber(group[2]),
        goodsNum = tonumber(group[3])
    }
    
    return goods
end

return Event4PreheatData