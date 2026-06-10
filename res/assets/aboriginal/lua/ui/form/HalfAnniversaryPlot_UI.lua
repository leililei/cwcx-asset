-- Code Auto Create Begin
local M = Class('HalfAnniversaryPlot_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryPlot_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryPlot_UI].prefab'
    self.Name = 'Form[HalfAnniversaryPlot_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'PlotScroll','PlotScroll',2},{'HalfAnniversaryPlotItem','PlotScroll/HalfAnniversaryPlotItem',2},{'Content','PlotScroll/Content',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Btn_Help','ReturnBg/Btn_Help',2},
        -- UITemplate 列表
        {'HalfAnniversaryPlotItem01','PlotScroll/HalfAnniversaryPlotItem',10},
        -- LoopScrollRect 列表
        {'PlotScroll01','PlotScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.PlotList = HalfAnniControl.GetGamePlot()
    ---注册掉落滑块
    self.PlotScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    
    self:InitButton()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
end

function M:OnUpdateUI()
    local emptyPre = 2
    self.LevelList = {}
    for i = 1, #self.PlotList.levels+emptyPre do
        self.LevelList[i] = self.PlotList.levels[i-emptyPre*0.5]==nil and 0 or self.PlotList.levels[i-emptyPre*0.5]
    end
    self.PlotScroll01().totalCount = #self.LevelList
    self.PlotScroll01():RefillCells()
end

function M:CellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.LevelList[idx],idx })
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M