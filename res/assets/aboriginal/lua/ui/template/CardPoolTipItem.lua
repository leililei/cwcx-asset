-- Code Auto Create Begin
local M = Class('CardPoolTipItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CardPoolTipItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'CardPoolTipItem','/',2},{'VoidGear','VoidGear',2},{'jijiadi','VoidGear/jijiadi',2},{'VoidGearIconImg','VoidGear/jijiadi/VoidGearIconImg',2},{'BrisIconImg','VoidGear/jijiadi/BrisIconImg',2},{'VoidRankKuangImg','VoidGear/VoidRankKuangImg',2},{'Role','Role',2},{'Panel','Role/Panel',2},{'Img_Lihuidi','Role/Panel/Img_Lihuidi',2},{'Icon_Head','Role/Panel/Icon_Head',2},{'Icon_Frame','Role/Panel/Icon_Frame',2},{'Icon_Career','Role/Panel/Icon_Career',2},{'Item','Item',2},{'RewardRankImg','Item/RewardRankImg',2},{'RewardIconImg','Item/RewardIconImg',2},{'StarPanel','Item/StarPanel',2},{'ItemStarRoot','Item/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Item/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'HighLight','Item/StarPanel/ItemStarRoot/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','Item/Img_ItemCountBg',2},{'TimeCountDownPanel','Item/TimeCountDownPanel',2},{'shijian2','Item/TimeCountDownPanel/shijian2',2},{'Probability','Probability',2},
        -- UITemplate 列表
        {'CardPoolTipItem01','/',10},
        -- TextMeshProUGUI 列表
        {'VoidGearNamelText','VoidGear/VoidGearNamelText',20},{'Text_Level','Role/Panel/Text_Level',20},{'Text_Lv','Role/Panel/Text_Lv',20},{'RoleNamelText','Role/RoleNamelText',20},{'ItemCountText','Item/Img_ItemCountBg/ItemCountText',20},{'CountDownText','Item/TimeCountDownPanel/CountDownText',20},{'RewardNamelText','Item/RewardNamelText',20},{'Text_Probability','Probability/Text_Probability',20},
    }
end
-- Code Auto Create End
require("LocalData/DropLocalData")
function M:OnInit()

end

function M:OnUpdateUI(pData)
    ---@type AchievementTaskData
    self.pData = pData[1]
    self.parent = pData[2]
    self.Role().gameObject:SetActive(self.parent.cardInfo.cardType == 1)
    self.VoidGear().gameObject:SetActive(self.parent.cardInfo.cardType ~= 1)

    if self.parent.cardInfo.cardType == 1 then
        local roleID = tonumber(string.split(self.pData,'_')[2])
        local heroData = HeroControl.GetRoleDataByID(roleID)
        self.Text_Probability().text = (math.floor(self:GetRoleProbability(roleID) *  self.parent:GetPoolWeight() * 10000) * 0.01) .. "%"

        MgrRes.LoadQIcon(self.Icon_Head(),heroData.skin)
        MgrRes.LoadSprite(self.Icon_Frame(),heroData.iconBattleFrame)
        MgrRes.LoadSprite(self.Icon_Career(),heroData.iconCareer)
        self.Text_Level().text = heroData.level
        self.RoleNamelText().text = heroData.name
    else
        local equipID = tonumber(string.split(self.pData,'_')[2])
        local _RoleEquip = RoleequipmentLocalData.tab[equipID]
        MgrRes.LoadSprite(self.VoidGearIconImg(),"Equip/".._RoleEquip[4])
        MgrRes.LoadSprite(self.VoidRankKuangImg(),"Quality/GearRankKuang_".._RoleEquip[6])
        self.VoidGearNamelText().text = _RoleEquip[2]
        self.Text_Probability().text = (math.floor(self:GetRoleProbability(equipID) *  self.parent:GetPoolWeight() * 10000) * 0.01) .. "%"
    end

end

--获得当前角色概率
function M:GetRoleProbability(roleID)
    local data = DropLocalData.tab[self.parent:GetDropID()]
    local str = string.split(data[4],',')
    local weight = 0
    local curWeight = 0
    for i, v in ipairs(str) do
        local temp = string.split(v,'_')
        if roleID == tonumber(temp[2]) then
            curWeight = tonumber(temp[4])
        end
        weight = weight + tonumber(temp[4])
    end
    return curWeight / weight
end


return M