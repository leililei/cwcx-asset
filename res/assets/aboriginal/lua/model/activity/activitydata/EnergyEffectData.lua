---@class EnergyEffectData 活动拓展技能-能源储备效果数据
EnergyEffectData = Class("EnergyEffectData")
-------------构造方法-------------
function EnergyEffectData:ctor(data)
    self.id = data.id                                               ---章id
    self.group = data.group                                         ---能源储备效果组
    local str = string.split(data.range,',')
    self.range = {
        min=tonumber(str[1]),max=tonumber(str[2])
    }                                                               ---阶段区间
    self.rangeName = data.name                                      ---阶段名称
    str = string.split(data.effect,'_')
    self.rangeEffect = tonumber(str[1])                             ---阶段效果
    self.skillTip = data.txt                                        ---技能描述
    self.icon = data.icon                                           ---储备图标
    self.background = data.background                               ---储备底图
end

return EnergyEffectData