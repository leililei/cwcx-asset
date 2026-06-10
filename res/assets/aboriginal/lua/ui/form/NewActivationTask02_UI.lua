-- Code Auto Create Begin
local M = Class('NewActivationTask02_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewActivationTask02_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewActivationTask02_UI].prefab'
    self.Name = 'Form[NewActivationTask02_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Btn_Return','UpperLeftPanel/Btn_Return',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'SwitchPanel','SwitchPanel',2},{'Tog_Day','SwitchPanel/Content/Tog_Day',2},{'Normal','SwitchPanel/Content/Tog_Day/Normal',2},{'weixuanzhongdi','SwitchPanel/Content/Tog_Day/Normal/weixuanzhongdi',2},{'Highlight','SwitchPanel/Content/Tog_Day/Highlight',2},{'xuanzhongdi','SwitchPanel/Content/Tog_Day/Highlight/xuanzhongdi',2},{'RedDotIcon','SwitchPanel/Content/Tog_Day/RedDotIcon',2},{'Tog_Week','SwitchPanel/Content/Tog_Week',2},{'Normal01','SwitchPanel/Content/Tog_Week/Normal',2},{'weixuanzhongdi01','SwitchPanel/Content/Tog_Week/Normal/weixuanzhongdi',2},{'Highlight01','SwitchPanel/Content/Tog_Week/Highlight',2},{'xuanzhongdi01','SwitchPanel/Content/Tog_Week/Highlight/xuanzhongdi',2},{'RedDotIcon01','SwitchPanel/Content/Tog_Week/RedDotIcon',2},{'Tog_Month','SwitchPanel/Content/Tog_Month',2},{'Normal02','SwitchPanel/Content/Tog_Month/Normal',2},{'weixuanzhongdi02','SwitchPanel/Content/Tog_Month/Normal/weixuanzhongdi',2},{'Highlight02','SwitchPanel/Content/Tog_Month/Highlight',2},{'xuanzhongdi02','SwitchPanel/Content/Tog_Month/Highlight/xuanzhongdi',2},{'RedDotIcon02','SwitchPanel/Content/Tog_Month/RedDotIcon',2},{'Img_Xian','RightPanel/Img_Xian',2},{'TaskContent','RightPanel/VFXMask/TaskScroll/TaskContent',2},{'IntegralPanel','IntegralPanel',2},{'Img_RefreshDi','IntegralPanel/IntegralCountPanel/Img_RefreshDi',2},{'IntegralTitle','IntegralPanel/IntegralCountPanel/IntegralTitle',2},{'Process4','IntegralPanel/IntegralRewardPanel/Process4',2},{'RewardItemPreFab','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab',2},{'RewardRankImg','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/Img_Received',2},{'Yilingqu','IntegralPanel/IntegralRewardPanel/Process4/Reward1/Yilingqu',2},{'Kelingqu','IntegralPanel/IntegralRewardPanel/Process4/Reward1/Kelingqu',2},{'RedDotIcon03','IntegralPanel/IntegralRewardPanel/Process4/Reward1/Kelingqu/RedDotIcon',2},{'Click','IntegralPanel/IntegralRewardPanel/Process4/Reward1/Click',2},{'RewardItemPreFab01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab',2},{'RewardRankImg01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar06','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar07','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar08','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar09','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar10','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar11','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/Img_Received',2},{'Yilingqu01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/Yilingqu',2},{'Kelingqu01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/Kelingqu',2},{'RedDotIcon04','IntegralPanel/IntegralRewardPanel/Process4/Reward2/Kelingqu/RedDotIcon',2},{'Click01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/Click',2},{'RewardItemPreFab02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab',2},{'RewardRankImg02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar12','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar13','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar14','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar15','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar16','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar17','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/Img_Received',2},{'Yilingqu02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/Yilingqu',2},{'Kelingqu02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/Kelingqu',2},{'RedDotIcon05','IntegralPanel/IntegralRewardPanel/Process4/Reward3/Kelingqu/RedDotIcon',2},{'Click02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/Click',2},{'Img_Process3','IntegralPanel/IntegralRewardPanel/Process4/Img_Process3',2},{'Reward3Root','IntegralPanel/IntegralRewardPanel/Process4/Reward3Root',2},{'Process3','IntegralPanel/IntegralRewardPanel/Process3',2},{'RewardItemPreFab03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab',2},{'RewardRankImg03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar18','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar19','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar20','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar21','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar22','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar23','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/Img_Received',2},{'Yilingqu03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/Yilingqu',2},{'Kelingqu03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/Kelingqu',2},{'RedDotIcon06','IntegralPanel/IntegralRewardPanel/Process3/Reward1/Kelingqu/RedDotIcon',2},{'Click03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/Click',2},{'RewardItemPreFab04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab',2},{'RewardRankImg04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar24','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar25','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar26','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar27','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar28','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar29','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/Img_Received',2},{'Yilingqu04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/Yilingqu',2},{'Kelingqu04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/Kelingqu',2},{'RedDotIcon07','IntegralPanel/IntegralRewardPanel/Process3/Reward2/Kelingqu/RedDotIcon',2},{'Click04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/Click',2},{'Img_Process301','IntegralPanel/IntegralRewardPanel/Process3/Img_Process3',2},{'Reward3Root01','IntegralPanel/IntegralRewardPanel/Process3/Reward3Root',2},{'Process2','IntegralPanel/IntegralRewardPanel/Process2',2},{'RewardItemPreFab05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab',2},{'RewardRankImg05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar30','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar31','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar32','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar33','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar34','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar35','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/Img_Received',2},{'Yilingqu05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/Yilingqu',2},{'Kelingqu05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/Kelingqu',2},{'RedDotIcon08','IntegralPanel/IntegralRewardPanel/Process2/Reward1/Kelingqu/RedDotIcon',2},{'Click05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/Click',2},{'Img_Process2','IntegralPanel/IntegralRewardPanel/Process2/Img_Process2',2},{'Reward3Root02','IntegralPanel/IntegralRewardPanel/Process2/Reward3Root',2},{'IntegralReward','IntegralPanel/IntegralRewardPanel/IntegralReward',2},{'Btn_UnAllReceive','IntegralPanel/Btn_UnAllReceive',2},{'Img_OCReceivedi2','IntegralPanel/Btn_UnAllReceive/Img_OCReceivedi2',2},{'Btn_AllReceive','IntegralPanel/Btn_AllReceive',2},{'Img_OCReceivedi1','IntegralPanel/Btn_AllReceive/Img_OCReceivedi1',2},
        -- Slider 列表
        {'Process401','IntegralPanel/IntegralRewardPanel/Process4',5},{'Process301','IntegralPanel/IntegralRewardPanel/Process3',5},{'Process201','IntegralPanel/IntegralRewardPanel/Process2',5},
        -- UITemplate 列表
        {'TaskItem','RightPanel/VFXMask/TaskScroll/TaskItem',10},
        -- Toggle 列表
        {'Tog_Day01','SwitchPanel/Content/Tog_Day',13},{'Tog_Week01','SwitchPanel/Content/Tog_Week',13},{'Tog_Month01','SwitchPanel/Content/Tog_Month',13},
        -- RawImage 列表
        {'TaskScroll','RightPanel/VFXMask/TaskScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','RightPanel/VFXMask/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'EnText','SwitchPanel/Content/Tog_Day/Normal/EnText',20},{'CNText','SwitchPanel/Content/Tog_Day/Normal/CNText',20},{'EnText01','SwitchPanel/Content/Tog_Day/Highlight/EnText',20},{'CNText01','SwitchPanel/Content/Tog_Day/Highlight/CNText',20},{'EnText02','SwitchPanel/Content/Tog_Week/Normal/EnText',20},{'CNText02','SwitchPanel/Content/Tog_Week/Normal/CNText',20},{'EnText03','SwitchPanel/Content/Tog_Week/Highlight/EnText',20},{'CNText03','SwitchPanel/Content/Tog_Week/Highlight/CNText',20},{'EnText04','SwitchPanel/Content/Tog_Month/Normal/EnText',20},{'CNText04','SwitchPanel/Content/Tog_Month/Normal/CNText',20},{'EnText05','SwitchPanel/Content/Tog_Month/Highlight/EnText',20},{'CNText05','SwitchPanel/Content/Tog_Month/Highlight/CNText',20},{'Text_RefreshTime','IntegralPanel/IntegralCountPanel/Img_RefreshDi/Text_RefreshTime',20},{'Text_IntegralMax','IntegralPanel/IntegralCountPanel/Text_IntegralMax',20},{'Text_CurIntegral','IntegralPanel/IntegralCountPanel/Text_CurIntegral',20},{'Text_IntegralTitle','IntegralPanel/IntegralCountPanel/IntegralTitle/Text_IntegralTitle',20},{'ItemCountText','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','IntegralPanel/IntegralRewardPanel/Process4/Reward1/RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Score','IntegralPanel/IntegralRewardPanel/Process4/Reward1/Text_Score',20},{'Text_Yilingqu','IntegralPanel/IntegralRewardPanel/Process4/Reward1/Yilingqu/Text_Yilingqu',20},{'Text_Kelingqu','IntegralPanel/IntegralRewardPanel/Process4/Reward1/Kelingqu/Text_Kelingqu',20},{'ItemCountText01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu201','IntegralPanel/IntegralRewardPanel/Process4/Reward2/RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Score01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/Text_Score',20},{'Text_Yilingqu01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/Yilingqu/Text_Yilingqu',20},{'Text_Kelingqu01','IntegralPanel/IntegralRewardPanel/Process4/Reward2/Kelingqu/Text_Kelingqu',20},{'ItemCountText02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu202','IntegralPanel/IntegralRewardPanel/Process4/Reward3/RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Score02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/Text_Score',20},{'Text_Yilingqu02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/Yilingqu/Text_Yilingqu',20},{'Text_Kelingqu02','IntegralPanel/IntegralRewardPanel/Process4/Reward3/Kelingqu/Text_Kelingqu',20},{'ItemCountText03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu203','IntegralPanel/IntegralRewardPanel/Process3/Reward1/RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Score03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/Text_Score',20},{'Text_Yilingqu03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/Yilingqu/Text_Yilingqu',20},{'Text_Kelingqu03','IntegralPanel/IntegralRewardPanel/Process3/Reward1/Kelingqu/Text_Kelingqu',20},{'ItemCountText04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu204','IntegralPanel/IntegralRewardPanel/Process3/Reward2/RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Score04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/Text_Score',20},{'Text_Yilingqu04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/Yilingqu/Text_Yilingqu',20},{'Text_Kelingqu04','IntegralPanel/IntegralRewardPanel/Process3/Reward2/Kelingqu/Text_Kelingqu',20},{'ItemCountText05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu205','IntegralPanel/IntegralRewardPanel/Process2/Reward1/RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Score05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/Text_Score',20},{'Text_Yilingqu05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/Yilingqu/Text_Yilingqu',20},{'Text_Kelingqu05','IntegralPanel/IntegralRewardPanel/Process2/Reward1/Kelingqu/Text_Kelingqu',20},{'Text_IntegralReward','IntegralPanel/IntegralRewardPanel/IntegralReward/Text_IntegralReward',20},{'Text_OCReceive2','IntegralPanel/Btn_UnAllReceive/Text_OCReceive2',20},{'Text_OCReceive1','IntegralPanel/Btn_AllReceive/Text_OCReceive1',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ActivationTaskViewModel.ReceivedCallBack = Handle(self,self.UpdataPanel)
    self.CanReceiveCount = 0
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化顶部toggle
    self:InitTopTypePanel()
    ---初始化按钮
    self:InitButton()
    ---初始化计时
    self:InitClock()
    TaskControl.UpdatePanel = Handle(self,self.UpdataPanel)
end

function M:OnBackShow()
    self:UpdataPanel()
end

function M:OnShowFinish()
    NoviceViewModel.CheckFirstGuide(41)
end
---注册滑块
function M:RegisterLoopScroll()
    --self.IntegralScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.TaskCellItem))
end
---左侧积分回调
--function M:CellItem(trans,idx)
--    trans:GetComponent("UITemplate"):SetData({self.CurIntegralLoopList[idx]})
--end
---任务回调
function M:TaskCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurTaskLoopList[idx],self})
end
---设置下方积分数据
function M:ReloadIntegralData(offset)
    ---获取当前loop数据
    ---@type IntegralTaskData[]
    self.CurIntegralLoopList = ActivationTaskViewModel.GetIntegralTask(self.CurSortType)

    self.sliders = {
        [1] = self.Process201(),
        [2] = self.Process301(),
        [3] = self.Process401()
    }



    --self.IntegralScroll01().totalCount = #self.CurIntegralLoopList
    --if offset then
    --    self.IntegralScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    --else
    --    self.IntegralScroll01():RefreshCells()              ---只刷新数据
    --end
end
---设置任务滑动数据
function M:ReloadTaskData(offset)
    ---获取当前loop数据
    ------@type IntegralTaskData[]
    self.CurTaskLoopList = ActivationTaskViewModel.GetDayTask(self.CurSortType + 1000)
    ---设置Loop数量
    self.TaskScroll01().totalCount = #self.CurTaskLoopList
    if offset then
        self.TaskScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.TaskScroll01():RefreshCells()              ---只刷新数据
    end
end
---初始化顶部toggle
function M:InitTopTypePanel()
    self.CurSortType = 1        ---当前排序类型(1每日,2每周，3每月)
    self.RoleIsRise = false
    ---排序器
    local sorts = {
        [1] = self.Tog_Day01().gameObject,
        [2] = self.Tog_Week01().gameObject,
        [3] = self.Tog_Month01().gameObject
    }
    local t_sort = self:FilterToggle(sorts,Handle(self,function(self,sort,isRise)
        if isRise then
            if self.CurSortType == sort and self.RoleIsRise == isRise then
                print("重复待处理2")
            end
            self.CanReceiveCount = 0
            self.CurSortType = sort
            self.RoleIsRise = isRise
            self:TurnOnToggle(sort)
            self:RefreshTime()
            self:ReloadIntegralData(0)
            self:ReloadTaskData(0)
            self:UpdataIntegralPanel()
        end
    end))
    self:UpdateRedDot()
    --self.TaskFilterToggle().gameObject:SetActive(false)
    ---默认排序
    t_sort[1].isOn = false
    t_sort[1].isOn = true
end
---创建标签
function M:FilterToggle(filters,callback)
    local toggles = {}
    self.RedDotObj = {}
    self.normals = {}
    self.highLights = {}
    for idx, toggle in ipairs(filters) do
        local togTrans = toggle:GetComponent("Toggle")
        local obj = togTrans.transform:Find("RedDotIcon").gameObject
        table.insert(self.RedDotObj,obj)
        Tools.ToggleValueChange(togTrans,function(...)
            callback(idx,...)
        end)
        toggles[idx] = togTrans
        self.normals[idx] = toggle.transform:Find("Normal").gameObject
        self.highLights[idx] = toggle.transform:Find("Highlight").gameObject
    end
    return toggles
end
function M:TurnOnToggle(index)
    for i,v in ipairs(self.normals) do
        if i == index then
            self.normals[i]:SetActive(false)
            self.highLights[i]:SetActive(true)
        else
            self.normals[i]:SetActive(true)
            self.highLights[i]:SetActive(false)
        end
    end
end
---初始化按钮
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self,ActivationTaskViewModel.Close))
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, Handle(self,function()
        HelpViewModel.Go(76)
    end))
    UIEvent.LuaClick(self.Btn_AllReceive().gameObject, function()
        self.CanReceiveCount = 0
        ActivationTaskViewModel.TaskPerform(self.CurSortType + 1000,0)
    end)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end
---更新积分
function M:UpdataIntegralPanel()
    local curScore = 0
    local maxValue = 0
    for i, v in pairs(self.CurIntegralLoopList) do
        if maxValue < v.num then
            maxValue = v.num
        end
    end
    self.Text_IntegralMax().text ="/"..maxValue
    if self.CurSortType == 1 then
        curScore = TaskControl.dayScore
        self.Text_CurIntegral().text = TaskControl.dayScore
    elseif self.CurSortType == 2 then
        curScore = TaskControl.weekScore
        self.Text_CurIntegral().text = TaskControl.weekScore
    elseif self.CurSortType == 3 then
        curScore = TaskControl.monthScore
        self.Text_CurIntegral().text = TaskControl.monthScore
    end
    ---打开slider
    local curSlider = nil
    for i,v in ipairs(self.sliders) do
        if i == #self.CurIntegralLoopList then
            v.gameObject:SetActive(true)
            curSlider = v
        else
            v.gameObject:SetActive(false)
        end
    end
    ---显示奖励
    for i = 1, #self.CurIntegralLoopList do
        local itemData = self.CurIntegralLoopList[i].reward[1]  ---只显示第一个物品
        local item = ItemData.New()
        item:PushData(itemData, ItemControl.PushEnum.none)
        local reward = curSlider.transform:Find("Reward"..i)
        local RewardItemPreFab = reward:Find("RewardItemPreFab")
        local RewardRankImg = RewardItemPreFab:Find("RewardRankImg"):GetComponent("Image")
        local RewardIconImg = RewardItemPreFab:Find("RewardIconImg"):GetComponent("Image")
        local ItemCountText = RewardItemPreFab:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        local EmptyStarRoot = RewardItemPreFab:Find("StarPanel/EmptyStarRoot").gameObject
        local ItemStarRoot = RewardItemPreFab:Find("StarPanel/ItemStarRoot").transform
        local ItemStarPrefab = RewardItemPreFab:Find("StarPanel/ItemStarPrefab").gameObject
        local Img_Received = RewardItemPreFab:Find("Img_Received").gameObject

        local Yilingqu = reward:Find("Yilingqu").gameObject
        local Kelingqu = reward:Find("Kelingqu").gameObject

        local Text_Score = reward:Find("Text_Score"):GetComponent("TextMeshProUGUI")

        local Click = reward:Find("Click").gameObject
        ---边框
        MgrRes.LoadSprite(RewardRankImg,item.iconFrame)
        ---图片
        MgrRes.LoadSprite(RewardIconImg,item.icon)
        ---数量
        ItemCountText.text = item.count
        ---星
        if item.star ~= 0 then
            EmptyStarRoot:SetActive(true)
            ItemStarRoot.gameObject:SetActive(true)
            for i = 1, item.star do
                GameObject.Instantiate(ItemStarPrefab,ItemStarRoot)
            end
        else
            EmptyStarRoot:SetActive(false)
            ItemStarRoot.gameObject:SetActive(false)
        end
        ItemStarPrefab:SetActive(false)
        ---已领取
        if self.CurIntegralLoopList[i].isComplete == 1 then
            Img_Received:SetActive(true)
        else
            Img_Received:SetActive(false)
        end
        ---可领取/已领取
        if self.CurIntegralLoopList[i].isComplete == 1 then
            Kelingqu:SetActive(false)
            Yilingqu:SetActive(true)
            Click:SetActive(false)
        else
            if curScore >= self.CurIntegralLoopList[i].num then --可领
                Kelingqu:SetActive(true)
                Yilingqu:SetActive(false)
                Click:SetActive(true)
            else                                                --不可领
                Kelingqu:SetActive(false)
                Yilingqu:SetActive(false)
                Click:SetActive(false)
            end
        end
        ---分数
        Text_Score.text = self.CurIntegralLoopList[i].num .. MgrLanguageData.GetLanguageByKey("ui_shejiao_text62")
        ---点击
        local taskid = self.CurIntegralLoopList[i].id
        UIEvent.LuaClick(Click,function()
            ActivationTaskViewModel.GetScoreReward(taskid)
        end)
        UIEvent.LuaClick(RewardIconImg.gameObject,function()
            local _item = ItemControl.GetItemByIdAndType(item.id,item.goodsType)
            MgrUI.Pop(UID.ItemDetailPop_UI,{ _item, false},true)
        end)
    end
    ---进度条
    curSlider.value = curScore / maxValue
end
function M:InitClock()
    MgrTimer.AddRepeat("TaskRefresh", 1, Handle(self,function()
        self:RefreshTime()
    end) , -1, nil)
end
function M:UpdataPanel()
    self.CanReceiveCount = 0
    self:UpdateRedDot()
    self:ReloadIntegralData(0)
    self:ReloadTaskData(0)
    self:UpdataIntegralPanel()
end
function M:UpdateRedDot()
    if RedDotControl.GetDotData("DayTask").State then
        self.RedDotObj[1]:SetActive(true)
    else
        self.RedDotObj[1]:SetActive(false)
    end
    if RedDotControl.GetDotData("WeekTask").State then
        self.RedDotObj[2]:SetActive(true)
    else
        self.RedDotObj[2]:SetActive(false)
    end
    if RedDotControl.GetDotData("MonthTask").State then
        self.RedDotObj[3]:SetActive(true)
    else
        self.RedDotObj[3]:SetActive(false)
    end
end
function M:RefreshTime()
    local type = "TODAY"
    if self.CurSortType == 1 then
        type = "TODAY"
    elseif self.CurSortType == 2 then
        type = "WEEK"
    elseif self.CurSortType == 3 then
        type = "MONTH"
    end
    local xx = ActivationTaskViewModel.GetLastTime(type)    --获得剩余时间
    local day = math.floor(xx/86400)
    local hour = math.floor(xx%86400/3600)
    local min = math.floor(xx%86400%3600/60)
    local sec = math.floor(xx%86400%3600%60)
    self.Text_RefreshTime().text =string.format(MgrLanguageData.GetLanguageByKey("newactivationtask_ui_refreshtime"),day,hour,min)
    if hour == 0 and min == 0 and sec == 0 then
        --清理所有任务数据
        --TaskControl.ClearAllTaskData()
        --刷新面板
        self:UpdataPanel()
    end
end


function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("TaskRefresh")
    ActivationTaskViewModel.ReceivedCallBack = nil
    TaskControl.UpdatePanel = nil
end

return M