-- Code Auto Create Begin
local M = Class('RewardItemPreFab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RewardItemPreFab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardItemPreFab','/',2},{'RewardRankImg','RewardRankImg',2},{'RewardIconImg','RewardIconImg',2},{'Img_ItemCountBg','Img_ItemCountBg',2},{'StarPanel','StarPanel',2},{'ItemStarRoot','StarPanel/ItemStarRoot',2},{'ItemStarPrefab1','StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'HighLight','StarPanel/ItemStarRoot/ItemStarPrefab1/HighLight',2},{'ItemStarPrefab2','StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'HighLight01','StarPanel/ItemStarRoot/ItemStarPrefab2/HighLight',2},{'ItemStarPrefab3','StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'HighLight02','StarPanel/ItemStarRoot/ItemStarPrefab3/HighLight',2},{'ItemStarPrefab4','StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'HighLight03','StarPanel/ItemStarRoot/ItemStarPrefab4/HighLight',2},{'ItemStarPrefab5','StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'HighLight04','StarPanel/ItemStarRoot/ItemStarPrefab5/HighLight',2},{'ItemStarPrefab6','StarPanel/ItemStarRoot/ItemStarPrefab6',2},{'HighLight05','StarPanel/ItemStarRoot/ItemStarPrefab6/HighLight',2},
        -- UITemplate 列表
        {'RewardItemPreFab01','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','Img_ItemCountBg/ItemCountText',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    self.star = {
        self.HighLight().gameObject,
        self.HighLight01().gameObject,
        self.HighLight02().gameObject,
        self.HighLight03().gameObject,
        self.HighLight04().gameObject,
        self.HighLight05().gameObject,
    }
    ---@type ItemData
    self.item = pData[1]
    self.Count = pData[2]
    self.str = pData[3]
    ---星级
    if self.item.star == 0 or self.item.star == nil then
        self.ItemStarRoot().gameObject:SetActive(false)
    else
        self.ItemStarRoot().gameObject:SetActive(true)
        for i = 1,6 do
            if i <= self.item.star then
                self.star[i]:SetActive(true)
            else
                self.star[i]:SetActive(false)
            end
        end
    end
    ---边框
    if nil ~= self.str then
        local goods = JNStrTool.strSplit("_", self.str);
        local itemData = ItemControl.GetItemByIdAndType(tonumber(goods[2]), tonumber(goods[1]));
        if nil ~= itemData.iconFrame then
            MgrRes.LoadSprite(self.RewardRankImg(), itemData.iconFrame)
        end
        ---按钮
        UIEvent.LuaClick(self.ObjRoot,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{ itemData, false, nil,nil,false},true)
        end)
        ---物品图标
        MgrRes.LoadSprite(self.RewardIconImg(), "Item/" .. self.item.icon)
    else
        if nil ~= self.item.iconFrame then
            MgrRes.LoadSprite(self.RewardRankImg(), self.item.iconFrame)
        end
        ---按钮
        UIEvent.LuaClick(self.ObjRoot,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{ self.item, false, nil,nil,false},true)
        end)
        ---物品图标
        MgrRes.LoadSprite(self.RewardIconImg(), self.item.icon)
    end
    
    ---数量
    self.ItemCountText().text = self.Count
    
end

return M