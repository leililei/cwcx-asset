-- Code Auto Create Begin
local M = Class('ArtAppreciation_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ArtAppreciation_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ArtAppreciation_UI].prefab'
    self.Name = 'Form[ArtAppreciation_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_ReturnInfo','UpperLeftPanel/Btn_ReturnBg/Btn_ReturnInfo',2},{'Btn_ReturnHome','UpperLeftPanel/Btn_ReturnBg/Btn_ReturnHome',2},{'SwitchPanel','SwitchPanel',2},{'Img_Qieyexian','SwitchPanel/Img_Qieyexian',2},{'SwitchOther','SwitchPanel/SwitchScroll/SwitchOther',2},{'Btn_Suo','SwitchPanel/SwitchScroll/SwitchOther/Btn_Suo',2},{'Img_Qieyedian','SwitchPanel/SwitchScroll/SwitchOther/Btn_Suo/Img_Qieyedian',2},{'Img_Suo','SwitchPanel/SwitchScroll/SwitchOther/Btn_Suo/Img_Suo',2},{'Btn_Switch','SwitchPanel/SwitchScroll/SwitchOther/Btn_Switch',2},{'Img_Qieyedian01','SwitchPanel/SwitchScroll/SwitchOther/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchScroll/SwitchOther/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','SwitchPanel/SwitchScroll/SwitchOther/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'RedDotIcon','SwitchPanel/SwitchScroll/SwitchOther/RedDotIcon',2},{'Img_Qieyedi','SwitchPanelSecond/Img_Qieyedi',2},{'Img_Qieyedi_H','SwitchPanelSecond/Img_Qieyedi_H',2},{'Img_Qieyekuang','SwitchPanelSecond/Img_Qieyedi_H/Img_Qieyekuang',2},{'MainPanel','MainPanel',2},{'ScrollbarVertical','MainPanel/RightPanel/MainScroll/ScrollbarVertical',2},{'Handle','MainPanel/RightPanel/MainScroll/ScrollbarVertical/SlidingArea/Handle',2},{'Content','MainPanel/RightPanel/MainScroll/Content',2},{'EventPanel','EventPanel',2},{'ScrollbarVertical01','EventPanel/RightPanel/EventScroll/ScrollbarVertical',2},{'Handle01','EventPanel/RightPanel/EventScroll/ScrollbarVertical/SlidingArea/Handle',2},{'Content01','EventPanel/RightPanel/EventScroll/Content',2},{'RolePanel','RolePanel',2},{'ScrollbarVertical02','RolePanel/RightPanel/RoleScroll/ScrollbarVertical',2},{'Handle02','RolePanel/RightPanel/RoleScroll/ScrollbarVertical/SlidingArea/Handle',2},{'Content02','RolePanel/RightPanel/RoleScroll/Content',2},{'HomePanel','HomePanel',2},{'ScrollbarVertical03','HomePanel/RightPanel/HomeScroll/ScrollbarVertical',2},{'Handle03','HomePanel/RightPanel/HomeScroll/ScrollbarVertical/SlidingArea/Handle',2},{'HomePlotItem','HomePanel/RightPanel/HomeScroll/HomePlotItem',2},{'Content03','HomePanel/RightPanel/HomeScroll/Content',2},{'MusicPanel','MusicPanel',2},{'CollectedMusic','MusicPanel/CollectedMusic',2},{'huangTiao','MusicPanel/CollectedMusic/huangTiao',2},{'Img_Xian','MusicPanel/RightPanel/Img_Xian',2},{'Img_Tanchuangdi','MusicPanel/RightPanel/Img_Tanchuangdi',2},{'ScrollbarVertical04','MusicPanel/RightPanel/MusicScroll/ScrollbarVertical',2},{'Handle04','MusicPanel/RightPanel/MusicScroll/ScrollbarVertical/SlidingArea/Handle',2},{'MusicContent','MusicPanel/RightPanel/MusicScroll/MusicContent',2},{'MusicAtlasItem','MusicPanel/RightPanel/MusicScroll/MusicAtlasItem',2},{'Changpian','MusicPanel/Changpian',2},{'Img_Changpian','MusicPanel/Changpian/Img_Changpian',2},{'Btn_Play','MusicPanel/Btn_PlayPanel/Btn_Play',2},{'Img_Play','MusicPanel/Btn_PlayPanel/Btn_Play/Img_Play',2},{'Btn_Stop','MusicPanel/Btn_PlayPanel/Btn_Stop',2},{'Img_Stop','MusicPanel/Btn_PlayPanel/Btn_Stop/Img_Stop',2},{'Btn_Next','MusicPanel/Btn_PlayPanel/Btn_Next',2},{'Next','MusicPanel/Btn_PlayPanel/Btn_Next/Next',2},{'Btn_Last','MusicPanel/Btn_PlayPanel/Btn_Last',2},{'Last','MusicPanel/Btn_PlayPanel/Btn_Last/Last',2},{'Dian','MusicPanel/Jindutiao/Dian',2},{'Background','MusicPanel/Jindutiao/MusicSlider/Background',2},{'Fill','MusicPanel/Jindutiao/MusicSlider/Fill Area/Fill',2},{'Handle05','MusicPanel/Jindutiao/MusicSlider/Handle Slide Area/Handle',2},
        -- Slider 列表
        {'MusicSlider','MusicPanel/Jindutiao/MusicSlider',5},
        -- UITemplate 列表
        {'MainAtlasChapterItem','MainPanel/RightPanel/MainScroll/MainAtlasChapterItem',10},{'EventAtlasChapterItem','EventPanel/RightPanel/EventScroll/EventAtlasChapterItem',10},{'RolePlotItem','RolePanel/RightPanel/RoleScroll/RolePlotItem',10},{'HomePlotItem01','HomePanel/RightPanel/HomeScroll/HomePlotItem',10},{'MusicAtlasItem01','MusicPanel/RightPanel/MusicScroll/MusicAtlasItem',10},
        -- RawImage 列表
        {'SwitchScroll','SwitchPanel/SwitchScroll',15},{'MainScroll','MainPanel/RightPanel/MainScroll',15},{'EventScroll','EventPanel/RightPanel/EventScroll',15},{'RoleScroll','RolePanel/RightPanel/RoleScroll',15},{'HomeScroll','HomePanel/RightPanel/HomeScroll',15},{'MusicScroll','MusicPanel/RightPanel/MusicScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchPanel/SwitchScroll',18},{'MainScroll01','MainPanel/RightPanel/MainScroll',18},{'EventScroll01','EventPanel/RightPanel/EventScroll',18},{'RoleScroll01','RolePanel/RightPanel/RoleScroll',18},{'HomeScroll01','HomePanel/RightPanel/HomeScroll',18},{'MusicScroll01','MusicPanel/RightPanel/MusicScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_ArtAppreciation_CN','UpperLeftPanel/Text_ArtAppreciation/Text_ArtAppreciation_CN',20},{'Text_ArtAppreciation_EN','UpperLeftPanel/Text_ArtAppreciation/Text_ArtAppreciation_EN',20},{'CNText','SwitchPanel/SwitchScroll/SwitchOther/Btn_Switch/CNText',20},{'CNText01','SwitchPanel/SwitchScroll/SwitchOther/Btn_SwitchHighLight/CNText',20},{'Text_Qieyeming','SwitchPanelSecond/Text_Qieyeming',20},{'collectedMusic_CN','MusicPanel/CollectedMusic/collectedMusic_CN',20},{'collectedMusic_EN','MusicPanel/CollectedMusic/collectedMusic_EN',20},{'collectedMusicCount','MusicPanel/CollectedMusic/collectedMusicCount',20},{'Text_CurMusicName','MusicPanel/Changpian/Text_CurMusicName',20},{'Text_Music','MusicPanel/Changpian/Text_Music',20},{'Text_Time','MusicPanel/Jindutiao/Text_Time',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---@type ArtGuideData[] 获取页签数据
    self.ArtGuideList = ArtAtlasControl.GetArtGuideData()
    ---注册滑块
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.SwitchCell))
    self.MainScroll01():SetLuaCellEvent(Handle(self, self.MainCell))
    self.EventScroll01():SetLuaCellEvent(Handle(self,self.EventCell))
    self.RoleScroll01():SetLuaCellEvent(Handle(self,self.RoleCell))
    self.HomeScroll01():SetLuaCellEvent(Handle(self,self.HomeCell))
    self.MusicScroll01():SetLuaCellEvent(Handle(self,self.MusicCell))
    ---初始化按钮
    self:InitBtn()
    ---当前选择的选项卡
    self.CurTab = nil
    ---当前选中选项卡对应的区域
    self.CurPanel = nil
    ---区域列表
    self.PanelList = {
        [1] = self.MainPanel().gameObject,
        [2] = self.EventPanel().gameObject,
        [3] = self.RolePanel().gameObject,
        [4] = self.HomePanel().gameObject,
        [5] = nil,
        [6] = self.MusicPanel().gameObject,
    }
    ---初始化右侧面板
    self:InitRightPanel()
    ---当前按钮是否暂停
    self.MusicPause = true
    ---当前正在播放的音乐
    self.playingMusic = nil
    ---当前选中的音乐obj
    self.CurMusicObj = nil
end

function M:OnShow()
    self.SwitchScroll01().totalCount = #self.ArtGuideList
    self.SwitchScroll01():RefillCells(0)
    self:InitMusic()
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回
    UIEvent.LuaClick(self.Btn_ReturnInfo().gameObject,function()
        ArtAtlasControl.CurType = nil
        MgrUI.GoBack()
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_ReturnHome().gameObject,function()
        ArtAtlasControl.CurType = nil
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---点击帮助
    UIEvent.LuaClick(self.Btn_I().gameObject,function()

    end)
    ---点击继续播放
    UIEvent.LuaClick(self.Btn_Play().gameObject,function()
        if self.playingMusic then
            self:PauseMusic()
        end
    end)
    ---点击暂停播放
    UIEvent.LuaClick(self.Btn_Stop().gameObject,function()
        if self.playingMusic then
            self:PauseMusic()
        end
    end)
    self.Btn_Stop().gameObject:SetActive(false) --隐藏暂停按钮
    ---点击下一首
    UIEvent.LuaClick(self.Btn_Next().gameObject,function()
        if self.playingMusic then
            self:PlayNextMusic()
        end
    end)
    ---点击上一首
    UIEvent.LuaClick(self.Btn_Last().gameObject,function()
        if self.playingMusic then
            self:PlayPrevMusic()
        end
    end)
end

---切换页签对应面板
function M:ChangePanel(panel)
    if self.CurPanel == panel then
        return
    end
    if self.CurPanel ~= nil then
        self.CurPanel:SetActive(false)
    end
    panel:SetActive(true)
    self.CurPanel = panel
end

---滑块回调
function M:SwitchCell(trans,idx)
    self:RefreshSwitch(trans.gameObject,self.ArtGuideList[idx])
end
function M:MainCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.MainChapterList[idx],self})
end
function M:EventCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.EventChapterList[idx],self})
end
function M:RoleCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.RoleList[idx],self})
end
function M:HomeCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.HomePlotList[idx],self})
end
function M:MusicCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.MusicList[idx],self})
end

---@param data ArtGuideData 刷新页签
function M:RefreshSwitch(obj,data)
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local lock = CJNUIMgr.GetSunUseName(obj, "Btn_Suo").gameObject
    local redDot = CJNUIMgr.GetSunUseName(obj, "RedDotIcon").gameObject
    local normalText = CJNUIMgr.GetSunUseName(normal, "CNText"):GetComponent("TextMeshProUGUI")
    local highText = CJNUIMgr.GetSunUseName(highLight, "CNText"):GetComponent("TextMeshProUGUI")
    ---名字
    normalText.text = data.name
    highText.text = data.name
    ---红点隐藏
    redDot:SetActive(false)
    ---是否显示锁
    lock:SetActive(not data:GetUnlockState())
    ---点击事件
    UIEvent.LuaClick(obj,function()
        self:OnClickSwitch(obj,data)
    end)
    ---默认选中1
    normal:SetActive(true)
    highLight:SetActive(false)

    if ArtAtlasControl.CurType == data.type or (self.CurTab == nil and ArtAtlasControl.CurType == nil)then
        self:OnClickSwitch(obj,data)
        self.CurTab = obj
    end
end

---@param data ArtGuideData 点击选项卡
function M:OnClickSwitch(obj,data)
    if self.CurTab == obj then
        return
    end
    if data:GetUnlockState() == false then
        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(data.systemId),1},true)
        return
    end
    ---如果当前已选择页签
    if self.CurTab then
        self:ChangerSwitch(self.CurTab,false)
        self:ChangerSwitch(obj,true)
    else
        self:ChangerSwitch(obj,true)
    end
    self.CurTab = obj
    ---切换区域
    self:ChangePanel(self.PanelList[data.id])
    ---如果点击音乐
    if data.type == 99 then
        ---刷新音乐自适应组件
        Tools.ReContentSizeGroup(self.MusicScroll01().content.gameObject)
    end
    ---当前类型赋值
    ArtAtlasControl.CurType = data.type
end

function M:ChangerSwitch(obj,state)
    if obj == nil then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    normal:SetActive(not state)
    highLight:SetActive(state)
end

---初始化右侧面板
function M:InitRightPanel()
    ---关闭所有面板
    for k,v in pairs(self.PanelList) do
        v:SetActive(false)
    end
    self:ReloadMainScroll()
    self:ReloadEventScroll()
    self:ReloadRoleScroll()
    self:ReloadHomeScroll()
    self:ReloadMusicScroll()
end

---刷新主线剧情
function M:ReloadMainScroll()
    self.MainChapterList = ArtAtlasControl.GetGuideChapter(1)
    self.MainScroll01().totalCount = #self.MainChapterList
    self.MainScroll01():RefillCells(0)
end

---刷新活动剧情
function M:ReloadEventScroll()
    self.EventChapterList = ArtAtlasControl.GetGuideChapter(2)
    self.EventScroll01().totalCount = #self.EventChapterList
    self.EventScroll01():RefillCells(0)
end

---刷新角色剧情
function M:ReloadRoleScroll()
    self.RoleList = ArtAtlasControl.GetRoleAtlasData()
    self.RoleScroll01().totalCount = #self.RoleList
    self.RoleScroll01():RefillCells(0)
end

function M:ReloadHomeScroll()
    self.HomePlotList = ArtAtlasControl.GetHomePlotData()
    self.HomeScroll01().totalCount = #self.HomePlotList
    self.HomeScroll01():RefillCells(0)
end

---刷新音乐图鉴
function M:ReloadMusicScroll()
    self.MusicList = ArtAtlasControl.GetMusicData()
    self.MusicScroll01().totalCount = #self.MusicList
    self.MusicScroll01():RefillCells(0)
end

---@param music Cgdex3LocalData 播放音乐
function M:PlayMusic(music)
    ---修改播放暂停按钮
    self.Btn_Play().gameObject:SetActive(false)
    self.Btn_Stop().gameObject:SetActive(true)
    self.Text_CurMusicName().text = music.name
    local path = MgrRes.GetLocalizedName(music.chapterpic)
    MgrRes.LoadSprite(self.Img_Changpian(),path)
    local time = string.split(music.time,",")
    local totalTime = tonumber(time[1]) * 60 + tonumber(time[2])    --歌曲时长单位秒
    ---修改按钮UI
    local obj = CJNUIMgr.GetSunUseName(self.MusicContent().gameObject, tostring(music.sortid)).gameObject
    self.MusicScroll01():ScrollToCell(music.sortid - 1,9000)
    self:ChangeMusicUI(self.CurMusicObj,false)
    self:ChangeMusicUI(obj,true)
    MgrTimer.Cancel("PlayingMusic")
    ---旋转唱片图片
    MgrTimer.AddDelayNoName(0.5,function()
        MgrTimer.AddRepeat("PlayingMusic",0.02, function()
            if MgrUI.GetCurUI().Uid == UID.ArtAppreciation_UI then
                self.Img_Changpian().gameObject.transform.localRotation = self.Img_Changpian().gameObject.transform.localRotation * Quaternion.Euler(Vector3(0,0,1))
            end
        end,totalTime * 50,self.ObjRoot)
    end,self.ObjRoot)

    ---如果是有音乐处于暂停状态，要先激活播放
    if self.MusicPause then
        self.MusicPause = false
        if MgrSound.CheckStatus(1,"GalleryMusic") == 2 then
            MgrSound.Pause(1,"GalleryMusic")
        end
    end
    MgrSound.StopAll()
    ---传入的为新音乐
    if music ~= self.playingMusic then
        self.playingMusic = music
        self.playEnd = false
        MgrSound.Stop(1,"GalleryMusic")
        MgrSound.PlayBGM(music.music,0.2,nil,false,100,0,"GalleryMusic")
        MgrTimer.Cancel("GalleryMusic")
    end
    self:StartNewRepeat(music)
end

---@param music Cgdex3LocalData 新音乐计时
function M:StartNewRepeat(music)
    self.musicPlayTime = 0
    local showT = {[2]=":"}
    local musicTime = string.split(music.time,",")
    local totalTime = tonumber(musicTime[1]) * 60 + tonumber(musicTime[2])    --总秒数

    MgrTimer.Cancel("GalleryMusic")

    MgrTimer.AddDelayNoName(0.5,function()
        MgrTimer.AddRepeat("GalleryMusic",0.5,function()
            if MgrUI.GetCurUI().Uid == UID.ArtAppreciation_UI then
                self.musicPlayTime = self.musicPlayTime + 0.5
                if math.modf(self.musicPlayTime / 60)<10 then
                    showT[1]="0"..math.modf(self.musicPlayTime / 60)
                else
                    showT[1]=math.modf(self.musicPlayTime / 60)
                end
                if math.modf(self.musicPlayTime % 60)<10 then
                    showT[3]="0"..math.modf(self.musicPlayTime % 60)
                else
                    showT[3]=math.modf(self.musicPlayTime % 60)
                end
                --showT = math.modf(self.musicPlayTime / 60)  .. ":" .. math.modf(self.musicPlayTime % 60)
                self.Text_Time().text = table.concat(showT) .. "/" .. musicTime[1] .. ":" .. musicTime[2]
                self.MusicSlider().transform:GetComponent("Slider").value = self.musicPlayTime / totalTime
                if self.musicPlayTime > totalTime then
                    self.playEnd = true
                end
            end
        end,2 * totalTime + 1,nil)
    end,nil)
end

--暂停播放音乐
function M:PauseMusic()
    if MgrTimer.IsTimerExist("GalleryMusic") then
        if self.MusicPause == false then
            self.MusicPause = true
            self.Btn_Stop().gameObject:SetActive(false)
            self.Btn_Play().gameObject:SetActive(true)
            MgrTimer.Pause("GalleryMusic")      --时间暂停
            MgrTimer.Pause("musicSwitch")
            MgrTimer.Pause("PlayingMusic")     --光盘转动
        else
            self.MusicPause = false
            self.Btn_Stop().gameObject:SetActive(true)
            self.Btn_Play().gameObject:SetActive(false)
            MgrTimer.Resume("GalleryMusic")     --时间继续
            MgrTimer.Resume("musicSwitch")
            MgrTimer.Resume("PlayingMusic")     --光盘转动
        end
        MgrSound.Pause(1,"GalleryMusic")                      --音乐暂停
    end
end

---初始化音乐计时器 实现连播效果
function M:InitMusic()
    if MgrTimer.IsTimerExist("musicSwitch") then
        MgrTimer.Cancel("musicSwitch")
    end
    --开启音乐计时器
    MgrTimer.AddRepeat("musicSwitch",0.1,function()
        if self.playEnd then
            self:PlayNextMusic()
        end
    end,-1,self.ObjRoot)
    ---初始化解锁音乐数量
    self.collectedMusicCount().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text128"),ArtAtlasControl.GetUnlockMusicCount(),#Cgdex3LocalData.tab)
end

---点击下一首音乐
function M:PlayNextMusic()
    if self.playingMusic ~= nil then
        self:PlayMusic(ArtAtlasControl.GetNextMusic(self.playingMusic))
        --self:MoveToCorrespondingMusic(self.CurMusicObj)
    end
end

---点击上一首音乐
function M:PlayPrevMusic()
    if self.playingMusic ~= nil then
        self:PlayMusic(ArtAtlasControl.GetPrevMusic(self.playingMusic))
        --self:MoveToCorrespondingMusic(self.CurMusicObj)
    end
end

---修改音乐UI
function M:ChangeMusicUI(obj,state)
    if obj == nil then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Music_NotPlaying").gameObject
    local high = CJNUIMgr.GetSunUseName(obj, "Music_Playing").gameObject
    normal:SetActive(not state)
    high:SetActive(state)
    if state == true then
        self.CurMusicObj = obj
    end
end

--移动到对应音乐位置
function M:MoveToCorrespondingMusic(chosenMusic)
    local musicPosition = chosenMusic.transform.localPosition
    local contentPosition = chosenMusic.transform.parent.transform.localPosition
    if musicPosition.y + contentPosition.y < -590 then
        local coro_Y = -115 - musicPosition.y
        self.MusicContent().transform:GetComponent("RectTransform").anchoredPosition = Vector2(0,coro_Y)
    end
    if musicPosition.y + contentPosition.y > 0 then
        local coro_Y = 0 - musicPosition.y
        self.MusicContent().transform:GetComponent("RectTransform").anchoredPosition = Vector2(0,coro_Y)
    end
end

--结束播放所有音乐
function M:CancelAllMusic()
    MgrTimer.Reset()
    MgrSound.StopAll()
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end
function M:OnClose()
    ---停播当前BGM
    if self.MusicPause and MgrSound.CheckStatus(1,"GalleryMusic") ~= -1 then
        MgrSound.Pause(1,"GalleryMusic")    --如果暂停了要先重启
    end
    if MgrSound.CheckStatus(1,"GalleryMusic") ~= -1 then
        MgrSound.Stop(1,"GalleryMusic")
    end
    MgrTimer.Cancel("PlayingMusic")
    MgrTimer.Cancel("GalleryMusic")
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end

return M