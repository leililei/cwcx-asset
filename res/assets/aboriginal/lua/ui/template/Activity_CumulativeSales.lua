-- Code Auto Create Begin
local M = Class('Activity_CumulativeSales', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_CumulativeSales.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Background','Img_Background',2},{'TaskTabRoot','TaskListRoot/TaskTabRoot',2},{'TaskTabItem','TaskListRoot/TaskTabRoot/TaskTabItem',2},{'Img_TabNormal','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabNormal',2},{'Img_TabHighlight','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabHighlight',2},{'RedDot_TaskTab','TaskListRoot/TaskTabRoot/TaskTabItem/RedDot_TaskTab',2},{'TaskContent','TaskListRoot/TaskScroll/TaskContent',2},{'Btn_AllCollect','Btn_AllCollect',2},{'Btn_Store','Btn_Store',2},{'CoinItem','CoinItem',2},{'Img_CoinBg','CoinItem/Img_CoinBg',2},{'Img_Coin','CoinItem/Img_Coin',2},
        -- UITemplate 列表
        {'Activity_CumulativeSales','/',10},{'TaskCell','TaskListRoot/TaskScroll/TaskCell',10},
        -- LoopScrollRect 列表
        {'TaskScroll','TaskListRoot/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TabTitle','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabNormal/Text_TabTitle',20},{'Text_TabTitle01','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabHighlight/Text_TabTitle',20},{'Text_Time','Text_Time',20},{'Text_AllCollect','Btn_AllCollect/Text_AllCollect',20},{'Text_AllCollect01','Btn_Store/Text_AllCollect',20},{'Text_CoinNum','CoinItem/Text_CoinNum',20},
    }
end
-- Code Auto Create End
---@class Activity_CumulativeSales : UIItemBase
---@field m_data Activity_CumulativeSales.DataCls
---@field Btn_Store fun():UnityEngine.UI.Image
---@field Btn_AllCollect fun():UnityEngine.UI.Image
---@field Text_Time fun():TMPro.TextMeshProUGUI
---@field CoinItem fun():UnityEngine.UI.Image
---@field Img_Coin fun():UnityEngine.UI.Image
---@field Text_CoinNum fun():TMPro.TextMeshProUGUI
---@field TaskTabItem fun():UnityEngine.UI.Image
---@field TaskScroll fun():UnityEngine.UI.LoopScrollRect
local ItemCls = M
---@type Activity_CumulativeSales.DataCls
local DataCls

--region 生命周期
function ItemCls:OnInit()
    ---@type Activity_CumulativeSales.TaskTabData[]
    self.TaskTabList = {}

    self.m_data = DataCls.New()
    self.m_data:OnInit()

    UIEvent.LuaClick(self.Btn_Store().gameObject, Handle(self, self.OnBtnStoreClick))
    UIEvent.LuaClick(self.Btn_AllCollect().gameObject, Handle(self, self.OnBtnAllCollectClick))
    UIEvent.LuaClick(self.CoinItem().gameObject, Handle(self, self.OnCoinClick))

    ---@param trans UnityEngine.Transform
    ---@param index int
    self.TaskScroll():SetLuaCellEvent(function(trans, index)
        local taskInputList = self.m_data:GetCurrentTaskInputList()
        trans:GetComponent("UITemplate"):SetData(taskInputList[index])
    end)
end

---@param pData any[] @ [1] = activityId; [2] = HuoDongPop_UI
function ItemCls:OnUpdateUI(pData)
    self.m_data:InputData(pData)
    self:DoRefreshData()
    self:DoRefreshUI_Time()
    self:DoRefreshUI_Coin()
    self:InitRefreshUI_TaskTab()
    self:InitRefreshUI_Task()
end

function ItemCls:RefreshUIAfterTask()
    self.m_data:RefreshDataAfterTask()
    self:DoRefreshData()
    self:DoRefreshUI_Coin()
    self:DoRefreshUI_TaskTab()
    self:DoRefreshUI_Task()
end
--endregion 生命周期

--region UI
function ItemCls:DoRefreshUI_Time()
    local activityData = self.m_data.activityData
    if activityData.timeType == 999 then
        -- 无时限
        self.Text_Time().gameObject:SetActive(false)
    else
        self.Text_Time().gameObject:SetActive(true)
        local timeStr = CumulativeSalesViewModel.TimeStrConvert01(activityData.beginTime, activityData.endTime)
        self.Text_Time().text = timeStr
    end
end

function ItemCls:DoRefreshUI_Coin()
    local coinGoods = self.m_data.coinGoods
    if not coinGoods then
        self.CoinItem().gameObject:SetActive(false)
        return
    end
    self.CoinItem().gameObject:SetActive(true)
    self.Text_CoinNum().text = JNStrTool.numberAbbr(coinGoods.goodsNum)
    if not Global.IsStrNil(coinGoods.goodsIcon) then
        MgrRes.LoadSprite(self.Img_Coin(), coinGoods.goodsIcon)
    end
end

function ItemCls:InitRefreshUI_TaskTab()
    local taskPages = self.m_data.taskPages
    self:AlignTaskTabs(#taskPages)
    for i, taskPage in ipairs(taskPages) do
        local taskTab = self.TaskTabList[i]
        taskTab.NormalTxt.text = taskPage.title
        taskTab.HighlightTxt.text = taskPage.title
    end
    self:DoRefreshUI_TaskTab()
end

function ItemCls:DoRefreshUI_TaskTab()
    for i, taskPage in ipairs(self.m_data.taskPages) do
        local taskTab = self.TaskTabList[i]
        local bAtTab = i == self.m_data.currentPage
        taskTab.NormalGo:SetActive(not bAtTab)
        taskTab.HighlightGo:SetActive(bAtTab)
        taskTab.RedDotGo:SetActive(taskPage.bRedDot)
    end
end

---@param count int
function ItemCls:AlignTaskTabs(count)
    if #self.TaskTabList < count then
        local tabItem = self.TaskTabItem().gameObject
        local tabRoot = tabItem.transform.parent
        for i = #self.TaskTabList + 1, count do
            ---@type Activity_CumulativeSales.TaskTabData
            local tabData = {}
            self.TaskTabList[i] = tabData

            local newItem = tabItem
            if i > 1 then
                newItem = GameObject.Instantiate(tabItem, tabRoot)
            end
            tabData.RootGo = newItem

            ---@type UnityEngine.Transform
            local normalTr = newItem.transform:Find("Img_TabNormal")
            if normalTr then
                tabData.NormalGo = normalTr.gameObject
                ---@type UnityEngine.Transform
                local txtTr = normalTr:Find("Text_TabTitle")
                if txtTr then
                    tabData.NormalTxt = txtTr:GetComponent("TextMeshProUGUI")
                end
            end

            ---@type UnityEngine.Transform
            local highlightTr = newItem.transform:Find("Img_TabHighlight")
            if highlightTr then
                tabData.HighlightGo = highlightTr.gameObject
                ---@type UnityEngine.Transform
                local txtTr = highlightTr:Find("Text_TabTitle")
                if txtTr then
                    tabData.HighlightTxt = txtTr:GetComponent("TextMeshProUGUI")
                end
            end

            local redDotTr = newItem.transform:Find("RedDot_TaskTab")
            if redDotTr then
                tabData.RedDotGo = redDotTr.gameObject
            end

            UIEvent.LuaClick(newItem, function()
                self:OnTabClick(i)
            end)
        end
    end

    for i, tabData in ipairs(self.TaskTabList) do
        tabData.RootGo:SetActive(i <= count)
    end
end

function ItemCls:InitRefreshUI_Task()
    local taskScroll = self.TaskScroll()
    local taskInputList = self.m_data:GetCurrentTaskInputList()
    taskScroll.totalCount = #taskInputList
    -- 延迟一帧才能刷新出正确的项目数量
    -- 不延迟只会显示一条项目，推测是该界面 Active 的同帧执行时，获取子项高度会错误的为 0
    MgrTimer.AddDelayNoName(0.01, function()
        taskScroll:RefillCells()
    end)
end

function ItemCls:DoRefreshUI_Task()
    local taskInputList = self.m_data:GetCurrentTaskInputList()
    local taskScroll = self.TaskScroll()
    taskScroll.totalCount = #taskInputList
    taskScroll:RefillCells()
end
--endregion UI

--region Data
function ItemCls:DoRefreshData()
    for _, taskPage in ipairs(self.m_data.taskPages) do
        for _, taskInput in ipairs(taskPage.taskInputList) do
            taskInput.clickCallback = Handle(self, self.OnTaskClick)
        end
    end
end
--endregion Data

--region Callback
---@param index int
function ItemCls:OnTabClick(index)
    if index == self.m_data.currentPage then
        return
    end
    self.m_data:SetCurrentPage(index)
    self:DoRefreshUI_TaskTab()
    self:DoRefreshUI_Task()
end

---@protected
---@param index int
function ItemCls:OnTaskClick(index)
    local taskPage = self.m_data.taskPages[self.m_data.currentPage]
    if not taskPage then
        return
    end
    local taskData = taskPage.taskInputList[index].taskData
    if not taskData then
        return
    end

    if taskData.isComplete == 1 then
        return
    end

    if taskData.isReceive == 1 then
        CumulativeSalesViewModel.PerformTask(taskPage.taskType, taskPage.taskGroupId, taskData.id, function() 
            self:RefreshUIAfterTask()
        end)
    else
        MgrLink.LinkStart(taskData.gotoID)
    end
end

---@protected
function ItemCls:OnBtnAllCollectClick()
    if not self.m_data.bCanAllCollect then
        return
    end
    local taskPage = self.m_data:GetCurrentTaskPage()
    CumulativeSalesViewModel.PerformTask(taskPage.taskType, taskPage.taskGroupId, 0, function() 
        self:RefreshUIAfterTask()
    end)
end

---@protected
function ItemCls:OnBtnStoreClick()
    -- 借用 VM 传递参数
    ---@type CumulativeSalesShop_UI.InputData
    CumulativeSalesViewModel.SetShopFormArgs({
        activityId = self.m_data.cumulativeSalesData.shopType,
        shopType = self.m_data.cumulativeSalesData.shopType,
    })
    MgrUI.GoHide(UID.CumulativeSalesShop_UI)
end

---@protected
function ItemCls:OnCoinClick()
    local coinGoods = self.m_data.coinGoods
    if not coinGoods then
        return
    end
    local jumpStr = coinGoods.jumpStr
    if Global.IsStrNil(jumpStr) or jumpStr == "0" then
        return
    end
    MgrLink.LinkStart(jumpStr)
end
--endregion Callback



--region DataDefine
---@class Activity_CumulativeSales.TaskTabData
---@field RootGo UnityEngine.GameObject
---@field NormalGo UnityEngine.GameObject
---@field NormalTxt TMPro.TextMeshProUGUI
---@field HighlightGo UnityEngine.GameObject
---@field HighlightTxt TMPro.TextMeshProUGUI
---@field RedDotGo UnityEngine.GameObject

---@class Activity_CumulativeSales.TaskPage
---@field title string
---@field bRedDot boolean
---@field taskType CumulativeSalesViewModel.TaskTypeEnum
---@field taskGroupId int
---@field taskInputList CumulativeSalesTaskCell.InputData[]
--endregion DataDefine

--region DataCls
---@class Activity_CumulativeSales.DataCls
---@field activityData ActivityData
---@field cumulativeSalesData CumulativeSalesActivityData
---@field coinGoods CumulativeSalesCoinData
---@field bCanAllCollect boolean @ 可以执行“一键领取”，而非全部任务可以领取
---@field taskPages Activity_CumulativeSales.TaskPage[]
---@field currentPage int
DataCls = Class("Activity_CumulativeSales.DataCls")

function DataCls:OnInit()
    self.currentPage = 1
end

---@param inputData table
function DataCls:InputData(inputData)
    local activityId = inputData[1]
    --local activityForm = inputData[2]
    local activityData = ActivityControl.GetActivityByID(activityId)
    if not activityData then
        return
    end
    self.activityData = activityData
    local csData = CumulativeSalesViewModel.GetCumulativeSalesActivityData(activityId)
    if not csData then
        return
    end
    self.cumulativeSalesData = csData
    self:InitData_Coin()
    self:RefreshData_TaskData()
    self:RefreshData_TaskStates()
end

function DataCls:RefreshDataAfterTask()
    self:RefreshData_Coin()
    self:RefreshData_TaskData()
    self:RefreshData_TaskStates()
end

function DataCls:InitData_Coin()
    self.coinGoods = nil
    local shopType = self.cumulativeSalesData.shopType
    if shopType == 0 then
        return
    end
    local coinList = CumulativeSalesViewModel.GetShopCoinList(shopType)
    if #coinList == 0 then
        return
    end
    self.coinGoods = coinList[1]
end

function DataCls:RefreshData_Coin()
    CumulativeSalesViewModel.RefreshGoodsNum(self.coinGoods)
end

function DataCls:RefreshData_TaskData()
    ---@return Activity_CumulativeSales.TaskPage
    local BuildTaskPage = function(taskType, taskGroupId, taskGroupName) 
        local taskList = CumulativeSalesViewModel.GetTaskList(taskType, taskGroupId, true)
        local firstTask = taskList[1]
        if not firstTask then
            return nil
        end
        ---@type Activity_CumulativeSales.TaskPage
        local taskPage = {
            title = taskGroupName,
            bRedDot = firstTask.isReceive == 1,
            taskType = taskType,
            taskGroupId = taskGroupId,
            taskInputList = {},
        }
        for i, task in ipairs(taskList) do
            taskPage.taskInputList[i] = {
                index = i,
                taskType = taskType,
                taskData = task,
            }
        end
        return taskPage
    end

    self.taskPages = {}

    --- 日常任务要显示在最前面
    if self.cumulativeSalesData.dayTaskGroupId > 0 then
        local taskType = CumulativeSalesViewModel.TaskTypeEnum.DAILY
        local taskGroupId = self.cumulativeSalesData.dayTaskGroupId
        local taskGroupName = self.cumulativeSalesData.dayTaskGroupName
        local taskPage = BuildTaskPage(taskType, taskGroupId, taskGroupName)
        if taskPage then
            table.insert(self.taskPages, taskPage)
        end
    end

    for i, taskGroupId in ipairs(self.cumulativeSalesData.taskGroupIds) do
        local taskType = CumulativeSalesViewModel.TaskTypeEnum.ACHIEVEMENT
        local taskGroupName = self.cumulativeSalesData.taskGroupNames[i]
        local taskPage = BuildTaskPage(taskType, taskGroupId, taskGroupName)
        if taskPage then
            table.insert(self.taskPages, taskPage)
        end
    end
end

function DataCls:RefreshData_TaskStates()
    local bCanAllCollect = false
    local taskPage = self:GetCurrentTaskPage()
    local firstInputData = taskPage.taskInputList[1]
    if firstInputData then
        if firstInputData.taskData.isReceive == 1 then
            bCanAllCollect = true
        end
    end
    self.bCanAllCollect = bCanAllCollect
end

---@return Activity_CumulativeSales.TaskPage
function DataCls:GetCurrentTaskPage()
    return self.taskPages[self.currentPage]
end

---@return CumulativeSalesTaskCell.InputData[]
function DataCls:GetCurrentTaskInputList()
    local taskPage = self:GetCurrentTaskPage()
    return taskPage.taskInputList
end

---@param page int
function DataCls:SetCurrentPage(page)
    self.currentPage = page
    self:RefreshData_TaskStates()
end
--endregion DataCls

return M
