-- Code Auto Create Begin
local M = Class('GearBagTypeToggle', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GearBagTypeToggle.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'GearBagTypeToggle','/',2},{'Normal','Normal',2},{'HighLight','HighLight',2},{'jiaobiao(jianlue)','HighLight/jiaobiao(jianlue)',2},
        -- Text 列表
        {'BriefTextCN','Normal/BriefTextCN',3},{'BriefTextEN','Normal/BriefTextEN',3},{'BriefTextCN01','HighLight/BriefTextCN',3},{'BriefTextEN01','HighLight/BriefTextEN',3},
        -- UITemplate 列表
        {'GearBagTypeToggle01','/',10},
        -- Toggle 列表
        {'GearBagTypeToggle02','/',13},
    }
end
-- Code Auto Create End
---背包核心筛选器template
function M:OnInit()
    self.HighLight().gameObject:SetActive(false)
    ---添加事件
    Tools.ToggleValueChange(self.GearBagTypeToggle02(),Handle(self,self.OnToggleClick),nil)
end
function M:OnUpdateUI(pData)
    ---设置名称
    local st = string.split(pData[1],'_')
    self.BriefTextCN().text = st[1]
    self.BriefTextCN01().text = st[1]
    self.BriefTextEN().text = st[2]
    self.BriefTextEN01().text = st[2]
    ---添加回调
    self.CallBack = pData[2]
end
---点击事件
function M:OnToggleClick(isOn)
    self.Normal().gameObject:SetActive(not isOn)
    self.HighLight().gameObject:SetActive(isOn)
    self.CallBack(0)
end
return M