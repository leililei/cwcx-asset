require("Model/Equip/Data/EquipData")
require("Model/Equip/Data/SpecialEquipData")
require("LocalData/RoleequipmentLocalData")
require("LocalData/EquipmentoneLocalData")
---物品管理器
EquipControl = {}

---@type EquipData[] 共鸣装备数据
local EquipDataList = {}

---@type SpecialEquipData[] 共鸣装备数据
local SpecialEquipDataList = {}

---进阶装备系统是否打开
local SpecialEquipOn = true
-------------提供接口-------------
---创建所有共鸣装备
function EquipControl.CreateAllEquip()
    for i, v in pairs(RoleequipmentLocalData.tab) do
        EquipDataList[i] = EquipData.New(i)
    end
end
---创建所有进阶共鸣装备
function EquipControl.CreateAllSpecialEquip(SEquips)
    for i, v in pairs(EquipmentoneLocalData.tab) do
        SpecialEquipDataList[i] = SpecialEquipData.New(i)
    end
    if SEquips ~= nil then
        for i,v in pairs(SEquips) do
            if SpecialEquipDataList[v.ID] ~= nil then
                SpecialEquipDataList[v.ID]:SetLockState(true)
                SpecialEquipDataList[v.ID]:PushEvolutionLevel(v.Level)
                SpecialEquipDataList[v.ID]:PushEvolutionPhase(v.Grade)
            end
        end
    end
end
---@return SpecialEquipData 获取单个共鸣装备
function EquipControl.GetSingleSpecialEquip(id)
    if id == nil then
        return nil
    end
    return SpecialEquipDataList[id]
end
---服务器决定是否打开进阶装备
function EquipControl.SetSpecialEquip()
    SpecialEquipOn = (SteamLocalData.tab[105011][2] == "1")
end

function EquipControl.SpecialEquipOnOrOff()
    EquipControl.SetSpecialEquip()
    return SpecialEquipOn
end
---@return EquipData 获取单个共鸣装备
function EquipControl.GetSingleEquips(id)
    if id == nil then
        return nil
    end
    return EquipDataList[id]
end
---@param equipGroup EquipInfo[] 填充多个物品到道具背包
function EquipControl.PushGroupEquipData(equipGroup)
    if not equipGroup then
        print("推送装备为空")
        return
    end
    for idx, equip in pairs(equipGroup) do
        EquipControl.PushSingleEquipData(equip)---添加到道具背包
    end
end
---@param equip EquipInfo 添加单个共鸣装备到背包
function EquipControl.PushSingleEquipData(equip)
    if not EquipDataList[equip.equipID] then
        ---背包没有装备直接添加
        EquipDataList[equip.equipID] = EquipData.New(equip.equipID)
    end
    ---刷新数据
    EquipDataList[equip.equipID]:PushData(equip)
    ItemControl.PushSingleItemData({
            goodsID = equip.equipID,
            goodsNum = 1,
            goodsType = 5
    }, ItemControl.PushEnum.add)
end
---@param id number 装备id
---@param level number 装备等级
---@return EquipData
function EquipControl.CreateSingleEquip(id,level)
    ---@type EquipData
    local data = EquipData.New(id)
    data:PushData({equipLevel = level})
end

function EquipControl.ReturnSingleEquip(id,level)
    ---@type EquipData
    local data = EquipData.New(id)
    data:PushData({equipLevel = level})
    return data
end
---@return SpecialEquipData
function EquipControl.CreateSingleSpecialEquip(id,level,phase)
    if id == nil or level == nil or phase == nil then
        return nil
    end
    ---@type SpecialEquipData
    local specialEquip = SpecialEquipData.New(id)
    specialEquip:PushEvolutionLevel(level)
    specialEquip:PushEvolutionPhase(phase)
    return specialEquip
end

function EquipControl.CreatSingleSpecialEquip(id,level,phase)
    if id then
        ---@type SpecialEquipData
        local data = SpecialEquipData.New(id)
        data:PushEvolutionLevel(level)
        data:PushEvolutionPhase(phase)
        return data
    end
    return nil
end

function EquipControl.SpecialEquipCreat(id)
    local req = {
        TargetID = id,
        HeroID = id
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSEquipMakeREQ',req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SPECIAL_EQUIP_MAKE_REQ,bytes,1,nil,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSEquipMakeACK', buffer))
        if tab.errNo ~= 0 then
            UnityEngine.DebugEx.LogError("ACK ErrorNumber: "..tab.errNo)
        end
    end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSEquipMakeNTF', buffer))
        ---装备等级/阶段推送
        local bagSEquip = EquipControl.GetSingleSpecialEquip(tab.specialEquip.ID)
        bagSEquip:PushEvolutionLevel(tab.specialEquip.level)
        bagSEquip:PushEvolutionPhase(tab.specialEquip.grade)
        bagSEquip:SetLockState(true)
        ---物品消耗
        if tab.cost then
            ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
        end
        ---任务完成数量统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        Event.Go("EquipCreatSuccess")
    end)
end
---@param equipData SpecialEquipData
function EquipControl.SpecialEquipLevelUp(equipData,level,callBack)
    local req = {
        TargetID = tonumber(equipData.owner),
        OldLevel = equipData.evolutionLevel,
        NewLevel = equipData.evolutionLevel + level
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSEquipUPREQ',req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SPECIAL_EQUIP_UP_LEVEL_REQ,bytes,1,nil,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSEquipUPACK', buffer))
        if tab.errNo ~= 0 then
            UnityEngine.DebugEx.LogError("ACK ErrorNumber: "..tab.errNo)
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"),1},true)
        end
    end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSEquipUPNTF', buffer))
        ---装备等级/阶段推送
        local bagSEquip = EquipControl.GetSingleSpecialEquip(tab.specialEquip.ID)
        bagSEquip:PushEvolutionLevel(tab.specialEquip.level)
        bagSEquip:PushEvolutionPhase(tab.specialEquip.grade)
        --更新超限装备等级
        HeroControl.RefreshSEquip(tab.specialEquip.ID,tab.specialEquip.level)
        ---物品消耗
        if tab.cost then
            ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
        end
        ---任务完成数量统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        if callBack then
            callBack()
        end
    end)
end

function EquipControl.SpecialEquipPhaseUp(equipData,callBack)
    local req = {
        TargetID = tonumber(equipData.owner),
        OldLevel = equipData.evolutionPhase,
        NewLevel = equipData.evolutionPhase + 1
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSEquipUPGradeREQ',req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SPECIAL_EQUIP_UP_GRADE_REQ,bytes,1,nil,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSEquipUPGradeACK', buffer))
        if tab.errNo ~= 0 then
            UnityEngine.DebugEx.LogError("ACK ErrorNumber: "..tab.errNo)
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_zhuanshugongming_text4"),1},true)
        end
    end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSEquipUPGradeNTF', buffer))
        ---装备等级/阶段推送
        local bagSEquip = EquipControl.GetSingleSpecialEquip(tab.specialEquip.ID)
        bagSEquip:PushEvolutionLevel(tab.specialEquip.level)
        bagSEquip:PushEvolutionPhase(tab.specialEquip.grade)
        ---物品消耗
        if tab.cost then
            ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
        end
        ---任务完成数量统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        if callBack then
            callBack()
        end
    end)
end

function EquipControl.Clear()
    EquipDataList = {}
end

return EquipControl