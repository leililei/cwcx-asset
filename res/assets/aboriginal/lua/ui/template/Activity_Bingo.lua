-- Code Auto Create Begin
local M = Class('Activity_Bingo', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Bingo.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Background','Img_Background',2},{'TaskContent','RightPanel/TaskScroll/TaskContent',2},{'CostItem','CentralPanel/CostItem',2},{'Img_Cost','CentralPanel/CostItem/Img_Cost',2},{'BlockMask','BlockMask',2},
        -- RaycastEx 列表
        {'StageBtnContent','CentralPanel/StageBtnScroll/StageBtnContent',8},
        -- UITemplate 列表
        {'Activity_Bingo','/',10},{'BingoRedPacketItem','CentralPanel/RedPacketGrid/BingoRedPacketItem',10},{'BingoRedPacketItem(1)','CentralPanel/RedPacketGrid/BingoRedPacketItem (1)',10},{'BingoRedPacketItem(2)','CentralPanel/RedPacketGrid/BingoRedPacketItem (2)',10},{'BingoRedPacketItem(3)','CentralPanel/RedPacketGrid/BingoRedPacketItem (3)',10},{'BingoRedPacketItem(4)','CentralPanel/RedPacketGrid/BingoRedPacketItem (4)',10},{'BingoRedPacketItem(5)','CentralPanel/RedPacketGrid/BingoRedPacketItem (5)',10},{'BingoRedPacketItem(6)','CentralPanel/RedPacketGrid/BingoRedPacketItem (6)',10},{'BingoRedPacketItem(7)','CentralPanel/RedPacketGrid/BingoRedPacketItem (7)',10},{'BingoRedPacketItem(8)','CentralPanel/RedPacketGrid/BingoRedPacketItem (8)',10},{'BingoRedPacketItem(9)','CentralPanel/RedPacketGrid/BingoRedPacketItem (9)',10},{'BingoRedPacketItem(10)','CentralPanel/RedPacketGrid/BingoRedPacketItem (10)',10},{'BingoRedPacketItem(11)','CentralPanel/RedPacketGrid/BingoRedPacketItem (11)',10},{'BingoRedPacketItem(12)','CentralPanel/RedPacketGrid/BingoRedPacketItem (12)',10},{'BingoRedPacketItem(13)','CentralPanel/RedPacketGrid/BingoRedPacketItem (13)',10},{'BingoRedPacketItem(14)','CentralPanel/RedPacketGrid/BingoRedPacketItem (14)',10},{'BingoRedPacketItem(15)','CentralPanel/RedPacketGrid/BingoRedPacketItem (15)',10},{'BingoRedPacketItem(16)','CentralPanel/RedPacketGrid/BingoRedPacketItem (16)',10},{'BingoRedPacketItem(17)','CentralPanel/RedPacketGrid/BingoRedPacketItem (17)',10},{'BingoRedPacketItem(18)','CentralPanel/RedPacketGrid/BingoRedPacketItem (18)',10},{'BingoRedPacketItem(19)','CentralPanel/RedPacketGrid/BingoRedPacketItem (19)',10},{'BingoRedPacketItem(20)','CentralPanel/RedPacketGrid/BingoRedPacketItem (20)',10},{'BingoRedPacketItem(21)','CentralPanel/RedPacketGrid/BingoRedPacketItem (21)',10},{'BingoRedPacketItem(22)','CentralPanel/RedPacketGrid/BingoRedPacketItem (22)',10},{'BingoRedPacketItem(23)','CentralPanel/RedPacketGrid/BingoRedPacketItem (23)',10},{'BingoRedPacketItem(24)','CentralPanel/RedPacketGrid/BingoRedPacketItem (24)',10},{'BingoRedPacketItem(25)','CentralPanel/RedPacketGrid/BingoRedPacketItem (25)',10},{'BingoRedPacketItem(26)','CentralPanel/RedPacketGrid/BingoRedPacketItem (26)',10},{'BingoRedPacketItem(27)','CentralPanel/RedPacketGrid/BingoRedPacketItem (27)',10},{'BingoRedPacketItem(28)','CentralPanel/RedPacketGrid/BingoRedPacketItem (28)',10},{'BingoRedPacketItem(29)','CentralPanel/RedPacketGrid/BingoRedPacketItem (29)',10},{'BingoRedPacketItem(30)','CentralPanel/RedPacketGrid/BingoRedPacketItem (30)',10},{'BingoRedPacketItem(31)','CentralPanel/RedPacketGrid/BingoRedPacketItem (31)',10},{'BingoRedPacketItem(32)','CentralPanel/RedPacketGrid/BingoRedPacketItem (32)',10},{'BingoRedPacketItem(33)','CentralPanel/RedPacketGrid/BingoRedPacketItem (33)',10},{'BingoRedPacketItem(34)','CentralPanel/RedPacketGrid/BingoRedPacketItem (34)',10},{'BingoRedPacketItem(35)','CentralPanel/RedPacketGrid/BingoRedPacketItem (35)',10},{'BingoRedPacketItem(36)','CentralPanel/RedPacketGrid/BingoRedPacketItem (36)',10},{'BingoRedPacketItem(37)','CentralPanel/RedPacketGrid/BingoRedPacketItem (37)',10},{'BingoRedPacketItem(38)','CentralPanel/RedPacketGrid/BingoRedPacketItem (38)',10},{'BingoRedPacketItem(39)','CentralPanel/RedPacketGrid/BingoRedPacketItem (39)',10},{'BingoRedPacketItem(40)','CentralPanel/RedPacketGrid/BingoRedPacketItem (40)',10},{'BingoRedPacketItem(41)','CentralPanel/RedPacketGrid/BingoRedPacketItem (41)',10},{'BingoRedPacketItem(42)','CentralPanel/RedPacketGrid/BingoRedPacketItem (42)',10},{'BingoRedPacketItem(43)','CentralPanel/RedPacketGrid/BingoRedPacketItem (43)',10},{'BingoRedPacketItem(44)','CentralPanel/RedPacketGrid/BingoRedPacketItem (44)',10},{'BingoRedPacketItem(45)','CentralPanel/RedPacketGrid/BingoRedPacketItem (45)',10},{'BingoRedPacketItem(46)','CentralPanel/RedPacketGrid/BingoRedPacketItem (46)',10},{'BingoRedPacketItem(47)','CentralPanel/RedPacketGrid/BingoRedPacketItem (47)',10},{'BingoRedPacketItem(48)','CentralPanel/RedPacketGrid/BingoRedPacketItem (48)',10},
        -- LoopScrollRect 列表
        {'TaskScroll','RightPanel/TaskScroll',18},{'StageBtnScroll','CentralPanel/StageBtnScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Time','RightPanel/Text_Time',20},{'Text_CostNum','CentralPanel/CostItem/Text_CostNum',20},{'Text_Explain','CentralPanel/Text_Explain',20},
    }
end
-- Code Auto Create End
---@class Activity_Bingo : UIItemBase
---@field m_data Activity_Bingo.DataCls
---@field BlockMask fun():UnityEngine.UI.Image
---@field Text_Time fun():TMPro.TextMeshProUGUI
---@field CostItem fun():UnityEngine.UI.Image
---@field Img_Cost fun():UnityEngine.UI.Image
---@field Text_CostNum fun():TMPro.TextMeshProUGUI
---@field StageBtnScroll fun():UnityEngine.UI.LoopScrollRect @ BingoStageBtn
---@field TaskScroll fun():UnityEngine.UI.LoopScrollRect @ BingoTaskItem
---@field RedPacketRoot UnityEngine.GameObject
---@field packetList UITemplate[] @ BingoRedPacketItem
local CellCls = M
---@type Activity_Bingo.DataCls
local DataCls

--region 生命周期
function CellCls:OnInit()
    ---@protected
    self.m_bClosed = false
    self.BlockMask().gameObject:SetActive(false)
    self:InitPacketList()

    self.m_data = DataCls.New()
    self.m_data:OnInit()

    self.StageBtnScroll():SetLuaCellEvent(Handle(self, self.StageBtnCellEvent))
    self.TaskScroll():SetLuaCellEvent(Handle(self, self.TaskCellEvent))
    UIEvent.LuaClick(self.CostItem().gameObject, Handle(self, self.OnCostClick))

    Event.Add(EID.HuoDongPopClose, Handle(self, self.OnClose))
end

---@protected
function CellCls:InitPacketList()
    self.RedPacketRoot = self:Find("CentralPanel/RedPacketGrid")
    self.packetList = {}

    ---@type UnityEngine.Transform
    local trans = self.RedPacketRoot.transform
    for i = 0, trans.childCount - 1 do
        ---@type UnityEngine.Transform
        local cellTrans = trans:GetChild(i)
        table.insert(self.packetList, cellTrans:GetComponent("UITemplate"))
    end
end

function CellCls:OnClose()
    self.m_bClosed = true
    -- 避免下次切换回来，点击失效
    self:SetClickBlock(false)
    MgrTimer.Cancel(self.InitUITimerName)
    MgrTimer.Cancel(self.FlipTimer1Name)
    MgrTimer.Cancel(self.FlipTimer2Name)
    Event.Remove(EID.BingoDataArrived, Handle(self, self.FirstRefresh))
    Event.Remove(EID.HuoDongPopSwitch, Handle(self, self.OnHuoDongPopSwitch))
end

---@protected
---@param objName string
function CellCls:OnHuoDongPopSwitch(objName)
    -- 作为第一个活动时，可能会导致 OnClose 在打开界面时触发
    -- 因此要检查切换为其它界面才执行
    if not Global.IsNil(self.ObjRoot) and objName ~= self.ObjRoot.name then
        self:OnClose()
    end
end

---@param pData any[] @ [1] = activityId
function CellCls:OnUpdateUI(pData)
    -- 该界面可能反复切换打开
    self.m_bClosed = false

    local activityId = pData[1]
    self.m_data:InputData(pData)
    
    Event.Add(EID.BingoDataArrived, Handle(self, self.FirstRefresh))
    Event.Add(EID.HuoDongPopSwitch, Handle(self, self.OnHuoDongPopSwitch))

    MgrTimer.AddDelay(self.InitUITimerName, 0.01, function()
        self:FirstRefresh()
    end)

    --- 获取数据会要些时间，反应说是感觉不好
    --- 并且打开游戏就会获取数据，这里干脆不再执行
    --BingoViewModel.UpdateData(activityId, function()
    --    if self.m_bClosed then
    --        return
    --    end
    --    self:FirstRefresh()
    --end)
end

--- 该界面的特殊刷新，应该该界面的数据抵达时间不确定
---@protected
function CellCls:FirstRefresh()
    self.m_data:FirstRefreshData()
    self:DoRefreshData()
    self:DoRefreshUI()
end
--endregion 生命周期


--region Data
function CellCls:DoRefreshData()
    self:Internal_DoRefreshData_StageBtn()
    self:Internal_DoRefreshData_Packet()
    self:Internal_DoRefreshData_Task()
end

function CellCls:DoRefreshDataByTask()
    self.m_data:RefreshByTaskChanged()
    self:Internal_DoRefreshData_Task()
end

---@param stage
function CellCls:DoRefreshDataByStageChange(stage)
    self.m_data:SetShowStage(stage)
    self:Internal_DoRefreshData_StageBtn()
    self:Internal_DoRefreshData_Packet()
end

--region Data Internal
---@protected
function CellCls:Internal_DoRefreshData_StageBtn()
    for _, data in ipairs(self.m_data.outputData.stageBtnInputList) do
        data.clickCallback = Handle(self, self.OnStageBtnClick)
    end
end

---@protected
function CellCls:Internal_DoRefreshData_Packet()
    for _, data in ipairs(self.m_data.outputData.packetInputList) do
        data.clickCallback = Handle(self, self.OnPacketClick)
    end
end

---@protected
function CellCls:Internal_DoRefreshData_Task()
    for _, data in ipairs(self.m_data.outputData.taskInputList) do
        data.clickCallback = Handle(self, self.OnTaskClick)
    end
end
--endregion Data Internal
--endregion Data


--region UI
function CellCls:DoRefreshUI()
    self:Internal_DoRefreshUI_Time()
    self:Internal_DoRefreshUI_Cost()
    self:Internal_DoRefreshUI_StageBtn()
    self:Internal_DoRefreshUI_Package()
    self:Internal_DoRefreshUI_Task()
end

function CellCls:DoRefreshUIByTask()
    self:Internal_DoRefreshUI_Cost()
    self:Internal_DoRefreshUI_Task()
end

function CellCls:DoRefreshUIByStage()
    self:Internal_DoRefreshUI_Cost()
    self:Internal_DoRefreshUI_StageBtn()
    self:Internal_DoRefreshUI_Package()
end

--region UI Internal
---@protected
function CellCls:Internal_DoRefreshUI_Time()
    local timeStr = self.m_data.outputData.timeStr
    if Global.IsStrNil(timeStr) then
        self.Text_Time().gameObject:SetActive(false)
    else
        self.Text_Time().gameObject:SetActive(true)
        self.Text_Time().text = timeStr
    end
end

---@protected
function CellCls:Internal_DoRefreshUI_Cost()
    self.Text_CostNum().text = JNStrTool.numberAbbr(self.m_data.outputData.costCount)
    MgrRes.LoadSprite(self.Img_Cost(), self.m_data.outputData.costIcon)
end

---@protected
function CellCls:Internal_DoRefreshUI_StageBtn()
    local showStage = self.m_data.viewData.showStage
    local stageBtnInputList = self.m_data.outputData.stageBtnInputList
    self.StageBtnScroll().totalCount = #stageBtnInputList
    if self.m_data.viewData.bLocateStage then
        self.m_data.viewData.bLocateStage = false
        self.StageBtnScroll():RefillCells(showStage - 1)
    else
        self.StageBtnScroll():RefreshCells()
    end
end

---@protected
function CellCls:Internal_DoRefreshUI_Package()
    local packetInputList = self.m_data.outputData.packetInputList
    for index, packet in ipairs(self.packetList) do
        packet:SetData(packetInputList[index])
    end
end

---@protected
function CellCls:Internal_DoRefreshUI_Task()
    local taskInputList = self.m_data.outputData.taskInputList
    self.TaskScroll().totalCount = #taskInputList
    self.TaskScroll():RefillCells()
end
--endregion UI Internal
--endregion UI


--region Callback
---@protected
function CellCls:OnCostClick()
    if not BingoViewModel.HaveData() then return end
    local costGoods = self.m_data.outputData.costGoods
    local costItem = ItemControl.GetItemByIdAndType(costGoods.goodsID, costGoods.goodsType)
    MgrUI.Pop(UID.ItemDetailPop_UI, { costItem, false }, true)
end

---@protected
---@param trans UnityEngine.Transform
---@param index int
function CellCls:StageBtnCellEvent(trans, index)
    trans:GetComponent("UITemplate"):SetData(self.m_data.outputData.stageBtnInputList[index])
end

---@protected
---@param trans UnityEngine.Transform
---@param index int
function CellCls:TaskCellEvent(trans, index)
    trans:GetComponent("UITemplate"):SetData(self.m_data.outputData.taskInputList[index])
end

---@protected
---@param index int
function CellCls:OnStageBtnClick(index)
    if not BingoViewModel.HaveData() then return end
    local stage = index
    if not self.m_data:CanSwitchToStage(stage) then
        return
    end
    self:DoRefreshDataByStageChange(stage)
    self:DoRefreshUIByStage()
end

---@protected
---@param index int
function CellCls:OnPacketClick(index)
    if not BingoViewModel.HaveData() then return end
    
    local activityId = self.m_data.inputData.activityId
    local stage = self.m_data.viewData.showStage
    local x, y = self.m_data:ConvertToXY(index)
    
    --- 检查能否翻开
    local cellData = self.m_data.outputData.packetInputList[index]
    if cellData.bFlipped then
        return
    end
    if self.m_data.outputData.costCount < self.m_data.outputData.costGoods.goodsNum then
        return
    end
    
    if self:CheckCloseAndTip() then
        return
    end
    
    BingoViewModel.FlipCard(activityId, stage, x, y, function(points, rewards)
        if self.m_bClosed then
            return
        end
        self:FlipPacket(x, y, points, rewards)
    end)
end

---@protected
---@param index int
function CellCls:OnTaskClick(index)
    if not BingoViewModel.HaveData() then return end
    
    local activityId = self.m_data.inputData.activityId
    local taskData = self.m_data.outputData.taskInputList[index].taskData
    if taskData.state ~= 1 then
        return
    end

    if self:CheckCloseAndTip() then
        return
    end
    
    -- 全部领取
    BingoViewModel.ClaimTask(activityId, 0, function()
        if self.m_bClosed then
            return
        end
        self:DoRefreshDataByTask()
        self:DoRefreshUIByTask()
    end)
end
--endregion Callback


--- 要考虑挂机到活动活动结束的情况
---@return boolean
function CellCls:CheckCloseAndTip()
    local activityId = self.m_data.inputData.activityId
    if BingoViewModel.CheckActivityOpen(activityId) then
        return false
    end
    Global.PopTip("eventraidcontrol_tips3")
    return true
end

---@param bBlock boolean
function CellCls:SetClickBlock(bBlock)
    self.BlockMask().gameObject:SetActive(CheckBool(bBlock))
end

--- 特定于 TX_058 的时长
---@protected
CellCls.EffectDuration = 0.6
CellCls.InitUITimerName = "Activity_Bingo_InitUI_Delay"
---@protected
CellCls.FlipTimer1Name = "Activity_Bingo_Flip_Delay_1"
---@protected
CellCls.FlipTimer2Name = "Activity_Bingo_Flip_Delay_2"

---@param x int
---@param y int
---@param points NDATA_BingoInfo[]
---@param rewards goods[]
function CellCls:FlipPacket(x, y, points, rewards)
    self.m_data:RefreshData_Cost()
    self:Internal_DoRefreshUI_Cost()

    --- 屏蔽点击
    self:SetClickBlock(true)

    --- 1.翻开选中格
    local stage = self.m_data.viewData.showStage
    -- 找到翻开格数据
    ---@type NDATA_BingoInfo
    local targetPoint
    for i = #points, 1, -1 do
        local p = points[i]
        if p.stage == stage then
            if p.x == x and p.y == y then
                targetPoint = p
                table.remove(points, i)
            end
        else
            -- 不处理其它阶段的，也不应该有
            Global.LogError(string.format("翻开阶段%s格子时，返回了阶段%s的格子数据", stage, p.stage))
            table.remove(points, i)
        end
    end
    -- 处理选中格
    local index = self.m_data:ConvertToIndex(x, y)
    local packetData = self.m_data.outputData.packetInputList[index]
    packetData.bFlipped = true
    packetData.goods = CheckTable(targetPoint.goods)[1]
    packetData.bFlipAnim = true
    local packet = self.packetList[index]
    packet:SetData(packetData)

    --- 定义复用函数
    local FinishFunc = function()
        -- 阶段刷新
        self.m_data:RefreshData_CurrentStage()
        self.m_data:RefreshData_StageBtn()
        self:Internal_DoRefreshData_StageBtn()
        self:Internal_DoRefreshUI_StageBtn()
        -- 点击恢复
        self:SetClickBlock(false)
        -- 奖励弹窗
        MgrUI.Pop(UID.ItemAchievePop_UI,{rewards, function()
            -- 尝试跳转到当前最新阶段
            self:OnStageBtnClick(self.m_data.outputData.currentStage)
        end},true)
    end
    --- 定义复用函数

    MgrTimer.AddDelay(self.FlipTimer1Name, self.EffectDuration, function()
        if #points > 0 then
            --- 2.翻开附加格，如果有
            for _, p2 in ipairs(points) do
                local i2 = self.m_data:ConvertToIndex(p2.x, p2.y)
                local pdata2 = self.m_data.outputData.packetInputList[i2]
                pdata2.bFlipped = true
                pdata2.goods = CheckTable(p2.goods)[1]
                pdata2.bFlipAnim = true
                local pkt2 = self.packetList[i2]
                pkt2:SetData(pdata2)
            end
            --- 3.刷新其它显示，在全部翻开后
            MgrTimer.AddDelay(self.FlipTimer2Name, self.EffectDuration, FinishFunc)
        else
            --- 2.直接刷新显示
            FinishFunc()
        end
    end)
end


--region DataCls
---@class Activity_Bingo.InputData
---@field activityId int

---@class Activity_Bingo.ViewData
---@field showStage int
---@field bLocateStage boolean @ 将阶段按钮定位到选中阶段，每次执行都会重置为 false

---@class Activity_Bingo.OutputData
---@field timeStr string?
---@field xLen int
---@field yLen int
---@field costGoods goods @ 所需数量
---@field costCount int @ 持有数量
---@field costIcon string
---@field currentStage int
---@field stageBtnInputList BingoStageBtn.InputData[]
---@field packetInputList BingoRedPacketItem.InputData[]
---@field taskInputList BingoTaskItem.InputData[]

---@class Activity_Bingo.DataCls
---@field inputData Activity_Bingo.InputData
---@field viewData Activity_Bingo.ViewData
---@field outputData Activity_Bingo.OutputData
DataCls = Class("XXX.DataCls")

function DataCls:OnInit()
    self.inputData = {}
    self.viewData = {
        showStage = 1,
        bLocateStage = false,
    }
    self.outputData = {
        xLen = 7,
        yLen = 7,
        costGoods = {},
        costCount = 0,
        currentStage = 1,
        stageBtnInputList = {},
        packetInputList = {},
        taskInputList = {},
    }
end

---@param pData any[]
function DataCls:InputData(pData)
    local activityId = pData[1]
    self.inputData.activityId = activityId
    self.outputData.timeStr = BingoViewModel.GetTimeStr(activityId)
    self.outputData.xLen, self.outputData.yLen = BingoViewModel.GetBingoGridLen(activityId)
end

function DataCls:FirstRefreshData()
    self:RefreshData_CurrentStage()
    -- 设置打开界面时显示的阶段
    self.viewData.showStage = self.outputData.currentStage
    self.viewData.bLocateStage = true
    self:RefreshData_StageBtn()
    self:RefreshData_Cost()
    self:RefreshData_Packet()
    self:RefreshData_Task()
end

function DataCls:RefreshData_CurrentStage()
    local activityId = self.inputData.activityId
    self.outputData.currentStage = BingoViewModel.GetBingoCurrentStage(activityId)
end

--- 该方法依赖 currentStage/showStage，请先更新依赖数据
function DataCls:RefreshData_StageBtn()
    local activityId = self.inputData.activityId
    local maxStage = BingoViewModel.GetBingoMaxStage(activityId)
    local currentStage = self.outputData.currentStage
    local showStage = self.viewData.showStage
    
    local inputList = {}
    for i = 1, maxStage do
        ---@type BingoStageBtn.InputData
        local data = {
            index = i,
            stage = i,
            bSelect = i == showStage,
            bLock = i > currentStage,
        }
        table.insert(inputList, data)
    end
    
    self.outputData.stageBtnInputList = inputList
end

function DataCls:RefreshData_Cost()
    local activityId = self.inputData.activityId
    local stage = self.viewData.showStage
    local costGoods = BingoViewModel.GetBingoCost(activityId, stage)
    self.outputData.costGoods = costGoods

    local costItem = ItemControl.GetItemByIdAndType(costGoods.goodsID, costGoods.goodsType)
    self.outputData.costCount = costItem.count
    self.outputData.costIcon = costItem.icon
end

function DataCls:RefreshData_Packet()
    local activityId = self.inputData.activityId
    local stage = self.viewData.showStage
    local inputList = {}
    local i = 1
    for y = 1, self.outputData.yLen do
        for x = 1, self.outputData.xLen do
            local cell = BingoViewModel.GetBingoCell(activityId, stage, x, y)
            -- 因为是非源数据，且字段名相同，这里直接复用
            ---@type BingoRedPacketItem.InputData
            local data = cell
            data.index = i
            i = i + 1
            table.insert(inputList, data)
        end
    end
    
    self.outputData.packetInputList = inputList
end

function DataCls:RefreshData_Task()
    local activityId = self.inputData.activityId
    local taskList = BingoViewModel.GetBingoTasks(activityId)
    local inputList = {}
    for i, task in ipairs(taskList) do
        ---@type BingoTaskItem.InputData
        local data = {
            index = i,
            taskData = task,
        }
        table.insert(inputList, data)
    end
    
    self.outputData.taskInputList = inputList
end


---@param stage int
---@return boolean
function DataCls:CanSwitchToStage(stage)
    return not (stage == self.viewData.showStage or stage > self.outputData.currentStage)
end

--- 更新选中阶段、红包数据、消耗道具
---@param stage int
function DataCls:SetShowStage(stage)
    if not self:CanSwitchToStage(stage) then
        return
    end
    self.viewData.showStage = stage
    self:RefreshData_StageBtn()
    self:RefreshData_Packet()
    self:RefreshData_Cost()
end

--- 更新任务数据、消耗道具
function DataCls:RefreshByTaskChanged()
    self:RefreshData_Task()
    self:RefreshData_Cost()
end

---@param index int
---@return int, int
function DataCls:ConvertToXY(index)
    local x = (index - 1) % self.outputData.xLen + 1
    local y = math.floor((index - 1) / self.outputData.xLen) + 1
    return x, y
end

---@param x int
---@param y int
---@return int
function DataCls:ConvertToIndex(x, y)
    return (y - 1) * self.outputData.xLen + x
end
--endregion DataCls

return M