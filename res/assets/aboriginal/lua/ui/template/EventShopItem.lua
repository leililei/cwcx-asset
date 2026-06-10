-- Code Auto Create Begin
local M = Class('EventShopItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/EventShopItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'EventShopItem','/',2},{'ShopItemPanel','ShopItemPanel',2},{'Img_Di','ShopItemPanel/Img_Di',2},{'Img_Lastday','ShopItemPanel/Img_Lastday',2},{'Img_Blue','ShopItemPanel/Img_Frame/Img_Blue',2},{'Img_Gold','ShopItemPanel/Img_Frame/Img_Gold',2},{'Img_Purple','ShopItemPanel/Img_Frame/Img_Purple',2},{'Img_Icon','ShopItemPanel/Img_Icon',2},{'Panel','ShopItemPanel/Panel/Text_Original/Panel',2},{'Img_PriceIcon','ShopItemPanel/Panel/Text_Original/Img_PriceIcon',2},{'Img_Count','ShopItemPanel/Img_Count',2},{'Img_Name','ShopItemPanel/Img_Name',2},{'Blueleft','ShopItemPanel/Img_Name/Img_Rare/Img_RarebBlue/Blueleft',2},{'Blueright','ShopItemPanel/Img_Name/Img_Rare/Img_RarebBlue/Blueright',2},{'Purpleleft','ShopItemPanel/Img_Name/Img_Rare/Img_RarebPurple/Purpleleft',2},{'Purpleright','ShopItemPanel/Img_Name/Img_Rare/Img_RarebPurple/Purpleright',2},{'Goldleft','ShopItemPanel/Img_Name/Img_Rare/Img_RarebGold/Goldleft',2},{'Goldright','ShopItemPanel/Img_Name/Img_Rare/Img_RarebGold/Goldright',2},{'Img_SoldOut','Img_SoldOut',2},{'Img_di','Img_SoldOut/Img_di',2},
        -- Text 列表
        {'Text_ReTime','ShopItemPanel/Text_ReTime',3},{'Text_Original','ShopItemPanel/Panel/Text_Original',3},{'Text_Price','ShopItemPanel/Panel/Text_Price',3},{'Text_Count','ShopItemPanel/Img_Count/Text_Count',3},{'Text_Name','ShopItemPanel/Img_Name/Text_Name',3},{'Text_Name01','Img_SoldOut/Text_Name',3},
        -- UITemplate 列表
        {'EventShopItem01','/',10},
        -- RawImage 列表
        {'Img_RarebBlue','ShopItemPanel/Img_Name/Img_Rare/Img_RarebBlue',15},{'Img_RarebPurple','ShopItemPanel/Img_Name/Img_Rare/Img_RarebPurple',15},{'Img_RarebGold','ShopItemPanel/Img_Name/Img_Rare/Img_RarebGold',15},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type ShopItemData
    self.pData = pData[1]
    self.parent = pData[2]

    ---品质
    self.Img_Blue().gameObject:SetActive(false)
    self.Img_Purple().gameObject:SetActive(false)
    self.Img_Gold().gameObject:SetActive(false)
    self.Img_RarebGold().gameObject:SetActive(false)
    self.Img_RarebPurple().gameObject:SetActive(false)
    self.Img_RarebBlue().gameObject:SetActive(false)
    if tonumber(self.pData.rank) == 1 or tonumber(self.pData.rank) == 2 then
        self.Img_Blue().gameObject:SetActive(true)
        self.Img_RarebBlue().gameObject:SetActive(true)
    elseif tonumber(self.pData.rank) == 3 then
        self.Img_Purple().gameObject:SetActive(true)
        self.Img_RarebPurple().gameObject:SetActive(true)
    elseif tonumber(self.pData.rank) == 4 then
        self.Img_Gold().gameObject:SetActive(true)
        self.Img_RarebGold().gameObject:SetActive(true)
    end

    ---图片
    MgrRes.LoadSprite(self.Img_Icon(),self.pData.icon)
    ---剩余时间
    self.Text_ReTime().text = MgrLanguageData.GetLanguageByKey("eventshopitem_surplus").. math.modf(self:RemainDays(MgrNet.GetServerTime(),self.pData.sellETime)) ..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")

    local originalGoods = self.pData:GetOriginal()
    if originalGoods ~= nil then
        self.Text_Original().text = JNStrTool.numberAbbr(originalGoods.goodsNum)--originalGoods.goodsNum >= 10000 and math.floor(originalGoods.goodsNum/1000).."K" or originalGoods.goodsNum
        self.Text_DisCount().text = string.format("-%.0f", (1 - priceGoods.goodsNum/originalGoods.goodsNum) * 100).."%"
    else
        self.Text_Original().text = ""
    end
    ---货币
    local tGood = self.pData:GetPrice()
    if string.split(ItemControl.GetItemByIdAndType(tGood.goodsID,4).icon,"/")[1] ~= "Item" then
        --不要在外面修改itemData的数据 一旦断线重连 重新推送数据 修改过的数据会被覆盖
        --ItemControl.GetItemByIdAndType(self.pData.ladderPrice[0].goodsID,4).icon = "Item/" .. ItemControl.GetItemByIdAndType(self.pData.ladderPrice[0].goodsID,4).icon
        MgrRes.LoadSprite(self.Img_PriceIcon(),"Item/" ..ItemControl.GetItemByIdAndType(tGood.goodsID,4).icon)
    else
        MgrRes.LoadSprite(self.Img_PriceIcon(),ItemControl.GetItemByIdAndType(tGood.goodsID,4).icon)
    end
    ---现价
    self.Text_Price().text = tGood.goodsNum
    ---剩余
    if self.pData.buyMaxCount ~= 0 then
        self.Text_Count().text = MgrLanguageData.GetLanguageByKey("eventshopitem_surpluscolor") .. self.pData.buyMaxCount - self.pData.buyCount .. "</color>"
    else
        self.Text_Count().text = MgrLanguageData.GetLanguageByKey("eventshopitem_surpluscolor2")
    end
    ---物品名
    self.Text_Name().text = self.pData.name
    ---是否已售罄
    if self.pData.buyMaxCount ~= 0 then
        if self.pData.buyCount >= self.pData.buyMaxCount then
            self.Img_SoldOut().gameObject:SetActive(true)
        else
            self.Img_SoldOut().gameObject:SetActive(false)
        end
    else
        self.Img_SoldOut().gameObject:SetActive(false)
    end
    
    self:BuyClickRegister()
end


---计算两日期差值
function M:RemainDays(time1,time2)
    local dif = math.abs(time2 - time1) / (3600*24)
    return dif
end
---购买点击注册
function M:BuyClickRegister()
    ---点击事件
    UIEvent.LuaClick(self.Img_Di().gameObject,function()
        ---商品告罄
        if self.pData.buyMaxCount ~= 0 and self.pData.buyCount >= self.pData.buyMaxCount then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1") ,1},true)
            return
        end
        if self.pData.isSellGroup then
            local price = self.pData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
            local data = ItemControl.GetItemByIdAndType(price.goodsID,price.goodsType)      --手中持有的货币数量
            local pMax = math.floor(data.count / price.goodsNum)                        --最大可买数量
            local bMax = self.pData.buyMaxCount - self.pData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
            --local maxCount = self.pData.buyMaxCount == 0 and pMax or (pMax < bMax and pMax or bMax)
            ---如果超过最大可买数量
            if self.pData.buyMaxCount ~= 0 and self.pData.buyCount + 1 > self.pData.buyMaxCount then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1") ,1},true)
                return
            end
            MgrUI.Pop(UID.BuyPop_UI,{self.pData,function(count)
                ---没有货物数据或总价超出所持有的货币数
                if data == nil or price.goodsNum * count >  data.count then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
                    return
                end
                ShopViewModel.SendBuyGoods({self.pData.id,count},function()
                    self.parent:ReloadData(0)
                    self.parent:Refresh()
                    self.parent:ChangeWallet()
                    self.parent.LastChildShop = 0
                end)
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
                ---没有货物数据或总价超出所持有的货币数
                if data == nil or price.goodsNum >  data.count then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
                    return
                end
                ShopViewModel.SendBuyGoods({self.pData.id,1},function()
                    self.parent:ReloadData(0)
                    self.parent:Refresh()
                    self.parent:ChangeWallet()
                    self.parent.LastChildShop = 0
                end)
            end,1,bMax,false},true)

        end
    end)
end

return M