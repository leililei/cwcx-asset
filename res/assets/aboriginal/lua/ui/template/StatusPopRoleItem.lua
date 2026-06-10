-- Code Auto Create Begin
local M = Class('StatusPopRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/StatusPopRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Star_1','Panel/StarContent/Star_1',2},{'Normal','Panel/StarContent/Star_1/Normal',2},{'HighLight','Panel/StarContent/Star_1/HighLight',2},{'Star_2','Panel/StarContent/Star_2',2},{'Normal01','Panel/StarContent/Star_2/Normal',2},{'HighLight01','Panel/StarContent/Star_2/HighLight',2},{'Star_3','Panel/StarContent/Star_3',2},{'Normal02','Panel/StarContent/Star_3/Normal',2},{'HighLight02','Panel/StarContent/Star_3/HighLight',2},{'Star_4','Panel/StarContent/Star_4',2},{'Normal03','Panel/StarContent/Star_4/Normal',2},{'HighLight03','Panel/StarContent/Star_4/HighLight',2},{'Star_5','Panel/StarContent/Star_5',2},{'Normal04','Panel/StarContent/Star_5/Normal',2},{'HighLight04','Panel/StarContent/Star_5/HighLight',2},{'Star_6','Panel/StarContent/Star_6',2},{'Normal05','Panel/StarContent/Star_6/Normal',2},{'HighLight05','Panel/StarContent/Star_6/HighLight',2},{'Awaken','Panel/StarContent/Awaken',2},{'Super','Panel/StarContent/Awaken/Super',2},{'Super1','Panel/StarContent/Awaken/Super1',2},{'Super2','Panel/StarContent/Awaken/Super2',2},{'Super3','Panel/StarContent/Awaken/Super3',2},{'Super4','Panel/StarContent/Awaken/Super4',2},{'Super5','Panel/StarContent/Awaken/Super5',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},{'Mask','Mask',2},{'Img_Mask','Mask/Img_Mask',2},{'Img_Unfight','Mask/Img_Unfight',2},{'ItemMask','ItemMask',2},
        -- UITemplate 列表
        {'StatusPopRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Panel/Text_Level',20},{'Text_Lv','Panel/Text_Lv',20},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',20},{'Text_SameRoleTips','Mask/Img_Mask/Text_SameRoleTips',20},{'Text_UnfightTips','Mask/Img_Unfight/Text_UnfightTips',20},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()
    self.Img_Unfight().gameObject:SetActive(false)
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
    self.SuperStars = {
        [1] = self.Super().gameObject,
        [2] = self.Super1().gameObject,
        [3] = self.Super2().gameObject,
        [4] = self.Super3().gameObject,
        [5] = self.Super4().gameObject,
        [6] = self.Super5().gameObject,
    }
    self.awaken = self.Awaken().gameObject
    self.canvasGroup = self.ObjRoot:GetComponent("CanvasGroup")
end
---角色头像更新
function M:OnUpdateUI(pData)
    ---@type RoleData 角色刷新
    self.pData = pData[1]
    if self.pData == nil then
        return
    end
    self.parent = pData[2]
    if pData[3] ~= nil then
        self.role = pData[3]
    end
    ---在切换到调整顺序时,添加滑条遮罩
    if self.parent ~= nil and self.parent.SelectRoleStop then
        self.ItemMask().gameObject:SetActive(true)
        return
    else
        self.ItemMask().gameObject:SetActive(false)
    end
    self.Panel = self.Panel()
    self.dragEvent = self.Panel:GetComponent("LoopDragItem")
    ---是否有重复角色
    self.isRepeat = false
    for k,v in pairs(BattleManager.LeftTeam) do
        if self.pData.id == tonumber(v.ID) then
            self.isRepeat = true
            break
        else
            self.isRepeat = false
        end
    end
    if self.parent ~= nil and self.parent.class.__cname == "RoleStatusPrefab" or (self.parent.Uid.Name == "BattlePause_UI" or self.parent.Uid.Name == "PVPPause_UI" ) then    ---暂停界面详情不判断重复
        self.isRepeat = false
    end
    ---当场上已有此角色并且此角色未被拖拽时显示mask
    self.Mask().gameObject:SetActive(false)
    self.Img_Mask().gameObject:SetActive(false)
    self.Img_Unfight().gameObject:SetActive(false)
    if self.isRepeat then
        self.Mask().gameObject:SetActive(true)
        self.Img_Mask().gameObject:SetActive(true)
        self.Img_Unfight().gameObject:SetActive(false)
    end
    ---月塔战斗界面下方滑块(无法战斗显示)
    if StormViewModel.CurPointType == StormViewModel.PointType.monthTower or MgrUI.GetCurUI().Uid == UID.Yueta_UI then
        local heroHP = YueTaControl.GetMode() == YueTaControl.ModeType.EASY and YueTaViewModel.GetServerData().towerHero or YueTaViewModel.GetServerData().innerTowerHero
        if heroHP ~= nil then
            for i,v in pairs(heroHP) do
                if v.heroID == self.pData.id and v.hP == 0 then
                    self.Mask().gameObject:SetActive(true)
                    self.Img_Mask().gameObject:SetActive(false)
                    self.Img_Unfight().gameObject:SetActive(true)
                end
            end
        else
            self.Mask().gameObject:SetActive(false)
            self.Img_Mask().gameObject:SetActive(false)
            self.Img_Unfight().gameObject:SetActive(false)
        end
    end
    ---获取头像
    if self.role ~= nil then
        MgrRes.LoadQIcon(self.Icon_Head(),(self.role.SkinID == self.pData.id or self.role.SkinID == nil) and self.pData.id or self.role.SkinID)
    else
        MgrRes.LoadQIcon(self.Icon_Head(),(self.pData.skin == self.pData.id or self.pData.skin == nil) and self.pData.id or self.pData.skin)
    end
    ---获取边框
    MgrRes.LoadSprite(self.Icon_Frame(),self.pData.iconBattleFrame)
    ---获取等级
    if self.role ~= nil then
        self.Text_Level().text = self.role.LV
    else
        self.Text_Level().text = self.pData.level
    end
    ---获取职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.pData.iconCareer)
    ---更新星级
    if self.role ~= nil then
        for starLv = 1, #self.starHl do
            local isStar = self.role.StartLV < starLv
            self.starHl[starLv]:SetActive(not isStar)
            self.SuperStars[starLv]:SetActive(not isStar)
        end
    else
        for starLv = 1, #self.starHl do
            local isStar = self.pData.star < starLv
            self.starHl[starLv]:SetActive(not isStar)
            self.SuperStars[starLv]:SetActive(not isStar)
        end
    end
    ---更新觉醒
    if self.role ~= nil then
        self.awaken:SetActive(self.role.IsAwaken)
    else
        self.awaken:SetActive(self.pData.awaken)
    end

    if self.role ~= nil then
        self.Text_Rank().text =  self.role.ShowSkillLV
    else
        self.Text_Rank().text = self.pData:GetHeroShowSkillLv()
    end
    if self.role ~= nil then
        if self.role.ShowSkillLV > self.role.SkillLV then
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().color = Color(1,1,1,1)
        end
    else
        if self.pData:CheckHeroEquipIsMax() then
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().color = Color(1,1,1,1)
        end
    end
end

return M