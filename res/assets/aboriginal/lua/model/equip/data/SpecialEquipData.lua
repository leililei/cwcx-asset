---@class SpecialEquipData 共鸣装备数据
---@field attrs CoreAttrData[] 共鸣装备属性
SpecialEquipData = Class("SpecialEquipData")
-------------构造方法-------------
function SpecialEquipData:ctor(id)
    ---专属技能数据
    local specialConfig = EquipmentoneLocalData.tab[id]
    if not specialConfig then
        print("dont have special config : " .. id)
        return
    end
    self.owner = specialConfig[1]           ---使用者ID
    self.specialName = specialConfig[2]     ---进阶装备名
    self.specialTxt = specialConfig[3]      ---进阶装备文案
    self.specialIcon = specialConfig[4]     ---进阶装备图标
    self.specialRank = specialConfig[5]     ---装备品阶
    local levelStr = string.split(specialConfig[6],",")
    self.specialLimitLevel = {}             ---进阶等级限制
    for i,v in pairs(levelStr) do
        local s = string.split(v,"_")
        table.insert(self.specialLimitLevel,tonumber(s[1]),tonumber(s[2]))
    end
    self.specialMaxStage = #self.specialLimitLevel  ---进阶最大等级
    self.limitNum = specialConfig[7]        ---进阶总阶段数

    self.mixMat = specialConfig[8]          ---合成消耗
    self.advanceMat = specialConfig[9]      ---进阶消耗
    self.levelMat = specialConfig[10]        ---进阶升级消耗

    local str = string.split(specialConfig[11],";")   ---进阶装备基础属性
    self.baseAttribute = {}
    for i,v in ipairs(str) do
        local idx = tonumber(string.split(v,"#")[1])
        local singleAttr = string.split(string.split(v,"#")[2],",")
        self.baseAttribute[tonumber(idx)] = {}
        for j = 1,#singleAttr do
            table.insert(self.baseAttribute[tonumber(idx)],singleAttr[j])
        end
    end

    local str1 = string.split(specialConfig[12],";")   ---进阶装备成长属性
    self.devAttribute = {}
    for i,v in ipairs(str1) do
        local idx = tonumber(string.split(v,"#")[1])
        local singleAttr = string.split(string.split(v,"#")[2],",")
        self.devAttribute[tonumber(idx)] = {}
        for j = 1,#singleAttr do
            table.insert(self.devAttribute[tonumber(idx)],singleAttr[j])
        end
    end
    ---进阶突破技能
    self.equipSkill = { specialConfig[13],
                        specialConfig[14],
                        specialConfig[15],
                        specialConfig[16],
                        specialConfig[17],
    }

    self.evolutionLevel = 0                 ---等级
    self.evolutionPhase = 0                 ---阶段
    self.maxLevel = 0                       ---阶段最高等级
    self.lockState = false                  ---是否已经解锁
end

function SpecialEquipData:PushEvolutionLevel(level)
    if level then
        self.evolutionLevel = level
    end
end

function SpecialEquipData:PushEvolutionPhase(phase)
    if phase then
        self.evolutionPhase = phase
    end
    self.maxLevel = self.specialLimitLevel[phase]
    if self.maxLevel == nil then
        self.maxLevel = self.specialLimitLevel[#self.specialLimitLevel]
    end
end
---返回合成材料
---@return ItemData[]
function SpecialEquipData:GetMixMaterial()
    local materials = string.split(self.mixMat,",")
    local currentMaterialList = {}
    for _,v in ipairs(materials) do
        local mats = string.split(v,"_")
        local good = {
            goodsType = tonumber(mats[1]),
            goodsID = tonumber(mats[2]),
            goodsNum = tonumber(mats[3])
        }
        local item = ItemData.New()
        item:PushData(good, ItemControl.PushEnum.none)
        table.insert(currentMaterialList,item)
    end
    return currentMaterialList
end
---返回突破材料
---@return ItemData[]
function SpecialEquipData:GetAdvanceMaterial()
    local materials = string.split(self.advanceMat,";")
    local currentMaterialList = {}
    for _,v in ipairs(materials) do
        local idx = tonumber(string.split(v,"#")[1])
        local mats = string.split(string.split(v,"#")[2],",")
        if tonumber(idx) == self.evolutionPhase + 1 then
            for i = 1, #mats do
                local str = string.split(mats[i],"_")
                local good = {
                    goodsType = tonumber(str[1]),
                    goodsID = tonumber(str[2]),
                    goodsNum = tonumber(str[3])
                }
                local item = ItemData.New()
                item:PushData(good, ItemControl.PushEnum.none)
                table.insert(currentMaterialList,item)
            end
        end
    end
    return currentMaterialList
end
---返回升级材料
---@return ItemData[]
function SpecialEquipData:GetLevelUpMaterial()
    local materials = string.split(self.levelMat,";")
    local currentMaterialList = {}
    for _,v in ipairs(materials) do
        local idx = tonumber(string.split(v,"#")[1])
        local mats = string.split(string.split(v,"#")[2],",")
        if tonumber(idx) == self.evolutionPhase then
            for i = 1, #mats do
                local str = string.split(mats[i],"_")
                local good = {
                    goodsType = tonumber(str[1]),
                    goodsID = tonumber(str[2]),
                    goodsNum = tonumber(str[3])
                }
                local item = ItemData.New()
                item:PushData(good, ItemControl.PushEnum.none)
                table.insert(currentMaterialList,item)
            end
        end
    end
    return currentMaterialList
end
---进阶获得新技能
function SpecialEquipData:GetAdvanceSkill()
    local skills = {}
    local tEvolutionPhase = self.evolutionPhase >= self.specialMaxStage and self.specialMaxStage or self.evolutionPhase + 1
    for i,v in ipairs(self.equipSkill) do
        if v ~= "0" then
            local str = string.split(v,"#")
            for j,value in ipairs(str) do
                if tonumber(string.sub(value,1,1)) == tEvolutionPhase then
                    local newSkillStr = string.sub(value,3,string.len(value))
                    skills[i] = newSkillStr      ---i:英雄的第几个技能     v:技能字符串
                end
            end
        end
    end
    return skills
end
---进阶获得所有新技能
function SpecialEquipData:GetAllAdvanceSkill()
    local skills = {}
    
    for i,v in ipairs(self.equipSkill) do
        if v ~= "0" then
            if skills[i] == nil then
                skills[i] = {}
            end
            local str = string.split(v,"#")
            for j,value in ipairs(str) do
                local newSkillStr = string.sub(value,3,string.len(value))
                table.insert(skills[i], newSkillStr)    ---i:英雄的第几个技能     v:技能字符串
            end
        end
    end
    return skills
end
---获得当前阶段技能
function SpecialEquipData:GetSpecialSkill()
    local skills = {}
    for i,v in ipairs(self.equipSkill) do
        if v ~= "0" then
            local str = string.split(v,"#")
            for j,value in ipairs(str) do
                if tonumber(string.sub(value,1,1)) == self.evolutionPhase then
                    local newSkillStr = string.sub(value,3,string.len(value))
                    skills[i] = newSkillStr      ---i:英雄的第几个技能     v:技能字符串
                end
            end
        end
    end
    return skills
end
---获取更改的技能的位置
function SpecialEquipData:GetAdvanceSkillNum()
    for i,v in ipairs(self.equipSkill) do
        if v ~= "0" then
            --local str = string.split(v,"#")
            --for j,value in ipairs(str) do
            --    return tonumber(string.sub(value,1,1))
            --end
            return i
        end
    end
    return 0
end
---当前阶段升级角色获得的属性
---@return CoreAttrData[]
function SpecialEquipData:GetLevelUpRoleAttr()
    local deltaAttrs = {}
    for i,v in ipairs(self.devAttribute) do
        if i == self.evolutionPhase then
            for j,value in pairs(v) do
                local attr_str = string.split(value,"_")
                ---@type CoreAttrData
                local attrData = CoreAttrData.New()
                local attrId = tonumber(attr_str[1])    ---属性配置表id
                local attrEnum = (attr_str[1] == "0" or attr_str[1] == "2") and 0 or 1  ---属性类型 0值 1百分比
                local attr = tonumber(attr_str[2])  ---属性具体数值
                if attrId ~= SpecialEquipData.AttrType.atk and attrId ~= SpecialEquipData.AttrType.hp then
                    attr = attr * 0.01
                end
                attrData:PushData(j,attrId,attrEnum,attr)
                deltaAttrs[attrData.attrUID] = attrData
            end
            break
        end
    end
    return deltaAttrs
end
---当阶段装备的基础属性
---@return CoreAttrData[]
function SpecialEquipData:GetBaseAttr()
    local baseAttrs = {}
    for i,v in pairs(self.baseAttribute) do
        if i == self.evolutionPhase then
            for j,value in pairs(v) do
                local attr_str = string.split(value,"_")
                ---@type CoreAttrData
                local attrData = CoreAttrData.New()
                local attrId = tonumber(attr_str[1])    ---属性配置表id
                local attrEnum = (attr_str[1] == "0" or attr_str[1] == "2") and 0 or 1  ---属性类型 0值 1百分比
                local attr = tonumber(attr_str[2])  ---属性具体数值
                if attrId ~= SpecialEquipData.AttrType.atk and attrId ~= SpecialEquipData.AttrType.hp then
                    attr = attr * 0.01
                end
                attrData:PushData(j,attrId,attrEnum,attr)
                baseAttrs[attrData.attrUID] = attrData
            end
            break
        end
    end
    return baseAttrs
end
---装备当前增加的全部属性
---@return CoreAttrData[]
function SpecialEquipData:GetCurrentAttr()
    local attrs = self:GetBaseAttr()
    for i,v in ipairs(self.devAttribute) do
        if i == self.evolutionPhase then
            for j,value in pairs(v) do
                local attr_str = string.split(value,"_")
                ---@type CoreAttrData
                local attrData = CoreAttrData.New()
                local attrId = tonumber(attr_str[1])    ---属性配置表id
                local attrEnum = (attr_str[1] == "0" or attr_str[1] == "2") and 0 or 1  ---属性类型 0值 1百分比
                local attr = tonumber(attr_str[2])  ---属性具体数值
                if attrId ~= SpecialEquipData.AttrType.atk and attrId ~= SpecialEquipData.AttrType.hp then
                    attr = attr * 0.01
                end
                attrData:PushData(j,attrId,attrEnum,attr)
                attrs[attrData.attrUID]:AddData(attrData.attrID,attrData.attribute * (self.evolutionLevel-1))
            end
            break
        end
    end
    return attrs
end
---获取某等级某阶段属性
function SpecialEquipData:GetDevAttr_SpecificPhase(phase)
    local deltaAttrs = {}
    for i,v in ipairs(self.devAttribute) do
        if i == phase then
            for j,value in pairs(v) do
                local attr_str = string.split(value,"_")
                ---@type CoreAttrData
                local attrData = CoreAttrData.New()
                local attrId = tonumber(attr_str[1])    ---属性配置表id
                local attrEnum = (attr_str[1] == "0" or attr_str[1] == "2") and 0 or 1  ---属性类型 0值 1百分比
                local attr = tonumber(attr_str[2])  ---属性具体数值
                if attrId ~= SpecialEquipData.AttrType.atk and attrId ~= SpecialEquipData.AttrType.hp then
                    attr = attr * 0.01
                end
                attrData:PushData(j,attrId,attrEnum,attr)
                deltaAttrs[attrData.attrUID] = attrData
            end
            break
        end
    end
    return deltaAttrs
end
---获取某等级某阶段基础属性
------@return CoreAttrData[]
function SpecialEquipData:GetBaseAttr_SpecificPhase(phase)
    local baseAttrs = {}
    local nextPhase
    if phase > #self.specialLimitLevel then
        nextPhase = #self.specialLimitLevel
    else
        nextPhase = phase
    end
    for i,v in pairs(self.baseAttribute) do
        if i == nextPhase then
            for j,value in pairs(v) do
                local attr_str = string.split(value,"_")
                ---@type CoreAttrData
                local attrData = CoreAttrData.New()
                local attrId = tonumber(attr_str[1])    ---属性配置表id
                local attrEnum = (attr_str[1] == "0" or attr_str[1] == "2") and 0 or 1  ---属性类型 0值 1百分比
                local attr = tonumber(attr_str[2])  ---属性具体数值
                if attrId ~= SpecialEquipData.AttrType.atk and attrId ~= SpecialEquipData.AttrType.hp then
                    attr = attr * 0.01
                end
                attrData:PushData(j,attrId,attrEnum,attr)
                baseAttrs[attrData.attrUID] = attrData
            end
            break
        end
    end
    return baseAttrs
end
---@return CoreAttrData[]
function SpecialEquipData:GetAttr_SpecificPhaseLevel(phase,level)
    local attrs = self:GetBaseAttr_SpecificPhase(phase)
    local nextPhase
    if phase > #self.specialLimitLevel then
        nextPhase = #self.specialLimitLevel
    else
        nextPhase = phase
    end
    for i,v in ipairs(self.devAttribute) do
        if i == nextPhase then
            for j,value in pairs(v) do
                local attr_str = string.split(value,"_")
                ---@type CoreAttrData
                local attrData = CoreAttrData.New()
                local attrId = tonumber(attr_str[1])    ---属性配置表id
                local attrEnum = (attr_str[1] == "0" or attr_str[1] == "2") and 0 or 1  ---属性类型 0值 1百分比
                local attr = tonumber(attr_str[2])  ---属性具体数值
                if attrId ~= SpecialEquipData.AttrType.atk and attrId ~= SpecialEquipData.AttrType.hp then
                    attr = attr * 0.01
                end
                attrData:PushData(j,attrId,attrEnum,attr)
                attrs[attrData.attrUID]:AddData(attrData.attrID,attrData.attribute * (level-1))
            end
            break
        end
    end
    return attrs
end
---装备当前的等级上限
function SpecialEquipData:GetMaxLevel()
    for i,v in pairs(self.specialLimitLevel) do
        if i == self.evolutionPhase then
            return v
        end
    end
end
---装备下一阶段的等级上限
function SpecialEquipData:GetNextPhaseMaxLevel()
    local nextPhase
    if self.evolutionPhase + 1 > #self.specialLimitLevel then
        nextPhase = self.evolutionPhase
    else
        nextPhase = self.evolutionPhase + 1
    end
    for i,v in pairs(self.specialLimitLevel) do
        if i == nextPhase then
            return v
        end
    end
end
---装备等级上限
function SpecialEquipData:MaxLevel()
    local maxLevel = 0
    for i,v in pairs(self.specialLimitLevel) do
        if v > maxLevel then
            maxLevel = v
        end
    end
    return maxLevel
end

function SpecialEquipData:SetLockState(t)
    self.lockState = t
    HeroControl.SetSpecialEquipUnlock(self.owner,t)
end
function SpecialEquipData:CheckLockState()
    return self.lockState
end

SpecialEquipData.AttrType = {
    atk = 0,
    percentAtk = 1,
    hp = 2,
    percentHp = 3,
    def = 4,
    cri = 5,
    criDmg = 6,
    agi = 7,
    support = 8
}

return SpecialEquipData