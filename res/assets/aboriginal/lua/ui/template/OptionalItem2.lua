-- Code Auto Create Begin
local M = Class('OptionalItem2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/OptionalItem2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'OptionalItem2','/',2},{'RewardRankImg','ItemPrefab/wupin/RewardRankImg',2},{'RewardIconImg','ItemPrefab/wupin/RewardIconImg',2},{'Img_ItemCountBg','ItemPrefab/wupin/Img_ItemCountBg',2},{'Img_Juesemingdi','Img_Juesemingdi',2},{'Btn_Chakan','Img_Juesemingdi/Btn_Chakan',2},{'Zhiyeicon','Zhiyeicon',2},{'Btn_Duihuan','Btn_Duihuan',2},{'Duihuandian','Btn_Duihuan/Duihuandian',2},{'Duihuanicon','Btn_Duihuan/Duihuandian/Duihuanicon',2},{'ItemStarRoot','StarPanel/ItemStarRoot',2},{'StarPrefab','StarPanel/ItemStarRoot/StarPrefab',2},{'StarPrefab(1)','StarPanel/ItemStarRoot/StarPrefab (1)',2},{'StarPrefab(2)','StarPanel/ItemStarRoot/StarPrefab (2)',2},
        -- UITemplate 列表
        {'OptionalItem201','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','ItemPrefab/wupin/Img_ItemCountBg/ItemCountText',20},{'Text_Jueseming','Img_Juesemingdi/Text_Jueseming',20},{'Text_Duihuancishu','Text_Duihuancishu',20},{'Text_Shuliang1','Text_Duihuancishu/Text_Shuliang1',20},{'Text_Shuliang','Btn_Duihuan/Duihuandian/Text_Shuliang',20},{'Text_Duihuan','Btn_Duihuan/Text_Duihuan',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Duihuan().gameObject,function()
        ---@type ShopItemData
        local tPrice = self.PData:GetPrice()
        local PriceData = ItemControl.GetItemByIdAndType(tPrice.goodsID,tPrice.goodsType)
        MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_drawexchange_text1"),tPrice.goodsNum,PriceData.name),Handle(self, function()
            local currency = ItemControl.GetItemByIdAndType(self.PData:GetPrice()["goodsID"],self.PData:GetPrice()["goodsType"])
            if self.PData.sellETime < MgrNet.GetServerTime() then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_tongyong_text227"),2},true)
                return
            end
            if currency.count < self.PData:GetPrice()["goodsNum"] then  --所需道具不足
                MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_supplyexchange_tips1"),currency.name)})
            else
                ShopViewModel.SendBuyGoods({self.PData.id,1},function()
                    self.parent:ReloadPropsScroll()
                    if self.callBack then
                        self.callBack()
                    end
                end)
            end
        end),nil,2})
    end)
end

function M:OnUpdateUI(args)
    self.PData = args[1]
    self.parent = args[2]
    self.callBack = args[3]

    MgrRes.LoadSprite(self.RewardRankImg(),"Item/Rank/ItemRank_"..self.PData.rank)
    MgrRes.LoadSprite(self.RewardIconImg(),self.PData.icon)
    self.Text_Jueseming().text = self.PData.name
    ---显示货币图标
    local currency = ItemControl.GetItemByIdAndType(self.PData:GetPrice()["goodsID"],self.PData:GetPrice()["goodsType"])
    if currency.goodsType == 4 and string.split(currency.icon, "/")[1] ~= "Item" then
        MgrRes.LoadSprite(self.Duihuanicon(),"Item/"..currency.icon)
    else
        MgrRes.LoadSprite(self.Duihuanicon(),currency.icon)
    end
    self.Text_Shuliang().text = "x "..self.PData:GetPrice()["goodsNum"]
    self.Text_Shuliang1().text = self.PData.buyMaxCount == 0 and MgrLanguageData.GetLanguageByKey("ui_tongyong_text104") or self.PData.buyMaxCount - self.PData.buyCount
    local buyItem = ItemControl.GetItemByIdAndType(self.PData:GetBuyItem()[1].goodsID,self.PData:GetBuyItem()[1].goodsType)
    print(buyItem)
    local roleData = RoleData.New((tonumber(string.split(buyItem.fall,"_")[2])))
    print(roleData)
    if buyItem.use == 8 then
        self.Zhiyeicon().gameObject:SetActive(false)
    else
        ---职业图标
        MgrRes.LoadSprite(self.Zhiyeicon(),roleData.iconCareer)
        self.Zhiyeicon().gameObject:SetActive(true)
    end
    -----星级
    --for i = 1, roleData.star do
    --    self.ItemStarRoot().transform:GetChild(i-1).gameObject:SetActive(true)
    --end

end

return M