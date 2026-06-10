-- Code Auto Create Begin
local M = Class('PlotReviewDownload_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlotReviewDownload_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlotReviewDownload_UI].prefab'
    self.Name = 'Form[PlotReviewDownload_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BtnBg','BtnBg',2},{'ImgFg','ImgFg',2},{'ImgLine1','ImgFg/ImgLine1',2},{'ImgLIne2','ImgFg/ImgLIne2',2},{'ImgProgressBg','ImgFg/ImgProgressBg',2},{'ImgProgressFg','ImgFg/ImgProgressBg/ImgProgressFg',2},{'BtnClose','ImgFg/BtnClose',2},{'BtnConfirm','ImgFg/BtnConfirm',2},{'BtnCancel','ImgFg/BtnCancel',2},
        -- TextMeshProUGUI 列表
        {'TextTip1','ImgFg/TextTip1',20},{'TextTip','ImgFg/TextTip',20},{'TextTip2','ImgFg/TextTip2',20},{'TextProgress','ImgFg/ImgProgressBg/TextProgress',20},{'Btn_Txt','ImgFg/BtnClose/Btn_Txt',20},{'Btn_Txt01','ImgFg/BtnConfirm/Btn_Txt',20},{'Btn_Txt02','ImgFg/BtnCancel/Btn_Txt',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.ClosePop));
    UIEvent.LuaClick(self.BtnClose().gameObject, Handle(self,self.ClosePop));
    UIEvent.LuaClick(self.BtnConfirm().gameObject, Handle(self,self.OnBtnConfirmClicked));
    UIEvent.LuaClick(self.BtnCancel().gameObject, Handle(self,self.OnBtnCancelClicked));
end
function M:ClosePop()
    MgrUI.ClosePop(self.Uid);
end
function M:OnShow(pData)
    self.m_tags = pData[1];
    self.m_activityId = pData[2];
    for i, v in pairs(self.m_tags) do
        print("[PlotReview] PlotReviewDownload_UI.OnShow. tags[" .. i .. "] = " .. v);
    end
    self:Clear();
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey));
end
function M:OnShowFinish()
    MgrRes.GetTotalDownloadCount(self.m_tags, function(bytes, msg)
        print("[PlotReview] PlotReviewDownload_UI.OnShowFinish.GetTotalDownloadCount. msg: " .. msg .. ", bytes: " .. bytes);
        if "success" == msg then
            if bytes > 0 then
                local bytesStr = "";
                if bytes < 1024 then
                    bytesStr = bytes .. " B";
                else
                    bytes = bytes / 1024;
                    if bytes < 1024 then
                        bytesStr = math.floor(bytes) .. " K";
                    else
                        bytes = bytes / 1024;
                        bytesStr = math.floor(bytes) .. " M";
                    end
                end
                self.TextTip().text = string.format(MgrLanguageData.GetLanguageByKey("ui_storyreplay_download_text3"), bytesStr);
            else
                MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_storyreplay_download_text1"), function()
                    self:ClosePop();
                end, nil, 4 },true);
            end
        else
            MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("downloadpanel_tips2"), function()
                self:ClosePop();
            end},true);
        end
    end);
end
function M:OnBtnConfirmClicked()
    self.BtnConfirm().gameObject:SetActive(false);
    self.BtnClose().gameObject:SetActive(false);
    self.BtnCancel().gameObject:SetActive(true);
    self.ImgProgressBg().gameObject:SetActive(true);
    self.ImgProgressFg().fillAmount = 0;
    print("[PlotReview] PlotReviewDownload_UI.OnBtnConfirmClicked.");
    MgrRes.StartDownload(Handle(self,self.OnDownloadProgress), Handle(self,self.OnDownloadFinish));
end
function M:OnBtnCancelClicked()
    MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_storyreplay_download_text8"), function()
        MgrRes.CancelDownload();
        self:ClosePop();
    end, nil, 2 },true);
end
function M:OnDownloadProgress(percent, downloadedBytes, totalBytes)
    print("[PlotReview] PlotReviewDownload_UI.OnDownloadProgress. percent: " .. percent .. ", bytes: " .. downloadedBytes .. ", total: " .. totalBytes);
    self.ImgProgressFg().fillAmount = percent;
    self.TextProgress().text = string.format(MgrLanguageData.GetLanguageByKey("ui_storyreplay_download_text6"), math.floor(percent * 100) .. "%");
end
function M:OnDownloadFinish(code, msg)
    print("[PlotReview] PlotReviewDownload_UI.OnDownloadFinish. code: " .. code .. ", msg: " .. msg);
    if -1 ~= code then
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_storyreplay_download_text1"), function()
            Event.Go("PlotReviewDownloadState", self.m_activityId);
            self:ClosePop();
        end, nil, 4 },true);
    else
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("downloadpanel_tips2"), function()
            self:ClosePop();
        end},true);
    end
end
function M:Clear()
    self.BtnConfirm().gameObject:SetActive(true);
    self.BtnClose().gameObject:SetActive(true);
    self.BtnCancel().gameObject:SetActive(false);
    self.ImgProgressBg().gameObject:SetActive(false);
    self.ImgProgressFg().fillAmount = 0;
    self.TextProgress().text = "";
end
return M