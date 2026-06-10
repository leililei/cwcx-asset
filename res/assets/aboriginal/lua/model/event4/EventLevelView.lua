---外传活动主界面
EventLevelView = {}
local V_BaseUI = nil

function EventLevelView.Init(BaseUI)
    V_BaseUI = BaseUI

    ---注册滑块
    V_BaseUI.LevelScroll01():SetLuaCellEvent(Handle(EventLevelView, EventLevelView.CellItem))
    ---注册奖励滑块
    V_BaseUI.BossRewardsScroll01():SetLuaCellEvent(Handle(EventLevelView, EventLevelView.RewardItem))
    ----初始化章节按钮
    EventLevelView:InitChapterBtn()
    --更新章节信息
    EventLevelView:UpdataChapter()
end

function EventLevelView:OnUpdateUI()
    local TouchLevel = Event4Control.GetToutchLevel()
    if TouchLevel == nil then
        return
    end

    ---切换选中状态
    if V_BaseUI.ChapterBtn[V_BaseUI.CurChapterID] then
        V_BaseUI.ChapterBtn[V_BaseUI.CurChapterID].select.gameObject:SetActive(false)
    end
    V_BaseUI.CurChapterID = TouchLevel.chapter
    V_BaseUI.ChapterBtn[V_BaseUI.CurChapterID].select.gameObject:SetActive(true)

    local tData = V_BaseUI.UnlockChapter[V_BaseUI.CurChapterID]

    local idx = 0
    for i, v in ipairs(tData.levels) do
        if TouchLevel.level == v then
            idx = i
            break
        end
    end
    ---章节关卡信息
    EventLevelView:ChapterLevelData(tData,idx)
    ---背景音乐
    if tData.chaptermusic ~= "" then
        MgrSound.PlayBGM(tData.chaptermusic,0.2,nil,true)
    end

    ---检测所有红点
    Event4Control.CheckAllRedDot()
    ---任务红点
    local taskState = RedDotControl.GetDotData("Event4DailyTask_"..V_BaseUI.CurActID).State or RedDotControl.GetDotData("Event4Achievement_"..V_BaseUI.CurActID).State
    V_BaseUI.MissionRedDotIcon().gameObject:SetActive(taskState)
    ---扭蛋红点
    local AwardState = RedDotControl.GetDotData("Event4Award_"..V_BaseUI.CurActID).State
    V_BaseUI.ShopRedDotIcon().gameObject:SetActive(AwardState)
    ---星变红点
    local XingbianState = RedDotControl.GetDotData("Event4Xingbian_"..V_BaseUI.CurActID).State
    V_BaseUI.Xinbian_RedDotIcon().gameObject:SetActive(XingbianState)
end
---初始化章节按钮
function EventLevelView:InitChapterBtn()
    for i = 1, #V_BaseUI.ChapterData do
        local tData = V_BaseUI.Chapters().transform:Find("Chapter"..i).gameObject
        if tData == nil then
            break
        end
        local tBtn = EventLevelView:SetChapterBtn(tData, i)
        V_BaseUI.ChapterBtn[i] = tBtn
    end
end

---更新章节信息
function EventLevelView:UpdataChapter()
    ---获取新解锁关卡的章节ID和已解锁章节的数据
    local newChapter,unlockChapter = Event4Control.GetNewChapter()

    ---展示NEW标签
    for i, v in ipairs(newChapter) do
        V_BaseUI.ChapterBtn[v].newTab.gameObject:SetActive(true)
    end
    ---展示解锁章节
    for i, v in ipairs(unlockChapter) do
        V_BaseUI.ChapterBtn[v.scrollid].maskLock.gameObject:SetActive(false)
        V_BaseUI.ChapterBtn[v.scrollid].mapLock.gameObject:SetActive(false)

        V_BaseUI.UnlockChapter[v.scrollid] = v
        ---章节显隐
        if Global.isMiddleTime(v.beginTime, v.endTime) then
            V_BaseUI.ChapterBtn[v.scrollid].btn.gameObject:SetActive(true)
        end
    end
end

function EventLevelView:CellItem(trans, idx)
    EventLevelView:SetLevelItem(trans.gameObject, idx)
end
---关卡按钮
function EventLevelView:SetLevelItem(_obj, _idx)
    local _lock = CJNUIMgr.GetSunUseName(_obj, "Btn_state_lock"):GetComponent("Image")
    local _clear = CJNUIMgr.GetSunUseName(_obj, "Btn_state_clear"):GetComponent("Image")
    local _normal = CJNUIMgr.GetSunUseName(_obj, "Btn_state_normal"):GetComponent("Image")
    local _name = CJNUIMgr.GetSunUseName(_obj, "Text_LevelName"):GetComponent("TextMeshProUGUI")
    local _tuijian = CJNUIMgr.GetSunUseName(_obj, "Text_TuijianLv"):GetComponent("TextMeshProUGUI")
    ---资源扫荡关卡提醒标志
    local _repeat = CJNUIMgr.GetSunUseName(_obj, "icon_repeat")
    ---关卡信息
    local pointData = StormControl.GetStormPointByID(V_BaseUI.CurlevelsID[_idx])

    MgrRes.LoadSprite(_lock, "Activity/SBTM/"..V_BaseUI.CurActID.."/btn_logan_title_d")
    MgrRes.LoadSprite(_clear, "Activity/SBTM/"..V_BaseUI.CurActID.."/btn_logan_title_n")
    MgrRes.LoadSprite(_normal, "Activity/SBTM/"..V_BaseUI.CurActID.."/btn_logan_title_h")
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
    _tuijian.text =  string.format(MgrLanguageData.GetLanguageByKey("ui_tongyong_text262"), pointData.recommendLevel)
    ---扫荡标志
    if V_BaseUI.SweepPoint[V_BaseUI.CurlevelsID[_idx]] then
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
                --MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            end
            return
        end
        ---关卡信息弹窗
        EventLevelView:LevelPop(pointData)
    end)
end

---设置按钮部件
function EventLevelView:SetChapterBtn(_obj, _chapterId)
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
        if V_BaseUI.CurChapterID == _chapterId then
            return
        end
        local tData = V_BaseUI.UnlockChapter[_chapterId]
        if tData then
            ---切换选中状态
            V_BaseUI.ChapterBtn[V_BaseUI.CurChapterID].select.gameObject:SetActive(false)
            V_BaseUI.CurChapterID = _chapterId
            V_BaseUI.ChapterBtn[V_BaseUI.CurChapterID].select.gameObject:SetActive(true)

            local tData = V_BaseUI.UnlockChapter[V_BaseUI.CurChapterID]
            local idx = #tData.levels
            for i, v in ipairs(tData.levels) do
                local pointData = StormControl.GetStormPointByID(v)
                if not pointData:CheckLock() then
                    idx = i
                    break
                end
            end
            ---章节关卡信息
            EventLevelView:ChapterLevelData(tData,idx)
        else
            ---未解锁
            --MgrUI.Pop(UID.PopTip_UI,{ MgrLanguageData.GetLanguageByKey("ui_daqijiu_txt2"),1 },true)
        end
    end,nil,V_BaseUI.Chapter1())

    return btnParts
end
---章节关卡信息
function EventLevelView:ChapterLevelData(_data,_idx)
    _idx = _idx and _idx or 0
    ---章节图
    MgrRes.LoadSprite(V_BaseUI.Img_Chapter(), _data.chapterpicture)
    ---章节名
    MgrRes.LoadSprite(V_BaseUI.Img_TextTitle(), _data.pickicon)

    V_BaseUI.CurlevelsID = _data.levels
    V_BaseUI.LevelScroll01().totalCount = #V_BaseUI.CurlevelsID
    V_BaseUI.LevelScroll01():RefillCells(_idx)
    if _idx > 6 then
        MgrTimer.AddDelayNoName(0.05,function()
            V_BaseUI.Content().transform.anchoredPosition = Vector2(0,112*(_idx-6))
        end)
    end
    --V_BaseUI.LevelScroll01():ScrollToCell(_idx,3500)
end

---关卡信息弹窗
function EventLevelView:LevelPop(_pointData)
    ---设置选中关卡索引
    Event4Control.SetToutchLevel(V_BaseUI.CurChapterID,_pointData.id)
    ---关卡名
    V_BaseUI.Text_BossPopName().text = _pointData.name
    ---推荐等级
    local tStr = MgrLanguageData.GetLanguageByKey("stormtower_ui_adviselevel").._pointData.recommendLevel
    V_BaseUI.Text_TuijianLV().text = tStr
    ---掉落素材
    V_BaseUI.RewardsList = _pointData:GetRewards()
    ---设置Loop数量
    V_BaseUI.BossRewardsScroll01().totalCount = #V_BaseUI.RewardsList
    V_BaseUI.BossRewardsScroll01():RefillCells()
    ---检查是否为剧情关卡
    if not _pointData:CheckIsBattle() then
        ---剧情描述
        V_BaseUI.Text_Jianjie().text = _pointData.introduction

        V_BaseUI.Juqing().gameObject:SetActive(true)
        V_BaseUI.Tiaojian().gameObject:SetActive(false)

        V_BaseUI.Text_InPoint().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text35")
        --V_BaseUI.Btn_InLevels().gameObject:SetActive(true)
        --V_BaseUI.Btn_InLevels2().gameObject:SetActive(false)
        --V_BaseUI.Btn_Fast().gameObject:SetActive(false)
        --V_BaseUI.TipsPanel1().gameObject:SetActive(false)
    else
        ---关卡通关评级
        EventLevelView:InitStar(_pointData)

        V_BaseUI.Juqing().gameObject:SetActive(false)
        V_BaseUI.Tiaojian().gameObject:SetActive(true)

        V_BaseUI.Text_InPoint().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text34")
        V_BaseUI.Text_InPoint01().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text34")
        --V_BaseUI.Btn_InLevels().gameObject:SetActive(false)
        --V_BaseUI.Btn_InLevels2().gameObject:SetActive(true)
        --V_BaseUI.Btn_Fast().gameObject:SetActive(true)
        --V_BaseUI.TipsPanel1().gameObject:SetActive(true)
    end
    ---扫荡锁
    V_BaseUI.SweepSuo().gameObject:SetActive(_pointData.star < 7)
    ---扫荡标志
    if V_BaseUI.SweepPoint[_pointData.id] then
        V_BaseUI.Btn_InLevels().gameObject:SetActive(false)
        V_BaseUI.Btn_Fast().gameObject:SetActive(true)
        V_BaseUI.Btn_InLevels2().gameObject:SetActive(true)
    else
        V_BaseUI.Btn_InLevels().gameObject:SetActive(true)
        V_BaseUI.Btn_InLevels2().gameObject:SetActive(false)
        V_BaseUI.Btn_Fast().gameObject:SetActive(false)
    end
    ---当前能量范围
    local tCurEnergyRange,tSelfEnergyVelue = Event4Control.CheckEnergy(_pointData.energycondition)
    MgrRes.LoadSprite(V_BaseUI.Img_Nengyuan(), tCurEnergyRange.icon)
    V_BaseUI.Text_Nengyuan().text = tSelfEnergyVelue
    V_BaseUI.Text_Zhi().text = tCurEnergyRange.rangeName
    ---储存需求说明
    EventLevelView:SetTipsPop(_pointData.energycondition[2])
    ---储存需求
    V_BaseUI.Text_Chubeixuqiu().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt8").."：".._pointData.energycondition[1]

    UIEvent.LuaClick(V_BaseUI.Btn_InLevels().gameObject,function()
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
    UIEvent.LuaClick(V_BaseUI.Btn_InLevels2().gameObject,function()
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
    EventLevelView:RefreshCost(_pointData)
    ---扫荡
    UIEvent.LuaClick(V_BaseUI.Btn_Fast().gameObject,function()
        if not EventLevelView:CheckFast(_pointData) then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text24"), 1 }, true)
            return
        end
        MgrUI.Pop(UID.SweepPop_UI, { _pointData, function()
            ---刷新体力
            EventLevelView:RefreshCost(_pointData)
        end }, true)
    end)

    ---弹窗
    V_BaseUI.LevelsPop().gameObject:SetActive(true)
end
---关卡通关评级
function EventLevelView:InitStar(_data)
    ---星级
    local s1, s2, s3 = _data:CheckStar()
    local tStar = {s1,s2,s3}
    local strArr = string.split(_data.condition, ",")
    if #strArr <= 1 then
        return
    end
    for i = 1,#V_BaseUI.StarGroup do
        V_BaseUI.StarGroup[i].Star.gameObject:SetActive(tStar[i])
        V_BaseUI.StarGroup[i].Condition.text = TermdescLocalData.tab[tonumber(string.split(strArr[i], "_")[3])][2]
    end
end
---刷新体力
function EventLevelView:RefreshCost(_pointData)
    ---体力
    local vigor = 0
    if _pointData then
        vigor = _pointData.consume and tonumber(string.split(_pointData.consume,"_")[3]) or 0
    end
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    V_BaseUI.Text_CNum().text = curTili .. "/" .. vigor
    V_BaseUI.Text_BCNum().text = curTili .. "/" .. vigor
    ---右上角体力剩余
    V_BaseUI.Text_ResTili().text = curTili .. "/" .. TiliMax
end
---扫荡检测
function EventLevelView:CheckFast(_curPoint)
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
function EventLevelView:SetTipsPop(_GroupID)
    ---获取改组能量所有数据
    local tAllEnergyData = Event4Control.GetEnergyEffect(_GroupID)

    for i,v in ipairs(tAllEnergyData) do
        local go = GameObject.Instantiate(V_BaseUI.NengyuanItem().gameObject,V_BaseUI.TipsContent().transform,false)
        local _ImgBg = CJNUIMgr.GetSunUseName(go, "Img_di"):GetComponent("Image")
        local _Icon = CJNUIMgr.GetSunUseName(go, "Img_Icon"):GetComponent("Image")
        local _Qujian = CJNUIMgr.GetSunUseName(go, "Text_Qujian"):GetComponent("TextMeshProUGUI")
        local _Shuoming = CJNUIMgr.GetSunUseName(go, "Text_Shuoming"):GetComponent("TextMeshProUGUI")

        MgrRes.LoadSprite(_ImgBg,v.background)
        MgrRes.LoadSprite(_Icon,v.icon)
        _Qujian.text = v.range.min.."~"..v.range.max
        _Shuoming.text = v.skillTip
    end
    V_BaseUI.NengyuanItem().gameObject:SetActive(false)
end

function EventLevelView:RewardItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData(V_BaseUI.RewardsList[idx])
end
return EventLevelView