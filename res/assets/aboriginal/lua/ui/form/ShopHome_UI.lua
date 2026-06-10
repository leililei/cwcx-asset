-- Code Auto Create Begin
local M = Class('ShopHome_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ShopHome_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ShopHome_UI].prefab'
    self.Name = 'Form[ShopHome_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_Back','Btn_Back',2},{'ShopPanel','ShopPanel',2},{'Btn_SkinShop','ShopPanel/Btn_SkinShop',2},{'ShopLaberItem','ShopPanel/ShopLabel/ChildLoopScroll/ShopLaberItem',2},{'Img_Fenggexian','ShopPanel/Img_Fenggexian',2},{'Shop','ShopPanel/Shop',2},{'ShopItemScroll','ShopPanel/Shop/ShopFrame/ShopItemScroll',2},{'GiftShopItem','ShopPanel/Shop/ShopFrame/ShopItemScroll/GiftShopItem',2},{'ShopGoodsItem','ShopPanel/Shop/ShopFrame/ShopItemScroll/ShopGoodsItem',2},{'MonthCard','ShopPanel/MonthCard',2},{'Yueka','ShopPanel/MonthCard/Yueka',2},{'Btn_Goumai','ShopPanel/MonthCard/Yueka/Btn_Goumai',2},{'Img_Goumai','ShopPanel/MonthCard/Yueka/Btn_Goumai/Img_Goumai',2},{'PosterGirl','ShopPanel/MonthCard/PosterGirl',2},{'kanbanniang','ShopPanel/MonthCard/PosterGirl/kanbanniang',2},{'Img_Tiao','ShopPanel/MonthCard/PosterGirl/Img_Tiao',2},{'Img_Liangdian','ShopPanel/MonthCard/PosterGirl/Img_Liangdian',2},{'Img_Fromdi','ShopPanel/MonthCard/PosterGirl/Img_Fromdi',2},{'Img_Yuyindi','ShopPanel/MonthCard/PosterGirl/Yuyin/Img_Yuyindi',2},{'Img_Sanjiao','ShopPanel/MonthCard/PosterGirl/Yuyin/Img_Sanjiao',2},{'Yuyinicon','ShopPanel/MonthCard/PosterGirl/Yuyin/Yuyinicon',2},{'TiliMonthCard','ShopPanel/TiliMonthCard',2},{'TiliBg','ShopPanel/TiliMonthCard/TiliBg',2},{'BtnBuyTili','ShopPanel/TiliMonthCard/TiliBg/BtnBuyTili',2},{'Img_Goumai01','ShopPanel/TiliMonthCard/TiliBg/BtnBuyTili/Img_Goumai',2},{'TiliPosterGirl','ShopPanel/TiliMonthCard/TiliPosterGirl',2},{'kanbanniang01','ShopPanel/TiliMonthCard/TiliPosterGirl/kanbanniang',2},{'Img_Tiao01','ShopPanel/TiliMonthCard/TiliPosterGirl/Img_Tiao',2},{'Img_Liangdian01','ShopPanel/TiliMonthCard/TiliPosterGirl/Img_Liangdian',2},{'Img_Fromdi01','ShopPanel/TiliMonthCard/TiliPosterGirl/Img_Fromdi',2},{'Img_Yuyindi01','ShopPanel/TiliMonthCard/TiliPosterGirl/Yuyin/Img_Yuyindi',2},{'Img_Sanjiao01','ShopPanel/TiliMonthCard/TiliPosterGirl/Yuyin/Img_Sanjiao',2},{'Yuyinicon01','ShopPanel/TiliMonthCard/TiliPosterGirl/Yuyin/Yuyinicon',2},{'confirmBuyPanel','confirmBuyPanel',2},{'confirmMask','confirmBuyPanel/confirmMask',2},{'Img_Xian22','confirmBuyPanel/Img_Xian22',2},{'Img_Xian11','confirmBuyPanel/Img_Xian11',2},{'Img_Tanchuangdi','confirmBuyPanel/Img_Tanchuangdi',2},{'Btn_confirm','confirmBuyPanel/Img_Tanchuangdi/Btn_confirm',2},{'Img_Quedingdi','confirmBuyPanel/Img_Tanchuangdi/Btn_confirm/Img_Quedingdi',2},{'Btn_cancel','confirmBuyPanel/Img_Tanchuangdi/Btn_cancel',2},{'Img_Quxiaodi','confirmBuyPanel/Img_Tanchuangdi/Btn_cancel/Img_Quxiaodi',2},{'Yueka01','confirmBuyPanel/Img_Tanchuangdi/Yueka',2},{'jiaobiao','confirmBuyPanel/Img_Tanchuangdi/Yueka/jiaobiao',2},{'Icon','confirmBuyPanel/Img_Tanchuangdi/Yueka/Icon',2},{'Chongfugoumai','confirmBuyPanel/Img_Tanchuangdi/Yueka/Chongfugoumai',2},{'Likehuode','confirmBuyPanel/Img_Tanchuangdi/Panel/Likehuode',2},{'Content1','confirmBuyPanel/Img_Tanchuangdi/Panel/Content1',2},{'Meirihuode','confirmBuyPanel/Img_Tanchuangdi/Panel/Meirihuode',2},{'Content2','confirmBuyPanel/Img_Tanchuangdi/Panel/Content2',2},{'fengexian2','confirmBuyPanel/Img_Tanchuangdi/Text_Title/fengexian2',2},{'WupinPrefab','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab',2},{'wpGo','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/wpGo',2},{'WupinIcon','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/wpGo/WupinIcon',2},{'Img_ItemCountPivot','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/wpGo/Img_ItemCountPivot',2},{'Img_ItemCountBg_Wp','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/wpGo/Img_ItemCountPivot/Img_ItemCountBg_Wp',2},{'StarPanel','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel',2},{'EmptyStarRoot','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/EmptyStarRoot',2},{'EmptyStar','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab0','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/StarPanel/ItemStarRoot/ItemStarPrefab0',2},
        -- Text 列表
        {'Text_Yuyin','ShopPanel/MonthCard/PosterGirl/Yuyin/Text_Yuyin',3},{'Text_Yuyin01','ShopPanel/TiliMonthCard/TiliPosterGirl/Yuyin/Text_Yuyin',3},
        -- UITemplate 列表
        {'ShopLaberItem01','ShopPanel/ShopLabel/ChildLoopScroll/ShopLaberItem',10},{'GiftShopItem01','ShopPanel/Shop/ShopFrame/ShopItemScroll/GiftShopItem',10},{'ShopGoodsItem01','ShopPanel/Shop/ShopFrame/ShopItemScroll/ShopGoodsItem',10},
        -- Toggle 列表
        {'ShopLaberItem02','ShopPanel/ShopLabel/ChildLoopScroll/ShopLaberItem',13},
        -- RawImage 列表
        {'ChildLoopScroll','ShopPanel/ShopLabel/ChildLoopScroll',15},{'Content','ShopPanel/Shop/ShopFrame/ShopItemScroll/Content',15},
        -- LoopScrollRect 列表
        {'ChildLoopScroll01','ShopPanel/ShopLabel/ChildLoopScroll',18},{'ShopItemScroll01','ShopPanel/Shop/ShopFrame/ShopItemScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_SkinShop','ShopPanel/Btn_SkinShop/Text_SkinShop',20},{'Text_Goumai','ShopPanel/MonthCard/Yueka/Btn_Goumai/Img_Goumai/Text_Goumai',20},{'Text_DayRemaining','ShopPanel/MonthCard/Yueka/Text_DayRemaining',20},{'Text_JIYA','ShopPanel/MonthCard/PosterGirl/Text_JIYA',20},{'Text_From','ShopPanel/MonthCard/PosterGirl/Img_Fromdi/Text_From',20},{'Text_Goumai01','ShopPanel/TiliMonthCard/TiliBg/BtnBuyTili/Img_Goumai/Text_Goumai',20},{'TextTiliRemaining','ShopPanel/TiliMonthCard/TiliBg/TextTiliRemaining',20},{'Text_JIYA01','ShopPanel/TiliMonthCard/TiliPosterGirl/Text_JIYA',20},{'Text_From01','ShopPanel/TiliMonthCard/TiliPosterGirl/Img_Fromdi/Text_From',20},{'Text_confirm','confirmBuyPanel/Img_Tanchuangdi/Btn_confirm/Text_confirm',20},{'Text_cancel','confirmBuyPanel/Img_Tanchuangdi/Btn_cancel/Text_cancel',20},{'Text_Xiaohao','confirmBuyPanel/Img_Tanchuangdi/Yueka/Text_Xiaohao',20},{'Text_Chongfugoumai','confirmBuyPanel/Img_Tanchuangdi/Yueka/Chongfugoumai/Text_Chongfugoumai',20},{'Text_Likehuode','confirmBuyPanel/Img_Tanchuangdi/Panel/Likehuode/Text_Likehuode',20},{'Text_Meirihuode','confirmBuyPanel/Img_Tanchuangdi/Panel/Meirihuode/Text_Meirihuode',20},{'Text_Title','confirmBuyPanel/Img_Tanchuangdi/Text_Title',20},{'ItemRemainText','confirmBuyPanel/Img_Tanchuangdi/WupinPrefab/wpGo/Img_ItemCountPivot/Img_ItemCountBg_Wp/ItemRemainText',20},
    }
end
-- Code Auto Create End
require("LocalData/LimttimegoodsLocalData")
function M:OnInit()
    self.ShopType = 0
    -- 由 ShopLaberItem 访问 Parent 设置
    self.ChildBtnList = {}
    self.curShopId = 0  --当前商店id
    self:InitBtn()
    self:InitPaidItem()
    Event.Add("ShopHome_UI_ReloadScroll", Handle(self, self.OnReloadScroll))
    ---隐藏购买确认弹窗
    self.confirmBuyPanel().gameObject:SetActive(false)
end

function M:OnReloadScroll()
    self:ReloadScroll()
    -- 不能刷新，会导致页签列表倒置
    --self:ReloadChildScroll()
    self.ChildLoopScroll01():RefreshCells()
end

function M:RefillCells(offset)
    self.ShopItemScroll01().totalCount =#self.PaidItemList
    if offset then
        self.ShopItemScroll01():RefillCells(offset)
    else
        self.ShopItemScroll01():RefreshCells()
    end
end

---参数1：关闭回调
function M:OnShow(pArg)
    local callBack = pArg[1]
    if callBack then
        callBack(self.ShopType)
    end
    HomeViewModel.CheckPackagesPop()
end

function M:InitBtn()
    ---皮肤商店
    UIEvent.LuaClick(self.Btn_SkinShop().gameObject,function()
        MgrLink.LinkStart("tz_sc_zbsd_01",function()
            MgrUI.ClosePop(self.Uid)
        end)
    end)
    ---购买月卡
    UIEvent.LuaClick(self.Btn_Goumai().gameObject,function()
        self.m_monthCardProduct = 110000;
        self.m_monthCardLimit = 111000;
        self.m_monthCardRemaining = PlayerControl.GetPlayerData().monthCardRemaining;
        self:ReConfirmPanel(111011, 111004, PlayerControl.GetPlayerData().monthCardRemaining, 110000)
        self.confirmBuyPanel().gameObject:SetActive(true)
    end)
    ---购买体力月卡
    UIEvent.LuaClick(self.BtnBuyTili().gameObject,function()
        self.m_monthCardProduct = tonumber(SteamLocalData.tab[111029][2]);
        self.m_monthCardLimit = 111023;
        self.m_monthCardRemaining = PlayerControl.GetPlayerData():GetNewMonthCardRemaining(110003);
        self:ReConfirmPanel(111031, 111025, PlayerControl.GetPlayerData():GetNewMonthCardRemaining(110003), self.m_monthCardProduct)
        self.confirmBuyPanel().gameObject:SetActive(true)
    end)
    ---点击确认购买背景
    UIEvent.LuaClick(self.confirmMask().gameObject,function()
        self.confirmBuyPanel().gameObject:SetActive(false)
    end)
    ---确认购买
    UIEvent.LuaClick(self.Btn_confirm().gameObject,function()
        ---剩余天数大于SteamLocalData.tab[111000]不可购买
        if self.m_monthCardRemaining + 30 >= tonumber(SteamLocalData.tab[self.m_monthCardLimit][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_monthcard_error1"),1},true)
            return
        end
        ShopViewModel.FlyFunBuyGoods(self.m_monthCardProduct,function()
            Event.Go("ShopHome_UI_ReloadScroll")
        end)
    end)
    ---取消购买
    UIEvent.LuaClick(self.Btn_cancel().gameObject,function()
        self.confirmBuyPanel().gameObject:SetActive(false)
    end)
end

function M:InitPaidItem()
    ---注册滑块
    self.ShopItemScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.ChildLoopScroll01():SetLuaCellEvent(Handle(self,self.ChildCellItem))
    self:ReloadChildScroll()
    ---每个toggle都注册事件
    for i, v in pairs(self.ChildBtnList) do
        Tools.ToggleValueChange(v,function(isOn)
            if isOn then
                self:SetCurrentShop(i)
            end
        end)
    end
    ---触发已经勾选的 Toggle 回调，避免缺失事件逻辑
    self:InvokeOnShopToggleCallback()
    ---跳转
    if ShopViewModel.Page and self.ChildBtnList[ShopViewModel.Page.ChildShopID] ~= nil then
        MgrTimer.AddDelayNoName(0.03,function()
            self.ChildBtnList[ShopViewModel.Page.ChildShopID].isOn = true
        end)
    end
end

--刷新限时礼包红点
function M:UpdateTimeGiftRedDot(shopID)
    -- 目前仅免费礼包显示红点，这里不需要记录礼包
    --if shopID == 102 then
    --    -- 免费礼包只要能购买就显示，这里不能直接隐藏红点
    --    --self.ChildBtnList[shopID].transform:Find("RedDot").gameObject:SetActive(false)
    --
    --    for k,v in pairs(ShopViewModel.GetShopHomeList()) do
    --        if v.id == 102 then
    --            local list = ShopViewModel.SortItemData(v)
    --            for index, value in ipairs(list) do--写入商城限时礼包
    --                UnityEngine.PlayerPrefs.SetString(string.format("%sStoreTimeGift%s", PlayerControl.GetPlayerData().UID, value.id), value.id)
    --            end
    --            break
    --        end
    --    end
    --end
end

---item回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.PaidItemList[idx],idx,self,function()
        Event.Go("OpenChargeUI",true)
        Event.Go("OpenShopHome",false)
        Event.Go("TogOn","Tog_ShopHome",false)
        Event.Go("TogOn","Tog_Recharge",true)
    end})
end
function M:ChildCellItem(trans,idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({self.ChildShopList[idx],idx, self})
end

---刷新商品
function M:ReloadScroll()
    if self.ObjRoot == nil then
        return
    end
    if self.curShopId == 99 then  --月卡
        self.MonthCard().gameObject:SetActive(true)
        self.TiliMonthCard().gameObject:SetActive(false);
        self.Shop().gameObject:SetActive(false)
        self.PosterGirl().gameObject:SetActive(true)
        self:RefreshMonthCard()
    elseif self.curShopId == 98 then  --体力月卡
        self.MonthCard().gameObject:SetActive(false);
        self.Shop().gameObject:SetActive(false);
        self.TiliMonthCard().gameObject:SetActive(true);
        self:RefreshTiliMonthCard()
    else
        self.MonthCard().gameObject:SetActive(false)
        self.TiliMonthCard().gameObject:SetActive(false);
        self.Shop().gameObject:SetActive(true)
        self.PosterGirl().gameObject:SetActive(false)
        local shopHomeList =  ShopViewModel.GetShopHomeList()
        local newList = {}
        for i,v in ipairs(shopHomeList) do
            if v.id == 101 then
                if #HomeViewModel.packageList == 0 then     ---没有限时礼包
                v = nil
                end
            end
            if v ~= nil then
                table.insert(newList,v)
            end
        end
        shopHomeList = newList
        for k,v in pairs(shopHomeList) do
            if v.id == self.curShopId then
                self.PaidItemList = ShopViewModel.SortItemData(v)
                if v.id == 100 or v.id == 102 then
                    self.PaidItemList = self:SortToEnd(self.PaidItemList)
                end
                if v.id == 101 then --特别礼包限时特价
                    self.PaidItemList = self:SortPackage(self.PaidItemList)
                end
                break
            end
        end
        self.ShopItemScroll01().totalCount = #self.PaidItemList
        self.ShopItemScroll01():RefillCells(0)
    end
end
--存在打折礼包时，隐藏原价礼包/打折力保过期，删除打折礼包
function M:SortPackage(list)
    local newTable = {}
    for k,value in ipairs(list) do  ---@param value ShopItemData
        for i, v in ipairs(HomeViewModel.packageList) do
            if value.id == v.ID and not v.Status then
                value.sellETime = v.endTime
                newTable[#newTable + 1] = value
            end
        end
    end
    return newTable
end
--礼包购买过放在后面
function M:SortToEnd(list)
    local t = {}
    for i, v in ipairs(list) do
        if v.buyMaxCount - v.buyCount ~= 0 then
            table.insert(t,v)
        end
    end
    for i, v in ipairs(list) do
        if v.buyMaxCount - v.buyCount == 0 then
            table.insert(t,v)
        end
    end
    local newTable = {}
    for i,v in ipairs(t) do
        if Global.isMiddleTime(v.sellSTime,v.sellETime) then
            table.insert(newTable,v)
        end
    end
    return newTable
end

---刷新月卡
function M:RefreshMonthCard()
    local remainDay = PlayerControl.GetPlayerData().monthCardRemaining
    self.Text_DayRemaining().text = remainDay .. MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
end

function M:RefreshTiliMonthCard()
    local remainDay = PlayerControl.GetPlayerData():GetNewMonthCardRemaining(110003);
    self.TextTiliRemaining().text = remainDay .. MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
end

---刷新月卡确认购买面板
function M:ReConfirmPanel(award, dayAward, remain, productId)
    ---清理子物体
    Tools.ClearAllChild(self.Content1().gameObject)
    Tools.ClearAllChild(self.Content2().gameObject)
    ---隐藏模板
    self.WupinPrefab().gameObject:SetActive(false)
    self.Text_Chongfugoumai().text = string.format(MgrLanguageData.GetLanguageByKey("ui_monthcard_txt9"), 
            math.floor(tonumber(SteamLocalData.tab[self.m_monthCardLimit][2]) / 30) .. "");
    ---购买立刻获得
    local awardStr = string.split(SteamLocalData.tab[award][2],",")
    for k,v in pairs(awardStr) do
        local obj = GameObject.Instantiate(self.WupinPrefab().gameObject,self.Content1().gameObject.transform, false)
        obj:SetActive(true)
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
        local icon = CJNUIMgr.GetSunUseName(obj,"WupinIcon").transform:GetComponent("Image")
        local count = CJNUIMgr.GetSunUseName(obj,"ItemRemainText").transform:GetComponent("TextMeshProUGUI")
        local frame = CJNUIMgr.GetSunUseName(obj,"wpGo").transform:GetComponent("Image")
        local starPanel = CJNUIMgr.GetSunUseName(obj,"StarPanel")
        ---物品图片
        MgrRes.LoadSprite(icon,item.icon)
        ---边框
        MgrRes.LoadSprite(frame,"Item/Rank/ItemRank_"..item.quality)
        ---数量文本
        count.text = tonumber(string.split(v,"_")[3])
        starPanel:SetActive(false) --暂时不显示星级
        ---点击事件
        UIEvent.LuaClick(obj,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{ item, false},true)
        end)
    end
    ---每日可获得
    local dayAwardStr = string.split(SteamLocalData.tab[dayAward][2],",")
    for k,v in pairs(dayAwardStr) do
        local obj = GameObject.Instantiate(self.WupinPrefab().gameObject,self.Content2().gameObject.transform, false)
        obj:SetActive(true)
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
        local icon = CJNUIMgr.GetSunUseName(obj,"WupinIcon").transform:GetComponent("Image")
        local count = CJNUIMgr.GetSunUseName(obj,"ItemRemainText").gameObject.transform:GetComponent("TextMeshProUGUI")
        local frame = CJNUIMgr.GetSunUseName(obj,"wpGo").transform:GetComponent("Image")
        local starPanel = CJNUIMgr.GetSunUseName(obj,"StarPanel")
        ---物品图片
        MgrRes.LoadSprite(icon,item.icon)
        ---边框
        MgrRes.LoadSprite(frame,"Item/Rank/ItemRank_"..item.quality)
        ---数量文本
        count.text = tonumber(string.split(v,"_")[3])
        starPanel:SetActive(false) --暂时不显示星级
        ---点击事件
        UIEvent.LuaClick(obj,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{ item, false},true)
        end)
    end

    ---月卡剩余天数
    local remainDay = remain
    ---月卡价格
    local card = ShopControl.GetSingLeShopItemData(productId)
    self.Text_Xiaohao().text = string.format(MgrLanguageData.GetLanguageByKey("ui_monthcard_txt1"), card.name, remainDay)
    MgrRes.LoadSprite(self.Icon(), card.icon);
    if card:GetPrice().goodsID == 100008 then
        self.Text_confirm().text = MgrLanguageData.GetLanguageByKey("ui_monthcard_txt8")..JNStrTool.numberAbbr(card:GetPrice().goodsNum)
    else
        for i,v in pairs(PaidgoodsLocalData.tab) do
            ---找到价格
            if v[3] == card.id then
                self.Text_confirm().text = MgrLanguageData.GetLanguageByKey("ui_monthcard_txt8")..v[8]
                break
            end
        end
    end
end

function M:ReloadChildScroll()
    local list = {}
    for k,v in pairs(ShopViewModel.GetShopHomeList()) do
        if v.id == 102 then
            list = ShopViewModel.SortItemData(v)
            break
        end
    end

    self.ChildShopList = ShopViewModel.GetShopHomeList()
    for i, v in ipairs(self.ChildShopList) do
        if v.id == 102 and #list == 0 then
            self.ChildShopList[i] = nil
        end
        local empty = true
        for _,value in pairs(v.shopItems) do
            empty = false
        end
        if empty then
            self.ChildShopList[i] = nil
        end
    end

    ---重排list
    local newList = {}
    local showDiscountLabel = false
    for i,v in ipairs(self.ChildShopList) do
        if v.id == 101 then
            if #HomeViewModel.packageList == 0 then     ---没有限时礼包
                v = nil
            else
                for i,v in pairs(HomeViewModel.packageList) do
                    if (v.Duration ~= -1 and v.endTime > Global.GetCurTime() and not v.Status) or (v.Duration == -1 and not v.Status) then
                        showDiscountLabel = true
                        break
                    end
                end
                if not showDiscountLabel then
                    v = nil
                end
            end
        end
        if v ~= nil then
            for j,value in pairs(v.shopItems) do
                if Global.isMiddleTime(value.sellSTime, value.sellETime) and (value.buyMaxCount == 0 or value.buyCount < value.buyMaxCount) then
                    newList[#newList + 1] = v
                    break
                end
            end
        end
    end
    self.ChildShopList = newList
    self.ChildLoopScroll01().totalCount = #self.ChildShopList
    self.ChildLoopScroll01():RefillCells()
end

function M:OnClose()
    Event.Remove("ShopHome_UI_ReloadScroll", Handle(self, self.OnReloadScroll))
end

--region 控件操作
---@param shopId int
function M:SetCurrentShop(shopId)
    self.curShopId = shopId
    self:ReloadScroll()
    self:UpdateTimeGiftRedDot(self.curShopId)
end

--- 触发已经勾选的商店子页签回调
--- 原本打开界面，所有 Toggle 都为 false，依赖 ToggleGroup 的检查会触发事件
--- 但不知道为什么，从其他商店页面切回推荐页面，然后关闭商城，下次打开
--- 第一个 Toggle 就是 true，导致不会触发事件
function M:InvokeOnShopToggleCallback()
    ---@param v UnityEngine.UI.Toggle
    for i, v in pairs(self.ChildBtnList) do
        if v.isOn then
            self:SetCurrentShop(i)
            break
        end
    end
end
--endregion 控件操作

return M