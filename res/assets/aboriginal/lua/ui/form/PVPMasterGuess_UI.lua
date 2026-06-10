-- Code Auto Create Begin
local M = Class('PVPMasterGuess_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPMasterGuess_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPMasterGuess_UI].prefab'
    self.Name = 'Form[PVPMasterGuess_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Panel','Panel',2},{'Img_Xian1','Panel/Img_Xian1',2},{'Img_Xian2','Panel/Img_Xian2',2},{'ImgBg','Panel/ImgBg',2},{'ImgLine','Panel/ImgBg/ImgLine',2},{'GuessRole1','Panel/ImgBg/GuessRole1',2},{'GuessRole2','Panel/ImgBg/GuessRole2',2},{'Background','Panel/ImgBg/WpShuPanel/Slider/Background',2},{'Fill','Panel/ImgBg/WpShuPanel/Slider/Fill Area/Fill',2},{'Handle','Panel/ImgBg/WpShuPanel/Slider/Handle Slide Area/Handle',2},{'Handle(1)','Panel/ImgBg/WpShuPanel/Slider/Handle Slide Area/Handle/Handle (1)',2},{'BtnMin','Panel/ImgBg/WpShuPanel/BtnMin',2},{'Img_jiandi','Panel/ImgBg/WpShuPanel/BtnMin/Img_jiandi',2},{'BtnMax','Panel/ImgBg/WpShuPanel/BtnMax',2},{'Img_jiadi','Panel/ImgBg/WpShuPanel/BtnMax/Img_jiadi',2},{'BtnMinus','Panel/ImgBg/WpShuPanel/BtnMinus',2},{'-(hei)2','Panel/ImgBg/WpShuPanel/BtnMinus/-(hei)2',2},{'BtnAdd','Panel/ImgBg/WpShuPanel/BtnAdd',2},{'+(hei)2','Panel/ImgBg/WpShuPanel/BtnAdd/+(hei)2',2},{'BtnConfirmGrey','Panel/ImgBg/BtnConfirmGrey',2},{'Img_Quedingdi','Panel/ImgBg/BtnConfirmGrey/Img_Quedingdi',2},{'BtnConfirm','Panel/ImgBg/BtnConfirm',2},{'Img_Quedingdi01','Panel/ImgBg/BtnConfirm/Img_Quedingdi',2},{'BtnCancel','Panel/ImgBg/BtnCancel',2},{'Img_Quxiaodi','Panel/ImgBg/BtnCancel/Img_Quxiaodi',2},
        -- Slider 列表
        {'Slider','Panel/ImgBg/WpShuPanel/Slider',5},
        -- UITemplate 列表
        {'PVPMasterGuessRole','Panel/ImgBg/GuessRole1/PVPMasterGuessRole',10},{'PVPMasterGuessRole01','Panel/ImgBg/GuessRole2/PVPMasterGuessRole',10},
        -- TextMeshProUGUI 列表
        {'TextTitle','Panel/ImgBg/TextTitle',20},{'TextCount','Panel/ImgBg/WpShuPanel/TextCount',20},{'TextHistoryCount','Panel/ImgBg/WpShuPanel/TextHistoryCount',20},{'Text_jian','Panel/ImgBg/WpShuPanel/BtnMin/Text_jian',20},{'Text_jia','Panel/ImgBg/WpShuPanel/BtnMax/Text_jia',20},{'TextTip','Panel/ImgBg/TextTip',20},{'Text_confirm','Panel/ImgBg/BtnConfirmGrey/Text_confirm',20},{'Text_confirm01','Panel/ImgBg/BtnConfirm/Text_confirm',20},{'Text_cancel','Panel/ImgBg/BtnCancel/Text_cancel',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.BtnCancel().gameObject, Handle(self, function()
        MgrUI.ClosePop(self.Uid);
    end));
    UIEvent.LuaClick(self.BtnConfirm().gameObject, Handle(self, self.OnBtnConfirmClicked));
    UIEvent.LuaClick(self.BtnAdd().gameObject, Handle(self, self.OnBtnAddClicked));
    UIEvent.LuaClick(self.BtnMinus().gameObject, Handle(self, self.OnBtnMinusClicked));
    UIEvent.LuaClick(self.BtnMax().gameObject, Handle(self, self.OnBtnMaxClicked));
    UIEvent.LuaClick(self.BtnMin().gameObject, Handle(self, self.OnBtnMinClicked));
    Tools.OnSliderValueChange(self.Slider(), Handle(self, self.OnSliderValueChange))
    Event.Add("PVPMasterGuessSelect", Handle(self, self.OnPVPMasterGuessSelect));
end
function M:OnClose()
    Event.Remove("PVPMasterGuessSelect", Handle(self, self.OnPVPMasterGuessSelect));
end
function M:OnShow(pData)
    local type = pData[1];
    local idx = pData[2];
    self.m_info = PVPViewModel.GetChampionMatchAndPlayer(type * 2, idx * 2);
    self:RefreshValue();
end
function M:OnPVPMasterGuessSelect(playerid)
    self.m_selectedPlayerId = playerid;
    if self.m_info.match.player1.id == playerid then
        self.PVPMasterGuessRole().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player1, true });
        self.PVPMasterGuessRole01().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player2, false });
    else
        self.PVPMasterGuessRole().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player1, false });
        self.PVPMasterGuessRole01().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player2, true });
    end
end
function M:OnBtnConfirmClicked()
    if -1 == self.m_selectedPlayerId or 0 == self.Slider().value then
        MgrUI.ClosePop(self.Uid);
        return;
    end
    PVPViewModel.SendChampionVoteReq(self.m_info.match.matchID, self.m_selectedPlayerId, self.Slider().value, Handle(self, self.OnChampionVoteNtf));
end
function M:OnChampionVoteNtf()
    self:RefreshValue();
end
function M:RefreshValue()
    self.m_selectedPlayerId = PVPViewModel.GetGuessHistoryPlayer(self.m_info.match.matchID);
    if -1 == self.m_selectedPlayerId then
        self.GuessRole1().gameObject:SetActive(true);
        self.GuessRole2().gameObject:SetActive(true);
        self.PVPMasterGuessRole().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player1, false });
        self.PVPMasterGuessRole01().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player2, false });
    elseif self.m_selectedPlayerId == self.m_info.match.player1.id then
        self.GuessRole1().gameObject:SetActive(true);
        self.GuessRole1().transform.localPosition = Vector3(0, 120, 0);
        self.GuessRole2().gameObject:SetActive(false);
        self.PVPMasterGuessRole().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player1, true });
        self.PVPMasterGuessRole01().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player2, false });
    elseif self.m_selectedPlayerId == self.m_info.match.player2.id then
        self.GuessRole1().gameObject:SetActive(false);
        self.GuessRole2().gameObject:SetActive(true);
        self.GuessRole2().transform.localPosition = Vector3(0, 120, 0);
        self.PVPMasterGuessRole().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player1, false });
        self.PVPMasterGuessRole01().gameObject:GetComponent("UITemplate"):SetData({ self.m_info.match.player2, true });
    end
    self.Slider().minValue = 0;
    self.Slider().maxValue = PVPViewModel.MasterTicketLeft;
    self.Slider().value = 0;
    self.TextCount().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui10_text1") .. math.floor(self.Slider().value);
    self.TextHistoryCount().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui11_text1") .. PVPViewModel.GetGuessHistoryCount(self.m_info.match.matchID);
end
function M:OnSliderValueChange(value)
    if -1 == self.m_selectedPlayerId then
        self.Slider().value = 0;
        return;
    end
    self.TextCount().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui10_text1") .. math.floor(self.Slider().value);
end
function M:OnBtnAddClicked()
    if -1 == self.m_selectedPlayerId then
        return;
    end
    if self.Slider().value < self.Slider().maxValue then
        self.Slider().value = self.Slider().value + 1;
        self.TextCount().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui10_text1") .. math.floor(self.Slider().value);
    end
end
function M:OnBtnMinusClicked()
    if -1 == self.m_selectedPlayerId then
        return;
    end
    if self.Slider().value > self.Slider().minValue then
        self.Slider().value = self.Slider().value - 1;
        self.TextCount().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui10_text1") .. math.floor(self.Slider().value);
    end
end
function M:OnBtnMaxClicked()
    if -1 == self.m_selectedPlayerId then
        return;
    end
    self.Slider().value = self.Slider().maxValue;
    self.TextCount().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui10_text1") .. math.floor(self.Slider().value);
end
function M:OnBtnMinClicked()
    if -1 == self.m_selectedPlayerId then
        return;
    end
    self.Slider().value = self.Slider().minValue;
    self.TextCount().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui10_text1") .. math.floor(self.Slider().value);
end
return M