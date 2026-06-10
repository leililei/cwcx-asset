-- Code Auto Create Begin
local M = Class('VoidGearDetail_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VoidGearDetail_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VoidGearDetail_UI].prefab'
    self.Name = 'Form[VoidGearDetail_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Equipbg','Equipbg',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_PanelBack','ReturnBg/Btn_PanelBack',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'vfxroot','vfxroot',2},{'LeftPanel','vfxroot/LeftPanel',2},{'yuandi','vfxroot/LeftPanel/VoidGearIconPanel/yuandi',2},{'VoidGearIconImg','vfxroot/LeftPanel/VoidGearIconPanel/VoidGearIconImg',2},{'Img_Weihuoqudi','vfxroot/LeftPanel/VoidGearIconPanel/Img_Weihuoqudi',2},{'yuan(bai)','vfxroot/LeftPanel/VoidGearIconPanel/yuan(bai)',2},{'VoidGearRankImg','vfxroot/LeftPanel/VoidGearIconPanel/VoidGearRankImg',2},{'VoidDetailBtnPanel','vfxroot/LeftPanel/VoidDetailBtnPanel',2},{'yuan','vfxroot/LeftPanel/VoidDetailBtnPanel/yuan',2},{'Btn_Next','vfxroot/LeftPanel/VoidDetailBtnPanel/Btn_Next',2},{'Btn_Previous','vfxroot/LeftPanel/VoidDetailBtnPanel/Btn_Previous',2},{'RightPanel','vfxroot/RightPanel',2},{'VoidGearDetailPanel','vfxroot/RightPanel/VoidGearDetailPanel',2},{'xian','vfxroot/RightPanel/VoidGearDetailPanel/xian',2},{'VoidGearInfoPanel','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoPanel',2},{'Viewport','vfxroot/RightPanel/VoidGearDetailPanel/Scroll View/Viewport',2},{'Equipxiabiao','vfxroot/RightPanel/VoidGearDetailPanel/Equipxiabiao',2},{'Img_EquipBG','vfxroot/RightPanel/VoidGearDetailPanel/Img_EquipBG',2},{'VoidGearInfoPrefab','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoPrefab',2},{'VoidGearInfoBG','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoPrefab/VoidGearInfoBG',2},{'VoidGearIconBg','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoPrefab/VoidGearInfoBG/VoidGearIconBg',2},{'VoidGearIcon','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoPrefab/VoidGearInfoBG/VoidGearIconBg/VoidGearIcon',2},{'VoidGearExpPanel','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearExpPanel',2},{'VoidGearLvDotPrefab','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearExpPanel/VoidGearLvDotPrefab',2},{'VoidGearLvDotRoot','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearExpPanel/VoidGearLvDotRoot',2},{'VoidGearBtnPanel','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearBtnPanel',2},{'Btn_Upgrade','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearBtnPanel/Btn_Upgrade',2},{'Buttonxian','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearBtnPanel/Btn_Upgrade/Buttonxian',2},{'VoidGearOwnerPanel','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearOwnerPanel',2},{'QiconBg','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearOwnerPanel/QiconBg',2},{'VoidGearOwnerIcon','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearOwnerPanel/QiconBg/VoidGearOwnerIcon',2},{'QiconFrame','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearOwnerPanel/QiconBg/VoidGearOwnerIcon/QiconFrame',2},{'VoidGearUpgradePanel','vfxroot/RightPanel/VoidGearUpgradePanel',2},{'xian1','vfxroot/RightPanel/VoidGearUpgradePanel/xian1',2},{'xian2','vfxroot/RightPanel/VoidGearUpgradePanel/xian2',2},{'Btn_Upgrade01','vfxroot/RightPanel/VoidGearUpgradePanel/Btn_Upgrade',2},{'kuangxian','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/kuangxian',2},{'VoidGearInfoPrefab01','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab',2},{'VoidGearInfoBg','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab/VoidGearInfoBg',2},{'VoidGearIconBg01','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab/VoidGearInfoBg/VoidGearIconBg',2},{'VoidGearIcon01','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab/VoidGearInfoBg/VoidGearIconBg/VoidGearIcon',2},{'>','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab/VoidGearInfoBg/>',2},{'VoidGearInfoPanel01','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPanel',2},{'VoidGearUpgradeNeedPanel','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearUpgradeNeedPanel',2},{'VoidGearUpgradeNeedPanel01','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearUpgradeNeedPanel/VoidGearUpgradeNeedPanel',2},{'NeedItemIcon','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearUpgradeNeedPanel/VoidGearUpgradeNeedPanel/NeedItemIcon',2},{'NeedItemIcon01','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearUpgradeNeedPanel/VoidGearUpgradeNeedPanel/NeedItemIcon',2},{'xian01','vfxroot/RightPanel/VoidGearUpgradePanel/xian',2},{'DunBiItem','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/DunBiItem',2},{'Btn_Add','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/DunBiItem/Btn_Add',2},{'Jingyingquanicon(jian)','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/DunBiItem/Jingyingquanicon(jian)',2},{'GongmingItem','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/GongmingItem',2},{'Btn_Add01','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/GongmingItem/Btn_Add',2},{'Putongquanicon(jian)','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/GongmingItem/Putongquanicon(jian)',2},{'GongmingItem01','vfxroot/RightPanel/VoidGearUpgradePanel/GongmingItem',2},{'Img_MinBg','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Img_MinBg',2},{'zuidazuixiaodi2','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Img_MinBg/zuidazuixiaodi2',2},{'Btn_Sub','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Sub',2},{'Img_SubD','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Sub/Img_SubD',2},{'Img_Sub','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Sub/Img_Sub',2},{'Img_MaxBg','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Img_MaxBg',2},{'zuidazuixiaodi1','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Img_MaxBg/zuidazuixiaodi1',2},{'Btn_Add02','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Add',2},{'Img_AddD','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Add/Img_AddD',2},{'Img_Add','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Add/Img_Add',2},{'Btn_Min','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Min',2},{'zuidazuixiaodi201','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Min/zuidazuixiaodi2',2},{'Btn_MinHighLight','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_MinHighLight',2},{'zuidazuixiaodi202','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_MinHighLight/zuidazuixiaodi2',2},{'Btn_Max','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Max',2},{'zuidazuixiaodi101','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Max/zuidazuixiaodi1',2},{'Btn_DecreaseHighLight','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_DecreaseHighLight',2},{'-(hei)','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_DecreaseHighLight/-(hei)',2},{'Btn_MaxHighLight','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_MaxHighLight',2},{'zuidazuixiaodi102','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_MaxHighLight/zuidazuixiaodi1',2},{'Btn_Decrease','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Decrease',2},{'-(hui)','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Decrease/-(hui)',2},{'Btn_AddHighLight','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_AddHighLight',2},{'+(hei)','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_AddHighLight/+(hei)',2},{'Btn_AddCount','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_AddCount',2},{'+(hui)','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_AddCount/+(hui)',2},{'di(lv)','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/di(lv)',2},{'VoidGearUpgradeSuccessPanel','vfxroot/VoidGearUpgradeSuccessPanel',2},{'Btn_Back','vfxroot/VoidGearUpgradeSuccessPanel/Btn_Back',2},{'BG','vfxroot/VoidGearUpgradeSuccessPanel/BG',2},{'Zhuangshixian(shang)','vfxroot/VoidGearUpgradeSuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','vfxroot/VoidGearUpgradeSuccessPanel/BG/zhuangshixian(yangcheng)',2},{'chenggongdi','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi',2},{'LvInfoPanel','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/LvInfoPanel',2},{'Jiantou','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/LvInfoPanel/Jiantou',2},{'VoidGearInfoDataPrefab','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataPrefab',2},{'iconBg','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataPrefab/iconBg',2},{'VoidGearIcon02','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataPrefab/iconBg/VoidGearIcon',2},{'Jiantou01','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataPrefab/Jiantou',2},{'VoidGearInfoDataRoot','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataRoot',2},{'Img_Dian','vfxroot/VoidGearUpgradeSuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','vfxroot/VoidGearUpgradeSuccessPanel/FightResult/Img_Heidi',2},{'Img_Yinying','vfxroot/VoidGearUpgradeSuccessPanel/FightResult/Img_Yinying',2},{'LockPanel','LockPanel',2},
        -- TextMeshProUGUI 列表
        {'CnBgTitle','ReturnBg/CnBgTitle',20},{'EnBgTitle','ReturnBg/EnBgTitle',20},{'Text_Weihuoqu','vfxroot/LeftPanel/VoidGearIconPanel/Img_Weihuoqudi/Text_Weihuoqu',20},{'VoidGearModelTypeText','vfxroot/LeftPanel/VoidDetailBtnPanel/yuan/VoidGearModelTypeText',20},{'VoidGearNameText','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearNameText',20},{'VoidGearDesText','vfxroot/RightPanel/VoidGearDetailPanel/Scroll View/Viewport/VoidGearDesText',20},{'VoidGearInfoTitle','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoTitle',20},{'VoidGearInfoNameText','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoPrefab/VoidGearInfoBG/VoidGearInfoNameText',20},{'VoidGearInfoText','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearInfoPrefab/VoidGearInfoBG/VoidGearInfoText',20},{'VoidGearLvTitle','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearExpPanel/VoidGearLvTitle',20},{'VoidGearLvText','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearExpPanel/VoidGearLvTitle/VoidGearLvText',20},{'Btn_Txt','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearBtnPanel/Btn_Upgrade/Btn_Txt',20},{'VoidGearOwnerText','vfxroot/RightPanel/VoidGearDetailPanel/VoidGearOwnerPanel/VoidGearOwnerText',20},{'Btn_Txt01','vfxroot/RightPanel/VoidGearUpgradePanel/Btn_Upgrade/Btn_Txt',20},{'VoidGearType','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab/VoidGearInfoBg/VoidGearType',20},{'VoidGearCurInfoText','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab/VoidGearInfoBg/VoidGearCurInfoText',20},{'VoidGearPreviewInfoText','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearInfoPreview/VoidGearInfoPrefab/VoidGearInfoBg/VoidGearPreviewInfoText',20},{'VoidGearUpgradeNeedTitle','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearUpgradeNeedPanel/VoidGearUpgradeNeedTitle',20},{'NeedItemCount','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearUpgradeNeedPanel/VoidGearUpgradeNeedPanel/NeedItemCount',20},{'NeedGMCount','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearUpgradeNeedPanel/VoidGearUpgradeNeedPanel/NeedGMCount',20},{'Text_Shengjiyulan','vfxroot/RightPanel/VoidGearUpgradePanel/Text_Shengjiyulan',20},{'Text_DBCount','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/DunBiItem/Text_DBCount',20},{'Text_GMCount','vfxroot/RightPanel/VoidGearUpgradePanel/Huobi/GongmingItem/Text_GMCount',20},{'Btn_Txt02','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Img_MinBg/Btn_Txt',20},{'Text_Max','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Img_MaxBg/Text_Max',20},{'Btn_Txt03','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Min/zuidazuixiaodi2/Btn_Txt',20},{'Btn_Txt04','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_MinHighLight/zuidazuixiaodi2/Btn_Txt',20},{'Btn_Txt05','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_Max/zuidazuixiaodi1/Btn_Txt',20},{'Btn_Txt06','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/Btn_MaxHighLight/zuidazuixiaodi1/Btn_Txt',20},{'LVTitleText','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/di(lv)/LVTitleText',20},{'CurPreviewLvText','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/di(lv)/CurPreviewLvText',20},{'MaxLvText','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/di(lv)/MaxLvText',20},{'VoidGearPreviewTipText','vfxroot/RightPanel/VoidGearUpgradePanel/VoidGearLvPreviewPanel/VoidGearPreviewTipText',20},{'LvTitleText','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/LvInfoPanel/LvTitleText',20},{'PrevLVText','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/LvInfoPanel/PrevLVText',20},{'CurLvText','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/LvInfoPanel/CurLvText',20},{'TitleText','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataPrefab/TitleText',20},{'OriginDataText','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataPrefab/OriginDataText',20},{'CurDataText','vfxroot/VoidGearUpgradeSuccessPanel/chenggongdi/VoidGearInfoDataPrefab/CurDataText',20},{'Text_FightResult','vfxroot/VoidGearUpgradeSuccessPanel/FightResult/Text_FightResult',20},{'touchtoexit','vfxroot/VoidGearUpgradeSuccessPanel/touchtoexit',20},
    }
end
-- Code Auto Create End
require("LocalData/RoleequipmentcostLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.CurrEquip = RoleCardViewModel.CurrentEquip
    self.index = 1
    self.EquipIndex = self.CurrEquip.position
    --self.EquipArr = RoleCardViewModel.CurrentHero:GetVoidEquip()
    self.EquipArr = RoleCardViewModel.CurrentHero:GetHeroVoidEquip()
    self:InitDetailPanel()  ---初始化装备详情
    self:InitButton() ---初始化按钮
    self:UpdataToUpgrade()
end

--打开界面后直接前往升级
function M:UpdataToUpgrade()
    self.index = 2
        self.VoidGearDetailPanel().gameObject:SetActive(false)
        self.VoidGearUpgradePanel().gameObject:SetActive(true)
        self:InitUpEquipPanel()
end

---初始化装备详情
function M:InitDetailPanel()
    self.fxObjArr = {}
    self.fxObjArr =
    {
        vfx = self.LeftPanel().transform:Find("vfx1"),
        Rvfx =  self.LeftPanel().transform:Find("Rvfx"),
        SRvfx =  self.LeftPanel().transform:Find("SRvfx"),
        SSRvfx =  self.LeftPanel().transform:Find("SSRvfx")
    }
    for i, v in pairs(self.fxObjArr) do
        v.gameObject:SetActive(false)
    end

    self.LockPanel().gameObject:SetActive(false)
    self.VoidGearUpgradePanel().gameObject:SetActive(false)
    self.VoidGearUpgradeSuccessPanel().gameObject:SetActive(false)
    self.VoidGearInfoPrefab().gameObject:SetActive(false)
    self:UpdataDetailPanel()
end

---初始化升级页面
function M:InitUpEquipPanel()
    self.PreviewLv =self.CurrEquip.level + 1
    self:UpdataAsset()
    self.VoidGearInfoPrefab01().gameObject:SetActive(false)
    self.VoidDetailBtnPanel().gameObject:SetActive(false)
    self:VoidGearUpgrade_InitBtnType(self.PreviewLv)
    self:VoidGearUpgrade_InitVoidGearInfoPanel()
    self:UpdataCost(self.PreviewLv)
end
---更新玩家资源
function M:UpdataAsset()
    ---@type ItemData
    local GM = ItemControl.GetItemByID(110021)
    local DB = ItemControl.GetItemByID(100001)
    self.Text_GMCount().text = JNStrTool.numberAbbr(GM.count)
    self.Text_DBCount().text = JNStrTool.numberAbbr(DB.count)
end
---初始化按钮
function M:InitButton()
    
    ---返回页面
    UIEvent.LuaClick(self.Btn_PanelBack().gameObject,Handle(self,self.BackClick))
    ---返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,function ()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    ---前往升级 之前的逻辑
    --UIEvent.LuaClick(self.Btn_Upgrade().gameObject,Handle(self,function ()
        -- self.index = 2
        -- self.VoidGearDetailPanel().gameObject:SetActive(false)
        -- self.VoidGearUpgradePanel().gameObject:SetActive(true)
        -- self:InitUpEquipPanel()
    --end))

    self.IntClicking = false  --是否在长按中
    self.EndClicking = true   --是否结束长按
    self.loopTimer = 0        --长按持续时间
    self.isAdd = true         --是否是增加

    ---增加一个预览等级
    UIEvent.LuaPressClick(self.Btn_AddHighLight().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndClicking = false
        self.loopTimer = 0
        self.isAdd = true

        ---单次点击逻辑
        self:ChangeCurPreviewLv(false)
        ---长按逻辑
        self:LoopInput()
    end)
    ---减少一个预览等级
    UIEvent.LuaPressClick(self.Btn_DecreaseHighLight().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndClicking = false
        self.loopTimer = 0
        self.isAdd = false

        ---单次点击逻辑
        self:ChangeCurPreviewLv(true)
        ---长按逻辑
        self:LoopInput()
    end)

    ---最大
    UIEvent.LuaClick(self.Btn_MaxHighLight().gameObject,Handle(self,function ()
        self:MaxLv()
    end))
    ---最小
    UIEvent.LuaClick(self.Btn_MinHighLight().gameObject,Handle(self,function ()
        self:MinLv()
    end))

    ---升级共鸣
    UIEvent.LuaClick(self.Btn_Upgrade01().gameObject,Handle(self,function ()
        self:UpdataEquipClick()
    end))
    ---升级成功返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        self.VoidGearUpgradeSuccessPanel().gameObject:SetActive(false)
        if self.CurrEquip.level>=10 then
            self:BackClick()
        end
    end))

    ---下一个共鸣装备
    UIEvent.LuaClick(self.Btn_Next().gameObject,Handle(self,function ()
        self.EquipIndex = self.EquipIndex + 1
        if self.EquipIndex > 3 then
            self.EquipIndex = 1
        end
        self.CurrEquip = self.EquipArr[self.EquipIndex]
        self:UpdataDetailPanel()
    end))
    ---上一个共鸣装备
    UIEvent.LuaClick(self.Btn_Previous().gameObject,Handle(self,function ()
        self.EquipIndex = self.EquipIndex - 1
        if self.EquipIndex <= 0 then
            self.EquipIndex = 3
        end
        self.CurrEquip = self.EquipArr[self.EquipIndex]
        self:UpdataDetailPanel()
    end))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        self:BackClick()
    end
end

---长按逻辑
function M:LoopInput()
    if self.EndClicking == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05, Handle(self, self.LoopInput), self.ObjRoot)
        self.IntClicking = true
        self.loopTimer = self.loopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.loopTimer > 5 then
            if self.isAdd then
                self:ChangeCurPreviewLv(false)   --增加
            else
                self:ChangeCurPreviewLv(true)    --减少
            end
        end
        ---循环结束
        if bool_IsUp == false then
            self.IntClicking = false
            self.EndClicking = true
            self.loopTimer = 0
        end
    end
end

function M:BackClick()
    -- if self.index ~= 1 then
    --     self.VoidGearDetailPanel().gameObject:SetActive(true)
    --     self.VoidGearUpgradePanel().gameObject:SetActive(false)
    --     self.VoidDetailBtnPanel().gameObject:SetActive(true)
    --     self:UpdataDetailPanel()
    --     self.index = 1
    -- else
        RoleCardViewModel.isBackEquipToRole = true
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
        Event.Go("UpdataDetailPanel")
    --end
end
---更新装备详情
function M:UpdataDetailPanel()
    ---图标
    MgrRes.LoadSprite(self.VoidGearIconImg(), self.CurrEquip.icon)
    ---框
    MgrRes.LoadSprite(self.VoidGearRankImg(), self.CurrEquip.iconLFrame)
    ---部位
    if self.CurrEquip.position == 1 then
        self.VoidGearModelTypeText().text = MgrLanguageData.GetLanguageByKey("voidgeardetail_ui_weapon")
    elseif self.CurrEquip.position == 2 then
        self.VoidGearModelTypeText().text = MgrLanguageData.GetLanguageByKey("voidgeardetail_ui_armoured")
    else
        self.VoidGearModelTypeText().text = MgrLanguageData.GetLanguageByKey("voidgeardetail_ui_energy")
    end
    self.VoidGearNameText().text= self.CurrEquip.name
    self.VoidGearDesText().text = self.CurrEquip.txt
    Tools.ClearAllChild(self.VoidGearLvDotRoot().gameObject)
    if self.CurrEquip.lockState then
        self.Img_Weihuoqudi().gameObject:SetActive(false)
        self.VoidGearInfoTitle().gameObject:SetActive(true)
        self.VoidGearExpPanel().gameObject:SetActive(true)
        self.VoidGearInfoPanel().gameObject:SetActive(true)
        self.Equipxiabiao().gameObject:SetActive(true)
        self.Img_EquipBG().gameObject:SetActive(true)
        self.VoidGearOwnerPanel().gameObject:SetActive(true)
        self.VoidGearBtnPanel().gameObject:SetActive(true)
        if self.CurrEquip.level>=10 then
            self.VoidGearBtnPanel().gameObject:SetActive(false)
        else
            self.VoidGearBtnPanel().gameObject:SetActive(true)
        end
        self.VoidGearLvText().text ="<size=120>"..self.CurrEquip.level.."</size>/10"
        for i = 1, self.CurrEquip.level do
            local obj =  GameObject.Instantiate(self.VoidGearLvDotPrefab().gameObject,self.VoidGearLvDotRoot().transform)
            obj:SetActive(true)
        end
        MgrRes.LoadCircleIcon(self.VoidGearOwnerIcon(), RoleCardViewModel.CurrentHero.id)
        ---填充属性
        Tools.ClearAllChild(self.VoidGearInfoPanel().gameObject)
        local _VoidInfoTab=JNStrTool.strSplit(",",self.CurrEquip.attribute)
        for i, v in pairs(_VoidInfoTab) do   -- 1_lv*20     3_lv3*0
            local _tempInfoTab1=JNStrTool.strSplit("_",v) --切割获取对应的属性类型和具体计算公式 1    lv*20
            local _tempInfoTab2=JNStrTool.strSplit("*",_tempInfoTab1[2]) --切割公式拿到等级相关系数  lv  20
            local attrData = self.CurrEquip.level*tonumber(_tempInfoTab2[2])
            local obj = GameObject.Instantiate(self.VoidGearInfoPrefab().gameObject,self.VoidGearInfoPanel().transform)
            obj:SetActive(true)
            local VoidGearIcon = obj.transform:Find("VoidGearInfoBG/VoidGearIconBg/VoidGearIcon"):GetComponent("Image")
            local VoidGearInfoNameText = obj.transform:Find("VoidGearInfoBG/VoidGearInfoNameText"):GetComponent("TextMeshProUGUI")
            local VoidGearInfoText = obj.transform:Find("VoidGearInfoBG/VoidGearInfoText"):GetComponent("TextMeshProUGUI")
            MgrRes.LoadSprite(VoidGearIcon,"Attribute/GearInfoIcon_".._tempInfoTab1[1])
            if _tempInfoTab1[1] == "0" then
                -- 固定攻击
                VoidGearInfoText.text=""..attrData
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
            elseif _tempInfoTab1[1] == "1" then
                -- 百分比攻击
                VoidGearInfoText.text=""..(attrData*0.01).."%"
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
            elseif _tempInfoTab1[1] == "2" then
                -- 固定生命
                VoidGearInfoText.text=""..attrData
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_health")
            elseif _tempInfoTab1[1] == "3" then
                -- 百分比生命
                VoidGearInfoText.text=""..(attrData*0.01).."%"
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_health")
            elseif _tempInfoTab1[1] == "4" then
                -- 防御
                VoidGearInfoText.text=""..(attrData*0.01).."%"
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_defense")
            elseif _tempInfoTab1[1] == "5" then
                -- 暴击
                VoidGearInfoText.text=""..(attrData*0.01).."%"
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_critical")
            elseif _tempInfoTab1[1] == "6" then
                -- 暴伤
                VoidGearInfoText.text=""..(attrData*0.01).."%"
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_criticaldamage")
            elseif _tempInfoTab1[1] == "7" then
                -- 敏捷
                VoidGearInfoText.text=""..(attrData*0.01).."%"
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_agile")
            elseif _tempInfoTab1[1] == "8" then
                -- 支援力
                VoidGearInfoText.text=""..(attrData*0.01).."%"
                VoidGearInfoNameText.text=MgrLanguageData.GetLanguageByKey("coreattrdata_support")
            end
        end
    else
        self.Img_Weihuoqudi().gameObject:SetActive(true)
        self.VoidGearInfoTitle().gameObject:SetActive(false)
        self.VoidGearExpPanel().gameObject:SetActive(false)
        self.VoidGearInfoPanel().gameObject:SetActive(false)
        self.Equipxiabiao().gameObject:SetActive(false)
        self.Img_EquipBG().gameObject:SetActive(false)
        self.VoidGearOwnerPanel().gameObject:SetActive(false)
        self.VoidGearBtnPanel().gameObject:SetActive(false)
    end
end

---根据当前预览等级切换按钮状态
function M:VoidGearUpgrade_InitBtnType(_Lv)
    if _Lv >= 10 then
        -- 超过最大等级
        self:VoidGearUpgrade_SwitchBtnType("1")
    elseif _Lv <= self.CurrEquip.level + 1 then
        -- 小于初始等级
        self:VoidGearUpgrade_SwitchBtnType("2")
    else
        -- 正常等级范围内
        self:VoidGearUpgrade_SwitchBtnType("3")
    end
    if _Lv > self.CurrEquip.level then
        -- 当前预览等级超过初始等级
        self.Btn_Upgrade01().gameObject:SetActive(true)
    else
        self.Btn_Upgrade01().gameObject:SetActive(false)
    end
    if self.CurrEquip.level>=10 then
        self:VoidGearUpgrade_SwitchBtnType("4")
        self.Btn_Upgrade01().gameObject:SetActive(false)
    end
end
---根据类型切换当前加减按钮显示状态
function M:VoidGearUpgrade_SwitchBtnType(_Type)
    -- statements
    if _Type == "1" then
        self.Btn_Min().gameObject:SetActive(false)
        self.Btn_MinHighLight().gameObject:SetActive(true)
        self.Btn_Max().gameObject:SetActive(true)
        self.Btn_MaxHighLight().gameObject:SetActive(false)
        self.Btn_Decrease().gameObject:SetActive(false)
        self.Btn_DecreaseHighLight().gameObject:SetActive(true)
        self.Btn_AddCount().gameObject:SetActive(false)
        self.Btn_AddHighLight().gameObject:SetActive(true)
    elseif _Type == "2" then
        self.Btn_Min().gameObject:SetActive(true)
        self.Btn_MinHighLight().gameObject:SetActive(false)
        self.Btn_Max().gameObject:SetActive(false)
        self.Btn_MaxHighLight().gameObject:SetActive(true)
        self.Btn_Decrease().gameObject:SetActive(false)
        self.Btn_DecreaseHighLight().gameObject:SetActive(true)
        self.Btn_AddCount().gameObject:SetActive(false)
        self.Btn_AddHighLight().gameObject:SetActive(true)
    elseif _Type == "3" then
        -- 两个按钮都高亮
        self.Btn_Min().gameObject:SetActive(false)
        self.Btn_MinHighLight().gameObject:SetActive(true)
        self.Btn_Max().gameObject:SetActive(false)
        self.Btn_MaxHighLight().gameObject:SetActive(true)
        self.Btn_Decrease().gameObject:SetActive(false)
        self.Btn_DecreaseHighLight().gameObject:SetActive(true)
        self.Btn_AddCount().gameObject:SetActive(false)
        self.Btn_AddHighLight().gameObject:SetActive(true)
    elseif _Type == "4" then
        -- 两个按钮都不亮
        self.Btn_Min().gameObject:SetActive(true)
        self.Btn_MinHighLight().gameObject:SetActive(false)
        self.Btn_Max().gameObject:SetActive(true)
        self.Btn_MaxHighLight().gameObject:SetActive(false)
        self.Btn_Decrease().gameObject:SetActive(true)
        self.Btn_DecreaseHighLight().gameObject:SetActive(false)
        self.Btn_AddCount().gameObject:SetActive(true)
        self.Btn_AddHighLight().gameObject:SetActive(false)
    end
end

---根据当前的预览等级初始化对应的属性信息UI
function M:VoidGearUpgrade_InitVoidGearInfoPanel()
    --切割共鸣装备表中的装备属性字段获得属性信息表
    if self.PreviewLv > self.CurrEquip.maxLevel then --共鸣装备满级不显示下一级
        self.PreviewLv = self.CurrEquip.maxLevel
    end
    self.CurPreviewLvText().text = self.PreviewLv
    ---填充属性
    Tools.ClearAllChild(self.VoidGearInfoPanel01().gameObject)
    local _VoidInfoTab=JNStrTool.strSplit(",",self.CurrEquip.attribute)
    for key, value in pairs(_VoidInfoTab) do
        -- 根据切割完的信息表循环添加共鸣装备属性词条
        local _VoidGearInfoObj= GameObject.Instantiate(self.VoidGearInfoPrefab01().gameObject,self.VoidGearInfoPanel01().transform)
        _VoidGearInfoObj:SetActive(true)
        local _tempInfoTab1=JNStrTool.strSplit("_",value) --切割获取对应的属性类型和具体计算公式
        --根据得到的属性类型更新属性图标和文字
        local _VoidGearCurInfoText = _VoidGearInfoObj.transform:Find("VoidGearInfoBg/VoidGearCurInfoText"):GetComponent("TextMeshProUGUI")
        local _VoidGearPreviewInfoText= _VoidGearInfoObj.transform:Find("VoidGearInfoBg/VoidGearPreviewInfoText"):GetComponent("TextMeshProUGUI")
        local _VoidGearIcon = _VoidGearInfoObj.transform:Find("VoidGearInfoBg/VoidGearIconBg/VoidGearIcon"):GetComponent("Image")
        local _VoidGearType = _VoidGearInfoObj.transform:Find("VoidGearInfoBg/VoidGearType"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(_VoidGearIcon,"Attribute/GearInfoIcon_".._tempInfoTab1[1])
        local _tempInfoTab2=JNStrTool.strSplit("*",_tempInfoTab1[2]) --切割公式拿到等级相关系数
        local _CurInfoData=tonumber(self.CurrEquip.level)*tonumber(_tempInfoTab2[2])
        local _OrginInfoData=tonumber(self.PreviewLv)*tonumber(_tempInfoTab2[2])
        --处理输出的显示属性信息字符串
        local _OriginRateDataStr=""..(_OrginInfoData*0.01).."%"
        local _CurRateDataStr= ""..(_CurInfoData*0.01).."%"
        local _OriginDataStr="".._OrginInfoData
        local _CurDataStr="".._CurInfoData
        if self.CurrEquip.level == self.PreviewLv then
            --与初始等级相同的等级的属性信息字符串，不做变色处理
            _CurRateDataStr=""..(_CurInfoData*0.01).."%"
            _CurDataStr="".._CurInfoData
        else
            --与初始等级不用的信息预览，变色预览信息为绿色
            _OriginRateDataStr="<color=#3AFFC5>"..(_OrginInfoData*0.01).."%</color>"
            _OriginDataStr="<color=#3AFFC5>".._OrginInfoData.."</color>"
            self.CurPreviewLvText().text = "<color=#FFCC4C>"..self.PreviewLv.."</color>"
        end
        if _tempInfoTab1[1] == "0" then
            -- 固定攻击
            _VoidGearCurInfoText.text="".._CurDataStr
            _VoidGearPreviewInfoText.text="".._OriginDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        elseif _tempInfoTab1[1] == "1" then
            -- 百分比攻击
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        elseif _tempInfoTab1[1] == "2" then
            -- 固定生命
            _VoidGearCurInfoText.text="".._CurDataStr
            _VoidGearPreviewInfoText.text="".._OriginDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_health")
        elseif _tempInfoTab1[1] == "3" then
            -- 百分比生命
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_health")
        elseif _tempInfoTab1[1] == "4" then
            -- 防御
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_defense")
        elseif _tempInfoTab1[1] == "5" then
            -- 暴击
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_critical")
        elseif _tempInfoTab1[1] == "6" then
            -- 暴伤
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_criticaldamage")
        elseif _tempInfoTab1[1] == "7" then
            -- 敏捷
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_agile")
        elseif _tempInfoTab1[1] == "8" then
            -- 支援力
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_support")
        end
    end
end

---增加或减少预览等级
function M:ChangeCurPreviewLv(_IsDecrease)
    -- 是否减少等级
    if _IsDecrease == true then
        -- 减少等级
        if self.CurrEquip.level < self.PreviewLv then
            -- 不可小于初始等级
            self.PreviewLv =  self.PreviewLv  - 1
            if self.PreviewLv == self.CurrEquip.level then
                self.PreviewLv = self.PreviewLv + 1
            end
        end
    else
        -- 增加等级
        if  self.PreviewLv < 10 then
            -- 不可小于初始等级
            self.PreviewLv  =  self.PreviewLv  + 1
        end
    end
    self:VoidGearUpgrade_InitBtnType(self.PreviewLv)
    self:VoidGearUpgrade_InitVoidGearInfoPanel()
    self:UpdataCost(self.PreviewLv)
  --  self:InitVoidGearUpgradeNeedPanel(JNVoidGear.CurPreviewVoidGear,self.PreviewLv)
end

function M:MaxLv()
    self.PreviewLv = self.CurrEquip.maxLevel--self:GetPreviewLv()
    self:VoidGearUpgrade_InitBtnType(self.PreviewLv)
    self:VoidGearUpgrade_InitVoidGearInfoPanel()
    self:UpdataCost(self.PreviewLv)
end

function M:MinLv()
    self.PreviewLv = self.CurrEquip.level + 1
    self:VoidGearUpgrade_InitBtnType(self.PreviewLv)
    self:VoidGearUpgrade_InitVoidGearInfoPanel()
    self:UpdataCost(self.PreviewLv)
end
function M:UpdataCost(PreviewLv)
    self.costMoney = 0
    self.costGongMing = 0
    local GM = ItemControl.GetItemByID(110021)
    local DB = ItemControl.GetItemByID(100001)
    if PreviewLv<= self.CurrEquip.level then
        self.NeedItemCount().text = "<color=#FFFFFF>0</color>"
        self.NeedGMCount().text = "<color=#FFFFFF>0</color>"
    else
        local lv = PreviewLv
        self:GetCost(lv - 1)
        if self.costMoney > DB.count then
            self.NeedItemCount().text = "<color=#FF0000>"..self.costMoney.."</color>"
        else
            self.NeedItemCount().text = "<color=#FFFFFF>"..self.costMoney.."</color>"
        end
        if self.costGongMing > GM.count then
            self.NeedGMCount().text = "<color=#FF0000>"..self.costGongMing.."</color>"
        else
            self.NeedGMCount().text = "<color=#FFFFFF>"..self.costGongMing.."</color>"
        end
    end
end

---获得可升级的最大等级
function M:GetPreviewLv()
    local GM = ItemControl.GetItemByID(110021)
    local coin = ItemControl.GetItemByID(100001)
    if self.CurrEquip.level == 10 then
        return self.CurrEquip.level
    end
    for i = self.CurrEquip.level + 1,10 do
        self.costMoney = 0
        self.costGongMing = 0
        self:GetCost(i - 1)
        ---如果任意所需数量小于所有物品数量
        if self.costMoney > coin.count or self.costGongMing > GM.count then
            return i-1
        end
    end
    return 10
end

function M:GetCost(PreviewLv)
    if PreviewLv<self.CurrEquip.level then
        return
    end
    for i, v in pairs(RoleequipmentcostLocalData.tab) do
        if v[2] == self.CurrEquip.quality then
            if v[3] == PreviewLv then
                local arr = JNStrTool.strSplit(",",v[4])
                self.costMoney = self.costMoney + tonumber(JNStrTool.strSplit("_",arr[2])[3])
                self.costGongMing = self.costGongMing + tonumber(JNStrTool.strSplit("_",arr[1])[3])
            end
        end
    end
    self:GetCost(PreviewLv - 1)
end
---共鸣返回ACK
function M:ReceiveEquipACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEquipUPACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("voidgeardetail_ui_tips2")..tab.errNo,2},true)
    end
end

---共鸣返回NTF
function M:ReceiveEquipNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEquipUPNTF',buffer))
    self:InitEquipUpSuccessPanel()
    local Equipitem = {
        equipID = tab.equipID,
        equipLevel = tab.equipLevel
    }
    RoleCardViewModel.isBackEquipToRole = true
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    EquipControl.PushSingleEquipData(Equipitem)
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    self.CurrEquip = EquipControl.GetSingleEquips(tab.equipID)
    self.PreviewLv = self.CurrEquip.level
    self:InitUpEquipPanel()
    print(tab)
end

---初始化技能升级成功界面
function M:InitEquipUpSuccessPanel()
    -- statements
    self.VoidGearUpgradeSuccessPanel().gameObject:SetActive(true)
    self.VoidGearInfoDataPrefab().gameObject:SetActive(false)
    MgrSound.PlayEffect("yx_ui_qianghua_01",1,nil,false)
    self.PrevLVText().text=""..self.CurrEquip.level
    self.CurLvText().text=""..self.PreviewLv
    Tools.ClearAllChild(self.VoidGearInfoDataRoot().gameObject)
    local _VoidInfoTab=JNStrTool.strSplit(",",self.CurrEquip.attribute)
    for key, value in pairs(_VoidInfoTab) do
        -- 根据切割完的信息表循环添加共鸣装备属性词条
        local _VoidGearInfoObj= GameObject.Instantiate(self.VoidGearInfoDataPrefab().gameObject,self.VoidGearInfoDataRoot().transform)
        _VoidGearInfoObj:SetActive(true)
        local _tempInfoTab1=JNStrTool.strSplit("_",value) --切割获取对应的属性类型和具体计算公式
        --根据得到的属性类型更新属性图标和文字
        local _VoidGearCurInfoText = _VoidGearInfoObj.transform:Find("OriginDataText"):GetComponent("TextMeshProUGUI")
        local _VoidGearPreviewInfoText= _VoidGearInfoObj.transform:Find("CurDataText"):GetComponent("TextMeshProUGUI")
        local _VoidGearIcon = _VoidGearInfoObj.transform:Find("iconBg/VoidGearIcon"):GetComponent("Image")
        local _VoidGearType = _VoidGearInfoObj.transform:Find("TitleText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(_VoidGearIcon,"Attribute/GearInfoIcon_".._tempInfoTab1[1])
        local _tempInfoTab2=JNStrTool.strSplit("*",_tempInfoTab1[2]) --切割公式拿到等级相关系数
        local _CurInfoData=tonumber(self.CurrEquip.level)*tonumber(_tempInfoTab2[2])
        local _OrginInfoData=tonumber(self.PreviewLv)*tonumber(_tempInfoTab2[2])
        --处理输出的显示属性信息字符串
        local _OriginRateDataStr=""..(_OrginInfoData*0.01).."%"
        local _CurRateDataStr= ""..(_CurInfoData*0.01).."%"
        local _OriginDataStr="".._OrginInfoData
        local _CurDataStr="".._CurInfoData
        if _tempInfoTab1[1] == "0" then
            -- 固定攻击
            _VoidGearCurInfoText.text="".._CurDataStr
            _VoidGearPreviewInfoText.text="".._OriginDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        elseif _tempInfoTab1[1] == "1" then
            -- 百分比攻击
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        elseif _tempInfoTab1[1] == "2" then
            -- 固定生命
            _VoidGearCurInfoText.text="".._CurDataStr
            _VoidGearPreviewInfoText.text="".._OriginDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_health")
        elseif _tempInfoTab1[1] == "3" then
            -- 百分比生命
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_health")
        elseif _tempInfoTab1[1] == "4" then
            -- 防御
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_defense")
        elseif _tempInfoTab1[1] == "5" then
            -- 暴击
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_critical")
        elseif _tempInfoTab1[1] == "6" then
            -- 暴伤
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_criticaldamage")
        elseif _tempInfoTab1[1] == "7" then
            -- 敏捷
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_agile")
        elseif _tempInfoTab1[1] == "8" then
            -- 支援力
            _VoidGearCurInfoText.text="".._CurRateDataStr
            _VoidGearPreviewInfoText.text="".._OriginRateDataStr
            _VoidGearType.text = MgrLanguageData.GetLanguageByKey("coreattrdata_support")
        end
    end
end

---升级请求
function M:UpdataEquipClick()
    local GM = ItemControl.GetItemByID(110021)
    local DB = ItemControl.GetItemByID(100001)
    if DB.count<self.costMoney then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips8"),1},true)
        return
    end
    if GM.count<self.costGongMing then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("voidgeardetail_ui_tips3"),1},true)
        return
    end
    print("升级共鸣")
    local EquipUPREQ  =
    {
        equipID = self.CurrEquip.equipID,
        equipLevel = self.CurrEquip.level,
        targetLevel = self.PreviewLv
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientEquipUPREQ',EquipUPREQ))
    ItemControl.EquipAckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EQUIP_UP_REQ,bytes,0,nil,Handle(self,self.ReceiveEquipACK),Handle(self,self.ReceiveEquipNTF))
end
return M