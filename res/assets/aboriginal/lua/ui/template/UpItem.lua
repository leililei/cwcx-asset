-- Code Auto Create Begin
local M = Class('UpItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/Prefab/Template/UpItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardRankImg','wupin/RewardRankImg',2},{'RewardIconImg','wupin/RewardIconImg',2},{'StarPanel','wupin/StarPanel',2},{'ItemStarRoot','wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','wupin/StarPanel/ItemStarPrefab',2},{'HighLight','wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','wupin/Img_ItemCountBg',2},{'Img_Jiaobiao(xuanzhong)','wupin/Img_Jiaobiao(xuanzhong)',2},
        -- Text 列表
        {'ItemCountText','wupin/Img_ItemCountBg/ItemCountText',3},
        -- UITemplate 列表
        {'UpItem','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---初始化最大星级
    self.starHLObj = {}
    for i = 1, 6 do
        local obj = GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,false)
        self.starHLObj[i] = obj.transform:Find("HighLight").gameObject
    end
end
---@param pData ItemData 道具预制设置
function M:OnUpdateUI(pData)
    self.itemData = pData
    ---为0不显示星级
    if self.itemData.star then
        self.StarPanel().gameObject:SetActive(self.itemData.star > 0)
        ---大于0更新星级显示
        if self.itemData.star > 0 then
            for i = 1,#self.starHLObj do
                self.starHLObj[i]:SetActive(i <= self.itemData.star)
            end
        end
    else
        self.StarPanel().gameObject:SetActive(false)
    end
    ---设置品质
    MgrRes.LoadSprite(self.RewardRankImg(),"Item/Rank/ItemRank_"..self.itemData.quality)
    ---设置图标
    MgrRes.LoadSprite(self.RewardIconImg(),self.itemData.icon)
    ---设置数量
    if pData.count then
        self.ItemCountText().text = JNStrTool.numberAbbr(pData.count) --pData.count >= 10000 and math.floor(tonumber(pData.count)/1000).."K" or pData.count
    else
        self.ItemCountText().text = "0"
    end
end
return M