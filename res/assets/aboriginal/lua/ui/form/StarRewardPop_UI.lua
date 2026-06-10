-- Code Auto Create Begin
local M = Class('StarRewardPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.StarRewardPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[StarRewardPop_UI].prefab'
    self.Name = 'Form[StarRewardPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','Ani/BlurMask',2},{'Img_Tanchuangdi','Ani/Img_Tanchuangdi',2},{'Img_Xian2','Ani/Img_Tanchuangdi/Img_Xian2',2},{'Img_Biaotixian','Ani/Img_Tanchuangdi/Img_Biaotixian',2},{'Img_Jianglidi','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Jianglidi',2},{'Img_Chengguang(kelingqu)','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Chengguang(kelingqu)',2},{'Btn_Get','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Btn_Get',2},{'Btn_NotGet','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Btn_NotGet',2},{'Img_Kuang1','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1',2},{'RewardItem_1','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1',2},{'RewardRankImg','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/RewardRankImg',2},{'RewardIconImg','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/RewardIconImg',2},{'StarPanel','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel',2},{'EmptyStarRoot','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot',2},{'EmptyStar','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (5)',2},{'ItemStarRoot','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/StarPanel/ItemStarPrefab',2},{'Img_ItemCountBg','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/Img_ItemCountBg',2},{'Img_Kuang2','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2',2},{'RewardItem_2','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2',2},{'RewardRankImg01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/RewardRankImg',2},{'RewardIconImg01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/RewardIconImg',2},{'StarPanel01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel',2},{'EmptyStarRoot01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot',2},{'EmptyStar01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (5)',2},{'ItemStarRoot01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/StarPanel/ItemStarPrefab',2},{'Img_ItemCountBg01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/Img_ItemCountBg',2},{'Img_Xingshudi','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Xingshudi',2},{'Img_Tiaojianicon','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Tiaojianicon',2},{'Img_Reward','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Reward',2},{'Panel_Take','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take',2},{'Img_Yilinquzhezhao','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)/Img_Yilinquzhezhao',2},{'Img_Yilingqudi','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)/Img_Yilingqudi',2},{'Img_Yilinquzhezhao1','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)/Img_Yilinquzhezhao1',2},{'Img_Yilingqudi1','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)/Img_Yilingqudi1',2},{'Img_Yilingqudi01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/Btn_Yilingqu/Img_Yilingqudi',2},{'Img_Jianglidi01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Jianglidi',2},{'Img_Chengguang(kelingqu)01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Chengguang(kelingqu)',2},{'Btn_Get01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Btn_Get',2},{'Btn_NotGet01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Btn_NotGet',2},{'Img_Kuang101','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1',2},{'RewardItem_101','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1',2},{'RewardRankImg02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/RewardRankImg',2},{'RewardIconImg02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/RewardIconImg',2},{'StarPanel02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel',2},{'EmptyStarRoot02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot',2},{'EmptyStar02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (5)',2},{'ItemStarRoot02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/ItemStarRoot',2},{'ItemStarPrefab02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/StarPanel/ItemStarPrefab',2},{'Img_ItemCountBg02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/Img_ItemCountBg',2},{'Img_Kuang201','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2',2},{'RewardItem_201','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2',2},{'RewardRankImg03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/RewardRankImg',2},{'RewardIconImg03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/RewardIconImg',2},{'StarPanel03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel',2},{'EmptyStarRoot03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot',2},{'EmptyStar03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (5)',2},{'ItemStarRoot03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/StarPanel/ItemStarPrefab',2},{'Img_ItemCountBg03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/Img_ItemCountBg',2},{'Img_Xingshudi01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Xingshudi',2},{'Img_Tiaojianicon01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Tiaojianicon',2},{'Img_Reward01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Reward',2},{'Panel_Take01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take',2},{'Img_Yilinquzhezhao01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)/Img_Yilinquzhezhao',2},{'Img_Yilingqudi02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)/Img_Yilingqudi',2},{'Img_Yilinquzhezhao2','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)/Img_Yilinquzhezhao2',2},{'Img_Yilingqudi2','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)/Img_Yilingqudi2',2},{'Img_Yilingqudi03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/Btn_Yilingqu/Img_Yilingqudi',2},{'Img_Jianglidi02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Jianglidi',2},{'Img_Chengguang(kelingqu)02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Chengguang(kelingqu)',2},{'Btn_Get02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Btn_Get',2},{'Btn_NotGet02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Btn_NotGet',2},{'Img_Kuang102','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1',2},{'RewardItem_102','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1',2},{'RewardRankImg04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/RewardRankImg',2},{'RewardIconImg04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/RewardIconImg',2},{'StarPanel04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel',2},{'EmptyStarRoot04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot',2},{'EmptyStar04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/EmptyStarRoot/EmptyStar (5)',2},{'ItemStarRoot04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/ItemStarRoot',2},{'ItemStarPrefab04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/StarPanel/ItemStarPrefab',2},{'Img_ItemCountBg04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/Img_ItemCountBg',2},{'Img_Kuang202','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2',2},{'RewardItem_202','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2',2},{'RewardRankImg05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/RewardRankImg',2},{'RewardIconImg05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/RewardIconImg',2},{'StarPanel05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel',2},{'EmptyStarRoot05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot',2},{'EmptyStar05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/EmptyStarRoot/EmptyStar (5)',2},{'ItemStarRoot05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/StarPanel/ItemStarPrefab',2},{'Img_ItemCountBg05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/Img_ItemCountBg',2},{'Img_Xingshudi02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Xingshudi',2},{'Img_Tiaojianicon02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Tiaojianicon',2},{'Img_Reward02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Reward',2},{'Panel_Take02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take',2},{'Img_Yilinquzhezhao02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)/Img_Yilinquzhezhao',2},{'Img_Yilingqudi04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)/Img_Yilingqudi',2},{'Img_Yilinquzhezhao3','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)/Img_Yilinquzhezhao3',2},{'Img_Yilingqudi3','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)/Img_Yilingqudi3',2},{'Img_Yilingqudi05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/Btn_Yilingqu/Img_Yilingqudi',2},{'Img_Xian1','Ani/Img_Tanchuangdi/Img_Xian1',2},
        -- RawImage 列表
        {'Reward_1','Ani/Img_Tanchuangdi/RewardContent/Reward_1',15},{'IsTake(1)','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)',15},{'IsTake(1)01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)',15},{'Reward_2','Ani/Img_Tanchuangdi/RewardContent/Reward_2',15},{'IsTake(1)02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)',15},{'IsTake(1)03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)',15},{'Reward_3','Ani/Img_Tanchuangdi/RewardContent/Reward_3',15},{'IsTake(1)04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)',15},{'IsTake(1)05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)',15},
        -- TextMeshProUGUI 列表
        {'Text_Get','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Btn_Get/Text_Get',20},{'Text_NotGet','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Btn_NotGet/Text_NotGet',20},{'ItemCountText','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang1/RewardItem_1/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Kuang2/RewardItem_2/Img_ItemCountBg/ItemCountText',20},{'Text_Star','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Img_Xingshudi/group1/Text_Star',20},{'Text_Xingji','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Text_Xingji',20},{'Text_Yilingqu','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)/Text_Yilingqu',20},{'Text_Yilingqu1','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/IsTake (1)/Text_Yilingqu1',20},{'Text_Yiwancheng','Ani/Img_Tanchuangdi/RewardContent/Reward_1/Panel_Take/Btn_Yilingqu/Text_Yiwancheng',20},{'Text_Get01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Btn_Get/Text_Get',20},{'Text_NotGet01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Btn_NotGet/Text_NotGet',20},{'ItemCountText02','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang1/RewardItem_1/Img_ItemCountBg/ItemCountText',20},{'ItemCountText03','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Kuang2/RewardItem_2/Img_ItemCountBg/ItemCountText',20},{'Text_Star01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Img_Xingshudi/group1/Text_Star',20},{'Text_Xingji01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Text_Xingji',20},{'Text_Yilingqu01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)/Text_Yilingqu',20},{'Text_Yilingqu2','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/IsTake (1)/Text_Yilingqu2',20},{'Text_Yiwancheng01','Ani/Img_Tanchuangdi/RewardContent/Reward_2/Panel_Take/Btn_Yilingqu/Text_Yiwancheng',20},{'Text_Get02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Btn_Get/Text_Get',20},{'Text_NotGet02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Btn_NotGet/Text_NotGet',20},{'ItemCountText04','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang1/RewardItem_1/Img_ItemCountBg/ItemCountText',20},{'ItemCountText05','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Kuang2/RewardItem_2/Img_ItemCountBg/ItemCountText',20},{'Text_Star02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Img_Xingshudi/group1/Text_Star',20},{'Text_Xingji02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Text_Xingji',20},{'Text_Yilingqu02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)/Text_Yilingqu',20},{'Text_Yilingqu3','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/IsTake (1)/Text_Yilingqu3',20},{'Text_Yiwancheng02','Ani/Img_Tanchuangdi/RewardContent/Reward_3/Panel_Take/Btn_Yilingqu/Text_Yiwancheng',20},{'Text_Title','Ani/Img_Tanchuangdi/Text_Title',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))

    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    self.rewards = {
        self.Reward_1().transform,
        self.Reward_2().transform,
        self.Reward_3().transform,
    }
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

---更新显示
function M:OnShow(args)
    ---@type StormScrollData
    self.pData = args[1]
    self.callback = args[2]
    local index = 0
    local maxStar,curStar = self.pData:GetMaxBoxStar()
    for id, v in pairs(self.pData.box) do
        index = (id - 1) % 3 + 1
        if index > 3 then
            break
        end
        local btnGet = self.rewards[index]:Find("Btn_Get").gameObject
        local panelTake = self.rewards[index]:Find("Panel_Take").gameObject
        btnGet:SetActive(not v.isGet and curStar >= v.star)
        self.rewards[index]:Find("Btn_NotGet").gameObject:SetActive(not v.isGet and curStar < v.star)
        self.rewards[index]:Find("Panel_Take").gameObject:SetActive(v.isGet)
        local a =  self.rewards[index]:Find("Img_Xingshudi/group1/Text_Star")
        print(a)
        self.rewards[index]:Find("Img_Xingshudi/group1/Text_Star"):GetComponent("TextMeshProUGUI").text = string.format("<color=#3FFFE6>%s</color><size=40>/%s</size>",curStar,v.star)
        ---更新物品显示
        local res = string.split(v.reward,",")
        for i = 1, #res do
            if i > 2 then
                Log.Error("不接受大于2个奖励")
                break
            end
            local itemData = Global.GetLocalDataByGoods(res[i])
            local goods = string.split(res[i],"_")
            local itemObj = self.rewards[index]:Find("Img_Kuang"..i.."/RewardItem_"..i)
            ---点击奖品弹出详情
            UIEvent.LuaClick(itemObj.gameObject,function()
                self:ShowRewardInfo(itemData)
            end)
            ---更换icon
            MgrRes.LoadSprite(itemObj:Find("RewardIconImg"):GetComponent("Image"),"Item/"..itemData.icon)
            ---设置数量
            itemObj:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI").text = JNStrTool.numberAbbr(goods[3])
            ---更新边框
            MgrRes.LoadSprite(itemObj:Find("RewardRankImg"):GetComponent("Image"),"Item/Rank/ItemRank_"..itemData.quality)
            ---更新星级
            local itemStarPrefab = itemObj:Find("StarPanel/ItemStarPrefab").gameObject
            local itemStarRoot = itemObj:Find("StarPanel/ItemStarRoot").transform
            if itemData.itemstar > 0 then
                for i = 1, itemData.itemstar do
                    GameObject.Instantiate(itemStarPrefab,itemStarRoot,false)
                end
            else
                itemStarRoot.gameObject:SetActive(false)
            end
            itemObj:Find("StarPanel").gameObject:SetActive(false)
        end
        ---注册领取按钮
        UIEvent.LuaClick(btnGet,function()
            ---领取条件是否达成
            if curStar >= v.star and not v.isGet then
                ---领取章节宝箱
                local tab = { boxID = {id} }
                local bytes = assert(pb.encode('PBClient.ClientGetScrollBoxREQ',tab))
                ItemControl.AckError = true
                ---发送领取宝箱请求
                MgrNet.SendReq(MID.CLIENT_GET_SCROLL_BOX_REQ,bytes,0,nil, function(buffer,tag)
                    local tab = assert(pb.decode('PBClient.ClientGetScrollBoxACK',buffer))
                    print(tab.errNo)
                end , function(buffer,tag)
                    local recNtf= assert(pb.decode('PBClient.ClientGetScrollBoxNTF',buffer))
                    ---更新章节宝箱
                    StormControl.PushScrollBox(recNtf.boxID)
                    ---更新道具
                    ItemControl.PushGroupItemData(recNtf.goods,ItemControl.PushEnum.add)
                    ---检查宝箱红点
                    StormControl.WhetherUnReceiveBox()
                    ---显示奖励弹窗
                    MgrUI.Pop(UID.ItemAchievePop_UI,{recNtf.goods},true)
                    if self.callback then
                        self.callback()
                    end
                    ---更新按钮
                    panelTake:SetActive(true)
                    btnGet:SetActive(false)
                end)
            else
                UnityEngine.DebugEx.LogError("领取条件不足")
            end
            --self:ClosePop()
        end)
    end
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

function M:ShowRewardInfo(data)
    local item = ItemControl.GetItemByID(data.id)
    MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
end
return M