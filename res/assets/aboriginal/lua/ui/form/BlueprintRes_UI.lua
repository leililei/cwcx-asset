-- Code Auto Create Begin
local M = Class('BlueprintRes_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BlueprintRes_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BlueprintRes_UI].prefab'
    self.Name = 'Form[BlueprintRes_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgBg','ImgBg',2},{'mask','ImgBg/mask',2},{'guankadi','ResPanel/guankadi',2},{'Image','ResPanel/guankadi/Image',2},{'qieyedi','ResPanel/qieyedi',2},{'Panel_ResInfo','Panel_ResInfo',2},{'Btu_Saodangdi','Panel_ResInfo/Btn_RFast/Btu_Saodangdi',2},{'ResSweepSuo','Panel_ResInfo/Btn_RFast/Btn_Content/ResSweepSuo',2},{'Btn_ReadyBattle','Panel_ResInfo/Btn_ReadyBattle',2},{'Btn_Zuozhanzhunbeidi','Panel_ResInfo/Btn_ReadyBattle/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili','Panel_ResInfo/Btn_ReadyBattle/Img_Xiaohaotili',2},{'Img_Tiliicon','Panel_ResInfo/Btn_ReadyBattle/Img_Xiaohaotili/Img_Tiliicon',2},{'UpperLeftPanel','UpperLeftPanel',2},{'BtnHome','UpperLeftPanel/BtnHome',2},{'BtnBack','UpperLeftPanel/BtnBack',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'BtnHelp','UpperLeftPanel/BtnHelp',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add2','UpperRightPanel/Btn_AddPower/Btn_Add2',2},{'Img_Tiliicon01','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},
        -- Button 列表
        {'Btn_RFast','Panel_ResInfo/Btn_RFast',4},{'Btn_AddPower01','UpperRightPanel/Btn_AddPower',4},
        -- UITemplate 列表
        {'BlueprintChapterItem','ResPanel/ScrollChapter/BlueprintChapterItem',10},{'BlueprintPointItem','Panel_ResInfo/ScrollPoint/BlueprintPointItem',10},
        -- Toggle 列表
        {'BlueprintChapterItem01','ResPanel/ScrollChapter/BlueprintChapterItem',13},{'BlueprintPointItem01','Panel_ResInfo/ScrollPoint/BlueprintPointItem',13},
        -- RawImage 列表
        {'ResPanel','ResPanel',15},{'ScrollChapter','ResPanel/ScrollChapter',15},{'ScrollPoint','Panel_ResInfo/ScrollPoint',15},
        -- LoopScrollRect 列表
        {'ScrollChapter01','ResPanel/ScrollChapter',18},{'ScrollPoint01','Panel_ResInfo/ScrollPoint',18},
        -- TextMeshProUGUI 列表
        {'Text_Saodang','Panel_ResInfo/Btn_RFast/Btn_Content/Text_Saodang',20},{'Text_InPoint','Panel_ResInfo/Btn_ReadyBattle/Text_InPoint',20},{'Text_RCNum','Panel_ResInfo/Btn_ReadyBattle/Img_Xiaohaotili/Text_RCNum',20},{'TextRaidNum','Panel_ResInfo/TextRaidNum',20},{'Text_Title_CN','UpperLeftPanel/TextTitle/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/TextTitle/Text_Title_EN',20},{'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey));
    UIEvent.LuaClick(self.BtnBack().gameObject, function()
        MgrUI.GoBack();
    end);
    UIEvent.LuaClick(self.BtnHome().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI);
    end);
    UIEvent.LuaClick(self.BtnHelp().gameObject, function()
        HelpViewModel.Go(85)        -- xpxp todo
    end);

    Event.Add("BlueprintPointChange", Handle(self, self.OnPointChange));
    self.ScrollPoint01():SetLuaCellEvent(Handle(self,self.OnPointItemRender));
    
    Event.Add("BlueprintChapterChange", Handle(self, self.OnChapterChange));
    self.ScrollChapter01():SetLuaCellEvent(Handle(self,self.OnChapterItemRender));
    self.m_chapterDatas = StormViewModel.GetResScrollData(StormViewModel.CurScrollData.type2);
    if nil == StormViewModel.curChooseRes then
        self:OnChapterChange(self.m_chapterDatas[1]);
    else
        local find = false;
        for _, v in pairs(self.m_chapterDatas) do
            if v.id == StormViewModel.curChooseRes.id then
                self:OnChapterChange(StormViewModel.curChooseRes);
                find =  true;
                break;
            end
        end
        if false == find then
            self:OnChapterChange(self.m_chapterDatas[1]);
        end
    end
    
    self.ScrollChapter01().totalCount = #self.m_chapterDatas;
    self.ScrollChapter01():RefillCells();
    
    UIEvent.LuaClick(self.Btn_ReadyBattle().gameObject, Handle(self, self.OnBtnBattleClicked));
    UIEvent.LuaClick(self.Btn_RFast().gameObject, Handle(self, self.OnBtnSweepClicked));
    self:RefreshPower();
    UIEvent.LuaClick(self.Btn_AddPower().gameObject,Handle(self,self.PopPower))
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey));
    Event.Remove("BlueprintChapterChange", Handle(self, self.OnChapterChange));
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end
function M:OnChapterItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.m_chapterDatas[idx], idx});
end

function M:OnPointItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.m_pointDatas[idx], idx});
end

function M:OnChapterChange(data)
    StormViewModel.CurScrollData = data;
    StormViewModel.curChooseRes = data;
    MgrRes.LoadSprite(self.ImgBg(),"Preview/"..data.thumbnail_map)
    self.m_pointDatas = StormViewModel.GetStormPointData(true);
    local curPoint = nil;
    if nil ~= StormViewModel.CurChooseResPoint and self.m_pointDatas[1].scrollID == StormViewModel.CurChooseResPoint.scrollID then
        for i, v in pairs(self.m_pointDatas) do
            if v.id == StormViewModel.CurChooseResPoint.id then
                curPoint = StormViewModel.CurChooseResPoint;
                break;
            end
        end
    end
    if nil == curPoint then
        curPoint = StormControl.GetCurPointByScroll(StormViewModel.CurScrollData.id);
    end
    self:OnPointChange(curPoint);
    self.ScrollPoint01().totalCount = #self.m_pointDatas;
    self.ScrollPoint01():RefillCells(curPoint.index - 1, true);
end

function M:OnPointChange(data)
    StormViewModel.CurPointData = data;
    StormViewModel.CurChooseResPoint = data;
    self.Btn_RFast().gameObject:SetActive(data.star == 7 and data.battleMap ~= nil and data.battleMap ~= "0" and data.battleMap ~= "");
    local count = tonumber(string.split(data.consume,"_")[3])
    self.Text_RCNum().text = count
end

function M:OnBtnBattleClicked()
    BattleManager.GameMode = 0
    StormViewModel.OpenStormPlotUI()
    ---当前选中的资源关
    StormViewModel.curChooseRes = StormControl.GetStormScrollById(StormViewModel.CurPointData.scrollID)
    StormViewModel.CurChooseResPoint = StormControl.CheckPointPass(StormViewModel.CurPointData.id) and StormViewModel.CurPointData or nil
end

function M:OnBtnSweepClicked()
    if SysLockControl.CheckSysLock(2001) then

    else
        MgrUI.Pop(UID.PopTip_UI,{string.format(SysLockControl.GetSystemLockTips(2001)),1},true)
        return
    end
    if StormViewModel.CurPointData.star == 0 then
        return
    end
    if StormViewModel.CurPointData.battleMap == nil or StormViewModel.CurPointData.battleMap == "0" or StormViewModel.CurPointData.battleMap == "" then
        return
    end
    MgrUI.Pop(UID.SweepPop_UI,{StormViewModel.CurPointData,function()
        self:RefreshPower();
    end},true)
end

function M:RefreshPower()
    ---刷新体力
    Global.TiliCalibration()
    self.Text_ResTili().text = string.format("%s/%s",PlayerControl.GetPlayerData().vigor.vigorNum,PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4])
    self.TextRaidNum().text = string.format(MgrLanguageData.GetLanguageByKey("ui_meizhoufuben_text2"), BlueprintViewModel.WeekRaidNum(), BlueprintViewModel.WeekRaidTotal())
end

function M:PopPower()
    --Event.Remove("BackKey", Handle(self, self.OnBackKey))
    ---跳转体力
    MgrUI.Pop(UID.VigorInfoPanel,{function()
        self:RefreshPower()
    end},true)
end
return M