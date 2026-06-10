-- Code Auto Create Begin
local M = Class('WBTeshujiangliIPreFab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WBTeshujiangliIPreFab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'RewardItemPreFab','RewardPanel/item1/RewardItemPreFab',2},{'item2','RewardPanel/item2',2},{'RewardItemPreFab01','RewardPanel/item2/RewardItemPreFab',2},{'Img_Demanddi','Img_Demanddi',2},
        -- Text 列表
        {'Img_Shuoming','Img_Shuoming',3},{'Text_Demand','Img_Demanddi/Text_Demand',3},
        -- UITemplate 列表
        {'WBTeshujiangliIPreFab','/',10},{'RewardItemPreFab02','RewardPanel/item1/RewardItemPreFab',10},{'RewardItemPreFab03','RewardPanel/item2/RewardItemPreFab',10},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    self.rewardPrefab = {
        self.RewardItemPreFab02(),
        self.RewardItemPreFab03()
    }
    ---奖励
    self.reward = {}
    for i, v in pairs(pData[1]) do
        local str = string.split(v,"_")
        local goods = {
            goodsType = tonumber(str[1]),
            goodsID = tonumber(str[2]),
            goodsNum = tonumber(str[3])
        }
        local reward = ItemData.New()
        reward:PushData(goods, ItemControl.PushEnum.none)
        table.insert(self.reward,reward)
    end
    ---奖励显示
    for i = 1, #self.rewardPrefab do
        if self.reward[i] ~= nil then
            self.rewardPrefab[i].gameObject:SetActive(true)
            self.rewardPrefab[i].transform:GetComponent("UITemplate"):SetData({self.reward[i],self.reward[i].count})
        else
            self.rewardPrefab[i].gameObject:SetActive(false)
        end
    end
end


return M