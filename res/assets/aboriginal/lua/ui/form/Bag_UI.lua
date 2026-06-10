-- Code Auto Create Begin
local M = Class('Bag_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Bag_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Bag_UI].prefab'
    self.Name = 'Form[Bag_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackGroundPanel','BackGroundPanel',2},{'UpperLeftBtnPanel','UpperLeftBtnPanel',2},{'Btn_GoBack','UpperLeftBtnPanel/Btn_GoBack',2},{'Btn_I','UpperLeftBtnPanel/Btn_I',2},{'LeftSwitchBagBtnPanel','LeftSwitchBagBtnPanel',2},{'SwitchItemBagToggle','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle',2},{'Toggle_Switch','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_Switch',2},{'weixuanzhongdi','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_Switch/weixuanzhongdi',2},{'Toggle_SwitchHigh','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_SwitchHigh',2},{'xuanzhongdi','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_SwitchHigh/xuanzhongdi',2},{'ItemRedDotIcon','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/ItemRedDotIcon',2},{'SwitchVoidGearBtnToggle','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle',2},{'Toggle_Switch01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_Switch',2},{'weixuanzhongdi01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_Switch/weixuanzhongdi',2},{'VoidNRedDotIcon','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_Switch/VoidNRedDotIcon',2},{'Toggle_SwitchHigh01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_SwitchHigh',2},{'xuanzhongdi01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_SwitchHigh/xuanzhongdi',2},{'VoidHRedDotIcon','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_SwitchHigh/VoidHRedDotIcon',2},{'suo','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/suo',2},{'Image','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/suo/Image',2},{'SwitchGearBtnToggle','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle',2},{'Toggle_Switch02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_Switch',2},{'weixuanzhongdi02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_Switch/weixuanzhongdi',2},{'Toggle_SwitchHigh02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_SwitchHigh',2},{'xuanzhongdi02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_SwitchHigh/xuanzhongdi',2},{'suo01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/suo',2},{'Image01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/suo/Image',2},{'GearCoreRedDotIcon','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/GearCoreRedDotIcon',2},{'SwitchGearPuzzleBtnToggle','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle',2},{'Toggle_Switch03','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_Switch',2},{'weixuanzhongdi03','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_Switch/weixuanzhongdi',2},{'PZNRedDotIcon','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_Switch/PZNRedDotIcon',2},{'Toggle_SwitchHigh03','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_SwitchHigh',2},{'xuanzhongdi03','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_SwitchHigh/xuanzhongdi',2},{'PZHRedDotIcon','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_SwitchHigh/PZHRedDotIcon',2},{'suo02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/suo',2},{'Image02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/suo/Image',2},{'ItemPanel','RightPanel/ItemPanel',2},{'xian1','RightPanel/ItemPanel/xian1',2},{'xian2','RightPanel/ItemPanel/xian2',2},{'qieyedi','RightPanel/ItemPanel/UpperFilterPanel/qieyedi',2},{'ItemFilterRoot','RightPanel/ItemPanel/UpperFilterPanel/ItemFilterRoot',2},{'ItemBagFilterToggle','RightPanel/ItemPanel/UpperFilterPanel/ItemFilterRoot/ItemBagFilterToggle',2},{'ItemContent','RightPanel/ItemPanel/ItemBagScroll/ItemContent',2},{'Scrollbar','RightPanel/ItemPanel/ItemBagScroll/Scrollbar',2},{'Handle','RightPanel/ItemPanel/ItemBagScroll/Scrollbar/Sliding Area/Handle',2},{'GearBagPanel','RightPanel/GearBagPanel',2},{'xian11','RightPanel/GearBagPanel/xian11',2},{'xian22','RightPanel/GearBagPanel/xian22',2},{'RightPanel','RightPanel/GearBagPanel/RightPanel',2},{'Btn_Recycle','RightPanel/GearBagPanel/RightPanel/BtnPanel/Btn_Recycle',2},{'Btn_GoGearInfo','RightPanel/GearBagPanel/RightPanel/BtnPanel/Btn_GoGearInfo',2},{'Btn_Add','RightPanel/GearBagPanel/RightPanel/BtnPanel/Btn_AddGearCount/Btn_Add',2},{'VFXMask','RightPanel/GearBagPanel/RightPanel/VFXMask',2},{'NewRoleGearPrefab','RightPanel/GearBagPanel/RightPanel/VFXMask/GearDetailScroll/NewRoleGearPrefab',2},{'GearDetailContent','RightPanel/GearBagPanel/RightPanel/VFXMask/GearDetailScroll/GearDetailContent',2},{'ScrollbarVertical','RightPanel/GearBagPanel/RightPanel/VFXMask/GearDetailScroll/ScrollbarVertical',2},{'Handle01','RightPanel/GearBagPanel/RightPanel/VFXMask/GearDetailScroll/ScrollbarVertical/Sliding Area/Handle',2},{'Img_Paixudi','RightPanel/GearBagPanel/RightPanel/GearSortPanel/Img_Paixudi',2},{'GearSortToggleGroup','RightPanel/GearBagPanel/RightPanel/GearSortPanel/GearSortToggleGroup',2},{'GearBagSortToggle','RightPanel/GearBagPanel/RightPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',2},{'FilterPanelPivot','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot',2},{'Mask','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Mask',2},{'GearFilterToggleGroup','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup',2},{'GearBagFilterToggle','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',2},{'Btn_GearFilter','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Btn_GearFilter',2},{'Shaixuanicon','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Btn_GearFilter/Shaixuanicon',2},{'GearPuzzlePanel','RightPanel/GearPuzzlePanel',2},{'Img_Xian2','RightPanel/GearPuzzlePanel/Img_Xian2',2},{'Img_Xian1','RightPanel/GearPuzzlePanel/Img_Xian1',2},{'Btn_AutoGearSynthesis','RightPanel/GearPuzzlePanel/Btn_AutoGearSynthesis',2},{'Btn_GearSynthesis','RightPanel/GearPuzzlePanel/Btn_GearSynthesis',2},{'Btn_GearSynthesisHighLight','RightPanel/GearPuzzlePanel/Btn_GearSynthesisHighLight',2},{'GearPuzzleRoot','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleRoot',2},{'ScrollbarVertical01','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/ScrollbarVertical',2},{'Handle02','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/ScrollbarVertical/Sliding Area/Handle',2},{'CorePuzzleItem','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/CorePuzzleItem',2},{'Nvfx','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/Nvfx',2},{'TiaoDai_1','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/Nvfx/TiaoDai_1',2},{'Rvfx','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/Rvfx',2},{'TiaoDai_101','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/Rvfx/TiaoDai_1',2},{'SRvfx','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/SRvfx',2},{'TiaoDai_102','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/SRvfx/TiaoDai_1',2},{'SSRvfx','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/SSRvfx',2},{'TiaoDai_103','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/SSRvfx/TiaoDai_1',2},{'SelectIconImg','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect/SelectIconImg',2},{'VoidGearPanel','RightPanel/VoidGearPanel',2},{'Img_Xian101','RightPanel/VoidGearPanel/Img_Xian1',2},{'Img_Xian201','RightPanel/VoidGearPanel/Img_Xian2',2},{'ScrollbarVertical02','RightPanel/VoidGearPanel/VoidGearScroll/Scrollbar Vertical',2},{'Handle03','RightPanel/VoidGearPanel/VoidGearScroll/Scrollbar Vertical/Sliding Area/Handle',2},{'Btn_FilterBtnEquipClose','RightPanel/VoidGearPanel/Btn_FilterBtnEquipClose',2},{'Img_Paixudi01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Img_Paixudi',2},{'Toggle_EquipSort_1','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1',2},{'EquipSort_1Normal','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1Normal',2},{'jiantou(hui)2','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1Normal/jiantou(hui)2',2},{'EquipSort_1HighLight','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight',2},{'H_Normal','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_Normal',2},{'kuang(dangqian)','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_Normal/kuang(dangqian)',2},{'jiantou(cheng)','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_Normal/jiantou(cheng)',2},{'H_HighLight','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_HighLight',2},{'kuang(dangqian)01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_HighLight/kuang(dangqian)',2},{'jiantou(cheng)01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_HighLight/jiantou(cheng)',2},{'Toggle_EquipSort_2','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2',2},{'EquipSort_2Normal','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2Normal',2},{'jiantou(hui)201','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2Normal/jiantou(hui)2',2},{'EquipSort_2HighLight','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight',2},{'H_Normal01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_Normal',2},{'kuang(dangqian)02','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_Normal/kuang(dangqian)',2},{'jiantou(cheng)02','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_Normal/jiantou(cheng)',2},{'H_HighLight01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_HighLight',2},{'kuang(dangqian)03','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_HighLight/kuang(dangqian)',2},{'jiantou(cheng)03','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_HighLight/jiantou(cheng)',2},{'EquipFilterPivot','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot',2},{'EquipFilterToggleGroup','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Mask/EquipFilterToggleGroup',2},{'Bg','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Mask/EquipFilterToggleGroup/Bg',2},{'GearBagFilterToggle01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Mask/EquipFilterToggleGroup/GearBagFilterToggle',2},{'Btn_EquipFilter','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Btn_EquipFilter',2},{'Shaixuanicon01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Btn_EquipFilter/Shaixuanicon',2},{'BagMask','BagMask',2},
        -- UITemplate 列表
        {'ItemBagFilterToggle01','RightPanel/ItemPanel/UpperFilterPanel/ItemFilterRoot/ItemBagFilterToggle',10},{'BagItem','RightPanel/ItemPanel/ItemBagScroll/BagItem',10},{'NewRoleGearPrefab01','RightPanel/GearBagPanel/RightPanel/VFXMask/GearDetailScroll/NewRoleGearPrefab',10},{'GearBagSortToggle01','RightPanel/GearBagPanel/RightPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',10},{'GearBagFilterToggle02','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',10},{'CorePuzzleItem01','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/CorePuzzleItem',10},{'VoidGearItem','RightPanel/VoidGearPanel/VoidGearScroll/VoidGearItem',10},{'GearBagFilterToggle03','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Mask/EquipFilterToggleGroup/GearBagFilterToggle',10},
        -- Toggle 列表
        {'SwitchItemBagToggle01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle',13},{'SwitchVoidGearBtnToggle01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle',13},{'SwitchGearBtnToggle01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle',13},{'SwitchGearPuzzleBtnToggle01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle',13},{'EmptyTog','LeftSwitchBagBtnPanel/EmptyTog',13},{'ItemBagFilterToggle02','RightPanel/ItemPanel/UpperFilterPanel/ItemFilterRoot/ItemBagFilterToggle',13},{'GearBagSortToggle02','RightPanel/GearBagPanel/RightPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',13},{'GearBagFilterToggle04','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',13},{'Btn_GearFilter01','RightPanel/GearBagPanel/RightPanel/FilterPanelPivot/Btn_GearFilter',13},{'Toggle_EquipSort_101','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1',13},{'EquipSort_1HighLight01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight',13},{'Toggle_EquipSort_201','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2',13},{'EquipSort_2HighLight01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight',13},{'GearBagFilterToggle05','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Mask/EquipFilterToggleGroup/GearBagFilterToggle',13},{'Btn_EquipFilter01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipFilterPivot/Btn_EquipFilter',13},
        -- RawImage 列表
        {'ItemBagScroll','RightPanel/ItemPanel/ItemBagScroll',15},{'GearDetailScroll','RightPanel/GearBagPanel/RightPanel/VFXMask/GearDetailScroll',15},{'GearPuzzleScroll','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll',15},{'GearPuzzleSelect','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll/GearPuzzleSelect',15},{'VoidGearScroll','RightPanel/VoidGearPanel/VoidGearScroll',15},{'VoidGearRoot','RightPanel/VoidGearPanel/VoidGearScroll/VoidGearRoot',15},
        -- LoopScrollRect 列表
        {'ItemBagScroll01','RightPanel/ItemPanel/ItemBagScroll',18},{'GearDetailScroll01','RightPanel/GearBagPanel/RightPanel/VFXMask/GearDetailScroll',18},{'GearPuzzleScroll01','RightPanel/GearPuzzlePanel/RoleCardMask/GearPuzzleScroll',18},{'VoidGearScroll01','RightPanel/VoidGearPanel/VoidGearScroll',18},
        -- TextMeshProUGUI 列表
        {'EnText','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_Switch/EnText',20},{'CNText','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_Switch/CNText',20},{'EnText01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_SwitchHigh/EnText',20},{'CNText01','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchItemBagToggle/Toggle_SwitchHigh/CNText',20},{'EnText02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_Switch/EnText',20},{'CNText02','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_Switch/CNText',20},{'EnText03','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_SwitchHigh/EnText',20},{'CNText03','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchVoidGearBtnToggle/Toggle_SwitchHigh/CNText',20},{'EnText04','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_Switch/EnText',20},{'CNText04','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_Switch/CNText',20},{'EnText05','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_SwitchHigh/EnText',20},{'CNText05','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearBtnToggle/Toggle_SwitchHigh/CNText',20},{'EnText06','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_Switch/EnText',20},{'CNText06','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_Switch/CNText',20},{'EnText07','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_SwitchHigh/EnText',20},{'CNText07','LeftSwitchBagBtnPanel/SwitchBagBtnRoot/SwitchGearPuzzleBtnToggle/Toggle_SwitchHigh/CNText',20},{'Btn_Txt','RightPanel/GearBagPanel/RightPanel/BtnPanel/Btn_Recycle/Btn_Txt',20},{'Text_Qianwangqianghua','RightPanel/GearBagPanel/RightPanel/BtnPanel/Btn_GoGearInfo/Text_Qianwangqianghua',20},{'Text_Kuochong','RightPanel/GearBagPanel/RightPanel/BtnPanel/Btn_AddGearCount/Btn_Add/Text_Kuochong',20},{'Text_GearCount','RightPanel/GearBagPanel/RightPanel/BtnPanel/Btn_AddGearCount/Text_GearCount',20},{'Txet_Pilianghecheng','RightPanel/GearPuzzlePanel/Btn_AutoGearSynthesis/Txet_Pilianghecheng',20},{'Txet_Hecheng2','RightPanel/GearPuzzlePanel/Btn_GearSynthesis/Txet_Hecheng2',20},{'Txet_Hecheng1','RightPanel/GearPuzzlePanel/Btn_GearSynthesisHighLight/Txet_Hecheng1',20},{'Btn_SortText','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1Normal/Btn_SortText',20},{'Btn_SortText01','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_Normal/Btn_SortText',20},{'Btn_SortText02','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_1/EquipSort_1HighLight/H_HighLight/Btn_SortText',20},{'Btn_SortText03','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2Normal/Btn_SortText',20},{'Btn_SortText04','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_Normal/Btn_SortText',20},{'Btn_SortText05','RightPanel/VoidGearPanel/UpperFilterBtnPanel/EquipSortGroup/Toggle_EquipSort_2/EquipSort_2HighLight/H_HighLight/Btn_SortText',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    --需要回收的核心列表
    self.RecycleList = {}
    --回收状态 (0：普通状态 1：回收状态)
    self.RecycleState = 0
    ---初始化点击事件
    self:InitClick()
    ---初始化道具背包
    self:InitItemBag()
    ---初始化机甲核心
    self:InitCoreBag()
    ---初始化机甲碎片
    self:InitCorePuzzleBag()
    ---初始化共鸣装备
    self:InitVoidGearBag()
    ---初始化左侧按钮
    self:InitSwitch()

    self:InitRapidRecovery()

    ---每日任务跳转判断
    if BagViewModel.BagPageID == BagViewModel.BagPageEnum.PageEquip then
        self.SwitchVoidGearBtnToggle01().isOn = true
    elseif BagViewModel.BagPageID == BagViewModel.BagPageEnum.PageCore then
        self.SwitchGearBtnToggle01().isOn = true
    elseif BagViewModel.BagPageID == BagViewModel.BagPageEnum.PageCacheCore then
        self.SwitchGearPuzzleBtnToggle01().isOn = true
    else
        self.SwitchItemBagToggle01().isOn = true
    end
    BagViewModel.BagPageID = BagViewModel.BagPageEnum.PageItem
    ---隐藏背包遮罩
    self.BagMask().gameObject:SetActive(false)
    Event.Clear("NoviceBagGear")
    Event.Add("NoviceBagGear",function ()
        self.SwitchVoidGearBtnToggle01().isOn = true
        NoviceViewModel.DoNext()
    end)
    Event.Clear("NoviceBagCore")
    Event.Add("NoviceBagCore",function ()
        self.SwitchGearBtnToggle01().isOn = true
        NoviceViewModel.DoNext()
    end)
    Event.Clear("NoviceBagPz")
    Event.Add("NoviceBagPz",function ()
        self.SwitchGearPuzzleBtnToggle01().isOn = true
        NoviceViewModel.DoNext()
    end)
    Event.Clear("NoviceBagHC")
    Event.Add("NoviceBagHC",function ()
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
            self:CoreChipSynthesisClick(self.CurCorePuzzleIdx,1)
            NoviceViewModel.GoCheck(20707)
        end)
    end)
    Event.Clear("NoviceCoreUp")
    Event.Add("NoviceCoreUp",function ()
        RoleCardViewModel.CurrentCore = BagViewModel.CurrentCore
        MgrUI.GoHide(UID.NewGearUpgrade_UI, function ()
            NoviceViewModel.DoNext()
        end)
    end)
    Event.Add("ReconnetSucc", Handle(self,self.ReconnetEvent))
    self:GetPvPData(1)

    ----跳转判断防止特效穿透
    --Event.Add("HideBagTabPage",function ()
    --    self.SwitchItemBagToggle01().gameObject:SetActive(false)
    --end)
    --
    --Event.Add("ShowBagTabPage",function ()
    --    self.SwitchItemBagToggle01().gameObject:SetActive(true)
    --end)
    Event.Clear("NoviceExBagGoBack")
    Event.Add("NoviceExBagGoBack",function ()
        self:ClearLastTabRedDot()
        BagViewModel.curSelectSwitch = 0
        BagViewModel.Close()
        NoviceViewModel.DoNext()
    end)
end

---获取天梯数据
function M:GetPvPData(type,isComplete)
    local tag = 0
    if isComplete then
        tag = 1
    else
        tag = 0
    end
    local BaseREQ  =
    {
        type = type
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHighLadderDataREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_DATA_REQ,bytes,tag,nil,Handle(self,self.GetPvPACK),Handle(self,self.GetPvPNTF))
end

---获取天梯数据返回
function M:GetPvPACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderDataACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatarviewmodel_tips1"),2},true)
    end
end

function M:GetPvPNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderDataNTF',buffer))
    PVPViewModel.HighCard = tab.card
end

function M:ReconnetEvent()
    self.BagMask().gameObject:SetActive(false)
end

function M:OnShowFinish()


end

---刷新
function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    BagViewModel.CurrentCore = nil
    ---获取缓存数据
    BagViewModel.ReloadCacheData()
    ---刷新界面
    if self.SwitchItemBagToggle01().isOn == true then
        self:ResetItemView(self.ItemSortType,0)
    elseif self.SwitchGearBtnToggle01().isOn == true then
        self:ResetCoreView()
    elseif self.SwitchGearPuzzleBtnToggle01().isOn == true then
        self:ResetCorePuzzleView()
    elseif self.SwitchVoidGearBtnToggle01().isOn == true then
        self:ResetVoidGearView()
    else
        ---默认显示道具背包
        self.SwitchItemBagToggle01().isOn = true
    end
end

function M:OnBackKey()
    --local isBtn_FilterBtnPanelClose = self.Btn_FilterBtnPanelClose().gameObject.activeSelf
    local isBtn_FilterBtnEquipClose = self.Btn_FilterBtnEquipClose().gameObject.activeSelf
    --local isRapidRecoveryPanel = self.RapidRecoveryPanel().gameObject.activeSelf
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        if isBtn_FilterBtnEquipClose then
            self.Btn_EquipFilter01().isOn = false
            self.Btn_FilterBtnEquipClose().gameObject:SetActive(false)
            local y = false and -236 or 300
            Global.DoMoveY(self.EquipFilterToggleGroup().gameObject,y,0.3)
            return
        end

        --if isBtn_FilterBtnPanelClose then
        --    self.Btn_GearFilter01().isOn = false
        --    self.Btn_FilterBtnPanelClose().gameObject:SetActive(false)
        --    local y = false and -268.5 or 268.5
        --    Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
        --    local VMask =  self.VFXMask().gameObject:GetComponent("SpriteMask")
        --    VMask.enabled = not false
        --    return
        --end

        --if isRapidRecoveryPanel then
        --    self.VFXMask().transform:GetComponent("SpriteMask").enabled = true
        --    self.RapidRecoveryPanel().gameObject:SetActive(false)
        --    return
        --end
        MgrUI.GoBack()
    end
end

---关闭
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Remove("ReconnetSucc", Handle(self,self.ReconnetEvent))
    MgrTimer.Cancel("hechengVFX")
end
---点击事件
function M:InitClick()
    UIEvent.LuaClick(self.Btn_GoBack().gameObject,Handle(self,function ()
        --Event.Clear("ShowBagTabPage")
        --Event.Clear("HideBagTabPage")

        self:ClearLastTabRedDot()
        BagViewModel.curSelectSwitch = 0
        BagViewModel.Close()
    end))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(75)
    end))
    --UIEvent.LuaClick(self.UpgradeReturnBg().gameObject,Handle(self,function()
    --    self.VFXMask().transform:GetComponent("SpriteMask").enabled = true
    --    self.RapidRecoveryPanel().gameObject:SetActive(false)
    --end))
end
-----------------------------------------------左侧面板-------------------------------------------------------
---初始化左侧按钮
function M:InitSwitch()
    self.first = true
    ---当前道具背包筛选类型
    self.ItemSortType = 1
    local toggles = {
        [1] = self.SwitchItemBagToggle01(),
        [2] = self.SwitchGearBtnToggle01(),
        [3] = self.SwitchGearPuzzleBtnToggle01(),
        [4] = self.SwitchVoidGearBtnToggle01(),
    }
    local panels = {
        [1] = self.ItemPanel().gameObject,
        [2] = self.GearBagPanel().gameObject,
        [3] = self.GearPuzzlePanel().gameObject,
        [4] = self.VoidGearPanel().gameObject,
    }
    local ReloadBag = {
        [1] = function()
            BagViewModel.curSelectSwitch = BagViewModel.BagPageEnum.PageItem 
            BagViewModel.CurrentCore = nil
            if not self.first then
                self.CurCorePuzzleIdx = nil
                self.GearPuzzleSelect.localPosition = Vector3(0,10000,0)
                ---更新下方信息
                self:CheckPuzzleInfo()
            end
            self.first = false
            self:ResetItemView(self.ItemSortType,0)
            self:CheckRedDot() end, ---刷新道具背包
        [2] = function()
            BagViewModel.curSelectSwitch = BagViewModel.BagPageEnum.PageCore 
            --self:CoreSelectClick()
            BagViewModel.ClearCoreSelects()
            BagViewModel.CurrentCore = nil
            self.CurCorePuzzleIdx = nil
            self.GearPuzzleSelect.localPosition = Vector3(0,10000,0)
            ---更新下方信息
            self:CheckMachaCoreRot()
            self:CheckPuzzleInfo()
            self:ResetCoreView(0)
            self:CheckRedDot() end, ---刷新机甲核心
        [3] = function()
            BagViewModel.curSelectSwitch = BagViewModel.BagPageEnum.PageCacheCore 
            self:CheckCorePzRot()
            self:ResetCorePuzzleView(0)
            self:CheckRedDot()end, ---刷新机甲核心碎片
        [4] = function()
            BagViewModel.curSelectSwitch = BagViewModel.BagPageEnum.PageEquip 
            BagViewModel.CurrentCore = nil
            self.CurCorePuzzleIdx = nil
            self.GearPuzzleSelect.localPosition = Vector3(0,10000,0)
            ---更新下方信息
            self:CheckPuzzleInfo()
            self:ResetVoidGearView(0)
            self:CheckRedDot()end , ---刷新共鸣装备
    }
    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Toggle_Switch","Toggle_SwitchHigh")
        high:SetActive(false)
        panels[idx]:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            if idx == 2 then
                self.RecycleState = 0
                self:UpdateRecyclePanel()
            end
            self.OnLeftToggleClick(...,normal,high,panels[idx], ReloadBag[idx],self)
        end,nil)
    end
    self:CheckRedDot()
    if SysLockControl.CheckSysLock(1902) then
        self.SwitchGearPuzzleBtnToggle01().gameObject:SetActive(true)
        self.SwitchGearPuzzleBtnToggle01().transform:Find("suo").gameObject:SetActive(false)
    else
        self.SwitchGearPuzzleBtnToggle01().transform:Find("suo").gameObject:SetActive(true)
        UIEvent.LuaClick(self.SwitchGearPuzzleBtnToggle01().transform:Find("suo").gameObject,Handle(self,function()
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1902),1},true)
        end))
        --self.SwitchGearPuzzleBtnToggle01().gameObject:SetActive(false)
    end
    if SysLockControl.CheckSysLock(1903) then
        self.SwitchGearBtnToggle01().gameObject:SetActive(true)
        self.SwitchGearBtnToggle01().transform:Find("suo").gameObject:SetActive(false)
    else
        self.SwitchGearBtnToggle01().transform:Find("suo").gameObject:SetActive(true)
        UIEvent.LuaClick(self.SwitchGearBtnToggle01().transform:Find("suo").gameObject,Handle(self,function()
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1903),1},true)
        end))
        --self.SwitchGearBtnToggle01().gameObject:SetActive(false)
    end
    if SysLockControl.CheckSysLock(1904) then
        self.SwitchVoidGearBtnToggle01().gameObject:SetActive(true)
        self.SwitchVoidGearBtnToggle01().transform:Find("suo").gameObject:SetActive(false)
    else
        self.SwitchVoidGearBtnToggle01().transform:Find("suo").gameObject:SetActive(true)
        UIEvent.LuaClick(self.SwitchVoidGearBtnToggle01().transform:Find("suo").gameObject,Handle(self,function()
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1904),1},true)
        end))
        --self.SwitchVoidGearBtnToggle01().gameObject:SetActive(false)
    end
end

function M.GetHighObj(Obj,normalStr,highStr)
    return Obj.transform:Find(normalStr).gameObject, Obj.transform:Find(highStr).gameObject
end
function M.OnLeftToggleClick(isOn, normal, high, panel, initFun,self)
    self:ClearLastTabRedDot()

    normal:SetActive(not isOn)
    high:SetActive(isOn)
    panel:SetActive(isOn)
    if isOn then
        initFun()
    end
end

--清楚背包上一个查看的分页红点
function M:ClearLastTabRedDot()
    local index = BagViewModel.curSelectSwitch
    --如果是从核心碎片切换至其他页 就清楚核心碎片所有红点 
    if index == BagViewModel.BagPageEnum.PageCacheCore then
        for i, v in pairs(ItemControl.GetCoreChips()) do
            UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "CorePuzzle%s",v.id),v.id)
        end
        RedDotControl.GetDotData("CorePz"):SetState(false)
        self:CheckRedDot()
    end
    --如果是从共鸣装备切换至其他页 就清楚共鸣装备所有红点 
    if index == BagViewModel.BagPageEnum.PageEquip then
        for i, v in pairs(BagViewModel.GetHaveEquipData()) do
            --local voidArr = v:GetHeroVoidEquip()
            --for m, n in pairs(voidArr) do
                if v.lockState  then
                    UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "GearBag%s", v.equipID), v.equipID)
                end
            --end
        end
        RedDotControl.GetDotData("GearBag"):SetState(false)
        self:CheckRedDot()
    end

    --如果是从道具切换至其他页 就清楚道具所有红点 
    if index == BagViewModel.BagPageEnum.PageItem then
        for i, v in pairs(ItemControl.GetNotZeroItems(true)) do
            UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "BagItem%s",v.id),v.id)
        end
        RedDotControl.GetDotData("BagItem"):SetState(false)
        self:CheckRedDot()
    end

    --如果是从机甲核心切换至其他页 就清楚机甲核心所有红点 
    if index == BagViewModel.BagPageEnum.PageCore then
        for i, v in pairs(BagViewModel.GetCoreData(self.CoreFilter,self.CoreSort,self.CoreIsRise)) do
            UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "MechaCore%s",v.id),v.id)
        end
        RedDotControl.GetDotData("MechaCore"):SetState(false)
        self:CheckRedDot()
    end
end

--------------------------------------------道具背包-----------------------------------------------------------
---道具背包初始化
function M:InitItemBag()
    ---设置道具背包LoopScroll回调
    self.ItemBagScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    ---初始化道具背包筛选器
    self:InitItemFilter()
end
---初始化道具背包筛选器
function M:InitItemFilter()
    local filters = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_bag_type1"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_bag_type2"),
        [3] = MgrLanguageData.GetLanguageByKey("bag_ui_bag_type3"),
        [4] = MgrLanguageData.GetLanguageByKey("bag_ui_bag_type4"),
    }

    local tog =  self:CreateFilterToggle(filters,self.ItemBagFilterToggle().gameObject,self.ItemFilterRoot().gameObject.transform,Handle(self,self.ResetItemView))
    ---隐藏预制
    self.ItemBagFilterToggle().gameObject:SetActive(false)
    ---默认显示
    tog[1].isOn = false
    tog[1].isOn = true
end
---道具背包loopScroll回调
function M:CellItem(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({self.CurItemList[idx],self})
end
---道具loopScroll刷新
function M:ResetItemView(filterType, offset)
    self.ItemSortType = filterType
    ---道具数据
    self.CurItemList = BagViewModel.GetItemData(filterType - 1)
    ---设置总数
    self.ItemBagScroll01().totalCount = #self.CurItemList
    if offset then
        ---刷新offset位置
        self.ItemBagScroll01():RefillCells(offset)
    else
        ---刷新
        self.ItemBagScroll01():RefreshCells()
    end
end
--------------------------------------------机甲核心-------------------------------------------------
---初始化核心背包
function M:InitCoreBag()
    ---设置核心背包LoopScroll回调
    self.GearDetailScroll01():SetLuaCellEvent(Handle(self,self.CellCore))
    ---初始化批量选择器
    self:InitCoreSelect()
    ---初始化核心背包筛选器
    self:InitCoreFilter()
end
---核心预制回调
function M:CellCore(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({self.CurCoreList[idx], self,idx})
end
---初始化批量选择器
function M:InitCoreSelect()
    ---默认开启
    self.VFXMask().transform:GetComponent("SpriteMask").enabled = true
    ---默认关闭批量选择
    self.isCoreSelect = false
    ---当前选择的核心
    self.curCoreTemplate = nil
    ---开启核心批量回收按钮
    --UIEvent.LuaClick(self.Btn_Recycle().gameObject,Handle(self,self.CoreSelectClick))
    ---关闭核心批量回收按钮
    --UIEvent.LuaClick(self.Btn_RecycleCancel().gameObject,Handle(self,self.CoreSelectClick))--旧回收逻辑
    --UIEvent.LuaClick(self.Btn_RecycleCancel().gameObject,Handle(self,self.CancleRecycle))
    ---核心确定批量回收按钮
    --UIEvent.LuaClick(self.Btn_RecycleConfirm().gameObject,Handle(self,self.CoreDecomposeClick))--旧回收逻辑
    --UIEvent.LuaClick(self.Btn_RecycleConfirm().gameObject,Handle(self,self.EnsureRecycle))
    ---查看核心详情
    UIEvent.LuaClick(self.Btn_GoGearInfo().gameObject,function()
        if BagViewModel.CurrentCore == nil then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips1"),1},true)
        else
            RoleCardViewModel.CurrentCore = BagViewModel.CurrentCore
            MgrUI.GoHide(UID.NewGearUpgrade_UI)
        end
    end)
    ---扩展核心背包
     UIEvent.LuaClick(self.Btn_Add().gameObject,function()
        if PlayerControl.GetPlayerData().expand + 1 == #HxpositionLocalData.tab then
            ---已达上限
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips2"),1},true)
        else
            ---扩充核心背包
            local conf = BagViewModel.GetCoreBoxConf()
            if conf ~= nil then
                MgrUI.Pop(UID.ConsumePop_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips3"),conf[4],function(goods)
                    ---序列化
                    local bytes = assert(pb.encode('PBClient.ClientExpandREQ',{expand = PlayerControl.GetPlayerData().expand}))
                    ItemControl.AckError = true
                    TaskControl.AckError = true
                    ---发送拓展请求
                    MgrNet.SendReq(MID.CLIENT_EXPAND_REQ,bytes,0,function(err,msgId)
                        if not err then
                            Log.Error("发送拓展请求失败")
                            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips4"),err),1},true)
                        end
                    end,function(buffer,tag)
                        local tab = assert(pb.decode('PBClient.ClientExpandACK',buffer))
                        if tab.errNo == 0 then
                            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips5"),1},true)
                        else
                            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips6"),1},true)
                        end
                    end,function(buffer,tag)
                        local tab = assert(pb.decode('PBClient.ClientExpandNTF',buffer))
                        ---更新拓展次数
                        PlayerControl.PushExpand(tab.expand)
                        ---消耗物品
                        ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
                        ---更新统计
                        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
                        ---更新背包显示
                        self:ResetCoreView(0)
                    end)
                end},true)
            else
                Log.Error("获取扩充核心背包配置失败")
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips7"),1},true)
            end
        end
     end)
    -----设置批量计数器
    --self.Text_RecycleItemTitle().text = MgrLanguageData.GetLanguageByKey("bag_ui_corebag_disintegrate")
    --MgrRes.LoadSprite(self.Icon_RecycleItem(),"Item/"..BagViewModel.GetCoreSelectIcon())
    ---核心自动批量回收按钮
    --UIEvent.LuaClick(self.Btn_AutoRecycle().gameObject,Handle(self,self.ShowCoreAutoDecClick))
    UIEvent.LuaClick(self.Btn_Recycle().gameObject,function() --新回收功能修改
        if SysLockControl.CheckSysLock(1610) then
            -----隐藏特效
            --self.VFXMask().transform:GetComponent("SpriteMask").enabled = false
            ----self.RapidRecoveryPanel().gameObject:SetActive(true)
            --self.curCoreTemplate = nil
            --BagViewModel.CurrentCore = nil
            --self:EnableRecycleState()
            MgrUI.GoHide(UID.GearSalvage_UI)
        else
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ark_ui_tips4"),SysLockControl.GetSystemName(1006),SysLockControl.GetUnlockLevel(1006))})
        end
    end)

    --UIEvent.LuaClick(self.Btn_CloseAutoRecycle().gameObject,function()
    --    self.RapidRecoveryPanel().gameObject:SetActive(false)
    --end)
    ---初始化核心快速回收面板
    --self.Text_AutoRecycleTitle().text = MgrLanguageData.GetLanguageByKey("bag_ui_corebag_fastretrieve")
    ---确认回收按钮
    --UIEvent.LuaClick(self.Btn_AutoRecycleConfirm().gameObject,Handle(self,self.CoreAutoDecomposeClick))
    --self.Text_AutoRecycleConfirm().text = MgrLanguageData.GetLanguageByKey("bag_ui_corebag_retrieve")
    --self.Text_AutoRecycleResultTitle().text = MgrLanguageData.GetLanguageByKey("bag_ui_corebag_disintegrate")
    --MgrRes.LoadSprite(self.Icon_AutoRecycleResult(),"Item/"..BagViewModel.GetCoreSelectIcon())
    ---核心自动分解选项
    self.autoRecycleOptions = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_corequality_select1"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_corequality_select2"),
        [3] = MgrLanguageData.GetLanguageByKey("bag_ui_corequality_select3"),
        [4] = MgrLanguageData.GetLanguageByKey("bag_ui_corequality_select4"),
        [5] = MgrLanguageData.GetLanguageByKey("bag_ui_corequality_select5"),
        [6] = MgrLanguageData.GetLanguageByKey("bag_ui_corequality_select6"),
    }
    self.curOptionsIdx = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1,
    }
    self.curOptionsState = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
    }
    --self.autoOptionsObj = {
    --    --[1] = self.AutoRecycleOption_1().gameObject,
    --    --[2] = self.AutoRecycleOption_2().gameObject,
    --    [3] = self.AutoRecycleOption_3().gameObject,
    --    [4] = self.AutoRecycleOption_4().gameObject,
    --    [5] = self.AutoRecycleOption_5().gameObject,
    --    [6] = self.AutoRecycleOption_6().gameObject,
    --}
    --for i, obj in pairs(self.autoOptionsObj) do
    --    local highObj = obj.transform:Find("OptionHighLight").gameObject
    --    highObj:SetActive(self.curOptionsState[i])
    --    UIEvent.LuaClick(self.autoOptionsObj[i],function()
    --        self.curOptionsState[i] = not self.curOptionsState[i]
    --        highObj:SetActive(self.curOptionsState[i])
    --        self.Text_AutoRecycleResult().text = BagViewModel.ReckonAutoCoreAllCount(self.curOptionsState,self.curOptionsIdx)
    --    end)
    --    obj.transform:Find("Text_GearStar"):GetComponent("TextMeshProUGUI").text = i
    --    local gearRankText = obj.transform:Find("Text_GearRank"):GetComponent("TextMeshProUGUI")
    --    gearRankText.text = self.autoRecycleOptions[self.curOptionsIdx[i]]
    --    local nextObj = obj.transform:Find("Btn_Next").gameObject
    --    local previousObj = obj.transform:Find("Btn_Previous").gameObject
    --    local nextObjHigh = nextObj.transform:Find("HighLight").gameObject
    --    local previousObjHigh = previousObj.transform:Find("HighLight").gameObject
    --    local np_fun = function(idx)
    --        nextObjHigh:SetActive(idx < #self.autoRecycleOptions)
    --        previousObjHigh:SetActive(idx > 1)
    --        gearRankText.text = self.autoRecycleOptions[idx]
    --        ---自动批选奖励总数
    --        self.Text_AutoRecycleResult().text = BagViewModel.ReckonAutoCoreAllCount(self.curOptionsState,self.curOptionsIdx)
    --    end
    --    np_fun(self.curOptionsIdx[i])
    --    UIEvent.LuaClick(nextObj,function()
    --        local diff = self.curOptionsIdx[i] - 1
    --        self.curOptionsIdx[i] = diff < 1 and 1 or diff
    --        self.curOptionsState[i] = true
    --        highObj:SetActive(true)
    --        np_fun(self.curOptionsIdx[i])
    --    end)
    --    UIEvent.LuaClick(previousObj,function()
    --        local diff = self.curOptionsIdx[i] + 1
    --        self.curOptionsIdx[i] = diff > #self.autoRecycleOptions and #self.autoRecycleOptions or diff
    --        self.curOptionsState[i] = true
    --        highObj:SetActive(true)
    --        np_fun(self.curOptionsIdx[i])
    --    end)
    --end
    ---自动批选奖励总数
    --self.Text_AutoRecycleResult().text = 0
    ---设置批选器初始状态
    --self.CoreRecycleItemPanel().gameObject:SetActive(false)
    self.Btn_Recycle().gameObject:SetActive(true)
    self.Btn_GoGearInfo().gameObject:SetActive(true)
    --self.CoreReCycleBtnPanel().gameObject:SetActive(false)
end

---开启取消核心批量选择
function M:CoreSelectClick()
    --清除已选核心
    BagViewModel.CurrentCore = nil
    self.isCoreSelect = not self.isCoreSelect
    --self.Btn_Recycle().gameObject:SetActive(not self.isCoreSelect)
    self.Btn_GoGearInfo().gameObject:SetActive(not self.isCoreSelect)
    --self.CoreReCycleBtnPanel().gameObject:SetActive(self.isCoreSelect)

    ---为取消批选时移除已选项
    if not self.isCoreSelect then
        -----关闭核心计数器
        --self.CoreRecycleItemPanel().gameObject:SetActive(false)
        ---移除已选数据
        BagViewModel.ClearCoreSelects()
        ---刷新
        self:ResetCoreView()
    else
        if BagViewModel.CurrentCore ~= nil and CoreControl.GetCoreLock(BagViewModel.CurrentCore.uid) ~= 1 then
            BagViewModel.SetCoreSelects(BagViewModel.CurrentCore,true)
        end
        ---刷新
        self:ResetCoreView()
    end

end
---核心确定批量分解按钮
function M:CoreDecomposeClick()
    ---发送请求
    BagViewModel.SendCoreDecompose(BagViewModel.CacheCoreSelects,function()
        self:ResetCoreView(0)
    end)
    ---关闭核心批选器
    self:CoreSelectClick()
end
---核心自动分解窗口开关事件
function M:ShowCoreAutoDecClick()
    self.curOptionsIdx = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1,
    }
    self.curOptionsState = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
    }
    -----设置批选器初始状态
    --self.Text_AutoRecycleResult().text = 0
    --for i, obj in pairs(self.autoOptionsObj) do
    --    local highObj = obj.transform:Find("OptionHighLight").gameObject
    --    highObj:SetActive(self.curOptionsState[i])
    --    obj.transform:Find("Text_GearStar"):GetComponent("TextMeshProUGUI").text = i
    --    local gearRankText = obj.transform:Find("Text_GearRank"):GetComponent("TextMeshProUGUI")
    --    gearRankText.text = self.autoRecycleOptions[self.curOptionsIdx[i]]
    --    local nextObj = obj.transform:Find("Btn_Next").gameObject
    --    local previousObj = obj.transform:Find("Btn_Previous").gameObject
    --    local nextObjHigh = nextObj.transform:Find("HighLight").gameObject
    --    local previousObjHigh = previousObj.transform:Find("HighLight").gameObject
    --    local np_fun = function(idx)
    --        nextObjHigh:SetActive(idx < #self.autoRecycleOptions)
    --        previousObjHigh:SetActive(idx > 1)
    --        gearRankText.text = self.autoRecycleOptions[idx]
    --    end
    --    np_fun(self.curOptionsIdx[i])
    --end
    --local autoObj = self.RapidRecoveryPanel().gameObject
    --autoObj:SetActive(not autoObj.activeSelf)
end
---核心自动分解按钮
function M:CoreAutoDecomposeClick()
    ---发送请求
    BagViewModel.SendAutoCoreDecompose(self.curOptionsState,self.curOptionsIdx,function()
        self:ResetCoreView(0)
    end)
    ---关闭自动分解窗口
    self:ShowCoreAutoDecClick()
    ---关闭核心批选器
    self:CoreSelectClick()
end
---核心背包筛选器
function M:InitCoreFilter()
    ---排序器
    local sorts = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_core_level"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_starlevel"),
        [3] = MgrLanguageData.GetLanguageByKey("bag_ui_core_get"),
    }
    local BagSortTogs = self:CreateFilterToggle(sorts,self.GearBagSortToggle().gameObject,self.GearSortToggleGroup().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
        self.CoreSort = sort
        self.CoreIsRise = isRise
        self:ResetCoreView(offset)
    end))
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
    ---筛选器动画
    Tools.ToggleValueChange(self.Btn_GearFilter01(),function(isOn)
        --self.Btn_FilterBtnPanelClose().gameObject:SetActive(isOn)
        local y = isOn and -306.5 or 306.5
        Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
        local VMask =  self.VFXMask().gameObject:GetComponent("SpriteMask")
        VMask.enabled = not isOn
    end,nil)
    ---隐藏预制
    self.GearBagSortToggle().gameObject:SetActive(false)
    self.GearBagFilterToggle().gameObject:SetActive(false)
    ---默认关闭筛选
    self.Btn_GearFilter01().isOn = false
    ---默认筛选显示全部
    self.CoreFilter = 0
    filterTogs[1].enabled = false
    filterTogs[1].isOn = false
    filterTogs[1].isOn = true
    filterTogs[1].enabled = true

    BagSortTogs[1].isOn = false
    BagSortTogs[1].isOn = true
end
---核心背包loopScroll刷新
function M:ResetCoreView(offset,isReset)
    ---获取核心数据
    self.CurCoreList = BagViewModel.GetCoreData(self.CoreFilter,self.CoreSort,self.CoreIsRise)
    self:UpdateCoreLockState()
    --回收状态只显示没有锁的核心
    if self.RecycleState == 1 then
        local tab = {}
        for i, v in ipairs(self.CurCoreList) do
            if v.isLocked == 0 and v.RoleId == 0 then--没有锁且没有装备角色
                table.insert(tab,v)
            end
        end
        self.CurCoreList = tab
    end

    ---刷新数量文本
    self.Text_GearCount().text = string.format("%s/%s",#self.CurCoreList,BagViewModel.GetCoreBoxConf()[3])
    ---设置核心总数
    self.GearDetailScroll01().totalCount = #self.CurCoreList
    ---刷新滑块
    if offset then
        ---刷新offset位置
        self.GearDetailScroll01():RefillCells(offset)
    else
        if self.GearDetailScroll01().itemTypeStart > #self.CurCoreList and self.GearDetailScroll01().itemTypeEnd > #self.CurCoreList then
            ---防止滑块刷新错误
            self.GearDetailScroll01():RefillCells(0)
        else
            ---刷新数据不刷新位置
            self.GearDetailScroll01():RefreshCells()
        end
    end
end

--更新核心锁状态
function M:UpdateCoreLockState()
    for i, v in ipairs(self.CurCoreList) do
        v.isLocked  = CoreControl.GetCoreLock(v.uid)
    end
end

--------------------------------------------核心碎片-------------------------------------------------
---初始化核心碎片背包
function M:InitCorePuzzleBag()
    ---当前选中的碎片索引
    self.CurCorePuzzleIdx = nil
   -- self.CheckRedDot = self:CheckRedDot()
    ---碎片选取节点
    self.GearPuzzleSelect = self.GearPuzzleSelect().transform
    ---碎片合成特效
    self.vfxArr = {
        [1] = self.Nvfx().gameObject,
        [2] = self.Rvfx().gameObject,
        [3] = self.SRvfx().gameObject,
        [4] = self.SSRvfx().gameObject,
    }
    ---碎片选中图标
    self.SelectIconImg = self.SelectIconImg().gameObject
    ---碎片选中特效
    self.selectVfxArr = {
        [1] = self.GearPuzzleSelect:Find("xuanzhong_N").gameObject,
        [2] = self.GearPuzzleSelect:Find("xuanzhong_R").gameObject,
        [3] = self.GearPuzzleSelect:Find("xuanzhong_SR").gameObject,
        [4] = self.GearPuzzleSelect:Find("xuanzhong_SSR").gameObject
    }
    ---默认隐藏特效
    for i = 1, 4 do
        self.vfxArr[i]:SetActive(false)
        self.selectVfxArr[i]:SetActive(false)
    end
    ---设置碎片背包loopScroll
    self.GearPuzzleScroll01():SetLuaCellEvent(Handle(self,self.CellCorePuzzle))
    ---设置碎片合成选项
    self.btn_puzzleArr = {
        self.Btn_GearSynthesis().gameObject,
        self.Btn_GearSynthesisHighLight().gameObject,
    }
    ---设置碎片合成按钮
    UIEvent.LuaClick(self.Btn_GearSynthesisHighLight().gameObject,function()
        self:CoreChipSynthesisClick(self.CurCorePuzzleIdx,1)
    end)
    ---设置碎片批量合成按钮
    UIEvent.LuaClick(self.Btn_AutoGearSynthesis().gameObject,function()
        if BagViewModel.GetCoreBoxConf()[3] == BagViewModel.GetCoreListCount() then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_core_tips1"),1},true)
            return
        end
        if self.CurCorePuzzleIdx == nil then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_core_tips2"),1},true)
            return
        end
        local data = self.CurCorePuzzleList[self.CurCorePuzzleIdx]
        if data == nil then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_core_tips2"),1},true)
            return
        end
        MgrUI.Pop(UID.CoreChipGroupPop_UI,{data,BagViewModel.GetCoreBoxConf()[3] - BagViewModel.GetCoreListCount(),function(num)
            self:CoreChipSynthesisClick(self.CurCorePuzzleIdx,num)
        end},true)
    end)
end
---碎片合成按钮事件
function M:CoreChipSynthesisClick(index,count)
    if index == nil then
        Log.Error("未选择碎片")
        return
    end
    local data = self.CurCorePuzzleList[index]
    if data == nil then
        Log.Error("未选择碎片")
        return
    end
    if BagViewModel.GetCoreBoxConf()[3] == BagViewModel.GetCoreListCount() then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_core_tips1"),1},true)
        return
    end
    if data.consumeCount * count > data.count then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_core_tips3"),1},true)
        return
    end
    ---播放合成特效
    for i = 1, 4 do
        self.vfxArr[i]:SetActive(i == data.quality)
    end
    ---1.5秒后关闭特效
    MgrTimer.AddDelay("hechengVFX",1.5, function ()
        for i = 1, 4 do
            self.vfxArr[i]:SetActive(false)
        end
    end, nil)
    ---特效误差计时器
    self.VFXFunTime = MgrNet.GetServerTime()
    ---开启遮罩
    self.BagMask().gameObject:SetActive(true)
    ---发送请求
    ---@type goods
    local goods = {
        goodsID = data.id,
        goodsNum = data.consumeCount * count,
        goodsType = data.goodsType
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientArmorMakeREQ',{cost = goods}))
    ItemControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ARMOR_MAKE_REQ,bytes,0,function(err,msgId)
        if not err then
            Log.Error("合成消息发送失败")
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),err),1},true)
            ---网络异常处理
            ---关闭遮罩
            self.BagMask().gameObject:SetActive(false)
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientArmorMakeACK',buffer))
        print("碎片合成ACK:"..serpent.block(tab)) ---查看table内容
        if tab.errNo == 0 then
        else
            ---失败处理逻辑
            MgrUI.Pop(UID.PopTip_UI,{(MgrLanguageData.GetLanguageByKey("arkviewmodel_composefail")),1},true)
            ---关闭遮罩
            self.BagMask().gameObject:SetActive(false)
        end
    end ,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientArmorMakeNTF',buffer))

        ---更新统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---添加数据逻辑
        ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
        CoreControl.PushGroupCoreData(tab.armor)                                ---核心添加
        BagViewModel.ReloadCacheData()                                          ---刷新缓存
        self:CheckCorePzRot()
        self:CheckRedDot()
        ---计算特效时间误差，1.5秒内完美衔接，超过1.5秒另作处理
        MgrSound.PlayEffect("yx_ui_suipianhecheng_01",1,nil,false)
        --local diffTime = 1.5 - MgrNet.GetServerTime() + self.VFXFunTime
        --diffTime = diffTime < 0.1 and 0.1 or diffTime
        self:ResetCorePuzzleView()                                          ---刷新核心碎片背包
        if self.CurCorePuzzleIdx == nil then
            self.GearPuzzleSelect.localPosition = Vector3(0,10000,0)
        end
        ---关闭遮罩
        self.BagMask().gameObject:SetActive(false)
        if #tab.armor > 1 then
            ---弹出多奖励窗口
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.armor},true)
        else
            ---弹出单奖励窗口
            MgrUI.Pop(UID.CoreChipSynPop_UI,{CoreControl.GetSingleCoreData(tab.armor[1].ID)},true)
        end
    end)
end
---核心碎片loop回调
function M:CellCorePuzzle(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({self.CurCorePuzzleList[idx],self})
end
---核心碎片loop刷新
function M:ResetCorePuzzleView(offset)
    print("3")
    ---获取核心碎片数据
    self.CurCorePuzzleList = BagViewModel.GetCorePuzzleData()
    ---设置总数
    self.GearPuzzleScroll01().totalCount = #self.CurCorePuzzleList
    if offset then
        ---刷新offset位置
        self.GearPuzzleScroll01():RefillCells(offset)
    else
        self.GearPuzzleScroll01():RefillCells(0)
    end
    ---更新下方信息
    self:CheckPuzzleInfo()
end
---检查碎片信息更新下方提示
function M:CheckPuzzleInfo()
    local data = nil
    if self.CurCorePuzzleIdx then
        data = self.CurCorePuzzleList[self.CurCorePuzzleIdx]
    end
    if data ~= nil then
        local isSelect = data.count>= data.consumeCount
        self.btn_puzzleArr[1]:SetActive(not isSelect)
        self.btn_puzzleArr[2]:SetActive(isSelect)
    else
        self.btn_puzzleArr[1]:SetActive(true)
        self.btn_puzzleArr[2]:SetActive(false)
    end
    if NoviceViewModel.CurTaskId == 24006 then
        NoviceViewModel.CurTaskId = NoviceViewModel.CurTaskId + 1
        MgrUI.Pop(UID.NoviceFrame_UI,{NoviceViewModel.CurTaskId},true)
    end
end
--------------------------------------共鸣装备---------------------------------------
---初始化共鸣装备
function M:InitVoidGearBag()
    ---初始化共鸣装备loop核心
    self.VoidGearScroll01():SetLuaCellEvent(Handle(self,self.CellVoidGear))
    ---初始化共鸣装备排序器
    self:InitVoidGearSort()
    ---初始化共鸣装备筛选器
    self:InitVoidGearFilter()
end
---共鸣装备loop回调
function M:CellVoidGear(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.CurEquipList[idx],self})
end
---共鸣装备刷新
function M:ResetVoidGearView(offset)
    print(4)
    self:CheckVoidRot()
    ---获取共鸣装备数据(从角色中获取)
    self.CurEquipList = BagViewModel.GetEquipData(self.EquipFilter,self.EquipSort,not self.EquipRise)
    ---设置装备总数
    self.VoidGearScroll01().totalCount = #self.CurEquipList
    ---刷新滑块
    if offset then
        ---刷新offset位置
        self.VoidGearScroll01():RefillCells(offset)
    else
        ---刷新数据不刷新位置
        self.VoidGearScroll01():RefillCells(0)
    end
end
---初始化共鸣装备排序器
function M:InitVoidGearSort()
    self.EquipSort = 1
    self.EquipRise = false
    self.EquipSort_1HighLight().gameObject:SetActive(false)
    --self.EquipSort_2HighLight().gameObject:SetActive(false)
    self.EquipSort_1HighLight().transform:Find("H_HighLight").gameObject:SetActive(false)
    --self.EquipSort_2HighLight().transform:Find("H_HighLight").gameObject:SetActive(false)

    Tools.ToggleValueChange(self.Toggle_EquipSort_101(),function(isOn)
        self.EquipSort = 1
        self.EquipSort_1Normal().gameObject:SetActive(not isOn)
        self.EquipSort_1HighLight().gameObject:SetActive(isOn)
        self.EquipRise = self.EquipSort_1HighLight01().isOn
        if isOn then
            self:ResetVoidGearView(0)
        end
    end,nil)

    Tools.ToggleValueChange(self.EquipSort_1HighLight01(),function(isOn)
        self.EquipRise = isOn
        self.EquipSort_1HighLight().transform:Find("H_Normal").gameObject:SetActive(not isOn)
        self.EquipSort_1HighLight().transform:Find("H_HighLight").gameObject:SetActive(isOn)
        if isOn then

        end
        self:ResetVoidGearView(0)
    end,nil)

    --Tools.ToggleValueChange(self.Toggle_EquipSort_201(),function(isOn)
    --    self.EquipSort = 2
    --    self.EquipSort_2Normal().gameObject:SetActive(not isOn)
    --    --self.EquipSort_2HighLight().gameObject:SetActive(isOn)
    --    self.EquipRise = self.EquipSort_2HighLight01().isOn
    --    if isOn then
    --        self:ResetVoidGearView(0)
    --    end
    --end,nil)

    --Tools.ToggleValueChange(self.EquipSort_2HighLight01(),function(isOn)
    --    self.EquipRise = isOn
    --    self.EquipSort_2HighLight().transform:Find("H_Normal").gameObject:SetActive(not isOn)
    --    self.EquipSort_2HighLight().transform:Find("H_HighLight").gameObject:SetActive(isOn)
    --    if isOn then
    --        self:ResetVoidGearView(0)
    --    end
    --end,nil)

    self.Toggle_EquipSort_101().isOn = false
    self.Toggle_EquipSort_101().isOn = true
    --self.Toggle_EquipSort_201().gameObject:SetActive(false)
end
---初始化共鸣装备筛选器
function M:InitVoidGearFilter()
    self.EquipFilter = 0
    ---筛选器
    local filters = {
        MgrLanguageData.GetLanguageByKey("bag_ui_character_type1"),
        MgrLanguageData.GetLanguageByKey("bag_ui_character_type2"),
        MgrLanguageData.GetLanguageByKey("coreattrdata_attack"),
        MgrLanguageData.GetLanguageByKey("bag_ui_character_type4"),
        MgrLanguageData.GetLanguageByKey("coreattrdata_support"),
        MgrLanguageData.GetLanguageByKey("ui_tongyong_text256"),
    }
    local filterTogs = self:CreateFilterToggle(filters,self.GearBagFilterToggle05().gameObject,self.EquipFilterToggleGroup().gameObject.transform,Handle(self,function(self,filter,isOn,offset)
        if isOn then
            self.EquipFilter = filter >= 6 and filter + 5 or filter - 1
            self:ResetVoidGearView(offset)
        end
    end))
    ---筛选器遮罩事件
    UIEvent.LuaClick(self.Btn_FilterBtnEquipClose().gameObject,function()
        self.Btn_EquipFilter01().isOn = false
    end)
    ---筛选器动画
    Tools.ToggleValueChange(self.Btn_EquipFilter01(),function(isOn)
        self.Btn_FilterBtnEquipClose().gameObject:SetActive(isOn)
        local y = isOn and -236 or 300
        Global.DoMoveY(self.EquipFilterToggleGroup().gameObject,y,0.3)
    end,nil)

    ---隐藏预制
    self.GearBagFilterToggle05().gameObject:SetActive(false)
    ---默认关闭筛选
    self.Btn_EquipFilter01().isOn = false
    ---默认显示全部
    filterTogs[1].enabled = false
    filterTogs[1].isOn = true
    filterTogs[1].enabled = true

    filterTogs[1].isOn = false
    filterTogs[1].isOn = true
end
------------------------------------背包通用方法--------------------------------------
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

---检查背包道具红点
function M:CheckBagItemRot()
    for i, v in pairs(ItemControl.GetNotZeroItems(true)) do
        local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "BagItem%s",v.id))
        if isNew == nil or isNew == "" then
            RedDotControl.GetDotData("BagItem"):SetState(true)
            return
        end
    end
    RedDotControl.GetDotData("BagItem"):SetState(false)
end

---检查机甲核心红点
function M:CheckMachaCoreRot()
    for i, v in pairs(BagViewModel.GetCoreData(self.CoreFilter,self.CoreSort,self.CoreIsRise)) do
        local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "MechaCore%s",v.id))
        if isNew == nil or isNew == "" then
            RedDotControl.GetDotData("MechaCore"):SetState(true)
            return
        end
    end
    RedDotControl.GetDotData("MechaCore"):SetState(false)
end

---检查共鸣装备红点
function M:CheckVoidRot()
    local equips = BagViewModel.GetHaveEquipData()
    for i, v in pairs(equips) do
    --for i, v in pairs(equips) do
        --local voidArr = v:GetHeroVoidEquip()
        --for m, n in pairs(voidArr) do
            if v.lockState then
                local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "GearBag%s",v.equipID))
                if isNew == nil or isNew == "" then
                    RedDotControl.GetDotData("GearBag"):SetState(true)
                    return
                end
            end
        --end
    end
    RedDotControl.GetDotData("GearBag"):SetState(false)
end
---检查核心碎片红点
function M:CheckCorePzRot()
    --旧的红点逻辑
    -- for i, v in pairs(ItemControl.GetCoreChips()) do
    --     if v.consumeCount <= v.count then
    --         RedDotControl.GetDotData("CorePz"):SetState(true)
    --         return
    --     end
    -- end
    -- RedDotControl.GetDotData("CorePz"):SetState(false)


    for i, v in pairs(ItemControl.GetCoreChips()) do
        local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "CorePuzzle%s",v.id))
        if isNew == nil or isNew == "" and v.count ~= 0 then
            RedDotControl.GetDotData("CorePz"):SetState(true)
            return
        end
    end
    RedDotControl.GetDotData("CorePz"):SetState(false)
end
---红点开关
function M:CheckRedDot()
    --原来的核心碎片红点逻辑
    -- if  RedDotControl.GetDotData("CorePz").State then
    --     self.PZNRedDotIcon().gameObject:SetActive(true)
    --     self.PZHRedDotIcon().gameObject:SetActive(true)
    -- else
    --     self.PZNRedDotIcon().gameObject:SetActive(false)
    --     self.PZHRedDotIcon().gameObject:SetActive(false)
    -- end
    --local isNew = self:CheckCorePzRot()
    if RedDotControl.GetDotData("CorePz").State then
        self.PZNRedDotIcon().gameObject:SetActive(true)
        self.PZHRedDotIcon().gameObject:SetActive(true)
    else
        self.PZNRedDotIcon().gameObject:SetActive(false)
        self.PZHRedDotIcon().gameObject:SetActive(false)
    end


    if  RedDotControl.GetDotData("GearBag").State and SysLockControl.CheckSysLock(1904) then
        self.VoidNRedDotIcon().gameObject:SetActive(true)
        self.VoidHRedDotIcon().gameObject:SetActive(true)
    else
        self.VoidNRedDotIcon().gameObject:SetActive(false)
        self.VoidHRedDotIcon().gameObject:SetActive(false)
    end

    if  RedDotControl.GetDotData("BagItem").State then
        self.ItemRedDotIcon().gameObject:SetActive(true)
        self.ItemRedDotIcon().gameObject:SetActive(true)
    else
        self.ItemRedDotIcon().gameObject:SetActive(false)
        self.ItemRedDotIcon().gameObject:SetActive(false)
    end

    if  RedDotControl.GetDotData("MechaCore").State then
        self.GearCoreRedDotIcon().gameObject:SetActive(true)
        --self.GearCoreRedDotIcon().gameObject:SetActive(true)
    else
        self.GearCoreRedDotIcon().gameObject:SetActive(false)
        --self.GearCoreRedDotIcon().gameObject:SetActive(false)
    end


end
function M:InitRapidRecovery()
    -----星级条件Tog
    --self.OptionsStarObj = {
    --    self.Tog_Star301(),
    --    self.Tog_Star401(),
    --    self.Tog_Star501(),
    --    self.Tog_Star601(),
    --}
    -----索引条件Tog
    --self.OptionsIndexObj = {
    --    self.Tog_Excellent01(),
    --    self.Tog_Excellent201(),
    --    self.Tog_Epic01(),
    --    self.Tog_Epic201(),
    --    self.Tog_Legend01(),
    --    --self.Tog_Legend201(),
    --}
    ---稀有度筛选
    self.curOptionsIdx = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        --[6] = 1,
    }
    ---星级筛选
    self.curOptionsState = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
    }

    -----星级筛选点击方法注册
    --for i,tog in pairs(self.OptionsStarObj) do
    --    Tools.ToggleValueChange(tog,function(isOn)
    --        tog.transform:Find("Normal").gameObject:SetActive(not isOn)
    --        tog.transform:Find("HighLight").gameObject:SetActive(isOn)
    --        self.curOptionsState[i + 2] = isOn
    --    end,nil)
    --    tog.isOn = true
    --    tog.isOn = false
    --end
    --for i,tog in pairs(self.OptionsIndexObj) do
    --    Tools.ToggleValueChange(tog,function(isOn)
    --        tog.transform:Find("Normal").gameObject:SetActive(not isOn)
    --        tog.transform:Find("HighLight").gameObject:SetActive(isOn)
    --        if isOn then
    --            self.curOptionsIdx[i] = i
    --        else
    --            self.curOptionsIdx[i] = 0
    --        end
    --    end,nil)
    --    tog.isOn = true
    --    tog.isOn = false
    --end
    --self.OptionsStarObj[1].isOn = false
    --self.OptionsStarObj[1].isOn = true
    --self.OptionsIndexObj[1].isOn = false
    --self.OptionsIndexObj[1].isOn = true
    ---点击快速回收
    --UIEvent.LuaClick(self.Btn_FastRecycle().gameObject,function()
    --    self.RapidRecoveryPanel().gameObject:SetActive(true)
    --    ---刷新获得货币数量
    --    self.Text_RapidRecoveryCount().text = ArkViewModel.ReckonAutoCoreAllCount(self.curOptionsState,self.curOptionsIdx)
    --end)
    ---点击关闭快速回收
    --UIEvent.LuaClick(self.UpgradeReturnBg().gameObject,function()
    --    self.RapidRecoveryPanel().gameObject:SetActive(false)
    --end)

    -----点击回收
    --UIEvent.LuaClick(self.Btn_Huishou().gameObject,function()
    --    ---发送请求
    --    ArkViewModel.SendAutoCoreDecompose(self.curOptionsState,self.curOptionsIdx,function()
    --        self:ResetCoreView(0)
    --    end)
    --    self.RapidRecoveryPanel().gameObject:SetActive(false)
    --end)
    -----默认不显示快速回收
    --self.RapidRecoveryPanel().gameObject:SetActive(false)
end

--新版回收
--核心进入回收状态
function M:EnableRecycleState()
    self.RecycleState = 1
    self:ResetCoreView(0)
    self:UpdateRecyclePanel()
end

--更新回收状态界面元素
function M:UpdateRecyclePanel()
    self.Btn_Recycle().gameObject:SetActive(self.RecycleState == 0)
    self.Btn_GoGearInfo().gameObject:SetActive(self.RecycleState == 0)
    self.Btn_Add().gameObject:SetActive(self.RecycleState == 0)
    self.Text_GearCount().gameObject:SetActive(self.RecycleState == 0)
    --self.CoreReCycleBtnPanel().gameObject:SetActive(self.RecycleState == 1)
    self.RecycleList = {}
end

--确认回收
function M:EnsureRecycle()
    local tab = {}
    for k, v in pairs(self.RecycleList) do
        table.insert(tab,v)
    end
    BagViewModel.SendCoreRecycle(tab,function()
        self:ResetCoreView(0)
        self.RecycleList = {}
    end)
end

--取消回收
function M:CancleRecycle()
    self.RecycleState = 0
    self:UpdateRecyclePanel()
    self:ResetCoreView(0)
end

return M