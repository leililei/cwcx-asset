-- Code Auto Create Begin
local M = Class('PVPPause_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPPause_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPPause_UI].prefab'
    self.Name = 'Form[PVPPause_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_ClickBack','Btn_ClickBack',2},{'DetailPanel','DetailPanel',2},{'Img_Tanchuangdi3','DetailPanel/Img_Tanchuangdi3',2},{'aijisilogo','DetailPanel/aijisilogo',2},{'Img_VS','DetailPanel/Img_VS',2},{'Img_Zhenrongdi','DetailPanel/LeftRoot/Img_Zhenrongdi',2},{'Img_gezidi','DetailPanel/LeftRoot/Img_gezidi',2},{'Left_18','DetailPanel/LeftRoot/LeftRootLayout/Left_18',2},{'Left_15','DetailPanel/LeftRoot/LeftRootLayout/Left_15',2},{'Left_12','DetailPanel/LeftRoot/LeftRootLayout/Left_12',2},{'Left_9','DetailPanel/LeftRoot/LeftRootLayout/Left_9',2},{'Left_6','DetailPanel/LeftRoot/LeftRootLayout/Left_6',2},{'Left_3','DetailPanel/LeftRoot/LeftRootLayout/Left_3',2},{'Left_17','DetailPanel/LeftRoot/LeftRootLayout/Left_17',2},{'Left_14','DetailPanel/LeftRoot/LeftRootLayout/Left_14',2},{'Left_11','DetailPanel/LeftRoot/LeftRootLayout/Left_11',2},{'Left_8','DetailPanel/LeftRoot/LeftRootLayout/Left_8',2},{'Left_5','DetailPanel/LeftRoot/LeftRootLayout/Left_5',2},{'Left_2','DetailPanel/LeftRoot/LeftRootLayout/Left_2',2},{'Left_16','DetailPanel/LeftRoot/LeftRootLayout/Left_16',2},{'Left_13','DetailPanel/LeftRoot/LeftRootLayout/Left_13',2},{'Left_10','DetailPanel/LeftRoot/LeftRootLayout/Left_10',2},{'Left_7','DetailPanel/LeftRoot/LeftRootLayout/Left_7',2},{'Left_4','DetailPanel/LeftRoot/LeftRootLayout/Left_4',2},{'Left_1','DetailPanel/LeftRoot/LeftRootLayout/Left_1',2},{'Img_Zhenrongdi(1)','DetailPanel/RightRoot/Img_Zhenrongdi (1)',2},{'Img_gezidi(1)','DetailPanel/RightRoot/Img_gezidi (1)',2},{'Right_3','DetailPanel/RightRoot/RightRootLayout/Right_3',2},{'Right_6','DetailPanel/RightRoot/RightRootLayout/Right_6',2},{'Right_9','DetailPanel/RightRoot/RightRootLayout/Right_9',2},{'Right_12','DetailPanel/RightRoot/RightRootLayout/Right_12',2},{'Right_15','DetailPanel/RightRoot/RightRootLayout/Right_15',2},{'Right_18','DetailPanel/RightRoot/RightRootLayout/Right_18',2},{'Right_2','DetailPanel/RightRoot/RightRootLayout/Right_2',2},{'Right_5','DetailPanel/RightRoot/RightRootLayout/Right_5',2},{'Right_8','DetailPanel/RightRoot/RightRootLayout/Right_8',2},{'Right_11','DetailPanel/RightRoot/RightRootLayout/Right_11',2},{'Right_14','DetailPanel/RightRoot/RightRootLayout/Right_14',2},{'Right_17','DetailPanel/RightRoot/RightRootLayout/Right_17',2},{'Right_1','DetailPanel/RightRoot/RightRootLayout/Right_1',2},{'Right_4','DetailPanel/RightRoot/RightRootLayout/Right_4',2},{'Right_7','DetailPanel/RightRoot/RightRootLayout/Right_7',2},{'Right_10','DetailPanel/RightRoot/RightRootLayout/Right_10',2},{'Right_13','DetailPanel/RightRoot/RightRootLayout/Right_13',2},{'Right_16','DetailPanel/RightRoot/RightRootLayout/Right_16',2},{'Img_Fangshoudi','DetailPanel/DefPlayerNameBg/Img_Fangshoudi',2},{'DefIcon','DetailPanel/DefPlayerNameBg/DefIcon',2},{'Img_Jinggongdi','DetailPanel/AtkPlayerNameBg/Img_Jinggongdi',2},{'AtkIcon','DetailPanel/AtkPlayerNameBg/AtkIcon',2},{'ClickBack','SkipPanel/ClickBack',2},{'Img_Skipdi','SkipPanel/Img_Skipdi',2},{'Btn_Cancel','SkipPanel/Btn_Cancel',2},{'Btn_Confirm','SkipPanel/Btn_Confirm',2},{'Img_Jixuzuozhandi','Btn_Back/Img_Jixuzuozhandi',2},{'Img_Fangqizuozhandi','Btn_GiveUp/Img_Fangqizuozhandi',2},{'Img_Shunxudi','Btn_ShowOrder/Img_Shunxudi',2},{'Img_Setting','Btn_Setting/Img_Setting',2},{'RoleInfoPanel','RoleInfoPanel',2},{'Btn_ClickBack01','RoleInfoPanel/Btn_ClickBack',2},{'Img_bg','RoleInfoPanel/Img_bg',2},{'Biaoti1','RoleInfoPanel/Img_bg/Biaoti1',2},{'Biaoti2','RoleInfoPanel/Img_bg/Biaoti2',2},{'Hp','RoleInfoPanel/Img_bg/Hp',2},{'HPtiaodi','RoleInfoPanel/Img_bg/Hp/HPtiaodi',2},{'HPtiao','RoleInfoPanel/Img_bg/Hp/HPtiao',2},{'Shield','RoleInfoPanel/Img_bg/Shield',2},{'Shieldtiaodi','RoleInfoPanel/Img_bg/Shield/Shieldtiaodi',2},{'Shieldtiao','RoleInfoPanel/Img_bg/Shield/Shieldtiao',2},{'Atk','RoleInfoPanel/Img_bg/Info/Atk',2},{'AtkIcon01','RoleInfoPanel/Img_bg/Info/Atk/AtkIcon',2},{'Def','RoleInfoPanel/Img_bg/Info/Def',2},{'DefIcon01','RoleInfoPanel/Img_bg/Info/Def/DefIcon',2},{'Baoji','RoleInfoPanel/Img_bg/Info/Baoji',2},{'BaojiIcon','RoleInfoPanel/Img_bg/Info/Baoji/BaojiIcon',2},{'Baoshang','RoleInfoPanel/Img_bg/Info/Baoshang',2},{'BaoshangIcon','RoleInfoPanel/Img_bg/Info/Baoshang/BaoshangIcon',2},{'Mingjie','RoleInfoPanel/Img_bg/Info/Mingjie',2},{'MingjieIcon','RoleInfoPanel/Img_bg/Info/Mingjie/MingjieIcon',2},{'Biaoti3','RoleInfoPanel/Img_bg/Biaoti3',2},{'Img_Last','RoleInfoPanel/Img_bg/RoleOrder/Img_Last',2},{'Img_Fast','RoleInfoPanel/Img_bg/RoleOrder/Img_Fast',2},{'BuffIcon','RoleInfoPanel/Img_bg/BuffIcon',2},{'Img_WuXian','RoleInfoPanel/Img_bg/BuffIcon/Img_WuXian',2},{'BuffPanel','RoleInfoPanel/Img_bg/BuffPanel',2},{'Biaoti5','RoleInfoPanel/Img_bg/Biaoti5',2},{'SkillPanelContent','RoleInfoPanel/Img_bg/SkillPanel/SkillPanelContent',2},{'Btn_Zuo','RoleInfoPanel/Img_bg/Btn_Zuo',2},{'Btn_You','RoleInfoPanel/Img_bg/Btn_You',2},{'Img_Xian2','RoleInfoPanel/Img_Xian2',2},{'Img_Xian1','RoleInfoPanel/Img_Xian1',2},
        -- Text 列表
        {'SkipText','SkipPanel/SkipText',3},
        -- Button 列表
        {'Btn_Back','Btn_Back',4},{'Btn_GiveUp','Btn_GiveUp',4},{'Btn_ShowOrder','Btn_ShowOrder',4},{'Btn_Setting','Btn_Setting',4},
        -- UITemplate 列表
        {'PauseRoleItem','DetailPanel/PauseRoleItem',10},{'BattleRoleItem','RoleInfoPanel/Img_bg/BattleRoleItem',10},{'SkillItem','RoleInfoPanel/Img_bg/SkillPanel/SkillItem',10},
        -- RawImage 列表
        {'Btn_Back01','Btn_Back',15},{'Btn_GiveUp01','Btn_GiveUp',15},{'Btn_ShowOrder01','Btn_ShowOrder',15},{'Btn_Setting01','Btn_Setting',15},
        -- LoopScrollRect 列表
        {'SkillPanel','RoleInfoPanel/Img_bg/SkillPanel',18},
        -- TextMeshProUGUI 列表
        {'Text_DefScore','DetailPanel/DefPlayerNameBg/Text_DefScore',20},{'Text_DefName','DetailPanel/DefPlayerNameBg/Text_DefName',20},{'Text_Fangshoufang','DetailPanel/DefPlayerNameBg/Text_Fangshoufang',20},{'Text_AtkScore','DetailPanel/AtkPlayerNameBg/Text_AtkScore',20},{'Text_AtkName','DetailPanel/AtkPlayerNameBg/Text_AtkName',20},{'Text_Jinggongfang','DetailPanel/AtkPlayerNameBg/Text_Jinggongfang',20},{'Btn_Txt','SkipPanel/Btn_Cancel/Btn_Txt',20},{'Btn_Txt01','SkipPanel/Btn_Confirm/Btn_Txt',20},{'Text_Jixuzuozhan','Btn_Back/Text_Jixuzuozhan',20},{'Text_Fangqizuozhan','Btn_GiveUp/Text_Fangqizuozhan',20},{'Text_Shunxu','Btn_ShowOrder/Text_Shunxu',20},{'Text_Setting','Btn_Setting/Text_Setting',20},{'Text_Biaoti1','RoleInfoPanel/Img_bg/Biaoti1/Text_Biaoti1',20},{'Text_Name','RoleInfoPanel/Img_bg/Text_Name',20},{'Text_Biaoti2','RoleInfoPanel/Img_bg/Biaoti2/Text_Biaoti2',20},{'Text_HP1','RoleInfoPanel/Img_bg/Hp/Text_HP1',20},{'Text_HP2','RoleInfoPanel/Img_bg/Hp/Text_HP2',20},{'Text_Shield1','RoleInfoPanel/Img_bg/Shield/Text_Shield1',20},{'Text_Shield2','RoleInfoPanel/Img_bg/Shield/Text_Shield2',20},{'Text_Damage1','RoleInfoPanel/Img_bg/Text_Damage1',20},{'Text_Damage2','RoleInfoPanel/Img_bg/Text_Damage2',20},{'Text_Atk1','RoleInfoPanel/Img_bg/Info/Atk/Text_Atk1',20},{'Text_Atk2','RoleInfoPanel/Img_bg/Info/Atk/Text_Atk2',20},{'Text_Def1','RoleInfoPanel/Img_bg/Info/Def/Text_Def1',20},{'Text_Def2','RoleInfoPanel/Img_bg/Info/Def/Text_Def2',20},{'Text_Baoji1','RoleInfoPanel/Img_bg/Info/Baoji/Text_Baoji1',20},{'Text_Baoji2','RoleInfoPanel/Img_bg/Info/Baoji/Text_Baoji2',20},{'Text_Baoshang1','RoleInfoPanel/Img_bg/Info/Baoshang/Text_Baoshang1',20},{'Text_Baoshang2','RoleInfoPanel/Img_bg/Info/Baoshang/Text_Baoshang2',20},{'Text_Mingjie1','RoleInfoPanel/Img_bg/Info/Mingjie/Text_Mingjie1',20},{'Text_Mingjie2','RoleInfoPanel/Img_bg/Info/Mingjie/Text_Mingjie2',20},{'Text_Biaoti3','RoleInfoPanel/Img_bg/Biaoti3/Text_Biaoti3',20},{'Text_Order','RoleInfoPanel/Img_bg/RoleOrder/Text_Order',20},{'Text_TurnNumber','RoleInfoPanel/Img_bg/BuffIcon/Text_TurnNumber',20},{'Text_Biaoti5','RoleInfoPanel/Img_bg/Biaoti5/Text_Biaoti5',20},{'Text_Shuzi','RoleInfoPanel/Img_bg/Text_Shuzi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    CJNBattleMgr.Instance.IsPause = true
    self.RoleInfoPanel().gameObject:SetActive(false)
end
---参数pData为BattleManager.AllRole
function M:OnShow(pData)
    --[[self:JumpOutFunction()
    --if PVPViewModel.IsViewRecord then
    --    self.Btn_Giveup().gameObject:SetActive(true)
    --    --self.Btn_GoMenu().gameObject:SetActive(true)
    --    self.Text_Jixuzuozhan().text = "继续播放"
    --else
    --    self.Btn_Giveup().gameObject:SetActive(false)
    --    if BattleViewModel.JumpButtonOn then
    --        self.Btn_Giveup().gameObject:SetActive(true)
    --    end
    --    self.Text_Jixuzuozhan().text = "继续作战"
    --end]]
    ---@type BattleRole
    self.allRole = clone(pData[1])
    ---排除死亡角色的排名
    local leftDead = 0
    local rightDead = 0
    self.type = pData[2]
    if PVPViewModel.PlayerIsAtk then
        self.Text_AtkName().text = PVPViewModel.OwnInfo.name
        self.Text_AtkScore().text = MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.OwnInfo.score
        self.Text_DefName().text = PVPViewModel.TargetInfo.name
        self.Text_DefScore().text = MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.TargetInfo.score
    else
        self.Text_AtkName().text = PVPViewModel.TargetInfo.name
        self.Text_AtkScore().text = MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.TargetInfo.score
        self.Text_DefName().text = PVPViewModel.OwnInfo.name
        self.Text_DefScore().text = MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.OwnInfo.score
    end
    if PVPViewModel.GetViewRecordsCount() > 1 then
        self.AtkIcon().gameObject:SetActive(false);
        self.DefIcon().gameObject:SetActive(false);
    else
        self.AtkIcon().gameObject:SetActive(true);
        self.DefIcon().gameObject:SetActive(true);
        local name = self:IconName(PVPViewModel.OwnInfo.rankLevel)
        MgrRes.LoadSprite(self.AtkIcon(),"Level/" .. name)
        local defName = self:IconName(PVPViewModel.TargetInfo.rankLevel)
        MgrRes.LoadSprite(self.DefIcon(),"Level/" .. defName)
    end
    ---清空实例列表
    self.RoleList = {}
    self.RightList = {}
    self.LeftList = {}
    self.RightRole = {}
    self.LeftRole = {}
    for i, role in ipairs(self.allRole) do
        ---获取角色ui数据
        local roleData = nil
        if self.type == 1 then
            roleData = role.IsMonster == false and HeroControl.GetRoleDataByID(tonumber(role.ID)) or StormViewModel.CurPointData:GetMonsterById(tonumber(role.ID),role.AtkOrder)
        elseif self.type == 2 then
            roleData = role.IsMonster == false and HeroControl.GetRoleDataByID(tonumber(role.ID)) or EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData
        end
        print("zqx PVPPause_UI role", role.PosX, role.PosY, role.ID, role.IsLeft)
        ---判断左右
        local leftOrRight = role.IsLeft and "Left" or "Right"
        ---拼接节点名
        local parentName = leftOrRight
        if role.IsLeft then
            parentName = parentName.."_"..((6 - role.PosX) * 3 + (4 - role.PosY))
        else
            parentName = parentName.."_"..((role.PosX - 1) * 3 + (4 - role.PosY))
        end
        ---设置参数
        local item
        if role.IsLeft then
            if role.Remove then
                leftDead = 0--leftDead + 1
            else
                ---创建角色头像
                item = GameObject.Instantiate(self.PauseRoleItem().gameObject,self[parentName]().transform,false)
                ---设置0坐标
                item.transform.localPosition = Vector3.zero
                item:GetComponent("UITemplate"):SetData({roleData,role,leftDead,self,role.SkinID})
                self.LeftList[#self.LeftList + 1] = item
                self.LeftRole[#self.LeftRole + 1] = role
            end
        else
            if role.Remove then
                rightDead = 0--rightDead + 1
            else
                ---创建角色头像
                item = GameObject.Instantiate(self.PauseRoleItem().gameObject,self[parentName]().transform,false)
                ---设置0坐标
                item.transform.localPosition = Vector3.zero
                item:GetComponent("UITemplate"):SetData({roleData,role,rightDead,self,role.SkinID})
                self.RightList[#self.RightList + 1] = item
                self.RightRole[#self.RightRole + 1] = role
            end
        end
        ---保存实例
        self.RoleList[#self.RoleList + 1] = item
    end
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---注册遮罩点击
    UIEvent.LuaClick(self.Btn_ClickBack().gameObject,function()
        ---关闭界面
        self:OnCloseSelf()
    end)
    UIEvent.LuaClick(self.Btn_ClickBack01().gameObject,function()
        self.RoleInfoPanel().gameObject:SetActive(false)
    end)
    ---注册顺序显隐点击
    self.showOrder = true
    UIEvent.LuaClick(self.Btn_ShowOrder().gameObject,function()
        self.showOrder = not self.showOrder
        for i, item in pairs(self.RoleList) do
            local order = item.transform:Find("Order").gameObject
            order:SetActive(self.showOrder)
        end
    end)
    --Tools.ToggleValueChange(self.Tog_ShowOrder(),function(isOn)
    --    for i, item in pairs(self.RoleList) do
    --        local order = item.transform:Find("Order").gameObject
    --        order:SetActive(isOn)
    --    end
    --end,nil)
    ---注册设置点击
    UIEvent.LuaClick(self.Btn_Setting().gameObject,function()
        MgrUI.Pop(UID.SettingPop_UI,{{1,2,6}},true)
    end)
    ---注册返回主页点击
    --[[UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        ---关闭界面
        self:OnCloseSelf()
        MgrUI.Pop(UID.ConfirmPop_UI,{"是否返回大厅",function()
            BattleViewModel.JumpOut = true
                --销毁战斗数据
                local lockTime = 0
                if MgrUI.GetCurUI().Uid == UID.PVPBattle_UI then
                    ---若在战斗界面销毁战斗数据
                    BattleManager.ClearLuaData()
                    ---反复开关Battle_UI会出bug，此处创建一个临时form做缓冲

                    lockTime = 0.3
                end
                MgrTimer.AddDelayNoName(lockTime,function()
                    MgrUI.Pop(UID.FullLoading_UI,{0.5,function()
                        PVPViewModel.IsViewRecord = false
                        MgrUI.GoClose(UID.PVPReady_UI)
                    end,nil,false},true)
                end,nil)
        end,nil,2},true)
    end)]]
    ---注册跳过作战点击
    --[[
    --UIEvent.LuaClick(self.Btn_Giveup().gameObject,function()
    --    ---关闭界面
    --    self:OnCloseSelf()
    --    MgrUI.Pop(UID.ConfirmPop_UI,{"是否<color=#FF3C4E>跳过</color>此次战斗，直接显示结果？",function()
    --        ---战斗设置为跳过
    --        BattleViewModel.JumpOut = true
    --        BattleViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
    --        ---连续作战结束
    --        PVPViewModel.continue = false
    --        PVPViewModel.continueCount = 0
    --    end,nil,2},true)
    --end)
    ]]
    ---注册继续作战点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        ---关闭界面
        self:OnCloseSelf()
    end)
end
---关闭界面
function M:OnCloseSelf()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
    CJNBattleMgr.Instance.IsPause = false
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        self:OnCloseSelf()
    end
end
function M:IconName(rankLevel)
    local PVPData = PVPViewModel.GetPvPRank(rankLevel)
    return PVPData[3]
end

function M:ShowRoleInfo(roleData,role,teamdead)
    self.BuffIcon().gameObject:SetActive(false)
    ---战斗中数据
    local cProperties = role.myAni.roleData
    ---PVP角色数据与本地数据不同
    local roleDataCopy = clone(roleData)
    roleDataCopy.level = role.LV
    roleDataCopy.skillLevel = role.SkillLV
    roleDataCopy.awaken = role.IsAwaken
    roleDataCopy.star = role.StartLV
    ---头像
    self.BattleRoleItem().gameObject:GetComponent("UITemplate"):SetData({roleDataCopy,self})
    ---名字
    self.Text_Name().text = roleData.name
    ---顺序
    self.Text_Order().text = role.AtkOrder - teamdead
    ---生命值
    self.Text_HP2().text = cProperties.HP .."/".. math.modf(role.HPmax)
    local ratio = cProperties.HP/role.HPmax
    Tools.UIDoLocalScale(self.HPtiao().gameObject,1,ratio,0,0,0,0.5,0)
    ---护盾值
    self.Text_Shield2().text = cProperties.Shield_Value
    ratio = cProperties.Shield_Value/role.HPmax
    Tools.UIDoLocalScale(self.Shieldtiao().gameObject,1,ratio,0,0,0,0.5,0)
    ---攻击力
    self.Text_Atk2().text = cProperties.RealAtk
    ---装甲值
    self.Text_Def2().text = math.floor(cProperties.RealDef * 1000 + 0.5) / 10 .. "%"
    ---致命率
    self.Text_Baoji2().text = math.floor(cProperties.RealCrit * 1000 + 0.5) / 10 .. "%"
    ---致命伤害
    self.Text_Baoshang2().text = math.floor(cProperties.RealCritDmg * 1000 + 0.5) / 10 .. "%"
    ---机动力
    self.Text_Mingjie2().text = math.floor(cProperties.RealAgile * 1000 + 0.5) / 10 .. "%"
    ---Buff
    local buff = Tool.CSharpListToLuaTable(role.myAni.myHpUi.Bufftexts)
    Tools.ClearAllChild(self.BuffPanel().gameObject)
    if #buff ~= 0 then
        for i,v in ipairs(buff) do
            local buff = GameObject.Instantiate(self.BuffIcon().gameObject,self.BuffPanel().gameObject.transform,false)
            buff:SetActive(true)
            if v.BuffTurn == -1 then
                buff.transform:Find("Img_WuXian").gameObject:SetActive(true)
                buff.transform:Find("Text_TurnNumber").gameObject:SetActive(false)
            else
                buff.transform:Find("Img_WuXian").gameObject:SetActive(false)
                buff.transform:Find("Text_TurnNumber").gameObject:SetActive(true)
                buff.transform:Find("Text_TurnNumber").gameObject:GetComponent("TextMeshProUGUI").text = v.BuffTurn
            end
            local skillIcon = SkillLocalData.tab[v.id][13]
            MgrRes.LoadSprite(buff.transform:GetComponent("Image"),"Skill/" .. skillIcon)
        end
    end

    ---创建技能
    self.SkillsSample = {}
    if role.Skill_1_example[1] ~= nil then
        table.insert(self.SkillsSample,role.Skill_1_example)
    end
    if role.Skill_2_example[1] ~= nil then
        table.insert(self.SkillsSample,role.Skill_2_example)
    end
    if role.Skill_3_example[1] ~= nil then
        table.insert(self.SkillsSample,role.Skill_3_example)
    end
    if role.Skill_4_example[1] ~= nil then
        table.insert(self.SkillsSample,role.Skill_4_example)
    end
    if role.Skill_5_example[1] ~= nil then
        table.insert(self.SkillsSample,role.Skill_5_example)
    end
    self.ChildSkillList = SkillDetailControl.GetSkillListByID(tonumber(role.ID))
    self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,role.specialEquip)    ---根据角色进阶共鸣装备替换技能简略表
    self.CurRole = role
    self.SkillPanel():SetLuaCellEvent(Handle(self,self.CellSkillPrefab))
    self.SkillPanel().totalCount = #self.ChildSkillList
    self.SkillPanel():RefillCells()
    ---左右按钮
    if role.IsLeft then
        self.Text_Shuzi().text = (role.AtkOrder - teamdead) .. "/" .. #self.LeftList
    else
        self.Text_Shuzi().text = (role.AtkOrder - teamdead) .. "/" .. #self.RightList
    end
    ---找出上一个
    UIEvent.LuaClick(self.Btn_Zuo().gameObject,function()
        local rData,nextRole,dead = self:FindNextRole(role,true)
        if rData then
            local uiFrom = MgrUI.GetCurUI()
            if uiFrom.Uid == UID.Battle02_UI then
                ---BattlePause_UI
                self:ShowRoleInfo(rData,nextRole,dead)
            end
        end
    end)
    ---找出下一个
    UIEvent.LuaClick(self.Btn_You().gameObject,function()
        local rData,nextRole,dead = self:FindNextRole(role,false)
        if rData then
            local uiFrom = MgrUI.GetCurUI()
            if uiFrom.Uid == UID.Battle02_UI then
                ---BattlePause_UI
                self:ShowRoleInfo(rData,nextRole,dead)
            end
        end
    end)
    ---打开面板
    self.RoleInfoPanel().gameObject:SetActive(true)
end

function M:CellSkillPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.ChildSkillList[idx],self,self.CurRole,"Battle"})
end

function M:FindNextRole(role,lastTOrNextF)
    local nextRole = nil
    local roleData = nil
    local dead = 0
    if role.IsLeft then
        for i,v in ipairs(self.LeftRole) do     ---i == atkOrder
        if v == role and ((lastTOrNextF and i ~= 1) or (not lastTOrNextF and i ~= #self.LeftRole)) then
            if lastTOrNextF then
                nextRole = self.LeftRole[i - 1]
            else
                nextRole = self.LeftRole[i + 1]
            end
            for j, r in ipairs(self.allRole) do
                if r.IsLeft then
                    if r.Remove then
                        dead = dead + 1
                    end
                end
                if r == nextRole then
                    break
                end
            end
        end
        end
        if nextRole == nil then
            return nil,nil,nil
        end
    else
        for i,v in ipairs(self.RightRole) do    ---找到现存的下一个role
        if v == role and ((lastTOrNextF and i ~= 1) or (not lastTOrNextF and i ~= #self.RightRole)) then
            if lastTOrNextF then
                nextRole = self.RightRole[i - 1]
            else
                nextRole = self.RightRole[i + 1]
            end
            for j, r in ipairs(self.allRole) do     ---统计下一个角色前的死亡数
            if not r.IsLeft then
                if r.Remove then
                    dead = dead + 1
                end
                if r == nextRole then
                    break
                end
            end
            end
        end
        end
        if nextRole == nil then
            return nil,nil,nil
        end
    end
    if self.type == 1 then
        roleData = nextRole.IsMonster == false and HeroControl.GetRoleDataByID(tonumber(nextRole.ID)) or StormViewModel.CurPointData:GetMonsterById(tonumber(nextRole.ID),nextRole.AtkOrder)
    elseif self.type == 2 then
        roleData = nextRole.IsMonster == false and HeroControl.GetRoleDataByID(tonumber(nextRole.ID)) or EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData
    end
    return roleData,nextRole,dead
end

--function M:OnClose()
--    MgrTimer.Cancel("buttonOn")
--end

--function M:JumpOutFunction()
--    MgrTimer.AddRepeat("buttonOn",0.1,function()
--        if BattleViewModel.JumpButtonOn then
--            self.Btn_Giveup().gameObject:SetActive(true)
--            self.Text_DJS().gameObject:SetActive(false)
--            MgrTimer.Cancel("buttonOn")
--        else
--            self.Text_DJS().text = BattleViewModel.DJS .. "秒后可跳过"
--        end
--    end,-1,nil)
--end

--------------------------废弃---------------------
---汇报战况
--function M:BattleResultACK(buffer, tag)
--    if tag~= 1 then
--        return
--    end
--    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleResultACK',buffer))
--    print(tab.errNo)
--    if tab.errNo~=0 then
--        MgrUI.Pop(UID.PopTip_UI,{"汇报战况失败",2},true)
--    end
--end
--
--function M:BattleResultNTF(buffer, tag)
--    if tag~= 1 then
--        return
--    end
--    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleResultNTF',buffer))
--    CJNBattleMgr.SetGameSpeed(1)
--    PVPViewModel.IsViewRecord = false
--    ---获取出战角色
--    tab.RoleIDList = PVPViewModel.GetAllRoleId(true)
--    ---更新物品奖励
--    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
--    ---记录统计
--    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
--    ---打开结算界面
--    MgrUI.Pop(UID.PVPComplete_UI,tab,true)
--end
-----汇报战况
--function M:BattleResultData(result)
--    local BaseREQ  =
--    {
--        token = PVPViewModel.CurToken,
--        result = result
--    }
--    ---序列化
--    local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleResultREQ',BaseREQ))
--    ---发送数据
--    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_BATTLE_RESULT_REQ,bytes,1,nil,Handle(self,self.BattleResultACK),Handle(self, self.BattleResultNTF))
--end

return M