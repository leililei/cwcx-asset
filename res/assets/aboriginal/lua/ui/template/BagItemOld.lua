-- Code Auto Create Begin
local M = Class('BagItemOld', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/Prefab/Template/BagItemOld.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardBgImg','RewardBgImg',2},{'RewardIconImg','RewardIconImg',2},{'RewardBottomImg','RewardBottomImg',2},{'baikuang','baikuang',2},
        -- Text 列表
        {'RewardCountTxt','RewardCountTxt',3},
        -- UITemplate 列表
        {'BagItemOld','/',10},
    }
end
-- Code Auto Create End
return M
