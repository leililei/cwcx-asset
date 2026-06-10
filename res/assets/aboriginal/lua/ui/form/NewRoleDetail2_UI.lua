-- Code Auto Create Begin
local M = Class('NewRoleDetail2_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewRoleDetail2_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewRoleDetail2_UI].prefab'
    self.Name = 'Form[NewRoleDetail2_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NomalBg','NomalBg',2},{'GearBg','GearBg',2},{'RolePanel','RolePanel',2},{'BackGround','RolePanel/BackGround',2},{'LihuiPanel','RolePanel/LihuiPanel',2},{'LihuiSpinePanel','RolePanel/LihuiPanel/LihuiSpinePanel',2},{'RoleSpineClickArea','RolePanel/LihuiPanel/LihuiSpinePanel/RoleSpineClickArea',2},{'FrontSprite','RolePanel/FrontSprite',2},{'UI_Canvas','UI_Canvas',2},{'Img_Zhezhao','UI_Canvas/Img_Zhezhao',2},{'Img_xian','UI_Canvas/Img_xian',2},{'UpperBtnPanel','UI_Canvas/UpperBtnPanel',2},{'Img_Fenggexian','UI_Canvas/UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','UI_Canvas/UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu','UI_Canvas/UpperBtnPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UI_Canvas/UpperBtnPanel/ReturnBg/Btn_Back',2},{'Btn_Help','UI_Canvas/UpperBtnPanel/Btn_Help',2},{'Btn_Fenxiang','UI_Canvas/UpperBtnPanel/Btn_Fenxiang',2},{'SwitchPanel','UI_Canvas/SwitchPanel',2},{'BtnBlueprint','UI_Canvas/SwitchPanel/BtnBlueprint',2},{'Line','UI_Canvas/SwitchPanel/BtnBlueprint/Line',2},{'ImgBlueprintLock','UI_Canvas/SwitchPanel/BtnBlueprint/ImgBlueprintLock',2},{'SwitchGear','UI_Canvas/SwitchPanel/SwitchGear',2},{'Btn_Switch','UI_Canvas/SwitchPanel/SwitchGear/Btn_Switch',2},{'Line01','UI_Canvas/SwitchPanel/SwitchGear/Btn_Switch/Line',2},{'Btn_SwitchHighLight','UI_Canvas/SwitchPanel/SwitchGear/Btn_SwitchHighLight',2},{'Line02','UI_Canvas/SwitchPanel/SwitchGear/Btn_SwitchHighLight/Line',2},{'Btn_GearLock','UI_Canvas/SwitchPanel/SwitchGear/Btn_GearLock',2},{'Btn_LockGear','UI_Canvas/SwitchPanel/SwitchGear/Btn_GearLock/Btn_LockGear',2},{'SwitchVoid','UI_Canvas/SwitchPanel/SwitchVoid',2},{'Btn_Switch01','UI_Canvas/SwitchPanel/SwitchVoid/Btn_Switch',2},{'Line03','UI_Canvas/SwitchPanel/SwitchVoid/Btn_Switch/Line',2},{'RedDotIcon_Void','UI_Canvas/SwitchPanel/SwitchVoid/Btn_Switch/RedDotIcon_Void',2},{'Btn_SwitchHighLight01','UI_Canvas/SwitchPanel/SwitchVoid/Btn_SwitchHighLight',2},{'Line04','UI_Canvas/SwitchPanel/SwitchVoid/Btn_SwitchHighLight/Line',2},{'Btn_VoidLock','UI_Canvas/SwitchPanel/SwitchVoid/Btn_VoidLock',2},{'Btn_LockVoid','UI_Canvas/SwitchPanel/SwitchVoid/Btn_VoidLock/Btn_LockVoid',2},{'SwitchSkill','UI_Canvas/SwitchPanel/SwitchSkill',2},{'Btn_Switch02','UI_Canvas/SwitchPanel/SwitchSkill/Btn_Switch',2},{'Line05','UI_Canvas/SwitchPanel/SwitchSkill/Btn_Switch/Line',2},{'RedDotIcon','UI_Canvas/SwitchPanel/SwitchSkill/Btn_Switch/RedDotIcon',2},{'Btn_SwitchHighLight02','UI_Canvas/SwitchPanel/SwitchSkill/Btn_SwitchHighLight',2},{'Line06','UI_Canvas/SwitchPanel/SwitchSkill/Btn_SwitchHighLight/Line',2},{'SwitchInfo','UI_Canvas/SwitchPanel/SwitchInfo',2},{'Btn_Switch03','UI_Canvas/SwitchPanel/SwitchInfo/Btn_Switch',2},{'Line07','UI_Canvas/SwitchPanel/SwitchInfo/Btn_Switch/Line',2},{'RedDotIcon01','UI_Canvas/SwitchPanel/SwitchInfo/Btn_Switch/RedDotIcon',2},{'Btn_SwitchHighLight03','UI_Canvas/SwitchPanel/SwitchInfo/Btn_SwitchHighLight',2},{'Line08','UI_Canvas/SwitchPanel/SwitchInfo/Btn_SwitchHighLight/Line',2},{'RoleInfoPanel','UI_Canvas/RoleInfoPanel',2},{'GroupIconImgBg','UI_Canvas/RoleInfoPanel/GroupIconImgBg',2},{'GroupIconImg','UI_Canvas/RoleInfoPanel/GroupIconImgBg/GroupIconImg',2},{'Btn_Favorability','UI_Canvas/RoleInfoPanel/Btn_Favorability',2},{'Btn_Story','UI_Canvas/RoleInfoPanel/Btn_Story',2},{'Btn_Qinxin','UI_Canvas/RoleInfoPanel/Btn_Qinxin/Btn_Qinxin',2},{'Qinxin','UI_Canvas/RoleInfoPanel/Btn_Qinxin/Btn_Qinxin/Qinxin',2},{'Qinxin_H','UI_Canvas/RoleInfoPanel/Btn_Qinxin/Btn_Qinxin/Qinxin_H',2},{'Btn_Xihuan','UI_Canvas/RoleInfoPanel/Btn_Xihuan/Btn_Xihuan',2},{'Xihuan','UI_Canvas/RoleInfoPanel/Btn_Xihuan/Btn_Xihuan/Xihuan',2},{'Xihuan_H','UI_Canvas/RoleInfoPanel/Btn_Xihuan/Btn_Xihuan/Xihuan_H',2},{'Btn_Yigui','UI_Canvas/Btn_Yigui',2},{'Yiguiicon','UI_Canvas/Btn_Yigui/Yiguiicon',2},{'InfoPanel','UI_Canvas/InfoPanel',2},{'ProTypeImg','UI_Canvas/InfoPanel/RoleLevelPanel/ProTypeImg',2},{'Chenghao','UI_Canvas/InfoPanel/RoleLevelPanel/Chenghao',2},{'RoleNameBG','UI_Canvas/InfoPanel/RoleLevelPanel/RoleNameBG',2},{'StarPrefabJueXing','UI_Canvas/InfoPanel/RoleLevelPanel/StarPrefabJueXing',2},{'StarPrefab','UI_Canvas/InfoPanel/RoleLevelPanel/StarPrefab',2},{'StarPanel','UI_Canvas/InfoPanel/RoleLevelPanel/StarPanel',2},{'Jingyantiao','UI_Canvas/InfoPanel/RoleLevelPanel/Jingyantiao',2},{'tiao','UI_Canvas/InfoPanel/RoleLevelPanel/Jingyantiao/tiao',2},{'Btn_Yulan','UI_Canvas/InfoPanel/RoleLevelPanel/Btn_Yulan',2},{'Tap1','UI_Canvas/InfoPanel/RoleLevelPanel/JueSeDingWei/Tap1',2},{'Tap2','UI_Canvas/InfoPanel/RoleLevelPanel/JueSeDingWei/Tap2',2},{'Hp','UI_Canvas/InfoPanel/RoleInfoPanel/Hp',2},{'HpIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Hp/HpIcon',2},{'Atk','UI_Canvas/InfoPanel/RoleInfoPanel/Atk',2},{'AtkIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Atk/AtkIcon',2},{'Zhiyuan','UI_Canvas/InfoPanel/RoleInfoPanel/Zhiyuan',2},{'ZhiyuanIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Zhiyuan/ZhiyuanIcon',2},{'Def','UI_Canvas/InfoPanel/RoleInfoPanel/Def',2},{'DefIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Def/DefIcon',2},{'Baoji','UI_Canvas/InfoPanel/RoleInfoPanel/Baoji',2},{'BaojiIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Baoji/BaojiIcon',2},{'Baoshang','UI_Canvas/InfoPanel/RoleInfoPanel/Baoshang',2},{'BaoshangIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Baoshang/BaoshangIcon',2},{'Mingjie','UI_Canvas/InfoPanel/RoleInfoPanel/Mingjie',2},{'MingjieIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Mingjie/MingjieIcon',2},{'Btn_Shengji2','UI_Canvas/InfoPanel/RoleInfoPanel/Btn_Shengji2',2},{'StarRedDotIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Btn_Shengji2/StarRedDotIcon',2},{'Btn_Shengji1','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Shengji1',2},{'Shengji_Suo','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Shengji1/ShengjiPanel/Shengji_Suo',2},{'StarRedDotIcon01','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Shengji1/StarRedDotIcon',2},{'Btn_Juexing','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Juexing',2},{'Jx_Suo','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Juexing/JxPanel/Jx_Suo',2},{'JXRedDotIcon','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Juexing/JXRedDotIcon',2},{'SkillPanel','UI_Canvas/SkillPanel',2},{'RoleRankBG','UI_Canvas/SkillPanel/RoleRankPanel/RoleRankBG',2},{'Btn_ReduceRank','UI_Canvas/SkillPanel/RoleRankPanel/Btn_ReduceRank',2},{'ReduceIcon','UI_Canvas/SkillPanel/RoleRankPanel/Btn_ReduceRank/ReduceIcon',2},{'Btn_SkillHelp','UI_Canvas/SkillPanel/RoleRankPanel/Btn_SkillHelp',2},{'Img_Jinengfanwei','UI_Canvas/SkillPanel/RoleRankPanel/Fanwei/Img_Jinengfanwei',2},{'Img_Fanwei','UI_Canvas/SkillPanel/RoleRankPanel/Fanwei/Img_Jinengfanwei/Img_Fanwei',2},{'Img_Mubiaofanwei','UI_Canvas/SkillPanel/RoleRankPanel/Fanwei/Img_Mubiaofanwei',2},{'Img_Mubiao','UI_Canvas/SkillPanel/RoleRankPanel/Fanwei/Img_Mubiaofanwei/Img_Mubiao',2},{'Img_xian01','UI_Canvas/SkillPanel/RoleSkillPanel/Img_xian',2},{'Img_di','UI_Canvas/SkillPanel/RoleSkillPanel/Img_di',2},{'SkillContent','UI_Canvas/SkillPanel/RoleSkillPanel/SkillScroll/SkillContent',2},{'Btn_Jinengqianghua','UI_Canvas/SkillPanel/RoleSkillPanel/Btn_Jinengqianghua',2},{'Btn_SkillLock','UI_Canvas/SkillPanel/RoleSkillPanel/Btn_Jinengqianghua/content/Btn_SkillLock',2},{'Btn_LockSkill','UI_Canvas/SkillPanel/RoleSkillPanel/Btn_Jinengqianghua/content/Btn_SkillLock/Btn_LockSkill',2},{'SkillRedDotIcon','UI_Canvas/SkillPanel/RoleSkillPanel/Btn_Jinengqianghua/SkillRedDotIcon',2},{'VoidPanel','UI_Canvas/VoidPanel',2},{'VoidPanel01','UI_Canvas/VoidPanel',2},{'VoidPanel02','UI_Canvas/VoidPanel',2},{'VoidPanel03','UI_Canvas/VoidPanel',2},{'VoidGearPanel','UI_Canvas/VoidPanel/VoidGearPanel',2},{'VoidGearLvDotPanel','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearLvDotPanel',2},{'VoidGearLvDotPrefab','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearLvDotPrefab',2},{'Img_xian02','UI_Canvas/VoidPanel/VoidGearPanel/Img_xian',2},{'Img_Shuxingdi','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearPrefab/Img_Shuxingdi',2},{'VoidIconBG','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearPrefab/VoidIconBG',2},{'VoidGearIcon','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearPrefab/VoidGearIcon',2},{'VoidIconPanel','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel',2},{'jijiadi','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel/jijiadi',2},{'VoidGearIcon01','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel/VoidGearIcon',2},{'EmptyVoidGearIcon','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel/EmptyVoidGearIcon',2},{'EmptyPanel','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel/EmptyVoidGearIcon/EmptyPanel',2},{'yuankuang','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel/yuankuang',2},{'VoidGearRankIcon','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel/VoidGearRankIcon',2},{'VoidPanelLayout','UI_Canvas/VoidPanel/VoidPanelLayout',2},{'VoidPanelLayout01','UI_Canvas/VoidPanel/VoidPanelLayout',2},{'Btn_Tupo','UI_Canvas/VoidPanel/Btn_Tupo',2},{'StarRedDotIcon02','UI_Canvas/VoidPanel/Btn_Tupo/StarRedDotIcon',2},{'VoidPanel2','UI_Canvas/VoidPanel2',2},{'VoidGearPanel01','UI_Canvas/VoidPanel2/VoidGearPanel',2},{'Img_Chaoxianxing1','UI_Canvas/VoidPanel2/VoidGearPanel/Img_Chaoxianxing1',2},{'Img_Chaoxianxing2','UI_Canvas/VoidPanel2/VoidGearPanel/Img_Chaoxianxing2',2},{'VoidIconPanel01','UI_Canvas/VoidPanel2/VoidGearPanel/VoidIconPanel',2},{'Img_Chaoxiantiao','UI_Canvas/VoidPanel2/VoidGearPanel/VoidIconPanel/Img_Chaoxiantiao',2},{'VoidGearRankIcon01','UI_Canvas/VoidPanel2/VoidGearPanel/VoidIconPanel/VoidGearRankIcon',2},{'VoidGearIcon02','UI_Canvas/VoidPanel2/VoidGearPanel/VoidIconPanel/VoidGearIcon',2},{'Btn_Yulan01','UI_Canvas/VoidPanel2/VoidGearPanel/Btn_Yulan',2},{'VoidAttrScrollView','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView',2},{'Viewport','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport',2},{'Content_VoidPanel2','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/Content_VoidPanel2',2},{'VoidGearAttr_VoidPanel2','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/VoidGearAttr_VoidPanel2',2},{'Img_Shuxingdi01','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/VoidGearAttr_VoidPanel2/Img_Shuxingdi',2},{'VoidAttrIconBG','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/VoidGearAttr_VoidPanel2/VoidAttrIconBG',2},{'VoidAttrIcon','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/VoidGearAttr_VoidPanel2/VoidAttrIcon',2},{'GearSkillPrefab_VoidPanel2','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2',2},{'Img_SkillXian','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSkillName/Img_SkillXian',2},{'Img_Suo','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSkillName/Img_Suo',2},{'Img_suo','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSkillName/Img_Suo/Text_Jiesuotiaojian/Img_suo',2},{'GearSubSkill_SEquip','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip',2},{'SubSkillPoint','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/SubSkillPoint',2},{'TagPanel','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/TagPanel',2},{'Img_Tag1','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/TagPanel/Img_Tag1',2},{'Img_Tag2','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/TagPanel/Img_Tag2',2},{'Img_Exception','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/Img_Exception',2},{'SkillTips','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SkillTips',2},{'TipsPanel','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/TipsPanel',2},{'Btn_SkillDetailTip','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/TipsPanel/Btn_SkillDetailTip',2},{'VoidPanelLayout02','UI_Canvas/VoidPanel2/VoidPanelLayout',2},{'VoidPanelLayout03','UI_Canvas/VoidPanel2/VoidPanelLayout',2},{'Btn_Qianghua','UI_Canvas/VoidPanel2/Btn_Qianghua',2},{'StarRedDotIcon_Qianghua','UI_Canvas/VoidPanel2/Btn_Qianghua/StarRedDotIcon_Qianghua',2},{'GearPanel','UI_Canvas/GearPanel',2},{'LeftBg','UI_Canvas/GearPanel/LeftBg',2},{'GearPanelLayout','UI_Canvas/GearPanel/GearPanelLayout',2},{'RoleGearPanel1','UI_Canvas/GearPanel/RoleGearPanel1',2},{'GearItem','UI_Canvas/GearPanel/RoleGearPanel1/GearItem',2},{'Img_Landi','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/Img_Landi',2},{'Gear_Img_Suo_hui','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/Gear_Img_Suo_hui',2},{'Gear_Img_Suo','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/Gear_Img_Suo',2},{'GearWearPanel','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearWearPanel',2},{'GearRankKuangImg','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/GearRankKuangImg',2},{'GearIconImg','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/GearIconImg',2},{'Jiaobiao','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/Jiaobiao',2},{'Pinzhi','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/Jiaobiao/Pinzhi',2},{'Xingdi','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/Xingdi',2},{'EmptyStarSpical','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical',2},{'EmptyStarSpical(1)','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (1)',2},{'EmptyStarSpical(2)','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (2)',2},{'EmptyStarSpical(3)','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (3)',2},{'EmptyStarSpical(4)','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (4)',2},{'EmptyStarSpical(5)','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (5)',2},{'EmptyGearStar','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/EmptyGearStar',2},{'GearStarPrefab','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/GearStarPrefab',2},{'GearStarSpicalPrefab','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/GearStarSpicalPrefab',2},{'GearStarPanel','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearIconPanel/GearStarPanel',2},{'GearInfoPanel','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel',2},{'GearInfoPrefab','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearInfoPrefab',2},{'Img_Shuxingdi02','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearInfoPrefab/Img_Shuxingdi',2},{'VoidIconBG01','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearInfoPrefab/VoidIconBG',2},{'GearInfoIcon','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearInfoPrefab/GearInfoIcon',2},{'GearSkillPrefab','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearSkillPrefab',2},{'Img_Shuxingdi03','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearSkillPrefab/Img_Shuxingdi',2},{'VoidIconBG02','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearSkillPrefab/VoidIconBG',2},{'VoidGearIcon03','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearSkillPrefab/VoidGearIcon',2},{'Btn_Chakan','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearSkillPrefab/Btn_Chakan',2},{'Img_Xian','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/Img_Xian',2},{'Btn_Qianghua01','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearBtnPanel/Btn_Qianghua',2},{'Btn_Xiexia','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearBtnPanel/Btn_Xiexia',2},{'BtnSuo','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/BtnSuo',2},{'GearEmptyItem','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem',2},{'BlankIcon1','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/GearIconPanel/BlankIcon1',2},{'empty','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/empty',2},{'Btn_Qianghua02','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/GearBtnPanel/Btn_Qianghua',2},{'Btn_Xiexia01','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/GearBtnPanel/Btn_Xiexia',2},{'Img_Xian01','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/Img_Xian',2},{'Img_Num','UI_Canvas/GearPanel/RoleGearPanel1/Img_Num',2},{'RoleGearPanel2','UI_Canvas/GearPanel/RoleGearPanel2',2},{'GearItem01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem',2},{'Img_Landi01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/Img_Landi',2},{'Gear_Img_Suo_hui01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/Gear_Img_Suo_hui',2},{'Gear_Img_Suo01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/Gear_Img_Suo',2},{'GearWearPanel01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearWearPanel',2},{'GearRankKuangImg01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/GearRankKuangImg',2},{'GearIconImg01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/GearIconImg',2},{'Jiaobiao01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/Jiaobiao',2},{'Pinzhi01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/Jiaobiao/Pinzhi',2},{'Xingdi01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/Xingdi',2},{'EmptyStarSpical01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical',2},{'EmptyStarSpical(1)01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (1)',2},{'EmptyStarSpical(2)01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (2)',2},{'EmptyStarSpical(3)01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (3)',2},{'EmptyStarSpical(4)01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (4)',2},{'EmptyStarSpical(5)01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/EmptyGearStarSpical/EmptyStarSpical (5)',2},{'EmptyGearStar01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/EmptyGearStar',2},{'GearStarPrefab01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/GearStarPrefab',2},{'GearStarSpicalPrefab01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/GearStarSpicalPrefab',2},{'GearStarPanel01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearIconPanel/GearStarPanel',2},{'GearInfoPanel01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel',2},{'GearInfoPrefab01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearInfoPrefab',2},{'Img_Shuxingdi04','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearInfoPrefab/Img_Shuxingdi',2},{'VoidIconBG03','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearInfoPrefab/VoidIconBG',2},{'GearInfoIcon01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearInfoPrefab/GearInfoIcon',2},{'GearSkillPrefab01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearSkillPrefab',2},{'Img_Shuxingdi05','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearSkillPrefab/Img_Shuxingdi',2},{'VoidIconBG04','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearSkillPrefab/VoidIconBG',2},{'VoidGearIcon04','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearSkillPrefab/VoidGearIcon',2},{'Btn_Chakan01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearSkillPrefab/Btn_Chakan',2},{'Img_Xian02','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/Img_Xian',2},{'Btn_Qianghua03','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearBtnPanel/Btn_Qianghua',2},{'Btn_Xiexia02','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearBtnPanel/Btn_Xiexia',2},{'BtnSuo01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/BtnSuo',2},{'GearEmptyItem01','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem',2},{'BlankIcon101','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/GearIconPanel/BlankIcon1',2},{'empty01','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/empty',2},{'Btn_Qianghua04','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/GearBtnPanel/Btn_Qianghua',2},{'Btn_Xiexia03','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/GearBtnPanel/Btn_Xiexia',2},{'Img_Xian03','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/Img_Xian',2},{'Img_Num01','UI_Canvas/GearPanel/RoleGearPanel2/Img_Num',2},{'Hp01','UI_Canvas/GearPanel/RoleInfoPanel/Hp',2},{'Img_Shuxingdi06','UI_Canvas/GearPanel/RoleInfoPanel/Hp/Img_Shuxingdi',2},{'HpIcon01','UI_Canvas/GearPanel/RoleInfoPanel/Hp/HpIcon',2},{'Atk01','UI_Canvas/GearPanel/RoleInfoPanel/Atk',2},{'Img_Shuxingdi07','UI_Canvas/GearPanel/RoleInfoPanel/Atk/Img_Shuxingdi',2},{'AtkIcon01','UI_Canvas/GearPanel/RoleInfoPanel/Atk/AtkIcon',2},{'Zhiyuan01','UI_Canvas/GearPanel/RoleInfoPanel/Zhiyuan',2},{'Img_Shuxingdi08','UI_Canvas/GearPanel/RoleInfoPanel/Zhiyuan/Img_Shuxingdi',2},{'ZhiyuanIcon01','UI_Canvas/GearPanel/RoleInfoPanel/Zhiyuan/ZhiyuanIcon',2},{'Def01','UI_Canvas/GearPanel/RoleInfoPanel/Def',2},{'Img_Shuxingdi09','UI_Canvas/GearPanel/RoleInfoPanel/Def/Img_Shuxingdi',2},{'DefIcon01','UI_Canvas/GearPanel/RoleInfoPanel/Def/DefIcon',2},{'Baoji01','UI_Canvas/GearPanel/RoleInfoPanel/Baoji',2},{'Img_Shuxingdi10','UI_Canvas/GearPanel/RoleInfoPanel/Baoji/Img_Shuxingdi',2},{'BaojiIcon01','UI_Canvas/GearPanel/RoleInfoPanel/Baoji/BaojiIcon',2},{'Baoshang01','UI_Canvas/GearPanel/RoleInfoPanel/Baoshang',2},{'Img_Shuxingdi11','UI_Canvas/GearPanel/RoleInfoPanel/Baoshang/Img_Shuxingdi',2},{'BaoshangIcon01','UI_Canvas/GearPanel/RoleInfoPanel/Baoshang/BaoshangIcon',2},{'Mingjie01','UI_Canvas/GearPanel/RoleInfoPanel/Mingjie',2},{'Img_Shuxingdi12','UI_Canvas/GearPanel/RoleInfoPanel/Mingjie/Img_Shuxingdi',2},{'MingjieIcon01','UI_Canvas/GearPanel/RoleInfoPanel/Mingjie/MingjieIcon',2},{'SwitchPanel01','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel',2},{'Img_di01','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/Img_di',2},{'Jingong','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/Jingong',2},{'Icon','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/Jingong/Icon',2},{'Fangshou','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/Fangshou',2},{'Icon01','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/Fangshou/Icon',2},{'ArmorSelect','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/ArmorSelect',2},{'SwitchRolePanel','UI_Canvas/SwitchRolePanel',2},{'Btn_NextRole','UI_Canvas/SwitchRolePanel/Btn_NextRole',2},{'Btn_PrevRole','UI_Canvas/SwitchRolePanel/Btn_PrevRole',2},{'Btn_VoidSwitch','UI_Canvas/Btn_VoidSwitch',2},{'VoidOn','UI_Canvas/Btn_VoidSwitch/VoidOn',2},{'Img_Heibian1','UI_Canvas/Img_Heibian1',2},{'Img_Heibian2','UI_Canvas/Img_Heibian2',2},{'ReduceRankPanel','UI_Canvas/ReduceRankPanel',2},{'Mask','UI_Canvas/ReduceRankPanel/Mask',2},{'Img_Xian1','UI_Canvas/ReduceRankPanel/Img_Xian1',2},{'Img_Xian2','UI_Canvas/ReduceRankPanel/Img_Xian2',2},{'Img_Tanchuangdi','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi',2},{'Btn_confirm','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_confirm',2},{'Img_Quedingdi','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_confirm/Img_Quedingdi',2},{'Btn_cancel','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_cancel',2},{'Img_Quxiaodi','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_cancel/Img_Quxiaodi',2},{'Btn_Zuo','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_Zuo',2},{'Btn_You','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_You',2},{'Img_Jiantou','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Img_Jiantou',2},{'Img_Dangqiandi','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Img_Dangqiandi',2},{'Img_Titlexian','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Text_Title/Img_Titlexian',2},{'Img_Tiaodi','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Img_Tiaodi',2},{'RankLVItem','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Scorll/RankLVItem',2},{'QRCode','UI_Canvas/QRCode',2},{'FenxiangPanel','UI_Canvas/FenxiangPanel',2},{'BlurMask2','UI_Canvas/FenxiangPanel/BlurMask2',2},{'JietuPanelParent','UI_Canvas/FenxiangPanel/JietuPanelParent',2},{'JietuPanel','UI_Canvas/FenxiangPanel/JietuPanelParent/JietuPanel',2},{'Jietu','UI_Canvas/FenxiangPanel/JietuPanelParent/JietuPanel/Jietu',2},{'Content','UI_Canvas/FenxiangPanel/Content',2},{'Btn_FB','UI_Canvas/FenxiangPanel/Content/Btn_FB',2},{'FBicon','UI_Canvas/FenxiangPanel/Content/Btn_FB/FBicon',2},{'Btn_LINE','UI_Canvas/FenxiangPanel/Content/Btn_LINE',2},{'LINEicon','UI_Canvas/FenxiangPanel/Content/Btn_LINE/LINEicon',2},{'Btn_XB','UI_Canvas/FenxiangPanel/Content/Btn_XB',2},{'XBicon','UI_Canvas/FenxiangPanel/Content/Btn_XB/XBicon',2},
        -- UITemplate 列表
        {'RoleDetail_SkillItem2','UI_Canvas/SkillPanel/RoleSkillPanel/SkillScroll/RoleDetail_SkillItem2',10},{'RankLVItem01','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Scorll/RankLVItem',10},
        -- Toggle 列表
        {'SwitchGear01','UI_Canvas/SwitchPanel/SwitchGear',13},{'SwitchVoid01','UI_Canvas/SwitchPanel/SwitchVoid',13},{'SwitchSkill01','UI_Canvas/SwitchPanel/SwitchSkill',13},{'SwitchInfo01','UI_Canvas/SwitchPanel/SwitchInfo',13},
        -- RawImage 列表
        {'SkillScroll','UI_Canvas/SkillPanel/RoleSkillPanel/SkillScroll',15},
        -- LoopScrollRect 列表
        {'SkillScroll01','UI_Canvas/SkillPanel/RoleSkillPanel/SkillScroll',18},{'Scorll','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Scorll',18},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UI_Canvas/UpperBtnPanel/Text_TitleCn',20},{'Text_TitleEn','UI_Canvas/UpperBtnPanel/Text_TitleEn',20},{'EnText','UI_Canvas/SwitchPanel/BtnBlueprint/EnText',20},{'CNText','UI_Canvas/SwitchPanel/BtnBlueprint/CNText',20},{'EnText01','UI_Canvas/SwitchPanel/SwitchGear/Btn_Switch/EnText',20},{'CNText01','UI_Canvas/SwitchPanel/SwitchGear/Btn_Switch/CNText',20},{'EnText02','UI_Canvas/SwitchPanel/SwitchGear/Btn_SwitchHighLight/EnText',20},{'CNText02','UI_Canvas/SwitchPanel/SwitchGear/Btn_SwitchHighLight/CNText',20},{'EnText03','UI_Canvas/SwitchPanel/SwitchVoid/Btn_Switch/EnText',20},{'CNText03','UI_Canvas/SwitchPanel/SwitchVoid/Btn_Switch/CNText',20},{'EnText04','UI_Canvas/SwitchPanel/SwitchVoid/Btn_SwitchHighLight/EnText',20},{'CNText04','UI_Canvas/SwitchPanel/SwitchVoid/Btn_SwitchHighLight/CNText',20},{'EnText05','UI_Canvas/SwitchPanel/SwitchSkill/Btn_Switch/EnText',20},{'CNText05','UI_Canvas/SwitchPanel/SwitchSkill/Btn_Switch/CNText',20},{'EnText06','UI_Canvas/SwitchPanel/SwitchSkill/Btn_SwitchHighLight/EnText',20},{'CNText06','UI_Canvas/SwitchPanel/SwitchSkill/Btn_SwitchHighLight/CNText',20},{'EnText07','UI_Canvas/SwitchPanel/SwitchInfo/Btn_Switch/EnText',20},{'CNText07','UI_Canvas/SwitchPanel/SwitchInfo/Btn_Switch/CNText',20},{'EnText08','UI_Canvas/SwitchPanel/SwitchInfo/Btn_SwitchHighLight/EnText',20},{'CNText08','UI_Canvas/SwitchPanel/SwitchInfo/Btn_SwitchHighLight/CNText',20},{'CurRoleFavorabilityText','UI_Canvas/RoleInfoPanel/Btn_Favorability/CurRoleFavorabilityText',20},{'Text_Haogandu','UI_Canvas/RoleInfoPanel/Btn_Favorability/Text_Haogandu',20},{'Text_Juesedangan','UI_Canvas/RoleInfoPanel/Btn_Story/Text_Juesedangan',20},{'Text_Sheweiqinxin','UI_Canvas/RoleInfoPanel/Btn_Qinxin/Text_Sheweiqinxin',20},{'Text_Sheweiqinxin01','UI_Canvas/RoleInfoPanel/Btn_Xihuan/Text_Sheweiqinxin',20},{'Text_Chenghao','UI_Canvas/InfoPanel/RoleLevelPanel/Chenghao/Text_Chenghao',20},{'RoleNameTxt','UI_Canvas/InfoPanel/RoleLevelPanel/RoleNameBG/RoleNameTxt',20},{'Text_LV','UI_Canvas/InfoPanel/RoleLevelPanel/Text_LV',20},{'Text_Dengji','UI_Canvas/InfoPanel/RoleLevelPanel/Text_Dengji',20},{'Text_Tap1','UI_Canvas/InfoPanel/RoleLevelPanel/JueSeDingWei/Tap1/Text_Tap1',20},{'Text_Tap2','UI_Canvas/InfoPanel/RoleLevelPanel/JueSeDingWei/Tap2/Text_Tap2',20},{'HpNameTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Hp/HpNameTxt',20},{'HPInfoTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Hp/HPInfoTxt',20},{'HPInfoTxtAdd','UI_Canvas/InfoPanel/RoleInfoPanel/Hp/HPInfoTxtAdd',20},{'AtkNameTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Atk/AtkNameTxt',20},{'AtkInfoTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Atk/AtkInfoTxt',20},{'AtkInfoTxtAdd','UI_Canvas/InfoPanel/RoleInfoPanel/Atk/AtkInfoTxtAdd',20},{'ZhiyuanNameTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Zhiyuan/ZhiyuanNameTxt',20},{'ZhiYuanInfoTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Zhiyuan/ZhiYuanInfoTxt',20},{'ZhiYuanInfoTxtAdd','UI_Canvas/InfoPanel/RoleInfoPanel/Zhiyuan/ZhiYuanInfoTxtAdd',20},{'DefNameTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Def/DefNameTxt',20},{'DefInfoTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Def/DefInfoTxt',20},{'DefInfoTxtAdd','UI_Canvas/InfoPanel/RoleInfoPanel/Def/DefInfoTxtAdd',20},{'BaojiNameTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Baoji/BaojiNameTxt',20},{'BaojiInfoTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Baoji/BaojiInfoTxt',20},{'BaojiInfoTxtAdd','UI_Canvas/InfoPanel/RoleInfoPanel/Baoji/BaojiInfoTxtAdd',20},{'BaoShangNameTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Baoshang/BaoShangNameTxt',20},{'BaoshangInfoTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Baoshang/BaoshangInfoTxt',20},{'BaoshangInfoTxtAdd','UI_Canvas/InfoPanel/RoleInfoPanel/Baoshang/BaoshangInfoTxtAdd',20},{'MinjieNameTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Mingjie/MinjieNameTxt',20},{'MinjieInfoTxt','UI_Canvas/InfoPanel/RoleInfoPanel/Mingjie/MinjieInfoTxt',20},{'MinjieInfoTxtAdd','UI_Canvas/InfoPanel/RoleInfoPanel/Mingjie/MinjieInfoTxtAdd',20},{'Text_Shengji','UI_Canvas/InfoPanel/RoleInfoPanel/Btn_Shengji2/Text_Shengji',20},{'Text_Shengji01','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Shengji1/ShengjiPanel/Text_Shengji',20},{'Text_Juexing','UI_Canvas/InfoPanel/RoleInfoPanel/Group/Btn_Juexing/JxPanel/Text_Juexing',20},{'Text_SkillLv','UI_Canvas/SkillPanel/RoleRankPanel/RoleRankBG/Text_SkillLv',20},{'Text_SkillLv_Small','UI_Canvas/SkillPanel/RoleRankPanel/RoleRankBG/Text_SkillLv/Text_SkillLv_Small',20},{'Text_Rank','UI_Canvas/SkillPanel/RoleRankPanel/Text_Rank',20},{'Text_SkillName','UI_Canvas/SkillPanel/RoleRankPanel/Text_SkillName',20},{'Text_Jinengfanwei','UI_Canvas/SkillPanel/RoleRankPanel/Fanwei/Img_Jinengfanwei/Text_Jinengfanwei',20},{'Text_Mubiaofanwei','UI_Canvas/SkillPanel/RoleRankPanel/Fanwei/Img_Mubiaofanwei/Text_Mubiaofanwei',20},{'Text_Mubiaoshuoming','UI_Canvas/SkillPanel/RoleRankPanel/Fanwei/Img_Mubiaofanwei/Text_Mubiaoshuoming',20},{'Text_Jinengqianghua','UI_Canvas/SkillPanel/RoleSkillPanel/Btn_Jinengqianghua/content/Text_Jinengqianghua',20},{'tishi','UI_Canvas/VoidPanel/tishi',20},{'VoidGearNameText','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearNameText',20},{'VoidGearLVText','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearLVText',20},{'VoidGearInfoText','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearPrefab/VoidGearInfoText',20},{'VoidGearText','UI_Canvas/VoidPanel/VoidGearPanel/VoidGearPrefab/VoidGearText',20},{'EmptyText','UI_Canvas/VoidPanel/VoidGearPanel/VoidIconPanel/EmptyVoidGearIcon/EmptyPanel/EmptyText',20},{'Text_Tupo','UI_Canvas/VoidPanel/Btn_Tupo/Text_Tupo',20},{'tishi01','UI_Canvas/VoidPanel2/tishi',20},{'VoidGearNameText01','UI_Canvas/VoidPanel2/VoidGearPanel/VoidGearNameText',20},{'Text_LV01','UI_Canvas/VoidPanel2/VoidGearPanel/Text_LV',20},{'Text_Dengji01','UI_Canvas/VoidPanel2/VoidGearPanel/Text_Dengji',20},{'VoidGearAttrNum','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/VoidGearAttr_VoidPanel2/VoidGearAttrNum',20},{'VoidGearAttrText','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/VoidGearAttr_VoidPanel2/VoidGearAttrText',20},{'GearSkillNameText','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSkillName/GearSkillNameText',20},{'Text_Jiesuotiaojian','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSkillName/Img_Suo/Text_Jiesuotiaojian',20},{'Text_SubSkillName','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/SubSkillPoint/Text_SubSkillName',20},{'Text_Tag','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/TagPanel/Img_Tag1/Text_Tag',20},{'Text_Tag01','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/TagPanel/Img_Tag2/Text_Tag',20},{'Text_Matter','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SubNamePanel/Img_Exception/Text_Matter',20},{'Text_Jinengshuoming','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/SkillTips/Text_Jinengshuoming',20},{'TipNameTxt','UI_Canvas/VoidPanel2/VoidGearPanel/VoidAttrPanel/VoidAttrScrollView/Viewport/GearSkillPrefab_VoidPanel2/GearSubSkill_SEquip/TipsPanel/Btn_SkillDetailTip/TipNameTxt',20},{'Text_VoidQianghua','UI_Canvas/VoidPanel2/Btn_Qianghua/Text_VoidQianghua',20},{'GearUpgradeText','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/Img_Landi/GearUpgradeText',20},{'GearNameTxt','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearNameTxt',20},{'GearInfoText','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearInfoPrefab/GearInfoText',20},{'GearInfoNameTxt','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearInfoPrefab/GearInfoNameTxt',20},{'GearSkillNameText01','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearInfoPanel/GearSkillPrefab/GearSkillNameText',20},{'Text_Qianghua','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearBtnPanel/Btn_Qianghua/Text_Qianghua',20},{'Text_Xiexia','UI_Canvas/GearPanel/RoleGearPanel1/GearItem/GearBtnPanel/Btn_Xiexia/Text_Xiexia',20},{'GearNameTxt_Empty','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/GearNameTxt_Empty',20},{'Text_Qianghua01','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/GearBtnPanel/Btn_Qianghua/Text_Qianghua',20},{'Text_Xiexia01','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/GearBtnPanel/Btn_Xiexia/Text_Xiexia',20},{'Tips','UI_Canvas/GearPanel/RoleGearPanel1/GearEmptyItem/Tips',20},{'GearUpgradeText01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/Img_Landi/GearUpgradeText',20},{'GearNameTxt01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearNameTxt',20},{'GearInfoText01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearInfoPrefab/GearInfoText',20},{'GearInfoNameTxt01','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearInfoPrefab/GearInfoNameTxt',20},{'GearSkillNameText02','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearInfoPanel/GearSkillPrefab/GearSkillNameText',20},{'Text_Qianghua02','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearBtnPanel/Btn_Qianghua/Text_Qianghua',20},{'Text_Xiexia02','UI_Canvas/GearPanel/RoleGearPanel2/GearItem/GearBtnPanel/Btn_Xiexia/Text_Xiexia',20},{'GearNameTxt_Empty01','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/GearNameTxt_Empty',20},{'Text_Qianghua03','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/GearBtnPanel/Btn_Qianghua/Text_Qianghua',20},{'Text_Xiexia03','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/GearBtnPanel/Btn_Xiexia/Text_Xiexia',20},{'Tips01','UI_Canvas/GearPanel/RoleGearPanel2/GearEmptyItem/Tips',20},{'GearTypeTxt','UI_Canvas/GearPanel/RoleInfoPanel/GearTypeTxt',20},{'HpNameTxt01','UI_Canvas/GearPanel/RoleInfoPanel/Hp/Img_Shuxingdi/HpNameTxt',20},{'HpInfoTxt','UI_Canvas/GearPanel/RoleInfoPanel/Hp/Img_Shuxingdi/HpInfoTxt',20},{'AtkNameTxt01','UI_Canvas/GearPanel/RoleInfoPanel/Atk/Img_Shuxingdi/AtkNameTxt',20},{'AtkInfoTxt01','UI_Canvas/GearPanel/RoleInfoPanel/Atk/Img_Shuxingdi/AtkInfoTxt',20},{'SupNameTxt','UI_Canvas/GearPanel/RoleInfoPanel/Zhiyuan/Img_Shuxingdi/SupNameTxt',20},{'SupInfoTxt','UI_Canvas/GearPanel/RoleInfoPanel/Zhiyuan/Img_Shuxingdi/SupInfoTxt',20},{'DefNameTxt01','UI_Canvas/GearPanel/RoleInfoPanel/Def/Img_Shuxingdi/DefNameTxt',20},{'DefInfoTxt01','UI_Canvas/GearPanel/RoleInfoPanel/Def/Img_Shuxingdi/DefInfoTxt',20},{'CritNameTxt','UI_Canvas/GearPanel/RoleInfoPanel/Baoji/Img_Shuxingdi/CritNameTxt',20},{'CritInfoTxt','UI_Canvas/GearPanel/RoleInfoPanel/Baoji/Img_Shuxingdi/CritInfoTxt',20},{'CritDmgNameTxt','UI_Canvas/GearPanel/RoleInfoPanel/Baoshang/Img_Shuxingdi/CritDmgNameTxt',20},{'CritDmgInfoTxt','UI_Canvas/GearPanel/RoleInfoPanel/Baoshang/Img_Shuxingdi/CritDmgInfoTxt',20},{'AgrNameTxt','UI_Canvas/GearPanel/RoleInfoPanel/Mingjie/Img_Shuxingdi/AgrNameTxt',20},{'AgrInfoTxt','UI_Canvas/GearPanel/RoleInfoPanel/Mingjie/Img_Shuxingdi/AgrInfoTxt',20},{'Text_Jingong','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/Jingong/Text_Jingong',20},{'Text_Fangshou','UI_Canvas/GearPanel/RoleInfoPanel/SwitchPanel/Fangshou/Text_Fangshou',20},{'Text_VoidSwitch','UI_Canvas/Btn_VoidSwitch/Text_VoidSwitch',20},{'Text_SpecialOn','UI_Canvas/Btn_VoidSwitch/Text_SpecialOn',20},{'Text_SpecialOff','UI_Canvas/Btn_VoidSwitch/Text_SpecialOff',20},{'Text_confirm','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_confirm/Text_confirm',20},{'Text_cancel','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Btn_cancel/Text_cancel',20},{'Text_Rank01','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Text_Rank',20},{'Text_Title','UI_Canvas/ReduceRankPanel/Img_Tanchuangdi/Text_Title',20},{'Text_FB','UI_Canvas/FenxiangPanel/Content/Btn_FB/Text_FB',20},{'Text_LINE','UI_Canvas/FenxiangPanel/Content/Btn_LINE/Text_LINE',20},{'Text_XB','UI_Canvas/FenxiangPanel/Content/Btn_XB/Text_XB',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillexceptionLocalData")
require("LocalData/SkilltypeoneLocalData")
require("LocalData/SkilltypetwoLocalData")
function M:OnInit()
    MgrUI.ClosePop(UID.NewRoleFormation_UI)     ---初始化时保证 NewRoleFormation_UI 界面没有打开
    self.Btn_Fenxiang().gameObject:SetActive(false)
    self.QRCode().gameObject:SetActive(false)
    self.Btn_Yulan01().gameObject:SetActive(false)
    self.GearBg().gameObject:SetActive(false)
    self.Btn_VoidSwitch().gameObject:SetActive(false)
    ---升级按钮尺寸
    self.LvUpPos = self.Btn_Shengji1().transform.localPosition
    self.LvUpSize = self.Btn_Shengji1().transform.sizeDelta
    ---当前页面角色数据
    self.CurHero = nil
    ---当前页面角色属性
    self.CurHeroAttr = nil
    ---当前好友数据
    self.CurFriendHero = nil
    ---当前好友属性
    self.CurFheroAttr = nil
    ---立绘
    self.SpineObj = nil
    self.SpinePosX = self.LihuiSpinePanel().transform.localPosition.x
    self.CurPanel = nil
    self.OffsetPosX = self.SpinePosX-250
    ---技能列表
    self.ChildSkillList = nil
    self.SkillDetail = {}
    ---核心界面组
    self.GearObj = {}
    ---核心数据
    self.GearPanelUID = {}
    self.isLocked = {}
    self.SkillRefresh = false
    ---点击区域
    self.ClickArea = {}
    ---------------------技能等级----------------------
    --技能等级选择列表
    self.SkillLevetList = {0,0,1,2,3,4,5,6,7,8,9,10,0,0}
    --当前技能等级列表
    self.CurSkillLevetList = {0,0,1,2,3}
    --当前选择的技能等级
    self.curSkillLevel = 1
    ---------------------------------------------------
    ---装备攻、防类型 0攻 1防
    RoleCardViewModel.CurArmorType = 0
    ---当前点击的序号
    self.CurTouchIdx = 1
    
    self.Btn_Shengji2().gameObject:SetActive(false)
    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)
    self.GearInfoPrefab().gameObject:SetActive(false)
    self.GearSkillPrefab().gameObject:SetActive(false)

    ---页面类型不同，展示不同UI
    ---不是自己的角色不展示一些交互按钮
    if (RoleCardViewModel.CurType == "Friend") then
        self.Btn_GoMenu().gameObject:SetActive(false)
        self.Btn_Story().gameObject:SetActive(false)
        self.Btn_Favorability().gameObject:SetActive(false)
        self.Btn_Juexing().gameObject:SetActive(false)
        self.Btn_Shengji1().gameObject:SetActive(false)
        self.Btn_Yulan().gameObject:SetActive(false)
        self.Btn_Wenhao().gameObject:SetActive(false)
        self.Btn_Jinengqianghua().gameObject:SetActive(false)
        self.Btn_FB().gameObject:SetActive(false)
        self.Btn_LINE().gameObject:SetActive(false)
        self.Btn_Qinxin().gameObject:SetActive(false)
    end
    Event.Clear("UpdataDetailPanel")
    Event.Add("UpdataDetailPanel", function()
        self:UpdataDetailPanel()
    end)
    Event.Add("YiguiSwitch",Handle(self,self.YiguiSwitch))
    ---初始化页面
    self:InitPanel()
    ---初始化按钮
    self:InitButton()
    ---隐藏右侧界面UI
    self:InitRightUI()
    ---初始化左侧按钮
    self:InitSwitch()
    --超限装备开关状态刷新
    self:OnVoidSwitch()
end
---初始化页面
function M:InitPanel()
    ----当前选择角色
    ---@type RoleData 当前页面角色
    RoleCardViewModel.GetRoleByID(RoleCardViewModel.CurrentHero.id)
    for i, v in pairs(RoleCardViewModel.CacheRoleDataArr_Sort) do
        if RoleCardViewModel.CurrentHero.id == v.id then
            RoleCardViewModel.CurRoleIndex = i
        end
    end
    self.CurHero = RoleCardViewModel.CurrentHero
    self.CurHeroAttr = self.CurHero:GetHeroAttr()   ---BattleRole
    ---当前选择的好友角色
    if RoleCardViewModel.CurType == "Friend" then
        self.CurFriendHero = RoleCardViewModel.CurrentFriendHero
        if (self.CurFriendHero) then
            self.CurFheroAttr = ReadData.GetRoleAttr(self.CurFriendHero.heroID, self.CurFriendHero.heroLevel, self.CurFriendHero.heroStar, self.CurFriendHero.heroSkillLevel, self.CurFriendHero.heroAwaken, self.CurFriendHero.heroExp)
        end
    end
    ---星数组
    self.unAwakenStarArr = {}
    ---觉醒星数组
    self.onAwakenStarArr = {}
    Tools.ClearAllChild(self.StarPanel().gameObject)
    for i = 1, 6 do
        ---预创建星
        self.unAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefab().gameObject, self.StarPanel().gameObject.transform, false)
        ---预创建觉醒星
        self.onAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefabJueXing().gameObject, self.StarPanel().gameObject.transform, false)
    end
    ---设置名称
    self.RoleNameTxt().text = self.CurHero.name
    Tools.ReContentSizeGroup(self.RoleNameBG().gameObject)
    ---称号
    local skinData = HeroControl.GetSkinDataBySkinId(self.CurHero.skin)
    self.Text_Chenghao().text = skinData.skinName
    ---设置职业
    MgrRes.LoadSprite(self.ProTypeImg(), self.CurHero.iconCareer)
    ---设置阵营
    MgrRes.LoadSprite(self.GroupIconImg(), "Attribute/" .. self.CurHero.CampiconName)

    self:CreatSpine(self.LihuiSpinePanel().gameObject, self.CurHero.id,self.CurHero.skin)

    ---注册左侧子页签滑块
    self.SkillScroll01():SetLuaCellEvent(Handle(self, self.SkillCell))

    ---更新好感度
    self:UpdateRoleFavorInfo(self.CurHero)
    ---隐藏分享界面
    self.FenxiangPanel().gameObject:SetActive(false)

    ---助理按钮初始化

    --角色满级隐藏按钮
    --local t = self.CurHero:GetHeroAttr()
    if self.CurHero.rank == 2 and self.CurHero.star == 6 and self.CurHero.level == 90 then
        self.Btn_Shengji1().gameObject:SetActive(false)
        self.Btn_Juexing().gameObject:SetActive(false)
    elseif self.CurHero.rank == 3 and self.CurHero.star == 6 and self.CurHero.level == 95 then
        self.Btn_Shengji1().gameObject:SetActive(false)
        self.Btn_Juexing().gameObject:SetActive(false)
    elseif self.CurHero.rank == 4 and self.CurHero.star == 6 and self.CurHero.level == 100 then
        self.Btn_Shengji1().gameObject:SetActive(false)
        self.Btn_Juexing().gameObject:SetActive(false)
    else
        self.Btn_Shengji1().gameObject:SetActive(true)
        self.Btn_Juexing().gameObject:SetActive(true)
    end
    self.BtnBlueprint().gameObject:SetActive(BlueprintViewModel.RoleHasBlueprint(self.CurHero.id));
    if SysLockControl.CheckSysLock(1613) then
        self.ImgBlueprintLock().gameObject:SetActive(false);
    else
        self.ImgBlueprintLock().gameObject:SetActive(true);
    end
end
---创建立绘
function M:CreatSpine(_Root, _RoleId, _SkinId)
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    if self.BGSpine ~= nil then
        GameObject.Destroy(self.BGSpine)
        self.BGSpine = nil
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.FrontSpine ~= nil then
        GameObject.Destroy(self.FrontSpine)
        self.FrontSpine = nil
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    local skinData = HeroControl.GetSkinDataBySkinId(_SkinId)
    --设置简易动画数据
    SkinControl.SetSkinData(skinData.shopAni,1)
    ---背景更换
    Tools.ClearAllChild(self.NomalBg().gameObject)
    if skinData.backgroundpic ~= "0" then
        self.NomalBg().gameObject:SetActive(false)
    else
        self.NomalBg().gameObject:SetActive(true)
    end
    local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate8,";")
    local x = tonumber(string.split(coordinate[1],",")[1])
    local y = tonumber(string.split(coordinate[1],",")[2])
    local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
    if skinData.backgroundpic ~= "0" then
        MgrRes.LoadCgSpine(self.BackGround(), skinData.id,skinData.backgroundpic,x,y,scale,nil,function(_ReturnObj)
            self.BGPath = MgrRes.GetLocalizedPath(skinData.backgroundpic)
            self.BGSpine = _ReturnObj
            _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder,"Default")
        end,true)
    end
    local _PosInfoTab = CharactercoordinatesLocalData.tab[_SkinId].coordinate1
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatch3DSpineInUI(_Root, _SkinId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        self.SpinePath = MgrRes.GetWatch3DSpinePath(_SkinId)
        self.SpineObj = obj
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder + 1,"Default")
        end
    end)

    if skinData.foregroundpic ~= "0" then
        local img = self.FrontSprite()
        img.enabled = true
        local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate9,";")
        local x = tonumber(string.split(coordinate[1],",")[1])
        local y = tonumber(string.split(coordinate[1],",")[2])
        local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
        MgrRes.LoadSkinFrontBG(skinData.type,img,skinData.foregroundpic,img,x,y,scale,nil,function(_ReturnObj)
            self.FrontPath = MgrRes.GetLocalizedPath(skinData.foregroundpic)
            self.FrontSpine = _ReturnObj
            _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder + 2,"Default")
        end)
    end
    ---创建点击区域
    if next(self.ClickArea) ~= nil then
        for i,v in pairs(self.ClickArea) do
            GameObject.Destroy(v)
        end
        self.ClickArea = {}
    end
    if skinData.HaveClickArea then
        self.RoleSpineClickArea().gameObject:SetActive(false)
        for i,v in pairs(skinData.ClickArea) do
            local tempGo = GameObject.Instantiate(self.RoleSpineClickArea().gameObject,self.LihuiSpinePanel().transform,false)
            tempGo:SetActive(true)
            tempGo:GetComponent("RectTransform").anchoredPosition = Vector2(tonumber(v.x),tonumber(v.y))
            tempGo:GetComponent("RectTransform").sizeDelta = Vector2(tonumber(v.width),tonumber(v.height))
            UIEvent.LuaClick(tempGo,function() self:GetCurFavorWords(i) end)
            self.ClickArea[i] = tempGo
        end
    else
        self.RoleSpineClickArea().gameObject:SetActive(true)
    end
    MgrRes.UnLoadUnusedAssets(false)
end
---隐藏右侧界面UI
function M:InitRightUI()
    ---属性
    self.InfoPanel().gameObject:SetActive(false)
    ---技能
    self.SkillPanel().gameObject:SetActive(false)
    ---装备
    self.VoidPanel().gameObject:SetActive(false)
    ---装备2
    self.VoidPanel2().gameObject:SetActive(false)
    ---核心
    self.GearPanel().gameObject:SetActive(false)
end
---初始化左侧按钮
function M:InitSwitch()
    local toggles = {
        [1] = { self.SwitchInfo01(), nil },
        [2] = { self.SwitchSkill01(), nil },
        [3] = { self.SwitchVoid01(), self.Btn_VoidLock() },
        [4] = { self.SwitchGear01(), self.Btn_GearLock() },
    }

    local ReloadInfo = {
        [1] = { Handle(self, self.OnClickRoleInfoSwitch), nil },
        [2] = { Handle(self, self.OnClickRoleSkillSwitch), nil },
        [3] = { Handle(self, self.OnClickRoleVoidSwitch), self:CheckVoidOpen() },
        [4] = { Handle(self, self.OnClickRoleGearSwitch), self:CheckGearOpen() }
    }
    for idx, toggle in pairs(toggles) do
        local normal, high = self:GetHighObj(toggle[1], "Btn_Switch", "Btn_SwitchHighLight")
        high.gameObject:SetActive(false)
        if toggle[2] ~= nil and not ReloadInfo[idx][2] then
            UIEvent.LuaClick(toggle[2].gameObject, ReloadInfo[idx][1])
        else
            if toggle[2] ~= nil then
                toggle[2].gameObject:SetActive(false)
            end
            Tools.ToggleValueChange(toggle[1], function(...)
                self:OnLeftToggleClick(..., normal, high, ReloadInfo[idx][1])
            end, nil)
        end
    end

    if NoviceViewModel.CurTaskId == 20203 then
        toggles[2][1].isOn = false
        toggles[2][1].isOn = true
    else
        toggles[1][1].isOn = false
        toggles[1][1].isOn = true
    end

    self.Btn_SkillLock().gameObject:SetActive(not SysLockControl.CheckSysLock(1002))
end
---获取高光组件
function M:GetHighObj(Obj, normalStr, highStr)
    return Obj.transform:Find(normalStr).gameObject, Obj.transform:Find(highStr).gameObject
end
---切换到属性界面
function M:OnClickRoleInfoSwitch()
    self:SwichPanel(self.InfoPanel())
    self:HideCloseBtn()
end
---切换到技能界面
function M:OnClickRoleSkillSwitch()
    self:SwichPanel(self.SkillPanel())
    NoviceViewModel.CheckCurID(20205,function()
        NoviceViewModel.DoNext()
    end)
    self.Btn_Yigui().gameObject:SetActive(false)
end
function M:CheckSkillOpen()
    return SysLockControl.CheckSysLock(1002)
end
---切换到机甲核心界面
function M:OnClickRoleGearSwitch()
    if not SysLockControl.CheckSysLock(1006) then
        MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1006), 1 }, true)
        return
    end
    self:SwichPanel(self.GearPanel())
    self.Btn_Yigui().gameObject:SetActive(false)
end
function M:CheckGearOpen()
    return SysLockControl.CheckSysLock(1006)
end
---切换到共鸣装备界面
function M:OnClickRoleVoidSwitch()
    if not SysLockControl.CheckSysLock(1005) then
        MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1005), 1 }, true)
        return
    end
    if EquipControl.GetSingleSpecialEquip(self.CurHero.id) == nil or not EquipControl.GetSingleSpecialEquip(self.CurHero.id).lockState or not self.CurHero:HeroAllEquipLevelMax() or not EquipControl.SpecialEquipOnOrOff() then    ---这里判断一下是否要打开共鸣装备升阶后界面
        self:SwichPanel(self.VoidPanel())
        ---判断共鸣装备突破按钮是否要打开
        --if RoleCardViewModel.CurType == "Normal" and EquipControl.SpecialEquipOnOrOff() and EquipControl.GetSingleSpecialEquip(self.CurHero.id) ~= nil then
        --    self.Btn_Tupo().gameObject:SetActive(true)
        --else
        --    self.Btn_Tupo().gameObject:SetActive(false)
        --end
    else
        self:SwichPanel(self.VoidPanel2())
        self:UpdataDetailPanel()
    end
    self.Btn_Yigui().gameObject:SetActive(false)
end
function M:CheckVoidOpen()
    return SysLockControl.CheckSysLock(1005)
end
---切换页签
function M:SwichPanel(_panel)
    if self.CurPanel == _panel then
        return
    end
    if self.CurPanel ~= nil then
        self.CurPanel.gameObject:SetActive(false)
    end
    self.CurPanel = _panel
    self.CurPanel.gameObject:SetActive(true)
end
---Toggle事件
function M:OnLeftToggleClick(isOn, normal, high, initFun)
    if isOn then
        normal.gameObject:SetActive(false)
        high.gameObject:SetActive(true)

        if initFun then
            initFun()
        end
        self:UpdataDetailPanel() ---更新人物详细信息
    else
        normal.gameObject:SetActive(true)
        high.gameObject:SetActive(false)
    end
end
---更新人物详细信息
function M:UpdataDetailPanel()
    self.CurHeroAttr = self.CurHero:GetHeroAttr()
    --核心界面单独切割
    if self.CurPanel ~= self.GearPanel() then
        self.GearBg().gameObject:SetActive(false)
        self.RolePanel().gameObject:SetActive(true)
        self.RoleInfoPanel().gameObject:SetActive(true)
        self.SwitchRolePanel().gameObject:SetActive(true)
    else
        self.GearBg().gameObject:SetActive(true)
        self.RolePanel().gameObject:SetActive(false)
        self.RoleInfoPanel().gameObject:SetActive(false)
        self.SwitchRolePanel().gameObject:SetActive(false)
    end
    --超限开关
    if EquipControl.GetSingleSpecialEquip(self.CurHero.id) and EquipControl.GetSingleSpecialEquip(self.CurHero.id).lockState and (self.CurPanel == self.VoidPanel() or self.CurPanel == self.VoidPanel2()) then
        self.Btn_VoidSwitch().gameObject:SetActive(true)
    else
        self.Btn_VoidSwitch().gameObject:SetActive(false)
    end
    
    if self.CurPanel == self.InfoPanel() then
        ---更新角色属性
        self:UpdataRoleInfoPanel(self.CurHeroAttr)
    elseif self.CurPanel == self.SkillPanel() then
        ---更新技能
        self:UpdataSkillPanel()
    elseif self.CurPanel == self.VoidPanel() then
        if EquipControl.GetSingleSpecialEquip(self.CurHero.id) == nil or not EquipControl.GetSingleSpecialEquip(self.CurHero.id).lockState or not self.CurHero:HeroAllEquipLevelMax() or not EquipControl.SpecialEquipOnOrOff() or not self.CurHero.sEquipOff then    ---这里判断一下是否要打开共鸣装备升阶后界面
            ---更新共鸣
            self:InitVoidPanel(self.CurHero)
        else
            self:SwichPanel(self.VoidPanel2())
            self:InitVoidPanel2(self.CurHero)
        end
    elseif self.CurPanel == self.VoidPanel2() then
        if EquipControl.GetSingleSpecialEquip(self.CurHero.id) == nil or not EquipControl.GetSingleSpecialEquip(self.CurHero.id).lockState or not self.CurHero:HeroAllEquipLevelMax() or not EquipControl.SpecialEquipOnOrOff() or not self.CurHero.sEquipOff then    ---这里判断一下是否要打开共鸣装备升阶后界面
            self:SwichPanel(self.VoidPanel())
            self:InitVoidPanel(self.CurHero)
        else
            self:InitVoidPanel2(self.CurHero)
        end
    elseif self.CurPanel == self.GearPanel() then
        ---更新核心
        if #self.GearObj == 0 then
            self:InitGearPanel(self.CurHero)
        else
            self:UpdataGear(self.CurHero)
        end
        ---仅为更新按钮切换状态
        if RoleCardViewModel.CurArmorType == 0 then
            self.ArmorSelect().transform.localPosition = self.Jingong().transform.localPosition
        else
            self.ArmorSelect().transform.localPosition = self.Fangshou().transform.localPosition
        end
    end
    self:CheckRot(self.CurHero)
end
---更新人物信息
function M:UpdataRoleInfoPanel(attr)
    if RoleCardViewModel.CurType == "Normal" then
        ---判断是否为支援角色
        if attr.Occupation == 4 then
            self.Zhiyuan().gameObject:SetActive(true)
            self.Atk().gameObject:SetActive(false)
        else
            self.Zhiyuan().gameObject:SetActive(false)
            self.Atk().gameObject:SetActive(true)
        end

        --玩家当前等级是否支持此次突破
        local tab = {}
        local t = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][7]
        local a = string.split(t,',')
        for i, v in ipairs(a) do
            local d = string.split(v,'_')
            tab[tonumber(d[1])] = tonumber(d[2])
        end
        local t_start = tab[attr.Rank]
        if attr.StartLV >= t_start then
            self.StarRedDotIcon01().gameObject:SetActive(false)
        end
        ---角色名等信息
        self.Text_Dengji().text = attr.LV .. "/" .. attr.LvMax
        -- if tonumber(attr.HP) >= 1000000 then
        --     self.HPInfoTxt().text = (self.GetMillionNumInfo(attr.HP)) .. "M"
        -- else
        --     self.HPInfoTxt().text = math.floor(attr.HP)
        -- end
        ---角色属性信息
        -- self.AtkInfoTxt().text = "" .. math.floor(attr.RealAtk)
        -- self.ZhiYuanInfoTxt().text = "" .. math.floor(self:GetInfoCorrect(attr.RealSuppart)) .. "%"
        -- self.DefInfoTxt().text = "" .. math.floor((self:GetInfoCorrect(attr.RealDef))) .. "%"
        -- self.MinjieInfoTxt().text = "" .. math.floor((self:GetInfoCorrect(attr.RealAgile))) .. "%"
        -- self.BaojiInfoTxt().text = "" .. math.floor((self:GetInfoCorrect(attr.RealCrit))) .. "%"
        -- self.BaoshangInfoTxt().text = "" .. math.floor((self:GetInfoCorrect(attr.RealCritDmg))) .. "%"
        ---角色额外属性信息
        local tempRole = ReadData.CreatRole(attr.ID, attr.SkinID, attr.LV, attr.StartLV, 0, attr.IsAwaken, self.CurHero.favor)
        if tempRole.HP - attr.HP >= 1000000 then
            self.HPInfoTxtAdd().text = (self:GetMillionNumInfo(tempRole.HP - attr.HP)) .. "M"
        else
            self:SetAttrText(self.HPInfoTxtAdd(), tempRole.HP, attr.HP, false)
        end
        self:SetAttrText(self.AtkInfoTxtAdd(), tempRole.RealAtk, attr.RealAtk, false)
        self:SetAttrText(self.ZhiYuanInfoTxtAdd(), tempRole.RealSuppart, attr.RealSuppart, true)
        self:SetAttrText(self.DefInfoTxtAdd(), tempRole.RealDef, attr.RealDef, true)
        self:SetAttrText(self.MinjieInfoTxtAdd(), tempRole.RealAgile, attr.RealAgile, true)
        self:SetAttrText(self.BaojiInfoTxtAdd(), tempRole.RealCrit, attr.RealCrit, true)
        self:SetAttrText(self.BaoshangInfoTxtAdd(), tempRole.RealCritDmg, attr.RealCritDmg, true)

        ---新角色属性信息
        if tonumber(tempRole.HP) >= 1000000 then
            self.HPInfoTxt().text = (self:GetMillionNumInfo(tempRole.HP)) .. "M"
        else
            self.HPInfoTxt().text = math.floor(tempRole.HP)
        end

        self.AtkInfoTxt().text = "" .. math.floor(tempRole.RealAtk)
        self.ZhiYuanInfoTxt().text = "" .. (self:GetSupportCorrect(tempRole.RealSuppart)) .. "%"
        self.DefInfoTxt().text = "" .. (self:GetInfoCorrect(tempRole.RealDef)) .. "%"
        self.MinjieInfoTxt().text = "" .. (self:GetInfoCorrect(tempRole.RealAgile)) .. "%"
        self.BaojiInfoTxt().text = "" .. (self:GetInfoCorrect(tempRole.RealCrit)) .. "%"
        self.BaoshangInfoTxt().text = "" .. (self:GetInfoCorrect(tempRole.RealCritDmg)) .. "%"

        ----经验Panel
        local MaxExp = 0
        if attr.LV < attr.LvMax then
            MaxExp = BattleRole.ReturnExp(attr, attr.LV)
            self.tiao().fillAmount = attr.EXP / MaxExp
        else
            self.tiao().fillAmount = 1
        end
        ---设置星
        for i = 1, #self.unAwakenStarArr do
            self.unAwakenStarArr[i]:SetActive(i <= self.CurHero.star and not self.CurHero.awaken)
            ---未觉醒星
            self.onAwakenStarArr[i]:SetActive(i <= self.CurHero.star and self.CurHero.awaken)     ---觉醒星
        end

        --角色满级隐藏按钮
        --local t = self.CurHero:GetHeroAttr()
        if self.CurHero.rank == 2 and self.CurHero.star == 6 and self.CurHero.level == 90 then
            self.Btn_Shengji1().gameObject:SetActive(false)
            self.Btn_Juexing().gameObject:SetActive(false)
        elseif self.CurHero.rank == 3 and self.CurHero.star == 6 and self.CurHero.level == 95 then
            self.Btn_Shengji1().gameObject:SetActive(false)
            self.Btn_Juexing().gameObject:SetActive(false)
        elseif self.CurHero.rank == 4 and self.CurHero.star == 6 and self.CurHero.level == 100 then
            self.Btn_Shengji1().gameObject:SetActive(false)
            self.Btn_Juexing().gameObject:SetActive(false)
        else
            self.Btn_Shengji1().gameObject:SetActive(true)
            self.Btn_Juexing().gameObject:SetActive(true)
        end
    elseif RoleCardViewModel.CurType == "Friend" then
        ---好友角色等级
        self.Text_Dengji().text = "" .. self.CurFriendHero.heroLevel
        ---好友经验条
        if self.CurFriendHero.heroLevel < self.CurFheroAttr.LvMax then
            MaxExp = BattleRole.ReturnExp(self.CurFheroAttr, self.CurFriendHero.heroLevel)
            self.tiao().fillAmount =  self.CurFriendHero.heroExp / MaxExp
        else
            self.tiao().fillAmount = 1
        end
        if self.CurFriendHero.Occupation == 4 then
            self.Zhiyuan().gameObject:SetActive(true)
            self.Atk().gameObject:SetActive(false)
        else
            self.Zhiyuan().gameObject:SetActive(false)
            self.Atk().gameObject:SetActive(true)
        end
        ---属性
        if tonumber(self.CurFheroAttr.HP) >= 1000000 then
            self.HPInfoTxt().text = (self:GetMillionNumInfo(self.CurFheroAttr.HP)) .. "M"
        else
            self.HPInfoTxt().text = math.floor(self.CurFheroAttr.HP)
        end
        self.AtkInfoTxt().text = "" .. math.floor(self.CurFheroAttr.RealAtk)                              ---攻击
        self.ZhiYuanInfoTxt().text = "" .. (self:GetSupportCorrect(self.CurFheroAttr.RealSuppart)) .. "%"       ---支援力
        self.DefInfoTxt().text = "" .. (self:GetInfoCorrect(self.CurFheroAttr.RealDef)) .. "%"              ---防御
        self.MinjieInfoTxt().text = "" .. (self:GetInfoCorrect(self.CurFheroAttr.RealAgile)) .. "%"         ---敏捷
        self.BaojiInfoTxt().text = "" .. (self:GetInfoCorrect(self.CurFheroAttr.RealCrit)) .. "%"          ---暴击
        self.BaoshangInfoTxt().text = "" .. (self:GetInfoCorrect(self.CurFheroAttr.RealCritDmg)) .. "%"     ---爆伤

        self.HPInfoTxtAdd().text = ""
        self.AtkInfoTxtAdd().text = ""
        self.ZhiYuanInfoTxtAdd().text = ""
        self.DefInfoTxtAdd().text = ""
        self.MinjieInfoTxtAdd().text = ""
        self.BaojiInfoTxtAdd().text = ""
        self.BaoshangInfoTxtAdd().text = ""
        ---设置星级
        for i = 1, #self.unAwakenStarArr do
            self.unAwakenStarArr[i]:SetActive(i <= self.CurFriendHero.heroStar and (self.CurFriendHero.heroAwaken == 0))
            ---未觉醒星
            self.onAwakenStarArr[i]:SetActive(i <= self.CurFriendHero.heroStar and (self.CurFriendHero.heroAwaken == 1))     ---觉醒星
        end
    end
end
---更新技能信息
function M:UpdataSkillPanel()
    if RoleCardViewModel.CurType == "Normal" then
        --if self.ChildSkillList ~= nil and not self.SkillRefresh then
        --    self.SkillScroll01():RefreshCells()
        --else
        self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.CurHero.id)
        local specialEquip = EquipControl.GetSingleSpecialEquip(self.CurHero.id)
        self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,specialEquip)    ---根据角色进阶共鸣装备替换技能简略表
        ---替换技能补丁
        if specialEquip then
            local skillIndex = specialEquip:GetAdvanceSkillNum()
            local advanceSkillStr = specialEquip:GetSpecialSkill()
            for _,str in pairs(advanceSkillStr) do
                ReadData.ReplaceSkill(str,self.CurHeroAttr,skillIndex)
            end
        end
        -------------------
        self.SkillScroll01().totalCount = #self.ChildSkillList
        self.SkillScroll01():RefillCells()

        --MgrTimer.AddDelayNoName(0.04,function()
        --    Tools.ReContentSizeGroup(self.SkillContent().gameObject)
        --end,self.ObjRoot.gameObject)
        --end
        ---技能总名称
        self.Text_SkillName().text = self.ChildSkillList[1].TotleName

        local levelMax = self.CurHero.skillLevel
        if self.CurHero:CheckHeroEquipIsMax() then
            levelMax = levelMax + 1
        end

        ---技能等级
        --设置过技能等级且设置的技能等级小于10级
        if self.CurHero.heroFlag ~= nil and self.CurHero.heroFlag ~= 0 and self.CurHero.heroFlag ~= false and self.CurHero.heroCurSkill ~= nil and self.CurHero.heroCurSkill <  levelMax then
            self.Text_SkillLv().text = self.CurHero.heroCurSkill
            self.Text_SkillLv_Small().gameObject:SetActive(false)
            if self.CurHero:CheckHeroEquipIsMax() then
                self.Text_SkillLv().color = Color(1,0.772549,0.2235294,1)
            else
                self.Text_SkillLv().color = Color(1,1,1,1)
            end
        else--没有设置过技能等级
            self.Text_SkillLv().text = self.CurHero:GetHeroShowSkillLv()
            if self.CurHero:CheckHeroEquipIsMax() then
                self.Text_SkillLv_Small().gameObject:SetActive(true)
                self.Text_SkillLv_Small().text = "+1"
                self.Text_SkillLv_Small().color = Color(0.2,1,0.972549,1)
                self.Text_SkillLv().text = self.CurHero:GetHeroShowSkillLv() - 1
                self.Text_SkillLv().color = Color(1,0.772549,0.2235294,1)
            else
                self.Text_SkillLv_Small().gameObject:SetActive(false)
                self.Text_SkillLv().color = Color(1,1,1,1)
            end
        end

        ---更新攻击距离
        if self.CurHeroAttr.Occupation == 4 then
            MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/SupportRange/" .. self.CurHeroAttr.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/OtherRange/" .. self.CurHeroAttr.AttackRangeTexture)
        end
        ---攻击目标
        MgrRes.LoadSprite(self.Img_Mubiao(),"AtkTarget/AtkTarget_" .. ((self.CurHeroAttr.Attacktarget == 7 or self.CurHeroAttr.Attacktarget == 8) and 4 or self.CurHeroAttr.Attacktarget),nil,true)
        ---攻击目标的描述
        self:Text_Mubiaoshuoming().text =  self.CurHeroAttr.AtkTargetTips
        --local tlv = self.CurHeroAttr:CheckHeroEquipIsMax() and 1 or 0  --当前等级是否收到装备属性而加1
        local tlv = self.CurHero:CheckHeroEquipIsMax() and 1 or 0
        --if self.CurHeroAttr.SkillLV - tlv >= self.CurHeroAttr.SkillMaxLV then
        --    self.Text_Jinengqianghua().text = MgrLanguageData.GetLanguageByKey("ui_levelmax_text")
        --else
            self.Text_Jinengqianghua().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text96")
        --end
    elseif RoleCardViewModel.CurType == "Friend" then
        if self.ChildSkillList ~= nil then
            self.SkillScroll01():RefreshCells()
        else
            self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.CurFriendHero.heroID)
            self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,nil)
            self.SkillScroll01().totalCount = #self.ChildSkillList
            self.SkillScroll01():RefillCells()
        end
        ---技能总名称
        self.Text_SkillName().text = self.ChildSkillList[1].TotleName
        ---技能等级
        local tSkillLvUp = 1
        for i, equiplv in pairs(self.CurFriendHero.equip) do
            if equiplv < tonumber(SteamLocalData.tab[105009][2]) then
                tSkillLvUp = 0
                break
            end
        end
        if tSkillLvUp == 1 then
            self.Text_SkillLv_Small().gameObject:SetActive(true)
            --self.Text_SkillLv().color = Color(1,0.772549,0.2235294,1)
            self.Text_SkillLv_Small().text = "+"..tSkillLvUp
            self.Text_SkillLv_Small().color = Color(0.2,1,0.972549,1)
        else
            self.Text_SkillLv_Small().gameObject:SetActive(false)
        end
        self.Text_SkillLv().text = self.CurFheroAttr.ShowSkillLV    -- + tSkillLvUp
        ---更新攻击距离
        if self.CurFheroAttr.Occupation == 4 then
            MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/SupportRange/" .. self.CurFheroAttr.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/OtherRange/" .. self.CurFheroAttr.AttackRangeTexture)
        end
        ---攻击目标
        MgrRes.LoadSprite(self.Img_Mubiao(),"AtkTarget/AtkTarget_" .. ((self.CurHeroAttr.Attacktarget == 7 or self.CurHeroAttr.Attacktarget == 8) and 4 or self.CurHeroAttr.Attacktarget),nil,true)
        ---攻击目标的描述
        self:Text_Mubiaoshuoming().text =  self.CurFheroAttr.AtkTargetTips
    end
end
function M:SkillCell(trans, idx)
    ---传入数据
    --trans:GetComponent("UITemplate"):SetData({ self.ChildSkillList[idx], self, self.CurHeroAttr, self.CurHero:CheckHeroEquipIsMax() })
    trans:GetComponent("UITemplate"):SetData({ self.CurHero,self.CurHeroAttr,self.ChildSkillList[idx],nil,"ParentSkill",idx })
    Tools.ReContentSizeGroup(self.SkillContent().gameObject)
end

function M:SkillLevelCell(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.CurSkillLevetList[idx],idx,self})
end

---设置滑动数据
function M:RefillSkillCells(offset)
    self.Scorll().totalCount =#self.CurSkillLevetList
    if offset then
        self.Scorll():RefillCells(offset)
    else
        self.Scorll():RefreshCells()
    end
end
---设置技能等级列表数据
function M:SetSkillListData(level)
    if level < 1 or level > 10 then
        print("当前选择的技能等级错误")
        return
    end
    self.curSkillLevel = level
    local t = 0
    for i, v in ipairs(self.SkillLevetList) do
        if v == level then
            t = i
        end
    end
    self.CurSkillLevetList = {}
    for j = t - 2, t + 2, 1 do
        table.insert(self.CurSkillLevetList,self.SkillLevetList[j])
    end
    self:RefillSkillCells(0)
end

--function M:ShowSkillXiangqing(_skillDetail,_ObjPrefab,_XiangqingData)
--    
--end
--function M:SkillDetails(trans, idx)
--    ---传入数据
--    trans:GetComponent("UITemplate"):SetData({ self.SkillDetail[idx],"down" })
--end
---取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data * 10000 + 0.5) / 1)
    tempData = tempInt1 / 100
    return tempData
end
function M:GetSupportCorrect(_Data)
    return math.floor(_Data * 100)
end
---得到百万级数据的除以100W后精度到小数点后两位的值输出
function M:GetMillionNumInfo(_InputInfo)
    local _tempRateNum = _InputInfo / 10000
    local _OutInfo = math.floor(_tempRateNum) / 100
    return _OutInfo
end
---设置额外属性
function M:SetAttrText(_ObjText, _totleV, _baseV, _isRate)
    local tTotleV = _isRate and _totleV*100 or _totleV
    local tBaseV = _isRate and _baseV*100 or _baseV
    if math.floor(tTotleV) > math.floor(tBaseV) then
        if _isRate then
            _ObjText.text = "(+" .. math.floor(self:GetInfoCorrect((tTotleV - tBaseV)/100)) .. "%)"
        else
            ---math.floor(277.4-234.4) 向下取整为42,出现异常
            local v = tostring(tTotleV - tBaseV)
            v = tonumber(v)
            _ObjText.text = "(+" .. math.floor(v) .. ")"
        end
    else
        _ObjText.text = ""
    end
end

function M:OnUpdateUI()
    ---设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 5
    -- local lihui = self.LihuiSpinePanel().transform:Find("Watch_UI(Clone)")
    -- if lihui then
    --     GameObject.Destroy(lihui.gameObject)
    -- end

    ---初始化页面
    self:InitPanel()
    self:UpdataDetailPanel()
    ---新手引导
    self:AddNoviceEvent()
    ---添加监听
    self:AddEvent()
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format("New_%s_%s", PlayerControl.GetPlayerData().UID, self.CurHero.id))
    if isNew == nil or isNew == "" then
        UnityEngine.PlayerPrefs.SetString(string.format("New_%s_%s", PlayerControl.GetPlayerData().UID, self.CurHero.id), self.CurHero.id)
    end
    self:HideCloseBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))

end

function M:HideCloseBtn()
    ---获取当前角色所有皮肤
    self.allSkinsData = HeroControl.GetAllSkinByRoleID(self.CurHero.id)
    local tempList = {}
    for i, v in pairs(self.allSkinsData) do
        --if HeroControl.CheckSkinUnlocked(v.id) then
            table.insert(tempList,v)
        --end
    end
    if tempList[1] ~= nil and #tempList >= 2 and self.CurPanel == self.InfoPanel() and self.CurPanel.gameObject.activeInHierarchy then
        self.Btn_Yigui().gameObject:SetActive(true)
    else
        self.Btn_Yigui().gameObject:SetActive(false)
    end
end

---初始化按钮
function M:InitButton()
    
    UIEvent.LuaClick(self.RoleSpineClickArea().gameObject, Handle(self, self.GetCurFavorWords))
    ---点击角色
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---角色档案
    UIEvent.LuaClick(self.Btn_Story().gameObject, Handle(self, function()
        --self:SpineMove(self.OffsetPosX, 0.3)
        --self:ShowPanel(false)
        --MgrUI.Pop(UID.RoleDocument_UI, { RoleCardViewModel.CurrentHero, Handle(self, function()
        --    self:SpineMove(self.SpinePosX, 0.3)
        --    self:ShowPanel(true)
        --end), self }, true)
        TeamAtlasControl.ScreenTeamData()  --重新筛选地区数据 防止新角色没有进缓存
        TeamAtlasControl.OpenRoleArchive(RoleCardViewModel.CurrentHero.id)
    end))
    ---升级
    UIEvent.LuaClick(self.Btn_Shengji1().gameObject, Handle(self, function()
        if SysLockControl.CheckSysLock(1001) then
            -- statements
            if self.CurHero.lockState then
                if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
                    ---突破KD
                    if self.CurHeroAttr.StartLV < self.CurHeroAttr.MaxStart then
                        self:SpineMove(self.OffsetPosX, 0.3)
                        self:ShowPanel(false)
                        MgrUI.Pop(UID.NewRoleFormation_UI, { "StarUpGrade", self })
                        self.Btn_Yigui().gameObject:SetActive(false)
                    end
                else
                    ---升级
                    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
                        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips1"), 1 }, true)
                        return
                    end
                    self:SpineMove(self.OffsetPosX, 0.3)
                    self:ShowPanel(false)
                    MgrUI.Pop(UID.NewRoleFormation_UI, { "LvUpGrade", self })
                    self.Btn_Yigui().gameObject:SetActive(false)
                end
            end
        else
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1001), 1 }, true)
        end
    end))
    ---觉醒
    UIEvent.LuaClick(self.Btn_Juexing().gameObject, Handle(self, function()
        if SysLockControl.CheckSysLock(1004) then
            if self.CurHeroAttr.StartLV >= self.CurHeroAttr.awakenStar then
                if not self.CurHero.awaken then
                    self:SpineMove(self.OffsetPosX, 0.3)
                    self:ShowPanel(false)
                    MgrUI.Pop(UID.NewRoleFormation_UI, { "Awaken", self })
                    self.Btn_Yigui().gameObject:SetActive(false)
                else
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips6"), 1 }, true)
                end
            else
                MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("character_awake_tips1"),self.CurHeroAttr.awakenStar), 1 }, true)
            end
        else
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1004), 1 }, true)
        end
    end))
    ---技能强化
    UIEvent.LuaClick(self.Btn_Jinengqianghua().gameObject, Handle(self, function()
        if SysLockControl.CheckSysLock(1002) then
            --local tlv = self.CurHeroAttr:CheckHeroEquipIsMax() and 1 or 0  --当前等级是否收到装备属性而加1
            --local tlv = self.CurHero:CheckHeroEquipIsMax() and 1 or 0
            --if self.CurHeroAttr.SkillLV - tlv >= self.CurHeroAttr.SkillMaxLV then
            --    --MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips4"), 1 }, true)
            --    return
            --end
            --self:SpineMove(self.OffsetPosX, 0.3)
            --self:ShowPanel(false)
            MgrUI.GoHide(UID.NewRoleSkill02_UI)
        else
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1002), 1 }, true)
        end

    end))
    

     self.XiHuanChild = {
        self.Xihuan().gameObject,
        self.Xihuan_H().gameObject
    }
    self:UpdataXiHuanState()
    ---角色偏爱按钮TODO
    UIEvent.LuaClick(self.Btn_Xihuan().gameObject, Handle(self, function()
        local isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",self.CurHero.id))
         if isLove == nil or isLove == "" then
             UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .."H%s",self.CurHero.id),"1")
             self:UpdataXiHuanState()
        else
            UnityEngine.PlayerPrefs.DeleteKey(string.format(PlayerControl.GetPlayerData().UID .. "H%s",self.CurHero.id))
            self:UpdataXiHuanState()
        end
    end))
    UIEvent.LuaClick(self.Btn_Favorability().gameObject, Handle(self, function()
        MgrUI.Pop(UID.FavorabilityRankPop_UI, { self.CurHero, self }, true)
    end))
    ---好感度弹窗
    UIEvent.LuaClick(self.Btn_Favorability().gameObject, Handle(self, function()
        MgrUI.Pop(UID.FavorabilityRankPop_UI, { self.CurHero, self }, true)
    end))
    ---角色成长预览
    UIEvent.LuaClick(self.Btn_Yulan().gameObject, Handle(self, function()
        MgrUI.Pop(UID.RoleInfoPreviewPop, { "RoleInfo", self.CurHero }, true)
    end))
    ---图标介绍
    --UIEvent.LuaClick(self.Btn_Wenhao().gameObject, Handle(self, function()
    --    MgrUI.Pop(UID.RoleInfoPreviewPop, { "IconDetails" })
    --end))
    
    ---分享FB链接
    --UIEvent.LuaClick(self.Btn_FB().gameObject, Handle(self, function()
    --    self:FBShareUrl()
    --end))
    UIEvent.LuaClick(self.Btn_FB().gameObject, Handle(self, function()
        self:FBShareUrl()
    end))
    ---分享Line链接
    --UIEvent.LuaClick(self.Btn_LINE().gameObject, Handle(self, function()
    --    self:LineShareUrl()
    --end))
    UIEvent.LuaClick(self.Btn_LINE().gameObject, Handle(self, function()
        self:LineShareUrl()
    end))
    ---保存到相簿
    UIEvent.LuaClick(self.Btn_XB().gameObject,function()
        self:SaveToLocal()
    end)
    ---分享
    UIEvent.LuaClick(self.Btn_Fenxiang().gameObject, Handle(self, function()
        CMgrUI.Instance:CloseClickRoot()    --关闭鼠标特效
        self.Btn_Fenxiang().gameObject:SetActive(false)
        self.QRCode().gameObject:SetActive(true)
        self.SwitchPanel().gameObject:SetActive(false)
        self.RoleInfoPanel().gameObject:SetActive(false)
        self.Btn_Shengji1().gameObject:SetActive(false)
        self.UpperBtnPanel().gameObject:SetActive(false)
        self.Btn_Juexing().gameObject:SetActive(false)
        self:CaptureScreenshot(self.Jietu(),Handle(self,function()
            self.QRCode().gameObject:SetActive(false)
            self.FenxiangPanel().gameObject:SetActive(true)
            self.SwitchPanel().gameObject:SetActive(true)
            self.RoleInfoPanel().gameObject:SetActive(true)
            self.Btn_Shengji1().gameObject:SetActive(true)
            self.UpperBtnPanel().gameObject:SetActive(true)
            self.Btn_Juexing().gameObject:SetActive(true)
            self:CloseShare(true)
        end))
    end))
    ---分享关闭按钮
    UIEvent.LuaClick(self.BlurMask2().gameObject,function()
        self:CloseShare(false)
        self.FenxiangPanel().gameObject:SetActive(false)
        CMgrUI.Instance:OpenClickRoot()
        self.Btn_Fenxiang().gameObject:SetActive(true)
    end)
    ---上一个角色
    UIEvent.LuaClick(self.Btn_PrevRole().gameObject,function()
        if RoleCardViewModel.CurRoleIndex ~= 1 then
            RoleCardViewModel.CurClothes = PosterGirlViewModel.ClothesType.wear
            RoleCardViewModel.CurRoleIndex = RoleCardViewModel.CurRoleIndex - 1
            RoleCardViewModel.CurrentHero = RoleCardViewModel.CacheRoleDataArr_Sort[RoleCardViewModel.CurRoleIndex]
            ---清除角色星星
            for i = 1,self.StarPanel().transform.childCount do
                GameObject.Destroy(self.StarPanel().transform:GetChild(i - 1).gameObject)
            end
            ---清除spine
            if self.SpineObj then
                GameObject.Destroy(self.SpineObj)
            end
            ---暂停角色语音
            MgrSound.Stop(3)
            self.SkillRefresh = true
            ---初始化面板
            self:InitPanel()
            self:UpdataDetailPanel()
            self:HideCloseBtn()
            if RoleCardViewModel.CurRoleIndex == 1 then
                if self.Btn_PrevRole().gameObject.activeSelf then
                    self.Btn_PrevRole().gameObject:SetActive(false)
                end
            end
            if not self.Btn_NextRole().gameObject.activeSelf then
                self.Btn_NextRole().gameObject:SetActive(true)
            end
            self:UpdataXiHuanState()
            --超限装备开关状态刷新
            self:OnVoidSwitch()
        end
    end)
    ---下一个角色
    UIEvent.LuaClick(self.Btn_NextRole().gameObject,function()
        if RoleCardViewModel.CurRoleIndex ~= #RoleCardViewModel.CacheRoleDataArr_Sort then
            RoleCardViewModel.CurClothes = PosterGirlViewModel.ClothesType.wear
            RoleCardViewModel.CurRoleIndex = RoleCardViewModel.CurRoleIndex + 1
            RoleCardViewModel.CurrentHero = RoleCardViewModel.CacheRoleDataArr_Sort[RoleCardViewModel.CurRoleIndex]
            ---清除角色星星
            for i = 1,self.StarPanel().transform.childCount do
                GameObject.Destroy(self.StarPanel().transform:GetChild(i - 1).gameObject)
            end
            ---清除spine
            if self.SpineObj then
                GameObject.Destroy(self.SpineObj)
            end
            ---暂停角色语音
            MgrSound.Stop(3)
            self.SkillRefresh = true
            ---初始化面板
            self:InitPanel()
            self:UpdataDetailPanel()
            self:HideCloseBtn()
            if RoleCardViewModel.CurRoleIndex == #RoleCardViewModel.CacheRoleDataArr_Sort then
                if self.Btn_NextRole().gameObject.activeSelf then
                    self.Btn_NextRole().gameObject:SetActive(false)
                end
            end
            if not self.Btn_PrevRole().gameObject.activeSelf then
                self.Btn_PrevRole().gameObject:SetActive(true)
            end
            self:UpdataXiHuanState()
            --超限装备开关状态刷新
            self:OnVoidSwitch()
        end
    end)

    self.QinxinChild = {
        self.Qinxin().gameObject,
        self.Qinxin_H().gameObject
    }
    self:UpdataQinXinState()

    UIEvent.LuaClick(self.Btn_Qinxin().gameObject,function()
        if RoleCardViewModel.CurrentHero.id == PlayerControl.GetPlayerData().curRoleID then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips1"), 2 }, true)
            return
        end
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text101"),function()
            PlayerAvatarViewModel.ChooseMenuRoleClick(RoleCardViewModel.CurrentHero.id, Handle(self, self.ChooseMenuRoleACK), Handle(self, self.ChooseMenuRoleNTF))
        end,nil,2,nil})
    end)

    UIEvent.LuaClick(self.Btn_Yigui().gameObject,function()
        MgrUI.GoHide(UID.RoleSkin_UI)
    end)

    --UIEvent.LuaClick(self.Btn_SkillHelp().gameObject,function()
    --    self:ShowPanel(false)
    --    MgrUI.Pop(UID.SkillPreview_UI, { self.CurHeroAttr })
    --end)

    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(85)
    end))
    --注册技能等级选择页签滑动
    self.Scorll():SetLuaCellEvent(Handle(self, self.SkillLevelCell))
    self.ReduceRankPanel().gameObject:SetActive(false)
    --打开设置技能等级界面
    UIEvent.LuaClick(self.Btn_ReduceRank().gameObject,Handle(self,function()
        --技能等级设置界面初始化等级
        if self.CurHero.heroFlag ~= 0 then
            self.curSkillLevel = self.CurHero.heroCurSkill
            self:SetSkillListData(self.curSkillLevel)
        else
            if self.CurHero:CheckHeroEquipIsMax() then
                self:SetSkillListData(self.CurHero.skillLevel + 1)
            else
                self:SetSkillListData(self.CurHero.skillLevel)
            end
        end

        self.ReduceRankPanel().gameObject:SetActive(true)
        self:RefillSkillCells(0)
        self.RankLVItem().gameObject:SetActive(false)
    end))
    --技能等级左按钮
    UIEvent.LuaClick(self.Btn_Zuo().gameObject,Handle(self,function()
        if self.curSkillLevel > 1 then
            self:SetSkillListData(self.curSkillLevel - 1)
        end
    end))

    --技能等级右按钮
    UIEvent.LuaClick(self.Btn_You().gameObject,Handle(self,function()
        if self.curSkillLevel < 10 then
            self:SetSkillListData(self.curSkillLevel + 1)
        end
    end))

    --关闭设置技能等级界面
    UIEvent.LuaClick(self.Btn_cancel().gameObject,Handle(self,function()
        self.Successful = false
        self.ReduceRankPanel().gameObject:SetActive(false)
    end))

    --调整技能等级按钮点击
    UIEvent.LuaClick(self.Btn_confirm().gameObject,Handle(self,function()
        self.Successful = false
        self:SendSkillLevel()
    end))

    UIEvent.LuaClick(self.Btn_Tupo().gameObject,function()
        if self.CurHero:HeroAllEquipLevelMax() and not EquipControl.GetSingleSpecialEquip(self.CurHero.id).lockState then
            --MgrUI.Pop(UID.VoidGearBreakPop,{self.CurHero},true)
            MgrUI.GoHide(UID.VoidSpecialGearDetail_UI)
        else
            if SysLockControl.CheckSysLock(1612) then
                MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_zhuanshugongming_text3"),SteamLocalData.tab[105012][2]),1},true)
            else
                MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("stormviewmodel_tips6"),SysLockControl.GetUnlockPoint(1612)),1},true)  --获取前置关卡
            end
        end
    end)
    UIEvent.LuaClick(self.Btn_Qianghua().gameObject,function()
        MgrUI.GoHide(UID.VoidSpecialGearDetail_UI)
    end)
    ---如果是自己角色
    if RoleCardViewModel.CurType == "Normal" then
        if RoleCardViewModel.CurRoleIndex == 1 then
            self.Btn_PrevRole().gameObject:SetActive(false)
        elseif RoleCardViewModel.CurRoleIndex == #RoleCardViewModel.CacheRoleDataArr_Sort then
            self.Btn_NextRole().gameObject:SetActive(false)
        end
    else
        self.Btn_NextRole().gameObject:SetActive(false)
        self.Btn_PrevRole().gameObject:SetActive(false)
    end

    ---进攻核心组
    UIEvent.LuaClick(self.Jingong().gameObject,Handle(self, function()
        RoleCardViewModel.CurArmorType = 0
        self:UpdataGear(self.CurHero)
        self.ArmorSelect().transform.localPosition = self.Jingong().transform.localPosition
    end))
    ---防守核心组
    UIEvent.LuaClick(self.Fangshou().gameObject,Handle(self, function()
        RoleCardViewModel.CurArmorType = 1
        self:UpdataGear(self.CurHero)
        self.ArmorSelect().transform.localPosition = self.Fangshou().transform.localPosition
    end))
    UIEvent.LuaClick(self.BtnBlueprint().gameObject, Handle(self, function()
        if SysLockControl.CheckSysLock(1613) then
            BlueprintViewModel.SetCurType(2);
            BlueprintViewModel.SetCurRoleId(self.CurHero.id);
            BlueprintViewModel.OpenBlueprint();
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1613), 1},true);
        end
    end));
    --超限装备开关
    UIEvent.LuaClick(self.Btn_VoidSwitch().gameObject,Handle(self, function()
        --超限装备开关
        HeroControl.SetSEquipOff(self.CurHero.id, not self.CurHero.sEquipOff, function()
            self:OnVoidSwitch()
        end)
    end))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        print("---------------关闭主界面-------------------")
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

--更新喜欢按钮状态
function M:UpdataXiHuanState()
    local isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",self.CurHero.id))
    if isLove == nil or isLove == "" then
        self.XiHuanChild[1]:SetActive(true)
        self.XiHuanChild[2]:SetActive(false)
    else
        self.XiHuanChild[1]:SetActive(false)
        self.XiHuanChild[2]:SetActive(true)
    end
end

--更新亲信按钮状态
function M:UpdataQinXinState()
    if RoleCardViewModel.CurrentHero.id == PlayerControl.GetPlayerData().curRoleID then
        self.QinxinChild[1]:SetActive(false)
        self.QinxinChild[2]:SetActive(true)
    else
        self.QinxinChild[1]:SetActive(true)
        self.QinxinChild[2]:SetActive(false)
    end
end

---截图面板开关
function M:CloseShare(CloseOrOpen)
    self.BlurMask2().gameObject:SetActive(CloseOrOpen)
    self.JietuPanelParent().gameObject:SetActive(CloseOrOpen)
    self.Content().gameObject:SetActive(CloseOrOpen)
end
---截图功能
function M:CaptureScreenshot(imageComponent,LuaFunc)
    CMgrCamera.Instance:CaptureScreenshot(imageComponent,LuaFunc)
end

---立绘平移
function M:SpineMove(_TargetPosX, _Duration)
    --Tools.TweenDoLocalMoveX(self.LihuiSpinePanel().gameObject, _TargetPosX, _Duration, -1)
end
---显示界面部分功能
function M:ShowPanel(_isShow)
    ---左上方
    self.UpperBtnPanel().gameObject:SetActive(_isShow)
    ---左侧按钮
    self.SwitchPanel().gameObject:SetActive(_isShow)
    ---左下方
    self.RoleInfoPanel().gameObject:SetActive(_isShow)
    ---当前右侧
    self.CurPanel.gameObject:SetActive(_isShow)
    ---角色切换
    if RoleCardViewModel.CurRoleIndex == 1 then
        self.Btn_PrevRole().gameObject:SetActive(false)
        self.Btn_NextRole().gameObject:SetActive(_isShow)
    elseif RoleCardViewModel.CurRoleIndex == #RoleCardViewModel.CacheRoleDataArr_Sort then
        self.Btn_NextRole().gameObject:SetActive(false)
        self.Btn_PrevRole().gameObject:SetActive(_isShow)
    else
        self.Btn_NextRole().gameObject:SetActive(_isShow)
        self.Btn_PrevRole().gameObject:SetActive(_isShow)
    end
end
---根据当前好感度等级权重随机出本次的好感度交互台词ID
function M:GetCurFavorWords(idx)
    -- local trans = self.LihuiSpinePanel().transform:Find("Watch_3D(Clone)")
    -- if trans == nil  then
    --     trans = self.LihuiSpinePanel().transform:Find("Watch_UI(Clone)")
    -- end
    local _CurRoleFavor = self.CurHero.favor --默认100好感度
    local tSkinData = HeroControl.GetSkinDataBySkinId(self.CurHero.skin)
    --判断是否启用多状态切换
    if tSkinData.newSwitch then
        SkinControl.ShowAnimate(self.SpineObj,self.BGSpine,self.FrontSpine,self.CurTouchIdx)
        return
    end
    
    if CMgrSpine.Instance:CheckCurAniIsIdle(self.SpineObj,RoleCardViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress) == false then
        return
    end
    local _ActorLinesType = tonumber(tSkinData.interaction) --tonumber(self.CurHero.Interaction)   --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    if idx and type(idx) == "number" then
        for key, value in pairs(ActorLinesLocalData.tab) do
            if value[2] == _ActorLinesType and value[4] == 5 then
                local str = string.split(value[5],"_")
                if str[1] == "15" and idx == tonumber(str[2]) then  --15为点击区域触发动作和语音
                    ---算权重
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight2(_TempVarTab,_CurRoleFavor)
                    if _ReturnVar ~= false then
                        _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                        table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                    end
                elseif tonumber(str[1]) == 14 and idx == tonumber(str[2]) then
                    ---匹配到对应的角色台词组别
                    if value[2] == _ActorLinesType then
                        local _TempVarTab= str
                        local _ReturnVar = TableToObject.GetTargetWeight2(_TempVarTab,0)
                        if _ReturnVar ~= false then
                            ---当前看板娘穿着衣服
                            if  RoleCardViewModel.CurClothes == PosterGirlViewModel.ClothesType.wear or RoleCardViewModel.CurClothes == nil then
                                ---穿着衣服时点击角色只会播放脱衣语音或穿衣触摸
                                if value[3] == 92 or value[3] == 93 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            else
                                ---脱着衣服时点击角色只会播放穿衣语音或脱衣触摸
                                if value[3] == 95 or value[3] == 96 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            end
                        end
                    end
                end
            end
        end
        local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
        RoleCardViewModel.PlayTargetRoleAniVoice(_FinalVoiceLineId, self.SpineObj)
        ---后面要加特效

    else
        for key, value in pairs(ActorLinesLocalData.tab) do
            ---当前是默认看板娘
            if tonumber(string.split(value[5],"_")[1]) ~= 14 then
                ---匹配到对应的角色台词组别
                if value[2] == _ActorLinesType and value[4] == 5 and tonumber(string.split(value[5],"_")[1]) == 1 then
                    ---切割对应的触发条件得到条件表
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,_CurRoleFavor)
                    if _ReturnVar ~= false then
                        ---插入 台词ID 达标的权重值*1000+表中已存的权重值
                        ---按顺序插入累加的权重值，通过分段记录的权重值来判断本次随机出来的值属于哪个区间
                        ---Etc tab[1]切割出的权值为0.8  tab[2]切割出的权值为1.5 tab[3]切割出的权值为2.8
                        ---    对应tab[1]存储的权值字段为800 tab[2]为800+1500 tab[3]为800+1500+2800
                        ---    随机一个整数在(1,max) max本轮为800+1500+2800
                        ---    遍历表中判断迭代更新大于这个随机数的字段的下标
                        ---    假设本轮随机数为1300 则tab[1]符合 tab[2]符合 最中迭代更新随机数下标为tab[2]
                        ---------------------------------------------------------------------
                        if value[3] == 91 or value[3] == 94 then
                            if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.wear then
                                if value[3] == 91 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            else
                                if value[3] == 94 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            end
                        else
                            _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                            table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                        end
                    end
                end
            elseif tonumber(string.split(value[5],"_")[1]) == 14 then
                ---匹配到对应的角色台词组别
                if value[2] == _ActorLinesType then
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,0)
                    if _ReturnVar ~= false then
                        ---当前看板娘穿着衣服
                        if  RoleCardViewModel.CurClothes == PosterGirlViewModel.ClothesType.wear or RoleCardViewModel.CurClothes == nil then
                            ---穿着衣服时点击角色只会播放脱衣语音或穿衣触摸
                            if value[3] == 92 or value[3] == 93 then
                                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                            end
                        else
                            ---脱着衣服时点击角色只会播放穿衣语音或脱衣触摸
                            if value[3] == 95 or value[3] == 96 then
                                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                            end
                        end
                    end
                end
            end
        end
        local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
        RoleCardViewModel.PlayTargetRoleAniVoice(_FinalVoiceLineId, self.SpineObj)
    end
end

---初始化共鸣信息
---@param hero RoleData
function M:InitVoidPanel(hero)
    self.VoidGearPanel().gameObject:SetActive(false)
    ---获取角色已有的共鸣装备
    local equipArr = hero:GetHeroVoidEquip()
    Tools.ClearAllChild(self.VoidPanelLayout().gameObject)
    ---如果是好友角色
    if (RoleCardViewModel.CurType == "Friend") then
        for idx, obj in pairs(equipArr) do
            local tVoidPanelObj = GameObject.Instantiate(self.VoidGearPanel().gameObject, self.VoidPanelLayout().transform, false)
            self:InitVoidPanelByJNVoidGear(tVoidPanelObj, obj, self.CurFriendHero.equip[idx])
            tVoidPanelObj:SetActive(true)
        end
    else
        for idx, obj in pairs(equipArr) do
            local tVoidPanelObj = GameObject.Instantiate(self.VoidGearPanel().gameObject, self.VoidPanelLayout().transform, false)
            self:InitVoidPanelByJNVoidGear(tVoidPanelObj, obj)
            tVoidPanelObj:SetActive(true)
        end
    end
    ---判断共鸣装备突破按钮是否要打开
    if RoleCardViewModel.CurType == "Normal" and EquipControl.SpecialEquipOnOrOff() and EquipControl.GetSingleSpecialEquip(self.CurHero.id) and not EquipControl.GetSingleSpecialEquip(self.CurHero.id).lockState then
        self.Btn_Tupo().gameObject:SetActive(true)
    else
        self.Btn_Tupo().gameObject:SetActive(false)
    end
end
---根据当前传入的共鸣装备信息对象更新对应的UI信息
---@param _JNVoidGear EquipData
function M:InitVoidPanelByJNVoidGear(_VoidGearPanel, _JNVoidGear, _FriendVoidLV)
    local _VoidGearNameText = CJNUIMgr.GetSunUseName(_VoidGearPanel, "VoidGearNameText")
    local _VoidGearLVText = CJNUIMgr.GetSunUseName(_VoidGearPanel, "VoidGearLVText")
    local _VoidGearLvDotPrefab = CJNUIMgr.GetSunUseName(_VoidGearPanel, "VoidGearLvDotPrefab")
    local _VoidGearLvDotPanel = CJNUIMgr.GetSunUseName(_VoidGearPanel, "VoidGearLvDotPanel")
    local _VoidGearPrefab = CJNUIMgr.GetSunUseName(_VoidGearPanel, "VoidGearPrefab")
    local _VoidAttrPanel = CJNUIMgr.GetSunUseName(_VoidGearPanel, "VoidAttrPanel")
    local _VoidIconPanel = CJNUIMgr.GetSunUseName(_VoidGearPanel, "VoidIconPanel")

    _VoidGearLvDotPrefab:SetActive(false)
    _VoidGearPrefab:SetActive(false)
    ---如果是好友角色
    if (RoleCardViewModel.CurType == "Friend") then
        _VoidGearNameText:GetComponent("TextMeshProUGUI").text = _JNVoidGear.name
        if (_FriendVoidLV ~= nil) then
            _VoidGearLVText:GetComponent("TextMeshProUGUI").text = string.format("<color=#fe7d1d>%s</color> %s",MgrLanguageData.GetLanguageByKey("ui_tips_1"),_FriendVoidLV)
        else
            _VoidGearLVText:GetComponent("TextMeshProUGUI").text = ""
        end
        Tools.ClearAllChild(_VoidGearLvDotPanel)
        for i = 1, tonumber(_FriendVoidLV) do
            GameObject.Instantiate(_VoidGearLvDotPrefab, _VoidGearLvDotPanel.transform, false):SetActive(true)
        end
        ---装备Icon
        self:InitVoidIcon(_VoidIconPanel, _JNVoidGear, _FriendVoidLV)
        ---装备词条信息
        local _VoidInfoTab = JNStrTool.strSplit(",", _JNVoidGear.attribute)
        local _VoidInfoCount = TableToObject.GetTableLength(_VoidInfoTab)
        Tools.ClearAllChild(_VoidAttrPanel)
        for i = 1, _VoidInfoCount do
            local tVoidAttrObj = GameObject.Instantiate(_VoidGearPrefab, _VoidAttrPanel.transform, false)
            self:InitVoidGearInfoDataPrefab(tVoidAttrObj, _VoidInfoTab[i],_FriendVoidLV)
            tVoidAttrObj:SetActive(true)
        end
    else
        ---是自己的角色
        _VoidGearNameText:GetComponent("TextMeshProUGUI").text = _JNVoidGear.name
        if _JNVoidGear.level ~= 0 then
            _VoidGearLVText:GetComponent("TextMeshProUGUI").text = string.format("<color=#fe7d1d>%s</color> %s",MgrLanguageData.GetLanguageByKey("ui_tips_1"), _JNVoidGear.level)
        else
            _VoidGearLVText:GetComponent("TextMeshProUGUI").text = ""
        end
        Tools.ClearAllChild(_VoidGearLvDotPanel)
        for i = 1, tonumber(_JNVoidGear.level), 1 do
            GameObject.Instantiate(_VoidGearLvDotPrefab, _VoidGearLvDotPanel.transform, false):SetActive(true)
        end
        ---装备Icon
        self:InitVoidIcon(_VoidIconPanel, _JNVoidGear, _FriendVoidLV)
        --装备词条信息
        local _VoidInfoTab = JNStrTool.strSplit(",", _JNVoidGear.attribute)
        local _VoidInfoCount = TableToObject.GetTableLength(_VoidInfoTab)
        Tools.ClearAllChild(_VoidAttrPanel)
        for i = 1, _VoidInfoCount do
            local tVoidAttrObj = GameObject.Instantiate(_VoidGearPrefab, _VoidAttrPanel.transform, false)
            self:InitVoidGearInfoDataPrefab(tVoidAttrObj, _VoidInfoTab[i], _JNVoidGear.level)
            tVoidAttrObj:SetActive(true)
        end
    end

end
---初始化一个共鸣装备图标信息
---@param _Void EquipData
function M:InitVoidIcon(_Obj, _Void, _FriendVoidLV)
    if _Void == nil then
        return
    end
    local _VoidGearIconImg = CJNUIMgr.GetSunUseName(_Obj, "VoidGearIcon")
    local _EmptyVoidGearIconImg = CJNUIMgr.GetSunUseName(_Obj, "EmptyVoidGearIcon")
    local _VoidGearRankIcon = CJNUIMgr.GetSunUseName(_Obj, "VoidGearRankIcon")
    ---如果是好友角色
    if (RoleCardViewModel.CurType == "Friend") then
        if _FriendVoidLV ~= 0 then
            -- statements
            _EmptyVoidGearIconImg:SetActive(false)
            _VoidGearIconImg:SetActive(true)
            MgrRes.LoadSprite(_VoidGearIconImg:GetComponent("Image"), _Void.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"), _Void.iconFrame)
        else
            _EmptyVoidGearIconImg:SetActive(true)
            _VoidGearIconImg:SetActive(false)
            MgrRes.LoadSprite(_EmptyVoidGearIconImg:GetComponent("Image"), _Void.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"), "Equip/Rank/VoidGearRank_0")
        end
    else
        ---是自己的角色
        if _Void.lockState == true then
            -- statements
            _EmptyVoidGearIconImg:SetActive(false)
            _VoidGearIconImg:SetActive(true)
            MgrRes.LoadSprite(_VoidGearIconImg:GetComponent("Image"), _Void.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"), _Void.iconFrame)
        else
            _EmptyVoidGearIconImg:SetActive(true)
            _VoidGearIconImg:SetActive(false)
            MgrRes.LoadSprite(_EmptyVoidGearIconImg:GetComponent("Image"), _Void.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"), "Equip/Rank/VoidGearRank_0")
        end
        UIEvent.LuaClick(_Obj, Handle(self, function()
            -- 点击切换到对应的详情 修改为和背包共鸣装备相同的逻辑
            if self.CurHero.lockState then
                Event.Remove("BackKey", Handle(self, self.OnBackKey))
                RoleCardViewModel.CurrentEquip = _Void
                --MgrUI.GoHide(UID.VoidGearDetail_UI)
                MgrUI.Pop(UID.EquipInfoPop_UI,{_Void,nil},true)
            end
        end))
    end
end
function M:InitVoidPanel2(hero)
    local specialEquip = self.CurHero:GetHeroSpecialEquip()
    ---名字
    self.VoidGearNameText01().text = specialEquip.specialName
    ---图片
    MgrRes.LoadSprite(self.VoidGearIcon02(),"Item/"..specialEquip.specialIcon)
    ---等级显示
    self.Text_Dengji01().text = specialEquip.evolutionLevel .. "/" .. specialEquip.maxLevel
    ---额外属性
    local Root = self.Content_VoidPanel2().transform
    local VoidGearAttr = self.VoidGearAttr_VoidPanel2().gameObject
    local GearSkillPrefab = self.GearSkillPrefab_VoidPanel2().gameObject
    VoidGearAttr:SetActive(false)
    GearSkillPrefab:SetActive(false)
    Tools.ClearAllChild(Root.gameObject)
    ---数据
    ---@type CoreAttrData
    local attr = specialEquip:GetCurrentAttr()      --当前共鸣装备属性
    local skill = specialEquip:GetSpecialSkill()    --当前的技能字符串
    ---初始化装备属性
    for i,v in pairs(attr) do
        local item = GameObject.Instantiate(VoidGearAttr,Root)
        item:SetActive(true)
        local VoidGearAttrNum = item.transform:Find("VoidGearAttrNum"):GetComponent("TextMeshProUGUI")
        local VoidGearAttrText = item.transform:Find("VoidGearAttrText"):GetComponent("TextMeshProUGUI")
        local VoidAttrIcon = item.transform:Find("VoidAttrIcon"):GetComponent("Image")
        VoidGearAttrNum.text = v.attribute .. (v.type == 0 and "" or "%")
        VoidGearAttrText.text = v.attrName
        MgrRes.LoadSprite(VoidAttrIcon,v.attrIcon)
    end
    ---初始化新加技能
    local CurHeroAttr
    ---@type JNSkill
    local newSkills = {}
    local oldSkills = {}
    if next(skill) ~= nil then
        CurHeroAttr = self.CurHero:GetHeroAttr()
        local skillIndex = specialEquip:GetAdvanceSkillNum()
        for _,str in pairs(skill) do
            local realStr=BattleRole.RealSkillStr(str, CurHeroAttr.ShowSkillLV,CurHeroAttr,skillIndex)
            CurHeroAttr["Skill_"..skillIndex.."_IsSLv"] = false
            CurHeroAttr["Skill_"..skillIndex.."Fml"]=JNStrTool.StrArrArr("@",realStr,{"{" , "}" , "," })
            CurHeroAttr["Skill_"..skillIndex]=BattleRole.SubSkillLvReal2(CurHeroAttr["Skill_"..skillIndex.."Fml"],CurHeroAttr.ShowSkillLV)
            table.insert(oldSkills ,CurHeroAttr["Skill_"..skillIndex.."_example"])
            BattleRole.CreatAllSkill(CurHeroAttr)
            table.insert(newSkills ,CurHeroAttr["Skill_"..skillIndex.."_example"])
        end
    end
    for i,v in pairs(newSkills) do
        local item = GameObject.Instantiate(GearSkillPrefab,Root)
        item:SetActive(true)
        local GearSkillNameText = item.transform:Find("GearSkillName/GearSkillNameText"):GetComponent("TextMeshProUGUI")
        item.transform:Find("GearSkillName/Img_Suo").gameObject:SetActive(false)
        local tSkillSimple = SkillDetailControl.GetSkillData(self.CurHero.id, v[1].Id)
        local tMarkLv = tSkillSimple.UnlockLv[1]
        GearSkillNameText.text = tSkillSimple.GroupName[tMarkLv]
        --GearSkillNameText.text = v[1].Name
        local GearSubSkill_SEquip = item.transform:Find("GearSubSkill_SEquip").gameObject    --子技能面板
        GearSubSkill_SEquip:SetActive(false)
        --创建子技能
        for idx,value in pairs(v) do    --同oldSkill的自己能作对比
            if oldSkills[i][idx] == nil or oldSkills[i][idx].Id ~= value.Id then
                --value为新增技能或者替换技能
                local subSkill = GameObject.Instantiate(GearSubSkill_SEquip,item.transform)
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
            end
        end
    end
    if EquipControl.GetSingleSpecialEquip(self.CurHero.id).evolutionLevel < EquipControl.GetSingleSpecialEquip(self.CurHero.id):MaxLevel() then
        self.Text_VoidQianghua().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text65")
    else
        self.Text_VoidQianghua().text = MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips2")
    end
    Tools.ReContentSizeGroup(Root.gameObject)
    Tools.ReSize(Root.gameObject)
end
---初始化核心信息
------@param hero RoleData
function M:InitGearPanel(hero)
    local tEquipData = { hero.armor1, hero.armor2 }

    self.GearObj = { self.RoleGearPanel1().gameObject,self.RoleGearPanel2().gameObject }
    for i, v in ipairs(self.GearObj) do
        local _GearItem = CJNUIMgr.GetSunUseName(v, "GearItem")
        local _GearEmptyItem = CJNUIMgr.GetSunUseName(v, "GearEmptyItem")
        if tEquipData[i] ~= 0 and tEquipData[i] ~= nil then
            self.GearPanelUID[i] = tEquipData[i]
            local tGearData = CoreControl.GetSingleCoreData(self.GearPanelUID[i])
            self:InitGearDetailPanel(tGearData, _GearItem, i)
            --ReadData.InitRoleGear(self.CurHeroAttr, tGearData.attrs, true)

            _GearItem:SetActive(true)
            _GearEmptyItem:SetActive(false)
        else
            _GearItem:SetActive(false)
            _GearEmptyItem:SetActive(true)
        end
        ---替换核心
        UIEvent.LuaClick(_GearItem, Handle(self, function()
            RoleCardViewModel.CurCoreIndex = i
            MgrUI.GoHide(UID.RoleGearCore_UI, function()
                self:UpdataDetailPanel()
            end)
        end))
        UIEvent.LuaClick(_GearEmptyItem, Handle(self, function()
            RoleCardViewModel.CurCoreIndex = i
            MgrUI.GoHide(UID.RoleGearCore_UI)
        end))
        -----核心强化
        --UIEvent.LuaClick(_EquipUpGrade, Handle(self, function()
        --    RoleCardViewModel.CurrentCore = CoreControl.GetSingleCoreData(self.GearPanelUID[i])
        --    MgrUI.GoHide(UID.NewGearUpgrade_UI)
        --end))
        -----核心卸载
        --UIEvent.LuaClick(_EquipDown, Handle(self, function()
        --    RoleCardViewModel.CurrentCore = CoreControl.GetSingleCoreData(self.GearPanelUID[i])
        --    self.TouchGearID = i
        --    self:OnClickTakeOff()
        --end))
    end

    --更新属性Panel基础信息
    self:InitRoleInfoPanel()
end
---更新核心信息
---@param GearData CoreData
function M:InitGearDetailPanel(GearData, _GearInfoPanel, index)

    local _GearDataPanel = CJNUIMgr.GetSunUseName(_GearInfoPanel, "GearDataPanel")
    local _GearInfoPrefab = CJNUIMgr.GetSunUseName(_GearInfoPanel, "GearInfoPrefab")
    --local GearSkillPrefab = CJNUIMgr.GetSunUseName(_GearInfoPanel, "GearSkillPrefab")
    --
    local GearIconPanel = CJNUIMgr.GetSunUseName(_GearInfoPanel, "GearIconPanel")
    local UpgradeTextObj = CJNUIMgr.GetSunUseName(_GearInfoPanel, "GearUpgradeText")
    local NameTxtObj = CJNUIMgr.GetSunUseName(_GearInfoPanel, "GearNameTxt")
    --local _LockImg = CJNUIMgr.GetSunUseName(_GearInfoPanel, "Gear_Img_Suo")
    --local _unLockImg = CJNUIMgr.GetSunUseName(_GearInfoPanel, "Gear_Img_Suo_hui")
    --local BtnSuo = CJNUIMgr.GetSunUseName(_GearInfoPanel, "BtnSuo")
    --
    local IconImgObj = CJNUIMgr.GetSunUseName(GearIconPanel, "GearIconImg")
    --local RankKuangImgObj = CJNUIMgr.GetSunUseName(GearIconPanel, "GearRankKuangImg")
    --local _StarPanelRoot = CJNUIMgr.GetSunUseName(GearIconPanel, "GearStarPanel")
    --local _GearStarPrefab = CJNUIMgr.GetSunUseName(GearIconPanel, "GearStarPrefab")
    --
    --local _GearStarSpicalPrefab = CJNUIMgr.GetSunUseName(GearIconPanel, "GearStarSpicalPrefab")
    --local _EmptyGearStarSpical = CJNUIMgr.GetSunUseName(GearIconPanel, "EmptyGearStarSpical")
    --local _EmptyGearStar = CJNUIMgr.GetSunUseName(GearIconPanel, "EmptyGearStar")
    --
    --local _GearStarPanel = CJNUIMgr.GetSunUseName(GearIconPanel, "GearStarPanel")
    -----核心锁
    --self.isLocked[index] = CoreControl.GetCoreLock(GearData.uid)
    --if self.isLocked[index] == 1 then
    --    _LockImg.gameObject:SetActive(true)
    --    _unLockImg.gameObject:SetActive(false)
    --else
    --    _LockImg.gameObject:SetActive(false)
    --    _unLockImg.gameObject:SetActive(true)
    --end
    -----强化等级
    UpgradeTextObj:GetComponent("TextMeshProUGUI").text = "+" .. GearData.level
    -----设置名字
    NameTxtObj:GetComponent("TextMeshProUGUI").text = "" .. GearData.name
    ---设置核心图标
    MgrRes.LoadSprite(IconImgObj:GetComponent("Image"), GearData.icon)
    -----设置品质图片
    ----MgrRes.LoadSprite(RankKuangImgObj:GetComponent("Image"), "Quality/RankKuang_" .. GearData.quality)
    --MgrRes.LoadSprite(RankKuangImgObj:GetComponent("Image"),self:GetQualityName(GearData.iconFrameGear))
    --if GearData.quality == 5 then
    --    self:InitStarPanel(GearData.star, _StarPanelRoot, _GearStarSpicalPrefab)
    --    _EmptyGearStar.gameObject:SetActive(false)
    --    _GearStarPrefab.gameObject:SetActive(false)
    --    _EmptyGearStarSpical.gameObject:SetActive(true)
    --    _GearStarSpicalPrefab.gameObject:SetActive(true)
    --else
    --    _EmptyGearStarSpical.gameObject:SetActive(false)
    --    _GearStarSpicalPrefab.gameObject:SetActive(false)
    --    _EmptyGearStar.gameObject:SetActive(true)
    --    _GearStarPrefab.gameObject:SetActive(true)
    --    self:InitStarPanel(GearData.star, _StarPanelRoot, _GearStarPrefab)
    --end
    Tools.ClearAllChild(_GearDataPanel)
    ---设置基础属性词条
    for i = 1, #GearData.attrs do
        ---显示可用词条
        local GearInfo = self:CreatGo(_GearInfoPrefab, _GearDataPanel)
        local GearInfoMainIcon = CJNUIMgr.GetSunUseName(GearInfo, "GearInfoIcon")
        local GearInfoMainText = CJNUIMgr.GetSunUseName(GearInfo, "GearInfoText")
        local GearInfoNameTxt = CJNUIMgr.GetSunUseName(GearInfo, "GearInfoNameTxt")
        ---属性图标
        MgrRes.LoadSprite(GearInfoMainIcon:GetComponent("Image"), "Attribute/GearInfoIcon_" .. GearData.attrs[i].attrID)
        ---属性值
        local value = 0
        if GearData.attrs[i].type == 0 then
            value = math.floor(GearData.attrs[i].attribute)
        else
            value = (math.floor(GearData.attrs[i].attribute * 100) * 0.01) .. "%"
        end
        GearInfoMainText:GetComponent("TextMeshProUGUI").text = value
        ---属性名称
        GearInfoNameTxt:GetComponent("TextMeshProUGUI").text = GearData.attrs[i].attrName
    end
    --if not RoleCardViewModel.CurType == "Friend" then
    --    ---装备
    --    UIEvent.LuaClick(GearIconPanel.gameObject, Handle(self, function()
    --        RoleCardViewModel.CurCoreIndex = index
    --        MgrUI.GoHide(UID.RoleGearCore_UI)
    --    end))
    --    
    --end
    -----注册上锁按钮事件
    --UIEvent.LuaClick(BtnSuo.gameObject,function()
    --    if self.isLocked[index] == 1 then
    --        ---弹出解锁确认界面
    --        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
    --            self.isLocked[index] = 0
    --            _LockImg.gameObject:SetActive(false)
    --            _unLockImg.gameObject:SetActive(true)
    --            CoreControl.SaveCoreLock(self.GearPanelUID[index],0)
    --        end,nil,2},true)
    --    else
    --        self.isLocked[index] = 1
    --        _LockImg.gameObject:SetActive(true)
    --        _unLockImg.gameObject:SetActive(false)
    --        CoreControl.SaveCoreLock(self.GearPanelUID[index],1)
    --    end
    --end)
end

---更新属性Panel基础信息
function M:InitRoleInfoPanel()
    local tCurBattleRole = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, self.CurHero:GetHeroSkillLevel(), self.CurHero.awaken)
    if tCurBattleRole.Occupation == 4 then
        self.Zhiyuan01().gameObject:SetActive(true)
        self.Atk01().gameObject:SetActive(false)
    else
        self.Zhiyuan01().gameObject:SetActive(false)
        self.Atk01().gameObject:SetActive(true)
    end
    --角色属性信息
    if tCurBattleRole.RealAtk < 0 then
        tCurBattleRole.RealAtk = 0
    end
    if tCurBattleRole.RealSuppart < 0 then
        tCurBattleRole.RealSuppart = 0
    end
    if tCurBattleRole.RealDef < 0 then
        tCurBattleRole.RealDef = 0
    end
    if tCurBattleRole.HP < 0 then
        tCurBattleRole.HP = 0
    end
    if tCurBattleRole.RealAgile < 0 then
        tCurBattleRole.RealAgile = 0
    end
    if tCurBattleRole.RealCrit < 0 then
        tCurBattleRole.RealCrit = 0
    end
    if tCurBattleRole.RealCritDmg < 0 then
        tCurBattleRole.RealCritDmg = 0
    end
    ReadData.SetCoreType(RoleCardViewModel.CurArmorType)
    --加好感度额外属性
    local tempRole = ReadData.CreatRole(self.CurHeroAttr.ID, self.CurHeroAttr.SkinID, self.CurHeroAttr.LV, self.CurHeroAttr.StartLV, 0, self.CurHeroAttr.IsAwaken, self.CurHero.favor)
    local tempAtk = tempRole.RealAtk - tCurBattleRole.RealAtk--额外攻击力
    self.AtkInfoTxt01().text = math.floor(tCurBattleRole.RealAtk + tempAtk)
    
    --额外Suppart
    local tempSuppart = tempRole.RealSuppart - tCurBattleRole.RealSuppart
    self.SupInfoTxt().text = "" .. (self:GetSupportCorrect(tCurBattleRole.RealSuppart + tempSuppart)) .. "%"

    --额外Def
    local tempDef = tempRole.RealDef - tCurBattleRole.RealDef
    self.DefInfoTxt01().text = "" .. (self:GetInfoCorrect(tCurBattleRole.RealDef + tempDef)) .. "%"

    --额外hp
    local tempHP = tempRole.HP - tCurBattleRole.HP
    self.HpInfoTxt().text = "" .. math.floor(tCurBattleRole.HP + tempHP)

    --额外Agile 敏捷
    local tempAgile = tempRole.RealAgile - tCurBattleRole.RealAgile
    self.AgrInfoTxt().text = "" .. (self:GetInfoCorrect(tCurBattleRole.RealAgile + tempAgile)) .. "%"
    
    --暴击
    local tempCrit = tempRole.RealCrit - tCurBattleRole.RealCrit
    self.CritInfoTxt().text = "" .. (self:GetInfoCorrect(tCurBattleRole.RealCrit + tempCrit)) .. "%"
    
    --额外CritDmg 爆伤
    local tempCritDmg = tempRole.RealCritDmg - tCurBattleRole.RealCritDmg
    self.CritDmgInfoTxt().text = "" .. (self:GetInfoCorrect(tCurBattleRole.RealCritDmg + tempCritDmg)) .. "%"
end

------@param hero RoleData
function M:UpdataGear(hero)
    local tEquipData = { hero.armor1, hero.armor2 }
    if RoleCardViewModel.CurArmorType == 1 then
        tEquipData = {hero.heroDefArmor1, hero.heroDefArmor2}
    end
    if RoleCardViewModel.CurType == "Friend" then
        tEquipData = { self.CurFriendHero.heroArmor1, self.CurFriendHero.heroArmor2 }
    end
    for i = 1, #self.GearObj do
        local _GearItem = CJNUIMgr.GetSunUseName(self.GearObj[i], "GearItem")
        local _GearEmptyItem = CJNUIMgr.GetSunUseName(self.GearObj[i], "GearEmptyItem")
        
        if tEquipData[i] ~= 0 and tEquipData[i] ~= nil then
            if RoleCardViewModel.CurType == "Friend" then
                local heroArmor1 = tEquipData[i]
                local tGearData = CoreControl.CreateSingleCore(heroArmor1.armorID, heroArmor1.armorProperties, heroArmor1.armorSkill)
                self:InitGearDetailPanel(tGearData, _GearItem, i)
            else
                self.GearPanelUID[i] = tEquipData[i]
                local tGearData = CoreControl.GetSingleCoreData(self.GearPanelUID[i])
                self:InitGearDetailPanel(tGearData, _GearItem, i)
                ReadData.InitRoleGear(self.CurHeroAttr, tGearData.attrs, true)
            end

            _GearItem:SetActive(true)
            _GearEmptyItem:SetActive(false)
        else
            _GearItem:SetActive(false)
            _GearEmptyItem:SetActive(true)
        end
    end
    --更新属性Panel基础信息
    self:InitRoleInfoPanel()
end

--根据品质获品质对应图片名称(新加了带jia的品质，不确定原来的图片是否被其他地方使用，所以不能改名)
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

---检查驾驶员红点
function M:CheckRot(hero)
    if RoleCardViewModel.CurType == "Friend" then
        self.RedDotIcon().gameObject:SetActive(false)
        self.RedDotIcon01().gameObject:SetActive(false)
        return
    end
    local tIsRot = false
    ---检查是否能够升星或者觉醒
    local attr = hero:GetHeroAttr()
    if SysLockControl.CheckSysLock(1004) then
        ---判断能否觉醒(若已觉醒，则隐藏按钮)
        if attr.IsAwaken then
            self.Btn_Juexing().gameObject:SetActive(false)
            self.Btn_Shengji1().transform.localPosition = self.Btn_Shengji2().transform.localPosition
            self.Btn_Shengji1().transform.sizeDelta = self.Btn_Shengji2().transform.sizeDelta
        else
            self.Btn_Juexing().gameObject:SetActive(true)
            self.Btn_Shengji1().transform.localPosition = self.LvUpPos
            self.Btn_Shengji1().transform.sizeDelta = self.LvUpSize
            if attr.StartLV >= attr.awakenStar then
                self.Jx_Suo().gameObject:SetActive(false)
                --新修改 不可觉醒时隐藏觉醒按钮
                self.Btn_Juexing().gameObject:SetActive(true)

                if RoleCardViewModel.CheckAwake(hero) then
                    self.JXRedDotIcon().gameObject:SetActive(true)
                    tIsRot = true
                else
                    self.JXRedDotIcon().gameObject:SetActive(false)
                end
            else
                self.Jx_Suo().gameObject:SetActive(true)
                --新修改 不可觉醒时隐藏觉醒按钮
                self.Btn_Juexing().gameObject:SetActive(false)

                self.JXRedDotIcon().gameObject:SetActive(false)
            end
        end
    else
        self.Jx_Suo().gameObject:SetActive(true)
        --新修改 不可觉醒时隐藏觉醒按钮
        self.Btn_Juexing().gameObject:SetActive(false)
        
        self.JXRedDotIcon().gameObject:SetActive(false)
    end
    ---升级与突破
    if SysLockControl.CheckSysLock(1001) then
        self.Shengji_Suo().gameObject:SetActive(false)
        if attr.LV >= attr.LvMax then
            if attr.StartLV >= 6 then
                self.Text_Shengji01().text = MgrLanguageData.GetLanguageByKey("ui_levelmax_text")
            else
                self.Text_Shengji01().text = MgrLanguageData.GetLanguageByKey("newroledetail2_ui_enhancement")
            end
        else
            self.Text_Shengji01().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text15")
        end

        if attr.LV >= attr.LvMax then
            if RoleCardViewModel.CheckStarUp(hero) then

                --玩家当前等级是否支持此次突破
                local tab = {}
                local t = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][7]
                local a = string.split(t,',')
                for i, v in ipairs(a) do
                    local d = string.split(v,'_')
                    tab[tonumber(d[1])] = tonumber(d[2])
                end
                local t_start = tab[attr.Rank]
                if attr.StartLV >= t_start then
                    self.StarRedDotIcon().gameObject:SetActive(false)
                    self.StarRedDotIcon01().gameObject:SetActive(false)
                    tIsRot = false
                else
                    self.StarRedDotIcon().gameObject:SetActive(true)
                    self.StarRedDotIcon01().gameObject:SetActive(true)
                    tIsRot = true
                end
            else
                self.StarRedDotIcon().gameObject:SetActive(false)
                self.StarRedDotIcon01().gameObject:SetActive(false)
            end
        else
            self.StarRedDotIcon().gameObject:SetActive(false)
            self.StarRedDotIcon01().gameObject:SetActive(false)
        end
    else
        if attr.LV >= attr.LvMax then
            self.Text_Shengji01().text = MgrLanguageData.GetLanguageByKey("ui_levelup_max")
        else
            self.Text_Shengji01().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text15")
        end
        self.Shengji_Suo().gameObject:SetActive(true)
        self.StarRedDotIcon().gameObject:SetActive(false)
        self.StarRedDotIcon01().gameObject:SetActive(false)
    end
    self.RedDotIcon01().gameObject:SetActive(tIsRot)
    ---检查是否能够技能升级
    tIsRot = false
    if self.CurHeroAttr.SkillLV < self.CurHeroAttr.SkillMaxLV then
        local mCostNeed = 0     --主材料消耗数量
        local coinNeed = 0      --货币消耗数量
        local coinItem = 0      --消耗货币材料
        local str = string.split(self.CurHero.CostIcon,"_")
        local mainCost = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))    --主要消耗材料
        ---材料赋值
        --for k,v in pairs(RoleattriskillupLocalData.tab) do
        --    if v[2] == self.CurHeroAttr.Rank and v[3] == hero.skillLevel then  --判断同级别，同等级的消耗
        --        mCostNeed = tonumber(string.split(v[4],"_")[3])
        --        coinItem = ItemControl.GetItemByIdAndType(tonumber(string.split(v[5],"_")[2]),tonumber(string.split(v[5],"_")[1]))
        --        coinNeed = tonumber(string.split(v[5],"_")[3])
        --        break
        --    end
        --end
        local v = SkillUpControl.GetSkillUpData(self.CurHeroAttr.Rank, hero.skillLevel, hero.New_Career)
        if v ~= nil then
            mCostNeed = tonumber(v.cost[3])
            coinItem = ItemControl.GetItemByIdAndType(tonumber(v.ortherCost[2]),tonumber(v.ortherCost[1]))
            coinNeed = tonumber(v.ortherCost[3])
            if type(coinItem) ~= "number" and  mainCost.count >= mCostNeed and coinItem.count >= coinNeed then
                tIsRot = true
            end
        end
    end
    self.SkillRedDotIcon().gameObject:SetActive(tIsRot and SysLockControl.CheckSysLock(1002))
    self.RedDotIcon().gameObject:SetActive(tIsRot and SysLockControl.CheckSysLock(1002))
    self.StarRedDotIcon_Qianghua().gameObject:SetActive(false)
    ---检查特殊共鸣装备是否能合成(等级达到最大/为拥有/系统打开)
    if EquipControl.GetSingleSpecialEquip(hero.id) and hero:HeroAllEquipLevelMax() and not EquipControl.GetSingleSpecialEquip(hero.id).lockState and EquipControl.SpecialEquipOnOrOff() then
        local SpecialGear = EquipControl.GetSingleSpecialEquip(hero.id)
        if SpecialGear then
            ---@type ItemData[]
            local materials = SpecialGear:GetMixMaterial()
            local enough = true
            for i,v in pairs(materials) do
                local bagItem = ItemControl.GetItemByIdAndType(v.id,v.goodsType)
                if bagItem.count < v.count then
                    enough = false
                    break
                end
            end
            if enough then
                self.StarRedDotIcon02().gameObject:SetActive(true)
                self.RedDotIcon_Void().gameObject:SetActive(true)
            else
                self.StarRedDotIcon02().gameObject:SetActive(false)
                self.RedDotIcon_Void().gameObject:SetActive(false)
            end
        else
            self.StarRedDotIcon02().gameObject:SetActive(false)
            self.RedDotIcon_Void().gameObject:SetActive(false)
        end
    else
        self.StarRedDotIcon02().gameObject:SetActive(false)
        self.RedDotIcon_Void().gameObject:SetActive(false)
    end
    ---检查特殊共鸣装备是否能升级
    if EquipControl.GetSingleSpecialEquip(hero.id) and EquipControl.GetSingleSpecialEquip(hero.id).lockState and EquipControl.SpecialEquipOnOrOff() then
        local SpecialGear = EquipControl.GetSingleSpecialEquip(hero.id)
        if SpecialGear then
            ---@type ItemData[]
            local materials = SpecialGear:GetLevelUpMaterial()
            local materials2 = SpecialGear:GetAdvanceMaterial()
            local enough = true
            if SpecialGear.evolutionLevel < SpecialGear:GetMaxLevel() then
                for i,v in pairs(materials) do
                    local bagItem = ItemControl.GetItemByIdAndType(v.id,v.goodsType)
                    if bagItem.count < v.count then
                        enough = false
                        break
                    end
                end
            else
                for i,v in pairs(materials2) do
                    local bagItem = ItemControl.GetItemByIdAndType(v.id,v.goodsType)
                    if bagItem.count < v.count then
                        enough = false
                        break
                    end
                end
            end
            if enough then
                self.StarRedDotIcon_Qianghua().gameObject:SetActive(true)
                self.RedDotIcon_Void().gameObject:SetActive(true)
            else
                self.StarRedDotIcon_Qianghua().gameObject:SetActive(false)
                self.RedDotIcon_Void().gameObject:SetActive(false)
            end
        else
            self.StarRedDotIcon_Qianghua().gameObject:SetActive(false)
            self.RedDotIcon_Void().gameObject:SetActive(false)
        end
    end
    if EquipControl.GetSingleSpecialEquip(hero.id) ~= nil and EquipControl.GetSingleSpecialEquip(hero.id):MaxLevel() == EquipControl.GetSingleSpecialEquip(hero.id).evolutionLevel then
        self.StarRedDotIcon_Qianghua().gameObject:SetActive(false)
        self.RedDotIcon_Void().gameObject:SetActive(false)
    end
end
---初始化一个共鸣装备属性词条UI
function M:InitVoidGearInfoDataPrefab(_VoidGearInfoObj, _InfoTab, _CurLv)
    -- statements
    local _tempInfoTab1 = JNStrTool.strSplit("_", _InfoTab) --切割获取对应的属性类型和具体计算公式
    --根据得到的属性类型更新属性图标和文字
    local _VoidGearInfoText = CJNUIMgr.GetSunUseName(_VoidGearInfoObj, "VoidGearInfoText")
    local _VoidGearText = CJNUIMgr.GetSunUseName(_VoidGearInfoObj, "VoidGearText")
    local _VoidGearIcon = CJNUIMgr.GetSunUseName(_VoidGearInfoObj, "VoidGearIcon")
    MgrRes.LoadSprite(_VoidGearIcon:GetComponent("Image"), "Attribute/GearInfoIcon_" .. _tempInfoTab1[1])
    local _tempInfoTab2 = JNStrTool.strSplit("*", _tempInfoTab1[2]) --切割公式拿到等级相关系数
    local _CurInfoData = tonumber(_CurLv) * tonumber(_tempInfoTab2[2])
    if _CurInfoData ~= 0 then
        if _tempInfoTab1[1] == "0" or _tempInfoTab1[1] == "2" then
            ReadData.SetAdd_Abt(self.CurHeroAttr, tonumber(_tempInfoTab1[1]), _CurInfoData)
        else
            ReadData.SetAdd_Abt(self.CurHeroAttr, tonumber(_tempInfoTab1[1]), _CurInfoData * 0.01)
        end
    end
    if _tempInfoTab1[1] == "0" then
        -- 固定攻击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. _CurInfoData
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("character_cv_type23")
    elseif _tempInfoTab1[1] == "1" then
        -- 百分比攻击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. (_CurInfoData * 0.01) .. "%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("character_cv_type23")
    elseif _tempInfoTab1[1] == "2" then
        -- 固定生命
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. _CurInfoData
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("coreattrdata_health")
    elseif _tempInfoTab1[1] == "3" then
        -- 百分比生命
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. (_CurInfoData * 0.01) .. "%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("coreattrdata_health")
    elseif _tempInfoTab1[1] == "4" then
        -- 防御
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. (_CurInfoData * 0.01) .. "%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("coreattrdata_defense")
    elseif _tempInfoTab1[1] == "5" then
        -- 暴击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. (_CurInfoData * 0.01) .. "%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("coreattrdata_critical")
    elseif _tempInfoTab1[1] == "6" then
        -- 暴伤
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. (_CurInfoData * 0.01) .. "%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("coreattrdata_criticaldamage")
    elseif _tempInfoTab1[1] == "7" then
        -- 敏捷
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. (_CurInfoData * 0.01) .. "%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("coreattrdata_agile")
    elseif _tempInfoTab1[1] == "8" then
        -- 支援力
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text = "" .. (_CurInfoData * 0.01) .. "%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("coreattrdata_support")
    end
end

---更新人物好感度信息
---@param hero RoleData
function M:UpdateRoleFavorInfo(hero)
    local tCurFavorLv = Global.CheckFavorLv(hero.favor)
    ---好感等级
    self.CurRoleFavorabilityText().text = tCurFavorLv
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV, _Root, _Prefab)
    Tools.ClearAllChild(_Root)
    local tempObjList = {}
    for i = 1, _StarLV, 1 do
        tempObjList[i] = self:CreatStar(_Root, _Prefab)
    end
    
    return tempObjList
end
---创建星星
function M:CreatStar(_Root, _Prefab)
    -- statements
    local UnJuxingStar = self:CreatGo(_Prefab, _Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x, UnJuxingStar.transform.localPosition.y, 0)
    
    return UnJuxingStar
end
---创建一个物体
function M:CreatGo(_Prefab, _Root)
    -- statements
    if _Prefab == nil then
        print(_Prefab)
    end
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform, false)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---点击弹出技能详情界面(new)
function M:InitCoreSkillPanel(_skillId)
    MgrUI.Pop(UID.CoreSkill_UI, _skillId, true)
end
---脱下装备
function M:OnClickTakeOff()
    print("脱下")
    local ArmorREQ = {
        data = {
            [1] = {
                heroID = RoleCardViewModel.CurrentHero.id,
                armorID = 0,
                armorSolt = self.TouchGearID,
                armorGroup = RoleCardViewModel.CurArmorType
            }
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ', ArmorREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ, bytes, 1, nil, Handle(self, self.ClientReDetailAck), Handle(self, self.ClientReDetailNTF))
end
function M:ClientReDetailAck(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorACK', buffer))
    if tab.errNo ~= 0 then
        print("卸载装备失败：" .. tab.errNo)
    end
end
---脱下装备返回
function M:ClientReDetailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorNTF', buffer))
    if tag == 1 then
        local roleData = nil
        local coreData = nil
        roleData = HeroControl.GetRoleDataByID(tab.data[1].heroID)
        if tab.data[1].armorGroup == 0 then
            if tab.data[1].armorSolt == 1 then
                roleData.armor1 = 0
            elseif tab.data[1].armorSolt == 2 then
                roleData.armor2 = 0
            end
        else
            if tab.data[1].armorSolt == 1 then
                roleData.heroDefArmor1 = 0
            elseif tab.data[1].armorSolt == 2 then
                roleData.heroDefArmor2 = 0
            end
        end
        coreData = RoleCardViewModel.CurrentCore
        coreData:ReLoadCore(0, 0, tab.data[1].armorGroup)
        CoreControl.GetCores()
        --RoleCardViewModel.ReloadCacheRoleData()
        self:UpdataDetailPanel()
    end
end
---新手引导
function M:AddNoviceEvent()
    Event.Clear("NoviceLVUP")
    Event.Add("NoviceLVUP",function()
        if SysLockControl.CheckSysLock(1001) then
            if self.CurHero.lockState then
                if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
                    ---突破KD
                    if self.CurHeroAttr.StartLV < 6 then
                        self:SpineMove(-250, 0.3)
                        self:ShowPanel(false)
                        MgrUI.Pop(UID.NewRoleFormation_UI, { "StarUpGrade", self })
                        self.Btn_Yigui().gameObject:SetActive(false)
                    end
                else
                    ---升级
                    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
                        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips1"), 1 }, true)
                        return
                    end
                    self:SpineMove(-250, 0.3)
                    self:ShowPanel(false)
                    MgrUI.Pop(UID.NewRoleFormation_UI, { "LvUpGrade", self })
                    self.Btn_Yigui().gameObject:SetActive(false)
                end
            end
        else
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1001), 1 }, true)
        end
        NoviceViewModel.DoNext()
    end)

    Event.Clear("NoviceSkillUp")
    Event.Add("NoviceSkillUp",function()
        if SysLockControl.CheckSysLock(1002) then
            --if self.CurHeroAttr.SkillLV >= self.CurHeroAttr.SkillMaxLV then
            --    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips1"), 1 }, true)
            --    return
            --end
            --self:SpineMove(-250, 0.3)
            --self:ShowPanel(false)
            MgrUI.GoHide(UID.NewRoleSkill02_UI)
        else
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1002), 1 }, true)
        end
        NoviceViewModel.DoNext()
    end)
end

function M:BackClick()    
    self:SpineMove(self.SpinePosX, 0.3)
    self:ShowPanel(true)
    self:UpdataDetailPanel()
end

function M:YiguiSwitch()
    self:HideCloseBtn()
end
---FB分享
function M:FBShareUrl()
    --MgrSdk.CS:FlyFunFBSharingUrl("http://www.feiyougames.com/privacy.html","苍雾残响","......",Handle(self,function(str)
    --    if str == "0" then
    --        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips8"), 1 }, true)
    --        local tab = {
    --            id = tonumber(SteamLocalData.tab[113032][2])
    --        }
    --        ---序列化
    --        local bytes = assert(pb.encode('PBClient.ClientShareREQ',tab))
    --        TaskControl.AckError = true
    --        MgrNet.SendReq(MID.CLIENT_SHARE_REQ,bytes,0,nil, function(buffer,tag)
    --            local recAck = assert(pb.decode('PBClient.ClientShareACK',buffer))
    --            if recAck.errNo ~= 0 then
    --                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips3"),2},true)
    --            end
    --        end,function(buffer,tag)
    --            local tab = assert(pb.decode('PBClient.ClientShareNTF', buffer))
    --            ---更新数据统计
    --            TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    --        end)
    --    else
    --        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips9"), 1 }, true)
    --    end
    --end))
    MgrSdk.CS:FlyFunFBSharingBit(MgrLanguageData.GetLanguageByKey("downloadpanel_tips5"),function(str)
        if str == "0" then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips8"), 1 }, true)
            local tab = {
                id = tonumber(SteamLocalData.tab[113032][2])
            }
            ---序列化
            local bytes = assert(pb.encode('PBClient.ClientShareREQ',tab))
            TaskControl.AckError = true
            MgrNet.SendReq(MID.CLIENT_SHARE_REQ,bytes,0,nil, function(buffer,tag)
                local recAck = assert(pb.decode('PBClient.ClientShareACK',buffer))
                if recAck.errNo ~= 0 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips3"),2},true)
                end
            end,function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientShareNTF', buffer))
                ---更新数据统计
                TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
            end)
        else
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips9"), 1 }, true)
        end
    end)
end
---保存至本地
function M:SaveToLocal()
    CMgrCamera.Instance:SaveScreenshotLocal(
            function(str)
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips4").. str, 1 }, true)
            end)
end
---Line分享
function M:LineShareUrl()
    --MgrSdk.FlyFunLineSharingUrl("http://www.feiyougames.com/privacy.html","苍雾残响","......")
    --local tab = {
    --    id = tonumber(SteamLocalData.tab[113033][2])
    --}
    -----序列化
    --local bytes = assert(pb.encode('PBClient.ClientShareREQ',tab))
    --TaskControl.AckError = true
    --MgrNet.SendReq(MID.CLIENT_SHARE_REQ,bytes,0,nil, function(buffer,tag)
    --    local recAck = assert(pb.decode('PBClient.ClientShareACK',buffer))
    --    if recAck.errNo ~= 0 then
    --        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips3"),2},true)
    --    end
    --end,function(buffer,tag)
    --    local tab = assert(pb.decode('PBClient.ClientShareNTF', buffer))
    --    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("downloadpanel_tips8"),2},true)
    --    ---更新数据统计
    --    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    --end)
    --MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips10"), 1}, true)
    MgrSdk.CS:FlyFunLineSharingBit(MgrLanguageData.GetLanguageByKey("downloadpanel_tips5"))
    local tab = {
        id = tonumber(SteamLocalData.tab[113033][2])
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientShareREQ',tab))
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_SHARE_REQ,bytes,0,nil, function(buffer,tag)
        local recAck = assert(pb.decode('PBClient.ClientShareACK',buffer))
        if recAck.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips3"),2},true)
        end
    end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientShareNTF', buffer))
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    end)
end

function M:AddEvent()
    Event.Add("NewRole_BackClick",Handle(self,self.BackClick))
end
---修改面板娘返回
function M:ChooseMenuRoleACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseMenuRoleACK', buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips4"), 2}, true)
    end
end
function M:ChooseMenuRoleNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseMenuRoleNTF', buffer))
    MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().curRoleID), false)
    PlayerControl.GetPlayerData().curRoleID = tab.roleID
    if PosterGirlViewModel.CurSpineObj then
        GameObject.Destroy(PosterGirlViewModel.CurSpineObj)
    end
    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_qita_text99"), 1}, true)
    self:UpdataQinXinState()
end

--设置当前使用的技能等级
function M:SendSkillLevel()
    local ClientSetHeroSkillREQ = {
        heroID = self.CurHero.id,
        skillLevel = self.curSkillLevel
    }
    local bytes = assert(pb.encode('PBClient.ClientSetHeroSkillREQ', ClientSetHeroSkillREQ))
    MgrNet.SendReq(MID.CLIENT_SET_HERO_SKILL_REQ, bytes, 0, nil, Handle(self, self.ClientSetHeroSkillACK), Handle(self, self.ClientSetHeroSkillNTF))
end

function M:ClientSetHeroSkillACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetHeroSkillACK', buffer))
    if tab.errNo ~= 0 then
        if tab.errNo == 3 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3") ,1},true)
        end
    end
end

function M:ClientSetHeroSkillNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetHeroSkillNTF', buffer))
    if tab.heroInfo then
        print(tab)
        HeroControl.PushSingleHeroData(tab.heroInfo)---添加到角色池
        if tab.heroInfo.heroFlag and tab.heroInfo.heroCurSkill < self.CurHero:GetHeroShowSkillLv() then
            self.Text_SkillLv().text = tab.heroInfo.heroCurSkill
            self.Text_SkillLv_Small().gameObject:SetActive(false)
        else
            self.Text_SkillLv().text = self.CurHero:GetHeroShowSkillLv()
            if self.CurHero:CheckHeroEquipIsMax() then
                self.Text_SkillLv_Small().gameObject:SetActive(true)
                self.Text_SkillLv_Small().text = "+1"
                self.Text_SkillLv_Small().color = Color(0.2,1,0.972549,1)
                self.Text_SkillLv().text = self.CurHero:GetHeroShowSkillLv() - 1
                --self.Text_SkillLv().color = Color(1,0.772549,0.2235294,1)
                self.Text_SkillLv_Small().gameObject:SetActive(true)
            else
                self.Text_SkillLv_Small().gameObject:SetActive(false)
            end
        end
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_tongyong_text247") ,1},true)
        self:UpdataDetailPanel() ---更新人物详细信息
        self.ReduceRankPanel().gameObject:SetActive(false)
    end
end

---超限装备开关状态刷新
function M:OnVoidSwitch()
    if self.CurHero.sEquipOff then
        self.VoidOn().transform.localPosition = self.Text_SpecialOn().transform.localPosition
        self.Text_SpecialOn().color = Color(1,1,1,1)
        self.Text_SpecialOff().color = Color(0,0,0,1)
    else
        self.VoidOn().transform.localPosition = self.Text_SpecialOff().transform.localPosition
        self.Text_SpecialOn().color = Color(0,0,0,1)
        self.Text_SpecialOff().color = Color(1,1,1,1)
    end
    self:UpdataDetailPanel()
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrSound.Stop(3, "RoleDetails_"..self.CurHero.id, false)
end

function M:OnClose()
    MgrSound.Stop(3, "RoleDetails_"..self.CurHero.id, false)
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    --Event.Remove("EquipBreakSuccess",Handle(self, self.OnClickRoleVoidSwitch))
    Event.CheckClear("YiguiSwitch")
    Event.CheckClear("UpdataDetailPanel")
    Event.CheckClear("NoviceLVUP")
    Event.CheckClear("NoviceSkillUp")
    Event.CheckClear("NewRole_BackClick")

    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    if self.BGSpine ~= nil then
        GameObject.Destroy(self.BGSpine)
        self.BGSpine = nil
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.FrontSpine ~= nil then
        GameObject.Destroy(self.FrontSpine)
        self.FrontSpine = nil
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    MgrRes.UnLoadUnusedAssets(true)
end

return M