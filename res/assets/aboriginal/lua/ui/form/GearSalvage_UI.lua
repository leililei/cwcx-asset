-- Code Auto Create Begin
local M = Class('GearSalvage_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.GearSalvage_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[GearSalvage_UI].prefab'
    self.Name = 'Form[GearSalvage_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NomalBg','NomalBg',2},{'LeftBg','LeftBg',2},{'LeftPanel','LeftPanel',2},{'GearRankKuangImg','LeftPanel/GearIconPanel/GearRankKuangImg',2},{'GearIconImg','LeftPanel/GearIconPanel/GearIconImg',2},{'Xingdi','LeftPanel/GearIconPanel/Xingdi',2},{'GearStarPrefab','LeftPanel/GearIconPanel/GearStarPrefab',2},{'HighLight','LeftPanel/GearIconPanel/GearStarPrefab/HighLight',2},{'SpecialHighLight','LeftPanel/GearIconPanel/GearStarPrefab/SpecialHighLight',2},{'GearStarPanel','LeftPanel/GearIconPanel/GearStarPanel',2},{'QiconBg_Gong','LeftPanel/GearIconPanel/QIcon_Panel/QiconBg_Gong',2},{'Qicon','LeftPanel/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon',2},{'QiconFrame','LeftPanel/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon/QiconFrame',2},{'QiconBg_Fang','LeftPanel/GearIconPanel/QIcon_Panel/QiconBg_Fang',2},{'Qicon01','LeftPanel/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon',2},{'QiconFrame01','LeftPanel/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon/QiconFrame',2},{'Suo','LeftPanel/Suo',2},{'Gear_Img_Suo_hui','LeftPanel/Suo/Gear_Img_Suo_hui',2},{'Gear_Img_Suo','LeftPanel/Suo/Gear_Img_Suo',2},{'CoreLockPressArea','LeftPanel/Suo/CoreLockPressArea',2},{'GearInfoPanel','LeftPanel/GearInfoPanel',2},{'GearInfoPrefab1','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab1',2},{'VoidIconBG','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab1/VoidIconBG',2},{'GearInfoIcon','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoIcon',2},{'GearInfoPrefab2','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab2',2},{'VoidIconBG01','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab2/VoidIconBG',2},{'GearInfoIcon01','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoIcon',2},{'GearSkillPrefab','LeftPanel/GearInfoPanel/GearDataPanel/GearSkillPrefab',2},{'Img_SkillXian','LeftPanel/GearInfoPanel/GearDataPanel/GearSkillPrefab/Img_SkillXian',2},{'VoidGearIcon','LeftPanel/GearInfoPanel/GearDataPanel/GearSkillPrefab/VoidGearIcon',2},{'Btn_Chakan','LeftPanel/GearInfoPanel/GearDataPanel/GearSkillPrefab/Btn_Chakan',2},{'RightPanel','RightPanel',2},{'GearPrefab','RightPanel/GearScroll/GearPrefab',2},{'GearWornPrefab','RightPanel/GearScroll/GearPrefab/GearWornPrefab',2},{'GearRankKuangImg01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/GearRankKuangImg',2},{'GearIconImg01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/GearIconImg',2},{'Xingdi01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/Xingdi',2},{'GearStarPrefab01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/GearStarPrefab',2},{'HighLight01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/GearStarPrefab/HighLight',2},{'SpecialHighLight01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/GearStarPrefab/SpecialHighLight',2},{'GearStarPanel01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/GearStarPanel',2},{'QiconBg_Gong01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong',2},{'Qicon02','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon',2},{'QiconFrame02','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon/QiconFrame',2},{'QiconBg_Fang01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang',2},{'Qicon03','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon',2},{'QiconFrame03','RightPanel/GearScroll/GearPrefab/GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon/QiconFrame',2},{'Img_Landi','RightPanel/GearScroll/GearPrefab/GearWornPrefab/Img_Landi',2},{'Suo01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/Suo',2},{'Gear_Img_Suo_hui01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/Suo/Gear_Img_Suo_hui',2},{'Gear_Img_Suo01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/Suo/Gear_Img_Suo',2},{'CoreLockPressArea01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/Suo/CoreLockPressArea',2},{'DeletIconImg','RightPanel/GearScroll/GearPrefab/DeletIconImg',2},{'SelectIconImg','RightPanel/GearScroll/GearPrefab/SelectIconImg',2},{'Content','RightPanel/GearScroll/Content',2},{'Img_xian','RightPanel/Img_xian',2},{'qiehuandi(you)','RightPanel/GearSortPanel/qiehuandi(you)',2},{'GearSortToggleGroup','RightPanel/GearSortPanel/GearSortToggleGroup',2},{'GearBagSortToggle','RightPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',2},{'FilterPanelPivot','RightPanel/FilterPanelPivot',2},{'GearFilterToggleGroup','RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup',2},{'GearBagFilterToggle','RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',2},{'Btn_GearFilter','RightPanel/FilterPanelPivot/Btn_GearFilter',2},{'shaixuandi','RightPanel/FilterPanelPivot/Btn_GearFilter/shaixuandi',2},{'GearFilterNormal','RightPanel/FilterPanelPivot/Btn_GearFilter/GearFilterNormal',2},{'GearFilterHighLight','RightPanel/FilterPanelPivot/Btn_GearFilter/GearFilterHighLight',2},{'Btn_Fenjie_H','RightPanel/Btn_Fenjie_H',2},{'Btn_Kuaisu','RightPanel/Btn_Kuaisu',2},{'ResolveItemQuality','RightPanel/ResolveItemQuality',2},{'GearIconImg02','RightPanel/ResolveItemQuality/GearIconImg',2},{'Img_ItemCountBg','RightPanel/ResolveItemQuality/Img_ItemCountBg',2},{'ResolveItem','RightPanel/ResolveItem',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_xian01','ReturnBg/Img_xian',2},{'RapidRecovery','RapidRecovery',2},{'UpgradeReturnBg','RapidRecovery/UpgradeReturnBg',2},{'Img_Xian1','RapidRecovery/Img_Xian1',2},{'Img_Xian2','RapidRecovery/Img_Xian2',2},{'Img_Tanchuangdi','RapidRecovery/Img_Tanchuangdi',2},{'Image','RapidRecovery/Img_Tanchuangdi/Image',2},{'TogPrefab1','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab1',2},{'HighLight02','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab1/HighLight',2},{'Img_Select','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab1/HighLight/Img_Select',2},{'Img_Gou','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab1/HighLight/Img_Gou',2},{'TogPrefab2','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab2',2},{'HighLight03','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab2/HighLight',2},{'Img_Select01','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab2/HighLight/Img_Select',2},{'Img_Gou01','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab2/HighLight/Img_Gou',2},{'TogPrefab3','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab3',2},{'HighLight04','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab3/HighLight',2},{'Img_Select02','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab3/HighLight/Img_Select',2},{'Img_Gou02','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab3/HighLight/Img_Gou',2},{'TogPrefab4','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab4',2},{'HighLight05','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab4/HighLight',2},{'Img_Select03','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab4/HighLight/Img_Select',2},{'Img_Gou03','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab4/HighLight/Img_Gou',2},{'TogPrefab5','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab5',2},{'HighLight06','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab5/HighLight',2},{'Img_Select04','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab5/HighLight/Img_Select',2},{'Img_Gou04','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab5/HighLight/Img_Gou',2},{'Image(1)','RapidRecovery/Img_Tanchuangdi/Image (1)',2},{'Btn_Cancel','RapidRecovery/Btn_Cancel',2},{'Btn_Enter','RapidRecovery/Btn_Enter',2},
        -- UITemplate 列表
        {'GearBagSortToggle01','RightPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',10},{'GearBagFilterToggle01','RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',10},
        -- Toggle 列表
        {'GearBagSortToggle02','RightPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',13},{'GearBagFilterToggle02','RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',13},{'Btn_GearFilter01','RightPanel/FilterPanelPivot/Btn_GearFilter',13},
        -- RawImage 列表
        {'GearScroll','RightPanel/GearScroll',15},
        -- LoopScrollRect 列表
        {'GearScroll01','RightPanel/GearScroll',18},
        -- TextMeshProUGUI 列表
        {'TempText1','LeftBg/TempText1',20},{'GearInfoText','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoText',20},{'GearInfoNameTxt','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNameTxt',20},{'GearInfoNull','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNull',20},{'GearInfoText01','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoText',20},{'GearInfoNameTxt01','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNameTxt',20},{'GearInfoNull01','LeftPanel/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNull',20},{'GearSkillNameText','LeftPanel/GearInfoPanel/GearDataPanel/GearSkillPrefab/GearSkillNameText',20},{'UpGradeTxt','LeftPanel/UpGradeTxt',20},{'GearUpgradeText','LeftPanel/GearUpgradeText',20},{'GearNameTxt','LeftPanel/GearNameTxt',20},{'GearUpgradeText01','RightPanel/GearScroll/GearPrefab/GearWornPrefab/Img_Landi/GearUpgradeText',20},{'GearFilterBtnText','RightPanel/FilterPanelPivot/Btn_GearFilter/GearFilterBtnText',20},{'Text_Fenjie','RightPanel/Btn_Fenjie_H/Text_Fenjie',20},{'Text_Kuaisu','RightPanel/Btn_Kuaisu/Text_Kuaisu',20},{'ItemCountText','RightPanel/ResolveItemQuality/Img_ItemCountBg/ItemCountText',20},{'TempText2','RightPanel/TempText2',20},{'CnBgTitle','ReturnBg/CnBgTitle',20},{'EnBgTitle','ReturnBg/EnBgTitle',20},{'Text_Title','RapidRecovery/Img_Tanchuangdi/Text_Title',20},{'Text_Qingxuanze','RapidRecovery/Img_Tanchuangdi/Text_Qingxuanze',20},{'Text_Tog','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab1/HighLight/Text_Tog',20},{'Text_Qingxuanze2','RapidRecovery/Img_Tanchuangdi/Text_Qingxuanze2',20},{'Text_Tog01','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab2/HighLight/Text_Tog',20},{'Text_Tog02','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab3/HighLight/Text_Tog',20},{'Text_Tog03','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab4/HighLight/Text_Tog',20},{'Text_Tog04','RapidRecovery/Img_Tanchuangdi/XingjiPanel/TogPrefab5/HighLight/Text_Tog',20},{'Text_Quxiao','RapidRecovery/Btn_Cancel/Text_Quxiao',20},{'Text_Queren','RapidRecovery/Btn_Enter/Text_Queren',20},
    }
end
-- Code Auto Create End
---初始化核心背包
function M:OnInit()
    self.RapidRecovery().gameObject:SetActive(false)
    self.LeftPanel().gameObject:SetActive(false)
    self.Btn_Fenjie_H().gameObject:SetActive(false)
    self.ResolveItemQuality().gameObject:SetActive(false)
    self.TempText2().gameObject:SetActive(false)
    
    self.CurCoreList = nil
    ---选择核心列表
    self.SingleChooseCoreList = {}
    self.isLocked = 0
    self.StarList = {}
    ---当前选中核心数据
    self.CurCore = nil
    ---当前选中核心
    self.CurCoreObj = nil
    ---核心列表的单排数量
    self.ColumnCount = self.Content().transform:GetComponent("GridLayoutGroup").constraintCount
    ---快速选择选项
    self.FastSelectId = 0
    --创建最大星
    self.maxStar = BagViewModel.GetCoreStarMax()
    for i = 1, self.maxStar do
        self.StarList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.GearStarPanel().transform,false).transform
    end
    ---当前选中框
    self.CurSelectIcon = nil
    self.GearStarPrefab().gameObject:SetActive(false)
    --设置核心背包LoopScroll回调
    self.GearScroll01():SetLuaCellEvent(Handle(self,self.CellCore))
  
    --初始化核心背包筛选器
    self:InitCoreFilter()
    --按钮初始化
    self:InitButton()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    --返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    --注册上锁按钮事件
    UIEvent.LuaClick(self.CoreLockPressArea().gameObject,Handle(self,self.ClickLockIcon))
    ----取消选择
    --UIEvent.LuaClick(self.Btn_Quxiao().gameObject,function()
    --    local tCoreIDList = {}
    --    for i, v in ipairs(self.SingleChooseCoreList) do
    --        local _SelectIconImg = CJNUIMgr.GetSunUseName(v.obj, "SelectIconImg")
    --        _SelectIconImg.gameObject:SetActive(false)
    --        table.insert(tCoreIDList, v)
    --    end
    --    --删除选中核心数据
    --    for i, v in ipairs(tCoreIDList) do
    --        self:AddOrDeleteCore(v.obj,v.data,true)
    --    end
    --    --按钮状态
    --    self:CheckBtnState()
    --    --隐藏左侧详情
    --    self.LeftPanel().gameObject:SetActive(false)
    --end)
    --快速选择
    UIEvent.LuaClick(self.Btn_Kuaisu().gameObject,function()
        self.RapidRecovery().gameObject:SetActive(true)
    end)
    --取消快速选择
    UIEvent.LuaClick(self.Btn_Cancel().gameObject,function()
        self.RapidRecovery().gameObject:SetActive(false)
    end)
    --确认快速选择
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        self.RapidRecovery().gameObject:SetActive(false)
        
        self:FastSelect(self.FastSelectId)
    end)
    --快速选择选项
    local tFastList = {
        ---全选
        [1] = { obj = self.TogPrefab1(), id = 10 },
        ---2星及一下
        [2] = { obj = self.TogPrefab2(), id = 3 },
        ---3星及一下
        [3] = { obj = self.TogPrefab3(), id = 4 },
        ---4星及一下
        [4] = { obj = self.TogPrefab4(), id = 5 },
        ---5星及一下
        [5] = { obj = self.TogPrefab5(), id = 6 }
    }
    local tFastSelect = nil
    for i, v in ipairs(tFastList) do
        UIEvent.LuaClick(v.obj.gameObject, function()
            local tGou = v.obj.transform:Find("HighLight"):Find("Img_Gou").gameObject
            if tFastSelect then
                tFastSelect:SetActive(false)
            end
            if tGou == tFastSelect then
                self.FastSelectId = 0
                tFastSelect = nil
                return
            end
            tFastSelect = tGou
            tFastSelect:SetActive(true)

            self.FastSelectId = v.id
        end)
    end
    --分解 
    UIEvent.LuaClick(self.Btn_Fenjie_H().gameObject,function()
        --发送核心批量分解
        BagViewModel.SendCoreDecompose(self.SingleChooseCoreList,function()
            self.SingleChooseCoreList = {}
            self:ResetCoreView(0)
            --按钮状态
            self:CheckBtnState()

            self.LeftPanel().gameObject:SetActive(false)
            self.TempText1().gameObject:SetActive(true)
        end)
    end)
end
---核心背包筛选器
function M:InitCoreFilter()
    --排序器
    local sorts = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_core_level"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_starlevel"),
        --[3] = MgrLanguageData.GetLanguageByKey("bag_ui_core_get"),
    }
    local BagSortTogs = self:CreateFilterToggle(sorts,self.GearBagSortToggle().gameObject,self.GearSortToggleGroup().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
        self.CoreSort = sort
        self.CoreIsRise = isRise
        self:ResetCoreView(offset)
    end))
    --筛选器
    local filterNames = SteamLocalData.tab[106011][2]
    local str = string.split(filterNames,"_")
    local filters = {
        str[1],
        str[2],
        str[3],
        str[4],
        str[5],
        str[6],
        str[7],
    }
    local filterTogs = self:CreateFilterToggle(filters,self.GearBagFilterToggle().gameObject,self.GearFilterToggleGroup().gameObject.transform,Handle(self,function(self,filter,isOn,offset)
        if isOn then
            self.CoreFilter = filter
            self:ResetCoreView(offset)
        end
    end),true)
    -----筛选器遮罩事件
    --UIEvent.LuaClick(self.Btn_FilterBtnPanelClose().gameObject,function()
    --    self.Btn_GearFilter01().isOn = false
    --end)
    --筛选器动画
    Tools.ToggleValueChange(self.Btn_GearFilter01(),function(isOn)
        --self.Btn_FilterBtnPanelClose().gameObject:SetActive(isOn)
        local y = isOn and 0 or -645
        Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
    end,nil)
    --隐藏预制
    self.GearBagSortToggle().gameObject:SetActive(false)
    self.GearBagFilterToggle().gameObject:SetActive(false)
    --默认关闭筛选
    self.Btn_GearFilter01().isOn = false
    --默认筛选显示全部
    self.CoreFilter = 0
    filterTogs[1].enabled = false
    filterTogs[1].isOn = false
    filterTogs[1].isOn = true
    filterTogs[1].enabled = true

    BagSortTogs[1].isOn = false
    BagSortTogs[1].isOn = true
end
---核心背包loopScroll刷新
function M:ResetCoreView(offset)
    --获取核心数据
    self.CurCoreList = BagViewModel.GetCoreData(self.CoreFilter,self.CoreSort,self.CoreIsRise)
    self:UpdateCoreLockState()
    --回收状态只显示没有锁的核心
    local tab = {}
    for i, v in ipairs(self.CurCoreList) do
        --没有锁且没有装备角色
        if v.isLocked == 0 and #v.armorGroup == 0 then
            table.insert(tab,v)
        end
    end
    self.CurCoreList = tab
    --空界面显示文字
    if #self.CurCoreList == 0 then
        self.TempText2().gameObject:SetActive(true)
    else
        self.TempText2().gameObject:SetActive(false)
    end
    -----刷新数量文本
    --self.Text_GearCount().text = string.format("%s/%s",#self.CurCoreList,BagViewModel.GetCoreBoxConf()[3])
    --设置核心总数
    self.GearScroll01().totalCount = #self.CurCoreList
    --刷新滑块
    if offset then
        --刷新offset位置
        self.GearScroll01():RefillCells(offset)
    else
        if self.GearScroll01().itemTypeStart > #self.CurCoreList and self.GearScroll01().itemTypeEnd > #self.CurCoreList then
            --防止滑块刷新错误
            self.GearScroll01():RefillCells(0)
        else
            --刷新数据不刷新位置
            self.GearScroll01():RefreshCells()
        end
    end
end
--更新核心锁状态
function M:UpdateCoreLockState()
    for i, v in ipairs(self.CurCoreList) do
        v.isLocked = CoreControl.GetCoreLock(v.uid)
    end
end
--核心预制回调
function M:CellCore(trans, idx)
    self:GearItem(trans.gameObject,self.CurCoreList[idx])
end
---核心列表子控件
---@param _data CoreData
function M:GearItem(_obj,_data)
    local _GearRankKuangImg = CJNUIMgr.GetSunUseName(_obj, "GearRankKuangImg"):GetComponent("Image")
    local _GearIconImg = CJNUIMgr.GetSunUseName(_obj, "GearIconImg"):GetComponent("Image")
    local _GearUpgradeText = CJNUIMgr.GetSunUseName(_obj, "GearUpgradeText"):GetComponent("TextMeshProUGUI")
    local _GearStarPrefab = CJNUIMgr.GetSunUseName(_obj, "GearStarPrefab")
    local _GearStarPanel = CJNUIMgr.GetSunUseName(_obj, "GearStarPanel")
    local _Gear_Img_Suo = CJNUIMgr.GetSunUseName(_obj, "Gear_Img_Suo")
    local _QiconBg_Gong = CJNUIMgr.GetSunUseName(_obj, "QiconBg_Gong")
    local _QiconBg_Fang = CJNUIMgr.GetSunUseName(_obj, "QiconBg_Fang")
    local _SelectIconImg = CJNUIMgr.GetSunUseName(_obj, "SelectIconImg")
    local _DeletIconImg = CJNUIMgr.GetSunUseName(_obj, "DeletIconImg")
    _SelectIconImg.gameObject:SetActive(false)
    
    --强化等级
    _GearUpgradeText.text = "+" .. _data.level
    --星级
    if _data.star > 0 then
        _GearStarPanel.gameObject:SetActive(true)
        for i = 1, self.maxStar do
            local tStarPre = nil
            if _GearStarPanel.transform.childCount < self.maxStar then
                tStarPre = GameObject.Instantiate(_GearStarPrefab.gameObject,_GearStarPanel.transform,false).transform
            else
                tStarPre = _GearStarPanel.transform:GetChild(i-1).transform
            end
            
            if i <= _data.star then
                if _data.quality == 5 then
                    tStarPre:Find("SpecialHighLight").gameObject:SetActive(true)
                    tStarPre:Find("HighLight").gameObject:SetActive(false)
                else
                    tStarPre:Find("SpecialHighLight").gameObject:SetActive(false)
                    tStarPre:Find("HighLight").gameObject:SetActive(true)
                end
            else
                tStarPre:Find("SpecialHighLight").gameObject:SetActive(false)
                tStarPre:Find("HighLight").gameObject:SetActive(false)
            end
        end
        
    else
        _GearStarPanel.gameObject:SetActive(false)
    end
    _GearStarPrefab.gameObject:SetActive(false)
    --锁
    _Gear_Img_Suo.gameObject:SetActive(CoreControl.GetCoreLock(_data.uid) == 1)

    --设置核心图标
    MgrRes.LoadSprite(_GearIconImg, _data.icon)
    --设置核心图标
    _QiconBg_Gong.gameObject:SetActive(false)
    _QiconBg_Fang.gameObject:SetActive(false)
    for i = 1, 2 do
        if i <= #_data.armorGroup then
            local QiconBg = _QiconBg_Gong.gameObject
            if _data.armorGroup[i].group == 1 then
                QiconBg = _QiconBg_Fang.gameObject
            end
            QiconBg:SetActive(true)
            local Qicon = CJNUIMgr.GetSunUseName(QiconBg, "Qicon"):GetComponent("Image")
            local skinData = HeroControl.GetSkinDataByRoleID(_data.armorGroup[i].roleID)
            MgrRes.LoadCircleIcon(Qicon, skinData.id)
        end
    end

    --设置品质图片
    MgrRes.LoadSprite(_GearRankKuangImg, "Item/Rank/ItemRank_".._data.iconFrameGear)
    --选择框
    if self:GetSelectedCore(_data.uid) then
        _DeletIconImg.gameObject:SetActive(true)
    else
        _DeletIconImg.gameObject:SetActive(false)
    end
    --点击
    UIEvent.LuaClick(_obj, function()
        --当前选中核心
        self.CurCoreObj = _obj
        --展示所选的核心
        self:ShowGear(_data)
        --选中框
        if self.CurSelectIcon then
            self.CurSelectIcon.gameObject:SetActive(false)
        end
        self.CurSelectIcon = _SelectIconImg
        self.CurSelectIcon.gameObject:SetActive(true)
        if CoreControl.GetCoreLock(_data.uid) == 1 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_yangcheng_text156"),1},true)
            return
        end
        local tSelected = self:GetSelectedCore(_data.uid) ~= nil
        --分解框
        _DeletIconImg.gameObject:SetActive(not tSelected)
        --添加或者删除核心数据
        self:AddOrDeleteCore(_data,tSelected)
        --按钮状态
        self:CheckBtnState()
    end)
end

---创建标签
function M:CreateFilterToggle(filters,prefab,parentTrans,callback,noIdx)
    local toggles = {}
    for idx, name in ipairs(filters) do
        if noIdx then
            local tStr = string.split(name,',')
            local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
            togTrans:GetComponent("UITemplate"):SetData({tStr[2],function(...)
                callback(tonumber(tStr[1]),...)
            end})
            toggles[idx] = togTrans:GetComponent("Toggle")
        else
            local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
            togTrans:GetComponent("UITemplate"):SetData({name,function(...)
                callback(idx,...)
            end})
            toggles[idx] = togTrans:GetComponent("Toggle")
        end
    end
    return toggles
end

---@param data CoreData
---展示所选的核心
function M:ShowGear(_data)
    self.CurCore = _data
    --核心名
    self.GearNameTxt().text = _data.name
    --核心等级
    self.GearUpgradeText().text = "+".._data.level
    --品质框
    MgrRes.LoadSprite(self.GearRankKuangImg(),"Quality/img_core_hexingzb_bg_".._data.iconFrameGear)
    --核心
    MgrRes.LoadSprite(self.GearIconImg(),_data.icon)
    --星级
    if _data.star > 0 then
        self.GearStarPanel().gameObject:SetActive(true)
        for i, Obj in ipairs(self.StarList) do
            if i <= _data.star then
                if _data.quality == 5 then
                    Obj:Find("SpecialHighLight").gameObject:SetActive(starActive)
                    Obj:Find("HighLight").gameObject:SetActive(not starActive)
                else
                    Obj:Find("SpecialHighLight").gameObject:SetActive(not starActive)
                    Obj:Find("HighLight").gameObject:SetActive(starActive)
                end
            else
                Obj:Find("SpecialHighLight").gameObject:SetActive(false)
                Obj:Find("HighLight").gameObject:SetActive(false)
            end
        end
    else
        self.GearStarPanel().gameObject:SetActive(false)
    end
    --显示是否上锁
    self.isLocked = CoreControl.GetCoreLock(_data.uid)
    self.Gear_Img_Suo().gameObject:SetActive(self.isLocked == 1)
    --设置基础属性词条
    local GearInfoPrefab = {
        [1] = { obj = self.GearInfoPrefab1(), attrIcon = self.GearInfoIcon(), attrName = self.GearInfoNameTxt(), attrTxt = self.GearInfoText() },
        [2] = { obj = self.GearInfoPrefab2(), attrIcon = self.GearInfoIcon01(), attrName = self.GearInfoNameTxt01(), attrTxt = self.GearInfoText01() },
    }
    for i, v in ipairs(GearInfoPrefab) do
        if _data.attrs[i] then
            v.obj.gameObject:SetActive(true)
            --属性图标
            MgrRes.LoadSprite(v.attrIcon, "Attribute/GearInfoIcon_" .. _data.attrs[i].attrID)
            --属性值
            local value = 0
            if _data.attrs[i].type == 0 then
                value = string.format("%.0f", _data.attrs[i].attribute)
            else
                value = string.format("%.2f", _data.attrs[i].attribute) .. "%"
            end
            v.attrTxt.text = value
            --属性名称
            v.attrName.text = _data.attrs[i].attrName
        else
            v.obj.gameObject:SetActive(false)
        end
    end

    if not self.LeftPanel().gameObject.activeSelf then
        self.LeftPanel().gameObject:SetActive(true)
        self.TempText1().gameObject:SetActive(false)
    end
end
---更新分解获得道具
function M:RefreshResolveItems()
    local tResolveItems = {}
    for i, v in pairs(self.SingleChooseCoreList) do
        local tGood = v.decompose.goods
        for i, v in ipairs(tGood) do
            if tResolveItems[v.goodsID] == nil then
                tResolveItems[v.goodsID] = clone(v)
            else
                tResolveItems[v.goodsID].goodsNum = v.goodsNum + tResolveItems[v.goodsID].goodsNum
            end
        end
    end

    Tools.ClearAllChild(self.ResolveItem().gameObject)
    if tResolveItems == nil then
        return
    end
    for i, v in pairs(tResolveItems) do
        local tItem = GameObject.Instantiate(self.ResolveItemQuality().gameObject,self.ResolveItem().transform,false).transform
        ---@type ItemData
        local item = ItemControl.GetItemByIdAndType(v.goodsID,v.goodsType)
        --品质框
        MgrRes.LoadSprite(tItem:GetComponent("Image"),item.iconFrame)
        --道具
        MgrRes.LoadSprite(tItem:Find("GearIconImg"):GetComponent("Image"),item.icon)
        --道具数量
        tItem:Find("Img_ItemCountBg"):Find("ItemCountText"):GetComponent("TextMeshProUGUI").text = v.goodsNum

        tItem.gameObject:SetActive(true)
    end
end
---解锁上锁按钮
function M:ClickLockIcon()
    if self.isLocked == 1 then
        --弹出解锁确认界面
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
            self.isLocked = 0
            --更新当前锁状态
            self.Gear_Img_Suo().gameObject:SetActive(false)
            local _Gear_Img_Suo = CJNUIMgr.GetSunUseName(self.CurCoreObj, "Gear_Img_Suo")
            _Gear_Img_Suo.gameObject:SetActive(false)
            CoreControl.SaveCoreLock(self.CurCore.uid,0)
        end,nil,2},true)
    else
        self.isLocked = 1
        --更新当前锁状态
        self.Gear_Img_Suo().gameObject:SetActive(true)
        local _Gear_Img_Suo = CJNUIMgr.GetSunUseName(self.CurCoreObj, "Gear_Img_Suo")
        _Gear_Img_Suo.gameObject:SetActive(true)
        CoreControl.SaveCoreLock(self.CurCore.uid,1)
        --上锁后去掉选中状态
        local _DeletIconImg = CJNUIMgr.GetSunUseName(self.CurCoreObj, "DeletIconImg")
        _DeletIconImg.gameObject:SetActive(false)
        --删除选中核心数据
        self:AddOrDeleteCore(self.CurCore,true)
        --按钮状态
        self:CheckBtnState()
    end
end
---获取选择核心数据
function M:GetSelectedCore(uid)
    for i, v in pairs(self.SingleChooseCoreList) do
        if v.uid == uid then
            return v
        end
    end
    return nil
end
---添加或者删除核心数据
function M:AddOrDeleteCore(coredata,isDelete)
    if isDelete then
        for i, v in pairs(self.SingleChooseCoreList) do
            if v.uid == coredata.uid then
                table.remove(self.SingleChooseCoreList,i)
                break
            end
        end
    else
        table.insert(self.SingleChooseCoreList,coredata)
    end
end

---按钮状态
function M:CheckBtnState()
    self.Btn_Fenjie_H().gameObject:SetActive(#self.SingleChooseCoreList > 0)
    --更新分解获得道具
    self:RefreshResolveItems()
end
---快速选择
function M:FastSelect(_star)
    local tJumpId = 0
    self.SingleChooseCoreList = {}
    if _star > 0 then
        for i, v in ipairs(self.CurCoreList) do
            if v.star <= _star and v.isLocked == 0 then
                table.insert(self.SingleChooseCoreList, v)
                if tJumpId == 0 then
                    tJumpId = i
                end
            end
        end
    end

    self.GearScroll01():RefillCells(tJumpId)
    self:CheckBtnState()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M