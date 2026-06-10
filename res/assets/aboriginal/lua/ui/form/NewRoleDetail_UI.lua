-- Code Auto Create Begin
local M = Class('NewRoleDetail_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewRoleDetail_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewRoleDetail_UI].prefab'
    self.Name = 'Form[NewRoleDetail_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NomalBg','NomalBg',2},{'LihuiPanel','LihuiPanel',2},{'LihuiSpinePanel','LihuiPanel/LihuiSpinePanel',2},{'DetailPanel','DetailPanel',2},{'Img_xian','DetailPanel/Img_xian',2},{'Img_xian01','DetailPanel/Img_xian',2},{'RoleScrollMask','DetailPanel/RoleScrollMask',2},{'RoleDetailScrollPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel',2},{'Viewport','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport',2},{'RoleDetailScrollRoot','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot',2},{'InfoPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel',2},{'RoleInfoBgPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel',2},{'RoleInfoIconPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel',2},{'TX_BGImage_1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_1',2},{'TX_BGImage_2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_2',2},{'TX_BGImage_3','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_3',2},{'TX_Image_1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_1',2},{'TX_Image_2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_2',2},{'TX_Image_3','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_3',2},{'TX_Image_4','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_4',2},{'TX_Image_5','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_5',2},{'TX_Image_6','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_6',2},{'AtkIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkIcon',2},{'HpIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HpIcon',2},{'DefIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefIcon',2},{'BaojiIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiIcon',2},{'BaoshangIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoshangIcon',2},{'MingjieIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MingjieIcon',2},{'Background','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Background',2},{'Fill','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Fill Area/Fill',2},{'Image','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Image',2},{'Image(1)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Image (1)',2},{'Background01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Background',2},{'Fill01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Fill Area/Fill',2},{'Image01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Image',2},{'Image(1)01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Image (1)',2},{'Background02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Background',2},{'Fill02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Fill Area/Fill',2},{'Image02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Image',2},{'Image(1)02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Image (1)',2},{'Background03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Background',2},{'Fill03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Fill Area/Fill',2},{'Image03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Image',2},{'Image(1)03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Image (1)',2},{'Background04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Background',2},{'Fill04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Fill Area/Fill',2},{'Image04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Image',2},{'Image(1)04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Image (1)',2},{'Btn_PreviewLv','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_PreviewLv',2},{'UpLvBg','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg',2},{'RoleUpLvBtn','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleUpLvBtn',2},{'Lvbg','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg',2},{'Lvbg01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg/Lvbg',2},{'Lvbg02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg/Lvbg',2},{'RoleLvSlider','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg/RoleLvSlider',2},{'Btn_Juexing','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Juexing',2},{'Img_Juexingdi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Juexing/Img_Juexingdi',2},{'JXRedDotIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Juexing/JXRedDotIcon',2},{'Btn_Shengxing','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Shengxing',2},{'Img_Shengxingdi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Shengxing/Img_Shengxingdi',2},{'StarRedDotIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Shengxing/StarRedDotIcon',2},{'Img_xian02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/Img_xian',2},{'Img_xian03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/Img_xian',2},{'SkillPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel',2},{'Btn_PreviewSkill','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Btn_PreviewSkill',2},{'Img_Julikuang','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang',2},{'Img_Fanweikuang1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/Img_Fanweikuang1',2},{'Img_Fanweikuang2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/Img_Fanweikuang2',2},{'Btn_Chakan','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/Btn_Chakan',2},{'jinengqianghua','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua',2},{'Btn_SkillUpgrade','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade',2},{'SkillRedDotIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade/SkillRedDotIcon',2},{'RoleSkillIconPanel1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1',2},{'RoleSkillIconImg1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg1',2},{'RoleSkillIconImg2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg2',2},{'RoleSkillIconImg3','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg3',2},{'RoleSkillIconImg4','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4',2},{'ImageSuo','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/ImageSuo',2},{'Image05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/ImageSuo/Image',2},{'JLock','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/JLock',2},{'UnJueXingLine','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/UnJueXingLine',2},{'Img_Fanweidi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi',2},{'Fanwei','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi/Fanwei',2},{'Img_You','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi/Img_You',2},{'Img_Zuo','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi/Img_Zuo',2},{'RoleSkillIconPanel2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2',2},{'RoleSkillIconImg101','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg1',2},{'RoleSkillIconImg201','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg2',2},{'RoleSkillIconImg301','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg3',2},{'RoleSkillIconImg401','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4',2},{'ImageSuo01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/ImageSuo',2},{'Image06','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/ImageSuo/Image',2},{'JLock01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/JLock',2},{'RoleSkillIconImg5','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg5',2},{'Img_Jinengwenzidi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg5/Img_Jinengwenzidi',2},{'VoidPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel',2},{'VoidGearPanel1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1',2},{'gongmingdi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/gongmingdi',2},{'VoidGearDoublePanel1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1',2},{'VoidIconBG','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidIconBG',2},{'VoidGearIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearIcon',2},{'VoidGearDoublePanel2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2',2},{'VoidIconBG01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidIconBG',2},{'VoidGearIcon01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearIcon',2},{'VoidGearInfoSinglePanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel',2},{'VoidIconBG02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidIconBG',2},{'VoidGearIcon02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidGearIcon',2},{'VoidGearLvDotPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearLvDotPanel',2},{'VoidGearLvDotPrefab','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearLvDotPrefab',2},{'VoidGearPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel',2},{'jijiadi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/jijiadi',2},{'VoidGearIcon03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/VoidGearIcon',2},{'EmptyVoidGearIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/EmptyVoidGearIcon',2},{'EmptyPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel',2},{'yuankuang','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/yuankuang',2},{'BG','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/BG',2},{'VoidGearRankIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/VoidGearRankIcon',2},{'VoidGearPanel2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2',2},{'gongmingdi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/gongmingdi',2},{'VoidGearDoublePanel101','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1',2},{'VoidIconBG03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidIconBG',2},{'VoidGearIcon04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearIcon',2},{'VoidGearDoublePanel201','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2',2},{'VoidIconBG04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidIconBG',2},{'VoidGearIcon05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearIcon',2},{'VoidGearInfoSinglePanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel',2},{'VoidIconBG05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidIconBG',2},{'VoidGearIcon06','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidGearIcon',2},{'VoidGearLvDotPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearLvDotPanel',2},{'VoidGearLvDotPrefab01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearLvDotPrefab',2},{'VoidGearPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel',2},{'jijiadi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/jijiadi',2},{'VoidGearIcon07','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/VoidGearIcon',2},{'EmptyVoidGearIcon01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/EmptyVoidGearIcon',2},{'EmptyPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel',2},{'yuankuang01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/yuankuang',2},{'BG01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/BG',2},{'VoidGearRankIcon01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/VoidGearRankIcon',2},{'VoidGearPanel3','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3',2},{'gongmingdi02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/gongmingdi',2},{'VoidGearDoublePanel102','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1',2},{'VoidIconBG06','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidIconBG',2},{'VoidGearIcon08','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearIcon',2},{'VoidGearDoublePanel202','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2',2},{'VoidIconBG07','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidIconBG',2},{'VoidGearIcon09','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearIcon',2},{'VoidGearInfoSinglePanel02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel',2},{'VoidIconBG08','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidIconBG',2},{'VoidGearIcon10','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidGearIcon',2},{'VoidGearLvDotPanel02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearLvDotPanel',2},{'VoidGearLvDotPrefab02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearLvDotPrefab',2},{'VoidGearPanel02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel',2},{'jijiadi02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/jijiadi',2},{'VoidGearIcon11','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/VoidGearIcon',2},{'EmptyVoidGearIcon02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/EmptyVoidGearIcon',2},{'EmptyPanel02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel',2},{'yuankuang02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/yuankuang',2},{'VoidGearRankIcon02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/VoidGearRankIcon',2},{'BG02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/BG',2},{'Bian2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/Bian2',2},{'GearPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel',2},{'RoleGear1Panel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel',2},{'toumingdi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/toumingdi',2},{'GearWearPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel',2},{'Btn_GearUpgrade','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/Btn_GearUpgrade',2},{'Btn_SwtichCurGear','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/Btn_SwtichCurGear',2},{'zhongjian','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/zhongjian',2},{'Btn_UnEquip','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/Btn_UnEquip',2},{'Btn_SwitchDataInfo','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/Btn_SwitchDataInfo',2},{'GearInfoPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel',2},{'jijiamingdi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/jijiamingdi',2},{'rankdi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/jijiamingdi/rankdi',2},{'GearDataPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearDataPanel',2},{'_GearInfoPrefab','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/_GearInfoPrefab',2},{'Img_heidi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/_GearInfoPrefab/Img_heidi',2},{'shuxingtiao','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/_GearInfoPrefab/shuxingtiao',2},{'GearInfoIcon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/_GearInfoPrefab/GearInfoIcon',2},{'GearIconPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel',2},{'jijiazhezhaodi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/jijiazhezhaodi',2},{'GearIconImg','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/GearIconImg',2},{'jijiaandi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/jijiaandi',2},{'GearRankKuangImg','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/GearRankKuangImg',2},{'GearStarPrefab','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/GearStarPrefab',2},{'GearSpecialStarPrefab','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/GearSpecialStarPrefab',2},{'EmptyStarPanelRoot','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/GearStarPanel',2},{'RankPlusPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/RankPlusPanel',2},{'RankPlusIconImg','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/RankPlusPanel/RankPlusIconImg',2},{'QiconBg','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/QiconBg',2},{'Qicon','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/QiconBg/Qicon',2},{'QiconFrame','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearIconPanel/QiconBg/Qicon/QiconFrame',2},{'GearSkillPrefab','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearSkillPrefab',2},{'shuxingtiao01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearSkillPrefab/shuxingtiao',2},{'Image07','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearSkillPrefab/GearInfoNameTxt/Image',2},{'GearInfoIcon01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearSkillPrefab/GearInfoIcon',2},{'GearAddonInfoPrefab','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab',2},{'shuxingtiao02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/shuxingtiao',2},{'GearInfoIcon02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/GearInfoIcon',2},{'Img_Shuxingxian','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/Img_Shuxingxian',2},{'GearEmptyPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel',2},{'BlankIcon1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/GearIconPanel/BlankIcon1',2},{'empty','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/empty',2},{'GearBtnPanel','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/GearBtnPanel',2},{'Btn_Equip','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/GearBtnPanel/Btn_Equip',2},{'jijiamingdi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/jijiamingdi',2},{'Img_Empty1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/Img_Empty1',2},{'RoleGear2Panel1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1',2},{'toumingdi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/toumingdi',2},{'GearWearPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel',2},{'Btn_GearUpgrade01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/Btn_GearUpgrade',2},{'Btn_SwtichCurGear01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/Btn_SwtichCurGear',2},{'zhongjian01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/zhongjian',2},{'Btn_UnEquip01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/Btn_UnEquip',2},{'Btn_SwitchDataInfo01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/Btn_SwitchDataInfo',2},{'GearInfoPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel',2},{'jijiamingdi02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/jijiamingdi',2},{'rankdi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/jijiamingdi/rankdi',2},{'GearDataPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearDataPanel',2},{'_GearInfoPrefab01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/_GearInfoPrefab',2},{'Img_heidi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/_GearInfoPrefab/Img_heidi',2},{'shuxingtiao03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/_GearInfoPrefab/shuxingtiao',2},{'GearInfoIcon03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/_GearInfoPrefab/GearInfoIcon',2},{'GearIconPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel',2},{'jijiazhezhaodi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/jijiazhezhaodi',2},{'GearIconImg01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/GearIconImg',2},{'jijiaandi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/jijiaandi',2},{'GearRankKuangImg01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/GearRankKuangImg',2},{'GearStarPrefab01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/GearStarPrefab',2},{'GearSpecialStarPrefab01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/GearSpecialStarPrefab',2},{'EmptyStarPanelRoot01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'GearStarPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/GearStarPanel',2},{'RankPlusPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/RankPlusPanel',2},{'RankPlusIconImg01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/RankPlusPanel/RankPlusIconImg',2},{'QiconBg01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/QiconBg',2},{'Qicon01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/QiconBg/Qicon',2},{'QiconFrame01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearIconPanel/QiconBg/Qicon/QiconFrame',2},{'GearSkillPrefab01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearSkillPrefab',2},{'shuxingtiao04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearSkillPrefab/shuxingtiao',2},{'Image08','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearSkillPrefab/GearInfoNameTxt/Image',2},{'GearInfoIcon04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearSkillPrefab/GearInfoIcon',2},{'GearAddonInfoPrefab01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab',2},{'shuxingtiao05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/shuxingtiao',2},{'GearInfoIcon05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/GearInfoIcon',2},{'Img_Shuxingxian01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/Img_Shuxingxian',2},{'GearEmptyPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel',2},{'BlankIcon2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/GearIconPanel/BlankIcon2',2},{'empty01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/empty',2},{'GearBtnPanel01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/GearBtnPanel',2},{'Btn_Equip01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/GearBtnPanel/Btn_Equip',2},{'jijiamingdi03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/jijiamingdi',2},{'Img_Empty2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/Img_Empty2',2},{'ScrollbarVertical','DetailPanel/Scrollbar Vertical',2},{'Handle','DetailPanel/Scrollbar Vertical/Sliding Area/Handle',2},{'SwitchPanel','SwitchPanel',2},{'Btn_Switch','SwitchPanel/SwitchGear/Btn_Switch',2},{'Line','SwitchPanel/SwitchGear/Btn_Switch/Line',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchGear/Btn_SwitchHighLight',2},{'Line01','SwitchPanel/SwitchGear/Btn_SwitchHighLight/Line',2},{'Btn_Switch01','SwitchPanel/SwitchVoid/Btn_Switch',2},{'Line02','SwitchPanel/SwitchVoid/Btn_Switch/Line',2},{'Btn_SwitchHighLight01','SwitchPanel/SwitchVoid/Btn_SwitchHighLight',2},{'Line03','SwitchPanel/SwitchVoid/Btn_SwitchHighLight/Line',2},{'Btn_Switch02','SwitchPanel/SwitchSkill/Btn_Switch',2},{'Line04','SwitchPanel/SwitchSkill/Btn_Switch/Line',2},{'Btn_SwitchHighLight02','SwitchPanel/SwitchSkill/Btn_SwitchHighLight',2},{'Line05','SwitchPanel/SwitchSkill/Btn_SwitchHighLight/Line',2},{'Btn_Switch03','SwitchPanel/SwitchInfo/Btn_Switch',2},{'Line06','SwitchPanel/SwitchInfo/Btn_Switch/Line',2},{'Btn_SwitchHighLight03','SwitchPanel/SwitchInfo/Btn_SwitchHighLight',2},{'Line07','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/Line',2},{'RoleInfoPanel','RoleInfoPanel',2},{'LowerInfoPanel','RoleInfoPanel/LowerInfoPanel',2},{'Img_guang','RoleInfoPanel/LowerInfoPanel/Img_guang',2},{'ProTypeImg','RoleInfoPanel/LowerInfoPanel/ProTypeImg',2},{'StarPrefab','RoleInfoPanel/LowerInfoPanel/StarPrefab',2},{'StarPrefabJueXing','RoleInfoPanel/LowerInfoPanel/StarPrefabJueXing',2},{'StarPanel','RoleInfoPanel/LowerInfoPanel/StarPanel',2},{'pilot','RoleInfoPanel/LowerInfoPanel/pilot',2},{'RoleNameBG','RoleInfoPanel/LowerInfoPanel/RoleNameBG',2},{'Btn_Story','RoleInfoPanel/LowerInfoPanel/Btn_Story',2},{'GroupIconImgBg','RoleInfoPanel/GroupIconImgBg',2},{'GroupIconImg','RoleInfoPanel/GroupIconImgBg/GroupIconImg',2},{'RoleFavorabilityPanel','RoleInfoPanel/RoleFavorabilityPanel',2},{'RoleFavorabilitySlider','RoleInfoPanel/RoleFavorabilityPanel/RoleFavorabilitySlider',2},{'haogandudi','RoleInfoPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/haogandudi',2},{'CenterFavorSlider','RoleInfoPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/haogandudi/CenterFavorSlider',2},{'Img_Haogandudi','RoleInfoPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/Img_Haogandudi',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu','UpperBtnPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UpperBtnPanel/ReturnBg/Btn_Back',2},{'RoleSpineClickArea','RoleSpineClickArea',2},{'Btn_NextRole','Btn_NextRole',2},{'Btn_PrevRole','Btn_PrevRole',2},
        -- Text 列表
        {'HpNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HpNameTxt',3},{'AtkNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkNameTxt',3},{'AtkInfoTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkNameTxt/AtkInfoTxt',3},{'DefNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefNameTxt',3},{'BaojiNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiNameTxt',3},{'BaoShangNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoShangNameTxt',3},{'MinjieNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieNameTxt',3},{'HPInfoTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HPInfoTxt',3},{'DefInfoTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefInfoTxt',3},{'BaojiInfoTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiInfoTxt',3},{'BaoshangInfoTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoshangInfoTxt',3},{'MinjieInfoTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieInfoTxt',3},{'ZhiYuanNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt',3},{'ZhiYuanInfoTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanInfoTxt',3},{'RolePreviewTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_PreviewLv/RolePreviewTxt',3},{'RoleExpNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleExpNameTxt',3},{'RoleLvUpBtnTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleUpLvBtn/RoleLvUpBtnTxt',3},{'RoleMaxTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleUpLvBtn/RoleMaxTxt',3},{'LV','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/LV',3},{'LvMax_Text','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/LvMax_Text',3},{'RoleMaxLvTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/RoleMaxLvTxt',3},{'RoleExpTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/RoleExpTxt',3},{'RoleCurLvTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/RoleCurLvTxt',3},{'Text_Juexing','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Juexing/Text_Juexing',3},{'Text_Shengxing','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_Shengxing/Text_Shengxing',3},{'ChakanXiangqingTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Btn_PreviewSkill/ChakanXiangqingTxt',3},{'AttackType1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/AttackType1',3},{'AttackType2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/AttackType2',3},{'RoleRankTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/RoleRankTxt',3},{'RoleSkillUpBtnTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade/RoleSkillUpBtnTxt',3},{'RoleSkillMAXTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade/RoleSkillMAXTxt ',3},{'RoleSkillTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/RoleSkillTxt',3},{'Text_Jinengwenzi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/JLock/Text_Jinengwenzi',3},{'Text_Jinengwenzi01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/JLock/Text_Jinengwenzi',3},{'Text_Jinengwenzi02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg5/Img_Jinengwenzidi/Text_Jinengwenzi',3},{'tishi','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/tishi',3},{'Text_1','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/gongmingdi/Text_1',3},{'VoidGearInfoText','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearInfoText',3},{'VoidGearText','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearText',3},{'VoidGearInfoText01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearInfoText',3},{'VoidGearText01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearText',3},{'VoidGearInfoText02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidGearInfoText',3},{'VoidGearText02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidGearText',3},{'EmptyText','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel/EmptyText',3},{'VoidGearNameText','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/BG/VoidGearNameText',3},{'Text','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/Text',3},{'Text_2','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/gongmingdi/Text_2',3},{'VoidGearInfoText03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearInfoText',3},{'VoidGearText03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearText',3},{'VoidGearInfoText04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearInfoText',3},{'VoidGearText04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearText',3},{'VoidGearInfoText05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidGearInfoText',3},{'VoidGearText05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidGearText',3},{'EmptyText01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel/EmptyText',3},{'VoidGearNameText01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/BG/VoidGearNameText',3},{'Text01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/Text',3},{'Text_3','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/gongmingdi/Text_3',3},{'VoidGearInfoText06','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearInfoText',3},{'VoidGearText06','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearText',3},{'VoidGearInfoText07','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearInfoText',3},{'VoidGearText07','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearText',3},{'VoidGearInfoText08','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidGearInfoText',3},{'VoidGearText08','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidGearText',3},{'EmptyText02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel/EmptyText',3},{'VoidGearNameText02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/BG/VoidGearNameText',3},{'Text02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/Text',3},{'Btn_Txt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/Btn_GearUpgrade/Btn_Txt',3},{'Btn_Txt01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/Btn_SwtichCurGear/Btn_Txt',3},{'Btn_Txt02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearBtnPanel/Btn_UnEquip/Btn_Txt',3},{'GearUpgradeText','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/jijiamingdi/rankdi/GearUpgradeText',3},{'GearNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/jijiamingdi/GearNameTxt',3},{'GearInfoText','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/_GearInfoPrefab/GearInfoText',3},{'GearInfoNameTxt','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/_GearInfoPrefab/GearInfoNameTxt',3},{'GearInfoNameTxt01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearSkillPrefab/GearInfoNameTxt',3},{'GearInfoText01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/GearInfoText',3},{'GearText','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/GearText',3},{'Btn_Txt03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/GearBtnPanel/Btn_Equip/Btn_Txt',3},{'Text03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/GearEmptyPanel/jijiamingdi/Text',3},{'Text_1(hexin)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear1Panel/Text_1(hexin)',3},{'Btn_Txt04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/Btn_GearUpgrade/Btn_Txt',3},{'Btn_Txt05','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/Btn_SwtichCurGear/Btn_Txt',3},{'Btn_Txt06','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearBtnPanel/Btn_UnEquip/Btn_Txt',3},{'GearUpgradeText01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/jijiamingdi/rankdi/GearUpgradeText',3},{'GearNameTxt01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/jijiamingdi/GearNameTxt',3},{'GearInfoText02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/_GearInfoPrefab/GearInfoText',3},{'GearInfoNameTxt02','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/_GearInfoPrefab/GearInfoNameTxt',3},{'GearInfoNameTxt03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearSkillPrefab/GearInfoNameTxt',3},{'GearInfoText03','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/GearInfoText',3},{'GearText01','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearWearPanel/GearInfoPanel/GearAddonInfoPrefab/GearText',3},{'Btn_Txt07','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/GearBtnPanel/Btn_Equip/Btn_Txt',3},{'Text04','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/GearEmptyPanel/jijiamingdi/Text',3},{'Text_2(hexin)','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/GearPanel/RoleGear2Panel1/Text_2(hexin)',3},{'EnText','SwitchPanel/SwitchGear/Btn_Switch/EnText',3},{'CNText','SwitchPanel/SwitchGear/Btn_Switch/CNText',3},{'EnText01','SwitchPanel/SwitchGear/Btn_SwitchHighLight/EnText',3},{'CNText01','SwitchPanel/SwitchGear/Btn_SwitchHighLight/CNText',3},{'EnText02','SwitchPanel/SwitchVoid/Btn_Switch/EnText',3},{'CNText02','SwitchPanel/SwitchVoid/Btn_Switch/CNText',3},{'EnText03','SwitchPanel/SwitchVoid/Btn_SwitchHighLight/EnText',3},{'CNText03','SwitchPanel/SwitchVoid/Btn_SwitchHighLight/CNText',3},{'EnText04','SwitchPanel/SwitchSkill/Btn_Switch/EnText',3},{'CNText04','SwitchPanel/SwitchSkill/Btn_Switch/CNText',3},{'EnText05','SwitchPanel/SwitchSkill/Btn_SwitchHighLight/EnText',3},{'CNText05','SwitchPanel/SwitchSkill/Btn_SwitchHighLight/CNText',3},{'EnText06','SwitchPanel/SwitchInfo/Btn_Switch/EnText',3},{'CNText06','SwitchPanel/SwitchInfo/Btn_Switch/CNText',3},{'EnText07','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/EnText',3},{'CNText07','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/CNText',3},{'RoleNameTxt','RoleInfoPanel/LowerInfoPanel/RoleNameBG/RoleNameTxt',3},{'Btn_StoryText','RoleInfoPanel/LowerInfoPanel/Btn_Story/Btn_StoryText',3},{'CurRoleFavorabilityText','RoleInfoPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/haogandudi/CurRoleFavorabilityText',3},{'Text_Haogandu','RoleInfoPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/Text_Haogandu',3},{'Text_TitleCn','UpperBtnPanel/Text_TitleCn',3},{'Text_TitleEn','UpperBtnPanel/Text_TitleEn',3},{'CnBgTitle','UpperBtnPanel/CnBgTitle',3},{'EnBgTitle','UpperBtnPanel/EnBgTitle',3},
        -- Slider 列表
        {'ZhiYuanSlider','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider',5},{'DefenceSlider','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider',5},{'MinjieSlider','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider',5},{'BaojiSlider','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider',5},{'BaoshangSlider','DetailPanel/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider',5},
        -- Toggle 列表
        {'SwitchGear','SwitchPanel/SwitchGear',13},{'SwitchVoid','SwitchPanel/SwitchVoid',13},{'SwitchSkill','SwitchPanel/SwitchSkill',13},{'SwitchInfo','SwitchPanel/SwitchInfo',13},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---初始化左侧按钮
    self:InitSwitch()
    ---初始化按钮
    self:InitButton()
    --
    self.CurPanel = 0
    ------初始化页面
    Event.Clear("BackClick")
    Event.Add("BackClick",function ()
        -- statements
        self:BackClick()
    end)
    Event.Clear("NoviceGoMenu")
    Event.Add("NoviceGoMenu",function ()
        -- statements
        MgrUI.GoBackTo(UID.Home_UI, function ()
            NoviceViewModel.DoNext()
        end)
    end)
    ------新手技能升级
    Event.Clear("NoviceSkillUp")
    Event.Add("NoviceSkillUp",function ()
        self:SpineMove(-250,0.3)
        self:HidePanel()
        self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_skill_enhancement"),"SKILL ENHANCEMENT")
        self.CurPanel = 1
        MgrUI.Go(UID.RoleSkillUpgrade_UI, function ()
            NoviceViewModel.DoNext()
        end)
    end)
    ------新手升级
    Event.Clear("NoviceLVUP")
    Event.Add("NoviceLVUP",function ()
        self:SpineMove(-250,0.3)
        self:HidePanel()
        self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_upgrade"),"ROLE UPGRADE")
        self.CurPanel = 1
        MgrUI.Go(UID.NewRoleLevelUpgrade_UI, function ()
            NoviceViewModel.DoNext()
        end)
    end)

    ------新手突破
    Event.Clear("NoviceSX")
    Event.Add("NoviceSX",function ()
        self:SpineMove(-250,0.3)
        self:HidePanel()
        self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_risingstar"),"ROLE UPGRADE")
        self.CurPanel = 1
        MgrUI.Go(UID.RoleStarUpgrade_UI, function ()
            NoviceViewModel.DoNext()
        end)
    end)
    self:InitPanel()
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format("New_%s_%s",PlayerControl.GetPlayerData().UID,self.CurHero.id))
    if isNew == nil or isNew == "" then
        UnityEngine.PlayerPrefs.SetString(string.format("New_%s_%s",PlayerControl.GetPlayerData().UID,self.CurHero.id),self.CurHero.id)
    end
    if SysLockControl.CheckSysLock(1005) then
        self.SwitchVoid().gameObject:SetActive(true)
        self.VoidPanel().gameObject:SetActive(true)
    else
        self.SwitchVoid().gameObject:SetActive(false)
        self.VoidPanel().gameObject:SetActive(false)
    end
    if SysLockControl.CheckSysLock(1006) then
        self.SwitchGear().gameObject:SetActive(true)
        self.GearPanel().gameObject:SetActive(true)
    else
        self.SwitchGear().gameObject:SetActive(false)
        self.GearPanel().gameObject:SetActive(false)
    end

    ---页面类型不同，展示不同UI
    ---不是自己的角色不展示一些交互按钮
    if(RoleCardViewModel.CurType == "Friend") then
        self.Btn_GoMenu().gameObject:SetActive(false)
        self.Btn_Story().gameObject:SetActive(false)
        self.RoleUpLvBtn().gameObject:SetActive(false)
        self.Btn_PreviewLv().gameObject:SetActive(false)
        self.Btn_SkillUpgrade().gameObject:SetActive(false)
        self.Btn_PreviewSkill().gameObject:SetActive(false)
        self.Btn_Juexing().gameObject:SetActive(false)
        self.Btn_Shengxing().gameObject:SetActive(false)
    end
end

function M:OnShowFinish()
    if NoviceViewModel.CurTaskId == 13008 then
        MgrUI.Pop(UID.NoviceFrame_UI,{NoviceViewModel.CurTaskId},true)
    elseif  NoviceViewModel.CurTaskId == 20004 then
        MgrUI.Pop(UID.NoviceFrame_UI,{NoviceViewModel.CurTaskId},true)
    elseif  NoviceViewModel.CurTaskId == 22004 then
        MgrUI.Pop(UID.NoviceFrame_UI,{NoviceViewModel.CurTaskId},true)
    end
end

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function M:PlayTargetRoleAniVoice(_ActorLineId)
    local _AniName=ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName=ActorLinesLocalData.tab[_ActorLineId][13]

    if self.SpineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj,_AniName,false)
    end
    MgrSound.PlayRole(_AudioName,nil,nil,false,0,0)
end

---根据当前好感度等级权重随机出本次的好感度交互台词ID
function M:GetCurFavorWords()
    local _CurRoleFavor= self.CurHero.favor --默认100好感度
    local _ActorLinesType= tonumber(self.CurHero.Interaction)   --当前台词组别
    local _tempActorLineIdTab={}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight=0 --当前总权重值
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == _ActorLinesType and value[4] == 5 then
            ---切割对应的触发条件得到条件表
            local _TempVarTab=JNStrTool.strSplit("_",value[5])
            local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,_CurRoleFavor)
            if _ReturnVar ~= false then
                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
            end
        end
    end
     --local _FinalVoiceLineId = HomeViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
    local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
    self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
end
---初始化页面
function M:InitPanel()
    ----当前选择角色
    ---@type RoleData 当前页面角色
    self.CurHero = RoleCardViewModel.CurrentHero
    self.CurHeroAttr = self.CurHero:GetHeroAttr()
    ---当前选择的好友角色
    self.CurFriendHero = RoleCardViewModel.CurrentFriendHero
    if(self.CurFriendHero) then
        self.CurFheroAttr = ReadData.GetRoleAttr(self.CurFriendHero.heroID,self.CurFriendHero.heroLevel,self.CurFriendHero.heroStar,self.CurFriendHero.heroSkillLevel,self.CurFriendHero.heroAwaken,self.CurFriendHero.heroExp)
    end
    ---星数组
    self.unAwakenStarArr = {}
    ---觉醒星数组
    self.onAwakenStarArr = {}
    for i = 1, 6 do
        ---预创建星
        self.unAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefab().gameObject,self.StarPanel().gameObject.transform,false)
        ---预创建觉醒星
        self.onAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().gameObject.transform,false)
    end
    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)
    ---设置名称
    self.RoleNameTxt().text = self.CurHero.name
    ---设置职业
    MgrRes.LoadSprite(self.ProTypeImg(),self.CurHero.iconCareer)
    ---设置阵营
    MgrRes.LoadSprite(self.GroupIconImg(),"Attribute/"..self.CurHero.CampiconName)
    self:CreatSpine(self.LihuiSpinePanel().gameObject,self.CurHero.id)

    self:UpdataDetailPanel() ---更新人物详细信息
end
---更新人物详细信息
function M:UpdataDetailPanel()
    self.CurHeroAttr = self.CurHero:GetHeroAttr()
    self:InitGearPanel(self.CurHero)  ---更新核心
    self:InitVoidPanel(self.CurHero)---更新共鸣
    self:InitRoleSkillPanel()---更新技能
    self:UpdataRoleInfoPanel(self.CurHeroAttr)---更新角色属性
    self:UpdateRoleFavorInfo(self.CurHero)  ---更新好感度
    self:CheckRot(self.CurHero)
    ---设置星
    for i = 1, #self.unAwakenStarArr do
        self.unAwakenStarArr[i]:SetActive(i <= self.CurHero.star and not self.CurHero.awaken) ---未觉醒星
        self.onAwakenStarArr[i]:SetActive(i <= self.CurHero.star and self.CurHero.awaken)     ---觉醒星
    end
end
---检查驾驶员红点
function M:CheckRot(hero)
    ---检查是否能够升星或者觉醒
    local attr = hero:GetHeroAttr()
    if SysLockControl.CheckSysLock(1004) then
        ---判断能否觉醒
        if attr.IsAwaken then
            self.Btn_Juexing().gameObject:SetActive(false)
        else
            if attr.StartLV >= attr.awakenStar  then
                self.Btn_Juexing().gameObject:SetActive(true)
            else
                self.Btn_Juexing().gameObject:SetActive(false)
            end
        end
        if RoleCardViewModel.CheckAwake(hero) then
            self.JXRedDotIcon().gameObject:SetActive(true)
        else
            self.JXRedDotIcon().gameObject:SetActive(false)
        end
    else
        self.Btn_Juexing().gameObject:SetActive(false)
    end

    if SysLockControl.CheckSysLock(1003) then
        if attr.StartLV >=6 then
            self.Btn_Shengxing().gameObject:SetActive(false)
        else
            if attr.LV >= attr.LvMax then
                self.Btn_Shengxing().gameObject:SetActive(true)
            else
                self.Btn_Shengxing().gameObject:SetActive(false)
            end
        end
        if attr.LV >= attr.LvMax  then
            if RoleCardViewModel.CheckStarUp(hero) then
                self.StarRedDotIcon().gameObject:SetActive(true)
            else
                self.StarRedDotIcon().gameObject:SetActive(false)
            end
        else
            self.StarRedDotIcon().gameObject:SetActive(false)
        end
    else
        self.Btn_Shengxing().gameObject:SetActive(false)
    end
    if SysLockControl.CheckSysLock(1002) then
        self.RoleSkillUpBtnTxt().gameObject:GetComponent("CanvasGroup").alpha = 1
        if hero.skillLevel >= 9 then
            self.SkillRedDotIcon().gameObject:SetActive(false)
            return
        end
        local moneyItem = ItemControl.GetItemByID(100001)
        local costXW = nil
        if hero.rank ==1 or hero.rank ==2 then
            costXW = ItemControl.GetItemByID(110092)
        elseif hero.rank ==3 then
            costXW = ItemControl.GetItemByID(110091)
        elseif hero.rank ==4 then
            costXW = ItemControl.GetItemByID(110090)
        end
        ---检查是否能够技能升级
        for m, n in pairs(RoleattriskillupLocalData.tab) do
            if n[2] == hero.rank and n[3] == hero.skillLevel then
                local arr = JNStrTool.strSplit(",",n[4])
                local xinwu = JNStrTool.strSplit("_",arr[1])
                local money = {0,0,0}
                if arr[2] ~= nil then
                    money = JNStrTool.strSplit("_",arr[2])
                end
                if tonumber(xinwu[3]) <= costXW.count and tonumber(money[3]) <= moneyItem.count then
                    ---
                    self.SkillRedDotIcon().gameObject:SetActive(true)
                    return
                end
                break
            end
        end
        self.SkillRedDotIcon().gameObject:SetActive(false)
    else
        self.SkillRedDotIcon().gameObject:SetActive(false)
        self.RoleSkillUpBtnTxt().gameObject:GetComponent("CanvasGroup").alpha = 0.5
    end
end

function M:OnBackShow()
    self:UpdataDetailPanel()
end
---初始化按钮
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.RoleSpineClickArea().gameObject, Handle(self, self.GetCurFavorWords))---点击角色
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self,self.BackClick))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
            MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---角色档案
    UIEvent.LuaClick(self.Btn_Story().gameObject,Handle(self, function ()
        self:SpineMove(-250,0.3)
        self:HidePanel()
        ---隐藏上方
        self.UpperBtnPanel().gameObject:SetActive(false)
        MgrUI.Pop(UID.RoleDocument_UI,{RoleCardViewModel.CurrentHero,Handle(self, function()
            self:SpineMove(self.SpinePosX,0.3)
            self:ShowPanel()
            ---显示上方按钮
            self.UpperBtnPanel().gameObject:SetActive(true)
            self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_detail"),"RESONANCE")
            self.CurPanel = 0
            --self:UpdataDetailPanel()
        end),self},true)
    end))
    ---升级
    UIEvent.LuaClick(self.RoleUpLvBtn().gameObject,Handle(self,function ()
        if  SysLockControl.CheckSysLock(1001) then
            -- statements
            if self.CurHero.lockState then
                if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips1"),1},true)
                    return
                end
                self:SpineMove(-250,0.3)
                self:HidePanel()
                self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_upgrade"),"ROLE UPGRADE")
                self.CurPanel = 1
                MgrUI.Go(UID.NewRoleLevelUpgrade_UI)
            end
        else
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips2"),SysLockControl.GetUnlockLevel(1001)),1},true)
        end
    end))
    ---预览人物属性
    UIEvent.LuaClick(self.Btn_PreviewLv().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.RolePreview_UI,{self.CurHero,1,nil},true)
    end))
    ---升星
    UIEvent.LuaClick(self.Btn_Shengxing().gameObject,Handle(self,function ()
        if self.CurHero.lockState then
            self:SpineMove(-250,0.3)
            self:HidePanel()
            self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_upgrade"),"ROLE UPGRADE")
            self.CurPanel = 1
            MgrUI.Go(UID.RoleStarUpgrade_UI)
        end
    end))
    ---觉醒
    UIEvent.LuaClick(self.Btn_Juexing().gameObject,Handle(self,function ()
        if self.CurHero.lockState  then
            self:SpineMove(-250,0.3)
            self:HidePanel()
            self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_awake"),"ROLE AWAKE")
            self.CurPanel = 1
            MgrUI.Go(UID.RoleJueXing_UI)
        end
    end))
    ---技能升级
    UIEvent.LuaClick(self.Btn_SkillUpgrade().gameObject,Handle(self,function ()
        if self.CurHero.skillLevel>=9 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips4"),1},true)
            return
        end
        if  not SysLockControl.CheckSysLock(1002) then
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("newroledetail2_ui_tips5"),SysLockControl.GetUnlockLevel(1002)),1},true)
            return
        end
        if self.CurHero.lockState then
            self:SpineMove(-250,0.3)
            self:HidePanel()
            self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_skill_enhancement"),"SKILL ENHANCEMENT")
            self.CurPanel = 1
            MgrUI.Go(UID.RoleSkillUpgrade_UI)
        end
    end))
    ---预览技能
    UIEvent.LuaClick(self.Btn_PreviewSkill().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.RolePreview_UI,{self.CurHero,3,nil},true)
    end))
    ---查看技能范围
    --UIEvent.LuaClick(self.Btn_Chakan().gameObject,Handle(self,function ()
    --    MgrUI.Pop(UID.RolePreview_UI,{self.CurHero,3,nil},true)
    --end))
    ---装备
    UIEvent.LuaClick(self.Btn_Equip().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 1
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    ---装备
    UIEvent.LuaClick(self.Btn_Equip01().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 2
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    ---装备
    UIEvent.LuaClick(self.Btn_SwtichCurGear().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 1
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    ---装备
    UIEvent.LuaClick(self.Btn_SwtichCurGear01().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 2
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    ---装备
    UIEvent.LuaClick(self.BlankIcon1().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 1
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    ---装备
    UIEvent.LuaClick(self.BlankIcon2().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 2
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    ---装备
    UIEvent.LuaClick(self.Img_Empty1().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 1
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    ---装备
    UIEvent.LuaClick(self.Img_Empty2().gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = 2
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
    UIEvent.LuaClick(self.Btn_GearUpgrade().gameObject,Handle(self,function ()
        RoleCardViewModel.CurrentCore = CoreControl.GetSingleCoreData(self.GearPanel1UID)
        MgrUI.GoHide(UID.NewGearUpgrade_UI)
    end))

    UIEvent.LuaClick(self.Btn_GearUpgrade01().gameObject,Handle(self,function ()
        RoleCardViewModel.CurrentCore = CoreControl.GetSingleCoreData(self.GearPanel2UID)
        MgrUI.GoHide(UID.NewGearUpgrade_UI)
    end))
    UIEvent.LuaClick(self.Btn_UnEquip().gameObject,Handle(self,function ()
        RoleCardViewModel.CurrentCore = CoreControl.GetSingleCoreData(self.GearPanel1UID)
        self.Index = 1
        self:OnClickTakeOff()
    end))

    UIEvent.LuaClick(self.Btn_UnEquip01().gameObject,Handle(self,function ()
        RoleCardViewModel.CurrentCore = CoreControl.GetSingleCoreData(self.GearPanel2UID)
        self.Index = 2
        self:OnClickTakeOff()
    end))
    ---注册滑动监听
    CMgrSpine.Instance:AddScrollListener(self.RoleDetailScrollRoot().gameObject,Handle(self,self.DetailScrollListenerCallBack))
    ---好感度弹窗
    UIEvent.LuaClick(self.RoleFavorabilityPanel().gameObject,Handle(self,function()
        MgrUI.Pop(UID.FavorabilityRankPop_UI,{self.CurHero,self},true)
    end))
    ---攻击目标说明
    UIEvent.LuaClick(self.Img_Julikuang().gameObject,function()
        HelpViewModel.Go(13)
    end)
    ---上一个角色
    UIEvent.LuaClick(self.Btn_PrevRole().gameObject,function()
        if RoleCardViewModel.CurRoleIndex ~= 1 then
            RoleCardViewModel.CurRoleIndex = RoleCardViewModel.CurRoleIndex - 1
            RoleCardViewModel.CurrentHero = RoleCardViewModel.CacheRoleDataArr[RoleCardViewModel.CurRoleIndex]
            ---清除角色星星
            for i = 1,self.StarPanel().transform.childCount do
                GameObject.Destroy(self.StarPanel().transform:GetChild(i - 1).gameObject)
            end
            ---清除spine
            if self.SpineObj then
                GameObject.Destroy(self.SpineObj)
            end
            ---初始化面板
            self:InitPanel()
        end
    end)
    ---下一个角色
    UIEvent.LuaClick(self.Btn_NextRole().gameObject,function()
        if RoleCardViewModel.CurRoleIndex ~= #RoleCardViewModel.CacheRoleDataArr then
            RoleCardViewModel.CurRoleIndex = RoleCardViewModel.CurRoleIndex + 1
            RoleCardViewModel.CurrentHero = RoleCardViewModel.CacheRoleDataArr[RoleCardViewModel.CurRoleIndex]
            ---清除角色星星
            for i = 1,self.StarPanel().transform.childCount do
                GameObject.Destroy(self.StarPanel().transform:GetChild(i - 1).gameObject)
            end
            ---清除spine
            if self.SpineObj then
                GameObject.Destroy(self.SpineObj)
            end
            ---初始化面板
            self:InitPanel()
        end
    end)
end
---初始化左侧按钮
function M:InitSwitch()
    self.IsScroll = false
    self.isClick = false

    local toggles = {
        [1] = self.SwitchInfo(),
        [2] = self.SwitchSkill(),
        [3] = self.SwitchVoid(),
        [4] = self.SwitchGear()
    }

    for i=1,#toggles do
        toggles[i].isOn = false
    end
    self.SwitchInfo().isOn = true

    local ReloadInfo = {
        [1] = Handle(self, self.OnClickRoleInfoSwitch),
        [2] = Handle(self, self.OnClickRoleSkillSwitch),
        [3] = Handle(self, self.OnClickRoleVoidSwitch),
        [4] = Handle(self, self.OnClickRoleGearSwitch)
    }
    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Btn_Switch","Btn_SwitchHighLight")
        high:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self:OnLeftToggleClick(...,normal,high, ReloadInfo[idx])
        end,nil)
    end

    self.SwitchInfo().isOn = false
    self.SwitchInfo().isOn = true
end
---获取高光组件
function M.GetHighObj(Obj,normalStr,highStr)
    return Obj.transform:Find(normalStr).gameObject, Obj.transform:Find(highStr).gameObject
end
---Toggle事件
function M:OnLeftToggleClick(isOn, normal, high,initFun)
    normal:SetActive(not isOn)
    high:SetActive(isOn)
    self.isClick = true
    if not self.IsScroll then
        initFun()
    end
    self.IsScroll = false
end
---切换到属性界面
function M:OnClickRoleInfoSwitch()
    Tools.ScrollTweenY(self.RoleDetailScrollRoot().gameObject,self.RoleDetailScrollPanel().gameObject,0,0,6)
end
---切换到技能界面
function M:OnClickRoleSkillSwitch()
    if SysLockControl.CheckSysLock(1005) or SysLockControl.CheckSysLock(1006) then
        Tools.ScrollTweenY(self.RoleDetailScrollRoot().gameObject,self.RoleDetailScrollPanel().gameObject,588,0.2,6)
    end
end
---切换到机甲界面
function M:OnClickRoleGearSwitch()
    if not SysLockControl.CheckSysLock(1006) then
        return
    end
    Tools.ScrollTweenY(self.RoleDetailScrollRoot().gameObject,self.RoleDetailScrollPanel().gameObject,1328,0.2,6)
end
---切换到共鸣界面
function M:OnClickRoleVoidSwitch()
    Tools.ScrollTweenY(self.RoleDetailScrollRoot().gameObject,self.RoleDetailScrollPanel().gameObject,900,0.2,6)
end
---添加一个右侧滑动监听回调执行按钮事件
function M:DetailScrollListenerCallBack(_Id)
    if not self.isClick then
        if _Id == 1 then
            self.SwitchInfo().isOn = true
        elseif _Id == 2 then
            self.SwitchSkill().isOn = true
        elseif _Id == 3 then
            self.SwitchVoid().isOn = true
        elseif _Id == 4 then
            self.SwitchGear().isOn = true
        end
    end
    self.isClick = false
    self.IsScroll = true
end

---更新人物好感度信息
---@param hero RoleData
function M:UpdateRoleFavorInfo(hero)
    local tCurFavorLv, tExpRatio, tLvLimit = Global.CheckFavorLv(hero.favor)
    ---好感等级
    self.CurRoleFavorabilityText().text = tCurFavorLv
    ---心填充值
    self.CenterFavorSlider().fillAmount = tCurFavorLv / tLvLimit
    ---好感经验条
    self.RoleFavorabilitySlider().fillAmount = tExpRatio
end

---更新人物信息
function M:UpdataRoleInfoPanel(attr)
    if attr.SkillLV >= attr.SkillMaxLV then
        self.RoleSkillMAXTxt().gameObject:SetActive(true)
        self.RoleSkillUpBtnTxt().gameObject:SetActive(false)
    else
        self.RoleSkillMAXTxt().gameObject:SetActive(false)
        self.RoleSkillUpBtnTxt().gameObject:SetActive(true)
    end
    ---判断是否为支援角色
    if attr.Occupation == 4 then
        self.ZhiYuanNameTxt().gameObject:SetActive(true)
        self.AtkNameTxt().gameObject:SetActive(false)
    else
        self.ZhiYuanNameTxt().gameObject:SetActive(false)
        self.AtkNameTxt().gameObject:SetActive(true)
    end
    -----设置距离文本
    --if attr.Occupation == 3 then
    --    self.AttackTime().text = "2R"
    --else
    --    self.AttackTime().text = "1R"
    --end
    ---设置位置文本
    if attr.Attacktarget == 1 then
        self.AttackType1().text = MgrLanguageData.GetLanguageByKey("fightdragview_front")
    elseif attr.Attacktarget == 2 then
        self.AttackType1().text = MgrLanguageData.GetLanguageByKey("fightdragview_passover")
    elseif  attr.Attacktarget == 3 then
        self.AttackType1().text = MgrLanguageData.GetLanguageByKey("fightdragview_end")
    elseif  attr.Attacktarget == 4 then
        self.AttackType1().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    elseif  attr.Attacktarget == 5 then
        self.AttackType1().text = MgrLanguageData.GetLanguageByKey("fightdragview_random")
    elseif  attr.Attacktarget == 7 then
        self.AttackType1().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    elseif  attr.Attacktarget == 8 then
        self.AttackType1().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
    end
    ---职业类型
    if attr.Occupation == 1 then
        self.AttackType2().text = SteamLocalData.tab[113028][2]
    elseif attr.Occupation == 2 then
        self.AttackType2().text = SteamLocalData.tab[113029][2]
    elseif attr.Occupation == 3 then
        self.AttackType2().text = SteamLocalData.tab[113030][2]
    elseif attr.Occupation == 4 then
        self.AttackType2().text = SteamLocalData.tab[113031][2]
    end
    ---方向
    if self.CurHero.skillDir == 0 then
        self.Img_Zuo().gameObject:SetActive(true)
        self.Img_You().gameObject:SetActive(false)
    else
        self.Img_Zuo().gameObject:SetActive(false)
        self.Img_You().gameObject:SetActive(true)
    end
    ---角色名等信息
    self.RoleCurLvTxt().text=""..attr.LV
    self.RoleMaxLvTxt().text=""..attr.LvMax
    if tonumber(attr.HP) >= 1000000 then
        self.HPInfoTxt().text = (self.GetMillionNumInfo(attr.HP)).."M"
    else
        self.HPInfoTxt().text = math.floor(attr.HP)
    end
    ---角色属性信息
    self.AtkInfoTxt().text= ""..math.floor(attr.RealAtk)
    self.ZhiYuanInfoTxt().text="".. math.floor(self:GetInfoCorrect(attr.RealSuppart)).."%"
    self.ZhiYuanSlider().value = attr.RealSuppart
    self.DefInfoTxt().text ="".. math.floor((self:GetInfoCorrect(attr.RealDef))).."%"
    self.MinjieInfoTxt().text = ""..math.floor((self:GetInfoCorrect(attr.RealAgile))).."%"
    self.BaojiInfoTxt().text =  ""..math.floor((self:GetInfoCorrect(attr.RealCrit))).."%"
    self.BaoshangInfoTxt().text ="".. math.floor((self:GetInfoCorrect(attr.RealCritDmg))).."%"
    --- 设置滑动条
    self.DefenceSlider().value = attr.RealDef
    self.BaojiSlider().value = attr.RealCrit
    self.BaoshangSlider().value = attr.RealCritDmg
    self.MinjieSlider().value = attr.RealAgile
    ----经验Panel
    local MaxExp  = 0
    if attr.LV < attr.LvMax then
        MaxExp = BattleRole.ReturnExp(attr,attr.LV)
        self.Btn_Shengxing().gameObject:SetActive(false)
        Tools.SetImgFillRate(self.RoleLvSlider().gameObject,attr.EXP/MaxExp)
        self.RoleExpTxt().text=""..attr.EXP.."<color=#7B7B7B>/"..MaxExp.."</color>"
    else
        self.Btn_Shengxing().gameObject:SetActive(true)
        Tools.SetImgFillRate(self.RoleLvSlider().gameObject,1)
        MaxExp = BattleRole.ReturnExp(attr,attr.LvMax)
        self.RoleExpTxt().text=""..MaxExp.."<color=#7B7B7B>/"..MaxExp.."</color>"
    end
    if attr.LV >= attr.LvMax then
        self.RoleLvUpBtnTxt().text = ""
        self.RoleMaxTxt().gameObject:SetActive(true)
    else
        self.RoleLvUpBtnTxt().text = MgrLanguageData.GetLanguageByKey("ark_ui_upgrade")
        self.RoleMaxTxt().gameObject:SetActive(false)
    end

    ---如果当前查看的是好友的角色
    if(RoleCardViewModel.CurType == "Friend") then
        ---好友属性
        local Fdattr = ReadData.GetRoleAttr(self.CurFriendHero.heroID,self.CurFriendHero.heroLevel,self.CurFriendHero.heroStar,self.CurFriendHero.heroSkillLevel,self.CurFriendHero.heroAwaken,self.CurFriendHero.heroExp)
        ---好友角色等级
        self.RoleCurLvTxt().text=""..self.CurFriendHero.heroLevel
        ---好友经验条
        if self.CurFriendHero.heroLevel < Fdattr.LvMax then
            MaxExp = BattleRole.ReturnExp(Fdattr,self.CurFriendHero.heroLevel)
            Tools.SetImgFillRate(self.RoleLvSlider().gameObject,self.CurFriendHero.heroExp/MaxExp)
            self.RoleExpTxt().text=""..Fdattr.EXP.."<color=#7B7B7B>/"..MaxExp.."</color>"
        else
            Tools.SetImgFillRate(self.RoleLvSlider().gameObject,1)
            MaxExp = BattleRole.ReturnExp(Fdattr,Fdattr.LvMax)
            self.RoleExpTxt().text=""..MaxExp.."<color=#7B7B7B>/"..MaxExp.."</color>"
        end
        ---属性
        if tonumber(Fdattr.HP) >= 1000000 then
            self.HPInfoTxt().text = (self.GetMillionNumInfo(Fdattr.HP)).."M"
        else
            self.HPInfoTxt().text = math.floor(Fdattr.HP)
        end
        self.AtkInfoTxt().text= ""..math.floor(Fdattr.RealAtk)                               ---攻击
        self.ZhiYuanInfoTxt().text="".. (self:GetInfoCorrect(Fdattr.RealSuppart)).."%"       ---支援力
        self.ZhiYuanSlider().value = Fdattr.RealSuppart
        self.DefInfoTxt().text ="".. (self:GetInfoCorrect(Fdattr.RealDef)).."%"              ---防御
        self.MinjieInfoTxt().text = ""..(self:GetInfoCorrect(Fdattr.RealAgile)).."%"         ---敏捷
        self.BaojiInfoTxt().text =  ""..(self:GetInfoCorrect(Fdattr.RealCrit)).."%"          ---暴击
        self.BaoshangInfoTxt().text ="".. (self:GetInfoCorrect(Fdattr.RealCritDmg)).."%"     ---爆伤
        ---设置星级
        for i = 1, #self.unAwakenStarArr do
            self.unAwakenStarArr[i]:SetActive(i <= self.CurFriendHero.heroStar and not self.CurFriendHero.heroAwaken) ---未觉醒星
        self.onAwakenStarArr[i]:SetActive(i <= self.CurFriendHero.heroStar and self.CurFriendHero.heroAwaken)     ---觉醒星
        end
        ---技能信息
        local lvCount = 0
        for i, v in pairs(self.CurFriendHero.equip) do
            lvCount = lvCount + v
        end
        if lvCount >=30 then
            Fdattr = ReadData.GetRoleAttr(self.CurFriendHero.heroID,self.CurFriendHero.heroLevel,self.CurFriendHero.heroStar,self.CurFriendHero.heroSkillLevel + 1,self.CurFriendHero.heroAwaken,self.CurFriendHero.heroExp)
            self.RoleSkillTxt().text="<color=#FFC539>"..Fdattr.SkillLV.."</color><size=70><color=#7B7B7B>/".."9".."</color></size>"
        else
            self.RoleSkillTxt().text=""..Fdattr.SkillLV.."<size=70><color=#7B7B7B>/".."9".."</color></size>"
        end
        if Fdattr.Occupation == 4 then
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..Fdattr.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..Fdattr.AttackRangeTexture)
        end

        if Fdattr.Skill_5_example[1]~=nil then
            MgrRes.LoadSprite(self.RoleSkillIconImg5(),"Skill/"..Fdattr.Skill_5_example[1].Icon)
            --添加技能图标点击详细说明事件
            UIEvent.LuaClick(self.RoleSkillIconImg5().gameObject,Handle(self, function ()
                -- statements
                self:InitCombineSkillPanel(Fdattr.Skill_5_example,5)
            end))

            if Fdattr.IsAwaken==true or Fdattr.IsAwaken==1 then
                self.JLock01().gameObject:SetActive(false)
                self.ImageSuo01().gameObject:SetActive(false)
            else
                self.JLock01().gameObject:SetActive(true)
                self.ImageSuo01().gameObject:SetActive(true)
            end
            self.RoleSkillIconPanel1().gameObject:SetActive(false)
            self.RoleSkillIconPanel2().gameObject:SetActive(true)

            self:SwitchSkillPanel(self.RoleSkillIconPanel2(),Fdattr)
        else
            --EX技能为空
            self.RoleSkillIconPanel1().gameObject:SetActive(true)
            self.RoleSkillIconPanel2().gameObject:SetActive(false)
            if Fdattr.IsAwaken==true or Fdattr.IsAwaken==1 then
                self.JLock().gameObject:SetActive(false)
                self.ImageSuo().gameObject:SetActive(false)
            else
                self.JLock().gameObject:SetActive(true)
                self.ImageSuo().gameObject:SetActive(true)
            end
            self:SwitchSkillPanel(self.RoleSkillIconPanel1(),Fdattr)
        end
    end
end

---更新技能信息
function M:InitRoleSkillPanel()
    local attr = nil
    local lvCount = 0
    --for i, v in pairs(self.CurHero:GetVoidEquip()) do
    for i, v in pairs(self.CurHero:GetHeroVoidEquip()) do
        lvCount = lvCount + v.level
    end
    if lvCount >=30 then
        attr = ReadData.GetRoleAttr(self.CurHero.id,self.CurHero.level,self.CurHero.star,self.CurHero.skillLevel+1,self.CurHero.awaken,self.CurHero.exp)
        self.RoleSkillTxt().text="<color=#FFC539>"..attr.SkillLV.."</color><size=70><color=#7B7B7B>/".."9".."</color></size>"
    else
        attr = self.CurHeroAttr
        self.RoleSkillTxt().text=""..attr.SkillLV.."<size=70><color=#7B7B7B>/".."9".."</color></size>"
    end

    ---self.RoleSkillNameTxt().text=""..attr.AtkName
    if attr.Occupation == 4 then
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..attr.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..attr.AttackRangeTexture)
    end

    if attr.Skill_5_example[1]~=nil then
        MgrRes.LoadSprite(self.RoleSkillIconImg5(),"Skill/"..attr.Skill_5_example[1].Icon)
        --添加技能图标点击详细说明事件
        UIEvent.LuaClick(self.RoleSkillIconImg5().gameObject,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(attr.Skill_5_example,5)
        end))

        if attr.IsAwaken==true or attr.IsAwaken==1 then
            self.JLock01().gameObject:SetActive(false)
            self.ImageSuo01().gameObject:SetActive(false)
        else
            self.JLock01().gameObject:SetActive(true)
            self.ImageSuo01().gameObject:SetActive(true)
        end
        self.RoleSkillIconPanel1().gameObject:SetActive(false)
        self.RoleSkillIconPanel2().gameObject:SetActive(true)

        self:SwitchSkillPanel(self.RoleSkillIconPanel2(),attr)
    else
        --EX技能为空
        self.RoleSkillIconPanel1().gameObject:SetActive(true)
        self.RoleSkillIconPanel2().gameObject:SetActive(false)
        if attr.IsAwaken==true or attr.IsAwaken==1 then
            self.JLock().gameObject:SetActive(false)
            self.ImageSuo().gameObject:SetActive(false)
        else
            self.JLock().gameObject:SetActive(true)
            self.ImageSuo().gameObject:SetActive(true)
        end
        self:SwitchSkillPanel(self.RoleSkillIconPanel1(),attr)
    end
end
function M:SwitchSkillPanel(RoleSkillIconPanel,attr)
    local RoleSkillIconImg1 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg1")
    local RoleSkillIconImg2 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg2")
    local RoleSkillIconImg3 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg3")
    local RoleSkillIconImg4 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg4")
    --技能图标1、2、3、4
    if attr.Skill_1_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg1:GetComponent("Image"),"Skill/"..attr.Skill_1_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg1,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(attr.Skill_1_example,1)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg1,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg1:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if attr.Skill_2_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg2:GetComponent("Image"),"Skill/"..attr.Skill_2_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg2,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(attr.Skill_2_example,2)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg2,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg2:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if attr.Skill_3_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg3:GetComponent("Image"),"Skill/"..attr.Skill_3_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg3,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(attr.Skill_3_example,3)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg3,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg3:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if attr.Skill_4_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg4:GetComponent("Image"),"Skill/"..attr.Skill_4_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg4,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(attr.Skill_4_example,4)
        end))
    else
        self.JLock01().gameObject:SetActive(false)
        self.JLock().gameObject:SetActive(false)
        UIEvent.LuaClick(RoleSkillIconImg4,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg4:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
end
---点击弹出详情技能界面
function M:InitCombineSkillPanel(_Skill,index)
    MgrUI.Pop(UID.RolePreview_UI,{self.CurHero,2,_Skill,index},true)
end
---初始化核心信息
------@param hero RoleData
function M:InitGearPanel(hero)
    if  hero.armor1~=0 and hero.armor1~=nil then
        self.GearPanel1UID=hero.armor1
        self.GearData1= CoreControl.GetSingleCoreData(self.GearPanel1UID)
        self.GearWearPanel().gameObject:SetActive(true)
        self.GearEmptyPanel().gameObject:SetActive(false)
        self:InitGearDetailPanel( self.GearData1,self.GearInfoPanel().gameObject,1)
        ReadData.InitRoleGear(self.CurHeroAttr,self.GearData1.attrs,true)
    else
        self.GearWearPanel().gameObject:SetActive(false)
        self.GearEmptyPanel().gameObject:SetActive(true)
    end

    if  hero.armor2~=0 and hero.armor2~=nil then
        self.GearPanel2UID=hero.armor2
        self.GearData2= CoreControl.GetSingleCoreData(self.GearPanel2UID)
        self.GearWearPanel01().gameObject:SetActive(true)
        self.GearEmptyPanel01().gameObject:SetActive(false)
        self:InitGearDetailPanel( self.GearData2,self.GearInfoPanel01().gameObject,2)
        ReadData.InitRoleGear(self.CurHeroAttr,self.GearData2.attrs,true)
    else
        self.GearWearPanel01().gameObject:SetActive(false)
        self.GearEmptyPanel01().gameObject:SetActive(true)
    end
    ---如果是好友角色
    if(RoleCardViewModel.CurType == "Friend") then
        if  self.CurFriendHero.heroArmor1 ~= nil then
            local heroArmor1 = self.CurFriendHero.heroArmor1
            self.GearData1= CoreControl.CreateSingleCore(heroArmor1.armorID,heroArmor1.armorProperties,heroArmor1.armorSkill)
            self.GearWearPanel().gameObject:SetActive(true)
            self.GearEmptyPanel().gameObject:SetActive(false)
            self:InitGearDetailPanel( self.GearData1,self.GearInfoPanel().gameObject,1)
            ReadData.InitRoleGear(self.CurFheroAttr,self.GearData1.attrs,true)
        else
            self.GearWearPanel().gameObject:SetActive(false)
            self.GearEmptyPanel().gameObject:SetActive(true)
        end

        if  self.CurFriendHero.heroArmor2 ~= nil then
            local heroArmor2 = self.CurFriendHero.heroArmor2
            self.GearData2= CoreControl.CreateSingleCore(heroArmor2.armorID,heroArmor2.armorProperties,heroArmor2.armorSkill)
            self.GearWearPanel01().gameObject:SetActive(true)
            self.GearEmptyPanel01().gameObject:SetActive(false)
            self:InitGearDetailPanel( self.GearData2,self.GearInfoPanel01().gameObject,2)
            ReadData.InitRoleGear(self.CurFheroAttr,self.GearData2.attrs,true)
        else
            self.GearWearPanel01().gameObject:SetActive(false)
            self.GearEmptyPanel01().gameObject:SetActive(true)
        end
    end
end
---更新核心信息
---@param GearData CoreData
function M:InitGearDetailPanel(GearData,_GearInfoPanel,index)

    local _GearDataPanel = CJNUIMgr.GetSunUseName(_GearInfoPanel,"GearDataPanel")
    local _GearInfoPrefab =  CJNUIMgr.GetSunUseName(_GearInfoPanel,"_GearInfoPrefab")
    local GearSkillPrefab =  CJNUIMgr.GetSunUseName(_GearInfoPanel,"GearSkillPrefab")

    local GearIconPanel=CJNUIMgr.GetSunUseName(_GearInfoPanel,"GearIconPanel")
    local UpgradeTextObj=CJNUIMgr.GetSunUseName(_GearInfoPanel,"GearUpgradeText")
    local NameTxtObj=CJNUIMgr.GetSunUseName(_GearInfoPanel,"GearNameTxt")

    local IconImgObj=CJNUIMgr.GetSunUseName(GearIconPanel,"GearIconImg")
    local RankKuangImgObj=CJNUIMgr.GetSunUseName(GearIconPanel,"GearRankKuangImg")
    local _StarPanelRoot = CJNUIMgr.GetSunUseName(GearIconPanel,"GearStarPanel")
    local _GearStarPrefab = CJNUIMgr.GetSunUseName(GearIconPanel,"GearStarPrefab")
    local _GearSpecialStarPrefab = CJNUIMgr.GetSunUseName(GearIconPanel,"GearSpecialStarPrefab")

    local Qicon = CJNUIMgr.GetSunUseName(GearIconPanel,"Qicon")
    --local RankPlusPanel=CJNUIMgr.GetSunUseName(GearIconPanel,"RankPlusPanel")
    --local RankPlusIconImg=CJNUIMgr.GetSunUseName(GearIconPanel,"RankPlusIconImg")

    ---设置装备图标
    MgrRes.LoadCircleIcon(Qicon:GetComponent("Image"),self.CurHero.id)
    ---强化等级
    UpgradeTextObj:GetComponent("TextMeshProUGUI").text = "+"..GearData.level
    ---设置名字
    NameTxtObj:GetComponent("TextMeshProUGUI").text = ""..GearData.name
    ---设置星级
    --self:InitStarPanel(GearData.star,_StarPanelRoot,_GearStarPrefab)
    ---设置核心图标
    MgrRes.LoadSprite(IconImgObj:GetComponent("Image"),GearData.icon)
    ---设置品质图片
    MgrRes.LoadSprite(RankKuangImgObj:GetComponent("Image"),"Quality/RankKuang_"..GearData.quality)
    if GearData.quality == 5 then
        --RankPlusPanel:SetActive(true)
        --MgrRes.LoadSprite(RankPlusIconImg:GetComponent("Image"),"Quality/RankKuangPlus_"..GearData.quality)
        self:InitStarPanel(GearData.star,_StarPanelRoot,_GearSpecialStarPrefab)
    else
        --RankPlusPanel:SetActive(false)
        self:InitStarPanel(GearData.star,_StarPanelRoot,_GearStarPrefab)
    end
    Tools.ClearAllChild(_GearDataPanel)
    ---设置基础属性词条
    for i = 1, #GearData.attrs do
        ---显示可用词条
        local GearInfo=self:CreatGo(_GearInfoPrefab,_GearDataPanel)
        local GearInfoMainIcon=CJNUIMgr.GetSunUseName(GearInfo,"GearInfoIcon")
        local GearInfoMainText=CJNUIMgr.GetSunUseName(GearInfo,"GearInfoText")
        local GearInfoNameTxt=CJNUIMgr.GetSunUseName(GearInfo,"GearInfoNameTxt")
        ---属性图标
        MgrRes.LoadSprite(GearInfoMainIcon:GetComponent("Image"),"Attribute/GearInfoIcon_"..GearData.attrs[i].attrID)
        ---属性值
        local value = 0
        if GearData.attrs[i].type == 0 then
            value = math.floor(GearData.attrs[i].attribute)
        else
            value =(math.floor(GearData.attrs[i].attribute*100)*0.01).."%"
        end
        GearInfoMainText:GetComponent("TextMeshProUGUI").text = value
        ---属性名称
        GearInfoNameTxt:GetComponent("TextMeshProUGUI").text = GearData.attrs[i].attrName
    end
    if GearData.skill~= 0 then
        local obj = GameObject.Instantiate(GearSkillPrefab,_GearDataPanel.transform).gameObject
        obj:SetActive(true)
        local GearInfoNameTxt=CJNUIMgr.GetSunUseName(obj,"GearInfoNameTxt"):GetComponent("TextMeshProUGUI")
        local skill = SkillLocalData.tab[GearData.skill]
        GearInfoNameTxt.text = skill[12]
        ---绑定技能显示按钮
        local ChaKan = obj.transform:Find("GearInfoNameTxt/Image").gameObject         ---找到要点击的图片
        UIEvent.LuaClick(ChaKan,Handle(self,function()
            self:InitCoreSkillPanel(skill[1])
        end))
    end
    ---装备
    UIEvent.LuaClick(GearIconPanel.gameObject,Handle(self,function ()
        RoleCardViewModel.CurCoreIndex = index
        MgrUI.GoHide(UID.RoleGearCore_UI)
    end))
end

---点击弹出技能详情界面(new)
function M:InitCoreSkillPanel(_skillId)
    MgrUI.Pop(UID.CoreSkill_UI,_skillId,true)
end

---初始化共鸣信息
---@param hero RoleData
function M:InitVoidPanel(hero)

    ---获取角色已有的共鸣装备
    --local equipArr = hero:GetVoidEquip()
    local equipArr = hero:GetHeroVoidEquip()
    local gearPanel =
    {
        [1] = self.VoidGearPanel1().gameObject,
        [2] = self.VoidGearPanel2().gameObject,
        [3] = self.VoidGearPanel3().gameObject
    }
    ---如果是好友角色
    if(RoleCardViewModel.CurType == "Friend") then
        for idx, obj in pairs(equipArr) do
            self:InitVoidGearPanelByJNVoidGear(gearPanel[obj.position],obj,self.CurFriendHero.equip[idx])
        end
    else
        for idx, obj in pairs(equipArr) do
            self:InitVoidGearPanelByJNVoidGear(gearPanel[obj.position],obj)
        end
    end

end
---根据当前传入的共鸣装备信息对象更新对应的UI信息
---@param _JNVoidGear EquipData
function M:InitVoidGearPanelByJNVoidGear(_VoidGearPanel,_JNVoidGear,_FriendVoidLV)

    local _VoidRightBtnPanel=CJNUIMgr.GetSunUseName(_VoidGearPanel,"RightBtnPanel")
    local _VoidGearDoublePanel=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearDoublePanel")
    local _VoidGearDoublePanel1=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearDoublePanel1")
    local _VoidGearDoublePanel2=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearDoublePanel2")
    local _VoidGearInfoSinglePanel=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearInfoSinglePanel")
    local _VoidGearLvDotPanel=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearLvDotPanel")
    local _VoidGearIconPanel=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearPanel")
    local _VoidGearNameText=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearNameText")
    local _VoidGearLvDotPrefab=CJNUIMgr.GetSunUseName(_VoidGearPanel,"VoidGearLvDotPrefab")

    _VoidGearLvDotPrefab:SetActive(false)

    ---如果是好友角色
    if(RoleCardViewModel.CurType == "Friend") then
        if(_FriendVoidLV ~= nil) then
            _VoidGearNameText:GetComponent("TextMeshProUGUI").text="LV.".._FriendVoidLV.." ".._JNVoidGear.name
        else
            _VoidGearNameText:GetComponent("TextMeshProUGUI").text="".._JNVoidGear.name
        end
        Tools.ClearAllChild(_VoidGearLvDotPanel)
        for i = 1, tonumber(_FriendVoidLV), 1 do
            GameObject.Instantiate(_VoidGearLvDotPrefab,_VoidGearLvDotPanel.transform,false):SetActive(true)
        end
        self:InitVoidGearIcon(_VoidGearIconPanel,_JNVoidGear,_FriendVoidLV)
        local _VoidInfoTab=JNStrTool.strSplit(",", _JNVoidGear.attribute)
        local _VoidInfoCount=TableToObject.GetTableLength(_VoidInfoTab)
        if _VoidInfoCount > 1 then
            -- 双属性
            _VoidGearInfoSinglePanel:SetActive(false)
            _VoidGearDoublePanel:SetActive(true)
            self:InitVoidGearInfoDataPrefab(_VoidGearDoublePanel1,_VoidInfoTab[1],_FriendVoidLV)
            self:InitVoidGearInfoDataPrefab(_VoidGearDoublePanel2,_VoidInfoTab[2],_FriendVoidLV)
        else
            -- 单属性
            _VoidGearInfoSinglePanel:SetActive(true)
            _VoidGearDoublePanel:SetActive(false)
            self:InitVoidGearInfoDataPrefab(_VoidGearInfoSinglePanel,_VoidInfoTab[1],_FriendVoidLV)
        end
    else  ---是自己的角色
        if _JNVoidGear.level ~=0 then
            _VoidGearNameText:GetComponent("TextMeshProUGUI").text="LV.".._JNVoidGear.level.." ".._JNVoidGear.name
        else
            _VoidGearNameText:GetComponent("TextMeshProUGUI").text="".._JNVoidGear.name
        end
        Tools.ClearAllChild(_VoidGearLvDotPanel)
        for i = 1, tonumber(_JNVoidGear.level), 1 do
            GameObject.Instantiate(_VoidGearLvDotPrefab,_VoidGearLvDotPanel.transform,false):SetActive(true)
        end
        self:InitVoidGearIcon(_VoidGearIconPanel,_JNVoidGear,_FriendVoidLV)
        --更新词条信息
        local _VoidInfoTab=JNStrTool.strSplit(",", _JNVoidGear.attribute)
        local _VoidInfoCount=TableToObject.GetTableLength(_VoidInfoTab)
        if _VoidInfoCount > 1 then
            -- 双属性
            _VoidGearInfoSinglePanel:SetActive(false)
            _VoidGearDoublePanel:SetActive(true)
            self:InitVoidGearInfoDataPrefab(_VoidGearDoublePanel1,_VoidInfoTab[1],_JNVoidGear.level)
            self:InitVoidGearInfoDataPrefab(_VoidGearDoublePanel2,_VoidInfoTab[2],_JNVoidGear.level)
        else
            -- 单属性
            _VoidGearInfoSinglePanel:SetActive(true)
            _VoidGearDoublePanel:SetActive(false)
            self:InitVoidGearInfoDataPrefab(_VoidGearInfoSinglePanel,_VoidInfoTab[1],_JNVoidGear.level)
        end
    end

end
---初始化一个共鸣装备图标信息
---@param _VoidGear EquipData
function M:InitVoidGearIcon(_Obj,_VoidGear,_FriendVoidLV)
    if _VoidGear == nil then
        return
    end
    local _VoidGearIconImg=CJNUIMgr.GetSunUseName(_Obj,"VoidGearIcon")
    local _EmptyVoidGearIconImg=CJNUIMgr.GetSunUseName(_Obj,"EmptyVoidGearIcon")
    local _VoidGearRankIcon=CJNUIMgr.GetSunUseName(_Obj,"VoidGearRankIcon")
    ---如果是好友角色
    if(RoleCardViewModel.CurType == "Friend") then
        if _FriendVoidLV ~= 0 then
            -- statements
            _EmptyVoidGearIconImg:SetActive(false)
            _VoidGearIconImg:SetActive(true)
            MgrRes.LoadSprite(_VoidGearIconImg:GetComponent("Image"),_VoidGear.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"),_VoidGear.iconFrame)
        else
            _EmptyVoidGearIconImg:SetActive(true)
            _VoidGearIconImg:SetActive(false)
            MgrRes.LoadSprite(_EmptyVoidGearIconImg:GetComponent("Image"),_VoidGear.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"),"Equip/Rank/VoidGearRank_0")
        end
        UIEvent.LuaClick(_Obj,Handle(self,function ()
            -- 点击切换到对应的详情
            if self.CurHero.lockState then
                RoleCardViewModel.CurrentEquip = _VoidGear
                MgrUI.GoHide(UID.VoidGearDetail_UI)
            end
        end))
    else  ---是自己的角色
        if _VoidGear.lockState == true then
            -- statements
            _EmptyVoidGearIconImg:SetActive(false)
            _VoidGearIconImg:SetActive(true)
            MgrRes.LoadSprite(_VoidGearIconImg:GetComponent("Image"),_VoidGear.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"),_VoidGear.iconFrame)
        else
            _EmptyVoidGearIconImg:SetActive(true)
            _VoidGearIconImg:SetActive(false)
            MgrRes.LoadSprite(_EmptyVoidGearIconImg:GetComponent("Image"),_VoidGear.icon)
            MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"),"Equip/Rank/VoidGearRank_0")
        end
        UIEvent.LuaClick(_Obj,Handle(self,function ()
            -- 点击切换到对应的详情
            if self.CurHero.lockState then
                RoleCardViewModel.CurrentEquip = _VoidGear
                MgrUI.GoHide(UID.VoidGearDetail_UI)
            end
        end))
    end

end
---初始化一个共鸣装备属性词条UI
function M:InitVoidGearInfoDataPrefab(_VoidGearInfoObj,_InfoTab,_CurLv)
    -- statements
    local _tempInfoTab1=JNStrTool.strSplit("_",_InfoTab) --切割获取对应的属性类型和具体计算公式
    --根据得到的属性类型更新属性图标和文字
    local _VoidGearInfoText=CJNUIMgr.GetSunUseName(_VoidGearInfoObj,"VoidGearInfoText")
    local _VoidGearText=CJNUIMgr.GetSunUseName(_VoidGearInfoObj,"VoidGearText")
    local _VoidGearIcon=CJNUIMgr.GetSunUseName(_VoidGearInfoObj,"VoidGearIcon")
    MgrRes.LoadSprite(_VoidGearIcon:GetComponent("Image"),"Attribute/GearInfoIcon_".._tempInfoTab1[1])
    local _tempInfoTab2=JNStrTool.strSplit("*",_tempInfoTab1[2]) --切割公式拿到等级相关系数
    local _CurInfoData=tonumber(_CurLv)*tonumber(_tempInfoTab2[2])
    if _CurInfoData ~=0 then
        if _tempInfoTab1[1] == "0" or _tempInfoTab1[1] == "2" then
            ReadData.SetAdd_Abt(self.CurHeroAttr, tonumber(_tempInfoTab1[1]),_CurInfoData)
        else
            ReadData.SetAdd_Abt(self.CurHeroAttr ,tonumber(_tempInfoTab1[1]),_CurInfoData*0.01)
        end
    end
    if _tempInfoTab1[1] == "0" then
        -- 固定攻击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text="".._CurInfoData
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
    elseif _tempInfoTab1[1] == "1" then
        -- 百分比攻击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.01).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
    elseif _tempInfoTab1[1] == "2" then
        -- 固定生命
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text="".._CurInfoData
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_health")
    elseif _tempInfoTab1[1] == "3" then
        -- 百分比生命
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.01).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_health")
    elseif _tempInfoTab1[1] == "4" then
        -- 防御
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.01).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_defense")
    elseif _tempInfoTab1[1] == "5" then
        -- 暴击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.01).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_critical")
    elseif _tempInfoTab1[1] == "6" then
        -- 暴伤
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.01).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_criticaldamage")
    elseif _tempInfoTab1[1] == "7" then
        -- 敏捷
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.01).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_agile")
    elseif _tempInfoTab1[1] == "8" then
        -- 支援力
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.01).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_support")
    end
end

---立绘平移
function M:SpineMove(_TargetPosX,_Duration)
    Tools.TweenDoLocalMoveX(self.SpineObj,_TargetPosX,_Duration,-1)
end
---创建立绘
function M:CreatSpine(_Root,_RoleId)
    --local _LihuiName=RoleattributeLocalData.tab[_RoleId].coordinate6
    local _PosInfoTab=CharactercoordinatesLocalData.tab[_RoleId].coordinate1
    local _tempPosTab1 =JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])
    self.SpinePosX = tonumber(_tempPosTab2[1])
    MgrRes.LoadWatchAuto(_Root,_RoleId,tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),tonumber(_tempPosTab1[2]),nil,function(obj)
        self.SpineObj = obj
    end)
end
---设置标题
function M:SetTitle(_CN,_EN)
    self.CnBgTitle().text = _CN
    self.EnBgTitle().text = _EN
end
---隐藏界面部分功能
function M:HidePanel()
    self.SwitchPanel().gameObject:SetActive(false)
    self.RoleInfoPanel().gameObject:SetActive(false)
    self.DetailPanel().gameObject:SetActive(false)
    self.Btn_NextRole().gameObject:SetActive(false)
    self.Btn_PrevRole().gameObject:SetActive(false)
end
---显示界面部分功能
function M:ShowPanel()
    self.SwitchPanel().gameObject:SetActive(true)
    self.RoleInfoPanel().gameObject:SetActive(true)
    self.DetailPanel().gameObject:SetActive(true)
    self.Btn_NextRole().gameObject:SetActive(true)
    self.Btn_PrevRole().gameObject:SetActive(true)
end
---取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data*10000)/1)
    tempData = tempInt1 / 100
    return tempData
end
---得到百万级数据的除以100W后精度到小数点后两位的值输出
function M.GetMillionNumInfo(_InputInfo)
    local _tempRateNum = _InputInfo/10000
    local _OutInfo = math.floor(_tempRateNum)/100
    return _OutInfo
end

---创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    if _Prefab == nil then
        print(_Prefab)
    end
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        self:CreatStar(_Root,_Prefab)
    end
end
---脱下装备
function M:OnClickTakeOff()
    print("脱下")
    local ArmorREQ =
    {
        data =  {
            [1] = {heroID = RoleCardViewModel.CurrentHero.id,
                   armorID = 0,
                   armorSolt = self.Index}
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,1,nil,nil,Handle(self,self.ClientReDetailNTF))
end
---脱下装备返回
function M:ClientReDetailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorNTF',buffer))
    if tag == 1 then
        local roleData = nil
        local coreData = nil
        roleData = HeroControl.GetRoleDataByID(tab.data[1].heroID)
        if tab.data[1].armorSolt == 1 then
            roleData.armor1 = 0
            self.GearWearPanel().gameObject:SetActive(false)
            self.GearEmptyPanel().gameObject:SetActive(true)
        elseif tab.data[1].armorSolt == 2 then
            roleData.armor2 = 0
            self.GearWearPanel01().gameObject:SetActive(false)
            self.GearEmptyPanel01().gameObject:SetActive(true)
        end
        coreData = RoleCardViewModel.CurrentCore
        coreData:ReLoadCore(0,0)
        CoreControl.GetCores()
        RoleCardViewModel.ReloadCacheRoleData()
        print(tab)
        self:UpdataDetailPanel()
    end
end
function M:BackClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBack()
    ---新手引导
    if NoviceViewModel.CurTaskId == 13014 then
        MgrUI.Pop(UID.NoviceFrame_UI,{13014},true)
    end
    ---如果当前存在好友名片数据则打开好友名片界面
    if FriendViewModel.CurFriendCard ~= nil then
        MgrUI.Pop(UID.FriendAvatar_UI,{FriendViewModel.CurFriendCard },true)
    end
    if self.CurPanel ~=0 then
        self:SpineMove(self.SpinePosX,0.3)
        self:ShowPanel()
        self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_detail"),"RESONANCE")
        self.CurPanel = 0
        self:UpdataDetailPanel()
    end
end

function M:OnClose()
    RoleCardViewModel.CheckRot()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

return M