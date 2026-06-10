-- Code Auto Create Begin
local M = Class('BuyPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BuyPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BuyPop_UI].prefab'
    self.Name = 'Form[BuyPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'zuanshi','zuanshi',2},{'Btn_zs','zuanshi/Btn_zs',2},{'HuobiIcon','zuanshi/HuobiIcon',2},{'Img_Xian11','Img_Xian11',2},{'Img_Xian22','Img_Xian22',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Btn_confirm','Btn_confirm',2},{'Img_Quedingdi','Btn_confirm/Img_Quedingdi',2},{'Btn_cancel','Btn_cancel',2},{'Img_Quxiaodi','Btn_cancel/Img_Quxiaodi',2},{'LibaoPanel','LibaoPanel',2},{'Countdi','LibaoPanel/Countdi',2},{'LibaoScrollItem2','LibaoPanel/LibaoScrollItem2',2},{'Img_Baohandi','LibaoPanel/Img_Baohandi',2},{'LibaoMask','LibaoPanel/LibaoScroll/LibaoMask',2},{'LibaoScrollContent','LibaoPanel/LibaoScroll/LibaoMask/LibaoScrollContent',2},{'Huadongtiaodi','LibaoPanel/LibaoScroll/Huadongtiaodi',2},{'Huadongtiao','LibaoPanel/LibaoScroll/Huadongtiao',2},{'ScrollbarHorizontal','LibaoPanel/LibaoScroll/Scrollbar Horizontal',2},{'Handle','LibaoPanel/LibaoScroll/Scrollbar Horizontal/Sliding Area/Handle',2},{'WupinPanel','WupinPanel',2},{'Numberdi','WupinPanel/BuyCount/Numberdi',2},{'Btn_Max','WupinPanel/BuyCount/Btn_Max',2},{'Img_Anniudi2','WupinPanel/BuyCount/Btn_Max/Img_Anniudi2',2},{'Btn_Add','WupinPanel/BuyCount/Btn_Add',2},{'+di','WupinPanel/BuyCount/Btn_Add/+di',2},{'+','WupinPanel/BuyCount/Btn_Add/+',2},{'Btn_Minus','WupinPanel/BuyCount/Btn_Minus',2},{'-di','WupinPanel/BuyCount/Btn_Minus/-di',2},{'-','WupinPanel/BuyCount/Btn_Minus/-',2},{'Btn_Min','WupinPanel/BuyCount/Btn_Min',2},{'Img_Anniudi1','WupinPanel/BuyCount/Btn_Min/Img_Anniudi1',2},{'wpGo','WupinPanel/wpGo',2},{'WupinIcon','WupinPanel/wpGo/WupinIcon',2},{'Img_ItemCountPivot','WupinPanel/wpGo/Img_ItemCountPivot',2},{'Img_ItemCountBg_Wp','WupinPanel/wpGo/Img_ItemCountPivot/Img_ItemCountBg_Wp',2},{'WpCountdi','WupinPanel/WpCountdi',2},{'StarPanel','WupinPanel/StarPanel',2},{'EmptyStarRoot','WupinPanel/StarPanel/EmptyStarRoot',2},{'EmptyStar','WupinPanel/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','WupinPanel/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','WupinPanel/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','WupinPanel/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','WupinPanel/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','WupinPanel/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','WupinPanel/StarPanel/ItemStarRoot',2},{'ItemStarPrefab0','WupinPanel/StarPanel/ItemStarRoot/ItemStarPrefab0',2},{'TitleArea','TitleArea',2},{'Xiaohao','Xiaohao',2},{'currencyIcon','Xiaohao/currencyIcon',2},
        -- UITemplate 列表
        {'LibaoScrollItem201','LibaoPanel/LibaoScrollItem2',10},
        -- LoopScrollRect 列表
        {'LibaoScroll','LibaoPanel/LibaoScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_huobiCount','zuanshi/Text_huobiCount',20},{'Text_confirm','Btn_confirm/Text_confirm',20},{'Text_cancel','Btn_cancel/Text_cancel',20},{'Text_Libaobaohan','LibaoPanel/Text_Libaobaohan',20},{'Text_LimitedCount','LibaoPanel/Text_LimitedCount',20},{'Text_BuyCount','WupinPanel/BuyCount/Text_BuyCount',20},{'Text_Max','WupinPanel/BuyCount/Btn_Max/Text_Max',20},{'Text_Min','WupinPanel/BuyCount/Btn_Min/Text_Min',20},{'ItemRemainText','WupinPanel/wpGo/Img_ItemCountPivot/Img_ItemCountBg_Wp/ItemRemainText',20},{'Text_WpLimitedCount','WupinPanel/Text_WpLimitedCount',20},{'Text_Title','TitleArea/Text_Title',20},{'Text_Xiaohao','Xiaohao/Text_Xiaohao',20},{'Text_Price','Xiaohao/Text_Price',20},
    }
end
-- Code Auto Create End
require("LocalData/ItemLocalData")
require("LocalData/PaidgoodsLocalData")

function M:OnInit()
    ---初始化最大星级
    self.starHLObj = {}
    for i = 1, 6 do
        local obj = GameObject.Instantiate(self.ItemStarPrefab0().gameObject,self.ItemStarRoot().gameObject.transform,false)
        self.starHLObj[i] = obj.gameObject
    end
    self.ItemStarPrefab0().gameObject:SetActive(false)
end

function M:OnShow(args)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---@type ShopItemData
    self.pData = args[1]        ---商店数据
    self.callback = args[2]     ---确认回调函数
    self.CurCount = args[3]     ---要购买的数量
    self.MinCount = 1
    self.MaxCount = args[4]     ---剩余最大可买数量
    self.sellInGroup = args[5]  ---能否批量购买
    self.CloseCallBack = args[7]    ---取消回调

    if args[6] then
        self.couldBuy = args[6] ---最多能买的数量
    end
    self.LibaoScroll().totalCount = #self.pData.ladderItems[0]  ---滑动列表总数量
    if self.sellInGroup then --精英商店
        ---打开物品面板
        self:ShowWupin()
    else
        ---打开礼包面板
        self:ShowLibao()
    end
    ---边框颜色
    MgrRes.LoadSprite(self.wpGo(),"Item/Rank/ItemRank_"..self.pData.rank,nil,false)
    ---更换标题区域
    self.Text_Title().text = string.format(MgrLanguageData.GetLanguageByKey("buypop_ui_tips1"),self.pData.name)
    ---显示货币图标
    local currency = ItemControl.GetItemByIdAndType(self.pData:GetPrice()["goodsID"],self.pData:GetPrice()["goodsType"])
    if currency.goodsType == 4 and string.split(currency.icon, "/")[1] ~= "Item" then
        MgrRes.LoadSprite(self.currencyIcon(),"Item/"..currency.icon)
    else
        MgrRes.LoadSprite(self.currencyIcon(),currency.icon)
    end
    ---更换货币数量self.pData:GetPrice().goodsID == 100008
    if self.pData:GetPrice().goodsID == 100008 then
        if self.pData.sellType == 3 and not self.pData:IsDisCounting() then
            self.Text_Price().text = Global.GetSingleComparedText(ItemControl.GetItemByIdAndType(self.pData:GetOriginal()["goodsID"],self.pData:GetOriginal()["goodsType"]).count,self.pData:GetOriginal().goodsNum)
        else
            self.Text_Price().text = Global.GetSingleComparedText(ItemControl.GetItemByIdAndType(self.pData:GetPrice()["goodsID"],self.pData:GetPrice()["goodsType"]).count,self.pData:GetPrice().goodsNum)
        end
    elseif 114000 == self.pData.shopType or 114001 == self.pData.shopType then
        local newPrice = 0
        for i,v in pairs(PaidgoodsLocalData.tab) do
            ---找到价格
            if v[3] == self.pData.id then
                newPrice = v[8]
                break
            end
        end
        self.Text_Price().text = newPrice
    else
        self.Text_Price().text = Global.GetSingleComparedText(ItemControl.GetItemByIdAndType(self.pData:GetPrice()["goodsID"],self.pData:GetPrice()["goodsType"]).count,self.pData:GetPrice().goodsNum)
    end
    ---最大剩余数量
    if self.pData.buyMaxCount ~= 0 then
        self.Text_LimitedCount().text = MgrLanguageData.GetLanguageByKey("buypop_ui_tips2") .. self.MaxCount
    else
        self.Text_LimitedCount().text = MgrLanguageData.GetLanguageByKey("buypop_ui_tips2") .. MgrLanguageData.GetLanguageByKey("ui_tongyong_text104")
    end
    ---绑定确认事件
    if self.sellInGroup then
        UIEvent.LuaClick(self.Btn_confirm().gameObject,function()
            ---绑定买入事件
            self.callback(self.CurCount)
            Event.Remove("BackKey", Handle(self, self.OnBackKey))
            MgrUI.ClosePop(UID.BuyPop_UI)
        end)
    else
        UIEvent.LuaClick(self.Btn_confirm().gameObject,function()
            ---绑定买入事件
            self.callback()
            Event.Remove("BackKey", Handle(self, self.OnBackKey))
            MgrUI.ClosePop(UID.BuyPop_UI)
        end)
    end
    ---绑定取消事件
    UIEvent.LuaClick(self.Btn_cancel().gameObject,function()
        if self.CloseCallBack then
            self.CloseCallBack()
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.BuyPop_UI)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,{"ShopHome_UI"}) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.BuyPop_UI)
    end
end

function M:OnShowFinish()
    Tools.ReContentSizeFitter(self.TitleArea().gameObject)
end

function M:ReCountView()
    --self.Btn_Add().gameObject:SetActive(self.CurCount < self.MaxCount)
    --self.Btn_Minus().gameObject:SetActive(self.CurCount > self.MinCount)
    self.Text_BuyCount().text = self.CurCount
    ---货币不够标红

    self.pData:GetPrice()
    ---计算消耗货币
    self.Text_Price().text = Global.GetSingleComparedText(ItemControl.GetItemByIdAndType(self.pData:GetPrice()["goodsID"],self.pData:GetPrice()["goodsType"]).count,self.pData:GetPrice().goodsNum*self.CurCount,nil,false)

    self.ItemRemainText().text = JNStrTool.numberAbbr(self.CurCount * self.pData.ladderItems[0][1].goodsNum)
end
---打开礼包面板
function M:ShowLibao()
    self.LibaoPanel().gameObject:SetActive(true)
    self.WupinPanel().gameObject:SetActive(false)
    ---设置滑动列表总数
    self.LibaoScroll().totalCount = #self.pData.ladderItems[0]
    ---将礼包数据传入滑动列表,分配给每个小格子
    self.LibaoScroll():SetLuaCellEvent(function(trans,idx)
        trans:GetComponent("UITemplate"):SetData({self.pData.ladderItems[0][idx],idx,self})
    end)
    ---刷新滑动列表
    self.LibaoScroll():RefillCells()
    ---更换货币数量
    --local bag = ItemControl.GetAllItems()
    --self.Text_huobiCount().text = bag[self.pData:GetPrice()["goodsID"]] and bag[self.pData:GetPrice()["goodsID"]].count or 0
end
---打开物品面板
function M:ShowWupin()
    self.WupinPanel().gameObject:SetActive(true)
    self.LibaoPanel().gameObject:SetActive(false)
    ---更换物品图标
    MgrRes.LoadSprite(self.WupinIcon(),self.pData.icon,nil,false)
    self.Text_BuyCount().text = self.CurCount
    ---更新物品的剩余购买次数
    if self.pData.buyMaxCount == 0 then
        self.Text_WpLimitedCount().text = MgrLanguageData.GetLanguageByKey("buypop_ui_tips2") .. MgrLanguageData.GetLanguageByKey("ui_tongyong_text104")     --可无限购买
    else
        self.Text_WpLimitedCount().text = MgrLanguageData.GetLanguageByKey("buypop_ui_tips2") .. self.MaxCount    --剩余购买
    end
    ---初始化按钮
    self:InitCountBtn()
    ---更换货币数量
    --local bag = ItemControl.GetAllItems()
    --self.Text_huobiCount().text = bag[self.pData:GetPrice()["goodsID"]] and bag[self.pData:GetPrice()["goodsID"]].count or 0
    ---购买能获得的数量，非拥有数量
    self.ItemRemainText().text = self.pData.ladderItems[0][1].goodsNum
    ---打开Tips数据
    BagViewModel.ReloadCacheData()
    local tArr = BagViewModel.GetCacheArrayByType(self.pData.ladderItems[0][1].goodsType)
    if tArr ~= nil then
        for index,v in pairs(tArr) do
            if self.pData.ladderItems[0][1].goodsType == 5 then
                ---判断是否拥有该共鸣装备
                if v.equipID == self.pData.ladderItems[0][1].goodsID then
                    --self.ItemRemainText().text = "1"
                    ---点击打开详情
                    self.goodsData = ItemData.New()
                    self.goodsData:PushData(self.pData.ladderItems[0][1],ItemControl.PushEnum.none)
                    self.goodsData.count = 1
                    UIEvent.LuaClick(self.WupinIcon().gameObject,Handle(self,self.OnItemClick))
                    break
                end
            else
                ---判断是否拥有该道具
                if v.id == self.pData.ladderItems[0][1].goodsID then
                    --self.ItemRemainText().text = tostring(v.count)
                    ---点击打开详情
                    self.goodsData = v
                    UIEvent.LuaClick(self.WupinIcon().gameObject,Handle(self,self.OnItemClick))
                    break
                end
            end
        end
    end
    ---点击打开详情
    if self.goodsData == nil then       ---背包里没有
        self.goodsData = ItemData.New()
        self.goodsData:PushData(self.pData.ladderItems[0][1],ItemControl.PushEnum.none)
        self.goodsData.count = 0
        UIEvent.LuaClick(self.WupinIcon().gameObject,Handle(self,self.OnItemClick))
    end
    if self.pData.ladderItems[0][1].goodsType == 2 then
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

function M:LoopClick()
    if self.EndClick == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05, Handle(self, self.LoopClick), self.ObjRoot)
        self.IntClicking = true
        self.Int_LoopTimer = self.Int_LoopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.Int_LoopTimer > 5 then
            ---如果是增加
            if self.isAdd then
                if self.pData.buyMaxCount ~= 0 then
                    if self.CurCount < self.MaxCount then
                        self.CurCount = self.CurCount + 1
                    end
                else
                    if self.CurCount < self.couldBuy then
                        self.CurCount = self.CurCount + 1
                    end
                end
            else
                ---减少逻辑
                if self.CurCount > self.MinCount then
                    self.CurCount = self.CurCount - 1
                end
            end
            self:ReCountView()
        end
        ---按钮抬起 停止循环
        if bool_IsUp == false then
            self.EndClick = true
            self.IntClicking = false
            self.Int_LoopTimer = 0
        end
    end
end

---初始化按钮
function M:InitCountBtn()
    self.IntClicking = false  --是否在长按中
    self.EndClick = true      --是否结束长按
    self.Int_LoopTimer = 0    --长按时间
    self.isAdd = true         --是否是增加
    ---增加
    UIEvent.LuaPressClick(self.Btn_Add().gameObject, Handle(self, function()
        if self.IntClicking == true then  --如果已经在长按中
            return
        end
        self.IntClicking = true
        self.Int_LoopTimer = 0
        self.EndClick = false
        self.isAdd = true

        ---单次点击逻辑
        if self.pData.buyMaxCount ~= 0 then
            if self.CurCount < self.MaxCount then
                self.CurCount = self.CurCount + 1
            end
        else
            if self.CurCount < self.couldBuy then
                self.CurCount = self.CurCount + 1
            end
        end
        self:ReCountView()

        ---长按点击逻辑
        self:LoopClick()
    end))
    ---减少
    UIEvent.LuaPressClick(self.Btn_Minus().gameObject,function()
        if self.IntClicking == true then  --如果已经在长按中
            return
        end
        self.IntClicking = true
        self.Int_LoopTimer = 0
        self.EndClick = false
        self.isAdd = false

        ---单次点击逻辑
        if self.CurCount > self.MinCount then
            self.CurCount = self.CurCount - 1
        end
        self:ReCountView()

        ---长按逻辑
        self:LoopClick()
    end)
    ---最大
    UIEvent.LuaClick(self.Btn_Max().gameObject,function()
        if self.pData.buyMaxCount ~= 0 then
            self.CurCount = self.couldBuy
        else
            if self.couldBuy > 99999 then
                self.CurCount = 99999
            else
                self.CurCount = self.couldBuy
            end
        end
        ---如果不是无限购买
        if self.pData.buyMaxCount ~= 0 then
            if self.CurCount > self.MaxCount then
                self.CurCount = self.MaxCount
            end
        end
        if self.CurCount == 0 then
            self.CurCount = 1
        end
        self:ReCountView()
        Tools.ReContentSizeGroup(self.Xiaohao().gameObject)
    end)
    ---最小
    UIEvent.LuaClick(self.Btn_Min().gameObject,function()
        self.CurCount = self.MinCount
        self:ReCountView()
        Tools.ReContentSizeGroup(self.Xiaohao().gameObject)
    end)
end

function M:OnItemClick()
    MgrUI.Pop(UID.ItemDetailPop_UI,{self.goodsData, false, function()
        ---刷新物品缓存
        BagViewModel.ReloadCacheData()
        if self.parent ~= nil then
            ---刷新物品
            self.parent:ResetItemView(self.parent.ItemSortType,0)
        end
    end},true)
end

---获取可购买的最大数量
function M:GetCanBuyCount()
    local cost = self.pData:GetPrice()["goodsNum"]
    local coin = bag[self.pData:GetPrice()["goodsID"]] and bag[self.pData:GetPrice()["goodsID"]].count or 0
    if self.pData.buyMaxCount ~= 0 then
        for i = 1,self.MaxCount do
            if cost* i > coin then
                return i - 1
            end
        end
    else
        return 0
    end
end

return M