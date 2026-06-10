-- Code Auto Create Begin
local M = Class('PauseRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PauseRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Star_1','Panel/StarContent/Star_1',2},{'Normal','Panel/StarContent/Star_1/Normal',2},{'HighLight','Panel/StarContent/Star_1/HighLight',2},{'Star_2','Panel/StarContent/Star_2',2},{'Normal01','Panel/StarContent/Star_2/Normal',2},{'HighLight01','Panel/StarContent/Star_2/HighLight',2},{'Star_3','Panel/StarContent/Star_3',2},{'Normal02','Panel/StarContent/Star_3/Normal',2},{'HighLight02','Panel/StarContent/Star_3/HighLight',2},{'Star_4','Panel/StarContent/Star_4',2},{'Normal03','Panel/StarContent/Star_4/Normal',2},{'HighLight03','Panel/StarContent/Star_4/HighLight',2},{'Star_5','Panel/StarContent/Star_5',2},{'Normal04','Panel/StarContent/Star_5/Normal',2},{'HighLight04','Panel/StarContent/Star_5/HighLight',2},{'Star_6','Panel/StarContent/Star_6',2},{'Normal05','Panel/StarContent/Star_6/Normal',2},{'HighLight05','Panel/StarContent/Star_6/HighLight',2},{'Awaken','Panel/StarContent/Awaken',2},{'Super1','Panel/StarContent/Awaken/Super1',2},{'Super2','Panel/StarContent/Awaken/Super2',2},{'Super3','Panel/StarContent/Awaken/Super3',2},{'Super4','Panel/StarContent/Awaken/Super4',2},{'Super5','Panel/StarContent/Awaken/Super5',2},{'Super6','Panel/StarContent/Awaken/Super6',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},{'Img_Shunxuzhezhao','Order/Img_Shunxuzhezhao',2},{'Img_Last','Order/Img_Last',2},{'Img_Fast','Order/Img_Fast',2},
        -- UITemplate 列表
        {'PauseRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Panel/Text_Level',20},{'Text_Lv','Panel/Text_Lv',20},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',20},{'Text_Order','Order/Text_Order',20},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()
    self.starNor = {
        [1] = self.Star_1().transform:Find("Normal").gameObject,
        [2] = self.Star_2().transform:Find("Normal").gameObject,
        [3] = self.Star_3().transform:Find("Normal").gameObject,
        [4] = self.Star_4().transform:Find("Normal").gameObject,
        [5] = self.Star_5().transform:Find("Normal").gameObject,
        [6] = self.Star_6().transform:Find("Normal").gameObject,
    }
    self.starHl = {
        [1] = self.Star_1().transform:Find("HighLight").gameObject,
        [2] = self.Star_2().transform:Find("HighLight").gameObject,
        [3] = self.Star_3().transform:Find("HighLight").gameObject,
        [4] = self.Star_4().transform:Find("HighLight").gameObject,
        [5] = self.Star_5().transform:Find("HighLight").gameObject,
        [6] = self.Star_6().transform:Find("HighLight").gameObject,
    }
    self.SuperStar = {
        [1] = self.Super1().gameObject,
        [2] = self.Super2().gameObject,
        [3] = self.Super3().gameObject,
        [4] = self.Super4().gameObject,
        [5] = self.Super5().gameObject,
        [6] = self.Super6().gameObject,
    }
    self.awaken = self.Awaken().gameObject
    UIEvent.LuaClick(self.Panel().gameObject,function()
        local uiFrom = MgrUI.GetCurUI()
        --if uiFrom.Uid == UID.Battle02_UI and self.parent ~= nil then
        --    ---BattlePause_UI
        --    self.parent:ShowRoleInfo(self.pData,self.role,self.teamDead)
        --end

        MgrUI.Pop(UID.RoleInfoPausePop_UI,{true,self.pData,self.role,self.teamDead,self.roleInfo})
    end)
end
---角色头像更新
function M:OnUpdateUI(pData)
    ---@type RoleData 角色刷新
    self.pData = pData[1]
    ---@type BattleRole
    self.role = pData[2]
    if self.role.Remove then
        self.ObjRoot:SetActive(false)
        return
    end
    self.teamDead = pData[3]
    self.parent = pData[4]
    if self.pData == nil then
        return
    end
    self.roleInfo = BattleViewModel.Fighters[self.role.GameID]
    print("PauseRoleItem roleInfo:"..serpent.block(self.roleInfo))
    self.skin = self.pData.id
    if pData[5] ~= nil then
        self.skin = pData[5]
    end
    self.Panel = self.Panel()
    ---获取头像
    MgrRes.LoadQIcon(self.Icon_Head(),self.skin)
    ---获取边框
    MgrRes.LoadSprite(self.Icon_Frame(),self.pData.iconBattleFrame)
    ---获取等级
    self.Text_Level().text = self.role.LV
    ---获取职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.pData.iconCareer)
    ---更新星级
    for starLv = 1, #self.starHl do
        local isStar = self.role.StartLV < starLv
        --self.starNor[starLv]:SetActive(isStar)
        self.SuperStar[starLv]:SetActive(not isStar)
        self.starHl[starLv]:SetActive(not isStar)
    end
    ---更新觉醒
    self.awaken:SetActive(self.role.IsAwaken)
    ---获取技能等级
    --self.Text_Rank().text = "+"..self.pData:GetHeroSkillLevel()

    if self.role.IsLeft  then
        --local role = HeroControl.GetRoleDataByID(tonumber(self.role.ID))


        -- if self.role.heroFlag ~= nil and self.role.heroFlag ~= 0 and self.role.heroFlag ~= false then
        --     self.role.ShowSkillLV = self.role.heroCurSkill
        --     self.Text_Rank().text = self.role.heroCurSkill
        -- else
        --     if self.pData.heroFlag ~= nil and self.pData.heroFlag ~= 0 and self.pData.heroFlag ~= false then
        --         self.role.ShowSkillLV = self.pData.heroCurSkill
        --         self.Text_Rank().text = self.pData.heroCurSkill
        --     else
        --         if PVPViewModel.PlayerIsAtk == false then --防守回放
        --             if self.pData.heroFlag == 0 then
        --                 self.Text_Rank().text = self.role.ShowSkillLV
        --             else
        --                 self.Text_Rank().text = self.role.SkillLV
        --             end
        --         else
        --             self.Text_Rank().text = self.role.ShowSkillLV
        --         end
        --     end
        -- end
        local mRole =  self:GetLeftData(tonumber(self.role.ID))
        if mRole and mRole.heroFlag == true then
            self.Text_Rank().text = mRole.skillLevel
            self.role.ShowSkillLV = mRole.skillLevel
        else
            self.Text_Rank().text = self.role.ShowSkillLV
        end
    else
        --if self.pData.heroFlag ~= nil and self.pData.heroFlag ~= 0 and self.pData.heroFlag ~= false then
        --    self.Text_Rank().text = self.pData.heroCurSkill
        --else
        --end
        if self:CheckRoleIs(tonumber(self.role.ID)) ~= nil then
            self.Text_Rank().text = self:CheckRoleIs(tonumber(self.role.ID)).skill
        else
            if PVPViewModel.PlayerIsAtk == false then
                self.Text_Rank().text = self.role.SkillLV
            else
                self.Text_Rank().text = self.role.ShowSkillLV
            end
        end
    end
    ---设置顺序
    self.Text_Order().text = self.role.AtkOrder - self.teamDead
    self.Img_Fast().gameObject:SetActive(self.role.AtkOrder == 1)
end

--判断右侧角色是否设置过技能等级
function M:CheckRoleIs(id)
    for index, value in ipairs(PVPViewModel.PVPRightRoleData) do
        if value.base.roleID == id and value.heroFlag ~= nil and value.heroFlag == true then
            return value
        end
    end
    return nil
end

function M:GetLeftData(id)
    local t = {}
    for index, value in ipairs(PVPViewModel.TargetTeam) do
        if value.id == id then
            t = value
        end
    end
    return t
end

return M