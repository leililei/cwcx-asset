-- Code Auto Create Begin
local M = Class('RoleXiangqing_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleXiangqing_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleXiangqing_UI].prefab'
    self.Name = 'Form[RoleXiangqing_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Mask',2},{'Tanchuang','Tanchuang',2},{'LihuiPanel','Tanchuang/LihuiPanel',2},{'LihuiSpinePanel','Tanchuang/LihuiPanel/LihuiSpinePanel',2},{'HDImage','Tanchuang/LihuiPanel/LihuiSpinePanel/HDImage',2},{'RoleInfoPanel','Tanchuang/RoleInfoPanel',2},{'ProTypeImg','Tanchuang/RoleInfoPanel/LowerInfoPanel/ProTypeImg',2},{'Chenghao','Tanchuang/RoleInfoPanel/LowerInfoPanel/Chenghao',2},{'RoleNameBG','Tanchuang/RoleInfoPanel/LowerInfoPanel/RoleNameBG',2},{'StarPrefabJueXing','Tanchuang/RoleInfoPanel/LowerInfoPanel/StarPrefabJueXing',2},{'StarPrefab','Tanchuang/RoleInfoPanel/LowerInfoPanel/StarPrefab',2},{'StarPanel','Tanchuang/RoleInfoPanel/LowerInfoPanel/StarPanel',2},{'GroupIconImgBg','Tanchuang/RoleInfoPanel/GroupIconImgBg',2},{'GroupIconImg','Tanchuang/RoleInfoPanel/GroupIconImgBg/GroupIconImg',2},{'Title','Tanchuang/RoleInfoPanel/Title',2},{'Img_Biaotidi','Tanchuang/RoleInfoPanel/Title/Img_Biaotidi',2},{'FriendRoleInfoPanel','Tanchuang/FriendRoleInfoPanel',2},{'Img_Shuxingdi','Tanchuang/FriendRoleInfoPanel/Img_Shuxingdi',2},{'Shuxing','Tanchuang/FriendRoleInfoPanel/Shuxing',2},{'Hp','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Hp',2},{'HpIcon','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Hp/HpIcon',2},{'Atk','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Atk',2},{'AtkIcon','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Atk/AtkIcon',2},{'Zhiyuan','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Zhiyuan',2},{'ZhiyuanIcon','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Zhiyuan/ZhiyuanIcon',2},{'Def','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Def',2},{'DefIcon','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Def/DefIcon',2},{'Baoji','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoji',2},{'BaojiIcon','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoji/BaojiIcon',2},{'Baoshang','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoshang',2},{'BaoshangIcon','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoshang/BaoshangIcon',2},{'Mingjie','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Mingjie',2},{'MingjieIcon','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Mingjie/MingjieIcon',2},{'RoleRankBG','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/RoleRankBG',2},{'Img_Jinengfanwei','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Img_Jinengfanwei',2},{'Img_Fanwei','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Img_Jinengfanwei/Img_Fanwei',2},{'Img_Mubiaofanwei','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Img_Mubiaofanwei',2},{'Img_Mubiao','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Img_Mubiaofanwei/Img_Mubiao',2},{'Img_Hexindi','Tanchuang/FriendRoleInfoPanel/Img_Hexindi',2},{'Gear','Tanchuang/FriendRoleInfoPanel/Gear',2},{'BlankIcon1','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Black1/BlankIcon1',2},{'Gear1','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1',2},{'GearRankKuangImg','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/GearRankKuangImg',2},{'GearIconImg','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/GearIconImg',2},{'Xingdi','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/Xingdi',2},{'EmptyGearStar','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/EmptyGearStar',2},{'StarJueXingPrefab','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/StarJueXingPrefab',2},{'GearStarPrefab','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/GearStarPrefab',2},{'GearStarPanel','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/GearStarPanel',2},{'LvBG','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/LvBG',2},{'BlankIcon2','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Black2/BlankIcon2',2},{'Gear2','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2',2},{'GearRankKuangImg01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/GearRankKuangImg',2},{'GearIconImg01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/GearIconImg',2},{'Xingdi01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/Xingdi',2},{'EmptyGearStar01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/EmptyGearStar',2},{'StarJueXingPrefab01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/StarJueXingPrefab',2},{'GearStarPrefab01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/GearStarPrefab',2},{'GearStarPanel01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/GearStarPanel',2},{'LvBG01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/LvBG',2},{'CardRoleInfoPanel','Tanchuang/CardRoleInfoPanel',2},{'Xinxi','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/Xinxi',2},{'Img_BaiKuang','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/Img_BaiKuang',2},{'Tap1','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/JueSeDingWei/Tap1',2},{'Tap2','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/JueSeDingWei/Tap2',2},{'Jineng','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/Jineng',2},{'Img_BaiKuang01','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/Img_BaiKuang',2},{'SkillContent','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll/SkillContent',2},{'Btn_Guanbi','Tanchuang/Btn_Guanbi',2},{'Btn_You','Tanchuang/Btn_You',2},{'Btn_Zuo','Tanchuang/Btn_Zuo',2},
        -- UITemplate 列表
        {'RoleDetail_SkillItem2','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll/RoleDetail_SkillItem2',10},
        -- RawImage 列表
        {'SkillScroll','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll',15},
        -- LoopScrollRect 列表
        {'SkillScroll01','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Chenghao','Tanchuang/RoleInfoPanel/LowerInfoPanel/Chenghao/Text_Chenghao',20},{'RoleNameTxt','Tanchuang/RoleInfoPanel/LowerInfoPanel/RoleNameBG/RoleNameTxt',20},{'Text_Title','Tanchuang/RoleInfoPanel/Title/Text_Title',20},{'Text_Shuxing','Tanchuang/FriendRoleInfoPanel/Img_Shuxingdi/Text_Shuxing',20},{'Text_LV','Tanchuang/FriendRoleInfoPanel/Shuxing/LV/Text_LV',20},{'Text_CurLv','Tanchuang/FriendRoleInfoPanel/Shuxing/LV/Text_CurLv',20},{'HpNameTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Hp/HpNameTxt',20},{'HPInfoTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Hp/HPInfoTxt',20},{'AtkNameTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Atk/AtkNameTxt',20},{'AtkInfoTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Atk/AtkInfoTxt',20},{'ZhiyuanNameTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Zhiyuan/ZhiyuanNameTxt',20},{'ZhiYuanInfoTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Zhiyuan/ZhiYuanInfoTxt',20},{'DefNameTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Def/DefNameTxt',20},{'DefInfoTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Def/DefInfoTxt',20},{'BaojiNameTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoji/BaojiNameTxt',20},{'BaojiInfoTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoji/BaojiInfoTxt',20},{'BaoShangNameTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoshang/BaoShangNameTxt',20},{'BaoshangInfoTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Baoshang/BaoshangInfoTxt',20},{'MinjieNameTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Mingjie/MinjieNameTxt',20},{'MinjieInfoTxt','Tanchuang/FriendRoleInfoPanel/Shuxing/Info/Mingjie/MinjieInfoTxt',20},{'Text_SkillLv','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/RoleRankBG/Text_SkillLv',20},{'Text_Rank','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Text_Rank',20},{'Text_SkillName','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Text_SkillName',20},{'Text_Jinengfanwei','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Img_Jinengfanwei/Text_Jinengfanwei',20},{'Text_Mubiaofanwei','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Img_Mubiaofanwei/Text_Mubiaofanwei',20},{'Text_Mubiaoshuoming','Tanchuang/FriendRoleInfoPanel/Shuxing/Rank/Img_Mubiaofanwei/Text_Mubiaoshuoming',20},{'Text_Hexin','Tanchuang/FriendRoleInfoPanel/Img_Hexindi/Text_Hexin',20},{'RankText','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel1/Gear1/LvBG/RankText',20},{'RankText01','Tanchuang/FriendRoleInfoPanel/Gear/GearIconPanel2/Gear2/LvBG/RankText',20},{'Text_Xinxi','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/Xinxi/Text_Xinxi',20},{'ZhiYe','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/ZhiYe',20},{'GongJi','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/ZhiYe/GongJi',20},{'XiaoDui','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/XiaoDui',20},{'XiaoDui01','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/XiaoDui/XiaoDui',20},{'DengJiShangXian','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/DengJiShangXian',20},{'Dengji','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/DengJiShangXian/Dengji',20},{'XiYouDu','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/XiYouDu',20},{'SSR','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/XiYouDu/SSR',20},{'JueSeDingWei','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/JueSeDingWei',20},{'Text_Tap1','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/JueSeDingWei/Tap1/Text_Tap1',20},{'Text_Tap2','Tanchuang/CardRoleInfoPanel/Content/XinxiPanel/JueSeDingWei/Tap2/Text_Tap2',20},{'Text_Jineng','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/Jineng/Text_Jineng',20},
    }
end
-- Code Auto Create End
require("LocalData/SkilllistLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Guanbi().gameObject,function()
        MgrUI.ClosePop(self.Uid)
        Event.Go("ShowBadgeShowPanel")
    end)
    Event.Go("HideBadgeShowPanel")
end

function M:OnBackKey()
    local tab = {"WorldBossRankPop_UI","FriendAvatar_UI","FriendAvatar_UI","WorldBossRankPop_UI","RoleXiangqing_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        MgrUI.ClosePop(self.Uid)
        Event.Go("ShowBadgeShowPanel")
    end
end

function M:OnShow(args)
    ---@type RoleData roleData
    self.roleData = args[1]
    self.typeLabel = args[2]
    ---剩余角色
    if #args[3] >= 2 then
        self.otherRoleData = args[3]
    else
        self.Btn_You().gameObject:SetActive(false)
        self.Btn_Zuo().gameObject:SetActive(false)
    end
    ---角色的服务器数据
    if args[4] ~= nil then
        self.serverData = args[4]
        self.roleData.favor = self.serverData.heroFavor
    end

    self.Index = 1
    ---显示新角色
    --self:InitNewRole()
    UIEvent.LuaClick(self.Btn_You().gameObject,function()
        self.Btn_Zuo().gameObject:SetActive(true)
        if self.Index ~= #self.otherRoleData then
            self.roleData = self.otherRoleData[self.Index + 1]
            self.CurHero = self.roleData
            self.Index = self.Index + 1
            if self.Index == #self.otherRoleData then
                self.Btn_You().gameObject:SetActive(false)
            end
        end
        self:InitNewRole()
    end)
    UIEvent.LuaClick(self.Btn_Zuo().gameObject,function()
        self.Btn_You().gameObject:SetActive(true)
        if self.Index ~= 1 then
            self.roleData = self.otherRoleData[self.Index - 1]
            self.CurHero = self.roleData
            self.Index = self.Index - 1
            if self.Index == 1 then
                self.Btn_Zuo().gameObject:SetActive(false)
            end
        end
        self:InitNewRole()
    end)
    self.Btn_Zuo().gameObject:SetActive(false)
end

function M:OnShowFinish()
    self:InitNewRole()
end

function M:SkillCell(trans, idx)
    ---传入数据
    self.CurHeroAttr.IsAwaken = true
    self.CurHeroAttr.ShowSkillLV = self.CurHeroAttr.SkillMaxLV+1
    --trans:GetComponent("UITemplate"):SetData({ self.ChildSkillList[idx], self, self.CurHeroAttr, self.CurHero:CheckHeroEquipIsMax()})
    trans:GetComponent("UITemplate"):SetData({ self.CurHero,self.CurHeroAttr,self.ChildSkillList[idx],self.CurHeroAttr.SkillMaxLV+1,"RoleXiangQing",idx })
    Tools.ReContentSizeGroup(self.SkillContent().gameObject)
end
---创建立绘
function M:CreatSpine(_Root, _SkinId)
    --local _PosInfoTab = CharactercoordinatesLocalData.tab[_SkinId].coordinate5
    --local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    --local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    --MgrRes.LoadWatchAuto(_Root, _SkinId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
    --    self.SpineObj = obj
    --end)
    MgrRes.LoadHDIcon_OriginalSize(self.HDImage(),_SkinId)
    local _PosInfoTab = CharactercoordinatesLocalData.tab[_SkinId].coordinate5
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    self.HDImage().transform.localPosition = Vector3(tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),0)
    self.HDImage().transform.localScale = Vector3(tonumber(_tempPosTab1[2]),tonumber(_tempPosTab1[2]),1)
end

function M:InitCardRole()
    ----职业
    --if self.roleData.career == 1 then
    --    self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text207")
    --elseif self.roleData.career == 2 then
    --    self.GongJi().text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
    --elseif self.roleData.career == 3 then
    --    self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text208")
    --elseif self.roleData.career == 4 then
    --    self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text141")
    --end
    ----小队
    --self.XiaoDui01().text = self.roleData.CampTxt
    ----等级上限
    --self.Dengji().text = 90 + (self.roleData.rank - 2) * 5
    ----稀有度
    --if self.roleData.rank == 2 then
    --    self.SSR().text = MgrLanguageData.GetLanguageByKey("ui_tips_4")
    --elseif self.roleData.rank == 3 then
    --    self.SSR().text = MgrLanguageData.GetLanguageByKey("ui_tips_5")
    --elseif self.roleData.rank == 4 then
    --    self.SSR().text = MgrLanguageData.GetLanguageByKey("ui_tips_6")
    --end
    ----角色定位
    --if self.roleData.label ~= nil and self.roleData.label ~= "" then
    --    local str = string.split(self.roleData.label,",")
    --    self.Text_Tap1().text = str[1]
    --    if str[2] ~= nil then
    --        self.Text_Tap2().text = str[2]
    --    end
    --else
    --    self.Tap1().gameObject:SetActive(false)
    --    self.Tap2().gameObject:SetActive(false)
    --end
    self.SkillScroll01():SetLuaCellEvent(Handle(self, self.SkillCell))
    self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.roleData.id)
    local specialEquip = EquipControl.GetSingleSpecialEquip(self.roleData.id)
    self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,specialEquip)    ---根据角色进阶共鸣装备替换技能简略表
    self.SkillScroll01().totalCount = #self.ChildSkillList
    self.SkillScroll01():RefillCells()

    --星星
    for i = 1, self.CurHero.maxStar do
        GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().transform,false)
    end
    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)
end

function M:InitFriendRole()
    --各项属性
    ---@type BattleRole CurHeroAttr
    self.Text_CurLv().text = self.CurHero.level .. "/" .. 90 + (self.CurHero.rank - 2) * 5
    self.HPInfoTxt().text = math.floor(self.CurHeroAttr.HPmax)
    if self.CurHero.career ~= 4 then
        self.Zhiyuan().gameObject:SetActive(false)
        self.AtkInfoTxt().text = math.floor(self.CurHeroAttr.RealAtk)
    else
        self.Atk().gameObject:SetActive(false)
        self.ZhiYuanInfoTxt().text = math.floor(self.CurHeroAttr.RealSuppart * 100) .. "%"
    end
    self.DefInfoTxt().text = math.floor(self.CurHeroAttr.RealDef * 100) .. "%"
    self.BaojiInfoTxt().text = math.floor(self.CurHeroAttr.RealCrit * 100).. "%"
    self.BaoshangInfoTxt().text = math.floor(self.CurHeroAttr.RealCritDmg * 100) .. "%"
    self.MinjieInfoTxt().text = math.floor(self.CurHeroAttr.RealAgile * 100).. "%"
    --技能等级
    local tLv = 1
    for i = 1, #self.CurHero.equipLvArr do
        if self.CurHero.equipLvArr[i] < tonumber(SteamLocalData.tab[105009][2]) then
            tLv = 0
        end
    end
    if self.CurHero.heroFlag then
        self.Text_SkillLv().text = self.CurHero.heroCurSkill
    else
        self.Text_SkillLv().text = self.CurHero.skillLevel + tLv
    end
    --技能名字
    for i = 1, #SkilllistLocalData.tab do
        if SkilllistLocalData.tab[i][2] == self.CurHero.id then
            self.Text_SkillName().text = SkilllistLocalData.tab[i][8]
            break
        end
    end
    --技能范围
    if self.CurHero.career == 4 then
        MgrRes.LoadSprite(self.Img_Fanwei(),"AtkRange/SupportRange/"..self.CurHeroAttr.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.Img_Fanwei(),"AtkRange/OtherRange/"..self.CurHeroAttr.AttackRangeTexture)
    end
    --攻击目标
    MgrRes.LoadSprite(self.Img_Mubiao(),"AtkTarget/AtkTarget_" .. ((self.CurHeroAttr.Attacktarget == 7 or self.CurHeroAttr.Attacktarget == 8) and 4 or self.CurHeroAttr.Attacktarget),nil,true)
    --攻击描述
    self:Text_Mubiaoshuoming().text =  self.CurHeroAttr.AtkTargetTips
    ---核心1
    ---@type CoreData
    local core1 = self.CurHero:GetHeroSingleCore(1)
    --计算核心等级
    if core1 then
        CoreControl.CheckCorelevel(core1,self.serverData.heroArmor1.armorExp)
        self:ShowCore(1,core1)
    else
        self.Gear1().gameObject:SetActive(false)
    end
    --核心2
    local core2 = self.CurHero:GetHeroSingleCore(2)
    if core2 then
        CoreControl.CheckCorelevel(core2,self.serverData.heroArmor2.armorExp)
        self:ShowCore(2,core2)
    else
        self.Gear2().gameObject:SetActive(false)
    end
    --星星
    if self.CurHero.awaken then
        for i = 1, self.CurHero.star do
            GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().transform,false)
        end
    else
        for i = 1, self.CurHero.star do
            GameObject.Instantiate(self.StarPrefab().gameObject,self.StarPanel().transform,false)
        end
    end

    self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.roleData.id)
    self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,nil)    ---根据角色进阶共鸣装备替换技能简略表
    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)
end

function M:ShowCore(index,core)
    local corePrefab = CJNUIMgr.GetSunUseName(self.Gear().gameObject, "GearIconPanel" .. index)
    local _GearRankKuangImg = CJNUIMgr.GetSunUseName(corePrefab, "GearRankKuangImg")
    local _GearIconImg = CJNUIMgr.GetSunUseName(corePrefab, "GearIconImg")
    local _GearJueXingStarPrefab = CJNUIMgr.GetSunUseName(corePrefab, "StarJueXingPrefab")
    local _GearStarPrefab = CJNUIMgr.GetSunUseName(corePrefab, "GearStarPrefab")
    local _GearStarPanel = CJNUIMgr.GetSunUseName(corePrefab, "GearStarPanel")
    local _RankText = CJNUIMgr.GetSunUseName(corePrefab, "RankText")
    --品质框
    if core.quality == 5 or core.quality == 6 then
        MgrRes.LoadSprite(_GearRankKuangImg:GetComponent("Image"),"Item/Rank/ItemRank_4")
    elseif core.quality == 3 or core.quality == 4 then
        MgrRes.LoadSprite(_GearRankKuangImg:GetComponent("Image"),"Item/Rank/ItemRank_3")
    else
        MgrRes.LoadSprite(_GearRankKuangImg:GetComponent("Image"),"Item/Rank/ItemRank_" .. core.quality)
    end
    --图片
    MgrRes.LoadSprite(_GearIconImg:GetComponent("Image"),core.icon)
    --觉醒星级
    if core.quality == 5 then
        _GearStarPrefab:SetActive(false)
        for i = 1, core.star do
            GameObject.Instantiate(_GearJueXingStarPrefab,_GearStarPanel.transform)
        end
    else
        _GearJueXingStarPrefab:SetActive(false)
        for i = 1, core.star do
            GameObject.Instantiate(_GearStarPrefab,_GearStarPanel.transform)
        end
    end
    --强化等级
    _RankText:GetComponent("TextMeshProUGUI").text = "+" .. core.level
end

function M:InitNewRole()
    if self.typeLabel == "CardRole" then
        self.Title().gameObject:SetActive(true)
        ---计算角色满级属性
        self.CurHero = self.roleData
        self.CurHero.level = 90 + (self.roleData.rank - 2) * 5
        self.CurHero.skillLevel = 10
        self.CurHeroAttr = self.CurHero:GetHeroAttrNoAdditional()
        self.CurHeroAttr.StartLV = 6
        self.FriendRoleInfoPanel().gameObject:SetActive(false)
        self:InitCardRole()
    elseif self.typeLabel == "FriendRole" then
        self.Title().gameObject:SetActive(false)
        self.CurHero = self.roleData
        local tempCurHeroAttr = self.CurHero:GetHeroAttr()
        local core1 = self.CurHero:GetHeroSingleCore(1)
        local core2 = self.CurHero:GetHeroSingleCore(2)
        
        self.CurHeroAttr = ReadData.CreatRole(tempCurHeroAttr.ID,tempCurHeroAttr.SkinID,tempCurHeroAttr.LV,tempCurHeroAttr.StartLV,tempCurHeroAttr.SkillLV,tempCurHeroAttr.IsAwaken,self.CurHero.favor,true)
        if core1 then
            for i = 1, #core1.attrs do
                local AbtArr1 =  ReadData.GetGearAttr(core1.id , core1.properties * 100)
                ReadData.InitRoleGear( self.CurHeroAttr, AbtArr1 ,true)
            end
        end
        if core2 then
            for i = 1, #core2.attrs do
                local AbtArr2 =  ReadData.GetGearAttr(core2.id , core2.properties * 100)
                ReadData.InitRoleGear( self.CurHeroAttr, AbtArr2 ,true)
            end
        end
        ---共鸣装备属性
        local role = HeroControl.GetRoleDataByID(tonumber(self.CurHero.id))
        if #self.CurHero.equipLvArr ~= 0 then
            ---获取角色共鸣装备1
            local equip1 = role:GetHeroEquip(1)
            ---装备等级替换为对方等级
            local newEquip1 = EquipControl.ReturnSingleEquip(equip1.equipID,self.CurHero.equipLvArr[1])
            if newEquip1 ~= nil then
                ReadData.InitRoleGear(self.CurHeroAttr,newEquip1.attrs,true)
            end
            ---获取角色共鸣装备2
            local equip2 = role:GetHeroEquip(2)
            local newEquip2 = EquipControl.ReturnSingleEquip(equip2.equipID,self.CurHero.equipLvArr[2])
            if newEquip2 ~= nil then
                ReadData.InitRoleGear(self.CurHeroAttr,newEquip2.attrs,true)
            end
            ---获取角色共鸣装备3
            local equip3 = role:GetHeroEquip(3)
            local newEquip3 = EquipControl.ReturnSingleEquip(equip3.equipID,self.CurHero.equipLvArr[3])
            if newEquip3 ~= nil then
                ReadData.InitRoleGear(self.CurHeroAttr,newEquip3.attrs,true)
            end
        end
        self.CardRoleInfoPanel().gameObject:SetActive(false)
        self:InitFriendRole()
    end
    --职业图标
    --MgrRes.LoadSprite(self.ProTypeImg(),"Attribute/ProIcon_"..self.CurHero.career)
    MgrRes.LoadSprite(self.ProTypeImg(),self.CurHero.iconCareer)
    --名字
    self.RoleNameTxt().text = self.CurHero.name
    --队徽
    MgrRes.LoadSprite(self.GroupIconImg(), "Attribute/" .. self.CurHero.CampiconName)
    --创建spine
    --GameObject.Destroy(self.SpineObj)
    self:CreatSpine(self.LihuiSpinePanel().gameObject, self.CurHero.skin)
    --称号
    self.Text_Chenghao().text = HeroControl.GetSkinDataBySkinId(self.CurHero.skin).skinName
    --self:CreatSpine(self.LihuiSpinePanel(), self.roleData.id)
end

return M