-- Code Auto Create Begin
local M = Class('SummerLevelItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SummerLevelItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_Panel','UI_Panel',2},{'Level1','UI_Panel/Level1',2},{'PlotPanel','UI_Panel/Level1/PlotPanel',2},{'Img_PlotIcon','UI_Panel/Level1/PlotPanel/Img_PlotIcon',2},{'Img_PlotMask','UI_Panel/Level1/PlotPanel/Img_PlotMask',2},{'Img_Suo','UI_Panel/Level1/PlotPanel/Img_PlotMask/Img_Suo',2},{'Img_Juqingicon','UI_Panel/Level1/PlotPanel/Img_Juqingicon',2},{'Img_Juqingkuang','UI_Panel/Level1/PlotPanel/Img_Juqingkuang',2},{'Img_PlotSelect','UI_Panel/Level1/PlotPanel/Img_PlotSelect',2},{'guankadi','UI_Panel/Level1/PlotPanel/guankadi',2},{'Jindu','UI_Panel/Level1/PlotPanel/Jindu',2},{'Tansuozhong','UI_Panel/Level1/PlotPanel/Jindu/Tansuozhong',2},{'Mubiaowancheng','UI_Panel/Level1/PlotPanel/Jindu/Mubiaowancheng',2},{'fenggexian','UI_Panel/Level1/PlotPanel/Jindu/Mubiaowancheng/fenggexian',2},{'Quanbuwancheng','UI_Panel/Level1/PlotPanel/Jindu/Quanbuwancheng',2},{'Plot_Gou','UI_Panel/Level1/PlotPanel/Jindu/Quanbuwancheng/Plot_Gou',2},{'NormalPanel','UI_Panel/Level1/NormalPanel',2},{'Img_NormalIcon','UI_Panel/Level1/NormalPanel/Img_NormalIcon',2},{'Img_NormalSelect','UI_Panel/Level1/NormalPanel/Img_NormalSelect',2},{'NormalMask','UI_Panel/Level1/NormalPanel/NormalMask',2},{'Img_Suo01','UI_Panel/Level1/NormalPanel/NormalMask/Img_Suo',2},{'guankadi01','UI_Panel/Level1/NormalPanel/NormalTitle/guankadi',2},{'Normal_Gou','UI_Panel/Level1/NormalPanel/NormalTitle/guankadi/ChapterText/Normal_Gou',2},{'Img_New','UI_Panel/Level1/Img_New',2},{'ShortLine','UI_Panel/Level1/ShortLine',2},{'Img_PassLine','UI_Panel/Level1/ShortLine/Img_PassLine',2},{'Img_PassIcon','UI_Panel/Level1/ShortLine/Img_PassLine/Img_PassIcon',2},{'Img_Left','UI_Panel/Level1/ShortLine/Img_PassLine/Img_Left',2},{'Img_Right','UI_Panel/Level1/ShortLine/Img_PassLine/Img_Right',2},{'Img_NoPassLine','UI_Panel/Level1/ShortLine/Img_NoPassLine',2},{'Img_NoPassIcon','UI_Panel/Level1/ShortLine/Img_NoPassLine/Img_NoPassIcon',2},{'Img_Left01','UI_Panel/Level1/ShortLine/Img_NoPassLine/Img_Left',2},{'Img_Right01','UI_Panel/Level1/ShortLine/Img_NoPassLine/Img_Right',2},{'Panel_Start','UI_Panel/Level1/Panel_Start',2},{'Img_TaskStar_1','UI_Panel/Level1/Panel_Start/Img_TaskStar_1',2},{'Highlight','UI_Panel/Level1/Panel_Start/Img_TaskStar_1/Highlight',2},{'Img_TaskStar_2','UI_Panel/Level1/Panel_Start/Img_TaskStar_2',2},{'Highlight01','UI_Panel/Level1/Panel_Start/Img_TaskStar_2/Highlight',2},{'Img_TaskStar_3','UI_Panel/Level1/Panel_Start/Img_TaskStar_3',2},{'Highlight02','UI_Panel/Level1/Panel_Start/Img_TaskStar_3/Highlight',2},{'Level2','UI_Panel/Level2',2},{'PlotPanel01','UI_Panel/Level2/PlotPanel',2},{'Img_PlotIcon01','UI_Panel/Level2/PlotPanel/Img_PlotIcon',2},{'Img_PlotMask01','UI_Panel/Level2/PlotPanel/Img_PlotMask',2},{'Img_Suo02','UI_Panel/Level2/PlotPanel/Img_PlotMask/Img_Suo',2},{'Img_Juqingicon01','UI_Panel/Level2/PlotPanel/Img_Juqingicon',2},{'Img_Juqingkuang01','UI_Panel/Level2/PlotPanel/Img_Juqingkuang',2},{'Img_PlotSelect01','UI_Panel/Level2/PlotPanel/Img_PlotSelect',2},{'guankadi02','UI_Panel/Level2/PlotPanel/guankadi',2},{'Plot_Gou01','UI_Panel/Level2/PlotPanel/guankadi/PlotTitle/Plot_Gou',2},{'NormalPanel01','UI_Panel/Level2/NormalPanel',2},{'Img_NormalIcon01','UI_Panel/Level2/NormalPanel/Img_NormalIcon',2},{'Img_NormalSelect01','UI_Panel/Level2/NormalPanel/Img_NormalSelect',2},{'NormalMask01','UI_Panel/Level2/NormalPanel/NormalMask',2},{'Img_Suo03','UI_Panel/Level2/NormalPanel/NormalMask/Img_Suo',2},{'guankadi03','UI_Panel/Level2/NormalPanel/NormalTitle/guankadi',2},{'Normal_Gou01','UI_Panel/Level2/NormalPanel/NormalTitle/guankadi/ChapterText/Normal_Gou',2},{'Img_New01','UI_Panel/Level2/Img_New',2},{'Panel_Start01','UI_Panel/Level2/Panel_Start',2},{'Img_TaskStar_101','UI_Panel/Level2/Panel_Start/Img_TaskStar_1',2},{'Highlight03','UI_Panel/Level2/Panel_Start/Img_TaskStar_1/Highlight',2},{'Img_TaskStar_201','UI_Panel/Level2/Panel_Start/Img_TaskStar_2',2},{'Highlight04','UI_Panel/Level2/Panel_Start/Img_TaskStar_2/Highlight',2},{'Img_TaskStar_301','UI_Panel/Level2/Panel_Start/Img_TaskStar_3',2},{'Highlight05','UI_Panel/Level2/Panel_Start/Img_TaskStar_3/Highlight',2},{'ShortLine01','UI_Panel/Level2/ShortLine',2},{'Img_Left02','UI_Panel/Level2/ShortLine/Img_Left',2},{'Img_Right02','UI_Panel/Level2/ShortLine/Img_Right',2},
        -- UITemplate 列表
        {'SummerLevelItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text','UI_Panel/Level1/PlotPanel/Img_PlotMask/Img_Suo/Text',20},{'PlotTitle','UI_Panel/Level1/PlotPanel/guankadi/PlotTitle',20},{'Text_Tansuozhong','UI_Panel/Level1/PlotPanel/Jindu/Tansuozhong/Text_Tansuozhong',20},{'Text_Tansuozhong01','UI_Panel/Level1/PlotPanel/Jindu/Mubiaowancheng/Text_Tansuozhong',20},{'Text_Mubiaowancheng','UI_Panel/Level1/PlotPanel/Jindu/Mubiaowancheng/Text_Mubiaowancheng',20},{'Text_Tansuozhong02','UI_Panel/Level1/PlotPanel/Jindu/Quanbuwancheng/Text_Tansuozhong',20},{'Text01','UI_Panel/Level1/NormalPanel/NormalMask/Img_Suo/Text',20},{'ChapterText','UI_Panel/Level1/NormalPanel/NormalTitle/guankadi/ChapterText',20},{'Text02','UI_Panel/Level2/PlotPanel/Img_PlotMask/Img_Suo/Text',20},{'PlotTitle01','UI_Panel/Level2/PlotPanel/guankadi/PlotTitle',20},{'Text03','UI_Panel/Level2/NormalPanel/NormalMask/Img_Suo/Text',20},{'ChapterText01','UI_Panel/Level2/NormalPanel/NormalTitle/guankadi/ChapterText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Data = nil ---探索关信息
    ---@type StormPointData
    self.mLevelData = nil   ---关卡信息
    self.isNextLock = nil   ---下一章节是否解锁
    UIEvent.LuaClick(self.Level1().gameObject, Handle(self, function()
        local isLock = ActiveChapterControl.CheckScrollLock(self.Data.chapterid)
        if isLock then
            SummerControl.SetSelectID(self.Data.chapterid)
            Event.Go("SummerSelect","chapter", self.Data)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_summerevent_text19"),1},true)
        end
    end))
    UIEvent.LuaClick(self.Level2().gameObject, Handle(self, function()
        local isLock = StormControl.CheckPointLock(self.mLevelData.id)
        if isLock then
            SummerControl.SetSelectID(self.mLevelData.id)
            Event.Go("SummerSelect","level", self.mLevelData)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_summerevent_text20"),1},true)
        end
    end))
end

function M:OnUpdateUI(pData)
    self.Data = pData[1]
    self.isEnd = pData[2]
    self.isNextLock = pData[3]  ---下一章是否通关
    if self.Data == nil then
        self.Level1().gameObject:SetActive(false)
        self.Level2().gameObject:SetActive(false)
        return
    end
    self.Level1().gameObject:SetActive(true)
    ---
    self:UpdataUI(self.Level1().gameObject)
    ---判段是否有挂载关卡
    if self.Data.unlocklevel ~= "0" then
        self.Level2().gameObject:SetActive(true)
        self:UpdataUI(self.Level2().gameObject, tonumber(self.Data.unlocklevel))
    else
        self.Level2().gameObject:SetActive(false)
    end
end

function M:UpdataUI(_item, _pointID)
    local _PlotItem = CJNUIMgr.GetSunUseName(_item, "PlotPanel")
    local _LevelItem = CJNUIMgr.GetSunUseName(_item, "NormalPanel")
    local _Panel_Start = CJNUIMgr.GetSunUseName(_item, "Panel_Start")
    local _ShortLine = CJNUIMgr.GetSunUseName(_item, "ShortLine")
    local _PassLine = CJNUIMgr.GetSunUseName(_item, "Img_PassLine")
    local _NoPassLine = CJNUIMgr.GetSunUseName(_item, "Img_NoPassLine")
    local _Img_New = CJNUIMgr.GetSunUseName(_item, "Img_New")

    local pointData = self.Data
    local isLock = ActiveChapterControl.CheckScrollLock(pointData.chapterid)

    if _pointID then    --level2
        _PlotItem:SetActive(false)
        _LevelItem:SetActive(true)
        _Panel_Start:SetActive(true)
        ---挂载的关卡按钮信息
        pointData = StormControl.GetStormPointByID(_pointID)
        self.mLevelData = pointData
        
        self:InitLevel(_LevelItem, pointData)
        self:InitStar(_Panel_Start,pointData)
        
        _Img_New:SetActive(StormControl.CheckPointLock(pointData.id) and pointData.star == 0)
    else                --level1
        ---章节按钮信息
        _PlotItem:SetActive(true)
        _LevelItem:SetActive(false)
        _Panel_Start:SetActive(false)
        self:InitPlot(_PlotItem)

        _ShortLine:SetActive(not self.isEnd)
        _PassLine:SetActive(self.isNextLock)
        _NoPassLine:SetActive(not self.isNextLock)
        _Img_New:SetActive((isLock and not self.isNextLock and not self.isEnd) or (ActiveChapterControl.CheckScrollPass(pointData.chapterid) and self.isEnd))  ---下一章未解锁/最后一章未全通关
    end
end
---剧情
function M:InitPlot(_item)
    local _Img_PlotIcon = CJNUIMgr.GetSunUseName(_item, "Img_PlotIcon"):GetComponent("Image")
    local _Img_PlotSelect = CJNUIMgr.GetSunUseName(_item, "Img_PlotSelect")
    local _Img_PlotMask = CJNUIMgr.GetSunUseName(_item, "Img_PlotMask")
    local _PlotTitle = CJNUIMgr.GetSunUseName(_item, "PlotTitle"):GetComponent("TextMeshProUGUI")
    local _Plot_Jindu = CJNUIMgr.GetSunUseName(_item, "Jindu")
    local _Plot_Finding = CJNUIMgr.GetSunUseName(_item, "Tansuozhong")
    local _Plot_TargetAch = CJNUIMgr.GetSunUseName(_item, "Mubiaowancheng")
    local _Plot_AllAchievement  = CJNUIMgr.GetSunUseName(_item, "Quanbuwancheng")
    --local _Plot_Gou = CJNUIMgr.GetSunUseName(_item, "Plot_Gou")
    
    local pointData = self.Data
    local tPassType = ActiveChapterControl.CheckScrollState(pointData.chapterid)
    ---判断卷中的关卡是否解锁
    local isLock = ActiveChapterControl.CheckScrollLock(pointData.chapterid)
    ---判断该卷是否在活动期间
    local isTimeLock = Global.CheckOnTime(TimeControl.GetTimeTable(pointData.chaptertime))
    MgrRes.LoadSprite(_Img_PlotIcon,pointData.pickicon)
    ---遮罩
    _Img_PlotMask:SetActive(not isLock or not isTimeLock)
    ---若探索关卡解锁,显示探索进度
    if isLock then
        _Plot_Jindu.gameObject:SetActive(true)
        if tPassType == 0 then
            _Plot_Finding.gameObject:SetActive(true)
            _Plot_TargetAch.gameObject:SetActive(false)
            _Plot_AllAchievement.gameObject:SetActive(false)
        elseif tPassType == 1 then
            _Plot_TargetAch.gameObject:SetActive(true)
            _Plot_Finding.gameObject:SetActive(false)
            _Plot_AllAchievement.gameObject:SetActive(false)
        elseif tPassType == 2 then
            _Plot_AllAchievement.gameObject:SetActive(true)
            _Plot_Finding.gameObject:SetActive(false)
            _Plot_TargetAch.gameObject:SetActive(false)
        end
    else
        _Plot_Jindu.gameObject:SetActive(false)
        _Plot_Finding.gameObject:SetActive(false)
        _Plot_TargetAch.gameObject:SetActive(false)
        _Plot_AllAchievement.gameObject:SetActive(false)
    end
    ---名称
    _PlotTitle.text = pointData.chaptername

    _Img_PlotSelect:SetActive(SummerControl.GetSelectID() == pointData.chapterid)
end
---关卡
function M:InitLevel(_item, _data)
    if not _data then
        return
    end
    local _Img_NormalIcon = CJNUIMgr.GetSunUseName(_item, "Img_NormalIcon"):GetComponent("Image")
    local _Img_NormalSelect = CJNUIMgr.GetSunUseName(_item, "Img_NormalSelect")
    local _NormalMask = CJNUIMgr.GetSunUseName(_item, "NormalMask")
    local _ChapterText = CJNUIMgr.GetSunUseName(_item, "ChapterText"):GetComponent("TextMeshProUGUI")
    local _Normal_Gou = CJNUIMgr.GetSunUseName(_item, "Normal_Gou")
    ---判断关卡是否解锁(门票关是根据关卡表来判解锁条件)
    local isLock = StormControl.CheckPointLock(_data.id)
    MgrRes.LoadSprite(_Img_NormalIcon,"Item/".._data.picture)
    ---遮罩
    _NormalMask:SetActive(not isLock)
    ---名称
    _ChapterText.text = _data.name

    _Img_NormalSelect:SetActive(SummerControl.GetSelectID() == _data.id)

    _Normal_Gou:SetActive(_data.star == 7)
end

function M:InitStar(_item,_data)
    ---星级
    local s1, s2, s3 = _data:CheckStar()
    local tStar = {s1,s2,s3}
    for i = 1,3 do
        CJNUIMgr.GetSunUseName(_item, "Img_TaskStar_"..i).transform:Find("Highlight").gameObject:SetActive(tStar[i])
    end
end

return M