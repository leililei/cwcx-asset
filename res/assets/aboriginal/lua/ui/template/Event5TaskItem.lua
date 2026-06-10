-- Code Auto Create Begin
local M = Class('Event5TaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Event5TaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'MissionBg','MissionBg',2},{'Img_CanReceivebg','Img_CanReceivebg',2},{'Img_GouIcon','Img_CanReceivebg/Img_GouIcon',2},{'RewardItem','RewardItem',2},{'RewardRankImg','RewardItem/RewardRankImg',2},{'RewardIconImg','RewardItem/RewardIconImg',2},{'Img_ItemCountBg','RewardItem/Img_ItemCountBg',2},{'StarPanel','RewardItem/StarPanel',2},{'EmptyStarRoot','RewardItem/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItem/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItem/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItem/Img_Received',2},{'RewardPanel','RewardPanel',2},{'Img_TaskProgressBarBg','Img_TaskProgressBarBg',2},{'Img_TaskProgressBar','Img_TaskProgressBarBg/Img_TaskProgressBar',2},{'CompletedPanel','CompletedPanel',2},{'Img_GouIcon01','CompletedPanel/Img_GouIcon',2},{'Img_Cleared','CompletedPanel/Img_Cleared',2},{'Img_Completeddi','CompletedPanel/Img_Completeddi',2},
        -- UITemplate 列表
        {'Event5TaskItem','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardItem/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','RewardItem/Img_Received/Text_Yilingqu2',20},{'Text_TaskTitle','Text_TaskTitle',20},{'Text_TaskProgress','Text_TaskProgress',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItem().gameObject:SetActive(false)

    self.ItemView = EventTaskItemView.New(self.Text_TaskTitle(), self.Img_TaskProgressBar(), self.Text_TaskProgress(), self.CompletedPanel(), self.Img_CanReceivebg(),
            self.RewardItem(), self.RewardPanel(), self.MissionBg())
end

function M:OnUpdateUI(pData)
    self.ItemView:OnUpdateUI(pData)
end
return M
