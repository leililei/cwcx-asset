-- Code Auto Create Begin
local M = Class('PlayerAvatar_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlayerAvatar_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlayerAvatar_UI].prefab'
    self.Name = 'Form[PlayerAvatar_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Bianxian(zuo)','Bg/Bianxian(zuo)',2},{'lihui','Bg/LihuiPanel/lihui',2},{'FrontBG','FrontBG',2},{'UI_Canvas','UI_Canvas',2},{'Btn_Return','UI_Canvas/UpperLeftPanel/Btn_Return',2},{'mohudi','UI_Canvas/Mingpian/mohudi',2},{'Img_Mingpiankuang','UI_Canvas/Mingpian/Img_Mingpiankuang',2},{'Img_Qianmingdi','UI_Canvas/Mingpian/Signature/Img_Qianmingdi',2},{'Btn_SignEdit','UI_Canvas/Mingpian/Signature/Btn_SignEdit',2},{'Btn_Edit2','UI_Canvas/Mingpian/Signature/Btn_SignEdit/Btn_Edit2',2},{'Img_BianjiIcon2','UI_Canvas/Mingpian/Signature/Btn_SignEdit/Img_BianjiIcon2',2},{'Btn_Shengri','UI_Canvas/Mingpian/Birthday/Btn_Shengri',2},{'Btn_Edit201','UI_Canvas/Mingpian/Birthday/Btn_Shengri/Btn_Edit2',2},{'Img_BianjiIcon201','UI_Canvas/Mingpian/Birthday/Btn_Shengri/Img_BianjiIcon2',2},{'heitiao','UI_Canvas/Mingpian/LV/heitiao',2},{'LvSlider','UI_Canvas/Mingpian/LV/LvSlider',2},{'Img_Biaotidi5','UI_Canvas/Mingpian/LV/Img_Biaotidi5',2},{'Img_Lv','UI_Canvas/Mingpian/LV/Img_Lv',2},{'Img_Nichengdi','UI_Canvas/Mingpian/Nickname/Img_Nichengdi',2},{'Btn_NameEdit','UI_Canvas/Mingpian/Nickname/Btn_NameEdit',2},{'Btn_Edit','UI_Canvas/Mingpian/Nickname/Btn_NameEdit/Btn_Edit',2},{'Img_BianjiIcon','UI_Canvas/Mingpian/Nickname/Btn_NameEdit/Img_BianjiIcon',2},{'Btn_Copy','UI_Canvas/Mingpian/ID/Btn_Copy',2},{'Btn_Copy01','UI_Canvas/Mingpian/ID/Btn_Copy/Btn_Copy',2},{'touxiangyuan2','UI_Canvas/Mingpian/Btn_Avatar/touxiangyuan2',2},{'touxiangyuan','UI_Canvas/Mingpian/Btn_Avatar/touxiangyuan',2},{'PlayerIcon','UI_Canvas/Mingpian/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang','UI_Canvas/Mingpian/Btn_Avatar/touxiangkuang',2},{'Img_Zhenrongdi','UI_Canvas/Zhenxing/LineUp/Img_Zhenrongdi',2},{'TeamPanel','UI_Canvas/Zhenxing/LineUp/TeamPanel',2},{'16','UI_Canvas/Zhenxing/LineUp/TeamPanel/16',2},{'13','UI_Canvas/Zhenxing/LineUp/TeamPanel/13',2},{'10','UI_Canvas/Zhenxing/LineUp/TeamPanel/10',2},{'7','UI_Canvas/Zhenxing/LineUp/TeamPanel/7',2},{'4','UI_Canvas/Zhenxing/LineUp/TeamPanel/4',2},{'1','UI_Canvas/Zhenxing/LineUp/TeamPanel/1',2},{'17','UI_Canvas/Zhenxing/LineUp/TeamPanel/17',2},{'14','UI_Canvas/Zhenxing/LineUp/TeamPanel/14',2},{'11','UI_Canvas/Zhenxing/LineUp/TeamPanel/11',2},{'8','UI_Canvas/Zhenxing/LineUp/TeamPanel/8',2},{'5','UI_Canvas/Zhenxing/LineUp/TeamPanel/5',2},{'2','UI_Canvas/Zhenxing/LineUp/TeamPanel/2',2},{'18','UI_Canvas/Zhenxing/LineUp/TeamPanel/18',2},{'15','UI_Canvas/Zhenxing/LineUp/TeamPanel/15',2},{'12','UI_Canvas/Zhenxing/LineUp/TeamPanel/12',2},{'9','UI_Canvas/Zhenxing/LineUp/TeamPanel/9',2},{'6','UI_Canvas/Zhenxing/LineUp/TeamPanel/6',2},{'3','UI_Canvas/Zhenxing/LineUp/TeamPanel/3',2},{'TeamRolePrefab','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab',2},{'Img_Touxiangdi','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/RoleIcon',2},{'Img_Kuang','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/Img_Kuang',2},{'Text_Lv','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/Text_Lv',2},{'zhiyeicon','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/JxStarPanel',2},{'StarPanel','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/StarPanel',2},{'StaPrefab','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/StaPrefab',2},{'JxStarPrefab','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/JxStarPrefab',2},{'Img_Biaotidi501','UI_Canvas/Zhenxing/Rank(advanced)/Img_Biaotidi5',2},{'Btn_View','UI_Canvas/Zhenxing/Rank(advanced)/Btn_View',2},{'Img_chakan','UI_Canvas/Zhenxing/Rank(advanced)/Btn_View/Img_chakan',2},{'Text_Rank','UI_Canvas/Zhenxing/Rank(advanced)/Btn_View/Text_Rank',2},{'RankIcon','UI_Canvas/Zhenxing/Rank(advanced)/Btn_View/RankIcon',2},{'ImgMaster','UI_Canvas/Zhenxing/Rank(advanced)/Btn_View/ImgMaster',2},{'Img_Biaotidi1','UI_Canvas/PlayerTeam/Img_Biaotidi1',2},{'Img_Chengguang','UI_Canvas/Qinxin/Img_Chengguang',2},{'Btn_Replace','UI_Canvas/Qinxin/Text_Jueseid/Btn_Replace',2},{'Img_Biaotidi2','UI_Canvas/Qinxin/Img_Biaotidi2',2},{'Zhiyuanjuese','UI_Canvas/Zhiyuanjuese',2},{'Img_Zhiyuandi','UI_Canvas/Zhiyuanjuese/Img_Zhiyuandi',2},{'Img_Bianhaodi3','UI_Canvas/Zhiyuanjuese/Img_Bianhaodi3',2},{'Img_Bianhaodi2','UI_Canvas/Zhiyuanjuese/Img_Bianhaodi2',2},{'Img_Bianhaodi1','UI_Canvas/Zhiyuanjuese/Img_Bianhaodi1',2},{'Img_Biaotidi3','UI_Canvas/Zhiyuanjuese/Img_Biaotidi3',2},{'Img_NoData','UI_Canvas/Zhiyuanjuese/Img_NoData',2},{'SupportRolePrefab','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab',2},{'Img_Touxiangdi01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/Img_Touxiangdi',2},{'RoleIcon01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/RoleIcon',2},{'Img_Kuang01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/Img_Kuang',2},{'Text_Lv01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/Text_Lv',2},{'zhiyeicon01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/zhiyeicon',2},{'Img_Rankdi01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/Img_Rankdi',2},{'EmptyStar01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/JxStarPanel',2},{'JxStarPrefab01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/StarPanel',2},{'StaPrefab01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_NoData2','UI_Canvas/Zhiyuanjuese/Img_NoData2',2},{'SupportRolePrefab01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab',2},{'Img_Touxiangdi02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/Img_Touxiangdi',2},{'RoleIcon02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/RoleIcon',2},{'Img_Kuang02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/Img_Kuang',2},{'Text_Lv02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/Text_Lv',2},{'zhiyeicon02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/zhiyeicon',2},{'Img_Rankdi02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/Img_Rankdi',2},{'EmptyStar02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/JxStarPanel',2},{'JxStarPrefab02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/StarPanel',2},{'StaPrefab02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)01','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_NoData3','UI_Canvas/Zhiyuanjuese/Img_NoData3',2},{'SupportRolePrefab02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab',2},{'Img_Touxiangdi03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/Img_Touxiangdi',2},{'RoleIcon03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/RoleIcon',2},{'Img_Kuang03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/Img_Kuang',2},{'Text_Lv03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/Text_Lv',2},{'zhiyeicon03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/zhiyeicon',2},{'Img_Rankdi03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/Img_Rankdi',2},{'EmptyStar03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/JxStarPanel',2},{'JxStarPrefab03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/StarPanel',2},{'StaPrefab03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)02','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/StarPanel/StaPrefab (5)',2},{'supportLock','UI_Canvas/Zhiyuanjuese/supportLock',2},{'Img_Lock1','UI_Canvas/Zhiyuanjuese/supportLock/Img_Lock1',2},{'Img_Lock2','UI_Canvas/Zhiyuanjuese/supportLock/Img_Lock2',2},{'Img_Lock3','UI_Canvas/Zhiyuanjuese/supportLock/Img_Lock3',2},{'BadgeDisPlay','UI_Canvas/BadgeDisPlay',2},{'Img_Biaotidi4','UI_Canvas/BadgeDisPlay/Img_Biaotidi4',2},{'Img_Zhanshidi','UI_Canvas/BadgeDisPlay/Img_Zhanshidi',2},{'bg','UI_Canvas/BadgeDisPlay/bg',2},{'MainSlot1','UI_Canvas/BadgeDisPlay/bg/MainSlot1',2},{'Img_Icon','UI_Canvas/BadgeDisPlay/bg/MainSlot1/Img_Icon',2},{'VFX','UI_Canvas/BadgeDisPlay/bg/MainSlot1/VFX',2},{'Img_Bianhaodi201','UI_Canvas/BadgeDisPlay/bg/MainSlot1/Img_Bianhaodi2',2},{'MainSlot2','UI_Canvas/BadgeDisPlay/bg/MainSlot2',2},{'Img_Icon01','UI_Canvas/BadgeDisPlay/bg/MainSlot2/Img_Icon',2},{'VFX01','UI_Canvas/BadgeDisPlay/bg/MainSlot2/VFX',2},{'Img_Bianhaodi202','UI_Canvas/BadgeDisPlay/bg/MainSlot2/Img_Bianhaodi2',2},{'MainSlot3','UI_Canvas/BadgeDisPlay/bg/MainSlot3',2},{'Img_Icon02','UI_Canvas/BadgeDisPlay/bg/MainSlot3/Img_Icon',2},{'VFX02','UI_Canvas/BadgeDisPlay/bg/MainSlot3/VFX',2},{'Img_Bianhaodi203','UI_Canvas/BadgeDisPlay/bg/MainSlot3/Img_Bianhaodi2',2},{'MainSlot4','UI_Canvas/BadgeDisPlay/bg/MainSlot4',2},{'Img_Icon03','UI_Canvas/BadgeDisPlay/bg/MainSlot4/Img_Icon',2},{'VFX03','UI_Canvas/BadgeDisPlay/bg/MainSlot4/VFX',2},{'Img_Bianhaodi204','UI_Canvas/BadgeDisPlay/bg/MainSlot4/Img_Bianhaodi2',2},{'ChooseNameOrSign','UI_Canvas/ChooseNameOrSign',2},{'zhezhao','UI_Canvas/ChooseNameOrSign/zhezhao',2},{'Btn_Back','UI_Canvas/ChooseNameOrSign/Btn_Back',2},{'Img_Xian1','UI_Canvas/ChooseNameOrSign/Img_Xian1',2},{'Img_Xian2','UI_Canvas/ChooseNameOrSign/Img_Xian2',2},{'Img_PopUpsDi','UI_Canvas/ChooseNameOrSign/Img_PopUpsDi',2},{'Btn_Confirm','UI_Canvas/ChooseNameOrSign/Btn_Confirm',2},{'Btn_Confirm01','UI_Canvas/ChooseNameOrSign/Btn_Confirm/Btn_Confirm',2},{'Btn_Cancel','UI_Canvas/ChooseNameOrSign/Btn_Cancel',2},{'Btn_Cancel01','UI_Canvas/ChooseNameOrSign/Btn_Cancel/Btn_Cancel',2},{'ChooseSignPanel','UI_Canvas/ChooseNameOrSign/ChooseSignPanel',2},{'Qianmingdi','UI_Canvas/ChooseNameOrSign/ChooseSignPanel/Qianmingdi',2},{'content','UI_Canvas/ChooseNameOrSign/ChooseSignPanel/content',2},{'Img_Xian','UI_Canvas/ChooseNameOrSign/ChooseSignPanel/content/Text_Biaoti2/Img_Xian',2},{'ChooseNickNamePanel','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel',2},{'Nichengdi','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel/Nichengdi',2},{'content01','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel/content',2},{'Img_Xian01','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel/content/Text_Biaoti/Img_Xian',2},{'ChooseBirthdayPanel','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel',2},{'BirthdayItem','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/BirthdayItem',2},{'Ridi','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Ridi',2},{'Img_Xuanzhongdi','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Ridi/Img_Xuanzhongdi',2},{'Content','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Ridi/Content',2},{'Img_Xian02','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Text_Biaoti3/Img_Xian',2},{'Select_Moon','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Select_Moon',2},{'Select_Day','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Select_Day',2},{'ChoosePlayerRole','UI_Canvas/ChoosePlayerRole',2},{'zhezhao01','UI_Canvas/ChoosePlayerRole/bg/zhezhao',2},{'Img_Tanchudi','UI_Canvas/ChoosePlayerRole/bg/Img_Tanchudi',2},{'Img_Tanchuxian','UI_Canvas/ChoosePlayerRole/bg/Img_Tanchuxian',2},{'Img_Xian101','UI_Canvas/ChoosePlayerRole/bg/Img_Xian1',2},{'Img_Xian201','UI_Canvas/ChoosePlayerRole/bg/Img_Xian2',2},{'Btn_Genghuan','UI_Canvas/ChoosePlayerRole/Btn_Genghuan',2},{'Btn_Genghuan01','UI_Canvas/ChoosePlayerRole/Btn_Genghuan/Btn_Genghuan',2},{'Btn_UnGenghuan','UI_Canvas/ChoosePlayerRole/Btn_UnGenghuan',2},{'Btn_Genghuan(hui)','UI_Canvas/ChoosePlayerRole/Btn_UnGenghuan/Btn_Genghuan(hui)',2},{'RoleContent','UI_Canvas/ChoosePlayerRole/PlayerRoleScroll/RoleContent',2},{'qiehuandi(you)','UI_Canvas/ChoosePlayerRole/GearSortPanel/qiehuandi(you)',2},{'GearSortToggleGroup','UI_Canvas/ChoosePlayerRole/GearSortPanel/GearSortToggleGroup',2},{'PlayerSortToggle','UI_Canvas/ChoosePlayerRole/GearSortPanel/GearSortToggleGroup/PlayerSortToggle',2},{'Btn_ChooseRoleBack','UI_Canvas/ChoosePlayerRole/Btn_ChooseRoleBack',2},{'ChooseHeadIcon','UI_Canvas/ChooseHeadIcon',2},{'Image','UI_Canvas/ChooseHeadIcon/Image',2},{'Maskmid','UI_Canvas/ChooseHeadIcon/Maskmid',2},{'Img_BG01','UI_Canvas/ChooseHeadIcon/Img_BG',2},{'Img_Xian102','UI_Canvas/ChooseHeadIcon/Img_BG/Img_Xian1',2},{'Img_Xian202','UI_Canvas/ChooseHeadIcon/Img_BG/Img_Xian2',2},{'Baidi','UI_Canvas/ChooseHeadIcon/Img_BG/Baidi',2},{'Btn_HeadReturn','UI_Canvas/ChooseHeadIcon/Btn_HeadReturn',2},{'HeadInfo','UI_Canvas/ChooseHeadIcon/HeadInfo',2},{'bg01','UI_Canvas/ChooseHeadIcon/HeadInfo/bg',2},{'Btn_UnUse','UI_Canvas/ChooseHeadIcon/HeadInfo/Btn_UnUse',2},{'Btn_Shiyong(hui)','UI_Canvas/ChooseHeadIcon/HeadInfo/Btn_UnUse/Btn_Shiyong(hui)',2},{'Btn_Use','UI_Canvas/ChooseHeadIcon/HeadInfo/Btn_Use',2},{'Btn_Shiyong','UI_Canvas/ChooseHeadIcon/HeadInfo/Btn_Use/Btn_Shiyong',2},{'Img_Biaotidi','UI_Canvas/ChooseHeadIcon/HeadInfo/Img_Biaotidi',2},{'Iconbg','UI_Canvas/ChooseHeadIcon/HeadInfo/Iconbg',2},{'IconMask','UI_Canvas/ChooseHeadIcon/HeadInfo/Iconbg/IconMask',2},{'HeadIcon','UI_Canvas/ChooseHeadIcon/HeadInfo/Iconbg/IconMask/HeadIcon',2},{'HeadFrame','UI_Canvas/ChooseHeadIcon/HeadInfo/Iconbg/HeadFrame',2},{'HeadKuangInfo','UI_Canvas/ChooseHeadIcon/HeadKuangInfo',2},{'bg02','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/bg',2},{'Btn_UnUse01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Btn_UnUse',2},{'Btn_Shiyong(hui)01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Btn_UnUse/Btn_Shiyong(hui)',2},{'Btn_Use01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Btn_Use',2},{'Btn_Shiyong01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Btn_Use/Btn_Shiyong',2},{'Img_Biaotidi01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Img_Biaotidi',2},{'Iconbg01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Iconbg',2},{'IconMask01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Iconbg/IconMask',2},{'HeadIcon01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Iconbg/IconMask/HeadIcon',2},{'HeadFrame01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Iconbg/HeadFrame',2},{'IconContent','UI_Canvas/ChooseHeadIcon/VFXMask/HeadIconScroll/IconContent',2},{'HeadIconItem','UI_Canvas/ChooseHeadIcon/VFXMask/HeadIconScroll/HeadIconItem',2},{'IconContent01','UI_Canvas/ChooseHeadIcon/VFXMask/HeadKuangIconScroll/IconContent',2},{'HeadKuangIconItem','UI_Canvas/ChooseHeadIcon/VFXMask/HeadKuangIconScroll/HeadKuangIconItem',2},{'Btn_HeadIcon','UI_Canvas/ChooseHeadIcon/Btn_HeadIcon',2},{'Btn_Cutpage(Selected)','UI_Canvas/ChooseHeadIcon/Btn_HeadIcon/Btn_Cutpage(Selected)',2},{'Btn_UnHeadIcon','UI_Canvas/ChooseHeadIcon/Btn_UnHeadIcon',2},{'Btn_Cutpage','UI_Canvas/ChooseHeadIcon/Btn_UnHeadIcon/Btn_Cutpage',2},{'Btn_Frame','UI_Canvas/ChooseHeadIcon/Btn_Frame',2},{'Btn_Frame(Selected)','UI_Canvas/ChooseHeadIcon/Btn_Frame/Btn_Frame(Selected)',2},{'Btn_UnFrame','UI_Canvas/ChooseHeadIcon/Btn_UnFrame',2},{'Btn_UnFrame(CutPage)','UI_Canvas/ChooseHeadIcon/Btn_UnFrame/Btn_UnFrame(CutPage)',2},{'ChooseBadge','UI_Canvas/ChooseBadge',2},{'badgeBg','UI_Canvas/ChooseBadge/badgeBg',2},{'Img_BG02','UI_Canvas/ChooseBadge/Img_BG',2},{'Img_Dian1','UI_Canvas/ChooseBadge/Img_BG/Img_Dian1',2},{'Img_Dian2','UI_Canvas/ChooseBadge/Img_BG/Img_Dian2',2},{'Img_Xian103','UI_Canvas/ChooseBadge/Img_BG/Img_Xian1',2},{'Img_Xuanzedi','UI_Canvas/ChooseBadge/Img_BG/Img_Xuanzedi',2},{'Btn_UnBadgeUse','UI_Canvas/ChooseBadge/BadgeInfo/Btn_UnBadgeUse',2},{'Btn_Genghuan02','UI_Canvas/ChooseBadge/BadgeInfo/Btn_UnBadgeUse/Btn_Genghuan',2},{'Btn_BadgeUse','UI_Canvas/ChooseBadge/BadgeInfo/Btn_BadgeUse',2},{'Btn_Genghuan03','UI_Canvas/ChooseBadge/BadgeInfo/Btn_BadgeUse/Btn_Genghuan',2},{'Btn_Yichu','UI_Canvas/ChooseBadge/BadgeInfo/Btn_Yichu',2},{'Btn_Yichu01','UI_Canvas/ChooseBadge/BadgeInfo/Btn_Yichu/Btn_Yichu',2},{'Fenggexian','UI_Canvas/ChooseBadge/BadgeInfo/Fenggexian',2},{'Img_isEquipBadge','UI_Canvas/ChooseBadge/BadgeInfo/Img_isEquipBadge',2},{'BadgeIcon','UI_Canvas/ChooseBadge/BadgeInfo/BadgeIcon',2},{'VFXBadgeIcon','UI_Canvas/ChooseBadge/BadgeInfo/VFXBadgeIcon',2},{'bg03','UI_Canvas/ChooseBadge/BadgeSlot/bg',2},{'Slot1','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot1',2},{'Img_Bianhaodi205','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot1/Img_Bianhaodi2',2},{'Img_Icon04','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot1/Img_Icon',2},{'VFXIcon','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot1/VFXIcon',2},{'SelectedImg','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot1/SelectedImg',2},{'Slot2','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot2',2},{'Img_Bianhaodi206','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot2/Img_Bianhaodi2',2},{'Img_Icon05','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot2/Img_Icon',2},{'VFXIcon01','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot2/VFXIcon',2},{'SelectedImg01','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot2/SelectedImg',2},{'Slot3','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot3',2},{'Img_Bianhaodi207','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot3/Img_Bianhaodi2',2},{'Img_Icon06','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot3/Img_Icon',2},{'VFXIcon02','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot3/VFXIcon',2},{'SelectedImg02','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot3/SelectedImg',2},{'Slot4','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot4',2},{'Img_Bianhaodi208','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot4/Img_Bianhaodi2',2},{'Img_Icon07','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot4/Img_Icon',2},{'VFXIcon03','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot4/VFXIcon',2},{'SelectedImg03','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot4/SelectedImg',2},{'BadgeContent','UI_Canvas/ChooseBadge/BadgeScroll/BadgeContent',2},{'PlayerBadgeItem','UI_Canvas/ChooseBadge/BadgeScroll/PlayerBadgeItem',2},{'Btn_BadgeReturn','UI_Canvas/ChooseBadge/Btn_BadgeReturn',2},{'RecordReview','UI_Canvas/RecordReview',2},{'beijing','UI_Canvas/RecordReview/beijing',2},{'bg04','UI_Canvas/RecordReview/bg',2},{'Title','UI_Canvas/RecordReview/bg/Title',2},{'tiao','UI_Canvas/RecordReview/bg/Title/tiao',2},{'Img_Duanweidi','UI_Canvas/RecordReview/bg/Img_Duanweidi',2},{'LastRankPanel','UI_Canvas/RecordReview/bg/Rank/LastRank/LastRankPanel',2},{'Text_LastRankName','UI_Canvas/RecordReview/bg/Rank/LastRank/LastRankPanel/Text_LastRankName',2},{'Img_LastRankIcon','UI_Canvas/RecordReview/bg/Rank/LastRank/LastRankPanel/Img_LastRankIcon',2},{'Img_biaotidi3','UI_Canvas/RecordReview/bg/Rank/LastRank/Img_biaotidi3',2},{'HighestRankPanel','UI_Canvas/RecordReview/bg/Rank/HighestRank/HighestRankPanel',2},{'Text_HighestRankName','UI_Canvas/RecordReview/bg/Rank/HighestRank/HighestRankPanel/Text_HighestRankName',2},{'Img_HighestRankIcon','UI_Canvas/RecordReview/bg/Rank/HighestRank/HighestRankPanel/Img_HighestRankIcon',2},{'Img_biaotidi2','UI_Canvas/RecordReview/bg/Rank/HighestRank/Img_biaotidi2',2},{'Text_CurrentRankName','UI_Canvas/RecordReview/bg/Rank/CurrentRank/Text_CurrentRankName',2},{'Img_Shuxian','UI_Canvas/RecordReview/bg/Rank/CurrentRank/Img_Shuxian',2},{'Img_CurrentRankIcon','UI_Canvas/RecordReview/bg/Rank/CurrentRank/Img_CurrentRankIcon',2},{'Img_biaotidi','UI_Canvas/RecordReview/bg/Rank/CurrentRank/Img_biaotidi',2},{'Img_Yuanhuan(hei)2','UI_Canvas/RecordReview/bg/Cumulative/Defender/Img_Yuanhuan(hei)2',2},{'Img_DefSlider','UI_Canvas/RecordReview/bg/Cumulative/Defender/Img_DefSlider',2},{'Fangshoudi','UI_Canvas/RecordReview/bg/Cumulative/Defender/Fangshoudi',2},{'Img_Yuanhuan(hei)','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Img_Yuanhuan(hei)',2},{'Img_AtkSlider','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Img_AtkSlider',2},{'Jingongdi','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Jingongdi',2},{'Img_biaotidi4','UI_Canvas/RecordReview/bg/Cumulative/Img_biaotidi4',2},{'Btn_RecordReturn','UI_Canvas/RecordReview/bg/Btn_RecordReturn',2},{'Btn_Return01','UI_Canvas/RecordReview/bg/Btn_RecordReturn/Btn_Return',2},
        -- Text 列表
        {'Text_PROFILE','UI_Canvas/Mingpian/Text_PROFILE',3},{'Text_Genghuan','UI_Canvas/ChooseBadge/BadgeInfo/Btn_UnBadgeUse/Text_Genghuan',3},{'Text_Zhanshizhong','UI_Canvas/ChooseBadge/BadgeInfo/Img_isEquipBadge/Text_Zhanshizhong',3},
        -- Button 列表
        {'Btn_RecordReturn01','UI_Canvas/RecordReview/bg/Btn_RecordReturn',4},
        -- UITemplate 列表
        {'BirthdayItem01','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/BirthdayItem',10},{'PlayerRoleItem','UI_Canvas/ChoosePlayerRole/PlayerRoleScroll/PlayerRoleItem',10},{'PlayerSortToggle01','UI_Canvas/ChoosePlayerRole/GearSortPanel/GearSortToggleGroup/PlayerSortToggle',10},{'HeadIconItem01','UI_Canvas/ChooseHeadIcon/VFXMask/HeadIconScroll/HeadIconItem',10},{'HeadKuangIconItem01','UI_Canvas/ChooseHeadIcon/VFXMask/HeadKuangIconScroll/HeadKuangIconItem',10},{'PlayerBadgeItem01','UI_Canvas/ChooseBadge/BadgeScroll/PlayerBadgeItem',10},
        -- Toggle 列表
        {'PlayerSortToggle02','UI_Canvas/ChoosePlayerRole/GearSortPanel/GearSortToggleGroup/PlayerSortToggle',13},
        -- RawImage 列表
        {'PlayerRoleScroll','UI_Canvas/ChoosePlayerRole/PlayerRoleScroll',15},{'HeadIconScroll','UI_Canvas/ChooseHeadIcon/VFXMask/HeadIconScroll',15},{'HeadKuangIconScroll','UI_Canvas/ChooseHeadIcon/VFXMask/HeadKuangIconScroll',15},{'BadgeScroll','UI_Canvas/ChooseBadge/BadgeScroll',15},
        -- LoopScrollRect 列表
        {'Ridi01','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Ridi',18},{'PlayerRoleScroll01','UI_Canvas/ChoosePlayerRole/PlayerRoleScroll',18},{'HeadIconScroll01','UI_Canvas/ChooseHeadIcon/VFXMask/HeadIconScroll',18},{'HeadKuangIconScroll01','UI_Canvas/ChooseHeadIcon/VFXMask/HeadKuangIconScroll',18},{'BadgeScroll01','UI_Canvas/ChooseBadge/BadgeScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Sign','UI_Canvas/Mingpian/Signature/Text_Sign',20},{'Text_Shengri','UI_Canvas/Mingpian/Birthday/Text_Shengri',20},{'Text_ShengriTxt','UI_Canvas/Mingpian/Birthday/Text_ShengriTxt',20},{'Text_Gonghuiming','UI_Canvas/Mingpian/Guild/Text_Gonghuiming',20},{'Text_Qianfadanwei','UI_Canvas/Mingpian/Guild/Text_Qianfadanwei',20},{'Text_Exp','UI_Canvas/Mingpian/LV/Text_Exp',20},{'Text_LV','UI_Canvas/Mingpian/LV/Text_LV',20},{'Text_Nicheng','UI_Canvas/Mingpian/Nickname/Text_Nicheng',20},{'Text_Fuzhi','UI_Canvas/Mingpian/ID/Btn_Copy/Text_Fuzhi',20},{'Text_ID','UI_Canvas/Mingpian/ID/Text_ID',20},{'Text_Grade','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/Text_Grade',20},{'Text_Rank01','UI_Canvas/Zhenxing/LineUp/TeamRolePrefab/Img_Rankdi/Text_Rank',20},{'Text_Duanwei','UI_Canvas/Zhenxing/Rank(advanced)/Img_Biaotidi5/Text_Duanwei',20},{'Text_DrillRank','UI_Canvas/Zhenxing/Rank(advanced)/Img_Biaotidi5/Text_DrillRank',20},{'Text_RoleCount','UI_Canvas/PlayerTeam/Text_RoleCount',20},{'Text_RoleSlider','UI_Canvas/PlayerTeam/Text_RoleSlider',20},{'Text_Duiyuanshu','UI_Canvas/PlayerTeam/Img_Biaotidi1/Text_Duiyuanshu',20},{'Text_Number','UI_Canvas/PlayerTeam/Img_Biaotidi1/Text_Number',20},{'Text_Jueseid','UI_Canvas/Qinxin/Text_Jueseid',20},{'Text_Qinxin','UI_Canvas/Qinxin/Img_Biaotidi2/Text_Qinxin',20},{'Text_Cronies','UI_Canvas/Qinxin/Img_Biaotidi2/Text_Cronies',20},{'Text_Bianhao3','UI_Canvas/Zhiyuanjuese/Text_Bianhao3',20},{'Text_Bianhao2','UI_Canvas/Zhiyuanjuese/Text_Bianhao2',20},{'Text_Bianhao1','UI_Canvas/Zhiyuanjuese/Text_Bianhao1',20},{'Text_Zhiyuan','UI_Canvas/Zhiyuanjuese/Img_Biaotidi3/Text_Zhiyuan',20},{'Text_SupportRole','UI_Canvas/Zhiyuanjuese/Img_Biaotidi3/Text_SupportRole',20},{'Text_Grade01','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/Text_Grade',20},{'Text_Rank02','UI_Canvas/Zhiyuanjuese/Img_NoData/SupportRolePrefab/Img_Rankdi/Text_Rank',20},{'Text_Grade02','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/Text_Grade',20},{'Text_Rank03','UI_Canvas/Zhiyuanjuese/Img_NoData2/SupportRolePrefab/Img_Rankdi/Text_Rank',20},{'Text_Grade03','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/Text_Grade',20},{'Text_Rank04','UI_Canvas/Zhiyuanjuese/Img_NoData3/SupportRolePrefab/Img_Rankdi/Text_Rank',20},{'Text_Xunzhang','UI_Canvas/BadgeDisPlay/Img_Biaotidi4/Text_Xunzhang',20},{'Text_MedalDisplay','UI_Canvas/BadgeDisPlay/Img_Biaotidi4/Text_MedalDisplay',20},{'Text_Slot','UI_Canvas/BadgeDisPlay/bg/MainSlot1/Img_Bianhaodi2/Text_Slot',20},{'Text_Slot01','UI_Canvas/BadgeDisPlay/bg/MainSlot2/Img_Bianhaodi2/Text_Slot',20},{'Text_Slot02','UI_Canvas/BadgeDisPlay/bg/MainSlot3/Img_Bianhaodi2/Text_Slot',20},{'Text_Slot03','UI_Canvas/BadgeDisPlay/bg/MainSlot4/Img_Bianhaodi2/Text_Slot',20},{'Text_Confirm','UI_Canvas/ChooseNameOrSign/Btn_Confirm/Text_Confirm',20},{'Text_Cancel','UI_Canvas/ChooseNameOrSign/Btn_Cancel/Text_Cancel',20},{'Text_Biaoti2','UI_Canvas/ChooseNameOrSign/ChooseSignPanel/content/Text_Biaoti2',20},{'Text_Zishu2','UI_Canvas/ChooseNameOrSign/ChooseSignPanel/content/Text_Zishu2',20},{'Text_ChooseSign','UI_Canvas/ChooseNameOrSign/ChooseSignPanel/Input_ChooseSign/Text_ChooseSign',20},{'Text_Biaoti','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel/content/Text_Biaoti',20},{'Text_Zishu','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel/content/Text_Zishu',20},{'Text_ChooseNickName','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel/Input_ChooseNickName/Text_ChooseNickName',20},{'Text_Ri','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Ridi/Text_Ri',20},{'Text_Yue','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Text_Yue',20},{'Text_Ri01','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Text_Ri',20},{'Text_Biaoti3','UI_Canvas/ChooseNameOrSign/ChooseBirthdayPanel/Text_Biaoti3',20},{'Text_Genghuan01','UI_Canvas/ChoosePlayerRole/Btn_Genghuan/Text_Genghuan',20},{'Text_Genghuan02','UI_Canvas/ChoosePlayerRole/Btn_UnGenghuan/Text_Genghuan',20},{'Text_Xuanze','UI_Canvas/ChooseHeadIcon/Img_BG/Text_Xuanze',20},{'Text_Shiyong','UI_Canvas/ChooseHeadIcon/HeadInfo/Btn_UnUse/Text_Shiyong',20},{'Text_Shiyong01','UI_Canvas/ChooseHeadIcon/HeadInfo/Btn_Use/Text_Shiyong',20},{'Text_HeadDes','UI_Canvas/ChooseHeadIcon/HeadInfo/Text_HeadDes',20},{'Text_HeadName','UI_Canvas/ChooseHeadIcon/HeadInfo/Text_HeadName',20},{'Text_Xuanze2','UI_Canvas/ChooseHeadIcon/HeadInfo/Text_Xuanze2',20},{'Text_Shiyong02','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Btn_UnUse/Text_Shiyong',20},{'Text_Shiyong03','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Btn_Use/Text_Shiyong',20},{'Text_HeadDes01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Text_HeadDes',20},{'Text_HeadName01','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Text_HeadName',20},{'Text_Xuanze201','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Text_Xuanze2',20},{'Text_HeadLimitTime','UI_Canvas/ChooseHeadIcon/HeadKuangInfo/Text_HeadLimitTime',20},{'Text_Head','UI_Canvas/ChooseHeadIcon/Btn_HeadIcon/Text_Head',20},{'Text_Cutpage','UI_Canvas/ChooseHeadIcon/Btn_UnHeadIcon/Text_Cutpage',20},{'Text_Frame','UI_Canvas/ChooseHeadIcon/Btn_Frame/Text_Frame',20},{'Text_Frame01','UI_Canvas/ChooseHeadIcon/Btn_UnFrame/Text_Frame',20},{'Text_Genghuan03','UI_Canvas/ChooseBadge/BadgeInfo/Btn_BadgeUse/Text_Genghuan',20},{'Text_Yichu','UI_Canvas/ChooseBadge/BadgeInfo/Btn_Yichu/Text_Yichu',20},{'Text_BadgeDes','UI_Canvas/ChooseBadge/BadgeInfo/Text_BadgeDes',20},{'Text_MainBadgeName','UI_Canvas/ChooseBadge/BadgeInfo/Text_MainBadgeName',20},{'Text_BadgeLimitTime','UI_Canvas/ChooseBadge/BadgeInfo/Text_BadgeLimitTime',20},{'Text_Slot04','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot1/Text_Slot',20},{'Text_Slot05','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot2/Text_Slot',20},{'Text_Slot06','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot3/Text_Slot',20},{'Text_Slot07','UI_Canvas/ChooseBadge/BadgeSlot/bg/Slot4/Text_Slot',20},{'Text_Biaoti01','UI_Canvas/RecordReview/bg/Title/Text_Biaoti',20},{'Text_title','UI_Canvas/RecordReview/bg/Rank/LastRank/LastRankPanel/Text_title',20},{'Text_LastRankScore','UI_Canvas/RecordReview/bg/Rank/LastRank/LastRankPanel/Text_LastRankScore',20},{'Text_Shangsaiji','UI_Canvas/RecordReview/bg/Rank/LastRank/Img_biaotidi3/Text_Shangsaiji',20},{'Text_LastRankNameNil','UI_Canvas/RecordReview/bg/Rank/LastRank/Text_LastRankNameNil',20},{'Text_title01','UI_Canvas/RecordReview/bg/Rank/HighestRank/HighestRankPanel/Text_title',20},{'Text_HighestRankScore','UI_Canvas/RecordReview/bg/Rank/HighestRank/HighestRankPanel/Text_HighestRankScore',20},{'Text_Zuigao','UI_Canvas/RecordReview/bg/Rank/HighestRank/Img_biaotidi2/Text_Zuigao',20},{'Text_HighestRankNameNil','UI_Canvas/RecordReview/bg/Rank/HighestRank/Text_HighestRankNameNil',20},{'Text_title02','UI_Canvas/RecordReview/bg/Rank/CurrentRank/Text_title',20},{'Text_CurrentRankScore','UI_Canvas/RecordReview/bg/Rank/CurrentRank/Text_CurrentRankScore',20},{'Text_Dangqian','UI_Canvas/RecordReview/bg/Rank/CurrentRank/Img_biaotidi/Text_Dangqian',20},{'Text_Vprobability','UI_Canvas/RecordReview/bg/Cumulative/Defender/Text_Vprobability',20},{'Text_Shenglv2','UI_Canvas/RecordReview/bg/Cumulative/Defender/Text_Shenglv2',20},{'Text_DefVictory','UI_Canvas/RecordReview/bg/Cumulative/Defender/Text_DefVictory',20},{'Text_DefFail','UI_Canvas/RecordReview/bg/Cumulative/Defender/Text_DefFail',20},{'Text_Fangshoufang','UI_Canvas/RecordReview/bg/Cumulative/Defender/Text_Fangshoufang',20},{'Text_Aprobability','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Text_Aprobability',20},{'Text_Shenglv','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Text_Shenglv',20},{'Text_AtkVictory','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Text_AtkVictory',20},{'Text_AtkFail','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Text_AtkFail',20},{'Text_Jingongfang','UI_Canvas/RecordReview/bg/Cumulative/Attackers/Text_Jingongfang',20},{'Text_Leijijilu','UI_Canvas/RecordReview/bg/Cumulative/Img_biaotidi4/Text_Leijijilu',20},{'Text_Return','UI_Canvas/RecordReview/bg/Btn_RecordReturn/Text_Return',20},
        -- TMP_InputField 列表
        {'Input_ChooseSign','UI_Canvas/ChooseNameOrSign/ChooseSignPanel/Input_ChooseSign',21},{'Input_ChooseNickName','UI_Canvas/ChooseNameOrSign/ChooseNickNamePanel/Input_ChooseNickName',21},
    }
end
-- Code Auto Create End
require("LocalData/PlayheadLocalData")
require("LocalData/PlayheadframeLocalData")
require("LocalData/LowPVPLocalData")
require("LocalData/SeniorPVPLocalData")
require("LocalData/RoleattributeLocalData")
require("LocalData/RoleuiskinLocalData")
function M:OnInit()
    self.Input_ChooseNickName().characterLimit = tonumber(SteamLocalData.tab[104010][2])
    self.Input_ChooseSign().characterLimit = tonumber(SteamLocalData.tab[104012][2])
    -- self.Btn_UnHeadIcon().gameObject:SetActive(false)
    -- self.Btn_UnFrame().gameObject:SetActive(false)
    -- self.Btn_HeadIcon().gameObject:SetActive(false)
    -- self.Btn_Frame().gameObject:SetActive(false)
    ------------------修改签名或昵称----------------------
    self.isNmae = true   --- 修改签名或昵称
    self.popName = ""    --生日弹窗控制
    ------------------修改签名或昵称----------------------

    ------------------修改亲信---------------------------
    self.CurRoleItem = nil  ---当前选择亲信Item
    self.CurSpineObj = nil  ---当前spine物体
    self.Btn_UnGenghuan().gameObject:SetActive(true)
    self.Btn_Genghuan().gameObject:SetActive(false)
    ------------------修改亲信---------------------------

    ------------------修改头像---------------------------
    self.CurHeadIcon = nil  ---当前选择头像
    self.CurSelectHeadKuang = nil

    ------------------修改头像---------------------------

    self.CurPage = 1  --1:头像页 2：头像框页

    ------------------修改勋章---------------------------
    self.data1 = {0,1,2,3,4,5,6,7,8,9,10,11,12,13}
    ---主界面勋章槽位
    self.MainBadgeObj =
    {
        [1] = self.MainSlot1(),
        [2] = self.MainSlot2(),
        [3] = self.MainSlot3(),
        [4] = self.MainSlot4()
    }
    ---修改界面勋章槽位
    self.ChooseBadgeObj =
    {
        [1] = self.Slot1(),
        [2] = self.Slot2(),
        [3] = self.Slot3(),
        [4] = self.Slot4()
    }
    self.CurSelectBadge = nil  ---当前选择勋章
    self.CurSelectSlot = 1  --- 当前选择槽位
    ------------------修改勋章---------------------------
    self.TeamObj = {}
    for i = 1, 18 do
        self.TeamObj[i] = self.TeamPanel().transform:Find(i).gameObject
    end
    self.SupportObj = {
        self.Zhiyuanjuese().transform:Find("Img_NoData"):Find("SupportRolePrefab").gameObject,
        self.Zhiyuanjuese().transform:Find("Img_NoData2"):Find("SupportRolePrefab").gameObject,
        self.Zhiyuanjuese().transform:Find("Img_NoData3"):Find("SupportRolePrefab").gameObject,
    }
    ------------------隐藏弹窗---------------------------
    self.ChoosePlayerRole().gameObject:SetActive(false)
    self.ChooseNameOrSign().gameObject:SetActive(false)
    self.ChooseHeadIcon().gameObject:SetActive(false)
    self.ChooseBadge().gameObject:SetActive(false)
    self.RecordReview().gameObject:SetActive(false)
    self.TeamRolePrefab().gameObject:SetActive(false)
    ------------------隐藏弹窗---------------------------

    ---@type PlayerData
    if PlayerAvatarViewModel.CurPlayer == nil then
        PlayerAvatarViewModel.Init()
    end
    self.CurPlayerData = PlayerAvatarViewModel.CurPlayer ---玩家数据
end
function M:OnUpdateUI()
    ---设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 5
    self:InitPlayerInfo()---初始化玩家信息
    self:RegisterScroll()---注册滑块
    self:InitBadge()---初始化勋章
    self:ResetBadgeItem(0)
    self:InitButton()---初始化按钮
    self:InitChooseRole() ---初始化选择亲信
    self:InitMainPvP(1)
    self:InitSupport()
    self:InitBirthday()

    self:SetHeadTitle(0)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        local isChoosePlayerRole = self.ChoosePlayerRole().gameObject.activeSelf --选择角色界面是否打开
        local isChooseBadge = self.ChooseBadge().gameObject.activeSelf
        local isChooseNameOrSign = self.ChooseNameOrSign().gameObject.activeSelf
        local isRecordReview = self.RecordReview().gameObject.activeSelf
        local isChooseHeadIcon = self.ChooseHeadIcon().gameObject.activeSelf

        if isRecordReview then
            self.RecordReview().gameObject:SetActive(false)
            return
        end
        if isChooseNameOrSign then
            self.ChooseNameOrSign().gameObject:SetActive(false)
            return
        end
        if isChooseBadge then
            self.ChooseBadge().gameObject:SetActive(false)
            return
        end
        if isChoosePlayerRole then
            self.ChoosePlayerRole().gameObject:SetActive(false)
            return
        end

        if isChooseHeadIcon then
            self.ChooseHeadIcon().gameObject:SetActive(false)
            self:ClearSelect(2)
            return
        end
        MgrUI.GoBack()
    end
end

function M:OnShowFinish()
    Event.Go("OpenPlayerAvatar")
end

function M:InitMainPvP(type)
    for i, v in pairs(self.TeamObj) do
        if v.transform.childCount>0 then
            Tools.ClearAllChild(v.gameObject)
        end
    end
    if type == 1 then
        self:UpdataMainPvP(PlayerAvatarViewModel.BigTeamData)
        local rankData = PVPViewModel.GetPvPRank(PlayerAvatarViewModel.BigHighLadderData.rankLevel)
        MgrRes.LoadSprite(self.RankIcon(),"Level/"..rankData[3])
        MgrRes.LoadSprite(self.Text_Rank(),"Level/"..rankData[17],nil,true)
        if nil == PlayerAvatarViewModel.BigHighLadderData.championTop or 0 == PlayerAvatarViewModel.BigHighLadderData.championTop then
            self.Text_Rank().gameObject:SetActive(true);
            self.ImgMaster().gameObject:SetActive(false);
        else
            self.Text_Rank().gameObject:SetActive(false);
            self.ImgMaster().gameObject:SetActive(true);
            MgrRes.LoadSprite(self.ImgMaster(), string.format("Level/master%02d", PlayerAvatarViewModel.BigHighLadderData.championTop));
        end
    elseif type==2 then
        self:UpdataMainPvP(PlayerAvatarViewModel.SmallTeamData)
    end
end
function M:UpdataMainPvP(data)
    if not data.info or #data.info == 0 then
        return
    end
    for i, v in pairs(data.info) do
        local obj = GameObject.Instantiate(self.TeamRolePrefab().gameObject,self.TeamObj[v.index].transform,false)
        obj:SetActive(true)
        obj.transform.localPosition = Vector3.zero
        local RoleIcon = obj.transform:Find("RoleIcon"):GetComponent("Image")
        local Text_Grade = obj.transform:Find("Text_Grade"):GetComponent("TextMeshProUGUI")
        local Img_Kuang = obj.transform:Find("Img_Kuang"):GetComponent("Image")
        local zhiyeicon = obj.transform:Find("zhiyeicon"):GetComponent("Image")
        local Text_Rank = obj.transform:Find("Img_Rankdi/Text_Rank"):GetComponent("TextMeshProUGUI")
        local StarPanel = obj.transform:Find("StarPanel").gameObject
        local StaPrefab = obj.transform:Find("StaPrefab").gameObject
        local JxStarPrefab = obj.transform:Find("JxStarPrefab").gameObject
        ---@type RoleData
        local heroData = HeroControl.GetRoleDataByID(v.roleID)
        MgrRes.LoadQIcon(RoleIcon,heroData.skin)
        MgrRes.LoadSprite(Img_Kuang,heroData.iconBattleFrame)
        MgrRes.LoadSprite(zhiyeicon,heroData.iconCareer)
        Text_Grade.text = heroData.level

        --修改技能等级设置
        if heroData.heroFlag ~= nil and heroData.heroFlag ~= 0 and heroData.heroCurSkill < heroData:GetHeroShowSkillLv() then
            Text_Rank.text =heroData.heroCurSkill
        else
            Text_Rank.text =heroData:GetHeroSkillLevel() --删除加号
        end

        if heroData:CheckHeroEquipIsMax() then
            Text_Rank.color = Color(1,0.772549,0.2235294,1)
        else
            Text_Rank.color = Color(1,1,1,1)
        end
        for k = 1, heroData.star do
            local star = nil
            if heroData.awaken then
                star  = GameObject.Instantiate(JxStarPrefab,StarPanel.transform,false)
            else
                star  = GameObject.Instantiate(StaPrefab,StarPanel.transform,false)
            end
            star:SetActive(true)
        end
        StaPrefab:SetActive(false)
        JxStarPrefab:SetActive(false)
    end
end

function M:InitPVPPanel(type)
    self.RecordReview().gameObject:SetActive(true)
    if type == 1 then
        self:UpdataPVPPanel(PlayerAvatarViewModel.BigHighLadderData,type)
    elseif type == 2 then
        self:UpdataPVPPanel(PlayerAvatarViewModel.SmallHighLadderData,type)
    end
end

function M:SetHeadTitle(type)
    if type == 0 then
        self.Text_Xuanze().text = MgrLanguageData.GetLanguageByKey("ui_qita_text77")
    else
        self.Text_Xuanze().text = MgrLanguageData.GetLanguageByKey("ui_mingpian_headframetitle")
    end
end

function M:UpdataPVPPanel(data,type)
    self.Text_CurrentRankScore().text = data.score
    self.Text_HighestRankScore().text = data.maxScore
    self.Text_LastRankScore().text = data.lastScore
    self.Text_AtkVictory().text = string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_win"),data.attackWin)
    self.Text_AtkFail().text = string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_lose"),data.attackLos)
    self.Text_DefVictory().text = string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_win"),data.defendWin)
    self.Text_DefFail().text = string.format(MgrLanguageData.GetLanguageByKey("playeravatar_ui_lose"),data.defendLos)
    local winPb = 0
    local failPb = 0
    if data.attackWin+data.attackLos > 0 then
        winPb = data.attackWin/(data.attackWin+data.attackLos)
    end
    if data.defendWin+data.defendLos > 0 then
        failPb = data.defendWin/(data.defendWin+data.defendLos)
    end
    self:WinPbShow({self.Img_AtkSlider(),self.Img_DefSlider()},{winPb,failPb})
    self.Text_Aprobability().text = string.format("%.2f", (winPb*100)).."%"
    self.Text_Vprobability().text = string.format("%.2f", (failPb*100)).."%"

    local tab = {}
    if type == 1 then
        tab =  SeniorPVPLocalData.tab
        local rankData = PVPViewModel.GetPvPRank(data.rankLevel)
        MgrRes.LoadSprite(self.Img_CurrentRankIcon(),"Level/"..rankData[3])
        MgrRes.LoadSprite(self.Text_CurrentRankName(),"Level/"..rankData[17],nil,true)
    elseif type == 2 then
        tab =  LowPVPLocalData.tab
    end
    --[[for i, v in ipairs(tab) do
    --    if data.score < 1000 then
    --        MgrRes.LoadSprite(self.Img_CurrentRankIcon(),"Level/liebingicon")
    --        MgrRes.LoadSprite(self.Text_CurrentRankName(),"Level/liebing",nil,true)
    --        break
    --    end
    --    if data.score >= tonumber(v[4]) then
    --        if data.score < 2500 then
    --            MgrRes.LoadSprite(self.Img_CurrentRankIcon(),"Level/"..v[3])
    --            MgrRes.LoadSprite(self.Text_CurrentRankName(),"Level/"..v[17],nil,true)
    --            break
    --        else
    --            if data.rank >= v[5] and data.rank <= v[6] then
    --                MgrRes.LoadSprite(self.Img_CurrentRankIcon(),"Level/"..v[3])
    --                MgrRes.LoadSprite(self.Text_CurrentRankName(),"Level/"..v[17],nil,true)
    --                break
    --            end
    --        end
    --    end
    --end]]
    local maxIndex = #tab + 1 - data.maxRankLevel
    local lastIndex = #tab + 1 - data.lastRankLevel
    ---最高记录
    if data.maxRankLevel == 0 then
        self.HighestRankPanel().gameObject:SetActive(false)
        self.Text_HighestRankNameNil().gameObject:SetActive(true)
    else
        self.HighestRankPanel().gameObject:SetActive(true)
        self.Text_HighestRankNameNil().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.Img_HighestRankIcon(),"Level/"..tab[maxIndex][3],nil)
        MgrRes.LoadSprite(self.Text_HighestRankName(),"Level/"..tab[maxIndex][17],nil,true)
    end
    ---上个赛季
    JNStrTool.numberAbbr(66872)
    if data.lastRankLevel == 0 then
        self.LastRankPanel().gameObject:SetActive(false)
        self.Text_LastRankNameNil().gameObject:SetActive(true)
    else
        self.LastRankPanel().gameObject:SetActive(true)
        self.Text_LastRankNameNil().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.Img_LastRankIcon(),"Level/"..tab[lastIndex][3],nil)
        MgrRes.LoadSprite(self.Text_LastRankName(),"Level/"..tab[lastIndex][17],nil,true)
    end
end
---注册滑块
function M:RegisterScroll()
    self.PlayerRoleScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.HeadIconScroll01():SetLuaCellEvent(Handle(self,self.HeadItem))
    self.HeadKuangIconScroll01():SetLuaCellEvent(Handle(self,self.HeadKuangItem))
    self.BadgeScroll01():SetLuaCellEvent(Handle(self,self.BadgeItem))

    --self.BirthdayScroll01():SetLuaCellEvent(Handle(self,self.BirthItem))
end
---生日滑块回到
function M:BirthItem(trans,idx)
    print("-----------------滑块滑动-----------------"..self.BirthdayScroll01().curItemIndex..idx)
    trans:GetComponent("UITemplate"):SetData({self.data1[idx],self})
end
---面板娘滑块回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self,idx})
end
---头像滑块回调
function M:HeadItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurHeadList[idx],self})
end
---头像框滑块回调
function M:HeadKuangItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurHeadKuangList[idx],self})
end
---头像滑块回调
function M:BadgeItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurBadgeList[idx],self})
end
---设置面板娘滑动数据
function M:ResetRoleItem(offset)
    ---设置当前Loop数据
    self.CurLoopList =  PlayerAvatarViewModel.GetRoleData(self.CurRoleSort,self.RoleIsRise)
    ---设置Loop数量
    self.PlayerRoleScroll01().totalCount = #self.CurLoopList
    if offset then
        self.PlayerRoleScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    else
        self.PlayerRoleScroll01():RefreshCells()           ---只刷新数据
    end
end
---设置生日滑动数据
function M:ResetBirthdayItem(offset)
    ---设置当前Loop数据
    --self.CurLoopList =  PlayerAvatarViewModel.GetRoleData(self.CurRoleSort,self.RoleIsRise)
    ---设置Loop数量
    --self.BirthdayScroll01().totalCount = #self.data1--#self.CurLoopList
    -- print("滑动列表的长度："..(self.BirthdayScroll01().totalCount))
    -- --self.BirthdayScroll01().curItemIndex = #self.data1--#self.CurLoopList
    -- if offset then
    --     self.BirthdayScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    -- else
    --     --self.BirthdayScroll01():RefreshCells()           ---只刷新数据
    --     self.BirthdayScroll01():RefillCells()
    -- end
end
---设置头像滑动数据
function M:ResetHeadItem(offset)
    local list = {}
    for i, v in pairs(PlayheadLocalData.tab) do
        --display 0-不显示 1-显示
        if v.display == 1 then
            local str = string.split(v.type,'_')
            if str[1] == "0" then--普通头像
                local _Role = HeroControl.GetRoleDataByID(tonumber(str[2]))
                if _Role and _Role.lockState == true then
                    table.insert(list,v)
                end
            elseif str[1] == "1" then--皮肤头像
                local item = ItemControl.GetItemByIdAndType(tonumber(str[3]), tonumber(str[2]))
                if item and item.count > 0 then
                    table.insert(list,v)
                end
            end
        end
    end
    ---设置当前Loop数据
    --self.CurHeadList =  PlayheadLocalData.tab
    self.CurHeadList =  list
    ---设置Loop数量
    self.HeadIconScroll01().totalCount = #self.CurHeadList
    if offset then
        self.HeadIconScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    else
        self.HeadIconScroll01():RefreshCells()           ---只刷新数据
    end
end
---设置头像框滑动数据
function M:ResetHeadKuangItem(offset)
    local list = {}
    for i, v in ipairs(PlayheadframeLocalData.tab) do
        if v[5] == 0 then--不显示
        elseif v[5] == 1 then --一直显示
            table.insert(list,v)
        elseif v[5] == 2 then --拥有时显示
            local str = string.split(v[4],'_')
            if str[1] == "0" then
                local _Role = HeroControl.GetRoleDataByID(tonumber(str[2]))
                if _Role.lockState == true then
                    table.insert(list,v)
                end
            elseif str[1] == "1" then
                local item = ItemControl.GetItemByIdAndType(tonumber(str[2]), 4)
                if item and item.count > 0 then
                    table.insert(list,v)
                end
            end
        end
    end

    ---设置当前Loop数据
    self.CurHeadKuangList = list
    ---设置Loop数量
    self.HeadKuangIconScroll01().totalCount = #self.CurHeadKuangList
    if offset then
        self.HeadKuangIconScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    else
        self.HeadKuangIconScroll01():RefreshCells()           ---只刷新数据
    end
end
---设置勋章滑动数据
function M:ResetBadgeItem(offset)
    ---设置当前Loop数据
    self.CurBadgeList =  PlayerAvatarViewModel.AllBadgeCacheData
    ---设置Loop数量
    self.BadgeScroll01().totalCount = #self.CurBadgeList
    if offset then
        self.BadgeScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    else
        self.BadgeScroll01():RefreshCells()           ---只刷新数据
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
    local t_sort = self:CreateFilterToggle(sorts,self.PlayerSortToggle().gameObject,self.GearSortToggleGroup().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
        if self.CurRoleSort == sort and self.RoleIsRise == isRise then
            print("重复待处理2")
        end
        self.CurRoleSort = sort
        self.RoleIsRise = isRise
        self:ResetRoleItem(offset)
    end))
    self.PlayerSortToggle().gameObject:SetActive(false)
    ---默认排序
    t_sort[1].isOn = true
end

---初始化生日数据
function M:InitBirthday()
    self:ResetBirthdayItem(0)
end

---初始化玩家信息
function M:InitPlayerInfo()
    self.Text_Nicheng().text = self.CurPlayerData.nickname
    --生日
    if self.CurPlayerData.birthday == nil or self.CurPlayerData.birthday == "" then
        self.Text_ShengriTxt().text = ""
    else
        self.Text_ShengriTxt().text = string.sub(self.CurPlayerData.birthday,1,2)..MgrLanguageData.GetLanguageByKey("ui_userbirthday_text6").. 
        string.sub(self.CurPlayerData.birthday,3,4)..MgrLanguageData.GetLanguageByKey("dailysign_ui_day")
    end
    --生日重置到当前选中的生日
    local m = string.sub(self.CurPlayerData.birthday,1,2)
    local d = string.sub(self.CurPlayerData.birthday,3,4)
    if string.sub(self.CurPlayerData.birthday,1,1) == "0" then
        m = string.sub(self.CurPlayerData.birthday,2,2)
    end
    if string.sub(self.CurPlayerData.birthday,3,3) == "0" then
        d = string.sub(self.CurPlayerData.birthday,4,4)
    end
    if m == "" then
        m = "1"
    end
    if d == "" then
        d = "1"
    end

    --生日
    self.ChooseBirthdayPanel():GetComponent("AutoCenterParent").curSelectMoon = m
    self.ChooseBirthdayPanel():GetComponent("AutoCenterParent").curSeLectDay = d
    self.ChooseBirthdayPanel():GetComponent("AutoCenterParent"):SetInitBirthday(tonumber(m),tonumber(d))


    self.Text_LV().text = self.CurPlayerData.level
    self.Text_Exp().text = self.CurPlayerData.exp.."/"..PlayerplLocalData.tab[self.CurPlayerData.level][3]
    --是否达到最大等级
    local isLevelMax = PlayerplLocalData.tab[#PlayerplLocalData.tab][2] == PlayerControl.GetPlayerData().level
    if isLevelMax then
        self.LvSlider().fillAmount = 1
    else
        self.LvSlider().fillAmount = self.CurPlayerData.exp/PlayerplLocalData.tab[self.CurPlayerData.level][3]
    end
    self.Text_ID().text = MgrLanguageData.GetLanguageByKey("ui_mingpian_idtext1").. "："..self.CurPlayerData.UID
    if self.CurPlayerData.curRoleID == 90000 or self.CurPlayerData.curRoleID == 19000 then
        self.Text_Jueseid().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_jiya")
    else
        self.Text_Jueseid().text = HeroControl.GetRoleDataByID(self.CurPlayerData.curRoleID).name
    end

    if self.CurPlayerData.signature and self.CurPlayerData.signature~="" then
        self.Text_Sign().text = self.CurPlayerData.signature
        self.Input_ChooseSign().text = self.CurPlayerData.signature
    else
        self.Text_Sign().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text10")
        self.Input_ChooseSign().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text10")
    end

    if self.CurPlayerData.headUrl == 0 then
        self.CurPlayerData.headUrl =1
    end

    ---如果有头像数据
    if PlayheadLocalData.tab[self.CurPlayerData.headUrl] then
        local typeStr = JNStrTool.strSplit("_",PlayheadLocalData.tab[self.CurPlayerData.headUrl].type)
        local UnlockConditions = nil
        if typeStr[1] == "0" then
            if tonumber(typeStr[2]) ~= 19000 and tonumber(typeStr[2]) ~= 90000 then
                MgrRes.LoadNormalIcon(self.PlayerIcon(),tonumber(typeStr[2]))

            else
                MgrRes.LoadNormalIcon(self.PlayerIcon(),90000)
            end
        elseif typeStr[1] == "1" then
            UnlockConditions = ItemControl.GetItemByID(tonumber(typeStr[2]))
            MgrRes.LoadNormalIcon(self.PlayerIcon(),tonumber(typeStr[3]))
        end
    else
        MgrRes.LoadNormalIcon(self.PlayerIcon(),90000)
    end

    --加载玩家头像框
    if self.CurPlayerData.headFrame == 0 then
        MgrRes.LoadSprite(self.touxiangkuang():GetComponent("Image"),"Playheadicon/Img_Touxiangkuang0")
    else
        local frameName = PlayheadframeLocalData.tab[self.CurPlayerData.headFrame][3]
        MgrRes.LoadSprite(self.touxiangkuang():GetComponent("Image"),"Playheadicon/" .. frameName)
    end

    self.HeadKuangIconScroll01().gameObject:SetActive(false)
    --MgrRes.LoadSprite(self.touxiangkuang():GetComponent("Image"),"Playheadicon/touxiangkuang_"..self.CurPlayerData.headFrame)

    local hashero = #PlayerAvatarViewModel.HasHeroCacheData
    local allhero = #PlayerAvatarViewModel.AllHeroCacheData
    local tab = {}
    for key, value in pairs(PlayerAvatarViewModel.AllHeroCacheData) do
        if RoleattributeLocalData.tab[value.id][7] == 1 then
            table.insert(tab,value)
        end
    end
    local value = hashero/#tab--allhero
    self.Text_RoleCount().text = hashero
    self.Text_RoleSlider().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_database")..math.floor(value * 100).."%</color>"
    for i, v in pairs(PlayerAvatarViewModel.PlayerBadgeList) do
        local icon =  self.MainBadgeObj[i].transform:Find("Img_Icon"):GetComponent("Image")
        local vfx = self.MainBadgeObj[i].transform:Find("VFX"):GetComponent("Image")
        if v>0 then
            local badge = ItemControl.GetItemByType(4,v)
            MgrRes.LoadSprite(icon,"Item/"..badge.icon)
            --新加特效节点
            if badge.anime and badge.anime ~= "0" then
                Tools.ClearAllChild(vfx.gameObject)
                icon.gameObject:SetActive(false)
                self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
                MgrRes.GetPrefab(self.vfx_path..badge.anime..".prefab",function(Obj)
                    if Obj == nil then return end
                    Obj.transform:SetParent(vfx.gameObject.transform)
                    Obj.transform.localPosition = Vector3.zero
                    Obj.transform.localScale = Vector3(20,20,1)
                end)
            else
                Tools.ClearAllChild(vfx.gameObject)
                icon.gameObject:SetActive(true)
                MgrRes.LoadSprite(self.BadgeIcon(),"Item/"..badge.icon)
            end
        else
            Tools.ClearAllChild(vfx.gameObject)
            icon.gameObject:SetActive(true)
            MgrRes.LoadSprite(icon,"Item/Img_AddIcon")
        end
    end
    self:CreatSpine(self.lihui().gameObject, HeroControl.GetRoleDataByID(self.CurPlayerData.curRoleID).skin)
end
---初始化勋章
function M:InitBadge()
    for i, v in pairs(PlayerAvatarViewModel.PlayerBadgeList) do
        local ChooseIcon =  self.ChooseBadgeObj[i].transform:Find("Img_Icon"):GetComponent("Image")
        if v>0 then
            local badge = ItemControl.GetItemByType(4,v)
            local vfxIcon =  self.ChooseBadgeObj[i].transform:Find("VFXIcon"):GetComponent("Image")
            if badge.anime and badge.anime ~= "0" then
                Tools.ClearAllChild(vfxIcon.gameObject)
                ChooseIcon.gameObject:SetActive(false)
                self:CreateVFXBadge(vfxIcon,badge.anime,38)
            else
                Tools.ClearAllChild(vfxIcon.gameObject)
                ChooseIcon.gameObject:SetActive(true)
                MgrRes.LoadSprite(ChooseIcon,"Item/"..badge.icon)
            end
        else
            MgrRes.LoadSprite(ChooseIcon,"Item/Img_AddIcon")
        end
    end

    self.CurSelectBadge = PlayerAvatarViewModel.AllBadgeCacheData[1]
    self.CurSelectBadge.isSelect = true
    self:SwitchBadgeSlot(self.CurSelectSlot)
    ---如果有展示勋章并且第一个是勋章包里的第一个
    if PlayerAvatarViewModel.PlayerBadgeList[1]~=0 and PlayerAvatarViewModel.PlayerBadgeList[1] == PlayerAvatarViewModel.AllBadgeCacheData[1].id then
        self:UpdataBadgeInfo(true)
    else
        self:UpdataBadgeInfo(false)
    end
end

--生成带动画的勋章 index:勋章索引 id:勋章id
function M:CreateVFXBadge(vfxIcon,id,scale)
        self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
        MgrRes.GetPrefab(self.vfx_path..id..".prefab",function(Obj)
            if Obj == nil then return  end
            Obj.transform:SetParent(vfxIcon.gameObject.transform)
            Obj.transform.localPosition = Vector3.zero
            Obj.transform.localScale = Vector3(scale,scale,1)
        end)
end

---初始化按钮
function M:InitButton()
    ---返回主界面
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self, function()
        MgrUI.GoBack()
    end))
    ---修改昵称
    UIEvent.LuaClick(self.Btn_NameEdit().gameObject, Handle(self, function()
        MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
        self.isNmae = true
        self:InitChoosePop(self.isNmae)
    end))

    ---修改生日
    UIEvent.LuaClick(self.Btn_Shengri().gameObject, Handle(self, function()
        self.popName = "birthday"
        self:InitBirthdayPop()
    end))

    ---取消修改昵称
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        self.ChooseNameOrSign().gameObject:SetActive(false)
    end))
    ---取消修改昵称
    UIEvent.LuaClick(self.Btn_Cancel().gameObject, Handle(self, function()
        self.ChooseNameOrSign().gameObject:SetActive(false)
    end))
    ---取消修改亲信
    UIEvent.LuaClick(self.Btn_ChooseRoleBack().gameObject, Handle(self, function()
        self.ChoosePlayerRole().gameObject:SetActive(false)
        self:ClearSelect(1)
    end))
    ---打开修改亲信弹窗
    UIEvent.LuaClick(self.Btn_Replace().gameObject, Handle(self, function()
        MgrTimer.AddDelay("OpenChoosePlayerRole",0.4,function()
            self.ChoosePlayerRole().gameObject:SetActive(true)
        end,nil)
        --self.PlayerRoleScroll01():RefreshCells()           ---只刷新数据
        self.PlayerRoleScroll01():RefillCells()
        self:RollIcon()
    end))
    ---确认修改昵称或签名
    UIEvent.LuaClick(self.Btn_Confirm().gameObject, Handle(self, function()
        --打开生日界面
        if self.ChooseBirthdayPanel().gameObject.activeSelf then
            local moon = self.ChooseBirthdayPanel():GetComponent("AutoCenterParent").curSelectMoon
            local day = self.ChooseBirthdayPanel():GetComponent("AutoCenterParent").curSeLectDay

            if #tostring(moon) == 1 then
                moon = "0"..moon
            end
            if #tostring(day) == 1 then
                day = "0"..day
            end
            --选择生日重复
            if moon..day.."" == self.CurPlayerData.birthday then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_userbirthday_text5"),1},true)
                return
            end

            MgrUI.Pop(UID.ConfirmPop_UI,
            {string.format(MgrLanguageData.GetLanguageByKey("ui_userbirthday_text3")),
            function()
                if moon..day.."" == self.CurPlayerData.birthday then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_userbirthday_text5"),1},true)
                    return
                end
                PlayerAvatarViewModel.ChooseBirthdayClick(moon..day.."",Handle(self,self.ChooseBirthdayACK),Handle(self,self.ChooseBirthdayNTF))
            end,nil,2},true)
            return
        end

        if self.isNmae then
            local name = self.Input_ChooseNickName().text
            if name == self.CurPlayerData.nickname then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_tongyong_text243"),1},true)
                return
            end
            ---判断是否包含特殊符号
            if Tools.ContainSpecialChar(name) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text94"),1},true)
                return
            else
                local lenInByte = #name
                local count = 0

                for i=1,lenInByte do
                    local curByte = string.byte(name, i)
                    local byteCount = 0;
                    if curByte>0 and curByte<=127 then
                        byteCount = 1
                    elseif curByte>=192 and curByte<223 then
                        byteCount = 2
                    elseif curByte>=224 and curByte<239 then
                        byteCount = 3
                    elseif curByte>=240 and curByte<=247 then
                        byteCount = 4
                    end

                    if byteCount == 3 then
                        count = count + 2
                    elseif byteCount == 1 then
                        count = count + 1
                    end
                end
                ---如果大于表里限制最大字符
                if count > tonumber(SteamLocalData.tab[104010][2]) then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips11"),1},true)
                    return
                end
                ---如果小于表里限制最小字符
                if count < tonumber(SteamLocalData.tab[104009][2]) then
                    MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("loginpop_ui_tips10"),tonumber(SteamLocalData.tab[104009][2])),1},true)
                    return
                end
            end

            if name ~= "" then
                PlayerAvatarViewModel.ChooseNickNameClick(name,Handle(self,self.ChooseNickNameACK),Handle(self,self.ChooseNickNameNTF))
            end
        else
            local sign = self.Input_ChooseSign().text
            local lenInByte = #sign
            local count = 0
            if Tools.ContainSpecialChar(sign) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text94"),1},true)
                return
            else
                for i=1,lenInByte do
                    local curByte = string.byte(sign, i)
                    local byteCount = 0;
                    if curByte>0 and curByte<=127 then
                        byteCount = 1
                    elseif curByte>=192 and curByte<223 then
                        byteCount = 2
                    elseif curByte>=224 and curByte<239 then
                        byteCount = 3
                    elseif curByte>=240 and curByte<=247 then
                        byteCount = 4
                    end

                    if byteCount == 3 then
                        count = count + 2
                    elseif byteCount == 1 then
                        count = count + 1
                    end
                end
            end
            ---如果大于表里限制最大字符
            if count > tonumber(SteamLocalData.tab[104012][2]) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips13"),1},true)
                return
            end
            ---如果小于表里限制最小字符
            if count < tonumber(SteamLocalData.tab[104011][2]) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips13"),1},true)
                return
            end
            if sign ~= "" then
                PlayerAvatarViewModel.ChooseSignClick(sign,Handle(self,self.ChooseSignACK),Handle(self,self.ChooseSignNTF))
            end
        end
    end))
    ---更换亲信
    UIEvent.LuaClick(self.Btn_Genghuan().gameObject, Handle(self, function()
        if self.CurRoleItem.id == self.CurPlayerData.curRoleID then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("home_ui_tips1"),2},true)
            return
        end
        PlayerAvatarViewModel.ChooseMenuRoleClick(self.CurRoleItem.id,Handle(self,self.ChooseMenuRoleACK),Handle(self,self.ChooseMenuRoleNTF))
    end))
    ---复制UID
    UIEvent.LuaClick(self.Btn_Copy().gameObject, Handle(self, function()
        Tools.CopyToClipboard(self.CurPlayerData.UID)
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendavatar_ui_copyid"),1},true)
    end))
    ---打开头像弹窗
    UIEvent.LuaClick(self.touxiangyuan().gameObject, Handle(self, function()
        self.ChooseHeadIcon().gameObject:SetActive(true)
        self:InitHeadIconPop()
        self:ResetHeadItem(0)
        --暂时加上
        self:ResetHeadKuangItem(0)
    end))
    ---取消修改头像 Image
    -- UIEvent.LuaClick(self.Btn_HeadReturn().gameObject, Handle(self, function()
    --     self.ChooseHeadIcon().gameObject:SetActive(false)
    --     self:ClearSelect(2)
    -- end))

    UIEvent.LuaClick(self.Image().gameObject, Handle(self, function()
        self.ChooseHeadIcon().gameObject:SetActive(false)
        self:ClearSelect(2)
    end))
    ---修改头像
    UIEvent.LuaClick(self.Btn_Use().gameObject, Handle(self, function()
        PlayerAvatarViewModel.ChooseHeadClick(self.CurHeadIcon.id,Handle(self,self.ChooseHeadACK),Handle(self,self.ChooseHeadNTF))
    end))

    ---修改头像框
    UIEvent.LuaClick(self.Btn_Use01().gameObject, Handle(self, function()
        local isUnLock = self:CheckIconKuangLock(self.CurSelectHeadKuang[1])
        if isUnLock then
            PlayerAvatarViewModel.ChooseHeadFrameClick(self.CurSelectHeadKuang[1],Handle(self,self.ChooseHeadFrameACK),Handle(self,self.ChooseHeadFrameNTF))
        else
            print("头像框没有解锁")
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),2},true)
        end
    end))

    ---修改签名
    UIEvent.LuaClick(self.Btn_SignEdit().gameObject, Handle(self, function()
        MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
        self.isNmae = false
        self:InitChoosePop(self.isNmae)
    end))
    ---打开勋章弹窗
    UIEvent.LuaClick(self.MainSlot1().gameObject, Handle(self, function()
        self.ChooseBadge().gameObject:SetActive(true)
        self.CurSelectSlot = 1
        self:InitBadge()
        self:ResetBadgeItem(0)
    end))
    ---打开勋章弹窗
    UIEvent.LuaClick(self.MainSlot2().gameObject, Handle(self, function()
        self.ChooseBadge().gameObject:SetActive(true)
        self.CurSelectSlot = 2
        self:InitBadge()
        self:ResetBadgeItem(0)
    end))
    ---打开勋章弹窗
    UIEvent.LuaClick(self.MainSlot3().gameObject, Handle(self, function()
        self.ChooseBadge().gameObject:SetActive(true)
        self.CurSelectSlot = 3
        self:InitBadge()
        self:ResetBadgeItem(0)
    end))
    ---打开勋章弹窗
    UIEvent.LuaClick(self.MainSlot4().gameObject, Handle(self, function()
        self.ChooseBadge().gameObject:SetActive(true)
        self.CurSelectSlot = 4
        self:InitBadge()
        self:ResetBadgeItem(0)
    end))
    ---取消修改勋章
    UIEvent.LuaClick(self.Btn_BadgeReturn().gameObject, Handle(self, function()
        self.ChooseBadge().gameObject:SetActive(false)
        self:ClearSelect(3)
        for i, v in pairs(PlayerAvatarViewModel.PlayerBadgeList) do
            local icon =  self.MainBadgeObj[i].transform:Find("Img_Icon"):GetComponent("Image")
            if v>0 then
                local badge = ItemControl.GetItemByType(4,v)
                MgrRes.LoadSprite(icon,"Item/"..badge.icon)
            else
                MgrRes.LoadSprite(icon,"Item/Img_AddIcon")
            end
        end
    end))
    ---修改勋章
    UIEvent.LuaClick(self.Btn_BadgeUse().gameObject, Handle(self, function()
        self:BadgeChangeClick(true)
    end))
    ---修改勋章
    UIEvent.LuaClick(self.Btn_Yichu().gameObject, Handle(self, function()
        self:BadgeChangeClick(false)
    end))
    for i, v in ipairs(self.ChooseBadgeObj) do
        UIEvent.LuaClick(v.gameObject, Handle(self, function()
            self.CurSelectSlot = i
            self:SwitchBadgeSlot(self.CurSelectSlot)

            local value = PlayerAvatarViewModel.PlayerBadgeList[self.CurSelectSlot]

            --点击已装备的勋章更新勋章详细信息
             if value ~= 0 then
                local badgeData = PlayerAvatarViewModel.GetBadgeDataById(value)
                if  badgeData then
                    --self.CurSelectBadge = PlayerAvatarViewModel.GetBadgeDataById(value)
                    --local isEquip = PlayerAvatarViewModel.CheckBadgeEquip(self.CurSelectBadge.id) --TDODL
                    --self:UpdataBadgeInfo(isEquip)

                    if badgeData.anime and badgeData.anime ~= "0" then
                        Tools.ClearAllChild(self.VFXBadgeIcon().gameObject)
                        self.BadgeIcon().gameObject:SetActive(false)
                        self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
                        MgrRes.GetPrefab(self.vfx_path..badgeData.anime..".prefab",function(Obj)
                            if Obj == nil then return end
                            Obj.transform:SetParent(self.VFXBadgeIcon().gameObject.transform)
                            Obj.transform.localPosition = Vector3.zero
                            Obj.transform.localScale = Vector3(61,61,1)
                        end)
                    else
                        Tools.ClearAllChild(self.VFXBadgeIcon().gameObject)
                        self.BadgeIcon().gameObject:SetActive(true)
                        MgrRes.LoadSprite(self.BadgeIcon(),"Item/"..badgeData.icon)
                    end

                    self.Text_BadgeDes().text = badgeData.txt
                    self.Text_MainBadgeName().text = badgeData.name
                    self.Img_isEquipBadge().gameObject:SetActive(value ~= 0)
                    --更新按钮状态
                    self.Btn_Yichu().gameObject:SetActive(true)
                    self.Btn_UnBadgeUse().gameObject:SetActive(true)
                    self.Btn_BadgeUse().gameObject:SetActive(false)
                else
                    print("没有此勋章信息")
                end
             end
        end))
    end
    -----查看PvP数据
    --UIEvent.LuaClick(self.Btn_Senior().gameObject, Handle(self, function()
    --    self:InitPVPPanel(1)
    --end))
    -----查看PvP数据
    --UIEvent.LuaClick(self.Btn_Primary().gameObject, Handle(self, function()
    --    self:InitPVPPanel(2)
    --end))
    ---查看PvP数据
    UIEvent.LuaClick(self.Btn_View().gameObject, Handle(self, function()
        MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
        self:InitPVPPanel(1)
    end))
    -----查看PvP数据
    --UIEvent.LuaClick(self.Btn_View2().gameObject, Handle(self, function()
    --    self:InitPVPPanel(2)
    --end))
    -----查看阵容数据
    --UIEvent.LuaClick(self.Btn_MainHign().gameObject, Handle(self, function()
    --    self:InitMainPvP(1)
    --end))
    -----查看阵容数据
    --UIEvent.LuaClick(self.Btn_MainLow().gameObject, Handle(self, function()
    --    self:InitMainPvP(2)
    --end))
    ---取消查看PvP数据
    UIEvent.LuaClick(self.Btn_RecordReturn().gameObject, Handle(self, function()
        self.RecordReview().gameObject:SetActive(false)
    end))
    ---修改支援角色
    UIEvent.LuaClick(self.Img_Zhiyuandi().gameObject, Handle(self, function()
        if SysLockControl.CheckSysLock(2007) == false then
            return
        end
        MgrUI.GoHide(UID.ChooseSupportRole_UI)
    end))
    ---头像按钮TODO
    UIEvent.LuaClick(self.Btn_HeadIcon().gameObject,function()
        --item列表
        self.Btn_UnHeadIcon().gameObject:SetActive(true)
        self.Btn_UnFrame().gameObject:SetActive(false)
        --toggle
        self.HeadIconScroll01().gameObject:SetActive(true)
        self.HeadKuangIconScroll01().gameObject:SetActive(false)
        --详情显示
        self.HeadKuangInfo().gameObject:SetActive(false)
        self.HeadInfo().gameObject:SetActive(true)

        self:SetHeadTitle(0)
    end)
    ---头像框按钮
    UIEvent.LuaClick(self.Btn_Frame().gameObject,function()
        --item列表
        self.Btn_UnHeadIcon().gameObject:SetActive(false)
        self.Btn_UnFrame().gameObject:SetActive(true)
        --toggle
        self.HeadIconScroll01().gameObject:SetActive(false)
        self.HeadKuangIconScroll01().gameObject:SetActive(true)
        --详情显示
        self.HeadKuangInfo().gameObject:SetActive(true)
        self.HeadInfo().gameObject:SetActive(false)

        self:SetHeadTitle(1)
    end)
end
---勋章槽位切换
function M:SwitchBadgeSlot(slot)
    for i, v in ipairs(self.ChooseBadgeObj) do
        local selectObj = v.transform:Find("SelectedImg").gameObject
        local textSlot = v.transform:Find("Text_Slot"):GetComponent("TextMeshProUGUI")
        if slot == i then
            textSlot.text = "<color=#39FFDC>"..i.."</color>"
            selectObj:SetActive(true)
        else
            textSlot.text = "<color=#FFFFFF>"..i.."</color>"
            selectObj:SetActive(false)
        end
    end
end
---初始化修改弹窗
function M:InitChoosePop(isNmae)
    self.ChooseNameOrSign().gameObject:SetActive(true)
    if isNmae then
        self.ChooseSignPanel().gameObject:SetActive(false)
        self.ChooseBirthdayPanel().gameObject:SetActive(false)
        self.ChooseNickNamePanel().gameObject:SetActive(true)
        self.Input_ChooseNickName().text = self.CurPlayerData.nickname
    else
        self.ChooseSignPanel().gameObject:SetActive(true)
        self.ChooseBirthdayPanel().gameObject:SetActive(false)
        self.ChooseNickNamePanel().gameObject:SetActive(false)
    end
end
--初始化生日弹窗
function M:InitBirthdayPop()
    self.ChooseNameOrSign().gameObject:SetActive(true)
    self.ChooseSignPanel().gameObject:SetActive(false)
    self.ChooseBirthdayPanel().gameObject:SetActive(true)
    self.ChooseNickNamePanel().gameObject:SetActive(false)
end
---初始化玩家头像弹窗
function M:InitHeadIconPop()
    --self.Btn_UnHeadIcon().gameObject:SetActive(false)
    self.Btn_UnFrame().gameObject:SetActive(false)
    self.HeadKuangInfo().gameObject:SetActive(false)

    if nil ~= PlayheadLocalData.tab[PlayerAvatarViewModel.CurPlayer.headUrl] then
        self.CurHeadIcon = PlayheadLocalData.tab[PlayerAvatarViewModel.CurPlayer.headUrl];
    else
        self.CurHeadIcon = PlayheadLocalData.tab[1];
    end
    --初始化头像框
    if nil ~= PlayheadframeLocalData.tab[PlayerAvatarViewModel.CurPlayer.headFrame] then
        self.CurSelectHeadKuang = PlayheadframeLocalData.tab[PlayerAvatarViewModel.CurPlayer.headFrame];
    else
        self.CurSelectHeadKuang = PlayheadframeLocalData.tab[1];
    end
    self.CurHeadIcon.isSelect = true

    self.HeadKuangInfo().gameObject:SetActive(false)
    self.HeadInfo().gameObject:SetActive(true)
    self.HeadKuangIconScroll01().gameObject:SetActive(false)
    self.HeadIconScroll01().gameObject:SetActive(true)

    self:UpdataHeadInfo()
    self:UpdataHeadKaungInfo()
end
---更新头像信息
function M:UpdataHeadInfo(localState)
    local typeStr = JNStrTool.strSplit("_",self.CurHeadIcon.type)
    local UnlockConditions = nil
    if typeStr[1] == "0" then
        if tonumber(typeStr[2]) ~= 19000 and tonumber(typeStr[2]) ~= 90000 then
            UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
            MgrRes.LoadNormalIcon(self.HeadIcon(),UnlockConditions.id)
            MgrRes.LoadNormalIcon(self.HeadIcon01(),UnlockConditions.id)
        else
            MgrRes.LoadNormalIcon(self.HeadIcon(),90000)
            MgrRes.LoadNormalIcon(self.HeadIcon01(),90000)
        end
    elseif typeStr[1] == "1" then
        --UnlockConditions = ItemControl.GetItemByID(tonumber(typeStr[2]))
        MgrRes.LoadNormalIcon(self.HeadIcon(),tonumber(typeStr[3]))
        MgrRes.LoadNormalIcon(self.HeadIcon01(),tonumber(typeStr[3]))
    else
        return
    end
    self.Text_HeadName().text = self.CurHeadIcon.name
    self.Text_HeadDes().text = MgrLanguageData.GetLanguageByKey("playeravatar_ui_got")..self.CurHeadIcon.name..MgrLanguageData.GetLanguageByKey("playeravatar_ui_unlock")
    if self.CurHeadIcon.id == PlayerAvatarViewModel.CurPlayer.headUrl then
        self.Btn_Use().gameObject:SetActive(false)
        self.Btn_UnUse().gameObject:SetActive(true)
    else
        if localState == nil then
            self.Btn_Use().gameObject:SetActive(true)
            self.Btn_UnUse().gameObject:SetActive(false)
            return
        end
        if not localState then
            self.Btn_Use().gameObject:SetActive(false)
            self.Btn_UnUse().gameObject:SetActive(true)
        else
            self.Btn_Use().gameObject:SetActive(true)
            self.Btn_UnUse().gameObject:SetActive(false)
        end
    end
end
---更新勋章信息
function M:UpdataBadgeInfo(isEquip)
    if isEquip then
        self.Img_isEquipBadge().gameObject:SetActive(true)
    else
        self.Img_isEquipBadge().gameObject:SetActive(false)
    end
    
    --限时道具
    self.Text_BadgeLimitTime().gameObject:SetActive(false)
    local tLimitItem = ItemControl.GetLimitItemByID(4,self.CurSelectBadge.id)
    if tLimitItem then
        self.Text_BadgeLimitTime().gameObject:SetActive(true)
        --获取格式时间 剩余xx天/时/分
        self.Text_BadgeLimitTime().text = Global.GetTimeMode(tLimitItem.ETime-Global.GetCurTime(),"eventshopitem_surplus")
    end
    --动画的勋章
    if self.CurSelectBadge.anime and self.CurSelectBadge.anime ~= "0" then
        Tools.ClearAllChild(self.VFXBadgeIcon().gameObject)
        self.BadgeIcon().gameObject:SetActive(false)
        self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
        MgrRes.GetPrefab(self.vfx_path..self.CurSelectBadge.anime..".prefab",function(Obj)
            if Obj == nil then return end
            Obj.transform:SetParent(self.VFXBadgeIcon().gameObject.transform)
            Obj.transform.localPosition = Vector3.zero
            Obj.transform.localScale = Vector3(61,61,1)
        end)
    else
        Tools.ClearAllChild(self.VFXBadgeIcon().gameObject)
        self.BadgeIcon().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.BadgeIcon(),"Item/"..self.CurSelectBadge.icon)
    end

    self.Text_BadgeDes().text = self.CurSelectBadge.txt
    self.Text_MainBadgeName().text = self.CurSelectBadge.name

    local badgeId = PlayerAvatarViewModel.PlayerBadgeList[self.CurSelectSlot]
    if badgeId == 0 then
        self.Btn_Yichu().gameObject:SetActive(false)
        self.Btn_UnBadgeUse().gameObject:SetActive(false)
        self.Btn_BadgeUse().gameObject:SetActive(true)
    else
        if badgeId == self.CurSelectBadge.id then
            self.Btn_Yichu().gameObject:SetActive(true)
            self.Btn_UnBadgeUse().gameObject:SetActive(true)
            self.Btn_BadgeUse().gameObject:SetActive(false)
        else
            self.Btn_Yichu().gameObject:SetActive(true)
            self.Btn_UnBadgeUse().gameObject:SetActive(false)
            self.Btn_BadgeUse().gameObject:SetActive(true)
        end
    end
end
---修改勋章
function M:BadgeChangeClick(isAdd)
    if self.CurPlayerData.title == "" then
        self.CurPlayerData.title = "0,0,0,0"
    end
    local BadgeStr = JNStrTool.strSplit(",",self.CurPlayerData.title)
    if isAdd then
        BadgeStr[self.CurSelectSlot] = self.CurSelectBadge.id
    else
        BadgeStr[self.CurSelectSlot] = 0
    end
    local str = BadgeStr[1]..","..BadgeStr[2]..","..BadgeStr[3]..","..BadgeStr[4]
    PlayerAvatarViewModel.ChooseBadgeClick(str,Handle(self,self.ChooseBadgeACK),Handle(self,self.ChooseBadgeNTF))
end
---创建Spine
function M:CreatSpine(_Root,_RoleId)
    Tools.ClearAllChild(self.lihui().gameObject)
    ---人物
    local _PosInfoTab=CharactercoordinatesLocalData.tab[_RoleId].coordinate11
    local _tempPosTab1 =JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatch3DSpineInUI(_Root, _RoleId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        self.CurSpineObj = obj
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder+1,"Default")
        end
    end)
    local skinData = HeroControl.GetSkinDataBySkinId(_RoleId)
    ---背景更换
    Tools.ClearAllChild(self.Img_BG().gameObject)
    if skinData.backgroundpic ~= "0" then
        self.Img_BG().color = Color(1,1,1,0)
    else
        self.Img_BG().color = Color(1,1,1,1)
    end
    if string.find(skinData.backgroundpic,'Watch_3D_bg') then
        local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate8,";")
        local x = tonumber(string.split(coordinate[1],",")[1])
        local y = tonumber(string.split(coordinate[1],",")[2])
        local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
        MgrRes.LoadCgSpine(self.Img_BG(), skinData.id,skinData.backgroundpic,x,y,scale,nil,function(BG)
            BG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder,"Default")
        end,true)
    else
        local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate8,";")
        local x = tonumber(string.split(coordinate[1],",")[1])
        local y = tonumber(string.split(coordinate[1],",")[2])
        local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
        MgrRes.LoadCgSpine(self.Img_BG(), skinData.id,skinData.backgroundpic,x,y,scale,nil,function(BG)
            BG.transform:GetComponent("SkeletonGraphic"):SetOrderLayer(self.CavOrder,"Default")
        end,false)
    end
    ---前景更换
    Tools.ClearAllChild(self.FrontBG().gameObject)
    local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate9,";")
    local x = tonumber(string.split(coordinate[1],",")[1])
    local y = tonumber(string.split(coordinate[1],",")[2])
    local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
    MgrRes.LoadSkinFrontBG(skinData.type,self.FrontBG(),skinData.foregroundpic,self.FrontBG().gameObject,x,y,scale,nil,function(frontBG)
        frontBG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder+2,"Default")
    end)
end
---选择头像点击事件
function M:HeadItemOnClick(head,lockState)
    self:ClearSelect(2)
    head.isSelect = true
    self.CurHeadIcon = head
    self.HeadIconScroll01():RefreshCells()           ---只刷新数据
    self:UpdataHeadInfo(lockState)


end

function M:GetSelelctHeadKuang()
    return self.CurSelectHeadKuang
end

---选择头像框点击事件
function M:HeadKuangItemOnClick(head)
    self.CurSelectHeadKuang = head
    -- self:ClearSelect(2)
    -- head.isSelect = true
    -- self.CurHeadIcon = head
    self.HeadKuangIconScroll01():RefreshCells()           ---只刷新数据
    self:UpdataHeadKaungInfo()
end



--框界面的角色头像
function M:UpdataHeadKaungInfo()
    -- local typeStr = JNStrTool.strSplit("_",self.CurHeadIcon.type)
    -- local UnlockConditions = nil
    -- if typeStr[1] == "0" then
    --     if tonumber(typeStr[2]) ~= 19000 and tonumber(typeStr[2]) ~= 90000 then
    --         UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
    --         MgrRes.LoadNormalIcon(self.HeadIcon01(),UnlockConditions.id)
    --     else
    --         MgrRes.LoadNormalIcon(self.HeadIcon01(),90000)
    --     end
    -- elseif typeStr[1] == "1" then
    --     UnlockConditions = ItemControl.GetItemByID(tonumber(typeStr[2]))
    -- else
    --     --return
    -- end
    --限时道具
    self.Text_HeadLimitTime().gameObject:SetActive(false)
    local tStr = string.split(self.CurSelectHeadKuang[4],'_')
    if tStr[1] == "1" then
        local tLimitItem = ItemControl.GetLimitItemByID(4,tonumber(tStr[2]))
        if tLimitItem then
            self.Text_HeadLimitTime().gameObject:SetActive(true)
            --获取格式时间 剩余xx天/时/分
            self.Text_HeadLimitTime().text = Global.GetTimeMode(tLimitItem.ETime-Global.GetCurTime(),"eventshopitem_surplus")
        end
    end
    
    self.Text_HeadName01().text = self.CurSelectHeadKuang[2] --self.CurHeadIcon.name
    self.Text_HeadDes01().text = MgrLanguageData.GetLanguageByKey("playeravatar_ui_got")..self:GetHeadKuangDes(self.CurSelectHeadKuang[1]) ..MgrLanguageData.GetLanguageByKey("playeravatar_ui_unlock")
    local ss = self.CurSelectHeadKuang
    --加载玩家头像框
    MgrRes.LoadSprite(self.HeadFrame01():GetComponent("Image"),"Playheadicon/" .. self.CurSelectHeadKuang[3])
    MgrRes.LoadSprite(self.HeadFrame():GetComponent("Image"),"Playheadicon/" .. self.CurSelectHeadKuang[3])
    print("头像框是否解锁：",self:CheckIconKuangLock(self.CurSelectHeadKuang[1]))
    self.Btn_Use01().gameObject:SetActive(self:CheckIconKuangLock(self.CurSelectHeadKuang[1]))
    if PlayerAvatarViewModel.CurPlayer.headFrame == self.CurSelectHeadKuang[1] then
        self.Btn_Use01().gameObject:SetActive(false)
    end
end
--根据头像框ID获得解锁条件内容TODO
function M:GetHeadKuangDes(id)
    if PlayheadframeLocalData.tab[id] then
        local type = PlayheadframeLocalData.tab[id][4]
        local typeStr = JNStrTool.strSplit("_",type)
        if typeStr[1] == "0" then
            if HeroControl.GetRoleDataByID(tonumber(typeStr[2])) then
                return HeroControl.GetRoleDataByID(tonumber(typeStr[2])).name
            end
        elseif typeStr[1] == "1" then
            return ItemControl.GetItemByIdAndType(tonumber(typeStr[2]),4).name
        end
    else
        print("该头像框不存在")
    end
end

--根据类型和id获得道具信息
function M:GetItemData(type,id)
    local data = {}
    if type == 1 then
        data = ItemControl.GetItemByID(ItemLocalData.tab[id].id)
    elseif type == 2 then
        data = ItemControl.GetItemByID(CorechipLocalData.tab[id].id)
    elseif type == 3 then
        data = ItemControl.GetItemByID(CoreLocalData.tab[id].id)
    else
        data = ItemControl.GetItemByID(HideLocalData.tab[id].id)
    end

    return data
end

function M:CheckIconKuangLock(id)
    local isLock = false
    if PlayheadframeLocalData.tab[id] then
        local type = PlayheadframeLocalData.tab[id][4]
        local typeStr = JNStrTool.strSplit("_",type)
        if typeStr[1] == "0" then
            if HeroControl.GetRoleDataByID(tonumber(typeStr[2])) then
                isLock = true
            end
        elseif typeStr[1] == "1" then
            if ItemControl.GetItemByIdAndType(tonumber(typeStr[2]),4).count > 0 then
                --限时道具
                local tLimitItem = ItemControl.GetLimitItemByID(4,tonumber(typeStr[2]))
                if tLimitItem == nil or tLimitItem.ETime >= Global.GetCurTime() then
                    isLock = true
                end
            end
        end
    end
    return isLock
end

---选择勋章点击事件
---@param badge HideLocalData
function M:BadgeItemOnClick(badge,isEquip)
    self:ClearSelect(3)
    badge.isSelect = true
    self.CurSelectBadge = badge
    self.BadgeScroll01():RefreshCells()           ---只刷新数据
    self:UpdataBadgeInfo(isEquip)
end
---选择亲信点击事件
---@param hero RoleData
function M:RoleItemOnClick(hero)
    self:ClearSelect(1)
    hero.isSelect = true
    self.CurRoleItem = hero
    if self.CurRoleItem then
        self.Btn_UnGenghuan().gameObject:SetActive(false)
        self.Btn_Genghuan().gameObject:SetActive(true)
    else
        self.Btn_UnGenghuan().gameObject:SetActive(true)
        self.Btn_Genghuan().gameObject:SetActive(false)
    end
    self.PlayerRoleScroll01():RefreshCells()           ---只刷新数据
end
---清除选择
function M:ClearSelect(type)
    if type == 1 then
        if self.CurRoleItem then
            self.CurRoleItem.isSelect = false
            self.CurRoleItem.isSelect = nil
        end
    elseif type ==2 then
        if self.CurHeadIcon then
            self.CurHeadIcon.isSelect = false
            self.CurHeadIcon.isSelect = nil
            MgrFx.CancelSelectFrameFlash(nil,self.CurHeadIcon.id .. 2)
        end
    elseif type ==3 then
        if self.CurSelectBadge then
            self.CurSelectBadge.isSelect = false
            self.CurSelectBadge.isSelect = nil
        end
    end
end
---修改昵称返回
function M:ChooseNickNameACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseNikeACK',buffer))
    if tag~=0 then
        return
    end
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("novicerename_ui_changename_fail"),2},true)
    end
end
function M:ChooseNickNameNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseNikeNTF',buffer))
    if tag~=0 then
        return
    end
    self.CurPlayerData.nickname = tab.nike
    self.Text_Nicheng().text = self.CurPlayerData.nickname
    self.ChooseNameOrSign().gameObject:SetActive(false)
    local player = PlayerControl.GetPlayerData()
    MgrSdk.UpdateRole(tostring(player.UID),player.nickname,"101","server")
end
---修改签名返回
function M:ChooseSignACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetSignatureACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatar_ui_tips3"),2},true)
    end
end
function M:ChooseSignNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetSignatureNTF',buffer))
    self.CurPlayerData.signature = tab.signature
    self.Text_Sign().text = self.CurPlayerData.signature
    self.ChooseNameOrSign().gameObject:SetActive(false)
end

--修改生日返回
function M:ChooseBirthdayACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetSignatureACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_userbirthday_text7"),2},true)
    end
end
function M:ChooseBirthdayNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetSignatureNTF',buffer))
    local b = tab.signature
    self.Text_ShengriTxt().text = string.sub(b,1,2)..MgrLanguageData.GetLanguageByKey("ui_userbirthday_text6")..string.sub(b,3,4)..MgrLanguageData.GetLanguageByKey("dailysign_ui_day")
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_userbirthday_text4"),2},true)
    self.ChooseNameOrSign().gameObject:SetActive(false)
end

---修改面板娘返回
function M:ChooseMenuRoleACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseMenuRoleACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("home_ui_tips4"),2},true)
    end
end
function M:ChooseMenuRoleNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseMenuRoleNTF',buffer))
    if self.CurSpineObj then
        GameObject.Destroy(self.CurSpineObj)
    end
    self:CreatSpine(self.lihui().gameObject, HeroControl.GetRoleDataByID(tab.roleID).skin)
    self.CurPlayerData.curRoleID = tab.roleID
    self.ChoosePlayerRole().gameObject:SetActive(false)
    self:ClearSelect(1)
    if self.CurPlayerData.curRoleID==19000 or self.CurPlayerData.curRoleID == 90000 then
        self.Text_Jueseid().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_jiya")
    else
        self.Text_Jueseid().text = HeroControl.GetRoleDataByID(self.CurPlayerData.curRoleID).name
    end
    --更换注解main对应BGM
    --MgrSound.PlayBGM(RoleuiskinLocalData.tab[PlayerControl.GetPlayerData().curRoleID].bgm, 0.2)
end

-----修改头像框返回
function M:ChooseHeadFrameACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetHeadFrameACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatar_ui_tips1"),2},true)
    end
end

function M:ChooseHeadFrameNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetHeadFrameNTF',buffer))
    self.CurPlayerData.headFrame = tab.headFrameID
    PlayerAvatarViewModel.CurPlayer.headFrame = tab.headFrameID
        --加载玩家头像框
    local frameName = PlayheadframeLocalData.tab[self.CurPlayerData.headFrame][3]
    MgrRes.LoadSprite(self.touxiangkuang():GetComponent("Image"),"Playheadicon/" .. frameName)
    self.Btn_Use01().gameObject:SetActive(false)
    self.HeadKuangIconScroll01():RefreshCells()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text154"),2},true)
    -- local typeStr = JNStrTool.strSplit("_",PlayheadLocalData.tab[self.CurPlayerData.headUrl].type)
    -- local UnlockConditions = nil
    -- if typeStr[1] == "0" then
    --     UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
    --     --MgrRes.LoadSprite(self.PlayerIcon(),UnlockConditions.icon)
    --     MgrRes.LoadNormalIcon(self.PlayerIcon(),UnlockConditions.id)
    -- elseif typeStr[1] == "1" then
    --     UnlockConditions = ItemControl.GetItemByID(tonumber(typeStr[2]))
    -- end
    -- self.ChooseHeadIcon().gameObject:SetActive(false)
    -- self:ClearSelect(2)
end

---修改头像返回
function M:ChooseHeadACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetHeadACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatar_ui_tips1"),2},true)
    end
end
function M:ChooseHeadNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetHeadNTF',buffer))
    self.CurPlayerData.headUrl = tab.headID
    local typeStr = JNStrTool.strSplit("_",PlayheadLocalData.tab[self.CurPlayerData.headUrl].type)
    local UnlockConditions = nil
    if typeStr[1] == "0" then
        UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
        --MgrRes.LoadSprite(self.PlayerIcon(),UnlockConditions.icon)
        MgrRes.LoadNormalIcon(self.PlayerIcon(),UnlockConditions.id)
    elseif typeStr[1] == "1" then
        UnlockConditions = ItemControl.GetItemByID(tonumber(typeStr[2]))
        MgrRes.LoadNormalIcon(self.PlayerIcon(),tonumber(typeStr[3]))
    end
    self.ChooseHeadIcon().gameObject:SetActive(false)
    self:ClearSelect(2)
end
---修改勋章返回
function M:ChooseBadgeACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetTitleACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatar_ui_tips2"),2},true)
    end
end
function M:ChooseBadgeNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetTitleNTF',buffer))
    self.CurPlayerData.title = tab.titleID
    PlayerAvatarViewModel.PlayerBadgeList = PlayerAvatarViewModel.GetBadgeList()
    for i, v in pairs(PlayerAvatarViewModel.PlayerBadgeList) do
        local ChooseIcon =  self.ChooseBadgeObj[i].transform:Find("Img_Icon"):GetComponent("Image")
        local vfxIcon =  self.ChooseBadgeObj[i].transform:Find("VFXIcon"):GetComponent("Image")

        local MainIcon =  self.MainBadgeObj[i].transform:Find("Img_Icon"):GetComponent("Image")
        local vfxMainIcon =  self.MainBadgeObj[i].transform:Find("VFX"):GetComponent("Image")
        if v~=0 then
            local badge = ItemControl.GetItemByType(4,v)
            --动画徽章
            if badge.anime and badge.anime ~= "0" then
                Tools.ClearAllChild(vfxIcon.gameObject)
                ChooseIcon.gameObject:SetActive(false)
                self:CreateVFXBadge(vfxIcon,badge.anime,38)

                Tools.ClearAllChild(vfxMainIcon.gameObject)
                MainIcon.gameObject:SetActive(false)
                self:CreateVFXBadge(vfxMainIcon,badge.anime,20)
            else
                Tools.ClearAllChild(vfxIcon.gameObject)
                ChooseIcon.gameObject:SetActive(true)
                MgrRes.LoadSprite(ChooseIcon,"Item/"..badge.icon)

                Tools.ClearAllChild(vfxMainIcon.gameObject)
                MainIcon.gameObject:SetActive(true)
                MgrRes.LoadSprite(vfxMainIcon,"Item/"..badge.icon)
            end
        else
            Tools.ClearAllChild(vfxIcon.gameObject)
            ChooseIcon.gameObject:SetActive(true)
            MgrRes.LoadSprite(ChooseIcon,"Item/Img_AddIcon")

            Tools.ClearAllChild(vfxMainIcon.gameObject)
            MainIcon.gameObject:SetActive(true)
            MgrRes.LoadSprite(MainIcon,"Item/Img_AddIcon")
        end
    end
    local isEquip = PlayerAvatarViewModel.CheckBadgeEquip(self.CurSelectBadge.id)
    self:UpdataBadgeInfo(isEquip)
    self:ResetBadgeItem(0)
end
---创建标签
function M:CreateFilterToggle(filters,prefab,parentTrans,callback)
    local toggles = {}
    for idx, name in ipairs(filters) do
        local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
        togTrans:GetComponent("UITemplate"):SetData({name,function(...)
            callback(idx,...)
        end})
        toggles[idx] = togTrans:GetComponent("Toggle")
    end
    return toggles
end
function M:OnBackShow()
    self:InitSupport()
end
---初始化玩家支援阵容
function M:InitSupport()
    self:UpdataSupportPanel(PlayerAvatarViewModel.PlayerSupportData)
    self.supportLock().gameObject:SetActive(SysLockControl.CheckSysLock(2007) == false)
end
---刷新支援角色
function M:UpdataSupportPanel(data)
    ---如果支援角色数据为空，不显示perfab
    if(#data == 0) then
        for k,v in pairs(self.SupportObj) do
            v:SetActive(false)
        end
    end
    for i, v in pairs(data) do
            local obj = self.SupportObj[v.slot]
        if(v.roleID ~= 0) then
            obj:SetActive(true)
            obj.transform.localPosition = Vector3.zero
            local RoleIcon = obj.transform:Find("RoleIcon"):GetComponent("Image")
            local Text_Grade = obj.transform:Find("Text_Grade"):GetComponent("TextMeshProUGUI")
            local Img_Kuang = obj.transform:Find("Img_Kuang"):GetComponent("Image")
            local zhiyeicon = obj.transform:Find("zhiyeicon"):GetComponent("Image")
            local Text_Rank = obj.transform:Find("Img_Rankdi/Text_Rank"):GetComponent("TextMeshProUGUI")
            local StarPanel = obj.transform:Find("StarPanel").gameObject
            local JxStarPanel = obj.transform:Find("JxStarPanel").gameObject
            ---@type RoleData
            local heroData = HeroControl.GetRoleDataByID(v.roleID)
            MgrRes.LoadQIcon(RoleIcon,heroData.skin)
            MgrRes.LoadSprite(Img_Kuang,heroData.iconBattleFrame)
            MgrRes.LoadSprite(zhiyeicon,heroData.iconCareer)
            Text_Grade.text = heroData.level

            --修改技能等级设置
            if heroData.heroFlag ~= nil and heroData.heroFlag ~= 0 and heroData.heroCurSkill ~= nil and heroData.heroCurSkill < heroData:GetHeroShowSkillLv() then
                Text_Rank.text =heroData.heroCurSkill
            else
                Text_Rank.text =heroData:GetHeroSkillLevel() --删除加号
            end

            if heroData:CheckHeroEquipIsMax() then
                Text_Rank.color = Color(1,0.772549,0.2235294,1)
            else
                Text_Rank.color = Color(1,1,1,1)
            end
            for i = 0,5 do
                JxStarPanel.transform:GetChild(i).gameObject:SetActive(false)
                StarPanel.transform:GetChild(i).gameObject:SetActive(false)
            end
            for i = 0, heroData.star - 1 do
                if heroData.awaken then
                    JxStarPanel.transform:GetChild(i).gameObject:SetActive(true)
                else
                    StarPanel.transform:GetChild(i).gameObject:SetActive(true)
                end
            end
        else
            obj:SetActive(false)
        end
    end
end
---胜率动态显示
function M:WinPbShow(slider,Pb)
    for i = 1, #slider do
        slider[i].fillAmount = 0
    end
    MgrTimer.AddRepeat("Pb",0.015,function()
        for i = 1, #slider do
            if slider[i].fillAmount < Pb[i] then
                slider[i].fillAmount = slider[i].fillAmount + 0.02
            end
            if Pb[i] < slider[i].fillAmount then
                slider[i].fillAmount = Pb[i]
            end
        end

    end,70,nil )
end

function M:RollIcon()
    MgrTimer.AddRepeat("RollIcon",0.02,function()
        self.Btn_Replace().transform:Rotate(0,0,-18)
    end,10,nil)
end
--获取当月的天数
function M:GetDaysByMonth(arg)
    if arg == 2 then return 29 end
    local year,month = os.date("%Y", os.time() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600), os.date("%m", os.time() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)+1 -- 正常是获取服务器给的时间来算
    return os.date("%d", os.time({year=year, month=arg + 1, day=0}) + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600) -- 获取当月天数
end


function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("Pb")
    MgrTimer.Cancel("RollIcon")
    MgrTimer.Cancel("OpenChoosePlayerRole")
    if self.CurLoopList ~= nil then
        for i = 1, #self.CurLoopList,1 do
            MgrTimer.Cancel(self.CurLoopList[i].id)
        end
        MgrTimer.Cancel("pImgLarge")
        MgrTimer.Cancel("pImgShrink")
    end
end

return M