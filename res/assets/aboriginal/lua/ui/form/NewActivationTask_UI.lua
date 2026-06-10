-- Code Auto Create Begin
local M = Class('NewActivationTask_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewActivationTask_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewActivationTask_UI].prefab'
    self.Name = 'Form[NewActivationTask_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Xian4','RightPanel/Img_Xian4',2},{'Img_Xian3','RightPanel/Img_Xian3',2},{'di(you)','RightPanel/di(you)',2},{'TaskContent','RightPanel/VFXMask/TaskScroll/TaskContent',2},{'TypePanel','RightPanel/TypePanel',2},{'Btn_UnAllReceive','RightPanel/Btn_UnAllReceive',2},{'Img_OCReceivedi2','RightPanel/Btn_UnAllReceive/Img_OCReceivedi2',2},{'Btn_AllReceive','RightPanel/Btn_AllReceive',2},{'Img_OCReceivedi1','RightPanel/Btn_AllReceive/Img_OCReceivedi1',2},{'Img_RefreshDi','IntegralPanel/IntegralCountPanel/Img_RefreshDi',2},{'Img_IntegralCountDi','IntegralPanel/IntegralCountPanel/Img_IntegralCountDi',2},{'Img_Jifendianshudi','IntegralPanel/IntegralCountPanel/Img_Jifendianshudi',2},{'VFXMask','IntegralPanel/VFXMask',2},{'Btn_Return','Btn_Return',2},{'Btn_I','Btn_I',2},
        -- UITemplate 列表
        {'TaskItem','RightPanel/VFXMask/TaskScroll/TaskItem',10},{'TaskFilterToggle','RightPanel/TypePanel/TaskFilterToggle',10},{'IntegralItem','IntegralPanel/VFXMask/IntegralScroll/IntegralItem',10},
        -- Toggle 列表
        {'TaskFilterToggle01','RightPanel/TypePanel/TaskFilterToggle',13},
        -- RawImage 列表
        {'TaskScroll','RightPanel/VFXMask/TaskScroll',15},{'IntegralScroll','IntegralPanel/VFXMask/IntegralScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','RightPanel/VFXMask/TaskScroll',18},{'IntegralScroll01','IntegralPanel/VFXMask/IntegralScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_OCReceive2','RightPanel/Btn_UnAllReceive/Text_OCReceive2',20},{'Text_OCReceive1','RightPanel/Btn_AllReceive/Text_OCReceive1',20},{'Text_RefreshTime','IntegralPanel/IntegralCountPanel/Img_RefreshDi/Text_RefreshTime',20},{'Text_IntegralMax','IntegralPanel/IntegralCountPanel/Text_IntegralMax',20},{'Text_CurIntegral','IntegralPanel/IntegralCountPanel/Text_CurIntegral',20},{'Text_IntegralTitle','IntegralPanel/IntegralCountPanel/Img_Jifendianshudi/Text_IntegralTitle',20},{'Text_ActiveTask','Btn_Return/Text_ActiveTask',20},{'Text_Huoyuerengwu','Btn_Return/Text_Huoyuerengwu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ActivationTaskViewModel.ReceivedCallBack = Handle(self,self.UpdataPanel)
    self.CanReceiveCount = 0
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化顶部toggle
    self:InitTopTypePanel()
    ---初始化按钮
    self:InitButton()
    ---初始化计时
    self:InitClock()
    TaskControl.UpdatePanel = Handle(self,self.UpdataPanel)
end

function M:OnBackShow()
    self:UpdataPanel()
end

function M:OnShowFinish()
    NoviceViewModel.CheckFirstGuide(41)
end
---注册滑块
function M:RegisterLoopScroll()
    self.IntegralScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.TaskCellItem))
end
---左侧积分回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurIntegralLoopList[idx]})
end
---任务回调
function M:TaskCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurTaskLoopList[idx],self})
end
---设置左侧积分滑动数据
function M:ReloadIntegralData(offset)
    ---获取当前loop数据
    ---@type IntegralTaskData[]
    self.CurIntegralLoopList = ActivationTaskViewModel.GetIntegralTask(self.CurSortType)
    ---设置Loop数量
    self.IntegralScroll01().totalCount = #self.CurIntegralLoopList
    if offset then
        self.IntegralScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.IntegralScroll01():RefreshCells()              ---只刷新数据
    end
end
---设置任务滑动数据
function M:ReloadTaskData(offset)
    ---获取当前loop数据
    ------@type IntegralTaskData[]
    self.CurTaskLoopList = ActivationTaskViewModel.GetDayTask(self.CurSortType + 1000)
    ---设置Loop数量
    self.TaskScroll01().totalCount = #self.CurTaskLoopList
    if offset then
        self.TaskScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.TaskScroll01():RefreshCells()              ---只刷新数据
    end
end
---初始化顶部toggle
function M:InitTopTypePanel()
    self.CurSortType = 1        ---当前排序类型(1每日,2每周，3每月)
    self.RoleIsRise = false
    ---排序器
    local sorts = {
        [1] = MgrLanguageData.GetLanguageByKey("newactivationtask_ui_daily"),
        [2] = MgrLanguageData.GetLanguageByKey("newactivationtask_ui_weekly"),
        [3] = MgrLanguageData.GetLanguageByKey("newactivationtask_ui_monthly")
    }
    local t_sort = self:CreateFilterToggle(sorts,self.TaskFilterToggle().gameObject,self.TypePanel().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
        if self.CurSortType == sort and self.RoleIsRise == isRise then
            print("重复待处理2")
        end
        self.CanReceiveCount = 0
        self.CurSortType = sort
        self.RoleIsRise = isRise
        self:RefreshTime()
        self:ReloadIntegralData(offset)
        self:ReloadTaskData(offset)
        self:UpdataIntegralPanel()
    end))
    self:UpdateRedDot()
    self.TaskFilterToggle().gameObject:SetActive(false)
    ---默认排序
    t_sort[1].isOn = false
    t_sort[1].isOn = true
end
---初始化按钮
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self,ActivationTaskViewModel.Close))
    ---帮助
    UIEvent.LuaClick(self.Btn_I().gameObject, Handle(self,function()
        HelpViewModel.Go(76)
    end))
    UIEvent.LuaClick(self.Btn_AllReceive().gameObject, function()
        self.CanReceiveCount = 0
        ActivationTaskViewModel.TaskPerform(self.CurSortType + 1000,0)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end


---更新积分
function M:UpdataIntegralPanel()
    local maxValue = 0
    for i, v in pairs(self.CurIntegralLoopList) do
        if maxValue < v.num then
            maxValue = v.num
        end
    end
    self.Text_IntegralMax().text ="/"..maxValue
    if self.CurSortType == 1 then
        self.Text_CurIntegral().text = TaskControl.dayScore
    elseif self.CurSortType == 2 then
        self.Text_CurIntegral().text = TaskControl.weekScore
    elseif self.CurSortType == 3 then
        self.Text_CurIntegral().text = TaskControl.monthScore
    end
end
function M:InitClock()
    MgrTimer.AddRepeat("TaskRefresh", 1, Handle(self,function()
        self:RefreshTime()
    end) , -1, nil)
end

function M:UpdataPanel()
    self.CanReceiveCount = 0
    self:UpdateRedDot()
    self:ReloadIntegralData(0)
    self:ReloadTaskData(0)
    self:UpdataIntegralPanel()
end

function M:UpdateRedDot()
    if RedDotControl.GetDotData("DayTask").State then
        self.RedDotObj[1]:SetActive(true)
    else
        self.RedDotObj[1]:SetActive(false)
    end
    if RedDotControl.GetDotData("WeekTask").State then
        self.RedDotObj[2]:SetActive(true)
    else
        self.RedDotObj[2]:SetActive(false)
    end
    if RedDotControl.GetDotData("MonthTask").State then
        self.RedDotObj[3]:SetActive(true)
    else
        self.RedDotObj[3]:SetActive(false)
    end
end

function M:RefreshTime()
    local type = "TODAY"
    if self.CurSortType == 1 then
        type = "TODAY"
    elseif self.CurSortType == 2 then
        type = "WEEK"
    elseif self.CurSortType == 3 then
        type = "MONTH"
    end
    local xx = ActivationTaskViewModel.GetLastTime(type)    --获得剩余时间
    local day = math.floor(xx/86400)
    local hour = math.floor(xx%86400/3600)
    local min = math.floor(xx%86400%3600/60)
    local sec = math.floor(xx%86400%3600%60)
    self.Text_RefreshTime().text =string.format(MgrLanguageData.GetLanguageByKey("newactivationtask_ui_refreshtime"),day,hour,min)
    if hour == 0 and min == 0 and sec == 0 then
        --清理所有任务数据
        --TaskControl.ClearAllTaskData()
        --刷新面板
        self:UpdataPanel()
    end
end
---创建标签
function M:CreateFilterToggle(filters,prefab,parentTrans,callback)
    local toggles = {}
    self.RedDotObj = {}
    for idx, name in ipairs(filters) do
        local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
        local obj = togTrans:Find("RedDotIcon").gameObject
        table.insert(self.RedDotObj,obj)
        togTrans:GetComponent("UITemplate"):SetData({name,function(...)
            callback(idx,...)
        end})
        toggles[idx] = togTrans:GetComponent("Toggle")
    end
    return toggles
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("TaskRefresh")
    ActivationTaskViewModel.ReceivedCallBack = nil
    TaskControl.UpdatePanel = nil
end
return M