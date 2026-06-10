-- Code Auto Create Begin
local M = Class('AreaItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/AreaItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'AreaItem','/',2},{'Img_Normal','Img_Normal',2},{'Img_Sel','Img_Sel',2},
        -- UITemplate 列表
        {'AreaItem01','/',10},
        -- Toggle 列表
        {'AreaItem02','/',13},
        -- TextMeshProUGUI 列表
        {'Text_Normal','Img_Normal/Text_Normal',20},{'Time_Normal','Img_Normal/Time_Normal',20},{'Text_Sel','Img_Sel/Text_Sel',20},{'Time_Sel','Img_Sel/Time_Sel',20},
    }
end
-- Code Auto Create End

function M:OnInit()
    self.AreaItem02().group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup");
    Tools.ToggleValueChange(self.AreaItem02(), Handle(self, self.OnToggleValueChanged));
    self.areaIdx = -1;
end

local RefreshPingTimer = "AreaItem.RefreshPing";

function M:OnUpdateUI(pData)
    MgrTimer.Cancel(RefreshPingTimer .. "_" .. self.areaIdx);
    self.areaIdx = pData[1] - 1;
    self:RefreshPing();
    local areaName = MgrNet.CS:GetAreaName(self.areaIdx);
    self.Text_Sel().text = "[ " .. areaName .. " ]";
    self.Text_Normal().text = "[ " .. areaName .. " ]";
    local isOn = self.areaIdx == MgrNet.CS:GetAreaIdx();
    self.AreaItem02().isOn = isOn;
    self:OnToggleValueChanged(isOn);
end

function M:OnToggleValueChanged(isOn)
    if isOn then
        self.Img_Sel().gameObject:SetActive(true);
        self.Img_Normal().gameObject:SetActive(false);
        Event.Go("AreaSelect", self.areaIdx);
    else
        self.Img_Sel().gameObject:SetActive(false);
        self.Img_Normal().gameObject:SetActive(true);
    end
end

function M:RefreshPing()
    local isOpen = MgrNet.CS:GetAreaOpen(self.areaIdx);
    if not isOpen then
        self.Time_Sel().text = MgrLanguageData.GetLanguageByKey("loginpop_ui_tips31");
        self.Time_Normal().text = MgrLanguageData.GetLanguageByKey("loginpop_ui_tips31");
        self.Time_Sel().color = Color(0.7, 0.7, 0.7, 1);
        self.Time_Normal().color = Color(0.7, 0.7, 0.7, 1);
        self:DelayRefreshPing();
        return;
    end
    local pingTime = MgrNet.CS:GetAreaPing(self.areaIdx);
    if pingTime >= 3000 then
        self.Time_Sel().text = ">" .. pingTime .. " ms";
        self.Time_Normal().text = ">" .. pingTime .. " ms";
    else
        self.Time_Sel().text = pingTime .. " ms";
        self.Time_Normal().text = pingTime .. " ms";
    end
    if (pingTime <= 200) then
        self.Time_Sel().color = Color(0.22, 0.71, 0.17, 1);
        self.Time_Normal().color = Color(0.22, 0.71, 0.17, 1);
    elseif (pingTime <= 400) then
        self.Time_Sel().color = Color(0.88, 0.81, 0.21, 1);
        self.Time_Normal().color = Color(0.88, 0.81, 0.21, 1);
    else
        self.Time_Sel().color = Color(0.71, 0.17, 0.17, 1);
        self.Time_Normal().color = Color(0.71, 0.17, 0.17, 1);
    end
    self:DelayRefreshPing();
end

function M:DelayRefreshPing()
    MgrTimer.Cancel(RefreshPingTimer .. "_" .. self.areaIdx);
    MgrTimer.AddDelay(RefreshPingTimer .. "_" .. self.areaIdx,3, Handle(self, self.RefreshPing));
end

function M:OnClose()
    MgrTimer.Cancel(RefreshPingTimer .. "_" .. self.areaIdx);
end

return M