-- Code Auto Create Begin
local M = Class('ArtGallery_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ArtGallery_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ArtGallery_UI].prefab'
    self.Name = 'Form[ArtGallery_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG(msjs)','MainPanel/Img_BG(msjs)',2},{'Img_BGzhezhao','MainPanel/Img_BGzhezhao',2},{'LeftPanel','MainPanel/LeftPanel',2},{'SwitchIllustration','MainPanel/LeftPanel/Content/SwitchIllustration',2},{'normal','MainPanel/LeftPanel/Content/SwitchIllustration/normal',2},{'weixuanzhongdi','MainPanel/LeftPanel/Content/SwitchIllustration/normal/weixuanzhongdi',2},{'chosen','MainPanel/LeftPanel/Content/SwitchIllustration/chosen',2},{'xuanzhongdi','MainPanel/LeftPanel/Content/SwitchIllustration/chosen/xuanzhongdi',2},{'SwitchAnimation','MainPanel/LeftPanel/Content/SwitchAnimation',2},{'normal01','MainPanel/LeftPanel/Content/SwitchAnimation/normal',2},{'weixuanzhongdi01','MainPanel/LeftPanel/Content/SwitchAnimation/normal/weixuanzhongdi',2},{'chosen01','MainPanel/LeftPanel/Content/SwitchAnimation/chosen',2},{'xuanzhongdi01','MainPanel/LeftPanel/Content/SwitchAnimation/chosen/xuanzhongdi',2},{'SwitchMusic','MainPanel/LeftPanel/Content/SwitchMusic',2},{'normal02','MainPanel/LeftPanel/Content/SwitchMusic/normal',2},{'weixuanzhongdi02','MainPanel/LeftPanel/Content/SwitchMusic/normal/weixuanzhongdi',2},{'chosen02','MainPanel/LeftPanel/Content/SwitchMusic/chosen',2},{'xuanzhongdi02','MainPanel/LeftPanel/Content/SwitchMusic/chosen/xuanzhongdi',2},{'MusicMenu','MainPanel/RightPanel/MusicMenu',2},{'Img_Tanchuangdi','MainPanel/RightPanel/MusicMenu/Img_Tanchuangdi',2},{'Img_Xian','MainPanel/RightPanel/MusicMenu/Img_Xian',2},{'Img_Xiantou2','MainPanel/RightPanel/MusicMenu/Img_Xiantou2',2},{'Img_Xiantou1','MainPanel/RightPanel/MusicMenu/Img_Xiantou1',2},{'AllMusic','MainPanel/RightPanel/MusicMenu/AllMusic',2},{'Viewport','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport',2},{'ContentOfMusic','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic',2},{'Img_Yinyuedi(xz)','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_Yinyuedi(xz)',2},{'Play(huang)','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Play(huang)',2},{'Img_Muisctiao','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_Muisctiao',2},{'Img_Changpiandi','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_Changpiandi',2},{'Img_Changpian','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_Changpiandi/Img_Changpian',2},{'Img_Bopian(bofang)','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_Bopian(bofang)',2},{'Img_Yinyuetudi','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Yinyutu/Img_Yinyuetudi',2},{'Yinyuetu','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Yinyutu/Yinyuetu',2},{'Img_Time1','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_Time1',2},{'Img_TotalTimedi','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_TotalTimedi',2},{'Img_Jiao(huang)','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Img_Jiao(huang)',2},{'Img_Yinyuedi','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_Yinyuedi',2},{'Play(bai)','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Play(bai)',2},{'Img_Muisctiao01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_Muisctiao',2},{'Img_Changpiandi01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_Changpiandi',2},{'Img_Changpian01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_Changpian',2},{'Img_Bopian','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_Bopian',2},{'Img_Yinyuetudi01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Yinyutu/Img_Yinyuetudi',2},{'Yinyuetu01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Yinyutu/Yinyuetu',2},{'Img_Time2','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_Time2',2},{'Img_TotalTimedi01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_TotalTimedi',2},{'Img_Jiao(hei)','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Img_Jiao(hei)',2},{'MusicLocked','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked',2},{'Img_Yinyuedi01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_Yinyuedi',2},{'Play(bai)01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Play(bai)',2},{'Img_Muisctiao02','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_Muisctiao',2},{'Img_Changpiandi02','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_Changpiandi',2},{'Img_Changpian02','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_Changpian',2},{'Img_Bopian01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_Bopian',2},{'Img_Yinyuetudi02','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Yinyutu/Img_Yinyuetudi',2},{'Yinyuetu02','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Yinyutu/Yinyuetu',2},{'Img_Time201','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_Time2',2},{'Img_TotalTimedi02','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_TotalTimedi',2},{'Img_Jiao(hei)01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Img_Jiao(hei)',2},{'LockedMusic_Mask','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/LockedMusic_Mask',2},{'ScrollbarHorizontal','MainPanel/RightPanel/MusicMenu/AllMusic/Scrollbar Horizontal',2},{'Handle','MainPanel/RightPanel/MusicMenu/AllMusic/Scrollbar Horizontal/Sliding Area/Handle',2},{'ScrollbarVertical','MainPanel/RightPanel/MusicMenu/AllMusic/Scrollbar Vertical',2},{'Handle01','MainPanel/RightPanel/MusicMenu/AllMusic/Scrollbar Vertical/Sliding Area/Handle',2},{'Player','MainPanel/RightPanel/MusicMenu/Player',2},{'Playerdi','MainPanel/RightPanel/MusicMenu/Player/Playerdi',2},{'Dian(cheng)','MainPanel/RightPanel/MusicMenu/Player/Dian(cheng)',2},{'Text_nowPlaying','MainPanel/RightPanel/MusicMenu/Player/Text_nowPlaying',2},{'Text_MusicNameMask','MainPanel/RightPanel/MusicMenu/Player/Text_MusicNameMask',2},{'MusicPlayModel','MainPanel/RightPanel/MusicMenu/Player/Btn_PlayPanel/MusicPlayModel',2},{'Next','MainPanel/RightPanel/MusicMenu/Player/Btn_PlayPanel/Next',2},{'PlayAndStop','MainPanel/RightPanel/MusicMenu/Player/Btn_PlayPanel/PlayAndStop',2},{'Play','MainPanel/RightPanel/MusicMenu/Player/Btn_PlayPanel/PlayAndStop/Play',2},{'Stop','MainPanel/RightPanel/MusicMenu/Player/Btn_PlayPanel/PlayAndStop/Stop',2},{'Last','MainPanel/RightPanel/MusicMenu/Player/Btn_PlayPanel/Last',2},{'Btn_playSequence','MainPanel/RightPanel/MusicMenu/Player/Btn_playSequence',2},{'di(yuan)','MainPanel/RightPanel/MusicMenu/Player/Btn_playSequence/di(yuan)',2},{'Sequence','MainPanel/RightPanel/MusicMenu/Player/Btn_playSequence/Sequence',2},{'Single','MainPanel/RightPanel/MusicMenu/Player/Btn_playSequence/Single',2},{'Random','MainPanel/RightPanel/MusicMenu/Player/Btn_playSequence/Random',2},{'Background','MainPanel/RightPanel/MusicMenu/Player/MusicSlider/Background',2},{'Fill','MainPanel/RightPanel/MusicMenu/Player/MusicSlider/Fill Area/Fill',2},{'Handle02','MainPanel/RightPanel/MusicMenu/Player/MusicSlider/Handle Slide Area/Handle',2},{'CollectedMusic','MainPanel/RightPanel/MusicMenu/CollectedMusic',2},{'huangTiao','MainPanel/RightPanel/MusicMenu/CollectedMusic/huangTiao',2},{'AnimationMenu','MainPanel/RightPanel/AnimationMenu',2},{'Img_Tanchuangdi01','MainPanel/RightPanel/AnimationMenu/Img_Tanchuangdi',2},{'Img_Xian01','MainPanel/RightPanel/AnimationMenu/Img_Xian',2},{'Img_Xiantou201','MainPanel/RightPanel/AnimationMenu/Img_Xiantou2',2},{'Img_Xiantou101','MainPanel/RightPanel/AnimationMenu/Img_Xiantou1',2},{'Zhuangshixian','MainPanel/RightPanel/AnimationMenu/Zhuangshixian',2},{'AnimationScrollViewRoot','MainPanel/RightPanel/AnimationMenu/AnimationScrollViewRoot',2},{'AnimationScrollView','MainPanel/RightPanel/AnimationMenu/AnimationScrollView',2},{'ViewportOfAnimation','MainPanel/RightPanel/AnimationMenu/AnimationScrollView/ViewportOfAnimation',2},{'ContentOfAnimation','MainPanel/RightPanel/AnimationMenu/AnimationScrollView/ViewportOfAnimation/ContentOfAnimation',2},{'ScrollbarHorizontal01','MainPanel/RightPanel/AnimationMenu/AnimationScrollView/Scrollbar Horizontal',2},{'Handle03','MainPanel/RightPanel/AnimationMenu/AnimationScrollView/Scrollbar Horizontal/Sliding Area/Handle',2},{'ScrollbarVertical01','MainPanel/RightPanel/AnimationMenu/AnimationScrollView/Scrollbar Vertical',2},{'Handle04','MainPanel/RightPanel/AnimationMenu/AnimationScrollView/Scrollbar Vertical/Sliding Area/Handle',2},{'Animation','MainPanel/RightPanel/AnimationMenu/Animation',2},{'Img_Animationdi','MainPanel/RightPanel/AnimationMenu/Animation/Img_Animationdi',2},{'Img_LockedPicture','MainPanel/RightPanel/AnimationMenu/Animation/Img_LockedPicture',2},{'Img_AnimationNamedi','MainPanel/RightPanel/AnimationMenu/Animation/Img_AnimationNamedi',2},{'Img_Animationkuang','MainPanel/RightPanel/AnimationMenu/Animation/Img_Animationkuang',2},{'Img_Locked','MainPanel/RightPanel/AnimationMenu/Animation/Img_Locked',2},{'new1','MainPanel/RightPanel/AnimationMenu/Animation/new1',2},{'Img_Newdi','MainPanel/RightPanel/AnimationMenu/Animation/new1/Img_Newdi',2},{'Img_New','MainPanel/RightPanel/AnimationMenu/Animation/new1/Img_New',2},{'Btn_AnimFilterCloser','MainPanel/RightPanel/AnimationMenu/Btn_AnimFilterCloser',2},{'AnimDropDown','MainPanel/RightPanel/AnimationMenu/AnimDropDown',2},{'SelectListMask1','MainPanel/RightPanel/AnimationMenu/AnimDropDown/AnimDropMask/SelectListMask1',2},{'ChapterGroup','MainPanel/RightPanel/AnimationMenu/AnimDropDown/AnimDropMask/SelectListMask1/ChapterGroup',2},{'Bg','MainPanel/RightPanel/AnimationMenu/AnimDropDown/AnimDropMask/SelectListMask1/ChapterGroup/Bg',2},{'ChapterPrefab','MainPanel/RightPanel/AnimationMenu/AnimDropDown/AnimDropMask/SelectListMask1/ChapterGroup/ChapterPrefab',2},{'Btn_SelectAnimChapter','MainPanel/RightPanel/AnimationMenu/Btn_SelectAnimChapter',2},{'SelectBG','MainPanel/RightPanel/AnimationMenu/Btn_SelectAnimChapter/SelectBG',2},{'Btn_DropDown','MainPanel/RightPanel/AnimationMenu/Btn_SelectAnimChapter/Btn_DropDown',2},{'Btn_DropUP','MainPanel/RightPanel/AnimationMenu/Btn_SelectAnimChapter/Btn_DropUP',2},{'IllustrationMenu','MainPanel/RightPanel/IllustrationMenu',2},{'Img_Tanchuangdi02','MainPanel/RightPanel/IllustrationMenu/Img_Tanchuangdi',2},{'Img_Xian02','MainPanel/RightPanel/IllustrationMenu/Img_Xian',2},{'Img_Xiantou202','MainPanel/RightPanel/IllustrationMenu/Img_Xiantou2',2},{'Img_Xiantou102','MainPanel/RightPanel/IllustrationMenu/Img_Xiantou1',2},{'Zhuangshixian01','MainPanel/RightPanel/IllustrationMenu/Zhuangshixian',2},{'IllustrationScrollViewRoot','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollViewRoot',2},{'IllustrationScrollView','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollView',2},{'ViewportOfIllustration','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollView/ViewportOfIllustration',2},{'ContentOfIllustration','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollView/ViewportOfIllustration/ContentOfIllustration',2},{'ScrollbarHorizontal02','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollView/Scrollbar Horizontal',2},{'Handle05','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollView/Scrollbar Horizontal/Sliding Area/Handle',2},{'ScrollbarVertical02','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollView/Scrollbar Vertical',2},{'Handle06','MainPanel/RightPanel/IllustrationMenu/IllustrationScrollView/Scrollbar Vertical/Sliding Area/Handle',2},{'Illustration','MainPanel/RightPanel/IllustrationMenu/Illustration',2},{'Img_Illustrationdi','MainPanel/RightPanel/IllustrationMenu/Illustration/Img_Illustrationdi',2},{'Img_LockedIllustration','MainPanel/RightPanel/IllustrationMenu/Illustration/Img_LockedIllustration',2},{'Img_IllustrationNamedi','MainPanel/RightPanel/IllustrationMenu/Illustration/Img_IllustrationNamedi',2},{'Img_Illustrationkuang','MainPanel/RightPanel/IllustrationMenu/Illustration/Img_Illustrationkuang',2},{'Img_Locked01','MainPanel/RightPanel/IllustrationMenu/Illustration/Img_Locked',2},{'new2','MainPanel/RightPanel/IllustrationMenu/Illustration/new2',2},{'Img_Newdi01','MainPanel/RightPanel/IllustrationMenu/Illustration/new2/Img_Newdi',2},{'Img_New01','MainPanel/RightPanel/IllustrationMenu/Illustration/new2/Img_New',2},{'Text_CollectIllustration','MainPanel/RightPanel/IllustrationMenu/Text_CollectIllustration',2},{'Img_Huangtiao','MainPanel/RightPanel/IllustrationMenu/Text_CollectIllustration/Img_Huangtiao',2},{'Btn_IllustrationFilterCloser','MainPanel/RightPanel/IllustrationMenu/Btn_IllustrationFilterCloser',2},{'IllustrationDropDown','MainPanel/RightPanel/IllustrationMenu/IllustrationDropDown',2},{'SelectListMask','MainPanel/RightPanel/IllustrationMenu/IllustrationDropDown/IllustrationDropMask/SelectListMask',2},{'IllustrationChapterGroup','MainPanel/RightPanel/IllustrationMenu/IllustrationDropDown/IllustrationDropMask/SelectListMask/IllustrationChapterGroup',2},{'Bg01','MainPanel/RightPanel/IllustrationMenu/IllustrationDropDown/IllustrationDropMask/SelectListMask/IllustrationChapterGroup/Bg',2},{'IllustrationChapterPrefab','MainPanel/RightPanel/IllustrationMenu/IllustrationDropDown/IllustrationDropMask/SelectListMask/IllustrationChapterGroup/IllustrationChapterPrefab',2},{'Btn_SelectIllustrationChapter','MainPanel/RightPanel/IllustrationMenu/Btn_SelectIllustrationChapter',2},{'SelectBG01','MainPanel/RightPanel/IllustrationMenu/Btn_SelectIllustrationChapter/SelectBG',2},{'Btn_DropDown01','MainPanel/RightPanel/IllustrationMenu/Btn_SelectIllustrationChapter/Btn_DropDown',2},{'Btn_DropUP01','MainPanel/RightPanel/IllustrationMenu/Btn_SelectIllustrationChapter/Btn_DropUP',2},{'Img_Fenggexian','MainPanel/Img_Fenggexian',2},{'Btn_I','MainPanel/Btn_I',2},{'Btn_ReturnInfo','MainPanel/Btn_ReturnInfo',2},{'Btn_ReturnHome','MainPanel/Btn_ReturnHome',2},{'AnimPanel','AnimPanel',2},{'BG_AnimRoot','AnimPanel/BG_AnimRoot',2},{'BG_Anim','AnimPanel/BG_Anim',2},{'PauseButton','AnimPanel/PauseButton',2},{'AnimMask','AnimPanel/AnimMask',2},{'Btn_NextVideo','AnimPanel/Btn_NextVideo',2},{'Img_Anniudi4','AnimPanel/Btn_NextVideo/Img_Anniudi4',2},{'Xian(xia)','AnimPanel/Btn_NextVideo/Xian(xia)',2},{'Btn_LastVideo','AnimPanel/Btn_LastVideo',2},{'Img_Anniudi3','AnimPanel/Btn_LastVideo/Img_Anniudi3',2},{'Xian(shang)','AnimPanel/Btn_LastVideo/Xian(shang)',2},{'Pauseicon','AnimPanel/Pauseicon',2},{'RePlayicon','AnimPanel/RePlayicon',2},{'Btn_AnimPanelReturnMainPanel','AnimPanel/Btn_AnimPanelReturnMainPanel',2},{'Btn_AnimPanelRtnHome','AnimPanel/Btn_AnimPanelRtnHome',2},{'CGPanel','CGPanel',2},{'ScrollView_IllustrationRoot','CGPanel/ScrollView_IllustrationRoot',2},{'Viewport01','CGPanel/ScrollView_IllustrationRoot/Viewport',2},{'BG_IllustrationRoot','CGPanel/ScrollView_IllustrationRoot/Viewport/BG_IllustrationRoot',2},{'ScrollView','CGPanel/Scroll View',2},{'Viewport02','CGPanel/Scroll View/Viewport',2},{'BG_Illustration','CGPanel/Scroll View/Viewport/Content/BG_Illustration',2},{'CGFenchadi','CGPanel/CGFenchadi',2},{'Btn_NextIllustration','CGPanel/Btn_NextIllustration',2},{'Img_Anniudi2','CGPanel/Btn_NextIllustration/Img_Anniudi2',2},{'Xian_Next','CGPanel/Btn_NextIllustration/Xian_Next',2},{'Btn_LastIllustration','CGPanel/Btn_LastIllustration',2},{'Img_Anniudi1','CGPanel/Btn_LastIllustration/Img_Anniudi1',2},{'Xian_Last','CGPanel/Btn_LastIllustration/Xian_Last',2},{'CGFencha','CGPanel/CGFencha',2},{'Fenchakuang','CGPanel/CGFencha/Fenchakuang',2},{'CG_Arrow_Right','CGPanel/CGFencha/CG_Arrow_Right',2},{'CG_Arrow_Left','CGPanel/CGFencha/CG_Arrow_Left',2},{'Btn_HideCGUI','CGPanel/Btn_HideCGUI',2},{'Img_Anniudi','CGPanel/Btn_HideCGUI/Img_Anniudi',2},{'Hideicon','CGPanel/Btn_HideCGUI/Hideicon',2},{'Btn_FangDaSuoXiao','CGPanel/Btn_FangDaSuoXiao',2},{'Img_HuaDongTiao','CGPanel/Btn_FangDaSuoXiao/Img_HuaDongTiao',2},{'Img_GunLun','CGPanel/Btn_FangDaSuoXiao/Img_GunLun',2},{'Btn_HuanYuan','CGPanel/Btn_FangDaSuoXiao/Btn_HuanYuan',2},{'Btn_CGPanelRtnHome','CGPanel/Btn_CGPanelRtnHome',2},{'Btn_CGPanelReturnMainPanel','CGPanel/Btn_CGPanelReturnMainPanel',2},{'ShowCGUI','CGPanel/ShowCGUI',2},
        -- Text 列表
        {'EnText','MainPanel/LeftPanel/Content/SwitchIllustration/normal/EnText',3},{'CNText','MainPanel/LeftPanel/Content/SwitchIllustration/normal/CNText',3},{'EnText01','MainPanel/LeftPanel/Content/SwitchIllustration/chosen/EnText',3},{'CNText01','MainPanel/LeftPanel/Content/SwitchIllustration/chosen/CNText',3},{'EnText02','MainPanel/LeftPanel/Content/SwitchAnimation/normal/EnText',3},{'CNText02','MainPanel/LeftPanel/Content/SwitchAnimation/normal/CNText',3},{'EnText03','MainPanel/LeftPanel/Content/SwitchAnimation/chosen/EnText',3},{'CNText03','MainPanel/LeftPanel/Content/SwitchAnimation/chosen/CNText',3},{'EnText04','MainPanel/LeftPanel/Content/SwitchMusic/normal/EnText',3},{'CNText04','MainPanel/LeftPanel/Content/SwitchMusic/normal/CNText',3},{'EnText05','MainPanel/LeftPanel/Content/SwitchMusic/chosen/EnText',3},{'CNText05','MainPanel/LeftPanel/Content/SwitchMusic/chosen/CNText',3},{'Text_No','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Text_No',3},{'Text_TotalTime1','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Text_TotalTime1',3},{'Text_MusicName1','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_Playing/Text_MusicName1',3},{'Text_No01','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Text_No',3},{'Text_TotalTime2','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Text_TotalTime2',3},{'Text_MusicName2','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music/Music_NotPlaying/Text_MusicName2',3},{'Text_No02','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Text_No',3},{'Text_TotalTime201','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Text_TotalTime2',3},{'Text_MusicName201','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/MusicLocked/Music_Locked/Text_MusicName2',3},{'Text_nowPlaying01','MainPanel/RightPanel/MusicMenu/Player/Text_nowPlaying',3},{'Text_MusicName3','MainPanel/RightPanel/MusicMenu/Player/Text_MusicNameMask/Text_MusicName3',3},{'Text_Time2','MainPanel/RightPanel/MusicMenu/Player/Text_Time2',3},{'collectedMusic_CN','MainPanel/RightPanel/MusicMenu/CollectedMusic/collectedMusic_CN',3},{'collectedMusic_EN','MainPanel/RightPanel/MusicMenu/CollectedMusic/collectedMusic_EN',3},{'collectedMusicCount','MainPanel/RightPanel/MusicMenu/CollectedMusic/collectedMusicCount',3},{'Text_AnimationName','MainPanel/RightPanel/AnimationMenu/Animation/Text_AnimationName',3},{'AnimFilterBtnText','MainPanel/RightPanel/AnimationMenu/Btn_SelectAnimChapter/AnimFilterBtnText',3},{'Text_IllustrationName','MainPanel/RightPanel/IllustrationMenu/Illustration/Text_IllustrationName',3},{'Text_CollectIllustration_CN','MainPanel/RightPanel/IllustrationMenu/Text_CollectIllustration/Text_CollectIllustration_CN',3},{'Text_CollectIllustration_EN','MainPanel/RightPanel/IllustrationMenu/Text_CollectIllustration/Text_CollectIllustration_EN',3},{'Text_collectionCount','MainPanel/RightPanel/IllustrationMenu/Text_CollectIllustration/Text_collectionCount',3},{'collectedMusic_EN(1)','MainPanel/RightPanel/IllustrationMenu/Text_CollectIllustration/collectedMusic_EN (1)',3},{'IllustrationFilterBtnText','MainPanel/RightPanel/IllustrationMenu/Btn_SelectIllustrationChapter/IllustrationFilterBtnText',3},{'Text_ArtAppreciation_CN','MainPanel/Text_ArtAppreciation/Text_ArtAppreciation_CN',3},{'Text_ArtAppreciation_EN','MainPanel/Text_ArtAppreciation/Text_ArtAppreciation_EN',3},{'Text_xiayiduan','AnimPanel/Btn_NextVideo/Text_xiayiduan',3},{'Text_Shangyiiduan','AnimPanel/Btn_LastVideo/Text_Shangyiiduan',3},{'Text_NextIllustration','CGPanel/Btn_NextIllustration/Text_NextIllustration',3},{'Text_LastIllustration','CGPanel/Btn_LastIllustration/Text_LastIllustration',3},{'Text_FenchaNumber','CGPanel/CGFencha/Text_FenchaNumber',3},{'Text_Fencha','CGPanel/CGFencha/Text_Fencha',3},
        -- Slider 列表
        {'MusicSlider','MainPanel/RightPanel/MusicMenu/Player/MusicSlider',5},
        -- UITemplate 列表
        {'ChapterPrefab01','MainPanel/RightPanel/AnimationMenu/AnimDropDown/AnimDropMask/SelectListMask1/ChapterGroup/ChapterPrefab',10},{'IllustrationChapterPrefab01','MainPanel/RightPanel/IllustrationMenu/IllustrationDropDown/IllustrationDropMask/SelectListMask/IllustrationChapterGroup/IllustrationChapterPrefab',10},
        -- Toggle 列表
        {'SwitchIllustration01','MainPanel/LeftPanel/Content/SwitchIllustration',13},{'SwitchAnimation01','MainPanel/LeftPanel/Content/SwitchAnimation',13},{'SwitchMusic01','MainPanel/LeftPanel/Content/SwitchMusic',13},{'Music','MainPanel/RightPanel/MusicMenu/AllMusic/Viewport/ContentOfMusic/Music',13},{'ChapterPrefab02','MainPanel/RightPanel/AnimationMenu/AnimDropDown/AnimDropMask/SelectListMask1/ChapterGroup/ChapterPrefab',13},{'Btn_SelectAnimChapter01','MainPanel/RightPanel/AnimationMenu/Btn_SelectAnimChapter',13},{'IllustrationChapterPrefab02','MainPanel/RightPanel/IllustrationMenu/IllustrationDropDown/IllustrationDropMask/SelectListMask/IllustrationChapterGroup/IllustrationChapterPrefab',13},{'Btn_SelectIllustrationChapter01','MainPanel/RightPanel/IllustrationMenu/Btn_SelectIllustrationChapter',13},
    }
end
-- Code Auto Create End
require("LocalData/SteamLocalData")
function M:OnInit()
    self.MusicPlayStatus = {}    --播放循环类型
    self.MusicPlayStatus.Sequence = 1
    self.MusicPlayStatus.Single = 2
    self.MusicPlayStatus.Random = 3
    self.MusicPlayStatus.CurrentStatus = 0
    self.MusicPlayStatus.CurrentStatus = self.MusicPlayStatus.Sequence

    self.IllustrationChaptersTogglesGroup = {}  --插画下拉菜单
    self.AnimChaptersTogglesGroup = {}          --动画下拉菜单
    --self.existIllustration = {}     --存在的插画
    self.numIllustrationInGroup = 1     --插画在组内的序号
    self.unLockedIllustration = {}  --已解锁的插画
    self.OpenedCG = nil             --已打开的图片
    self.OpenedCGGroup = {}         --已打开的那组数据
    self.unLockedMusic = {}         --已解锁的音乐
    self.playingList = {}           --播放列表，顺序由播放模式决定
    self.unLockedAnim = {}          --已解锁的动画
    self.currentAnim = nil
    self.galleryMusicPause = true   --音乐是否已暂停

    self:InitAllPanel()
    self:InitButton()
end
function M:OnUpdateUI()
    self.galleryMusicPause = true   --音乐是否已暂停
    self.playingList = self.unLockedMusic
    self.playingMusic = nil        --当前正在播放的
    self.playEnd = false            --播放是否结束
    self.musicPlayTime = 0
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("PlayingMusic")
    MgrTimer.Cancel("GalleryMusic")
end
---初始化所有面板
function M:InitAllPanel()
    self.new1().gameObject:SetActive(false)
    self.new2().gameObject:SetActive(false)
    self.Music().gameObject:SetActive(false)
    self.MusicMenu().gameObject:SetActive(false)
    self.Animation().gameObject:SetActive(false)
    self.AnimationMenu().gameObject:SetActive(false)
    self.Illustration().gameObject:SetActive(false)
    self.IllustrationMenu().gameObject:SetActive(false)
    self.MusicLocked().gameObject:SetActive(false)
    self.AnimPanel().gameObject:SetActive(false)     --隐藏动画面板
    self.CGPanel().gameObject:SetActive(false)       --隐藏插图面板
    --self.BG_Illustration().gameObject:SetActive(false)

    --初始化3个面板
    self:InitMusicMenu()
    self:NewInitAnimMenu()
    self:NewInitIllustrationMenu()
    --初始化插画面板按钮
    self:InitCGPanelButton()
    --初始化动画按钮
    self:InitAnimPanel()
end
---------------------------------------------通用---------------------------------------
--初始化左边所有toggle
function M:InitButton()
    local toggles = {
        [1] = self.SwitchIllustration01(),
        [2] = self.SwitchAnimation01(),
        [3] = self.SwitchMusic01()
    }
    local Refresh =
    {
        [1] = Handle(self,self.OnClickIllustration),
        [2] = Handle(self,self.OnClickAnimation),
        [3] = Handle(self,self.OnClickMusic)
    }
    --为所有toggle添加事件
    for i,toggle in pairs(toggles) do
        local normal,chosen = self:GetTwoButton(toggle,"normal","chosen")
        chosen:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self.ToggleClick(...,normal,chosen,Refresh[i])
        end,nil)
    end
    --返回上页

    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_ReturnInfo().gameObject,Handle(self, function()
        ---停播当前BGM
        if self.galleryMusicPause and MgrSound.CheckStatus(1,"GalleryMusic") ~= -1 then
            MgrSound.Pause(1,"GalleryMusic")    --如果暂停了要先重启
        end
        if MgrSound.CheckStatus(1,"GalleryMusic") ~= -1 then
            MgrSound.Stop(1,"GalleryMusic")
        end
        --MgrTimer.Reset()
        MgrSound.PlayBGM(SteamLocalData.tab[113023][2],0.2)
        MgrUI.GoBack()
    end))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(83)
    end))
    --返回主页
    UIEvent.LuaClick(self.Btn_ReturnHome().gameObject,Handle(self,function()
        self:CancelAllMusic()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    --激活第一个面板
    self.SwitchIllustration().transform:GetComponent("Toggle").isOn = false
    self.SwitchIllustration().transform:GetComponent("Toggle").isOn = true
end

function M:OnBackKey()
    local isShowCGUI = self.ShowCGUI().gameObject.activeSelf
    local isCGPanel = self.CGPanel().gameObject.activeSelf
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if isShowCGUI then
            self.CGFenchadi().gameObject:SetActive(true)
            self.Btn_NextIllustration().gameObject:SetActive(true)
            self.Btn_LastIllustration().gameObject:SetActive(true)
            self.CGFencha().gameObject:SetActive(true)
            self.Btn_HideCGUI().gameObject:SetActive(true)
            self.Btn_CGPanelReturnMainPanel().gameObject:SetActive(true)
            self.Btn_CGPanelRtnHome().gameObject:SetActive(true)
            self.ShowCGUI().gameObject:SetActive(false)
            return
        end

        if isCGPanel then
            self.CGPanel().gameObject:SetActive(false)
            ---打开按钮面板
            self.LeftPanel().gameObject:SetActive(true)
            return
        end

        if self.Btn_SelectIllustrationChapter01().isOn then
            self.Btn_SelectIllustrationChapter01().isOn = false
            return
        end

        ---停播当前BGM
        if self.galleryMusicPause and MgrSound.CheckStatus(1,"GalleryMusic") ~= -1 then
            MgrSound.Pause(1,"GalleryMusic")    --如果暂停了要先重启
        end
        if MgrSound.CheckStatus(1,"GalleryMusic") ~= -1 then
            MgrSound.Stop(1,"GalleryMusic")
        end
        --MgrTimer.Reset()
        MgrSound.PlayBGM(SteamLocalData.tab[113023][2],0.2)
        MgrUI.GoBack()
    end
end

--获取toggle下两种toggle状态
function M:GetTwoButton(toggle, normalName, chosenName)
    return toggle.transform:Find(normalName).gameObject,toggle.transform:Find(chosenName).gameObject
end
--toggle事件
function M.ToggleClick(isOn,normal,chosen,Func)
    normal:SetActive(not isOn)
    chosen:SetActive(isOn)
    if isOn then
        Func()
    end
end
---------------------------------------------音乐相关-------------------------------------
--初始化音乐面板
function M:InitMusicMenu()
    local music = IllustrationViewModel.MusicData
    local musicPrefab = self.Music().gameObject             --找到音乐预制件
    local musicLockedPrefab = self.MusicLocked().gameObject      --找到被锁音乐预制件
    --创建所有音乐
    for i = 1, #music, 1 do
        --判断是否解锁
        local isLock = StormControl.CheckPointPass(music[i][4])
        if music[i][4] == 0 then
            isLock = true
        end
        if isLock then  --已解锁
            local singleMusic = GameObject.Instantiate(musicPrefab,self.ContentOfMusic().transform,false)
            singleMusic.transform.name = music[i][3]
            --播放中的图标
            local playing = singleMusic.transform:Find("Music_Playing").gameObject
            if i < 10 then                                                                  --序号
                playing.transform:Find("Text_No"):GetComponent("TextMeshProUGUI").text = "0" .. i
            else
                playing.transform:Find("Text_No"):GetComponent("TextMeshProUGUI").text = i
            end
            local timeTxt = string.split(music[i][5],",")
            playing.transform:Find("Text_TotalTime1"):GetComponent("TextMeshProUGUI").text = timeTxt[1] .. ":" .. timeTxt[2]  --写入时间
            playing.transform:Find("Text_MusicName1"):GetComponent("TextMeshProUGUI").text = music[i][2]
            --未播放中的图标
            local notPlaying = singleMusic.transform:Find("Music_NotPlaying").gameObject
            if i < 10 then                                                                  --序号
                notPlaying.transform:Find("Text_No"):GetComponent("TextMeshProUGUI").text = "0" .. i
            else
                notPlaying.transform:Find("Text_No"):GetComponent("TextMeshProUGUI").text = i
            end
            notPlaying.transform:Find("Text_TotalTime2"):GetComponent("TextMeshProUGUI").text = timeTxt[1] .. ":" .. timeTxt[2]   --写入时间
            notPlaying.transform:Find("Text_MusicName2"):GetComponent("TextMeshProUGUI").text = music[i][2]
            --创建完之后激活
            singleMusic:SetActive(true)
            --先隐藏掉播放中的
            playing:SetActive(false)
            --给选中音乐添加播放器事件
            local toggle = singleMusic.transform:GetComponent("Toggle")
            local notPlaying1,playing1 = self:GetTwoButton(toggle,"Music_NotPlaying","Music_Playing")
            Tools.ToggleValueChange(toggle,function(...)
                --.../正在播放/未在播放/音乐/函数
                self.ToggleClick(..., notPlaying1, playing1,Handle(self,function(...)
                    --播放音乐，转盘转动
                        self:PlayMusic(music[i],playing1)
                end))
            end,nil)
            table.insert(self.unLockedMusic,music[i])   --集合所有已解锁音乐
            --self.playingList = self.unLockedMusic
        else        --如果未解锁，放个没解锁的图片,并使整体透明度下降

            local locked = GameObject.Instantiate(musicLockedPrefab,self.ContentOfMusic().transform,false)
            locked:SetActive(true)
        end
    end
    --初始化播放器按钮
    self:InitPlayerButton()
    --初始化已收集的音乐的面板,计算已解锁音乐数量
    self:CollectedMusic_Method()
    --初始化播放列表
    --self.playingList = self:ChangeMusicList(self.unLockedMusic,self.MusicPlayStatus.Single,#self.unLockedMusic)
    self.MusicMenu().gameObject:SetActive(false)
end
--已收集的音乐
function M:CollectedMusic_Method()
    local all = #MusicdexLocalData.tab
    local unLocked = 0
    for i,v in ipairs(MusicdexLocalData.tab) do
        if StormControl.CheckPointLock(v[4]) or v[4] == 0 then
            unLocked = unLocked + 1
        end
    end
    self.collectedMusicCount().transform:GetComponent("TextMeshProUGUI").text = "<color=#E4AA3B>" .. unLocked .. "</color>" .. "/" .. all
end
--初始化播放器按钮
function M:InitPlayerButton()
    --初始化播放器
    --初始化上一首按钮
    UIEvent.LuaClick(self.Last().gameObject,Handle(self,self.PlayLastMusic))
    --初始化播放/暂停
    UIEvent.LuaClick(self.PlayAndStop().gameObject,Handle(self, self.PauseMusic))
    --初始化下一首按钮
    UIEvent.LuaClick(self.Next().gameObject,Handle(self,self.PlayNextMusic))
    --初始化循环模式按钮
    --UIEvent.LuaClick(self.Btn_playSequence().gameObject,Handle(self,self.MusicPlayModelChange))
    --默认列表循环
    self.Sequence().gameObject:SetActive(false)
    self.Single().gameObject:SetActive(false)
    self.Random().gameObject:SetActive(false)
    --隐藏暂停按钮
    self.Stop().gameObject:SetActive(false)
end
--打开音乐面板
function M:OnClickMusic()
    self.MusicMenu().gameObject:SetActive(true)
    self.AnimationMenu().gameObject:SetActive(false)
    self.IllustrationMenu().gameObject:SetActive(false)
    if MgrTimer.IsTimerExist("musicSwitch") then
        MgrTimer.Cancel("musicSwitch")
    end
    --开启音乐计时器
    MgrTimer.AddRepeat("musicSwitch",0.1,function()
        if self.playEnd then
            self:PlayNextMusic()
        end
    end,-1,self.ObjRoot)
end
--暂停播放音乐
function M:PauseMusic()
    if MgrTimer.IsTimerExist("GalleryMusic") then
        if self.galleryMusicPause == false then
            self.galleryMusicPause = true
            self.Stop().gameObject:SetActive(false)
            self.Play().gameObject:SetActive(true)
            MgrTimer.Pause("GalleryMusic")      --时间暂停
            MgrTimer.Pause("musicSwitch")
            MgrTimer.Pause("PlayingMusic")     --光盘转动
        else
            self.galleryMusicPause = false
            self.Stop().gameObject:SetActive(true)
            self.Play().gameObject:SetActive(false)
            MgrTimer.Resume("GalleryMusic")     --时间继续
            MgrTimer.Resume("musicSwitch")
            MgrTimer.Resume("PlayingMusic")     --光盘转动
        end
        MgrSound.Pause(1,"GalleryMusic")                      --音乐暂停
    end

end
--移动到对应音乐位置
function M:MoveToCorrespondingMusic(chosenMusic)
    local musicPosition = chosenMusic.transform.localPosition
    local contentPosition = chosenMusic.transform.parent.transform.localPosition
    if musicPosition.y + contentPosition.y < -542 then
        local coro_Y = -542 - musicPosition.y
        self.ContentOfMusic().transform:GetComponent("RectTransform").anchoredPosition = Vector2(0,coro_Y)
    end
    if musicPosition.y + contentPosition.y > 0 then
        local coro_Y = 0 - musicPosition.y
        self.ContentOfMusic().transform:GetComponent("RectTransform").anchoredPosition = Vector2(0,coro_Y)
    end
end
--寻找上一首歌
function M:LastMusic()
    --找出现在选中的音乐在可播放列表的位置
    for i = 1, #self.playingList, 1 do
        if self.playingMusic[1] == self.playingList[i][1] then
            if i ~= 1 and i ~= "1"  then
                return self.playingList[i - 1]
            else
                return self.playingList[#self.playingList]
            end
        end
    end
end
--寻找下一首歌
function M:NextMusic()
    if #self.playingList == 1 then
        return self.playingList[1]
    end
    --找出现在选中的音乐在可播放列表的位置
    for i = 1, #self.playingList, 1 do
        if self.playingMusic[1] == self.playingList[i][1] then        --找到位置
            if i ~= #self.playingList and i ~= tostring(#self.playingList)  then    --不是最后
                return self.playingList[i + 1]
            else
                return self.playingList[1]
            end
        end
    end
end
--播放上一首音乐
function M:PlayLastMusic()
    local music = nil
    if self.playingMusic ~= nil then    --如果当前有选中音乐，播放上一首
        --找上一首
        music = self:LastMusic()
        --选中音乐
        local chosenMusic = self.ContentOfMusic().transform:Find(music[3]).gameObject
        chosenMusic.transform:GetComponent("Toggle").isOn = false
        chosenMusic.transform:GetComponent("Toggle").isOn = true
        --超出范围移动位置
        self:MoveToCorrespondingMusic(chosenMusic)
    end
end
--播放下一首音乐
function M:PlayNextMusic()
    local music
    if self.playingMusic ~= nil then    --如果在播放，播放下一首
        --找下一首
        music = self:NextMusic()
        --选中音乐
        local chosenMusic = self.ContentOfMusic().transform:Find(music[3]).gameObject
        chosenMusic.transform:GetComponent("Toggle").isOn = false
        chosenMusic.transform:GetComponent("Toggle").isOn = true
        --超出范围移动位置
        self:MoveToCorrespondingMusic(chosenMusic)
    end
end
--播放音乐
function M:PlayMusic(music,musicGameObj)
    if music == self.playingMusic then
        return
    end
    self.Play().gameObject:SetActive(false)
    self.Stop().gameObject:SetActive(true)
    --改播放器歌名
    self.Text_MusicName3():GetComponent("TextMeshProUGUI").text = music[2]
    --歌曲转盘开始转动
    local time = string.split(music[5],",")
    local totalTime = tonumber(time[1]) * 60 + tonumber(time[2])    --总秒数
    local changPian = musicGameObj.transform:Find("Img_Changpiandi"):GetChild(0)
    MgrTimer.Cancel("PlayingMusic")
    MgrTimer.AddDelayNoName(0.5,function()
        MgrTimer.AddRepeat("PlayingMusic",0.02, function()
            if MgrUI.GetCurUI().Uid == UID.ArtGallery_UI then
                changPian.transform.localRotation = changPian.transform.localRotation * Quaternion.Euler(Vector3(0,0,1))
            end
        end,totalTime * 50,nil)
    end,nil)


    if self.galleryMusicPause then
        self.galleryMusicPause = false
        if MgrSound.CheckStatus(1,"GalleryMusic") == 2 then
            MgrSound.Pause(1,"GalleryMusic")   --如果是有音乐处于暂停状态，要先激活播放
        end
    end
    MgrSound.StopAll()
    if music ~= self.playingMusic then      ---传入的为新音乐
        self.playingMusic = music
        self.playEnd = false
        MgrSound.Stop(1,"GalleryMusic")
        MgrSound.PlayBGM(music[3],0.2,nil,false,100,0,"GalleryMusic")
        MgrTimer.Cancel("GalleryMusic")
    end
    self:StartNewRepeat(music)
end
--新音乐计时
function M:StartNewRepeat(music)
    self.musicPlayTime = 0
    local showT = {[2]=":"}
    self. musicTime = string.split(music[5],",")
    local totalTime = tonumber(self. musicTime[1]) * 60 + tonumber(self. musicTime[2])    --总秒数
    --local totalTime = 5
    --self.playEnd = false
    MgrTimer.Cancel("GalleryMusic")

    MgrTimer.AddDelayNoName(0.5,function()
        MgrTimer.AddRepeat("GalleryMusic",0.5,function()
            if MgrUI.GetCurUI().Uid == UID.ArtGallery_UI then
                self.musicPlayTime = self.musicPlayTime + 0.5
                --showT = string.format("%02i",self.musicPlayTime / 60) .. ":" .. string.format("%02i",self.musicPlayTime % 60)
                if math.modf(self.musicPlayTime / 60)<10 then
                    showT[1]="0"..math.modf(self.musicPlayTime / 60)
                else
                    showT[1]=math.modf(self.musicPlayTime / 60)
                end
                if math.modf(self.musicPlayTime % 60)<10 then
                    showT[3]="0"..math.modf(self.musicPlayTime % 60)
                else
                    showT[3]=math.modf(self.musicPlayTime % 60)
                end
                --showT = math.modf(self.musicPlayTime / 60)  .. ":" .. math.modf(self.musicPlayTime % 60)
                self.Text_Time2().text = table.concat(showT) .. "/" .. self. musicTime[1] .. ":" .. self. musicTime[2]
                self.MusicSlider().transform:GetComponent("Slider").value = self.musicPlayTime / totalTime
                if self.musicPlayTime > totalTime then
                    self.playEnd = true
                end
            end
        end,2 * totalTime + 1,nil)
    end,nil)
end
--改变播放列表
function M:ChangeMusicList(musicTable,mode,length)
    local orderList = {}
    local playingList = {}
    for i = 1, length, 1 do
        table.insert(orderList,musicTable[i])
    end
    if mode == self.MusicPlayStatus.Sequence  then
        return orderList        --返回顺序列表
    elseif mode == self.MusicPlayStatus.Single then
        if self.playingMusic ~= nil then
            table.insert(playingList,self.playingMusic)
            return playingList      --返回当前正在播放
        else
            table.insert(playingList,musicTable[1])
            return playingList
        end
    elseif mode == self.MusicPlayStatus.Random then
        local index = 1
        while #orderList ~= 0 do
            local ran = math.random(0,#orderList)
            if orderList[ran] ~= nil then
                playingList[index] = orderList[ran]
                table.remove(orderList,ran)
                index = index + 1
            end
        end
        return playingList      --返回乱序列表
    end
end
--更换播放模式(更新播放列表)
function M:MusicPlayModelChange()
    if self.MusicPlayStatus.CurrentStatus == self.MusicPlayStatus.Sequence then
        self.MusicPlayStatus.CurrentStatus = self.MusicPlayStatus.Single
        self.Sequence().gameObject:SetActive(false)
        self.Single().gameObject:SetActive(true)
        self.Random().gameObject:SetActive(false)
        self.playingList = self:ChangeMusicList(self.unLockedMusic,self.MusicPlayStatus.Single,#self.unLockedMusic)
    elseif self.MusicPlayStatus.CurrentStatus == self.MusicPlayStatus.Single then
        self.MusicPlayStatus.CurrentStatus = self.MusicPlayStatus.Random
        self.Sequence().gameObject:SetActive(false)
        self.Single().gameObject:SetActive(false)
        self.Random().gameObject:SetActive(true)
        self.playingList = self:ChangeMusicList(self.unLockedMusic,self.MusicPlayStatus.Random,#self.unLockedMusic)
    elseif self.MusicPlayStatus.CurrentStatus == self.MusicPlayStatus.Random then
        self.MusicPlayStatus.CurrentStatus = self.MusicPlayStatus.Sequence
        self.Sequence().gameObject:SetActive(true)
        self.Single().gameObject:SetActive(false)
        self.Random().gameObject:SetActive(false)
        self.playingList = self:ChangeMusicList(self.unLockedMusic,self.MusicPlayStatus.Sequence,#self.unLockedMusic)
    end
end
--结束播放所有音乐
function M:CancelAllMusic()
    MgrTimer.Reset()
    MgrSound.StopAll()
end
-----暂时废弃-------------
--根据播放模式判断下一首歌
function M:WhichIsNext()
    local nextMusic = nil
    if self.MusicPlayStatus.CurrentStatus == self.MusicPlayStatus.Sequence then
        nextMusic = self:PlaySequence()      --找下一首歌
    elseif self.MusicPlayStatus.CurrentStatus == self.MusicPlayStatus.Single then
        nextMusic = self:PlaySingle()
    elseif self.MusicPlayStatus.CurrentStatus == self.MusicPlayStatus.Random then
        nextMusic = self:PlayRandom()
    end
    return nextMusic
end
--列表循环
function M:PlaySequence()
    return self:NextMusic()
end
--单曲循环
function M:PlaySingle()
    return self.playingMusic
end
--随机循环
function M:PlayRandom()
    return self.unLockedMusic[math.random(1,#self.unLockedMusic)]
end

--------------------------------------------------动画相关-----------------------------------------------------
--打开动画面板
function M:OnClickAnimation()
    self.MusicMenu().gameObject:SetActive(false)
    self.AnimationMenu().gameObject:SetActive(true)
    self.IllustrationMenu().gameObject:SetActive(false)
    if MgrTimer.IsTimerExist("musicSwitch") then
        MgrTimer.Reset()
    end
end
--初始化动画面板
function M:InitAnimPanel()
    --隐藏
    self.Pauseicon().gameObject:SetActive(false)
    self.AnimMask().gameObject:SetActive(false)
    --下一段
    UIEvent.LuaClick(self.Btn_NextVideo().gameObject, Handle(self,function()
        self:PlayNextAnimation(self.currentAnim,true)
    end))
    --上一段
    UIEvent.LuaClick(self.Btn_LastVideo().gameObject, Handle(self,function()
        self:PlayNextAnimation(self.currentAnim,false)
    end))
    --返回上层
    UIEvent.LuaClick(self.Btn_AnimPanelReturnMainPanel().gameObject, Handle(self, function()
        self:EndAnim()
        ---打开按钮面板
        self.LeftPanel().gameObject:SetActive(true)
        self.AnimPanel().gameObject:SetActive(false)
    end))
    --返回主页
    UIEvent.LuaClick(self.Btn_AnimPanelRtnHome().gameObject, Handle(self, function()
        ---打开按钮面板
        self.LeftPanel().gameObject:SetActive(true)
        self:EndAnim()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    --点击屏幕暂停
    UIEvent.LuaClick(self.PauseButton().gameObject, Handle(self,function()
        self:PauseAnim()
        self.PauseButton().gameObject:SetActive(false)
        self.Pauseicon().gameObject:SetActive(true)
        self.AnimMask().gameObject:SetActive(true)
    end))
    --继续播放
    UIEvent.LuaClick(self.Pauseicon().gameObject,Handle(self,function()
        self:ContinuePlay()
        self.PauseButton().gameObject:SetActive(true)
        self.Pauseicon().gameObject:SetActive(false)
        self.AnimMask().gameObject:SetActive(false)
    end))
    --重播这段动画
    UIEvent.LuaClick(self.RePlayicon().gameObject,Handle(self,function ()
        self:Replay()
    end))

end
--重播这段动画
function M:Replay()
    self:EndAnim()
    self:PlayAnimation(self.currentAnim)
end
--播放下一段动画
function M:PlayNextAnimation(currentAnim,left)
    local nextAnim = nil
    if left then
        nextAnim = self:FindNextAnim(currentAnim)
    else
        nextAnim = self:FindLastAnim(currentAnim)
    end
    if nextAnim == nil then
        return
    end
    self:EndAnim()
    self.Pauseicon().gameObject:SetActive(false)
    self.RePlayicon().gameObject:SetActive(false)
    if nextAnim ~= nil then     --找到下一段播放
        self.currentAnim = nextAnim
        self:PlayAnimation(self.currentAnim)
    end
end
--寻找上一段动画
function M:FindLastAnim(currAnim)
    local max = 0
    for i = #self.unLockedAnim, 1, -1 do
        if self.unLockedAnim[i][2] == currAnim[2] and self.unLockedAnim[i][1] < currAnim[1] then       --同一组，并序号小1
            return self.unLockedAnim[i]
        end
    end
    for i = #self.unLockedAnim, 1, -1 do
        if self.unLockedAnim[i][7] > max then
            max = self.unLockedAnim[i][7]
        end
    end
    for i = #self.unLockedAnim, 1, -1 do
        if self.unLockedAnim[i][2] == currAnim[2] and self.unLockedAnim[i][7] == max  then
            return self.unLockedAnim[i]
        end
    end
end
--寻找下一段动画
function M:FindNextAnim(currAnim)
    local min = currAnim[1]
    for i = 1, #self.unLockedAnim, 1 do
        if self.unLockedAnim[i][2] == currAnim[2] and self.unLockedAnim[i][1] > currAnim[1] then       --同一组，并序号大1
            return self.unLockedAnim[i]
        end
    end
    for i = 1, #self.unLockedAnim, 1 do
        if self.unLockedAnim[i][7] < min then
            min = self.unLockedAnim[i][7]
        end
    end
    for i = 1, #self.unLockedAnim, 1 do
        if self.unLockedAnim[i][2] == currAnim[2] and self.unLockedAnim[i][7] == min then
            return self.unLockedAnim[i]
        end
    end
end
--播放动画
function M:PlayAnimation(anim)
    ---隐藏按钮面板
    self.LeftPanel().gameObject:SetActive(false)
    self.Pauseicon().gameObject:SetActive(false)
    self.RePlayicon().gameObject:SetActive(false)
    ---清除战斗闲置音频
    MgrSound.ClearFight()
    ---停播所有BGM
    MgrSound.StopAll()
    --打开和隐藏UI
    self.currentAnim = anim
    self.Btn_NextVideo().gameObject:SetActive(false)
    self.Btn_LastVideo().gameObject:SetActive(false)
    self.PauseButton().gameObject:SetActive(true)
    self.RePlayicon().gameObject:SetActive(false)
    self.AnimPanel().gameObject:SetActive(true)
    self.AnimMask().gameObject:SetActive(false)
    --播放动画
    --创建一个动画面板
    local newAnimPanel = GameObject.Instantiate(self.BG_Anim().gameObject,self.BG_AnimRoot().transform,false)
    newAnimPanel.transform.name = "animPanel"
    local criUI = newAnimPanel.transform:GetComponent("CriManaMovieControllerForUI")   --加载movie组件

    criUI.player:SetFile(nil,MgrRes.GetABPath("USM/plot/".. anim[4] ..".usm"))
    --criUI:Play()
    criUI.player:Start()
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "PlayEnd" then    --播放完
            self.Btn_NextVideo().gameObject:SetActive(true)
            self.Btn_LastVideo().gameObject:SetActive(true)
            self.AnimMask().gameObject:SetActive(true)
            self.RePlayicon().gameObject:SetActive(true)
            self.PauseButton().gameObject:SetActive(false)
            self.Pauseicon().gameObject:SetActive(false)
            criUI.player.statusChangeCallback = nil     --置空
        end
    end
end
--暂停播放
function M:PauseAnim()
    local criUI = self.BG_AnimRoot().transform:Find("animPanel"):GetComponent("CriManaMovieControllerForUI")
    criUI:Pause(true)
    self.Btn_NextVideo().gameObject:SetActive(true)
    self.Btn_LastVideo().gameObject:SetActive(true)
end
--从暂停处开始播放
function M:ContinuePlay()
    local criUI = self.BG_AnimRoot().transform:Find("animPanel"):GetComponent("CriManaMovieControllerForUI")
    criUI:Pause(false)
    self.Btn_NextVideo().gameObject:SetActive(false)
    self.Btn_LastVideo().gameObject:SetActive(false)
end
--结束播放
function M:EndAnim()
    GameObject.Destroy(self.BG_AnimRoot().transform:Find("animPanel").gameObject)
end
--初始化动/插画章节选择
function M:InitChapterSelect(animOrNot)
    if animOrNot then   --是动画
        self:AnimChapterSelect()
    else                --是插画
        self:IllustrationChapterSelect()
    end
end
--动画章节选择器
function M:AnimChapterSelect()
    --打开预制体
    self.ChapterPrefab().gameObject:SetActive(true)
    --保存所有动画章节的下拉菜单选项
    self.AnimChaptersTogglesGroup = self:CreateChapterToggle(self.animChapters,self.ChapterPrefab().gameObject,self.ChapterGroup().transform,Handle(self,function(self,index,isOn)
        --回调函数逻辑
        if isOn then
            --激活选中的章节
            self:NewResetAnimView(index)
            --将自身改为选中状态，其他选项改为未选中状态
            self:ChangeAnimSelectedStatus(index)
            --上方下拉菜单章节名字修改成对应的名字
            self.AnimFilterBtnText().text = self.animChapters[index]
            --下拉框弹回
            self.Btn_SelectAnimChapter01().isOn = false
        end
    end))
    --开关遮罩
    UIEvent.LuaClick(self.Btn_AnimFilterCloser().gameObject, function()
        self.Btn_SelectAnimChapter01().isOn = false
    end)
    --筛选器动画
    Tools.ToggleValueChange(self.Btn_SelectAnimChapter01(),function(isOn)
        --小箭头旋转
        self.Btn_SelectAnimChapter01().transform:Find("Btn_DropDown").gameObject:SetActive(not isOn)
        self.Btn_SelectAnimChapter01().transform:Find("Btn_DropUP").gameObject:SetActive(isOn)
        self.Btn_AnimFilterCloser().gameObject:SetActive(isOn)
        local y = isOn and 0 or 340
        Global.DoMoveY(self.SelectListMask1().gameObject,y,0.3)    --面板上下移动
    end,nil)
    --关闭预制体
    self.ChapterPrefab().gameObject:SetActive(false)
    --默认关闭筛选
    self.Btn_SelectAnimChapter01().isOn = false
    --默认激活第一章
    self:ChangeAnimSelectedStatus(1)
end
--更改动画选中状态
function M:ChangeAnimSelectedStatus(index)
    for i,v in pairs(self.AnimChaptersTogglesGroup) do
        if i == index then
            self.AnimChaptersTogglesGroup[i].transform:Find("back").gameObject:SetActive(true)
        else
            self.AnimChaptersTogglesGroup[i].transform:Find("back").gameObject:SetActive(false)
        end
    end
end
--动画章节刷新
--[[
function M:ResetAnimView(chapterNum)
    --激活对应章节面板
    local rightOne = nil
    for i = 1, 4, 1 do
        if i == chapterNum then
            rightOne = self.AnimationScrollViewRoot().transform:Find("AnimationScrollView" .. i)
            rightOne.gameObject:SetActive(true)
        else
            rightOne.gameObject:SetActive(false)
        end
    end
    --位置置为0
    rightOne.transform.localPosition = Vector3(0,0,0)
end]]
--创建所有标签
function M:CreateChapterToggle(filters,prefab,parentTrans,callback)     --所有选项名字/选项预制件/选项的父物体/回调函数
    local toggles = {}
    for i, name in ipairs(filters) do
        local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform     --创建toggle
        --为标签注入回调函数
        togTrans:GetComponent("UITemplate"):SetData({name,function(...)
            callback(i,...)       --进去的是 i 和 isOn，参数从ChapterPrefab中传入
        end})
        --集合所有toggles
        toggles[i] = togTrans:GetComponent("Toggle")
    end
    return toggles
end

----------------------------------------新动画相关函数------------------------------------
--新初始化动画函数
function M:NewInitAnimMenu()
    self:NewAnimChapterPanel(1)
    self.AnimationMenu().gameObject:SetActive(false)
    --初始化动画章节筛选器
    self:InitChapterSelect(true)
    --更新已收集动画数量
    --self:CollectedIllustration()
end
--创建新动画章节面板
function M:NewAnimChapterPanel(chapterNum)
    --章节筛选器(以"其它"作为结尾)
    self.animChapters = {MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter1"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter2"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter3"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter4"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter5")}
    local anim = IllustrationViewModel.AnimationData
    -- ---下载已解锁的动画
    -- local list = {}
    -- for i = 1, #anim do
    --     local path = string.gsub("ABOriginal/Plot/PlotAssets/Usm/"..anim[i][4]..".usm"," ","_")
    --     list[path] = 0
    -- end
    -- MgrHot.UpdatePackage(MgrHot.Analyse(list),function()
    -- end)

    if chapterNum == #self.animChapters then
        chapterNum = 0
    end
    local singleAnim
    for i = 1, #anim do
        if anim[i][2] == chapterNum then
            singleAnim = GameObject.Instantiate(self.Animation().gameObject,self.ContentOfAnimation().transform,false)
            if StormControl.CheckPointLock(anim[i][5]) or anim[i][2] == 0 then    --是否被锁
                table.insert(self.unLockedAnim,anim[i])
                MgrRes.LoadSprite(singleAnim.transform:Find("Img_Animationdi"):GetComponent("Image"),"ArtGallery/AnimPicture256/"..anim[i][3])
                singleAnim.transform:Find("Img_LockedPicture").gameObject:SetActive(false)
                singleAnim.transform:Find("Img_Locked").gameObject:SetActive(false)
                UIEvent.LuaClick(singleAnim, Handle(self,function()
                    --设置当前动画
                    self.currentAnim = anim[i]
                    --播放动画
                    self:PlayAnimation(self.currentAnim)
                end))
                singleAnim.transform:Find("Text_AnimationName"):GetComponent("TextMeshProUGUI").text = anim[i][6]     --动画名字
            else
                singleAnim.transform:Find("Img_LockedPicture").gameObject:SetActive(true)
                singleAnim.transform:Find("Img_Locked").gameObject:SetActive(true)
                singleAnim.transform:Find("Text_AnimationName"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("artgallery_ui_lock")
            end
            singleAnim:SetActive(true)
        end
    end
end
--删除原有的动画
function M:ClearOldAnim()
    local count = self.ContentOfAnimation().transform.childCount
    if count == 0 then
        return
    else
        for i = 0, count - 1 do
            GameObject.Destroy(self.ContentOfAnimation().transform:GetChild(i).gameObject)
        end
    end
end
--动画章节刷新
function M:NewResetAnimView(chapterNum)
    self:ClearOldAnim()
    self:NewAnimChapterPanel(chapterNum)
    --位置置为0
    self.ContentOfAnimation().transform.localPosition = Vector3(0,0,0)
end
----------------------------------------插画相关-----------------------------------------
--打开插画面板
function M:OnClickIllustration()
    self.MusicMenu().gameObject:SetActive(false)
    self.AnimationMenu().gameObject:SetActive(false)
    self.IllustrationMenu().gameObject:SetActive(true)
    if MgrTimer.IsTimerExist("musicSwitch") then
        MgrTimer.Reset()
    end
end
--插画章节选择器初始化
function M:IllustrationChapterSelect()
    --打开预制体
    self.IllustrationChapterPrefab().gameObject:SetActive(true)
    self.IllustrationChaptersTogglesGroup = self:CreateChapterToggle(self.illustrationChapters,self.IllustrationChapterPrefab().gameObject,self.IllustrationChapterGroup().transform,Handle(self,function(self,index,isOn)
        --回调函数逻辑
        if isOn then
            --刷新成选中的章节
            self:NewResetIllustrationView(index)
            --将自身改为选中状态，其他选项改为未选中状态
            self:ChangeIllustrationSelectedStatus(index)
            --上方下拉菜单章节名字修改
            self.IllustrationFilterBtnText().text = self.illustrationChapters[index]
            --下拉框弹回
            self.Btn_SelectIllustrationChapter01().isOn = false
        end
    end))
    --开关遮罩
    UIEvent.LuaClick(self.Btn_IllustrationFilterCloser().gameObject, function()
        self.Btn_SelectIllustrationChapter01().isOn = false
    end)
    --筛选器动画
    Tools.ToggleValueChange(self.Btn_SelectIllustrationChapter01(),function(isOn)
        --小箭头调转方向
        self.Btn_SelectIllustrationChapter01().transform:Find("Btn_DropDown").gameObject:SetActive(not isOn)
        self.Btn_SelectIllustrationChapter01().transform:Find("Btn_DropUP").gameObject:SetActive(isOn)

        self.Btn_IllustrationFilterCloser().gameObject:SetActive(isOn)
        local y = isOn and 0 or 340
        Global.DoMoveY(self.SelectListMask().gameObject,y,0.3)    --面板上下移动
    end,nil)
    --关闭预制体
    self.IllustrationChapterPrefab().gameObject:SetActive(false)
    --默认关闭筛选
    self.Btn_SelectIllustrationChapter01().isOn = false
    --默认激活第一章
    self:ChangeIllustrationSelectedStatus(1)
end
--更改插画选中状态
function M:ChangeIllustrationSelectedStatus(index)
    for i,v in pairs(self.IllustrationChaptersTogglesGroup) do
        if i == index then
            self.IllustrationChaptersTogglesGroup[i].transform:Find("back").gameObject:SetActive(true)
        else
            self.IllustrationChaptersTogglesGroup[i].transform:Find("back").gameObject:SetActive(false)
        end
    end
end
--插画章节刷新
--获得整组插图数据
function M:GetSameType(firstImage)
    local sameGroup = {}
    for i = 1, #IllustrationViewModel.IllustrationData, 1 do
        if firstImage[3] == IllustrationViewModel.IllustrationData[i][3]  then      --找到与第一张图同类型的图
            table.insert(sameGroup,IllustrationViewModel.IllustrationData[i])
        end
    end
    return sameGroup
end
--清理所有已有照片
--[[
function M:CleanAllIllustration()
    for i = 1, #self.existIllustration, 1 do
        --GameObject.Destroy(self.existIllustration[i])
    end
    self.existIllustration = {}
end]]
--初始化CGPanel按钮
function M:InitCGPanelButton()
    UIEvent.LuaClick(self.Btn_CGPanelReturnMainPanel().gameObject,Handle(self,function()
        self.CGPanel().gameObject:SetActive(false)
        ---打开按钮面板
        self.LeftPanel().gameObject:SetActive(true)
    end))
    UIEvent.LuaClick(self.Btn_CGPanelRtnHome().gameObject,Handle(self,function()
        ---打开按钮面板
        self.LeftPanel().gameObject:SetActive(true)
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    UIEvent.LuaClick(self.Btn_HideCGUI().gameObject,Handle(self,function()
        self.CGFenchadi().gameObject:SetActive(false)
        self.Btn_NextIllustration().gameObject:SetActive(false)
        self.Btn_LastIllustration().gameObject:SetActive(false)
        self.CGFencha().gameObject:SetActive(false)
        self.Btn_HideCGUI().gameObject:SetActive(false)
        self.Btn_CGPanelReturnMainPanel().gameObject:SetActive(false)
        self.Btn_CGPanelRtnHome().gameObject:SetActive(false)
        self.ShowCGUI().gameObject:SetActive(true)

    end))
    UIEvent.LuaClick(self.ShowCGUI().gameObject,Handle(self,function()
        self.CGFenchadi().gameObject:SetActive(true)
        self.Btn_NextIllustration().gameObject:SetActive(true)
        self.Btn_LastIllustration().gameObject:SetActive(true)
        self.CGFencha().gameObject:SetActive(true)
        self.Btn_HideCGUI().gameObject:SetActive(true)
        self.Btn_CGPanelReturnMainPanel().gameObject:SetActive(true)
        self.Btn_CGPanelRtnHome().gameObject:SetActive(true)
        self.ShowCGUI().gameObject:SetActive(false)
    end))
    UIEvent.LuaClick(self.Btn_LastIllustration().gameObject,Handle(self,function()
        local cg = self:FindLastIllustrationGroup(self.OpenedCG)
        if cg ~= nil then
            self.numIllustrationInGroup = 1
            --得到上一组第一张的数据
            self.OpenedCG = cg
            self.OpenedCGGroup = self:GetSameType(cg)    --得到数据
            self:ShowIllustration(cg)    --创建图片物体
            self:UpdateFencha(cg,self.OpenedCGGroup)     --更新分差
            --self:ClickDelay()
        end
    end))
    UIEvent.LuaClick(self.Btn_NextIllustration().gameObject,Handle(self,function()
        local cg = self:FindNextIllustrationGroup(self.OpenedCG)
        if cg ~= nil then
            self.numIllustrationInGroup = 1
            --得到下一组第一张的数据
            self.OpenedCG = cg
            self.OpenedCGGroup = self:GetSameType(cg)        --得到数据
            self:ShowIllustration(cg)        --创建图片物体
            self:UpdateFencha(cg,self.OpenedCGGroup)     --更新分差
            --self:ClickDelay()
        end
    end))
    UIEvent.LuaClick(self.CG_Arrow_Left().gameObject,Handle(self,function()
        for i = 1, #self.OpenedCGGroup, 1 do
            if self.OpenedCGGroup[i][4] == self.OpenedCG[4] - 1 then    --组内上一张
                self.OpenedCG = self.OpenedCGGroup[i]
                self:UpdateFencha(self.OpenedCG,self.OpenedCGGroup)
                for j = 1, #self.OpenedCGGroup do
                    if j == self.OpenedCG[4] then
                        if self.OpenedCGGroup[i][6] ~= 0 then
                            MgrRes.LoadPlotSprite(self.BG_Illustration(),MgrRes.PlotResPrefix..self.OpenedCGGroup[i][5],nil,true)
                        else
                            MgrRes.LoadPlotSprite(self.BG_Illustration(),MgrRes.PlotResPrefix..self.OpenedCGGroup[i][5],nil,false)
                        end
                    end
                end
                break
            end
        end
    end))
    UIEvent.LuaClick(self.CG_Arrow_Right().gameObject,Handle(self,function()
        for i = 1, #self.OpenedCGGroup, 1 do
            if self.OpenedCGGroup[i][4] == self.OpenedCG[4] + 1 then    --组内下一张
                self.OpenedCG = self.OpenedCGGroup[i]
                self:UpdateFencha(self.OpenedCG,self.OpenedCGGroup)
                for j = 1, #self.OpenedCGGroup do
                    if j == self.OpenedCG[4] then
                        if self.OpenedCGGroup[i][6] ~= 0 then
                            MgrRes.LoadPlotSprite(self.BG_Illustration(),MgrRes.PlotResPrefix..self.OpenedCGGroup[i][5],nil,true)
                        else
                            MgrRes.LoadPlotSprite(self.BG_Illustration(),MgrRes.PlotResPrefix..self.OpenedCGGroup[i][5],nil,false)
                        end
                    end
                end
                break
            end
        end
    end))
end
--增加CGPanel点击延迟
function M:ClickDelay()
    self.Btn_NextIllustration():GetComponent("Image").raycastTarget = false
    self.Btn_LastIllustration():GetComponent("Image").raycastTarget = false
    MgrTimer.AddDelay("clickDelay",1,function()
        self.Btn_NextIllustration():GetComponent("Image").raycastTarget = true
        self.Btn_LastIllustration():GetComponent("Image").raycastTarget = true
    end,nil)
end
--找下一组插图
function M:FindNextIllustrationGroup(openedCG)
    local min = openedCG[3]        --组ID
    for i = 1, #self.unLockedIllustration, 1 do
        if self.unLockedIllustration[i][2] == openedCG[2] and self.unLockedIllustration[i][3] > openedCG[3] and self.unLockedIllustration[i][4] == 1 then   --同组/类型ID更大/组第一张
            return self.unLockedIllustration[i]     --返回下一组第一张
        end
    end
    for i = 1, #self.unLockedIllustration, 1 do
        if self.unLockedIllustration[i][3] < min then
            min = self.unLockedIllustration[i][3]
        end
    end
    for i = 1, #self.unLockedIllustration, 1 do
        if self.unLockedIllustration[i][2] == openedCG[2] and self.unLockedIllustration[i][3] == min and self.unLockedIllustration[i][4] == 1 then   --返回第一章
            return self.unLockedIllustration[i]
        end
    end
end
--找上一组插图
function M:FindLastIllustrationGroup(openedCG)
    local max = 0
    for i = #self.unLockedIllustration, 1, -1 do
        if self.unLockedIllustration[i][2] == openedCG[2] and self.unLockedIllustration[i][3] < openedCG[3] and self.unLockedIllustration[i][4] == 1 then
            return self.unLockedIllustration[i]
        end
    end
    for i = #self.unLockedIllustration, 1, -1 do
        if self.unLockedIllustration[i][3] > max then
            max = self.unLockedIllustration[i][3]
        end
    end
    for i = #self.unLockedIllustration, 1, -1 do
        if self.unLockedIllustration[i][2] == openedCG[2] and self.unLockedIllustration[i][3] == max and self.unLockedIllustration[i][4] == 1 then   --返回最后一章
            return self.unLockedIllustration[i]
        end
    end
end
--CGPanel分差更新
function M:UpdateFencha(currentCG,currentCGGroup)
    self.Text_FenchaNumber().transform:GetComponent("TextMeshProUGUI").text = "<color=#FFB900>" .. currentCG[4] .. "</color>/" .. #currentCGGroup
end
--更新已收集插画数量
function M:CollectedIllustration()
    --所有数量
    local all = #CgdexLocalData.tab
    local unLocked = 0
    for i,v in ipairs(CgdexLocalData.tab) do
        if StormControl.CheckPointLock(v[6])  then
            unLocked = unLocked + 1
        end
    end
    self.Text_collectionCount().transform:GetComponent("TextMeshProUGUI").text = "<color=#FFB900>" .. unLocked .."</color>/" .. all
end
--------------------新插画相关函数------------------
--新CGPanel展示插图
function M:ShowIllustration(firstImage)
    self.OpenedCG = firstImage
    ---隐藏按钮面板
    self.LeftPanel().gameObject:SetActive(false)
    local image = self.BG_Illustration()
    for i, v in ipairs(IllustrationViewModel.IllustrationData) do   --显示第一张图片
        if v[3] == firstImage[3] then
            if v[6] ~= 0 then
                MgrRes.LoadPlotSprite(image,MgrRes.PlotResPrefix..v[5],function()
                    if Tools.GetScreenWight() > 1920 then
                        image.transform.localScale = image.transform.localScale * (Tools.GetScreenWight() / image:GetComponent("RectTransform").rect.width)
                    end
                end,true)
            else
                MgrRes.LoadPlotSprite(image,MgrRes.PlotResPrefix..v[5],function()
                    if Tools.GetScreenWight() > 1920 then
                        image.transform.localScale = image.transform.localScale * (Tools.GetScreenWight() / image:GetComponent("RectTransform").rect.width)
                    end
                end,true)
            end
            break
        end
    end
    self.CGPanel().gameObject:SetActive(true)
end
--新初始化插画函数
function M:NewInitIllustrationMenu()
    self:NewIllstrationChapterPanel(1)
    self.IllustrationMenu().gameObject:SetActive(false)
    --初始化插画章节筛选器
    self:InitChapterSelect(false)
    --更新已收集插画数量
    self:CollectedIllustration()
end
--创建新插画章节面板
function M:NewIllstrationChapterPanel(chapterNum)   --参数：章节序号
    --章节筛选器(以"其它"作为结尾)
    self.illustrationChapters = {MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter1"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter2"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter3"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter4"),MgrLanguageData.GetLanguageByKey("artgallery_ui_chapter5")}
    local chapter = chapterNum
    --取出章节对应数据
    local illustration = IllustrationViewModel.IllustrationData
    if chapter == #self.illustrationChapters then
        chapter = 0
    end
    local singleIllustration = nil
    for i = 1, #illustration do
        if illustration[i][2] == chapter and illustration[i][4] == 1 then
            singleIllustration = GameObject.Instantiate(self.Illustration().gameObject,self.ContentOfIllustration().transform,false)
            if StormControl.CheckPointPass(illustration[i][6])  then
                table.insert(self.unLockedIllustration,illustration[i])
                MgrRes.LoadSprite(singleIllustration.transform:Find("Img_Illustrationdi"):GetComponent("Image"),"ArtGallery/Illustration256/"..illustration[i][8])
                singleIllustration.transform:Find("Img_LockedIllustration").gameObject:SetActive(false)
                singleIllustration.transform:Find("Img_Locked").gameObject:SetActive(false)
                UIEvent.LuaClick(singleIllustration.gameObject, Handle(self,function()
                    self:ShowIllustration(illustration[i])
                    self.OpenedCGGroup = self:GetSameType(illustration[i])
                    self:UpdateFencha(self.OpenedCG,self.OpenedCGGroup)
                end))
                --if illustration[i][3] < 10 then
                --    singleIllustration.transform:Find("Text_IllustrationName"):GetComponent("TextMeshProUGUI").text = "00" .. illustration[i][3] .. "  " .. illustration[i][7]   --插画名字
                --elseif illustration[i][3] < 100 then
                --    singleIllustration.transform:Find("Text_IllustrationName"):GetComponent("TextMeshProUGUI").text = "0" .. illustration[i][3] .. "  " .. illustration[i][7]   --插画名字
                --else
                --    singleIllustration.transform:Find("Text_IllustrationName"):GetComponent("TextMeshProUGUI").text = illustration[i][3] .. "  " .. illustration[i][7]   --插画名字
                --end
                singleIllustration.transform:Find("Text_IllustrationName"):GetComponent("TextMeshProUGUI").text = illustration[i][7]   --插画名字
            else
                singleIllustration.transform:Find("Img_LockedIllustration").gameObject:SetActive(true)
                singleIllustration.transform:Find("Img_Locked").gameObject:SetActive(true)
                singleIllustration.transform:Find("Text_IllustrationName"):GetComponent("TextMeshProUGUI").text = "未解锁"  --插画名字
            end
            singleIllustration:SetActive(true)      --展示插画
        end
    end
end
--删除原有的插画
function M:ClearOldIllustration()
    local count = self.ContentOfIllustration().transform.childCount
    if count == 0 then
        return
    else
        for i = 0, count - 1 do
            GameObject.Destroy(self.ContentOfIllustration().transform:GetChild(i).gameObject)
        end
    end
end
--插画章节刷新
function M:NewResetIllustrationView(chapterNum)
    self:ClearOldIllustration()
    self:NewIllstrationChapterPanel(chapterNum)
    --位置置为0
    self.ContentOfIllustration().transform.localPosition = Vector3(0,0,0)
end

return M