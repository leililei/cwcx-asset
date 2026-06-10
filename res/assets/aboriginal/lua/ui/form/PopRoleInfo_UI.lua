
-- Code Auto Create Begin
local M = Class('PopRoleInfo_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PopRoleInfo_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PopRoleInfo_UI].prefab'
    self.Name = 'Form[PopRoleInfo_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 30
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NomalBg','NomalBg',2},{'LihuiPanel','LihuiPanel',2},{'LihuiSpinePanel','LihuiPanel/LihuiSpinePanel',2},{'RightPanelBG','RightPanelBG',2},{'Img_xian','RightPanelBG/Img_xian',2},{'Img_xian01','RightPanelBG/Img_xian',2},{'ScrollbarVertical','RightPanelBG/Scrollbar Vertical',2},{'Handle','RightPanelBG/Scrollbar Vertical/Sliding Area/Handle',2},{'RoleScrollMask','RightPanelBG/RoleScrollMask',2},{'RoleDetailScrollPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel',2},{'Viewport','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport',2},{'RoleDetailScrollRoot','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot',2},{'InfoPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel',2},{'RoleInfoBgPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel',2},{'RoleInfoIconPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel',2},{'TX_BGImage_1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_1',2},{'TX_BGImage_2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_2',2},{'TX_BGImage_3','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_3',2},{'TX_Image_1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_1',2},{'TX_Image_2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_2',2},{'TX_Image_3','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_3',2},{'TX_Image_4','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_4',2},{'TX_Image_5','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_5',2},{'TX_Image_6','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_6',2},{'AtkIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkIcon',2},{'HpIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HpIcon',2},{'DefIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefIcon',2},{'BaojiIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiIcon',2},{'BaoshangIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoshangIcon',2},{'MingjieIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MingjieIcon',2},{'Background','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Background',2},{'Fill','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Fill Area/Fill',2},{'Image','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Image',2},{'Image(1)','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Image (1)',2},{'Background01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Background',2},{'Fill01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Fill Area/Fill',2},{'Image01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Image',2},{'Image(1)01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider/Image (1)',2},{'Background02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Background',2},{'Fill02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Fill Area/Fill',2},{'Image02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Image',2},{'Image(1)02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider/Image (1)',2},{'Background03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Background',2},{'Fill03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Fill Area/Fill',2},{'Image03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Image',2},{'Image(1)03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider/Image (1)',2},{'Background04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Background',2},{'Fill04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Fill Area/Fill',2},{'Image04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Image',2},{'Image(1)04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider/Image (1)',2},{'Btn_PreviewLv','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_PreviewLv',2},{'UpLvBg','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg',2},{'RoleUpLvBtn','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleUpLvBtn',2},{'Lvbg','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg',2},{'Lvbg01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg/Lvbg',2},{'Lvbg02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg/Lvbg',2},{'RoleLvSlider','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Lvbg/RoleLvSlider',2},{'Img_xian02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/Img_xian',2},{'Img_xian03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/Img_xian',2},{'SkillPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel',2},{'Btn_PreviewSkill','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Btn_PreviewSkill',2},{'Img_Julikuang','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang',2},{'Img_Fanweikuang1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/Img_Fanweikuang1',2},{'Img_Fanweikuang2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/Img_Fanweikuang2',2},{'Btn_Chakan','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/Btn_Chakan',2},{'jinengqianghua','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua',2},{'Btn_SkillUpgrade','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade',2},{'SkillRedDotIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade/SkillRedDotIcon',2},{'RoleSkillIconPanel1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1',2},{'RoleSkillIconImg1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg1',2},{'RoleSkillIconImg2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg2',2},{'RoleSkillIconImg3','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg3',2},{'RoleSkillIconImg4','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4',2},{'ImageSuo','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/ImageSuo',2},{'Image05','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/ImageSuo/Image',2},{'JLock','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/JLock',2},{'UnJueXingLine','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/UnJueXingLine',2},{'Img_Fanweidi','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi',2},{'Fanwei','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi/Fanwei',2},{'Img_You','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi/Img_You',2},{'Img_Zuo','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Fanweidi/Img_Zuo',2},{'RoleSkillIconPanel2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2',2},{'RoleSkillIconImg101','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg1',2},{'RoleSkillIconImg201','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg2',2},{'RoleSkillIconImg301','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg3',2},{'RoleSkillIconImg401','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4',2},{'ImageSuo01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/ImageSuo',2},{'Image06','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/ImageSuo/Image',2},{'JLock01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/JLock',2},{'RoleSkillIconImg5','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg5',2},{'Img_Jinengwenzidi','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg5/Img_Jinengwenzidi',2},{'VoidPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel',2},{'VoidGearPanel1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1',2},{'gongmingdi','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/gongmingdi',2},{'VoidGearDoublePanel1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1',2},{'VoidIconBG','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidIconBG',2},{'VoidGearIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearIcon',2},{'VoidGearDoublePanel2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2',2},{'VoidIconBG01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidIconBG',2},{'VoidGearIcon01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearIcon',2},{'VoidGearInfoSinglePanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel',2},{'VoidIconBG02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidIconBG',2},{'VoidGearIcon02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidGearIcon',2},{'VoidGearLvDotPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearLvDotPanel',2},{'VoidGearLvDotPrefab','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearLvDotPrefab',2},{'VoidGearPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel',2},{'jijiadi','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/jijiadi',2},{'VoidGearIcon03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/VoidGearIcon',2},{'EmptyVoidGearIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/EmptyVoidGearIcon',2},{'EmptyPanel','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel',2},{'yuankuang','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/yuankuang',2},{'VoidGearRankIcon','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/VoidGearRankIcon',2},{'BG','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/BG',2},{'VoidGearPanel2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2',2},{'gongmingdi01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/gongmingdi',2},{'VoidGearDoublePanel101','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1',2},{'VoidIconBG03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidIconBG',2},{'VoidGearIcon04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearIcon',2},{'VoidGearDoublePanel201','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2',2},{'VoidIconBG04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidIconBG',2},{'VoidGearIcon05','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearIcon',2},{'VoidGearInfoSinglePanel01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel',2},{'VoidIconBG05','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidIconBG',2},{'VoidGearIcon06','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidGearIcon',2},{'VoidGearLvDotPanel01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearLvDotPanel',2},{'VoidGearLvDotPrefab01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearLvDotPrefab',2},{'VoidGearPanel01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel',2},{'jijiadi01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/jijiadi',2},{'VoidGearIcon07','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/VoidGearIcon',2},{'EmptyVoidGearIcon01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/EmptyVoidGearIcon',2},{'EmptyPanel01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel',2},{'yuankuang01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/yuankuang',2},{'VoidGearRankIcon01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/VoidGearRankIcon',2},{'BG01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/BG',2},{'VoidGearPanel3','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3',2},{'gongmingdi02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/gongmingdi',2},{'VoidGearDoublePanel102','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1',2},{'VoidIconBG06','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidIconBG',2},{'VoidGearIcon08','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearIcon',2},{'VoidGearDoublePanel202','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2',2},{'VoidIconBG07','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidIconBG',2},{'VoidGearIcon09','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearIcon',2},{'VoidGearInfoSinglePanel02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel',2},{'VoidIconBG08','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidIconBG',2},{'VoidGearIcon10','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidGearIcon',2},{'VoidGearLvDotPanel02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearLvDotPanel',2},{'VoidGearLvDotPrefab02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearLvDotPrefab',2},{'VoidGearPanel02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel',2},{'jijiadi02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/jijiadi',2},{'VoidGearIcon11','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/VoidGearIcon',2},{'EmptyVoidGearIcon02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/EmptyVoidGearIcon',2},{'EmptyPanel02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel',2},{'yuankuang02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/yuankuang',2},{'VoidGearRankIcon02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/VoidGearRankIcon',2},{'BG02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/BG',2},{'Bian2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/Bian2',2},{'SwitchPanel','SwitchPanel',2},{'Btn_Switch','SwitchPanel/SwitchVoid/Btn_Switch',2},{'Line','SwitchPanel/SwitchVoid/Btn_Switch/Line',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchVoid/Btn_SwitchHighLight',2},{'Line01','SwitchPanel/SwitchVoid/Btn_SwitchHighLight/Line',2},{'Btn_Switch01','SwitchPanel/SwitchSkill/Btn_Switch',2},{'Line02','SwitchPanel/SwitchSkill/Btn_Switch/Line',2},{'Btn_SwitchHighLight01','SwitchPanel/SwitchSkill/Btn_SwitchHighLight',2},{'Line03','SwitchPanel/SwitchSkill/Btn_SwitchHighLight/Line',2},{'Btn_Switch02','SwitchPanel/SwitchInfo/Btn_Switch',2},{'Line04','SwitchPanel/SwitchInfo/Btn_Switch/Line',2},{'Btn_SwitchHighLight02','SwitchPanel/SwitchInfo/Btn_SwitchHighLight',2},{'Line05','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/Line',2},{'RoleInfoPanel','RoleInfoPanel',2},{'LowerInfoPanel','RoleInfoPanel/LowerInfoPanel',2},{'ProTypeImg','RoleInfoPanel/LowerInfoPanel/ProTypeImg',2},{'StarPrefab','RoleInfoPanel/LowerInfoPanel/StarPrefab',2},{'StarPrefabJueXing','RoleInfoPanel/LowerInfoPanel/StarPrefabJueXing',2},{'StarPanel','RoleInfoPanel/LowerInfoPanel/StarPanel',2},{'pilot','RoleInfoPanel/LowerInfoPanel/pilot',2},{'RoleNameBG','RoleInfoPanel/LowerInfoPanel/RoleNameBG',2},{'jiao','RoleInfoPanel/jiao',2},{'GroupIconImg','RoleInfoPanel/jiao/GroupIconImg',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu','UpperBtnPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UpperBtnPanel/ReturnBg/Btn_Back',2},{'RoleSpineClickArea','RoleSpineClickArea',2},
        -- Text 列表
        {'HpNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HpNameTxt',3},{'AtkNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkNameTxt',3},{'AtkInfoTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkNameTxt/AtkInfoTxt',3},{'DefNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefNameTxt',3},{'BaojiNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiNameTxt',3},{'BaoShangNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoShangNameTxt',3},{'MinjieNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieNameTxt',3},{'HPInfoTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HPInfoTxt',3},{'DefInfoTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefInfoTxt',3},{'BaojiInfoTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiInfoTxt',3},{'BaoshangInfoTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoshangInfoTxt',3},{'MinjieInfoTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieInfoTxt',3},{'ZhiYuanNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt',3},{'ZhiYuanInfoTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanInfoTxt',3},{'RolePreviewTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/Btn_PreviewLv/RolePreviewTxt',3},{'RoleExpNameTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleExpNameTxt',3},{'RoleLvUpBtnTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleUpLvBtn/RoleLvUpBtnTxt',3},{'RoleMaxTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/UpLvBg/RoleUpLvBtn/RoleMaxTxt',3},{'LV','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/LV',3},{'LvMax_Text','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/LvMax_Text',3},{'RoleMaxLvTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/RoleMaxLvTxt',3},{'RoleExpTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/RoleExpTxt',3},{'RoleCurLvTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleLevelPanel/RoleCurLvTxt',3},{'ChakanXiangqingTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Btn_PreviewSkill/ChakanXiangqingTxt',3},{'AttackType1','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/AttackType1',3},{'AttackType2','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/Img_Julikuang/AttackType2',3},{'RoleRankTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/RoleRankTxt',3},{'RoleSkillUpBtnTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade/RoleSkillUpBtnTxt',3},{'RoleSkillMAXTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/Btn_SkillUpgrade/RoleSkillMAXTxt ',3},{'RoleSkillTxt','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/jinengqianghua/RoleSkillTxt',3},{'Text_Jinengwenzi','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel1/RoleSkillIconImg4/JLock/Text_Jinengwenzi',3},{'Text_Jinengwenzi01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg4/JLock/Text_Jinengwenzi',3},{'Text_Jinengwenzi02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/SkillPanel/RoleSkillIconPanel2/RoleSkillIconImg5/Img_Jinengwenzidi/Text_Jinengwenzi',3},{'tishi','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/tishi',3},{'VoidGearInfoText','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearInfoText',3},{'VoidGearText','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearText',3},{'VoidGearInfoText01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearInfoText',3},{'VoidGearText01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearText',3},{'VoidGearInfoText02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidGearInfoText',3},{'VoidGearText02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearInfoSinglePanel/VoidGearText',3},{'EmptyText','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel/EmptyText',3},{'VoidGearNameText','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/VoidGearPanel/BG/VoidGearNameText',3},{'Text','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel1/Text',3},{'VoidGearInfoText03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearInfoText',3},{'VoidGearText03','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearText',3},{'VoidGearInfoText04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearInfoText',3},{'VoidGearText04','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearText',3},{'VoidGearInfoText05','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidGearInfoText',3},{'VoidGearText05','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearInfoSinglePanel/VoidGearText',3},{'EmptyText01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel/EmptyText',3},{'VoidGearNameText01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/VoidGearPanel/BG/VoidGearNameText',3},{'Text01','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel2/Text',3},{'VoidGearInfoText06','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearInfoText',3},{'VoidGearText06','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel1/VoidGearText',3},{'VoidGearInfoText07','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearInfoText',3},{'VoidGearText07','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearDoublePanel/VoidGearDoublePanel2/VoidGearText',3},{'VoidGearInfoText08','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidGearInfoText',3},{'VoidGearText08','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearInfoSinglePanel/VoidGearText',3},{'EmptyText02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/EmptyVoidGearIcon/EmptyPanel/EmptyText',3},{'VoidGearNameText02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/VoidGearPanel/BG/VoidGearNameText',3},{'Text02','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/VoidPanel/VoidPanelLayout/VoidGearPanel3/Text',3},{'EnText','SwitchPanel/SwitchVoid/Btn_Switch/EnText',3},{'CNText','SwitchPanel/SwitchVoid/Btn_Switch/CNText',3},{'EnText01','SwitchPanel/SwitchVoid/Btn_SwitchHighLight/EnText',3},{'CNText01','SwitchPanel/SwitchVoid/Btn_SwitchHighLight/CNText',3},{'EnText02','SwitchPanel/SwitchSkill/Btn_Switch/EnText',3},{'CNText02','SwitchPanel/SwitchSkill/Btn_Switch/CNText',3},{'EnText03','SwitchPanel/SwitchSkill/Btn_SwitchHighLight/EnText',3},{'CNText03','SwitchPanel/SwitchSkill/Btn_SwitchHighLight/CNText',3},{'EnText04','SwitchPanel/SwitchInfo/Btn_Switch/EnText',3},{'CNText04','SwitchPanel/SwitchInfo/Btn_Switch/CNText',3},{'EnText05','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/EnText',3},{'CNText05','SwitchPanel/SwitchInfo/Btn_SwitchHighLight/CNText',3},{'RoleNameTxt','RoleInfoPanel/LowerInfoPanel/RoleNameBG/RoleNameTxt',3},{'Text_TitleCn','UpperBtnPanel/Text_TitleCn',3},{'Text_TitleEn','UpperBtnPanel/Text_TitleEn',3},{'CnBgTitle','UpperBtnPanel/CnBgTitle',3},{'EnBgTitle','UpperBtnPanel/EnBgTitle',3},
        -- Slider 列表
        {'ZhiYuanSlider','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider',5},{'DefenceSlider','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/DefenceSlider',5},{'MinjieSlider','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/MinjieSlider',5},{'BaojiSlider','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaojiSlider',5},{'BaoshangSlider','RightPanelBG/RoleScrollMask/RoleDetailScrollPanel/Viewport/RoleDetailScrollRoot/InfoPanel/RoleInfoPanel/BaoshangSlider',5},
        -- Toggle 列表
        {'SwitchVoid','SwitchPanel/SwitchVoid',13},{'SwitchSkill','SwitchPanel/SwitchSkill',13},{'SwitchInfo','SwitchPanel/SwitchInfo',13},
    }
end
-- Code Auto Create End
require("LocalData/RoleprofileLocalData")
function M:OnInit()
    self.index = 0
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnHomeClick) )
    UIEvent.LuaClick(self.RoleSpineClickArea().gameObject, Handle(self, self.GetCurFavorWords))---点击角色

    self:InitSwitch()
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
    self.RoleLvUpBtnTxt().gameObject:SetActive(false)
    self.RoleSkillUpBtnTxt().gameObject:SetActive(false)
    self.SkillRedDotIcon().gameObject:SetActive(false)
end

---初始化左侧按钮
function M:InitSwitch()
    self.IsScroll = false
    self.isClick = false
    local toggles = {
        [1] = self.SwitchInfo(),
        [2] = self.SwitchSkill(),
        [3] = self.SwitchVoid()
    }

    local ReloadBag = {
        [1] = Handle(self, self.OnClickRoleInfoSwitch),
        [2] = Handle(self, self.OnClickRoleSkillSwitch),
        [3] = Handle(self, self.OnClickRoleVoidSwitch),
    }

    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Btn_Switch","Btn_SwitchHighLight")
        high:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self:OnLeftToggleClick(...,normal,high, ReloadBag[idx])
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
    Tools.ScrollTweenY(self.RoleDetailScrollRoot().gameObject,self.RoleDetailScrollPanel().gameObject,0,0.2,6)
end
---切换到技能界面
function M:OnClickRoleSkillSwitch()
    Tools.ScrollTweenY(self.RoleDetailScrollRoot().gameObject,self.RoleDetailScrollPanel().gameObject,588,0.2,6)
end
---切换到共鸣界面
function M:OnClickRoleVoidSwitch()
    Tools.ScrollTweenY(self.RoleDetailScrollRoot().gameObject,self.RoleDetailScrollPanel().gameObject,989,0.2,6)
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
        end
    end
    self.isClick = false
    self.IsScroll = true
end

function M:OnShow(data)
    ---@type RoleData
    self.CurHero = data[1]
    local CurHeroAttr = self.CurHero:GetHeroAttr()
    self:CreatSpine(self.LihuiSpinePanel().gameObject,self.CurHero.id)
    ---设置名称
    self.RoleNameTxt().text = self.CurHero.name
    ---设置职业
    MgrRes.LoadSprite(self.ProTypeImg(),self.CurHero.iconCareer)
    ---设置阵营
    MgrRes.LoadSprite(self.GroupIconImg(),"Attribute/"..self.CurHero.CampiconName)
    ---设置星
    for i = 1, #self.unAwakenStarArr do
        self.unAwakenStarArr[i]:SetActive(i <= self.CurHero.star and not self.CurHero.awaken) ---未觉醒星
    self.onAwakenStarArr[i]:SetActive(i <= self.CurHero.star and self.CurHero.awaken)     ---觉醒星
    end
    ---初始化人物信息
    self:InitRoleInfoPanel(CurHeroAttr)
    ---初始化技能信息
    self:InitRoleSkillPanel(CurHeroAttr)
    ---初始化共鸣信息
    self:InitVoidPanel(self.CurHero)
end

---初始化人物信息
function M:InitRoleInfoPanel(attr)
    if attr.Occupation == 4 then
        self.ZhiYuanNameTxt().gameObject:SetActive(true)
        self.AtkNameTxt().gameObject:SetActive(false)
    else
        self.ZhiYuanNameTxt().gameObject:SetActive(false)
        self.AtkNameTxt().gameObject:SetActive(true)
    end
    ---角色名等信息
    self.RoleCurLvTxt():GetComponent("TextMeshProUGUI").text=""..attr.LV
    self.RoleMaxLvTxt():GetComponent("TextMeshProUGUI").text=""..attr.LvMax
    ---角色属性信息
    if tonumber(attr.HP) >= 1000000 then
        self.HPInfoTxt().text = (self.GetMillionNumInfo(attr.HP)).."M"
    else
        self.HPInfoTxt().text = math.floor(attr.HP)
    end
    ---方向
    if self.CurHero.skillDir == 0 then
        self.Img_Zuo().gameObject:SetActive(true)
        self.Img_You().gameObject:SetActive(false)
    else
        self.Img_Zuo().gameObject:SetActive(false)
        self.Img_You().gameObject:SetActive(true)
    end
    ---角色属性信息
    self.AtkInfoTxt().text= ""..math.floor(attr.RealAtk)
    self.ZhiYuanInfoTxt().text="".. (self:GetInfoCorrect(attr.RealSuppart)).."%"
    self.ZhiYuanSlider().value = attr.RealSuppart
    self.DefInfoTxt().text ="".. (self:GetInfoCorrect(attr.RealDef)).."%"
    self.MinjieInfoTxt():GetComponent("TextMeshProUGUI").text = ""..(self:GetInfoCorrect(attr.RealAgile)).."%"
    self.BaojiInfoTxt():GetComponent("TextMeshProUGUI").text =  ""..(self:GetInfoCorrect(attr.RealCrit)).."%"
    self.BaoshangInfoTxt():GetComponent("TextMeshProUGUI").text ="".. (self:GetInfoCorrect(attr.RealCritDmg)).."%"
    --- 设置滑动条
    self.DefenceSlider().value = attr.RealDef
    self.BaojiSlider().value = attr.RealCrit
    self.BaoshangSlider().value = attr.RealCritDmg
    self.MinjieSlider().value = attr.RealAgile
    --
    self.RoleExpTxt().text = attr.EXP.."/"..attr.EXP
    UIEvent.LuaClick(self.Btn_PreviewLv().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.RolePreview_UI,{self.CurHero,1,nil},true)
    end))
    CMgrSpine.Instance:AddScrollListener(self.RoleDetailScrollRoot().gameObject,Handle(self,self.DetailScrollListenerCallBack))
end
---得到百万级数据的除以100W后精度到小数点后两位的值输出
function M.GetMillionNumInfo(_InputInfo)
    local _tempRateNum = _InputInfo/10000
    local _OutInfo = math.floor(_tempRateNum)/100
    return _OutInfo
end
---取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 =0
    local tempInt2 =0
    local tempData=0
    tempInt1,tempInt2=math.modf((_Data*1000)/1)
    tempData=tempInt1/10
    return tempData
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
    for idx, obj in pairs(equipArr) do
        self:InitVoidGearPanelByJNVoidGear(gearPanel[obj.position],obj)
    end
end
--根据当前传入的共鸣装备信息对象更新对应的UI信息
---@param _JNVoidGear EquipData
function M:InitVoidGearPanelByJNVoidGear(_VoidGearPanel,_JNVoidGear)

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
    if _JNVoidGear.level ~=0 then
        _VoidGearNameText:GetComponent("TextMeshProUGUI").text="LV.".._JNVoidGear.level.." ".._JNVoidGear.name
    else
        _VoidGearNameText:GetComponent("TextMeshProUGUI").text="".._JNVoidGear.name
    end
    Tools.ClearAllChild(_VoidGearLvDotPanel)
    for i = 1, tonumber(_JNVoidGear.level), 1 do
        -- statements
        CJNUIMgr.CreatGo(_VoidGearLvDotPrefab,_VoidGearLvDotPanel)
    end
    self:InitVoidGearIcon(_VoidGearIconPanel,_JNVoidGear)
    --更新词条信息
    local _VoidInfoTab=JNStrTool.strSplit(",", _JNVoidGear.attribute)
    local _VoidInfoCount=TableToObject.GetTableLength(_VoidInfoTab)
    if _VoidInfoCount > 1 then
        -- 双属性
        _VoidGearInfoSinglePanel:SetActive(false)
        _VoidGearDoublePanel:SetActive(true)
        self:InitVoidGearInfoDataPrefab(_VoidGearDoublePanel1,_VoidInfoTab[1],1)
        self:InitVoidGearInfoDataPrefab(_VoidGearDoublePanel2,_VoidInfoTab[2],1)
    else
        -- 单属性
        _VoidGearInfoSinglePanel:SetActive(true)
        _VoidGearDoublePanel:SetActive(false)
        self:InitVoidGearInfoDataPrefab(_VoidGearInfoSinglePanel,_VoidInfoTab[1],1)
    end
end
---初始化一个共鸣装备图标信息
---@param _VoidGear EquipData
function M:InitVoidGearIcon(_Obj,_VoidGear)
    if _VoidGear == nil then
        return
    end
    local _VoidGearIconImg=CJNUIMgr.GetSunUseName(_Obj,"VoidGearIcon")
    local _EmptyVoidGearIconImg=CJNUIMgr.GetSunUseName(_Obj,"EmptyVoidGearIcon")
    local _VoidGearRankIcon=CJNUIMgr.GetSunUseName(_Obj,"VoidGearRankIcon")
    _EmptyVoidGearIconImg:SetActive(false)
    _VoidGearIconImg:SetActive(true)
    MgrRes.LoadSprite(_VoidGearIconImg:GetComponent("Image"),_VoidGear.icon)
    MgrRes.LoadSprite(_VoidGearRankIcon:GetComponent("Image"),_VoidGear.iconFrame)
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
    if _tempInfoTab1[1] == "0" then
        -- 固定攻击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text="".._CurInfoData
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
    elseif _tempInfoTab1[1] == "1" then
        -- 百分比攻击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.1).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
    elseif _tempInfoTab1[1] == "2" then
        -- 固定生命
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text="".._CurInfoData
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_health")
    elseif _tempInfoTab1[1] == "3" then
        -- 百分比生命
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.1).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_health")
    elseif _tempInfoTab1[1] == "4" then
        -- 防御
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.1).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_defense")
    elseif _tempInfoTab1[1] == "5" then
        -- 暴击
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.1).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_critical")
    elseif _tempInfoTab1[1] == "6" then
        -- 暴伤
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.1).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_criticaldamage")
    elseif _tempInfoTab1[1] == "7" then
        -- 敏捷
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.1).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_agile")
    elseif _tempInfoTab1[1] == "8" then
        -- 支援力
        _VoidGearInfoText:GetComponent("TextMeshProUGUI").text=""..(_CurInfoData*0.1).."%"
        _VoidGearText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("coreattrdata_support")
    end
end

---初始化技能信息
function M:InitRoleSkillPanel(hero)
    self.RoleSkillTxt():GetComponent("TextMeshProUGUI").text=""..hero.SkillLV.."<size=70><color=#7B7B7B>/".."9".."</color></size>"
    if hero.Occupation == 4 then
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..hero.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..hero.AttackRangeTexture)
    end

    if hero.Skill_5_example[1]~=nil then
        MgrRes.LoadSprite(self.RoleSkillIconImg5(),"Skill/"..hero.Skill_5_example[1].Icon)
        --添加技能图标点击详细说明事件
        UIEvent.LuaClick(self.RoleSkillIconImg5().gameObject,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_5_example,5)
        end))

        if hero.IsAwaken==true or hero.IsAwaken==1 then
            self.JLock01().gameObject:SetActive(false)
        else
            self.JLock01().gameObject:SetActive(true)
        end
        self.RoleSkillIconPanel1().gameObject:SetActive(false)
        self.RoleSkillIconPanel2().gameObject:SetActive(true)

        self:SwitchSkillPanel(self.RoleSkillIconPanel2(),hero)
    else
        --EX技能为空
        self.RoleSkillIconPanel1().gameObject:SetActive(true)
        self.RoleSkillIconPanel2().gameObject:SetActive(false)
        if hero.IsAwaken==true or hero.IsAwaken==1 then
            self.JLock().gameObject:SetActive(false)
        else
            self.JLock().gameObject:SetActive(true)
        end
        self:SwitchSkillPanel(self.RoleSkillIconPanel1(),hero)
    end
    UIEvent.LuaClick(self.Btn_PreviewSkill().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.RolePreview_UI,{self.CurHero,3,nil},true)
    end))
end
function M:SwitchSkillPanel(RoleSkillIconPanel,hero)
    local RoleSkillIconImg1 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg1")
    local RoleSkillIconImg2 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg2")
    local RoleSkillIconImg3 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg3")
    local RoleSkillIconImg4 = CJNUIMgr.GetSunUseName(RoleSkillIconPanel.gameObject,"RoleSkillIconImg4")
    --技能图标1、2、3、4
    if hero.Skill_1_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg1:GetComponent("Image"),"Skill/"..hero.Skill_1_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg1,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_1_example,1)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg1,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg1:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if hero.Skill_2_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg2:GetComponent("Image"),"Skill/"..hero.Skill_2_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg2,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_2_example,2)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg2,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg2:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if hero.Skill_3_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg3:GetComponent("Image"),"Skill/"..hero.Skill_3_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg3,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_3_example,3)
        end))
    else
        UIEvent.LuaClick(RoleSkillIconImg3,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg3:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
    if hero.Skill_4_example[1]~=nil then
        MgrRes.LoadSprite(RoleSkillIconImg4:GetComponent("Image"),"Skill/"..hero.Skill_4_example[1].Icon)
        UIEvent.LuaClick(RoleSkillIconImg4,Handle(self, function ()
            -- statements
            self:InitCombineSkillPanel(hero.Skill_4_example,4)
        end))
    else
        self.JLock01().gameObject:SetActive(false)
        self.JLock().gameObject:SetActive(false)
        UIEvent.LuaClick(RoleSkillIconImg4,Handle(self, function ()
        end))
        MgrRes.LoadSprite(RoleSkillIconImg4:GetComponent("Image"),"Skill/".."icon_skill_empty")
    end
end
--隐藏界面部分功能
function M:HidePanel()
    -- statements
    self.SwitchPanel().gameObject:SetActive(false)
    self.RightPanelBG().gameObject:SetActive(false)
    self.RoleInfoPanel().gameObject:SetActive(false)
end
--显示界面部分功能
function M:ShowPanel()
    self.SwitchPanel().gameObject:SetActive(true)
    self.RightPanelBG().gameObject:SetActive(true)
    self.RoleInfoPanel().gameObject:SetActive(true)
end

function M:OnBackClick()
    if  self.index  == 0 then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    elseif self.index  == 1 then
        self:ShowPanel()
        self:SpineMove(self.PosX,0.3)
        self.index = 0
    end
end
function M:SpineMove(_TargetPosX,_Duration)
    Tools.TweenDoLocalMoveX(self.LihuiSpinePanel().gameObject,_TargetPosX,_Duration,-1)
end
function M:CreatSpine(_Root,_RoleId)
    local _PosInfoTab=CharactercoordinatesLocalData.tab[_RoleId].coordinate2
    local _tempPosTab1 =JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])
    self.PosX = tonumber(_tempPosTab2[1])
    MgrRes.LoadWatchAuto(_Root,_RoleId,tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),tonumber(_tempPosTab1[2]),nil,function(obj)
        self.SpineObj = obj
    end)
end
function M:OnHomeClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBackToFirst(UID.Home_UI)
    MgrUI.ClosePop(self.Uid)
end

---点击弹出详情技能界面
function M:InitCombineSkillPanel(_Skill,index)
    MgrUI.Pop(UID.RolePreview_UI,{self.CurHero,2,_Skill,index},true)
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

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function M:PlayTargetRoleAniVoice(_ActorLineId)
    local _AniName=ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName=ActorLinesLocalData.tab[_ActorLineId][13]

    if self.SpineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj,_AniName,false)
    end
    MgrSound.PlayRole(_AudioName,nil,nil,false,0,0)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M