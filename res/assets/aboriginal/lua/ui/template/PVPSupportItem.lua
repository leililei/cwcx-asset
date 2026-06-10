-- Code Auto Create Begin
local M = Class('PVPSupportItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPSupportItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Mask','Img_Mask',2},{'Icon_Head','Img_Mask/Icon_Head',2},{'Img_Frame','Img_Frame',2},
        -- UITemplate 列表
        {'PVPSupportItem','/',10},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()

end
---角色头像更新
function M:OnUpdateUI(pData)
    MgrRes.LoadNormalIcon(self.Icon_Head(), pData.id)
end

return M