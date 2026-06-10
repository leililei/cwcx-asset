-- Code Auto Create Begin
local M = Class('Event4Levels_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Event4Levels_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Event4Levels_UI].prefab'
    self.Name = 'Form[Event4Levels_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'UpperRightPanel','UpperRightPanel',2},{'Power','UpperRightPanel/Power',2},{'Img_PowerBG','UpperRightPanel/Power/Img_PowerBG',2},{'Btn_Add','UpperRightPanel/Power/Btn_Add',2},{'Img_Tiliicon','UpperRightPanel/Power/Img_Tiliicon',2},{'SwitchPanel','SwitchPanel',2},{'Btn_Shop','SwitchPanel/Btn_Shop',2},{'ShopRedDotIcon','SwitchPanel/Btn_Shop/ShopRedDotIcon',2},{'Btn_Task','SwitchPanel/Btn_Task',2},{'MissionRedDotIcon','SwitchPanel/Btn_Task/MissionRedDotIcon',2},{'Btn_Xingbian','SwitchPanel/Btn_Xingbian',2},{'Xinbian_RedDotIcon','SwitchPanel/Btn_Xingbian/Xinbian_RedDotIcon',2},{'Chapters','Main_Levels/Chapters',2},{'Chapter1','Main_Levels/Chapters/Chapter1',2},{'btn_event4_new','Main_Levels/Chapters/Chapter1/btn_event4_new',2},{'Mask_lock','Main_Levels/Chapters/Chapter1/Mask_lock',2},{'txt_monument','Main_Levels/Chapters/Chapter1/txt_monument',2},{'Select','Main_Levels/Chapters/Chapter1/Select',2},{'Map_lock','Main_Levels/Chapters/Chapter1/Map_lock',2},{'Chapter2','Main_Levels/Chapters/Chapter2',2},{'btn_event4_new01','Main_Levels/Chapters/Chapter2/btn_event4_new',2},{'Mask_lock01','Main_Levels/Chapters/Chapter2/Mask_lock',2},{'txt_residentialarea','Main_Levels/Chapters/Chapter2/txt_residentialarea',2},{'Select01','Main_Levels/Chapters/Chapter2/Select',2},{'Map_lock01','Main_Levels/Chapters/Chapter2/Map_lock',2},{'Chapter3','Main_Levels/Chapters/Chapter3',2},{'btn_event4_new02','Main_Levels/Chapters/Chapter3/btn_event4_new',2},{'Mask_lock02','Main_Levels/Chapters/Chapter3/Mask_lock',2},{'txt_petshop','Main_Levels/Chapters/Chapter3/txt_petshop ',2},{'Select02','Main_Levels/Chapters/Chapter3/Select',2},{'Map_lock02','Main_Levels/Chapters/Chapter3/Map_lock',2},{'Chapter4','Main_Levels/Chapters/Chapter4',2},{'btn_event4_new03','Main_Levels/Chapters/Chapter4/btn_event4_new',2},{'Mask_lock03','Main_Levels/Chapters/Chapter4/Mask_lock',2},{'txt_street','Main_Levels/Chapters/Chapter4/txt_street',2},{'Select03','Main_Levels/Chapters/Chapter4/Select',2},{'Map_lock03','Main_Levels/Chapters/Chapter4/Map_lock',2},{'Chapter5','Main_Levels/Chapters/Chapter5',2},{'btn_event4_new04','Main_Levels/Chapters/Chapter5/btn_event4_new',2},{'Mask_lock04','Main_Levels/Chapters/Chapter5/Mask_lock',2},{'txt_aerodrome','Main_Levels/Chapters/Chapter5/txt_aerodrome',2},{'Select04','Main_Levels/Chapters/Chapter5/Select',2},{'Map_lock04','Main_Levels/Chapters/Chapter5/Map_lock',2},{'Chapter6','Main_Levels/Chapters/Chapter6',2},{'btn_event4_new05','Main_Levels/Chapters/Chapter6/btn_event4_new',2},{'Mask_lock05','Main_Levels/Chapters/Chapter6/Mask_lock',2},{'txt_amusementpark','Main_Levels/Chapters/Chapter6/txt_amusementpark',2},{'Select05','Main_Levels/Chapters/Chapter6/Select',2},{'Map_lock05','Main_Levels/Chapters/Chapter6/Map_lock',2},{'SelectPoint','Main_Levels/SelectPoint',2},{'bg_map_task','Main_Levels/SelectPoint/bg_map_task',2},{'title','Main_Levels/SelectPoint/title',2},{'Img_TextTitle','Main_Levels/SelectPoint/title/Img_TextTitle',2},{'Img_Chapter','Main_Levels/SelectPoint/title/Img_Chapter',2},{'LevelScroll','Main_Levels/SelectPoint/LevelScroll',2},{'LevelItem','Main_Levels/SelectPoint/LevelScroll/LevelItem',2},{'Btn_state_lock','Main_Levels/SelectPoint/LevelScroll/LevelItem/Btn_state_lock',2},{'Btn_state_clear','Main_Levels/SelectPoint/LevelScroll/LevelItem/Btn_state_clear',2},{'Btn_state_normal','Main_Levels/SelectPoint/LevelScroll/LevelItem/Btn_state_normal',2},{'icon_repeat','Main_Levels/SelectPoint/LevelScroll/LevelItem/icon_repeat',2},{'Content','Main_Levels/SelectPoint/LevelScroll/Content',2},{'Content01','Main_Levels/SelectPoint/LevelScroll/Content',2},{'LevelsPop','LevelsPop',2},{'LevelPopMask','LevelsPop/LevelPopMask',2},{'BossPopBg','LevelsPop/BossPopBg',2},{'Titledi','LevelsPop/BossPopBg/Titledi',2},{'Img_Tiao','LevelsPop/BossPopBg/Text_Title/Img_Tiao',2},{'Btn_Guanbi','LevelsPop/BossPopBg/Btn_Guanbi',2},{'Img_xian','LevelsPop/BossPopBg/Text_BossPopName/Img_xian',2},{'TipsPanel','LevelsPop/BossPopBg/TipsPanel',2},{'TipsPanel1','LevelsPop/BossPopBg/TipsPanel/TipsPanel1',2},{'Btn_Wenhao','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/Text_Chubeixuqiu/Btn_Wenhao',2},{'Img_Nengyuan','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/DangqianChubeizhi/Img_Nengyuan',2},{'TipsPanel2','LevelsPop/BossPopBg/TipsPanel/TipsPanel2',2},{'Tiaojian','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian',2},{'Img_xian01','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Text_Tiaojian/Img_xian',2},{'Img_BossStar_1','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_1/Img_BossStar_1',2},{'Highlight_1','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_1/Img_BossStar_1/Highlight_1',2},{'Img_BossStar_2','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_2/Img_BossStar_2',2},{'Highlight_2','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_2/Img_BossStar_2/Highlight_2',2},{'Img_BossStar_3','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_3/Img_BossStar_3',2},{'Highlight_3','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_3/Img_BossStar_3/Highlight_3',2},{'Juqing','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Juqing',2},{'Img_xian02','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Juqing/Text_Juqing/Img_xian',2},{'Img_xian03','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Diaoluo/Text_Diaoluo/Img_xian',2},{'Btn_InLevels','LevelsPop/Btn_InLevels',2},{'Btn_di','LevelsPop/Btn_InLevels/Btn_di',2},{'CostTicket','LevelsPop/Btn_InLevels/CostTicket',2},{'Img_CostIcon','LevelsPop/Btn_InLevels/CostTicket/Img_CostIcon',2},{'Btn_InLevels2','LevelsPop/Btn_InLevels2',2},{'Btn_di01','LevelsPop/Btn_InLevels2/Btn_di',2},{'CostTicket01','LevelsPop/Btn_InLevels2/CostTicket',2},{'Img_CostIcon01','LevelsPop/Btn_InLevels2/CostTicket/Img_CostIcon',2},{'Btn_Fast','LevelsPop/Btn_Fast',2},{'Btn_di02','LevelsPop/Btn_Fast/Btn_di',2},{'SweepSuo','LevelsPop/Btn_Fast/Btn_Content/SweepSuo',2},{'TipsPop','LevelsPop/TipsPop',2},{'TipsPopMask','LevelsPop/TipsPop/TipsPopMask',2},{'TipsPopBG','LevelsPop/TipsPop/TipsPopBG',2},{'Img_xian04','LevelsPop/TipsPop/Text_Shuoming/Img_xian',2},{'TipsContent','LevelsPop/TipsPop/TipsContent',2},{'NengyuanItem','LevelsPop/TipsPop/TipsContent/NengyuanItem',2},{'Img_di','LevelsPop/TipsPop/TipsContent/NengyuanItem/Img_di',2},{'Img_Icon','LevelsPop/TipsPop/TipsContent/NengyuanItem/Img_Icon',2},
        -- UITemplate 列表
        {'PointRewardsItem','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Diaoluo/BossRewardsScroll/PointRewardsItem',10},
        -- RawImage 列表
        {'BossRewardsScroll','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Diaoluo/BossRewardsScroll',15},{'RewardsContent','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Diaoluo/BossRewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'LevelScroll01','Main_Levels/SelectPoint/LevelScroll',18},{'BossRewardsScroll01','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Diaoluo/BossRewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_ResTili','UpperRightPanel/Power/Text_ResTili',20},{'Text_LevelName','Main_Levels/SelectPoint/LevelScroll/LevelItem/Text_LevelName',20},{'Text_repeat','Main_Levels/SelectPoint/LevelScroll/LevelItem/icon_repeat/Text_repeat',20},{'Text_TuijianLv','Main_Levels/SelectPoint/LevelScroll/LevelItem/Text_TuijianLv',20},{'Text_Title','LevelsPop/BossPopBg/Text_Title',20},{'Text_BossPopName','LevelsPop/BossPopBg/Text_BossPopName',20},{'Text_TuijianLV','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/Text_TuijianLV',20},{'Text_Chubeixuqiu','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/Text_Chubeixuqiu',20},{'Text_Dangqian','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/DangqianChubeizhi/Text_Dangqian',20},{'Text_Nengyuan','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/DangqianChubeizhi/Text_Nengyuan',20},{'Text_Zhi','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/DangqianChubeizhi/Text_Zhi',20},{'Text_Tiaojian','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Text_Tiaojian',20},{'Text_BossTask_1','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_1/Text_BossTask_1',20},{'Text_BossTask_2','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_2/Text_BossTask_2',20},{'Text_BossTask_3','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_3/Text_BossTask_3',20},{'Text_Juqing','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Juqing/Text_Juqing',20},{'Text_Jianjie','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Juqing/Text_Jianjie',20},{'Text_Diaoluo','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Diaoluo/Text_Diaoluo',20},{'Text_InPoint','LevelsPop/Btn_InLevels/Text_InPoint',20},{'Text_CNum','LevelsPop/Btn_InLevels/CostTicket/Text_CNum',20},{'Text_InPoint01','LevelsPop/Btn_InLevels2/Text_InPoint',20},{'Text_BCNum','LevelsPop/Btn_InLevels2/CostTicket/Text_BCNum',20},{'Text_Saodang','LevelsPop/Btn_Fast/Btn_Content/Text_Saodang',20},{'Text_Shuoming','LevelsPop/TipsPop/Text_Shuoming',20},{'Text_Qujian','LevelsPop/TipsPop/TipsContent/NengyuanItem/Text_Qujian',20},{'Text_Shuoming01','LevelsPop/TipsPop/TipsContent/NengyuanItem/Text_Shuoming',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.LevelsPop().gameObject:SetActive(false)
    self.TipsPop().gameObject:SetActive(false)
    ---当前章节ID
    self.CurActID = Event4Control.GetCurActID()
    ---各个章节关卡数据
    self.ChapterData = Event4Control.GetChapterLevels()
    ---本次活动数据
    self.Event4Data = Event4Control.GetEvent4Data()[self.CurActID]
    ---章节按钮
    self.ChapterBtn = {}
    ---解锁章节数据
    self.UnlockChapter = {}
    ---当前章节ID
    self.CurChapterID = 0
    ---当前关卡
    self.CurlevelsID = 0
    ---关卡掉落
    self.RewardsList = nil
    ---星星组
    self.StarGroup = {
        [1] = { Star = self.Highlight_1(), Condition = self.Text_BossTask_1() },
        [2] = { Star = self.Highlight_2(), Condition = self.Text_BossTask_2() },
        [3] = { Star = self.Highlight_3(), Condition = self.Text_BossTask_3() }
    }
    ---需要添加扫荡标志的关卡
    self.SweepPoint = {}
    local tStr = string.split(SteamLocalData.tab[123001][2],',')
    for i, v in ipairs(tStr) do
        self.SweepPoint[tonumber(v)] = 1
    end
    --初始化
    EventLevelView.Init(self)
    
    self:InitBtn()
    ----初始化章节按钮
    --self:InitChapterBtn()
    ----更新章节信息
    --self:UpdataChapter()
    ---首次进入强制弹出帮助界面
    ActiveTutorialControl.ForcePopGuide(self.Event4Data.group)
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    ---退回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.Event4Data.group)
    end)
    ---拓展件
    UIEvent.LuaClick(self.Btn_Xingbian().gameObject, function()
        Event4Control.OpenXingBian()
    end)
    ---扭蛋
    UIEvent.LuaClick(self.Btn_Shop().gameObject, function()
        Event4Control.OpenShop()
    end)
    ---任务
    UIEvent.LuaClick(self.Btn_Task().gameObject, function()
        Event4Control.OpenTask()
    end)
    ---关卡信息弹窗关闭
    UIEvent.LuaClick(self.Btn_Guanbi().gameObject, function()
        self.LevelsPop().gameObject:SetActive(false)
    end)
    UIEvent.LuaClick(self.LevelPopMask().gameObject, function()
        self.LevelsPop().gameObject:SetActive(false)
    end)
    ---储备需求弹窗展开
    UIEvent.LuaClick(self.Btn_Wenhao().gameObject, function()
        self.TipsPop().gameObject:SetActive(true)
    end)
    ---储备需求弹窗关闭
    UIEvent.LuaClick(self.TipsPopMask().gameObject, function()
        self.TipsPop().gameObject:SetActive(false)
    end)
    ---刷新体力
    EventLevelView:RefreshCost()
    ---跳转体力信息面板
    UIEvent.LuaClick(self.Power().gameObject, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            EventLevelView:RefreshCost()
        end}, true)
    end,nil,self.Power())
end

function M:OnUpdateUI()
    EventLevelView:OnUpdateUI()
end

function M:OnClose()
    Event4Control.SaveToutchLevel()
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M