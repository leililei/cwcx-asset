-- Code Auto Create Begin
local M = Class('GearBagFilterToggle', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GearBagFilterToggle.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'GearBagFilterToggle','/',2},{'Normal','Normal',2},{'HighLight','HighLight',2},
        -- UITemplate 列表
        {'GearBagFilterToggle01','/',10},
        -- Toggle 列表
        {'GearBagFilterToggle02','/',13},
        -- TextMeshProUGUI 列表
        {'Btn_FiltterText','Normal/Btn_FiltterText',20},{'Btn_FiltterText01','HighLight/Btn_FiltterText',20},
    }
end
-- Code Auto Create End
---背包核心筛选器template
function M:OnInit()
    self.HighLight().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    local name = pData[1]
    local callback = pData[2]
    
    ---添加回调
    self.CallBack = callback
    ---设置名称
    self.Btn_FiltterText().text = name
    self.Btn_FiltterText01().text = name
    ---添加事件
    Tools.ToggleValueChange(self.GearBagFilterToggle02(),Handle(self,self.OnToggleClick),nil)

    if pData[4] and pData[3] then
        local index = pData[3]
        local curIdx = pData[4] - 1
        self.Normal().gameObject:SetActive(index ~= curIdx)
        self.HighLight().gameObject:SetActive(index == curIdx)
    end
end
---点击事件
function M:OnToggleClick(isOn)
    self.Normal().gameObject:SetActive(not isOn)
    self.HighLight().gameObject:SetActive(isOn)
    self.CallBack(isOn,0)
end
return M