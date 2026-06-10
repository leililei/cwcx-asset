-- Code Auto Create Begin
local M = Class('GoodsItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = ""
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Frame','Img_Frame',2},{'Img_Icon','Img_Icon',2},{'Img_NumBg','Img_NumBg',2},{'StarRoot','StarRoot',2},{'StarItem','StarRoot/StarGroup/StarItem',2},{'StarHighlight','StarRoot/StarGroup/StarItem/StarHighlight',2},
        -- UITemplate 列表
        {'GoodsItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Num','Img_NumBg/Text_Num',20},
    }
end
-- Code Auto Create End
--- 该类是希望用于该样式下通用的物品显示
--- 由于 UITemplate 保存预设的问题，其会导致使用该类预制体在其它预制体内被重置，且所有组件引用丢失
--- 因此使用该类预制体必须 Unpack，以避免修改后保存预设导致的问题
--- 也因此，该类预制体不能修改已有对象的树结构和名称，同时新增对象也要做好缺失检查
--- 若一定需要修改，只能新增预制体如 GoodsItem2
---@class GoodsItem : UIItemBase
---@field m_data GoodsItem.DataCls
---@field Img_Frame fun():UnityEngine.UI.Image
---@field Img_Icon fun():UnityEngine.UI.Image
---@field Text_Num fun():TMPro.TextMeshProUGUI
---@field StarRoot fun():UnityEngine.UI.Image
---@field StarItem fun():UnityEngine.UI.Image
local ItemCls = M
---@type GoodsItem.DataCls
local DataCls

--region 生命周期
function ItemCls:OnInit()
    ---@type GoodsItem.StarItemData[]
    self.StarItemList = {}
    
    self.m_data = DataCls.New()
    self.m_data:OnInit()
    
    UIEvent.LuaClick(self.Img_Icon().gameObject, Handle(self, self.OnSelfClick))
end

---@param pData GoodsItem.InputData
function ItemCls:OnUpdateUI(pData)
    self.m_data:InputData(pData)
    self:DoRefreshUI()
end

--- 刷新数据和显示
function ItemCls:RefreshUI()
    self.m_data:RefreshData()
    self:DoRefreshUI()
end
--endregion 生命周期

--region UI
function ItemCls:DoRefreshUI()
    local data = self.m_data

    if not Global.IsNil(self.Img_Icon()) then
        MgrRes.LoadSprite(self.Img_Icon(), data.icon)
    end
    if not Global.IsNil(self.Img_Frame()) then
        MgrRes.LoadSprite(self.Img_Frame(), data.frame)
    end
    if not Global.IsNil(self.Text_Num()) then
        self.Text_Num().text = JNStrTool.numberAbbr(data.num)
    end
    self:DoRefreshUI_Star()
end

function ItemCls:DoRefreshUI_Star()
    if Global.IsNil(self.StarItem()) then
        return
    end
    if self.m_data.maxStar == 0 then
        if not Global.IsNil(self.StarRoot()) then
            self.StarRoot().gameObject:SetActive(false)
        end
        return
    end
    self:AlignStarItems(self.m_data.maxStar)
    for i, starData in ipairs(self.StarItemList) do
        local highlightGo = starData.HighlightGo
        if not Global.IsNil(highlightGo) then
            highlightGo:SetActive(i <= self.m_data.star)
        end
    end
end

--- 创建指定数量的星级
---@param count int
function ItemCls:AlignStarItems(count)
    if #self.StarItemList < count then
        local starItem = self.StarItem().gameObject
        local starRoot = starItem.transform.parent
        for i = #self.StarItemList + 1, count do
            ---@type GoodsItem.StarItemData
            local starData = {}
            self.StarItemList[i] = starData
            
            local newItem = starItem
            if i > 1 then
                newItem = GameObject.Instantiate(starItem, starRoot)
            end
            starData.RootGo = newItem
            
            ---@type UnityEngine.Transform
            local highlightTr = newItem.transform:Find("StarHighlight")
            if not Global.IsNil(highlightTr) then
                starData.HighlightGo = highlightTr.gameObject
            end
        end
    end

    for i, starData in ipairs(self.StarItemList) do
        starData.RootGo:SetActive(i <= count)
    end
end
--endregion UI

--region Callback
---@protected
function ItemCls:OnSelfClick()
    local clickCallback = self.m_data.inputData.clickCallback
    if clickCallback then
        clickCallback(self.m_data.inputData.index)
        return
    end
    local defaultClick = self.m_data.inputData.defaultClick or 0
    if defaultClick == 1 then
        local goods = self.m_data.inputData.goods
        local itemData = ItemControl.GetItemByIdAndType(goods.goodsID, goods.goodsType)
        if itemData then
            MgrUI.Pop(UID.ItemDetailPop_UI, { itemData, false }, true)
            return
        end
    end
end
--endregion Callback



--region DataDefine
---@class GoodsItem.StarItemData
---@field RootGo UnityEngine.GameObject
---@field HighlightGo UnityEngine.GameObject
--endregion DataDefine

--region DataCls
---@class GoodsItem.InputData
---@field index int? @ 作为 ClickCallback 参数
---@field clickCallback fun(index:int)?
---@field defaultClick int? @ default 0，1 = 弹出道具详情
---@field goods goods

---@class GoodsItem.DataCls
---@field inputData GoodsItem.InputData
---@field icon string
---@field frame string
---@field num int
---@field star int
---@field maxStar int @ 0 表示无星级
DataCls = Class("GoodsItem.DataCls")

function DataCls:OnInit()
    self.num = 0
    self.star = 0
    self.maxStar = 0
end

---@param inputData GoodsItem.InputData
function DataCls:InputData(inputData)
    if not inputData then
        return
    end
    self.inputData = inputData
    self:RefreshData()
end

function DataCls:RefreshData()
    local goods = self.inputData.goods
    local itemData = ItemControl.GetItemByIdAndType(goods.goodsID, goods.goodsType)
    if not itemData then
        return
    end
    
    self.icon = itemData.icon
    self.frame = itemData.iconFrame
    if Global.IsStrNil(self.frame) then
        self.frame = string.format("Item/Rank/ItemRank_%s", itemData.quality)
    end
    self.num = goods.goodsNum
    self.star = itemData.star
    if goods.goodsType == GoodsTypeEnum.CoreChip then
        self.maxStar = 6
    else
        self.maxStar = 0
    end
end
--endregion DataCls

return M