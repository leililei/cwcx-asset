-- Code Auto Create Begin
local M = Class('StormPoint_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.StormPoint_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[StormPoint_UI].prefab'
    self.Name = 'Form[StormPoint_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Ani','Ani',2},{'Panel_Main','Ani/Panel_Main',2},{'Img_BG','Ani/Panel_Main/Img_BG',2},{'Btn_Click','Ani/Panel_Main/Btn_Click',2},{'Panel_ScrollInfo','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo',2},{'Btn_Zuo','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo/Btn_Zuo',2},{'Img_Zuo','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo/Btn_Zuo/Img_Zuo',2},{'Btn_You','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo/Btn_You',2},{'Img_You','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo/Btn_You/Img_You',2},{'Img_Juanbiaodi','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo/Img_Juanbiaodi',2},{'ScrollMask','Ani/Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/ScrollMask',2},{'MaskForClick','Ani/Panel_Main/Panel_MainPoint/Panel_Points/MaskForClick',2},{'Panel_Info','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info',2},{'Img_Xian2','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/Img_Xian2',2},{'Img_Xian1','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/Img_Xian1',2},{'Panel_Tili','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/Panel_Tili',2},{'Img_PowerBG','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/Panel_Tili/Img_PowerBG',2},{'Btn_Add','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/Panel_Tili/Btn_Add',2},{'Img_Tiliicon','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/Panel_Tili/Img_Tiliicon',2},{'PointName','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/PointName',2},{'PointIdxNamedi','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/PointName/PointIdxNamedi',2},{'battle','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle',2},{'Img_Biaotixian1','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Text_TaskName/Img_Biaotixian1',2},{'Img_StarTask_1','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_1',2},{'Img_TaskStar_1','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_1/Img_TaskStar_1',2},{'Highlight','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_1/Img_TaskStar_1/Highlight',2},{'Img_StarTask_2','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_2',2},{'Img_TaskStar_2','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_2/Img_TaskStar_2',2},{'Highlight01','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_2/Img_TaskStar_2/Highlight',2},{'Img_StarTask_3','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_3',2},{'Img_TaskStar_3','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_3/Img_TaskStar_3',2},{'Highlight02','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_3/Img_TaskStar_3/Highlight',2},{'Img_Biaotixian2','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Text_LevelType/Img_Biaotixian2',2},{'Btu_Saodangdi','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_Fast/Btu_Saodangdi',2},{'SweepSuo','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_Fast/Btn_Content/SweepSuo',2},{'Btn_InPoint','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_InPoint',2},{'Btn_Zuozhanzhunbeidi','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_InPoint/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_InPoint/Img_Xiaohaotili',2},{'Img_Tiliicon01','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_InPoint/Img_Xiaohaotili/Img_Tiliicon',2},{'plot','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot',2},{'Img_Guidexian3','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Text_Juqingjianjie/Img_Guidexian3',2},{'Btn_Guankanjuqing','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Btn_Guankanjuqing',2},{'Btn_Zuozhanzhunbeidi01','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Btn_Guankanjuqing/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili01','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Btn_Guankanjuqing/Img_Xiaohaotili',2},{'Img_Tiliicon02','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Btn_Guankanjuqing/Img_Xiaohaotili/Img_Tiliicon',2},{'dikuang','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/dikuang',2},{'Img_Zhangjietudi','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Img_Zhangjietudi',2},{'guide','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide',2},{'Img_Jiaoxuetu','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Img_Jiaoxuetu',2},{'Img_Guidexian2','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Text_GuideType/Img_Guidexian2',2},{'Btn_GoGuide','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Btn_GoGuide',2},{'Btn_Zuozhanzhunbeidi02','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Btn_GoGuide/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili02','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Btn_GoGuide/Img_Xiaohaotili',2},{'Img_Tiliicon03','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Btn_GoGuide/Img_Xiaohaotili/Img_Tiliicon',2},{'Panel_MainStar','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar',2},{'Img_Jinduyuandi','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/Img_Jinduyuandi',2},{'StarProgress','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/StarProgress',2},{'Progress1','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/StarProgress/Progress1',2},{'Progress2','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/StarProgress/Progress2',2},{'Progress3','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/StarProgress/Progress3',2},{'hongdian','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/Text_Jiangli/hongdian',2},{'MainUpperRightPanel','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel',2},{'Panel_Diff','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff',2},{'Img_DiffBG','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Img_DiffBG',2},{'Img_Putong_xz','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Img_Putong_xz',2},{'Img_Kunnan_xz','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Img_Kunnan_xz',2},{'Kunnan_Suo','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Kunnan_Suo',2},{'Image','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Kunnan_Suo/Image',2},{'Drop_Diff','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff',2},{'Img_DiffBG01','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Img_DiffBG',2},{'Arrow','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Arrow',2},{'Template','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Template',2},{'Viewport','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Template/Viewport',2},{'ItemBackground','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Template/Viewport/Content/Item/Item Background',2},{'ItemCheckmark','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Template/Viewport/Content/Item/Item Checkmark',2},{'imgae','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Template/Viewport/Content/Item/imgae',2},{'Panel_Tili2','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2',2},{'Img_PowerBG01','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Img_PowerBG',2},{'Btn_Add2','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Btn_Add2',2},{'Img_Tiliicon04','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Img_Tiliicon',2},{'TipsQipao','Ani/Panel_Main/Panel_MainPoint/TipsQipao',2},{'Img_Tipsdi','Ani/Panel_Main/Panel_MainPoint/TipsQipao/Img_Tipsdi',2},{'Img_Tips','Ani/Panel_Main/Panel_MainPoint/TipsQipao/Img_Tips',2},{'Img_Touxiangzhezhao','Ani/Panel_Main/Panel_MainPoint/TipsQipao/Img_Touxiangzhezhao',2},{'Img_Touxiangkuang','Ani/Panel_Main/Panel_MainPoint/TipsQipao/Img_Touxiangkuang',2},{'Img_TipsIcon','Ani/Panel_Main/Panel_MainPoint/TipsQipao/Img_TipsIcon',2},{'Btn_Voice','Ani/Panel_Main/Panel_MainPoint/Panel_Yuyin/Btn_Voice',2},{'Img_VoiceBG','Ani/Panel_Main/Panel_MainPoint/Panel_Yuyin/Btn_Voice/Img_VoiceBG',2},{'Img_VoiceIcon','Ani/Panel_Main/Panel_MainPoint/Panel_Yuyin/Btn_Voice/Img_VoiceIcon',2},{'Panel_Res','Ani/Panel_Res',2},{'vfxroot','Ani/Panel_Res/vfxroot',2},{'BackGroundPanel','Ani/Panel_Res/vfxroot/BackGroundPanel',2},{'Scroll_Bg_Img','Ani/Panel_Res/vfxroot/BackGroundPanel/Scroll_Bg_Img',2},{'rongguang','Ani/Panel_Res/vfxroot/BackGroundPanel/rongguang',2},{'MiddleEffectPanel','Ani/Panel_Res/vfxroot/MiddleEffectPanel',2},{'miaozhunxian(shu)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/瞄准线/miaozhunxian(shu)',2},{'miaozhunxian(shu)(1)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/瞄准线/miaozhunxian(shu)/miaozhunxian(shu) (1)',2},{'miaozhunxian(heng)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/瞄准线/miaozhunxian(heng)',2},{'miaozhunxian(heng)(1)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/瞄准线/miaozhunxian(heng) (1)',2},{'guangzhu','Ani/Panel_Res/vfxroot/MiddleEffectPanel/guangzhu',2},{'guangzhu_1','Ani/Panel_Res/vfxroot/MiddleEffectPanel/guangzhu/guangzhu_1',2},{'guangzhu01','Ani/Panel_Res/vfxroot/MiddleEffectPanel/guangzhu',2},{'guangzhu_101','Ani/Panel_Res/vfxroot/MiddleEffectPanel/guangzhu/guangzhu_1',2},{'zuobiaoyuan','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan',2},{'guang2','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/guang2',2},{'quan','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan',2},{'quan(1)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan/root/quan (1)',2},{'quan(2)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan/root/quan (2)',2},{'quan(3)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan/root/quan (3)',2},{'quan(4)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan/root/quan (4)',2},{'quan(5)','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan/root/quan (5)',2},{'quan01','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan/root/quan',2},{'yuan','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/quan/root/yuan',2},{'ChapterTitlePanel','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/ChapterTitlePanel',2},{'guankadi','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/ChapterTitlePanel/MiddleEffect_ChapterNameText/guankadi',2},{'jiaobiao','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/ChapterTitlePanel/MiddleEffect_ChapterNameText/jiaobiao',2},{'Panel_ResInfo','Ani/Panel_Res/vfxroot/Panel_ResInfo',2},{'Img_Xian201','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_Xian2',2},{'Img_Xian101','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_Xian1',2},{'PointIdxNamedi01','Ani/Panel_Res/vfxroot/Panel_ResInfo/PointName/PointIdxNamedi',2},{'Img_Biaotixian101','Ani/Panel_Res/vfxroot/Panel_ResInfo/Text_TaskName/Img_Biaotixian1',2},{'Img_StarTask_101','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_1',2},{'Img_ResTaskStar_1','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_1/Img_ResTaskStar_1',2},{'Highlight03','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_1/Img_ResTaskStar_1/Highlight',2},{'Img_StarTask_201','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_2',2},{'Img_ResTaskStar_2','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_2/Img_ResTaskStar_2',2},{'Highlight04','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_2/Img_ResTaskStar_2/Highlight',2},{'Img_StarTask_301','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_3',2},{'Img_ResTaskStar_3','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_3/Img_ResTaskStar_3',2},{'Highlight05','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_3/Img_ResTaskStar_3/Highlight',2},{'Img_Biaotixian201','Ani/Panel_Res/vfxroot/Panel_ResInfo/Text_LevelType/Img_Biaotixian2',2},{'Btu_Saodangdi01','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_RFast/Btu_Saodangdi',2},{'ResSweepSuo','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_RFast/Btn_Content/ResSweepSuo',2},{'Btn_ReadyBattle','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_ReadyBattle',2},{'Btn_Zuozhanzhunbeidi03','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_ReadyBattle/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili03','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_ReadyBattle/Img_Xiaohaotili',2},{'Img_Tiliicon05','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_ReadyBattle/Img_Xiaohaotili/Img_Tiliicon',2},{'guankadi01','Ani/Panel_Res/vfxroot/ResPanel/guankadi',2},{'Image01','Ani/Panel_Res/vfxroot/ResPanel/guankadi/Image',2},{'qieyedi','Ani/Panel_Res/vfxroot/ResPanel/qieyedi',2},{'xingshudi','Ani/Panel_Res/vfxroot/ResPanel/Panel_ResStar/xingshudi',2},{'UpperRightPanel','Ani/Panel_Res/vfxroot/UpperRightPanel',2},{'Btn_AddPower','Ani/Panel_Res/vfxroot/UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG02','Ani/Panel_Res/vfxroot/UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add201','Ani/Panel_Res/vfxroot/UpperRightPanel/Btn_AddPower/Btn_Add2',2},{'Img_Tiliicon06','Ani/Panel_Res/vfxroot/UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'Mask','Ani/Panel_Res/vfxroot/Mask',2},{'UpperLeftPanel','Ani/UpperLeftPanel',2},{'Btn_GoMenu','Ani/UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','Ani/UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','Ani/UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','Ani/UpperLeftPanel/Btn_Help',2},{'EffectRoot','Ani/EffectRoot',2},
        -- Text 列表
        {'Text_Voice','Ani/Panel_Main/Panel_MainPoint/Panel_Yuyin/Btn_Voice/Text_Voice',3},
        -- Button 列表
        {'Btn_Fast','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_Fast',4},{'Btn_RFast','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_RFast',4},
        -- UITemplate 列表
        {'StormPointItem02','Ani/Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/ScrollMask/StormPointScroll/StormPointItem02',10},{'PointRewardsItem','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/VFXMask/RewardsScroll/PointRewardsItem',10},{'PointRewardsItem01','Ani/Panel_Res/vfxroot/Panel_ResInfo/VFXMask/ResRewardsScroll/PointRewardsItem',10},{'StormPointItem','Ani/Panel_Res/vfxroot/ResPanel/VTFMask/StormAssetsPointScroll/StormPointItem',10},{'AssetsScrollItem','Ani/Panel_Res/vfxroot/ResPanel/StormAssetsScroll/AssetsScrollItem',10},
        -- Toggle 列表
        {'Item','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Template/Viewport/Content/Item',13},{'StormPointItem01','Ani/Panel_Res/vfxroot/ResPanel/VTFMask/StormAssetsPointScroll/StormPointItem',13},{'AssetsScrollItem01','Ani/Panel_Res/vfxroot/ResPanel/StormAssetsScroll/AssetsScrollItem',13},
        -- RawImage 列表
        {'Panel_MainPoint','Ani/Panel_Main/Panel_MainPoint',15},{'StormPointScroll','Ani/Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/ScrollMask/StormPointScroll',15},{'StormPointContent','Ani/Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/ScrollMask/StormPointScroll/StormPointContent',15},{'RewardsScroll','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/VFXMask/RewardsScroll',15},{'RewardsContent','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/VFXMask/RewardsScroll/RewardsContent',15},{'ResRewardsScroll','Ani/Panel_Res/vfxroot/Panel_ResInfo/VFXMask/ResRewardsScroll',15},{'RewardsContent01','Ani/Panel_Res/vfxroot/Panel_ResInfo/VFXMask/ResRewardsScroll/RewardsContent',15},{'ResPanel','Ani/Panel_Res/vfxroot/ResPanel',15},{'Panel_ResStar','Ani/Panel_Res/vfxroot/ResPanel/Panel_ResStar',15},{'StormAssetsPointScroll','Ani/Panel_Res/vfxroot/ResPanel/VTFMask/StormAssetsPointScroll',15},{'StormPointItem02','Ani/Panel_Res/vfxroot/ResPanel/VTFMask/StormAssetsPointScroll/StormPointItem',15},{'StormAssetsScroll','Ani/Panel_Res/vfxroot/ResPanel/StormAssetsScroll',15},{'AssetsScrollItem02','Ani/Panel_Res/vfxroot/ResPanel/StormAssetsScroll/AssetsScrollItem',15},
        -- LoopScrollRect 列表
        {'StormPointScroll01','Ani/Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/ScrollMask/StormPointScroll',18},{'RewardsScroll01','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/VFXMask/RewardsScroll',18},{'ResRewardsScroll01','Ani/Panel_Res/vfxroot/Panel_ResInfo/VFXMask/ResRewardsScroll',18},{'StormAssetsPointScroll01','Ani/Panel_Res/vfxroot/ResPanel/VTFMask/StormAssetsPointScroll',18},{'StormAssetsScroll01','Ani/Panel_Res/vfxroot/ResPanel/StormAssetsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_ScrollName','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo/Text_ScrollName',20},{'Text_ScrollAlias','Ani/Panel_Main/Panel_MainPoint/Panel_ScrollInfo/Text_ScrollAlias',20},{'Text_Tili','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/Panel_Tili/Text_Tili',20},{'Text_PointIdxName','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/PointName/PointIdxNamedi/Text_PointIdxName',20},{'Text_PointName','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/PointName/Text_PointName',20},{'Text_TaskName','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Text_TaskName',20},{'Text_TaskDes_1','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_1/Text_TaskDes_1',20},{'Text_TaskDes_2','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_2/Text_TaskDes_2',20},{'Text_TaskDes_3','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Img_StarTask_3/Text_TaskDes_3',20},{'Text_LevelType','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Text_LevelType',20},{'Text_Saodang','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_Fast/Btn_Content/Text_Saodang',20},{'Text_InPoint','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_InPoint/Text_InPoint',20},{'Text_CNum','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/battle/Btn_InPoint/Img_Xiaohaotili/Text_CNum',20},{'Text_Juqingjianjie','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Text_Juqingjianjie',20},{'Text_Jianjie','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Text_Jianjie',20},{'Text_InPoint01','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Btn_Guankanjuqing/Text_InPoint',20},{'Text_PCNum','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/plot/Btn_Guankanjuqing/Img_Xiaohaotili/Text_PCNum',20},{'Text_Shuoming','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Text_Shuoming',20},{'Text_GuideType','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Text_GuideType',20},{'Text_InPoint02','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Btn_GoGuide/Text_InPoint',20},{'Text_RCNum','Ani/Panel_Main/Panel_MainPoint/Panel_Points/Panel_Info/guide/Btn_GoGuide/Img_Xiaohaotili/Text_RCNum',20},{'Text_MainStarNum','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/Text_MainStarNum',20},{'Text_Jiangli','Ani/Panel_Main/Panel_MainPoint/Panel_MainStar/Text_Jiangli',20},{'Putong','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Putong',20},{'Putong_xz','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Img_Putong_xz/Putong_xz',20},{'Kunnan','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Kunnan',20},{'Kunnan_xz','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Img_Kunnan_xz/Kunnan_xz',20},{'Label','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Label',20},{'ItemLabel','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff/Template/Viewport/Content/Item/Item Label',20},{'Text_Tili2','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Text_Tili2',20},{'Text_Tishi','Ani/Panel_Main/Panel_MainPoint/TipsQipao/Text_Tishi',20},{'MiddleEffect_ChapterNameText','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/ChapterTitlePanel/MiddleEffect_ChapterNameText',20},{'MiddleEffect_ChapterIdText','Ani/Panel_Res/vfxroot/MiddleEffectPanel/zuobiaoyuan/ChapterTitlePanel/MiddleEffect_ChapterNameText/guankadi/MiddleEffect_ChapterIdText',20},{'Text_ResPointIdxName','Ani/Panel_Res/vfxroot/Panel_ResInfo/PointName/PointIdxNamedi/Text_ResPointIdxName',20},{'Text_ResPointName','Ani/Panel_Res/vfxroot/Panel_ResInfo/PointName/Text_ResPointName',20},{'Text_TaskName01','Ani/Panel_Res/vfxroot/Panel_ResInfo/Text_TaskName',20},{'Text_ResTaskDes_1','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_1/Text_ResTaskDes_1',20},{'Text_ResTaskDes_2','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_2/Text_ResTaskDes_2',20},{'Text_ResTaskDes_3','Ani/Panel_Res/vfxroot/Panel_ResInfo/Img_StarTask_3/Text_ResTaskDes_3',20},{'Text_LevelType01','Ani/Panel_Res/vfxroot/Panel_ResInfo/Text_LevelType',20},{'Text_Cishu','Ani/Panel_Res/vfxroot/Panel_ResInfo/Text_Cishu',20},{'Text_Saodang01','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_RFast/Btn_Content/Text_Saodang',20},{'Text_InPoint03','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_ReadyBattle/Text_InPoint',20},{'Text_RCNum01','Ani/Panel_Res/vfxroot/Panel_ResInfo/Btn_ReadyBattle/Img_Xiaohaotili/Text_RCNum',20},{'Text_MainStarNum01','Ani/Panel_Res/vfxroot/ResPanel/Panel_ResStar/Text_MainStarNum',20},{'Text_ResTili','Ani/Panel_Res/vfxroot/UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_Title_CN','Ani/UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/UpperLeftPanel/Text_Title/Text_Title_EN',20},
        -- TMP_Dropdown 列表
        {'Drop_Diff01','Ani/Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff2/Drop_Diff',22},
    }
end
-- Code Auto Create End
require("LocalData/TermdescLocalData")
function M:OnInit()
    ---滑条移动
    self.mJumpID = 0
    
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --盾币详情跳转资源副本然后进入副本返回后界面顺序会乱，随意隐藏pop
    MgrUI.PopHide(UID.ShopHome_UI)
    if BattleViewModel.PveReturn then
        BattleViewModel.PveReturn = false
    --else
    --    StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
    end
    self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text116")

    ---如果之前有保存tempCurPointType/tempCurPointData,就取用已保存的数据
    if StormViewModel.CurPointType == nil then
        if StormViewModel.tempCurPointType ~= nil then
            StormViewModel.CurPointType = StormViewModel.tempCurPointType
            StormViewModel.tempCurPointType = nil
        else
            StormViewModel.CurPointType = StormViewModel.PointType.main
        end
    end
    if StormViewModel.CurPointData == nil then
        if StormViewModel.tempCurPointData ~= nil then
            StormViewModel.CurPointData = StormViewModel.tempCurPointData
            StormViewModel.tempCurPointData = nil
        end
    end
    self.Panel_Main().gameObject:SetActive(StormViewModel.CurPointType == StormViewModel.PointType.main)
    self.Panel_Res().gameObject:SetActive(StormViewModel.CurPointType == StormViewModel.PointType.res)
    ---关闭UI
    self.Panel_Info().gameObject:SetActive(false)
    MgrSound.PlayEffect("yx_ui_leidasaomiao_01",nil,nil,false)
    if StormViewModel.CurPointType == StormViewModel.PointType.main then
        self:InitMainPoint()---初始化主线关卡
    elseif StormViewModel.CurPointType == StormViewModel.PointType.res then
        self:InitMap()   ---初始化地图
        self:InitResPoint() ---初始化资源关卡
    end
    self:InitCommon()   ---初始化通用属性
    ---加载背景特效
    self:LoadEffect(self.EffectRoot().gameObject,StormViewModel.CurScrollData.effect)
    ---刷新右上角UI
    self:ReFreshUpperRightUI()
end

function M:OnShowFinish()
    NoviceViewModel.CheckCurID(51204,function()
        NoviceViewModel.DoNext()
    end)
    NoviceViewModel.CheckCurID(20803,function()
        NoviceViewModel.DoNext()
    end)

    if StormViewModel.CurChooseResPoint ~= nil then
        self.StormAssetsPointScroll01():ScrollToCell(self.mJumpID,0) --TODO
    end

    ---检查是否要跳转
    local data = EventRaidControl.GetLIANHETAOFAData()
    if data then
        Event.Go("LHTFPOP",StormViewModel.CurStormBossId,{TaskControl.CheckTodayVigorExpend(),data.activityType})
    end
    Event.Add("StormPoint_UI_OnInit",Handle(self,self.OnInit))

    --检测是否新开启的活动，开启弹窗
    TimeControl.CheckOpenPop()
end

function M:OnUpdateUI()
    ---扫荡锁
    if SysLockControl.CheckSysLock(2001) then
        self.SweepSuo().gameObject:SetActive(false)
        self.ResSweepSuo().gameObject:SetActive(false)
    else
        self.SweepSuo().gameObject:SetActive(true)
        self.ResSweepSuo().gameObject:SetActive(true)
    end
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113020][2],0.2)
    self.Mask().gameObject:SetActive(false)
    local data = self.pointList[1]
    ---指向当前的关卡
    if StormViewModel.CurPointData ~= nil then
        for i, v in ipairs(self.pointList) do
            if StormViewModel.CurPointData.id == v.id then
                data = v
            end
        end
    end
    if StormViewModel.CurPointType == StormViewModel.PointType.res then
        self:MapMove(data.mapX,data.mapY,0,true)
    end
    self:RefreshStarBox()
end

function M:ShowHeadTips()
    local data = StormControl.GetHighestPoint()
    if data.npcheads and data.npcheads ~= "0" and data.npcheads ~= "" then
        if StormViewModel.CurLevelType == StormViewModel.LevelType.Hard then
            self.TipsQipao().gameObject:SetActive(false)
        else
            local path = MgrRes.GetLocalizedName("HeadIcon/"..data.npcheads)
            MgrRes.LoadSprite(self.Img_TipsIcon(),path)
            self.Text_Tishi().text = data.promptdialog
            self.TipsQipao().gameObject:SetActive(true)
        end
    else
        self.TipsQipao().gameObject:SetActive(false)
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        StormViewModel.CurPointData = nil
        MgrUI.GoBack()
    end
end

---刷新普通、困难关卡选择
function M:ReFreshUpperRightUI()
    ---检查困难锁是否要打开
    if StormViewModel.CurHardScrollData then
        if not StormControl.CheckScrollLock(StormViewModel.CurHardScrollData.id) then
            self.Panel_Diff().gameObject:SetActive(false)
        else
            self.Kunnan_Suo().gameObject:SetActive(false)
            self.Panel_Diff().gameObject:SetActive(true)
        end
    else
        self.Panel_Diff().gameObject:SetActive(false)
    end
    
    ---新手引导
    if StormViewModel.CurScrollData.raidType == 999 then
        self.Panel_Tili().gameObject:SetActive(false)
        self.Panel_Tili2().gameObject:SetActive(false)
    else
        self.Panel_Tili().gameObject:SetActive(true)
        self.Panel_Tili2().gameObject:SetActive(true)
    end
end

---初始化通用属性
function M:InitCommon()
    ---初始化点击
    self:InitClick()
    ---更新当前已选关卡属性
    if StormViewModel.CurPointType == StormViewModel.PointType.res then
        self:UpdateResPointInfo()
    end
    ---更新核心和觉醒副本标题
    --[[if StormViewModel.CurScrollData.type == 0 then
    elseif StormViewModel.CurScrollData.type2 == 12 then
        self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("stormppoint_ui_makecore")
    elseif StormViewModel.CurScrollData.type2 == 13 then
        self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("stormppoint_ui_drivertrain")
    end]]
    ---刷新星星
    self:RefreshStarBox()
    ---检查章节红点
    StormControl.WhetherUnReceiveBox()
    UIEvent.LuaClick(self.Kunnan_Suo().gameObject,function()
        if not SysLockControl.CheckSysLock(1108) then   ---系统未解锁
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_tongyong_text228"),1},true)
            return
        end
        --MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"), 1}, true)
        local curScrollH = StormViewModel.CacheHardScrollData[StormViewModel.CurHardScrollData.index - 1 <= 0 and 1 or StormViewModel.CurHardScrollData.index - 1]
        local curScroll = StormViewModel.CurScrollData
        ---卷未解锁
        --local Str = ""
        local s1,s2,s3 = StormControl.CheckPointPass(curScrollH.points[#curScrollH.points])     --去检查前一章最后一关
        if not s1 and not s2 and not s3 then
            --local point = StormControl.GetStormPointByID(curScrollH.points[#curScrollH.points])
            --Str = MgrLanguageData.GetLanguageByKey("stormppoint_ui_hard")..point.idxName
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("stormppoint_ui_tips2"),1},true)
        else
            local s1,s2,s3 = StormControl.CheckPointPass(curScroll.points[#curScroll.points])
            if not s1 and not s2 and not s3 then
                --local point = StormControl.GetStormPointByID(curScroll.points[#curScroll.points])
                --Str = point.idxName
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("stormppoint_ui_tips1"),1},true)
            end
        end
        --MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("stormppoint_ui_tips1"),Str),1},true)
    end,true)
    ---注册章节奖励弹窗
    UIEvent.LuaClick(self.Panel_MainStar().gameObject,function()
        MgrUI.Pop(UID.StarRewardPop_UI,{StormControl.GetStormScrollById(StormViewModel.CurScrollData.id),function()
            self:RefreshStarBox()
        end},true)
    end)

    ---注册获取体力
    UIEvent.LuaClick(self.Panel_Tili().gameObject,Handle(self,self.PopPower))
    UIEvent.LuaClick(self.Panel_Tili2().gameObject,Handle(self,self.PopPower))
    UIEvent.LuaClick(self.Btn_AddPower().gameObject,Handle(self,self.PopPower))

    ---跳转帮助界面
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        if StormViewModel.CurPointType == 1 then
            HelpViewModel.Go(89)
        elseif StormViewModel.CurPointType == 2 then
            if StormViewModel.CurScrollData.id % 100000 == 0 then
                HelpViewModel.Go(91)
            elseif StormViewModel.CurScrollData.id % 100000 == 1 then
                HelpViewModel.Go(90)
            elseif StormViewModel.CurScrollData.id == 600200 then
                HelpViewModel.Go(94)
            elseif StormViewModel.CurScrollData.id % 100000 >= 100 and StormViewModel.CurScrollData.id % 100000 < 200 then
                HelpViewModel.Go(92)
            elseif StormViewModel.CurScrollData.id % 100000 >= 201 and StormViewModel.CurScrollData.id % 100000 < 300 then
                HelpViewModel.Go(93)
            elseif StormViewModel.CurScrollData.id % 100000 >= 300 and StormViewModel.CurScrollData.id % 100000 < 400 then
                HelpViewModel.Go(112)
            end
        elseif StormViewModel.CurPointType == 3 then
        end
    end))
    --[[if StormViewModel.CurPointType == 1 then
    --    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
    --        HelpViewModel.Go(89)
    --    end))
    --elseif StormViewModel.CurPointType == 2 then
    --    if StormViewModel.CurScrollData.id % 100000 == 0 then
    --        UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
    --            HelpViewModel.Go(91)
    --        end))
    --    elseif StormViewModel.CurScrollData.id % 100000 == 1 then
    --        UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
    --            HelpViewModel.Go(90)
    --        end))
    --    elseif StormViewModel.CurScrollData.id % 100000 >= 100 and StormViewModel.CurScrollData.id % 100000 < 200 then
    --        UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
    --            HelpViewModel.Go(92)
    --        end))
    --    elseif StormViewModel.CurScrollData.id % 100000 >= 200 and StormViewModel.CurScrollData.id % 100000 < 300 then
    --        UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
    --            HelpViewModel.Go(93)
    --        end))
    --    end
    --elseif StormViewModel.CurPointType == 3 then
    --
    --end]]
end

---初始化地图
function M:InitMap()
    self.map = self.Scroll_Bg_Img()
    self.mapCT = self.ChapterTitlePanel().gameObject
    local path1 = MgrRes.GetLocalizedName(StormViewModel.CurScrollData.map)
    MgrRes.SetMaterialByMesh(self.map.gameObject,"Storm/"..path1,"_TextureSample2")
    local path2 = MgrRes.GetLocalizedName(StormViewModel.CurScrollData.map.."_1")
    MgrRes.SetMaterialByMesh(self.map.gameObject,"Storm/"..path2,"_TextureSample0")
    self.anim = self.vfxroot():GetComponent("Animator")
end
---地图移动
function M:MapMove(x,y,delay,isOne)
    if self.anim == nil then
        Log.Error("关卡动画已被销毁")
        return
    end
    if not isOne then
        self.anim:SetTrigger("OnMove")---OnMove、ExitMove、GoChapter
    end
    MgrTimer.AddDelay("PointMapMove",delay, function ()
        Tools.ChapterMapTween(self.map.gameObject,x,y,0.5,2,function()
            self.MiddleEffect_ChapterIdText().text = StormViewModel.CurPointData.idxName
            self.MiddleEffect_ChapterNameText().text = StormViewModel.CurPointData.name
            self.anim:SetTrigger("ExitMove")
            self.mapCT:SetActive(true)
        end)
    end,nil)
    self.mapCT:SetActive(false)
end

---初始化点击
function M:InitClick()
    ---退出点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnBackHomeClick))
    UIEvent.LuaClick(self.Btn_Fast().gameObject,function()
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        if SysLockControl.CheckSysLock(2001) then

        else
            MgrUI.Pop(UID.PopTip_UI,{string.format(SysLockControl.GetSystemLockTips(2001)),1},true)
            return
        end
        if StormViewModel.CurPointData.star == 0 then
            return
        end
        if StormViewModel.CurPointData.battleMap == nil or StormViewModel.CurPointData.battleMap == "0" or StormViewModel.CurPointData.battleMap == "" then
            return
        end
        MgrUI.Pop(UID.SweepPop_UI,{StormViewModel.CurPointData,function()
            ---刷新体力
            self:RefreshPower()
        end},true)
    end)
    UIEvent.LuaClick(self.Btn_RFast().gameObject,function()
        if SysLockControl.CheckSysLock(2001) then

        else
            MgrUI.Pop(UID.PopTip_UI,{string.format(SysLockControl.GetSystemLockTips(2001)),1},true)
            return
        end
        if StormViewModel.CurPointData.star == 0 then
            return
        end
        if StormViewModel.CurPointData.battleMap == nil or StormViewModel.CurPointData.battleMap == "0" or StormViewModel.CurPointData.battleMap == "" then
            return
        end
        MgrUI.Pop(UID.SweepPop_UI,{StormViewModel.CurPointData,function()
            ---刷新体力
            self:RefreshPower()
            self:RefreshWeekBossTimes()
            -----刷新关卡
            --self.StormAssetsPointScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
            -----刷新资源关卡数据
            --self:ReloadResPointView(false)
        end},true)
    end)
    ---点击开始作战
    UIEvent.LuaClick(self.Btn_InPoint().gameObject,Handle(self,self.OnPointClick))
    UIEvent.LuaClick(self.Btn_Guankanjuqing().gameObject,Handle(self,self.OnPointClick))
    UIEvent.LuaClick(self.Btn_ReadyBattle().gameObject,Handle(self,self.OnPointClick))
    UIEvent.LuaClick(self.Btn_GoGuide().gameObject,Handle(self,self.OnPointClick))
    ---点击修改UI展示
    UIEvent.LuaClick(self.Btn_Click().gameObject,function()
        if self.Panel_Info().gameObject.activeSelf == false then
            return
        end
        self.Panel_Info().gameObject:SetActive(false)
        self.Ani().gameObject.transform:GetComponent("Animation"):Stop()
        self.MainUpperRightPanel().gameObject:SetActive(true)
        self.Panel_ScrollInfo().gameObject:SetActive(true)
        self.scrollMask.enabled = false
    end)
    self.StormPointScroll().transform:GetComponent("CanvasGroup").enabled = false
    ---困难锁的解锁
    if SysLockControl.CheckSysLock(1108) then
        self.Kunnan_Suo().gameObject:SetActive(false)
    else
        self.Kunnan_Suo().gameObject:SetActive(true)
    end
end

---注册关卡奖励滑块
function M:InitRewardsScroll()
    self.RewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardsCellItem))
end

---奖励滑块回调
function M:RewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
end
---奖励滑块刷新
function M:ReloadRewardsPanel(offset)
    ---设置当前Loop数据
    self.RewardsList = StormViewModel.CurPointData:GetRewards()
    ---设置Loop数量
    self.RewardsScroll01().totalCount = #self.RewardsList
    if offset then
        self.RewardsScroll01():RefillCells()
    else
        self.RewardsScroll01():RefreshCells()
    end
end

---关卡item回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.pointList[idx],self})
end
---左侧资源卷滑块回调
function M:CellScrollItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.ResScrollList[idx],self})
end

function M:PopPower()
    --Event.Remove("BackKey", Handle(self, self.OnBackKey))
    ---跳转体力
    MgrUI.Pop(UID.VigorInfoPanel,{function()
        self:RefreshPower()
    end},true)
end

---前往当前关卡
function M:OnPointClick()
    self.fastId = nil
    local scroll = StormControl.GetStormScrollById(StormViewModel.CurPointData.scrollID)
    MgrTimer.AddDelay("GoPlot",1, function ()
        BattleManager.GameMode = 0
        StormViewModel.OpenStormPlotUI()
        if scroll.type == 0 then
            ---如果是普通难度
            StormViewModel.CurChooseNormal = StormControl.CheckPointPass(StormViewModel.CurPointData.id) and StormViewModel.CurPointData or nil
        elseif scroll.type == 2 then
            ---如果是困难难度
            StormViewModel.CurChooseHard = StormControl.CheckPointPass(StormViewModel.CurPointData.id) and StormViewModel.CurPointData or nil
        elseif scroll.type == 1 then
            ---当前选中的资源关
            StormViewModel.curChooseRes = StormControl.GetStormScrollById(StormViewModel.CurPointData.scrollID)
            StormViewModel.CurChooseResPoint = StormControl.CheckPointPass(StormViewModel.CurPointData.id) and StormViewModel.CurPointData or nil
        end
    end,nil)
end

---拿到当前章节最高进度关卡
function M:CheckLastPoint()
    --普通关卡
    if StormViewModel.CurLevelType == StormViewModel.LevelType.Normal then
        StormViewModel.CurPointData = StormControl.GetCurPointByScroll(StormViewModel.GetStormPointData()[1].scrollID)
    else
        --困难关卡
        StormViewModel.CurPointData = StormControl.GetCurPointByScroll(StormViewModel.GetStormHardPointData()[1].scrollID)
    end
end

---返回按钮
function M:OnBackClick()
    --Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Go("NoviceSkillShowSelf")
    StormViewModel.CurPointData = nil
    MgrUI.GoBack()
end
---返回大厅按钮
function M:OnBackHomeClick()
    StormViewModel.ClearData()
    MgrUI.GoBackTo(UID.Home_UI)
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Remove("StormPoint_UI_OnInit",Handle(self,self.OnInit))
    self.fastId = nil
    MgrTimer.Cancel("PointMapMove")
    MgrTimer.Cancel("GoPlot")
    --StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
end

----------------------------------------------主线关卡------------------------------------------------------------------
---初始化主线剧情关卡
function M:InitMainPoint()
    ---滑块Mask
    self.scrollMask = self.ScrollMask().transform:GetComponent("RectMask2D")
    self.scrollMask.enabled = self.Panel_Info().activeSelf
    ---背景图修改
    local path = MgrRes.GetLocalizedName(StormViewModel.CurScrollData.map)
    MgrRes.LoadSprite(self.Img_BG():GetComponent("Image"),"Storm/"..path)
    ---注册主线滑块
    self.StormPointScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    ---注册主线切换按钮
    UIEvent.LuaClick(self.Btn_Zuo().gameObject,function()
        self:SwitchMainScroll(-1)
    end)
    UIEvent.LuaClick(self.Btn_You().gameObject,function()
        self:SwitchMainScroll(1)
    end)
    self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_battle_mainstoryen1")
    ---初始化关卡奖励滑块
    self:InitRewardsScroll()
    ---刷新主线数据
    self:ReloadMainView()
    ---初始化难度
    self:InitDifficulty()
    ---初始化体力
    self:RefreshPower()
    ---拿到星级宝箱进度图片
    self.starProgress = {
        self.Progress3().gameObject,  ---进度1
        self.Progress2().gameObject,  ---进度2
        self.Progress1().gameObject,  ---进度3
    }
    ---新手引导
    if StormViewModel.CurScrollData.raidType == 999 then
        self.Panel_Tili().gameObject:SetActive(false)
        self.Panel_Tili2().gameObject:SetActive(false)
        if NoviceControl.GroupsIsTrigger(tonumber(SteamLocalData.tab[120001][2])) then
            self.Btn_Zuo().gameObject:SetActive(false)
            self.Btn_You().gameObject:SetActive(true)
            self.UpperLeftPanel().gameObject:SetActive(true)
        else
            self.Btn_Zuo().gameObject:SetActive(false)
            self.Btn_You().gameObject:SetActive(false)
            self.UpperLeftPanel().gameObject:SetActive(false)
        end
    else
        self.Panel_Tili().gameObject:SetActive(true)
        self.Panel_Tili2().gameObject:SetActive(true)
        if StormViewModel.CurScrollData.index >= #StormViewModel.CachePlotScrollData then
            self.Btn_Zuo().gameObject:SetActive(true)
            self.Btn_You().gameObject:SetActive(false)
        end
    end
end

---更新当前主线已选关卡信息
function M:UpdatePointInfo()
    self.fastId = StormViewModel.CurPointData.id
    self:ReloadRewardsPanel(0)
    local data = StormViewModel.CurPointData
    local count = tonumber(string.split(data.consume,"_")[3])
    ---战斗体力消耗赋值
    self.Text_CNum().text = count
    ---战斗相关
    local isPlot = data:CheckIsBattle() == false and data:CheckGuide() == false
    local isBattle = data:CheckIsBattle() and data:CheckGuide() == false
    local isGuide = data:CheckGuide()
    ---关卡信息样式更换
    self.guide().gameObject:SetActive(isGuide)
    self.battle().gameObject:SetActive(isBattle)
    self.plot().gameObject:SetActive(isPlot)
    ---关卡掉落滑块显示
    self.RewardsScroll01().gameObject:SetActive(isBattle or isGuide)
    ---关卡名字赋值
    self.Text_PointName().text = data.name
    self.Text_PointIdxName().text = data.idxName
    Tools.ReContentSizeGroup(self.PointName().gameObject)

    if isBattle then
        ---存在战斗
        ---更新关卡星级
        local s1,s2,s3 = data:CheckStar()
        self.Img_TaskStar_1().transform:Find("Highlight").gameObject:SetActive(s1)
        self.Img_TaskStar_2().transform:Find("Highlight").gameObject:SetActive(s2)
        self.Img_TaskStar_3().transform:Find("Highlight").gameObject:SetActive(s3)
        local strArr = string.split(data.condition,",")
        --self.Text_TaskDes_1().text = MgrLanguageData.GetLanguageByKey("battle_ui_completelevel")
        --self.Text_TaskDes_2().text = string.split(strArr[1],"_")[2]..MgrLanguageData.GetLanguageByKey("battle_ui_passround")
        --self.Text_TaskDes_3().text = MgrLanguageData.GetLanguageByKey("battle_ui_walkoff")..string.split(strArr[2],"_")[2]..MgrLanguageData.GetLanguageByKey("eventbosspop_ui_tips1")
        self.Text_TaskDes_1().text = TermdescLocalData.tab[tonumber(string.split(strArr[1],"_")[3])][2]
        self.Text_TaskDes_2().text = TermdescLocalData.tab[tonumber(string.split(strArr[2],"_")[3])][2]
        self.Text_TaskDes_3().text = TermdescLocalData.tab[tonumber(string.split(strArr[3],"_")[3])][2]
    elseif isPlot then
        local path = MgrRes.GetLocalizedName(data.picture)
        MgrRes.LoadSprite(self.Img_Zhangjietudi():GetComponent("Image"),"ArtGallery/PlotCg/"..path)
        self.Text_PCNum().text = count                --关卡体力消耗赋值
        self.Text_Jianjie().text = data.introduction  --关卡简介
    elseif isGuide then
        local path = MgrRes.GetLocalizedName(data.bgpicture)
        MgrRes.LoadSprite(self.Img_Jiaoxuetu():GetComponent("Image"),"Preview/"..path)
        self.Text_RCNum().text = count                --关卡体力消耗赋值
        self.Text_Shuoming().text = data.introduction  --关卡简介
        if StormControl.GetStormScrollById(data.scrollID).raidType == 999 then
            self.Text_GuideType().gameObject:SetActive(false)
            self.Img_Guidexian2().gameObject:SetActive(false)
        else
            self.Text_GuideType().gameObject:SetActive(true)
            self.Img_Guidexian2().gameObject:SetActive(true)
        end
    end
    ---刷新体力
    self:RefreshPower()
    ---显示隐藏扫荡
    self.Btn_Fast().gameObject:SetActive(data.star == 7 and data.battleMap ~= nil and data.battleMap ~= "0" and data.battleMap ~= "" and data.type ~= 999)
    ---相关UI展示
    self.Panel_Info().gameObject:SetActive(true)
    self.Ani().gameObject.transform:GetComponent("Animation"):Play()
    self.MainUpperRightPanel().gameObject:SetActive(false)
    self.Panel_ScrollInfo().gameObject:SetActive(false)
    self.scrollMask.enabled = true
end

--隐藏所有选择框
function M:HideNormalSelect()
    for i = 0,self.StormPointContent().gameObject.transform.childCount - 1 do
        self.StormPointContent().gameObject.transform:GetChild(i).transform:Find("UI_Panel/PlotPanel/Img_PlotSelect").gameObject:SetActive(false)
        self.StormPointContent().gameObject.transform:GetChild(i).transform:Find("UI_Panel/NormalPanel/Img_NormalSelect").gameObject:SetActive(false)
        self.StormPointContent().gameObject.transform:GetChild(i).transform:Find("UI_Panel/HardPanel/Img_HardSelect").gameObject:SetActive(false)
    end
end

function M:RefreshPower()
    ---体力校准
    Global.TiliCalibration()
    self.Text_Tili().text = string.format("%s/%s",PlayerControl.GetPlayerData().vigor.vigorNum,PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4])
    self.Text_Tili2().text = string.format("%s/%s",PlayerControl.GetPlayerData().vigor.vigorNum,PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4])
    self.Text_ResTili().text = string.format("%s/%s",PlayerControl.GetPlayerData().vigor.vigorNum,PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4])
end
function M:RefreshWeekBossTimes()
    if StormViewModel.CurScrollData.raidType == 13 then
        self.Text_Cishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_meizhoufuben_text2"),StormControl.GetWeekBossTime(), StormControl.GetWeekBossTotalTime())
        self.Text_Cishu().gameObject:SetActive(true)
    else
        self.Text_Cishu().gameObject:SetActive(false)
    end
end
---更新章节总星级
function M:RefreshStarBox()
    ---当前章节星级宝箱数据
    local starAwardData = {}
    for k,v in pairs(StormControl.GetStormScrollById(StormViewModel.CurScrollData.id).box) do
        starAwardData[#starAwardData + 1] = v
    end
    local maxStar,curStar = StormViewModel.CurScrollData:GetMaxBoxStar()

    if maxStar > 0 then
        self.Text_MainStarNum().text = string.format("<color=#fab839><size=40>%s</size></color>/%s",curStar,maxStar)
        self.hongdian().gameObject:SetActive(StormViewModel.CurScrollData:IsGetBoxStar())
    end
    local rewardCount = 0
    for i = 1,#starAwardData do
        if starAwardData[i].isGet then
            rewardCount = rewardCount + 1
        end
        --self.starProgress[i]:SetActive(starAwardData[i].isGet)
    end
    for i = 1,#starAwardData do
        self.starProgress[i]:SetActive(i <= rewardCount)
    end
    ---如果有数据
    if next(starAwardData) then
        self.Panel_MainStar().gameObject:SetActive(true)
    else
        self.Panel_MainStar().gameObject:SetActive(false)
    end
    if StormViewModel.CurLevelType == StormViewModel.LevelType.Normal and StormViewModel.CurScrollData.id ~= 999999 then
        self.Panel_MainStar().gameObject:SetActive(true)
    else
        self.Panel_MainStar().gameObject:SetActive(false)
    end
end

function M:InitDifficulty()
    UIEvent.LuaClick(self.Kunnan().gameObject,function()
        local reqScrollData = CheckTable(StormViewModel.CurHardScrollData)
        StormViewModel.RequestLevelDropInfo(reqScrollData.points, function() 
            Tools.DoPFade(self.Img_BG(), 0.3, 0.1, 0, 1, false, 0, 0, nil)
            MgrTimer.AddDelayNoName(0.2,function()
                Tools.DoPFade(self.Img_BG(), 1, 0.2, 0, 1, false, 0, 0, nil)
            end,nil)
            NoviceViewModel.CheckCurID(20805,function()
                NoviceViewModel.DoNext()
            end)
            if StormViewModel.CurLevelType ~= StormViewModel.LevelType.Hard then
                StormViewModel.CurLevelType = StormViewModel.LevelType.Hard
                self.Img_Putong_xz().gameObject:SetActive(false)
                self.Img_Kunnan_xz().gameObject:SetActive(true)
                self:CheckLastPoint()
                self:ReloadMainView()
            end
        end)
    end)
    UIEvent.LuaClick(self.Putong().gameObject,function()
        local reqScrollData = CheckTable(StormViewModel.CurScrollData)
        StormViewModel.RequestLevelDropInfo(reqScrollData.points, function() 
            Tools.DoPFade(self.Img_BG(), 0.3, 0.1, 0, 1, false, 0, 0, nil)
            MgrTimer.AddDelayNoName(0.2,function()
                Tools.DoPFade(self.Img_BG(), 1, 0.2, 0, 1, false, 0, 0, nil)
            end,nil)
            NoviceViewModel.CheckCurID(20804,function()
                NoviceViewModel.DoNext()
            end)
            if StormViewModel.CurLevelType ~= StormViewModel.LevelType.Normal then
                StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
                self.Img_Putong_xz().gameObject:SetActive(true)
                self.Img_Kunnan_xz().gameObject:SetActive(false)
                self:CheckLastPoint()
                self:ReloadMainView()
            end
        end)
    end)
    if StormViewModel.CurLevelType ~= StormViewModel.LevelType.Hard then
        StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
        self.Img_Putong_xz().gameObject:SetActive(true)
        self.Img_Kunnan_xz().gameObject:SetActive(false)
    else
        StormViewModel.CurLevelType = StormViewModel.LevelType.Hard
        self.Img_Putong_xz().gameObject:SetActive(false)
        self.Img_Kunnan_xz().gameObject:SetActive(true)
    end

end

---主线切换卷
function M:SwitchMainScroll(offset)
    if StormViewModel.CurScrollData.type ~= 0 and StormViewModel.CurScrollData.type ~= 2 then
        ---非剧情卷返回
        return
    end
    local data
    data = StormViewModel.CachePlotScrollData[StormViewModel.CurScrollData.index + offset]
    if not data then
        ---卷数据不存在返回
        return
    end
    if StormViewModel.CurScrollData.index + offset <= 0 then
        self.Btn_Zuo().gameObject:SetActive(false)
        self.Btn_You().gameObject:SetActive(true)
    elseif StormViewModel.CurScrollData.index + offset >= #StormViewModel.CachePlotScrollData then
        self.Btn_Zuo().gameObject:SetActive(true)
        self.Btn_You().gameObject:SetActive(false)
    else
        if not self.Btn_Zuo().gameObject.activeSelf then
            self.Btn_Zuo().gameObject:SetActive(true)
        end
        if not self.Btn_You().gameObject.activeSelf then
            self.Btn_You().gameObject:SetActive(true)
        end
    end

    local curScroll
    if offset < 0 then
        curScroll = data    ---回退
    else
        curScroll = StormViewModel.CurScrollData    ---向后一章要判断当前章
    end
    if StormViewModel.CurLevelType == StormViewModel.LevelType.Normal then                      --普通模式
        if not StormControl.CheckScrollLock(data.id) then
            ---卷未解锁
            local s1,s2,s3 = StormControl.CheckPointPass(curScroll.points[#curScroll.points])   --检查当前卷最后一关，没通关就提醒
            if not s1 and not s2 and not s3 then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("stormppoint_ui_tips1"),1},true)
            end
            return
        end
    end
    local HData = StormViewModel.CacheHardScrollData[StormViewModel.CurScrollData.index + offset]
    if HData then
        if offset < 0 then
            curScroll = HData   ---回退
        else
            curScroll = StormViewModel.CurHardScrollData    ---向后一章要判断当前章
        end
        if StormViewModel.CurLevelType == StormViewModel.LevelType.Hard then
            if not StormControl.CheckScrollLock(HData.id) then      --下章第一关没解锁
                ---卷未解锁
                local s1,s2,s3 = StormControl.CheckPointPass(curScroll.points[#curScroll.points])     ---当前章最后一关是否通过
                if not s1 and not s2 and not s3 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("stormppoint_ui_tips3"),1},true)
                else
                    local s1,s2,s3 = StormControl.CheckPointPass(data.points[#data.points])
                    if not s1 and not s2 and not s3 then    ---下一章普通没打完
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("stormppoint_ui_tips4"),1},true)
                    end
                end
                return
            end
        end
    end
    
    --- 确定要请求的关卡奖励
    local reqScrollData = data
    if StormViewModel.CurLevelType == StormViewModel.LevelType.Hard and HData then
        reqScrollData = HData
    end
    StormViewModel.RequestLevelDropInfo(reqScrollData.points, function() 
        StormViewModel.CurHardScrollData = HData
        StormViewModel.CurScrollData = data
        StormViewModel.CurPointData = nil
        StormViewModel.CurChooseNormal = nil
        StormViewModel.CurChooseHard = nil
        self:ShowPointInfo()
        Tools.DoPFade(self.Img_BG(), 0.5, 0.1, 0, 1, false, 0, 0, nil)
        MgrTimer.AddDelayNoName(0.1,function()
            Tools.DoPFade(self.Img_BG(), 1, 0.2, 0, 1, false, 0, 0, nil)
        end,nil)
        ---刷新右上角UI
        self:ReFreshUpperRightUI()
    end)
end

function M:ShowPointInfo()
    ---背景图修改
    local path = MgrRes.GetLocalizedName(StormViewModel.CurScrollData.map)
    MgrRes.LoadSprite(self.Img_BG():GetComponent("Image"),"Storm/"..path)
    ---加载背景特效
    self:LoadEffect(self.EffectRoot().gameObject,StormViewModel.CurScrollData.effect)
    ---更新左侧
    self:ReloadMainView()
    ---更新当前已选关卡属性
    --self:UpdatePointInfo()
    ---刷新星星
    self:RefreshStarBox()
    local data = self.pointList[1]
    ---指向选择的关卡
    if StormViewModel.CurPointData ~= nil then
        for i, v in ipairs(self.pointList) do
            if StormViewModel.CurPointData.id == v.id then
                data = v
            end
        end
    end
    ---检查困难锁是否要打开
    if StormViewModel.CurLevelType == StormViewModel.LevelType.Normal and StormViewModel.CurHardScrollData then
        if not StormControl.CheckScrollLock(StormViewModel.CurHardScrollData.id) then
            self.Kunnan_Suo().gameObject:SetActive(true)
        else
            self.Kunnan_Suo().gameObject:SetActive(false)
        end
    end
end

---移动到当前位置,点击item时调用
function M:MoveItem()
    local offset = 0
    if StormViewModel.CurPointData ~= nil then
        for i, v in ipairs(self.pointList) do
            if v.id == StormViewModel.CurPointData.id then
                if i == 1 then
                    offset = 0
                    break
                    ---移到屏幕左边
                else
                    offset = i - 2
                    break
                end
            end
        end
    end

    self.StormPointScroll01():ScrollToCell(offset, 3000)
    --self.StormPointScroll01():RefillCells(offset)
end

---主线关卡刷新
function M:ReloadMainView()
    ---如果当前时困难关但是没有困难关数据
    if StormViewModel.CurLevelType == StormViewModel.LevelType.Hard and StormViewModel.CurHardScrollData == nil then
        StormViewModel.CurLevelType = StormViewModel.LevelType.Normal  --改成普通关卡
    end
    ---刷新滑块
    if StormViewModel.CurLevelType == StormViewModel.LevelType.Normal then
        self.pointList = StormViewModel.GetStormPointData()
        self.Panel_MainStar().gameObject:SetActive(true)
        ---UI修改
        self.Img_Putong_xz().gameObject:SetActive(true)
        self.Img_Kunnan_xz().gameObject:SetActive(false)
    else
        self.pointList = StormViewModel.GetStormHardPointData()
        self.Panel_MainStar().gameObject:SetActive(false)
        ---UI修改
        self.Img_Putong_xz().gameObject:SetActive(false)
        self.Img_Kunnan_xz().gameObject:SetActive(true)
    end
    ---刷新关卡提示
    self:ShowHeadTips()
    ---设置好 StormViewModel.CurPointData
    self:CheckLastPoint()

    ---指向选择的关卡
    local offset = 0
    if StormViewModel.CurPointData ~= nil then
        for i, v in ipairs(self.pointList) do
            if v.id == StormViewModel.CurPointData.id then
                if i == 1 then
                    offset = 0
                    break
                    ---移到屏幕左边
                else
                    offset = i - 2
                    break
                end
            end
        end
    else
        offset = #self.pointList - 2
        StormViewModel.CurPointData = self.pointList[#self.pointList - 2]
    end
    self.StormPointScroll01().totalCount = #self.pointList
    self.StormPointScroll01():RefillCells(offset)
    --self.StormPointScroll01():ScrollToCell(offset,28000)
    ---刷新卷信息
    self.Text_ScrollName().text = StormViewModel.CurScrollData.name
    self.Text_ScrollAlias().text = StormViewModel.CurScrollData.alias
    ---弹出关卡详情
    self:PopPointInfo()
end

----------------------------------------------资源关卡------------------------------------------------------------------
---初始化日常资源关卡
function M:InitResPoint()
    ---注册资源奖励滑块
    self:InitResRewardsScroll()
    ---日常关卡逻辑
    local scroll = self.StormAssetsScroll01()
    local scrollPoint = self.StormAssetsPointScroll01()
    scroll:SetLuaCellEvent(Handle(self,self.CellScrollItem))
    scrollPoint:SetLuaCellEvent(Handle(self,self.CellItem))
    ---刷新资源卷数据
    self:ReloadResView()
    ---刷新资源关卡数据
    self:ReloadResPointView(true)
    self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_battle_resourcesen1")
    self:RefreshWeekBossTimes()
end
---资源卷刷新
function M:ReloadResView()
    ---刷新资源卷滑块
    local scroll = self.StormAssetsScroll01()
    self.ResScrollList = StormViewModel.GetResScrollData(StormViewModel.CurScrollData.type2)
    scroll.totalCount = #self.ResScrollList
    scroll:RefillCells()
end
---资源关卡刷新
function M:ReloadResPointView(checkLast)
    ---刷新资源关卡滑块
    local scroll = self.StormAssetsPointScroll01()
    self.pointList = StormViewModel.GetStormPointData()
    if (checkLast and StormViewModel.CurChooseResPoint == nil) or self.pointList[1].scrollID ~= StormViewModel.CurChooseResPoint.scrollID then  --首次进入或者切换资源章节
        self:CheckLastPoint()
        StormViewModel.CurChooseResPoint = StormViewModel.CurPointData
        ---指向选择的关卡
        local offset = 0
        if StormViewModel.CurPointData ~= nil then
            for i, v in ipairs(self.pointList) do
                if v.id == StormViewModel.CurPointData.id then
                    offset = i - 1
                    break
                end
            end
        end
        if offset == 0 then
            StormViewModel.CurPointData = self.pointList[1]
        end
        
        self.mJumpID = offset
    else
        if StormViewModel.CurPointData == nil then
            StormViewModel.CurPointData = StormViewModel.CurChooseResPoint
        end
        self.mJumpID = StormViewModel.CurPointData.index - 1
    end
    scroll.totalCount = #self.pointList
    --scroll:RefillCells(0)
    --策划要求暂时不自动指向关卡
    scroll:ScrollToCell(self.mJumpID,3500)
    self.Text_Title_CN().text = StormViewModel.CurScrollData.name
end

---注册资源关卡奖励滑块
function M:InitResRewardsScroll()
    self.ResRewardsScroll01():SetLuaCellEvent(Handle(self,self.ResRewardsCellItem))
end

---奖励滑块回调
function M:ResRewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.ResRewardsList[idx])
end
---奖励滑块刷新
function M:ReloadResRewardsPanel(offset)
    --更换为服务器获取的随机奖励
    --StormViewModel.CurPointData.randReward = self:RanRewardToString()
    ---设置当前Loop数据
    self.ResRewardsList = StormViewModel.CurPointData:GetRewards()
    ---设置Loop数量
    self.ResRewardsScroll01().totalCount = #self.ResRewardsList
    if offset then
        self.ResRewardsScroll01():RefillCells()
    else
        self.ResRewardsScroll01():RefreshCells()
    end
end

---更新当前支线已选关卡信息
function M:UpdateResPointInfo()
    if self.fastId ~= nil and self.fastId == StormViewModel.CurPointData.id then
        ---防止重复刷新
        return
    end
    self.fastId = StormViewModel.CurPointData == nil and StormViewModel.CurChooseResPoint.id or StormViewModel.CurPointData.id
    self:ReloadResRewardsPanel(0)
    self.Text_Title_CN().text = StormViewModel.CurScrollData.name
    local data = StormViewModel.CurPointData
    local count = tonumber(string.split(data.consume,"_")[3])
    self.Text_RCNum01().text = count
    ---战斗相关
    local isBattle = data:CheckIsBattle()
    self.Text_ResPointName().text = data.name
    self.Text_ResPointIdxName().text = data.idxName
    ---更新章节总星级
    local maxStar,curStar = StormViewModel.CurScrollData:GetMaxBoxStar()
    --self.Panel_MainStar().gameObject:SetActive(maxStar > 0)
    --if maxStar > 0 then
    --    self.Text_MainStarNum().text = string.format("<color=#73FFF9><size=40>%s</size></color>/%s",curStar,maxStar)
    --    self.StarVfx().gameObject:SetActive(StormViewModel.CurScrollData:IsGetBoxStar())
    --end
    if isBattle then
        ---存在战斗
        ---更新关卡星级
        local s1,s2,s3 = data:CheckStar()
        self.Img_ResTaskStar_1().transform:Find("Highlight").gameObject:SetActive(s1)
        self.Img_ResTaskStar_2().transform:Find("Highlight").gameObject:SetActive(s2)
        self.Img_ResTaskStar_3().transform:Find("Highlight").gameObject:SetActive(s3)
        local strArr = string.split(data.condition,",")
        --self.Text_ResTaskDes_1().text = MgrLanguageData.GetLanguageByKey("battle_ui_completelevel")
        --self.Text_ResTaskDes_2().text = string.split(strArr[1],"_")[2]..MgrLanguageData.GetLanguageByKey("battle_ui_passround")
        --self.Text_ResTaskDes_3().text = MgrLanguageData.GetLanguageByKey("battle_ui_walkoff")..string.split(strArr[2],"_")[2]..MgrLanguageData.GetLanguageByKey("eventbosspop_ui_tips1")
        self.Text_ResTaskDes_1().text = TermdescLocalData.tab[tonumber(string.split(strArr[1],"_")[3])][2]
        self.Text_ResTaskDes_2().text = TermdescLocalData.tab[tonumber(string.split(strArr[2],"_")[3])][2]
        self.Text_ResTaskDes_3().text = TermdescLocalData.tab[tonumber(string.split(strArr[3],"_")[3])][2]
    else
        self.Img_ResTaskStar_1().transform:Find("Highlight").gameObject:SetActive(true)
        self.Img_ResTaskStar_2().transform:Find("Highlight").gameObject:SetActive(true)
        self.Img_ResTaskStar_3().transform:Find("Highlight").gameObject:SetActive(true)
        self.Text_ResTaskDes_1().text = MgrLanguageData.GetLanguageByKey("battle_ui_completelevel")
        self.Text_ResTaskDes_2().text = MgrLanguageData.GetLanguageByKey("stormppoint_ui_condition1")
        self.Text_ResTaskDes_3().text = MgrLanguageData.GetLanguageByKey("stormppoint_ui_condition2")
    end
    ---刷新体力
    self:RefreshPower()
    ---显示隐藏扫荡
    self.Btn_RFast().gameObject:SetActive(data.star == 7 and data.battleMap ~= nil and data.battleMap ~= "0" and data.battleMap ~= "")
    self:MapMove(data.mapX,data.mapY,0,true)
end

--滑动到相关关卡页签
function M:RefreshTabIndex()
    if StormViewModel.curChooseRes ~= nil then
        self.StormAssetsPointScroll01():ScrollToCell(self.mJumpID,0)  --TODO
    end
end

---弹出关卡信息
function M:PopPointInfo()
    ---弹出选中UI
    local point= StormControl.GetCurPointByScroll(StormViewModel.CurPointData.scrollID)
    local isPass = false
    if point:CheckNovice() then
        isPass = StormControl.CheckPointPass(point.id,4)
    else
        isPass = StormControl.CheckPointPass(point.id)
    end
    ---当前关卡未解锁
    if isPass == false then
        self:UpdatePointInfo()
    end
end

---加载背景特效
function M:LoadEffect(root,effectName)
    if self.effectObj ~= nil then
        ---销毁旧特效
        GameObject.Destroy(self.effectObj)
        self.effectObj = nil
    end
    if effectName == nil or effectName == "0" then
        return
    end
    MgrRes.GetPrefab("ABOriginal/VFX/Prefab/UI_Prefab/"..effectName..".prefab",function(effectObj)
        if effectObj == nil then
            return
        end
        effectObj.transform:SetParent(root.transform)
        effectObj.transform.localPosition =Vector3.zero
        effectObj.transform.localScale =Vector3.one
        self.effectObj = effectObj
    end)
end

return M