-- Code Auto Create Begin
local M = Class('BossItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BossItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardRankImg','RewardRankImg',2},{'img_raregold','RewardRankImg/Ui_TX_038/img_raregold',2},{'img_rareblue','RewardRankImg/Ui_TX_038/img_rareblue',2},{'img_rarepurple','RewardRankImg/Ui_TX_038/img_rarepurple',2},{'RewardIconImg','RewardIconImg',2},{'Img_ItemCountBg','Img_ItemCountBg',2},{'TimeCountDownPanel','TimeCountDownPanel',2},{'Img_Yilingqudi','IsTake/Img_Yilingqudi',2},
        -- Text 列表
        {'ItemCountText','Img_ItemCountBg/ItemCountText',3},{'CountDownText','TimeCountDownPanel/CountDownText',3},{'Text_Yilingqu','IsTake/Text_Yilingqu',3},
        -- UITemplate 列表
        {'BossItem','/',10},
        -- RawImage 列表
        {'IsTake','IsTake',15},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type ItemData
    ---@type HideItemData
    self.data = pData[1][1]    --奖励数据
    self.count = pData[1][2]   --奖励数量
    self.parent = pData[2]
    self.index = pData[3]      --顺序
    --图片
    if string.split(self.data.icon,"/")[1] ~= "Item" then
        self.data.icon = "Item/" .. self.data.icon
    end
    MgrRes.LoadSprite(self.RewardIconImg(),self.data.icon)
    --数量
    self.ItemCountText().text = self.count
    if self.index <= 2 then
        self.TimeCountDownPanel().gameObject:SetActive(true)
    else
        self.TimeCountDownPanel().gameObject:SetActive(false)
    end
     --判断三星显示已领取
     self.IsTake().gameObject:SetActive( StormViewModel.CurPointData.star == 7 and self.index <= 2)
end

return M