-- Code Auto Create Begin
local M = Class('RolePopitem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RolePopitem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'bg','bg',2},{'RoleInfo','RoleInfo',2},{'RoleIcon','RoleInfo/RoleIcon',2},{'Img_Lihuidi','RoleInfo/Img_Lihuidi',2},{'jianbiandi','RoleInfo/jianbiandi',2},{'RankBG','RoleInfo/RankBG',2},{'StarPregab_UnJueXing','RoleInfo/StarPregab_UnJueXing',2},{'StarPregab_JueXing','RoleInfo/StarPregab_JueXing',2},{'StarPanel','RoleInfo/StarPanel',2},{'ZhiyeIconImg','RoleInfo/ZhiyeIconImg',2},{'AttackRange','AttackRange',2},{'Range','AttackRange/Range',2},{'Img_Zuo','AttackRange/Img_Zuo',2},{'Img_You','AttackRange/Img_You',2},{'TxtBg','AttackRange/TxtBg',2},{'RoleSkillIconPanel','RoleSkillIconPanel',2},{'RoleSkillIconImg1','RoleSkillIconPanel/RoleSkillIconImg1',2},{'RoleSkillIconImg2','RoleSkillIconPanel/RoleSkillIconImg2',2},{'RoleSkillIconImg3','RoleSkillIconPanel/RoleSkillIconImg3',2},{'RoleSkillIconImg4','RoleSkillIconPanel/RoleSkillIconImg4',2},{'RoleSkillIconImg5','RoleSkillIconPanel/RoleSkillIconImg5',2},{'Img_Jinengwenzidi','RoleSkillIconPanel/RoleSkillIconImg5/Img_Jinengwenzidi',2},
        -- Text 列表
        {'OccText','AttackRange/TxtBg/OccText',3},{'AttackTargetText','AttackRange/TxtBg/AttackTargetText',3},{'Text_Jinengwenzi','RoleSkillIconPanel/RoleSkillIconImg5/Img_Jinengwenzidi/Text_Jinengwenzi',3},
        -- UITemplate 列表
        {'RolePopitem','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.StarPregab_UnJueXing().gameObject:SetActive(false)
    self.StarPregab_JueXing().gameObject:SetActive(false)
end
---@param pData RoleData
function M:OnUpdateUI(pData)
    ---@type RoleData
    self.heroData = pData[1]
    local attr = self.heroData:GetHeroAttr()
    MgrRes.LoadQIcon(self.RoleIcon(),self.heroData.id)
    MgrRes.LoadSprite(self.RankBG(),self.heroData.iconFrame)
    MgrRes.LoadSprite(self.ZhiyeIconImg(),self.heroData.iconCareer)
    if self.heroData.lockState then
        self.Img_Lihuidi().gameObject:SetActive(false)
    else
        self.Img_Lihuidi().gameObject:SetActive(true)
    end
    UIEvent.LuaClick(self.RoleIcon().gameObject,Handle(self,self.OnClick))
    if  attr.Occupation == 4 then
        MgrRes.LoadSprite(self.Range(),"AtkRange/SupportRange/"..attr.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.Range(),"AtkRange/OtherRange/"..attr.AttackRangeTexture)
    end
    if self.heroData.awaken then
        self:InitStarPanel(self.heroData.star,self.StarPanel().gameObject,self.StarPregab_JueXing().gameObject)
    else
        self:InitStarPanel(self.heroData.star,self.StarPanel().gameObject,self.StarPregab_UnJueXing().gameObject)
    end
    if attr.Occupation==3 then
        self.OccText().text="2R"
    else
        self.OccText().text="1R"
    end
    if attr.Attacktarget==1 then
        self.AttackTargetText().text=MgrLanguageData.GetLanguageByKey("fightdragview_front")
    elseif attr.Attacktarget==2 then
        self.AttackTargetText().text=MgrLanguageData.GetLanguageByKey("fightdragview_passover")
    elseif  attr.Attacktarget==3 then
        self.AttackTargetText().text=MgrLanguageData.GetLanguageByKey("fightdragview_end")
    elseif  attr.Attacktarget==4 then
        self.AttackTargetText().text=MgrLanguageData.GetLanguageByKey("fightdragview_next")
    elseif  attr.Attacktarget==5 then
        self.AttackTargetText().text=MgrLanguageData.GetLanguageByKey("fightdragview_random")
    elseif  attr.Attacktarget == 7 then
        self.AttackTargetText().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    elseif  attr.Attacktarget == 8 then
        self.AttackTargetText().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    end
    self.PreviewHero = ReadData.GetRoleAttr(self.heroData.id,self.heroData.level,self.heroData.star,9,true)
    self:InitRoleSkillPanel(self.PreviewHero)
    if self.heroData.skillDir == 0 then
        self.Img_Zuo().gameObject:SetActive(true)
        self.Img_You().gameObject:SetActive(false)
    else
        self.Img_Zuo().gameObject:SetActive(false)
        self.Img_You().gameObject:SetActive(true)
    end
end

---点击事件
function M:OnClick()
    ---弹出详情面板逻辑
---@type RoleData
    local hero =  RoleData.New(self.heroData.id)
    local attr = hero:GetHeroAttr()
    hero.favor = self.heroData.favor
    hero.level = attr.LvMax
    hero.skillLevel = attr.SkillMaxLV
    hero.exp = BattleRole.ReturnExp(attr,attr.LvMax)
    MgrUI.Pop(UID.PopRoleInfo_UI,{hero},true)
end

--创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end

--创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
--根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        self:CreatStar(_Root,_Prefab)
    end
end

---初始化技能信息
function M:InitRoleSkillPanel(hero)
    if hero.Skill_5_example[1]~=nil then
        MgrRes.LoadSprite(self.RoleSkillIconImg5(),"Skill/"..hero.Skill_5_example[1].Icon)
        --添加技能图标点击详细说明事件
        UIEvent.LuaClick(self.RoleSkillIconImg5().gameObject,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_5_example,5)
        end))
        self.RoleSkillIconImg5().gameObject:SetActive(true)
        self:SwitchSkillPanel(self.RoleSkillIconPanel(),hero)
    else
        --EX技能为空
        self.RoleSkillIconImg5().gameObject:SetActive(false)
        self:SwitchSkillPanel(self.RoleSkillIconPanel(),hero)
    end
end
function M:SwitchSkillPanel(RoleSkillIconPanel,hero)
    local RoleSkillIconImg1 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg1")
    local RoleSkillIconImg2 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg2")
    local RoleSkillIconImg3 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg3")
    local RoleSkillIconImg4 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg4")
    --技能图标1、2、3、4
    if hero.Skill_1_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg1:GetComponent("Image"),"Skill/"..hero.Skill_1_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg1,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_1_example,1)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg1,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg1:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if hero.Skill_2_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg2:GetComponent("Image"),"Skill/"..hero.Skill_2_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg2,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_2_example,2)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg2,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg2:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if hero.Skill_3_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg3:GetComponent("Image"),"Skill/"..hero.Skill_3_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg3,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_3_example,3)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg3,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg3:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if hero.Skill_4_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg4:GetComponent("Image"),"Skill/"..hero.Skill_4_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg4,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_4_example,4)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg4,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg4:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
end

---点击弹出详情技能界面
function M:InitCombineSkillPanel(_Skill,index)
    local hero =  RoleData.New(self.heroData.id)
    local attr = hero:GetHeroAttr()
    hero.favor = self.heroData.favor
    hero.level = attr.LvMax
    hero.skillLevel = attr.SkillMaxLV
    hero.exp = BattleRole.ReturnExp(attr,attr.LvMax)
    MgrUI.Pop(UID.RolePreview_UI,{hero,2,_Skill,index},true)
end
return M