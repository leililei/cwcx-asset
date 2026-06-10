-- Code Auto Create Begin
local M = Class('RolePreview_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RolePreview_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RolePreview_UI].prefab'
    self.Name = 'Form[RolePreview_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'mask','mask',2},{'RoleInfoPreview','RoleInfoPreview',2},{'ClickBackArea','RoleInfoPreview/ClickBackArea',2},{'ClickBackAreaMask','RoleInfoPreview/ClickBackAreaMask',2},{'Img_Tanchuangdi1','RoleInfoPreview/Img_Tanchuangdi1',2},{'Img_Xian1','RoleInfoPreview/Img_Xian1',2},{'Img_Xian2','RoleInfoPreview/Img_Xian2',2},{'kuangxian','RoleInfoPreview/kuangxian',2},{'di(xing)','RoleInfoPreview/RoleStarPanel/di(xing)',2},{'PreviewStarPanel','RoleInfoPreview/RoleStarPanel/PreviewStarPanel',2},{'Btn_StarDownHighLight','RoleInfoPreview/RoleStarPanel/Btn_StarDownHighLight',2},{'-(hei)','RoleInfoPreview/RoleStarPanel/Btn_StarDownHighLight/-(hei)',2},{'Btn_StarDown','RoleInfoPreview/RoleStarPanel/Btn_StarDown',2},{'-(hui)','RoleInfoPreview/RoleStarPanel/Btn_StarDown/-(hui)',2},{'Btn_StarUpHighLight','RoleInfoPreview/RoleStarPanel/Btn_StarUpHighLight',2},{'+(hei)','RoleInfoPreview/RoleStarPanel/Btn_StarUpHighLight/+(hei)',2},{'Btn_StarUp','RoleInfoPreview/RoleStarPanel/Btn_StarUp',2},{'+(hui)','RoleInfoPreview/RoleStarPanel/Btn_StarUp/+(hui)',2},{'StarPrefab','RoleInfoPreview/RoleStarPanel/StarPrefab',2},{'StarJueXingPrefab','RoleInfoPreview/RoleStarPanel/StarJueXingPrefab',2},{'Lvdi','RoleInfoPreview/RoleLvPanel/Lvdi',2},{'Btn_MaxLv','RoleInfoPreview/RoleLvPanel/Lvdi/Btn_MaxLv',2},{'lvmindi','RoleInfoPreview/RoleLvPanel/lvmindi',2},{'Btn_MinLv','RoleInfoPreview/RoleLvPanel/lvmindi/Btn_MinLv',2},{'Btn_LvDownHighLight','RoleInfoPreview/RoleLvPanel/Btn_LvDownHighLight',2},{'-(hei)2','RoleInfoPreview/RoleLvPanel/Btn_LvDownHighLight/-(hei)2',2},{'Btn_LvDown','RoleInfoPreview/RoleLvPanel/Btn_LvDown',2},{'-(hui)2','RoleInfoPreview/RoleLvPanel/Btn_LvDown/-(hui)2',2},{'Btn_LvUpHighLight','RoleInfoPreview/RoleLvPanel/Btn_LvUpHighLight',2},{'+(hei)2','RoleInfoPreview/RoleLvPanel/Btn_LvUpHighLight/+(hei)2',2},{'Btn_LvUp','RoleInfoPreview/RoleLvPanel/Btn_LvUp',2},{'+(hui)2','RoleInfoPreview/RoleLvPanel/Btn_LvUp/+(hui)2',2},{'di(lv)','RoleInfoPreview/RoleLvPanel/di(lv)',2},{'biaotixian','RoleInfoPreview/biaotixian',2},{'RoleInfoPanel','RoleInfoPreview/RoleInfoPanel',2},{'RoleInfoBgPanel','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel',2},{'RoleInfoIconPanel','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel',2},{'AtkIcon','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkIcon',2},{'ZhiYuanIcon','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon',2},{'Background','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon/ZhiYuanNameTxt/ZhiYuanSlider/Background',2},{'Fill','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon/ZhiYuanNameTxt/ZhiYuanSlider/Fill Area/Fill',2},{'Image','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon/ZhiYuanNameTxt/ZhiYuanSlider/Image',2},{'Image(1)','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon/ZhiYuanNameTxt/ZhiYuanSlider/Image (1)',2},{'HpIcon','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HpIcon',2},{'DefIcon','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefIcon',2},{'BaojiIcon','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiIcon',2},{'BaoshangIcon','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoshangIcon',2},{'MingjieIcon','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MingjieIcon',2},{'Background01','RoleInfoPreview/RoleInfoPanel/MinjieSlider/Background',2},{'Fill01','RoleInfoPreview/RoleInfoPanel/MinjieSlider/Fill Area/Fill',2},{'Image01','RoleInfoPreview/RoleInfoPanel/MinjieSlider/Image',2},{'Image(1)01','RoleInfoPreview/RoleInfoPanel/MinjieSlider/Image (1)',2},{'Background02','RoleInfoPreview/RoleInfoPanel/BaoshangSlider/Background',2},{'Fill02','RoleInfoPreview/RoleInfoPanel/BaoshangSlider/Fill Area/Fill',2},{'Image02','RoleInfoPreview/RoleInfoPanel/BaoshangSlider/Image',2},{'Image(1)02','RoleInfoPreview/RoleInfoPanel/BaoshangSlider/Image (1)',2},{'Background03','RoleInfoPreview/RoleInfoPanel/BaojiSlider/Background',2},{'Fill03','RoleInfoPreview/RoleInfoPanel/BaojiSlider/Fill Area/Fill',2},{'Image03','RoleInfoPreview/RoleInfoPanel/BaojiSlider/Image',2},{'Image(1)03','RoleInfoPreview/RoleInfoPanel/BaojiSlider/Image (1)',2},{'Background04','RoleInfoPreview/RoleInfoPanel/DefenceSlider/Background',2},{'Fill04','RoleInfoPreview/RoleInfoPanel/DefenceSlider/Fill Area/Fill',2},{'Image04','RoleInfoPreview/RoleInfoPanel/DefenceSlider/Image',2},{'Image(1)04','RoleInfoPreview/RoleInfoPanel/DefenceSlider/Image (1)',2},{'RoleFanweiPreview','RoleFanweiPreview',2},{'ClickBackArea01','RoleFanweiPreview/ClickBackArea',2},{'ClickBackAreaMask01','RoleFanweiPreview/ClickBackAreaMask',2},{'Img_Xian201','RoleFanweiPreview/Img_Xian2',2},{'Img_Xian101','RoleFanweiPreview/Img_Xian1',2},{'Img_Tanchuangdi101','RoleFanweiPreview/Img_Tanchuangdi1',2},{'biaotixian01','RoleFanweiPreview/biaotixian',2},{'Fanwei1','RoleFanweiPreview/Fanwei1',2},{'Fanwei','RoleFanweiPreview/Fanwei1/Fanwei',2},{'Img_Jiantou','RoleFanweiPreview/Img_Jiantou',2},{'Fanwei2','RoleFanweiPreview/Fanwei2',2},{'Fanwei01','RoleFanweiPreview/Fanwei2/Fanwei',2},{'Btn_Zuo','RoleFanweiPreview/Btn_Zuo',2},{'Img_Zuo','RoleFanweiPreview/Btn_Zuo/Img_Zuo',2},{'Btn_You','RoleFanweiPreview/Btn_You',2},{'Img_You','RoleFanweiPreview/Btn_You/Img_You',2},{'Img_Dian1','RoleFanweiPreview/Img_Dian1',2},{'Img_Dian2','RoleFanweiPreview/Img_Dian2',2},{'Img_Dian3','RoleFanweiPreview/Img_Dian3',2},{'Img_Dangqiandian','RoleFanweiPreview/Img_Dangqiandian',2},{'RoleSkillPreview','RoleSkillPreview',2},{'ClickBackArea02','RoleSkillPreview/ClickBackArea',2},{'ClickBackAreaMask02','RoleSkillPreview/ClickBackAreaMask',2},{'Img_Tanchuangdi','RoleSkillPreview/Img_Tanchuangdi',2},{'Btn_Return','RoleSkillPreview/Btn_Return',2},{'Img_Fanhuidi','RoleSkillPreview/Btn_Return/Img_Fanhuidi',2},{'RoleDetailSkillRoot','RoleSkillPreview/RoleDetailSkillRoot',2},{'RoleDetailLayoutRoot','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot',2},{'RoleCombineSkill1','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill1',2},{'XuanZhong_TX_1','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill1/XuanZhong_TX_1',2},{'XuanZhong_TX_start_1','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill1/XuanZhong_TX_1/XuanZhong_TX_start_1',2},{'RoleCombineSkill2','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill2',2},{'XuanZhong_TX_2','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill2/XuanZhong_TX_2',2},{'XuanZhong_TX_start_101','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill2/XuanZhong_TX_2/XuanZhong_TX_start_1',2},{'RoleCombineSkill3','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill3',2},{'XuanZhong_TX_3','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill3/XuanZhong_TX_3',2},{'XuanZhong_TX_start_102','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill3/XuanZhong_TX_3/XuanZhong_TX_start_1',2},{'RoleCombineSkill4','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill4',2},{'XuanZhong_TX_4','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill4/XuanZhong_TX_4',2},{'XuanZhong_TX_start_103','RoleSkillPreview/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill4/XuanZhong_TX_4/XuanZhong_TX_start_1',2},{'fenggexian','RoleSkillPreview/fenggexian',2},{'RoleSkillPanel1','RoleSkillPreview/RoleSkillPanel1',2},{'Jinengshuoming','RoleSkillPreview/RoleSkillPanel1/Jinengshuoming',2},{'Leixing1','RoleSkillPreview/RoleSkillPanel1/Leixing1',2},{'Leixing2','RoleSkillPreview/RoleSkillPanel1/Leixing2',2},{'SkillLeixing','RoleSkillPreview/RoleSkillPanel1/SkillLeixing',2},{'SkillRank','RoleSkillPreview/RoleSkillPanel1/SkillRank',2},{'SkillName','RoleSkillPreview/RoleSkillPanel1/SkillName',2},{'RoleSkillPanel2','RoleSkillPreview/RoleSkillPanel2',2},{'Jinengshuoming01','RoleSkillPreview/RoleSkillPanel2/Jinengshuoming',2},{'Leixing101','RoleSkillPreview/RoleSkillPanel2/Leixing1',2},{'Leixing201','RoleSkillPreview/RoleSkillPanel2/Leixing2',2},{'SkillLeixing01','RoleSkillPreview/RoleSkillPanel2/SkillLeixing',2},{'SkillRank01','RoleSkillPreview/RoleSkillPanel2/SkillRank',2},{'SkillName01','RoleSkillPreview/RoleSkillPanel2/SkillName',2},{'TipPanel','RoleSkillPreview/RoleSkillPanel2/TipPanelImg/TipPanel',2},{'ContentMask','RoleSkillPreview/RoleSkillPanel2/TipPanelImg/TipPanel/ContentMask',2},{'TipTextScroll','RoleSkillPreview/RoleSkillPanel2/TipPanelImg/TipPanel/ContentMask/TipTextScroll',2},{'Viewport','RoleSkillPreview/RoleSkillPanel2/TipPanelImg/TipPanel/ContentMask/TipTextScroll/Viewport',2},{'Btn_SkillDetailTip','RoleSkillPreview/RoleSkillPanel2/TipPanelImg/Btn_SkillDetailTip',2},{'Btn_Zuo01','RoleSkillPreview/Btn_Zuo',2},{'Img_Zuo01','RoleSkillPreview/Btn_Zuo/Img_Zuo',2},{'Btn_You01','RoleSkillPreview/Btn_You',2},{'Img_You01','RoleSkillPreview/Btn_You/Img_You',2},{'Img_Dangqiandian01','RoleSkillPreview/Img_Dangqiandian',2},{'Img_Dian101','RoleSkillPreview/Img_Dian1',2},{'Img_Dian201','RoleSkillPreview/Img_Dian2',2},{'RoleSkillDetailPanel','RoleSkillDetailPanel',2},{'ClickBackArea03','RoleSkillDetailPanel/ClickBackArea',2},{'ClickBackAreaMask03','RoleSkillDetailPanel/ClickBackAreaMask',2},{'Img_Xian102','RoleSkillDetailPanel/Img_Xian1',2},{'Img_Xian202','RoleSkillDetailPanel/Img_Xian2',2},{'Img_Tanchuangdi102','RoleSkillDetailPanel/Img_Tanchuangdi1',2},{'Img_Biaotixian','RoleSkillDetailPanel/Img_Biaotixian',2},{'RoleDetailSkillRoot01','RoleSkillDetailPanel/RoleDetailSkillRoot',2},{'RoleDetailLayoutRoot01','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot',2},{'RoleCombineSkill101','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill1',2},{'XuanZhong_TX_101','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill1/XuanZhong_TX_1',2},{'XuanZhong_TX_start_104','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill1/XuanZhong_TX_1/XuanZhong_TX_start_1',2},{'RoleCombineSkill201','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill2',2},{'XuanZhong_TX_201','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill2/XuanZhong_TX_2',2},{'XuanZhong_TX_start_105','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill2/XuanZhong_TX_2/XuanZhong_TX_start_1',2},{'RoleCombineSkill301','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill3',2},{'XuanZhong_TX_301','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill3/XuanZhong_TX_3',2},{'XuanZhong_TX_start_106','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill3/XuanZhong_TX_3/XuanZhong_TX_start_1',2},{'RoleCombineSkill401','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill4',2},{'XuanZhong_TX_401','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill4/XuanZhong_TX_4',2},{'XuanZhong_TX_start_107','RoleSkillDetailPanel/RoleDetailSkillRoot/RoleDetailLayoutRoot/RoleCombineSkill4/XuanZhong_TX_4/XuanZhong_TX_start_1',2},{'fenggexian01','RoleSkillDetailPanel/fenggexian',2},{'RoleSkillDeatilDesPanel','RoleSkillDetailPanel/RoleSkillDeatilDesPanel',2},{'Jinengshuoming02','RoleSkillDetailPanel/Jinengshuoming',2},{'Leixing102','RoleSkillDetailPanel/Leixing1',2},{'Leixing202','RoleSkillDetailPanel/Leixing2',2},{'SkillLeixing02','RoleSkillDetailPanel/SkillLeixing',2},{'SkillRank02','RoleSkillDetailPanel/SkillRank',2},{'SkillName02','RoleSkillDetailPanel/SkillName',2},{'Btn_SkillUpYulan','RoleSkillDetailPanel/Btn_SkillUpYulan',2},{'TipPanelImg','RoleSkillDetailPanel/TipPanelImg',2},{'TipPanel01','RoleSkillDetailPanel/TipPanelImg/TipPanel',2},{'ContentMask01','RoleSkillDetailPanel/TipPanelImg/TipPanel/ContentMask',2},{'TipTextScroll01','RoleSkillDetailPanel/TipPanelImg/TipPanel/ContentMask/TipTextScroll',2},{'Viewport01','RoleSkillDetailPanel/TipPanelImg/TipPanel/ContentMask/TipTextScroll/Viewport',2},{'Btn_SkillDetailTip01','RoleSkillDetailPanel/TipPanelImg/Btn_SkillDetailTip',2},
        -- Text 列表
        {'BtnMaxLV_Txt','RoleInfoPreview/RoleLvPanel/Lvdi/BtnMaxLV_Txt',3},{'BtnMinLV_Txt','RoleInfoPreview/RoleLvPanel/lvmindi/BtnMinLV_Txt',3},{'LV','RoleInfoPreview/RoleLvPanel/LV',3},{'RoleLvText','RoleInfoPreview/RoleLvPanel/RoleLvText',3},{'RoleLvMaxText','RoleInfoPreview/RoleLvPanel/RoleLvMaxText',3},{'HpNameTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HpNameTxt',3},{'DefNameTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefNameTxt',3},{'BaojiNameTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiNameTxt',3},{'BaoShangNameTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoShangNameTxt',3},{'MinjieNameTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieNameTxt',3},{'AtkNameTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkIcon/AtkNameTxt',3},{'AtkInfoTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkIcon/AtkNameTxt/AtkInfoTxt',3},{'ZhiYuanNameTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon/ZhiYuanNameTxt',3},{'ZhiYuanInfoTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon/ZhiYuanNameTxt/ZhiYuanInfoTxt',3},{'HPInfoTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HPInfoTxt',3},{'DefInfoTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefInfoTxt',3},{'BaojiInfoTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiInfoTxt',3},{'BaoshangInfoTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoshangInfoTxt',3},{'MinjieInfoTxt','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieInfoTxt',3},{'PanelTitleText','RoleInfoPreview/PanelTitleText',3},{'PanelTitleText01','RoleFanweiPreview/PanelTitleText',3},{'Text_Qianghuadengji','RoleFanweiPreview/Text_Qianghuadengji',3},{'Text_Title','RoleSkillPreview/Text_Title',3},{'Text_Fanhui','RoleSkillPreview/Btn_Return/Text_Fanhui',3},{'SkillDesTxt','RoleSkillPreview/RoleSkillPanel1/Jinengshuoming/SkillDesTxt',3},{'SkillTypeTxt','RoleSkillPreview/RoleSkillPanel1/Leixing1/SkillTypeTxt',3},{'SkillTypeTxt01','RoleSkillPreview/RoleSkillPanel1/Leixing2/SkillTypeTxt',3},{'SkillTypeTxt02','RoleSkillPreview/RoleSkillPanel1/SkillLeixing/SkillTypeTxt',3},{'SkillRankText1','RoleSkillPreview/RoleSkillPanel1/SkillRankText1',3},{'SkillRankText2','RoleSkillPreview/RoleSkillPanel1/SkillRankText2',3},{'SkillTypeTxt03','RoleSkillPreview/RoleSkillPanel1/SkillRank/SkillTypeTxt',3},{'SkillNameText','RoleSkillPreview/RoleSkillPanel1/SkillNameText',3},{'SkillTypeTxt04','RoleSkillPreview/RoleSkillPanel1/SkillName/SkillTypeTxt',3},{'SkillDesTxt01','RoleSkillPreview/RoleSkillPanel2/Jinengshuoming/SkillDesTxt',3},{'SkillTypeTxt05','RoleSkillPreview/RoleSkillPanel2/Leixing1/SkillTypeTxt',3},{'SkillTypeTxt06','RoleSkillPreview/RoleSkillPanel2/Leixing2/SkillTypeTxt',3},{'SkillTypeTxt07','RoleSkillPreview/RoleSkillPanel2/SkillLeixing/SkillTypeTxt',3},{'SkillRankText101','RoleSkillPreview/RoleSkillPanel2/SkillRankText1',3},{'SkillRankText201','RoleSkillPreview/RoleSkillPanel2/SkillRankText2',3},{'SkillTypeTxt08','RoleSkillPreview/RoleSkillPanel2/SkillRank/SkillTypeTxt',3},{'SkillNameText01','RoleSkillPreview/RoleSkillPanel2/SkillNameText',3},{'SkillTypeTxt09','RoleSkillPreview/RoleSkillPanel2/SkillName/SkillTypeTxt',3},{'SkillTipTxt','RoleSkillPreview/RoleSkillPanel2/TipPanelImg/TipPanel/ContentMask/TipTextScroll/Viewport/SkillTipTxt',3},{'TipNameTxt','RoleSkillPreview/RoleSkillPanel2/TipPanelImg/Btn_SkillDetailTip/TipNameTxt',3},{'Text_Qianghuadengji01','RoleSkillPreview/Text_Qianghuadengji',3},{'Text_Biaoti','RoleSkillDetailPanel/Text_Biaoti',3},{'SkillDesTxt02','RoleSkillDetailPanel/Jinengshuoming/SkillDesTxt',3},{'SkillTypeTxt10','RoleSkillDetailPanel/Leixing1/SkillTypeTxt',3},{'SkillTypeTxt11','RoleSkillDetailPanel/Leixing2/SkillTypeTxt',3},{'SkillTypeTxt12','RoleSkillDetailPanel/SkillLeixing/SkillTypeTxt',3},{'SkillTypeTxt13','RoleSkillDetailPanel/SkillRank/SkillTypeTxt',3},{'SkillRankText102','RoleSkillDetailPanel/SkillRankText1',3},{'SkillRankText202','RoleSkillDetailPanel/SkillRankText2',3},{'SkillTypeTxt14','RoleSkillDetailPanel/SkillName/SkillTypeTxt',3},{'SkillNameText02','RoleSkillDetailPanel/SkillNameText',3},{'TipNameTxt01','RoleSkillDetailPanel/Btn_SkillUpYulan/TipNameTxt',3},{'SkillTipTxt01','RoleSkillDetailPanel/TipPanelImg/TipPanel/ContentMask/TipTextScroll/Viewport/SkillTipTxt',3},{'TipNameTxt02','RoleSkillDetailPanel/TipPanelImg/Btn_SkillDetailTip/TipNameTxt',3},
        -- Slider 列表
        {'ZhiYuanSlider','RoleInfoPreview/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanIcon/ZhiYuanNameTxt/ZhiYuanSlider',5},{'MinjieSlider','RoleInfoPreview/RoleInfoPanel/MinjieSlider',5},{'BaoshangSlider','RoleInfoPreview/RoleInfoPanel/BaoshangSlider',5},{'BaojiSlider','RoleInfoPreview/RoleInfoPanel/BaojiSlider',5},{'DefenceSlider','RoleInfoPreview/RoleInfoPanel/DefenceSlider',5},
    }
end
-- Code Auto Create End
require("LocalData/SkillLocalData")
require("LocalData/TxtLocalData")

function M:OnInit()
    self.skillType1 = {
        MgrLanguageData.GetLanguageByKey("rolegearcore_ui_intensify"),MgrLanguageData.GetLanguageByKey("rolepreview_ui_adverse"),MgrLanguageData.GetLanguageByKey("skillsbook_type_extra"),
    }
    self.skillType2 = {
        MgrLanguageData.GetLanguageByKey("skillsbook_type_extra"),MgrLanguageData.GetLanguageByKey("skillsbook_type_immune"), MgrLanguageData.GetLanguageByKey("skillsbook_type_reset"), 
        MgrLanguageData.GetLanguageByKey("skillsbook_type_reflex"), MgrLanguageData.GetLanguageByKey("skillsbook_type_absorb"), MgrLanguageData.GetLanguageByKey("skillsbook_type_revive"),
        MgrLanguageData.GetLanguageByKey("skillsbook_type_recover"), MgrLanguageData.GetLanguageByKey("skillsbook_type_continuedamage"), MgrLanguageData.GetLanguageByKey("skillsbook_type_ridicule"),
        MgrLanguageData.GetLanguageByKey("skillsbook_type_control"), MgrLanguageData.GetLanguageByKey("skillsbook_type_bewitch"), MgrLanguageData.GetLanguageByKey("skillsbook_type_lmprint"),
        MgrLanguageData.GetLanguageByKey("skillsbook_type_focus"), MgrLanguageData.GetLanguageByKey("skillsbook_type_prohibit"), MgrLanguageData.GetLanguageByKey("skillsbook_type_weaken"),
        MgrLanguageData.GetLanguageByKey("rolegearcore_ui_intensify"),MgrLanguageData.GetLanguageByKey("skillsbook_type_plunder"), MgrLanguageData.GetLanguageByKey("skillsbook_type_scatter"),
        MgrLanguageData.GetLanguageByKey("skillsbook_type_shield"), MgrLanguageData.GetLanguageByKey("skillsbook_type_given"), MgrLanguageData.GetLanguageByKey("skillsbook_type_damagereduction"),
        MgrLanguageData.GetLanguageByKey("skillsbook_type_converge"), MgrLanguageData.GetLanguageByKey("skillsbook_type_special"), MgrLanguageData.GetLanguageByKey("skillsbook_type_strikeback"),
        MgrLanguageData.GetLanguageByKey("skillsbook_type_counterattack"), MgrLanguageData.GetLanguageByKey("skillsbook_type_sacrifice"), MgrLanguageData.GetLanguageByKey("skillsbook_type_undead"),
    }
    self.index = 0
    self.arrangeTexture = {}    --所有技能图片
    self.Int_FuncIndex = 0 --当前人物等级按钮升降
    self.IsEndLoopToInput =false --循环点击检测是否终止Flag
    self.Int_LoopTimer = 0 --循环检测计数器
    self.Int_HasClick = 0 --用于检测单击按钮后是否继续长按
    self.mSelectObj_Skill = nil     ---当前技能按钮
    self.mSelectObj_SkillUp = nil   ---当前技能升级按钮
    self.mSkillUp1 = nil     ---当前技能升级数据1
    self.mSkillUp2 = nil     ---当前技能升级数据2
    self:InitRoleInfo()
    ---隐藏例外事项说明
    self.TipPanel().gameObject:SetActive(false)
    self.TipPanel01().gameObject:SetActive(false)
    self:RegisterLoopScroll()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.mask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
function M:OnShow(data)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    if data[1] and data[1].awaken then
        self.CurRoleIsWake = data[1].awaken --是否觉醒
    end
    self.RoleID = data[1].id            --角色id
    self.Star = data[1].star            --角色星数
    self.LocalPreviewLv= data[1].level  --角色等级
    if data[1].skin then
        self.SkinID = data[1].skin
    end

    if self.RoleID < 200000 then
        self.CurBattleRole = data[1]:GetHeroAttr()  --角色属性  RoleData
    else
        self.CurBattleRole = data[1]:GetMonsterMaxAttr()  --怪物属性   RoleData
    end
    ---@type RoleData
    self.CurHero = data[1]
    self.PanelIndex = data[2]
    ---@type JNSkill
    self.Skill = data[3]
    --if self.Skill == nil or #self.Skill == 0 then
    --    return
    --end
    if data[4] then
        self.skillIndex = data[4]
    end
    if data[1].skillLevel then
        self.showSkillLevel = data[1].skillLevel
        self.Btn_SkillUpYulan().gameObject:SetActive(false)
    end
    if self.PanelIndex == 1
    then
        -- 人物信息界面
        self.RoleInfoPreview().gameObject:SetActive(true)
        self.RoleSkillPreview().gameObject:SetActive(false)
        self.RoleSkillDetailPanel().gameObject:SetActive(false)
        self.RoleFanweiPreview().gameObject:SetActive(false)
        self:InitRoleInfo()
        self:InitRoleInfoPanel(self.CurBattleRole)
    elseif self.PanelIndex == 2
    then
        -- 技能预览界面
        self.RoleSkillDetailPanel().gameObject:SetActive(true)
        self.RoleSkillPreview().gameObject:SetActive(false)
        self.RoleInfoPreview().gameObject:SetActive(false)
        self:RoleFanweiPreview().gameObject:SetActive(false)
        --初始化技能面板
        self:InitRoleSkillDetailPanel()
        --self:InitNomalSkillPanel()
    elseif self.PanelIndex == 3 then
        --技能范围详情
        self:RoleFanweiPreview().gameObject:SetActive(true)
        self.RoleSkillDetailPanel().gameObject:SetActive(false)
        self.RoleInfoPreview().gameObject:SetActive(false)
        self.RoleSkillPreview().gameObject:SetActive(false)
        --初始化技能范围显示数据
        self:InitFanweiPanel()
    end
end
---初始化技能范围显示
function M:InitFanweiPanel()
    local roleAttackRange = self.RoleID < 200000 and RoleattributeLocalData.tab[self.RoleID][36] or MonsterLocalData.tab[self.RoleID][31]   --读表得到角色攻击范围
    local allRange = JNStrTool.strSplit(";" ,roleAttackRange)
    self.skillRangeTable = {}
    for i = 1, #allRange do
        self.skillRangeTable[i] = JNStrTool.strSplit("," ,allRange[i])
    end
    for i = 1, #self.skillRangeTable do
        for j, n in pairs(RangeLocalData.tab) do
            if self.skillRangeTable[i][2] == n[2] then
                self.arrangeTexture[i] = n[3]       --获得所有图片名称
            end
        end
    end
    --local roleCurSkillLv = self.CurBattleRole.SkillLv
    --如果只有一张范围图片/有多张范围图片
    if #self.skillRangeTable == 1 then
        self.Fanwei1().transform.localPosition = Vector3(0,-46.5,0)
        self.Img_Jiantou().gameObject:SetActive(false)
        self.Fanwei2().gameObject:SetActive(false)
        self.Btn_Zuo().gameObject:SetActive(false)
        self.Btn_You().gameObject:SetActive(false)
        self.Img_Dangqiandian().gameObject:SetActive(false)
        self.Img_Dian1().gameObject:SetActive(false)
        self.Img_Dian2().gameObject:SetActive(false)
        self.Text_Qianghuadengji().gameObject:SetActive(false)
        if self.CurBattleRole.Occupation ~= 4 then
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..self.arrangeTexture[1])
        else
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..self.arrangeTexture[1])
        end
    else
        self.Fanwei1().transform.localPosition = Vector3(-215.2,-46.5,0)
        self.Img_Jiantou().gameObject:SetActive(true)
        self.Fanwei2().gameObject:SetActive(true)
        self.Btn_Zuo().gameObject:SetActive(true)
        self.Btn_You().gameObject:SetActive(true)
        self.Img_Dangqiandian().gameObject:SetActive(true)
        self.Img_Dian1().gameObject:SetActive(true)
        self.Img_Dian2().gameObject:SetActive(true)
        self.Text_Qianghuadengji().gameObject:SetActive(true)
        --第一张范围图index
        self.firstImageIndex = 0 
        self.nextUpLv = 0  --下次升级范围的技能等级
        for i = 1, #self.skillRangeTable do
            if tonumber(self.skillRangeTable[i][1]) <= self.CurBattleRole.SkillLV then
                self.firstImageIndex = self.firstImageIndex + 1
            end
            if self.firstImageIndex == #self.skillRangeTable then
                self.firstImageIndex = self.firstImageIndex - 1
            end
            self.nextUpLv = tonumber(self.skillRangeTable[self.firstImageIndex + 1][1])
        end
        --刷新图片文字
        self:RefreshRangeImage()
        --初始化按钮
        self:InitFanweiPanelButton()
    end
end
---技能范围左右按钮
function M:InitFanweiPanelButton()
    if self.firstImageIndex == 1 then
        self.Btn_Zuo().gameObject:SetActive(false)
    elseif self.firstImageIndex == #self.arrangeTexture - 1 then
        self.Btn_You().gameObject:SetActive(false)
    end

    UIEvent.LuaClick(self.Btn_Zuo().gameObject,function()
        if self.firstImageIndex > 1 then
            self.firstImageIndex = self.firstImageIndex - 1
            self:RefreshRangeImage()
            self.Btn_You().gameObject:SetActive(true)
        end
    end)
    UIEvent.LuaClick(self.Btn_You().gameObject,function()
        if self.firstImageIndex < #self.arrangeTexture - 1 then
            self.firstImageIndex = self.firstImageIndex + 1
            self:RefreshRangeImage()
            self.Btn_Zuo().gameObject:SetActive(true)
        end
    end)
end
---刷新范围图片
function M:RefreshRangeImage()
    if self.CurBattleRole.occupation ~= 4 then
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..self.arrangeTexture[self.firstImageIndex])
        MgrRes.LoadSprite(self.Fanwei01(),"AtkRange/OtherRange/"..self.arrangeTexture[self.firstImageIndex + 1])
    else
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..self.arrangeTexture[self.firstImageIndex])
        MgrRes.LoadSprite(self.Fanwei01(),"AtkRange/SupportRange/"..self.arrangeTexture[self.firstImageIndex + 1])
    end
    --文字
    self.nextUpLv = tonumber(self.skillRangeTable[self.firstImageIndex + 1][1])
    self.Text_Qianghuadengji().text = MgrLanguageData.GetLanguageByKey("rolepreview_ui_tips1").. self.nextUpLv ..MgrLanguageData.GetLanguageByKey("rolepreview_ui_tips2")
    --隐藏左右按钮
    if self.firstImageIndex >= #self.arrangeTexture - 1 then
        self.Btn_You().gameObject:SetActive(false)
    end
    if self.firstImageIndex <= 1 then
        self.Btn_Zuo().gameObject:SetActive(false)
    end
end

---第一次初始化技能面板
function M:InitRoleSkillDetailPanel()
    local images = {
        self.RoleCombineSkill101(),
        self.RoleCombineSkill201(),
        self.RoleCombineSkill301(),
        self.RoleCombineSkill401(),
    }
    local kuang = {
        self.XuanZhong_TX_101(),
        self.XuanZhong_TX_201(),
        self.XuanZhong_TX_301(),
        self.XuanZhong_TX_401(),
    }

    if self.mSelectObj_Skill == nil then
        self.mSelectObj_Skill = kuang[1]
        for i = 2, #kuang do
            kuang[i].gameObject:SetActive(false)
        end
        ---初始化技能图片
        for i = 1, #self.Skill do
            ---初始化技能图片
            MgrRes.LoadSprite(images[i],"Skill/"..self.Skill[i].Icon)
            ---初始化图片按钮
            UIEvent.LuaClick(images[i].gameObject,function()
                if self.mSelectObj_Skill == kuang[i] then
                    return
                end
                self.mSelectObj_Skill.gameObject:SetActive(false)
                self.mSelectObj_Skill = kuang[i]
                self.mSelectObj_Skill.gameObject:SetActive(true)

                self:ClickSkillImage(self.Skill[i])
            end)
        end
    end
    
    ---初始化技能名称/等级/类型
    self.RoleSkillDetailPanel().transform:Find("SkillNameText"):GetComponent("TextMeshProUGUI").text = self.Skill[1].Name
    self.RoleSkillDetailPanel().transform:Find("SkillRankText2"):GetComponent("TextMeshProUGUI").text = "/"..tonumber(SteamLocalData.tab[105008][2])
    if self.showSkillLevel then
        self.RoleSkillDetailPanel().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.showSkillLevel
        self.Btn_SkillUpYulan().gameObject:SetActive(self.showSkillLevel ~= tonumber(SteamLocalData.tab[105008][2]))
    else
        self.RoleSkillDetailPanel().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.CurBattleRole.SkillLV
        self.Btn_SkillUpYulan().gameObject:SetActive(self.CurBattleRole.SkillLV ~= tonumber(SteamLocalData.tab[105008][2]))
    end
    self.RoleSkillDetailPanel().transform:Find("Leixing1").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType1[self.Skill[1].Skilltype1]
    self.RoleSkillDetailPanel().transform:Find("Leixing2").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType2[self.Skill[1].Skilltype2 + 1]
    self.RoleSkillDetailPanel().transform:Find("Jinengshuoming").transform:Find("SkillDesTxt"):GetComponent("TextMeshProUGUI").text = self.Skill[1].Explain
    ---例外事项
    self:ReadException(self.Skill[1])
    ---技能升级预览按钮
    UIEvent.LuaClick(self.Btn_SkillUpYulan().gameObject,function()
        self:ClickBtn_SkillUpYulan()
    end)
end
---点击技能刷新
function M:ClickSkillImage(skillData)
    self.RoleSkillDetailPanel().transform:Find("SkillNameText"):GetComponent("TextMeshProUGUI").text = skillData.Name
    if self.showSkillLevel then
        self.RoleSkillDetailPanel().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.showSkillLevel
        self.Btn_SkillUpYulan().gameObject:SetActive(self.showSkillLevel ~= tonumber(SteamLocalData.tab[105008][2]))
    else
        self.RoleSkillDetailPanel().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.CurBattleRole.SkillLV
        self.Btn_SkillUpYulan().gameObject:SetActive(self.CurBattleRole.SkillLV ~= tonumber(SteamLocalData.tab[105008][2]))
    end
    self.RoleSkillDetailPanel().transform:Find("Leixing1").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType1[skillData.Skilltype1]
    self.RoleSkillDetailPanel().transform:Find("Leixing2").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType2[skillData.Skilltype2 + 1]
    self.RoleSkillDetailPanel().transform:Find("Jinengshuoming").transform:Find("SkillDesTxt"):GetComponent("TextMeshProUGUI").text = skillData.Explain
    self:ReadException(skillData)
end
---读取例外事项
function M:ReadException(skill)
    local exception = string.split(skill.Exception,"@")
    local text = ""
    self.SkillTipTxt01().text = ""
    self.TipPanelImg().gameObject:SetActive(true)
    for i = 1, #exception do
        if tonumber(exception[i]) == 0 then
            self.TipPanelImg().gameObject:SetActive(false)
            break
        end
        text = text .. string.split(TxtLocalData.tab[180004][tonumber(exception[i]) + 4],"_")[2] .. "\n"
    end
    self.SkillTipTxt01().text = text
end

---点击"技能升级预览"
function M:ClickBtn_SkillUpYulan()
    ---获取所有技能等级下技能数据
    self:InitRoleSkillData()
    ---显示当前等级技能和下一等级技能
    self:ShowRoleSkillPreview()
end
---其它等级技能数据( 获取玩家数据，内部含有技能数据 )
function M:InitRoleSkillData()
    local MaxSkillLv = self.CurBattleRole.SkillMaxLV
    self.CurLoopList = {}
    if self.RoleID < 200000 then
        for i = 0, MaxSkillLv+1, 1 do
            local attr = ReadData.GetRoleAttr(self.RoleID,self.LocalPreviewLv,self.Star,i,self.CurRoleIsWake)
            table.insert(self.CurLoopList,attr)
        end
    else
        for i = 0, MaxSkillLv+1, 1 do
            local attr = ReadData.GetMonsterAttr(self.RoleID,self.Star,i,self.CurRoleIsWake,self.LocalPreviewLv)
            table.insert(self.CurLoopList,attr)
        end
    end

    --local lv = self.CurHero.skillLevel
    --if self.CurHero:CheckHeroEquipIsMax() then
    --    lv = lv + 1
    --end
end
function M:ShowRoleSkillPreview()
    self.RoleSkillPreview().gameObject:SetActive(true)
    self.RoleSkillDetailPanel().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        self.RoleSkillPreview().gameObject:SetActive(false)
        self.RoleSkillDetailPanel().gameObject:SetActive(true)
    end)
    ---不同技能等级的同一个技能列表
    self.RoleSkillPreviewList = {}
    for i,v in ipairs(self.CurLoopList) do
        if self.skillIndex == 1 then
            self.RoleSkillPreviewList[i] = v.Skill_1_example
        elseif self.skillIndex == 2 then
            self.RoleSkillPreviewList[i] = v.Skill_2_example
        elseif self.skillIndex == 3 then
            self.RoleSkillPreviewList[i] = v.Skill_3_example
        elseif self.skillIndex == 4 then
            self.RoleSkillPreviewList[i] = v.Skill_4_example
        elseif self.skillIndex == 5 then
            self.RoleSkillPreviewList[i] = v.Skill_5_example
        end
    end
    if self.showSkillLevel then                             --传入的技能等级

    else
        self.showSkillLevel = self.CurHero.skillLevel       --RoleSkillPreview显示的技能等级
    end
    --self.showSkillLevel = self.CurHero.skillLevel
    if self.showSkillLevel == 10 then
        self.showSkillLevel = self.showSkillLevel - 1
    end
    local showSkill1 = self.RoleSkillPreviewList[self.showSkillLevel + 1]
    local showSkill2 = self.RoleSkillPreviewList[self.showSkillLevel + 2]
    ---显示
    self:ShowSkillsInRoleSkillPreview(showSkill1,showSkill2)
    ---注册左右两个切换按钮
    UIEvent.LuaClick(self.Btn_Zuo01().gameObject,function()
        self.Btn_You01().gameObject:SetActive(true)
        self.showSkillLevel = self.showSkillLevel - 1
        if self.showSkillLevel <= 0 then
            self.showSkillLevel = 0
            self.Btn_Zuo01().gameObject:SetActive(false)
        end
        local skill1 = self.RoleSkillPreviewList[self.showSkillLevel + 1]
        local skill2 = self.RoleSkillPreviewList[self.showSkillLevel + 2]
        self:ShowSkillsInRoleSkillPreview(skill1,skill2)
    end)
    UIEvent.LuaClick(self.Btn_You01().gameObject,function()
        self.Btn_Zuo01().gameObject:SetActive(true)
        self.showSkillLevel = self.showSkillLevel + 1
        if self.showSkillLevel >= 9 then
            self.showSkillLevel = 9
            self.Btn_You01().gameObject:SetActive(false)
        end
        local skill1 = self.RoleSkillPreviewList[self.showSkillLevel + 1]
        local skill2 = self.RoleSkillPreviewList[self.showSkillLevel + 2]
        self:ShowSkillsInRoleSkillPreview(skill1,skill2)
    end)
end
---显示两个技能
function M:ShowSkillsInRoleSkillPreview(skill1,skill2)
    local images = {
        self.RoleCombineSkill1(),
        self.RoleCombineSkill2(),
        self.RoleCombineSkill3(),
        self.RoleCombineSkill4(),
    }
    local kuang = {
        self.XuanZhong_TX_1(),
        self.XuanZhong_TX_2(),
        self.XuanZhong_TX_3(),
        self.XuanZhong_TX_4(),
    }
    local tBtnList = {}
    self.mSkillUp1 = skill1
    self.mSkillUp2 = skill2
    if self.mSelectObj_SkillUp == nil then
        for i = 1, #skill1 do
            ---初始化技能图片
            MgrRes.LoadSprite(images[i],"Skill/"..skill1[i].Icon)
        end
        
        self.mSelectObj_SkillUp = kuang[1]
        for i = 1, #kuang do
            if i > 1 then
                kuang[i].gameObject:SetActive(false)
            end
            ---初始化图片按钮
            UIEvent.LuaClick(images[i].gameObject,function()
                if self.mSelectObj_SkillUp == kuang[i] then
                    return
                end
                self.mSelectObj_SkillUp.gameObject:SetActive(false)
                self.mSelectObj_SkillUp = kuang[i]
                self.mSelectObj_SkillUp.gameObject:SetActive(true)
                
                self:ClickSkillImage2(self.mSkillUp1[i],self.mSkillUp2[i])
            end)
        end
    else
        if self.mSelectObj_SkillUp ~= kuang[1] then
            self.mSelectObj_SkillUp.gameObject:SetActive(false)
            self.mSelectObj_SkillUp = kuang[1]
            self.mSelectObj_SkillUp.gameObject:SetActive(true)
        end

        if #tBtnList == 0 then
            for i = 1, #images do
                tBtnList[i] = self.RoleDetailLayoutRoot().transform:Find("RoleCombineSkill" .. i):GetComponent("Button")
            end
        end
        ---更新技能图片
        local n = 1
        for i = 1, #skill1 do
            MgrRes.LoadSprite(images[i],"Skill/"..skill1[i].Icon)
            tBtnList[i].enabled = true
            n = n + 1
        end
        for i = n, #images do
            MgrRes.LoadSprite(images[i],"Skill/icon_skill_empty")
            tBtnList[i].enabled = false
        end
    end
    
    ---显示
    self.RoleSkillPanel1().transform:Find("SkillNameText"):GetComponent("TextMeshProUGUI").text = skill1[1].Name
    self.RoleSkillPanel1().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.showSkillLevel
    self.RoleSkillPanel1().transform:Find("Leixing1").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType1[skill1[1].Skilltype1]
    self.RoleSkillPanel1().transform:Find("Leixing2").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType2[skill1[1].Skilltype2 + 1]
    self.RoleSkillPanel1().transform:Find("Jinengshuoming").transform:Find("SkillDesTxt"):GetComponent("TextMeshProUGUI").text = skill1[1].Explain
    self:ReadException2(skill1[1])
    self.RoleSkillPanel2().transform:Find("SkillNameText"):GetComponent("TextMeshProUGUI").text = skill2[1].Name
    self.RoleSkillPanel2().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.showSkillLevel + 1
    self.RoleSkillPanel2().transform:Find("Leixing1").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType1[skill2[1].Skilltype1]
    self.RoleSkillPanel2().transform:Find("Leixing2").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType2[skill2[1].Skilltype2 + 1]
    self.RoleSkillPanel2().transform:Find("Jinengshuoming").transform:Find("SkillDesTxt"):GetComponent("TextMeshProUGUI").text = skill2[1].Explain
    self:ReadException2(skill2[1])
end
---点击技能刷新
function M:ClickSkillImage2(skillData1,skillData2)
    self.RoleSkillPanel1().transform:Find("SkillNameText"):GetComponent("TextMeshProUGUI").text = skillData1.Name
    self.RoleSkillPanel1().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.showSkillLevel
    self.RoleSkillPanel1().transform:Find("Leixing1").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType1[skillData1.Skilltype1]
    self.RoleSkillPanel1().transform:Find("Leixing2").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType2[skillData1.Skilltype2 + 1]
    self.RoleSkillPanel1().transform:Find("Jinengshuoming").transform:Find("SkillDesTxt"):GetComponent("TextMeshProUGUI").text = skillData1.Explain
    self:ReadException2(skillData1)
    self.RoleSkillPanel2().transform:Find("SkillNameText"):GetComponent("TextMeshProUGUI").text = skillData2.Name
    self.RoleSkillPanel2().transform:Find("SkillRankText1"):GetComponent("TextMeshProUGUI").text = self.showSkillLevel + 1
    self.RoleSkillPanel2().transform:Find("Leixing1").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType1[skillData2.Skilltype1]
    self.RoleSkillPanel2().transform:Find("Leixing2").transform:Find("SkillTypeTxt"):GetComponent("TextMeshProUGUI").text = self.skillType2[skillData2.Skilltype2 + 1]
    self.RoleSkillPanel2().transform:Find("Jinengshuoming").transform:Find("SkillDesTxt"):GetComponent("TextMeshProUGUI").text = skillData2.Explain
    self:ReadException2(skillData2)
end
---读取例外事项2
function M:ReadException2(skill)
    local exception = string.split(skill.Exception,"@")
    local text = ""
    self.SkillTipTxt().text = ""
    self.TipPanelImg().gameObject:SetActive(true)
    for i = 1, #exception do
        if tonumber(exception[i]) == 0 then
            self.TipPanelImg().gameObject:SetActive(false)
            break
        end
        text = text .. string.split(TxtLocalData.tab[180004][tonumber(exception[i]) + 4],"_")[2] .. "\n"
    end
    self.SkillTipTxt().text = text
end

------------------原界面代码----------------------
--function M:OnInit()
--    self.index = 0
--    self.Int_FuncIndex = 0 --当前人物等级按钮升降
--    self.IsEndLoopToInput =false --循环点击检测是否终止Flag
--    self.Int_LoopTimer = 0 --循环检测计数器
--    self.Int_HasClick = 0 --用于检测单击按钮后是否继续长按
--    self:InitRoleInfo()
--    self.TipPanel().gameObject:SetActive(false)
--    self:RegisterLoopScroll()
--end
---注册滑块
function M:RegisterLoopScroll()
    --self.RoleSkillPreviewScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self,idx})
end
---设置滑动数据
function M:ReloadData(offset,isScroll)
    ---设置Loop数量
    self.RoleSkillPreviewScroll01().totalCount = #self.CurLoopList
    if offset then
        if isScroll then
            self.RoleSkillPreviewScroll01():ScrollToCell(offset, 3500)
        else
            self.RoleSkillPreviewScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
        end
    else
        self.RoleSkillPreviewScroll01():RefreshCells()              ---只刷新数据
    end
end
---执行初始化人物Panel相关方法
function M:InitRoleInfo()
    UIEvent.LuaClick(self.ClickBackArea().gameObject,Handle(self, self.OnClickBackRole))
    UIEvent.LuaClick(self.ClickBackArea01().gameObject,Handle(self, self.OnClickBackRole))
    UIEvent.LuaClick(self.ClickBackArea02().gameObject,Handle(self, self.DetialSkillBack))
    --绑定点击事件
    UIEvent.LuaClick(self.Btn_SkillDetailTip().gameObject,Handle(self, function ()
        Tools.ObjSetActive(self.TipPanel().gameObject)
    end))
    UIEvent.LuaClick(self.Btn_SkillDetailTip01().gameObject,Handle(self, function ()
        Tools.ObjSetActive(self.TipPanel01().gameObject)
    end))
    self:InitRoleUpgradeBtnEvent()
end

function M:DetialSkillBack()
    if self.index == 1 then
        self.RoleSkillPreview().gameObject:SetActive(true)
        self.RoleInfoPreview().gameObject:SetActive(false)
        self.RoleSkillDetailPanel().gameObject:SetActive(false)
        self.index = 0
    else
        MgrUI.ClosePop(UID.RolePreview_UI)
    end
end

---初始化人物信息界面
function M:InitRoleInfoPanel(hero)
    self.LocalPreviewLv=hero.LV
    if hero.Occupation == 4 then
        self.ZhiYuanSlider().value = hero.RealSuppart
        self.ZhiYuanIcon().gameObject:SetActive(true)
        self.AtkIcon().gameObject:SetActive(false)
    else
        self.ZhiYuanIcon().gameObject:SetActive(false)
        self.AtkIcon().gameObject:SetActive(true)
    end
    --星级信息更新
    if hero.StartLV > 1 then
        -- statements
        Tools.ClearAllChild(self.PreviewStarPanel().gameObject)
        if hero.IsAwaken == true then
            -- statements
            for i = 1,hero.StartLV, 1 do
                self:CreatStar(self.PreviewStarPanel().gameObject,self.StarJueXingPrefab().gameObject)
            end
        else
            for i = 1,hero.StartLV, 1 do
                self:CreatStar(self.PreviewStarPanel().gameObject,self.StarPrefab().gameObject)
            end

        end
    end
    self.StarJueXingPrefab().gameObject:SetActive(false)
    self.StarPrefab().gameObject:SetActive(false)
    --角色信息更新
    self.RoleLvText().text= ""..math.floor(hero.LV)
    self.RoleLvMaxText().text= "/"..math.floor(hero.LvMax)
    ---如果星级更改后当前等级大于等级上限
    if hero.LV > hero.LvMax then
        self.RoleLvText().text= ""..math.floor(hero.LvMax)
    end
    if tonumber(hero.HP) >= 1000000 then
        self.HPInfoTxt().text = (self.GetMillionNumInfo(hero.HP)).."M"
    else
        self.HPInfoTxt().text = math.floor(hero.HP)
    end
    ---角色属性信息
    self.AtkInfoTxt().text= ""..math.floor(hero.RealAtk)
    self.ZhiYuanInfoTxt().text="".. math.floor(self:GetInfoCorrect(hero.RealSuppart)).."%"
    self.ZhiYuanSlider().value = hero.RealSuppart
    self.DefInfoTxt().text ="".. math.floor(self:GetInfoCorrect(hero.RealDef)).."%"

    self.MinjieInfoTxt():GetComponent("TextMeshProUGUI").text = ""..math.floor(self:GetInfoCorrect(hero.RealAgile)).."%"
    self.BaojiInfoTxt():GetComponent("TextMeshProUGUI").text =  ""..math.floor(self:GetInfoCorrect(hero.RealCrit)).."%"
    self.BaoshangInfoTxt():GetComponent("TextMeshProUGUI").text ="".. math.floor(self:GetInfoCorrect(hero.RealCritDmg)).."%"
    self.DefenceSlider().value = hero.RealDef
    self.BaojiSlider().value = hero.RealCrit
    self.BaoshangSlider().value = hero.RealCritDmg
    self.MinjieSlider().value = hero.RealAgile
    --
    if hero.LV < hero.LvMax then
        self:SwitchBtnState(1)
    else
        self:SwitchBtnState(2)
    end
    if hero.LV > 1 then
        self:SwitchBtnState(3)
    else
        self:SwitchBtnState(4)
    end
    if hero.StartLV >= 6 and hero.IsAwaken == true then
        -- statements
        self:SwitchBtnState(6)
    else
        self:SwitchBtnState(5)
    end
    if hero.StartLV > hero.MinStart then
        self:SwitchBtnState(7)
    else
        self:SwitchBtnState(8)
    end
end
---初始化技能界面
--function M:InitNomalSkillPanel()
--    local MaxSkillLv = self.CurBattleRole.SkillMaxLV
--    self.CurLoopList = {}
--    for i = 0, MaxSkillLv+1, 1 do
--        local attr = ReadData.GetRoleAttr(self.RoleID,self.LocalPreviewLv,self.Star,i,self.CurRoleIsWake)
--        table.insert(self.CurLoopList,attr)
--    end
--    local lv = self.CurHero.skillLevel
--    --if self.CurHero:CheckEquipIsMax() then
--    if self.CurHero:CheckHeroEquipIsMax() then
--        lv = lv + 1
--    end
--    self:ReloadData(lv,true)
--end

---初始化技能描述界面
function M:InitRoleSkillPreviewPanel(_skill)

    self.TipPanel().gameObject:SetActive(false)
   -- 技能等级以及技能名称、说明
    self.Tab_SkillCD={}
    self.Tab_SkillTim ={}
    self.Tab_SkillType={}
    self.Tab_SkillTrigger={}
    self.Tab_SkillTarget={}
    self.Tab_SkillTip = {}
    self:InitSkillDesTxt()
---判断每个技能格子中是否有技能
    if _skill[1] ~= nil then
        MgrRes.LoadSprite(self.RoleCombineSkill1(),"Skill/".._skill[1].Icon)
        self.XuanZhong_TX_1().gameObject:SetActive(true)
        self.XuanZhong_TX_2().gameObject:SetActive(false)
        self.XuanZhong_TX_3().gameObject:SetActive(false)
        self.XuanZhong_TX_4().gameObject:SetActive(false)
        self:UpdataSkillitem(_skill[1])
        UIEvent.LuaClick(self.RoleCombineSkill1().gameObject,Handle(self, function ()
            -- statements
            self:UpdataSkillitem(_skill[1])
            self.XuanZhong_TX_1().gameObject:SetActive(true)
            self.XuanZhong_TX_2().gameObject:SetActive(false)
            self.XuanZhong_TX_3().gameObject:SetActive(false)
            self.XuanZhong_TX_4().gameObject:SetActive(false)
        end))
    else
        MgrRes.LoadSprite(self.RoleCombineSkill1(),"Skill/".."icon_skill_empty")
    end
    if _skill[2] ~= nil then
        MgrRes.LoadSprite(self.RoleCombineSkill2(),"Skill/".._skill[2].Icon)
        UIEvent.LuaClick(self.RoleCombineSkill2().gameObject,Handle(self, function ()
            -- statements
            self:UpdataSkillitem(_skill[2])
            self.XuanZhong_TX_1().gameObject:SetActive(false)
            self.XuanZhong_TX_2().gameObject:SetActive(true)
            self.XuanZhong_TX_3().gameObject:SetActive(false)
            self.XuanZhong_TX_4().gameObject:SetActive(false)
        end))
    else
        MgrRes.LoadSprite(self.RoleCombineSkill2(),"Skill/".."icon_skill_empty")
    end
    if _skill[3] ~= nil then
        MgrRes.LoadSprite(self.RoleCombineSkill3(),"Skill/".._skill[3].Icon)
        UIEvent.LuaClick(self.RoleCombineSkill3().gameObject,Handle(self, function ()
            -- statements
            self:UpdataSkillitem(_skill[3])
            self.XuanZhong_TX_1().gameObject:SetActive(false)
            self.XuanZhong_TX_2().gameObject:SetActive(false)
            self.XuanZhong_TX_3().gameObject:SetActive(true)
            self.XuanZhong_TX_4().gameObject:SetActive(false)
        end))
    else
        MgrRes.LoadSprite(self.RoleCombineSkill3(),"Skill/".."icon_skill_empty")
    end
    if _skill[4] ~= nil then
        MgrRes.LoadSprite(self.RoleCombineSkill4(),"Skill/".._skill[4].Icon)
        UIEvent.LuaClick(self.RoleCombineSkill4().gameObject,Handle(self, function ()
            -- statements
            self:UpdataSkillitem(_skill[4])
            self.XuanZhong_TX_1().gameObject:SetActive(false)
            self.XuanZhong_TX_2().gameObject:SetActive(false)
            self.XuanZhong_TX_3().gameObject:SetActive(false)
            self.XuanZhong_TX_4().gameObject:SetActive(true)
        end))
    else
        MgrRes.LoadSprite(self.RoleCombineSkill4(),"Skill/".."icon_skill_empty")
    end
end
---更新技能
function M:UpdataSkillitem(skillitem)
    local name = nil
    local explain = nil
    local skilltype = nil
    local skillTrigger = nil
    local skillTarget = nil
    local Exception = nil
    local _showtime= nil
    local _IsFirst=true
    local _SkillTipText = nil

    name = skillitem.Name
    explain = skillitem.Explain
    skilltype = self.Tab_SkillType[skillitem.Skilltype2 + 1]
    skillTrigger = self:GetSkillTriggerByKey(skillitem.Opportunity)
    skillTarget = self.Tab_SkillTarget[skillitem.Object]
    Exception = skillitem.Exception
    _showtime = skillitem.Time



    if skillitem.Exskill == 1 then
        self.SkillNameText().text = name .. "    " .. "<size=36>(冷却时间 <color=#E4AA3B>".. skillitem.CdRound .. "</color>轮)</size>"       --如果为EX技能，名字后面加上CD时间
    else
        self.SkillNameText().text = name
    end
    self.SkillTypeTxt().text = skilltype
    self.SkillTriggerTxt().text = skillTrigger
    self.SkillTargetTxt().text = skillTarget
    self.SkillDesTxt().text = explain

    local TipTab =JNStrTool.strSplit("@", Exception)
    for i, v in pairs(TipTab) do
        if tonumber(v) == 0 then
            -- 如果是0类型不读，则隐藏例外事项按钮
            self.Btn_SkillDetailTip().gameObject:SetActive(false)
        else
            self.Btn_SkillDetailTip().gameObject:SetActive(true)
        end
        if _IsFirst == true then
            -- statements
            _SkillTipText=""..self.Tab_SkillTip[tonumber(v)]
            _IsFirst=false
        else
            _SkillTipText=_SkillTipText.."\n"..self.Tab_SkillTip[tonumber(v)]
        end
    end
    self.SkillTipTxt().text=_SkillTipText
    if _showtime == -1 then
        self.SkillTimeTxt().text=MgrLanguageData.GetLanguageByKey("skills_buffduration_type1")
    elseif _showtime == 0 then
        self.SkillTimeTxt().text=MgrLanguageData.GetLanguageByKey("skills_buffduration_type2")
    elseif _showtime > 0 then
        self.SkillTimeTxt().text="".._showtime..MgrLanguageData.GetLanguageByKey("skills_buffduration_type3")
    end
end
---获取对应的触发时间文本
function M:GetSkillTriggerByKey(_Opportunity)
    -- statements
    local _TabIndex = tonumber(_Opportunity) --当前时间文本下标
    if tonumber(_Opportunity) >= 100 then
        _TabIndex = _TabIndex - 100
    end
    return self.Tab_SkillTrigger[_TabIndex]
end
---更新技能描述文本
function M:InitSkillDesTxt()
    ---初始化技能类型文本表
    for key, value in pairs(TxtLocalData.tab[180000]) do
        if key ~= 1 and key ~= 2 and key ~= 3 then
            -- statements
            local tempTab = JNStrTool.strSplit("_", value)
            table.insert(self.Tab_SkillType,tempTab[2])
        end
    end
    ---初始化触发时间文本表
    for key, value in pairs(TxtLocalData.tab[180001]) do
        -- statements
        if key ~= 1 and key ~= 2 and key ~= 3 then
            -- statements
            local tempTab = JNStrTool.strSplit("_", value)
            table.insert(self.Tab_SkillTrigger,tempTab[2])
        end
    end
    ---初始化技能目标文本表
    for key, value in pairs(TxtLocalData.tab[180002]) do
        -- statements
        if key ~= 1 and key ~= 2 and key ~= 3 then
            -- statements
            local tempTab = JNStrTool.strSplit("_", value)
            table.insert(self.Tab_SkillTarget,tempTab[2])
        end
    end
    ---初始化持续时间文本表
    for key, value in pairs(TxtLocalData.tab[180003]) do
        -- statements
        if key == 4 and key == 5 and key == 6 then
            -- statements
            local tempTab = JNStrTool.strSplit("_", value)
            table.insert(self.Tab_SkillTim,tempTab[2])
        end
    end

    ---初始化例外事项文本表
    for key, value in pairs(TxtLocalData.tab[180004]) do
        if key >= 4 and value ~= "0" then
            -- 前三列不读
            local _TempInfoTab=JNStrTool.strSplit("_", value)
            --将对应位置赋值
            if tonumber(_TempInfoTab[1]) ~= 0 then
                -- statements
                self.Tab_SkillTip[tonumber(_TempInfoTab[1])]=_TempInfoTab[2]
            else
                self.Tab_SkillTip[tonumber(_TempInfoTab[1])]=""
            end
        end
    end
end


--返回养成界面
function M.OnClickBackRole()
    MgrUI.ClosePop(UID.RolePreview_UI)
end
--创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=CJNUIMgr.CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
--切换按钮高光低光
function M:SwitchBtnState(_BtnType)
    -- statements
    if _BtnType == 1 then
        -- 显示高光等级提升按钮
        self.BtnMaxLV_Txt().text= MgrLanguageData.GetLanguageByKey("ui_levelmax_text")
        Tools.ObjSetLastSibling(self.Btn_LvUpHighLight().gameObject)
    elseif _BtnType == 2 then
        -- 显示低光光等级提升按钮
        self.BtnMaxLV_Txt().text="<color=#A8A8A8>Max</color>"
        self.Int_FuncIndex = 0
        self.Int_LoopTimer=0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        Tools.ObjSetLastSibling(self.Btn_LvUp().gameObject)
    elseif _BtnType == 3 then
        -- 显示高光等级减少按钮
        self.BtnMinLV_Txt().text="Min"
        Tools.ObjSetLastSibling(self.Btn_LvDownHighLight().gameObject)
    elseif _BtnType == 4 then
        -- 显示低光等级减少按钮
        self.BtnMinLV_Txt().text="<color=#A8A8A8>Min</color>"
        self.Int_FuncIndex = 0
        self.Int_LoopTimer=0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        Tools.ObjSetLastSibling(self.Btn_LvDown().gameObject)
    elseif _BtnType == 5 then
        -- statements
        Tools.ObjSetLastSibling(self.Btn_StarUpHighLight().gameObject)
    elseif _BtnType == 6 then
        -- statements
        Tools.ObjSetLastSibling(self.Btn_StarUp().gameObject)
    elseif _BtnType == 7 then
        -- statements
        Tools.ObjSetLastSibling(self.Btn_StarDownHighLight().gameObject)
    elseif _BtnType == 8 then
        -- statements
        Tools.ObjSetLastSibling(self.Btn_StarDown().gameObject)
    end
end
---得到百万级数据的除以100W后精度到小数点后两位的值输出
function M.GetMillionNumInfo(_InputInfo)
    local _tempRateNum = _InputInfo/10000
    local _OutInfo = math.floor(_tempRateNum)/100
    return _OutInfo
end
--取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 =0
    local tempInt2 =0
    local tempData=0
    tempInt1,tempInt2=math.modf((_Data*1000)/1)
    tempData=tempInt1/10
    return tempData
end
--人物预览升降级按钮事件绑定
function M:InitRoleUpgradeBtnEvent()
    -- statements
    UIEvent.LuaClick(self.Btn_MaxLv().gameObject,Handle(self,self.OnClickMaxLv))
    UIEvent.LuaClick(self.Btn_MinLv().gameObject,Handle(self,self.OnClickMinLv))
    UIEvent.LuaPressClick(self.Btn_LvUpHighLight().gameObject,Handle(self, function ()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickLVBtn(true,self.CurBattleRole,self.LocalPreviewLv)
        self.Int_HasClick = 1
        MgrTimer.AddDelayNoName(1,Handle(self, self.IsLoopClick),nil)
        self.Int_FuncIndex=0
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
    UIEvent.LuaPressClick(self.Btn_LvDownHighLight().gameObject,Handle(self, function ()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickLVBtn(false,self.CurBattleRole,self.LocalPreviewLv)
        self.Int_HasClick = 1
        MgrTimer.AddDelayNoName(1,Handle(self, self.IsLoopClick),nil)
        self.Int_FuncIndex=1
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
    UIEvent.LuaClick(self.Btn_StarUpHighLight().gameObject,Handle(self, function ()
        -- statements
        self:OnClickStarBtn(true,self.CurBattleRole,self.Star)
    end))
    UIEvent.LuaClick(self.Btn_StarDownHighLight().gameObject,Handle(self, function ()
        -- statements
        self:OnClickStarBtn(false,self.CurBattleRole,self.Star)
    end))
end
--点击Max按钮
function M:OnClickMaxLv()
    -- statements
    self.CurBattleRole.LV=self.CurBattleRole.LvMax
    self:CreatBattleRoleNoSkill(self.RoleID,self.CurBattleRole.LV,self.Star)
    self:SwitchBtnState(2)
    self:InitRoleInfoPanel(self.CurBattleRole)
end
--点击Min按钮
function M:OnClickMinLv()
    -- statements
    self.CurBattleRole.LV=1
    self:CreatBattleRoleNoSkill(self.RoleID,self.CurBattleRole.LV,self.Star)
    self:SwitchBtnState(4)
    self:InitRoleInfoPanel(self.CurBattleRole)
end
--点击升级按钮
function M:OnClickLVBtn(_IsPlus,_tempRoleLV,_tempPreviewLv)
    if _tempPreviewLv > _tempRoleLV.LvMax then
        -- statements
        _tempPreviewLv=_tempRoleLV.LvMax
    elseif _tempPreviewLv < 1 then
        -- statements
        _tempPreviewLv = 1
    end

    if _IsPlus == true then
        -- statements
        if _tempPreviewLv < _tempRoleLV.LvMax then
            -- statements
            _tempPreviewLv = _tempPreviewLv +1
        else
            _tempPreviewLv = _tempPreviewLv
        end
    else
        if _tempPreviewLv > 1 then
            -- statements
            _tempPreviewLv = _tempPreviewLv - 1
        else
            _tempPreviewLv = _tempPreviewLv
        end
    end
    self:CreatBattleRoleNoSkill(self.RoleID,_tempPreviewLv,self.Star)
    MgrSound.PlayEffect("yx_ui_shuzigundong_01",1,nil,false)
    self.LocalPreviewLv=self.CurBattleRole.LV
    self:InitRoleInfoPanel(self.CurBattleRole)
end
--点击升星按钮
function M:OnClickStarBtn(_IsPlus,_tempRoleStar,_tempPreviewStar)
    -- statements
    local Int_rank=_tempRoleStar.Rank
    local Rank_Min=_tempRoleStar.MinStart
    local Rank_Juxing =_tempRoleStar.awakenStar
    local Rank_Max= 6
    local Rank_IsAwaken=_tempRoleStar.IsAwaken
    -- print("最小星级为"..Rank_Min.."觉醒星级为"..Rank_Juxing.."最大星级为"..Rank_Max)
    -- 判断对应品阶的星级阈值
    if  _tempPreviewStar < Rank_Min then
        -- statements
        _tempPreviewStar=Rank_Min

    elseif _tempPreviewStar > Rank_Max then
        -- statements
        _tempPreviewStar=Rank_Max
    end
    if Rank_IsAwaken == false then
        -- statements
        if _tempPreviewStar >= Rank_Juxing then
            -- statements
            _tempPreviewStar = Rank_Juxing
        end
    else
        if _tempPreviewStar <= Rank_Juxing then
            -- statements
            _tempPreviewStar = Rank_Juxing
        end
    end
    --通过上面的星级阈值检测后开始判断对应点击增加或者减少星级后的阈值
    -- 判断增加减少后星级阈值
    if _IsPlus == true then
        if Rank_IsAwaken == false then
            -- 如果未觉醒，当前星级小于觉醒星级则可以点击增加一颗星
            if _tempPreviewStar < Rank_Juxing   then
                -- statements
                _tempPreviewStar= _tempPreviewStar+1
            else
                _tempPreviewStar = _tempPreviewStar
                Rank_IsAwaken = true
            end
        else
            if _tempPreviewStar < Rank_Max then
                -- statements
                _tempPreviewStar = _tempPreviewStar+1
            else
                _tempPreviewStar = _tempPreviewStar
            end
        end
    else
        if Rank_IsAwaken == false then
            -- 如果未觉醒，当前星级大于最小星级可以减一星
            if _tempPreviewStar > Rank_Min   then
                -- statements
                _tempPreviewStar= _tempPreviewStar-1
            else
                _tempPreviewStar = _tempPreviewStar
            end
        else
            if _tempPreviewStar > Rank_Juxing then
                -- statements
                _tempPreviewStar = _tempPreviewStar - 1
            else
                _tempPreviewStar = _tempPreviewStar
                Rank_IsAwaken = false
            end
        end
    end
    self.CurBattleRole.IsAwaken=Rank_IsAwaken
    self.Star = _tempPreviewStar
    MgrSound.PlayEffect("yx_ui_shuzigundong_01",1,nil,false)
    self:CreatBattleRoleNoSkill(self.RoleID,self.LocalPreviewLv,self.Star)
    self:InitRoleInfoPanel(self.CurBattleRole)
end

function M:IsLoopClick()
    -- statements
    if UIEvent.GetButton_Up() == false  then
        self.Int_HasClick = 0
    end
end
--循环检测按下事件并执行
function M:LoopInput()
    -- statements
    print("??????")
    if self.IsEndLoopToInput == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05,Handle(self,self.LoopInput),nil)
        self.Int_HasClick = 1
        self.Int_LoopTimer = self.Int_LoopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.Int_LoopTimer > 5 then
            self:LoopFuncSwitch()
        end
        if bool_IsUp == false then
            -- statements
            self.Int_LoopTimer=0
            self.Int_HasClick = 0
            self.IsEndLoopToInput = true
            print("跳出循环...........................")
        end
    end
end
--循环检测长按按钮方法
function M:LoopFuncSwitch()
    if self.Int_FuncIndex == 0 then
        -- 升级点击事件
        self:OnClickLVBtn(true,self.CurBattleRole,self.LocalPreviewLv)
    elseif self.Int_FuncIndex == 1 then
        -- 降级点击事件
        self:OnClickLVBtn(false,self.CurBattleRole,self.LocalPreviewLv)
    end
end
--创建一个不带技能BattleRole角色对象
function M:CreatBattleRoleNoSkill(_Id,_Lv,_Star)
    self.CurBattleRole = ReadData.GetRoleAttr(_Id,_Lv,_Star,0,self.CurBattleRole.IsAwaken)
    self.LocalPreviewLv= self.CurBattleRole.LV
end
--创建一个物体
function M.CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end

--function M:OnShow(data)
--    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
--    if data[1] then
--        self.CurRoleIsWake = data[1].awaken --是否觉醒
--        self.RoleID = data[1].id
--        self.Star = data[1].star
--        self.LocalPreviewLv= data[1].level
--        self.CurBattleRole = data[1]:GetHeroAttr()
--    end
--    ---@type RoleData
--    self.CurHero = data[1]
--    self.PanelIndex = data[2]
--    self.Skill = data[3]
--    if self.PanelIndex == 1 then
--        -- 人物信息界面
--        self.RoleInfoPreview().gameObject:SetActive(true)
--        self.RoleSkillPreview().gameObject:SetActive(false)
--        self.RoleSkillDetailPanel().gameObject:SetActive(false)
--        self:InitRoleInfoPanel(self.CurBattleRole)
--    elseif self.PanelIndex == 2 then
--        -- 技能预览界面
--        self.RoleSkillPreview().gameObject:SetActive(true)
--        self.RoleInfoPreview().gameObject:SetActive(false)
--        self.RoleSkillDetailPanel().gameObject:SetActive(false)
--        self:InitNomalSkillPanel()
--    elseif self.PanelIndex == 3 then
--        -- 技能详情界面
--        self.RoleSkillDetailPanel().gameObject:SetActive(true)
--        self.RoleInfoPreview().gameObject:SetActive(false)
--        self.RoleSkillPreview().gameObject:SetActive(false)
--        self:InitRoleSkillPreviewPanel(self.Skill)
--    end
--end
return M