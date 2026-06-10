-- Code Auto Create Begin
local M = Class('RoleJueXingPreview_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleJueXingPreview_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleJueXingPreview_UI].prefab'
    self.Name = 'Form[RoleJueXingPreview_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_Back','Btn_Back',2},{'juexingyulandi','juexingyulandi',2},{'Img_Xian1','juexingyulandi/Img_Xian1',2},{'Img_Tanchuangdi','juexingyulandi/Img_Tanchuangdi',2},{'Img_Xian2','juexingyulandi/Img_Xian2',2},{'Img_Biaotixian','juexingyulandi/Img_Biaotixian',2},{'Img_Biaotixian1','juexingyulandi/Img_Biaotixian1',2},{'Img_Biaotixian2','juexingyulandi/Img_Biaotixian2',2},{'Img_Biaotixian3','juexingyulandi/Img_Biaotixian3',2},{'NeedPrefab','juexingyulandi/NeedPrefab',2},{'NeedItemIconImg','juexingyulandi/NeedPrefab/NeedItemIconImg',2},{'NeedPanel','juexingyulandi/NeedPanel',2},{'RoleSkillIconPanel','juexingyulandi/RoleSkillIconPanel',2},{'RoleSkillIconImg1','juexingyulandi/RoleSkillIconPanel/RoleSkillIconImg1',2},{'RoleSkillIconImg2','juexingyulandi/RoleSkillIconPanel/RoleSkillIconImg2',2},{'RoleSkillIconImg3','juexingyulandi/RoleSkillIconPanel/RoleSkillIconImg3',2},{'RoleSkillIconImg4','juexingyulandi/RoleSkillIconPanel/RoleSkillIconImg4',2},{'JueXingTxtBg','juexingyulandi/RoleSkillIconPanel/RoleSkillIconImg4/JueXingTxtBg',2},{'SelectSkillImg','juexingyulandi/RoleSkillIconPanel/RoleSkillIconImg4/JueXingTxtBg/SelectSkillImg',2},{'RoleInfoPanel','juexingyulandi/RoleInfoPanel',2},{'shuxingdi','juexingyulandi/RoleInfoPanel/shuxingdi',2},{'》2','juexingyulandi/RoleInfoPanel/》2',2},{'HpIconImg','juexingyulandi/RoleInfoPanel/HpIconImg',2},{'AtkIconImg','juexingyulandi/RoleInfoPanel/AtkIconImg',2},{'StarPreviewPanel','juexingyulandi/StarPreviewPanel',2},{'StarPrefab','juexingyulandi/StarPreviewPanel/StarPrefab',2},{'StarJueXingPrefab','juexingyulandi/StarPreviewPanel/StarJueXingPrefab',2},{'CurStarRoot','juexingyulandi/StarPreviewPanel/CurStarRoot',2},{'PreviewStarRoot','juexingyulandi/StarPreviewPanel/PreviewStarRoot',2},{'》1','juexingyulandi/》1',2},
        -- Text 列表
        {'NeedItemNameTxt','juexingyulandi/NeedPrefab/NeedItemNameTxt',3},{'NeedItemCountTxt','juexingyulandi/NeedPrefab/NeedItemCountTxt',3},{'JueXingTxt','juexingyulandi/RoleSkillIconPanel/RoleSkillIconImg4/JueXingTxtBg/JueXingTxt',3},{'HpNameTxt','juexingyulandi/RoleInfoPanel/HpNameTxt',3},{'AtkNameTxt','juexingyulandi/RoleInfoPanel/AtkNameTxt',3},{'HpInfoBeforeTxt','juexingyulandi/RoleInfoPanel/HpInfoBeforeTxt',3},{'AtkInfoBeforeTxt','juexingyulandi/RoleInfoPanel/AtkInfoBeforeTxt',3},{'HpInfoAfterTxt','juexingyulandi/RoleInfoPanel/HpInfoAfterTxt',3},{'AtkInfoAfterTxt','juexingyulandi/RoleInfoPanel/AtkInfoAfterTxt',3},{'TopTitleTxt','juexingyulandi/TopTitleTxt',3},{'TopTipTxt','juexingyulandi/TopTipTxt',3},{'RoleInfoTtitleTxt','juexingyulandi/RoleInfoTtitleTxt',3},{'SkillInfoTitleTxt','juexingyulandi/SkillInfoTitleTxt',3},{'NeedPanelTitleTxt','juexingyulandi/NeedPanelTitleTxt',3},
    }
end
-- Code Auto Create End
require("LocalData/RoleattriawakeningLocalData")

function M:OnInit()
    self.CurBattleRole = RoleCardViewModel.CurrentHero:GetHeroAttr()
    self.PreviewBattleRole = ReadData.GetRoleAttr(RoleCardViewModel.CurrentHero.id,RoleCardViewModel.CurrentHero.level,RoleCardViewModel.CurrentHero.star,RoleCardViewModel.CurrentHero:GetHeroSkillLevel(),true)
    self:InitRoleInfoPanel()
    self:InitRoleSkillPanel()
    self:InitNeedPanel()
    self:InitButton()
end

function M:OnShow()
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
end
---初始化人物信息面板
function M:InitRoleInfoPanel()
    self.StarPrefab().gameObject:SetActive(false)
    self.StarJueXingPrefab().gameObject:SetActive(false)
    -- 初始化当前星级
    self:InitStar(self.CurStarRoot().gameObject,self.StarPrefab().gameObject,self.CurBattleRole.StartLV)
    -- 初始化预览星级
    self:InitStar(self.PreviewStarRoot().gameObject,self.StarJueXingPrefab().gameObject,self.PreviewBattleRole.StartLV)

    -- statements
    self.HpInfoBeforeTxt().text=""..self.CurBattleRole.HP
    self.HpInfoAfterTxt().text=""..self.PreviewBattleRole.HP.."<color=#3AFFC5>(+"..math.floor(self.PreviewBattleRole.HP-self.CurBattleRole.HP)..")</color>"
    if self.CurBattleRole.Occupation ~= 4 then
        -- 非支援角色
        self.AtkNameTxt().text=MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        MgrRes.LoadSprite(self.AtkIconImg(),"Attribute/GearInfoIcon_0")
        self.AtkInfoBeforeTxt().text=""..self.CurBattleRole.RealAtk
        self.AtkInfoAfterTxt().text=""..self.PreviewBattleRole.RealAtk.."<color=#3AFFC5>(+"..math.floor(self.PreviewBattleRole.RealAtk-self.CurBattleRole.RealAtk)..")</color>"
    else
        self.AtkNameTxt().text=MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
        MgrRes.LoadSprite(self.AtkIconImg(),"Attribute/GearInfoIcon_8")
        self.AtkInfoBeforeTxt().text=""..self.GetInfoCorrect(self.CurBattleRole.RealSuppart).."%"
        self.AtkInfoAfterTxt().text=""..self.GetInfoCorrect(self.PreviewBattleRole.RealSuppart).."%<color=#3AFFC5>(+"..(self.GetInfoCorrect(self.PreviewBattleRole.RealSuppart-self.CurBattleRole.RealSuppart)).."%)</color>"
    end
end



---初始化技能预览
function M:InitRoleSkillPanel()
    --技能图标1、2、3、4
    if self.PreviewBattleRole.Skill_1_example[1]~=nil then
        MgrRes.LoadSprite(self.RoleSkillIconImg1(),"Skill/"..self.PreviewBattleRole.Skill_1_example[1].Icon)
        UIEvent.LuaClick(self.RoleSkillIconImg1().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewBattleRole.Skill_1_example)
        end))
    else
        MgrRes.LoadSprite(self.RoleSkillIconImg1(),"Skill/icon_skill_empty")
    end
    if self.PreviewBattleRole.Skill_2_example[1]~=nil then
        MgrRes.LoadSprite(self.RoleSkillIconImg2(),"Skill/"..self.PreviewBattleRole.Skill_2_example[1].Icon)
        UIEvent.LuaClick(self.RoleSkillIconImg2().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewBattleRole.Skill_2_example)
        end))
    else
        MgrRes.LoadSprite(self.RoleSkillIconImg2(),"Skill/icon_skill_empty")
    end
    if self.PreviewBattleRole.Skill_3_example[1]~=nil then
        MgrRes.LoadSprite(self.RoleSkillIconImg3(),"Skill/"..self.PreviewBattleRole.Skill_3_example[1].Icon)
        UIEvent.LuaClick(self.RoleSkillIconImg3().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewBattleRole.Skill_3_example)
        end))
    else
        MgrRes.LoadSprite(self.RoleSkillIconImg3(),"Skill/icon_skill_empty")
    end
    if self.PreviewBattleRole.Skill_4_example[1]~=nil then
        MgrRes.LoadSprite(self.RoleSkillIconImg4(),"Skill/"..self.PreviewBattleRole.Skill_4_example[1].Icon)
        UIEvent.LuaClick(self.RoleSkillIconImg4().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewBattleRole.Skill_4_example)
        end))
    else
        MgrRes.LoadSprite(self.RoleSkillIconImg4(),"Skill/icon_skill_empty")
    end
end
---点击弹出详情技能界面
function M:InitCombineSkillPanel(_Skill)
    MgrUI.Pop(UID.RolePreview_UI,{nil,3,_Skill},true)
end
---初始化消耗预览界面
function M:InitNeedPanel()
    local StarCostTab1 = {}
    self.NeedPrefab().gameObject:SetActive(false)
    Tools.ClearAllChild(self.NeedPanel().gameObject)
    for i, v in pairs(RoleattriawakeningLocalData.tab) do
        if self.CurBattleRole.New_Career == v[2] and self.CurBattleRole.Rank == v[3] then
            StarCostTab1 =string.split(v[4],",")
        end
    end
    for key, value in pairs(StarCostTab1) do
        -- statements
        local StarCostTab2 = JNStrTool.strSplit("_", value)
        local obj =  GameObject.Instantiate(self.NeedPrefab().gameObject,self.NeedPanel().transform)
        obj:SetActive(true)
        local CostIcon = obj.transform:Find("NeedItemIconImg"):GetComponent("Image")
        local CostCount = obj.transform:Find("NeedItemCountTxt"):GetComponent("TextMeshProUGUI")
        local CostName = obj.transform:Find("NeedItemNameTxt"):GetComponent("TextMeshProUGUI")
        ---@type ItemData
        local item = ItemControl.GetItemByID(tonumber(StarCostTab2[2]))
        CostCount.text = string.format(MgrLanguageData.GetLanguageByKey("rolejuexingpreview_ui_text1"),StarCostTab2[3],item.count)
        MgrRes.LoadSprite(CostIcon,item.icon)
        CostName.text = item.name
    end
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        -- statements
        MgrUI.ClosePop(UID.RoleJueXingPreview_UI)
    end))
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
--取整人物信息
function M.GetInfoCorrect(_Data)
    -- statements
    local tempInt1 =0
    local tempInt2 =0
    local tempData=0
    tempInt1,tempInt2=math.modf((_Data*1000)/1)
    tempData=tempInt1/10
    return tempData
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
--初始化星星
function M:InitStar(_Root,_Prefab,_Star)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _Star, 1 do
        self:CreatStar(_Root,_Prefab)
    end
end
return M