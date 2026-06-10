-- Code Auto Create Begin
local M = Class('EventMissonItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/EventMissonItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_NoIntegralBg','Img_BgDi/Img_NoIntegralBg',2},{'Img_IntegralBg','Img_BgDi/Img_IntegralBg',2},{'Huoyueduicon2','Img_BgDi/Img_IntegralBg/Huoyueduicon2',2},{'Img_CanReceivebg','Img_CanReceivebg',2},{'Btu_Receive','Btu_Receive',2},{'Img_Lingqudi','Btu_Receive/Img_Lingqudi',2},{'Btu_GoTo','Btu_GoTo',2},{'Img_Qianwangdi','Btu_GoTo/Img_Qianwangdi',2},{'Img_Jiantou(huang)','Btu_GoTo/Img_Jiantou(huang)',2},{'Btu_Completed','Btu_Completed',2},{'Img_Yiwanchengdi','Btu_Completed/Img_Yiwanchengdi',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItemPreFab/Img_Received',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'Img_TaskProgressBarBg','Img_TaskProgressBarBg',2},{'Img_TaskProgressBar','Img_TaskProgressBarBg/Img_TaskProgressBar',2},{'Img_IntegralDi','Img_IntegralDi',2},{'Img_IntegralKuang','Img_IntegralDi/Img_IntegralKuang',2},{'Img_Des','Img_Des',2},{'CompletedPanel','CompletedPanel',2},{'Img_CompletedDi','CompletedPanel/Img_CompletedDi',2},
        -- Text 列表
        {'Text_Lingqu','Btu_Receive/Text_Lingqu',3},{'Text_Qianwang','Btu_GoTo/Text_Qianwang',3},{'Text_Yiwancheng','Btu_Completed/Text_Yiwancheng',3},{'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',3},{'Text_Yilingqu2','RewardItemPreFab/Img_Received/Text_Yilingqu2',3},{'Text_TaskTitle','Img_TaskProgressBarBg/Text_TaskTitle',3},{'Text_TaskProgress','Img_TaskProgressBarBg/Text_TaskProgress',3},{'Text_IntegralCount','Img_IntegralDi/Text_IntegralCount',3},{'Text_Completed','CompletedPanel/Img_CompletedDi/Text_Completed',3},
        -- UITemplate 列表
        {'EventMissonItem','/',10},
    }
end
-- Code Auto Create End
return M