-- Code Auto Create Begin
local M = Class('SkillPreview_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SkillPreview_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SkillPreview_UI].prefab'
    self.Name = 'Form[SkillPreview_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackImg','BackImg',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu','UpperBtnPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UpperBtnPanel/ReturnBg/Btn_Back',2},{'SkillPanel','SkillPanel',2},{'RankItem','SkillPanel/RankSkillScroll/RankItem',2},{'Img_Jinengdi','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_Jinengdi',2},{'TagPanel','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/TagPanel',2},{'Img_Tag','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_Tag',2},{'Img_Jinengdian_hui','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_Jinengdian_hui',2},{'Img_Jinengdian1','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_Jinengdian1',2},{'JinengdianPanel','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/JinengdianPanel',2},{'Img_Suo','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_Suo',2},{'Img_JiNengJinHua','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_JiNengJinHua',2},{'Img_JiNengQiangHua','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_JiNengQiangHua',2},{'RoleRankBG','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/RoleRankBG',2},{'Img_Jinengfanwei','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Img_Jinengfanwei',2},{'Img_Fanwei','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Img_Jinengfanwei/Img_Fanwei',2},{'Img_Mubiaofanwei','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Img_Mubiaofanwei',2},{'Img_Mubiao','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Img_Mubiaofanwei/Img_Mubiao',2},{'content','SkillPanel/RankSkillScroll/content',2},{'SkillXiangqing','SkillPanel/SkillXiangqing',2},{'BackImg1','SkillPanel/SkillXiangqing/BackImg1',2},{'SkillPrefab','SkillPanel/SkillXiangqing/SkillPrefab',2},{'Img_Jinengdi_light','SkillPanel/SkillXiangqing/SkillPrefab/Img_Jinengdi_light',2},{'TagPanel01','SkillPanel/SkillXiangqing/SkillPrefab/TagPanel',2},{'Img_Tag01','SkillPanel/SkillXiangqing/SkillPrefab/Img_Tag',2},{'Img_Jinengdian_hui01','SkillPanel/SkillXiangqing/SkillPrefab/Img_Jinengdian_hui',2},{'Img_Jinengdian101','SkillPanel/SkillXiangqing/SkillPrefab/Img_Jinengdian1',2},{'JinengdianPanel01','SkillPanel/SkillXiangqing/SkillPrefab/JinengdianPanel',2},{'Img_Suo01','SkillPanel/SkillXiangqing/SkillPrefab/Img_Suo',2},{'Img_JiNengQiangHua01','SkillPanel/SkillXiangqing/SkillPrefab/Img_JiNengQiangHua',2},{'Img_JiNengJinHua01','SkillPanel/SkillXiangqing/SkillPrefab/Img_JiNengJinHua',2},{'TitlePanel','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/TitlePanel',2},{'Img_JiNengQiangHua02','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/TitlePanel/Img_JiNengQiangHua',2},{'Img_JiNengJinHua02','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/TitlePanel/Img_JiNengJinHua',2},{'TagPanel02','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/TagPanel',2},{'Img_Tag02','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Img_Tag',2},{'Img_Zijinengdi','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Img_Zijinengdi',2},{'Img_Exception','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Img_Exception',2},{'Btn_SkillDetailTip','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Btn_SkillDetailTip',2},{'Content','SkillPanel/SkillXiangqing/SkillZhankaiScroll/Content',2},
        -- RawImage 列表
        {'SkillZhankaiScroll','SkillPanel/SkillXiangqing/SkillZhankaiScroll',15},{'ZijinengItem','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem',15},
        -- LoopScrollRect 列表
        {'RankSkillScroll','SkillPanel/RankSkillScroll',18},{'SkillZhankaiScroll01','SkillPanel/SkillXiangqing/SkillZhankaiScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UpperBtnPanel/Text_TitleCn',20},{'Text_TitleEn','UpperBtnPanel/Text_TitleEn',20},{'Text_Tag','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_Tag/Text_Tag',20},{'Text_Jinengming','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Text_Jinengming',20},{'Text_Jinengshuoming','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Text_Jinengshuoming',20},{'Text_Jiesuotiaojian','SkillPanel/RankSkillScroll/RankItem/RoleSkill/RoleDetail_SkillItem/Img_Suo/Text_Jiesuotiaojian',20},{'Text_SkillLv','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/RoleRankBG/Text_SkillLv',20},{'Text_Rank','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Text_Rank',20},{'Text_Jinengfanwei','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Img_Jinengfanwei/Text_Jinengfanwei',20},{'Text_Mubiaofanwei','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Img_Mubiaofanwei/Text_Mubiaofanwei',20},{'Text_Mubiaoshuoming','SkillPanel/RankSkillScroll/RankItem/RoleRankPanel/Img_Mubiaofanwei/Text_Mubiaoshuoming',20},{'Text_Empty','SkillPanel/RankSkillScroll/RankItem/Text_Empty',20},{'Text_Tag01','SkillPanel/SkillXiangqing/SkillPrefab/Img_Tag/Text_Tag',20},{'Text_Jinengming01','SkillPanel/SkillXiangqing/SkillPrefab/Text_Jinengming',20},{'Text_Jinengshuoming01','SkillPanel/SkillXiangqing/SkillPrefab/Text_Jinengshuoming',20},{'Text_Jiesuotiaojian01','SkillPanel/SkillXiangqing/SkillPrefab/Img_Suo/Text_Jiesuotiaojian',20},{'Text_Fujiaxiaoguo','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/TitlePanel/Text_Fujiaxiaoguo',20},{'Text_Tag02','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Img_Tag/Text_Tag',20},{'Text_Fujiashuoming','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Img_Zijinengdi/Text_Fujiashuoming',20},{'Text_Matter','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Img_Exception/Text_Matter',20},{'TipNameTxt','SkillPanel/SkillXiangqing/SkillZhankaiScroll/ZijinengItem/Btn_SkillDetailTip/TipNameTxt',20},
    }
end
-- Code Auto Create End
require("LocalData/SkilltypeoneLocalData")
require("LocalData/SkilltypetwoLocalData")
require("LocalData/SkillexceptionLocalData")

function M:OnInit()
    self.SkillXiangqing().gameObject:SetActive(false)

    self.CurRoleAtt = nil
    self.ChildSkillList = nil

    self:InitButton()
    ---注册滑块
    self.RankSkillScroll():SetLuaCellEvent(Handle(self, self.SkillPage))
    self.SkillZhankaiScroll01():SetLuaCellEvent(Handle(self, self.SkillDetails))
end

function M:Show(pArg)
    self.CurRoleAtt = pArg[1]
    self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.CurRoleAtt.ID)
    self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,nil)    ---根据角色进阶共鸣装备替换技能简略表
    self.RankSkillScroll().totalCount = self.CurRoleAtt.SkillMaxLV+2+3
    self.RankSkillScroll():RefillCells()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("NewRole_BackClick")
        MgrUI.ClosePop(self.Uid)
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---技能详情隐藏
    UIEvent.LuaClick(self.SkillXiangqing().gameObject, function()
        self.SkillXiangqing().gameObject:SetActive(false)
    end,nil,self.SkillXiangqing())
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("NewRole_BackClick")
        MgrUI.ClosePop(self.Uid)
    end
end

---技能页签
function M:SkillPage(trans, idx)
    local tRoleAtt = ReadData.GetRoleAttr(self.CurRoleAtt.ID, self.CurRoleAtt.LV, self.CurRoleAtt.StartLV, idx-1, self.CurRoleAtt.IsAwaken)
    local _RoleRankPanel = CJNUIMgr.GetSunUseName(trans.gameObject, "RoleRankPanel")
    local _SkillItem = CJNUIMgr.GetSunUseName(trans.gameObject, "RoleDetail_SkillItem")
    local _Cotent = CJNUIMgr.GetSunUseName(trans.gameObject, "Content")
    local _RoleSkill = CJNUIMgr.GetSunUseName(trans.gameObject, "RoleSkill")
    local _Text_Empty = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_Empty")
    if idx > self.CurRoleAtt.SkillMaxLV+2 then
        _RoleSkill:SetActive(false)
        _RoleRankPanel:SetActive(false)
        _Text_Empty:SetActive(true)
        return
    end
    _RoleSkill:SetActive(true)
    _RoleRankPanel:SetActive(true)
    _Text_Empty:SetActive(false)
    ---更新攻击距离和范围
    self:UpdataRange(_RoleRankPanel, tRoleAtt)
    ---技能简略描述
    Tools.ClearAllChild(_Cotent)
    for i, v in ipairs(self.ChildSkillList) do
        ---排除EX技能
        if v.SkillNum ~= 5 then
            local tObj = self:CreatObjInPanel(_Cotent, _SkillItem)
            self:SkillItem(v , tRoleAtt, tObj, true)
        end
    end
end

---更新攻击距离和范围
function M:UpdataRange(_RoleRankPanel, _roleAtt)
    local _ImgFanwei = CJNUIMgr.GetSunUseName(_RoleRankPanel, "Img_Fanwei"):GetComponent("Image")
    local _ImgMubiao = CJNUIMgr.GetSunUseName(_RoleRankPanel, "Img_Mubiao"):GetComponent("Image")
    local _TextMubiaoshuoming = CJNUIMgr.GetSunUseName(_RoleRankPanel, "Text_Mubiaoshuoming"):GetComponent("TextMeshProUGUI")
    local _TextSkillLv = CJNUIMgr.GetSunUseName(_RoleRankPanel, "Text_SkillLv"):GetComponent("TextMeshProUGUI")
    
    if _roleAtt.Occupation == 4 then
        MgrRes.LoadSprite(_ImgFanwei, "AtkRange/SupportRange/" .. _roleAtt.AttackRangeTexture)
    else
        MgrRes.LoadSprite(_ImgFanwei, "AtkRange/OtherRange/" .. _roleAtt.AttackRangeTexture)
    end
    ---攻击目标
    MgrRes.LoadSprite(_ImgMubiao,"AtkTarget/AtkTarget_" .. ((_roleAtt.Attacktarget == 7 or _roleAtt.Attacktarget == 8) and 4 or _roleAtt.Attacktarget),nil,true)
    ---攻击目标的描述
    _TextMubiaoshuoming.text =  _roleAtt.AtkTargetTips
    ---技能等级
    _TextSkillLv.text = _roleAtt.SkillLV
end

function M:SkillItem(_skillData,_roleAtt,_skillItem,_needClick)
    ---设置点击事件
    if _needClick then
        UIEvent.LuaClick(_skillItem.gameObject,function()
            self.RankSkillScroll():RefillCells(_roleAtt.SkillLV)
            self:ShowSkillXiangqing(_skillData,_roleAtt,_skillItem)
        end)
    end
    
    local _JinengdianPanel = CJNUIMgr.GetSunUseName(_skillItem, "JinengdianPanel")
    local _Jinengdian1 = CJNUIMgr.GetSunUseName(_skillItem, "Img_Jinengdian1")
    local _Jinengdian_hui = CJNUIMgr.GetSunUseName(_skillItem, "Img_Jinengdian_hui")
    local _TextJinengming = CJNUIMgr.GetSunUseName(_skillItem, "Text_Jinengming"):GetComponent("TextMeshProUGUI")
    local _TextJinengshuoming = CJNUIMgr.GetSunUseName(_skillItem, "Text_Jinengshuoming"):GetComponent("TextMeshProUGUI")
    local _TextJiesuotiaojian = CJNUIMgr.GetSunUseName(_skillItem, "Text_Jiesuotiaojian"):GetComponent("TextMeshProUGUI")
    local _ImgSuo = CJNUIMgr.GetSunUseName(_skillItem, "Img_Suo")
    local _ImgTag = CJNUIMgr.GetSunUseName(_skillItem, "Img_Tag")
    local _TagPanel = CJNUIMgr.GetSunUseName(_skillItem, "TagPanel")
    local _ImgJiNengJinHua = CJNUIMgr.GetSunUseName(_skillItem, "Img_JiNengJinHua")
    local _ImgJiNengQiangHua = CJNUIMgr.GetSunUseName(_skillItem, "Img_JiNengQiangHua")
    
    local tTagList = {}
    local tSkillState = 0
    ---技能栏5为EX
    if _skillData.SkillNum ~= 5 then
        ---非EX技能有进阶星
        Tools.ClearAllChild(_JinengdianPanel.gameObject)
        for i, v in ipairs(_skillData.SkillLvStage) do
            if _roleAtt.SkillLV >= v then
                self:CreatObjInPanel(_JinengdianPanel,_Jinengdian1)
                if v ~= 0 and _roleAtt.SkillLV == v then
                    tSkillState = 1
                end
            else
                self:CreatObjInPanel(_JinengdianPanel,_Jinengdian_hui)
            end
        end
    end
    ---获取当前等级段的技能
    local tIsOpen = true
    local tMarkLv = _skillData.UnlockLv[1]
    for i, v in ipairs(_skillData.UnlockLv) do
        if _roleAtt.SkillLV >= v then
            tMarkLv = v
            if v ~= 0 and _roleAtt.SkillLV == v then
                tSkillState = 2
            end
        else
            if i == 1 then
                tIsOpen = false
            end
            break
        end
    end
    local tSkillList = _skillData.SkillList[tMarkLv]
    local tIsAwaken = true
    if SkillLocalData.tab[tSkillList[1]][8] == 1 then
        tIsAwaken = _roleAtt.IsAwaken
    end
    ---技能提升状态(0.无提升 1.强化 2.进化)
    if tSkillState == 0 then
        _ImgJiNengJinHua:SetActive(false)
        _ImgJiNengQiangHua:SetActive(false)
    elseif tSkillState == 1 then
        _ImgJiNengJinHua:SetActive(false)
        _ImgJiNengQiangHua:SetActive(true)
    elseif tSkillState == 2 then
        _ImgJiNengJinHua:SetActive(true)
        _ImgJiNengQiangHua:SetActive(false)
    end
    ---技能名
    _TextJinengming.text = _skillData.GroupName[tMarkLv]

    if tIsOpen then
        ---技能说明
        if tIsAwaken then
            _TextJinengshuoming.text = _skillData.Tips[tMarkLv]
            _ImgSuo.gameObject:SetActive(false)
        else
            _TextJinengshuoming.text = _skillData.Tips[tMarkLv]
            _ImgSuo.gameObject:SetActive(true)
            _TextJiesuotiaojian.text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text142")
        end
        ---标签
        local tagObj = self:InitPanel(_TagPanel, _ImgTag,#_skillData.TagList[tMarkLv])
        for i = 1, #tagObj do
            local tagStr = tagObj[i].transform:Find("Text_Tag").gameObject
            local tempTxt = SkilltxtLocalData.tab[tonumber(_skillData.TagList[tMarkLv][i])]
            if tempTxt == nil then
                print("标签ID不匹配")
                tagObj[i].gameObject:SetActive(false)
                return
            end
            tagStr:GetComponent("TextMeshProUGUI").text = tempTxt[2]
            tTagList[#tTagList+1] = tempTxt[2]
        end
    else
        _TextJinengshuoming.text = _skillData.Tips[tMarkLv]
        _TextJiesuotiaojian.text = string.format(MgrLanguageData.GetLanguageByKey("newroleskill_ui_text1"),tMarkLv)
        _ImgSuo.gameObject:SetActive(true)
    end
    self.XiangqingData = {
        isEquipReach = tIsEquipReach,
        tagList = tTagList,
        curSkillLv = _roleAtt.SkillLV
    }
end
---技能详情
function M:ShowSkillXiangqing(_skillDetail,_roleAtt,_ObjPrefab)
    local tCurHeroAttr = _roleAtt
    
    self.CurSkillLv = tCurHeroAttr.SkillLV
    self.SkillDetail = {}
    ---界面默认显示4个窗口，不足需要补齐
    local tSkillExample = {}
    if _skillDetail.SkillNum == 1 then
        tSkillExample = tCurHeroAttr.Skill_1_example
    elseif _skillDetail.SkillNum == 2 then
        tSkillExample = tCurHeroAttr.Skill_2_example
    elseif _skillDetail.SkillNum == 3 then
        tSkillExample = tCurHeroAttr.Skill_3_example
    elseif _skillDetail.SkillNum == 4 then
        tSkillExample = tCurHeroAttr.Skill_4_example
    elseif _skillDetail.SkillNum == 5 then
        tSkillExample = tCurHeroAttr.Skill_5_example
    end
    self.SkillDetail = tSkillExample
    
    self.SkillZhankaiScroll01():RefillCells()
    self.SkillXiangqing().gameObject:SetActive(true)

    self.SkillPrefab().transform.anchoredPosition = _ObjPrefab.transform.anchoredPosition
    self:SkillItem(_skillDetail,_roleAtt,self.SkillPrefab().gameObject,false)
end

function M:SkillDetails(trans, idx)
    self:DetailSkillItem(trans.gameObject, self.SkillDetail[idx], self.CurSkillLv)
end
---技能详情展示
function M:DetailSkillItem(_item, _skillDetail, _CurSkillLv)
    local _ImgTag = CJNUIMgr.GetSunUseName(_item, "Img_Tag")
    local _ImgJiNengQiangHua = CJNUIMgr.GetSunUseName(_item, "Img_JiNengQiangHua")
    local _ImgJiNengJinHua = CJNUIMgr.GetSunUseName(_item, "Img_JiNengJinHua")
    local _TagPanel = CJNUIMgr.GetSunUseName(_item, "TagPanel")
    local _BtnSkillDetailTip = CJNUIMgr.GetSunUseName(_item, "Btn_SkillDetailTip")
    local _ImgException = CJNUIMgr.GetSunUseName(_item, "Img_Exception")
    local _TextFujiaxiaoguo = CJNUIMgr.GetSunUseName(_item, "Text_Fujiaxiaoguo"):GetComponent("TextMeshProUGUI")
    local _TextFujiashuoming = CJNUIMgr.GetSunUseName(_item, "Text_Fujiashuoming"):GetComponent("TextMeshProUGUI")
    local _TextMatter = CJNUIMgr.GetSunUseName(_item, "Text_Matter"):GetComponent("TextMeshProUGUI")
    
    _ImgTag:SetActive(false)
    local tTagObj = self:InitPanel(_TagPanel, _ImgTag, 2)
    
    if _skillDetail == nil then
        _TextFujiaxiaoguo.text = ""
        _TextFujiashuoming.text = ""
        for i = 1, #tTagObj do
            tTagObj[i].gameObject:SetActive(false)
        end
        _BtnSkillDetailTip:SetActive(false)
        _ImgJiNengJinHua:SetActive(false)
        _ImgJiNengQiangHua:SetActive(false)
        return
    end
    _TextFujiaxiaoguo.text = _skillDetail.Name

    ---技能提升状态(0.无提升 1.强化 2.进化)
    local tSkillState = 0
    for i, v in ipairs(_skillDetail.SkillLvStage) do
        if v == _CurSkillLv then
            tSkillState = 1
            break
        end
    end
    if _skillDetail.Evolve == _CurSkillLv then
        tSkillState = 2
    end
    if tSkillState == 0 then
        _ImgJiNengJinHua:SetActive(false)
        _ImgJiNengQiangHua:SetActive(false)
    elseif tSkillState == 1 then
        _ImgJiNengJinHua:SetActive(false)
        _ImgJiNengQiangHua:SetActive(true)
    elseif tSkillState == 2 then
        _ImgJiNengJinHua:SetActive(true)
        _ImgJiNengQiangHua:SetActive(false)
    end
    --Tag标签
    for i = 1, #tTagObj do
        local tagStr = tTagObj[i].transform:Find("Text_Tag").gameObject
        local tagType = nil
        if i == 1 then
            tagType = SkilltypeoneLocalData.tab[_skillDetail.Skilltype1]
        else
            tagType = SkilltypetwoLocalData.tab[_skillDetail.Skilltype2]
        end

        if tagType == nil then
            print("标签ID不匹配")
            tTagObj[i].gameObject:SetActive(false)
            return
        end
        tTagObj[i].gameObject:SetActive(true)
        tagStr:GetComponent("TextMeshProUGUI").text = tagType[2]
    end
    Tools.ReSize(_TagPanel)
    ---说明
    _skillDetail.Explain = string.gsub(_skillDetail.Explain, "<size=42>", "<size=20>")
    _skillDetail.Explain = string.gsub(_skillDetail.Explain, "<size=38>", "<size=20>")
    _TextFujiashuoming.text = _skillDetail.Explain
    ---例外事项
    local exception = string.split(_skillDetail.Exception,"@")
    if exception[1] == "0" or #exception == 0 then
        _BtnSkillDetailTip:SetActive(false)
        return
    end

    local text = ""
    for i = 1, #exception do
        text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
    end
    _TextMatter.text = text
    
    _BtnSkillDetailTip:SetActive(true)
    ---长按查看例外事项
    local isTouch = false
    UIEvent.LuaPressClick(_item, Handle(self, function()
        if isTouch or not _BtnSkillDetailTip.activeSelf then
            return
        end
        isTouch = true
        _ImgException:SetActive(true)
        MgrTimer.AddRepeat("ExceptionTouch", 0, function()
            if UIEvent.GetButton_Up() == true then
                MgrTimer.Cancel("ExceptionTouch")
                _ImgException:SetActive(false)
                isTouch = false
            end
        end, -1, nil)
    end))
end

--创建Panel中的元素 _Root为父节点
function M:CreatObjInPanel(_Root, _Prefab)
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3(tempObj.transform.localPosition.x, tempObj.transform.localPosition.y, 0)

    return tempObj
end
--初始化Panel中的元素
function M:InitPanel(_Root, _Prefab, _Count)
    Tools.ClearAllChild(_Root)
    local tempObjList = {}
    for i = 1, _Count, 1 do
        tempObjList[i] = self:CreatObjInPanel(_Root, _Prefab)
    end

    return tempObjList
end

return M