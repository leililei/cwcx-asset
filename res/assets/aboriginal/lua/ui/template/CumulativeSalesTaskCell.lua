-- Code Auto Create Begin
local M = Class('CumulativeSalesTaskCell', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CumulativeSalesTaskCell.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_ClickBg','Img_ClickBg',2},{'Img_ClearBg','Img_ClearBg',2},{'Img_ProgressBarBg','ContentRoot/Img_ProgressBarBg',2},{'Img_ProgressBar','ContentRoot/Img_ProgressBarBg/Img_ProgressBar',2},{'Img_Arrow','ContentRoot/Text_Toward/Img_Arrow',2},{'CompletedRoot','CompletedRoot',2},{'Img_CompletedBg','CompletedRoot/Img_CompletedBg',2},
        -- UITemplate 列表
        {'CumulativeSalesTaskCell','/',10},{'RewardItem','RewardRoot/RewardItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Content','ContentRoot/Text_Content',20},{'Text_Progress','ContentRoot/Text_Progress',20},{'Text_Toward','ContentRoot/Text_Toward',20},{'Text_Completed','CompletedRoot/Img_CompletedBg/Text_Completed',20},
    }
end
-- Code Auto Create End
--- 该项是在 Activity_CumulativeSales 需求下制作的。
--- 用于 Activity_CumulativeSales/TaskCell;
---@class CumulativeSalesTaskCell : UIItemBase
---@field m_data CumulativeSalesTaskCell.DataCls
---@field Img_ClickBg fun():UnityEngine.UI.Image
---@field Img_ClearBg fun():UnityEngine.UI.Image
---@field CompletedRoot fun():UnityEngine.UI.Image
---@field Text_Content fun():TMPro.TextMeshProUGUI
---@field Text_Progress fun():TMPro.TextMeshProUGUI
---@field Img_ProgressBar fun():UnityEngine.UI.Image
---@field RewardItem fun():UITemplate
local CellCls = M
---@type CumulativeSalesTaskCell.DataCls
local DataCls

--region 生命周期
function CellCls:OnInit()
    self.ClearRoot = self:Find("ClearRoot")
    ---@type UITemplate[]
    self.RewardItemList = {}

    self.m_data = DataCls.New()
    self.m_data:OnInit()

    UIEvent.LuaClick(self.Img_ClickBg().gameObject, Handle(self, self.OnSelfClick))
end

---@param pData CumulativeSalesTaskCell.InputData
function CellCls:OnUpdateUI(pData)
    self.m_data:InputData(pData)
    self:DoRefreshUI()
end

function CellCls:RefreshUI()
    self.m_data:RefreshData()
    self:DoRefreshUI()
end
--endregion 生命周期

--region UI
function CellCls:DoRefreshUI()
    local data = self.m_data
    self.Text_Content().text = data.content
    self.Text_Progress().text = string.format("%s<color=#7A7A7A>/%s</color>",
            JNStrTool.numberAbbr(data.progress), JNStrTool.numberAbbr(data.maxProgress))
    self.Img_ProgressBar().fillAmount = data.progress / data.maxProgress
    self:DoRefreshUI_State()
    self:DoRefreshUI_Reward()
end

function CellCls:DoRefreshUI_State()
    local StateEnum = self.m_data.StateEnum
    local state = self.m_data.state
    self.Img_ClearBg().gameObject:SetActive(state == StateEnum.CanReceive)
    self.CompletedRoot().gameObject:SetActive(state == StateEnum.Completed)
end

function CellCls:DoRefreshUI_Reward()
    local rewardInputList = self.m_data.rewardInputList
    self:AlignRewardItems(#rewardInputList)
    for i, inputData in ipairs(rewardInputList) do
        local rewardItem = self.RewardItemList[i]
        rewardItem:SetData(inputData)
    end
end

---@param count int
function CellCls:AlignRewardItems(count)
    if #self.RewardItemList < count then
        local rewardItem = self.RewardItem()
        local rewardRoot = rewardItem.transform.parent
        for i = #self.RewardItemList + 1, count do
            local newItem = rewardItem
            if i > 1 then
                newItem = GameObject.Instantiate(rewardItem.gameObject, rewardRoot)
                newItem = newItem:GetComponent("UITemplate")
            end
            self.RewardItemList[i] = newItem
        end
    end

    for i, rewardItem in ipairs(self.RewardItemList) do
        rewardItem.gameObject:SetActive(i <= count)
    end
end
--endregion UI

--region Callback
---@protected
function CellCls:OnSelfClick()
    local clickCallback = self.m_data.inputData.clickCallback
    if clickCallback then
        clickCallback(self.m_data.inputData.index)
    end
end
--endregion Callback



--region DataCls
---@class CumulativeSalesTaskCell.InputData
---@field index int? @ 用作 clickCallback 参数
---@field clickCallback fun(index:int)?
---@field taskType CumulativeSalesViewModel.TaskTypeEnum
---@field taskData AchievementTaskData | DayTaskData

---@class CumulativeSalesTaskCell.DataCls
---@field inputData CumulativeSalesTaskCell.InputData
---@field state CumulativeSalesTaskCell.StateEnum
---@field content string
---@field progress int
---@field maxProgress int
---@field rewardInputList GoodsItem.InputData[]
DataCls = Class("CumulativeSalesTaskCell.DataCls")

---@alias CumulativeSalesTaskCell.StateEnum int
DataCls.StateEnum = {
    OnGoing = 0, -- 进行中
    CanReceive = 1, -- 可领取
    Completed = 2, -- 已完成
}

function DataCls:OnInit()
    self.rewardInputList = {}
end

---@param inputData CumulativeSalesTaskCell.InputData
function DataCls:InputData(inputData)
    if not inputData then
        return
    end
    self.inputData = inputData
    self:RefreshData()
end

function DataCls:RefreshData()
    local taskType = self.inputData.taskType
    local taskData = self.inputData.taskData
    self.content = taskData.txt
    if taskData.isComplete == 1 then
        self.state = self.StateEnum.Completed
    elseif taskData.isReceive == 1 then
        self.state = self.StateEnum.CanReceive
    else
        self.state = self.StateEnum.OnGoing
    end

    local rewardList = taskData.reward
    local listCount = math.max(#self.rewardInputList, #rewardList)
    for i = 1, listCount do
        local reward = rewardList[i]
        if reward then
            self.rewardInputList[i] = {
                index = i,
                defaultClick = 1,
                goods = Copy(reward),
            }
        else
            self.rewardInputList[i] = nil
        end
    end

    local progress, maxProgress = CumulativeSalesViewModel.GetTaskProgress(taskType, taskData.id, taskData.type)
    self.progress = math.min(progress, maxProgress)
    self.maxProgress = maxProgress
end
--endregion DataCls

return M
