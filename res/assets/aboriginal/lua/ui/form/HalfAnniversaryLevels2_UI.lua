-- Code Auto Create Begin
local M = Class('HalfAnniversaryLevels2_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryLevels2_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryLevels2_UI].prefab'
    self.Name = 'Form[HalfAnniversaryLevels2_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'UpperRightPanel','UpperRightPanel',2},{'Power','UpperRightPanel/Power',2},{'Img_PowerBG','UpperRightPanel/Power/Img_PowerBG',2},{'Btn_Add','UpperRightPanel/Power/Btn_Add',2},{'Img_Tiliicon','UpperRightPanel/Power/Img_Tiliicon',2},{'SwitchPanel','SwitchPanel',2},{'Btn_Shop','SwitchPanel/Btn_Shop',2},{'Shop_Img','SwitchPanel/Btn_Shop/Shop_Img',2},{'ShopRedDotIcon','SwitchPanel/Btn_Shop/Shop_Img/ShopRedDotIcon',2},{'Shop_Text','SwitchPanel/Btn_Shop/Shop_Text',2},{'Btn_Task','SwitchPanel/Btn_Task',2},{'Mission_Img','SwitchPanel/Btn_Task/Mission_Img',2},{'MissionRedDotIcon','SwitchPanel/Btn_Task/Mission_Img/MissionRedDotIcon',2},{'Mission_Text','SwitchPanel/Btn_Task/Mission_Text',2},{'Chapters','Main_Levels/Chapters',2},{'Chapter1','Main_Levels/Chapters/Chapter1',2},{'Normal','Main_Levels/Chapters/Chapter1/Normal',2},{'Select','Main_Levels/Chapters/Chapter1/Select',2},{'img_Selectkuang','Main_Levels/Chapters/Chapter1/Select/img_Selectkuang',2},{'txt_monument','Main_Levels/Chapters/Chapter1/txt_monument',2},{'Mask_lock','Main_Levels/Chapters/Chapter1/Mask_lock',2},{'Map_lock','Main_Levels/Chapters/Chapter1/Mask_lock/Map_lock',2},{'img_zhangjiexian','Main_Levels/Chapters/Chapter1/img_zhangjiexian',2},{'btn_event4_new','Main_Levels/Chapters/Chapter1/btn_event4_new',2},{'Chapter2','Main_Levels/Chapters/Chapter2',2},{'Normal01','Main_Levels/Chapters/Chapter2/Normal',2},{'Select01','Main_Levels/Chapters/Chapter2/Select',2},{'img_Selectkuang01','Main_Levels/Chapters/Chapter2/Select/img_Selectkuang',2},{'txt_monument01','Main_Levels/Chapters/Chapter2/txt_monument',2},{'Mask_lock01','Main_Levels/Chapters/Chapter2/Mask_lock',2},{'Map_lock01','Main_Levels/Chapters/Chapter2/Mask_lock/Map_lock',2},{'img_zhangjiexian01','Main_Levels/Chapters/Chapter2/img_zhangjiexian',2},{'btn_event4_new01','Main_Levels/Chapters/Chapter2/btn_event4_new',2},{'Chapter3','Main_Levels/Chapters/Chapter3',2},{'Normal02','Main_Levels/Chapters/Chapter3/Normal',2},{'Select02','Main_Levels/Chapters/Chapter3/Select',2},{'img_Selectkuang02','Main_Levels/Chapters/Chapter3/Select/img_Selectkuang',2},{'txt_monument02','Main_Levels/Chapters/Chapter3/txt_monument',2},{'Mask_lock02','Main_Levels/Chapters/Chapter3/Mask_lock',2},{'Map_lock02','Main_Levels/Chapters/Chapter3/Mask_lock/Map_lock',2},{'img_zhangjiexian02','Main_Levels/Chapters/Chapter3/img_zhangjiexian',2},{'btn_event4_new02','Main_Levels/Chapters/Chapter3/btn_event4_new',2},{'Chapter4','Main_Levels/Chapters/Chapter4',2},{'Normal03','Main_Levels/Chapters/Chapter4/Normal',2},{'Select03','Main_Levels/Chapters/Chapter4/Select',2},{'img_Selectkuang03','Main_Levels/Chapters/Chapter4/Select/img_Selectkuang',2},{'txt_monument03','Main_Levels/Chapters/Chapter4/txt_monument',2},{'Mask_lock03','Main_Levels/Chapters/Chapter4/Mask_lock',2},{'Map_lock03','Main_Levels/Chapters/Chapter4/Mask_lock/Map_lock',2},{'img_zhangjiexian03','Main_Levels/Chapters/Chapter4/img_zhangjiexian',2},{'btn_event4_new03','Main_Levels/Chapters/Chapter4/btn_event4_new',2},{'Chapter5','Main_Levels/Chapters/Chapter5',2},{'Normal04','Main_Levels/Chapters/Chapter5/Normal',2},{'Select04','Main_Levels/Chapters/Chapter5/Select',2},{'img_Selectkuang04','Main_Levels/Chapters/Chapter5/Select/img_Selectkuang',2},{'txt_monument04','Main_Levels/Chapters/Chapter5/txt_monument',2},{'Mask_lock04','Main_Levels/Chapters/Chapter5/Mask_lock',2},{'Map_lock04','Main_Levels/Chapters/Chapter5/Mask_lock/Map_lock',2},{'img_zhangjiexian04','Main_Levels/Chapters/Chapter5/img_zhangjiexian',2},{'btn_event4_new04','Main_Levels/Chapters/Chapter5/btn_event4_new',2},{'Chapter6','Main_Levels/Chapters/Chapter6',2},{'Normal05','Main_Levels/Chapters/Chapter6/Normal',2},{'Select05','Main_Levels/Chapters/Chapter6/Select',2},{'img_Selectkuang05','Main_Levels/Chapters/Chapter6/Select/img_Selectkuang',2},{'txt_monument05','Main_Levels/Chapters/Chapter6/txt_monument',2},{'Mask_lock05','Main_Levels/Chapters/Chapter6/Mask_lock',2},{'Map_lock05','Main_Levels/Chapters/Chapter6/Mask_lock/Map_lock',2},{'img_zhangjiexian05','Main_Levels/Chapters/Chapter6/img_zhangjiexian',2},{'btn_event4_new05','Main_Levels/Chapters/Chapter6/btn_event4_new',2},{'Chapter7','Main_Levels/Chapters/Chapter7',2},{'Normal06','Main_Levels/Chapters/Chapter7/Normal',2},{'Select06','Main_Levels/Chapters/Chapter7/Select',2},{'img_Selectkuang06','Main_Levels/Chapters/Chapter7/Select/img_Selectkuang',2},{'txt_monument06','Main_Levels/Chapters/Chapter7/txt_monument',2},{'Mask_lock06','Main_Levels/Chapters/Chapter7/Mask_lock',2},{'Map_lock06','Main_Levels/Chapters/Chapter7/Mask_lock/Map_lock',2},{'img_zhangjiexian06','Main_Levels/Chapters/Chapter7/img_zhangjiexian',2},{'btn_event4_new06','Main_Levels/Chapters/Chapter7/btn_event4_new',2},{'Chapter8','Main_Levels/Chapters/Chapter8',2},{'Normal07','Main_Levels/Chapters/Chapter8/Normal',2},{'Select07','Main_Levels/Chapters/Chapter8/Select',2},{'img_Selectkuang07','Main_Levels/Chapters/Chapter8/Select/img_Selectkuang',2},{'txt_monument07','Main_Levels/Chapters/Chapter8/txt_monument',2},{'Mask_lock07','Main_Levels/Chapters/Chapter8/Mask_lock',2},{'Map_lock07','Main_Levels/Chapters/Chapter8/Mask_lock/Map_lock',2},{'img_zhangjiexian07','Main_Levels/Chapters/Chapter8/img_zhangjiexian',2},{'btn_event4_new07','Main_Levels/Chapters/Chapter8/btn_event4_new',2},{'Chapter9','Main_Levels/Chapters/Chapter9',2},{'Normal08','Main_Levels/Chapters/Chapter9/Normal',2},{'Select08','Main_Levels/Chapters/Chapter9/Select',2},{'img_Selectkuang08','Main_Levels/Chapters/Chapter9/Select/img_Selectkuang',2},{'txt_monument08','Main_Levels/Chapters/Chapter9/txt_monument',2},{'Mask_lock08','Main_Levels/Chapters/Chapter9/Mask_lock',2},{'Map_lock08','Main_Levels/Chapters/Chapter9/Mask_lock/Map_lock',2},{'img_zhangjiexian08','Main_Levels/Chapters/Chapter9/img_zhangjiexian',2},{'btn_event4_new08','Main_Levels/Chapters/Chapter9/btn_event4_new',2},{'Chapter10','Main_Levels/Chapters/Chapter10',2},{'Normal09','Main_Levels/Chapters/Chapter10/Normal',2},{'Select09','Main_Levels/Chapters/Chapter10/Select',2},{'img_Selectkuang09','Main_Levels/Chapters/Chapter10/Select/img_Selectkuang',2},{'txt_monument09','Main_Levels/Chapters/Chapter10/txt_monument',2},{'Mask_lock09','Main_Levels/Chapters/Chapter10/Mask_lock',2},{'Map_lock09','Main_Levels/Chapters/Chapter10/Mask_lock/Map_lock',2},{'img_zhangjiexian09','Main_Levels/Chapters/Chapter10/img_zhangjiexian',2},{'btn_event4_new09','Main_Levels/Chapters/Chapter10/btn_event4_new',2},{'SelectPoint','Main_Levels/SelectPoint',2},{'bg_map_task','Main_Levels/SelectPoint/bg_map_task',2},{'title','Main_Levels/SelectPoint/title',2},{'Img_Chapter','Main_Levels/SelectPoint/title/Img_Chapter',2},{'Img_tiao','Main_Levels/SelectPoint/title/Img_Chapter/Img_tiao',2},{'Img_TextTitle','Main_Levels/SelectPoint/title/Img_Chapter/Img_TextTitle',2},{'LevelScroll','Main_Levels/SelectPoint/LevelScroll',2},{'LevelItem','Main_Levels/SelectPoint/LevelScroll/LevelItem',2},{'Btn_state_lock','Main_Levels/SelectPoint/LevelScroll/LevelItem/Btn_state_lock',2},{'lockicon','Main_Levels/SelectPoint/LevelScroll/LevelItem/Btn_state_lock/lockicon',2},{'Btn_state_clear','Main_Levels/SelectPoint/LevelScroll/LevelItem/Btn_state_clear',2},{'Btn_state_normal','Main_Levels/SelectPoint/LevelScroll/LevelItem/Btn_state_normal',2},{'icon_repeat','Main_Levels/SelectPoint/LevelScroll/LevelItem/icon_repeat',2},{'Content','Main_Levels/SelectPoint/LevelScroll/Content',2},{'LevelsPop','LevelsPop',2},{'LevelPopMask','LevelsPop/LevelPopMask',2},{'BossPopBg','LevelsPop/BossPopBg',2},{'Titledi','LevelsPop/BossPopBg/Titledi',2},{'Img_Tiao','LevelsPop/BossPopBg/Text_Title/Img_Tiao',2},{'Btn_Guanbi','LevelsPop/BossPopBg/Btn_Guanbi',2},{'Img_xian','LevelsPop/BossPopBg/Text_BossPopName/Img_xian',2},{'TipsPanel','LevelsPop/BossPopBg/TipsPanel',2},{'TipsPanel1','LevelsPop/BossPopBg/TipsPanel/TipsPanel1',2},{'Btn_Wenhao','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/Text_Chubeixuqiu/Btn_Wenhao',2},{'Img_Nengyuan','LevelsPop/BossPopBg/TipsPanel/TipsPanel1/DangqianChubeizhi/Img_Nengyuan',2},{'TipsPanel2','LevelsPop/BossPopBg/TipsPanel/TipsPanel2',2},{'Tiaojian','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian',2},{'Img_xian01','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Text_Tiaojian/Img_xian',2},{'Img_BossStar_1','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_1/Img_BossStar_1',2},{'Highlight_1','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_1/Img_BossStar_1/Highlight_1',2},{'Img_BossStar_2','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_2/Img_BossStar_2',2},{'Highlight_2','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_2/Img_BossStar_2/Highlight_2',2},{'Img_BossStar_3','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_3/Img_BossStar_3',2},{'Highlight_3','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Tiaojian/Img_StarTask_3/Img_BossStar_3/Highlight_3',2},{'Juqing','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Juqing',2},{'Img_xian02','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Juqing/Text_Juqing/Img_xian',2},{'Img_xian03','LevelsPop/BossPopBg/TipsPanel/TipsPanel2/Diaoluo/Text_Diaoluo/Img_xian',2},{'Btn_InLevels','LevelsPop/Btn_InLevels',2},{'Btn_di','LevelsPop/Btn_InLevels/Btn_di',2},{'CostTicket','LevelsPop/Btn_InLevels/CostTicket',2},{'Img_CostIcon','LevelsPop/Btn_InLevels/CostTicket/Img_CostIcon',2},{'Btn_InLevels2','LevelsPop/Btn_InLevels2',2},{'Btn_di01','LevelsPop/Btn_InLevels2/Btn_di',2},{'CostTicket01','LevelsPop/Btn_InLevels2/CostTicket',2},{'Img_CostIcon01','LevelsPop/Btn_InLevels2/CostTicket/Img_CostIcon',2},{'Btn_Fast','LevelsPop/Btn_Fast',2},{'Btn_di02','LevelsPop/Btn_Fast/Btn_di',2},{'SweepSuo','LevelsPop/Btn_Fast/Btn_Content/SweepSuo',2},{'TipsPop','LevelsPop/TipsPop',2},{'TipsPopMask','LevelsPop/TipsPop/TipsPopMask',2},{'TipsPopBG','LevelsPop/TipsPop/TipsPopBG',2},{'Img_xian04','LevelsPop/TipsPop/Text_Shuoming/Img_xian',2},{'TipsContent','LevelsPop/TipsPop/TipsContent',2},{'NengyuanItem','LevelsPop/TipsPop/TipsContent/NengyuanItem',2},{'Img_di','LevelsPop/TipsPop/TipsContent/NengyuanItem/Img_di',2},{'Img_Icon','LevelsPop/TipsPop/TipsContent/NengyuanItem/Img_Icon',2},
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
    ---各个章节关卡数据
    self.ChapterData = HalfAnniControl.GetChapterLevels()
    ---本次活动数据
    self.Event4Data = HalfAnniControl.GetData()
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
    ---注册滑块
    self.LevelScroll01():SetLuaCellEvent(Handle(self, self.CellItem))
    ---注册奖励滑块
    self.BossRewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardItem))

    self:InitBtn()
    --初始化章节按钮
    self:InitChapterBtn()
    --更新章节信息
    self:UpdataChapter()
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
    -----拓展件
    --UIEvent.LuaClick(self.Btn_Xingbian().gameObject, function()
    --    HalfAnniControl.OpenXingBian()
    --end)
    ---扭蛋
    UIEvent.LuaClick(self.Btn_Shop().gameObject, function()
        HalfAnniControl.OpenShop()
    end)
    ---任务
    UIEvent.LuaClick(self.Btn_Task().gameObject, function()
        HalfAnniControl.OpenTask()
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
    self:RefreshCost()
    ---跳转体力信息面板
    UIEvent.LuaClick(self.Power().gameObject, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCost()
        end}, true)
    end,nil,self.Power())
end
---初始化章节按钮
function M:InitChapterBtn()
    for i = 1, #self.ChapterData do
        local tData = self.Chapters().transform:Find("Chapter"..i).gameObject
        if tData == nil then
            break
        end
        local tScrollid = self.ChapterData[i].scrollid
        local tBtn = self:SetChapterBtn(tData, tScrollid)
        self.ChapterBtn[tScrollid] = tBtn
    end
end

function M:OnUpdateUI()
    local TouchLevel = HalfAnniControl.GetBranchToutchLevel()
    if TouchLevel == nil then
        return
    end

    ---切换选中状态
    if self.ChapterBtn[self.CurChapterID] then
        self.ChapterBtn[self.CurChapterID].select.gameObject:SetActive(false)
    end
    self.CurChapterID = TouchLevel.chapter
    self.ChapterBtn[self.CurChapterID].select.gameObject:SetActive(true)

    local tData = self.UnlockChapter[self.CurChapterID]

    local idx = #tData.levels
    for i, v in ipairs(tData.levels) do
        if TouchLevel.level == v then
            idx = i-1
            break
        end
    end
    ---章节关卡信息
    self:ChapterLevelData(tData,idx)
    ---背景音乐
    if tData.chaptermusic ~= "" then
        MgrSound.PlayBGM(tData.chaptermusic,0.2,nil,true)
    end
end

---更新章节信息
function M:UpdataChapter()
    ---获取新解锁关卡的章节ID和已解锁章节的数据
    local unlockChapter,newChapter = HalfAnniControl.GetNewChapter()

    ---展示NEW标签
    for i, v in pairs(newChapter) do
        self.ChapterBtn[v.scrollid].newTab.gameObject:SetActive(true)
    end
    ---展示解锁章节
    for i, v in pairs(unlockChapter) do
        self.ChapterBtn[v.scrollid].maskLock.gameObject:SetActive(false)
        self.ChapterBtn[v.scrollid].mapLock.gameObject:SetActive(false)

        self.UnlockChapter[v.scrollid] = v
        ---章节显隐
        if Global.isMiddleTime(v.beginTime, v.endTime) then
            self.ChapterBtn[v.scrollid].btn.gameObject:SetActive(true)
        end
    end
end

function M:CellItem(trans, idx)
    self:SetLevelItem(trans.gameObject, idx)
end
---关卡按钮
function M:SetLevelItem(_obj, _idx)
    local _lock = CJNUIMgr.GetSunUseName(_obj, "Btn_state_lock")
    local _clear = CJNUIMgr.GetSunUseName(_obj, "Btn_state_clear")
    local _normal = CJNUIMgr.GetSunUseName(_obj, "Btn_state_normal")
    local _name = CJNUIMgr.GetSunUseName(_obj, "Text_LevelName"):GetComponent("TextMeshProUGUI")
    local _tuijian = CJNUIMgr.GetSunUseName(_obj, "Text_TuijianLv"):GetComponent("TextMeshProUGUI")
    ---资源扫荡关卡提醒标志
    local _repeat = CJNUIMgr.GetSunUseName(_obj, "icon_repeat")
    ---关卡信息
    local pointData = StormControl.GetStormPointByID(self.CurlevelsID[_idx])
    ---关卡解锁状态
    if pointData:CheckLock() then
        if pointData.star >= 7 then
            _lock.gameObject:SetActive(false)
            _clear.gameObject:SetActive(true)
            _normal.gameObject:SetActive(false)
            _tuijian.gameObject:SetActive(false)
        else
            _lock.gameObject:SetActive(false)
            _clear.gameObject:SetActive(false)
            _normal.gameObject:SetActive(true)
            _tuijian.gameObject:SetActive(true)
        end
        ---关卡名
        _name.text = pointData.name
    else
        _lock.gameObject:SetActive(true)
        _clear.gameObject:SetActive(false)
        _normal.gameObject:SetActive(false)
        _tuijian.gameObject:SetActive(false)

        ---关卡名
        _name.text = "？？？"
    end
    ---推荐等级
    _tuijian.text =  MgrLanguageData.GetLanguageByKey("ui_tongyong_text15")..":Lv"..pointData.recommendLevel
    ---扫荡标志
    if self.SweepPoint[self.CurlevelsID[_idx]] then
        _repeat.gameObject:SetActive(true)
    else
        _repeat.gameObject:SetActive(false)
    end
    ---挑战关卡弹窗
    UIEvent.LuaClick(_obj,function()
        local tIsOpen = pointData:CheckLock()
        if not tIsOpen then
            local temp,tStr = Global.CheckOnTime(TimeControl.GetTimeTable(pointData.unlocks[1]))
            if tStr then
                MgrUI.Pop(UID.PopTip_UI, { tStr, 1 }, true)
            else
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            end
            return
        end
        ---关卡信息弹窗
        self:LevelPop(pointData)
    end)
end

---设置按钮部件
function M:SetChapterBtn(_obj, _chapterId)
    local _new = CJNUIMgr.GetSunUseName(_obj, "btn_event4_new")
    local _select = CJNUIMgr.GetSunUseName(_obj, "Select")
    local _maskLock = CJNUIMgr.GetSunUseName(_obj, "Mask_lock")
    local _mapLock = CJNUIMgr.GetSunUseName(_obj, "Map_lock")

    _obj.gameObject:SetActive(false)
    _new.gameObject:SetActive(false)
    _select.gameObject:SetActive(false)

    local btnParts = {
        btn = _obj,
        newTab = _new,
        select = _select,
        maskLock = _maskLock,
        mapLock = _mapLock
    }
    ---章节按钮事件
    UIEvent.LuaClick(_obj, function()
        if self.CurChapterID == _chapterId then
            return
        end
        local tData = self.UnlockChapter[_chapterId]
        if tData then
            ---切换选中状态
            self.ChapterBtn[self.CurChapterID].select.gameObject:SetActive(false)
            self.CurChapterID = _chapterId
            self.ChapterBtn[self.CurChapterID].select.gameObject:SetActive(true)

            local tData = self.UnlockChapter[self.CurChapterID]
            local idx = #tData.levels
            for i, v in ipairs(tData.levels) do
                local pointData = StormControl.GetStormPointByID(v)
                if not pointData:CheckLock() then
                    idx = i-1
                    break
                end
            end
            ---章节关卡信息
            self:ChapterLevelData(tData,idx)
        else
            ---未解锁
            --MgrUI.Pop(UID.PopTip_UI,{ MgrLanguageData.GetLanguageByKey("ui_daqijiu_txt2"),1 },true)
        end
    end,nil,self.Chapter1())

    return btnParts
end
---章节关卡信息
function M:ChapterLevelData(_data,_idx)
    _idx = _idx and _idx or 0
    ---章节图
    MgrRes.LoadSprite(self.Img_Chapter(), _data.chapterpicture)
    ---章节名
    MgrRes.LoadSprite(self.Img_TextTitle(), _data.pickicon)

    self.CurlevelsID = _data.levels
    self.LevelScroll01().totalCount = #self.CurlevelsID
    self.LevelScroll01():RefillCells(_idx)
    if _idx > 4 then
        MgrTimer.AddDelayNoName(0.05,function()
            self.Content().transform.anchoredPosition = Vector2(-382*(_idx-4+1),0)
        end)
    end
    --self.LevelScroll01():ScrollToCell(_idx,3500)
end

---关卡信息弹窗
function M:LevelPop(_pointData)
    ---设置选中关卡索引
    HalfAnniControl.SetBranchToutchLevel(self.CurChapterID,_pointData.id)
    ---关卡名
    self.Text_BossPopName().text = _pointData.name
    ---推荐等级
    local tStr = MgrLanguageData.GetLanguageByKey("stormtower_ui_adviselevel").._pointData.recommendLevel
    self.Text_TuijianLV().text = tStr
    ---掉落素材
    self.RewardsList = _pointData:GetRewards()
    ---设置Loop数量
    self.BossRewardsScroll01().totalCount = #self.RewardsList
    self.BossRewardsScroll01():RefillCells()
    ---检查是否为剧情关卡
    if not _pointData:CheckIsBattle() then
        ---剧情描述
        self.Text_Jianjie().text = _pointData.introduction

        self.Juqing().gameObject:SetActive(true)
        self.Tiaojian().gameObject:SetActive(false)

        --self.Btn_InLevels().gameObject:SetActive(true)
        --self.Btn_InLevels2().gameObject:SetActive(false)
        --self.Btn_Fast().gameObject:SetActive(false)
        --self.TipsPanel1().gameObject:SetActive(false)
    else
        ---关卡通关评级
        self:InitStar(_pointData)

        self.Juqing().gameObject:SetActive(false)
        self.Tiaojian().gameObject:SetActive(true)

        --self.Btn_InLevels().gameObject:SetActive(false)
        --self.Btn_InLevels2().gameObject:SetActive(true)
        --self.Btn_Fast().gameObject:SetActive(true)
        --self.TipsPanel1().gameObject:SetActive(true)
    end
    ---扫荡锁
    self.SweepSuo().gameObject:SetActive(_pointData.star < 7)
    ---扫荡标志
    if self.SweepPoint[_pointData.id] then
        self.Btn_InLevels().gameObject:SetActive(false)
        self.Btn_Fast().gameObject:SetActive(true)
        self.Btn_InLevels2().gameObject:SetActive(true)
    else
        self.Btn_InLevels().gameObject:SetActive(true)
        self.Btn_InLevels2().gameObject:SetActive(false)
        self.Btn_Fast().gameObject:SetActive(false)
    end

    UIEvent.LuaClick(self.Btn_InLevels().gameObject,function()
        if not _pointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end
        ---当前关卡
        StormViewModel.CurPointData = _pointData
        BattleManager.GameMode = BattleManager.GameModeType.Normal
        MgrTimer.AddDelay("GoPlot", 1, function()
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
        end, nil)
    end)
    UIEvent.LuaClick(self.Btn_InLevels2().gameObject,function()
        if not _pointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end
        ---当前关卡
        StormViewModel.CurPointData = _pointData
        BattleManager.GameMode = BattleManager.GameModeType.Normal
        MgrTimer.AddDelay("GoPlot", 1, function()
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
        end, nil)
    end)
    ---刷新体力
    self:RefreshCost(_pointData)
    ---扫荡
    UIEvent.LuaClick(self.Btn_Fast().gameObject,function()
        if not self:CheckFast(_pointData) then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text24"), 1 }, true)
            return
        end
        MgrUI.Pop(UID.SweepPop_UI, { _pointData, function()
            ---刷新体力
            self:RefreshCost(_pointData)
        end }, true)
    end)

    ---弹窗
    self.LevelsPop().gameObject:SetActive(true)
end
---关卡通关评级
function M:InitStar(_data)
    ---星级
    local s1, s2, s3 = _data:CheckStar()
    local tStar = {s1,s2,s3}
    local strArr = string.split(_data.condition, ",")
    if #strArr <= 1 then
        return
    end
    for i = 1,#self.StarGroup do
        self.StarGroup[i].Star.gameObject:SetActive(tStar[i])
        self.StarGroup[i].Condition.text = TermdescLocalData.tab[tonumber(string.split(strArr[i], "_")[3])][2]
    end
end
---刷新体力
function M:RefreshCost(_pointData)
    ---体力
    local vigor = 0
    if _pointData then
        vigor = _pointData.consume and tonumber(string.split(_pointData.consume,"_")[3]) or 0
    end
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_CNum().text = curTili .. "/" .. vigor
    self.Text_BCNum().text = curTili .. "/" .. vigor
    ---右上角体力剩余
    self.Text_ResTili().text = curTili .. "/" .. TiliMax
end
---扫荡检测
function M:CheckFast(_curPoint)
    if _curPoint == nil then
        return false
    end
    if not _curPoint:CheckLock() then
        return false
    end
    if _curPoint.star < 7 then
        return false
    end

    return true
end

---储存需求说明
function M:SetTipsPop(_GroupID)
    ---获取改组能量所有数据
    local tAllEnergyData = HalfAnniControl.GetEnergyEffect(_GroupID)

    for i,v in ipairs(tAllEnergyData) do
        local go = GameObject.Instantiate(self.NengyuanItem().gameObject,self.TipsContent().transform,false)
        local _ImgBg = CJNUIMgr.GetSunUseName(go, "Img_di"):GetComponent("Image")
        local _Icon = CJNUIMgr.GetSunUseName(go, "Img_Icon"):GetComponent("Image")
        local _Qujian = CJNUIMgr.GetSunUseName(go, "Text_Qujian"):GetComponent("TextMeshProUGUI")
        local _Shuoming = CJNUIMgr.GetSunUseName(go, "Text_Shuoming"):GetComponent("TextMeshProUGUI")

        MgrRes.LoadSprite(_ImgBg,v.background)
        MgrRes.LoadSprite(_Icon,v.icon)
        _Qujian.text = v.range.min.."~"..v.range.max
        _Shuoming.text = v.skillTip
    end
    self.NengyuanItem().gameObject:SetActive(false)
end

function M:RewardItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
end

function M:OnClose()
    HalfAnniControl.SaveToutchLevel()
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

return M