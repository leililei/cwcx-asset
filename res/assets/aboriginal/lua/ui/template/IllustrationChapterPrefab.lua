-- Code Auto Create Begin
local M = Class('IllustrationChapterPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/Prefab/Template/IllustrationChapterPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'IllustrationChapterPrefab','/',2},{'gou','back/gou',2},{'BG','back/BG',2},
        -- Text 列表
        {'Chapter02NameTxt','Chapter02NameTxt',3},
        -- UITemplate 列表
        {'IllustrationChapterPrefab01','/',10},
        -- Toggle 列表
        {'IllustrationChapterPrefab02','/',13},
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
    Tools.ToggleValueChange(self.IllustrationChapterPrefab02(),Handle(self,self.OnToggleClick),nil)
end

--点击事件
function M:OnToggleClick(isOn)
    self.CallBack(isOn)
end

return M