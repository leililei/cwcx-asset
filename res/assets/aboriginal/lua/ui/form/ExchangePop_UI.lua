-- Code Auto Create Begin
local M = Class('ExchangePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ExchangePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ExchangePop_UI].prefab'
    self.Name = 'Form[ExchangePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'RoleInfoPreview','RoleInfoPreview',2},{'Img_Xian1','RoleInfoPreview/Img_Xian1',2},{'Img_Xian2','RoleInfoPreview/Img_Xian2',2},{'Img_Tanchuangdi','RoleInfoPreview/Img_Tanchuangdi',2},{'ItemPanel','RoleInfoPreview/Img_Tanchuangdi/ItemPanel',2},{'wpGo1','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo1',2},{'WupinIcon','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo1/WupinIcon',2},{'Img_ItemCountBg_Wp','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo1/Img_ItemCountBg_Wp',2},{'wpGo2','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo2',2},{'WupinIcon01','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo2/WupinIcon',2},{'Img_ItemCountBg_Wp01','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo2/Img_ItemCountBg_Wp',2},{'Img_Jiantou','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/Img_Jiantou',2},{'Background','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Background',2},{'Fill','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Fill Area/Fill',2},{'Handle','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Handle Slide Area/Handle',2},{'Handle(1)','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Handle Slide Area/Handle/Handle (1)',2},{'Btn_jian','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_jian',2},{'Img_jiandi','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_jian/Img_jiandi',2},{'Btn_jia','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_jia',2},{'Img_jiadi','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_jia/Img_jiadi',2},{'Btn_LvDownLight','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDownLight',2},{'-(hei)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDownLight/-(hei)2',2},{'Btn_LvDown','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDown',2},{'-(hui)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDown/-(hui)2',2},{'Btn_LvUpLight','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUpLight',2},{'+(hei)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUpLight/+(hei)2',2},{'Btn_LvUp','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUp',2},{'+(hui)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUp/+(hui)2',2},{'Btn_Confirm_hui','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm_hui',2},{'Img_Quedingdi','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm_hui/Img_Quedingdi',2},{'Btn_Confirm','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm',2},{'Img_Quedingdi01','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm/Img_Quedingdi',2},{'Btn_Cancel','RoleInfoPreview/Img_Tanchuangdi/Btn_Cancel',2},{'Img_Quxiaodi','RoleInfoPreview/Img_Tanchuangdi/Btn_Cancel/Img_Quxiaodi',2},{'biaotixian','RoleInfoPreview/Img_Tanchuangdi/biaotixian',2},
        -- Slider 列表
        {'Slider','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider',5},
        -- TextMeshProUGUI 列表
        {'ItemNumText','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo1/Img_ItemCountBg_Wp/ItemNumText',20},{'ItemNumText01','RoleInfoPreview/Img_Tanchuangdi/ItemPanel/wpGo2/Img_ItemCountBg_Wp/ItemNumText',20},{'Text_WpShu','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Text_WpShu',20},{'Text_WpShu_zuo','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Text_WpShu_zuo',20},{'Text_WpShu_you','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Text_WpShu_you',20},{'Text_jian','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_jian/Text_jian',20},{'Text_jia','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_jia/Text_jia',20},{'Text_Shuoming','RoleInfoPreview/Img_Tanchuangdi/Text_Shuoming',20},{'Text_confirm','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm_hui/Text_confirm',20},{'Text_confirm01','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm/Text_confirm',20},{'Text_cancel','RoleInfoPreview/Img_Tanchuangdi/Btn_Cancel/Text_cancel',20},{'PanelTitleText','RoleInfoPreview/Img_Tanchuangdi/PanelTitleText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --self.Fluctuate = 10         ---一次增加或减少的数量
    self.TotleNum = 0           ---可兑换的总数
    self.PriceItemText = nil    ---作为货币的道具拥有的数量显示
    self.GoodsItemText = nil    ---作为商品的道具拥有的数量显示
    self.PriceItemNum = 0       ---作为货币的道具拥有的数量
    self.GoodsItemNum = 0       ---作为商品的道具拥有的数量
    self.tPriceItemUnit = 0     ---用N个商品兑换1个道具
    self.tGoodsItemUnit = 0     ---兑换的数量
    self.ChangeType = "skill"   ---兑换类型"skill" 技能材料兑换 "shop"商店材料兑换
    self.ChangeID = 0           ---兑换的ID
    self.Max = 0                ---最大值
    self.PriceName = ""         ---作为货币的道具名称
    
    self:InitButton()
end

function M:OnShow(args)
    if args == nil or #args < 1 then
        return
    end
    local tRoleID = args[1]
    local tChangeNum = args[2] and args[2] or 0
    self.ChangeType = args[3] and args[3] or self.ChangeType
    
    local tPrice = nil
    local tGoods = nil
    if self.ChangeType == "skill" then
        ---技能材料兑换
        local tChangeItem = ArkControl.GetSkillItemChange(tRoleID)
        if tChangeItem then
            local tCostItem = string.split(tChangeItem.synthesisCost, ',')
            tPrice = tCostItem[1]
            tGoods = tChangeItem.synthesisItem

            self.ChangeID = tChangeItem.id
        end
    elseif self.ChangeType == "shop" then
        ---商店材料兑换
        self.ChangeID = tRoleID
        local cfg = ShopLocalData.tab[tRoleID]
        if cfg then
            tPrice = string.split(cfg.price,',')[2]
            tGoods = string.split(cfg.content,',')[2]
        end
    end
    
    if tPrice == nil or tGoods == nil then
        return
    end
    
    local tPriceStr = string.split(tPrice,'_')
    local tGoodsStr = string.split(tGoods,'_')
    local tPriceItem = ItemControl.GetItemByIdAndType(tonumber(tPriceStr[2]), tonumber(tPriceStr[1]))
    local tGoodsItem = ItemControl.GetItemByIdAndType(tonumber(tGoodsStr[2]), tonumber(tGoodsStr[1]))
    self.PriceItemText = self:InitItem(self.wpGo1().gameObject, tPriceItem)
    self.GoodsItemText = self:InitItem(self.wpGo2().gameObject, tGoodsItem)
    self.PriceItemNum = tPriceItem.count
    self.GoodsItemNum = tGoodsItem.count
    self.tPriceItemUnit = tonumber(tPriceStr[3])
    self.tGoodsItemUnit = tonumber(tGoodsStr[3])
    self.PriceName = tPriceItem.name
    self.Text_Shuoming().text = string.format(MgrLanguageData.GetLanguageByKey("ui_tongyong_text242"), self.tPriceItemUnit, tPriceItem.name, self.tGoodsItemUnit, tGoodsItem.name)
    ---作为货币的道具拥有数量
    self.TotleNum = math.modf(self.PriceItemNum/self.tPriceItemUnit)
    if args[4] then
        self.Slider().maxValue = args[4] > self.TotleNum and self.TotleNum or args[4]
    else
        self.Slider().maxValue = self.TotleNum > 99999 and 99999 or self.TotleNum
    end
    
    ---兑换的数量
    self.Slider().value = tChangeNum
    self:ChangeNum(self.Slider().value)
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---关闭弹窗
    UIEvent.LuaClick(self.BlurMask().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.ExchangePop_UI)
    end)
    UIEvent.LuaClick(self.Btn_Cancel().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.ExchangePop_UI)
    end)
    ---确认兑换
    UIEvent.LuaClick(self.Btn_Confirm().gameObject, function()
        if self.Slider().maxValue == 0 then
            local str = string.format(MgrLanguageData.GetLanguageByKey("ui_supplyexchange_tips1"), self.PriceName)
            MgrUI.Pop(UID.PopTip_UI, { str,1 }, true)
            return
        end
        if self.ChangeType == "skill" then
            if self.ChangeID ~= 0 and math.ceil(self.Slider().value) > 0 then
                ArkViewModel.SendSkillMaterialsMake(self.ChangeID, math.ceil(self.Slider().value),function()
                    Event.Go("ChangeUpdate")
                    ---兑换成功后关闭弹窗
                    MgrUI.ClosePop(UID.ExchangePop_UI)
                end)
            end
        elseif self.ChangeType == "shop" then
            if self.ChangeID ~= 0 and math.ceil(self.Slider().value) > 0 then
                ShopViewModel.SendBuyGoods({ self.ChangeID, math.ceil(self.Slider().value) },function()
                    Event.Go("RefreshCoinCount")
                    Event.Go("Shop_UI_ChangeWallet")
                    ---兑换成功后关闭弹窗
                    MgrUI.ClosePop(UID.ExchangePop_UI)
                end)
            end
        end
    end)
    ---滑动条
    Tools.OnSliderValueChange(self.Slider(), function()
        ---兑换的数量
        self:ChangeNum(self.Slider().value)
        self.PriceItemText.text = JNStrTool.numberAbbr(self.PriceItemNum - math.ceil(self.Slider().value)*self.tPriceItemUnit)
        self.GoodsItemText.text = JNStrTool.numberAbbr(self.GoodsItemNum + math.ceil(self.Slider().value)*self.tGoodsItemUnit)
    end)
    ---Min
    UIEvent.LuaClick(self.Btn_jian().gameObject, function()
        self.Slider().value = 0
        ---兑换的数量
        self:ChangeNum(self.Slider().value)
        self.PriceItemText.text = JNStrTool.numberAbbr(self.PriceItemNum + math.ceil(self.Slider().value)*self.tPriceItemUnit)
        self.GoodsItemText.text = JNStrTool.numberAbbr(self.GoodsItemNum - math.ceil(self.Slider().value)*self.tGoodsItemUnit)
    end)
    ---Max
    UIEvent.LuaClick(self.Btn_jia().gameObject, function()
        self.Slider().value = self.Slider().maxValue
        ---兑换的数量
        self:ChangeNum(self.Slider().value)
        self.PriceItemText.text = JNStrTool.numberAbbr(self.PriceItemNum - math.ceil(self.Slider().value)*self.tPriceItemUnit)
        self.GoodsItemText.text = JNStrTool.numberAbbr(self.GoodsItemNum + math.ceil(self.Slider().value)*self.tGoodsItemUnit)
    end)
    ---添加
    UIEvent.AlwaysLongClick(self.Btn_LvUpLight().gameObject, Handle(self, function()
        self.Slider().value = self.Slider().value + 1
        self.Slider().value = math.ceil(self.Slider().value)
        ---兑换的数量
        self:ChangeNum(self.Slider().value)
    end))
    ---减少
    UIEvent.AlwaysLongClick(self.Btn_LvDownLight().gameObject, Handle(self, function()
        self.Slider().value = self.Slider().value - 1
        self.Slider().value = math.ceil(self.Slider().value)
        ---兑换的数量
        self:ChangeNum(self.Slider().value)
    end))
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
function M:InitItem(_item, BagItem)
    local _ItemFrame = _item.gameObject:GetComponent("Image")
    local _ItemIcon = CJNUIMgr.GetSunUseName(_item, "WupinIcon"):GetComponent("Image")
    local _ItemCountText = CJNUIMgr.GetSunUseName(_item, "ItemNumText"):GetComponent("TextMeshProUGUI")

    ---设置品质
    MgrRes.LoadSprite(_ItemFrame,BagItem.iconFrame)
    ---设置图标
    MgrRes.LoadSprite(_ItemIcon,BagItem.icon)
    ---设置数量
    _ItemCountText.text = JNStrTool.numberAbbr(BagItem.count)
    
    return _ItemCountText
end

---兑换的数量
function M:ChangeNum(_changeNum)
    local tChangeNum = _changeNum > self.TotleNum and self.TotleNum or _changeNum
    if tChangeNum >= 99999 then
        tChangeNum = 99999
    end
    if tChangeNum < 0 then
        tChangeNum = 0
    end
    self.Text_WpShu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text129"), math.ceil(tChangeNum))
end

return M