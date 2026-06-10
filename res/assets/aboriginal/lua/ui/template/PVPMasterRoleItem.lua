-- Code Auto Create Begin
local M = Class('PVPMasterRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPMasterRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PanelEmpty','PanelEmpty',2},{'Img_HeadBG','PanelEmpty/Img_HeadBG',2},{'PanelNormal','PanelNormal',2},{'Bg','PanelNormal/Bg',2},{'BgSelf','PanelNormal/BgSelf',2},{'Img_HeadBG01','PanelNormal/Img_HeadBG',2},{'Img_HeadIcon','PanelNormal/Img_HeadBG/Img_HeadIcon',2},{'Img_Win','PanelNormal/Img_Win',2},
        -- UITemplate 列表
        {'PVPMasterRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Rank','PanelNormal/Text_Rank',20},{'Text_Name','PanelNormal/Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.PanelEmpty().gameObject:SetActive(true);
    self.PanelNormal().gameObject:SetActive(false);
end
function M:OnUpdateUI(pData)
    local info = pData[1];
    if nil == info.player then
        self.PanelEmpty().gameObject:SetActive(true);
        self.PanelNormal().gameObject:SetActive(false);
        return;
    end
    self.PanelEmpty().gameObject:SetActive(false);
    self.PanelNormal().gameObject:SetActive(true);
    self.Text_Name().text = info.player.nike;
    self.Text_Rank().text = "Rank " .. info.player.oldScoreRank;
    if info.match.winner == info.player.id then
        self.Img_Win().gameObject:SetActive(true);
    else
        self.Img_Win().gameObject:SetActive(false);
    end
    if PlayerControl.GetPlayerData().UID == info.player.id then
        self.Bg().gameObject:SetActive(false);
        self.BgSelf().gameObject:SetActive(true);
    else
        self.Bg().gameObject:SetActive(true);
        self.BgSelf().gameObject:SetActive(false);
    end
    PlayerControl.SetHeadIcon(self.Img_HeadIcon(), info.player.head);
end
return M