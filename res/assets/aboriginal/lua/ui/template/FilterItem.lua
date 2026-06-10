-- Code Auto Create Begin
local M = Class('FilterItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/FilterItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Nomal','Nomal',2},{'Selected','Selected',2},
        -- Text 列表
        {'Text_NomalName','Nomal/Text_NomalName',3},{'Text_SelectedName','Selected/Text_SelectedName',3},
        -- UITemplate 列表
        {'FilterItem','/',10},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    local strFilter = JNStrTool.strSplit("_",pData[1])
    self.parent = pData[2]
    self.filter = strFilter[1]
    self.Text_NomalName().text = strFilter[2]
    self.Text_SelectedName().text = strFilter[2]
    if self.parent.CurSelectFilter == tonumber(self.filter) then
        self.Nomal().gameObject:SetActive(false)
        self.Selected().gameObject:SetActive(true)
    else
        self.Nomal().gameObject:SetActive(true)
        self.Selected().gameObject:SetActive(false)
    end
    UIEvent.LuaClick(self.Nomal().gameObject, Handle(self, function ()
        self.parent.CurSelectFilter = tonumber(self.filter)
        self.parent:ResetFilterView()
    end))
end

return M