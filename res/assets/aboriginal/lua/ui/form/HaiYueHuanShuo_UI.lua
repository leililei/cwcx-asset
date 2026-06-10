-- Code Auto Create Begin
local M = Class('HaiYueHuanShuo_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HaiYueHuanShuo_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HaiYueHuanShuo_UI].prefab'
    self.Name = 'Form[HaiYueHuanShuo_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'Img_Role','Ani/Img_Role',2},{'EventName','Ani/LeftGroup/TitleGroup/EventName',2},{'EventTime','Ani/LeftGroup/EventTime',2},{'Time','Ani/LeftGroup/EventTime/Text_Huodongjieshushijian/Time',2},{'Shop','Ani/LeftGroup/Shop',2},{'Img_Shopdi','Ani/LeftGroup/Shop/Img_Shopdi',2},{'Mission','Ani/LeftGroup/Mission',2},{'Img_Missiondi','Ani/LeftGroup/Mission/Img_Missiondi',2},{'MissionRedDotIcon','Ani/LeftGroup/Mission/MissionRedDotIcon',2},{'Replay','Ani/LeftGroup/Replay',2},{'Img_Replay','Ani/LeftGroup/Replay/Img_Replay',2},{'Img_PlotSuo','Ani/LeftGroup/Replay/Img_PlotSuo',2},{'Suo','Ani/LeftGroup/Replay/Img_PlotSuo/Suo',2},{'ToHome','Ani/LeftGroup/ToHome',2},{'Img_Replay01','Ani/LeftGroup/ToHome/Img_Replay',2},{'Img_di','Ani/RIghtGroup/Img_di',2},{'TopGroup','Ani/RIghtGroup/TopGroup',2},{'TopBtn','Ani/RIghtGroup/TopGroup/TopBtn',2},{'Img_UnSelect','Ani/RIghtGroup/TopGroup/TopBtn/Img_UnSelect',2},{'Img_Select','Ani/RIghtGroup/TopGroup/TopBtn/Img_SelectBg/Img_Select',2},{'Lock','Ani/RIghtGroup/TopGroup/TopBtn/Lock',2},{'Img_Suo','Ani/RIghtGroup/TopGroup/TopBtn/Lock/Img_Suo',2},{'Btn_Click','Ani/RIghtGroup/TopGroup/TopBtn/Btn_Click',2},{'LevelGroupScroll','Ani/RIghtGroup/LevelGroupScroll',2},{'Viewport','Ani/RIghtGroup/LevelGroupScroll/Viewport',2},{'HaiYueLevelItem','Ani/RIghtGroup/LevelGroupScroll/Viewport/HaiYueLevelItem',2},{'Content','Ani/RIghtGroup/LevelGroupScroll/Viewport/Content',2},{'Huodongjieshu','Ani/RIghtGroup/Huodongjieshu',2},{'UpperRightPanel','Ani/UpperRightPanel',2},{'Btn_AddPower','Ani/UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','Ani/UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add2','Ani/UpperRightPanel/Btn_AddPower/Btn_Add2',2},{'Image','Ani/UpperRightPanel/Btn_AddPower/Btn_Add2/Image',2},{'Img_Tiliicon','Ani/UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- UITemplate 列表
        {'HaiYueLevelItem01','Ani/RIghtGroup/LevelGroupScroll/Viewport/HaiYueLevelItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Huodongjieshushijian','Ani/LeftGroup/EventTime/Text_Huodongjieshushijian',20},{'Text_Date','Ani/LeftGroup/EventTime/Text_Huodongjieshushijian/Text_Date',20},{'Remainder','Ani/LeftGroup/EventTime/Text_Huodongjieshushijian/Time/Remainder',20},{'Text_RaidLock','Ani/RIghtGroup/TopGroup/TopBtn/Lock/Text_RaidLock',20},{'Text_ResTili','Ani/UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Huodongjieshu().gameObject:SetActive(false)
    MgrUI.GetUICamera().orthographic = true
    
    self.CurPanel = nil
    self.CurTopBtn = {
        UnSelect = nil,
        SelectBg = nil
    }
    ---顶部按钮
    self.TopBtnGroup = {}
    self.HaiYueData = HaiYueControl.GetHaiYueInfo()
    self.HaiYueChapter = HaiYueControl.GetChapterData()
    self.CurLevels = {}
    self.CurChapterType = 0
    self.HaiYueLevelItem = self.Viewport().transform:Find("HaiYueLevelItem")
    self.LevelItems = {}
    self.LevelCellHeight = 157
    
    Event.Add("HaiYue_RefreshCost",Handle(self,self.RefreshCost))
    Event.Add("HaiYue_CellMove",Handle(self,self.CellMove))
    self:InitButton()
    self:OnCheckTime()
    ---刷新体力
    self:RefreshCost()
    ---帮助
    ActiveTutorialControl.ForcePopGuide(self.HaiYueData.group)
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---商城
    UIEvent.LuaClick(self.Shop().gameObject, function()
        HaiYueControl.OpenShop()
    end)
    ---任务
    UIEvent.LuaClick(self.Mission().gameObject, function()
        HaiYueControl.OpenTask()
    end)
    ---图鉴
    UIEvent.LuaClick(self.Replay().gameObject, function()
        MgrLink.TurnToPlot(tonumber(self.HaiYueData.gallary[1]),tonumber(self.HaiYueData.gallary[2]))
    end)
    ---HalfAnniversaryHome_UI
    UIEvent.LuaClick(self.ToHome().gameObject, function()
        MgrUI.GoHide(UID.HalfAnniversaryHome_UI)
    end)
    ---体力
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCost()
        end}, true)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.HaiYueData.group)
    end)
    ---顶部按钮切换
    for i = 1, 3 do
        self.TopBtnGroup[i] = self:CreatGo(self.TopBtn().gameObject, self.TopGroup())
        self:SetTopBtn(self.TopBtnGroup[i],i)
    end
    self.TopBtn().gameObject:SetActive(false)
end

function M:OnUpdateUI()
    if self.HaiYueData.gallary and ArtAtlasControl.CheckUnlock(tonumber(self.HaiYueData.gallary[1]),tonumber(self.HaiYueData.gallary[2])) == false then
        self.Img_PlotSuo().gameObject:SetActive(true)
        self.Img_Replay().gameObject:GetComponent("CanvasGroup").alpha = 0.5
    else
        self.Img_PlotSuo().gameObject:SetActive(false)
        self.Img_Replay().gameObject:GetComponent("CanvasGroup").alpha = 1
    end

    ---任务红点
    HaiYueControl.CheckTaskRedPoint()
    self.MissionRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("HaiYue").State)
    ---背景音乐
    if self.HaiYueData and self.HaiYueData.music ~= "" then
        MgrSound.PlayBGM(self.HaiYueData.music,0.2,nil,true)
    end
end

function M:RefreshCost()
    ---体力
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_ResTili().text = curTili .. "/" .. TiliMax
end
---剧情、门票、挑战切换按钮
function M:SetTopBtn(_obj, _idx)
    local _UnSelect = CJNUIMgr.GetSunUseName(_obj, "Img_UnSelect").gameObject:GetComponent("Image")
    local _Select = CJNUIMgr.GetSunUseName(_obj, "Img_Select").gameObject:GetComponent("Image")
    local _SelectBg = CJNUIMgr.GetSunUseName(_obj, "Img_SelectBg")
    local _Lock = CJNUIMgr.GetSunUseName(_obj, "Lock")
    local _BtnClick = CJNUIMgr.GetSunUseName(_obj, "Btn_Click")
    
    local tCurChapter = self.HaiYueChapter[_idx][1]
    ---判断活动章节是否开启
    local strTip = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text3")
    local timeState = Global.GetTimeState(tCurChapter.beginTime, tCurChapter.endTime)
    if timeState == 2 or timeState == 3 then
        _Lock.gameObject:SetActive(false)
    else
        if tCurChapter.chaptertype == ActiveChapterControl.ChapterType.Ticket then
            ---门票
            strTip = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text3")
        elseif tCurChapter.chaptertype == ActiveChapterControl.ChapterType.Challege then
            ---挑战
            local strTime = string.split(tCurChapter.beginTime,"-")
            strTip = string.format(MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text6"),strTime[1]..'/'..strTime[2]..'/'..strTime[3].." "..strTime[4]..":"..strTime[5])
        end
        _Lock.gameObject:SetActive(true)
    end
    ---
    if tCurChapter.chaptertype == ActiveChapterControl.ChapterType.Plot then
        ---剧情
        MgrRes.LoadSprite(_Select, "Activity/HaiYue/juqing1",nil,true)
        MgrRes.LoadSprite(_UnSelect, "Activity/HaiYue/juqing2",nil,true)
    elseif tCurChapter.chaptertype == ActiveChapterControl.ChapterType.Ticket then
        ---门票
        MgrRes.LoadSprite(_Select, "Activity/HaiYue/tiaozhan1",nil,true)
        MgrRes.LoadSprite(_UnSelect, "Activity/HaiYue/tiaozhan2",nil,true)
    elseif tCurChapter.chaptertype == ActiveChapterControl.ChapterType.Challege then
        ---挑战
        MgrRes.LoadSprite(_Select, "Activity/HaiYue/shilian1",nil,true)
        MgrRes.LoadSprite(_UnSelect, "Activity/HaiYue/shilian2",nil,true)
    end
    ---按钮控制
    if _idx == HaiYueControl.GetSelectPage() then
        self.CurTopBtn.UnSelect = _UnSelect
        self.CurTopBtn.SelectBg = _SelectBg
        self.CurTopBtn.UnSelect.gameObject:SetActive(false)
        self.CurTopBtn.SelectBg.gameObject:SetActive(true)
        ---超过时间后去掉关卡目录
        if timeState == 3 then
            if self.LevelGroupScroll().gameObject.activeSelf then
                self.LevelGroupScroll().gameObject:SetActive(false)
            end
            if not self.LevelGroupScroll().gameObject.activeSelf then
                self.Huodongjieshu().gameObject:SetActive(true)
            end
        else
            ---刷新关卡
            self.CurLevels = self.HaiYueChapter[_idx][1].levels
            self.CurChapterType = self.HaiYueChapter[_idx].Chaptertype
            self:RefillLevels(self.CurLevels)
        end
    else
        _UnSelect.gameObject:SetActive(true)
        _SelectBg.gameObject:SetActive(false)
    end
    
    UIEvent.LuaClick(_BtnClick.gameObject, function()
        if timeState == 1 then
            MgrUI.Pop(UID.PopTip_UI, { strTip, 1 }, true)
            return
        end
        if self.CurTopBtn.SelectBg == _SelectBg then
            return
        end
        ---按钮切换
        self.CurTopBtn.UnSelect.gameObject:SetActive(true)
        self.CurTopBtn.SelectBg.gameObject:SetActive(false)

        self.CurTopBtn.UnSelect = _UnSelect
        self.CurTopBtn.SelectBg = _SelectBg
        self.CurTopBtn.UnSelect.gameObject:SetActive(false)
        self.CurTopBtn.SelectBg.gameObject:SetActive(true)
        ---设置当前选择的页签
        HaiYueControl.SetSelectPage(_idx)
        ---超过时间后去掉关卡目录
        if timeState == 3 then
            if self.LevelGroupScroll().gameObject.activeSelf then
                self.LevelGroupScroll().gameObject:SetActive(false)
            end
            if not self.LevelGroupScroll().gameObject.activeSelf then
                self.Huodongjieshu().gameObject:SetActive(true)
            end
            return
        end
        ---刷新关卡
        self.CurLevels = self.HaiYueChapter[_idx][1].levels
        self.CurChapterType = self.HaiYueChapter[_idx].Chaptertype
        self:RefillLevels(self.CurLevels)
    end)
end

function M:RefillLevels(_levels)
    local SelectLv = 0
    for i, v in ipairs(_levels) do
        if #self.LevelItems < i then
            self.LevelItems[i] = self:CreatGo(self.HaiYueLevelItem.gameObject, self.Content())
        end
        if StormControl.CheckPointLock(v) then
            SelectLv = i
        end
    end
    for i = 1, #self.LevelItems do
        if i <= #_levels then
            self.LevelItems[i]:SetActive(true)
            self.LevelItems[i]:GetComponent("UITemplate"):SetData({ _levels[i],self.CurChapterType,i==SelectLv,i })
        else
            self.LevelItems[i]:SetActive(false)
        end
    end
    
    self:CellMove(SelectLv, #_levels)
end

---移动滑条
function M:CellMove(_selectLv, _len)
    if _len then
        if _len <= 5 then
            return
        end
        MgrTimer.AddRepeat("HYHSCellMove",0.04,function()
            if self.Content().transform.rect.height < self.LevelCellHeight*_len then
                return
            end
            MgrTimer.Cancel("HYHSCellMove")
            if _selectLv > (_len-5) then
                self.Content().transform.anchoredPosition = Vector2(0, self.LevelCellHeight*(_len-5))
            else
                self.Content().transform.anchoredPosition = Vector2(0, self.LevelCellHeight*(_selectLv-1))
            end
        end,10,self.ObjRoot)
    else
        self.Content().transform.anchoredPosition = Vector2(0, self.LevelCellHeight*(_selectLv-1))
    end
end

function M:OnCheckTime()
    ---时间
    local tEndTime = string.split(self.HaiYueData.endTime,'-')
    ---剩余天数
    local remainTime = HaiYueControl.GetEndTime("change") - 1
    if Global.isMiddleTime(self.HaiYueData.beginTime,self.HaiYueData.battleEndTime) then
        remainTime = HaiYueControl.GetEndTime("battle") - 1
        tEndTime = string.split(self.HaiYueData.battleEndTime,'-')
        ---作戰時間
        self.Text_Huodongjieshushijian().text = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text1")
    else
        ---兌換時間
        self.Text_Huodongjieshushijian().text = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text2")
    end

    ---时间
    self.Text_Date().text = string.format("%d/%d/%d %s:%s",tEndTime[1],tEndTime[2],tEndTime[3],tEndTime[4],tEndTime[5])

    if remainTime / (3600*24) >= 1 then
        ---剩余天数
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..math.modf(remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    else
        ---剩余小时数
        local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
end

---创建一个物体
function M:CreatGo(_Prefab, _Root)
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.transform.localPosition = Vector3.zero
    if not tempObj.gameObject.activeSelf then
        tempObj.gameObject:SetActive(true)
    end
    return tempObj.gameObject
end

function M:OnClose()
    HaiYueControl.SetCurLvDetail(nil)
    HaiYueControl.SetCurSelect(nil)
    HaiYueControl.SetCurContent(nil)
    
    Event.CheckClear("HaiYue_RefreshCost")
    Event.CheckClear("HaiYue_CellMove")
    MgrUI.GetUICamera().orthographic = false
    MgrTimer.Cancel("HYHSCellMove")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M