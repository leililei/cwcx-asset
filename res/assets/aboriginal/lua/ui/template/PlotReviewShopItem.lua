-- Code Auto Create Begin
local M = Class('PlotReviewShopItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlotReviewShopItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BtnBg','BtnBg',2},{'ImgQuality','ImgQuality',2},{'ImgIcon','ImgIcon',2},{'ImgCost','CoinPlane/ImgCost',2},{'StarPanel','StarPanel',2},{'ItemStarPrefab','StarPanel/ItemStarPrefab',2},{'HighLight','StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','StarPanel/ItemStarRoot',2},{'BtnSoldOut','BtnSoldOut',2},{'CommodityItem','CommodityItem',2},{'Img_Kuang','CommodityItem/Img_Kuang',2},{'Img_Icon','CommodityItem/Img_Icon',2},{'Img_SoldOut','CommodityItem/Img_SoldOut',2},{'Img_Name','CommodityItem/Img_Name',2},{'Img_ShengYu','CommodityItem/Img_ShengYu',2},{'Img_Coin','CommodityItem/Img_Coin',2},{'HuobiIcon','CommodityItem/Img_Coin/CoinPlane/HuobiIcon',2},{'StarPanel01','CommodityItem/StarPanel',2},{'ItemStarPrefab01','CommodityItem/StarPanel/ItemStarPrefab',2},{'HighLight01','CommodityItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot01','CommodityItem/StarPanel/ItemStarRoot',2},
        -- UITemplate 列表
        {'PlotReviewShopItem','/',10},
        -- TextMeshProUGUI 列表
        {'TextName','TextName',20},{'TextCount','TextCount',20},{'TextCost','CoinPlane/TextCost',20},{'Text_CantBuy','CommodityItem/Img_SoldOut/Text_CantBuy',20},{'Text_Name','CommodityItem/Img_Name/Text_Name',20},{'Text_ShengYu','CommodityItem/Img_ShengYu/Text_ShengYu',20},{'Text_JiaGe','CommodityItem/Img_Coin/CoinPlane/Text_JiaGe',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.BtnBg().gameObject, Handle(self, self.OnBtnClicked));
    UIEvent.LuaClick(self.BtnSoldOut().gameObject, Handle(self, function()
    end));
end
function M:OnUpdateUI(pData)
    self.m_itemData = pData[1];
    self.ItemStarPrefab().gameObject:SetActive(false)
    self.TextName().text = self.m_itemData.name
    MgrRes.LoadSprite(self.ImgIcon(), self.m_itemData.icon)
    -----道具品质
    --MgrRes.LoadSprite(_ImgBack,"Activity/HalfAnniversary/Img_Shopkuangdi"..self.m_itemData.rank)
    --MgrRes.LoadSprite(_ImgTitleBack,"Activity/HalfAnniversary/Img_ShopNamedi"..self.m_itemData.rank)

    if self.m_itemData.shopType2 == 100 then
        local price
        local priceGoods = self.m_itemData:GetPrice()
        local priceIcon = string.format("Item/%s",Global.GetLocalDataByGoods(priceGoods).icon)
        MgrRes.LoadSprite(self.ImgCost(), priceIcon)
        ---策划需求 100008商品直接读数目
        if self.m_itemData:GetPrice().goodsID == 100008 then
            self.TextCost().text = JNStrTool.numberAbbr(priceGoods.goodsNum)
        else
            for i,v in pairs(PaidgoodsLocalData.tab) do
                ---找到价格
                if v[3] == self.m_itemData.id then
                    price = v[8]
                    break
                end
            end
            self.TextCost().text = price
        end
    else
        local priceGoods = self.m_itemData:GetPrice()
        self.TextCost().text = JNStrTool.numberAbbr(priceGoods.goodsNum)
        local priceIcon = string.format("Item/%s",Global.GetLocalDataByGoods(priceGoods).icon)
        MgrRes.LoadSprite(self.ImgCost(), priceIcon)
    end

    if self.m_itemData.buyMaxCount ~= 0 then
        if not SysLockControl.CheckSysLock(self.m_itemData.buyLimit) then
            self.BtnSoldOut().gameObject:SetActive(true)
        elseif self.m_itemData.buyMaxCount - self.m_itemData.buyCount == 0 then
            self.BtnSoldOut().gameObject:SetActive(true)
        else
            self.BtnSoldOut().gameObject:SetActive(false)
        end
    else
        ---检查该商品是否满足解锁条件
        if self.m_itemData.buyLimit ~= 0 then
            if SysLockControl.CheckSysLock(self.m_itemData.buyLimit) == false then
                --self.ShopCanvasGroup.alpha = 0.5
                self.BtnSoldOut().gameObject:SetActive(true)
            else
                --self.ShopCanvasGroup.alpha = 1
                self.BtnSoldOut().gameObject:SetActive(false)
            end
        else
            --self.ShopCanvasGroup.alpha = 1
            self.BtnSoldOut().gameObject:SetActive(false)
        end
    end

    if self.m_itemData.buyMaxCount == 0 then
        self.TextCount().text = MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limitless")
    else
        self.TextCount().text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limit"),self.m_itemData.buyMaxCount - self.m_itemData.buyCount)
    end

    if self.m_itemData:GetBuyItem() ~= {} and self.m_itemData:GetBuyItem()[1].goodsType == 2 then
        self.StarPanel().gameObject:SetActive(true)
        local itemData = ItemControl.GetItemByIdAndType(self.m_itemData.ladderItems[0][1].goodsID,self.m_itemData.ladderItems[0][1].goodsType)
        --大于0更新星级显示
        if itemData.star > 0 then
            if self.ItemStarRoot().transform.childCount > 0 then
                Tools.ClearAllChild(self.ItemStarRoot().gameObject)
            end
            ---初始化最大星级
            for i = 1, 6 do
                local obj = GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,false)
                obj.gameObject:SetActive(true)
                local starHLObj = obj.transform:Find("HighLight").gameObject
                starHLObj:SetActive(i <= itemData.star)
            end
        end
    else
        self.StarPanel().gameObject:SetActive(false)
    end
end
function M:OnBtnClicked()
    ---为0表示没有解锁条件
    if self.m_itemData.buyLimit ~= 0 then
        ---如果此商品未解锁
        if SysLockControl.CheckSysLock(self.m_itemData.buyLimit) == false then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(self.m_itemData.buyLimit)})
            return
        end
    end

    local price = self.m_itemData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
    local data = ItemControl.GetItemByIdAndType(price.goodsID,price.goodsType)      --手中持有的货币数量
    local pMax = math.floor(data.count / price.goodsNum)                        --最大可买数量
    local bMax = self.m_itemData.buyMaxCount - self.m_itemData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
    ---如果超过最大可买数量
    if self.m_itemData.buyMaxCount ~= 0 and self.m_itemData.buyCount + 1 > self.m_itemData.buyMaxCount then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1"),1},true)
        return
    end
    MgrUI.Pop(UID.BuyPop_UI,{self.m_itemData,function(count)
        ---没有货物数据或总价超出所持有的货币数
        if data == nil or price.goodsNum * count >  data.count then
            if data and data.id == 100000 then --只有是原初结晶才跳转到充值界面
                MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips6"),data.name),Handle(self, function()

                end),nil,2})
            else
                MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("shop_ui_buyfail1"),data.name)},true)
            end
            return
        end
        ShopViewModel.SendBuyGoods({self.m_itemData.id,count},function()
            Event.Go("PlotReviewShopRefresh");
        end)
    end,1,bMax,true,pMax},true)
    
end
return M