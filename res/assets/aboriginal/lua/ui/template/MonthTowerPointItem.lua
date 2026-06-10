-- Code Auto Create Begin
local M = Class('MonthTowerPointItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/MonthTowerPointItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'di','Panel/di',2},{'Panel_Info','Panel/Panel_Info',2},{'RoleContent','Panel/Panel_Info/RoleContent',2},{'Img_Lock','Panel/Panel_Info/Img_Lock',2},{'Img_Tajianying','Panel/IsAdopt/Img_Tajianying',2},{'Img_Sanjiao','Panel/IsAdopt/Img_Sanjiao',2},
        -- Text 列表
        {'Text_Yitongguan','Panel/IsAdopt/Text_Yitongguan',3},{'Text_Clear','Panel/IsAdopt/Text_Clear',3},{'Text_Number','Panel/Text_Number',3},
        -- UITemplate 列表
        {'MonthTowerPointItem','/',10},{'TowerRoleItem_1','Panel/Panel_Info/RoleContent/TowerRoleItem_1',10},{'TowerRoleItem_2','Panel/Panel_Info/RoleContent/TowerRoleItem_2',10},{'TowerRoleItem_3','Panel/Panel_Info/RoleContent/TowerRoleItem_3',10},{'TowerRoleItem_4','Panel/Panel_Info/RoleContent/TowerRoleItem_4',10},{'TowerRoleItem_5','Panel/Panel_Info/RoleContent/TowerRoleItem_5',10},{'TowerRoleItem_6','Panel/Panel_Info/RoleContent/TowerRoleItem_6',10},{'TowerRoleItem_7','Panel/Panel_Info/RoleContent/TowerRoleItem_7',10},{'TowerRoleItem_8','Panel/Panel_Info/RoleContent/TowerRoleItem_8',10},
        -- RawImage 列表
        {'MonthTowerPointItem01','/',15},{'IsAdopt','Panel/IsAdopt',15},
    }
end
-- Code Auto Create End
---挑战层item初始化
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot,function()
        ---检查是否为空数据
        if self.pData.isEmpty then
            return
        end
        -----检查是否解锁
        --if not self.pData:CheckLock() then
        --    return
        --end
        local index = tonumber(self.ObjRoot.name) - 3
        self.parent.TowerPointScroll01():ScrollToCell(index,3500)
        StormViewModel.CurPointData = self.pData
        ---更新当前已选层属性
        self.parent:UpdatePointInfo()
    end)
    self.roleTps = {
        self.TowerRoleItem_1(),
        self.TowerRoleItem_2(),
        self.TowerRoleItem_3(),
        self.TowerRoleItem_4(),
        self.TowerRoleItem_5(),
        self.TowerRoleItem_6(),
        self.TowerRoleItem_7(),
        self.TowerRoleItem_8(),
    }
end
---@param pData table 一层数据，二StormTower_UI
function M:OnUpdateUI(pData)
    ---@type StormPointData
    self.pData = pData[1]
    self.parent = pData[2]
    self.Panel().gameObject:SetActive(not self.pData.isEmpty)
    if not self.pData.isEmpty then
        ---更新当前层数
        self.Text_Number().text = self.pData.name --string.format(MgrLanguageData.GetLanguageByKey("towerpointitem_floor"),self.pData.id % 1000 + 1)
        ---是否解锁
        local lock = self.pData:CheckLock()
        self.Img_Lock().gameObject:SetActive(not lock)
        self.RoleContent().gameObject:SetActive(lock)
        ---是否完成所有条件
        local clear = self.pData:CheckMonthTowerTask()
        self.IsAdopt().gameObject:SetActive(clear)
        self.Panel_Info().gameObject:SetActive(not clear)
        if not clear and lock then
            ---未达成所有条件且已解锁显示怪物图标
            for i = 1, #self.roleTps do
                local mData = self.pData.monsters[i]
                self.roleTps[i].gameObject:SetActive(mData ~= nil)
                if mData ~= nil then
                    self.roleTps[i]:SetData(mData)
                end
            end
        end
    end
end
return M