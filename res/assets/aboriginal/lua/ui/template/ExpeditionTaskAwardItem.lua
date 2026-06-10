-- Code Auto Create Begin
local M = Class('ExpeditionTaskAwardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ExpeditionTaskAwardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ExpeditionTaskAwardItem','/',2},{'Img_Award','Img_Award',2},{'Img_Possible','Img_Possible',2},{'Img_CountBg','Img_CountBg',2},
        -- UITemplate 列表
        {'ExpeditionTaskAwardItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Possible','Img_Possible/Text_Possible',20},{'Text_Count','Img_CountBg/Text_Count',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    self.data = pData[1]
    ---设置品质
    MgrRes.LoadSprite(self.ExpeditionTaskAwardItem(),"Item/Rank/ItemRank_"..self.data.config.quality)
    ---设置图标
    MgrRes.LoadSprite(self.Img_Award(),"Item/"..self.data.config.icon)
    ---设置数量
    self.Text_Count().text= self.data.count
    ---是否是概率获得
    self.Img_Possible().gameObject:SetActive(self.data.probability)
    self.Img_CountBg().gameObject:SetActive(self.data.count ~= nil and self.data.count ~= 0)

    --概率获取隐藏右上角数字
    self.Img_CountBg().gameObject:SetActive(not self.data.probability)

    UIEvent.LuaClick(self.ObjRoot, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(self.data.config.id,tonumber(self.data.type))
        MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
    end))
end

return M