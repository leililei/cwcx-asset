-- Code Auto Create Begin
local M = Class('SweepRewardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SweepRewardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardRankImg','wupin/RewardRankImg',2},{'RewardIconImg','wupin/RewardIconImg',2},{'StarPanel','wupin/StarPanel',2},{'ItemStarRoot','wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','wupin/StarPanel/ItemStarPrefab',2},{'HighLight','wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','wupin/Img_ItemCountBg',2},{'TimeCountDownPanel','wupin/TimeCountDownPanel',2},{'shijian2','wupin/TimeCountDownPanel/shijian2',2},
        -- Text 列表
        {'CountDownText','wupin/TimeCountDownPanel/CountDownText',3},
        -- UITemplate 列表
        {'SweepRewardItem','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','wupin/Img_ItemCountBg/ItemCountText',20},
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
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnItemClick))
end
function M:OnUpdateUI(pData)
    ---@type ItemData 道具预制设置
    self.pData = pData[1]
    self.parent = pData[2]
    ---为0不显示星级
    self.StarPanel().gameObject:SetActive(self.pData.star > 0)
    ---大于0更新星级显示
    if self.pData.star > 0 then
        for i = 1,#self.starHLObj do
            self.starHLObj[i]:SetActive(i <= self.pData.star)
        end
    end
    ---设置品质
    MgrRes.LoadSprite(self.RewardRankImg(),self.pData.iconFrame)
    ---设置图标
    if self.pData.icon == "icon_goods_wanjiajingyan" then
        self.pData.icon = "icon_goods_exp"
    end
    if self.pData.goodsType == 4  then
        MgrRes.LoadSprite(self.RewardIconImg(),self.pData.icon)
    else
        MgrRes.LoadSprite(self.RewardIconImg(),self.pData.icon)
    end
    ---设置数量
    self.ItemCountText().text = JNStrTool.numberAbbr(self.pData.tempCount) --self.pData.tempCount >= 10000 and math.floor(tonumber(self.pData.tempCount)/1000).."K" or self.pData.tempCount
end
function M:OnItemClick()
    MgrUI.Pop(UID.ItemDetailPop_UI,{ self.pData, false, function() end},true)
end
return M