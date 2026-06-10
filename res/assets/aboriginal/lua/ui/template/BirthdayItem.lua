-- Code Auto Create Begin
local M = Class('BirthdayItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BirthdayItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BirthdayItem','/',2},
        -- Text 列表
        {'Text_Yue','Text_Yue',3},
        -- UITemplate 列表
        {'BirthdayItem01','/',10},
    }
end
-- Code Auto Create End

---排名更新
function M:OnUpdateUI(pData)
    self.pInfo = pData[1]
    self.Text_Yue().text = pData[1]
end
return M