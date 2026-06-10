-- Code Auto Create Begin
local M = Class('RoleDamageItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleDamageItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Paiming','Paiming',2},{'Shanghaitiaodi','Shanghaitiaodi',2},{'Shanghaitiao','Shanghaitiaodi/Shanghaitiao',2},{'Panel','BattleRoleItem/Panel',2},{'Img_Lihuidi','BattleRoleItem/Panel/Img_Lihuidi',2},{'Icon_Head','BattleRoleItem/Panel/Icon_Head',2},{'Icon_Frame','BattleRoleItem/Panel/Icon_Frame',2},{'Icon_Career','BattleRoleItem/Panel/Icon_Career',2},{'Normal_Star','BattleRoleItem/Panel/StarContent/Normal_Star',2},{'Star','BattleRoleItem/Panel/StarContent/Normal_Star/Star',2},{'Star_1','BattleRoleItem/Panel/StarContent/Normal_Star/Star_1',2},{'Star_2','BattleRoleItem/Panel/StarContent/Normal_Star/Star_2',2},{'Star_3','BattleRoleItem/Panel/StarContent/Normal_Star/Star_3',2},{'Star_4','BattleRoleItem/Panel/StarContent/Normal_Star/Star_4',2},{'Star_5','BattleRoleItem/Panel/StarContent/Normal_Star/Star_5',2},{'Awaken_Star','BattleRoleItem/Panel/StarContent/Awaken_Star',2},{'Super','BattleRoleItem/Panel/StarContent/Awaken_Star/Super',2},{'Super1','BattleRoleItem/Panel/StarContent/Awaken_Star/Super1',2},{'Super2','BattleRoleItem/Panel/StarContent/Awaken_Star/Super2',2},{'Super3','BattleRoleItem/Panel/StarContent/Awaken_Star/Super3',2},{'Super4','BattleRoleItem/Panel/StarContent/Awaken_Star/Super4',2},{'Super5','BattleRoleItem/Panel/StarContent/Awaken_Star/Super5',2},{'Icon_Rankdi','BattleRoleItem/Panel/Icon_Rankdi',2},
        -- UITemplate 列表
        {'RoleDamageItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Paiming','Paiming/Text_Paiming',20},{'Text_Shanghai','Shanghaitiaodi/Text_Shanghai',20},{'Text_Baifenbi','Shanghaitiaodi/Text_Baifenbi',20},{'Text_Level','BattleRoleItem/Panel/Text_Level',20},{'Text_Lv','BattleRoleItem/Panel/Text_Lv',20},{'Text_Rank','BattleRoleItem/Panel/Icon_Rankdi/Text_Rank',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.NormalStar = {
        self.Star().gameObject,
        self.Star_1().gameObject,
        self.Star_2().gameObject,
        self.Star_3().gameObject,
        self.Star_4().gameObject,
        self.Star_5().gameObject
    }
    self.AwakenStar = {
        self.Super().gameObject,
        self.Super1().gameObject,
        self.Super2().gameObject,
        self.Super3().gameObject,
        self.Super4().gameObject,
        self.Super5().gameObject
    }
end

function M:OnUpdateUI(pData)
    ---@type BattleRole
    self.roleData = pData[1]    --角色属性
    self.damage = pData[2] and pData[2] or 0        --伤害总量
    self.percent = pData[3] and pData[3] or 0       --伤害占比
    self.index = pData[4]       --排名
    self.myChara = pData[5]     --是否是自己的角色  用来判断技能等级

    ---排名
    self.Text_Paiming().text = self.index
    ---伤害占比
    self.Shanghaitiao().fillAmount = self.percent / 100
    ---伤害
    self.Text_Shanghai().text = (self.damage == 0 and self.damage or math.abs(self.damage.dmg))
    ---百分比
    self.percent = (self.percent == 0 and 0 or self.percent)
    self.Text_Baifenbi().text = string.format("%.1f",self.percent).."%"
    ---q版头像
    MgrRes.LoadQIcon(self.Icon_Head(),tonumber(self.roleData.SkinID == nil and self.roleData.ID or self.roleData.SkinID))
    ---Icon_Frame
    MgrRes.LoadSprite(self.Icon_Frame(),"Quality/RoleRankN_"..self.roleData.Rank,nil,false)
    ---LV
    self.Text_Level().text = self.roleData.LV
    ---职业图标
    MgrRes.LoadSprite(self.Icon_Career(),"Attribute/ProIcon_"..self.roleData.Occupation,nil,false)
    ---awake
    if self.roleData.IsAwaken then
        self.Normal_Star().gameObject:SetActive(false)
        self.Awaken_Star().gameObject:SetActive(true)
        for i = 1, self.roleData.MaxStart do
            self.AwakenStar[i]:SetActive(i <= self.roleData.StartLV)
        end
    else
        self.Normal_Star().gameObject:SetActive(true)
        self.Awaken_Star().gameObject:SetActive(false)
        for i = 1, self.roleData.MaxStart do
            self.NormalStar[i]:SetActive(i <= self.roleData.StartLV)
        end
    end
    ---技能等级
    --if self.myChara then
    if self.roleData.IsMonster then
        self.Text_Rank().text = self.roleData.ShowSkillLV
        self.Text_Rank().color = Color(1,1,1,1)
    else
        --设置过技能等级且设置的技能等级小于10级
        local role = HeroControl.GetRoleDataByID(tonumber(self.roleData.ID))
        if role ~= nil and role.heroFlag ~= 0 and role.heroCurSkill ~= nil and self.myChara then
            self.Text_Rank().text = role.heroCurSkill
        else
            local t = self:GetSetSkillLv(tonumber(self.roleData.ID))
            if t ~= nil and t.heroFlag ~= nil and t.heroFlag == true then
                self.Text_Rank().text = t.skillLevel
            else
                self.Text_Rank().text = self.roleData.ShowSkillLV
            end
        end

        if self.roleData.ShowSkillLV > self.roleData.SkillLV then
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().color = Color(1,1,1,1)
        end
    end
    --else
    --    self.Text_Rank().text = self.roleData.SkillLV
    --end
end

--获得右侧设置过的技能等级
function M:GetSetSkillLv(_id)
    local list = PVPViewModel.TargetTeam
    for index, value in ipairs(list) do
        if value.id == _id then
            return value
        end
    end
    return nil
end

return M