-- Code Auto Create Begin
local M = Class('Battle02_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Battle02_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Battle02_UI].prefab'
    self.Name = 'Form[Battle02_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'AbtBuffIcon','AbtBuffIcon',2},{'Img','AbtBuffIcon/Img',2},{'UI_update','Panel_Fighting/UI_update',2},{'Img_Xian7(1)','Panel_Fighting/UI_update/Img_Xian7 (1)',2},{'Img_sanjiao','Panel_Fighting/UI_update/Img_sanjiao',2},{'Img_Xian7(2)','Panel_Fighting/UI_update/Img_Xian7 (2)',2},{'Img_Xian7','Panel_Fighting/UI_update/Img_Xian7',2},{'Img_Bian2','Panel_Fighting/UI_update/round/Img_Bian2',2},{'SkillName_Drawing','Panel_Fighting/UI_update/SkillName_Drawing',2},{'SkillName_BgB','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgB',2},{'SkillName_BgW','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgB/SkillName_BgW',2},{'SkillName_Frame_Blue','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgB/SkillName_Frame_Blue',2},{'SkillName_BgR','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgR',2},{'SkillName_BgW01','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgR/SkillName_BgW',2},{'SkillName_Frame_Red','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgR/SkillName_Frame_Red',2},{'ImageBgRight','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/ImageBgRight',2},{'ImageBgLeft','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/ImageBgLeft',2},{'HeadMask_Sow','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask_Sow',2},{'ImageHeadIcon','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask',2},{'ImageBgRight01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/ImageBgRight',2},{'ImageBgLeft01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/ImageBgLeft',2},{'HeadMask_Sow01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask_Sow',2},{'ImageHeadIcon01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask',2},{'ImageBgRight02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/ImageBgRight',2},{'ImageBgLeft02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/ImageBgLeft',2},{'HeadMask_Sow02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask_Sow',2},{'ImageHeadIcon02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask',2},{'ImageBgRight03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/ImageBgRight',2},{'ImageBgLeft03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/ImageBgLeft',2},{'HeadMask_Sow03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask_Sow',2},{'ImageHeadIcon03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask',2},{'ImageBgRight04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/ImageBgRight',2},{'ImageBgLeft04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/ImageBgLeft',2},{'HeadMask_Sow04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask_Sow',2},{'ImageHeadIcon04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask',2},{'ImageBgRight05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/ImageBgRight',2},{'ImageBgLeft05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/ImageBgLeft',2},{'HeadMask_Sow05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask_Sow',2},{'ImageHeadIcon05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask',2},{'ImageBgRight06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/ImageBgRight',2},{'ImageBgLeft06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/ImageBgLeft',2},{'HeadMask_Sow06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask_Sow',2},{'ImageHeadIcon06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask',2},{'ImageBgRight07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/ImageBgRight',2},{'ImageBgLeft07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/ImageBgLeft',2},{'HeadMask_Sow07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask_Sow',2},{'ImageHeadIcon07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask',2},{'Panel_Round','Panel_Fighting/UI_update/Panel_Root/Panel_Round',2},{'Img_Round','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round',2},{'roundDI','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/roundDI',2},{'Img_Roundxian','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Img_Roundxian',2},{'Panel_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start',2},{'Img_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start',2},{'Img_Startxian1','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startxian1',2},{'Img_Startxian2','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startxian2',2},{'Img_Startdian','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startdian',2},{'Img_Startdi','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startdi',2},{'Img_Beisudi','Panel_Fighting/Btn_Speed/Img_Beisudi',2},{'Img_Beisutiao','Panel_Fighting/Btn_Speed/Img_Beisutiao',2},{'Img_Speedx1','Panel_Fighting/Btn_Speed/Img_Speedx1',2},{'Img_Speedx2','Panel_Fighting/Btn_Speed/Img_Speedx2',2},{'Img_Speedx3','Panel_Fighting/Btn_Speed/Img_Speedx3',2},{'Btn_Pause','Panel_Fighting/Btn_Pause',2},{'BlackBG','Panel_Fighting/EXHead/BlackBG',2},{'LineUp','Panel_Fighting/EXHead/LineUp',2},{'white','Panel_Fighting/EXHead/white',2},{'Panel_Select','Panel_Ready/Panel_Select',2},{'Img_Rormationdi','Panel_Ready/Panel_Select/Btn_Qiehuan/Img_Rormationdi',2},{'Rormationicon','Panel_Ready/Panel_Select/Btn_Qiehuan/Rormationicon',2},{'Img_Huangtiao','Panel_Ready/Panel_Select/Img_Huangtiao',2},{'LineupBtns','Panel_Ready/Panel_Select/LineupBtns',2},{'Img_Rormationdi01','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Img_Rormationdi',2},{'Rormationicon01','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Rormationicon',2},{'Img_Rormationdi02','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation/Img_Rormationdi',2},{'Rormationicon02','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation/Rormationicon',2},{'Img_Removedi','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Img_Removedi',2},{'Removeicon','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Removeicon',2},{'Removeicon01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove/Removeicon',2},{'Img_Removedi01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove/Img_Removedi',2},{'OrderBtns','Panel_Ready/Panel_Select/OrderBtns',2},{'Img_Rormationdi03','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether/Img_Rormationdi',2},{'Altogethericon','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether/Altogethericon',2},{'Img_Rormationdi04','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H/Img_Rormationdi',2},{'Altogethericon01','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H/Altogethericon',2},{'Img_Removedi02','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate/Img_Removedi',2},{'Separateicon','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate/Separateicon',2},{'Img_Removedi03','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H/Img_Removedi',2},{'Separateicon01','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H/Separateicon',2},{'Panel_Select2','Panel_Ready/Panel_Select2',2},{'HpDisplayBtns','Panel_Ready/Panel_Select2/HpDisplayBtns',2},{'Img_Removedi04','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay/Img_Removedi',2},{'Separateicon02','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay/Separateicon',2},{'Img_Removedi05','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay_H/Img_Removedi',2},{'Separateicon03','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay_H/Separateicon',2},{'Img_Tanchuangdi(xia)','Panel_Ready/Panel_Room/Img_Tanchuangdi(xia)',2},{'LoopScrollRole','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',2},{'ScrollMask','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask',2},{'Image','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask/Image',2},{'RoleType','Panel_Ready/Panel_Room/Panel_Replace/RoleType',2},{'Btn_ShowRole','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_ShowRole',2},{'Btn_FriendRole','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_FriendRole',2},{'Img_supportType','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Img_supportType',2},{'Img_HighLight','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Img_supportType/Img_HighLight',2},{'Img_HighLight2','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Img_supportType/Img_HighLight2',2},{'Img_SupportLock','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Img_supportType/FriendRole/Img_SupportLock',2},{'Img_OpenFilterdi','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Img_OpenFilterdi',2},{'Pailieicon','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Pailieicon',2},{'Img_di','Panel_Ready/Panel_Room/Panel_Replace/Btn_Chongzhizhuangtai/Img_di',2},{'ChongzhiIcon','Panel_Ready/Panel_Room/Panel_Replace/Btn_Chongzhizhuangtai/ChongzhiIcon',2},{'Img_Tips','Panel_Ready/Panel_Room/Img_Tips',2},{'Img_TishiBian','Panel_Ready/Panel_Room/Img_Tips/Img_TishiBian',2},{'Duiyuanicon','Panel_Ready/Panel_Room/Img_Tips/Duiyuanicon',2},{'Btn_Jintouqiehuan','Panel_Ready/Btn_Jintouqiehuan',2},{'GudingJingtouicon','Panel_Ready/Btn_Jintouqiehuan/GudingJingtouicon',2},{'ZiyouJingtouicon','Panel_Ready/Btn_Jintouqiehuan/ZiyouJingtouicon',2},{'Btn_EX','Panel_Ready/Btn_EX',2},{'Btn_Group','Panel_Ready/Btn_Group',2},{'Btn_SecondWar','Panel_Ready/Btn_Group/Btn_SecondWar',2},{'Btn_Guankaxinxi','Panel_Ready/Btn_Group/Btn_Guankaxinxi',2},{'Btn_BossInfo','Panel_Ready/Btn_Group/Btn_BossInfo',2},{'Btn_BanSkill','Panel_Ready/Btn_Group/Btn_BanSkill',2},{'Btn_Buff','Panel_Ready/Btn_Group/Btn_Buff',2},{'Img_Zuozhankaishidi','Panel_Ready/Btn_StartFight/Img_Zuozhankaishidi',2},{'Img_Zuozhankaishi_CN','Panel_Ready/Btn_StartFight/Img_Zuozhankaishi_CN',2},{'Img_Tilixiaohaodi','Panel_Ready/Btn_StartFight/Img_Tilixiaohaodi',2},{'Img_Tiliicon','Panel_Ready/Btn_StartFight/Text_PowerConsume/Img_Tiliicon',2},{'Btn_Back','Panel_Ready/Btn_Back',2},{'Btn_HideRoleInfo','Panel_RoleInfo/Btn_HideRoleInfo',2},{'Img_Tanchuangdi(shang)','Panel_RoleInfo/Img_Tanchuangdi(shang)',2},{'Img_xian1','Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian1',2},{'Img_xian2','Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian2',2},{'Img_Chakandi','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan/Img_Chakandi',2},{'ChakanIcon','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan/ChakanIcon',2},{'Img_Lihuidi','Panel_RoleInfo/RoleHead/Img_Lihuidi',2},{'Icon_RIHead','Panel_RoleInfo/RoleHead/Icon_RIHead',2},{'Icon_RIFrame','Panel_RoleInfo/RoleHead/Icon_RIFrame',2},{'Icon_RICareer','Panel_RoleInfo/RoleHead/Icon_RICareer',2},{'RIStar_1','Panel_RoleInfo/RoleHead/StarContent/RIStar_1',2},{'Normal','Panel_RoleInfo/RoleHead/StarContent/RIStar_1/Normal',2},{'HighLight','Panel_RoleInfo/RoleHead/StarContent/RIStar_1/HighLight',2},{'RIStar_2','Panel_RoleInfo/RoleHead/StarContent/RIStar_2',2},{'Normal01','Panel_RoleInfo/RoleHead/StarContent/RIStar_2/Normal',2},{'HighLight01','Panel_RoleInfo/RoleHead/StarContent/RIStar_2/HighLight',2},{'RIStar_3','Panel_RoleInfo/RoleHead/StarContent/RIStar_3',2},{'Normal02','Panel_RoleInfo/RoleHead/StarContent/RIStar_3/Normal',2},{'HighLight02','Panel_RoleInfo/RoleHead/StarContent/RIStar_3/HighLight',2},{'RIStar_4','Panel_RoleInfo/RoleHead/StarContent/RIStar_4',2},{'Normal03','Panel_RoleInfo/RoleHead/StarContent/RIStar_4/Normal',2},{'HighLight03','Panel_RoleInfo/RoleHead/StarContent/RIStar_4/HighLight',2},{'RIStar_5','Panel_RoleInfo/RoleHead/StarContent/RIStar_5',2},{'Normal04','Panel_RoleInfo/RoleHead/StarContent/RIStar_5/Normal',2},{'HighLight04','Panel_RoleInfo/RoleHead/StarContent/RIStar_5/HighLight',2},{'RIStar_6','Panel_RoleInfo/RoleHead/StarContent/RIStar_6',2},{'Normal05','Panel_RoleInfo/RoleHead/StarContent/RIStar_6/Normal',2},{'HighLight05','Panel_RoleInfo/RoleHead/StarContent/RIStar_6/HighLight',2},{'RIAwaken','Panel_RoleInfo/RoleHead/StarContent/RIAwaken',2},{'Super','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super',2},{'Super1','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super1',2},{'Super2','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super2',2},{'Super3','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super3',2},{'Super4','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super4',2},{'Super5','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super5',2},{'Icon_Rankdi','Panel_RoleInfo/RoleHead/Icon_Rankdi',2},{'Fanwei','Panel_RoleInfo/Fanwei',2},{'Mubiao','Panel_RoleInfo/Mubiao',2},{'Hp','Panel_RoleInfo/Hp',2},{'HPtiaodi','Panel_RoleInfo/Hp/HPtiaodi',2},{'HPtiao','Panel_RoleInfo/Hp/HPtiao',2},{'Img_xian101','Panel_RoleInfo/RoleInfoTxtPanel/Img_xian1',2},{'Img_xian201','Panel_RoleInfo/RoleInfoTxtPanel/Img_xian2',2},{'Atk','Panel_RoleInfo/RoleInfoTxtPanel/Atk',2},{'AtkIcon','Panel_RoleInfo/RoleInfoTxtPanel/Atk/AtkIcon',2},{'Def','Panel_RoleInfo/RoleInfoTxtPanel/Def',2},{'DefIcon','Panel_RoleInfo/RoleInfoTxtPanel/Def/DefIcon',2},{'Baoji','Panel_RoleInfo/RoleInfoTxtPanel/Baoji',2},{'BaojiIcon','Panel_RoleInfo/RoleInfoTxtPanel/Baoji/BaojiIcon',2},{'Baoshang','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang',2},{'BaoshangIcon','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/BaoshangIcon',2},{'Mingjie','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie',2},{'MingjieIcon','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/MingjieIcon',2},{'Img_Zonghefenshudi1','Panel_PointInfo/Panel_Score/Img_Zonghefenshudi1',2},{'Img_Fangshoudi3','Panel_VSInfo/Img_Fangshoudi3',2},{'DEFIcon','Panel_VSInfo/DEFIcon',2},{'guang','Panel_VSInfo/guang',2},{'Img_VS','Panel_VSInfo/Img_VS',2},{'Img_Jingongdi3','Panel_VSInfo/Img_Jingongdi3',2},{'ATKIcon','Panel_VSInfo/ATKIcon',2},{'Img_Yuandi','Btn_Tiaoguo1/Img_Yuandi',2},{'Tiaoguo1','Btn_Tiaoguo1/Tiaoguo1',2},{'Img_Tiaoguoicon','Btn_Tiaoguo1/Tiaoguo1/Img_Tiaoguoicon',2},{'Img_Yuandi01','Btn_Tiaoguo/Img_Yuandi',2},{'Tiaoguo','Btn_Tiaoguo/Tiaoguo',2},{'Img_Tiaoguoicon01','Btn_Tiaoguo/Tiaoguo/Img_Tiaoguoicon',2},{'Daojishi','Btn_Tiaoguo/Daojishi',2},{'PointInfopop','PointInfopop',2},{'BlurMask','PointInfopop/BlurMask',2},{'Img_Tanchuangdi','PointInfopop/Img_Tanchuangdi',2},{'Img_Xian1','PointInfopop/Img_Tanchuangdi/Img_Xian1',2},{'Img_Xian2','PointInfopop/Img_Tanchuangdi/Img_Xian2',2},{'PointIdxNamedi','PointInfopop/Img_Tanchuangdi/PointName/PointIdxNamedi',2},{'Img_Biaotixian1','PointInfopop/Img_Tanchuangdi/Text_TaskName/Img_Biaotixian1',2},{'Img_StarTask_1','PointInfopop/Img_Tanchuangdi/Img_StarTask_1',2},{'Img_ResTaskStar_1','PointInfopop/Img_Tanchuangdi/Img_StarTask_1/Img_ResTaskStar_1',2},{'Highlight','PointInfopop/Img_Tanchuangdi/Img_StarTask_1/Img_ResTaskStar_1/Highlight',2},{'Img_StarTask_2','PointInfopop/Img_Tanchuangdi/Img_StarTask_2',2},{'Img_ResTaskStar_2','PointInfopop/Img_Tanchuangdi/Img_StarTask_2/Img_ResTaskStar_2',2},{'Highlight01','PointInfopop/Img_Tanchuangdi/Img_StarTask_2/Img_ResTaskStar_2/Highlight',2},{'Img_StarTask_3','PointInfopop/Img_Tanchuangdi/Img_StarTask_3',2},{'Img_ResTaskStar_3','PointInfopop/Img_Tanchuangdi/Img_StarTask_3/Img_ResTaskStar_3',2},{'Highlight02','PointInfopop/Img_Tanchuangdi/Img_StarTask_3/Img_ResTaskStar_3/Highlight',2},{'CangwuTexingpop','CangwuTexingpop',2},{'Buff_BlurMask','CangwuTexingpop/Buff_BlurMask',2},{'Img_Tanchuangdi01','CangwuTexingpop/Img_Tanchuangdi',2},{'Img_Xian101','CangwuTexingpop/Img_Tanchuangdi/Img_Xian1',2},{'Img_Xian201','CangwuTexingpop/Img_Tanchuangdi/Img_Xian2',2},{'Img_Biaotixian','CangwuTexingpop/Img_Tanchuangdi/Text_Name/Img_Biaotixian',2},{'BlurMask_Original','BlurMask_Original',2},{'DangerousMaskHole','BlurMask_Original/DangerousMask/DangerousMaskHole',2},{'Img_Tanchuangdi__Original','BlurMask_Original/Img_Tanchuangdi__Original',2},{'Img_Xian102','BlurMask_Original/Img_Tanchuangdi__Original/Img_Xian1',2},{'Img_Xian202','BlurMask_Original/Img_Tanchuangdi__Original/Img_Xian2',2},{'Img_Biaotixian01','BlurMask_Original/Img_Tanchuangdi__Original/Text_Name_2/Img_Biaotixian',2},{'Img_Lihuidi_2','BlurMask_Original/Img_Tanchuangdi__Original/RoleHead_2/Img_Lihuidi_2',2},{'Icon_RIHead_2','BlurMask_Original/Img_Tanchuangdi__Original/RoleHead_2/Icon_RIHead_2',2},{'Icon_RIFrame_2','BlurMask_Original/Img_Tanchuangdi__Original/RoleHead_2/Icon_RIFrame_2',2},{'Icon_RICareer_2','BlurMask_Original/Img_Tanchuangdi__Original/RoleHead_2/Icon_RICareer_2',2},{'Jinengfanwei','BlurMask_Original/Img_Tanchuangdi__Original/Jinengfanwei',2},{'Img_Fanwei_2','BlurMask_Original/Img_Tanchuangdi__Original/Jinengfanwei/Img_Fanwei_2',2},{'Mubiaofanwei','BlurMask_Original/Img_Tanchuangdi__Original/Mubiaofanwei',2},{'Image01','BlurMask_Original/Img_Tanchuangdi__Original/Mubiaofanwei/Image',2},{'Img_Mubiao_2','BlurMask_Original/Img_Tanchuangdi__Original/Mubiaofanwei/Img_Mubiao_2',2},{'Yuanzuijieshao_2','BlurMask_Original/Img_Tanchuangdi__Original/Yuanzuixinxi/Yuanzuijieshao_2',2},{'ClickMask','ClickMask',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Button 列表
        {'Btn_Speed','Panel_Fighting/Btn_Speed',4},{'Btn_Qiehuan','Panel_Ready/Panel_Select/Btn_Qiehuan',4},{'Btn_Rormation','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',4},{'Btn_Remove','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',4},{'Btn_Altogether','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether',4},{'Btn_Separate','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate',4},{'Btn_HpDisplay','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay',4},{'Btn_OpenFilter','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',4},{'Btn_Chongzhizhuangtai','Panel_Ready/Panel_Room/Panel_Replace/Btn_Chongzhizhuangtai',4},{'Btn_StartFight','Panel_Ready/Btn_StartFight',4},{'Btn_Back01','Panel_Ready/Btn_Back',4},{'Btn_Chakan','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan',4},{'Btn_Tiaoguo1','Btn_Tiaoguo1',4},{'Btn_Tiaoguo','Btn_Tiaoguo',4},{'DangerousMask','BlurMask_Original/DangerousMask',4},
        -- UITemplate 列表
        {'BattleRoleItem','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole/BattleRoleItem',10},{'BuffPrefab','CangwuTexingpop/Img_Tanchuangdi/BuffScroll/BuffPrefab',10},
        -- RawImage 列表
        {'Panel_Fighting','Panel_Fighting',15},{'Btn_Speed01','Panel_Fighting/Btn_Speed',15},{'Panel_Ready','Panel_Ready',15},{'Btn_Qiehuan01','Panel_Ready/Panel_Select/Btn_Qiehuan',15},{'Btn_Rormation01','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',15},{'Btn_LockRormation','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation',15},{'Btn_Remove01','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',15},{'Btn_LockRemove','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove',15},{'Btn_Altogether01','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether',15},{'Btn_Altogether_H','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H',15},{'Btn_Separate01','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate',15},{'Btn_Separate_H','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H',15},{'Btn_HpDisplay01','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay',15},{'Btn_HpDisplay_H','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay_H',15},{'Panel_Replace','Panel_Ready/Panel_Room/Panel_Replace',15},{'Btn_OpenFilter01','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',15},{'Btn_Chongzhizhuangtai01','Panel_Ready/Panel_Room/Panel_Replace/Btn_Chongzhizhuangtai',15},{'Btn_StartFight01','Panel_Ready/Btn_StartFight',15},{'Panel_RoleInfo','Panel_RoleInfo',15},{'Btn_Chakan01','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan',15},{'Panel_PointInfo','Panel_PointInfo',15},{'Panel_Score','Panel_PointInfo/Panel_Score',15},{'Panel_VSInfo','Panel_VSInfo',15},{'Btn_Tiaoguo101','Btn_Tiaoguo1',15},{'Btn_Tiaoguo01','Btn_Tiaoguo',15},{'BuffScroll','CangwuTexingpop/Img_Tanchuangdi/BuffScroll',15},
        -- LoopScrollRect 列表
        {'LoopScrollRole01','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',18},{'BuffScroll01','CangwuTexingpop/Img_Tanchuangdi/BuffScroll',18},
        -- TextMeshProUGUI 列表
        {'Text','AbtBuffIcon/Text',20},{'Text_Round_Title','Panel_Fighting/UI_update/round/RoundContent/Text_Round_Title',20},{'Text_Round','Panel_Fighting/UI_update/round/RoundContent/Text_Round',20},{'SkillName_Text','Panel_Fighting/UI_update/SkillName_Go/SkillName_Text',20},{'SkillName_RoleName','Panel_Fighting/UI_update/SkillName_Go/SkillName_RoleName',20},{'SkillName_Index','Panel_Fighting/UI_update/SkillName_Go/SkillName_Index',20},{'Text_Round_Title01','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Text_Round_Title',20},{'Text_Roundshu','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Text_Roundshu',20},{'Text_Start2','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Text_Start2',20},{'Text_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Text_Start',20},{'Text_Zhenxing','Panel_Ready/Panel_Select/LineupBtns/Text_Zhenxing',20},{'Text_ZhenxingEn','Panel_Ready/Panel_Select/LineupBtns/Text_ZhenxingEn',20},{'Text_Cunqu','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Text_Cunqu',20},{'Text_Cunqu01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation/Text_Cunqu',20},{'Text_Jiechu','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Text_Jiechu',20},{'Text_Jiechu01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove/Text_Jiechu',20},{'Text_Shunxu','Panel_Ready/Panel_Select/OrderBtns/Text_Shunxu',20},{'Text_ShunxuEn','Panel_Ready/Panel_Select/OrderBtns/Text_ShunxuEn',20},{'Text_Yiqi','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether/Text_Yiqi',20},{'Text_Yiqi01','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H/Text_Yiqi',20},{'Text_Fenbie','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate/Text_Fenbie',20},{'Text_Fenbie01','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H/Text_Fenbie',20},{'Text_xueliang','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay/Text_xueliang',20},{'Text_xueliang01','Panel_Ready/Panel_Select2/HpDisplayBtns/Btn_HpDisplay_H/Text_xueliang',20},{'Text_Empty','Panel_Ready/Panel_Room/Panel_Replace/Text_Empty',20},{'Text01','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask/Image/Text',20},{'Text_ShowRole','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Img_supportType/Text_ShowRole',20},{'Text_FriendRole','Panel_Ready/Panel_Room/Panel_Replace/RoleType/Img_supportType/FriendRole/Text_FriendRole',20},{'Text_Pailie','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Text_Pailie',20},{'Text_Chongzhizhuangtai','Panel_Ready/Panel_Room/Panel_Replace/Btn_Chongzhizhuangtai/Text_Chongzhizhuangtai',20},{'Text_Tips','Panel_Ready/Panel_Room/Img_Tips/Text_Tips',20},{'Text_Cishu','Panel_Ready/Panel_Room/Img_Tips/Text_Cishu',20},{'Text_Jingtou','Panel_Ready/Btn_Jintouqiehuan/Text_Jingtou',20},{'Text_Jingtouguanbi','Panel_Ready/Btn_Jintouqiehuan/Text_Jingtouguanbi',20},{'Text_On','Panel_Ready/Btn_EX/Text_On',20},{'Text_Once','Panel_Ready/Btn_EX/Text_Once',20},{'Text_Off','Panel_Ready/Btn_EX/Text_Off',20},{'Text_SecondWar','Panel_Ready/Btn_Group/Btn_SecondWar/Text_SecondWar',20},{'Text_War','Panel_Ready/Btn_Group/Btn_SecondWar/Text_War',20},{'Text_Guanka','Panel_Ready/Btn_Group/Btn_Guankaxinxi/Text_Guanka',20},{'Text_Xinxi','Panel_Ready/Btn_Group/Btn_Guankaxinxi/Text_Xinxi',20},{'Text_Boss','Panel_Ready/Btn_Group/Btn_BossInfo/Text_Boss',20},{'Text_BossXinxi','Panel_Ready/Btn_Group/Btn_BossInfo/Text_BossXinxi',20},{'Text_Jingzhi','Panel_Ready/Btn_Group/Btn_BanSkill/Text_Jingzhi',20},{'Text_JiNeng','Panel_Ready/Btn_Group/Btn_BanSkill/Text_JiNeng',20},{'Text_Buff','Panel_Ready/Btn_Group/Btn_Buff/Text_Buff',20},{'Text_JiNeng01','Panel_Ready/Btn_Group/Btn_Buff/Text_JiNeng',20},{'Img_Zuozhankaishi_EN','Panel_Ready/Btn_StartFight/Img_Zuozhankaishi_EN',20},{'Text_PowerConsume','Panel_Ready/Btn_StartFight/Text_PowerConsume',20},{'Text_BossConsume','Panel_Ready/Btn_StartFight/Text_BossConsume',20},{'Text_Chakan','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan/Text_Chakan',20},{'Text_RILevel','Panel_RoleInfo/RoleHead/Text_RILevel',20},{'Text_RILv','Panel_RoleInfo/RoleHead/Text_RILv',20},{'Text_RIRank','Panel_RoleInfo/RoleHead/Icon_Rankdi/Text_RIRank',20},{'Text_RIName','Panel_RoleInfo/Text_RIName',20},{'Text_Mubiaozi','Panel_RoleInfo/Mubiao/Text_Mubiaozi',20},{'Text_HP1','Panel_RoleInfo/Hp/Text_HP1',20},{'Text_HP2','Panel_RoleInfo/Hp/Text_HP2',20},{'Text_Atk1','Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk1',20},{'Text_Atk2','Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk2',20},{'Text_Def1','Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def1',20},{'Text_Def2','Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def2',20},{'Text_Baoji1','Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji1',20},{'Text_Baoji2','Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji2',20},{'Text_Baoshang1','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang1',20},{'Text_Baoshang2','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang2',20},{'Text_Mingjie1','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie1',20},{'Text_Mingjie2','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie2',20},{'Text_MoNi','Panel_PointInfo/Text_MoNi',20},{'Text_Score','Panel_PointInfo/Panel_Score/Text_Score',20},{'Text_Zonghefenshu1','Panel_PointInfo/Panel_Score/Text_Zonghefenshu1',20},{'Text_Jifen2','Panel_VSInfo/Text_Jifen2',20},{'Text_DEFScore','Panel_VSInfo/Text_DEFScore',20},{'Text_DEFNmae','Panel_VSInfo/Text_DEFNmae',20},{'Text02','Panel_VSInfo/Text',20},{'Text_Jifen1','Panel_VSInfo/Text_Jifen1',20},{'Text_ATKScore','Panel_VSInfo/Text_ATKScore',20},{'Text_ATKName','Panel_VSInfo/Text_ATKName',20},{'Text_Tiaoguo','Btn_Tiaoguo1/Tiaoguo1/Text_Tiaoguo',20},{'Text_Tiaoguo01','Btn_Tiaoguo/Tiaoguo/Text_Tiaoguo',20},{'Text_Daojishi','Btn_Tiaoguo/Daojishi/Text_Daojishi',20},{'Text_Shuzi','Btn_Tiaoguo/Daojishi/Text_Shuzi',20},{'Text_ResPointIdxName','PointInfopop/Img_Tanchuangdi/PointName/PointIdxNamedi/Text_ResPointIdxName',20},{'Text_ResPointName','PointInfopop/Img_Tanchuangdi/PointName/Text_ResPointName',20},{'Text_TaskName','PointInfopop/Img_Tanchuangdi/Text_TaskName',20},{'Text_ResTaskDes_1','PointInfopop/Img_Tanchuangdi/Img_StarTask_1/Text_ResTaskDes_1',20},{'Text_ResTaskDes_2','PointInfopop/Img_Tanchuangdi/Img_StarTask_2/Text_ResTaskDes_2',20},{'Text_ResTaskDes_3','PointInfopop/Img_Tanchuangdi/Img_StarTask_3/Text_ResTaskDes_3',20},{'Text_Name','CangwuTexingpop/Img_Tanchuangdi/Text_Name',20},{'Text_Name_2','BlurMask_Original/Img_Tanchuangdi__Original/Text_Name_2',20},{'Text_Rolename_2','BlurMask_Original/Img_Tanchuangdi__Original/RoleHead_2/Text_Rolename_2',20},{'Text_Jinengfanwei_2','BlurMask_Original/Img_Tanchuangdi__Original/Jinengfanwei/Text_Jinengfanwei_2',20},{'Text_Mubiaofanwei_2','BlurMask_Original/Img_Tanchuangdi__Original/Mubiaofanwei/Text_Mubiaofanwei_2',20},{'Text_Mubiaoshuoming_2','BlurMask_Original/Img_Tanchuangdi__Original/Mubiaofanwei/Text_Mubiaoshuoming_2',20},{'Text_Yuanzuijieshao_2','BlurMask_Original/Img_Tanchuangdi__Original/Yuanzuixinxi/Yuanzuijieshao_2/Text_Yuanzuijieshao_2',20},{'Text_Shuoming_2','BlurMask_Original/Img_Tanchuangdi__Original/Yuanzuixinxi/Text_Shuoming_2',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    ---体力校准
    Global.TiliCalibration()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    -- MgrRes.NowClearImmediate()
    self:OnInitFight()
    self.BlurMask_Original().gameObject:SetActive(false)
    Event.Add("WorldBossFinishPanelClose",Handle(self,self.WBCompletePanelClose))
    Event.Add("WorldBossHpClose",Handle(self,self.CloseBossHpBar))
    Event.Add("PauseBtnClose",Handle(self,self.ClosePauseButton))
    Event.Add("PanelFight",Handle(self,self.PanelFightClose))
    Event.Add("JumpOutClose",Handle(self,self.CloseJump))
    self:BattlePopTip()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if self.Panel_Fighting().gameObject.activeInHierarchy then
            if self.Btn_Pause().gameObject.activeInHierarchy then
                if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
                    CJNBattleMgr.Instance.IsPause = true
                    ---隐藏角色信息面板
                    self:ShowRoleInfo()
                    MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole,2},true)
                elseif BattleManager.GameMode == BattleManager.GameModeType.PVP then
                    CJNBattleMgr.Instance.IsPause = true
                    MgrUI.Pop(UID.PVPPause_UI,{BattleManager.AllRole,1},true)
                    ---隐藏角色信息面板
                    self:ShowRoleInfo()
                elseif BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP then
                    CJNBattleMgr.Instance.IsPause = true
                    MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole,3},true)
                    ---隐藏角色信息面板
                    self:ShowRoleInfo()
                else
                    CJNBattleMgr.Instance.IsPause = true
                    ---隐藏角色信息面板
                    self:ShowRoleInfo()
                    MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole, 1},true)
                end
            end
        else
            local isPointInfopop = self.PointInfopop().gameObject.activeSelf
            if isPointInfopop then
                self.PointInfopop().gameObject:SetActive(false)
                return
            end
            ---关闭点击检测
            MgrTimer.Cancel("BattleUIUpdate")
            BattleManager.ClearLuaData()
            print("退出战斗")
            ---结束战斗界面
            if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
                StormViewModel.CloseWorldBossBattle()
            elseif BattleManager.GameMode == BattleManager.GameModeType.PVP then

            else
                StormViewModel.curSelectData = StormViewModel.GetSelectLastCheckPoint(StormViewModel.curSelectData)
                StormViewModel.CloseBattle()
            end
            Event.Remove("BackKey", Handle(self, self.OnBackKey))
        end
    end
end

function M:BattlePopTip()
    if BattleManager.GameMode ~= BattleManager.GameModeType.AniWorldBoss and 
            BattleManager.GameMode ~= BattleManager.GameModeType.WorldBoss and 
            BattleManager.GameMode ~= BattleManager.GameModeType.PVP and 
            BattleManager.GameMode ~= BattleManager.GameModeType.FriendPVP and
            BattleManager.GameMode ~= BattleManager.GameModeType.BuDoukaiPVP
    then
        ---1-3引导
        if StormViewModel.CurPointData.id == 100002 and NoviceControl.GetNoviceState(32101) == false then
            NoviceViewModel.Check(32101)
        end
    end
end

function M:OnInitFight()
    ---0、无点击，1、设置角色，2、问号排序模式，3、交换排序模式，4、战斗中
    self.CurMode = 0
    ---在切换到调整顺序时，控制头像的遮挡
    self.SelectRoleStop = false
    ---初始化跳过状态
    BattleViewModel.Jumping = false
    ---显示透明地板
    CJNBattleMgr.Instance:SetFloorShowImg(true)
    ---获取战斗摄像机
    self.battleCamera = CMgrCamera.Instance.FightCamera
    ---获取ui摄像机
    self.uiCamera = GameObject.Find("UI_Camera"):GetComponent("Camera")
    ---初始化战斗场景(创建人物)
    self:InitBattle()
    ---初始化UI
    self:InitBattleUI()
    ---初始化教学
    self:InitGuide()
    ---加载玩家默认阵型
    if StormViewModel.CurPointType == StormViewModel.PointType.guide
    then
        ---战术指导加载指定角色
        self:LoadGuideTeam()
        if StormViewModel.CurPointData.type ~= 999 then
            self.Panel_Ready().gameObject:SetActive(false)
            ---战术指导加载教学弹窗
            MgrUI.Pop(UID.NoviceFrame_UI,{StormViewModel.CurPointData.teach_f,function()
                if MgrUI.GetCurUI().Uid == UID.Battle02_UI then
                    self.Panel_Ready().gameObject:SetActive(true)
                end
            end},true)
            Event.Clear("CloseTactical")
            Event.Add("CloseTactical",function()
                if MgrUI.GetCurUI().Uid == UID.Battle02_UI then
                    self.Panel_Ready().gameObject:SetActive(true)
                end
            end)
            NoviceControl.PushGroupStateByGroupID(NoviceControl.GetNoviceDataByID(StormViewModel.CurPointData.teach_f).group,false)
            MessageEvent.Go(EID.NoviceCheck,StormViewModel.CurPointData.teach_f)
        end
    else
        if BattleManager.GameMode ~= BattleManager.GameModeType.PVP and BattleManager.GameMode ~= BattleManager.GameModeType.FriendPVP and BattleManager.GameMode ~= BattleManager.GameModeType.BuDoukaiPVP then --不能是PVP
            ---如果不是教学关卡
            if StormViewModel.CurPointType == StormViewModel.PointType.monthTower then
                self:LoadTeamRole(10003)
            elseif StormViewModel.CurPointData == nil or StormViewModel.CurPointData:CheckGuide() == false then
                ---常规作战加载玩家角色
                self:LoadTeamRole(0)
            end
        end
    end

    ---暂时隐藏暂停键
    self.Btn_Pause().gameObject:SetActive(false)
    if BattleManager.GameMode == BattleManager.GameModeType.PVP then
        ---1f后开始战斗
        MgrTimer.AddDelay("StartBattle",0.1,Handle(self,function()
            BattleManager.GameMode = BattleManager.GameModeType.PVP
            BattleManager.GameStart(true)
            MgrTimer.Cancel("StartBattle")
            ---刷新地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            self.Btn_Pause().gameObject:SetActive(true)
        end) ,nil)
    elseif BattleManager.GameMode == BattleManager.GameModeType.FriendPVP then
        ---0.1f后开始战斗
        MgrTimer.AddDelay("StartBattle",0.1,Handle(self,function()
            BattleManager.GameStart(true)
            MgrTimer.Cancel("StartBattle")
            ---刷新地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            self.Btn_Pause().gameObject:SetActive(true)
        end) ,nil)
    elseif BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP then
        ---0.1f后开始战斗
        MgrTimer.AddDelay("StartBattle",0.1,Handle(self,function()
            BattleManager.GameMode = BattleManager.GameModeType.BuDoukaiPVP
            BattleManager.GameStart(true)
            MgrTimer.Cancel("StartBattle")
            ---刷新地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            self.Btn_Pause().gameObject:SetActive(true)
        end) ,nil)
    else
        ---注册开始战斗事件
        UIEvent.LuaClick(self.Btn_StartFight().gameObject,Handle(self,function ()
            Event.Remove("BackKey", Handle(self, self.OnBackKey))
            MgrUI.Lock("battle_start")
            --if BattleManager.GameMode == BattleManager.GameModeType.MonthTower then
            --    MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_41"),function()
            --        self:StartBattleFunc()
            --    end,nil,2},true)
            --else
                self:StartBattleFunc()
            --end
        end))
    end
        ---默认分别排序模式
        self.sortingType = 1
end

function M:StartBattleFunc()
    ---设置连战场次
    StormControl.SetBattleContinu(1)
    ---战斗开场，默认从第一场战斗开始
    if self.SecondWar_CurrentTeam == 2 then
        BattleManager.ShowSecondWarTeam(1)
    end
    if CJNBattleMgr.Instance.worldBossBattle
    then
        ---检查场上是否存在角色且非纯辅助阵容
        local roleCount = 0
        local isOnlyAux = false
        for i, v in pairs(BattleManager.AllRole) do
            if v.IsLeft == true then
                roleCount = roleCount + 1
                if tonumber(v.Occupation) ~= 4 then
                    isOnlyAux = true
                    break
                end
            end
        end
        if roleCount < 1 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips2"),1},true)
            MgrUI.UnLock("battle_start")
            return
        end
        if not isOnlyAux then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips3"),1},true)
            MgrUI.UnLock("battle_start")
            return
        end
        ---将当前阵型保存为默认
        ---@type FighterBase[] 创建服务器需要的阵型数据
        local fighters = {}
        for i, role in pairs(BattleManager.AllRole) do
            if role.IsLeft == true then
                ---@type FighterBase
                local fighter = {}
                ---设置位置
                fighter.index = (6 - role.PosX) * 3 + role.PosY
                ---设置id
                fighter.roleID = tonumber(role.ID)
                ---加入数据池
                fighters[role.AtkOrder] = fighter
            end
        end
        ---拷贝阵容到默认阵型
        TeamControl.ChangeTeamInfo(0,fighters)
        ---发送默认阵型
        TeamControl.SendSaveTeamData({0},false,Handle(self,self.CallBackStartBattle))
    else
        if BattleManager.GameMode == BattleManager.GameModeType.Novice
        then
            local consume = string.split(StormViewModel.CurPointData.consume,"_")
            local vigor = StormViewModel.CurPointData.consume and tonumber(string.split(StormViewModel.CurPointData.consume,"_")[3]) or 0
            if ItemControl.GetItemByIdAndType(tonumber(consume[2]),tonumber(consume[1])).count < vigor then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips1"),1},true)
                MgrUI.UnLock("battle_start")
                return
            end
        else
            ---检查体力是否足够
            local vigor = StormViewModel.CurPointData.consume and tonumber(string.split(StormViewModel.CurPointData.consume,"_")[3]) or 0
            local item = string.split(StormViewModel.CurPointData.consume,"_")
            if PlayerControl.GetVigor() < vigor and tonumber(item[2]) == 100001 and tonumber(item[1]) == 4 then  --如果是体力且体力不足
                --MgrUI.Pop(UID.PopTip_UI,{"体力不足无法开启战斗",1},true)
                self.tempMode = self.CurMode
                self.CurMode = 0
                MgrUI.Pop(UID.VigorInfoPanel,{function()
                    local vigor = StormViewModel.CurPointData.consume and tonumber(string.split(StormViewModel.CurPointData.consume,"_")[3]) or 0
                    local color = PlayerControl.GetVigor() < vigor and "#ff3149" or "#1df7ff"
                    self.Text_PowerConsume().text = "<color="..color..">"..PlayerControl.GetVigor().."</color>/"..vigor
                end ,function() self.CurMode = self.tempMode end},true)
                MgrUI.UnLock("battle_start")
                return
            end
        end
        if (StormViewModel.CurPointData.type == 6 and StormControl.GetWeekBossTime() <= 0)
            or (StormViewModel.CurPointData.type == 7 and BlueprintViewModel.WeekRaidNum() <= 0) then --scrollType == 13
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_meizhoufuben_text1"),2},true)
            MgrUI.UnLock("battle_start")
            return
        end
        ---检查场上是否存在角色且非纯辅助阵容
        local roleCount = 0
        local isOnlyAux = false
        for i, v in pairs(BattleManager.AllRole) do
            if v.IsLeft == true then
                roleCount = roleCount + 1
                if tonumber(v.Occupation) ~= 4 then
                    isOnlyAux = true
                    break
                end
            end
        end
        if roleCount < 1 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips2"),1},true)
            MgrUI.UnLock("battle_start")
            return
        end
        if not isOnlyAux then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips3"),1},true)
            MgrUI.UnLock("battle_start")
            return
        end
        ---将当前阵型保存为默认
        ---@type FighterBase[] 创建服务器需要的阵型数据
        local fighters = {}
        local lineups = {}
        ---@type FighterBase[] 创建服务器需要的阵型数据（只有Npc）
        local fightersNpc = {}
        local fightersFriend = {}
        local havePlayerRole = false
        StormViewModel.NPCInfos = {}
        for i, role in pairs(BattleManager.AllRole) do
            if role.IsLeft == true then
                ---@type FighterBase
                local fighter = {}
                local lineup = {}
                ---设置位置
                fighter.index = (6 - role.PosX) * 3 + role.PosY
                lineup.index = fighter.index
                ---设置id
                fighter.roleID = tonumber(role.ID)
                lineup.roleID = fighter.roleID
                fighter.order = role.AtkOrder - 1
                if role.roleType == 1 and role.userID == nil
                then
                    ---场上存在玩家自己的角色
                    havePlayerRole = true
                    ---加入玩家池
                    fighters[role.AtkOrder] = fighter
                    lineups[#lineups + 1] = lineup
                elseif role.roleType == 2 and role.userID == nil
                then
                    if StormViewModel.CurPointData.type == 999
                    then
                        for i,v in pairs(StormViewModel.CurPointData.roles) do
                            if v.id == fighter.roleID then
                                ---加入Npc池
                                fightersNpc[role.AtkOrder] = fighter
                                ---NPC详情
                                table.insert(StormViewModel.NPCInfos,v)
                            end
                        end
                    else
                        ---加入Npc池
                        fightersNpc[role.AtkOrder] = fighter
                    end
                elseif role.userID
                then
                    fighter.userID = tonumber(role.userID)
                    fightersFriend[role.AtkOrder] = fighter
                end
            end
        end
        if not havePlayerRole and StormViewModel.CurPointType ~= StormViewModel.PointType.guide and StormViewModel.CurPointData:CheckGuide() == false then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips4"),2},true)
            self:ReMoveAllLeft()
            fightersFriend = {}
            MgrUI.UnLock("battle_start")
            return
        end
        StormViewModel.NpcTeam = fightersNpc
        StormViewModel.FriendSupportTeam = fightersFriend
        StormViewModel.localTeam = fighters
        ---如果不是战术指导，不放默认阵型
        if StormViewModel.CurPointType ~= StormViewModel.PointType.guide and StormViewModel.CurPointType ~= StormViewModel.PointType.monthTower and StormViewModel.CurPointData:CheckGuide() == false
        then
            if StormViewModel.CurPointData.npcType == 0
            then
                if #lineups > StormViewModel.CurPointData.playerNumber then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips5"),2},true)
                    MgrUI.UnLock("battle_start")
                    return
                end
                ---无Npc助战
                ---拷贝阵容到默认阵型
                TeamControl.ChangeTeamInfo(0,lineups)
                ---发送默认阵型给FWQ
                TeamControl.SendSaveTeamData({0},false,Handle(self,self.CallBackStartBattle))
            else
                -----有Npc助战
                -----拷贝阵容到指定阵型供服务器获取阵型
                --TeamControl.ChangeTeamInfo(StormViewModel.NpcTeamStaticId,fighters)
                -----发送默认阵型给FWQ
                --TeamControl.SendSaveTeamData({StormViewModel.NpcTeamStaticId},false,Handle(self,self.CallBackStartBattle))
                BattleViewModel.GuideTeam = fightersNpc
                ---新手战斗开始标记
                NoviceControl.battleStart = true
                ---设置当前排序模式为无状态
                --self.CurMode = 4
                ---隐藏透明地板
                --CJNBattleMgr.Instance:SetFloorShowImg(false)
                ---延迟点亮暂停键，防止战斗没开始就退出
                Event.Add("BtnPauseDelay_Battle02",Handle(self,self.BtnPauseDelay_Battle02))
                --MgrTimer.AddDelay("BtnPauseDelay",0,function()
                --    self.Btn_Pause().gameObject:SetActive(true)
                --end,nil)
                ---开始战斗
                self:ShowRoleInfo()
                BattleManager.GameMode = BattleManager.GameModeType.Normal
                MgrUI.Pop(UID.PartLoading_UI,nil,true)
                BattleManager.GameStart(true,Handle(self,self.ClosePanel))
                ---刷新地板
                CJNBattleMgr.Instance:SetAllFloorHid()
            end

        elseif StormViewModel.CurPointType == StormViewModel.PointType.monthTower then
            if not YueTaViewModel.GetYuetaData():CheckUnlock() then
                ---提示尚未解锁
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_tips1"),1},true)
                MgrUI.UnLock("battle_start")
                return
            end
            if #lineups > StormViewModel.CurPointData.playerNumber then ---人数超出
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips5"),2},true)
                MgrUI.UnLock("battle_start")
                return
            end
            TeamControl.ChangeTeamInfo(10003,lineups)   ---index为月塔挑战专用index
        ---发送默认阵型给FWQ
        TeamControl.SendSaveTeamData({10003},false,Handle(self,self.CallBackStartBattle))
        else
            ---战术指导队伍阵型
            BattleViewModel.GuideTeam = fightersNpc
            BattleViewModel.TeamCorrect = true
            self:CallBackStartBattle()
        end
    end
end

function M:BtnPauseDelay_Battle02()
    print("Battle02 BtnPauseDelay_Battle02")
    if self.ObjRoot then
        self.Btn_Pause().gameObject:SetActive(true)
    end
end

function M:OnShowFinish()
    MgrCamera.VirCamerasInit_New()
    ---刷新角色滑块
    if BattleManager.GameMode ~= BattleManager.GameModeType.PVP and BattleManager.GameMode ~= BattleManager.GameModeType.FriendPVP and BattleManager.GameMode ~= BattleManager.GameModeType.BuDoukaiPVP then
        self:ReloadSelectRole(0)
    end
    if BattleManager.FightType == BattleManager.MonsterStandType.BOSS_BOSS or BattleManager.FightType == BattleManager.MonsterStandType.BOSS_MONSTER or BattleManager.FightType == BattleManager.MonsterStandType.MONSTER_BOSS_MIX_MONSTER or BattleManager.FightType == BattleManager.MonsterStandType.MONSTER_BOSS_MIX_BOSS or BattleManager.FightType == BattleManager.MonsterStandType.BOSS then
        ---播放警告
        CJNBattleMgr.Instance:SetBossWarning()
        self.ClickMask().gameObject:SetActive(true)
        MgrTimer.AddDelayNoName(3.8,function()
            self.ClickMask().gameObject:SetActive(false)
        end,nil)
    end
    CJNBattleMgr:ActiveBuildings()
    ---显示高威胁单位弹框
    if StormViewModel.CurPointData ~= nil and (StormViewModel.CurPointData.dangerousEnemy ~= "0" and StormViewModel.CurPointData.dangerousEnemy ~= "")
    then
        self:ShowDangerousEnemy()
    else
        self.BlurMask_Original().gameObject:SetActive(false)
    end
    self:JumpOutFunction()
end

---初始化教學
function M:InitGuide()
    if StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.teacheID ~= nil and StormViewModel.CurPointData.teacheID ~= 0 and StormViewModel.CurPointData.type == 999 then
        NoviceControl.PushGroupStateByGroupID(NoviceControl.GetNoviceDataByID(StormViewModel.CurPointData.teacheID).group,false)
        MessageEvent.Go(EID.NoviceCheck,StormViewModel.CurPointData.teacheID)
        ---关卡信息按钮隐藏
        self.Btn_Guankaxinxi().gameObject:SetActive(false)
    end
    if MgrUI.GetCurUI().Uid == UID.Battle02_UI then
        self.Panel_Ready().gameObject:SetActive(true)
    end
end
---初始化战斗场景(创建人物)
function M:InitBattle()
    CJNUIMgr.InitBattleMapNodePosList2(BattleManager.FloorPos.left,BattleManager.FloorPos.right)
    ---初始隐藏战斗信息面板
    self.Panel_Fighting().gameObject:SetActive(false)
    ---初始化战斗场景
    if StormViewModel.CurPointData ~= nil and (StormViewModel.CurPointData.type == 1 or StormViewModel.CurPointData.type == 999) ---普通战斗/新手指导
    then
        if StormViewModel.CurPointData.pointType == 4 then
            CJNBattleMgr.Instance.worldBossBattle = false
            BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,StormViewModel.CurPointData.ContinuousCombatType)
        else
            CJNBattleMgr.Instance.worldBossBattle = false
            BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,StormViewModel.CurPointData.ContinuousCombatType)
        end
    elseif StormViewModel.CurPointData ~= nil and (StormViewModel.CurPointData.type==StormViewModel.PointBattleType.NORMAL_BOSS or StormViewModel.CurPointData.type==StormViewModel.PointBattleType.ACTIVITY_BLOODBOSS)  ---有BOSS的关卡
    then
        MgrSound.PlayEffect("yx_boss_jingbao",1,0.5,false)
        CJNBattleMgr.Instance.worldBossBattle = false
        BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,StormViewModel.CurPointData.ContinuousCombatType , StormViewModel.CurPointData.banSkill)
    elseif StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.type==StormViewModel.PointBattleType.ACTIVITY_NEWBOSS
    then
        MgrSound.PlayEffect("yx_boss_jingbao",1,0.5,false)
        CJNBattleMgr.Instance.worldBossBattle = false
        BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,StormViewModel.CurPointData.ContinuousCombatType , StormViewModel.CurPointData.banSkill)
    elseif StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.type==StormViewModel.PointBattleType.ACTIVITY_BATTLE
    then
        CJNBattleMgr.Instance.worldBossBattle = false
        BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,StormViewModel.CurPointData.ContinuousCombatType)
    else
        if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss  ---联合讨伐
        then
            MgrSound.PlayEffect("yx_boss_jingbao",1,0.5,false)
            CJNBattleMgr.Instance.worldBossBattle = true
            local tBossData = EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel]
            BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,tBossData.ContinuousCombatType,tBossData.prohibit)
        elseif BattleManager.GameMode == BattleManager.GameModeType.PVP     ---PVP
        then
            CJNBattleMgr.Instance.worldBossBattle = false
            BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,BattleManager.MonsterStandType.PVP)
        elseif BattleManager.GameMode == BattleManager.GameModeType.FriendPVP     ---好友PVP
        then
            CJNBattleMgr.Instance.worldBossBattle = false
            BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,BattleManager.MonsterStandType.PVP)
        elseif BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP     ---武道会
        then
            CJNBattleMgr.Instance.worldBossBattle = false
            BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,BattleManager.MonsterStandType.PVP)
        else                                                                ---红巨/指导
            CJNBattleMgr.Instance.worldBossBattle = false
            BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,BattleManager.MonsterStandType.MONSTER)
        end
    end
    ---月塔场景初始化Buff
    if StormViewModel.CurPointType == StormViewModel.PointType.monthTower and StormViewModel.CurPointData.BuffVFX ~= nil and StormViewModel.CurPointData.BuffVFX ~= "0" then
        self:CreateBuff(StormViewModel.CurPointData.BuffVFX)
    end
    ---加载队伍顺序图片
    self:ReloadOrder(false)
    ---0.5f后更新地板
    --MgrTimer.AddDelayNoName(0.5,function()
    ---显示透明地板
    CJNBattleMgr.Instance:SetFloorShowImg(true)
    CJNBattleMgr.Instance:SetAllFloorHid()
    --end,nil)
    ---设置屏幕点击状态1：按下 2：拖拽 3：抬起
    self.OnState = 1
    ---开启屏幕按键检测循环
    MgrTimer.AddRepeat("BattleUIUpdate",0, function ()
        if CJNBattleMgr.Instance.IsPause == true
        then
            ---暂停时不允许点击
            return
        end
        if self.CurMode == 0
        then
            return
        end
        ---状态1检测按下
        if self.OnState == 1
        then
            if UIEvent.GetButton_Down() then
                local y = UIEvent.GetInput_Y()
                if y < (Tools.GetScreenHeight()/4) then
                    ---若是在UI栏拖拽则不执行
                    return
                end
                local PopUI = MgrUI.GetPopUI(UID.RolePreview_UI)
                ---如果当前弹窗了技能预览界面则不执行
                if PopUI ~= nil then
                    return
                end
                ---按下通知
                self:OnBeginDrag()
                ---切换到拖拽状态
                self.OnState = 2
            end
        elseif self.OnState == 2
        then
            ---拖拽通知
            self:OnDrag()
            ---检测抬起
            if UIEvent.GetButton_Up() then
                ---切换到抬起状态
                self.OnState = 3
            end
        elseif self.OnState == 3
        then
            ---抬起通知
            self:OnEndDrag()
            ---切换到检测按下状态
            self.OnState = 1
        end
        ---若开启了战斗且打开了角色面板开始实时更新
        if BattleManager.IsFightStart and self.CurRoleInfo ~= nil
        then
            self:UpdateRoleInfo()
        end
    end,-1,nil)
    if StormViewModel.CurPointData ~= nil and (BattleManager.FightType == BattleManager.MonsterStandType.BOSS or StormViewModel.CurPointData.type == BattleManager.MonsterStandType.BOSS_BOSS)
    then
        ---Boss关调整公告位置
        SysNoticeControl.SetSysNoticeOffsetY(-274)
    end
end
function M:CreateBuff(BuffVFX)
    MgrRes.GetPrefab("ABOriginal/VFX/Prefab/Buff_Prefab/"..BuffVFX..".prefab",function(Obj)
        if Obj == nil then return end
        Obj.transform.localPosition = Vector3.zero
        Obj.transform.localScale = Vector3(1,1,1)
        Obj.layer = 9
        for i = 0,Obj.transform.childCount - 1 do
            Obj.transform:GetChild(i).gameObject.layer = 9
        end
    end)
end
function M:OnBeginDrag()
    ---发射射线抓取地板角色GameId， 0为空
    self.ShowRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
    ---设置选中的角色
    CJNUIMgr.SetUiTop(tonumber(self.ShowRoleId))
    ---按下位置存在角色则显示角色信息
    if self.ShowRoleId ~= nil and self.ShowRoleId ~= 0
    then
        ---显示
        for i, role in pairs(BattleManager.AllRole) do
            if role.GameID == self.ShowRoleId and role.Remove == false and not role.myAni.IsWorldBoss then
                self:ShowRoleInfo(role,true)
                break
            end
        end
    else
        --self.CurRoleInfo = nil
    end
    if self.CurMode == 1
    then
        ---设置角色模式
        ---显示透明地板
        --CJNBattleMgr.Instance:SetFloorShowImg(true)
        ---抓取地板role
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---清空地板数据
            BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = 0
            ---清空人物位置信息
            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, 0, 0)
            ---修改透明度
            self.dragRole.myAni:SetAlpha(0.5)
            ---设置uiItem
            self.UIDragItem:SetData({HeroControl.GetRoleDataByID(tonumber(self.dragRole.ID)),self})
            if self.dragRole.userID then
                --StormViewModel.AddFriendHeroData(tonumber(self.dragRole.ID))
                self:ShowFriendSupportRole()
            else
                ---添加到滑块数据
                --StormViewModel.AddHeroData(tonumber(self.dragRole.ID))
                self:ShowRole()
            end
            -----刷新滑块UI
            --self:ReloadSelectRole(tonumber(self.dragRole.ID))
        end
    elseif self.CurMode == 2
    then
        ---设置问号排序模式
        ---检查是否已设置过
        if self.FinishOrder[self.ShowRoleId] == true then
            return
        end
        ---未设置，抓取地板role
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---设置顺序为当前索引顺序
            self.dragRole.myAni:SetOrder(self.CurAtkOrderIndex, self.dragRole.IsLeft, true)
            --UnityEngine.Debug.Log("====================GameID: "..self.dragRole.GameID)
            --UnityEngine.Debug.Log("====================ShowRoleId: "..self.ShowRoleId)
            --UnityEngine.Debug.Log("====================AtkOrder: "..self.dragRole.AtkOrder)
        end
    elseif self.CurMode == 3
    then
        ---设置交换排序模式
        ---抓取选中的角色顺序图标
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            self.dragRoleAtkOder = self.dragRole.myAni.transform:Find("AtkOrder(Clone)").gameObject
            local dragCanvas = self.dragRoleAtkOder:GetComponent("Canvas")
            dragCanvas.sortingOrder = dragCanvas.sortingOrder + 1
        end
    end
    ---滑动屏幕模式打开
    if self.dragRole == nil and not BattleManager.IsFightStart and not self.Panel_RoleInfo.activeInHierarchy then
        CJNBattleMgr.Instance:CameraMoveOpenAndClose(true)
    end
end
function M:OnDrag()
    ---战斗中不执行
    if BattleManager.IsFightStart then
        return
    end
    if self.CurMode == 1 then
        ---设置角色模式
        if self.dragRole ~= nil then
            ---判断是否是第一次拖拽
            if self.isOnceDrag then
                ---若是第一次则显示攻击范围及羁绊
                self.isOnceDrag = false
                return
            end
            local posArr={}
            if self.dragRole.IsLeft then
                ---若存在抓取到的角色更新抓取角色的位置
                posArr = CJNBattleMgr.Instance:RayAndSetGo(self.dragRole.myAni.gameObject)
                ---更新uiItem位置
                self.UIDragItem.transform.localPosition = Tools.GetUIPos(self.dragRole.myAni.gameObject,self.battleCamera,self.uiCamera,self.selectRoleRect)
            else
                posArr[1] = self.dragRole.PosX
                posArr[2] = self.dragRole.PosY
                ---更新uiItem位置
            end
            if self.LastDragPos_X == posArr[1] and self.LastDragPos_Y == posArr[2] then
                ---若与上一帧位置相同则不显示
                return
            end
            if posArr[1] == 0 or posArr[2] == 0 then
                ---若坐标为零不显示
                return
            end
            ---记录坐标
            self.LastDragPos_X = posArr[1]
            self.LastDragPos_Y = posArr[2]
            ---重置地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            print(posArr[1]..posArr[2])
            ---显示攻击范围及羁绊
            BattleManager.FAndShowRound(self.dragRole, posArr[1], posArr[2])
        else
            ---滑动模式

        end
    elseif self.CurMode == 2 then
        ---设置排序模式
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---若存在抓取到的角色更新抓取角色的顺序图标位置
        if self.dragRoleAtkOder ~= nil then
            CJNBattleMgr.Instance:RayAndSetGo(self.dragRoleAtkOder)
        else

        end
    end
end
function M:OnEndDrag()
    if BattleManager.IsFightStart then
        return
    end
    CMgrCamera.Instance:CloseStrokeCamera()
    self.LastDragPos_X = -10
    self.LastDragPos_Y = -10
    ---获取左侧队伍数量OnEndDrag
    local TeamCount = 0
    local SupportCount = 0
    for i, v in pairs(BattleManager.AllRole) do
        if v.IsLeft == true then
            TeamCount = TeamCount + 1
        end
        if v.userID and v.userID ~= 0 then
            SupportCount = SupportCount + 1
        end
    end
    if self.CurMode == 1
    then
        ---隐藏透明地板
        --CJNBattleMgr.Instance:SetFloorShowImg(false)
        -- MgrTimer.AddDelayNoName(0.5,function() CJNBattleMgr.Instance:SetAllFloorHid() end,nil)
        ---设置角色模式
        if self.dragRole ~= nil and self.dragRole.IsLeft
        then
            ---获取射线返回的地板信息:[0]id -1不能写入、为0则是空地板、其他数则为id，[1]地板x，[2]地板y
            local reuIntArr = CJNBattleMgr.Instance:RayGoInFloor(self.dragRole.myAni.gameObject,0,0,self.dragRole.GameID,self.dragRole.Occupation)
            if CJNBattleMgr.Instance.worldBossBattle then

            else
                if TeamCount > StormViewModel.CurPointData.playerNumber then
                    if reuIntArr[0] == 0 then
                        ---更新地板数据
                        BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                        ---更新人物数据
                        self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                    end
                    if reuIntArr[0] ~= -1 then
                        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips6"),1},true)
                    end
                    reuIntArr[0] = -1
                end
            end
            ---月塔0血不能放上去
            if StormViewModel.CurPointType == StormViewModel.PointType.monthTower then
                local herosHP = YueTaViewModel.GetServerData().towerHero
                if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
                    herosHP = YueTaViewModel.GetServerData().innerTowerHero
                end
                if herosHP then
                    for i = 1, #herosHP do
                        if herosHP[i].hP == 0 and tonumber(self.dragRole.ID) == herosHP[i].heroID then
                            reuIntArr[0] = -1
                            break
                        end
                    end
                end
            end

            if reuIntArr[0] == -1
            then
                ---移除总队列
                --for i, v in pairs(BattleManager.AllRole) do
                --    if v.GameID == self.dragRole.GameID then
                --        table.remove(BattleManager.AllRole,i)
                --        break
                --    end
                --end
                if BattleManager.AllRole[self.dragRole.GameID] then
                    BattleManager.AllRole[self.dragRole.GameID] = nil
                end
                ---移除左侧队列
                for i, v in pairs(BattleManager.LeftTeam) do
                    if v.GameID == self.dragRole.GameID then
                        table.remove(BattleManager.LeftTeam,i)
                        break
                    end
                end
                ---更新左侧队列顺序
                BattleManager.SetOrderAfter(self.dragRole)
                ---删除拖拽角色
                GameObject.Destroy(self.dragRole.myAni.gameObject)
                ---更新顺序
                self:ReloadOrder(false)
                ---更新地板
                CJNBattleMgr.Instance:SetAllEmptyFloorHid()

                ---添加到滑块数据
                if self.dragRole.userID then
                    StormViewModel.AddFriendHeroData(tonumber(self.dragRole.ID .. self.dragRole.userID))
                else
                    StormViewModel.AddHeroData(tonumber(self.dragRole.ID))
                end
                ---刷新滑块UI
                self:ReloadSelectRole(self.dragRole.ID)

            elseif reuIntArr[0] == 0
            then
                ---重新设置xy并更新位置
                self.dragRole.PosX = reuIntArr[1]
                self.dragRole.PosY = reuIntArr[2]
                ---更新地板数据
                BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                ---更新人物数据
                self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
            else
                ---交换角色位置
                ---获取目标位置角色
                if BattleManager.GameIdCout > #BattleManager.AllRole then
                    BattleManager.GameIdCout = BattleManager.GameIdCout - 1
                end
                local targetRole = BattleManager.AllRole[reuIntArr[0]]
                ---先清空目标地板数据
                BattleManager.ChessboardLeft[targetRole.PosY][targetRole.PosX] = 0
                targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, 0, 0)
                ---交换位置坐标
                local tempPosX = targetRole.PosX
                local tempPosY = targetRole.PosY
                targetRole.PosX = self.dragRole.PosX
                targetRole.PosY = self.dragRole.PosY
                self.dragRole.PosX = tempPosX
                self.dragRole.PosY = tempPosY
                ---更新拖拽角色地板信息
                BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                ---更新目标地板信息
                BattleManager.ChessboardLeft[targetRole.PosY][targetRole.PosX] = targetRole
                targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
            end
            ---更新提示
            self:UpdateTips(1)
            ---下一帧更新所有地板
            MgrTimer.AddDelayNoName(0.01,function()
                CJNBattleMgr.Instance:SetAllFloorHid()
            end,nil)
            ---将单次检测插值设为开启
            self.isOnceDrag = true
            ---清空dragRole
            self.dragRole = nil
            ---还原uiItem位置
            self.UIDragItem.transform.localPosition = Vector3(0,10000,0)
        end
        ---结束显示攻击范围及羁绊
        CJNBattleMgr.Instance:EndLine()
        ---还原角色透明度
        for i, role in pairs(BattleManager.AllRole) do
            role.myAni:SetAlpha(1)
        end
    elseif self.CurMode == 2
    then
        ---设置排序模式
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---获取位置是否存在角色
            local floorRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
            ---对比位置是否移动
            local isMove = self.dragRole.GameID == floorRoleId
            ---移动了则显示回问号，否则显示当前顺序
            local order = isMove and self.CurAtkOrderIndex or -1
            self.dragRole.myAni:SetOrder(order, self.dragRole.IsLeft, true)
            if isMove then
                ---未移动则更新到角色数据里
                ---与当前索引位角色交换位置
                for i, role in pairs(BattleManager.AllRole) do
                    if role.IsLeft == true then
                        if role.AtkOrder == self.CurAtkOrderIndex then
                            ---交换出手顺序
                            role.AtkOrder = self.dragRole.AtkOrder
                            self.dragRole.AtkOrder = self.CurAtkOrderIndex
                            ---AllRole中的两者GameID和位置也要互换
                            local dragRoleGameID = self.dragRole.myAni.GameID
                            self.dragRole.myAni.GameID = role.myAni.GameID
                            role.myAni.GameID = dragRoleGameID

                            self.dragRole.GameID = role.GameID
                            role.GameID = dragRoleGameID

                            ---更新地板数据
                            BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                            BattleManager.ChessboardLeft[role.PosY][role.PosX] = role
                            ---更新上阵人物排序
                            BattleManager.AllRole[self.dragRole.GameID] = self.dragRole
                            BattleManager.AllRole[role.GameID] = role
                            BattleManager.LeftTeam[self.dragRole.AtkOrder] = self.dragRole
                            BattleManager.LeftTeam[role.AtkOrder] = role
                            ---更新人物数据
                            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                            role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
                            ---保存完成索引设置的id
                            self.FinishOrder[self.dragRole.GameID] = true
                            ---当前所有自增
                            self.CurAtkOrderIndex = self.CurAtkOrderIndex + 1
                            break
                        end
                    end
                end
            end
        end
    elseif self.CurMode == 3
    then
        ---设置交换排序模式
        ---是否抓取了角色
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---获取结束位置是否存在角色，返回角色ID
            local floorRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
            if floorRoleId > 0 then
                ---对比位置是否相同
                if self.dragRole.GameID == floorRoleId then
                else
                    ---不同执行交换
                    ---获取目标位置角色
                    local targetRole = nil
                    for i, role in pairs(BattleManager.AllRole) do
                        if role.IsLeft and role.GameID == floorRoleId then
                            targetRole = role
                        end
                    end
                    if targetRole ~= nil then
                        ---交换攻击顺序
                        local atkOrder = targetRole.AtkOrder
                        targetRole.AtkOrder = self.dragRole.AtkOrder
                        self.dragRole.AtkOrder = atkOrder
                        ---刷新攻击顺序
                        self.dragRole.myAni:SetOrder(self.dragRole.AtkOrder, self.dragRole.IsLeft, true)
                        targetRole.myAni:SetOrder(targetRole.AtkOrder, targetRole.IsLeft, true)
                        ---AllRole中的两者GameID和位置也要互换
                        local dragRoleGameID = self.dragRole.GameID
                        --self.dragRole.myAni.GameID = targetRole.myAni.GameID
                        --targetRole.myAni.GameID = dragRoleGameID

                        self.dragRole.GameID = targetRole.GameID
                        targetRole.GameID = dragRoleGameID
                        self.dragRole.myAni.GameID = self.dragRole.GameID
                        targetRole.myAni.GameID = targetRole.GameID
                        ---更新地板数据
                        BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                        BattleManager.ChessboardLeft[targetRole.PosY][targetRole.PosX] = targetRole

                        BattleManager.AllRole[self.dragRole.GameID] = self.dragRole
                        BattleManager.AllRole[targetRole.GameID] = targetRole
                        BattleManager.LeftTeam[self.dragRole.AtkOrder] = self.dragRole
                        BattleManager.LeftTeam[targetRole.AtkOrder] = targetRole

                        ---更新左侧队列顺序
                        -----设置地板GameID
                        targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                        self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                    end
                end
            end
            if self.sortingType == 1 then
                ---刷新队列顺序
                self:ReloadOrder(true)
            elseif self.sortingType == 2 then
                BattleManager.Rank()
                ---给每个角色根据左右位置加动画
                for i, role in pairs(BattleManager.AllRole) do
                    role.myAni:SetOrder(role.AllAtkOrder,role.IsLeft, true)
                end
            end
            if self.dragRoleAtkOder ~= nil then
                local dragCanvas = self.dragRoleAtkOder:GetComponent("Canvas")
                dragCanvas.sortingOrder = dragCanvas.sortingOrder - 1
            end
        end
    end
    ---清空抓取池
    self.dragRole = nil
    self.ShowRoleId = nil
    self.dragRoleAtkOder = nil
    ---滑动屏幕模式关闭
    CJNBattleMgr.Instance:CameraMoveOpenAndClose(false)
end
---初始化UI
function M:InitBattleUI()
    self.ClickMask().gameObject:SetActive(false)
    self.Tiaoguo().gameObject:SetActive(false)
    self.PointInfopop().gameObject:SetActive(false)
    self.CangwuTexingpop().gameObject:SetActive(false)

    ---注册隐藏角色信息面板
    --UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
    --    if self.CurRoleInfo then
    --    else
    --        self:ShowRoleInfo()
    --    end
    --end)
    UIEvent.LuaClick(self.Btn_Chakan01().gameObject,function()
        local role = HeroControl.GetRoleDataByID(tonumber(self.CurRoleInfo.ID))
        if role == nil then
            role = MonsterControl.GetMonster(tonumber(self.CurRoleInfo.ID))
        end
        MgrUI.Pop(UID.RoleInfoPausePop_UI,{false,role,self.CurRoleInfo,0})
    end)

    ---Boss分数重置
    self:ScorePanel()
    ---显示关卡任务信息,获得的星数
    self:StarPanel()
    ---初始隐藏角色信息面板
    self.Panel_RoleInfo = self.Panel_RoleInfo().gameObject
    self.Panel_RoleInfo:SetActive(false)
    ---角色信息星底框
    self.rIStarNor = {
        [1] = self.RIStar_1().transform:Find("Normal").gameObject,
        [2] = self.RIStar_2().transform:Find("Normal").gameObject,
        [3] = self.RIStar_3().transform:Find("Normal").gameObject,
        [4] = self.RIStar_4().transform:Find("Normal").gameObject,
        [5] = self.RIStar_5().transform:Find("Normal").gameObject,
        [6] = self.RIStar_6().transform:Find("Normal").gameObject,
    }
    ---角色信息星高亮
    self.rIStarHl = {
        [1] = self.RIStar_1().transform:Find("HighLight").gameObject,
        [2] = self.RIStar_2().transform:Find("HighLight").gameObject,
        [3] = self.RIStar_3().transform:Find("HighLight").gameObject,
        [4] = self.RIStar_4().transform:Find("HighLight").gameObject,
        [5] = self.RIStar_5().transform:Find("HighLight").gameObject,
        [6] = self.RIStar_6().transform:Find("HighLight").gameObject,
    }
    ---觉醒星
    self.superStars = {
        [1] = self.Super().gameObject,
        [2] = self.Super1().gameObject,
        [3] = self.Super2().gameObject,
        [4] = self.Super3().gameObject,
        [5] = self.Super4().gameObject,
        [6] = self.Super5().gameObject,
    }
    ---角色信息觉醒节点
    self.rIAwaken = self.RIAwaken().gameObject
    ---当前排序类型(1等级，2星级，3取得时间, 4稀有度，5好感度)
    self.CurCardSort = 1
    ---当前筛选类型true为开启项(0全部，1护卫，2强击，3轰炸，4支援 与配置表一致)
    self.CurCardFilter = {
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [11] = false
    }
    ---当前升降序(true升序，false降序)
    self.CurCardRise = true
    ---注册退出
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        SummerControl.SetBossLevel()
        ActivityControl.SetBossLevel()
        BattleManager.CurActivityBossHp = 0
        ---关闭点击检测
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrTimer.Cancel("BattleUIUpdate")
        BattleManager.ClearLuaData()
        print("退出战斗")
        ---结束战斗界面
        if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
            StormViewModel.CloseWorldBossBattle()
        elseif BattleManager.GameMode == BattleManager.GameModeType.PVP then

        else
            StormViewModel.curSelectData = StormViewModel.GetSelectLastCheckPoint(StormViewModel.curSelectData)
            StormViewModel.CloseBattle()
        end
    end))
    ---下标和回合数字对应
    self.List_Index_IconTex={}
    ---下标和游戏物体对应
    self.List_Index_GoIcon={}
    ---Boss下标和回合数字对应
    self.List_Index_IconTex_Boss={}
    ---Boss下标和游戏物体对应
    self.List_Index_GoIcon_Boss={}
    ---要显示的图片
    self.List_Name={}
    ---要显示的回合数
    self.List_Turn={}
    self.List_Index={}
    ---生命值
    self.Uidata_Hp=0
    ---生命值上限
    self.Uidata_HpMax=1
    ---攻击力或者支援力万分比
    self.Uidata_AtkOrSup=0
    ---基础值 仅同步一次
    self.Uidata_AtkOrSup_Base=1
    ---闪避率
    self.Uidata_Def=0
    self.Uidata_Cirt=0
    self.Uidata_CirtDmg=0
    self.Uidata_Agi=0
    ---将角色信息栏注册到C#实时更新
    self:SetCFun()
    ---初始化速度
    self.m_imgSpeeds = {
        self.Img_Speedx1().gameObject,
        self.Img_Speedx2().gameObject,
        self.Img_Speedx3().gameObject,
    }
    local speed = SettingViewModel.GetBattleSpeed();
    for i, img in pairs(self.m_imgSpeeds) do
        img:SetActive(speed == i)
    end
    ---注册播放速度按钮
    UIEvent.LuaClick(self.Btn_Speed().gameObject,function()
        self.Btn_Speed():GetComponent("RawImage").raycastTarget = false
        MgrTimer.AddDelayNoName(0.4,function()
            self.Btn_Speed():GetComponent("RawImage").raycastTarget = true
        end,nil)
        local newSpeed = SettingViewModel.AddBattleSpeed();
        CJNUIMgr.SetUIDoScale(self.m_imgSpeeds[newSpeed],0,0.2,2,1,1,1.5,1.5)
        CJNUIMgr.SetUIDoScale(self.m_imgSpeeds[newSpeed],0.2,0.2,2,1.5,1.5,1,1)
        for i, img in pairs(self.m_imgSpeeds) do
            img:SetActive(newSpeed == i)
        end
    end)
    ---注册暂停按钮
    if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
        --self.Img_SupportLock().gameObject:SetActive(false)
        --self.Btn_FriendRole().gameObject:SetActive(false)
        --self.Text_FriendRole().gameObject:SetActive(false)

        self.RoleType().gameObject:SetActive(false)
        self.Btn_OpenFilter().transform.anchoredPosition = Vector2(-90,137.2)
        UIEvent.LuaClick(self.Btn_Pause().gameObject,function()
            CJNBattleMgr.Instance.IsPause = true
            ---隐藏角色信息面板
            self:ShowRoleInfo()
            MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole,2},true)
        end)
        if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss then
            self.Img_Tilixiaohaodi().gameObject:SetActive(true)
            self.Text_PowerConsume().gameObject:SetActive(true)
            self.Img_Tiliicon().gameObject:SetActive(true)
            self.Text_BossConsume().gameObject:SetActive(true)
        else
            self.Img_Tilixiaohaodi().gameObject:SetActive(false)
            self.Text_PowerConsume().gameObject:SetActive(false)
            self.Img_Tiliicon().gameObject:SetActive(false)
            self.Text_BossConsume().gameObject:SetActive(false)
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.PVP then
        UIEvent.LuaClick(self.Btn_Pause().gameObject,function()
            CJNBattleMgr.Instance.IsPause = true
            MgrUI.Pop(UID.PVPPause_UI,{BattleManager.AllRole,1},true)
            ---隐藏角色信息面板
            self:ShowRoleInfo()
        end)
    elseif BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP then
        UIEvent.LuaClick(self.Btn_Pause().gameObject,function()
            CJNBattleMgr.Instance.IsPause = true
            MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole,3},true)
            ---隐藏角色信息面板
            self:ShowRoleInfo()
        end)
    else
        UIEvent.LuaClick(self.Btn_Pause().gameObject,function()
            CJNBattleMgr.Instance.IsPause = true
            ---隐藏角色信息面板
            self:ShowRoleInfo()
            MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole, 1},true)
        end)
    end
    ---固定相机按钮
    if SettingViewModel.GetCameraMove() == 1 then
        self.Text_Jingtou().gameObject:SetActive(true)
        self.ZiyouJingtouicon().gameObject:SetActive(true)
        self.GudingJingtouicon().gameObject:SetActive(false)
        self.Text_Jingtouguanbi().gameObject:SetActive(false)
    else
        self.Text_Jingtou().gameObject:SetActive(false)
        self.ZiyouJingtouicon().gameObject:SetActive(false)
        self.GudingJingtouicon().gameObject:SetActive(true)
        self.Text_Jingtouguanbi().gameObject:SetActive(true)
    end
    UIEvent.LuaClick(self.Btn_Jintouqiehuan().gameObject,function()
        if SettingViewModel.GetCameraMove() == 1 then
            SettingViewModel.SetCameraMove(2)
            MgrCamera.BackToAllCamera()
            self.Text_Jingtou().gameObject:SetActive(false)
            self.ZiyouJingtouicon().gameObject:SetActive(false)
            self.GudingJingtouicon().gameObject:SetActive(true)
            self.Text_Jingtouguanbi().gameObject:SetActive(true)
        else
            SettingViewModel.SetCameraMove(1)
            self.Text_Jingtou().gameObject:SetActive(true)
            self.ZiyouJingtouicon().gameObject:SetActive(true)
            self.GudingJingtouicon().gameObject:SetActive(false)
            self.Text_Jingtouguanbi().gameObject:SetActive(false)
        end
    end)
    ---EX技能
    if SettingViewModel.GetExAnim() == 1 then
        self.Text_On().gameObject:SetActive(true)
        self.Text_Off().gameObject:SetActive(false)
        self.Text_Once().gameObject:SetActive(false)
    else if SettingViewModel.GetExAnim() == 2 then
        self.Text_On().gameObject:SetActive(false)
        self.Text_Off().gameObject:SetActive(false)
        self.Text_Once().gameObject:SetActive(true)
    else
        self.Text_On().gameObject:SetActive(false)
        self.Text_Off().gameObject:SetActive(true)
        self.Text_Once().gameObject:SetActive(false)
    end
    end
    UIEvent.LuaClick(self.Btn_EX().gameObject,function()
        local value = SettingViewModel.AddExAnim()
        if value == 1 then
            self.Text_On().gameObject:SetActive(true)
            self.Text_Off().gameObject:SetActive(false)
            self.Text_Once().gameObject:SetActive(false)
        else if value == 2 then
            self.Text_On().gameObject:SetActive(false)
            self.Text_Off().gameObject:SetActive(false)
            self.Text_Once().gameObject:SetActive(true)
        else
            self.Text_On().gameObject:SetActive(false)
            self.Text_Off().gameObject:SetActive(true)
            self.Text_Once().gameObject:SetActive(false)
        end
        end
    end)
    UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
        self:CloseSkillXiangqing()
        self:CloseBossHpBar(true)
    end)
    ---关闭技能详情面板
    self:CloseSkillXiangqing()
    ---按钮开关
    if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss
    then
        UIEvent.LuaClick(self.Tiaoguo1().gameObject,function()
            if BattleViewModel.JumpOut then
                return
            end
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("battle02_ui_tips1"),function()
                ---战斗设置为跳过
                if BattleViewModel.JumpOut then
                    return
                end
                BattleViewModel.JumpOut = true
                BattleViewModel.PausePhase = nil
                --BattleViewModel.GiveUp = BattleViewModel.giveUp.GIVE_UP
                ---销毁战斗数据
                CJNBattleMgr.SetGameSpeed(1)
                ---回合结束结算
                BattleViewModel.ReturnToMainScene()
            end,nil,2},true)
        end)
        local tWorldBoss = EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel]
        self.Btn_Guankaxinxi().gameObject:SetActive(false)
        self.Btn_BossInfo().gameObject:SetActive(true)
        if EventRaidControl.GetLIANHETAOFAData().BossData[1].prohibit ~= "0" then
            self.Btn_BanSkill().gameObject:SetActive(true)
        else
            self.Btn_BanSkill().gameObject:SetActive(false)
        end
        if tWorldBoss.ContinuousCombatType == BattleManager.MonsterStandType.MONSTER_BOSS then
            self.Btn_BossInfo().gameObject:SetActive(false)
        else
            self.Btn_BossInfo().gameObject:SetActive(true)
        end
        self.Panel_VSInfo().gameObject:SetActive(false)
        self.Btn_Tiaoguo().gameObject:SetActive(false)
        self.Btn_Tiaoguo1().transform.localPosition = self.Btn_Tiaoguo().transform.localPosition
    elseif BattleManager.GameMode == BattleManager.GameModeType.PVP
    then
        self.Panel_Ready().gameObject:SetActive(false)
        self.Panel_Fighting().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Tiaoguo().gameObject,function()
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("battle02_ui_tips1"),function()
                ---战斗设置为跳过
                BattleViewModel.JumpOut = true
                BattleViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
                ---连续作战结束
                PVPViewModel.continue = false
                PVPViewModel.continueCount = 0
                ---回合结束结算
                BattleViewModel.ReturnToMainScene()
            end,nil,2},true)
        end)
        self.Panel_VSInfo().gameObject:SetActive(true)
        self.Btn_Tiaoguo().gameObject:SetActive(true)
        self.Btn_Guankaxinxi().gameObject:SetActive(false)
        self.Btn_BossInfo().gameObject:SetActive(false)
        self.Btn_BanSkill().gameObject:SetActive(false)
        if PVPViewModel.PlayerIsAtk then
            self.Text_ATKName().text = PVPViewModel.OwnInfo.name
            self.Text_ATKScore().text = PVPViewModel.OwnInfo.score

            self.Text_DEFNmae().text = PVPViewModel.TargetInfo.name
            self.Text_DEFScore().text = PVPViewModel.TargetInfo.score
        else
            self.Text_ATKName().text = PVPViewModel.TargetInfo.name
            self.Text_ATKScore().text = PVPViewModel.TargetInfo.score

            self.Text_DEFNmae().text = PVPViewModel.OwnInfo.name
            self.Text_DEFScore().text = PVPViewModel.OwnInfo.score
        end
        ---加载段位图片
        if PVPViewModel.GetViewRecordsCount() > 1 then
            self.Panel_VSInfo().gameObject:SetActive(false);
        else
            self.Panel_VSInfo().gameObject:SetActive(true);
            MgrRes.LoadSprite(self.DEFIcon(),self:GetRankIcon(PVPViewModel.TargetInfo.rankLevel))
            MgrRes.LoadSprite(self.ATKIcon(),self:GetRankIcon(PVPViewModel.OwnInfo.rankLevel))
        end
        return
    elseif BattleManager.GameMode == BattleManager.GameModeType.FriendPVP
    then
        self.Panel_Ready().gameObject:SetActive(false)
        self.Panel_Fighting().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Tiaoguo1().gameObject,function()
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("battle02_ui_tips1"),function()
                ---战斗设置为跳过
                BattleViewModel.JumpOut = true
                BattleViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
                ---连续作战结束
                PVPViewModel.continue = false
                PVPViewModel.continueCount = 0
                ---回合结束结算
                BattleViewModel.ReturnToMainScene()
            end,nil,2},true)
        end)
        self.Panel_VSInfo().gameObject:SetActive(false)
        self.Btn_Tiaoguo().gameObject:SetActive(false)
        self.Btn_Tiaoguo1().gameObject:SetActive(true)
        self.Btn_Guankaxinxi().gameObject:SetActive(false)
        self.Btn_BossInfo().gameObject:SetActive(false)
        self.Btn_BanSkill().gameObject:SetActive(false)
        return
    elseif BattleManager.GameMode == BattleManager.GameModeType.Guide
    then
        ---关卡信息按钮隐藏
        self.Panel_VSInfo().gameObject:SetActive(false)
        self.Btn_Tiaoguo().gameObject:SetActive(false)
        self.Btn_Guankaxinxi().gameObject:SetActive(false)
        if BattleManager.HaveBoss() then
            self.Btn_BossInfo().gameObject:SetActive(true)
            if StormViewModel.CurPointData.banSkill ~= "0" then
                self.Btn_BanSkill().gameObject:SetActive(true)
            else
                self.Btn_BanSkill().gameObject:SetActive(false)
            end
        else
            self.Btn_BossInfo().gameObject:SetActive(false)
            self.Btn_BanSkill().gameObject:SetActive(false)
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.MonthTower
    then
        UIEvent.LuaClick(self.Tiaoguo1().gameObject,function()
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("battle02_ui_tips1"),function()
                ---战斗设置为跳过
                BattleViewModel.JumpOut = true
                BattleViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
                ---回合结束结算
                BattleViewModel.ReturnToMainScene()
            end,nil,2},true)
        end)
        self.Panel_VSInfo().gameObject:SetActive(false)
        self.Btn_Tiaoguo().gameObject:SetActive(false)
        self.Btn_Guankaxinxi().gameObject:SetActive(false)
        self.Btn_BossInfo().gameObject:SetActive(false)
        if StormViewModel.CurPointData.banSkill ~= "0" then
            self.Btn_BanSkill().gameObject:SetActive(true)
        else
            self.Btn_BanSkill().gameObject:SetActive(false)
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP then
        self.Panel_Ready().gameObject:SetActive(false)
        self.Panel_Fighting().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Tiaoguo().gameObject,function()
            if BattleViewModel.JumpOut then
                return
            end
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("battle02_ui_tips1"),function()
                ---战斗设置为跳过
                BattleViewModel.JumpOut = true
                BattleViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
                BattleViewModel.JumpOut = true
                ---连续作战结束
                PVPViewModel.continue = false
                PVPViewModel.continueCount = 0
                ---回合结束结算
                BattleViewModel.ReturnToMainScene()
            end,nil,2},true)
        end)
        self.Panel_VSInfo().gameObject:SetActive(false)
        self.Btn_Tiaoguo().gameObject:SetActive(true)
        self.Btn_Guankaxinxi().gameObject:SetActive(false)
        self.Btn_BossInfo().gameObject:SetActive(false)
        self.Btn_BanSkill().gameObject:SetActive(false)
        return
    else
        self.Panel_VSInfo().gameObject:SetActive(false)
        self.Btn_Tiaoguo().gameObject:SetActive(false)
        self.Btn_Guankaxinxi().gameObject:SetActive(true)
        if BattleManager.HaveBoss() then
            self.Btn_BossInfo().gameObject:SetActive(true)
            if StormViewModel.CurPointData.banSkill ~= "0" then
                self.Btn_BanSkill().gameObject:SetActive(true)
            else
                self.Btn_BanSkill().gameObject:SetActive(false)
            end
        else
            self.Btn_BossInfo().gameObject:SetActive(false)
            if StormViewModel.CurPointData.banSkill ~= "0" then
                self.Btn_BanSkill().gameObject:SetActive(true)
            else
                self.Btn_BanSkill().gameObject:SetActive(false)
            end
        end
    end
    ---二次战斗
    if StormViewModel.CurPointData ~= nil and (StormViewModel.CurPointData.ContinuousCombatType > 4) or
            (CJNBattleMgr.Instance.worldBossBattle and EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel] and EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel].ContinuousCombatType > 4) then
        self.Btn_SecondWar().gameObject:SetActive(true)
    else
        self.Btn_SecondWar().gameObject:SetActive(false)
    end
    ---拖拽显示UIItem
    self.UIDragItem = self.BattleRoleItem()
    ---获取关卡英雄数据
    StormViewModel.GetHeroData()
    ---获取好友支援数据
    if not CJNBattleMgr.Instance.worldBossBattle then
        FriendViewModel.GetSupportData()
    end

    ---战术指导没有助战
    if BattleManager.GameMode == BattleManager.GameModeType.RedTower or BattleManager.GameMode == BattleManager.GameModeType.Guide or BattleManager.GameMode == BattleManager.GameModeType.MonthTower then
        self.RoleType().gameObject:SetActive(false)
        self.Btn_OpenFilter().transform.anchoredPosition = Vector2(-90,137.2)
        self.Btn_Chongzhizhuangtai().transform.anchoredPosition = Vector2(135,137.2)
    end
    if BattleManager.GameMode == BattleManager.GameModeType.MonthTower then
        self.Btn_Chongzhizhuangtai().gameObject:SetActive(true)
    else
        self.Btn_Chongzhizhuangtai().gameObject:SetActive(false)
    end

    ---点击帮助按钮S
    --UIEvent.LuaClick(self.Btn_I().gameObject,function ()
    --    HelpViewModel.Go(1001)
    --end)
    ---打开排序窗口
    UIEvent.LuaClick(self.Btn_OpenFilter().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.SortFilterPop_UI,{function(filter,sort,rise)
            ---获取排序规则
            self.CurCardFilter = filter
            self.CurCardSort = sort
            self.CurCardRise = rise
            ---刷新UI
            self:ReloadSelectRole(0)
            ---关闭人物信息
            self:ShowRoleInfo()
        end,2},true)
    end))
    ---移除左侧场上所有角色
    UIEvent.LuaClick(self.Btn_Remove().gameObject,Handle(self,function ()
        self:ReMoveAllLeft()
        ---关闭人物信息
        self:ShowRoleInfo()
        self:UpdateTips(1)
    end))
    ---初始化提示信息
    self.text_Tips = self.Text_Tips()
    ---获取提示栏group
    self.tipsGroup = self.Img_Tips().gameObject:GetComponent("CanvasGroup")
    ---初始化下方信息面板
    local panel_BtmInfos = {
        [1] = self.Panel_Replace().gameObject,
        --[2] = self.Panel_Sort().gameObject,
    }
    ---初始化坐下角色类型(持有，助战)
    self.tog_RoleTypeNH = {
        [1] = self.Img_supportType().transform:Find("Img_HighLight").gameObject,
        [2] = self.Img_supportType().transform:Find("Img_HighLight2").gameObject,
    }
    self.tog_RoleTypeNH[1]:SetActive(true)
    self.tog_RoleTypeNH[2]:SetActive(false)
    UIEvent.LuaClick(self.Btn_ShowRole().gameObject,Handle(self,self.ShowRole))
    UIEvent.LuaClick(self.Btn_FriendRole().gameObject,Handle(self,self.ShowFriendSupportRole))

    ---默认是自己的阵容
    self.tog_RoleTypeNH[1]:SetActive(true)
    self.tog_RoleTypeNH[2]:SetActive(false)
    StormViewModel.FriendSupport = false

    ---左侧选取栏高亮_新
    self.LineUpOrOrder = 1
    self.OrderBtns().gameObject:SetActive(false)
    self.CurMode = 1
    UIEvent.LuaClick(self.Btn_Qiehuan().gameObject,Handle(self,self.ChangeLeftButton))

    ---*月塔关卡血量重置按钮/Buff信息显示按钮
    self.Panel_Select2().gameObject:SetActive(false)    --展示头顶血条暂时无法实现，先关闭
    if StormViewModel.CurPointType == StormViewModel.PointType.monthTower then
        self.HpShowOn = false
        UIEvent.LuaClick(self.Btn_Chongzhizhuangtai().gameObject,Handle(self,self.HpShowPop))
        UIEvent.LuaClick(self.Btn_Buff().gameObject,Handle(self,function() self:ShowBuff(true) end))
        UIEvent.LuaClick(self.Buff_BlurMask().gameObject,Handle(self,function() self:ShowBuff(false) end))

        local tResetHeroLimit = YueTaViewModel.ResetCountTime()
        local tResetHeroCount = YueTaViewModel.ResetCountTime()-YueTaViewModel.GetServerData().heroResetCount
        if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
            tResetHeroLimit = YueTaViewModel.GetHardResetHeroLimit()
            tResetHeroCount = YueTaViewModel.GetHardResetHeroLimit()-YueTaViewModel.GetServerData().innerHeroResetCnt
        end
        self.Text_Chongzhizhuangtai().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_1"),tResetHeroCount,tResetHeroLimit)
        self.Text_Buff().text = MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_2")
        self.Btn_Chongzhizhuangtai().gameObject:SetActive(true)
        self.Btn_Buff().gameObject:SetActive(true)
        self.Btn_HpDisplay_H().gameObject:SetActive(false)
    else
        self.Btn_Chongzhizhuangtai().gameObject:SetActive(false)
        self.Btn_Buff().gameObject:SetActive(false)
    end

    self.ScrollMask().gameObject:SetActive(false)
    ---注册替换队员滑块
    self.selectRoleLoop = self.LoopScrollRole01()
    self.selectRoleLoop:SetLuaCellEvent(Handle(self,self.CellSelectRole))
    self.BuffScroll01():SetLuaCellEvent(Handle(self,self.CellBuff))
    self.selectRoleRect = self.selectRoleLoop.transform:GetComponent("RectTransform")

    ---默认关闭高亮
    self.Btn_Altogether_H().gameObject:SetActive(false)
    self.Btn_Separate_H().gameObject:SetActive(true)
    ---注册查看敌我双方顺序按钮
    UIEvent.LuaClick(self.Btn_Separate().gameObject,function()
        self:ReloadOrder(true)      --重载顺序
        ---开启交换排序模式
        self.CurMode = 3
        ---分别排序模式
        self.sortingType = 1
        ---高亮显示
        self.Btn_Altogether_H().gameObject:SetActive(false)
        self.Btn_Separate_H().gameObject:SetActive(true)
    end)
    ---注册查看整体顺序按钮
    UIEvent.LuaClick(self.Btn_Altogether().gameObject,function()
        ---查看整体顺序
        BattleManager.Rank()
        ---给每个角色根据左右位置加动画
        for i, role in pairs(BattleManager.AllRole) do
        role.myAni:SetOrder(role.AllAtkOrder,role.IsLeft, true)
        end
        ---开启交换排序模式
        self.CurMode = 3
        ---一起排序模式
        self.sortingType = 2
        ---高亮显示
        self.Btn_Altogether_H().gameObject:SetActive(true)
        self.Btn_Separate_H().gameObject:SetActive(false)
    end)

    if StormViewModel.CurPointType == StormViewModel.PointType.guide then
    ---若为战术指导取消队伍
    --self.Text_Rormation().text = string.format("<color=#444444>阵型存取</color>")
    else
    ---注册阵型显示按钮
    UIEvent.LuaClick(self.Btn_Rormation().gameObject,function()
        if StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.type == 999 then
            return
        end
    local m = self.CurMode
    self.CurMode = 0
    self:ShowRoleInfo()
    ---@type FighterBase[] 创建当前使用的阵型数据
    local fighters = {}
        for i, role in pairs(BattleManager.AllRole) do
            if role.IsLeft == true and role.userID == nil then
                ---@type FighterBase
                local fighter = {}
                ---设置位置
                fighter.index = (6 - role.PosX) * 3 + role.PosY
                ---设置id
                fighter.roleID = tonumber(role.ID)
                ---加入数据池
                fighters[#fighters + 1] = fighter
            end
        end
        MgrUI.Pop(UID.TeamGroupPop_UI,{fighters,function()
            ---返回回调
            self.CurMode = m
        end,function(idx)
            ---改变阵型回调
            self:LoadTeamRole(idx,0)
        end},true)
    end)
    end
    ---注册HP显示隐藏按钮
    --self.Btn_HP().gameObject:SetActive(false)
    --self.Btn_UI().gameObject:SetActive(false)
    ---设置开始按钮处体力/活动Boss战显示Boss挑战券
    if CJNBattleMgr.Instance.worldBossBattle then
        self.Text_BossConsume().text = MgrLanguageData.GetLanguageByKey("worldboss_ui_tips9")
        self.Text_PowerConsume().gameObject:SetActive(false)
        self.Img_Tiliicon().gameObject:SetActive(false)
    else
        self.Text_BossConsume().gameObject:SetActive(false)
        if BattleManager.GameMode == BattleManager.GameModeType.MonthTower then

            self.Img_Tilixiaohaodi().gameObject:SetActive(false)
            self.Text_PowerConsume().gameObject:SetActive(false)
            self.Text_BossConsume().gameObject:SetActive(false)
        else
            local count = PlayerControl.GetVigor()
            local vigor = 0
            if StormViewModel.CurPointData.consume then
                local consume = string.split(StormViewModel.CurPointData.consume,"_")
                count = tonumber(consume[2]) == 100001 and PlayerControl.GetVigor() or ItemControl.GetItemByIdAndType(tonumber(consume[2]),tonumber(consume[1])).count
                MgrRes.LoadSprite(self.Img_Tiliicon(), ItemControl.GetItemByIdAndType(tonumber(consume[2]),tonumber(consume[1])).icon)
                vigor = StormViewModel.CurPointData.consume and tonumber(string.split(StormViewModel.CurPointData.consume,"_")[3]) or 0
            end
            if count < vigor then
                self.Text_PowerConsume().text = string.format(MgrLanguageData.GetLanguageByKey("battle_ui_tips8"),count,vigor)
            else
                self.Text_PowerConsume().text = string.format(MgrLanguageData.GetLanguageByKey("battle_ui_tips7"),count,vigor)
            end
        end
    end
    ---活动关卡,去掉关卡序号
    if StormViewModel.CurPointData ~= nil and (StormViewModel.CurPointData.type >= StormViewModel.PointBattleType.ACTIVITY_NEWBOSS and StormViewModel.CurPointData.type <= StormViewModel.PointBattleType.ACTIVITY_SEAT) then
        self.PointIdxNamedi().gameObject:SetActive(false)
        self.Text_ResPointName().transform.sizeDelta = Vector2(660, 80)
    end
    ---设置关卡信息
    if not CJNBattleMgr.Instance.worldBossBattle then
        if StormViewModel.CurPointType == StormViewModel.PointType.guide then
            self.Text_ResPointName().text = string.format("%s",StormViewModel.CurPointData.guideName)
            self.Text_ResPointIdxName().text = ""
        else
            self.Text_ResPointName().text = StormViewModel.CurPointData.name
            self.Text_ResPointIdxName().text = StormViewModel.CurPointData.idxName
        end
    end

    ---场上队伍
    self.SecondWar_CurrentTeam = 1  --默认设置当前为第一场
    UIEvent.LuaClick(self.Btn_SecondWar().gameObject,function()
        ---隐藏排序图标
        BattleManager.HideOrder()
        if self.SecondWar_CurrentTeam == 1 then --当前为第一场站位
            self.SecondWar_CurrentTeam = 2
        else                                --当前为第二场站位
            self.SecondWar_CurrentTeam = 1
        end
        local tWorldBoss = EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel]
        if StormViewModel.CurPointData and StormViewModel.CurPointData.ContinuousCombatType ~= 0 then    --连战类型 开启boss信息按钮、禁止技能按钮
            if tonumber(StormViewModel.CurPointData.ContinuousCombatType) == 1 then
                self.Btn_BossInfo().gameObject:SetActive(false)
                self.Btn_BanSkill().gameObject:SetActive(false)
            elseif tonumber(StormViewModel.CurPointData.ContinuousCombatType) == 2 then
                if self.SecondWar_CurrentTeam == 1 then
                    self.Btn_BossInfo().gameObject:SetActive(false)
                    self.Btn_BanSkill().gameObject:SetActive(false)
                else
                    self.Btn_BossInfo().gameObject:SetActive(true)
                    if StormViewModel.CurPointData.banSkill ~= "0" then
                        self.Btn_BanSkill().gameObject:SetActive(true)
                    else
                        self.Btn_BanSkill().gameObject:SetActive(false)
                    end
                end
            elseif tonumber(StormViewModel.CurPointData.ContinuousCombatType) == 3 then
                self.Btn_BossInfo().gameObject:SetActive(true)
                if StormViewModel.CurPointData.banSkill ~= "0" then
                    self.Btn_BanSkill().gameObject:SetActive(true)
                else
                    self.Btn_BanSkill().gameObject:SetActive(false)
                end
            end
        elseif tWorldBoss then
            if tWorldBoss.ContinuousCombatType == BattleManager.MonsterStandType.MONSTER_BOSS then
                if self.SecondWar_CurrentTeam == 1 then
                    self.Btn_BossInfo().gameObject:SetActive(false)
                else
                    self.Btn_BossInfo().gameObject:SetActive(true)
                end
            elseif tWorldBoss.ContinuousCombatType == BattleManager.MonsterStandType.BOSS_MONSTER then
                if self.SecondWar_CurrentTeam == 1 then
                    self.Btn_BossInfo().gameObject:SetActive(true)
                else
                    self.Btn_BossInfo().gameObject:SetActive(false)
                end
            end
        end
        self:ShowRoleInfo()     --换阵型显示的时候，关闭角色信息显示
        CMgrUI.Instance:SecondBattleScreen()
        self.ClickMask().gameObject:SetActive(true)
        MgrTimer.AddBattleDelay("SecondPhase",1,function()
            self.ClickMask().gameObject:SetActive(false)
            BattleManager.ShowSecondWarTeam(self.SecondWar_CurrentTeam)
            self:ReloadOrder(false)
        end,nil)
        ---重置顺序按钮为分别，并切换回阵型按钮
        ---分别排序模式
        self.sortingType = 1
        ---高亮显示
        self.Btn_Altogether_H().gameObject:SetActive(false)
        self.Btn_Separate_H().gameObject:SetActive(true)
        self.LineUpOrOrder = 2
        self:ChangeLeftButton()
    end)

    UIEvent.LuaClick(self.Btn_Guankaxinxi().gameObject,function()
    self.PointInfopop().gameObject:SetActive(true)
    end)
    UIEvent.LuaClick(self.Btn_BossInfo().gameObject,function()
        ---显示Boss信息
        for i, role in pairs(BattleManager.AllRole) do
            --if role.GameID == 1 and role.Remove == false then
            if role.myAni.IsWorldBoss then
                self:ShowRoleInfo(role,true)
                break
            end
        end
    end)
    ---禁用技能
    UIEvent.LuaClick(self.Btn_BanSkill().gameObject, function()
        ---显示禁止技能弹窗
        if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
            MgrUI.Pop(UID.BattleBanSkillPop_UI,{EventRaidControl.GetLIANHETAOFAData().BossData[1].prohibit},true)
        else
            MgrUI.Pop(UID.BattleBanSkillPop_UI,{StormViewModel.CurPointData.banSkill},true)
        end
    end)
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        self.PointInfopop().gameObject:SetActive(false)
        end)

    ---好友助战锁
    if StormViewModel.CurPointData ~= nil then
        self.Img_SupportLock().gameObject:SetActive(StormViewModel.CurPointData:CheckGuide() or SysLockControl.CheckSysLock(1700) == false)
    end
    self:UpdateTips(1)

    ---默认隐藏锁住按钮
    self.Btn_LockRormation().gameObject:SetActive(false)
    self.Btn_LockRemove().gameObject:SetActive(false)
    ---如果是教学关
    if StormViewModel.CurPointData ~= nil and StormViewModel.JudgeTeachType(StormViewModel.CurPointData.type) then
        self.Btn_LockRormation().gameObject:SetActive(true)
        self.Btn_Rormation().gameObject:SetActive(false)
        self.Btn_Remove().gameObject:SetActive(true)
        self.Btn_LockRemove().gameObject:SetActive(false)
    end
    if StormViewModel.CurPointType == StormViewModel.PointType.guide then
        ---如果是战术指导
        self.Btn_LockRormation().gameObject:SetActive(true)
        self.Btn_Rormation().gameObject:SetActive(false)
        self.Btn_Remove().gameObject:SetActive(true)
        self.Btn_LockRemove().gameObject:SetActive(false)
    end
end

function M:HpShowPop()
    MgrUI.Pop(UID.StatusPop_UI)
    Event.Add("ResetYueTaHPCallback",Handle(self,self.ShowRoleInfo))
    Event.Add("ResetYueTaHPCallback",Handle(self,self.ResetBattleRoleHP))
    Event.Add("ResetYueTaHPCallback",Handle(self,self.ReloadSelectRole))
    Event.Add("ResetYueTaHPCallback",Handle(self,function()
        local tResetHeroLimit = YueTaViewModel.ResetCountTime()
        local tResetHeroCount = YueTaViewModel.ResetCountTime()-YueTaViewModel.GetServerData().heroResetCount
        if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
            tResetHeroLimit = YueTaViewModel.GetHardResetHeroLimit()
            tResetHeroCount = YueTaViewModel.GetHardResetHeroLimit()-YueTaViewModel.GetServerData().innerHeroResetCnt
        end
        self.Text_Chongzhizhuangtai().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_1"),tResetHeroCount,tResetHeroLimit)
    end))
end

function M:ResetBattleRoleHP()
    for i,v in pairs(BattleManager.LeftTeam) do
        if v.HP ~= v.HPmax then
            v.HP = v.HPmax
        end
    end
end

function M:ShowBuff(torf)
    self.CangwuTexingpop().gameObject:SetActive(torf)
    if torf then
        ---buff信息
        self.BuffList = StormViewModel.CurPointData:GetBuff()
        if #self.BuffList ~= 0 then
            self.BuffScroll01().totalCount = #self.BuffList
            self.BuffScroll01():RefillCells(0)
        end
    end
end

function M:ChangeLeftButton()
    if self.LineUpOrOrder == 1 then
        self.LineUpOrOrder = 2
        self.OrderBtns().gameObject:SetActive(true)
        self.LineupBtns().gameObject:SetActive(false)
        self:ReloadOrder(true)
        ---头像列遮挡
        self.SelectRoleStop = true
        ---设置当前模式为拖拽排序
        self.CurMode = 3
        ---更新替换队员面板
        self:ReloadSelectRole()
        self.ScrollMask().gameObject:SetActive(true)
    elseif self.LineUpOrOrder == 2 then
        self.LineUpOrOrder = 1
        self.LineupBtns().gameObject:SetActive(true)
        self.OrderBtns().gameObject:SetActive(false)
        self:ReloadOrder(false)
        ---头像列遮挡
        self.SelectRoleStop = false
        ---设置当前模式为选择角色
        self.CurMode = 1
        ---更新替换队员面板
        self:ReloadSelectRole()
        self.ScrollMask().gameObject:SetActive(false)
    end
end

function M:CloseSkillXiangqing()
    self.Panel_RoleInfo:SetActive(false)
    self.Panel_Ready().gameObject:SetActive(true)
    self.Panel_Select().gameObject:SetActive(true)
    CJNBattleMgr.Instance:RaygetIdOff(false)
end
function M:ScorePanel()
    self.curScore = 0
    BattleManager.BossScoreCell = function(bossNumber_In)
        ---当前先按照1：1显示积分，待策划配置积分倍率后修改
        ---实时更新boss受到的伤害
        self.curScore = bossNumber_In
        if tonumber(self.Text_Score().text) ~= self.curScore then
            Tools.DoBattleText(self.Text_Score(),self.curScore,10,1,0,true,1,"battle Add Score")
        end
    end
    self.Panel_Score().gameObject:SetActive(false)
    self.Text_MoNi().gameObject:SetActive(StormViewModel.IsAnaWorldBoss)
end
function M:StarPanel()
    if BattleManager.GameMode == BattleManager.GameModeType.PVP or
            BattleManager.GameMode == BattleManager.GameModeType.MonthTower or
            BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP or
            StormViewModel.CurPointData == nil then
        return
    end
    if not CJNBattleMgr.Instance.worldBossBattle then
        local s1,s2,s3 = StormViewModel.CurPointData:CheckStar()
        self.Img_ResTaskStar_1().transform:Find("Highlight").gameObject:SetActive(s1)
        self.Img_ResTaskStar_2().transform:Find("Highlight").gameObject:SetActive(s2)
        self.Img_ResTaskStar_3().transform:Find("Highlight").gameObject:SetActive(s3)
        if StormViewModel.CurPointData.condition then
            local strArr = string.split(StormViewModel.CurPointData.condition,",")
            self.Text_ResTaskDes_1().text = TermdescLocalData.tab[tonumber(string.split(strArr[1],"_")[3])][2]
            self.Text_ResTaskDes_2().text = TermdescLocalData.tab[tonumber(string.split(strArr[2],"_")[3])][2]
            self.Text_ResTaskDes_3().text = TermdescLocalData.tab[tonumber(string.split(strArr[3],"_")[3])][2]
        elseif StormViewModel.CurPointData.towerReward and #StormViewModel.CurPointData.towerReward == 3 then
            self.Text_ResTaskDes_1().text = StormViewModel.CurPointData.towerReward[1].taskText
            self.Text_ResTaskDes_2().text = StormViewModel.CurPointData.towerReward[2].taskText
            self.Text_ResTaskDes_3().text = StormViewModel.CurPointData.towerReward[3].taskText
        else

        end
    end
end
function M:CellBuff(trans, idx)
    trans:GetComponent("UITemplate"):SetData(self.BuffList[idx])
end
---替换队员滑块通知
function M:CellSelectRole(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.roleData[idx],self})
end
---阵型滑块通知
function M:CellTeam(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.teamData[idx],self})
end
---更新替换队员面板
function M:ReloadSelectRole(isMoveId)
    ---获取拥有的角色
    self.roleData = StormViewModel.GetSortAndFilterHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise,StormViewModel.FriendSupport)
    if not StormViewModel.FriendSupport then    ---把设为喜欢的放到最前面
        local isLove
        local newTab = {}
        local newTab2 = {}
        for i, v in pairs(self.roleData) do
            isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",v.id))
            if isLove ~= nil and  isLove ~= "" then
                table.insert(newTab,v)
            else
                table.insert(newTab2,v)
            end
        end
        for i = 1, #newTab2 do
            table.insert(newTab,#newTab + 1,newTab2[i])
        end
        self.roleData = newTab
    end
    if not StormViewModel.FriendSupport then    ---如果是自己的角色，则要把武器等级和核心数据都填上
    for i, v in pairs(self.roleData) do
        ---@type EquipData[]
        local equipData = v:GetHeroVoidEquip()
        for i, value in ipairs(equipData) do
            v.equipLvArr[i] = value.level
        end
    end
    end
    ---设置数量
    self.selectRoleLoop.totalCount = #self.roleData
    if isMoveId == nil
    then
        ---直接刷新面板
        self.selectRoleLoop:RefreshCells()
    else
        ---根据id刷新到指定位置
        local index = 0
        for i, role in pairs(self.roleData) do
            if role.id == isMoveId then
                index = i
                break
            end
        end
        index = index - 4
        index = index < 0 and 0 or index
        local count = #self.roleData
        index = index > count and count or index
        self.selectRoleLoop:RefillCells(index)
    end
    self.Text_Empty().gameObject:SetActive(self.selectRoleLoop.totalCount == 0)
end
function M:OnUpdateUI()
    ---播放背景音乐
    if BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
        MgrSound.PlayBGM(EventRaidControl.GetLIANHETAOFAData().bgm,0.2)
    elseif BattleManager.GameMode == BattleManager.GameModeType.PVP then
        MgrSound.PlayBGM(SteamLocalData.tab[113026][2],0.2)
    elseif BattleManager.GameMode == BattleManager.GameModeType.FriendPVP then
        MgrSound.PlayBGM(SteamLocalData.tab[113026][2],0.2)
    elseif BattleManager.GameMode == BattleManager.GameModeType.BuDoukaiPVP then
        MgrSound.PlayBGM(SteamLocalData.tab[113026][2],0.2)
    else
        MgrSound.PlayBGM(StormViewModel.CurPointData.bgm,0.2)
    end
end
---销毁
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Clear("ResetYueTaHPCallback")
    ---注销积分回调
    BattleManager.BossScoreCell = nil
    MgrTimer.Cancel("buttonOn")
    MgrTimer.Cancel("JumpButtonOn")
    MgrTimer.Cancel("BattleUIUpdate")
    MgrTimer.Cancel("BtnPauseDelay")
    MgrTimer.Cancel("SetCameraPosition")
    MgrTimer.Cancel("closeDangerousWarning")
    Event.Remove("WorldBossFinishPanelClose",Handle(self,self.WBCompletePanelClose))
    Event.Remove("WorldBossHpClose",Handle(self,self.CloseBossHpBar))
    Event.Remove("PauseBtnClose",Handle(self,self.ClosePauseButton))
    Event.Remove("PauseBtnClose",Handle(self,self.ClosePauseButton))
    Event.Remove("JumpOutClose",Handle(self,self.CloseJump))
    ---还原播放速度
    CJNBattleMgr.SetGameSpeed(1)
    ---消除原先设置的战斗模式
    if BattleManager.BattleAgain then
        BattleManager.BattleAgain = false
    else
        BattleManager.GameMode = 0
    end
    StormViewModel.CurStormAnaBossId_Monster = 0
    StormViewModel.CurStormBossId_Monster = 0
    ---还原公告位置
    if CJNBattleMgr.Instance.worldBossBattle or ( StormViewModel.CurPointData ~= nil and (StormViewModel.CurPointData.type == 15))
    then
        SysNoticeControl.SetSysNoticeOffsetY(274)
    end
    ---删除Boss警告
    CJNBattleMgr.Instance:DestroyBossWarning()
    StormViewModel.IsAnaWorldBoss = false
    self:SetCFunNull();
end
---更新提示信息
function M:UpdateTips(type)
    if type == 1 then
        ---选取提示
        local count = 0
        ---好友支援
        --local FriendCount = 0
        for i, v in pairs(BattleManager.AllRole) do
            if v.IsLeft == true then
                count = count + 1
            end
            --if v.userID and v.userID ~= 0 then
            --    FriendCount = FriendCount + 1
            --end
        end
        if StormViewModel.FriendSupport then
            self.text_Tips.text = string.format("<color=#47FFE3>%s</color>/%s",PlayerControl.SupportNum,PlayerControl.SupportNumMax)
        else
            if CJNBattleMgr.Instance.worldBossBattle then
                if count > 9 then
                    self.text_Tips.text = string.format("<color=#FF0016>%s</color>/9",count)
                else
                    self.text_Tips.text = string.format("<color=#47FFE3>%s</color>/9",count)
                end
            else
                if count > StormViewModel.CurPointData.playerNumber then
                    self.text_Tips.text = string.format("<color=#FF0016>%s</color>/%s",count,StormViewModel.CurPointData.playerNumber)
                else
                    self.text_Tips.text = string.format("<color=#47FFE3>%s</color>/%s",count,StormViewModel.CurPointData.playerNumber)
                end
            end

        end
        if StormViewModel.CurPointData and StormViewModel.CurPointData.scrollType == 13 then
            self.Text_Cishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_meizhoufuben_text2"),StormControl.GetWeekBossTime(), StormControl.GetWeekBossTotalTime())
            self.Text_Cishu().gameObject:SetActive(true)
        else
            self.Text_Cishu().gameObject:SetActive(false)
        end
        --elseif type == 2 then
        --    ---顺序提示
        --    self.text_Tips.text = "请使用<color=#47FFE3>拖拽</color>来改变攻击顺序"
        --elseif type == 3 then
        --    ---阵型提示
        --    self.text_Tips.text = "请选择要<color=#47FFE3>读取</color>的阵型"
        --elseif type == 4 then
        --    ---组合提示
        --    self.text_Tips.text = "选择<color=#47FFE3>对应</color>的队员出战时可发动组合效果"
        --elseif type == 5 then
        --    ---助战提示
        --    self.text_Tips.text = "可使<color=#47FFE3>一名</color>好友佣兵出战"
    end
end

---重新加载排序图标
function M:ReloadOrder(isBig,onlyRight)
    for k, role in pairs(BattleManager.AllRole) do
        if role.myAni ~= nil then
            if role.IsLeft == true then
                ---加载左侧队列排序
                if onlyRight == nil or not onlyRight then
                    role.myAni:SetOrder(role.AtkOrder, role.IsLeft, isBig)
                end
            else
                ---加载右侧队列排序
                role.myAni:SetOrder(role.AtkOrder, role.IsLeft, isBig)
            end
        end
    end
end

function M:CloseBossHpBar(bool)
    for i,v in pairs(BattleManager.AllRole) do
        if v.myAni.IsWorldBoss then
            v.myAni.myHpUi.Prefab_Root.gameObject:SetActive(bool)
        end
    end
end

---@param role BattleRole
---显示/隐藏角色详细信息
function M:ShowRoleInfo(role,isRatio)
    self.CurRoleInfo = role
    ---若未抓取角色或在战斗中并关闭了UI则不显示
    if role == nil or BattleManager.IsFightStart
    then
        --self.Panel_Select().gameObject:SetActive(true)
        self.CurRoleInfo = nil
        self.Panel_RoleInfo:SetActive(false)
        CJNBattleMgr.Instance:RaygetIdOff(false)
        self:CloseBossHpBar(true)
    else
        ---获取角色数据
        local roleData = role
        if self.CurRoleInfo.myAni ~= nil and self.CurRoleInfo.myAni.IsWorldBoss then
            if BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss or BattleManager.GameMode == BattleManager.GameModeType.WorldBoss then
                roleData = EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel].BossData
            else
                roleData = role.IsMonster and StormViewModel.CurPointData:GetMonsterById(tonumber(role.ID),role.AtkOrder) or HeroControl.GetRoleDataByID(tonumber(role.ID))
            end
        else
            --roleData = role.IsMonster and StormViewModel.CurPointData:GetMonsterById(tonumber(role.ID),role.AtkOrder) or HeroControl.GetRoleDataByID(tonumber(role.ID))
        end
        --self.Panel_Select().gameObject:SetActive(false)
        self:CloseBossHpBar(false)
        self.Panel_RoleInfo:SetActive(true)
        CJNBattleMgr.Instance:CameraMoveOpenAndClose(false)
        ---更新头像
        MgrRes.LoadQIcon(self.Icon_RIHead(),role.SkinID == nil and role.ID or role.SkinID)
        ---更新边框
        MgrRes.LoadSprite(self.Icon_RIFrame(),roleData.iconBattleFrame)
        ---更新等级
        self.Text_RILevel().text = role.LV
        ---更新职业图标
        MgrRes.LoadSprite(self.Icon_RICareer(),roleData.iconCareer)
        ---更新星级
        for starLv = 1, #self.rIStarHl do
            local isStar = role.StartLV < starLv
            self.rIStarNor[starLv]:SetActive(not isStar)
            self.rIStarHl[starLv]:SetActive(not isStar)
            self.superStars[starLv]:SetActive(not isStar)
        end
        ---更新觉醒
        local isAwaken = false
        if role.IsAwaken then
            isAwaken = true
        else
            isAwaken = false
        end
        self.rIAwaken:SetActive(isAwaken)
        ---更新技能等级
        if role.IsMonster then
            self.Text_RIRank().text = (role.SkillLV)
            self.Text_RIRank().color = Color(1,1,1,1)
        else
            if role.ShowSkillLV > role.SkillLV and role.ShowSkillLV ~= 0 then
                self.Text_RIRank().text = (role.ShowSkillLV)
                self.Text_RIRank().color = Color(1,0.772549,0.2235294,1)
            else
                self.Text_RIRank().text = (role.SkillLV)
                self.Text_RIRank().color = Color(1,1,1,1)
            end
            --技能等级设置
            if not StormViewModel.FriendSupport then
                --local t = HeroControl.GetRoleDataByID(tonumber(role.ID))
                --if t.heroFlag ~= nil and t.heroFlag ~= 0 and t.heroFlag ~= false then
                    self.Text_RIRank().text = role.ShowSkillLV
                    -- if t:CheckHeroEquipIsMax() then
                    --     self.Text_RIRank().color = Color(1,0.772549,0.2235294,1)
                    -- else
                    --     self.Text_RIRank().color = Color(1,1,1,1)
                    -- end
                --end
            else
                if role.heroFlag ~= nil and role.heroFlag ~= false and role.heroFlag ~= 0 then
                    self.Text_RIRank().text = role.heroCurSkill
                end
            end
        end
        ---更新角色名称
        self.Text_RIName().text = roleData.Name
        ---更新攻击距离
        if role.Occupation == 4 then
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..role.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..role.AttackRangeTexture)
        end
        ---攻击目标
        MgrRes.LoadSprite(self.Mubiao(),"AtkTarget/AtkTarget_" .. ((role.Attacktarget == 7 or role.Attacktarget == 8) and 4 or role.Attacktarget),nil,true)
        ---攻击目标的描述
        self:Text_Mubiaozi().text =  role.AtkTargetTips
        ---更新属性
        if role.Occupation == 4 then
            --- 支援型
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_2")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
            self.Text_Atk2().text = (self.GetInfoCorrect(role.RealSuppart)).."%"
        else
            --- 非支援
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_0")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text14")
            self.Text_Atk2().text = math.floor(role.RealAtk)
        end
        if StormViewModel.CurPointType == StormViewModel.PointType.monthTower then  ---月塔血量另算
            local heroHP = YueTaViewModel.GetServerData().towerHero
            if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
                heroHP = YueTaViewModel.GetServerData().innerTowerHero
            end
            if heroHP ~= nil then
                for i,v in pairs(heroHP) do
                    if v.heroID == tonumber(role.ID) then
                        role.HP = role.HPmax / 10000 * v.hP
                        break
                    end
                end
            end
        end
        if tonumber(role.HP) >= 1000000 then
            self.Text_HP2().text = (self.GetMillionNumInfo(role.HP)).."M"
        else
            self.Text_HP2().text = math.floor(role.HP)
        end
        local tValue = isRatio and 1 or 10000
        self.Text_Def2().text = (self.GetInfoCorrect(role.RealDef)).."%"
        self.Text_Baoji2().text = (self.GetInfoCorrect(role.RealCrit/tValue)).."%"
        self.Text_Mingjie2().text = (self.GetInfoCorrect(role.RealAgile)).."%"
        self.Text_Baoshang2().text = (self.GetInfoCorrect(role.RealCritDmg/tValue)).."%"
        Tools.UIDoLocalScale(self.HPtiao().gameObject,1,role.HP/role.HPmax,0,0,0,0.5,0)

        ---创建技能
        --self.SkillsSample = {}
        --if role.Skill_1_example[1] ~= nil then
        --    table.insert(self.SkillsSample,role.Skill_1_example)
        --end
        --if role.Skill_2_example[1] ~= nil then
        --    table.insert(self.SkillsSample,role.Skill_2_example)
        --end
        --if role.Skill_3_example[1] ~= nil then
        --    table.insert(self.SkillsSample,role.Skill_3_example)
        --end
        --if role.Skill_4_example[1] ~= nil then
        --    table.insert(self.SkillsSample,role.Skill_4_example)
        --end
        --if role.Skill_5_example[1] ~= nil then
        --    table.insert(self.SkillsSample,role.Skill_5_example)
        --end
        --self.ChildSkillList = SkillDetailControl.GetSkillListByID(tonumber(role.ID))
        --self.CurRole = role
        --self.SkillPanel():SetLuaCellEvent(Handle(self,self.CellSkillPrefab))
        --self.SkillPanel().totalCount = #self.ChildSkillList
        --self.SkillPanel():RefillCells()
        ---更新buff
        ---清空列表
        self.List_Index_GoIcon = {}
        self.List_Index_IconTex = {}
    end
end
---替换SkillPrefab滑块通知
function M:CellSkillPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.ChildSkillList[idx],self,self.CurRole,"Battle"})
end
---@param skillPdata SkillDetailData
function M:ShowSkillXiangqing(skillPdata,ObjRoot)
    self.Panel_Select().gameObject:SetActive(false)
    local tIsOpen = true
    local tMarkLv = skillPdata.UnlockLv[1]
    for i, v in ipairs(skillPdata.UnlockLv) do
        if self.CurRole.ShowSkillLV >= v then
            tMarkLv = v
        else
            if i == 1 then
                tIsOpen = false
            end
            break
        end
    end
    if not tIsOpen then
        return
    end
    self.SkillDetail = {}
    --local tSkillList = skillPdata.SkillList[tMarkLv]
    ---界面默认显示4个窗口，不足需要补齐
    local tSkillExample = {}
    if skillPdata.SkillNum == 1 then
        tSkillExample = self.CurRole.Skill_1_example
    elseif skillPdata.SkillNum == 2 then
        tSkillExample = self.CurRole.Skill_2_example
    elseif skillPdata.SkillNum == 3 then
        tSkillExample = self.CurRole.Skill_3_example
    elseif skillPdata.SkillNum == 4 then
        tSkillExample = self.CurRole.Skill_4_example
    elseif skillPdata.SkillNum == 5 then
        tSkillExample = self.CurRole.Skill_5_example
    end
    self.sonSkillsTable = nil
    self.sonSkillsTable = Global.CopyTable(tSkillExample)
    --if #self.sonSkillsTable < 4 then
    --    for i = 1, 4 do
    --        if self.sonSkillsTable[i] == nil then
    --            self.sonSkillsTable[i] = {abc = 1}
    --        end
    --    end
    --end
    self.Panel_RoleInfo:SetActive(true)
    self.SkillPrefab_xz().transform.position = ObjRoot.transform.position
    self.EX().gameObject:SetActive(skillPdata.SkillNum == 5)
    self.Text_Jinengming().text = skillPdata.GroupName[tMarkLv]
    self.Text_Jinengshuoming().text = skillPdata.Tips[tMarkLv]
    self.SkillZhankaiScroll01():SetLuaCellEvent(Handle(self,self.CellZijinengPrefab))
    self.SkillZhankaiScroll01().totalCount = 4
    self.SkillZhankaiScroll01():RefillCells(0,true)
    self.Panel_Ready().gameObject:SetActive(false)
end
---替换ZijinengPrefab滑块通知
function M:CellZijinengPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.sonSkillsTable[idx],"Battle"})
end

function M:ShowRole()
    if not StormViewModel.FriendSupport then
        return
    end
    self.tog_RoleTypeNH[1]:SetActive(true)
    self.tog_RoleTypeNH[2]:SetActive(false)
    StormViewModel.FriendSupport = false
    self:ReloadSelectRole(0)
    self:UpdateTips(1)
end

function M:ShowFriendSupportRole()
    if PlayerControl.SupportNum >= PlayerControl.SupportNumMax then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battleroleitem_tips3"),1},true)
        return
    end
    if StormViewModel.FriendSupport then
        return
    end
    if StormViewModel.CurPointData:CheckGuide() or SysLockControl.CheckSysLock(1700) == false then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
        return
    end
    self.tog_RoleTypeNH[1]:SetActive(false)
    self.tog_RoleTypeNH[2]:SetActive(true)
    StormViewModel.FriendSupport = true
    self:ReloadSelectRole(0)
    self:UpdateTips(1)
end
---@param roleData RoleData 创建Spine
function M:GetOrCreatSpineRole(roleData, _NotInSound,_delay)
    ---创建角色数据
    ---@type BattleRole battleRole

    local battleRole
    if roleData.userID == 0 or roleData.userID == nil then
        battleRole = BattleManager.CreartRoleLeft(roleData.id,roleData.skin, roleData.level, roleData.star,roleData:GetHeroSkillLevel(), roleData.awaken,roleData.type,roleData.userID,roleData.friend,roleData.favor,roleData:CheckHeroEquipIsMax(),roleData.heroFlag,roleData.heroCurSkill)
        ---替换技能补丁
        local specialEquip = EquipControl.GetSingleSpecialEquip(roleData.id)
        if specialEquip then
            local skillIndex = specialEquip:GetAdvanceSkillNum()
            local advanceSkillStr = specialEquip:GetSpecialSkill()
            for _,str in pairs(advanceSkillStr) do
                ReadData.ReplaceSkill(str,battleRole,skillIndex)
            end
        end
    else
        local skillUp = true
        for i ,v in ipairs(roleData.equipLvArr) do
            if v < tonumber(SteamLocalData.tab[105009][2]) then
                skillUp = false
                break
            end
        end
        battleRole = roleData:GetFriendHeroAttr()
        local AbtArr1 =  ReadData.GetGearAttr(roleData.armor1 , roleData.armor1Pro)
        local AbtArr2 =  ReadData.GetGearAttr(roleData.armor2 , roleData.armor2Pro)
        if AbtArr1 then
            ReadData.InitRoleGear(battleRole, AbtArr1 ,true)
        end
        if AbtArr2 then
            ReadData.InitRoleGear(battleRole, AbtArr2 ,true)
        end
        ---获取共鸣装备
        local role = HeroControl.GetRoleDataByID(tonumber(roleData.id))
        if #roleData.equipArr ~= 0 then
            ---获取角色共鸣装备1
            local equip1 = role:GetHeroEquip(1)
            ---装备等级替换为对方等级
            local newEquip1 = EquipControl.ReturnSingleEquip(equip1.equipID,roleData.equipLvArr[1])
            if newEquip1 ~= nil then
                ReadData.InitRoleGear(battleRole,newEquip1.attrs,true)
            end
            ---获取角色共鸣装备2
            local equip2 = role:GetHeroEquip(2)
            local newEquip2 = EquipControl.ReturnSingleEquip(equip2.equipID,roleData.equipLvArr[2])
            if newEquip2 ~= nil then
                ReadData.InitRoleGear(battleRole,newEquip2.attrs,true)
            end
            ---获取角色共鸣装备3
            local equip3 = role:GetHeroEquip(3)
            local newEquip3 = EquipControl.ReturnSingleEquip(equip3.equipID,roleData.equipLvArr[3])
            if newEquip3 ~= nil then
                ReadData.InitRoleGear(battleRole,newEquip3.attrs,true)
            end
        end
        battleRole.userID = roleData.userID
        ---替换技能补丁
        local specialEquip = EquipControl.CreateSingleSpecialEquip(roleData.SEquipID,roleData.SEquipLevel,roleData.SEquipGrade)
        if specialEquip then
            local skillIndex = specialEquip:GetAdvanceSkillNum()
            local advanceSkillStr = specialEquip:GetSpecialSkill()
            for _,str in pairs(advanceSkillStr) do
                ReadData.ReplaceSkill(str,battleRole,skillIndex)
            end
        end
        ---------------
    end
    ---月塔角色血量修正
    if StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.pointType == 4 then
        local hpTab = YueTaViewModel.GetServerData().towerHero
        if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
            hpTab = YueTaViewModel.GetServerData().innerTowerHero
        end
        if hpTab then
            for i,v in pairs(hpTab) do
                if v.heroID == tonumber(battleRole.ID) then
                    battleRole.HP = battleRole.HPmax / 10000 * v.hP
                    if battleRole.HP > 0 and battleRole.HP < 1 then
                        battleRole.HP = 1
                    end
                    break
                end
            end
        end
    end
    --创建spine
    CBattleTools.CCreatUIGo(battleRole.AniName, battleRole.GameID, battleRole.Qzoom,(battleRole.SkinID == nil and battleRole.ID or battleRole.SkinID),function(myAni) battleRole.myAni = myAni end)
    ---创建战斗用角色数据
    if battleRole.Str_Audio ~= nil and battleRole.Str_Audio ~= "0" and not _NotInSound then
        local audioGroup = tonumber(battleRole.Str_Audio)
        for key, value in pairs(ActorLinesLocalData.tab) do
            if value[2] == audioGroup and value[3] == 16 then
                battleRole.myAni.Audio_Dc=value[13]
                break
            end
        end
    end
    ---创建角色特效
    BattleRole.CreatEffFollowAni(battleRole,_NotInSound,_delay)
    BattleRole.SetFlyIn(battleRole,_delay)
    --百防百闪
    if battleRole.RealAgile >= 1 then
        battleRole.myAni:SetSingleEffect("Buff_ShanBiMax_v1")
    end
    if battleRole.RealDef >= 1 then
        battleRole.myAni:SetSingleEffect("Buff_HuDunMax_v1")
    end
    return battleRole
end
---移除左侧队列及角色
function M:ReMoveAllLeft()
    ---解除队伍时，队伍设置为不正确
    BattleViewModel.TeamCorrect = false
    local count = 0
    local newAllRole = {}
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            ---将原阵列位置置为空
            BattleManager.ChessboardLeft[role.PosY][role.PosX] = 0
            role.myAni:XYSetPos2(role.PosX, role.PosY, 0, 0)
            if BattleManager.GetDelGameID() == 0 then
                --设置上一个被删除的GameID
                BattleManager.SetDelGameID(role.GameID)
            end
            ---将地板角色移除左侧队列
            BattleManager.LeftTemaReomve(role)

            ---删除地板角色
            GameObject.Destroy(role.myAni.gameObject)

            ---从UI关卡英雄池中添加地板英雄数据
            if role.userID == nil or role.userID == 0 then
                StormViewModel.AddHeroData(tonumber(role.ID))
            else
                StormViewModel.AddFriendHeroData(tonumber(role.ID)..role.userID)
            end
            count = count + 1
        else
            newAllRole[i] = role
        end
    end
    BattleManager.AllRole ={}
    for i = 1, #newAllRole do
        table.insert(BattleManager.AllRole,newAllRole[i])
    end

    if count > 0 then
        ---重置左侧队列顺序
        BattleManager.LeftAtkOrderCout = 1
        ---更新所有地板
        CJNBattleMgr.Instance:SetAllFloorHid()
        ---刷新滑块UI
        self:ReloadSelectRole(0)
    end
    BattleManager.LeftTeam = {}
    BattleManager.GameIdCout = #BattleManager.RightTeam
end
---加载阵型
function M:LoadTeamRole(teamIndex,flayDelay)
    ---解除左侧队列角色
    self:ReMoveAllLeft()
    ---获取阵型数据
    local team = TeamControl.GetTeamData(teamIndex)

    ---月塔关卡把0血的剔除
    local removeHeroId = {}
    if StormViewModel.CurPointType == StormViewModel.PointType.monthTower then
        local herosHP = YueTaViewModel.GetServerData().towerHero
        if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
            herosHP = YueTaViewModel.GetServerData().innerTowerHero
        end
        if herosHP then
            for i = 1,#team.info do
                for j = 1, #herosHP do
                    if team.info[i].roleID == herosHP[j].heroID and herosHP[j].hP == 0 then
                        removeHeroId[team.info[i].roleID] = true
                    end
                end
            end
        end
    end

    if team.info == nil or #team.info == 0 then
        return
    end
    BattleManager.LeftAtkOrderCout=1
    for atkOrder, fighter in ipairs(team.info) do
        if not removeHeroId[fighter.roleID] then
            ---从UI关卡英雄池中移除拖拽英雄数据
            StormViewModel.RemoveHeroData(fighter.roleID)
            -- 加载角色音效
            MgrSound.AddCue("Audio/role/"..fighter.roleID..".acb")
            ---创建立绘并获得该角色所有数据
            local role = self:GetOrCreatSpineRole(HeroControl.GetRoleDataByID(fighter.roleID), atkOrder ~= 1, flayDelay)
            ---给role赋值攻击顺序
            BattleManager.LeftSetOrder(role)
            ---还原role透明度
            role.myAni:SetAlpha(1)
            ---设置role位置
            local posNum = fighter.index - 1
            role.PosX = (5 - math.floor(posNum / 3)) + 1
            role.PosY = (posNum % 3) + 1
            ---更新目标地板信息
            BattleManager.ChessboardLeft[role.PosY][role.PosX] = role
            role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
            --print( "GameID " .. role.GameID .. " PosX ".. role.PosX .." PosY ".. role.PosY)
            ---添加到左侧队列
            BattleManager.LeftTeamAdd(role)
            ---添加音效
            MgrSound.AddCue("Audio/role/".. role.SkinID ..".acb")
        end
    end
    ---更新提示
    self:UpdateTips(1)
    ---刷新滑块UI
    self:ReloadSelectRole()
    ---更新所有地板
    CJNBattleMgr.Instance:SetAllFloorHid()
    ---更新所有队列图标
    self:ReloadOrder(false)
end
---加载战术指导指定阵型
function M:LoadGuideTeam()
    ---解除左侧队列角色
    self:ReMoveAllLeft()
    ---战术指导加载指定角色
    ---若数量为0直接关闭loading
    local maxCount = 0
    for i, v in ipairs(StormViewModel.CacheHeroList) do
        if v.index > 0 then
            maxCount = maxCount + 1
        end
    end
    if maxCount == 0 then
        return
    end
    for i, roleData in ipairs(StormViewModel.CacheHeroList) do
        ---指定了位置的角色添加到场上
        if roleData.index > 0 then
            ---从UI关卡英雄池中移除拖拽英雄数据
            StormViewModel.RemoveHeroData(roleData.id)
            ---创建立绘
            local role = self:GetOrCreatSpineRole(roleData,i ~= 1, 0.55)
            ---是否为Npc
            if roleData.cTime then

            end
            ---给role赋值攻击顺序
            BattleManager.LeftSetOrder(role)
            ---还原role透明度
            role.myAni:SetAlpha(1)
            ---设置role位置
            local posNum = roleData.index - 1
            role.PosX = (5 - math.floor(posNum / 3)) + 1
            role.PosY = (posNum % 3) + 1
            ---更新目标地板信息
            BattleManager.ChessboardLeft[role.PosY][role.PosX] = role
            role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
            ---添加到左侧队列
            BattleManager.LeftTeamAdd(role)
            ---飞行进场
            role.myAni:UIFlayIn(0.55)
            if i == maxCount then
                ---更新提示
                self:UpdateTips(1)
                ---刷新滑块UI
                self:ReloadSelectRole(0)
                ---更新所有地板
                CJNBattleMgr.Instance:SetAllFloorHid()
                ---更新所有队列图标
                self:ReloadOrder(false)
            end
        end
    end
end
---取整人物信息 
function M.GetInfoCorrect(_Data)
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data*100)/1)
    tempData = tempInt1 
    return tempData
end
---得到百万级数据的除以100W后精度到小数点后两位的值输出
function M.GetMillionNumInfo(_InputInfo)
    local _tempRateNum = _InputInfo/10000
    local _OutInfo = math.floor(_tempRateNum)/100
    return _OutInfo
end
---用c#传来的属性进行更新
function M:UpdateRoleInfo()
    local role = self.CurRoleInfo
    if role == nil then
        return
    end
    ---更新框数据
    if  role.Occupation == 4 then
        ---支援型
        MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_2")
        --self.SupIcon().gameObject:SetActive(true)
        local tempNumber = self.Uidata_AtkOrSup/100
        self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
        self.Text_Atk2().text = tempNumber.."%"
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..role.AttackRangeTexture)
    else
        ---非支援
        --self.SupIcon().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_0")
        self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text14")
        self.Text_Atk2().text = self.Uidata_AtkOrSup
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..role.AttackRangeTexture)
    end
    ---攻击目标
    MgrRes.LoadSprite(self.Mubiao(),"AtkTarget/AtkTarget_" .. ((role.Attacktarget == 7 or role.Attacktarget == 8) and 4 or role.Attacktarget),nil,true)
    ---攻击目标的描述
    self:Text_Mubiaozi().text =  role.AtkTargetTips

    if tonumber(self.Uidata_HpMax) >= 1000000 then
        self.Text_HP2().text = (self.GetMillionNumInfo(tonumber(self.Uidata_Hp))).."M"
    else
        self.Text_HP2().text = self.Uidata_Hp
    end
    self.Text_Def2().text = (self.GetInfoCorrect(self.Uidata_Def)).."%"
    self.Text_Baoji2().text = (self.GetInfoCorrect(self.Uidata_Cirt)).."%"
    self.Text_Mingjie2().text = (self.GetInfoCorrect(self.Uidata_Agi)).."%"
    self.Text_Baoshang2().text = (self.GetInfoCorrect(self.Uidata_CirtDmg)).."%"
end

---传递方法回到c#
function M:SetCFun()
    CJNUIMgr.SetFuc_UpdataTopValue(Handle(self,self.UpdateValue))
    CJNUIMgr.SetFuc_UpdataTopValue_Base(Handle(self,self.UpdateValue_Once))
    CJNUIMgr.SetFuc_TopIconDel(Handle(self,self.Icon_Del))
    CJNUIMgr.SetFuc_TopIconDel_Boss(Handle(self,self.Icon_Del_Boss))
    CJNUIMgr.SetFuc_TopIconAdd_Boss(Handle(self,self.Icon_Add_Boss))
    CJNUIMgr.SetFuc_IconTime(Handle(self,self.Icon_UpdateTime))
end
function M:SetCFunNull()
    CJNUIMgr.SetFuc_UpdataTopValue(nil)
    CJNUIMgr.SetFuc_UpdataTopValue_Base(nil)
    CJNUIMgr.SetFuc_TopIconDel(nil)
    CJNUIMgr.SetFuc_TopIconDel_Boss(nil)
    CJNUIMgr.SetFuc_TopIconAdd_Boss(nil)
    CJNUIMgr.SetFuc_IconTime(nil)
end

--不同步Uidata_AtkOrSup_Base
function M:UpdateValue(_HP,_HPMAX ,_AtkOrSup , _Def , _Cirt, _CirtDmg,_Agi )
    --print("更新属性hp:".._HP)
    --print("更新属性hpmax:".._HPMAX)
    --print("更新属性atkOrS:".._AtkOrSup)
    --print("更新属性def:".._Def)
    --print("更新属性cirt:".._Cirt)
    --print("更新属性cirtDmg:".._CirtDmg)
    --print("更新属性agi:".._Agi)
    self.Uidata_Hp = tonumber(_HP)
    self.Uidata_HpMax = tonumber(_HPMAX)
    self.Uidata_AtkOrSup = tonumber(_AtkOrSup)
    self.Uidata_Def = tonumber(_Def)
    self.Uidata_Cirt = tonumber(_Cirt)
    self.Uidata_CirtDmg = tonumber(_CirtDmg)
    self.Uidata_Agi = tonumber(_Agi)     --闪避率
end
--Uidata_AtkOrSup_Base  icon图标表
function M:UpdateValue_Once(_AtkOrSup_Base, _List_Name,_List_Turn, _List_Index,_Len )
    self.Uidata_AtkOrSup_Base=  _AtkOrSup_Base
    self.List_Name={}        --要显示的图片
    self.List_Turn={}        --要显示的回合数
    self.List_Index={}
    --把usedata转换成lua表
    for i = 0, _Len-1, 1 do
        table.insert( self.List_Name , _List_Name[i])
        table.insert( self.List_Turn , _List_Turn[i])
        table.insert( self.List_Index , _List_Index[i])
    end
end
--删除一个

function M:Icon_Del(_Index)
    CJNBattleMgr.Instance:DesObj(self.List_Index_GoIcon[_Index])
    self.List_Index_GoIcon[_Index]=nil
    self.List_Index_IconTex[_Index]=nil
end

function M:Icon_Del_Boss(_Index)
    CJNBattleMgr.Instance:DesObj(self.List_Index_GoIcon_Boss[_Index])
    self.List_Index_GoIcon_Boss[_Index]=nil
    self.List_Index_IconTex_Boss[_Index]=nil
end

function M:Icon_Add_Boss(_Index,_IconName, IntTurn)
    --创建ui物体
    local tempObj = nil
    for i, role in pairs(BattleManager.AllRole) do
        if role.myAni.IsWorldBoss then
            tempObj = GameObject.Instantiate(self.AbtBuffIcon(),role.myAni.myHpUi.WorldBossBuffRoot.transform,false)
            break
        end
    end
    if tempObj == nil then
        return
    end
    --替换图片
    MgrRes.LoadSprite(tempObj,"Skill/".._IconName)
    --设置时间
    local GoText = tempObj.transform:Find("Text").gameObject
    local temptext = GoText:GetComponent("TextMeshProUGUI")
    local tempImg = tempObj.transform:Find("Img").gameObject
    --text组件列表
    self.List_Index_IconTex_Boss[_Index] = temptext
    if IntTurn<0 then  --如果时间为负数显示无限图片
        GoText:SetActive(false)
    else
        tempImg:SetActive(false)
        temptext.text= IntTurn
    end
    self.List_Index_GoIcon_Boss[_Index] = tempObj.gameObject
end
--显示一个buff
--function M:Icon_Add(_Index,_IconName, IntTurn)
--    --创建ui物体
--    local tempObj= GameObject.Instantiate(self.AbtBuffIcon(),self.RootAbtBuffObj().transform,false)
--    --替换图片
--    MgrRes.LoadSprite(tempObj,"Skill/".._IconName)
--    --设置时间
--    local GoText = tempObj.transform:Find("TextMeshProUGUI").gameObject
--    local temptext = GoText:GetComponent("TextMeshProUGUI")
--    local tempImg = tempObj.transform:Find("Img").gameObject
--    --text组件列表
--    self.List_Index_IconTex[_Index] = temptext
--    if IntTurn<0 then  --如果时间为负数显示无限图片
--        GoText:SetActive(false)
--    else
--        tempImg:SetActive(false)
--        temptext.text= IntTurn
--    end
--    self.List_Index_GoIcon[_Index] = tempObj.gameObject
--end]]
--更新时间
function M:Icon_UpdateTime()
    for key, value in pairs(self.List_Index_IconTex) do
        if value ~= nil then
            local int_text = tonumber(value.text) - 1
            if int_text < 0 then
                int_text = 0
            end
            value.text = int_text
        end
    end
    for key, value in pairs(self.List_Index_IconTex_Boss) do
        if value ~= nil then
            local int_text = tonumber(value.text) - 1
            if int_text < 0 then
                int_text = 0
            end
            value.text = int_text
        end
    end
end

---开始战斗回调
function M:CallBackStartBattle()
    print("Battle02 CallBackStartBattle")
    CJNBattleMgr.Instance:CameraMoveOpenAndClose(false) --不能再移动镜头
    SettingViewModel.SetBattleSpeed(SettingViewModel.GetBattleSpeed())
    ---如果发送队伍消息失败，不继续执行
    if BattleViewModel.TeamCorrect then
        print("Battle02 CallBackStartBattle TeamCorrect")
        ---设置当前排序模式为无状态
        self.CurMode = 4
        ---隐藏透明地板
        CJNBattleMgr.Instance:SetFloorShowImg(false)
        ---延迟点亮暂停键，防止战斗没开始就退出
        Event.Add("BtnPauseDelay_Battle02",Handle(self,self.BtnPauseDelay_Battle02))
        --MgrTimer.AddDelay("BtnPauseDelay",0,function()
        --    self.Btn_Pause().gameObject:SetActive(true)
        --end,nil)
        ---开始战斗
        self:ShowRoleInfo()
        ---boss战斗
        if CJNBattleMgr.Instance.worldBossBattle then
            if StormViewModel.IsAnaWorldBoss == true then
                ---模拟战
                BattleManager.GameMode = BattleManager.GameModeType.AniWorldBoss
            else
                BattleManager.GameMode = BattleManager.GameModeType.WorldBoss
            end
        else
            ---普通战斗
            if BattleManager.GameMode ~= BattleManager.GameModeType.RedTower and BattleManager.GameMode ~= BattleManager.GameModeType.Guide and BattleManager.GameMode ~= BattleManager.GameModeType.Novice and BattleManager.GameMode ~= BattleManager.GameModeType.ActivityBoss and BattleManager.GameMode ~= BattleManager.GameModeType.MonthTower then
                BattleManager.GameMode = BattleManager.GameModeType.Normal
            end
        end
        MgrUI.Pop(UID.PartLoading_UI,nil,true)
        BattleManager.GameStart(true,Handle(self,self.ClosePanel))
        ---刷新地板
        CJNBattleMgr.Instance:SetAllFloorHid()
    else
        print("与服务器对比队伍失败")
        MgrUI.UnLock("battle_start")
        return
    end
end

function M:ClosePauseButton()
    self.Btn_Pause().gameObject:SetActive(false)
end

function M:PanelFightClose()
    if self.ObjRoot == nil then
        return
    end
    self.Panel_Fighting().gameObject:SetActive(false)
end

function M:CloseJump()
    self.Btn_Tiaoguo().gameObject:SetActive(false)
end

function M:OpenTiaoGuo1()
    self.Btn_Tiaoguo1().gameObject:SetActive(true)
end
function M:ClosePanel()
    ---设置开战条件
    ---镜头按钮
    self.Btn_Jintouqiehuan().gameObject:SetActive(true)
    self.Panel_Fighting().gameObject:SetActive(true)
    self.UI_update().gameObject:SetActive(true)
    self.Panel_Ready().gameObject:SetActive(false)
    self.Btn_BanSkill().gameObject:SetActive(false)
    self.Btn_SecondWar().gameObject:SetActive(false)
    
    Event.Add("BtnFriendTiaoGuo_Battle02",Handle(self,self.OpenTiaoGuo1))
    
    if CJNBattleMgr.Instance.worldBossBattle then
        self.Panel_Score().gameObject:SetActive(true)
    end
    -- BattleManager.GameStart_LuatoC()
    if tonumber(BattleManager.AllRole[1].ID) == 600002 or tonumber(BattleManager.AllRole[1].ID) == 900002 or tonumber(BattleManager.AllRole[1].ID) == 600009 or tonumber(BattleManager.AllRole[1].ID) == 900009 then
        --隐藏耶梦加得遮挡相机的身体
        BattleManager.AllRole[1].myAni:HideYMJDBody({4,6})
        BattleManager.AllRole[1].myAni:CloseLianyi(4)
    end
    ---补全角色信息
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            CAnimation.SetRoleData(role.myAni,role.GameID,role.PosX,role.PosY,role.IsLeft,0,math.floor(role.HPmax))
        end
    end
    ---设置RoleUI
    BattleManager.SetLeftSpineUI()
    BattleManager.GameStart_LuatoC()
    MgrTimer.AddDelayNoName(0.2,function() MgrUI.UnLock("battle_start") end,nil)
    self:CloseBossHpBar(true)
    MgrTimer.Cancel("DangerousIcon")
    self.BlurMask_Original().gameObject:SetActive(false)
    self:ShutAllDangerousIcon()
end
function M:GetRankIcon(rankLevel)
    local PVPData = PVPViewModel.GetPvPRank(rankLevel)
    return "Level/" .. PVPData[3]
    --for i, v in ipairs(SeniorPVPLocalData.tab) do
    --    if score < 1000 then
    --        return "Level/liebingicon"
    --    end
    --    if score >= tonumber(v[4]) then
    --        if score < tonumber(SeniorPVPLocalData.tab[1][4]) then
    --            return "Level/"..v[3]
    --        else
    --            if rank >= v[5] and rank<=v[6] then
    --                return "Level/"..v[3]
    --            end
    --        end
    --    end
    --end
end
function M:JumpOutFunction()
    if BattleManager.GameMode ~= BattleManager.GameModeType.PVP and BattleManager.GameMode ~= BattleManager.GameModeType.FriendPVP and BattleManager.GameMode ~= BattleManager.GameModeType.BuDoukaiPVP then
        self.Btn_Tiaoguo().gameObject:SetActive(false)
        return
    end
    if BattleManager.GameMode == BattleManager.GameModeType.FriendPVP then
        BattleViewModel.JumpButtonOn = true
        self.Tiaoguo().gameObject:SetActive(true)
        self.Daojishi().gameObject:SetActive(false)
        return
    end
    if not PVPViewModel.IsViewRecord then
        --BattleViewModel.JumpButtonOn = false
        self.Text_Shuzi().text = "15"
        if BattleViewModel.DJS == nil or BattleViewModel.DJS ~= 15 then
            BattleViewModel.DJS = 15
        end
        MgrTimer.AddRepeat("buttonOn",0.1,function()
            if BattleViewModel.DJS == 0 then
                self.Tiaoguo().gameObject:SetActive(true)
                self.Daojishi().gameObject:SetActive(false)
                MgrTimer.Cancel("buttonOn")
            else
                self.Text_Shuzi().text = BattleViewModel.DJS
            end
        end,-1,nil)
    else
        --BattleViewModel.JumpButtonOn = true
        self.Tiaoguo().gameObject:SetActive(true)
        self.Daojishi().gameObject:SetActive(false)
    end
end
function M:WBCompletePanelClose()
    self.Panel_Fighting().gameObject:SetActive(false)
    self.Panel_PointInfo().gameObject:SetActive(false)
    self:CloseBossHpBar(false)
    Event.Remove("BtnFriendTiaoGuo_Battle02",Handle(self,self.OpenTiaoGuo1))
    Event.Remove("WorldBossFinishPanelClose",Handle(self,self.WBCompletePanelClose))
    Event.Remove("WorldBossHpClose",Handle(self,self.CloseBossHpBar))
    Event.Remove("PauseBtnClose",Handle(self,self.ClosePauseButton))
    Event.Remove("PanelFight",Handle(self,self.PanelFightClose))
end
function M:ShowDangerousEnemy()
    local ids = string.split(StormViewModel.CurPointData.dangerousEnemy,"_")
    if ids[2] ~= nil and ids[2] ~= "0" and UnityEngine.PlayerPrefs.GetInt("DangerEnemy"..PlayerControl.GetPlayerData().UID .. ids[2]) ~= 1
    then
        ---@type BattleRole enemy
        local enemy
        for i = 1, #BattleManager.RightTeam do
            if BattleManager.RightTeam[i].myAni:GetRolePos() == tonumber(ids[1]) then
                --if StormViewModel.CurPointData.type ~= 999 then
                BattleManager.RightTeam[i].myAni:SetDangerousIcon()
                --end
                enemy = BattleManager.RightTeam[i]
            end
        end
        UnityEngine.PlayerPrefs.SetInt("DangerEnemy"..PlayerControl.GetPlayerData().UID .. ids[2],1)
        ---@type RoleData enemyData
        local enemyData = StormViewModel.CurPointData:GetMonsterById(tonumber(ids[2]))
        ---更新头像
        MgrRes.LoadQIcon(self.Icon_RIHead_2(),enemyData.id)
        ---更新边框
        MgrRes.LoadSprite(self.Icon_RIFrame_2(),enemyData.iconBattleFrame)
        ---更新职业图标
        MgrRes.LoadSprite(self.Icon_RICareer_2(),enemyData.iconCareer)
        ---更新角色名称
        self.Text_Rolename_2().text = enemyData.name
        ---更新攻击距离
        if enemyData.occupation == 4 then
            MgrRes.LoadSprite(self.Img_Fanwei_2(),"AtkRange/SupportRange/"..enemy.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Img_Fanwei_2(),"AtkRange/OtherRange/"..enemy.AttackRangeTexture)
        end
        ---攻击目标
        MgrRes.LoadSprite(self.Img_Mubiao_2(),"AtkTarget/AtkTarget_" .. ((enemy.Attacktarget == 7 or enemy.Attacktarget == 8) and 4 or enemy.Attacktarget),nil,true)
        ---攻击目标的描述
        self:Text_Mubiaoshuoming_2().text =  enemy.AtkTargetTips
        ---简介
        for i,v in ipairs(MonsterdexLocalData.tab) do
            if v[5] == enemyData.id then
                self.Text_Shuoming_2().text = v[15]
                break
            end
        end
        --enemy.myAni:GetScreenPos(function(num1,num2)
        --    self.DangerousMaskHole().rectTransform.localPosition = Vector3(num1 - self.DangerousMask().transform.rect.width/2,num2 - self.DangerousMask().transform.rect.height/2,0)
        --end)

        MgrTimer.AddDelay("DangerousIcon",1,function()
            ---显示
            self.BlurMask_Original().gameObject:SetActive(true)
            Tools.DoCanvasGroupFade(self.Img_Tanchuangdi__Original().gameObject,0,1,1)
            MgrTimer.AddDelayNoName(2,function()
                UIEvent.LuaClick(self.BlurMask_Original().gameObject,function()
                    Tools.DoCanvasGroupFade(self.Img_Tanchuangdi__Original().gameObject,1,0,1)
                    MgrTimer.AddDelay("closeDangerousWarning",1,function()
                        self.BlurMask_Original().gameObject:SetActive(false)
                    end,nil)
                    self:ShutAllDangerousIcon()
                end)
            end,nil)
        end,nil)
    else
        --UnityEngine.PlayerPrefs.DeleteKey("DangerEnemy"..PlayerControl.GetPlayerData().UID .. ids[2])
        self.BlurMask_Original().gameObject:SetActive(false)

    end
end
function M:ShutAllDangerousIcon()
    for i = 1, #BattleManager.RightTeam do
        if BattleManager.RightTeam[i].myAni ~= nil then
            BattleManager.RightTeam[i].myAni:ShutDangerousIcon()
        end
    end
end

return M