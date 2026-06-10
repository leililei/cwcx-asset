-- Code Auto Create Begin
local M = Class('ClosePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ClosePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ClosePop_UI].prefab'
    self.Name = 'Form[ClosePop_UI]'
    self.Layer = UILayerLv.Lock
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'sijiaozhezhao','sijiaozhezhao',2},{'dian2','dian2',2},{'dengchudi','dengchudi',2},{'jiya','dengchudi/jiya',2},{'yuyinicon','dengchudi/Text_Drama/yuyinicon',2},{'Btn_Enter','dengchudi/Btn_Enter',2},{'Btn_Back','dengchudi/Btn_Back',2},
        -- TextMeshProUGUI 列表
        {'Text_Drama','dengchudi/Text_Drama',20},{'Text_Queding','dengchudi/Btn_Enter/Text_Queding',20},{'Text_Quxiao','dengchudi/Btn_Back/Text_Quxiao',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    self.text_Drama = self.Text_Drama()
end

function M:OnShow(args)
    self.text_Drama.text = args[1]
    local confirmFun = args[2]     ---确认回调
    if nil ~= args[3] then
        self.Btn_Enter().color = Color(1, 1, 1, 0.1);
    end
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        confirmFun()
        self:ClosePop()
    end)
end

function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end

return M