-- Code Auto Create Begin
local M = Class('PlotReviewItemActivity', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlotReviewItemActivity.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PlotReviewItemActivity','/',2},{'ImgBg','ImgBg',2},{'ImgPlay','ImgPlay',2},{'ImgDownload','ImgDownload',2},{'ImgMask','ImgMask',2},{'ImgLock','ImgMask/ImgLock',2},
        -- UITemplate 列表
        {'PlotReviewItemActivity01','/',10},
        -- TextMeshProUGUI 列表
        {'TextName','TextName',20},
    }
end
-- Code Auto Create End
local DownloadState = {
    Unchecked = 1,
    NeedDownload = 2,
    Downloaded = 3;
}
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot, function()
        if DownloadState.Downloaded == self.m_state then
            PlotViewModel.ReviewActivityId = self.m_storyReplayInfo.activityid;
            MgrUI.GoHide(UID.PlotReview_UI);
        elseif DownloadState.NeedDownload == self.m_state then
            if "" == self.m_storyReplayInfo.resourceid or "0" == self.m_storyReplayInfo.resourceid then
                return;
            end
            local tags = string.split(self.m_storyReplayInfo.resourceid,";");
            MgrUI.Pop(UID.PlotReviewDownload_UI,{ tags, self.m_storyReplayInfo.activityid },true);
        end
    end);
    UIEvent.LuaClick(self.ImgMask().gameObject, function()
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("plotreplay_ui_tips1")},true);
    end);
    self.m_state = DownloadState.Unchecked;
    Event.Add("PlotReviewDownloadState", Handle(self, self.OnPlotReviewDownloadState));
end
function M:OnClose()
    Event.Remove("PlotReviewDownloadState", Handle(self, self.RefreshState));
end
function M:OnUpdateUI(pData)
    self.m_storyReplayInfo = PlotViewModel.GetStoryReplayInfo(pData[1]);
    MgrRes.LoadSprite(self.ImgBg(), "PlotReview/Activity/Icon/" .. self.m_storyReplayInfo.eventcover);
    self.TextName().text = self.m_storyReplayInfo.name;
    local chapterInfo = ChapterLocalData.tab[tonumber(self.m_storyReplayInfo.chapterid)];
    if nil == chapterInfo then
        self.ImgMask().gameObject:SetActive(true);
        return;
    end
    local checkpoints = string.split(chapterInfo.simple,",");
    local isUnlock = StormControl.CheckPointLock(tonumber(checkpoints[1]));
    self.ImgMask().gameObject:SetActive(not isUnlock);
    if not isUnlock then
        self.ImgPlay().gameObject:SetActive(false);
        self.ImgDownload().gameObject:SetActive(false);
        return;
    end
    print("[PlotReview] PlotReviewItemActivity.OnUpdateUI. activity: " .. pData[1] .. ", resourceid: " .. self.m_storyReplayInfo.resourceid);
    if "" == self.m_storyReplayInfo.resourceid or "0" == self.m_storyReplayInfo.resourceid then
        self.ImgMask().gameObject:SetActive(true);
        self.ImgPlay().gameObject:SetActive(false);
        self.ImgDownload().gameObject:SetActive(false);
        return;
    end
    self:RefreshState();
end
function M:RefreshState()
    local tags = string.split(self.m_storyReplayInfo.resourceid,";");
    MgrRes.GetTotalDownloadCount(tags, function(bytes, msg)
        print("[PlotReview] PlotReviewItemActivity.OnUpdateUI.GetTotalDownloadCount. activity: " .. self.m_storyReplayInfo.activityid .. ", msg: " .. msg .. ", bytes: " .. bytes);
        if "success" == msg then
            if bytes > 0 then
                self.m_state = DownloadState.NeedDownload;
                self.ImgPlay().gameObject:SetActive(false);
                self.ImgDownload().gameObject:SetActive(true);
            else
                self.m_state = DownloadState.Downloaded;
                self.ImgPlay().gameObject:SetActive(true);
                self.ImgDownload().gameObject:SetActive(false);
            end
        else
            MgrUI.Pop(UID.PopTip_UI,{ msg },true);
        end
    end);
end
function M:OnPlotReviewDownloadState(activityId)
    if self.m_storyReplayInfo.activityid == activityId then
        self:RefreshState();
    end
end
return M