
-- Code Auto Create Begin
local M = Class('NoviceBattle_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NoviceBattle_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NoviceBattle_UI].prefab'
    self.Name = 'Form[NoviceBattle_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_update','Panel_Fighting/UI_update',2},{'Img_Xian7(1)','Panel_Fighting/UI_update/Img_Xian7 (1)',2},{'Img_sanjiao','Panel_Fighting/UI_update/Img_sanjiao',2},{'Img_Xian7(2)','Panel_Fighting/UI_update/Img_Xian7 (2)',2},{'Img_Xian7','Panel_Fighting/UI_update/Img_Xian7',2},{'Img_Bian2','Panel_Fighting/UI_update/round/Img_Bian2',2},{'SkillName_Drawing','Panel_Fighting/UI_update/SkillName_Drawing',2},{'SkillName_BgB','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgB',2},{'SkillName_Frame_Blue','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgB/SkillName_Frame_Blue',2},{'SkillName_BgR','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgR',2},{'SkillName_Frame_Red','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgR/SkillName_Frame_Red',2},{'SkillName_BgW','Panel_Fighting/UI_update/SkillName_Go/SkillName_BgW',2},{'ImageBgRight','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/ImageBgRight',2},{'ImageBgLeft','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/ImageBgLeft',2},{'HeadMask_Sow','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask_Sow',2},{'ImageHeadIcon','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1/HeadMask',2},{'ImageBgRight01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/ImageBgRight',2},{'ImageBgLeft01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/ImageBgLeft',2},{'HeadMask_Sow01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask_Sow',2},{'ImageHeadIcon01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask01','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (2)/HeadMask',2},{'ImageBgRight02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/ImageBgRight',2},{'ImageBgLeft02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/ImageBgLeft',2},{'HeadMask_Sow02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask_Sow',2},{'ImageHeadIcon02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask02','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (3)/HeadMask',2},{'ImageBgRight03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/ImageBgRight',2},{'ImageBgLeft03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/ImageBgLeft',2},{'HeadMask_Sow03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask_Sow',2},{'ImageHeadIcon03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask03','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (4)/HeadMask',2},{'ImageBgRight04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/ImageBgRight',2},{'ImageBgLeft04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/ImageBgLeft',2},{'HeadMask_Sow04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask_Sow',2},{'ImageHeadIcon04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask04','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (5)/HeadMask',2},{'ImageBgRight05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/ImageBgRight',2},{'ImageBgLeft05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/ImageBgLeft',2},{'HeadMask_Sow05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask_Sow',2},{'ImageHeadIcon05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask05','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (6)/HeadMask',2},{'ImageBgRight06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/ImageBgRight',2},{'ImageBgLeft06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/ImageBgLeft',2},{'HeadMask_Sow06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask_Sow',2},{'ImageHeadIcon06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask06','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (7)/HeadMask',2},{'ImageBgRight07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/ImageBgRight',2},{'ImageBgLeft07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/ImageBgLeft',2},{'HeadMask_Sow07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask_Sow',2},{'ImageHeadIcon07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask_Sow/ImageHeadIcon',2},{'HeadMask07','Panel_Fighting/UI_update/RoleIcon_Root/HeadIcon_1 (8)/HeadMask',2},{'Panel_Round','Panel_Fighting/UI_update/Panel_Root/Panel_Round',2},{'Img_Round','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round',2},{'roundDI','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/roundDI',2},{'Img_Roundxian','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Img_Roundxian',2},{'Panel_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start',2},{'Img_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start',2},{'Img_Startxian1','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startxian1',2},{'Img_Startxian2','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startxian2',2},{'Img_Startdian','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startdian',2},{'Img_Startdi','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Img_Startdi',2},{'Img_Beisudi','Panel_Fighting/Btn_Speed/Img_Beisudi',2},{'Img_Beisutiao','Panel_Fighting/Btn_Speed/Img_Beisutiao',2},{'Img_Speedx1','Panel_Fighting/Btn_Speed/Img_Speedx1',2},{'Img_Speedx2','Panel_Fighting/Btn_Speed/Img_Speedx2',2},{'Img_Speedx3','Panel_Fighting/Btn_Speed/Img_Speedx3',2},{'Btn_Pause','Panel_Fighting/Btn_Pause',2},{'BlackBG','Panel_Fighting/EXHead/BlackBG',2},{'LineUp','Panel_Fighting/EXHead/LineUp',2},{'white','Panel_Fighting/EXHead/white',2},{'Btn_HideRoleInfo','Panel_RoleInfo/Btn_HideRoleInfo',2},{'Img_Tanchuangdi(shang)','Panel_RoleInfo/Img_Tanchuangdi(shang)',2},{'Img_xian1','Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian1',2},{'Img_xian2','Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian2',2},{'Img_Chakandi','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan/Img_Chakandi',2},{'ChakanIcon','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan/ChakanIcon',2},{'Img_Lihuidi','Panel_RoleInfo/RoleHead/Img_Lihuidi',2},{'Icon_RIHead','Panel_RoleInfo/RoleHead/Icon_RIHead',2},{'Icon_RIFrame','Panel_RoleInfo/RoleHead/Icon_RIFrame',2},{'Icon_RICareer','Panel_RoleInfo/RoleHead/Icon_RICareer',2},{'RIStar_1','Panel_RoleInfo/RoleHead/StarContent/RIStar_1',2},{'Normal','Panel_RoleInfo/RoleHead/StarContent/RIStar_1/Normal',2},{'HighLight','Panel_RoleInfo/RoleHead/StarContent/RIStar_1/HighLight',2},{'RIStar_2','Panel_RoleInfo/RoleHead/StarContent/RIStar_2',2},{'Normal01','Panel_RoleInfo/RoleHead/StarContent/RIStar_2/Normal',2},{'HighLight01','Panel_RoleInfo/RoleHead/StarContent/RIStar_2/HighLight',2},{'RIStar_3','Panel_RoleInfo/RoleHead/StarContent/RIStar_3',2},{'Normal02','Panel_RoleInfo/RoleHead/StarContent/RIStar_3/Normal',2},{'HighLight02','Panel_RoleInfo/RoleHead/StarContent/RIStar_3/HighLight',2},{'RIStar_4','Panel_RoleInfo/RoleHead/StarContent/RIStar_4',2},{'Normal03','Panel_RoleInfo/RoleHead/StarContent/RIStar_4/Normal',2},{'HighLight03','Panel_RoleInfo/RoleHead/StarContent/RIStar_4/HighLight',2},{'RIStar_5','Panel_RoleInfo/RoleHead/StarContent/RIStar_5',2},{'Normal04','Panel_RoleInfo/RoleHead/StarContent/RIStar_5/Normal',2},{'HighLight04','Panel_RoleInfo/RoleHead/StarContent/RIStar_5/HighLight',2},{'RIStar_6','Panel_RoleInfo/RoleHead/StarContent/RIStar_6',2},{'Normal05','Panel_RoleInfo/RoleHead/StarContent/RIStar_6/Normal',2},{'HighLight05','Panel_RoleInfo/RoleHead/StarContent/RIStar_6/HighLight',2},{'RIAwaken','Panel_RoleInfo/RoleHead/StarContent/RIAwaken',2},{'Super','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super',2},{'Super1','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super1',2},{'Super2','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super2',2},{'Super3','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super3',2},{'Super4','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super4',2},{'Super5','Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super5',2},{'Icon_Rankdi','Panel_RoleInfo/RoleHead/Icon_Rankdi',2},{'Fanwei','Panel_RoleInfo/Fanwei',2},{'Mubiao','Panel_RoleInfo/Mubiao',2},{'Hp','Panel_RoleInfo/Hp',2},{'HPtiaodi','Panel_RoleInfo/Hp/HPtiaodi',2},{'HPtiao','Panel_RoleInfo/Hp/HPtiao',2},{'Img_xian101','Panel_RoleInfo/RoleInfoTxtPanel/Img_xian1',2},{'Img_xian201','Panel_RoleInfo/RoleInfoTxtPanel/Img_xian2',2},{'Atk','Panel_RoleInfo/RoleInfoTxtPanel/Atk',2},{'AtkIcon','Panel_RoleInfo/RoleInfoTxtPanel/Atk/AtkIcon',2},{'Def','Panel_RoleInfo/RoleInfoTxtPanel/Def',2},{'DefIcon','Panel_RoleInfo/RoleInfoTxtPanel/Def/DefIcon',2},{'Baoji','Panel_RoleInfo/RoleInfoTxtPanel/Baoji',2},{'BaojiIcon','Panel_RoleInfo/RoleInfoTxtPanel/Baoji/BaojiIcon',2},{'Baoshang','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang',2},{'BaoshangIcon','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/BaoshangIcon',2},{'Mingjie','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie',2},{'MingjieIcon','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/MingjieIcon',2},{'AbtBuffIcon','AbtBuffIcon',2},{'Img','AbtBuffIcon/Img',2},{'Img_Zonghefenshudi1','Panel_PointInfo/Panel_Score/Img_Zonghefenshudi1',2},{'Panel_Select','Panel_Ready/Panel_Select',2},{'Img_Rormationdi','Panel_Ready/Panel_Select/Btn_Qiehuan/Img_Rormationdi',2},{'Rormationicon','Panel_Ready/Panel_Select/Btn_Qiehuan/Rormationicon',2},{'Img_Huangtiao','Panel_Ready/Panel_Select/Img_Huangtiao',2},{'LineupBtns','Panel_Ready/Panel_Select/LineupBtns',2},{'Img_Rormationdi01','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Img_Rormationdi',2},{'Rormationicon01','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Rormationicon',2},{'Img_Rormationdi02','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation/Img_Rormationdi',2},{'Rormationicon02','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation/Rormationicon',2},{'Removeicon','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Removeicon',2},{'Img_Removedi','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Img_Removedi',2},{'Removeicon01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove/Removeicon',2},{'Img_Removedi01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove/Img_Removedi',2},{'OrderBtns','Panel_Ready/Panel_Select/OrderBtns',2},{'Img_Rormationdi03','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether/Img_Rormationdi',2},{'Altogethericon','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether/Altogethericon',2},{'Img_Rormationdi04','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H/Img_Rormationdi',2},{'Altogethericon01','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H/Altogethericon',2},{'Separateicon','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate/Separateicon',2},{'Img_Removedi02','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate/Img_Removedi',2},{'Img_Removedi03','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H/Img_Removedi',2},{'Separateicon01','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H/Separateicon',2},{'Img_Tanchuangdi(xia)','Panel_Ready/Panel_Room/Img_Tanchuangdi(xia)',2},{'LoopScrollRole','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',2},{'ScrollMask','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask',2},{'Image','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask/Image',2},{'Img_Tips','Panel_Ready/Panel_Room/Img_Tips',2},{'Img_TishiBian','Panel_Ready/Panel_Room/Img_Tips/Img_TishiBian',2},{'Duiyuanicon','Panel_Ready/Panel_Room/Img_Tips/Duiyuanicon',2},{'Btn_Jintouqiehuan','Panel_Ready/Btn_Jintouqiehuan',2},{'GudingJingtouicon','Panel_Ready/Btn_Jintouqiehuan/GudingJingtouicon',2},{'ZiyouJingtouicon','Panel_Ready/Btn_Jintouqiehuan/ZiyouJingtouicon',2},{'Btn_BossInfo','Panel_Ready/Btn_BossInfo',2},{'Img_Zuozhankaishidi','Panel_Ready/Btn_StartFight/Img_Zuozhankaishidi',2},{'Img_Zuozhankaishi_CN','Panel_Ready/Btn_StartFight/Img_Zuozhankaishi_CN',2},{'Img_Tilixiaohaodi','Panel_Ready/Btn_StartFight/Img_Tilixiaohaodi',2},{'Img_Tiliicon','Panel_Ready/Btn_StartFight/Img_Tiliicon',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Text 列表
        {'Text_Start2','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Text_Start2',3},{'Text','AbtBuffIcon/Text',3},{'Text_MoNi','Panel_PointInfo/Text_MoNi',3},{'Text_Score','Panel_PointInfo/Panel_Score/Text_Score',3},{'Text_Zonghefenshu1','Panel_PointInfo/Panel_Score/Text_Zonghefenshu1',3},{'Text_Empty','Panel_Ready/Panel_Room/Panel_Replace/Text_Empty',3},{'Text01','Panel_Ready/Panel_Room/Panel_Replace/ScrollMask/Image/Text',3},{'Text_Tips','Panel_Ready/Panel_Room/Img_Tips/Text_Tips',3},{'Text_Jingtou','Panel_Ready/Btn_Jintouqiehuan/Text_Jingtou',3},{'Text_Boss','Panel_Ready/Btn_BossInfo/Text_Boss',3},{'Text_BossXinxi','Panel_Ready/Btn_BossInfo/Text_BossXinxi',3},{'Img_Zuozhankaishi_EN','Panel_Ready/Btn_StartFight/Img_Zuozhankaishi_EN',3},{'Text_PowerConsume','Panel_Ready/Btn_StartFight/Text_PowerConsume',3},
        -- Button 列表
        {'Btn_Speed','Panel_Fighting/Btn_Speed',4},{'Btn_Chakan','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan',4},{'Btn_Qiehuan','Panel_Ready/Panel_Select/Btn_Qiehuan',4},{'Btn_Rormation','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',4},{'Btn_Remove','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',4},{'Btn_Altogether','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether',4},{'Btn_Separate','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate',4},{'Btn_StartFight','Panel_Ready/Btn_StartFight',4},
        -- UITemplate 列表
        {'NoviceRoleItem','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole/NoviceRoleItem',10},
        -- RawImage 列表
        {'Panel_Fighting','Panel_Fighting',15},{'Btn_Speed01','Panel_Fighting/Btn_Speed',15},{'Panel_RoleInfo','Panel_RoleInfo',15},{'Btn_Chakan01','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan',15},{'Panel_PointInfo','Panel_PointInfo',15},{'Panel_Score','Panel_PointInfo/Panel_Score',15},{'Panel_Ready','Panel_Ready',15},{'Btn_Qiehuan01','Panel_Ready/Panel_Select/Btn_Qiehuan',15},{'Btn_Rormation01','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',15},{'Btn_LockRormation','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation',15},{'Btn_Remove01','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',15},{'Btn_LockRemove','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove',15},{'Btn_Altogether01','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether',15},{'Btn_Altogether_H','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H',15},{'Btn_Separate01','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate',15},{'Btn_Separate_H','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H',15},{'Panel_Replace','Panel_Ready/Panel_Room/Panel_Replace',15},{'Btn_StartFight01','Panel_Ready/Btn_StartFight',15},
        -- LoopScrollRect 列表
        {'LoopScrollRole01','Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',18},
        -- TextMeshProUGUI 列表
        {'Text_Round_Title','Panel_Fighting/UI_update/round/Text_Round_Title',20},{'Text_Round','Panel_Fighting/UI_update/round/Text_Round',20},{'SkillName_Text','Panel_Fighting/UI_update/SkillName_Go/SkillName_Text',20},{'SkillName_RoleName','Panel_Fighting/UI_update/SkillName_Go/SkillName_RoleName',20},{'SkillName_Index','Panel_Fighting/UI_update/SkillName_Go/SkillName_Index',20},{'Text_Round01','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Text_Round',20},{'Text_Roundshu','Panel_Fighting/UI_update/Panel_Root/Panel_Round/Img_Round/Text_Roundshu',20},{'Text_Start','Panel_Fighting/UI_update/Panel_Root/Panel_Start/Img_Start/PanelUI/Text_Start',20},{'Text_Chakan','Panel_RoleInfo/Img_Tanchuangdi(shang)/Btn_Chakan/Text_Chakan',20},{'Text_RILevel','Panel_RoleInfo/RoleHead/Text_RILevel',20},{'Text_RILv','Panel_RoleInfo/RoleHead/Text_RILv',20},{'Text_RIRank','Panel_RoleInfo/RoleHead/Icon_Rankdi/Text_RIRank',20},{'Text_RIName','Panel_RoleInfo/Text_RIName',20},{'Text_Mubiaozi','Panel_RoleInfo/Mubiao/Text_Mubiaozi',20},{'Text_HP1','Panel_RoleInfo/Hp/Text_HP1',20},{'Text_HP2','Panel_RoleInfo/Hp/Text_HP2',20},{'Text_Atk1','Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk1',20},{'Text_Atk2','Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk2',20},{'Text_Def1','Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def1',20},{'Text_Def2','Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def2',20},{'Text_Baoji1','Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji1',20},{'Text_Baoji2','Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji2',20},{'Text_Baoshang1','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang1',20},{'Text_Baoshang2','Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang2',20},{'Text_Mingjie1','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie1',20},{'Text_Mingjie2','Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie2',20},{'Text_Zhenxing','Panel_Ready/Panel_Select/LineupBtns/Text_Zhenxing',20},{'Text_ZhenxingEn','Panel_Ready/Panel_Select/LineupBtns/Text_ZhenxingEn',20},{'Text_Cunqu','Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Text_Cunqu',20},{'Text_Cunqu01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRormation/Text_Cunqu',20},{'Text_Jiechu','Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Text_Jiechu',20},{'Text_Jiechu01','Panel_Ready/Panel_Select/LineupBtns/Btn_LockRemove/Text_Jiechu',20},{'Text_Shunxu','Panel_Ready/Panel_Select/OrderBtns/Text_Shunxu',20},{'Text_ShunxuEn','Panel_Ready/Panel_Select/OrderBtns/Text_ShunxuEn',20},{'Text_Yiqi','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether/Text_Yiqi',20},{'Text_Yiqi01','Panel_Ready/Panel_Select/OrderBtns/Btn_Altogether_H/Text_Yiqi',20},{'Text_Fenbie','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate/Text_Fenbie',20},{'Text_Fenbie01','Panel_Ready/Panel_Select/OrderBtns/Btn_Separate_H/Text_Fenbie',20},
    }
end
-- Code Auto Create End
require("LocalData/PlayerplLocalData")
---初始化
function M:OnInit()
    -- MgrTimer.AddDelayNoName(0.5,function() MgrUI.PopHide(UID.FullLoading_UI) end,nil)
    ---检查更新
    self:CheckHot()
    ---外部调用开始战斗
    NoviceViewModel.StartBattle = Handle(self,self.StartFight)
    ---外部调用显示准备UI
    NoviceViewModel.ShowReady = Handle(self,self.ShowReadyUI)
    NoviceViewModel.CloseReady = Handle(self,self.CloseReadyUI)
    ---外部调用刷新背包角色
    NoviceViewModel.RefreshRole = Handle(self,self.ReloadSelectRole)
    NoviceViewModel.CloseRoleInfo = Handle(self,self.CloseRoleInfo)
    ---外部调用显示/恢复角色栏
    NoviceViewModel.ShowRoleBar = Handle(self,self.ShowRoleBar)
    NoviceViewModel.RestoreRoleBar = Handle(self,self.RestoreRoleBar)
    ---外部调用隐藏boss信息按钮
    NoviceViewModel.HideBossBtn = Handle(self,self.HideBossInfoBtn)
    Event.Add("WorldBossHpClose",Handle(self,self.CloseBossHpBar))
end

function M:OnInitFight()
    print("初始化战斗")
    ---在切换到调整顺序时,控制头像的遮挡
    self.SelectRoleStop = false
    ---隐藏角色详情框
    Event.Clear("HideRoleInfo")
    Event.Add("HideRoleInfo",function()
        self.Panel_RoleInfo:SetActive(false)
    end)
    ---开始战斗
    Event.Clear("noviceFight")
    Event.Add("noviceFight",function()
        self:StartFight()
    end)


    ---0、无点击，1、设置角色，2、问号排序模式，3、交换排序模式，4、战斗中
    self.Panel_Ready().gameObject:SetActive(false)
    self.Panel_PointInfo().gameObject:SetActive(false)
    self.CurMode = 0
    ---获取战斗摄像机
    self.battleCamera = CMgrCamera.Instance.FightCamera
    ---获取ui摄像机
    self.uiCamera = GameObject.Find("UI_Camera"):GetComponent("Camera")
    ---播放背景音乐
    MgrSound.PlayBGM(StormViewModel.CurPointData.bgm,0.2)
    ---初始化UI
    self:InitBattleUI()
    ---初始化战斗场景
    self:InitBattle()
    ---加载默认阵型
    if StormViewModel.CurPointType == StormViewModel.PointType.guide then
        ---战术指导加载指定角色
        self:LoadGuideTeam()
    else
        ---常规作战加载玩家角色
        self:LoadTeamRole(0,0.55)
    end

    ---注册开始战斗事件
    UIEvent.LuaClick(self.Btn_StartFight().gameObject,Handle(self,function ()
        --MgrUI.Lock("battle_start")
        self:StartFight()
        if NoviceViewModel.CurTaskId == 11504 then
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
        end
    end))
    ---默认分别排序模式
    self.sortingType = 1
end

function M:OnShowFinish()
    MgrCamera.VirCamerasInit_New()
    CJNBattleMgr:ActiveBuildings()
end

function M:StartFight()
    MgrUI.Lock("battle_start")
    ---检查体力是否足够
    local vigor = StormViewModel.CurPointData.consume and tonumber(string.split(StormViewModel.CurPointData.consume,"_")[3]) or 0
    if PlayerControl.GetVigor() < vigor then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("novicebattle_ui_tips1"),1},true)
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
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("novicebattle_ui_tips2"),1},true)
        MgrUI.UnLock("battle_start")
        return
    end
    -----设置当前模式为无状态
    --self.CurMode = 4
    ---@type FighterBase[] 创建服务器需要的阵型数据(只有玩家角色)
    local fighters = {}
    ---@type FighterBase[] 创建服务器需要的阵型数据（只有Npc）
    local fightersNpc = {}
    StormViewModel.NPCInfos = {}
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            ---@type FighterBase
            local fighter = {}
            ---设置位置
            fighter.index = (6 - role.PosX) * 3 + role.PosY
            ---设置id
            fighter.roleID = tonumber(role.ID)
            fighter.order = role.AtkOrder - 1
            if role.roleType == 1
            then
                ---加入玩家池
                fighters[role.AtkOrder] = fighter
            elseif role.roleType == 2
            then
                for i,v in pairs(StormViewModel.CurPointData.roles) do
                    if v.id == fighter.roleID then
                        ---加入Npc池
                        fightersNpc[role.AtkOrder] = fighter
                        ---NPC详情
                        table.insert(StormViewModel.NPCInfos,v)
                    end
                end
            end
        end
    end
    StormViewModel.NpcTeam = fightersNpc
    ---如果不是战术指导，不放默认阵型
    if StormViewModel.CurPointType ~= StormViewModel.PointType.guide then
        if StormViewModel.CurPointData.npcType == 0 then
            ---无Npc助战
            ---拷贝阵容到默认阵型
            TeamControl.ChangeTeamInfo(0,fighters)
            ---发送默认阵型
            TeamControl.SendSaveTeamData({0},false)
        else
            ---有Npc助战
            ---拷贝阵容到指定阵型供服务器获取阵型
            TeamControl.ChangeTeamInfo(StormViewModel.NpcTeamStaticId,fighters)
            ---发送默认阵型
            TeamControl.SendSaveTeamData({StormViewModel.NpcTeamStaticId},false)
        end
    else
        ---战术指导队伍阵型
        BattleViewModel.GuideTeam = fighters
    end
    ---新手战斗开始标记
    NoviceControl.battleStart = true

    BattleManager.GameMode = BattleManager.GameModeType.Normal
    MgrUI.Pop(UID.PartLoading_UI,nil,true)

    BattleManager.GameStart(true,Handle(self,self.ClosePanel))
    ---刷新地板
    CJNBattleMgr.Instance:SetAllFloorHid()
    ---隐藏角色信息UI
    self:CloseRoleInfo()
    ---设置当前模式为无状态
    self.CurMode = 4
    --BattleManager.GameStart_LuatoC(function ()
    --
    --end)
end
function M:ClosePanel()
    UnityEngine.DebugEx.LogError("收到回调,执行callBack")
    CJNBattleMgr.Instance:CameraMoveOpenAndClose(false) --不能再移动镜头
    MgrUI.PopHide(UID.NoviceFrame_UI)
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
    ---战斗结束
    NoviceViewModel.NoviceBattleEnd = true
    ---设置开战条件
    self.Btn_Jintouqiehuan().gameObject:SetActive(true)
    self.Panel_Fighting().gameObject:SetActive(true)
    self.UI_update().gameObject:SetActive(true)
    self.Panel_Ready().gameObject:SetActive(false)
    ---补全角色信息
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            CAnimation.SetRoleData(role.myAni,role.GameID,role.PosX,role.PosY,role.IsLeft,0,role.HPmax)
        end
    end
    ---设置RoleUI
    BattleManager.SetLeftSpineUI()
    BattleManager.GameStart_LuatoC()
    MgrUI.UnLock("battle_start")
    self:CloseBossHpBar(true)
end

---初始化战斗场景
function M:InitBattle()
    ---初始化地图,路径示例ABOriginal/Prefab/Common/Map/ui_map_daily_01_01.prefab
    CJNUIMgr.InitBattleMapNodePosList2(BattleManager.FloorPos.left,BattleManager.FloorPos.right)
    ---初始隐藏战斗信息面板
    self.Panel_Fighting().gameObject:SetActive(false)
    ---初始化战斗场景
    local type = 0
    if StormViewModel.CurPointData.type == 998 then
        type = 1
        NoviceViewModel.AllowShowInfo = true
        --MgrTimer.AddDelayNoName(0.1,function()
        --    CJNBattleMgr.Instance:SetLopOffset(self.Panel_RoleInfo,  -16.5,-80,0,true)
        --end,nil)
        ---Boss关调整公告位置
        SysNoticeControl.SetSysNoticeOffsetY(-274)
    else
        NoviceViewModel.AllowShowInfo = false
    end
    BattleManager.StartBattle(self.UI_update().gameObject:GetComponent("CUIupdate"),2,StormViewModel.CurPointData.ContinuousCombatType)
    ---加载队伍顺序图片
    self:ReloadOrder(false)
    ---1.5f后更新地板
    MgrTimer.AddDelayNoName(0.1,function() CJNBattleMgr.Instance:SetAllFloorHid() end,nil)
    ---设置屏幕点击状态1：按下 2：拖拽 3：抬起
    self.OnState = 1
    ---开启屏幕按键检测循环
    MgrTimer.AddRepeat("BattleUIUpdate",0, function ()
        if CJNBattleMgr == nil or CJNBattleMgr.Instance.IsPause == true then
            ---暂停时不允许点击
            return
        end
        ---是否可以拖动
        if NoviceViewModel.AllowMove == false then
            return
        end
        if self.CurMode == 0 then
            return
        end
        ---状态1检测按下
        if self.OnState == 1  then
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
            if UIEvent.GetButton_Up() then
                ---切换到抬起状态
                self.OnState = 3
            end

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
        if BattleManager.IsFightStart and self.CurRoleInfo ~= nil then
            self:UpdateRoleInfo()
        end
    end,-1,nil)
end

function M:OnBeginDrag()
    ---发射射线抓取地板角色GameId， 0为空
    self.ShowRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
    ---设置选中的角色
    CJNUIMgr.SetUiTop(tonumber(self.ShowRoleId))
    ---按下位置存在角色则显示角色信息
    if self.ShowRoleId ~= nil and self.ShowRoleId ~= 0 and NoviceViewModel.AllowShowInfo then
        ---显示
        for i, role in pairs(BattleManager.AllRole) do
            if role.GameID == self.ShowRoleId and role.Remove == false then
                self:ShowRoleInfo(role,true)
                break
            end
        end
    end

    if self.CurMode == 1 then
        if NoviceViewModel.AllowMove == true then
            ---设置角色模式
            ---显示透明地板
            CJNBattleMgr.Instance:SetFloorShowImg(true)
            ---抓取地板role
            self.dragRole = BattleManager.AllRole[self.ShowRoleId]
            if self.dragRole ~= nil and self.dragRole.IsLeft then
                ---Npc禁止站位
                self.CanMove = true
                local index = (self.dragRole.PosY * 6) - (6-self.dragRole.PosX)
                for k,v in pairs(StormViewModel.CurPointData.banMove) do
                    if tonumber(v) == index then
                        self.CanMove = false
                        break
                    end
                end
                ---如果当前引导没有角色操作 直接返回
                if NoviceViewModel.GetWhetherCurStep(NoviceViewModel.CurTaskId,self.dragRole.ID) == false then
                    return
                end
                ---如果存在Npc禁止站位
                if self.CanMove == false then
                    return
                end
                ---清空地板数据
                BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = 0
                self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, 0, 0)
                ---修改透明度
                self.dragRole.myAni:SetAlpha(0.5)
                self.OldX = self.dragRole.PosX
                self.OldY = self.dragRole.PosY
            end
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
            ---Npc禁止站位
            self.CanMove = true
            local index = (self.dragRole.PosY * 6) - (6-self.dragRole.PosX)
            for k,v in pairs(StormViewModel.CurPointData.banMove) do
                if tonumber(v) == index then
                    self.CanMove = false
                    break
                end
            end
            ---设置顺序为当前索引顺序
            self.dragRole.myAni:SetOrder(self.CurAtkOrderIndex, self.dragRole.IsLeft, true)
        end
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---抓取选中的角色顺序图标
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft and NoviceViewModel.GetWhetherCurStep(NoviceViewModel.CurTaskId,self.dragRole.ID) then
            ---Npc禁止站位
            self.CanMove = true
            local index = (self.dragRole.PosY * 6) - (6-self.dragRole.PosX)
            for k,v in pairs(StormViewModel.CurPointData.banMove) do
                if tonumber(v) == index then
                    self.CanMove = false
                    break
                end
            end
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
    -- print("!")
    ---战斗中不执行
    if BattleManager.IsFightStart then
        return
    end
    ---如果存在Npc禁止站位
    if self.CanMove == false then
        return
    end
    if self.CurMode == 1 then
        ---设置角色模式
        if self.dragRole ~= nil and self.dragRole.IsLeft and NoviceViewModel.GetWhetherCurStep(NoviceViewModel.CurTaskId,self.dragRole.ID) then
            ---新手引导判断
            if NoviceViewModel.CurTaskId == 50305 then
                ---如果角色不是莉莉丝
                if tonumber(self.dragRole.ID) ~= 10013 then
                    return
                else
                    NoviceViewModel.DoNext()
                end
            end
            if NoviceViewModel.CurTaskId == 50813 then
                if tonumber(self.dragRole.ID) ~= 10013 then
                    return
                else
                    NoviceViewModel.DoNext()
                end
            end
            if NoviceViewModel.CurTaskId == 50811 then
                if tonumber(self.dragRole.ID) ~= 11017 then
                    return
                else
                    NoviceViewModel.DoNext()
                end
            end
            ---若存在抓取到的角色更新抓取角色的位置
            local posArr = CJNBattleMgr.Instance:RayAndSetGo(self.dragRole.myAni.gameObject)
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
    ---如果存在Npc禁止站位
    if self.CanMove == false then
        return
    end
    CMgrCamera.Instance:CloseStrokeCamera()
    print("抬起")
    if self.CurMode == 1 then
        ---隐藏透明地板
        CJNBattleMgr.Instance:SetFloorShowImg(false)
        ---结束显示攻击范围及羁绊
        CJNBattleMgr.Instance:EndLine()
        ---设置角色模式   如果当前引导没有角色操作 直接返回
        if self.dragRole ~= nil and self.dragRole.IsLeft and NoviceViewModel.GetWhetherCurStep(NoviceViewModel.CurTaskId,self.dragRole.ID) then
            ---获取射线返回的地板信息:[0]id -1不能写入、为0则是空地板、其他数则为id，[1]地板x，[2]地板y
            local reuIntArr = CJNBattleMgr.Instance:RayGoInFloor(self.dragRole.myAni.gameObject,0,0,self.dragRole.GameID,self.dragRole.Occupation)
            if reuIntArr[0] == -1 then
                if NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId).group == 16 then
                    ---移除总队列
                    for i, v in pairs(BattleManager.AllRole) do
                        if v.GameID == self.dragRole.GameID then
                            table.remove(BattleManager.AllRole,i)
                            break
                        end
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
                else
                    ---重新设置xy并更新位置
                    self.dragRole.PosX = self.OldX
                    self.dragRole.PosY = self.OldY
                    ---更新地板数据
                    BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                    self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                    ---新手引导判断
                    if NoviceViewModel.CurTaskId == 50306 then
                        NoviceControl.PushSingleData(50305,false)
                        MessageEvent.Go(EID.NoviceCheck,50305)
                    elseif NoviceViewModel.CurTaskId == 50814 then
                        NoviceControl.PushSingleData(50813,false)
                        MessageEvent.Go(EID.NoviceCheck,50813)
                    elseif NoviceViewModel.CurTaskId == 50812 then
                        NoviceControl.PushSingleData(50811,false)
                        MessageEvent.Go(EID.NoviceCheck,50811)
                    end
                end
                ---刷新滑块UI
                self:ReloadSelectRole(tonumber(self.dragRole.ID))
            elseif reuIntArr[0] == 0 then
                ---新手引导判断
                if NoviceViewModel.CurTaskId == 50306 then
                    ---是否拖动到指定位置
                    if reuIntArr[1] == 6 and reuIntArr[2] == 2 then
                        self:SetRoleXY(reuIntArr[1],reuIntArr[2])
                        NoviceViewModel.DoNext()
                    else
                        ---回归原位
                        self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                        BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                        self:SetRoleXY(self.OldX,self.OldY)
                        NoviceControl.PushSingleData(50305,false)
                        MessageEvent.Go(EID.NoviceCheck,50305)
                    end
                elseif NoviceViewModel.CurTaskId == 50314 then
                    if reuIntArr[1] == 1 and reuIntArr[2] == 1 then
                        self:SetRoleXY(reuIntArr[1],reuIntArr[2])
                        NoviceViewModel.DoNext()
                    else
                        self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                        BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                        self:SetRoleXY(self.OldX,self.OldY)
                        NoviceControl.PushSingleData(50813,false)
                        MessageEvent.Go(EID.NoviceCheck,50813)
                    end
                elseif NoviceViewModel.CurTaskId == 50812 then
                    if reuIntArr[1] == 5 and reuIntArr[2] == 2 then
                        self:SetRoleXY(reuIntArr[1],reuIntArr[2])
                        NoviceViewModel.DoNext()
                    else
                        self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                        BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                        self:SetRoleXY(self.OldX,self.OldY)
                        NoviceControl.PushSingleData(50811,false)
                        MessageEvent.Go(EID.NoviceCheck,50811)
                    end
                elseif NoviceViewModel.CurTaskId == 50814 then
                    if reuIntArr[1] == 6 and reuIntArr[2] == 2 then
                        self:SetRoleXY(reuIntArr[1],reuIntArr[2])
                        NoviceViewModel.DoNext()
                    else
                        self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                        BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                        self:SetRoleXY(self.OldX,self.OldY)
                        NoviceControl.PushSingleData(50813,false)
                        MessageEvent.Go(EID.NoviceCheck,50813)
                    end
                else
                    ---重新设置xy并更新位置
                    self.dragRole.PosX = reuIntArr[1]
                    self.dragRole.PosY = reuIntArr[2]
                    ---更新地板数据
                    BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                    self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                    ---移除uiItem队列
                    StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
                end
            else
                ---交换角色位置
                ---获取目标位置角色
                local targetRole = BattleManager.AllRole[reuIntArr[0]]
                ---Npc禁止换位
                self.CanChangePos = true
                local index = (targetRole.PosY * 6) - (6-targetRole.PosX)
                for k,v in pairs(StormViewModel.CurPointData.banMove) do
                    if tonumber(v) == index then
                        self.CanChangePos = false
                        break
                    end
                end
                ---如果当前引导的组别是121
                if NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId).group == 123 then
                    if NoviceViewModel.CurTaskId == 50306 then
                        if reuIntArr[1] == 6 and reuIntArr[2] == 2 then
                            self:ExchangeRole(targetRole)
                            NoviceViewModel.DoNext()
                        else
                            targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                            self:SetRoleXY(self.OldX,self.OldY)
                            NoviceControl.PushSingleData(50305,false)
                            MessageEvent.Go(EID.NoviceCheck,50305)
                        end
                    elseif NoviceViewModel.CurTaskId == 11211 then
                        if reuIntArr[1] == 6 and reuIntArr[2] == 2 then
                            self:SetRoleXY(reuIntArr[1],reuIntArr[2])
                            NoviceViewModel.DoNext()
                        else
                            targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                            self:SetRoleXY(self.OldX,self.OldY)
                            NoviceControl.PushSingleData(11210,false)
                            MessageEvent.Go(EID.NoviceCheck,11210)
                        end
                    end
                else
                    ---是否能交换角色
                    if self.CanChangePos and NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId).group ~= 127 then
                        if BattleManager.GameIdCout > #BattleManager.AllRole then
                            BattleManager.GameIdCout = BattleManager.GameIdCout - 1
                        end
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
                        ---移除uiItem队列
                        StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
                    else
                        if NoviceViewModel.CurTaskId == 50812 then
                            if reuIntArr[1] == 5 and reuIntArr[2] == 2 then
                                self:SetRoleXY(reuIntArr[1],reuIntArr[2])
                                NoviceViewModel.DoNext()
                            else
                                self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                                BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                                self:SetRoleXY(self.OldX,self.OldY)
                                NoviceControl.PushSingleData(50811,false)
                                MessageEvent.Go(EID.NoviceCheck,50811)
                            end
                        elseif NoviceViewModel.CurTaskId == 50814 then
                            if reuIntArr[1] == 6 and reuIntArr[2] == 2 then
                                self:SetRoleXY(reuIntArr[1],reuIntArr[2])
                                NoviceViewModel.DoNext()
                            else
                                self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                                BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                                self:SetRoleXY(self.OldX,self.OldY)
                                NoviceControl.PushSingleData(50813,false)
                                MessageEvent.Go(EID.NoviceCheck,50813)
                            end
                        end
                        targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                        self:SetRoleXY(self.OldX,self.OldY)
                        ---移除uiItem队列
                        StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
                    end
                end
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
            end,nil)
            ---将单次检测插值设为开启
            self.isOnceDrag = true
            ---清空dragRole
            self.dragRole = nil
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
                ---获取目标位置角色
                local targetRole = nil
                for i, role in pairs(BattleManager.AllRole) do
                    if role.IsLeft and role.GameID == floorRoleId then
                        targetRole = role
                    end
                end
                ---对比位置是否相同
                if self.dragRole.GameID == floorRoleId then

                else
                    if NoviceViewModel.CurTaskId ~= 50711 and targetRole then
                        if NoviceViewModel.GetWhetherCurStep(NoviceViewModel.CurTaskId,self.dragRole.ID) and tonumber(targetRole.ID) == 13006 then

                            NoviceViewModel.DoNext()
                        else
                            self:ReloadOrder(true)
                            if self.dragRoleAtkOder ~= nil then
                                local dragCanvas = self.dragRoleAtkOder:GetComponent("Canvas")
                                dragCanvas.sortingOrder = dragCanvas.sortingOrder - 1
                            end
                            ---清空抓取池
                            self.dragRole = nil
                            self.ShowRoleId = nil
                            self.dragRoleAtkOder = nil
                            return
                        end
                    end

                    ---不同执行交换
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
                        BattleManager.LeftTeam[self.dragRole.AtkOrder] = self.dragRole
                        BattleManager.LeftTeam[targetRole.AtkOrder] = targetRole

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

---显示准备UI
function M:ShowReadyUI()
    self.Panel_Ready().gameObject:SetActive(true)
end
---关闭准备UI
function M:CloseReadyUI()
    self.Panel_Ready().gameObject:SetActive(false)
end
---关闭角色信息
function M:CloseRoleInfo()
    self.Panel_RoleInfo:SetActive(false)
end
---显示角色栏
function M:ShowRoleBar()
    self.Panel_Ready().gameObject:SetActive(true)
    self.Panel_Select().gameObject:SetActive(false)
    self.Panel_Ready().gameObject.transform:Find("Panel_Room").gameObject:SetActive(true)
    self.Panel_Ready().gameObject.transform:Find("Btn_BossInfo").gameObject:SetActive(false)
    self.Panel_Ready().gameObject.transform:Find("Btn_StartFight").gameObject:SetActive(false)
end
---恢复角色栏
function M:RestoreRoleBar()
    self.Panel_Select().gameObject:SetActive(false)
    self.Panel_Ready().gameObject.transform:Find("Btn_StartFight").gameObject:SetActive(true)
end
function M:HideBossInfoBtn()
    self.Panel_Ready().gameObject.transform:Find("Btn_BossInfo").gameObject:SetActive(false)
end
---初始化UI
function M:InitBattleUI()
    ---拖拽显示UIItem
    self.UIDragItem = self.NoviceRoleItem()
    ---角色信息节点
    self.Panel_RoleInfo = self.Panel_RoleInfo().gameObject
    ---注册隐藏角色信息面板
    --UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
    --    self:ShowRoleInfo()
    --end)
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
        [4] = false
    }
    ---当前升降序(true升序，false降序)
    self.CurCardRise = true
    ---获取关卡英雄数据
    StormViewModel.GetHeroData()

    ---移除左侧场上所有角色
    UIEvent.LuaClick(self.Btn_Remove().gameObject,Handle(self,function ()
        --self:ReMoveAllLeft()
        -----关闭人物信息
        --self:ShowRoleInfo()
    end))
    ---初始化提示信息
    self.text_Tips = self.Text_Tips()
    self:UpdateTips(1)
    ---获取提示栏group
    self.tipsGroup = self.Img_Tips().gameObject:GetComponent("CanvasGroup")

    ---左侧选取栏高亮
    self.LineUpOrOrder = 1
    self.OrderBtns().gameObject:SetActive(false)
    self.CurMode = 1
    UIEvent.LuaClick(self.Btn_Qiehuan().gameObject,function()
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
            ---新手引导判断
            if NoviceViewModel.CurTaskId == 50521 then
                NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
                MessageEvent.Go(EID.NoviceCheck)
            end
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
    end)

    self.ScrollMask().gameObject:SetActive(false)
    ---注册替换队员滑块
    self.selectRoleLoop = self.LoopScrollRole01()
    self.selectRoleLoop:SetLuaCellEvent(Handle(self,self.CellSelectRole))
    self.selectRoleRect = self.selectRoleLoop.transform:GetComponent("RectTransform")
    ---默认打开替换队员
    self.LineUpOrOrder = 1
    self.LineupBtns().gameObject:SetActive(true)
    self.OrderBtns().gameObject:SetActive(false)

    self:ReloadOrder(false)
    self:UpdateTips(1)
    ---设置当前模式为选择角色
    self.CurMode = 1
    ---更新替换队员面板
    --self:ReloadSelectRole()

    ---默认关闭高亮
    self.Btn_Altogether_H().gameObject:SetActive(false)
    self.Btn_Separate_H().gameObject:SetActive(true)
    ---锁住按钮
    self.Btn_LockRormation().gameObject:SetActive(true)
    self.Btn_Rormation().gameObject:SetActive(false)
    self.Btn_Remove().gameObject:SetActive(false)
    self.Btn_LockRemove().gameObject:SetActive(true)
    ---注册查看敌我双方顺序按钮
    UIEvent.LuaClick(self.Btn_Separate().gameObject,function()
        self:ReloadOrder(true)
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
        ---高亮显示
        self.Btn_Altogether_H().gameObject:SetActive(true)
        self.Btn_Separate_H().gameObject:SetActive(false)
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
    end)
    if StormViewModel.CurPointType == StormViewModel.PointType.guide then

    else
        ---注册阵型显示按钮
        UIEvent.LuaClick(self.Btn_Rormation().gameObject,function()
            --local m = self.CurMode
            --self.CurMode = 0
            --self:ShowRoleInfo()
            -----@type FighterBase[] 创建当前使用的阵型数据
            --local fighters = {}
            --for i, role in pairs(BattleManager.AllRole) do
            --    if role.IsLeft == true then
            --        ---@type FighterBase
            --        local fighter = {}
            --        ---设置位置
            --        fighter.index = (6 - role.PosX) * 3 + role.PosY
            --        ---设置id
            --        fighter.roleID = tonumber(role.ID)
            --        ---加入数据池
            --        fighters[role.AtkOrder] = fighter
            --    end
            --end
            --MgrUI.Pop(UID.TeamGroupPop_UI,{fighters,function()
            --    ---返回回调
            --    self.CurMode = m
            --end,function(idx)
            --    ---改变阵型回调
            --    self:LoadTeamRole(idx,0)
            --end},true)
        end)
    end
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
    ---初始化播放速度
    self.FightSpeed = 1
    SettingViewModel.SetBattleSpeed(1)
    self.m_imgSpeeds = {
        self.Img_Speedx1().gameObject,
        self.Img_Speedx2().gameObject,
        self.Img_Speedx3().gameObject,
    }
    for i, img in pairs(self.m_imgSpeeds) do
        img:SetActive(1 == i)
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
    --UIEvent.LuaClick(self.Btn_Pause().gameObject,function()
    --    CJNBattleMgr.Instance.IsPause = true
    --    MgrUI.Pop(UID.BattlePause_UI,{BattleManager.AllRole,1},true)
    --    ---隐藏角色信息面板
    --    self:ShowRoleInfo()
    --end)

    ---Boss信息按钮
    UIEvent.LuaClick(self.Btn_BossInfo().gameObject,function()
        ---显示Boss信息
        for i, role in pairs(BattleManager.AllRole) do
            if role.GameID == 1 and role.Remove == false then
                self:ShowRoleInfo(role,true)
                break
            end
        end
        NoviceViewModel.CheckCurID(50705,function()
            NoviceViewModel.DoNext()
        end)
        NoviceViewModel.CheckCurID(50806,function()
            NoviceViewModel.DoNext()
        end)
    end)


    ---固定相机按钮
    self.Btn_Jintouqiehuan().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Jintouqiehuan().gameObject,function()
        if SettingViewModel.GetCameraMove() == 1 then
            SettingViewModel.SetCameraMove(2)
            MgrCamera.BackToRoundEndPosition()
            self.ZiyouJingtouicon().gameObject:SetActive(false)
            self.GudingJingtouicon().gameObject:SetActive(true)
        else
            SettingViewModel.SetCameraMove(1)
            self.ZiyouJingtouicon().gameObject:SetActive(true)
            self.GudingJingtouicon().gameObject:SetActive(false)
        end
    end)

    
    ---点击技能弹窗背景
    UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
        self:CloseSkillXiangqing()
        self:CloseBossHpBar(true)
    end)
    self:CloseSkillXiangqing()
end

---关闭技能详情
function M:CloseSkillXiangqing()
    self.Panel_RoleInfo:SetActive(false)
    self.Panel_Ready().gameObject:SetActive(true)
    self.Panel_Select().gameObject:SetActive(true)
    CJNBattleMgr.Instance:RaygetIdOff(false)
end

---替换队员滑块通知
function M:CellSelectRole(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.roleData[idx],self})
end
---阵型滑块通知
function M:CellTeam(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.teamData[idx],self})
end
---替换SkillPrefab滑块通知
function M:CellSkillPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.ChildSkillList[idx],self,self.CurRole,"Battle"})
end

---更新替换队员面板
function M:ReloadSelectRole(isMoveId)
    ---获取拥有的角色
    --self.roleData = StormViewModel.GetSortAndFilterHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise)
    ---不去排序直接用表里的顺序
    self.roleData = StormViewModel.CacheHeroList
    ---设置数量
    self.selectRoleLoop.totalCount = #self.roleData
    if isMoveId == nil then
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
        self.selectRoleLoop:RefillCells(index)
    end
    self.Text_Empty().gameObject:SetActive(self.selectRoleLoop.totalCount == 0)
end

function M:OnUpdateUI()
    MgrSound.PlayBGM(StormViewModel.CurPointData.bgm,0.2)
end

---销毁
function M:OnClose()
    MgrTimer.Cancel("BattleUIUpdate")
    Event.Remove("WorldBossHpClose",Handle(self,self.CloseBossHpBar))
    ---还原播放速度
    CJNBattleMgr.SetGameSpeed(1)
    ---销毁战斗数据
    BattleManager.ClearLuaData()
    self:SetCFunNull();
end

---更新提示信息
function M:UpdateTips(type)
    if type == 1 then
        ---选取提示
        local count = 0
        ---好友支援
        local FriendCount = 0
        for i, v in pairs(BattleManager.AllRole) do
            if v.IsLeft == true then
                count = count + 1
            end
            if v.userID and v.userID ~= 0 then
                FriendCount = FriendCount + 1
            end
        end
        if StormViewModel.FriendSupport then
            self.text_Tips.text = string.format("<color=#47FFE3>%s</color>/1",FriendCount)
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
    local NoviceData = NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId)
    if NoviceData.group == 120 or NoviceData.group == 121 then
        return
    end
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
    if role == nil or (BattleManager.IsFightStart) then
        if NoviceViewModel.CurTaskId == 10121 or NoviceViewModel.CurTaskId == 10123 then
            return
        end
        self.CurRoleInfo = nil
        self.Panel_RoleInfo:SetActive(false)
        CJNBattleMgr.Instance:RaygetIdOff(false)
        self:CloseBossHpBar(true)
    else
        self:CloseBossHpBar(false)
        self.Panel_RoleInfo:SetActive(true)
        CJNBattleMgr.Instance:CameraMoveOpenAndClose(false)
        ---获取角色数据
        local roleData = role.IsMonster and StormViewModel.CurPointData:GetMonsterById(tonumber(role.ID),role.AtkOrder) or HeroControl.GetRoleDataByID(tonumber(role.ID))
        ---更新头像
        MgrRes.LoadQIcon(self.Icon_RIHead(),roleData.id)
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
        self.Text_RIRank().text = "+"..role.SkillLV
        ---更新角色名称
        self.Text_RIName().text = roleData.name
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
        ---更新buff
        ---清空列表
        self.List_Index_GoIcon = {}
        self.List_Index_IconTex = {}
    end
    ---如果存在角色 还原透明度
    if self.dragRole then
        self.dragRole.myAni:SetAlpha(1)
    end
end

---@param skillPdata SkillDetailData
function M:ShowSkillXiangqing(skillPdata,ObjRoot)
    local tIsOpen = true
    local tMarkLv = skillPdata.UnlockLv[1]
    for i, v in ipairs(skillPdata.UnlockLv) do
        if self.CurRole.SkillLV >= v then
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
    local tSkillList = skillPdata.SkillList[tMarkLv]
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
    self.SkillXiangqing().gameObject:SetActive(true)
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
    trans:GetComponent("UITemplate"):SetData({self.sonSkillsTable[idx],self})
end

---@param roleData RoleData 创建Spine
function M:GetOrCreatSpineRole(roleData, _NotInSound,_delay)
    ---创建spine
    local battleRole = BattleManager.CreartRoleLeft(roleData.id, roleData.skin, roleData.level, roleData.star,roleData:GetHeroSkillLevel(), roleData.awaken, roleData.type)
    CBattleTools.CCreatUIGo(battleRole.AniName, battleRole.GameID, battleRole.Qzoom,(battleRole.SkinID == nil and battleRole.ID or battleRole.SkinID), function(myAni) battleRole.myAni = myAni end)
    -----创建战斗用角色数据
    --if battleRole.Str_Audio ~= nil and battleRole.Str_Audio ~= "0" and not _NotInSound then
    --    local audioGroup = tonumber(battleRole.Str_Audio)
    --    for key, value in pairs(ActorLinesLocalData.tab) do
    --        if value[2] == audioGroup and value[3] == 16 then
    --            battleRole.myAni.Audio_Dc=value[13]
    --            break
    --        end
    --    end
    --end
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
    for i, fighter in ipairs(team.info) do
        ---从UI关卡英雄池中移除拖拽英雄数据
        StormViewModel.RemoveHeroData(fighter.roleID)
        ---创建立绘
        local role = self:GetOrCreatSpineRole(HeroControl.GetRoleDataByID(fighter.roleID),i ~= 1, flayDelay)
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
        ---添加到左侧队列
        BattleManager.LeftTeamAdd(role)
        ---飞行进场
        role.myAni:UIFlayIn(0.55)
        if i == #team.info then
            ---更新提示
            self:UpdateTips(1)
            ---刷新滑块UI
            self:ReloadSelectRole()
            ---更新所有地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            ---更新所有队列图标
            self:ReloadOrder(false)
            ---取消loading
            -- MgrTimer.AddDelayNoName(0.5,function() MgrUI.PopHide(UID.FullLoading_UI) end,nil)
        end
        -----循环创建保证多个立绘加载不会卡顿
        --MgrTimer.AddDelayNoName(i*0.05,function()
        --
        --end,nil)
    end
end
---加载战术指导指定阵型
 function M:LoadGuideTeam()
    ---解除左侧队列角色
    self:ReMoveAllLeft()
    ---战术指导加载指定角色
    local maxCount = #StormViewModel.CacheHeroList
    if maxCount == 0 then
        return
    end
    local array = {}
    for i, roleData in ipairs(StormViewModel.CacheHeroList) do
        ---指定了位置的角色添加到场上
        if roleData.index > 0 then
            ---循环创建保证多个立绘加载不会卡顿
            ---创建立绘
            local role = self:GetOrCreatSpineRole(roleData,i ~= 1, 0.55)
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
            local NoviceData = NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId)
            local order = role.myAni.gameObject.transform:Find("AtkOrder(Clone)").gameObject
            if NoviceData.group == 120 or NoviceData.group == 121 then
                order:SetActive(false)
            end
            ---飞行进场
            --role.myAni:UIFlayIn(0.55)
            ---从UI关卡英雄池中移除拖拽英雄数据+
            table.insert(array,tonumber(role.ID))
        end
        if i == maxCount then
            for m, n in pairs(array) do
                StormViewModel.RemoveHeroData(n)
            end
            ---更新提示
            self:UpdateTips(1)
            ---刷新滑块UI
            self:ReloadSelectRole(0)
            ---更新所有地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            ---更新所有队列图标
            self:ReloadOrder(false)
            ---取消loading
            -- MgrUI.PopHide(UID.FullLoading_UI)
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
        MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_2")
        local tempNumber = self.Uidata_AtkOrSup/100
        self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
        self.Text_Atk2().text = tempNumber.."%"
        MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..role.AttackRangeTexture)
    else
        ---非支援
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
    CJNUIMgr.SetFuc_IconTime(Handle(self,self.Icon_UpdateTime))
end
function M:SetCFunNull()
    CJNUIMgr.SetFuc_UpdataTopValue(nil)
    CJNUIMgr.SetFuc_UpdataTopValue_Base(nil)
    CJNUIMgr.SetFuc_TopIconDel(nil)
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

---检查更新
function M:CheckHot()
    self:OnInitFight()
end

function M:SetRoleXY(x,y)
    ---重新设置xy并更新位置
    self.dragRole.PosX = x
    self.dragRole.PosY = y
    ---更新地板数据
    BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
    self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
end

function M:ExchangeRole(targetRole)
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
    ---移除uiItem队列
    StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
end
function M:CloseBossHpBar(bool)
    if BattleManager.AllRole[1].myAni.IsWorldBoss then
        BattleManager.AllRole[1].myAni.myHpUi.Prefab_Root.gameObject:SetActive(bool)
    end
end
return M