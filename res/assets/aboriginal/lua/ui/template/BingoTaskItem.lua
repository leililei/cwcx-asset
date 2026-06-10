-- Code Auto Create Begin
local M = Class('BingoTaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BingoTaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BingoTaskItem','/',2},{'Img_Finished','TaskFinished/Img_Finished',2},{'Img_ClearBg','TaskClaimed/Img_ClearBg',2},{'Img_Claimed','TaskClaimed/Img_Claimed',2},
        -- UITemplate 列表
        {'BingoTaskItem01','/',10},{'RewardItem','RewardItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Content','TaskContent/Text_Content',20},{'Text_Progress','TaskContent/Text_Progress',20},
    }
end
-- Code Auto Create End
---@class BingoTaskItem : UIItemBase
---@field m_data BingoTaskItem.DataCls
---@field BingoTaskItem fun():UnityEngine.UI.Image
---@field TaskFinished UnityEngine.GameObject @ 已完成
---@field TaskClaimed UnityEngine.GameObject @ 已领取
---@field Text_Content fun():TMPro.TextMeshProUGUI
---@field Text_Progress fun():TMPro.TextMeshProUGUI
---@field RewardItem fun():UITemplate @ GoodsItem
local CellCls = M
---@type BingoTaskItem.DataCls
local DataCls

--region 生命周期
function CellCls:OnInit()
    local ConfirmFind = function(pPath) 
        local go = self:Find(pPath)
        if not go then
            Global.LogError(string.format("界面%s未能找到对象%s", self.__cname, pPath))
            return self.ObjRoot
        end
        return go
    end
    
    self.TaskFinished = ConfirmFind("TaskFinished")
    self.TaskClaimed = ConfirmFind("TaskClaimed")
    
    self.m_data = DataCls.New()
    self.m_data:OnInit()
    
    UIEvent.LuaClick(self.BingoTaskItem().gameObject, Handle(self, self.OnSelfClick))
end

---@param pData BingoTaskItem.InputData
function CellCls:OnUpdateUI(pData)
    self.m_data:InputData(pData)
    self:DoRefreshUI()
end
--endregion 生命周期

--region UI
function CellCls:DoRefreshUI()
    local outputData = self.m_data.outputData
    self.Text_Content().text = outputData.content
    self.Text_Progress().text = string.format("%s/%s", 
        JNStrTool.numberAbbr(outputData.progress), JNStrTool.numberAbbr(outputData.maxProgress))
    self.TaskFinished:SetActive(outputData.state > 0)
    self.TaskClaimed:SetActive(outputData.state == 2)
    self.RewardItem():SetData(outputData.rewardInputData)
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
---@class BingoTaskItem.InputData
---@field index int? @ clickCallback 参数
---@field clickCallback fun(index:int)?
---@field taskData BingoTaskData

---@class BingoTaskItem.OutputData
---@field content string
---@field progress int
---@field maxProgress int
---@field state int @ 0-未完成；1-已完成；2-已领取
---@field rewardInputData GoodsItem.InputData

---@class BingoTaskItem.DataCls
---@field inputData BingoTaskItem.InputData
---@field outputData BingoTaskItem.OutputData
DataCls = Class("BingoTaskItem.DataCls")

function DataCls:OnInit()
    self.inputData = {}
    self.outputData = {
        content = "nil",
        progress = 0,
        maxProgress = 1,
        state = 0,
        rewardInputData = {
            index = 1,
            defaultClick = 1,
        },
    }
end

function DataCls:InputData(inputData)
    if not inputData then
        return
    end
    self.inputData = inputData
    self:RefreshData()
end

function DataCls:RefreshData()
    local taskData = self.inputData.taskData
    self.outputData.content = taskData.content
    self.outputData.progress = taskData.progress
    self.outputData.maxProgress = taskData.maxProgress
    self.outputData.state = taskData.state
    self.outputData.rewardInputData.goods = taskData.rewards[1]
end
--endregion DataCls

return M
