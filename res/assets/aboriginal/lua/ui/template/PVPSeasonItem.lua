-- Code Auto Create Begin
local M = Class('PVPSeasonItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPSeasonItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PVPSeasonItem','/',2},{'ImgSelect','ImgSelect',2},
        -- UITemplate 列表
        {'PVPSeasonItem01','/',10},
        -- Toggle 列表
        {'PVPSeasonItem02','/',13},
        -- TextMeshProUGUI 列表
        {'TextNormal','TextNormal',20},{'TextSelect','ImgSelect/TextSelect',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Tools.ToggleValueChange(self.PVPSeasonItem02(), function(isOn)
        self:OnToggleClicked(isOn);
    end);
end
function M:OnUpdateUI(pData)
    self.m_idx = pData[1];
    self.m_info = PVPViewModel.GetChampionHistoryInfo(self.m_idx, true);
    if nil == self.m_info then
        return;
    end
    local str = string.format(MgrLanguageData.GetLanguageByKey("masterpvpranking_ui1"), self.m_info.version);
    self.TextNormal().text = str;
    self.TextSelect().text = str;
    self.PVPSeasonItem02().group = pData[2];
end
function M:OnToggleClicked(isOn)
    if isOn then
        self.ImgSelect().gameObject:SetActive(true);
        Event.Go("PVPLegendSelectSeason", self.m_idx);
    else
        self.ImgSelect().gameObject:SetActive(false);
    end
end
return M