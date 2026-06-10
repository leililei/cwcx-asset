-- Code Auto Create Begin
local M = Class('CardPoolDetailPanel2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CardPoolDetailPanel2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_SSRbg','Img_SSRbg',2},{'StarPanel','Img_SSRbg/StarPanel',2},{'StarPregab_Xing1','Img_SSRbg/StarPanel/StarPregab_Xing1',2},{'StarPregab_Xing2','Img_SSRbg/StarPanel/StarPregab_Xing2',2},{'StarPregab_Xing3','Img_SSRbg/StarPanel/StarPregab_Xing3',2},{'CardPoolTipItem','CardPoolTipItem',2},{'Img_Di','CardPoolTipItem/Img_Di',2},{'Role','CardPoolTipItem/Role',2},{'Panel','CardPoolTipItem/Role/Panel',2},{'Img_Lihuidi','CardPoolTipItem/Role/Panel/Img_Lihuidi',2},{'Icon_Head','CardPoolTipItem/Role/Panel/Icon_Head',2},{'Icon_Frame','CardPoolTipItem/Role/Panel/Icon_Frame',2},{'Icon_Career','CardPoolTipItem/Role/Panel/Icon_Career',2},{'Img_Jiaobiao','CardPoolTipItem/Role/Img_Jiaobiao',2},{'RoleContent','RoleContent',2},
        -- UITemplate 列表
        {'CardPoolDetailPanel2','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','CardPoolTipItem/Role/Panel/Text_Level',20},{'Text_Lv','CardPoolTipItem/Role/Panel/Text_Lv',20},{'RoleNamelText','CardPoolTipItem/Role/RoleNamelText',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    local Rank = pData[1]
    local pData = pData[2]
    self.CardPoolTipItem().gameObject:SetActive(false)
    if Rank <= 2 then
        self.Img_SSRbg().gameObject:SetActive(false)
        return
    end
    local heroList = self:GetRoleInfo(pData.heroList,Rank)
    self:SetImgColor(Rank)
    self:SetStar(Rank - 1)
    self:UpdateItemList(heroList)
end

--设置顶部条颜色 4：橙色 3：紫色 2：蓝色
function M:SetImgColor(type)
    if type == 4 then
        self.Img_SSRbg().color = Color(0.831,0.376,0.247,1)
    elseif type == 3 then
        self.Img_SSRbg().color = Color(0.407,0.247,0.831,1)
    elseif type == 2 then
        self.Img_SSRbg().color = Color(0.247,0.454,0.831,1)
    end
end
--设置顶部条颜色 4：橙色 3：紫色 2：蓝色
function M:SetItemFrameColor(item,_star)
    local img = item.transform:Find("Role"):GetComponent("Image")
    if _star == 4 then
        img.color = Color(0.831,0.376,0.247,1)
    elseif _star == 3 then
        img.color = Color(0.407,0.247,0.831,1)
    elseif _star == 2 then
        img.color  = Color(0.247,0.454,0.831,1)
    end
end
--设置星级
function M:SetStar(num)
    self.StarPregab_Xing1().gameObject:SetActive(num >= 1)
    self.StarPregab_Xing2().gameObject:SetActive(num >= 2)
    self.StarPregab_Xing3().gameObject:SetActive(num >= 3)
end

--生成子物体对象列表
function M:UpdateItemList(list)
    Tools.ClearAllChild(self.RoleContent().gameObject)
    for i, v in ipairs(list) do
        local item = GameObject.Instantiate(self.CardPoolTipItem ().gameObject, self.RoleContent().gameObject.transform, false)

        MgrRes.LoadQIcon(item.transform:Find("Role/Panel/Icon_Head"):GetComponent("Image"),v.id)
        MgrRes.LoadSprite(item.transform:Find("Role/Panel/Icon_Frame"):GetComponent("Image"),v.iconBattleFrame)
        MgrRes.LoadSprite(item.transform:Find("Role/Panel/Icon_Career"):GetComponent("Image"),v.iconCareer)

        item.transform:Find("Role/Panel/Text_Level").transform:GetComponent("TextMeshProUGUI").text = v.level
        item.transform:Find("Role/RoleNamelText").transform:GetComponent("TextMeshProUGUI").text = v.name
        ---边框颜色
        self:SetItemFrameColor(item, v.rank)
        ---选人标记
        local SelRoleMark = item.transform:Find("Role/Img_Jiaobiao"):GetComponent("Image")
        SelRoleMark.gameObject:SetActive(CardDrawControl.GetSelectRole(v.id) ~= nil and true or false)
        if v.rank == 4 then
            MgrRes.LoadSprite(SelRoleMark, "Quality/Img_Jiaobiao_ssr")
        else
            MgrRes.LoadSprite(SelRoleMark, "Quality/Img_Jiaobiao_sr")
        end
        --- 已拥有标记
        local bHaveRole = v.lockState
        ---@type UnityEngine.Transform
        local HaveRoleMark = item.transform:Find("Role/Img_HaveRole")
        if HaveRoleMark and not Global.IsNil(HaveRoleMark) then
            HaveRoleMark.gameObject:SetActive(bHaveRole)
        end
        ---@type UnityEngine.CanvasGroup
        local PanelCanvasGroup = item.transform:Find("Role/Panel"):GetComponent("CanvasGroup")
        if PanelCanvasGroup and not Global.IsNil(PanelCanvasGroup) then
            if bHaveRole then
                PanelCanvasGroup.alpha = 0.5
            else
                PanelCanvasGroup.alpha = 1
            end
        end
        
        UIEvent.LuaClick(item.gameObject,function()
            if CardDrawControl.SetSelectRole(v) then
                SelRoleMark.gameObject:SetActive(false)
            else
                SelRoleMark.gameObject:SetActive(true)
            end
            Event.Go("FreePoolSelRole", v, false)
        end,nil,SelRoleMark)
     
        Tools.ReContentSizeGroup(self.RoleContent().gameObject)
        item.gameObject:SetActive(true)
    end
end

function M:GetRoleInfo(_list, _rank)
    local list = {}
    for i, v in ipairs(_list) do
        local roleD = HeroControl.GetRoleDataByID(v.roleID)
        if roleD and roleD.rank == _rank then
            table.insert(list, roleD)
        end
    end
    
    return list
end

return M