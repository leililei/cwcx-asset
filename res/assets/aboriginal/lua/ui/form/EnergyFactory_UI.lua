-- Code Auto Create Begin
local M = Class('EnergyFactory_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EnergyFactory_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EnergyFactory_UI].prefab'
    self.Name = 'Form[EnergyFactory_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Bg_EF','Img_Bg_EF',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'Text_EnergyFactoryTitle','UpperLeftPanel/Text_EnergyFactoryTitle',2},{'Text_CoreTitle','UpperLeftPanel/Text_CoreTitle',2},{'Hechen1','Hechen1',2},{'Hechen101','Hechen1',2},{'Tog_Synthesis','Hechen1/Content/Tog_Synthesis',2},{'Normal','Hechen1/Content/Tog_Synthesis/Normal',2},{'weixuanzhongdi','Hechen1/Content/Tog_Synthesis/Normal/weixuanzhongdi',2},{'Highlight','Hechen1/Content/Tog_Synthesis/Highlight',2},{'xuanzhongdi','Hechen1/Content/Tog_Synthesis/Highlight/xuanzhongdi',2},{'Tog_Intensify','Hechen1/Content/Tog_Intensify',2},{'Normal01','Hechen1/Content/Tog_Intensify/Normal',2},{'weixuanzhongdi01','Hechen1/Content/Tog_Intensify/Normal/weixuanzhongdi',2},{'Highlight01','Hechen1/Content/Tog_Intensify/Highlight',2},{'xuanzhongdi01','Hechen1/Content/Tog_Intensify/Highlight/xuanzhongdi',2},{'Tog_Recycle','Hechen1/Content/Tog_Recycle',2},{'Normal02','Hechen1/Content/Tog_Recycle/Normal',2},{'weixuanzhongdi02','Hechen1/Content/Tog_Recycle/Normal/weixuanzhongdi',2},{'Highlight02','Hechen1/Content/Tog_Recycle/Highlight',2},{'xuanzhongdi02','Hechen1/Content/Tog_Recycle/Highlight/xuanzhongdi',2},{'BottomPanel','Hechen1/BottomPanel',2},{'Img_Xiaohaohuobi','Hechen1/BottomPanel/Img_Xiaohaohuobi',2},{'Btn_Synthesis','Hechen1/BottomPanel/Btn_Synthesis',2},{'Img_Synthesis','Hechen1/BottomPanel/Btn_Synthesis/Img_Synthesis',2},{'Btn_UnSynthesis','Hechen1/BottomPanel/Btn_UnSynthesis',2},{'Img_Synthesis01','Hechen1/BottomPanel/Btn_UnSynthesis/Img_Synthesis',2},{'synthesisPanel','Hechen1/synthesisPanel',2},{'TobeSelectPanel','Hechen1/synthesisPanel/TobeSelectPanel',2},{'Img_Add','Hechen1/synthesisPanel/TobeSelectPanel/Img_Add',2},{'targetPanel','Hechen1/synthesisPanel/targetPanel',2},{'Img_Fengexian','Hechen1/synthesisPanel/targetPanel/Img_Fengexian',2},{'Img_Sanjiao','Hechen1/synthesisPanel/targetPanel/Img_Sanjiao',2},{'Hechengshudi','Hechen1/synthesisPanel/targetPanel/Hechengshudi',2},{'Btn_Min','Hechen1/synthesisPanel/targetPanel/Btn_Min',2},{'Btn_Sub','Hechen1/synthesisPanel/targetPanel/Btn_Sub',2},{'Img_Down','Hechen1/synthesisPanel/targetPanel/Btn_Sub/Img_Down',2},{'Btn_Max','Hechen1/synthesisPanel/targetPanel/Btn_Max',2},{'Btn_Add','Hechen1/synthesisPanel/targetPanel/Btn_Add',2},{'Img_Up','Hechen1/synthesisPanel/targetPanel/Btn_Add/Img_Up',2},{'Item','Hechen1/synthesisPanel/targetPanel/Item',2},{'Img_Frame','Hechen1/synthesisPanel/targetPanel/Item/Img_Frame',2},{'Img_XZjiaobiao','Hechen1/synthesisPanel/targetPanel/Item/Img_XZjiaobiao',2},{'Img_Icon','Hechen1/synthesisPanel/targetPanel/Item/Img_Icon',2},{'NeedItemPanel','Hechen1/synthesisPanel/NeedItemPanel',2},{'NeedItem1','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1',2},{'Item01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/Item',2},{'Img_Frame01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/Item/Img_Frame',2},{'Img_Icon01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/Item/Img_Icon',2},{'Img_Sucaishudi','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/Item/Img_Sucaishudi',2},{'NoneItem','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/NoneItem',2},{'Img_Daojukong','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/NoneItem/Img_Daojukong',2},{'Img_Sucaishudi01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/NoneItem/Img_Sucaishudi',2},{'NeedItem2','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2',2},{'Item02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/Item',2},{'Img_Frame02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/Item/Img_Frame',2},{'Img_Icon02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/Item/Img_Icon',2},{'Img_Sucaishudi02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/Item/Img_Sucaishudi',2},{'NoneItem01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/NoneItem',2},{'Img_Daojukong01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/NoneItem/Img_Daojukong',2},{'Img_Sucaishudi03','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/NoneItem/Img_Sucaishudi',2},{'NeedItem3','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3',2},{'Item03','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/Item',2},{'Img_Frame03','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/Item/Img_Frame',2},{'Img_Icon03','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/Item/Img_Icon',2},{'Img_Sucaishudi04','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/Item/Img_Sucaishudi',2},{'NoneItem02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/NoneItem',2},{'Img_Daojukong02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/NoneItem/Img_Daojukong',2},{'Img_Sucaishudi05','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/NoneItem/Img_Sucaishudi',2},{'Img_TitleXian1','Hechen1/synthesisPanel/Img_TitleXian1',2},{'Img_Add2','Hechen1/synthesisPanel/Img_Add2',2},{'Img_Add1','Hechen1/synthesisPanel/Img_Add1',2},{'Img_TitleXian2','Hechen1/synthesisPanel/Img_TitleXian2',2},{'Img_Xian1','Hechen1/synthesisPanel/Img_Xian1',2},{'Img_Xian2','Hechen1/synthesisPanel/Img_Xian2',2},{'Img_ShieldCoin','Hechen1/synthesisPanel/Currency/Panel_HomeCoin/Img_ShieldCoin',2},{'ShieldCoinIcon','Hechen1/synthesisPanel/Currency/Panel_HomeCoin/ShieldCoinIcon',2},{'Btn_AddShieldCoin','Hechen1/synthesisPanel/Currency/Panel_HomeCoin/Btn_AddShieldCoin',2},{'Img_AddShieldCoin','Hechen1/synthesisPanel/Currency/Panel_HomeCoin/Btn_AddShieldCoin/Img_AddShieldCoin',2},{'RecyclePanel','Hechen1/RecyclePanel',2},{'GearDetailContent','Hechen1/RecyclePanel/VFXMask/GearDetailScroll/GearDetailContent',2},{'ScrollbarVertical','Hechen1/RecyclePanel/VFXMask/GearDetailScroll/ScrollbarVertical',2},{'Handle','Hechen1/RecyclePanel/VFXMask/GearDetailScroll/ScrollbarVertical/Sliding Area/Handle',2},{'GearDetailItem','Hechen1/RecyclePanel/VFXMask/GearDetailScroll/GearDetailItem',2},{'Btn_FilterBtnPanelClose','Hechen1/RecyclePanel/Btn_FilterBtnPanelClose',2},{'RightTop','Hechen1/RecyclePanel/RightTop',2},{'CardSortPanel','Hechen1/RecyclePanel/RightTop/CardSortPanel',2},{'Tg_CardSort','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort',2},{'Normal03','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Normal',2},{'Icon_Rise','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Normal/Icon_Rise',2},{'Btn_HighLight','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight',2},{'Icon_RiseDown','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseDown',2},{'Icon_RiseUp','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseUp',2},{'Frame','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Frame',2},{'GearSortToggleGroup','Hechen1/RecyclePanel/RightTop/CardSortPanel/GearSortToggleGroup',2},{'GearBagSortToggle','Hechen1/RecyclePanel/RightTop/CardSortPanel/GearSortToggleGroup/GearBagSortToggle',2},{'FilterPanelPivot','Hechen1/RecyclePanel/RightTop/FilterPanelPivot',2},{'GearFilterToggleGroup','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Mask/GearFilterToggleGroup',2},{'Bg','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Mask/GearFilterToggleGroup/Bg',2},{'GearBagFilterToggle','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',2},{'Btn_GearFilter','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Btn_GearFilter',2},{'Shaixuanicon','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Btn_GearFilter/Shaixuanicon',2},{'SlidingArea','Hechen1/RecyclePanel/Sliding Area',2},{'Handle01','Hechen1/RecyclePanel/Sliding Area/Handle',2},{'Img_Xian101','Hechen1/RecyclePanel/Img_Xian1',2},{'Img_Xian201','Hechen1/RecyclePanel/Img_Xian2',2},{'RecycleBtnPanel','Hechen1/RecyclePanel/RecycleBtnPanel',2},{'Img_Huodehuobi','Hechen1/RecyclePanel/RecycleBtnPanel/Img_Huodehuobi',2},{'Btn_Recycle','Hechen1/RecyclePanel/RecycleBtnPanel/Btn_Recycle',2},{'Img_Recycle','Hechen1/RecyclePanel/RecycleBtnPanel/Btn_Recycle/Img_Recycle',2},{'Btn_FastRecycle','Hechen1/RecyclePanel/RecycleBtnPanel/Btn_FastRecycle',2},{'Img_FastRecycle','Hechen1/RecyclePanel/RecycleBtnPanel/Btn_FastRecycle/Img_FastRecycle',2},{'IntensifyBtnPanel','Hechen1/RecyclePanel/IntensifyBtnPanel',2},{'Btn_intensify','Hechen1/RecyclePanel/IntensifyBtnPanel/Btn_intensify',2},{'Img_Recycle01','Hechen1/RecyclePanel/IntensifyBtnPanel/Btn_intensify/Img_Recycle',2},{'Hechen2','Hechen2',2},{'Hechen201','Hechen2',2},{'Tog_SkillBook','Hechen2/Content/Tog_SkillBook',2},{'Normal04','Hechen2/Content/Tog_SkillBook/Normal',2},{'weixuanzhongdi03','Hechen2/Content/Tog_SkillBook/Normal/weixuanzhongdi',2},{'HighLight','Hechen2/Content/Tog_SkillBook/HighLight',2},{'xuanzhongdi03','Hechen2/Content/Tog_SkillBook/HighLight/xuanzhongdi',2},{'Tog_AwakeningMaterials','Hechen2/Content/Tog_AwakeningMaterials',2},{'Normal05','Hechen2/Content/Tog_AwakeningMaterials/Normal',2},{'weixuanzhongdi04','Hechen2/Content/Tog_AwakeningMaterials/Normal/weixuanzhongdi',2},{'HighLight01','Hechen2/Content/Tog_AwakeningMaterials/HighLight',2},{'xuanzhongdi04','Hechen2/Content/Tog_AwakeningMaterials/HighLight/xuanzhongdi',2},{'Tog_roleeq','Hechen2/Content/Tog_roleeq',2},{'Normal06','Hechen2/Content/Tog_roleeq/Normal',2},{'weixuanzhongdi05','Hechen2/Content/Tog_roleeq/Normal/weixuanzhongdi',2},{'HighLight02','Hechen2/Content/Tog_roleeq/HighLight',2},{'xuanzhongdi05','Hechen2/Content/Tog_roleeq/HighLight/xuanzhongdi',2},{'RightTop2','Hechen2/RightTop2',2},{'SynthesisSortPanel','Hechen2/RightTop2/SynthesisSortPanel',2},{'Tog_default1','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1',2},{'Normal07','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/Normal',2},{'Icon_Rise01','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/Normal/Icon_Rise',2},{'HighLight03','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/HighLight',2},{'Icon_RiseDown01','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/HighLight/Icon_RiseDown',2},{'Icon_RiseUp01','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/HighLight/Icon_RiseUp',2},{'Frame01','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/HighLight/Frame',2},{'Tog_default','Hechen2/RightTop2/SynthesisSortPanel/Tog_default',2},{'Btn_Filter','Hechen2/RightTop2/Btn_Filter',2},{'Img_Filtericon','Hechen2/RightTop2/Btn_Filter/Img_Filtericon',2},{'Btn_Kuaisuhecheng','Hechen2/Btn_Kuaisuhecheng',2},{'KuaisuhechengIcon','Hechen2/Btn_Kuaisuhecheng/KuaisuhechengIcon',2},{'Img_Changfengexian','Hechen2/Img_Changfengexian',2},{'SynthesisContent','Hechen2/VFXMask/SynthesisScroll/SynthesisContent',2},{'ScrollbarVertical01','Hechen2/VFXMask/SynthesisScroll/ScrollbarVertical',2},{'Handle02','Hechen2/VFXMask/SynthesisScroll/ScrollbarVertical/Sliding Area/Handle',2},{'SynthesisItem','Hechen2/VFXMask/SynthesisScroll/SynthesisItem',2},{'RapidRecoveryPanel','RapidRecoveryPanel',2},{'UpgradeReturnBg','RapidRecoveryPanel/UpgradeReturnBg',2},{'Img_Tanchuangdi','RapidRecoveryPanel/Img_Tanchuangdi',2},{'Img_Xian202','RapidRecoveryPanel/Img_Tanchuangdi/Img_Xian2',2},{'Img_Xian102','RapidRecoveryPanel/Img_Tanchuangdi/Img_Xian1',2},{'Img_Biaotixian','RapidRecoveryPanel/Img_Tanchuangdi/Text_Title/Img_Biaotixian',2},{'Img_TitleXian201','RapidRecoveryPanel/Text_Title2/Img_TitleXian2',2},{'Tog_Star3','RapidRecoveryPanel/XingjiPanel/Tog_Star3',2},{'Normal08','RapidRecoveryPanel/XingjiPanel/Tog_Star3/Normal',2},{'Img_Xing','RapidRecoveryPanel/XingjiPanel/Tog_Star3/Normal/Img_Xing',2},{'HighLight04','RapidRecoveryPanel/XingjiPanel/Tog_Star3/HighLight',2},{'Img_Xing01','RapidRecoveryPanel/XingjiPanel/Tog_Star3/HighLight/Img_Xing',2},{'Tog_Star4','RapidRecoveryPanel/XingjiPanel/Tog_Star4',2},{'Normal09','RapidRecoveryPanel/XingjiPanel/Tog_Star4/Normal',2},{'Img_Xing02','RapidRecoveryPanel/XingjiPanel/Tog_Star4/Normal/Img_Xing',2},{'HighLight05','RapidRecoveryPanel/XingjiPanel/Tog_Star4/HighLight',2},{'Img_Xing03','RapidRecoveryPanel/XingjiPanel/Tog_Star4/HighLight/Img_Xing',2},{'Tog_Star5','RapidRecoveryPanel/XingjiPanel/Tog_Star5',2},{'Normal10','RapidRecoveryPanel/XingjiPanel/Tog_Star5/Normal',2},{'Img_Xing04','RapidRecoveryPanel/XingjiPanel/Tog_Star5/Normal/Img_Xing',2},{'HighLight06','RapidRecoveryPanel/XingjiPanel/Tog_Star5/HighLight',2},{'Img_Xing05','RapidRecoveryPanel/XingjiPanel/Tog_Star5/HighLight/Img_Xing',2},{'Tog_Star6','RapidRecoveryPanel/XingjiPanel/Tog_Star6',2},{'Normal11','RapidRecoveryPanel/XingjiPanel/Tog_Star6/Normal',2},{'Img_Xing06','RapidRecoveryPanel/XingjiPanel/Tog_Star6/Normal/Img_Xing',2},{'HighLight07','RapidRecoveryPanel/XingjiPanel/Tog_Star6/HighLight',2},{'Img_Xing07','RapidRecoveryPanel/XingjiPanel/Tog_Star6/HighLight/Img_Xing',2},{'Img_TitleXian202','RapidRecoveryPanel/Text_Title3/Img_TitleXian2',2},{'Tog_Excellent','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent',2},{'Normal12','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent/Normal',2},{'HighLight08','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent/HighLight',2},{'Tog_Excellent2','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent2',2},{'Normal13','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent2/Normal',2},{'HighLight09','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent2/HighLight',2},{'Tog_Epic','RapidRecoveryPanel/XiyouduPanel/Tog_Epic',2},{'Normal14','RapidRecoveryPanel/XiyouduPanel/Tog_Epic/Normal',2},{'HighLight10','RapidRecoveryPanel/XiyouduPanel/Tog_Epic/HighLight',2},{'Tog_Epic2','RapidRecoveryPanel/XiyouduPanel/Tog_Epic2',2},{'Normal15','RapidRecoveryPanel/XiyouduPanel/Tog_Epic2/Normal',2},{'HighLight11','RapidRecoveryPanel/XiyouduPanel/Tog_Epic2/HighLight',2},{'Tog_Legend','RapidRecoveryPanel/XiyouduPanel/Tog_Legend',2},{'Normal16','RapidRecoveryPanel/XiyouduPanel/Tog_Legend/Normal',2},{'HighLight12','RapidRecoveryPanel/XiyouduPanel/Tog_Legend/HighLight',2},{'Tog_Legend2','RapidRecoveryPanel/XiyouduPanel/Tog_Legend2',2},{'Normal17','RapidRecoveryPanel/XiyouduPanel/Tog_Legend2/Normal',2},{'HighLight13','RapidRecoveryPanel/XiyouduPanel/Tog_Legend2/HighLight',2},{'Img_Icon04','RapidRecoveryPanel/Img_Icon',2},{'Btn_Huishou','RapidRecoveryPanel/Btn_Huishou',2},{'Img_Huishoudi','RapidRecoveryPanel/Btn_Huishou/Img_Huishoudi',2},{'Btn_UnHuishou','RapidRecoveryPanel/Btn_UnHuishou',2},{'Img_Huishoudi01','RapidRecoveryPanel/Btn_UnHuishou/Img_Huishoudi',2},{'ExchangePanel','ExchangePanel',2},{'QuickSynthesisMask','ExchangePanel/QuickSynthesisMask',2},{'Img_Tanchuangdi01','ExchangePanel/Img_Tanchuangdi',2},{'Img_xian1','ExchangePanel/Img_Tanchuangdi/Img_xian1',2},{'Img_xian2','ExchangePanel/Img_Tanchuangdi/Img_xian2',2},{'Img_Biaotixian01','ExchangePanel/Img_Tanchuangdi/Text_Title/Img_Biaotixian',2},{'Img_Xiaohaodi','ExchangePanel/Img_Tanchuangdi/XiaohaoPanel/Img_Xiaohaodi',2},{'XiaohaoScroll','ExchangePanel/Img_Tanchuangdi/XiaohaoPanel/XiaohaoScroll',2},{'xiaohaoItem','ExchangePanel/Img_Tanchuangdi/XiaohaoPanel/XiaohaoScroll/xiaohaoItem',2},{'Content','ExchangePanel/Img_Tanchuangdi/XiaohaoPanel/XiaohaoScroll/Content',2},{'Img_Jiantou','ExchangePanel/Img_Tanchuangdi/Img_Jiantou',2},{'MubiaoScroll','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll',2},{'MubiaoPrefab_1','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1',2},{'Img_Mubiaodi','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/Img_Mubiaodi',2},{'MubiaoItem','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/MubiaoItem',2},{'RewardRankImg','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/MubiaoItem/RewardRankImg',2},{'RewardIconImg','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/MubiaoItem/RewardIconImg',2},{'ItemName','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/ItemName',2},{'Img_Jiantou01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/Img_Jiantou',2},{'Btn_Gou','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/Btn_Gou',2},{'GouIcon','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/Btn_Gou/GouIcon',2},{'GouIconHui','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/Btn_Gou/GouIconHui',2},{'MubiaoPrefab_2','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2',2},{'Img_Mubiaodi01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/Img_Mubiaodi',2},{'MubiaoItem01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/MubiaoItem',2},{'RewardRankImg01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/MubiaoItem/RewardRankImg',2},{'RewardIconImg01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/MubiaoItem/RewardIconImg',2},{'ItemName01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/ItemName',2},{'Img_Jiantou02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/Img_Jiantou',2},{'Btn_Gou01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/Btn_Gou',2},{'GouIcon01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/Btn_Gou/GouIcon',2},{'GouIconHui01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/Btn_Gou/GouIconHui',2},{'MubiaoPrefab_3','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3',2},{'Img_Mubiaodi02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/Img_Mubiaodi',2},{'MubiaoItem02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/MubiaoItem',2},{'RewardRankImg02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/MubiaoItem/RewardRankImg',2},{'RewardIconImg02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/MubiaoItem/RewardIconImg',2},{'ItemName02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/ItemName',2},{'Img_Jiantou03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/Img_Jiantou',2},{'Btn_Gou02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/Btn_Gou',2},{'GouIcon02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/Btn_Gou/GouIcon',2},{'GouIconHui02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/Btn_Gou/GouIconHui',2},{'MubiaoPrefab_4','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4',2},{'Img_Mubiaodi03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/Img_Mubiaodi',2},{'MubiaoItem03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/MubiaoItem',2},{'RewardRankImg03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/MubiaoItem/RewardRankImg',2},{'RewardIconImg03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/MubiaoItem/RewardIconImg',2},{'ItemName03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/ItemName',2},{'Img_Jiantou04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/Img_Jiantou',2},{'Btn_Gou03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/Btn_Gou',2},{'GouIcon03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/Btn_Gou/GouIcon',2},{'GouIconHui03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/Btn_Gou/GouIconHui',2},{'Img_Mubiaodi04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/Img_Mubiaodi',2},{'MubiaoItem04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/MubiaoItem',2},{'RewardRankImg04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/MubiaoItem/RewardRankImg',2},{'RewardIconImg04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/MubiaoItem/RewardIconImg',2},{'ItemName04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/ItemName',2},{'Img_Jiantou05','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/Img_Jiantou',2},{'Btn_Gou04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/Btn_Gou',2},{'GouIcon04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/Btn_Gou/GouIcon',2},{'Img_Icon05','ExchangePanel/Img_Tanchuangdi/Img_Icon',2},{'Btn_Hecheng','ExchangePanel/Img_Tanchuangdi/Btn_Hecheng',2},{'Img_Huishoudi02','ExchangePanel/Img_Tanchuangdi/Btn_Hecheng/Img_Huishoudi',2},{'Btn_UnHecheng','ExchangePanel/Img_Tanchuangdi/Btn_UnHecheng',2},{'Img_Huishoudi03','ExchangePanel/Img_Tanchuangdi/Btn_UnHecheng/Img_Huishoudi',2},
        -- UITemplate 列表
        {'GearDetailItem01','Hechen1/RecyclePanel/VFXMask/GearDetailScroll/GearDetailItem',10},{'GearBagSortToggle01','Hechen1/RecyclePanel/RightTop/CardSortPanel/GearSortToggleGroup/GearBagSortToggle',10},{'GearBagFilterToggle01','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',10},{'Tog_default01','Hechen2/RightTop2/SynthesisSortPanel/Tog_default',10},{'SynthesisItem01','Hechen2/VFXMask/SynthesisScroll/SynthesisItem',10},{'xiaohaoItem01','ExchangePanel/Img_Tanchuangdi/XiaohaoPanel/XiaohaoScroll/xiaohaoItem',10},
        -- Toggle 列表
        {'Tog_Synthesis01','Hechen1/Content/Tog_Synthesis',13},{'Tog_Intensify01','Hechen1/Content/Tog_Intensify',13},{'Tog_Recycle01','Hechen1/Content/Tog_Recycle',13},{'Tg_CardSort01','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort',13},{'GearBagSortToggle02','Hechen1/RecyclePanel/RightTop/CardSortPanel/GearSortToggleGroup/GearBagSortToggle',13},{'GearBagFilterToggle02','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',13},{'Btn_GearFilter01','Hechen1/RecyclePanel/RightTop/FilterPanelPivot/Btn_GearFilter',13},{'Tog_SkillBook01','Hechen2/Content/Tog_SkillBook',13},{'Tog_AwakeningMaterials01','Hechen2/Content/Tog_AwakeningMaterials',13},{'Tog_roleeq01','Hechen2/Content/Tog_roleeq',13},{'Tog_default101','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1',13},{'Tog_default02','Hechen2/RightTop2/SynthesisSortPanel/Tog_default',13},{'Tog_Star301','RapidRecoveryPanel/XingjiPanel/Tog_Star3',13},{'Tog_Star401','RapidRecoveryPanel/XingjiPanel/Tog_Star4',13},{'Tog_Star501','RapidRecoveryPanel/XingjiPanel/Tog_Star5',13},{'Tog_Star601','RapidRecoveryPanel/XingjiPanel/Tog_Star6',13},{'Tog_Excellent01','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent',13},{'Tog_Excellent201','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent2',13},{'Tog_Epic01','RapidRecoveryPanel/XiyouduPanel/Tog_Epic',13},{'Tog_Epic201','RapidRecoveryPanel/XiyouduPanel/Tog_Epic2',13},{'Tog_Legend01','RapidRecoveryPanel/XiyouduPanel/Tog_Legend',13},{'Tog_Legend201','RapidRecoveryPanel/XiyouduPanel/Tog_Legend2',13},
        -- RawImage 列表
        {'GearDetailScroll','Hechen1/RecyclePanel/VFXMask/GearDetailScroll',15},{'SynthesisScroll','Hechen2/VFXMask/SynthesisScroll',15},
        -- LoopScrollRect 列表
        {'GearDetailScroll01','Hechen1/RecyclePanel/VFXMask/GearDetailScroll',18},{'SynthesisScroll01','Hechen2/VFXMask/SynthesisScroll',18},{'XiaohaoScroll01','ExchangePanel/Img_Tanchuangdi/XiaohaoPanel/XiaohaoScroll',18},{'MubiaoScroll01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','UpperLeftPanel/Text_EnergyFactoryTitle/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_EnergyFactoryTitle/Text_Title_EN',20},{'Text_Title_CN01','UpperLeftPanel/Text_CoreTitle/Text_Title_CN',20},{'Text_Title_EN01','UpperLeftPanel/Text_CoreTitle/Text_Title_EN',20},{'EnText','Hechen1/Content/Tog_Synthesis/Normal/EnText',20},{'CNText','Hechen1/Content/Tog_Synthesis/Normal/CNText',20},{'EnText01','Hechen1/Content/Tog_Synthesis/Highlight/EnText',20},{'CNText01','Hechen1/Content/Tog_Synthesis/Highlight/CNText',20},{'EnText02','Hechen1/Content/Tog_Intensify/Normal/EnText',20},{'CNText02','Hechen1/Content/Tog_Intensify/Normal/CNText',20},{'EnText03','Hechen1/Content/Tog_Intensify/Highlight/EnText',20},{'CNText03','Hechen1/Content/Tog_Intensify/Highlight/CNText',20},{'EnText04','Hechen1/Content/Tog_Recycle/Normal/EnText',20},{'CNText04','Hechen1/Content/Tog_Recycle/Normal/CNText',20},{'EnText05','Hechen1/Content/Tog_Recycle/Highlight/EnText',20},{'CNText05','Hechen1/Content/Tog_Recycle/Highlight/CNText',20},{'Text_Xiaohaoshu','Hechen1/BottomPanel/Text_Xiaohaoshu',20},{'Text_Xiaohao','Hechen1/BottomPanel/Text_Xiaohao',20},{'Text_Hecheng','Hechen1/BottomPanel/Btn_Synthesis/Text_Hecheng',20},{'Text_Hecheng01','Hechen1/BottomPanel/Btn_UnSynthesis/Text_Hecheng',20},{'Text_Xuanzemubiao','Hechen1/synthesisPanel/TobeSelectPanel/Text_Xuanzemubiao',20},{'Text_Hechengshu','Hechen1/synthesisPanel/targetPanel/Text_Hechengshu',20},{'Text_Min','Hechen1/synthesisPanel/targetPanel/Btn_Min/Text_Min',20},{'Text_Max','Hechen1/synthesisPanel/targetPanel/Btn_Max/Text_Max',20},{'Text_Sucaiming','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/Item/Text_Sucaiming',20},{'Text_Sucaishu','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/Item/Text_Sucaishu',20},{'Text_Sucaishu01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem1/NoneItem/Text_Sucaishu',20},{'Text_Sucaiming01','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/Item/Text_Sucaiming',20},{'Text_Sucaishu02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/Item/Text_Sucaishu',20},{'Text_Sucaishu03','Hechen1/synthesisPanel/NeedItemPanel/NeedItem2/NoneItem/Text_Sucaishu',20},{'Text_Sucaiming02','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/Item/Text_Sucaiming',20},{'Text_Sucaishu04','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/Item/Text_Sucaishu',20},{'Text_Sucaishu05','Hechen1/synthesisPanel/NeedItemPanel/NeedItem3/NoneItem/Text_Sucaishu',20},{'Text_Title1','Hechen1/synthesisPanel/Text_Title1',20},{'Text_Title2','Hechen1/synthesisPanel/Text_Title2',20},{'Text_ShieldCoinCount','Hechen1/synthesisPanel/Currency/Panel_HomeCoin/Text_ShieldCoinCount',20},{'Text_CN','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Normal/Text_CN',20},{'Text_CN01','Hechen1/RecyclePanel/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Text_CN',20},{'Text_Huodeshu','Hechen1/RecyclePanel/RecycleBtnPanel/Text_Huodeshu',20},{'Text_Huode','Hechen1/RecyclePanel/RecycleBtnPanel/Text_Huode',20},{'Text_Huishou','Hechen1/RecyclePanel/RecycleBtnPanel/Btn_Recycle/Text_Huishou',20},{'Text_Kuaisuhuishou','Hechen1/RecyclePanel/RecycleBtnPanel/Btn_FastRecycle/Text_Kuaisuhuishou',20},{'Text_Huishou01','Hechen1/RecyclePanel/IntensifyBtnPanel/Btn_intensify/Text_Huishou',20},{'CNText06','Hechen2/Content/Tog_SkillBook/Normal/CNText',20},{'CNText07','Hechen2/Content/Tog_SkillBook/HighLight/CNText',20},{'CNText08','Hechen2/Content/Tog_AwakeningMaterials/Normal/CNText',20},{'CNText09','Hechen2/Content/Tog_AwakeningMaterials/HighLight/CNText',20},{'CNText10','Hechen2/Content/Tog_roleeq/Normal/CNText',20},{'CNText11','Hechen2/Content/Tog_roleeq/HighLight/CNText',20},{'Text_CN02','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/Normal/Text_CN',20},{'Text_CN03','Hechen2/RightTop2/SynthesisSortPanel/Tog_default1/HighLight/Text_CN',20},{'CNText12','Hechen2/Btn_Kuaisuhecheng/CNText',20},{'Text_Xiaohaoshu01','Hechen2/Text_Xiaohaoshu',20},{'Text_Xiaohao01','Hechen2/Text_Xiaohao',20},{'Text_Title','RapidRecoveryPanel/Img_Tanchuangdi/Text_Title',20},{'Text_Tishi','RapidRecoveryPanel/Img_Tanchuangdi/Text_Tishi',20},{'Text_Title201','RapidRecoveryPanel/Text_Title2',20},{'Text_3','RapidRecoveryPanel/XingjiPanel/Tog_Star3/Normal/Text_3',20},{'Text_301','RapidRecoveryPanel/XingjiPanel/Tog_Star3/HighLight/Text_3',20},{'Text_4','RapidRecoveryPanel/XingjiPanel/Tog_Star4/Normal/Text_4',20},{'Text_401','RapidRecoveryPanel/XingjiPanel/Tog_Star4/HighLight/Text_4',20},{'Text_5','RapidRecoveryPanel/XingjiPanel/Tog_Star5/Normal/Text_5',20},{'Text_501','RapidRecoveryPanel/XingjiPanel/Tog_Star5/HighLight/Text_5',20},{'Text_6','RapidRecoveryPanel/XingjiPanel/Tog_Star6/Normal/Text_6',20},{'Text_601','RapidRecoveryPanel/XingjiPanel/Tog_Star6/HighLight/Text_6',20},{'Text_Title3','RapidRecoveryPanel/Text_Title3',20},{'Text_Jingliang','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent/Normal/Text_Jingliang',20},{'Text_Jingliang01','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent/HighLight/Text_Jingliang',20},{'Text_Jingliangjia','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent2/Normal/Text_Jingliangjia',20},{'Text_Jingliangjia01','RapidRecoveryPanel/XiyouduPanel/Tog_Excellent2/HighLight/Text_Jingliangjia',20},{'Text_Shishi','RapidRecoveryPanel/XiyouduPanel/Tog_Epic/Normal/Text_Shishi',20},{'Text_Shishi01','RapidRecoveryPanel/XiyouduPanel/Tog_Epic/HighLight/Text_Shishi',20},{'Text_Shishijia','RapidRecoveryPanel/XiyouduPanel/Tog_Epic2/Normal/Text_Shishijia',20},{'Text_Shishijia01','RapidRecoveryPanel/XiyouduPanel/Tog_Epic2/HighLight/Text_Shishijia',20},{'Text_Chuanshuo','RapidRecoveryPanel/XiyouduPanel/Tog_Legend/Normal/Text_Chuanshuo',20},{'Text_Chuanshuo01','RapidRecoveryPanel/XiyouduPanel/Tog_Legend/HighLight/Text_Chuanshuo',20},{'Text_Chuanshuojia','RapidRecoveryPanel/XiyouduPanel/Tog_Legend2/Normal/Text_Chuanshuojia',20},{'Text_Chuanshuojia01','RapidRecoveryPanel/XiyouduPanel/Tog_Legend2/HighLight/Text_Chuanshuojia',20},{'Text_RapidRecoveryCount','RapidRecoveryPanel/Text_RapidRecoveryCount',20},{'Text_Huode01','RapidRecoveryPanel/Text_Huode',20},{'Text_Huishou02','RapidRecoveryPanel/Btn_Huishou/Text_Huishou',20},{'Text_Huishou03','RapidRecoveryPanel/Btn_UnHuishou/Text_Huishou',20},{'Text_Title01','ExchangePanel/Img_Tanchuangdi/Text_Title',20},{'Text_Xiaohao02','ExchangePanel/Img_Tanchuangdi/XiaohaoPanel/Text_Xiaohao',20},{'Text_Mubiao','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/Text_Mubiao',20},{'Text_ItemName','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/ItemName/Text_ItemName',20},{'Text_Hechengshu1','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/Text_Hechengshu1',20},{'Text_Hechengshu2','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_1/Text_Hechengshu2',20},{'Text_ItemName01','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/ItemName/Text_ItemName',20},{'Text_Hechengshu101','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/Text_Hechengshu1',20},{'Text_Hechengshu201','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_2/Text_Hechengshu2',20},{'Text_ItemName02','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/ItemName/Text_ItemName',20},{'Text_Hechengshu102','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/Text_Hechengshu1',20},{'Text_Hechengshu202','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_3/Text_Hechengshu2',20},{'Text_ItemName03','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/ItemName/Text_ItemName',20},{'Text_Hechengshu103','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/Text_Hechengshu1',20},{'Text_Hechengshu203','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/Content/MubiaoPrefab_4/Text_Hechengshu2',20},{'Text_ItemName04','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/ItemName/Text_ItemName',20},{'Text_Hechengshu104','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/Text_Hechengshu1',20},{'Text_Hechengshu204','ExchangePanel/Img_Tanchuangdi/MubiaoPanel/MubiaoScroll/MubiaoPrefab/Text_Hechengshu2',20},{'Text_RapidRecoveryCount_1','ExchangePanel/Img_Tanchuangdi/Text_RapidRecoveryCount_1',20},{'Text_Huode02','ExchangePanel/Img_Tanchuangdi/Text_Huode',20},{'Text_Huishou04','ExchangePanel/Img_Tanchuangdi/Btn_Hecheng/Text_Huishou',20},{'Text_Huishou05','ExchangePanel/Img_Tanchuangdi/Btn_UnHecheng/Text_Huishou',20},
    }
end
-- Code Auto Create End
require("LocalData/TimeLocalData")
function M:OnInit()
    --快速合成
    self.QuickSynthesisList = {} --快速合成技能书列表
    self.CurQuickSynthesisList = {} --快速合成技能书列表
    ---此处的rank是SkillitemsynthesisLocalData表里的rank
    self.QuickSynthesisTarget = {
        [1] = {rank = 5, data = ItemControl.GetItemByID(110093), isLight = true, obj = self.MubiaoPrefab_1()},
        [2] = {rank = 4, data = ItemControl.GetItemByID(110090), isLight = true, obj = self.MubiaoPrefab_2()},
        [3] = {rank = 3, data = ItemControl.GetItemByID(110091), isLight = true, obj = self.MubiaoPrefab_3()},
        [4] = {rank = 2, data = ItemControl.GetItemByID(110092), isLight = true, obj = self.MubiaoPrefab_4()}
    }
    --初始化拥有的角色数据
    self.roleList = {}
    for index, value in ipairs(HeroControl.GetHaveHero()) do
        self.roleList[value.id] = value
    end
    self:InitUI()
    self:InitClick()
    ---当前选中的核心数据
    ArkViewModel.CurrentCore = nil
    ---当前选中的核心
    self.curCoreTemplate = nil
    self.CurItemData = nil
    self.synthesisType = -1
    --技能书根据表隐藏按钮
    local t = {}
    local tab = ArkControl.GetSynthesisDataByType(1)
    for index, value in ipairs(tab) do
--判断是否在显示时间内
        local timeCfg = TimeControl.GetTimeTable(value.opentime)
        if timeCfg.timeType == 2 then
            local inMiddle = Global.isMiddleTime(timeCfg.openTime, timeCfg.endTime)
            if inMiddle and value.display ~= 0 then
                table.insert(t,value)
            end
        elseif timeCfg.timeType == 999 then
            table.insert(t,value)
        end
    end
    self.Tog_AwakeningMaterials().gameObject:SetActive(#t ~= 0)
    if #t ~= 0 then self.synthesisType = 1 end
    --共鸣装备
    t = {}
    tab = ArkControl.GetSynthesisDataByType(2)
    for index, value in ipairs(tab) do
        --判断是否在显示时间内
        local timeCfg = TimeControl.GetTimeTable(value.opentime)
        if timeCfg.timeType == 2 then
            local inMiddle = Global.isMiddleTime(timeCfg.openTime, timeCfg.endTime)
            if inMiddle and value.display ~= 0 then
                table.insert(t,value)
            end
        elseif timeCfg.timeType == 999 then
            table.insert(t,value)
        end
    end
    self.Tog_roleeq().gameObject:SetActive(#t ~= 0)
    if #t ~= 0 then self.synthesisType = 2 end
    --养成材料
    t = {}
    tab = ArkControl.GetSynthesisDataByType(0)
    for index, value in ipairs(tab) do
--判断是否在显示时间内
        local timeCfg = TimeControl.GetTimeTable(value.opentime)
        if timeCfg.timeType == 2 then
            local inMiddle = Global.isMiddleTime(timeCfg.openTime, timeCfg.endTime)
            if inMiddle and value.display ~= 0 then
                table.insert(t,value)
            end
        elseif timeCfg.timeType == 999 then
            table.insert(t,value)
        end
    end
    self.Tog_SkillBook().gameObject:SetActive(#t ~= 0)
    if #t ~= 0 then self.synthesisType = 0 end
end

function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---刷新核心
    self:ResetCoreView()
end


function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        ---如果在选择界面返回上一级
        if self.ExchangePanel().gameObject.activeSelf == true then
            self.ExchangePanel().gameObject:SetActive(false)
        elseif self.Hechen2().gameObject.activeSelf == true then
            self.Hechen2().gameObject:SetActive(false)
            self.Hechen1().gameObject:SetActive(true)
        else
            MgrUI.GoBack()
        end
    end
end

function M:InitUI()
    ---注册滑块
    self.GearDetailScroll01():SetLuaCellEvent(Handle(self,self.CellCore))
    self:InitCoreFilter()
    self:RefreshRecoveryCount()
    self.Hechen2().gameObject:SetActive(false)
    self:InitSynthesis()
    self:InitRapidRecovery()
    self:QuickSynthesis()
end

function M:InitClick()
    self.Tog_SynthesisNH = {
        self.Tog_Synthesis01().transform:Find("Normal").gameObject,
        self.Tog_Synthesis01().transform:Find("Highlight").gameObject,
    }
    self.Tog_RecycleNH = {
        self.Tog_Recycle01().transform:Find("Normal").gameObject,
        self.Tog_Recycle01().transform:Find("Highlight").gameObject,
    }
    self.Tog_IntensifyNH = {
        self.Tog_Intensify01().transform:Find("Normal").gameObject,
        self.Tog_Intensify01().transform:Find("Highlight").gameObject,
    }

    Tools.ToggleValueChange(self.Tog_Synthesis01(),function(isOn)
        self.Tog_SynthesisNH[1]:SetActive(not isOn)
        self.Tog_SynthesisNH[2]:SetActive(isOn)
        self.synthesisPanel().gameObject:SetActive(isOn)
        self.Text_EnergyFactoryTitle().gameObject:SetActive(isOn)
        self.Text_CoreTitle().gameObject:SetActive(not isOn)
        self.BottomPanel().gameObject:SetActive(isOn)
    end,nil)

    Tools.ToggleValueChange(self.Tog_Recycle01(),function(isOn)
        self.Tog_RecycleNH[1]:SetActive(not isOn)
        self.Tog_RecycleNH[2]:SetActive(isOn)
        self.RecyclePanel().gameObject:SetActive(isOn)
        self.RecycleBtnPanel().gameObject:SetActive(isOn)
        self.IntensifyBtnPanel().gameObject:SetActive(not isOn)
        self.Text_EnergyFactoryTitle().gameObject:SetActive(not isOn)
        self.Text_CoreTitle().gameObject:SetActive(isOn)
        self.isCoreSelect = true
        ArkViewModel.CurrentCore = nil
        self.curCoreTemplate = nil
        self:ResetCoreView()
    end,nil)

    Tools.ToggleValueChange(self.Tog_Intensify01(),function(isOn)
        self.Tog_IntensifyNH[1]:SetActive(not isOn)
        self.Tog_IntensifyNH[2]:SetActive(isOn)
        self.RecyclePanel().gameObject:SetActive(isOn)
        self.RecycleBtnPanel().gameObject:SetActive(not isOn)
        self.IntensifyBtnPanel().gameObject:SetActive(isOn)
        self.Text_EnergyFactoryTitle().gameObject:SetActive(not isOn)
        self.Text_CoreTitle().gameObject:SetActive(isOn)
        self.isCoreSelect = false
        BagViewModel.ClearCoreSelects()
        self:ResetCoreView()
    end,nil)

    ---打开能源工厂
    if ArkViewModel.CurType == 1 then
        self.Tog_Recycle01().isOn = true
        self.Tog_Recycle01().isOn = false
        self.Tog_Intensify01().isOn = true
        self.Tog_Intensify01().isOn = false
        self.Tog_Synthesis01().isOn = false
        self.Tog_Synthesis01().isOn = true
        self.Tog_Recycle01().gameObject:SetActive(false)
        self.Tog_Synthesis01().gameObject:SetActive(true)
        self.Tog_Intensify01().gameObject:SetActive(false)
    elseif ArkViewModel.CurType == 2 then
        ---打开核心强化
        self.Tog_Synthesis01().isOn = true
        self.Tog_Synthesis01().isOn = false
        self.Tog_Recycle01().isOn = true
        self.Tog_Recycle01().isOn = false
        self.Tog_Intensify01().isOn = false
        self.Tog_Intensify01().isOn = true
        self.Tog_Recycle01().gameObject:SetActive(true)
        self.Tog_Synthesis01().gameObject:SetActive(false)
        self.Tog_Intensify01().gameObject:SetActive(true)
    else
        ---打开核心强化
        self.Tog_Synthesis01().isOn = true
        self.Tog_Synthesis01().isOn = false
        self.Tog_Intensify01().isOn = true
        self.Tog_Intensify01().isOn = false
        self.Tog_Recycle01().isOn = false
        self.Tog_Recycle01().isOn = true
        self.Tog_Recycle01().gameObject:SetActive(true)
        self.Tog_Synthesis01().gameObject:SetActive(false)
        self.Tog_Intensify01().gameObject:SetActive(true)
    end

    ---点击返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        ---如果在选择界面返回上一级
        if self.Hechen2().gameObject.activeSelf == true then
            self.Hechen2().gameObject:SetActive(false)
            self.Hechen1().gameObject:SetActive(true)
        else
            MgrUI.GoBack()
        end
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        ---移除已选数据
        BagViewModel.ClearCoreSelects()
        MgrUI.GoBackToFirst()
    end)

    UIEvent.LuaClick(self.Btn_Recycle().gameObject,function()
        ---发送请求
        BagViewModel.SendCoreDecompose(BagViewModel.CacheCoreSelects,function()
            BagViewModel.CacheCoreSelects = {}
            self:ResetCoreView()
            self:RefreshRecoveryCount()
        end)
    end)
    ---点击核心强化
    UIEvent.LuaClick(self.Btn_intensify().gameObject,function()
        if ArkViewModel.CurrentCore == nil then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bag_ui_corebag_expand_tips1"),1},true)
        else
            RoleCardViewModel.CurrentCore = ArkViewModel.CurrentCore
            MgrUI.GoHide(UID.NewGearUpgrade_UI)
        end
    end)

    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(103)
    end))

    --快速合成按钮点击
    UIEvent.LuaClick(self.Btn_Kuaisuhecheng().gameObject,Handle(self,function()
        self.ExchangePanel().gameObject:SetActive(true)
        self.insufficientMaterial = {[2] = false,[3] = false,[4] = false,[5] = false}
        for i,v in pairs(self.QuickSynthesisList) do
            if v.dataType == 2 and v.SynthesisCount1 > 0 then
                self.insufficientMaterial[v.rank] = true
            end
        end
        for i, v in ipairs(self.QuickSynthesisTarget) do
             v.isLight = self.insufficientMaterial[v.rank]
        end
        self:RefreshQSCostList()
        self:RefreshQSTarget()
        self:RefreshQSDunbiCount()
    end))

    UIEvent.LuaClick(self.QuickSynthesisMask().gameObject,Handle(self,function()
        self.ExchangePanel().gameObject:SetActive(false)
    end))

    UIEvent.LuaClick(self.Btn_Hecheng().gameObject,Handle(self,function()
        if self.insufficientFund then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips8"),1},true)
            return
        end
        if #self.CurQuickSynthesisList == 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text162"),1},true)
            return
        end
        local tab = {}
        for i,v in pairs(self.CurQuickSynthesisList) do
            local item = {id = v.id,count = v.SynthesisCount1}
            table.insert(tab,item)
        end
        ArkViewModel.SendSkillMaterialsMake_Multi(tab,function()
            self.ExchangePanel().gameObject:SetActive(false)
            self:ResetSynthesisScroll(0,1)
            self.synthesisType = 1
            self:RefreshCoinCount()
            self:RefreshSynthesis()
        end)
    end))
end

---初始化合成
function M:InitSynthesis()
    ---注册合成滑块
    self.SynthesisScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.XiaohaoScroll01():SetLuaCellEvent(Handle(self,self.CellXiaohaoItem))
    
    ---当前选择要合成的道具
    self.CurSynthesisItem = nil
    ---当前合成配方ID
    self.CurSynthesisId = nil
    ---当前选择合成要消耗的道具
    self.CurCostItem = nil
    self.targetSynthesis = self.targetPanel().transform:Find("Item").gameObject
    self.SynthesisList = {
        self.NeedItemPanel().transform:Find("NeedItem1").gameObject,
        self.NeedItemPanel().transform:Find("NeedItem2").gameObject,
        self.NeedItemPanel().transform:Find("NeedItem3").gameObject,
    }
    ---点击选择合成目标
    UIEvent.LuaClick(self.TobeSelectPanel().gameObject,function()
        self.Hechen1().gameObject:SetActive(false)
        self.Hechen2().gameObject:SetActive(true)
        self:ResetSynthesisScroll(0,self.synthesisType)
        --再次合成后重置页签位置
        -- self.SkillBookNH[1]:SetActive(false)
        -- self.SkillBookNH[2]:SetActive(true)
        -- self.AwakeningMaterialsNH[1]:SetActive(true)
        -- self.AwakeningMaterialsNH[2]:SetActive(false)


        if self.synthesisType == 0 then
            self.SkillBookNH[1]:SetActive(false)
            self.SkillBookNH[2]:SetActive(true)
    
            self.AwakeningMaterialsNH[1]:SetActive(true)
            self.AwakeningMaterialsNH[2]:SetActive(false)
    
            self.roleeqNH[1]:SetActive(true)
            self.roleeqNH[2]:SetActive(false)
            self.Tog_SkillBook01().isOn = true
        elseif self.synthesisType == 1 then
            self.SkillBookNH[1]:SetActive(true)
            self.SkillBookNH[2]:SetActive(false)
    
            self.AwakeningMaterialsNH[1]:SetActive(false)
            self.AwakeningMaterialsNH[2]:SetActive(true)
    
            self.roleeqNH[1]:SetActive(true)
            self.roleeqNH[2]:SetActive(false)
            self.Tog_AwakeningMaterials01().isOn = true
        else
            self.SkillBookNH[1]:SetActive(true)
            self.SkillBookNH[2]:SetActive(false)
    
            self.AwakeningMaterialsNH[1]:SetActive(true)
            self.AwakeningMaterialsNH[2]:SetActive(false)
    
            self.roleeqNH[1]:SetActive(false)
            self.roleeqNH[2]:SetActive(true)
            self.Tog_roleeq().isOn = true
        end

    end)
    UIEvent.LuaClick(self.targetSynthesis,function()
        self:ResetSynthesisScroll(0,self.synthesisType)
        self.Hechen1().gameObject:SetActive(false)
        self.Hechen2().gameObject:SetActive(true)
    end)

    self.SkillBookNH = {
        self.Tog_SkillBook01().transform:Find("Normal").gameObject,
        self.Tog_SkillBook01().transform:Find("HighLight").gameObject,
    }
    self.AwakeningMaterialsNH = {
        self.Tog_AwakeningMaterials01().transform:Find("Normal").gameObject,
        self.Tog_AwakeningMaterials01().transform:Find("HighLight").gameObject,
    }
    self.roleeqNH = {
        self.Tog_roleeq().transform:Find("Normal").gameObject,
        self.Tog_roleeq().transform:Find("HighLight").gameObject,
    }
    ---点击养成材料
    Tools.ToggleValueChange(self.Tog_SkillBook01(),function(isOn)
        self.SkillBookNH[1]:SetActive(not isOn)
        self.SkillBookNH[2]:SetActive(isOn)

        self.AwakeningMaterialsNH[1]:SetActive(isOn)
        self.AwakeningMaterialsNH[2]:SetActive(not isOn)

        self.roleeqNH[1]:SetActive(isOn)
        self.roleeqNH[2]:SetActive(not isOn)
        ---刷新滑块数据
        self:ResetSynthesisScroll(0,0)
        self.synthesisType = 0
        if isOn then
            self.Btn_Kuaisuhecheng().gameObject:SetActive(false)
        end
    end,nil)
    ---点击技能材料
    Tools.ToggleValueChange(self.Tog_AwakeningMaterials01(),function(isOn)
        self.AwakeningMaterialsNH[1]:SetActive(not isOn)
        self.AwakeningMaterialsNH[2]:SetActive(isOn)

        self.SkillBookNH[1]:SetActive(isOn)
        self.SkillBookNH[2]:SetActive(not isOn)

        self.roleeqNH[1]:SetActive(isOn)
        self.roleeqNH[2]:SetActive(not isOn)
        ---刷新滑块数据
        self:ResetSynthesisScroll(0,1)
        self.synthesisType = 1
        if isOn then
            self.Btn_Kuaisuhecheng().gameObject:SetActive(true)
        else
            self.Btn_Kuaisuhecheng().gameObject:SetActive(false)
        end
    end,nil)
    ---点击共鸣装备
    Tools.ToggleValueChange(self.Tog_roleeq01(),function(isOn)
        self.roleeqNH[1]:SetActive(not isOn)
        self.roleeqNH[2]:SetActive(isOn)

        self.AwakeningMaterialsNH[1]:SetActive(isOn)
        self.AwakeningMaterialsNH[2]:SetActive(not isOn)

        self.SkillBookNH[1]:SetActive(isOn)
        self.SkillBookNH[2]:SetActive(not isOn)
        ---刷新滑块数据
        self:ResetSynthesisScroll(0,2)
        self.synthesisType = 2
        if isOn then
            self.Btn_Kuaisuhecheng().gameObject:SetActive(false)
        end
    end,nil)
    ---默认选择技能书
    if self.synthesisType == 0 then
        self.Tog_AwakeningMaterials01().isOn = false
        self.Tog_roleeq01().isOn = false
        self.Tog_SkillBook01().isOn = false
        self.Tog_SkillBook01().isOn = true
    elseif self.synthesisType == 1 then
        self.Tog_roleeq01().isOn = false
        self.Tog_SkillBook01().isOn = false
        self.Tog_AwakeningMaterials01().isOn = false
        self.Tog_AwakeningMaterials01().isOn = true
    else
        self.Tog_AwakeningMaterials01().isOn = false
        self.Tog_SkillBook01().isOn = false
        self.Tog_SkillBook01().isOn = true
        self.Tog_roleeq01().isOn = false
        self.Tog_roleeq01().isOn = true
    end


    ---点击合成
    UIEvent.LuaClick(self.Btn_Synthesis().gameObject,function()
        -- local aa =     self.CurSynthesisItem
        -- local b =  self.CurItemData
        -- local c = self.curCoreTemplate
        if self.CanSynthesis == false then
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1")), 1 }, true)
            return
        end
        if self.synthesisCount < 1 then
            return
        end

        if self.CurItemData.dataType == 2 then
            ArkViewModel.SendSkillMaterialsMake(self.CurItemData.id,self.synthesisCount,function()
            ---清空当前合成目标
            --    self.CurSynthesisItem = nil
            --     self.CurCostItem = nil
                --self.CurItemData.SynthesisCount1 = self.CurItemData.SynthesisCount1 - self.synthesisCount--合成技能书后技能书的数量
                ArkControl.UpdateSynthesisCount(self.CurItemData.id,self.synthesisCount)
                ---还原默认合成次数
                self.synthesisCount = 1
                self:RefreshSynthesis()
                self:RefreshCoinCount()
            end)
        else
            ArkViewModel.SendHomeMake(self.CurSynthesisId,self.synthesisCount,function()
                ---还原默认合成次数
                self.synthesisCount = 1
                ---清空当前合成目标
                -- self.CurSynthesisItem = nil
                -- self.CurCostItem = nil
                self:RefreshSynthesis()
                self:RefreshCoinCount()
            end)
        end
    end)
    ---合成次数默认为1
    self.synthesisCount = 1
    ---是否在长按中
    self.IntClicking = false
    ---是否结束长按
    self.EndLongClick = true
    ---长按时间
    self.IntLoopTimer = 0
    ---当前长按是否是增加
    self.isAdd = true

    ---点击合成次数MAX
    UIEvent.LuaClick(self.Btn_Max().gameObject,function()
        self.synthesisCount = self:GetMaxCount()
        self:RefreshSynthesis()
    end)
    ---点击增加
    UIEvent.LuaPressClick(self.Btn_Add().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndLongClick = false
        self.IntLoopTimer = 0
        self.isAdd = true

        ---单次点击逻辑
        if  self.synthesisCount < 9999 then
            self.synthesisCount = self.synthesisCount + 1
            self:RefreshSynthesis()
        end
        ---长按逻辑
        self:LoopInput()
    end)
    ---点击最小
    UIEvent.LuaClick(self.Btn_Min().gameObject,function()
        self.synthesisCount = 1
        self:RefreshSynthesis()
    end)
    ---点击减少合成次数按钮
    UIEvent.LuaPressClick(self.Btn_Sub().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndLongClick = false
        self.IntLoopTimer = 0
        self.isAdd = false

        ---单次点击逻辑
        if self.synthesisCount > 1 then
            self.synthesisCount = self.synthesisCount - 1
            self:RefreshSynthesis()
        end
        ---长按逻辑
        self:LoopInput()
    end)
    ---初始化过滤器
    self:InitSynthesisFilter()
    ---刷新UI
    self:RefreshSynthesis()
    ---刷新货币数
    self:RefreshCoinCount()
end

function M:GreyButton(btn,On)
    if On then
        MgrRes.LoadSprite(btn,"UIMusk/Btn_Ling_Yello")
    else
        MgrRes.LoadSprite(btn,"UIMusk/Btn_Ling_grey")
    end
end

---长按逻辑
function M:LoopInput()
    if self.EndLongClick == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05, Handle(self, self.LoopInput), self.ObjRoot)
        self.IntClicking = true
        self.IntLoopTimer = self.IntLoopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.IntLoopTimer > 5 then
            if self.isAdd then
                if  self.synthesisCount < 9999 then
                    self.synthesisCount = self.synthesisCount + 1
                end
            else
                if self.synthesisCount > 1 then
                    self.synthesisCount = self.synthesisCount - 1
                end
            end
            self:RefreshSynthesis()
        end
        if bool_IsUp == false then
            self.IntClicking = false
            self.EndLongClick = true
            self.Int_LoopTimer = 0
        end
    end
end

---刷新合成UI
function M:RefreshSynthesis()
    ---如果没有要合成的道具 则显示空UI
    self.targetSynthesis:SetActive(self.CurSynthesisItem ~= nil)
    self.TobeSelectPanel().gameObject:SetActive(self.CurSynthesisItem == nil)
    self.targetPanel().gameObject:SetActive(self.CurSynthesisItem ~= nil)
    self.Btn_Synthesis().gameObject:SetActive(self.CurSynthesisItem ~= nil)
    self.Btn_UnSynthesis().gameObject:SetActive(self.CurSynthesisItem == nil)
    ---默认UI显示无数据
    for k,v in pairs(self.SynthesisList) do
        v.transform:Find("Item").gameObject:SetActive(false)
        v.transform:Find("NoneItem").gameObject:SetActive(true)
    end
    ---如果存在要合成的目标
    if self.CurSynthesisItem and self.CurCostItem then
        ---设置要合成品质
        MgrRes.LoadSprite(self.targetSynthesis.transform:Find("Img_Frame").gameObject:GetComponent("Image"),self.CurSynthesisItem.iconFrame)
        ---设置要合成图标
        MgrRes.LoadSprite(self.targetSynthesis.transform:Find("Img_Icon").gameObject:GetComponent("Image"),self.CurSynthesisItem.icon)
        ---是否可以合成
        self.CanSynthesis = true
        ---更换素材UI
        for k,v in pairs(self.CurCostItem) do
            local obj = self.SynthesisList[k].transform:Find("Item")
            local noneObj = self.SynthesisList[k].transform:Find("NoneItem")
            local icon = obj.transform:Find("Img_Icon").gameObject:GetComponent("Image")
            local count = obj.transform:Find("Text_Sucaishu").gameObject:GetComponent("TextMeshProUGUI")
            local frame = obj.transform:Find("Img_Frame").gameObject:GetComponent("Image")
            local name = obj.transform:Find("Text_Sucaiming").gameObject:GetComponent("TextMeshProUGUI")
            local myItem = ItemControl.GetItemByID(v.id)
            MgrRes.LoadSprite(frame,v.iconFrame)
            MgrRes.LoadSprite(icon,v.icon)
            name.text = v.name
            local totalCount = v.needCount * self.synthesisCount
            if myItem.count >= totalCount then
                print("当前要合成的道具数量" .. myItem.count)
                count.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),JNStrTool.numberAbbr(myItem.count),totalCount)
                self.CanSynthesis = self.CanSynthesis == true and true or false  --材料足够 可以合成
            else
                count.text = string.format("<color=#CD1B1B>%s</color>/%s",JNStrTool.numberAbbr(myItem.count),totalCount)
                self.CanSynthesis = false --材料不管 无法合成
            end
            --技能书判断
            if self.CurItemData.type == 1 and k == 1 and self.CurItemData.SynthesisCount1 then
                print("当前要合成的技能书数量" .. myItem.count)
                if self.CurItemData.SynthesisCount1 <= 0 then
                    count.text = string.format("<color=#CD1B1B>%s</color>/%s",self.CurItemData.SynthesisCount1,totalCount)
                else
                    count.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),self.CurItemData.SynthesisCount1,totalCount)
                end
            end

            obj.gameObject:SetActive(true)
            noneObj.gameObject:SetActive(false)
            ---合成消耗的盾币
            if v.id == 100001 then
                self.CostCoin = totalCount
            end
        end
        --合成道具类型为2隐藏加减号
        if self.CurItemData.type == 2 then
            self.Btn_Min().gameObject:SetActive(false)
            self.Btn_Sub().gameObject:SetActive(false)
            self.Btn_Max().gameObject:SetActive(false)
            self.Btn_Add().gameObject:SetActive(false)
        else
            self.Btn_Min().gameObject:SetActive(true)
            self.Btn_Sub().gameObject:SetActive(true)
            self.Btn_Max().gameObject:SetActive(true)
            self.Btn_Add().gameObject:SetActive(true)
        end
    end

    if self.synthesisCount >= 9999 then
        self:GreyButton(self.Btn_Add(),false)
        self:GreyButton(self.Btn_Sub(),true)
    elseif self.synthesisCount <= 1 then
        self:GreyButton(self.Btn_Add(),true)
        self:GreyButton(self.Btn_Sub(),false)
    else
        self:GreyButton(self.Btn_Add(),true)
        self:GreyButton(self.Btn_Sub(),true)
    end

    ---消耗的盾币文本赋值
    self.Text_Xiaohaoshu().text = self.CostCoin
    self.Text_Hechengshu().text = self.synthesisCount
end

function M:GetMaxCount()
    local isLoop = true
    local count = 1
    local bag = ItemControl.GetAllItems()
    while(isLoop) do
        for k,v in pairs(self.CurCostItem) do
            ---如果资源数量小于所需数量 循环结束
            if self.CurItemData.type == 1  and k == 1 then
                if (bag[v.id] and self.CurItemData.SynthesisCount1 or 0) < v.needCount * count then
                    isLoop = false
                end
            end
            if (bag[v.id] and bag[v.id].count or 0) < v.needCount * count then
                isLoop = false
            end
        end
        ---最大9999
        if count >= 9999 then
            isLoop = false
            return 9999
        end
        ---不满足条件不累计次数
        if isLoop then
            count = count + 1
        else
            count = count - 1
        end
        ---最小1
        if count < 1 then
            count = 1
        end
    end
    return count
end

---传入数据
function M:CellItem(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({self.CurSynthesisList[idx], self})
end

function M:CellXiaohaoItem(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({self.CurQuickSynthesisList[idx], self})
end

---刷新合成滑块
function M:ResetSynthesisScroll(offset,type)
    if type then
        self.CurSynthesisList = ArkControl.GetSynthesisDataByType(type)

        if type == 1 then
            local tab = {}
            for index, value in ipairs(self.CurSynthesisList) do
                if value.display ~= 0 then
                    table.insert(tab,value)
                end
            end
            self.CurSynthesisList = tab
        elseif type == 2 then
            local t = {}
            for i, v in ipairs(self.CurSynthesisList) do
                ---@type ItemData 要合成的道具
                local tItem = v:GetSynthesisItem()
                local equipData = EquipControl.GetSingleEquips(tItem.id)
                if equipData and not equipData.lockState then
                    table.insert(t, v)
                end
            end
            self.CurSynthesisList = t
        end
    end
    --第二张表特殊处理
    if type == 1 then
        self.CurSynthesisList = ArkViewModel.GetSynthesisDataTypeTwo( self.CurSynthesisList,self.Synthesisort,false) --self.SynthesisIsRise
    else
        self.CurSynthesisList = ArkViewModel.GetSynthesisData( self.CurSynthesisList,self.Synthesisort,false)
    end

    local t = {}
    for index, value in ipairs(self.CurSynthesisList) do 
        --判断是否在显示时间内
        local timeCfg = TimeControl.GetTimeTable(value.opentime)
        if timeCfg.timeType == 2 then
            local inMiddle = Global.isMiddleTime(timeCfg.openTime, timeCfg.endTime)
            if inMiddle and value.display ~= 0 then
                table.insert(t,value)
            end
        elseif timeCfg.timeType == 999 then
            table.insert(t,value)
        end
    end
    self.CurSynthesisList  = t

    --保存快速合成列表
    if #self.QuickSynthesisList == 0 and type == 1 then
        self.QuickSynthesisList = self.CurSynthesisList
    end

    self.SynthesisScroll01().totalCount = #self.CurSynthesisList
    if offset then
        ---刷新offset位置
        self.SynthesisScroll01():RefillCells(offset)
    else
        ---刷新数据不刷新位置
        self.SynthesisScroll01():RefreshCells()
    end
end

---初始化快速回收
function M:InitRapidRecovery()
    ---星级条件Tog
    self.OptionsStarObj = {
        self.Tog_Star301(),
        self.Tog_Star401(),
        self.Tog_Star501(),
        self.Tog_Star601(),
    }
    ---索引条件Tog
    self.OptionsIndexObj = {
        self.Tog_Excellent01(),
        self.Tog_Excellent201(),
        self.Tog_Epic01(),
        self.Tog_Epic201(),
        self.Tog_Legend01(),
        self.Tog_Legend201(),
    }
    ---稀有度筛选
    self.curOptionsIdx = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1,
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
    --        ---刷新获得货币数量
    --        self.Text_RapidRecoveryCount().text = ArkViewModel.ReckonAutoCoreAllCount(self.curOptionsState,self.curOptionsIdx)
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
    --        ---刷新获得货币数量
    --        self.Text_RapidRecoveryCount().text = ArkViewModel.ReckonAutoCoreAllCount(self.curOptionsState,self.curOptionsIdx)
    --    end,nil)
    --    tog.isOn = true
    --    tog.isOn = false
    --end
    self.OptionsStarObj[1].isOn = false
    self.OptionsStarObj[1].isOn = true
    self.OptionsIndexObj[1].isOn = false
    self.OptionsIndexObj[1].isOn = true
    ---点击快速回收
    UIEvent.LuaClick(self.Btn_FastRecycle().gameObject,function()
        self.RapidRecoveryPanel().gameObject:SetActive(true)
        ---刷新获得货币数量
        self.Text_RapidRecoveryCount().text = ArkViewModel.ReckonAutoCoreAllCount(self.curOptionsState,self.curOptionsIdx)
    end)
    ---点击关闭快速回收
    UIEvent.LuaClick(self.UpgradeReturnBg().gameObject,function()
        self.RapidRecoveryPanel().gameObject:SetActive(false)
    end)
    ---点击回收
    UIEvent.LuaClick(self.Btn_Huishou().gameObject,function()
        ---发送请求
        ArkViewModel.SendAutoCoreDecompose(self.curOptionsState,self.curOptionsIdx,function()
            self:ResetCoreView(0)
        end)
        self.RapidRecoveryPanel().gameObject:SetActive(false)
    end)
    ---默认不显示快速回收
    self.RapidRecoveryPanel().gameObject:SetActive(false)
    ---刷新获得货币数量
    self.Text_RapidRecoveryCount().text = "0"
end

---刷新货币数目
function M:RefreshCoinCount()
    local bag = ItemControl.GetAllItems()
    self.Text_ShieldCoinCount().text = JNStrTool.numberAbbr(bag[100001] and bag[100001].count or 0)
end

---核心筛选器
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
        MgrLanguageData.GetLanguageByKey("bag_ui_character_type1"),
        str[1],
        str[2],
        str[3],
        str[4],
        str[5],
    }
    local filterTogs = self:CreateFilterToggle(filters,self.GearBagFilterToggle().gameObject,self.GearFilterToggleGroup().gameObject.transform,Handle(self,function(self,filter,isOn,offset)
        if isOn then
            self.CoreFilter = filter - 1
            self:ResetCoreView(offset)
        end
    end))
    ---筛选器遮罩事件
    UIEvent.LuaClick(self.Btn_FilterBtnPanelClose().gameObject,function()
        self.Btn_GearFilter01().isOn = false
    end)
    ---筛选器动画
    Tools.ToggleValueChange(self.Btn_GearFilter01(),function(isOn)
        self.Btn_FilterBtnPanelClose().gameObject:SetActive(isOn)
        local y = isOn and -268.5 or 268.5
        Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
    end,nil)

    ---隐藏预制
    self.GearBagSortToggle().gameObject:SetActive(false)
    self.GearBagFilterToggle().gameObject:SetActive(false)
    ---默认关闭筛选
    self.Btn_GearFilter01().isOn = false
    ---默认筛选显示全部
    self.CoreFilter = 0
    filterTogs[1].enabled = false
    filterTogs[1].isOn = true
    filterTogs[1].enabled = true

    BagSortTogs[1].isOn = false
    BagSortTogs[1].isOn = true
end
---合成过滤器
function M:InitSynthesisFilter()
    self.RightTop2().gameObject:SetActive(false)
    -----排序器
    --local list = {
    --    [1] = "默认",
    --    [2] = "品质",
    --}
    --local SortTogs = self:CreateFilterToggle(list,self.Tog_default().gameObject,self.SynthesisSortPanel().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
    --    self.Synthesisort = sort
    --    self.SynthesisIsRise = isRise
    --    self:ResetSynthesisScroll(0)
    --end))
    --self.Tog_default().gameObject:SetActive(false)
    --SortTogs[2].isOn = false
    --SortTogs[1].isOn = false
    --SortTogs[1].isOn = true
end

---核心预制回调
function M:CellCore(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({self.CurCoreList[idx], self})
end

---核心背包loopScroll刷新
function M:ResetCoreView(offset,isReset)
    print("2")
    BagViewModel.ReloadCacheData()
    ---获取核心数据
    self.CurCoreList = BagViewModel.GetCoreData(self.CoreFilter,self.CoreSort,self.CoreIsRise)
    ---设置核心总数
    self.GearDetailScroll01().totalCount = #self.CurCoreList
    ---刷新滑块
    if offset then
        ---刷新offset位置
        self.GearDetailScroll01():RefillCells(offset)
    else
        ---刷新数据不刷新位置
        self.GearDetailScroll01():RefreshCells()
    end
end

---刷新回收可获得数目
function M:RefreshRecoveryCount()
    --self.Text_Huodeshu().text = ArkViewModel.GetCoreDecomposeCount(BagViewModel.CacheCoreSelects)
end

---创建标签
function M:CreateFilterToggle(filters,prefab,parentTrans,callback)
    local toggles = {}
    for idx, name in ipairs(filters) do
        local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
        togTrans:GetComponent("UITemplate"):SetData({name,function(...)
            callback(idx,...)
        end})
        toggles[idx] = togTrans:GetComponent("Toggle")
    end
    return toggles
end

---快速合成---
---初始化快速合成
function M:QuickSynthesis()
    self:ExchangePanel().gameObject:SetActive(false)
end

--刷新快速合成消耗列表
function M:RefreshQSCostList()
    local list = {}
    for i, v in ipairs(self.QuickSynthesisList) do
        --local _item = v:GetSynthesisCost()[1]
        --筛选是否解锁 可合成数量大于0
        if --[[v.Synthesis and]] v.SynthesisCount1 > 0 and self:SelectQSQuality(v.rank) == true then
            table.insert(list,v)
        end
    end
    self.CurQuickSynthesisList = list
    self:ResetQSScroll(0)
end

--是否选择了这个品质的物品
function M:SelectQSQuality(q)
    for i, v in ipairs(self.QuickSynthesisTarget) do
        if v.rank == q then
            return v.isLight
        end
    end
    return false
end


---刷新快速合成滑块
function M:ResetQSScroll(offset)
    self.XiaohaoScroll01().totalCount = #self.CurQuickSynthesisList
    if offset then
        self.XiaohaoScroll01():RefillCells(offset)
    else
        self.XiaohaoScroll01():RefreshCells()
    end
    self.Btn_Hecheng().gameObject:SetActive(#self.CurQuickSynthesisList ~= 0)
    self.Btn_UnHecheng().gameObject:SetActive(#self.CurQuickSynthesisList == 0)
end

--刷新合成目标选择
function M:RefreshQSTarget()
    for i, v in ipairs(self.QuickSynthesisTarget) do
        MgrRes.LoadSprite(v.obj.transform:Find("MubiaoItem/RewardRankImg").gameObject:GetComponent("Image"),v.data.iconFrame)
        MgrRes.LoadSprite(v.obj.transform:Find("MubiaoItem/RewardIconImg").gameObject:GetComponent("Image"),v.data.icon)
        v.obj.transform:Find("Text_Hechengshu1").gameObject:GetComponent("TextMeshProUGUI").text = JNStrTool.numberAbbr(v.data.count)
        v.obj.transform:Find("ItemName/Text_ItemName").gameObject:GetComponent("TextMeshProUGUI").text = v.data.name
        if self.insufficientMaterial[v.rank] then
            v.obj.transform:Find("Text_Hechengshu2").gameObject:GetComponent("TextMeshProUGUI").text = JNStrTool.numberAbbr(v.data.count + self:GetItemCountToQuality(v.rank))
        else
            v.obj.transform:Find("Text_Hechengshu2").gameObject:GetComponent("TextMeshProUGUI").text = "--"
        end
        local GouIcon = v.obj.transform:Find("Btn_Gou/GouIcon").gameObject:GetComponent("Image")
        local GouIconHui = v.obj.transform:Find("Btn_Gou/GouIconHui").gameObject:GetComponent("Image")

        local btn = v.obj.transform:Find("Btn_Gou").gameObject:GetComponent("Image")
        UIEvent.ClearFun(btn.gameObject)
        UIEvent.LuaClick(btn.gameObject,function()
            if self.insufficientMaterial[v.rank] then
                v.isLight = not v.isLight
                GouIcon.gameObject:SetActive(v.isLight)
                GouIconHui.gameObject:SetActive(not v.isLight)
                self:RefreshQSCostList()
                self:RefreshQSDunbiCount()
                if not v.isLight then
                    v.obj.transform:Find("Text_Hechengshu2").gameObject:GetComponent("TextMeshProUGUI").text = "--"
                else
                    local item = ItemControl.GetItemByID(v.data.id)
                    v.obj.transform:Find("Text_Hechengshu2").gameObject:GetComponent("TextMeshProUGUI").text = JNStrTool.numberAbbr(item.count + self:GetItemCountToQuality(v.rank))
                end
            else
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text159"),1},true)
            end
        end)
        GouIcon.gameObject:SetActive(v.isLight)
        GouIconHui.gameObject:SetActive(not v.isLight)
    end
end

--获得对应品质道具数量
function M:GetItemCountToQuality(q)
    local _count = 0
    for i, v in ipairs(self.CurQuickSynthesisList) do
        --local item = v:GetSynthesisCost()[1]
        if v.rank == q then
            _count = _count + v.SynthesisCount1
        end
    end
    return _count
end

--刷新快速合成盾币数量
function M:RefreshQSDunbiCount()
    local _count = 0
    for i, v in ipairs(self.CurQuickSynthesisList) do
        local item = v:GetSynthesisCost()
        if self:SelectQSQuality(v.rank) then
            _count = _count + (item[2].needCount * v.SynthesisCount1)
        end
    end

    local bag = ItemControl.GetAllItems()
    local ShieldCoinCount = bag[100001] and bag[100001].count or 0

    if ShieldCoinCount < _count then
        self.Text_RapidRecoveryCount_1().text = string.format("<color=#CD1B1B>%s</color>",_count)
        self.insufficientFund = true    --盾币不够
    else
        self.Text_RapidRecoveryCount_1().text = string.format("<color=#222222>%s</color>",_count)
        self.insufficientFund = false   --盾币足够
    end
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    ---移除已选数据
    BagViewModel.ClearCoreSelects()
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    ---移除已选数据
    BagViewModel.ClearCoreSelects()
end

return M