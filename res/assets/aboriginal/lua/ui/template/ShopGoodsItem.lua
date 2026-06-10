-- Code Auto Create Begin
local M = Class('ShopGoodsItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ShopGoodsItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ShopGoodsItem','/',2},{'ShopItemPanel','ShopItemPanel',2},{'Img_Di','ShopItemPanel/Img_Di',2},{'Img_Frame','ShopItemPanel/Img_Frame',2},{'Img_Icon','ShopItemPanel/Img_Icon',2},{'ReTime','ShopItemPanel/ReTime',2},{'Img_PriceIcon','ShopItemPanel/Panel/Img_PriceIcon',2},{'Panel','ShopItemPanel/Panel/Text_Original/Panel',2},{'Img_Count','ShopItemPanel/Img_Count',2},{'Img_DisCount','ShopItemPanel/Img_DisCount',2},{'Img_Name','ShopItemPanel/Img_Name',2},{'Img_FrameB','ShopItemPanel/Img_Name/Img_FrameB',2},{'StarPanel','ShopItemPanel/StarPanel',2},{'ItemStarPrefab','ShopItemPanel/StarPanel/ItemStarPrefab',2},{'HighLight','ShopItemPanel/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','ShopItemPanel/StarPanel/ItemStarRoot',2},{'Img_SoldOut','Img_SoldOut',2},
        -- UITemplate 列表
        {'ShopGoodsItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_ReTime','ShopItemPanel/ReTime/Text_ReTime',20},{'Text_Price','ShopItemPanel/Panel/Text_Price',20},{'Text_Original','ShopItemPanel/Panel/Text_Original',20},{'Text_Count','ShopItemPanel/Img_Count/Text_Count',20},{'Text_DisCount','ShopItemPanel/Img_DisCount/Text_DisCount',20},{'Text_Name','ShopItemPanel/Img_Name/Text_Name',20},{'Text_CantBuy','Img_SoldOut/Text_CantBuy',20},
    }
end
-- Code Auto Create End
require("LocalData/PaidgoodsLocalData")
function M:OnInit()
    UIEvent.LuaClick(self.Img_Di().gameObject,function()
        ---为0表示没有解锁条件
        if self.pData.buyLimit ~= 0 then
            ---如果此商品未解锁
            if SysLockControl.CheckSysLock(self.pData.buyLimit) == false then
                MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(self.pData.buyLimit)})
                return
            end
        end
        if self.pData.isSellGroup then
            local price = self.pData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
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
                    if data and data.id == 100000 then --只有是原初结晶才跳转到充值界面
                        MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips6"),data.name),Handle(self, function()
                            self.callback()
                        end),nil,2})
                    else
                        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("shop_ui_buyfail1"),data.name)},true)
                    end
                    return
                end
                if self.pData.shopType == 400000 then
                    ShopViewModel.BuyRandomGoods({self.pData.id,self.pData.verificationTime,count},function()
                        --self.parent.LastChildShop = 0
                        self.parent:RefreshCurShop()
                    end)
                else
                    ShopViewModel.SendBuyGoods({self.pData.id,count},function()
                        --self.parent.LastChildShop = 0
                        self.parent:RefreshCurShop()
                        ---在商店正常购买时不执行此回调
                        if self.parent.Uid ~= UID.Shop_UI then
                            if self.callback then
                                self.callback()
                            end
                        end
                    end)
                end
            end,1,bMax,true,pMax},true)
        else
            local price = self.pData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
            local data = ItemControl.GetItemByIdAndType(price.goodsID,price.goodsType)      --手中持有的货币数量
            local bMax = self.pData.buyMaxCount - self.pData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
            ---如果超过最大可买数量
            if self.pData.buyMaxCount ~= 0 and self.pData.buyCount + 1 > self.pData.buyMaxCount then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1"),1},true)
                return
            end
            MgrUI.Pop(UID.BuyPop_UI,{self.pData,function(count)
                ---如果是首页推荐,且不是原初结晶,判定为用钱购买
                if self.pData.shopType2 == 100 then
                    local priceGoods = self.pData:GetPrice()
                    if priceGoods.goodsID ~= 100008 then
                        ShopViewModel.FlyFunBuyGoods(self.pData.id,function()
                            Event.Go("ShopHome_UI_ReloadScroll")
                        end)
                        return
                    end
                end
                ---没有货物数据或总价超出所持有的货币数
                if data == nil or price.goodsNum >  data.count then
                    MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("need_more_diamond"),Handle(self, function()
                        if self.callback then
                            self.callback()
                        end
                    end),nil,2})
                    return
                end
                if self.pData.shopType == 400000 then
                    ShopViewModel.BuyRandomGoods({self.pData.id,self.pData.verificationTime,count},function()
                        --self.parent.LastChildShop = 0
                        self.parent:RefreshCurShop()
                    end)
                else
                    ShopViewModel.SendBuyGoods({self.pData.id,1},function()
                        --self.parent.LastChildShop = 0
                        if self.pData.shopType2 == 100 then
                            ---刷新首推商店
                            Event.Go("ShopHome_UI_ReloadScroll")
                            ---刷新货币
                            Event.Go("Shop_UI_ChangeWallet")
                        else
                            self.parent:RefreshCurShop()
                        end
                    end)
                end
            end,1,bMax,false},true)

        end
    end)
    self.ShopCanvasGroup = self.ShopItemPanel().transform:GetComponent("CanvasGroup")

    ---初始化最大星级
    self.starHLObj = {}
    for i = 1, 6 do
        local obj = GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,false)
        self.starHLObj[i] = obj.transform:Find("HighLight").gameObject
    end
    self.ItemStarPrefab().gameObject:SetActive(false)
end

function M:OnUpdateUI(args)
    ---@type ShopItemData
    self.pData = args[1]
    self.idx = args[2]
    self.parent = args[3]
    self.callback = args[4]

    local resetTime = self.pData:GetResetBuyTime(ShopViewModel.EnterShopTime)
    self.Text_Name().text = self.pData.name
    MgrRes.LoadSprite(self.Img_Frame(),self.pData.rankIcon)
    MgrRes.LoadSprite(self.Img_Icon(),self.pData.icon)
    MgrRes.LoadSprite(self.Img_FrameB(),self.pData.rankIconB)

    if self.pData.shopType == 114004 then
        self.Img_Icon().gameObject.transform.localPosition = Vector3(-5,10,0)
        self.Img_Icon().gameObject.transform.sizeDelta = Vector2(342, 342)
    else
        self.Img_Icon().gameObject.transform.localPosition = Vector3(-6,29,0)
        self.Img_Icon().gameObject.transform.sizeDelta = Vector2(188, 188)
    end

    if self.pData.shopType2 == 100 then
        local price
        local priceGoods = self.pData:GetPrice()
        local priceIcon = string.format("Item/%s",Global.GetLocalDataByGoods(priceGoods).icon)
        MgrRes.LoadSprite(self.Img_PriceIcon(),priceIcon)
        ---策划需求 100008商品直接读数目
        if self.pData:GetPrice().goodsID == 100008 then
            self.Text_Price().text = JNStrTool.numberAbbr(priceGoods.goodsNum)
        else
            for i,v in pairs(PaidgoodsLocalData.tab) do
                ---找到价格
                if v[3] == self.pData.id then
                    price = v[8]
                    break
                end
            end
            self.Text_Price().text = price
        end
    else
        local priceGoods = self.pData:GetPrice()
        self.Text_Price().text = JNStrTool.numberAbbr(priceGoods.goodsNum)
        local priceIcon = string.format("Item/%s",Global.GetLocalDataByGoods(priceGoods).icon)
        MgrRes.LoadSprite(self.Img_PriceIcon(),priceIcon)
    end

    local originalGoods = self.pData:GetOriginal()
    local priceGoods = self.pData:GetPrice()
    if originalGoods ~= nil then
        self.Text_Original().gameObject:SetActive(true)
        self.Text_Original().text = originalGoods.goodsNum >= 10000 and math.floor(originalGoods.goodsNum/1000).."K" or originalGoods.goodsNum
        self.Img_DisCount().gameObject:SetActive(true)
        self.Text_DisCount().text = string.format("-%.0f", (1 - priceGoods.goodsNum/originalGoods.goodsNum) * 100).."%"
    else
        self.Text_Original().gameObject:SetActive(false)
        self.Text_Original().text = ""
        self.Img_DisCount().gameObject:SetActive(false)
    end
    if self.pData.buyMaxCount ~= 0 then
        if not SysLockControl.CheckSysLock(self.pData.buyLimit) then
            self.ShopCanvasGroup.alpha = 0.5
            self.Text_CantBuy().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text120")
            self.Img_SoldOut().gameObject:SetActive(true)
        elseif self.pData.buyMaxCount - self.pData.buyCount == 0 then
            self.ShopCanvasGroup.alpha = 0.5
            self.Text_CantBuy().text = MgrLanguageData.GetLanguageByKey("ui_qita_text36")
            self.Img_SoldOut().gameObject:SetActive(true)
        else
            self.ShopCanvasGroup.alpha = 1
            self.Img_SoldOut().gameObject:SetActive(false)
        end
    else
        ---检查该商品是否满足解锁条件
        if self.pData.buyLimit ~= 0 then
            if SysLockControl.CheckSysLock(self.pData.buyLimit) == false then
                self.ShopCanvasGroup.alpha = 0.5
                self.Text_CantBuy().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text120")
                self.Img_SoldOut().gameObject:SetActive(true)
            else
                self.ShopCanvasGroup.alpha = 1
                self.Img_SoldOut().gameObject:SetActive(false)
            end
        else
            self.ShopCanvasGroup.alpha = 1
            self.Img_SoldOut().gameObject:SetActive(false)
        end
    end

    if self.pData.buyMaxCount == 0 then
        self.Text_Count().text = MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limitless")
        --self.Text_Count().text = "剩余  0"
    else
        self.Text_Count().text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limit"),self.pData.buyMaxCount - self.pData.buyCount)
    end
    ---下架时间
    self.ReTime().gameObject:SetActive(true)
    local cutTime = self.pData:GetGoodsCutTime()
    if resetTime then
        local day = resetTime/86400
        if day > 1 then
            self.Text_ReTime().text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_reset_tips1"),day)
        else
            local h = math.floor(resetTime/3600)
            local m = resetTime%3600/60
            self.Text_ReTime().text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_reset_tips2"),h,m)
        end
    elseif cutTime then
        local day = cutTime/86400
        if day > 1 then
            self.Text_ReTime().text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_reset_tips3"),day)
        else
            local h = math.floor(cutTime/3600)
            --local m = cutTime%3600/60
            self.Text_ReTime().text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_reset_tips4"),h)
        end
    else
        self.ReTime().gameObject:SetActive(false)
        self.Text_ReTime().text = ""
    end

    if self.pData:GetBuyItem() ~= {} and self.pData:GetBuyItem()[1].goodsType == 2 then
        self.StarPanel().gameObject:SetActive(true)
        local itemData = ItemControl.GetItemByIdAndType(self.pData.ladderItems[0][1].goodsID,self.pData.ladderItems[0][1].goodsType)
        --大于0更新星级显示
        if itemData.star > 0 then
            for i = 1,#self.starHLObj do
                self.starHLObj[i]:SetActive(i <= itemData.star)
            end
        end
    else
        self.StarPanel().gameObject:SetActive(false)
    end
end

return M