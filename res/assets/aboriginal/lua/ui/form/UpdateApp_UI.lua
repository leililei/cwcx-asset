-- Code Auto Create Begin
local M = Class('UpdateApp_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.UpdateApp_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[UpdateApp_UI].prefab'
    self.Name = 'Form[UpdateApp_UI]'
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
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        MgrSdk.JumpToMarket()
    end)
    self.text_Drama = self.Text_Drama()
end

function M:OnShow(args)
    self.text_Drama.text = args
end

function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end
return M