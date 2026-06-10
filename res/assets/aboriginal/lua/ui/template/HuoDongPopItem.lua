-- Code Auto Create Begin
local M = Class('HuoDongPopItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HuoDongPopItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'HuoDongPopItem','/',2},{'StageItem','StageItem',2},{'ItemGo','ItemGo',2},{'WupinIcon','ItemGo/WupinIcon',2},{'Img_ItemCountPivot','ItemGo/Img_ItemCountPivot',2},{'Img_ItemCountBg_Wp','ItemGo/Img_ItemCountPivot/Img_ItemCountBg_Wp',2},{'Img_Received','Img_Received',2},
        -- Text 列表
        {'ItemRemainText','ItemGo/Img_ItemCountPivot/Img_ItemCountBg_Wp/ItemRemainText',3},
        -- UITemplate 列表
        {'HuoDongPopItem01','/',10},
        -- TextMeshProUGUI 列表
        {'StageText','StageItem/StageText',20},{'Text_Name','Img_Received/Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(args)
    ---@type ItemData
    self.pData = args[1]
    self.parent = args[2]
    self.number = args[4]
    MgrRes.LoadSprite(self.ItemGo(),self.pData.iconFrame)  --物品框
    MgrRes.LoadSprite(self.WupinIcon(),self.pData.icon)  --物品图片
    self.ItemRemainText().text = self.pData.count   --物品数量
    if self.pData.isReceive == 1 then
        self.Img_Received().gameObject:SetActive(true)
    else
        self.Img_Received().gameObject:SetActive(false)
    end
    self.StageText().text =  string.format(MgrLanguageData.GetLanguageByKey("newcomeactivities_ui_stage"),self.pData.rankId)
end


return M