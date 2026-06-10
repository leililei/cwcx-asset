-- Code Auto Create Begin
local M = Class('NewRoleFormation_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewRoleFormation_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewRoleFormation_UI].prefab'
    self.Name = 'Form[NewRoleFormation_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NomalBg','NomalBg',2},{'Img_xian','Img_xian',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu','UpperBtnPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UpperBtnPanel/ReturnBg/Btn_Back',2},{'RoleLvUpPanel','RoleLvUpPanel',2},{'Lv_Star','RoleLvUpPanel/RoleLevelPanel/Lv_Star',2},{'Lv_StarAwaken','RoleLvUpPanel/RoleLevelPanel/Lv_StarAwaken',2},{'Lv_StarPanel','RoleLvUpPanel/RoleLevelPanel/Lv_StarPanel',2},{'Jingyantiao','RoleLvUpPanel/RoleLevelPanel/Jingyantiao',2},{'Img_PreviewExpSlider','RoleLvUpPanel/RoleLevelPanel/Jingyantiao/Img_PreviewExpSlider',2},{'Img_CurExpSlider','RoleLvUpPanel/RoleLevelPanel/Jingyantiao/Img_CurExpSlider',2},{'jiantou1','RoleLvUpPanel/RoleLevelPanel/jiantou1',2},{'HpPanel','RoleLvUpPanel/LvUpInfoPreviewPanel/HpPanel',2},{'HpIcon','RoleLvUpPanel/LvUpInfoPreviewPanel/HpPanel/HpIcon',2},{'jiantou2','RoleLvUpPanel/LvUpInfoPreviewPanel/HpPanel/jiantou2',2},{'AtkPanel','RoleLvUpPanel/LvUpInfoPreviewPanel/AtkPanel',2},{'ZhiYuanIcon','RoleLvUpPanel/LvUpInfoPreviewPanel/AtkPanel/ZhiYuanIcon',2},{'AtkIcon','RoleLvUpPanel/LvUpInfoPreviewPanel/AtkPanel/AtkIcon',2},{'jiantou3','RoleLvUpPanel/LvUpInfoPreviewPanel/AtkPanel/jiantou3',2},{'Panel_UpgradeNeed','RoleLvUpPanel/Panel_UpgradeNeed',2},{'Img_Daojudi','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Img_Daojudi',2},{'Upitem1','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1',2},{'RewardRankImg','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/RewardRankImg',2},{'RewardIconImg','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/RewardIconImg',2},{'StarPanel','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel',2},{'ItemStarPrefab','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel/ItemStarPrefab',2},{'HighLight','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_ItemCountBg',2},{'Img_SelectBg','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_SelectBg',2},{'Img_Jiaobiao1','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_Jiaobiao1',2},{'Upitem2','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2',2},{'RewardRankImg01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/RewardRankImg',2},{'RewardIconImg01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/RewardIconImg',2},{'StarPanel01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel',2},{'ItemStarPrefab01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel/ItemStarPrefab',2},{'HighLight01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_ItemCountBg',2},{'Img_SelectBg01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_SelectBg',2},{'Img_Jiaobiao101','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_Jiaobiao1',2},{'Upitem3','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3',2},{'RewardRankImg02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/RewardRankImg',2},{'RewardIconImg02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/RewardIconImg',2},{'StarPanel02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel',2},{'ItemStarPrefab02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel/ItemStarPrefab',2},{'HighLight02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_ItemCountBg',2},{'Img_SelectBg02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_SelectBg',2},{'Img_Jiaobiao102','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_Jiaobiao1',2},{'Img_Shiyongshuliangdi','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Img_Shiyongshuliangdi',2},{'Lvmaxdi','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Lvmaxdi',2},{'Btn_MaxLv','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Lvmaxdi/Btn_MaxLv',2},{'lvmindi','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/lvmindi',2},{'Btn_MinLv','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/lvmindi/Btn_MinLv',2},{'Btn_LvDown','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvDown',2},{'-(hui)2','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvDown/-(hui)2',2},{'Btn_LvDownLight','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvDownLight',2},{'-(hei)2','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvDownLight/-(hei)2',2},{'Btn_LvUp','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvUp',2},{'+(hui)2','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvUp/+(hui)2',2},{'Btn_LvUpLight','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvUpLight',2},{'+(hei)2','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Btn_LvUpLight/+(hei)2',2},{'Xiaohao','RoleLvUpPanel/Panel_UpgradeNeed/Xiaohao',2},{'Img_GoldNeedIcon','RoleLvUpPanel/Panel_UpgradeNeed/Xiaohao/Img_GoldNeedIcon',2},{'Img_CountBg','RoleLvUpPanel/Panel_UpgradeNeed/Xiaohao/Img_CountBg',2},{'RoleStarUpgradePanel','RoleStarUpgradePanel',2},{'Star_Star','RoleStarUpgradePanel/RoleInfoPanel/Star_Star',2},{'Star_JueXingStar','RoleStarUpgradePanel/RoleInfoPanel/Star_JueXingStar',2},{'Star_StarPanel','RoleStarUpgradePanel/RoleInfoPanel/Star_StarPanel',2},{'jiantou201','RoleStarUpgradePanel/RoleInfoPanel/Lv/jiantou2',2},{'jiantou202','RoleStarUpgradePanel/RoleInfoPanel/Hp/jiantou2',2},{'jiantou203','RoleStarUpgradePanel/RoleInfoPanel/Atk/jiantou2',2},{'Star_CostItem','RoleStarUpgradePanel/Star_CostItem',2},{'RewardRankImg03','RoleStarUpgradePanel/Star_CostItem/RewardRankImg',2},{'RewardIconImg03','RoleStarUpgradePanel/Star_CostItem/RewardIconImg',2},{'StarPanel03','RoleStarUpgradePanel/Star_CostItem/StarPanel',2},{'ItemStarPrefab03','RoleStarUpgradePanel/Star_CostItem/StarPanel/ItemStarPrefab',2},{'HighLight03','RoleStarUpgradePanel/Star_CostItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot03','RoleStarUpgradePanel/Star_CostItem/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg03','RoleStarUpgradePanel/Star_CostItem/Img_ItemCountBg',2},{'Star_CostItemPanel','RoleStarUpgradePanel/Star_CostItemPanel',2},{'TupoSkillNamePanel','RoleStarUpgradePanel/TupoSkillNamePanel',2},{'TagPanel','RoleStarUpgradePanel/TupoSkillNamePanel/TagPanel',2},{'Img_Tag1','RoleStarUpgradePanel/TupoSkillNamePanel/TagPanel/Img_Tag1',2},{'Img_Tag2','RoleStarUpgradePanel/TupoSkillNamePanel/TagPanel/Img_Tag2',2},{'RoleJueXingPanel','RoleJueXingPanel',2},{'JX_StarPrefab','RoleJueXingPanel/JX_StarPrefab',2},{'JX_CurStarPanel','RoleJueXingPanel/JX_CurStarPanel',2},{'jiantou101','RoleJueXingPanel/jiantou1',2},{'JX_AwakenStar','RoleJueXingPanel/JX_AwakenStar',2},{'JX_AwakenStarPanel','RoleJueXingPanel/JX_AwakenStarPanel',2},{'HpPanel01','RoleJueXingPanel/LvUpInfoPreviewPanel/HpPanel',2},{'HpIcon01','RoleJueXingPanel/LvUpInfoPreviewPanel/HpPanel/HpIcon',2},{'jiantou204','RoleJueXingPanel/LvUpInfoPreviewPanel/HpPanel/jiantou2',2},{'AtkPanel01','RoleJueXingPanel/LvUpInfoPreviewPanel/AtkPanel',2},{'JXZhiYuanIcon','RoleJueXingPanel/LvUpInfoPreviewPanel/AtkPanel/JXZhiYuanIcon',2},{'JXAtkIcon','RoleJueXingPanel/LvUpInfoPreviewPanel/AtkPanel/JXAtkIcon',2},{'jiantou301','RoleJueXingPanel/LvUpInfoPreviewPanel/AtkPanel/jiantou3',2},{'SkillNamePanel','RoleJueXingPanel/SkillNamePanel',2},{'TagPanel01','RoleJueXingPanel/SkillNamePanel/TagPanel',2},{'Img_Tag101','RoleJueXingPanel/SkillNamePanel/TagPanel/Img_Tag1',2},{'Img_Tag201','RoleJueXingPanel/SkillNamePanel/TagPanel/Img_Tag2',2},{'JX_CostItem','RoleJueXingPanel/JX_CostItem',2},{'RewardRankImg04','RoleJueXingPanel/JX_CostItem/RewardRankImg',2},{'RewardIconImg04','RoleJueXingPanel/JX_CostItem/RewardIconImg',2},{'StarPanel04','RoleJueXingPanel/JX_CostItem/StarPanel',2},{'ItemStarPrefab04','RoleJueXingPanel/JX_CostItem/StarPanel/ItemStarPrefab',2},{'HighLight04','RoleJueXingPanel/JX_CostItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot04','RoleJueXingPanel/JX_CostItem/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg04','RoleJueXingPanel/JX_CostItem/Img_ItemCountBg',2},{'JX_CostItemPanel','RoleJueXingPanel/JX_CostItemPanel',2},{'Btn_Quxiao','Btn_Quxiao',2},{'Btn_Queding','Btn_Queding',2},{'SuccessPanel','SuccessPanel',2},{'Btn_SuccessBack','SuccessPanel/Btn_SuccessBack',2},{'BG','SuccessPanel/BG',2},{'Zhuangshixian(shang)','SuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','SuccessPanel/BG/zhuangshixian(yangcheng)',2},{'chenggongdi','SuccessPanel/chenggongdi',2},{'Img_Dian','SuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','SuccessPanel/FightResult/Img_Heidi',2},{'RoleLvUpSuccessPanel','SuccessPanel/RoleLvUpSuccessPanel',2},{'>','SuccessPanel/RoleLvUpSuccessPanel/item1/>',2},{'item2','SuccessPanel/RoleLvUpSuccessPanel/item2',2},{'Img_Shuxingicondi2','SuccessPanel/RoleLvUpSuccessPanel/item2/Img_Shuxingicondi2',2},{'icon1','SuccessPanel/RoleLvUpSuccessPanel/item2/Img_Shuxingicondi2/icon1',2},{'>01','SuccessPanel/RoleLvUpSuccessPanel/item2/>',2},{'item3','SuccessPanel/RoleLvUpSuccessPanel/item3',2},{'Img_Shuxingicondi201','SuccessPanel/RoleLvUpSuccessPanel/item3/Img_Shuxingicondi2',2},{'Lv_icon2','SuccessPanel/RoleLvUpSuccessPanel/item3/Img_Shuxingicondi2/Lv_icon2',2},{'>02','SuccessPanel/RoleLvUpSuccessPanel/item3/>',2},{'RoleStarUpSuccessPanel','SuccessPanel/RoleStarUpSuccessPanel',2},{'SuccessStar','SuccessPanel/RoleStarUpSuccessPanel/SuccessStar',2},{'SuccessStarJueXing','SuccessPanel/RoleStarUpSuccessPanel/SuccessStarJueXing',2},{'SuccessStarPanel','SuccessPanel/RoleStarUpSuccessPanel/SuccessStarPanel',2},{'RoleSuccessInfoPanel','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel',2},{'item1','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item1',2},{'>03','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item1/>',2},{'item201','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item2',2},{'>04','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item2/>',2},{'item301','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item3',2},{'>05','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item3/>',2},{'RoleJuxXingSuccessPanel','SuccessPanel/RoleJuxXingSuccessPanel',2},{'JX_SuccessStar','SuccessPanel/RoleJuxXingSuccessPanel/JX_SuccessStar',2},{'JX_SuccessStarPanel','SuccessPanel/RoleJuxXingSuccessPanel/JX_SuccessStarPanel',2},{'item101','SuccessPanel/RoleJuxXingSuccessPanel/item1',2},{'Img_Shuxingicondi202','SuccessPanel/RoleJuxXingSuccessPanel/item1/Img_Shuxingicondi2',2},{'icon101','SuccessPanel/RoleJuxXingSuccessPanel/item1/Img_Shuxingicondi2/icon1',2},{'>06','SuccessPanel/RoleJuxXingSuccessPanel/item1/>',2},{'item202','SuccessPanel/RoleJuxXingSuccessPanel/item2',2},{'Img_Shuxingicondi203','SuccessPanel/RoleJuxXingSuccessPanel/item2/Img_Shuxingicondi2',2},{'JX_icon2','SuccessPanel/RoleJuxXingSuccessPanel/item2/Img_Shuxingicondi2/JX_icon2',2},{'>07','SuccessPanel/RoleJuxXingSuccessPanel/item2/>',2},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UpperBtnPanel/Text_TitleCn',20},{'Text_TitleEn','UpperBtnPanel/Text_TitleEn',20},{'Text_AddExp','RoleLvUpPanel/RoleLevelPanel/Jingyantiao/Text_AddExp',20},{'Text_RoleExp','RoleLvUpPanel/RoleLevelPanel/Jingyantiao/Text_RoleExp',20},{'Text_Exp','RoleLvUpPanel/RoleLevelPanel/Jingyantiao/Text_Exp',20},{'Text_LV','RoleLvUpPanel/RoleLevelPanel/Text_LV',20},{'Text_CurLv','RoleLvUpPanel/RoleLevelPanel/Text_CurLv',20},{'Text_NextLv','RoleLvUpPanel/RoleLevelPanel/Text_NextLv',20},{'HpNameTxt','RoleLvUpPanel/LvUpInfoPreviewPanel/HpPanel/HpNameTxt',20},{'OriginHpText','RoleLvUpPanel/LvUpInfoPreviewPanel/HpPanel/OriginHpText',20},{'PreviewHpText','RoleLvUpPanel/LvUpInfoPreviewPanel/HpPanel/PreviewHpText',20},{'AtkNameTxt','RoleLvUpPanel/LvUpInfoPreviewPanel/AtkPanel/AtkNameTxt',20},{'OriginAtkText','RoleLvUpPanel/LvUpInfoPreviewPanel/AtkPanel/OriginAtkText',20},{'PreviewAtkText','RoleLvUpPanel/LvUpInfoPreviewPanel/AtkPanel/PreviewAtkText',20},{'Text_Shengjixiaohao','RoleLvUpPanel/Panel_UpgradeNeed/Text_Shengjixiaohao',20},{'ItemCountText','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_ItemCountBg/ItemCountText',20},{'ItemSelectCount','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_SelectBg/ItemSelectCount',20},{'ItemCountText01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_ItemCountBg/ItemCountText',20},{'ItemSelectCount01','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_SelectBg/ItemSelectCount',20},{'ItemCountText02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_ItemCountBg/ItemCountText',20},{'ItemSelectCount02','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_SelectBg/ItemSelectCount',20},{'BtnMaxLV_Txt','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Lvmaxdi/BtnMaxLV_Txt',20},{'BtnMinLV_Txt','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/lvmindi/BtnMinLV_Txt',20},{'Text_UseCount','RoleLvUpPanel/Panel_UpgradeNeed/Panel_UseExpBook/UpDownPanel/Text_UseCount',20},{'Text_GoldNeedTitle','RoleLvUpPanel/Panel_UpgradeNeed/Xiaohao/Text_GoldNeedTitle',20},{'Text_GoldNeedCount','RoleLvUpPanel/Panel_UpgradeNeed/Xiaohao/Img_CountBg/Text_GoldNeedCount',20},{'Text_GoldNeedCount01','RoleLvUpPanel/Panel_UpgradeNeed/Xiaohao/Text_GoldNeedCount',20},{'LvNameTxt','RoleStarUpgradePanel/RoleInfoPanel/Lv/LvNameTxt',20},{'OriginLvText','RoleStarUpgradePanel/RoleInfoPanel/Lv/OriginLvText',20},{'PreviewLvText','RoleStarUpgradePanel/RoleInfoPanel/Lv/PreviewLvText',20},{'HpNameTxt01','RoleStarUpgradePanel/RoleInfoPanel/Hp/HpNameTxt',20},{'StarOriginHpText','RoleStarUpgradePanel/RoleInfoPanel/Hp/StarOriginHpText',20},{'StarPreviewHpText','RoleStarUpgradePanel/RoleInfoPanel/Hp/StarPreviewHpText',20},{'StarAtkNameTxt','RoleStarUpgradePanel/RoleInfoPanel/Atk/StarAtkNameTxt',20},{'StarOriginAtkText','RoleStarUpgradePanel/RoleInfoPanel/Atk/StarOriginAtkText',20},{'StarPreviewAtkText','RoleStarUpgradePanel/RoleInfoPanel/Atk/StarPreviewAtkText',20},{'Text_Tupoxiaohao','RoleStarUpgradePanel/Text_Tupoxiaohao',20},{'Text_Juexingixianzhi','RoleStarUpgradePanel/Text_Juexingixianzhi',20},{'ItemCountText03','RoleStarUpgradePanel/Star_CostItem/Img_ItemCountBg/ItemCountText',20},{'ItemCountText04','RoleStarUpgradePanel/Star_CostItem/ItemCountText',20},{'ItemCountText2','RoleStarUpgradePanel/Star_CostItem/ItemCountText2',20},{'Text_Huodejineng','RoleStarUpgradePanel/Text_Huodejineng',20},{'Text_TupoSkillName','RoleStarUpgradePanel/TupoSkillNamePanel/Text_TupoSkillName',20},{'Text_Tag','RoleStarUpgradePanel/TupoSkillNamePanel/TagPanel/Img_Tag1/Text_Tag',20},{'Text_Tag01','RoleStarUpgradePanel/TupoSkillNamePanel/TagPanel/Img_Tag2/Text_Tag',20},{'HpNameTxt02','RoleJueXingPanel/LvUpInfoPreviewPanel/HpPanel/HpNameTxt',20},{'JXCurHpText','RoleJueXingPanel/LvUpInfoPreviewPanel/HpPanel/JXCurHpText',20},{'JXNextHpText','RoleJueXingPanel/LvUpInfoPreviewPanel/HpPanel/JXNextHpText',20},{'JXAtkNameTxt','RoleJueXingPanel/LvUpInfoPreviewPanel/AtkPanel/JXAtkNameTxt',20},{'JXCurAtkText','RoleJueXingPanel/LvUpInfoPreviewPanel/AtkPanel/JXCurAtkText',20},{'JXNextAtkText','RoleJueXingPanel/LvUpInfoPreviewPanel/AtkPanel/JXNextAtkText',20},{'Text_Huodejineng01','RoleJueXingPanel/Text_Huodejineng',20},{'Text_SkillName','RoleJueXingPanel/SkillNamePanel/Text_SkillName',20},{'Text_Tag02','RoleJueXingPanel/SkillNamePanel/TagPanel/Img_Tag1/Text_Tag',20},{'Text_Tag03','RoleJueXingPanel/SkillNamePanel/TagPanel/Img_Tag2/Text_Tag',20},{'Text_Juexingixiaohao','RoleJueXingPanel/Text_Juexingixiaohao',20},{'ItemCountText05','RoleJueXingPanel/JX_CostItem/Img_ItemCountBg/ItemCountText',20},{'ItemCountText06','RoleJueXingPanel/JX_CostItem/ItemCountText',20},{'ItemCountText201','RoleJueXingPanel/JX_CostItem/ItemCountText2',20},{'Text_Quxiao','Btn_Quxiao/Text_Quxiao',20},{'Text_Queding','Btn_Queding/Text_Queding',20},{'Text_FightResult','SuccessPanel/FightResult/Text_FightResult',20},{'TouchExit','SuccessPanel/Touch Exit',20},{'LvText','SuccessPanel/RoleLvUpSuccessPanel/item1/LvText',20},{'OriginLVText','SuccessPanel/RoleLvUpSuccessPanel/item1/OriginLVText',20},{'TargetLVText','SuccessPanel/RoleLvUpSuccessPanel/item1/TargetLVText',20},{'HpNameText','SuccessPanel/RoleLvUpSuccessPanel/item2/HpNameText',20},{'SuccessCurHpText','SuccessPanel/RoleLvUpSuccessPanel/item2/SuccessCurHpText',20},{'TargetHpText','SuccessPanel/RoleLvUpSuccessPanel/item2/TargetHpText',20},{'LvAtkNameText','SuccessPanel/RoleLvUpSuccessPanel/item3/LvAtkNameText',20},{'OriginAtkZhiYuanText','SuccessPanel/RoleLvUpSuccessPanel/item3/OriginAtkZhiYuanText',20},{'TargetAtkZhiYuanText','SuccessPanel/RoleLvUpSuccessPanel/item3/TargetAtkZhiYuanText',20},{'LvNameText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item1/LvNameText',20},{'SuccCurLvText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item1/SuccCurLvText',20},{'SuccTargetLvText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item1/SuccTargetLvText',20},{'HpNameText01','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item2/HpNameText',20},{'SuccCurHpText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item2/SuccCurHpText',20},{'SuccTargetHpText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item2/SuccTargetHpText',20},{'SuccAtkZyNameText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item3/SuccAtkZyNameText',20},{'SuccCurAtkZyText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item3/SuccCurAtkZyText',20},{'SuccTargetAtkZyText','SuccessPanel/RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item3/SuccTargetAtkZyText',20},{'HpNameText02','SuccessPanel/RoleJuxXingSuccessPanel/item1/HpNameText',20},{'JX_SuccessCurHpText','SuccessPanel/RoleJuxXingSuccessPanel/item1/JX_SuccessCurHpText',20},{'JX_SuccessNextHpText','SuccessPanel/RoleJuxXingSuccessPanel/item1/JX_SuccessNextHpText',20},{'JX_AtkZhiYuanName','SuccessPanel/RoleJuxXingSuccessPanel/item2/JX_AtkZhiYuanName',20},{'JX_CurSuccAtkZhiYuanText','SuccessPanel/RoleJuxXingSuccessPanel/item2/JX_CurSuccAtkZhiYuanText',20},{'JX_NextSuccAtkZhiYuanText','SuccessPanel/RoleJuxXingSuccessPanel/item2/JX_NextSuccAtkZhiYuanText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.RoleLvUpPanel().gameObject:SetActive(false)
    self.RoleStarUpgradePanel().gameObject:SetActive(false)
    self.RoleJueXingPanel().gameObject:SetActive(false)
    self.Lv_Star().gameObject:SetActive(false)
    self.Lv_StarAwaken().gameObject:SetActive(false)
    ---升级、升星、觉醒成功
    self.SuccessPanel().gameObject:SetActive(false)
    self.RoleLvUpSuccessPanel().gameObject:SetActive(false)
    self.RoleStarUpSuccessPanel().gameObject:SetActive(false)

    self.RoleJuxXingSuccessPanel().gameObject:SetActive(false)
    --self.Img_Jinengdian_hui().gameObject:SetActive(false)
    --self.Img_Jinengdian1().gameObject:SetActive(false)

    self.Img_PreviewExpSlider().fillAmount = 0

    self.CurHero = nil ---当前选择角色
    self.CurHeroAttr = nil  ---当前英雄属性(可变)
    self.UnChangedHeroAttr = nil  ---当前英雄属性(不变)

    self.CurType = ""
    self.Parent = nil
    self.CurPanel = nil
    ---是否为首次升级技能
    self.IsNoviceUp = false
    ---初始化公共按钮
    self:InitButton()
    ---注册引导事件
    self:AddNoviceEvent()

    Event.Add("HideNewRoleFormationSelf",function ()
        if self.ObjRoot then
            self.ObjRoot.gameObject:SetActive(false)
        end
    end)

    Event.Add("ShowNewRoleFormationSelf",function ()
        if self.ObjRoot and MgrUI.GetCurUI().Uid == UID.NewRoleDetail2_UI or MgrUI.GetCurUI().Uid == UID.StormScroll_UI then
            if self.ObjRoot ~= nil then
                self.ObjRoot:SetActive(true)
                if self.CurType == "LvUpGrade" then
                    ---初始化升级界面
                    self:InitUpGrade()
    
                    self:SwitchPanel(self.RoleLvUpPanel())
                elseif self.CurType == "StarUpGrade" then
                    ---初始化突破界面
                    self:InitStarUp()
    
                    self:SwitchPanel(self.RoleStarUpgradePanel())
                elseif self.CurType == "Awaken" then
                    ---初始化觉醒界面
                    self:InitAwaken()
    
                    self:SwitchPanel(self.RoleJueXingPanel())
                end
            end
        end
    end)
end

function M:OnShow(pData)
    self.CurType = pData[1]
    self.Parent = pData[2] and pData[2] or nil

    self.CurHero = self.Parent.CurHero
    self.CurHeroAttr = self.CurHero:GetHeroAttr()
    self.UnChangedHeroAttr = self.CurHero:GetHeroAttr()

    if self.CurType == "LvUpGrade" then
        ---初始化升级界面
        self:InitUpGrade()

        self:SwitchPanel(self.RoleLvUpPanel())
    elseif self.CurType == "StarUpGrade" then
        ---初始化突破界面
        self:InitStarUp()

        self:SwitchPanel(self.RoleStarUpgradePanel())
    elseif self.CurType == "Awaken" then
        ---初始化觉醒界面
        self:InitAwaken()

        self:SwitchPanel(self.RoleJueXingPanel())
    end
end

---初始化公共按钮
function M:InitButton()
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Clear("HideNewRoleFormationSelf")
        Event.Clear("ShowNewRoleFormationSelf")
        Event.Go("NewRole_BackClick")
        MgrUI.ClosePop(self.Uid)
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---取消
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject, function()
        Event.Go("NewRole_BackClick")
        MgrUI.ClosePop(self.Uid)
    end)
    ---确定
    UIEvent.LuaClick(self.Btn_Queding().gameObject, function()
        if self.CurType == "LvUpGrade" then
            ---升级请求
            self:OnClickUpgrade()
        elseif self.CurType == "StarUpGrade" then
            ---升星请求
            self:OnClickUpStar()
        elseif self.CurType == "Awaken" then
            ---觉醒请求
            self:OnClickJueXing()
        end
    end)
    ---点击成功界面响应
    UIEvent.LuaClick(self.Btn_SuccessBack().gameObject, function()
        ---更新人物属性
        self.UnChangedHeroAttr = self.CurHero:GetHeroAttr()  ---当前英雄属性(不变)

        if self.CurType == "LvUpGrade" then
            ---切回升级界面
            if self.CurHeroAttr.StartLV < self.CurHeroAttr.MaxStart and self.CurHeroAttr.LV == self.CurHeroAttr.LvMax then
                ---初始化突破界面
                self:InitStarUp()
                self:SwitchPanel(self.RoleStarUpgradePanel())
                self.SuccessPanel().gameObject:SetActive(false)
            elseif self.CurHeroAttr.StartLV >= self.CurHeroAttr.MaxStart and self.CurHeroAttr.LV == self.CurHeroAttr.LvMax then
                ---星级和等级都MAX后,返回
                Event.Go("NewRole_BackClick")
                MgrUI.ClosePop(self.Uid)
            else
                self:SwitchPanel(self.RoleLvUpPanel())
                self.SuccessPanel().gameObject:SetActive(false)
            end
        elseif self.CurType == "StarUpGrade" then
            ---初始化升级界面
            self:InitUpGrade()
            self:SwitchPanel(self.RoleLvUpPanel())
            self.SuccessPanel().gameObject:SetActive(false)
        elseif self.CurType == "Awaken" then
            Event.Go("NewRole_BackClick")
            MgrUI.ClosePop(self.Uid)
        end
    end)
end

function M:OnBackKey()
    if self.SuccessPanel().gameObject.activeSelf then
        ---更新人物属性
        self.UnChangedHeroAttr = self.CurHero:GetHeroAttr()  ---当前英雄属性(不变)

        if self.CurType == "LvUpGrade" then
            ---切回升级界面
            if self.CurHeroAttr.StartLV < self.CurHeroAttr.MaxStart and self.CurHeroAttr.LV == self.CurHeroAttr.LvMax then
                ---初始化突破界面
                self:InitStarUp()
                self:SwitchPanel(self.RoleStarUpgradePanel())
                self.SuccessPanel().gameObject:SetActive(false)
            elseif self.CurHeroAttr.StartLV >= self.CurHeroAttr.MaxStart and self.CurHeroAttr.LV == self.CurHeroAttr.LvMax then
                ---星级和等级都MAX后,返回
                Event.Go("NewRole_BackClick")
                MgrUI.ClosePop(self.Uid)
            else
                self:SwitchPanel(self.RoleLvUpPanel())
                self.SuccessPanel().gameObject:SetActive(false)
            end
        elseif self.CurType == "StarUpGrade" then
            ---初始化升级界面
            self:InitUpGrade()
            self:SwitchPanel(self.RoleLvUpPanel())
            self.SuccessPanel().gameObject:SetActive(false)
        elseif self.CurType == "Awaken" then
            Event.Go("NewRole_BackClick")
            MgrUI.ClosePop(self.Uid)
        end
        return
    end
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("NewRole_BackClick")
        MgrUI.ClosePop(self.Uid)
    end
end

---取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data * 1000) / 1)
    tempData = tempInt1 / 10
    return tempData
end

---切换界面
function M:SwitchPanel(_panel)
    if self.CurPanel == _panel then
        return
    end
    if self.CurPanel ~= nil then
        self.CurPanel.gameObject:SetActive(false)
    end
    self.CurPanel = _panel
    self.CurPanel.gameObject:SetActive(true)
end
---更新道具数据
function M:UpdataItem(obj, pData)
    local tStarPanel = obj.transform:Find("StarPanel").gameObject
    local tStartPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
    local tItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    local tRewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
    local tItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
    local tRewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
    
    ---为0不显示星级
    if pData.star then
        tStarPanel:SetActive(pData.star > 0)
        ---大于0更新星级显示
        if pData.star > 0 then
            for i = 1, pData.star do
                local star = GameObject.Instantiate(tStartPrefab, tItemStarRoot.transform)
                star:SetActive(true)
            end
        end
    else
        tStarPanel:SetActive(false)
    end
    ---设置品质
    MgrRes.LoadSprite(tRewardRankImg, "Item/Rank/ItemRank_" .. pData.quality)
    ---设置图标
    MgrRes.LoadSprite(tRewardIconImg, pData.icon)
    ---设置数量
    if pData.count then
        tItemCountText.text = JNStrTool.numberAbbr(pData.count)
    else
        tItemCountText.text = "0"
    end
end
--创建星星
function M:CreatStar(_Root, _Prefab)
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3(tempObj.transform.localPosition.x, tempObj.transform.localPosition.y, 0)
    return tempObj
end
--初始化星星
function M:InitStar(_Root, _Prefab, _Count)
    Tools.ClearAllChild(_Root)
    for i = 1, _Count, 1 do
         local obj = self:CreatStar(_Root, _Prefab)
         if i == _Count and self.CurType == "StarUpGrade" then
            if not self.CurHero.awaken then
                MgrRes.LoadSprite(obj:GetComponent("Image"),"Attribute/".."Img_Xing_H")
            else
                MgrRes.LoadSprite(obj:GetComponent("Image"),"Attribute/".."Img_XingJuexing_H")
            end
         end
    end
end
---转化百分比
function M:GetCorrectRate(_Rate)
    local tempRate = _Rate * 10000
    local _Rate, data2 = math.modf(tempRate / 1)
    _Rate = _Rate / 10000
    return _Rate
end
---高位数缩进
function M:GetRounding(value)
    return Global.GetConciseCount(value)
end
-----------------------------角色升级-----------------------------------
---初始化升级界面
function M:InitUpGrade()
    self.CurType = "LvUpGrade"
    ---角色升级
    self.Text_TitleCn().text = MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_upgrade")
    ---获取选择框
    self.Img_Jiaobiao1 = self.Upitem1().transform:Find("Img_Jiaobiao1").gameObject
    self.Img_Jiaobiao2 = self.Upitem2().transform:Find("Img_Jiaobiao1").gameObject
    self.Img_Jiaobiao3 = self.Upitem3().transform:Find("Img_Jiaobiao1").gameObject
    self.Img_Jiaobiao1:SetActive(false)
    self.Img_Jiaobiao2:SetActive(false)
    self.Img_Jiaobiao3:SetActive(false)
    local Img_SelectBg1 = self.Upitem1().transform:Find("Img_SelectBg").gameObject
    local Img_SelectBg2 = self.Upitem2().transform:Find("Img_SelectBg").gameObject
    local Img_SelectBg3 = self.Upitem3().transform:Find("Img_SelectBg").gameObject
    local ItemSelectCount1 = Img_SelectBg1.transform:Find("ItemSelectCount"):GetComponent("TextMeshProUGUI")
    local ItemSelectCount2 = Img_SelectBg2.transform:Find("ItemSelectCount"):GetComponent("TextMeshProUGUI")
    local ItemSelectCount3 = Img_SelectBg3.transform:Find("ItemSelectCount"):GetComponent("TextMeshProUGUI")
    ---经验书物体
    self.ItemObj = {
        [1] = { self.Upitem1(), 110050, self.Img_Jiaobiao1, Img_SelectBg1, ItemSelectCount1 },
        [2] = { self.Upitem2(), 110051, self.Img_Jiaobiao2, Img_SelectBg2, ItemSelectCount2 },
        [3] = { self.Upitem3(), 110052, self.Img_Jiaobiao3, Img_SelectBg3, ItemSelectCount3 }
    }

    self.Bool_AddExpBookLock_LVLimit = false ---经验书添加锁(等级上限)
    self.Bool_IsAdd = true ---添加还是减少经验书
    self.Int_LoopTimer = 0 ---循环检测计数器

    self.PlayerExpBook = {}     ---经验书列表
    self.CurSelectItem = nil    ---当前选择的经验书
    ---角色星级
    if not self.CurHero.awaken then
        self:InitStar(self.Lv_StarPanel().gameObject,self.Lv_Star().gameObject,self.CurHero.star)
    else
        self:InitStar(self.Lv_StarPanel().gameObject,self.Lv_StarAwaken().gameObject,self.CurHero.star)
    end

    ---初始化经验书结构
    for i = 1, #self.ItemObj do
        self.PlayerExpBook[i] = self:InitPlayerExpBookStruct(self.ItemObj[i][2], self.ItemObj[i][3].gameObject)
        ---更新道具
        self:UpdataItem(self.ItemObj[i][1].gameObject, self.PlayerExpBook[i])
    end
    if NoviceViewModel.CurTaskId == 20008 then
        self.CurSelectItem = self.PlayerExpBook[2]
    else
        self.CurSelectItem = self.PlayerExpBook[1]
    end
    self.CurSelectItem.BookSelectObj:SetActive(true)
    ---初始化按钮
    self:InitLvUpBtn()
    self:UpdataRoleInfoPanel()
    ---初始化属性和UI
    self:InitRoleInfo()
end
---初始化属性和UI
function M:InitRoleInfo()
    ---判断职业类型
    if self.CurHeroAttr.Occupation == 4 then
        self.ZhiYuanIcon().gameObject:SetActive(true)
        self.AtkIcon().gameObject:SetActive(false)
        self.OriginAtkText().text = "" .. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart) .. "%"
        self.PreviewAtkText().text = "" .. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart) .. "%" --数值无变化改为显示当前数值
        self.AtkNameTxt().text=MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
    else
        self.ZhiYuanIcon().gameObject:SetActive(false)
        self.AtkIcon().gameObject:SetActive(true)
        self.OriginAtkText().text = "" .. math.floor(self.CurHeroAttr.RealAtk)
        self.AtkNameTxt().text=MgrLanguageData.GetLanguageByKey("ui_yangcheng_text14")
        self.PreviewAtkText().text = "" ..math.floor(self.CurHeroAttr.RealAtk) --数值无变化改为显示当前数值
    end
    ---角色信息更新
    self.Text_CurLv().text = self.CurHeroAttr.LV
    self.OriginHpText().text = math.floor(self.CurHeroAttr.HP)
    self.PreviewHpText().text = math.floor(self.CurHeroAttr.HP) --数值无变化改为显示当前数值
    --self.PreviewAtkText().text = math.floor(self.CurHeroAttr.RealAtk)
end
---初始化经验书结构
function M:InitPlayerExpBookStruct(_id, _obj)
    local tCurItemList = ItemControl.GetItemByID(_id)
    local Struct_ExpBook = {
        BookId = _id, --当前经验书ID
        BookType = 0, --当前经验书类型
        BookSelectSum = 0, --当前选择数量
        BookPlayerSum = 0, --玩家持有数量
        BookExp = 0, --转换成的经验数量
        BookAddLock_SumLimit = false, --经验书添加锁(持有数量上限)
        BookSelectObj = nil,
        star = 0,
        quality = 0,
        icon = "",
        count = 0
    }
    ---更新经验书结构
    local _Init_Struct_ExpBook = function(pStruct_ExpBook)
        pStruct_ExpBook.BookPlayerSum = tCurItemList.count
        pStruct_ExpBook.BookType = tCurItemList.goodsType
        pStruct_ExpBook.BookExp = tCurItemList.costeffect[2]
        pStruct_ExpBook.star = tCurItemList.star
        pStruct_ExpBook.quality = tCurItemList.quality
        pStruct_ExpBook.icon = tCurItemList.icon
        pStruct_ExpBook.count = tCurItemList.count

        return pStruct_ExpBook
    end
    ---更新经验书结构
    Struct_ExpBook = _Init_Struct_ExpBook(Struct_ExpBook)
    Struct_ExpBook.BookSelectObj = _obj

    return Struct_ExpBook
end
---初始化按钮
function M:InitLvUpBtn()
    ---添加经验书
    UIEvent.LuaPressClick(self.Btn_LvUpLight().gameObject, Handle(self, function()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickAddExpBook(self.CurSelectItem)
        self.Int_HasClick = 1
        self.Bool_IsAdd = true
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
    ---减少经验书
    UIEvent.LuaPressClick(self.Btn_LvDownLight().gameObject, Handle(self, function()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickDeCreaseExpBook(self.CurSelectItem)
        self.Int_HasClick = 1
        self.Bool_IsAdd = false
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
    UIEvent.LuaClick(self.lvmindi().gameObject, Handle(self, Handle(self,self.AutoCancel)))
    UIEvent.LuaClick(self.Lvmaxdi().gameObject, Handle(self, Handle(self,self.AutoAddExp)))
    ---道具点击
    for i, v in ipairs(self.ItemObj) do
        UIEvent.LuaClick(v[1].gameObject, Handle(self, function()
            if self.CurSelectItem ~= self.PlayerExpBook[i] then
                self.CurSelectItem.BookSelectObj:SetActive(false)
                -----清除选择
                --self.CurSelectItem.BookSelectSum = 0
                
                self.CurSelectItem = self.PlayerExpBook[i]
                self.CurSelectItem.BookSelectObj:SetActive(true)
                ---更新人物属性
                self:UpdataRoleInfoPanel()
                self.Text_UseCount().text = self.CurSelectItem.BookSelectSum
            end
        end))
    end
end
---循环检测
function M:IsLoopClick()
    if UIEvent.GetButton_Up() == false then
        self.Int_HasClick = 0
    end
end
---循环检测按下事件并执行
function M:LoopInput()
    if self.IsEndLoopToInput == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05, Handle(self, self.LoopInput), nil)
        self.Int_HasClick = 1
        self.Int_LoopTimer = self.Int_LoopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.Int_LoopTimer > 5 then
            self:LoopFuncSwitch(self.CurSelectItem)
        end
        if bool_IsUp == false then
            self.Int_LoopTimer = 0
            self.Int_HasClick = 0
            self.IsEndLoopToInput = true
            print("跳出循环...........................")
        end
    end
end
---循环检测长按按钮方法
function M:LoopFuncSwitch(_Struct_ExpBook)
    if self.Bool_IsAdd == true then
        -- 增加经验书
        self:OnClickAddExpBook(_Struct_ExpBook)
    elseif self.Bool_IsAdd == false then
        -- 减少经验书
        self:OnClickDeCreaseExpBook(_Struct_ExpBook)
    end
end
---点击添加经验书
function M:OnClickAddExpBook(_Struct_ExpBook)
    if _Struct_ExpBook.BookAddLock_SumLimit or self.Bool_AddExpBookLock_LVLimit then
        --添加经验书上锁,跳出
        return
    end
    if _Struct_ExpBook.BookPlayerSum == 0 or _Struct_ExpBook.BookPlayerSum == nil or _Struct_ExpBook.BookSelectSum >= _Struct_ExpBook.BookPlayerSum then
        return
    end
    if self.LocalPreviewLv >= self.UnChangedHeroAttr.LvMax then
        return
    end
    MgrSound.PlayEffect("yx_ui_shuzigundong_01", 1, nil, false)
    _Struct_ExpBook.BookSelectSum = _Struct_ExpBook.BookSelectSum + 1
    self:UpdataRoleInfoPanel()
end
---点击减少经验书
function M:OnClickDeCreaseExpBook(_Struct_ExpBook)
    if _Struct_ExpBook.BookSelectSum <= 0 then
        return
    end
    _Struct_ExpBook.BookSelectSum = _Struct_ExpBook.BookSelectSum - 1
    MgrSound.PlayEffect("yx_ui_shuzigundong_01", 1, nil, false)
    self:UpdataRoleInfoPanel()
end
---切换按钮高光低光 第二版修改为常亮状态
function M:SwitchBtnState(_BtnType)
    if _BtnType == 1 then
        -- 显示高光等级提升按钮
        self.BtnMaxLV_Txt().text = MgrLanguageData.GetLanguageByKey("ui_levelup_max")
        --Tools.ObjSetLastSibling(self.Btn_LvUpLight().gameObject)
    elseif _BtnType == 2 then
        -- 显示低光光等级提升按钮
        self.BtnMaxLV_Txt().text = MgrLanguageData.GetLanguageByKey("ui_levelup_max") --"<color=#A8A8A8>Max</color>"
        self.Int_LoopTimer = 0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        --Tools.ObjSetLastSibling(self.Btn_LvUp().gameObject)
    elseif _BtnType == 3 then
        -- 显示高光等级减少按钮
        self.BtnMinLV_Txt().text = MgrLanguageData.GetLanguageByKey("ui_levelup_min")
        --Tools.ObjSetLastSibling(self.Btn_LvDownLight().gameObject)
    elseif _BtnType == 4 then
        -- 显示低光等级减少按钮
        self.BtnMinLV_Txt().text = MgrLanguageData.GetLanguageByKey("ui_levelup_min") --"<color=#A8A8A8>Min</color>"
        self.Int_LoopTimer = 0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        --Tools.ObjSetLastSibling(self.Btn_LvDown().gameObject)
    end
end
---自动添加经验
function M:AutoAddExp()
    ---已经到最大等级 返回
    if self.LocalPreviewLv >= self.UnChangedHeroAttr.LvMax then
        return
    end
    local maxExp = 0
   
    local attr = self.CurHero:GetHeroAttr()
    for i = self.CurHero.level,(attr.LvMax - 1) do
        maxExp = maxExp + BattleRole.ReturnExp(attr,i)
    end
    maxExp = maxExp - self.CurHero.exp
    
    self.count = 0
    local coin = ItemControl.GetAllItems()[100001] and ItemControl.GetAllItems()[100001].count or 0
    local needCoin = maxExp * RoleCardViewModel.GetRoleLvUpCoinCost(self.CurHero.id)
    ---如果货币少于所需货币
    if coin < needCoin then
        local exp = math.floor(coin / RoleCardViewModel.GetRoleLvUpCoinCost(self.CurHero.id))
        self:AutoSelectExp(exp, false)
    else
        self:AutoSelectExp(maxExp,true)
    end
    ---更新角色属性
    self:UpdataRoleInfoPanel()
end
---根据输入经验获取当前经验书数量
function M:AutoSelectExp(exp, isCoinEnough)
    if exp <= 0 then
        return
    end
    local tCount = 0
    local tExp = exp
    local allExp = 0
    for i = 1, #self.PlayerExpBook, 1 do
        local v = self.PlayerExpBook[i]
        allExp = allExp + v.BookPlayerSum * v.BookExp
    end
    if tExp >= allExp then
        for i = 1, #self.PlayerExpBook, 1 do
            local v = self.PlayerExpBook[i]
            v.BookSelectSum = v.BookPlayerSum
        end
    else
        for i = #self.PlayerExpBook, 1, -1 do
            local v = self.PlayerExpBook[i]
            tCount = tExp // v.BookExp
            if v.BookPlayerSum >= tCount then
                v.BookSelectSum = tCount
                tExp = tExp - v.BookSelectSum * v.BookExp
            else
                v.BookSelectSum = v.BookPlayerSum
                tExp = tExp - v.BookPlayerSum * v.BookExp
            end
        end
        if tExp > 0 and isCoinEnough then
            for i = 1, #self.PlayerExpBook, 1 do
                local v = self.PlayerExpBook[i]
                if v.BookPlayerSum >= v.BookSelectSum + 1 then
                    v.BookSelectSum = v.BookSelectSum + 1
                    break
                else
                    v.BookSelectSum = 0
                end
            end
        end
    end
end
---自动取消所有经验
function M:AutoCancel()
    for i = #self.PlayerExpBook, 1, -1 do
        self.PlayerExpBook[i].BookSelectSum = 0
    end
    ---更新人物属性
    self:UpdataRoleInfoPanel()
end
---添加当前经验书到最大等级
function M:MaxLV()
    ---已经到最大等级 返回
    if self.LocalPreviewLv >= self.UnChangedHeroAttr.LvMax then
        return
    end
    local maxExp = 0
    self.CurSelectItem.BookSelectSum = 0
    local attr = self.CurHero:GetHeroAttr()
    for i = self.CurHero.level,(attr.LvMax - 1) do
        maxExp = maxExp + BattleRole.ReturnExp(attr,i)
    end
    maxExp = maxExp - self.CurHero.exp - self:GetCurSumExp()
    local differenceExp = (self.CurSelectItem.BookPlayerSum*self.CurSelectItem.BookExp) - maxExp
    self.count = 0
    local coin = ItemControl.GetAllItems()[100001] and ItemControl.GetAllItems()[100001].count or 0
    local needCoin = maxExp * RoleCardViewModel.GetRoleLvUpCoinCost(self.CurHero.id)
    ---如果货币少于所需货币
    if coin < needCoin then
        local exp = math.floor(coin / RoleCardViewModel.GetRoleLvUpCoinCost(self.CurHero.id))
        self:GetBookByExp(exp)
    else
        self:GetBookByExp(maxExp,true)
    end
    if self.CurSelectItem.BookPlayerSum >= self.count then
        self.CurSelectItem.BookSelectSum = self.count
    else
        self.CurSelectItem.BookSelectSum = self.CurSelectItem.BookPlayerSum
    end
    ---更新角色属性
    self:UpdataRoleInfoPanel()
end
---去除当前经验书
function M:MinLV()
    self.CurSelectItem.BookSelectSum = 0
    ---更新人物属性
    self:UpdataRoleInfoPanel()
end
---更新人物属性
function M:UpdataRoleInfoPanel()
    ---根据当前经验书池中投入总数计算出总经验值并得出最终机娘等级和剩余经验
    local _InputExp = self:GetCurSumExp()  ---当前输入经验值
    self.CostMoney = 0
    local coin = ItemControl.GetItemByID(100001) and ItemControl.GetItemByID(100001).count or 0
    local needCoin = _InputExp * 0.25      ---消耗金币
    if coin >= needCoin then
        self.Text_GoldNeedCount().text = "" .. math.floor(_InputExp * 0.25)
    else
        self.Text_GoldNeedCount().text = string.format(" <color=#C33A3A>%s</color>", math.floor(_InputExp * 0.25))
    end

    self.CostMoney = _InputExp * 0.25
    local _FinalLv = 0  ---输入经验后得到最终人物等级
    local _FinalExp = 0 ---输入经验后得到最终人物剩余经验
    if _InputExp > 0 then
        --- 如果有输入经验
        _FinalLv, _FinalExp = UISysTools.GetFinalRoleLvExp(self.UnChangedHeroAttr.LV, self.UnChangedHeroAttr.EXP, _InputExp, self.UnChangedHeroAttr)
        self.CurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, _FinalLv, self.CurHero.star, self.CurHero.skillLevel, self.CurHero.awaken, _FinalExp)
    else
        ---没有输入经验则恢复原始属性
        self.CurHeroAttr = self.CurHero:GetHeroAttr()
    end
    ---根据当前的角色属性刷新UI
    self.LocalPreviewLv = self.CurHeroAttr.LV
    ---判断是否为支援角色
    if self.CurHeroAttr.Occupation == 4 then
        self.ZhiYuanIcon().gameObject:SetActive(true)
        self.AtkIcon().gameObject:SetActive(false)
        if self:GetInfoCorrect(self.CurHeroAttr.RealSuppart - self.UnChangedHeroAttr.RealSuppart) == 0 then
            self.PreviewAtkText().text = "" .. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart) .. "%"
        else
            self.PreviewAtkText().text = "" .. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart) .. "%"
        end
    else
        self.ZhiYuanIcon().gameObject:SetActive(false)
        self.AtkIcon().gameObject:SetActive(true)
        if math.floor(self.CurHeroAttr.RealAtk - self.UnChangedHeroAttr.RealAtk) == 0 then
            self.PreviewAtkText().text = "" .. math.floor(self.CurHeroAttr.RealAtk)
        else
            self.PreviewAtkText().text = "" .. math.floor(self.CurHeroAttr.RealAtk)
        end
    end
    if math.floor(self.CurHeroAttr.HP - self.UnChangedHeroAttr.HP) == 0 then
        self.PreviewHpText().text = "" .. math.floor(self.CurHeroAttr.HP) --经验不够升级显示当前生命值
    else
        ---更新血量
        self.PreviewHpText().text = "" .. math.floor(self.CurHeroAttr.HP)
    end
    ---更新角色等级
    self.Text_NextLv().text = self.CurHeroAttr.LV
    --- 刷新人物经验槽UI
    --- 预览角色属性等级经验
    local _NextLvExp = BattleRole.ReturnExp(self.CurHeroAttr, tonumber(self.CurHeroAttr.LV))
    local _PreviewExpRate = 0
    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
        _PreviewExpRate = 0
    else
        _PreviewExpRate = _FinalExp / tonumber(_NextLvExp)
    end
    --- 更新预览经验条
    Tools.SetImgFillRate(self.Img_PreviewExpSlider().gameObject, _PreviewExpRate, 0.2, nil, false, self.Bool_IsAdd)
    --- 当前角色等级经验
    local _OriginNextLvExp = BattleRole.ReturnExp(self.UnChangedHeroAttr, tonumber(self.UnChangedHeroAttr.LV))
    local _OrginExpRate = tonumber(self.UnChangedHeroAttr.EXP) / tonumber(_OriginNextLvExp)

    if self.CurHeroAttr.LV > self.UnChangedHeroAttr.LV then
        ---输入经验已经足够升一级并且有溢出 就不显示黄条
        Tools.SetImgFillRate(self.Img_CurExpSlider().gameObject, 0)
    else
        if self.UnChangedHeroAttr.LV >= self.UnChangedHeroAttr.LvMax then
            Tools.SetImgFillRate(self.Img_CurExpSlider().gameObject, 0)
        else
            --Tools.SetImgFillRate(self.Img_CurExpSlider().gameObject, _OrginExpRate)
            self.Img_CurExpSlider().fillAmount = _OrginExpRate
        end
    end
    ---更新经验文本
    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
        --- 如果已经达到满级则不显示下一级经验
        self.Text_RoleExp().text = string.format("<color=#1CFFD7>"..MgrLanguageData.GetLanguageByKey("ui_qita_text121").."</color>/"..MgrLanguageData.GetLanguageByKey("ui_qita_text121"))
    else
        self.Text_RoleExp().text = string.format("<color=#1CFFD7>%d</color>/%d", self.CurHeroAttr.EXP, _NextLvExp)
    end
    self.Text_AddExp().text = _InputExp == 0 and "" or "+" .. _InputExp

    ---根据计算完成的等级判断当前是否溢出或小于初始等级
    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
        self.Bool_AddExpBookLock_LVLimit = true
    else
        self.Bool_AddExpBookLock_LVLimit = false
    end
    if self.CurHeroAttr.LV < self.CurHeroAttr.LvMax then
        self:SwitchBtnState(1)
    else
        self:SwitchBtnState(2)
    end
    if self.CurHeroAttr.LV > self.UnChangedHeroAttr.LV then
        self:SwitchBtnState(3)
    else
        self:SwitchBtnState(4)
    end
    Tools.ReContentSizeGroup(self.Xiaohao().gameObject)
end
---获取经验和金币消耗文本
function M:GetCurSumExp()
    local _ReturnExp = 0
    --计算选择的经验书 经验总和
    for i, v in ipairs(self.PlayerExpBook) do
        _ReturnExp = _ReturnExp + v.BookExp * v.BookSelectSum

        self.ItemObj[i][4]:SetActive(v.BookSelectSum > 0)
        self.ItemObj[i][5].text = v.BookSelectSum
    end

    --显示当前选择的经验书数量
    self.Text_UseCount().text = self.CurSelectItem.BookSelectSum
    return _ReturnExp
end
---根据输入经验获取当前经验书数量
function M:GetBookByExp(exp,residual)
    if exp <= 0 then
        return  self.count
    end
    if residual then
        self.count = math.ceil(exp/self.CurSelectItem.BookExp)
    else
        self.count = math.floor(exp/self.CurSelectItem.BookExp)
    end
    return self.count
end
---升级请求
function M:OnClickUpgrade()
    if self:GetCurSumExp() <= 0 then
        MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey("newrolelevelupgrade_ui_tips1"), 2 }, true)
        return
    end
    local item = ItemControl.GetItemByID(100001)
    if item.count < self.CostMoney then
        MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips8"), 2 }, true)
        return
    end
    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
        --溢出 self.CurHeroAttr.EXP
        MgrUI.Pop(UID.LVUpConfirmPop_UI, { tonumber(self.CurHeroAttr.EXP),
            Handle(self,function()
                local index = 1
                local goods = {}
                for i, v in pairs(self.PlayerExpBook) do
                    if v.BookSelectSum ~= 0 then
                        goods[index] = {
                            goodsID = v.BookId,
                            goodsNum = v.BookSelectSum,
                            goodsType = v.BookType
                        }
                        index = index + 1
                    end
                end
                local ExpREQ = {
                    heroID = self.CurHero.id,
                    cost = goods
                }
                ---序列化
                local bytes = assert(pb.encode('PBClient.ClientHeroLevelUPREQ', ExpREQ))
                ItemControl.AckError = true
                HeroControl.AckError = true
                TaskControl.AckError = true
                ---发送数据
                MgrNet.SendReq(MID.CLIENT_HERO_LEVEL_UP_REQ, bytes, 0, nil, Handle(self, self.ReceiveLevelUpACK), Handle(self, self.ReceiveLevelUpNTF))
            end)
        }, true)
    else
        local index = 1
        local goods = {}
        for i, v in pairs(self.PlayerExpBook) do
            if v.BookSelectSum ~= 0 then
                goods[index] = {
                    goodsID = v.BookId,
                    goodsNum = v.BookSelectSum,
                    goodsType = v.BookType
                }
                index = index + 1
            end
        end
        local ExpREQ = {
            heroID = self.CurHero.id,
            cost = goods
        }
        ---序列化
        local bytes = assert(pb.encode('PBClient.ClientHeroLevelUPREQ', ExpREQ))
        ItemControl.AckError = true
        HeroControl.AckError = true
        TaskControl.AckError = true
        ---发送数据
        MgrNet.SendReq(MID.CLIENT_HERO_LEVEL_UP_REQ, bytes, 0, nil, Handle(self, self.ReceiveLevelUpACK), Handle(self, self.ReceiveLevelUpNTF))
    end
end
---升级成功返回
function M:ReceiveLevelUpACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroLevelUPACK', buffer))
    if tab.errNo ~= 0 then
        print(tab.errNo)
    end
end
function M:ReceiveLevelUpNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroLevelUPNTF', buffer))
    self:SuccessRecivePanel()
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    ItemControl.PushGroupItemData(tab.cost, ItemControl.PushEnum.consume)
    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)

    ---更新人物属性
    self.CurHero = RoleCardViewModel.CurrentHero ---当前选择角色
    self.UnChangedHeroAttr = self.CurHero:GetHeroAttr()  ---当前英雄属性(不变)
    ---打开成功界面
    self.SuccessPanel().gameObject:SetActive(true)
    self:SwitchPanel(self.RoleLvUpSuccessPanel())
    ---升级成功
    self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text109")
    ---播放升级语音
    RoleCardViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetRoleWords(self.CurHero.skin,PosterGirlViewModel.WordsType.LvUp))
    self:InitUpGrade()
end
---升级成功界面
function M:SuccessRecivePanel()
    MgrSound.PlayEffect("yx_ui_qianghua_01", 1, nil, false)
    self.OriginLVText().text = self.UnChangedHeroAttr.LV
    self.TargetLVText().text = self.CurHeroAttr.LV
    self.SuccessCurHpText().text = self.UnChangedHeroAttr.HP
    self.TargetHpText().text = self.CurHeroAttr.HP
    ---判断职业类型
    if self.CurHeroAttr.Occupation == 4 then
        self.LvAtkNameText().text = MgrLanguageData.GetLanguageByKey("coreattrdata_support")
        MgrRes.LoadSprite(self.Lv_icon2(), "Attribute/GearInfoIcon_8")
        self.TargetAtkZhiYuanText().text = "" .. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart) .. "%"
        self.OriginAtkZhiYuanText().text = "" .. self:GetInfoCorrect(self.UnChangedHeroAttr.RealSuppart) .. "%"
    else
        self.LvAtkNameText().text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        MgrRes.LoadSprite(self.Lv_icon2(), "Attribute/GearInfoIcon_0")
        self.TargetAtkZhiYuanText().text = "" .. math.floor(self.CurHeroAttr.RealAtk)
        self.OriginAtkZhiYuanText().text = "" .. math.floor(self.UnChangedHeroAttr.RealAtk)
    end
end
-----------------------------角色突破-----------------------------------
---初始化突破界面
function M:InitStarUp()
    self.CurType = "StarUpGrade"
    ---角色突破
    self.Text_TitleCn().text = MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_risingstar")
    ---角色升星后的属性
    self.CurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star + 1, 0, self.CurHero.awaken)
    self.CanUpStar = true
    ---角色升星等级提醒
    self:StarUpLimit(self.CurHeroAttr)

    self:InitStarPreview()
    self:InitStarNeedPanel()
    self:InitTuPoSkillName(self.CurHero.star + 1)
end
function M:StarUpLimit(heroAttr)
    local tab = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level]
    local strMaxStar = tab[7]
    local strStar = string.split(strMaxStar,",")
    local starLimit
    for i,v in pairs(strStar) do
        if tonumber(string.split(v,"_")[1]) == heroAttr.Rank then
            starLimit = tonumber(string.split(v,"_")[2])
        end
    end
    local strPlayerLevel = tab[8]
    local strLevel = string.split(strPlayerLevel,",")
    local levelLimit
    if strPlayerLevel ~= "0" then
        for i,v in pairs(strLevel) do
            if tonumber(string.split(v,"_")[1]) == heroAttr.Rank then
                levelLimit = tonumber(string.split(v,"_")[2])
                break
            end
        end
        if heroAttr.StartLV - 1 >= starLimit and PlayerControl.GetPlayerData().level < levelLimit then
            self.Text_Juexingixianzhi().text = string.format(MgrLanguageData.GetLanguageByKey("ui_dengjisuo_text2"),levelLimit)
            self.Text_Juexingixianzhi().gameObject:SetActive(true)
        else
            self.Text_Juexingixianzhi().gameObject:SetActive(false)
        end
    else
        self.Text_Juexingixianzhi().gameObject:SetActive(false)
    end
end
--突破技能显示
function M:InitTuPoSkillName(start)
    self.TupoSkillNamePanel().gameObject:SetActive(false)
    self.Text_Huodejineng().gameObject:SetActive(false)
    if start ~= 3 then
        return
    end
    local tSkillList = SkillDetailControl.GetSkillListByID(self.CurHero.id)
    local specialEquip = EquipControl.GetSingleSpecialEquip(self.CurHero.id)
    tSkillList = SkillDetailControl.SortSkillList(tSkillList,specialEquip)    ---根据角色进阶共鸣装备替换技能简略表
    local t
    for index, value in ipairs(tSkillList) do
        if value.SkillNum == 3 then
            t = value
            break
        end
    end
    if t then
        self.TupoSkillNamePanel().gameObject:SetActive(true)
        self.Text_Huodejineng().gameObject:SetActive(true)
        self.Text_TupoSkillName().text = t.GroupName[0]
    end
end


----初始化预览
function M:InitStarPreview()
    self.Star_JueXingStar().gameObject:SetActive(false)
    self.Star_Star().gameObject:SetActive(false)
    self.Star_CostItem().gameObject:SetActive(false)

    if self.UnChangedHeroAttr.IsAwaken == true then
        self:InitStar(self.Star_StarPanel().gameObject, self.Star_JueXingStar().gameObject, self.CurHeroAttr.StartLV)
    else
        self:InitStar(self.Star_StarPanel().gameObject, self.Star_Star().gameObject, self.CurHeroAttr.StartLV)
    end

    --if self.CurHeroAttr.StartLV == 3 then
    --    Tools.UIDoLocalScale(self.Star_StarPanel().gameObject, 1, 0.6, 0, 0, 0, 0, 0)
    --elseif self.CurHeroAttr.StartLV == 2 then
    --    Tools.UIDoLocalScale(self.Star_StarPanel().gameObject, 1, 0.5, 0, 0, 0, 0, 0)
    --else
    --    Tools.UIDoLocalScale(self.Star_StarPanel().gameObject, 1, 1, 0, 0, 0, 0, 0)
    --end

    local CurLower = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax, self.UnChangedHeroAttr.StartLV, 0, self.CurHero.awaken)
    local CurHigher = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax + 1, self.UnChangedHeroAttr.StartLV, 0, self.CurHero.awaken)

    local TargetLower = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax, self.CurHeroAttr.StartLV, 0, self.CurHero.awaken)
    local TargetHigher = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax + 1, self.CurHeroAttr.StartLV, 0, self.CurHero.awaken)

    if self.CurHeroAttr.Occupation == 4 then
        local curtxt = self:GetCorrectRate(CurHigher.RealSuppart - CurLower.RealSuppart)
        local tartxt = self:GetCorrectRate(TargetHigher.RealSuppart - TargetLower.RealSuppart)
        self.StarAtkNameTxt().text = MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_supportgrow")
        self.StarOriginAtkText().text = "" .. (curtxt * 100) .. "%"
        self.StarPreviewAtkText().text = "" .. (tartxt * 100) .. "%"
        self.StarOriginAtkText().fontSize = self.StarPreviewAtkText().fontSize
    else
        local curtxt = CurHigher.RealAtk - CurLower.RealAtk
        local tartxt = TargetHigher.RealAtk - TargetLower.RealAtk
        self.StarAtkNameTxt().text = MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_attackgrow")
        self.StarOriginAtkText().text = "" .. string.format("%.1f",curtxt)
        self.StarPreviewAtkText().text = "" .. string.format("%.1f",tartxt)
    end
    --更新文本信息
    self.OriginLvText().text = self.UnChangedHeroAttr.LvMax .. "/" .. self.UnChangedHeroAttr.LvMax
    self.PreviewLvText().text = self.UnChangedHeroAttr.LvMax .. "/" .. self.CurHeroAttr.LvMax

    local curhptxt = CurHigher.HP - CurLower.HP
    local tarhptxt = TargetHigher.HP - TargetLower.HP
    local subHP = ReadData.GetRoleHP(self.CurHero.id, 2, self.CurHeroAttr.StartLV, 0, self.CurHero.awaken) - ReadData.GetRoleHP(self.CurHero.id, 1, self.CurHeroAttr.StartLV, 0, self.CurHero.awaken)

    self.StarOriginHpText().text = "" .. curhptxt
    self.StarPreviewHpText().text = "" .. subHP
end
---初始化玩家资源
function M:InitStarNeedPanel()
    local countIndex = 0
    if self.UnChangedHeroAttr.StartLV >= 6 then
        return
    end
    local StarCostTab1 = {}
    Tools.ClearAllChild(self.Star_CostItemPanel().gameObject)
    for i, v in pairs(RoleattristarupLocalData.tab) do
        if self.UnChangedHeroAttr.Rank == v[2] and self.UnChangedHeroAttr.StartLV == v[3] then
            StarCostTab1 = JNStrTool.strSplit(",", v[4])
        end
    end
    for key, value in pairs(StarCostTab1) do
        local obj = GameObject.Instantiate(self.Star_CostItem().gameObject, self.Star_CostItemPanel().transform)
        obj:SetActive(true)

        local StarCostTab2 = JNStrTool.strSplit("_", value)
        ---获取背包数据
        local BagItem = ItemControl.GetItemByID(tonumber(StarCostTab2[2]))
        ---更新道具数据
        self:UpdataItem(obj, BagItem)

        local CostCount = obj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
        if BagItem.count < tonumber(StarCostTab2[3]) then
            CostCount.text = "<color=#FF3552>" .. JNStrTool.numberAbbr(BagItem.count) .. "</color>/" .. StarCostTab2[3]
            countIndex = countIndex + 1
        else
            CostCount.text = "<color=#35FFEA>" .. JNStrTool.numberAbbr(BagItem.count) .. "</color>/" .. StarCostTab2[3]
        end
        UIEvent.LuaClick(obj, Handle(self, function()
            MgrUI.Pop(UID.ItemDetailPop_UI, { BagItem, false, function()
            end }, true)
        end))
    end
    if countIndex > 0 then
        self.CanUpStar = false
    else
        self.CanUpStar = true
    end
end
function M:OnClickUpStar()
    if not self.CanUpStar then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_tips1"), 2 }, true)
        return
    end
    local UpStarREQ = {
        heroID = self.CurHero.id,
        heroStar = self.UnChangedHeroAttr.StartLV
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroStarREQ', UpStarREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_STAR_REQ, bytes, 0, nil, Handle(self, self.ReceiveUpStarACK), Handle(self, self.ReceiveUpStarNTF))
end
---升星回调
function M:ReceiveUpStarACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroStarACK', buffer))
    if tab.errNo ~= 0 then
        print(tab.errNo)
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_dengjisuo_text1"),2},true)
    end
end
function M:ReceiveUpStarNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroStarNTF', buffer))
   
    self:StarUpSuccessPanel()
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    ItemControl.PushGroupItemData(tab.cost, ItemControl.PushEnum.consume)
    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)
    ---突破成功
    self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text99")
    ---播放升星语音
    RoleCardViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetRoleWords(self.CurHero.skin,PosterGirlViewModel.WordsType.StarUp))
    
    self.SuccessPanel().gameObject:SetActive(true)
    self:SwitchPanel(self.RoleStarUpSuccessPanel())
end
--初始化升星成功
function M:StarUpSuccessPanel()
    MgrSound.PlayEffect("yx_ui_qianghua_01", 1, nil, false)

    --if NoviceViewModel.CurTaskId ~= 22008 then
    --    RoleCardViewModel.PlayRoleVoice(7)
    --end

    self.SuccessStar().gameObject:SetActive(false)
    self.SuccessStarJueXing().gameObject:SetActive(false)

    if self.UnChangedHeroAttr.IsAwaken == true then
        self:InitStar(self.SuccessStarPanel().gameObject, self.SuccessStarJueXing().gameObject, self.CurHeroAttr.StartLV)
    else
        self:InitStar(self.SuccessStarPanel().gameObject, self.SuccessStar().gameObject, self.CurHeroAttr.StartLV)
    end

    local CurLower = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax, self.UnChangedHeroAttr.StartLV, 0, self.CurHero.awaken)
    local CurHigher = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax + 1, self.UnChangedHeroAttr.StartLV, 0, self.CurHero.awaken)

    local TargetLower = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax, self.CurHeroAttr.StartLV, 0, self.CurHero.awaken)
    local TargetHigher = ReadData.GetRoleAttr(self.CurHero.id, self.UnChangedHeroAttr.LvMax + 1, self.CurHeroAttr.StartLV, 0, self.CurHero.awaken)

    if self.UnChangedHeroAttr.Occupation == 4 then
        local curtxt = self:GetCorrectRate(CurHigher.RealSuppart - CurLower.RealSuppart)
        local tartxt = self:GetCorrectRate(TargetHigher.RealSuppart - TargetLower.RealSuppart)
        self.SuccAtkZyNameText().text = MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_supportgrow")
        self.SuccCurAtkZyText().text = "" .. (curtxt * 100) .. "%"
        self.SuccTargetAtkZyText().text = "" .. (tartxt * 100) .. "%"
    else
        local curtxt = CurHigher.RealAtk - CurLower.RealAtk
        local tartxt = TargetHigher.RealAtk - TargetLower.RealAtk
        self.SuccAtkZyNameText().text = MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_attackgrow")
        self.SuccCurAtkZyText().text = "" .. curtxt
        self.SuccTargetAtkZyText().text = "" .. tartxt
    end
    --更新文本信息
    self.SuccCurLvText().text = self.UnChangedHeroAttr.LvMax .. "/" .. self.UnChangedHeroAttr.LvMax
    self.SuccTargetLvText().text = self.UnChangedHeroAttr.LvMax .. "/" .. self.CurHeroAttr.LvMax

    local curhptxt = CurHigher.HP - CurLower.HP
    local tarhptxt = TargetHigher.HP - TargetLower.HP

    self.SuccCurHpText().text = "" .. curhptxt
    self.SuccTargetHpText().text = "" .. tarhptxt
end
-----------------------------角色觉醒-----------------------------------
function M:InitAwaken()
    self.CurType = "Awaken"
    ---角色觉醒
    self.Text_TitleCn().text = MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_awake")
    
    self.CurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, 0, true)
    self.CanJX = true

    self:InitAwakenPreview()
    self:InitAwakenNeedPanel()
    self:InitAwakenSkill()
end
function M:InitAwakenPreview()
    self.JX_CostItem().gameObject:SetActive(false)
    self.JX_AwakenStar().gameObject:SetActive(false)
    self.JX_StarPrefab().gameObject:SetActive(false)

    self:InitStar(self.JX_CurStarPanel().gameObject, self.JX_StarPrefab().gameObject, self.UnChangedHeroAttr.StartLV)
    self:InitStar(self.JX_AwakenStarPanel().gameObject, self.JX_AwakenStar().gameObject, self.UnChangedHeroAttr.StartLV)
    if self.UnChangedHeroAttr.Occupation == 4 then
        self.JXZhiYuanIcon().gameObject:SetActive(true)
        self.JXAtkIcon().gameObject:SetActive(false)
        self.JXAtkNameTxt().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")

        self.JXCurAtkText().text = "" .. self:GetInfoCorrect(self.UnChangedHeroAttr.RealSuppart) .. "%"
        self.JXNextAtkText().text = "" .. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart) .. "%"
    else
        self.JXZhiYuanIcon().gameObject:SetActive(false)
        self.JXAtkIcon().gameObject:SetActive(true)
        self.JXAtkNameTxt().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text14")

        self.JXCurAtkText().text = "" .. math.floor(self.UnChangedHeroAttr.RealAtk)
        self.JXNextAtkText().text = "" .. math.floor(self.CurHeroAttr.RealAtk)
    end

    self.JXCurHpText().text = "" .. math.floor(self.UnChangedHeroAttr.HP)
    self.JXNextHpText().text = "" .. math.floor(self.CurHeroAttr.HP)
end
function M:InitAwakenNeedPanel()
    local countIndex = 0
    local StarCostTab1 = {}
    Tools.ClearAllChild(self.JX_CostItemPanel().gameObject)
    for i, v in pairs(RoleattriawakeningLocalData.tab) do
        if self.UnChangedHeroAttr.New_Career == v[2] and self.UnChangedHeroAttr.Rank == v[3] then
            StarCostTab1 = JNStrTool.strSplit(",", v[4])
        end
    end
    for key, value in pairs(StarCostTab1) do
        local StarCostTab2 = JNStrTool.strSplit("_", value)
        local obj = GameObject.Instantiate(self.JX_CostItem().gameObject, self.JX_CostItemPanel().transform)
        obj:SetActive(true)
        ---获取背包数据
        local BagItem = ItemControl.GetItemByID(tonumber(StarCostTab2[2]))
        ---更新道具数据
        self:UpdataItem(obj, BagItem)

        local CostCount = obj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
        if BagItem.count < tonumber(StarCostTab2[3]) then
            CostCount.text = "<color=#FF3552>" .. JNStrTool.numberAbbr(BagItem.count) .. "</color>/" .. StarCostTab2[3]
            countIndex = countIndex + 1
        else
            CostCount.text = "<color=#35FFEA>" .. JNStrTool.numberAbbr(BagItem.count).. "</color>/" .. StarCostTab2[3]
        end
        UIEvent.LuaClick(obj, Handle(self, function()
            MgrUI.Pop(UID.ItemDetailPop_UI, { BagItem, false, function()
            end }, true)
        end))
    end
    if countIndex > 0 then
        self.CanJX = false
    else
        self.CanJX = true
    end
end
function M:InitAwakenSkill()
    local tSkillList = SkillDetailControl.GetSkillListByID(self.CurHero.id)
    tSkillList = SkillDetailControl.SortSkillList(tSkillList,nil)
    local tAwakenSkill = nil
    local tMarkLv = 0
    for i, v in pairs(tSkillList) do
        local tSkillD = v.SkillList[v.UnlockLv[1]]
        if SkillLocalData.tab[tSkillD[1]][8] == 1 then
            tAwakenSkill = v
            for i, lv in ipairs(v.UnlockLv) do
                if self.CurHeroAttr.SkillLV >= lv then
                    tMarkLv = lv
                end
            end
            break
        end
    end
    self.Text_SkillName().text = tAwakenSkill.GroupName[tMarkLv]
    --self.Text_Jinengshuoming().text = tAwakenSkill.Tips[tMarkLv]
--[[    ---技能进阶
    for i, v in ipairs(tAwakenSkill.SkillLvStage) do
        if self.CurHeroAttr.SkillLV >= v then
            if self.CurHero:CheckHeroEquipIsMax() then
                self:CreatStar(self.JinengdianPanel(),self.Img_Jinengdian2())
            else
                self:CreatStar(self.JinengdianPanel(),self.Img_Jinengdian1())
            end
        else
            self:CreatStar(self.JinengdianPanel(),self.Img_Jinengdian_hui())
        end
    end]]
end
---觉醒请求
function M:OnClickJueXing()
    if not self.CanJX then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("rolejuexing_ui_tips1"), 2 }, true)
        return
    end
    local JueXingREQ = {
        heroID = self.CurHero.id
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroAwakenREQ', JueXingREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_AWAKEN_REQ, bytes, 0, nil, Handle(self, self.ReceiveJueXingACK), Handle(self, self.ReceiveJueXingNTF))
end
function M:ReceiveJueXingACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroAwakenACK', buffer))
    if tab.errNo ~= 0 then
        print(tab.errNo)
    end
end
function M:ReceiveJueXingNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroAwakenNTF', buffer))
    self:JueXingSuccessPanel()
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    ItemControl.PushGroupItemData(tab.cost, ItemControl.PushEnum.consume)
    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)
    ---觉醒成功
    self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text120")
    ---播放觉醒语音
    RoleCardViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetRoleWords(self.CurHero.skin,PosterGirlViewModel.WordsType.Awaken))

    self.SuccessPanel().gameObject:SetActive(true)
    self:SwitchPanel(self.RoleJuxXingSuccessPanel())
end
---觉醒成功界面
function M:JueXingSuccessPanel()
    -- statements
    MgrSound.PlayEffect("yx_ui_qianghua_01", 1, nil, false)
    --RoleCardViewModel.PlayRoleVoice(8)

    self.JX_SuccessStar().gameObject:SetActive(false)

    self:InitStar(self.JX_SuccessStarPanel().gameObject, self.JX_SuccessStar().gameObject, self.UnChangedHeroAttr.StartLV)

    if self.UnChangedHeroAttr.Occupation == 4 then
        self.JX_AtkZhiYuanName().text = MgrLanguageData.GetLanguageByKey("coreattrdata_support")
        MgrRes.LoadSprite(self.JX_icon2(), "Attribute/GearInfoIcon_8")
        self.JX_CurSuccAtkZhiYuanText().text = "" .. self:GetInfoCorrect(self.UnChangedHeroAttr.RealSuppart) .. "%"
        self.JX_NextSuccAtkZhiYuanText().text = "" .. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart) .. "%"
    else
        self.JX_AtkZhiYuanName().text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        MgrRes.LoadSprite(self.JX_icon2(), "Attribute/GearInfoIcon_0")
        self.JX_CurSuccAtkZhiYuanText().text = "" .. math.floor(self.UnChangedHeroAttr.RealAtk)
        self.JX_NextSuccAtkZhiYuanText().text = "" .. math.floor(self.CurHeroAttr.RealAtk)
    end

    self.JX_SuccessCurHpText().text = "" .. math.floor(self.UnChangedHeroAttr.HP)
    self.JX_SuccessNextHpText().text = "" .. math.floor(self.CurHeroAttr.HP)
end

function M:AddNoviceEvent()
    Event.Clear("NoviceLVOnce")
    Event.Add("NoviceLVOnce",function()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickAddExpBook(self.CurSelectItem)
        self.Int_HasClick = 1
        self.Bool_IsAdd = true
        self.IsEndLoopToInput = false
        self:LoopInput()
        NoviceViewModel.DoNext()
    end)

    Event.Clear("NoviceLVUPSecond")
    Event.Add("NoviceLVUPSecond",function()
        NoviceViewModel.DoNext(function()
            self.IsNoviceUp = true
            self:OnClickUpgrade()
        end)
    end)
end

function M:OnClose()
    Event.Go("YiguiSwitch")
end

return M