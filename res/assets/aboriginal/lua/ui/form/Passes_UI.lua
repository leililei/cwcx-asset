-- Code Auto Create Begin
local M = Class('Passes_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Passes_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Passes_UI].prefab'
    self.Name = 'Form[Passes_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'RenwuPanel','RenwuPanel',2},{'Mask','RenwuPanel/Mask',2},{'Tongxingzhengdengji','RenwuPanel/DengjiPanel/Tongxingzhengdengji',2},{'Exptiaodi','RenwuPanel/DengjiPanel/Exp/Exptiaodi',2},{'ProgressExp','RenwuPanel/DengjiPanel/Exp/ProgressExp',2},{'Btn_Goumaidengji','RenwuPanel/DengjiPanel/Btn_Goumaidengji',2},{'Img_Btndi','RenwuPanel/DengjiPanel/Btn_Goumaidengji/Img_Btndi',2},{'Img_Tishengicon','RenwuPanel/DengjiPanel/Btn_Goumaidengji/Img_Tishengicon',2},{'Btn_Ziyuanliebiao','RenwuPanel/DengjiPanel/Btn_Ziyuanliebiao',2},{'Img_Btndi01','RenwuPanel/DengjiPanel/Btn_Ziyuanliebiao/Img_Btndi',2},{'Img_Ziyuanicon','RenwuPanel/DengjiPanel/Btn_Ziyuanliebiao/Img_Ziyuanicon',2},{'Img_Tishengicon01','RenwuPanel/DengjiPanel/Btn_Ziyuanliebiao/Img_Tishengicon',2},{'Img_Changfengexian','RenwuPanel/Img_Changfengexian',2},{'TypePanel','RenwuPanel/TypePanel',2},{'DayTaskFilterToggle','RenwuPanel/TypePanel/DayTaskFilterToggle',2},{'HighLight_Day','RenwuPanel/TypePanel/DayTaskFilterToggle/HighLight_Day',2},{'NormalIcon','RenwuPanel/TypePanel/DayTaskFilterToggle/HighLight_Day/NormalIcon',2},{'Normal_Day','RenwuPanel/TypePanel/DayTaskFilterToggle/Normal_Day',2},{'NormalIcon01','RenwuPanel/TypePanel/DayTaskFilterToggle/Normal_Day/NormalIcon',2},{'RedDotIconDay','RenwuPanel/TypePanel/DayTaskFilterToggle/RedDotIconDay',2},{'WeekTaskFilterToggle','RenwuPanel/TypePanel/WeekTaskFilterToggle',2},{'HighLight_Week','RenwuPanel/TypePanel/WeekTaskFilterToggle/HighLight_Week',2},{'NormalIcon02','RenwuPanel/TypePanel/WeekTaskFilterToggle/HighLight_Week/NormalIcon',2},{'Normal_Week','RenwuPanel/TypePanel/WeekTaskFilterToggle/Normal_Week',2},{'NormalIcon03','RenwuPanel/TypePanel/WeekTaskFilterToggle/Normal_Week/NormalIcon',2},{'RedDotIconWeek','RenwuPanel/TypePanel/WeekTaskFilterToggle/RedDotIconWeek',2},{'TaskFilterToggle','RenwuPanel/TypePanel/TaskFilterToggle',2},{'HighLight','RenwuPanel/TypePanel/TaskFilterToggle/HighLight',2},{'NormalIcon04','RenwuPanel/TypePanel/TaskFilterToggle/HighLight/NormalIcon',2},{'Normal','RenwuPanel/TypePanel/TaskFilterToggle/Normal',2},{'NormalIcon05','RenwuPanel/TypePanel/TaskFilterToggle/Normal/NormalIcon',2},{'RedDotIcon','RenwuPanel/TypePanel/TaskFilterToggle/RedDotIcon',2},{'TaskContent','RenwuPanel/VFXMask/DayTaskScroll/TaskContent',2},{'TaskContent01','RenwuPanel/VFXMask/WeekTaskScroll/TaskContent',2},{'TaskContent02','RenwuPanel/VFXMask/TaskScroll/TaskContent',2},{'Btn_Jiangli','RenwuPanel/Btn_Jiangli',2},{'Img_Btndi02','RenwuPanel/Btn_Jiangli/Img_Btndi',2},{'Img_Renwuicon','RenwuPanel/Btn_Jiangli/Img_Renwuicon',2},{'RedDotIcon_Reward','RenwuPanel/Btn_Jiangli/RedDotIcon_Reward',2},{'Btn_AllReceive_hui','RenwuPanel/Btn_AllReceive_hui',2},{'Img_OCReceivedi','RenwuPanel/Btn_AllReceive_hui/Img_OCReceivedi',2},{'Btn_AllReceive_light','RenwuPanel/Btn_AllReceive_light',2},{'Img_OCReceivedi01','RenwuPanel/Btn_AllReceive_light/Img_OCReceivedi',2},{'JiangliPanel','JiangliPanel',2},{'Tongxingzhengdengji01','JiangliPanel/DengjiPanel/Tongxingzhengdengji',2},{'Exptiaodi01','JiangliPanel/DengjiPanel/Exp/Exptiaodi',2},{'ProgressExp01','JiangliPanel/DengjiPanel/Exp/ProgressExp',2},{'Btn_Goumaidengji01','JiangliPanel/DengjiPanel/Btn_Goumaidengji',2},{'Img_Btndi03','JiangliPanel/DengjiPanel/Btn_Goumaidengji/Img_Btndi',2},{'Img_Tishengicon02','JiangliPanel/DengjiPanel/Btn_Goumaidengji/Img_Tishengicon',2},{'Btn_Ziyuanliebiao01','JiangliPanel/DengjiPanel/Btn_Ziyuanliebiao',2},{'Img_Btndi04','JiangliPanel/DengjiPanel/Btn_Ziyuanliebiao/Img_Btndi',2},{'Img_Ziyuanicon01','JiangliPanel/DengjiPanel/Btn_Ziyuanliebiao/Img_Ziyuanicon',2},{'Img_Tishengicon03','JiangliPanel/DengjiPanel/Btn_Ziyuanliebiao/Img_Tishengicon',2},{'VFXMask','JiangliPanel/VFXMask',2},{'TXZicon','JiangliPanel/VFXMask/TXZicon',2},{'Img_Tongxingzhengicon','JiangliPanel/VFXMask/TXZicon/Img_Tongxingzhengicon',2},{'Img_GJTongxingzhengicon','JiangliPanel/VFXMask/TXZicon/Img_GJTongxingzhengicon',2},{'PassportRewardScroll','JiangliPanel/VFXMask/PassportRewardScroll',2},{'JiangliItem','JiangliPanel/VFXMask/PassportRewardScroll/JiangliItem',2},{'DaJiangItem','JiangliPanel/VFXMask/DaJiangItem',2},{'Img_TXZJianglidi','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi',2},{'RewardItemPreFab1','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1',2},{'RewardRankImg','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/RewardRankImg',2},{'RewardIconImg','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/RewardIconImg',2},{'Img_ItemCountBg','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/Img_ItemCountBg',2},{'StarPanel','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel',2},{'EmptyStarRoot','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot',2},{'EmptyStar','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot',2},{'ItemStarPrefab0','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab0',2},{'ItemStarPrefab1','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'ItemStarPrefab2','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'ItemStarPrefab3','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'ItemStarPrefab4','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'ItemStarPrefab5','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'Img_guang','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/Img_guang',2},{'Img_Received','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/Img_Received',2},{'Img_Gou','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/Img_Received/Img_Gou',2},{'Img_Suo1','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/Img_Suo1',2},{'Suo','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/Img_Suo1/Suo',2},{'HighLevelReward','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward',2},{'RewardItemPreFab2','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2',2},{'RewardRankImg01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/RewardRankImg',2},{'RewardIconImg01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/RewardIconImg',2},{'Img_ItemCountBg01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_ItemCountBg',2},{'StarPanel01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel',2},{'EmptyStarRoot01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot',2},{'EmptyStar06','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar07','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar08','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar09','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar10','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar11','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab_0','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_0',2},{'ItemStarPrefab_1','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_1',2},{'ItemStarPrefab_2','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_2',2},{'ItemStarPrefab_3','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_3',2},{'ItemStarPrefab_4','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_4',2},{'ItemStarPrefab_5','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_5',2},{'Img_guang01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_guang',2},{'Img_Received01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Received',2},{'Img_Gou01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Received/Img_Gou',2},{'Img_Suo2','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Suo2',2},{'Suo01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Suo2/Suo',2},{'RewardItemPreFab3','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3',2},{'RewardRankImg02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/RewardRankImg',2},{'RewardIconImg02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/RewardIconImg',2},{'Img_ItemCountBg02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_ItemCountBg',2},{'StarPanel02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel',2},{'EmptyStarRoot02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot',2},{'EmptyStar12','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar13','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar14','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar15','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar16','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar17','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot',2},{'ItemStarPrefab_01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_01',2},{'ItemStarPrefab_11','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_11',2},{'ItemStarPrefab_21','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_21',2},{'ItemStarPrefab_31','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_31',2},{'ItemStarPrefab_41','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_41',2},{'ItemStarPrefab_51','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_51',2},{'Img_guang02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_guang',2},{'Img_Received02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Received',2},{'Img_Gou02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Received/Img_Gou',2},{'Img_Suo3','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Suo3',2},{'Suo02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Suo3/Suo',2},{'Btn_Click','JiangliPanel/VFXMask/DaJiangItem/Btn_Click',2},{'Img_TXZDengjidi','JiangliPanel/VFXMask/DaJiangItem/Img_TXZDengjidi',2},{'Img_Lengqukuang','JiangliPanel/VFXMask/DaJiangItem/Img_Lengqukuang',2},{'Shijian','JiangliPanel/Shijian',2},{'Btn_Renwu','JiangliPanel/Btn_Renwu',2},{'Img_Btndi05','JiangliPanel/Btn_Renwu/Img_Btndi',2},{'Img_Renwuicon01','JiangliPanel/Btn_Renwu/Img_Renwuicon',2},{'RedDotIcon_Task','JiangliPanel/Btn_Renwu/RedDotIcon_Task',2},{'Btn_AllReceive_hui01','JiangliPanel/Btn_AllReceive_hui',2},{'Img_OCReceivedi02','JiangliPanel/Btn_AllReceive_hui/Img_OCReceivedi',2},{'Btn_AllReceive_light01','JiangliPanel/Btn_AllReceive_light',2},{'Img_OCReceivedi03','JiangliPanel/Btn_AllReceive_light/Img_OCReceivedi',2},{'Btn_Jiesuowanmei','JiangliPanel/Btn_Jiesuowanmei',2},{'Img_Jiesuowanmeiidi','JiangliPanel/Btn_Jiesuowanmei/Img_Jiesuowanmeiidi',2},{'UpperLeftBtnPanel','TopView/UpperLeftBtnPanel',2},{'Btn_Back','TopView/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','TopView/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','TopView/UpperLeftBtnPanel/Btn_Help',2},{'Btn_ZuanShi','TopView/Huobi/Btn_ZuanShi',2},{'Btn_Add','TopView/Huobi/Btn_ZuanShi/Btn_Add',2},{'Img_Zuanshicon','TopView/Huobi/Btn_ZuanShi/Img_Zuanshicon',2},{'Btn_Dunbi','TopView/Huobi/Btn_Dunbi',2},{'Img_Taofaicon','TopView/Huobi/Btn_Dunbi/Img_Taofaicon',2},{'GoumaidengjiPanel','GoumaidengjiPanel',2},{'Mask01','GoumaidengjiPanel/Mask',2},{'Img_Xian1','GoumaidengjiPanel/Img_Xian1',2},{'Img_Xian2','GoumaidengjiPanel/Img_Xian2',2},{'Img_Tanchuangdi','GoumaidengjiPanel/Img_Tanchuangdi',2},{'Btn_confirm','GoumaidengjiPanel/Img_Tanchuangdi/Btn_confirm',2},{'Img_Quedingdi','GoumaidengjiPanel/Img_Tanchuangdi/Btn_confirm/Img_Quedingdi',2},{'Btn_cancel','GoumaidengjiPanel/Img_Tanchuangdi/Btn_cancel',2},{'Img_Quxiaodi','GoumaidengjiPanel/Img_Tanchuangdi/Btn_cancel/Img_Quxiaodi',2},{'WupinPanel','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel',2},{'Numberdi','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Numberdi',2},{'Btn_Max','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Max',2},{'Img_Anniudi2','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Max/Img_Anniudi2',2},{'Btn_Add01','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Add',2},{'+di','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Add/+di',2},{'+','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Add/+',2},{'Btn_Minus','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Minus',2},{'-di','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Minus/-di',2},{'-','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Minus/-',2},{'Btn_Min','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Min',2},{'Img_Anniudi1','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Min/Img_Anniudi1',2},{'Img_Titlexian','GoumaidengjiPanel/Img_Tanchuangdi/Text_Title/Img_Titlexian',2},{'Img_Jiantou','GoumaidengjiPanel/Img_Tanchuangdi/Img_Jiantou',2},{'Xiaohao','GoumaidengjiPanel/Img_Tanchuangdi/Xiaohao',2},{'currencyIcon','GoumaidengjiPanel/Img_Tanchuangdi/Xiaohao/currencyIcon',2},{'ZiyuanyulanPanel','ZiyuanyulanPanel',2},{'Mask02','ZiyuanyulanPanel/Mask',2},{'Img_Xian101','ZiyuanyulanPanel/Img_Xian1',2},{'Img_Xian201','ZiyuanyulanPanel/Img_Xian2',2},{'Img_Tanchuangdi01','ZiyuanyulanPanel/Img_Tanchuangdi',2},{'Img_Titlexian01','ZiyuanyulanPanel/Img_Tanchuangdi/Text_Title/Img_Titlexian',2},{'Img_di','ZiyuanyulanPanel/Img_Tanchuangdi/JichuPanel/Img_di',2},{'Content','ZiyuanyulanPanel/Img_Tanchuangdi/JichuPanel/JichuScroll/Content',2},{'RewardItemPreFab','ZiyuanyulanPanel/Img_Tanchuangdi/JichuPanel/JichuScroll/RewardItemPreFab',2},{'Img_di01','ZiyuanyulanPanel/Img_Tanchuangdi/GaojiPanel/Img_di',2},{'Content01','ZiyuanyulanPanel/Img_Tanchuangdi/GaojiPanel/GaojiScroll/Content',2},{'RewardItemPreFab01','ZiyuanyulanPanel/Img_Tanchuangdi/GaojiPanel/GaojiScroll/RewardItemPreFab',2},
        -- UITemplate 列表
        {'PassportTaskItem','RenwuPanel/VFXMask/DayTaskScroll/PassportTaskItem',10},{'PassportTaskItem01','RenwuPanel/VFXMask/WeekTaskScroll/PassportTaskItem',10},{'PassportTaskItem02','RenwuPanel/VFXMask/TaskScroll/PassportTaskItem',10},{'JiangliItem01','JiangliPanel/VFXMask/PassportRewardScroll/JiangliItem',10},{'RewardItemPreFab02','ZiyuanyulanPanel/Img_Tanchuangdi/JichuPanel/JichuScroll/RewardItemPreFab',10},{'RewardItemPreFab03','ZiyuanyulanPanel/Img_Tanchuangdi/GaojiPanel/GaojiScroll/RewardItemPreFab',10},
        -- Toggle 列表
        {'DayTaskFilterToggle01','RenwuPanel/TypePanel/DayTaskFilterToggle',13},{'WeekTaskFilterToggle01','RenwuPanel/TypePanel/WeekTaskFilterToggle',13},{'TaskFilterToggle01','RenwuPanel/TypePanel/TaskFilterToggle',13},
        -- RawImage 列表
        {'DayTaskScroll','RenwuPanel/VFXMask/DayTaskScroll',15},{'WeekTaskScroll','RenwuPanel/VFXMask/WeekTaskScroll',15},{'TaskScroll','RenwuPanel/VFXMask/TaskScroll',15},{'JichuScroll','ZiyuanyulanPanel/Img_Tanchuangdi/JichuPanel/JichuScroll',15},{'GaojiScroll','ZiyuanyulanPanel/Img_Tanchuangdi/GaojiPanel/GaojiScroll',15},
        -- LoopScrollRect 列表
        {'DayTaskScroll01','RenwuPanel/VFXMask/DayTaskScroll',18},{'WeekTaskScroll01','RenwuPanel/VFXMask/WeekTaskScroll',18},{'TaskScroll01','RenwuPanel/VFXMask/TaskScroll',18},{'PassportRewardScroll01','JiangliPanel/VFXMask/PassportRewardScroll',18},{'JichuScroll01','ZiyuanyulanPanel/Img_Tanchuangdi/JichuPanel/JichuScroll',18},{'GaojiScroll01','ZiyuanyulanPanel/Img_Tanchuangdi/GaojiPanel/GaojiScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Dengji','RenwuPanel/DengjiPanel/Tongxingzhengdengji/Text_Dengji',20},{'Text_Lv','RenwuPanel/DengjiPanel/Tongxingzhengdengji/Text_Lv',20},{'Text_Dangqianjifen','RenwuPanel/DengjiPanel/Exp/Text_Dangqianjifen',20},{'Text_Goumaidengji','RenwuPanel/DengjiPanel/Btn_Goumaidengji/Text_Goumaidengji',20},{'Text_Ziyuanliebiao','RenwuPanel/DengjiPanel/Btn_Ziyuanliebiao/Text_Ziyuanliebiao',20},{'Btn_FiltterText','RenwuPanel/TypePanel/DayTaskFilterToggle/HighLight_Day/Btn_FiltterText',20},{'Btn_FiltterText01','RenwuPanel/TypePanel/DayTaskFilterToggle/Normal_Day/Btn_FiltterText',20},{'Btn_FiltterText02','RenwuPanel/TypePanel/WeekTaskFilterToggle/HighLight_Week/Btn_FiltterText',20},{'Btn_FiltterText03','RenwuPanel/TypePanel/WeekTaskFilterToggle/Normal_Week/Btn_FiltterText',20},{'Btn_FiltterText04','RenwuPanel/TypePanel/TaskFilterToggle/HighLight/Btn_FiltterText',20},{'Btn_FiltterText05','RenwuPanel/TypePanel/TaskFilterToggle/Normal/Btn_FiltterText',20},{'Text_Jiangli','RenwuPanel/Btn_Jiangli/Text_Jiangli',20},{'Text_OCReceive','RenwuPanel/Btn_AllReceive_hui/Text_OCReceive',20},{'Text_OCReceive01','RenwuPanel/Btn_AllReceive_light/Text_OCReceive',20},{'Text_Dengji01','JiangliPanel/DengjiPanel/Tongxingzhengdengji/Text_Dengji',20},{'Text_Lv01','JiangliPanel/DengjiPanel/Tongxingzhengdengji/Text_Lv',20},{'Text_Dangqianjifen01','JiangliPanel/DengjiPanel/Exp/Text_Dangqianjifen',20},{'Text_Goumaidengji01','JiangliPanel/DengjiPanel/Btn_Goumaidengji/Text_Goumaidengji',20},{'Text_Ziyuanliebiao01','JiangliPanel/DengjiPanel/Btn_Ziyuanliebiao/Text_Ziyuanliebiao',20},{'Text_Tongxingzheng','JiangliPanel/VFXMask/TXZicon/Img_Tongxingzhengicon/Text_Tongxingzheng',20},{'TextGJTongxingzheng','JiangliPanel/VFXMask/TXZicon/Img_GJTongxingzhengicon/TextGJTongxingzheng',20},{'ItemCountText','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/RewardItemPreFab1/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_ItemCountBg/ItemCountText',20},{'ItemCountText02','JiangliPanel/VFXMask/DaJiangItem/Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_ItemCountBg/ItemCountText',20},{'Text_TXZDengji','JiangliPanel/VFXMask/DaJiangItem/Img_TXZDengjidi/Text_TXZDengji',20},{'Text_Shengyushijian','JiangliPanel/Shijian/Text_Shengyushijian',20},{'Text_Renwu','JiangliPanel/Btn_Renwu/Text_Renwu',20},{'Text_OCReceive02','JiangliPanel/Btn_AllReceive_hui/Text_OCReceive',20},{'Text_OCReceive03','JiangliPanel/Btn_AllReceive_light/Text_OCReceive',20},{'Text_Goumai','JiangliPanel/Btn_Jiesuowanmei/Text_Goumai',20},{'Text_Jiesuo','JiangliPanel/Btn_Jiesuowanmei/Text_Jiesuo',20},{'Text_Title_CN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_EN',20},{'Text_ZSCount','TopView/Huobi/Btn_ZuanShi/Text_ZSCount',20},{'Text_TFCount','TopView/Huobi/Btn_Dunbi/Text_TFCount',20},{'Text_confirm','GoumaidengjiPanel/Img_Tanchuangdi/Btn_confirm/Text_confirm',20},{'Text_cancel','GoumaidengjiPanel/Img_Tanchuangdi/Btn_cancel/Text_cancel',20},{'Text_BuyCount','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Text_BuyCount',20},{'Text_Max','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Max/Text_Max',20},{'Text_Min','GoumaidengjiPanel/Img_Tanchuangdi/WupinPanel/BuyCount/Btn_Min/Text_Min',20},{'Text_Title','GoumaidengjiPanel/Img_Tanchuangdi/Text_Title',20},{'Text_LV1','GoumaidengjiPanel/Img_Tanchuangdi/Text_LV1',20},{'Text_LV2','GoumaidengjiPanel/Img_Tanchuangdi/Text_LV2',20},{'Text_Xiaohao','GoumaidengjiPanel/Img_Tanchuangdi/Xiaohao/Text_Xiaohao',20},{'Text_Price','GoumaidengjiPanel/Img_Tanchuangdi/Xiaohao/Text_Price',20},{'Text_Title01','ZiyuanyulanPanel/Img_Tanchuangdi/Text_Title',20},{'Text_Jichu','ZiyuanyulanPanel/Img_Tanchuangdi/JichuPanel/Text_Jichu',20},{'Text_Gaoji','ZiyuanyulanPanel/Img_Tanchuangdi/GaojiPanel/Text_Gaoji',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.starHl = {
        self.ItemStarPrefab0().gameObject,
        self.ItemStarPrefab1().gameObject,
        self.ItemStarPrefab2().gameObject,
        self.ItemStarPrefab3().gameObject,
        self.ItemStarPrefab4().gameObject,
        self.ItemStarPrefab5().gameObject,
        self.ItemStarPrefab_0().gameObject,
        self.ItemStarPrefab_1().gameObject,
        self.ItemStarPrefab_2().gameObject,
        self.ItemStarPrefab_3().gameObject,
        self.ItemStarPrefab_4().gameObject,
        self.ItemStarPrefab_5().gameObject,
        self.ItemStarPrefab_01().gameObject,
        self.ItemStarPrefab_11().gameObject,
        self.ItemStarPrefab_21().gameObject,
        self.ItemStarPrefab_31().gameObject,
        self.ItemStarPrefab_41().gameObject,
        self.ItemStarPrefab_51().gameObject,
    }
    ---隐藏任务页面
    self.RenwuPanel().gameObject:SetActive(false)
    ---初始化通行证页面
    self:InitPassport()
    ---任务和奖励切换按钮
    self:ButtonInit()
    ---初始化资源预览
    self:InitZiyuan()
    ---初始化购买等级面板
    self:InitBuyLevel()
    ---界面刷新
    TaskControl.UpdatePanel = Handle(self,self.UpdataPanel)
    ---通行证总表
    self.PassportBD = PassportControl.GetPassportBD()

    self.GoumaidengjiPanel().gameObject:SetActive(false)
    self.ZiyuanyulanPanel().gameObject:SetActive(false)
end
function M:OnUpdateUI()
    ---刷新通行证页面
    self:InitPassport()
    ---初始化倒计时
    self:InitTime()
    PassportViewModel.ReceivedCallBack = Handle(self,self.InitPassport)
    PassportViewModel.InitPassport = Handle(self,self.InitPassport)
    ---最后一个奖励的刷新
    self:FreshLastReward()
end
---初始化整个通行证页面
function M:InitPassport()
    self.seniorIsUnlock = PassportViewModel.CheckSeniorLock()
    ---盾币/钻石数量
    self.Text_TFCount().text = JNStrTool.numberAbbr(ItemControl.GetItemByID(100001).count)
    self.Text_ZSCount().text = JNStrTool.numberAbbr(ItemControl.GetItemByID(100000).count)
    MgrRes.LoadSprite(self.Img_Zuanshicon(),ItemControl.GetItemByID(100000).icon)
    ---通信证数据
    local passportInfo = PassportControl.GetPassportData()
    if passportInfo == nil then
        UnityEngine.DebugEx.LogError("无通行证数据")
        return
    end
    local activityStartTime = passportInfo.uTime
    ---当前通行证等级
    self.lv = math.modf(passportInfo.score / 1000)
    if self.lv > tonumber(SteamLocalData.tab[111008][2]) then
        self.lv = tonumber(SteamLocalData.tab[111008][2])
    end
    if self.lv == tonumber(SteamLocalData.tab[111008][2]) then
        self.Btn_Goumaidengji().gameObject:SetActive(false)
        self.Btn_Goumaidengji01().gameObject:SetActive(false)
    end
    self.Text_Lv().text = self.lv   --任务界面等级
    self.Text_Lv01().text = self.lv --奖励界面等级
    --通行证经验条数字
    local exp = 0
    if math.modf(passportInfo.score / 1000) > tonumber(SteamLocalData.tab[111008][2]) then
        exp = 1000
    else
        exp = passportInfo.score % 1000
    end
    self.Text_Dangqianjifen01().text = string.format(MgrLanguageData.GetLanguageByKey("passes_ui_pass_score"),tostring(exp))
    self.Text_Dangqianjifen().text = string.format(MgrLanguageData.GetLanguageByKey("passes_ui_pass_score"),tostring(exp))
    ---通行证经验条长度百分比
    local length = exp / 1000
    self.ProgressExp().fillAmount = length
    self.ProgressExp01().fillAmount = length
    ---任务面板数据
    self:DayEventFresh()
    self:WeekEventFresh()
    self:EventFresh()
    ---奖励面板数据
    self:LoadPassportRewardData()
    ---初始化活动条
    self:RegisterRewardLoopScroll()
    self:RegisterMissionLoopScroll()
    ---奖励面板一键领取是否要开启
    self:CheckRewawrdButton()
    ---重新检查红点
    self:CheckPassportRedDot()
    self:CheckMissionButton()

end
function M:DayEventFresh(offset)
    ---获取当前loop数据
    ---@type DayTaskData allDayTask
    local allDayTask = PassportViewModel.GetPassportMission(TaskControl.DayTaskType.ACTIVITY_DAILY)
    self.CurDayLoopList = {}
    for i,v in pairs(allDayTask) do
        if v.dayTaskID == PassportControl.GetPassportData().activityId then
            table.insert(self.CurDayLoopList,v)
        end
    end
    ---设置Loop数量
    self.DayTaskScroll01().totalCount = #self.CurDayLoopList
    if offset then
        self.DayTaskScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.DayTaskScroll01():RefreshCells()              ---只刷新数据
    end
end
function M:WeekEventFresh(offset)
    ---获取当前loop数据
    local allWeekTask = PassportViewModel.GetPassportMission(TaskControl.DayTaskType.ACTIVITY_WEEKLY)
    self.CurWeekLoopList = {}
    for i,v in pairs(allWeekTask) do
        if v.dayTaskID == PassportControl.GetPassportData().activityId then
            table.insert(self.CurWeekLoopList,v)
        end
    end
    ---设置Loop数量
    self.WeekTaskScroll01().totalCount = #self.CurWeekLoopList
    if offset then
        self.WeekTaskScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.WeekTaskScroll01():RefreshCells()              ---只刷新数据
    end
end
function M:EventFresh(offset)
    ---获取当前loop数据
    local allTask = AchievementViewModel.GetTask(TaskControl.AchievementTaskType.PASSPORT,false)
    self.CurLoopList = {}
    for i,v in pairs(allTask) do
        if v.taskGroupID == PassportControl.GetPassportData().activityId then
            table.insert(self.CurLoopList,v)
        end
    end
    ---设置Loop数量
    self.TaskScroll01().totalCount = #self.CurLoopList
    if offset then
        self.TaskScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.TaskScroll01():RefreshCells()              ---只刷新数据
    end
end
function M:LoadPassportRewardData(offset)
    ---获取当前loop数据
    self.CurRewardLoopList = PassportViewModel.GetAllReward()
    if self.CurRewardLoopList == nil then
        return
    end
    ---设置Loop数量
    self.PassportRewardScroll01().totalCount = #self.CurRewardLoopList
    if offset then
        self.PassportRewardScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        local receivedReward = PassportControl.GetReceivedReward()
        local isMaxLv = PassportControl.GetLv() == tonumber(SteamLocalData.tab[111008][2])   ---是否达到最高等级
        if PassportControl.GetLv() == tonumber(SteamLocalData.tab[111008][2]) - 1 then
            isMaxLv = true
        end
        ---如果没有可领取的奖励
        if PassportControl.GetAvailableReward() == nil or next(PassportControl.GetAvailableReward()) == nil then
            if isMaxLv then
                ---刷新到底部
                self.PassportRewardScroll01():RefillCellsFromEnd()
            else
                self.PassportRewardScroll01():RefillCells(PassportControl.GetLv())
            end
        else
            ---如果有可领取的奖励
            local index = tonumber(PassportControl.GetAvailableReward()[1].id) - 1
            if receivedReward then
                ---刷新到最新的可领取奖励
                self.PassportRewardScroll01():RefillCells(self:CheckReceivedMax())
            else
                self.PassportRewardScroll01():RefreshCells()
            end
        end
    end
    ---最后一个奖励
    self:InitLast(self.PassportRewardScroll01().itemTypeEnd)
end
---刷新最后一个奖励
function M:InitLast(lastNumber)
    local index
    if lastNumber ~= nil then
        index = (math.modf(lastNumber / 10) + 1) * 10
        if index > tonumber(SteamLocalData.tab[111013][2]) then
            index = tonumber(SteamLocalData.tab[111013][2])
        end
    else
        index = tonumber(SteamLocalData.tab[111008][2])
    end
    ---最后一个奖励
    --物品图标
    MgrRes.LoadSprite(self.RewardIconImg(),self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][1].icon)
    MgrRes.LoadSprite(self.RewardIconImg01(),self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][2].icon)
    --物品等级图标
    MgrRes.LoadSprite(self.RewardRankImg(),self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][1].iconFrame)
    MgrRes.LoadSprite(self.RewardRankImg01(),self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][2].iconFrame)
    --数量
    self.ItemCountText().text = self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][1].count
    self.ItemCountText01().text = self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][2].count
    if self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3] ~= nil then
        MgrRes.LoadSprite(self.RewardIconImg02(),self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3].icon)
        MgrRes.LoadSprite(self.RewardRankImg02(),self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3].iconFrame)
        self.ItemCountText02().text = self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3].count
    end
    --物品星级
    if self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][1].star==0 then
        self.StarPanel().gameObject:SetActive(false)
    end
    if self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][2].star==0 then
        self.StarPanel01().gameObject:SetActive(false)
    end
    if self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3].star==0 then
        self.StarPanel02().gameObject:SetActive(false)
    end
    for i = 1, 6 do
        if i <= self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][1].star then
            self.starHl[i]:SetActive(true)
        else
            self.starHl[i]:SetActive(false)
        end
        if i <= self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][2].star then
            self.starHl[i+6]:SetActive(true)
        else
            self.starHl[i+6]:SetActive(false)
        end
        if i <= self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3].star then
            self.starHl[i+12]:SetActive(true)
        else
            self.starHl[i+12]:SetActive(false)
        end
    end
    --是否已领取
    self.Img_Received().gameObject:SetActive(false)
    self.Img_Received01().gameObject:SetActive(false)
    self.Img_Received02().gameObject:SetActive(false)
    local receivedReward = PassportControl.GetReceivedReward()
    if receivedReward ~= nil then
        for i,v in pairs(receivedReward) do
            if tonumber(i) == (index or tonumber(SteamLocalData.tab[111008][2])) then
                self.Img_Received().gameObject:SetActive(true)
                self.Img_Received01().gameObject:SetActive(self.seniorIsUnlock and v == 2)
                self.Img_Received02().gameObject:SetActive(self.seniorIsUnlock and v == 2)
                break
            end
        end
    end

    --是否解锁
    self.Img_Suo2().gameObject:SetActive(not self.seniorIsUnlock)
    self.Img_Suo3().gameObject:SetActive(not self.seniorIsUnlock)
    --是否可领取     积分够并且还未被领取
    if self.lv >= (index or tonumber(SteamLocalData.tab[111008][2])) and receivedReward ~= nil then
        if receivedReward[index] == 0 then
            self.Img_guang().gameObject:SetActive(false)
            self.Img_guang01().gameObject:SetActive(self.seniorIsUnlock)
            self.Img_guang02().gameObject:SetActive(self.seniorIsUnlock)
        elseif receivedReward[index] == 2 then
            self.Img_guang().gameObject:SetActive(false)
            self.Img_guang01().gameObject:SetActive(false)
            self.Img_guang02().gameObject:SetActive(false)
        else
            self.Img_guang().gameObject:SetActive(true)
            self.Img_guang01().gameObject:SetActive(self.seniorIsUnlock)
            self.Img_guang02().gameObject:SetActive(self.seniorIsUnlock)
        end
    else
        self.Img_Received().gameObject:SetActive(false)
        self.Img_Received01().gameObject:SetActive(false)
        self.Img_Received02().gameObject:SetActive(false)
        self.Img_guang().gameObject:SetActive(false)
        self.Img_guang01().gameObject:SetActive(false)
        self.Img_guang02().gameObject:SetActive(false)
    end
    --编号
    self.Text_TXZDengji().text = index or tonumber(SteamLocalData.tab[111008][2])

    UIEvent.LuaClick(self.RewardIconImg().gameObject,function()
        local item =  ItemControl.GetItemByIdAndType(self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][1].id,self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][1].goodsType)
        self:OnItemClick(item)
    end)
    UIEvent.LuaClick(self.RewardIconImg01().gameObject,function()
        local item = ItemControl.GetItemByIdAndType(self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][2].id,self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][2].goodsType)
        self:OnItemClick(item)
    end)
    UIEvent.LuaClick(self.RewardIconImg02().gameObject,function()
        local item = ItemControl.GetItemByIdAndType(self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3].id,self.CurRewardLoopList[index or tonumber(SteamLocalData.tab[111008][2])][3].goodsType)
        self:OnItemClick(item)
    end)
end
---注册奖励滑动条
function M:RegisterRewardLoopScroll()
    self.PassportRewardScroll01():SetLuaCellEvent(Handle(self,self.RewardCellItem))
end
function M:RewardCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurRewardLoopList[idx],self,idx})
end
---注册任务滑动条
function M:RegisterMissionLoopScroll()
    self.DayTaskScroll01():SetLuaCellEvent(Handle(self,self.DayCellItem))
    self.WeekTaskScroll01():SetLuaCellEvent(Handle(self,self.WeekCellItem))
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
function M:DayCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurDayLoopList[idx],self})
end
function M:WeekCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurWeekLoopList[idx],self})
end
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self})
end
---红点检查
function M:CheckPassportRedDot()
    TaskControl.CheckPassesRewardReceived_RedDot()
    TaskControl.CheckDotReceived()
    if RedDotControl.GetDotData("ActivityTaskReward").State then
        self.RedDotIcon_Reward().gameObject:SetActive(true)
    else
        self.RedDotIcon_Reward().gameObject:SetActive(false)
    end
    if RedDotControl.GetDotData("ActivityTask").State then
        self.RedDotIcon_Task().gameObject:SetActive(true)
    else
        self.RedDotIcon_Task().gameObject:SetActive(false)
    end
    if RedDotControl.GetDotData("ActivityDayTask").State then
        self.RedDotIconDay().gameObject:SetActive(true)
    else
        self.RedDotIconDay().gameObject:SetActive(false)
    end
    if RedDotControl.GetDotData("ActivityWeekTask").State then
        self.RedDotIconWeek().gameObject:SetActive(true)
    else
        self.RedDotIconWeek().gameObject:SetActive(false)
    end
    if RedDotControl.GetDotData("ActivityPhaseTask").State then
        self.RedDotIcon().gameObject:SetActive(true)
    else
        self.RedDotIcon().gameObject:SetActive(false)
    end
end
---判断任务界面一键领取是否置灰
function M:CheckMissionButton()
    ---任务面板一键领取是否要开启
    --if self.EventType == 1 then
    --    if RedDotControl.GetDotData("ActivityDayTask").State then
    --        self.Btn_AllReceive_hui().gameObject:SetActive(false)
    --        self.Btn_AllReceive_light().gameObject:SetActive(true)
    --    else
    --        self.Btn_AllReceive_light().gameObject:SetActive(false)
    --        self.Btn_AllReceive_hui().gameObject:SetActive(true)
    --    end
    --elseif self.EventType == 2 then
    --    if RedDotControl.GetDotData("ActivityWeekTask").State then
    --        self.Btn_AllReceive_hui().gameObject:SetActive(false)
    --        self.Btn_AllReceive_light().gameObject:SetActive(true)
    --    else
    --        self.Btn_AllReceive_light().gameObject:SetActive(false)
    --        self.Btn_AllReceive_hui().gameObject:SetActive(true)
    --    end
    --elseif self.EventType == 3 then
    --    if RedDotControl.GetDotData("ActivityPhaseTask").State then
    --        self.Btn_AllReceive_light().gameObject:SetActive(true)
    --        self.Btn_AllReceive_hui().gameObject:SetActive(false)
    --    else
    --        self.Btn_AllReceive_light().gameObject:SetActive(false)
    --        self.Btn_AllReceive_hui().gameObject:SetActive(true)
    --    end
    --end
    if RedDotControl.GetDotData("ActivityDayTask").State or RedDotControl.GetDotData("ActivityWeekTask").State or RedDotControl.GetDotData("ActivityPhaseTask").State then
        self.Btn_AllReceive_light().gameObject:SetActive(true)
        self.Btn_AllReceive_hui().gameObject:SetActive(false)
    else
        self.Btn_AllReceive_light().gameObject:SetActive(false)
        self.Btn_AllReceive_hui().gameObject:SetActive(true)
    end
end
---检查奖励领取按钮
function M:CheckRewawrdButton()
    if PassportControl.GetAvailableReward() == nil or next(PassportControl.GetAvailableReward()) == nil then
        self.Btn_AllReceive_light01().gameObject:SetActive(false)
        self.Btn_AllReceive_hui01().gameObject:SetActive(true)
    else
        self.Btn_AllReceive_light01().gameObject:SetActive(true)
        self.Btn_AllReceive_hui01().gameObject:SetActive(false)
    end
end
---刷新最后一个奖励
function M:FreshLastReward()
    MgrTimer.AddRepeat("FreshLastPassesReward",0.1,function()
        self:InitLast(self.PassportRewardScroll01().itemTypeEnd)
    end,-1,nil)
end
---关闭通行证
function M:ClosePassport()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBack()
end
---切换按钮初始化
function M:ButtonInit()
    ---左边2个toggle
    --self.toggles = {
    --    self.SwitchJiangliBtnPanel01(),
    --    self.SwitchRenwuBtnPanel01()
    --}
    --self.togglesEvents = {
    --    self.OpenReward,
    --    self.OpenMission
    --}
    --self.Btn_HighLight_Jiangli().gameObject:SetActive(false)
    --self.Btn_HighLight_Renwu().gameObject:SetActive(false)
    --for i = 1, 2 do
    --    Tools.ToggleValueChange(self.toggles[i],Handle(self,self.togglesEvents[i]),nil)
    --end
    --self.SwitchJiangliBtnPanel01().isOn = false
    --self.SwitchJiangliBtnPanel01().isOn = true
    self.panel = 1
    ---奖励和任务切换按钮
    UIEvent.LuaClick(self.Btn_Renwu().gameObject,function()
        self:OpenMission(true)
    end)
    UIEvent.LuaClick(self.Btn_Jiangli().gameObject,function()
        self:OpenReward(true)
    end)
    ---任务2个toggle
    self.taskButtons = {
        self.DayTaskFilterToggle01(),
        self.WeekTaskFilterToggle01(),
        self.TaskFilterToggle01()
    }
    self.taskButtonEvents = {
        self.OpenDayEvent,
        self.OpenWeekEvent,
        self.OpenEvent
    }
    self.HighLight_Day().gameObject:SetActive(false)
    self.HighLight_Week().gameObject:SetActive(false)
    self.HighLight().gameObject:SetActive(false)
    for i = 1, #self.taskButtons do
        Tools.ToggleValueChange(self.taskButtons[i],Handle(self,self.taskButtonEvents[i]),nil)
    end
    self.DayTaskFilterToggle01().isOn = false
    self.DayTaskFilterToggle01().isOn = true
    ---解锁高级通行证
    UIEvent.LuaClick(self.Btn_Jiesuowanmei().gameObject,Handle(self,PassportViewModel.UnlockSeniorPassport))
    ---购买通行证等级
    --UIEvent.LuaClick(self.Btn_Goumaidengji().gameObject,Handle(self,function()
    --    if self.lv < tonumber(SteamLocalData.tab[111008][2]) then
    --        PassportViewModel.BuyPassportLevel(self)
    --    else
    --        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passes_ui_pass_tips1"),2},true)
    --    end
    --end))
    ---一键领取
    UIEvent.LuaClick(self.Btn_AllReceive_light01().gameObject,Handle(self,function()
        if PassportControl.GetAvailableReward() == nil or next(PassportControl.GetAvailableReward()) == nil then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips3"),2},true)
        else
            PassportViewModel.AcceptAll(self)
        end
    end))
    ---一键领取任务
    UIEvent.LuaClick(self.Btn_AllReceive_light().gameObject,Handle(self,function()
        PassportViewModel.TaskPerform_New(self.PassportBD.daytaskId)
        --if self.EventType == 1 then
        --    PassportViewModel.TaskPerform(61,0, self.PassportBD.daytaskId)
        --elseif self.EventType == 2 then
        --    PassportViewModel.TaskPerform(62,0, self.PassportBD.daytaskId)
        --elseif self.EventType == 3 then
        --    AchievementViewModel.TaskPerform(0,0,nil, self.PassportBD.taskId,PassportViewModel.InitPassport)
        --end
    end))
    ---返回按钮
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function() self:ClosePassport() end))
    ---资源显示按钮1
    UIEvent.LuaClick(self.Btn_Ziyuanliebiao().gameObject,Handle(self,function()
        self.ZiyuanyulanPanel().gameObject:SetActive(true)
    end))
    UIEvent.LuaClick(self.Btn_Ziyuanliebiao01().gameObject,Handle(self,function()
        self.ZiyuanyulanPanel().gameObject:SetActive(true)
    end))
    UIEvent.LuaClick(self.Mask02().gameObject,Handle(self,function()
        self.ZiyuanyulanPanel().gameObject:SetActive(false)
    end))
    UIEvent.LuaClick(self.Btn_Goumaidengji01().gameObject,Handle(self,function()
        self.BuyCount = 0
        self:InitBuyLevel()
        self.GoumaidengjiPanel().gameObject:SetActive(true)
    end))
    UIEvent.LuaClick(self.Btn_Goumaidengji().gameObject,Handle(self,function()
        self.BuyCount = 0
        self:InitBuyLevel()
        self.GoumaidengjiPanel().gameObject:SetActive(true)
    end))
end
---打开奖励界面
function M:OpenReward(isOn)
    self.panel = 1  ---奖励面板
    --self.Text_Renwu().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text40")
    --self.Btn_HighLight_Jiangli().gameObject:SetActive(isOn)
    self.JiangliPanel().gameObject:SetActive(isOn)
    --self.Btn_Normal_Jiangli().gameObject:SetActive(not isOn)
    self.RenwuPanel().gameObject:SetActive(not isOn)
    ---奖励面板数据刷新
    self:LoadPassportRewardData()
    ---奖励面板一键领取是否要开启
    self:CheckRewawrdButton()
end
---打开任务界面
function M:OpenMission(isOn)
    self.panel = 2  ---任务面板
    --self.Text_Renwu().text = MgrLanguageData.GetLanguageByKey("ui_passes_reward")
    --self.Btn_HighLight_Renwu().gameObject:SetActive(isOn)
    self.JiangliPanel().gameObject:SetActive(not isOn)
    --self.Btn_Normal_Renwu().gameObject:SetActive(not isOn)
    self.RenwuPanel().gameObject:SetActive(isOn)
    self.DayTaskFilterToggle01().isOn = false
    self.DayTaskFilterToggle01().isOn = true
    --任务面板数据刷新
    self:DayEventFresh()
    self:WeekEventFresh()
    self:EventFresh()

    self:CheckMissionButton()
end
function M:OpenDayEvent(isOn)
    --self.EventType = 1
    self:DayEventFresh(0)
    self.HighLight_Day().gameObject:SetActive(isOn)
    self.Normal_Day().gameObject:SetActive(not isOn)
    self.DayTaskScroll01().gameObject:SetActive(true)
    self.WeekTaskScroll01().gameObject:SetActive(false)
    self.TaskScroll01().gameObject:SetActive(false)
    self:CheckMissionButton()
end
function M:OpenWeekEvent(isOn)
    --self.EventType = 2
    self:WeekEventFresh(0)
    self.HighLight_Week().gameObject:SetActive(isOn)
    self.Normal_Week().gameObject:SetActive(not isOn)
    self.DayTaskScroll01().gameObject:SetActive(false)
    self.WeekTaskScroll01().gameObject:SetActive(true)
    self.TaskScroll01().gameObject:SetActive(false)
    self:CheckMissionButton()
end
function M:OpenEvent(isOn)
    --self.EventType = 3
    self:EventFresh(0)
    self.HighLight().gameObject:SetActive(isOn)
    self.Normal().gameObject:SetActive(not isOn)
    self.DayTaskScroll01().gameObject:SetActive(false)
    self.WeekTaskScroll01().gameObject:SetActive(false)
    self.TaskScroll01().gameObject:SetActive(true)
    self:CheckMissionButton()
end
---初始化倒计时
function M:InitTime()
    if PassportControl.GetPassportData() == nil then
        UnityEngine.Debug.LogError("无通行证数据")
        return
    end
    local endTime = TimeControl.GetTimeTable(ActivityLocalData.tab[PassportControl.GetPassportData().activityId][5]).endTime    --结束时间
    local str = string.split(Global.TimeToDate(endTime),"-")
    self.diffTime = tonumber(os.time({year=str[1], month = str[2], day = str[3] , hour = tonumber(str[4])- (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()), min = str[5], sec = str[6]})) - Global.GetCurTime()
    --self.diffTime = Global.GetTimeStamp(endTime)   ---获得时间差
    self.Text_Shengyushijian().text = MgrLanguageData.GetLanguageByKey("passes_ui_pass_remainder_time").. math.modf(self.diffTime/86400) ..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky").. math.modf(self.diffTime%86400/3600) ..MgrLanguageData.GetLanguageByKey("arkbuilddata_tips1")
    MgrTimer.Cancel("Shengyushijian")
    MgrTimer.AddRepeat("Shengyushijian",1,function()
        if self.diffTime == 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passes_ui_pass_beoverdue"),1},true)
            MgrUI.GoBack()
        end
        self.diffTime = self.diffTime - 1
        if self.diffTime >= 86400 then
            self.Text_Shengyushijian().text = MgrLanguageData.GetLanguageByKey("passes_ui_pass_remainder_time").. math.modf(self.diffTime/86400) ..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky").. math.modf(self.diffTime%86400/3600) ..MgrLanguageData.GetLanguageByKey("arkbuilddata_tips1")
        else
            local hour = math.floor(self.diffTime / 3600)
            local min = math.floor((self.diffTime % 3600) / 60)
            self.Text_Shengyushijian().text =string.format(MgrLanguageData.GetLanguageByKey("passes_ui_pass_remainder_tip"),hour,min)
        end

    end,-1,nil)
    ---任务刷新
    MgrTimer.Cancel("TaskRefresh")
    MgrTimer.AddRepeat("TaskRefresh", 1, Handle(self,function()
        self:RefreshTime()
    end) , -1, nil)
end
---刷新时间
function M:RefreshTime()
    local xx = ActivationTaskViewModel.GetLastTime("TODAY")
    local day = math.floor(xx/86400)
    local hour = math.floor(xx%86400/3600)
    local min = math.floor(xx%86400%3600/60)
    local sec = math.floor(xx%86400%3600%60)
    --self.Text_Shengyushijian().text =string.format("刷新时间：<color=#FF4570>%02d</color>天<color=#FF4570>%02d</color>小时<color=#FF4570>%02d</color>分",day,hour,min)
    if hour == 0 and min == 0 and sec == 0 then
        --清理所有任务数据
        --TaskControl.ClearAllTaskData()
        --任务面板数据刷新
        self:UpdataPanel()
    end
end
function M:UpdataPanel()
    --任务面板数据刷新
    self:DayEventFresh()
    self:WeekEventFresh()
    ---重新检查红点
    self:CheckPassportRedDot()
    self:CheckMissionButton()
end
---初始化资源预览
function M:InitZiyuan()
    ---统计所有奖励
    local allReward = PassportViewModel.GetAllReward()
    self.normalRewards = {}
    self.seniorRewards = {}
    local normalRewards = {}
    local seniorRewards = {}
    for i,v in ipairs(allReward) do
        ---普通奖励
        if normalRewards[v[1].id] == nil then
            normalRewards[v[1].id] = {c = v[1].count,t = v[1].goodsType}
        else
            normalRewards[v[1].id].c = normalRewards[v[1].id].c + v[1].count
        end
        ---高级奖励
        if seniorRewards[v[2].id] == nil then
            seniorRewards[v[2].id] = {c = v[2].count,t = v[2].goodsType}
        else
            seniorRewards[v[2].id].c = seniorRewards[v[2].id].c + v[2].count
        end
        ---高级奖励2
        if v[3]~= nil then
            if seniorRewards[v[3].id] == nil then
                seniorRewards[v[3].id] = {c = v[3].count,t = v[3].goodsType}
            else
                seniorRewards[v[3].id].c = seniorRewards[v[3].id].c + v[3].count
            end
        end
    end
    for i,v in pairs(normalRewards) do
        local item = ItemData.New()
        local bagItem = ItemControl.GetItemByIdAndType(i, v.t)
        local goods = {
            goodsType = v.t,
            goodsID = i,
            goodsNum = bagItem.count
        }
        item:PushData(goods, ItemControl.PushEnum.none)
        table.insert(self.normalRewards,{item,v.c})
    end
    for i,v in pairs(seniorRewards) do
        local item = ItemData.New()
        local bagItem = ItemControl.GetItemByIdAndType(i, v.t)
        local goods = {
            goodsType = v.t,
            goodsID = i,
            goodsNum = bagItem.count
        }
        item:PushData(goods, ItemControl.PushEnum.none)
        table.insert(self.seniorRewards,{item,v.c})
    end
    ---注册
    self.JichuScroll01():SetLuaCellEvent(Handle(self,self.NormalRewardsCellItem))
    self.JichuScroll01().totalCount = #self.normalRewards
    self.JichuScroll01():RefillCells(0)

    self.GaojiScroll01():SetLuaCellEvent(Handle(self,self.SeniorRewardsCellItem))
    self.GaojiScroll01().totalCount = #self.seniorRewards
    self.GaojiScroll01():RefillCells(0)
end
function M:NormalRewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.normalRewards[idx])
end
function M:SeniorRewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.seniorRewards[idx])
end
---初始化购买等级面板
function M:InitBuyLevel()
    ---当前等级
    self.Text_LV1().text = self.lv
    ---目标等级
    self.Text_LV2().text = self.lv
    --self.BuyCount = 0
    --if self.lv < tonumber(SteamLocalData.tab[111008][2]) then
    self.BuyCount = 1
    --end
    --self.Text_BuyCount().text = "0"
    local img = ItemControl.GetItemByIdAndType(100000,1).icon
    MgrRes.LoadSprite(self.currencyIcon(),img)
    UIEvent.LuaClick(self.Btn_Min().gameObject,function()
        self.BuyCount = 1
        self:FreshCostAndLevel(self.BuyCount)
    end)
    UIEvent.LuaClick(self.Btn_Max().gameObject,function()
        if tonumber(SteamLocalData.tab[111008][2]) == self.lv then
            return
        else
            local maxCount = math.modf(ItemControl.GetItemByID(100000).count / PassportViewModel.GetConsume())
            if maxCount >= tonumber(SteamLocalData.tab[111008][2]) - self.lv then
                self.BuyCount = tonumber(SteamLocalData.tab[111008][2]) - self.lv
            else
                self.BuyCount = maxCount
            end
            self:FreshCostAndLevel(self.BuyCount)
        end
    end)
    UIEvent.LuaClick(self.Btn_Add01().gameObject,function()
        if self.BuyCount + self.lv < tonumber(SteamLocalData.tab[111008][2]) then
            self.BuyCount = self.BuyCount + 1
        else
            self.BuyCount = tonumber(SteamLocalData.tab[111008][2]) - self.lv
        end
        self:FreshCostAndLevel(self.BuyCount)
    end)
    UIEvent.LuaClick(self.Btn_Minus().gameObject,function()
        if self.BuyCount > 1 then
            self.BuyCount = self.BuyCount - 1
        else
            self.BuyCount = 1
        end
        self:FreshCostAndLevel(self.BuyCount)
    end)
    ---价格
    self:FreshCostAndLevel(self.BuyCount)
    UIEvent.LuaClick(self.Btn_confirm().gameObject,function()
        if self.BuyCount == 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
            return
        end
        local cost = self.BuyCount * PassportViewModel.GetConsume()
        if cost > ItemControl.GetItemByID(100000).count then     ---判断钱够不够
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
            return
        end
        if self.lv + self.BuyCount < tonumber(SteamLocalData.tab[111008][2]) + 1 then
            PassportViewModel.BuyPassportLevel(self,self.BuyCount)
            self.GoumaidengjiPanel().gameObject:SetActive(false)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passes_ui_pass_tips1"),1},true)
        end
    end)
    UIEvent.LuaClick(self.Btn_cancel().gameObject,Handle(self,function()
        self.BuyCount = 0
        self.GoumaidengjiPanel().gameObject:SetActive(false)
    end))
end
---刷新花费
function M:FreshCostAndLevel(count)
    local colorStr = ""
    if count * PassportViewModel.GetConsume() > ItemControl.GetItemByID(100000).count then
        colorStr = "<color=#FF0000>%s</color>"
    else
        colorStr = "<color=#000000>%s</color>"
    end
    self.Text_Price().text = string.format(colorStr,tostring(tonumber(string.split(SteamLocalData.tab[111005][2],"_")[3]) * count))
    self.Text_BuyCount().text = count
    self.Text_LV2().text = self.lv + count
end
---筛选出可领取第一个索引
function M:CheckReceivedMax()
    local index = 1
    local data = PassportControl.GetReceivedReward()
    for key, value in pairs(data) do
        --根据key找表
        if MonthpassawardLocalData.tab[tonumber(key)][2] > index then
            index = MonthpassawardLocalData.tab[tonumber(key)][2]
        end
    end
    if index > 34 then
        index = 34
    end
    return index
end
function M:OnClose()
    MgrTimer.Cancel("TaskRefresh")
    MgrTimer.Cancel("Shengyushijian")
    MgrTimer.Cancel("FreshLastPassesReward")
    TaskControl.UpdatePanel = nil
    PassportViewModel.ReceivedCallBack = nil
    PassportViewModel.InitPassport = nil
end
function M:OnBackKey()
    if self.GoumaidengjiPanel().gameObject.activeSelf then
        self.GoumaidengjiPanel().gameObject:SetActive(false)
        return
    end
    if self.ZiyuanyulanPanel().gameObject.activeSelf then
        self.ZiyuanyulanPanel().gameObject:SetActive(false)
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M