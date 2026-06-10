-- Code Auto Create Begin
local M = Class('ExpeditionRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ExpeditionRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ExpeditionRoleItem','/',2},{'Root','Root',2},{'Img_Touxiangdi','Root/Img_Touxiangdi',2},{'RoleIcon','Root/RoleIcon',2},{'Img_Kuang','Root/Img_Kuang',2},{'Text_Lv','Root/Text_Lv',2},{'zhiyeicon','Root/zhiyeicon',2},{'Img_Rankdi','Root/Img_Rankdi',2},{'EmptyStar','Root/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','Root/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','Root/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','Root/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','Root/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','Root/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','Root/JxStarPanel',2},{'JxStarPrefab','Root/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)','Root/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)','Root/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)','Root/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)','Root/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)','Root/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel','Root/StarPanel',2},{'StaPrefab','Root/StarPanel/StaPrefab',2},{'StaPrefab(1)','Root/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)','Root/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)','Root/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)','Root/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)','Root/StarPanel/StaPrefab (5)',2},{'Img_Select','Root/Img_Select',2},{'Img_SelectBG','Root/Img_Select/Img_SelectBG',2},{'Img_CheckMark','Root/Img_Select/Img_SelectBG/Img_CheckMark',2},{'Img_Expedition','Root/Img_Expedition',2},
        -- UITemplate 列表
        {'ExpeditionRoleItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Grade','Root/Text_Grade',20},{'Text_Rank','Root/Text_Rank',20},{'Text','Root/Img_Expedition/Text',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_Select().gameObject:SetActive(false)
    self.Img_Expedition().gameObject:SetActive(false)
end

function M:OnUpdateUI(pData)
    ---设置名称
    ---@type RoleData
    self.hero = pData[1]
    self.parent = pData[2]
    MgrRes.LoadQIcon(self.RoleIcon(),self.hero.skin)
    MgrRes.LoadSprite(self.Img_Kuang(),self.hero.iconFrame)
    MgrRes.LoadSprite(self.zhiyeicon(),self.hero.iconCareer)
    self.Text_Grade().text = self.hero.level
    
    --设置过技能等级且设置的技能等级小于10级
    if self.hero.heroFlag ~= 0 and self.hero.heroCurSkill < self.hero:GetHeroShowSkillLv() then
        self.Text_Rank().text =self.hero.heroCurSkill
    else
        self.Text_Rank().text =self.hero:GetHeroShowSkillLv()
    end

    if self.hero:CheckHeroEquipIsMax() then
        self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
    else
        self.Text_Rank().color = Color(1,1,1,1)
    end

    for i = 1, self.hero.maxStar do
        self.JxStarPanel().transform:GetChild(i - 1).gameObject:SetActive(false)
        self.StarPanel().transform:GetChild(i - 1).gameObject:SetActive(false)
    end
    for i = 1, self.hero.star do
        if self.hero.awaken then
            self.JxStarPanel().gameObject:SetActive(true)
            self.StarPanel().gameObject:SetActive(false)
            self.JxStarPanel().transform:GetChild(i - 1).gameObject:SetActive(true)
        else
            self.JxStarPanel().gameObject:SetActive(false)
            self.StarPanel().gameObject:SetActive(true)
            self.StarPanel().transform:GetChild(i - 1).gameObject:SetActive(true)
        end
    end

    self.isSelect = false
    self.isExpedition = false
    self.Img_Select().gameObject:SetActive(false)
    local tExpedRoleIds = self.parent:GetExpedRoleIds()
    for k,v in pairs(tExpedRoleIds) do
        if v == self.hero.id then
            self.Img_Select().gameObject:SetActive(true)
            self.isSelect = true
            self.hero.isSelect = true
            break
        end
    end

    self.Img_Expedition().gameObject:SetActive(false)
    for k,v in pairs(ArkControl.GetPlayerExpeditionData()) do
        for i,data in pairs(v) do
            for i, roleId in ipairs(data.heroIds) do
                if self.hero.id == roleId then
                    self.Img_Select().gameObject:SetActive(false)
                    self.Img_Expedition().gameObject:SetActive(true)
                    self.isExpedition = true
                    break
                end
            end
        end
    end

    ---点击角色
    UIEvent.LuaClick(self.ObjRoot,function()
        self:RoleOnClick()
    end)
end

---点击角色
function M:RoleOnClick()
    ---远征中角色不可点击
    if self.isExpedition then
        return
    end
    ---判断本任务是否超过人数上限
    local count = #self.parent:GetExpedRoleIds()
    
    ---如果超出上限
    if count >= 9 and self.isSelect == false then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("expeditionroleitem_tips1"),1},true)
        return
    end
    if self.isSelect then
        self.isSelect = false
        self.Img_Select().gameObject:SetActive(false)
        self.hero.isSelect = false
        self.hero.isRemove = true
        self.parent:RemoveRoleId(self.hero.id)
    else
        self.isSelect = true
        self.Img_Select().gameObject:SetActive(true)
        self.hero.isSelect = true
        self.hero.isRemove = false
        self.parent:AddRoleId(self.hero.id)
    end
--[[    ---刷新父界面的确认按钮样式
    self.parent:RefreshConfirmBtn(ArkViewModel.CurTaskID)]]
end

return M