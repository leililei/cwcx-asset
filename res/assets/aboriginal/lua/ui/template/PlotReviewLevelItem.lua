-- Code Auto Create Begin
local M = Class('PlotReviewLevelItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlotReviewLevelItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PanelSpecial','PanelSpecial',2},{'BtnSweep','PanelSpecial/BtnSweep',2},{'BtnFight','PanelSpecial/BtnFight',2},{'ImgCost','PanelSpecial/BtnFight/Cost/ImgCost',2},{'BtnFightFirst','PanelSpecial/BtnFightFirst',2},{'ImgCost01','PanelSpecial/BtnFightFirst/Cost/ImgCost',2},{'ImgDot','PanelSpecial/ImgDot',2},{'PanelNormal','PanelNormal',2},{'BtnNormal','PanelNormal/BtnNormal',2},{'ImgMaskNormal','PanelNormal/ImgMaskNormal',2},{'ImgLock','PanelNormal/ImgMaskNormal/ImgLock',2},{'ImgDot01','PanelNormal/ImgDot',2},
        -- UITemplate 列表
        {'PlotReviewLevelItem','/',10},
        -- TextMeshProUGUI 列表
        {'TextLevelSpecial','PanelSpecial/TextLevelSpecial',20},{'Text','PanelSpecial/BtnSweep/Text',20},{'Text01','PanelSpecial/BtnFight/Text',20},{'TextCost2','PanelSpecial/BtnFight/Cost/TextCost2',20},{'Text02','PanelSpecial/BtnFightFirst/Text',20},{'TextCost1','PanelSpecial/BtnFightFirst/Cost/TextCost1',20},{'TextLevelNormal','PanelNormal/TextLevelNormal',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.BtnNormal().gameObject, function()
        PlotViewModel.ReviewCheckPointId = self.checkpointId;
        Event.Go("PlotReviewLevelSelect");
    end);
    UIEvent.LuaClick(self.BtnFightFirst().gameObject, Handle(self, self.GoFight));
    UIEvent.LuaClick(self.BtnFight().gameObject, Handle(self, self.GoFight));
    UIEvent.LuaClick(self.BtnSweep().gameObject, Handle(self, self.DoSweep));
end
function M:GoFight()
    if self.pointData then
        ---当前关卡
        StormViewModel.CurPointData = self.pointData;
        BattleManager.GameMode = BattleManager.GameModeType.Normal;
        MgrTimer.AddDelay("GoPlot", 1, function()
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity);
        end, nil);
    end
end
function M:DoSweep()
    if not SysLockControl.CheckSysLock(2001) then
        MgrUI.Pop(UID.PopTip_UI,{string.format(SysLockControl.GetSystemLockTips(2001)),1},true);
        return;
    end
    StormViewModel.CurPointData = self.pointData;
    if StormViewModel.CurPointData.star == 0 then
        return;
    end
    if StormViewModel.CurPointData.battleMap == nil or StormViewModel.CurPointData.battleMap == "0" or StormViewModel.CurPointData.battleMap == "" then
        return;
    end
    MgrUI.Pop(UID.SweepPop_UI,{ StormViewModel.CurPointData, function()
        Event.Go("PlotReviewRefreshCoin");
    end },true);
end
function M:OnUpdateUI(pData)
    self.checkpointId = tonumber(pData[1]);
    local checkPointInfo = CheckpointLocalData.tab[self.checkpointId];
    self.pointData = StormControl.GetStormPointByID(self.checkpointId);
    if PlotViewModel.ReviewCheckPointId ~= self.checkpointId then
        self.PanelNormal().gameObject:SetActive(true);
        self.PanelSpecial().gameObject:SetActive(false);
        self.TextLevelNormal().text = checkPointInfo.name .. " " .. checkPointInfo.cname;
        local unlock = StormControl.CheckPointLock(self.checkpointId);
        self.ImgMaskNormal().gameObject:SetActive(not unlock);
        if false == self.m_showNormal then
            self.ObjRoot:GetComponent("SkillBound"):UpdateSize(nil);
        end
        self.m_showNormal = true;
        return;
    end
    self.PanelNormal().gameObject:SetActive(false);
    self.PanelSpecial().gameObject:SetActive(true);
    self.TextLevelSpecial().text = checkPointInfo.name .. " " .. checkPointInfo.cname;
    self.TextCost1().text = self.pointData.consume and tonumber(string.split(self.pointData.consume,"_")[3]) or 0;
    self.TextCost2().text = self.pointData.consume and tonumber(string.split(self.pointData.consume,"_")[3]) or 0;
    if self.pointData.star == 7 
            and self.pointData.battleMap ~= nil and self.pointData.battleMap ~= "0" and self.pointData.battleMap ~= ""
            and self.pointData.victory ~= nil and self.pointData.victory ~= "" and self.pointData.victory ~= "0"
            and self.pointData.type ~= 999 and self.pointData.type ~= 998 then
        self.BtnFightFirst().gameObject:SetActive(false);
        self.BtnFight().gameObject:SetActive(true);
        self.BtnSweep().gameObject:SetActive(true);
    else
        self.BtnFightFirst().gameObject:SetActive(true);
        self.BtnFight().gameObject:SetActive(false);
        self.BtnSweep().gameObject:SetActive(false);
    end
    if true == self.m_showNormal then
        self.ObjRoot:GetComponent("SkillBound"):UpdateSize(nil);
    end
    self.m_showNormal = false;
end
return M