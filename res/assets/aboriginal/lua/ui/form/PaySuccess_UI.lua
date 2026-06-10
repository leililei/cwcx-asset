-- Code Auto Create Begin
local M = Class('PaySuccess_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PaySuccess_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PaySuccess_UI].prefab'
    self.Name = 'Form[PaySuccess_UI]'
    self.Layer = UILayerLv.Guide
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PaySuccessPanel','PaySuccessPanel',2},{'Mask','Mask',2},
        -- TextMeshProUGUI 列表
        {'PaySuccessText','PaySuccessPanel/PaySuccessText',20},
    }
end
-- Code Auto Create End
function M:OnShow(data)
    local time = data[1]
    MgrTimer.AddDelayNoName(time,function()
        MgrUI.ClosePop(self.Uid)
    end,self.ObjRoot)
    --点击关闭
    UIEvent.LuaClick(self.Mask().gameObject,function()
        MgrUI.ClosePop(self.Uid)
    end)
end

return M