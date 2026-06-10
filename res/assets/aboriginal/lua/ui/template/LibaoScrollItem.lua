-- Code Auto Create Begin
local M = Class('LibaoScrollItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/Prefab/Template/LibaoScrollItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'LibaoScrollItem','/',2},
        -- UITemplate 列表
        {'LibaoScrollItem01','/',10},
    }
end
-- Code Auto Create End
require("LocalData/ItemLocalData")
function M:OnUpdateUI(args)
    self.itemsInfo = args[1]        --物品信息:物品ID/物品数量/物品类型
    self.idx = args[2]
    self.parent = args[3]
    ---根据礼包内容获取图片路径
    local iconPath = "Item/" .. ItemLocalData.tab[self.itemsInfo["goodsID"]].icon

end

return M
