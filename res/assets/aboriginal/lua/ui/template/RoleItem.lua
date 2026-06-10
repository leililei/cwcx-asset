-- Code Auto Create Begin
local M = Class('RoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Touxiangdi','Img_Touxiangdi',2},{'Img_RoleIcon','Img_RoleIcon',2},{'OwnMask','OwnMask',2},{'Img_Iddi','Img_Iddi',2},{'Icon_Career','Icon_Career',2},{'Img_Kuang','Img_Kuang',2},
        -- UITemplate 列表
        {'RoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    self.RoleId = pData[1]
    self.parent = pData[2]
    self.RoleData = HeroControl.GetRoleDataByID(tonumber(self.RoleId))
    ---加载头像
    MgrRes.LoadQIcon(self.Img_RoleIcon(),self.RoleData.id)
    ---加载职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.RoleData.iconCareer)
    ---加载角色框
    MgrRes.LoadSprite(self.Img_Kuang(),self.RoleData.iconFrame)
    ---角色名
    self.Text_Name().text = self.RoleData.name
    ---是否拥有遮罩
    self.OwnMask().gameObject:SetActive(self.RoleData.lockState == false)
    ---点击查看技能拥有者
    UIEvent.LuaClick(self.ObjRoot.gameObject,function()

    end)
end

return M