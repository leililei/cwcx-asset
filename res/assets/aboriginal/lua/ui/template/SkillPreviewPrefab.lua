-- Code Auto Create Begin
local M = Class('SkillPreviewPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SkillPreviewPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SkillPreviewPrefab','/',2},{'Bg_Selected','Bg_Selected',2},{'Bg_Unselected','Bg_Unselected',2},{'AtkRangeUnlockIcon','AtkRangeUnlockIcon',2},{'jinengkuang','jinengkuang',2},{'rankkuang','rankkuang',2},{'SkillPreviewPanel','SkillPreviewPanel',2},{'RoleSkillIcon1','SkillPreviewPanel/RoleSkillIcon1',2},{'UpgradeIcon','SkillPreviewPanel/RoleSkillIcon1/UpgradeIcon',2},{'jiaobiao(xuanzhong)(1)','SkillPreviewPanel/RoleSkillIcon1/UpgradeIcon/jiaobiao(xuanzhong) (1)',2},{'UnlockIcon','SkillPreviewPanel/RoleSkillIcon1/UnlockIcon',2},{'jiaobiao(xuanzhong)','SkillPreviewPanel/RoleSkillIcon1/UnlockIcon/jiaobiao(xuanzhong)',2},{'RoleSkillIcon2','SkillPreviewPanel/RoleSkillIcon2',2},{'UpgradeIcon01','SkillPreviewPanel/RoleSkillIcon2/UpgradeIcon',2},{'jiaobiao(xuanzhong)01','SkillPreviewPanel/RoleSkillIcon2/UpgradeIcon/jiaobiao(xuanzhong)',2},{'UnlockIcon01','SkillPreviewPanel/RoleSkillIcon2/UnlockIcon',2},{'jiaobiao(xuanzhong)(1)01','SkillPreviewPanel/RoleSkillIcon2/UnlockIcon/jiaobiao(xuanzhong) (1)',2},{'RoleSkillIcon3','SkillPreviewPanel/RoleSkillIcon3',2},{'UpgradeIcon02','SkillPreviewPanel/RoleSkillIcon3/UpgradeIcon',2},{'jiaobiao(xuanzhong)02','SkillPreviewPanel/RoleSkillIcon3/UpgradeIcon/jiaobiao(xuanzhong)',2},{'UnlockIcon02','SkillPreviewPanel/RoleSkillIcon3/UnlockIcon',2},{'jiaobiao(xuanzhong)(1)02','SkillPreviewPanel/RoleSkillIcon3/UnlockIcon/jiaobiao(xuanzhong) (1)',2},{'RoleSkillIcon4','SkillPreviewPanel/RoleSkillIcon4',2},{'UpgradeIcon03','SkillPreviewPanel/RoleSkillIcon4/UpgradeIcon',2},{'jiaobiao(xuanzhong)03','SkillPreviewPanel/RoleSkillIcon4/UpgradeIcon/jiaobiao(xuanzhong)',2},{'UnlockIcon03','SkillPreviewPanel/RoleSkillIcon4/UnlockIcon',2},{'jiaobiao(xuanzhong)(1)03','SkillPreviewPanel/RoleSkillIcon4/UnlockIcon/jiaobiao(xuanzhong) (1)',2},{'ImageSuo','SkillPreviewPanel/RoleSkillIcon4/ImageSuo',2},{'Image','SkillPreviewPanel/RoleSkillIcon4/ImageSuo/Image',2},{'RoleSkillRangePanel','RoleSkillRangePanel',2},{'RoleAtkRangeImg','RoleSkillRangePanel/RoleAtkRangeImg',2},{'Img_Zuo','RoleSkillRangePanel/Img_Zuo',2},{'Img_You','RoleSkillRangePanel/Img_You',2},
        -- Text 列表
        {'UpgradeText','AtkRangeUnlockIcon/UpgradeText',3},{'RankName','rankkuang/RankName',3},{'RankText','rankkuang/RankText',3},{'AtkNameText','AtkNameText',3},{'UpgradeText01','SkillPreviewPanel/RoleSkillIcon1/UpgradeIcon/UpgradeText',3},{'UpgradeText02','SkillPreviewPanel/RoleSkillIcon1/UnlockIcon/UpgradeText',3},{'UpgradeText03','SkillPreviewPanel/RoleSkillIcon2/UpgradeIcon/UpgradeText',3},{'UpgradeText04','SkillPreviewPanel/RoleSkillIcon2/UnlockIcon/UpgradeText',3},{'UpgradeText05','SkillPreviewPanel/RoleSkillIcon3/UpgradeIcon/UpgradeText',3},{'UpgradeText06','SkillPreviewPanel/RoleSkillIcon3/UnlockIcon/UpgradeText',3},{'UpgradeText07','SkillPreviewPanel/RoleSkillIcon4/UpgradeIcon/UpgradeText',3},{'UpgradeText08','SkillPreviewPanel/RoleSkillIcon4/UnlockIcon/UpgradeText',3},
        -- UITemplate 列表
        {'SkillPreviewPrefab01','/',10},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    local RoleAttr = pData[1]
    self.parent = pData[2]
    local idx = pData[3] - 1
    ---判断职业类型
    if RoleAttr.Occupation == 4 then
        MgrRes.LoadSprite(self.RoleAtkRangeImg(),"AtkRange/SupportRange/"..RoleAttr.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.RoleAtkRangeImg(),"AtkRange/OtherRange/"..RoleAttr.AttackRangeTexture)
    end
    self.AtkRangeUnlockIcon().gameObject:SetActive(false)
    self.UnlockIcon().gameObject:SetActive(false)
    self.UpgradeIcon().gameObject:SetActive(false)
    self.UnlockIcon01().gameObject:SetActive(false)
    self.UpgradeIcon01().gameObject:SetActive(false)
    self.UnlockIcon02().gameObject:SetActive(false)
    self.UpgradeIcon02().gameObject:SetActive(false)
    self.UnlockIcon03().gameObject:SetActive(false)
    self.UpgradeIcon03().gameObject:SetActive(false)
    local lv = self.parent.CurHero.skillLevel
    if self.parent.CurHero:CheckHeroEquipIsMax() then
        lv = lv +1
    end
    ---如果技能与自身技能等级相等则显示高亮背景
    if RoleAttr.SkillLV == lv then
        -- statements
        self.Bg_Selected().gameObject:SetActive(true)
        self.Bg_Unselected().gameObject:SetActive(false)
        self.RankText().text="<color=#ffc841>"..idx.."</color>".."<color=#FFFFFF><size=65>/"..RoleAttr.SkillMaxLV.."</size></color>"
        self.AtkNameText().text="<color=#FFFFFF>"..RoleAttr.AtkName.."</color>"
    else
        self.AtkNameText().text= RoleAttr.AtkName
        self.RankText().text=idx.."<color=#7B7B7B><size=65>/"..RoleAttr.SkillMaxLV.."</size></color>"
        self.Bg_Selected().gameObject:SetActive(false)
        self.Bg_Unselected().gameObject:SetActive(true)
    end
    --技能Icon初始化
    --技能图标1、2、3、4
    if RoleAttr.AtkRangeIsNew then
        -- 新解锁
        self.AtkRangeUnlockIcon().gameObject:SetActive(true)
    else
        self.AtkRangeUnlockIcon().gameObject:SetActive(false)
    end
    if self.parent.CurHero.skillDir == 0 then
        self.Img_Zuo().gameObject:SetActive(true)
        self.Img_You().gameObject:SetActive(false)
    else
        self.Img_Zuo().gameObject:SetActive(false)
        self.Img_You().gameObject:SetActive(true)
    end
    if RoleAttr.Skill_1_example[1]~=nil then
        self.RoleSkillIcon1().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.RoleSkillIcon1(),"Skill/"..RoleAttr.Skill_1_example[1].Icon)
        UIEvent.LuaClick(self.RoleSkillIcon1().gameObject,Handle(self, function ()
            -- statements
            self.parent.index = 1
            self.parent.RoleSkillDetailPanel().gameObject:SetActive(true)
            self.parent.RoleInfoPreview().gameObject:SetActive(false)
            self.parent.RoleSkillPreview().gameObject:SetActive(false)
            self.parent:InitRoleSkillPreviewPanel(RoleAttr.Skill_1_example)
        end))
        if RoleAttr.Skill_1_IsSLv == true then
            self.UnlockIcon().gameObject:SetActive(true)
        else
            self.UnlockIcon().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon().gameObject:SetActive(false)
        for key_example, value_example in pairs(RoleAttr.Skill_1_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon().gameObject:SetActive(true)
                break
            end
        end
    else
        self.RoleSkillIcon1().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.RoleSkillIcon1(),"Skill/".."icon_skill_empty")
    end
    if RoleAttr.Skill_2_example[1]~=nil then
        self.RoleSkillIcon2().gameObject:SetActive(true)
        UIEvent.LuaClick(self.RoleSkillIcon2().gameObject,Handle(self, function ()
            -- statements
            self.parent.index = 1
            self.parent.RoleSkillDetailPanel().gameObject:SetActive(true)
            self.parent.RoleInfoPreview().gameObject:SetActive(false)
            self.parent.RoleSkillPreview().gameObject:SetActive(false)
            self.parent:InitRoleSkillPreviewPanel(RoleAttr.Skill_2_example)
        end))
        MgrRes.LoadSprite(self.RoleSkillIcon2(),"Skill/"..RoleAttr.Skill_2_example[1].Icon)
        --此处代码判断是否该等级解锁技能
        if  RoleAttr.Skill_2_IsSLv == true then
            self.UnlockIcon01().gameObject:SetActive(true)
        else
            self.UnlockIcon01().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon01().gameObject:SetActive(false)
        for key_example, value_example in pairs(RoleAttr.Skill_2_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon01().gameObject:SetActive(true)
                break
            end
        end
    else
        self.RoleSkillIcon2().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.RoleSkillIcon2(),"Skill/".."icon_skill_empty")
    end
    if RoleAttr.Skill_3_example[1]~=nil then
        self.RoleSkillIcon3().gameObject:SetActive(true)
        UIEvent.LuaClick(self.RoleSkillIcon3().gameObject,Handle(self, function ()
            -- statements
            self.parent.index = 1
            self.parent.RoleSkillDetailPanel().gameObject:SetActive(true)
            self.parent.RoleInfoPreview().gameObject:SetActive(false)
            self.parent.RoleSkillPreview().gameObject:SetActive(false)
            self.parent:InitRoleSkillPreviewPanel(RoleAttr.Skill_3_example)
        end))
        MgrRes.LoadSprite(self.RoleSkillIcon3(),"Skill/"..RoleAttr.Skill_3_example[1].Icon)
        --此处代码判断是否该等级解锁技能
        if RoleAttr.Skill_3_IsSLv == true then
            self.UnlockIcon02().gameObject:SetActive(true)
        else
            self.UnlockIcon02().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon02().gameObject:SetActive(false)
        for key_example, value_example in pairs(RoleAttr.Skill_3_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon02().gameObject:SetActive(true)
                break
            end
        end
    else
        self.RoleSkillIcon3().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.RoleSkillIcon3(),"Skill/".."icon_skill_empty")
    end
    if RoleAttr.Skill_4_example[1]~=nil then
        if RoleAttr.IsAwaken==true or RoleAttr.IsAwaken==1 then
            self.ImageSuo().gameObject:SetActive(false)
        else
            self.ImageSuo().gameObject:SetActive(true)
        end
        self.RoleSkillIcon4().gameObject:SetActive(true)
        UIEvent.LuaClick(self.RoleSkillIcon4().gameObject,Handle(self, function ()
            -- statements
            self.parent.index = 1
            self.parent.RoleSkillDetailPanel().gameObject:SetActive(true)
            self.parent.RoleInfoPreview().gameObject:SetActive(false)
            self.parent.RoleSkillPreview().gameObject:SetActive(false)
            self.parent:InitRoleSkillPreviewPanel(RoleAttr.Skill_4_example)
        end))
        MgrRes.LoadSprite(self.RoleSkillIcon4(),"Skill/"..RoleAttr.Skill_4_example[1].Icon)
        --此处代码判断是否该等级解锁技能
        if RoleAttr.Skill_4_IsSLv == true then
            self.UnlockIcon03().gameObject:SetActive(true)
        else
            self.UnlockIcon03().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon03().gameObject:SetActive(false)
        for key_example, value_example in pairs(RoleAttr.Skill_4_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon03().gameObject:SetActive(true)
                break
            end
        end
    else
        self.RoleSkillIcon4().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.RoleSkillIcon4(),"Skill/".."icon_skill_empty")
    end
end
return M