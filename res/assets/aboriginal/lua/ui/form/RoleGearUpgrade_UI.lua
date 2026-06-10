-- Code Auto Create Begin
local M = Class('RoleGearUpgrade_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleGearUpgrade_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleGearUpgrade_UI].prefab'
    self.Name = 'Form[RoleGearUpgrade_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SwitchPanel','SwitchPanel',2},{'Btn_Switch','SwitchPanel/SwitchInfo/Btn_Switch',2},{'Line','SwitchPanel/SwitchInfo/Btn_Switch/Line',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchInfo/Btn_SwitchHighLight',2},{'Line01','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/Line',2},{'Btn_Switch01','SwitchPanel/SwitchUpdata/Btn_Switch',2},{'Line02','SwitchPanel/SwitchUpdata/Btn_Switch/Line',2},{'Btn_SwitchHighLight01','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight',2},{'Line03','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight/Line',2},{'Btn_Switch02','SwitchPanel/SwitchDevelopment/Btn_Switch',2},{'Line04','SwitchPanel/SwitchDevelopment/Btn_Switch/Line',2},{'Btn_SwitchHighLight02','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight',2},{'Line05','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight/Line',2},{'Btu_Hexinyuelan','SwitchPanel/Btu_Hexinyuelan',2},{'Img_Hexinyuelandi','SwitchPanel/Btu_Hexinyuelan/Img_Hexinyuelandi',2},{'UpgradePreviewPanel','UpgradePreviewPanel',2},{'Sxian','UpgradePreviewPanel/Sxian',2},{'Img_Biaotixian1','UpgradePreviewPanel/Img_Biaotixian1',2},{'KuangXian','UpgradePreviewPanel/KuangXian',2},{'Right','UpgradePreviewPanel/Lvinfo/Right',2},{'ExpSliderBG','UpgradePreviewPanel/Lvinfo/ExpSliderBG',2},{'ExpSlider','UpgradePreviewPanel/Lvinfo/ExpSliderBG/ExpSlider',2},{'GearUpgradePrefab','UpgradePreviewPanel/GearUpgradePrefab',2},{'BG','UpgradePreviewPanel/GearUpgradePrefab/BG',2},{'iconBg','UpgradePreviewPanel/GearUpgradePrefab/BG/iconBg',2},{'VoidGearIcon','UpgradePreviewPanel/GearUpgradePrefab/BG/iconBg/VoidGearIcon',2},{'Jiantou','UpgradePreviewPanel/GearUpgradePrefab/Jiantou',2},{'GearUpgradeRoot','UpgradePreviewPanel/GearUpgradeRoot',2},{'UpgradeNeedPanel','UpgradeNeedPanel',2},{'Img_Biaotixian2','UpgradeNeedPanel/Text_NeedTitle/Img_Biaotixian2',2},{'Xxian','UpgradeNeedPanel/Xxian',2},{'Btu_AutoAdd','UpgradeNeedPanel/Btu_AutoAdd',2},{'Img_Zidongtianjiadi','UpgradeNeedPanel/Btu_AutoAdd/Img_Zidongtianjiadi',2},{'NeedPrefab1','UpgradeNeedPanel/NeedPanel/NeedPrefab1',2},{'Img_Hexindi','UpgradeNeedPanel/NeedPanel/NeedPrefab1/Img_Hexindi',2},{'icon','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon',2},{'Item','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item',2},{'icon01','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/icon',2},{'Stardi','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/Stardi',2},{'EmptyStarPanelRoot','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/GearStarPrefab',2},{'StarPanelRoot','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/StarPanelRoot',2},{'LvBG','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/LvBG',2},{'RankPlusPanel','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/RankPlusPanel',2},{'RankPlusIconImg','UpgradeNeedPanel/NeedPanel/NeedPrefab1/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'NeedPrefab2','UpgradeNeedPanel/NeedPanel/NeedPrefab2',2},{'Img_Hexindi01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/Img_Hexindi',2},{'icon02','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon',2},{'Item01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item',2},{'icon03','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/icon',2},{'Stardi01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/Stardi',2},{'EmptyStarPanelRoot01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/GearStarPrefab',2},{'StarPanelRoot01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/StarPanelRoot',2},{'LvBG01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/LvBG',2},{'RankPlusPanel01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/RankPlusPanel',2},{'RankPlusIconImg01','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'NeedPrefab3','UpgradeNeedPanel/NeedPanel/NeedPrefab3',2},{'Img_Hexindi02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/Img_Hexindi',2},{'icon04','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon',2},{'Item02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item',2},{'icon05','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/icon',2},{'Stardi02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/Stardi',2},{'EmptyStarPanelRoot02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/GearStarPrefab',2},{'StarPanelRoot02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/StarPanelRoot',2},{'LvBG02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/LvBG',2},{'RankPlusPanel02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/RankPlusPanel',2},{'RankPlusIconImg02','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'NeedPrefab4','UpgradeNeedPanel/NeedPanel/NeedPrefab4',2},{'Img_Hexindi03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/Img_Hexindi',2},{'icon06','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon',2},{'Item03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item',2},{'icon07','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/icon',2},{'Stardi03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/Stardi',2},{'EmptyStarPanelRoot03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/GearStarPrefab',2},{'StarPanelRoot03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/StarPanelRoot',2},{'LvBG03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/LvBG',2},{'RankPlusPanel03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/RankPlusPanel',2},{'RankPlusIconImg03','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'NeedPrefab5','UpgradeNeedPanel/NeedPanel/NeedPrefab5',2},{'Img_Hexindi04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/Img_Hexindi',2},{'icon08','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon',2},{'Item04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item',2},{'icon09','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/icon',2},{'Stardi04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/Stardi',2},{'EmptyStarPanelRoot04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/GearStarPrefab',2},{'StarPanelRoot04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/StarPanelRoot',2},{'LvBG04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/LvBG',2},{'RankPlusPanel04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/RankPlusPanel',2},{'RankPlusIconImg04','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'CostIcon','UpgradeNeedPanel/Costbg/CostIcon',2},{'Btu_Upgrade','UpgradeNeedPanel/Btu_Upgrade',2},{'Img_Qianghuadi1','UpgradeNeedPanel/Btu_Upgrade/Img_Qianghuadi1',2},{'Btu_UnUpgrade','UpgradeNeedPanel/Btu_UnUpgrade',2},{'Img_Qianghuadi2','UpgradeNeedPanel/Btu_UnUpgrade/Img_Qianghuadi2',2},{'UpgradeSuccessPanel','UpgradeSuccessPanel',2},{'Btn_Back','UpgradeSuccessPanel/Btn_Back',2},{'chenggongdi','UpgradeSuccessPanel/chenggongdi',2},{'LvInfoPanel','UpgradeSuccessPanel/chenggongdi/LvInfoPanel',2},{'SuccessInfoDataPrefab','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab',2},{'BG01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/BG',2},{'iconBg01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/BG/iconBg',2},{'VoidGearIcon01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/BG/iconBg/VoidGearIcon',2},{'Jiantou01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/Jiantou',2},{'SuccessInfoDataRoot','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataRoot',2},{'guang','UpgradeSuccessPanel/chenggongdi/guang',2},{'RebuildPreviewPanel','RebuildPreviewPanel',2},{'Sxian01','RebuildPreviewPanel/Sxian',2},{'Img_Biaotixian101','RebuildPreviewPanel/Img_Biaotixian1',2},{'KuangXian01','RebuildPreviewPanel/KuangXian',2},{'GearRebuildPrefab','RebuildPreviewPanel/GearRebuildPrefab',2},{'BG02','RebuildPreviewPanel/GearRebuildPrefab/BG',2},{'iconBg02','RebuildPreviewPanel/GearRebuildPrefab/BG/iconBg',2},{'VoidGearIcon02','RebuildPreviewPanel/GearRebuildPrefab/BG/iconBg/VoidGearIcon',2},{'Jiantou02','RebuildPreviewPanel/GearRebuildPrefab/Jiantou',2},{'GearRebuildRoot','RebuildPreviewPanel/GearRebuildRoot',2},{'RebuildNeedPanel','RebuildNeedPanel',2},{'Img_Biaotixian201','RebuildNeedPanel/Img_Biaotixian2',2},{'Xxian01','RebuildNeedPanel/Xxian',2},{'Btu_RebuildAutoAdd','RebuildNeedPanel/Btu_RebuildAutoAdd',2},{'Img_Zidongtianjiadi01','RebuildNeedPanel/Btu_RebuildAutoAdd/Img_Zidongtianjiadi',2},{'RebuildNeedPrefab1','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1',2},{'Img_Hexindi05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/Img_Hexindi',2},{'icon10','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon',2},{'Item05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item',2},{'icon11','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/icon',2},{'Stardi05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/Stardi',2},{'EmptyStarPanelRoot05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/GearStarPrefab',2},{'StarPanelRoot05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/StarPanelRoot',2},{'LvBG05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/LvBG',2},{'RankPlusPanel05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/RankPlusPanel',2},{'RankPlusIconImg05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'RebuildNeedPrefab2','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2',2},{'Img_Hexindi06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/Img_Hexindi',2},{'icon12','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon',2},{'Item06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item',2},{'icon13','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/icon',2},{'Stardi06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/Stardi',2},{'EmptyStarPanelRoot06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/GearStarPrefab',2},{'StarPanelRoot06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/StarPanelRoot',2},{'LvBG06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/LvBG',2},{'RankPlusPanel06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/RankPlusPanel',2},{'RankPlusIconImg06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'RebuildNeedPrefab3','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3',2},{'Img_Hexindi07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/Img_Hexindi',2},{'icon14','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon',2},{'Item07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item',2},{'icon15','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/icon',2},{'Stardi07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/Stardi',2},{'EmptyStarPanelRoot07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPrefab07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/GearStarPrefab',2},{'StarPanelRoot07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/StarPanelRoot',2},{'LvBG07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/LvBG',2},{'RankPlusPanel07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/RankPlusPanel',2},{'RankPlusIconImg07','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/RankPlusPanel/RankPlusIconImg',2},{'CostIcon01','RebuildNeedPanel/Costbg/CostIcon',2},{'Btu_Build','RebuildNeedPanel/Btu_Build',2},{'Img_Qianghuadi101','RebuildNeedPanel/Btu_Build/Img_Qianghuadi1',2},{'Btu_UnBuild','RebuildNeedPanel/Btu_UnBuild',2},{'Img_Qianghuadi201','RebuildNeedPanel/Btu_UnBuild/Img_Qianghuadi2',2},{'GearInfoPanel','GearInfoPanel',2},{'GearInfoPrefab','GearInfoPanel/GearInfoPrefab',2},{'BG03','GearInfoPanel/GearInfoPrefab/BG',2},{'iconBg03','GearInfoPanel/GearInfoPrefab/BG/iconBg',2},{'VoidGearIcon03','GearInfoPanel/GearInfoPrefab/BG/iconBg/VoidGearIcon',2},{'GearInfoRoot','GearInfoPanel/GearInfoRoot',2},{'LvBG08','GearInfoPanel/LvBG',2},{'RankKuangImg','GearInfoPanel/RankKuangImg',2},{'IconBG','GearInfoPanel/RankKuangImg/IconBG',2},{'GearIconImg','GearInfoPanel/RankKuangImg/IconBG/GearIconImg',2},{'EmptyStarPanelRoot08','GearInfoPanel/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab08','GearInfoPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab09','GearInfoPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab10','GearInfoPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab11','GearInfoPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab12','GearInfoPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab13','GearInfoPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'GearInfoStarPrefab','GearInfoPanel/GearInfoStarPrefab',2},{'GearInfoStarPanelRoot','GearInfoPanel/GearInfoStarPanelRoot',2},{'Qicon','GearInfoPanel/Qicon',2},{'QualityIcon','GearInfoPanel/Qualitytxt/QualityIcon',2},{'Img_Biaotixian102','GearInfoPanel/Img_Biaotixian1',2},{'Btu_Jiechu','GearInfoPanel/Btu_Jiechu',2},{'Img_Jiechudi','GearInfoPanel/Btu_Jiechu/Img_Jiechudi',2},{'Btu_Zhuangbei','GearInfoPanel/Btu_Zhuangbei',2},{'Img_Zhuangbeidi','GearInfoPanel/Btu_Zhuangbei/Img_Zhuangbeidi',2},{'Img_Biaotixian202','GearInfoPanel/Img_Biaotixian2',2},{'RebuildSuccessPanel','RebuildSuccessPanel',2},{'Btn_Back01','RebuildSuccessPanel/Btn_Back',2},{'chenggongdi01','RebuildSuccessPanel/chenggongdi',2},{'LvInfoPanel01','RebuildSuccessPanel/chenggongdi/LvInfoPanel',2},{'SuccessRebuildDataPrefab','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab',2},{'BG04','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/BG',2},{'iconBg04','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/BG/iconBg',2},{'VoidGearIcon04','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/BG/iconBg/VoidGearIcon',2},{'Jiantou03','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/Jiantou',2},{'SuccessRebuildDataRoot','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataRoot',2},{'guang01','RebuildSuccessPanel/chenggongdi/guang',2},{'PopupPanel','PopupPanel',2},{'Img_Bg','PopupPanel/Img_Bg',2},{'Img_zhezhao','PopupPanel/Img_Bg/Img_zhezhao',2},{'Img_Tanchuxian','PopupPanel/Img_Bg/Img_Tanchuxian',2},{'PopBg','PopupPanel/Img_Bg/PopBg',2},{'Img_Xian3','PopupPanel/Img_Bg/Img_Xian3',2},{'Img_Xian2','PopupPanel/Img_Bg/Img_Xian2',2},{'Img_Xian1','PopupPanel/Img_Bg/Img_Xian1',2},{'SwitchTypeBtnPanel','PopupPanel/SwitchTypeBtnPanel',2},{'TypePanelRoot','PopupPanel/SwitchTypeBtnPanel/TypePanelRoot',2},{'GearBagTypeToggle','PopupPanel/SwitchTypeBtnPanel/GearBagTypeToggle',2},{'GearDetailContent','PopupPanel/GearDetailScroll/GearDetailContent',2},{'Btn_Choose','PopupPanel/Btn_Choose',2},{'Btn_I','PopupPanel/Btn_I',2},{'Btn_Return','PopupPanel/Btn_Return',2},{'GearDetailContent01','PopupPanel/GearBriefScroll/GearDetailContent',2},{'Btu_Tihuan','PopupPanel/Btu_Tihuan',2},{'Img_Tihuandi','PopupPanel/Btu_Tihuan/Img_Tihuandi',2},
        -- Text 列表
        {'EnText','SwitchPanel/SwitchInfo/Btn_Switch/EnText',3},{'CNText','SwitchPanel/SwitchInfo/Btn_Switch/CNText',3},{'EnText01','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/EnText',3},{'CNText01','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/CNText',3},{'EnText02','SwitchPanel/SwitchUpdata/Btn_Switch/EnText',3},{'CNText02','SwitchPanel/SwitchUpdata/Btn_Switch/CNText',3},{'EnText03','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight/EnText',3},{'CNText03','SwitchPanel/SwitchUpdata/Btn_SwitchHighLight/CNText',3},{'EnText04','SwitchPanel/SwitchDevelopment/Btn_Switch/EnText',3},{'CNText04','SwitchPanel/SwitchDevelopment/Btn_Switch/CNText',3},{'EnText05','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight/EnText',3},{'CNText05','SwitchPanel/SwitchDevelopment/Btn_SwitchHighLight/CNText',3},{'Text_Hexinyuelan','SwitchPanel/Btu_Hexinyuelan/Text_Hexinyuelan',3},{'Text_Preview','UpgradePreviewPanel/Text_Preview',3},{'CurLvText','UpgradePreviewPanel/Lvinfo/CurLvText',3},{'PreviewLvText','UpgradePreviewPanel/Lvinfo/PreviewLvText',3},{'ExpText','UpgradePreviewPanel/Lvinfo/ExpText',3},{'TitleText','UpgradePreviewPanel/GearUpgradePrefab/TitleText',3},{'OriginDataText','UpgradePreviewPanel/GearUpgradePrefab/OriginDataText',3},{'CurDataText','UpgradePreviewPanel/GearUpgradePrefab/CurDataText',3},{'Text_NeedTitle','UpgradeNeedPanel/Text_NeedTitle',3},{'Text_Zidongtianjia','UpgradeNeedPanel/Btu_AutoAdd/Text_Zidongtianjia',3},{'RankText','UpgradeNeedPanel/NeedPanel/NeedPrefab2/icon/Item/LvBG/RankText',3},{'RankText01','UpgradeNeedPanel/NeedPanel/NeedPrefab3/icon/Item/LvBG/RankText',3},{'RankText02','UpgradeNeedPanel/NeedPanel/NeedPrefab4/icon/Item/LvBG/RankText',3},{'RankText03','UpgradeNeedPanel/NeedPanel/NeedPrefab5/icon/Item/LvBG/RankText',3},{'Costbg','UpgradeNeedPanel/Costbg',3},{'CostText','UpgradeNeedPanel/Costbg/CostText',3},{'Text_Qianghua1','UpgradeNeedPanel/Btu_Upgrade/Text_Qianghua1',3},{'Text_Qianghua2','UpgradeNeedPanel/Btu_UnUpgrade/Text_Qianghua2',3},{'touchtoexit','UpgradeSuccessPanel/touchtoexit',3},{'Text_Qianghuajieguo','UpgradeSuccessPanel/chenggongdi/LvInfoPanel/Text_Qianghuajieguo',3},{'SuccessCurLvText','UpgradeSuccessPanel/chenggongdi/LvInfoPanel/SuccessCurLvText',3},{'TitleText01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/TitleText',3},{'OriginDataText01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/OriginDataText',3},{'CurDataText01','UpgradeSuccessPanel/chenggongdi/SuccessInfoDataPrefab/CurDataText',3},{'SuccTitleText','UpgradeSuccessPanel/chenggongdi/guang/SuccTitleText',3},{'Text_Preview01','RebuildPreviewPanel/Text_Preview',3},{'Text_Dangqianjindu','RebuildPreviewPanel/Lvinfo/Text_Dangqianjindu',3},{'BulidText','RebuildPreviewPanel/Lvinfo/BulidText',3},{'TitleText02','RebuildPreviewPanel/GearRebuildPrefab/TitleText',3},{'OriginDataText02','RebuildPreviewPanel/GearRebuildPrefab/OriginDataText',3},{'CurDataText02','RebuildPreviewPanel/GearRebuildPrefab/CurDataText',3},{'Text_NeedTitle01','RebuildNeedPanel/Text_NeedTitle',3},{'Text_Zidongtianjia01','RebuildNeedPanel/Btu_RebuildAutoAdd/Text_Zidongtianjia',3},{'RankText04','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab1/icon/Item/LvBG/RankText',3},{'RankText05','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab2/icon/Item/LvBG/RankText',3},{'RankText06','RebuildNeedPanel/NeedPanel/RebuildNeedPrefab3/icon/Item/LvBG/RankText',3},{'Costbg01','RebuildNeedPanel/Costbg',3},{'RebuildCostText','RebuildNeedPanel/Costbg/RebuildCostText',3},{'Text_Qianghua101','RebuildNeedPanel/Btu_Build/Text_Qianghua1',3},{'Text_Qianghua201','RebuildNeedPanel/Btu_UnBuild/Text_Qianghua2',3},{'TitleText03','GearInfoPanel/GearInfoPrefab/TitleText',3},{'OriginDataText03','GearInfoPanel/GearInfoPrefab/OriginDataText',3},{'GearNamtText','GearInfoPanel/GearNamtText',3},{'GearInfoRankText','GearInfoPanel/LvBG/GearInfoRankText',3},{'Lvtxt','GearInfoPanel/LvBG/Lvtxt',3},{'Qicontxt','GearInfoPanel/Qicon/Qicontxt',3},{'Qualitytxt','GearInfoPanel/Qualitytxt',3},{'Text_Hexinshuxin','GearInfoPanel/Text_Hexinshuxin',3},{'Text_Jiechu','GearInfoPanel/Btu_Jiechu/Text_Jiechu',3},{'Text_Zhuangbei','GearInfoPanel/Btu_Zhuangbei/Text_Zhuangbei',3},{'Text_Hexinjineng','GearInfoPanel/Text_Hexinjineng',3},{'Text_Kaiqitiaojian','GearInfoPanel/UnAchieve/Text_Kaiqitiaojian',3},{'Text_Zanweikaiqi','GearInfoPanel/UnAchieve/Text_Zanweikaiqi',3},{'touchtoexit01','RebuildSuccessPanel/touchtoexit',3},{'Text_Qianghuajieguo01','RebuildSuccessPanel/chenggongdi/LvInfoPanel/Text_Qianghuajieguo',3},{'SuccessCurBuildText','RebuildSuccessPanel/chenggongdi/LvInfoPanel/SuccessCurBuildText',3},{'TitleText04','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/TitleText',3},{'OriginDataText04','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/OriginDataText',3},{'CurDataText03','RebuildSuccessPanel/chenggongdi/SuccessRebuildDataPrefab/CurDataText',3},{'TitleText05','RebuildSuccessPanel/chenggongdi/guang/TitleText',3},{'Btn_WearTxt','PopupPanel/Btn_Choose/Btn_WearTxt',3},{'Text_Tihuan','PopupPanel/Btu_Tihuan/Text_Tihuan',3},
        -- UITemplate 列表
        {'GearBagTypeToggle01','PopupPanel/SwitchTypeBtnPanel/GearBagTypeToggle',10},
        -- Toggle 列表
        {'SwitchInfo','SwitchPanel/SwitchInfo',13},{'SwitchUpdata','SwitchPanel/SwitchUpdata',13},{'SwitchDevelopment','SwitchPanel/SwitchDevelopment',13},{'GearBagTypeToggle02','PopupPanel/SwitchTypeBtnPanel/GearBagTypeToggle',13},
        -- RawImage 列表
        {'GearDetailScroll','PopupPanel/GearDetailScroll',15},{'GearBriefScroll','PopupPanel/GearBriefScroll',15},
        -- LoopScrollRect 列表
        {'GearDetailScroll01','PopupPanel/GearDetailScroll',18},{'GearBriefScroll01','PopupPanel/GearBriefScroll',18},
    }
end
-- Code Auto Create End
require("LocalData/ArmoredcoreLocalData")
require("LocalData/HxexperienceLocalData")
require("LocalData/CorerestructureLocalData")
function M:OnInit()
    self.CurOperation = 1  ---1 强化   2 开发   3.详情替换
    self.SwichIndex = 2
    self.PanelIndex = 0     --- 页签标识
    self.RealCostCoreCount = 0  ---素材上限
    self.filter = 0   ---开发素材筛选条件 同星级
    self.RoleCore = {}   ---被装备核心列表
    self.SingleChooseCoreList = {}
    ---当前选择核心
    ---@type CoreData
    self.CurCore = RoleCardViewModel.CurrentCore
    ---预览等级
    self.PreviewLv = self.CurCore.level + 1
    ---是否批量选择
    self.isCoreSelect = true
    ---素材经验
    self.SourceExp = 0
    ---基础经验
    self.CostExp = 0
    ---消耗金币
    self.CostMoney = 0
    ---背包核心列表
    ---@type CoreData[]
    self.CostCore = {}
    ---素材列表
    ---@type CoreData[]
    self.RealCostCore = {}
    ---当前弹窗选择的核心
    self.PopSelectCore = nil

    self.highest = 0
    self.basicproperties = nil
    self.strengtheningattribute = nil
    ---强化素材预制
    self.NeedPrefabIcon =
    {
        [1] = self.NeedPrefab1(),
        [2] = self.NeedPrefab2(),
        [3] = self.NeedPrefab3(),
        [4] = self.NeedPrefab4(),
        [5] = self.NeedPrefab5()
    }
    ---开发素材预制
    self.RebuildNeed =
    {
        [1] = self.RebuildNeedPrefab1(),
        [2] = self.RebuildNeedPrefab2(),
        [3] = self.RebuildNeedPrefab3()
    }
    ---初始化左侧按钮
    self:InitSwitch()
    ---获取背包核心
    self:GetCostCore()
    ---初始化按钮
    self:InitButton()
    ---初始化弹窗页面
    self:InitPopUpPanel()
    ---清除素材
    self:ClearRebuilditem()
    self:ClearUpitem()
end

---初始化强化预览
function M:InitPreviewPanel()

    self.GearUpgradePrefab().gameObject:SetActive(false)
    self.UpgradeSuccessPanel().gameObject:SetActive(false)
    self.SuccessInfoDataPrefab().gameObject:SetActive(false)
    self.GearInfoPanel().gameObject:SetActive(false)
    self.RebuildNeedPanel().gameObject:SetActive(false)
    self.RebuildPreviewPanel().gameObject:SetActive(false)
    self.PopupPanel().gameObject:SetActive(false)
    self.RebuildSuccessPanel().gameObject:SetActive(false)

    self.UpgradePreviewPanel().gameObject:SetActive(true)
    self.UpgradeNeedPanel().gameObject:SetActive(true)

    self.CurLvText().text ="+"..self.CurCore.level
    self.CostExp = 0
    self.PreviewLv = self.CurCore.level + 1
    self.PreviewLvText().text = "+"..self.PreviewLv
    self:GetCost(self.CurCore.level,self.PreviewLv)
    self.ExpText().text = "<color=#F3C036>"..self.CurCore.exp.."</color>/"..self.CostExp
    self.CostText().text = 0
    local fillValue = self.CurCore.exp/self.CostExp
    if fillValue >1 then
        self.ExpSlider().fillAmount = 1
    else
        self.ExpSlider().fillAmount =fillValue
    end
    self:InitUpdataInfo()
end
---更新强化属性预览
function M:UpdataDataPanel()
    Tools.ClearAllChild(self.GearUpgradeRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #self.CurCore.attrs do
        ---显示可用词条
        local GearInfo= GameObject.Instantiate(self.GearUpgradePrefab().gameObject,self.GearUpgradeRoot().transform)
        GearInfo:SetActive(true)
        local VoidGearIcon = GearInfo.transform:Find("BG/iconBg/VoidGearIcon"):GetComponent("Image")
        local TitleText = GearInfo.transform:Find("TitleText"):GetComponent("TextMeshProUGUI")
        local OriginDataText = GearInfo.transform:Find("OriginDataText"):GetComponent("TextMeshProUGUI")
        local CurDataText = GearInfo.transform:Find("CurDataText"):GetComponent("TextMeshProUGUI")
        local CurData = 0
        if self.PreviewLv == self.CurCore.level then
            CurData = self.CurCore.attrs[i].attribute
        else
            if self.CurCore.attrs[i].type == 0 then
                CurData = (tonumber(self.basicproperties[2]) + tonumber(self.strengtheningattribute[2])*self.PreviewLv)*self.highest[i]*0.0001
            else
                CurData = (tonumber(self.basicproperties[2]) + tonumber(self.strengtheningattribute[2])*self.PreviewLv)*(self.highest[i]*0.0001)*0.01
            end
        end
        local OriginData = self.CurCore.attrs[i].attribute
        ---属性图标
        MgrRes.LoadSprite(VoidGearIcon,"Attribute/GearInfoIcon_"..self.CurCore.attrs[i].attrID)
        ---属性值
        OriginDataText.text = (math.ceil(OriginData*10)*0.1)..(self.CurCore.attrs[i].type == 1 and "%" or "")
        CurDataText.text = (math.ceil(CurData*10)*0.1)..(self.CurCore.attrs[i].type == 1 and "%" or "")
        ---属性名称
        TitleText.text = self.CurCore.attrs[i].attrName
    end
end
---初始化开发预览
function M:InitRebuildPanel()
    self.UpgradeNeedPanel().gameObject:SetActive(false)
    self.UpgradePreviewPanel().gameObject:SetActive(false)
    self.UpgradeSuccessPanel().gameObject:SetActive(false)
    self.GearInfoPanel().gameObject:SetActive(false)
    self.PopupPanel().gameObject:SetActive(false)
    self.RebuildSuccessPanel().gameObject:SetActive(false)
    self.RebuildNeedPanel().gameObject:SetActive(true)
    self.RebuildPreviewPanel().gameObject:SetActive(true)
    self.Btu_Build().gameObject:SetActive(false)
    self.Btu_UnBuild().gameObject:SetActive(true)

    self.BulidText().text =math.ceil(self.CurCore.properties*100).."%"

    self.threshold = nil  ---炼制阈值
    self.promote = nil ---成长值
    self.grow = nil ---最高成长值
    self.consume = nil  ---消耗核心数量
    self.goldcost = nil  --- 金币消耗

    for i, v in pairs(CorerestructureLocalData.tab) do
        if self.CurCore.star == v[2] then
            self.threshold = v[3]*0.1
            self.promote = v[4]*0.1
            self.grow = v[5]*0.1
            self.consume = v[6]
            self.goldcost = JNStrTool.strSplit("_",v[7])[3]
        end
    end

    Tools.ClearAllChild(self.GearRebuildRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #self.CurCore.attrs do
        ---显示可用词条
        local GearInfo=GameObject.Instantiate(self.GearRebuildPrefab().gameObject,self.GearRebuildRoot().gameObject.transform,true)
        GearInfo:SetActive(true)
        local GearInfoMainIcon=CJNUIMgr.GetSunUseName(GearInfo,"VoidGearIcon")
        local OriginDataText=CJNUIMgr.GetSunUseName(GearInfo,"OriginDataText")
        local CurDataText=CJNUIMgr.GetSunUseName(GearInfo,"CurDataText")
        local GearInfoNameTxt=CJNUIMgr.GetSunUseName(GearInfo,"TitleText")
        ---属性图标
        MgrRes.LoadSprite(GearInfoMainIcon:GetComponent("Image"),"Attribute/GearInfoIcon_"..self.CurCore.attrs[i].attrID)
        ---属性值
        OriginDataText:GetComponent("TextMeshProUGUI").text = (math.ceil(self.CurCore.attrs[i].attribute*10)*0.1)..(self.CurCore.attrs[i].type == 1 and "%" or "")
        if self.CurCore.attrs[i].type == 1 then
            CurDataText:GetComponent("TextMeshProUGUI").text =(math.ceil(self.threshold *self.highest[i]*0.001)*0.1).."%"
        else
            CurDataText:GetComponent("TextMeshProUGUI").text =math.ceil(self.threshold *self.highest[i]*0.1)*0.1
        end
        ---属性名称
        GearInfoNameTxt:GetComponent("TextMeshProUGUI").text = self.CurCore.attrs[i].attrName
    end
    self.GearRebuildPrefab().gameObject:SetActive(false)
    self:InitRebuildNeedPanel()
    self:UpdataRebuildCostItem()
end
---初始化开发素材
function M:InitRebuildNeedPanel()
    self.RebuildNeedPrefab1().gameObject:SetActive(false)
    self.RebuildNeedPrefab2().gameObject:SetActive(false)
    self.RebuildNeedPrefab3().gameObject:SetActive(false)
    for i = 1, self.consume do
        self.RebuildNeed[i].gameObject:SetActive(true)
    end
end
---初始化强化阈值属性
function M:InitUpdataInfo()
    for i, v in pairs(ArmoredcoreLocalData.tab) do
        if i==self.CurCore.id  then
            self.highest =JNStrTool.strSplit(",",v[12])
            self.basicproperties = JNStrTool.strSplit("-",v[7])
            self.strengtheningattribute =  JNStrTool.strSplit("-",v[8])
            break
        end
    end
    self:UpdataDataPanel()
end
---初始化弹窗
function M:InitPopUpPanel()
    self.GearBagTypeToggle().gameObject:SetActive(false)
    ---设置核心背包简略LoopScroll回调
    self.GearBriefScroll01():SetLuaCellEvent(Handle(self,self.CellCore))
    ---设置核心背包详细LoopScroll回调
    self.GearDetailScroll01():SetLuaCellEvent(Handle(self,self.CellCore))
    ---显示类型
    local viewType = {
        [1] = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_brief"),
        [2] = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_full"),
    }
    local t_type = self:CreateFilterToggle(viewType,self.GearBagTypeToggle().gameObject,self.TypePanelRoot().gameObject.transform,Handle(self,function(self,type, offset)
        if self.CoreType == type then
            print("重复待处理1")
        end
        self.GearBriefScroll01().gameObject:SetActive(type == 1)
        self.GearDetailScroll01().gameObject:SetActive(type == 2)
        self.CoreType = type
        self:ResetCoreView(offset,true)
    end))
    ---默认显示简略_Brief
    t_type[1].isOn = true
end
---初始化核心详细信息
function M:InitGearInfoPanel()
    self.UpgradeNeedPanel().gameObject:SetActive(false)
    self.UpgradePreviewPanel().gameObject:SetActive(false)
    self.UpgradeSuccessPanel().gameObject:SetActive(false)
    self.PopupPanel().gameObject:SetActive(false)
    self.RebuildNeedPanel().gameObject:SetActive(false)
    self.RebuildPreviewPanel().gameObject:SetActive(false)
    self.RebuildSuccessPanel().gameObject:SetActive(false)
    
    self.GearInfoPanel().gameObject:SetActive(true)
    self.GearInfoPrefab().gameObject:SetActive(false)
    self.GearInfoStarPrefab().gameObject:SetActive(false)


    self:UpdataGearInfo()
end
---更新核心详情
function M:UpdataGearInfo()
    self.GearNamtText().text = self.CurCore.name
    self.GearInfoRankText().text ="+"..self.CurCore.level
    MgrRes.LoadSprite(self.RankKuangImg(),"Quality/RankKuang_"..self.CurCore.quality)
    MgrRes.LoadSprite(self.GearIconImg(),self.CurCore.icon)
    ---设置核心图标
    if self.CurCore.RoleId ~= 0 then
        self.Qicon().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.Qicon(),RoleCardViewModel.GetHeroByID(self.CurCore.RoleId).iconEquip)
        self.Btu_Jiechu().gameObject:SetActive(true)
    else
        self.Qicon().gameObject:SetActive(false)
        self.Btu_Jiechu().gameObject:SetActive(false)
    end
    Tools.ClearAllChild(self.GearInfoStarPanelRoot().gameObject)
    if self.CurCore.star > 0 then
        for i = 1, self.CurCore.star do
            local obj = GameObject.Instantiate(self.GearInfoStarPrefab().gameObject,self.GearInfoStarPanelRoot().gameObject.transform,false)
            obj:SetActive(true)
        end
    end
    Tools.ClearAllChild(self.GearInfoRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #self.CurCore.attrs do
        ---显示可用词条
        local GearInfo=GameObject.Instantiate(self.GearInfoPrefab().gameObject,self.GearInfoRoot().gameObject.transform,true)
        GearInfo:SetActive(true)
        local GearInfoMainIcon=CJNUIMgr.GetSunUseName(GearInfo,"VoidGearIcon")
        local GearInfoMainText=CJNUIMgr.GetSunUseName(GearInfo,"OriginDataText")
        local GearInfoNameTxt=CJNUIMgr.GetSunUseName(GearInfo,"TitleText")
        ---属性图标
        MgrRes.LoadSprite(GearInfoMainIcon:GetComponent("Image"),"Attribute/GearInfoIcon_"..self.CurCore.attrs[i].attrID)
        ---属性值
        GearInfoMainText:GetComponent("TextMeshProUGUI").text = (math.ceil(self.CurCore.attrs[i].attribute*10)*0.1)..(self.CurCore.attrs[i].type == 1 and "%" or "")
        ---属性名称
        GearInfoNameTxt:GetComponent("TextMeshProUGUI").text = self.CurCore.attrs[i].attrName
    end
end
---初始化左侧按钮
function M:InitSwitch()

    local toggles = {
        [1] = self.SwitchInfo(),
        [2] = self.SwitchUpdata(),
        [3] = self.SwitchDevelopment()
    }

    local Reload = {
        [1] = Handle(self, self.OnClickRoleInfoSwitch),
        [2] = Handle(self, self.OnClickRoleUpdataSwitch),
        [3] = Handle(self, self.OnClickRoleDevelopSwitch)
    }

    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Btn_Switch","Btn_SwitchHighLight")
        high:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self.OnLeftToggleClick(...,normal,high, Reload[idx])
        end,nil)
    end

    self.SwitchUpdata().isOn = true
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
---切换到属性界面
function M:OnClickRoleInfoSwitch()
    Event.Go("SetTitle",MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_details"),"CORE DETAILS")
    self.PanelIndex = 1
    self.SwichIndex = 1
    self.PopSelectCore = self.CurCore
    self.PopSelectCore.isSelect = true
    self:InitGearInfoPanel()
end
---切换到强化界面
function M:OnClickRoleUpdataSwitch()
    Event.Go("SetTitle",MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_enhancement"),"CORE ENHANCEMENT")
    ---初始化强化预览界面、
    self.PanelIndex = 0
    self.SwichIndex = 2
    self.RealCostCore = {}
    self.SingleChooseCoreList = {}
    self:ClearUpitem()
    self:InitPreviewPanel()
end
---切换到开发界面
function M:OnClickRoleDevelopSwitch()
    Event.Go("SetTitle",MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_development"),"CORE DEVELOPMENT")
    self.PanelIndex = 0
    self.SwichIndex = 3
    self.RealCostCore = {}
    self.SingleChooseCoreList = {}
    self:ClearRebuilditem()
    self:InitRebuildPanel()
end
---初始化按钮
function M:InitButton()
    self.Btu_Upgrade().gameObject:SetActive(false)
    self.Btu_UnUpgrade().gameObject:SetActive(true)
    ---自动添加素材
    UIEvent.LuaClick(self.Btu_AutoAdd().gameObject,Handle(self,function ()
        self:AutoAddSource()
    end))
    ---开发自动添加素材
    UIEvent.LuaClick(self.Btu_RebuildAutoAdd().gameObject,Handle(self,function ()
        self:RebuildAutoAddSource()
    end))
    ---强化
    UIEvent.LuaClick(self.Btu_Upgrade().gameObject,Handle(self,function ()
        self:UpArmorClick()
    end))
    ---开发
    UIEvent.LuaClick(self.Btu_Build().gameObject,Handle(self,function ()
        self:RebuildArmorClick()
    end))

    ---强化成功返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        self:ClearNeedSource()
        self:InitPreviewPanel()
        self:GetCostCore()
    end))
    ---开发成功返回
    UIEvent.LuaClick(self.Btn_Back01().gameObject,Handle(self,function ()
        self:ClearRebuildNeedSource()
        self:InitRebuildPanel()
        self:GetCostCore()
    end))

    ---返回
    UIEvent.LuaClick(self.Btn_Return().gameObject,Handle(self,function ()
        self.SingleChooseCoreList = {}
        for i, v in pairs(self.RealCostCore) do
            table.insert(self.SingleChooseCoreList,v)
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
    end))
    ---点背景返回
    UIEvent.LuaClick(self.Img_Bg().gameObject,Handle(self,function ()
        self.SingleChooseCoreList = {}
        for i, v in pairs(self.RealCostCore) do
            table.insert(self.SingleChooseCoreList,v)
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
    end))

    ---强化素材按钮
    for i, v in pairs(self.NeedPrefabIcon) do
        UIEvent.LuaClick(v.gameObject,Handle(self,function ()
            self.PanelIndex = 0    --- 页签标识
            self.filter = 0
            self.CurOperation = 1
            self.RealCostCoreCount = 5  ---素材上限
            ---是否批量选择
            self.isCoreSelect = true
            self.PopupPanel().gameObject:SetActive(true)
            self.SwitchPanel().gameObject:SetActive(false)
            self.Btu_Tihuan().gameObject:SetActive(false)
            self.Btn_Choose().gameObject:SetActive(true)
            self:ResetCoreView()
        end))
    end
    ---开发素材按钮
    for i, v in pairs(self.RebuildNeed) do
        UIEvent.LuaClick(v.gameObject,Handle(self,function ()
            self.PanelIndex = 0    --- 页签标识
            self.filter = 1
            self.RealCostCoreCount = self.consume ---素材上限
            self.CurOperation = 2
            ---是否批量选择
            self.isCoreSelect = true
            self.PopupPanel().gameObject:SetActive(true)
            self.SwitchPanel().gameObject:SetActive(false)
            self.Btu_Tihuan().gameObject:SetActive(false)
            self.Btn_Choose().gameObject:SetActive(true)
            self:ResetCoreView()
        end))
    end
    ---确认素材
    UIEvent.LuaClick(self.Btn_Choose().gameObject,Handle(self,function ()
        self:PopReturn()
    end))
    ---详情解除
    UIEvent.LuaClick(self.Btu_Jiechu().gameObject,Handle(self,function ()
        self:OnClickTakeOff()
    end))
    ---背包替换
    UIEvent.LuaClick(self.Btu_Tihuan().gameObject,Handle(self,function ()
        self.CurCore = self.PopSelectCore
        self:OnClickRoleInfoSwitch()
        self:UpdataGearInfo()
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
    end))

    ---核心阅览
    UIEvent.LuaClick(self.Btu_Hexinyuelan().gameObject,Handle(self,function ()
        if self.SwichIndex == 1 then
            self.PanelIndex = 1     --- 页签标识
            self.filter = 0
            self.CurOperation = 3
            self.CoreType = 1
            ---是否批量选择
            self.isCoreSelect = false
            self.Btu_Tihuan().gameObject:SetActive(true)
            self.Btn_Choose().gameObject:SetActive(false)
        elseif self.SwichIndex == 2 then
            self.PanelIndex = 0    --- 页签标识
            self.filter = 0
            self.CurOperation = 1
            self.RealCostCoreCount = 5  ---素材上限
            ---是否批量选择
            self.isCoreSelect = true
            self.Btu_Tihuan().gameObject:SetActive(false)
            self.Btn_Choose().gameObject:SetActive(true)
        elseif self.SwichIndex == 3 then
            self.PanelIndex = 0    --- 页签标识
            self.filter = 1
            self.RealCostCoreCount = self.consume ---素材上限
            self.CurOperation = 2
            ---是否批量选择
            self.isCoreSelect = true
            self.Btu_Tihuan().gameObject:SetActive(false)
            self.Btn_Choose().gameObject:SetActive(true)
        end
        self:ResetCoreView()
        self.PopupPanel().gameObject:SetActive(true)
        self.SwitchPanel().gameObject:SetActive(false)
    end))
end

function M:PopReturn()
    if self.PanelIndex == 1 then
        self.Btu_Tihuan().gameObject:SetActive(false)
        self.Btn_Choose().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
        self.SwitchPanel().gameObject:SetActive(true)
    else
        self.RealCostCore = {}
        self.RoleCore = {}
        for i, v in pairs(self.SingleChooseCoreList) do
            if v.RoleId ~= 0 then
                table.insert(self.RoleCore,v)
            end
            table.insert(self.RealCostCore,v)
        end
        self:ClearUpitem()
        self:ClearRebuilditem()
        if #self.RoleCore>0 then
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips2"),Handle(self,self.OnClickTakeOff),nil,2})
        else
            if self.CurOperation == 1 then
                self:UpdataCostItem()
                self:UpdataEXP()
            elseif self.CurOperation == 2 then
                self:UpdataRebuildCostItem()
            end
            self.SwitchPanel().gameObject:SetActive(true)
            self.PopupPanel().gameObject:SetActive(false)
        end
    end
end
---脱装备请求
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
                coreData:ReLoadCore(0,0)
                print(tab)
            else
                self.CurCore.RoleId = 0
                self.CurCore.slot = 0
                roleData = HeroControl.GetRoleDataByID(v.heroID)
                roleData:ReLoadCore(v.armorSolt,v.armorID)
                coreData = CoreControl.GetSingleCoreData(v.armorID)
                coreData:ReLoadCore(v.armorSolt,v.heroID)
                coreData.isSelect = false
                self.CurCore = coreData
                self.PreviewLv = self.CurCore.level + 1
            end
            CoreControl.GetCores()
            RoleCardViewModel.ReloadCacheRoleData()
        end
        if   self.SwichIndex == 2 then
                self:UpdataCostItem()
                self:UpdataEXP()
        elseif  self.SwichIndex == 3 then
                self:UpdataRebuildCostItem()
        elseif self.SwichIndex ==1 then
            self:UpdataGearInfo()
        end
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopupPanel().gameObject:SetActive(false)
        ---@type CoreData[]
        self.CostCore = {}
        self:GetCostCore()
    end
end
function M:OnClickTakeOff()
    print("脱下")
    local rolecores = {}
    local ArmorREQ = {}
    if self.PanelIndex == 1 then
        ArmorREQ =
        {
            data =
            {
                [1] = {
                    heroID = self.CurCore.RoleId,
                    armorID = 0,
                    armorSolt = self.CurCore.slot
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
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,2,nil,nil,Handle(self,self.ClientReDetailNTF))
end
----替换装备请求
function M:OnClickChange()
    print("交换")
    self.IsChoose = false
    local ArmorREQ =
    {
        data =  {
            [1] = {heroID = RoleCardViewModel.CurrentHero.id,
                   armorID = self.PopSelectCore.uid,
                   armorSolt = self.CurCore.slot}
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,2,nil,nil,Handle(self,self.ClientReDetailNTF))
end

---核心预制回调
function M:CellCore(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({ self.CurCoreList[idx], self})
end
---核心背包loopScroll刷新
function M:ResetCoreView(offset,isReset)
    ---获取核心数据
    self.CurCoreList = CoreControl.GetCores()
    local arr = {}
    if self.PanelIndex == 0 then
        for i, v in pairs(self.CurCoreList) do
            if v.uid ~= self.CurCore.uid then
                table.insert(arr,v)
            end
        end
        self.CurCoreList = arr
    end
    if self.filter == 1 then
        local array = {}
        for i, v in pairs(self.CurCoreList) do
            if v.star == self.CurCore.star then
                table.insert(array,v)
            end
        end
        self.CurCoreList = array
    end
    local GearScrolls = {
        [1] = self.GearBriefScroll01(),---简略核心滑块
        [2] = self.GearDetailScroll01(),---详细核心滑块
    }

    if self.SwichIndex == 2 then
        local sortgroup = {"star","level","RoleId"}
        Global.Sort(self.CurCoreList,sortgroup,false)
    elseif self.SwichIndex == 3 then
        local sortgroup = {"level","quality","RoleId"}
        Global.Sort(self.CurCoreList,sortgroup,false)
    end
    ---设置核心总数
    GearScrolls[self.CoreType].totalCount = #self.CurCoreList
    ---刷新滑块
    if offset then
        ---刷新offset位置
        GearScrolls[self.CoreType]:RefillCells(offset)
    else
        ---刷新数据不刷新位置
        GearScrolls[self.CoreType]:RefillCells(0)
    end
end
---创建标签
function M:CreateFilterToggle(filters,prefab,parentTrans,callback)
    local toggles = {}
    for idx, name in ipairs(filters) do
        local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
        togTrans.gameObject:SetActive(true)
        togTrans:GetComponent("UITemplate"):SetData({name,function(...)
            callback(idx,...)
        end})
        toggles[idx] = togTrans:GetComponent("Toggle")
    end
    return toggles
end
---初始化背包核心
function M:GetCostCore()
    ---@type CoreData[]
    local Corearr = CoreControl.GetCores()
    for i, v in pairs(Corearr) do
        if v.RoleId == 0 or v.RoleId == nil then
            self.CostCore[i] = v
        end
    end
end

---更新经验
function M:UpdataEXP()
    print(self.SourceExp)
    if  self.SourceExp <= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("rolegearupgrade_ui_tips1"),1},true)
    end
    local Lv = self:GetLevel(self.SourceExp + self.CurCore.exp)
    print(Lv)
    if Lv > 0 then
        self.PreviewLv =self.CurCore.level + Lv
    else
        self.PreviewLv = self.CurCore.level + 1
    end
    self.CostExp = 0
    self.CostMoney = 0
    self.PreviewLvText().text = "+"..self.PreviewLv
    self:GetCost(self.CurCore.level,self.PreviewLv)
    local exceedExp = (self.SourceExp + self.CurCore.exp) - self.CostExp
    local fillValue = 0
    if exceedExp > 0 then
        fillValue = 1
    else
        fillValue = (self.SourceExp + self.CurCore.exp)/self.CostExp
    end
    self.ExpText().text ="<color=#F3C036>" ..(self.SourceExp + self.CurCore.exp).."</color>".."/"..self.CostExp
    if fillValue >1 then
        self.ExpSlider().fillAmount = 1
    else
        self.ExpSlider().fillAmount =fillValue
    end
    self.CostText().text = self.CostMoney
    if self.SourceExp > 0 then
        self.Btu_Upgrade().gameObject:SetActive(true)
        self.Btu_UnUpgrade().gameObject:SetActive(false)
    else
        self.Btu_Upgrade().gameObject:SetActive(false)
        self.Btu_UnUpgrade().gameObject:SetActive(true)
    end
    self:UpdataDataPanel()
end
---根据经验覆盖强化等级
function M:GetLevel(exp)
    local lv = 0
    for i, v in pairs(self.CurCore.strengthenLevels)do
        if i> self.CurCore.level then
            if v <= exp then
                exp = exp - v
                lv = lv + 1
            end
        end
    end
    return lv
end
---获取经验金币消耗
function M:GetCost(nowLv,targetLv)
    if targetLv == nowLv then
        return
    end
    for i, v in pairs(self.CurCore.strengthenLevels) do
        if i == targetLv then
            self.CostExp =  self.CostExp + v
            break
        end
    end
    for i, v in pairs(self.CurCore.strengthenConsumes) do
        if i == targetLv then
            self.CostMoney =  self.CostMoney + v
            break
        end
    end
    self:GetCost(nowLv,targetLv - 1)
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

---自动添加素材
function M:AutoAddSource()
    self.RealCostCore = {}
    self.SingleChooseCoreList = {}
    for i, v in pairs(self.CostCore) do
        if #self.RealCostCore >= 5 then
            break
        end
        if v.uid ~= self.CurCore.uid then
            table.insert(self.RealCostCore,v)
            table.insert(self.SingleChooseCoreList,v)
        end
    end
    local sortgroup = {"star","level"}
    Global.Sort(self.RealCostCore,sortgroup,false)
    self:UpdataCostItem()
    self:UpdataEXP()
end
---开发自动添加素材
function M:RebuildAutoAddSource()
    self.RealCostCore = {}
    self.SingleChooseCoreList = {}
    for i, v in pairs(self.CostCore) do
        if #self.RealCostCore >= self.consume then
            break
        end
        if v.star == self.CurCore.star and v.uid ~= self.CurCore.uid then
            table.insert(self.RealCostCore,v)
            table.insert(self.SingleChooseCoreList,v)
        end
    end
    local sortgroup = {"quality","level"}
    Global.Sort(self.RealCostCore,sortgroup,false)
    if  #self.RealCostCore  <= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("rolegearupgrade_ui_tips1"),1},true)
    end
    self:UpdataRebuildCostItem()
end
---更新开发素材
function M:UpdataRebuildCostItem()

    for i, v in pairs(self.RealCostCore) do
        local obj = self.RebuildNeed[i].transform:Find("icon/Item")
        obj.gameObject:SetActive(true)
        local icon = obj.transform:Find("icon"):GetComponent("Image")
        local GearStarPrefab = obj.transform:Find("GearStarPrefab")
        local StarPanelRoot = obj.transform:Find("StarPanelRoot")
        local RankText = obj.transform:Find("LvBG/RankText"):GetComponent("TextMeshProUGUI")
        self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarPrefab.gameObject)
        MgrRes.LoadSprite(icon,v.icon)
        RankText.text ="+"..v.level
    end

    if #self.RealCostCore > 0 then
        self.Btu_Build().gameObject:SetActive(true)
        self.Btu_UnBuild().gameObject:SetActive(false)
        self.RebuildCostText().text = self.goldcost
    else
        self.Btu_Build().gameObject:SetActive(false)
        self.Btu_UnBuild().gameObject:SetActive(true)
        self.RebuildCostText().text = 0
    end
end
---更新强化素材
function M:UpdataCostItem()
    self.SourceExp = 0
    for i, v in pairs(self.RealCostCore) do
        local obj = self.NeedPrefabIcon[i].transform:Find("icon/Item")
        obj.gameObject:SetActive(true)
        local icon = obj.transform:Find("icon"):GetComponent("Image")
        local GearStarPrefab = obj.transform:Find("GearStarPrefab")
        local StarPanelRoot = obj.transform:Find("StarPanelRoot")
        local RankText = obj.transform:Find("LvBG/RankText"):GetComponent("TextMeshProUGUI")
        self:InitStarPanel(v.star,StarPanelRoot.gameObject,GearStarPrefab.gameObject)
        MgrRes.LoadSprite(icon,v.icon)
        RankText.text ="+"..v.level
        self.SourceExp = self.SourceExp + self:GetExpBySource(self.RealCostCore[i].star) + math.ceil(self.RealCostCore[i].exp*0.3)
    end
end

---单选弹窗按钮事件
function M:ReloadPuzzleBtn(curData)
    if self.PopSelectCore then
        self.PopSelectCore.isSelect = false
    end
    curData.isSelect = true
    self.PopSelectCore = curData
    print(self.PopSelectCore.name)
    self:ResetCoreView()
end

---清除强化素材
function M:ClearNeedSource()
    self.PreviewLv = self.CurCore.level + 1
    self.SourceExp = 0
    self.CostExp = 0
    self.CostMoney = 0
    ---@type CoreData[]
    self.CostCore = {}
    ---@type CoreData[]
    self.RealCostCore = {}
    self.SingleChooseCoreList = {}
end
---清除开发素材
function M:ClearRebuildNeedSource()
    ---@type CoreData[]
    self.CostCore = {}
    ---@type CoreData[]
    self.RealCostCore = {}
    self.SingleChooseCoreList = {}
end

---ACK回调
function M:ReceiveArmorACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorUpExpACK',buffer))
    print(tab.errNo)
end
---NTF回调
function M:ReceiveArmorNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorUpExpNTF',buffer))
    print(tab.expTime)
    if tab.expTime >18000 then
        self.SuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_supersuccess")
    elseif tab.expTime>10000 then
        self.SuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_greatsuccess")
    else
        self.SuccTitleText().text = MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_success")
    end

    self:SuccessReceive(tab.target)
    ---@type CoreData[]
    local goods = {}
    for i, v in pairs(tab.cost) do
        if v.goodsID ~= 100001 then
            goods[i] = v
        end
    end
    CoreControl.DeleteCore(goods)
    CoreControl.PushSingleCoreData(tab.target)
    self.SuccessCurLvText().text = self.CurCore.level
end
---@param target armors
function M:SuccessReceive(target)
    self.UpgradeSuccessPanel().gameObject:SetActive(true)
    Tools.ClearAllChild(self.SuccessInfoDataRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #self.CurCore.attrs do
        ---显示可用词条
        local GearInfo= GameObject.Instantiate(self.SuccessInfoDataPrefab().gameObject,self.SuccessInfoDataRoot().transform)
        GearInfo:SetActive(true)
        local VoidGearIcon = GearInfo.transform:Find("BG/iconBg/VoidGearIcon"):GetComponent("Image")
        local TitleText = GearInfo.transform:Find("TitleText"):GetComponent("TextMeshProUGUI")
        local OriginDataText = GearInfo.transform:Find("OriginDataText"):GetComponent("TextMeshProUGUI")
        local CurDataText = GearInfo.transform:Find("CurDataText"):GetComponent("TextMeshProUGUI")
        local CurData = 0
        local OriginData = 0
        if self.CurCore.attrs[i].type == 0 then
            CurData = target.armorProperties*0.0001*self.highest[i]
        else
            CurData = target.armorProperties*0.0001*self.highest[i]*0.01
        end
        OriginData = self.CurCore.attrs[i].attribute
        ---属性图标
        MgrRes.LoadSprite(VoidGearIcon,"Attribute/GearInfoIcon_"..self.CurCore.attrs[i].attrID)
        ---属性值
        OriginDataText.text = (math.ceil(OriginData*10)*0.1)..(self.CurCore.attrs[i].type == 1 and "%" or "")
        CurDataText.text =(math.ceil(CurData*10)*0.1) ..(self.CurCore.attrs[i].type == 1 and "%" or "")
        ---属性名称
        TitleText.text = self.CurCore.attrs[i].attrName
    end
    self:ClearUpitem()
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
        goodsType = self.CurCore.goods.goodsType,
        goodsID = self.CurCore.uid,
        goodsNum = self.CurCore.goods.goodsNum
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

---开发ACK回调
function M:RebuildArmorACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorExploitACK',buffer))
    if tab.errNo == 542 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips10"),1},true)
        return
    end
    print(tab.errNo)
end
---开发NTF回调
function M:RebuildArmorNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientArmorExploitNTF',buffer))

    self:RebuildSuccessReceive(tab.target)
    ---@type CoreData[]
    local goods = {}
    for i, v in pairs(tab.cost) do
        if v.goodsID ~= 100001 then
            goods[i] = v
        end
    end
    CoreControl.DeleteCore(goods)
    CoreControl.PushSingleCoreData(tab.target)
    self.SuccessCurBuildText().text = (self.CurCore.properties * 100).."%"
end
---开发成功界面s
function M:RebuildSuccessReceive(target)
    self.RebuildSuccessPanel().gameObject:SetActive(true)
    Tools.ClearAllChild(self.SuccessRebuildDataRoot().gameObject)
    ---设置基础属性词条
    for i = 1, #self.CurCore.attrs do
        ---显示可用词条
        local GearInfo= GameObject.Instantiate(self.SuccessRebuildDataPrefab().gameObject,self.SuccessRebuildDataRoot().transform)
        GearInfo:SetActive(true)
        local VoidGearIcon = GearInfo.transform:Find("BG/iconBg/VoidGearIcon"):GetComponent("Image")
        local TitleText = GearInfo.transform:Find("TitleText"):GetComponent("TextMeshProUGUI")
        local OriginDataText = GearInfo.transform:Find("OriginDataText"):GetComponent("TextMeshProUGUI")
        local CurDataText = GearInfo.transform:Find("CurDataText"):GetComponent("TextMeshProUGUI")
        local CurData = 0
        local OriginData = 0
        if self.CurCore.attrs[i].type == 0 then
            CurData = target.armorProperties*0.0001*self.highest[i]
        else
            CurData = target.armorProperties*0.0001*self.highest[i]*0.01
        end
        OriginData = self.CurCore.attrs[i].attribute
        ---属性图标
        MgrRes.LoadSprite(VoidGearIcon,"Attribute/GearInfoIcon_"..self.CurCore.attrs[i].attrID)
        ---属性值
        OriginDataText.text =(math.ceil(OriginData*10)*0.1)..(self.CurCore.attrs[i].type == 1 and "%" or "")
        CurDataText.text =(math.ceil(CurData*10)*0.1) ..(self.CurCore.attrs[i].type == 1 and "%" or "")
        ---属性名称
        TitleText.text = self.CurCore.attrs[i].attrName
    end
    self.SuccessRebuildDataPrefab().gameObject:SetActive(false)
    self:ClearRebuilditem()
end
---开发请求
function M:RebuildArmorClick()
    print("开发核心")
    local goods = {}
    for i, v in pairs(self.RealCostCore) do
        v.goods.goodsID = v.uid
        goods[i] = v.goods
    end
    local targetgood =
    {
        goodsType = self.CurCore.goods.goodsType,
        goodsID = self.CurCore.uid,
        goodsNum = self.CurCore.goods.goodsNum
    }
    local ArmorUPREQ  =
    {
        cost = goods,
        target = targetgood
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientArmorExploitREQ',ArmorUPREQ))
    ItemControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ARMOR_EXPLOIT_REQ,bytes,0,nil,Handle(self,self.RebuildArmorACK),Handle(self,self.RebuildArmorNTF))
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
        local array = {}
        for i, v in pairs(self.SingleChooseCoreList) do
            if v.uid ~= coredata.uid then
                table.insert(array,v)
            end
        end
        self.SingleChooseCoreList = array
    else
        table.insert(self.SingleChooseCoreList,coredata)
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
---清空素材栏
function M:ClearUpitem()
    for i, v in pairs(self.NeedPrefabIcon) do
        local obj = v.transform:Find("icon/Item")
        obj.gameObject:SetActive(false)
    end
end
function M:ClearRebuilditem()
    for i, v in pairs(self.RebuildNeed) do
        local obj = v.transform:Find("icon/Item")
        obj.gameObject:SetActive(false)
    end
end

return M