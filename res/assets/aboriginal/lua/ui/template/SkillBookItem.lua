-- Code Auto Create Begin
local M = Class('SkillBookItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SkillBookItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'bg','bg',2},{'Img_IDtiao','Text_SkillName/Img_IDtiao',2},{'SkillIcon','SkillIcon',2},{'Btn_Youyoujuese','Btn_Youyoujuese',2},{'Img_Chakan','Btn_Youyoujuese/Img_Chakan',2},
        -- UITemplate 列表
        {'SkillBookItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Number','Text_Number',20},{'Text_SkillName','Text_SkillName',20},{'Text_SkillDes','Text_SkillDes',20},{'Text_Yongyoujuese','Btn_Youyoujuese/Text_Yongyoujuese',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type SkillAtlasData
    self.data = pData[1]
    self.parent = pData[2]
    self.skillData = SkillLocalData.tab[self.data.skillId]
    ---加载图片
    MgrRes.LoadSprite(self.SkillIcon(),"Skill/"..self.skillData[13])
    ---技能名
    self.Text_SkillName().text = self.skillData[12]
    ---技能简介
    self.Text_SkillDes().text = self.data.skillText
    ---点击查看技能拥有者
    UIEvent.LuaClick(self.Btn_Youyoujuese().gameObject,function()
        local str = string.split(self.data.Owner,";")
        self.parent:RefreshRole(str,0)
    end)
end

return M