-- Code Auto Create Begin
local M = Class('Plot_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Plot_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Plot_UI].prefab'
    self.Name = 'Form[Plot_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel_Scale','Panel_Scale',2},{'zuobian','Panel_Scale/zuobian',2},{'youbian','Panel_Scale/youbian',2},{'BlackMask','SceneEffectContent/BlackMask',2},{'LBCutMask','SceneEffectContent/LBCutMask',2},{'Panel','SceneEffectContent/LBCutMask/Panel',2},{'Panel(1)','SceneEffectContent/LBCutMask/Panel (1)',2},{'RBCutMask','SceneEffectContent/RBCutMask',2},{'Panel01','SceneEffectContent/RBCutMask/Panel',2},{'Panel(1)01','SceneEffectContent/RBCutMask/Panel (1)',2},{'LWCutMask','SceneEffectContent/LWCutMask',2},{'Panel02','SceneEffectContent/LWCutMask/Panel',2},{'Panel(1)02','SceneEffectContent/LWCutMask/Panel (1)',2},{'RWCutMask','SceneEffectContent/RWCutMask',2},{'Panel03','SceneEffectContent/RWCutMask/Panel',2},{'Panel(1)03','SceneEffectContent/RWCutMask/Panel (1)',2},{'LBlack','SceneEffectContent/LBlack',2},{'RBlackMask','SceneEffectContent/RBlackMask',2},{'TBlackMask','SceneEffectContent/TBlackMask',2},{'BBlackMask','SceneEffectContent/BBlackMask',2},{'CurtainPrefab','CurtainPrefab',2},{'BtmContent','CurtainPrefab/BtmContent',2},{'SpineContent','CurtainPrefab/SpineContent',2},{'USMContent','CurtainPrefab/USMContent',2},{'TopContent','CurtainPrefab/TopContent',2},{'MusicContent','CurtainPrefab/MusicContent',2},{'DramaContent','CurtainPrefab/DramaContent',2},{'EffectContent','CurtainPrefab/EffectContent',2},{'ItemPrefab','ItemPrefab',2},{'ImagePrefab','ItemPrefab/ImagePrefab',2},{'Spine_left','ItemPrefab/Spine_left',2},{'Root','ItemPrefab/Spine_left/Root',2},{'CharacterLayer','ItemPrefab/Spine_left/Root/CharacterLayer',2},{'Bg','ItemPrefab/Spine_left/Root/Bg',2},{'Spine_mid','ItemPrefab/Spine_mid',2},{'Root01','ItemPrefab/Spine_mid/Root',2},{'CharacterLayer01','ItemPrefab/Spine_mid/Root/CharacterLayer',2},{'Bg01','ItemPrefab/Spine_mid/Root/Bg',2},{'Spine_right','ItemPrefab/Spine_right',2},{'Root02','ItemPrefab/Spine_right/Root',2},{'CharacterLayer02','ItemPrefab/Spine_right/Root/CharacterLayer',2},{'Bg02','ItemPrefab/Spine_right/Root/Bg',2},{'DramaPrefab','ItemPrefab/DramaPrefab',2},{'Image','ItemPrefab/DramaPrefab/Text_Name/Image',2},{'USMPrefab','ItemPrefab/USMPrefab',2},{'Panel_Ctr','Panel_Ctr',2},{'UINextPlot','Panel_Ctr/UINextPlot',2},{'UINextText','Panel_Ctr/UINextText',2},{'UIFastPlot','Panel_Ctr/UIFastPlot',2},{'Btn_Jump','Panel_Ctr/Btn_Jump',2},{'Img_Anniud5','Panel_Ctr/Btn_Jump/Img_Anniud5',2},{'Tiaoguoicon','Panel_Ctr/Btn_Jump/Img_Anniud5/Tiaoguoicon',2},{'Btn_Auto','Panel_Ctr/Btn_Auto',2},{'Img_Anniudi4','Panel_Ctr/Btn_Auto/Img_Anniudi4',2},{'AutoIcon','Panel_Ctr/Btn_Auto/Img_Anniudi4/AutoIcon',2},{'Tog_Click','Panel_Ctr/Tog_Click',2},{'Img_UITop','Panel_Ctr/Tog_Click/Img_UITop',2},{'Zhankaiicon(xia)','Panel_Ctr/Tog_Click/Img_UITop/Zhankaiicon(xia)',2},{'Img_UIBottom','Panel_Ctr/Tog_Click/Img_UIBottom',2},{'Zhankaiicon','Panel_Ctr/Tog_Click/Img_UIBottom/Zhankaiicon',2},{'UIPanel','Panel_Ctr/Tog_Click/ClickPanel/UIPanel',2},{'Btn_Setting','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Setting',2},{'Img_Anniudi1','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Setting/Img_Anniudi1',2},{'shezhiicon','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Setting/Img_Anniudi1/shezhiicon',2},{'Btn_Hide','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Hide',2},{'Img_Anniudi2','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Hide/Img_Anniudi2',2},{'Yincangiicon','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Hide/Img_Anniudi2/Yincangiicon',2},{'Btn_Record','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Record',2},{'Img_Anniudi3','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Record/Img_Anniudi3',2},{'Lishiiicon','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Record/Img_Anniudi3/Lishiiicon',2},{'UIReHide','UIReHide',2},{'Sanjiao','Sanjiao',2},{'OptionPanel','OptionPanel',2},{'cankao','OptionPanel/cankao',2},{'Mask','OptionPanel/Mask',2},{'Img_Juesedi','OptionPanel/Img_Juesedi',2},{'Img_Juese','OptionPanel/Img_Juesedi/Img_Juese',2},{'OptionContent','OptionPanel/OptionContent',2},{'Btn_Option','OptionPanel/OptionContent/Btn_Option',2},{'Btn_Option1','OptionPanel/OptionContent/Btn_Option1',2},{'Btn_Option2','OptionPanel/OptionContent/Btn_Option2',2},
        -- Button 列表
        {'UINextText01','Panel_Ctr/UINextText',4},{'UIReHide01','UIReHide',4},{'Btn_Option01','OptionPanel/OptionContent/Btn_Option',4},{'Btn_Option101','OptionPanel/OptionContent/Btn_Option1',4},{'Btn_Option201','OptionPanel/OptionContent/Btn_Option2',4},
        -- Toggle 列表
        {'Tog_Click01','Panel_Ctr/Tog_Click',13},
        -- RawImage 列表
        {'SpineRawImage','ItemPrefab/Spine_left/Root/CharacterLayer/SpineRawImage',15},{'RawImage','ItemPrefab/Spine_left/Root/CharacterLayer/RawImage',15},{'SpineRawImage01','ItemPrefab/Spine_mid/Root/CharacterLayer/SpineRawImage',15},{'RawImage01','ItemPrefab/Spine_mid/Root/CharacterLayer/RawImage',15},{'SpineRawImage02','ItemPrefab/Spine_right/Root/CharacterLayer/SpineRawImage',15},{'RawImage02','ItemPrefab/Spine_right/Root/CharacterLayer/RawImage',15},{'AudioPrefab','ItemPrefab/AudioPrefab',15},{'Tex1','CacheTex/Tex1',15},{'Tex2','CacheTex/Tex2',15},
        -- TextMeshProUGUI 列表
        {'Text_Name','ItemPrefab/DramaPrefab/Text_Name',20},{'Text_Content','ItemPrefab/DramaPrefab/Text_Content',20},{'Text_Tiaoguo','Panel_Ctr/Btn_Jump/Text_Tiaoguo',20},{'Text_Zidong','Panel_Ctr/Btn_Auto/Text_Zidong',20},{'qita','Panel_Ctr/Tog_Click/Img_UITop/qita',20},{'Text_Shezhi','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Setting/Text_Shezhi',20},{'Text_Yincang','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Hide/Text_Yincang',20},{'Text_Lishi','Panel_Ctr/Tog_Click/ClickPanel/UIPanel/Btn_Record/Text_Lishi',20},{'Text_CurIndex','Text_CurIndex',20},{'Text_Option','OptionPanel/OptionContent/Btn_Option/Text_Option',20},{'Text_Option01','OptionPanel/OptionContent/Btn_Option1/Text_Option',20},{'Text_Option02','OptionPanel/OptionContent/Btn_Option2/Text_Option',20},
    }
end
-- Code Auto Create End
---@class CurtainObj 幕实例结构
local CurtainObj = {
    CObj = nil,
    BtmRoot = nil,
    SpineRoot = nil,
    SpineRtRoot = nil,
    USMRoot = nil,
    TopRoot = nil,
    MusicRoot = nil,
    DramaRoot = nil,
    EffectRoot = nil,
    SEffectRoot = nil,

    TabBImage = {},
    TabTImage = {},
    TabSpine = {},
    TabSpineRT = {},
    --TabAudio = {},
    Drama = {},
    TabEffect = {},
    TabUSM = {},
}
---初始化剧情
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---注册展开按钮
    self.UIClickRoot = self.UIPanel().transform
    self.UIClickTog = self.Tog_Click01()
    self.Img_UITop().gameObject:SetActive(not self.UIClickTog.isOn)
    self.Img_UIBottom().gameObject:SetActive(self.UIClickTog.isOn)
    self.isEnd = false
    ---隐藏选项按钮
    self.Btn_Option().gameObject:SetActive(false)
    ---点击展开按钮
    Tools.ToggleValueChange(self.UIClickTog,function(isOn)
        self.Img_UITop().gameObject:SetActive(not isOn)
        self.Img_UIBottom().gameObject:SetActive(isOn)
        local y = isOn and 130 or 727
        Tools.DoPosMove(self.UIClickRoot, 0, y, 0.3, 0, 1, false, 0, 0)
    end,nil)

    ---点击查看记录
    UIEvent.LuaClick(self.Btn_Record().gameObject,function()
        ---关闭自动
        if self.AutoNext then
            self.AutoNext = false
            self.AutoIcon:GetComponent("UIDoRotateEndless").enabled = false
            self.AutoIcon.transform.localRotation = Quaternion(0,0,0,0)
        end
        print(self.historyData)
        MgrUI.Pop(UID.PlotRecordPop_UI,{self.historyData},true)
    end)
    self.UIReHide = self.UIReHide().gameObject
    self.UIReHide:SetActive(false)
    ---点击隐藏UI
    UIEvent.LuaClick(self.Btn_Hide().gameObject,function()
        self.UIReHide:SetActive(true)
        self.Panel_Ctr().gameObject:SetActive(false)
        for i, v in pairs(self.tabCurtain) do
            if v ~= nil and v.DramaRoot ~= nil then
                v.DramaRoot.localPosition = Vector3(0,10000,0)
            end
        end
    end)
    UIEvent.LuaClick(self.UIReHide,function()
        self.UIReHide:SetActive(false)
        self.Panel_Ctr().gameObject:SetActive(true)
        for i, v in pairs(self.tabCurtain) do
            if v ~= nil and v.DramaRoot ~= nil then
                v.DramaRoot.localPosition = Vector3(0,0,0)
            end
        end
    end)
    ---点击设置
    UIEvent.LuaClick(self.Btn_Setting().gameObject,function()
        MgrUI.Pop(UID.SettingPop_UI,{{2,1,6}},true)
    end)
    ---获取当前剧情数据
    self.plotData = PlotViewModel.curPlotPb
    ---历史数据
    self.historyData = {}
    ---获取幕RT节点
    MgrRes.GetPrefab("ABOriginal/Prefab/Template/Plot.prefab",function(obj)
        self.plotRtRoot = obj.transform
        ---获取幕节点
        self.plotRoot = self.Panel_Scale().gameObject.transform
        ---获取幕预制
        self.pCurtainPre = self.CurtainPrefab().gameObject
        ---@type CurtainObj[]幕实例
        self.tabCurtain = {}
        ---幕加载状态列表，用作记录幕是否加载完成
        self.CStateList = {}
        ---隐藏预制节点
        self.ItemPrefab().gameObject:SetActive(false)
        ---图层预制
        self.ImagePrefab = self.ImagePrefab()
        ---立绘预制
        self.SpineMidPrefab = self.Spine_mid().gameObject
        self.SpineLeftPrefab = self.Spine_left().gameObject
        self.SpineRightPrefab = self.Spine_right().gameObject
        self.SpineFrameEffect = self.plotRtRoot:Find("CommunicationBox").gameObject
        self.SpineFrameEffect:SetActive(false)
        self.SpineRtPrefab = self.plotRtRoot:Find("SpineRtPrefab").gameObject
        self.SpineRtPrefab:SetActive(false)
        ---为立绘通话特效创建RT
        Tools.SetPlotBoxRT(self.SpineFrameEffect,self.Spine_left().transform:Find("Root/CharacterLayer/RawImage"):GetComponent("RawImage"),30)
        Tools.SetPlotBoxRT(self.SpineFrameEffect,self.Spine_mid().transform:Find("Root/CharacterLayer/RawImage"):GetComponent("RawImage"),30)
        Tools.SetPlotBoxRT(self.SpineFrameEffect,self.Spine_right().transform:Find("Root/CharacterLayer/RawImage"):GetComponent("RawImage"),30)
        ---音效预制
        self.AsPrefab = self.AudioPrefab():GetComponent("AudioSource")
        ---文本预制
        self.DramaPrefab = self.DramaPrefab().gameObject
        ---特效预制
        self.EffectPrefab = self.plotRtRoot:Find("EffectPrefab").gameObject
        ---屏效
        self.sEffectObj = nil
        ---屏效：透明遮罩
        self.sMask = self.BlackMask()
        ---屏效：左黑遮罩
        self.slbMask = self.LBCutMask():GetComponent("RectTransform")
        ---屏效：右黑遮罩
        self.srbMask = self.RBCutMask():GetComponent("RectTransform")
        ---屏效：左白遮罩
        self.slwMask = self.LWCutMask():GetComponent("RectTransform")
        ---屏效：右白遮罩
        self.srwMask = self.RWCutMask():GetComponent("RectTransform")
        ---视频预制
        self.UsmPrefab = self.USMPrefab()
        ---下一段文本
        self.NextTextBtn = self.UINextText():GetComponent("Button")
        self.UINextText().gameObject:SetActive(false)
        ---当前幕播放时间（精度.1f）
        self.curPlayTime = 0
        ---最大跳幕时间
        self.curJumpTime = 0
        ---当前进度
        self.CurIndex = 1
        UIEvent.LuaClick(self.UINextPlot().gameObject,function()
            self:PlayNextPlot()
        end)
        self.longTime = 0
        MgrTimer.AddRepeat("PlotTime",0.1,function()
            self.longTime = self.longTime + 0.1
        end,-1,nil)
        ---快进幕点击事件
        UIEvent.AlwaysLongClick(self.UIFastPlot().gameObject,function(isDown)
            if self.CurIndex < 2 then
                ---初始化完成前不允许操作
                return
            end
            if self.CurIndex > #self.plotData.curtains + 1 then
                ---大于最后幕不允许操作
                return
            end
            ---关闭自动
            if self.AutoNext then
                self.AutoNext = false
                self.AutoIcon:GetComponent("UIDoRotateEndless").enabled = false
                self.AutoIcon.transform.localRotation = Quaternion(0,0,0,0)
            end
            if isDown then
                ---快进逻辑
                if self.longTime > 0.1 then
                    self.longTime = 0
                    self:CheckCurtainOrPlay(self.CurIndex)
                else
                    local data = self:GetCurtainData(self.curLayer)
                    local curObj = self.tabCurtain[self.curLayer]
                    if data ~= nil and curObj ~= nil then
                        curObj.Drama.transform:Find("Text_Name"):GetComponent("TextMeshProUGUI").text = data.drama.name
                        local s,_ = string.find(data.drama.content,"%[wait]")
                        if s ~= nil then
                            Tools.KillDoPTwoText()
                        end
                        Tools.DoPFade(curObj.Drama:GetComponent("Image"),SettingViewModel.GetDramaAlpha()/100,0,0,1,false,0,0,function()
                            Tools.DoPText(curObj.Drama.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI"),string.gsub(data.drama.content,"%[wait]",""),5000,1,0)
                        end)
                    end
                end
            elseif self.curJumpTime == 0 then
                ---模拟点击逻辑
                local data = self:GetCurtainData(self.curLayer)
                local curObj = self.tabCurtain[self.curLayer]
                if data ~= nil and curObj ~= nil then
                    if self.isJump then
                        self.CurIndex = self.jumpData.layer + 1
                    end
                    if data.drama.content == nil or data.drama.content == "" or curObj.Drama.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI").text == string.gsub(data.drama.content,"%[wait]","") then
                        self:CheckCurtainOrPlay(self.CurIndex)
                    else
                        self.UIFastPlot().gameObject:SetActive(false)
                        if data.drama.boxDelay == nil or tonumber(os.time()) - self.curPlayTime > data.drama.boxDelay then
                            curObj.Drama.transform:Find("Text_Name"):GetComponent("TextMeshProUGUI").text = data.drama.name
                            local s,_ = string.find(data.drama.content,"%[wait]")
                            if s == nil then
                                Tools.DoPFade(curObj.Drama:GetComponent("Image"),SettingViewModel.GetDramaAlpha()/100,0,0,1,false,0,0,function()
                                    Tools.DoPText(curObj.Drama.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI"),string.gsub(data.drama.content,"%[wait]",""),5000,1,0)
                                end)
                            end
                        end
                    end
                end
            end
        end)
        ---跳幕锁
        self.AutoNext = false
        self.autoOnce = true
        self.AutoIcon = self.AutoIcon()
        self.AutoIcon:GetComponent("UIDoRotateEndless").enabled = self.AutoNext
        ---自动点击事件
        UIEvent.LuaClick(self.Btn_Auto().gameObject,function()
            if self.CurIndex < 2 then
                ---初始化完成前不允许操作
                return
            end
            self.AutoNext = not self.AutoNext
            self.AutoIcon:GetComponent("UIDoRotateEndless").enabled = self.AutoNext
            if self.AutoNext == false then
                self.AutoIcon.transform.localRotation = Quaternion.Euler(0, 0, 0)
            end
            self.UIClickTog.isOn = false
        end)
        ---自动跳幕
        MgrTimer.AddRepeat("PlotAutoJump",0.2,function()
            if self.curJumpTime > 0 then
                ---设置了最大跳幕时间
                if tonumber(os.time()) - self.curPlayTime > self.curJumpTime then
                    ---到时间自动跳幕
                    self:CheckCurtainOrPlay(self.CurIndex)
                end
                return
            end
            if self.CurIndex < 2 then
                ---初始化完成前不允许操作
                return
            end
            if self.AutoNext then
                local data = self:GetCurtainData(self.curLayer)
                local curObj = self.tabCurtain[self.curLayer]
                if data ~= nil and curObj ~= nil then
                    if self.isJump then
                        self.CurIndex = self.jumpData.layer + 1
                    end
                    local s,_ = string.find(data.drama.content,"%[wait]")
                    if s ~= nil and curObj.Drama.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI").text ~= string.gsub(data.drama.content,"%[wait]","") and self.autoOnce == true then
                        local s,_ = string.find(data.drama.content,"%[wait]")
                        if s ~= nil then
                            Tools.KillDoPTwoText()
                        end
                        Tools.DoPFade(curObj.Drama:GetComponent("Image"),SettingViewModel.GetDramaAlpha()/100,0.5,data.drama.boxDelay,1,false,0,0,function()
                            Tools.DoPText(curObj.Drama.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI"),string.gsub(data.drama.content,"%[wait]",""),data.drama.speed,data.drama.curve,data.drama.delay)
                        end)
                        self.autoOnce = false
                    else
                        if tonumber(os.time()) - self.curPlayTime > self:GetNextTime() then
                            print(self.CurIndex.."时间"..self:GetNextTime())
                            self:CheckCurtainOrPlay(self.CurIndex)
                            self.autoOnce = true
                        end
                    end
                end
            end
        end,-1,nil)
        ---跳过点击事件
        UIEvent.LuaClick(self.Btn_Jump().gameObject,function()
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("plot_ui_passstory"),PlotViewModel.PlotEnd,nil,2},true)
        end)
        ---预加载第一第二幕
        self:ReloadCurtain(1)
        if #self.plotData.curtains > 1 then
            ---如果有第二幕就去预加载
            self:ReloadCurtain(2)
        end
        ---进入首幕
        self:CheckCurtainOrPlay(self.CurIndex)
    end)

    MgrTimer.AddRepeat("sanjiaoshan",2,function()
        Tools.DoImageAlphaCall(self.Sanjiao(),1,0,1,function()
            Tools.DoImageAlpha(self.Sanjiao(),0,1,1)
        end)
    end,-1,nil)

    ---是否是选项幕
    self.isOption = false
    ---选项角色图片
    self.roleImg = nil
    ---选项数据
    self.optionData = {}
    ---选项框
    self.optionObjs = {
        self.Btn_Option().gameObject,
        self.Btn_Option1().gameObject,
        self.Btn_Option2().gameObject,
    }
    self.OptionPanel().gameObject:SetActive(false)
    ---是否是跳转幕
    self.isJump = false
    ---跳转数据
    self.jumpData = {}

end

function M:OnBackKey()
    local isUIReHide = self.UIReHide.activeSelf
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) and MgrUI.IsShow(self.Uid) then
        if isUIReHide then--隐藏
            self.UIReHide:SetActive(false)
            self.Panel_Ctr().gameObject:SetActive(true)
            for i, v in pairs(self.tabCurtain) do
                if v ~= nil and v.DramaRoot ~= nil then
                    v.DramaRoot.localPosition = Vector3(0,0,0)
                end
            end
            return
        end
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("plot_ui_passstory"),PlotViewModel.PlotEnd,nil,2},true)
    end
end

---获取幕间隔
function M:GetNextTime()
    local index = self.CurIndex
    if index > #self.plotData.curtains then
        index = #self.plotData.curtains
    end
    ---最低0.6秒
    local minTime = 0.6
    local time = minTime
    ---获取淡出时间
    local cutOutTime = 0
    ---文本播放时间
    local dramaTime = 0
    ---语音播放时间
    local audioTime = 0
    if index > 0 and index <= #self.plotData.curtains then
        local data = self:GetCurtainData(index - 2)
        if data ~= nil then
            cutOutTime = data.sceneEffect.cutOutTime or 0
        end
        data = self:GetCurtainData(index - 1)
        dramaTime = data.drama.boxDelay + data.drama.delay + (#string.gsub(data.drama.content,"%[wait]","") / data.drama.speed)
        if data.musics[6].path ~= nil and data.musics[6].path ~= "" and data.musics[6].path ~= "0" then
            if MgrSound.CheckPlotStatus(5) then
                audioTime = 999
            else
                audioTime = 0
            end
        end
    end
    ---取最长时间
    time = (audioTime > dramaTime and audioTime or dramaTime) + cutOutTime + (SettingViewModel.GetDramaASpeed()/50)
    ---判断是否依旧低于最低时间
    time = time < minTime and minTime or time
    return time
end

---检查幕状态并播放
function M:CheckCurtainOrPlay(layer)
    ---layer大于最大幕数结束播放
    if layer == #self.plotData.curtains + 1 and self.isEnd == false then
        ---没有下一幕了，清空幕，并淡出后跳出
        --for _, cObj in pairs(self.tabCurtain) do
        --    for _, ads in pairs(cObj.TabAudio) do
        --        Tools.DoPAudioFade(ads,0,2,0,function() end)
        --    end
        --end
        ---淡出黑
        Tools.DoPColor(self.sMask,"#000000FF",2,1)
        ---已经播放结束
        self.isEnd = true
        local delayTime = 0
        ---单幕的剧情不延迟结束
        if #self.plotData.curtains > 1 then
            delayTime = 3
        end
        MgrTimer.AddDelay("PlotEnd",delayTime,function()
            PlotViewModel.PlotEnd()
        end,nil)
        self.Sanjiao().gameObject:SetActive(false)
    end
    ---当前layer层未加载完毕则返回
    if self.CStateList[layer] ~= true then
        return
    end
    local dData = self.plotData.curtains[layer].drama
    ---如果当前幕是选项幕
    if #dData.options > 0 then
        self.isOption = true
        self.isJump = false
        ---当前角色图片
        self.roleImg = dData.rolePath
        self.optionData = {}
        for k,v in pairs(dData.options) do
            ---灌注选项数据
            self.optionData[k] = {
                layer = tonumber(string.split(v,"_")[1]),
                content = string.split(v,"_")[2],
            }
        end
        ---关闭自动
        if self.AutoNext then
            self.AutoNext = false
            self.AutoIcon:GetComponent("UIDoRotateEndless").enabled = false
            self.AutoIcon.transform.localRotation = Quaternion(0,0,0,0)
        end
    elseif dData.jumpLayer ~= 0 then
        ---如果是跳转幕
        self.isJump = true
        self.isOption = false
        ---灌注跳转数据
        self.jumpData = {
            layer = dData.jumpLayer,
            content = dData.content,
        }
        self.CurIndex = dData.jumpLayer + 1
    else
        ---幕索引自增
        self.CurIndex = self.CurIndex + 1
        self.Text_CurIndex().text = MgrLanguageData.GetLanguageByKey("plot_ui_presentstory")..self.CurIndex - 1
        self.isOption = false
        self.isJump = false
    end
    ---回放里排除选项幕
    if self.isOption == false then
        ---把当前幕添加进历史数据里
        table.insert(self.historyData,self.plotData.curtains[layer])
    end
    ---如果菜单展开则收起它
    if self.Tog_Click01().isOn == true then
        self.Tog_Click01().isOn = false
    end
    ---播放当前幕并加载下一幕
    if layer > 1 then
        ---大于第一幕先播放上一幕淡出效果，结束后再继续下一幕
        self:PlayCutOut(self.curLayer)
        local lastData = self:GetCurtainData(self.curLayer).sceneEffect
        MgrTimer.AddDelay("PlayPlot",lastData.cutOutTime,function()
            if self.UState == UIState.Show then
                self:PlayGroupCurtain(layer)
            end
        end,nil)
    else
        ---第一幕直接进入播放
        self:PlayGroupCurtain(layer)
    end
end

---预加载指定幕并播放
function M:PlayGroupCurtain(layer)
    ---若是首次加载，直接播放无需再次加载幕（初始化时已提前加载了第一第二幕）
    if layer > 1 and layer < #self.plotData.curtains then
        ---如果是选项幕，提前加载所有选项的下一幕
        if self.isOption then
            for k,v in pairs(self.optionData) do
                self:ReloadCurtain(v.layer + 1)
            end
        elseif self.isJump then
            self:ReloadCurtain(self.jumpData.layer + 1)
        else
            ---非首次加载，提前加载下一幕
            self:ReloadCurtain(layer + 1)
        end
    elseif layer == #self.plotData.curtains then
        ---若为最后一幕不再加载
    end
    ---检查幕顺延
    self:ClearNotLastState(layer)
    ---播放
    self:Play(layer)
end
---加载指定幕
function M:ReloadCurtain(layer)
    ---将所有[name]替换为玩家名
    self:GetCurtainData(layer).drama.name = string.gsub(self:GetCurtainData(layer).drama.name,'%[name]',PlayerControl.GetPlayerData().nickname)
    ---将所有[name]替换为玩家名
    self:GetCurtainData(layer).drama.content = string.gsub(self:GetCurtainData(layer).drama.content,'%[name]',PlayerControl.GetPlayerData().nickname)
    -- print(self:GetCurtainData(layer).drama.name)
    ---获取幕数据
    local data = self:GetCurtainData(layer)
    ---创建幕
    local ctObj = GameObject.Instantiate(self.pCurtainPre,self.plotRoot,false)
    ctObj.name = layer
    ---加载背景
    local btmRoot = ctObj.transform:Find("BtmContent")
    btmRoot:GetComponent("Canvas").sortingOrder = -4000 + layer;
    local btmArr = {}
    local btmList = {}
    for i = 1, #data.btmImages do
        btmArr[data.btmImages[i].layer + 1] = data.btmImages[i]
    end
    for imgLayer, imageData in ipairs(btmArr) do
        if imageData.path ~= "" and imageData.path ~= nil then
            local img = GameObject.Instantiate(self.ImagePrefab,btmRoot,false)
            img.gameObject.name = imgLayer
            img.gameObject.transform:SetSiblingIndex(imgLayer)
            btmList[imgLayer] = img
            local path = string.gsub(imageData.path,"Assets/","",1)
            path = string.gsub(path," ","_")
            MgrRes.LoadPlotSprite(img,path,function(c_img)
                if imageData.setting.isMaskOpen then
                    ---设置遮罩
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/BlackGradient")
                    c_img.material:SetTexture("_JianBian_tex",self.Tex1().texture)
                    c_img.material:SetTexture("_jianbian_tex2",self.Tex2().texture)
                    c_img.material:SetTexture("_JueSe_Tex",c_img.sprite.texture)
                    c_img.material:SetFloat("_HengShu", imageData.setting.isMaskVerticalVague and 1 or 0)
                    c_img.material:SetFloat("_FanZhuan", imageData.setting.isMaskHorizontalVague and 1 or 0)
                    c_img.material:SetFloat("_JianBian", imageData.setting.bMaskStartScale)
                    c_img.material:SetFloat("_Alpha", imageData.setting.bMaskStartAlpha)
                    c_img.material:SetFloat("_Alpha2", imageData.setting.hMaskStartScale)
                    c_img.material:SetFloat("_ZhongXin", imageData.setting.hMaskStartPosX)
                elseif imageData.setting.isVVagueOpen then
                    ---设置水平模糊
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/Horizontal_Blur")
                    c_img.material:SetTexture("_MainTexture",c_img.sprite.texture)
                    c_img.material:SetFloat("_BlurOffset",imageData.setting.vVagueStart)
                elseif imageData.setting.isVVagueOpen then
                    ---设置垂直模糊
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/Vertical_Blur")
                    c_img.material:SetTexture("_MainTexture",c_img.sprite.texture)
                    c_img.material:SetFloat("_BlurOffset",imageData.setting.hVagueStart)
                elseif imageData.setting.isGVagueOpen then
                    ---设置高斯模糊
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/Blur")
                    c_img.material:SetTexture("_MainTexture",c_img.sprite.texture)
                    c_img.material:SetFloat("_BlurOffset",imageData.setting.gVagueStart)
                end
            end,true, true)
            ---设置位置
            img.transform.localPosition = Vector3(imageData.setting.startPosX,imageData.setting.startPosY,0)
            ---设置缩放
            img.transform.localScale = Vector3(imageData.setting.startScale,imageData.setting.startScale,1)
            ---设置透明度
            img.color = Color(img.color.r,img.color.g,img.color.b,imageData.setting.startAlpha)
        end
    end
    ---加载前景
    local topRoot = ctObj.transform:Find("TopContent")
    topRoot:GetComponent("Canvas").sortingOrder = -1000 + layer;
    local topArr = {}
    local topList = {}
    for i = 1, #data.topImages do
        topArr[data.topImages[i].layer + 1] = data.topImages[i]
    end
    for imgLayer, imageData in ipairs(topArr) do
        if imageData.path ~= "" and imageData.path ~= nil then
            local img = GameObject.Instantiate(self.ImagePrefab,topRoot,false)
            img.gameObject.name = imgLayer
            img.gameObject.transform:SetSiblingIndex(imgLayer)
            topList[imgLayer] = img
            local path = string.gsub(imageData.path,"Assets/","",1)
            path = string.gsub(path," ","_")
            MgrRes.LoadPlotSprite(img,path,function(c_img)
                if imageData.setting.isMaskOpen then
                    ---设置遮罩
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/BlackGradient")
                    c_img.material:SetTexture("_JianBian_tex",self.Tex1().texture)
                    c_img.material:SetTexture("_jianbian_tex2",self.Tex2().texture)
                    c_img.material:SetTexture("_JueSe_Tex",c_img.sprite.texture)
                    c_img.material:SetFloat("_HengShu", imageData.setting.isMaskVerticalVague and 1 or 0)
                    c_img.material:SetFloat("_FanZhuan", imageData.setting.isMaskHorizontalVague and 1 or 0)
                    c_img.material:SetFloat("_JianBian", imageData.setting.bMaskStartScale)
                    c_img.material:SetFloat("_Alpha", imageData.setting.bMaskStartAlpha)
                    c_img.material:SetFloat("_Alpha2", imageData.setting.hMaskStartScale)
                    c_img.material:SetFloat("_ZhongXin", imageData.setting.hMaskStartPosX)
                elseif imageData.setting.isVVagueOpen then
                    ---设置水平模糊
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/Horizontal_Blur")
                    c_img.material:SetTexture("_MainTexture",c_img.sprite.texture)
                    c_img.material:SetFloat("_BlurOffset",imageData.setting.vVagueStart)
                elseif imageData.setting.isVVagueOpen then
                    ---设置垂直模糊
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/Vertical_Blur")
                    c_img.material:SetTexture("_MainTexture",c_img.sprite.texture)
                    c_img.material:SetFloat("_BlurOffset",imageData.setting.hVagueStart)
                elseif imageData.setting.isGVagueOpen then
                    ---设置高斯模糊
                    c_img.material = MgrRes.SetShader(c_img.material,"Work/Blur")
                    c_img.material:SetTexture("_MainTexture",c_img.sprite.texture)
                    c_img.material:SetFloat("_BlurOffset",imageData.setting.gVagueStart)
                end
            end,true, true)
            ---设置位置
            img.transform.localPosition = Vector3(imageData.setting.startPosX,imageData.setting.startPosY,0)
            ---设置缩放
            img.transform.localScale = Vector3(imageData.setting.startScale,imageData.setting.startScale,1)
            ---设置透明度
            img.color = Color(img.color.r,img.color.g,img.color.b,imageData.setting.startAlpha)
        end
    end
    ---加载立绘
    local spineRoot = ctObj.transform:Find("SpineContent")
    spineRoot:GetComponent("Canvas").sortingOrder = -3000 + layer
    local spineArr = {}
    local spineList = {}
    local spineRtList = {}
    for i = 1, #data.spines do
        spineArr[data.spines[i].layer + 1] = data.spines[i]
    end
    for spineLayer, spineData in ipairs(spineArr) do
        if spineData.path ~= "" and spineData.path ~= nil then
            ---检查边框rawImage
            local frameObj = nil;
            if spineData.freamIndex == 0 or spineData.freamIndex == 1 then
                frameObj = GameObject.Instantiate(self.SpineMidPrefab,spineRoot,false)
            elseif spineData.freamIndex == 2 then
                frameObj = GameObject.Instantiate(self.SpineLeftPrefab,spineRoot,false)
            elseif spineData.freamIndex == 3 then
                frameObj = GameObject.Instantiate(self.SpineRightPrefab,spineRoot,false)
            end
            if spineData.freamIndex ~= 0 then
                self.SpineFrameEffect:SetActive(true)
                self.SpineFrameEffectIndex = layer
            end
            frameObj.transform:Find("Root/CharacterLayer"):GetComponent("Mask").enabled = spineData.freamIndex ~= 0
            frameObj.transform:Find("Root/CharacterLayer"):GetComponent("Image").enabled = spineData.freamIndex ~= 0
            frameObj.transform:Find("Root/Bg"):GetComponent("Image").enabled = spineData.freamIndex ~= 0
            frameObj.transform:Find("Root/CharacterLayer/RawImage").gameObject:SetActive(spineData.freamIndex ~= 0)
            frameObj.name = spineData.uid
            frameObj.transform:SetSiblingIndex(spineLayer)
            frameObj.transform.localPosition = Vector3(spineData.freamX,spineData.freamY,0)
            local spine = frameObj.transform:Find("Root/CharacterLayer/SpineRawImage"):GetComponent("RawImage")
            spineList[spineLayer] = spine
            ---创建rt
            local spineRt = GameObject.Instantiate(self.SpineRtPrefab,self.plotRtRoot,false)
            spineRt:SetActive(true)
            spineRtList[spineLayer] = spineRt
            ---设置rt
            Tools.SetPlotRT(spineRt,spine,(22 + spineLayer))
            ---创建立绘预制
            local path = string.gsub(spineData.path,"Assets/","",1)
            path = string.gsub(path," ","_")
            local fullPath = MgrRes.ModifyPlotPath(path)
            path = MgrRes.GetLocalizedPath(fullPath)
            MgrRes.GetPrefab(path,function(spineRtObj)
                spineRtObj.transform:SetParent(spineRt.transform,false)
                spineRtObj.layer = 22 + spineLayer

                local skeletonA = spineRtObj:GetComponent("SkeletonAnimation")
                skeletonA.AnimationState:SetAnimation(0, spineData.animName, true)
                local x = spineData.isFlip and -math.abs(spineRtObj.transform.localScale.x) or math.abs(spineRtObj.transform.localScale.x)
                spineRtObj.transform.localScale = Vector3(x,spineRtObj.transform.localScale.y,spineRtObj.transform.localScale.z)
                spine:SetNativeSize()
                if spineData.setting.isMaskOpen then
                    ---设置遮罩
                    spine.material = MgrRes.SetShader(spine.material,"Work/BlackGradient")
                    spine.material:SetTexture("_JianBian_tex",self.Tex1().texture)
                    spine.material:SetTexture("_jianbian_tex2",self.Tex2().texture)
                    spine.material:SetTexture("_JueSe_Tex",spine.texture)
                    spine.material:SetFloat("_HengShu", spineData.setting.isMaskVerticalVague and 1 or 0)
                    spine.material:SetFloat("_FanZhuan", spineData.setting.isMaskHorizontalVague and 1 or 0)
                    spine.material:SetFloat("_JianBian", spineData.setting.bMaskStartScale)
                    spine.material:SetFloat("_Alpha", spineData.setting.bMaskStartAlpha)
                    spine.material:SetFloat("_Alpha2", spineData.setting.hMaskStartScale)
                    spine.material:SetFloat("_ZhongXin", spineData.setting.hMaskStartPosX)
                elseif spineData.setting.isVVagueOpen then
                    ---设置水平模糊
                    spine.material = MgrRes.SetShader(spine.material,"Work/Horizontal_Blur")
                    spine.material:SetTexture("_MainTexture",spine.texture)
                    spine.material:SetFloat("_BlurOffset",spineData.setting.vVagueStart)
                elseif spineData.setting.isVVagueOpen then
                    ---设置垂直模糊
                    spine.material = MgrRes.SetShader(spine.material,"Work/Vertical_Blur")
                    spine.material:SetTexture("_MainTexture",spine.texture)
                    spine.material:SetFloat("_BlurOffset",spineData.setting.hVagueStart)
                elseif spineData.setting.isGVagueOpen then
                    ---设置高斯模糊
                    spine.material = MgrRes.SetShader(spine.material,"Work/Blur")
                    spine.material:SetTexture("_MainTexture",spine.texture)
                    spine.material:SetFloat("_BlurOffset",spineData.setting.gVagueStart)
                end
                ---设置位置
                spine.transform.localPosition = Vector3(spineData.setting.startPosX,spineData.setting.startPosY,0)
                ---设置缩放
                spine.transform.localScale = Vector3(spineData.setting.startScale,spineData.setting.startScale,1)
                ---设置透明度
                spine.color = Color(spine.color.r,spine.color.g,spine.color.b,spineData.setting.startAlpha)
            end)
        end
    end
    ---加载音频(原Unity自带Audio方法，已弃用)
    local musicRoot = ctObj.transform:Find("MusicContent") ---保留此行用于切幕时查询幕音效是否被删除
    ---加载文本
    local dramaRoot = ctObj.transform:Find("DramaContent")
    local dramaObj = GameObject.Instantiate(self.DramaPrefab,dramaRoot,false)
    local dramaData = data.drama
    ---设置文本框
    if dramaData.boxPath ~= "" and dramaData.boxPath ~= nil then
        local path = string.gsub(dramaData.boxPath,"Assets/","",1)
        path = string.gsub(path," ","_")
        MgrRes.LoadPlotSprite(dramaObj:GetComponent("Image"),path,function(img)  end,false, true)
        Tools.DoPFade(dramaObj:GetComponent("Image"),SettingViewModel.GetDramaAlpha()/100,0,0,1,false,0,0,function() end)
        ---设置名称
        local textName = dramaObj.transform:Find("Text_Name"):GetComponent("TextMeshProUGUI")
        textName.text = ""
        textName.fontSize = dramaData.nameSize
        ---特殊需求，将27号字体统一替换为36号
        if textName.fontSize == 35 then
            textName.fontSize = 40
        end
        textName.color = Tools.GetPColor(dramaData.nameColor)
        Tools.SetOutlineColor(textName.gameObject,dramaData.nameFreamColor)
        ---设置内容
        local textContent = dramaObj.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI")
        textContent.text = ""
        textContent.fontSize = dramaData.contentSize
        ---特殊需求，将27号字体统一替换为36号
        if textContent.fontSize == 27 then
            textContent.fontSize = 36
        end
        textContent.color = Tools.GetPColor(dramaData.contentColor)
        Tools.SetOutlineColor(textContent.gameObject,dramaData.contentFreamColor)

        ---检测锚点模式
        if dramaData.isAnchor then
            textName.gameObject:SetActive(false)
            Tools.SetPlotAnchor(dramaObj,textContent,dramaData.anchorType)
        end
    end
    ---加载特效
    local effectList = {}
    for index, effectData in pairs(data.effects) do
        ---创建预制
        local obj = GameObject.Instantiate(self.EffectPrefab,self.plotRtRoot,false)
        obj.gameObject:SetActive(false)
        local filename = Tools.GetFileName(effectData.path)
        local path = "ABOriginal/VFX/Prefab/JuQing_Prefab/"..filename..".prefab"
        ---创建特效
        MgrRes.GetPrefab(path,function(effectObj)

            Tools.SetChildrenLayer(effectObj.gameObject,5)
            effectObj.transform:SetParent(obj.transform,false)
            effectObj.transform.localPosition = Vector3(effectData.x,effectData.y,effectObj.transform.localPosition.z)
            effectObj.transform.localScale = Vector3.one * effectData.scale
            ---添加音效
            if effectData.audioPath ~= "" and effectData.audioPath ~= nil then
                Log.Error("特效音暂不开放")
            end
            effectList[effectData.uid] = obj
        end)
    end
    ---加载视频
    local usmRoot = ctObj.transform:Find("USMContent")
    usmRoot:GetComponent("Canvas").sortingOrder = -2000 + layer;
    local usmArr = {}
    local usmList = {}
    for i = 1, #data.USMs do
        usmArr[data.USMs[i].layer + 1] = data.USMs[i]
    end
    for usmLayer, usmData in ipairs(usmArr) do
        if usmData.path ~= "" and usmData.path ~= nil then
            local usmObj = GameObject.Instantiate(self.UsmPrefab,usmRoot,false)
            usmObj.gameObject.name = usmLayer
            usmList[usmLayer] = usmObj
            usmObj.transform.localPosition = Vector3(usmData.x,usmData.y,0)
            usmObj.transform.localScale = Vector3.one * usmData.scale
            local criMana = usmObj:GetComponent("CriManaMovieControllerForUI")
            local path = string.gsub(usmData.path,"Assets/PlotAssets/Usm/","USM/plot/")
            path = string.gsub(path," ","_")
            path = MgrRes.GetLocalizedPath(path)
            path = MgrRes.GetABPath(path)
            criMana.player:SetFile(nil,path)
            criMana.loop = usmData.isLoop
            criMana.applyTargetAlpha = true
            usmObj.color = Color(usmObj.color.r, usmObj.color.g, usmObj.color.b, usmData.alpha)
            if usmData.isEndHide then
                Tools.SetUsmStateCell(criMana,function(status)
                    if status == 6 then
                        usmObj.gameObject:SetActive(false)
                    end
                end)
            else
                Tools.SetUsmStateCell(criMana,nil)
            end
        end
    end

    self.tabCurtain[layer] = {
        CObj = ctObj,
        BtmRoot = btmRoot,
        SpineRoot = spineRoot,
        SpineRtRoot = self.plotRtRoot,
        USMRoot = usmRoot,
        TopRoot = topRoot,
        MusicRoot = musicRoot,
        DramaRoot = dramaRoot,
        EffectRoot = self.plotRtRoot,
        SEffectRoot = self.plotRtRoot,

        TabBImage = btmList,
        TabTImage = topList,
        TabSpine = spineList,
        TabSpineRT = spineRtList,
        --TabAudio = musicList,
        Drama = dramaObj,
        TabEffect = effectList,
        TabUSM = usmList,
    }
    self.CStateList[layer] = true
end
---清除幕保留顺延对象
function M:ClearNotLastState(layer)
    ---获取当前幕数据
    local curData = self:GetCurtainData(layer)
    ---清除当前幕以下所有非顺延对象
    for i = 1, layer - 1 do
        local data = self:GetCurtainData(i)
        local obj = self.tabCurtain[i]
        if obj and data then
            ---背景图层
            if obj.BtmRoot ~= nil then
                ---当前幕勾选了清除背景顺延
                if curData.isClearBtmLast or obj.BtmRoot.childCount == 0 then
                    ---移除整个背景
                    GameObject.Destroy(obj.BtmRoot.gameObject)
                    obj.BtmRoot = nil
                else
                    ---移除未勾选顺延的图层
                    for i = 1, #data.btmImages do
                        if not data.btmImages[i].isLast then
                            if obj.TabBImage[data.btmImages[i].layer + 1] then
                                GameObject.Destroy(obj.TabBImage[data.btmImages[i].layer + 1].gameObject)
                                obj.TabBImage[data.btmImages[i].layer + 1] = nil
                            end
                        end
                    end
                end
            end
            ---前景图层
            if obj.TopRoot ~= nil then
                ---当前幕勾选了清除前景顺延
                if curData.isClearTopLast or obj.TopRoot.childCount == 0 then
                    ---移除整个前景
                    GameObject.Destroy(obj.TopRoot.gameObject)
                    obj.TopRoot = nil
                else
                    ---移除未勾选顺延的图层
                    for i = 1, #data.topImages do
                        if not data.topImages[i].isLast then
                            if obj.TabTImage[data.topImages[i].layer + 1] then
                                GameObject.Destroy(obj.TabTImage[data.topImages[i].layer + 1].gameObject)
                                obj.TabTImage[data.topImages[i].layer + 1] = nil
                            end
                        end
                    end
                end
            end
            ---立绘图层
            if obj.SpineRoot ~= nil then
                for i, v in pairs(obj.TabSpine) do
                    if obj.TabSpine[i] ~= nil then
                        GameObject.Destroy(obj.TabSpine[i].transform.parent.parent.parent.gameObject)
                    end
                    if obj.TabSpineRT[i] ~= nil then
                        GameObject.Destroy(obj.TabSpineRT[i].gameObject)
                    end
                end
                GameObject.Destroy(obj.SpineRoot.gameObject)
                obj.SpineRoot = nil
                if self.SpineFrameEffectIndex ~= nil and self.SpineFrameEffectIndex + 3 < layer then
                    self.SpineFrameEffect:SetActive(false)
                end
            end
            ---音效
            if obj.MusicRoot ~= nil then
                for _, cData in pairs(curData.musics) do
                    ---若当前幕未开启类型音效，或新添加了类型音效则移除
                    if not cData.isOpen or (cData.path ~= nil and cData.path ~= "" and cData.path ~= "0") then
                        if cData.type == 0 or cData.type == 1 or cData.type == 5 then
                            ---停止对应循环音效及人物语音
                            local mType = 0
                            if cData.type == 0 then
                                mType = 1
                            elseif cData.type == 1 then
                                mType = 2
                            elseif cData.type == 5 then
                                mType = 5
                            end
                            MgrSound.Stop(mType,"",true)
                        else
                            ---入场音效不处理
                        end
                    end
                end
                if obj.MusicRoot.childCount == 0 then
                    GameObject.Destroy(obj.MusicRoot.gameObject)
                    obj.MusicRoot = nil
                end
            end
            ---文本
            if obj.DramaRoot ~= nil then
                ---直接移除
                GameObject.Destroy(obj.DramaRoot.gameObject)
                obj.DramaRoot = nil
            end
            ---特效
            if obj.EffectRoot ~= nil then

            end
            ---屏效
            if obj.SEffectRoot ~= nil then

            end
            ---视频
            if obj.USMRoot ~= nil then
                ---当前幕勾选了清除视频
                if curData.isClearUSMLast or obj.USMRoot.childCount == 0 then
                    ---移除整个视频节点
                    GameObject.Destroy(obj.USMRoot.gameObject)
                    obj.USMRoot = nil
                    obj.TabUSM = {}
                else
                    ---移除未勾选顺延的视频
                    for i = 1, #data.USMs do
                        if not data.USMs[i].isLast then
                            if obj.TabUSM[data.USMs[i].layer + 1] ~= nil then
                                local criMana = obj.TabUSM[data.USMs[i].layer + 1]:GetComponent("CriManaMovieControllerForUI")
                                criMana.player:Dispose()
                                criMana:StopAllCoroutines()
                                GameObject.Destroy(obj.TabUSM[data.USMs[i].layer + 1].gameObject)
                                obj.TabUSM[data.USMs[i].layer + 1] = nil
                            end
                        end
                    end
                end
            end
            if obj.CObj ~= nil then
                local ec = obj.CObj.transform:Find("EffectContent")
                if ec then
                    if ec.childCount == 0 then
                        GameObject.Destroy(ec.gameObject)
                    end
                end
                if obj.CObj.transform.childCount == 0 then
                    GameObject.Destroy(obj.CObj.gameObject)
                    obj.CObj = nil
                end
            end
        end
    end
end
---播放指定幕
function M:Play(layer)
    ---隐藏对话三角
    self.Sanjiao().gameObject:SetActive(false)
    ---最大跳幕时间
    self.curJumpTime = self:GetCurtainData(layer).jump_Time or 0
    ---当前幕播放时间
    self.curPlayTime = tonumber(os.time())
    ---还原幕坐标
    local curObj = self.tabCurtain[layer]
    curObj.CObj.transform.localPosition = Vector3.zero
    ---播放切入动画
    self:PlayCutIn(layer)
    ---播放背景动画
    self:PlayImage(true,layer)
    ---播放前景动画
    self:PlayImage(false,layer)
    ---播放立绘
    self:PlaySpine(layer)
    ---播放音频
    self:PlayAudio(layer)
    ---播放文本
    self:PlayDrama(layer)
    ---播放特效
    self:PlayEffect(layer)
    ---播放屏效
    self:PlaySEffect(layer)
    ---播放视频
    self:PlayUsm(layer)
    ---当前layer
    self.curLayer = layer
end
---播放图层:true背景，false前景
function M:PlayImage(isBtm,layer)
    local tabImage = isBtm and self.tabCurtain[layer].TabBImage or self.tabCurtain[layer].TabTImage
    local imgList = isBtm and self:GetCurtainData(layer).btmImages or self:GetCurtainData(layer).topImages
    for index, data in pairs(imgList) do
        ---获取图层
        local image = tabImage[data.layer + 1]
        ---图层存在则播放动画
        if image ~= nil then
            ---pos动画
            image.transform.localPosition = Vector3(data.setting.startPosX, data.setting.startPosY, 0)
            Tools.DoPosMove(image.transform, data.setting.endPosX, data.setting.endPosY, data.setting.posAnimTime, data.setting.posDelay, data.setting.posCurveType, data.setting.isPosLoop, data.setting.posLoopCount, data.setting.posLoopType)
            ---scale动画
            image.transform.localScale = Vector3(data.setting.startScale, data.setting.startScale, 1)
            Tools.DoPScale(image.transform, data.setting.endScale, data.setting.endScale, data.setting.scaleAnimTime, data.setting.scaleDelay, data.setting.scaleCurveType, data.setting.isScaleLoop, data.setting.scaleLoopCount, data.setting.scaleLoopType)
            ---Alpha动画
            image.color = Color(image.color.r,image.color.g,image.color.b, data.setting.startAlpha)
            Tools.DoPFade(image, data.setting.endAlpha, data.setting.alphaAnimTime, data.setting.alphaDelay, data.setting.alphaCurveType, data.setting.isAlphaLoop, data.setting.alphaLoopCount, data.setting.alphaLoopType,nil)
            ---材质
            if data.setting.isMaskOpen then
                ---遮罩动画
                image.material:SetFloat("_HengShu", data.setting.isMaskVerticalVague and 1 or 0)
                image.material:SetFloat("_FanZhuan", data.setting.isMaskHorizontalVague and 1 or 0)
                Tools.DoPMaterial(image.material,"_JianBian", data.setting.bMaskStartScale, data.setting.bMaskEndScale, data.setting.bMaskScaleAnimTime,0, data.setting.bMaskScaleCurveType, data.setting.isBMaskScaleLoop, data.setting.bMaskScaleLoopCount, data.setting.bMaskScaleLoopType)
                Tools.DoPMaterial(image.material,"_Alpha", data.setting.bMaskStartAlpha, data.setting.bMaskEndAlpha, data.setting.bMaskAlphaAnimTime,0, data.setting.bMaskAlphaCurveType, data.setting.isBMaskAlphaLoop, data.setting.bMaskAlphaLoopCount, data.setting.bMaskAlphaLoopType)
                Tools.DoPMaterial(image.material,"_Alpha2", data.setting.hMaskStartScale, data.setting.hMaskEndScale, data.setting.hMaskScaleAnimTime,0, data.setting.hMaskScaleCurveType, data.setting.isHMaskScaleLoop, data.setting.hMaskScaleLoopCount, data.setting.hMaskScaleLoopType)
                Tools.DoPMaterial(image.material,"_ZhongXin", data.setting.hMaskStartPosX, data.setting.hMaskEndPosX, data.setting.hMaskPosXAnimTime,0, data.setting.hMaskPosXCurveType, data.setting.isHMaskPosXLoop, data.setting.hMaskPosXLoopCount, data.setting.hMaskPosXLoopType)
            elseif data.setting.isVVagueOpen then
                ---水平模糊动画
                Tools.DoPMaterial(image.material,"_BlurOffset", data.setting.vVagueStart, data.setting.vVagueEnd, data.setting.vVagueAnimTime, data.setting.vVagueDelay, data.setting.vVagueCurveType, data.setting.isVVagueLoop, data.setting.vVagueLoopCount, data.setting.vVagueLoopType)
            elseif data.setting.isHVagueOpen then
                ---垂直模糊动画
                Tools.DoPMaterial(image.material,"_BlurOffset", data.setting.hVagueStart, data.setting.hVagueEnd, data.setting.hVagueAnimTime, data.setting.hVagueDelay, data.setting.hVagueCurveType, data.setting.isHVagueLoop, data.setting.hVagueLoopCount, data.setting.hVagueLoopType)
            elseif data.setting.isGVagueOpen then
                ---高斯模糊动画
                Tools.DoPMaterial(image.material,"_BlurOffset", data.setting.gVagueStart, data.setting.gVagueEnd, data.setting.gVagueAnimTime, data.setting.gVagueDelay, data.setting.gVagueCurveType, data.setting.isGVagueLoop, data.setting.gVagueLoopCount, data.setting.gVagueLoopType)
            end
        end
    end
end
---播放立绘
function M:PlaySpine(layer)
    local tabSpine = self.tabCurtain[layer].TabSpine
    local tabSpineRt = self.tabCurtain[layer].TabSpineRT
    --local tabAudio = self.tabCurtain[layer].TabAudio
    local spineList = self:GetCurtainData(layer).spines
    for index, data in pairs(spineList) do
        local spine = tabSpine[data.layer + 1]
        local spineRt = tabSpineRt[data.layer + 1]
        if spineRt ~= nil then
            spineRt.transform.localPosition = Vector3.zero
        end
        if data.path ~= "" and data.path ~= nil then
            ---口型分析
            --if data.isAnalysis and tabAudio[6] ~= nil then
            --    Tools.SetPAnalysis(tabAudio[6],spineRt,data.animName,data.animName2)
            --end
            ---边框动画
            if data.freamIndex ~= 0 then
                ---获取上一幕同层级立绘数据
                local lastCur = self:GetCurtainData(self.curLayer)
                local lastData = nil
                if lastCur ~= nil then
                    lastData = lastCur.spines[index]
                end
                ---上一幕不存在或边框类型不同或立绘路径不同时播放边框动画
                local frame = spine.transform.parent.parent.parent
                if lastData == nil or lastData.freamIndex ~= data.freamIndex or lastData.path ~= data.path then
                    frame.localScale = Vector3(frame.localScale.x,0,frame.localScale.z)
                    Tools.DoPScale(frame,frame.localScale.x,1,0.5,data.setting.alphaDelay,17,false,0,0)
                end
                ---消失动画
                if data.isFreamDelay then
                    Tools.DoPScale(frame,frame.localScale.x,0,0.5,data.setting.alphaDelay + data.freamDelay,18,false,0,0)
                end
            end
            ---pos动画
            spine.transform.localPosition = Vector3(data.setting.startPosX, data.setting.startPosY, 0)
            Tools.DoPosMove(spine.transform, data.setting.endPosX, data.setting.endPosY, data.setting.posAnimTime, data.setting.posDelay, data.setting.posCurveType, data.setting.isPosLoop, data.setting.posLoopCount, data.setting.posLoopType)
            ---scale动画
            spine.transform.localScale = Vector3(data.setting.startScale, data.setting.startScale, 1)
            Tools.DoPScale(spine.transform, data.setting.endScale, data.setting.endScale, data.setting.scaleAnimTime, data.setting.scaleDelay, data.setting.scaleCurveType, data.setting.isScaleLoop, data.setting.scaleLoopCount, data.setting.scaleLoopType)
            ---Alpha动画
            spine.color = Color(spine.color.r,spine.color.g,spine.color.b, data.setting.startAlpha)
            Tools.DoPRFade(spine, data.setting.endAlpha, data.setting.alphaAnimTime, data.setting.alphaDelay, data.setting.alphaCurveType, data.setting.isAlphaLoop, data.setting.alphaLoopCount, data.setting.alphaLoopType)
            ---材质
            if data.setting.isMaskOpen then
                ---遮罩动画
                spine.material:SetFloat("_HengShu", data.setting.isMaskVerticalVague and 1 or 0)
                spine.material:SetFloat("_FanZhuan", data.setting.isMaskHorizontalVague and 1 or 0)
                Tools.DoPMaterial(spine.material,"_JianBian", data.setting.bMaskStartScale, data.setting.bMaskEndScale, data.setting.bMaskScaleAnimTime,0, data.setting.bMaskScaleCurveType, data.setting.isBMaskScaleLoop, data.setting.bMaskScaleLoopCount, data.setting.bMaskScaleLoopType)
                Tools.DoPMaterial(spine.material,"_Alpha", data.setting.bMaskStartAlpha, data.setting.bMaskEndAlpha, data.setting.bMaskAlphaAnimTime,0, data.setting.bMaskAlphaCurveType, data.setting.isBMaskAlphaLoop, data.setting.bMaskAlphaLoopCount, data.setting.bMaskAlphaLoopType)
                Tools.DoPMaterial(spine.material,"_Alpha2", data.setting.hMaskStartScale, data.setting.hMaskEndScale, data.setting.hMaskScaleAnimTime,0, data.setting.hMaskScaleCurveType, data.setting.isHMaskScaleLoop, data.setting.hMaskScaleLoopCount, data.setting.hMaskScaleLoopType)
                Tools.DoPMaterial(spine.material,"_ZhongXin", data.setting.hMaskStartPosX, data.setting.hMaskEndPosX, data.setting.hMaskPosXAnimTime,0, data.setting.hMaskPosXCurveType, data.setting.isHMaskPosXLoop, data.setting.hMaskPosXLoopCount, data.setting.hMaskPosXLoopType)
            elseif data.setting.isVVagueOpen then
                ---水平模糊动画
                Tools.DoPMaterial(spine.material,"_BlurOffset", data.setting.vVagueStart, data.setting.vVagueEnd, data.setting.vVagueAnimTime, data.setting.vVagueDelay, data.setting.vVagueCurveType, data.setting.isVVagueLoop, data.setting.vVagueLoopCount, data.setting.vVagueLoopType)
            elseif data.setting.isHVagueOpen then
                ---垂直模糊动画
                Tools.DoPMaterial(spine.material,"_BlurOffset", data.setting.hVagueStart, data.setting.hVagueEnd, data.setting.hVagueAnimTime, data.setting.hVagueDelay, data.setting.hVagueCurveType, data.setting.isHVagueLoop, data.setting.hVagueLoopCount, data.setting.hVagueLoopType)
            elseif data.setting.isGVagueOpen then
                ---高斯模糊动画
                Tools.DoPMaterial(spine.material,"_BlurOffset", data.setting.gVagueStart, data.setting.gVagueEnd, data.setting.gVagueAnimTime, data.setting.gVagueDelay, data.setting.gVagueCurveType, data.setting.isGVagueLoop, data.setting.gVagueLoopCount, data.setting.gVagueLoopType)
            end

        end
    end
end

function M:PlayAudio(layer)
    for i, v in pairs(self:GetCurtainData(layer).musics) do
        if v.isOpen and v.path ~= nil and v.path ~= "" and v.path ~= "0" then
            if v.type == 0 then
                if layer > 1  then
                    local ld = self:GetCurtainData(self.curLayer).musics[i]
                    if ld.fadeOut > 0 then
                        MgrSound.PlayBGM(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,true,v.fadeIn * 1000,v.fadeOut * 1000,tostring(v.type).."fade")
                    else
                        MgrSound.PlayBGM(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,true,v.fadeIn * 1000,v.fadeOut * 1000)
                    end
                else
                    MgrSound.PlayBGM(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,true,v.fadeIn * 1000,v.fadeOut * 1000)
                end
            elseif v.type == 1 then
                if layer > 1  then
                    local ld = self:GetCurtainData(self.curLayer).musics[i]
                    if ld.fadeOut > 0 then
                        MgrSound.PlayEffect(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,true,v.fadeIn * 1000,v.fadeOut * 1000,tostring(v.type).."fade")
                    else
                        MgrSound.PlayEffect(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,true,v.fadeIn * 1000,v.fadeOut * 1000,tostring(v.type))
                    end
                else
                    MgrSound.PlayEffect(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,true,v.fadeIn * 1000,v.fadeOut * 1000,tostring(v.type))
                end
            elseif v.type == 2 or v.type == 3 or v.type == 4 then
                MgrSound.PlayEffect(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,false,0,0,tostring(v.type))
            else
                MgrSound.PlayPlot(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,v.delay * 1000,false,0,0,tostring(v.type))
            end
        end
    end
    ---原Unity自带Audio方法，已弃用
    --local tabAudio = self.tabCurtain[layer].TabAudio
    --local musicList = self:GetCurtainData(layer).musics
    --for type, ads in pairs(tabAudio) do
    --    local data = nil
    --    for i, v in pairs(musicList) do
    --        if type == (v.type + 1) then
    --            data = v
    --            break
    --        end
    --    end
    --    if type < 3 then
    --        ---背景循环音效
    --        ads.volume = 0
    --        Tools.DoPAudioFade(ads,data.volume/100.0,data.fadeIn,data.delay,function(c_ads)
    --            c_ads.volume = data.volume/100.0
    --        end)
    --    else
    --        ---入场123及人物语音（无需淡入淡出）
    --    end
    --    ads:PlayDelayed(data.delay)
    --end
end

function M:PlayDrama(layer)
    local dramaObj = self.tabCurtain[layer].Drama
    local data = self:GetCurtainData(layer).drama
    local img_box = dramaObj:GetComponent("Image")
    local text_name = dramaObj.transform:Find("Text_Name"):GetComponent("TextMeshProUGUI")
    ---获取上一幕姓名框内容如相同则保留
    local last_name = ""
    local fadeTime = 0.5
    local lastData = nil
    if layer > 1 then
        lastData = self:GetCurtainData(self.curLayer).drama
        if lastData ~= nil and lastData.name == data.name and data.boxDelay <= 0 then
            last_name = lastData.name
            fadeTime = 0
        end
    end
    text_name.text = last_name
    local text_content = dramaObj.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI")
    Tools.DoPFade(img_box,0,fadeTime * 0.4,0,1,false,0,0,nil)
    --判断是否是选项幕
    if self.isOption then
        local canvas = self.OptionPanel().gameObject.transform:GetComponent("CanvasGroup")
        canvas.alpha = 0
        --加载选项角色
        local path = MgrRes.GetLocalizedPath(self.roleImg)
        MgrRes.LoadSprite(self.Img_Juese(),path)
        --选项框加载
        for k,v in pairs(self.optionObjs) do
            v.gameObject:SetActive(false)
            --如果存在数据
            if self.optionData[k] then
                v.transform:Find("Text_Option"):GetComponent("TextMeshProUGUI").text = self.optionData[k].content
                v.gameObject:SetActive(true)
                ---注册点击事件
                UIEvent.LuaClick(v.gameObject,function()
                    ---跳到对应幕
                    self.CurIndex = self.optionData[k].layer + 1
                    self:PlayNextPlot(self.optionData[k].layer + 1)
                end)
            end
        end
        self.OptionPanel().gameObject:SetActive(true)
        ---强制刷新布局
        Tools.ReContentSizeGroup(self.OptionPanel().gameObject)
        ---排列选项UI
        MgrTimer.Cancel("optionUI")
        MgrTimer.AddRepeat("optionUI",0.1,function()
            if self.isOption then
                for k,v in pairs(self.optionObjs) do
                    --刷新选项框X值
                    if k == 1 and v.transform.anchoredPosition.x ~= 646 then
                        v.transform.anchoredPosition = Vector2(646,v.transform.anchoredPosition.y)
                    elseif k == 2 and v.transform.anchoredPosition.x ~= 607 then
                        v.transform.anchoredPosition = Vector2(607,v.transform.anchoredPosition.y)
                    elseif k == 3 and v.transform.anchoredPosition.x ~= 560 then
                        v.transform.anchoredPosition = Vector2(560,v.transform.anchoredPosition.y)
                    end
                end
                canvas.alpha = 1
            end
        end,-1,self.objRoot)
        --UI
        self.UINextPlot().gameObject:SetActive(false)
        self.UIFastPlot().gameObject:SetActive(false)
    else
        self.OptionPanel().gameObject:SetActive(false)
        Tools.DoPFade(img_box,SettingViewModel.GetDramaAlpha()/100,fadeTime * 0.6,data.boxDelay,1,false,0,0,function()
            text_name.text = data.name
            local contents = string.split(data.content,"[wait]")
            local settingSpeed = SettingViewModel.GetDramaSpeed()/100 * data.speed
            settingSpeed = settingSpeed < 1 and 1 or settingSpeed
            if #contents < 2 then
                Tools.DoPText(text_content,data.content,settingSpeed,data.curve,data.delay)
                MgrTimer.Cancel("Sanjiao")
                MgrTimer.AddDelay("Sanjiao",#data.content / (settingSpeed * 3),function()
                    if self.ObjRoot then
                        ---如果文本是空隐藏三角
                        if contents[1] == "" then
                            self.Sanjiao().gameObject:SetActive(false)
                        else
                            self.Sanjiao().gameObject:SetActive(true)
                        end
                    end
                end,nil)
            else
                if self.AutoNext ~= true then
                    self.NextTextBtn.gameObject:SetActive(true)
                    Tools.DoPTwoText(text_content,data.content,settingSpeed,data.curve,data.delay,self.NextTextBtn,self.UINextPlot().gameObject)
                    MgrTimer.Cancel("Sanjiao")
                    MgrTimer.AddDelay("Sanjiao",#data.content / (settingSpeed * 3),function() self.Sanjiao().gameObject:SetActive(true) end,nil)
                end
            end
        end)
    end
end

---播放特效
function M:PlayEffect(layer)
    local tabEffect = self.tabCurtain[layer].TabEffect
    local effectList = self:GetCurtainData(layer).effects
    for index, data in pairs(effectList) do
        if data.path ~= "" and data.path ~= nil then
            local obj = tabEffect[data.uid]
            obj:SetActive(false)
            MgrTimer.AddDelayNoName(data.delay,function()
                if not obj:Equals(nil) then
                    obj:SetActive(true)
                end
            end,nil)
            if data.audioPath ~= "" and data.audioPath ~= nil then
                MgrTimer.AddDelayNoName(data.audioDelay,function()
                    if obj then
                        obj.transform:GetComponentInChildren("AudioSource"):Play()
                    end
                end,nil)
            end
        end
    end
end
---播放视频
function M:PlayUsm(layer)
    local usmList = self:GetCurtainData(layer).USMs
    for i, data in pairs(usmList) do
        if data.path ~= nil and data.path ~= "" then
            MgrTimer.AddDelayNoName(data.delay, function ()
                if self.tabCurtain[layer].TabUSM[data.layer + 1] ~= nil then
                    self.tabCurtain[layer].TabUSM[data.layer + 1]:GetComponent("CriManaMovieControllerForUI"):Play()
                end
            end,self.ObjRoot)
        end
    end
end

---播放屏效
function M:PlaySEffect(layer)
    local curObj = self.tabCurtain[layer]
    local data = self:GetCurtainData(layer).sceneEffect
    ---加载屏效
    if self.sEffectObj ~= nil and self.sEffectObj.name == data.effectPath then
        ---如果屏幕效果相同则不清空不创建
    else
        ---清空
        if self.sEffectObj ~= nil then
            GameObject.Destroy(self.sEffectObj)
            self.sEffectObj = nil
        end
        if data.effectPath == "" or data.effectPath == nil or string.find(data.effectPath,MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_none")) ~= nil then
            ---无效路径不创建
        else
            self.sEffectObj = GameObject.Instantiate(self.EffectPrefab,self.plotRtRoot,false)
            local filename = Tools.GetFileName(data.effectPath)
            local path = "ABOriginal/VFX/Prefab/JuQing_Prefab/"..filename..".prefab"
            MgrRes.GetPrefab(path,function(obj)
                Tools.SetChildrenLayer(obj.gameObject,5)
                self.sEffectObj.name = data.effectPath
                self.sEffectObj:SetActive(true)
                obj.transform:SetParent(self.sEffectObj.transform,false)
                local name = Tools.GetFileName(data.effectPath)
                if name == "jq_Flash" then
                    ---老特效单独处理
                    self.sEffectObj.transform:SetParent(curObj.CObj.transform:Find("EffectContent"),false)
                end
            end)
        end
    end
    ---震动效果
    if data.isScreenShock then
        local transArr = {}
        if data.isShockBImage then
            transArr[#transArr + 1] = curObj.BtmRoot
        end
        if data.isShockTImage then
            transArr[#transArr + 1] = curObj.TopRoot
        end
        if data.isShockSpine then
            transArr[#transArr + 1] = curObj.SpineRoot
        end
        if data.isShockUSM then
            transArr[#transArr + 1] = curObj.USMRoot
        end
        for i, trans in pairs(transArr) do
            Tools.DoPShakePos(trans,data.shockTime,data.shockRange,data.shockRate,data.shockDelay)
        end
    end
end

---幕淡入
function M:PlayCutIn(layer)
    local data = self:GetCurtainData(layer).sceneEffect
    if data.cutInTime == 0 then
        ---若无切入效果重置
        Tools.DoPColor(self.sMask,"#00000000",0)
        Tools.DoPAnchorPos(self.slbMask,-3000,0,0,0)
        Tools.DoPAnchorPos(self.srbMask,3000,0,0,0)
        Tools.DoPColor(self.sMask,"#FFFFFF00",0)
        Tools.DoPAnchorPos(self.slwMask,-3000,0,0,0)
        Tools.DoPAnchorPos(self.srwMask,3000,0,0,0)
        return
    end
    if data.cutInType == 0 then
        ---无淡出
    elseif data.cutInType == 1 then
        ---淡出效果
        Tools.DoPColor(self.sMask,"#000000FF",0)
        Tools.DoPColor(self.sMask,"#00000000",data.cutInTime,data.cutInCurve)
    elseif data.cutInType == 2 then
        ---左渐变
        Tools.DoPAnchorPos(self.slbMask,0,0,0,0)
        Tools.DoPAnchorPos(self.slbMask,-3000,0,0,data.cutInTime,data.cutInCurve)
    elseif data.cutInType == 3 then
        ---右渐变
        Tools.DoPAnchorPos(self.srbMask,0,0,0,0)
        Tools.DoPAnchorPos(self.srbMask,3000,0,0,data.cutInTime,data.cutInCurve)
    elseif data.cutInType == 4 then
        ---淡出效果(白)
        Tools.DoPColor(self.sMask,"#FFFFFFFF",0)
        Tools.DoPColor(self.sMask,"#FFFFFF00",data.cutInTime,data.cutInCurve)
    elseif data.cutInType == 5 then
        ---左渐变白
        Tools.DoPAnchorPos(self.slwMask,0,0,0,0)
        Tools.DoPAnchorPos(self.slwMask,-3000,0,0,data.cutInTime,data.cutInCurve)
    elseif data.cutInType == 6 then
        ---右渐变白
        Tools.DoPAnchorPos(self.srwMask,0,0,0,0)
        Tools.DoPAnchorPos(self.srwMask,3000,0,0,data.cutInTime,data.cutInCurve)
    end
end

---幕淡出
function M:PlayCutOut(layer)
    local data = self:GetCurtainData(layer).sceneEffect
    if data.cutOutType == 0 then
        ---无淡出
    elseif data.cutOutType == 1 then
        ---淡出效果
        Tools.DoPColor(self.sMask,"#00000000",0)
        Tools.DoPColor(self.sMask,"#000000FF",data.cutOutTime,data.cutOutCurve)
    elseif data.cutOutType == 2 then
        ---左渐变
        Tools.DoPAnchorPos(self.slbMask,-3000,0,0,0)
        Tools.DoPAnchorPos(self.slbMask,0,0,0,data.cutOutTime,data.cutOutCurve)
    elseif data.cutOutType == 3 then
        ---右渐变
        Tools.DoPAnchorPos(self.srbMask,3000,0,0,0)
        Tools.DoPAnchorPos(self.srbMask,0,0,0,data.cutOutTime,data.cutOutCurve)
    elseif data.cutOutType == 4 then
        ---淡出效果(白)
        Tools.DoPColor(self.sMask,"#FFFFFF00",0)
        Tools.DoPColor(self.sMask,"#FFFFFFFF",data.cutOutTime,data.cutOutCurve)
    elseif data.cutOutType == 5 then
        ---左渐变白
        Tools.DoPAnchorPos(self.slwMask,-3000,0,0,0)
        Tools.DoPAnchorPos(self.slwMask,0,0,0,data.cutOutTime,data.cutOutCurve)
    elseif data.cutOutType == 6 then
        ---右渐变白
        Tools.DoPAnchorPos(self.srwMask,3000,0,0,0)
        Tools.DoPAnchorPos(self.srwMask,0,0,0,data.cutOutTime,data.cutOutCurve)
    end
    self.Sanjiao().gameObject:SetActive(false)
end
---通过层级获取幕数据
function M:GetCurtainData(layer)
    for i = 1, #self.plotData.curtains do
        if (self.plotData.curtains[i].layer + 1) == layer then
            return self.plotData.curtains[i]
        end
    end
end

function M:PlayNextPlot()
    self.UINextPlot().gameObject:SetActive(true)
    self.UIFastPlot().gameObject:SetActive(true)
    self.Btn_Option().gameObject:SetActive(false)
    self.Sanjiao().gameObject:SetActive(false)
    if self.CurIndex < 2 then
        ---初始化完成前不允许操作
        return
    end
    if self.curJumpTime > 0 then
        ---设置了最大跳幕时间
        return
    end
    ---关闭自动
    if self.AutoNext then
        self.AutoNext = false
        self.AutoIcon:GetComponent("UIDoRotateEndless").enabled = false
        self.AutoIcon.transform.localRotation = Quaternion(0,0,0,0)
    end

    local data = self:GetCurtainData(self.curLayer)
    local curObj = self.tabCurtain[self.curLayer]
    if data ~= nil and curObj ~= nil then
        if self.isJump then
            self.CurIndex = self.jumpData.layer + 1
        end
        if data.drama.content == nil or data.drama.content == "" or curObj.Drama.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI").text == string.gsub(data.drama.content,"%[wait]","") or self.isOption or self.isJump then
            self:CheckCurtainOrPlay(self.CurIndex)
        else
            if data.drama.boxDelay == nil or tonumber(os.time()) - self.curPlayTime > data.drama.boxDelay then
                curObj.Drama.transform:Find("Text_Name"):GetComponent("TextMeshProUGUI").text = data.drama.name
                Tools.DoPFade(curObj.Drama:GetComponent("Image"),SettingViewModel.GetDramaAlpha()/100,0,0,1,false,0,0,function()
                    Tools.DoPText(curObj.Drama.transform:Find("Text_Content"):GetComponent("TextMeshProUGUI"),string.gsub(data.drama.content,"%[wait]",""),5000,1,0)

                end)
            end
        end
    end
end

function M:OnClose() -- 关闭界面触发
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    ---移除自动跳转
    MgrTimer.Cancel("PlayPlot")
    MgrTimer.Cancel("PlotTime")
    MgrTimer.Cancel("PlotEnd")
    MgrTimer.Cancel("PlotAutoJump")
    MgrTimer.Cancel("Sanjiao")
    MgrTimer.Cancel("sanjiaoshan")
    MgrTimer.Cancel("optionUI")
    -----移除RT
    --GameObject.Destroy(self.plotRtRoot.gameObject)
    local plotName = Tools.GetFileName(PlotViewModel.curPlot)
    MgrSound.RemoveCue("Audio/plot/"..string.split(plotName, ".")[1]..".acb")
end

return M