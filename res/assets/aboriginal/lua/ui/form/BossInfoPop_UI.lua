-- Code Auto Create Begin
local M = Class('BossInfoPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BossInfoPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BossInfoPop_UI].prefab'
    self.Name = 'Form[BossInfoPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 0
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'lihui','lihui',2},{'UpperLeftPanel','UpperLeftPanel',2},{'guang','UpperLeftPanel/guang',2},{'Img_Fenggexian2','UpperLeftPanel/Img_Fenggexian2',2},{'Btn_Return','UpperLeftPanel/Btn_Return',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ZoomIn','Btn_ZoomIn',2},{'Img_Suofangdi','Btn_ZoomIn/Img_Suofangdi',2},{'Img_Suoxiaoicon','Btn_ZoomIn/Img_Suoxiaoicon',2},{'Btn_ZoomOut','Btn_ZoomOut',2},{'Img_Suofangdi01','Btn_ZoomOut/Img_Suofangdi',2},{'Img_Fangdaicon','Btn_ZoomOut/Img_Fangdaicon',2},{'Panel_Bottom','Panel_Bottom',2},{'Img_Lihuidi','Panel_Bottom/Xinxi/RoleHead/Img_Lihuidi',2},{'Icon_RIHead','Panel_Bottom/Xinxi/RoleHead/Icon_RIHead',2},{'Icon_RIFrame','Panel_Bottom/Xinxi/RoleHead/Icon_RIFrame',2},{'Icon_RICareer','Panel_Bottom/Xinxi/RoleHead/Icon_RICareer',2},{'RIStar_1','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_1',2},{'HighLight','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_1/HighLight',2},{'RIStar_2','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_2',2},{'HighLight01','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_2/HighLight',2},{'RIStar_3','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_3',2},{'HighLight02','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_3/HighLight',2},{'RIStar_4','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_4',2},{'HighLight03','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_4/HighLight',2},{'RIStar_5','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_5',2},{'HighLight04','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_5/HighLight',2},{'RIStar_6','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_6',2},{'HighLight05','Panel_Bottom/Xinxi/RoleHead/StarContent/RIStar_6/HighLight',2},{'RIAwaken','Panel_Bottom/Xinxi/RoleHead/StarContent/RIAwaken',2},{'Super','Panel_Bottom/Xinxi/RoleHead/StarContent/RIAwaken/Super',2},{'Super01','Panel_Bottom/Xinxi/RoleHead/StarContent/RIAwaken/Super',2},{'Super02','Panel_Bottom/Xinxi/RoleHead/StarContent/RIAwaken/Super',2},{'Super03','Panel_Bottom/Xinxi/RoleHead/StarContent/RIAwaken/Super',2},{'Super04','Panel_Bottom/Xinxi/RoleHead/StarContent/RIAwaken/Super',2},{'Super05','Panel_Bottom/Xinxi/RoleHead/StarContent/RIAwaken/Super',2},{'Icon_Rankdi','Panel_Bottom/Xinxi/RoleHead/Icon_Rankdi',2},{'hexin(kong)(1)','Panel_Bottom/Xinxi/hexin(kong) (1)',2},{'hexin(kong)','Panel_Bottom/Xinxi/hexin(kong)',2},{'Img_Fanweidi','Panel_Bottom/Xinxi/fanwei/Img_Fanweidi',2},{'Img_Zuo','Panel_Bottom/Xinxi/fanwei/Img_Zuo',2},{'Img_You','Panel_Bottom/Xinxi/fanwei/Img_You',2},{'Img_AtkRang','Panel_Bottom/Xinxi/fanwei/Img_AtkRang',2},{'Img_Fanweikuang','Panel_Bottom/Xinxi/Img_Fanweikuang',2},{'Img_Fanweikuang1','Panel_Bottom/Xinxi/Img_Fanweikuang/Img_Fanweikuang1',2},{'Img_Fanweikuang2','Panel_Bottom/Xinxi/Img_Fanweikuang/Img_Fanweikuang2',2},{'shuxingtiao(hei)1','Panel_Bottom/Xinxi/RoleSilderPanel/shuxingtiao(hei)1',2},{'shuxingtiao(hei)2','Panel_Bottom/Xinxi/RoleSilderPanel/shuxingtiao(hei)2',2},{'shuxingtiao(hei)3','Panel_Bottom/Xinxi/RoleSilderPanel/shuxingtiao(hei)3',2},{'shuxingtiao(hei)4','Panel_Bottom/Xinxi/RoleSilderPanel/shuxingtiao(hei)4',2},{'shuxingtiao(hei)5','Panel_Bottom/Xinxi/RoleSilderPanel/shuxingtiao(hei)5',2},{'shuxingtiao(hei)6','Panel_Bottom/Xinxi/RoleSilderPanel/shuxingtiao(hei)6',2},{'HPSlider','Panel_Bottom/Xinxi/RoleSilderPanel/HPSlider',2},{'CritDmgSlider','Panel_Bottom/Xinxi/RoleSilderPanel/CritDmgSlider',2},{'DefSlider','Panel_Bottom/Xinxi/RoleSilderPanel/DefSlider',2},{'CriSlider','Panel_Bottom/Xinxi/RoleSilderPanel/CriSlider',2},{'AtkSlider','Panel_Bottom/Xinxi/RoleSilderPanel/AtkSlider',2},{'AgrSlider','Panel_Bottom/Xinxi/RoleSilderPanel/AgrSlider',2},{'RoleInfoTxtPanel','Panel_Bottom/Xinxi/RoleInfoTxtPanel',2},{'AtkImg','Panel_Bottom/Xinxi/RoleInfoTxtPanel/AtkImg',2},{'HpImg','Panel_Bottom/Xinxi/RoleInfoTxtPanel/HpImg',2},{'DefImg','Panel_Bottom/Xinxi/RoleInfoTxtPanel/DefImg',2},{'Evaimg','Panel_Bottom/Xinxi/RoleInfoTxtPanel/Evaimg',2},{'ChdImg','Panel_Bottom/Xinxi/RoleInfoTxtPanel/ChdImg',2},{'CriImg','Panel_Bottom/Xinxi/RoleInfoTxtPanel/CriImg',2},{'SupImg','Panel_Bottom/Xinxi/RoleInfoTxtPanel/SupImg',2},{'SkillIconPanel','Panel_Bottom/Xinxi/SkillIconPanel',2},{'SkillIcon_1','Panel_Bottom/Xinxi/SkillIconPanel/SkillIcon_1',2},{'SkillIcon_2','Panel_Bottom/Xinxi/SkillIconPanel/SkillIcon_2',2},{'SkillIcon_3','Panel_Bottom/Xinxi/SkillIconPanel/SkillIcon_3',2},{'SkillIcon_4','Panel_Bottom/Xinxi/SkillIconPanel/SkillIcon_4',2},{'ImageSuo','Panel_Bottom/Xinxi/SkillIconPanel/SkillIcon_4/ImageSuo',2},{'Image','Panel_Bottom/Xinxi/SkillIconPanel/SkillIcon_4/ImageSuo/Image',2},{'SkillIcon_5','Panel_Bottom/Xinxi/SkillIconPanel/SkillIcon_5',2},
        -- Text 列表
        {'Text_Name','UpperLeftPanel/guang/Text_Name',3},{'Text_Title','UpperLeftPanel/Text_Title',3},{'Text_TitleEn','UpperLeftPanel/Text_TitleEn',3},{'Text_RILevel','Panel_Bottom/Xinxi/RoleHead/Text_RILevel',3},{'Text_RILv','Panel_Bottom/Xinxi/RoleHead/Text_RILv',3},{'Text_RIRank','Panel_Bottom/Xinxi/RoleHead/Icon_Rankdi/Text_RIRank',3},{'Text_RIName','Panel_Bottom/Xinxi/Text_RIName',3},{'Text_Occ','Panel_Bottom/Xinxi/Img_Fanweikuang/Text_Occ',3},{'Text_AtkTarget','Panel_Bottom/Xinxi/Img_Fanweikuang/Text_AtkTarget',3},{'HpInfoTxt','Panel_Bottom/Xinxi/RoleInfoTxtPanel/HpInfoTxt',3},{'AtkInfoTxt','Panel_Bottom/Xinxi/RoleInfoTxtPanel/AtkInfoTxt',3},{'DefInfoTxt','Panel_Bottom/Xinxi/RoleInfoTxtPanel/DefInfoTxt',3},{'EvaInfoTxt','Panel_Bottom/Xinxi/RoleInfoTxtPanel/EvaInfoTxt',3},{'ChdInfoTxt','Panel_Bottom/Xinxi/RoleInfoTxtPanel/ChdInfoTxt',3},{'CriInfoTxt','Panel_Bottom/Xinxi/RoleInfoTxtPanel/CriInfoTxt',3},{'Text_Yuanzuijieshao','Panel_Bottom/Text_Yuanzuijieshao',3},{'Text_Introduce','Panel_Bottom/Text_Introduce',3},
        -- UITemplate 列表
        {'RICore1','Panel_Bottom/Xinxi/RICore1',10},{'RICore2','Panel_Bottom/Xinxi/RICore2',10},
        -- RawImage 列表
        {'RICore101','Panel_Bottom/Xinxi/RICore1',15},{'RICore201','Panel_Bottom/Xinxi/RICore2',15},
    }
end
-- Code Auto Create End
require("LocalData/MonsterdexLocalData")
---初始化
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    -----角色信息星底框
    --self.rIStarNor = {
    --    [1] = self.RIStar_1().transform:Find("Normal").gameObject,
    --    [2] = self.RIStar_2().transform:Find("Normal").gameObject,
    --    [3] = self.RIStar_3().transform:Find("Normal").gameObject,
    --    [4] = self.RIStar_4().transform:Find("Normal").gameObject,
    --    [5] = self.RIStar_5().transform:Find("Normal").gameObject,
    --    [6] = self.RIStar_6().transform:Find("Normal").gameObject,
    --}
    ---角色信息星高亮
    self.rIStarHl = {
        [1] = self.RIStar_1().transform:Find("HighLight").gameObject,
        [2] = self.RIStar_2().transform:Find("HighLight").gameObject,
        [3] = self.RIStar_3().transform:Find("HighLight").gameObject,
        [4] = self.RIStar_4().transform:Find("HighLight").gameObject,
        [5] = self.RIStar_5().transform:Find("HighLight").gameObject,
        [6] = self.RIStar_6().transform:Find("HighLight").gameObject,
    }
    ---角色信息觉醒节点
    self.rIAwaken = self.RIAwaken().gameObject
end
---更新显示
function M:OnShow(args)
    ---@type StormBossData
    self.bData = args[1]
    ---更新立绘
    local BossID = string.split(WorldbossLocalData.tab[self.bData.id][3],"_")[1]
    MgrRes.LoadHDIcon(self.lihui(),BossID)
    ---更新名称
    self.Text_Name().text = self.bData.monsterData.name
    local roleData = self.bData.monsterData
    local role = roleData:GetBossInfoAttr()
    local des = ""
    for i, v in ipairs(MonsterdexLocalData.tab) do
        if roleData.id == v[5] then
            des = v[8]
            break
        end
    end
    ---更新头像
    MgrRes.LoadQIcon(self.Icon_RIHead(),roleData.id)
    ---更新边框
    MgrRes.LoadSprite(self.Icon_RIFrame(),roleData.iconBattleFrame)
    ---更新等级
    self.Text_RILevel().text = roleData.level
    ---更新简介
    self.Text_Introduce().text = des
    ---更新职业图标
    MgrRes.LoadSprite(self.Icon_RICareer(),roleData.iconCareer)
    ---更新星级
    for starLv = 1, #self.rIStarHl do
        local isStar = roleData.star < starLv
        --self.rIStarNor[starLv]:SetActive(isStar)
        self.rIStarHl[starLv]:SetActive(not isStar)
    end
    ---更新觉醒
    local isAwaken = false
    if type(roleData.awaken) == "number" then
        isAwaken = roleData.awaken > 0
    else
        isAwaken = roleData.awaken
    end
    self.rIAwaken:SetActive(isAwaken)
    ---更新技能等级
    self.Text_RIRank().text = "+"..roleData.skillLevel
    ---更新角色名称
    self.Text_RIName().text = roleData.name
    ---更新核心
    --local core1 = roleData:GetCore(1)
    --local core2 = roleData:GetCore(2)
    local core1 = roleData:GetMonsterCore(1)
    local core2 = roleData:GetMonsterCore(2)
    self.RICore1().gameObject:SetActive(core1 ~= nil)
    self.RICore2().gameObject:SetActive(core2 ~= nil)
    if core1 ~= nil then
        self.RICore1().transform:GetComponent("UITemplate"):SetData(core1)
    end
    if core2 ~= nil then
        self.RICore2().transform:GetComponent("UITemplate"):SetData(core2)
    end
    ---更新攻击距离
    if role.Occupation == 4 then
        MgrRes.LoadSprite(self.Img_AtkRang(),"AtkRange/SupportRange/"..role.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.Img_AtkRang(),"AtkRange/OtherRange/"..role.AttackRangeTexture)
    end
    ---设置距离文本
    if role.Occupation == 3 then
        self.Text_Occ().text = "2R"
    else
        self.Text_Occ().text = "1R"
    end
    ---设置位置文本
    if role.Attacktarget == 1 then
        self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_front")
    elseif role.Attacktarget == 2 then
        self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_passover")
    elseif  role.Attacktarget == 3 then
        self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_end")
    elseif  role.Attacktarget == 4 then
        self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    elseif  role.Attacktarget == 5 then
        self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_random")
    elseif  role.Attacktarget == 7 then
        self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    elseif  role.Attacktarget == 8 then
        self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    end
    ---更新属性
    if role.Occupation == 4 then
        --- 支援型
        self.AtkImg().gameObject:SetActive(false)
        self.SupImg().gameObject:SetActive(true)
        self.AtkInfoTxt().text = (self.GetInfoCorrect(role.RealSuppart)).."%"
        Tools.SetImgFillRate(self.AtkSlider().gameObject, role.RealSuppart)
    else
        --- 非支援
        self.SupImg().gameObject:SetActive(false)
        self.AtkImg().gameObject:SetActive(true)
        self.AtkInfoTxt().text = math.floor(role.RealAtk)
        Tools.SetImgFillRate(self.AtkSlider().gameObject,(tonumber(role.RealAtk)/tonumber(role.Atk)))
    end
    if  self.bData.atkHp >= 1000000 then
        self.HpInfoTxt().text = (self.GetMillionNumInfo(self.bData.atkHp)).."M"
    else
        self.HpInfoTxt().text = self.bData.atkHp
    end
    Tools.SetImgFillRate(self.HPSlider().gameObject,self.bData.atkHp/self.bData.atkHp)
    self.DefInfoTxt().text = (self.GetInfoCorrect(role.RealDef)).."%"
    Tools.SetImgFillRate(self.DefSlider().gameObject,tonumber(role.RealDef))
    self.CriInfoTxt().text = (self.GetInfoCorrect(role.RealCrit)).."%"
    Tools.SetImgFillRate(self.CriSlider().gameObject,role.RealCrit)
    self.EvaInfoTxt().text = (self.GetInfoCorrect(role.RealAgile)).."%"
    Tools.SetImgFillRate(self.AgrSlider().gameObject,role.RealAgile)
    self.ChdInfoTxt().text = (self.GetInfoCorrect(role.RealCritDmg)).."%"
    Tools.SetImgFillRate(self.CritDmgSlider().gameObject,role.RealCritDmg)
    ---更新技能
    self.SkillIcon_1().gameObject:SetActive(true)
    if role.Skill_1_example[1] ~= nil then
        MgrRes.LoadSprite(self.SkillIcon_1(),"Skill/"..role.Skill_1_example[1].Icon)
    else
        MgrRes.LoadSprite(self.SkillIcon_1(),"Skill/icon_skill_empty")
    end
    ---设置点击
    UIEvent.LuaClick(self.SkillIcon_1().gameObject, function()
        MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_1_example,1},true)
    end)
    ---设置技能2
    self.SkillIcon_2().gameObject:SetActive(true)
    if role.Skill_2_example[1]~=nil then
        MgrRes.LoadSprite(self.SkillIcon_2(),"Skill/"..role.Skill_2_example[1].Icon)
    else
        MgrRes.LoadSprite(self.SkillIcon_2(),"Skill/icon_skill_empty")
    end
    ---设置点击2
    UIEvent.LuaClick(self.SkillIcon_2().gameObject, function ()
        MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_2_example,2},true)
    end)
    ---设置技能3
    self.SkillIcon_3().gameObject:SetActive(true)
    if role.Skill_3_example[1]~=nil then
        MgrRes.LoadSprite(self.SkillIcon_3(),"Skill/"..role.Skill_3_example[1].Icon)
    else
        MgrRes.LoadSprite(self.SkillIcon_3(),"Skill/icon_skill_empty")
    end
    ---设置点击3
    UIEvent.LuaClick(self.SkillIcon_3().gameObject, function ()
        MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_3_example,3},true)
    end)
    ---设置技能4
    self.SkillIcon_4().gameObject:SetActive(true)
    if role.Skill_4_example[1]~=nil then
        self.ImageSuo().gameObject:SetActive(role.IsAwaken == false)
        MgrRes.LoadSprite(self.SkillIcon_4(),"Skill/"..role.Skill_4_example[1].Icon)
    else
        MgrRes.LoadSprite(self.SkillIcon_4(),"Skill/icon_skill_empty")
    end
    ---设置点击4
    UIEvent.LuaClick(self.SkillIcon_4().gameObject, function ()
        MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_4_example,4},true)
    end)
    ---设置技能5
    self.SkillIcon_5().gameObject:SetActive(true)
    if role.Skill_5_example[1]~=nil then
        MgrRes.LoadSprite(self.SkillIcon_5(),"Skill/"..role.Skill_5_example[1].Icon)
    else
        MgrRes.LoadSprite(self.SkillIcon_5(),"Skill/icon_skill_empty")
    end
    ---设置点击5
    UIEvent.LuaClick(self.SkillIcon_5().gameObject, function ()
        MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_5_example,5},true)
    end)
    ---点击放大
    UIEvent.LuaClick(self.Btn_ZoomOut().gameObject,function()
        self.UpperLeftPanel().gameObject:SetActive(false)
        self.Panel_Bottom().gameObject:SetActive(false)
        self.Btn_ZoomOut().gameObject:SetActive(false)
        self.Btn_ZoomIn().gameObject:SetActive(true)
        self.Size = self.lihui().transform:GetComponent("RectTransform").sizeDelta
        self.lihui().transform:GetComponent("RectTransform").sizeDelta = Vector2(self.Size.x * 1.2,self.Size.y * 1.2)
    end)
    ---点击缩小
    UIEvent.LuaClick(self.Btn_ZoomIn().gameObject,function()
        self.UpperLeftPanel().gameObject:SetActive(true)
        self.Panel_Bottom().gameObject:SetActive(true)
        self.Btn_ZoomOut().gameObject:SetActive(true)
        self.Btn_ZoomIn().gameObject:SetActive(false)
        self.lihui().transform:GetComponent("RectTransform").sizeDelta = Vector2(self.Size.x,self.Size.y)
    end)
    self.Btn_ZoomOut().gameObject:SetActive(true)
    self.Btn_ZoomIn().gameObject:SetActive(false)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        self:ClosePop()
    end
end
function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end
---取整人物信息 百分比小数后一位
function M.GetInfoCorrect(_Data)
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data*1000)/1)
    tempData = tempInt1 / 10
    return tempData
end
---得到百万级数据的除以100W后精度到小数点后两位的值输出
function M.GetMillionNumInfo(_InputInfo)
    local _tempRateNum = _InputInfo/10000
    local _OutInfo = math.floor(_tempRateNum)/100
    return _OutInfo
end
return M