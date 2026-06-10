-- Code Auto Create Begin
local M = Class('PlotReview_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlotReview_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlotReview_UI].prefab'
    self.Name = 'Form[PlotReview_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgBg','ImgBg',2},{'ImgLevel','ImgLevel',2},{'RightPanel','RightPanel',2},{'ImgProcess','RightPanel/ImgProcess',2},{'LevelScorll','RightPanel/LevelScorll',2},{'BtnShop','BtnShop',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add','UpperRightPanel/Btn_AddPower/Btn_Add',2},{'Img_Tiliicon','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'UpperLightPanel','UpperLightPanel',2},{'Btn_GoMenu','UpperLightPanel/Btn_GoMenu',2},{'Btn_Back','UpperLightPanel/Btn_Back',2},{'Img_Fenggexian','UpperLightPanel/Img_Fenggexian',2},{'Btn_Help','UpperLightPanel/Btn_Help',2},
        -- UITemplate 列表
        {'PlotReviewLevelItem','RightPanel/LevelScorll/PlotReviewLevelItem',10},
        -- LoopScrollRect 列表
        {'LevelScorll01','RightPanel/LevelScorll',18},
        -- TextMeshProUGUI 列表
        {'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_Title_CN','UpperLightPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLightPanel/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        MgrUI.GoBack();
    end));
    UIEvent.LuaClick(self.BtnShop().gameObject, Handle(self, function()
        MgrUI.GoHide(UID.PlotReviewShop_UI);
    end));
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI);
    end);
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCoin();
        end}, true)
    end)
    self.LevelScorll01():SetLuaCellEvent(Handle(self, self.OnScrollLevelCellRender));
    Event.Add("PlotReviewLevelSelect", Handle(self, self.OnPlotReviewLevelSelect));
    Event.Add("PlotReviewRefreshCoin", Handle(self, self.RefreshCoin));
end
function M:OnClose()
    Event.Remove("PlotReviewLevelSelect", Handle(self, self.OnPlotReviewLevelSelect));
    Event.Remove("PlotReviewRefreshCoin", Handle(self, self.RefreshCoin));
end
function M:OnShow()
    self.m_storyReplayInfo = PlotViewModel.GetStoryReplayInfo(PlotViewModel.ReviewActivityId);
    MgrRes.LoadSprite(self.ImgLevel(), "PlotReview/Activity/Bg/" .. self.m_storyReplayInfo.eventbg);
    local chapterInfo = ChapterLocalData.tab[tonumber(self.m_storyReplayInfo.chapterid)];
    if nil == chapterInfo then
        return;
    end
    self.Text_Title_CN().text = self.m_storyReplayInfo.name;
    self.m_checkpoints = string.split(chapterInfo.simple,",");
    local idx = 0;
    for i, v in pairs(self.m_checkpoints) do
        local unlock = StormControl.CheckPointLock(tonumber((v)));
        if unlock then
            PlotViewModel.ReviewCheckPointId = tonumber(v);
            idx = i - 1;
        end
    end
    self:OnPlotReviewLevelSelect(idx);
    self:RefreshCoin();
end
function M:RefreshCoin()
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4];
    local curTili = PlayerControl.GetPlayerData():GetVigor();
    self.Text_ResTili().text = curTili .. "/" .. TiliMax;
end
function M:OnScrollLevelCellRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.m_checkpoints[idx] });
end
function M:OnPlotReviewLevelSelect(idx)
    self.LevelScorll01().totalCount = #self.m_checkpoints;
    if nil ~= idx then
        self.LevelScorll01():RefillCells(idx);
    else
        self.LevelScorll01():RefreshCells();
    end
end
return M