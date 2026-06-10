-- Code Auto Create Begin
local M = Class('WarnningPanel_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WarnningPanel_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WarnningPanel_UI].prefab'
    self.Name = 'Form[WarnningPanel_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'WarnMask','WarnMask',2},{'WarnPanel','WarnPanel',2},{'WarningBackGround','WarnPanel/WarningBackGround',2},
        -- Text 列表
        {'WarnningText','WarnPanel/WarnningText',3},
    }
end
-- Code Auto Create End
function M:OnInit()
    M.CurTxt=nil
    -- 父节点Panel获取
    M.WarnPanel=self.WarnPanel().gameObject
    --文本框获取
    M.Txt_WarnningText=self.WarnningText().gameObject:GetComponent("TextMeshProUGUI")

    M.UpdateTxt()
end

function M.OnShow(args)
    local text = args[1]
    local time = args[2]
    M.Txt_WarnningText.text=text
    if not time then
        MgrTimer.AddDelayNoName(time,function()
            MgrUI.PopHide(UID.WarnningPanel_UI)
        end ,nil)
    end
end

return M