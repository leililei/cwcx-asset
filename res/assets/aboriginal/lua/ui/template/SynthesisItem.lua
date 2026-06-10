-- Code Auto Create Begin
local M = Class('SynthesisItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SynthesisItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SynthesisItem','/',2},{'Img_Add1','Img_Add1',2},{'Img_Add2','Img_Add2',2},{'Item1','Item1',2},{'NonePanel','Item1/NonePanel',2},{'Img_Daojukong2','Item1/NonePanel/Img_Daojukong2',2},{'Img_Sucaishudi3','Item1/NonePanel/Img_Sucaishudi3',2},{'ItemPanel','Item1/ItemPanel',2},{'Img_Frame','Item1/ItemPanel/Img_Frame',2},{'Img_Sucaishudi1','Item1/ItemPanel/Img_Sucaishudi1',2},{'Img_Icon','Item1/ItemPanel/Img_Icon',2},{'Item2','Item2',2},{'NonePanel01','Item2/NonePanel',2},{'Img_Daojukong201','Item2/NonePanel/Img_Daojukong2',2},{'Img_Sucaishudi301','Item2/NonePanel/Img_Sucaishudi3',2},{'ItemPanel01','Item2/ItemPanel',2},{'Img_Frame01','Item2/ItemPanel/Img_Frame',2},{'Img_Sucaishudi101','Item2/ItemPanel/Img_Sucaishudi1',2},{'Img_Icon01','Item2/ItemPanel/Img_Icon',2},{'Item3','Item3',2},{'NonePanel02','Item3/NonePanel',2},{'Img_Daojukong202','Item3/NonePanel/Img_Daojukong2',2},{'Img_Sucaishudi302','Item3/NonePanel/Img_Sucaishudi3',2},{'ItemPanel02','Item3/ItemPanel',2},{'Img_Frame02','Item3/ItemPanel/Img_Frame',2},{'Img_Sucaishudi102','Item3/ItemPanel/Img_Sucaishudi1',2},{'Img_Icon02','Item3/ItemPanel/Img_Icon',2},{'Img_Jiantouxian','Img_Jiantouxian',2},{'ImageClick','ImageClick',2},{'targetItem','targetItem',2},{'Img_Frame03','targetItem/Img_Frame',2},{'Img_Icon03','targetItem/Img_Icon',2},{'Img_ItemCountBg','targetItem/Img_ItemCountBg',2},{'Weijiesuo','Weijiesuo',2},{'zhezhao','Weijiesuo/zhezhao',2},
        -- Text 列表
        {'Text_Name','Text_Name',3},{'Text_Sucaishu3','Item1/NonePanel/Text_Sucaishu3',3},{'Text_Sucaishu301','Item2/NonePanel/Text_Sucaishu3',3},{'Text_Sucaishu302','Item3/NonePanel/Text_Sucaishu3',3},{'Text_Wufahecheng','Weijiesuo/Text_Wufahecheng',3},
        -- UITemplate 列表
        {'SynthesisItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Count','Item1/ItemPanel/Text_Count',20},{'Text_Count01','Item2/ItemPanel/Text_Count',20},{'Text_Count02','Item3/ItemPanel/Text_Count',20},{'Text_ItemCount','targetItem/Img_ItemCountBg/Text_ItemCount',20},{'Text_Weijiesuo','Weijiesuo/zhezhao/Text_Weijiesuo',20},
    }
end
-- Code Auto Create End
require("LocalData/RoleequipmentLocalData")
require("LocalData/EnergysynthesisLocalData")
function M:OnInit()

end

function M:OnUpdateUI(pData)
    ---@type SynthesisData 道具预制设置
    self.pData = pData[1]
    self.parent = pData[2]
    --self.parent.roleList
    self.targetItem = self.targetItem().gameObject
    self.costItems= {
        self.Item1().gameObject,
        self.Item2().gameObject,
        self.Item3().gameObject,
    }

    ---@type ItemData 要合成的道具
    self.Item =  self.pData:GetSynthesisItem()
    ---@type ItemData 合成要消耗的道具
    self.costItem = self.pData:GetSynthesisCost()
    --合成数量
    self.Img_ItemCountBg().gameObject:SetActive(self.pData.type == 0)
    self.Text_ItemCount().text = self.Item.needCount
    ---设置合成品质
    if RoleequipmentLocalData.tab[self.Item.id] ~= nil then
        self.Item.iconFrame =  "Item/Rank/ItemRank_"..RoleequipmentLocalData.tab[self.Item.id][6]
    end 
    MgrRes.LoadSprite(self.targetItem.transform:Find("Img_Frame").gameObject:GetComponent("Image"),self.Item.iconFrame)
    ---设置合成图标
    MgrRes.LoadSprite(self.targetItem.transform:Find("Img_Icon").gameObject:GetComponent("Image"),self.Item.icon)
    ---设置合成道具名字
    self.Text_Name().text = self.Item.name
    ---默认显示无数据UI
    for k,v in pairs(self.costItems) do
        v.transform:Find("NonePanel").gameObject:SetActive(true)
        v.transform:Find("ItemPanel").gameObject:SetActive(false)
    end
    ---更换UI
    for k,v in pairs(self.costItem) do
        local obj = self.costItems[k].transform:Find("ItemPanel").gameObject
        local noneObj = self.costItems[k].transform:Find("NonePanel").gameObject
        local icon = obj.transform:Find("Img_Icon").gameObject:GetComponent("Image")
        local count = obj.transform:Find("Text_Count"):GetComponent("TextMeshProUGUI")
        local frame = obj.transform:Find("Img_Frame").gameObject:GetComponent("Image")
        local myItem = ItemControl.GetItemByID(v.id)

        MgrRes.LoadSprite(frame,v.iconFrame)
        MgrRes.LoadSprite(icon,v.icon)
        if myItem.count >= v.needCount then
            if self.pData.type == 1 and k == 1 then
                count.text = string.format("<color=#73fff9>%s</color>/%s",self.pData.SynthesisCount1,v.needCount)
                if self.pData.SynthesisCount1 == 0 then
                    count.text = string.format("<color=#CD1B1B>%s</color>/%s",self.pData.SynthesisCount1,v.needCount)
                end
            else
                count.text = string.format("<color=#73fff9>%s</color>/%s",ItemControl.GetItemConciseCount(myItem.id),v.needCount)
            end
        else
            if self.pData.type == 1 and k == 1 then
                count.text = string.format("<color=#CD1B1B>%s</color>/%s",self.pData.SynthesisCount1,v.needCount)
            else
                count.text = string.format("<color=#CD1B1B>%s</color>/%s",ItemControl.GetItemConciseCount(myItem.id),v.needCount)
            end
        end
        obj:SetActive(true)
        noneObj:SetActive(false)
    end
    --表类型（区分读的哪张表）self.pData.dataType == 2 and
    -- if self.pData.dataType == 3 and self.parent.roleList[self.pData.roleid] == nil then --123
    -- --if self.parent.roleList[self.pData.roleid] == nil then
    --     self.Weijiesuo().gameObject:SetActive(true)
    -- end

    -- if self.pData.dataType == 2 and not self.pData.Synthesis then --123
    --     self.Weijiesuo().gameObject:SetActive(true)
    -- end
    self.Weijiesuo().gameObject:SetActive(false)
    if self.pData.type == 1 and not self.pData.Synthesis then
        self.Weijiesuo().gameObject:SetActive(true)
    else
        if self.pData.type == 0  then
            self.Weijiesuo().gameObject:SetActive(false)
        else
            if self.pData.type == 2 and self.parent.roleList[self.pData.roleid] == nil then
                self.Weijiesuo().gameObject:SetActive(true)
            end
        end
    end

    ---点击Item
    UIEvent.LuaClick(self.ImageClick().gameObject,function()
        --没有此角色不能合成
        if self.pData.type == 1 and not self.pData.Synthesis then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text124"),1},true)
            return
        end

        if self.pData.type == 2 and self.parent.roleList[self.pData.roleid] == nil then
            if EnergysynthesisLocalData.tab[self.pData.id][6] ~= 0 then
                local roleId = EnergysynthesisLocalData.tab[self.pData.id][6]
                local role = HeroControl.GetRoleDataByID(roleId)
                 MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text123"),role.name),1},true)
            end
            return
        end

        local str = string.split(self.pData.synthesisItem,"_")
        local item = ItemControl.GetItemByID(tonumber(str[2]))
        --local a = self.pData:GetSynthesisItem()
        self.parent.CurSynthesisItem = self.Item

        --self:GetSynthesisCost(self.pData.synthesisCost)

        self.parent.CurCostItem = self:GetSynthesisCost(self.pData.synthesisCost)--self.costItem
        self.parent.CurSynthesisId = self.pData.id
        self.parent.CurItemData = self.pData
        self.parent.Hechen1().gameObject:SetActive(true)
        self.parent.Hechen2().gameObject:SetActive(false)
        self.parent.synthesisCount = 1
        self.parent:RefreshSynthesis()
    end)

    UIEvent.LuaClick(self.targetItem,function()
        local itemID = string.split(self.pData.synthesisItem,'_')
        local Item = ItemControl.GetItemByIdAndType(tonumber(itemID[2]),tonumber(itemID[1]))
        MgrUI.Pop(UID.ItemDetailPop_UI,{ Item, true, function()
        end},true)
    end)
end

---获得合成花费物品和数量
function M:GetSynthesisCost(arg)
    local str = string.split(arg,",") --123
    local array = {}
    for k,v in pairs(str) do
        if v == "," then
            break
        end
        local itemStr = string.split(v,"_")
        local item =  ItemControl.GetItemByID(tonumber(itemStr[2]))
        item.needCount = tonumber(itemStr[3])
        table.insert(array,item)
    end
    return array
end

return M