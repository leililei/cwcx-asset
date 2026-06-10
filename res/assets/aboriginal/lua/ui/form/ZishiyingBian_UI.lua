-- Code Auto Create Begin
local M = Class('ZishiyingBian_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ZishiyingBian_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ZishiyingBian_UI].prefab'
    self.Name = 'Form[ZishiyingBian_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Heibian_zuo','Img_Heibian_zuo',2},{'Img_Heibian_you','Img_Heibian_you',2},{'Img_Heibian_shang','Img_Heibian_shang',2},{'Img_Heibian_xia','Img_Heibian_xia',2},
    }
end
-- Code Auto Create End
return M