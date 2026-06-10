
-- Code Auto Create Begin
local M = Class('PVPReady_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPReady_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPReady_UI].prefab'
    self.Name = 'Form[PVPReady_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PvpPanel','Ani/PvpPanel',2},{'Img_Jianbiandi','Ani/PvpPanel/Img_Jianbiandi',2},{'Btn_Sweep','Ani/PvpPanel/RecordPanel/Btn_Sweep',2},{'Img_Saodangdi','Ani/PvpPanel/RecordPanel/Btn_Sweep/Img_Saodangdi',2},{'SweepSuo','Ani/PvpPanel/RecordPanel/Btn_Sweep/Btn_Content/SweepSuo',2},{'Btn_StartExercise','Ani/PvpPanel/RecordPanel/Btn_StartExercise',2},{'Img_Kaishiyanxidi','Ani/PvpPanel/RecordPanel/Btn_StartExercise/Img_Kaishiyanxidi',2},{'ExerciseCost','Ani/PvpPanel/RecordPanel/Btn_StartExercise/ExerciseCost',2},{'ExerciseIcon','Ani/PvpPanel/RecordPanel/Btn_StartExercise/ExerciseCost/ExerciseIcon',2},{'Btn_Dailizhong','Ani/PvpPanel/RecordPanel/Btn_Dailizhong',2},{'Img_Dailizhongdi','Ani/PvpPanel/RecordPanel/Btn_Dailizhong/Img_Dailizhongdi',2},{'Btn_Dailiwancheng','Ani/PvpPanel/RecordPanel/Btn_Dailiwancheng',2},{'Img_Kaishiyanxidi01','Ani/PvpPanel/RecordPanel/Btn_Dailiwancheng/Img_Kaishiyanxidi',2},{'Img_xian','Ani/PvpPanel/RecordPanel/Img_xian',2},{'Img_xian01','Ani/PvpPanel/RecordPanel/Img_xian',2},{'Img_Jiludi','Ani/PvpPanel/RecordPanel/Img_Jiludi',2},{'WinPro','Ani/PvpPanel/RecordPanel/WinPro',2},{'Img_Qieyedi','Ani/PvpPanel/RecordPanel/Btn_AtkRecord/Img_Qieyedi',2},{'Btn_Selected','Ani/PvpPanel/RecordPanel/Btn_AtkRecord/Btn_Selected',2},{'Img_Qieyedi01','Ani/PvpPanel/RecordPanel/Btn_AtkRecord/Btn_Selected/Img_Qieyedi',2},{'Img_Qieyedi02','Ani/PvpPanel/RecordPanel/Btn_DefRecord/Img_Qieyedi',2},{'Btn_Selected01','Ani/PvpPanel/RecordPanel/Btn_DefRecord/Btn_Selected',2},{'Img_Qieyedi03','Ani/PvpPanel/RecordPanel/Btn_DefRecord/Btn_Selected/Img_Qieyedi',2},{'PlayerInfoPanel','Ani/PvpPanel/PlayerInfoPanel',2},{'CurRankIcon','Ani/PvpPanel/PlayerInfoPanel/CurRankIcon',2},{'Img_RankIcon','Ani/PvpPanel/PlayerInfoPanel/Img_RankIcon',2},{'Btn_SwitchRank','Ani/PvpPanel/PlayerInfoPanel/Btn_SwitchRank',2},{'Img_Qiehuandi','Ani/PvpPanel/PlayerInfoPanel/Btn_SwitchRank/Img_Qiehuandi',2},{'Img_Yanxidi2','Ani/PvpPanel/PlayerInfoPanel/Btn_SwitchRank/Img_Yanxidi2',2},{'GaoJi','Ani/PvpPanel/PlayerInfoPanel/Btn_SwitchRank/GaoJi',2},{'ChuJi','Ani/PvpPanel/PlayerInfoPanel/Btn_SwitchRank/ChuJi',2},{'bg','Ani/PvpPanel/PlayerInfoPanel/bg',2},{'Img_Jifendi','Ani/PvpPanel/PlayerInfoPanel/Img_Jifendi',2},{'Rank','Ani/PvpPanel/PlayerInfoPanel/Rank',2},{'Img_xian02','Ani/PvpPanel/PlayerInfoPanel/Img_xian',2},{'jingyantiaodi','Ani/PvpPanel/PlayerInfoPanel/jingyantiaodi',2},{'CurRankExp','Ani/PvpPanel/PlayerInfoPanel/CurRankExp',2},{'LowCoupons','Ani/PvpPanel/PlayerAsset/LowCoupons',2},{'Img_Tiantiquandi','Ani/PvpPanel/PlayerAsset/LowCoupons/Img_Tiantiquandi',2},{'Btn_+2','Ani/PvpPanel/PlayerAsset/LowCoupons/Btn_+2',2},{'Tiantiquanicon(jian)2','Ani/PvpPanel/PlayerAsset/LowCoupons/Tiantiquanicon(jian)2',2},{'LowDetail','Ani/PvpPanel/PlayerAsset/LowCoupons/LowDetail',2},{'HignCoupons','Ani/PvpPanel/PlayerAsset/HignCoupons',2},{'Img_Tiantiquandi01','Ani/PvpPanel/PlayerAsset/HignCoupons/Img_Tiantiquandi',2},{'Btn_HignBuy','Ani/PvpPanel/PlayerAsset/HignCoupons/Btn_HignBuy',2},{'Btn_HignBuyArea','Ani/PvpPanel/PlayerAsset/HignCoupons/Btn_HignBuyArea',2},{'Tiantiquanicon(jian)1','Ani/PvpPanel/PlayerAsset/HignCoupons/Tiantiquanicon(jian)1',2},{'HignDetail','Ani/PvpPanel/PlayerAsset/HignCoupons/HignDetail',2},{'ShowTime','Ani/PvpPanel/PlayerAsset/HignCoupons/ShowTime',2},{'Btn_Legend','Ani/PvpPanel/Btn_Legend',2},{'Btn_TopRank','Ani/PvpPanel/Btn_TopRank',2},{'Btn_ExerciseShop','Ani/PvpPanel/Btn_ExerciseShop',2},{'Btn_RewardPreview','Ani/PvpPanel/Btn_RewardPreview',2},{'Img_TishiBian','Ani/PvpPanel/Img_Tips/Img_TishiBian',2},{'Btn_SetFormation','Ani/PvpPanel/Btn_SetFormation',2},{'Btn_Zhenxingsheding','Ani/PvpPanel/Btn_SetFormation/Btn_Zhenxingsheding',2},{'Lock','Ani/PvpPanel/Btn_SetFormation/Lock',2},{'Img_Mask','Ani/PvpPanel/Btn_SetFormation/Lock/Img_Mask',2},{'Img_Dailizhongicon','Ani/PvpPanel/Btn_SetFormation/Lock/Img_Dailizhongicon',2},{'Btn_Master','Ani/PvpPanel/Btn_Master',2},{'Img_Season','Ani/PvpPanel/Img_Season',2},{'Btn_Return','Ani/PvpPanel/Btn_Return',2},{'Btn_I','Ani/PvpPanel/Btn_I',2},{'Img_xian03','Ani/PvpPanel/Img_xian',2},{'Img_Dailishijiandi','Ani/PvpPanel/Img_Dailishijiandi',2},{'Img_tiao','Ani/PvpPanel/Text_Shengyushijian/Img_tiao',2},{'SetPanel','Ani/SetPanel',2},{'Panel_Select','Ani/SetPanel/Panel_Ready/Panel_Select',2},{'Img_Huangtiao','Ani/SetPanel/Panel_Ready/Panel_Select/Img_Huangtiao',2},{'LineupBtns','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns',2},{'Img_Rormationdi','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu/Img_Rormationdi',2},{'Rormationicon','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu/Rormationicon',2},{'Img_Rormationdi01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Img_Rormationdi',2},{'Rormationicon01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Rormationicon',2},{'Img_Removedi','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Img_Removedi',2},{'Removeicon','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Removeicon',2},{'SwitchPanel','Ani/SetPanel/Panel_Ready/SwitchPanel',2},{'Img_di','Ani/SetPanel/Panel_Ready/SwitchPanel/Img_di',2},{'Jingong','Ani/SetPanel/Panel_Ready/SwitchPanel/Jingong',2},{'Icon','Ani/SetPanel/Panel_Ready/SwitchPanel/Jingong/Icon',2},{'Fangshou','Ani/SetPanel/Panel_Ready/SwitchPanel/Fangshou',2},{'Icon01','Ani/SetPanel/Panel_Ready/SwitchPanel/Fangshou/Icon',2},{'Frame','Ani/SetPanel/Panel_Ready/SwitchPanel/Frame',2},{'Img_Tanchuangdi(xia)','Ani/SetPanel/Panel_Ready/Panel_Room/Img_Tanchuangdi(xia)',2},{'LoopScrollRole','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',2},{'Img_OpenFilterdi','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Img_OpenFilterdi',2},{'Pailieicon','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Pailieicon',2},{'RoleType','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType',2},{'Btn_Self','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Self',2},{'Img_Bg','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Self/Img_Bg',2},{'Btn_Support','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Support',2},{'Img_Bg01','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Support/Img_Bg',2},{'ScrollMask','Ani/SetPanel/Panel_Ready/Panel_Room/ScrollMask',2},{'Image','Ani/SetPanel/Panel_Ready/Panel_Room/ScrollMask/Image',2},{'Img_TishiBian01','Ani/SetPanel/Panel_Ready/Panel_Room/Img_Tips/Img_TishiBian',2},{'Btn_ReturnPvp','Ani/SetPanel/Panel_Ready/Btn_ReturnPvp',2},{'Btn_Zuozhanyanxi','Ani/SetPanel/Panel_Ready/Btn_ReturnPvp/Btn_Zuozhanyanxi',2},{'Btn_Recovery','Ani/SetPanel/Panel_Ready/Btn_Recovery',2},{'Img_Huifuzhenxingdi','Ani/SetPanel/Panel_Ready/Btn_Recovery/Img_Huifuzhenxingdi',2},{'Img_Kuang(hui)','Ani/SetPanel/Panel_Ready/Btn_Recovery/Img_Kuang(hui)',2},{'Btn_Save','Ani/SetPanel/Panel_Ready/Btn_Save',2},{'Img_Chucunzhenxingdi','Ani/SetPanel/Panel_Ready/Btn_Save/Img_Chucunzhenxingdi',2},{'guang','Ani/SetPanel/Panel_Ready/Btn_Save/guang',2},{'Img_Kuang(liang)','Ani/SetPanel/Panel_Ready/Btn_Save/Img_Kuang(liang)',2},{'Btn_HideRoleInfo','Ani/SetPanel/Panel_RoleInfo/Btn_HideRoleInfo',2},{'Img_Tanchuangdi(shang)','Ani/SetPanel/Panel_RoleInfo/Img_Tanchuangdi(shang)',2},{'Img_xian1','Ani/SetPanel/Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian1',2},{'Img_xian2','Ani/SetPanel/Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian2',2},{'Img_Lihuidi','Ani/SetPanel/Panel_RoleInfo/RoleHead/Img_Lihuidi',2},{'Icon_RIHead','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_RIHead',2},{'Icon_RIFrame','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_RIFrame',2},{'Icon_RICareer','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_RICareer',2},{'RIStar_1','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_1',2},{'Normal','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_1/Normal',2},{'HighLight','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_1/HighLight',2},{'RIStar_2','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_2',2},{'Normal01','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_2/Normal',2},{'HighLight01','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_2/HighLight',2},{'RIStar_3','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_3',2},{'Normal02','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_3/Normal',2},{'HighLight02','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_3/HighLight',2},{'RIStar_4','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_4',2},{'Normal03','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_4/Normal',2},{'HighLight03','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_4/HighLight',2},{'RIStar_5','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_5',2},{'Normal04','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_5/Normal',2},{'HighLight04','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_5/HighLight',2},{'RIStar_6','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_6',2},{'Normal05','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_6/Normal',2},{'HighLight05','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_6/HighLight',2},{'RIAwaken','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken',2},{'Super','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super',2},{'Super1','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super1',2},{'Super2','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super2',2},{'Super3','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super3',2},{'Super4','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super4',2},{'Super5','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super5',2},{'Icon_Rankdi','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_Rankdi',2},{'Fanwei','Ani/SetPanel/Panel_RoleInfo/Fanwei',2},{'Mubiao','Ani/SetPanel/Panel_RoleInfo/Mubiao',2},{'Hp','Ani/SetPanel/Panel_RoleInfo/Hp',2},{'HPtiaodi','Ani/SetPanel/Panel_RoleInfo/Hp/HPtiaodi',2},{'HPtiao','Ani/SetPanel/Panel_RoleInfo/Hp/HPtiao',2},{'Img_xian101','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Img_xian1',2},{'Img_xian201','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Img_xian2',2},{'Atk','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk',2},{'AtkIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk/AtkIcon',2},{'Def','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def',2},{'DefIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def/DefIcon',2},{'Baoji','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji',2},{'BaojiIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji/BaojiIcon',2},{'Baoshang','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang',2},{'BaoshangIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/BaoshangIcon',2},{'Mingjie','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie',2},{'MingjieIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/MingjieIcon',2},{'Img_Chakandi','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan/Img_Chakandi',2},{'ChakanIcon','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan/ChakanIcon',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Button 列表
        {'Btn_Shunxu','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu',4},{'Btn_Rormation','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',4},{'Btn_Remove','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',4},{'Btn_OpenFilter','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',4},{'Img_Bg02','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Support/Img_Bg',4},{'Btn_Chakan','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan',4},
        -- UITemplate 列表
        {'PvPRecordItem','Ani/PvpPanel/RecordPanel/RecordScroll/PvPRecordItem',10},{'PVPSupportItem','Ani/PvpPanel/SupportScroll/PVPSupportItem',10},{'PVPRoleItem','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole/PVPRoleItem',10},
        -- Toggle 列表
        {'Btn_AtkRecord','Ani/PvpPanel/RecordPanel/Btn_AtkRecord',13},{'Btn_DefRecord','Ani/PvpPanel/RecordPanel/Btn_DefRecord',13},{'Btn_Self01','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Self',13},{'Btn_Support01','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Support',13},
        -- RawImage 列表
        {'RecordScroll','Ani/PvpPanel/RecordPanel/RecordScroll',15},{'Img_Support','Ani/PvpPanel/Img_Support',15},{'Panel_Ready','Ani/SetPanel/Panel_Ready',15},{'Btn_Shunxu01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu',15},{'Btn_Rormation01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',15},{'Btn_Remove01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',15},{'Panel_Replace','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace',15},{'Btn_OpenFilter01','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',15},{'Panel_RoleInfo','Ani/SetPanel/Panel_RoleInfo',15},{'Btn_Chakan01','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan',15},
        -- LoopScrollRect 列表
        {'RecordScroll01','Ani/PvpPanel/RecordPanel/RecordScroll',18},{'SupportScroll','Ani/PvpPanel/SupportScroll',18},{'LoopScrollRole01','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',18},
        -- TextMeshProUGUI 列表
        {'Text_Saodang','Ani/PvpPanel/RecordPanel/Btn_Sweep/Btn_Content/Text_Saodang',20},{'Text_Kaishiyanxi','Ani/PvpPanel/RecordPanel/Btn_StartExercise/Text_Kaishiyanxi',20},{'Text_ExerciseCost','Ani/PvpPanel/RecordPanel/Btn_StartExercise/ExerciseCost/Text_ExerciseCost',20},{'Text_Dailizhong','Ani/PvpPanel/RecordPanel/Btn_Dailizhong/Text_Dailizhong',20},{'Text_Kaishiyanxi01','Ani/PvpPanel/RecordPanel/Btn_Dailiwancheng/Text_Kaishiyanxi',20},{'Text_Shenglv','Ani/PvpPanel/RecordPanel/WinPro/Text_Shenglv',20},{'Text_WinPro','Ani/PvpPanel/RecordPanel/WinPro/Text_WinPro',20},{'Text_FightNum','Ani/PvpPanel/RecordPanel/WinPro/Text_FightNum',20},{'Text_atk','Ani/PvpPanel/RecordPanel/Btn_AtkRecord/Text_atk',20},{'Text_atk01','Ani/PvpPanel/RecordPanel/Btn_AtkRecord/Btn_Selected/Text_atk',20},{'Text_atk02','Ani/PvpPanel/RecordPanel/Btn_DefRecord/Text_atk',20},{'Text_atk03','Ani/PvpPanel/RecordPanel/Btn_DefRecord/Btn_Selected/Text_atk',20},{'Title_Score','Ani/PvpPanel/PlayerInfoPanel/Title_Score',20},{'Text_Score','Ani/PvpPanel/PlayerInfoPanel/Text_Score',20},{'Title_Bili','Ani/PvpPanel/PlayerInfoPanel/Title_Bili',20},{'Text_Bili','Ani/PvpPanel/PlayerInfoPanel/Text_Bili',20},{'Title_DisNextLv','Ani/PvpPanel/PlayerInfoPanel/Title_DisNextLv',20},{'Text_DisNextLv','Ani/PvpPanel/PlayerInfoPanel/Text_DisNextLv',20},{'Title_RankEndTime','Ani/PvpPanel/PlayerInfoPanel/Title_RankEndTime',20},{'Text_RankEndTime','Ani/PvpPanel/PlayerInfoPanel/Text_RankEndTime',20},{'Text_Qiehuan','Ani/PvpPanel/PlayerInfoPanel/Btn_SwitchRank/Text_Qiehuan',20},{'Text_RankTitle','Ani/PvpPanel/PlayerInfoPanel/Btn_SwitchRank/Text_RankTitle',20},{'Text_Paiming','Ani/PvpPanel/PlayerInfoPanel/RankContent/Text_Paiming',20},{'Text_RankScore','Ani/PvpPanel/PlayerInfoPanel/RankContent/Text_RankScore',20},{'Text_LowCouponsCount','Ani/PvpPanel/PlayerAsset/LowCoupons/Text_LowCouponsCount',20},{'Text_PowerClock','Ani/PvpPanel/PlayerAsset/LowCoupons/LowDetail/Text_PowerClock',20},{'Text_TargetTime','Ani/PvpPanel/PlayerAsset/LowCoupons/LowDetail/Text_TargetTime',20},{'title','Ani/PvpPanel/PlayerAsset/LowCoupons/LowDetail/title',20},{'title2','Ani/PvpPanel/PlayerAsset/LowCoupons/LowDetail/title2',20},{'Text_HignCouponsCount','Ani/PvpPanel/PlayerAsset/HignCoupons/Text_HignCouponsCount',20},{'Text_PowerClockPvp','Ani/PvpPanel/PlayerAsset/HignCoupons/HignDetail/Text_PowerClockPvp',20},{'Text_TargetTimePvp','Ani/PvpPanel/PlayerAsset/HignCoupons/HignDetail/Text_TargetTimePvp',20},{'title01','Ani/PvpPanel/PlayerAsset/HignCoupons/HignDetail/title',20},{'title201','Ani/PvpPanel/PlayerAsset/HignCoupons/HignDetail/title2',20},{'Text_Legend','Ani/PvpPanel/Btn_Legend/Text_Legend',20},{'Text_Toppaiming','Ani/PvpPanel/Btn_TopRank/Text_Toppaiming',20},{'Text_Yanxishangdian','Ani/PvpPanel/Btn_ExerciseShop/Text_Yanxishangdian',20},{'Text_Jiangliyulan','Ani/PvpPanel/Btn_RewardPreview/Text_Jiangliyulan',20},{'Text_Tips','Ani/PvpPanel/Img_Tips/Text_Tips',20},{'Text_Zhenxingsheding','Ani/PvpPanel/Btn_SetFormation/Text_Zhenxingsheding',20},{'Text_Master','Ani/PvpPanel/Btn_Master/Text_Master',20},{'TextInMaster','Ani/PvpPanel/Btn_Master/TextInMaster',20},{'Text_Season','Ani/PvpPanel/Img_Season/Text_Season',20},{'Text_Exercise','Ani/PvpPanel/Text_Exercise',20},{'Text_Zuozhanyanxi','Ani/PvpPanel/Text_Zuozhanyanxi',20},{'Text_Shijian','Ani/PvpPanel/Text_Shijian',20},{'Text_Shengyushijian','Ani/PvpPanel/Text_Shengyushijian',20},{'Text_Zhenxing','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Text_Zhenxing',20},{'Text_Cunqu','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu/Text_Cunqu',20},{'Text_Cunqu01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Text_Cunqu',20},{'Text_Jiechu','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Text_Jiechu',20},{'Text_Jingong','Ani/SetPanel/Panel_Ready/SwitchPanel/Jingong/Text_Jingong',20},{'Text_Fangshou','Ani/SetPanel/Panel_Ready/SwitchPanel/Fangshou/Text_Fangshou',20},{'Text_Pailie','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Text_Pailie',20},{'Text_Self','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Self/Text_Self',20},{'Text_Support','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/RoleType/Btn_Support/Text_Support',20},{'Text','Ani/SetPanel/Panel_Ready/Panel_Room/ScrollMask/Image/Text',20},{'Text_Tips01','Ani/SetPanel/Panel_Ready/Panel_Room/Img_Tips/Text_Tips',20},{'Text_Zuozhanyanxi01','Ani/SetPanel/Panel_Ready/Btn_ReturnPvp/Text_Zuozhanyanxi',20},{'Text_Huifuzhenxing','Ani/SetPanel/Panel_Ready/Btn_Recovery/Text_Huifuzhenxing',20},{'Text_Chucunzhenxing','Ani/SetPanel/Panel_Ready/Btn_Save/Text_Chucunzhenxing',20},{'Text_RILevel','Ani/SetPanel/Panel_RoleInfo/RoleHead/Text_RILevel',20},{'Text_RILv','Ani/SetPanel/Panel_RoleInfo/RoleHead/Text_RILv',20},{'Text_RIRank','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_Rankdi/Text_RIRank',20},{'Text_RIName','Ani/SetPanel/Panel_RoleInfo/Text_RIName',20},{'Text_Mubiaozi','Ani/SetPanel/Panel_RoleInfo/Mubiao/Text_Mubiaozi',20},{'Text_HP1','Ani/SetPanel/Panel_RoleInfo/Hp/Text_HP1',20},{'Text_HP2','Ani/SetPanel/Panel_RoleInfo/Hp/Text_HP2',20},{'Text_Atk1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk1',20},{'Text_Atk2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk2',20},{'Text_Def1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def1',20},{'Text_Def2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def2',20},{'Text_Baoji1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji1',20},{'Text_Baoji2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji2',20},{'Text_Baoshang1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang1',20},{'Text_Baoshang2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang2',20},{'Text_Mingjie1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie1',20},{'Text_Mingjie2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie2',20},{'Text_Chakan','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan/Text_Chakan',20},
    }
end
-- Code Auto Create End
require("LocalData/LowPVPLocalData")
require("LocalData/SeniorPVPLocalData")
require("LocalData/SteamLocalData")
function M:OnUpdateUI()
    self.PVPAttackOrDefend = true
    Global.MoveToUnder(self.Jingong().gameObject,self.Frame().gameObject)
    self.Btn_Dailiwancheng().gameObject:SetActive(false)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    StormViewModel.CurPointType = nil
    StormViewModel.CurPointData = nil
    self.ArmorType = 0
    ---关闭/打开扫荡锁
    self.SweepSuo().gameObject:SetActive(self.RankData.score < tonumber(SteamLocalData.tab[107011][2]))
    self:CloseSkillXiangqing()
    self.SwitchPanel().gameObject:SetActive(true)
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113019][2],0.2)
    ---刷新结算时间
    self:RefeshTime()
    MgrTimer.AddRepeat("PVPSeasonFinish",1,function()
        self:RefeshTime()
    end,-1,self.ObjRoot)
    Event.Add("PlayerRankUpPop",PVPViewModel.PlayerRankUpPop)
    Event.Go("TeamChangeTip")
    ---观看记录返回时，不弹段位框
    if PVPViewModel.IsViewRecord then
        PVPViewModel.IsViewRecord = false
    else
        Event.Go("PlayerRankUpPop")
    end
    ---计算代理PVP结束时间
    Event.Add("CalculatePVPTimeOff",Handle(self,self.OnOffCalculatePVPTime))
    --if PVPViewModel.bCount ~= 0 then
    --    self.Lock().gameObject:SetActive(true)
        self:CalculatePVPTime()
        --self:OnOffCalculatePVPTime(true)
    --else
    --    self.Lock().gameObject:SetActive(false)
        --self:OnOffCalculatePVPTime(false)
    --    self.Btn_StartExercise().gameObject:SetActive(true)
    --    self.Btn_Sweep().gameObject:SetActive(true)
    --end
end

function M:OnBackKey()
    local isPvpPanel = self.PvpPanel().gameObject.activeSelf
    local isSetPanel = self.SetPanel().gameObject.activeSelf
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        if isSetPanel then
            self:SetReturnPVP()
            return
        end
        if not isPvpPanel then
           return
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        PVPViewModel.Close()
        MgrTimer.Cancel("PVPTiLiClock")
    end
end

function M:OnInit()
    self.PVPAttackOrDefend = true
    self.sendNextReq = false
    self.HignDetail().gameObject:SetActive(false)
    self:OnOffCalculatePVPTime(false)
    self.Panel_RoleInfo = self.Panel_RoleInfo().gameObject
    self.Rank = nil
    ---在切换到调整顺序时，控制头像的遮挡
    self.SelectRoleStop = false
    ---天梯数据
    self.RankData = PVPViewModel.CurRankData
    local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
    PVPViewModel.RoleLimit = rankData[18]

    PVPViewModel.ReadyCallBack = Handle(self,self.DataCallBack)
    self.PvpPanel().gameObject:SetActive(true)
    self.SetPanel().gameObject:SetActive(false)
    self.Panel_RoleInfo:SetActive(false)
    ---是否对阵型进行了修改
    self.isChange = false
    -----角色信息星底框
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
    ---1、设置角色，2、问号排序模式，3、交换排序模式
    self.CurMode = 0
    ---更新PVP玩家信息
    self:UpdataPlayerInfo()
    -- CJNUIMgr.InitBattleMapNodePosList(SteamLocalData.tab[113005][2],SteamLocalData.tab[113006][2])
    CJNUIMgr.InitBattleMapNodePosList2(BattleManager.FloorPos.left,BattleManager.FloorPos.right)
    BattleManager.StartBattle(nil,1,BattleManager.MonsterStandType.PVP)  --参数没用
    ---1.5f后更新地板
    MgrTimer.AddDelay("ShowFloor",1.5,function() CJNBattleMgr.Instance:SetAllFloorHid() end,nil)
    ---获取战斗摄像机
    self.battleCamera = CMgrCamera.Instance.FightCamera
    ---获取ui摄像机
    self.uiCamera = GameObject.Find("UI_Camera"):GetComponent("Camera")
    ---初始化拖拽UI物体
    self.UIDragItem = self.PVPRoleItem()
    ---记录类型
    self.RecordType = 1  --- 1为攻击记录， 2为防御记录
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化按钮
    self:InitButton()
    ---初始化左侧toggle
    self:InitLeftSwitch()
    ---移除右边角色
    self:ReMoveAllRight()

    self.Btn_Self01().isOn = true;
    self.useSelfRole = true;
    Tools.ToggleValueChange(self.Btn_Self01(), function(isOn)
        if isOn then
            self.useSelfRole = true;
            self:ReloadSelectRole();
        end
    end);
    Tools.ToggleValueChange(self.Btn_Support01(), function(isOn)
        if isOn then
            self.useSelfRole = false;
            self:ReloadSelectRole();
        end
    end);
    
    if PVPViewModel.type == 0 then
        self:LoadTeamRole(10000)
    elseif PVPViewModel.type == 1 then
        if self.PVPAttackOrDefend then
            self:LoadTeamRole(10001,false)
        else
            self:LoadTeamRole(10002,false)
        end
    end
    ---默认分别排序模式
    self.sortingType = 1
    --检测队伍是否超上限，调整队伍并保存服务器
    self:CheckTeam(v)
    
    self:OnRefreshSeason();
    Event.Add("PVPRefreshSeason", Handle(self, self.OnRefreshSeason));
    self.SupportScroll():SetLuaCellEvent(Handle(self, self.OnSupportItemRender))

    Event.Add("PVPMasterFormationClose", Handle(self, self.OnPVPMasterFormationClose));
end

function M:OnShowFinish()
    MgrCamera.VirCamerasInit_New()
    NoviceViewModel.CheckFirstGuide(45)
    CJNBattleMgr:ActiveBuildings()
    local lastSeason = PVPViewModel.MasterSeasonReq;
    self.TextInMaster().gameObject:SetActive(false);
    PVPViewModel.SendGetChampionMatchReq(0, nil, function()
        -- 当期大师赛是否开放
        if PVPViewModel.MasterIsOpen() then
            self.TextInMaster().gameObject:SetActive(true);
        else
            self.TextInMaster().gameObject:SetActive(false);
        end
        if PVPViewModel.GetViewRecordsCount() > 1 then
            -- 看录像回来
            if 0 == lastSeason then
                -- 本期录像
                MgrUI.GoHide(UID.PVPMaster_UI, nil);
            else
                -- 往期录像
                PVPViewModel.MasterSeasonReq = lastSeason;
                MgrUI.GoHide(UID.PVPLegend_UI,nil);
            end
        elseif PVPViewModel.DirectEnterMaster then
            -- Home直接进
            PVPViewModel.DirectEnterMaster = false;
            MgrUI.GoHide(UID.PVPMaster_UI, nil);
        end
    end);
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Remove("TeamChangeTip",Handle(self,self.TeamChangeTip))
    Event.Remove("PVPRefreshSeason", Handle(self, self.OnRefreshSeason));
    MgrTimer.Cancel("ShowFloor")
    MgrTimer.Cancel("PVPSeasonFinish")
    MgrTimer.Cancel("NextPVPBattle")
    MgrTimer.Cancel("Continue_PVP")
    MgrTimer.Cancel("PVPTiliClick")
    MgrTimer.Cancel("PVPTiLiClock")
    Event.Remove("PVPMasterFormationClose", Handle(self, self.OnPVPMasterFormationClose));
end
---移动摄像机
function M:MoveCamera(type)
    UnityEngine.Debug.LogError(type)
    if type == 0 then
        ---PVP界面
        Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-100,100,-1200),1,0,15,false,0,0)
        self.battleCamera.transform.localRotation = Quaternion.Euler(6, 0, 0)
        self.battleCamera.fieldOfView = 23;
    elseif type == 1 then
        ---阵型设定
        Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-250,240,-1100),1,0,15,false,0,0)
        self.battleCamera.transform.localRotation = Quaternion.Euler(14, 0, 0)
        self.battleCamera.fieldOfView = 23;
    elseif type == 2 then
        ---一阶
        --Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-250,40,-900),1,0,15,false,0,0)
    elseif type == 3 then
        ---二阶
        --Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-250,40,-900),1,0,15,false,0,0)
    elseif type == 4 then
        ---三阶
        --Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-250,40,-900),1,0,15,false,0,0)
    end
end
---注册滑块
function M:RegisterLoopScroll()
    self.RecordScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.LoopScrollRole01():SetLuaCellEvent(Handle(self,self.CellSelectRole))
    self.selectRoleLoop = self.LoopScrollRole01()
    self.selectRoleRect = self.selectRoleLoop.transform:GetComponent("RectTransform")
end
---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.CurLoopList[idx])
end
---阵型滑块通知
function M:CellTeam(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.teamData[idx],self})
end
---替换队员滑块通知
function M:CellSelectRole(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.roleData[idx],self})
end
---设置滑动数据
function M:ResetItem(offset)
    ---获取当前loop数据
    if self.RecordType == 1 then
        self.CurLoopList = self.RankData.attack.info
    elseif self.RecordType == 2 then
        self.CurLoopList = self.RankData.defense.info
    end
    if self.CurLoopList then
        ---设置总数
        self.RecordScroll01().totalCount = #self.CurLoopList
        if offset then
            self.RecordScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
        else
            self.RecordScroll01():RefreshCells()               ---只刷新数据
        end
    else
        ---设置总数
        self.RecordScroll01().totalCount = 0
        self.RecordScroll01():RefillCells(0)
    end
end
---设置替换队员面板滑动数据
function M:ReloadSelectRole(isMoveId)
    if not self.useSelfRole then
        self.roleData = PVPViewModel.GetSortAndFilterTryHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise);
        self.LoopScrollRole01().totalCount = #self.roleData;
        self.LoopScrollRole01():RefillCells();
        return;
    end
    ---获取拥有的角色
    if PVPViewModel.type == 0 then
        self.roleData = PVPViewModel.GetSortAndFilterHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise,true)
    else
        self.roleData = PVPViewModel.GetSortAndFilterHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise)
    end

    --偏爱角色提前
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

    ---设置数量
    self.LoopScrollRole01().totalCount = #self.roleData
    if isMoveId == nil then
        ---直接刷新面板
        self.LoopScrollRole01():RefillCells()
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
        self.LoopScrollRole01():RefillCells(index)
    end
end
---更新玩家信息
function M:UpdataPlayerInfo()
    local tab = {}
    if PVPViewModel.type == 0 then
        --self.Text_CurRankTitle().text = "初级演习"
        --self.Text_RankTitle().text = "高级演习"
        --self.WChuJi().gameObject:SetActive(true)
        --self.WGaoJi().gameObject:SetActive(false)
        --self.ChuJi().gameObject:SetActive(false)
        --self.GaoJi().gameObject:SetActive(true)
        --self.LowCoupons().gameObject:SetActive(true)
        --self.HignCoupons().gameObject:SetActive(false)
        --self.Text_LowCouponsCount().text = PVPViewModel.LowCard.."/"..SteamLocalData.tab[108001][2]
        tab = LowPVPLocalData.tab
    elseif PVPViewModel.type == 1 then
        --self.Text_RankTitle().text = "新锐演习"
        --self.ChuJi().gameObject:SetActive(true)
        --self.GaoJi().gameObject:SetActive(false)
        self.LowCoupons().gameObject:SetActive(false)
        self.HignCoupons().gameObject:SetActive(true)
        self.Text_HignCouponsCount().text = PVPViewModel.HighCard.."/"..SteamLocalData.tab[107001][2]
        self:InitClock()
        tab = SeniorPVPLocalData.tab
    end
    self.Text_Score().text = "<color=#FFD075>" .. self.RankData.score .. "</color>";
    self.Text_RankScore().text = self.RankData.rank
    --排名变动后刷新UI
    Tools.ReSize(self.Text_RankScore().transform.parent.gameObject)
    
    local nextIndex = 0
    ---原排名计算方法
    --local rankData = PVPViewModel.GetPvPRank(self.RankData.score,self.RankData.rank)
    --
    --self.Rank = rankData[2]
    --nextIndex = rankData[1] - 1
    --MgrRes.LoadSprite(self.CurRankIcon(),"Level/"..rankData[3])
    --MgrRes.LoadSprite(self.Img_RankIcon(),"Level/"..rankData[17],nil,true)
    --PVPViewModel.ReadyMap = rankData[14]
    --PVPViewModel.FightMap = rankData[15]
    ---新排名计算方式
    if self.RankData.score >= tonumber(SteamLocalData.tab[107014][2]) then
        self.Title_DisNextLv().gameObject:SetActive(false)
        self.Text_DisNextLv().gameObject:SetActive(false)
        self.Title_Bili().gameObject:SetActive(true)
        self.Text_Bili().gameObject:SetActive(true)
        self.Text_Bili().text = string.format(MgrLanguageData.GetLanguageByKey("newpvp_ui6_percent"), tostring(self.RankData.RankLevelPercent / 100)) .. "%";
    else
        self.Title_DisNextLv().gameObject:SetActive(true)
        self.Text_DisNextLv().gameObject:SetActive(true)
        self.Title_Bili().gameObject:SetActive(false)
        self.Text_Bili().gameObject:SetActive(false)
    end
    local curRankLv = #tab + 1 - self.RankData.RankLevel
    MgrRes.LoadSprite(self.CurRankIcon(),"Level/"..tab[curRankLv][3])
    MgrRes.LoadSprite(self.Img_RankIcon(),"Level/"..tab[curRankLv][17],nil,true)

    ---计算下个等级分差
    if self.RankData.score >= tonumber(SteamLocalData.tab[107014][2]) then
        self.Text_DisNextLv().gameObject:SetActive(false)
    else
        self.Text_DisNextLv().gameObject:SetActive(true)
        local nextIndex = #tab - self.RankData.RankLevel
        local data = tab[nextIndex]
        self.Text_DisNextLv().text =string.format(MgrLanguageData.GetLanguageByKey("newpvp_ui3_core"),tonumber(data[4]) - self.RankData.score)
    end
end

function M:UpdataFightCount()
    self.Text_HignCouponsCount().text = PVPViewModel.HighCard.."/"..SteamLocalData.tab[107001][2]
    self:InitClock()
end

function M:CheckTime()
    local tiLi = tonumber(SteamLocalData.tab[107001][2]) - PVPViewModel.HighCard     --要恢复的体力
    if tiLi <= 0 then
        return 0, 0, 0
    end
    -- local time = PlayerControl.GetPlayerData().vigor.vigorTime + tiLi * 300
    local ts = tiLi * tonumber(SteamLocalData.tab[107000][2]) * 60--300
    local seconds = ts % 60
    local min = math.modf(ts % 3600 / 60)
    local hour = math.floor(ts / 3600)
    return hour, min, seconds
end

function M:InitClock()
    MgrTimer.Cancel("PVPTiLiClock")
    local DiffTime

    --PVPViewModel.HighCard.."/"..SteamLocalData.tab[107001][2]
    if PVPViewModel.HighCard < tonumber(SteamLocalData.tab[107001][2]) then
        --local OldTime = tonumber(UnityEngine.PlayerPrefs.GetString("TiLiClock"))
        local NewTime = Global.GetCurTime()     ---当前服务器时间
        print("服务器时间戳+++++++++++++++", NewTime)
        DiffTime = NewTime - PVPViewModel.HighCardTime--PlayerControl.GetPlayerData().vigor.vigorTime
    end
    ---时钟
    self.curTime = tonumber(SteamLocalData.tab[107000][2]) * 60
    local tarHour, tarMin, tarSec = self:CheckTime()
    local min = self.curTime / 60 - 1   --4
    local sec = 60
    if DiffTime and DiffTime > 0 then
        print("时间差+++++++++++++++", DiffTime)
        local s = DiffTime % 60
        local m = math.floor(DiffTime % 3600 / 60)
        min = min - m
        sec = sec - s
        tarSec = 60 - s
        tarMin = tarMin - m - 1
    end
    MgrTimer.AddRepeat("PVPTiLiClock", 1, Handle(self, function()
        if PVPViewModel.HighCard >= tonumber(SteamLocalData.tab[107001][2]) then
            self.Text_TargetTimePvp().text = "00:00:00"
            self.Text_PowerClockPvp().text = "00:00:00"
            return
        end
        if sec == 0 then
            min = min - 1
            sec = 60
        end
        if min < 0 then
            PVPViewModel.HighCard = PVPViewModel.HighCard + 1
            PVPViewModel.HighCardTime = PVPViewModel.HighCardTime + tonumber(SteamLocalData.tab[107000][2]) * 60
            self.TiliMax = tonumber(SteamLocalData.tab[107001][2])--PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
            self.curTili = PVPViewModel.HighCard--PlayerControl.GetPlayerData().vigor.vigorNum
            --self.Text_PowerCount().text = self.curTili.."/" .. self.TiliMax
            --self:RefreshCoinCount()
            self.Text_HignCouponsCount().text = PVPViewModel.HighCard.."/"..SteamLocalData.tab[107001][2]
            min = self.curTime / 60 - 1
        end
        if tarSec == 0 then
            if tarMin > 0 then
                tarMin = tarMin - 1
            else
                tarMin = 0
            end
            tarSec = 60
        end
        if tarMin < 0 then
            tarHour = tarHour - 1
            if tarHour >= 0 then
                tarMin = 60 + tarMin
            else
                tarHour = 0
                tarMin = 0
                tarSec = 0
            end
        end

        sec = sec - 1
        tarSec = tarSec - 1
        self.Text_PowerClockPvp().text = string.format("%02d:%02d:%02d", 0, min, sec)
        self.Text_TargetTimePvp().text = string.format("%02d:%02d:%02d", tarHour, tarMin, tarSec)
    end), -1, nil)
end


---初始化按钮
function M:InitButton()
    ---移除左侧场上所有角色
    UIEvent.LuaClick(self.Btn_Remove().gameObject,Handle(self,function ()
        self.SwitchPanel().gameObject:SetActive(true)
        self:ReMoveAllLeft()
        self.isChange = true
        ---关闭人物信息
        self:ShowRoleInfo()
    end))
    ---购买演习次数
    UIEvent.LuaClick(self.Btn_HignBuyArea().gameObject,Handle(self, function()
        MgrUI.Pop(UID.PVPTimeNumPop,Handle(self,self.UpdataFightCount),true)
    end))

    local isTouch = false
    ---展示体力恢复界面
    UIEvent.LuaPressClick(self.ShowTime().gameObject,Handle(self, function()
        if isTouch then
            return
        end
        isTouch = true
        self.HignDetail().gameObject:SetActive(true)
        MgrTimer.AddRepeat("PVPTiliClick", 0, function()
            if UIEvent.GetButton_Up() == true then
                MgrTimer.Cancel("PVPTiliClick")
                self.HignDetail().gameObject:SetActive(false)
                isTouch = false
            end
        end, -1, nil)
    end))
    ---开始演习
    UIEvent.LuaClick(self.Btn_StartExercise().gameObject,Handle(self, function()
        if not self:CheckFightTeam() then
            return
        end

        MgrTimer.Cancel("PVPTiLiClock")
        if PVPViewModel.isSettle then  --正在结算
            ---隐藏透明地板
            CJNBattleMgr.Instance:SetFloorShowImg(false)
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_rankcensus"),2},true)
            return
        end
        PVPViewModel.PvPBattleData(PVPViewModel.type,Handle(self,self.PvPBattleACK),Handle(self,self.PvPBattleNTF))
    end))
    ---连续战斗
    UIEvent.LuaClick(self.Btn_Sweep().gameObject,Handle(self,function()
        local startTime,endTime = ActivationTaskViewModel.GetSeasonTime(true)
        if PVPViewModel.startTime ~= 0 and PVPViewModel.endTime ~= 0 then
            startTime = PVPViewModel.startTime
            endTime = PVPViewModel.endTime
        end
        local curTime = Global.GetCurTime()
        if curTime >= startTime and curTime <= endTime then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_rankcensus"),1},true)
            ---关闭代理作战
            self:OnOffCalculatePVPTime(false)
            return
        end
        if self.RankData.score < tonumber(SteamLocalData.tab[107011][2]) then
            local rankData = PVPViewModel.GetPvPRank(10)
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text3"),rankData[2]),1},true)
            return
        end
        if not self:CheckFightTeam() then
            return
        end
        if not PVPViewModel.existBattleRecord then    ---如果没有未结算的PVP战斗，扫荡     不然先去结算上一场PVP
            ---连续战斗(旧)
            --MgrUI.Pop(UID.SweepPopPvp_UI,{self.PvPBattleACK,self.PvPBattleNTF,self},true)
            ---代理作战
            if PVPViewModel.bCount == 0 then
                ---弹出一个设置挂机次数的界面
                MgrUI.Pop(UID.SweepPopPvp_UI,{nil,nil,self },true)
            else
                ---如果已经设置PVP挂机,则消耗可用的PVP挂机次数，并取消挂机
                MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_quickbattle_text13"),function()
                    self:ExpendPVPBCount()  ---开始PVP扫荡
                end,nil,2})
            end
        else
            self:GetUnReceivedReward()
        end
    end))

    UIEvent.LuaClick(self.Btn_Dailiwancheng().gameObject,Handle(self,function()
        if not PVPViewModel.existBattleRecord then
            self:ExpendPVPBCount()  ---如果已经设置PVP挂机,则消耗可用的PVP挂机次数，并取消挂机
        else
            self:GetUnReceivedReward()
        end
    end))

    ---返回界面
    UIEvent.LuaClick(self.Btn_Return().gameObject,Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        PVPViewModel.Close()
        MgrTimer.Cancel("PVPTiLiClock")
    end))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(87)
    end))
    ---奖励预览
    UIEvent.LuaClick(self.Btn_RewardPreview().gameObject,Handle(self, function()
        MgrUI.Pop(UID.PVPRewardPreview,{PVPViewModel.type,self.Rank},true)
    end))
    ---top排名
    UIEvent.LuaClick(self.Btn_TopRank().gameObject,Handle(self, function()
        MgrUI.Pop(UID.PVPRankPop,nil,true)
    end))
    UIEvent.LuaClick(self.Btn_Legend().gameObject,Handle(self, self.OnBtnLegendClicked))
    ---演习商店
    UIEvent.LuaClick(self.Btn_ExerciseShop().gameObject,Handle(self, function()
        ---跳转到对应界面
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        local tLinkMark = {"tz","sc","114003","300"}
        MgrLink.LinkStart(tLinkMark)
    end))

    self.Btn_SwitchRank().gameObject:SetActive(false)
    -----切换初级高级演习
    --UIEvent.LuaClick(self.Btn_SwitchRank().gameObject,Handle(self, function()
    --    PVPViewModel.isFirstSend = false
    --    if PVPViewModel.type == 0 then
    --        PVPViewModel.type = 1
    --    elseif PVPViewModel.type == 1 then
    --        PVPViewModel.type = 0
    --    end
    --    PVPViewModel.GetPvPData(PVPViewModel.type)
    --end))
    ---阵型设定
    UIEvent.LuaClick(self.Btn_SetFormation().gameObject,Handle(self, function()
        if PVPViewModel.bCount ~= 0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_tongyong_text231"), 1}, true)
            return
        end
        self.PVPAttackOrDefend = true
        Global.MoveToUnder(self.Jingong().gameObject,self.Frame().gameObject)
        ---显示透明地板
        CJNBattleMgr.Instance:SetFloorShowImg(true)
        self:SwitchFormation(1)
        ---默认当前排序模式
        self.LineUpOrOrder = 1
        self.SelectRoleStop = false
        self.ScrollMask().gameObject:SetActive(false)
        self:ReloadSelectRole()
    end))
    UIEvent.LuaClick(self.Btn_Master().gameObject, Handle(self, self.OnBtnMasterClicked))
    ---返回PVP
    UIEvent.LuaClick(self.Btn_ReturnPvp().gameObject,Handle(self, function()
        self:SetReturnPVP()
    end))
    ---打开排序窗口
    UIEvent.LuaClick(self.Btn_OpenFilter().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.SortFilterPop_UI,{function(filter,sort,rise)
            ---获取排序规则

            ---如果5个filter都为false，则默认第一个为true
            local allFalse = true
            for _, v in pairs(filter) do
                if v == true then
                    allFalse = false
                end
            end
            if allFalse then
                filter[0] = true
            end
            self.CurCardFilter = filter
            self.CurCardSort = sort
            self.CurCardRise = rise
            ---刷新UI
            self:ReloadSelectRole(0)
        end,2},true)
    end))
--[[    ---注册顺序初始化按钮
    UIEvent.LuaClick(self.Btn_Restore().gameObject,function()
        ---将顺序显示为"？"
        for i, role in pairs(BattleManager.AllRole) do
            if role.IsLeft == true then
                role.myAni:SetOrder(-1, role.IsLeft, true)
            end
        end
        ---开启问号排序模式
        self.CurMode = 2
        ---重置队列索引
        self.CurAtkOrderIndex = 1
        ---重置已排序队列
        self.FinishOrder = {}
        ---拉近摄像机位置
      --  self:MoveCamera(4,0)
    end)]]
    ---保存战斗阵型
    UIEvent.LuaClick(self.Btn_Save().gameObject,Handle(self,self.SaveFightTeam))
    ---恢复战斗阵型
    UIEvent.LuaClick(self.Btn_Recovery().gameObject,function()
        if PVPViewModel.type == 0 then
            self:LoadTeamRole(10000)
        elseif PVPViewModel.type == 1 then
            if self.PVPAttackOrDefend then
                self:LoadTeamRole(10001)
            else
                self:LoadTeamRole(10002)
            end
        end
    end)
    ---注册隐藏角色信息面板
    UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
        self:CloseSkillXiangqing()
        self.SwitchPanel().gameObject:SetActive(true)
        self:ShowRoleInfo()
    end)
    ---查看角色信息
    UIEvent.LuaClick(self.Btn_Chakan01().gameObject,function()
        local role = PVPViewModel.GetHeroEx(self.CurRoleInfo);
        MgrUI.Pop(UID.RoleInfoPausePop_UI,{false,role,self.CurRoleInfo,0})
    end)

    ---切换进攻和防守
    UIEvent.LuaClick(self.Jingong().gameObject,function()
        if self.isChange then
            if not self.PVPAttackOrDefend then
                CJNBattleMgr.Instance:RaygetIdOff(true)
                MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips3"),function()
                    self:SaveFightTeamImp(function()
                        self.PVPAttackOrDefend = true
                        if PVPViewModel.type == 0 then
                            self:LoadTeamRole(10000)
                        elseif PVPViewModel.type == 1 then
                            self:LoadTeamRole(10001)
                        end
                        Global.MoveToUnder(self.Jingong().gameObject,self.Frame().gameObject)
                        CJNBattleMgr.Instance:RaygetIdOff(false)
                    end)
                end,nil,2,function()
                    self.PVPAttackOrDefend = false
                    self:LoadTeamRole(10002)
                    Global.MoveToUnder(self.Fangshou().gameObject,self.Frame().gameObject)
                    self.isChange = false
                    CJNBattleMgr.Instance:RaygetIdOff(false)
                end},true)
            end
        else
            if not self.PVPAttackOrDefend then
                self.PVPAttackOrDefend = true
                if PVPViewModel.type == 0 then
                    self:LoadTeamRole(10000)
                elseif PVPViewModel.type == 1 then
                    self:LoadTeamRole(10001)
                end
                Global.MoveToUnder(self.Jingong().gameObject,self.Frame().gameObject)
            end
        end
    end)
    UIEvent.LuaClick(self.Fangshou().gameObject,function()
        if self.isChange then
            if self.PVPAttackOrDefend then  ---当前为进攻阵型
                CJNBattleMgr.Instance:RaygetIdOff(true)
                MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips3"),function()
                    self:SaveFightTeamImp(function()
                        self.PVPAttackOrDefend = false
                        self:LoadTeamRole(10002)
                        Global.MoveToUnder(self.Fangshou().gameObject,self.Frame().gameObject)
                        CJNBattleMgr.Instance:RaygetIdOff(false)
                    end)
                end,nil,2,function()
                    self.PVPAttackOrDefend = true
                    if PVPViewModel.type == 0 then
                        self:LoadTeamRole(10000)
                    elseif PVPViewModel.type == 1 then
                        self:LoadTeamRole(10001)
                    end
                    Global.MoveToUnder(self.Jingong().gameObject,self.Frame().gameObject)
                    self.isChange = false
                    CJNBattleMgr.Instance:RaygetIdOff(false)
                end},true)
            end
        else
            if self.PVPAttackOrDefend then
                self.PVPAttackOrDefend = false
                self:LoadTeamRole(10002)
                Global.MoveToUnder(self.Fangshou().gameObject,self.Frame().gameObject)
            end
        end
    end)
    ---记录切换
    local togObj =
    {
        [1] = self.Btn_AtkRecord(),
        [2] = self.Btn_DefRecord()
    }
    for i, v in pairs(togObj) do
        local Btn_Selected = v.transform:Find("Btn_Selected").gameObject
        Tools.ToggleValueChange(v,function(isOn)
            Btn_Selected:SetActive(isOn)
            if isOn then
                self:SwitchRecord(i)
            end
        end,nil)
    end
    if self.RecordType  == 1 then
        self.Btn_DefRecord().isOn = true
        self.Btn_AtkRecord().isOn = true
    elseif self.RecordType  == 2 then
        self.Btn_AtkRecord().isOn = true
        self.Btn_DefRecord().isOn = true
    end
end
function M:SetReturnPVP()
    if self.isChange == true then
        CJNBattleMgr.Instance:RaygetIdOff(true)
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips3"),Handle(self,self.SaveFightTeam),nil,2,Handle(self, function()
            if PVPViewModel.type == 0 then
                self:LoadTeamRole(10000)
            elseif PVPViewModel.type == 1 then
                if self.PVPAttackOrDefend then
                    self:LoadTeamRole(10001)
                else
                    self:LoadTeamRole(10002)
                end
            end
            CJNBattleMgr.Instance:SetAllEmptyFloorHid()
            CJNBattleMgr.Instance:RaygetIdOff(false)
        end)},true)
    else
        ---隐藏透明地板
        CJNBattleMgr.Instance:SetFloorShowImg(false)
        ---缩小顺序图标
        self.LineUpOrOrder = 1
        self:ReloadOrder(self.LineUpOrOrder == 2)
        self:SwitchFormation(0)
        self.SwitchPanel().gameObject:SetActive(true)
        ---返回时是否要回到进攻队列
        self:LoadTeamRole(10001,false)
    end
end
---结算未结算的PVP战斗
function M:GetUnReceivedReward()
    ---有未结算的战斗奖励
    BattleViewModel.GetPVPReward2(1, PVPViewModel.Show_Unliquidated_Result)
    ---刷新一下界面
    local BaseREQ  =
    {
        type = PVPViewModel.type,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHighLadderDataREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_DATA_REQ,bytes,0,nil,PVPViewModel.GetPvPACK,function(buffer,tag)
        PVPViewModel.CurRankData = assert(pb.decode('PBClient.ClientHighLadderDataNTF',buffer))
        self.RankData = PVPViewModel.CurRankData
        local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
        PVPViewModel.RoleLimit = rankData[18]
        ---没有剩余挂机次数
        self:UpdataPlayerInfo()
        if PVPViewModel.type == 0 then
            self:LoadTeamRole(10000)
        elseif PVPViewModel.type == 1 then
            self:LoadTeamRole(10001)
        end
        Event.Go("TeamChangeTip")
        self.Btn_AtkRecord().isOn = true
        self:SwitchRecord(1)
        --self:ResetItem(0)
    end)
end
---保存战斗阵型
function M:SaveFightTeam()
    self:SaveFightTeamImp(nil);
end
function M:SaveFightTeamImp(callback)
    ---@type FighterBase[] 创建服务器需要的阵型数据
    if next(BattleManager.AllRole) == nil then
        BattleManager.AllRole = self.beRemovedTeam
        if PVPViewModel.type == 0 then
            self:LoadTeamRole(10000)
        elseif PVPViewModel.type == 1 then
            if self.PVPAttackOrDefend then
                self:LoadTeamRole(10001)
            else
                self:LoadTeamRole(10002)
            end
        end
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips4"),2},true)
        return
    end
    local allSupport = true
    for i,v in pairs(BattleManager.AllRole) do
        if v.Occupation ~= 4 then
            allSupport = false
            break
        end
    end
    if allSupport then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips3"),1},true)
        return
    end
    -- 自己的阵容和助战要放进不同字段
    local fighters = {}
    local tryHeros = {};
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            if nil ~= role.tryHeroUID then
                table.insert(tryHeros, {
                    uid = role.tryHeroUID;
                    roleID = role.ID;
                    pos = (6-role.PosX)*3 + 1*role.PosY;
                    atkOrder = role.AtkOrder;
                });
            else
                ---@type FighterBase
                local fighter = {}
                ---设置位置
                --fighter.index = (role.PosY - 1) * 6 + role.PosX
                fighter.index = (6-role.PosX)*3 + 1*role.PosY
                ---设置id
                fighter.roleID = tonumber(role.ID)
                ---加入数据池
                fighters[role.AtkOrder] = fighter
            end
        end
    end
    -- 挤掉助战产生的空白
    local fighters_tmp = {}
    for k, v in pairs(fighters) do
        table.insert(fighters_tmp, v);
    end
    fighters = fighters_tmp;
    ---保存战斗阵型
    if PVPViewModel.type == 0 then
        ---拷贝阵容到选中阵型
        TeamControl.ChangeTeamInfoEx(10000, fighters, tryHeros);
        TeamControl.SendSaveTeamData({10000},true,Handle(self,function()
            self:ReloadOrder(self.LineUpOrOrder == 2)
            self.isChange = false
        end))
    elseif PVPViewModel.type == 1 then
        if self.PVPAttackOrDefend then
            TeamControl.ChangeTeamInfoEx(10001, fighters, tryHeros);
            TeamControl.SendSaveTeamData({10001},true,Handle(self,function()
                self:ReloadOrder(self.LineUpOrOrder == 2)
                self.isChange = false
                if nil ~= callback then
                    callback();
                end
            end))
        else
            TeamControl.ChangeTeamInfoEx(10002, fighters, tryHeros);
            TeamControl.SendSaveTeamData({10002},true,Handle(self,function()
                self:ReloadOrder(self.LineUpOrOrder == 2)
                self.isChange = false
                if nil ~= callback then
                    callback();
                end
            end))
        end
    end
    CJNBattleMgr.Instance:RaygetIdOff(false)
end
---更新Ui
function M:DataCallBack()
    self.RankData = PVPViewModel.CurRankData
    if PVPViewModel.type == 0 then
        self:LoadTeamRole(10000)
    elseif PVPViewModel.type == 1 then
        self:LoadTeamRole(10001)
    end
    self:UpdataPlayerInfo()
    self:ResetItem(0)
    if self.RecordType  == 1 then
        self.Btn_DefRecord().isOn = true
        self.Btn_AtkRecord().isOn = true
    elseif self.RecordType  == 2 then
        self.Btn_AtkRecord().isOn = true
        self.Btn_DefRecord().isOn = true
    end
end
---初始化左侧toggle
function M:InitLeftSwitch()
    -----初始化下方信息面板
    --local panel_BtmInfos = {
    --    [1] = self.Panel_Replace().gameObject,
    --    [2] = self.Panel_Sort().gameObject,
    --}
    -----初始化左侧选取栏
    --local tog_Selects = {
    --    [1] = self.Tog_Replace01(),
    --    [2] = self.Tog_Order01(),
    --}
    ---左侧选取栏高亮
    --local SelectType1 = {
    --    [1] = self.Tog_ChangeOver1().transform:Find("Normal").gameObject,
    --    [2] = self.Tog_ChangeOver1().transform:Find("HighLight").gameObject,
    --}
    --local SelectType2 = {
    --    [1] = self.Tog_ChangeOver2().transform:Find("Normal").gameObject,
    --    [2] = self.Tog_ChangeOver2().transform:Find("HighLight").gameObject,
    --}
    --Tools.ToggleValueChange(self.Tog_ChangeOver101(),function(isOn)
    --    SelectType1[1]:SetActive(not isOn)
    --    SelectType1[2]:SetActive(isOn)
    --    self.LineupBtns().gameObject:SetActive(isOn)
    --    self:ReloadOrder(not isOn)
    --    ---是阵型存取
    --    if isOn then
    --        ---在切换到调整顺序时，控制头像的遮挡
    --        self.SelectRoleStop = false
    --        ---还原摄像机位置
    --        self:MoveCamera(5,1)
    --        ---设置当前模式为选择角色
    --        self.CurMode = 1
    --        ---更新替换队员面板
    --        self:ReloadSelectRole()
    --    end
    --end,nil)

    --Tools.ToggleValueChange(self.Tog_ChangeOver201(),function(isOn)
    --    SelectType2[1]:SetActive(not isOn)
    --    SelectType2[2]:SetActive(isOn)
    --    ---在切换到调整顺序时,添加滑条遮罩
    --    if self.selectRoleLoop.totalCount == 0 then
    --        ---如果角色池空了 不显示滑条遮罩
    --        self.ScrollMask().gameObject:SetActive(false)
    --    else
    --        self.ScrollMask().gameObject:SetActive(isOn)
    --    end
    --    self.Btn_OpenFilter().gameObject:SetActive(not isOn)
    --    self:ReloadOrder(isOn)
    --    ---是阵型存取
    --    if isOn then
    --        ---在切换到调整顺序时，控制头像的遮挡
    --        self.SelectRoleStop = true
    --        ---还原摄像机位置
    --        self:MoveCamera(6,1)
    --        ---设置当前模式为拖拽排序
    --        self.CurMode = 3
    --        ---更新替换队员面板
    --        self:ReloadSelectRole()
    --    end
    --end,nil)

    self.LineUpOrOrder = 1
    self.SelectRoleStop = false
    self.ScrollMask().gameObject:SetActive(false)
    self.CurMode = 1
    UIEvent.LuaClick(self.Btn_Shunxu().gameObject,function()
        if self.LineUpOrOrder == 1 then
            self.LineUpOrOrder = 2
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

    ---注册查看敌我双方顺序按钮
    --UIEvent.LuaClick(self.Btn_Separate().gameObject,function()
    --    self:ReloadOrder(true)      --重载顺序
    --    ---开启交换排序模式
    --    self.CurMode = 3
    --    ---分别排序模式
    --    self.sortingType = 1
    --end)
    ---注册查看整体顺序按钮
    --UIEvent.LuaClick(self.Btn_Altogether().gameObject,function()
    --    ---查看整体顺序
    --    BattleManager.Rank()
    --    ---给每个角色根据左右位置加动画
    --    for i, role in pairs(BattleManager.AllRole) do
    --        role.myAni:SetOrder(role.AllAtkOrder,role.IsLeft, true)
    --    end
    --    ---开启交换排序模式
    --    self.CurMode = 3
    --    ---一起排序模式
    --    self.sortingType = 2
    --end)
    ---默认打开替换队员
    --self.Tog_ChangeOver201().isOn = true
    --self.Tog_ChangeOver201().isOn = false
    --self.Tog_ChangeOver101().isOn = false
    --self.Tog_ChangeOver101().isOn = true
    ---注册阵型显示按钮
    UIEvent.LuaClick(self.Btn_Rormation().gameObject,function()
        local m = self.CurMode
        self.CurMode = 0
        self.SwitchPanel().gameObject:SetActive(true)
        self:ShowRoleInfo()
        -- 排除掉助战并排序
        local myRoles = {};
        for i, role in pairs(BattleManager.AllRole) do
            if role.IsLeft == true and nil == role.tryHeroUID then
                table.insert(myRoles, role);
            end
        end
        table.sort(myRoles, function(a, b)
            return a.AtkOrder < b.AtkOrder;
        end);
        ---@type FighterBase[] 创建当前使用的阵型数据
        local fighters = {}
        for i, role in ipairs(myRoles) do
            ---@type FighterBase
            local fighter = {}
            ---设置位置
            fighter.index = (6-role.PosX)*3 + role.PosY
            ---设置id
            fighter.roleID = tonumber(role.ID)
            ---加入数据池
            table.insert(fighters, fighter);
        end
        MgrUI.Pop(UID.TeamGroupPop_UI,{fighters,function()
            ---返回回调
            self.CurMode = m
        end,function(idx)
            ---改变阵型回调
            self:LoadTeamRole(idx)
            self.isChange = true
            Event.Go("TeamChangeTip")
        end,true},true)
    end)
    
end
---切换记录
function M:SwitchRecord(type)
    self.RecordType = type
    --- 1为攻击记录， 2为防御记录
    if type == 1 then
        PVPViewModel.PlayerIsAtk = true
        self.Text_FightNum().text = "("..string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_win"),self.RankData.attack.winNum)..string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_lose"),self.RankData.attack.losNum)..")"
        if (self.RankData.attack.losNum + self.RankData.attack.winNum) == 0 then
            self.Text_WinPro().text = MgrLanguageData.GetLanguageByKey("pvpready_ui_norecord")
        else
            local value = self.RankData.attack.winNum/(self.RankData.attack.losNum + self.RankData.attack.winNum)
            self.Text_WinPro().text = math.ceil(value*100).."%"
        end
    elseif type == 2 then
        PVPViewModel.PlayerIsAtk = false
        self.Text_FightNum().text = "("..string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_win"),self.RankData.defense.winNum)..string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_lose"),self.RankData.defense.losNum)..")"
        if (self.RankData.defense.losNum + self.RankData.defense.winNum) == 0 then
            self.Text_WinPro().text = MgrLanguageData.GetLanguageByKey("pvpready_ui_norecord")
        else
            local value = self.RankData.defense.winNum/(self.RankData.defense.losNum + self.RankData.defense.winNum)
            self.Text_WinPro().text = math.ceil(value*100).."%"
        end
    end
    self:ResetItem(0)
    Tools.ReSize(self.WinPro().gameObject)
end
---切换阵型orPVP
function M:SwitchFormation(type)
    --self:MoveCamera(type)
    if type == 0 then
        MgrTimer.Cancel("BattleUIUpdate")
        self.PvpPanel().gameObject:SetActive(true)
        self.SetPanel().gameObject:SetActive(false)
        CJNBattleMgr.Instance:CameraMoveOpenAndClose(false) --不能再移动镜头
    elseif type == 1 then
        self.PvpPanel().gameObject:SetActive(false)
        self.SetPanel().gameObject:SetActive(true)
        self:ReloadSelectRole(0)
        self.Panel_RoleInfo:SetActive(false)
        --CJNBattleMgr.Instance:CameraMoveOpenAndClose(true) --可移动镜头
        ---设置屏幕点击状态1：按下 2：拖拽 3：抬起
        self.OnState = 1
        ---开启屏幕按键检测循环
        MgrTimer.AddRepeat("BattleUIUpdate",0, function ()
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
        end,-1,nil)
    end
    ---0.5f后更新地板
    MgrTimer.AddDelayNoName(0.1,function() CJNBattleMgr.Instance:SetAllFloorHid() end,nil)
end
---按下
function M:OnBeginDrag()
    ---发射射线抓取地板角色GameId， 0为空
    self.ShowRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
    print( self.ShowRoleId)
    ---设置选中的角色
    CJNUIMgr.SetUiTop(tonumber(self.ShowRoleId))
    ---按下位置存在角色则显示角色信息,否则隐藏角色信息
    if self.ShowRoleId ~= nil and self.ShowRoleId ~= 0 then
        ---显示
        for i, role in pairs(BattleManager.AllRole) do
            if role.GameID == self.ShowRoleId then
                self.CurRoleInfo = role
                self:ShowRoleInfo(role,true)
                self.SwitchPanel().gameObject:SetActive(false)
                break
            end
        end
    end

    if self.CurMode == 1 then
        ---设置角色模式
        ---显示透明地板
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
            PVPViewModel.AddHeroEx(self.dragRole);
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
    CMgrCamera.Instance:CloseStrokeCamera()
    if self.CurMode == 1 then
        ---设置角色模式
        if self.dragRole ~= nil and not Global.IsNil(self.dragRole.myAni) and self.dragRole.IsLeft then
            ---获取射线返回的地板信息:[0]id -1不能写入、为0则是空地板、其他数则为id，[1]地板x，[2]地板y
            local reuIntArr = CJNBattleMgr.Instance:RayGoInFloor(self.dragRole.myAni.gameObject,0,0,self.dragRole.GameID,self.dragRole.Occupation)
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
                ---刷新滑块UI
                self:ReloadSelectRole()
                self.isChange = true
            elseif reuIntArr[0] == 0
            then
                ---重新设置xy并更新位置
                self.dragRole.PosX = reuIntArr[1]
                self.dragRole.PosY = reuIntArr[2]
                ---更新地板数据
                BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                ---移除uiItem队列
                PVPViewModel.RemoveHeroEx(self.dragRole);
                self.isChange = true
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
                ---移除uiItem队列
                PVPViewModel.RemoveHeroEx(self.dragRole);
                self.isChange = true
            end
            ---结束显示攻击范围及羁绊
            CJNBattleMgr.Instance:EndLine()
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
            ---还原uiItem位置
            self.UIDragItem.transform.localPosition = Vector3(0,10000,0)
            -----刷新滑块UI
        end
    elseif self.CurMode == 2 then
        ---设置排序模式
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            self.isChange = true
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
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---是否抓取了角色
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            self.isChange = true
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
                        if role.GameID == floorRoleId then
                            targetRole = role
                        end
                    end
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
---赛季结束时间
function M:RefeshTime()
    ---如果当前正在结算中
    if PVPViewModel.isSettle and PVPViewModel.isSettle == true then
        self.Text_RankEndTime().text = MgrLanguageData.GetLanguageByKey("pvpready_ui_rankresult")
    else
        ---结算开始时间和结算结束时间
        local startTime,endTime = ActivationTaskViewModel.GetSeasonTime(true)
        if PVPViewModel.startTime ~= 0 and PVPViewModel.endTime ~= 0 then
            startTime = PVPViewModel.startTime
            endTime = PVPViewModel.endTime
        end
        local curTime = Global.GetCurTime()
        if curTime >= startTime and curTime <= endTime then
            self.Text_RankEndTime().text = MgrLanguageData.GetLanguageByKey("pvpready_ui_rankresult")
            ---关闭代理作战
            self:OnOffCalculatePVPTime(false)
        else
            local time = startTime - curTime
            ---剩余时间大于一天
            if time >= 86400 then
                local day = math.floor(time/86400)
                local hour = math.floor(time%86400/3600)
                self.Text_RankEndTime().text =string.format(MgrLanguageData.GetLanguageByKey("newpvp_ui1_hour"),day,hour)
            else
                local hour = math.floor(time / 3600)
                local min = math.floor((time % 3600) / 60)
                self.Text_RankEndTime().text =string.format(MgrLanguageData.GetLanguageByKey("newpvp_ui1_min"),hour,min)
            end
        end
    end
end
---加载阵型
function M:LoadTeamRole(teamIndex,saveTeam)
    ---解除左侧队列角色
    self:ReMoveAllLeft()
    ---获取阵型数据
    local tNeedSave = false
    local team = TeamControl.GetTeamData(teamIndex)
    ---如果队伍为空
    if #team.info + #team.tryHero == 0 and (teamIndex == 10000 or teamIndex == 10001 or teamIndex == 10002) then
        tNeedSave = true
        local teamStr = string.split(SteamLocalData.tab[104018][2],",")
        for i,v in pairs(teamStr) do
            team.info[i] = {index = i, roleID = tonumber(teamStr[i])}
        end
    end
    local newTeam = clone(team)
    ---判断人数是不是已经超出限制
    local count = #newTeam.info + #newTeam.tryHero;
    if count > PVPViewModel.RoleLimit then
        for i = #newTeam.tryHero, 1, -1 do
            table.remove(newTeam.tryHero, i)
            count = count - 1;
            if count <= PVPViewModel.RoleLimit then
                break;
            end
        end
        if count > PVPViewModel.RoleLimit then
            for i = #newTeam.info, 1, -1 do
                table.remove(newTeam.info, i)
                count = count - 1;
                if count <= PVPViewModel.RoleLimit then
                    break;
                end
            end
        end
        ---保存本地队伍数据
        Event.Add("TeamChangeTip",Handle(self,self.TeamChangeTip))
    else
        Event.Remove("TeamChangeTip",Handle(self,self.TeamChangeTip))
    end
    if saveTeam or tNeedSave then
        ---拷贝阵容到选中阵型
        TeamControl.ChangeTeamInfoEx(teamIndex, newTeam.info, newTeam.tryHero);
        TeamControl.SendSaveTeamData({teamIndex},false)
    end

    if newTeam == nil  then
        return
    end
    if newTeam.info == nil then
        return
    end
    self.ArmorType = teamIndex == 10002 and 1 or 0
    local sortedTeam = PVPViewModel.ReformTeam(newTeam);
    for i, fighter in ipairs(sortedTeam) do
        local role = self:GetOrCreatSpineRole(PVPViewModel.GetHeroEx(fighter),i ~= 1, 0.55)
        local tempNum = fighter.pos - 1
        role.PosX = (5 - math.floor(tempNum/3))+1
        role.PosY = (tempNum%3)+1
        ---给role赋值攻击顺序
        BattleManager.LeftSetOrder(role)
        ---还原role透明度
        role.myAni:SetAlpha(1)
        
        ---更新目标地板信息
        BattleManager.ChessboardLeft[role.PosY][role.PosX] = role
        role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
        ---添加到左侧队列
        BattleManager.LeftTeamAdd(role)
        ---飞行进场
        --role.myAni:UIFlayIn(0.55)
        ---从UI关卡英雄池中移除拖拽英雄数据
        PVPViewModel.RemoveHeroEx(role);
        if i == #sortedTeam then
            ---刷新滑块UI
            self:ReloadSelectRole()
            ---更新所有队列图标
            self:ReloadOrder(self.LineUpOrOrder == 2)
        end
    end
    ---隐藏所有地板
    CJNBattleMgr.Instance:SetAllFloorHid()
    ---更新提示
    self:UpdateTips(1)
end

function M:TeamChangeTip()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text119"),1},true)
    Event.Remove("TeamChangeTip",Handle(self,self.TeamChangeTip));
end

function M:ReMoveAllRight()
    local count = 0
    local newAllRole = {}
    self.beRemovedTeam = BattleManager.AllRole
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == false then
            ---将原阵列位置置为空
            role.myAni:XYSetPos3(role.PosX, role.PosY, 0, 0)
            ---将地板角色移除右侧队列
            BattleManager.RightTeamRemove(role)
            ---删除地板角色
            GameObject.Destroy(role.myAni.gameObject)
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
        ---重置右侧队列顺序
        BattleManager.RightAtkOrderCout = 1
    end
end
---移除左侧队列及角色
function M:ReMoveAllLeft()
    local count = 0
    local newAllRole = {}
    self.beRemovedTeam = BattleManager.AllRole
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
            PVPViewModel.AddHeroEx(role);
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
        ---隐藏所有地板
        CJNBattleMgr.Instance:SetAllFloorHid()
        ---刷新滑块UI
        self:ReloadSelectRole(0)
    end
    self.Text_Tips01().text = string.format(MgrLanguageData.GetLanguageByKey("novicebattle_ui_battlecharacter"),0,PVPViewModel.RoleLimit)
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
        self.Text_Tips01().text = string.format(MgrLanguageData.GetLanguageByKey("novicebattle_ui_battlecharacter"),count,PVPViewModel.RoleLimit)
    --elseif type == 2 then
    --    ---顺序提示
    --    self.Text_Tips().text = "请使用<color=#47FFE3>拖拽</color>来改变攻击顺序"
    --elseif type == 3 then
    --    ---阵型提示
    --    self.Text_Tips().text = "请选择要<color=#47FFE3>读取</color>的阵型"
    --elseif type == 4 then
    --    ---组合提示
    --    self.Text_Tips().text = "选择<color=#47FFE3>对应</color>的队员出战时可发动组合效果"
    --elseif type == 5 then
    --    ---助战提示
    --    self.Text_Tips().text = "可使<color=#47FFE3>一名</color>好友佣兵出战"
    end
end
---@param --roleData HeroData 创建Spine
---@param roleData RoleData 创建Spine
function M:GetOrCreatSpineRole(roleData, _NotInSound,_delay)
    ---设置核心类型(0进攻 1防守)
    BattleManager.SetCoreType(self.ArmorType)
    ---创建spine
    local battleRole = BattleManager.CreartRoleLeft(roleData.id, roleData.skin, roleData.level, roleData.star,roleData:GetHeroSkillLevel(), roleData.awaken,nil,nil,nil,roleData.favor,roleData:CheckHeroEquipIsMax(),roleData.heroFlag,roleData.heroCurSkill)
    battleRole:SyncTryHero(roleData);
    ---替换技能补丁
    local specialEquip = EquipControl.GetSingleSpecialEquip(roleData.id)
    if specialEquip then
        local skillIndex = specialEquip:GetAdvanceSkillNum()
        local advanceSkillStr = specialEquip:GetSpecialSkill()
        for _,str in pairs(advanceSkillStr) do
            ReadData.ReplaceSkill(str,battleRole,skillIndex)
        end
    end
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
    ---创建角色特效
    BattleRole.CreatEffFollowAni(battleRole,_NotInSound,_delay)
    BattleRole.SetFlyIn(battleRole,_delay)
    return battleRole
end
---显示/隐藏角色详细信息
function M:ShowRoleInfo(role,isRatio)
    self.CurRoleInfo = role
    ---若未抓取角色或在战斗中并关闭了UI则不显示
    if role == nil or BattleManager.IsFightStart then
        self.CurRoleInfo = nil
        self.Panel_RoleInfo:SetActive(false)
        self.Panel_Ready().gameObject:SetActive(true)
        CJNBattleMgr.Instance:RaygetIdOff(false)
    else
        self.Panel_RoleInfo:SetActive(true)
        CJNBattleMgr.Instance:CameraMoveOpenAndClose(false)
        ---获取角色数据
        local roleData = role
        if self.CurRoleInfo.myAni ~= nil and self.CurRoleInfo.myAni.IsWorldBoss then
            roleData = EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData
        else
        end
        ---更新头像
        MgrRes.LoadQIcon(self.Icon_RIHead(),role.SkinID)
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
        if nil == role.tryHeroUID and role.ShowSkillLV > role.SkillLV and role.ShowSkillLV ~= 0 then
            self.Text_RIRank().text = (role.ShowSkillLV)
            self.Text_RIRank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_RIRank().text = (role.SkillLV)
            self.Text_RIRank().color = Color(1,1,1,1)
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
        --self.ChildSkillList = SkillDetailControl.SkillDetailList[tonumber(role.ID)]
        --self.ChildSkillList = SkillDetailControl.GetSkillListByID(tonumber(role.ID))
        --self.CurRole = role
        --self.SkillPanel():SetLuaCellEvent(Handle(self,self.CellSkillPrefab))
        --self.SkillPanel().totalCount = #self.ChildSkillList
        --self.SkillPanel():RefillCells(0)
    end
end
---替换SkillPrefab滑块通知
function M:CellSkillPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.ChildSkillList[idx],self,self.CurRole,"Battle"})
end
---@param skillPdata SkillDetailData
function M:ShowSkillXiangqing(skillPdata,ObjRoot)
    --self.Panel_Select().gameObject:SetActive(false)
    self.Panel_Ready().gameObject:SetActive(false)
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
    self.sonSkillsTable = Global.CopyTable(tSkillExample)

    self.SkillPrefab_xz().transform.position = ObjRoot.transform.position
    self.EX().gameObject:SetActive(skillPdata.SkillNum == 5)
    self.Text_Jinengming().text = skillPdata.GroupName[tMarkLv]
    self.Text_Jinengshuoming().text = skillPdata.Tips[tMarkLv]
    self.SkillZhankaiScroll01():SetLuaCellEvent(Handle(self,self.CellZijinengPrefab))
    self.SkillZhankaiScroll01().totalCount = 4
    --self.SkillZhankaiScroll01().totalCount = #self.sonSkillsTable
    self.SkillZhankaiScroll01():RefillCells(0,true)
end
---替换ZijinengPrefab滑块通知
function M:CellZijinengPrefab(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.sonSkillsTable[idx],"Battle"})
end
function M:CloseSkillXiangqing()
    self.Panel_Ready().gameObject:SetActive(true)
    CJNBattleMgr.Instance:RaygetIdOff(false)
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
---天梯匹配返回
function M:PvPBattleACK(buffer, tag)
    --local tab = assert(pb.decode('PBClient.ClientHighLadderBattleACK',buffer))
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleExACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        if tab.errNo == ServerErrorCode.HighLadderBattleEx_11519 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips5"),2},true)
        elseif tab.errNo == ServerErrorCode.HighLadderBattleEx_11501 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_rankcensus"),2},true)
            ---连续作战结束
            PVPViewModel.continue = false
            PVPViewModel.continueCount = 0
            return
        elseif tab.errNo == ServerErrorCode.HighLadderBattleEx_11631 then
            ---有未结算的战斗奖励
            BattleViewModel.GetPVPReward2(1, PVPViewModel.Show_Unliquidated_Result)
            ---刷新一下界面
            local BaseREQ  =
            {
                type = PVPViewModel.type,
            }
            ---序列化
            local bytes = assert(pb.encode('PBClient.ClientHighLadderDataREQ',BaseREQ))
            ---发送数据
            MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_DATA_REQ,bytes,0,nil,PVPViewModel.GetPvPACK,function(buffer,tag)
                PVPViewModel.CurRankData = assert(pb.decode('PBClient.ClientHighLadderDataNTF',buffer))
                self.RankData = PVPViewModel.CurRankData
                local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
                PVPViewModel.RoleLimit = rankData[18]
                ---没有剩余挂机次数
                self:UpdataPlayerInfo()
                if PVPViewModel.type == 0 then
                    self:LoadTeamRole(10000)
                elseif PVPViewModel.type == 1 then
                    self:LoadTeamRole(10001)
                end
                Event.Go("TeamChangeTip")
                self.Btn_AtkRecord().isOn = true
                self:SwitchRecord(1)
                --self:ResetItem(0)
            end)
        else
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 2 }, true)
        end
    end
end
function M:PvPBattleNTF(buffer, tag)
    PVPViewModel.continueCount = PVPViewModel.continueCount - 1     --持续战斗次数减一
    --local tab = assert(pb.decode('PBClient.ClientHighLadderBattleNTF',buffer))
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleExNTF',buffer))
    ---获取本场PVP的数据
    PVPViewModel.PlayerIsAtk = true
    PVPViewModel.TargetTeam = PVPViewModel.GetPvPRole(tab.team,tab.dSkin)
    PVPViewModel.OwnTeam =PVPViewModel.GetPvPRole(tab.selfTeam,tab.aSkin)
    PVPViewModel.TargetTeamSkin = tab.dSkin
    PVPViewModel.OwnTeamSkin = tab.aSkin
    PVPViewModel.CurToken = tab.token
    PVPViewModel.TargetInfo.name = tab.name
    PVPViewModel.TargetInfo.score = tab.score
    PVPViewModel.TargetInfo.rank = tab.rank
    PVPViewModel.TargetInfo.rankLevel = tab.RankLevel
    PVPViewModel.OwnInfo.name = tab.selfName
    PVPViewModel.OwnInfo.score = tab.selfScore
    PVPViewModel.OwnInfo.rank = tab.selfRank
    PVPViewModel.OwnInfo.rankLevel = tab.selfRankLevel

    BattleManager.GameMode = BattleManager.GameModeType.PVP
    --设置技能等级右侧角色数据
    PVPViewModel.PVPRightRoleData = {}
    PVPViewModel.PVPRightRoleData = tab.team--366

    BattleManager.ClearLuaData()

    ---整理PVP队伍
    for i = 1, #PVPViewModel.OwnTeam do
        table.insert(PVPViewModel.AllRole,i,PVPViewModel.OwnTeam[i])
    end
    for i = 1 + #PVPViewModel.OwnTeam, #PVPViewModel.TargetTeam + #PVPViewModel.OwnTeam do
        table.insert(PVPViewModel.AllRole,i,PVPViewModel.TargetTeam[i - #PVPViewModel.OwnTeam])
    end

    ---video整理进FightVideo
    BattleViewModel.GeneVideo(tab.video)

    ---结果
    BattleViewModel.isLeftWin = tab.result ~= 1 and true or false
    ---记录结果
    PVPViewModel.resultData = {
        goods = tab.goods,
        aScore = tab.aScore,
        aRank = tab.aRank,
        dScore = tab.dScore,
        dRank = tab.dRank,
        day = tab.day,
        week = tab.week,
        month = tab.month,
        glory = tab.glory,
    }

    ---打开玩家立绘
    MgrTimer.AddDelayNoName(0,function()
        BattleManager.GameMode = BattleManager.GameModeType.PVP
        PVPViewModel.OpenBattleUI()
    end,nil)
end
---检查战斗队员
function M:CheckFightTeam()
    local isOnlyAux = false
    local roleCount = 0
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
        return false
    end
    if not isOnlyAux then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips3"),1},true)
        return false
    end
    
    return true
end
---消耗PVP连续战斗次数
function M:ExpendPVPBCount()
    ---使用掉PVP挂机次数
    if Global.GetCurTime() - PVPViewModel.bTime - PVPViewModel.Continue_PVP_Separate > 0 then
        local rstTim =  Global.GetCurTime() - PVPViewModel.bTime - PVPViewModel.Continue_PVP_Separate
        self.StartGettingFastPVPReward = true
        self.sendNextReq = true
        ---发送一条 ClientHighLadderBattleExREQ
        local req =
        {
            type = PVPViewModel.type,
            isBack = 1,
        }
        local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleExREQ',req))
        ---发送数据
        UnityEngine.DebugEx.LogError("Yzb .. 发送一条代理作战")
        MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_BATTLE_EX_REQ,bytes,0,nil,Handle(self,self.ExpendPVPBCountACK), Handle(self,self.ExpendPVPBCountNTF))
    else
        ---结束挂机
        PVPViewModel.ContinuePVP(0,Handle(self,function()
            self:CalculatePVPTime()
            self:UpdataFightCount()
        end))
        Event.Go("CompleteSweep")
        self:PVPSweepEnd()
    end
end

function M:PVPSweepEnd()
    ---如果进行过连续战斗
    if self.Do_Continue_PVP then
        self.Do_Continue_PVP = false
        ---重新获取数据
        local BaseREQ  =
        {
            type = PVPViewModel.type,
        }
        ---序列化
        local bytes = assert(pb.encode('PBClient.ClientHighLadderDataREQ',BaseREQ))
        ---发送数据
        MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_DATA_REQ,bytes,0,nil,PVPViewModel.GetPvPACK,function(buffer,tag)
            PVPViewModel.CurRankData = assert(pb.decode('PBClient.ClientHighLadderDataNTF',buffer))
            PVPViewModel.HighCard = PVPViewModel.CurRankData.card
            if PVPViewModel.CurRankData.bCount ~= 0 then
                PVPViewModel.bCount = PVPViewModel.CurRankData.bCount
            else
                PVPViewModel.bCount = 0
            end
            if PVPViewModel.CurRankData.bTime ~= 0 then
                PVPViewModel.bTime = PVPViewModel.CurRankData.bTime
            else
                PVPViewModel.bTime = 0
            end
            --是否还有未结算的PVP胜场
            if PVPViewModel.CurRankData.existBattleRecord == 1 then
                PVPViewModel.existBattleRecord = true
            else
                PVPViewModel.existBattleRecord = false
            end
            if PVPViewModel.CurRankData.RankLevel ~= nil then
                PVPViewModel.RankLevel = PVPViewModel.CurRankData.RankLevel
            end
            self.RankData = PVPViewModel.CurRankData
            ---扫荡按钮锁
            self.SweepSuo().gameObject:SetActive(PVPViewModel.CurRankData.score < tonumber(SteamLocalData.tab[107011][2]))
            PVPViewModel.PVPNewScore = PVPViewModel.CurRankData.score
            PVPViewModel.PVPNewRank = PVPViewModel.CurRankData.rank
            PVPViewModel.RankLevel = PVPViewModel.CurRankData.RankLevel
            local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
            PVPViewModel.RoleLimit = rankData[18]
            Event.Go("PlayerRankUpPop")
            self:CalculatePVPTime()
            self:UpdataFightCount()
            Event.Go("CompleteSweep")
            ---没有剩余挂机次数
            self:UpdataPlayerInfo()
            if PVPViewModel.type == 0 then
                self:LoadTeamRole(10000)
            elseif PVPViewModel.type == 1 then
                self:LoadTeamRole(10001)
            end
            Event.Go("TeamChangeTip")
            self.Btn_AtkRecord().isOn = true
            self:SwitchRecord(1)
            self.Lock().gameObject:SetActive(false)
        end)
    else
        PVPViewModel.ContinuePVP(0,Handle(self,function()
            self:CalculatePVPTime()
            self:UpdataFightCount()
            self.Lock().gameObject:SetActive(false)
            self.SweepSuo().gameObject:SetActive(self.RankData.score < tonumber(SteamLocalData.tab[107011][2]))
        end))
        ---如果没有任何结算
        MgrUI.Pop(UID.PopTip,{MgrLanguageData.GetLanguageByKey("ui_quickbattle_text11")},true)
    end
end

function M:ExpendPVPBCountACK(buffer,tag)
    self.StartGettingFastPVPReward = false
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleExACK',buffer))
    if tab.errNo ~= 0 then
        self.sendNextReq = false
        if tab.errNo == ServerErrorCode.HighLadderBattleEx_11511 then
            UnityEngine.DebugEx.LogError("Yzb .. PVP连续战斗错误" .. tab.errNo)
            self:PVPSweepEnd()
        elseif tab.errNo == ServerErrorCode.HighLadderBattleEx_11631 then
            UnityEngine.DebugEx.LogError("Yzb .. PVP连续战斗错误" .. tab.errNo)
            BattleViewModel.GetPVPReward(BattleViewModel.giveUp.DONE, Handle(self,function()
                ---更新物品奖励
                ItemControl.PushGroupItemData(PVPViewModel.resultData.goods,ItemControl.PushEnum.add)
                ---记录统计
                TaskControl.ChangeStatistics(PVPViewModel.resultData.day,PVPViewModel.resultData.week,PVPViewModel.resultData.month,PVPViewModel.resultData.glory)
                ---将连续战斗结果计入统计结果
                table.insert(PVPViewModel.Continue_PVP_Result,{clone(PVPViewModel.resultData.goods),true})
                ---显示到SweepCompletePop界面
                Event.Go("FreshPVPSweepResult",PVPViewModel.Continue_PVP_Result)
                self:ExpendPVPBCount()  ---Ack错误631结算
            end))
        else
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
            PVPViewModel.ContinuePVP(0,Handle(self,function()
                self:CalculatePVPTime()
                self:UpdataFightCount()
            end))
        end
    end
end

function M:ExpendPVPBCountNTF(buffer,tag)
    UnityEngine.DebugEx.LogError("Yzb .. 收到一条代理作战NTF")
    self.StartGettingFastPVPReward = false
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleExNTF',buffer))
    PVPViewModel.resultData_continue = {
        name = tab.name,
        score = tab.score,
        rank = tab.rank,
        selfName = tab.selfName,
        selfScore = tab.selfScore,
        selfRank = tab.selfRank,
        token = tab.token,
        goods = tab.goods,
        result = tab.result,
        aScore = tab.aScore,
        aRank = tab.aRank,
        dScore = tab.dScore,
        dRank = tab.dRank,
        day = tab.day,
        week = tab.week,
        month = tab.month,
        glory = tab.glory,
    }
    table.insert(PVPViewModel.ResultData_Continue_Gather,PVPViewModel.resultData_continue)
    ---更新物品奖励
    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    ---记录统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)

    if not self.Do_Continue_PVP then
        MgrUI.Pop(UID.SweepCompletePop_UI,{"Sweeping",nil,nil,self,"PVP"},true)
    end
    self.Do_Continue_PVP = true

    PVPViewModel.bCount = tab.bCount   ---改成从服务器获取
    PVPViewModel.bTime = PVPViewModel.bTime + PVPViewModel.Continue_PVP_Separate
    MgrTimer.AddDelay("NextPVPBattle",0.2,function()
        if self.sendNextReq then
            if PVPViewModel.resultData_continue.result == 2 then    ---胜利，请求结算结果
                BattleViewModel.GetPVPReward(BattleViewModel.giveUp.DONE, Handle(self,function()
                ---更新物品奖励
                ItemControl.PushGroupItemData(PVPViewModel.resultData.goods,ItemControl.PushEnum.add)
                ---记录统计
                TaskControl.ChangeStatistics(PVPViewModel.resultData.day,PVPViewModel.resultData.week,PVPViewModel.resultData.month,PVPViewModel.resultData.glory)
                ---将连续战斗结果计入统计结果
                table.insert(PVPViewModel.Continue_PVP_Result,{clone(PVPViewModel.resultData.goods),true})
                ---显示到SweepCompletePop界面
                Event.Go("FreshPVPSweepResult",PVPViewModel.Continue_PVP_Result)
                Event.Go("LeftAtk")
                MgrSound.PlayEffect("yx_xh_2",1,0,false,0,0)
                UnityEngine.DebugEx.LogError("Yzb .. 发下一条PVP结果请求")
                self:ExpendPVPBCount()  ---上一场结束，继续请求下一场(胜利)
            end))
            else    ---失败，结果已经发送
                ---将连续战斗结果计入统计结果
                table.insert(PVPViewModel.Continue_PVP_Result,{clone(PVPViewModel.resultData_continue.goods),false})
                ---显示到SweepCompletePop界面
                Event.Go("FreshPVPSweepResult",PVPViewModel.Continue_PVP_Result)
                Event.Go("RightAtk")
                self:ExpendPVPBCount()  ---上一场结束，继续请求下一场(失败)
            end
        end
    end,nil)
end

function M:CalculatePVPTime()
    ---PVP正在结算中
    local startTime,endTime = ActivationTaskViewModel.GetSeasonTime(true)
    if PVPViewModel.startTime ~= 0 and PVPViewModel.endTime ~= 0 then
        startTime = PVPViewModel.startTime
        endTime = PVPViewModel.endTime
    end
    local curTime = Global.GetCurTime()
    local PVPjiesuan = false
    if curTime >= startTime and curTime <= endTime then
        PVPjiesuan = true
    end
    ---显示PVP代理剩余时间
    local restTime = PVPViewModel.bTime + PVPViewModel.Continue_PVP_Separate * PVPViewModel.bCount
    local totalTime = restTime - Global.GetCurTime()
    UnityEngine.DebugEx.LogError("yzhb代理剩余时间：" .. totalTime .. "s")
    if PlayerControl.getDiffTimeFirst then
        PlayerControl.getDiffTimeFirst = false
        PlayerControl.diffTime = totalTime - PVPViewModel.Continue_PVP_Separate * PVPViewModel.bCount    --本地时间和服务器时间差值
        if PlayerControl.diffTime < 0 then  --(临时处理，如果延迟为负，则延迟清零，下次再记录延迟)
            PlayerControl.diffTime = 0
            PlayerControl.getDiffTimeFirst = true
            UnityEngine.DebugEx.LogError("yzhb延迟为负，下次再记录延迟")
        else
            UnityEngine.DebugEx.LogError("yzhb记录服务器与本地时间插值")
            UnityEngine.DebugEx.LogError("yzhb服务器与本地时间插值： " .. PlayerControl.diffTime .. "s")
        end
    end
    totalTime = totalTime - PlayerControl.diffTime   --获得服务器真实倒计时时间
    self.totalTime = totalTime
    if self.totalTime <= 0 then --代理时间已跑完
        Event.Go("CalculatePVPTimeOff",false)
        if PVPViewModel.bCount ~= 0 then    --有未结算代理次数,按钮
            self.Btn_StartExercise().gameObject:SetActive(false)
            self.Btn_Dailizhong().gameObject:SetActive(false)
            self.Btn_Sweep().gameObject:SetActive(false)
            if not PVPjiesuan then
                self.Btn_Dailiwancheng().gameObject:SetActive(true)
            end
            RedDotControl.GetDotData("ScrollBox"):SetState(true)
        else
            self.Btn_StartExercise().gameObject:SetActive(true)
            self.Btn_Sweep().gameObject:SetActive(true)
            self.Btn_Dailiwancheng().gameObject:SetActive(false)
        end
    else    --代理时间未跑完
        Event.Go("CalculatePVPTimeOff",true)
        self.Btn_StartExercise().gameObject:SetActive(false)
        self.Btn_Dailizhong().gameObject:SetActive(true)
        self.Btn_Sweep().gameObject:SetActive(true)
        self.Btn_Dailiwancheng().gameObject:SetActive(false)
    end
    local hour = math.modf(self.totalTime / 3600)
    local min = math.modf(self.totalTime % 3600 / 60)
    local sec = self.totalTime % 3600 % 60
    self.Text_Shijian().text = ((hour>9)and""or"0")..hour..":"..((min>9)and""or"0")..min..":"..((sec>9)and""or"0")..sec
    MgrTimer.AddRepeat("Continue_PVP",1,function()
        self.totalTime = self.totalTime - 1
        if self.totalTime <= 0 then
            Event.Go("CalculatePVPTimeOff",false)
            if PVPViewModel.bCount ~= 0 then
                self.Btn_StartExercise().gameObject:SetActive(false)
                self.Btn_Dailizhong().gameObject:SetActive(false)
                self.Btn_Sweep().gameObject:SetActive(false)
                self.Btn_Dailiwancheng().gameObject:SetActive(true)
                RedDotControl.GetDotData("ScrollBox"):SetState(true)
            else
                self.Btn_StartExercise().gameObject:SetActive(true)
                self.Btn_Sweep().gameObject:SetActive(true)
                self.Btn_Dailiwancheng().gameObject:SetActive(false)
            end
        end
        local hour = math.modf(self.totalTime / 3600)
        local min = math.modf(self.totalTime % 3600 / 60)
        local sec = self.totalTime % 3600 % 60
        self.Text_Shijian().text = ((hour>9)and""or"0")..hour..":"..((min>9)and""or"0")..min..":"..((sec>9)and""or"0")..sec
    end,-1,nil)
end

function M:OnOffCalculatePVPTime(OnOrOff)
    self.Img_Dailishijiandi().gameObject:SetActive(OnOrOff)
    self.Text_Shijian().gameObject:SetActive(OnOrOff)
    self.Img_tiao().gameObject:SetActive(OnOrOff)
    self.Text_Shengyushijian().gameObject:SetActive(OnOrOff)
    if OnOrOff then
        self:ChangeSweepButtonTxt("ui_quickbattle_text10")
        self.Btn_Dailizhong().gameObject:SetActive(true)
        self.Btn_StartExercise().gameObject:SetActive(false)
    else
        self:ChangeSweepButtonTxt("ui_quickbattle_text3")
        self.Btn_Dailizhong().gameObject:SetActive(false)
        self.Btn_StartExercise().gameObject:SetActive(true)
        self.Btn_Sweep().gameObject:SetActive(true)
        self.Btn_Dailiwancheng().gameObject:SetActive(false)
        MgrTimer.Cancel("Continue_PVP")
    end
end

function M:ChangeSweepButtonTxt(txt)
    self.Text_Saodang().text = MgrLanguageData.GetLanguageByKey(txt)
end

function M:ChangeStartButton(Sweeping)
    if Sweeping then
        self.Btn_StartExercise().gameObject:SetActive(false)
        self.Btn_Sweep().gameObject:SetActive(false)
        self.Btn_Dailizhong().gameObject:SetActive(true)
    else
        self.Btn_StartExercise().gameObject:SetActive(true)
        self.Btn_Sweep().gameObject:SetActive(true)
        self.Btn_Dailizhong().gameObject:SetActive(false)
    end
end
---检测队伍是否超上限，调整队伍并保存服务器
function M:CheckTeam(teamIndex)
    local teamType = {
        ---进攻
        atk = 10001,
        ---防守
        def = 10002,
    }
    local needSaveTeam = {}
    for i, v in pairs(teamType) do
        ---获取阵型数据
        local team = TeamControl.GetTeamData(v)
        ---如果队伍为空
        if #team.info + #team.tryHero == 0 and (v == 10001 or v == 10002) then
            local teamStr = string.split(SteamLocalData.tab[104018][2],",")
            for k,roleId in pairs(teamStr) do
                team.info[k] = {index = k, roleID = tonumber(roleId)}
            end
        end
        local newTeam = clone(team)
        ---判断人数是不是已经超出限制
        local count = #newTeam.info + #newTeam.tryHero
        if count > PVPViewModel.RoleLimit then
            table.insert(needSaveTeam,v)
            for i = #newTeam.tryHero, 1, -1 do
                table.remove(newTeam.tryHero, i)
                count = count - 1;
                if count <= PVPViewModel.RoleLimit then
                    break;
                end
            end
            if count > PVPViewModel.RoleLimit then
                for i = #newTeam.info, 1, -1 do
                    table.remove(newTeam.info, i)
                    count = count - 1;
                    if count <= PVPViewModel.RoleLimit then
                        break;
                    end
                end
            end
            --修改阵容阵型
            TeamControl.ChangeTeamInfoEx(v, newTeam.info, newTeam.tryHero);
        end
    end
    if #needSaveTeam > 0 then
        TeamControl.SendSaveTeamData(needSaveTeam,false)
    end
end

function M:OnRefreshSeason()
    if 0 == PVPViewModel.season or 0 == PVPViewModel.subSeason then
        self.Img_Season().gameObject:SetActive(false);
        self.Img_Support().gameObject:SetActive(false);
        self.SupportScroll().gameObject:SetActive(false);
        self.Btn_Support01().gameObject:SetActive(false);
    else
        self.Img_Season().gameObject:SetActive(true);
        self.Img_Support().gameObject:SetActive(true);
        self.SupportScroll().gameObject:SetActive(true);
        self.Btn_Support01().gameObject:SetActive(true);
        self.Text_Season().text = string.format(MgrLanguageData.GetLanguageByKey("newpvp_ui5"), PVPViewModel.season, PVPViewModel.subSeason);
        self.SupportScroll().totalCount = #PVPViewModel.tryHeros;
        self.SupportScroll():RefreshCells();
    end
end

function M:OnSupportItemRender(trans,idx)
    trans:GetComponent("UITemplate"):SetData(PVPViewModel.tryHeros[idx]);
end

function M:OnBtnMasterClicked()
    PVPViewModel.SendGetChampionMatchReq(0, function(ack)
        if 0 ~= ack.errNo then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(ack.errNo), 1 }, true);
        end
    end, function()
        MgrUI.GoHide(UID.PVPMaster_UI, nil);
    end);
end

function M:OnBtnLegendClicked()
    PVPViewModel.SendGetChampionHistoryReq(function()
        MgrUI.GoHide(UID.PVPLegend_UI,nil);
    end);
end

function M:OnPVPMasterFormationClose()
    PVPViewModel.FriendPVPInit();
    if PVPViewModel.type == 0 then
        self:LoadTeamRole(10000)
    elseif PVPViewModel.type == 1 then
        if self.PVPAttackOrDefend then
            self:LoadTeamRole(10001,false)
        else
            self:LoadTeamRole(10002,false)
        end
    end
end

return M