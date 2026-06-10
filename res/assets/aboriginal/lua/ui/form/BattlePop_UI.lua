-- Code Auto Create Begin
local M = Class('BattlePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BattlePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BattlePop_UI].prefab'
    self.Name = 'Form[BattlePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Mask',2},{'Image','Image',2},
        -- TextMeshProUGUI 列表
        {'clicktoexit','clicktoexit',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    MgrTimer.AddDelayNoName(2,function()
        UIEvent.LuaClick(self.Image().gameObject,function()
            MgrUI.ClosePop(self.Uid)
        end)
        UIEvent.LuaClick(self.Mask().gameObject,function()
            MgrUI.ClosePop(self.Uid)
        end)
    end,nil)

end

return M