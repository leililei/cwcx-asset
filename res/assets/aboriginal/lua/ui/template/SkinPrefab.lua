-- Code Auto Create Begin
local M = Class('SkinPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SkinPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Unchoose','Unchoose',2},{'Unchoose_Image','Unchoose/Unchoose_Image',2},{'Yiyongyou','Unchoose/Yiyongyou',2},{'Zhezhao','Unchoose/Yiyongyou/Zhezhao',2},{'Jiage','Unchoose/Jiage',2},{'Img_Zuanshicon','Unchoose/Jiage/Img_Zuanshicon',2},{'Xianshi','Unchoose/tParent/Xianshi',2},{'zhekou','Unchoose/tParent/zhekou',2},{'Choose','Choose',2},{'Choose_Image','Choose/Choose_Image',2},{'Yiyongyou01','Choose/Yiyongyou',2},{'Zhezhao01','Choose/Yiyongyou/Zhezhao',2},{'Jiage01','Choose/Jiage',2},{'Img_Zuanshicon01','Choose/Jiage/Img_Zuanshicon',2},{'Xzkuang','Choose/Xzkuang',2},{'Xianshi01','Choose/tParent/Xianshi',2},{'zhekou01','Choose/tParent/zhekou',2},
        -- UITemplate 列表
        {'SkinPrefab','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Yiyongyou','Unchoose/Yiyongyou/Text_Yiyongyou',20},{'Text_price','Unchoose/Jiage/Text_price',20},{'Text_Xianshi','Unchoose/tParent/Xianshi/Text_Xianshi',20},{'Text_Zhekou','Unchoose/tParent/zhekou/Text_Zhekou',20},{'Text_Yiyongyou01','Choose/Yiyongyou/Text_Yiyongyou',20},{'Text_price01','Choose/Jiage/Text_price',20},{'Text_Xianshi01','Choose/tParent/Xianshi/Text_Xianshi',20},{'Text_Zhekou01','Choose/tParent/zhekou/Text_Zhekou',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot,function()
        self.parent:ScrollTo(self.index)
    end)
end

function M:OnUpdateUI(pData)
    ---@type ShopItemData
    self.itemData = pData[1]
    if self.itemData.id == nil then
        self.Unchoose().gameObject:SetActive(false)
        self.Choose().gameObject:SetActive(false)
        return
    end
    self.skinData = HeroControl.GetSkinDataBySkinId(self.itemData.id)
    self.index = pData[2]
    self.parent = pData[3]
    self.choose = CheckNumber(pData[4]) == self.skinData.id
    ---刷新
    self:Fresh()
    self:BeChosen(self.choose)
    ---判断皮肤是否已拥有
    local unlock = HeroControl.CheckSkinUnlocked(self.itemData.id)
    if unlock then
        self.Yiyongyou().gameObject:SetActive(true)
        self.Yiyongyou01().gameObject:SetActive(true)
        self.Jiage().gameObject:SetActive(false)
        self.Jiage01().gameObject:SetActive(false)
    else
        self.Yiyongyou().gameObject:SetActive(false)
        self.Yiyongyou01().gameObject:SetActive(false)
        self.Jiage().gameObject:SetActive(true)
        self.Jiage01().gameObject:SetActive(true)
    end
    if self.parent.skinIndex == self.index then
        self.Choose().gameObject:SetActive(true)
        self.Unchoose().gameObject:SetActive(false)
    else
        self.Choose().gameObject:SetActive(false)
        self.Unchoose().gameObject:SetActive(true)
    end
end

function M:Fresh()
    local priceGoods
    if self.itemData:IsDisCounting() then
        priceGoods = self.itemData:GetPrice()
    else
        priceGoods = self.itemData:GetOriginal()
    end
    local priceIcon = string.format("Item/%s",Global.GetLocalDataByGoods(priceGoods).icon)

    local unlock = HeroControl.CheckSkinUnlocked(self.itemData.id)
    
    ---未选中界面
    if self.itemData.sellType == 0 or self.itemData.sellType == 3 then
        self.Xianshi().gameObject:SetActive(false)
    else
        self.Xianshi().gameObject:SetActive(true)
    end
    MgrRes.LoadRectIcon(self.Unchoose_Image(),self.itemData.id)
    self.Text_price01().text = JNStrTool.numberAbbr(priceGoods.goodsNum)
    MgrRes.LoadSprite(self.Img_Zuanshicon01(),priceIcon)
    self:SetDiscountShow(self.zhekou01().gameObject, self.Text_Zhekou01(), unlock, priceGoods)
    
    ---选中界面
    MgrRes.LoadSprite(self.Img_Zuanshicon(),priceIcon)
    self.Text_price().text = JNStrTool.numberAbbr(priceGoods.goodsNum)
    if self.itemData.sellType == 0 or self.itemData.sellType == 3 then
        self.Xianshi01().gameObject:SetActive(false)
    else
        self.Xianshi01().gameObject:SetActive(true)
    end
    MgrRes.LoadRectIcon(self.Choose_Image(),self.itemData.id)
    self:SetDiscountShow(self.zhekou().gameObject, self.Text_Zhekou(), unlock, priceGoods)
end

--- 获得折扣百分比数值
---@param price int
---@param original int
function M:GetDiscount(price, original)
    return math.ceil((original - price) / original * 100)
end

--- 不在折扣期、已拥有、折扣为零都不显示
---@param rootObj UnityEngine.GameObject
---@param txtComp TMPro.TextMeshProUGUI
---@param bOwned boolean
---@param priceGoods goods
function M:SetDiscountShow(rootObj, txtComp, bOwned, priceGoods)
    local discountNum = 0
    if not bOwned and self.itemData.ladderOriginal[0] and self.itemData:IsDisCounting() then
        discountNum = self:GetDiscount(priceGoods.goodsNum, self.itemData.ladderOriginal[0].goodsNum)
    end

    if discountNum ~= 0 then
        rootObj:SetActive(true)
        txtComp.text = string.format("-%d%%", discountNum)
    else
        rootObj:SetActive(false)
    end
end

function M:BeChosen(yOn)
    if yOn then
        self.Unchoose().gameObject:SetActive(false)
        self.Choose().gameObject:SetActive(true)
        self.parent.skinIndex = self.index
        local unlock = HeroControl.CheckSkinUnlocked(self.itemData.id)
        if unlock then
            self.Yiyongyou().gameObject:SetActive(true)
            self.Yiyongyou01().gameObject:SetActive(true)
            self.parent:CloseBuyBtn(false)
        else
            self.Yiyongyou().gameObject:SetActive(false)
            self.Yiyongyou01().gameObject:SetActive(false)
            self.parent:CloseBuyBtn(true)
        end
    else
        self.Unchoose().gameObject:SetActive(true)
        self.Choose().gameObject:SetActive(false)
    end
end

--- ShopSkin_UI Choose/UnchooseEvent 绑定回调
function M:ItemUpdate(pData)
    if self.itemData.id == nil then
        return
    end
    self.choose = pData[1]
    self.chooseCallBack = pData[2]
    self:BeChosen(self.choose)
    if self.choose then
        self.chooseCallBack(self.skinData)
    end
end

return M