-- Code Auto Create Begin
local M = Class('PVPMaster_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPMaster_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPMaster_UI].prefab'
    self.Name = 'Form[PVPMaster_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NormalPanel','Ani/NormalPanel',2},{'Bg','Ani/NormalPanel/Bg',2},{'NormalItems','Ani/NormalPanel/NormalItems',2},{'ImgLine16_1','Ani/NormalPanel/NormalLines/ImgLine16_1',2},{'ImgLine16_2','Ani/NormalPanel/NormalLines/ImgLine16_2',2},{'ImgLine16_3','Ani/NormalPanel/NormalLines/ImgLine16_3',2},{'ImgLine16_4','Ani/NormalPanel/NormalLines/ImgLine16_4',2},{'ImgLine16_5','Ani/NormalPanel/NormalLines/ImgLine16_5',2},{'ImgLine16_6','Ani/NormalPanel/NormalLines/ImgLine16_6',2},{'ImgLine16_7','Ani/NormalPanel/NormalLines/ImgLine16_7',2},{'ImgLine16_8','Ani/NormalPanel/NormalLines/ImgLine16_8',2},{'ImgLine16_9','Ani/NormalPanel/NormalLines/ImgLine16_9',2},{'ImgLine16_10','Ani/NormalPanel/NormalLines/ImgLine16_10',2},{'ImgLine16_11','Ani/NormalPanel/NormalLines/ImgLine16_11',2},{'ImgLine16_12','Ani/NormalPanel/NormalLines/ImgLine16_12',2},{'ImgLine16_13','Ani/NormalPanel/NormalLines/ImgLine16_13',2},{'ImgLine16_14','Ani/NormalPanel/NormalLines/ImgLine16_14',2},{'ImgLine16_15','Ani/NormalPanel/NormalLines/ImgLine16_15',2},{'ImgLine16_16','Ani/NormalPanel/NormalLines/ImgLine16_16',2},{'ImgLine8_1','Ani/NormalPanel/NormalLines/ImgLine8_1',2},{'ImgLine8_2','Ani/NormalPanel/NormalLines/ImgLine8_2',2},{'ImgLine8_3','Ani/NormalPanel/NormalLines/ImgLine8_3',2},{'ImgLine8_4','Ani/NormalPanel/NormalLines/ImgLine8_4',2},{'ImgLine8_5','Ani/NormalPanel/NormalLines/ImgLine8_5',2},{'ImgLine8_6','Ani/NormalPanel/NormalLines/ImgLine8_6',2},{'ImgLine8_7','Ani/NormalPanel/NormalLines/ImgLine8_7',2},{'ImgLine8_8','Ani/NormalPanel/NormalLines/ImgLine8_8',2},{'ImgLine4_1','Ani/NormalPanel/NormalLines/ImgLine4_1',2},{'ImgLine4_2','Ani/NormalPanel/NormalLines/ImgLine4_2',2},{'ImgLine4_3','Ani/NormalPanel/NormalLines/ImgLine4_3',2},{'ImgLine4_4','Ani/NormalPanel/NormalLines/ImgLine4_4',2},{'Btn_Play8_1','Ani/NormalPanel/NormalButtons/Btn_Play8_1',2},{'Btn_Play8_2','Ani/NormalPanel/NormalButtons/Btn_Play8_2',2},{'Btn_Play8_3','Ani/NormalPanel/NormalButtons/Btn_Play8_3',2},{'Btn_Play8_4','Ani/NormalPanel/NormalButtons/Btn_Play8_4',2},{'Btn_Play8_5','Ani/NormalPanel/NormalButtons/Btn_Play8_5',2},{'Btn_Play8_6','Ani/NormalPanel/NormalButtons/Btn_Play8_6',2},{'Btn_Play8_7','Ani/NormalPanel/NormalButtons/Btn_Play8_7',2},{'Btn_Play8_8','Ani/NormalPanel/NormalButtons/Btn_Play8_8',2},{'Btn_Play4_1','Ani/NormalPanel/NormalButtons/Btn_Play4_1',2},{'Btn_Play4_2','Ani/NormalPanel/NormalButtons/Btn_Play4_2',2},{'Btn_Play4_3','Ani/NormalPanel/NormalButtons/Btn_Play4_3',2},{'Btn_Play4_4','Ani/NormalPanel/NormalButtons/Btn_Play4_4',2},{'Btn_Play2_1','Ani/NormalPanel/NormalButtons/Btn_Play2_1',2},{'Btn_Play2_2','Ani/NormalPanel/NormalButtons/Btn_Play2_2',2},{'Btn_Guess8_1','Ani/NormalPanel/NormalButtons/Btn_Guess8_1',2},{'ImgUnGuess8_1','Ani/NormalPanel/NormalButtons/Btn_Guess8_1/ImgUnGuess8_1',2},{'ImgGuessGrey8_1','Ani/NormalPanel/NormalButtons/Btn_Guess8_1/ImgGuessGrey8_1',2},{'Btn_Guess8_2','Ani/NormalPanel/NormalButtons/Btn_Guess8_2',2},{'ImgUnGuess8_2','Ani/NormalPanel/NormalButtons/Btn_Guess8_2/ImgUnGuess8_2',2},{'ImgGuessGrey8_2','Ani/NormalPanel/NormalButtons/Btn_Guess8_2/ImgGuessGrey8_2',2},{'Btn_Guess8_3','Ani/NormalPanel/NormalButtons/Btn_Guess8_3',2},{'ImgUnGuess8_3','Ani/NormalPanel/NormalButtons/Btn_Guess8_3/ImgUnGuess8_3',2},{'ImgGuessGrey8_3','Ani/NormalPanel/NormalButtons/Btn_Guess8_3/ImgGuessGrey8_3',2},{'Btn_Guess8_4','Ani/NormalPanel/NormalButtons/Btn_Guess8_4',2},{'ImgUnGuess8_4','Ani/NormalPanel/NormalButtons/Btn_Guess8_4/ImgUnGuess8_4',2},{'ImgGuessGrey8_4','Ani/NormalPanel/NormalButtons/Btn_Guess8_4/ImgGuessGrey8_4',2},{'Btn_Guess8_5','Ani/NormalPanel/NormalButtons/Btn_Guess8_5',2},{'ImgUnGuess8_5','Ani/NormalPanel/NormalButtons/Btn_Guess8_5/ImgUnGuess8_5',2},{'ImgGuessGrey8_5','Ani/NormalPanel/NormalButtons/Btn_Guess8_5/ImgGuessGrey8_5',2},{'Btn_Guess8_6','Ani/NormalPanel/NormalButtons/Btn_Guess8_6',2},{'ImgUnGuess8_6','Ani/NormalPanel/NormalButtons/Btn_Guess8_6/ImgUnGuess8_6',2},{'ImgGuessGrey8_6','Ani/NormalPanel/NormalButtons/Btn_Guess8_6/ImgGuessGrey8_6',2},{'Btn_Guess8_7','Ani/NormalPanel/NormalButtons/Btn_Guess8_7',2},{'ImgUnGuess8_7','Ani/NormalPanel/NormalButtons/Btn_Guess8_7/ImgUnGuess8_7',2},{'ImgGuessGrey8_7','Ani/NormalPanel/NormalButtons/Btn_Guess8_7/ImgGuessGrey8_7',2},{'Btn_Guess8_8','Ani/NormalPanel/NormalButtons/Btn_Guess8_8',2},{'ImgUnGuess8_8','Ani/NormalPanel/NormalButtons/Btn_Guess8_8/ImgUnGuess8_8',2},{'ImgGuessGrey8_8','Ani/NormalPanel/NormalButtons/Btn_Guess8_8/ImgGuessGrey8_8',2},{'Btn_Guess4_1','Ani/NormalPanel/NormalButtons/Btn_Guess4_1',2},{'ImgUnGuess4_1','Ani/NormalPanel/NormalButtons/Btn_Guess4_1/ImgUnGuess4_1',2},{'ImgGuessGrey4_1','Ani/NormalPanel/NormalButtons/Btn_Guess4_1/ImgGuessGrey4_1',2},{'Btn_Guess4_2','Ani/NormalPanel/NormalButtons/Btn_Guess4_2',2},{'ImgUnGuess4_2','Ani/NormalPanel/NormalButtons/Btn_Guess4_2/ImgUnGuess4_2',2},{'ImgGuessGrey4_2','Ani/NormalPanel/NormalButtons/Btn_Guess4_2/ImgGuessGrey4_2',2},{'Btn_Guess4_3','Ani/NormalPanel/NormalButtons/Btn_Guess4_3',2},{'ImgUnGuess4_3','Ani/NormalPanel/NormalButtons/Btn_Guess4_3/ImgUnGuess4_3',2},{'ImgGuessGrey4_3','Ani/NormalPanel/NormalButtons/Btn_Guess4_3/ImgGuessGrey4_3',2},{'Btn_Guess4_4','Ani/NormalPanel/NormalButtons/Btn_Guess4_4',2},{'ImgUnGuess4_4','Ani/NormalPanel/NormalButtons/Btn_Guess4_4/ImgUnGuess4_4',2},{'ImgGuessGrey4_4','Ani/NormalPanel/NormalButtons/Btn_Guess4_4/ImgGuessGrey4_4',2},{'Btn_Guess2_1','Ani/NormalPanel/NormalButtons/Btn_Guess2_1',2},{'ImgUnGuess2_1','Ani/NormalPanel/NormalButtons/Btn_Guess2_1/ImgUnGuess2_1',2},{'ImgGuessGrey2_1','Ani/NormalPanel/NormalButtons/Btn_Guess2_1/ImgGuessGrey2_1',2},{'Btn_Guess2_2','Ani/NormalPanel/NormalButtons/Btn_Guess2_2',2},{'ImgUnGuess2_2','Ani/NormalPanel/NormalButtons/Btn_Guess2_2/ImgUnGuess2_2',2},{'ImgGuessGrey2_2','Ani/NormalPanel/NormalButtons/Btn_Guess2_2/ImgGuessGrey2_2',2},{'FinalPanel','Ani/FinalPanel',2},{'Bg01','Ani/FinalPanel/Bg',2},{'FinalItems','Ani/FinalPanel/FinalItems',2},{'Spine1','Ani/FinalPanel/FinalItems/Spine1',2},{'Spine2','Ani/FinalPanel/FinalItems/Spine2',2},{'Spine3','Ani/FinalPanel/FinalItems/Spine3',2},{'Spine4','Ani/FinalPanel/FinalItems/Spine4',2},{'Btn_PlayFinal_1','Ani/FinalPanel/FinalButtons/Btn_PlayFinal_1',2},{'Btn_PlayFinal_2','Ani/FinalPanel/FinalButtons/Btn_PlayFinal_2',2},{'Btn_GuessFinal_1','Ani/FinalPanel/FinalButtons/Btn_GuessFinal_1',2},{'ImgUnGuessFinal_1','Ani/FinalPanel/FinalButtons/Btn_GuessFinal_1/ImgUnGuessFinal_1',2},{'ImgGuessGreyFinal_1','Ani/FinalPanel/FinalButtons/Btn_GuessFinal_1/ImgGuessGreyFinal_1',2},{'Btn_GuessFinal_2','Ani/FinalPanel/FinalButtons/Btn_GuessFinal_2',2},{'ImgUnGuessFinal_2','Ani/FinalPanel/FinalButtons/Btn_GuessFinal_2/ImgUnGuessFinal_2',2},{'ImgGuessGreyFinal_2','Ani/FinalPanel/FinalButtons/Btn_GuessFinal_2/ImgGuessGreyFinal_2',2},{'UpperBtnPanel','Ani/UpperBtnPanel',2},{'Btn_Back','Ani/UpperBtnPanel/Btn_Back',2},{'Img_Fenggexian','Ani/UpperBtnPanel/Img_Fenggexian',2},{'Btn_Help','Ani/UpperBtnPanel/Btn_Help',2},{'Img_Tittle','Ani/ConstPanel/Img_Tittle',2},{'Toggle_Normal','Ani/ConstPanel/Switch/Toggle_Normal',2},{'Select','Ani/ConstPanel/Switch/Toggle_Normal/Select',2},{'Toggle_Final','Ani/ConstPanel/Switch/Toggle_Final',2},{'Select01','Ani/ConstPanel/Switch/Toggle_Final/Select',2},{'Btn_Rewards','Ani/ConstPanel/Btn_Rewards',2},{'Btn_Shop','Ani/ConstPanel/Btn_Shop',2},{'Btn_Formation','Ani/ConstPanel/Btn_Formation',2},{'ImgFormationGray','Ani/ConstPanel/Btn_Formation/ImgFormationGray',2},{'Img_Vs','Ani/ConstPanel/Img_Vs',2},{'Ticket','Ani/ConstPanel/Ticket',2},{'ImgTicketBg','Ani/ConstPanel/Ticket/ImgTicketBg',2},{'ImgTicket','Ani/ConstPanel/Ticket/ImgTicket',2},{'BtnTicketHelp','Ani/ConstPanel/Ticket/BtnTicketHelp',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Button 列表
        {'Btn_Back01','Ani/UpperBtnPanel/Btn_Back',4},{'Btn_Help01','Ani/UpperBtnPanel/Btn_Help',4},
        -- UITemplate 列表
        {'PVPMasterRoleItem','Ani/Hide/PVPMasterRoleItem',10},{'PVPMasterSeason','Ani/ConstPanel/Img_Tittle/Season/PVPMasterSeason',10},
        -- Toggle 列表
        {'Toggle_Normal01','Ani/ConstPanel/Switch/Toggle_Normal',13},{'Toggle_Final01','Ani/ConstPanel/Switch/Toggle_Final',13},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','Ani/UpperBtnPanel/Text_TitleCn',20},{'Text_RemainTime','Ani/ConstPanel/Img_Tittle/Text_RemainTime',20},{'Text','Ani/ConstPanel/Switch/Toggle_Normal/Text',20},{'Text01','Ani/ConstPanel/Switch/Toggle_Final/Text',20},{'Text02','Ani/ConstPanel/Btn_Rewards/Text',20},{'Text03','Ani/ConstPanel/Btn_Shop/Text',20},{'TextFormation','Ani/ConstPanel/Btn_Formation/TextFormation',20},{'Text_Time','Ani/ConstPanel/Btn_Formation/Text_Time',20},{'TextTicket','Ani/ConstPanel/Ticket/TextTicket',20},
    }
end
-- Code Auto Create End
local PanelEnum = {
    Normal = 1,
    Final = 2,
}
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Back01().gameObject, Handle(self, function()
        MgrUI.GoBack();
    end));
    UIEvent.LuaClick(self.Btn_Help01().gameObject, function()
        HelpViewModel.Go(116);
    end);
    UIEvent.LuaClick(self.Btn_Rewards().gameObject, function()
        MgrUI.Pop(UID.PVPMasterRewardPreview, nil, true);
    end);
    UIEvent.LuaClick(self.Btn_Shop().gameObject, function()
        MgrLink.LinkStart("tz_sc_114003_308");
    end);
    UIEvent.LuaClick(self.Btn_Formation().gameObject, Handle(self, self.OnBtnFormationClicked));
    Tools.ToggleValueChange(self.Toggle_Normal01(), function(isOn)
        if isOn then
            self:SwtichPanel(PanelEnum.Normal);
        end
    end);
    UIEvent.LuaClick(self.BtnTicketHelp().gameObject, function()
        MgrUI.Pop(UID.PVPMasterGuessHistory, nil, true);
    end);
    Tools.ToggleValueChange(self.Toggle_Final01(), function(isOn)
        if isOn then
            self:SwtichPanel(PanelEnum.Final);
        end
    end);
    self:BuildItems();
    self.PVPMasterSeason().gameObject:GetComponent("UITemplate"):SetData({ PVPViewModel.MasterSeasonOnShow });
    PVPViewModel.ClearViewRecords();
end

function M:OnBtnFormationClicked()
    local myPlayerID = PlayerControl.GetPlayerData().UID;
    if (not PVPViewModel.InPVPMaster(myPlayerID)) or (not PVPViewModel.AlivePVPMaster(myPlayerID)) then
        -- 没入围 或 淘汰了
        return
    end
    local serverTime = MgrNet.GetServerTime();
    if PVPViewModel.MasterPrepareStart <= serverTime and PVPViewModel.MasterFrozenStart > serverTime and PVPViewModel.AlivePVPMaster(myPlayerID) then
        -- 准备阶段 并且 还存活
        if 2 == PVPViewModel.IsMasterDeploy then
            -- 本赛季已布阵
            MgrUI.GoHide(UID.PVPMasterFormation_UI, nil);
        else
            -- 本赛季尚未布阵，清空之前的布阵
            TeamControl.ChangeTeamInfoEx(TeamControl.PVPMasterAtk, {}, {});
            TeamControl.ChangeTeamInfoEx(TeamControl.PVPMasterDef, {}, {});
            MgrUI.GoHide(UID.PVPMasterFormation_UI, nil);
        end
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("masterpvp_tips5"), 2},true)
    end
end

function M:OnShow()
    self.m_curSeason = PVPViewModel.MasterSeasonReq;
    if 0 == self.m_curSeason then
        -- 当前赛季
        self.Text_RemainTime().gameObject:SetActive(true);
        self.Btn_Formation().gameObject:SetActive(true);
        self.Btn_Rewards().gameObject:SetActive(true);
        self.Btn_Shop().gameObject:SetActive(true);
        if PVPViewModel.MasterFinalIsOpen() then
            -- 已进入决赛阶段
            self.Toggle_Final01().gameObject:SetActive(true);
        else
            -- 未进入决赛阶段
            self.Toggle_Final01().gameObject:SetActive(false);
        end
        if nil ~= PVPViewModel.PanelType then
            -- 看录像回来
            if PanelEnum.Final == PVPViewModel.PanelType then
                -- 决赛
                self.Toggle_Final01().isOn = true;
                self:SwtichPanel(PanelEnum.Final);
            else
                -- 小组赛
                self.Toggle_Normal01().isOn = true;
                self:SwtichPanel(PanelEnum.Normal);
            end
            PVPViewModel.PanelType = nil;
        else
            if PVPViewModel.MasterFinalIsOpen() then
                -- 已进入决赛阶段
                self.Toggle_Final01().isOn = true;
                self:SwtichPanel(PanelEnum.Final);
            else
                -- 未进入决赛阶段
                self.Toggle_Normal01().isOn = true;
                self:SwtichPanel(PanelEnum.Normal);
            end
        end
        MgrTimer.AddRepeat("PVPMasterRefresh", 300, Handle(self, self.OnPVPMasterRefresh), -1, self.ObjRoot);
        MgrTimer.AddRepeat("PVPMasterUpdate", 1, Handle(self, self.OnPVPMasterUpdate), -1, self.ObjRoot);
        Event.Add("PVPMasterTicketRefresh", Handle(self, self.OnTicketRefresh));
    else
        -- 过往赛季
        self.Text_RemainTime().gameObject:SetActive(false);
        self.Btn_Formation().gameObject:SetActive(false);
        self.Btn_Rewards().gameObject:SetActive(false);
        self.Btn_Shop().gameObject:SetActive(false);
        self.Toggle_Final01().gameObject:SetActive(true);
        if nil ~= PVPViewModel.PanelType then
            -- 看录像回来
            if PanelEnum.Final == PVPViewModel.PanelType then
                -- 决赛
                self.Toggle_Final01().isOn = true;
                self:SwtichPanel(PanelEnum.Final);
            else
                -- 小组赛
                self.Toggle_Normal01().isOn = true;
                self:SwtichPanel(PanelEnum.Normal);
            end
            PVPViewModel.PanelType = nil;
        else
            self.Toggle_Final01().isOn = true;
            self:SwtichPanel(PanelEnum.Final);
        end
    end
    self:RefreshAllItems();
    self:OnPVPMasterUpdate();
    self:OnTicketRefresh();
end

function M:OnClose()
    MgrTimer.Cancel("PVPMasterRefresh");
    MgrTimer.Cancel("PVPMasterUpdate");
    Event.Remove("PVPMasterTicketRefresh", Handle(self, self.OnTicketRefresh));
end

function M:OnTicketRefresh()
    self.TextTicket().text = PVPViewModel.MasterTicketLeft;
    self:RefreshAllItems();
end
function M:OnPVPMasterRefresh()
    if 0 ~= self.m_curSeason then
        return;
    end
    PVPViewModel.SendGetChampionMatchReq(self.m_curSeason, nil, function()
        self:RefreshAllItems();
    end);
end
function M:OnPVPMasterUpdate()
    local serverTime = MgrNet.GetServerTime();
    self.Text_RemainTime().gameObject:SetActive(true);
    self.ImgFormationGray().gameObject:SetActive(true);
    local myPlayerID = PlayerControl.GetPlayerData().UID;
    if PVPViewModel.MasterPrepareStart > serverTime then
        -- 准备前阶段，不能配置阵容
        local _, hour, minute, _ = Global.Second2Format(PVPViewModel.MasterPrepareStart - serverTime);
        self.Text_RemainTime().text = string.format(MgrLanguageData.GetLanguageByKey("masterpvp_ui2_text3"), hour, minute);
        if not PVPViewModel.InPVPMaster(myPlayerID) then
            -- 没入围
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text2");
        elseif PVPViewModel.AlivePVPMaster(myPlayerID) then
            -- 还存活
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui17");
        else
            -- 淘汰了
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text3");
        end
        self.Btn_Formation().color = Color(0.7, 0.7, 0.7, 1);
        return;
    end
    if PVPViewModel.MasterFrozenStart > serverTime then
        -- 准备阶段，可以配置阵容
        local _, hour, minute, _ = Global.Second2Format(PVPViewModel.MasterFrozenStart - serverTime);
        self.Text_RemainTime().text = string.format(MgrLanguageData.GetLanguageByKey("masterpvp_ui2_text1"), hour, minute);
        local myPlayerID = PlayerControl.GetPlayerData().UID;
        if not PVPViewModel.InPVPMaster(myPlayerID) then
            -- 没入围
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text2");
            self.Btn_Formation().color = Color(0.7, 0.7, 0.7, 1);
        elseif PVPViewModel.AlivePVPMaster(myPlayerID) then
            -- 还存活
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text1");
            self.ImgFormationGray().gameObject:SetActive(false);
            self.Btn_Formation().color = Color(1, 1, 1, 1);
        else
            -- 淘汰了
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text3");
            self.Btn_Formation().color = Color(0.7, 0.7, 0.7, 1);
        end
        return;
    end
    if PVPViewModel.MasterRewardStart > serverTime then
        -- 冻结阶段，不能配置阵容
        local _, hour, minute, _ = Global.Second2Format(PVPViewModel.MasterRewardStart - serverTime);
        self.Text_RemainTime().text = string.format(MgrLanguageData.GetLanguageByKey("masterpvp_ui2_text2"), hour, minute);
        if not PVPViewModel.InPVPMaster(myPlayerID) then
            -- 没入围
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text2");
        elseif PVPViewModel.AlivePVPMaster(myPlayerID) then
            -- 还存活
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text1");
        else
            -- 淘汰了
            self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui6_text3");
        end
        self.Btn_Formation().color = Color(0.7, 0.7, 0.7, 1);
        return;
    end
    -- 决赛阶段已结束
    self.Text_RemainTime().gameObject:SetActive(false);
    self.TextFormation().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui16");
    self.Btn_Formation().color = Color(0.7, 0.7, 0.7, 1);
end

function M:SwtichPanel(type)
    self.PanelType = type;
    self.NormalPanel().gameObject:SetActive(false);
    self.FinalPanel().gameObject:SetActive(false);
    if PanelEnum.Normal == type then
        self.NormalPanel().gameObject:SetActive(true);
    elseif PanelEnum.Final == type then
        self.FinalPanel().gameObject:SetActive(true);
    end
end
function M:OnBtnPlayClicked(type, idx)
    print("OnBtnPlayClicked. type: " .. type .. ", idx: " .. idx);
    local info = PVPViewModel.GetChampionMatchAndPlayer(type * 2, idx * 2);
    if "" == info.match.battleToken1 or "" == info.match.battleToken2 then
        -- 没有回放记录
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("masterpvp_tips3"),1},true);
        return;
    end
    BattleManager.GameMode = BattleManager.GameModeType.PVP
    PVPViewModel.CuRecordTime = "";
    PVPViewModel.ViewRecords({ info.match.battleToken1, info.match.battleToken2, }, self.PanelType);
end
function M:OnBtnGuessClicked(type, idx)
    print("OnBtnGuessClicked. type: " .. type .. ", idx: " .. idx);
    local info = PVPViewModel.GetChampionMatchAndPlayer(type * 2, idx * 2);
    local myPlayerID = PlayerControl.GetPlayerData().UID;
    if info.match.player1.id == myPlayerID or info.match.player2.id == myPlayerID then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("masterpvp_tips4"),1},true);
        return;
    end
    MgrUI.Pop(UID.PVPMasterGuess_UI, { type, idx },true);
end
function M:RefreshAllItems()
    if PVPViewModel.MasterFinalIsOpen() then
        -- 已进入决赛阶段
        self.Toggle_Final01().gameObject:SetActive(true);
    else
        -- 未进入决赛阶段
        self.Toggle_Final01().gameObject:SetActive(false);
    end
    self:RefreshNormalItem(16);
    self:RefreshNormalItem(8);
    self:RefreshNormalItem(4);
    self:RefreshNormalItem(2);
    self:RefreshFinalItem(2);
    -- 64是季军赛
    self:RefreshFinalItem(64);
end
function M:RefreshNormalItem(type)
    local serverTime = MgrNet.GetServerTime();
    for i, item in ipairs(self.m_items[type]) do
        local info = PVPViewModel.GetChampionMatchAndPlayer(type, i);
        item:GetComponent("UITemplate"):SetData({ info });
        -- 决赛没有线和按钮
        if type > 2 then
            if nil ~= info.match then
                -- 线
                if nil ~= info.player and info.match.winner == info.player.id then
                    self.m_lines[type][i].gameObject:SetActive(true);
                else
                    self.m_lines[type][i].gameObject:SetActive(false);
                end
                -- 两个item只要刷新一次按钮
                if info.isFirst then
                    if 0 == info.match.winner and 0 == self.m_curSeason then
                        self.m_btnPlay[type / 2][info.matchIdx].gameObject:SetActive(false);
                        self.m_btnGuess[type / 2][info.matchIdx].gameObject:SetActive(true);
                        if PVPViewModel.MasterPrepareStart <= serverTime and PVPViewModel.MasterRewardStart > serverTime then
                            self.m_imgGuessGrey[type / 2][info.matchIdx].gameObject:SetActive(false);
                            if -1 == PVPViewModel.GetGuessHistoryPlayer(info.match.matchID) then
                                -- 没猜过
                                self.m_imgUnGuess[type / 2][info.matchIdx].gameObject:SetActive(true);
                            else
                                -- 猜过
                                self.m_imgUnGuess[type / 2][info.matchIdx].gameObject:SetActive(false);
                            end
                        else
                            -- 不能猜
                            self.m_imgGuessGrey[type / 2][info.matchIdx].gameObject:SetActive(true);
                        end
                    else
                        -- 打过了
                        self.m_btnPlay[type / 2][info.matchIdx].gameObject:SetActive(true);
                        self.m_btnGuess[type / 2][info.matchIdx].gameObject:SetActive(false);
                    end
                end
            else
                -- 还没有战斗双方，全隐藏
                self.m_lines[type][i].gameObject:SetActive(false);
                self.m_btnPlay[type / 2][info.matchIdx].gameObject:SetActive(false);
                self.m_btnGuess[type / 2][info.matchIdx].gameObject:SetActive(false);
            end
        end
    end
end
function M:RefreshFinalItem(type)
    local serverTime = MgrNet.GetServerTime();
    for i, item in ipairs(self.m_itemsFinal[type]) do
        local info = PVPViewModel.GetChampionMatchAndPlayer(type, i);
        item:GetComponent("UITemplate"):SetData({ info });
        -- 小人
        Tools.ClearAllChild(self.m_spinesFinal[type][i].gameObject);
        if nil ~= info.player then
            MgrRes.LoadFightSpine(self.m_spinesFinal[type][i].gameObject, info.player.menuRoleID,0,0,45,"dj",function(obj)
                obj.transform.gameObject.layer = 5;
                obj:GetComponent("MeshRenderer").sortingLayerID = 0;
                obj:GetComponent("MeshRenderer").sortingOrder = self.CavOrder + 1;
            end);
        end
        if nil ~= info.match then
            -- 两个item只要刷新一次按钮，决赛没按钮
            if info.isFirst then
                if 0 == info.match.winner and 0 == self.m_curSeason then
                    self.m_btnPlayFinal[type / 2][info.matchIdx].gameObject:SetActive(false);
                    self.m_btnGuessFinal[type / 2][info.matchIdx].gameObject:SetActive(true);
                    if PVPViewModel.MasterPrepareStart <= serverTime and PVPViewModel.MasterRewardStart > serverTime then
                        self.m_imgGuessGreyFinal[type / 2][info.matchIdx].gameObject:SetActive(false);
                        if -1 == PVPViewModel.GetGuessHistoryPlayer(info.match.matchID) then
                            -- 没猜过
                            self.m_imgUnGuessFinal[type / 2][info.matchIdx].gameObject:SetActive(true);
                        else
                            -- 猜过
                            self.m_imgUnGuessFinal[type / 2][info.matchIdx].gameObject:SetActive(false);
                        end
                    else
                        -- 不能猜
                        self.m_imgGuessGreyFinal[type / 2][info.matchIdx].gameObject:SetActive(true);
                    end
                else
                    -- 打过了
                    self.m_btnPlayFinal[type / 2][info.matchIdx].gameObject:SetActive(true);
                    self.m_btnGuessFinal[type / 2][info.matchIdx].gameObject:SetActive(false);
                end
            end
        else
            -- 还没有战斗双方，全隐藏
            self.m_btnPlayFinal[type / 2][info.matchIdx].gameObject:SetActive(false);
            self.m_btnGuessFinal[type / 2][info.matchIdx].gameObject:SetActive(false);
        end
    end
end
function M:BuildItems()
    self.m_items = {};
    self.m_lines = {};
    self.m_btnPlay = {};
    self.m_btnGuess = {};
    self.m_imgUnGuess = {};
    self.m_imgGuessGrey = {};
    self.m_itemsFinal = {};
    self.m_btnPlayFinal = {};
    self.m_btnGuessFinal = {};
    self.m_imgUnGuessFinal = {};
    self.m_imgGuessGreyFinal = {};
    self.m_spinesFinal = {};
    -- 小组16强
    self.m_items[16] = {};
    self:BuildItemsImp(self.m_items[16], self.NormalItems().transform, {
        -- 上半区 左上1
        { -800, 360 },
        { -800, 245 },
        -- 下半区 左下1
        { -800, -110 },
        { -800, -228 },
        -- 上半区 右上1
        { 808, 360 },
        { 808, 245 },
        -- 下半区 右下1
        { 808, -110 },
        { 808, -228 },
        -- 下半区 右下2
        { 808, -345 },
        { 808, -465 },
        -- 上半区 右上2
        { 808, 125 },
        { 808, 8 },
        -- 下半区 左下2
        { -800, -345 },
        { -800, -465 },
        -- 上半区 左上2
        { -800, 125 },
        { -800, 8 },
    });
    self.m_lines[16] = {
        -- 上半区 左上1
        self.ImgLine16_1(),
        self.ImgLine16_2(),
        -- 下半区 左下1
        self.ImgLine16_5(),
        self.ImgLine16_6(),
        -- 上半区 右上1
        self.ImgLine16_9(),
        self.ImgLine16_10(),
        -- 下半区 右下1
        self.ImgLine16_13(),
        self.ImgLine16_14(),
        -- 下半区 右下2
        self.ImgLine16_15(),
        self.ImgLine16_16(),
        -- 上半区 右上2
        self.ImgLine16_11(),
        self.ImgLine16_12(),
        -- 下半区 左下2
        self.ImgLine16_7(),
        self.ImgLine16_8(),
        -- 上半区 左上2
        self.ImgLine16_3(),
        self.ImgLine16_4(),
    };
    self.m_btnPlay[8] = {
        self.Btn_Play8_1(),
        self.Btn_Play8_3(),
        self.Btn_Play8_5(),
        self.Btn_Play8_7(),
        self.Btn_Play8_8(),
        self.Btn_Play8_6(),
        self.Btn_Play8_4(),
        self.Btn_Play8_2(),
    };
    self:BindPlayBtnClick(self.m_btnPlay[8], 8);
    self.m_btnGuess[8] = {
        self.Btn_Guess8_1(),
        self.Btn_Guess8_3(),
        self.Btn_Guess8_5(),
        self.Btn_Guess8_7(),
        self.Btn_Guess8_8(),
        self.Btn_Guess8_6(),
        self.Btn_Guess8_4(),
        self.Btn_Guess8_2(),
    };
    self.m_imgUnGuess[8] = {
        self.ImgUnGuess8_1(),
        self.ImgUnGuess8_3(),
        self.ImgUnGuess8_5(),
        self.ImgUnGuess8_7(),
        self.ImgUnGuess8_8(),
        self.ImgUnGuess8_6(),
        self.ImgUnGuess8_4(),
        self.ImgUnGuess8_2(),
    };
    self.m_imgGuessGrey[8] = {
        self.ImgGuessGrey8_1(),
        self.ImgGuessGrey8_3(),
        self.ImgGuessGrey8_5(),
        self.ImgGuessGrey8_7(),
        self.ImgGuessGrey8_8(),
        self.ImgGuessGrey8_6(),
        self.ImgGuessGrey8_4(),
        self.ImgGuessGrey8_2(),
    };
    self:BindGuessBtnClick(self.m_btnGuess[8], 8);
    -- 小组8强
    self.m_items[8] = {};
    self:BuildItemsImp(self.m_items[8], self.NormalItems().transform, {
        -- 上半区 左上
        { -450, 303 },
        { -450, 67 },
        -- 下半区 左下
        { -450, -170 },
        { -450, -405 },
        -- 上半区 右上
        { 457, 303 },
        { 457, 67 },
        -- 下半区 右下
        { 457, -170 },
        { 457, -405 },
    });
    self.m_lines[8] = {
        -- 上半区 左上
        self.ImgLine8_1(),
        self.ImgLine8_2(),
        -- 下半区 左下
        self.ImgLine8_3(),
        self.ImgLine8_4(),
        -- 上半区 右上
        self.ImgLine8_5(),
        self.ImgLine8_6(),
        -- 下半区 右下
        self.ImgLine8_7(),
        self.ImgLine8_8(),
    };
    self.m_btnPlay[4] = {
        self.Btn_Play4_1(),
        self.Btn_Play4_2(),
        self.Btn_Play4_3(),
        self.Btn_Play4_4(),
    };
    self:BindPlayBtnClick(self.m_btnPlay[4], 4);
    self.m_btnGuess[4] = {
        self.Btn_Guess4_1(),
        self.Btn_Guess4_2(),
        self.Btn_Guess4_3(),
        self.Btn_Guess4_4(),
    };
    self.m_imgUnGuess[4] = {
        self.ImgUnGuess4_1(),
        self.ImgUnGuess4_2(),
        self.ImgUnGuess4_3(),
        self.ImgUnGuess4_4(),
    };
    self.m_imgGuessGrey[4] = {
        self.ImgGuessGrey4_1(),
        self.ImgGuessGrey4_2(),
        self.ImgGuessGrey4_3(),
        self.ImgGuessGrey4_4(),
    };
    self:BindGuessBtnClick(self.m_btnGuess[4], 4);
    -- 小组4强
    self.m_items[4] = {};
    self:BuildItemsImp(self.m_items[4], self.NormalItems().transform, {
        -- 上半区
        -- 左上
        { -160, 185 },
        -- 右上
        { 167, 185 },
        -- 下半区
        -- 左下
        { -160, -287 },
        -- 右下
        { 167, -287 },
    });
    self.m_lines[4] = {
        self.ImgLine4_1(),
        self.ImgLine4_2(),
        self.ImgLine4_3(),
        self.ImgLine4_4(),
    };
    self.m_btnPlay[2] = {
        self.Btn_Play2_1(),
        self.Btn_Play2_2(),
    };
    self:BindPlayBtnClick(self.m_btnPlay[2], 2);
    self.m_btnGuess[2] = {
        self.Btn_Guess2_1(),
        self.Btn_Guess2_2(),
    };
    self.m_imgUnGuess[2] = {
        self.ImgUnGuess2_1(),
        self.ImgUnGuess2_2(),
    };
    self.m_imgGuessGrey[2] = {
        self.ImgGuessGrey2_1(),
        self.ImgGuessGrey2_2(),
    };
    self:BindGuessBtnClick(self.m_btnGuess[2], 2);
    -- 小组2强
    self.m_items[2] = {};
    self:BuildItemsImp(self.m_items[2], self.NormalItems().transform, {
        -- 上半区
        { -195, -50 },
        -- 下半区
        { 200, -50 },
    });
    -- 决赛 冠军赛
    self.m_itemsFinal[2] = {};
    self:BuildItemsImp(self.m_itemsFinal[2], self.FinalItems().transform, {
        { -392, 140 },
        { 396, 140 },
    });
    self.m_spinesFinal[2] = {
        self.Spine1(),
        self.Spine2(),
    };
    self.m_btnPlayFinal[1] = {
        self.Btn_PlayFinal_1(),
    };
    self:BindPlayBtnClick(self.m_btnPlayFinal[1], 1);
    self.m_btnGuessFinal[1] = {
        self.Btn_GuessFinal_1(),
    };
    self.m_imgUnGuessFinal[1] = {
        self.ImgUnGuessFinal_1(),
    };
    self.m_imgGuessGreyFinal[1] = {
        self.ImgGuessGreyFinal_1(),
    };
    self:BindGuessBtnClick(self.m_btnGuessFinal[1], 1);
    -- 决赛 季军赛
    self.m_itemsFinal[64] = {};
    self:BuildItemsImp(self.m_itemsFinal[64], self.FinalItems().transform, {
        { -292, -200 },
        { 296, -200 },
    });
    self.m_spinesFinal[64] = {
        self.Spine3(),
        self.Spine4(),
    };
    self.m_btnPlayFinal[32] = {
        self.Btn_PlayFinal_2(),
    };
    self:BindPlayBtnClick(self.m_btnPlayFinal[32], 32);
    self.m_btnGuessFinal[32] = {
        self.Btn_GuessFinal_2(),
    };
    self.m_imgUnGuessFinal[32] = {
        self.ImgUnGuessFinal_2(),
    };
    self.m_imgGuessGreyFinal[32] = {
        self.ImgGuessGreyFinal_2(),
    };
    self:BindGuessBtnClick(self.m_btnGuessFinal[32], 32);
end
function M:BindPlayBtnClick(btns, type)
    for i, v in ipairs(btns) do
        UIEvent.LuaClick(v.gameObject, function()
            self:OnBtnPlayClicked(type, i);
        end);
    end
end
function M:BindGuessBtnClick(btns, type)
    for i, v in ipairs(btns) do
        UIEvent.LuaClick(v.gameObject, function()
            self:OnBtnGuessClicked(type, i);
        end);
    end
end
function M:BuildItemsImp(array, parent, positions)
    for i, pos in ipairs(positions) do
        local item = GameObject.Instantiate(self.PVPMasterRoleItem().gameObject, parent);
        item.gameObject.transform.localPosition = Vector3(pos[1], pos[2], 0);
        table.insert(array, item);
    end
end
return M