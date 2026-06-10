-- Code Auto Create Begin
local M = Class('CumulativeSalesShopCell', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CumulativeSalesShopCell.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'CumulativeSalesShopCell','/',2},{'Img_Bg','Img_Bg',2},{'Img_Icon','Img_Icon',2},{'Img_PriceIcon','PriceRoot/Img_PriceIcon',2},{'SoldOutRoot','SoldOutRoot',2},
        -- UITemplate 列表
        {'CumulativeSalesShopCell01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},{'Text_Num','Text_Num',20},{'Text_PriceNum','PriceRoot/Text_PriceNum',20},
    }
end
-- Code Auto Create End
--- 该项是在 CumulativeSalesShop_UI 需求下制作的。
--- 用于 Form[CumulativeSalesShop_UI]/ShopCell;
---@class CumulativeSalesShopCell : UIItemBase
---@field m_data CumulativeSalesShopCell.DataCls
---@field Img_Bg fun():UnityEngine.UI.Image
---@field Img_Icon fun():UnityEngine.UI.Image
---@field Text_Name fun():TMPro.TextMeshProUGUI
---@field Text_Num fun():TMPro.TextMeshProUGUI
---@field Img_PriceIcon fun():UnityEngine.UI.Image
---@field Text_PriceNum fun():TMPro.TextMeshProUGUI
---@field SoldOutRoot fun():UnityEngine.UI.Image
local ItemCls = M
---@type CumulativeSalesShopCell.DataCls
local DataCls

--region 生命周期
function ItemCls:OnInit()
    self.m_data = DataCls.New()
    self.m_data:OnInit()

    UIEvent.LuaClick(self.ObjRoot, Handle(self, self.OnSelfClick))
end

---@param pData CumulativeSalesShopCell.InputData
function ItemCls:OnUpdateUI(pData)
    self.m_data:InputData(pData)
    self:DoRefreshUI()
end

function ItemCls:RefreshUI()
    self.m_data:RefreshData()
    self:DoRefreshUI()
end
--endregion 生命周期

--region UI
function ItemCls:DoRefreshUI()
    local data = self.m_data

    --- 商品信息
    self.Text_Name().text = data.itemName
    if data.bInfinite then
        self.Text_Num().text = MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limitless")
    else
        self.Text_Num().text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limit"), data.itemCount)
    end
    MgrRes.LoadSprite(self.Img_Icon(), data.itemIcon)

    --- 商品级别
    if not Global.IsStrNil(data.qualityBg) then
        MgrRes.LoadSprite(self.Img_Bg(), data.qualityBg)
    end

    --- 开销信息
    self.Text_PriceNum().text = JNStrTool.numberAbbr(data.costGoods.goodsNum)
    MgrRes.LoadSprite(self.Img_PriceIcon(), data.costIcon)

    --- 售罄
    self.SoldOutRoot().gameObject:SetActive(data.bSoldOut)
end
--endregion UI

--region Callback
---@protected
function ItemCls:OnSelfClick()
    local data = self.m_data
    --- 售罄
    if data.bSoldOut then
        --Global.PopTip("eventshopitem_tips1")
        return
    end

    --- 商品锁定
    local shopItem = data.inputData.shopItem
    if CumulativeSalesViewModel.CheckShopItemLock(shopItem, true) then
        return
    end

    --- 外部回调
    local clickCallback = data.inputData.clickCallback
    if clickCallback ~= nil then
        clickCallback(data.inputData.index)
        return
    end

    --- 默认购买逻辑
    CumulativeSalesViewModel.BuyShopItem(shopItem, function(count)
        local buyCallback = data.inputData.buyCallback
        if buyCallback then
            buyCallback(data.inputData.index, count)
        end
    end)
end
--endregion Callback



--region DataCls
---@class CumulativeSalesShopCell.InputData
---@field index int? @ 作为 Callback 的参数
---@field clickCallback fun(index:int)? @ 未售罄才会触发
---@field buyCallback fun(index:int, count:int)? @ 走默认购买逻辑，购买成功后触发。clickCallback 必须为空
---@field shopItem ShopItemData @ 可能为源数据，请勿修改

---@class CumulativeSalesShopCell.DataCls
---@field inputData CumulativeSalesShopCell.InputData
---@field itemName string
---@field bInfinite boolean @ 数量无限
---@field bSoldOut boolean
---@field itemCount int
---@field itemIcon string
---@field qualityBg string
---@field costGoods goods
---@field costIcon string
---@field sysLimit int @ 系统解锁要求，0 为无要求
DataCls = Class("CumulativeSalesShopCell.DataCls")

function DataCls:OnInit()

end

---@param inputData CumulativeSalesShopCell.InputData
function DataCls:InputData(inputData)
    if not inputData then
        return
    end
    self.inputData = inputData
    self:RefreshData()
end

function DataCls:RefreshData()
    local shopItem = self.inputData.shopItem
    self.itemName = shopItem.name
    self.bInfinite = shopItem.buyMaxCount == 0
    self.bSoldOut = shopItem:SoldOut()
    if self.bInfinite then
        self.itemCount = 99
    else
        self.itemCount = shopItem.buyMaxCount - shopItem.buyCount
    end
    self.itemIcon = shopItem.icon
    local rank = math.clamp(tonumber(shopItem.rank), 1, 4)
    self.qualityBg = string.format("Activity/Shop/img_shop_bg_%d", rank)
    local price = shopItem:GetPrice()
    self.costGoods = price
    local costItem = ItemControl.GetItemByIdAndType(price.goodsID, price.goodsType)
    self.costIcon = costItem.icon
    self.sysLimit = shopItem.buyLimit or 0
end
--endregion DataCls

return M
