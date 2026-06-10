---@class Event4Data 共鸣装备数据
Event4Data = Class("Event4Data")
-------------构造方法-------------
function Event4Data:ctor(id)
    self.equipID = id       ---装备id
    self.level = 0          ---装备等级
    self.lockState = false  ---是否已解锁
    local config = RoleequipmentLocalData.tab[id]
    if not config[8] then
        print(id)
    end
    self.attribute = config[8]                              ---装备配置属性
    self.maxLevel = tonumber(config[11])                    ---装备最大等级
    self.position = config[7]                               ---装备部位
    self.name = config[2]                                   ---装备名称
    self.txt = config[3]                                    ---装备文本
    self.quality = config[6]                                ---装备品质
    self.icon = string.format("Equip/%s",config[4])  ---装备图标
    self.iconFrame = "Equip/Rank/VoidGearRank_0" ---装备边框图标
    self.iconBFrame = string.format("Equip/Rank/VoidGearRankBig_%s",config[6]) ---装备边框大
    self.iconLFrame = string.format("Equip/Rank/VoidGearRankLarge_%s",config[6]) ---装备边框巨大
    self.attrs = self:LoadAttrs()                                         ---共鸣装备实际属性
    self.keepSake = config[10]                              ---重复材料
end

function Event4Data:PushData(equip)
    self.level = equip.equipLevel
    self.lockState = true
    self.iconFrame = string.format("Equip/Rank/VoidGearRank_%s",self.quality)  ---装备边框图标
    ---更新属性
    self.attrs = self:LoadAttrs()
end

return Event4Data