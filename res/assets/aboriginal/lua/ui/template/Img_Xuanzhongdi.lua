-- Code Auto Create Begin
local M = Class('Img_Xuanzhongdi', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Img_Xuanzhongdi.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BirthdayItem','/',2},
        -- Text 列表
        {'Text_Yue','Text_Yue',3},
        -- UITemplate 列表
        {'BirthdayItem01','/',10},
    }
end
-- Code Auto Create End
return M