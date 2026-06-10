-- Code Auto Create Begin
local M = Class('NiudanReward', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/NiudanReward.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NiudanReward','/',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab1','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'HighLight','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1/HighLight',2},{'ItemStarPrefab2','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'HighLight01','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2/HighLight',2},{'ItemStarPrefab3','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'HighLight02','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3/HighLight',2},{'ItemStarPrefab4','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'HighLight03','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4/HighLight',2},{'ItemStarPrefab5','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'HighLight04','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5/HighLight',2},{'ItemStarPrefab6','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab6',2},{'HighLight05','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab6/HighLight',2},{'Shuliang','Shuliang',2},
        -- UITemplate 列表
        {'NiudanReward01','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Shengyu','Shuliang/Text_Shengyu',20},{'Text_Shuliang','Shuliang/Text_Shuliang',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --点击查看物品详情
    UIEvent.LuaClick(self.ObjRoot,function()
        if self.data.item then
            MgrUI.Pop(UID.ItemDetailPop_UI,{self.data.item, false, function() end},true)
        end
    end)
end

function M:OnUpdateUI(data)
    self.data = data[1]
    self.parent = data[2]
    local isSpecial = data[3]
    MgrRes.LoadSprite(self.RewardIconImg(),self.data.item.icon)        --物品图片
    MgrRes.LoadSprite(self.RewardRankImg(),self.data.item.iconFrame)   --物品边框
    self.ItemCountText().text = self.data.count                        --道具数量
    if self.data.count <= 1 then
        self.ItemCountText().gameObject:SetActive(false)
    else
        self.ItemCountText().gameObject:SetActive(true)
    end
    self.Text_Shuliang().text = self.data.totalCount                   --总数量
    Tools.ReContentSizeGroup(self.Shuliang().gameObject)               --刷新自适应组件
    if self.data.item.type == 2 then                                   --是否显示星级
        self.StarPanel().gameObject:SetActive(true)
        for i = 0,self.StarPanel().gameObject.transform.childCount - 1 do
            if i <= self.data.item.star then
                self.StarPanel().gameObject.transform:GetChild(i).transform:Find("HighLight").gameObject:SetActive(true)
            else
                self.StarPanel().gameObject.transform:GetChild(i).transform:Find("HighLight").gameObject:SetActive(false)
            end
        end
    else
        self.StarPanel().gameObject:SetActive(false)
    end
    --检查是否显示特殊边框
    if isSpecial then
        MgrRes.LoadSprite(self.RewardRankImg(),SteamLocalData.tab[123000][2])
    end
    
end



return M