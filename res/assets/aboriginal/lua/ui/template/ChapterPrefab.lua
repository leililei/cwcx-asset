-- Code Auto Create Begin
local M = Class('ChapterPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/Prefab/Template/ChapterPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ChapterPrefab','/',2},{'gou','back/gou',2},{'BG','back/BG',2},
        -- Text 列表
        {'Chapter02NameTxt','Chapter02NameTxt',3},
        -- UITemplate 列表
        {'ChapterPrefab01','/',10},
        -- Toggle 列表
        {'ChapterPrefab02','/',13},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    local name = pData[1]
    local callBack = pData[2]
    --添加callback
    self.CallBack = callBack
    --设置UI显示名称
    self.Chapter02NameTxt().text = name
    --添加点击事件
    Tools.ToggleValueChange(self.ChapterPrefab02(),Handle(self,self.OnToggleClick),nil)
end

--点击事件
function M:OnToggleClick(isOn)
    self.CallBack(isOn)
end

return M