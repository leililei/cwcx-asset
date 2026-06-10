-- Code Auto Create Begin
local M = Class('ItemBagFilterToggle', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ItemBagFilterToggle.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ItemBagFilterToggle','/',2},{'Normal','Normal',2},{'HighLight','HighLight',2},
        -- UITemplate 列表
        {'ItemBagFilterToggle01','/',10},
        -- Toggle 列表
        {'ItemBagFilterToggle02','/',13},
        -- TextMeshProUGUI 列表
        {'Btn_TxtCN','Normal/Btn_TxtCN',20},{'Btn_TxtEN','Normal/Btn_TxtEN',20},{'Btn_TxtCN01','HighLight/Btn_TxtCN',20},{'Btn_TxtEN01','HighLight/Btn_TxtEN',20},
    }
end
-- Code Auto Create End
---背包道具筛选器template
function M:OnInit()
    self.HighLight().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    ---设置名称
    local st = string.split(pData[1],'_')
    self.Btn_TxtCN().text = st[1]
    self.Btn_TxtCN01().text = st[1]
    self.Btn_TxtEN().text = st[2]
    self.Btn_TxtEN01().text = st[2]
    ---添加回调
    self.CallBack = pData[2]
    ---添加事件
    Tools.ToggleValueChange(self.ItemBagFilterToggle02(),Handle(self,self.OnToggleClick),nil)
end
---点击事件
function M:OnToggleClick(isOn)
    self.Normal().gameObject:SetActive(not isOn)
    self.HighLight().gameObject:SetActive(isOn)
    if isOn then
        self.CallBack(0)
    end
end
return M