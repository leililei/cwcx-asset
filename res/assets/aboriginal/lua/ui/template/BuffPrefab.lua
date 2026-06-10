-- Code Auto Create Begin
local M = Class('BuffPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BuffPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'bg','bg',2},{'Img_IDtiao','Text_SkillName/Img_IDtiao',2},{'SkillIcon','SkillIcon',2},
        -- UITemplate 列表
        {'BuffPrefab','/',10},
        -- TextMeshProUGUI 列表
        {'Text_SkillName','Text_SkillName',20},{'Text_SkillDes','Text_SkillDes',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    self.id = pData["id"]
    self.buff = pData["skill"]
    if self.buff == nil then
        self.ObjRoot:SetActive(false)
        return
    else
        self.ObjRoot:SetActive(true)
    end
    ---buff名字
    self.Text_SkillName().text = self.buff.Name
    ---图片
    MgrRes.LoadSprite(self.SkillIcon(),"Skill/"..self.buff.Icon)
    ---描述
    self.Text_SkillDes().text = self.buff.Explain
end

return M