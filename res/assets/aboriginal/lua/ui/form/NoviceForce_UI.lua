-- Code Auto Create Begin
local M = Class('NoviceForce_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NoviceForce_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NoviceForce_UI].prefab'
    self.Name = 'Form[NoviceForce_UI]'
    self.Layer = UILayerLv.Guide
    self.Depth = 101
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'FormNoviceForce_UI','/',2},{'ClickBg','ClickBg',2},{'Frame','Frame',2},{'bg','Frame/bg',2},{'triangle','Frame/triangle',2},
        -- TextMeshProUGUI 列表
        {'Text_txt','Frame/Text_txt',20},
    }
end
-- Code Auto Create End
function M:OnShow(pData)
    self:SetLayer(3600)
    self.Text_txt().text = pData[1]
    self.ID = pData[2]

    UIEvent.LuaClick(self.ClickBg().gameObject, function()
        ---关闭自己
        MgrUI.PopHide(self.Uid)
        ---关闭结算界面
        MgrUI.PopHide(UID.PVEComplete_UI)
        MgrUI.PopHide(UID.PlayerLevelUp_UI)
        ---返回大厅
        MgrBattle.CloseFight(true, function ()
            MgrTimer.AddDelayNoName(0.1, function (...)
                MessageEvent.Go(EID.NoviceCheck,self.ID)
            end)
        end)
    end)
end

return M