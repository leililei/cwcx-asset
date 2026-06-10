-- Code Auto Create Begin
local M = Class('YuetaItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/YuetaItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'di','Panel/di',2},{'di_difficult','Panel/di_difficult',2},{'di_hui','Panel/di_hui',2},{'di_clear','Panel/di_clear',2},{'Img_Suo','Panel/Img_Suo',2},{'IsAdopt','Panel/IsAdopt',2},{'Img_Select','Panel/Img_Select',2},{'Img_Select_difficult','Panel/Img_Select_difficult',2},
        -- UITemplate 列表
        {'YuetaItem','/',10},
        -- RawImage 列表
        {'YuetaItem01','/',15},
        -- TextMeshProUGUI 列表
        {'Text_TuijianLV','Panel/Text_TuijianLV',20},{'Text_Number','Panel/Text_Number',20},{'Text_Number_suo','Panel/Text_Number_suo',20},{'Text_Yitongguan','Panel/IsAdopt/Text_Yitongguan',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot,function()
        ---检查是否为空数据
        if self.pData.isEmpty then
            return
        end
        local index = tonumber(self.ObjRoot.name) - 3
        self.parent.TowerPointScroll:ScrollToCell(index,3500)
        StormViewModel.CurPointData = self.pData
        ---更新当前已选层属性
        self.parent:UpdatePointInfo()
    end)
end
function M:OnUpdateUI(pData)
    self.choose = false
    self.Img_Select().gameObject:SetActive(self.choose and self.pData.hard == 0)
    self.Img_Select_difficult().gameObject:SetActive(self.choose and self.pData.hard == 1)
    ---@type StormPointData
    self.pData = pData[1]
    self.parent = pData[2]
    self.Panel().gameObject:SetActive(not self.pData.isEmpty)
    if not self.pData.isEmpty then
        ---难度背景
        self.di().gameObject:SetActive(self.parent.hard == 0)
        self.di_difficult().gameObject:SetActive(self.parent.hard == 1)
        ---推荐等级
        self.Text_TuijianLV().text = MgrLanguageData.GetLanguageByKey("stormtower_ui_adviselevel") .. self.pData.towerLevel
        ---更新当前层数
        local floor = string.gmatch(self.pData.name,"%d+")
        local number = floor()
        if self.pData.hard == 0 then
            self.Text_Number().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_5"),number)    ---简单
        elseif self.pData.hard == 1 then
            self.Text_Number().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_11"),number)     ---困难
        end
        self.Text_Number_suo().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_8"),number)---换新
        ---是否解锁
        local lock = self.pData:CheckLock()
        self.Text_Number().gameObject:SetActive(lock)
        self.Text_Number_suo().gameObject:SetActive(not lock)
        self.Img_Suo().gameObject:SetActive(not lock)
        self.di_hui().gameObject:SetActive(not lock)
        ---是否完成所有条件
        local clear = self.pData:CheckMonthTowerTask()
        self.IsAdopt().gameObject:SetActive(clear)
        self.di_clear().gameObject:SetActive(clear)
        ---推荐等级两个都要满足
        self.Text_TuijianLV().gameObject:SetActive(not clear and lock)
    end
end

function M:ItemUpdate(pData)
    self.choose = pData[1]
    self.Img_Select().gameObject:SetActive(self.choose and self.pData.hard == 0)
    self.Img_Select_difficult().gameObject:SetActive(self.choose and self.pData.hard == 1)
end

return M