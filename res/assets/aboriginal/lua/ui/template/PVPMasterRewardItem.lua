-- Code Auto Create Begin
local M = Class('PVPMasterRewardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPMasterRewardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'Img_Demanddi2','Img_Demanddi2',2},{'Text_Demand2','Img_Demanddi2/Text_Demand2',2},{'RankIcon','RankIcon',2},{'Img_Select','Img_Select',2},
        -- Text 列表
        {'TextRank','TextRank',3},
        -- UITemplate 列表
        {'PVPMasterRewardItem','/',10},{'RewardItemPreFab01','RewardItemPreFab',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItemPreFab().gameObject:SetActive(false)
    ---物品父物体
    self.RewardObj =
    {
        [1] = self.item1(),
        [2] = self.item2(),
        [3] = self.item3()
    }
end

function M:OnUpdateUI(pData)
    local info = pData[1];
    local arr = JNStrTool.strSplit(",",info[5]);
    local index = pData[2]
    self.parent = pData[3]
    ---更新段位信息
    self.TextRank().text = info[2];
    MgrRes.LoadSprite(self.RankIcon(),"Level/"..info[4])
    ---清除物体
    for i, v in pairs(self.RewardObj) do
        Tools.ClearAllChild(v.gameObject)
        v.enabled = true
    end
    ---创建奖励
    for i, v in pairs(arr) do
        if not self.RewardObj[i] then
            break
        end
        self.RewardObj[i].enabled = false
        local obj = GameObject.Instantiate(self.RewardItemPreFab().gameObject,self.RewardObj[i].transform,false)
        obj:SetActive(true);
        local goods = JNStrTool.strSplit("_",v)
        local itemData = ItemControl.GetItemByType(tonumber(goods[1]),tonumber(goods[2]))
        obj:GetComponent("UITemplate"):SetData({itemData,tonumber(goods[3]),v})
    end
end

return M