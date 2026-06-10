-- Code Auto Create Begin
local M = Class('BingoRedPacketItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = ""
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Cover','Cover/Img_Cover',2},{'Flipped','Flipped',2},{'Img_Flipped','Flipped/Img_Flipped',2},
        -- UITemplate 列表
        {'BingoRedPacketItem','/',10},{'GoodsItem','Flipped/GoodsItem',10},
    }
end
-- Code Auto Create End
---@class BingoRedPacketItem : UIItemBase
---@field m_data BingoRedPacketItem.DataCls
---@field CoverRoot UnityEngine.GameObject @ 未翻开
---@field FlippedRoot UnityEngine.GameObject @ 已翻开
---@field EffectRoot UnityEngine.GameObject @ 翻开特效
---@field Img_Cover fun():UnityEngine.UI.Image
---@field GoodsItem fun():UITemplate @ GoodsItem
local CellCls = M
---@type BingoRedPacketItem.DataCls
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
    
    self.CoverRoot = ConfirmFind("Cover")
    self.FlippedRoot = ConfirmFind("Flipped")
    self.EffectRoot = ConfirmFind("Flipped/Ui_TX_058")
    
    self.m_data = DataCls.New()
    self.m_data:OnInit()
    
    UIEvent.LuaClick(self.Img_Cover().gameObject, Handle(self, self.OnCoverClick))
end

---@param pData BingoRedPacketItem.InputData
function CellCls:OnUpdateUI(pData)
    self.m_data:InputData(pData)
    self:DoRefreshUI()
end
--endregion 生命周期

--region UI
function CellCls:DoRefreshUI()
    local bFlipped = CheckBool(self.m_data.outputData.bFlipped)
    self.CoverRoot:SetActive(not bFlipped)
    self.FlippedRoot:SetActive(bFlipped)
    if self.m_data.outputData.bFlipped then
        self.GoodsItem():SetData(self.m_data.outputData.goodsInputData)
    end
    
    -- 播放翻开动画
    self.EffectRoot:SetActive(self.m_data.viewData.bFlipAnim)
    self.m_data.viewData.bFlipAnim = false
end
--endregion UI

--region Callback
---@protected
function CellCls:OnCoverClick()
    local clickCallback = self.m_data.inputData.clickCallback
    if clickCallback then
        clickCallback(self.m_data.inputData.index)
    end
end
--endregion Callback

--region DataCls
---@class BingoRedPacketItem.InputData
---@field index int? @ clickCallback 参数
---@field clickCallback fun(index:int)?
---@field bFlipped boolean
---@field goods goods? @ 翻开的才需要
---@field bFlipAnim boolean @ 播放翻开动画

---@class BingoRedPacketItem.ViewData
---@field bFlipAnim boolean

---@class BingoRedPacketItem.OutputData
---@field bFlipped boolean
---@field goodsInputData GoodsItem.InputData

---@class BingoRedPacketItem.DataCls
---@field inputData BingoRedPacketItem.InputData
---@field viewData BingoRedPacketItem.ViewData
---@field outputData BingoRedPacketItem.OutputData
DataCls = Class("BingoRedPacketItem.DataCls")

function DataCls:OnInit()
    self.inputData = {}
    self.viewData = {
        bFlipAnim = false,
    }
    self.outputData = {
        bFlipped = false,
        goodsInputData = {
            index = 1,
            defaultClick = 1,
        },
    }
end

---@param inputData BingoRedPacketItem.InputData
function DataCls:InputData(inputData)
    if not inputData then
        return
    end
    self.inputData = inputData
    self.viewData.bFlipAnim = inputData.bFlipAnim
    self:RefreshData()
end

function DataCls:RefreshData()
    self.outputData.bFlipped = self.inputData.bFlipped
    self.outputData.goodsInputData.goods = self.inputData.goods
end
--endregion DataCls

return M