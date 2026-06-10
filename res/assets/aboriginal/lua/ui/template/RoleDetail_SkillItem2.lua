-- Code Auto Create Begin
local M = Class('RoleDetail_SkillItem2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleDetail_SkillItem2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'XinxiPanel','XinxiPanel',2},{'Xinxi','XinxiPanel/Xinxi',2},{'Tap1','XinxiPanel/JueSeDingWei/Tap1',2},{'Tap2','XinxiPanel/JueSeDingWei/Tap2',2},{'Jineng','XinxiPanel/Jineng',2},{'Fanwei','Fanwei',2},{'Img_Jinengfanwei','Fanwei/Img_Jinengfanwei',2},{'Img_Fanwei','Fanwei/Img_Jinengfanwei/Img_Fanwei',2},{'Img_Mubiaofanwei','Fanwei/Img_Mubiaofanwei',2},{'Img_Mubiao','Fanwei/Img_Mubiaofanwei/Img_Mubiao',2},{'SkillRange','SkillRange',2},{'Name','SkillRange/Name',2},{'Img_Fanwei1','SkillRange/Img_Fanwei1',2},{'Img_Jiantou','SkillRange/Img_Jiantou',2},{'Img_Fanwei2','SkillRange/Img_Fanwei2',2},{'SkillTarget','SkillTarget',2},{'Name01','SkillTarget/Name',2},{'Img_Mubiao1','SkillTarget/Img_Mubiao1',2},{'Img_Jiantou01','SkillTarget/Img_Jiantou',2},{'Img_Mubiao2','SkillTarget/Img_Mubiao2',2},{'SkillNamePanel','SkillNamePanel',2},{'SkillName','SkillNamePanel/SkillName',2},{'Ex','SkillNamePanel/SkillName/Ex',2},{'Img_Suo','SkillNamePanel/SkillName/Img_Suo',2},{'Img_suo','SkillNamePanel/SkillName/Img_Suo/Text_Jiesuotiaojian/Img_suo',2},{'SubSkill','SubSkill',2},{'SubSkillPoint','SubSkill/SubNamePanel/SubSkillPoint',2},{'TagPanel','SubSkill/SubNamePanel/TagPanel',2},{'Img_Tag1','SubSkill/SubNamePanel/TagPanel/Img_Tag1',2},{'Img_Tag2','SubSkill/SubNamePanel/TagPanel/Img_Tag2',2},{'Img_Exception','SubSkill/SubNamePanel/Img_Exception',2},{'SkillTips','SubSkill/SkillTips',2},{'TipsPanel','SubSkill/TipsPanel',2},{'Btn_SkillDetailTip','SubSkill/TipsPanel/Btn_SkillDetailTip',2},
        -- UITemplate 列表
        {'RoleDetail_SkillItem2','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Xinxi','XinxiPanel/Xinxi/Text_Xinxi',20},{'ZhiYe','XinxiPanel/ZhiYe',20},{'GongJi','XinxiPanel/ZhiYe/GongJi',20},{'XiaoDui','XinxiPanel/XiaoDui',20},{'XiaoDui01','XinxiPanel/XiaoDui/XiaoDui',20},{'DengJiShangXian','XinxiPanel/DengJiShangXian',20},{'Dengji','XinxiPanel/DengJiShangXian/Dengji',20},{'XiYouDu','XinxiPanel/XiYouDu',20},{'SSR','XinxiPanel/XiYouDu/SSR',20},{'JueSeDingWei','XinxiPanel/JueSeDingWei',20},{'Text_Tap1','XinxiPanel/JueSeDingWei/Tap1/Text_Tap1',20},{'Text_Tap2','XinxiPanel/JueSeDingWei/Tap2/Text_Tap2',20},{'Text_Jineng','XinxiPanel/Jineng/Text_Jineng',20},{'Text_Jinengfanwei','Fanwei/Img_Jinengfanwei/Text_Jinengfanwei',20},{'Text_Mubiaofanwei','Fanwei/Img_Mubiaofanwei/Text_Mubiaofanwei',20},{'Text_Mubiaoshuoming','Fanwei/Img_Mubiaofanwei/Text_Mubiaoshuoming',20},{'Text_Name','SkillRange/Name/Text_Name',20},{'Text_Name01','SkillTarget/Name/Text_Name',20},{'Text_Mubiaoshuoming01','SkillTarget/Img_Mubiao1/Text_Mubiaoshuoming',20},{'Text_Mubiaoshuoming02','SkillTarget/Img_Mubiao2/Text_Mubiaoshuoming',20},{'Text_SkillName','SkillNamePanel/SkillName/Text_SkillName',20},{'Text_Tag','SkillNamePanel/SkillName/Ex/Text_Tag',20},{'Text_Jiesuotiaojian','SkillNamePanel/SkillName/Img_Suo/Text_Jiesuotiaojian',20},{'Text_SubSkillName','SubSkill/SubNamePanel/SubSkillPoint/Text_SubSkillName',20},{'Text_Tag01','SubSkill/SubNamePanel/TagPanel/Img_Tag1/Text_Tag',20},{'Text_Tag02','SubSkill/SubNamePanel/TagPanel/Img_Tag2/Text_Tag',20},{'Text_Matter','SubSkill/SubNamePanel/Img_Exception/Text_Matter',20},{'Text_Jinengshuoming','SubSkill/SkillTips/Text_Jinengshuoming',20},{'TipNameTxt','SubSkill/TipsPanel/Btn_SkillDetailTip/TipNameTxt',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillexceptionLocalData")
require("LocalData/SkilltypeoneLocalData")
require("LocalData/SkilltypetwoLocalData")

function M:OnInit()
     self.Fanwei().gameObject:SetActive(false)
     self.SubSkill().gameObject:SetActive(false)
     self.SkillRange().gameObject:SetActive(false)
     self.SkillTarget().gameObject:SetActive(false)
     self.Img_Exception().gameObject:SetActive(false)
     self.XinxiPanel().gameObject:SetActive(false)

     self.CurHero = nil
     self.CurHeroAttr = nil
     self.CurChildSkillList = nil
     self.CurSkillLv = nil
     self.SkillList = {}
end
function M:OnUpdateUI(pData)
    self.XinxiPanel().gameObject:SetActive(false)

    self.CurHero = pData[1]
    ---@type BattleRole
    self.CurHeroAttr = pData[2]
    self.CurChildSkillList = pData[3]
    self.CurSkillLv = pData[4]
    self.SkillType = pData[5]
    self.idx = pData[6]
    self.parent = pData[7]

    ---更新技能数据
    if self.SkillType == "ChildSkill" then
        ---更新攻击范围
        self:UpdataRange(self.CurSkillLv)
        self:UpdataSkill()
    elseif self.SkillType == "RoleXiangQing" then
        ---人物详情
        if self.idx == 1 then
            self:UpdataFanWei(self.CurSkillLv)
            self:InitCardRole(self.CurHero)
        else
            self.Fanwei().gameObject:SetActive(false)
        end
        self:UpdateSkillItem()
    else
        --技能等级设置
        if self.CurSkillLv and self.CurHero.heroFlag and self.CurHero.heroFlag ~= 0 then
            self.CurSkillLv = self.CurHero.heroCurSkill
        end
        if self.SkillType == "ParentSkill" then
            if self.idx == 1 then
                self:UpdataFanWei(self.CurSkillLv)
            else
                self.Fanwei().gameObject:SetActive(false)
            end
        end
        self:UpdateSkillItem()
    end
end

function M:UpdataFanWei(_skillLv)
    if _skillLv == nil then
        self.Fanwei().gameObject:SetActive(false)
        return
    end
    local tHeroAttr = nil
    if self.CurHero.skin == nil then
        tHeroAttr = ReadData.GetMonsterAttr(self.CurHero.id, self.CurHero.star, _skillLv, self.CurHero.awaken, self.CurHero.level)
    else
        tHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, _skillLv, self.CurHero.awaken)
    end
    if self.CurHeroAttr.Occupation == 4 then
        MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/SupportRange/" .. tHeroAttr.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/OtherRange/" .. tHeroAttr.AttackRangeTexture)
    end
    ---攻击目标
    MgrRes.LoadSprite(self.Img_Mubiao(),"AtkTarget/AtkTarget_" .. ((tHeroAttr.Attacktarget == 7 or tHeroAttr.Attacktarget == 8) and 4 or tHeroAttr.Attacktarget),nil,true)

    ---攻击文字介绍
    self.Text_Mubiaoshuoming().text = tHeroAttr.AtkTargetTips

    self.Fanwei().gameObject:SetActive(true)
end

---更新攻击范围
function M:UpdataRange(_skillLv)
    if _skillLv == nil then
        return
    end
    if self.CurHeroAttr == nil or self.CurHeroAttr.SkillChangeRange[_skillLv] == nil then
        self.SkillRange().gameObject:SetActive(false)
    else
        local tHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, _skillLv, self.CurHero.awaken)
        local tFrontHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, _skillLv-1, self.CurHero.awaken)
        self.SkillRange().gameObject:SetActive(true)
        if self.CurHeroAttr.Occupation == 4 then
            MgrRes.LoadSprite(self.Img_Fanwei1(), "AtkRange/SupportRange/" .. tFrontHeroAttr.AttackRangeTexture)
            MgrRes.LoadSprite(self.Img_Fanwei2(), "AtkRange/SupportRange/" .. tHeroAttr.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Img_Fanwei1(), "AtkRange/OtherRange/" .. tFrontHeroAttr.AttackRangeTexture)
            MgrRes.LoadSprite(self.Img_Fanwei2(), "AtkRange/OtherRange/" .. tHeroAttr.AttackRangeTexture)
        end
    end
end

---更新技能数据(根据技能数据)
function M:UpdateSkillItem()
    local tMarkLv = self.CurChildSkillList.UnlockLv[1]
    for i, v in ipairs(self.CurChildSkillList.UnlockLv) do
        if self.CurSkillLv ~= nil and self.CurSkillLv >= v then
            tMarkLv = v
        else
            break
        end
    end
    local tSkillList = self.CurChildSkillList.SkillList[tMarkLv]
    ---技能名称
    self.Text_SkillName().text = self.CurChildSkillList.GroupName[tMarkLv]
    ---觉醒
    local tIsAwaken = true
    if SkillLocalData.tab[tSkillList[1]][8] == 1 then
        tIsAwaken = self.CurHeroAttr.IsAwaken
    end
    if tIsAwaken then
        ---判断三星技能是否解锁
        local threeStarUnLock = true
        if self.CurHeroAttr.StartLV < 3 and self.CurChildSkillList.SkillNum == 3 then
            threeStarUnLock = false
        end
        if not threeStarUnLock then
            ---未满足三星解锁
            self.Img_Suo().gameObject:SetActive(true)
            self.Text_Jiesuotiaojian().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text150")
            ---如果是怪物
            if self.CurHeroAttr.IsMonster then
                self.ObjRoot:SetActive(false)
                return
            end
        else
            self.Img_Suo().gameObject:SetActive(false)
        end
    else
        self.Img_Suo().gameObject:SetActive(true)
        self.Text_Jiesuotiaojian().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text142")
        ---如果是怪物
        if self.CurHeroAttr.IsMonster then
            self.ObjRoot:SetActive(false)
            return
        end
    end
    ---EX技能
    self.Ex().gameObject:SetActive(self.CurChildSkillList.IsEx)

    --修改技能描述
    -- for index, value in ipairs(5) do
    --     if self.CurHeroAttr.Skill_ ..index .._example ~= nil then
    --         self.CurHeroAttr.Skill_..index .._example[1].Explain = self.parent.BattleRole.Skill_..index .._example[1].Explain
    --     end
    -- end
    if self.parent ~= nil then
        if self.CurHeroAttr.Skill_1_example[1] ~= nil then self.CurHeroAttr.Skill_1_example = self.parent.BattleRole.Skill_1_example end
        if self.CurHeroAttr.Skill_2_example[1] ~= nil then self.CurHeroAttr.Skill_2_example = self.parent.BattleRole.Skill_2_example end
        if self.CurHeroAttr.Skill_3_example[1] ~= nil then self.CurHeroAttr.Skill_3_example = self.parent.BattleRole.Skill_3_example end
        if self.CurHeroAttr.Skill_4_example[1] ~= nil then self.CurHeroAttr.Skill_4_example = self.parent.BattleRole.Skill_4_example end
        if self.CurHeroAttr.Skill_5_example[1] ~= nil then self.CurHeroAttr.Skill_5_example = self.parent.BattleRole.Skill_5_example end
    end
    ---技能详情
    local tSkillList = { [1] = { self.CurHeroAttr.Skill_1_example, self.CurHeroAttr.Skill_1 },
                         [2] = { self.CurHeroAttr.Skill_2_example, self.CurHeroAttr.Skill_2 },
                         [3] = { self.CurHeroAttr.Skill_3_example, self.CurHeroAttr.Skill_3 },
                         [4] = { self.CurHeroAttr.Skill_4_example, self.CurHeroAttr.Skill_4 },
                         [5] = { self.CurHeroAttr.Skill_5_example, self.CurHeroAttr.Skill_5 },
    }
    local ChildSkillList = tSkillList[self.CurChildSkillList.SkillNum][1]
    local n = 0
    if next(ChildSkillList) ~= nil then
        for i, v in ipairs(ChildSkillList) do
            n = i+1
            if #self.SkillList < i then
                self.SkillList[i] = GameObject.Instantiate(self.SubSkill().gameObject, self.ObjRoot.transform)
            end

            self.SkillList[i].gameObject:SetActive(true)
            self:UpdataSkillDetail(self.SkillList[i], v)
        end
        for i = n, #self.SkillList do
            self.SkillList[i].gameObject:SetActive(false)
        end
    else
        self.ObjRoot:SetActive(false)
        return
    end
end
---更新技能数据(根据子技能数据)
function M:UpdataSkill()
    if self.CurChildSkillList == nil then
        self.SkillNamePanel().gameObject:SetActive(false)
        for i = 1, #self.SkillList do
            self.SkillList[i].gameObject:SetActive(false)
        end
        return
    end
    local tSkillSimple = SkillDetailControl.GetSkillData(self.CurHero.id, self.CurChildSkillList[1].Id)
    if tSkillSimple then
        local tMarkLv = tSkillSimple.UnlockLv[1]
        for i, v in ipairs(tSkillSimple.UnlockLv) do
            if self.CurHeroAttr.ShowSkillLV >= v then
                tMarkLv = v
            else
                break
            end
        end
        local tSkillList = tSkillSimple.SkillList[tMarkLv]
        ---技能名称
        self.Text_SkillName().text = tSkillSimple.GroupName[tMarkLv]
        ---觉醒
        local tIsAwaken = true
        if SkillLocalData.tab[tSkillList[1]][8] == 1 then
            tIsAwaken = self.CurHeroAttr.IsAwaken
        end
        if tIsAwaken then
            ---判断三星技能是否解锁
            local threeStarUnLock = true
            if self.CurHeroAttr.StartLV < 3 and tSkillSimple.SkillNum == 3 then
                threeStarUnLock = false
            end
            if not threeStarUnLock then     
                ---未满足三星解锁
                self.Img_Suo().gameObject:SetActive(true)
                self.Text_Jiesuotiaojian().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text150")
            else
                self.Img_Suo().gameObject:SetActive(false)
            end
        else
            self.Img_Suo().gameObject:SetActive(true)
            self.Text_Jiesuotiaojian().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text142")
        end
        ---EX技能
        self.Ex().gameObject:SetActive(tSkillSimple.IsEx)

        self.SkillNamePanel().gameObject:SetActive(true)
    end
    ---技能详情
    local n = 0
    for i, v in ipairs(self.CurChildSkillList) do
        n = i+1
        if #self.SkillList < i then
            self.SkillList[i] = GameObject.Instantiate(self.SubSkill().gameObject, self.ObjRoot.transform)
        end
       
        self.SkillList[i].gameObject:SetActive(true)
        self:UpdataSkillDetail(self.SkillList[i], v)
    end
    for i = n, #self.SkillList do
        self.SkillList[i].gameObject:SetActive(false)
    end
end

function M:UpdataSkillDetail(_obj, _data)
    local tSkillName = CJNUIMgr.GetSunUseName(_obj, "Text_SubSkillName"):GetComponent("TextMeshProUGUI")
    local tSkillTips = CJNUIMgr.GetSunUseName(_obj, "Text_Jinengshuoming"):GetComponent("TextMeshProUGUI")
    local tSkillMatter = CJNUIMgr.GetSunUseName(_obj, "Text_Matter"):GetComponent("TextMeshProUGUI")
    local tSkillDetailBtn = CJNUIMgr.GetSunUseName(_obj, "Btn_SkillDetailTip")
    local tSkillException = CJNUIMgr.GetSunUseName(_obj, "Img_Exception")
    local tTipsPanel = CJNUIMgr.GetSunUseName(_obj, "TipsPanel")
    local tTagPanel = CJNUIMgr.GetSunUseName(_obj, "TagPanel")
    local tImgTag = CJNUIMgr.GetSunUseName(_obj, "Img_Tag")
    
    ---子技能名称
    tSkillName.text = _data.Name
    ---子技能说明
    tSkillTips.text = _data.Explain

    ---例外事项
    local exception = string.split(_data.Exception,"@")
    if exception[1] == "0" or #exception == 0 then
        tTipsPanel.gameObject:SetActive(false)
    else
        tTipsPanel.gameObject:SetActive(true)
        local text = ""
        for i = 1, #exception do
            text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
        end
        tSkillMatter.text = text
    end
    ---长按查看体力
    local isTouch = false
    UIEvent.LuaPressClick(tSkillDetailBtn.gameObject, Handle(self, function()
        if isTouch or not tSkillDetailBtn.gameObject.activeSelf then
            return
        end
        isTouch = true
        tSkillException.gameObject:SetActive(true)
        MgrTimer.AddRepeat("ExceptionTouch", 0, function()
            if UIEvent.GetButton_Up() == true then
                MgrTimer.Cancel("ExceptionTouch")
                tSkillException.gameObject:SetActive(false)
                isTouch = false
            end
        end, -1, nil)
    end))
    --Tag标签
    for i = 1, tTagPanel.transform.childCount do
        local tChildData = tTagPanel.transform:GetChild(i-1)
        local tagStr = tChildData.transform:Find("Text_Tag").gameObject
        local tagType = nil
        if i == 1 then
            tagType = SkilltypeoneLocalData.tab[_data.Skilltype1]
        else
            tagType = SkilltypetwoLocalData.tab[_data.Skilltype2]
        end

        if tagType == nil then
            print("标签ID不匹配")
            tChildData.gameObject:SetActive(false)
            return
        end
        tChildData.gameObject:SetActive(true)
        tagStr:GetComponent("TextMeshProUGUI").text = tagType[2]
    end
end

function M:InitCardRole(_roleData)
    if _roleData == nil then
        return
    end
    --职业
    if _roleData.New_Career == 1 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text207")
    elseif _roleData.New_Career == 2 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
    elseif _roleData.New_Career == 3 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text208")
    elseif _roleData.New_Career == 4 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text141")
    elseif _roleData.New_Career == 11 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text256")
    end
    --小队
    self.XiaoDui01().text = _roleData.CampTxt
    --等级上限
    self.Dengji().text = 90 + (_roleData.rank - 2) * 5
    --稀有度
    if _roleData.rank == 2 then
        self.SSR().text = MgrLanguageData.GetLanguageByKey("ui_tips_4")
    elseif _roleData.rank == 3 then
        self.SSR().text = MgrLanguageData.GetLanguageByKey("ui_tips_5")
    elseif _roleData.rank == 4 then
        self.SSR().text = MgrLanguageData.GetLanguageByKey("ui_tips_6")
    end
    --角色定位
    if _roleData.label ~= nil and _roleData.label ~= "" then
        local str = string.split(_roleData.label,",")
        self.Text_Tap1().text = str[1]
        if str[2] ~= nil then
            self.Text_Tap2().text = str[2]
        end
    else
        self.Tap1().gameObject:SetActive(false)
        self.Tap2().gameObject:SetActive(false)
    end
    self.XinxiPanel().gameObject:SetActive(true)
end

return M