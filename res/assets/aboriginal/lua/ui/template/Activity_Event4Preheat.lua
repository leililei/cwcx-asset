-- Code Auto Create Begin
local M = Class('Activity_Event4Preheat', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Event4Preheat.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Event4Preheat','/',2},{'Btn_Qianwangtaofa','Btn_Qianwangtaofa',2},
        -- UITemplate 列表
        {'Activity_Event4Preheat01','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Qianwangtaofa().gameObject,function()
        Event4Control.OpenPreheatUI()
    end)
end

return M