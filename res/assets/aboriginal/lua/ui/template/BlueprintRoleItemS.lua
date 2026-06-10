-- Code Auto Create Begin
local M = Class('BlueprintRoleItemS', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BlueprintRoleItemS.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgActiveBg','Inner/ImgActiveBg',2},{'Role','Inner/Role',2},{'Img_Touxiangdi','Inner/Role/Img_Touxiangdi',2},{'RoleIcon','Inner/Role/RoleIcon',2},{'Img_Kuang','Inner/Role/Img_Kuang',2},{'Text_Lv','Inner/Role/Text_Lv',2},{'zhiyeicon','Inner/Role/zhiyeicon',2},{'Img_Rankdi','Inner/Role/Img_Rankdi',2},{'EmptyStar','Inner/Role/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','Inner/Role/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','Inner/Role/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','Inner/Role/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','Inner/Role/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','Inner/Role/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','Inner/Role/JxStarPanel',2},{'StarPanel','Inner/Role/StarPanel',2},{'StaPrefab','Inner/Role/StaPrefab',2},{'JxStarPrefab','Inner/Role/JxStarPrefab',2},{'BtnRole','Inner/BtnRole',2},
        -- UITemplate 列表
        {'BlueprintRoleItemS','/',10},
        -- TextMeshProUGUI 列表
        {'TextActive','Inner/ImgActiveBg/TextActive',20},{'Text_Grade','Inner/Role/Text_Grade',20},{'Text_Rank','Inner/Role/Img_Rankdi/Text_Rank',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.BtnRole().gameObject, function()
        BlueprintViewModel.SetCurType(2);
        BlueprintViewModel.SetCurRoleId(self.m_heroData.id);
        Event.Go("BlueprintRefresh");
    end);
end
function M:OnUpdateUI(pData)
    self.m_heroData = pData[1];
    self:Refresh(self.m_heroData);
end
function M:Refresh(heroData)
    MgrRes.LoadQIcon(self.RoleIcon(),heroData.skin)
    MgrRes.LoadSprite(self.Img_Kuang(),heroData.iconBattleFrame)
    MgrRes.LoadSprite(self.zhiyeicon(),heroData.iconCareer)
    self.Text_Grade().text = heroData.level

    --修改技能等级设置
    if heroData.heroFlag ~= nil and heroData.heroFlag ~= 0 and heroData.heroCurSkill < heroData:GetHeroShowSkillLv() then
        self.Text_Rank().text =heroData.heroCurSkill
    else
        self.Text_Rank().text =heroData:GetHeroSkillLevel() --删除加号
    end

    if heroData:CheckHeroEquipIsMax() then
        self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
    else
        self.Text_Rank().color = Color(1,1,1,1)
    end
    Tools.ClearAllChild(self.StarPanel().gameObject);
    for k = 1, heroData.star do
        local star = nil
        if heroData.awaken then
            star  = GameObject.Instantiate(self.JxStarPrefab(),self.StarPanel().transform,false)
        else
            star  = GameObject.Instantiate(self.StaPrefab(),self.StarPanel().transform,false)
        end
        star.gameObject:SetActive(true)
    end
    self.StaPrefab().gameObject:SetActive(false)
    self.JxStarPrefab().gameObject:SetActive(false)
    self.TextActive().text = BlueprintViewModel.GetRolePoint(heroData.id) .. "/" .. BlueprintViewModel.GetRoleTotalPoint(heroData.id);
end
return M