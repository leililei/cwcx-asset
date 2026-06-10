
-- Code Auto Create Begin
local M = Class('RoleDocument_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleDocument_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleDocument_UI].prefab'
    self.Name = 'Form[RoleDocument_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RightPanel','RightPanel',2},{'Bg','RightPanel/Bg',2},{'PesonalContent','RightPanel/PesonalScroll/PesonalContent',2},{'PersonalItem','RightPanel/PesonalScroll/PersonalItem',2},{'VoiceContent','RightPanel/VoiceScroll/VoiceContent',2},{'VoiceItem','RightPanel/VoiceScroll/VoiceItem',2},{'SwitchBtnPanel','RightPanel/SwitchBtnPanel',2},{'SwitchPersonalDocBtnPanel','RightPanel/SwitchBtnPanel/SwitchPersonalDocBtnPanel',2},{'Btn_Normal','RightPanel/SwitchBtnPanel/SwitchPersonalDocBtnPanel/Btn_Normal',2},{'Btn_Img','RightPanel/SwitchBtnPanel/SwitchPersonalDocBtnPanel/Btn_Normal/Btn_Img',2},{'Btn_HighLight','RightPanel/SwitchBtnPanel/SwitchPersonalDocBtnPanel/Btn_HighLight',2},{'Btn_Img01','RightPanel/SwitchBtnPanel/SwitchPersonalDocBtnPanel/Btn_HighLight/Btn_Img',2},{'SwitchVoicePreviewBtnPanel','RightPanel/SwitchBtnPanel/SwitchVoicePreviewBtnPanel',2},{'Btn_Normal01','RightPanel/SwitchBtnPanel/SwitchVoicePreviewBtnPanel/Btn_Normal',2},{'Btn_Img02','RightPanel/SwitchBtnPanel/SwitchVoicePreviewBtnPanel/Btn_Normal/Btn_Img',2},{'Btn_HighLight01','RightPanel/SwitchBtnPanel/SwitchVoicePreviewBtnPanel/Btn_HighLight',2},{'Btn_Img03','RightPanel/SwitchBtnPanel/SwitchVoicePreviewBtnPanel/Btn_HighLight/Btn_Img',2},{'SwitchPersonalStoryBtnPanel','RightPanel/SwitchBtnPanel/SwitchPersonalStoryBtnPanel',2},{'Btn_Normal02','RightPanel/SwitchBtnPanel/SwitchPersonalStoryBtnPanel/Btn_Normal',2},{'Btn_Img04','RightPanel/SwitchBtnPanel/SwitchPersonalStoryBtnPanel/Btn_Normal/Btn_Img',2},{'Btn_HighLight02','RightPanel/SwitchBtnPanel/SwitchPersonalStoryBtnPanel/Btn_HighLight',2},{'Btn_Img05','RightPanel/SwitchBtnPanel/SwitchPersonalStoryBtnPanel/Btn_HighLight/Btn_Img',2},{'Img_Xian','RightPanel/Img_Xian',2},{'Img_Xian01','RightPanel/Img_Xian',2},{'LeftPanel','LeftPanel',2},{'heidi2','LeftPanel/RoleInfoPanel/heidi2',2},{'heidi1','LeftPanel/RoleInfoPanel/heidi1',2},{'RoleNameBG(1)','LeftPanel/RoleInfoPanel/RoleNameBG (1)',2},{'LowerInfoPanel','LeftPanel/RoleInfoPanel/LowerInfoPanel',2},{'Img_guang','LeftPanel/RoleInfoPanel/LowerInfoPanel/Img_guang',2},{'StarPrefab','LeftPanel/RoleInfoPanel/LowerInfoPanel/StarPrefab',2},{'StarPrefabJueXing','LeftPanel/RoleInfoPanel/LowerInfoPanel/StarPrefabJueXing',2},{'StarPanel','LeftPanel/RoleInfoPanel/LowerInfoPanel/StarPanel',2},{'jiao','LeftPanel/RoleInfoPanel/jiao',2},{'GroupIconImg','LeftPanel/RoleInfoPanel/jiao/GroupIconImg',2},{'Img_Fenggexian2','LeftPanel/RoleInfoPanel/Img_Fenggexian2',2},{'pilot','LeftPanel/RoleInfoPanel/pilot',2},{'RoleOccupationImg','LeftPanel/RoleInfoPanel/RoleOccupationImg',2},{'RoleFavorabilityPanel','LeftPanel/RoleFavorabilityPanel',2},{'RoleFavorabilitySlider','LeftPanel/RoleFavorabilityPanel/RoleFavorabilitySlider',2},{'haogandudi','LeftPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/haogandudi',2},{'CenterFavorSlider','LeftPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/haogandudi/CenterFavorSlider',2},{'Img_Haogandudi','LeftPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/Img_Haogandudi',2},{'xian','DetailPanel/xian',2},{'chakandi','DetailPanel/chakandi',2},{'fangda','DetailPanel/fangda',2},{'suoxiao','DetailPanel/suoxiao',2},{'Btn_ShowDetailSpine','DetailPanel/Btn_ShowDetailSpine',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Btn_Help','ReturnBg/Btn_Help',2},
        -- Text 列表
        {'IllustratorNameTitle','LeftPanel/RoleInfoPanel/heidi1/IllustratorNameTitle',3},{'IllustratorNameText','LeftPanel/RoleInfoPanel/heidi1/IllustratorNameText',3},
        -- UITemplate 列表
        {'StoryItem','RightPanel/StoryScroll/StoryItem',10},{'PersonalItem01','RightPanel/PesonalScroll/PersonalItem',10},{'VoiceItem01','RightPanel/VoiceScroll/VoiceItem',10},
        -- RawImage 列表
        {'PesonalScroll','RightPanel/PesonalScroll',15},{'VoiceScroll','RightPanel/VoiceScroll',15},
        -- LoopScrollRect 列表
        {'StoryScroll','RightPanel/StoryScroll',18},{'PesonalScroll01','RightPanel/PesonalScroll',18},{'VoiceScroll01','RightPanel/VoiceScroll',18},
        -- TextMeshProUGUI 列表
        {'Btn_Txt','RightPanel/SwitchBtnPanel/SwitchPersonalDocBtnPanel/Btn_Normal/Btn_Txt',20},{'Btn_Txt01','RightPanel/SwitchBtnPanel/SwitchPersonalDocBtnPanel/Btn_HighLight/Btn_Txt',20},{'Btn_Txt02','RightPanel/SwitchBtnPanel/SwitchVoicePreviewBtnPanel/Btn_Normal/Btn_Txt',20},{'Btn_Txt03','RightPanel/SwitchBtnPanel/SwitchVoicePreviewBtnPanel/Btn_HighLight/Btn_Txt',20},{'Btn_Txt04','RightPanel/SwitchBtnPanel/SwitchPersonalStoryBtnPanel/Btn_Normal/Btn_Txt',20},{'Btn_Txt05','RightPanel/SwitchBtnPanel/SwitchPersonalStoryBtnPanel/Btn_HighLight/Btn_Txt',20},{'CVNameTitle','LeftPanel/RoleInfoPanel/heidi2/CVNameTitle',20},{'CVNameText','LeftPanel/RoleInfoPanel/heidi2/CVNameText',20},{'RoleNameTxt','LeftPanel/RoleInfoPanel/RoleNameBG (1)/RoleNameTxt',20},{'CurRoleFavorabilityText','LeftPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/haogandudi/CurRoleFavorabilityText',20},{'Text_Haogandu','LeftPanel/RoleFavorabilityPanel/RoleFavorabilitySlider/Text_Haogandu',20},{'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
require("LocalData/RoleprofileLocalData")
require("LocalData/ActorLinesLocalData")
require("LocalData/TxtLocalData")
function M:OnInit()

end

function M:OnShow(pData)
    self.fangda().gameObject:SetActive(true)
    self.suoxiao().gameObject:SetActive(false)
    self.SpineState = 0
    self.VoiceState = 0 --- 0无状态，1播放，2暂停，3停止
    ---当前播放物体
    self.CurPlayAudioItem =
    {
        id = nil,
        ChangeFunc = nil,
        StopFunc = nil,
        path = nil
    }
    ---个人资料数据
    self.CurPesonalList = {}
    ---语音
    self.CurVoiceList={}
    ---@type RoleData
    self.CurrentHero = pData[1]  ---当前英雄
    self.BackFunc = pData[2]
    self.parent = pData[3]
    ---当前英雄好感等级 经验比 等级上限
    self.favorLevel, self.ExpRatio, self.LvLimit = Global.CheckFavorLv(self.CurrentHero.favor)
    ---初始化文本数据
    self:InitTxtData()
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化按钮
    self:InitButton()
    ------更新数据
    self:ReloadPesonalData(0)
    Tools.ForceRebuildLayout(self.PesonalContent().gameObject)      --Unity强制重新布局
    self:ReloadVoiceData(0)
    Tools.ForceRebuildLayout(self.VoiceContent().gameObject)      --Unity强制重新布局
    ---切换状态
    self:SwitchBtnType(0)
    ---初始化角色基础信息界面
    self:InitLeftRoleInfoPanel(self.CurrentHero)
end

function M:ShowDetailSpine(State)
    if self.CurPlayAudioItem.StopFunc then
        self.CurPlayAudioItem.StopFunc()
    end
    MgrTimer.Cancel("DocRoleVoice")
    MgrSound.Stop(3,"DocVoice",false)
    if State == 0 then
        self:TouchExit()
        self.fangda().gameObject:SetActive(true)
        self.suoxiao().gameObject:SetActive(false)
        self.RightPanel().gameObject:SetActive(true)
        self.LeftPanel().gameObject:SetActive(true)
        self.ReturnBg().gameObject:SetActive(true)
        self.parent:SpineMove(-394,0.3)
    elseif State == 1  then
        self.fangda().gameObject:SetActive(false)
        self.suoxiao().gameObject:SetActive(true)
        self.RightPanel().gameObject:SetActive(false)
        self.LeftPanel().gameObject:SetActive(false)
        self.ReturnBg().gameObject:SetActive(false)
        self.parent:SpineMove(self.parent.SpinePosX,0.3)
        self:TouchUpdate()
    end
    self.SpineState = State
end

--触摸移动放大立绘
function M:TouchUpdate()
    local _OldTouch1,_OldTouch2 --上次触摸点(手指1,2)
    local High=1000 --可拖动边界高
    local Wide=200 --可拖动边界宽
    local MaxScale=1.5
    local MinScale=0.5

    self.OldPosition= Vector3(self.parent.SpineObj.transform.localPosition.x,self.parent.SpineObj.transform.localPosition.y,self.parent.SpineObj.transform.localPosition.z) --记录初始立绘位置
    self.OldPositionScale = Vector3(self.parent.SpineObj.transform.localScale.x,self.parent.SpineObj.transform.localScale.y,self.parent.SpineObj.transform.localScale.z)
    MgrTimer.AddRepeat("TouchUpdate",0,function ()
        if Input.touchCount <= 0 then
            return
        end

        if 1 == Input.touchCount then   --单指触摸
            if Input.touches[0].phase == TouchPhase.Moved then
                local x,y
                x=Mathf.Clamp(self.parent.SpineObj.transform.localPosition.x+Input.touches[0].deltaPosition.x,self.OldPosition.x-Wide,self.OldPosition.x+Wide)
                y=Mathf.Clamp(self.parent.SpineObj.transform.localPosition.y+Input.touches[0].deltaPosition.y,self.OldPosition.y-High,self.OldPosition.y+High)

                self.parent.SpineObj.transform.localPosition=Vector3(x,y,self.OldPosition.z)
            end
        elseif 2 == Input.touchCount then  --双指触摸,放大缩小
            local _NewTouch1 = Input.GetTouch(0);
            local _NewTouch2 = Input.GetTouch(1);

            if _NewTouch2.phase == TouchPhase.Began then
                _OldTouch2 = _NewTouch2
                _OldTouch1 = _NewTouch1
                return
            end

            --计算老的两点距离和新的两点间距离，变大要放大模型，变小要缩放模型
            local _OldDistance = Vector2.Distance(_OldTouch1.position, _OldTouch2.position)
            local _NewDistance = Vector2.Distance(_NewTouch1.position, _NewTouch2.position)
            --两个距离之差，为正表示放大手势， 为负表示缩小手势
            local _Offset = _NewDistance - _OldDistance
            --放大因子， 一个像素按 0.001倍来算(1000可调整)
            local _ScaleFactor = _Offset / 1000;
            local _LocalScale = self.parent.SpineObj.transform.localScale;
            local _Scale = Vector3(_LocalScale.x + _ScaleFactor,
                                    _LocalScale.y + _ScaleFactor,
                                    _LocalScale.z + _ScaleFactor)

            if _Scale.x > MinScale and _Scale.y > MinScale and _Scale.z > MinScale and _Scale.x < MaxScale and _Scale.y < MaxScale and _Scale.y < MaxScale then
                self.parent.SpineObj.transform.localScale = _Scale;
            end

            --记住最新的触摸点，下次使用
            _OldTouch1 = _NewTouch1
            _OldTouch2 = _NewTouch2
        end
    end,-1,nil)
end

--触摸退出
function M:TouchExit()
    MgrTimer.Cancel("TouchUpdate")
    self.parent.SpineObj.transform.localPosition = self.OldPosition
    self.parent.SpineObj.transform.localScale = self.OldPositionScale
end

---初始化文本数据
function M:InitTxtData()
    self.CurPesonalList = {}
    self.CurVoiceList={}
    ---角色背景
    local _InfoDocTab=JNStrTool.strSplit(",",self.CurrentHero.briefintroduction)
    for i, n in ipairs(_InfoDocTab) do
        local _TempInfoTab = JNStrTool.strSplit("_",n)
        local t =
        {
            favor = tonumber(_TempInfoTab[1]),
            id = tonumber(_TempInfoTab[2]),
            isLock = false
        }
        if tonumber(_TempInfoTab[1]) <= self.favorLevel  then
            ---角色好感度不足
            t.isLock = true
        else
            ---角色好感度满足
            t.isLock = false
        end
        table.insert(self.CurPesonalList,t)
    end

    for i, n in pairs(ActorLinesLocalData.tab) do
        -- 匹配到对应的组别
        if n[2] == tonumber(self.CurrentHero.Interaction) then      --匹配当前角色的语音
            if string.sub(n[5], 1, 1) == "1" then
                local str = JNStrTool.strSplit("_",n[5])
                local t =
                {
                    favor =  tonumber(str[3]),
                    type = n[3],
                    jpPath = n[13],
                    id = n[1],
                    isLock = false
                }
                if self.CurrentHero.favor >= tonumber(str[3]) then
                    t.isLock = true
                else
                    t.isLock = false
                end
                table.insert(self.CurVoiceList,t)
            else
                local t =
                {
                    favor = 0,
                    type = n[3],
                    jpPath = n[13],
                    id = n[1],
                    isLock = true
                }
                table.insert(self.CurVoiceList,t)
            end
        end
    end

    table.sort(self.CurVoiceList, function(a,b)
            return a.id < b.id
    end)
end
---注册滑块
function M:RegisterLoopScroll()
    self.PesonalScroll01():SetLuaCellEvent(Handle(self,self.PesonalItem))
    self.VoiceScroll01():SetLuaCellEvent(Handle(self,self.VoiceItem))
end
---个人资料回调
function M:PesonalItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurPesonalList[idx]})
end
---语音回调
function M:VoiceItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurVoiceList[idx],self})
end
---设置个人资料滑动数据
function M:ReloadPesonalData(offset)
    ---设置Loop数量
    self.PesonalScroll01().totalCount = #self.CurPesonalList
    if offset then
        self.PesonalScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.PesonalScroll01():RefreshCells()              ---只刷新数据
    end
end
---设置语音滑动数据
function M:ReloadVoiceData(offset)
    ---设置Loop数量
    self.VoiceScroll01().totalCount = #self.CurVoiceList
    if offset then
        self.VoiceScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.VoiceScroll01():RefreshCells()              ---只刷新数据
    end
end
---初始化按钮
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Normal().gameObject,Handle(self, function ()
        self:SwitchBtnType(0)
    end))
    UIEvent.LuaClick(self.Btn_Normal01().gameObject,Handle(self,function ()
        self:SwitchBtnType(1)
    end))
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        if self.BackFunc then
            self.BackFunc()
        end
        MgrUI.ClosePop(self.Uid)
    end))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,function ()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    UIEvent.LuaClick(self.Btn_ShowDetailSpine().gameObject,Handle(self,function ()
        if self.SpineState == 0 then
            self:ShowDetailSpine(1)
        elseif self.SpineState == 1 then
            self:ShowDetailSpine(0)
        end
    end))
    ---好感度弹窗
    UIEvent.LuaClick(self.RoleFavorabilitySlider().gameObject,Handle(self,function()
        MgrUI.Pop(UID.FavorabilityRankPop_UI,{self.CurrentHero,self,self.parent},true)
    end))
end

function M:OnBackKey()
    if self.SpineState == 1 then
        self:ShowDetailSpine(0)
        return
    end

    if self.BackFunc then
        self.BackFunc()
    end
    MgrUI.ClosePop(self.Uid)
end

---初始化角色基础信息界面
---@param hero
function M:InitLeftRoleInfoPanel(hero)
    ---星数组
    self.unAwakenStarArr = {}
    ---觉醒星数组
    self.onAwakenStarArr = {}
    for i = 1, 6 do
        ---预创建星
        self.unAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefab().gameObject,self.StarPanel().gameObject.transform,false)
        ---预创建觉醒星
        self.onAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().gameObject.transform,false)
    end

    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)

    self.RoleNameTxt().text=""..hero.name
    MgrRes.LoadSprite(self.RoleOccupationImg(),hero.iconCareer)
    ---设置阵营
    MgrRes.LoadSprite(self.GroupIconImg(),"Attribute/"..hero.CampiconName)
    ---设置星
    for i = 1, #self.unAwakenStarArr do
        self.unAwakenStarArr[i]:SetActive(i <= self.CurrentHero.star and not self.CurrentHero.awaken) ---未觉醒星
        self.onAwakenStarArr[i]:SetActive(i <= self.CurrentHero.star and self.CurrentHero.awaken)     ---觉醒星
    end
    self:FreshFavor()

    --self.IllustratorNameText().text=""..hero.painter
    self.CVNameText().text=""..hero.voice
end

function M:FreshFavor()
    self.favorLevel, self.ExpRatio, self.LvLimit = Global.CheckFavorLv(self.CurrentHero.favor)
    self.CurRoleFavorabilityText().text= self.favorLevel
    self.CenterFavorSlider().fillAmount = self.favorLevel/self.LvLimit
    self.RoleFavorabilitySlider().fillAmount = self.ExpRatio
end

---右边切换按钮状态(个人资料/语音预览)
function M:SwitchBtnType(_Type)
    --- 根据当前选择类型切换顶部按钮状态
    ---清理语音停止播放
    if self.CurPlayAudioItem then
        if self.CurPlayAudioItem.func then
            self.CurPlayAudioItem.func()
        end
    end
    if _Type == 0 then
        --- 个人资料选中
        self.Btn_Normal().gameObject:SetActive(false)
        self.Btn_HighLight().gameObject:SetActive(true)
        self.Btn_Normal01().gameObject:SetActive(true)
        self.Btn_HighLight01().gameObject:SetActive(false)
        self:PesonalScroll().gameObject:SetActive(true)
        self:VoiceScroll().gameObject:SetActive(false)
    else
        --- 语音预览续选中
        self.Btn_Normal().gameObject:SetActive(true)
        self.Btn_HighLight().gameObject:SetActive(false)
        self.Btn_Normal01().gameObject:SetActive(false)
        self.Btn_HighLight01().gameObject:SetActive(true)
        self:PesonalScroll().gameObject:SetActive(false)
        self:VoiceScroll().gameObject:SetActive(true)
    end
end
---点击音频
function M:AudioClick(id,path,func,stopFunc)
    MgrTimer.Cancel("DocRoleVoice")
    if self.CurPlayAudioItem.id then
        if self.CurPlayAudioItem.id ~= id then
            print("+++++++++++++++++++",tostring(id))
            self.CurPlayAudioItem.ChangeFunc()
        end
    end
    self.CurPlayAudioItem.id = id
    self.CurPlayAudioItem.path = path
    self.CurPlayAudioItem.ChangeFunc = func
    self.CurPlayAudioItem.StopFunc = stopFunc
    print("?????????????????????????????",tostring(id))
    self.VoiceState = 1
    MgrSound.PlayRole(path,nil,nil,false,0,0,"DocVoice")
    self:ListenVoice()
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    if self.CurPlayAudioItem.id then
        self.CurPlayAudioItem.ChangeFunc()
    end
    MgrTimer.Cancel("DocRoleVoice")
end

--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("DocRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus("DocVoice") then
            self.CurPlayAudioItem.StopFunc()
            MgrTimer.Cancel("DocRoleVoice")
        end
    end,-1,nil)
end
return M