-- Code Auto Create Begin
local M = Class('ExpeditionTaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ExpeditionTaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Yuanzhengrenwudi','Panel/Img_Yuanzhengrenwudi',2},{'Img_Yuanzhengrenwutu','Panel/Img_Yuanzhengrenwutu',2},{'TimePanel','Panel/TimePanel',2},{'Img_Shijianicon','Panel/TimePanel/Img_Shijianicon',2},{'Img_LVdi','Panel/Img_LVdi',2},{'ExpeditionTaskAwardItem','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem',2},{'ExpeditionTaskAwardItem(1)','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (1)',2},{'ExpeditionTaskAwardItem(2)','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (2)',2},{'ExpeditionTaskAwardItem(3)','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (3)',2},{'ExpeditionTaskAwardItem(4)','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (4)',2},{'Btn_Quxiao','Panel/Btn_Quxiao',2},{'Img_Quxiaodi','Panel/Btn_Quxiao/Img_Quxiaodi',2},{'QuxiaouIcon','Panel/Btn_Quxiao/QuxiaouIcon',2},{'Img_Finish','Panel/Img_Finish',2},{'Img_FinishTextBG','Panel/Img_Finish/Img_FinishTextBG',2},{'TeamPanel','TeamPanel',2},{'Img_Duiwuxuqiudi','TeamPanel/Img_Duiwuxuqiudi',2},{'Img_Sanjiao','TeamPanel/Img_Duiwuxuqiudi/Img_Sanjiao',2},{'Img_Xian1','TeamPanel/Img_Duiwuxuqiudi/Img_Xian1',2},{'Img_Xian2','TeamPanel/Img_Duiwuxuqiudi/Img_Xian2',2},{'LevelLimit','TeamPanel/Text_Duiwuxuqiu/LevelLimit',2},{'Img_Xuqiudi1','TeamPanel/Text_Duiwuxuqiu/LevelLimit/Img_Xuqiudi1',2},{'Img_Gouicon','TeamPanel/Text_Duiwuxuqiu/LevelLimit/Img_Gouicon',2},{'CountLimit','TeamPanel/Text_Duiwuxuqiu/CountLimit',2},{'Img_Xuqiudi2','TeamPanel/Text_Duiwuxuqiu/CountLimit/Img_Xuqiudi2',2},{'Img_Gouicon01','TeamPanel/Text_Duiwuxuqiu/CountLimit/Img_Gouicon',2},{'OccuLimit','TeamPanel/Text_Duiwuxuqiu/OccuLimit',2},{'Img_Xuqiudi3','TeamPanel/Text_Duiwuxuqiu/OccuLimit/Img_Xuqiudi3',2},{'Img_Gouicon02','TeamPanel/Text_Duiwuxuqiu/OccuLimit/Img_Gouicon',2},{'Img_Fengexian','TeamPanel/Img_Fengexian',2},{'Img_Juesekong1','TeamPanel/Img_Juesekong1',2},{'RolePrefab','TeamPanel/Img_Juesekong1/RolePrefab',2},{'Img_Touxiangdi','TeamPanel/Img_Juesekong1/RolePrefab/Img_Touxiangdi',2},{'RoleIcon','TeamPanel/Img_Juesekong1/RolePrefab/RoleIcon',2},{'Img_Kuang','TeamPanel/Img_Juesekong1/RolePrefab/Img_Kuang',2},{'Text_Lv','TeamPanel/Img_Juesekong1/RolePrefab/Text_Lv',2},{'zhiyeicon','TeamPanel/Img_Juesekong1/RolePrefab/zhiyeicon',2},{'Img_Rankdi','TeamPanel/Img_Juesekong1/RolePrefab/Img_Rankdi',2},{'EmptyStar','TeamPanel/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','TeamPanel/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','TeamPanel/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','TeamPanel/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','TeamPanel/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','TeamPanel/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','TeamPanel/Img_Juesekong1/RolePrefab/JxStarPanel',2},{'JxStarPrefab','TeamPanel/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)','TeamPanel/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)','TeamPanel/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)','TeamPanel/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)','TeamPanel/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)','TeamPanel/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel','TeamPanel/Img_Juesekong1/RolePrefab/StarPanel',2},{'StaPrefab','TeamPanel/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)','TeamPanel/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)','TeamPanel/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)','TeamPanel/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)','TeamPanel/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)','TeamPanel/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong2','TeamPanel/Img_Juesekong2',2},{'RolePrefab01','TeamPanel/Img_Juesekong2/RolePrefab',2},{'Img_Touxiangdi01','TeamPanel/Img_Juesekong2/RolePrefab/Img_Touxiangdi',2},{'RoleIcon01','TeamPanel/Img_Juesekong2/RolePrefab/RoleIcon',2},{'Img_Kuang01','TeamPanel/Img_Juesekong2/RolePrefab/Img_Kuang',2},{'Text_Lv01','TeamPanel/Img_Juesekong2/RolePrefab/Text_Lv',2},{'zhiyeicon01','TeamPanel/Img_Juesekong2/RolePrefab/zhiyeicon',2},{'Img_Rankdi01','TeamPanel/Img_Juesekong2/RolePrefab/Img_Rankdi',2},{'EmptyStar01','TeamPanel/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)01','TeamPanel/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)01','TeamPanel/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)01','TeamPanel/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)01','TeamPanel/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)01','TeamPanel/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel01','TeamPanel/Img_Juesekong2/RolePrefab/JxStarPanel',2},{'JxStarPrefab01','TeamPanel/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)01','TeamPanel/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)01','TeamPanel/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)01','TeamPanel/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)01','TeamPanel/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)01','TeamPanel/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel01','TeamPanel/Img_Juesekong2/RolePrefab/StarPanel',2},{'StaPrefab01','TeamPanel/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)01','TeamPanel/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)01','TeamPanel/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)01','TeamPanel/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)01','TeamPanel/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)01','TeamPanel/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong3','TeamPanel/Img_Juesekong3',2},{'RolePrefab02','TeamPanel/Img_Juesekong3/RolePrefab',2},{'Img_Touxiangdi02','TeamPanel/Img_Juesekong3/RolePrefab/Img_Touxiangdi',2},{'RoleIcon02','TeamPanel/Img_Juesekong3/RolePrefab/RoleIcon',2},{'Img_Kuang02','TeamPanel/Img_Juesekong3/RolePrefab/Img_Kuang',2},{'Text_Lv02','TeamPanel/Img_Juesekong3/RolePrefab/Text_Lv',2},{'zhiyeicon02','TeamPanel/Img_Juesekong3/RolePrefab/zhiyeicon',2},{'Img_Rankdi02','TeamPanel/Img_Juesekong3/RolePrefab/Img_Rankdi',2},{'EmptyStar02','TeamPanel/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)02','TeamPanel/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)02','TeamPanel/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)02','TeamPanel/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)02','TeamPanel/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)02','TeamPanel/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel02','TeamPanel/Img_Juesekong3/RolePrefab/JxStarPanel',2},{'JxStarPrefab02','TeamPanel/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)02','TeamPanel/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)02','TeamPanel/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)02','TeamPanel/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)02','TeamPanel/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)02','TeamPanel/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel02','TeamPanel/Img_Juesekong3/RolePrefab/StarPanel',2},{'StaPrefab02','TeamPanel/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)02','TeamPanel/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)02','TeamPanel/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)02','TeamPanel/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)02','TeamPanel/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)02','TeamPanel/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong4','TeamPanel/Img_Juesekong4',2},{'RolePrefab03','TeamPanel/Img_Juesekong4/RolePrefab',2},{'Img_Touxiangdi03','TeamPanel/Img_Juesekong4/RolePrefab/Img_Touxiangdi',2},{'RoleIcon03','TeamPanel/Img_Juesekong4/RolePrefab/RoleIcon',2},{'Img_Kuang03','TeamPanel/Img_Juesekong4/RolePrefab/Img_Kuang',2},{'Text_Lv03','TeamPanel/Img_Juesekong4/RolePrefab/Text_Lv',2},{'zhiyeicon03','TeamPanel/Img_Juesekong4/RolePrefab/zhiyeicon',2},{'Img_Rankdi03','TeamPanel/Img_Juesekong4/RolePrefab/Img_Rankdi',2},{'EmptyStar03','TeamPanel/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)03','TeamPanel/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)03','TeamPanel/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)03','TeamPanel/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)03','TeamPanel/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)03','TeamPanel/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel03','TeamPanel/Img_Juesekong4/RolePrefab/JxStarPanel',2},{'JxStarPrefab03','TeamPanel/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)03','TeamPanel/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)03','TeamPanel/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)03','TeamPanel/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)03','TeamPanel/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)03','TeamPanel/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel03','TeamPanel/Img_Juesekong4/RolePrefab/StarPanel',2},{'StaPrefab03','TeamPanel/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)03','TeamPanel/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)03','TeamPanel/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)03','TeamPanel/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)03','TeamPanel/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)03','TeamPanel/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong5','TeamPanel/Img_Juesekong5',2},{'RolePrefab04','TeamPanel/Img_Juesekong5/RolePrefab',2},{'Img_Touxiangdi04','TeamPanel/Img_Juesekong5/RolePrefab/Img_Touxiangdi',2},{'RoleIcon04','TeamPanel/Img_Juesekong5/RolePrefab/RoleIcon',2},{'Img_Kuang04','TeamPanel/Img_Juesekong5/RolePrefab/Img_Kuang',2},{'Text_Lv04','TeamPanel/Img_Juesekong5/RolePrefab/Text_Lv',2},{'zhiyeicon04','TeamPanel/Img_Juesekong5/RolePrefab/zhiyeicon',2},{'Img_Rankdi04','TeamPanel/Img_Juesekong5/RolePrefab/Img_Rankdi',2},{'EmptyStar04','TeamPanel/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)04','TeamPanel/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)04','TeamPanel/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)04','TeamPanel/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)04','TeamPanel/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)04','TeamPanel/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel04','TeamPanel/Img_Juesekong5/RolePrefab/JxStarPanel',2},{'JxStarPrefab04','TeamPanel/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)04','TeamPanel/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)04','TeamPanel/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)04','TeamPanel/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)04','TeamPanel/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)04','TeamPanel/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel04','TeamPanel/Img_Juesekong5/RolePrefab/StarPanel',2},{'StaPrefab04','TeamPanel/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)04','TeamPanel/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)04','TeamPanel/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)04','TeamPanel/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)04','TeamPanel/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)04','TeamPanel/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong6','TeamPanel/Img_Juesekong6',2},{'RolePrefab05','TeamPanel/Img_Juesekong6/RolePrefab',2},{'Img_Touxiangdi05','TeamPanel/Img_Juesekong6/RolePrefab/Img_Touxiangdi',2},{'RoleIcon05','TeamPanel/Img_Juesekong6/RolePrefab/RoleIcon',2},{'Img_Kuang05','TeamPanel/Img_Juesekong6/RolePrefab/Img_Kuang',2},{'Text_Lv05','TeamPanel/Img_Juesekong6/RolePrefab/Text_Lv',2},{'zhiyeicon05','TeamPanel/Img_Juesekong6/RolePrefab/zhiyeicon',2},{'Img_Rankdi05','TeamPanel/Img_Juesekong6/RolePrefab/Img_Rankdi',2},{'EmptyStar05','TeamPanel/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)05','TeamPanel/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)05','TeamPanel/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)05','TeamPanel/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)05','TeamPanel/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)05','TeamPanel/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel05','TeamPanel/Img_Juesekong6/RolePrefab/JxStarPanel',2},{'JxStarPrefab05','TeamPanel/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)05','TeamPanel/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)05','TeamPanel/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)05','TeamPanel/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)05','TeamPanel/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)05','TeamPanel/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel05','TeamPanel/Img_Juesekong6/RolePrefab/StarPanel',2},{'StaPrefab05','TeamPanel/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)05','TeamPanel/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)05','TeamPanel/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)05','TeamPanel/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)05','TeamPanel/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)05','TeamPanel/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong7','TeamPanel/Img_Juesekong7',2},{'RolePrefab06','TeamPanel/Img_Juesekong7/RolePrefab',2},{'Img_Touxiangdi06','TeamPanel/Img_Juesekong7/RolePrefab/Img_Touxiangdi',2},{'RoleIcon06','TeamPanel/Img_Juesekong7/RolePrefab/RoleIcon',2},{'Img_Kuang06','TeamPanel/Img_Juesekong7/RolePrefab/Img_Kuang',2},{'Text_Lv06','TeamPanel/Img_Juesekong7/RolePrefab/Text_Lv',2},{'zhiyeicon06','TeamPanel/Img_Juesekong7/RolePrefab/zhiyeicon',2},{'Img_Rankdi06','TeamPanel/Img_Juesekong7/RolePrefab/Img_Rankdi',2},{'EmptyStar06','TeamPanel/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)06','TeamPanel/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)06','TeamPanel/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)06','TeamPanel/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)06','TeamPanel/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)06','TeamPanel/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel06','TeamPanel/Img_Juesekong7/RolePrefab/JxStarPanel',2},{'JxStarPrefab06','TeamPanel/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)06','TeamPanel/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)06','TeamPanel/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)06','TeamPanel/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)06','TeamPanel/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)06','TeamPanel/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel06','TeamPanel/Img_Juesekong7/RolePrefab/StarPanel',2},{'StaPrefab06','TeamPanel/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)06','TeamPanel/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)06','TeamPanel/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)06','TeamPanel/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)06','TeamPanel/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)06','TeamPanel/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong8','TeamPanel/Img_Juesekong8',2},{'RolePrefab07','TeamPanel/Img_Juesekong8/RolePrefab',2},{'Img_Touxiangdi07','TeamPanel/Img_Juesekong8/RolePrefab/Img_Touxiangdi',2},{'RoleIcon07','TeamPanel/Img_Juesekong8/RolePrefab/RoleIcon',2},{'Img_Kuang07','TeamPanel/Img_Juesekong8/RolePrefab/Img_Kuang',2},{'Text_Lv07','TeamPanel/Img_Juesekong8/RolePrefab/Text_Lv',2},{'zhiyeicon07','TeamPanel/Img_Juesekong8/RolePrefab/zhiyeicon',2},{'Img_Rankdi07','TeamPanel/Img_Juesekong8/RolePrefab/Img_Rankdi',2},{'EmptyStar07','TeamPanel/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)07','TeamPanel/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)07','TeamPanel/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)07','TeamPanel/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)07','TeamPanel/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)07','TeamPanel/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel07','TeamPanel/Img_Juesekong8/RolePrefab/JxStarPanel',2},{'JxStarPrefab07','TeamPanel/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)07','TeamPanel/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)07','TeamPanel/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)07','TeamPanel/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)07','TeamPanel/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)07','TeamPanel/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel07','TeamPanel/Img_Juesekong8/RolePrefab/StarPanel',2},{'StaPrefab07','TeamPanel/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)07','TeamPanel/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)07','TeamPanel/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)07','TeamPanel/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)07','TeamPanel/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)07','TeamPanel/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong9','TeamPanel/Img_Juesekong9',2},{'RolePrefab08','TeamPanel/Img_Juesekong9/RolePrefab',2},{'Img_Touxiangdi08','TeamPanel/Img_Juesekong9/RolePrefab/Img_Touxiangdi',2},{'RoleIcon08','TeamPanel/Img_Juesekong9/RolePrefab/RoleIcon',2},{'Img_Kuang08','TeamPanel/Img_Juesekong9/RolePrefab/Img_Kuang',2},{'Text_Lv08','TeamPanel/Img_Juesekong9/RolePrefab/Text_Lv',2},{'zhiyeicon08','TeamPanel/Img_Juesekong9/RolePrefab/zhiyeicon',2},{'Img_Rankdi08','TeamPanel/Img_Juesekong9/RolePrefab/Img_Rankdi',2},{'EmptyStar08','TeamPanel/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)08','TeamPanel/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)08','TeamPanel/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)08','TeamPanel/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)08','TeamPanel/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)08','TeamPanel/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel08','TeamPanel/Img_Juesekong9/RolePrefab/JxStarPanel',2},{'JxStarPrefab08','TeamPanel/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)08','TeamPanel/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)08','TeamPanel/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)08','TeamPanel/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)08','TeamPanel/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)08','TeamPanel/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel08','TeamPanel/Img_Juesekong9/RolePrefab/StarPanel',2},{'StaPrefab08','TeamPanel/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)08','TeamPanel/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)08','TeamPanel/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)08','TeamPanel/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)08','TeamPanel/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)08','TeamPanel/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (5)',2},{'Btn_Tuijian','TeamPanel/Btn_Tuijian',2},{'Img_Tuijiandi','TeamPanel/Btn_Tuijian/Img_Tuijiandi',2},{'Btn_Kaishi','TeamPanel/Btn_Kaishi',2},{'Img_Kaishidi','TeamPanel/Btn_Kaishi/Img_Kaishidi',2},{'Btn_ChooseRole','TeamPanel/Btn_ChooseRole',2},
        -- UITemplate 列表
        {'ExpeditionTaskItem','/',10},{'ExpeditionTaskAwardItem01','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem',10},{'ExpeditionTaskAwardItem(1)01','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (1)',10},{'ExpeditionTaskAwardItem(2)01','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (2)',10},{'ExpeditionTaskAwardItem(3)01','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (3)',10},{'ExpeditionTaskAwardItem(4)01','Panel/AwardScroll/AwardContent/ExpeditionTaskAwardItem (4)',10},
        -- RawImage 列表
        {'AwardScroll','Panel/AwardScroll',15},{'AwardContent','Panel/AwardScroll/AwardContent',15},
        -- LoopScrollRect 列表
        {'AwardScroll01','Panel/AwardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Renwuming','Panel/Text_Renwuming',20},{'Text_Kejiequ','Panel/Text_Kejiequ',20},{'Text_Shichang','Panel/TimePanel/Text_Shichang',20},{'Text_LV','Panel/Text_LV',20},{'Text_Dengji','Panel/Text_Dengji',20},{'Text_Quxiao','Panel/Btn_Quxiao/Text_Quxiao',20},{'Text_Finish','Panel/Img_Finish/Img_FinishTextBG/Text_Finish',20},{'Text','Panel/Img_Finish/Text',20},{'Text_Duiwuxuqiu','TeamPanel/Text_Duiwuxuqiu',20},{'Text_Xuqiu','TeamPanel/Text_Duiwuxuqiu/LevelLimit/Text_Xuqiu',20},{'Text_Xuqiu01','TeamPanel/Text_Duiwuxuqiu/CountLimit/Text_Xuqiu',20},{'Text_Xuqiu02','TeamPanel/Text_Duiwuxuqiu/OccuLimit/Text_Xuqiu',20},{'Text_Grade','TeamPanel/Img_Juesekong1/RolePrefab/Text_Grade',20},{'Text_Rank','TeamPanel/Img_Juesekong1/RolePrefab/Text_Rank',20},{'Text_Grade01','TeamPanel/Img_Juesekong2/RolePrefab/Text_Grade',20},{'Text_Rank01','TeamPanel/Img_Juesekong2/RolePrefab/Text_Rank',20},{'Text_Grade02','TeamPanel/Img_Juesekong3/RolePrefab/Text_Grade',20},{'Text_Rank02','TeamPanel/Img_Juesekong3/RolePrefab/Text_Rank',20},{'Text_Grade03','TeamPanel/Img_Juesekong4/RolePrefab/Text_Grade',20},{'Text_Rank03','TeamPanel/Img_Juesekong4/RolePrefab/Text_Rank',20},{'Text_Grade04','TeamPanel/Img_Juesekong5/RolePrefab/Text_Grade',20},{'Text_Rank04','TeamPanel/Img_Juesekong5/RolePrefab/Text_Rank',20},{'Text_Grade05','TeamPanel/Img_Juesekong6/RolePrefab/Text_Grade',20},{'Text_Rank05','TeamPanel/Img_Juesekong6/RolePrefab/Text_Rank',20},{'Text_Grade06','TeamPanel/Img_Juesekong7/RolePrefab/Text_Grade',20},{'Text_Rank06','TeamPanel/Img_Juesekong7/RolePrefab/Text_Rank',20},{'Text_Grade07','TeamPanel/Img_Juesekong8/RolePrefab/Text_Grade',20},{'Text_Rank07','TeamPanel/Img_Juesekong8/RolePrefab/Text_Rank',20},{'Text_Grade08','TeamPanel/Img_Juesekong9/RolePrefab/Text_Grade',20},{'Text_Rank08','TeamPanel/Img_Juesekong9/RolePrefab/Text_Rank',20},{'Text_Shuoming','TeamPanel/Text_Shuoming',20},{'Text_Tuijian','TeamPanel/Btn_Tuijian/Text_Tuijian',20},{'Text_Kaishi','TeamPanel/Btn_Kaishi/Text_Kaishi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TeamPanel().gameObject:SetActive(false)
    self.AwardData = {}  ---奖励数据
    self.ExpeditionRoleData = {}  ---远征角色数据
    self:RegisterListScroll()
    self.HeroData = HeroControl.GetHaveHero()  ---已有角色
    self.RoleList = {
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong1").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong2").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong3").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong4").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong5").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong6").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong7").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong8").gameObject.transform:Find("RolePrefab").gameObject,
        self.TeamPanel().gameObject.transform:Find("Img_Juesekong9").gameObject.transform:Find("RolePrefab").gameObject,
    }

    ---远征中角色数据
    self.ExpeditioningRoleData = {}
    ---推荐角色数据
    self.RecommendRoleData = {}
end

function M:OnUpdateUI(pData)
    ---@type ArkExpeditionData[]
    self.data = pData[1]
    self.parent = pData[2]
    self.index = pData[3]
    self:ReloadListData(0)
    ---隐藏展开
    if self.parent.stopExpand then
        self.TeamPanel().gameObject:SetActive(false)
    end
    self.Text_Dengji().text = self.data.levelLimit
    self.Text_Renwuming().text = self.data.name
    self.refreshEvent = self.Panel():GetComponent("LoopExpeditionItem")
    self.refreshEvent:Register(Handle(self,self.RefreshUI))
    self:RefreshTeam()

    ---点击Item展开队伍UI
    UIEvent.LuaClick(self.Img_Yuanzhengrenwudi().gameObject,function()
        self.parent.stopExpand = false  --可以展开
        if self.TeamPanel().gameObject.activeSelf then
            self.TeamPanel().gameObject:SetActive(false)
        else
            self:RefreshTeam()
            self.TeamPanel().gameObject:SetActive(true)
            self.ObjRoot.gameObject.transform:GetComponent("SkillBound"):UpdateSize()
            if self.TeamPanel().gameObject.activeSelf then
                MgrTimer.AddDelayNoName(0.05,function()
                    Event.Go("ExpeditionClick",self.index)
                end,self.ObjRoot)
            end
            self.parent:ChooseItem(self.index)
        end
    end)

    ---点击领取奖励
    UIEvent.LuaClick(self.Img_Finish().gameObject,function()
        ArkViewModel.EndHomeExpeditionREQ({self.data.expeditionId},ArkViewModel.HomeData[103].id,Handle(self,self.EndHomeExpeditionACK),Handle(self,self.EndHomeExpeditionNTF))
    end)

    ---点击推荐(从已有角色中选择非远征中并满足条件者)
    UIEvent.LuaClick(self.Btn_Tuijian().gameObject,function()
        if self.data.status == 0 then
            self.ExpeditionRoleData = ArkControl.Recommended(self.data)
            self:RefreshTeamPanel(self.ExpeditionRoleData)
            ---把推荐角色加到远征待确认的角色表中
            ArkControl.ClearSingleExpeditionRole(self.data.id,self.data.expeditionId) --先清掉旧数据
            for k,v in pairs(self.ExpeditionRoleData) do
                ArkControl.AddExpeditionRole(self.data.id,v,self.data.expeditionId)
            end
            self.parent:PopExpeditionInfo()
        end
    end)

    ---点击开始远征
    UIEvent.LuaClick(self.Btn_Kaishi().gameObject,function()
        ---如果不是未远征
        if self.data.status ~= 0 then
            return
        end
        ---如果远征队伍数量已经满了
        if self.parent.ExpeditionTeamCount == ArkViewModel.HomeData[103].expeditionNum then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips1"),1},true)
            return
        end
        ---如果可以远征
        if self.CanStart then
            self.parent:SendStartHomeExpedition(self.data.expeditionId,self.ExpeditionRoleData,ArkViewModel.HomeData[103].id)
            ArkControl.PushPlayerExpeditionData(self.data.id,self.ExpeditionRoleData)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips2"),1},true)
        end
    end)
    ---点击取消远征
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject,function()
        if self.data.status ~= 1 then --是否在远征中
            return
        end
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips7"),function()
            self.parent:CancelHomeExpeditionREQ(self.data.expeditionId)
        end ,nil,2})
    end)
    ---点击弹出选择角色面板
    UIEvent.LuaClick(self.Btn_ChooseRole().gameObject,function()
        ArkViewModel.CurTaskID = self.data.id
        ArkViewModel.CurExpeditionId = self.data.expeditionId
        self.parent:PopChooseRolePanel()
    end)

end

---刷新UI
function M:RefreshUI()
    ---未远征
    if self.data.status == 0 then
        self.Text_Kejiequ().gameObject:SetActive(true)
        self.Text_Kejiequ().text = "<color=#73FFF9>"..MgrLanguageData.GetLanguageByKey("expeditiontaskitem_receive").."</color>"
        self.Text_Shichang().text = self.data:GetCompletedTime()
        self.Img_Finish().gameObject:SetActive(false)
        self.Btn_Quxiao().gameObject:SetActive(false)
        ---远征中
    elseif self.data.status == 1 then
        self.Text_Kejiequ().gameObject:SetActive(true)
        self.Text_Kejiequ().text = "<color=#FFD753>"..MgrLanguageData.GetLanguageByKey("expeditiontaskitem_expedition").."</color>"
        self.Img_Finish().gameObject:SetActive(false)
        if self.data:GetExpeditionState() == false then
            ArkViewModel.RefreshTaskDataStatus(self.data.id)
            self.parent:PopExpeditionInfo()
        end
        self.Btn_Quxiao().gameObject:SetActive(true)
        ---远征结束
    elseif self.data.status == 2 then
        self.Text_Kejiequ().gameObject:SetActive(false)
        self.Img_Finish().gameObject:SetActive(true)
        self.Btn_Quxiao().gameObject:SetActive(false)
    end
    self.Text_Shichang().text = self.data:GetCompletedTime()
    ---远征开始和推荐按钮只在未远征状态时出现
    self.Btn_Kaishi().gameObject:SetActive(self.data.status == 0)
    self.Btn_Tuijian().gameObject:SetActive(self.data.status == 0)
end

---注册滑块
function M:RegisterListScroll()
    self.AwardScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    --self.0():SetLuaCellEvent(Handle(self,self.RoleCellItem))
end

---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.AwardList[idx]})
end
function M:RoleCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.AwardData[idx],self})
end

---设置任务奖励物品滑动数据
function M:ReloadListData(offset)
    self.AwardList = self.data:GetRewards()
    ---设置Loop数量
    self.AwardScroll01().totalCount = #self.AwardList
    if offset then
        self.AwardScroll01():RefillCells(offset)
    else
        self.AwardScroll01():RefreshCells()
    end
end

---刷新远征队伍UI
function M:RefreshTeamPanel(list)
    ---刷新角色格子
    for k,v in ipairs(self.RoleList) do
        if list[k] then
            local obj = v
            local roleData = HeroControl.GetRoleDataByID(list[k])
            obj:SetActive(true)
            local RoleIcon = obj.transform:Find("RoleIcon"):GetComponent("Image")
            local Text_Grade = obj.transform:Find("Text_Grade"):GetComponent("TextMeshProUGUI")
            local Img_Kuang = obj.transform:Find("Img_Kuang"):GetComponent("Image")
            local zhiyeicon = obj.transform:Find("zhiyeicon"):GetComponent("Image")
            local Text_Rank = obj.transform:Find("Text_Rank"):GetComponent("TextMeshProUGUI")
            local StarPanel = obj.transform:Find("StarPanel").gameObject
            local JxStarPanel = obj.transform:Find("JxStarPanel").gameObject

            MgrRes.LoadQIcon(RoleIcon,roleData.skin)
            MgrRes.LoadSprite(Img_Kuang,roleData.iconFrame)
            MgrRes.LoadSprite(zhiyeicon,roleData.iconCareer)

            Text_Grade.text = roleData.level
            --设置过技能等级且设置的技能等级小于10级
            if roleData.heroFlag ~= 0 and roleData.heroCurSkill < roleData:GetHeroShowSkillLv() then
                Text_Rank.text = roleData.heroCurSkill
            else
                Text_Rank.text = roleData:GetHeroShowSkillLv()
            end

            for i = 1, 6 do
                JxStarPanel.transform:GetChild(i - 1).gameObject:SetActive(false)
                StarPanel.transform:GetChild(i - 1).gameObject:SetActive(false)
            end

            for i = 1, roleData.star do
                if roleData.awaken then
                    JxStarPanel.transform:GetChild(i - 1).gameObject:SetActive(true)
                else
                    StarPanel.transform:GetChild(i - 1).gameObject:SetActive(true)
                end
            end
        else
            self.RoleList[k]:SetActive(false)
        end
    end
---刷新任务限制UI
    local levelNum = self.data.levelLimit  ---任务等级需求
    local totalCount = self.data.countLimit    ---总人数需求
    local occr = tonumber(string.split(self.data.occupationLimit,"_")[1])   ---职业需求
    local occrCount = tonumber(string.split(self.data.occupationLimit,"_")[2])   ---职业需求人数
    local levelBool = false     ---是否满足等级需求
    local countBool = false     ---是否满足总人数需求
    local occuBool = false      ---是否满足职业需求
    local targetCount = 0       ---满足职业需求的角色人数
    if #list ~= 0 then
        for k,v in pairs(list) do
            local roleData = HeroControl.GetRoleDataByID(v)
            if roleData.level >= levelNum then
                levelBool = true
            end
            if occr ~= 0 then
                if roleData.career == occr then
                    targetCount = targetCount + 1
                end
            end

        end
        countBool = #list >= totalCount
        occuBool = targetCount >= occrCount

    else
        levelBool = false
        countBool = false
        occuBool = false
    end

    self.Limit = {
        [1] = self.LevelLimit().gameObject,
        [2] = self.CountLimit().gameObject,
        [3] = self.OccuLimit().gameObject,
    }
    self.occupation = {
        [1] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_armour"),
        [2] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_slugger"),
        [3] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_firepower"),
        [4] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_supporter"),
    }

    ---判断是否满足等级需求
    local levelText = self.Limit[1].transform:Find("Text_Xuqiu").gameObject:GetComponent("TextMeshProUGUI")
    local levelMark = self.Limit[1].transform:Find("Img_Gouicon").gameObject
    if levelBool then
        levelText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips3"),levelNum)
        levelMark:SetActive(true)
    else
        levelText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips3"),levelNum)
        levelMark:SetActive(false)
    end
    ---判断是否满足人数需求
    local countText = self.Limit[2].transform:Find("Text_Xuqiu").gameObject:GetComponent("TextMeshProUGUI")
    local countMark = self.Limit[2].transform:Find("Img_Gouicon").gameObject
    if countBool then
        countText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips4"),totalCount)
        countMark:SetActive(true)
    else
        countText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips4"),totalCount)
        countMark:SetActive(false)
    end

    local occuText = self.Limit[3].transform:Find("Text_Xuqiu").gameObject:GetComponent("TextMeshProUGUI")
    local occuMark = self.Limit[3].transform:Find("Img_Gouicon").gameObject
    if occr == 0 then
        occuText.text = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips5")
        if #list >= 1 then
            occuMark:SetActive(true)
        else
            occuMark:SetActive(false)
        end
    else
        ---有类型限制
        if occuBool then
            occuText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips6"),occrCount,self.occupation[tonumber(occr)])
            occuMark:SetActive(true)
        else
            occuText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips6"),occrCount,self.occupation[tonumber(occr)])
            occuMark:SetActive(false)
        end
    end
    if levelBool and countBool and occuBool then
        self.CanStart = true
    else
        self.CanStart = false
    end
end

---远征结束回调
function M:EndHomeExpeditionACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEndHomeExpeditionACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips3")..tab.errNo,2},true)
    end
end
function M:EndHomeExpeditionNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEndHomeExpeditionNTF',buffer))
    if(tab.expeditionInfos) then
        ArkControl.PushExpeditionData(tab.expeditionInfos[1])
        self.parent:PopExpeditionInfo()
    end
    if(tab.goods) then
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---更新货币数量
        self.parent:RefreshCoinCount()
    end
end

---远征任务开始回调
function M:StartHomeExpeditionACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientStartHomeExpeditionACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then

    end
end
function M:StartHomeExpeditionNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientStartHomeExpeditionNTF',buffer))
    ---更新远征任务组
    if(tab.expeditionInfos) then
        self.parent:GetHomeExpedition()
    end
end

---点击展开队伍移动Y轴
function M:MoveY(range)
    Global.DoMoveY(self.parent.ExpeditionContent().gameObject,self.parent.ExpeditionContent().transform.localPosition.y + range,0.1)
end

function M:RefreshTeam()
    local arr = ArkControl.GetExpeditionRoleData()
    ---如果是在远征中或是远征结束
    if self.data.status == 1 or self.data.status == 2 then
        self:RefreshTeamPanel(self.data.heroIds)
    else
        if #arr ~= 0 then
            for k,v in pairs(arr) do
                if self.data.id == v.id and self.data.expeditionId == v.expeditionId then
                    self:RefreshTeamPanel(v.heroIds)
                    self.ExpeditionRoleData = v.heroIds
                    break
                end
            end
        else
            self:RefreshTeamPanel({})
        end
    end
end

function M:ItemUpdate(pData)
    self.choose = pData[1]
    if self.choose then
        self.TeamPanel().gameObject:SetActive(true)
    else
        self.TeamPanel().gameObject:SetActive(false)
    end
end

return M