-- Code Auto Create Begin
local M = Class('StoryItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/StoryItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'LockIcon','LockIcon',2},{'StoryVideo','AreUnlocked/StoryVideo',2},
        -- UITemplate 列表
        {'StoryItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_LockContentTitle','Text_LockContentTitle',20},{'Text_StoryIntroduced','AreUnlocked/Text_StoryIntroduced',20},
    }
end
-- Code Auto Create End
return M