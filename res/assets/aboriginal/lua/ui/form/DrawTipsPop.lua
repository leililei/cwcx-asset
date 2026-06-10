-- Code Auto Create Begin
local M = Class('DrawTipsPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DrawTipsPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DrawTipsPop].prefab'
    self.Name = 'Form[DrawTipsPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','BlurBg',2},{'Img_bg','Img_bg',2},{'Img_Xian2','Img_Xian2',2},{'Img_Xian1','Img_Xian1',2},{'Img_Biaotixian','Text_Title/Img_Biaotixian',2},{'ScrollView','Scroll View',2},{'Viewport','Scroll View/Viewport',2},{'ScrollbarVertical','Scroll View/Scrollbar Vertical',2},{'Handle','Scroll View/Scrollbar Vertical/Sliding Area/Handle',2},
        -- TextMeshProUGUI 列表
        {'Text_Title','Text_Title',20},{'Text_Tips','Scroll View/Viewport/Content/Text_Tips',20},
    }
end
-- Code Auto Create End

function M:OnInit()
    UIEvent.LuaClick(self.BlurBg().gameObject,function()
        MgrUI.ClosePop(self.Uid)
    end)
end

function M:OnShow(args)
    Tools.ReSize(self.Text_Tips().gameObject)
end

return M