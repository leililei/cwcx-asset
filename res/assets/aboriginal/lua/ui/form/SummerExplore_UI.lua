-- Code Auto Create Begin
local M = Class('SummerExplore_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SummerExplore_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SummerExplore_UI].prefab'
    self.Name = 'Form[SummerExplore_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'MaskImg','MaskImg',2},{'Map','MaskImg/Map',2},{'touxiangyuan2','MaskImg/Linghang/touxiangyuan2',2},{'touxiang','MaskImg/Linghang/touxiang',2},{'PlayerIcon','MaskImg/Linghang/touxiang/PlayerIcon',2},{'touxiangkuang','MaskImg/Linghang/touxiangkuang',2},{'DuihuaIcon','MaskImg/Linghang/DuihuaIcon',2},{'yingzi','MaskImg/Linghang/yingzi',2},{'Gezi','Gezi',2},{'Img_GeziTietu','Gezi/Img_GeziTietu',2},{'Img_GeziFenge','Gezi/Img_GeziFenge',2},{'Img_GeziKuang_Hui','Gezi/Img_GeziKuang_Hui',2},{'Img_GeziKuang_Bai','Gezi/Img_GeziKuang_Bai',2},{'Img_Gezi_Advance','Gezi/Img_Gezi_Advance',2},{'Img_Gezi_UnAdvance','Gezi/Img_Gezi_UnAdvance',2},{'Img_GeziKuang_Shijian','Gezi/Img_GeziKuang_Shijian',2},{'Img_GeziKuang_Zhandou','Gezi/Img_GeziKuang_Zhandou',2},{'Img_Roadblock','Gezi/Img_Roadblock',2},{'touxiangyuan201','Gezi/Touxiang/touxiangyuan2',2},{'touxiang01','Gezi/Touxiang/touxiang',2},{'PlayerIcon01','Gezi/Touxiang/touxiang/PlayerIcon',2},{'touxiangkuang01','Gezi/Touxiang/touxiangkuang',2},{'DuihuaIcon01','Gezi/Touxiang/DuihuaIcon',2},{'MaskMap','MaskMap',2},{'MapDrag','MapDrag',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add2','UpperRightPanel/Btn_AddPower/Btn_Add2',2},{'Image','UpperRightPanel/Btn_AddPower/Btn_Add2/Image',2},{'Img_Tiliicon','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'Renwumubiao','Renwumubiao',2},{'Img_Tiao','Renwumubiao/Img_Tiao',2},{'Btn_Back','Btn_Back',2},{'Btn_Help','Btn_Help',2},{'Btn_Drag','Btn_Drag',2},{'Img_Drag','Btn_Drag/Img_Drag',2},{'DragIcon','Btn_Drag/Img_Drag/DragIcon',2},{'Img_Drag_H','Btn_Drag/Img_Drag_H',2},{'DragIcon_H','Btn_Drag/Img_Drag_H/DragIcon_H',2},
        -- Button 列表
        {'Btn_Back01','Btn_Back',4},
        -- TextMeshProUGUI 列表
        {'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_Renwumubiao','Renwumubiao/Text_Renwumubiao',20},{'Text_Mubiao','Renwumubiao/Text_Mubiao',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Gezi().gameObject:SetActive(false)
    self.MaskMap().gameObject:SetActive(false)
    self.MapDrag().gameObject:SetActive(false)
    
    self.CurMapData = {}
    self.IsInBattle = false
    self.DoDailogEvent = true   ---对话阻塞标志位，避免连续对话
    ---停止移动
    self.MoveStop = false
    ---当前关卡ID
    self.CurPintID = SummerMapControl.GetChapter()
    ---路径
    self.PathList = {}
    ---最后停留的格子ID
    self.StayFloorID = 0
    ---初始格
    self.FirstLogic = nil
    ---当前移动到的格子
    self.CurLogic = nil
    ---角色缩放比
    self.RoleScale = 0.07
    
    self.NeedHideList = {}
    self.NeedShowList = {}
    ---点击的逻辑格ID
    self.MarkLogic = 0
    ---当前地图信息
    self.CurChapterData = SummerMapControl.GetChapterData()
    ---是否触发陷阱
    self.IsTrap = false
    ---导入当前地图走过的格子
    SummerMapControl.LoadCurMapMark()
    ---获取ui摄像机
    self.uiCamera = GameObject.Find("UI_Camera"):GetComponent("Camera")
    self.targetTrans = self.Map().transform:GetComponent("RectTransform")

    self.mPathlist = self.Map().gameObject:GetComponent("MapMove")
    self.mPathlist:BindClick(Handle(self, self.FindPath))

    self.LinghangMove = CJNUIMgr.GetSunUseName(self.ObjRoot, "Linghang")
    
    self.MapOffset = SummerMapControl.GetDValue(self.Map().transform:GetChild(0).transform.localPosition)
    
    self:InitButton()
    self:ShowUI()
    self:CreateLingHang()
    ---背景音乐
    if self.CurChapterData.scrollmusic ~= "" then
        MgrSound.PlayBGM(self.CurChapterData.scrollmusic,0.2,nil,true)
    end
    ---添加监听
    Event.Add("MapMoveTouch", Handle(self, self.OnTouchWay))
    Event.Add("MapBattle", Handle(self, self.Battle))
    Event.Add("MapRefresh", Handle(self, self.RefreshMap))
    Event.Add("ClickOnOff",Handle(self, self.ClickOnOff))
    Event.Add("DailogEventOff",Handle(self, self.DailogEventOff))
    
    self:BackPop()
    
    --self.MaskImg().gameObject:GetComponent("UIDrag"):SetDrag(function(delta)
    --    self.MaskImg().transform.anchorPosition = 
    --end)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if self.StayFloorID ~= 0 then
            SummerMapControl.SendMoveIDREQ(self.StayFloorID)
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        StormViewModel.CurPointData = nil
        MgrUI.GoBack()
    end
end
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        if self.StayFloorID ~= 0 then
            SummerMapControl.SendMoveIDREQ(self.StayFloorID)
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        StormViewModel.CurPointData = nil
        MgrUI.GoBack()
    end))
    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCoinCount()
        end}, true)
    end))
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, Handle(self, function()
        ActiveTutorialControl.OpenGuide(SummerMapControl.GetHelp())
        Event.Go("ClickOnOff",false)
    end))
    
    UIEvent.LuaClick(self.MaskMap().gameObject, Handle(self, function()
        if not self.IsTrap then
            self.MoveStop = true
        end
    end))  
    ---
    UIEvent.LuaClick(self.Btn_Drag().gameObject, Handle(self, function()
        self.MapDrag().gameObject:SetActive(not self.MapDrag().gameObject.activeSelf)
        if self.MapDrag().gameObject.activeSelf then
            self.MapPos = self.MaskImg().transform.localPosition
            self.MaskImg().transform.localScale = Vector3(0.8, 0.8, 0.8)
            self.mPathlist:BanClick()
        else
            self.MaskImg().transform.localPosition = self.MapPos
            self.MaskImg().transform.localScale = Vector3(1, 1, 1)
            self.mPathlist:OnClick()
        end
        self.Img_Drag().gameObject:SetActive(not self.MapDrag().gameObject.activeSelf)
        self.Img_Drag_H().gameObject:SetActive(self.MapDrag().gameObject.activeSelf)
    end))
end

function M:ShowUI()
    ---体力
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_ResTili().text = curTili .. "/" .. TiliMax
    ---描述
    self.Text_Mubiao().text = self.CurChapterData.objectivetips
    ---背景图
    MgrRes.LoadSprite(self.Background(),self.CurChapterData.scrollpicture)
end
---领航员动画 TODO1
function M:CreateLingHang()
    local LingHangID = 1000012
    local LingHangEf = "idle"
    --if self.CurChapterData.walkMan then
    --    LingHangID = tonumber(self.CurChapterData.walkMan[1])
    --    LingHangEf = self.CurChapterData.walkMan[2]
    --end
    MgrRes.LoadWatchAuto(self.LinghangMove.gameObject, LingHangID, 0, -125, self.RoleScale, LingHangEf, function(obj)
        self.LingHangObj = obj
    end)
end
function M:OnShowFinish()
    ---将当前地图数据发给C#
    SummerMapControl.CreateMapDataToCS(self.CurPintID)
    if self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Nomal then
        self:CreateMap()
    else
        self:CreateMarkMap()
    end
    ---路障隐藏效果
    self:RoadblockEff()
end
---构建普通地图
function M:CreateMap()
    ---获取当前地图信息
    local tMapData = SummerMapControl.GetMapData(self.CurPintID)
    local tMapPos = SummerMapControl.GetMapPos(self.CurPintID)
    local isPos = false
    for i, v in pairs(tMapData) do
        if v.extraType == 0 or v.extraType == 2 then
            local tGezi = self.Map().transform:Find(tostring(v.location))
            ---生成格子
            self.CurMapData[v.location] = self:CreatGo(self.Gezi().gameObject, tGezi)
            ---设置格子状态
            self:SetLogicState(self.CurMapData[v.location], v)

            self.CurMapData[v.location].gameObject:SetActive(true)
            ---初始点
            if v.special == 1 then
                if tMapPos == nil then
                    self.Map().transform.localPosition = self:GetUIPos(v.location)
                    isPos = true
                end
                self.FirstLogic = v.location
            end
            ---终点
            if v.special == 2 then
                if v.floortype == 0 then
                    self.Text_Mubiao().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text13")
                end
            end
        end
    end
    ---初始点
    if tMapPos and not isPos then
        self.Map().transform.localPosition = self:GetUIPos(tMapPos)
    end
end
---构建全暗地图
function M:CreateMarkMap()
    ---获取当前地图信息
    local tMapData = SummerMapControl.GetMapData(self.CurPintID)--当前关卡所有格子信息
    local tMapPos = SummerMapControl.GetMapPos(self.CurPintID)  --获取玩家所在位置
    local tMapMark = SummerMapControl.GetMapMark()              --保存在playerPrefs中
    local tNextFloorList = {}
    local isPos = false
    for i, v in pairs(tMapData) do
        ---extraType为0时,陷阱未触发
        if v.extraType == 0 or v.extraType == 2 then
            local tGezi = self.Map().transform:Find(tostring(v.location))   --找到对应的格子物体
            ---生成格子
            self.CurMapData[v.location] = self:CreatGo(self.Gezi().gameObject, tGezi)   --在节点上创建格子
            ---设置格子状态
            self:SetLogicState(self.CurMapData[v.location], v)      --传入表中的逻辑数据，修改格子显示的内容
            ---初始点 
            if v.special == 1 then
                if tMapPos == nil then
                    self.Map().transform.localPosition = self:GetUIPos(v.location)
                    isPos = true
                end
                self.FirstLogic = v.location
            end
            ---终点
            if v.special == 2 then
                if v.floortype == 0 then
                    self.Text_Mubiao().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text13")
                end
            end
            local showLogic = false
            local cfg = SummermapLocalData.tab[v.floorid]
            if self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Mark then
                ---需要显示的格子(记录的路径 or 起始格 or 玩家所在位置 or 高亮格 or 事件触发格)
                if tMapMark[v.floorid] or (tMapPos == nil and v.special == 1) or (tMapPos ~= nil and tMapPos == v.location) or v.discover == 1 or (v.floortype == SummerMapControl.LogicType.normal and v.eventid[0] ~= nil) then
                    tNextFloorList[v.floorid] = cfg.location
                    if tMapMark[v.floorid] or (tMapPos == nil and v.special == 1) or (tMapPos ~= nil and tMapPos == v.location) then
                        showLogic = true
                    end
                end
                ---显示路径周边格
                local tFloorType = SummermapLocalData.tab[v.floorid].floortype
                if showLogic then
                    for id, showfloor in pairs(v.showfloor) do
                        cfg = SummermapLocalData.tab[showfloor]
                        if cfg and tNextFloorList[showfloor] == nil then
                            tNextFloorList[showfloor] = cfg.location
                        end
                    end
                end
            elseif self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Untag then
                ---需要显示的格子(起始格 or 玩家所在位置 or 高亮格)
                if (tMapPos == nil and v.special == 1) or (tMapPos ~= nil and tMapPos == v.location) or v.discover == 1 then
                    tNextFloorList[v.floorid] = cfg.location
                    if (tMapPos == nil and v.special == 1) or (tMapPos ~= nil and tMapPos == v.location) then
                        showLogic = true
                    end
                end
                ---显示路径周边格
                if showLogic then
                    for id, showfloor in pairs(v.showfloor) do
                        local cfg = SummermapLocalData.tab[showfloor]
                        if cfg and tNextFloorList[showfloor] == nil then
                            tNextFloorList[showfloor] = cfg.location
                        end
                    end
                end
            end
            
        end
    end
    ---显示路径周边格
    self:ShowLogic(tNextFloorList)
    ---初始点
    if tMapPos and not isPos then
        self.Map().transform.localPosition = self:GetUIPos(tMapPos)
    end
end
---创建一个物体
function M:CreatGo(_Prefab, _Root)
    -- statements
    if _Prefab == nil or _Root == nil then
        return
    end
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform, false)
    --tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---设置格子状态
function M:SetLogicState(_gezi, _logicData)
    if _gezi == nil then
        return
    end
    local _Tietu = CJNUIMgr.GetSunUseName(_gezi, "Img_GeziTietu"):GetComponent("Image")
    local _UnAdvance = CJNUIMgr.GetSunUseName(_gezi, "Img_Gezi_UnAdvance")
    local _KuangEvent = CJNUIMgr.GetSunUseName(_gezi, "Img_GeziKuang_Shijian")
    local _KuangBattle = CJNUIMgr.GetSunUseName(_gezi, "Img_GeziKuang_Zhandou")
    local _roadblock = CJNUIMgr.GetSunUseName(_gezi, "Img_Roadblock"):GetComponent("Image")
    local _Touxiang = CJNUIMgr.GetSunUseName(_gezi, "Touxiang")
    local _PlayerIcon = CJNUIMgr.GetSunUseName(_gezi, "PlayerIcon"):GetComponent("Image")
    local _DuihuaIcon = CJNUIMgr.GetSunUseName(_gezi, "DuihuaIcon"):GetComponent("Image")
    local _HeadFrame = CJNUIMgr.GetSunUseName(_gezi, "touxiangkuang"):GetComponent("Image")
    ---格子贴图
    if _logicData.mapping ~= "0" then
        MgrRes.LoadSprite(_Tietu,_logicData.mapping)
    end
    ---事件格icon
    if _logicData.floortype ~= SummerMapControl.LogicType.normal then
        ---事件头像icon
        if _logicData.roleid ~= 0 then
            MgrRes.LoadQIcon(_PlayerIcon, _logicData.roleid)
            _Touxiang:SetActive(true)
        end
        ---事件图标icon
        if _logicData.eventpic ~= "0" then
            if _logicData.floortype == SummerMapControl.LogicType.roadblock then
                MgrRes.LoadSprite(_roadblock,_logicData.eventpic)
                _roadblock.gameObject:SetActive(true)
            else
                MgrRes.LoadSprite(_PlayerIcon,_logicData.eventpic)
                _Touxiang:SetActive(true)
            end
        end
        ---事件气泡
        local tPath = ""
        if _logicData.floortype == SummerMapControl.LogicType.battle then
            tPath = "Activity/Summer/Map/Img_ZhandouIcon"
        elseif _logicData.floortype == SummerMapControl.LogicType.treasure then
            tPath = "Activity/Summer/Map/Img_BaoxiangIcon"
        elseif _logicData.floortype == SummerMapControl.LogicType.boss then
            tPath = "Activity/Summer/Map/Img_BossIcon"
        elseif _logicData.floortype == SummerMapControl.LogicType.plot then
            tPath = "Activity/Summer/Map/Img_ShijianIcon"
        end
        if tPath ~= "" then
            MgrRes.LoadSprite(_DuihuaIcon,tPath)
        else
            _DuihuaIcon.gameObject:SetActive(false)
        end
    end
    if _logicData.floortype == SummerMapControl.LogicType.roadblock then
        ---路障
        _UnAdvance:SetActive(true)
        _roadblock.gameObject:SetActive(true)
    elseif _logicData.floortype == SummerMapControl.LogicType.dialog
            or _logicData.floortype == SummerMapControl.LogicType.plot
    then
        ---事件
        _KuangEvent:SetActive(true)
    elseif _logicData.floortype == SummerMapControl.LogicType.battle
            or _logicData.floortype == SummerMapControl.LogicType.treasure
            or _logicData.floortype == SummerMapControl.LogicType.boss
    then
        ---战斗
        _KuangBattle:SetActive(true)
        MgrRes.LoadSprite(_HeadFrame,"Activity/Summer/Map/Img_YuanKuang_Di")
    elseif _logicData.floortype == SummerMapControl.LogicType.trap then
        ---陷阱
        if _logicData.extraType == 1 then
            _gezi:SetActive(false)
        end
    elseif _logicData.floortype == SummerMapControl.LogicType.normal then
        ---普通格
        _UnAdvance:SetActive(false)
        _KuangEvent:SetActive(false)
        _KuangBattle:SetActive(false)
        _Touxiang:SetActive(false)
        _roadblock.gameObject:SetActive(false)
    end
end
---标记点击的格子
function M:SetLogicMark(_gezi, _show)
    if _gezi == nil then
        return
    end
    local _Advance = CJNUIMgr.GetSunUseName(_gezi, "Img_Gezi_Advance")

    _Advance:SetActive(_show)
end
---路障隐藏效果
function M:RoadblockEff()
    local tLockEff = SummerMapControl.GetDeblockLogic()
    if tLockEff == nil then
        return
    end
    local tBlockEffList = {}
    local CloseEff = false
    for i, _location in ipairs(tLockEff) do
        local tGizi = self.CurMapData[_location.location]
        if tGizi then
            local _roadblock = CJNUIMgr.GetSunUseName(tGizi, "Img_Roadblock"):GetComponent("Image")
            MgrRes.LoadSprite(_roadblock,_location.eventpic)
            _roadblock.gameObject:SetActive(true)
            SummerMapControl.SetExtraType(_location.location, 0)
            
            table.insert(tBlockEffList, _roadblock.gameObject:GetComponent("CanvasGroup"))
        end
    end
    ---隐藏路障
    MgrTimer.AddRepeat("HideSummerBlock",0.07,function()
        CloseEff = true
        for i, _blockEff in ipairs(tBlockEffList) do
            if _blockEff.alpha ~= 0 then
                _blockEff.alpha = _blockEff.alpha - 0.1
                CloseEff = false
            end
        end
        if CloseEff then
            MgrTimer.Cancel("HideSummerBlock")
        end
    end,0,self.ObjRoot)

    ---保存当前路障格数据
    SummerMapControl.SetDeblockLogic(nil)
end
---寻路
function M:FindPath(_LogicListCount)
    self.PathList = {}
    self.MoveStop = false
    for i = 1, _LogicListCount do
        self.PathList[i] = self.mPathlist:GetPathList(_LogicListCount - i)
    end
    
    if not self:CheckPathCanMove(self.PathList) and self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Untag or #self.PathList == 0 then
        return
    end
    CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"walk",true)
    self.MaskMap().gameObject:SetActive(true)
    ---标记点击格
    self.MarkLogic = self.PathList[#self.PathList]
    self:SetLogicMark(self.CurMapData[self.MarkLogic], true)
    ---走路音效
    --MgrSound.PlayEffect("yx_xh_5",1,0,true,0,0,"summerLoop")

    local n = 1
    local function Move()
        if #self.PathList == 0 then
            return
        end
        ---获取当前地图信息
        local tMapData = SummerMapControl.GetMapData(self.CurPintID)
        self:MarkPath(n)
        self.CurLogic = self.PathList[n]
        ---事件处理
        n = self:CheckEvent(n)
        n = self:CheckNextEvent(n)

        if n == 0 or n >= #self.PathList or tMapData[self.PathList[n + 1]] == nil or self.MoveStop then
            --MgrSound.Stop(2,"summerLoop",true)
            if n ~= 0 or self.MoveStop then
                self:OnTouchWay()
            end
            self.MaskMap().gameObject:SetActive(false)
            CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"idle",true)
            
            return
        end
        if not self.IsTrap then
            MgrSound.PlayEffect("yx_xh_5",1,0,false,0,0,"summer")
        end
        ---角色走格子方向判定
        self:RoleMoveDir(n)

        ---关闭点击寻路响应
        self.mPathlist:BanClick()
        ---移动地图
        local logicPos1 = self:GetUIPos(self.PathList[n])
        local logicPos2 = self:GetUIPos(self.PathList[n + 1])

        local tNextLogic = tMapData[self.PathList[n + 1]]
        self.StayFloorID = tNextLogic.floorid
        Tools.DoMove(self.Map().gameObject, logicPos1, logicPos2, 0.5, false, function()
            Move()
        end,true)
        n = n + 1
    end
    Move()
end
---事件当前格处理
function M:CheckEvent(_idx)
    if _idx == 1 then
        return _idx
    end
    ---获取当前地图信息
    local tMapData = SummerMapControl.GetMapData(self.CurPintID)
    local tLogic = tMapData[self.PathList[_idx]]
    ---记录有前置事件格的关卡ID
    SummerMapControl.SetBlockPointID(tLogic.eventid[0])

    if tLogic.floortype == SummerMapControl.LogicType.battle
            or tLogic.floortype == SummerMapControl.LogicType.treasure
            or tLogic.floortype == SummerMapControl.LogicType.boss
            or tLogic.floortype == SummerMapControl.LogicType.plot
    then
        if self.IsInBattle then
            self.IsInBattle = true
            return 0
        end

        ---发送前一格的ID给服务端
        local tBeforeLogic = tMapData[self.PathList[_idx - 1]]
        SummerMapControl.SendMoveIDREQ(tBeforeLogic.floorid)
        ---获取当前格的关卡数据
        local tPoint = StormControl.GetStormPointByID(tLogic.eventid[0])
        if tLogic.firsttalk ~= 0 then
            ---战前对话
            self.mPathlist:BanClick()
            MgrUI.Pop(UID.SummerFrame_UI, { tLogic.firsttalk, tLogic.floortype, tPoint }, true)
        else
            ---战斗
            self:Battle(tPoint)
        end
        ---目标任务格设置状态
        if tLogic.special == 2 then
            SummerMapControl.SetTargetPointID(tLogic.eventid[0])
        end
        return 0
    elseif tLogic.floortype == SummerMapControl.LogicType.dialog then
        if tLogic.firsttalk ~= 0 then
            ---触发对话音效
            MgrSound.PlayEffect("yx_xh_1",1,0,false,0,0,"summer")
            ---对话
            self.mPathlist:BanClick()
            MgrUI.Pop(UID.SummerFrame_UI, { tLogic.firsttalk, tLogic.floortype, tLogic.eventid[0] }, true)
        end
        return 0
    elseif tLogic.floortype == SummerMapControl.LogicType.trap then
        ---陷阱
        local tLogic1 = self.PathList[_idx]
        local tLogic2 = self.PathList[_idx - 1]
        self.PathList = {}
        self.PathList[1] = tLogic1
        self.PathList[2] = tLogic2
        _idx = 1

        SummerMapControl.SendEventREQ(tLogic.eventid[0])
        ---触发陷阱
        self.IsTrap = true
        self.MoveStop = false
        ---触发陷阱音效
        MgrSound.PlayEffect("yx_xh_7",1,0,false,0,0,"summer")
        return _idx
    elseif tLogic.floortype == SummerMapControl.LogicType.transfer then
        ---传送
        --self.Map().transform.localPosition = self:GetUIPos(tLogic.transfer)
        self.PathList[1] = self.CurLogic
        self.PathList[2] = tLogic.transfer
        local logicPos1 = self:GetUIPos(self.PathList[1])
        local logicPos2 = self:GetUIPos(self.PathList[2])
        --self.LinghangMove.gameObject:SetActive(false)
        local tNextLogic = tMapData[self.PathList[2]]
        self.StayFloorID = tNextLogic.floorid
        ---触发陷阱音效
        MgrSound.PlayEffect("se_bzn1_1_57",1,0,false,0,0,"summer")
        
        self.LinghangMove.transform.localScale = Vector3.zero
        Tools.DoMove(self.Map().gameObject, logicPos1, logicPos2, 0.5, false, function()
            for i = 1, 2 do
                self:MarkPath(i)
            end
            --self.LinghangMove.gameObject:SetActive(true)
            self.LinghangMove.transform.localScale = Vector3(1,1,1)
            self:OnTouchWay()
        end,true)
        self.MoveStop = false
        _idx = 0
    end

    return _idx
end
---事件下一格处理
function M:CheckNextEvent(_idx)
    ---获取当前地图信息
    local tMapData = SummerMapControl.GetMapData(self.CurPintID)
    -----检测是否达到目标点
    --if _idx >= #self.PathList or tMapData[self.PathList[_idx + 1]] == nil then
    --    return nil
    --end
    ---检测下一个点是否有事件
    local tNextLogic = tMapData[self.PathList[_idx + 1]]
    if tNextLogic and tNextLogic.floortype == SummerMapControl.LogicType.roadblock then
        ---路障
        if tNextLogic.roadblock ~= 0 then
            if self.DoDailogEvent then
                ---触发对话音效
                MgrSound.PlayEffect("yx_xh_8",1,0,false,0,0,"summer")

                self.mPathlist:BanClick()
                MgrUI.Pop(UID.SummerFrame_UI, { tNextLogic.roadblock }, true)
            else
                self:OnTouchWay()
            end
            self.DoDailogEvent = true
        else
            self:OnTouchWay()
        end
        return 0
    end
    return _idx
end

function M:GetUIPos(_location)
    local tLogicData = self.CurMapData[_location]
    if tLogicData == nil then
        tLogicData = self.CurMapData[self.FirstLogic]
    end
    return tLogicData.transform.parent.localPosition * (-1) + self.MapOffset
end
---开启点击寻路响应
function M:OnTouchWay(_delay)
    local tDelay = 0.2
    if _delay then
        tDelay = _delay
    end
    MgrTimer.AddDelayNoName(tDelay, function()
        self.mPathlist:OnClick()
    end, nil)
    CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"idle",true)
    self.MaskMap().gameObject:SetActive(false)
    ---取消点击格标记
    if self.MarkLogic ~= 0 then
        self:SetLogicMark(self.CurMapData[self.MarkLogic], false)
    end
    self.IsTrap = false
end
---角色走格子方向判定
function M:RoleMoveDir(n)
    local tPos = SummerMapControl.GetLogicPos(self.PathList[n])
    local tNextPos = SummerMapControl.GetLogicPos(self.PathList[n + 1])
    if tPos.y == tNextPos.y then
        if tPos.x > tNextPos.x then
            self.LingHangObj.transform.localScale = Vector3(-self.RoleScale,self.RoleScale,1)
        elseif tPos.x < tNextPos.x then
            self.LingHangObj.transform.localScale = Vector3(self.RoleScale,self.RoleScale,1)
        end
    end
end
---进入战斗
function M:Battle(_point)
    if _point and not _point:CheckLock() then
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_summerevent_text25"),Handle(self,self.GoBackFirst),nil,4})
        return
    end

    if _point:CheckIsBattle() then
        ---触发战斗音效
        MgrSound.PlayEffect("yx_xh_6",1,0,false,0,0,"summer")
    else
        ---触发战斗音效
        MgrSound.PlayEffect("yx_xh_1",1,0,false,0,0,"summer")
    end
    ---当前关卡
    StormViewModel.CurPointData = _point
    MgrTimer.AddDelay("GoPlot", 0.1, function()
        StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
    end, nil)
end
---地图格子刷新
function M:RefreshMap(_locationList)
    for i, _location in ipairs(_locationList) do
        self:SetLogicState(self.CurMapData[_location.location], _location)
    end
    ---路障隐藏效果
    self:RoadblockEff()
end
---暗格逻辑
function M:MarkPath(n)
    local tMapData = SummerMapControl.GetMapData(self.CurPintID)
    local tLogic = tMapData[self.PathList[n]]
    if self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Mark and n > 1 then
        ---全暗地图，记住行进路线
        local tNextFloorList = {}
        tNextFloorList[self.PathList[n]] = self.PathList[n]
        for id, showfloor in pairs(tLogic.showfloor) do
            local cfg = SummermapLocalData.tab[showfloor]
            if cfg and tNextFloorList[showfloor] == nil then
                tNextFloorList[showfloor] = cfg.location
            end
        end
        ---显示路径周边格
        self:ShowLogic(tNextFloorList)

        SummerMapControl.SetMapMark(tLogic.floorid)
    elseif self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Untag then
        ---全暗地图，不记行进路线
        if n == 1 then
            ---记录需要隐藏的格子
            self.NeedHideList = {}
            for id, showfloor in pairs(tLogic.showfloor) do
                local cfg = SummermapLocalData.tab[showfloor]
                if cfg and self.NeedHideList[showfloor] == nil then
                    self.NeedHideList[showfloor] = cfg.location
                end
            end
        else
            ---记录需要显示的格子
            self.NeedShowList = {}
            self.NeedShowList[tLogic.floorid] = tLogic.location
            for id, showfloor in pairs(tLogic.showfloor) do
                local cfg = SummermapLocalData.tab[showfloor]
                if cfg and self.NeedShowList[showfloor] == nil then
                    self.NeedShowList[showfloor] = cfg.location
                end
            end
            ---筛选出需要显示的格子
            for floorid, location in pairs(self.NeedHideList) do
                if self.NeedShowList[floorid] or (tMapData[location] and tMapData[location].discover == 1) then
                    self.NeedHideList[floorid] = nil
                end
            end
            ---显示路径周边格
            self:ShowLogic(self.NeedShowList)
            ---隐藏路径周边格
            self:HideLogic(self.NeedHideList)

            self.NeedHideList = self.NeedShowList
        end
    end
end
---显示路径周边格
function M:ShowLogic(_vicinity)
    local tMapData = SummerMapControl.GetMapData(self.CurPintID)
    for i, location in pairs(_vicinity) do
        if self.CurMapData[location] then
            if not self.CurMapData[location].gameObject.activeSelf and tMapData[location].extraType ~= 1 then
                self.CurMapData[location].gameObject:SetActive(true)
            end
            if tMapData[location].extraType == 2 and tMapData[location].floortype ~= SummerMapControl.LogicType.roadblock then
                SummerMapControl.SetExtraType(location, 0)
            end
        end
    end
end
---隐藏路径周边格
function M:HideLogic(_vicinity)
    for i, location in pairs(_vicinity) do
        if self.CurMapData[location] and self.CurMapData[location].gameObject.activeSelf then
            self.CurMapData[location].gameObject:SetActive(false)
            if self.CurMapData[location].extraType ~= 1 then
                SummerMapControl.SetExtraType(location, 2)
            end
        end
    end
end
---判断路线是否能走通
function M:CheckPathCanMove(_pathList)
    if self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Mark or self.CurChapterData.mapmode == ActiveChapterControl.LogicMapType.Untag then
        for i, location in pairs(_pathList) do
            if self.CurMapData[location] == nil or not self.CurMapData[location].gameObject.activeSelf then
                if self.CurMapData[location] == nil then
                    print("判断路线是否能走通location "..location.."\nCurMapData "..#self.CurMapData)
                end
                return false
            end
        end
    end
    return true
end

function M:ClickOnOff(switch)
    if switch then
        self.mPathlist:OnClick()
    else
        self.mPathlist:BanClick()
    end
end

function M:DailogEventOff()
    self.DoDailogEvent = false
end
---返回起始格
function M:GoBackFirst()
    ---返回起始格
    self.Map().transform.localPosition = self:GetUIPos()

    self.PathList[1] = self.CurLogic
    self.PathList[2] = self.FirstLogic
    for i = 1, 2 do
        self:MarkPath(i)
    end
    ---记录停留格子的floorid
    local tMapData = SummerMapControl.GetMapData(self.CurPintID)
    self.StayFloorID = tMapData[self.FirstLogic].floorid
    ---开启点击寻路响应
    self:OnTouchWay()
end
---弹出完成目标弹窗
function M:BackPop()
    local pointData = StormControl.GetStormPointByID(SummerMapControl.GetTargetPointID())
    if pointData and pointData.star > 0 then
        self:ClickOnOff(false)
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_summerevent_text31"),function()
            if self.StayFloorID ~= 0 then
                SummerMapControl.SendMoveIDREQ(self.StayFloorID)
            end
            
            MgrUI.GoBack()
        end,nil,2,function()
            self:ClickOnOff(true)
        end})
        ---弹窗触发后,重置
        SummerMapControl.SetTargetPointID(0)
    end
end

function M:OnClose()    
    Event.CheckClear("MapMoveTouch")
    Event.CheckClear("MapBattle")
    Event.CheckClear("MapRefresh")
    Event.CheckClear("ClickOnOff")
	Event.CheckClear("DailogEventOff")
    
    MgrTimer.Cancel("HideSummerBlock")
    
    MgrSound.Stop(2,"summerLoop",true)
end

return M