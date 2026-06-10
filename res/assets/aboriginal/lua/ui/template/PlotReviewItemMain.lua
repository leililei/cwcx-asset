-- Code Auto Create Begin
local M = Class('PlotReviewItemMain', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlotReviewItemMain.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PlotReviewItemMain','/',2},{'ImgBg','ImgBg',2},{'ImgMask','ImgMask',2},{'ImgLock','ImgMask/ImgLock',2},
        -- UITemplate 列表
        {'PlotReviewItemMain01','/',10},
        -- TextMeshProUGUI 列表
        {'TextName','TextName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot, function()
        ArtAtlasControl.OpenPlotAtlasUI(1, self.m_chapterInfo.scroll);
    end);
    UIEvent.LuaClick(self.ImgMask().gameObject, function()
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("plotreplay_ui_tips1")},true);
    end);
end
function M:OnUpdateUI(pData)
    self.m_chapterInfo = ChapterLocalData.tab[pData[1]];
    MgrRes.LoadSprite(self.ImgBg(), pData[2]);
    self.TextName().text = self.m_chapterInfo.scrollname;
    --self.isUnlock = StormControl.CheckScrollLock(pData[1]);
    -- 这里检查关卡是否“解锁”，而点进去检查的是关卡是否“通过”，现统一检查逻辑
    local scrollData = StormControl.GetStormScrollById(pData[1])
    local bUnlock = false
    if scrollData then
        bUnlock = StormControl.CheckPointPass(scrollData.points[1])
    end
    --self.ImgMask().gameObject:SetActive(not self.isUnlock);
    self.ImgMask().gameObject:SetActive(not bUnlock);
end
return M