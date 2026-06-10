-- Code Auto Create Begin
local M = Class('BattlePause_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BattlePause_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BattlePause_UI].prefab'
    self.Name = 'Form[BattlePause_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_ClickBack','Btn_ClickBack',2},{'DetailPanel','DetailPanel',2},{'Img_Tanchuangdi3','DetailPanel/Img_Tanchuangdi3',2},{'aijisilogo','DetailPanel/aijisilogo',2},{'Img_VS','DetailPanel/Img_VS',2},{'Img_Zhenrongdi','DetailPanel/LeftRoot/Img_Zhenrongdi',2},{'Img_gezidi','DetailPanel/LeftRoot/Img_gezidi',2},{'Left_13','DetailPanel/LeftRoot/LeftRootLayout/Left_13',2},{'Left_14','DetailPanel/LeftRoot/LeftRootLayout/Left_14',2},{'Left_15','DetailPanel/LeftRoot/LeftRootLayout/Left_15',2},{'Left_16','DetailPanel/LeftRoot/LeftRootLayout/Left_16',2},{'Left_17','DetailPanel/LeftRoot/LeftRootLayout/Left_17',2},{'Left_18','DetailPanel/LeftRoot/LeftRootLayout/Left_18',2},{'Left_7','DetailPanel/LeftRoot/LeftRootLayout/Left_7',2},{'Left_8','DetailPanel/LeftRoot/LeftRootLayout/Left_8',2},{'Left_9','DetailPanel/LeftRoot/LeftRootLayout/Left_9',2},{'Left_10','DetailPanel/LeftRoot/LeftRootLayout/Left_10',2},{'Left_11','DetailPanel/LeftRoot/LeftRootLayout/Left_11',2},{'Left_12','DetailPanel/LeftRoot/LeftRootLayout/Left_12',2},{'Left_1','DetailPanel/LeftRoot/LeftRootLayout/Left_1',2},{'Left_2','DetailPanel/LeftRoot/LeftRootLayout/Left_2',2},{'Left_3','DetailPanel/LeftRoot/LeftRootLayout/Left_3',2},{'Left_4','DetailPanel/LeftRoot/LeftRootLayout/Left_4',2},{'Left_5','DetailPanel/LeftRoot/LeftRootLayout/Left_5',2},{'Left_6','DetailPanel/LeftRoot/LeftRootLayout/Left_6',2},{'Img_Zhenrongdi(1)','DetailPanel/RightRoot/Img_Zhenrongdi (1)',2},{'Img_gezidi(1)','DetailPanel/RightRoot/Img_gezidi (1)',2},{'Right_1','DetailPanel/RightRoot/RightRootLayout/Right_1',2},{'Right_2','DetailPanel/RightRoot/RightRootLayout/Right_2',2},{'Right_3','DetailPanel/RightRoot/RightRootLayout/Right_3',2},{'Right_4','DetailPanel/RightRoot/RightRootLayout/Right_4',2},{'Right_5','DetailPanel/RightRoot/RightRootLayout/Right_5',2},{'Right_6','DetailPanel/RightRoot/RightRootLayout/Right_6',2},{'Right_7','DetailPanel/RightRoot/RightRootLayout/Right_7',2},{'Right_8','DetailPanel/RightRoot/RightRootLayout/Right_8',2},{'Right_9','DetailPanel/RightRoot/RightRootLayout/Right_9',2},{'Right_10','DetailPanel/RightRoot/RightRootLayout/Right_10',2},{'Right_11','DetailPanel/RightRoot/RightRootLayout/Right_11',2},{'Right_12','DetailPanel/RightRoot/RightRootLayout/Right_12',2},{'Right_13','DetailPanel/RightRoot/RightRootLayout/Right_13',2},{'Right_14','DetailPanel/RightRoot/RightRootLayout/Right_14',2},{'Right_15','DetailPanel/RightRoot/RightRootLayout/Right_15',2},{'Right_16','DetailPanel/RightRoot/RightRootLayout/Right_16',2},{'Right_17','DetailPanel/RightRoot/RightRootLayout/Right_17',2},{'Right_18','DetailPanel/RightRoot/RightRootLayout/Right_18',2},{'AtkPlayerNameBg','DetailPanel/AtkPlayerNameBg',2},{'DefPlayerNameBg','DetailPanel/DefPlayerNameBg',2},{'ClickBack','SkipPanel/ClickBack',2},{'Img_Skipdi','SkipPanel/Img_Skipdi',2},{'Btn_Cancel','SkipPanel/Btn_Cancel',2},{'Btn_Confirm','SkipPanel/Btn_Confirm',2},{'Img_Jixuzuozhandi','Btn_Back/Img_Jixuzuozhandi',2},{'Img_Fangqizuozhandi','Btn_GiveUp/Img_Fangqizuozhandi',2},{'Img_Shunxudi','Btn_ShowOrder/Img_Shunxudi',2},{'Img_Setting','Btn_Setting/Img_Setting',2},
        -- Text 列表
        {'Btn_Txt','SkipPanel/Btn_Cancel/Btn_Txt',3},{'Btn_Txt01','SkipPanel/Btn_Confirm/Btn_Txt',3},{'SkipText','SkipPanel/SkipText',3},
        -- Button 列表
        {'Btn_Back','Btn_Back',4},{'Btn_GiveUp','Btn_GiveUp',4},{'Btn_ShowOrder','Btn_ShowOrder',4},{'Btn_Setting','Btn_Setting',4},
        -- UITemplate 列表
        {'PauseRoleItem','DetailPanel/PauseRoleItem',10},
        -- RawImage 列表
        {'Btn_Back01','Btn_Back',15},{'Btn_GiveUp01','Btn_GiveUp',15},{'Btn_ShowOrder01','Btn_ShowOrder',15},{'Btn_Setting01','Btn_Setting',15},
        -- TextMeshProUGUI 列表
        {'AtkPlayerNameText','DetailPanel/AtkPlayerNameBg/AtkPlayerNameText',20},{'DefPlayerNameText','DetailPanel/DefPlayerNameBg/DefPlayerNameText',20},{'Text_Jixuzuozhan','Btn_Back/Text_Jixuzuozhan',20},{'Text_Fangqizuozhan','Btn_GiveUp/Text_Fangqizuozhan',20},{'Text_Shunxu','Btn_ShowOrder/Text_Shunxu',20},{'Text_Setting','Btn_Setting/Text_Setting',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    Event.Go("WorldBossHpClose",false)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        CJNBattleMgr.Instance.IsPause = false
        ---关闭界面
        self:OnCloseSelf()
    end
end

---参数pData为BattleManager.AllRole
function M:OnShow(pData)
    self.oldAllRole = clone(pData[1])
    ---排除死亡角色的排名
    local leftDead = 0
    local rightDead = 0                 --本场战斗中死亡的人数
    local rightDeadBeforeGameStart = 0  --开始本场战斗前就已经死亡的数量
    ---1为常规关卡 2为世界boss 3为武道会
    self.type = pData[2]
    ---清空实例列表
    self.RoleList = {}
    self.RightList = {}
    self.LeftList = {}
    self.RightRole = {}
    self.LeftRole = {}

    local maxGameID = 0
    for i, _ in pairs(self.oldAllRole) do
        if i > maxGameID then
            maxGameID = i
        end
    end
    for i = 1, maxGameID do
        local role = self.oldAllRole[i]
        if role ~= nil then
            ---获取角色ui数据
            local roleData = nil
            if self.type == 1 or self.type == 3 then
                roleData = role.IsMonster == false and HeroControl.GetRoleDataByID(tonumber(role.ID)) or StormViewModel.CurPointData:GetMonsterById(tonumber(role.ID),role.monsterAtkOrder + rightDeadBeforeGameStart)
            elseif self.type == 2 then
                if not role.IsMonster then
                    roleData = HeroControl.GetRoleDataByID(tonumber(role.ID))
                else
                    local tBossData = EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel]
                    --判断是否为连战
                    roleData = tBossData:GetMonsterDataById(tonumber(role.ID))
                end
            end
            if role.isSummonObj then --召唤物
                roleData = MonsterControl.CreateSingleMonster(tonumber(role.ID),role.StartLV,role.LV,role.IsAwaken,role.SkillLV,role.PosY-1 + 3*(role.PosX-1),1,false,role.coreID1,role.core1Po,0,role.coreID2,role.core2Po,0,role.AtkOrder)
            end
            ---判断左右
            local leftOrRight = role.IsLeft and "Left" or "Right"
            ---拼接节点名
            local parentName = leftOrRight.."_"..(role.PosY - 1) * 6 + role.PosX
            local item
            ---设置参数
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
                if role.Remove and role.AtkOrder ~= -1 then
                    rightDead = 0--rightDead + 1
                elseif role.AtkOrder == -1 then
                    rightDeadBeforeGameStart = rightDeadBeforeGameStart + 1
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
    end
    if self.type==1 and StormViewModel.CurPointData and StormViewModel.CurPointData.name then
        self.DefPlayerNameText().text=StormViewModel.CurPointData.name
    elseif self.type==2 then
        local data = EventRaidControl.GetLIANHETAOFAData().BossData[1]
        if data and data.monsterData and data.monsterData.name then
            self.DefPlayerNameText().text=data.monsterData.name
        end
    elseif self.type == 3 then
        self.AtkPlayerNameText().text = PVPViewModel.OwnInfo.name
        self.DefPlayerNameText().text = PVPViewModel.TargetInfo.name
    end
    if PlayerControl.GetPlayerData() and PlayerControl.GetPlayerData().nickname and self.type ~= 3 then
        self.AtkPlayerNameText().text=PlayerControl.GetPlayerData().nickname
    end
    ---注册遮罩点击
    UIEvent.LuaClick(self.Btn_ClickBack().gameObject,function()
        CJNBattleMgr.Instance.IsPause = false
        ---关闭界面
        self:OnCloseSelf()
    end)
    ---注册顺序显隐点击
    ---改为重新开始战斗
    self.ShowOrder = true
    self.Text_Shunxu().text = MgrLanguageData.GetLanguageByKey("ui_battlefail_text1")
    UIEvent.LuaClick(self.Btn_ShowOrder().gameObject,function()
	BattleViewModel.Stop = true
        self:OnCloseSelf()
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("battlepause_ui_tips7"),function()
            BattleManager.BattleAgain = true
            BattleViewModel.JumpOut = true
            CJNBattleMgr.SetGameSpeed(1)
            BattleManager.ClearLuaData()
            if SummerControl.GetBossLevel() then
                SummerControl.GetBossData(Handle(self,function(...)
                    ---下次需要获取夏活BOSS数据
                    SummerControl.ChangeBossData()
                    ---重开
                    self:PlayAgain()
                end))
            elseif ActivityControl.GetBossLevel() then
                ActivityControl.GetBossData(Handle(self,function(...)
                    ---下次需要获取夏活BOSS数据
                    ActivityControl.ChangeBossData()
                    ---重开
                    self:PlayAgain()
                end))
            else
                self:PlayAgain()
            end
        end,nil,2,function() CJNBattleMgr.Instance.IsPause = false end},true)
        --self.ShowOrder = not self.ShowOrder
        --for i, item in pairs(self.RoleList) do
        --    local order = item.transform:Find("Order").gameObject
        --    order:SetActive(self.ShowOrder)
        --end
    end)

    ---注册设置点击
    UIEvent.LuaClick(self.Btn_Setting().gameObject,function()
        MgrUI.Pop(UID.SettingPop_UI,{{1,2,6}},true)
    end)
    ---注册返回主页点击
    --[[UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        MgrUI.Pop(UID.ConfirmPop_UI,{"回到大厅战斗将<color=#FF3C4E>失败</color>，是否返回",function()
            ---销毁战斗数据
            BattleViewModel.JumpOut = true
            local txt = ""
            if  NoviceViewModel.CheckTaskLock(20014)  then
                txt = "\"技能强化\"已解锁,即将返回主界面开启教程。"
            elseif NoviceViewModel.CheckTaskLock(21003)  then
                txt = "\"资源副本\"已解锁,即将返回主界面开启教程。"
            elseif NoviceViewModel.CheckTaskLock(22010)  then
                txt = "\"界限突破\"已解锁,即将返回主界面开启教程。"
            elseif NoviceViewModel.CheckTaskLock(23016)  then
                txt = "\"共鸣装备\"已解锁,即将返回主界面开启教程。"
            elseif NoviceViewModel.CheckTaskLock(24023)  then
                txt = "\"机甲核心\"已解锁,即将返回主界面开启教程。"
            else
                txt = ""
            end
            if txt ~= "" then
                MgrTimer.AddDelayNoName(0.2, function()
                    MgrUI.Pop(UID.NoviceForce_UI,{txt},true)
                end)
                return
            end
            --BattleManager.ClearLuaData()
            --if type == 1 then
            --    StormViewModel.BattleEndOpen(2)
            --elseif type == 2 then
            --    StormViewModel.CloseWorldBossBattle(true)
            --end

                CJNBattleMgr.SetGameSpeed(1)
                ---关闭界面
                self:OnCloseSelf()
        end,nil,2},true)
    end)]]

    ---注册放弃作战点击
    UIEvent.LuaClick(self.Btn_GiveUp01().gameObject,function()
        BattleViewModel.Stop = true
        self:OnCloseSelf()
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("battlepause_ui_tips14"),function()
            BattleViewModel.JumpOut = true
            BattleViewModel.GiveUp = BattleViewModel.giveUp.GIVE_UP
            BattleViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
            MgrTimer.Cancel("GamePausing")
            ---销毁战斗数据
            CJNBattleMgr.SetGameSpeed(1)
            ---回合结束结算
            BattleViewModel.ReturnToMainScene()
            ---关闭界面
            self:OnCloseSelf()
        end,nil,2,function() CJNBattleMgr.Instance.IsPause = false end},true)
    end)

    ---注册继续作战点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        CJNBattleMgr.Instance.IsPause = false
        ---关闭界面
        self:OnCloseSelf()
    end)
    if BattleManager.GameMode == BattleManager.GameModeType.Guide or BattleManager.GameMode == BattleManager.GameModeType.RedTower or BattleManager.GameMode == BattleManager.GameModeType.Normal or BattleManager.GameMode == BattleManager.GameModeType.PVP then
        if StormViewModel.CurPointData.scrollID == 999999 then
            self.Btn_GiveUp01().gameObject:SetActive(false)
        else
            self.Btn_GiveUp01().gameObject:SetActive(true)
        end
    else
        self.Btn_GiveUp01().gameObject:SetActive(false)
    end
    if BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
        self.Btn_GiveUp01().gameObject:SetActive(true)
    end
    if  StormViewModel.CurPointType == 4 and BattleManager.GameMode ~= BattleManager.GameModeType.Guide then
        ---新手剧情关卡不允许退出
        self.Btn_GiveUp01().gameObject:SetActive(false)
    end
    if StormViewModel.CurPointType == StormViewModel.PointType.activityBoss then
        if StormViewModel.CurPointData.type == 103 then
            self.Btn_GiveUp01().gameObject:SetActive(true)
        else
            self.Btn_GiveUp01().gameObject:SetActive(false)
        end
    end
    if BattleManager.GameMode == BattleManager.GameModeType.MonthTower or
            BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or
            BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss or
            BattleManager.GameMode == BattleManager.GameModeType.ActivityBoss or
            BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP or
            BattleManager.GameMode == BattleManager.GameModeType.FriendPVP then
        self.Btn_ShowOrder().gameObject:SetActive(false)
    else
        self.Btn_ShowOrder().gameObject:SetActive(true)
    end
end
---关闭界面
function M:OnCloseSelf()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
    Event.Go("WorldBossHpClose",true)
end

---@param roleData RoleData
---@param role BattleRole
function M:ShowRoleInfo(roleData,role,teamdead)
    self.BuffIcon().gameObject:SetActive(false)
    ---战斗中数据
    local cProperties = role.myAni.roleData
    ---头像
    self.BattleRoleItem().gameObject:GetComponent("UITemplate"):SetData({roleData,self,role})
    ---名字
    self.Text_Name().text = roleData.name
    ---顺序
    self.Text_Order().text = role.AtkOrder - teamdead
    ---生命值
    local h = cProperties.HP
    if h < 0 then
        h = 0
    end
    self.Text_HP2().text = h .."/".. math.modf(cProperties.HPmax)
    local ratio = cProperties.HP/cProperties.HPmax
    if ratio < 0 then
        ratio = 0
    elseif ratio > 1 then
        ratio = 1
    end
    Tools.UIDoLocalScale(self.HPtiao().gameObject,1,ratio,0,0,0,0.5,0)
    ---护盾值
    self.Text_Shield2().text = cProperties.Shield_Value
    ratio = cProperties.Shield_Value/cProperties.HPmax
    if ratio < 0 then
        ratio = 0
    elseif ratio > 1 then
        ratio = 1
    end
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
    --UIEvent.LuaClick(self.Btn_Zuo().gameObject,function()
    --    local rData,nextRole,dead = self:FindNextRole(role,true)
    --    if rData then
    --        local uiFrom = MgrUI.GetCurUI()
    --        if uiFrom.Uid == UID.Battle02_UI then
    --            ---BattlePause_UI
    --            self:ShowRoleInfo(rData,nextRole,dead)
    --        end
    --    end
    --end)
    ---找出下一个
    --UIEvent.LuaClick(self.Btn_You().gameObject,function()
    --    local rData,nextRole,dead = self:FindNextRole(role,false)
    --    if rData then
    --        local uiFrom = MgrUI.GetCurUI()
    --        if uiFrom.Uid == UID.Battle02_UI then
    --            ---BattlePause_UI
    --            self:ShowRoleInfo(rData,nextRole,dead)
    --        end
    --    end
    --end)
    ---打开面板
    self.RoleInfoPanel().gameObject:SetActive(true)
end

function M:CellSkillPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.ChildSkillList[idx],self,self.CurRole,"Battle"})
end

function M:PlayAgain()
    if MgrSce.GetCurScene() == MgrSce.Scenes.Home then
        MgrUI.ClosePop(self.Uid)
    else
        MgrUI.ClosePop(self.Uid)
        StormViewModel.CurPointState = StormViewModel.PointState.fight  --重设战斗状态
        ---重新开始
        MgrBattle.GoFight(MgrBattle.fightType.normal,function()
            ---获取战斗支援角色
            FriendViewModel.GetBattleSupport()
        end ,StormViewModel.CurPointData.battleMap)
    end
end
--function M:FindNextRole(role,lastTOrNextF)
--    local nextRole = nil
--    local roleData = nil
--    local dead = 0
--    if role.IsLeft then
--        for i,v in ipairs(self.LeftRole) do     ---i == atkOrder
--            if v == role and ((lastTOrNextF and i ~= 1) or (not lastTOrNextF and i ~= #self.LeftRole)) then
--                if lastTOrNextF then
--                    nextRole = self.LeftRole[i - 1]
--                else
--                    nextRole = self.LeftRole[i + 1]
--                end
--                for j, r in ipairs(self.allRole) do
--                    if r.IsLeft then
--                        if r.Remove then
--                            dead = dead + 1
--                        end
--                    end
--                    if r == nextRole then
--                        break
--                    end
--                end
--            end
--        end
--        if nextRole == nil then
--            return nil,nil,nil
--        end
--    else
--        for i,v in ipairs(self.RightRole) do    ---找到现存的下一个role
--            if v == role and ((lastTOrNextF and i ~= 1) or (not lastTOrNextF and i ~= #self.RightRole)) then
--                if lastTOrNextF then
--                    nextRole = self.RightRole[i - 1]
--                else
--                    nextRole = self.RightRole[i + 1]
--                end
--                for j, r in ipairs(self.allRole) do     ---统计下一个角色前的死亡数
--                    if not r.IsLeft then
--                        if r.Remove then
--                            dead = dead + 1
--                        end
--                        if r == nextRole then
--                            break
--                        end
--                    end
--                end
--            end
--        end
--        if nextRole == nil then
--            return nil,nil,nil
--        end
--    end
--    if self.type == 1 then
--        roleData = nextRole.IsMonster == false and HeroControl.GetRoleDataByID(tonumber(nextRole.ID)) or StormViewModel.CurPointData:GetMonsterById(tonumber(nextRole.ID),nextRole.AtkOrder)
--    elseif self.type == 2 then
--        roleData = nextRole.IsMonster == false and HeroControl.GetRoleDataByID(tonumber(nextRole.ID)) or EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData
--    end
--    return roleData,nextRole,dead
--end

return M