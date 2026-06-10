-- Code Auto Create Begin
local M = Class('VoidSpecialGearDetail_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VoidSpecialGearDetail_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VoidSpecialGearDetail_UI].prefab'
    self.Name = 'Form[VoidSpecialGearDetail_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Equipbg','Equipbg',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu','UpperBtnPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UpperBtnPanel/ReturnBg/Btn_Back',2},{'Btn_Help','UpperBtnPanel/Btn_Help',2},{'Huobi','Huobi',2},{'Btn_Huobi','Huobi/Btn_Huobi',2},{'Btn_Add','Huobi/Btn_Huobi/Btn_Add',2},{'Img_Icon','Huobi/Btn_Huobi/Img_Icon',2},{'vfxroot','vfxroot',2},{'LeftPanel','vfxroot/LeftPanel',2},{'VoidGearIconPanel','vfxroot/LeftPanel/VoidGearIconPanel',2},{'VoidGearRankIcon','vfxroot/LeftPanel/VoidGearIconPanel/VoidGearRankIcon',2},{'VoidGearIcon','vfxroot/LeftPanel/VoidGearIconPanel/VoidGearIcon',2},{'Img_Chaoxianxing1','vfxroot/LeftPanel/Img_Chaoxianxing1',2},{'Img_Chaoxianxing2','vfxroot/LeftPanel/Img_Chaoxianxing2',2},{'Viewport','vfxroot/LeftPanel/ScrollView/Viewport',2},{'RightPanel','vfxroot/RightPanel',2},{'VoidGearMixPreview','vfxroot/RightPanel/VoidGearMixPreview',2},{'jiantou_Mix','vfxroot/RightPanel/VoidGearMixPreview/jiantou_Mix',2},{'ScrollView_Mix','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix',2},{'Viewport01','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport',2},{'VoidGearContent_Mix','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearContent_Mix',2},{'VoidGearInfoPrefab','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearInfoPrefab',2},{'Icondi','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearInfoPrefab/Icondi',2},{'Icon','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearInfoPrefab/Icon',2},{'jiantou','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearInfoPrefab/jiantou',2},{'VoidGearSkillPrefab','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab',2},{'Img_SkillXian','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_SkillXian',2},{'Img_Suo','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_Suo',2},{'Img_suo','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_Suo/Text_Jiesuotiaojian/Img_suo',2},{'GearSubSkill','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill',2},{'SubSkillPoint','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/SubSkillPoint',2},{'TagPanel','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel',2},{'Img_Tag1','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag1',2},{'Img_Tag2','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag2',2},{'Img_Exception','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/Img_Exception',2},{'SkillTips','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SkillTips',2},{'TipsPanel','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/TipsPanel',2},{'Btn_SkillDetailTip','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/TipsPanel/Btn_SkillDetailTip',2},{'VoidGearUpgradePreview','vfxroot/RightPanel/VoidGearUpgradePreview',2},{'Jingyantiao','vfxroot/RightPanel/VoidGearUpgradePreview/Jingyantiao',2},{'Img_CurExpSlider','vfxroot/RightPanel/VoidGearUpgradePreview/Jingyantiao/Img_CurExpSlider',2},{'Img_PreviewExpSlider','vfxroot/RightPanel/VoidGearUpgradePreview/Jingyantiao/Img_PreviewExpSlider',2},{'jiantou01','vfxroot/RightPanel/VoidGearUpgradePreview/jiantou',2},{'VoidGearContent_LevelUp','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearContent_LevelUp',2},{'VoidGearInfoPrefab01','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearInfoPrefab',2},{'Icondi01','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearInfoPrefab/Icondi',2},{'Icon01','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearInfoPrefab/Icon',2},{'jiantou02','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearInfoPrefab/jiantou',2},{'VoidGearBreakPreview','vfxroot/RightPanel/VoidGearBreakPreview',2},{'jiantou_Break','vfxroot/RightPanel/VoidGearBreakPreview/jiantou_Break',2},{'ScrollView_Break','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break',2},{'Viewport02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport',2},{'VoidGearContent_Break','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearContent_Break',2},{'VoidGearInfoPrefab02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearInfoPrefab',2},{'Icondi02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearInfoPrefab/Icondi',2},{'Icon02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearInfoPrefab/Icon',2},{'jiantou03','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearInfoPrefab/jiantou',2},{'VoidGearSkillPrefab01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab',2},{'Img_SkillXian01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_SkillXian',2},{'Img_SkillSuo','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_SkillSuo',2},{'Img_suo01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_SkillSuo/Text_Jiesuotiaojian/Img_suo',2},{'GearSubSkill01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill',2},{'SubSkillPoint01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/SubSkillPoint',2},{'TagPanel01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel',2},{'Img_Tag101','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag1',2},{'Img_Tag201','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag2',2},{'Img_Exception01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/Img_Exception',2},{'SkillTips01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SkillTips',2},{'TipsPanel01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/TipsPanel',2},{'Btn_SkillDetailTip01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/TipsPanel/Btn_SkillDetailTip',2},{'UpDownPanel','vfxroot/RightPanel/UpDownPanel',2},{'Img_Shiyongshuliangdi','vfxroot/RightPanel/UpDownPanel/Img_Shiyongshuliangdi',2},{'Lvmaxdi','vfxroot/RightPanel/UpDownPanel/Lvmaxdi',2},{'Btn_MaxLv','vfxroot/RightPanel/UpDownPanel/Lvmaxdi/Btn_MaxLv',2},{'lvmindi','vfxroot/RightPanel/UpDownPanel/lvmindi',2},{'Btn_MinLv','vfxroot/RightPanel/UpDownPanel/lvmindi/Btn_MinLv',2},{'Btn_LvDown','vfxroot/RightPanel/UpDownPanel/Btn_LvDown',2},{'-(hui)2','vfxroot/RightPanel/UpDownPanel/Btn_LvDown/-(hui)2',2},{'Btn_LvDownLight','vfxroot/RightPanel/UpDownPanel/Btn_LvDownLight',2},{'-(hei)2','vfxroot/RightPanel/UpDownPanel/Btn_LvDownLight/-(hei)2',2},{'Btn_LvUp','vfxroot/RightPanel/UpDownPanel/Btn_LvUp',2},{'+(hui)2','vfxroot/RightPanel/UpDownPanel/Btn_LvUp/+(hui)2',2},{'Btn_LvUpLight','vfxroot/RightPanel/UpDownPanel/Btn_LvUpLight',2},{'+(hei)2','vfxroot/RightPanel/UpDownPanel/Btn_LvUpLight/+(hei)2',2},{'VoidGearUpgradeNeedPanel','vfxroot/RightPanel/VoidGearUpgradeNeedPanel',2},{'VoidGearMixNeedPanel','vfxroot/RightPanel/VoidGearMixNeedPanel',2},{'CailiaoNeed','vfxroot/RightPanel/CailiaoNeed',2},{'NeedItemIcon','vfxroot/RightPanel/CailiaoNeed/NeedItemIcon',2},{'CailiaoNeed2','vfxroot/RightPanel/CailiaoNeed2',2},{'RewardRankImg','vfxroot/RightPanel/CailiaoNeed2/RewardRankImg',2},{'RewardIconImg','vfxroot/RightPanel/CailiaoNeed2/RewardIconImg',2},{'StarPanel','vfxroot/RightPanel/CailiaoNeed2/StarPanel',2},{'ItemStarPrefab','vfxroot/RightPanel/CailiaoNeed2/StarPanel/ItemStarPrefab',2},{'HighLight','vfxroot/RightPanel/CailiaoNeed2/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','vfxroot/RightPanel/CailiaoNeed2/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg','vfxroot/RightPanel/CailiaoNeed2/Img_ItemCountBg',2},{'Img_countdi','vfxroot/RightPanel/CailiaoNeed2/Img_countdi',2},{'Btn_Quxiao','vfxroot/RightPanel/Btn_Quxiao',2},{'Btn_Upgrade','vfxroot/RightPanel/Btn_Upgrade',2},{'Max','vfxroot/RightPanel/Max',2},{'SuccessPanel','vfxroot/SuccessPanel',2},{'Btn_SuccessBack','vfxroot/SuccessPanel/Btn_SuccessBack',2},{'BG','vfxroot/SuccessPanel/BG',2},{'Zhuangshixian(shang)','vfxroot/SuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','vfxroot/SuccessPanel/BG/zhuangshixian(yangcheng)',2},{'chenggongdi','vfxroot/SuccessPanel/chenggongdi',2},{'>','vfxroot/SuccessPanel/chenggongdi/LvInfo/>',2},{'Viewport03','vfxroot/SuccessPanel/chenggongdi/scroll/Viewport',2},{'VoidGearInfoDataRoot','vfxroot/SuccessPanel/chenggongdi/scroll/Viewport/VoidGearInfoDataRoot',2},{'VoidGearInfoDataPrefab','vfxroot/SuccessPanel/chenggongdi/scroll/VoidGearInfoDataPrefab',2},{'Img_Shuxingicondi2','vfxroot/SuccessPanel/chenggongdi/scroll/VoidGearInfoDataPrefab/Img_Shuxingicondi2',2},{'icon1','vfxroot/SuccessPanel/chenggongdi/scroll/VoidGearInfoDataPrefab/Img_Shuxingicondi2/icon1',2},{'>01','vfxroot/SuccessPanel/chenggongdi/scroll/VoidGearInfoDataPrefab/>',2},{'Img_Dian','vfxroot/SuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','vfxroot/SuccessPanel/FightResult/Img_Heidi',2},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UpperBtnPanel/Text_TitleCn',20},{'Text_TitleEn','UpperBtnPanel/Text_TitleEn',20},{'Text_ZSCount','Huobi/Btn_Huobi/Text_ZSCount',20},{'VoidGearNameText','vfxroot/LeftPanel/VoidGearNameText',20},{'VoidGearDesText','vfxroot/LeftPanel/ScrollView/Viewport/VoidGearDesText',20},{'MaxLevelTip_Mix','vfxroot/RightPanel/VoidGearMixPreview/MaxLevelTip_Mix',20},{'Text_LV_Mix','vfxroot/RightPanel/VoidGearMixPreview/Text_LV_Mix',20},{'Text_CurLv_Mix','vfxroot/RightPanel/VoidGearMixPreview/Text_CurLv_Mix',20},{'Text_NextLv_Mix','vfxroot/RightPanel/VoidGearMixPreview/Text_NextLv_Mix',20},{'NameTxt','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearInfoPrefab/NameTxt',20},{'OriginText','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearInfoPrefab/OriginText',20},{'PreviewText','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearInfoPrefab/PreviewText',20},{'Text_Huodejineng','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/Text_Huodejineng',20},{'GearSkillNameText','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/GearSkillNameText',20},{'Text_Jiesuotiaojian','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_Suo/Text_Jiesuotiaojian',20},{'Text_SubSkillName','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/SubSkillPoint/Text_SubSkillName',20},{'Text_Tag','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag1/Text_Tag',20},{'Text_Tag01','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag2/Text_Tag',20},{'Text_Matter','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/Img_Exception/Text_Matter',20},{'Text_Jinengshuoming','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SkillTips/Text_Jinengshuoming',20},{'TipNameTxt','vfxroot/RightPanel/VoidGearMixPreview/ScrollView_Mix/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/TipsPanel/Btn_SkillDetailTip/TipNameTxt',20},{'Text_AddExp','vfxroot/RightPanel/VoidGearUpgradePreview/Jingyantiao/Text_AddExp',20},{'Text_RoleExp','vfxroot/RightPanel/VoidGearUpgradePreview/Jingyantiao/Text_RoleExp',20},{'Text_Exp','vfxroot/RightPanel/VoidGearUpgradePreview/Jingyantiao/Text_Exp',20},{'Text_LV','vfxroot/RightPanel/VoidGearUpgradePreview/Text_LV',20},{'Text_CurLv','vfxroot/RightPanel/VoidGearUpgradePreview/Text_CurLv',20},{'Text_NextLv','vfxroot/RightPanel/VoidGearUpgradePreview/Text_NextLv',20},{'NameTxt01','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearInfoPrefab/NameTxt',20},{'OriginText01','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearInfoPrefab/OriginText',20},{'PreviewText01','vfxroot/RightPanel/VoidGearUpgradePreview/VoidGearInfoPrefab/PreviewText',20},{'MaxLevelTip','vfxroot/RightPanel/VoidGearBreakPreview/MaxLevelTip',20},{'Text_LV_Break','vfxroot/RightPanel/VoidGearBreakPreview/Text_LV_Break',20},{'Text_CurLv_Break','vfxroot/RightPanel/VoidGearBreakPreview/Text_CurLv_Break',20},{'Text_NextLv_Break','vfxroot/RightPanel/VoidGearBreakPreview/Text_NextLv_Break',20},{'NameTxt02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearInfoPrefab/NameTxt',20},{'OriginText02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearInfoPrefab/OriginText',20},{'PreviewText02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearInfoPrefab/PreviewText',20},{'Text_Huodejineng01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/Text_Huodejineng',20},{'GearSkillNameText01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/GearSkillNameText',20},{'Text_Jiesuotiaojian01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSkillName/Img_SkillSuo/Text_Jiesuotiaojian',20},{'Text_SubSkillName01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/SubSkillPoint/Text_SubSkillName',20},{'Text_Tag02','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag1/Text_Tag',20},{'Text_Tag03','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/TagPanel/Img_Tag2/Text_Tag',20},{'Text_Matter01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SubNamePanel/Img_Exception/Text_Matter',20},{'Text_Jinengshuoming01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/SkillTips/Text_Jinengshuoming',20},{'TipNameTxt01','vfxroot/RightPanel/VoidGearBreakPreview/ScrollView_Break/Viewport/VoidGearSkillPrefab/GearSkillPrefab/GearSubSkill/TipsPanel/Btn_SkillDetailTip/TipNameTxt',20},{'Text_UseCount','vfxroot/RightPanel/UpDownPanel/Text_UseCount',20},{'BtnMaxLV_Txt','vfxroot/RightPanel/UpDownPanel/Lvmaxdi/BtnMaxLV_Txt',20},{'BtnMinLV_Txt','vfxroot/RightPanel/UpDownPanel/lvmindi/BtnMinLV_Txt',20},{'Text_NeedGMCount','vfxroot/RightPanel/CailiaoNeed/Text_NeedGMCount',20},{'ItemCountText','vfxroot/RightPanel/CailiaoNeed2/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','vfxroot/RightPanel/CailiaoNeed2/Img_countdi/ItemCountText',20},{'ItemCountText2','vfxroot/RightPanel/CailiaoNeed2/Img_countdi/ItemCountText2',20},{'Text_Quxiao','vfxroot/RightPanel/Btn_Quxiao/Text_Quxiao',20},{'Btn_Txt','vfxroot/RightPanel/Btn_Upgrade/Btn_Txt',20},{'MaxText','vfxroot/RightPanel/Max/MaxText',20},{'LvText','vfxroot/SuccessPanel/chenggongdi/LvInfo/LvText',20},{'OriginLVText','vfxroot/SuccessPanel/chenggongdi/LvInfo/OriginLVText',20},{'TargetLVText','vfxroot/SuccessPanel/chenggongdi/LvInfo/TargetLVText',20},{'HpNameText','vfxroot/SuccessPanel/chenggongdi/scroll/VoidGearInfoDataPrefab/HpNameText',20},{'SuccessCurHpText','vfxroot/SuccessPanel/chenggongdi/scroll/VoidGearInfoDataPrefab/SuccessCurHpText',20},{'TargetHpText','vfxroot/SuccessPanel/chenggongdi/scroll/VoidGearInfoDataPrefab/TargetHpText',20},{'Text_FightResult','vfxroot/SuccessPanel/FightResult/Text_FightResult',20},{'TouchExit','vfxroot/SuccessPanel/Touch Exit',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillexceptionLocalData")
require("LocalData/SkilltypeoneLocalData")
require("LocalData/SkilltypetwoLocalData")
function M:OnInit()
    ---技能锁多语言
    self.SkillLockTips = {
        --1阶段突破后解锁
        "newroledetail2_ui_tips7",
        --2阶段突破后解锁
        "newroledetail2_ui_tips8"
    }
    self.mSetMinLv = 1
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.Jingyantiao().gameObject:SetActive(false)
    self.Huobi().gameObject:SetActive(false)
    self.MaxLevelTip().gameObject:SetActive(false)
    self.MaxLevelTip_Mix().gameObject:SetActive(false)
    self:InitPrefab()
    self:InitButton()
end
function M:OnUpdateUI()
    self.insufficient_Mix = false
    self.Hero = RoleCardViewModel.CurrentHero
    self:InitParams()
    self:InitLeftContent()
    
    self:InitRightUI_New()
    --if self.insufficient_Mix then
    --    if self.SpecialGear:CheckLockState() then
    --        --self:InitRightUI()
    --        self:LevelUpRefresh()
    --    else
    --        self:InitRightUI_Mix()
    --    end
    --end
    --Event.Add("EquipCreatSuccess",Handle(self, self.LevelUpRefresh))
    Event.Add("EquipCreatSuccess",Handle(self, self.EquipCreatSuccess))
    Event.Add("EquipCreatSuccess",Handle(self, self.LevelUpRefresh_New))
end
function M:InitPrefab()
    self.VoidGearInfoPrefab_Mix = self.VoidGearMixPreview().transform:Find("ScrollView_Mix/Viewport/VoidGearInfoPrefab").gameObject
    self.VoidGearSkillPrefab_Mix = self.VoidGearMixPreview().transform:Find("ScrollView_Mix/Viewport/VoidGearSkillPrefab").gameObject
    self.VoidGearInfoPrefab_LevelUp = self.VoidGearUpgradePreview().transform:Find("VoidGearInfoPrefab").gameObject
    self.VoidGearInfoPrefab_Break = self.VoidGearBreakPreview().transform:Find("ScrollView_Break/Viewport/VoidGearInfoPrefab").gameObject
    self.VoidGearSkillPrefab_Break = self.VoidGearBreakPreview().transform:Find("ScrollView_Break/Viewport/VoidGearSkillPrefab").gameObject
    self.materialPrefab = self.CailiaoNeed().gameObject
    self.materialPrefab_Mix  = self.CailiaoNeed2().gameObject
    self.VoidGearInfoPrefab_Mix:SetActive(false)
    self.VoidGearSkillPrefab_Mix:SetActive(false)
    self.VoidGearInfoPrefab_LevelUp:SetActive(false)
    self.VoidGearInfoPrefab_Break:SetActive(false)
    self.VoidGearSkillPrefab_Break:SetActive(false)
    self.materialPrefab:SetActive(false)
    self.materialPrefab_Mix:SetActive(false)
end
---初始化按钮
function M:InitButton()
    ---返回页面
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.BackClick))
    ---返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,function()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(113)
    end))
    ---最大
    UIEvent.LuaClick(self.Btn_MaxLv().gameObject,Handle(self,function()
        self.levelUp = self:NumberOfUpgrades()
        self.Text_UseCount().text = self:NumberOfUpgrades()
        --self:InitRightUI()
        self:RefreshRightUI_New()
    end))
    ---最小
    UIEvent.LuaClick(self.Btn_MinLv().gameObject,Handle(self,function()
        self.levelUp = self.mSetMinLv
        self.Text_UseCount().text = tostring(self.mSetMinLv)
        --self:InitRightUI()
        self:RefreshRightUI_New()
    end))
    --- +号
    UIEvent.AlwaysLongClick(self.Btn_LvUpLight().gameObject,Handle(self,function()
        if self.levelUp < self:NumberOfUpgrades() then
            self.levelUp = self.levelUp + 1
            self.Text_UseCount().text = self.levelUp
            --self:InitRightUI()
            self:RefreshRightUI_New()
        end
    end))
    --- -号
    UIEvent.AlwaysLongClick(self.Btn_LvDownLight().gameObject,Handle(self,function()
        if self.levelUp > self.mSetMinLv then
            self.levelUp = self.levelUp - 1
            self.Text_UseCount().text = self.levelUp
            --self:InitRightUI()
            self:RefreshRightUI_New()
        end
    end))
    ---取消
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject,Handle(self,function()
        MgrUI.GoBack()
    end))
    ---确认
    UIEvent.LuaClick(self.Btn_Upgrade().gameObject,Handle(self,function()
        if not self.SpecialGear:CheckLockState() then
            ---生成
            if self.insufficient_Mix then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"),1},true)
            else
                ---向服务器发送升阶请求
                EquipControl.SpecialEquipCreat(self.Hero.id)
            end
        elseif self.SpecialGear.evolutionLevel == self.SpecialGear:GetMaxLevel() then
            if self.insufficient_Mix then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"),1},true)
            end
            ---突破
            EquipControl.SpecialEquipPhaseUp(self.SpecialGear,function()
                self:OpenSuccessPanel_Break()
                --self:LevelUpRefresh()
                self:LevelUpRefresh_New()
            end)
        else
            ---升级
            if self.levelUp > 0 then
                self.tempOriginalLevel = self.SpecialGear.evolutionLevel
                self.tempTargetLevel = self.SpecialGear.evolutionLevel + self.levelUp
                EquipControl.SpecialEquipLevelUp(self.SpecialGear,self.levelUp,function()
                    self:OpenSuccessPanel_LevelUp()
                    --self:LevelUpRefresh()
                    self:LevelUpRefresh_New()
                end)
            end
        end
    end))
    ---关闭升级成功界面
    UIEvent.LuaClick(self.Btn_SuccessBack().gameObject,Handle(self,function()
        self.SuccessPanel().gameObject:SetActive(false)
        Tools.ReSize(self.VoidGearContent_Break().gameObject)
    end))
end
---初始化参数(阶段变换后要重新初始化)
function M:InitParams()
    self.levelUp = self.mSetMinLv                                                --升级次数
    self.SpecialGear = EquipControl.GetSingleSpecialEquip(self.Hero.id)
    if self.SpecialGear:CheckLockState() then
        self.levelUpCost = self.SpecialGear:GetLevelUpMaterial()        --每次升级装备要消耗的材料
        self.advanceCost = self.SpecialGear:GetAdvanceMaterial()        --每次进阶装备要消耗的材料
        self.currentEquipAttr = self.SpecialGear:GetCurrentAttr()       --装备当前的全部属性
        self.levelUpRoleAttrs = self.SpecialGear:GetLevelUpRoleAttr()   --当前阶段每次升级装备角色的属性变化
    end
    self.MixCost = self.SpecialGear:GetMixMaterial()
    --self.advanceSkillStr = self.SpecialGear:GetAdvanceSkill()       --进阶将获得的技能字符串
    self.advanceSkillStr = self.SpecialGear:GetAllAdvanceSkill()       --进阶将获得的所有技能字符串
    ---@type JNSkill[]
    self.newSkills = {}                                             --进阶新获得的技能
    self.oldSkills = {}
    if next(self.advanceSkillStr) ~= nil then
        local tempRole = self.Hero:GetHeroAttr()
        ---替换技能补丁
        local specialEquip = EquipControl.GetSingleSpecialEquip(self.Hero.id)
        if specialEquip then
            local skillIndex = specialEquip:GetAdvanceSkillNum()
            local advanceSkillStr = specialEquip:GetSpecialSkill()
            for _,str in pairs(advanceSkillStr) do
                ReadData.ReplaceSkill(str,tempRole,skillIndex)
            end
        end
        ---------------
        local skillIndex = self.SpecialGear:GetAdvanceSkillNum()
        for _,skillList in pairs(self.advanceSkillStr) do
            for i, str in ipairs(skillList) do
                local realStr=BattleRole.RealSkillStr(str, tempRole.ShowSkillLV,tempRole,skillIndex)
                tempRole["Skill_"..skillIndex.."_IsSLv"] = false
                tempRole["Skill_"..skillIndex.."Fml"]=JNStrTool.StrArrArr("@",realStr,{"{" , "}" , "," })
                tempRole["Skill_"..skillIndex]=BattleRole.SubSkillLvReal2(tempRole["Skill_"..skillIndex.."Fml"],tempRole.ShowSkillLV)
                table.insert(self.oldSkills, tempRole["Skill_"..skillIndex.."_example"])
                BattleRole.CreatAllSkill(tempRole)
                table.insert(self.newSkills, tempRole["Skill_"..skillIndex.."_example"])
            end
        end
    end
end
---左侧内容
function M:InitLeftContent()
    MgrRes.LoadSprite(self.VoidGearIcon(),"Item/"..self.SpecialGear.specialIcon)
    self.VoidGearNameText().text = self.SpecialGear.specialName
    self.VoidGearDesText().text = self.SpecialGear.specialTxt
end
---UI显示刷新,(等级/属性/材料图片)
function M:InitRightUI()
    Tools.ClearAllChild(self.VoidGearContent_LevelUp().gameObject)
    Tools.ClearAllChild(self.VoidGearContent_Break().gameObject)
    self:InitLevelUpLevel()
    self:InitLevelUpAttr()
    self:InitBreakLevel()
    self:InitBreakAttr()
    self:InitBreakSkill()
    self:MaterialsCountRefresh()
    if self.SpecialGear:MaxLevel() == self.SpecialGear.evolutionLevel then  --到装备最大等级
        self.VoidGearMixPreview().gameObject:SetActive(false)
        self.MaxLevelTip().gameObject:SetActive(true)
        self.Text_LV_Break().gameObject:SetActive(true)
        self.Text_CurLv_Break().gameObject:SetActive(true)
        self.Text_NextLv_Break().gameObject:SetActive(false)
        self.jiantou_Break().gameObject:SetActive(false)
        self.VoidGearBreakPreview().gameObject:SetActive(true)
        self.VoidGearUpgradePreview().gameObject:SetActive(false)
        self.VoidGearUpgradeNeedPanel().gameObject:SetActive(false)
        self.VoidGearMixNeedPanel().gameObject:SetActive(false)
        self.Btn_Quxiao().gameObject:SetActive(false)
        self.Btn_Upgrade().gameObject:SetActive(false)
        self.Max().gameObject:SetActive(true)
    elseif self.SpecialGear.evolutionLevel == self.SpecialGear:GetMaxLevel() then   --到阶段最大等级(打开突破界面)
        self.VoidGearMixPreview().gameObject:SetActive(false)
        self.VoidGearBreakPreview().gameObject:SetActive(true)
        self.VoidGearUpgradePreview().gameObject:SetActive(false)
        self.VoidGearUpgradeNeedPanel().gameObject:SetActive(false)
        self.VoidGearMixNeedPanel().gameObject:SetActive(true)
        --self:MaterialsOfAdvance()   ---显示突破材料
        self:MaterialsCountRefresh_Mix(self.advanceCost)    ---显示突破材料
        self.Btn_Quxiao().gameObject:SetActive(true)
        self.Btn_Upgrade().gameObject:SetActive(true)
        self.Max().gameObject:SetActive(false)
    else                                                                        --未到阶段最大等级(打开升级界面)
        self.VoidGearMixPreview().gameObject:SetActive(false)
        self.VoidGearBreakPreview().gameObject:SetActive(false)
        self.VoidGearUpgradePreview().gameObject:SetActive(true)
        self.VoidGearUpgradeNeedPanel().gameObject:SetActive(true)
        self.VoidGearMixNeedPanel().gameObject:SetActive(false)
        self.Btn_Quxiao().gameObject:SetActive(true)
        self.Btn_Upgrade().gameObject:SetActive(true)
        self.Max().gameObject:SetActive(false)
    end
end
function M:InitLevelUpLevel()
    self.Text_CurLv().text = self.SpecialGear.evolutionLevel
    self.Text_NextLv().text = self.SpecialGear.evolutionLevel + self.levelUp
end
function M:InitLevelUpAttr()
    local originalAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase,self.SpecialGear.evolutionLevel)
    local targetAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase,self.SpecialGear.evolutionLevel + self.levelUp)
    for i,v in pairs(targetAttr) do
        local prefab = GameObject.Instantiate(self.VoidGearInfoPrefab_LevelUp,self.VoidGearContent_LevelUp().transform,false)
        local icon = prefab.transform:Find("Icon"):GetComponent("Image")
        local NameTxt = prefab.transform:Find("NameTxt"):GetComponent("TextMeshProUGUI")
        local OriginText = prefab.transform:Find("OriginText"):GetComponent("TextMeshProUGUI")
        local PreviewText = prefab.transform:Find("PreviewText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(icon,v.attrIcon)
        NameTxt.text = v.attrName
        local attr
        local percentMark1
        local levelUpAttr
        local percentMark2
        for idx,value in pairs(originalAttr) do
            if value.attrID == v.attrID then
                attr = value.attribute
                percentMark1 = (value.type == 1 and "%" or "")
                break
            end
        end
        for idx,value in pairs(targetAttr) do
            if value.attrID == v.attrID then
                levelUpAttr = value.attribute
                percentMark2 = (value.type == 1 and "%" or "")
                break
            end
        end
        OriginText.text = attr .. percentMark1
        PreviewText.text = levelUpAttr .. percentMark2
        prefab:SetActive(true)
    end
end
function M:InitBreakLevel()
    self.Text_CurLv_Break().text = self.SpecialGear.evolutionLevel .. "/" .. self.SpecialGear.evolutionLevel
    self.Text_NextLv_Break().text = self.SpecialGear.evolutionLevel .. "/" .. self.SpecialGear:GetNextPhaseMaxLevel()
end
function M:InitBreakAttr()
    local originalAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase,self.SpecialGear.evolutionLevel)
    local breakAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase + 1,self.SpecialGear.evolutionLevel)
    for i,v in pairs(breakAttr) do
        local prefab = GameObject.Instantiate(self.VoidGearInfoPrefab_Break,self.VoidGearContent_Break().transform,false)
        local icon = prefab.transform:Find("Icon"):GetComponent("Image")
        local NameTxt = prefab.transform:Find("NameTxt"):GetComponent("TextMeshProUGUI")
        local OriginText = prefab.transform:Find("OriginText"):GetComponent("TextMeshProUGUI")
        local PreviewText = prefab.transform:Find("PreviewText"):GetComponent("TextMeshProUGUI")
        ---最大阶段隐藏
        if self.SpecialGear.evolutionPhase >= self.SpecialGear.specialMaxStage then
            PreviewText.gameObject:SetActive(false)
            prefab.transform:Find("jiantou").gameObject:SetActive(false)
        end
        MgrRes.LoadSprite(icon,v.attrIcon)
        NameTxt.text = v.attrName
        prefab:SetActive(true)
        local attr
        local percentMark1
        local breakUpAttr
        local percentMark2
        for idx,value in pairs(originalAttr) do
            if value.attrID == v.attrID then
                attr = value.attribute
                percentMark1 = (value.type == 1 and "%" or "")
                break
            end
        end
        if attr then
            OriginText.text = attr .. percentMark1
        else
            OriginText.gameObject:SetActive(false)
        end

        for idx,value in pairs(breakAttr) do
            if value.attrID == v.attrID then
                breakUpAttr = value.attribute
                percentMark2 = (value.type == 1 and "%" or "")
                break
            end
        end
        PreviewText.text = breakUpAttr .. percentMark2
    end
end
function M:InitBreakSkill()
    for i,v in ipairs(self.newSkills) do
        local item = GameObject.Instantiate(self.VoidGearSkillPrefab_Break,self.VoidGearContent_Break().transform,false)
        local Text_VoidGearSkillName = item.transform:Find("GearSkillPrefab/GearSkillName/GearSkillNameText"):GetComponent("TextMeshProUGUI")
        local tSkillSimple = SkillDetailControl.GetSkillData(self.Hero.id, v[1].Id)
        local tMarkLv = tSkillSimple.UnlockLv[1]
        Text_VoidGearSkillName.text = tSkillSimple.GroupName[tMarkLv]
        item:SetActive(true)
        local GearSubSkill = item.transform:Find("GearSkillPrefab/GearSubSkill").gameObject
        ---最大阶段隐藏
        if self.SpecialGear.evolutionPhase >= self.SpecialGear.specialMaxStage then
            item.transform:Find("GearSkillPrefab/GearSkillName/Img_SkillSuo").gameObject:SetActive(false)
        end
        GearSubSkill:SetActive(false)
        --创建子技能
        for idx,value in pairs(v) do
            if self.oldSkills[i][idx] == nil or self.oldSkills[i][idx].Id ~= value.Id or self.SpecialGear.evolutionPhase >= self.SpecialGear.specialMaxStage then
                local subSkill = GameObject.Instantiate(GearSubSkill,item.transform:Find("GearSkillPrefab"))
                subSkill:SetActive(true)
                ---子技能名字
                local Text_SubSkillName = subSkill.transform:Find("SubNamePanel/SubSkillPoint/Text_SubSkillName"):GetComponent("TextMeshProUGUI")
                Text_SubSkillName.text = value.Name
                ---tag
                local tag1 = subSkill.transform:Find("SubNamePanel/TagPanel/Img_Tag1")
                local tag2 = subSkill.transform:Find("SubNamePanel/TagPanel/Img_Tag2")
                if value.Skilltype1 ~= 0 then
                    tag1.gameObject:SetActive(true)
                    tag1:Find("Text_Tag"):GetComponent("TextMeshProUGUI").text = SkilltypeoneLocalData.tab[value.Skilltype1][2]
                else
                    tag1.gameObject:SetActive(false)
                end
                if value.Skilltype2 ~= 0 then
                    tag2.gameObject:SetActive(true)
                    tag2:Find("Text_Tag"):GetComponent("TextMeshProUGUI").text = SkilltypetwoLocalData.tab[value.Skilltype2][2]
                else
                    tag2.gameObject:SetActive(false)
                end
                Tools.ReSize(subSkill.transform:Find("SubNamePanel/TagPanel").gameObject)
                ---技能说明
                local explain = subSkill.transform:Find("SkillTips/Text_Jinengshuoming"):GetComponent("TextMeshProUGUI")
                explain.text = value.Explain
                ---例外事项
                local skillException = subSkill.transform:Find("SubNamePanel/Img_Exception/Text_Matter"):GetComponent("TextMeshProUGUI")
                local excGo = subSkill.transform:Find("SubNamePanel/Img_Exception").gameObject
                excGo.gameObject:SetActive(false)
                local Btn_SkillDetailTip = subSkill.transform:Find("TipsPanel/Btn_SkillDetailTip").gameObject
                local exception = string.split(value.Exception,"@")
                if exception[1] == "0" or #exception == 0 then
                    Btn_SkillDetailTip:SetActive(false)
                else
                    Btn_SkillDetailTip:SetActive(true)
                    local text = ""
                    for i = 1, #exception do
                        text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
                    end
                    skillException.text = text
                end
                ---例外事项按钮
                UIEvent.LuaPressClick(Btn_SkillDetailTip,function()
                    excGo.gameObject:SetActive(true)
                end)
                UIEvent.OnPointUpOrExit(Btn_SkillDetailTip,function()
                    excGo.gameObject:SetActive(false)
                end)
                Tools.ReSize(subSkill)
            end
        end
        Tools.ReContentSizeGroup(self.VoidGearContent_Break().gameObject)
    end
    Tools.ReSize(self.VoidGearContent_Break().gameObject)
end
function M:LevelUpRefresh()
    self.Text_UseCount().text = tostring(self.mSetMinLv)
    self:InitParams()   --重新获取参数
    self:InitRightUI()
end
function M:OpenSuccessPanel_LevelUp()
    self.SuccessPanel().gameObject:SetActive(true)
    self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text109")
    self.LvText().gameObject:SetActive(true)
    self.OriginLVText().fontSize = 90
    self.TargetLVText().fontSize = 90
    self.OriginLVText().text = self.tempOriginalLevel
    self.TargetLVText().text = self.tempTargetLevel
    local root = self.VoidGearInfoDataRoot().transform
    Tools.ClearAllChild(root.gameObject)
    local infoPrefab = self.VoidGearInfoDataPrefab().gameObject
    infoPrefab:SetActive(false)
    local originalEquipAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase,self.tempOriginalLevel)    --升级前的属性
    local targetEquipAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase,self.tempTargetLevel)    --升级后的属性
    for i,v in pairs(targetEquipAttr) do
        local prefab = GameObject.Instantiate(infoPrefab,root,false)
        local icon = prefab.transform:Find("Img_Shuxingicondi2/icon1"):GetComponent("Image")
        local NameTxt = prefab.transform:Find("HpNameText"):GetComponent("TextMeshProUGUI")
        local OriginText = prefab.transform:Find("SuccessCurHpText"):GetComponent("TextMeshProUGUI")
        local PreviewText = prefab.transform:Find("TargetHpText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(icon,v.attrIcon)
        NameTxt.text = v.attrName
        prefab:SetActive(true)
        local attr
        local percentMark1
        local levelUpAttr
        local percentMark2
        for idx,value in pairs(originalEquipAttr) do
            if value.attrID == v.attrID then
                attr = value.attribute
                percentMark1 = (value.type == 1 and "%" or "")
                break
            end
        end
        for idx,value in pairs(targetEquipAttr) do
            if value.attrID == v.attrID then
                levelUpAttr = value.attribute
                percentMark2 = (value.type == 1 and "%" or "")
                break
            end
        end
        OriginText.text = attr .. percentMark1
        PreviewText.text = levelUpAttr .. percentMark2
    end
    Tools.ReSize(root.gameObject)
end
function M:OpenSuccessPanel_Break()
    self.SuccessPanel().gameObject:SetActive(true)
    self.LvText().gameObject:SetActive(false)
    self.OriginLVText().fontSize = 60
    self.TargetLVText().fontSize = 60
    self.OriginLVText().text = self.SpecialGear.evolutionLevel .."/".. self.SpecialGear.evolutionLevel
    self.TargetLVText().text = self.SpecialGear.evolutionLevel .."/".. self.SpecialGear:GetMaxLevel()
    self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text99")
    local root = self.VoidGearInfoDataRoot().transform
    Tools.ClearAllChild(root.gameObject)
    local infoPrefab = self.VoidGearInfoDataPrefab().gameObject
    infoPrefab:SetActive(false)
    local originalEquipAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase-1,self.SpecialGear.evolutionLevel)    --突破前的属性
    local targetEquipAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(self.SpecialGear.evolutionPhase,self.SpecialGear.evolutionLevel)    --突破后的属性
    for i,v in pairs(targetEquipAttr) do
        local prefab = GameObject.Instantiate(infoPrefab,root,false)
        local icon = prefab.transform:Find("Img_Shuxingicondi2/icon1"):GetComponent("Image")
        local NameTxt = prefab.transform:Find("HpNameText"):GetComponent("TextMeshProUGUI")
        local OriginText = prefab.transform:Find("SuccessCurHpText"):GetComponent("TextMeshProUGUI")
        local PreviewText = prefab.transform:Find("TargetHpText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(icon,v.attrIcon)
        NameTxt.text = v.attrName
        prefab:SetActive(true)
        local attr
        local percentMark1
        local breakAttr
        local percentMark2
        for idx,value in pairs(originalEquipAttr) do
            if value.attrID == v.attrID then
                attr = value.attribute
                percentMark1 = (value.type == 1 and "%" or "")
                break
            end
        end
        for idx,value in pairs(targetEquipAttr) do
            if value.attrID == v.attrID then
                breakAttr = value.attribute
                percentMark2 = (value.type == 1 and "%" or "")
                break
            end
        end
        OriginText.text = attr .. percentMark1
        PreviewText.text = breakAttr .. percentMark2
    end
    Tools.ReSize(root.gameObject)
end
function M:NumberOfUpgrades()
    local levelUpCount = self.SpecialGear:GetMaxLevel() - self.SpecialGear.evolutionLevel   --装备可升级次数
    --for i,v in pairs(self.levelUpCost) do
    --    local bagItem = ItemControl.GetItemByIdAndType(v.id,v.goodsType)
    --    if levelUpCount > math.floor(bagItem.count / v.count) then
    --        levelUpCount = math.floor(bagItem.count / v.count)
    --    end
    --end
    return levelUpCount
end
function M:MaterialsOfAdvance()
    Tools.ClearAllChild(self.VoidGearUpgradeNeedPanel().gameObject)
    for i,v in pairs(self.advanceCost) do
        local item = GameObject.Instantiate(self.materialPrefab,self.VoidGearUpgradeNeedPanel().transform)
        local image = item.transform:Find("NeedItemIcon"):GetComponent("Image")
        local count = item.transform:Find("Text_NeedGMCount"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(image,v.icon)
        count.text = v.count
        item:SetActive(true)
    end
end
function M:MaterialsCountRefresh()
    Tools.ClearAllChild(self.VoidGearUpgradeNeedPanel().gameObject)
    for i,v in pairs(self.levelUpCost) do
        local item = GameObject.Instantiate(self.materialPrefab,self.VoidGearUpgradeNeedPanel().transform)
        item:SetActive(true)
        local image = item.transform:Find("NeedItemIcon"):GetComponent("Image")
        local count = item.transform:Find("Text_NeedGMCount"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(image,v.icon)
        count.text = Global.GetSingleComparedText(ItemControl.GetItemByIdAndType(v.id, v.goodsType).count,v.count * self.levelUp,nil,true)
        Tools.ReSize(item)
    end
    Tools.ReContentSizeGroup(self.VoidGearUpgradeNeedPanel().gameObject)
end

function M:InitRightUI_Mix()
    self.Max().gameObject:SetActive(false)
    Tools.ClearAllChild(self.VoidGearContent_Mix().gameObject)
    self:InitLevel_Mix()
    self:InitAttr_Mix()
    self:InitSkill_Mix()
    self:MaterialsCountRefresh_Mix(self.MixCost)
    self.VoidGearMixNeedPanel().gameObject:SetActive(true)
    self.VoidGearBreakPreview().gameObject:SetActive(false)
    --self.VoidGearUpgradePreview().gameObject:SetActive(false)
    self.UpDownPanel().gameObject:SetActive(false)
    self.VoidGearUpgradeNeedPanel().gameObject:SetActive(false)
end
function M:InitLevel_Mix()
    self.Text_CurLv_Mix().text = self.SpecialGear.evolutionLevel
    self.Text_NextLv_Mix().text = 1 .. "/" .. self.SpecialGear:GetNextPhaseMaxLevel()
end
function M:InitAttr_Mix()
    local targetAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(1,1)
    for i,v in pairs(targetAttr) do
        local prefab = GameObject.Instantiate(self.VoidGearInfoPrefab_Mix,self.VoidGearContent_Mix().transform,false)
        local icon = prefab.transform:Find("Icon"):GetComponent("Image")
        local NameTxt = prefab.transform:Find("NameTxt"):GetComponent("TextMeshProUGUI")
        local OriginText = prefab.transform:Find("OriginText"):GetComponent("TextMeshProUGUI")
        local PreviewText = prefab.transform:Find("PreviewText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(icon,v.attrIcon)
        NameTxt.text = v.attrName
        local MixAttr
        local percentMark
        for idx,value in pairs(targetAttr) do
            if value.attrID == v.attrID then
                MixAttr = value.attribute
                percentMark = (value.type == 1 and "%" or "")
                break
            end
        end
        OriginText.text = 0 .. percentMark
        PreviewText.text = MixAttr .. percentMark
        prefab:SetActive(true)
    end
end
function M:InitSkill_Mix()
    for i,v in ipairs(self.newSkills) do
        local item = GameObject.Instantiate(self.VoidGearSkillPrefab_Mix,self.VoidGearContent_Mix().transform,false)
        local Text_VoidGearSkillName = item.transform:Find("GearSkillPrefab/GearSkillName/GearSkillNameText"):GetComponent("TextMeshProUGUI")
        local tSkillSimple = SkillDetailControl.GetSkillData(self.Hero.id, v[1].Id)
        local tMarkLv = tSkillSimple.UnlockLv[1]
        Text_VoidGearSkillName.text = tSkillSimple.GroupName[tMarkLv]
        item:SetActive(true)
        local GearSubSkill = item.transform:Find("GearSkillPrefab/GearSubSkill").gameObject
        GearSubSkill:SetActive(false)
        --创建子技能
        for idx,value in pairs(v) do
            if self.oldSkills[i][idx] == nil or self.oldSkills[i][idx].Id ~= value.Id then
                local subSkill = GameObject.Instantiate(GearSubSkill,item.transform:Find("GearSkillPrefab"))
                subSkill:SetActive(true)
                ---子技能名字
                local Text_SubSkillName = subSkill.transform:Find("SubNamePanel/SubSkillPoint/Text_SubSkillName"):GetComponent("TextMeshProUGUI")
                Text_SubSkillName.text = value.Name
                ---tag
                local tag1 = subSkill.transform:Find("SubNamePanel/TagPanel/Img_Tag1")
                local tag2 = subSkill.transform:Find("SubNamePanel/TagPanel/Img_Tag2")
                if value.Skilltype1 ~= 0 then
                    tag1.gameObject:SetActive(true)
                    tag1:Find("Text_Tag"):GetComponent("TextMeshProUGUI").text = SkilltypeoneLocalData.tab[value.Skilltype1][2]
                else
                    tag1.gameObject:SetActive(false)
                end
                if value.Skilltype2 ~= 0 then
                    tag2.gameObject:SetActive(true)
                    tag2:Find("Text_Tag"):GetComponent("TextMeshProUGUI").text = SkilltypetwoLocalData.tab[value.Skilltype2][2]
                else
                    tag2.gameObject:SetActive(false)
                end
                Tools.ReSize(subSkill.transform:Find("SubNamePanel/TagPanel").gameObject)
                ---技能说明
                local explain = subSkill.transform:Find("SkillTips/Text_Jinengshuoming"):GetComponent("TextMeshProUGUI")
                explain.text = value.Explain
                ---例外事项
                local skillException = subSkill.transform:Find("SubNamePanel/Img_Exception/Text_Matter"):GetComponent("TextMeshProUGUI")
                local excGo = subSkill.transform:Find("SubNamePanel/Img_Exception").gameObject
                excGo.gameObject:SetActive(false)
                local Btn_SkillDetailTip = subSkill.transform:Find("TipsPanel/Btn_SkillDetailTip").gameObject
                local exception = string.split(value.Exception,"@")
                if exception[1] == "0" or #exception == 0 then
                    Btn_SkillDetailTip:SetActive(false)
                else
                    Btn_SkillDetailTip:SetActive(true)
                    local text = ""
                    for i = 1, #exception do
                        text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
                    end
                    skillException.text = text
                end
                ---例外事项按钮
                UIEvent.LuaPressClick(Btn_SkillDetailTip,function()
                    excGo.gameObject:SetActive(true)
                end)
                UIEvent.OnPointUpOrExit(Btn_SkillDetailTip,function()
                    excGo.gameObject:SetActive(false)
                end)
                Tools.ReSize(subSkill)
            end
        end
        Tools.ReContentSizeGroup(self.VoidGearContent_Mix().gameObject)
        Tools.ReSize(self.VoidGearContent_Mix().gameObject)
    end
end
function M:MaterialsCountRefresh_Mix(_cost)
    Tools.ClearAllChild(self.VoidGearMixNeedPanel().gameObject)
    for i,v in ipairs(_cost) do
        local item = GameObject.Instantiate(self.materialPrefab_Mix,self.VoidGearMixNeedPanel().transform,false)
        item.transform:Find("Img_ItemCountBg").gameObject:SetActive(false)
        local rankImage = item.transform:Find("RewardRankImg"):GetComponent("Image")
        local itemImage = item.transform:Find("RewardIconImg"):GetComponent("Image")
        local star = item.transform:Find("StarPanel/ItemStarPrefab").gameObject
        star.gameObject:SetActive(false)
        local starRoot = item.transform:Find("StarPanel/ItemStarRoot").transform
        local countText = item.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        countText.gameObject:SetActive(false)
        local ItemCountText = item.transform:Find("Img_countdi/ItemCountText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(rankImage,self:GetQualityName(v.quality))
        MgrRes.LoadSprite(itemImage,v.icon)
        for i = 1, v.star do
            local s = GameObject.Instantiate(star,starRoot,false)
            s:SetActive(true)
        end
        
        if ItemControl.GetItemByIdAndType(v.id, v.goodsType).count >= v.count then
            ItemCountText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),self:NumberChange(ItemControl.GetItemByIdAndType(v.id, v.goodsType).count),v.count)
        else
            ItemCountText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),self:NumberChange(ItemControl.GetItemByIdAndType(v.id, v.goodsType).count),v.count)
            self.insufficient_Mix = true
        end
        UIEvent.LuaClick(itemImage.gameObject,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{v,true,nil,nil,true},true)
        end)
        item:SetActive(true)
    end
end
----------------------------------------------------------------------------新·超限装备展示----------------------------------------------------------------------------
function M:InitRightUI_New()
    Tools.ClearAllChild(self.VoidGearContent_Mix().gameObject)
    --self:RefreshRightUI_New()
    self:LevelUpRefresh_New()
    self.VoidGearBreakPreview().gameObject:SetActive(false)
    self.VoidGearUpgradePreview().gameObject:SetActive(false)
end

function M:InitLevel_New()
    self.Text_CurLv_Mix().text = self.SpecialGear.evolutionLevel
    if self.SpecialGear:MaxLevel() == self.SpecialGear.evolutionLevel then  --到装备最大等级
        self.Text_CurLv_Mix().text = self.SpecialGear.evolutionLevel .. "/" .. self.SpecialGear:MaxLevel()
    elseif self.SpecialGear.evolutionLevel == self.SpecialGear:GetMaxLevel() then
        self.Text_NextLv_Mix().text = self.SpecialGear.evolutionLevel .. "/" .. self.SpecialGear:GetNextPhaseMaxLevel()
    elseif not self.SpecialGear:CheckLockState() then
        self.Text_NextLv_Mix().text = "1/" .. self.SpecialGear:GetNextPhaseMaxLevel()
    else
        self.Text_NextLv_Mix().text = self.SpecialGear.evolutionLevel + self.levelUp .. "/" .. self.SpecialGear:GetMaxLevel()
    end
end
function M:InitAttr_New()
    local curPhase = not self.SpecialGear:CheckLockState() and 0 or self.SpecialGear.evolutionPhase
    local nextPhase = not self.SpecialGear:CheckLockState() and 1 or self.SpecialGear.evolutionPhase
    local curLevel = not self.SpecialGear:CheckLockState() and 0 or self.SpecialGear.evolutionLevel
    local originalAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(curPhase, curLevel)
    local targetAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(nextPhase,curLevel + self.levelUp)
    
    for i,v in pairs(targetAttr) do
        local prefab = GameObject.Instantiate(self.VoidGearInfoPrefab_Mix,self.VoidGearContent_Mix().transform,false)
        local icon = prefab.transform:Find("Icon"):GetComponent("Image")
        local NameTxt = prefab.transform:Find("NameTxt"):GetComponent("TextMeshProUGUI")
        local OriginText = prefab.transform:Find("OriginText"):GetComponent("TextMeshProUGUI")
        local PreviewText = prefab.transform:Find("PreviewText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(icon,v.attrIcon)
        NameTxt.text = v.attrName
        local CurAttr = 0
        local CurMark = ""
        local NextAttr = 0
        local NextMark = ""
        for idx,value in pairs(originalAttr) do
            if value.attrID == v.attrID then
                CurAttr = value.attribute
                CurMark = (value.type == 1 and "%" or "")
                break
            end
        end
        for idx,value in pairs(targetAttr) do
            if value.attrID == v.attrID then
                NextAttr = value.attribute
                NextMark = (value.type == 1 and "%" or "")
                break
            end
        end
        OriginText.text = CurAttr .. CurMark
        if self.SpecialGear:MaxLevel() > self.SpecialGear.evolutionLevel then  --到装备最大等级
            PreviewText.text = NextAttr .. NextMark
        else
            prefab.transform:Find("jiantou").gameObject:SetActive(false)
            PreviewText.text = ""
        end
        prefab:SetActive(true)
    end
end

function M:InitSkill_New()
    for i,v in ipairs(self.newSkills) do
        local item = GameObject.Instantiate(self.VoidGearSkillPrefab_Mix,self.VoidGearContent_Mix().transform,false)
        local Text_VoidGearSkillName = item.transform:Find("GearSkillPrefab/GearSkillName/GearSkillNameText"):GetComponent("TextMeshProUGUI")
        local tSkillSimple = SkillDetailControl.GetSkillData(self.Hero.id, v[1].Id)
        local tMarkLv = tSkillSimple.UnlockLv[1]
        Text_VoidGearSkillName.text = tSkillSimple.GroupName[tMarkLv]
        item:SetActive(true)
        local GearSubSkill = item.transform:Find("GearSkillPrefab/GearSubSkill").gameObject
        GearSubSkill:SetActive(false)
        --判断技能是否解锁
        local Img_Suo = item.transform:Find("GearSkillPrefab/GearSkillName/Img_Suo")
        if self.SpecialGear.evolutionPhase >= i then
            Img_Suo.gameObject:SetActive(false)
        else
            local UnlockTips = item.transform:Find("GearSkillPrefab/GearSkillName/Img_Suo/Text_Jiesuotiaojian"):GetComponent("TextMeshProUGUI")
            UnlockTips.text = MgrLanguageData.GetLanguageByKey(self.SkillLockTips[i])
        end
        local Text_Huodejineng = item.transform:Find("Text_Huodejineng")
        if i ~= 1 then
            Text_Huodejineng.gameObject:SetActive(false)
        end
        --创建子技能
        for idx,value in pairs(v) do
                local subSkill = GameObject.Instantiate(GearSubSkill,item.transform:Find("GearSkillPrefab"))
                subSkill:SetActive(true)
                ---子技能名字
                local Text_SubSkillName = subSkill.transform:Find("SubNamePanel/SubSkillPoint/Text_SubSkillName"):GetComponent("TextMeshProUGUI")
                Text_SubSkillName.text = value.Name
                ---tag
                local tag1 = subSkill.transform:Find("SubNamePanel/TagPanel/Img_Tag1")
                local tag2 = subSkill.transform:Find("SubNamePanel/TagPanel/Img_Tag2")
                if value.Skilltype1 ~= 0 then
                    tag1.gameObject:SetActive(true)
                    tag1:Find("Text_Tag"):GetComponent("TextMeshProUGUI").text = SkilltypeoneLocalData.tab[value.Skilltype1][2]
                else
                    tag1.gameObject:SetActive(false)
                end
                if value.Skilltype2 ~= 0 then
                    tag2.gameObject:SetActive(true)
                    tag2:Find("Text_Tag"):GetComponent("TextMeshProUGUI").text = SkilltypetwoLocalData.tab[value.Skilltype2][2]
                else
                    tag2.gameObject:SetActive(false)
                end
                Tools.ReSize(subSkill.transform:Find("SubNamePanel/TagPanel").gameObject)
                ---技能说明
                local explain = subSkill.transform:Find("SkillTips/Text_Jinengshuoming"):GetComponent("TextMeshProUGUI")
                explain.text = value.Explain
                ---例外事项
                local skillException = subSkill.transform:Find("SubNamePanel/Img_Exception/Text_Matter"):GetComponent("TextMeshProUGUI")
                local excGo = subSkill.transform:Find("SubNamePanel/Img_Exception").gameObject
                excGo.gameObject:SetActive(false)
                local Btn_SkillDetailTip = subSkill.transform:Find("TipsPanel/Btn_SkillDetailTip").gameObject
                local exception = string.split(value.Exception,"@")
                if exception[1] == "0" or #exception == 0 then
                    Btn_SkillDetailTip:SetActive(false)
                else
                    Btn_SkillDetailTip:SetActive(true)
                    local text = ""
                    for i = 1, #exception do
                        text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
                    end
                    skillException.text = text
                end
                ---例外事项按钮
                UIEvent.LuaPressClick(Btn_SkillDetailTip,function()
                    excGo.gameObject:SetActive(true)
                end)
                UIEvent.OnPointUpOrExit(Btn_SkillDetailTip,function()
                    excGo.gameObject:SetActive(false)
                end)
                Tools.ReSize(subSkill)
        end
        Tools.ReContentSizeGroup(self.VoidGearContent_Mix().gameObject)
        Tools.ReSize(self.VoidGearContent_Mix().gameObject)
    end
end
---UI显示刷新,(等级/属性/材料图片)
function M:RefreshRightUI_New()
    Tools.ClearAllChild(self.VoidGearContent_Mix().gameObject)
    self:InitLevel_New()
    self:InitAttr_New()
    self:InitSkill_New()

    if self.SpecialGear:MaxLevel() == self.SpecialGear.evolutionLevel then  --到装备最大等级
        self.VoidGearUpgradeNeedPanel().gameObject:SetActive(false)
        self.VoidGearMixNeedPanel().gameObject:SetActive(false)
        self.UpDownPanel().gameObject:SetActive(false)
        self.Text_NextLv_Mix().gameObject:SetActive(false)
        self.Btn_Quxiao().gameObject:SetActive(false)
        self.Btn_Upgrade().gameObject:SetActive(false)
        self.jiantou_Mix().gameObject:SetActive(false)
        self.Max().gameObject:SetActive(true)
        self.VoidGearMixPreview().transform.sizeDelta = Vector2(1183, 908)
    elseif self.SpecialGear.evolutionLevel == self.SpecialGear:GetMaxLevel() then   --到阶段最大等级(打开突破界面)
        self.VoidGearUpgradeNeedPanel().gameObject:SetActive(false)
        self.VoidGearMixNeedPanel().gameObject:SetActive(true)
        self.UpDownPanel().gameObject:SetActive(false)
        self.Max().gameObject:SetActive(false)
    elseif self.SpecialGear:CheckLockState() then                        --未到阶段最大等级(打开升级界面)
        self.VoidGearUpgradeNeedPanel().gameObject:SetActive(true)
        self.VoidGearMixNeedPanel().gameObject:SetActive(false)
        self.UpDownPanel().gameObject:SetActive(true)
        self.Max().gameObject:SetActive(false)
    else                                                                        --未到阶段最大等级(打开升级界面)
        self.VoidGearUpgradeNeedPanel().gameObject:SetActive(false)
        self.VoidGearMixNeedPanel().gameObject:SetActive(true)
        self.UpDownPanel().gameObject:SetActive(false)
        self.Max().gameObject:SetActive(false)
    end

    if self.SpecialGear:CheckLockState() and self.SpecialGear.evolutionLevel ~= self.SpecialGear:GetMaxLevel() then
        self:MaterialsCountRefresh()
    else
        self:MaterialsCountRefresh_New(self.MixCost)
    end
end
function M:MaterialsCountRefresh_New(_cost)
    Tools.ClearAllChild(self.VoidGearMixNeedPanel().gameObject)
    for i,v in ipairs(_cost) do
        local item = GameObject.Instantiate(self.materialPrefab_Mix,self.VoidGearMixNeedPanel().transform,false)
        item.transform:Find("Img_ItemCountBg").gameObject:SetActive(false)
        local rankImage = item.transform:Find("RewardRankImg"):GetComponent("Image")
        local itemImage = item.transform:Find("RewardIconImg"):GetComponent("Image")
        local star = item.transform:Find("StarPanel/ItemStarPrefab").gameObject
        star.gameObject:SetActive(false)
        local starRoot = item.transform:Find("StarPanel/ItemStarRoot").transform
        local countText = item.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        countText.gameObject:SetActive(false)
        local ItemCountText = item.transform:Find("Img_countdi/ItemCountText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(rankImage,self:GetQualityName(v.quality))
        MgrRes.LoadSprite(itemImage,v.icon)
        for i = 1, v.star do
            local s = GameObject.Instantiate(star,starRoot,false)
            s:SetActive(true)
        end

        if ItemControl.GetItemByIdAndType(v.id, v.goodsType).count >= v.count then
            ItemCountText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),self:NumberChange(ItemControl.GetItemByIdAndType(v.id, v.goodsType).count),v.count)
        else
            ItemCountText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),self:NumberChange(ItemControl.GetItemByIdAndType(v.id, v.goodsType).count),v.count)
            self.insufficient_Mix = true
        end
        UIEvent.LuaClick(itemImage.gameObject,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{v,true,nil,nil,true},true)
        end)
        item:SetActive(true)
    end
end

function M:LevelUpRefresh_New()
    self.Text_UseCount().text = tostring(self.mSetMinLv)
    self:InitParams()   --重新获取参数
    self:RefreshRightUI_New()
end
------------------------------------------------------End------------------------------------------------------
function M:EquipCreatSuccess()
    self.SuccessPanel().gameObject:SetActive(true)
    self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text99")
    self.LvText().gameObject:SetActive(true)
    self.OriginLVText().fontSize = 90
    self.TargetLVText().fontSize = 90
    self.OriginLVText().text = 0
    self.TargetLVText().text = 1
    local root = self.VoidGearInfoDataRoot().transform
    Tools.ClearAllChild(root.gameObject)
    local infoPrefab = self.VoidGearInfoDataPrefab().gameObject
    infoPrefab:SetActive(false)
    local targetEquipAttr = self.SpecialGear:GetAttr_SpecificPhaseLevel(1,1)    --升级后的属性
    for i,v in pairs(targetEquipAttr) do
        local prefab = GameObject.Instantiate(infoPrefab,root,false)
        local icon = prefab.transform:Find("Img_Shuxingicondi2/icon1"):GetComponent("Image")
        local NameTxt = prefab.transform:Find("HpNameText"):GetComponent("TextMeshProUGUI")
        local OriginText = prefab.transform:Find("SuccessCurHpText"):GetComponent("TextMeshProUGUI")
        local PreviewText = prefab.transform:Find("TargetHpText"):GetComponent("TextMeshProUGUI")
        MgrRes.LoadSprite(icon,v.attrIcon)
        NameTxt.text = v.attrName
        prefab:SetActive(true)
        local Attr
        local percentMark
        for idx,value in pairs(targetEquipAttr) do
            if value.attrID == v.attrID then
                Attr = value.attribute
                percentMark = (value.type == 1 and "%" or "")
                break
            end
        end
        OriginText.text = 0 .. percentMark
        PreviewText.text = Attr .. percentMark
    end
    Tools.ReSize(root.gameObject)
end
function M:GetQualityName(qualityID)
    local name = ""
    if qualityID == 1 then
        name = "Item/Rank/ItemRank_1"
    elseif qualityID == 2  then
        name = "Item/Rank/ItemRank_2"
    elseif  qualityID == 3 then
        name = "Item/Rank/ItemRank_3"
    elseif  qualityID == 4 then
        name = "Item/Rank/ItemRank_4"
    elseif  qualityID == 5 then
        name = "Item/Rank/ItemRank_5"
    elseif  qualityID == 6 then
        name = "Item/Rank/ItemRank_6"
    end
    return name
end
function M:NumberChange(number)
    return JNStrTool.numberAbbr(number)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        self:BackClick()
    end
end
function M:BackClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBack()
end
function M:OnClose()
    Event.Clear("EquipCreatSuccess")
end
return M