-- Code Auto Create Begin
local M = Class('PointGoodsItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PointGoodsItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PointGoodsItem','/',2},{'ItemPanel','wupin/ItemPanel',2},{'RewardRankImg','wupin/ItemPanel/RewardRankImg',2},{'RewardIconImg','wupin/ItemPanel/RewardIconImg',2},{'Img_ItemCountPivot','wupin/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','wupin/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},
        -- UITemplate 列表
        {'PointGoodsItem01','/',10},
        -- RawImage 列表
        {'VFXPanel','wupin/VFXPanel',15},
        -- TextMeshProUGUI 列表
        {'ItemCountText','wupin/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --self.starList = {}
    -----隐藏预制
    --self.ItemStarPrefab().gameObject:SetActive(false)
    -----提前创建星
    --for i = 1, 6 do
    --    self.starList[i] = GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,false)
    --end
    ---获取特效
    self._Rank_2_Vfx=self.VFXPanel().gameObject.transform:Find("lanse_vfx").gameObject
    self._Rank_3_Vfx=self.VFXPanel().gameObject.transform:Find("zise_vfx").gameObject
    self._Rank_4_Vfx=self.VFXPanel().gameObject.transform:Find("jinse_vfx").gameObject
end
function M:OnUpdateUI(pData)
    -----@type ItemLocalData 获取数据
    local itemData = pData[1]
    local count = pData[2]
    local type = pData[3]
    ---设置星级
    local isStart = itemData.itemstar > 0
    --self.StarPanel().gameObject:SetActive(isStart)
    --self.ItemStarRoot().gameObject:SetActive(isStart)

    --if type == 4 and itemData.id == 100001 then
    --    self.ReturnTili().gameObject:SetActive(true)
    --else
    --    self.ReturnTili().gameObject:SetActive(false)
    --end
    --if isStart then
    --    ---显示星
    --    for i = 1,#self.starList do
    --        self.starList[i]:SetActive(i <= itemData.itemstar)
    --    end
    --end
    --self.GearPanel().gameObject:SetActive(type == 3)
    self.ItemPanel().gameObject:SetActive(type ~= 3)
    ---设置品质
    if type == 3 then
        ---设置图标
        MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..itemData.icon)
        ---设置边框
        MgrRes.LoadSprite(self.RankKuangImg(), string.format("Quality/RankKuang_%s",itemData.quality))
        ---设置特殊符
        --self.RankPlusPanel().gameObject:SetActive(itemData.quality == 4 or itemData.quality == 6)
        --if itemData.quality == 4 or itemData.quality == 6 then
        --    self.CoreRank_4().gameObject:SetActive(itemData.quality == 4)
        --    self.CoreRank_6().gameObject:SetActive(itemData.quality == 6)
        --end
        ---根据品质显示特效
        self._Rank_2_Vfx:SetActive(itemData.quality == 1 or itemData.quality == 2)
        self._Rank_3_Vfx:SetActive(itemData.quality == 3 or itemData.quality == 4)
        self._Rank_4_Vfx:SetActive(itemData.quality == 5 or itemData.quality == 6)
    else
        ---设置图标
        MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..itemData.icon)
        ---设置边框
        MgrRes.LoadSprite(self.RewardRankImg(), string.format("Item/Rank/ItemRank_%s",itemData.quality))
        ---根据品质显示特效
        self._Rank_2_Vfx:SetActive(itemData.quality == 2)
        self._Rank_3_Vfx:SetActive(itemData.quality == 3)
        self._Rank_4_Vfx:SetActive(itemData.quality == 4)
        ---设置数量
        self.ItemCountText().text = JNStrTool.numberAbbr(count) --(count >= 10000 and math.floor(tonumber(count)/1000).."K" or count)
    end
end
return M