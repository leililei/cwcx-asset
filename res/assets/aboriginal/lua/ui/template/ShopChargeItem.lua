-- Code Auto Create Begin
local M = Class('ShopChargeItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ShopChargeItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ShopChargeItem','/',2},{'ItemBG','ItemBG',2},{'DiamondImg','DiamondImg',2},{'GiveCoinBG','GiveCoinBG',2},{'GiveCoinImg','GiveCoinBG/GiveCoinImg',2},{'MoneyPanel','MoneyPanel',2},{'MoneyImg','MoneyPanel/MoneyImg',2},
        -- UITemplate 列表
        {'ShopChargeItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text','GiveCoinBG/Text',20},{'GiveCoinText','GiveCoinBG/GiveCoinText',20},{'DiamondTitle','DiamondTitle',20},{'DiamondTips','DiamondTips',20},{'MoneyText','MoneyPanel/MoneyText',20},
    }
end
-- Code Auto Create End
require("LocalData/PaidgoodsLocalData")
function M:OnInit()
    UIEvent.LuaClick(self.ShopChargeItem().gameObject, function()
        ShopViewModel.FlyFunBuyGoods(self.pData.id)
    end)
end

function M:OnUpdateUI(args)
    ---@type ShopItemData
    self.pData = args[1]
    self.idx = args[2]
    self.parent = args[3]
    ---钻石标题、描述、图片
    self.DiamondTitle().text = self.pData.name
    self.DiamondTips().text = self.pData:GetIntroduce().goodsTips
    MgrRes.LoadSprite(self.DiamondImg(), self.pData.icon)
    ---赠送货币的图片和文字
    local tGiveGoods = self.pData:GetBuyItem()
    local tGiveIcon = string.format("Item/%s", Global.GetLocalDataByGoods(tGiveGoods[1]).icon)
    MgrRes.LoadSprite(self.GiveCoinImg(), tGiveIcon)
    if #tGiveGoods > 1 then
        self.GiveCoinText().text = tGiveGoods[1].goodsNum - tGiveGoods[2].goodsNum
    else
        self.GiveCoinBG().gameObject:SetActive(false)
    end
    ---购买道具的货币类型的图片和价格
    local price = 0
    for i, v in pairs(PaidgoodsLocalData.tab) do
        ---找到价格
        if v[3] == self.pData.id then
            price = v[8]
            break
        end
    end
    ---赠送道具及数量
    if tGiveGoods[2] then
        local tItemData = ItemControl.GetItemByIdAndType(tGiveGoods[2].goodsID,tGiveGoods[2].goodsType)
        MgrRes.LoadSprite(self.GiveCoinImg(), string.format("Item/%s", Global.GetLocalDataByGoods(tGiveGoods[2]).icon))
        self.GiveCoinText().text = tGiveGoods[2].goodsNum
        
        self.GiveCoinBG().gameObject:SetActive(true)
    else
        self.GiveCoinBG().gameObject:SetActive(false)
    end
    
    
    self.MoneyText().text = MgrLanguageData.GetLanguageByKey("ui_shop_money") .. price
end

return M