-- Code Auto Create Begin
local M = Class('Home_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Home_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Home_UI].prefab'
    self.Name = 'Form[Home_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Ani','Ani',2},{'Img_DragFrame','Ani/Img_DragFrame',2},{'SpinePanel','Ani/SpinePanel',2},{'BgSprite','Ani/SpinePanel/BgSprite',2},{'RoleSpritePanel','Ani/SpinePanel/RoleSpritePanel',2},{'LihuiPanel','Ani/SpinePanel/RoleSpritePanel/LihuiPanel',2},{'RoleSprite','Ani/SpinePanel/RoleSpritePanel/LihuiPanel/RoleSprite',2},{'FrontSprite','Ani/SpinePanel/FrontSprite',2},{'RoleSpineClickArea','Ani/SpinePanel/RoleSpineClickArea',2},{'UIPanel','Ani/UIPanel',2},{'Btn_Share','Ani/UIPanel/Buttons1/Img_Btndi1_3/Btn_Share',2},{'Img_Share','Ani/UIPanel/Buttons1/Img_Btndi1_3/Btn_Share/Img_Share',2},{'ShareRedDotIcon','Ani/UIPanel/Buttons1/Img_Btndi1_3/Btn_Share/Img_Share/ShareRedDotIcon',2},{'Fg','Ani/UIPanel/Buttons1/Img_Btndi1_3/Btn_Share/Fg',2},{'SwitchCG','Ani/UIPanel/Buttons1/Img_Btndi1_3/SwitchCG',2},{'Fg01','Ani/UIPanel/Buttons1/Img_Btndi1_3/SwitchCG/Fg',2},{'Btn_SwitchTheme','Ani/UIPanel/Buttons1/Img_Btndi1_3/SwitchCG/Btn_SwitchTheme',2},{'Img_ST','Ani/UIPanel/Buttons1/Img_Btndi1_3/SwitchCG/Btn_SwitchTheme/Img_ST',2},{'Img_Btndi2','Ani/UIPanel/Currency/Img_Btndi2',2},{'PowerDetail','Ani/UIPanel/Currency/PowerDetail',2},{'PowerIcon','Ani/UIPanel/Currency/Power/PowerIcon',2},{'Btn_AddPower','Ani/UIPanel/Currency/Power/Btn_AddPower',2},{'Img_AddPower','Ani/UIPanel/Currency/Power/Btn_AddPower/Img_AddPower',2},{'Btn_ShowPower','Ani/UIPanel/Currency/Power/Btn_ShowPower',2},{'Fg02','Ani/UIPanel/Currency/Power/Fg',2},{'ShieldCoinIcon','Ani/UIPanel/Currency/ShieldCoin/ShieldCoinIcon',2},{'Btn_AddShieldCoin','Ani/UIPanel/Currency/ShieldCoin/Btn_AddShieldCoin',2},{'Img_AddShieldCoin','Ani/UIPanel/Currency/ShieldCoin/Btn_AddShieldCoin/Img_AddShieldCoin',2},{'Fg03','Ani/UIPanel/Currency/ShieldCoin/Fg',2},{'DiamondsDetail','Ani/UIPanel/Currency/DiamondsDetail',2},{'DiamondsIcon','Ani/UIPanel/Currency/DiamondsDetail/DiamondsIcon',2},{'DiamondsIcon01','Ani/UIPanel/Currency/DiamondsDetail/DiamondsIcon',2},{'DiamondsIcon02','Ani/UIPanel/Currency/PayDiamonds/DiamondsIcon',2},{'Btn_AddDiamonds','Ani/UIPanel/Currency/PayDiamonds/Btn_AddDiamonds',2},{'Img_AddDiamonds','Ani/UIPanel/Currency/PayDiamonds/Btn_AddDiamonds/Img_AddDiamonds',2},{'Fg04','Ani/UIPanel/Currency/PayDiamonds/Fg',2},{'DiamondsIcon03','Ani/UIPanel/Currency/Diamonds/DiamondsIcon',2},{'Btn_AddDiamonds01','Ani/UIPanel/Currency/Diamonds/Btn_AddDiamonds',2},{'Img_AddDiamonds01','Ani/UIPanel/Currency/Diamonds/Btn_AddDiamonds/Img_AddDiamonds',2},{'Fg05','Ani/UIPanel/Currency/Diamonds/Fg',2},{'Btn_Notice','Ani/UIPanel/Currency/Buttons2/Btn_Notice',2},{'Img_Notice','Ani/UIPanel/Currency/Buttons2/Btn_Notice/Img_Notice',2},{'NoticeRedDotIcon','Ani/UIPanel/Currency/Buttons2/Btn_Notice/Img_Notice/NoticeRedDotIcon',2},{'Fg06','Ani/UIPanel/Currency/Buttons2/Btn_Notice/Fg',2},{'Btn_Mail','Ani/UIPanel/Currency/Buttons2/Btn_Mail',2},{'Img_Mail','Ani/UIPanel/Currency/Buttons2/Btn_Mail/Img_Mail',2},{'MailRedDotIcon','Ani/UIPanel/Currency/Buttons2/Btn_Mail/Img_Mail/MailRedDotIcon',2},{'Fg07','Ani/UIPanel/Currency/Buttons2/Btn_Mail/Fg',2},{'Btn_Setting','Ani/UIPanel/Currency/Buttons2/Btn_Setting',2},{'Img_Setting','Ani/UIPanel/Currency/Buttons2/Btn_Setting/Img_Setting',2},{'SettingRedDotIcon','Ani/UIPanel/Currency/Buttons2/Btn_Setting/Img_Setting/SettingRedDotIcon',2},{'EventActivity','Ani/UIPanel/EventActivity',2},{'EventPrefab','Ani/UIPanel/EventActivity/EventPrefab',2},{'Event','Ani/UIPanel/EventActivity/EventPrefab/Event',2},{'closetime','Ani/UIPanel/EventActivity/EventPrefab/closetime',2},{'EventContent','Ani/UIPanel/EventActivity/EventContent',2},{'EventContent01','Ani/UIPanel/EventActivity/EventContent',2},{'Btn_Passport','Ani/UIPanel/Activity/Btn_Passport',2},{'Img_Passesicon','Ani/UIPanel/Activity/Btn_Passport/Img_Passesicon',2},{'Passes','Ani/UIPanel/Activity/Btn_Passport/Passes',2},{'PassportRedDotIcon','Ani/UIPanel/Activity/Btn_Passport/PassportRedDotIcon',2},{'Btn_Activity','Ani/UIPanel/Activity/Btn_Activity',2},{'Activity','Ani/UIPanel/Activity/Btn_Activity/Activity',2},{'Img_Activity','Ani/UIPanel/Activity/Btn_Activity/Img_Activity',2},{'ActivityRedDotIcon','Ani/UIPanel/Activity/Btn_Activity/ActivityRedDotIcon',2},{'Btn_Task','Ani/UIPanel/Activity/Btn_Task',2},{'Task','Ani/UIPanel/Activity/Btn_Task/Task',2},{'Img_Task','Ani/UIPanel/Activity/Btn_Task/Img_Task',2},{'TaskRedDotIcon','Ani/UIPanel/Activity/Btn_Task/TaskRedDotIcon',2},{'Btn_Friend','Ani/UIPanel/Activity/Btn_Friend',2},{'Friend','Ani/UIPanel/Activity/Btn_Friend/Friend',2},{'Img_Friend','Ani/UIPanel/Activity/Btn_Friend/Img_Friend',2},{'FriendRedDotIcon','Ani/UIPanel/Activity/Btn_Friend/FriendRedDotIcon',2},{'BtnPlotReview','Ani/UIPanel/Activity/BtnPlotReview',2},{'Friend01','Ani/UIPanel/Activity/BtnPlotReview/Friend',2},{'Img_Friend01','Ani/UIPanel/Activity/BtnPlotReview/Img_Friend',2},{'PlotReviewRedDot','Ani/UIPanel/Activity/BtnPlotReview/PlotReviewRedDot',2},{'Btn_Master','Ani/UIPanel/Btn_Master',2},{'Player','Ani/UIPanel/LeftBottom/Player',2},{'Img_PlayerBG','Ani/UIPanel/LeftBottom/Player/Img_PlayerBG',2},{'Img_ExpSlider','Ani/UIPanel/LeftBottom/Player/Img_ExpSlider',2},{'Img_Expdi','Ani/UIPanel/LeftBottom/Player/Img_Expdi',2},{'Btn_SwitchRole','Ani/UIPanel/LeftBottom/Btn_SwitchRole',2},{'Img_Genghuandi','Ani/UIPanel/LeftBottom/Btn_SwitchRole/Img_Genghuandi',2},{'Img_Genghuanicon','Ani/UIPanel/LeftBottom/Btn_SwitchRole/Img_Genghuanicon',2},{'Ad','Ani/UIPanel/LeftBottom/Ad',2},{'BannerScroll','Ani/UIPanel/LeftBottom/Ad/BannerScroll',2},{'BannerContent','Ani/UIPanel/LeftBottom/Ad/BannerScroll/BannerContent',2},{'Banner','Ani/UIPanel/LeftBottom/Ad/BannerScroll/Banner',2},{'BannerPointPanel','Ani/UIPanel/LeftBottom/Ad/BannerPointPanel',2},{'CurBanner','Ani/UIPanel/LeftBottom/Ad/CurBanner',2},{'BannerPointN','Ani/UIPanel/LeftBottom/Ad/BannerPointN',2},{'Btn_libao','Ani/UIPanel/LeftBottom/Btn_libao',2},{'icon_libao','Ani/UIPanel/LeftBottom/Btn_libao/icon_libao',2},{'bg_libao','Ani/UIPanel/LeftBottom/Btn_libao/bg_libao',2},{'ASMR','Ani/UIPanel/LeftBottom/ASMR',2},{'Btn_CD','Ani/UIPanel/LeftBottom/ASMR/Btn_CD',2},{'Img_CD','Ani/UIPanel/LeftBottom/ASMR/Btn_CD/Img_CD',2},{'ASMR_Close','Ani/UIPanel/LeftBottom/ASMR/ASMR_Close',2},{'Btn_ASMR_Close','Ani/UIPanel/LeftBottom/ASMR/ASMR_Close/Btn_ASMR_Close',2},{'Img_ASMR','Ani/UIPanel/LeftBottom/ASMR/ASMR_Close/Btn_ASMR_Close/Img_ASMR',2},{'Btn_ASMR_Open','Ani/UIPanel/LeftBottom/ASMR/Btn_ASMR_Open',2},{'Module','Ani/UIPanel/Module',2},{'Img_Gongnengdi','Ani/UIPanel/Module/Img_Gongnengdi',2},{'Btn_Home','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Home',2},{'Img_Lingxing','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Home/Img_Lingxing',2},{'Img_ArkIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Home/Img_ArkIcon',2},{'ArkRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Home/ArkRedDotIcon',2},{'ArkLock','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Home/ArkLock',2},{'Btn_Role','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Role',2},{'Img_Lingxing01','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Role/Img_Lingxing',2},{'Img_RoleIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Role/Img_RoleIcon',2},{'RoleRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Role/RoleRedDotIcon',2},{'RoleLock','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Role/RoleLock',2},{'Btn_Bag','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Bag',2},{'Img_Lingxing02','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Bag/Img_Lingxing',2},{'Img_BagIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Bag/Img_BagIcon',2},{'BagRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Bag/BagRedDotIcon',2},{'BagLock','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Bag/BagLock',2},{'Btn_Atlas','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Atlas',2},{'Img_Lingxing03','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Atlas/Img_Lingxing',2},{'Img_AtlasIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Atlas/Img_AtlasIcon',2},{'DexRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Atlas/DexRedDotIcon',2},{'AtlasLock','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Atlas/AtlasLock',2},{'Btn_Union','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Union',2},{'Img_Lingxing04','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Union/Img_Lingxing',2},{'Img_UnionIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Union/Img_UnionIcon',2},{'UnionRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Union/UnionRedDotIcon',2},{'GuildLock','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Union/GuildLock',2},{'Btn_Shop','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Shop',2},{'Img_Lingxing05','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Shop/Img_Lingxing',2},{'Img_ShopIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Shop/Img_ShopIcon',2},{'ShopRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Shop/ShopRedDotIcon',2},{'ShopLock','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Shop/ShopLock',2},{'Btn_Supply','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Supply',2},{'Img_Lingxing06','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Supply/Img_Lingxing',2},{'Img_SupplyIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Supply/Img_SupplyIcon',2},{'SupplyRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Supply/SupplyRedDotIcon',2},{'SupplyLock','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Supply/SupplyLock',2},{'Fg1','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg1',2},{'Fg2','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg2',2},{'Fg3','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg3',2},{'Fg4','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg4',2},{'Fg5','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg5',2},{'Fg6','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg6',2},{'Fg7','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg7',2},{'Fg8','Ani/UIPanel/Module/Img_Gongnengdi/Content2/Fg8',2},{'Btn_PVE','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE',2},{'Img_Zuozhandi1','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE/Img_Zuozhandi1',2},{'Img_Zuozhandi2','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE/Img_Zuozhandi2',2},{'Zuozhanicon1','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE/Img_Zuozhandi2/Zuozhanicon1',2},{'Zuozhanicon2','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE/Img_Zuozhandi2/Zuozhanicon2',2},{'PVERedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE/Img_Zuozhandi2/PVERedDotIcon',2},{'Btn_PVP','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP',2},{'Img_Yanxidi1','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi1',2},{'Img_Yanxidi2','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi2',2},{'Yanxiicon','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi2/Yanxiicon',2},{'PVPRedDotIcon','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi2/PVPRedDotIcon',2},{'Lock','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi2/Lock',2},{'PVPLock','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi2/Btn_Content/PVPLock',2},{'Btn_RestoreUI','Ani/Btn_RestoreUI',2},{'Img_DragBG','Ani/Img_DragBG',2},{'Img_More','Ani/Sound/Img_More',2},{'VoiceIcon','Ani/Sound/VoiceIcon',2},{'Img_SoundTextBG','Ani/Sound/Img_SoundTextBG',2},{'Btn_Hide','Ani/Btn_Hide',2},{'Img_Hide','Ani/Btn_Hide/Img_Hide',2},{'Btn_Show','Ani/Btn_Show',2},{'Img_Hide01','Ani/Btn_Show/Img_Hide',2},{'Btn_Chakan','Ani/Btn_Chakan',2},{'Img_Hide02','Ani/Btn_Chakan/Img_Hide',2},{'FBPanel','Ani/FBPanel',2},{'BlurMask','Ani/FBPanel/BlurMask',2},{'Panel','Ani/FBPanel/Panel',2},{'FB','Ani/FBPanel/Panel/FB',2},{'Img_Biaotixian1','Ani/FBPanel/Panel/FB/Img_Biaotixian1',2},{'ItemScroll','Ani/FBPanel/Panel/FB/ItemScroll',2},{'Btn_Jiaru','Ani/FBPanel/Panel/FB/Btn_Jiaru',2},{'DISCORD','Ani/FBPanel/Panel/DISCORD',2},{'Img_Biaotixian101','Ani/FBPanel/Panel/DISCORD/Img_Biaotixian1',2},{'ItemScroll01','Ani/FBPanel/Panel/DISCORD/ItemScroll',2},{'Btn_Jiaru01','Ani/FBPanel/Panel/DISCORD/Btn_Jiaru',2},{'Line','Ani/FBPanel/Panel/Line',2},{'Img_Biaotixian102','Ani/FBPanel/Panel/Line/Img_Biaotixian1',2},{'ItemScroll02','Ani/FBPanel/Panel/Line/ItemScroll',2},{'Btn_Jiaru02','Ani/FBPanel/Panel/Line/Btn_Jiaru',2},{'Img_Xian2','Ani/FBPanel/Img_Xian2',2},{'Img_Xian1','Ani/FBPanel/Img_Xian1',2},{'SharePanel','Ani/SharePanel',2},{'shareMask','Ani/SharePanel/shareMask',2},{'Panel01','Ani/SharePanel/Panel',2},{'Img_Biaotixian','Ani/SharePanel/Panel/Img_Biaotixian',2},{'Btn_ShareUI','Ani/SharePanel/Panel/Btn_ShareUI',2},{'Img_Shareicon','Ani/SharePanel/Panel/Btn_ShareUI/Img_Shareicon',2},{'ShareRedDotIcon01','Ani/SharePanel/Panel/Btn_ShareUI/ShareRedDotIcon',2},{'Btn_FB','Ani/SharePanel/Panel/Btn_FB',2},{'Img_FBicon','Ani/SharePanel/Panel/Btn_FB/Img_FBicon',2},{'FBRedDotIcon','Ani/SharePanel/Panel/Btn_FB/FBRedDotIcon',2},{'Btn_Discord','Ani/SharePanel/Panel/Btn_Discord',2},{'Img_Discordicon','Ani/SharePanel/Panel/Btn_Discord/Img_Discordicon',2},{'DiscordRedDotIcon','Ani/SharePanel/Panel/Btn_Discord/DiscordRedDotIcon',2},{'Btn_Line','Ani/SharePanel/Panel/Btn_Line',2},{'Img_Lineicon','Ani/SharePanel/Panel/Btn_Line/Img_Lineicon',2},{'LineRedDotIcon','Ani/SharePanel/Panel/Btn_Line/LineRedDotIcon',2},{'Img_Xian201','Ani/SharePanel/Img_Xian2',2},{'Img_Xian101','Ani/SharePanel/Img_Xian1',2},{'FenxiangPanel','Ani/FenxiangPanel',2},{'Btn_Fenxiang','Ani/FenxiangPanel/Btn_Fenxiang',2},{'BlurMask2','Ani/FenxiangPanel/BlurMask2',2},{'JietuPanelParent','Ani/FenxiangPanel/JietuPanelParent',2},{'JietuPanel','Ani/FenxiangPanel/JietuPanelParent/JietuPanel',2},{'Jietu','Ani/FenxiangPanel/JietuPanelParent/JietuPanel/Jietu',2},{'logo','Ani/FenxiangPanel/JietuPanelParent/JietuPanel/logo',2},{'Content','Ani/FenxiangPanel/Content',2},{'Btn_FB2','Ani/FenxiangPanel/Content/Btn_FB2',2},{'FBicon','Ani/FenxiangPanel/Content/Btn_FB2/FBicon',2},{'Btn_LINE','Ani/FenxiangPanel/Content/Btn_LINE',2},{'LINEicon','Ani/FenxiangPanel/Content/Btn_LINE/LINEicon',2},{'Btn_XB','Ani/FenxiangPanel/Content/Btn_XB',2},{'XBicon','Ani/FenxiangPanel/Content/Btn_XB/XBicon',2},{'ChoosePlayerRole','Ani/ChoosePlayerRole',2},{'zhezhao','Ani/ChoosePlayerRole/zhezhao',2},{'Img_Tanchudi','Ani/ChoosePlayerRole/Img_Tanchudi',2},{'Img_Tanchuxian','Ani/ChoosePlayerRole/Img_Tanchuxian',2},{'Img_Touxiangdi','Ani/ChoosePlayerRole/Img_Touxiangdi',2},{'Img_Xian102','Ani/ChoosePlayerRole/Img_Xian1',2},{'Img_Xian202','Ani/ChoosePlayerRole/Img_Xian2',2},{'Btn_Genghuan','Ani/ChoosePlayerRole/Btn_Genghuan',2},{'Btn_Genghuan01','Ani/ChoosePlayerRole/Btn_Genghuan/Btn_Genghuan',2},{'Btn_UnGenghuan','Ani/ChoosePlayerRole/Btn_UnGenghuan',2},{'Btn_Genghuan(hui)','Ani/ChoosePlayerRole/Btn_UnGenghuan/Btn_Genghuan(hui)',2},{'RoleContent','Ani/ChoosePlayerRole/VFXMask/PlayerRoleScroll/RoleContent',2},{'qiehuandi(you)','Ani/ChoosePlayerRole/GearSortPanel/qiehuandi(you)',2},{'GearSortToggleGroup','Ani/ChoosePlayerRole/GearSortPanel/GearSortToggleGroup',2},{'PlayerSortToggle','Ani/ChoosePlayerRole/GearSortPanel/PlayerSortToggle',2},{'Btn_ChooseRoleBack','Ani/ChoosePlayerRole/Btn_ChooseRoleBack',2},{'ScalePanel','Ani/ScalePanel',2},{'Btn_Shuping','Ani/ScalePanel/Btn_Shuping',2},{'Image','Ani/ScalePanel/Slider_Scale/Image',2},{'Fill','Ani/ScalePanel/Slider_Scale/Fill Area/Fill',2},{'Background','Ani/ScalePanel/Slider_Scale/Background',2},{'Handle','Ani/ScalePanel/Slider_Scale/Handle Slide Area/Handle',2},{'Btn_Reset','Ani/ScalePanel/Btn_Reset',2},{'Img_Scale1','Ani/ScalePanel/Img_Scale1',2},{'Img_Scale2','Ani/ScalePanel/Img_Scale2',2},{'Img_Scale3','Ani/ScalePanel/Img_Scale3',2},{'ShowMask','Ani/ShowMask',2},{'Mask','Ani/Mask',2},{'SwitchPanelVideoPlayer','Ani/SwitchPanelVideoPlayer',2},{'Logo_UIDPanel','Ani/Logo_UIDPanel',2},{'logo01','Ani/Logo_UIDPanel/logo',2},{'logo2','Ani/Logo_UIDPanel/logo2',2},{'QRCode','Ani/Logo_UIDPanel/QRCode',2},{'Btn_Mask','Ani/Btn_Mask',2},{'Btn_Skip','Ani/Btn_Skip',2},{'Img_Skip','Ani/Btn_Skip/Img_Skip',2},{'Img_Skip1','Ani/Btn_Skip/Img_Skip/Img_Skip1',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Button 列表
        {'RoleSpineClickArea01','Ani/SpinePanel/RoleSpineClickArea',4},{'Btn_ASMR_Open01','Ani/UIPanel/LeftBottom/ASMR/Btn_ASMR_Open',4},{'Btn_Reset01','Ani/ScalePanel/Btn_Reset',4},{'Btn_Skip01','Ani/Btn_Skip',4},
        -- Slider 列表
        {'Slider_Scale','Ani/ScalePanel/Slider_Scale',5},
        -- UITemplate 列表
        {'Banner01','Ani/UIPanel/LeftBottom/Ad/BannerScroll/Banner',10},{'BagItem','Ani/FBPanel/Panel/FB/ItemScroll/BagItem',10},{'BagItem01','Ani/FBPanel/Panel/DISCORD/ItemScroll/BagItem',10},{'BagItem02','Ani/FBPanel/Panel/Line/ItemScroll/BagItem',10},{'PlayerRoleItem','Ani/ChoosePlayerRole/VFXMask/PlayerRoleScroll/PlayerRoleItem',10},{'PlayerSortToggle01','Ani/ChoosePlayerRole/GearSortPanel/PlayerSortToggle',10},
        -- Toggle 列表
        {'PlayerSortToggle02','Ani/ChoosePlayerRole/GearSortPanel/PlayerSortToggle',13},
        -- RawImage 列表
        {'PlayerRoleScroll','Ani/ChoosePlayerRole/VFXMask/PlayerRoleScroll',15},
        -- LoopScrollRect 列表
        {'BannerScroll01','Ani/UIPanel/LeftBottom/Ad/BannerScroll',18},{'ItemScroll03','Ani/FBPanel/Panel/FB/ItemScroll',18},{'ItemScroll04','Ani/FBPanel/Panel/DISCORD/ItemScroll',18},{'ItemScroll05','Ani/FBPanel/Panel/Line/ItemScroll',18},{'PlayerRoleScroll01','Ani/ChoosePlayerRole/VFXMask/PlayerRoleScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_PowerClock','Ani/UIPanel/Currency/PowerDetail/Text_PowerClock',20},{'Text_TargetTime','Ani/UIPanel/Currency/PowerDetail/Text_TargetTime',20},{'title','Ani/UIPanel/Currency/PowerDetail/title',20},{'title2','Ani/UIPanel/Currency/PowerDetail/title2',20},{'Text_PowerCount','Ani/UIPanel/Currency/Power/Text_PowerCount',20},{'Text_ShieldCoinCount','Ani/UIPanel/Currency/ShieldCoin/Text_ShieldCoinCount',20},{'Text_FreeDiamonds','Ani/UIPanel/Currency/DiamondsDetail/Text_FreeDiamonds',20},{'Text_PayDiamonds','Ani/UIPanel/Currency/DiamondsDetail/Text_PayDiamonds',20},{'Text_PayCount','Ani/UIPanel/Currency/PayDiamonds/Text_PayCount',20},{'Text_DiamondsCount','Ani/UIPanel/Currency/Diamonds/Text_DiamondsCount',20},{'EventText_sysj','Ani/UIPanel/EventActivity/EventPrefab/closetime/EventText_sysj',20},{'Text_Passes','Ani/UIPanel/Activity/Btn_Passport/Passes/Text_Passes',20},{'Text_Activity','Ani/UIPanel/Activity/Btn_Activity/Activity/Text_Activity',20},{'Text_Task','Ani/UIPanel/Activity/Btn_Task/Task/Text_Task',20},{'Text_Friend','Ani/UIPanel/Activity/Btn_Friend/Friend/Text_Friend',20},{'Text_Friend01','Ani/UIPanel/Activity/BtnPlotReview/Friend/Text_Friend',20},{'Text_Master','Ani/UIPanel/Btn_Master/Text_Master',20},{'Text_UID','Ani/UIPanel/LeftBottom/Player/Text_UID',20},{'Text_Name','Ani/UIPanel/LeftBottom/Player/Text_Name',20},{'Text_Level','Ani/UIPanel/LeftBottom/Player/Text_Level',20},{'Text_LV','Ani/UIPanel/LeftBottom/Player/Text_LV',20},{'Text_time','Ani/UIPanel/LeftBottom/Btn_libao/Text_time',20},{'CDName','Ani/UIPanel/LeftBottom/ASMR/Btn_CD/CDName',20},{'Text_Home_Cn','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Home/Text_Home_Cn',20},{'Text_Home_En','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Home/Text_Home_En',20},{'Text_Role_Cn','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Role/Text_Role_Cn',20},{'Text_Role_En','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Role/Text_Role_En',20},{'Text_Bag_Cn','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Bag/Text_Bag_Cn',20},{'Text_Bag_En','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Bag/Text_Bag_En',20},{'Text_Atlas_Cn','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Atlas/Text_Atlas_Cn',20},{'Text_Atlas_En','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Atlas/Text_Atlas_En',20},{'Text_Union_Cn','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Union/Text_Union_Cn',20},{'Text_Union_En','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Union/Text_Union_En',20},{'Text_Shop_Cn','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Shop/Text_Shop_Cn',20},{'Text_Shop_En','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Shop/Text_Shop_En',20},{'Text_Supply_Cn','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Supply/Text_Supply_Cn',20},{'Text_Supply_En','Ani/UIPanel/Module/Img_Gongnengdi/Content1/Btn_Supply/Text_Supply_En',20},{'Text_Battle','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE/Img_Zuozhandi2/Text_Battle',20},{'Text_Zuozhan','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVE/Img_Zuozhandi2/Text_Zuozhan',20},{'Text_PVP','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi2/Btn_Content/PVP/Text_PVP',20},{'Text_Yanxi','Ani/UIPanel/Module/Img_Gongnengdi/Btn_PVP/Img_Yanxidi2/Btn_Content/PVP/Text_Yanxi',20},{'RoleVoiceWordText','Ani/Sound/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_Name01','Ani/FBPanel/Panel/FB/Text_Name',20},{'Text_Shuoming','Ani/FBPanel/Panel/FB/Text_Shuoming',20},{'Text_Jiaru','Ani/FBPanel/Panel/FB/Btn_Jiaru/Text_Jiaru',20},{'Text_Name02','Ani/FBPanel/Panel/DISCORD/Text_Name',20},{'Text_Shuoming01','Ani/FBPanel/Panel/DISCORD/Text_Shuoming',20},{'Text_Jiaru01','Ani/FBPanel/Panel/DISCORD/Btn_Jiaru/Text_Jiaru',20},{'Text_Name03','Ani/FBPanel/Panel/Line/Text_Name',20},{'Text_Shuoming02','Ani/FBPanel/Panel/Line/Text_Shuoming',20},{'Text_Jiaru02','Ani/FBPanel/Panel/Line/Btn_Jiaru/Text_Jiaru',20},{'Text_Name04','Ani/SharePanel/Panel/Text_Name',20},{'Text_Share','Ani/SharePanel/Panel/Btn_ShareUI/Text_Share',20},{'Text_FB','Ani/SharePanel/Panel/Btn_FB/Text_FB',20},{'Text_Discord','Ani/SharePanel/Panel/Btn_Discord/Text_Discord',20},{'Text_Line','Ani/SharePanel/Panel/Btn_Line/Text_Line',20},{'Text_Fenxiang','Ani/FenxiangPanel/Btn_Fenxiang/Text_Fenxiang',20},{'Text_UID01','Ani/FenxiangPanel/JietuPanelParent/JietuPanel/Text_UID',20},{'Text_FB01','Ani/FenxiangPanel/Content/Btn_FB2/Text_FB',20},{'Text_LINE','Ani/FenxiangPanel/Content/Btn_LINE/Text_LINE',20},{'Text_XB','Ani/FenxiangPanel/Content/Btn_XB/Text_XB',20},{'Text_Genghuan','Ani/ChoosePlayerRole/Btn_Genghuan/Text_Genghuan',20},{'Text_Genghuan01','Ani/ChoosePlayerRole/Btn_UnGenghuan/Text_Genghuan',20},{'Text_tishi','Ani/ScalePanel/Text_tishi',20},{'Text_Shuping','Ani/ScalePanel/Btn_Shuping/Text_Shuping',20},{'Text_Zhanshi','Ani/ScalePanel/Btn_Shuping/Text_Zhanshi',20},{'Text_tuichusuofang','Ani/ScalePanel/Btn_Reset/Text_tuichusuofang',20},{'Text_Scale1','Ani/ScalePanel/Img_Scale1/Text_Scale1',20},{'Text_Scale2','Ani/ScalePanel/Img_Scale2/Text_Scale2',20},{'Text_Scale3','Ani/ScalePanel/Img_Scale3/Text_Scale3',20},{'Text_UID_ScreenShot','Ani/Logo_UIDPanel/Text_UID_ScreenShot',20},{'Text_Skip','Ani/Btn_Skip/Img_Skip/Text_Skip',20},
    }
end
-- Code Auto Create End
require("LocalData/PlayerplLocalData")
require("LocalData/SteamLocalData")
require("LocalData/MailLocalData")
require("LocalData/MainuiskinLocalData")
require("LocalData/ActivityLocalData")
require("LocalData/TimeLocalData")
require("LocalData/RoleuiskinLocalData")

function M:OnInit()
    self.EventPrefab().gameObject:SetActive(false)
    self.Btn_Share().gameObject:SetActive(false)
    ---刷新玩家货币
    HomeViewModel.RefreshCoinCount = Handle(self, self.RefreshCoinCount)
    ---隐藏红点
    self.TaskRedDotIcon().gameObject:SetActive(false)   --任务红点
    self.MailRedDotIcon().gameObject:SetActive(false)   --邮件红点
    self.DexRedDotIcon().gameObject:SetActive(false)   --美术馆红点
    self.RoleRedDotIcon().gameObject:SetActive(false)   --驾驶员红点
    self.BagRedDotIcon().gameObject:SetActive(false)   --背包红点
    self.PassportRedDotIcon().gameObject:SetActive(false)   --通行证红点
    self.ActivityRedDotIcon().gameObject:SetActive(false)    --活动入口红点
    self.PlotReviewRedDot().gameObject:SetActive(false);    -- 剧情回放红点
    ---隐藏UI
    self.BannerPointN().gameObject:SetActive(false)
    self.Logo_UIDPanel().gameObject:SetActive(false)
    self.FenxiangPanel().gameObject:SetActive(false)
    self.Btn_Fenxiang().gameObject:SetActive(false)
    self.JietuPanelParent().gameObject:SetActive(false)
    self.Content().gameObject:SetActive(false)
    self.FBPanel().gameObject:SetActive(false)
    self.SharePanel().gameObject:SetActive(false)
    self.Btn_Mask().gameObject:SetActive(false)
    self.Btn_Skip().gameObject:SetActive(false)
    self.Img_DragBG().gameObject:SetActive(false)
    self.ScalePanel().gameObject:SetActive(false)
    self.Btn_Hide().gameObject:SetActive(false)
    ---
    --self.Btn_Union().gameObject:SetActive(false)
    --self.Img_Social().gameObject:SetActive(false)
    --self.ShequnPanel().gameObject:SetActive(false)
    self.Text_UID_ScreenShot().text = "UID：" .. PlayerControl.GetPlayerData().UID
    ---隐藏更换面板娘面板
    self.ChoosePlayerRole().gameObject:SetActive(false)
    ---隐藏体力详情面板
    self.PowerDetail().gameObject:SetActive(false)
    ---隐藏还原UI按钮
    self.Btn_RestoreUI().gameObject:SetActive(false)
    self.Btn_Show().gameObject:SetActive(false)
    --ASMR
    self.ASMR().gameObject:SetActive(false)
    ---ASMR按钮列表
    self.BtnCD_Panel = {}
    ---当前选择角色
    self.CurRoleItem = nil
    ---banner数据
    self.BannerData = nil

    ---改变滑条
    self.SliderChange = true
    self.MaxScale = 1
    self.MinScale = 1
    --拖拽边框最大最小值
    self.MinDragFrame = nil
    self.MaxDragFrame = nil
    --拖拽边框缩放比
    self.Scale_Avg = Vector2(1,1)
    --拖拽
    self.ItemDrag = self.Img_DragBG().gameObject:GetComponent("ItemDrag")
    --是否能够旋转
    self.IsCanRotate = false

    --左上角活动数据和预制体
    self.leftActivityData = {}
    --是否切换动画
    self.IsSwitchAni = false
    ---注册点击
    self:InitClick()

    ---初始化体力
    self:ChangeWallet()

    ---初始化头像文本
    self:ChangePlayerInfo()
    
    ---初始化引导事件
    self:InitGuideEvent()
    --初始化左上角活动
    self:InitActiveEvent()

    -----------------角色立绘&播音模块，需要做成单独的模块-------------------
    self:InitHomeRoleList()
    self:RandomHomeRole()
    ---创建立绘
    self:InitPosterGirl()
    ---设置台词Obj
    local wordText = self.RoleVoiceWordText()
    local TextBG = self.Img_SoundTextBG().gameObject
    local Icon = self.VoiceIcon().gameObject
    local More = self.Img_More().gameObject
    PosterGirlViewModel.SetRoleVoiceWordText(wordText, TextBG, Icon, More)
    -----------------------------------------------------------------------
    ---注册滑块监听
    self:RegisterScroll()

    ---初始化选择亲信
    self:InitChooseRole()

    ---Banner广告位
    self:CreatBanner()

    Event.Add("RedDotFunc",Handle(self,self.RedDotFunc))
    ---注册体力监听
    PlayerControl.AddNotify(Handle(self, self.ChangeWallet))
    -----初始化抽卡Up角色
    --if next(NormalCardDrawViewModel.RoleUpList) == nil then
    --    NormalCardDrawViewModel.ReloadCardPool()
    --    UnityEngine.PlayerPrefs.SetString(string.format("%s", RolerecruitLocalData.tab[100000][1]), NormalCardDrawViewModel.RoleUpList[1])
    --end
    ---刷新按钮UI样式
    self:RefreshBtnUI()

    MgrTimer.AddRepeat("ReefreshActiviryPrefeb",1,function()
        if #self.leftActivityData > 0 then
            self:CheckIsActivityEnd()
        end
    end)

    self.isHideHome = false
    --改变主界面看板娘列表
    Event.Add("ChangeHomeRoleList",Handle(self,self.ChangeHomeRoleList))
    self:TouchUpdate()
end

--触控
function M:TouchUpdate()
    local touchDistance = tonumber(SteamLocalData.tab[113005][2])
    Input.multiTouchEnabled = true
    local isTouch = false
    local startPos = 0
    local endPos = 0
    local Distance = 0
    MgrTimer.AddRepeat("HomeTouchUpdate",0,function ()
        --Input.multiTouchEnabled = true
        if self.isHideHome then return end
        if MgrUI.IsPopOpen() then return end
        --if MgrUI.IsPopOpenOutSelf("") then return end
        if #self.RoleList <= 1 then return end

        if isTouch == true then
            if Input.touchCount <= 0 then return end

            local t = Input.touches[0]
            if 1 == Input.touchCount then   --单指触摸
                if t.phase == TouchPhase.Began then
                    startPos = 0
                    endPos = 0
                    startPos = t.position
                end

                if t.phase == TouchPhase.Moved then
                    --Distance = Vector2.Distance(Vector2(t.position.x,0), Vector2(startPos.x,0))
                end

                if t.phase == TouchPhase.Ended then
                    endPos = t.position
                    --Distance = Vector2.Distance(Vector2(endPos.x,0), Vector2(startPos.x,0))
                    if startPos == 0 then
                        Distance = 0
                    else
                        Distance = endPos.x - startPos.x
                    end
                    if math.abs(Distance) < touchDistance then
                        startPos = 0
                        endPos = 0
                        return
                    else
                        self.IsSwitchAni = true
                    end
                    if Distance > 0 then
                        --向右滑动
                        if self.curRoleIndex < #self.RoleList then
                            self.curRoleIndex = self.curRoleIndex + 1
                        else
                            self.curRoleIndex = 1
                        end
                        MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
                        UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",self.curRoleIndex .. "_" .. self.RoleList[self.curRoleIndex])
                        --允许打开播放动画界面
                        SkinControl.SetOpenAni(true)
                        --根据当前储存的数字刷新spine
                        self:RefreshSpine()
                    else
                        --向左滑动
                        if self.curRoleIndex == 1 then
                            self.curRoleIndex = #self.RoleList
                        else
                            self.curRoleIndex = self.curRoleIndex - 1
                        end
                        MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
                        UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",self.curRoleIndex .. "_" .. self.RoleList[self.curRoleIndex])
                        --允许打开播放动画界面
                        SkinControl.SetOpenAni(true)
                        --根据当前储存的数字刷新spine
                        self:RefreshSpine()
                    end
                    startPos = 0
                    endPos = 0
                    self.IsSwitchAni = false
                end
            end
        end

        if isTouch == false then
            --电脑鼠标触控
            if Input.GetMouseButtonDown(0) then
                startPos = 0
                endPos = 0
                startPos = Input.mousePosition
            end

            if Input.GetMouseButtonUp(0) then
                endPos = Input.mousePosition
                --local value = endPos - startPos
                if startPos == 0 then
                    Distance = 0
                else
                    Distance = endPos.x - startPos.x
                end

                if  math.abs(Distance) < touchDistance then
                    startPos = 0
                    endPos = 0
                    return
                else
                    self.IsSwitchAni = true
                end
                if Distance > 0 then
                    --向右滑动
                    if self.curRoleIndex < #self.RoleList then
                        self.curRoleIndex = self.curRoleIndex + 1
                    else
                        self.curRoleIndex = 1
                    end
                    MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
                    UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",self.curRoleIndex .. "_" .. self.RoleList[self.curRoleIndex])
                    --允许打开播放动画界面
                    SkinControl.SetOpenAni(true)
                    --根据当前储存的数字刷新spine
                    self:RefreshSpine()
                else
                    --向左滑动
                    if self.curRoleIndex == 1 then
                        self.curRoleIndex = #self.RoleList
                    else
                        self.curRoleIndex = self.curRoleIndex - 1
                    end
                    MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
                    UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",self.curRoleIndex .. "_" .. self.RoleList[self.curRoleIndex])
                    --允许打开播放动画界面
                    SkinControl.SetOpenAni(true)
                    --根据当前储存的数字刷新spine
                    self:RefreshSpine()
                end
                startPos = 0
                endPos = 0
                self.IsSwitchAni = false
            end
        end
    end)
end

function M:ChangeHomeRoleList()
    self:InitHomeRoleList()
    self:RefreshSpine()
end

--初始化主界面看板娘列表
function M:InitHomeRoleList()
    --看板娘列表
    self.RoleList = {}
    self.curRoleIndex = 1 -- 当前选择的看板娘索引
    local isNew = UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "HomeUISelectRoles")
    if isNew ~= nil and isNew ~= "" then
        local str = string.split(isNew,',')
        for i, v in ipairs(str) do
            local t = string.split(v,'_')
            self.RoleList[tonumber(t[1])] = tonumber(t[2])
        end
    end

    local t = UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole")
    local s = string.split(t,'_')
    self.curRoleIndex = tonumber(s[1])
end

--初始化左上角活动
function M:InitActiveEvent()
    local tab = {}
    local datas = ActivityControl.GetAllActivityData()
    for index, value in pairs(datas) do
        if value.MainIcon ~= "0" and value.timeType ~= 999 then
            table.insert(tab,value)
        end
    end
    for k, v in pairs(tab) do
        local t = GameObject.Instantiate(self.EventPrefab().gameObject,self.EventContent().transform,false)
        table.insert(self.leftActivityData,{v,t})
        t:SetActive(true)
        local txt = t.transform:Find("closetime").transform:Find("EventText_sysj").transform:GetComponent("TextMeshProUGUI")
        local click =  t.transform:GetComponent("Image")
        local icon = t.transform:Find("Event").transform:GetComponent("Image")
        --活动时间
        --local endTime = TimeLocalData.tab[v[5]][7]
        --local tEndTime = string.split(endTime,'-')
        local tEndTime = v.battleEnd_Stamp --Global.GetTimeByStr(endTime)
        local serverTime = MgrNet.GetServerTime()
        local remainTime = tEndTime - serverTime

        if remainTime / (3600*24) >= 1 then
            ---剩余天数
            txt.text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..math.modf(remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
        elseif remainTime <= 0 then
            --活动结束
            txt.text = MgrLanguageData.GetLanguageByKey("assetsscrollitem_tips2")
        else
            ---剩余小时数
            local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
            txt.text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
        end
        --活动icon
        MgrRes.LoadSprite(icon,"NoticeIcon/"..v.MainIcon,nil,true)

        --添加跳转
        UIEvent.LuaClick(click.gameObject, function ()
            if v.endTime_Stamp <= MgrNet.GetServerTime() then
                --print("活动时间结束")
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_tips1"),1},true)
                return
            end
            local tLinkMark = v.MainLink
            ---跳转到对应界面
            MgrLink.LinkStart(tLinkMark)
        end)
    end
end
--检测左上角活动时间是否结束
function M:CheckIsActivityEnd()
    for index, value in ipairs(self.leftActivityData) do
        local eTime = Global.GetTimeByStr(value[1].endTime)
        if eTime < MgrNet.GetServerTime() and value[2] ~= nil and value[2].transform ~= nil and value[2].transform.gameObject ~= nil then
            value[2].transform.gameObject:SetActive(false)
        end
    end
end

function M:OnShowFinish()
    MgrUI.PopHide(UID.ChargeLoading_UI);
    self.Btn_Master().gameObject:SetActive(false);
    PVPViewModel.SendGetChampionMatchReq(0, nil, function()
        if PVPViewModel.MasterIsOpen() then
            self.Btn_Master().gameObject:SetActive(true);
        else
            self.Btn_Master().gameObject:SetActive(false);
        end
    end);
    -- 检查剧情回放红点
    PlotViewModel.CheckReviewRedDot();
    --获取拉新数据
    InviteControl.GetInviteDataReq()
end

function M:OnBackShow()
    StormViewModel.CurPointData = nil
    self:InitHomeRoleList()
    self:RandomHomeRole()
    ---刷新spine
    self:RefreshSpine()
    
    self:InitAutoBanner()
    ---刷新体力
    self:ChangeWallet()
    --屏幕看板娘切换触控
    self:TouchUpdate()
    ---引导中不播放动画
    if NoviceViewModel.Noviceing == true then
        self.Ani().gameObject.transform:GetComponent("Animation"):Stop()
    else
        self.Ani().gameObject.transform:GetComponent("Animation"):Play()
    end

    -----夏活预热
    --SummerControl.OpenXiahuoYure()
    HomeViewModel.CheckPackagesPop()
end

---检查教程
function M:CheckNovice()
    ---如果此引导未完成 设置当前为引导中
    if NoviceControl.GroupsIsTrigger(tonumber(SteamLocalData.tab[120001][2])) == false then
        NoviceViewModel.Noviceing = true
    end
    if not NoviceViewModel.Noviceing then
        MessageEvent.Go(EID.NoviceCheck, NoviceViewModel.CheckForce())
    end
end

---初始化选择亲信
function M:InitChooseRole()
    self.CurRoleSort = 1        ---当前排序类型(1稀有度,2取得)
    self.RoleIsRise = false
    ---排序器
    local sorts = {
        [1] = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_quality"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_get")
    }
    local t_sort = self:CreateFilterToggle(sorts, self.PlayerSortToggle().gameObject, self.GearSortToggleGroup().gameObject.transform, Handle(self, function(self, sort, isRise, offset)
        if self.CurRoleSort == sort and self.RoleIsRise == isRise then
            print("重复待处理2")
        end
        self.CurRoleSort = sort
        self.RoleIsRise = isRise
        self:ResetRoleItem(offset)
    end))
    self.PlayerSortToggle().gameObject:SetActive(false)
    ---默认排序
    t_sort[2].isOn = false
    t_sort[1].isOn = false
    t_sort[1].isOn = true
end

---注册滑块监听
function M:RegisterScroll()
    self.PlayerRoleScroll01():SetLuaCellEvent(Handle(self, self.CellItem))

    self.BannerScroll01():SetLuaCellEvent(function(trans, idx)
        trans:GetComponent("UITemplate"):SetData({ self.BannerData[idx] })
    end)
end

---面板娘滑块回调
function M:CellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.CurLoopList[idx], self })
end

---设置面板娘滑动数据
function M:ResetRoleItem(offset)
    ---设置当前Loop数据
    self.CurLoopList = self:GetRoleData(self.CurRoleSort, self.RoleIsRise)
    ---设置Loop数量
    self.PlayerRoleScroll01().totalCount = #self.CurLoopList
    if offset then
        self.PlayerRoleScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    else
        self.PlayerRoleScroll01():RefreshCells()           ---只刷新数据
    end
end

---Img_Genghuanicon按钮旋转
function M:RollIcon()
    MgrTimer.AddRepeat("RollIcon", 0.02, function()
        self.Img_Genghuanicon().transform:Rotate(0, 0, -18)
    end, 10, nil)
end

---设置背景UI
function M:SetBG()
    MgrTimer.Cancel("CheckTime")
    local time = tonumber(os.date("%H", MgrNet.GetServerTime() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
    local a = MgrNet.GetServerTime()
    print(a)
    if time >= 7 and time <= 18 then
        self.DayBg().gameObject:SetActive(true)
        self.WorkHumans().gameObject:SetActive(true)
        self.NightBg().gameObject:SetActive(false)
    else
        self.DayBg().gameObject:SetActive(false)
        self.WorkHumans().gameObject:SetActive(false)
        self.NightBg().gameObject:SetActive(true)
    end
    ---设置计时器判断当前页面是否该变化UI
    MgrTimer.AddRepeat("CheckTime", 600, function()
        ---检测当前是白天还是夜晚来变化UI
        if time >= 7 and time <= 18 then
            self.DayBg().gameObject:SetActive(true)
            self.WorkHumans().gameObject:SetActive(true)
            self.NightBg().gameObject:SetActive(false)
        else
            self.DayBg().gameObject:SetActive(false)
            self.WorkHumans().gameObject:SetActive(false)
            self.NightBg().gameObject:SetActive(true)
        end
    end, -1, nil)
end

--演习红点监听
function M:CheckYanXiRedDot()
    PVPViewModel.GetPvPData(PVPViewModel.type,false,function()
        local restTime = PVPViewModel.bTime + PVPViewModel.Continue_PVP_Separate * PVPViewModel.bCount
        local totalTime = restTime - Global.GetCurTime()
        if totalTime <= 0 and PVPViewModel.bCount ~= 0 then
            RedDotControl.GetDotData("YanXiHome"):SetState(true)
        else
            RedDotControl.GetDotData("YanXiHome"):SetState(false)
        end
    end)
end

function M:OnUpdateUI()
    Event.Add("RefreshCoinCount",Handle(self,self.RefreshCoinCount))
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    Event.Add("OpenPackagesPop", HomeViewModel.OpenPackagesPop)
    --self:SetBG()
    self.Mask().gameObject:SetActive(false)
    ---检查新手教程
    self:CheckNovice()
    ---检查活动红点
    ActivityViewModel.CheckRedDot()
    ---检查是否签到
    if PlayerControl.GetPlayerData().monthSignFlag then
        SignViewModel.Init()
    elseif MgrUI.GetCurUI().Uid == UID.Home_UI then
        MgrTimer.AddDelay("OpenLibaoPop",0.2,function()
            HomeViewModel.OpenPackagesPop()
        end)
        ---月签到后，弹活动签到
        --SummerControl.OpenXiahuoYure()
        --打开播放动画界面
        SkinControl.OpenPlayAnime(PlayerControl.GetPlayerData().HomeRole)
    end

    HomeViewModel.LastBatteryTime = -100
    HomeViewModel.isRoleVoice = true

    ---设置台词Obj
    SkinControl.SetRoleVoiceWordText(self.RoleVoiceWordText(),self.Img_SoundTextBG().gameObject)

    self:CheckYanXiRedDot()
    ---驾驶员红点监听
    RoleCardViewModel.CheckRot()
    ---红点背包
    BagViewModel.CheckBagRot()
    ---检查签到红点
    self:CheckSign()
    ---检查七日签到红点
    self:CheckWeekSign()
    ---检查商城红点
    self:ChecShop()
    ---检查红点
    TaskControl.CheckDotReceived()
    ---检查剧情活动红点
    --EventRaidViewModel.CheckRot()
    ---检查图鉴红点
    IllustrationViewModel.CheckRot()
    ---检查公告红点
    NoticeControl.CheckRedDot()
    --检查回归签到红点
    ActivityControl.CheckSignBackRedDot()

    ---检查奖励红点
    MgrTimer.AddRepeat("CheckPassesReward",0.1,function()
        if TaskControl.CheckPassesRewardReceived_RedDot() then
            MgrTimer.Cancel("CheckPassesReward")
        end
    end,-1,nil)
    ---家园红点
    ArkViewModel.UpdateRedPoint()
    ---清除战斗闲置音频
    MgrSound.ClearFight()
    ---播放大厅BGM
    self:PlayrRoleBGM()
    ---重新载入home场景时 不再去播放语音
    if self.UState ~= UIState.Close then
        PosterGirlViewModel.PlayMainSceneRoleVoice()
    end

    ---初始化头像文本
    self:ChangePlayerInfo()
    -----检查主页面红点
    MgrTimer.AddDelay("RotDot", 0.2, function()
        RedDotControl.CheckRedDotUI("Home", Handle(self, self.RedDotFunc))
        MgrTimer.Cancel("RotDot")
    end)
    MgrTimer.AddDelay("LimitSign_New",0.3,function()
        ---新限时签到
        LimitSign_NewControl.CheckLimitSignRedDot()
    end)
    ---刷新锁UI
    self:RefreshLock()

    ---玩家盾币数量&钻石数量赋值
    self:RefreshCoinCount()
    
    local tActivityData = ActivityControl.GetAllActivityData()
    self.Btn_Activity().gameObject:SetActive(#tActivityData ~= 0)

    ---增加一个计时器，凌晨五点清理任务数据
    MgrTimer.Cancel("TaskClearClock")
    TaskControl.FreshTime = Global.GetCurTime() - 5 * 3600  --刷新时间要加5个小时
    MgrTimer.AddRepeat("TaskClearClock", 1, function()
        TaskControl.FreshTime = TaskControl.FreshTime + 1
        if TaskControl.FreshTime % 86400 == 0 then
            --self:ClearAllTaskData()
            ---跨天后七日的签到状态重置
            PlayerControl.SetWeekSignState(false)
        end
    end, -1, nil)
    if SysLockControl.CheckSysLock(1510) and PassportControl.GetIsInMiddle() then
        self.Btn_Passport().gameObject:SetActive(true)
    else
        self.Btn_Passport().gameObject:SetActive(false)
    end

    --if SummerControl.GetLoginState() then
    --    ---夏活预热
    --    SummerControl.OpenXiahuoYure()
    --end

    local skinData = HeroControl.GetSkinDataBySkinId(PlayerControl.GetPlayerData().HomeRole)
    if skinData then
        --检测ASMR
        self:CheckAsmr(skinData)
    end

    --检测左上角活动时间是否结束
    self:CheckIsActivityEnd()

    self:InitLibaoButton()
    ---礼包按钮时间刷新
    self:FreshLiBaoButtonTime()
end

--更具角色播放不同的主界面BGM
function M:PlayrRoleBGM()
    local skinData = HeroControl.GetSkinDataBySkinId(PlayerControl.GetPlayerData().HomeRole)
    local tSkinId = PlayerControl.GetPlayerData().HomeRole
    if skinData then
        tSkinId = skinData.id
    end
    MgrSound.PlayBGM(RoleuiskinLocalData.tab[tSkinId].bgm, 0.2)
end

---刷新玩家货币
function M:RefreshCoinCount()
    local bag = ItemControl.GetAllItems()
    --self.Text_ShieldCoinCount().text = bag[100001] and bag[100001].count or 0
    local ShieldCoinCount
    ShieldCoinCount = JNStrTool.numberAbbr(bag[100001].count)
    self.Text_ShieldCoinCount().text = JNStrTool.numberAbbr(bag[100001] and  bag[100001].count or 0)
    self.Text_DiamondsCount().text = JNStrTool.numberAbbr(bag[100000] and bag[100000].count or 0)
end

---刷新锁
function M:RefreshLock()
    ---驾驶员锁
    if SysLockControl.CheckSysLock(1000) then
        self.RoleLock().gameObject:SetActive(false)
        self.Img_RoleIcon().gameObject:SetActive(true)
    else
        self.RoleLock().gameObject:SetActive(true)
        self.Img_RoleIcon().gameObject:SetActive(false)
    end
    ---演习解锁
    if SysLockControl.CheckSysLock(1200) then
        self.PVPLock().gameObject:SetActive(false)
        --self.Text_Yanxi().transform:GetComponent("TextMeshProUGUI").color = Color(1,1,1,1)
    else
        self.PVPLock().gameObject:SetActive(true)
        -- self.Text_Yanxi().transform:GetComponent("TextMeshProUGUI").color = Color(1,1,1,0.5)
    end
    ---方舟锁
    if SysLockControl.CheckSysLock(1600) then
        self.ArkLock().gameObject:SetActive(false)
        self.Img_ArkIcon().gameObject:SetActive(true)
    else
        self.ArkLock().gameObject:SetActive(true)
        self.Img_ArkIcon().gameObject:SetActive(false)
    end
    ---图鉴锁
    if SysLockControl.CheckSysLock(2003) then
        self.AtlasLock().gameObject:SetActive(false)
        self.Img_AtlasIcon().gameObject:SetActive(true)
    else
        self.AtlasLock().gameObject:SetActive(true)
        self.Img_AtlasIcon().gameObject:SetActive(false)
    end
    ---好友锁
    --local IsSocialLock = false  ---社群锁(true 解锁 false 未解锁)
    --if SysLockControl.CheckSysLock(1700) then
    --    --self.FriendLock().gameObject:SetActive(false)
    --    --self.Img_FriendIcon().gameObject:SetActive(true) 
    --
    --    IsSocialLock = true
    --else
    --    self.FriendLock().gameObject:SetActive(true)
    --    self.Img_FriendIcon().gameObject:SetActive(false)
    --end
    ---公会锁
    if SysLockControl.CheckSysLock(1701) then
        self.GuildLock().gameObject:SetActive(false)
        --self.Img_GuildIcon().gameObject:SetActive(true)

        IsSocialLock = true
    else
        self.GuildLock().gameObject:SetActive(true)
        --self.Img_GuildIcon().gameObject:SetActive(false)
    end
    -----社群锁
    --if IsSocialLock then
    --    --self.SocialLock().gameObject:SetActive(false)
    --    --self.Img_SocialIcon().gameObject:SetActive(true)
    --else
    --    self.SocialLock().gameObject:SetActive(true)
    --    self.Img_SocialIcon().gameObject:SetActive(false)
    --end
    ---补给锁
    if SysLockControl.CheckSysLock(1300) then
        self.SupplyLock().gameObject:SetActive(false)
        self.Img_SupplyIcon().gameObject:SetActive(true)
    else
        self.SupplyLock().gameObject:SetActive(true)
        self.Img_SupplyIcon().gameObject:SetActive(false)
    end
    ---商店锁
    if SysLockControl.CheckSysLock(1500) then
        self.ShopLock().gameObject:SetActive(false)
        self.Img_ShopIcon().gameObject:SetActive(true)
    else
        self.ShopLock().gameObject:SetActive(true)
        self.Img_ShopIcon().gameObject:SetActive(false)
    end
    ---背包锁
    if SysLockControl.CheckSysLock(1900) then
        self.BagLock().gameObject:SetActive(false)
        self.Img_BagIcon().gameObject:SetActive(true)
    else
        self.BagLock().gameObject:SetActive(false)
        self.Img_BagIcon().gameObject:SetActive(true)
    end
    -----任务锁
    --if SysLockControl.CheckSysLock(1400) then
    --    --self.TaskLock().gameObject:SetActive(false)
    --    --self.Img_TaskIcon().gameObject:SetActive(true)
    --else
    --    self.TaskLock().gameObject:SetActive(false)
    --    self.Img_TaskIcon().gameObject:SetActive(true)
    --end
end


---检查签到
function M:CheckSign()
    if PlayerControl.GetPlayerData().monthSignFlag then
        RedDotControl.GetDotData("Sign"):SetState(true)
    else
        RedDotControl.GetDotData("Sign"):SetState(false)
    end
end
---检查七日签到
function M:CheckWeekSign()
    local tday = Global.GetCreateRoleDays()
    local tIsSignFull = false
    SignViewModel.WeekSignData,tIsSignFull = PlayerControl.GetWeekSignData()
    ---如果创角时间超过七日签到的长度,则隐藏
    if tday > tonumber(SteamLocalData.tab[111009][2]) or tIsSignFull then
        return
    end
    if not tIsSignFull and not PlayerControl.GetWeekSignState() then
        RedDotControl.GetDotData("WeekSign"):SetState(true)
    else
        RedDotControl.GetDotData("WeekSign"):SetState(false)
    end
end

--检查商城红点
function M:ChecShop()
    local isShow = false
    for k,v in pairs(ShopViewModel.GetShopHomeList()) do
        if v.id == 102 then
            local list = ShopViewModel.SortItemData(v)
            for index, value in ipairs(list) do
                if value:IsShowRedDot() then
                    isShow = true
                    break
                end
            end
            break
        end
    end
    RedDotControl.GetDotData("Shop"):SetState(isShow)
end

---红点检查
function M:RedDotFunc()
    if self.ObjRoot == nil then
        return
    end
    local tModuleShequnState = false
    for i, v in pairs(RedDotControl.GetDotData("Home").childNodeData) do
        if v.name == "Passes" then
            if v.State and SysLockControl.CheckSysLock(1510) == true then --并且通行证已解锁
                self.PassportRedDotIcon().gameObject:SetActive(true)
            else
                self.PassportRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "NoviceTask" then
            if v.State then
                self.NoviceRedDotIcon().gameObject:SetActive(true)
            else
                self.NoviceRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "EventRaidTask" then
            if v.State then
                self.EventRedDotIcon().gameObject:SetActive(true)
            else
                self.EventRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Task" then
            if v.State then
                self.TaskRedDotIcon().gameObject:SetActive(true)
            else
                self.TaskRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Mail" then
            if v.State then
                self.MailRedDotIcon().gameObject:SetActive(true)
            else
                self.MailRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Dex" then
            if v.State then
                self.DexRedDotIcon().gameObject:SetActive(true)
            else
                self.DexRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Role" then
            if v.State then
                self.RoleRedDotIcon().gameObject:SetActive(true)
            else
                self.RoleRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Bag" then
            if v.State then
                self.BagRedDotIcon().gameObject:SetActive(true)
            else
                self.BagRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "WeekSign" then
            if v.State then
                self.WeekSignRedDotIcon().gameObject:SetActive(true)
            else
                self.WeekSignRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Friend" then
            if v.State then
                if SysLockControl.CheckSysLock(1700) then
                    self.FriendRedDotIcon().gameObject:SetActive(true)
                    tModuleShequnState = true
                else
                    self.FriendRedDotIcon().gameObject:SetActive(false)
                end
            else
                self.FriendRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Ark" then
            if v.State then
                if SysLockControl.CheckSysLock(1600) then
                    self.ArkRedDotIcon().gameObject:SetActive(true)
                else
                    self.ArkRedDotIcon().gameObject:SetActive(false)
                end
            else
                self.ArkRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "ScrollBox" then
            if v.State then
                self.PVERedDotIcon().gameObject:SetActive(true)
            else
                self.PVERedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "YanXiHome" then
            if v.State then
                self.PVPRedDotIcon().gameObject:SetActive(true)
            else
                self.PVPRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Notice" then
            if v.State then
                self.NoticeRedDotIcon().gameObject:SetActive(true)
            else
                self.NoticeRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Activity" then
            if v.State then
                self.ActivityRedDotIcon().gameObject:SetActive(true)
            else
                self.ActivityRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "Sign" then
            if v.State then
                self.ActivityRedDotIcon().gameObject:SetActive(true)
            else
                self.ActivityRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "PlotReview" then
            if v.State then
                self.PlotReviewRedDot().gameObject:SetActive(true)
            else
                self.PlotReviewRedDot().gameObject:SetActive(false)
            end
        elseif v.name == "Shop" then
            if v.State then
                self.ShopRedDotIcon().gameObject:SetActive(true)
            else
                self.ShopRedDotIcon().gameObject:SetActive(false)
            end
        end
    end
    ---社群红点
    if tModuleShequnState then
        --self.SocialRedDotIcon().gameObject:SetActive(true)
    else
        --self.SocialRedDotIcon().gameObject:SetActive(false)
    end
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    -----重置角色语音
    --HomeViewModel.ResetSingleVoiceAudio()
    PosterGirlViewModel.ResetSingleVoiceAudio()
    if self.CurRoleItem then
        self.CurRoleItem.isSelect = false
        self.CurRoleItem.isSelect = nil
    end
    self.Btn_PVE().gameObject:SetActive(true)
    MgrTimer.Cancel("TiliClick")
    MgrTimer.Cancel("TiLiClock")
    MgrTimer.Cancel("Banner")
    MgrTimer.Cancel("HomeTouchUpdate")
    MgrTimer.Cancel("OpenLibaoPop")
    MgrTimer.Cancel("LimitSign_New")
    RedDotControl.ClearFunc("Home")
end

---注册点击事件
function M:InitClick()
    ---是否带UI截屏
    self.withUI = false
    ---点击隐藏主界面UI只保留立绘
    --UIEvent.LuaClick(self.Btn_Hide().gameObject, Handle(self, function()
    --    --self.Btn_Fenxiang().gameObject:SetActive(true)
    --    --self.UIPanel().gameObject:SetActive(false)
    --    self.BlurMask2().gameObject:SetActive(false)
    --    self.Img_SoundTextBG().gameObject:SetActive(false)
    --    PosterGirlViewModel.isRoleVoice = false
    --    --self.Btn_RestoreUI().gameObject:SetActive(true)
    --    self.Btn_Show().gameObject:SetActive(true)
    --    --self.FenxiangPanel().gameObject:SetActive(true) --隐藏分享界面
    --    SysNoticeControl.Hide()
    --    self.isHideHome = true
    --end))
    UIEvent.LuaClick(self.Btn_Hide().gameObject, Handle(self, function()
        self.Btn_Hide().gameObject:SetActive(false)
        self.Btn_Chakan().gameObject:SetActive(false)
        self.ScalePanel().gameObject:SetActive(false)
        self.ShowMask().gameObject:SetActive(true)
    end))
    UIEvent.LuaClick(self.ShowMask().gameObject, Handle(self, function()
        self.Btn_Hide().gameObject:SetActive(true)
        self.Btn_Chakan().gameObject:SetActive(true)
        self.ScalePanel().gameObject:SetActive(true)
        self.ShowMask().gameObject:SetActive(false)
    end))
    --查看立绘
    UIEvent.LuaClick(self.Btn_Chakan().gameObject, function()
        self.UIPanel().gameObject:SetActive(not self.UIPanel().gameObject.activeSelf)
        self.ScalePanel().gameObject:SetActive(not self.UIPanel().gameObject.activeSelf)
        self.Btn_Hide().gameObject:SetActive(not self.UIPanel().gameObject.activeSelf)
        --self.Img_DragBG().gameObject:SetActive(not self.UIPanel().gameObject.activeSelf)
        if not self.UIPanel().gameObject.activeSelf then
            self.isHideHome = true
            self:ScaleUpdate()

            self.Img_SoundTextBG().gameObject:SetActive(false)
            PosterGirlViewModel.isRoleVoice = false
        else
            self.isHideHome = false
            self:ScaleExit(true)
            PosterGirlViewModel.isRoleVoice = true
        end
    end)
    ---缩放滑条
    Tools.OnSliderValueChange(self.Slider_Scale(),function(float)
        if not self.SliderChange then
            return
        end
        if float < self.MinScale then
            float = self.MinScale
        elseif float > self.MaxScale then
            float = self.MaxScale
        end
        local _Scale = Vector3(float,float,float)

        self:SetScale(_Scale)
    end)
    ---重置比例
    UIEvent.LuaClick(self.Btn_Reset().gameObject,function()
        self:ScaleExit(false)
    end)
    ---点击截图分享(不带UI)
    UIEvent.LuaClick(self.Btn_Fenxiang().gameObject,function()
        CMgrUI.Instance:CloseClickRoot()
        self.Btn_Fenxiang().gameObject:SetActive(false)
        self.Logo_UIDPanel().gameObject:SetActive(true)
        self.logo2().gameObject:SetActive(false)
        self.logo().gameObject:SetActive(true)
        self.withUI = false
        self:CaptureScreenshot(self.Jietu(),Handle(self,function()
            self:CloseShare(true)
            self.Logo_UIDPanel().gameObject:SetActive(false)
        end))
    end)
    ---点击截图分享(带UI)
    UIEvent.LuaClick(self.Btn_ShareUI().gameObject,function()
        CMgrUI.Instance:CloseClickRoot()
        self.Logo_UIDPanel().gameObject:SetActive(true)
        self.FenxiangPanel().gameObject:SetActive(true)
        self.Btn_Fenxiang().gameObject:SetActive(false)
        self.BlurMask2().gameObject:SetActive(false)
        self.SharePanel().gameObject:SetActive(false)
        self.logo2().gameObject:SetActive(false)
        self.logo().gameObject:SetActive(true)
        self.withUI = true
        self:CaptureScreenshot(self.Jietu(),Handle(self,function()
            self:CloseShare(true)
            self.Logo_UIDPanel().gameObject:SetActive(false)
        end))
    end)
    ---点击打开分享选择弹窗
    UIEvent.LuaClick(self.Btn_Share().gameObject,Handle(self,function()
        self:VFXOFF()
        self.SharePanel().gameObject:SetActive(true)
    end))
    ---点击关闭分享选择弹窗
    UIEvent.LuaClick(self.shareMask().gameObject,function()
        self:VFXON()
        self.SharePanel().gameObject:SetActive(false)
    end)

    ---分享关闭按钮
    UIEvent.LuaClick(self.BlurMask2().gameObject,function()
        self.Module().gameObject:SetActive(true)
        self.logo2().gameObject:SetActive(true)
        self.logo().gameObject:SetActive(true)
        self:CloseShare(false)
        self.Logo_UIDPanel().gameObject:SetActive(false)
        self.Btn_Fenxiang().gameObject:SetActive(self.withUI == false)
        CMgrUI.Instance:OpenClickRoot()
    end)

    ---保存到相簿
    UIEvent.LuaClick(self.Btn_XB().gameObject,function()
        self:SaveToLocal()
    end)
    ---FaceBook分享图片
    UIEvent.LuaClick(self.Btn_FB2().gameObject,function()
        self:FBSharePicture()
    end)
    ---FaceBook分享链接
    UIEvent.LuaClick(self.Btn_FB().gameObject,function()
        self.SharePanel().gameObject:SetActive(false)
        if NoviceControl.GetNoviceState(99999) then
            Tools.OpenUrl("https://www.facebook.com/hazereverb/")
        else
            self:FBShare()
        end
    end)
    UIEvent.LuaClick(self.Btn_Jiaru().gameObject,function()
        Tools.OpenUrl("https://www.facebook.com/hazereverb/")
        self.FBPanel().gameObject:SetActive(false)
        ---通知服务器已加入社群
        NoviceControl.ChangeCurNovice(99999,function() NoviceControl.ChangeNoviceState(99999) end)
    end)
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        self.FBPanel().gameObject:SetActive(false)
    end)
    ---Line分享图片
    UIEvent.LuaClick(self.Btn_LINE().gameObject,function()
        self:LineSharePicture()
    end)
    ---分享Line链接
    UIEvent.LuaClick(self.Btn_Line().gameObject,function()
        self.SharePanel().gameObject:SetActive(false)
        if NoviceControl.GetNoviceState(99997) then
            Tools.OpenUrl("https://line.me/ti/g2/HLES3FK6gFC1rz1jgC4BVzRSEmzszBWWn40pMA?utm_source=invitation&utm_medium=link_copy&utm_campaign=default")
        else
            self:LineShare()
        end
    end)
    UIEvent.LuaClick(self.Btn_Jiaru02().gameObject,function()
        Tools.OpenUrl("https://line.me/ti/g2/HLES3FK6gFC1rz1jgC4BVzRSEmzszBWWn40pMA?utm_source=invitation&utm_medium=link_copy&utm_campaign=default")
        self.FBPanel().gameObject:SetActive(false)
        ---通知服务器已加入社群
        NoviceControl.ChangeCurNovice(99997,function() NoviceControl.ChangeNoviceState(99997) end)
    end)
    ---分享Discord链接
    UIEvent.LuaClick(self.Btn_Discord().gameObject,function()
        self.SharePanel().gameObject:SetActive(false)
        if NoviceControl.GetNoviceState(99998) then
            Tools.OpenUrl("https://discord.gg/ayf9Xp7d37")
        else
            self:DiscordShare()
        end
    end)
    UIEvent.LuaClick(self.Btn_Jiaru01().gameObject,function()
        Tools.OpenUrl("https://discord.gg/ayf9Xp7d37")
        self.FBPanel().gameObject:SetActive(false)
        ---通知服务器已加入社群
        NoviceControl.ChangeCurNovice(99998,function() NoviceControl.ChangeNoviceState(99998) end)
    end)


    ---点击还原UI
    --UIEvent.LuaClick(self.Btn_RestoreUI().gameObject, Handle(self, function()
    --    self:UIPanel().gameObject:SetActive(true)
    --    self.Btn_RestoreUI().gameObject:SetActive(false)
    --    self.Btn_Show().gameObject:SetActive(false)
    --    self.FenxiangPanel().gameObject:SetActive(false)
    --    SysNoticeControl.Show()
    --end))
    UIEvent.LuaClick(self.Btn_Show().gameObject, Handle(self, function()
        --self:UIPanel().gameObject:SetActive(true)
        --self.Btn_RestoreUI().gameObject:SetActive(false)
        PosterGirlViewModel.isRoleVoice = true
        self.Btn_Show().gameObject:SetActive(false)
        self.FenxiangPanel().gameObject:SetActive(false)
        SysNoticeControl.Show()
        MgrTimer.AddDelayNoName(0.5, function()
            self.isHideHome = false
        end, nil)
    end))
    ---设置按钮注册事件
    UIEvent.LuaClick(self.Btn_Setting().gameObject, Handle(self, function()
        MgrTimer.Cancel("HomeTouchUpdate")
        local tShowPage = { 7, 1, 2, 4, 6 }
        if MgrSdk.GetPlatform() == "1" then
            tShowPage = { 1, 2, 4, 6 }
        end
        MgrUI.Pop(UID.SettingPop_UI, { tShowPage, function()
            HomeViewModel.isRoleVoice = true
            self:TouchUpdate()
        end }, true)
    end))
    ---跳转驾驶员
    UIEvent.LuaClick(self.Btn_Role().gameObject, Handle(self, function()
        PosterGirlViewModel.PlayRoleVoice(29)
        HomeViewModel.OpenCollection()
    end))
    ---跳转战役（pve）
    UIEvent.LuaClick(self.Btn_PVE().gameObject, Handle(self, function()
        ---隐藏红点
        MgrTimer.AddDelayNoName(0.05, function()
            self:HideVFX()
        end, nil)
        PosterGirlViewModel.PlayRoleVoice(27)
        HomeViewModel.OpenChoose(true)
    end))
    ---跳转作战演习（PVP）
    UIEvent.LuaClick(self.Btn_PVP().gameObject, Handle(self, function()
        HomeViewModel.OpenExercise(function()
            if NoviceControl.GroupsIsTrigger(45) then
                PosterGirlViewModel.PlayRoleVoice(28)
            else
                MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
            end
        end)
    end))
    ---跳转商店充值
    UIEvent.LuaClick(self.Btn_AddDiamonds01().gameObject, Handle(self, function ()
        MgrUI.Pop(UID.ExchangePop_UI,{ tonumber(SteamLocalData.tab[113042][2]), 0, "shop" })
    end))

    ---跳转商店货币(根据策划需求暂时关闭)
    --UIEvent.LuaClick(self.Btn_AddShieldCoin().gameObject, Handle(self, function () MgrLink.LinkStart({"tz","sc","wzbc","01"}) end))

    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCoinCount()
        end}, true)
    end))

    ---跳转商店
    UIEvent.LuaClick(self.Btn_Shop().gameObject, Handle(self, function()
        if NoviceControl.GroupsIsTrigger(43) then
            PosterGirlViewModel.PlayRoleVoice(32)
        else
            MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
        end
        HomeViewModel.OpenShop()
    end))

    ---跳转好友
    UIEvent.LuaClick(self.Btn_Friend().gameObject, Handle(self, function()
        if SysLockControl.CheckSysLock(1700) then
            HomeViewModel.OpenFriend()

            --self.Img_Social().gameObject:SetActive(false)
            --self.ShequnPanel().gameObject:SetActive(false)
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1700),1},true)
        end
    end))

    ---跳转方舟
    UIEvent.LuaClick(self.Btn_Home().gameObject, Handle(self, function()
        HomeViewModel.OpenArk()
    end))


    ---跳转补给
    UIEvent.LuaClick(self.Btn_Supply().gameObject, Handle(self, function()
        if SysLockControl.CheckSysLock(1300) then
            PosterGirlViewModel.PlayRoleVoice(math.random(30, 31))
            HomeViewModel.OpenRoleCardDraw()
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1300),1},true)
        end
    end))

    ---跳转任务
    UIEvent.LuaClick(self.Btn_Task().gameObject, Handle(self, function()
        HomeViewModel.OpenTask()
    end))

    ---跳转背包
    UIEvent.LuaClick(self.Btn_Bag().gameObject, Handle(self, function()
        PosterGirlViewModel.PlayRoleVoice(37)
        HomeViewModel.OpenPlayerBag()
    end))

    ---跳转邮件
    UIEvent.LuaClick(self.Btn_Mail().gameObject, Handle(self, function()
        if NoviceControl.GroupsIsTrigger(tonumber(SteamLocalData.tab[120001][2])) then
            PosterGirlViewModel.PlayRoleVoice(35)
        else
            MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
        end
        MailControl.Clear()
        MailControl.EmailDataClick(function()
            ---锁屏幕
            MgrUI.Lock("OpenMail")
            PostMailViewModel.Init()
            --HomeViewModel.OpenMail()
        end)
    end))

    ---点击角色
    UIEvent.LuaClick(self.RoleSpineClickArea().gameObject, Handle(self, self.OnRoleSpineClick))

    ---点击图鉴
    UIEvent.LuaClick(self.Btn_Atlas().gameObject, Handle(self, function()
        if not SysLockControl.CheckSysLock(2003) then
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(2003), 1 }, true)
            return
        end
        ---隐藏红点
        MgrTimer.AddDelayNoName(0.05, function()
            self:HideVFX()
        end, nil)

        --NoviceViewModel.CompleteIDMap[30206]
        if NoviceControl.GroupsIsTrigger(42) then
        else
            MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
        end
        self.Mask().gameObject:SetActive(true)
        HomeViewModel.OpenIllustration()
    end))

    ---点击玩家面板
    UIEvent.LuaClick(self.Player().gameObject, Handle(self, function()
        HomeViewModel.OpenPlayerAvatar()
    end))

    ---点击呼出更换亲信面板
    UIEvent.LuaClick(self.Btn_SwitchRole().gameObject, Handle(self, function()
        -- MgrTimer.AddDelayNoName(0.4, function()
        --     self.ChoosePlayerRole().gameObject:SetActive(true)
        --     self:VFXOFF()
        -- end, nil)

        -- ---默认衣服状态
        -- --PosterGirlViewModel.CurClothes = PosterGirlViewModel.ClothesType.wear
        -- ---初始化当前选择角色
        -- for k, v in pairs(self:GetRoleData(self.CurRoleSort, self.RoleIsRise)) do
        --     if v.id == PlayerControl.GetPlayerData().curRoleID then
        --         self.CurRoleItem = v
        --         self.CurRoleItem.isSelect = true
        --     end
        -- end
        -- ---初始化更换按钮状态
        -- if self.CurRoleItem.id ~= PlayerControl.GetPlayerData().curRoleID then
        --     self.Btn_UnGenghuan().gameObject:SetActive(false)
        --     self.Btn_Genghuan().gameObject:SetActive(true)
        -- else
        --     self.Btn_UnGenghuan().gameObject:SetActive(true)
        --     self.Btn_Genghuan().gameObject:SetActive(false)
        -- end
        -- self:ResetRoleItem(0)
        -- self:RollIcon()

        --MgrUI.Pop(UID.ChooseRolePop_UI)
        MgrUI.GoHide(UID.ChooseSkin_UI)
    end))

    ---更换亲信
    UIEvent.LuaClick(self.Btn_Genghuan().gameObject, Handle(self, function()
        if self.CurRoleItem.id == PlayerControl.GetPlayerData().curRoleID then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips1"), 2 }, true)
            return
        end
        PlayerAvatarViewModel.ChooseMenuRoleClick(self.CurRoleItem.id, Handle(self, self.ChooseMenuRoleACK), Handle(self, self.ChooseMenuRoleNTF))
        self:VFXON()
        RedDotControl.CheckRedDotUI("Home", Handle(self, self.RedDotFunc))
    end))

    ---点击更换亲信面板空白区域
    UIEvent.LuaClick(self.zhezhao().gameObject, Handle(self, Handle(self, function()
        self.ChoosePlayerRole().gameObject:SetActive(false)
        if self.CurRoleItem then
            self.CurRoleItem.isSelect = false
            self.CurRoleItem.isSelect = nil
        end
        self:VFXON()
        RedDotControl.CheckRedDotUI("Home", Handle(self, self.RedDotFunc))
    end)))

    ---点击更换亲信面板返回按钮
    UIEvent.LuaClick(self.Btn_ChooseRoleBack().gameObject, Handle(self, Handle(self, function()
        self.ChoosePlayerRole().gameObject:SetActive(false)
        if self.CurRoleItem then
            self.CurRoleItem.isSelect = false
            self.CurRoleItem.isSelect = nil
        end
        self:VFXON()
        RedDotControl.CheckRedDotUI("Home", Handle(self, self.RedDotFunc))
    end)))


    ---点击通行证
    UIEvent.LuaClick(self.Btn_Passport().gameObject, Handle(self, Handle(self, function()
        ---如果未解锁
        if SysLockControl.CheckSysLock(1510) == false then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1510),1},true)
            return
        end
        ---如果在活动时间内
        if PassportControl.GetIsInMiddle() then
            MgrUI.GoHide(UID.Passes_UI)
        else
            PassportControl.ClearPassportData()
            local callBack = function()
                local startTime = TimeControl.GetTimeTable(ActivityLocalData.tab[PassportControl.GetPassportData().activityId][5]).openTime
                local endTime = TimeControl.GetTimeTable(ActivityLocalData.tab[PassportControl.GetPassportData().activityId][5]).endTime
                local inMiddle = Global.isMiddleTime(startTime, endTime)
                if PassportControl.GetPassportData() and inMiddle then
                    MgrUI.GoHide(UID.Passes_UI)
                else
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips2"), 2 }, true)
                end
            end
            ActivityControl.PushData(callBack)
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips2"), 2 }, true)
        end
    end)))

    ---活动界面入口
    UIEvent.LuaClick(self.Btn_Activity().gameObject, Handle(self, Handle(self, function()
        ActivityControl.OpenHuoDong()
        MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
    end)))
    UIEvent.LuaClick(self.BtnPlotReview().gameObject, Handle(self, Handle(self, function()
        MgrUI.GoHide(UID.PlotReviewScroll_UI);
    end)))
    ---公会入口
    UIEvent.LuaClick(self.Btn_Union().gameObject, Handle(self, Handle(self, function()
        GuildControl.OpenGuildUI()
        --self.Img_Social().gameObject:SetActive(false)
        --self.ShequnPanel().gameObject:SetActive(false)
    end)))
    ---打开社群界面
    -- UIEvent.LuaClick(self.Btn_Social().gameObject, Handle(self, Handle(self, function()
    --     self.Img_Social().transform.sizeDelta = self.Btn_Social().transform.sizeDelta
    --     self.Img_Social().transform.position = self.Btn_Social().transform.position
        
    --     self.Img_Social().gameObject:SetActive(true)
    --     self.ShequnPanel().gameObject:SetActive(true)
    -- end)))
    ---关闭社群界面
    -- UIEvent.LuaClick(self.ShequnPanel().gameObject, Handle(self, Handle(self, function()
    --     self.Img_Social().gameObject:SetActive(false)
    --     self.ShequnPanel().gameObject:SetActive(false)
    -- end)))

    ---长按查看体力
    local isTouch = false
    UIEvent.LuaPressClick(self.Btn_ShowPower().gameObject, Handle(self, function()
        if isTouch then
            return
        end
        isTouch = true
        self.PowerDetail().gameObject:SetActive(true)
        MgrTimer.AddRepeat("TiliClick", 0, function()
            if UIEvent.GetButton_Up() == true then
                MgrTimer.Cancel("TiliClick")
                self.PowerDetail().gameObject:SetActive(false)
                isTouch = false
            end
        end, -1, nil)
    end))

    UIEvent.LuaClick(self.Btn_Notice().gameObject, Handle(self, Handle(self, function()
        NoticeControl.GetNotice(function()
            if #NoticeControl.GetActiveNotice() == 0 and #NoticeControl.GetGameNotice() == 0 then
                MgrUI.Pop(UID.PopTip_UI,{ MgrLanguageData.GetLanguageByKey("ui_gonggao_tishi"),1 },true)
                return
            end
            MgrUI.Pop(UID.GongGaoPop,nil,true)
        end)
        RedDotControl.GetDotData("Notice"):SetState(false)
    end)))
    --UIEvent.LuaClick(self.Btn_Cuozao().gameObject,Handle(self,function()
    --    MgrUI.GoHide(UID.BackRub_UI)
    --end))
    ---广告牌
    --[[
    local Adv = self.Ggcomponet().gameObject:GetComponent("AdvertiseAutoMove")
    local AdvSprcount = Adv.AdvSprList.Count
    local count = AdvSprcount - 2
    if count>0 then
        for i = 1, count do
            local obj = GameObject.Instantiate(self.dianPrefab().gameObject,self.DianScroll().gameObject.transform,false)
            obj:SetActive(true)
        end
    end
    local curIndex = 0
    MgrTimer.AddRepeat("HomeDian",0,function()
        if curIndex~=Adv.CurSprIndex then
            curIndex = Adv.CurSprIndex
            self.dian().transform:SetSiblingIndex(curIndex)
        end
    end,-1,nil)
    ]]

    UIEvent.LuaClick(self.Btn_SwitchTheme().gameObject,function()
        self:RefreshSpine(true)
    end)

    Event.Add("Btn_libao_Open",Handle(self,self.OpenLibao))
    Event.Add("Btn_libao_Close",Handle(self,self.CloseLibao))
    UIEvent.LuaClick(self.Btn_libao().gameObject,function()
        MgrUI.Pop(UID.PackagesPop_UI,HomeViewModel.packageList,true)
    end)
    UIEvent.LuaClick(self.Btn_Master().gameObject, Handle(self, function()
        PVPViewModel.DirectEnterMaster = true;
        HomeViewModel.OpenExercise(function()
            if NoviceControl.GroupsIsTrigger(45) then
                PosterGirlViewModel.PlayRoleVoice(28)
            else
                MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
            end
        end)
    end))
    ---ASMR
    UIEvent.LuaClick(self.Btn_ASMR_Open().gameObject,function()
        self.ASMR_Close().gameObject:SetActive(true)
        self.Btn_ASMR_Open().gameObject:SetActive(false)
    end)
    UIEvent.LuaClick(self.ASMR_Close().gameObject,function()
        self.ASMR_Close().gameObject:SetActive(false)
        self.Btn_ASMR_Open().gameObject:SetActive(true)
    end)
    UIEvent.LuaClick(self.Btn_Skip().gameObject,function()
        --跳过动画
        SkinControl.JumpAnime()
        self:OpenAsmrUI(false)
        self:Btn_Skip().gameObject:SetActive(false)
    end)
    UIEvent.LuaClick(self.Btn_Mask().gameObject, Handle(self, function()
        self.Btn_Skip().gameObject:SetActive(not self.Btn_Skip().gameObject.activeSelf)
    end))
end
function M:OpenLibao()
    self.Btn_libao().gameObject:SetActive(true)
    self:InitLibaoButton()
end
function M:CloseLibao()
    self.Btn_libao().gameObject:SetActive(false)
end
function M:InitLibaoButton()
    if HomeViewModel.Btn_libao_Open then
        self.Btn_libao().gameObject:SetActive(true)
        ---找最早结束的礼包
        local early = 1
        for i,v in pairs(HomeViewModel.packageList) do
            if v.Duration ~= -1 and not v.Status then
                early = i
            end
        end
        for i,v in pairs(HomeViewModel.packageList) do
            if v.endTime <= HomeViewModel.packageList[early].endTime and v.Duration ~= -1 and not v.Status then
                early = i
            end
        end
        ---倒计时
        if HomeViewModel.packageList[early] == nil or (HomeViewModel.packageList[early] ~= nil and HomeViewModel.packageList[early].Duration == -1) then
            self.Btn_libao().gameObject:SetActive(false)
        else
            self.leftTime = HomeViewModel.packageList[early].endTime - MgrNet.GetServerTime()   ---主界面限时礼包倒计时显示时间最短的那个
            if self.leftTime <= 0 then
                self.Text_time().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text49").."  00:00:00"
                self.Btn_libao().gameObject:SetActive(false)
            else
                local hour = math.floor(self.leftTime / 3600)
                local min = math.floor(self.leftTime % 3600 / 60)
                local second = math.floor(self.leftTime % 3600 % 60)
                if hour < 10 then
                    hour = "0"..hour
                end
                if min < 10 then
                    min = "0"..min
                end
                if second < 10 then
                    second = "0"..second
                end
                self.Text_time().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text49").."  "..hour..":"..min..":"..second
            end
            MgrTimer.Cancel("packageTime_Home_UI")
            MgrTimer.AddRepeat("packageTime_Home_UI",1,function()
                if self.leftTime > 0 then
                    self.leftTime = self.leftTime - 1
                    local hour = math.floor(self.leftTime / 3600)
                    local min = math.floor(self.leftTime % 3600 / 60)
                    local second = math.floor(self.leftTime % 3600 % 60)
                    if hour < 10 then
                        hour = "0"..hour
                    end
                    if min < 10 then
                        min = "0"..min
                    end
                    if second < 10 then
                        second = "0"..second
                    end
                    self.Text_time().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text49").."  "..hour..":"..min..":"..second
                else
                end
            end,-1,nil)
        end
    else
        self.Btn_libao().gameObject:SetActive(false)
    end
end
function M:FreshLiBaoButtonTime()
    MgrTimer.AddRepeat("FreshLiBaoButtonTime",1,function()
        local newTable = {}
        local overTime = false
        for i,v in pairs(HomeViewModel.packageList) do
            if (v.endTime < Global.GetCurTime() or v.Status) and v.Duration ~= -1 then
                HomeViewModel.packageList[i] = nil
                UnityEngine.Debug.LogError("yzb清理id为 ".. v.ID .. " 的礼包")
                overTime = true
            end
        end
        for i,v in pairs(HomeViewModel.packageList) do
            if v ~= nil then
                newTable[#newTable + 1] = v
            end
        end
        table.sort(newTable,function(a,b)
            if a.endTime < b.endTime then
                return true
            else
                return false
            end
        end)
        HomeViewModel.packageList = newTable
        if overTime then
            self:InitLibaoButton()
        end
    end,-1,nil)
end
---刷新体力
function M:ChangeWallet()
    if self.ObjRoot == nil then
        return
    end
    ---体力校准
    Global.TiliCalibration()

    self.TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    self.curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_PowerCount().text = self.curTili.."/" .. self.TiliMax
    self:InitClock()
end
---刷新玩家信息()
function M:ChangePlayerInfo()
    ---更新玩家等级
    self.Text_Level().text = PlayerControl.GetPlayerData().level
    ---更新玩家ID
    self.Text_UID().text = MgrLanguageData.GetLanguageByKey("ui_usersid_text").. ":  " .. PlayerControl.GetPlayerData().UID
    ---更新玩家名称
    self.Text_Name().text = PlayerControl.GetPlayerData().nickname
    --是否达到最大等级
    local isLevelMax = PlayerplLocalData.tab[#PlayerplLocalData.tab][2] == PlayerControl.GetPlayerData().level 

    ---新手经验条展示一点
    if (PlayerControl.GetPlayerData().exp == 0) then
        if isLevelMax then 
            self.Img_ExpSlider().fillAmount = 1
        else
            self.Img_ExpSlider().fillAmount = 0.02
        end
    else
        self.Img_ExpSlider().fillAmount = PlayerControl.GetPlayerData().exp / PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][3]
    end
end
---选择亲信点击事件
---@param hero RoleData
function M:RoleItemOnClick(hero)
    if self.CurRoleItem then
        self.CurRoleItem.isSelect = false
        self.CurRoleItem.isSelect = nil
    end
    hero.isSelect = true
    self.CurRoleItem = hero
    if self.CurRoleItem.id ~= PlayerControl.GetPlayerData().curRoleID then
        self.Btn_UnGenghuan().gameObject:SetActive(false)
        self.Btn_Genghuan().gameObject:SetActive(true)
    else
        self.Btn_UnGenghuan().gameObject:SetActive(true)
        self.Btn_Genghuan().gameObject:SetActive(false)
    end
    self:ResetRoleItem()
end
---获取角色数据缓存
function M:GetRoleData(sort, rise)
    ---获取角色数据
    local array = HeroControl.GetHaveHero()
    ---获取看板娘数据
    local PosterGirlArray = PosterGirlControl.GetAllPosterGirl()
    ---看板娘加入队列
    for i, v in pairs(PosterGirlArray) do
        table.insert(array, v)
    end
    ---排序(1稀有度,2取得时间)
    local sortGroupArr = {
        [1] = { "rank", "cTime" },
        [2] = { "cTime", "rank" }
    }
    Global.Sort(array, sortGroupArr[sort], rise)
    return array
end
---创建标签
function M:CreateFilterToggle(filters, prefab, parentTrans, callback)
    local toggles = {}
    for idx, name in ipairs(filters) do
        local togTrans = GameObject.Instantiate(prefab, parentTrans, false).transform
        togTrans:GetComponent("UITemplate"):SetData({ name, function(...)
            callback(idx, ...)
        end })
        toggles[idx] = togTrans:GetComponent("Toggle")
    end
    return toggles
end
function M:InitClock()
    MgrTimer.Cancel("TiLiClock")
    local DiffTime
    if self.curTili < self.TiliMax then
        --local OldTime = tonumber(UnityEngine.PlayerPrefs.GetString("TiLiClock"))
        local NewTime = Global.GetCurTime()     ---当前服务器时间
        print("服务器时间戳+++++++++++++++", NewTime)
        DiffTime = NewTime - PlayerControl.GetPlayerData().vigor.vigorTime
    end
    ---时钟
    self.curTime = tonumber(SteamLocalData.tab[104004][2])
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
    MgrTimer.AddRepeat("TiLiClock", 1, Handle(self, function()
        if self.curTili >= self.TiliMax then
            self.Text_TargetTime().text = "00:00:00"
            self.Text_PowerClock().text = "00:00:00"
            return
        end
        if sec == 0 then
            min = min - 1
            sec = 60
        end
        if min < 0 then
            PlayerControl.GetPlayerData().vigor.vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + 1
            PlayerControl.GetPlayerData().vigor.vigorTime = PlayerControl.GetPlayerData().vigor.vigorTime + tonumber(SteamLocalData.tab[104004][2])
            self.TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
            self.curTili = PlayerControl.GetPlayerData().vigor.vigorNum
            self.Text_PowerCount().text = self.curTili.."/" .. self.TiliMax
            self:RefreshCoinCount()
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
        self.Text_PowerClock().text = string.format("%02d:%02d:%02d", 0, min, sec)
        self.Text_TargetTime().text = string.format("%02d:%02d:%02d", tarHour, tarMin, tarSec)
    end), -1, nil)
end
function M:CheckTime()
    local tiLi = self.TiliMax - self.curTili     --要恢复的体力
    if tiLi <= 0 then
        return 0, 0, 0
    end
    -- local time = PlayerControl.GetPlayerData().vigor.vigorTime + tiLi * 300
    local ts = tiLi * 300
    local seconds = ts % 60
    local min = math.modf(ts % 3600 / 60)
    local hour = math.floor(ts / 3600)
    return hour, min, seconds
end
---修改面板娘返回
function M:ChooseMenuRoleACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseMenuRoleACK', buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips4"), 2 }, true)
    end
end
function M:ChooseMenuRoleNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseMenuRoleNTF', buffer))
    MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
    PlayerControl.GetPlayerData().curRoleID = tab.roleID
    self:RefreshTheme()
    self.ChoosePlayerRole().gameObject:SetActive(false)
    if self.CurRoleItem then
        self.CurRoleItem.isSelect = false
        self.CurRoleItem.isSelect = nil
    end
    ---播放亲信切换语音
    PosterGirlViewModel.PlayRoleVoice(2)
    --播放主界面角色BGM
    self:PlayrRoleBGM()
end
--[[function M:ShowBattery()
    local Battery= MgrSdk.GetBattery()
    self.Text_Shijian().text=Tools.GetTimeStr()
    self.Img_Dianliang().transform.localScale =  Vector3(Battery/100,1,1)
end]]
function M:OnRoleSpineClick()
    PosterGirlViewModel.GetCurFavorWords()
end
---UI动态出现
function M:UIAppear(prefabs)
    for i = 1, #prefabs, 1 do
        self:DoMoveDelay(prefabs[i])
    end
end
function M:DoMoveDelay(prefab)
    --设置初始位置
    prefab.transform.localPosition = Vector3(-100, 50, -120)
    --移动
    MgrTimer.AddDelayNoName(0.2, function()
        self:Domove(prefab)
    end, nil)
end
function M:Domove(prefab)
    MgrTimer.Cancel(prefab.transform.name)
    MgrTimer.AddRepeat(prefab.transform.name, 0.01, function()
        --prefab.transform.localPosition = Vector3(prefab.transform.localPosition.x + 10,prefab.transform.localPosition.y - 5,prefab.transform.localPosition.y + 12)
        prefab.transform.localPosition = Vector3(Mathf.Lerp(prefab.transform.localPosition.x, 0, 0.1), Mathf.Lerp(prefab.transform.localPosition.y, 0, 0.1), Mathf.Lerp(prefab.transform.localPosition.z, 0, 0.1))
    end, 100, nil)
end
function M:UIFadeIn(prefabs)
    for i = 1, #prefabs, 1 do
        self:ShowUIFadeIn(prefabs[i])
    end
end
function M:ShowUIFadeIn(prefab)
    --透明度先设置为0
    prefab.color = Color(prefab.color.r, prefab.color.g, prefab.color.b, 0)
    MgrTimer.AddDelayNoName(0.2, function()
        MgrTimer.AddRepeat(prefab.name .. "Fade", 0.02, function()
            local a = prefab.color.a
            prefab.color = Color(prefab.color.r, prefab.color.g, prefab.color.b, a + 0.1)
        end, 10, nil)
    end, nil)
end
function M:HideVFX()
    ---隐藏红点
    self.MailRedDotIcon().gameObject:SetActive(false)      --邮件红点
    self.DexRedDotIcon().gameObject:SetActive(false)       --美术馆红点
    self.RoleRedDotIcon().gameObject:SetActive(false)      --驾驶员红点
    self.TaskRedDotIcon().gameObject:SetActive(false)      --任务红点
    self.BagRedDotIcon().gameObject:SetActive(false)       --背包红点
    self.FriendRedDotIcon().gameObject:SetActive(false)    --好友红点
    self.PassportRedDotIcon().gameObject:SetActive(false)  --通行证红点
    self.ArkRedDotIcon().gameObject:SetActive(false)       --指挥室红点
    self.ActivityRedDotIcon().gameObject:SetActive(false)    --活动入口红点
    self.ShopRedDotIcon().gameObject:SetActive(false)    --活动入口红点
    self.PlotReviewRedDot().gameObject:SetActive(false);    -- 剧情回顾
end
--特效消失
function M:VFXOFF()
    ---隐藏红点
    self.MailRedDotIcon().gameObject:SetActive(false)   --邮件红点
    self.DexRedDotIcon().gameObject:SetActive(false)   --美术馆红点
    self.RoleRedDotIcon().gameObject:SetActive(false)   --驾驶员红点
    self.TaskRedDotIcon().gameObject:SetActive(false)   --任务红点
    self.BagRedDotIcon().gameObject:SetActive(false)   --背包红点
    self.PassportRedDotIcon().gameObject:SetActive(false)  --通行证红点
    self.ArkRedDotIcon().gameObject:SetActive(false)       --指挥室红点
    self.FriendRedDotIcon().gameObject:SetActive(false)    --好友红点
    self.ActivityRedDotIcon().gameObject:SetActive(false)    --活动入口红点
    self.ArkRedDotIcon().gameObject:SetActive(false)
    self.PVERedDotIcon().gameObject:SetActive(false)
    self.ActivityRedDotIcon().gameObject:SetActive(false)
    self.ShareRedDotIcon().gameObject:SetActive(false)
    self.ShopRedDotIcon().gameObject:SetActive(false)
    self.PlotReviewRedDot().gameObject:SetActive(false);    -- 剧情回顾
end
--特效显示
function M:VFXON()
    RedDotControl.CheckRedDotUI("Home", Handle(self, self.RedDotFunc))
end
--滑动条移动
function M:BarMove(TargetPosX, Duration)
    Tools.TweenDoLocalMoveX(self.Img_Huangdongtiao().gameObject, TargetPosX, Duration, -1)
end

function M:InitGuideEvent()
    Event.Clear("supply")
    Event.Clear("role")
    Event.Clear("fight")
    Event.Clear("bag")
    Event.Clear("NovicePVP")
    Event.Clear("PlayerAvatar")
    Event.Clear("Ark")
    Event.Clear("Passes")
    Event.Clear("Achievement")
    Event.Clear("NoviceActivity")
    Event.Clear("Social")
    Event.Clear("Friend")
    Event.Clear("Guild")
    ---新手引导事件
    Event.Add("supply", function()
        HomeViewModel.OpenRoleCardDraw(function()
        end)
    end)

    Event.Add("role", function()
        HomeViewModel.OpenCollection(function()
            NoviceViewModel.DoNext()
        end)
    end)
    Event.Add("fight", function()
        HomeViewModel.OpenChoose(false, function()
            NoviceViewModel.DoNext()
        end)
    end)
    Event.Add("bag", function()
        HomeViewModel.OpenPlayerBag(function()
            NoviceViewModel.DoNext()
        end)
    end)
    Event.Add("altas", function()
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
            HomeViewModel.OpenIllustration()
        end)
    end)
    Event.Add("NovicePVP", function()
        NoviceViewModel.DoNext(function()
            HomeViewModel.OpenExercise(function()
                if NoviceControl.GroupsIsTrigger(45) then
                    PosterGirlViewModel.PlayRoleVoice(28)
                else
                    MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
                end
            end)
        end)
    end)
    Event.Add("NoviceSwitchUI", function()
        if self.Tog_SwitchRight01().isOn ~= true then
            self.Tog_SwitchRight01().isOn = true
        end
        if NoviceViewModel.CurTaskId == 20302 then
            NoviceViewModel.DoNext()
        end
    end)
    Event.Add("PlayerAvatar", function()
        HomeViewModel.OpenPlayerAvatar(function()
            NoviceViewModel.DoNext()
        end)
    end)
    Event.Add("Ark", function()
        HomeViewModel.OpenArk()
    end)
    Event.Add("Passes",function()
        ---如果未解锁
        if SysLockControl.CheckSysLock(1510) == false then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1510),1},true)
            return
        end
        ---如果在活动时间内
        if PassportControl.GetIsInMiddle() then
            MgrUI.GoHide(UID.Passes_UI)
        else
            PassportControl.ClearPassportData()
            local callBack = function()
                local startTime = TimeControl.GetTimeTable(ActivityLocalData.tab[PassportControl.GetPassportData().activityId][5]).openTime
                local endTime = TimeControl.GetTimeTable(ActivityLocalData.tab[PassportControl.GetPassportData().activityId][5]).endTime
                local inMiddle = Global.isMiddleTime(startTime, endTime)
                if PassportControl.GetPassportData() and inMiddle then
                    MgrUI.GoHide(UID.Passes_UI)
                else
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips2"),2}, true)
                end
            end
            ActivityControl.PushData(callBack)
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("home_ui_tips2"),2}, true)
        end
    end)
    Event.Add("Achievement",function()
        HomeViewModel.OpenAchievement()
    end)
    Event.Add("NoviceActivity",function()
        ActivityControl.OpenHuoDong()
    end)
    Event.Add("Social",function()
        --self.Img_Social().transform.sizeDelta = self.Btn_Social().transform.sizeDelta
        --self.Img_Social().transform.position = self.Btn_Social().transform.position

        --self.Img_Social().gameObject:SetActive(true)
        --self.ShequnPanel().gameObject:SetActive(true)
        NoviceViewModel.DoNext()

    end)
    Event.Add("Friend",function()
        if SysLockControl.CheckSysLock(1700) then
            HomeViewModel.OpenFriend(function()
                NoviceViewModel.DoNext()
            end)

            --self.Img_Social().gameObject:SetActive(false)
            --self.ShequnPanel().gameObject:SetActive(false)
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1700),1},true)
        end
    end)
    Event.Add("Guild",function()
        GuildControl.OpenGuildUI(function()
            NoviceViewModel.DoNext()
        end)
        --self.Img_Social().gameObject:SetActive(false)
        --self.ShequnPanel().gameObject:SetActive(false)
    end)
    Event.Clear("NoviceExOpenRole")
    Event.Add("NoviceExOpenRole", function()
        PosterGirlViewModel.PlayRoleVoice(29)
        HomeViewModel.OpenCollection()
        NoviceViewModel.DoNext()
    end)
end

---截图功能
function M:CaptureScreenshot(imageComponent,LuaFunc)
    CMgrCamera.Instance:CaptureScreenshot(imageComponent,LuaFunc)
end
function M:CloseShare(CloseOrOpen)
    self.BlurMask2().gameObject:SetActive(CloseOrOpen)
    self.JietuPanelParent().gameObject:SetActive(CloseOrOpen)
    self.Content().gameObject:SetActive(CloseOrOpen)
end
---保存到相簿
function M:SaveToLocal()
    CMgrCamera.Instance:SaveScreenshotLocal(
            function(str)
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips4").. str, 1 }, true)
            end)
end
---FB分享
function M:FBSharePicture()
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
---FB分享链接
function M:FBShare()
    self.FBPanel().gameObject:SetActive(true)
    self.FB().gameObject:SetActive(true)
    self.DISCORD().gameObject:SetActive(false)
    self.Line().gameObject:SetActive(false)
    local reward = string.split(MailLocalData.tab[999998].goods,",")
    self.FBRewardList = {}
    for i = 1, #reward do
        local re = string.split(reward[i],"_")
        local data = ItemData.New()
        data:PushData({goodsType = tonumber(re[1]),goodsID = tonumber(re[2]),goodsNum = tonumber(re[3])},ItemControl.PushEnum.none)
        table.insert(self.FBRewardList,data)
    end
    self.ItemScroll03():SetLuaCellEvent(Handle(self, self.FBItem))
    self.ItemScroll03().totalCount = #self.FBRewardList
    self.ItemScroll03():RefillCells(0)
end

---Line分享链接
function M:LineShare()
    self.FBPanel().gameObject:SetActive(true)
    self.FB().gameObject:SetActive(false)
    self.DISCORD().gameObject:SetActive(false)
    self.Line().gameObject:SetActive(true)
    local reward = string.split(MailLocalData.tab[999996].goods,",")
    self.LineRewardList = {}
    for i = 1, #reward do
        local re = string.split(reward[i],"_")
        local data = ItemData.New()
        data:PushData({goodsType = tonumber(re[1]),goodsID = tonumber(re[2]),goodsNum = tonumber(re[3])},ItemControl.PushEnum.none)
        table.insert(self.LineRewardList,data)
    end
    self.ItemScroll05():SetLuaCellEvent(Handle(self, self.LineItem))
    self.ItemScroll05().totalCount = #self.LineRewardList
    self.ItemScroll05():RefillCells(0)
end

function M:DiscordShare()
    self.FBPanel().gameObject:SetActive(true)
    self.FB().gameObject:SetActive(false)
    self.DISCORD().gameObject:SetActive(true)
    self.Line().gameObject:SetActive(false)
    local reward = string.split(MailLocalData.tab[999997].goods,",")
    self.DiscordRewardList = {}
    for i = 1, #reward do
        local re = string.split(reward[i],"_")
        local data = ItemData.New()
        data:PushData({goodsType = tonumber(re[1]),goodsID = tonumber(re[2]),goodsNum = tonumber(re[3])},ItemControl.PushEnum.none)
        table.insert(self.DiscordRewardList,data)
    end
    self.ItemScroll04():SetLuaCellEvent(Handle(self, self.DiscordItem))
    self.ItemScroll04().totalCount = #self.DiscordRewardList
    self.ItemScroll04():RefillCells(0)
end
function M:FBItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.FBRewardList[idx], self})
end
function M:LineItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.LineRewardList[idx], self})
end
function M:DiscordItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.DiscordRewardList[idx], self})
end
function M:CreatBanner()
    Event.Add("AutoBanner",Handle(self,self.InitAutoBanner))
    Event.Add("ClearBannerTimer",Handle(self,self.ClearBannerTimer))
    self.BannerData = BannerControl.GetBannerData()
    if #self.BannerData == 0 then
        self.Ad().gameObject:SetActive(false)
        return
    end
    self.BannerScroll01().totalCount = #self.BannerData
    self.BannerScroll01():RefillCells()

    self.BannerOgj = {}
    self.BannerId = 0
    for i = 1, #self.BannerData do
        self.BannerOgj[i] = GameObject.Instantiate(self.BannerPointN().gameObject,self.BannerPointPanel().transform,false)
        self.BannerOgj[i].gameObject:SetActive(true)
    end

    self:InitAutoBanner()
    self:RefreshBanner()
end

function M:InitAutoBanner()
    local tSpeed = 1000
    if self.BannerData == nil or next(self.BannerData) == nil then
        return
    end
    MgrTimer.AddRepeat("Banner", self.BannerData[1].interval, function()
        self.BannerId = self.BannerScroll01().curItemIndex + 1
        if self.BannerId >= #self.BannerData then
            self.BannerId = 0
            tSpeed = tSpeed * #self.BannerData
        else
            tSpeed = 1000
        end
        self.BannerScroll01():RefillCells(self.BannerId)
    end, -1, nil)
end

function M:ClearBannerTimer()
    MgrTimer.Cancel("Banner")
end

function M:RefreshBanner()
    MgrTimer.AddRepeat("RefreshBanner", 0, function()
        self.CurBanner().transform.position = self.BannerOgj[self.BannerScroll01().curItemIndex+1].transform.position
    end, -1, nil)
end

---Line分享
function M:LineSharePicture()
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

---初始化主题
function M:RefreshTheme()
    ---@type RoleSkinData

    local isHave = UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "HomeUISelectRoles")
    if isHave ~= nil and isHave ~= "" then
        PlayerControl.GetPlayerData().HomeRole = self.RoleList[self.curRoleIndex]
        if PosterGirlViewModel.CurSpineObj then
            GameObject.Destroy(PosterGirlViewModel.CurSpineObj)
        end
    end
    local skinData = HeroControl.GetSkinDataBySkinId(PlayerControl.GetPlayerData().HomeRole)
    self.IsCanRotate = skinData.isRotate
    self.SwitchCG().gameObject:SetActive(false)

    ---如果是特殊转默认 创建所有spine
    PosterGirlViewModel.GetRoleSpineToBox(self.RoleSprite().gameObject,PosterGirlViewModel.spineType.role)
    PosterGirlViewModel.GetRoleSpineToBox(self.BgSprite().gameObject,PosterGirlViewModel.spineType.bottom)
    PosterGirlViewModel.GetRoleSpineToBox(self.FrontSprite().gameObject,PosterGirlViewModel.spineType.front)

    ---如果是皮肤(有多个点击区域)，根据皮肤ID创建多个点击区域
    if next(self.ClickArea) ~= nil then
        for i,v in pairs(self.ClickArea) do
            GameObject.Destroy(v)
        end
        self.ClickArea = {}
    end
    if skinData.HaveClickArea then
        self.RoleSpineClickArea().gameObject:SetActive(false)
        for i,v in pairs(skinData.ClickArea) do
            local tempGo = GameObject.Instantiate(self.RoleSpineClickArea().gameObject,self.RoleSprite().transform,false)
            tempGo:SetActive(true)
            tempGo:GetComponent("RectTransform").anchoredPosition = Vector2(tonumber(v.x),tonumber(v.y))
            tempGo:GetComponent("RectTransform").sizeDelta = Vector2(tonumber(v.width),tonumber(v.height))
            UIEvent.LuaClick(tempGo,function()
                if not self.IsSwitchAni then
                    PosterGirlViewModel.GetCurFavorWords(i)
                end
            end)
            self.ClickArea[i] = tempGo
        end
    else
        self.RoleSpineClickArea().gameObject:SetActive(true)
    end
end


---初始化看板娘
function M:InitPosterGirl()
    ---默认衣服状态
    PosterGirlViewModel.CurClothes = PosterGirlViewModel.ClothesType.wear
    self.ClickArea = {}
    self:RefreshTheme()
end

---根据当前储存的数字刷新spine value为0是默认spine,为1是特殊spine
function M:RefreshSpine(isSwitch)
    local key = PlayerControl.GetPlayerData().UID.."LobbySpine"

    if isSwitch then
        --停止语音
        MgrSound.Stop(3,tostring(PlayerControl.GetPlayerData().HomeRole),false)
        self.Img_SoundTextBG().gameObject:SetActive(false)

        PosterGirlViewModel.GetRoleSpineToBox(self.RoleSprite().gameObject,PosterGirlViewModel.spineType.role)
        PosterGirlViewModel.GetRoleSpineToBox(self.BgSprite().gameObject,PosterGirlViewModel.spineType.bottom)
        PosterGirlViewModel.GetRoleSpineToBox(self.FrontSprite().gameObject,PosterGirlViewModel.spineType.front)
        UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID.."LobbySpine",0)

    else
        local isHave = UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "HomeUISelectRoles")
        if isHave ~= nil and isHave ~= "" then
            if PosterGirlViewModel.CurSpineObj then
                GameObject.Destroy(PosterGirlViewModel.CurSpineObj)
            end
            PlayerControl.GetPlayerData().HomeRole = self.RoleList[self.curRoleIndex]
        end

        PosterGirlViewModel.GetRoleSpineToBox(self.RoleSprite().gameObject,PosterGirlViewModel.spineType.role)
        PosterGirlViewModel.GetRoleSpineToBox(self.BgSprite().gameObject,PosterGirlViewModel.spineType.bottom)
        PosterGirlViewModel.GetRoleSpineToBox(self.FrontSprite().gameObject,PosterGirlViewModel.spineType.front)
        
        local skinData = HeroControl.GetSkinDataBySkinId(PlayerControl.GetPlayerData().HomeRole)
        self.IsCanRotate = skinData.isRotate
        ---如果是皮肤(有多个点击区域)，根据皮肤ID创建多个点击区域
        if next(self.ClickArea) ~= nil then
            for i,v in pairs(self.ClickArea) do
                GameObject.Destroy(v)
            end
            self.ClickArea = {}
        end
        if skinData.HaveClickArea then
            self.RoleSpineClickArea().gameObject:SetActive(false)
            for i,v in pairs(skinData.ClickArea) do
                local tempGo = GameObject.Instantiate(self.RoleSpineClickArea().gameObject,self.RoleSprite().transform,false)
                tempGo:SetActive(true)
                tempGo:GetComponent("RectTransform").anchoredPosition = Vector2(tonumber(v.x),tonumber(v.y))
                tempGo:GetComponent("RectTransform").sizeDelta = Vector2(tonumber(v.width),tonumber(v.height))
                UIEvent.LuaClick(tempGo,function()
                    if not self.IsSwitchAni then
                        PosterGirlViewModel.GetCurFavorWords(i)
                    end
                end)
                self.ClickArea[i] = tempGo
            end
        else
            self.RoleSpineClickArea().gameObject:SetActive(true)
        end
    end
    local skinData = HeroControl.GetSkinDataBySkinId(PlayerControl.GetPlayerData().HomeRole)
    local tSkinId = PlayerControl.GetPlayerData().HomeRole
    if skinData then
        tSkinId = skinData.id
        --检测ASMR
        self:CheckAsmr(skinData)
    end
    MgrSound.PlayBGM(RoleuiskinLocalData.tab[tSkinId].bgm, 0.2)

    --打开播放动画界面
    SkinControl.OpenPlayAnime(PlayerControl.GetPlayerData().HomeRole)
end

---刷新按钮UI
function M:RefreshBtnUI()
    ---根据策划表修改按钮图片
    local path = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].iconpic
    MgrRes.LoadSprite(self.Img_Gongnengdi(),path.."/"..self:GetImgSpriteName(self.Img_Gongnengdi().gameObject))
    MgrRes.LoadSprite(self.Img_Btndi2(),path.."/"..self:GetImgSpriteName(self.Img_Btndi2().gameObject))
    MgrRes.LoadSprite(self.Img_Share(),path.."/"..self:GetImgSpriteName(self.Img_Share().gameObject))
    MgrRes.LoadSprite(self.Btn_Share(),path.."/"..self:GetImgSpriteName(self.Btn_Share().gameObject))
    MgrRes.LoadSprite(self.Img_Hide(),path.."/"..self:GetImgSpriteName(self.Img_Hide().gameObject))
    MgrRes.LoadSprite(self.Btn_Hide(),path.."/"..self:GetImgSpriteName(self.Btn_Hide().gameObject))
    MgrRes.LoadSprite(self.SwitchCG(),path.."/"..self:GetImgSpriteName(self.SwitchCG().gameObject))
    MgrRes.LoadSprite(self.Img_PlayerBG(),path.."/"..self:GetImgSpriteName(self.Img_PlayerBG().gameObject))
    MgrRes.LoadSprite(self.Img_Genghuandi(),path.."/"..self:GetImgSpriteName(self.Img_Genghuandi().gameObject))
    MgrRes.LoadSprite(self.Img_Genghuanicon(),path.."/"..self:GetImgSpriteName(self.Img_Genghuanicon().gameObject))
    MgrRes.LoadSprite(self.Img_Share(),path.."/"..self:GetImgSpriteName(self.Img_Share().gameObject))
    MgrRes.LoadSprite(self.Img_Hide(),path.."/"..self:GetImgSpriteName(self.Img_Hide().gameObject))
    MgrRes.LoadSprite(self.Img_ST(),path.."/"..self:GetImgSpriteName(self.Img_ST().gameObject))
    MgrRes.LoadSprite(self.Img_Notice(),path.."/"..self:GetImgSpriteName(self.Img_Notice().gameObject))
    MgrRes.LoadSprite(self.Img_Mail(),path.."/"..self:GetImgSpriteName(self.Img_Mail().gameObject))
    MgrRes.LoadSprite(self.Img_Setting(),path.."/"..self:GetImgSpriteName(self.Img_Setting().gameObject))
    MgrRes.LoadSprite(self.Btn_Activity(),path.."/"..self:GetImgSpriteName(self.Btn_Activity().gameObject))
    MgrRes.LoadSprite(self.Img_Activity(),path.."/"..self:GetImgSpriteName(self.Img_Activity().gameObject))
    MgrRes.LoadSprite(self.Btn_Passport(),path.."/"..self:GetImgSpriteName(self.Btn_Passport().gameObject))
    MgrRes.LoadSprite(self.Img_Passesicon(),path.."/"..self:GetImgSpriteName(self.Img_Passesicon().gameObject))
    -- MgrRes.LoadSprite(self.Img_Yanxidi(),path.."/"..self:GetImgSpriteName(self.Img_Yanxidi().gameObject))
    --MgrRes.LoadSprite(self.Img_Zuozhandi(),path.."/"..self:GetImgSpriteName(self.Img_Zuozhandi().gameObject))
    MgrRes.LoadSprite(self.Img_ArkIcon(),path.."/"..self:GetImgSpriteName(self.Img_ArkIcon().gameObject))
    MgrRes.LoadSprite(self.Img_RoleIcon(),path.."/"..self:GetImgSpriteName(self.Img_RoleIcon().gameObject))
    MgrRes.LoadSprite(self.Img_BagIcon(),path.."/"..self:GetImgSpriteName(self.Img_BagIcon().gameObject))
    --MgrRes.LoadSprite(self.Img_TaskIcon(),path.."/"..self:GetImgSpriteName(self.Img_TaskIcon().gameObject))
    MgrRes.LoadSprite(self.Img_AtlasIcon(),path.."/"..self:GetImgSpriteName(self.Img_AtlasIcon().gameObject))
    --MgrRes.LoadSprite(self.Img_FriendIcon(),path.."/"..self:GetImgSpriteName(self.Img_FriendIcon().gameObject))
    MgrRes.LoadSprite(self.Img_SupplyIcon(),path.."/"..self:GetImgSpriteName(self.Img_SupplyIcon().gameObject))
    MgrRes.LoadSprite(self.Img_ShopIcon(),path.."/"..self:GetImgSpriteName(self.Img_ShopIcon().gameObject))
    ---根据策划表修改文本颜色
    local mainColor = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].maincolor
    local resColor = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].secondcolor
    self.Text_Home_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Home_En().color = Tools.GetPColor("#"..tostring(resColor))

    self.Text_Role_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Role_En().color = Tools.GetPColor("#"..tostring(resColor))

    self.Text_Bag_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Bag_En().color = Tools.GetPColor("#"..tostring(resColor))
    --self.Text_Task_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    --self.Text_Task_En().color = Tools.GetPColor("#"..tostring(resColor))

    self.Text_Atlas_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Atlas_En().color = Tools.GetPColor("#"..tostring(resColor))

    --self.Text_Friend_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    --self.Text_Friend_En().color = Tools.GetPColor("#"..tostring(resColor))

    self.Text_Supply_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Supply_En().color = Tools.GetPColor("#"..tostring(resColor))

    self.Text_Shop_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Shop_En().color = Tools.GetPColor("#"..tostring(resColor))

    self.Text_Shop_Cn().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Shop_En().color = Tools.GetPColor("#"..tostring(resColor))

    --self.Text_Zuozhan().color = Tools.GetPColor("#"..tostring(mainColor))
    --self.Text_Battle().color = Tools.GetPColor("#"..tostring(resColor))

    --self.Text_Yanxi().color = Tools.GetPColor("#"..tostring(mainColor))
    --self.Text_PVP().color = Tools.GetPColor("#"..tostring(resColor))

    self.Text_Activity().color = Tools.GetPColor("#"..tostring(mainColor))
    self.Text_Passes().color = Tools.GetPColor("#"..tostring(mainColor))
end

---获取图片sprite Name
function M:GetImgSpriteName(obj)
    if obj.transform:GetComponent("Image").sprite.name then
        return obj.transform:GetComponent("Image").sprite.name
    end
    return ""
end

---@param _skin RoleSkinData 检测ASMR
function M:CheckAsmr(_skin)
    local tAsmrData = SkinControl.GetAsmrDataByID(_skin.id)
    if tAsmrData == nil then
        self.ASMR().gameObject:SetActive(false)
        return
    end

    for i, v in ipairs(self.BtnCD_Panel) do
        GameObject.Destroy(v.gameObject)
    end

    for i, v in ipairs(tAsmrData) do
        self.BtnCD_Panel[i] = GameObject.Instantiate(self.Btn_CD().gameObject,self.ASMR_Close().transform,false)
        self.BtnCD_Panel[i].gameObject:SetActive(true)
        self.BtnCD_Panel[i].transform:Find("CDName"):GetComponent("TextMeshProUGUI").text = "0"..i
        --播放ASMR
        UIEvent.LuaClick(self.BtnCD_Panel[i].gameObject,function()
            local tStr = string.split(v[1].UnlockItem,"_")
            local item = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
            --剩余大于数量
            if item.count == 0 then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_personalstory_tips3"),1},true)
                return
            end
            self.CurUIState = "spineAsmr"
            self:OpenAsmrUI(true)

            SkinControl.PlayAsmr(v,function()
                self:OpenAsmrUI(false)
            end)
        end)
    end

    self.ASMR().gameObject:SetActive(true)
    self.Btn_ASMR_Open().gameObject:SetActive(true)
    self.ASMR_Close().gameObject:SetActive(false)
end
---打开ASMR界面
function M:OpenAsmrUI(_isOpen)
    if _isOpen then
        self.UIPanel().gameObject:SetActive(false)
        self.BlurMask2().gameObject:SetActive(false)
        self.Btn_Mask().gameObject:SetActive(true)
        
        PosterGirlViewModel.CanStop = true
        self.Img_SoundTextBG().gameObject:SetActive(false)
        SysNoticeControl.Hide()
        self.isHideHome = true
    else
        self:UIPanel().gameObject:SetActive(true)
        self.Btn_Mask().gameObject:SetActive(false)
        self.Btn_Skip().gameObject:SetActive(false)

        PosterGirlViewModel.CanStop = false
        SysNoticeControl.Show()
        MgrTimer.AddDelayNoName(0.5, function()
            self.isHideHome = false
        end, nil)
    end
end

function M:OnClose()
    MgrSound.StopAll()
    MgrTimer.Cancel("GotoExercise")
    MgrTimer.Cancel("RollIcon")
    MgrTimer.Cancel("CheckTime")
    MgrTimer.Cancel("TiLiClock")
    MgrTimer.Cancel("RoleVoice")
    MgrTimer.Cancel("RotDot")
    MgrTimer.Cancel("CheckPassesReward")
    MgrTimer.Cancel("UpdateArkRedPoint")
    MgrTimer.Cancel("Banner")
    MgrTimer.Cancel("RefreshBanner")
    MgrTimer.Cancel("ReefreshActiviryPrefeb")
    MgrTimer.Cancel("HomeTouchUpdate")
    MgrTimer.Cancel("packageTime_Home_UI")
    MgrTimer.Cancel("FreshLiBaoButtonTime")
    Event.CheckClear("AutoBanner")
    Event.CheckClear("ClearBannerTimer")
    Event.CheckClear("RedDotFunc")
    Event.CheckClear("ChangeHomeRoleList")
    Event.Remove("Btn_libao_Open",Handle(self,self.OpenLibao))
    Event.Remove("Btn_libao_Close",Handle(self,self.CloseLibao))
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Remove("RefreshCoinCount",Handle(self,self.RefreshCoinCount))
    
    RedDotControl.ClearFunc("Home")
end

--关闭分享界面
function M:CloseFenXiangPanel()
        self.FenxiangPanel().gameObject:SetActive(false)
        self.Module().gameObject:SetActive(true)
        self.logo2().gameObject:SetActive(true)
        self.logo().gameObject:SetActive(true)
        self:CloseShare(false)
        self.Logo_UIDPanel().gameObject:SetActive(false)
        self.Btn_Fenxiang().gameObject:SetActive(self.withUI == false)
        CMgrUI.Instance:OpenClickRoot()
end

--还原主界面
function M:RestorePanel()
    self:UIPanel().gameObject:SetActive(true)
    --self.Btn_RestoreUI().gameObject:SetActive(false)
    self.FenxiangPanel().gameObject:SetActive(false)
    SysNoticeControl.Show()
    self:TouchUpdate()
end

function M:OnBackKey()
    print("Home OnBackKey:", MgrUI.IsPopOpen())
    local isSharePanel = self.SharePanel().gameObject.activeSelf --分享选择界面是否打开
    local isFenXiangPanel =  self.FenxiangPanel().gameObject.activeSelf --分享截图界面是否打开
    local isFBPanel = self.FBPanel().gameObject.activeSelf --官方社区界面是否打开
    local isUIPanel = self:UIPanel().gameObject.activeSelf --主界面是否隐藏
    local isChoosePlayerRole = self.ChoosePlayerRole().gameObject.activeSelf --选择角色界面是否打开

    if not MgrUI.IsPopOpen() then --没有pop打开
        if isChoosePlayerRole then
            self.ChoosePlayerRole().gameObject:SetActive(false)
            return
        end

        if isFenXiangPanel then
            self:CloseFenXiangPanel()
            return
        end

        if not isUIPanel then
            self:RestorePanel()
            return
        end
        if isSharePanel then
            self:VFXON()
            self.SharePanel().gameObject:SetActive(false)
            return
        end
        if isFBPanel then
            self.FBPanel().gameObject:SetActive(false)
            return
        end

        if not isFenXiangPanel and not isSharePanel and not isFBPanel and isUIPanel then
            print("弹出关闭应用界面")
            MgrSdk.CS:ShowExitView()
        end
    end
end

function M:RandomHomeRole()
    if SettingViewModel.GetPostGirlSetting() == 1 or next(self.RoleList) == nil then
        return
    end
    local idx = math.random(1, #self.RoleList)
    self.curRoleIndex = idx
    UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",self.curRoleIndex .. "_" .. self.RoleList[self.curRoleIndex])
    PlayerControl.GetPlayerData().HomeRole = self.RoleList[self.curRoleIndex]
end

---触摸移动放大立绘
function M:ScaleUpdate()
    Input.multiTouchEnabled = true
    local _OldTouch1,_OldTouch2 --上次触摸点(手指1,2)
    -- local High=1000 --可拖动边界高
    -- local Wide=1000 --可拖动边界宽

    local tSkinData = RoleuiskinLocalData.tab[PlayerControl.GetPlayerData().HomeRole]
    --缩放
    local scale = tSkinData.scale
    local str = string.split(scale,',')
    self.MinScale = tonumber(str[1])
    self.MaxScale = tonumber(str[2])
    --设置滑条属性
    self.SliderChange = false
    self.Slider_Scale().minValue = self.MinScale
    self.Slider_Scale().maxValue = self.MaxScale
    self.Slider_Scale().value = self.LihuiPanel().transform.localScale.x
    self.SliderChange = true
    self.Text_Scale1().text = str[1].."x"
    self.Text_Scale3().text = str[2].."x"
    --设置边界
    if tSkinData.dragrange ~= "0" then
        local tRangeList = string.split(tSkinData.dragrange,';')
        for i, v in ipairs(tRangeList) do
            local tRange = string.split(v,',')
            if #tRange > 1 then
                if i == 1 then
                    self.MinDragFrame = Vector2(tonumber(tRange[1]), tonumber(tRange[2]))
                else
                    self.MaxDragFrame = Vector2(tonumber(tRange[1]), tonumber(tRange[2]))
                end
            end
        end
        if self.MaxScale ~= self.MinScale then
            --计算均值
            local tScale_DValue = self.MaxScale - self.MinScale
            self.Scale_Avg.x = (self.MaxDragFrame.x - self.MinDragFrame.x)/tScale_DValue
            self.Scale_Avg.y = (self.MaxDragFrame.y - self.MinDragFrame.y)/tScale_DValue
            --设置边界
            local tCurScale_DValue = self.LihuiPanel().transform.localScale.x-self.MinScale
            local tWidth = self.MinDragFrame.x+self.Scale_Avg.x*tCurScale_DValue
            local tHigh = self.MinDragFrame.y+self.Scale_Avg.y*tCurScale_DValue
            self.Img_DragFrame().transform.sizeDelta = Vector2(tWidth, tHigh)
        end

    end

    self.Child_y = self.ObjRoot.transform:GetComponent("RectTransform").rect.size.y
    self.Child_x = self.ObjRoot.transform:GetComponent("RectTransform").rect.size.x
    print("UI的缩放" .. self.Child_y .. "-" .. self.Child_x)
    --记录初始立绘位置
    self.OldPosZ = self.RoleSpritePanel().transform.localPosition.z

    self.ImgBGOldPosScale = Vector3(self.BgSprite().transform.localScale.x,self.BgSprite().transform.localScale.y,self.BgSprite().transform.localScale.z)
    self.LihuiPanelParentOldPos = Vector3(self.RoleSpritePanel().transform.localPosition.x,self.RoleSpritePanel().transform.localPosition.y,self.RoleSpritePanel().transform.localPosition.z)
    self.LihuiPanelOldScale = self.LihuiPanel().transform.localScale
    self.LihuiPanelOldPos = Vector3(self.LihuiPanel().transform.localPosition.x,self.LihuiPanel().transform.localPosition.y,self.LihuiPanel().transform.localPosition.z)
    self.FrontSpriteOldPosScale = Vector3(self.FrontSprite().transform.localScale.x,self.FrontSprite().transform.localScale.y,self.FrontSprite().transform.localScale.z)
    --边框的原始坐标
    self.SpinePanelOldPos = Vector3(self.SpinePanel().transform.localPosition.x,self.SpinePanel().transform.localPosition.y,self.SpinePanel().transform.localPosition.z)
    --边框的宽高
    self.DragFrameOldRect = self.Img_DragFrame().transform.sizeDelta

    --设置边界节点数据
    self.ItemDrag:SetRange(self.Img_DragFrame().gameObject)
    --设置拖拽节点
    if self.IsCanRotate then
        self.ItemDrag:SetInBoxObj(self.RoleSpritePanel().gameObject)
    else
        self.ItemDrag:SetInBoxObj(self.SpinePanel().gameObject)
    end

    MgrTimer.AddRepeat("ScaleUpdateRole",0,function ()
        if UIEvent.GetButton_Up() then
            --设置边界节点数据
            self.ItemDrag:SetRange(self.Img_DragFrame().gameObject)
        end
        if Input.touchCount <= 0 then
            return
        end

        if 2 == Input.touchCount then  --双指触摸,放大缩小
            local _NewTouch1 = Input.GetTouch(0);
            local _NewTouch2 = Input.GetTouch(1);

            if _NewTouch2.phase == TouchPhase.Began then
                _OldTouch2 = _NewTouch2
                _OldTouch1 = _NewTouch1
                return
            end

            --计算老的两点距离和新的两点间距离，变大要放大模型，变小要缩放模型
            local _OldDistance = Vector2.Distance(_OldTouch1.position, _OldTouch2.position)
            local _NewDistance = Vector2.Distance(_NewTouch1.position, _NewTouch2.position)
            --两个距离之差，为正表示放大手势， 为负表示缩小手势
            local _Offset = _NewDistance - _OldDistance
            --放大因子， 一个像素按 0.001倍来算(1000可调整)
            local _ScaleFactor = _Offset / 1000;
            local _LocalScale = self.LihuiPanel().transform.localScale;
            local _Scale = Vector3(_LocalScale.x + _ScaleFactor,
                    _LocalScale.y + _ScaleFactor,
                    _LocalScale.z + _ScaleFactor)

            --缩放
            self.Slider_Scale().value = _LocalScale.x + _ScaleFactor
            --self:SetScale(_Scale)
            --记住最新的触摸点，下次使用
            _OldTouch1 = _NewTouch1
            _OldTouch2 = _NewTouch2
        end
    end,-1,nil)
end

--触摸退出
function M:ScaleExit(_isExit)
    if _isExit then
        MgrTimer.Cancel("ScaleUpdateRole")
    end
    self.Slider_Scale().value = self.LihuiPanelOldScale.x
    self.Img_DragBG().gameObject:SetActive(false)
    --self.LihuiSpinePanel().transform.localPosition = self.OldPosition

    self.RoleSpritePanel().transform.localPosition = self.LihuiPanelParentOldPos
    self.LihuiPanel().transform.localScale = self.LihuiPanelOldScale

    self.FrontSprite().transform.localScale = self.FrontSpriteOldPosScale
    --有皮肤的拖拽节点
    self.SpinePanel().transform.localPosition = self.SpinePanelOldPos
    --边框
    self.Img_DragFrame().transform.sizeDelta = self.DragFrameOldRect
    --立绘坐标
    self.LihuiPanel().transform.localPosition = self.LihuiPanelOldPos
end

---缩放
function M:SetScale(_Scale)
    local CurPos = self.RoleSpritePanel().transform.localPosition
    --if self.roleData.id ~= self.currentChooseSkinData.id then
    --    CurPos = self.SpinePanel().transform.localPosition
    --end
    if _Scale.x >= self.MinScale and _Scale.y >= self.MinScale and _Scale.x <= self.MaxScale and _Scale.y <= self.MaxScale then
        if not self.Img_DragBG().gameObject.activeSelf then
            self.Img_DragBG().gameObject:SetActive(true)
        end

        if self.IsCanRotate then
            self.LihuiPanel().transform.localScale = _Scale;
        else
            self.BgSprite().transform.localScale = _Scale;
            self.LihuiPanel().transform.localScale = _Scale;
            self.FrontSprite().transform.localScale = _Scale;
        end
        --设置边界
        local tCurScale_DValue = _Scale.x-self.MinScale
        local tWidth = self.MinDragFrame.x+self.Scale_Avg.x*tCurScale_DValue
        local tHigh = self.MinDragFrame.y+self.Scale_Avg.y*tCurScale_DValue

        self.Img_DragFrame().transform.sizeDelta = Vector2(tWidth, tHigh)
        --缩放边框限制
        local tFrameRect = self.Img_DragFrame().transform.rect.size
        local x = Mathf.Clamp(CurPos.x, self.Img_DragFrame().transform.localPosition.x-tFrameRect.x*0.5, self.Img_DragFrame().transform.localPosition.x+tFrameRect.x*0.5)
        local y = Mathf.Clamp(CurPos.y, self.Img_DragFrame().transform.localPosition.y-tFrameRect.y*0.5, self.Img_DragFrame().transform.localPosition.y+tFrameRect.y*0.5)
        print("缩放边框限制\nx:"..x.."\ny:"..y)
        if self.IsCanRotate then
            self.RoleSpritePanel().transform.localPosition = Vector3(x, y, self.OldPosZ)
        else
            self.SpinePanel().transform.localPosition = Vector3(x, y, self.OldPosZ)
        end
    end
end

return M