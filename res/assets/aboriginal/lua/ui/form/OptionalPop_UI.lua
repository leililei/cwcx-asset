-- Code Auto Create Begin
local M = Class('OptionalPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.OptionalPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[OptionalPop_UI].prefab'
    self.Name = 'Form[OptionalPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'ChooseRole','ChooseRole',2},{'Img_Xian2','ChooseRole/Img_Xian2',2},{'Img_Xian1','ChooseRole/Img_Xian1',2},{'Img_Biaotixian','ChooseRole/Img_Biaotixian',2},{'OptionalItem','ChooseRole/OptionalScroll/OptionalItem',2},{'ChooseEquipment','ChooseEquipment',2},{'Img_Xian2_Equipment','ChooseEquipment/Img_Xian2_Equipment',2},{'Img_Xian1_Equipment','ChooseEquipment/Img_Xian1_Equipment',2},{'Img_Biaotixian_Equipment','ChooseEquipment/Img_Biaotixian_Equipment',2},{'OptionalItem3','ChooseEquipment/OptionalItemScroll/OptionalItem3',2},{'ChooseExchange','ChooseExchange',2},{'Img_Xian201','ChooseExchange/Img_Xian2',2},{'Img_Xian101','ChooseExchange/Img_Xian1',2},{'Img_Biaotixian01','ChooseExchange/Img_Biaotixian',2},{'OptionalItem2','ChooseExchange/ExchangeScroll/OptionalItem2',2},{'ChooseCore','ChooseCore',2},{'Img_Xian202','ChooseCore/Img_Xian2',2},{'Img_Xian102','ChooseCore/Img_Xian1',2},{'Img_Biaotixian02','ChooseCore/Img_Biaotixian',2},{'OptionalItem4','ChooseCore/CoreScroll/OptionalItem4',2},{'ChooseSkin','ChooseSkin',2},{'Img_Xian203','ChooseSkin/Img_Xian2',2},{'Img_Xian103','ChooseSkin/Img_Xian1',2},{'Img_Biaotixian03','ChooseSkin/Img_Biaotixian',2},{'OptionalSkinItem','ChooseSkin/SkinScroll/OptionalSkinItem',2},{'ChooseItemPanel','ChooseItemPanel',2},{'ClickBackArea','ChooseItemPanel/ClickBackArea',2},{'ClickBackAreaMask','ChooseItemPanel/ClickBackAreaMask',2},{'Img_Tanchuangdi','ChooseItemPanel/Img_Tanchuangdi',2},{'Img_Xian104','ChooseItemPanel/Img_Tanchuangdi/Img_Xian1',2},{'Img_Xian204','ChooseItemPanel/Img_Tanchuangdi/Img_Xian2',2},{'bg','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/bg',2},{'NeedPanelRoot','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/bg/NeedPanelRoot',2},{'OptionalPropsItem','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/PropsScroll/OptionalPropsItem',2},{'WpShuPanel','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel',2},{'Background','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Slider/Background',2},{'Fill','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Slider/Fill Area/Fill',2},{'Handle','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Slider/Handle Slide Area/Handle',2},{'Handle(1)','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Slider/Handle Slide Area/Handle/Handle (1)',2},{'Btn_LvDownLight','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvDownLight',2},{'-(hei)2','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvDownLight/-(hei)2',2},{'Btn_LvDown','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvDown',2},{'-(hui)2','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvDown/-(hui)2',2},{'Btn_LvUpLight','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvUpLight',2},{'+(hei)2','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvUpLight/+(hei)2',2},{'Btn_LvUp','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvUp',2},{'+(hui)2','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Btn_LvUp/+(hui)2',2},{'Btn_Confirm_hui','ChooseItemPanel/Img_Tanchuangdi/Btn_Confirm_hui',2},{'Img_Quedingdi','ChooseItemPanel/Img_Tanchuangdi/Btn_Confirm_hui/Img_Quedingdi',2},{'Btn_Confirm','ChooseItemPanel/Img_Tanchuangdi/Btn_Confirm',2},{'Img_Quedingdi01','ChooseItemPanel/Img_Tanchuangdi/Btn_Confirm/Img_Quedingdi',2},{'Btn_Cancel','ChooseItemPanel/Img_Tanchuangdi/Btn_Cancel',2},{'Img_Quxiaodi','ChooseItemPanel/Img_Tanchuangdi/Btn_Cancel/Img_Quxiaodi',2},{'biaotixian','ChooseItemPanel/Img_Tanchuangdi/biaotixian',2},
        -- Slider 列表
        {'Slider','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Slider',5},
        -- UITemplate 列表
        {'OptionalItem01','ChooseRole/OptionalScroll/OptionalItem',10},{'OptionalItem301','ChooseEquipment/OptionalItemScroll/OptionalItem3',10},{'OptionalItem201','ChooseExchange/ExchangeScroll/OptionalItem2',10},{'OptionalItem401','ChooseCore/CoreScroll/OptionalItem4',10},{'OptionalSkinItem01','ChooseSkin/SkinScroll/OptionalSkinItem',10},{'OptionalPropsItem01','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/PropsScroll/OptionalPropsItem',10},
        -- RawImage 列表
        {'OptionalScroll','ChooseRole/OptionalScroll',15},{'OptionalItemScroll','ChooseEquipment/OptionalItemScroll',15},{'ExchangeScroll','ChooseExchange/ExchangeScroll',15},{'CoreScroll','ChooseCore/CoreScroll',15},{'SkinScroll','ChooseSkin/SkinScroll',15},{'PropsScroll','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/PropsScroll',15},{'PropsContent','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/PropsScroll/PropsContent',15},
        -- LoopScrollRect 列表
        {'OptionalScroll01','ChooseRole/OptionalScroll',18},{'OptionalItemScroll01','ChooseEquipment/OptionalItemScroll',18},{'ExchangeScroll01','ChooseExchange/ExchangeScroll',18},{'CoreScroll01','ChooseCore/CoreScroll',18},{'SkinScroll01','ChooseSkin/SkinScroll',18},{'PropsScroll01','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/PropsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Name','ChooseRole/Text_Name',20},{'Text_Name_Equipment','ChooseEquipment/Text_Name_Equipment',20},{'Text_Name01','ChooseExchange/Text_Name',20},{'Text_Name02','ChooseCore/Text_Name',20},{'Text_Name03','ChooseSkin/Text_Name',20},{'Text_Shuoming1','ChooseItemPanel/Img_Tanchuangdi/NeedPanel/Text_Shuoming1',20},{'Text_WpShu','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Text_WpShu',20},{'Text_WpShu_zuo','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Text_WpShu_zuo',20},{'Text_WpShu_you','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Text_WpShu_you',20},{'Text_Shuoming2','ChooseItemPanel/Img_Tanchuangdi/WpShuPanel/Text_Shuoming2',20},{'Text_confirm','ChooseItemPanel/Img_Tanchuangdi/Btn_Confirm_hui/Text_confirm',20},{'Text_confirm01','ChooseItemPanel/Img_Tanchuangdi/Btn_Confirm/Text_confirm',20},{'Text_cancel','ChooseItemPanel/Img_Tanchuangdi/Btn_Cancel/Text_cancel',20},{'PanelTitleText','ChooseItemPanel/Img_Tanchuangdi/PanelTitleText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.ChooseRole().gameObject:SetActive(false)
    self.ChooseItemPanel().gameObject:SetActive(false)
    self.ChooseExchange().gameObject:SetActive(false)
    self.ChooseEquipment().gameObject:SetActive(false)
    self.ChooseCore().gameObject:SetActive(false)
    self.ChooseSkin().gameObject:SetActive(false)
    
    self:InitScroll()
    self:InitClick()
    self.CurSelect = nil
    self.CurNum = 1

    ---用于区分调用类型
    self.Type = {
        Item = 1,        --物品调用
        roleDraw = 2,    --角色调用
    }
end

function M:OnShow(Args)
    ---@type ItemData
    self.pData = Args[1]
    self.CallBack = Args[2]
    self.callType = Args[3] == nil and self.Type.Item or Args[3]

    if self.callType == self.Type.Item then
        if self.pData.use == 4 then
            --自选角色
            self.ChooseRole().gameObject:SetActive(true)
            self:ReloadScroll()
        elseif self.pData.use == 3 then
            --自选道具
            self.ChooseItemPanel().gameObject:SetActive(true)
            self:ReloadPropsScroll(0)
            self:RefreshProps()
        elseif self.pData.use == 7 then
            --自选装备
            self.ChooseEquipment().gameObject:SetActive(true)
            self:ReloadExchange_Equipment()
        elseif self.pData.use == 9 then
            --自选核心
            self.ChooseCore().gameObject:SetActive(true)
            self:RelocalCore()
        elseif self.pData.use == 10 then
            --自选皮肤
            self.ChooseSkin().gameObject:SetActive(true)
            self:RelocalSkin()
        end
    elseif self.callType == self.Type.roleDraw then
        self.ChooseExchange().gameObject:SetActive(true)
        self:ReloadExchange()
    end
end

---初始化滑块
function M:InitScroll()
    self.OptionalScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.PropsScroll01():SetLuaCellEvent(Handle(self,self.PropsCellItem))
    self.ExchangeScroll01():SetLuaCellEvent(Handle(self,self.exchangeCellItem))
    self.OptionalItemScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.CoreScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.SkinScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end

---item回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.fallList[idx],self,self.pData})
end

function M:PropsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.fallList[idx],self,self.pData})
end

function M:exchangeCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.fallList[idx],self,self.CallBack})
end

---自选角色
function M:ReloadExchange()
    self.fallList = self.pData
    self.ExchangeScroll01().totalCount = #self.fallList
    self.ExchangeScroll01():RefillCells()
end

---自选装备
function M:ReloadExchange_Equipment()
    self.Text_Name().text = self.pData.name
    local tEquipList = string.split(self.pData.fall,",")
    self.fallList = self:SortList(tEquipList,"equip")
    self.OptionalItemScroll01().totalCount = #self.fallList
    self.OptionalItemScroll01():RefillCells()
end

---刷新自选角色物品
function M:ReloadScroll()
    self.Text_Name().text = self.pData.name
    local tRoleList = string.split(self.pData.fall,",")
    self.fallList = self:SortList(tRoleList,"role")
    self.OptionalScroll01().totalCount = #self.fallList
    self.OptionalScroll01():RefillCells()
end

---刷新自选道具
function M:ReloadPropsScroll(offset)
    self.fallList = string.split(self.pData.fall,",")
    self.PropsScroll01().totalCount = #self.fallList
    if offset then
        self.PropsScroll01():RefillCells(offset)
    else
        self.PropsScroll01():RefreshCells()
    end
end
---刷新自选核心
function M:RelocalCore()
    self.Text_Name().text = self.pData.name

    self.fallList = string.split(self.pData.fall,",")
    self.CoreScroll01().totalCount = #self.fallList
    self.CoreScroll01():RefillCells()
end
---刷新自选皮肤
function M:RelocalSkin()
    local tStr = string.split(self.pData.fall,",")
    local itemList = {}
    self.fallList = {}
    local idx = 0
    for i, v in ipairs(tStr) do
        local itemData = string.split(v,'_')
        if itemData[1] == "4" then
            local tSkinData = HeroControl.GetSkinDataBySkinId(tonumber(itemData[2]))
            if not tSkinData.unlockState then
                idx = idx + 1
            end
            table.insert(self.fallList, tSkinData)
        else
            table.insert(itemList, itemData)
        end
    end
    Global.Sort(self.fallList, {"unlockState","id"}, {true,false})

    for i, v in ipairs(itemList) do
        table.insert(self.fallList,idx+i,v)
    end
    
    self.SkinScroll01().totalCount = #self.fallList
    self.SkinScroll01():RefillCells()
end

function M:RefreshUI()
    self.pData = ItemControl.GetItemByIdAndType(self.pData.id,self.pData.goodsType)
    ---如果没有可兑换的道具
    if self.pData.count == 0 then
        MgrUI.ClosePop(self.Uid)
    end
end

---刷新道具自选
function M:RefreshProps()
    self.pData = ItemControl.GetItemByIdAndType(self.pData.id,self.pData.goodsType)
    ---如果没有可兑换的道具
    if self.pData.count == 0 then
        MgrUI.ClosePop(self.Uid)
        return
    end
    if self.CurSelect == nil then
        self.Text_Shuoming1().gameObject:SetActive(true)
        self.WpShuPanel().gameObject:SetActive(false)
    else
        self.Text_Shuoming1().gameObject:SetActive(false)
        self.WpShuPanel().gameObject:SetActive(true)
    end
    self.Slider().maxValue = self.pData.count
    self.Slider().minValue = 1

    if self.CurSelect ~= nil then
        local str = string.split(self.CurSelect,"_")
        ---@type ItemData
        self.goods = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))  --当前选择的道具
        self.targetNum = tonumber(str[3])
        self.Text_WpShu_zuo().text = "1"   --最低兑换次数
        self.Text_WpShu_you().text = self.pData.count  --最高兑换次数
        self.Text_Shuoming2().text = string.format(MgrLanguageData.GetLanguageByKey("ui_knapsack_exchange_tips1"),self.pData.name,self.CurNum,self.goods.name,self.targetNum*self.CurNum)
    end

    if self.CurNum <= 1 then
        self.Btn_LvDownLight().gameObject:SetActive(false)
        self.Btn_LvDown().gameObject:SetActive(true)
    else
        self.Btn_LvDownLight().gameObject:SetActive(true)
        self.Btn_LvDown().gameObject:SetActive(false)
    end
    if self.CurNum >= self.pData.count then
        self.Btn_LvUpLight().gameObject:SetActive(false)
        self.Btn_LvUp().gameObject:SetActive(true)
    else
        self.Btn_LvUpLight().gameObject:SetActive(true)
        self.Btn_LvUp().gameObject:SetActive(false)
    end
    self.Text_WpShu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_knapsack_exchange_tips2"),self.CurNum)
    self.Slider().value = self.CurNum
end

---初始化点击事件
function M:InitClick()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击空白区域关闭界面
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)

    ---点击+
    UIEvent.LuaClick(self.Btn_LvUpLight().gameObject,function()
        if self.CurNum + 1 > self.pData.count then
            self.CurNum = self.pData.count
        else
            self.CurNum = self.CurNum + 1
        end
        self:RefreshProps()
    end)
    ---点击-
    UIEvent.LuaClick(self.Btn_LvDownLight().gameObject,function()
        if self.CurNum - 1 < 1 then
            self.CurNum = 1
        else
            self.CurNum = self.CurNum - 1
        end
        self:RefreshProps()
    end)
    ---点击确定
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        ---如果未选择道具 返回
        if self.CurSelect == nil then
            return
        end
        ---目标道具
        local target = {
            goodsType = self.goods.goodsType,
            goodsID = self.goods.id,
            goodsNum = self.targetNum,
        }
        ---消耗道具
        local goods = {
            goodsType = self.pData.goodsType,
            goodsID = self.pData.id,
            goodsNum = self.CurNum,
        }

        ItemControl.UseOptionalGoods(goods,target,function()
            if self.CallBack then
                self.CallBack()
            end
            self:RefreshProps()
        end)
    end)
    ---点击取消
    UIEvent.LuaClick(self.Btn_Cancel().gameObject,function()
        MgrUI.ClosePop(self.Uid)
    end)

    Tools.OnSliderValueChange(self.Slider(),function(float)
        self.CurNum = math.floor(float)
        self:RefreshProps()
    end)

end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
---排序
function M:SortList(_list, _strType)
    local tList = {}
    local tData = nil
    for i, v in ipairs(_list) do
        local tStr = string.split(v,"_")
        if _strType == "role" then 
            tData = HeroControl.GetRoleDataByID(tonumber(tStr[2]))
        elseif _strType == "equip" then
            tData = EquipControl.GetSingleEquips(tonumber(tStr[2]))
        end
        if tData then
            table.insert(tList, { data = v, isHave = tData.lockState,equipID = tData.equipID })
        end
    end
    Global.Sort(tList, {"isHave","equipID"}, true)

    local tSortList = {}
    for i, v in ipairs(tList) do
        table.insert(tSortList,v.data)
    end
    
    return tSortList
end

return M