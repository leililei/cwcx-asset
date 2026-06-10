-- Code Auto Create Begin
local M = Class('LawsPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.LawsPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[LawsPop_UI].prefab'
    self.Name = 'Form[LawsPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Tanchuang','Tanchuang',2},{'Img_Xian2','Tanchuang/Img_Xian2',2},{'Img_Xian1','Tanchuang/Img_Xian1',2},{'Img_Biaotixian','Tanchuang/Img_Biaotixian',2},{'ScrollView','Tanchuang/Scroll View',2},{'Viewport','Tanchuang/Scroll View/Viewport',2},
        -- TextMeshProUGUI 列表
        {'Text_Title','Tanchuang/Img_Biaotixian/Text_Title',20},{'Text_Shuoming','Tanchuang/Scroll View/Viewport/Content/Text_Shuoming',20},
    }
end
-- Code Auto Create End
require("LocalData/AgreeLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.LawsPop_UI)
    end)
end
function M:OnShow(args)
    self.Text_Title().text = AgreeLocalData.tab[args[1]].title
    self.Text_Shuoming().text = AgreeLocalData.tab[args[1]].data
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M