-- Code Auto Create Begin
local M = Class('BuyDiscountPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BuyDiscountPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BuyDiscountPop_UI].prefab'
    self.Name = 'Form[BuyDiscountPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'zuanshi','zuanshi',2},{'Btn_zs','zuanshi/Btn_zs',2},{'HuobiIcon','zuanshi/HuobiIcon',2},{'Img_Xian11','Img_Xian11',2},{'Img_Xian22','Img_Xian22',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Btn_confirm','Btn_confirm',2},{'Img_Quedingdi','Btn_confirm/Img_Quedingdi',2},{'Btn_cancel','Btn_cancel',2},{'Img_Quxiaodi','Btn_cancel/Img_Quxiaodi',2},{'LibaoPanel','LibaoPanel',2},{'Countdi','LibaoPanel/Countdi',2},{'LibaoScrollItem2','LibaoPanel/LibaoScrollItem2',2},{'Img_Baohandi','LibaoPanel/Img_Baohandi',2},{'LibaoMask','LibaoPanel/LibaoScroll/LibaoMask',2},{'LibaoScrollContent','LibaoPanel/LibaoScroll/LibaoMask/LibaoScrollContent',2},{'Huadongtiaodi','LibaoPanel/LibaoScroll/Huadongtiaodi',2},{'Huadongtiao','LibaoPanel/LibaoScroll/Huadongtiao',2},{'ScrollbarHorizontal','LibaoPanel/LibaoScroll/Scrollbar Horizontal',2},{'Handle','LibaoPanel/LibaoScroll/Scrollbar Horizontal/Sliding Area/Handle',2},{'TitleArea','TitleArea',2},{'Xiaohao','Xiaohao',2},{'currencyIcon','Xiaohao/currencyIcon',2},{'ItemIcon','Xiaohao/ItemIcon',2},
        -- UITemplate 列表
        {'LibaoScrollItem201','LibaoPanel/LibaoScrollItem2',10},
        -- LoopScrollRect 列表
        {'LibaoScroll','LibaoPanel/LibaoScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_huobiCount','zuanshi/Text_huobiCount',20},{'Text_confirm','Btn_confirm/Text_confirm',20},{'Text_cancel','Btn_cancel/Text_cancel',20},{'Text_Libaobaohan','LibaoPanel/Text_Libaobaohan',20},{'Text_LimitedCount','LibaoPanel/Text_LimitedCount',20},{'Text_Title','TitleArea/Text_Title',20},{'Text_Xiaohao','Xiaohao/Text_Xiaohao',20},{'Text_Price','Xiaohao/Text_Price',20},{'Text_ItemName','Xiaohao/Text_ItemName',20},{'Text_ItemCount','Xiaohao/Text_ItemCount',20},
    }
end
-- Code Auto Create End
require("LocalData/ItemLocalData")
require("LocalData/PaidgoodsLocalData")

function M:OnShow(args)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---@type ShopItemData
    self.pData = args[1]        ---商店数据
    self.callback = args[2]     ---确认回调函数
    self.MinCount = 1
    self.MaxCount = args[3]     ---剩余最大可买数量
    self.CloseCallBack = args[4]    ---取消回调
    
    self.LibaoScroll().totalCount = #self.pData.ladderItems[0]  ---滑动列表总数量    
    ---打开礼包面板
    self:ShowLibao()
    ---更换标题区域
    self.Text_Title().text = string.format(MgrLanguageData.GetLanguageByKey("buypop_ui_tips1"),self.pData.name)
    ---显示货币图标
    local currency = ItemControl.GetItemByIdAndType(self.pData:GetPrice()["goodsID"],self.pData:GetPrice()["goodsType"])
    if currency.goodsType == 4 and string.split(currency.icon, "/")[1] ~= "Item" then
        MgrRes.LoadSprite(self.currencyIcon(),"Item/"..currency.icon)
    else
        MgrRes.LoadSprite(self.currencyIcon(),currency.icon)
    end
    
    local newPrice = 0
    local costStr = ""
    local itemEnough = false
    for i,v in pairs(PaidgoodsLocalData.tab) do
        ---找到价格
        if v[3] == self.pData.id then
            newPrice = v[8]
            costStr = v[10]
            break
        end
    end
    self.Text_Price().text = newPrice
    if costStr == "" or costStr == "0" then
        self.ItemIcon().gameObject:SetActive(false)
        self.Text_ItemName().gameObject:SetActive(false)
        self.Text_ItemCount().gameObject:SetActive(false)
    else
        self.ItemIcon().gameObject:SetActive(true)
        self.Text_ItemName().gameObject:SetActive(true)
        self.Text_ItemCount().gameObject:SetActive(true)
        local strs = string.split(costStr, "_")
        local item = ItemControl.GetItemByIdAndType(tonumber(strs[2]), tonumber(strs[1]))
        MgrRes.LoadSprite(self.ItemIcon(),item.icon,nil,false)
        self.Text_ItemName().text = item.name
        self.Text_ItemCount().text = "x"..strs[3]
        if item.count >= tonumber(strs[3]) then
            itemEnough = true
        end
    end
    
    ---最大剩余数量
    if self.pData.buyMaxCount ~= 0 then
        self.Text_LimitedCount().text = MgrLanguageData.GetLanguageByKey("buypop_ui_tips2") .. self.MaxCount
    else
        self.Text_LimitedCount().text = MgrLanguageData.GetLanguageByKey("buypop_ui_tips2") .. MgrLanguageData.GetLanguageByKey("ui_tongyong_text104")
    end
    
    UIEvent.LuaClick(self.Btn_confirm().gameObject,function()
        if not itemEnough then
            MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey("ui_fund_text12"), 1}, true)
            return
        end
        ---绑定买入事件
        self.callback()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)

    ---绑定取消事件
    UIEvent.LuaClick(self.Btn_cancel().gameObject,function()
        if self.CloseCallBack then
            self.CloseCallBack()
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,{"ShopHome_UI"}) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShowFinish()
    Tools.ReContentSizeFitter(self.TitleArea().gameObject)
end

---打开礼包面板
function M:ShowLibao()
    self.LibaoPanel().gameObject:SetActive(true)
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

return M