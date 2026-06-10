-- Code Auto Create Begin
local M = Class('SettingPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SettingPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SettingPop_UI].prefab'
    self.Name = 'Form[SettingPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'UpperLeftBtnPanel','UpperLeftBtnPanel',2},{'Btn_GoBack','UpperLeftBtnPanel/Btn_GoBack',2},{'Btn_Help','UpperLeftBtnPanel/Btn_Help',2},{'LeftPanel','LeftPanel',2},{'Tog_Agreement','LeftPanel/Content/Tog_Agreement',2},{'Normal','LeftPanel/Content/Tog_Agreement/Normal',2},{'weixuanzhongdi','LeftPanel/Content/Tog_Agreement/Normal/weixuanzhongdi',2},{'Highlight','LeftPanel/Content/Tog_Agreement/Highlight',2},{'xuanzhongdi','LeftPanel/Content/Tog_Agreement/Highlight/xuanzhongdi',2},{'Tog_Game','LeftPanel/Content/Tog_Game',2},{'Normal01','LeftPanel/Content/Tog_Game/Normal',2},{'weixuanzhongdi01','LeftPanel/Content/Tog_Game/Normal/weixuanzhongdi',2},{'Highlight01','LeftPanel/Content/Tog_Game/Highlight',2},{'xuanzhongdi01','LeftPanel/Content/Tog_Game/Highlight/xuanzhongdi',2},{'Tog_Audio','LeftPanel/Content/Tog_Audio',2},{'Normal02','LeftPanel/Content/Tog_Audio/Normal',2},{'weixuanzhongdi02','LeftPanel/Content/Tog_Audio/Normal/weixuanzhongdi',2},{'Highlight02','LeftPanel/Content/Tog_Audio/Highlight',2},{'xuanzhongdi02','LeftPanel/Content/Tog_Audio/Highlight/xuanzhongdi',2},{'Tog_Remind','LeftPanel/Content/Tog_Remind',2},{'Normal03','LeftPanel/Content/Tog_Remind/Normal',2},{'weixuanzhongdi03','LeftPanel/Content/Tog_Remind/Normal/weixuanzhongdi',2},{'Highlight03','LeftPanel/Content/Tog_Remind/Highlight',2},{'xuanzhongdi03','LeftPanel/Content/Tog_Remind/Highlight/xuanzhongdi',2},{'Tog_Code','LeftPanel/Content/Tog_Code',2},{'Normal04','LeftPanel/Content/Tog_Code/Normal',2},{'weixuanzhongdi04','LeftPanel/Content/Tog_Code/Normal/weixuanzhongdi',2},{'Highlight04','LeftPanel/Content/Tog_Code/Highlight',2},{'xuanzhongdi04','LeftPanel/Content/Tog_Code/Highlight/xuanzhongdi',2},{'Tog_Drama','LeftPanel/Content/Tog_Drama',2},{'Normal05','LeftPanel/Content/Tog_Drama/Normal',2},{'weixuanzhongdi05','LeftPanel/Content/Tog_Drama/Normal/weixuanzhongdi',2},{'Highlight05','LeftPanel/Content/Tog_Drama/Highlight',2},{'xuanzhongdi05','LeftPanel/Content/Tog_Drama/Highlight/xuanzhongdi',2},{'Tog_Plot','LeftPanel/Content/Tog_Plot',2},{'Normal06','LeftPanel/Content/Tog_Plot/Normal',2},{'weixuanzhongdi06','LeftPanel/Content/Tog_Plot/Normal/weixuanzhongdi',2},{'Highlight06','LeftPanel/Content/Tog_Plot/Highlight',2},{'xuanzhongdi06','LeftPanel/Content/Tog_Plot/Highlight/xuanzhongdi',2},{'Btn_ReSetting','LeftPanel/Btn_ReSetting',2},{'RightPanel','RightPanel',2},{'AgreementRoot','RightPanel/AgreementRoot',2},{'Img_Biaotixian1','RightPanel/AgreementRoot/Text_Title/Img_Biaotixian1',2},{'Slip2_US','RightPanel/AgreementRoot/Slips/Slip2_US',2},{'Btn_US','RightPanel/AgreementRoot/Slips/Slip2_US/Btn_US',2},{'Slip2_RU','RightPanel/AgreementRoot/Slips/Slip2_RU',2},{'Btn_RU','RightPanel/AgreementRoot/Slips/Slip2_RU/Btn_RU',2},{'Img_Biaotixian101','RightPanel/AgreementRoot/Text_Title/Img_Biaotixian1',2},{'Slip2_US01','RightPanel/AgreementRoot/Slips/Slip2_US01',2},{'Btn_US01','RightPanel/AgreementRoot/Slips/Slip2_US01/Btn_US01',2},{'Slip2_RU01','RightPanel/AgreementRoot/Slips/Slip2_RU01',2},{'Btn_RU01','RightPanel/AgreementRoot/Slips/Slip2_RU01/Btn_RU',2},{'Slip2_US02','RightPanel/AgreementRoot/Slips/Slip2_US02',2},{'Btn_US02','RightPanel/AgreementRoot/Slips/Slip2_US02/Btn_US02',2},{'Slip2_RU02','RightPanel/AgreementRoot/Slips/Slip2_RU02',2},{'Btn_RU02','RightPanel/AgreementRoot/Slips/Slip2_RU02/Btn_RU',2},{'Btn_Agree_Switch','RightPanel/AgreementRoot/Btn_Agree_Switch',2},{'Switchicon','RightPanel/AgreementRoot/Btn_Agree_Switch/Switchicon',2},{'Game','RightPanel/Game',2},{'GameViewPort','RightPanel/Game/GameViewPort',2},{'GameRoot','RightPanel/Game/GameViewPort/GameRoot',2},{'Img_Biaotixian102','RightPanel/Game/GameViewPort/GameRoot/Text_Title/Img_Biaotixian1',2},{'Slip_Quality','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality',2},{'TG_Quality','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality',2},{'Tog_QualityD','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityD',2},{'Tog_QualityN','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityN',2},{'Tog_QualityH','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityH',2},{'Slip_Speed','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed',2},{'TG_Speed','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed',2},{'Tog_Speed1','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed1',2},{'Tog_Speed2','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed2',2},{'Tog_Speed3','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed3',2},{'Slip_Footage','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage',2},{'TG_Footage','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/TG_Footage',2},{'Tog_FootageOn','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/TG_Footage/Tog_FootageOn',2},{'Tog_FootageOff','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/TG_Footage/Tog_FootageOff',2},{'Slip_EX','RightPanel/Game/GameViewPort/GameRoot/Slip_EX',2},{'TG_EX','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX',2},{'Tog_EXOn','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOn',2},{'Tog_EXOnce','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOnce',2},{'Tog_EXOff','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOff',2},{'1','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1',2},{'101','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1',2},{'102','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1',2},{'103','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1',2},{'Slip_PostGirl','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl',2},{'TG_PostGirl','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/TG_PostGirl',2},{'TG_PGDefault','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/TG_PostGirl/TG_PGDefault',2},{'TG_PGRandom','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/TG_PostGirl/TG_PGRandom',2},{'Slip_Home','RightPanel/Game/GameViewPort/GameRoot/Slip_Home',2},{'TG_Anime','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime',2},{'TG_AniOn','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniOn',2},{'TG_AniDaily','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniDaily',2},{'TG_AniOff','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniOff',2},{'Slip_Spine','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine',2},{'TG_Spine','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/TG_Spine',2},{'Tog_SpineOn','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/TG_Spine/Tog_SpineOn',2},{'Tog_SpineOff','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/TG_Spine/Tog_SpineOff',2},{'Slip_Fringe','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe',2},{'Background','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe/Slider_Fringe/Background',2},{'Fill','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe/Slider_Fringe/Fill Area/Fill',2},{'Handle','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe/Slider_Fringe/Handle Slide Area/Handle',2},{'Handle(1)','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe/Slider_Fringe/Handle Slide Area/Handle/Handle (1)',2},{'SetPicture','RightPanel/Game/GameViewPort/GameRoot/SetPicture',2},{'TTT','RightPanel/Game/GameViewPort/GameRoot/SetPicture/TTT',2},{'Tog_SelectALL','RightPanel/Game/GameViewPort/GameRoot/SetPicture/TTT/Tog_SelectALL',2},{'PicturePrefab','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab',2},{'Img_Bg','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab/Img_Bg',2},{'Img_Icon','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab/Img_Bg/Img_Icon',2},{'Gou','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab/Gou',2},{'GouIcon','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab/Gou/GouIcon',2},{'Content','RightPanel/Game/GameViewPort/GameRoot/SetPicture/Content',2},{'Btn','RightPanel/Game/GameViewPort/GameRoot/Btn',2},{'Btn_tingyong','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_tingyong',2},{'Centericon','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_tingyong/Centericon',2},{'Btn_DC','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_DC',2},{'DCicon','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_DC/DCicon',2},{'Btn_FB','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_FB',2},{'FBicon','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_FB/FBicon',2},{'Btn_Kefu','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_Kefu',2},{'Kefuicon','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_Kefu/Kefuicon',2},{'Btn_Switch','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_Switch',2},{'Switchicon01','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_Switch/Switchicon',2},{'SoundRoot','RightPanel/SoundRoot',2},{'Content01','RightPanel/SoundRoot/Content',2},{'Img_Biaotixian103','RightPanel/SoundRoot/Content/Text_Title/Img_Biaotixian1',2},{'Slip_SAll','RightPanel/SoundRoot/Content/Slip_SAll',2},{'TG_AllSound','RightPanel/SoundRoot/Content/Slip_SAll/TG_AllSound',2},{'Tog_AllSoundOn','RightPanel/SoundRoot/Content/Slip_SAll/TG_AllSound/Tog_AllSoundOn',2},{'Tog_AllSoundOff','RightPanel/SoundRoot/Content/Slip_SAll/TG_AllSound/Tog_AllSoundOff',2},{'Slip_STap','RightPanel/SoundRoot/Content/Slip_STap',2},{'TG_AllSound01','RightPanel/SoundRoot/Content/Slip_STap/TG_AllSound',2},{'Tog_AllSoundOn01','RightPanel/SoundRoot/Content/Slip_STap/TG_AllSound/Tog_AllSoundOn',2},{'Tog_AllSoundOff01','RightPanel/SoundRoot/Content/Slip_STap/TG_AllSound/Tog_AllSoundOff',2},{'Slip_SBG','RightPanel/SoundRoot/Content/Slip_SBG',2},{'Img_SBGOff','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG/Img_SBGOff',2},{'Img_SBGOn','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG/Img_SBGOn',2},{'Background01','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG/Background',2},{'Fill01','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG/Fill Area/Fill',2},{'Handle01','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG/Handle Slide Area/Handle',2},{'Handle(1)01','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG/Handle Slide Area/Handle/Handle (1)',2},{'Slip_SEffect','RightPanel/SoundRoot/Content/Slip_SEffect',2},{'Img_SEffectOff','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect/Img_SEffectOff',2},{'Img_SEffectOn','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect/Img_SEffectOn',2},{'Background02','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect/Background',2},{'Fill02','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect/Fill Area/Fill',2},{'Handle02','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect/Handle Slide Area/Handle',2},{'Handle(1)02','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect/Handle Slide Area/Handle/Handle (1)',2},{'Slip_SRole','RightPanel/SoundRoot/Content/Slip_SRole',2},{'Img_SRoleOff','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole/Img_SRoleOff',2},{'Img_SRoleOn','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole/Img_SRoleOn',2},{'Background03','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole/Background',2},{'Fill03','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole/Fill Area/Fill',2},{'Handle03','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole/Handle Slide Area/Handle',2},{'Handle(1)03','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole/Handle Slide Area/Handle/Handle (1)',2},{'Slip_MainRole','RightPanel/SoundRoot/Content/Slip_MainRole',2},{'TG_AllSound02','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound',2},{'Tog_AllSoundOn02','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOn',2},{'Tog_AllSoundOnce','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOnce',2},{'Tog_AllSoundOff02','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOff',2},{'Roles','RightPanel/SoundRoot/Content/Roles',2},{'Img_Head1','RightPanel/SoundRoot/Content/Roles/Role1/Img_Head1',2},{'Img_Icon01','RightPanel/SoundRoot/Content/Roles/Role1/Img_Head1/Img_Icon',2},{'Btn_Stop1','RightPanel/SoundRoot/Content/Roles/Role1/Img_Head1/Text_Name/Btn_Stop1',2},{'Btn_Play1','RightPanel/SoundRoot/Content/Roles/Role1/Img_Head1/Text_Name/Btn_Play1',2},{'TG_Role1','RightPanel/SoundRoot/Content/Roles/Role1/TG_Role1',2},{'Tog_Role1On','RightPanel/SoundRoot/Content/Roles/Role1/TG_Role1/Tog_Role1On',2},{'Tog_Role1Off','RightPanel/SoundRoot/Content/Roles/Role1/TG_Role1/Tog_Role1Off',2},{'Img_Head2','RightPanel/SoundRoot/Content/Roles/Role2/Img_Head2',2},{'Img_Icon02','RightPanel/SoundRoot/Content/Roles/Role2/Img_Head2/Img_Icon',2},{'Btn_Stop2','RightPanel/SoundRoot/Content/Roles/Role2/Img_Head2/Text_Name/Btn_Stop2',2},{'Btn_Play2','RightPanel/SoundRoot/Content/Roles/Role2/Img_Head2/Text_Name/Btn_Play2',2},{'TG_Role2','RightPanel/SoundRoot/Content/Roles/Role2/TG_Role2',2},{'Tog_Role2On','RightPanel/SoundRoot/Content/Roles/Role2/TG_Role2/Tog_Role2On',2},{'Tog_Role2Off','RightPanel/SoundRoot/Content/Roles/Role2/TG_Role2/Tog_Role2Off',2},{'Img_Head3','RightPanel/SoundRoot/Content/Roles/Role3/Img_Head3',2},{'Img_Icon03','RightPanel/SoundRoot/Content/Roles/Role3/Img_Head3/Img_Icon',2},{'Btn_Stop3','RightPanel/SoundRoot/Content/Roles/Role3/Img_Head3/Text_Name/Btn_Stop3',2},{'Btn_Play3','RightPanel/SoundRoot/Content/Roles/Role3/Img_Head3/Text_Name/Btn_Play3',2},{'TG_Role3','RightPanel/SoundRoot/Content/Roles/Role3/TG_Role3',2},{'Tog_Role3On','RightPanel/SoundRoot/Content/Roles/Role3/TG_Role3/Tog_Role3On',2},{'Tog_Role3Off','RightPanel/SoundRoot/Content/Roles/Role3/TG_Role3/Tog_Role3Off',2},{'Img_Head4','RightPanel/SoundRoot/Content/Roles/Role4/Img_Head4',2},{'Img_Icon04','RightPanel/SoundRoot/Content/Roles/Role4/Img_Head4/Img_Icon',2},{'Btn_Stop4','RightPanel/SoundRoot/Content/Roles/Role4/Img_Head4/Text_Name/Btn_Stop4',2},{'Btn_Play4','RightPanel/SoundRoot/Content/Roles/Role4/Img_Head4/Text_Name/Btn_Play4',2},{'TG_Role4','RightPanel/SoundRoot/Content/Roles/Role4/TG_Role4',2},{'Tog_Role4On','RightPanel/SoundRoot/Content/Roles/Role4/TG_Role4/Tog_Role4On',2},{'Tog_Role4Off','RightPanel/SoundRoot/Content/Roles/Role4/TG_Role4/Tog_Role4Off',2},{'Img_Head5','RightPanel/SoundRoot/Content/Roles/Role5/Img_Head5',2},{'Img_Icon05','RightPanel/SoundRoot/Content/Roles/Role5/Img_Head5/Img_Icon',2},{'Btn_Stop5','RightPanel/SoundRoot/Content/Roles/Role5/Img_Head5/Text_Name/Btn_Stop5',2},{'Btn_Play5','RightPanel/SoundRoot/Content/Roles/Role5/Img_Head5/Text_Name/Btn_Play5',2},{'TG_Role5','RightPanel/SoundRoot/Content/Roles/Role5/TG_Role5',2},{'Tog_Role5On','RightPanel/SoundRoot/Content/Roles/Role5/TG_Role5/Tog_Role5On',2},{'Tog_Role5Off','RightPanel/SoundRoot/Content/Roles/Role5/TG_Role5/Tog_Role5Off',2},{'Img_Head6','RightPanel/SoundRoot/Content/Roles/Role6/Img_Head6',2},{'Img_Icon06','RightPanel/SoundRoot/Content/Roles/Role6/Img_Head6/Img_Icon',2},{'Btn_Stop6','RightPanel/SoundRoot/Content/Roles/Role6/Img_Head6/Text_Name/Btn_Stop6',2},{'Btn_Play6','RightPanel/SoundRoot/Content/Roles/Role6/Img_Head6/Text_Name/Btn_Play6',2},{'TG_Role6','RightPanel/SoundRoot/Content/Roles/Role6/TG_Role6',2},{'Tog_Role6On','RightPanel/SoundRoot/Content/Roles/Role6/TG_Role6/Tog_Role6On',2},{'Tog_Role6Off','RightPanel/SoundRoot/Content/Roles/Role6/TG_Role6/Tog_Role6Off',2},{'Img_Head7','RightPanel/SoundRoot/Content/Roles/Role7/Img_Head7',2},{'Img_Icon07','RightPanel/SoundRoot/Content/Roles/Role7/Img_Head7/Img_Icon',2},{'Btn_Stop7','RightPanel/SoundRoot/Content/Roles/Role7/Img_Head7/Text_Name/Btn_Stop7',2},{'Btn_Play7','RightPanel/SoundRoot/Content/Roles/Role7/Img_Head7/Text_Name/Btn_Play7',2},{'TG_Role7','RightPanel/SoundRoot/Content/Roles/Role7/TG_Role7',2},{'Tog_Role7On','RightPanel/SoundRoot/Content/Roles/Role7/TG_Role7/Tog_Role7On',2},{'Tog_Role7Off','RightPanel/SoundRoot/Content/Roles/Role7/TG_Role7/Tog_Role7Off',2},{'RemindRoot','RightPanel/RemindRoot',2},{'Img_Biaotixian104','RightPanel/RemindRoot/Text_Title/Img_Biaotixian1',2},{'Slip_Power','RightPanel/RemindRoot/Slip_Power',2},{'TG_Power','RightPanel/RemindRoot/Slip_Power/TG_Power',2},{'Tog_PowerOn','RightPanel/RemindRoot/Slip_Power/TG_Power/Tog_PowerOn',2},{'Tog_PowerOff','RightPanel/RemindRoot/Slip_Power/TG_Power/Tog_PowerOff',2},{'Slip_WBRemind','RightPanel/RemindRoot/Slip_WBRemind',2},{'TG_WBRemind','RightPanel/RemindRoot/Slip_WBRemind/TG_WBRemind',2},{'Tog_WBROn','RightPanel/RemindRoot/Slip_WBRemind/TG_WBRemind/Tog_WBROn',2},{'Tog_WBROff','RightPanel/RemindRoot/Slip_WBRemind/TG_WBRemind/Tog_WBROff',2},{'Slip_PvpReMind','RightPanel/RemindRoot/Slip_PvpReMind',2},{'TG_PvpReMind','RightPanel/RemindRoot/Slip_PvpReMind/TG_PvpReMind',2},{'Tog_PROn','RightPanel/RemindRoot/Slip_PvpReMind/TG_PvpReMind/Tog_PROn',2},{'Tog_PROff','RightPanel/RemindRoot/Slip_PvpReMind/TG_PvpReMind/Tog_PROff',2},{'CodeRoot','RightPanel/CodeRoot',2},{'Btn_Code','RightPanel/CodeRoot/Btn_Code',2},{'Input_Code','RightPanel/CodeRoot/Input_Code',2},{'PlotRoot','RightPanel/PlotRoot',2},{'DramaRoot','RightPanel/DramaRoot',2},{'Img_Biaotixian105','RightPanel/DramaRoot/Text_Title/Img_Biaotixian1',2},{'Btn_Drama','RightPanel/DramaRoot/Btn_Drama',2},{'BG','RightPanel/DramaRoot/Btn_Drama/BG',2},{'Img_Frame','RightPanel/DramaRoot/Btn_Drama/Img_Frame',2},{'Sanjiao','RightPanel/DramaRoot/Btn_Drama/Img_Frame/Sanjiao',2},{'Img_IDdi','RightPanel/DramaRoot/Btn_Drama/Text_DramaName/Img_IDdi',2},{'Slip_PA','RightPanel/DramaRoot/Slip_PA',2},{'Background04','RightPanel/DramaRoot/Slip_PA/Slider_PA/Background',2},{'Fill04','RightPanel/DramaRoot/Slip_PA/Slider_PA/Fill Area/Fill',2},{'Handle04','RightPanel/DramaRoot/Slip_PA/Slider_PA/Handle Slide Area/Handle',2},{'Handle(1)04','RightPanel/DramaRoot/Slip_PA/Slider_PA/Handle Slide Area/Handle/Handle (1)',2},{'Slip_PS','RightPanel/DramaRoot/Slip_PS',2},{'Background05','RightPanel/DramaRoot/Slip_PS/Slider_PS/Background',2},{'Fill05','RightPanel/DramaRoot/Slip_PS/Slider_PS/Fill Area/Fill',2},{'Handle05','RightPanel/DramaRoot/Slip_PS/Slider_PS/Handle Slide Area/Handle',2},{'Handle(1)05','RightPanel/DramaRoot/Slip_PS/Slider_PS/Handle Slide Area/Handle/Handle (1)',2},{'Slip_PAS','RightPanel/DramaRoot/Slip_PAS',2},{'Background06','RightPanel/DramaRoot/Slip_PAS/Slider_PAS/Background',2},{'Fill06','RightPanel/DramaRoot/Slip_PAS/Slider_PAS/Fill Area/Fill',2},{'Handle06','RightPanel/DramaRoot/Slip_PAS/Slider_PAS/Handle Slide Area/Handle',2},{'Handle(1)06','RightPanel/DramaRoot/Slip_PAS/Slider_PAS/Handle Slide Area/Handle/Handle (1)',2},{'LianxieDaimaPop','RightPanel/LianxieDaimaPop',2},{'BlurMask01','RightPanel/LianxieDaimaPop/BlurMask',2},{'Panel','RightPanel/LianxieDaimaPop/Panel',2},{'Img_Xian1','RightPanel/LianxieDaimaPop/Panel/Img_Xian1',2},{'Img_Xian2','RightPanel/LianxieDaimaPop/Panel/Img_Xian2',2},{'Img_Biaotixian','RightPanel/LianxieDaimaPop/Panel/Text_Name/Img_Biaotixian',2},{'Input_ZhanghuDaima','RightPanel/LianxieDaimaPop/Panel/Input_ZhanghuDaima',2},{'Btn_Copy1','RightPanel/LianxieDaimaPop/Panel/Btn_Copy1',2},{'Input_MimaDaima','RightPanel/LianxieDaimaPop/Panel/Input_MimaDaima',2},{'Btn_Shengcheng','RightPanel/LianxieDaimaPop/Panel/Btn_Shengcheng',2},{'Btn_Copy2','RightPanel/LianxieDaimaPop/Panel/Btn_Copy2',2},{'HuanbangPop','RightPanel/HuanbangPop',2},{'BlurMask02','RightPanel/HuanbangPop/BlurMask',2},{'Panel01','RightPanel/HuanbangPop/Panel',2},{'Img_Xian201','RightPanel/HuanbangPop/Panel/Img_Xian2',2},{'Img_Xian101','RightPanel/HuanbangPop/Panel/Img_Xian1',2},{'Btn_Xiaochu','RightPanel/HuanbangPop/Panel/Btn_Xiaochu',2},{'Bangdingzhong_light','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Bangdingzhong/Bangdingzhong_light',2},{'Bangdingzhong_grey','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Bangdingzhong/Bangdingzhong_grey',2},{'Input_Zhanghao','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Input_Zhanghao',2},{'Btn_Bangding','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Btn_Bangding',2},{'Bangdingzhong_light01','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Bangdingzhong/Bangdingzhong_light',2},{'Bangdingzhong_grey01','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Bangdingzhong/Bangdingzhong_grey',2},{'Input_Zhanghao01','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Input_Zhanghao',2},{'Btn_Bangding01','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Btn_Bangding',2},{'Img_Biaotixian01','RightPanel/HuanbangPop/Panel/Text_Name/Img_Biaotixian',2},{'ShezhimimaPop','RightPanel/ShezhimimaPop',2},{'BlurMask03','RightPanel/ShezhimimaPop/BlurMask',2},{'Panel02','RightPanel/ShezhimimaPop/Panel',2},{'Img_Xian102','RightPanel/ShezhimimaPop/Panel/Img_Xian1',2},{'Img_Xian202','RightPanel/ShezhimimaPop/Panel/Img_Xian2',2},{'Img_Biaotixian02','RightPanel/ShezhimimaPop/Panel/Text_Name/Img_Biaotixian',2},{'Input_Shezhimima','RightPanel/ShezhimimaPop/Panel/Input_Shezhimima',2},{'Input_Querenmima','RightPanel/ShezhimimaPop/Panel/Input_Querenmima',2},{'Btn_Quxiao','RightPanel/ShezhimimaPop/Panel/Btn_Quxiao',2},{'Btn_Denglu','RightPanel/ShezhimimaPop/Panel/Btn_Denglu',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Slider 列表
        {'Slider_Fringe','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe/Slider_Fringe',5},{'Slider_SBG','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG',5},{'Slider_SEffect','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect',5},{'Slider_SRole','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole',5},{'Slider_PA','RightPanel/DramaRoot/Slip_PA/Slider_PA',5},{'Slider_PS','RightPanel/DramaRoot/Slip_PS/Slider_PS',5},{'Slider_PAS','RightPanel/DramaRoot/Slip_PAS/Slider_PAS',5},
        -- Toggle 列表
        {'Tog_Agreement01','LeftPanel/Content/Tog_Agreement',13},{'Tog_Game01','LeftPanel/Content/Tog_Game',13},{'Tog_Audio01','LeftPanel/Content/Tog_Audio',13},{'Tog_Remind01','LeftPanel/Content/Tog_Remind',13},{'Tog_Code01','LeftPanel/Content/Tog_Code',13},{'Tog_Drama01','LeftPanel/Content/Tog_Drama',13},{'Tog_Plot01','LeftPanel/Content/Tog_Plot',13},{'Tog_Empty','LeftPanel/Content/Tog_Empty',13},{'Tog_QualityD01','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityD',13},{'Tog_QualityN01','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityN',13},{'Tog_QualityH01','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityH',13},{'Tog_Speed101','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed1',13},{'Tog_Speed201','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed2',13},{'Tog_Speed301','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed3',13},{'Tog_FootageOn01','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/TG_Footage/Tog_FootageOn',13},{'Tog_FootageOff01','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/TG_Footage/Tog_FootageOff',13},{'Tog_EXOn01','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOn',13},{'Tog_EXOnce01','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOnce',13},{'Tog_EXOff01','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOff',13},{'104','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1',13},{'105','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1',13},{'106','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1',13},{'TG_PGDefault01','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/TG_PostGirl/TG_PGDefault',13},{'TG_PGRandom01','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/TG_PostGirl/TG_PGRandom',13},{'TG_AniOn01','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniOn',13},{'TG_AniDaily01','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniDaily',13},{'TG_AniOff01','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniOff',13},{'Tog_SpineOn01','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/TG_Spine/Tog_SpineOn',13},{'Tog_SpineOff01','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/TG_Spine/Tog_SpineOff',13},{'Img_Bg01','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab/Img_Bg',13},{'Gou01','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab/Gou',13},{'Tog_AllSoundOn03','RightPanel/SoundRoot/Content/Slip_SAll/TG_AllSound/Tog_AllSoundOn',13},{'Tog_AllSoundOff03','RightPanel/SoundRoot/Content/Slip_SAll/TG_AllSound/Tog_AllSoundOff',13},{'Tog_AllSoundOn04','RightPanel/SoundRoot/Content/Slip_STap/TG_AllSound/Tog_AllSoundOn',13},{'Tog_AllSoundOff04','RightPanel/SoundRoot/Content/Slip_STap/TG_AllSound/Tog_AllSoundOff',13},{'Tog_AllSoundOn05','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOn',13},{'Tog_AllSoundOnce01','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOnce',13},{'Tog_AllSoundOff05','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOff',13},{'Img_Head101','RightPanel/SoundRoot/Content/Roles/Role1/Img_Head1',13},{'Tog_Role1On01','RightPanel/SoundRoot/Content/Roles/Role1/TG_Role1/Tog_Role1On',13},{'Tog_Role1Off01','RightPanel/SoundRoot/Content/Roles/Role1/TG_Role1/Tog_Role1Off',13},{'Img_Head201','RightPanel/SoundRoot/Content/Roles/Role2/Img_Head2',13},{'Tog_Role2On01','RightPanel/SoundRoot/Content/Roles/Role2/TG_Role2/Tog_Role2On',13},{'Tog_Role2Off01','RightPanel/SoundRoot/Content/Roles/Role2/TG_Role2/Tog_Role2Off',13},{'Img_Head301','RightPanel/SoundRoot/Content/Roles/Role3/Img_Head3',13},{'Tog_Role3On01','RightPanel/SoundRoot/Content/Roles/Role3/TG_Role3/Tog_Role3On',13},{'Tog_Role3Off01','RightPanel/SoundRoot/Content/Roles/Role3/TG_Role3/Tog_Role3Off',13},{'Img_Head401','RightPanel/SoundRoot/Content/Roles/Role4/Img_Head4',13},{'Tog_Role4On01','RightPanel/SoundRoot/Content/Roles/Role4/TG_Role4/Tog_Role4On',13},{'Tog_Role4Off01','RightPanel/SoundRoot/Content/Roles/Role4/TG_Role4/Tog_Role4Off',13},{'Img_Head501','RightPanel/SoundRoot/Content/Roles/Role5/Img_Head5',13},{'Tog_Role5On01','RightPanel/SoundRoot/Content/Roles/Role5/TG_Role5/Tog_Role5On',13},{'Tog_Role5Off01','RightPanel/SoundRoot/Content/Roles/Role5/TG_Role5/Tog_Role5Off',13},{'Img_Head601','RightPanel/SoundRoot/Content/Roles/Role6/Img_Head6',13},{'Tog_Role6On01','RightPanel/SoundRoot/Content/Roles/Role6/TG_Role6/Tog_Role6On',13},{'Tog_Role6Off01','RightPanel/SoundRoot/Content/Roles/Role6/TG_Role6/Tog_Role6Off',13},{'Img_Head701','RightPanel/SoundRoot/Content/Roles/Role7/Img_Head7',13},{'Tog_Role7On01','RightPanel/SoundRoot/Content/Roles/Role7/TG_Role7/Tog_Role7On',13},{'Tog_Role7Off01','RightPanel/SoundRoot/Content/Roles/Role7/TG_Role7/Tog_Role7Off',13},{'Tog_PowerOn01','RightPanel/RemindRoot/Slip_Power/TG_Power/Tog_PowerOn',13},{'Tog_PowerOff01','RightPanel/RemindRoot/Slip_Power/TG_Power/Tog_PowerOff',13},{'Tog_WBROn01','RightPanel/RemindRoot/Slip_WBRemind/TG_WBRemind/Tog_WBROn',13},{'Tog_WBROff01','RightPanel/RemindRoot/Slip_WBRemind/TG_WBRemind/Tog_WBROff',13},{'Tog_PROn01','RightPanel/RemindRoot/Slip_PvpReMind/TG_PvpReMind/Tog_PROn',13},{'Tog_PROff01','RightPanel/RemindRoot/Slip_PvpReMind/TG_PvpReMind/Tog_PROff',13},
        -- TextMeshProUGUI 列表
        {'EnText','LeftPanel/Content/Tog_Agreement/Normal/EnText',20},{'CNText','LeftPanel/Content/Tog_Agreement/Normal/CNText',20},{'EnText01','LeftPanel/Content/Tog_Agreement/Highlight/EnText',20},{'CNText01','LeftPanel/Content/Tog_Agreement/Highlight/CNText',20},{'EnText02','LeftPanel/Content/Tog_Game/Normal/EnText',20},{'CNText02','LeftPanel/Content/Tog_Game/Normal/CNText',20},{'EnText03','LeftPanel/Content/Tog_Game/Highlight/EnText',20},{'CNText03','LeftPanel/Content/Tog_Game/Highlight/CNText',20},{'EnText04','LeftPanel/Content/Tog_Audio/Normal/EnText',20},{'CNText04','LeftPanel/Content/Tog_Audio/Normal/CNText',20},{'EnText05','LeftPanel/Content/Tog_Audio/Highlight/EnText',20},{'CNText05','LeftPanel/Content/Tog_Audio/Highlight/CNText',20},{'EnText06','LeftPanel/Content/Tog_Remind/Normal/EnText',20},{'CNText06','LeftPanel/Content/Tog_Remind/Normal/CNText',20},{'EnText07','LeftPanel/Content/Tog_Remind/Highlight/EnText',20},{'CNText07','LeftPanel/Content/Tog_Remind/Highlight/CNText',20},{'EnText08','LeftPanel/Content/Tog_Code/Normal/EnText',20},{'CNText08','LeftPanel/Content/Tog_Code/Normal/CNText',20},{'EnText09','LeftPanel/Content/Tog_Code/Highlight/EnText',20},{'CNText09','LeftPanel/Content/Tog_Code/Highlight/CNText',20},{'EnText10','LeftPanel/Content/Tog_Drama/Normal/EnText',20},{'CNText10','LeftPanel/Content/Tog_Drama/Normal/CNText',20},{'EnText11','LeftPanel/Content/Tog_Drama/Highlight/EnText',20},{'CNText11','LeftPanel/Content/Tog_Drama/Highlight/CNText',20},{'EnText12','LeftPanel/Content/Tog_Plot/Normal/EnText',20},{'CNText12','LeftPanel/Content/Tog_Plot/Normal/CNText',20},{'EnText13','LeftPanel/Content/Tog_Plot/Highlight/EnText',20},{'CNText13','LeftPanel/Content/Tog_Plot/Highlight/CNText',20},{'Text_Huifumoren','LeftPanel/Btn_ReSetting/Text_Huifumoren',20},{'Text_Title','RightPanel/AgreementRoot/Text_Title',20},{'Text_TN','RightPanel/AgreementRoot/Slips/Slip2_US/Text_TN',20},{'Text_N','RightPanel/AgreementRoot/Slips/Slip2_US/Btn_US/Text_N',20},{'Text_TN01','RightPanel/AgreementRoot/Slips/Slip2_RU/Text_TN',20},{'Text_N01','RightPanel/AgreementRoot/Slips/Slip2_RU/Btn_RU/Text_N',20},{'Text_Title01','RightPanel/AgreementRoot/Text_Title',20},{'Text_TN02','RightPanel/AgreementRoot/Slips/Slip2_US01/Text_TN',20},{'Text_N02','RightPanel/AgreementRoot/Slips/Slip2_US01/Btn_US01/Text_N',20},{'Text_TN03','RightPanel/AgreementRoot/Slips/Slip2_RU01/Text_TN',20},{'Text_N03','RightPanel/AgreementRoot/Slips/Slip2_RU01/Btn_RU/Text_N',20},{'Text_TN04','RightPanel/AgreementRoot/Slips/Slip2_US02/Text_TN',20},{'Text_N04','RightPanel/AgreementRoot/Slips/Slip2_US02/Btn_US02/Text_N',20},{'Text_TN05','RightPanel/AgreementRoot/Slips/Slip2_RU02/Text_TN',20},{'Text_N05','RightPanel/AgreementRoot/Slips/Slip2_RU02/Btn_RU/Text_N',20},{'Text_Switch','RightPanel/AgreementRoot/Btn_Agree_Switch/Text_Switch',20},{'Text_Title02','RightPanel/Game/GameViewPort/GameRoot/Text_Title',20},{'Text_TN06','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/Text_TN',20},{'Text_Des','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/Text_Des',20},{'Text_D','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityD/Text_D',20},{'Text_N06','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityN/Text_N',20},{'Text_N07','RightPanel/Game/GameViewPort/GameRoot/Slip_Quality/TG_Quality/Tog_QualityH/Text_N',20},{'Text_TN07','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/Text_TN',20},{'Text_N08','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed1/Text_N',20},{'Text_N09','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed2/Text_N',20},{'Text_N10','RightPanel/Game/GameViewPort/GameRoot/Slip_Speed/TG_Speed/Tog_Speed3/Text_N',20},{'Text_TN08','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/Text_TN',20},{'Text_N11','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/TG_Footage/Tog_FootageOn/Text_N',20},{'Text_N12','RightPanel/Game/GameViewPort/GameRoot/Slip_Footage/TG_Footage/Tog_FootageOff/Text_N',20},{'Text_TN09','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/Text_TN',20},{'Text_N13','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOn/Text_N',20},{'Text_N14','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOnce/Text_N',20},{'Text_N15','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/TG_EX/Tog_EXOff/Text_N',20},{'Text_N16','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1/Text_N',20},{'Text_N17','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1/Text_N',20},{'Text_N18','RightPanel/Game/GameViewPort/GameRoot/Slip_EX/1/1/Text_N',20},{'Text_TN10','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/Text_TN',20},{'Text_N19','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/TG_PostGirl/TG_PGDefault/Text_N',20},{'Text_N20','RightPanel/Game/GameViewPort/GameRoot/Slip_PostGirl/TG_PostGirl/TG_PGRandom/Text_N',20},{'Text_TN11','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/Text_TN',20},{'Text_N21','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniOn/Text_N',20},{'Text_N22','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniDaily/Text_N',20},{'Text_N23','RightPanel/Game/GameViewPort/GameRoot/Slip_Home/TG_Anime/TG_AniOff/Text_N',20},{'Text_TN12','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/Text_TN',20},{'Text_N24','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/TG_Spine/Tog_SpineOn/Text_N',20},{'Text_N25','RightPanel/Game/GameViewPort/GameRoot/Slip_Spine/TG_Spine/Tog_SpineOff/Text_N',20},{'Text_TN13','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe/Text_TN',20},{'Text_Fringe','RightPanel/Game/GameViewPort/GameRoot/Slip_Fringe/Slider_Fringe/Text_Fringe',20},{'Text_Title03','RightPanel/Game/GameViewPort/GameRoot/SetPicture/TTT/Text_Title',20},{'Text_Shu','RightPanel/Game/GameViewPort/GameRoot/SetPicture/TTT/Text_Shu',20},{'Text_N26','RightPanel/Game/GameViewPort/GameRoot/SetPicture/TTT/Tog_SelectALL/Text_N',20},{'Text_Name','RightPanel/Game/GameViewPort/GameRoot/SetPicture/PicturePrefab/Img_Bg/Text_Name',20},{'Text_Center','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_tingyong/Text_Center',20},{'Text_DC','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_DC/Text_DC',20},{'Text_FB','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_FB/Text_FB',20},{'Text_Kefu','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_Kefu/Text_Kefu',20},{'Text_Switch01','RightPanel/Game/GameViewPort/GameRoot/Btn/Btn_Switch/Text_Switch',20},{'Text_GRemind','RightPanel/Game/Text_GRemind',20},{'Text_Title04','RightPanel/SoundRoot/Content/Text_Title',20},{'Text_TN14','RightPanel/SoundRoot/Content/Slip_SAll/Text_TN',20},{'Text_N27','RightPanel/SoundRoot/Content/Slip_SAll/TG_AllSound/Tog_AllSoundOn/Text_N',20},{'Text_N28','RightPanel/SoundRoot/Content/Slip_SAll/TG_AllSound/Tog_AllSoundOff/Text_N',20},{'Text_TN15','RightPanel/SoundRoot/Content/Slip_STap/Text_TN',20},{'Text_N29','RightPanel/SoundRoot/Content/Slip_STap/TG_AllSound/Tog_AllSoundOn/Text_N',20},{'Text_N30','RightPanel/SoundRoot/Content/Slip_STap/TG_AllSound/Tog_AllSoundOff/Text_N',20},{'Text_TN16','RightPanel/SoundRoot/Content/Slip_SBG/Text_TN',20},{'Text_BG','RightPanel/SoundRoot/Content/Slip_SBG/Slider_SBG/Text_BG',20},{'Text_TN17','RightPanel/SoundRoot/Content/Slip_SEffect/Text_TN',20},{'Text_SEffect','RightPanel/SoundRoot/Content/Slip_SEffect/Slider_SEffect/Text_SEffect',20},{'Text_TN18','RightPanel/SoundRoot/Content/Slip_SRole/Text_TN',20},{'Text_SRole','RightPanel/SoundRoot/Content/Slip_SRole/Slider_SRole/Text_SRole',20},{'Text_TN19','RightPanel/SoundRoot/Content/Slip_MainRole/Text_TN',20},{'Text_N31','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOn/Text_N',20},{'Text_N32','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOnce/Text_N',20},{'Text_N33','RightPanel/SoundRoot/Content/Slip_MainRole/TG_AllSound/Tog_AllSoundOff/Text_N',20},{'Text_Title05','RightPanel/SoundRoot/Content/Roles/Text_Title',20},{'Text_Name01','RightPanel/SoundRoot/Content/Roles/Role1/Img_Head1/Text_Name',20},{'Text_N34','RightPanel/SoundRoot/Content/Roles/Role1/TG_Role1/Tog_Role1On/Text_N',20},{'Text_N35','RightPanel/SoundRoot/Content/Roles/Role1/TG_Role1/Tog_Role1Off/Text_N',20},{'Text_Name02','RightPanel/SoundRoot/Content/Roles/Role2/Img_Head2/Text_Name',20},{'Text_N36','RightPanel/SoundRoot/Content/Roles/Role2/TG_Role2/Tog_Role2On/Text_N',20},{'Text_N37','RightPanel/SoundRoot/Content/Roles/Role2/TG_Role2/Tog_Role2Off/Text_N',20},{'Text_Name03','RightPanel/SoundRoot/Content/Roles/Role3/Img_Head3/Text_Name',20},{'Text_N38','RightPanel/SoundRoot/Content/Roles/Role3/TG_Role3/Tog_Role3On/Text_N',20},{'Text_N39','RightPanel/SoundRoot/Content/Roles/Role3/TG_Role3/Tog_Role3Off/Text_N',20},{'Text_Name04','RightPanel/SoundRoot/Content/Roles/Role4/Img_Head4/Text_Name',20},{'Text_N40','RightPanel/SoundRoot/Content/Roles/Role4/TG_Role4/Tog_Role4On/Text_N',20},{'Text_N41','RightPanel/SoundRoot/Content/Roles/Role4/TG_Role4/Tog_Role4Off/Text_N',20},{'Text_Name05','RightPanel/SoundRoot/Content/Roles/Role5/Img_Head5/Text_Name',20},{'Text_N42','RightPanel/SoundRoot/Content/Roles/Role5/TG_Role5/Tog_Role5On/Text_N',20},{'Text_N43','RightPanel/SoundRoot/Content/Roles/Role5/TG_Role5/Tog_Role5Off/Text_N',20},{'Text_Name06','RightPanel/SoundRoot/Content/Roles/Role6/Img_Head6/Text_Name',20},{'Text_N44','RightPanel/SoundRoot/Content/Roles/Role6/TG_Role6/Tog_Role6On/Text_N',20},{'Text_N45','RightPanel/SoundRoot/Content/Roles/Role6/TG_Role6/Tog_Role6Off/Text_N',20},{'Text_Name07','RightPanel/SoundRoot/Content/Roles/Role7/Img_Head7/Text_Name',20},{'Text_N46','RightPanel/SoundRoot/Content/Roles/Role7/TG_Role7/Tog_Role7On/Text_N',20},{'Text_N47','RightPanel/SoundRoot/Content/Roles/Role7/TG_Role7/Tog_Role7Off/Text_N',20},{'Text_Title06','RightPanel/RemindRoot/Text_Title',20},{'Text_TN20','RightPanel/RemindRoot/Slip_Power/Text_TN',20},{'Text_N48','RightPanel/RemindRoot/Slip_Power/TG_Power/Tog_PowerOn/Text_N',20},{'Text_N49','RightPanel/RemindRoot/Slip_Power/TG_Power/Tog_PowerOff/Text_N',20},{'Text_TN21','RightPanel/RemindRoot/Slip_WBRemind/Text_TN',20},{'Text_N50','RightPanel/RemindRoot/Slip_WBRemind/TG_WBRemind/Tog_WBROn/Text_N',20},{'Text_N51','RightPanel/RemindRoot/Slip_WBRemind/TG_WBRemind/Tog_WBROff/Text_N',20},{'Text_TN22','RightPanel/RemindRoot/Slip_PvpReMind/Text_TN',20},{'Text_N52','RightPanel/RemindRoot/Slip_PvpReMind/TG_PvpReMind/Tog_PROn/Text_N',20},{'Text_N53','RightPanel/RemindRoot/Slip_PvpReMind/TG_PvpReMind/Tog_PROff/Text_N',20},{'Text_Duihuan','RightPanel/CodeRoot/Btn_Code/Text_Duihuan',20},{'Placeholder','RightPanel/CodeRoot/Input_Code/Placeholder',20},{'Text','RightPanel/CodeRoot/Input_Code/Text',20},{'Text_Title07','RightPanel/DramaRoot/Text_Title',20},{'Text_DramaName','RightPanel/DramaRoot/Btn_Drama/Text_DramaName',20},{'Text_DramaContent','RightPanel/DramaRoot/Btn_Drama/Text_DramaContent',20},{'Text_TN23','RightPanel/DramaRoot/Slip_PA/Text_TN',20},{'Text_PA','RightPanel/DramaRoot/Slip_PA/Slider_PA/Text_PA',20},{'Text_TN24','RightPanel/DramaRoot/Slip_PS/Text_TN',20},{'Text_PS','RightPanel/DramaRoot/Slip_PS/Slider_PS/Text_PS',20},{'Text_TN25','RightPanel/DramaRoot/Slip_PAS/Text_TN',20},{'Text_PAS','RightPanel/DramaRoot/Slip_PAS/Slider_PAS/Text_PAS',20},{'Text_Name08','RightPanel/LianxieDaimaPop/Panel/Text_Name',20},{'Text_ZhanghuDaima','RightPanel/LianxieDaimaPop/Panel/Text_ZhanghuDaima',20},{'Text01','RightPanel/LianxieDaimaPop/Panel/Input_ZhanghuDaima/Text',20},{'Text02','RightPanel/LianxieDaimaPop/Panel/Btn_Copy1/Text',20},{'Text_MimaDaima','RightPanel/LianxieDaimaPop/Panel/Text_MimaDaima',20},{'Placeholder01','RightPanel/LianxieDaimaPop/Panel/Input_MimaDaima/Placeholder',20},{'Text03','RightPanel/LianxieDaimaPop/Panel/Input_MimaDaima/Text',20},{'Text04','RightPanel/LianxieDaimaPop/Panel/Btn_Shengcheng/Text',20},{'Text05','RightPanel/LianxieDaimaPop/Panel/Btn_Copy2/Text',20},{'Text_Jieshao1','RightPanel/LianxieDaimaPop/Panel/Text_Jieshao1',20},{'Text_Jieshao2','RightPanel/LianxieDaimaPop/Panel/Text_Jieshao2',20},{'Text06','RightPanel/HuanbangPop/Panel/Btn_Xiaochu/Text',20},{'Text_Xiaochu','RightPanel/HuanbangPop/Panel/Text_Xiaochu',20},{'Text_Shuoming','RightPanel/HuanbangPop/Panel/Text_Shuoming',20},{'Img_google','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Img_google',20},{'Text_Bangdingzhong','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Bangdingzhong/Bangdingzhong_light/Text_Bangdingzhong',20},{'Text_Weibangding','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Bangdingzhong/Bangdingzhong_grey/Text_Weibangding',20},{'Text07','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Input_Zhanghao/Text',20},{'Text08','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Btn_Bangding/Text',20},{'Img_apple','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Img_apple',20},{'Text_Bangdingzhong01','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Bangdingzhong/Bangdingzhong_light/Text_Bangdingzhong',20},{'Text_Weibangding01','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Bangdingzhong/Bangdingzhong_grey/Text_Weibangding',20},{'Text09','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Input_Zhanghao/Text',20},{'Text10','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Btn_Bangding/Text',20},{'Text_Name09','RightPanel/HuanbangPop/Panel/Text_Name',20},{'Text_Name10','RightPanel/ShezhimimaPop/Panel/Text_Name',20},{'Text_Shezhimima','RightPanel/ShezhimimaPop/Panel/Text_Shezhimima',20},{'Text11','RightPanel/ShezhimimaPop/Panel/Input_Shezhimima/Text',20},{'Text_Querenmima','RightPanel/ShezhimimaPop/Panel/Text_Querenmima',20},{'Placeholder02','RightPanel/ShezhimimaPop/Panel/Input_Querenmima/Placeholder',20},{'Text12','RightPanel/ShezhimimaPop/Panel/Input_Querenmima/Text',20},{'Text13','RightPanel/ShezhimimaPop/Panel/Btn_Quxiao/Text',20},{'Text14','RightPanel/ShezhimimaPop/Panel/Btn_Denglu/Text',20},
        -- TMP_InputField 列表
        {'Input_Code01','RightPanel/CodeRoot/Input_Code',21},{'Input_ZhanghuDaima01','RightPanel/LianxieDaimaPop/Panel/Input_ZhanghuDaima',21},{'Input_MimaDaima01','RightPanel/LianxieDaimaPop/Panel/Input_MimaDaima',21},{'Input_Zhanghao02','RightPanel/HuanbangPop/Panel/Content/Zhanghao1/Input_Zhanghao',21},{'Input_Zhanghao03','RightPanel/HuanbangPop/Panel/Content/Zhanghao2/Input_Zhanghao',21},{'Input_Shezhimima01','RightPanel/ShezhimimaPop/Panel/Input_Shezhimima',21},{'Input_Querenmima01','RightPanel/ShezhimimaPop/Panel/Input_Querenmima',21},
    }
end
-- Code Auto Create End
require("LocalData/LanguageerrorLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_GoBack().gameObject,function()
        --关闭界面停止声音
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrSound.Stop(5,"SettingRole",true)
        for i = 1, 7 do
            self["Btn_Stop"..i]().gameObject:SetActive(false)
            self["Btn_Play"..i]().gameObject:SetActive(true)
        end
        self.LastIsOn = false

        MgrUI.ClosePop(self.Uid)
    end)
    UIEvent.LuaClick(self.Btn_ReSetting().gameObject,function() --LSTODO
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("settingpop_ui_tips1"),function()
            SettingViewModel.ReSetting()
            self:InitGame()
            self:InitSound()
            self:InitRemind()
            self:InitUser()
            self:InitCode()
            self:InitPlot()
            self:InitDrama()

            --恢复默认停止声音
             MgrSound.Stop(5,"SettingRole",true)
        end,nil,2},true)
    end)
    --策划需求 展示关闭帮助按钮
    --UIEvent.LuaClick(self.Btn_Help().gameObject,function()
    --    HelpViewModel.Go(4002)
    --end)
    self.Labels = {
        self.Tog_Game01(),
        self.Tog_Audio01(),
        self.Tog_Remind01(),
        self.Tog_Code01(),
        self.Tog_Plot01(),
        self.Tog_Drama01(),
        self.Tog_Agreement01(),
    }
    self.roots = {
        self.Game().transform,
        self.SoundRoot().transform,
        self.RemindRoot().transform,
        self.CodeRoot().transform,
        self.PlotRoot().transform,
        self.DramaRoot().transform,
        self.AgreementRoot().transform,
    }
    for i, tog in ipairs(self.Labels) do
        tog.isOn = false
        local labelNormal = tog.transform:Find("Normal").gameObject
        local labelHighlight = tog.transform:Find("Highlight").gameObject
        labelHighlight:SetActive(false)
        Tools.ToggleValueChange(tog,function(isOn)
            labelHighlight:SetActive(isOn)
            labelNormal:SetActive(not isOn)
            self.roots[i].gameObject:SetActive(isOn)
        end,nil)
        tog.gameObject:SetActive(false)
        self.roots[i].gameObject:SetActive(false)
    end

    ---字数限制
    self.Input_Shezhimima01().characterLimit = tonumber(SteamLocalData.tab[104022][2])
    self.Input_Querenmima01().characterLimit = tonumber(SteamLocalData.tab[104022][2])

    self:InitGame()
    self:InitSound()
    self:InitRemind()
    self:InitUser()
    self:InitCode()
    self:InitPlot()
    self:InitDrama()
    self:InitAgreement()
end


function M:OnBackKey()
    local tab = {"BattlePause_UI","PVPPause_UI","SettingPop_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrSound.Stop(5,"SettingRole",true)
        for i = 1, 7 do
            self["Btn_Stop"..i]().gameObject:SetActive(false)
            self["Btn_Play"..i]().gameObject:SetActive(true)
        end
        self.LastIsOn = false

        MgrUI.ClosePop(self.Uid)
    end
end
---参数：显示的标签 {1游戏，2声音，3提醒，4账号，5兑换，6剧情角色，7剧情文本}
function M:OnShow(args)
    MgrSound.Stop(3,tostring(PlayerControl.GetPlayerData().curRoleID),false)
    local idx = nil
    for i, v in pairs(args[1]) do
        if idx == nil then
            idx = v
        end
        self.Labels[v].gameObject:SetActive(true)
    end
    if idx then
        self.Labels[idx].isOn = true
    end
    self.callback = args[2]
    ---清空兑换码
    self.Input_Code01().text = ""
    
    self.Btn().gameObject:SetActive(MgrSdk.GetPlatform() == "1")
end

function M:InitGame()
    ---画面效果
    local q = SettingViewModel.GetQuality()
    self.Tog_QualityD01().isOn = q == 1
    --self.Tog_QualityN01().isOn = q == 2
    self.Tog_QualityH01().isOn = q == 3

    self.LianxieDaimaPop().gameObject:SetActive(false)
    self.HuanbangPop().gameObject:SetActive(false)
    self.ShezhimimaPop().gameObject:SetActive(false)

    Tools.ToggleValueChange(self.Tog_QualityD01(),function(isOn)
        if isOn then
            SettingViewModel.SetQuality(1)
        end
    end,nil)
    --Tools.ToggleValueChange(self.Tog_QualityN01(),function(isOn)
    --    if isOn then
    --        SettingViewModel.SetQuality(2)
    --    end
    --end,nil)
    Tools.ToggleValueChange(self.Tog_QualityH01(),function(isOn)
        if isOn then
            SettingViewModel.SetQuality(3)
        end
    end,nil)
    ---游戏速度
    local s = SettingViewModel.GetBattleSpeed()
    self.Tog_Speed101().isOn = s == 1
    self.Tog_Speed201().isOn = s == 2
    self.Tog_Speed301().isOn = s == 3
    Tools.ToggleValueChange(self.Tog_Speed101(),function(isOn)
        if isOn then
            SettingViewModel.SetBattleSpeed(1)
            local ui = MgrUI.GetCurUI()
            if ui.Uid == UID.Battle02_UI or ui.Uid == UID.WorldBossBattle_UI then
                ui.Img_Speedx1().gameObject:SetActive(true)
                ui.Img_Speedx2().gameObject:SetActive(false)
                ui.Img_Speedx3().gameObject:SetActive(false)
            end
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_Speed201(),function(isOn)
        if isOn then
            SettingViewModel.SetBattleSpeed(2)
            local ui = MgrUI.GetCurUI()
            if ui.Uid == UID.Battle02_UI or ui.Uid == UID.WorldBossBattle_UI then
                ui.Img_Speedx1().gameObject:SetActive(false)
                ui.Img_Speedx2().gameObject:SetActive(true)
                ui.Img_Speedx3().gameObject:SetActive(false)
            end
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_Speed301(),function(isOn)
        if isOn then
            SettingViewModel.SetBattleSpeed(3)
            local ui = MgrUI.GetCurUI()
            if ui.Uid == UID.Battle02_UI or ui.Uid == UID.WorldBossBattle_UI then
                ui.Img_Speedx1().gameObject:SetActive(false)
                ui.Img_Speedx2().gameObject:SetActive(false)
                ui.Img_Speedx3().gameObject:SetActive(true)
            end
        end
    end,nil)
    ---EX动画是否开启
    local e = SettingViewModel.GetExAnim()
    self.Tog_EXOn01().isOn = e == 1
    self.Tog_EXOff01().isOn = e == 3
    self.Tog_EXOnce01().isOn = e == 2
    Tools.ToggleValueChange(self.Tog_EXOn01(),function(isOn)
        if isOn then
            SettingViewModel.SetExAnim(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_EXOff01(),function(isOn)
        if isOn then
            SettingViewModel.SetExAnim(3)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_EXOnce01(),function(isOn)
        if isOn then
            SettingViewModel.SetExAnim(2)
        end
    end,nil)
    ---战斗镜头开关
    local f = SettingViewModel.GetCameraMove()
    self.Tog_FootageOn01().isOn = f == 1
    self.Tog_FootageOff01().isOn = f == 2
    Tools.ToggleValueChange(self.Tog_FootageOn01(),function(isOn)
        if isOn then
            SettingViewModel.SetCameraMove(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_FootageOff01(),function(isOn)
        if isOn then
            SettingViewModel.SetCameraMove(2)
        end
    end,nil)
    --首页开场动画
    local Ani_TgList = {
        self.TG_AniOn01(),
        self.TG_AniDaily01(),
        self.TG_AniOff01()
    }
    for i, v in ipairs(Ani_TgList) do
        if SkinControl.GetOpenState() == i then
            v.isOn = true
        end
        Tools.ToggleValueChange(v,function(isOn,args)
            if isOn then
                SkinControl.SetOpenState(i)
            end
        end)
    end
    ---看板娘随机
    local pg = SettingViewModel.GetPostGirlSetting()
    self.TG_PGDefault01().isOn = pg == 1
    self.TG_PGRandom01().isOn = pg == 2
    Tools.ToggleValueChange(self.TG_PGDefault01(),function(isOn)
        if isOn then
            SettingViewModel.SetPostGirlSetting(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.TG_PGRandom01(),function(isOn)
        if isOn then
            SettingViewModel.SetPostGirlSetting(2)
        end
    end,nil)
    ---异形屏UI适配
    self.Slip_Fringe().gameObject:SetActive(false)
    --self.Slider_Fringe().value = SettingViewModel.GetFringe() / 100
    --self.Text_Fringe().text = string.format("%.0f",SettingViewModel.GetFringe())
    --Tools.OnSliderValueChange(self.Slider_Fringe(),function(float)
    --    local value = math.floor(float * 100)
        --SettingViewModel.SetFringe(value)
    --    self.Text_Fringe().text = string.format("%.0f",value)
    --end)

    --TODO
    UIEvent.LuaClick(self.Btn_Switch().gameObject,function()
        self:OnSwitch()
    end)
    UIEvent.LuaClick(self.Btn_Agree_Switch().gameObject,function()
        self:OnSwitch()
    end)
    --TODOEND
    ---去掉引继码
    --self.Btn_Kefu().gameObject:SetActive(MgrSdk.GetPlatform() == "2")
    self.Btn_Kefu().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Kefu().gameObject,function()
        if MgrSdk.IsFlyFun() then
            -- MgrSdk.FlyFunIsGm(function(request)
            --     if request == "0" then
            --         MgrSdk.FlyFunOpenGm()
            --     else
            --         ---飞游登出失败, 打印code及异常信息并关闭登录窗
            --         UnityEngine.DebugEx.LogError(request)
            --     end
            -- end)
            self.LianxieDaimaPop().gameObject:SetActive(true)
            local localInfo = LoginViewModel.GetLocalAccount()
            self.Text01().text = localInfo.account
            self.Text03().text = localInfo.pwd
        end
    end)

    UIEvent.LuaClick(self.BlurMask01().gameObject,function()
        self.LianxieDaimaPop().gameObject:SetActive(false)
    end)

    UIEvent.LuaClick(self.Btn_Copy1().gameObject,function()
        UnityEngine.GUIUtility.systemCopyBuffer = self.Text01().text;
        -- MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),1},true)
    end)

    UIEvent.LuaClick(self.Btn_Copy2().gameObject,function()
        UnityEngine.GUIUtility.systemCopyBuffer = self.Text03().text;
        -- MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),1},true)
    end)

    UIEvent.LuaClick(self.Btn_Shengcheng().gameObject,function()
        local newPwd = Tools.GetRandomPwd()
        local localInfo = LoginViewModel.GetLocalAccount()
        MgrNet.HttpChangeBind(localInfo.userID, MgrSdk.platform.Password, localInfo.account, localInfo.pwd, newPwd, function (result)
            if result.code == 1 then
                print("zqx change bind success")
                MgrNet.HttpResetPassword(localInfo.account, localInfo.pwd, newPwd, function (info)
                    if info.errNo == 0 then
                        LoginViewModel.UpdateLocalPwd(newPwd)
                        self.Text03().text = newPwd
                    else
                        UnityEngine.DebugEx.LogError("zqx reset pwd error:"..serpent.block(info))
                    end
                end)
            else
                UnityEngine.DebugEx.LogError("zqx change bind error:"..serpent.block(result))
            end
        end)
    end)

    local isBind = false
    if MgrSdk.IsFlyFun() then
        if MgrSdk.IsFlyFunQoo() then
            isBind = true
        else
            MgrSdk.FlyFunHasBind(function(request)
                if request == "0" then
                    isBind = true
                else
                    UnityEngine.DebugEx.LogError(request)
                end
            end)
        end
    end

    ---loading图片
    local picPrefabRoot = self.Content().gameObject
    local picPrefab = self.PicturePrefab().gameObject
    picPrefab:SetActive(false)
    Tools.ClearAllChild(picPrefabRoot)
    local unlockImages = SettingViewModel.ReturnLoadingImages()
    local choosenImages = SettingViewModel.ReturnChoosenLoadingImages()
    self.imageToggles = {}
    for i,v in pairs(unlockImages) do
        local item = GameObject.Instantiate(picPrefab,picPrefabRoot.transform,false)
        item:SetActive(true)
        local bg = item.transform:Find("Img_Bg/Img_Icon"):GetComponent("Image")
        local Text_Name = item.transform:Find("Img_Bg/Text_Name"):GetComponent("TextMeshProUGUI")
        local toggle = item.transform:Find("Gou"):GetComponent("Toggle")
        self.imageToggles[v.itemunlock] = toggle
        MgrRes.LoadSprite(bg,v.imgcover)
        Text_Name.text = v.imgtext
        toggle.gameObject:SetActive(true)
        Tools.ToggleValueChange(toggle,function(isOn,toggle)
            if isOn then
                UnityEngine.PlayerPrefs.SetInt("loadingImage"..v.itemunlock..PlayerControl.GetPlayerData().UID,1)
                SettingViewModel.SetChoosenLoadingImages(v)
                self.Text_Shu().text = "<color=#33fff8>"..SettingViewModel.ChooseNumber().."</color>/"..SettingViewModel.ChooseUnlockNumber()
            else
                UnityEngine.PlayerPrefs.SetInt("loadingImage"..v.itemunlock..PlayerControl.GetPlayerData().UID,0)
                SettingViewModel.RemoveChoosenLoadingImages(v)
                if SettingViewModel.ChooseNumber() == 0 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_loadingimgchange_text"),1},true)
                    toggle.isOn = true
                end
                self.Text_Shu().text = "<color=#33fff8>"..SettingViewModel.ChooseNumber().."</color>/"..SettingViewModel.ChooseUnlockNumber()
            end
        end,toggle)
        if choosenImages[v.itemunlock] ~= nil then
            toggle.isOn = true
        else
            toggle.isOn = false
        end
    end
    self.allSeleted = false
    self.Tog_SelectALL().transform:Find("Text_N"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("settingpop_ui_tips4")
    UIEvent.LuaClick(self.Tog_SelectALL().gameObject,function()
        if self.allSeleted then
            self.Tog_SelectALL().transform:Find("Text_N"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("settingpop_ui_tips4")
            --取消全选
            for i,v in pairs(self.imageToggles) do
                if i == 0 then
                    v.isOn = true
                else
                    v.isOn = false
                end
            end
            self.allSeleted = false
        else
            self.Tog_SelectALL().transform:Find("Text_N"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("settingpop_ui_tips5")
            --全选
            for i,v in pairs(self.imageToggles) do
                v.isOn = true
            end
            self.allSeleted = true
        end
    end)

    self.Text_Shu().text = "<color=#33fff8>"..SettingViewModel.ChooseNumber().."</color>/"..SettingViewModel.ChooseUnlockNumber()

    --Tools.ToggleValueChange(self.GearBagTypeToggle02(),Handle(self,self.OnToggleClick),nil)
    --TODO
    --self.Btn_Bangding().gameObject:SetActive(false)
    -- UIEvent.LuaClick(self.Btn_Bangding().gameObject,function()
    --     if MgrSdk.IsFlyFun() then
    --         MgrSdk.FlyFunOpenBind(function(request)
    --             if request == "0" then
    --                 self.Btn_Bangding().gameObject:SetActive(false)
    --             else
    --                 ---飞游登出失败, 打印code及异常信息并关闭登录窗
    --                 UnityEngine.DebugEx.LogError(request)
    --             end
    --         end)
    --     end
    -- end)
    --TODOEND
    --设置主界面是否保持当前状态
    self.Tog_SpineOn01().isOn = SettingViewModel.GetHoldSpine()
    self.Tog_SpineOff01().isOn = not SettingViewModel.GetHoldSpine()
    Tools.ToggleValueChange(self.Tog_SpineOn01(),function(isOn)
        SettingViewModel.SetHoldSpine(true)
    end)
    Tools.ToggleValueChange(self.Tog_SpineOff01(),function(isOn)
        SettingViewModel.SetHoldSpine(false)
    end)
end
function M:InitSound()
    local a = SettingViewModel.GetAllSound()
    --TODO
    self.Tog_AllSoundOn03().isOn = a == 1
    self.Tog_AllSoundOff03().isOn = a == 2

    Tools.ToggleValueChange(self.Tog_AllSoundOn03(),function(isOn)
        if isOn then
            SettingViewModel.SetAllSound(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_AllSoundOff03(),function(isOn)
        if isOn then
            SettingViewModel.SetAllSound(2)
        end
    end,nil)
    --TODOEND
    local bgs = SettingViewModel.GetBGMSound()
    self.Slider_SBG().value = bgs / 100
    self.Text_BG().text = string.format("%.0f",bgs)
    self.Img_SBGOn().gameObject:SetActive(bgs ~= 0)
    self.Img_SBGOff().gameObject:SetActive(bgs == 0)
    Tools.OnSliderValueChange(self.Slider_SBG(),function(float)
        local value = math.floor(float * 100)
        SettingViewModel.SetBGMSound(value)
        self.Text_BG().text = string.format("%.0f",value)
        self.Img_SBGOn().gameObject:SetActive(float ~= 0)
        self.Img_SBGOff().gameObject:SetActive(float == 0)
    end)
    UIEvent.LuaClick(self.Img_SBGOn().gameObject,function()
        self.Slider_SBG().value = 0
        SettingViewModel.SetBGMSound(0)
    end)
    UIEvent.LuaClick(self.Img_SBGOff().gameObject,function()
        self.Slider_SBG().value = 1
        SettingViewModel.SetBGMSound(100)
    end)

    local efs = SettingViewModel.GetEffectSound()
    self.Slider_SEffect().value = efs / 100
    self.Text_SEffect().text = string.format("%.0f",efs)
    self.Img_SEffectOn().gameObject:SetActive(efs ~= 0)
    self.Img_SEffectOff().gameObject:SetActive(efs == 0)
    Tools.OnSliderValueChange(self.Slider_SEffect(),function(float)
        local value = math.floor(float * 100)
        SettingViewModel.SetEffectSound(value)
        self.Text_SEffect().text = string.format("%.0f",value)
        self.Img_SEffectOn().gameObject:SetActive(float ~= 0)
        self.Img_SEffectOff().gameObject:SetActive(float == 0)
    end)
    UIEvent.LuaClick(self.Img_SEffectOn().gameObject,function()
        self.Slider_SEffect().value = 0
        SettingViewModel.SetEffectSound(0)
    end)
    UIEvent.LuaClick(self.Img_SEffectOff().gameObject,function()
        self.Slider_SEffect().value = 1
        SettingViewModel.SetEffectSound(100)
    end)

    local rs = SettingViewModel.GetRoleSound()
    self.Slider_SRole().value = rs / 100
    self.Text_SRole().text = string.format("%.0f",rs)
    self.Img_SRoleOn().gameObject:SetActive(rs ~= 0)
    self.Img_SRoleOff().gameObject:SetActive(rs == 0)
    Tools.OnSliderValueChange(self.Slider_SRole(),function(float)
        local value = math.floor(float * 100)
        SettingViewModel.SetRoleSound(value)
        self.Text_SRole().text = string.format("%.0f",value)
        self.Img_SRoleOn().gameObject:SetActive(float ~= 0)
        self.Img_SRoleOff().gameObject:SetActive(float == 0)
    end)
    UIEvent.LuaClick(self.Img_SRoleOn().gameObject,function()
        self.Slider_SRole().value = 0
        SettingViewModel.SetRoleSound(0)
    end)
    UIEvent.LuaClick(self.Img_SRoleOff().gameObject,function()
        self.Slider_SRole().value = 1
        SettingViewModel.SetRoleSound(100)
    end)
    --返回主界面语音
    local mainRole = SettingViewModel.GetMainRoleSound()
    self.Tog_AllSoundOn05().isOn = mainRole == 1
    self.Tog_AllSoundOff05().isOn = mainRole == 2
    self.Tog_AllSoundOnce01().isOn = mainRole == 3
    Tools.ToggleValueChange(self.Tog_AllSoundOn05(),function(isOn)
        if isOn then
            SettingViewModel.SetMainRoleSound(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_AllSoundOff05(),function(isOn)
        if isOn then
            SettingViewModel.SetMainRoleSound(2)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_AllSoundOnce01(),function(isOn)
        if isOn then
            SettingViewModel.SetMainRoleSound(3)
        end
    end,nil)
end
function M:InitRemind()
    ---内测不开放
end
function M:InitUser()
    ---内测不开放
end
function M:InitAgreement()
    UIEvent.LuaClick(self.Btn_US01().gameObject,function()
        MgrUI.Pop(UID.LawsPop_UI,{1},true)
    end)
    UIEvent.LuaClick(self.Btn_RU01().gameObject,function()
        MgrUI.Pop(UID.LawsPop_UI,{2},true)
    end)
    UIEvent.LuaClick(self.Btn_US02().gameObject,function()
        MgrUI.Pop(UID.LawsPop_UI,{3},true)
    end)
    UIEvent.LuaClick(self.Btn_RU02().gameObject,function()
        MgrUI.Pop(UID.LawsPop_UI,{4},true)
    end)
    UIEvent.LuaClick(self.Btn_US().gameObject,function()
        self.HuanbangPop().gameObject:SetActive(true)
        self:RefreshBindState()
    end)
    UIEvent.LuaClick(self.Btn_RU().gameObject,function()
        --TODO migrationcode
        if MgrSdk.IsSetMigrationPassword() then
            self.LianxieDaimaPop().gameObject:SetActive(true);
            self.Text01().text = MgrSdk.GetSdkUserMigrationId()
            self.Text03().text = "*********"
        else
            self.Input_Shezhimima01().text = ""
            self.Input_Querenmima01().text = ""
            self.ShezhimimaPop().gameObject:SetActive(true)
        end
    end)
    UIEvent.LuaClick(self.BlurMask02().gameObject,function()
        self.HuanbangPop().gameObject:SetActive(false)
    end)
    ---去掉解绑功能（有多种第三方登录方式下可以解绑）
    --self.Btn_Xiaochu().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Xiaochu().gameObject,function()
        MgrUI.Pop(UID.ConfirmPop_UI, {MgrLanguageData.GetLanguageByKey("ui_qita_text130"), function ()
            MgrSdk.FlyFunDelAcc(function(request)
                if request == "0" then
                    MgrSdk.isSwitchAccount = true
                    MgrSdk.BackToLogin()
                end
            end)
        end, nil, 2}, true)
    end)
    UIEvent.LuaClick(self.Btn_Bangding().gameObject,function()
        MgrSdk.GoogleBind(function (request)
            if request == "0" then
                self:RefreshBindState()
            else
                local info = string.split(request, "|")
                MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey(LanguageerrorLocalData.tab[tonumber(info[1])][2]), 1}, true)
            end
        end)
    end)
    UIEvent.LuaClick(self.Btn_Bangding01().gameObject,function()
        MgrSdk.AppleBind(function (request)
            if request == "0" then
                self:RefreshBindState()
            else
                local info = string.split(request, "|")
                MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey(LanguageerrorLocalData.tab[tonumber(info[1])][2]), 1}, true)
            end
        end)
    end)

    UIEvent.LuaClick(self.BlurMask01().gameObject,function()
        self.LianxieDaimaPop().gameObject:SetActive(false)
    end)

    UIEvent.LuaClick(self.Btn_Copy1().gameObject,function()
        UnityEngine.GUIUtility.systemCopyBuffer = self.Text01().text;
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_copy"),1},true)
    end)

    UIEvent.LuaClick(self.Btn_Copy2().gameObject,function()
        UnityEngine.GUIUtility.systemCopyBuffer = self.Text03().text;
        -- MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),1},true)
    end)

    UIEvent.LuaClick(self.Btn_Shengcheng().gameObject,function()
        self.Input_Shezhimima01().text = ""
        self.Input_Querenmima01().text = ""
        self.ShezhimimaPop().gameObject:SetActive(true)
    end)

    UIEvent.LuaClick(self.Btn_Quxiao().gameObject, function ()
        self.ShezhimimaPop().gameObject:SetActive(false)
    end)

    UIEvent.LuaClick(self.Btn_Denglu().gameObject, function ()
        local pwd1 = self.Input_Shezhimima01().text
        local pwd2 = self.Input_Querenmima01().text
        if pwd1 == "" or pwd2 == "" then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips3"),1},true)
            return
        end
        if pwd1 ~= pwd2 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips9"),1},true)
            return
        end
        if string.len(pwd1) < tonumber(SteamLocalData.tab[104021][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips12"),1},true)
            return
        end
        if string.len(pwd1) > tonumber(SteamLocalData.tab[104022][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips13"),1},true)
            return
        end
        MgrSdk.SetMigrationPassword(pwd1, pwd2, function (request)
            if request == "0" then
                MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey("ui_age_text16"), 1}, true)
                self.ShezhimimaPop().gameObject:SetActive(false)
                self.LianxieDaimaPop().gameObject:SetActive(false)
            else
                --MgrUI.Pop(UID.PopTip_UI,{"SetMigPwd failed "..request,1},true)
                ---添加错误码弹窗
                MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey(LanguageerrorLocalData.tab[request][2]), 1}, true)
            end
        end)
    end)

    UIEvent.LuaClick(self.Btn_DC().gameObject,function()
        Tools.OpenUrl("https://discord.gg/aQ3xpdYP5T")
    end)

    UIEvent.LuaClick(self.Btn_FB().gameObject,function()
        Tools.OpenUrl("https://twitter.com/hazereverbjp")
    end)
end
function M:InitCode()
    UIEvent.LuaClick(self.Btn_Code().gameObject,function()
        local Str = self.Input_Code01().text
        SettingViewModel.CDKeyREQ(Str,function()
            self.Input_Code01().text = ""
        end)
    end)
end

function M:InitPlot()
    local q1 = SettingViewModel.GetPlotLH()
    self.Tog_Role1On01().isOn = q1 == 1
    self.Tog_Role1Off01().isOn = q1 == 2
    Tools.ToggleValueChange(self.Tog_Role1On01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotLH(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_Role1Off01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotLH(2)
        end
    end,nil)
    local q2 = SettingViewModel.GetPlotJY()
    self.Tog_Role2On01().isOn = q2 == 1
    self.Tog_Role2Off01().isOn = q2 == 2
    Tools.ToggleValueChange(self.Tog_Role2On01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotJY(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_Role2Off01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotJY(2)
        end
    end,nil)

    local q3 = SettingViewModel.GetPlotSDFN()
    self.Tog_Role3On01().isOn = q3 == 1
    self.Tog_Role3Off01().isOn = q3 == 2
    Tools.ToggleValueChange(self.Tog_Role3On01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotSDFN(1)
        end
    end,nil)

    Tools.ToggleValueChange(self.Tog_Role3Off01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotSDFN(2)
        end
    end,nil)

    local q4 = SettingViewModel.GetPlotCLS()
    self.Tog_Role4On01().isOn = q4 == 1
    self.Tog_Role4Off01().isOn = q4 == 2
    Tools.ToggleValueChange(self.Tog_Role4On01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotCLS(1)
        end
    end,nil)

    Tools.ToggleValueChange(self.Tog_Role4Off01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotCLS(2)
        end
    end,nil)

    local q6 = SettingViewModel.GetPlotZLWS()
    self.Tog_Role5On01().isOn = q6 == 1
    self.Tog_Role5Off01().isOn = q6 == 2
    Tools.ToggleValueChange(self.Tog_Role6On01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotZLWS(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_Role6Off01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotZLWS(2)
        end
    end,nil)

    local q5 = SettingViewModel.GetPlotFLK()
    self.Tog_Role6On01().isOn = q5 == 1
    self.Tog_Role6Off01().isOn = q5 == 2
    Tools.ToggleValueChange(self.Tog_Role5On01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotFLK(1)
        end
    end,nil)

    Tools.ToggleValueChange(self.Tog_Role5Off01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotFLK(2)
        end
    end,nil)

    local q7 = SettingViewModel.GetPlotOther()
    self.Tog_Role7On01().isOn = q7 == 1
    self.Tog_Role7Off01().isOn = q7 == 2
    Tools.ToggleValueChange(self.Tog_Role7On01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotOther(1)
        end
    end,nil)
    Tools.ToggleValueChange(self.Tog_Role7Off01(),function(isOn)
        if isOn then
            SettingViewModel.SetPlotOther(2)
        end
    end,nil)
    self.roleAudio = {}
    for i = 1, 7 do
        self.roleAudio[i] = {}
    end
    for i, v in pairs(SamplevoiceLocalData.tab) do
        for j = 1, v[4] * 10 do
            self.roleAudio[v[3]][#self.roleAudio[v[3]] + 1] = v[5]
        end
    end
    for i = 1, 7 do
        self["Btn_Stop"..i]().gameObject:SetActive(false)
        self["Btn_Play"..i]().gameObject:SetActive(true)
        Tools.ToggleValueChange(self["Img_Head"..i.."01"](),function(isOn)
            self["Btn_Stop"..i]().gameObject:SetActive(isOn)
            self["Btn_Play"..i]().gameObject:SetActive(not isOn)
            if isOn then
                if self.LastIsOn == nil then
                    MgrSound.Stop(5,"SettingRole",true)
                    self["Btn_Stop"..i]().gameObject:SetActive(false)
                    self["Btn_Play"..i]().gameObject:SetActive(true)
                    self.LastIsOn = false
                elseif self.LastIsOn == true then
                    MgrSound.Stop(5,"SettingRole",true)
                    self["Btn_Stop"..i]().gameObject:SetActive(false)
                    self["Btn_Play"..i]().gameObject:SetActive(true)
                    self.LastIsOn = false
                else
                    MgrSound.PlayPlot(string.gsub(Tools.GetFileName(self.roleAudio[i][math.random(1,#self.roleAudio[i])])," ","_"),1,0,false,0,0,"SettingRole")
                    self.LastIsOn = true
                    self:ListenVoice(i)
                end
            end
        end,nil)
    end
end

--- 监听语音是否结束
function M:ListenVoice(i)
    MgrTimer.Cancel("SettingRoleVoice")
    MgrTimer.AddRepeat("SettingRoleVoice",0.2,function()
        if  MgrSound.CheckStatus(5,"SettingRole") == 3 then
            self["Img_Head"..i.."01"]().isOn = false
            MgrTimer.Cancel("SettingRoleVoice")
        end
    end,-1,nil)
end

function M:InitDrama()
    self.Slider_PA().value = SettingViewModel.GetDramaAlpha() / 100
    self.Text_PA().text = string.format("%.0f",SettingViewModel.GetDramaAlpha())
    Tools.DoPFade(self.Img_Frame(),SettingViewModel.GetDramaAlpha()/100,0.2,0,1,false,0,0,nil)
    Tools.OnSliderValueChange(self.Slider_PA(),function(float)
        local f = float
        f = f < 0.01 and 0.01 or f
        f = f > 1 and 1 or f
        local value = math.floor(f * 100)
        SettingViewModel.SetDramaAlpha(value)
        Tools.DoPFade(self.Img_Frame(),f,0.2,0,1,false,0,0,nil)
        self.Text_PA().text = string.format("%.0f",value)
    end)

    self.Slider_PS().value = SettingViewModel.GetDramaSpeed() / 100
    self.Text_PS().text = string.format("%.0f",SettingViewModel.GetDramaSpeed())
    Tools.OnSliderValueChange(self.Slider_PS(),function(float)
        local f = float
        f = f < 0.01 and 0.01 or f
        f = f > 1 and 1 or f
        local value = math.floor(f * 100)
        SettingViewModel.SetDramaSpeed(value)
        self.Text_PS().text = string.format("%.0f",value)
        self.Text_DramaContent().text = ""
        local settingSpeed = f * 30
        settingSpeed = settingSpeed < 1 and 1 or settingSpeed
        Tools.DoPText(self.Text_DramaContent(),MgrLanguageData.GetLanguageByKey("settingpop_ui_tips2"),settingSpeed,1,0)
    end)

    self.Slider_PAS().value = SettingViewModel.GetDramaASpeed() / 100
    self.Text_PAS().text = string.format("%.0f",SettingViewModel.GetDramaASpeed())
    Tools.OnSliderValueChange(self.Slider_PAS(),function(float)
        local f = float
        f = f < 0.01 and 0.01 or f
        f = f > 1 and 1 or f
        local value = math.floor(f * 100)
        SettingViewModel.SetDramaASpeed(value)
        self.Text_PAS().text = string.format("%.0f",value)
    end)
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    -- MgrSound.Stop(5,"SettingRole",true)
    if self.callback then
        self.callback()
    end
end
function M:RefreshBindState()
    local tType = MgrSdk.GetSdkUserAccountType()
    
    --MgrUI.Pop(UID.PopTip_UI, {"SdkUserAccountType:"..tType, 1}, true)
    UnityEngine.DebugEx.LogError("SdkUserAccountType:"..tType)
    self.Btn_Bangding().gameObject:SetActive(tType == 0)
    self.Btn_Bangding01().gameObject:SetActive(tType ~= 1)
    self.Bangdingzhong_light().gameObject:SetActive(tType == 2)
    self.Bangdingzhong_light01().gameObject:SetActive(tType == 1)
    self.Bangdingzhong_grey().gameObject:SetActive(tType ~= 2)
    self.Bangdingzhong_grey01().gameObject:SetActive(tType ~= 1)
end

function M:OnSwitch()
    PostMailViewModel.ClearMailBirthdayRedDotCaChe() --清除生日邮件红点缓存
    if MgrSdk.IsFlyFun() then
        MgrSdk.FlyFunLogout(function(code,request)
            if code == 0 then
                MgrSdk.isSwitchAccount = true
                -- MgrNet.CS:CloseSocket()
                MgrSdk.BackToLogin()
            else
                ---飞游登出失败, 打印code及异常信息并关闭登录窗
                UnityEngine.DebugEx.LogError("FlyFunLogout failed:"..code..":"..request)
            end
        end)
    else
        MgrSdk.isSwitchAccount = true
        -- MgrNet.CS:CloseSocket()
        MgrSdk.BackToLogin()
    end
end

return M