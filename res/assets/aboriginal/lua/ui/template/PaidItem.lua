-- Code Auto Create Begin
local M = Class('PaidItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PaidItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PaidItem','/',2},{'ItemPanel','ItemPanel',2},{'Limit','ItemPanel/Limit',2},{'Img_Icon','ItemPanel/Img_Icon',2},{'Img_SoldOut','Img_SoldOut',2},
        -- UITemplate 列表
        {'PaidItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Cishu','ItemPanel/Limit/Text_Cishu',20},{'Text_Explanatory','ItemPanel/Text_Explanatory ',20},{'Text_Price','ItemPanel/Text_Price',20},{'Text_CurrencyType','ItemPanel/Text_Price/Text_CurrencyType',20},{'Text_Name','ItemPanel/Text_Name',20},{'Text_Name01','Img_SoldOut/Text_Name',20},
    }
end
-- Code Auto Create End
require("LocalData/PaidgoodsLocalData")
function M:OnInit()
    UIEvent.LuaClick(self.PaidItem().gameObject,function()
        if self.pData.isSellGroup then
            local price = self.pData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
            price.goodsNum = self.price             --价格以self.price为准
            local data = ItemControl.GetItemByIdAndType(price.goodsID,price.goodsType)      --手中持有的货币数量
            local pMax = math.floor(data.count / price.goodsNum)                        --最大可买数量
            local bMax = self.pData.buyMaxCount - self.pData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
            --local maxCount = self.pData.buyMaxCount == 0 and pMax or (pMax < bMax and pMax or bMax)
            ---如果超过最大可买数量
            if self.pData.buyMaxCount ~= 0 and self.pData.buyCount + 1 > self.pData.buyMaxCount then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1"),1},true)
                return
            end
            MgrUI.Pop(UID.BuyPop_UI,{self.pData,function(count)
                ---没有货物数据或总价超出所持有的货币数
                if data == nil or price.goodsNum * count >  data.count then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
                    return
                end
                if self.pData.shopType == 400000 then
                    ShopViewModel.BuyRandomGoods({self.pData.id,self.pData.verificationTime,count},function()
                        self.parent:RefreshCurShop()
                    end)
                else
                    ShopViewModel.SendBuyGoods({self.pData.id,count},function()
                        --self.parent.LastChildShop = 0
                        self.parent:RefreshCurShop()
                    end)
                end
            end,1,bMax,true,pMax},true)
        else
            local bMax = self.pData.buyMaxCount - self.pData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
            ---如果超过最大可买数量
            if self.pData.buyMaxCount ~= 0 and self.pData.buyCount + 1 > self.pData.buyMaxCount then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1"),1},true)
                return
            end
            MgrUI.Pop(UID.BuyPop_UI,{self.pData,function(count)
                ShopViewModel.FlyFunBuyGoods(self.pData.id,function()
                    MgrUI.Lock("BuyProps")
                    ShopViewModel.GetBuyNumber(1,function()
                        self.parent:ReloadScroll()
                        MgrUI.UnLock("BuyProps")
                    end)
                end)
            end,1,bMax,false},true)
        end
    end)
end

function M:OnUpdateUI(args)
    ---@type ShopItemData
    self.pData = args[1]
    self.parent = args[2]
    for i,v in pairs(PaidgoodsLocalData.tab) do
        ---找到价格
        if v[3] == self.pData.id then
            self.price = v[8]
            break
        end
    end

    MgrRes.LoadSprite(self.Img_Icon(),self.pData.icon)
    MgrRes.LoadSprite(self.ItemPanel(),self.pData.bgIcon)
    self.Text_Price().text = self.price
    self.Text_Explanatory().text = self.pData:GetIntroduce().goodsTips
    self.Text_Name().text = MgrLanguageData.GetLanguageByKey("ui_shop_buy")..self.pData.name
    self.Text_Cishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_shop_limit"),self.pData.buyMaxCount - self.pData.buyCount)
    self.Text_CurrencyType().text=MgrLanguageData.GetLanguageByKey("ui_shop_money")
    ---如果是无限购买
    if self.pData.buyMaxCount == 0 then
        self.Limit().gameObject:SetActive(false)
        self.Img_SoldOut().gameObject:SetActive(false)
        self.ItemPanel().transform:GetComponent("CanvasGroup").alpha = 1
    else
        ---还能购买
        if self.pData.buyMaxCount > self.pData.buyCount then
            self.Limit().gameObject:SetActive(true)
            self.Img_SoldOut().gameObject:SetActive(false)
            self.ItemPanel().transform:GetComponent("CanvasGroup").alpha = 1
        else
            self.Limit().gameObject:SetActive(false)
            self.Img_SoldOut().gameObject:SetActive(true)
            self.ItemPanel().transform:GetComponent("CanvasGroup").alpha = 0.5
        end
    end



end

return M