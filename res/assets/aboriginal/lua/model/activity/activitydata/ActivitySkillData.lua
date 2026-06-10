---@class ActivitySkillData 活动技能数据
ActivitySkillData = Class("ActivitySkillData")
-------------构造方法-------------
function ActivitySkillData:ctor(data)
    self.id = data.id                               ---id
    self.level = data.level                         ---活动技能等级
    self.activityid = data.activityid               ---活动ID
    self.name = data.name                           ---技能名
    self.energyVelue = data.energy                  ---能源值
    self.skillEffect = data.effect                  ---升级效果
    self.skillTab = data.effecttxt                  ---技能标签
    self.skillTip = data.txt                        ---技能描述
    self.frontlevel = data.frontlevel               ---前置升级等级
    self.consume = {}                     ---升级消耗
    local tStr = string.split(data.consume,',')
    for i = 1, #tStr do
        local goodsList = string.split(tStr[i],'_')
        self.consume[i] = {
            goodsType = tonumber(goodsList[1]),
            goodsID = tonumber(goodsList[2]),
            costNum = tonumber(goodsList[3])
        }
    end
end

return ActivitySkillData