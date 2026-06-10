-- Code Auto Create Begin
local M = Class('PVPMasterGuessItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPMasterGuessItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},
        -- UITemplate 列表
        {'PVPMasterGuessItem','/',10},
        -- TextMeshProUGUI 列表
        {'TextTicket','TextTicket',20},{'TextMsg','TextMsg',20},
    }
end
-- Code Auto Create End
function M:OnInit()
end

function M:OnUpdateUI(pData)
    ---@type VoteHistory
    local info = pData[1];
    local index = pData[2]
    self.parent = pData[3]
    local playerInfo = PVPViewModel.GetMasterPlayerInfo(info.voteForPlayer);
    local nick = info.voteForPlayer;
    if nil ~= playerInfo then
        nick = playerInfo.nike;
    end
    if 0 == info.winner then
        self.TextTicket().text = info.voteNum;
        self.TextTicket().color = Color(1, 141 / 255, 26 / 255);
        self.TextMsg().text = string.format(MgrLanguageData.GetLanguageByKey("masterpvp_ui16_text1"), nick);
    elseif info.winner == info.voteForPlayer then
        self.TextTicket().text = "+" .. (info.voteChange - info.voteNum);
        self.TextTicket().color = Color(67 / 255, 207 / 255, 124 / 255);
        self.TextMsg().text = string.format(MgrLanguageData.GetLanguageByKey("masterpvp_ui16_text3"), nick);
    else
        self.TextTicket().text = (info.voteChange - info.voteNum);
        self.TextTicket().color = Color(212 / 255, 48 / 255, 48 / 255);
        self.TextMsg().text = string.format(MgrLanguageData.GetLanguageByKey("masterpvp_ui16_text2"), nick);
    end
end
return M
