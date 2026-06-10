-- Code Auto Create Begin
local M = Class('ItemPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ItemPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Numberdi','Jiajian/Numberdi',2},{'Btn_LvDown','Jiajian/Btn_LvDown',2},{'-(hui)2','Jiajian/Btn_LvDown/-(hui)2',2},{'Btn_Minus','Jiajian/Btn_Minus',2},{'Img_MinusD','Jiajian/Btn_Minus/Img_MinusD',2},{'Img_Minus','Jiajian/Btn_Minus/Img_Minus',2},{'Btn_LvUp','Jiajian/Btn_LvUp',2},{'+(hui)2','Jiajian/Btn_LvUp/+(hui)2',2},{'Btn_Add','Jiajian/Btn_Add',2},{'Img_AddD','Jiajian/Btn_Add/Img_AddD',2},{'Img_Add','Jiajian/Btn_Add/Img_Add',2},
        -- UITemplate 列表
        {'ItemPrefab','/',10},{'BagItem','BagItem',10},
        -- TextMeshProUGUI 列表
        {'Text_BuyCount','Jiajian/Numberdi/Text_BuyCount',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.count = 0

    self:InitButton()
    self.Text_BuyCount().text = "0"
end

function M:InitButton()
    UIEvent.AlwaysLongClick(self.Btn_Add().gameObject,Handle(self,self.AddCount))
    UIEvent.AlwaysLongClick(self.Btn_Minus().gameObject,Handle(self,self.MinusCount))
end


function M:OnUpdateUI(pData)
    ---@type ItemData
    self.item = pData[1]
    self.parent = pData[2]
    self.index = pData[3]
    self.itemFavor = self.item.costeffect[2]

    self.BagItem():SetData({self.item,self})

    if self.parent.Successful then
        self.count = 0
         self.Text_BuyCount().text = self.count
    end
    self:ButtonChange()
end

function M:AddCount()
    self.parent.Successful = false
    local tot = 0
    for i = 1, #self.parent.totalFavorUp do
        tot = tot + self.parent.totalFavorUp[i]
    end
    if (self.parent.hero.favor + tot + self.itemFavor) >= Global.MaxFavorLv() + self.itemFavor then --最大好感
        self.Btn_LvUp().gameObject:SetActive(true)
        self.Btn_Add().gameObject:SetActive(false)
        return
    else
        self.Btn_LvUp().gameObject:SetActive(false)
        self.Btn_Add().gameObject:SetActive(true)
    end

    if self.count >= self.item.count then
        self.count = self.item.count
    else
        self.count = self.count + 1
    end
    self.parent:CumulativeFavor(self.index,self.count * self.itemFavor,self.item.id,self.count,self.item.goodsType)
    --self:ButtonChange()
    self.Text_BuyCount().text = self.count
end

function M:MinusCount()
    self.parent.Successful = false
    if self.count <= 0 then
        return
    else
        self.count = self.count - 1
        self.Text_BuyCount().text = self.count
        self.parent:CumulativeFavor(self.index,self.count * self.itemFavor,self.item.id,self.count,self.item.goodsType)
        --self:ButtonChange()
    end
end

function M:ButtonChange()
    if self.count <= 0 then
        self.Btn_LvDown().gameObject:SetActive(true)
        self.Btn_Minus().gameObject:SetActive(false)
    else
        self.Btn_LvDown().gameObject:SetActive(false)
        self.Btn_Minus().gameObject:SetActive(true)
    end
    local tot = 0
    for i = 1, #self.parent.totalFavorUp do
        tot = tot + self.parent.totalFavorUp[i]
    end
    if self.count >= self.item.count or (self.parent.hero.favor + tot) >= Global.MaxFavorLv() then
        self.Btn_LvUp().gameObject:SetActive(true)
        self.Btn_Add().gameObject:SetActive(false)
    else
        self.Btn_LvUp().gameObject:SetActive(false)
        self.Btn_Add().gameObject:SetActive(true)
    end
end

return M