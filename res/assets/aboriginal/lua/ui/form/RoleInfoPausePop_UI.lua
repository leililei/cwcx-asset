-- Code Auto Create Begin
local M = Class('RoleInfoPausePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleInfoPausePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleInfoPausePop_UI].prefab'
    self.Name = 'Form[RoleInfoPausePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'background','background',2},{'Haoyoumingpiandi','Haoyoumingpiandi',2},{'LihuiPanel','Haoyoumingpiandi/LihuiPanel',2},{'LihuiSpinePanel','Haoyoumingpiandi/LihuiPanel/LihuiSpinePanel',2},{'hd','Haoyoumingpiandi/LihuiPanel/LihuiSpinePanel/hd',2},{'Img_Orderdi','Haoyoumingpiandi/UIPanel/RoleInfoPanel/RoleOrder/Img_Orderdi',2},{'Img_Last','Haoyoumingpiandi/UIPanel/RoleInfoPanel/RoleOrder/Img_Last',2},{'Img_Fast','Haoyoumingpiandi/UIPanel/RoleInfoPanel/RoleOrder/Img_Fast',2},{'BtnPreview','Haoyoumingpiandi/UIPanel/RoleInfoPanel/BtnPreview',2},{'Img_di','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Img_di',2},{'Img_xian','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Img_di/Img_xian',2},{'ProTypeImg','Haoyoumingpiandi/UIPanel/RoleInfoPanel/ProTypeImg',2},{'RoleNameBG','Haoyoumingpiandi/UIPanel/RoleInfoPanel/RoleNameBG',2},{'StarPrefab','Haoyoumingpiandi/UIPanel/RoleInfoPanel/StarPrefab',2},{'StarPrefabJueXing','Haoyoumingpiandi/UIPanel/RoleInfoPanel/StarPrefabJueXing',2},{'StarPanel','Haoyoumingpiandi/UIPanel/RoleInfoPanel/StarPanel',2},{'Hp','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Hp',2},{'HPtiaodi','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Hp/HPtiaodi',2},{'HPtiao','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Hp/HPtiao',2},{'Shield','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Shield',2},{'Shieldtiaodi','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Shield/Shieldtiaodi',2},{'Shieldtiao','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Shield/Shieldtiao',2},{'Atk','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Atk',2},{'AtkIcon','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Atk/AtkIcon',2},{'Def','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Def',2},{'DefIcon','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Def/DefIcon',2},{'Baoji','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoji',2},{'BaojiIcon','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoji/BaojiIcon',2},{'Baoshang','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoshang',2},{'BaoshangIcon','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoshang/BaoshangIcon',2},{'Mingjie','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Mingjie',2},{'MingjieIcon','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Mingjie/MingjieIcon',2},{'Damage','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Damage',2},{'DamageIcon','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Damage/DamageIcon',2},{'Img_di01','Haoyoumingpiandi/UIPanel/RightPanel/Img_di',2},{'Skill_Panel','Haoyoumingpiandi/UIPanel/RightPanel/Skill_Panel',2},{'Content_skill','Haoyoumingpiandi/UIPanel/RightPanel/Skill_Panel/SkillScroll/Content_skill',2},{'Content','Haoyoumingpiandi/UIPanel/RightPanel/BuffScroll/Content',2},{'Tog_Buff','Haoyoumingpiandi/UIPanel/Tog_Buff',2},{'Img_hl','Haoyoumingpiandi/UIPanel/Tog_Buff/Img_hl',2},{'Tog_Skill','Haoyoumingpiandi/UIPanel/Tog_Skill',2},{'Img_hl01','Haoyoumingpiandi/UIPanel/Tog_Skill/Img_hl',2},{'Btn_Guanbi','Btn_Guanbi',2},
        -- UITemplate 列表
        {'RoleDetail_SkillItem2','Haoyoumingpiandi/UIPanel/RightPanel/Skill_Panel/SkillScroll/RoleDetail_SkillItem2',10},{'RoleDetail_BuffItem','Haoyoumingpiandi/UIPanel/RightPanel/BuffScroll/RoleDetail_BuffItem',10},
        -- Toggle 列表
        {'Tog_Buff01','Haoyoumingpiandi/UIPanel/Tog_Buff',13},{'Tog_Skill01','Haoyoumingpiandi/UIPanel/Tog_Skill',13},
        -- RawImage 列表
        {'SkillScroll','Haoyoumingpiandi/UIPanel/RightPanel/Skill_Panel/SkillScroll',15},{'BuffScroll','Haoyoumingpiandi/UIPanel/RightPanel/BuffScroll',15},
        -- LoopScrollRect 列表
        {'SkillScroll01','Haoyoumingpiandi/UIPanel/RightPanel/Skill_Panel/SkillScroll',18},{'BuffScroll01','Haoyoumingpiandi/UIPanel/RightPanel/BuffScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Order','Haoyoumingpiandi/UIPanel/RoleInfoPanel/RoleOrder/Text_Order',20},{'TextPreview','Haoyoumingpiandi/UIPanel/RoleInfoPanel/BtnPreview/TextPreview',20},{'RoleNameTxt','Haoyoumingpiandi/UIPanel/RoleInfoPanel/RoleNameBG/RoleNameTxt',20},{'LV','Haoyoumingpiandi/UIPanel/RoleInfoPanel/LV',20},{'Text_LV','Haoyoumingpiandi/UIPanel/RoleInfoPanel/LV/Text_LV',20},{'Rank','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Rank',20},{'Text_Rank','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Rank/Text_Rank',20},{'Text_HP1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Hp/Text_HP1',20},{'Text_HP2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Hp/Text_HP2',20},{'Text_Shield1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Shield/Text_Shield1',20},{'Text_Shield2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Shield/Text_Shield2',20},{'Text_Atk1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Atk/Text_Atk1',20},{'Text_Atk2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Atk/Text_Atk2',20},{'Text_Def1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Def/Text_Def1',20},{'Text_Def2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Def/Text_Def2',20},{'Text_Baoji1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoji/Text_Baoji1',20},{'Text_Baoji2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoji/Text_Baoji2',20},{'Text_Baoshang1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoshang/Text_Baoshang1',20},{'Text_Baoshang2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Baoshang/Text_Baoshang2',20},{'Text_Mingjie1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Mingjie/Text_Mingjie1',20},{'Text_Mingjie2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Mingjie/Text_Mingjie2',20},{'Text_Damage1','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Damage/Text_Damage1',20},{'Text_Damage2','Haoyoumingpiandi/UIPanel/RoleInfoPanel/Info/Damage/Text_Damage2',20},{'Text_Empty','Haoyoumingpiandi/UIPanel/RightPanel/BuffScroll/Text_Empty',20},{'Text_Buff','Haoyoumingpiandi/UIPanel/Tog_Buff/Text_Buff',20},{'Text_Skill','Haoyoumingpiandi/UIPanel/Tog_Skill/Text_Skill',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---关闭
    UIEvent.LuaClick(self.Btn_Guanbi().gameObject,function() MgrUI.ClosePop(self.Uid) end)
    ---toggle注册
    self.toggles = {
        self.Tog_Skill01(),
        self.Tog_Buff01(),
    }
    self.panels = {
        self.SkillScroll01(),
        self.BuffScroll01(),
    }
    for i,toggle in ipairs(self.toggles) do
        Tools.ToggleValueChange(toggle,function(isOn)
            if isOn then
                self.panels[i].gameObject:SetActive(true)
                self.panels[i]:RefreshCells()
            else
                self.panels[i].gameObject:SetActive(false)
            end
        end)
    end
    UIEvent.LuaClick(self.BtnPreview().gameObject, Handle(self, function()
        if self.InBattle then
            local totalProps = BlueprintViewModel.CalcInBattleProps(self.RoleInfo);
            MgrUI.Pop(UID.BlueprintPreviewPop, { totalProps }, true)
        else
            local tCurHeroAttr = self.RoleData:GetHeroAttr()
            local tempRole = ReadData.CreatRole(tCurHeroAttr.ID, tCurHeroAttr.SkinID, tCurHeroAttr.LV, tCurHeroAttr.StartLV, 0, tCurHeroAttr.IsAwaken, self.RoleData.favor);
            local totalProps = BlueprintViewModel.CalcHeroProps(tempRole);
            MgrUI.Pop(UID.BlueprintPreviewPop, { totalProps }, true);
        end
    end))
end

function M:OnShow(pData)
    CJNBattleMgr.SetGameSpeed(1)
    self.InBattle = pData[1]
    self.RoleData = pData[2]
    ---@type BattleRole
    self.BattleRole = pData[3]
    self.TeamDead = pData[4]
    self.RoleInfo = pData[5]

    if PVPViewModel.PlayerIsAtk == false then
        self.BattleRole.ShowSkillLV = self.BattleRole.SkillLV
    end

    ---战斗中数据
    local cProperties = nil
    if self.BattleRole.myAni ~= nil then
        cProperties = self.BattleRole.myAni.roleData
    end
    -- self.InBattle = true
    -- ---未战斗数据
    -- if cProperties == nil then
    --     self.InBattle = false
    -- end
    ---星级
    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)
    if self.InBattle then
        if self.RoleInfo.isAwaken then
            for i = 1, self.RoleInfo.star do
                local go = GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().transform,false)
                go:SetActive(true)
            end
        else
            for i = 1, self.RoleInfo.star do
                local go = GameObject.Instantiate(self.StarPrefab().gameObject,self.StarPanel().transform,false)
                go:SetActive(true)
            end
        end
    else
        if self.BattleRole.IsAwaken then
            for i = 1, self.BattleRole.StartLV do
                local go = GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().transform,false)
                go:SetActive(true)
            end
        else
            for i = 1, self.BattleRole.StartLV do
                local go = GameObject.Instantiate(self.StarPrefab().gameObject,self.StarPanel().transform,false)
                go:SetActive(true)
            end
        end
    end
    ---职业
    MgrRes.LoadSprite(self.ProTypeImg(), self.RoleData.iconCareer)
    ---等级
    if self.InBattle then
        self.Text_LV().text = self.RoleInfo.level
    else
        self.Text_LV().text = self.BattleRole.LV
    end
     --设置过技能等级且设置的技能等级小于10级heroCurSkill
     if self.BattleRole.IsLeft then
        if self.InBattle then
            self.Text_Rank().text = self.RoleInfo.rank
        elseif nil ~= self.BattleRole.tryHeroUID then
            self.Text_Rank().text = self.BattleRole.SkillLV
        else
            self.Text_Rank().text = self.BattleRole.ShowSkillLV
        end
    else
        if self.InBattle then
            self.Text_Rank().text = self.RoleInfo.rank
        elseif nil ~= self.BattleRole.tryHeroUID then
            self.Text_Rank().text = self.BattleRole.SkillLV
        else
            if self:CheckRoleIs(tonumber(self.BattleRole.ID)) ~= nil then
                self.Text_Rank().text = self:CheckRoleIs(tonumber(self.BattleRole.ID)).skill
            else
                self.Text_Rank().text = self.BattleRole.ShowSkillLV
            end
        end
    end

    ---名字
    self.RoleNameTxt().text = self.RoleData.name
    ---顺序
    self.Text_Order().text = self.BattleRole.AtkOrder - self.TeamDead
    if self.InBattle then
        ---生命值
        local h = self.RoleInfo.hp
        if h < 0 then
            h = 0
        end
        self.Text_HP2().text = h .."/".. math.modf(self.RoleInfo.maxHp)
        local ratio = h/self.RoleInfo.maxHp
        if ratio < 0 then
            ratio = 0
        elseif ratio > 1 then
            ratio = 1
        end
        Tools.UIDoLocalScale(self.HPtiao().gameObject,1,ratio,0,0,0,0.5,0)
        ---护盾值
        self.Text_Shield2().text = self.RoleInfo.shield
        ratio = self.RoleInfo.shield/self.RoleInfo.maxHp
        if ratio < 0 then
            ratio = 0
        elseif ratio > 1 then
            ratio = 1
        end
        Tools.UIDoLocalScale(self.Shieldtiao().gameObject,1,ratio,0,0,0,0.5,0)
        ---攻击力
        if self.BattleRole.Occupation == 4 then
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_2")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
            --self.Text_Atk2().text = math.floor(cProperties.RealSuppart * 1000 + 0.5) / 10 .. "%"
            self.Text_Atk2().text = math.floor(self.RoleInfo.support / 10) / 10 .. "%"     --C#赋值问题，应该将辅助值赋给RealSuppart
        else
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_0")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text14")
            self.Text_Atk2().text = self.RoleInfo.atk
        end

        ---装甲值
        self.Text_Def2().text = math.floor(self.RoleInfo.def / 10 + 0.5) / 10 .. "%"
        ---致命率
        self.Text_Baoji2().text = math.floor(self.RoleInfo.crit / 10 + 0.5) / 10 .. "%"
        ---致命伤害
        self.Text_Baoshang2().text = math.floor(self.RoleInfo.cDamage / 10 + 0.5) / 10 .. "%"
        ---机动力
        self.Text_Mingjie2().text = math.floor(self.RoleInfo.agi / 10 + 0.5) / 10 .. "%"
        ---减伤
        self.Text_Damage2().text = math.floor(self.RoleInfo.dReduce / 10 + 0.5) / 10 .. "%"

        ---Buff
        -- local buff = Tool.CSharpListToLuaTable(self.BattleRole.myAni.myHpUi.Bufftexts)
        local buff = self.RoleInfo.buffList
        self.buffs = {}
        if next(buff) ~= nil then
            -- for i,v in ipairs(buff) do
            --     local buffData = SkillLocalData.tab[v.id]
            --     local buffReleaser = nil
            --     for j,value in pairs(BattleManager.AllRole) do
            --         local buffOwner = 0
            --         for idx,buff in pairs(self.BattleRole.TabBuffSkill) do
            --             if buff.skillid == v.id then    --身上Buff中,找到对应Buff,及其施放者
            --                 buffOwner = buff.AtkId
            --             end
            --         end
            --         if tonumber(value.ID) == buffData[40] and buffOwner == value.GameID then      --找到是谁放的Buff，而且要知道是哪一方
            --             buffReleaser = value
            --             local haveBuff = false
            --             for k,skill in pairs(buffReleaser.Skills) do
            --                 if skill.Id == v.id then
            --                     haveBuff = true
            --                     break
            --                 end
            --             end
            --             if haveBuff then
            --                 break
            --             else
            --                 buffReleaser = nil
            --             end
            --         end
            --     end
            --     local skillData = nil
            --     if buffReleaser then
            --         for i,value in pairs(buffReleaser.Skills) do
            --             if value.Id == v.id then
            --                 skillData = value
            --                 break
            --             end
            --         end
            --     else
            --         skillData = BattleRole.CreatSkill(v.id,1,true,true)
            --     end
            --     if skillData == nil then
            --         print(v.id .. "技能为空")
            --     else
            --         self.buffs[i] = {v.BuffTurn, buffData[13], buffData[12], skillData.Explain, skillData.Exception}   --剩余回合, icon, Buff名字, Buff描述, 例外事项
            --     end
            -- end
            for index, value in pairs(buff) do
                local temp = value.skillID
                local sID = math.modf(temp/100)
                local lv = temp%100
                -- local sID = temp
                -- local lv = 1
                local buffData = SkillLocalData.tab[sID]
                local explain = JNSkill.ReadSkillExplain(buffData[6],lv)
                local exception = buffData[17]
                local info = {value.duration, buffData[13], buffData[12], explain, exception}   --剩余回合, icon, Buff名字, Buff描述, 例外事项
                table.insert(self.buffs, info)
            end
            self.Text_Empty().gameObject:SetActive(false)
        else
            self.Text_Empty().gameObject:SetActive(true)
        end
        self.BuffScroll01():SetLuaCellEvent(Handle(self,self.CellBuffPrefab))
        self.BuffScroll01().totalCount = #self.buffs
        self.BuffScroll01():RefillCells()
    else
        ---生命值
        local h = math.floor(self.BattleRole.HP)
        if h < 0 then
            h = 0
        end
        self.Text_HP2().text = h .."/".. math.modf(self.BattleRole.HPmax)
        local ratio = self.BattleRole.HP/self.BattleRole.HPmax
        if ratio < 0 then
            ratio = 0
        elseif ratio > 1 then
            ratio = 1
        end
        Tools.UIDoLocalScale(self.HPtiao().gameObject,1,ratio,0,0,0,0.5,0)
        ---护盾值
        self.Text_Shield2().text = 0
        ratio = 0/self.BattleRole.HPmax
        if ratio < 0 then
            ratio = 0
        elseif ratio > 1 then
            ratio = 1
        end
        Tools.UIDoLocalScale(self.Shieldtiao().gameObject,1,ratio,0,0,0,0.5,0)
        ---攻击力
        if self.BattleRole.Occupation == 4 then
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_2")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
            self.Text_Atk2().text = math.floor(self.BattleRole.RealSuppart * 1000) / 10 .. "%"
        else
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_0")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text14")
            self.Text_Atk2().text = math.floor(self.BattleRole.RealAtk)
        end
        ---装甲值
        self.Text_Def2().text = math.floor(self.BattleRole.RealDef * 1000 + 0.5) / 10 .. "%"
        ---致命率
        self.Text_Baoji2().text = math.floor(self.BattleRole.RealCrit * 1000 + 0.5) / 10 .. "%"
        ---致命伤害
        self.Text_Baoshang2().text = math.floor(self.BattleRole.RealCritDmg * 1000 + 0.5) / 10 .. "%"
        ---机动力
        self.Text_Mingjie2().text = math.floor(self.BattleRole.RealAgile * 1000 + 0.5) / 10 .. "%"
        ---减伤
        self.Text_Damage2().text = math.floor(self.BattleRole.DamageRelief * 1000 + 0.5) / 10 .. "%"

        self.buffs = {}
        self.BuffScroll01().totalCount = 0
        self.BuffScroll01():RefillCells()
        self.Text_Empty().gameObject:SetActive(true)
    end
    ---创建技能
    self.SkillsSample = {}
    if self.BattleRole.Skill_1_example[1] ~= nil then
        table.insert(self.SkillsSample,self.BattleRole.Skill_1_example)
    end
    if self.BattleRole.Skill_2_example[1] ~= nil then
        table.insert(self.SkillsSample,self.BattleRole.Skill_2_example)
    end
    if self.BattleRole.Skill_3_example[1] ~= nil then
        table.insert(self.SkillsSample,self.BattleRole.Skill_3_example)
    end
    if self.BattleRole.Skill_4_example[1] ~= nil then
        table.insert(self.SkillsSample,self.BattleRole.Skill_4_example)
    end
    if self.BattleRole.Skill_5_example[1] ~= nil then
        table.insert(self.SkillsSample,self.BattleRole.Skill_5_example)
    end
    self.ChildSkillList = SkillDetailControl.GetSkillListByID(tonumber(self.BattleRole.ID))
    self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,self.BattleRole.specialEquip)    ---根据角色进阶共鸣装备替换技能简略表
    self.CurRole = self.BattleRole
    self.SkillScroll01():SetLuaCellEvent(Handle(self,self.CellSkillPrefab))
    self.SkillScroll01().totalCount = #self.ChildSkillList
    self.SkillScroll01():RefillCells()

    self.BuffScroll().gameObject:SetActive(false)
    ---未在战斗中隐藏掉状态按钮
    --if self.InBattle then
    --    self.Tog_Buff().gameObject:SetActive(true)
    --else
    --    self.Tog_Buff().gameObject:SetActive(false)
    --end
    ---创建立绘
    if self.BattleRole.SkinID ~= nil then
        --self:CreatSpine()   --角色用spine
        self:CreatImage(self.BattleRole.SkinID)
    else
        self:CreatImage(tonumber(self.BattleRole.ID))   --怪物无spine,用立绘
    end
    self.BtnPreview().gameObject:SetActive(self.RoleData.id <= 199999);
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

function M:CellSkillPrefab(trans, idx)
    local attr = nil
    if self.RoleData.skin == nil then   --怪物
        self.RoleData.star = self.BattleRole.StartLV
        self.RoleData.skillLevel = self.BattleRole.SkillLV
        self.RoleData.awaken = self.BattleRole.IsAwaken
        self.RoleData.level = self.BattleRole.LV
        attr = self.RoleData:GetMonsterAttr()
    else    --人物
        if not self.BattleRole.PVPEnemy then    --自己(非背包角色)
            if self.BattleRole.IsMonster then       --红塔等对面人物
                local skillUp = self.BattleRole.ShowSkillLV > self.BattleRole.SkillLV
                attr = ReadData.CreatRole(self.RoleData.id,self.BattleRole.SkinID,self.BattleRole.LV,self.BattleRole.StartLV,self.BattleRole.SkillLV,self.BattleRole.IsAwaken,0,true,skillUp) --只取技能描述等数据
            else                                    --己方人物
                attr = self.RoleData:GetHeroAttr()  --只取技能描述等数据
            end
        else            --PVP对面
            local skillUp = self.BattleRole.ShowSkillLV > self.BattleRole.SkillLV
            attr = ReadData.CreatRole(self.RoleData.id,self.BattleRole.SkinID,self.BattleRole.LV,self.BattleRole.StartLV,self.BattleRole.SkillLV,self.BattleRole.IsAwaken,0,true,skillUp) --只取技能描述等数据
        end
    end
    trans:GetComponent("UITemplate"):SetData({self.RoleData,self.BattleRole,self.ChildSkillList[idx],self.BattleRole.ShowSkillLV,"ParentSkill",idx,self})
    Tools.ReContentSizeGroup(self.Content_skill().gameObject)
end

function M:CellBuffPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.buffs[idx],self})
    Tools.ReContentSizeGroup(self.Content().gameObject)
end

function M:CreatSpine()
    self.hd().gameObject:SetActive(false)
    local id = (self.BattleRole.SkinID ~= tonumber(self.BattleRole.ID) and self.BattleRole.SkinID or tonumber(self.BattleRole.ID))
    local _PosInfoTab = CharactercoordinatesLocalData.tab[id].coordinate5
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatchAuto(self.LihuiSpinePanel().gameObject, id, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        obj.transform.gameObject.layer = 5
    end)
end

function M:CreatImage(id)
    self.hd().gameObject:SetActive(true)
    MgrRes.LoadHDIcon_OriginalSize(self.hd(),id)
    local _PosInfoTab = CharactercoordinatesLocalData.tab[id].coordinate13
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    self.hd().transform.localPosition = Vector3(tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),0)
    self.hd().transform.localScale = Vector3(tonumber(_tempPosTab1[2]),tonumber(_tempPosTab1[2]),1)
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    SettingViewModel.SetBattleSpeed(SettingViewModel.GetBattleSpeed())
end

function M:OnBackKey()
    local tab = {"BattlePause_UI","PVPPause_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

return M