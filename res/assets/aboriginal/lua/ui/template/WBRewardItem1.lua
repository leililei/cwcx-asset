-- Code Auto Create Begin
local M = Class('WBRewardItem1', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WBRewardItem1.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'RewardItemPreFab','RewardPanel/item1/RewardItemPreFab',2},{'StarPanel','RewardPanel/item1/RewardItemPreFab/StarPanel',2},{'ItemStarRoot','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab1','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'HighLight','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1/HighLight',2},{'ItemStarPrefab2','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'HighLight01','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2/HighLight',2},{'ItemStarPrefab3','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'HighLight02','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3/HighLight',2},{'ItemStarPrefab4','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'HighLight03','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4/HighLight',2},{'ItemStarPrefab5','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'HighLight04','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5/HighLight',2},{'ItemStarPrefab6','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab6',2},{'HighLight05','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab6/HighLight',2},{'RewardRankImg','RewardPanel/item1/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardPanel/item1/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardPanel/item1/RewardItemPreFab/Img_ItemCountBg',2},{'item2','RewardPanel/item2',2},{'RewardItemPreFab2','RewardPanel/item2/RewardItemPreFab2',2},{'StarPanel01','RewardPanel/item2/RewardItemPreFab2/StarPanel',2},{'ItemStarRoot01','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab101','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'HighLight06','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab1/HighLight',2},{'ItemStarPrefab201','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'HighLight07','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab2/HighLight',2},{'ItemStarPrefab301','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'HighLight08','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab3/HighLight',2},{'ItemStarPrefab401','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'HighLight09','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab4/HighLight',2},{'ItemStarPrefab501','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'HighLight10','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab5/HighLight',2},{'ItemStarPrefab601','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab6',2},{'HighLight11','RewardPanel/item2/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab6/HighLight',2},{'RewardRankImg01','RewardPanel/item2/RewardItemPreFab2/RewardRankImg',2},{'RewardIconImg01','RewardPanel/item2/RewardItemPreFab2/RewardIconImg',2},{'Img_ItemCountBg01','RewardPanel/item2/RewardItemPreFab2/Img_ItemCountBg',2},{'item3','RewardPanel/item3',2},{'RewardItemPreFab3','RewardPanel/item3/RewardItemPreFab3',2},{'StarPanel02','RewardPanel/item3/RewardItemPreFab3/StarPanel',2},{'ItemStarRoot02','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot',2},{'ItemStarPrefab102','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'HighLight12','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab1/HighLight',2},{'ItemStarPrefab202','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'HighLight13','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab2/HighLight',2},{'ItemStarPrefab302','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'HighLight14','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab3/HighLight',2},{'ItemStarPrefab402','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'HighLight15','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab4/HighLight',2},{'ItemStarPrefab502','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'HighLight16','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab5/HighLight',2},{'ItemStarPrefab602','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab6',2},{'HighLight17','RewardPanel/item3/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab6/HighLight',2},{'RewardRankImg02','RewardPanel/item3/RewardItemPreFab3/RewardRankImg',2},{'RewardIconImg02','RewardPanel/item3/RewardItemPreFab3/RewardIconImg',2},{'Img_ItemCountBg02','RewardPanel/item3/RewardItemPreFab3/Img_ItemCountBg',2},{'Kelingqu','Kelingqu',2},{'Yiwancheng','Yiwancheng',2},{'Img_zhezhao','Yiwancheng/Img_zhezhao',2},{'Gou','Yiwancheng/Gou',2},{'Img_Gou','Yiwancheng/Gou/Img_Gou',2},
        -- UITemplate 列表
        {'WBRewardItem1','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardPanel/item1/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','RewardPanel/item2/RewardItemPreFab2/Img_ItemCountBg/ItemCountText',20},{'ItemCountText02','RewardPanel/item3/RewardItemPreFab3/Img_ItemCountBg/ItemCountText',20},{'Img_Rank','Img_Rank',20},{'Text_Demand','Text_Demand',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.rewardItem = {
        self.RewardItemPreFab().gameObject,
        self.RewardItemPreFab2().gameObject,
        self.RewardItemPreFab3().gameObject,
    }
    for i,v in pairs(self.rewardItem) do
        v:SetActive(false)
    end
end

function M:OnUpdateUI(pData)
    local rewd = pData[1]
    local received = pData[2]
    self.parent = pData[3]
    self.Kelingqu().gameObject:SetActive(false)
    self.Yiwancheng().gameObject:SetActive(false)
    --分数
    self.Img_Rank().text = rewd.score
    --奖励
    local reward = string.split(rewd.reward,",")
    for i,v in ipairs(reward) do
        self.rewardItem[i]:SetActive(true)
        local str = string.split(v,"_")
        local data = {
            goodsType = tonumber(str[1]),
            goodsID = tonumber(str[2]),
            goodsNum = tonumber(str[3])
        }
        local item = ItemData.New()
        item:PushData(data,ItemControl.PushEnum.none)
        local count = self.rewardItem[i].transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        count.text = item.count
        local RewardRankImg = self.rewardItem[i].transform:Find("RewardRankImg"):GetComponent("Image")
        MgrRes.LoadSprite(RewardRankImg,item.iconFrame)
        local RewardIconImg = self.rewardItem[i].transform:Find("RewardIconImg"):GetComponent("Image")
        MgrRes.LoadSprite(RewardIconImg,item.icon)
        self.rewardItem[i].transform:Find("StarPanel").gameObject:SetActive(false)
        ---按钮
        UIEvent.LuaClick(self.rewardItem[i],function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{ item, true, nil,nil,true},true)
        end)
    end
    --可领取
    if rewd.score <= StormViewModel.SelfRankInfo.totalScore and received == nil then
        self.Kelingqu().gameObject:SetActive(true)
    end
    --已领取
    if rewd.score <= StormViewModel.SelfRankInfo.totalScore and received ~= nil then
        self.Yiwancheng().gameObject:SetActive(true)
    end
end

return M