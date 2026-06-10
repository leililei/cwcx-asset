-- Code Auto Create Begin
local M = Class('OptionalPropsItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/OptionalPropsItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'OptionalPropsItem','/',2},{'Img_Selected','Img_Selected',2},{'ItemGo','ItemGo',2},{'WupinIcon','ItemGo/WupinIcon',2},{'Img_ItemCountPivot','ItemGo/Img_ItemCountPivot',2},{'Img_ItemCountBg_Wp','ItemGo/Img_ItemCountPivot/Img_ItemCountBg_Wp',2},
        -- Text 列表
        {'ItemRemainText','ItemGo/Img_ItemCountPivot/Img_ItemCountBg_Wp/ItemRemainText',3},
        -- UITemplate 列表
        {'OptionalPropsItem01','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---点击选择
    UIEvent.LuaClick(self.OptionalPropsItem().gameObject,function()
        ---如果当前选择已经是此物品再次点击取消选择
        if self.parent.CurSelect == self.pData then
            self.parent.CurSelect = nil
            self.parent:ReloadPropsScroll()  --刷新scroll
            self.parent:RefreshProps()
        else
            self.parent.CurSelect = self.pData
            self.parent:ReloadPropsScroll()  --刷新scroll
            self.parent:RefreshProps()
        end
    end)
end

function M:OnUpdateUI(args)
    self.pData = args[1]
    self.parent = args[2]
    ---@type ItemData
    self.ItemData = args[3]  --要消耗的道具
    local str = string.split(self.pData,"_")
    self.curItem = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))  --本道具
    MgrRes.LoadSprite(self.ItemGo(),self.curItem.iconFrame)  --物品框
    MgrRes.LoadSprite(self.WupinIcon(),self.curItem.icon)  --物品图片
    self.ItemRemainText().text = tonumber(str[3])   --物品数量
    if self.parent.CurSelect == self.pData then
        self.Img_Selected().gameObject:SetActive(true)
    else
        self.Img_Selected().gameObject:SetActive(false)
    end
end



return M