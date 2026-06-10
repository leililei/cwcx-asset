-- Code Auto Create Begin
local M = Class('XiaoLoading_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.XiaoLoading_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[XiaoLoading_UI].prefab'
    self.Name = 'Form[XiaoLoading_UI]'
    self.Layer = UILayerLv.Guide
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'heidi','heidi',2},{'Sliderdi','heidi/Sliderdi',2},{'Sliderliang','heidi/Sliderdi/Sliderliang',2},{'Mask','Mask',2},
        -- TextMeshProUGUI 列表
        {'PointText','heidi/PointText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    MgrTimer.Cancel("XiaoLoading")
    MgrTimer.AddRepeat("XiaoLoading", 0.1, function()
        self.Sliderliang().gameObject.transform:RotateAround(self.Sliderdi().gameObject.transform.position,Vector3.back,30)
    end , -1, nil)
end

function M:OnHide()
    MgrTimer.Cancel("XiaoLoading")
end

function M:OnClose()
    MgrTimer.Cancel("XiaoLoading")
end

return M