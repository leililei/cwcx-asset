-- Code Auto Create Begin
local M = Class('StoreReviewPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.StoreReviewPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[StoreReviewPop_UI].prefab'
    self.Name = 'Form[StoreReviewPop_UI]'
    self.Layer = UILayerLv.Lock
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'dengchudi','dengchudi',2},{'Btn_Enter','dengchudi/Btn_Enter',2},{'Btn_Close','dengchudi/Btn_Close',2},
        -- TextMeshProUGUI 列表
        {'Text_Queding','dengchudi/Btn_Enter/Text_Queding',20},
    }
end
-- Code Auto Create End

---初始化
function M:OnInit()
end

function M:OnShow(args)
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        MgrSdk.RequestReview()
        self:ClosePop()
    end)

    UIEvent.LuaClick(self.Btn_Close().gameObject,function()
        self:ClosePop()
    end)
end

function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end
return M