-- Code Auto Create Begin
local M = Class('CountdownPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CountdownPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CountdownPop_UI].prefab'
    self.Name = 'Form[CountdownPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Panel','Panel',2},
        -- UITemplate 列表
        {'Panel01','Panel',10},
    }
end
-- Code Auto Create End
return M