-- Code Auto Create Begin
local M = Class('TestItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/TestItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'TestItem','/',2},{'SelectImg','SelectImg',2},{'RedDotIcon','RedDotIcon',2},{'Btn_suo','Btn_suo',2},{'Img_suo','Btn_suo/Img_suo',2},
        -- UITemplate 列表
        {'TestItem01','/',10},
        -- Toggle 列表
        {'TestItem02','/',13},
        -- TextMeshProUGUI 列表
        {'Text_Switch','Text_Switch',20},
    }
end
-- Code Auto Create End
return M