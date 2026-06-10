-- Code Auto Create Begin
local M = Class('PVEMainComplete_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVEMainComplete_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVEMainComplete_UI].prefab'
    self.Name = 'Form[PVEMainComplete_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 0
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','Ani/BlurMask',2},{'Win','Ani/Win',2},{'Img_Tanchuangdi','Ani/Win/Img_Tanchuangdi',2},{'Btns','Ani/Win/Img_Tanchuangdi/Btns',2},{'Img_Saodangdi','Ani/Win/Img_Tanchuangdi/Btns/Btn_BackHome_Win/Img_Saodangdi',2},{'SweepSuo','Ani/Win/Img_Tanchuangdi/Btns/Btn_BackHome_Win/Btn_Content/SweepSuo',2},{'Img_Text_Xiagequyudi','Ani/Win/Img_Tanchuangdi/Btns/Btn_Next/Img_Text_Xiagequyudi',2},{'jingyantiao','Ani/Win/jingyantiao',2},{'Img_SilderAdd','Ani/Win/jingyantiao/Img_SilderAdd',2},{'Img_Silder','Ani/Win/jingyantiao/Img_Silder',2},{'Img_Sanjiao','Ani/Win/Text_OffsetExp/Img_Sanjiao',2},{'Img_LVdi','Ani/Win/Img_LVdi',2},{'Img_Huoshengfangshi','Ani/Win/Img_Huoshengfangshi',2},{'Img_Dian','Ani/Win/Img_Huoshengfangshi/Img_Dian',2},{'Img_Heidi','Ani/Win/Img_Huoshengfangshi/Img_Heidi',2},{'Img_StarTask1','Ani/Win/Img_StarTask1',2},{'Img_Tiaojian(hui)','Ani/Win/Img_StarTask1/Img_Tiaojian(hui)',2},{'StarTaskHL1','Ani/Win/Img_StarTask1/StarTaskHL1',2},{'Img_StarTask2','Ani/Win/Img_StarTask2',2},{'Img_Tiaojian(hui)01','Ani/Win/Img_StarTask2/Img_Tiaojian(hui)',2},{'StarTaskHL2','Ani/Win/Img_StarTask2/StarTaskHL2',2},{'Img_StarTask3','Ani/Win/Img_StarTask3',2},{'Img_Tiaojian(hui)02','Ani/Win/Img_StarTask3/Img_Tiaojian(hui)',2},{'StarTaskHL3','Ani/Win/Img_StarTask3/StarTaskHL3',2},{'Btn_OpenInfo','Ani/Win/Btn_OpenInfo',2},{'Img_Chakanxiangqingdi','Ani/Win/Btn_OpenInfo/Img_Chakanxiangqingdi',2},{'Img_Xiangqingicon','Ani/Win/Btn_OpenInfo/Img_Xiangqingicon',2},{'Img_RoleTitle','Ani/Win/Img_RoleTitle',2},{'Img_RewardTitle','Ani/Win/Img_RewardTitle',2},{'VFXMask','Ani/Win/VFXMask',2},{'PointGoodsItem','Ani/Win/VFXMask/RewardsScroll/PointGoodsItem',2},{'Zhuangshixian(jiesuan)2','Ani/Win/Zhuangshixian(jiesuan)2',2},{'Zhuangshixian(xia)2','Ani/Win/Zhuangshixian(xia)2',2},{'Zhuangshixian(shang)2','Ani/Win/Zhuangshixian(shang)2',2},{'Img_Dian01','Ani/Win/FightResult/Img_Dian',2},{'Img_Heidi01','Ani/Win/FightResult/Img_Heidi',2},{'Lose','Ani/Lose',2},{'Img_Tanchuangdi01','Ani/Lose/Img_Tanchuangdi',2},{'Btns01','Ani/Lose/Img_Tanchuangdi/Btns',2},{'Img_Fanhuizhuyedi','Ani/Lose/Img_Tanchuangdi/Btns/Btn_BackHome_Lose/Img_Fanhuizhuyedi',2},{'Img_Text_Xiagequyudi01','Ani/Lose/Img_Tanchuangdi/Btns/Btn_BattleAgain/Img_Text_Xiagequyudi',2},{'Img_Lihui','Ani/Lose/Img_Tanchuangdi/Img_Lihui',2},{'Img_RewardTitle01','Ani/Lose/Img_RewardTitle',2},{'VFXMask01','Ani/Lose/VFXMask',2},{'PointGoodsItem01','Ani/Lose/VFXMask/RewardsScroll/PointGoodsItem',2},{'Zhuangshixian(jiesuan)201','Ani/Lose/Zhuangshixian(jiesuan)2',2},{'Zhuangshixian(xia)201','Ani/Lose/Zhuangshixian(xia)2',2},{'Zhuangshixian(shang)201','Ani/Lose/Zhuangshixian(shang)2',2},{'Img_Dian02','Ani/Lose/FightResult/Img_Dian',2},{'Img_Heidi02','Ani/Lose/FightResult/Img_Heidi',2},{'zhezhao_hong','Ani/Lose/zhezhao_hong',2},
        -- Button 列表
        {'Btn_BackHome_Win','Ani/Win/Img_Tanchuangdi/Btns/Btn_BackHome_Win',4},{'Btn_BattleAgain','Ani/Lose/Img_Tanchuangdi/Btns/Btn_BattleAgain',4},
        -- UITemplate 列表
        {'AccountRoleItem','Ani/Win/AccountRoleItem',10},{'PointGoodsItem02','Ani/Win/VFXMask/RewardsScroll/PointGoodsItem',10},{'PointGoodsItem03','Ani/Lose/VFXMask/RewardsScroll/PointGoodsItem',10},
        -- RawImage 列表
        {'Btn_Next','Ani/Win/Img_Tanchuangdi/Btns/Btn_Next',15},{'RoleContent','Ani/Win/RoleContent',15},{'RewardsScroll','Ani/Win/VFXMask/RewardsScroll',15},{'RewardsContent','Ani/Win/VFXMask/RewardsScroll/RewardsContent',15},{'Btn_BackHome_Lose','Ani/Lose/Img_Tanchuangdi/Btns/Btn_BackHome_Lose',15},{'Btn_BattleAgain01','Ani/Lose/Img_Tanchuangdi/Btns/Btn_BattleAgain',15},{'RewardsScroll01','Ani/Lose/VFXMask/RewardsScroll',15},{'RewardsContent01','Ani/Lose/VFXMask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'RewardsScroll02','Ani/Win/VFXMask/RewardsScroll',18},{'RewardsScroll03','Ani/Lose/VFXMask/RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Saodang','Ani/Win/Img_Tanchuangdi/Btns/Btn_BackHome_Win/Btn_Content/Text_Saodang',20},{'Text_Fanhui','Ani/Win/Img_Tanchuangdi/Btns/Btn_Next/Text_Fanhui',20},{'Text_OffsetExp','Ani/Win/Text_OffsetExp',20},{'Text_EXP','Ani/Win/Text_EXP',20},{'Text_pLevel','Ani/Win/Img_LVdi/Text_pLevel',20},{'Text_Title','Ani/Win/Text_Title',20},{'Text_Name','Ani/Win/Text_Name',20},{'Text_Huoshengfangshi','Ani/Win/Img_Huoshengfangshi/Text_Huoshengfangshi',20},{'Text_Jibai','Ani/Win/Img_Huoshengfangshi/Text_Jibai',20},{'Text_StarTask1','Ani/Win/Img_StarTask1/Text_StarTask1',20},{'Text_StarTask2','Ani/Win/Img_StarTask2/Text_StarTask2',20},{'Text_StarTask3','Ani/Win/Img_StarTask3/Text_StarTask3',20},{'Text_Chakanxiangqing','Ani/Win/Btn_OpenInfo/Text_Chakanxiangqing',20},{'Text_Juesechengzhang','Ani/Win/Img_RoleTitle/Text_Juesechengzhang',20},{'Text_Zhandoujiangli','Ani/Win/Img_RewardTitle/Text_Zhandoujiangli',20},{'Text_FightResult','Ani/Win/FightResult/Text_FightResult',20},{'Text_Fanhuizhuye','Ani/Lose/Img_Tanchuangdi/Btns/Btn_BackHome_Lose/Text_Fanhuizhuye',20},{'Text_Xiagequyu','Ani/Lose/Img_Tanchuangdi/Btns/Btn_BattleAgain/Text_Xiagequyu',20},{'Text_Title01','Ani/Lose/Text_Title',20},{'Text_Name01','Ani/Lose/Text_Name',20},{'Text_Tishi1','Ani/Lose/Text_Tishi1',20},{'Text_Tishi2','Ani/Lose/Text_Tishi2',20},{'Text_Tishi3','Ani/Lose/Text_Tishi3',20},{'Text_Zhandoujiangli01','Ani/Lose/Img_RewardTitle/Text_Zhandoujiangli',20},{'Text_FightResult01','Ani/Lose/FightResult/Text_FightResult',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---注册奖励滑块
    self:InitRewardsScroll()
    ---战斗界面存在时隐藏战斗界面节点
    local ui = MgrUI.GetCurUI()
    if ui.Uid == UID.WorldBossBattle_UI then
        ui.Panel_Fighting().gameObject:SetActive(false)
        ui.Panel_PointInfo().gameObject:SetActive(false)
    end
    if ui.Uid == UID.Battle02_UI then
        ui.Panel_Fighting().gameObject:SetActive(false)
    end
    StormViewModel.HideRoleUI()
    UIEvent.LuaClick(self.Btn_OpenInfo().gameObject,function()
        MgrUI.Pop(UID.DamageTotalPop_UI,{true},true)
    end)
end

---参数1：PBClient.ClientSetLevelStarNTF 参数2：玩家经验提升数值 参数3：角色经验提升数值表.data角色数据.offset提升数值
function M:OnShow(pData)
    MgrTimer.AddDelayNoName(0.1,function()
        MgrUI.ClosePop(UID.BattlePause_UI)
        MgrUI.ClosePop(UID.ConfirmPop_UI)
    end,nil)
    self.pData = pData[1]
    self.offsetExp = pData[2]
    self.offsetExpList = pData[3]
    self.Img_RewardTitle01().gameObject:SetActive(not pData[4])
    ---获取玩家数据
    local player = PlayerControl.GetPlayerData()
    ---检查是否有引导
    NoviceViewModel.ForceGuide(NoviceViewModel.CheckForce())
    ---如果升级
    if player.isLevelUp then
        MgrUI.Pop(UID.PlayerLevelUp_UI,{player.vigor,player.level,player.exp},true)
        PlayerControl.PushLevelUpState(false)
    end
    ---获取关卡数据
    local pointData = StormControl.GetStormPointByID(self.pData.levelID)
    local scrollData = StormControl.GetStormScrollById(pointData.scrollID)
    ---当前关卡赋值
    StormViewModel.CurPointData = pointData
    ---当前卷赋值
    if StormViewModel.CurLevelType == 0 then
        StormViewModel.CurScrollData = scrollData
    else
        StormViewModel.CurHardScrollData = scrollData
    end

    ---显示奖励
    ---设置当前Loop数据
    self.RewardsList = {}
    if self.pData.reward ~= nil then
        for i, v in pairs(self.pData.reward) do
            local data = {}
            data[1] = Global.GetLocalDataByGoods(v)
            data[2] = v.goodsNum
            data[3] = v.goodsType
            self.RewardsList[#self.RewardsList + 1] = data
        end
    end

    table.sort(self.RewardsList, function(a,b)
        return a[1].quality > b[1].quality
    end)
    ---更新挑战显示
    if BattleRoleData.Bool_Pass == true then
        self.Win().gameObject:SetActive(true)
        self.Lose().gameObject:SetActive(false)
        MgrSound.PlayBGM("Battle-win",0.2,nil,true)
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("novicecomplete_ui_victory")

        ---是否有提升
        self.Img_Sanjiao().gameObject:SetActive(self.offsetExp > 0)

        self.Img_Silder().fillAmount = (player.exp - self.offsetExp)/PlayerControl.GetMaxExpByLevel(player.level)
        ---显示经验文本动画
        local str = ""
        if self.offsetExp < 0 then
            ---经验滑动条显示
            Tools.SetImgFillRate(self.Img_Silder().gameObject,0.99)
            str = MgrLanguageData.GetLanguageByKey("ui_tips_3")
        else
            str = string.format("+%s",self.offsetExp)
        end
        ---增加的经验滑动条
        MgrTimer.AddDelay("PCExpAdd",1,function()
            if self.offsetExp < 0 then
                self.Img_Silder().fillAmount = 0
            end
            Tools.SetImgFillRate(self.Img_SilderAdd().gameObject,player.exp/PlayerControl.GetMaxExpByLevel(player.level))
        end,nil)
        self.Text_OffsetExp().text = str
        self.Text_EXP().text = string.format("<color=#8D8D8D>%s</color> %s/%s",MgrLanguageData.GetLanguageByKey("ui_tips_2"),player.exp,PlayerControl.GetMaxExpByLevel(player.level))
        self.Text_pLevel().text = string.format("<color=#FFC24C>%s</color> %s",MgrLanguageData.GetLanguageByKey("ui_tips_1"),player.level)
        ---更新关卡名
        if pointData.type == StormViewModel.PointBattleType.LOGIC_BATTLE or pointData.type == StormViewModel.PointBattleType.LOGIC_BOSS then
            self.Text_Title().text = ""
            self.Text_Name().text = ""
        elseif StormViewModel.CurPointData.type >= StormViewModel.PointBattleType.ACTIVITY_NEWBOSS and StormViewModel.CurPointData.type <= StormViewModel.PointBattleType.ACTIVITY_SEAT then
            self.Text_Title().text = ""
            self.Text_Name().transform.sizeDelta = Vector2(750, 100)
            self.Text_Name().text = pointData.name
        else
            self.Text_Title().text = pointData.idxName
            self.Text_Name().text = pointData.name
        end
        ---获取关卡条件
        local cond = string.split(StormViewModel.CurPointData.condition,",")
        if StormViewModel.CurPointData.condition == "0" then
            cond = {
                [1] = "0_0",
                [2] = "0_0",
            }
        end
        local s1 = self.pData.levelStar > 0
        local s2 = (self.pData.levelStar == 2 or self.pData.levelStar == 3 or self.pData.levelStar == 6 or self.pData.levelStar == 7)
        local s3 = (self.pData.levelStar == 4 or self.pData.levelStar == 5 or self.pData.levelStar == 6 or self.pData.levelStar == 7)
        ---更新关卡条件状态
        self.Text_StarTask1().text = TermdescLocalData.tab[tonumber(string.split(cond[1],"_")[3])][2]  --(s1 and MgrLanguageData.GetLanguageByKey("battle_ui_completelevel") or MgrLanguageData.GetLanguageByKey("pvecomplete_ui_completelevel"))
        self.Text_StarTask2().text = TermdescLocalData.tab[tonumber(string.split(cond[2],"_")[3])][2] --(s2 and string.split(cond[1],"_")[2]..MgrLanguageData.GetLanguageByKey("battle_ui_passround") or "<color=#898989>"..string.split(cond[1],"_")[2]..MgrLanguageData.GetLanguageByKey("battle_ui_passround").."</color>")
        self.Text_StarTask3().text = TermdescLocalData.tab[tonumber(string.split(cond[3],"_")[3])][2] --(s3 and MgrLanguageData.GetLanguageByKey("battle_ui_walkoff")..string.split(cond[2],"_")[2]..MgrLanguageData.GetLanguageByKey("eventbosspop_ui_tips1") or "<color=#898989>"..MgrLanguageData.GetLanguageByKey("battle_ui_walkoff")..string.split(cond[2],"_")[2]..MgrLanguageData.GetLanguageByKey("eventbosspop_ui_tips1").."</color>")
        self.StarTaskHL1().gameObject:SetActive(s1)
        self.StarTaskHL2().gameObject:SetActive(s2)
        self.StarTaskHL3().gameObject:SetActive(s3)
        ---补全未获得经验的角色
        local teamData = TeamControl.GetTeamData(0)
        if StormViewModel.CurPointData:CheckGuide() then
        else
            ---普通关
            for i, v in pairs(teamData.info) do
                local isHive = false
                for _, v1 in pairs(self.offsetExpList) do
                    if v1.data.id == v.roleID then
                        isHive = true
                    end
                end
                if isHive == false then
                    self.offsetExpList[#self.offsetExpList + 1] = {
                        data = HeroControl.GetRoleDataByID(v.roleID),
                        offset = 0,
                    }
                end
            end
        end
        ---创建角色经验信息
        local tRoleData = {}
        local tHeroInfoLen = 0
        if self.offsetExpList ~= nil then
            for i, v in pairs(self.offsetExpList) do
                local tCurLv = 0
                local tCurGotExp = 0
                if self.pData.heroInfos ~= nil and tHeroInfoLen < #self.pData.heroInfos then
                    for k, v1 in pairs(self.pData.heroInfos) do
                        if v1.heroID == v.data.id then
                            tCurLv = v1.heroLevel
                            tCurGotExp = v1.heroExp

                            tHeroInfoLen = tHeroInfoLen + 1
                        end
                    end
                end
                table.insert(tRoleData,{v.data,v.offset,tCurLv,tCurGotExp})
            end
        end
        ---头像跳动的三角
        self.Img_Ups = {self.Img_Sanjiao()}
        if #tRoleData ~= 0 then
            for i, v in pairs(tRoleData) do
                ---创建角色头像
                local uiTp = GameObject.Instantiate(self.AccountRoleItem(),self.RoleContent().transform,false)
                uiTp:SetData({v[1],v[2],v[3],v[4]})
                table.insert(self.Img_Ups,uiTp.transform:Find("Text_UpLevel"):Find("Img_Up"))
            end
        end

        if self.pData.heroInfos ~= nil then
            for i, v in pairs(self.pData.heroInfos) do
                ---更新经验
                HeroControl.GetRoleDataByID(v.heroID):PushHeroExp(v.heroExp)
                ---更新经验
                HeroControl.GetRoleDataByID(v.heroID):PushHeroLevel(v.heroLevel)
            end
        end
        ---清除我方上阵的列表中助战角色
        TeamControl.ClearFriendRole()
        ---设置Loop数量
        self.RewardsScroll02().totalCount = #self.RewardsList
        self.RewardsScroll02():RefillCells(0)
        ---扫荡点击事件
        UIEvent.LuaClick(self.Btn_BackHome_Win().gameObject, function()
            Event.Remove("BackKey", Handle(self, self.OnBackKey))
            BattleManager.CurActivityBossHp = 0
            if MgrSce.GetCurScene() == MgrSce.Scenes.Home then
                MgrUI.ClosePop(self.Uid)
            else
                ---返回选关
                MgrUI.ClosePop(self.Uid)
                MgrBattle.CloseFight()
            end
        end)
    else
        self.Win().gameObject:SetActive(false)
        self.Lose().gameObject:SetActive(true)
        MgrSound.PlayBGM("Battle-lose",0.2,nil,true)
        self.Text_FightResult01().text = MgrLanguageData.GetLanguageByKey("novicecomplete_ui_fail")
        ---更新关卡名
        if pointData.type == StormViewModel.PointBattleType.LOGIC_BATTLE or pointData.type == StormViewModel.PointBattleType.LOGIC_BOSS then
            self.Text_Title01().text = ""
            self.Text_Name01().text = ""
        elseif StormViewModel.CurPointData.type >= StormViewModel.PointBattleType.ACTIVITY_NEWBOSS and StormViewModel.CurPointData.type <= StormViewModel.PointBattleType.ACTIVITY_SEAT then
            self.Text_Title01().text = ""
            self.Text_Name01().transform.sizeDelta = Vector2(750, 100)
            self.Text_Name01().text = pointData.name
        else
            self.Text_Title01().text = pointData.idxName
            self.Text_Name01().text = pointData.name
        end
        ---设置Loop数量
        self.RewardsScroll03().totalCount = #self.RewardsList
        self.RewardsScroll03():RefillCells(0)
        --self.Btn_BattleAgain().gameObject:SetActive(false)
        UIEvent.LuaClick(self.Btn_BattleAgain().gameObject, function()
            BattleManager.BattleAgain = true
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
        end)
    end
    ---箭头跳动
    --self:SanjiaoJump()
    ---详情箭头闪烁
    --self:ArrowFlash()
    ---显示添加好友界面
    self:PopAddFriendUI()
    local data = StormViewModel.CurPointData
    self.Btn_Next().gameObject:SetActive(data.o_fronts ~= "0")
    ---返回主页点击事件
    UIEvent.LuaClick(self.Btn_Next().gameObject, function()
        StormViewModel.GetNextPointInfo()
        StormViewModel.CheckPointState()
    end)
    UIEvent.LuaClick(self.Btn_BackHome_Lose().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        BattleManager.CurActivityBossHp = 0
        if MgrSce.GetCurScene() == MgrSce.Scenes.Home then
            MgrUI.ClosePop(self.Uid)
        else
            ---返回选关
            MgrUI.ClosePop(self.Uid)
            MgrBattle.CloseFight()
        end

    end)
end
function M:OnBackKey()
    local tab = {"BattlePause_UI","PVEComplete_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        BattleManager.CurActivityBossHp = 0
        if MgrSce.GetCurScene() == MgrSce.Scenes.Home then
            MgrUI.ClosePop(self.Uid)
        else
            ---返回选关
            MgrUI.ClosePop(self.Uid)
            MgrBattle.CloseFight()
        end
    end
end
function M:InitRewardsScroll()
    self.RewardsScroll02():SetLuaCellEvent(Handle(self,self.RewardsCellItem))
    self.RewardsScroll03():SetLuaCellEvent(Handle(self,self.RewardsCellItem))
end
---奖励滑块回调
function M:RewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
end

---箭头跳动效果
function M:SanjiaoJump()
    self.JumpTime = 0
    MgrTimer.AddRepeat("SanjiaoJump",0.03,function()
        if self.JumpTime <= 0 then
            MgrTimer.Cancel("SanjiaoDown")
            MgrTimer.AddRepeat("SanjiaoUp",0.03,function()
                self.JumpTime = self.JumpTime + 0.05
                for i,v in pairs(self.Img_Ups) do
                    v.transform.localPosition = Vector3(v.transform.localPosition.x,v.transform.localPosition.y + 1,0)
                end
            end,6,self.Img_Sanjiao().gameObject)
        elseif self.JumpTime >= 0.25 then
            MgrTimer.Cancel("SanjiaoUp")
            MgrTimer.AddRepeat("SanjiaoDown",0.03,function()
                self.JumpTime = self.JumpTime - 0.05
                for i,v in pairs(self.Img_Ups) do
                    v.transform.localPosition = Vector3(v.transform.localPosition.x,v.transform.localPosition.y - 1,0)
                end
            end,6,self.Img_Sanjiao().gameObject)
        end
    end,-1,self.Img_Sanjiao().gameObject)
end

---查看详情箭头闪烁
function M:ArrowFlash()
    self.Img_Xiangqingicon().color = Color(self.Img_Xiangqingicon().color.r,self.Img_Xiangqingicon().color.g,self.Img_Xiangqingicon().color.b,0)
    MgrTimer.AddRepeat("ArrowFlash",0.5,function()
        if self.Img_Xiangqingicon().color.a < 0.1 then
            MgrTimer.Cancel("ArrowFlashL")
            MgrTimer.AddRepeat("ArrowFlashH",0.05,function()
                self.Img_Xiangqingicon().color = Color(self.Img_Xiangqingicon().color.r,self.Img_Xiangqingicon().color.g,self.Img_Xiangqingicon().color.b,self.Img_Xiangqingicon().color.a + 0.10)
            end,10,nil)
        elseif self.Img_Xiangqingicon().color.a > 0.9 then
            MgrTimer.Cancel("ArrowFlashH")
            MgrTimer.AddRepeat("ArrowFlashL",0.05,function()
                self.Img_Xiangqingicon().color = Color(self.Img_Xiangqingicon().color.r,self.Img_Xiangqingicon().color.g,self.Img_Xiangqingicon().color.b,self.Img_Xiangqingicon().color.a - 0.10)
            end,10,nil)
        end
    end,5,nil)
end

---是否pop添加好友UI
function M:PopAddFriendUI()
    if #FriendViewModel.StrangersData ~= 0 then
        ---发送好友搜素请求
        FriendViewModel.FriendSearchREQ(FriendViewModel.StrangersData[1],Handle(self,self.FriendSearchACK),Handle(self,self.FriendSearchNTF))
        self.Btns().gameObject:SetActive(false)
        MgrTimer.AddDelayNoName(1,function()
            self.Btns().gameObject:SetActive(true)
        end,self.ObjRoot)
    end
end

---搜索好友回调
function M:FriendSearchACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSearchACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
    end
end
function M:FriendSearchNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSearchNTF',buffer))
    print(tab)
    if(tab.friends) then
        FriendViewModel.RemoveStrangersData(tab.friends[1])
        MgrUI.Pop(UID.AddFriendPop_UI,{tab.friends},true)
    end
end
---重开
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

function M:OnClose()
    BattleManager.ClearLuaData()
    BattleManager.CurActivityBossPointInfo = nil
    MgrTimer.Cancel("PCExpAdd")
    MgrTimer.Cancel("SanjiaoJump")
    MgrTimer.Cancel("SanjiaoUp")
    MgrTimer.Cancel("SanjiaoDown")
    MgrTimer.Cancel("ArrowFlash")
    MgrTimer.Cancel("ArrowFlashH")
    MgrTimer.Cancel("ArrowFlashL")
    BattleViewModel.DamageTotal = {}
    BattleViewModel.PveReturn = true
end

return M