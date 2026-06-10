-- Code Auto Create Begin
local M = Class('PlayerSortToggle', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlayerSortToggle.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PlayerSortToggle','/',2},{'Normal','Normal',2},{'jiantou(hui)2','Normal/jiantou(hui)2',2},{'HighLight','HighLight',2},{'H_Normal','HighLight/H_Normal',2},{'kuang(dangqian)','HighLight/H_Normal/kuang(dangqian)',2},{'jiantou(cheng)','HighLight/H_Normal/jiantou(cheng)',2},{'H_HighLight','HighLight/H_HighLight',2},{'kuang(dangqian)01','HighLight/H_HighLight/kuang(dangqian)',2},{'jiantou(cheng)01','HighLight/H_HighLight/jiantou(cheng)',2},
        -- UITemplate 列表
        {'PlayerSortToggle01','/',10},
        -- Toggle 列表
        {'PlayerSortToggle02','/',13},{'HighLight01','HighLight',13},
        -- TextMeshProUGUI 列表
        {'Btn_SortText','Normal/Btn_SortText',20},{'Btn_SortText01','HighLight/H_Normal/Btn_SortText',20},{'Btn_SortText02','HighLight/H_HighLight/Btn_SortText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.HighLight().gameObject:SetActive(false)
    self.H_HighLight().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    ---设置名称
    local name = pData[1]
    self.Btn_SortText().text = name
    self.Btn_SortText01().text = name
    self.Btn_SortText02().text = name
    ---添加回调
    self.CallBack = pData[2]
    ---添加事件
    Tools.ToggleValueChange(self.PlayerSortToggle02(),Handle(self,self.OnSortClick),nil)
    ---添加子事件
    Tools.ToggleValueChange(self.HighLight01(),Handle(self,self.RiseClick),nil)

end
---排序事件
function M:OnSortClick(isOn)
    self.Normal().gameObject:SetActive(not isOn)
    self.HighLight().gameObject:SetActive(isOn)
    ---默认升序
    self.CallBack(true,0)
end
---升序降序事件
function M:RiseClick(isOn)
    self.H_Normal().gameObject:SetActive(not isOn)
    self.H_HighLight().gameObject:SetActive(isOn)
    self.CallBack(not isOn,0)
end
return M