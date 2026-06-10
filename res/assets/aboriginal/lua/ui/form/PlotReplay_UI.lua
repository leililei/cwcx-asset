-- Code Auto Create Begin
local M = Class('PlotReplay_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlotReplay_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlotReplay_UI].prefab'
    self.Name = 'Form[PlotReplay_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'zhezhao','zhezhao',2},{'ChooseStormPanel','ChooseStormPanel',2},{'Img_Xian2','ChooseStormPanel/Img_Xian2',2},{'Img_Xian1','ChooseStormPanel/Img_Xian1',2},{'Btn_ReturnBg','ChooseStormPanel/Btn_ReturnBg',2},{'Btn_Return','ChooseStormPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','ChooseStormPanel/Btn_ReturnBg/Btn_Home',2},{'SwitchPanel','ChooseStormPanel/SwitchPanel',2},{'SwitchMain','ChooseStormPanel/SwitchPanel/Content/SwitchMain',2},{'Btn_Switch','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_Switch',2},{'weixuanzhongdi','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_Switch/weixuanzhongdi',2},{'Btn_SwitchHighLight','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_SwitchHighLight',2},{'xuanzhongdi','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_SwitchHighLight/xuanzhongdi',2},{'SwitchRctivity','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity',2},{'Btn_Switch01','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_Switch',2},{'weixuanzhongdi01','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_Switch/weixuanzhongdi',2},{'Btn_SwitchHighLight01','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_SwitchHighLight',2},{'xuanzhongdi01','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_SwitchHighLight/xuanzhongdi',2},{'SwitchOther','ChooseStormPanel/SwitchPanel/Content/SwitchOther',2},{'Btn_Switch02','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_Switch',2},{'weixuanzhongdi02','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_Switch/weixuanzhongdi',2},{'Btn_SwitchHighLight02','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_SwitchHighLight',2},{'xuanzhongdi02','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_SwitchHighLight/xuanzhongdi',2},{'toggleMask1','ChooseStormPanel/SwitchPanel/Content2/toggleMask1',2},{'toggleMask2','ChooseStormPanel/SwitchPanel/Content2/toggleMask2',2},{'toggleMask3','ChooseStormPanel/SwitchPanel/Content2/toggleMask3',2},{'StormBookContent','ChooseStormPanel/StormScroll/StormBookContent',2},{'PlotReplayPanel','PlotReplayPanel',2},{'StormBookContent01','PlotReplayPanel/StormScroll/StormBookContent',2},{'LeftPanel','PlotReplayPanel/LeftPanel',2},{'Jianjiezhezhao','PlotReplayPanel/LeftPanel/Jianjiezhezhao',2},{'Btu_Affter','PlotReplayPanel/LeftPanel/Btu_Affter',2},{'Btu_Bofang2','PlotReplayPanel/LeftPanel/Btu_Affter/Btu_Bofang2',2},{'Bofangicon2','PlotReplayPanel/LeftPanel/Btu_Affter/Bofangicon2',2},{'Btu_Before','PlotReplayPanel/LeftPanel/Btu_Before',2},{'Btu_Bofang1','PlotReplayPanel/LeftPanel/Btu_Before/Btu_Bofang1',2},{'Bofangicon1','PlotReplayPanel/LeftPanel/Btu_Before/Bofangicon1',2},{'Img_Biaotixian','PlotReplayPanel/LeftPanel/Img_Biaotixian',2},{'StormImgdi','PlotReplayPanel/LeftPanel/StormImgdi',2},{'StormImg','PlotReplayPanel/LeftPanel/StormImg',2},{'Img_Xian4','PlotReplayPanel/Img_Xian4',2},{'Img_Xian3','PlotReplayPanel/Img_Xian3',2},{'SwitchStorm','PlotReplayPanel/SwitchStorm',2},{'Btu_Right','PlotReplayPanel/SwitchStorm/Btu_Right',2},{'Img_You','PlotReplayPanel/SwitchStorm/Btu_Right/Img_You',2},{'Btu_Left','PlotReplayPanel/SwitchStorm/Btu_Left',2},{'Img_Zuo','PlotReplayPanel/SwitchStorm/Btu_Left/Img_Zuo',2},{'Img_IndexBG','PlotReplayPanel/SwitchStorm/Img_IndexBG',2},{'Btn_ReturnBg01','PlotReplayPanel/Btn_ReturnBg',2},{'Btn_Home01','PlotReplayPanel/Btn_ReturnBg/Btn_Home',2},{'Btn_Return01','PlotReplayPanel/Btn_ReturnBg/Btn_Return',2},{'Img_Fenggexian','Text_PlotReplay/Img_Fenggexian',2},{'Btn_I','Btn_I',2},
        -- UITemplate 列表
        {'StormBookItem','ChooseStormPanel/StormScroll/StormBookItem',10},{'CheckPointItem','PlotReplayPanel/StormScroll/CheckPointItem',10},
        -- Toggle 列表
        {'SwitchMain01','ChooseStormPanel/SwitchPanel/Content/SwitchMain',13},{'SwitchRctivity01','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity',13},{'SwitchOther01','ChooseStormPanel/SwitchPanel/Content/SwitchOther',13},
        -- RawImage 列表
        {'StormScroll','ChooseStormPanel/StormScroll',15},{'StormScroll01','PlotReplayPanel/StormScroll',15},
        -- LoopScrollRect 列表
        {'StormScroll02','ChooseStormPanel/StormScroll',18},{'StormScroll03','PlotReplayPanel/StormScroll',18},
        -- TextMeshProUGUI 列表
        {'EnText','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_Switch/EnText',20},{'CNText','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_Switch/CNText',20},{'EnText01','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_SwitchHighLight/EnText',20},{'CNText01','ChooseStormPanel/SwitchPanel/Content/SwitchMain/Btn_SwitchHighLight/CNText',20},{'EnText02','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_Switch/EnText',20},{'CNText02','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_Switch/CNText',20},{'EnText03','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_SwitchHighLight/EnText',20},{'CNText03','ChooseStormPanel/SwitchPanel/Content/SwitchRctivity/Btn_SwitchHighLight/CNText',20},{'EnText04','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_Switch/EnText',20},{'CNText04','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_Switch/CNText',20},{'EnText05','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_SwitchHighLight/EnText',20},{'CNText05','ChooseStormPanel/SwitchPanel/Content/SwitchOther/Btn_SwitchHighLight/CNText',20},{'Text_Zhandouhou','PlotReplayPanel/LeftPanel/Btu_Affter/Text_Zhandouhou',20},{'Text_Zhandouqian','PlotReplayPanel/LeftPanel/Btu_Before/Text_Zhandouqian',20},{'Text_Info','PlotReplayPanel/LeftPanel/Text_Info',20},{'Text_Juqingjianjie','PlotReplayPanel/LeftPanel/Text_Juqingjianjie',20},{'Text_StormIndex','PlotReplayPanel/SwitchStorm/Text_StormIndex',20},{'Text_SwitchStormName','PlotReplayPanel/SwitchStorm/Text_SwitchStormName',20},{'Text_PlotReplay_CN','Text_PlotReplay/Text_PlotReplay_CN',20},{'Text_PlotReplay_EN','Text_PlotReplay/Text_PlotReplay_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---加载战役数据缓存
    StormViewModel.ReloadStormData()
    ---@type StormPointData 当前选择的关卡
    self.CurPointData = nil     --当前选择关卡
    self.isFirst = true
    self.PlotReplayPanel().gameObject:SetActive(false)
    ---注册滑块
    self:RegisterLoopScroll()
end

function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---重新初始化按钮
    self:InitButton()
    ---如果是从活动界面跳入
    if EventRaidViewModel.JumpToPlot then
        EventRaidViewModel.JumpToPlot = false
        self.SwitchRctivity01().isOn = true
        self.Btu_Right().gameObject:SetActive(false)
        self.Btu_Left().gameObject:SetActive(false)
    end
end

---注册滑块
function M:RegisterLoopScroll()
    self.StormScroll02():SetLuaCellEvent(Handle(self,self.CellItem))    --大章节注册
    self.StormScroll03():SetLuaCellEvent(Handle(self,self.PlotCellItem))    --小章节注册
end

---剧情卷大章节回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self,idx})
end
---剧情卷小章节回调
function M:PlotCellItem(trans,idx)
    
    trans:GetComponent("UITemplate"):SetData({self.CurPlotLoopList[idx],self,idx})
end

---设置卷滑动数据      小章节数据更新
function M:ReloadPlotData(offset)
    ---获取当前loop数据
    self.CurPlotLoopList = IllustrationViewModel.GetCurPointDataList()
    if #self.CurPlotLoopList == 0 then
        self.Btu_Affter().gameObject:SetActive(false)
        self.Btu_Before().gameObject:SetActive(false)
        self.StormScroll03().totalCount = 0
        self.StormScroll03():RefillCells(0)               ---只刷新数据
        return
    end
    if self.isFirst then
        self.CurPointData = self.CurPlotLoopList[StormViewModel.CurChoosePlot]
        local data = string.split(self.CurPointData[2],",")
        self.NoviceData = data
        if  self.NoviceData [1] == "NovicePlot" then
            self.CurPointData.isSelect = true
            self.Btu_Affter().raycastTarget = true
            self.Btu_Before().raycastTarget = true
        else
            if StormControl.CheckPointLock(self.CurPointData.id) then
                self.Btu_Affter().raycastTarget = true
                self.Btu_Before().raycastTarget = true
                self.CurPointData.isSelect = true
            else
                self.Btu_Affter().raycastTarget = false
                self.Btu_Before().raycastTarget = false
                self.CurPointData.isSelect = false
            end
        end

        self.isFirst = false
    end
    ---设置Loop数量
    self.StormScroll03().totalCount = #self.CurPlotLoopList
    if offset then
        self.StormScroll03():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.StormScroll03():RefillCells(0)               ---只刷新数据
    end
end
---设置卷滑动数据      大章节数据更新
function M:ReloadData(offset)
    ---获取当前loop数据
    self.CurLoopList = IllustrationViewModel.GetStormScrollData(1)
    ---设置Loop数量
    self.StormScroll02().totalCount = #self.CurLoopList
    if offset then
        self.StormScroll02():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.StormScroll02():RefillCells(0)               ---只刷新数据
    end
end
---设置卷滑动数据      活动数据更新
function M:ReloadData_Activity(offset)
    ---获取当前loop数据
    self.CurLoopList = SummerMapControl.GetPlotData()
    ---设置Loop数量
    self.StormScroll02().totalCount = #self.CurLoopList
    if offset then
        self.StormScroll02():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.StormScroll02():RefillCells(0)               ---只刷新数据
    end
end

---初始化按钮
function M:InitButton()
    local toggles = {
        [1] = self.SwitchMain01(),
        [2] = self.SwitchRctivity01(),
        [3] = self.SwitchOther01()
    }

    local CallBack = {
        [1] = Handle(self, self.OnClickMainSwitch),
        [2] = Handle(self, self.OnClickRctivitySwitch),
        [3] = Handle(self, self.OnClickOtherSwitch)
    }
    ---开关遮罩是否解锁
    local maskOn = {
        [1] = true,
        [2] = true,
        [3] = true
    }
    local maskPanels = {
        [1] = self.toggleMask1(),
        [2] = self.toggleMask2(),
        [3] = self.toggleMask3()
    }

    for idx,mask in pairs(maskPanels) do
        if maskOn[idx] then
            maskPanels[idx].raycastTarget = false
        else
            maskPanels[idx].raycastTarget = true
            UIEvent.LuaClick(maskPanels[idx].gameObject,function()
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("plotreplay_ui_tips1"),1},true)
            end)
        end
    end

    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Btn_Switch","Btn_SwitchHighLight")
        high:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self.OnLeftToggleClick(...,normal,high, CallBack[idx])
        end,nil)
    end

    -----活动未解锁，按钮置灰
    --if EventRaidControl.GetEventRaidData() then
    --    self.SwitchRctivity().transform:Find("Btn_Switch").transform:Find("CNText"):GetComponent("Text").color = Color(0,0,0,1)
    --else
    --    self.SwitchRctivity().transform:Find("Btn_Switch").transform:Find("CNText"):GetComponent("Text").color = Color(0,0,0,0.3)
    --end

    self.SwitchOther01().gameObject:SetActive(false)
    if IllustrationViewModel.curPlotType == IllustrationViewModel.plotType.Plot then
        self.SwitchRctivity01().isOn = false
        self.SwitchRctivity01().isOn = true
        IllustrationViewModel.curPlotType = IllustrationViewModel.plotType.Main
    else
        self.SwitchMain01().isOn = false
        self.SwitchMain01().isOn = true
    end


    UIEvent.LuaClick(self.Btn_Home().gameObject, Handle(self, function ()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self, function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        IllustrationViewModel.Close()
    end))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(83)
    end))
    UIEvent.LuaClick(self.Btn_Home01().gameObject, Handle(self, function ()
        MgrUI.GoBackTo(UID.Home_UI)
        if self.CurPointData then
            self.CurPointData.isSelect = false
            self.CurPointData = nil
        end
        StormViewModel.CurChoosePlot =1
    end))
    UIEvent.LuaClick(self.Btn_Return01().gameObject, Handle(self, function ()
        self.ChooseStormPanel().gameObject:SetActive(true)
        self.PlotReplayPanel().gameObject:SetActive(false)
        if self.CurPointData then
            self.CurPointData.isSelect = false
            self.CurPointData = nil
        end
        StormViewModel.CurChoosePlot =1
        --self:ReloadData()
    end))

    UIEvent.LuaClick(self.Btu_Right().gameObject, Handle(self, function ()
        self:UpdataNextPlotPanel(false)
    end))

    UIEvent.LuaClick(self.Btu_Left().gameObject, Handle(self, function ()
        self:UpdataNextPlotPanel(true)
    end))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        local isPlotReplayPanel = self.PlotReplayPanel().gameObject.activeSelf
        if isPlotReplayPanel then
            self.ChooseStormPanel().gameObject:SetActive(true)
            self.PlotReplayPanel().gameObject:SetActive(false)
            -- if self.CurPointData then
            --     self.CurPointData.isSelect = false
            --     self.CurPointData = nil
            -- end
            -- StormViewModel.CurChoosePlot =1

            -- IllustrationViewModel.Close()
            --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        end
    end
end

---获取高光组件
function M.GetHighObj(Obj,normalStr,highStr)
    return Obj.transform:Find(normalStr).gameObject, Obj.transform:Find(highStr).gameObject
end
---Toggle事件
function M.OnLeftToggleClick(isOn, normal, high,initFun)
    normal:SetActive(not isOn)
    high:SetActive(isOn)
    if isOn then
        initFun()
    end
end

---更新左侧剧情简介
function M:UpdataPlotLeftPanel(callback)
    if self.CurPointData then
        if self.CurPointData.isSelect then
            self.LeftPanel().gameObject:SetActive(true)
            --self.CurPointData.id == 991 or self.CurPointData.id == 992 or self.CurPointData.id == 993 then
            if self.NoviceData and self.NoviceData[1] == "NovicePlot" then
                if self.NoviceData[3] ~= "0" then
                    self.Btu_Before().gameObject:SetActive(true)
                    --更新战前按钮事件
                    UIEvent.LuaClick(self.Btu_Before().gameObject,Handle(self,function()
                        Event.Remove("BackKey", Handle(self, self.OnBackKey))
                        if callback then
                            callback()
                        end
                        PlotViewModel.OpenPlotUI(NoviceControl.GetNoviceDataByID(tonumber(self.NoviceData[3])).plotName,function()
                            --播放完毕打开对应关卡剧情回放界面
                            self:ItemClick()
                            --PlotViewModel.CurPointData
                        end,false)
                    end))
                else
                    self.Btu_Before().gameObject:SetActive(false)
                end
                if self.NoviceData[4] ~= "0" then     --战后剧情不为0,解锁战后按钮
                    self.Btu_Affter().gameObject:SetActive(true)
                    --更新战后按钮事件
                    UIEvent.LuaClick(self.Btu_Affter().gameObject,Handle(self,function()
                        if callback then
                            callback()
                        end
                        PlotViewModel.OpenPlotUI(NoviceControl.GetNoviceDataByID(tonumber(self.NoviceData[4])).plotName,function()
                            --播放完毕打开对应关卡剧情回放界面
                            self:ItemClick()
                        end,false)
                    end))
                else
                    self.Btu_Affter().gameObject:SetActive(false)
                end
                self.Text_Info().text = self.NoviceData[6]
                MgrRes.LoadSprite(self.StormImg(),"ArtGallery/PlotCg/"..self.NoviceData[5])
            else
                if self.CurPointData.plot_f ~= "0" then     --战前剧情不为0,解锁战前按钮
                    self.Btu_Before().gameObject:SetActive(true)
                else
                    self.Btu_Before().gameObject:SetActive(false)
                end
                if self.CurPointData.plot_l ~= "0" then     --战后剧情不为0,解锁战后按钮
                    self.Btu_Affter().gameObject:SetActive(true)
                else
                    self.Btu_Affter().gameObject:SetActive(false)
                end
                --更新剧情简介
                self.Text_Info().text = self.CurPointData.introduction
                --更新战前按钮事件
                UIEvent.LuaClick(self.Btu_Before().gameObject,Handle(self,function()
                    Event.Remove("BackKey", Handle(self, self.OnBackKey))
                    if callback then
                        callback()
                    end
                    PlotViewModel.OpenPlotUI(self.CurPointData.plot_f,function()
                        --播放完毕打开对应关卡剧情回放界面
                        self:ItemClick()
                        --PlotViewModel.CurPointData
                    end,false)

                end))
                --更新战后按钮事件
                UIEvent.LuaClick(self.Btu_Affter().gameObject,Handle(self,function()
                    if callback then
                        callback()
                    end
                    PlotViewModel.OpenPlotUI(self.CurPointData.plot_l,function()
                        --播放完毕打开对应关卡剧情回放界面
                        self:ItemClick()
                    end,false)
                end))
                MgrRes.LoadSprite(self.StormImg(),"ArtGallery/PlotCg/"..self.CurPointData.bgpicture)
            end
        else
            self.LeftPanel().gameObject:SetActive(false)
        end
    end
end
---更新右下
function M:UpdataSwitchStorm()
    if IllustrationViewModel.CurScrollData.type == 999 then
        self.Text_StormIndex().text = MgrLanguageData.GetLanguageByKey("plotreplay_ui_introduction")
        self.Text_SwitchStormName().text =  MgrLanguageData.GetLanguageByKey("plotreplay_ui_introduction")
    else
        self.Text_StormIndex().text =IllustrationViewModel.CurScrollData.alias
        self.Text_SwitchStormName().text =  IllustrationViewModel.CurScrollData.name
    end
end
---更新下一个卷关卡数据
function M:UpdataNextPlotPanel(isLeft)
    local data = nil
    StormViewModel.CurChoosePlot = 1
    if IllustrationViewModel.CurScrollData.type == 999 or IllustrationViewModel.CurScrollData.id == 100000 then
        if isLeft then
            if IllustrationViewModel.CurScrollData.id == 100000 then
                data = IllustrationViewModel.StormScrollData[1]
                if data then
                    if self.CurPointData then
                        self.CurPointData.isSelect = false
                        self.CurPointData = nil
                    end
                    IllustrationViewModel.CurScrollData = data      --获取下一篇数据
                    IllustrationViewModel.GetStormPointData()
                    self.isFirst = true
                    self:ReloadPlotData()
                    self:UpdataPlotLeftPanel()
                    self:UpdataSwitchStorm()
                end
            else
                return
            end
        else
            if IllustrationViewModel.CurScrollData.id == 100000 then
                data = IllustrationViewModel.GetNextStormData(isLeft)
            else
                data = IllustrationViewModel.StormScrollData[2]
            end
            if data then
                if StormControl.CheckScrollLock(data.id) then
                    if self.CurPointData then
                        self.CurPointData.isSelect = false
                        self.CurPointData = nil
                    end
                    IllustrationViewModel.CurScrollData = data      --获取下一篇数据
                    IllustrationViewModel.GetStormPointData()
                    self.isFirst = true
                    self:ReloadPlotData()
                    self:UpdataPlotLeftPanel()
                    self:UpdataSwitchStorm()
                else
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
                end
            end
        end
    else
        data = IllustrationViewModel.GetNextStormData(isLeft)
        if data then
            if StormControl.CheckScrollLock(data.id) then
                if self.CurPointData then
                    self.CurPointData.isSelect = false
                    self.CurPointData = nil
                end
                IllustrationViewModel.CurScrollData = data      --获取下一篇数据
                IllustrationViewModel.GetStormPointData()
                self.isFirst = true
                self:ReloadPlotData()
                self:UpdataPlotLeftPanel()
                self:UpdataSwitchStorm()
            else
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
            end
        end
    end
end

---切换到主线剧情
function M:OnClickMainSwitch()
    self:ReloadData()
end
---切换到活动剧情
function M:OnClickRctivitySwitch()
    --MgrUI.Pop(UID.PopTip_UI,{"活动剧情维护中",1},true)
    if EventRaidControl.GetEventRaidData() then
        self:ReloadData_Activity()
    end
    self:ReloadData_Activity()
end
---切换到其他剧情
function M:OnClickOtherSwitch()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("plotreplay_ui_tips2"),1},true)
end

---通过卷进入关卡剧情回放
function M:ItemClick()
    IllustrationViewModel.GetStormPointData()                   --加载所有本卷对应关卡信息
    if #IllustrationViewModel.CurPointDataList ~= 0 then
        self.ChooseStormPanel().gameObject:SetActive(false)     --大章节按钮关闭
        self.PlotReplayPanel().gameObject:SetActive(true)       --小章节按钮打开
        self.isFirst = true
        self:ReloadPlotData()                                   --加载该卷小关卡信息
        self:UpdataPlotLeftPanel()                              --更新左侧面板
        self:UpdataSwitchStorm()                                --更新右下
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("plotreplay_ui_tips3"),2},true)
    end
end

---点击关卡
---@param PointData StormPointData
function M:PointItemClick(PointData,callback,index)
    if index then
        StormViewModel.CurChoosePlot = index
    end
    if self.CurPointData then
        self.CurPointData.isSelect = false
    end
    self.CurPointData = PointData
    if PointData[2] and string.split(PointData[2],",")[1] == "NovicePlot" then
        self.NoviceData = string.split(PointData[2],",")
    end
    self.CurPointData.isSelect = true
    PlotViewModel.CurPointData = PointData  --播放完毕时需要调用这个值
    self.StormScroll03():RefreshCells()
   -- self:ReloadPlotData()
    self:UpdataPlotLeftPanel(callback)
end

return M