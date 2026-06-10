-- Code Auto Create Begin
local M = Class('Event4Boss_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Event4Boss_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Event4Boss_UI].prefab'
    self.Name = 'Form[Event4Boss_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'SwitchPanel','SwitchPanel',2},{'Btn_logan_Shop','SwitchPanel/Btn_logan_Shop',2},{'ShopRedDotIcon','SwitchPanel/Btn_logan_Shop/ShopRedDotIcon',2},{'Btn_logan_Task','SwitchPanel/Btn_logan_Task',2},{'MissionRedDotIcon','SwitchPanel/Btn_logan_Task/MissionRedDotIcon',2},{'Btn_logan_Xinbian','SwitchPanel/Btn_logan_Xinbian',2},{'Xinbian_RedDotIcon','SwitchPanel/Btn_logan_Xinbian/Xinbian_RedDotIcon',2},{'Main_Boss','Main_Boss',2},{'di','Main_Boss/di',2},{'BossTicket','Main_Boss/BossTicket',2},{'Img_di','Main_Boss/BossTicket/Img_di',2},{'Icon','Main_Boss/BossTicket/Icon',2},{'BossTips','Main_Boss/BossTips',2},{'Btn_Chakan','Main_Boss/BossTips/Text_BossName/Btn_Chakan',2},{'Img_Chakanicon1','Main_Boss/BossTips/Text_BossName/Btn_Chakan/Img_Chakanicon1',2},{'Biaoti','Main_Boss/BossTips/Biaoti',2},{'ShowBossPanel','Main_Boss/ShowBossPanel',2},{'BossPopBtn','Main_Boss/ShowBossPanel/BossPopBtn',2},{'BossLock','Main_Boss/ShowBossPanel/BossPopBtn/Nandu/BossLock',2},{'BossPop','BossPop',2},{'Mask','BossPop/Mask',2},{'BossPopBg','BossPop/BossPopBg',2},{'Titledi','BossPop/BossPopBg/Titledi',2},{'Img_Tiao','BossPop/BossPopBg/Text_Title/Img_Tiao',2},{'Btn_Guanbi','BossPop/BossPopBg/Btn_Guanbi',2},{'Img_xian','BossPop/BossPopBg/Text_BossPopName/Img_xian',2},{'Btn_Wenhao','BossPop/BossPopBg/Text_Chubeixuqiu/Btn_Wenhao',2},{'Img_Nengyuan','BossPop/BossPopBg/DangqianChubeizhi/Img_Nengyuan',2},{'Btn_InBoss','BossPop/BossPopBg/Btn_InBoss',2},{'Btn_di','BossPop/BossPopBg/Btn_InBoss/Btn_di',2},{'CostTicket','BossPop/BossPopBg/Btn_InBoss/CostTicket',2},{'Img_CostIcon','BossPop/BossPopBg/Btn_InBoss/CostTicket/Img_CostIcon',2},{'TipsPanel2','BossPop/BossPopBg/TipsPanel2',2},{'Tiaojian','BossPop/BossPopBg/TipsPanel2/Tiaojian',2},{'Img_xian01','BossPop/BossPopBg/TipsPanel2/Tiaojian/Text_Tiaojian/Img_xian',2},{'Img_BossStar_1','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_1/Img_BossStar_1',2},{'Highlight_1','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_1/Img_BossStar_1/Highlight_1',2},{'Img_BossStar_2','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_2/Img_BossStar_2',2},{'Highlight_2','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_2/Img_BossStar_2/Highlight_2',2},{'Img_BossStar_3','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_3/Img_BossStar_3',2},{'Highlight_3','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_3/Img_BossStar_3/Highlight_3',2},{'Img_xian02','BossPop/BossPopBg/TipsPanel2/Diaoluo/Text_Diaoluo/Img_xian',2},{'TipsPop','BossPop/TipsPop',2},{'TipsPopMask','BossPop/TipsPop/TipsPopMask',2},{'TipsPopBG','BossPop/TipsPop/TipsPopBG',2},{'Img_xian03','BossPop/TipsPop/Text_Shuoming/Img_xian',2},{'TipsContent','BossPop/TipsPop/TipsContent',2},{'NengyuanItem','BossPop/TipsPop/TipsContent/NengyuanItem',2},{'Img_di01','BossPop/TipsPop/TipsContent/NengyuanItem/Img_di',2},{'Img_Icon','BossPop/TipsPop/TipsContent/NengyuanItem/Img_Icon',2},
        -- Text 列表
        {'Text_Taofamubiao','Main_Boss/BossTips/Biaoti/Text_Taofamubiao',3},{'Text_CrusadeTarget','Main_Boss/BossTips/Biaoti/Text_CrusadeTarget ',3},
        -- Button 列表
        {'Btn_ShowBoss','Main_Boss/BossTips/Text_BossName/Btn_ShowBoss',4},
        -- UITemplate 列表
        {'PointRewardsItem','BossPop/BossPopBg/TipsPanel2/Diaoluo/BossRewardsScroll/PointRewardsItem',10},
        -- RawImage 列表
        {'Btn_ShowBoss01','Main_Boss/BossTips/Text_BossName/Btn_ShowBoss',15},{'BossRewardsScroll','BossPop/BossPopBg/TipsPanel2/Diaoluo/BossRewardsScroll',15},{'RewardsContent','BossPop/BossPopBg/TipsPanel2/Diaoluo/BossRewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'BossRewardsScroll01','BossPop/BossPopBg/TipsPanel2/Diaoluo/BossRewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_Shu','Main_Boss/BossTicket/Text_Shu',20},{'Text_BossName','Main_Boss/BossTips/Text_BossName',20},{'Text_Nanduxuanze','Main_Boss/Text_Nanduxuanze',20},{'Text_BossNandu','Main_Boss/ShowBossPanel/BossPopBtn/Nandu/Text_BossNandu',20},{'Text_TuijianLv','Main_Boss/ShowBossPanel/BossPopBtn/Text_TuijianLv',20},{'Text_Title','BossPop/BossPopBg/Text_Title',20},{'Text_BossPopName','BossPop/BossPopBg/Text_BossPopName',20},{'Text_PopTuijianLv','BossPop/BossPopBg/Text_PopTuijianLv',20},{'Text_Chubeixuqiu','BossPop/BossPopBg/Text_Chubeixuqiu',20},{'Text_Dangqian','BossPop/BossPopBg/DangqianChubeizhi/Text_Dangqian',20},{'Text_Nengyuan','BossPop/BossPopBg/DangqianChubeizhi/Text_Nengyuan',20},{'Text_Zhi','BossPop/BossPopBg/DangqianChubeizhi/Text_Zhi',20},{'Text_InPoint','BossPop/BossPopBg/Btn_InBoss/Text_InPoint',20},{'Text_BCNum','BossPop/BossPopBg/Btn_InBoss/CostTicket/Text_BCNum',20},{'Text_Tiaojian','BossPop/BossPopBg/TipsPanel2/Tiaojian/Text_Tiaojian',20},{'Text_BossTask_1','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_1/Text_BossTask_1',20},{'Text_BossTask_2','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_2/Text_BossTask_2',20},{'Text_BossTask_3','BossPop/BossPopBg/TipsPanel2/Tiaojian/Img_StarTask_3/Text_BossTask_3',20},{'Text_Diaoluo','BossPop/BossPopBg/TipsPanel2/Diaoluo/Text_Diaoluo',20},{'Text_Shuoming','BossPop/TipsPop/Text_Shuoming',20},{'Text_Qujian','BossPop/TipsPop/TipsContent/NengyuanItem/Text_Qujian',20},{'Text_Shuoming01','BossPop/TipsPop/TipsContent/NengyuanItem/Text_Shuoming',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TipsPop().gameObject:SetActive(false)
    self.BossPop().gameObject:SetActive(false)

    self.BossData = Event4Control.GetBossChapterData()
    self.CurActID = Event4Control.GetCurActID()
    ---星星组
    self.StarGroup = {
        [1] = { Star = self.Highlight_1(), Condition = self.Text_BossTask_1() },
        [2] = { Star = self.Highlight_2(), Condition = self.Text_BossTask_2() },
        [3] = { Star = self.Highlight_3(), Condition = self.Text_BossTask_3() }
    }

    EventBossView.Init(self)
    self:InitButton()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        StormViewModel.CurPointData = nil
        BattleManager.CurActivityBossHp = 0
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        StormViewModel.CurPointData = nil
        BattleManager.CurActivityBossHp = 0
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(Event4Control.GetEvent4Data()[self.CurActID].group)
    end)
    ---扭蛋机
    UIEvent.LuaClick(self.Btn_logan_Shop().gameObject, function()
        Event4Control.OpenShop()
    end)
    ---任务
    UIEvent.LuaClick(self.Btn_logan_Task().gameObject, function()
        Event4Control.OpenTask()
    end)
    ---星变
    UIEvent.LuaClick(self.Btn_logan_Xinbian().gameObject, function()
        Event4Control.OpenXingBian()
    end)
    ---查看Boss
    UIEvent.LuaClick(self.Btn_ShowBoss().gameObject,function()
        MgrUI.Pop(UID.BossXiangqing_UI,{Event4Control.GetBossData()},true)
    end)
    ---关闭BossPop
    UIEvent.LuaClick(self.Btn_Guanbi().gameObject,function()
        self.BossPop().gameObject:SetActive(false)
    end)
    UIEvent.LuaClick(self.Mask().gameObject,function()
        self.BossPop().gameObject:SetActive(false)
    end)
    ---储备需求弹窗展开
    UIEvent.LuaClick(self.Btn_Wenhao().gameObject, function()
        self.TipsPop().gameObject:SetActive(true)
    end)
    ---储备需求弹窗关闭
    UIEvent.LuaClick(self.TipsPopMask().gameObject, function()
        self.TipsPop().gameObject:SetActive(false)
    end)
end

function M:OnUpdateUI()
    EventBossView:OnUpdateUI()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        StormViewModel.CurPointData = nil
        BattleManager.CurActivityBossHp = 0
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M