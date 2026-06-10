---@class SynthesisData
SynthesisData = Class('SynthesisData')
require("LocalData/RoleequipmentLocalData")
---@param id number 构造方法
function SynthesisData:ctor(id,type)
    self.id = id                                ---ID
    self.synthesisItem = nil                    ---合成目标
    self.synthesisCost = nil                    ---合成花费
    self.type = nil                             ---类型
    self.quality = 0                            ---品质
    self.dataType = 0                           --区分数据来源是那张表
    self.display = 1
    self.roleid = 0
    self.opentime = nil                   ---类型
    self.rank = 0                               ---等阶

    local dataType = 1
    local config = nil
    -- if EnergysynthesisLocalData.tab[id] then
    --     dataType = 1
    --     config = EnergysynthesisLocalData.tab[id]
    -- elseif SkillitemsynthesisLocalData.tab[id] then
    --     dataType = 2
    --     config = SkillitemsynthesisLocalData.tab[id]
    -- else
    --     dataType = 3
    --     config = RoleeqsynthesisLocalData.tab[id]
    -- end

    if type == 1 then
        dataType = 1
        config = EnergysynthesisLocalData.tab[id]
    elseif type == 2 then
        dataType = 2
        config = SkillitemsynthesisLocalData.tab[id]
    else
        dataType = 3
        config = EnergysynthesisLocalData.tab[id]
    end
    if config == nil then
        return
    end
    --区分数据来源是那张表
    self.dataType = dataType
    if dataType == 1 then
        self.synthesisItem = config[2]
        self.synthesisCost = config[3]
        self.type = config[4]
        self.display = 1
        self.opentime = config[7]
    elseif dataType == 2 then
        self.synthesisItem = config[3]
        self.synthesisCost = config[4]..","..config[5]
        self.type = config[6]
        self.display = config[7]
        self.roleid = config[2]
        self.opentime = config[8]
        self.rank = config[9]
    else
        self.synthesisItem = config[2]
        self.synthesisCost = config[3]
        self.type = config[4]
        self.display = config[5]
        self.roleid = config[6]
        self.opentime = config[7]
    end
end

---获取合成目标和数量
function SynthesisData:GetSynthesisItem()
    local str = string.split(self.synthesisItem,"_")
    local item = nil
    if tonumber(str[1]) == 5 then
        local data = RoleequipmentLocalData.tab[tonumber(str[2])]
        item = ItemControl.GetItemByID(tonumber(str[2]))
        item.id = data[1]
        item.name = data[2]
        item.icon = "Equip/"..data[4]
    else
        item = ItemControl.GetItemByID(tonumber(str[2]))
    end
    item.needCount = tonumber(str[3])
    return item
end
---获得合成花费物品和数量
function SynthesisData:GetSynthesisCost()
    local str = string.split(self.synthesisCost,",") --123
    local array = {}
    for k,v in pairs(str) do
        if v == "," or v == 0 or v == "0" then
            break
        end
        local itemStr = string.split(v,"_")
        local item =  ItemControl.GetItemByID(tonumber(itemStr[2]))
        item.needCount = tonumber(itemStr[3])
        table.insert(array,item)
    end
    return array
end

return SynthesisData