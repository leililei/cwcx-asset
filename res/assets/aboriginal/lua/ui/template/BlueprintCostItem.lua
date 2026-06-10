-- Code Auto Create Begin
local M = Class('BlueprintCostItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BlueprintCostItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Inner','Inner',2},{'ImgBg','Inner/ImgBg',2},{'ImgRank','Inner/ImgRank',2},{'ImgIcon','Inner/ImgIcon',2},
        -- Button 列表
        {'ImgIcon01','Inner/ImgIcon',4},
        -- UITemplate 列表
        {'BlueprintCostItem','/',10},
        -- TextMeshProUGUI 列表
        {'TextNum','Inner/TextNum',20},
    }
end
-- Code Auto Create End
function M:OnInit()
end
function M:OnUpdateUI(pData)
    local costs = string.split(pData[1], "_");
    local info = ItemControl.GetItemByIdAndType(tonumber(costs[2]), tonumber(costs[1]));
    MgrRes.LoadSprite(self.ImgRank(), info.iconFrame);
    MgrRes.LoadSprite(self.ImgIcon(), info.icon);
    self.TextNum().text = Global.GetCompareText(info.count, costs[3]);
    UIEvent.LuaClick(self.ImgIcon().gameObject, function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{info, false, function() end},true);
    end);
end
return M