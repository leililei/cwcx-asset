-- Code Auto Create Begin
local M = Class('ViewRecordRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ViewRecordRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Star_1','Panel/StarContent/Star_1',2},{'Normal','Panel/StarContent/Star_1/Normal',2},{'HighLight','Panel/StarContent/Star_1/HighLight',2},{'Star_2','Panel/StarContent/Star_2',2},{'Normal01','Panel/StarContent/Star_2/Normal',2},{'HighLight01','Panel/StarContent/Star_2/HighLight',2},{'Star_3','Panel/StarContent/Star_3',2},{'Normal02','Panel/StarContent/Star_3/Normal',2},{'HighLight02','Panel/StarContent/Star_3/HighLight',2},{'Star_4','Panel/StarContent/Star_4',2},{'Normal03','Panel/StarContent/Star_4/Normal',2},{'HighLight03','Panel/StarContent/Star_4/HighLight',2},{'Star_5','Panel/StarContent/Star_5',2},{'Normal04','Panel/StarContent/Star_5/Normal',2},{'HighLight04','Panel/StarContent/Star_5/HighLight',2},{'Star_6','Panel/StarContent/Star_6',2},{'Normal05','Panel/StarContent/Star_6/Normal',2},{'HighLight05','Panel/StarContent/Star_6/HighLight',2},{'Awaken','Panel/StarContent/Awaken',2},{'Super','Panel/StarContent/Awaken/Super',2},{'Super01','Panel/StarContent/Awaken/Super',2},{'Super02','Panel/StarContent/Awaken/Super',2},{'Super03','Panel/StarContent/Awaken/Super',2},{'Super04','Panel/StarContent/Awaken/Super',2},{'Super05','Panel/StarContent/Awaken/Super',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},{'Img_Shunxuzhezhao','Order/Img_Shunxuzhezhao',2},{'Img_Last','Order/Img_Last',2},{'Img_Fast','Order/Img_Fast',2},
        -- UITemplate 列表
        {'ViewRecordRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Panel/Text_Level',20},{'Text_Lv','Panel/Text_Lv',20},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',20},{'Text_Order','Order/Text_Order',20},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()
    self.starNor = {
        [1] = self.Star_1().transform:Find("HighLight").gameObject,
        [2] = self.Star_2().transform:Find("HighLight").gameObject,
        [3] = self.Star_3().transform:Find("HighLight").gameObject,
        [4] = self.Star_4().transform:Find("HighLight").gameObject,
        [5] = self.Star_5().transform:Find("HighLight").gameObject,
        [6] = self.Star_6().transform:Find("HighLight").gameObject,
    }
    self.starHl = {
        [1] = self.Awaken().transform:GetChild(0).gameObject,
        [2] = self.Awaken().transform:GetChild(1).gameObject,
        [3] = self.Awaken().transform:GetChild(2).gameObject,
        [4] = self.Awaken().transform:GetChild(3).gameObject,
        [5] = self.Awaken().transform:GetChild(4).gameObject,
        [6] = self.Awaken().transform:GetChild(5).gameObject,
    }
    self.awaken = self.Awaken().gameObject
end
---角色头像更新
function M:OnUpdateUI(pData)
    ---@type RoleData 角色刷新
    self.pData = pData[1]
    self.order = pData[2]
    self.myChara = pData[3]
    self.Panel = self.Panel()
    if self.pData == nil then
        return
    end
    ---获取头像
    MgrRes.LoadQIcon(self.Icon_Head(),(self.pData.skin == nil and self.pData.id or self.pData.skin))
    ---获取边框
    MgrRes.LoadSprite(self.Icon_Frame(),self.pData.iconBattleFrame)
    ---获取等级
    self.Text_Level().text = self.pData.level
    ---获取职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.pData.iconCareer)
    ---更新星级
    for starLv = 1, #self.starHl do
        local isStar = self.pData.star < starLv
        self.starNor[starLv]:SetActive(not isStar)
        self.starHl[starLv]:SetActive(not isStar)
    end
    ---更新觉醒
    local isAwaken = false
    if type(self.pData.awaken) == "number" then
        isAwaken = self.pData.awaken > 0
    else
        isAwaken = self.pData.awaken
    end
    self.awaken:SetActive(isAwaken)
    ---获取技能等级
    if self.myChara then
        --设置过技能等级且设置的技能等级小于10级
        -- local role = HeroControl.GetRoleDataByID(tonumber(self.pData.id))
        -- if role.heroFlag ~= 0 and role.heroCurSkill < role:GetHeroShowSkillLv() then
        --     self.Text_Rank().text = role.heroCurSkill
        --     if self.pData:CheckHeroEquipIsMax() then
        --         self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        --     else
        --         self.Text_Rank().color = Color(1,1,1,1)
        --     end
        -- else
        --     if self.pData:CheckHeroEquipIsMax() then
        --         self.Text_Rank().text = self.pData:GetHeroSkillLevel()
        --         self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        --     else
        --         self.Text_Rank().text = self.pData.skillLevel
        --         self.Text_Rank().color = Color(1,1,1,1)
        --     end
        -- end
        if self.pData:CheckHeroEquipIsMax() then
            --self.Text_Rank().text = self.pData:GetHeroSkillLevel()
            if self.pData.heroFlag  == false then
                self.Text_Rank().text = self.pData.skillLevel + 1
            else
                self.Text_Rank().text = self.pData.skillLevel
            end
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().text = self.pData.skillLevel
            self.Text_Rank().color = Color(1,1,1,1)
        end
    else
        local roleData = self.pData:GetFriendHeroAttr()
        local AbtArr1 =  ReadData.GetGearAttr(self.pData.armor1 , self.pData.armor1Pro)
        local AbtArr2 =  ReadData.GetGearAttr(self.pData.armor2 , self.pData.armor2Pro)
        if AbtArr1 then
            ReadData.InitRoleGear(roleData, AbtArr1 ,true)
        end
        if AbtArr2 then
            ReadData.InitRoleGear(roleData, AbtArr2 ,true)
        end
        local lvUp = true
        for i,v in ipairs(self.pData.equipLvArr) do
            if v < tonumber(SteamLocalData.tab[105009][2]) then
                lvUp = false
            end
        end

        --设置过技能等级且设置的技能等级小于10级
        if self.pData.heroFlag ~= nil and self.pData.heroFlag ~= 0 and self.pData.heroFlag ~= false then
            self.Text_Rank().text = self.pData.skillLevel
            if lvUp then
                self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
            else
                self.Text_Rank().color = Color(1,1,1,1)
            end
        else
            if lvUp then
                self.Text_Rank().text = self.pData.skillLevel + 1
                self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
            else
                self.Text_Rank().text = self.pData.skillLevel
                self.Text_Rank().color = Color(1,1,1,1)
            end
        end
    end
    ---设置顺序
    self.Text_Order().text = self.order
    self.Img_Fast().gameObject:SetActive(self.order == 1)
end

return M