-- Code Auto Create Begin
local M = Class('TXRewardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/TXRewardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'RewardItemPreFab','RewardPanel/item1/RewardItemPreFab',2},{'RewardRankImg','RewardPanel/item1/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardPanel/item1/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardPanel/item1/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardPanel/item1/RewardItemPreFab/StarPanel',2},{'ItemStarRoot','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab01','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight01','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab02','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight02','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab03','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight03','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab04','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight04','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab05','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight05','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'item2','RewardPanel/item2',2},{'RewardItemPreFab01','RewardPanel/item2/RewardItemPreFab',2},{'RewardRankImg01','RewardPanel/item2/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg01','RewardPanel/item2/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg01','RewardPanel/item2/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel01','RewardPanel/item2/RewardItemPreFab/StarPanel',2},{'ItemStarRoot01','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab06','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight06','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab07','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight07','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab08','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight08','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab09','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight09','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab10','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight10','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab11','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight11','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'item3','RewardPanel/item3',2},{'RewardItemPreFab02','RewardPanel/item3/RewardItemPreFab',2},{'RewardRankImg02','RewardPanel/item3/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg02','RewardPanel/item3/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg02','RewardPanel/item3/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel02','RewardPanel/item3/RewardItemPreFab/StarPanel',2},{'ItemStarRoot02','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab12','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight12','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab13','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight13','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab14','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight14','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab15','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight15','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab16','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight16','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'ItemStarPrefab17','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight17','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'Kelingqu','Kelingqu',2},{'Yiwancheng','Yiwancheng',2},{'Img_zhezhao','Yiwancheng/Img_zhezhao',2},{'Gou','Yiwancheng/Gou',2},{'Img_Gou','Yiwancheng/Gou/Img_Gou',2},
        -- UITemplate 列表
        {'TXRewardItem','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardPanel/item1/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','RewardPanel/item2/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'ItemCountText02','RewardPanel/item3/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Rank','Text_Rank',20},{'Text_Demand','Text_Demand',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Items = {
        [1] = self.item1(),
        [2] = self.item2(),
        [3] = self.item3(),
    }
    self.RewardItemPreFabs = {
        [1] = self.RewardItemPreFab().gameObject,
        [2] = self.RewardItemPreFab01().gameObject,
        [3] = self.RewardItemPreFab02().gameObject,
    }
    ---获得的最高积分
    self.TopScore = YueTaViewModel.GetServerData().innerTopScore
    
    for i,v in pairs(self.Items) do
        v.transform:GetComponent("Image").color = Color(1,1,1,1)
    end
    for i,v in pairs(self.RewardItemPreFabs) do
        v:SetActive(false)
    end
    
    UIEvent.LuaClick(self.Img_bg().gameObject,function()
        
    end)
end
function M:OnUpdateUI(pData)
    self.reward = pData[1]

    ---已领取的奖励ID列表
    local RecRewardList = YueTaViewModel.GetServerData().innerClaimedReward
    if self.TopScore >= self.reward.score then
        if RecRewardList and Global.Contains(RecRewardList,self.reward.id) then
            self.Kelingqu().gameObject:SetActive(false)
            self.Yiwancheng().gameObject:SetActive(true)
        else
            self.Kelingqu().gameObject:SetActive(true)
            self.Yiwancheng().gameObject:SetActive(false)
        end
    else
        self.Kelingqu().gameObject:SetActive(false)
        self.Yiwancheng().gameObject:SetActive(false)
    end
    self.Text_Rank().text = self.reward.score
    --奖励信息
    local rewardInfo = string.split(self.reward.reward,",")
    for i,v in ipairs(rewardInfo) do
        local str = string.split(v,"_")
        local goods = {
            goodsType = tonumber(str[1]),
            goodsID = tonumber(str[2]),
            goodsNum = tonumber(str[3])
        }
        local rewardItem = ItemData.New()
        rewardItem:PushData(goods, ItemControl.PushEnum.none)
        self.Items[i].transform:GetComponent("Image").color = Color(1,1,1,0)
        self.RewardItemPreFabs[i]:SetActive(true)
        local go = self.RewardItemPreFabs[i]
        local RewardRankImg = go.transform:Find("RewardRankImg"):GetComponent("Image")
        local effect = go.transform:Find("RewardRankImg/Ui_TX_028")
        local RewardIconImg = go.transform:Find("RewardIconImg"):GetComponent("Image")
        local ItemCountText = go.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        local StarPanel = go.transform:Find("StarPanel").gameObject
        local ItemStarRoot = go.transform:Find("StarPanel/ItemStarRoot")
        local ItemStarPrefab = go.transform:Find("StarPanel/ItemStarRoot/ItemStarPrefab").gameObject
        --品质框
        local Quality_Blue = effect:Find("biankuanglan").gameObject
        local Quality_Purple = effect:Find("biankuangzi").gameObject
        local Quality_Orange = effect:Find("biankuangcheng").gameObject
        MgrRes.LoadSprite(RewardRankImg,"Quality/ItemRank_"..rewardItem.quality)
        if rewardItem.quality == 2 then
            Quality_Blue:SetActive(true)
            Quality_Purple:SetActive(false)
            Quality_Orange:SetActive(false)
        elseif rewardItem.quality == 3 then
            Quality_Blue:SetActive(false)
            Quality_Purple:SetActive(true)
            Quality_Orange:SetActive(false)
        elseif rewardItem.quality == 4 then
            Quality_Blue:SetActive(false)
            Quality_Purple:SetActive(false)
            Quality_Orange:SetActive(true)
        end
        --物品图片
        MgrRes.LoadSprite(RewardIconImg,rewardItem.icon)
        --数量
        ItemCountText.text = rewardItem.count
        --星数
        if rewardItem.star == 0 then
            StarPanel:SetActive(false)
        else
            StarPanel:SetActive(true)
            for i = 1, ItemStarRoot.transform.childCount do
                if i <= rewardItem.star then
                    ItemStarRoot.transform:GetChild(i-1).transform:Find("HighLight").gameObject:SetActive(true)
                else
                    ItemStarRoot.transform:GetChild(i-1).transform:Find("HighLight").gameObject:SetActive(false)
                end
            end
        end
        go:SetActive(true)
        UIEvent.LuaClick(go, Handle(self, function()
            MgrUI.Pop(UID.ItemDetailPop_UI, {rewardItem, false, function()
            end,nil,true }, true)
        end))
    end
end
return M