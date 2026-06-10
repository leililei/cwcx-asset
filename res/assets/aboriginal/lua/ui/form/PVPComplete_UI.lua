-- Code Auto Create Begin
local M = Class('PVPComplete_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPComplete_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPComplete_UI].prefab'
    self.Name = 'Form[PVPComplete_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'ReturnBg','ReturnBg',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Zhuangshixian(jiesuan)2','Zhuangshixian(jiesuan)2',2},{'Zhuangshixian(xia)2','Zhuangshixian(xia)2',2},{'Zhuangshixian(shang)2','Zhuangshixian(shang)2',2},{'Btn_Confirm','Btn_Confirm',2},{'Img_Quedingdi','Btn_Confirm/Img_Quedingdi',2},{'Btn_Saodang','Btn_Saodang',2},{'Img_Saodangdi','Btn_Saodang/Img_Saodangdi',2},{'Btn_ReturnHome','Btn_ReturnHome',2},{'Img_Fanhuizhuyedi','Btn_ReturnHome/Img_Fanhuizhuyedi',2},{'Img_RewardTitle','Img_RewardTitle',2},{'PointGoodsItem','RewardsScroll/PointGoodsItem',2},{'Img_RoleTitle','Img_RoleTitle',2},{'RolePrefab','RolePrefab',2},{'Img_lihuidi','RolePrefab/Img_lihuidi',2},{'Img_Head','RolePrefab/Img_Head',2},{'Img_Juesemingdi','RolePrefab/Img_Juesemingdi',2},{'Img_Frame','RolePrefab/Img_Frame',2},{'Btn_CheckInfo','Btn_CheckInfo',2},{'Img_Chakanxiangqingdi','Btn_CheckInfo/Img_Chakanxiangqingdi',2},{'Img_Xiangqingicon','Btn_CheckInfo/Img_Xiangqingicon',2},{'Img_Huoshengfangshi','Img_Huoshengfangshi',2},{'Img_Dian','Img_Huoshengfangshi/Img_Dian',2},{'Img_Heidi','Img_Huoshengfangshi/Img_Heidi',2},{'Img_Fangshoudi','Def/Img_Fangshoudi',2},{'Img_Jinggongdi','Atk/Img_Jinggongdi',2},{'Img_Jifendi1','Score/Img_Jifendi1',2},{'Img_Add','Score/Img_Add',2},{'Img_Reduce','Score/Img_Reduce',2},{'Img_》','Score/Img_》',2},{'RankIcon','Score/RankIcon',2},{'Img_Dian01','FightResult/Img_Dian',2},{'Img_Heidi01','FightResult/Img_Heidi',2},{'Img_Yinying','FightResult/Img_Yinying',2},
        -- Text 列表
        {'Text_Saodang','Btn_Saodang/Text_Saodang',3},{'Text_Fanhuizhuye','Btn_ReturnHome/Text_Fanhuizhuye',3},
        -- UITemplate 列表
        {'PointGoodsItem01','RewardsScroll/PointGoodsItem',10},
        -- RawImage 列表
        {'RewardsScroll','RewardsScroll',15},{'RewardsContent','RewardsScroll/RewardsContent',15},{'RoleContent','RoleContent',15},
        -- LoopScrollRect 列表
        {'RewardsScroll01','RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Queding','Btn_Confirm/Text_Queding',20},{'Text_RewardTitle','Text_RewardTitle',20},{'Text_RoleTitle','Text_RoleTitle',20},{'Text_Name','RolePrefab/Text_Name',20},{'Text_Chakanxiangqing','Btn_CheckInfo/Text_Chakanxiangqing',20},{'Text_Huoshengfangshi','Img_Huoshengfangshi/Text_Huoshengfangshi',20},{'Text_Jibai','Img_Huoshengfangshi/Text_Jibai',20},{'Text_DefFailOrV','Def/Text_DefFailOrV',20},{'Text_DefName','Def/Text_DefName',20},{'Text_Fangshoufang','Def/Text_Fangshoufang',20},{'Text_VS','Text_VS',20},{'Text_Jinggongfang','Atk/Text_Jinggongfang',20},{'Text_AtkFailOrV','Atk/Text_AtkFailOrV',20},{'Text_AtkName','Atk/Text_AtkName',20},{'Text_Value','Score/Text_Value',20},{'Text_TargetScore','Score/Text_TargetScore',20},{'Text_CurScore','Score/Text_CurScore',20},{'Text_FightResult','FightResult/Text_FightResult',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---注册奖励滑块
    self:InitRewardsScroll()
    self.RolePrefab().gameObject:SetActive(false)
    --CJNBattleMgr.Instance.IsPause = true
    if MgrUI.GetCurUI().Uid ~= UID.PVPReady_UI then
        StormViewModel.HideRoleUI()
    end
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_CheckInfo().gameObject,function()
        MgrUI.Pop(UID.DamageTotalPop_UI,{PVPViewModel.PlayerIsAtk},true)
    end )
end

function M:OnShow(pData)
    MgrTimer.AddDelayNoName(0.1,function()
        MgrUI.ClosePop(UID.PVPPause_UI)
        MgrUI.ClosePop(UID.ConfirmPop_UI)
    end,nil)
    ---显示奖励
    ---设置当前Loop数据
    self.RewardsList = {}
    if pData.goods ~= nil then
        for i, v in pairs(pData.goods) do
            local data = {}
            data[1] = Global.GetLocalDataByGoods(v)
            data[2] = v.goodsNum
            data[3] = v.goodsType
            self.RewardsList[#self.RewardsList + 1] = data
        end
    end
    ---设置Loop数量
    self.RewardsScroll01().totalCount = #self.RewardsList
    self.RewardsScroll01():RefillCells(0)

    self.Text_AtkName().text = PVPViewModel.OwnInfo.name
    self.Text_DefName().text = PVPViewModel.TargetInfo.name

    ---刷新排位图标
    MgrRes.LoadSprite(self.RankIcon(),self:GetRankIcon(PVPViewModel.OwnInfo.score,PVPViewModel.OwnInfo.rank))

    for i, v in pairs(pData.RoleIDList) do
        local obj = GameObject.Instantiate(self.RolePrefab().gameObject,self.RoleContent().gameObject.transform,false)
        obj:SetActive(true)
        local name = obj.transform:Find("Text_Name"):GetComponent("TextMeshProUGUI")
        local Img_Head = obj.transform:Find("Img_Head"):GetComponent("Image")
        local Img_Frame = obj.transform:Find("Img_Frame"):GetComponent("Image")
        local role = HeroControl.GetRoleDataByID(v)
        ---设置名字
        name.text = role.name
        ---设置图标
        MgrRes.LoadNormalIcon(Img_Head,role.skin)
        ---设置图标
        MgrRes.LoadSprite(Img_Frame,role.iconFrame)
    end
    self.RolePrefab().gameObject:SetActive(false)
    if BattleManager.PvPModelWinOrLose then
        self.Text_AtkFailOrV().text = MgrLanguageData.GetLanguageByKey("pvpcomplete_ui_victory")
        self.Text_DefFailOrV().text = MgrLanguageData.GetLanguageByKey("pvpcomplete_ui_fail")
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("novicecomplete_ui_victory")
        MgrSound.PlayBGM("Battle-win",1,nil,true)
    else
        self.Text_AtkFailOrV().text = MgrLanguageData.GetLanguageByKey("pvpcomplete_ui_fail")
        self.Text_DefFailOrV().text = MgrLanguageData.GetLanguageByKey("pvpcomplete_ui_victory")
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("pvpcomplete_ui_battlefail")
        MgrSound.PlayBGM("Battle-lose",1,nil,true)
    end

    if pData.aScore > 0 then
        self.Img_Reduce().gameObject:SetActive(false)
        self.Img_Add().gameObject:SetActive(true)
        self.Text_Value().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips10"),pData.aScore)
    else
        self.Img_Reduce().gameObject:SetActive(true)
        self.Img_Add().gameObject:SetActive(false)
        self.Text_Value().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips11"),pData.aScore)
    end
    self.Text_CurScore().text = PVPViewModel.OwnInfo.score
    local value = PVPViewModel.OwnInfo.score + pData.aScore
    if value < 1000 then
        self.Text_TargetScore().text = 1000
    else
        self.Text_TargetScore().text = PVPViewModel.OwnInfo.score + pData.aScore
    end
    ---点击确定
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        ---显示结算面板
        if MgrUI.GetCurUI().Uid == UID.PVPReady_UI then
            MgrUI.ClosePop(UID.PVPComplete_UI)
        else
            PVPViewModel.GetPvPData(PVPViewModel.type,true,function()
                MgrUI.ClosePop(UID.PVPComplete_UI)
            end)
            ---在连续战斗中则结束连续战斗
            if PVPViewModel.continue and PVPViewModel.continueCount > 0 then
                PVPViewModel.continue = false
                PVPViewModel.continueCount = 0
                PVPViewModel.continueACK = nil
                PVPViewModel.continueNTF = nil
            end
        end
    end)
    -----返回主页
    --UIEvent.LuaClick(self.Btn_ReturnHome().gameObject,function()
    --    BattleManager.ClearLuaData()
    --    MgrUI.ClosePop(UID.PVPComplete_UI)
    --    MgrUI.GoClose(UID.Home_UI)
    --end)
    ---箭头闪烁
    self:ArrowFlash()

    ---在连续战斗中则结束连续战斗
    if PVPViewModel.continue and PVPViewModel.continueCount > 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpcomplete_ui_nextbattle"),3},true)
    end

    MgrTimer.AddDelayNoName(3,function()
        ---如果在连续战斗
        if PVPViewModel.continue and PVPViewModel.continueCount > 0 then
            MgrUI.ClosePop(UID.PVPComplete_UI)
            local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
            MgrBattle.GoFight(MgrBattle.fightType.pvp,nil,rankData[15])
            --PVPViewModel.StartContinuousPVP()
        end
    end,nil)

    ---记录分数，并注册
    PVPViewModel.PVPPreviousScore = PVPViewModel.OwnInfo.score
    PVPViewModel.PVPNewScore = PVPViewModel.OwnInfo.score + pData.aScore
    PVPViewModel.PVPPreviousRank = PVPViewModel.OwnInfo.rank
    PVPViewModel.PVPNewRank = pData.aRank
    PVPViewModel.PVPPreviousRank = PVPViewModel.RankLevel
    --Event.Add("PlayerRankUpPop",PVPViewModel.PlayerRankUpPop)
end

function M:InitRewardsScroll()
    self.RewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardsCellItem))
end
---奖励滑块回调
function M:RewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
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

function M:OnClose()
    BattleManager.ClearLuaData()
    MgrTimer.Cancel("ArrowFlash")
    MgrTimer.Cancel("ArrowFlashH")
    MgrTimer.Cancel("ArrowFlashL")
    BattleViewModel.DamageTotal = {}
    PVPViewModel.AllRole = {}
end

---获取排位图标
function M:GetRankIcon(score,rank)
    --local rankData = PVPViewModel.GetPvPRank(score,rank)
    local tab = SeniorPVPLocalData.tab
    local rankData = tab[#tab + 1 - PVPViewModel.RankLevel]
    return "Level/".. rankData[3]
end
function M:OnBackKey()
    local tab = {"PVPPause_UI","PVPComplete_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        ---显示结算面板
        if MgrUI.GetCurUI().Uid == UID.PVPReady_UI then
            MgrUI.ClosePop(UID.PVPComplete_UI)
        else
            PVPViewModel.GetPvPData(PVPViewModel.type,true,function()
                MgrUI.ClosePop(UID.PVPComplete_UI)
            end)
            ---在连续战斗中则结束连续战斗
            if PVPViewModel.continue and PVPViewModel.continueCount > 0 then
                PVPViewModel.continue = false
                PVPViewModel.continueCount = 0
                PVPViewModel.continueACK = nil
                PVPViewModel.continueNTF = nil
            end
        end
    end
end
return M