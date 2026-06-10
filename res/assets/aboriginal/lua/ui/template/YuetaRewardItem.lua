-- Code Auto Create Begin
local M = Class('YuetaRewardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/YuetaRewardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'RewardItemPreFab','RewardPanel/item1/RewardItemPreFab',2},{'RewardRankImg','RewardPanel/item1/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardPanel/item1/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardPanel/item1/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardPanel/item1/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardPanel/item1/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardPanel/item1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardPanel/item1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardPanel/item1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardPanel/item1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardPanel/item1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardPanel/item1/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardPanel/item1/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'item2','RewardPanel/item2',2},{'RewardItemPreFab01','RewardPanel/item2/RewardItemPreFab',2},{'RewardRankImg01','RewardPanel/item2/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg01','RewardPanel/item2/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg01','RewardPanel/item2/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel01','RewardPanel/item2/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot01','RewardPanel/item2/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar06','RewardPanel/item2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar07','RewardPanel/item2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar08','RewardPanel/item2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar09','RewardPanel/item2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar10','RewardPanel/item2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar11','RewardPanel/item2/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot01','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','RewardPanel/item2/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'item3','RewardPanel/item3',2},{'RewardItemPreFab02','RewardPanel/item3/RewardItemPreFab',2},{'RewardRankImg02','RewardPanel/item3/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg02','RewardPanel/item3/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg02','RewardPanel/item3/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel02','RewardPanel/item3/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot02','RewardPanel/item3/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar12','RewardPanel/item3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar13','RewardPanel/item3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar14','RewardPanel/item3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar15','RewardPanel/item3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar16','RewardPanel/item3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar17','RewardPanel/item3/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot02','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab02','RewardPanel/item3/RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Paimingdi','Img_Paimingdi',2},{'Img_Select','Img_Select',2},
        -- Text 列表
        {'ItemCountText','RewardPanel/item1/RewardItemPreFab/Img_ItemCountBg/ItemCountText',3},{'ItemCountText01','RewardPanel/item2/RewardItemPreFab/Img_ItemCountBg/ItemCountText',3},{'ItemCountText02','RewardPanel/item3/RewardItemPreFab/Img_ItemCountBg/ItemCountText',3},
        -- UITemplate 列表
        {'YuetaRewardItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Score','Text_Score',20},{'Text_Paiming','Img_Paimingdi/Text_Paiming',20},
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
    for i,v in pairs(self.Items) do
        v.transform:GetComponent("Image").color = Color(1,1,1,1)
    end
    for i,v in pairs(self.RewardItemPreFabs) do
        v:SetActive(false)
    end
end
function M:OnUpdateUI(pData)
    self.reward = pData[1]
    self.selfRank = pData[2]    --玩家自己的排名
    self.RewardPreFab = self.RewardItemPreFab().gameObject
    --排名范围
    if tonumber(self.reward.lastrank) > 100000 then
        self.Text_Score().text = self.reward.firstrank .. "+"
    else
        self.Text_Score().text = self.reward.firstrank .. "-" .. self.reward.lastrank
    end
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
        local go = self.Items[i].transform:Find("RewardItemPreFab").gameObject
        local RewardRankImg = go.transform:Find("RewardRankImg"):GetComponent("Image")
        local effect = go.transform:Find("RewardRankImg/Ui_TX_028")
        local RewardIconImg = go.transform:Find("RewardIconImg"):GetComponent("Image")
        local ItemCountText = go.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        local StarPanel = go.transform:Find("StarPanel").gameObject
        local ItemStarRoot = go.transform:Find("StarPanel/ItemStarRoot")
        local ItemStarPrefab = go.transform:Find("StarPanel/ItemStarPrefab").gameObject
        --品质框
        MgrRes.LoadSprite(RewardRankImg,"Quality/ItemRank_"..rewardItem.quality)
        if rewardItem.quality == 2 then
            effect:Find("biankuanglan").gameObject:SetActive(true)
        elseif rewardItem.quality == 3 then
            effect:Find("biankuangzi").gameObject:SetActive(true)
        elseif rewardItem.quality == 4 then
            effect:Find("biankuangcheng").gameObject:SetActive(true)
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
            for i = 1, rewardItem.star do
                GameObject.Instantiate(ItemStarPrefab,ItemStarRoot)
            end
        end
        ItemStarPrefab:SetActive(false)
        go:SetActive(true)
        UIEvent.LuaClick(go, Handle(self, function()
            MgrUI.Pop(UID.ItemDetailPop_UI, {rewardItem, false, function()
            end,nil,true }, true)
        end))
    end
    --select框是否显示
    if self.selfRank ~= nil and self.selfRank <= self.reward.lastrank and self.reward.firstrank <= self.selfRank then
        self.Img_Select().gameObject:SetActive(true)
    else
        self.Img_Select().gameObject:SetActive(false)
    end
end

return M