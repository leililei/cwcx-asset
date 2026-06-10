-- Code Auto Create Begin
local M = Class('SummerTaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SummerTaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Bg','Img_Bg',2},{'Img_CanReceivebg','Img_CanReceivebg',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItemPreFab/Img_Received',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'Img_TaskProgressBarBg','Img_TaskProgressBarBg',2},{'Img_TaskProgressBar','Img_TaskProgressBarBg/Img_TaskProgressBar',2},{'Img_IntegralDi','Img_IntegralDi',2},{'Img_IntegralKuang','Img_IntegralDi/Img_IntegralKuang',2},{'CompletedPanel','CompletedPanel',2},{'Img_CompletedDi','CompletedPanel/Img_CompletedDi',2},
        -- UITemplate 列表
        {'SummerTaskItem','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_TaskTitle','Text_TaskTitle',20},{'Text_TaskProgress','Text_TaskProgress',20},{'Text_IntegralCount','Img_IntegralDi/Text_IntegralCount',20},{'Text_Completed','CompletedPanel/Img_CompletedDi/Text_Completed',20},
    }
end
-- Code Auto Create End
return M