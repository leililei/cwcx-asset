-- Code Auto Create Begin
local M = Class('Ark_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Ark_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Ark_UI].prefab'
    self.Name = 'Form[Ark_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'black','black',2},{'Img_Bg(Ark)','Img_Bg(Ark)',2},{'SpritePanel','SpritePanel',2},{'RoleBtns','SpritePanel/RoleBtns',2},{'RoleBtn1','SpritePanel/RoleBtns/RoleBtn1',2},{'RoleBtn2','SpritePanel/RoleBtns/RoleBtn2',2},{'RoleBtn3','SpritePanel/RoleBtns/RoleBtn3',2},{'Img_More','Sound/Img_More',2},{'VoiceIcon','Sound/VoiceIcon',2},{'Img_SoundTextBG','Sound/Img_SoundTextBG',2},{'Panel','Panel',2},{'Material','Panel/Material',2},{'Img_BtnBg','Panel/Material/Img_BtnBg',2},{'Bubble','Panel/Material/Bubble',2},{'Img_Daojuqipao','Panel/Material/Bubble/Img_Daojuqipao',2},{'Daoju','Panel/Material/Bubble/Daoju',2},{'SkillTrain','Panel/SkillTrain',2},{'Img_BtnBg01','Panel/SkillTrain/Img_BtnBg',2},{'Bubble01','Panel/SkillTrain/Bubble',2},{'Img_Daojuqipao01','Panel/SkillTrain/Bubble/Img_Daojuqipao',2},{'Daoju01','Panel/SkillTrain/Bubble/Daoju',2},{'Power','Panel/Power',2},{'Img_BtnBg02','Panel/Power/Img_BtnBg',2},{'Bubble02','Panel/Power/Bubble',2},{'Img_Daojuqipao02','Panel/Power/Bubble/Img_Daojuqipao',2},{'Daoju02','Panel/Power/Bubble/Daoju',2},{'Expedition','Panel/Expedition',2},{'Img_BtnBg03','Panel/Expedition/Img_BtnBg',2},{'Img_Icon','Panel/Expedition/Img_Icon',2},{'Img_TeamCount','Panel/Expedition/Img_TeamCount',2},{'Img_PaiQian','Panel/Expedition/Img_TeamCount/Img_PaiQian',2},{'Img_PaiQian(1)','Panel/Expedition/Img_TeamCount/Img_PaiQian (1)',2},{'Img_PaiQian(2)','Panel/Expedition/Img_TeamCount/Img_PaiQian (2)',2},{'Img_expeditionCount','Panel/Expedition/Img_expeditionCount',2},{'Img_PaiQian01','Panel/Expedition/Img_expeditionCount/Img_PaiQian',2},{'Img_PaiQian(1)01','Panel/Expedition/Img_expeditionCount/Img_PaiQian (1)',2},{'Img_PaiQian(2)01','Panel/Expedition/Img_expeditionCount/Img_PaiQian (2)',2},{'ProgressAni','Panel/Expedition/ProgressAni',2},{'Img_TanSuoJinDu1','Panel/Expedition/ProgressAni/Img_TanSuoJinDu1',2},{'ProgressPanel','Panel/Expedition/ProgressAni/ProgressPanel',2},{'Img_progress','Panel/Expedition/ProgressAni/ProgressPanel/Img_progress',2},{'Img_progress(1)','Panel/Expedition/ProgressAni/ProgressPanel/Img_progress (1)',2},{'Img_progress(2)','Panel/Expedition/ProgressAni/ProgressPanel/Img_progress (2)',2},{'Img_progress(3)','Panel/Expedition/ProgressAni/ProgressPanel/Img_progress (3)',2},{'Img_progress(4)','Panel/Expedition/ProgressAni/ProgressPanel/Img_progress (4)',2},{'Bubble03','Panel/Expedition/Bubble',2},{'Img_Daojuqipao03','Panel/Expedition/Bubble/Img_Daojuqipao',2},{'Daoju03','Panel/Expedition/Bubble/Daoju',2},{'Img_ExpRedDot','Panel/Expedition/Img_ExpRedDot',2},{'MaintenancePool','Panel/MaintenancePool',2},{'Img_FactoryBg','Panel/MaintenancePool/Img_FactoryBg',2},{'Img_Icon01','Panel/MaintenancePool/Img_Icon',2},{'EnterCountPanel','Panel/MaintenancePool/EnterCountPanel',2},{'Img_count','Panel/MaintenancePool/EnterCountPanel/Img_count',2},{'Img_count(1)','Panel/MaintenancePool/EnterCountPanel/Img_count (1)',2},{'Img_count(2)','Panel/MaintenancePool/EnterCountPanel/Img_count (2)',2},{'CurCountPanel','Panel/MaintenancePool/CurCountPanel',2},{'Img_count01','Panel/MaintenancePool/CurCountPanel/Img_count',2},{'Img_count(1)01','Panel/MaintenancePool/CurCountPanel/Img_count (1)',2},{'Img_count(2)01','Panel/MaintenancePool/CurCountPanel/Img_count (2)',2},{'Img_PoolLock','Panel/MaintenancePool/Img_PoolLock',2},{'Img_Lockicon','Panel/MaintenancePool/Img_PoolLock/Img_Lockicon',2},{'BathRoom','Panel/BathRoom',2},{'Img_FactoryBg2','Panel/BathRoom/Img_FactoryBg2',2},{'Img_Icon02','Panel/BathRoom/Img_Icon',2},{'Img_PoolLock01','Panel/BathRoom/Img_PoolLock',2},{'Img_Lockicon01','Panel/BathRoom/Img_PoolLock/Img_Lockicon',2},{'NoviceHighArea','Panel/NoviceHighArea',2},{'Blueprint','Panel/Blueprint',2},{'ImgBlueprintBg','Panel/Blueprint/ImgBlueprintBg',2},{'ImgBlueprintIcon','Panel/Blueprint/ImgBlueprintIcon',2},{'ImgBlueprintLock','Panel/Blueprint/ImgBlueprintLock',2},{'Factory','Panel/Factory',2},{'Img_Bg','Panel/Factory/Img_Bg',2},{'FactoryIcon','Panel/Factory/FactoryIcon',2},{'ArkShop','Panel/ArkShop',2},{'Img_Bg01','Panel/ArkShop/Img_Bg',2},{'ArkShopIcon','Panel/ArkShop/ArkShopIcon',2},{'Office','Panel/Office',2},{'Img_Bg02','Panel/Office/Img_Bg',2},{'OfficeIcon','Panel/Office/OfficeIcon',2},{'OffoceRedDotIcon','Panel/Office/OffoceRedDotIcon',2},{'Btn_QuanBuShouJi','Panel/Btn_QuanBuShouJi',2},{'ShoujiIcon','Panel/Btn_QuanBuShouJi/ShoujiIcon',2},{'Btn_Return','UpperLeftPanel/Btn_Return',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'Img_Btndi2','Currency/Img_Btndi2',2},{'PowerDetail','Currency/PowerDetail',2},{'Img_Tiliicon','Currency/Panel_Tili/Img_Tiliicon',2},{'Btn_Add','Currency/Panel_Tili/Btn_Add',2},{'Img_AddPower','Currency/Panel_Tili/Btn_Add/Img_AddPower',2},{'Btn_ShowPower','Currency/Panel_Tili/Btn_ShowPower',2},{'Fg','Currency/Panel_Tili/Fg',2},{'ShieldCoinIcon','Currency/Panel_Coin/ShieldCoinIcon',2},{'Fg01','Currency/Panel_Coin/Fg',2},{'TansuojifenIcon','Currency/Panel_ArkCoin/TansuojifenIcon',2},{'ArkExpeditionPanel','ArkExpeditionPanel',2},{'ArkExpeditionPanel01','ArkExpeditionPanel',2},{'ExpeditionReturnBg','ArkExpeditionPanel/ExpeditionReturnBg',2},{'Img_Xian2','ArkExpeditionPanel/Img_Xian2',2},{'Img_Xian1','ArkExpeditionPanel/Img_Xian1',2},{'Img_Tanchuangdi','ArkExpeditionPanel/Img_Tanchuangdi',2},{'Img_Biaotixian','ArkExpeditionPanel/Img_Tanchuangdi/Text_Title/Img_Biaotixian',2},{'Yuanzhengduiwu','ArkExpeditionPanel/Img_Tanchuangdi/Yuanzhengduiwu',2},{'ExpeditionContent','ArkExpeditionPanel/Img_Tanchuangdi/ExpeditionScroll/ExpeditionContent',2},{'Img_Fengexian','ArkExpeditionPanel/Img_Tanchuangdi/Img_Fengexian',2},{'ExpeditionTaskAwardItem','ArkExpeditionPanel/Img_Tanchuangdi/AwardScroll/ExpeditionTaskAwardItem',2},{'TeamPanel','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel',2},{'LevelLimit','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/LevelLimit',2},{'Img_Gouicon','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/LevelLimit/Img_Gouicon',2},{'CountLimit','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/CountLimit',2},{'Img_Gouicon01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/CountLimit/Img_Gouicon',2},{'OccuLimit','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/OccuLimit',2},{'Img_Gouicon02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/OccuLimit/Img_Gouicon',2},{'Img_Juesekong1','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1',2},{'RolePrefab','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab',2},{'Img_Touxiangdi','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/Img_Touxiangdi',2},{'RoleIcon','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/RoleIcon',2},{'Img_Kuang','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/Img_Kuang',2},{'Text_Lv','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/Text_Lv',2},{'zhiyeicon','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/zhiyeicon',2},{'Img_Rankdi','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/Img_Rankdi',2},{'EmptyStar','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/JxStarPanel',2},{'JxStarPrefab','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/StarPanel',2},{'StaPrefab','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong2','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2',2},{'RolePrefab01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab',2},{'Img_Touxiangdi01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/Img_Touxiangdi',2},{'RoleIcon01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/RoleIcon',2},{'Img_Kuang01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/Img_Kuang',2},{'Text_Lv01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/Text_Lv',2},{'zhiyeicon01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/zhiyeicon',2},{'Img_Rankdi01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/Img_Rankdi',2},{'EmptyStar01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/JxStarPanel',2},{'JxStarPrefab01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/StarPanel',2},{'StaPrefab01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong3','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3',2},{'RolePrefab02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab',2},{'Img_Touxiangdi02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/Img_Touxiangdi',2},{'RoleIcon02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/RoleIcon',2},{'Img_Kuang02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/Img_Kuang',2},{'Text_Lv02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/Text_Lv',2},{'zhiyeicon02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/zhiyeicon',2},{'Img_Rankdi02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/Img_Rankdi',2},{'EmptyStar02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/JxStarPanel',2},{'JxStarPrefab02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/StarPanel',2},{'StaPrefab02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong4','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4',2},{'RolePrefab03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab',2},{'Img_Touxiangdi03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/Img_Touxiangdi',2},{'RoleIcon03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/RoleIcon',2},{'Img_Kuang03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/Img_Kuang',2},{'Text_Lv03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/Text_Lv',2},{'zhiyeicon03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/zhiyeicon',2},{'Img_Rankdi03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/Img_Rankdi',2},{'EmptyStar03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/JxStarPanel',2},{'JxStarPrefab03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/StarPanel',2},{'StaPrefab03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong5','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5',2},{'RolePrefab04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab',2},{'Img_Touxiangdi04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/Img_Touxiangdi',2},{'RoleIcon04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/RoleIcon',2},{'Img_Kuang04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/Img_Kuang',2},{'Text_Lv04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/Text_Lv',2},{'zhiyeicon04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/zhiyeicon',2},{'Img_Rankdi04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/Img_Rankdi',2},{'EmptyStar04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/JxStarPanel',2},{'JxStarPrefab04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/StarPanel',2},{'StaPrefab04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong6','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6',2},{'RolePrefab05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab',2},{'Img_Touxiangdi05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/Img_Touxiangdi',2},{'RoleIcon05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/RoleIcon',2},{'Img_Kuang05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/Img_Kuang',2},{'Text_Lv05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/Text_Lv',2},{'zhiyeicon05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/zhiyeicon',2},{'Img_Rankdi05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/Img_Rankdi',2},{'EmptyStar05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/JxStarPanel',2},{'JxStarPrefab05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/StarPanel',2},{'StaPrefab05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong7','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7',2},{'RolePrefab06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab',2},{'Img_Touxiangdi06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/Img_Touxiangdi',2},{'RoleIcon06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/RoleIcon',2},{'Img_Kuang06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/Img_Kuang',2},{'Text_Lv06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/Text_Lv',2},{'zhiyeicon06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/zhiyeicon',2},{'Img_Rankdi06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/Img_Rankdi',2},{'EmptyStar06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/JxStarPanel',2},{'JxStarPrefab06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/StarPanel',2},{'StaPrefab06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong8','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8',2},{'RolePrefab07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab',2},{'Img_Touxiangdi07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/Img_Touxiangdi',2},{'RoleIcon07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/RoleIcon',2},{'Img_Kuang07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/Img_Kuang',2},{'Text_Lv07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/Text_Lv',2},{'zhiyeicon07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/zhiyeicon',2},{'Img_Rankdi07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/Img_Rankdi',2},{'EmptyStar07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/JxStarPanel',2},{'JxStarPrefab07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/StarPanel',2},{'StaPrefab07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesekong9','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9',2},{'RolePrefab08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab',2},{'Img_Touxiangdi08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/Img_Touxiangdi',2},{'RoleIcon08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/RoleIcon',2},{'Img_Kuang08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/Img_Kuang',2},{'Text_Lv08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/Text_Lv',2},{'zhiyeicon08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/zhiyeicon',2},{'Img_Rankdi08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/Img_Rankdi',2},{'EmptyStar08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/JxStarPanel',2},{'JxStarPrefab08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/StarPanel',2},{'StaPrefab08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/StarPanel/StaPrefab (5)',2},{'TimePanel','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel',2},{'Time1','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time1',2},{'Time2','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time2',2},{'Time3','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time3',2},{'Time_h','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time_h',2},{'Img_Jiaobiao','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time_h/Img_Jiaobiao',2},{'Img_Shijianicon','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time_h/Img_Shijianicon',2},{'Btn_Tuijian','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Tuijian',2},{'Btn_Kaishi','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Kaishi',2},{'Btn_Quxiao','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Quxiao',2},{'Btn_Quanbulingqu','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Quanbulingqu',2},{'Btn_ChooseRole','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_ChooseRole',2},{'RolePanel','RolePanel',2},{'Btn_RoleBg','RolePanel/Btn_RoleBg',2},{'Img_Xian201','RolePanel/Img_Xian2',2},{'Img_Xian101','RolePanel/Img_Xian1',2},{'Img_bg','RolePanel/Img_bg',2},{'ExpeditionRoleItem','RolePanel/Img_bg/PlayerRoleScroll/ExpeditionRoleItem',2},{'RoleContent','RolePanel/Img_bg/PlayerRoleScroll/RoleContent',2},{'Btn_UnConfirm','RolePanel/Img_bg/Btn_UnConfirm',2},{'Btn_Genghuan(hui)','RolePanel/Img_bg/Btn_UnConfirm/Btn_Genghuan(hui)',2},{'Btn_Confirm','RolePanel/Img_bg/Btn_Confirm',2},{'Btn_Genghuan','RolePanel/Img_bg/Btn_Confirm/Btn_Genghuan',2},{'Img_Biaotixian01','RolePanel/Text_Title/Img_Biaotixian',2},{'ReportPanel','ReportPanel',2},{'Btn_RoleBg01','ReportPanel/Btn_RoleBg',2},{'Img_Xian202','ReportPanel/Img_Xian2',2},{'Img_Xian102','ReportPanel/Img_Xian1',2},{'Img_bg01','ReportPanel/Img_bg',2},{'Img_Biaotixian02','ReportPanel/Img_bg/Text_Title/Img_Biaotixian',2},{'ReportItem','ReportPanel/Img_bg/ReportScroll/ReportItem',2},{'Img_Shijianicon01','ReportPanel/Img_bg/ReportScroll/ReportItem/Img_Shijianicon',2},{'ExpeditionTaskAwardItem01','ReportPanel/Img_bg/ReportScroll/ReportItem/AwardBackScroll/ExpeditionTaskAwardItem',2},{'ReportContent','ReportPanel/Img_bg/ReportScroll/ReportContent',2},{'Btn_Guanbi','ReportPanel/Img_bg/Btn_Guanbi',2},{'Btn_Zaicipaiqian','ReportPanel/Img_bg/Btn_Zaicipaiqian',2},{'AssistantPanel','AssistantPanel',2},{'Bg','AssistantPanel/Bg',2},{'UpperBtnPanel','AssistantPanel/UpperBtnPanel',2},{'Img_Fenggexian01','AssistantPanel/UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','AssistantPanel/UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu2','AssistantPanel/UpperBtnPanel/ReturnBg/Btn_GoMenu2',2},{'LihuiPanel','AssistantPanel/LihuiPanel',2},{'ArkUpgradePanel','AssistantPanel/ArkUpgradePanel',2},{'YouCeXinXi','AssistantPanel/ArkUpgradePanel/YouCeXinXi',2},{'SheShiYongTU','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Yongtu/SheShiYongTU',2},{'ShengJi','AssistantPanel/ArkUpgradePanel/YouCeXinXi/ShengJi',2},{'Img_Jiantou1','AssistantPanel/ArkUpgradePanel/YouCeXinXi/ShengJi/Img_Jiantou1',2},{'Max','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Max',2},{'Bianhua','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua',2},{'ShengJiXinXi','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/ShengJiXinXi',2},{'Img_Bai','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Bai',2},{'Img_Hei','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei',2},{'group1','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group1',2},{'Img_Jiantou2','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group1/Img_Jiantou2',2},{'group2','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group2',2},{'Img_Jiantou3','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group2/Img_Jiantou3',2},{'JiaJuBiicon','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Xiaohao/JiaJuBiicon',2},{'Btn_ShengJi','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Btn_ShengJi',2},{'Img_Xian103','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Img_Xian1',2},{'Img_Xian203','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Img_Xian2',2},{'Img_ZhiHuiShiDiKuang','AssistantPanel/ArkUpgradePanel/SheshiPanel/Img_ZhiHuiShiDiKuang',2},{'BuildContent','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/BuildContent',2},{'TogNormal','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal',2},{'Img_Icon03','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal/Img_Icon',2},{'TogNormal_H','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal_H',2},{'Img_Icon04','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal_H/Img_Icon',2},{'mask','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/mask',2},{'Img_Lock','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/mask/Img_Lock',2},{'ArkRedDotIcon','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/ArkRedDotIcon',2},{'Btn_SwitchRole','AssistantPanel/ArkUpgradePanel/Btn_SwitchRole',2},{'SwitchRedDotIcon','AssistantPanel/ArkUpgradePanel/Btn_SwitchRole/SwitchRedDotIcon',2},{'Btn_BackArk','AssistantPanel/ArkUpgradePanel/Btn_BackArk',2},{'ArkPosterGirlsPanel','AssistantPanel/ArkPosterGirlsPanel',2},{'Img_Tujingdi','AssistantPanel/ArkPosterGirlsPanel/Text_Huodetujing/Img_Tujingdi',2},{'Archive','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Archive',2},{'ArchiveIcon','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Archive/ArchiveIcon',2},{'suo','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Archive/suo',2},{'DocDesBg','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/DocDesBg',2},{'Btn_Yuyinshiting','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Yuyinshiting',2},{'Yuyinicon','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Yuyinshiting/Yuyinicon',2},{'Btn_Gerenjuqing','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Gerenjuqing',2},{'Juqingicon','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Gerenjuqing/Juqingicon',2},{'JuqingSuoicon','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Gerenjuqing/JuqingSuoicon',2},{'RedDotIcon','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Gerenjuqing/RedDotIcon',2},{'ChooseAssistant','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant',2},{'Img_Tanchudi','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Img_Tanchudi',2},{'Img_Xian104','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Img_Xian1',2},{'Img_Xian204','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Img_Xian2',2},{'RoleContent01','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/VFXMask/PlayerRoleScroll02/RoleContent',2},{'Btn_Sheweizhuli','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Btn_Sheweizhuli',2},{'Btn_Xihuan','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Btn_Xihuan',2},{'Xihuanicon','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Btn_Xihuan/Xihuanicon',2},{'Xihuaniconhui','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Btn_Xihuan/Xihuaniconhui',2},{'Btn_BackBuildInfo','AssistantPanel/ArkPosterGirlsPanel/Btn_BackBuildInfo',2},{'ArkMask','ArkMask',2},
        -- Text 列表
        {'LockText','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Archive/LockText',3},
        -- UITemplate 列表
        {'ExpeditionTaskItem','ArkExpeditionPanel/Img_Tanchuangdi/ExpeditionScroll/ExpeditionTaskItem',10},{'ExpeditionTaskAwardItem02','ArkExpeditionPanel/Img_Tanchuangdi/AwardScroll/ExpeditionTaskAwardItem',10},{'ExpeditionRoleItem01','RolePanel/Img_bg/PlayerRoleScroll/ExpeditionRoleItem',10},{'ExpeditionTaskAwardItem03','ReportPanel/Img_bg/ReportScroll/ReportItem/AwardBackScroll/ExpeditionTaskAwardItem',10},{'PlayerRoleItem','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/VFXMask/PlayerRoleScroll02/RoleContent/PlayerRoleItem',10},
        -- Toggle 列表
        {'Tog_Build','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build',13},
        -- RawImage 列表
        {'ExpeditionScroll','ArkExpeditionPanel/Img_Tanchuangdi/ExpeditionScroll',15},{'AwardScroll','ArkExpeditionPanel/Img_Tanchuangdi/AwardScroll',15},{'AwardContent','ArkExpeditionPanel/Img_Tanchuangdi/AwardScroll/AwardContent',15},{'PlayerRoleScroll','RolePanel/Img_bg/PlayerRoleScroll',15},{'ReportScroll','ReportPanel/Img_bg/ReportScroll',15},{'AwardBackScroll','ReportPanel/Img_bg/ReportScroll/ReportItem/AwardBackScroll',15},{'AwardContent01','ReportPanel/Img_bg/ReportScroll/ReportItem/AwardBackScroll/AwardContent',15},{'BuildScroll','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll',15},{'PlayerRoleScroll02','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/VFXMask/PlayerRoleScroll02',15},
        -- LoopScrollRect 列表
        {'ExpeditionScroll01','ArkExpeditionPanel/Img_Tanchuangdi/ExpeditionScroll',18},{'AwardScroll01','ArkExpeditionPanel/Img_Tanchuangdi/AwardScroll',18},{'PlayerRoleScroll01','RolePanel/Img_bg/PlayerRoleScroll',18},{'ReportScroll01','ReportPanel/Img_bg/ReportScroll',18},{'AwardBackScroll01','ReportPanel/Img_bg/ReportScroll/ReportItem/AwardBackScroll',18},{'BuildScroll01','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll',18},{'PlayerRoleScroll0201','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/VFXMask/PlayerRoleScroll02',18},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','Sound/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_LV','Panel/Material/Text_LV',20},{'Text_CurLevel','Panel/Material/Text_CurLevel',20},{'Text_Name','Panel/Material/Text_Name',20},{'Text_LV01','Panel/SkillTrain/Text_LV',20},{'Text_CurLevel01','Panel/SkillTrain/Text_CurLevel',20},{'Text_Name01','Panel/SkillTrain/Text_Name',20},{'Text_LV02','Panel/Power/Text_LV',20},{'Text_CurLevel02','Panel/Power/Text_CurLevel',20},{'Text_Name02','Panel/Power/Text_Name',20},{'Text_Name03','Panel/Expedition/Text_Name',20},{'Text_Type','Panel/Expedition/Text_Type',20},{'Text_MaintenancePool','Panel/MaintenancePool/Text_MaintenancePool',20},{'Text_YuanZhengZhong','Panel/MaintenancePool/Text_YuanZhengZhong',20},{'Text_MaintenancePool2','Panel/BathRoom/Text_MaintenancePool2',20},{'Text_YuanZhengZhong2','Panel/BathRoom/Text_YuanZhengZhong2',20},{'TextBlueprint','Panel/Blueprint/TextBlueprint',20},{'Text_Factory','Panel/Factory/Text_Factory',20},{'Text_ArkShop','Panel/ArkShop/Text_ArkShop',20},{'Text_Office','Panel/Office/Text_Office',20},{'Text_QuanBuShouJi','Panel/Btn_QuanBuShouJi/Text_QuanBuShouJi',20},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_PowerClock','Currency/PowerDetail/Text_PowerClock',20},{'Text_TargetTime','Currency/PowerDetail/Text_TargetTime',20},{'title','Currency/PowerDetail/title',20},{'title2','Currency/PowerDetail/title2',20},{'Text_Dunbishu','Currency/Panel_Tili/Text_Dunbishu',20},{'Text_ShieldCoinCount','Currency/Panel_Coin/Text_ShieldCoinCount',20},{'Text_ArkCoinCount','Currency/Panel_ArkCoin/Text_ArkCoinCount',20},{'Text_Title','ArkExpeditionPanel/Img_Tanchuangdi/Text_Title',20},{'Text_Duiwushu','ArkExpeditionPanel/Img_Tanchuangdi/Yuanzhengduiwu/Text_Duiwushu',20},{'Text_Duiwu','ArkExpeditionPanel/Img_Tanchuangdi/Yuanzhengduiwu/Text_Duiwu',20},{'Text_Renwu','ArkExpeditionPanel/Img_Tanchuangdi/Text_Renwu',20},{'Text_Weituofang','ArkExpeditionPanel/Img_Tanchuangdi/Weituofang/Text_Weituofang',20},{'Text_Weituoming','ArkExpeditionPanel/Img_Tanchuangdi/Weituofang/Text_Weituoming',20},{'Text_Weituoneirong','ArkExpeditionPanel/Img_Tanchuangdi/Text_Weituoneirong',20},{'Text_Duiwuxuqiu','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Duiwuxuqiu/Text_Duiwuxuqiu',20},{'Text_Shuoming','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Duiwuxuqiu/Text_Shuoming',20},{'Text_Xuqiu','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/LevelLimit/Text_Xuqiu',20},{'Text_Xuqiu01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/CountLimit/Text_Xuqiu',20},{'Text_Xuqiu02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/OccuLimit/Text_Xuqiu',20},{'Text_Grade','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/Text_Grade',20},{'Text_Rank','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong1/RolePrefab/Text_Rank',20},{'Text_Grade01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/Text_Grade',20},{'Text_Rank01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong2/RolePrefab/Text_Rank',20},{'Text_Grade02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/Text_Grade',20},{'Text_Rank02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong3/RolePrefab/Text_Rank',20},{'Text_Grade03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/Text_Grade',20},{'Text_Rank03','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong4/RolePrefab/Text_Rank',20},{'Text_Grade04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/Text_Grade',20},{'Text_Rank04','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong5/RolePrefab/Text_Rank',20},{'Text_Grade05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/Text_Grade',20},{'Text_Rank05','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong6/RolePrefab/Text_Rank',20},{'Text_Grade06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/Text_Grade',20},{'Text_Rank06','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong7/RolePrefab/Text_Rank',20},{'Text_Grade07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/Text_Grade',20},{'Text_Rank07','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong8/RolePrefab/Text_Rank',20},{'Text_Grade08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/Text_Grade',20},{'Text_Rank08','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/RoleContent/Img_Juesekong9/RolePrefab/Text_Rank',20},{'Text_Time','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time1/Text_Time',20},{'Text_Time01','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time2/Text_Time',20},{'Text_Time02','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time3/Text_Time',20},{'Text_Time_h','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/TimePanel/Time_h/Text_Time_h',20},{'Text_Tuijian','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Tuijian/Text_Tuijian',20},{'Text_Kaishi','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Kaishi/Text_Kaishi',20},{'Text_Quxiao','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Quxiao/Text_Quxiao',20},{'Text_Shengyushijian','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Quxiao/Text_Shengyushijian',20},{'Text_CDTime','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Quxiao/Text_CDTime',20},{'Text_Quanbulingqu','ArkExpeditionPanel/Img_Tanchuangdi/TeamPanel/Btn_Quanbulingqu/Text_Quanbulingqu',20},{'Text_Genghuan(hui)','RolePanel/Img_bg/Btn_UnConfirm/Text_Genghuan(hui)',20},{'Text_Genghuan','RolePanel/Img_bg/Btn_Confirm/Text_Genghuan',20},{'Text_Title01','RolePanel/Text_Title',20},{'Text_Title02','ReportPanel/Img_bg/Text_Title',20},{'Text_ReportName','ReportPanel/Img_bg/ReportScroll/ReportItem/Text_ReportName',20},{'Text_ReportTime','ReportPanel/Img_bg/ReportScroll/ReportItem/Text_ReportTime',20},{'Text_Guanbi','ReportPanel/Img_bg/Btn_Guanbi/Text_Guanbi',20},{'Text_Zaicipaiqian','ReportPanel/Img_bg/Btn_Zaicipaiqian/Text_Zaicipaiqian',20},{'Text_TitleCn','AssistantPanel/UpperBtnPanel/Text_TitleCn',20},{'Text_TitleEn','AssistantPanel/UpperBtnPanel/Text_TitleEn',20},{'Text_SheShi','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Text_SheShi',20},{'Text_SheShiYongTu','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Yongtu/Text_SheShiYongTu',20},{'Text_BuildDesc','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Yongtu/Text_BuildDesc',20},{'Text_LV1','AssistantPanel/ArkUpgradePanel/YouCeXinXi/ShengJi/Text_LV1',20},{'Text_CurBuildLv','AssistantPanel/ArkUpgradePanel/YouCeXinXi/ShengJi/Text_CurBuildLv',20},{'Text_LV2','AssistantPanel/ArkUpgradePanel/YouCeXinXi/ShengJi/Text_LV2',20},{'Text_NextBuildLv','AssistantPanel/ArkUpgradePanel/YouCeXinXi/ShengJi/Text_NextBuildLv',20},{'Text_Max','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Max/Text_Max',20},{'Text_buildPurpose','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Text_buildPurpose',20},{'Text_BuildDesc1','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Bai/Text_BuildDesc1',20},{'Text_BuildDesc2','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Bai/Text_BuildDesc2',20},{'Text_Zuo1','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group1/Text_Zuo1',20},{'Text_You1','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group1/Text_You1',20},{'Text_Zuo2','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group2/Text_Zuo2',20},{'Text_You2','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Img_Hei/group2/Text_You2',20},{'Text_PoolExplain','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Text_PoolExplain',20},{'XuQiu','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/XuQiu',20},{'Text_NeedLv','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/XuQiu/Text_NeedLv',20},{'Xiaohao','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Xiaohao',20},{'Text_NeedCoin','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Bianhua/Xiaohao/Text_NeedCoin',20},{'Text_ShengJi','AssistantPanel/ArkUpgradePanel/YouCeXinXi/Btn_ShengJi/Text_ShengJi',20},{'Text_ZhiHuiShiDiKuang','AssistantPanel/ArkUpgradePanel/SheshiPanel/Img_ZhiHuiShiDiKuang/Text_ZhiHuiShiDiKuang',20},{'Text_buildName','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal/Text_buildName',20},{'Text_LV03','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal/Text_LV',20},{'Text_Dengji','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal/Text_Dengji',20},{'Text_buildName01','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal_H/Text_buildName',20},{'Text_LV04','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal_H/Text_LV',20},{'Text_Dengji01','AssistantPanel/ArkUpgradePanel/SheshiPanel/BuildScroll/Tog_Build/TogNormal_H/Text_Dengji',20},{'Text_Huodetujing','AssistantPanel/ArkPosterGirlsPanel/Text_Huodetujing',20},{'Text_Tujing','AssistantPanel/ArkPosterGirlsPanel/Text_Huodetujing/Text_Tujing',20},{'TitleText','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Archive/TitleText',20},{'DocContentText','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/DocDesBg/DocContentText',20},{'Text_Yuyinshiting','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Yuyinshiting/Text_Yuyinshiting',20},{'Text_Sheweizhuli','AssistantPanel/ArkPosterGirlsPanel/ArchivePanel/Btn_Gerenjuqing/Text_Sheweizhuli',20},{'Text_Sheweizhuli01','AssistantPanel/ArkPosterGirlsPanel/ChooseAssistant/Btn_Sheweizhuli/Text_Sheweizhuli',20},
    }
end
-- Code Auto Create End
require("LocalData/HomecharacterLocalData")
function M:OnInit()
    self.ProgressAni().gameObject:SetActive(false)
    ---隐藏遮罩
    self.ArkMask().gameObject:SetActive(false)
    ---玩家盾币数量&家园币赋值
    self:RefreshCoinCount()
    ---注册玩家属性变更通知
    PlayerControl.AddNotify(Handle(self,self.RefreshPower))
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化点击事件
    self:InitClick()
    self:InitUI()
    ---初始化远征动画
    self:InitExpeditionAni()
    ---默认状态
    self.ExpeditionType = false
	if ArkViewModel.JumpToYzts then
        ArkViewModel.JumpToYzts = false
        self:GetHomeExpedition()
    end
    ---当前远征任务按钮
    self.CurExp = {
        item = nil,
        itemTitle = nil,
        id = 1
    }
    ---当前远征数据
    self.CurExpData = nil
    ---远征时间按钮
    self.TimePanel = {
        self.Time1(),self.Time2(),self.Time3()
    }
    ---远征当前临时选角
    self.TempRoleIds = {}
    ---远征条件
    self.ExpLimit = {
        [1] = { tips = self.Text_Xuqiu(), gou = self.Img_Gouicon().gameObject },
        [2] = { tips = self.Text_Xuqiu01(), gou = self.Img_Gouicon01().gameObject },
        [3] = { tips = self.Text_Xuqiu02(), gou = self.Img_Gouicon02().gameObject }
    }
    ---角色类型
    self.occupation = {
        [1] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_armour"),
        [2] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_slugger"),
        [3] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_firepower"),
        [4] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_supporter"),
        [11] = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_surpries"),
    }
    ---远征角色
    self.RoleList = {
        self.Img_Juesekong1().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong2().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong3().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong4().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong5().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong6().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong7().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong8().gameObject.transform:Find("RolePrefab").gameObject,
        self.Img_Juesekong9().gameObject.transform:Find("RolePrefab").gameObject,
    }
    ---远征item点击回调
    Event.Add("ExpeditionClick",function(index)
        if index == #self.CurLoopTaskList then
            self.ExpeditionContent().transform.anchoredPosition = Vector2(0, self.CellHeight*(index-2))
        else
            self.ExpeditionContent().transform.anchoredPosition = Vector2(0, self.CellHeight*(index-1))
        end
    end)
    self.CellHeight = 180
    ---是否停止远征item展开
    self.stopExpand = false
    self.ArkBtnName = {
         MgrLanguageData.GetLanguageByKey("ark_ui_maxteamcount_3"),
         MgrLanguageData.GetLanguageByKey("ark_ui_maxteamcount_4"),
         MgrLanguageData.GetLanguageByKey("ark_ui_maxteamcount_5"),
    }
end

function M:OnShowFinish()
    ---检测引导
    NoviceViewModel.CheckCurID(21904,function()
        self.ArkMask().gameObject:SetActive(true)
        NoviceViewModel.DoNext()
    end)
    NoviceViewModel.CheckCurID(22002,function()
        NoviceViewModel.DoNext()
    end)
    ---刷新体力
    self:RefreshPower() 
end

---初始化UI
function M:InitUI()
    self.Builds = {
        [ArkControl.ArkType.material] = self.Material().gameObject,
        [ArkControl.ArkType.battleTrain] = self.SkillTrain().gameObject,
        [ArkControl.ArkType.physical_training] = self.Power().gameObject,
        [ArkControl.ArkType.expedition] = self.Expedition().gameObject,
    }
    ---注册建筑滑块
    self:InitBuildScroll()
    ---隐藏UI
    self.ArkUpgradePanel().gameObject:SetActive(false)
    self.ArkExpeditionPanel().gameObject:SetActive(false)
    self.PowerDetail().gameObject:SetActive(false)
    self.RolePanel().gameObject:SetActive(false)
    self.ReportPanel().gameObject:SetActive(false)
    self.ArkPosterGirlsPanel().gameObject:SetActive(false)
    self.AssistantPanel().gameObject:SetActive(false)
    ---先刷新一次UI再开启循环
    self:RefreshUI()
    self:AssistantBut()
    ---循环刷新UI
    MgrTimer.AddRepeat("ArkUIUpdate",1, function ()
        self:RefreshUI()
    end,-1,self.ObjRoot)
    ---初始化建筑状态
    self:InitBuildState()
    -----刷新远征角色
    --self:ReloadRoleData(0)
    ---加载当前的看板娘
    if  ArkViewModel.CurRole and ArkViewModel.CurRole ~= 0 then
        ArkViewModel.GetRoleSpineToBox(self.SpritePanel().gameObject,ArkViewModel.CurRole)
        ArkViewModel.SetRoleSpineButton(self.RoleBtn1().gameObject,self.RoleBtn2().gameObject,self.RoleBtn3().gameObject,self.RoleVoiceWordText(),self.ObjRoot)
        --重新载入场景时 不再去播放语音
        if self.UState ~= UIState.Close then
            MgrSound.PlayRole(string.split(ArkViewModel.GetCurChooseArkRole().entervoice,"|")[1],nil,nil,false,0,0,tostring(ArkViewModel.CurRole))
        end
    end
    ---维护池锁
    self.Img_PoolLock().gameObject:SetActive(SysLockControl.CheckSysLock(1610) == false)
end

function M:RefreshUI()
    for i,build in pairs(self.Builds) do
        ---因为服务器会在发送升级请求后返回升级完毕的建筑信息 但是当前还在升级中 因此用上一等级的信息去做逻辑
        local nextData = ArkControl.GetNextLevelBuildData(ArkViewModel.HomeData[i].id)
        ---获得建筑当前状态 如果未升级
        if ArkViewModel.HomeData[i]:GetBuildState() == false then
            ---如果不是远征建筑 刷新产量气泡
            if i ~= ArkControl.ArkType then
                build.transform:Find("Bubble").gameObject:SetActive(ArkViewModel.HomeData[i]:GetYieldCount(Global.GetCurTime(),ArkViewModel.HomeData[i].uTime) > 0)
            else
                if next(ArkViewModel.sTaskData) then
                    self:RefreshTemplate(self.Img_TeamCount().gameObject,ArkViewModel.HomeData[i].expeditionNum)  --刷新总数
                    self:RefreshTemplate(self.Img_expeditionCount().gameObject,ArkViewModel.GetExpeditionNum())   --刷新正在远征队伍数
                else
                    ---零级建筑时
                    self:RefreshTemplate(self.Img_TeamCount().gameObject,ArkViewModel.HomeData[i].expeditionNum)  --刷新总数
                    self:RefreshTemplate(self.Img_expeditionCount().gameObject,0)   --刷新正在远征队伍数
                end
            end
        end
    end
    ---远征气泡判断
    if ArkViewModel.GetExpeditionNum() > 0 then
        self.Text_Type().text = MgrLanguageData.GetLanguageByKey("ui_home_expeditiontxt2")
    else
        self.Text_Type().text = MgrLanguageData.GetLanguageByKey("ui_home_expeditiontxt1")
    end
    if ArkViewModel.GetFinishExpeditionNum() > 0 or #ArkViewModel.sTaskData < ArkViewModel.HomeData[ArkControl.ArkType.expedition].expeditionNum then
        --self.Builds[ArkControl.ArkType.expedition].transform:Find("Bubble").gameObject:SetActive(true)
        self.Img_ExpRedDot().gameObject:SetActive(true)
    else
        --self.Builds[ArkControl.ArkType.expedition].transform:Find("Bubble").gameObject:SetActive(false)
        self.Img_ExpRedDot().gameObject:SetActive(false)
    end
end

---更换看板娘按钮红点
function M:AssistantBut()
    for k, v in ipairs(ArkControl.GetArkItemData()) do
        if not v.Plot then
            --self.Button().gameObject.transform:Find("RedDotIcon").gameObject:SetActive(true)
            return
        end
    end
    --self.Button().gameObject.transform:Find("RedDotIcon").gameObject:SetActive(false)
end

---初始化建筑状态
function M:InitBuildState()
    ---先刷新下建筑状态
    self:RefreshBuildState()
    for i,build in pairs(self.Builds) do
        if ArkViewModel.HomeData[i]:GetBuildState() then
            ---如果在升级中开始计时器
            self:AddUpgradeTimer(ArkViewModel.HomeData[i])
        end
    end
end

---刷新建筑状态
function M:RefreshBuildState()
    for i,build in pairs(self.Builds) do
        if ArkViewModel.HomeData[i].buildType ~= ArkControl.ArkType.expedition then
            ---除了远征其余显示等级
            ---因为服务器会在发送升级请求后返回升级完毕的建筑信息 但是当前还在升级中 因此用上一等级的信息去做逻辑
            local nextData = ArkControl.GetNextLevelBuildData(ArkViewModel.HomeData[i].id)
            ---获得建筑当前状态 如果在升级中
            if ArkViewModel.HomeData[i]:GetBuildState() then
                local prevData = ArkControl.GetPrevLevelBuildData(ArkViewModel.HomeData[i].id)
                build.transform:Find("Text_CurLevel").gameObject:SetActive(true)
                build.transform:Find("Text_CurLevel").gameObject:GetComponent("TextMeshProUGUI").text = prevData.level
                build.transform:Find("Bubble").gameObject:SetActive(false)
                --build.transform:Find("Text_Name").gameObject.transform:Find("RedDotIcon").gameObject:SetActive(false)
            else
                build.transform:Find("Text_CurLevel").gameObject:GetComponent("TextMeshProUGUI").text = ArkViewModel.HomeData[i].level
            end
        end
    end
end

---添加升级计时器
function M:AddUpgradeTimer(data)
    MgrTimer.AddRepeat(data.TimerName,0, function ()
        if data:GetBuildState() then
            self:RefreshBuildState()
        else
            self:RefreshBuildState()
            MgrTimer.Cancel(data.TimerName)
        end
    end,-1,self.ObjRoot)
end

---清理升级计时器
function M:ClearUpgradeTimer()
    if next(ArkViewModel.HomeData) then
        for i,build in pairs(self.Builds) do
            MgrTimer.Cancel(ArkViewModel.HomeData[i].TimerName)
        end
    end
end

---刷新建筑信息
function M:RefreshBuildInfo(type)
    local prevData = ArkControl.GetPrevLevelBuildData(ArkViewModel.HomeData[type].id)  ---上一级建筑信息
    local curData = ArkViewModel.HomeData[type]                                        ---当前建筑信息
    if ArkViewModel.HomeData[type]:GetBuildState() then
        ---升级中
        self.Text_CurrentLevel().text = prevData.level
        self.Text_NextLevel().text = curData.level
        self.Text_Shichang().text = curData:GetCompletedTime()
        self.Panel_Cost().gameObject:SetActive(false)
        self.Text_Upgrading().text = MgrLanguageData.GetLanguageByKey("ark_ui_upgrading")
        if type == ArkControl.ArkType.expedition then
            self.Text_CurVolume().text = prevData.expeditionTaskNum
            self.Text_ReplyVolume().text = curData.expeditionTaskNum
            self.Text_CurProdRate().text = prevData.expeditionNum
            self.Text_NextProdRate().text = curData.expeditionNum
        else
            self.Text_CurVolume().text = prevData.capacity
            self.Text_ReplyVolume().text = curData.capacity
            self.Text_CurProdRate().text = prevData:GetProdRate()
            self.Text_NextProdRate().text = curData:GetProdRate()
        end
    else
        local nextData = ArkControl.GetNextLevelBuildData(curData.id)                  ---下一级建筑信息
        local bag = ItemControl.GetAllItems()
        if nextData then
            ---建筑没有满级
            self.Text_NextLevel().text = nextData.level
            ---远征任务词条区分
            if type == ArkControl.ArkType.expedition then
                self.Text_NextProdRate().text = nextData.expeditionTaskNum
                self.Text_ReplyVolume().text = nextData.expeditionNum
            else
                self.Text_NextProdRate().text = nextData:GetProdRate()
                self.Text_ReplyVolume().text = nextData.capacity
            end
            local hour = math.floor(nextData.costTime / 3600)
            local min = math.floor((nextData.costTime % 3600) / 60)
            local seconds = math.floor(nextData.costTime % 60)
            if(hour < 10) then hour = "0"..hour end
            if(min < 10) then  min = "0"..min end
            if(seconds < 10) then seconds = "0"..seconds end
            self.Text_Shichang().text = string.format("%s:%s:%s",hour,min,seconds)
            ---是否满足升级等级需求
            local str = PlayerControl.GetPlayerData().level >= nextData.playerLevel and MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text24") or MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text25")
            if nextData == nil then
                str = ""
            end
            self.Text_LVshu().text = "LV "..nextData.playerLevel..str
        else
            ---满级建筑
            self.Text_NextProdRate().text = "-"
            self.Text_NextLevel().text = "-"
            self.Text_ReplyVolume().text = "-"
            self.Text_Shichang().text = "-"
            self.Text_LVshu().text = "LV -"
        end
        ---远征任务词条区分
        if type == ArkControl.ArkType.expedition then
            self.Text_Cangkushangxian().text = MgrLanguageData.GetLanguageByKey("ark_ui_teamcount")
            self.Text_Dunbisudu().text = MgrLanguageData.GetLanguageByKey("ark_ui_maxteamcount")
            self.Text_CurVolume().text = curData.expeditionNum
            self.Text_CurProdRate().text = curData.expeditionTaskNum
        else
            self.Text_Cangkushangxian().text = MgrLanguageData.GetLanguageByKey("ark_ui_limitstorehouse")
            self.Text_Dunbisudu().text = MgrLanguageData.GetLanguageByKey("ark_ui_productionspeed")
            self.Text_CurVolume().text = curData.capacity
            self.Text_CurProdRate().text = curData:GetProdRate()
        end
        self.Text_CurrentLevel().text = curData.level
        self.Panel_Cost().gameObject:SetActive(true)
        local playerCoin = bag[tonumber(curData.cost[2])] and bag[tonumber(curData.cost[2])].count or 0
        local needCoin = nextData and tonumber(nextData.cost[3]) or "-"
        if needCoin ==  0 then
            self.Text_Xiaohaoshu().text = MgrLanguageData.GetLanguageByKey("ark_ui_noexpend")
        else
            self.Text_Xiaohaoshu().text = string.format("<color=#14f7ff>%s</color>/%s",playerCoin,needCoin)
        end
        self.Text_Upgrading().text = MgrLanguageData.GetLanguageByKey("ark_ui_upgrade")
    end

    self.Text_BuildName().text = curData.name
    self.Text_Xiaoguoshuoming().text = curData.desc
    local nextData = ArkControl.GetNextLevelBuildData(ArkViewModel.HomeData[type].id)
    if nextData then
        self.Btn_UpGrade().gameObject:SetActive(not nextData:GetBuildState())
        self.Btn_UnUpGrade().gameObject:SetActive(nextData:GetBuildState())

        self.Btn_UpGrade().gameObject:SetActive(curData:GetUpgradeState())
        self.Btn_UnUpGrade().gameObject:SetActive(not curData:GetUpgradeState())
    else
        self.Btn_UpGrade().gameObject:SetActive(false)
        self.Btn_UnUpGrade().gameObject:SetActive(true)
    end

    ---如果未满足升级条件
    if self.Btn_UnUpGrade().gameObject.activeSelf then
        local bag = ItemControl.GetAllItems()
        local playerCoin = bag[tonumber(curData.cost[2])] and bag[tonumber(curData.cost[2])].count or 0
        UIEvent.LuaClick(self.Btn_UnUpGrade().gameObject,function()
            if curData.level == curData.maxLevel then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ark_ui_tips1") ,1},true)
                return
            end
            local needCoin = tonumber(nextData.cost[3])
            if PlayerControl.GetPlayerData().level < nextData.playerLevel then
                MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ark_ui_tips2"),nextData.playerLevel) ,1},true)
                return
            end
            if playerCoin < needCoin then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ark_ui_tips3") ,1},true)
                return
            end
        end)
    end
end

---点击收取
function M:BuildReap(type)
    if type == 0 then  --全部收取
        ---如果体力到达上限 无法领取体力
        if PlayerControl.GetPlayerData().vigor.vigorNum >= tonumber(SteamLocalData.tab[104017][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_commandroom_tips1")},true)
            return
        end
        local CanTake = false
        for i,build in pairs(self.Builds) do
            ---获得建筑当前状态 如果未升级
            if ArkViewModel.HomeData[i]:GetBuildState() == false then
                if i ~= ArkControl.ArkType.expedition then  --不考虑远征
                    if ArkViewModel.HomeData[i]:GetYieldCount(Global.GetCurTime(),ArkViewModel.HomeData[i].uTime) > 0 then  --如果有一个建筑可收取
                        CanTake = true
                        break
                    end
                end
            end
        end
        ---如果不可收取
        if CanTake == false then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips3")},true)
            return
        end
        ArkViewModel.HomeReapREQ(type,Handle(self,self.HomeReapACK),Handle(self,self.HomeReapNTF))
    else   --指定一个建筑收取
        if ArkViewModel.HomeData[type]:GetYieldCount(Global.GetCurTime(),ArkViewModel.HomeData[type].uTime) > 0 then
            if type == ArkControl.ArkType.physical_training then
                ---如果体力到达上限 无法领取体力
                if PlayerControl.GetPlayerData().vigor.vigorNum >= tonumber(SteamLocalData.tab[104017][2]) then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_commandroom_tips1")},true)
                    return
                end
            end
            ArkViewModel.HomeReapREQ(ArkViewModel.HomeData[type].id,Handle(self,self.HomeReapACK),Handle(self,self.HomeReapNTF))
        else
            if ArkViewModel.HomeData[type].level == 0 then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text53")})
            end
        end
    end
end

---初始化点击事件
function M:InitClick()
    Event.Add("BackKey", Handle(self, self.OnBackKey))

    ---点击返回按钮
    UIEvent.LuaClick(self.Btn_Return().gameObject, function ()
        MgrUI.GoBack()
    end)
    ---点击切换助理
    UIEvent.LuaClick(self.Btn_SwitchRole().gameObject, function ()
        self.ArkPosterGirlsPanel().gameObject:SetActive(true)
        self.ArkUpgradePanel().gameObject:SetActive(false)
        self:ReloadArkItemData(0)
        self:SpineMove(-68,0.3)
        self.Text_TitleCn().text = MgrLanguageData.GetLanguageByKey("ui_change_assistant_text1")
        self.Text_TitleEn().text = MgrLanguageData.GetLanguageByKey("ui_change_assistant_en")
    end)
    ---点击选择看板娘页面返回按钮
    UIEvent.LuaClick(self.Btn_BackArk().gameObject, function ()
        self.AssistantPanel().gameObject:SetActive(false)
        if ArkViewModel.CurSpineObj then
            GameObject.Destroy(ArkViewModel.CurSpineObj)
        end
        if self.CurArkItemData then
            self.CurArkItemData.isSelect = false
            self.CurArkItemData.isSelect = nil
        end
        if ArkViewModel.CurRole and ArkViewModel.CurRole~= 0 then
            ArkViewModel.GetRoleSpineToBox(self.SpritePanel().gameObject,ArkViewModel.CurRole)
            ArkViewModel.SetRoleSpineButton(self.RoleBtn1().gameObject,self.RoleBtn2().gameObject,self.RoleBtn3().gameObject,self.RoleVoiceWordText(),self.ObjRoot)
        end
        MgrSound.Stop(3,tostring(self.CurArkItemData.id),false)
        self:AssistantBut()
        ArkViewModel.CurArkItemIndex=0
    end)
    ---点击选择看板娘页面返回主页按钮
    UIEvent.LuaClick(self.Btn_GoMenu2().gameObject, function ()
        MgrUI.GoBack()
        ArkViewModel.CurArkItemIndex=0
    end)
    ---点击返回到建筑详情
    UIEvent.LuaClick(self.Btn_BackBuildInfo().gameObject, function ()
        for k,v in pairs(self.ArkItemDataList) do
            if v.id == ArkViewModel.CurRole then
                self.CurArkItemData = v
            end
        end
        self:RefreshDetails()
        self.ArkUpgradePanel().gameObject:SetActive(true)
        self.ArkPosterGirlsPanel().gameObject:SetActive(false)
        self:SpineMove(-614,0.3)
        self.Text_TitleCn().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_office")
        self.Text_TitleEn().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_office_en")
    end)
    ---更换看板娘
    UIEvent.LuaClick(self.Btn_Sheweizhuli().gameObject, function ()
        if self.CurArkItemData.id == ArkViewModel.CurRole then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ark_ui_tips6"), 2 }, true)
            return
        elseif self.CurArkItemData.unlock==false then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_tongyong_text120"), 2 }, true)
            return
        end
        ArkViewModel.CurArkItemIndex = 0
        self:SendChooseHomeRole(self.CurArkItemData.id, Handle(self, self.ChooseHomeRoleACK), Handle(self, self.ChooseHomeRoleNTF))
    end)
    ---设置为喜欢
    UIEvent.LuaClick(self.Btn_Xihuan().gameObject, function ()
        if self.CurArkItemData.like then
            self.Xihuanicon().gameObject:SetActive(false)
            self.Xihuaniconhui().gameObject:SetActive(true)
        else
            self.Xihuanicon().gameObject:SetActive(true)
            self.Xihuaniconhui().gameObject:SetActive(false)
        end
        self.CurArkItemData:SetLike()
        self.PlayerRoleScroll0201():RefreshCells()
    end)
    ---试听语言
    UIEvent.LuaClick(self.Btn_Yuyinshiting().gameObject,function ()
        MgrSound.PlayRole(self.CurArkItemData.audition,nil,nil,false,0,0,tostring(self.CurArkItemData.id))
    end)
    ---个人剧情
    UIEvent.LuaClick(self.Btn_Gerenjuqing().gameObject,function ()
         if not self.CurArkItemData.Plot then
            self.CurArkItemData:SetPlot()
         end
         if self.CurArkItemData.unlock==false then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_tongyong_text120"), 2 }, true)
             return
         end
         if tonumber(self.CurArkItemData.charplot)==0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("plotreplay_ui_tips1"), 2 }, true)
            return
         end
         PlotViewModel.OpenPlotUI(self.CurArkItemData.charplot,function () end,true)
    end)
    ---点击帮助按钮
    UIEvent.LuaClick(self.Btn_Help().gameObject,function ()
        HelpViewModel.Go(100)
    end)
    ---点击方舟商店
    UIEvent.LuaClick(self.ArkShop().gameObject,function ()
        ---是否解锁
        local tLinkMark = {"tz","sc","114003","303"}
        ---跳转到对应界面
        MgrLink.LinkStart(tLinkMark)
    end)

    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_Add().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel,{nil},true)
    end))
    ---物资生产
    UIEvent.LuaClick(self.Material().gameObject,function()
        self:BuildReap(ArkControl.ArkType.material)
    end)
    ---体力生产
    UIEvent.LuaClick(self.Power().gameObject,function()
        self:BuildReap(ArkControl.ArkType.physical_training)
    end)
    ---技能书生产
    UIEvent.LuaClick(self.SkillTrain().gameObject,function()
        self:BuildReap(ArkControl.ArkType.battleTrain)
    end)
    ---远征入口
    UIEvent.LuaClick(self.Expedition().gameObject,function()
        ArkViewModel.GetRoleData()
        self:GetHomeExpedition()
    end)

    ---关闭远征面板
    UIEvent.LuaClick(self.ExpeditionReturnBg().gameObject,function()
        self.ArkExpeditionPanel().gameObject:SetActive(false)
        --清空相应组ID的远征的角色
        ArkControl.ClearSingleExpeditionRole(self.CurExpData.group)
        self.ExpeditionType = false
        ---重置
        self.CurExp = {
            item = nil,
            itemTitle = nil,
            id = 1
        }
        ---远征气泡判断
        --self.Builds[ArkControl.ArkType.expedition].transform:Find("Bubble").gameObject:SetActive(ArkViewModel.CheckTaskState())
        self.Img_ExpRedDot().gameObject:SetActive(ArkViewModel.CheckTaskState())
        --self.Builds[ArkControl.ArkType.expedition].transform:Find("Text_Name").gameObject.transform:Find("RedDotIcon").gameObject:SetActive(ArkViewModel.CheckTaskState())
    end)
    ---远征-关闭角色面板
    UIEvent.LuaClick(self.Btn_RoleBg().gameObject,function()
        self.RolePanel().gameObject:SetActive(false)
        self.TempRoleIds = {}
    end)
    ---远征-点击角色确认
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        --清空相应组ID的远征的角色
        ArkControl.ClearSingleExpeditionRole(self.CurExpData.group)
        for i, v in ipairs(self.TempRoleIds) do
            ArkControl.AddExpeditionRole(self.CurExpData.group,v)
        end
        self.RolePanel().gameObject:SetActive(false)
        ---刷新每阶段任务描述
        self:RefreshExpedition(self.CurExpData)
        ---刷新远征队伍UI
        self:RefreshTeamPanel(self.TempRoleIds)
        self.TempRoleIds = {}
        --self:ReloadExpeditionData(ArkViewModel.TaskData)
    end)
    -- 蓝图
    if SysLockControl.CheckSysLock(1613) then
        self.ImgBlueprintIcon().gameObject:SetActive(true);
        self.ImgBlueprintLock().gameObject:SetActive(false);
    else
        self.ImgBlueprintIcon().gameObject:SetActive(false);
        self.ImgBlueprintLock().gameObject:SetActive(true);
    end
    UIEvent.LuaClick(self.Blueprint().gameObject,function()
        if SysLockControl.CheckSysLock(1613) then
            MgrUI.GoHide(UID.BlueprintEntry_UI);
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1613), 1},true);
        end
    end)
    ---能源工厂
    UIEvent.LuaClick(self.Factory().gameObject,function()
        ArkViewModel.CurType = 1
        MgrUI.GoHide(UID.EnergyFactory_UI)
    end)
    ---维护池入口
    UIEvent.LuaClick(self.MaintenancePool().gameObject,function()
        if NoviceViewModel.CurTaskId == 22003 then
            NoviceViewModel.DoNext()
            return
        end
        if SysLockControl.CheckSysLock(1610) then
            if ArkViewModel.HomeData[202].level > 0 then
                MgrUI.GoHide(UID.BackRub_UI)
            end
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1610)},true)
        end
    end)
    ---搓澡入口
    UIEvent.LuaClick(self.BathRoom().gameObject,function()
        BathControl.OpenBathHome()
    end)
    local bathLock = CJNUIMgr.GetSunUseName(self.BathRoom().gameObject,"Img_PoolLock")
    bathLock:SetActive(SysLockControl.CheckSysLock(1611) == false)

    ---长按体力
    UIEvent.LuaClick(self.Btn_ShowPower().gameObject,function ()
        -- MgrTimer.Cancel("LongPressPower")
        -- self.PowerDetail().gameObject:SetActive(true)
        -- MgrTimer.AddRepeat("LongPressPower",0,function()
        --     if UIEvent.GetButton_Up() == false  then
        --         self.PowerDetail().gameObject:SetActive(false)
        --     end
        -- end,-1,nil)
        MgrUI.Pop(UID.VigorInfoPanel,{nil},true)
    end)

    ---点击全部收取
    UIEvent.LuaClick(self.Btn_QuanBuShouJi().gameObject,function()
        self:BuildReap(0)
    end)
    ---点击办公室
    UIEvent.LuaClick(self.Office().gameObject,function()
        ---办公室引导
        if NoviceControl.GroupsIsTrigger(153) == false then
            NoviceViewModel.Check(31901)
        end
        self.isFirst = true
        self.AssistantPanel().gameObject:SetActive(true)
        self.ArkUpgradePanel().gameObject:SetActive(true)
        self.ArkPosterGirlsPanel().gameObject:SetActive(false)
        ArkViewModel.CurArkItemIndex = 0
        self:ReloadArkItemData()
        self:ReloadBuildScroll(0)
    end)
    ---远征报告按钮-关闭
    UIEvent.LuaClick(self.Btn_Guanbi().gameObject,function()
        self.FinishTask = {}
        self.ReportPanel().gameObject:SetActive(false)
    end)
    ---远征报告按钮-再次派遣
    UIEvent.LuaClick(self.Btn_Zaicipaiqian().gameObject,function()
        self:SendStartHomeExpedition(self.FinishTask, ArkViewModel.HomeData[ArkControl.ArkType.expedition].id)
        self.ReportPanel().gameObject:SetActive(false)
    end)
    ---远征按钮-推荐
    UIEvent.LuaClick(self.Btn_Tuijian().gameObject,function()
        if self.CurExpData.status == 0 then
            ---传入远征任务data获取符合条件的角色
            local tExpeditionRoleData = ArkControl.Recommended(self.CurExpData)
            --清空相应组ID的远征的角色
            ArkControl.ClearSingleExpeditionRole(self.CurExpData.group)
            for k,v in pairs(tExpeditionRoleData) do
                ArkControl.AddExpeditionRole(self.CurExpData.group,v)
            end
            ---刷新每阶段任务描述
            self:RefreshExpedition(self.CurExpData)
            ---刷新远征队伍UI
            self:RefreshTeamPanel(tExpeditionRoleData)
        end
    end)
    ---远征按钮-开始远征
    UIEvent.LuaClick(self.Btn_Kaishi().gameObject,function()
        ---如果不是未远征
        if self.CurExpData.status ~= 0 then
            return
        end
        ---如果远征队伍数量已经满了
        if self.ExpeditionTeamCount >= ArkViewModel.HomeData[ArkControl.ArkType.expedition].expeditionNum then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips1"),1},true)
            return
        end
        ---如果可以远征
        if self.CanStart then
            local tExpeditions = {
                [1] = {
                    id = self.CurExpData.id,
                    heroIds = ArkControl.GetExpeditionRoleByID(self.CurExpData.group)
                }
            }
            --table.insert(tExpeditions, tData)
            
            self:SendStartHomeExpedition(tExpeditions, ArkViewModel.HomeData[ArkControl.ArkType.expedition].id)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips2"),1},true)
        end
    end)
    ---远征按钮-取消远征
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject,function()
        if self.CurExpData.status ~= 1 then --是否在远征中
            return
        elseif not self.CurExpData:GetExpeditionState() then
            self.CurExpData.status = 2
            self.Btn_Quxiao().gameObject:SetActive(false)
            self.Btn_Quanbulingqu().gameObject:SetActive(true)
            return
        end
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips7"),function()
            self:CancelHomeExpeditionREQ(self.CurExpData.id)
        end ,nil,2})
    end)
    ---远征按钮-全部领取
    UIEvent.LuaClick(self.Btn_Quanbulingqu().gameObject,function()
        local taskList = ArkControl.GetPlayerExpeditionData()
        ---完成远征的ID
        local tFinishTask = {}
        for i, v in pairs(taskList) do
            for k, data in pairs(v) do
                if data.status == 2 then
                    table.insert(tFinishTask, data.id)
                end
            end
        end
        if #tFinishTask == 0 then
            return
        end
        ArkViewModel.EndHomeExpeditionREQ(tFinishTask,ArkViewModel.HomeData[ArkControl.ArkType.expedition].id,Handle(self,self.EndHomeExpeditionACK),Handle(self,self.EndHomeExpeditionNTF))
    end)
    ---点击弹出选择角色面板
    UIEvent.LuaClick(self.Btn_ChooseRole().gameObject,function()
        ArkViewModel.CurTaskID = self.CurExpData.id
        ArkViewModel.CurTaskGroupId = self.CurExpData.group
        self:PopChooseRolePanel()
    end)
end

---玩家盾币数量&家园币赋值
function M:RefreshCoinCount()
    local bag = ItemControl.GetAllItems()
    self.Text_ShieldCoinCount().text= JNStrTool.numberAbbr(bag[100001] and bag[100001].count or 0)
    self.Text_ArkCoinCount().text= JNStrTool.numberAbbr(bag[100005] and bag[100005].count or 0)
end

---弹出选择远征角色面板
function M:PopChooseRolePanel()
    local tRoleIds = ArkControl.GetExpeditionRoleByID(ArkViewModel.CurTaskGroupId)
    for i, v in ipairs(tRoleIds) do
        self:AddRoleId(v)
    end
    self:ReloadRoleData(0)
    self.RolePanel().gameObject:SetActive(true)
    self.Btn_UnConfirm().gameObject:SetActive(false)
    self.Btn_Confirm().gameObject:SetActive(true)
    --self:RefreshConfirmBtn(self.CurExpData.id)
end

---注册滑块
function M:RegisterLoopScroll()
    ---注册远征任务滑块
    self.ExpeditionScroll01():SetLuaCellEvent(Handle(self,self.ExpeditionCellItem))
    self.ExpeditionScroll01():SetChooseEvent(Handle(self, self.OpenTeamPanel))
    self.ExpeditionScroll01():SetUnchooseEvent(Handle(self, self.CloseTeamPanel))
    ---注册远征任务奖励
    self.AwardScroll01():SetLuaCellEvent(Handle(self,self.AwardCellItem))
    ---注册远征角色选择滑块
    self.PlayerRoleScroll01():SetLuaCellEvent(Handle(self,self.RoleCellItem))
    ---注册选择看板娘滑块
    self.PlayerRoleScroll0201():SetLuaCellEvent(Handle(self,self.ArkRoleItem))
    ---远征报告滑块
    self.ReportScroll01():SetLuaCellEvent(Handle(self,self.ReportCell))
end

function M:OpenTeamPanel(trans)
    --trans:GetComponent("UITemplate"):ScrollUpdate({true})
end
function M:CloseTeamPanel(trans)
    --trans:GetComponent("UITemplate"):ScrollUpdate({false})
end

function M:AwardCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.AwardList[idx]})
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
    
    if(tab.rewardsInfos) then
        ---更新物品奖励
        for i, v in ipairs(tab.rewardsInfos) do
            ItemControl.PushGroupItemData(v.goods,ItemControl.PushEnum.add)
        end
        ---弹出奖励窗口
        self.ReportList = tab.rewardsInfos
        self.ReportScroll01().totalCount = #self.ReportList
        self.ReportScroll01():RefillCells(0)
        self.ReportPanel().gameObject:SetActive(true)
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---更新货币数量
        self:RefreshCoinCount()

        ---远征界面更新
        self.FinishTask = {}
        local tFinishTask = {}
        for i, v in ipairs(self.ReportList) do
            table.insert(self.FinishTask, v.expeditionInfos)
            local temp = {
                id = v.expeditionInfos.id,
                expeditionId = v.expeditionInfos.id,
                heroIds = {},
                status = 0,
                uTime = v.expeditionInfos.uTime,
                group = ArkControl.GetExpeditionDataByID(v.expeditionInfos.id).group
            }
            table.insert(tFinishTask, temp)
            for k, sV in ipairs(ArkViewModel.sTaskData) do
                if sV.id == v.expeditionInfos.id then
                    table.remove(ArkViewModel.sTaskData,k)
                end
            end
        end
        ArkControl.PushExpeditionData(tFinishTask)
        for i, v in ipairs(tFinishTask) do
            ArkControl.ClearSingleExpeditionRole(v.group)
        end
        self:ReloadExpeditionData()
    end
end

---添加角色ID
function M:AddRoleId(id)
    table.insert(self.TempRoleIds,id)
end
---删除角色ID
function M:RemoveRoleId(id)
    for i, v in ipairs(self.TempRoleIds) do
        if id == v then
            table.remove(self.TempRoleIds, i)
            break
        end
    end
end
function M:GetExpedRoleIds()
    return self.TempRoleIds
end

---远征信息回调
function M:ExpeditionCellItem(trans,idx)
    self:ExpeditionCell(trans.gameObject,self.CurLoopTaskList[idx],idx)
end

---角色信息回调
function M:RoleCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.roleData[idx],self})
end
---远征页签
function M:ExpeditionCell(_obj,_data,_idx)
    local ItemBg = CJNUIMgr.GetSunUseName(_obj, "Img_Yuanzhengrenwudi"):GetComponent("Image")
    local ItemTitle = CJNUIMgr.GetSunUseName(_obj, "Text_Renwuming"):GetComponent("TextMeshProUGUI")
    local ItemJiaoBiao = CJNUIMgr.GetSunUseName(_obj, "Img_Jiaobiao")
    local ItemCanGetTxt = CJNUIMgr.GetSunUseName(_obj, "Text_Kejiequ"):GetComponent("TextMeshProUGUI")
    local tCurState = 0
    local tData = _data
    for k, sV in ipairs(ArkViewModel.sTaskData) do
        if tData[sV.id] then
            tData[sV.id].heroIds = sV.heroIds
            tData[sV.id].status = sV.status
            tData[sV.id].uTime = sV.uTime
            if tData[sV.id].status == 1 and tData[sV.id]:GetExpeditionState() == false then
                tData[sV.id].status = 2
            end
            tCurState = tData[sV.id].status
            break
        end
    end
    
    local tIdx,tExpedition = next(tData)
    ---远征标题
    ItemTitle.text = tExpedition.name
    if tCurState == 0 then
        ItemJiaoBiao.gameObject:SetActive(false)
    else
        if tCurState == 1 then
            ItemCanGetTxt.text = MgrLanguageData.GetLanguageByKey("ark_ui_paiqian")
            ItemCanGetTxt.color = Color(1,0.73,0)
        else
            ItemCanGetTxt.text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text82")
            ItemCanGetTxt.color = Color(0.95,1,0.15)
        end
        ItemJiaoBiao.gameObject:SetActive(true)
    end
    ---点击Item展开队伍UI
    UIEvent.LuaClick(_obj,function()
        if self.CurExp.item == ItemBg then
            return
        end
        --切换按钮状态
        MgrRes.LoadSprite(self.CurExp.item,"Ark/Img_Yuanzhengrenwudi")
        self.CurExp.itemTitle.color = Color(1,1,1)
        self.CurExp.item = ItemBg
        self.CurExp.itemTitle = ItemTitle
        self.CurExp.id = _idx
        MgrRes.LoadSprite(self.CurExp.item,"Ark/Img_Yuanzhengrenwudi_h")
        self.CurExp.itemTitle.color = Color(0,0,0)
        
        --清空相应组ID的远征的角色
        ArkControl.ClearSingleExpeditionRole(self.CurExpData.group)
        
        self:ExpeditionUI(tData)
    end)
    
    if self.CurExp.id == _idx then
        self.CurExp.item = ItemBg
        self.CurExp.itemTitle = ItemTitle
        self.CurExp.itemTitle.color = Color(0,0,0)
        MgrRes.LoadSprite(self.CurExp.item,"Ark/Img_Yuanzhengrenwudi_h")
        self:ExpeditionUI(tData)
    else
        MgrRes.LoadSprite(ItemBg,"Ark/Img_Yuanzhengrenwudi")
        ItemTitle.color = Color(1,1,1)
    end
end
---远征-探索
function M:ExpeditionUI(_data)
    local tHavaState = false
    local isFirst = true
    local tIdx = next(_data)
    local id = 0
    ---远征时间按钮
    while tIdx ~= nil do
        local v = _data[tIdx]
        local Text_Time = self.ArkBtnName[v.timeID]
        if v.status ~= 0 then
            self.Text_Time_h().text = Text_Time
            self.Time_h().transform.localPosition = self.TimePanel[v.timeID].transform.localPosition
            ---刷新每阶段任务描述
            self:RefreshExpedition(v)
            ---刷新远征队伍UI
            self:RefreshTeamPanel(v.heroIds)
            ---当前远征数据
            self.CurExpData = v

            tHavaState = true
            isFirst = false
        elseif isFirst then
            self.Text_Time_h().text = Text_Time
            self.Time_h().transform.localPosition = self.TimePanel[v.timeID].transform.localPosition
            ---刷新每阶段任务描述
            self:RefreshExpedition(v)
            ---刷新远征队伍UI
            self:RefreshTeamPanel(v.heroIds)
            ---当前远征数据
            self.CurExpData = v

            isFirst = false
        end
        UIEvent.LuaClick(self.TimePanel[v.timeID].gameObject,function()
            if tHavaState  then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ark_ui_paiqian"),1 }, true)
                return
            end
            self.Text_Time_h().text = Text_Time
            self.Time_h().transform.localPosition = self.TimePanel[v.timeID].transform.localPosition
            ---当前远征数据
            self.CurExpData = v
            ---刷新每阶段任务描述
            self:RefreshExpedition(v)
        end)
        id = id+1
        tIdx = next(_data,tIdx)
    end
end
---远征-刷新每阶段任务
function M:RefreshExpedition(_data)
    ---任务描述
    self.Text_Weituoming().text = _data.desc
    self.Text_Weituoneirong().text = _data.desc2
    ---设置任务奖励物品滑动数据
    self.AwardList = _data:GetRewards()
    ---设置Loop数量
    self.AwardScroll01().totalCount = #self.AwardList
    self.AwardScroll01():RefillCells(0)
    ---远征-条件判断
    self:ExpeditionCondition(_data)
    ---倒计时
    self.Text_CDTime().text = _data:GetCompletedTime()
    ---当前页签按钮状态
    if _data.status == 0 then
        self.Btn_Tuijian().gameObject:SetActive(true)
        self.Btn_Kaishi().gameObject:SetActive(true)
        self.Btn_Quxiao().gameObject:SetActive(false)
        self.Btn_Quanbulingqu().gameObject:SetActive(false)
        self.Btn_ChooseRole().gameObject:SetActive(true)
    elseif _data.status == 1 then
        self.Btn_Tuijian().gameObject:SetActive(false)
        self.Btn_Kaishi().gameObject:SetActive(false)
        self.Btn_Quxiao().gameObject:SetActive(true)
        self.Btn_Quanbulingqu().gameObject:SetActive(false)
        self.Btn_ChooseRole().gameObject:SetActive(false)
    elseif _data.status == 2 then
        self.Btn_Tuijian().gameObject:SetActive(false)
        self.Btn_Kaishi().gameObject:SetActive(false)
        self.Btn_Quxiao().gameObject:SetActive(false)
        self.Btn_Quanbulingqu().gameObject:SetActive(true)
        self.Btn_ChooseRole().gameObject:SetActive(false)
    end
end
---远征-条件判断
function M:ExpeditionCondition(_data)
    local levelNum = _data.levelLimit  ---任务等级需求
    local totalCount = _data.countLimit    ---总人数需求
    local occr = tonumber(string.split(_data.occupationLimit,"_")[1])   ---职业需求
    local occrCount = tonumber(string.split(_data.occupationLimit,"_")[2])   ---职业需求人数
    local levelBool = false     ---是否满足等级需求
    local countBool = false     ---是否满足总人数需求
    local occuBool = false      ---是否满足职业需求
    local targetCount = 0       ---满足职业需求的角色人数
    local tRoleList = ArkControl.GetExpeditionRoleByID(_data.group)
    if #tRoleList ~= 0 then
        for k,v in pairs(tRoleList) do
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
        countBool = #tRoleList >= totalCount
        occuBool = targetCount >= occrCount
    else
        levelBool = false
        countBool = false
        occuBool = false
    end
    ---判断是否满足等级需求
    local levelText = self.ExpLimit[1].tips
    local levelMark = self.ExpLimit[1].gou
    if levelBool then
        levelText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips3"),levelNum)
        levelMark:SetActive(true)
    else
        levelText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips3"),levelNum)
        levelMark:SetActive(false)
    end
    ---判断是否满足人数需求
    local countText = self.ExpLimit[2].tips
    local countMark = self.ExpLimit[2].gou
    if countBool then
        countText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips4"),totalCount)
        countMark:SetActive(true)
    else
        countText.text = string.format(MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips4"),totalCount)
        countMark:SetActive(false)
    end

    local occuText = self.ExpLimit[3].tips
    local occuMark = self.ExpLimit[3].gou
    if occr == 0 then
        occuText.text = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_tips5")
        if #tRoleList >= 1 then
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
            v:SetActive(false)
        end
    end
end
---远征-远征报告
function M:ReportCell(trans,idx)
    local Text_ReportName = trans.transform:Find("Text_ReportName"):GetComponent("TextMeshProUGUI")
    local Text_ReportTime = trans.transform:Find("Text_ReportTime"):GetComponent("TextMeshProUGUI")
    ---远征报告内容
    local tData = ArkControl.GetExpeditionDataByID(self.ReportList[idx].expeditionInfos.id)
    Text_ReportName.text = tData.name
    Text_ReportTime.text = (tData.useTime/3600)..MgrLanguageData.GetLanguageByKey("textcd_hour")
    ---远征奖励
    local function GetRewards(awardList)
        local array = {}
        for i, v in ipairs(awardList) do
            if v.goodsNum ~= 0 then
                local config = Global.GetLocalDataByGoods(v)
                local data = {}
                data.type = v.goodsType
                data.config = config
                data.id = config.id
                data.quality = config.quality
                data.isOnceAdopt = false
                data.probability = false
                data.count = v.goodsNum
                data.isRec = false
                data.idx = #array + 1
                table.insert(array, data)
            end
        end
        
        return array
    end
    self.ReportAward = GetRewards(self.ReportList[idx].goods)
    
    local AwardBackScroll = CJNUIMgr.GetSunUseName(trans.gameObject, "AwardBackScroll"):GetComponent("LoopHorizontalScrollRect")
    ---远征报告奖励滑块
    AwardBackScroll:SetLuaCellEvent(Handle(self,self.ReportAwardCell))
    AwardBackScroll.totalCount = #self.ReportAward
    AwardBackScroll:RefillCells(0)
end
---远征-远征报告奖励
function M:ReportAwardCell(trans,idx)
    --trans:GetComponent("UITemplate"):SetData({self.ReportAward[idx]})
    local tAward = self.ReportAward[idx]
    local ExpeditionTaskAwardItem = trans:GetComponent("Image")
    local Img_Award = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Award"):GetComponent("Image")
    local Text_Count = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_Count"):GetComponent("TextMeshProUGUI")
    local Img_Possible = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Possible")
    ---设置品质
    MgrRes.LoadSprite(ExpeditionTaskAwardItem,"Item/Rank/ItemRank_"..tAward.config.quality)
    ---设置图标
    MgrRes.LoadSprite(Img_Award,"Item/"..tAward.config.icon)
    ---设置数量
    Text_Count.text = tAward.count
    ---是否是概率获得
    Img_Possible.gameObject:SetActive(false)

    UIEvent.LuaClick(trans.gameObject, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(tAward.config.id,tonumber(tAward.type))
        MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
    end))
end
---看板娘信息回调
function M:ArkRoleItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.ArkItemDataList[idx],self,idx})
end

function M:ReloadExpeditionData(groupList,offset)
    self.CurLoopTaskList = ArkControl.GetPlayerExpeditionData()
    self.ExpeditionScroll01().totalCount = #self.CurLoopTaskList
    if offset then
        self.ExpeditionScroll01():RefillCells(offset)
    else
        self.ExpeditionScroll01():RefreshCells()
    end

    self.ExpeditionTeamCount = 0
    for k,v in pairs(self.CurLoopTaskList) do
        for i, data in pairs(v) do
            if data.status ~= 0 then
                self.ExpeditionTeamCount = self.ExpeditionTeamCount + 1
            end
        end
    end
    self.Text_Duiwushu().text = string.format("<color=#ffcb18>%s</color> / %s",self.ExpeditionTeamCount,ArkViewModel.HomeData[ArkControl.ArkType.expedition].expeditionNum)
end

function M:ReloadRoleData(offset)
    self.roleData = ArkViewModel.GetRoleData()
    Global.Sort(self.roleData,{"level","rank","star","id"},true)
    self.PlayerRoleScroll01().totalCount = #self.roleData
    if offset then
        self.PlayerRoleScroll01():RefillCells(offset)
    else
        self.PlayerRoleScroll01():RefreshCells()
    end
end

function M:ReloadArkItemData(offset,sound)
    self.ArkItemDataList = ArkViewModel.ArkItemDataList
    Global.Sort(self.ArkItemDataList,{"choose","like","unlock","id"},false)
    if ArkViewModel.CurArkItemIndex ~= 0 then
        self.CurArkItemData=self.ArkItemDataList[ArkViewModel.CurArkItemIndex]
    else
        self.CurArkItemData=self.ArkItemDataList[1]
        ArkViewModel.CurArkItemIndex=1
    end
    for k,v in pairs(self.ArkItemDataList) do
        v.isSelect = false
    end
    self.CurArkItemData.isSelect=true
    self.PlayerRoleScroll0201().totalCount = #self.ArkItemDataList
    if offset then
        self.PlayerRoleScroll0201():RefillCells(ArkViewModel.CurArkItemIndex)
    else
        self.PlayerRoleScroll0201():RefreshCells()
    end

    self:RefreshDetails()
    if sound then
        MgrSound.PlayRole(string.split(ArkViewModel.ArkItemDataList[1].setvoice,"|")[1],nil,nil,false,0,0,tostring(ArkViewModel.ArkItemDataList[1].id))
    end
end

---选择看板娘点击事件
---@param index ArkItemData
function M:RoleItemOnClick(hero,index)
    MgrSound.Stop(3,tostring(self.CurArkItemData.id),false)
    if self.CurArkItemData.id == hero.id then
        return
    end
    if self.CurArkItemData then
        self.CurArkItemData.isSelect = false
        self.CurArkItemData.isSelect = nil
    end
    hero.isSelect = true
    self.CurArkItemData = hero
    ArkViewModel.CurArkItemIndex=index
    self:RefreshDetails()
    self.PlayerRoleScroll0201():RefreshCells()
end

---初始化建筑详情
function M:ToggleEvent(trans,idx)
    local toggle = trans.transform:GetComponent("Toggle")
    toggle.group = self.BuildContent().gameObject:GetComponent("ToggleGroup")
    local name = trans.transform:Find("TogNormal").transform:Find("Text_buildName").transform:GetComponent("TextMeshProUGUI")
    local name_H = trans.transform:Find("TogNormal_H").transform:Find("Text_buildName").transform:GetComponent("TextMeshProUGUI")
    local level = trans.transform:Find("TogNormal").transform:Find("Text_Dengji").transform:GetComponent("TextMeshProUGUI")
    local level_H = trans.transform:Find("TogNormal_H").transform:Find("Text_Dengji").transform:GetComponent("TextMeshProUGUI")
    local normal = trans.transform:Find("TogNormal").gameObject
    local highLight = trans.transform:Find("TogNormal_H").gameObject
    local icon = trans.transform:Find("TogNormal").transform:Find("Img_Icon").transform:GetComponent("Image")
    local icon_H = trans.transform:Find("TogNormal_H").transform:Find("Img_Icon").transform:GetComponent("Image")
    local mask = trans.transform:Find("mask").gameObject
    local ArkRedDotIcon = trans.transform:Find("ArkRedDotIcon").gameObject
    
    name.text = self.BuildList[idx].name
    name_H.text = self.BuildList[idx].name
    level.text = self.BuildList[idx].level
    level_H.text = self.BuildList[idx].level
    highLight:SetActive(false)
    mask:SetActive(false)
    MgrRes.LoadSprite(icon,self.BuildList[idx].buildImage)
    MgrRes.LoadSprite(icon_H,self.BuildList[idx].buildImage)
    Tools.ToggleValueChange(toggle,function(isOn)
        if isOn then
            self.CurChooseBuild = toggle
            highLight:SetActive(true)
            normal:SetActive(false)
            self:RefreshBuildDetails(self.BuildList[idx].buildType)
        else
            highLight:SetActive(false)
            normal:SetActive(true)
        end
    end,nil)
    if self.isFirst == true then
        if  idx == 1 then   --如果第一次进入默认选中第一个
            toggle.isOn = true
            self.isFirst = false
        else
            toggle.isOn = false
        end
    else
        --选中最后一次选中的toggle
        self.CurChooseBuild.isOn = false
        self.CurChooseBuild.isOn = true
    end

    --新加红点
    local index = self.BuildList[idx].buildType
    local info = ArkViewModel.HomeData[index]
    local player = PlayerControl.GetPlayerData()
    local nextInfo = ArkControl.GetNextLevelBuildData(ArkViewModel.HomeData[index].id)
    local coin = ItemControl.GetItemByIdAndType(tonumber(info.cost[2]),tonumber(info.cost[1]))
    if nextInfo and player.level >= nextInfo.playerLevel and coin.count >= tonumber(nextInfo.cost[3]) then
        ArkRedDotIcon:SetActive(true)
    else
        ArkRedDotIcon:SetActive(false)
    end
end

---注册滑条
function M:InitBuildScroll()
    ---页签滑条
    self.BuildScroll01():SetLuaCellEvent(Handle(self, self.ToggleEvent))
    self.CurChooseBuild = nil  --当前选中建筑
    self.isFirst = true
end

---刷新办公室建筑滑块
function M:ReloadBuildScroll(offset)
    self.BuildList = {}
    for k,v in pairs(ArkViewModel.HomeData) do
        if v.canUp == 0 then  --如果建筑可升级
            table.insert(self.BuildList,v)
        end
    end
    Global.Sort(self.BuildList,{"buildType"},false)  --排序
    self.BuildScroll01().totalCount = #self.BuildList
    if offset then
        self.BuildScroll01():RefillCells(offset)
    else
        self.BuildScroll01():RefreshCells()
    end
end

---刷新建筑详情
function M:RefreshBuildDetails(idx)
    local info = ArkViewModel.HomeData[idx]
    local nextInfo = ArkControl.GetNextLevelBuildData(ArkViewModel.HomeData[idx].id)
    local player = PlayerControl.GetPlayerData()
    local coin = ItemControl.GetItemByIdAndType(tonumber(info.cost[2]),tonumber(info.cost[1]))
    self.Text_SheShi().text = info.name
    self.Text_BuildDesc().text = info.desc
    self.Text_CurBuildLv().text = info.level
    self.Text_NextBuildLv().text = info.level + 1 >= info.maxLevel and info.maxLevel or info.level + 1
    self.Text_buildPurpose().text = info.purposeTxt
    if info.level == info.maxLevel then
        self.ShengJi().gameObject:SetActive(false)
        self.Max().gameObject:SetActive(true)
        --self.Bianhua().gameObject:SetActive(false)
        self.ShengJiXinXi().gameObject:SetActive(false)
        self.XuQiu().gameObject:SetActive(false)
        self.Xiaohao().gameObject:SetActive(false)
        self.Img_Jiantou2().gameObject:SetActive(false)
        self.Text_You1().gameObject:SetActive(false)
        self.Img_Jiantou3().gameObject:SetActive(false)
        self.Text_You2().gameObject:SetActive(false)
        self.Text_buildPurpose().gameObject:SetActive(false)
        self.Btn_ShengJi().gameObject:SetActive(false)
        self.Text_PoolExplain().gameObject:SetActive(false)
        if idx == ArkControl.ArkType.expedition then  --如果是远征
            self.Text_Zuo1().text = info.expeditionNum
            self.Text_Zuo2().text = info.expeditionTaskNum
            self.Text_BuildDesc1().text = MgrLanguageData.GetLanguageByKey("ark_ui_teamcount")
            self.Text_BuildDesc2().text = MgrLanguageData.GetLanguageByKey("ark_ui_maxteamcount")
        elseif idx == 202 then
        else
            self.Text_Zuo1().text = info.capacity
            self.Text_Zuo2().text = info:GetProdRate()
            self.Text_BuildDesc1().text = MgrLanguageData.GetLanguageByKey("ark_ui_limitstorehouse")
            self.Text_BuildDesc2().text = MgrLanguageData.GetLanguageByKey("ark_ui_productionspeed")
        end
    else
        self.ShengJi().gameObject:SetActive(true)
        self.Max().gameObject:SetActive(false)
        --self.Bianhua().gameObject:SetActive(true)
        self.ShengJiXinXi().gameObject:SetActive(true)
        self.XuQiu().gameObject:SetActive(true)
        self.Xiaohao().gameObject:SetActive(true)
        self.Img_Jiantou2().gameObject:SetActive(true)
        self.Text_You1().gameObject:SetActive(true)
        self.Img_Jiantou3().gameObject:SetActive(true)
        self.Text_You2().gameObject:SetActive(true)
        self.Text_buildPurpose().gameObject:SetActive(true)
        self.Btn_ShengJi().gameObject:SetActive(true)
        if idx == ArkControl.ArkType.expedition then  --如果是远征
            ---远征词条区分
            self.Text_BuildDesc1().text = MgrLanguageData.GetLanguageByKey("ark_ui_teamcount")
            self.Text_BuildDesc2().text = MgrLanguageData.GetLanguageByKey("ark_ui_maxteamcount")
            self.Text_Zuo1().text = info.expeditionNum
            self.Text_You1().text = nextInfo.expeditionNum
            self.Text_Zuo2().text = info.expeditionTaskNum
            self.Text_You2().text = nextInfo.expeditionTaskNum
            self.Text_PoolExplain().gameObject:SetActive(false)
            self.Img_Bai().gameObject:SetActive(true)
            self.Img_Hei().gameObject:SetActive(true)
        elseif idx == 202 then
            ---维护池词条区分
            self.Img_Bai().gameObject:SetActive(false)
            self.Img_Hei().gameObject:SetActive(false)
            self.Text_PoolExplain().gameObject:SetActive(true)
            self.Text_PoolExplain().text = MgrLanguageData.GetLanguageByKey("ui_home_washleveluptxt1")
        else
            self.Text_BuildDesc1().text = MgrLanguageData.GetLanguageByKey("ark_ui_limitstorehouse")
            self.Text_BuildDesc2().text = MgrLanguageData.GetLanguageByKey("ark_ui_productionspeed")
            self.Text_Zuo1().text = info.capacity
            self.Text_You1().text = nextInfo.capacity
            self.Text_Zuo2().text = info:GetProdRate()
            self.Text_You2().text = nextInfo:GetProdRate()
            self.Text_PoolExplain().gameObject:SetActive(false)
            self.Img_Bai().gameObject:SetActive(true)
            self.Img_Hei().gameObject:SetActive(true)
        end
        self.Text_NeedLv().text = player.level >= nextInfo.playerLevel and MgrLanguageData.GetLanguageByKey("ui_tips_1") ..nextInfo.playerLevel or string.format("<color=#FB2323>%s</color>",nextInfo.playerLevel)
        self.Text_NeedCoin().text = coin.count >= tonumber(nextInfo.cost[3]) and JNStrTool.numberAbbr(coin.count).."/"..nextInfo.cost[3] or string.format("<color=#FF0000>%s</color>/%s",JNStrTool.numberAbbr(coin.count),nextInfo.cost[3])
    end

    ---点击升级建筑
    UIEvent.LuaClick(self.Btn_ShengJi().gameObject,function()
        local nextData = ArkControl.GetNextLevelBuildData(ArkViewModel.HomeData[idx].id)  --下一级建筑信息
        if nextData == nil then
            return
        end
        if idx == ArkControl.ArkType.expedition then
            local taskList = ArkControl.GetPlayerExpeditionData()
            ---检测是否存在进行的远征
            for i, v in pairs(taskList) do
                for k, data in pairs(v) do
                    if data.status ~= 0 then
                        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ark_ui_paiqian"),1 }, true)
                        return
                    end
                end
            end
        end
        ---判断是否满足升级条件 满足条件发送升级请求
        if PlayerControl.GetPlayerData().level >= nextData.playerLevel and ItemControl.GetItemByIdAndType(tonumber(nextData.cost[2]),tonumber(nextData.cost[1])).count >= tonumber(nextData.cost[3]) then
            ArkViewModel.HomeBuildREQ(nextData.id,function()
                self:RefreshCoinCount()  --刷新货币数量
                self:RefreshPower()  --刷新体力
                self:AddUpgradeTimer(ArkViewModel.HomeData[idx])  --升级计时器
                --self:RefreshBuildDetails(idx)    --刷新右侧建筑详情UI
                self:ReloadBuildScroll()           --刷新建筑滑块
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_yangcheng_text109")},true)  --弹出升级成功框
                self:RefreshOfficeRedDot()
            end)
            self.ExpeditionType = false
        else
            if ItemControl.GetItemByIdAndType(tonumber(nextData.cost[2]),tonumber(nextData.cost[1])).count < tonumber(nextData.cost[3]) then
                ---弹出货币不足提示
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_home_levelupfailtips1")},true)
            end
            if PlayerControl.GetPlayerData().level < nextData.playerLevel then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_home_levelupfailtips2")},true)
            end
        end
    end)
end

---刷新看板娘详情
function M:RefreshDetails()
    if ArkViewModel.CurSpineObj then
        GameObject.Destroy(ArkViewModel.CurSpineObj)
    end
    if not self.CurArkItemData.unlock then
        ArkViewModel.GetRoleSpineToBox(self.LihuiPanel().gameObject,self.CurArkItemData.id,70/255,70/255,70/255)
        self.Btn_Gerenjuqing().gameObject.transform:Find("RedDotIcon").gameObject:SetActive(false)
        self.Btn_SwitchRole().gameObject.transform:Find("SwitchRedDotIcon").gameObject:SetActive(false)
        self.LockText().gameObject:SetActive(true)
        self.suo().gameObject:SetActive(true)
        self.DocContentText().gameObject:SetActive(false)
        self.Text_Huodetujing().gameObject:SetActive(true)
        self.Text_Tujing().text=self.CurArkItemData.unlocktxt
        self.Btn_Xihuan().gameObject:SetActive(false)
        self.JuqingSuoicon().gameObject:SetActive(true)
        self.Juqingicon().gameObject:SetActive(false)
    else
        if self.CurArkItemData.Plot  then
            self.Btn_Gerenjuqing().gameObject.transform:Find("RedDotIcon").gameObject:SetActive(false)
        else
            self.Btn_Gerenjuqing().gameObject.transform:Find("RedDotIcon").gameObject:SetActive(true)
        end
        --更新选择按钮红点
        local isRed = false
        for k,v in pairs(self.ArkItemDataList) do
            if v.unlock and v.Plot == false then
                isRed = true
                break
            end
        end
        self.Btn_SwitchRole().gameObject.transform:Find("SwitchRedDotIcon").gameObject:SetActive(isRed)


        ArkViewModel.GetRoleSpineToBox(self.LihuiPanel().gameObject,self.CurArkItemData.id)
        self.LockText().gameObject:SetActive(false)
        self.suo().gameObject:SetActive(false)
        self.DocContentText().gameObject:SetActive(true)
        self.Text_Huodetujing().gameObject:SetActive(false)
        self.DocContentText().text=self.CurArkItemData.profiles
        self.Btn_Xihuan().gameObject:SetActive(true)
        if self.CurArkItemData.like then
            self.Xihuanicon().gameObject:SetActive(true)
            self.Xihuaniconhui().gameObject:SetActive(false)
        else
            self.Xihuanicon().gameObject:SetActive(false)
            self.Xihuaniconhui().gameObject:SetActive(true)
        end
        if tonumber(self.CurArkItemData.charplot)==0 then
            self.JuqingSuoicon().gameObject:SetActive(true)
            self.Juqingicon().gameObject:SetActive(false)
        else
            self.JuqingSuoicon().gameObject:SetActive(false)
            self.Juqingicon().gameObject:SetActive(true)
        end
    end
end

---刷新体力
function M:RefreshPower()
    ---如果当前界面已关闭不去刷新
    if self.UState == UIState.Hide or self.UState == UIState.Close then
        return
    end
    ---体力校准
    Global.TiliCalibration()

    self.maxPower = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    self.curPower = PlayerControl.GetPlayerData().vigor.vigorNum
    self.Text_Dunbishu().text = self.curPower.."/"..self.maxPower
    self:InitClock()
end
function M:InitClock()
    MgrTimer.Cancel("PowerClock")

    local DiffTime
    if self.curPower < self.maxPower then
        local NewTime = Global.GetCurTime()     ---当前服务器时间
        DiffTime = NewTime - PlayerControl.GetPlayerData().vigor.vigorTime
    end
    ---时钟
    self.curTime =  tonumber(SteamLocalData.tab[104004][2])
    local tarHour,tarMin,tarSec = self:CheckTime()
    local min = self.curTime / 60 - 1
    local sec = 60
    if DiffTime and DiffTime > 0 then
        print("时间差+++++++++++++++",DiffTime)
        local s = DiffTime % 60
        local m = math.floor(DiffTime % 3600 / 60)
        sec = sec - s
        tarSec = 60 - s
        tarMin = tarMin - m - 1
        min = min - m
    end
    MgrTimer.AddRepeat("PowerClock", 1, Handle(self,function()
        if self.curPower >= self.maxPower then
            self.Text_TargetTime().text = "00:00:00"
            self.Text_PowerClock().text = "00:00:00"
            return
        end
        if sec == 0 then
            min = min -1
            sec = 60
        end
        if tarSec == 0 then
            if tarMin > 0 then
                tarMin = tarMin -1
            else
                tarMin = 0
            end
            tarSec = 60
        end
        if tarMin == 0 then
            tarHour = tarHour - 1
            if tarHour >= 0 then
                tarMin = 59
            else
                tarHour = 0
                tarMin = 0
                tarSec = 0
            end
        end
        if min == -1 then
            PlayerControl.GetPlayerData().vigor.vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + 1
            PlayerControl.GetPlayerData().vigor.vigorTime = PlayerControl.GetPlayerData().vigor.vigorTime + tonumber(SteamLocalData.tab[104004][2])
            self.maxPower = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
            self.curPower = PlayerControl.GetPlayerData().vigor.vigorNum
            self.Text_Dunbishu().text =self.curPower.."/"..self.maxPower
            self:RefreshCoinCount()
            min = self.curTime/60 - 1
        end
        sec = sec - 1
        tarSec = tarSec -1
        self.Text_PowerClock().text = string.format("%02d:%02d:%02d",0,min,sec)
        self.Text_TargetTime().text =  string.format("%02d:%02d:%02d",tarHour,tarMin,tarSec)
    end) , -1, nil)
end

function M:CheckTime()
    local tiLi =self.maxPower - self.curPower     --要恢复的体力
    if tiLi<=0 then
        return 0,0,0
    end
    local ts = tiLi * 300
    local seconds = ts % 60
    local min = math.modf(ts % 3600 / 60)
    local hour = math.floor(ts/3600)
    return hour,min,seconds
end

---获取远征数据请求
function M:GetHomeExpedition()
    if not SysLockControl.CheckSysLock(1605) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text53"),1},true)
        return
    end
    if ArkViewModel.HomeData[ArkControl.ArkType.expedition].level == 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("home_ui_tips5"),1},true)
        return
    end
    if ArkViewModel.HomeData[ArkControl.ArkType.expedition]:GetBuildState() == false then
        ArkViewModel.GetHomeExpedition(ArkViewModel.HomeData[ArkControl.ArkType.expedition].id,Handle(self,self.GetHomeExpeditionACK),Handle(self,self.GetHomeExpeditionNTF))
    else
        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ark_ui_upgradingtips"),ArkViewModel.HomeData[ArkControl.ArkType.expedition].name),1},true)
    end
end
---刷新远征
function M:RefreshHomeExpedition()
    ArkViewModel.GetHomeExpedition(ArkViewModel.HomeData[ArkControl.ArkType.expedition].id,Handle(self,self.GetHomeExpeditionACK),Handle(self,self.GetHomeExpeditionNTF))
end

---开始远征请求
function M:SendStartHomeExpedition(expedition,hId)
    local tExpeditions = {}
    for i, v in ipairs(expedition) do
        local tData = {
            expeditionId = v.id,
            heroIds = v.heroIds,
            homeId = hId
        }
        table.insert(tExpeditions, tData)
    end
    local BaseREQ = {
        expeditions = tExpeditions
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientStartHomeExpeditionREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_START_HOME_EXPEDITION_REQ,bytes,0,nil, Handle(self,self.StartHomeExpeditionACK),Handle(self,self.StartHomeExpeditionNTF))
end
---开始远征回调
function M:StartHomeExpeditionACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientStartHomeExpeditionACK',buffer))
    print(tab.errNo)
    if tab.errNo == 591 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips5"),1},true)
    end
end
function M:StartHomeExpeditionNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientStartHomeExpeditionNTF',buffer))
    if tab.expeditionInfos then
        for i, v in ipairs(tab.expeditionInfos) do
            ArkControl.PushPlayerExpeditionData(v.id, v)
            ---清空相应组ID的远征的角色
            local tCurExpData = ArkControl.GetExpeditionDataByID(v.id)
            ArkControl.ClearSingleExpeditionRole(tCurExpData.group)
        end
        self:RefreshHomeExpedition()
    end
    ---更新统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
end

---取消远征
function M:CancelHomeExpeditionREQ(id)
    local BaseREQ = {
        Ids = {
            [1] = id
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientCancelHomeExpeditionREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_CANCEL_HOME_EXPEDITION_REQ,bytes,0,nil, Handle(self,self.StartHomeExpeditionACK),Handle(self,self.StartHomeExpeditionNTF))
end

function M:CancelHomeExpeditionACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientCancelHomeExpeditionACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips1")..tab.errNo,2},true)
    end
end

function M:CancelHomeExpeditionNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientCancelHomeExpeditionNTF',buffer))
    if(tab.expeditionInfos) then
        self:RefreshHomeExpedition()
    end
end

---获取家园远征信息返回
function M:GetHomeExpeditionACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetHomeExpeditionACK',buffer))
    print(tab.errNo)
end
function M:GetHomeExpeditionNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetHomeExpeditionNTF',buffer))
    --print(tab.expeditionInfos)
    ArkViewModel.sTaskData = tab.expeditionInfos or {}
    self.stopExpand = true  --所有远征item收起
    self.ArkExpeditionPanel().gameObject:SetActive(true)
    self:ReloadExpeditionData(ArkViewModel.TaskData,0)
end
---家园收获回调
function M:HomeReapACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientHomeReapACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ark_ui_tips5")..tab.errNo},true)
    end
end
function M:HomeReapNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientHomeReapNTF',buffer))
    if tab then
        ---推送新建筑数据
        for k,v in pairs(tab.homeUP) do
            ArkControl.PushBuildDataByReap(v.homeId,v.uTime)
        end
        ---刷新缓存数据
        ArkViewModel.ReloadCacheData()
        if(tab.goods) then
            for k,v in pairs(tab.goods) do
                ---如果是体力
                if v.goodsID == 100001 and v.goodsType == 4 then
                    PlayerControl.GetPlayerData().vigor.vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + v.goodsNum
                else
                    ---更新物品奖励
                    ItemControl.PushSingleItemData(v,ItemControl.PushEnum.add)
                end
            end
            ---弹出奖励窗口
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
        end
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---刷新货币
        self:RefreshCoinCount()
        ---推送体力
        if tab.vigor then
            PlayerControl.GetPlayerData():PushVigor(tab.vigor)
        end
        ---刷新体力
        self:RefreshPower()
        self:RefreshUI()
    end
end
---更换看板娘
function M:SendChooseHomeRole(roleID,MakeCount,callBack)
    local HomeRoleREQ =  {
        roleID=roleID
    }
    local bytes = assert(pb.encode('PBClient.ClientChooseHomeRoleREQ',HomeRoleREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_CHOOSE_HOME_ROLE_REQ,bytes,0,nil,Handle(self, self.ChooseHomeRoleACK),Handle(self, self.ChooseHomeRoleNTF))
end
function M:ChooseHomeRoleACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseHomeRoleACK',buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ark_ui_changefail"),1},true)
    end
end
function M:ChooseHomeRoleNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChooseHomeRoleNTF',buffer))
    if tab then
        ArkViewModel.CurRole=tab.roleID
        ArkViewModel.SetArkRoleChoose()
    end
    if self.CurArkItemData then
        self.CurArkItemData.isSelect = false
        self.CurArkItemData.isSelect = nil
    end
    self:ReloadArkItemData(0,true)
end

---刷新模板
function M:RefreshTemplate(root,num)
    for i = 1 ,root.transform.childCount do
        if i <= num then
            root.transform:GetChild(i - 1).gameObject:SetActive(true)
        else
            root.transform:GetChild(i - 1).gameObject:SetActive(false)
        end
    end
end

---刷新维护池进入次数
function M:RefreshEnterCount()
    local mMaxCount = ArkViewModel.BackRubInfo.maxCount
    local mPlayCount = mMaxCount - ArkViewModel.CurBackRubCount
    self:RefreshTemplate(self.EnterCountPanel().gameObject,mMaxCount)  --总次数
    self:RefreshTemplate(self.CurCountPanel().gameObject,mPlayCount)   --当前可用次数
end

---初始化远征动画
function M:InitExpeditionAni()
    --self.expeditionAni = self.ProgressAni().transform:GetComponent("Animation")
    MgrTimer.AddRepeat("ExpeditionAni",1,function()
        if ArkViewModel.GetExpeditionNum() > 0 then  --正在远征的人数大于0
            --if self.expeditionAni.isPlaying == false then  --如果不在播放就开始播放动画
                --self.expeditionAni:Play()
            self.ProgressAni().gameObject:SetActive(true)
            --end
        else
            --self.expeditionAni:Stop()
            self.ProgressAni().gameObject:SetActive(false)
        end
    end,-1,nil)
end

---立绘平移
function M:SpineMove(_TargetPosX, _Duration)
    Tools.TweenDoLocalMoveX(self.LihuiPanel().gameObject, _TargetPosX, _Duration, -1)
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    ---关闭看板娘语音
    MgrSound.Stop(3,tostring(ArkViewModel.CurRole),false)
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("PowerClock")
    MgrTimer.Cancel("ArkUIUpdate")
    MgrTimer.Cancel("BuildInfoUpdate")
    MgrTimer.Cancel("LongPressPower")
    MgrTimer.Cancel("ArkRoleVoice2")
    MgrTimer.Cancel("ArkRoleVoice")
    MgrTimer.Cancel("ExpeditionAni")
    ---清理升级计时器
    self:ClearUpgradeTimer()
    if self.CurArkItemData then
        self.CurArkItemData.isSelect = false
        self.CurArkItemData.isSelect = nil
    end
    ---关闭界面时关闭看板娘语音
    MgrSound.Stop(3,tostring(ArkViewModel.CurRole),false)
end

function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---刷新货币
    self:RefreshCoinCount()
    ---刷新搓澡次数
    self:RefreshEnterCount()

    self:RefreshOfficeRedDot()
end

--刷新办公室红点
function M:RefreshOfficeRedDot()
    local isShow = false
    local tab= {}
    local player = PlayerControl.GetPlayerData()
    for k,v in pairs(ArkViewModel.HomeData) do
        if v.canUp == 0 then  --如果建筑可升级
            table.insert(tab,v)
            local nextInfo = ArkControl.GetNextLevelBuildData(v.id)
            local info = ArkViewModel.HomeData[v.buildType]
            local coin = ItemControl.GetItemByIdAndType(tonumber(info.cost[2]),tonumber(info.cost[1]))
            if nextInfo and player.level >= nextInfo.playerLevel and coin.count >= tonumber(nextInfo.cost[3]) then
                isShow = true
                break
            end
        end
    end
    ArkControl.CheckRedPoint()
    self.OffoceRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("PersonalPlot").State)

end

function M:OnBackKey()
    local isRolePanel = self.RolePanel().gameObject.activeSelf
    local isAssistantPanel = self.AssistantPanel().gameObject.activeSelf --能源补充界
    local isArkExpeditionPanel = self.ArkExpeditionPanel().gameObject.activeSelf --远征探索
    
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if isRolePanel then
            self.RolePanel().gameObject:SetActive(false)
            return
        end
        if isAssistantPanel then
            self:SpineMove(-614,0.3)
            self.AssistantPanel().gameObject:SetActive(false)
            if ArkViewModel.CurSpineObj then
                GameObject.Destroy(ArkViewModel.CurSpineObj)
            end
            if self.CurArkItemData then
                self.CurArkItemData.isSelect = false
                self.CurArkItemData.isSelect = nil
            end
            if ArkViewModel.CurRole and ArkViewModel.CurRole~= 0 then
                ArkViewModel.GetRoleSpineToBox(self.SpritePanel().gameObject,ArkViewModel.CurRole)
                ArkViewModel.SetRoleSpineButton(self.RoleBtn1().gameObject,self.RoleBtn2().gameObject,self.RoleBtn3().gameObject,self.RoleVoiceWordText(),self.ObjRoot)
            end
            MgrSound.Stop(3,tostring(self.CurArkItemData.id),false)
            self:AssistantBut()
            ArkViewModel.CurArkItemIndex=0
            return
        end
        if isArkExpeditionPanel then
            self.ArkExpeditionPanel().gameObject:SetActive(false)
            return
        end
        MgrUI.GoBack()
    end
end

function M:ChooseItem(index)
    self.ExpeditionScroll01():ChooseItem(index)
end
return M