-- Code Auto Create Begin
local M = Class('EventTask_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EventTask_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EventTask_UI].prefab'
    self.Name = 'Form[EventTask_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_lifa','Img_lifa',2},{'Img_Xian4','RightPanel/Img_Xian4',2},{'Img_Xian3','RightPanel/Img_Xian3',2},{'TaskContent','RightPanel/VFXMask/TaskScroll/TaskContent',2},{'TypePanel','RightPanel/TypePanel',2},{'TaskFilterToggle_Daily','RightPanel/TypePanel/TaskFilterToggle_Daily',2},{'TaskFilterToggle_Total','RightPanel/TypePanel/TaskFilterToggle_Total',2},{'Btn_UnAllReceive','RightPanel/Btn_UnAllReceive',2},{'Img_OCReceivedi2','RightPanel/Btn_UnAllReceive/Img_OCReceivedi2',2},{'Btn_AllReceive','RightPanel/Btn_AllReceive',2},{'Img_OCReceivedi1','RightPanel/Btn_AllReceive/Img_OCReceivedi1',2},{'UpperLeftBtnPanel','TopView/UpperLeftBtnPanel',2},{'Btn_Back','TopView/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','TopView/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','TopView/UpperLeftBtnPanel/Btn_Help',2},
        -- Text 列表
        {'Text_OCReceive2','RightPanel/Btn_UnAllReceive/Text_OCReceive2',3},{'Text_OCReceive1','RightPanel/Btn_AllReceive/Text_OCReceive1',3},{'Text_Title_CN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_CN',3},{'Text_Title_EN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_EN',3},
        -- UITemplate 列表
        {'EventTaskItem','RightPanel/VFXMask/TaskScroll/EventTaskItem',10},{'TaskFilterToggle_Daily01','RightPanel/TypePanel/TaskFilterToggle_Daily',10},{'TaskFilterToggle_Total01','RightPanel/TypePanel/TaskFilterToggle_Total',10},
        -- Toggle 列表
        {'TaskFilterToggle_Daily02','RightPanel/TypePanel/TaskFilterToggle_Daily',13},{'TaskFilterToggle_Total02','RightPanel/TypePanel/TaskFilterToggle_Total',13},
        -- RawImage 列表
        {'TaskScroll','RightPanel/VFXMask/TaskScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','RightPanel/VFXMask/TaskScroll',18},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.CanReceiveCount = 0
    self.EventTaskItem().gameObject:SetActive(false)
    ---当前界面是每日任务还是累计任务
    self.TaskType = {
        DAILY = 1,
        TOTAL = 2
    }
    self.CurTaskType = self.TaskType.DAILY
    self.EventData = EventRaidControl.GetEventData()
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化按钮
    self:InitButton()
    ---数据刷新
    self:UpdateRedDot()                 --红点更新
    self:ReloadTaskData(0)      --重载任务数据
    ---初始化计时
    self:InitClock()
    ActivationTaskViewModel.ReceivedCallBack = Handle(self,self.UpdataPanel)
    TaskControl.UpdatePanel = Handle(self,self.UpdataPanel)
end
function M:OnUpdateUI()
    self:UpdataPanel()
end
function M:UpdataPanel()
    self:UpdateRedDot()        --红点更新
    self:ReloadTaskData(0)      --重载任务数据
    if self.CanReceiveCount > 0 then
        self.Btn_AllReceive().gameObject:SetActive(true)
        self.Btn_UnAllReceive().gameObject:SetActive(false)
    else
        self.Btn_AllReceive().gameObject:SetActive(false)
        self.Btn_UnAllReceive().gameObject:SetActive(true)
    end
end
---注册滑块
function M:RegisterLoopScroll()
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.TaskCellItem))
end
---任务回调
function M:TaskCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurTaskLoopList[idx],self})
end
---设置任务滑动数据
function M:ReloadTaskData(offset)
    self.CanReceiveCount = 0
    ---获取当前loop数据
    self.CurTaskLoopList = {}
    if self.CurTaskType == self.TaskType.DAILY then
        ---@type DayTaskData[]
        self.CurTaskLoopList = ActivationTaskViewModel.GetEventRaidTask()
    else
        ---@type AchievementTaskData[]
        self.CurTaskLoopList = AchievementViewModel.GetTask(TaskControl.AchievementTaskType.ACTIVITY_STORY,false,self.EventData.taskId)
    end
    ---设置Loop数量
    self.TaskScroll01().totalCount = #self.CurTaskLoopList
    if offset then
        self.TaskScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.TaskScroll01():RefreshCells()              ---只刷新数据
    end
    ---一键领取按钮
    if self.CanReceiveCount > 0 then
        self.Btn_AllReceive().gameObject:SetActive(true)
        self.Btn_UnAllReceive().gameObject:SetActive(false)
    else
        self.Btn_AllReceive().gameObject:SetActive(false)
        self.Btn_UnAllReceive().gameObject:SetActive(true)
    end
end
---初始化按钮
function M:InitButton()
    ---帮助界面
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(101)
    end))
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        ActivationTaskViewModel.Close()
    end))
    ---领取所有奖励
    UIEvent.LuaClick(self.Btn_AllReceive().gameObject, function()
        self.CanReceiveCount = 0
        if self.CurTaskType == self.TaskType.DAILY then
            ActivationTaskViewModel.TaskPerform(51,0, self, self.EventData.dayTaskId)
        else
            AchievementViewModel.TaskPerform(0,0, self, self.EventData.taskId)
        end
    end)
    ---初始化两个Toggle
    local toggles = {
        self.TaskFilterToggle_Daily02(),
        self.TaskFilterToggle_Total02(),
    }
    local ReloadInfo = {
        [1] = Handle(self, self.ClickDaily),
        [2] = Handle(self, self.ClickTotal),
    }
    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Normal","HighLight")
        high:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self:ToggleClick(...,normal,high, ReloadInfo[idx])
        end,nil)
    end
    self.TaskFilterToggle_Daily02().isOn = false
    self.TaskFilterToggle_Daily02().isOn = true
end
---获取高光组件
function M.GetHighObj(Obj,normalStr,highStr)
    return Obj.transform:Find(normalStr).gameObject, Obj.transform:Find(highStr).gameObject
end
function M:ToggleClick(isOn, normal, high,initFun)
    normal:SetActive(not isOn)
    high:SetActive(isOn)
    if isOn then
        initFun()
    end
end
function M:ClickDaily()
    self.CurTaskType = self.TaskType.DAILY
    self:ReloadTaskData(0)
end
function M:ClickTotal()
    self.CurTaskType = self.TaskType.TOTAL
    self:ReloadTaskData(0)
end
function M:UpdateRedDot()
    -----红点检查
    --TaskControl.CheckDotReceived()
    ---检查剧情活动红点
    --EventRaidViewModel.CheckRot()
    ---红点
    if RedDotControl.GetDotData("EventRaidTaskDaily").State then
        self.TaskFilterToggle_Daily().transform:Find("RedDotIconDaily").gameObject:SetActive(true)
    else
        self.TaskFilterToggle_Daily().transform:Find("RedDotIconDaily").gameObject:SetActive(false)
    end
    if RedDotControl.GetDotData("EventRaidTaskTotal").State then
        self.TaskFilterToggle_Total().transform:Find("RedDotIconTotal").gameObject:SetActive(true)
    else
        self.TaskFilterToggle_Total().transform:Find("RedDotIconTotal").gameObject:SetActive(false)
    end
end
---初始化时钟
function M:InitClock()
    MgrTimer.AddRepeat("TaskRefresh", 1, Handle(self,function()
        self:RefreshTime()
    end) , -1, nil)
end
---刷新时间
function M:RefreshTime()
    local xx = ActivationTaskViewModel.GetLastTime("TODAY")
    local day = math.floor(xx/86400)
    local hour = math.floor(xx%86400/3600)
    local min = math.floor(xx%86400%3600/60)
    local sec = math.floor(xx%86400%3600%60)
    if hour == 0 and min == 0 and sec == 0 then
        --清理所有任务数据
        --TaskControl.ClearAllTaskData()
        --刷新面板
        self:UpdataPanel()
    end
end

function M:OnClose()
    MgrTimer.Cancel("TaskRefresh")
    ActivationTaskViewModel.ReceivedCallBack = nil
    TaskControl.UpdatePanel = nil
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M