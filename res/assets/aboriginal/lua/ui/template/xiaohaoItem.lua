-- Code Auto Create Begin
local M = Class('xiaohaoItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/xiaohaoItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'xiaohaoItem','/',2},{'RewardRankImg','RewardRankImg',2},{'RewardIconImg','RewardIconImg',2},{'Img_ItemCountPivot','Img_ItemCountPivot',2},{'Img_ItemCountBg','Img_ItemCountPivot/Img_ItemCountBg',2},
        -- UITemplate 列表
        {'xiaohaoItem01','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','Img_ItemCountPivot/Img_ItemCountBg/ItemCountText',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type SynthesisData
    self.pData = pData[1]
    self.matData = self.pData:GetSynthesisCost()[1]
    self.parent = pData[2]

    ---图标
    MgrRes.LoadSprite(self.RewardIconImg(),self.matData.icon)
    ---外框
    MgrRes.LoadSprite(self.RewardRankImg(),self.matData.iconFrame)
    ---数量
    self.ItemCountText().text = self.pData.SynthesisCount1
end

return M