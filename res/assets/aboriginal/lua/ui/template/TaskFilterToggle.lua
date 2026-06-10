-- Code Auto Create Begin
local M = Class('TaskFilterToggle', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/TaskFilterToggle.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Normal','Normal',2},{'NormalIcon','Normal/NormalIcon',2},{'HighLight','HighLight',2},{'NormalIcon01','HighLight/NormalIcon',2},{'RedDotIcon','RedDotIcon',2},
        -- UITemplate 列表
        {'TaskFilterToggle','/',10},
        -- Toggle 列表
        {'TaskFilterToggle01','/',13},
        -- TextMeshProUGUI 列表
        {'Btn_FiltterText','Normal/Btn_FiltterText',20},{'Btn_EnFiltterText','Normal/Btn_EnFiltterText',20},{'Btn_FiltterText01','HighLight/Btn_FiltterText',20},{'Btn_EnFiltterText01','HighLight/Btn_EnFiltterText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Normal().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    local name =JNStrTool.strSplit("_",pData[1])
    local callback = pData[2]
    ---添加回调
    self.CallBack = callback
    ---设置名称
    self.Btn_FiltterText().text = name[1]
    self.Btn_FiltterText01().text = name[1]
    self.Btn_EnFiltterText().text = name[2]
    self.Btn_EnFiltterText01().text = name[2]
    ---设置图片
    MgrRes.LoadSprite(self.NormalIcon(),"Date/"..name[3].."h")
    MgrRes.LoadSprite(self.NormalIcon01(),"Date/"..name[3].."n")
    ---添加事件
    Tools.ToggleValueChange(self.TaskFilterToggle01(),Handle(self,self.OnToggleClick),nil)

end
---点击事件
function M:OnToggleClick(isOn)
    self.Normal().gameObject:SetActive(isOn)
    self.HighLight().gameObject:SetActive(not isOn)
    if isOn then
        self.CallBack(isOn,0)
    end
end
return M