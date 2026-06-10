-- Code Auto Create Begin
local M = Class('RoleStatusPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleStatusPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RoleStatusPrefab','/',2},{'Xuetiao','Xuetiao',2},{'Hptiao','Xuetiao/Hptiao',2},{'Hpdi','Xuetiao/Hpdi',2},
        -- UITemplate 列表
        {'RoleStatusPrefab01','/',10},{'StatusPopRoleItem','StatusPopRoleItem',10},
        -- TextMeshProUGUI 列表
        {'Hp','Xuetiao/Hpdi/Hp',20},{'HpText','Xuetiao/HpText',20},{'Text_RoleName','Text_RoleName',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type RoleData
    self.roleData = pData.hero
    self.HP = pData.hp

    self.StatusPopRoleItem():SetData({self.roleData,self})
    local tempCurHeroAttr = self.roleData:GetHeroAttrWithCoreAndEquip() ---当前角色属性
    local HPText = math.floor(tempCurHeroAttr.HP * self.HP / 10000)

    ---血条
    self.Hptiao().transform.localScale = Vector3(self.HP / 10000,1,1)
    ---血量
    self.HpText().text = HPText
    ---名字
    self.Text_RoleName().text = self.roleData.name
end

return M