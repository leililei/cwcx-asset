-- Code Auto Create Begin
local M = Class('PassesPreviewItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PassesPreviewItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PassesPreviewItem','/',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'VFXItemIcon','RewardItemPreFab/VFXItemIcon',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab0','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab0',2},{'ItemStarPrefab1','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'ItemStarPrefab2','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'ItemStarPrefab3','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'ItemStarPrefab4','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'ItemStarPrefab5','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'Img_Received','RewardItemPreFab/Img_Received',2},{'Img_Gou','RewardItemPreFab/Img_Received/Img_Gou',2},
        -- Text 列表
        {'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',3},
        -- UITemplate 列表
        {'PassesPreviewItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_DaoJuJieShao','Text_DaoJuJieShao',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.StarPanel().gameObject:SetActive(false)
    self.Img_Received().gameObject:SetActive(false)
    UIEvent.LuaClick(self.RewardIconImg().gameObject,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{self.item,false,function() end},true)
    end)
end

function M:OnUpdateUI(args)
    local pData = args[2]
    local idx = args[3]
    ---@type ItemData
    local str = string.split(args[1],"_")
    local previewStr =  string.split(pData[5],";")
    self.item = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
    if self.item.goodsType == 4 and string.split(self.item.icon,"/")[1] ~= "Item" then
        MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..self.item.icon)
    else
        --带动画勋章
        local tab = HideLocalData.tab[self.item.id]
        if tab and tab.anime and tab.anime ~= "0" then
            Tools.ClearAllChild(self.VFXItemIcon().gameObject)
            self.RewardIconImg().color = Color(self.RewardIconImg().color.r,self.RewardIconImg().color.g,self.RewardIconImg().color.b,0)
            self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
            MgrRes.GetPrefab(self.vfx_path..tab.anime..".prefab",function(Obj)
                if Obj == nil then return end
                Obj.transform:SetParent(self.VFXItemIcon().gameObject.transform)
                Obj.transform.localPosition = Vector3.zero
                Obj.transform.localScale = Vector3(9,9,1)
            end)
        else
            Tools.ClearAllChild(self.VFXItemIcon().gameObject)
            self.RewardIconImg().color = Color(self.RewardIconImg().color.r,self.RewardIconImg().color.g,self.RewardIconImg().color.b,1)
            MgrRes.LoadSprite(self.RewardIconImg(),self.item.icon)
        end
    end
    self.Text_DaoJuJieShao().text = previewStr[idx]
    self.Img_ItemCountBg().gameObject:SetActive(false)
end


return M