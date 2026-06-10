-- Code Auto Create Begin
local M = Class('ScienceItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ScienceItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ScienceItem','/',2},{'Icon','Icon',2},
        -- UITemplate 列表
        {'ScienceItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_ScienceName','Text_ScienceName',20},{'Text_ScienceLV','Text_ScienceLV',20},{'Text_ScienceLV1','Text_ScienceLV1',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot,function()
        self.parent.CurScience = self.pData
        self.parent:RefreshScienceDetail(self.pData.id)
    end)
end

---@param pData GuildSkillData
function M:OnUpdateUI(Args)
    self.pData = Args[1]
    self.parent = Args[2]
    self.Text_ScienceName().text = self.pData.name      --标题文本
    self.Text_ScienceLV1().text = self.pData.level      --等级文本
    MgrRes.LoadSprite(self.ScienceItem(),self.pData.icon)     --底图
    MgrRes.LoadSprite(self.Icon(),self.pData.icon)      --科技图
end

return M