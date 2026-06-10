-- Code Auto Create Begin
local M = Class('OriginalItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/OriginalItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'OriginalItem','/',2},{'Img_Di','Img_Di',2},{'lihuiIcon','lihuiIcon',2},{'Suo','Suo',2},{'Img_Suo','Suo/Img_Suo',2},{'Name','Name',2},{'Fuhao','Fuhao',2},{'SginIcon','Fuhao/SginIcon',2},{'RedDotIcon','RedDotIcon',2},
        -- UITemplate 列表
        {'OriginalItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Name','Name/Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type OriginalAtlasData
    self.data = pData[1]
    self.parent = pData[2]
    ---头像
    MgrRes.LoadQIcon(self.lihuiIcon(),self.data.monsterId)
    ---是否已解锁
    if self.data:GetLockState() == true then
        self.lihuiIcon().gameObject:SetActive(true)
        self.Suo().gameObject:SetActive(false)
        self.Text_Name().text = self.data.name
    else
        self.lihuiIcon().gameObject:SetActive(false)
        self.Suo().gameObject:SetActive(true)
        self.Text_Name().text = MgrLanguageData.GetLanguageByKey("ui_qita_text68")
    end
    ---符号
    MgrRes.LoadSprite(self.SginIcon(),self.data.smallIcon)
    ---点击图片
    UIEvent.LuaClick(self.lihuiIcon().gameObject,function()
        self.parent:RePopPanel(self.data)
        ---红点更改状态
        self.data.showRedDot = false
    end)
    ---当前红点显示
    self.RedDotIcon().gameObject:SetActive(self.data.showRedDot)

end

return M