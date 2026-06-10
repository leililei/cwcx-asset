-- Code Auto Create Begin
local M = Class('ChooseSupportRole_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ChooseSupportRole_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ChooseSupportRole_UI].prefab'
    self.Name = 'Form[ChooseSupportRole_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'ChoosePlayerRole','ChoosePlayerRole',2},{'Img_Tanchudi','ChoosePlayerRole/Img_Tanchudi',2},{'Img_Tanchuxian','ChoosePlayerRole/Img_Tanchuxian',2},{'Img_Xian1','ChoosePlayerRole/Img_Xian1',2},{'Img_Xian2','ChoosePlayerRole/Img_Xian2',2},{'Btn_Back','ChoosePlayerRole/Btn_Back',2},{'Btn_Genghuan','ChoosePlayerRole/Btn_Genghuan',2},{'Img_Genghuan','ChoosePlayerRole/Btn_Genghuan/Img_Genghuan',2},{'Btn_Relieve','ChoosePlayerRole/Btn_Relieve',2},{'Img_Relieve','ChoosePlayerRole/Btn_Relieve/Img_Relieve',2},{'Img_FriendCoin','ChoosePlayerRole/FriendCoin/Img_FriendCoin',2},{'CoinIcon','ChoosePlayerRole/FriendCoin/CoinIcon',2},{'Btn_AddShieldCoin','ChoosePlayerRole/FriendCoin/Btn_AddShieldCoin',2},{'Img_AddShieldCoin','ChoosePlayerRole/FriendCoin/Btn_AddShieldCoin/Img_AddShieldCoin',2},{'Normal','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Normal',2},{'Highlight','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Highlight',2},{'FriendCoinPanel','ChoosePlayerRole/SupportRolePanel/Tog_Role1/FriendCoinPanel',2},{'Btn_Recevie','ChoosePlayerRole/SupportRolePanel/Tog_Role1/FriendCoinPanel/Btn_Recevie',2},{'Img_Recevie','ChoosePlayerRole/SupportRolePanel/Tog_Role1/FriendCoinPanel/Btn_Recevie/Img_Recevie',2},{'Img_NoData','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData',2},{'Img_RoleIndex','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/Img_RoleIndex',2},{'TeamRolePrefab','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab',2},{'Img_Touxiangdi','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/RoleIcon',2},{'Img_Kuang','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/Img_Kuang',2},{'Text_Lv','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/Text_Lv',2},{'zhiyeicon','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/JxStarPanel',2},{'JxStarPrefab','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/StarPanel',2},{'StaPrefab','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_IsSelect','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_IsSelect',2},{'Normal01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Normal',2},{'Highlight01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight',2},{'Img_HNoData','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData',2},{'Img_RoleIndex01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/Img_RoleIndex',2},{'TeamRolePrefab01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab',2},{'Img_Touxiangdi01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/RoleIcon',2},{'Img_Kuang01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/Img_Kuang',2},{'Text_Lv01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/Text_Lv',2},{'zhiyeicon01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'StarPanel01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/StarPanel',2},{'StaPrefab01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'FriendCoinPanel01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/FriendCoinPanel',2},{'Btn_Recevie01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/FriendCoinPanel/Btn_Recevie',2},{'Img_Recevie01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/FriendCoinPanel/Btn_Recevie/Img_Recevie',2},{'Img_NoData01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData',2},{'Img_RoleIndex02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/Img_RoleIndex',2},{'TeamRolePrefab02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab',2},{'Img_Touxiangdi02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/RoleIcon',2},{'Img_Kuang02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/Img_Kuang',2},{'Text_Lv02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/Text_Lv',2},{'zhiyeicon02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/JxStarPanel',2},{'JxStarPrefab01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/StarPanel',2},{'StaPrefab02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_IsSelect01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_IsSelect',2},{'Normal02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Normal',2},{'Highlight02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight',2},{'Img_HNoData01','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData',2},{'Img_RoleIndex03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/Img_RoleIndex',2},{'TeamRolePrefab03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab',2},{'Img_Touxiangdi03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/RoleIcon',2},{'Img_Kuang03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/Img_Kuang',2},{'Text_Lv03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/Text_Lv',2},{'zhiyeicon03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'StarPanel03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/StarPanel',2},{'StaPrefab03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'FriendCoinPanel02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/FriendCoinPanel',2},{'Btn_Recevie02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/FriendCoinPanel/Btn_Recevie',2},{'Img_Recevie02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/FriendCoinPanel/Btn_Recevie/Img_Recevie',2},{'Img_NoData02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData',2},{'Img_RoleIndex04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/Img_RoleIndex',2},{'TeamRolePrefab04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab',2},{'Img_Touxiangdi04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/RoleIcon',2},{'Img_Kuang04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/Img_Kuang',2},{'Text_Lv04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/Text_Lv',2},{'zhiyeicon04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/JxStarPanel',2},{'JxStarPrefab02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/StarPanel',2},{'StaPrefab04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_IsSelect02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_IsSelect',2},{'RightTop','RightTop',2},{'CardSortPanel','RightTop/CardSortPanel',2},{'Tg_CardSort','RightTop/CardSortPanel/Tg_CardSort',2},{'Normal03','RightTop/CardSortPanel/Tg_CardSort/Normal',2},{'Icon_Rise','RightTop/CardSortPanel/Tg_CardSort/Normal/Icon_Rise',2},{'Btn_HighLight','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight',2},{'Icon_RiseDown','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseDown',2},{'Icon_RiseUp','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseUp',2},{'Frame','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Frame',2},{'Btn_Filter','RightTop/Btn_Filter',2},{'Btn_Next','Btn_Next',2},{'HighLight','Btn_Next/HighLight',2},{'Btn_Last','Btn_Last',2},{'HighLight01','Btn_Last/HighLight',2},
        -- UITemplate 列表
        {'SupportRoleItem','ChoosePlayerRole/RoleCardMask/ScrollMask/RoleCardScroll/SupportRoleItem',10},
        -- Toggle 列表
        {'Tog_Role1','ChoosePlayerRole/SupportRolePanel/Tog_Role1',13},{'Tog_Role2','ChoosePlayerRole/SupportRolePanel/Tog_Role2',13},{'Tog_Role3','ChoosePlayerRole/SupportRolePanel/Tog_Role3',13},{'Tg_CardSort01','RightTop/CardSortPanel/Tg_CardSort',13},
        -- RawImage 列表
        {'RoleCardScroll','ChoosePlayerRole/RoleCardMask/ScrollMask/RoleCardScroll',15},{'RoleCardContent','ChoosePlayerRole/RoleCardMask/ScrollMask/RoleCardScroll/RoleCardContent',15},{'SupportRoleItem01','ChoosePlayerRole/RoleCardMask/ScrollMask/RoleCardScroll/SupportRoleItem',15},
        -- LoopScrollRect 列表
        {'RoleCardScroll01','ChoosePlayerRole/RoleCardMask/ScrollMask/RoleCardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title','ChoosePlayerRole/Img_Xian1/Text_Title',20},{'Text_Genghuan','ChoosePlayerRole/Btn_Genghuan/Text_Genghuan',20},{'Text_Relieve','ChoosePlayerRole/Btn_Relieve/Text_Relieve',20},{'Text_CoinCount','ChoosePlayerRole/FriendCoin/Text_CoinCount',20},{'Text_GetFriendCoin','ChoosePlayerRole/SupportRolePanel/Tog_Role1/FriendCoinPanel/Text_GetFriendCoin',20},{'Text_FriendCoinCount','ChoosePlayerRole/SupportRolePanel/Tog_Role1/FriendCoinPanel/Text_FriendCoinCount',20},{'Text','ChoosePlayerRole/SupportRolePanel/Tog_Role1/FriendCoinPanel/Btn_Recevie/Text',20},{'Text01','ChoosePlayerRole/SupportRolePanel/Tog_Role1/NoRoleDataPanel/Text',20},{'Text_Index','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/Img_RoleIndex/Text_Index',20},{'Text_Grade','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/Text_Grade',20},{'Text_Rank','ChoosePlayerRole/SupportRolePanel/Tog_Role1/Img_NoData/TeamRolePrefab/Text_Rank',20},{'Text_Index01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/Img_RoleIndex/Text_Index',20},{'Text_Grade01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/Text_Grade',20},{'Text_Rank01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Highlight/Img_HNoData/TeamRolePrefab/Text_Rank',20},{'Text_GetFriendCoin01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/FriendCoinPanel/Text_GetFriendCoin',20},{'Text_FriendCoinCount01','ChoosePlayerRole/SupportRolePanel/Tog_Role2/FriendCoinPanel/Text_FriendCoinCount',20},{'Text02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/FriendCoinPanel/Btn_Recevie/Text',20},{'Text03','ChoosePlayerRole/SupportRolePanel/Tog_Role2/NoRoleDataPanel/Text',20},{'Text_Index02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/Img_RoleIndex/Text_Index',20},{'Text_Grade02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/Text_Grade',20},{'Text_Rank02','ChoosePlayerRole/SupportRolePanel/Tog_Role2/Img_NoData/TeamRolePrefab/Text_Rank',20},{'Text_Index03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/Img_RoleIndex/Text_Index',20},{'Text_Grade03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/Text_Grade',20},{'Text_Rank03','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Highlight/Img_HNoData/TeamRolePrefab/Text_Rank',20},{'Text_GetFriendCoin02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/FriendCoinPanel/Text_GetFriendCoin',20},{'Text_FriendCoinCount02','ChoosePlayerRole/SupportRolePanel/Tog_Role3/FriendCoinPanel/Text_FriendCoinCount',20},{'Text04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/FriendCoinPanel/Btn_Recevie/Text',20},{'Text05','ChoosePlayerRole/SupportRolePanel/Tog_Role3/NoRoleDataPanel/Text',20},{'Text_Index04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/Img_RoleIndex/Text_Index',20},{'Text_Grade04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/Text_Grade',20},{'Text_Rank04','ChoosePlayerRole/SupportRolePanel/Tog_Role3/Img_NoData/TeamRolePrefab/Text_Rank',20},{'Text_CN','RightTop/CardSortPanel/Tg_CardSort/Normal/Text_CN',20},{'Text_CN01','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Text_CN',20},
    }
end
-- Code Auto Create End
require("LocalData/SteamLocalData")

function M:OnInit()
    --Event.Go("HideBagTabPage") --避免背包特效穿透
    self.CurCardSort = 1        ---当前排序类型(1等级，2星级，3取得时间, 4稀有度，5好感度)
    self.CurCardFilter = {      ---当前筛选类型true为开启项(0全部，1护卫，2强击，3轰炸，4支援 与配置表一致)
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false
    }
    self.CurRoleID = nil
    self.CurSolt = nil
    self.CurRole1ID = nil
    self.CurRole2ID = nil
    self.CurRole3ID = nil
    self.CurCardRise = true    ---当前升降序(true升序，false降序)
    self.CurSupportRoleID = nil
    self:RegisterScroll()       ---注册loopScroll
    self:InitLastNextBtn()      ---初始化滑动按钮
    self:InitCardSort()         ---初始化排序标签
    self:InitFilterBtn()        ---初始化筛选器按钮
    self:InitBtnBack()          ---初始化返回按钮
    self:InitSupport()          ---初始化支援角色
    self:RefreshCoin()
    self:ResetCardItem(0)
    self:InitTimer()
end

---刷新界面
function M:OnShow()
    ---设置默认排序
    self.Tg_ViewSortArr[self.CurCardSort].isOn= false
    self.Tg_ViewSortArr[self.CurCardSort].isOn= true
    ---设置默认筛选
    self.CurCardFilter = {
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [11] = false
    }
end

function M:OnShowFinish()
    NoviceViewModel.CheckCurID(21626,function()
        NoviceViewModel.DoNext()
    end)
end

function M:OnBackShow()
    NoviceViewModel.CheckCurID(21626,function()
        NoviceViewModel.DoNext()
    end)
    self:ResetCardItem()
end

---初始化支援角色
function M:InitSupport()
    self.NHRole1 = {
        self.Tog_Role1().transform:Find("Normal").gameObject,
        self.Tog_Role1().transform:Find("Highlight").gameObject,
    }
    self.NHRole1[1]:SetActive(false)
    self.Tog_Role1().isOn = true
    Tools.ToggleValueChange(self.Tog_Role1(),function(isOn)
        self.NHRole1[1]:SetActive(not isOn)
        self.NHRole1[2]:SetActive(isOn)
        if(isOn) then
            self.CurSolt = 1
            self:CheckCurSupport()
            self:XMove(self.Tog_Role1().transform:Find("Img_NoData").gameObject,-120,0.1)
        else
            self:XMove(self.Tog_Role1().transform:Find("Img_NoData").gameObject,-135,0.1)
        end
    end,nil)

    self.NHRole2 = {
        self.Tog_Role2().transform:Find("Normal").gameObject,
        self.Tog_Role2().transform:Find("Highlight").gameObject,
    }
    self.NHRole2[2]:SetActive(false)
    self.Tog_Role2().isOn = true
    Tools.ToggleValueChange(self.Tog_Role2(),function(isOn)
        self.NHRole2[1]:SetActive(not isOn)
        self.NHRole2[2]:SetActive(isOn)
        if(isOn) then
            self.CurSolt = 2
            self:CheckCurSupport()
            self:XMove(self.Tog_Role2().transform:Find("Img_NoData").gameObject,-120,0.1)
        else
            self:XMove(self.Tog_Role2().transform:Find("Img_NoData").gameObject,-135,0.1)
        end
    end,nil)

    self.NHRole3 = {
        self.Tog_Role3().transform:Find("Normal").gameObject,
        self.Tog_Role3().transform:Find("Highlight").gameObject,
    }
    self.NHRole3[2]:SetActive(false)
    self.Tog_Role3().isOn = true
    Tools.ToggleValueChange(self.Tog_Role3(),function(isOn)
        self.NHRole3[1]:SetActive(not isOn)
        self.NHRole3[2]:SetActive(isOn)
        if(isOn) then
            self.CurSolt = 3
            self:CheckCurSupport()
            self:XMove(self.Tog_Role3().transform:Find("Img_NoData").gameObject,-120,0.1)
        else
            self:XMove(self.Tog_Role3().transform:Find("Img_NoData").gameObject,-135,0.1)
        end
    end,nil)
    self.Tog_Role1().isOn = false
    self.Tog_Role1().isOn = true

    self.RoleList = {
        self.Tog_Role1().transform:Find("Img_NoData"):Find("TeamRolePrefab").gameObject,
        self.Tog_Role2().transform:Find("Img_NoData"):Find("TeamRolePrefab").gameObject,
        self.Tog_Role3().transform:Find("Img_NoData"):Find("TeamRolePrefab").gameObject,
    }
    self.TogList = {
        self.Tog_Role1().gameObject,
        self.Tog_Role2().gameObject,
        self.Tog_Role3().gameObject,
    }

    self.RoleCoin = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
    }

    for k,v in pairs(self.RoleList) do
        v:SetActive(false)
    end

    self:RefreshSupportPanel()

    ---点击更换
   UIEvent.LuaClick(self.Btn_Genghuan().gameObject,function ()
       if(self.CurRoleID == nil or self.CurSolt == nil) then
           return
       end
       if self.CurSupportRoleID and self.CurSupportRoleID ~= 0 then
           MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_tips4"),function()
               PlayerAvatarViewModel.ChangeSupportData(self.CurRoleID,self.CurSolt,Handle(self,self.ChangeSupportDataACK),Handle(self,self.ChangeSupportDataNTF))
           end ,nil,2})
       else
           PlayerAvatarViewModel.ChangeSupportData(self.CurRoleID,self.CurSolt,Handle(self,self.ChangeSupportDataACK),Handle(self,self.ChangeSupportDataNTF))
       end
   end)
    ---点击解除
    UIEvent.LuaClick(self.Btn_Relieve().gameObject,function ()
        if(self.CurSolt == nil) then
            return
        end
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_tips4"),function()
            PlayerAvatarViewModel.ChangeSupportData(0,self.CurSolt,Handle(self,self.ChangeSupportDataACK),Handle(self,self.ChangeSupportDataNTF))
            self:RefreshSupportPanel()
        end ,nil,2})
    end)
    ---收取友情币
    UIEvent.LuaClick(self.Btn_Recevie().gameObject,function ()
        self:ReapFriendCoin(1)
    end)
    UIEvent.LuaClick(self.Btn_Recevie01().gameObject,function ()
        self:ReapFriendCoin(2)
    end)
    UIEvent.LuaClick(self.Btn_Recevie02().gameObject,function ()
        self:ReapFriendCoin(3)
    end)
end

function M:RefreshSupportPanel()
    if(#PlayerAvatarViewModel.PlayerSupportData ~= 0) then
        self.SData = PlayerAvatarViewModel.PlayerSupportData
        for k,v in pairs(self.SData) do
            local obj = self.RoleList[v.slot]
            obj:SetActive(true)
            local RoleIcon = obj.transform:Find("RoleIcon"):GetComponent("Image")
            local Text_Grade = obj.transform:Find("Text_Grade"):GetComponent("TextMeshProUGUI")
            local Img_Kuang = obj.transform:Find("Img_Kuang"):GetComponent("Image")
            local zhiyeicon = obj.transform:Find("zhiyeicon"):GetComponent("Image")
            local Text_Rank = obj.transform:Find("Text_Rank"):GetComponent("TextMeshProUGUI")
            local StarPanel = obj.transform:Find("StarPanel").gameObject
            local JxStarPanel = obj.transform:Find("JxStarPanel").gameObject
            local NoData = obj.transform.parent.parent:Find("NoRoleDataPanel").gameObject
            local coinCount = obj.transform.parent.parent:Find("FriendCoinPanel").transform:Find("Text_FriendCoinCount"):GetComponent("TextMeshProUGUI")
            local coinPanel = obj.transform.parent.parent:Find("FriendCoinPanel").gameObject
            if(v.slot == 1) then
                self.CurRole1ID = v.roleID
            end
            if(v.slot == 2) then
                self.CurRole2ID = v.roleID
            end
            if(v.slot == 3) then
                self.CurRole3ID = v.roleID
            end
                ---@type --HeroData
                ---@type RoleData
                if(v.roleID ~= 0) then
                 local heroData = HeroControl.GetRoleDataByID(v.roleID)
                MgrRes.LoadQIcon(RoleIcon,heroData.skin)
                MgrRes.LoadSprite(Img_Kuang,heroData.iconBattleFrame)
                MgrRes.LoadSprite(zhiyeicon,heroData.iconCareer)
                Text_Grade.text = heroData.level
                    --增加技能等级设置
                    if heroData.heroFlag and heroData.heroFlag ~= 0 and heroData.heroCurSkill < heroData:GetHeroShowSkillLv() then
                        Text_Rank.text =heroData.heroCurSkill
                        if heroData:CheckHeroEquipIsMax() then
                            Text_Rank.color = Color(1,0.772549,0.2235294,1)
                        else
                            Text_Rank.color = Color(1,1,1,1)
                        end
                    else
                        if heroData:CheckHeroEquipIsMax() then
                            Text_Rank.text =heroData:GetHeroSkillLevel()
                            Text_Rank.color = Color(1,0.772549,0.2235294,1)
                        else
                            Text_Rank.text =heroData:GetHeroSkillLevel()
                            Text_Rank.color = Color(1,1,1,1)
                        end
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
                NoData:SetActive(false)
                coinPanel:SetActive(true)
                local subTime = Global.GetCurTime() - v.time
                    local count = 0
                    if heroData.star == 3 then
                        count = subTime > 0 and tonumber(SteamLocalData.tab[117015][2]) * math.floor(subTime / 3600) or 0
                    elseif heroData.star == 4 then
                        count = subTime > 0 and tonumber(SteamLocalData.tab[117016][2]) * math.floor(subTime / 3600) or 0
                    elseif heroData.star == 5 then
                        count = subTime > 0 and tonumber(SteamLocalData.tab[117017][2]) * math.floor(subTime / 3600) or 0
                    elseif heroData.star == 6 then
                        count = subTime > 0 and tonumber(SteamLocalData.tab[117018][2]) * math.floor(subTime / 3600) or 0
                    end
                    ---友情币数量文本
                    coinCount.text = count + v.money >= tonumber(SteamLocalData.tab[117011][2]) and tonumber(SteamLocalData.tab[117011][2]) or count + v.money
                    self.RoleCoin[v.slot] = count + v.money >= tonumber(SteamLocalData.tab[117011][2]) and tonumber(SteamLocalData.tab[117011][2]) or count + v.money
            else
                obj:SetActive(false)
                NoData:SetActive(true)
                coinPanel:SetActive(false)
            end
        end
    else
        for k,v in pairs(self.TogList) do
            local NoDataObj = v.transform:Find("NoRoleDataPanel").gameObject
            local CoinInfo = v.transform:Find("FriendCoinPanel").gameObject
            CoinInfo:SetActive(false)
        end
    end
end

---初始化Timer
function M:InitTimer()
    MgrTimer.Cancel("SupportUpdate")
    MgrTimer.AddRepeat("SupportUpdate",3600, function ()
        PlayerAvatarViewModel.GetSupportDataOnUpdate(Handle())
    end,-1,nil)
end

---请求返回
function M:GetSupportDataACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportGetACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips1"),2},true)
    end
end
function M:GetSupportDataNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportGetNTF',buffer))
    if tab.supports then
        PlayerAvatarViewModel.PlayerSupportData = tab.supports
        self:RefreshSupportPanel()
    end
end

function M:OnHide()
    MgrTimer.Cancel("SupportUpdate")
end

function M:OnClose()
    MgrTimer.Cancel("SupportUpdate")
end

function M:RefreshCoin()
    local bag = ItemControl.GetAllItems()
    self.Text_CoinCount().text = JNStrTool.numberAbbr(bag[100007] and bag[100007].count or 0)
end

---注册滑块回调
function M:RegisterScroll()
    self.RoleCardScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
---滑块回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self})
end
---设置滑动数据
function M:ResetCardItem(offset,isScroll)
    ---设置当前Loop数据
    self.CurLoopList = RoleCardViewModel.GetRoleData(self.CurCardFilter,self.CurCardSort,self.CurCardRise)
    self:RefreshTable(self.CurLoopList)
    ---设置Loop数量
    self.RoleCardScroll01().totalCount = #self.CurLoopList
    if offset then
        if isScroll then
            self.RoleCardScroll01():ScrollToCell(offset, 3500)      ---将LoopScroll滑动到指定index
        else
            self.RoleCardScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
        end
    else
        self.RoleCardScroll01():RefreshCells()               ---只刷新数据
    end
end
---初始化排序标签
function M:InitCardSort()
    local toggleName = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_core_level"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_starlevel"),
        [3] = MgrLanguageData.GetLanguageByKey("bag_ui_core_get")
    }
    self.tg_SortArr = {}
    self.tg_RiseArr = {}
    self.Tg_ViewSortArr= {}
    for type, name in ipairs(toggleName) do
        local obj = GameObject.Instantiate(self.Tg_CardSort().gameObject,self.CardSortPanel().gameObject.transform,false)
        ---排序标签
        local objChild = {
            obj.transform:Find("Normal").gameObject,
            obj.transform:Find("Btn_HighLight").gameObject
        }
        self.tg_SortArr[type] = objChild
        ---升降序
        local riseObjArr = {
            [1] = objChild[2].transform:Find("Icon_RiseDown").gameObject,
            [2] = objChild[2].transform:Find("Icon_RiseUp").gameObject,
        }
        self.tg_RiseArr[type] = riseObjArr
        for k, v in pairs(objChild) do
            v.transform:Find("Text_CN"):GetComponent("TextMeshProUGUI").text = name
        end
        objChild[2]:SetActive(false)
        self.Tg_ViewSortArr[type] = obj:GetComponent("Toggle")
        ---排序点击
        Tools.ToggleValueChange(self.Tg_ViewSortArr[type],Handle(self, function(self,isOn)
            ---排序状态
            objChild[1]:SetActive(not isOn)
            objChild[2]:SetActive(isOn)
            ---升降序状态
            if self.CurCardRise then
                riseObjArr[1]:SetActive(true)
                riseObjArr[2]:SetActive(false)
            else
                riseObjArr[1]:SetActive(false)
                riseObjArr[2]:SetActive(true)
            end
            self.CurCardSort = type
            self:ResetCardItem()
        end),nil)

        riseObjArr[2]:SetActive(false)
        ---升降序点击
        UIEvent.LuaClick(objChild[2],Handle(self,function(self)
            riseObjArr[1]:SetActive(not riseObjArr[1].activeSelf)
            riseObjArr[2]:SetActive(not riseObjArr[2].activeSelf)
            self.CurCardRise = not self.CurCardRise
            self:ResetCardItem()
        end))
    end
    ---隐藏预制
    self.Tg_CardSort().gameObject:SetActive(false)
end

---初始化筛选按钮
function M:InitFilterBtn()
    UIEvent.LuaClick(self.Btn_Filter().gameObject,function()
        MgrUI.Pop(UID.SortFilterPop_UI,{function(filter,sort,rise)
            self:FilterCallBack(filter,sort,rise)
        end,2},true)
    end)
end

---事件回调
function M:FilterCallBack(filter,sort,rise)
    for i, v in pairs(self.tg_SortArr) do
        v[1]:SetActive(true)
        v[2]:SetActive(false)
    end
    ---更新角色界面存在的排序状态
    if self.tg_SortArr[sort] then
        self.Tg_ViewSortArr[sort].isOn= true
        self.tg_SortArr[sort][1]:SetActive(false)
        self.tg_SortArr[sort][2]:SetActive(true)
        self.tg_RiseArr[sort][1]:SetActive(rise)
        self.tg_RiseArr[sort][2]:SetActive(not rise)
    end
    ---设置排序筛选升降序属性
    self.CurCardFilter = filter
    self.CurCardSort = sort
    self.CurCardRise = rise
    ---更新并刷新到顶部
    self:ResetCardItem(0)
end
---初始化页面滑动按钮
function M:InitLastNextBtn()
    UIEvent.LuaClick(self.Btn_Next().gameObject,function()
        local idx = self.RoleCardScroll01().curItemIndex
        if self.CurCardType == 1 then
            idx = idx + 10
        else
            idx = idx + 5
        end
        idx = idx > (#self.CurLoopList - 1) and (#self.CurLoopList - 1) or idx
        self:ResetCardItem(idx,true)
    end)
    UIEvent.LuaClick(self.Btn_Last().gameObject,function()
        local idx = self.RoleCardScroll01().curItemIndex
        if self.CurCardType == 1 then
            idx = idx - 10
        else
            idx = idx - 5
        end
        idx = idx < 0 and 0 or idx
        self:ResetCardItem(idx,true)
    end)
end

---初始化返回按钮
function M:InitBtnBack()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
        --Event.Go("ShowBagTabPage") --避免背包特效穿透
    end)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
function M:RoleItemOnClick(heroID)
    self.CurRoleID = heroID
    self:ResetCardItem()
end

---更换支援角色阵容回调
function M:ChangeSupportDataACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportChangeACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips2"),2},true)
    end
end
function M:ChangeSupportDataNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportChangeNTF',buffer))
    if tab.supports then
        PlayerAvatarViewModel.PlayerSupportData = tab.supports
        self:RefreshSupportPanel()
        self:ResetCardItem()
        self:CheckCurSupport()
    end
    if tab.goods then
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
    end
end
---收取友情币回调
function M:ReapCoinACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportReapACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        ItemControl.AckError = true
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips3"),2},true)
    end
end
function M:ReapCoinNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportReapNTF',buffer))
    ---更新物品奖励
    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    ---弹出奖励窗口
    MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
    PlayerAvatarViewModel.PlayerSupportData = tab.supports
    self:RefreshCoin()
    self:RefreshSupportPanel()
end
---根据槽位收取友情币
function M:ReapFriendCoin(Slot)
    for k,v in pairs(PlayerAvatarViewModel.PlayerSupportData) do
        if(v.slot == Slot) then
            if(self.RoleCoin[Slot] == 0) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips4"),1},true)
            else
                PlayerAvatarViewModel.ReapCoin(Slot,Handle(self,self.ReapCoinACK),Handle(self,self.ReapCoinNTF))
            end
        end
    end
end
---已经是支援角色的角色靠前显示
function M:RefreshTable(List)
    for i,v in pairs(List) do
        if(v.id == self.CurRole3ID) then
            local data = v
            table.remove(List,i)
            table.insert(List,1,data)
        end
        if v.id == self.CurRole2ID then
            local data = v
            table.remove(List,i)
            table.insert(List,1,data)

        end
        if v.id == self.CurRole1ID then
            local data = v
            table.remove(List,i)
            table.insert(List,1,data)
        end
    end
    for i,v in pairs(List) do
        if(v.id == self.CurRole3ID) then
            local data = v
            table.remove(List,i)
            table.insert(List,3,data)
        end
        if v.id == self.CurRole2ID then
            local data = v
            table.remove(List,i)
            table.insert(List,2,data)

        end
        if v.id == self.CurRole1ID then
            local data = v
            table.remove(List,i)
            table.insert(List,1,data)
        end
    end
end
---检测当前支援ID
function M:CheckCurSupport()
    self.CurSupportRoleID = 0
    if self.SData then
        for i, v in ipairs(self.SData) do
            if v.slot == self.CurSolt then
                self.CurSupportRoleID = v.roleID
            end
        end
    end
end

function M:XMove(Target,TargetPosX,Duration)
    Tools.TweenDoLocalMoveX(Target,TargetPosX,Duration,-1)
end

return M