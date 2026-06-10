-- Code Auto Create Begin
local M = Class('VoidGearDrawBG_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VoidGearDrawBG_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VoidGearDrawBG_UI].prefab'
    self.Name = 'Form[VoidGearDrawBG_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 4
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'beijing','BackGroundPanel/beijing',2},{'sanjiao','BackGroundPanel/sanjiao',2},
    }
end
-- Code Auto Create End
function M:OnInit()
    VoidGearDrawViewModel.OpenVoidGearDrawResultUI()
end
return M