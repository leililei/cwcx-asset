-- Code Auto Create Begin
local M = Class('RecordComplete_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RecordComplete_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RecordComplete_UI].prefab'
    self.Name = 'Form[RecordComplete_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Blurbg','Blurbg',2},{'Btn_Confirm','Btn_Confirm',2},{'Img_Quedingdi','Btn_Confirm/Img_Quedingdi',2},{'Btn_BackHome','Btn_BackHome',2},{'Img_Fanhuizhuyedi','Btn_BackHome/Img_Fanhuizhuyedi',2},{'Img_bg','Img_bg',2},{'Btn_CheckInfo','Btn_CheckInfo',2},{'Img_Chakanxiangqingdi','Btn_CheckInfo/Img_Chakanxiangqingdi',2},{'Img_Xiangqingicon','Btn_CheckInfo/Img_Xiangqingicon',2},{'DefNormal','DefPanel/DefNormal',2},{'DefRankIcon','DefPanel/DefNormal/DefRankIcon',2},{'Img_Changebg','DefPanel/DefNormal/Img_Changebg',2},{'DefMulti','DefPanel/DefMulti',2},{'Img_Fangshoudi1','DefPanel/Img_Fangshoudi1',2},{'AtkNormal','AtkPanel/AtkNormal',2},{'AtkRankIcon','AtkPanel/AtkNormal/AtkRankIcon',2},{'Img_Changebg01','AtkPanel/AtkNormal/Img_Changebg',2},{'AtkMulti','AtkPanel/AtkMulti',2},{'Img_bg01','AtkPanel/Img_bg',2},{'Img_Dian','Title/Img_Dian',2},{'Img_Heidi','Title/Img_Heidi',2},{'Img_Yinying','Title/Img_Yinying',2},
        -- Text 列表
        {'Text_Fanhuizhuye','Btn_BackHome/Text_Fanhuizhuye',3},{'Text_DefResult','DefPanel/Text_DefResult',3},{'Text_DefName','DefPanel/Text_DefName',3},{'Text_Fangshoufang1','DefPanel/Text_Fangshoufang1',3},{'Text_VS','Text_VS',3},
        -- TextMeshProUGUI 列表
        {'Text_Queding','Btn_Confirm/Text_Queding',20},{'Text_Chakanxiangqing','Btn_CheckInfo/Text_Chakanxiangqing',20},{'Text_DefScore','DefPanel/DefNormal/Text_DefScore',20},{'Text_DefRank','DefPanel/DefNormal/Text_DefRank',20},{'Text_DefChangeSore','DefPanel/DefNormal/Img_Changebg/Text_DefChangeSore',20},{'TextDefScoreEx','DefPanel/DefMulti/TextDefScoreEx',20},{'Text_AtkScore','AtkPanel/AtkNormal/Text_AtkScore',20},{'Text_AtkRank','AtkPanel/AtkNormal/Text_AtkRank',20},{'Text_AtkChangeSore','AtkPanel/AtkNormal/Img_Changebg/Text_AtkChangeSore',20},{'TextAtkScoreEx','AtkPanel/AtkMulti/TextAtkScoreEx',20},{'Text_AtkResult','AtkPanel/Text_AtkResult',20},{'Text_AtkName','AtkPanel/Text_AtkName',20},{'Text_Jinggongfang1','AtkPanel/Text_Jinggongfang1',20},{'Text_Huifangjieshu','Title/Text_Huifangjieshu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---点击确定
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        if PVPViewModel.IsViewRecord then
            --PVPViewModel.IsViewRecord = false
            MgrUI.ClosePop(self.Uid)
            local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
            MgrBattle.GoFight(MgrBattle.fightType.pvp,nil,rankData[15])
        else
            PVPViewModel.GetPvPData(PVPViewModel.type,true)
        end
    end)
    UIEvent.LuaClick(self.Btn_CheckInfo().gameObject,function()
        MgrUI.Pop(UID.DamageTotalPop_UI,{PVPViewModel.PlayerIsAtk},true)
    end)

    ---点击返回主页
    --UIEvent.LuaClick(self.Btn_BackHome().gameObject,function()
    --    PVPViewModel.IsViewRecord = false
    --    MgrUI.ClosePop(self.Uid)
    --    MgrBattle.CloseFight(true)
    --end)
end

function M:OnShow(pData)
    if PVPViewModel.GetViewRecordsCount() > 1 then
        self.AtkNormal().gameObject:SetActive(false);
        self.DefNormal().gameObject:SetActive(false);
        self.AtkMulti().gameObject:SetActive(true);
        self.DefMulti().gameObject:SetActive(true);
    else
        self.AtkNormal().gameObject:SetActive(true);
        self.DefNormal().gameObject:SetActive(true);
        self.AtkMulti().gameObject:SetActive(false);
        self.DefMulti().gameObject:SetActive(false);
    end
    if PVPViewModel.PlayerIsAtk then
        self.Text_AtkName().text = PVPViewModel.OwnInfo.name
        self.Text_DefName().text = PVPViewModel.TargetInfo.name
        if PVPViewModel.RecordResult.result == 2 then
            MgrSound.PlayBGM("Battle-win",1,nil,false)
            self.Text_AtkResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_victory")
            self.Text_DefResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_fail")
        else
            MgrSound.PlayBGM("Battle-lose",1,nil,false)
            self.Text_AtkResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_fail")
            self.Text_DefResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_victory")
        end
        if PVPViewModel.GetViewRecordsCount() > 1 then
            self.TextAtkScoreEx().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.OwnInfo.score;
            self.TextDefScoreEx().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.TargetInfo.score;
        else
            self.Text_AtkRank().text = PVPViewModel.GetPvPRank(PVPViewModel.OwnInfo.rankLevel)[2]
            self.Text_AtkScore().text = PVPViewModel.OwnInfo.score
            self.Text_DefRank().text = PVPViewModel.GetPvPRank(PVPViewModel.TargetInfo.rankLevel)[2]
            self.Text_DefScore().text = PVPViewModel.TargetInfo.score
            if PVPViewModel.RecordResult.result == 2 then
                self.Text_AtkChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips10"),PVPViewModel.RecordResult.winScore)
                self.Text_DefChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips11"),PVPViewModel.RecordResult.losScore)
            else
                self.Text_AtkChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips11"),PVPViewModel.RecordResult.winScore)
                self.Text_DefChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips10"),PVPViewModel.RecordResult.losScore)
            end
            local name = self:IconName(PVPViewModel.OwnInfo.rankLevel)
            MgrRes.LoadSprite(self.AtkRankIcon(),"Level/" .. name)
            local defName = self:IconName(PVPViewModel.TargetInfo.rankLevel)
            MgrRes.LoadSprite(self.DefRankIcon(),"Level/" .. defName)
        end
    else
        self.Text_AtkName().text = PVPViewModel.TargetInfo.name
        self.Text_DefName().text = PVPViewModel.OwnInfo.name
        if PVPViewModel.RecordResult.result == 2 then
            MgrSound.PlayBGM("Battle-lose",1,nil,false)
            self.Text_AtkResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_victory")
            self.Text_DefResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_fail")
        else
            MgrSound.PlayBGM("Battle-win",1,nil,false)
            self.Text_AtkResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_fail")
            self.Text_DefResult().text =  MgrLanguageData.GetLanguageByKey("pvptimenumpop_victory")
        end
        if PVPViewModel.GetViewRecordsCount() > 1 then
            self.TextAtkScoreEx().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.TargetInfo.score;
            self.TextDefScoreEx().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.OwnInfo.score;
        else
            self.Text_AtkRank().text = PVPViewModel.GetPvPRank(PVPViewModel.TargetInfo.rankLevel)[2]
            self.Text_AtkScore().text =PVPViewModel.TargetInfo.score
            self.Text_DefRank().text = PVPViewModel.GetPvPRank(PVPViewModel.OwnInfo.rankLevel)[2]
            self.Text_DefScore().text = PVPViewModel.OwnInfo.score
            if PVPViewModel.RecordResult.result == 2 then
                self.Text_AtkChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips10"),PVPViewModel.RecordResult.winScore)
                self.Text_DefChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips11"),PVPViewModel.RecordResult.losScore)
            else
                self.Text_AtkChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips11"),PVPViewModel.RecordResult.winScore)
                self.Text_DefChangeSore().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips10"),PVPViewModel.RecordResult.losScore)
            end
            local name = self:IconName(PVPViewModel.TargetInfo.rankLevel)
            MgrRes.LoadSprite(self.AtkRankIcon(),"Level/" .. name)
            local defName = self:IconName(PVPViewModel.OwnInfo.rankLevel)
            MgrRes.LoadSprite(self.DefRankIcon(),"Level/" .. defName)
        end
    end
    ---箭头闪烁
    self:ArrowFlash()
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
    MgrSound.Stop(2,"Normal",true)
    MgrTimer.Cancel("ArrowFlash")
    MgrTimer.Cancel("ArrowFlashH")
    MgrTimer.Cancel("ArrowFlashL")
    BattleViewModel.DamageTotal = {}
end

function M:IconName(rankLevel)
    local rank = PVPViewModel.GetPvPRank(rankLevel)
    return rank[3]
    --local lastIntegral = SeniorPVPLocalData.tab[11]
    --for i,v in ipairs(SeniorPVPLocalData.tab) do
    --    if score >= tonumber(SeniorPVPLocalData.tab[1][4]) then
    --        if  v[5] <= rank and rank <= v[6] then
    --            return v[3]
    --        else
    --            return SeniorPVPLocalData.tab[11][3]
    --        end
    --    end
    --    if tonumber(lastIntegral[4]) > score and score >= tonumber(v[4]) then
    --        return v[3]
    --    end
    --    lastIntegral = v    --记录上一个分段
    --end
end

return M