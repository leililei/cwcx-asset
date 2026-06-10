-- Code Auto Create Begin
local M = Class('PointRewardsItem2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PointRewardsItem2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardRankImg','RewardRankImg',2},{'img_raregold','RewardRankImg/Ui_TX_038/img_raregold',2},{'img_rareblue','RewardRankImg/Ui_TX_038/img_rareblue',2},{'img_rarepurple','RewardRankImg/Ui_TX_038/img_rarepurple',2},{'RewardIconImg','RewardIconImg',2},{'Img_ItemCountBg','Img_ItemCountBg',2},{'TimeCountDownPanel','TimeCountDownPanel',2},{'Img_Yilingqudi','IsTake/Img_Yilingqudi',2},
        -- Text 列表
        {'ItemCountText','Img_ItemCountBg/ItemCountText',3},{'CountDownText','TimeCountDownPanel/CountDownText',3},{'Text_Yilingqu','IsTake/Text_Yilingqu',3},
        -- UITemplate 列表
        {'PointRewardsItem2','/',10},
        -- RawImage 列表
        {'IsTake','IsTake',15},
    }
end
-- Code Auto Create End
function M:OnInit()

end

---@param pData table StormPointData:GetRewards中定义的data
function M:OnUpdateUI(pData)
    --if pData.isOnceAdopt == true then
        self.Img_ItemCountBg().gameObject:SetActive(true)
        self.ItemCountText().text = pData.count
    --else
    --    self.Img_ItemCountBg().gameObject:SetActive(false)
    --end
    --self.ItemCountText().text = pData.count
    ---设置品质
    MgrRes.LoadSprite(self.RewardRankImg(),"Item/Rank/ItemRank_"..pData.config.quality)
    ---边框特效
    if pData.config.quality == 1 or pData.config.quality == 2 then
        self.RewardRankImg().transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
    elseif pData.config.quality == 3 then
        self.RewardRankImg().transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
    elseif pData.config.quality == 4 then
        self.RewardRankImg().transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
    end

    self.RewardRankImg().transform:GetChild(0)
    ---设置图标
    MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..pData.config.icon)
    self.TimeCountDownPanel().gameObject:SetActive(pData.isOnceAdopt)
    ---是否为挑战
    if pData.isTower then
        self.IsTake().gameObject:SetActive(pData.isTake)
        self.Text_Jianglishu().text = string.format(MgrLanguageData.GetLanguageByKey("pointrewardsitem_challenge"),pData.towerIdx)
    else
        self.IsTake().gameObject:SetActive(pData.isRec)
    end

    UIEvent.LuaClick(self.ObjRoot, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(pData.id, tonumber(pData.type))
        MgrUI.Pop(UID.ItemDetailPop_UI, { item, false, function() end }, true)
    end))
end

return M