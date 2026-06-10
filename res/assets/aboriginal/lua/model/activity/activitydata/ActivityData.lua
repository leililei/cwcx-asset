---@class ActivityData 物品数据
ActivityData = Class("ActivityData")
-------------构造方法-------------
function ActivityData:ctor(id)
    local config = ActivityLocalData.tab[id]
    if config == nil then
        print("ActivityLocalData无法找到ID："..id)
        return
    end
    self.activityId = config[1]                         ---ID
    self.activityType = config[2]                       ---活动类型
    self.openLevel = config[3]                          ---开启等级
    self.front = config[4]                              ---前置关卡
    self.unlockTime = config[5]                         ---活动结束时间
    self.battleUnlockEndTime = config[15]               ---活动战斗结束时间
    self.version = config[6]                            ---版本号
    self.sort = config[7]                               ---排序
    self.isShow = config[8]                             ---是否在活动列表中显示(1.显示 0.不显示)
    self.beginTime = "0"                                ---活动开始时间
    self.endTime = "0"                                  ---活动结束时间
    self.battleEndTime = "0"
    self.dayTime = 0                                    ---活动开启天数(特殊时间类型才会判断天数，一般为0)
    self.beginTime_Stamp = 0                            ---活动开始时间戳
    self.endTime_Stamp = 0                              ---活动结束时间戳
    self.battleEnd_Stamp = 0                            ---战斗活动结束时间戳
    self.battleTime = config[15]                        ---战斗时间
    self.timeType = 0                                   ---时间类型
    --刷新时间
    self:RefreshTime()
    
    self.name = config[9]
    self.systemopen = config[10]                        ---系统解锁条件
    self.gotoID = config[11]                            ---跳转
    self.MainIcon = config[16]                          ---主界面活动图标
    self.MainLink = config[17]                          ---活动图标跳转界面
    self.TaskList = string.split(config[18], ',')                         ---活动任务ID组
    self.shopType = config[20]
    self.LinkIcon = config[21]                          ---新活动跳转图

    self.userID = 0                                     ---用户id
    self.score = 0                                      ---活动累计积分
    self.uTime = 0                                      ---更新时间
    self.reward = ""                                    ---活动奖励(k是奖励id，v是奖励类型)
    self.recharge = 0                                   ---累计充值金额
    self.rewardCount = 0                                ---活动奖励领取次数
    self.rewardTime = 0                                 ---活动奖励领取时间
    self.ExpansionLevel = 0                             ---拓展件等级
    self.poolID = 0                                     ---蛋池id
    self.goods = nil                                    ---蛋池奖品
    self.roleBonus = nil                                ---关卡角色额外掉落奖励
end

function ActivityData:PushData(data)
    self.userID = data.userID
    self.score = data.score
    self.uTime = data.uTime
    self.reward = data.reward
    self.recharge = data.recharge
    self.rewardCount = data.rewardCount
    self.rewardTime = data.rewardTime
    self.ExpansionLevel = data.ExpansionLevel
    if data.poolID then
        self.poolID = data.poolID
    end
    if data.goods then
        self.goods = data.goods
    end
    self.roleBonus = data.roleBonus
end

function ActivityData:PushRewardData(reward)
    self.reward = reward
end

---联合讨伐相关数据
function ActivityData:PushBossData(data)
    self.bossID = data.bossID
    self.count = data.count
    self.hp = data.hp
    for i,v in pairs(JointcrusadeLocalData.tab) do
        if v[2] == data.bossID then
            self.maxHp = v[9]
        end
    end
    self.isGetReward = data.isGetReward
    self.nowRank = data.nowRank
    self.rewardRank = data.rewardRank
    self.score = data.score
    self.subKey = data.subKey
    if data.rankInfo ~= nil then
        self.rankInfos = data.rankInfo
        table.sort(self.rankInfos,function(a,b)
            if a.rank < b.rank then
                return true
            else
                return false
            end
        end)
    else
        self.rankInfos = {}
    end

end

function ActivityData:ClearRanks()
    self.rankInfos = {}
end

function ActivityData:CheckUnlock()
    return Global.isMiddleTime(self.beginTime, self.endTime)
end
---刷新时间
function ActivityData:RefreshTime()
    local timeC = TimeControl.GetTimeTable(self.unlockTime)
    if timeC then
        self.timeType = timeC.timeType     ---时间类型

        if self.timeType ~= 999 then
            self.beginTime = Global.TimeToDate(timeC.openTime)
            self.endTime = Global.TimeToDate(timeC.endTime)
            self.beginTime_Stamp = timeC.openTime
            self.endTime_Stamp = timeC.endTime
            if self.battleTime ~= 0 and TimeControl.GetTimeTable(self.battleTime) then
                self.battleEndTime = Global.TimeToDate(TimeControl.GetTimeTable(self.battleTime).endTime)               ---战斗结束时间
                self.battleEnd_Stamp = TimeControl.GetTimeTable(self.battleTime).endTime
            end
        else
            self.dayTime = -1
        end
    end
end

return ActivityData