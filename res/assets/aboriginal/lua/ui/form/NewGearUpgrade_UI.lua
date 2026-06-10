-- Code Auto Create Begin
local M = Class('NewGearUpgrade_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewGearUpgrade_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewGearUpgrade_UI].prefab'
    self.Name = 'Form[NewGearUpgrade_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Equipbg','Equipbg',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_PanelBack','ReturnBg/Btn_PanelBack',2},{'Btn_I','ReturnBg/Btn_I',2},{'Img_xian','ReturnBg/Img_xian',2},{'SwitchPanel','SwitchPanel',2},{'Btn_Switch','SwitchPanel/SwitchUpdata/Btn_Switch',2},{'weixuanzhongdi','SwitchPanel/SwitchUpdata/Btn_Switch/weixuanzhongdi',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight',2},{'xuanzhongdi','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight/xuanzhongdi',2},{'Btn_Switch01','SwitchPanel/SwitchDevelopment/Btn_Switch',2},{'weixuanzhongdi01','SwitchPanel/SwitchDevelopment/Btn_Switch/weixuanzhongdi',2},{'Btn_SwitchHighLight01','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight',2},{'xuanzhongdi01','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight/xuanzhongdi',2},{'RoleGear1Panel','RoleGear1Panel',2},{'GearWornPrefab','RoleGear1Panel/GearWornPrefab',2},{'GearIconImg','RoleGear1Panel/GearWornPrefab/GearIconImg',2},{'PopupPanel','PopupPanel',2},{'Img_Bg','PopupPanel/Img_Bg',2},{'GearUPBriefItem','PopupPanel/GearBriefScroll/GearUPBriefItem',2},{'GearDetailContent','PopupPanel/GearBriefScroll/GearDetailContent',2},{'VFXMask','PopupPanel/VFXMask',2},{'Btn_Choose','PopupPanel/Btn_Choose',2},{'Img_Xian2','PopupPanel/Btn_Choose/Img_Xian2',2},{'Btn_Return','PopupPanel/Btn_Return',2},{'Img_I','PopupPanel/Img_I',2},{'Btn_FilterBtnPanelClose','PopupPanel/Btn_FilterBtnPanelClose',2},{'FilterPanelPivot','PopupPanel/FilterPanelPivot',2},{'GearFilterToggleGroup','PopupPanel/FilterPanelPivot/Mask/GearFilterToggleGroup',2},{'GearBagFilterToggle','PopupPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',2},{'Btn_GearFilter','PopupPanel/FilterPanelPivot/Btn_GearFilter',2},{'shaixuandi','PopupPanel/FilterPanelPivot/Btn_GearFilter/shaixuandi',2},{'GearFilterNormal','PopupPanel/FilterPanelPivot/Btn_GearFilter/GearFilterNormal',2},{'GearFilterHighLight','PopupPanel/FilterPanelPivot/Btn_GearFilter/GearFilterHighLight',2},{'qiehuandi(you)','PopupPanel/GearSortPanel/qiehuandi(you)',2},{'GearSortToggleGroup','PopupPanel/GearSortPanel/GearSortToggleGroup',2},{'GearBagSortToggle','PopupPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',2},{'Btn_Salvage','PopupPanel/Btn_Salvage',2},{'Img','PopupPanel/Btn_Salvage/Img',2},{'UpperBtnPanel','UpperBtnPanel',2},{'ItemPanelPrefab','UpperBtnPanel/ItemPanelPrefab',2},{'Img_Itemdi','UpperBtnPanel/ItemPanelPrefab/Img_Itemdi',2},{'ItemIcon','UpperBtnPanel/ItemPanelPrefab/ItemIcon',2},{'+','UpperBtnPanel/ItemPanelPrefab/+',2},{'ItemRoot','UpperBtnPanel/ItemRoot',2},{'UpgradePreviewPanel','UpgradePreviewPanel',2},{'Right','UpgradePreviewPanel/Lvinfo/PreviewLvText/Right',2},{'ExpSliderBG','UpgradePreviewPanel/Lvinfo/ExpSliderBG',2},{'SourceExpSlider','UpgradePreviewPanel/Lvinfo/ExpSliderBG/SourceExpSlider',2},{'ExpSlider','UpgradePreviewPanel/Lvinfo/ExpSliderBG/ExpSlider',2},{'GearUpgradePrefab','UpgradePreviewPanel/GearUpgradePrefab',2},{'iconBg','UpgradePreviewPanel/GearUpgradePrefab/iconBg',2},{'VoidGearIcon','UpgradePreviewPanel/GearUpgradePrefab/iconBg/VoidGearIcon',2},{'Jiantou','UpgradePreviewPanel/GearUpgradePrefab/InfoPanel/CurDataText/Jiantou',2},{'GearUpgradeRoot','UpgradePreviewPanel/GearUpgradeRoot',2},{'UpgradeNeedPanel','UpgradeNeedPanel',2},{'Img_Biaotixian2','UpgradeNeedPanel/Text_NeedTitle/Img_Biaotixian2',2},{'Btu_AutoAdd','UpgradeNeedPanel/Btu_AutoAdd',2},{'Img_Zidongtianjiadi','UpgradeNeedPanel/Btu_AutoAdd/Img_Zidongtianjiadi',2},{'NeedPrefab','UpgradeNeedPanel/NeedPrefab',2},{'Img_Hexindi','UpgradeNeedPanel/NeedPrefab/Img_Hexindi',2},{'icon','UpgradeNeedPanel/NeedPrefab/icon',2},{'Item','UpgradeNeedPanel/NeedPrefab/icon/Item',2},{'RankKuangImg','UpgradeNeedPanel/NeedPrefab/icon/Item/RankKuangImg',2},{'icon01','UpgradeNeedPanel/NeedPrefab/icon/Item/icon',2},{'Stardi','UpgradeNeedPanel/NeedPrefab/icon/Item/Stardi',2},{'EmptyStarPanelRoot','UpgradeNeedPanel/NeedPrefab/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab','UpgradeNeedPanel/NeedPrefab/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)','UpgradeNeedPanel/NeedPrefab/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)','UpgradeNeedPanel/NeedPrefab/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)','UpgradeNeedPanel/NeedPrefab/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)','UpgradeNeedPanel/NeedPrefab/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)','UpgradeNeedPanel/NeedPrefab/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'StarPanelRoot','UpgradeNeedPanel/NeedPrefab/icon/Item/StarPanelRoot',2},{'GearStarPrefab','UpgradeNeedPanel/NeedPrefab/icon/Item/GearStarPrefab',2},{'GearSpecialStarPrefab','UpgradeNeedPanel/NeedPrefab/icon/Item/GearSpecialStarPrefab',2},{'LvBG','UpgradeNeedPanel/NeedPrefab/icon/Item/LvBG',2},{'NeedPanel','UpgradeNeedPanel/NeedPanel',2},{'CostIcon','UpgradeNeedPanel/Costbg/CostIcon',2},{'Btu_Upgrade','UpgradeNeedPanel/Btu_Upgrade',2},{'Img_Qianghuadi1','UpgradeNeedPanel/Btu_Upgrade/Img_Qianghuadi1',2},{'Btu_UnUpgrade','UpgradeNeedPanel/Btu_UnUpgrade',2},{'Img_Qianghuadi2','UpgradeNeedPanel/Btu_UnUpgrade/Img_Qianghuadi2',2},{'AdvancedPreviewPanel','AdvancedPreviewPanel',2},{'Img_Biaotixian1','AdvancedPreviewPanel/Text_Preview/Img_Biaotixian1',2},{'Bg','AdvancedPreviewPanel/Bg',2},{'AdvancedPreViewCore','AdvancedPreviewPanel/AdvancedPreViewCore',2},{'RankKuangImg01','AdvancedPreviewPanel/AdvancedPreViewCore/RankKuangImg',2},{'Namebg','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/Namebg',2},{'landi3','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/landi3',2},{'GearIcon','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/GearIcon',2},{'Stardi01','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/Stardi',2},{'EmptyStarRoot','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/EmptyStarRoot',2},{'EmptyStar','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/EmptyStarRoot/EmptyStar (5)',2},{'GearStarPrefab01','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/GearStarPrefab',2},{'GearSpecialStarPrefab01','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/GearSpecialStarPrefab',2},{'StarRoot','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/StarRoot',2},{'QiconBg','AdvancedPreviewPanel/AdvancedPreViewCore/QiconBg',2},{'Qicon','AdvancedPreviewPanel/AdvancedPreViewCore/QiconBg/Qicon',2},{'QiconFrame','AdvancedPreviewPanel/AdvancedPreViewCore/QiconBg/Qicon/QiconFrame',2},{'AdvancedNeedPanel','AdvancedNeedPanel',2},{'Img_Biaotixian201','AdvancedNeedPanel/Text_NeedTitle/Img_Biaotixian2',2},{'Btu_AdvancedAutoAdd','AdvancedNeedPanel/Btu_AdvancedAutoAdd',2},{'Img_Zidongtianjiadi01','AdvancedNeedPanel/Btu_AdvancedAutoAdd/Img_Zidongtianjiadi',2},{'AdvancedNeedPrefab1','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1',2},{'Img_Hexindi01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/Img_Hexindi',2},{'icon02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon',2},{'Item01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item',2},{'RankKuangImg02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/RankKuangImg',2},{'icon03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/icon',2},{'Stardi02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/Stardi',2},{'EmptyStarPanelRoot01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/GearStarPrefab',2},{'GearSpecialStarPrefab02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/GearSpecialStarPrefab',2},{'StarPanelRoot01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/StarPanelRoot',2},{'LvBG01','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/LvBG',2},{'AdvancedNeedPrefab2','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2',2},{'Img_Hexindi02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/Img_Hexindi',2},{'icon04','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon',2},{'Item02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item',2},{'RankKuangImg03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/RankKuangImg',2},{'icon05','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/icon',2},{'Stardi03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/Stardi',2},{'EmptyStarPanelRoot02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/GearStarPrefab',2},{'GearSpecialStarPrefab03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/GearSpecialStarPrefab',2},{'StarPanelRoot02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/StarPanelRoot',2},{'LvBG02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/LvBG',2},{'AdvancedNeedPrefab3','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3',2},{'Img_Hexindi03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/Img_Hexindi',2},{'icon06','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon',2},{'Item03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item',2},{'RankKuangImg04','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/RankKuangImg',2},{'icon07','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/icon',2},{'Stardi04','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/Stardi',2},{'EmptyStarPanelRoot03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab04','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/GearStarPrefab',2},{'GearSpecialStarPrefab04','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/GearSpecialStarPrefab',2},{'StarPanelRoot03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/StarPanelRoot',2},{'LvBG03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/LvBG',2},{'CostIcon01','AdvancedNeedPanel/Costbg/CostIcon',2},{'Btu_Advanced','AdvancedNeedPanel/Btu_Advanced',2},{'Img_Qianghuadi101','AdvancedNeedPanel/Btu_Advanced/Img_Qianghuadi1',2},{'Btu_UnAdvanced','AdvancedNeedPanel/Btu_UnAdvanced',2},{'Img_Qianghuadi201','AdvancedNeedPanel/Btu_UnAdvanced/Img_Qianghuadi2',2},{'RebuildPreviewPanel','RebuildPreviewPanel',2},{'GearRebuildPrefab','RebuildPreviewPanel/GearRebuildPrefab',2},{'iconBg01','RebuildPreviewPanel/GearRebuildPrefab/iconBg',2},{'VoidGearIcon01','RebuildPreviewPanel/GearRebuildPrefab/iconBg/VoidGearIcon',2},{'Jiantou01','RebuildPreviewPanel/GearRebuildPrefab/Jiantou',2},{'GearRebuildRoot','RebuildPreviewPanel/GearRebuildRoot',2},{'RebuildNeedPanel','RebuildNeedPanel',2},{'Img_Biaotixian202','RebuildNeedPanel/Text_NeedTitle/Img_Biaotixian2',2},{'Btu_RebuildAutoAdd','RebuildNeedPanel/Btu_RebuildAutoAdd',2},{'Img_Zidongtianjiadi02','RebuildNeedPanel/Btu_RebuildAutoAdd/Img_Zidongtianjiadi',2},{'CostIcon02','RebuildNeedPanel/Costbg/CostIcon',2},{'Btu_Build','RebuildNeedPanel/Btu_Build',2},{'Img_Qianghuadi102','RebuildNeedPanel/Btu_Build/Img_Qianghuadi1',2},{'LvBG04','RebuildNeedPanel/Btu_Build/LvBG',2},{'RebuildNeedPrefabs','RebuildNeedPanel/RebuildNeedPrefabs',2},{'Img_Hexindi04','RebuildNeedPanel/RebuildNeedPrefabs/Img_Hexindi',2},{'icon08','RebuildNeedPanel/RebuildNeedPrefabs/icon',2},{'Item04','RebuildNeedPanel/RebuildNeedPrefabs/icon/Item',2},{'RankKuangImg05','RebuildNeedPanel/RebuildNeedPrefabs/icon/Item/RankKuangImg',2},{'icon09','RebuildNeedPanel/RebuildNeedPrefabs/icon/Item/icon',2},{'UpgradeSuccessPanel','UpgradeSuccessPanel',2},{'BG','UpgradeSuccessPanel/BG',2},{'Zhuangshi','UpgradeSuccessPanel/Zhuangshi',2},{'Zhuangshixian(shang)','UpgradeSuccessPanel/Zhuangshi/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','UpgradeSuccessPanel/Zhuangshi/zhuangshixian(yangcheng)',2},{'chenggongdi','UpgradeSuccessPanel/chenggongdi',2},{'LvInfoPanel','UpgradeSuccessPanel/chenggongdi/LvInfoPanel',2},{'Jiantou02','UpgradeSuccessPanel/chenggongdi/LvInfoPanel/Jiantou',2},{'SuccessInfoDataPrefab','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab',2},{'BG01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/BG',2},{'iconBg02','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/BG/iconBg',2},{'VoidGearIcon02','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/BG/iconBg/VoidGearIcon',2},{'Jiantou03','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/Jiantou',2},{'SuccessInfoDataRoot','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataRoot',2},{'Img_Dian','UpgradeSuccessPanel/chenggongdi/FightResult/Img_Dian',2},{'Img_Heidi','UpgradeSuccessPanel/chenggongdi/FightResult/Img_Heidi',2},{'greatsuccess','UpgradeSuccessPanel/greatsuccess',2},{'supersuccess','UpgradeSuccessPanel/supersuccess',2},{'RebuildSuccessPanel','RebuildSuccessPanel',2},{'BG02','RebuildSuccessPanel/BG',2},{'BG03','RebuildSuccessPanel/BG',2},{'Zhuangshixian(shang)01','RebuildSuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)01','RebuildSuccessPanel/BG/zhuangshixian(yangcheng)',2},{'chenggongdi01','RebuildSuccessPanel/chenggongdi',2},{'LvInfoPanel01','RebuildSuccessPanel/chenggongdi/LvInfoPanel',2},{'SuccessRebuildDataRoot','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataRoot',2},{'SuccessRebuildDataPrefab','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab',2},{'BG04','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/BG',2},{'iconBg03','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/BG/iconBg',2},{'VoidGearIcon03','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/BG/iconBg/VoidGearIcon',2},{'Jiantou04','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/Jiantou',2},{'Img_Dian01','RebuildSuccessPanel/chenggongdi/FightResult/Img_Dian',2},{'Img_Heidi01','RebuildSuccessPanel/chenggongdi/FightResult/Img_Heidi',2},
        -- Text 列表
        {'MaxBuildText','RebuildPreviewPanel/Lvinfo/BulidText/MaxBuildText',3},{'buildTxt','RebuildPreviewPanel/Lvinfo/BulidText/MaxBuildText/buildTxt',3},{'buildTxt01','RebuildPreviewPanel/GearRebuildPrefab/CurDataText/buildTxt',3},{'Costbg','RebuildNeedPanel/Costbg',3},{'RebuildCostText','RebuildNeedPanel/Costbg/RebuildCostText',3},{'touchtoexit','UpgradeSuccessPanel/touchtoexit',3},{'touchtoexit01','RebuildSuccessPanel/touchtoexit',3},
        -- Button 列表
        {'RoleGear1Panel01','RoleGear1Panel',4},
        -- UITemplate 列表
        {'GearUPBriefItem01','PopupPanel/GearBriefScroll/GearUPBriefItem',10},{'GearBagFilterToggle01','PopupPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',10},{'GearBagSortToggle01','PopupPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',10},
        -- Toggle 列表
        {'SwitchUpdata','SwitchPanel/SwitchUpdata',13},{'SwitchDevelopment','SwitchPanel/SwitchDevelopment',13},{'GearBagFilterToggle02','PopupPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',13},{'Btn_GearFilter01','PopupPanel/FilterPanelPivot/Btn_GearFilter',13},{'GearBagSortToggle02','PopupPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',13},
        -- RawImage 列表
        {'SwitchUpdata01','SwitchPanel/SwitchUpdata',15},{'SwitchDevelopment01','SwitchPanel/SwitchDevelopment',15},{'GearBriefScroll','PopupPanel/GearBriefScroll',15},
        -- LoopScrollRect 列表
        {'GearBriefScroll01','PopupPanel/GearBriefScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','ReturnBg/Text_TitleCn',20},{'Text_TitleEn','ReturnBg/Text_TitleEn',20},{'EnText','SwitchPanel/SwitchUpdata/Btn_Switch/EnText',20},{'CNText','SwitchPanel/SwitchUpdata/Btn_Switch/CNText',20},{'EnText01','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight/EnText',20},{'CNText01','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight/CNText',20},{'EnText02','SwitchPanel/SwitchDevelopment/Btn_Switch/EnText',20},{'CNText02','SwitchPanel/SwitchDevelopment/Btn_Switch/CNText',20},{'EnText03','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight/EnText',20},{'CNText03','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight/CNText',20},{'Btn_WearTxt','PopupPanel/Btn_Choose/Btn_WearTxt',20},{'GearFilterBtnText','PopupPanel/FilterPanelPivot/Btn_GearFilter/GearFilterBtnText',20},{'Text','PopupPanel/Btn_Salvage/Text',20},{'ItemCountText','UpperBtnPanel/ItemPanelPrefab/ItemCountText',20},{'CurLvText','UpgradePreviewPanel/Lvinfo/CurLvText',20},{'PreviewLvText','UpgradePreviewPanel/Lvinfo/PreviewLvText',20},{'ExpText','UpgradePreviewPanel/Lvinfo/ExpText',20},{'TitleText','UpgradePreviewPanel/GearUpgradePrefab/TitleText',20},{'OriginDataText','UpgradePreviewPanel/GearUpgradePrefab/InfoPanel/OriginDataText',20},{'CurDataText','UpgradePreviewPanel/GearUpgradePrefab/InfoPanel/CurDataText',20},{'Text_NeedTitle','UpgradeNeedPanel/Text_NeedTitle',20},{'Text_Zidongtianjia','UpgradeNeedPanel/Btu_AutoAdd/Text_Zidongtianjia',20},{'RankText','UpgradeNeedPanel/NeedPrefab/icon/Item/LvBG/RankText',20},{'Costbg01','UpgradeNeedPanel/Costbg',20},{'CostText','UpgradeNeedPanel/Costbg/CostText',20},{'Text_Qianghua1','UpgradeNeedPanel/Btu_Upgrade/Text_Qianghua1',20},{'Text_Qianghua2','UpgradeNeedPanel/Btu_UnUpgrade/Text_Qianghua2',20},{'Text_Preview','AdvancedPreviewPanel/Text_Preview',20},{'NameText','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/Namebg/NameText',20},{'RankText01','AdvancedPreviewPanel/AdvancedPreViewCore/GearImage/landi3/RankText',20},{'Text_NeedTitle01','AdvancedNeedPanel/Text_NeedTitle',20},{'Text_Zidongtianjia01','AdvancedNeedPanel/Btu_AdvancedAutoAdd/Text_Zidongtianjia',20},{'RankText02','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab1/icon/Item/LvBG/RankText',20},{'RankText03','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab2/icon/Item/LvBG/RankText',20},{'RankText04','AdvancedNeedPanel/NeedPanel/AdvancedNeedPrefab3/icon/Item/LvBG/RankText',20},{'Costbg02','AdvancedNeedPanel/Costbg',20},{'AdvancedCostText','AdvancedNeedPanel/Costbg/AdvancedCostText',20},{'Text_un','AdvancedNeedPanel/Btu_Advanced/Text_un',20},{'Text_un01','AdvancedNeedPanel/Btu_UnAdvanced/Text_un',20},{'Text_Dangqianjindu','RebuildPreviewPanel/Lvinfo/Text_Dangqianjindu',20},{'BulidText','RebuildPreviewPanel/Lvinfo/BulidText',20},{'TitleText01','RebuildPreviewPanel/GearRebuildPrefab/TitleText',20},{'OriginDataText01','RebuildPreviewPanel/GearRebuildPrefab/OriginDataText',20},{'CurDataText01','RebuildPreviewPanel/GearRebuildPrefab/CurDataText',20},{'Text_NeedTitle02','RebuildNeedPanel/Text_NeedTitle',20},{'Text_Zidongtianjia02','RebuildNeedPanel/Btu_RebuildAutoAdd/Text_Zidongtianjia',20},{'Text_Qianghua101','RebuildNeedPanel/Btu_Build/Text_Qianghua1',20},{'RankText05','RebuildNeedPanel/Btu_Build/LvBG/RankText',20},{'UnderLevel','RebuildNeedPanel/UnderLevel',20},{'Text_Num','RebuildNeedPanel/RebuildNeedPrefabs/icon/Item/Text_Num',20},{'Text_Qianghuajieguo','UpgradeSuccessPanel/chenggongdi/LvInfoPanel/Text_Qianghuajieguo',20},{'SuccessCurLvText','UpgradeSuccessPanel/chenggongdi/LvInfoPanel/SuccessCurLvText',20},{'SuccessTargetLvText','UpgradeSuccessPanel/chenggongdi/LvInfoPanel/SuccessTargetLvText',20},{'TitleText02','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/TitleText',20},{'OriginDataText02','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/OriginDataText',20},{'CurDataText02','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/CurDataText',20},{'SuccTitleText','UpgradeSuccessPanel/chenggongdi/FightResult/SuccTitleText',20},{'Text_Qianghuajieguo01','RebuildSuccessPanel/chenggongdi/LvInfoPanel/Text_Qianghuajieguo',20},{'SuccessCurBuildText','RebuildSuccessPanel/chenggongdi/LvInfoPanel/SuccessCurBuildText',20},{'TitleText03','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/TitleText',20},{'OriginDataText03','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/OriginDataText',20},{'CurDataText03','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/CurDataText',20},{'RebuildSuccTitleText','RebuildSuccessPanel/chenggongdi/FightResult/RebuildSuccTitleText',20},
    }
end
-- Code Auto Create End
require("LocalData/ArmoredcoreLocalData")
require("LocalData/HxexperienceLocalData")
require("LocalData/CorerestructureLocalData")
require("LocalData/UpgradeLocalData")
require("LocalData/SkillLocalData")
---863brief  830detail
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.CurOperation = 1  ---1 强化   2 开发   3.详情替换
    ---当前操作核心
    ---@type CoreData
    self.CurOperationCore = RoleCardViewModel.CurrentCore
    -------------------强化------------------
    self.SourceExp = 0  ---强化经验
    self.CostMoney = 0  ---消耗金币
    self.CostExp = 0  ---等级经验消耗
    self.isMax = false  ---强化是否超过上限
    -------------------强化------------------
    ---
    -------------------进阶------------------
    self.isAdvanced = false
    -------------------进阶------------------
    ---上一操作核心列表
    self.OldCoreList = {}
    ---强化素材预制
    self.UpNeedPrefab = {}
    --{
    --    [1] = self.NeedPrefab1(),
    --    [2] = self.NeedPrefab2(),
    --    [3] = self.NeedPrefab3(),
    --    [4] = self.NeedPrefab4(),
    --    [5] = self.NeedPrefab5()
    --}
    ---强化素材预制数量
    self.NeedPrefabNum = 10
    ---突破素材预制
    self.AdvancedNeedPrefab =
    {
        [1] = self.AdvancedNeedPrefab1(),
        [2] = self.AdvancedNeedPrefab2(),
        [3] = self.AdvancedNeedPrefab3()
    }


    for i, v in pairs(ArmoredcoreLocalData.tab) do
        if i==self.CurOperationCore.id  then
            self.highest =JNStrTool.strSplit(",",v[12])
            self.basicproperties = JNStrTool.strSplit("-",v[7])
            self.strengtheningattribute =  JNStrTool.strSplit("-",v[8])
            break
        end
    end

    ---当前弹窗选择的核心
    self.PopSelectCore = nil
    ---是否批量选择
    self.isBatchSelect = true
    ---选择核心列表
    self.SingleChooseCoreList = {}
    ---选择的素材上限
    self.RealCostCoreCount = 0  ---素材上限
    ---装备攻、防类型 0攻 1防
    self.armorType = 0
    ---初始化顶部玩家资源
    self:InitUpPanel()
    ---初始化按钮
    self:InitButton()
    ---初始化左侧按钮
    self:InitSwitch()
    ---初始化弹窗
    self:InitPopUpPanel()
    --初始化强化素材
    self:InitNeedPrefab()
    ---隐藏特效
    self.supersuccess().gameObject:SetActive(false)
    self.greatsuccess().gameObject:SetActive(false)
    --Event.Clear("NoviceCoreInfo")
    --Event.Add("NoviceCoreInfo",function ()
    --    self.SwitchGearInfo().isOn = true           -- todo xpxp
    --    NoviceViewModel.DoNext()
    --end)
    --Event.Clear("NoviceCoreWear")
    --Event.Add("NoviceCoreWear",function ()
    --    MgrUI.Pop(UID.ChangeRoleCorePop_UI,{self.CurOperationCore,self},true)
    --    NoviceViewModel.DoNext()
    --end)
    --Event.Clear("NoviceSwitchCore")
    --Event.Add("NoviceSwitchCore",function ()
    --    self.SwitchUpdata().isOn = true           -- todo xpxp
    --    NoviceViewModel.DoNext()
    --end)
    self:UpdataGearInfo(self.CurOperationCore)
end

function M:OnBackKey()
    local isPopupPanel = self.PopupPanel().gameObject.activeSelf
    if self.UpgradeSuccessPanel().gameObject.activeSelf then
        if self.CurOperationCore.level>=15 and self.CurOperationCore.star>=5 then
            self.isAdvanced = true
            self:ClearCacheData()
            self:InitAdvancedPanel()
        else
            self.isAdvanced = false
            self.SingleChooseCoreList = {}
            self.RealCostCore = {}
            self:UpdataCostItem()
            self.UpgradeSuccessPanel().gameObject:SetActive(false)
        end
        ---隐藏成功特效
        self.supersuccess().gameObject:SetActive(false)
        self.greatsuccess().gameObject:SetActive(false)
        self.SwitchPanel().gameObject:SetActive(true)
        return
    end
    if self.RebuildSuccessPanel().gameObject.activeSelf then
        self.SingleChooseCoreList = {}
        self.RealCostCore = {}
        self:UpdataRebuildCostItem()
        self.RebuildSuccessPanel().gameObject:SetActive(false)
        self.SwitchPanel().gameObject:SetActive(true)
        return
    end

    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if isPopupPanel then
            self.SingleChooseCoreList = {}
            for m, n in pairs(self.OldCoreList) do
                table.insert(self.SingleChooseCoreList,n)
            end
            self.SwitchPanel().gameObject:SetActive(true)
            self.PopupPanel().gameObject:SetActive(false)
            if self.CurOperation == 1 then
                if self.isAdvanced then
                    self:UpdataAdvanceItem()
                else
                    self:UpdataCostItem()
                end
            elseif self.CurOperation == 2 then
                self:UpdataRebuildCostItem()
            elseif self.CurOperation == 3 then
                self.isPop = false
                self:UpdataGearInfo(self.CurOperationCore)
            end
            return
        end
        MgrUI.GoBack()
        Event.Go("UpdataDetailPanel")
    end
end
function M:OnBackShow()
    local isPopupPanel = self.PopupPanel().gameObject.activeSelf
    if not MgrUI.IsPopOpen() then
        self.SingleChooseCoreList = {}
        for m, n in pairs(self.OldCoreList) do
            table.insert(self.SingleChooseCoreList,n)
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
        if self.CurOperation == 1 then
            if self.isAdvanced then
                self:UpdataAdvanceItem()
            else
                self:UpdataCostItem()
            end
        elseif self.CurOperation == 2 then
            self:UpdataRebuildCostItem()
        elseif self.CurOperation == 3 then
            self.isPop = false
            self:UpdataGearInfo(self.CurOperationCore)
        end
        self:UpdataUpPanel()
    end
end
function M:OnShowFinish()
    if NoviceViewModel.CurTaskId == 24012 then
        MgrUI.Pop(UID.NoviceFrame_UI,{NoviceViewModel.CurTaskId},true)
    end
end
---初始化顶部玩家资源
function M:InitUpPanel()
    self.ItemPanelPrefab().gameObject:SetActive(false)
    ---@type ItemData
    local item = ItemControl.GetItemByID(100001)
    Tools.ClearAllChild(self.ItemRoot().gameObject)
    local obj =  GameObject.Instantiate(self.ItemPanelPrefab().gameObject,self.ItemRoot().transform)
    obj:SetActive(true)
    local CostIcon = obj.transform:Find("ItemIcon"):GetComponent("Image")
    self.CostCount = obj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
    self.CostCount.text = JNStrTool.numberAbbr(item.count)
    MgrRes.LoadSprite(CostIcon,"Item/"..item.id)
end

---更新玩家资源
function M:UpdataUpPanel()
    ---@type ItemData
    local item = ItemControl.GetItemByID(100001)
    self.CostCount.text = JNStrTool.numberAbbr(item.count)
end

function M:InitButton()
    ---返回页面
    UIEvent.LuaClick(self.Btn_PanelBack().gameObject,Handle(self,function ()
        MgrUI.GoBack()
        Event.Go("UpdataDetailPanel")
    end))
    ---返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,function ()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    --打开说明界面
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        if self.CurOperation == 1 then  ---1 强化   2 开发   3.详情替换
            HelpViewModel.Go(70)
        elseif self.CurOperation == 2 then
            HelpViewModel.Go(71)
        elseif self.CurOperation == 3 then
            HelpViewModel.Go(69)
        end
    end))
    ---自动添加素材
    UIEvent.LuaClick(self.Btu_AutoAdd().gameObject,Handle(self,function ()
        if self.CurOperationCore.level >= 15 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips1"),2},true)
            return
        end
        self:AutoAddSource()
    end))

    ---突破自动添加素材
    UIEvent.LuaClick(self.Btu_AdvancedAutoAdd().gameObject,Handle(self,function ()
        if self.CurOperationCore.star == tonumber(SteamLocalData.tab[106013][2]) and self.CurOperationCore.quality == tonumber(SteamLocalData.tab[106014][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips2"),2},true)
            return
        end
        self:AdvancedAutoAddSource()
    end))
    ---强化
    UIEvent.LuaClick(self.Btu_Upgrade().gameObject,Handle(self,function ()
        self:PopReturn()
    end))
    ---进阶
    UIEvent.LuaClick(self.Btu_Advanced().gameObject,Handle(self,function ()
        --大于等于6星核心才提示开发提示
        if self.CurOperationCore.star >= 6 then
            MgrUI.Pop(UID.ConfirmPop_UI, {MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips13"), function()
                self:PopReturn()
            end,nil,2},true)
        else
            self:PopReturn()
        end
    end))
    ---开发
    UIEvent.LuaClick(self.Btu_Build().gameObject,Handle(self,function ()
        self:PopReturn()
    end))
    ---强化成功返回
    UIEvent.LuaClick(self.UpgradeSuccessPanel().gameObject,Handle(self,function ()
        if self.CurOperationCore.level>=15 and self.CurOperationCore.star>=5 then
            self.isAdvanced = true
            self:ClearCacheData()
            self:InitAdvancedPanel()
        else
            self.isAdvanced = false
            self.SingleChooseCoreList = {}
            self.RealCostCore = {}
            self:UpdataCostItem()
            self.UpgradeSuccessPanel().gameObject:SetActive(false)
        end
        ---隐藏成功特效
        self.supersuccess().gameObject:SetActive(false)
        self.greatsuccess().gameObject:SetActive(false)
        self.SwitchPanel().gameObject:SetActive(true)
    end))
    ---开发成功返回
    UIEvent.LuaClick(self.RebuildSuccessPanel().gameObject,Handle(self,function ()
        self.SingleChooseCoreList = {}
        self.RealCostCore = {}
        self:UpdataRebuildCostItem()
        self.RebuildSuccessPanel().gameObject:SetActive(false)
        self.SwitchPanel().gameObject:SetActive(true)
    end))

    ---帮助
    UIEvent.LuaClick(self.Img_I().gameObject,Handle(self,function()
        HelpViewModel.Go(70)
    end))
    ---返回
    UIEvent.LuaClick(self.Btn_Return().gameObject,Handle(self,function ()
        self.SingleChooseCoreList = {}
        for m, n in pairs(self.OldCoreList) do
            table.insert(self.SingleChooseCoreList,n)
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
        if self.CurOperation == 1 then
            if self.isAdvanced then
                self:UpdataAdvanceItem()
            else
                self:UpdataCostItem()
            end
        elseif self.CurOperation == 2 then
            self:UpdataRebuildCostItem()
        elseif self.CurOperation == 3 then
            self.isPop = false
            self:UpdataGearInfo(self.CurOperationCore)
        end
    end))
    ---点背景返回
    UIEvent.LuaClick(self.Img_Bg().gameObject,Handle(self,function ()
        self.SingleChooseCoreList = {}
        for m, n in pairs(self.OldCoreList) do
            table.insert(self.SingleChooseCoreList,n)
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
        if self.CurOperation == 1 then
            if self.isAdvanced then
                self:UpdataAdvanceItem()
            else
                self:UpdataCostItem()
            end
        elseif self.CurOperation == 2 then
            self:UpdataRebuildCostItem()
        elseif self.CurOperation == 3 then
            self.isPop = false
            self:UpdataGearInfo(self.CurOperationCore)
        end
    end))

    ---强化素材按钮
    for i = 1, self.NeedPrefabNum do
        self.UpNeedPrefab[i] = GameObject.Instantiate(self.NeedPrefab().gameObject,self.NeedPanel().gameObject.transform,false)
    end
    self.NeedPrefab().gameObject:SetActive(false)
    for i, v in pairs(self.UpNeedPrefab) do
        UIEvent.LuaClick(v.gameObject,Handle(self,function ()
            if self.CurOperationCore.level >= 15 then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips1"),2},true)
                return
            end
            self.RealCostCoreCount = self.NeedPrefabNum  ---素材上限
            self.OldCoreList = {}
            ---是否批量选择
            self.isBatchSelect = true
            for m, n in pairs(self.SingleChooseCoreList) do
                table.insert(self.OldCoreList,n)
            end
            self.filter = 0
            self.PopupPanel().gameObject:SetActive(true)
            self.SwitchPanel().gameObject:SetActive(false)
            self:ResetCoreView(0)
        end))
    end
    ---突破素材按钮
    for i, v in pairs(self.AdvancedNeedPrefab) do
        UIEvent.LuaClick(v.gameObject,Handle(self,function ()
            if self.CurOperationCore.star == tonumber(SteamLocalData.tab[106013][2]) and self.CurOperationCore.quality == tonumber(SteamLocalData.tab[106014][2]) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips2"),2},true)
                return
            end
            self.RealCostCoreCount = 3  ---素材上限
            self.OldCoreList = {}
            self.filter = 2
            ---是否批量选择
            self.isBatchSelect = true
            for m, n in pairs(self.SingleChooseCoreList) do
                table.insert(self.OldCoreList,n)
            end
            self.PopupPanel().gameObject:SetActive(true)
            self.SwitchPanel().gameObject:SetActive(false)
            self.Btu_Advanced().gameObject:SetActive(false)
            self.Btu_UnAdvanced().gameObject:SetActive(true)
            self:ResetCoreView(0)
        end))
    end
    ---是否可以开发
    self.SwitchDevelopment().gameObject:SetActive(ArmoredcoreLocalData.tab[self.CurOperationCore.id][15] == 1)
    
    UIEvent.LuaClick(self.Btn_Salvage().gameObject, Handle(self, function()
        BagViewModel.ReloadCacheData();
        MgrUI.GoHide(UID.GearSalvage_UI);
    end));
    self:InitCoreFilter();
end

function M:InitCoreFilter()
    --默认筛选显示全部
    self.CoreFilter = 0
    --排序器
    local sorts = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_core_level"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_starlevel"),
    }
    local t_sort = self:CreateFilterToggle(sorts,self.GearBagSortToggle().gameObject,self.GearSortToggleGroup().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
        self.CoreSort = sort
        self.CoreIsRise = isRise
        self:ResetCoreView()
    end))
    --默认排序
    t_sort[1].isOn = false
    t_sort[1].isOn = true
    ---筛选器
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
    local t_filter = self:CreateFilterToggle(filters,self.GearBagFilterToggle().gameObject,self.GearFilterToggleGroup().gameObject.transform,Handle(self,function(self,filter,isOn,offset)
        if isOn then
            self.CoreFilter = filter
            self:ResetCoreView(offset)
        end
    end),true)
    ---筛选器遮罩事件
    UIEvent.LuaClick(self.Btn_FilterBtnPanelClose().gameObject,function()
        self.Btn_GearFilter01().isOn = false
    end)
    ---筛选器动画
    self.Btn_GearFilter01().onValueChanged:AddListener(function(isOn)
        --local y = isOn and 0 or 500
        --Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
        self.Btn_FilterBtnPanelClose().gameObject:SetActive(isOn)
        local y = isOn and self.GearFilterToggleGroup().transform.rect.height or 0
        Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
    end)
    ---隐藏预制
    self.GearBagSortToggle().gameObject:SetActive(false)
    self.GearBagFilterToggle().gameObject:SetActive(false)
    self.Btn_FilterBtnPanelClose().gameObject:SetActive(false)
    
    ---默认筛选
    self.CoreFilter = 0
    t_filter[1].enabled = false
    t_filter[1].isOn = false
    t_filter[1].isOn = true
    t_filter[1].enabled = true
    ---默认关闭筛选
    self.Btn_GearFilter01().isOn = false
end

---初始化左侧按钮
function M:InitSwitch()
    local toggles = {
        [1] = self.SwitchUpdata(),
        [2] = self.SwitchDevelopment()
    }
    local Reload = {
        [1] = Handle(self, self.OnClickRoleUpdataSwitch),
        [2] = Handle(self, self.OnClickRoleDevelopSwitch)
    }
    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Btn_Switch","Btn_SwitchHighLight")
        high:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self.OnLeftToggleClick(...,normal,high, Reload[idx])
        end,nil)
    end
    if BagViewModel.CorePage == nil then
        self.SwitchUpdata().isOn = false
        self.SwitchUpdata().isOn = true
    else
        toggles[BagViewModel.CorePage].isOn = true
    end
end
---获取高光组件
function M.GetHighObj(Obj,normalStr,highStr)
    return Obj.transform:Find(normalStr).gameObject, Obj.transform:Find(highStr).gameObject
end
---Toggle事件
function M.OnLeftToggleClick(isOn, normal, high,initFun)
    normal:SetActive(not isOn)
    high:SetActive(isOn)
    initFun()
end
---切换到强化界面
function M:OnClickRoleUpdataSwitch()
    self:ClearCacheData()
    self.CurOperation = 1  ---1 强化   2 开发   3.详情替换
    self:SetTitle(MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_enhancement"),"CORE ENHANCEMENT")
    if self.CurOperationCore.level>=15 and self.CurOperationCore.star>=5 then
        self.isAdvanced = true
        self:InitAdvancedPanel()
    else
        self.isAdvanced = false
        self:InitGearUpPanel()
    end
end
---切换到开发界面
function M:OnClickRoleDevelopSwitch()
    self:ClearCacheData()
    self.CurOperation = 2  ---1 强化   2 开发   3.详情替换
    self:SetTitle(MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_development"),"CORE DEVELOPMENT")
    self:InitRebuildPanel()
end
---初始化弹窗
function M:InitPopUpPanel()
    ---设置核心背包简略LoopScroll回调
    self.GearBriefScroll01():SetLuaCellEvent(Handle(self,self.CellCore))
    self.GearBriefScroll01().gameObject:SetActive(true)
    self:ResetCoreView(0,true)
end
---核心预制回调
function M:CellCore(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({ self.CurCoreList[idx], self})
end
------核心预制回调(只显示解锁的装备)
function M:CellCore2(trans, idx)
    ---传入数据
    --trans:GetComponent("UITemplate"):SetData({ self.CurCoreList[idx], self})
    trans:GetComponent("UITemplate"):SetData({ self.CurUnlockedCoreList[idx], self})
end

---核心背包loopScroll刷新
function M:ResetCoreView(offset)
    ---获取核心数据
    self.CurCoreList = self:GetCoreData(self.CoreFilter,self.CoreSort,self.CoreIsRise);
    local arr = {}
    if self.CurOperation ~= 3 then
        for i, v in pairs(self.CurCoreList) do
            if v.uid ~= self.CurOperationCore.uid then
                if #v.armorGroup == 0 then
                    table.insert(arr,v)
                end
            end
        end
        self.CurCoreList = arr
    end
    if self.filter == 1 then
        local array = {}
        for i, v in pairs(self.CurCoreList) do
            if v.star == self.CurOperationCore.star then
                table.insert(array,v)
            end
        end
        self.CurCoreList = array
    elseif self.filter == 2 then
        local array = {}
        for i, v in pairs(self.CurCoreList) do
            if v.star == self.CurOperationCore.star  and v.quality == self.CurOperationCore.quality then
                table.insert(array,v)
            end
        end
        self.CurCoreList = array
    end
    ---获取未上锁核心数据
    self.CurUnlockedCoreList = {}
    for i,v in pairs(self.CurCoreList) do
        if CoreControl.GetCoreLock(v.uid) ~= 1 then
            table.insert(self.CurUnlockedCoreList,v)
        end
    end
    local GearScrolls = {
        [1] = self.GearBriefScroll01(),---简略核心滑块
    }

    --if self.CurOperation == 1 then
    --    local sortgroup = {"isLocked","RoleId","level","star","quality"}
    --    Global.Sort(self.CurCoreList,sortgroup,false)
    --elseif self.CurOperation == 2 then
    --    local sortgroup = {"level","quality","star","RoleId"}
    --    Global.Sort(self.CurCoreList,sortgroup,false)
    --end
    ---设置核心总数
    self.GearBriefScroll01().totalCount = #self.CurCoreList
    ---刷新滑块
    if offset then
        ---刷新offset位置
        self.GearBriefScroll01():RefillCells(offset)
    else
        ---刷新数据不刷新位置
        self.GearBriefScroll01():RefreshCells()
    end
end

function M:GetCoreData(filterIdx, sortIdx, isRise)
    local array = CoreControl.GetCores()
    ---筛除类型
    if filterIdx and filterIdx ~= 0 then
        local filter_Str = string.split(SteamLocalData.tab[filterIdx][2],",")
        local filter_Num = {}
        for i, v in pairs(filter_Str) do
            filter_Num[i] = tonumber(v)
        end
        local filterGroup = {type = filter_Num}
        array =self:CoreFilters(array,filterGroup)
    end
    ---核心排序
    local sortGroup = {
        [1] = {"level","quality","star","properties"},
        [2] = {"star","quality","level","properties"},
        [3] = {"time","quality","star","properties"}
    }
    Global.Sort(array,sortGroup[sortIdx or 1],isRise or false)
    return array
end
--核心筛选
function M:CoreFilters(list,kvs)
    local t = {}
    if not kvs then
        return list
    end
    for _, data in pairs(list) do
        local isSame = false
        for k, v in pairs(kvs) do
            if type(v) == "table" then
                for _, v_type in pairs(v) do
                    if data[k] == v_type then
                        ---类型相同时添加
                        isSame = true
                        break
                    end
                end
            else
                if data[k] == v then
                    ---类型相同时添加
                    isSame = true
                    break
                end
            end
        end
        if isSame then
            ---所有定义类型相同添加到表
            table.insert(t,data)
        end
    end
    return t
end
---单选弹窗按钮事件
function M:UpGearClick(curData)
    if self.PopSelectCore then
        self.PopSelectCore.isSelect = false
    end
    curData.isSelect = true
    self.PopSelectCore = curData
    if self.CurOperation == 3 then
        if self.PopSelectCore then
            self.isPop = true
            self:UpdataGearInfo(self.PopSelectCore)
        end
    end
    self:ResetCoreView()
end
---初始化强化预览
function M:InitGearUpPanel()
    self.AdvancedPreviewPanel().gameObject:SetActive(false)
    self.AdvancedNeedPanel().gameObject:SetActive(false)
    self.GearUpgradePrefab().gameObject:SetActive(false)
    self.UpgradeSuccessPanel().gameObject:SetActive(false)
    self.RebuildNeedPanel().gameObject:SetActive(false)
    self.RebuildPreviewPanel().gameObject:SetActive(false)
    self.PopupPanel().gameObject:SetActive(false)
    self.RebuildSuccessPanel().gameObject:SetActive(false)

    self.UpgradePreviewPanel().gameObject:SetActive(true)
    self.UpgradeNeedPanel().gameObject:SetActive(true)
    if self.CurOperationCore.level>=15 then
        self.PreviewLv = self.CurOperationCore.level
    else
        self.PreviewLv = self.CurOperationCore.level + 1
    end
    for i, v in pairs(ArmoredcoreLocalData.tab) do
        if i==self.CurOperationCore.id  then
            self.highest =JNStrTool.strSplit(",",v[12])
            self.basicproperties = JNStrTool.strSplit("-",v[7])
            self.strengtheningattribute =  JNStrTool.strSplit("-",v[8])
            break
        end
    end
    self:UpdataCostItem()
end
---初始化进阶预览预览
function M:InitAdvancedPanel()
    self.GearUpgradePrefab().gameObject:SetActive(false)
    self.UpgradeSuccessPanel().gameObject:SetActive(false)
    self.RebuildNeedPanel().gameObject:SetActive(false)
    self.RebuildPreviewPanel().gameObject:SetActive(false)
    self.PopupPanel().gameObject:SetActive(false)
    self.RebuildSuccessPanel().gameObject:SetActive(false)
    self.UpgradePreviewPanel().gameObject:SetActive(false)
    self.UpgradeNeedPanel().gameObject:SetActive(false)

    self.AdvancedPreviewPanel().gameObject:SetActive(true)
    self.AdvancedNeedPanel().gameObject:SetActive(true)

    if self.CurOperationCore.star == tonumber(SteamLocalData.tab[106013][2]) and self.CurOperationCore.quality == tonumber(SteamLocalData.tab[106014][2]) then
        self:UpdataAdvanceItem()
        self:UpdataAdvanceCore(self.AdvancedPreViewCore().gameObject,self.CurOperationCore,false)
    else
        self.AdvancedCost = 0  ---进阶消耗金币
        self.AdvancedStar = 0  ---进阶后星级
        self.AdvancedQuality = 0   ---进阶后稀有度
        for i, v in pairs(UpgradeLocalData.tab) do
            if v[2] == self.CurOperationCore.star and v[3] == self.CurOperationCore.quality then
                self.AdvancedStar = v[4]
                self.AdvancedQuality = v[5]
                self.AdvancedCost =tonumber(JNStrTool.strSplit("_",v[8])[3])
                break
            end
        end
        self:UpdataAdvanceItem()
        self:UpdataAdvanceCore(self.AdvancedPreViewCore().gameObject,self.CurOperationCore,true)
    end
end
---@param coreData CoreData
function M:UpdataAdvanceCore(obj,coreData,isPreview)
    local RankText = obj.transform:Find("GearImage/landi3/RankText"):GetComponent("TextMeshProUGUI")
    local NameText = obj.transform:Find("GearImage/Namebg/NameText"):GetComponent("TextMeshProUGUI")
    local GearIcon = obj.transform:Find("GearImage/GearIcon"):GetComponent("Image")
    local RankKuangImg = obj.transform:Find("RankKuangImg"):GetComponent("Image")
    --local RankPlusIconImg = obj.transform:Find("GearImage/RankPlusPanel/RankPlusIconImg"):GetComponent("Image")
    local Qicon = obj.transform:Find("QiconBg/Qicon"):GetComponent("Image")
    local GearStarPrefab = obj.transform:Find("GearImage/GearStarPrefab").gameObject
    local GearSpecialStarPrefab = obj.transform:Find("GearImage/GearSpecialStarPrefab").gameObject
    local StarRoot = obj.transform:Find("GearImage/StarRoot").gameObject
    --local RankPlusPanel = obj.transform:Find("GearImage/RankPlusPanel").gameObject
    ---强化等级
    if isPreview then
        RankText.text = "+"..self:GetdataAdvanceEXP(coreData)
    else
        RankText.text = "+"..coreData.level
    end
    ---名字
    NameText.text = coreData.name
    ---设置核心图标
    MgrRes.LoadSprite(GearIcon,coreData.icon)
    ---设置装备图标
    --if coreData.RoleId ~= 0 then
    --    Qicon.gameObject:SetActive(true)
    --    MgrRes.LoadCircleIcon(Qicon,coreData.RoleId)
    --else
    --    Qicon.gameObject:SetActive(false)
    --end
    Qicon.transform.parent.gameObject:SetActive(false)
    local quality = 0
    ---设置品质图片
    if self.CurOperationCore.star == tonumber(SteamLocalData.tab[106013][2]) and self.CurOperationCore.quality == tonumber(SteamLocalData.tab[106014][2]) then
        --self:InitStarPanel(6,StarRoot,GearSpecialStarPrefab)
        self:UpdataCostItem()
        self:UpdataDataPanel(self.CurOperationCore)
        self.AdvancedPreviewPanel().gameObject:SetActive(false)
        self.AdvancedNeedPanel().gameObject:SetActive(false)
        self.UpgradePreviewPanel().gameObject:SetActive(true)
        self:UpgradeNeedPanel().gameObject:SetActive(true)
    else
        if isPreview then
            quality = self.AdvancedQuality
            if quality == 5then
                self:InitStarPanel(self.AdvancedStar,StarRoot,GearSpecialStarPrefab)
            else
                self:InitStarPanel(self.AdvancedStar,StarRoot,GearStarPrefab)
            end
        else
            quality = coreData.quality
            if quality == 5 then
                self:InitStarPanel(coreData.star,StarRoot,GearSpecialStarPrefab)
            else
                self:InitStarPanel(coreData.star,StarRoot,GearStarPrefab)
            end
        end
    end
    --MgrRes.LoadSprite(RankKuangImg,"Quality/RankKuang_"..quality)
    if isPreview then
        MgrRes.LoadSprite(RankKuangImg,self:GetQualityName(self.AdvancedQuality))
    else
        MgrRes.LoadSprite(RankKuangImg,self:GetQualityName(coreData.iconFrameGear))
    end

    --if quality == 4 or quality == 6 then
        --RankPlusPanel:SetActive(true)
        --MgrRes.LoadSprite(RankPlusIconImg,"Quality/RankKuangPlus_"..(quality))
    --else
        --RankPlusPanel:SetActive(false)
    --end
    GearStarPrefab:SetActive(false)
    GearSpecialStarPrefab:SetActive(false)
end

--根据品质获品质对应图片名称(新加了带jia的品质，不确定原来的图片是否被其他地方使用，所以不能改名)
function M:GetQualityName(qualityID)
    local name = ""
    if qualityID == 1 then
        name = "Item/Rank/ItemRank_1"
    elseif qualityID == 2  then
        name = "Item/Rank/ItemRank_2"
    elseif  qualityID == 3 then
        name = "Item/Rank/ItemRank_3"
    elseif  qualityID == 4 then
        name = "Item/Rank/ItemRank_4"
    elseif  qualityID == 5 then
        name = "Item/Rank/ItemRank_5"
    elseif  qualityID == 6 then
        name = "Item/Rank/ItemRank_6"
    end
    return name
end

---初始化开发预览
function M:InitRebuildPanel()
    self.AdvancedPreviewPanel().gameObject:SetActive(false)
    self.AdvancedNeedPanel().gameObject:SetActive(false)
    self.UpgradeNeedPanel().gameObject:SetActive(false)
    self.UpgradePreviewPanel().gameObject:SetActive(false)
    self.UpgradeSuccessPanel().gameObject:SetActive(false)
    self.PopupPanel().gameObject:SetActive(false)
    self.RebuildSuccessPanel().gameObject:SetActive(false)

    self.RebuildNeedPanel().gameObject:SetActive(true)
    self.RebuildPreviewPanel().gameObject:SetActive(true)

    self.threshold = nil  ---炼制阈值
    self.promote = nil ---成长值
    self.grow = nil ---最高成长值
    self.consume = nil  ---消耗核心数量
    self.RebuildGoldCost = nil  --- 金币消耗

    for i, v in pairs(CorerestructureLocalData.tab) do
        if self.CurOperationCore.star == v[2] then
            self.threshold = v[3]*0.1
            self.promote = v[4]*0.1
            self.grow = v[5]*0.1
            self.consume = v[6]
            self.RebuildGoldCost = JNStrTool.strSplit(",",v[7])
        end
    end
    self:UpdataRebuildCostItem()
end
---更新开发预览
function M:UpdataRebuildPanel(data)
    self.BulidText().text =math.floor(data.properties*100).."%"
    --self.MaxBuildText().text ="(   "..((self.basicproperties[2]+self.strengtheningattribute[2]*self.CurOperationCore.level)*0.01).."%)"
    local costItem = ItemControl.GetItemByID(100001)  --玩家背包拥有此消耗物品
    local a = tonumber(self.RebuildGoldCost)
    --self.RebuildCostText().text = costItem.count >= tonumber(self.RebuildGoldCost) and self.RebuildGoldCost or string.format("<color=#DB3D3D>%s</color>",self.RebuildGoldCost)
    local root = self.RebuildNeedPanel().gameObject.transform:Find("NeedPanel").gameObject
    Tools.ClearAllChild(root)
    self.canReBuild = true  --是否可以开发
    for k,v in pairs(self.RebuildGoldCost) do
        local item = GameObject.Instantiate(self.RebuildNeedPrefabs().gameObject,root.transform,true)
        local obj = item.transform:Find("icon/Item")
        local info = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
        local icon = obj.transform:Find("icon"):GetComponent("Image")
        local RankKuangImg = obj.transform:Find("RankKuangImg"):GetComponent("Image")
        local num = obj.transform:Find("Text_Num"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(icon,info.icon)
        MgrRes.LoadSprite(RankKuangImg,info.iconFrame)
        num.text = JNStrTool.numberAbbr(info.count).."/".. tonumber(string.split(v,"_")[3])
        num.text = Global.GetCompareText(info.count,string.split(v,"_")[3])
        UIEvent.LuaClick(icon.gameObject,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{info, false, function() end},true)
        end)
        item.gameObject:SetActive(true)
        if info.count < tonumber(string.split(v,"_")[3]) then
            self.canReBuild = false
        end
    end
    self.RebuildNeedPrefabs().gameObject:SetActive(false)
    if self.canReBuild then
        self.Btu_Build().gameObject:SetActive(true)
    else
        self.Btu_Build().gameObject:SetActive(false)
    end
    if data.level==data.armorCoreConfig[13] then
        --self.UnderLevel().gameObject:SetActive(false)
        self.UnderLevel().text = MgrLanguageData.GetLanguageByKey("ui_character_equipment_tips3")
    else
        --self.UnderLevel().gameObject:SetActive(true)
        self.UnderLevel().text = MgrLanguageData.GetLanguageByKey("ui_character_equipment_tips2")
        self.Btu_Build().gameObject:SetActive(false)
    end
    Tools.ClearAllChild(self.GearRebuildRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #data.attrs do
        ---显示可用词条
        local GearInfo=GameObject.Instantiate(self.GearRebuildPrefab().gameObject,self.GearRebuildRoot().gameObject.transform,true)
        GearInfo:SetActive(true)
        local GearInfoMainIcon=CJNUIMgr.GetSunUseName(GearInfo,"VoidGearIcon")
        local OriginDataText=CJNUIMgr.GetSunUseName(GearInfo,"OriginDataText")
        local CurDataText=CJNUIMgr.GetSunUseName(GearInfo,"CurDataText")
        local GearInfoNameTxt=CJNUIMgr.GetSunUseName(GearInfo,"TitleText")
        ---属性图标
        MgrRes.LoadSprite(GearInfoMainIcon:GetComponent("Image"),"Attribute/GearInfoIcon_"..data.attrs[i].attrID)
        ---属性值
        if data.attrs[i].type == 0 then
            OriginDataText:GetComponent("TextMeshProUGUI").text  = string.format("%.0f",data.attrs[i].attribute)
            CurDataText:GetComponent("TextMeshProUGUI").text  =string.format("%.0f",self.highest[i])
        else
            OriginDataText:GetComponent("TextMeshProUGUI").text  = string.format("%.2f",data.attrs[i].attribute).."%"
            CurDataText:GetComponent("TextMeshProUGUI").text  =string.format("%.2f",(self.highest[i]*0.01)).."%"
        end
        ---属性名称
        GearInfoNameTxt:GetComponent("TextMeshProUGUI").text = data.attrs[i].attrName
    end
    self.GearRebuildPrefab().gameObject:SetActive(false)
end
---更新开发素材
function M:UpdataRebuildCostItem()
    self:UpdataRebuildPanel(self.CurOperationCore)
end
---自动添加开发素材
function M:RebuildAutoAddSource()
    self.SingleChooseCoreList = {}
    self.RealCostCore = {}
    local array = CoreControl.GetCores()
    local sortgroup = {"quality"}
    Global.Sort(array,sortgroup,false)
    for i, v in pairs(array) do
        if #self.RealCostCore >= self.consume then
            break
        end
        if v.star == self.CurOperationCore.star and v.uid ~= self.CurOperationCore.uid and v.RoleId == 0 and v.level == 0 and CoreControl.GetCoreLock(v.uid) ~= 1 then
            table.insert(self.SingleChooseCoreList,v)
            table.insert(self.RealCostCore,v)
        end
    end
    if  #self.RealCostCore  <= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips4"),1},true)
    end
    self:UpdataRebuildCostItem()
end

---更新核心详情
---@param data CoreData
function M:UpdataGearInfo(data)
    MgrRes.LoadSprite(self.GearIconImg(),data.icon)
    UnityEngine.Debug.LogError(data.RoleId)
end
---解锁上锁按钮
function M:ClickLockIcon()
    if self.isLocked == 1 then
        ---弹出解锁确认界面
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
            self.isLocked = 0
            self.CoreLocked().gameObject:SetActive(false)
            self.unLockCore().gameObject:SetActive(true)
            CoreControl.SaveCoreLock(self.CurOperationCore.uid,0)
        end,nil,2},true)
    else
        self.isLocked = 1
        self.CoreLocked().gameObject:SetActive(true)
        self.unLockCore().gameObject:SetActive(false)
        CoreControl.SaveCoreLock(self.CurOperationCore.uid,1)
    end
end
---更新强化属性预览
------@param data CoreData
function M:UpdataDataPanel(data)
    if self.CurOperationCore.level>=15 then
        self.PreviewLv = data.level
    end

    self.CurLvText().text ="+"..data.level
    self.PreviewLvText().text = "+"..self.PreviewLv
    local costItem = ItemControl.GetItemByID(100001)  --玩家背包拥有此消耗物品
    ---获取消耗
    self.CostMoney = 0
    self.CostMoney = math.floor(self.SourceExp*0.25)
    self.CostExp = 0
    local nextLv = self.PreviewLv >= 15 and 15 or self.PreviewLv + 1
    self.CostExp = self.CurOperationCore.strengthenLevels[nextLv]
  --  self:GetExpCost(data.level,self.PreviewLv)
    if self.SourceExp>0 then
        self.PreviewLvText().gameObject:SetActive(true)
        self.CostText().text = costItem.count >= self.CostMoney and self.CostMoney or string.format("<color=#DB3D3D>%s</color>",self.CostMoney)
        self.Btu_Upgrade().gameObject:SetActive(true)
        self.Btu_UnUpgrade().gameObject:SetActive(false)
    else
        self.CostText().text = 0
        self.Btu_Upgrade().gameObject:SetActive(false)
        self.Btu_UnUpgrade().gameObject:SetActive(true)
        self.PreviewLvText().gameObject:SetActive(false)
    end
    if self.CurOperationCore.level>=15 then
        self.CostText().text = 0
        self.Btu_Upgrade().gameObject:SetActive(false)
        self.Btu_UnUpgrade().gameObject:SetActive(true)
    end
    ---经验显示
    if self.SourceExp == 0 then
        self.ExpText().text = data.exp.."/"..self.CostExp
    else
        self.ExpText().text ="<color=#F3C036>" ..(self.SourceExp + data.exp).."</color>".."/"..self.CostExp
    end
    ---是否达到最大等级
    if (self.SourceExp + data.exp) >= data.maxExp then
        self.isMax = true
    else
        self.isMax = false
    end
    ---经验条
    self.ExpSlider().fillAmount = data.exp/self.CostExp
    self.SourceExpSlider().fillAmount = (self.SourceExp + data.exp)/self.CostExp
    if not self.ShowLV then
        self.PreviewLvText().gameObject:SetActive(false)
    else
        self.PreviewLvText().gameObject:SetActive(true)
    end
    Tools.ClearAllChild(self.GearUpgradeRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #data.attrs do
        ---显示可用词条
        local GearInfo= GameObject.Instantiate(self.GearUpgradePrefab().gameObject,self.GearUpgradeRoot().transform)
        GearInfo:SetActive(true)
        local VoidGearIcon = GearInfo.transform:Find("iconBg/VoidGearIcon"):GetComponent("Image")
        local TitleText = GearInfo.transform:Find("TitleText"):GetComponent("TextMeshProUGUI")
        local OriginDataText = GearInfo.transform:Find("InfoPanel/OriginDataText"):GetComponent("TextMeshProUGUI")
        local CurDataText = GearInfo.transform:Find("InfoPanel/CurDataText"):GetComponent("TextMeshProUGUI")
        local CurData = 0
        local lowest = 0
        if self.PreviewLv == data.level then
            CurData = data.attrs[i].attribute
        else
            if data.attrs[i].type == 0 then
                CurData = data.attrs[i].attribute+ (tonumber(self.strengtheningattribute[2])*(self.PreviewLv - self.CurOperationCore.level))*self.highest[i]*0.0001
                lowest = data.attrs[i].attribute + (tonumber(self.strengtheningattribute[1])*(self.PreviewLv - self.CurOperationCore.level))*self.highest[i]*0.0001
            else
                CurData = data.attrs[i].attribute + (tonumber(self.strengtheningattribute[2])*(self.PreviewLv - self.CurOperationCore.level))*(self.highest[i]*0.0001)*0.01
                lowest = data.attrs[i].attribute + (tonumber(self.strengtheningattribute[1])*(self.PreviewLv - self.CurOperationCore.level))*(self.highest[i]*0.0001)*0.01
            end
        end
        local OriginData = data.attrs[i].attribute
        ---属性图标
        MgrRes.LoadSprite(VoidGearIcon,"Attribute/GearInfoIcon_"..data.attrs[i].attrID)
        ---属性值
        if data.attrs[i].type == 0 then
            OriginDataText.text = string.format("%.0f",OriginData)
            if lowest == 0 then
                CurDataText.text = string.format("%.0f",CurData)
            else
                CurDataText.text = string.format("%.0f",lowest) .."-"..string.format("%.0f",CurData)
            end
        else
            OriginDataText.text = string.format("%.2f",OriginData).."%"
            if lowest == 0 then
                CurDataText.text = string.format("%.2f",CurData).."%"
            else
                CurDataText.text = string.format("%.2f",lowest).."-"..string.format("%.2f",CurData).."%"
            end
        end
        --OriginDataText.text = (math.ceil(OriginData*10)*0.1)..(data.attrs[i].type == 1 and "%" or "")
        --CurDataText.text = (math.ceil(CurData*10)*0.1)..(data.attrs[i].type == 1 and "%" or "")
        ---属性名称
        TitleText.text = data.attrs[i].attrName
        if self.SourceExp <= 0 then
            CurDataText.gameObject:SetActive(false)
        else
            CurDataText.gameObject:SetActive(true)
        end
        if not self.ShowLV then
            CurDataText.gameObject:SetActive(false)
        else
            CurDataText.gameObject:SetActive(true)
        end
    end
end
---更新强化素材
function M:UpdataCostItem()
    self.SourceExp = 0
    self:ClearUpitem()
    if #self.SingleChooseCoreList>0 then
        for i, v in pairs(self.SingleChooseCoreList) do
            local obj = self.UpNeedPrefab[i].transform:Find("icon/Item")
            --隐藏
            self.UpNeedPrefab[i].transform:Find("icon"):GetComponent("Image").enabled = false
            self.UpNeedPrefab[i].transform:Find("Img_Hexindi").gameObject:SetActive(false)
            --self.UpNeedPrefab[i]:GetComponent("Image").enabled = false

            obj.gameObject:SetActive(true)
            local icon = obj.transform:Find("icon"):GetComponent("Image")
            local RankKuangImg = obj.transform:Find("RankKuangImg"):GetComponent("Image")
            --local RankPlusIconImg = obj.transform:Find("RankPlusPanel/RankPlusIconImg"):GetComponent("Image")
            --local RankPlusPanel = obj.transform:Find("RankPlusPanel").gameObject
            local GearStarSpecialPrefab = obj.transform:Find("GearSpecialStarPrefab")
            local GearStarPrefab = obj.transform:Find("GearStarPrefab")
            local StarPanelRoot = obj.transform:Find("StarPanelRoot")
            local RankText = obj.transform:Find("LvBG/RankText"):GetComponent("TextMeshProUGUI")
            --self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarPrefab.gameObject)
            MgrRes.LoadSprite(icon,v.icon)
            --MgrRes.LoadSprite(RankKuangImg,"Quality/RankKuang_"..v.quality)
            MgrRes.LoadSprite(RankKuangImg,self:GetQualityName(v.iconFrameGear))
            if v.quality == 5 then
                --RankPlusPanel:SetActive(true)
                --MgrRes.LoadSprite(RankPlusIconImg,"Quality/RankKuangPlus_"..v.quality)
                self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarSpecialPrefab.gameObject)
            else
                --RankPlusPanel:SetActive(false)
                self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarPrefab.gameObject)
            end
            RankText.text ="+"..v.level
            self.SourceExp = self.SourceExp + self:GetExpBySource(v.star) + math.ceil(v.exp*0.3)
            GearStarSpecialPrefab.gameObject:SetActive(false)
            GearStarPrefab.gameObject:SetActive(false)
        end
    end
    self:UpdataEXP()
end
---自动添加强化素材
function M:AutoAddSource()
    local exp = 0
    self.SingleChooseCoreList = {}
    self.RealCostCore = {}
    local array = CoreControl.GetCores()
    ---排序
    local sortgroup = {"star","level","quality","RoleId"}
    Global.Sort(array,sortgroup,false)
    ---筛选
    for i, v in ipairs(array) do
        if #self.RealCostCore >= self.NeedPrefabNum then
            break
        end

        if v.uid ~= self.CurOperationCore.uid and v.star <= 5 and v.RoleId == 0 and v.level == 0 and CoreControl.GetCoreLock(v.uid) ~= 1 and #v.armorGroup == 0 then ---锁定的装备不添入强化素材
            exp = exp + self:GetExpBySource(v.star) + math.ceil(v.exp*0.3)
            local value = exp + self.CurOperationCore.exp
            table.insert(self.SingleChooseCoreList,v)
            table.insert(self.RealCostCore,v)
            if  value >= self.CurOperationCore.maxExp then
                break
            end
        end
    end
    if  #self.RealCostCore  <= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips4"),1},true)
    end
    self:UpdataCostItem()
    self.GearBriefScroll01():RefreshCells()
end
---更新突破素材
function M:UpdataAdvanceItem()
    self.SourceExp = 0
    self:ClearAdvanceditem()
    if #self.SingleChooseCoreList>0 then
        for i, v in pairs(self.SingleChooseCoreList) do
            local obj = self.AdvancedNeedPrefab[i].transform:Find("icon/Item")
            obj.gameObject:SetActive(true)
            local icon = obj.transform:Find("icon"):GetComponent("Image")
            local RankKuangImg = obj.transform:Find("RankKuangImg"):GetComponent("Image")
            --local RankPlusIconImg = obj.transform:Find("RankPlusPanel/RankPlusIconImg"):GetComponent("Image")
            --local RankPlusPanel = obj.transform:Find("RankPlusPanel").gameObject
            local GearStarSpecialPrefab = obj.transform:Find("GearSpecialStarPrefab")
            local GearStarPrefab = obj.transform:Find("GearStarPrefab")
            local StarPanelRoot = obj.transform:Find("StarPanelRoot")
            local RankText = obj.transform:Find("LvBG/RankText"):GetComponent("TextMeshProUGUI")
            --self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarPrefab.gameObject)
            MgrRes.LoadSprite(icon,v.icon)
            --MgrRes.LoadSprite(RankKuangImg,"Quality/RankKuang_"..v.quality)
            MgrRes.LoadSprite(RankKuangImg,self:GetQualityName(v.iconFrameGear))
            if v.quality == 5 then
                --RankPlusPanel:SetActive(true)
                --MgrRes.LoadSprite(RankPlusIconImg,"Quality/RankKuangPlus_"..v.quality)
                self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarSpecialPrefab.gameObject)
            else
                --RankPlusPanel:SetActive(false)
                self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarPrefab.gameObject)
            end
            self.SourceExp = self.SourceExp + self:GetExpBySource(v.star) + math.ceil(v.exp*0.3)
            RankText.text ="+"..v.level
            GearStarPrefab.gameObject:SetActive(false)
            GearStarSpecialPrefab.gameObject:SetActive(false)
        end
    end
    local costItem = ItemControl.GetItemByID(100001)  --玩家背包拥有此消耗物品
    if self.AdvancedCost ~= nil then
        self.AdvancedCostText().text = costItem.count >= tonumber(self.AdvancedCost) and self.AdvancedCost or string.format("<color=#DB3D3D>%s</color>",self.AdvancedCost)
    else
        self.AdvancedCostText().text = ""
    end

    if #self.SingleChooseCoreList == 3 then
        self.Btu_Advanced().gameObject:SetActive(true)
        self.Btu_UnAdvanced().gameObject:SetActive(false)
    else
        self.Btu_Advanced().gameObject:SetActive(false)
        self.Btu_UnAdvanced().gameObject:SetActive(true)
    end
    if self.CurOperationCore.star == tonumber(SteamLocalData.tab[106013][2]) and self.CurOperationCore.quality == tonumber(SteamLocalData.tab[106014][2]) then
        self.Btu_Advanced().gameObject:SetActive(false)
        self.Btu_UnAdvanced().gameObject:SetActive(true)
    end
end

---自动添加突破素材
function M:AdvancedAutoAddSource()
    self.SingleChooseCoreList = {}
    self.RealCostCore = {}      ---已添加核心
    local array = CoreControl.GetCores()
    ---排序
    local sortgroup = {"star","level","quality","RoleId"}
    Global.Sort(array,sortgroup,false)
    ---筛选
    for i, v in ipairs(array) do
        if #self.RealCostCore >= 3 then
            break
        end
        if v.uid ~= self.CurOperationCore.uid and v.RoleId == 0 and v.level == 0 and v.star == self.CurOperationCore.star and v.quality == self.CurOperationCore.quality and CoreControl.GetCoreLock(v.uid) ~= 1 and #v.armorGroup == 0 then ---锁定的装备不添入突破素材
        table.insert(self.SingleChooseCoreList,v)
            table.insert(self.RealCostCore,v)
            ---刷新选中效果

        end
    end
    if  #self.RealCostCore  <= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips4"),1},true)
    end
    self:UpdataAdvanceItem()

end

---更新经验
function M:UpdataEXP()
   -- print(self.SourceExp)
   -- local Lv = self:GetLevel(self.SourceExp + self.CurOperationCore.exp)
   -- print(Lv)
   -- if Lv > 0 then
   --     self.PreviewLv =self.CurOperationCore.level + Lv
   -- else
   --     self.PreviewLv = self.CurOperationCore.level + 1
   -- end
    --目标等级
    self.PreviewLv = self:GetLevel(self.SourceExp + self.CurOperationCore.exp)
    if self.PreviewLv ~= self.CurOperationCore.level then
        self.ShowLV = true
    else
        self.ShowLV = false
    end
    if self.PreviewLv >= 16 then
        self.PreviewLv = 15
    end
    self:UpdataDataPanel(self.CurOperationCore)
end

function M:GetdataAdvanceEXP(coreData)
    local Lv = 0
    local exp = 0
    if coreData.level > 15 then
        Lv = 15
    end
    for i, v in pairs(UpgradeLocalData.tab) do
        if v[2] == coreData.star and v[3] == coreData.quality then
            exp = coreData.exp * (v[6]/10000)
            break
        end
    end
    Lv = self:GetLevel(self.SourceExp + exp)
    return Lv
end

---确认素材
function M:PopReturn()
    local item = ItemControl.GetItemByID(100001)
    if self.CurOperation == 1 then
        if self.isAdvanced then
            if  self.AdvancedCost > item.count then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips8"),2},true)
                return
            end
        else
            if  self.CostMoney > item.count then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips8"),2},true)
                return
            end
        end
    elseif self.CurOperation == 2 then
        if  self.canReBuild == false then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"),2},true)
            return
        end
    end
    self.RealCostCore = {}
    self.RoleCore = {}
    self.isWear = false
    for i, v in pairs(self.SingleChooseCoreList) do
        if v.RoleId ~= 0 then
            table.insert(self.RoleCore,v)
        end
        table.insert(self.RealCostCore,v)
    end
    if #self.RoleCore>0 then
        self.isWear = true
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips3"),2},true)
        return
    else
        if self.CurOperation == 1 then
            if self.isAdvanced then
                self:UpdataAdvanceItem()
                self:UpGradeArmorClick()
            else
                self:UpdataCostItem()
                self:UpArmorClick()
            end
        elseif self.CurOperation == 2 then
            self:UpdataRebuildCostItem()
            self:RebuildArmorClick()
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
    end
end
---根据素材星级强化等级返回经验
function M:GetExpBySource(_Star)
    local exp = 0
    ---基础经验值
    for i, v in pairs(HxexperienceLocalData.tab) do
        if _Star == i then
            exp =  v[3]
        end
    end
    return exp
end
---根据经验覆盖强化等级
function M:GetLevel(exp)
    local lv = 0
    for i, v in ipairs(self.CurOperationCore.strengthenLevels)do
        if exp >= v then
            lv = i
        else
            break
        end
    end
    return lv
end
---设置标题
function M:SetTitle(_CN,_EN)
    self.Text_TitleCn().text = _CN
    self.Text_TitleEn().text = _EN
end
---获取经验消耗
function M:GetExpCost(nowLv,targetLv)
    if targetLv == nowLv then
        return
    end
    for i, v in pairs(self.CurOperationCore.strengthenLevels) do
        if i == targetLv then
            self.CostExp =  self.CostExp + v
            break
        end
    end
    self:GetExpCost(nowLv,targetLv - 1)
end
---获取金币消耗
function M:GetMoneyCost(nowLv,targetLv,num)
    if targetLv == nowLv then
        return
    end
    for i, v in pairs(self.CurOperationCore.strengthenConsumes) do
        if i == targetLv then
            self.CostMoney =  self.CostMoney + v
            break
        end
    end
    self:GetMoneyCost(nowLv,targetLv - 1)
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
            end,self.CoreFilter,idx})
            toggles[idx] = togTrans:GetComponent("Toggle")
        end
    end
    return toggles
end

---获取选择核心数据
function M:GetSelectedCore(uid)
    for i, v in pairs(self.SingleChooseCoreList) do
        if v.uid == uid then
            return v
        end
    end
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
---清空素材栏
function M:ClearUpitem()
    for i, v in pairs(self.UpNeedPrefab) do
        local obj = v.transform:Find("icon/Item")
        v.transform:Find("icon"):GetComponent("Image").enabled = true
        v.transform:Find("Img_Hexindi").gameObject:SetActive(true)
        v:GetComponent("Image").enabled = true
        obj.gameObject:SetActive(false)
    end
end
function M:ClearAdvanceditem()
    for i, v in pairs(self.AdvancedNeedPrefab) do
        local obj = v.transform:Find("icon/Item")
        obj.gameObject:SetActive(false)
    end
end
---创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        self:CreatStar(_Root,_Prefab)
    end
end

---强化请求
function M:UpArmorClick()
    print("升级核心")
    local goods = {}
    for i, v in pairs(self.RealCostCore) do
        v.goods.goodsID = v.uid
        goods[i] = v.goods
    end
    local targetgood =
    {
        goodsType = self.CurOperationCore.goods.goodsType,
        goodsID = self.CurOperationCore.uid,
        goodsNum = self.CurOperationCore.goods.goodsNum
    }
    local ArmorUPREQ  =
    {
        cost = goods,
        target = targetgood
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientArmorUpExpREQ',ArmorUPREQ))
    ItemControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ARMOR_UP_EXP_REQ,bytes,0,nil,Handle(self,self.ReceiveArmorACK),Handle(self,self.ReceiveArmorNTF))
end
---强化核心ACK回调
function M:ReceiveArmorACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorUpExpACK',buffer))
    print(tab.errNo)
end
---强化核心NTF回调
function M:ReceiveArmorNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorUpExpNTF',buffer))
    print("强化倍率"..tab.expTime)
    self.SuccessTargetLvText().text = self.CurOperationCore.level
    local times = string.split(SteamLocalData.tab[106006][2],",")
    if tab.expTime >= tonumber(string.split(times[3],"_")[1]) then
        self.SuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_supersuccess")
        self.supersuccess().gameObject:SetActive(true)
    elseif tab.expTime >= tonumber(string.split(times[2],"_")[1]) then
        self.SuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_greatsuccess")
        self.greatsuccess().gameObject:SetActive(true)
    else
        self.SuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_success")
    end
    self:SuccessReceive(tab.target)
    ---@type CoreData[]
    local goods = {}
    for i, v in pairs(tab.cost) do
        if v.goodsID ~= 100001 then
            goods[i] = v
        else
            ItemControl.PushSingleItemData(v,ItemControl.PushEnum.consume)    ---物品消耗
        end
    end
    self:UpdataUpPanel()
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    CoreControl.DeleteCore(goods)
  --  print("强化后的经验！！！！！！！！！！",tab.target.armorExp)
    CoreControl.PushSingleCoreData(tab.target)
    self.SuccessCurLvText().text = self.CurOperationCore.level
end
---强化成功返回
---@param target armors
function M:SuccessReceive(target)
    MgrSound.PlayEffect("yx_ui_qianghua_01",1,nil,false)
    self.SuccessInfoDataPrefab().gameObject:SetActive(false)
    self.UpgradeSuccessPanel().gameObject:SetActive(true)
    self.SwitchPanel().gameObject:SetActive(false)
    Tools.ClearAllChild(self.SuccessInfoDataRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #self.CurOperationCore.attrs do
        ---显示可用词条
        local GearInfo= GameObject.Instantiate(self.SuccessInfoDataPrefab().gameObject,self.SuccessInfoDataRoot().transform)
        GearInfo:SetActive(true)
        local VoidGearIcon = GearInfo.transform:Find("BG/iconBg/VoidGearIcon"):GetComponent("Image")
        local TitleText = GearInfo.transform:Find("TitleText"):GetComponent("TextMeshProUGUI")
        local OriginDataText = GearInfo.transform:Find("OriginDataText"):GetComponent("TextMeshProUGUI")
        local CurDataText = GearInfo.transform:Find("CurDataText"):GetComponent("TextMeshProUGUI")
        local CurData = 0
        local OriginData = 0
        if self.CurOperationCore.attrs[i].type == 0 then
            CurData = target.armorProperties*0.0001*self.highest[i]
        else
            CurData = target.armorProperties*0.0001*self.highest[i]*0.01
        end
        OriginData = self.CurOperationCore.attrs[i].attribute
        ---属性图标
        MgrRes.LoadSprite(VoidGearIcon,"Attribute/GearInfoIcon_"..self.CurOperationCore.attrs[i].attrID)
        ---属性值
        if self.CurOperationCore.attrs[i].type == 0 then
            OriginDataText.text  = string.format("%.0f",OriginData)
            CurDataText.text  = string.format("%.0f",CurData)
        else
            OriginDataText.text  = string.format("%.2f",OriginData).."%"
            CurDataText.text  = string.format("%.2f",CurData).."%"
        end
        --OriginDataText.text = (math.ceil(OriginData*10)*0.1)..(self.CurOperationCore.attrs[i].type == 1 and "%" or "")
        --CurDataText.text =(math.ceil(CurData*10)*0.1) ..(self.CurOperationCore.attrs[i].type == 1 and "%" or "")
        ---属性名称
        TitleText.text = self.CurOperationCore.attrs[i].attrName
    end
    self:ClearUpitem()
end


---进阶请求
function M:UpGradeArmorClick()
    print("进阶核心")
    local goods = {}
    for i, v in pairs(self.RealCostCore) do
        v.goods.goodsID = v.uid
        goods[i] = v.goods
    end
    local targetgood =
    {
        goodsType = self.CurOperationCore.goods.goodsType,
        goodsID = self.CurOperationCore.uid,
        goodsNum = self.CurOperationCore.goods.goodsNum
    }
    local ArmorUPREQ  =
    {
        cost = goods,
        target = targetgood
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientArmorUpGradeREQ',ArmorUPREQ))
    ItemControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ARMOR_UP_GRADE_REQ,bytes,0,nil,Handle(self,self.ReceiveUpGradeArmorACK),Handle(self,self.ReceiveUpGradeArmorNTF))
end
---进阶核心ACK回调
function M:ReceiveUpGradeArmorACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorUpGradeACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_enhancement_fail"),1},true)
        return
    end
end
---进阶核心NTF回调
function M:ReceiveUpGradeArmorNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorUpGradeNTF',buffer))
    ---@type CoreData[]
    local goods = {}
    for i, v in pairs(tab.cost) do
        if v.goodsID ~= 100001 then
            goods[i] = v
        else
            ItemControl.PushSingleItemData(v,ItemControl.PushEnum.consume)    ---物品消耗
        end
    end
    self:UpdataUpPanel()
    CoreControl.DeleteCore(goods)
    CoreControl.PushSingleCoreData(tab.target)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    MgrSound.PlayEffect("yx_ui_qianghua_01",1,nil,false)
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_enhancement_success"),2},true)
    self:ClearCacheData()
    if self.CurOperationCore.level>=15 and self.CurOperationCore.star>=5 then
        self.isAdvanced = true
        self:InitAdvancedPanel()
    else
        self.isAdvanced = false
        self:InitGearUpPanel()
    end
end

function M:OnClickTakeOff()
    print("脱下")
    local rolecores = {}
    local ArmorREQ = {}
    if self.CurOperation == 3 then
        ArmorREQ =
        {
            data =
            {
                [1] = {
                    heroID = self.CurOperationCore.RoleId,
                    armorID = 0,
                    armorSolt = self.CurOperationCore.slot,
                    armorGroup = self.armorType
                }
            }
        }
    else
        for i, v in pairs(self.RoleCore) do
            local item =
            {
                heroID = v.RoleId,
                armorID = 0,
                armorSolt = v.slot
            }
            table.insert(rolecores,item)
        end
        ArmorREQ =
        {
            data =rolecores
        }
    end
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,2,nil,Handle(self,self.ClientReDetailACK),Handle(self,self.ClientReDetailNTF))
end
function M:ClientReDetailACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorACK',buffer))
    if tab.errNo ~= 0 then
        print("解除失败："..tab.errNo)
    end
end
---脱装备请求返回
function M:ClientReDetailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorNTF',buffer))
    if tag == 2 then
        for i, v in pairs(tab.data) do
            local armorid = nil
            local roleData = nil
            local coreData = nil
            if v.armorID == 0 then
                roleData = HeroControl.GetRoleDataByID(v.heroID)
                if v.armorSolt == 1 then
                    armorid = roleData.armor1
                    roleData.armor1 = 0
                elseif v.armorSolt == 2 then
                    armorid = roleData.armor2
                    roleData.armor2 = 0
                end
                coreData = CoreControl.GetSingleCoreData(armorid)
                coreData:ReLoadCore(0,0,tab.data[1].armorGroup)
            else
                self.CurOperationCore.RoleId = 0
                self.CurOperationCore.slot = 0
                roleData = HeroControl.GetRoleDataByID(v.heroID)
                roleData:ReLoadCore(v.armorSolt,v.armorID,tab.data[1].armorGroup)
                coreData = CoreControl.GetSingleCoreData(v.armorID)
                coreData:ReLoadCore(v.armorSolt,v.heroID,tab.data[1].armorGroup)
                coreData.isSelect = false
                self.CurOperationCore = coreData
                self.PreviewLv = self.CurOperationCore.level + 1
            end
            CoreControl.GetCores()
            RoleCardViewModel.ReloadCacheRoleData()
        end
        if  self.CurOperation == 1 then
            if self.isAdvanced then
                self:UpdataAdvanceItem()
            else
                self:UpdataCostItem()
            end
        elseif  self.CurOperation == 2 then
            self:UpdataRebuildCostItem()
        elseif self.CurOperation == 3 then
            self:UpdataGearInfo(self.CurOperationCore)
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
        if self.isWear then
            self.isWear = false
            if  self.CurOperation == 1 then
                if self.isAdvanced then
                    self:UpGradeArmorClick()
                else
                    self:UpArmorClick()
                end
            elseif  self.CurOperation == 2 then
                self:RebuildArmorClick()
            end
        end
    end
end
----替换装备请求
function M:OnClickChange()
    print("交换")
    self.IsChoose = false
    local ArmorREQ =
    {
        data =  {
            [1] = {
                heroID = RoleCardViewModel.CurrentHero.id,
                armorID = self.PopSelectCore.uid,
                armorSolt = self.CurCore.slot,
                armorGroup = self.armorType
            }
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,2,nil,nil,Handle(self,self.ClientReDetailNTF))
end
---开发请求
function M:RebuildArmorClick()
    print("开发核心")
    --if ((tonumber(self.basicproperties[2])+tonumber(self.strengtheningattribute[2])*self.CurOperationCore.level)*0.01) == math.floor(self.CurOperationCore.properties*100) then
    if self.CurOperationCore.properties >= 1 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips10"),1},true)
        return
    end
    local goods = {}

    local targetgood =
    {
        goodsType = self.CurOperationCore.goods.goodsType,
        goodsID = self.CurOperationCore.uid,
        goodsNum = self.CurOperationCore.goods.goodsNum
    }
    local ArmorUPREQ  =
    {
        target = targetgood
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientArmorExploitREQ',ArmorUPREQ))
    ItemControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ARMOR_EXPLOIT_REQ,bytes,0,nil,Handle(self,self.RebuildArmorACK),Handle(self,self.RebuildArmorNTF))
end
---开发ACK回调
function M:RebuildArmorACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorExploitACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips11")..tab.errNo,1},true)
        return
    end
end
---开发NTF回调
function M:RebuildArmorNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorExploitNTF',buffer))
    ---@type CoreData[]
    for i, v in pairs(tab.cost) do
        ItemControl.PushSingleItemData(v,ItemControl.PushEnum.consume)    ---物品消耗
    end
    self:UpdataUpPanel()
    local oldCore = table.DeepCopy(self.CurOperationCore)
    CoreControl.PushSingleCoreData(tab.target)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    local isFail = false
    if oldCore.properties == self.CurOperationCore.properties then
        self.RebuildSuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_development_fail")
        self.SuccessCurBuildText().text ="<color=#ff3c4e>".. math.floor(self.CurOperationCore.properties * 100).."%</color>"
        isFail = true
    else
        self.RebuildSuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_development_fail")
        isFail = false
        self.SuccessCurBuildText().text ="<color=#3AFFC5>".. math.floor(self.CurOperationCore.properties * 100).."%</color>"
    end
    self:RebuildSuccessReceive(tab.target,isFail,oldCore)
end
---开发成功界面s
function M:RebuildSuccessReceive(target,isFail,oldCore)
    MgrSound.PlayEffect("yx_ui_qianghua_01",1,nil,false)
    self.RebuildSuccessPanel().gameObject:SetActive(true)
    self.SwitchPanel().gameObject:SetActive(false)
    Tools.ClearAllChild(self.SuccessRebuildDataRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #oldCore.attrs do
        ---显示可用词条
        local GearInfo= GameObject.Instantiate(self.SuccessRebuildDataPrefab().gameObject,self.SuccessRebuildDataRoot().transform)
        GearInfo:SetActive(true)
        local VoidGearIcon = GearInfo.transform:Find("BG/iconBg/VoidGearIcon"):GetComponent("Image")
        local TitleText = GearInfo.transform:Find("TitleText"):GetComponent("TextMeshProUGUI")
        local OriginDataText = GearInfo.transform:Find("OriginDataText"):GetComponent("TextMeshProUGUI")
        local CurDataText = GearInfo.transform:Find("CurDataText"):GetComponent("TextMeshProUGUI")
        local CurData = 0
        local OriginData = 0
        if oldCore.attrs[i].type == 0 then
            CurData = target.armorProperties*0.0001*self.highest[i]
        else
            CurData = target.armorProperties*0.0001*self.highest[i]*0.01
        end
        OriginData = oldCore.attrs[i].attribute
        ---属性图标
        MgrRes.LoadSprite(VoidGearIcon,"Attribute/GearInfoIcon_"..oldCore.attrs[i].attrID)
        ---属性值
        if oldCore.attrs[i].type == 0 then
            OriginDataText.text  = string.format("%.0f",OriginData)
            CurDataText.text  = string.format("%.0f",CurData)
        else
            OriginDataText.text  = string.format("%.2f",OriginData).."%"
            CurDataText.text  = string.format("%.2f",CurData).."%"
        end
        --OriginDataText.text =(math.ceil(OriginData*10)*0.1)..(self.CurOperationCore.attrs[i].type == 1 and "%" or "")
        --CurDataText.text =(math.ceil(CurData*10)*0.1) ..(self.CurOperationCore.attrs[i].type == 1 and "%" or "")
        ---属性名称
        TitleText.text = oldCore.attrs[i].attrName
        if isFail then
            --CurDataText.gameObject:SetActive(false)
            CurDataText.color = Color(1,1,1)
        else
            --CurDataText.gameObject:SetActive(true)
            CurDataText.color = Color(0.1647059,0.9921569,0.9607843)
        end
    end
    self.SuccessRebuildDataPrefab().gameObject:SetActive(false)
end
---初始化强化素材
function M:InitNeedPrefab()
    
end
---清除数据
function M:ClearCacheData()
    self.SingleChooseCoreList = {}
    self.OldCoreList = {}
    self.RealCostCore = {}
    self.RoleCore = {}
    self.isMax = false
end
function M:ClearSelect()
    for i, v in pairs(CoreControl.GetCores()) do
        v.isSelect = nil
    end
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    self:ClearSelect()
end
return M