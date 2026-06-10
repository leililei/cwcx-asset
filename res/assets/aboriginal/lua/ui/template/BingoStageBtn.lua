-- Code Auto Create Begin
local M = Class('BingoStageBtn', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BingoStageBtn.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BingoStageBtn','/',2},{'Img_Mask','Img_Mask',2},{'Img_Lock','Img_Lock',2},
        -- UITemplate 列表
        {'BingoStageBtn01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Btn','Text_Btn',20},
    }
end
-- Code Auto Create End
---@class BingoStageBtn : UIItemBase
---@field m_inputData BingoStageBtn.InputData
---@field BingoStageBtn fun():UnityEngine.UI.Image
---@field Text_Btn fun():TMPro.TextMeshProUGUI
---@field Img_Mask fun():UnityEngine.UI.Image
---@field Img_Lock fun():UnityEngine.UI.Image
local CellCls = M

--region 生命周期
function CellCls:OnInit()
    UIEvent.LuaClick(self.BingoStageBtn().gameObject, Handle(self, self.OnSelfClick))
end

---@param pData BingoStageBtn.InputData
function CellCls:OnUpdateUI(pData)
    self.m_inputData = CheckTable(pData)
    self.Text_Btn().text = string.format(MgrLanguageData.GetLanguageByKey("ui_bingo_ui_text1"), pData.stage)
    self.Img_Mask().gameObject:SetActive(not pData.bSelect)
    self.Img_Lock().gameObject:SetActive(CheckBool(pData.bLock))
end
--endregion 生命周期

--region Callback
---@protected
function CellCls:OnSelfClick()
    local clickCallback = self.m_inputData.clickCallback
    if clickCallback then
        clickCallback(self.m_inputData.index)
    end
end
--endregion Callback


--region DataCls
---@class BingoStageBtn.InputData
---@field index int? @ clickCallback 参数
---@field clickCallback fun(index:int)?
---@field stage int
---@field bSelect boolean
---@field bLock boolean
--endregion DataCls

return M