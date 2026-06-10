-- Code Auto Create Begin
local M = Class('WorldBossBattle_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WorldBossBattle_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WorldBossBattle_UI].prefab'
    self.Name = 'Form[WorldBossBattle_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_update','Panel_Fighting/UI_update',2},{'Img_Xian7(1)','Panel_Fighting/UI_update/Img_Xian7 (1)',2},{'Img_sanjiao','Panel_Fighting/UI_update/Img_sanjiao',2},{'Img_Xian7(2)','Panel_Fighting/UI_update/Img_Xian7 (2)',2},{'Img_Xian7','Panel_Fighting/UI_update/Img_Xian7',2},{'Img_Bian2','Panel_Fighting/UI_update/round/Img_Bian2',2},{'SkillName_Drawing','Panel_Fighting/UI_update/SkillName_Drawing',2},{'SkillName_BgB','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgB',2},{'SkillName_Frame_Blue','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgB/SkillName_Frame_Blue',2},{'SkillName_BgR','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgR',2},{'SkillName_Frame_Red','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgR/SkillName_Frame_Red',2},{'SkillName_BgW','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgW',2},{'ImageBgRight','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/ImageBgRight',2},{'ImageBgLeft','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/ImageBgLeft',2},{'HeadMask_Sow','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask_Sow',2},{'ImageHeadIcon','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask',2},{'ImageBgRight01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/ImageBgRight',2},{'ImageBgLeft01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/ImageBgLeft',2},{'HeadMask_Sow01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask_Sow',2},{'ImageHeadIcon01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask',2},{'ImageBgRight02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/ImageBgRight',2},{'ImageBgLeft02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/ImageBgLeft',2},{'HeadMask_Sow02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask_Sow',2},{'ImageHeadIcon02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask',2},{'ImageBgRight03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/ImageBgRight',2},{'ImageBgLeft03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/ImageBgLeft',2},{'HeadMask_Sow03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask_Sow',2},{'ImageHeadIcon03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask',2},{'ImageBgRight04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/ImageBgRight',2},{'ImageBgLeft04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/ImageBgLeft',2},{'HeadMask_Sow04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask_Sow',2},{'ImageHeadIcon04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask',2},{'ImageBgRight05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/ImageBgRight',2},{'ImageBgLeft05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/ImageBgLeft',2},{'HeadMask_Sow05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask_Sow',2},{'ImageHeadIcon05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask',2},{'ImageBgRight06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/ImageBgRight',2},{'ImageBgLeft06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/ImageBgLeft',2},{'HeadMask_Sow06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask_Sow',2},{'ImageHeadIcon06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask',2},{'ImageBgRight07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/ImageBgRight',2},{'ImageBgLeft07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/ImageBgLeft',2},{'HeadMask_Sow07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask_Sow',2},{'ImageHeadIcon07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask',2},{'Panel_Round','Panel_Fighting/UI_update/Panel_Root/Panel_Round',2},{'Img_Round','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round',2},{'roundDI','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/roundDI',2},{'Img_Roundxian','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Img_Roundxian',2},{'Panel_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start',2},{'Img_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start',2},{'Img_Startxian1','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startxian1',2},{'Img_Startxian2','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startxian2',2},{'Img_Startdian','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startdian',2},{'Img_Startdi','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startdi',2},{'Img_Beisudi','Panel_Fighting/Btn_Speed/Img_Beisudi',2},{'Img_Beisutiao','Panel_Fighting/Btn_Speed/Img_Beisutiao',2},{'Img_Speedx1','Panel_Fighting/Btn_Speed/Img_Speedx1',2},{'Img_Speedx2','Panel_Fighting/Btn_Speed/Img_Speedx2',2},{'Img_Speedx3','Panel_Fighting/Btn_Speed/Img_Speedx3',2},{'Img_HPdi','Panel_Fighting/Btn_HP/Img_HPdi',2},{'Img_Jiao(hui)2','Panel_Fighting/Btn_HP/Img_Jiao(hui)2',2},{'Img_Jiao(liang)2','Panel_Fighting/Btn_HP/Img_Jiao(liang)2',2},{'Img_UIdi','Panel_Fighting/Btn_UI/Img_UIdi',2},{'Img_Jiao(hui)1','Panel_Fighting/Btn_UI/Img_Jiao(hui)1',2},{'Img_Jiao(liang)1','Panel_Fighting/Btn_UI/Img_Jiao(liang)1',2},{'Btn_Pause','Panel_Fighting/Btn_Pause',2},{'BlackBG','Panel_Fighting/EXHead/BlackBG',2},{'LineUp','Panel_Fighting/EXHead/LineUp',2},{'white','Panel_Fighting/EXHead/white',2},{'Panel_Select','Panel_Ready/Panel_Select',2},{'Img_Anniudi','Panel_Ready/Panel_Select/Img_Anniudi',2},{'anniudi','Panel_Ready/Panel_Select/anniudi',2},{'Tog_Replace','Panel_Ready/Panel_Select/Tog_Replace',2},{'Tog_Order','Panel_Ready/Panel_Select/Tog_Order',2},{'Btn_Rormation','Panel_Ready/Panel_Select/Btn_Rormation',2},{'SelectHL','Panel_Ready/Panel_Select/SelectHL',2},{'anniudi01','Panel_Ready/Panel_Select/SelectHL/anniudi',2},{'guang(xuanzhong)','Panel_Ready/Panel_Select/SelectHL/guang(xuanzhong)',2},{'dian(huang)','Panel_Ready/Panel_Select/SelectHL/dian(huang)',2},{'SelectType','Panel_Ready/SelectType',2},{'LineupBtns','Panel_Ready/SelectType/LineupBtns',2},{'Img_Rormationdi','Panel_Ready/SelectType/LineupBtns/Btn_Rormation/Img_Rormationdi',2},{'Rormationicon','Panel_Ready/SelectType/LineupBtns/Btn_Rormation/Rormationicon',2},{'Img_Cunqudi','Panel_Ready/SelectType/LineupBtns/Btn_Rormation/Img_Cunqudi',2},{'Img_Removedi','Panel_Ready/SelectType/LineupBtns/Btn_Remove/Img_Removedi',2},{'Removeicon','Panel_Ready/SelectType/LineupBtns/Btn_Remove/Removeicon',2},{'Img_Jiechudi','Panel_Ready/SelectType/LineupBtns/Btn_Remove/Img_Jiechudi',2},{'OrderBtns','Panel_Ready/SelectType/OrderBtns',2},{'Img_Restoredi','Panel_Ready/SelectType/OrderBtns/Btn_Restore/Img_Restoredi',2},{'Restoreicon','Panel_Ready/SelectType/OrderBtns/Btn_Restore/Restoreicon',2},{'Img_Huanyuandi','Panel_Ready/SelectType/OrderBtns/Btn_Restore/Img_Huanyuandi',2},{'Img_Altogetherdi','Panel_Ready/SelectType/OrderBtns/Btn_Altogether/Img_Altogetherdi',2},{'Altogethericon','Panel_Ready/SelectType/OrderBtns/Btn_Altogether/Altogethericon',2},{'Img_Yiqidi','Panel_Ready/SelectType/OrderBtns/Btn_Altogether/Img_Yiqidi',2},{'Img_Separatedi','Panel_Ready/SelectType/OrderBtns/Btn_Separate/Img_Separatedi',2},{'Separateicon','Panel_Ready/SelectType/OrderBtns/Btn_Separate/Separateicon',2},{'Img_Fenbiedi','Panel_Ready/SelectType/OrderBtns/Btn_Separate/Img_Fenbiedi',2},{'Tog_ChangeOver1','Panel_Ready/SelectType/Tog_ChangeOver1',2},{'HighLight','Panel_Ready/SelectType/Tog_ChangeOver1/HighLight',2},{'Img_Text','Panel_Ready/SelectType/Tog_ChangeOver1/HighLight/Img_Text',2},{'Normal','Panel_Ready/SelectType/Tog_ChangeOver1/Normal',2},{'Img_Text01','Panel_Ready/SelectType/Tog_ChangeOver1/Normal/Img_Text',2},{'Tog_ChangeOver2','Panel_Ready/SelectType/Tog_ChangeOver2',2},{'HighLight01','Panel_Ready/SelectType/Tog_ChangeOver2/HighLight',2},{'Img_Text02','Panel_Ready/SelectType/Tog_ChangeOver2/HighLight/Img_Text',2},{'Normal01','Panel_Ready/SelectType/Tog_ChangeOver2/Normal',2},{'Img_Text03','Panel_Ready/SelectType/Tog_ChangeOver2/Normal/Img_Text',2},{'Img_Tanchuangdi(xia)','Panel_Ready/Panel_Room/Img_Tanchuangdi(xia)',2},{'LoopScrollRole','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',2},{'ScrollMask','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask',2},{'Image','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask/Image',2},{'Img_Chiyoudi','Panel_Ready/Panel_Room/Panel_Replace/Btn_ShowRole/Img_Chiyoudi',2},{'Img_Zhuzhandi','Panel_Ready/Panel_Room/Panel_Replace/Btn_FriendRole/Img_Zhuzhandi',2},{'Img_OpenFilterdi','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Img_OpenFilterdi',2},{'Pailieicon','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Pailieicon',2},{'Img_TishiBian','Panel_Ready/Panel_Room/Img_Tips/Img_TishiBian',2},{'Img_Zuozhankaishidi','Panel_Ready/Btn_StartFight/Img_Zuozhankaishidi',2},{'Img_Zuozhankaishi_CN','Panel_Ready/Btn_StartFight/Img_Zuozhankaishi_CN',2},{'Img_Tilixiaohaodi','Panel_Ready/Btn_StartFight/Img_Tilixiaohaodi',2},{'Img_Tiliicon','Panel_Ready/Btn_StartFight/Img_Tiliicon',2},{'Btn_Back','Panel_Ready/Btn_Back',2},{'Btn_I','Panel_Ready/Btn_I',2},{'Btn_HideRoleInfo','Panel_RoleInfo/Btn_HideRoleInfo',2},{'Img_Tanchuangdi(shang)','Panel_RoleInfo/Img_Tanchuangdi(shang)',2},{'Img_Xian2','Panel_RoleInfo/Img_Xian2',2},{'Img_Xian1','Panel_RoleInfo/Img_Xian1',2},{'Img_Lihuidi','Panel_RoleInfo/RoleHead/Img_Lihuidi',2},{'Icon_RIHead','Panel_RoleInfo/RoleHead/Icon_RIHead',2},{'Icon_RIFrame','Panel_RoleInfo/RoleHead/Icon_RIFrame',2},{'Icon_RICareer','Panel_RoleInfo/RoleHead/Icon_RICareer',2},{'RIStar_1','Panel_RoleInfo/RoleHead/StarContent/RIStar_1',2},{'Normal02','Panel_RoleInfo/RoleHead/StarContent/RIStar_1/Normal',2},{'HighLight02','Panel_RoleInfo/RoleHead/StarContent/RIStar_1/HighLight',2},{'RIStar_2','Panel_RoleInfo/RoleHead/StarContent/RIStar_2',2},{'Normal03','Panel_RoleInfo/RoleHead/StarContent/RIStar_2/Normal',2},{'HighLight03','Panel_RoleInfo/RoleHead/StarContent/RIStar_2/HighLight',2},{'RIStar_3','Panel_RoleInfo/RoleHead/StarContent/RIStar_3',2},{'Normal04','Panel_RoleInfo/RoleHead/StarContent/RIStar_3/Normal',2},{'HighLight04','Panel_RoleInfo/RoleHead/StarContent/RIStar_3/HighLight',2},{'RIStar_4','Panel_RoleInfo/RoleHead/StarContent/RIStar_4',2},{'Normal05','Panel_RoleInfo/RoleHead/StarContent/RIStar_4/Normal',2},{'HighLight05','Panel_RoleInfo/RoleHead/StarContent/RIStar_4/HighLight',2},{'RIStar_5','Panel_RoleInfo/RoleHead/StarContent/RIStar_5',2},{'Normal06','Panel_RoleInfo/RoleHead/StarContent/RIStar_5/Normal',2},{'HighLight06','Panel_RoleInfo/RoleHead/StarContent/RIStar_5/HighLight',2},{'RIStar_6','Panel_RoleInfo/RoleHead/StarContent/RIStar_6',2},{'Normal07','Panel_RoleInfo/RoleHead/StarContent/RIStar_6/Normal',2},{'HighLight07','Panel_RoleInfo/RoleHead/StarContent/RIStar_6/HighLight',2},{'RIAwaken','Panel_RoleInfo/RoleHead/StarContent/RIAwaken',2},{'Super','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super',2},{'Super1','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super1',2},{'Super2','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super2',2},{'Super3','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super3',2},{'Super4','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super4',2},{'Super5','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super5',2},{'Icon_Rankdi','Panel_RoleInfo/RoleHead/Icon_Rankdi',2},{'hexin(kong)(1)','Panel_RoleInfo/hexin(kong) (1)',2},{'hexin(kong)','Panel_RoleInfo/hexin(kong)',2},{'Img_Fanweidi','Panel_RoleInfo/fanwei/Img_Fanweidi',2},{'Img_AtkRang','Panel_RoleInfo/fanwei/Img_AtkRang',2},{'Img_Fanweikuang','Panel_RoleInfo/Img_Fanweikuang',2},{'shuxingtiao(hei)','Panel_RoleInfo/RoleSilderPanel/shuxingtiao(hei)',2},{'shuxingtiao1(hei)','Panel_RoleInfo/RoleSilderPanel/shuxingtiao1(hei)',2},{'shuxingtiao2(hei)','Panel_RoleInfo/RoleSilderPanel/shuxingtiao2(hei)',2},{'shuxingtiao3(hei)','Panel_RoleInfo/RoleSilderPanel/shuxingtiao3(hei)',2},{'shuxingtiao4(hei)','Panel_RoleInfo/RoleSilderPanel/shuxingtiao4(hei)',2},{'shuxingtiao5(hei)','Panel_RoleInfo/RoleSilderPanel/shuxingtiao5(hei)',2},{'HPSlider','Panel_RoleInfo/RoleSilderPanel/HPSlider',2},{'CritDmgSlider','Panel_RoleInfo/RoleSilderPanel/CritDmgSlider',2},{'DefSlider','Panel_RoleInfo/RoleSilderPanel/DefSlider',2},{'CriSlider','Panel_RoleInfo/RoleSilderPanel/CriSlider',2},{'AtkSlider','Panel_RoleInfo/RoleSilderPanel/AtkSlider',2},{'AgrSlider','Panel_RoleInfo/RoleSilderPanel/AgrSlider',2},{'RoleInfoTxtPanel','Panel_RoleInfo/RoleInfoTxtPanel',2},{'AtkImg','Panel_RoleInfo/RoleInfoTxtPanel/AtkImg',2},{'HpImg','Panel_RoleInfo/RoleInfoTxtPanel/HpImg',2},{'DefImg','Panel_RoleInfo/RoleInfoTxtPanel/DefImg',2},{'Evaimg','Panel_RoleInfo/RoleInfoTxtPanel/Evaimg',2},{'ChdImg','Panel_RoleInfo/RoleInfoTxtPanel/ChdImg',2},{'CriImg','Panel_RoleInfo/RoleInfoTxtPanel/CriImg',2},{'SupImg','Panel_RoleInfo/RoleInfoTxtPanel/SupImg',2},{'SkillPanel','Panel_RoleInfo/SkillPanel',2},{'SkillIconPanel','Panel_RoleInfo/SkillPanel/SkillIconPanel',2},{'SkillIcon_1','Panel_RoleInfo/SkillPanel/SkillIconPanel/SkillIcon_1',2},{'SkillIcon_2','Panel_RoleInfo/SkillPanel/SkillIconPanel/SkillIcon_2',2},{'SkillIcon_3','Panel_RoleInfo/SkillPanel/SkillIconPanel/SkillIcon_3',2},{'SkillIcon_4','Panel_RoleInfo/SkillPanel/SkillIconPanel/SkillIcon_4',2},{'ImageSuo','Panel_RoleInfo/SkillPanel/SkillIconPanel/SkillIcon_4/ImageSuo',2},{'Image01','Panel_RoleInfo/SkillPanel/SkillIconPanel/SkillIcon_4/ImageSuo/Image',2},{'RootAbtBuffObj','Panel_RoleInfo/RootAbtBuffObj',2},{'AbtBuffIcon','Panel_RoleInfo/AbtBuffIcon',2},{'Img','Panel_RoleInfo/AbtBuffIcon/Img',2},{'Img_Guankamingdi','Panel_PointInfo/Img_Guankamingdi',2},{'Img_Zonghefenshudi1','Panel_PointInfo/Panel_Score/Img_Zonghefenshudi1',2},{'Img_Yuandi','Panel_PointInfo/Btn_BanSkill/Img_Yuandi',2},{'Img_Jinzhiicon','Panel_PointInfo/Btn_BanSkill/Img_Jinzhiicon',2},{'Img_Jinzhijinengdi','Panel_PointInfo/Btn_BanSkill/Img_Jinzhijinengdi',2},
        -- Text 列表
        {'Text_Round','Panel_Fighting/UI_update/round/Text_Round',3},{'SkillName_Text','Panel_Fighting/UI_update/SkillName_Go/SkillName_Text',3},{'SkillName_RoleName','Panel_Fighting/UI_update/SkillName_Go/SkillName_RoleName',3},{'SkillName_Index','Panel_Fighting/UI_update/SkillName_Go/SkillName_Index',3},{'Text_Round01','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Text_Round',3},{'Text_Roundshu','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Text_Roundshu',3},{'Text_Start2','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Text_Start2',3},{'Text_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Text_Start',3},{'Text_HP','Panel_Fighting/Btn_HP/Text_HP',3},{'Text_UI','Panel_Fighting/Btn_UI/Text_UI',3},{'Text_Replace','Panel_Ready/Panel_Select/Text_Replace',3},{'Text_Order','Panel_Ready/Panel_Select/Text_Order',3},{'Text_Rormation','Panel_Ready/Panel_Select/Text_Rormation',3},{'Text_Cunqu','Panel_Ready/SelectType/LineupBtns/Btn_Rormation/Text_Cunqu',3},{'Text_Jiechu','Panel_Ready/SelectType/LineupBtns/Btn_Remove/Text_Jiechu',3},{'Text_Huanyuan','Panel_Ready/SelectType/OrderBtns/Btn_Restore/Text_Huanyuan',3},{'Text_Yiqi','Panel_Ready/SelectType/OrderBtns/Btn_Altogether/Text_Yiqi',3},{'Text_Fenbie','Panel_Ready/SelectType/OrderBtns/Btn_Separate/Text_Fenbie',3},{'Text','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask/Image/Text',3},{'Text_ShowRole','Panel_Ready/Panel_Room/Panel_Replace/Btn_ShowRole/Text_ShowRole',3},{'Text_FriendRole','Panel_Ready/Panel_Room/Panel_Replace/Btn_FriendRole/Text_FriendRole',3},{'Text_Pailie','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Text_Pailie',3},{'Text_Tips','Panel_Ready/Panel_Room/Img_Tips/Text_Tips',3},{'Img_Zuozhankaishi_EN','Panel_Ready/Btn_StartFight/Img_Zuozhankaishi_EN',3},{'Text_PowerConsume','Panel_Ready/Btn_StartFight/Text_PowerConsume',3},{'Text_RILevel','Panel_RoleInfo/RoleHead/Text_RILevel',3},{'Text_RILv','Panel_RoleInfo/RoleHead/Text_RILv',3},{'Text_RIRank','Panel_RoleInfo/RoleHead/Icon_Rankdi/Text_RIRank',3},{'Text_RIName','Panel_RoleInfo/Text_RIName',3},{'Text_Occ','Panel_RoleInfo/Img_Fanweikuang/Text_Occ',3},{'Text_AtkTarget','Panel_RoleInfo/Img_Fanweikuang/Text_AtkTarget',3},{'HpInfoTxt','Panel_RoleInfo/RoleInfoTxtPanel/HpInfoTxt',3},{'AtkInfoTxt','Panel_RoleInfo/RoleInfoTxtPanel/AtkInfoTxt',3},{'DefInfoTxt','Panel_RoleInfo/RoleInfoTxtPanel/DefInfoTxt',3},{'EvaInfoTxt','Panel_RoleInfo/RoleInfoTxtPanel/EvaInfoTxt',3},{'ChdInfoTxt','Panel_RoleInfo/RoleInfoTxtPanel/ChdInfoTxt',3},{'CriInfoTxt','Panel_RoleInfo/RoleInfoTxtPanel/CriInfoTxt',3},{'RoleDesTxt','Panel_RoleInfo/SkillPanel/RoleDesTxt',3},{'Text01','Panel_RoleInfo/AbtBuffIcon/Text',3},{'Text_PointName','Panel_PointInfo/Text_PointName',3},{'Text_MoNi','Panel_PointInfo/Text_MoNi',3},{'Text_Score','Panel_PointInfo/Panel_Score/Text_Score',3},{'Text_Zonghefenshu1','Panel_PointInfo/Panel_Score/Text_Zonghefenshu1',3},{'Text_Jinzhijineng1','Panel_PointInfo/Btn_BanSkill/Text_Jinzhijineng1',3},
        -- Button 列表
        {'Btn_Speed','Panel_Fighting/Btn_Speed',4},{'Btn_Rormation01','Panel_Ready/SelectType/LineupBtns/Btn_Rormation',4},{'Btn_Remove','Panel_Ready/SelectType/LineupBtns/Btn_Remove',4},{'Btn_Restore','Panel_Ready/SelectType/OrderBtns/Btn_Restore',4},{'Btn_Altogether','Panel_Ready/SelectType/OrderBtns/Btn_Altogether',4},{'Btn_Separate','Panel_Ready/SelectType/OrderBtns/Btn_Separate',4},{'Btn_ShowRole','Panel_Ready/Panel_Room/Panel_Replace/Btn_ShowRole',4},{'Btn_OpenFilter','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',4},{'Btn_StartFight','Panel_Ready/Btn_StartFight',4},{'Btn_Back01','Panel_Ready/Btn_Back',4},{'Btn_I01','Panel_Ready/Btn_I',4},{'Btn_BanSkill','Panel_PointInfo/Btn_BanSkill',4},
        -- UITemplate 列表
        {'BattleRoleItem','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole/BattleRoleItem',10},{'RICore1','Panel_RoleInfo/RICore1',10},{'RICore2','Panel_RoleInfo/RICore2',10},
        -- Toggle 列表
        {'Btn_HP','Panel_Fighting/Btn_HP',13},{'Btn_UI','Panel_Fighting/Btn_UI',13},{'Tog_Replace01','Panel_Ready/Panel_Select/Tog_Replace',13},{'Tog_Order01','Panel_Ready/Panel_Select/Tog_Order',13},{'Tog_ChangeOver101','Panel_Ready/SelectType/Tog_ChangeOver1',13},{'Tog_ChangeOver201','Panel_Ready/SelectType/Tog_ChangeOver2',13},
        -- RawImage 列表
        {'Panel_Fighting','Panel_Fighting',15},{'Btn_Speed01','Panel_Fighting/Btn_Speed',15},{'Panel_Ready','Panel_Ready',15},{'Btn_Rormation02','Panel_Ready/SelectType/LineupBtns/Btn_Rormation',15},{'Btn_Remove01','Panel_Ready/SelectType/LineupBtns/Btn_Remove',15},{'Btn_Restore01','Panel_Ready/SelectType/OrderBtns/Btn_Restore',15},{'Btn_Altogether01','Panel_Ready/SelectType/OrderBtns/Btn_Altogether',15},{'Btn_Separate01','Panel_Ready/SelectType/OrderBtns/Btn_Separate',15},{'Panel_Replace','Panel_Ready/Panel_Room/Panel_Replace',15},{'Btn_ShowRole01','Panel_Ready/Panel_Room/Panel_Replace/Btn_ShowRole',15},{'Btn_OpenFilter01','Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',15},{'Btn_StartFight01','Panel_Ready/Btn_StartFight',15},{'Panel_RoleInfo','Panel_RoleInfo',15},{'Img_Xian','Panel_RoleInfo/Img_Xian',15},{'RICore101','Panel_RoleInfo/RICore1',15},{'RICore201','Panel_RoleInfo/RICore2',15},{'Panel_PointInfo','Panel_PointInfo',15},{'Panel_Score','Panel_PointInfo/Panel_Score',15},{'Btn_BanSkill01','Panel_PointInfo/Btn_BanSkill',15},
        -- LoopScrollRect 列表
        {'LoopScrollRole01','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',18},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    self.isInited = false
    self:OnInitFight()
end

function M:OnInitFight()
    ---0、无点击，1、设置角色，2、问号排序模式，3、交换排序模式、4、战斗中
    self.CurMode = 0
    ---在切换到调整顺序时,控制头像的遮挡
    self.SelectRoleStop = false
    ---显示透明地板
    CJNBattleMgr.Instance:SetFloorShowImg(true)
    ---获取战斗摄像机
    self.battleCamera = CMgrCamera.Instance.FightCamera
    ---获取ui摄像机
    self.uiCamera = GameObject.Find("UI_Camera"):GetComponent("Camera")
    ---初始化UI
    self:InitBattleUI()
    ---初始化战斗场景
    self:InitBattle()
    ---加载默认阵型(只加载左边队伍,不创建Boss)
    self:LoadTeamRole(0,0.55)
    ---注册开始战斗事件
    UIEvent.LuaClick(self.Btn_StartFight().gameObject,Handle(self,function ()
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
            return
        end
        if not isOnlyAux then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("novicebattle_ui_tips2"),1},true)
            return
        end
        -----设置当前模式
        --self.CurMode = 4
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

        --if BattleViewModel.TeamCorrect then
        --    ---播放警告
        --    CJNBattleMgr.Instance:SetBossWarning()
        --    ---补全角色信息
        --    for i, role in pairs(BattleManager.AllRole) do
        --        if role.IsLeft == true then
        --            CAnimation.SetRoleData(role.myAni,role.GameID,role.PosX,role.PosY,role.IsLeft,0,role.HPmax)
        --        end
        --    end
        --    ---设置RoleUI
        --    BattleManager.SetLeftSpineUI()
        --    ---UI
        --    self.UI_update().gameObject:SetActive(true)
        --    self.Panel_Fighting().gameObject:SetActive(true)
        --    self.Panel_Score().gameObject:SetActive(true)
        --    ---战斗相机位
        --    self:MoveCamera(6,1)
        --    ---检测是否为模拟战斗
        --    if StormViewModel.IsAnaWorldBoss == true then
        --        ---模拟战不需要预算数据直接开战即可
        --        ---开始战斗
        --        self:ShowRoleInfo()
        --        BattleManager.GameMode = BattleManager.GameModeType.AniWorldBoss
        --        BattleManager.GameStart(true,Handle(self,self.ClosePanel))
        --        ---刷新地板
        --        CJNBattleMgr.Instance:SetAllFloorHid()
        --    else
        --        ---非模拟战要提前获取数据并告知服务器
        --        --[[
        --        BattleManager.GameStart_OnlyData(function(_List_Id, _List_Name,_List_Out,_List_In, _Len ,_ToRight,_List_BossPoint,_bossHp, _StrLeftDead_RightDead_round)
        --            ---计算积分（待配表，目前先按照boss掉血量1：1计分）
        --            local atkScore = StormViewModel.GetWorldBossData().atkHp - _bossHp
        --            atkScore = atkScore > StormViewModel.GetWorldBossData().atkHp and StormViewModel.GetWorldBossData().atkHp or atkScore
        --            ---向服务器发送开战请求
        --            local buffer = assert(pb.encode('PBClient.ClientBossBattleREQ',{ score = atkScore, key = StormViewModel.GetWorldBossData().subKey}))
        --            MgrNet.SendReq(MID.CLIENT_BOSS_BATTLE_REQ,buffer,0,function(err,msgId)
        --                if not err then
        --                    Log.Error("世界Boss战斗消息发送失败")
        --                    MgrUI.Pop(UID.PopTip_UI,{string.format("网络信号差",err),1},true)
        --                    ---网络异常处理
        --                    ---销毁战斗数据
        --                    BattleManager.ClearLuaData()
        --                    ---结束战斗界面
        --                    StormViewModel.CloseWorldBossBattle()
        --                end
        --            end,function(buffer, tag)
        --                local tab = assert(pb.decode('PBClient.ClientBossBattleACK',buffer))
        --                if tab.errNo ~= 0 then
        --                    Log.Error(string.format("开始世界boss失败，error = %s",tab.errNo))
        --                    MgrUI.Pop(UID.PopTip_UI,{string.format("网络异常:%s",tab.errNo),1},true)
        --                    ---网络异常处理
        --                    ---销毁战斗数据
        --                    BattleManager.ClearLuaData()
        --                    ---结束战斗界面
        --                    StormViewModel.CloseWorldBossBattle()
        --                end
        --            end,function(buffer, tag)
        --                local tab = assert(pb.decode('PBClient.ClientBossBattleNTF',buffer))
        --                ---更新数据统计
        --                TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        --                ---更新战斗结果
        --                if tab.count == 1 then
        --                    StormViewModel.GetWorldBossData().score = tab.score
        --                elseif tab.count == 2 then
        --                    local curScore = StormViewModel.GetWorldBossData().score
        --                    StormViewModel.GetWorldBossData().score = curScore + tab.score
        --                end
        --                StormViewModel.GetWorldBossData().count = tab.count
        --                StormViewModel.GetWorldBossData().maxScore = tab.maxScore
        --                ---开始战斗
        --                self:ShowRoleInfo()
        --                BattleManager.GameMode = BattleManager.GameModeType.WorldBoss
        --                BattleManager.GameStart(true)
        --                ---刷新地板
        --                CJNBattleMgr.Instance:SetAllFloorHid()
        --            end)
        --        end)]]
        --        BattleManager.GameMode = BattleManager.GameModeType.WorldBoss
        --        BattleManager.GameStart(true,Handle(self,self.ClosePanel))
        --    end
        --else
            --return
        --end
    end))
end

function M:ClosePanel()

    ---设置开战条件
    self.Panel_Fighting().gameObject:SetActive(true)
    self.UI_update().gameObject:SetActive(true)
    self.Panel_Score().gameObject:SetActive(true)
    self.Panel_Ready().gameObject:SetActive(false)
    self.Btn_BanSkill().gameObject:SetActive(false)
    -- BattleManager.GameStart_LuatoC()
    if tonumber(BattleManager.AllRole[1].ID) == 900002 then
        --隐藏耶梦加得遮挡相机的身体
        BattleManager.AllRole[1].myAni:HideYMJDBody({4,6})
    end
    ---补全角色信息
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            CAnimation.SetRoleData(role.myAni,role.GameID,role.PosX,role.PosY,role.IsLeft,0,role.HPmax)
        end
    end
    ---设置RoleUI
    BattleManager.SetLeftSpineUI()
    BattleManager.GameStart_LuatoC()
end

function M:OnShowFinish()
    self.isInited = true
    ---刷新头像滑块UI
    self:ReloadSelectRole(0)
    ---播放警告
    CJNBattleMgr.Instance:SetBossWarning()
    ---相机位置
    MgrCamera.VirCamerasInit(MgrCamera.cameraParasData_New)
    CJNBattleMgr:ActiveBuildings()
end

---初始化战斗场景
function M:InitBattle()
    ---初始化地图,路径示例ABOriginal/Prefab/Common/Map/ui_map_daily_01_01.prefab
    ---boss名和boss尺寸
    BattleManager.BodyName=WorldBossData.Niai_BodyName
    BattleManager.BodySize=WorldBossData.Niai_BossSize
    --CJNUIMgr.InitBattleMapNodePosList(SteamLocalData.tab[113005][2],SteamLocalData.tab[113006][2])
    CJNUIMgr.InitBattleMapNodePosList2(BattleManager.FloorPos.left,BattleManager.FloorPos.right)
    ---背景
    --if CJNBattleMgr.Instance then
        --CJNBattleMgr.Instance:SetBG(string.format("ABOriginal/Map/%s.prefab",StormViewModel.GetWorldBossData().battleMap),true)
    --end
    ---Boss关调整公告位置
    SysNoticeControl.SetSysNoticeOffsetY(-274)

    ---初始隐藏战斗信息面板
    self.Panel_Fighting().gameObject:SetActive(false)
    ---初始化战斗场景
    MgrSound.PlayEffect("yx_boss_jingbao",1,0.5,false)
    ---开始战斗     放置两队位置
    BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,5,EventRaidControl.GetLIANHETAOFAData().BossData[1].prohibit)
    ---加载队伍顺序图片
    self:ReloadOrder(false)
    ---0.1f后更新地板
    CJNBattleMgr.Instance.worldBossBattle = true
    MgrTimer.AddDelayNoName(0.1,function()
        CJNBattleMgr.Instance:SetAllFloorHid()
    end,nil)
    ---设置屏幕点击状态1：按下 2：拖拽 3：抬起
    self.OnState = 1
    ---开启屏幕按键检测循环
    MgrTimer.AddRepeat("BattleUIUpdate",0, function ()
        if CJNBattleMgr.Instance.IsPause == true then
            ---暂停时不允许点击
            return
        end
        if self.CurMode == 0 then
            return
        end
        ---状态1检测按下
        if self.OnState == 1 and UIEvent.GetButton_Down() then
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
        elseif self.OnState == 2 then
            ---拖拽通知
            self:OnDrag()
            ---检测抬起
            if UIEvent.GetButton_Up() then
                ---切换到抬起状态
                self.OnState = 3
            end
        elseif self.OnState == 3 then
            ---抬起通知
            self:OnEndDrag()
            ---切换到检测按下状态
            self.OnState = 1
        end
        ---若开启了战斗且打开了角色面板开始实时更新
        if BattleManager.IsFightStart then
            ---若打开了角色面板实时更新角色信息
            if self.CurRoleInfo ~= nil then
                self:UpdateRoleInfo()
            end
        end
    end,-1,nil)
end

function M:OnBeginDrag()
    ---发射射线抓取地板角色GameId， 0为空
    self.ShowRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
    ---设置选中的角色
    CJNUIMgr.SetUiTop(tonumber(self.ShowRoleId))
    ---按下位置存在角色则显示角色信息,否则隐藏角色信息
    if self.ShowRoleId ~= nil and self.ShowRoleId ~= 0 then
        ---显示
        for i, role in pairs(BattleManager.AllRole) do
            if role.GameID == self.ShowRoleId then
                self:ShowRoleInfo(role)
                break
            end
        end
    end

    if self.CurMode == 1 then
        ---设置角色模式
        -----显示透明地板
        --CJNBattleMgr.Instance:SetFloorShowImg(true)
        ---抓取地板role
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---清空地板数据
            BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = 0
            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, 0, 0)
            ---修改透明度
            self.dragRole.myAni:SetAlpha(0.5)
            ---设置uiItem
            self.UIDragItem:SetData({HeroControl.GetRoleDataByID(tonumber(self.dragRole.ID)),self})
            -----添加到滑块数据
            --StormViewModel.AddHeroData(tonumber(self.dragRole.ID))
            -----刷新滑块UI
            --self:ReloadSelectRole(tonumber(self.dragRole.ID))
        end
    elseif self.CurMode == 2 then
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
        end
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---抓取选中的角色顺序图标
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            self.dragRoleAtkOder = self.dragRole.myAni.transform:Find("AtkOrder(Clone)").gameObject
            local dragCanvas = self.dragRoleAtkOder:GetComponent("Canvas")
            dragCanvas.sortingOrder = dragCanvas.sortingOrder + 1
        end
    end
end
function M:OnDrag()
    ---战斗中不执行
    if BattleManager.IsFightStart then
        return
    end
    if self.CurMode == 1 then
        ---设置角色模式
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---若存在抓取到的角色更新抓取角色的位置
            local posArr = CJNBattleMgr.Instance:RayAndSetGo(self.dragRole.myAni.gameObject)
            ---更新uiItem位置
            self.UIDragItem.transform.localPosition = Tools.GetUIPos(self.dragRole.myAni.gameObject,self.battleCamera,self.uiCamera,self.selectRoleRect)
            ---判断是否是第一次拖拽
            if self.isOnceDrag then
                ---若是第一次则显示攻击范围及羁绊
                self.isOnceDrag = false
            elseif self.LastDragPos_X == posArr[1] and self.LastDragPos_Y == posArr[2] then
                ---若与上一帧位置相同则不显示
                return
            end
            ---记录坐标
            self.LastDragPos_X = posArr[1]
            self.LastDragPos_Y = posArr[2]
            if posArr[1] == 0 or posArr[2] == 0 then
                ---若坐标为零不显示
                return
            end
            ---重置地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            --CJNBattleMgr.Instance:CloseAllRightFloor()
            ---显示攻击范围及羁绊
            BattleManager.FAndShowRound(self.dragRole, posArr[1], posArr[2])
        end
    elseif self.CurMode == 2 then
        ---设置排序模式
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---若存在抓取到的角色更新抓取角色的顺序图标位置
        if self.dragRoleAtkOder ~= nil then
            CJNBattleMgr.Instance:RayAndSetGo(self.dragRoleAtkOder)
        end
    end
end
function M:OnEndDrag()
    if BattleManager.IsFightStart  then
        return
    end
    if self.CurMode == 1 then
        -----隐藏透明地板
        --CJNBattleMgr.Instance:SetFloorShowImg(false)
        ---结束显示攻击范围及羁绊
        CJNBattleMgr.Instance:EndLine()
        ---设置角色模式
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---获取射线返回的地板信息:[0]id -1不能写入、为0则是空地板、其他数则为id，[1]地板x，[2]地板y
            local reuIntArr = CJNBattleMgr.Instance:RayGoInFloor(self.dragRole.myAni.gameObject,0,0,self.dragRole.GameID,self.dragRole.Occupation)
            if reuIntArr[0] == -1 then
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
                ---添加到滑块数据
                StormViewModel.AddHeroData(tonumber(self.dragRole.ID))
                ---刷新滑块UI
                self:ReloadSelectRole()
            elseif reuIntArr[0] == 0
            then
                ---重新设置xy并更新位置
                self.dragRole.PosX = reuIntArr[1]
                self.dragRole.PosY = reuIntArr[2]
                ---更新地板数据
                BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                -----移除uiItem队列
                --StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
            else
                if BattleManager.GameIdCout > #BattleManager.AllRole then
                    BattleManager.GameIdCout = BattleManager.GameIdCout - 1
                end
                ---交换角色位置
                ---获取目标位置角色
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
                -----移除uiItem队列
                --StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
            end
            ---还原角色透明度
            for i, role in pairs(BattleManager.AllRole) do
                role.myAni:SetAlpha(1)
            end
            ---更新提示
            self:UpdateTips(1)
            ---下一帧更新所有地板
            MgrTimer.AddDelayNoName(0.01,function()
                CJNBattleMgr.Instance:SetAllFloorHid()
                --CJNBattleMgr.Instance:CloseAllRightFloor()
            end,nil)
            ---将单次检测插值设为开启
            self.isOnceDrag = true
            ---还原摄像机位置
            --self:MoveCamera(5,1)
            ---清空dragRole
            self.dragRole = nil
            ---还原uiItem位置
            self.UIDragItem.transform.localPosition = Vector3(0,10000,0)
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
            ---获取位置是否存在角色
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
                        local dragRoleGameID = self.dragRole.myAni.GameID
                        self.dragRole.myAni.GameID = targetRole.myAni.GameID
                        targetRole.myAni.GameID = dragRoleGameID

                        self.dragRole.GameID = targetRole.GameID
                        targetRole.GameID = dragRoleGameID

                        BattleManager.AllRole[self.dragRole.GameID] = self.dragRole
                        BattleManager.AllRole[targetRole.GameID] = targetRole

                        -----设置地板GameID
                        targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                        self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                    end
                end
            end
            ---刷新队列顺序
            self:ReloadOrder(true)
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
end
---初始化UI
function M:InitBattleUI()
    ---注册boss积分回调
    self.curScore = 0
    BattleManager.BossScoreCell = function(bossNumber_In)
        ---当前先按照1：1显示积分，待策划配置积分倍率后修改
        ---实时更新boss受到的伤害
        self.curScore = bossNumber_In
        if tonumber(self.Text_Score().text) ~= self.curScore then
            Tools.DoBattleText(self.Text_Score(),self.curScore,10,1,0,true,1,"battle Add Score")
        end
    end
    ---隐藏分数
    self.Panel_Score().gameObject:SetActive(false)
    ---根据是否为模拟战显示
    self.Text_MoNi().gameObject:SetActive(StormViewModel.IsAnaWorldBoss)
    ---注册显示禁止技能按钮
    UIEvent.LuaClick(self.Btn_BanSkill().gameObject, function()
        ---显示禁止技能弹窗
        MgrUI.Pop(UID.BattleBanSkillPop_UI,{EventRaidControl.GetLIANHETAOFAData().BossData[1].prohibit,ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).BossData[1].monsterData},true)
    end)

    ---拖拽显示UIItem
    self.UIDragItem = self.BattleRoleItem()
    ---角色信息节点
    self.Panel_RoleInfo = self.Panel_RoleInfo().gameObject
    ---注册隐藏角色信息面板
    UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
        self:ShowRoleInfo()
    end)
    ---初始隐藏角色信息面板
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
    ---获取关卡英雄数据
    StormViewModel.GetHeroData()
    ---注册退出
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        ---关闭点击检测
        MgrTimer.Cancel("BattleUIUpdate")
        ---销毁战斗数据
        BattleManager.ClearLuaData()

        ---结束战斗界面
        StormViewModel.CloseWorldBossBattle()
    end))
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
    end))
    ---初始化提示信息
    self.text_Tips = self.Text_Tips()
    ---左侧选取栏高亮
    local SelectType1 = {
        [1] = self.Tog_ChangeOver1().transform:Find("Normal").gameObject,
        [2] = self.Tog_ChangeOver1().transform:Find("HighLight").gameObject,
    }
    local SelectType2 = {
        [1] = self.Tog_ChangeOver2().transform:Find("Normal").gameObject,
        [2] = self.Tog_ChangeOver2().transform:Find("HighLight").gameObject,
    }
    Tools.ToggleValueChange(self.Tog_ChangeOver101(),function(isOn)
        SelectType1[1]:SetActive(not isOn)
        SelectType1[2]:SetActive(isOn)
        self.LineupBtns().gameObject:SetActive(isOn)
        self:ReloadOrder(not isOn)
        ---是阵型存取
        if isOn then
            ---在切换到调整顺序时，控制头像的遮挡
            self.SelectRoleStop = false
            ---还原摄像机位置
            self:MoveCamera(5,1)
            ---设置当前模式为选择角色
            self.CurMode = 1
            ---更新替换队员面板
            self:ReloadSelectRole()
        end
    end,nil)

    Tools.ToggleValueChange(self.Tog_ChangeOver201(),function(isOn)
        SelectType2[1]:SetActive(not isOn)
        SelectType2[2]:SetActive(isOn)
        self.OrderBtns().gameObject:SetActive(isOn)
        ---在切换到调整顺序时,添加滑条遮罩
        if self.selectRoleLoop.totalCount == 0 then
            ---如果角色池空了 不显示滑条遮罩
            self.ScrollMask().gameObject:SetActive(false)
        else
            self.ScrollMask().gameObject:SetActive(isOn)
        end
        self.Btn_OpenFilter().gameObject:SetActive(not isOn)
        self:ReloadOrder(isOn)
        ---是阵型存取
        if isOn then
            ---在切换到调整顺序时，控制头像的遮挡
            self.SelectRoleStop = true
            ---还原摄像机位置
            self:MoveCamera(6,1)
            ---设置当前模式为拖拽排序
            self.CurMode = 3
            ---更新替换队员面板
            self:ReloadSelectRole()
        end
    end,nil)
    ---注册替换队员滑块
    self.selectRoleLoop = self.LoopScrollRole01()
    self.selectRoleLoop:SetLuaCellEvent(Handle(self,self.CellSelectRole))
    self.selectRoleRect = self.selectRoleLoop.transform:GetComponent("RectTransform")
    ---默认打开替换队员
    self.Tog_ChangeOver201().isOn = true
    self.Tog_ChangeOver201().isOn = false
    self.Tog_ChangeOver101().isOn = true
    ---注册顺序初始化按钮
    --UIEvent.LuaClick(self.Btn_Restore().gameObject,function()
    --    ---将顺序显示为"？"
    --    for i, role in pairs(BattleManager.AllRole) do
    --        if role.IsLeft == true then
    --            role.myAni:SetOrder(-1, role.IsLeft, true)
    --        end
    --    end
    --    ---开启问号排序模式
    --    self.CurMode = 2
    --    ---重置队列索引
    --    self.CurAtkOrderIndex = 1
    --    ---重置已排序队列
    --    self.FinishOrder = {}
    --    ---拉近摄像机位置
    --    self:MoveCamera(4,0)
    --    ---刷新右侧队列顺序
    --    self:ReloadOrder(true,true)
    --end)
    ---注册查看敌我双方顺序按钮
    UIEvent.LuaClick(self.Btn_Separate().gameObject,function()
        self:ReloadOrder(true)
        ---还原摄像机位置
        self:MoveCamera(6,1)
        ---开启交换排序模式
        self.CurMode = 3
    end)
    ---注册查看整体顺序按钮
    UIEvent.LuaClick(self.Btn_Altogether().gameObject,function()
        BattleManager.Rank()
        for i, role in pairs(BattleManager.AllRole) do
            role.myAni:SetOrder(role.AllAtkOrder,role.IsLeft, true)
        end
        ---还原摄像机位置
        self:MoveCamera(6,1)
        ---开启交换排序模式
        self.CurMode = 3
    end)
    ---注册阵型显示按钮
    UIEvent.LuaClick(self.Btn_Rormation().gameObject,function()
        local m = self.CurMode
        self.CurMode = 0
        self:ShowRoleInfo()
        ---@type FighterBase[] 创建当前使用的阵型数据
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
        MgrUI.Pop(UID.TeamGroupPop_UI,{fighters,function()
            ---返回回调
            self.CurMode = m
        end,function(idx)
            ---改变阵型回调
            self:LoadTeamRole(idx,0)
        end},true)
    end)
    ---下标和回合数字对应
    self.List_Index_IconTex={}
    ---下标和游戏物体对应
    self.List_Index_GoIcon={}
    ---要显示的图片
    self.List_Name={}
    ---要显示的回合数
    self.List_Turn={}
    self.List_Index={}
    ---每隔0.1秒 从c# 获取一次值
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
    ---注册HP显示隐藏按钮
    --Tools.ToggleValueChange(self.Btn_HP(),function(isOn)
    --    if isOn then
    --        self:ShowHpText()
    --    else
    --        self:HideHpText()
    --    end
    --end,nil)
    ---注册UI显示隐藏按钮
    --Tools.ToggleValueChange(self.Btn_UI(),function(isOn)
    --    ---显示/隐藏地板
    --    CJNBattleMgr.Instance:SetWgShow(isOn)
    --    ---显示/隐藏关卡信息
    --    self.Panel_PointInfo().gameObject:SetActive(isOn)
    --    if not isOn then
    --        ---关闭已经打开的角色信息
    --        if self.Panel_RoleInfo.activeSelf then
    --            self:ShowRoleInfo()
    --        end
    --    end
    --end,nil)
    ---初始化速度显示
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
    UIEvent.LuaClick(self.Btn_Pause().gameObject,function()
        CJNBattleMgr.Instance.IsPause = true
        MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole,2},true)
        ---隐藏角色信息面板
        self:ShowRoleInfo()
    end)
    ---设置右上角关卡信息
    self.Text_PointName().text = EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData.name

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
    self.roleData = StormViewModel.GetSortAndFilterHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise)
    ---设置数量
    self.selectRoleLoop.totalCount = #self.roleData
    if isMoveId == nil then
        ---直接刷新面板
        self.selectRoleLoop:RefreshCells()
    elseif isMoveId == 0 then
        self.selectRoleLoop:RefillCells(0)
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
        self.selectRoleLoop:RefillCells(index)
    end
end
function M:OnUpdateUI()
    ---播放背景音乐
    MgrSound.PlayBGM(EventRaidControl.GetLIANHETAOFAData().bgm,0.2)
end
---销毁
function M:OnClose()
    ---注销积分回调
    BattleManager.BossScoreCell = nil
    ---注销界面点击更新
    MgrTimer.Cancel("BattleUIUpdate")
    ---还原播放速度
    CJNBattleMgr.SetGameSpeed(1)
    ---销毁战斗数据
    BattleManager.ClearLuaData()
    ---还原公告位置
    SysNoticeControl.SetSysNoticeOffsetY(274)
    self:SetCFunNull();
end
---更新提示信息
function M:UpdateTips(type)
    if type == 1 then
        ---选取提示
        local count = 0
        for i, v in pairs(BattleManager.AllRole) do
            if v.IsLeft == true then
                count = count + 1
            end
        end
        self.text_Tips.text = string.format(MgrLanguageData.GetLanguageByKey("novicebattle_ui_battlecharacter"),count)
    elseif type == 2 then
        ---顺序提示
        self.text_Tips.text = MgrLanguageData.GetLanguageByKey("novicebattle_ui_tips3")
    elseif type == 3 then
        ---阵型提示
        self.text_Tips.text = MgrLanguageData.GetLanguageByKey("novicebattle_ui_tips4")
    elseif type == 4 then
        ---组合提示
        self.text_Tips.text = MgrLanguageData.GetLanguageByKey("novicebattle_ui_tips5")
    elseif type == 5 then
        ---助战提示
        self.text_Tips.text = MgrLanguageData.GetLanguageByKey("novicebattle_ui_tips6")
    end
end
---重新加载排序图标
function M:ReloadOrder(isBig,onlyRight)
    for k, role in pairs(BattleManager.AllRole) do
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
---显示/隐藏角色详细信息
function M:ShowRoleInfo(role,isRatio)
    self.CurRoleInfo = role
    ---若未抓取角色或在战斗中并关闭了UI则不显示
    if role == nil or (BattleManager.IsFightStart and not self.Btn_UI().isOn) then
        self.CurRoleInfo = nil
        self.Panel_RoleInfo:SetActive(false)
    else
        self.Panel_RoleInfo:SetActive(true)
        ---获取角色数据
        local roleData = role.IsMonster and EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData or HeroControl.GetRoleDataByID(tonumber(role.ID))
        ---更新头像
        MgrRes.LoadQIcon(self.Icon_RIHead(),roleData.id)
        ---更新边框
        MgrRes.LoadSprite(self.Icon_RIFrame(),roleData.iconBattleFrame)
        ---更新等级
        self.Text_RILevel().text = roleData.level
        ---根据类型，更新职业图标
        local BossData = MonsterControl.GetMonster(roleData.id)
        if roleData.isBoss then
            MgrRes.LoadSprite(self.Icon_RICareer(),BossData.iconCareer)
        else
            MgrRes.LoadSprite(self.Icon_RICareer(),roleData.iconCareer)
        end
        ---更新星级
        for starLv = 1, #self.rIStarHl do
            local isStar = roleData.star < starLv
            --self.rIStarNor[starLv]:SetActive(isStar)
            self.rIStarNor[starLv]:SetActive(not isStar)
            self.rIStarHl[starLv]:SetActive(not isStar)
            self.superStars[starLv]:SetActive(not isStar)
        end
        ---更新觉醒
        local isAwaken = false
        if type(roleData.awaken) == "number" then
            isAwaken = roleData.awaken > 0
        else
            isAwaken = roleData.awaken
        end
        self.rIAwaken:SetActive(isAwaken)
        ---更新技能等级
        self.Text_RIRank().text = "+"..roleData.skillLevel
        ---更新角色名称
        self.Text_RIName().text = roleData.name
        ---更新核心
        local core1 -- = roleData:GetCore(1)
        local core2 -- = roleData:GetCore(2)

        if role.IsMonster then
            core1 = roleData:GetMonsterCore(1)
            core2 = roleData:GetMonsterCore(2)
        else
            core1 = roleData:GetHeroCore(1)
            core2 = roleData:GetHeroCore(2)
        end
        self.RICore1().gameObject:SetActive(core1 ~= nil)
        self.RICore2().gameObject:SetActive(core2 ~= nil)
        if core1 ~= nil then
            self.RICore1().transform:GetComponent("UITemplate"):SetData(core1)
        end
        if core2 ~= nil then
            self.RICore2().transform:GetComponent("UITemplate"):SetData(core2)
        end
        ---更新攻击距离
        if role.Occupation == 4 then
            MgrRes.LoadSprite(self.Img_AtkRang(),"AtkRange/SupportRange/"..role.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Img_AtkRang(),"AtkRange/OtherRange/"..role.AttackRangeTexture)
        end
        ---设置距离文本
        if role.Occupation == 3 then
            self.Text_Occ().text = "2R"
        else
            self.Text_Occ().text = "1R"
        end
        ---设置位置文本
        if role.Attacktarget == 1 then
            self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_front")
        elseif role.Attacktarget == 2 then
            self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_passover")
        elseif  role.Attacktarget == 3 then
            self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_end")
        elseif  role.Attacktarget == 4 then
            self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
        elseif  role.Attacktarget == 5 then
            self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_random")
        elseif  role.Attacktarget == 7 then
            self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
        elseif  role.Attacktarget == 8 then
            self.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
        end
        ---更新属性
        if role.Occupation == 4 then
            --- 支援型
            self.AtkImg().gameObject:SetActive(false)
            self.SupImg().gameObject:SetActive(true)
            self.AtkInfoTxt().text = (self.GetInfoCorrect(role.RealSuppart)).."%"
            Tools.SetImgFillRate(self.AtkSlider().gameObject, role.RealSuppart)
        else
            --- 非支援
            self.SupImg().gameObject:SetActive(false)
            self.AtkImg().gameObject:SetActive(true)
            self.AtkInfoTxt().text = math.floor(role.RealAtk)
            Tools.SetImgFillRate(self.AtkSlider().gameObject,(tonumber(role.RealAtk)/tonumber(role.Atk)))
        end
        if tonumber(role.HP) >= 1000000 then
            self.HpInfoTxt().text = (self.GetMillionNumInfo(role.HP)).."M"
        else
            self.HpInfoTxt().text = math.floor(role.HP)
        end

        --local tValue = isRatio and 1 or 10000
        Tools.SetImgFillRate(self.HPSlider().gameObject,tonumber(role.HP)/tonumber(role.HPmax))
        self.DefInfoTxt().text = (self.GetInfoCorrect(role.RealDef)).."%"
        Tools.SetImgFillRate(self.DefSlider().gameObject,tonumber(role.RealDef))
        self.CriInfoTxt().text = (self.GetInfoCorrect(role.RealCrit)).."%"
        Tools.SetImgFillRate(self.CriSlider().gameObject,role.RealCrit)
        self.EvaInfoTxt().text = (self.GetInfoCorrect(role.RealAgile)).."%"
        Tools.SetImgFillRate(self.AgrSlider().gameObject,role.RealAgile)
        self.ChdInfoTxt().text = (self.GetInfoCorrect(role.RealCritDmg)).."%"
        Tools.SetImgFillRate(self.CritDmgSlider().gameObject,role.RealCritDmg)
        ---更新技能
        self.RoleDesTxt().text = roleData.atkDescription
        self.SkillIcon_1().gameObject:SetActive(true)
        if role.Skill_1_example[1] ~= nil then
            MgrRes.LoadSprite(self.SkillIcon_1(),"Skill/"..role.Skill_1_example[1].Icon)
        else
            MgrRes.LoadSprite(self.SkillIcon_1(),"Skill/".."icon_skill_empty")
        end
        ---设置点击
        UIEvent.LuaClick(self.SkillIcon_1().gameObject, function()
            if #role.Skill_1_example == 0 or role.Skill_1_example == nil then
                return
            end
            MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_1_example,1},true)
        end)
        ---设置技能2
        self.SkillIcon_2().gameObject:SetActive(true)
        if role.Skill_2_example[1]~=nil then
            MgrRes.LoadSprite(self.SkillIcon_2(),"Skill/"..role.Skill_2_example[1].Icon)
        else
            MgrRes.LoadSprite(self.SkillIcon_2(),"Skill/".."icon_skill_empty")
        end
        ---设置点击2
        UIEvent.LuaClick(self.SkillIcon_2().gameObject, function ()
            if #role.Skill_2_example == 0 or role.Skill_2_example == nil then
                return
            end
            MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_2_example,2},true)
        end)
        ---设置技能3
        self.SkillIcon_3().gameObject:SetActive(true)
        if role.Skill_3_example[1]~=nil then
            MgrRes.LoadSprite(self.SkillIcon_3(),"Skill/"..role.Skill_3_example[1].Icon)
        else
            MgrRes.LoadSprite(self.SkillIcon_3(),"Skill/".."icon_skill_empty")
        end
        ---设置点击3
        UIEvent.LuaClick(self.SkillIcon_3().gameObject, function ()
            if #role.Skill_3_example == 0 or role.Skill_3_example == nil then
                return
            end
            MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_3_example,3},true)
        end)
        ---设置技能4
        self.SkillIcon_4().gameObject:SetActive(true)
        if role.Skill_4_example[1]~=nil then
            self.ImageSuo().gameObject:SetActive(role.IsAwaken == false)
            MgrRes.LoadSprite(self.SkillIcon_4(),"Skill/"..role.Skill_4_example[1].Icon)
        else
            MgrRes.LoadSprite(self.SkillIcon_4(),"Skill/".."icon_skill_empty")
        end
        ---设置点击4
        UIEvent.LuaClick(self.SkillIcon_4().gameObject, function ()
            if #role.Skill_4_example == 0 or role.Skill_4_example == nil then
                return
            end
            MgrUI.Pop(UID.RolePreview_UI,{roleData,2,role.Skill_4_example,4},true)
        end)
        ---更新buff
        ---清空列表
        self.List_Index_GoIcon = {}
        self.List_Index_IconTex = {}
        ---清空buff
        Tools.ClearAllChild(self.RootAbtBuffObj().gameObject)
        ---创建buff
        for key, value in pairs(self.List_Name) do
            ---创建ui物体
            local tempObj= GameObject.Instantiate(self.AbtBuffIcon(),self.RootAbtBuffObj().transform,false)
            ---替换图片
            MgrRes.LoadSprite(tempObj,"Skill/"..value)
            ---设置时间
            local GoText = tempObj.transform:Find("Text").gameObject
            local temptext = GoText:GetComponent("TextMeshProUGUI")
            local tempImg = tempObj.transform:Find("Img").gameObject
            ---text组件列表
            self.List_Index_IconTex[self.List_Index[key]] = temptext
            if self.List_Turn[key] < 0 then  ---如果时间为负数显示无限图片
            GoText:SetActive(false)
            else
                tempImg:SetActive(false)
                temptext.text = self.List_Turn[key]
            end
            self.List_Index_GoIcon[self.List_Index[key]] = tempObj.gameObject
        end
    end
end
function M:MoveCamera(type,tipsAlpha)
    --if type == 1 then
    --    ---一阶镜头
    --    Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-300,0,-400),3,0,15,false,0,0)
    --elseif type == 2 then
    --    ---二阶镜头
    --    Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-300,50,-300),3,0,15,false,0,0)
    --elseif type == 3 then
    --    ---三阶镜头
    --    Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-300,100,-150),3,0,15,false,0,0)
    --elseif type == 4 then
    --    ---拉近摄像机位置
    --    Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-250,85,-800),0.5,0,14,false,0,0)
    --elseif type == 5 then
    --    ---还原摄像机位置
    --    Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(0,85,-1200),0.5,0,14,false,0,0)
    --elseif type == 6 then
    --    ---战斗相机位置
    --    Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(0,85,-1100),0.5,0,14,false,0,0)
    --end
    -----隐藏提示
    --Tools.DoGroupFade(self.tipsGroup,tipsAlpha,0.5,0,2,false,0,0)
end
---@param roleData RoleData 创建Spine
function M:GetOrCreatSpineRole(roleData, _NotInSound,_delay)
    ---创建spine
    local battleRole = BattleManager.CreartRoleLeft(roleData.id, roleData.skin, roleData.level, roleData.star,roleData:GetHeroSkillLevel(),roleData.awaken,nil,nil,nil,roleData.favor)
    CBattleTools.CCreatUIGo(battleRole.AniName, battleRole.GameID, battleRole.Qzoom,(battleRole.SkinID == nil and battleRole.ID or battleRole.SkinID), function(myAni) battleRole.myAni = myAni end)
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
    battleRole.Remove = false
    ---创建角色特效
    BattleRole.CreatEffFollowAni(battleRole,_delay)
    BattleRole.SetFlyIn(battleRole,_delay)
    return battleRole
end
---移除左侧队列及角色
function M:ReMoveAllLeft()
    local count = 0
    local newAllRole = {}
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            ---将原阵列位置置为空
            BattleManager.ChessboardLeft[role.PosY][role.PosX] = 0
            role.myAni:XYSetPos2(role.PosX, role.PosY, 0, 0)
            ---将地板角色移除左侧队列
            BattleManager.LeftTemaReomve(role)
            ---删除地板角色
            GameObject.Destroy(role.myAni.gameObject)
            ---从UI关卡英雄池中添加地板英雄数据
            StormViewModel.AddHeroData(tonumber(role.ID))
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
        --CJNBattleMgr.Instance:CloseAllRightFloor()
        ---刷新滑块UI
        self:ReloadSelectRole(0)
    end
    BattleManager.LeftTeam = {}
end
---加载阵型
function M:LoadTeamRole(teamIndex,flayDelay)
    ---解除左侧队列角色
    self:ReMoveAllLeft()
    ---获取阵型数据
    local team = TeamControl.GetTeamData(teamIndex)
    if team.info == nil or #team.info == 0 then
        ---取消loading
        -- MgrTimer.AddDelayNoName(0.5,function() MgrUI.PopHide(UID.FullLoading_UI) end,nil)
        return
    end
    BattleManager.LeftAtkOrderCout=1
    for atkOrder, fighter in ipairs(team.info) do
        ---从UI关卡英雄池中移除拖拽英雄数据
        StormViewModel.RemoveHeroData(fighter.roleID)
        ---创建立绘
        local role = self:GetOrCreatSpineRole(HeroControl.GetRoleDataByID(fighter.roleID), atkOrder ~= 1,flayDelay)
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
        ---将英雄信息添加到左侧队列
        BattleManager.LeftTeamAdd(role)
        ---飞行进场
        --role.myAni:UIFlayIn(0.55)
        if atkOrder == #team.info then
            ---更新提示
            self:UpdateTips(1)
            ---刷新滑块UI
            if self.isInited then
                self:ReloadSelectRole(0)
            end
            ---更新所有地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            --CJNBattleMgr.Instance:CloseAllRightFloor()
            ---更新所有队列图标
            self:ReloadOrder(false)
            ---取消loading
            -- MgrTimer.AddDelayNoName(0.5,function() MgrUI.PopHide(UID.FullLoading_UI) end,nil)
        end

    end
end
---取整人物信息 百分比小数后一位
function M.GetInfoCorrect(_Data)
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data*1000)/1)
    tempData = tempInt1 / 10
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
        self.AtkImg().gameObject:SetActive(false)
        self.SupImg().gameObject:SetActive(true)
        local tempNumber = self.Uidata_AtkOrSup/100
        self.AtkInfoTxt().text = tempNumber.."%"
        Tools.SetImgFillRate(self.AtkSlider().gameObject,tempNumber)
        MgrRes.LoadSprite(self.Img_AtkRang(),"AtkRange/SupportRange/"..role.AttackRangeTexture)
    else
        ---非支援
        self.SupImg().gameObject:SetActive(false)
        self.AtkImg().gameObject:SetActive(true)
        self.AtkInfoTxt().text = self.Uidata_AtkOrSup
        Tools.SetImgFillRate(self.AtkSlider().gameObject,(self.Uidata_AtkOrSup/self.Uidata_AtkOrSup_Base))
        MgrRes.LoadSprite(self.Img_AtkRang(),"AtkRange/OtherRange/"..role.AttackRangeTexture)
    end
    if tonumber(self.Uidata_HpMax) >= 1000000 then
        self.HpInfoTxt().text = (self.GetMillionNumInfo(tonumber(self.Uidata_Hp))).."M"
    else
        self.HpInfoTxt().text = self.Uidata_Hp
    end
    Tools.SetImgFillRate(self.HPSlider().gameObject,self.Uidata_Hp/self.Uidata_HpMax)
    self.DefInfoTxt().text = (self.GetInfoCorrect(self.Uidata_Def)).."%"
    Tools.SetImgFillRate(self.DefSlider().gameObject,tonumber(self.Uidata_Def))
    self.CriInfoTxt().text = (self.GetInfoCorrect(self.Uidata_Cirt)).."%"
    Tools.SetImgFillRate(self.CriSlider().gameObject,self.Uidata_Cirt)
    self.EvaInfoTxt().text = (self.GetInfoCorrect(self.Uidata_Agi)).."%"
    Tools.SetImgFillRate(self.AgrSlider().gameObject,self.Uidata_Agi)
    self.ChdInfoTxt().text = (self.GetInfoCorrect(self.Uidata_CirtDmg)).."%"
    Tools.SetImgFillRate(self.CritDmgSlider().gameObject,self.Uidata_CirtDmg)
end
---传递方法回到c#
function M:SetCFun()
    CJNUIMgr.SetFuc_UpdataTopValue(Handle(self,self.UpdateValue))
    CJNUIMgr.SetFuc_UpdataTopValue_Base(Handle(self,self.UpdateValue_Once))
    CJNUIMgr.SetFuc_TopIconDel(Handle(self,self.Icon_Del))
    CJNUIMgr.SetFuc_TopIconAdd(Handle(self,self.Icon_Add))
    CJNUIMgr.SetFuc_IconTime(Handle(self,self.Icon_UpdateTime))
end
function M:SetCFunNull()
    CJNUIMgr.SetFuc_UpdataTopValue(nil)
    CJNUIMgr.SetFuc_UpdataTopValue_Base(nil)
    CJNUIMgr.SetFuc_TopIconDel(nil)
    CJNUIMgr.SetFuc_TopIconAdd(nil)
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
    --M.List_Name=_List_Name
end
--删除一个
function M:Icon_Del(_Index)
    CJNBattleMgr.Instance:DesObj(self.List_Index_GoIcon[_Index])
    self.List_Index_GoIcon[_Index]=nil
    self.List_Index_IconTex[_Index]=nil
end
--显示一个buff
function M:Icon_Add(_Index,_IconName, IntTurn)
    --创建ui物体
    local tempObj= GameObject.Instantiate(self.AbtBuffIcon(),self.RootAbtBuffObj().transform,false)
    --替换图片
    MgrRes.LoadSprite(tempObj,"Skill/".._IconName)
    --设置时间
    local GoText = tempObj.transform:Find("Text").gameObject
    local temptext = GoText:GetComponent("TextMeshProUGUI")
    local tempImg = tempObj.transform:Find("Img").gameObject
    --text组件列表
    self.List_Index_IconTex[_Index] = temptext
    if IntTurn<0 then  --如果时间为负数显示无限图片
        GoText:SetActive(false)
    else
        tempImg:SetActive(false)
        temptext.text= IntTurn
    end
    self.List_Index_GoIcon[_Index] = tempObj.gameObject
end
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
end
--隐藏血条的字
function M:HideHpText()
    CJNBattleMgr.Instance:SetHideText()
end
function M:ShowHpText()
    CJNBattleMgr.Instance:SetShowText()
end
-- CJNBattleMgr.Instance:SetWgShow(true)
---开始战斗回调
function M:CallBackStartBattle()
    ---UI
    ---设置当前模式
    self.CurMode = 4
    ---显示透明地板
    CJNBattleMgr.Instance:SetFloorShowImg(false)
    ---战斗相机位
    self:MoveCamera(6,1)

    self:ShowRoleInfo()
    ---检测是否为模拟战斗
    if StormViewModel.IsAnaWorldBoss == true then
        ---模拟战不需要预算数据直接开战即可
        ---开始战斗
        BattleManager.GameMode = BattleManager.GameModeType.AniWorldBoss
    else
        ---非模拟战要提前获取数据并告知服务器
        BattleManager.GameMode = BattleManager.GameModeType.WorldBoss
    end
    MgrUI.Pop(UID.PartLoading_UI,nil,true)

    BattleManager.GameStart(true,Handle(self,self.ClosePanel))
    ---刷新地板
    CJNBattleMgr.Instance:SetAllFloorHid()
end
---检查更新
function M:CheckHot()



end

return M