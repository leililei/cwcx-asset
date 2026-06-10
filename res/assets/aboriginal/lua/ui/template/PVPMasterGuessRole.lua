-- Code Auto Create Begin
local M = Class('PVPMasterGuessRole', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPMasterGuessRole.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgBg','ImgBg',2},{'ImgHead','ImgBg/ImgHead',2},{'Select','ImgBg/Select',2},{'ImgArrow','ImgBg/Select/ImgArrow',2},{'ImgArrow01','ImgBg/Select/ImgArrow',2},
        -- UITemplate 列表
        {'PVPMasterGuessRole','/',10},
        -- TextMeshProUGUI 列表
        {'TextRank','ImgBg/TextRank',20},{'TextName','ImgBg/TextName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ImgBg().gameObject, Handle(self, self.OnClicked));
end
function M:OnUpdateUI(pData)
    self.m_player = pData[1];
    self.TextName().text = self.m_player.nike;
    self.TextRank().text = "Rank " .. self.m_player.oldScoreRank;
    PlayerControl.SetHeadIcon(self.ImgHead(), self.m_player.head);
    self.Select().gameObject:SetActive(pData[2]);
end
function M:OnClicked()
    Event.Go("PVPMasterGuessSelect", self.m_player.id);
end
return M