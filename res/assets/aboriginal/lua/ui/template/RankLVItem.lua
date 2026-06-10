-- Code Auto Create Begin
local M = Class('RankLVItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RankLVItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RankLVItem','/',2},{'Suo','Suo',2},{'SuoIcon','Suo/SuoIcon',2},
        -- UITemplate 列表
        {'RankLVItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_LV','Text_LV',20},
    }
end
-- Code Auto Create End

function M:OnInit()
    UIEvent.LuaClick(self.RankLVItem().gameObject,function()
        if self.pData == 0 then  return end
        self.parent:SetSkillListData(self.pData)
    end)
end

function M:OnUpdateUI(args)
    ---@type ShopItemData
    self.pData = args[1]
    self.idx = args[2]
    self.parent = args[3]

    if self.pData == 0 then
        self.Text_LV().text = ""
        self.Suo().gameObject:SetActive(false)
    else
        self.Text_LV().text = self.pData
        local level = self.parent.CurHero.skillLevel
        local equipIsMax =  self.parent.CurHero:CheckHeroEquipIsMax()
        if equipIsMax then
            level = level + 1
        end
        self.Suo().gameObject:SetActive(self.pData > level)
    end
end

return M