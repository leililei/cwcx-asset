-- Code Auto Create Begin
local M = Class('CakeTask_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CakeTask_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CakeTask_UI].prefab'
    self.Name = 'Form[CakeTask_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Img_Taskdi','RightPanel/Img_Taskdi',2},{'Btn_Lingqu','RightPanel/Btn_Lingqu',2},{'lihui_task','lihui_task',2},
        -- UITemplate 列表
        {'CakeTaskItem','RightPanel/TaskScroll/CakeTaskItem',10},
        -- RawImage 列表
        {'TaskScroll','RightPanel/TaskScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','RightPanel/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TaskGroup = nil
    self.BakeryData = CakeControl.GetBakeryData()

    self.TaskScroll01():SetLuaCellEvent(Handle(self, self.RefreshCell))
    self:ReloaData()
    self:InitButton()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---一键领取
    UIEvent.LuaClick(self.Btn_Lingqu().gameObject, function()
        ActivationTaskViewModel.TaskPerform(self.TaskGroup[1].type,0,nil,self.BakeryData.daytask,function()
            self:ReloaData()
        end)
    end)
end

function M:RefreshCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({ self.TaskGroup[idx], self })
end

---刷新成就滑动数据
function M:ReloaData()
    ---生日红点
    CakeControl.CheckDot()
    
    self.CurDotState = false
    self.TaskGroup = CakeControl.GetDailyTaskData()
    self.CurDotState = RedDotControl.GetDotData("CakeTask").State

    self.TaskScroll01().totalCount = #self.TaskGroup
    self.TaskScroll01():RefillCells()
    ---一键领取按钮状态
    self.Btn_Lingqu().gameObject:SetActive(self.CurDotState)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end
return M