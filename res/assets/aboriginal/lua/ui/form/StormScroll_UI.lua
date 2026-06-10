-- Code Auto Create Begin
local M = Class('StormScroll_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.StormScroll_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[StormScroll_UI].prefab'
    self.Name = 'Form[StormScroll_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_BGMask','Img_BGMask',2},{'Plot_HL','Panel_Main/PlotStormScroll/Plot_HL',2},{'Img_Dangqiandian','Panel_Main/CurBarContent/Img_Dangqiandian',2},{'Img_Dian','Panel_Main/CurBarContent/Img_Dian',2},{'PlotMaskL','Panel_Main/PlotMaskL',2},{'PlotMaskR','Panel_Main/PlotMaskR',2},{'Btu_You','Panel_Main/Btu_You',2},{'Btu_Zuo','Panel_Main/Btu_Zuo',2},{'Cha_HL','Panel_Challenge/ChaStormScroll/Cha_HL',2},{'Plot_HL01','Panel_Activity/ActStormScroll/Plot_HL',2},{'Img_Dangqiandian01','Panel_Activity/CurBarContent/Img_Dangqiandian',2},{'Img_Dian01','Panel_Activity/CurBarContent/Img_Dian',2},{'PlotMaskL01','Panel_Activity/PlotMaskL',2},{'PlotMaskR01','Panel_Activity/PlotMaskR',2},{'Btu_You01','Panel_Activity/Btu_You',2},{'Btu_Zuo01','Panel_Activity/Btu_Zuo',2},{'UpperLeftBtnPanel','UpperLeftBtnPanel',2},{'Btn_Back','UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftBtnPanel/Btn_I',2},{'qieyedi','LabelContent/qieyedi',2},{'dian','LabelContent/dian',2},{'Img_Icon','LabelContent/Tog_Main/Normal/Img_Icon',2},{'HighLight','LabelContent/Tog_Main/HighLight',2},{'Img_Icon01','LabelContent/Tog_Main/HighLight/Img_Icon',2},{'Panel_Lock','LabelContent/Tog_Main/Panel_Lock',2},{'Img_Suo','LabelContent/Tog_Main/Panel_Lock/Img_Suo',2},{'Img_Icon02','LabelContent/Tog_Resources/Normal/Img_Icon',2},{'Img_ResSuo','LabelContent/Tog_Resources/Normal/Img_ResSuo',2},{'HighLight01','LabelContent/Tog_Resources/HighLight',2},{'Img_Icon03','LabelContent/Tog_Resources/HighLight/Img_Icon',2},{'Panel_Lock01','LabelContent/Tog_Resources/Panel_Lock',2},{'Img_Suo01','LabelContent/Tog_Resources/Panel_Lock/Img_Suo',2},{'Btn_Challenge','LabelContent/Btn_Challenge',2},{'Img_ChallengeSuo','LabelContent/Btn_Challenge/Img_ChallengeSuo',2},{'Img_Icon04','LabelContent/Btn_Challenge/Normal/Img_Icon',2},{'Img_Icon05','LabelContent/Btn_JointCrusade/Normal/Img_Icon',2},{'HighLight02','LabelContent/Btn_JointCrusade/HighLight',2},{'Img_Icon06','LabelContent/Btn_JointCrusade/HighLight/Img_Icon',2},{'Img_Lock','LabelContent/Btn_JointCrusade/Img_Lock',2},
        -- Button 列表
        {'Btn_JointCrusade','LabelContent/Btn_JointCrusade',4},
        -- UITemplate 列表
        {'PlotStormScrollItem','Panel_Main/PlotStormScroll/PlotStormScrollItem',10},{'ResStormScrollItem','Panel_Resources/ResStormScroll/ResStormScrollItem',10},{'ChaStormScrollItem','Panel_Challenge/ChaStormScroll/ChaStormScrollItem',10},{'ActStormScrollItem','Panel_Activity/ActStormScroll/ActStormScrollItem',10},
        -- Toggle 列表
        {'Tog_Bar','Panel_Main/CurBarContent/Img_Dian/Tog_Bar',13},{'Tog_Bar01','Panel_Activity/CurBarContent/Img_Dian/Tog_Bar',13},{'Tog_Main','LabelContent/Tog_Main',13},{'Tog_Resources','LabelContent/Tog_Resources',13},
        -- RawImage 列表
        {'PlotStormScroll','Panel_Main/PlotStormScroll',15},{'PlotStormContent','Panel_Main/PlotStormScroll/PlotStormContent',15},{'Tog_Bar02','Panel_Main/CurBarContent/Img_Dian/Tog_Bar',15},{'ResStormScroll','Panel_Resources/ResStormScroll',15},{'ResStormContent','Panel_Resources/ResStormScroll/ResStormContent',15},{'ResStormScrollItem01','Panel_Resources/ResStormScroll/ResStormScrollItem',15},{'ChaStormScroll','Panel_Challenge/ChaStormScroll',15},{'ChaStormContent','Panel_Challenge/ChaStormScroll/ChaStormContent',15},{'ActStormScroll','Panel_Activity/ActStormScroll',15},{'ActStormContent','Panel_Activity/ActStormScroll/ActStormContent',15},{'Tog_Bar03','Panel_Activity/CurBarContent/Img_Dian/Tog_Bar',15},{'Tog_Main01','LabelContent/Tog_Main',15},{'Tog_Resources01','LabelContent/Tog_Resources',15},{'Btn_Resources','LabelContent/Btn_Resources',15},{'Btn_JointCrusade01','LabelContent/Btn_JointCrusade',15},
        -- LoopScrollRect 列表
        {'PlotStormScroll01','Panel_Main/PlotStormScroll',18},{'ResStormScroll01','Panel_Resources/ResStormScroll',18},{'ChaStormScroll01','Panel_Challenge/ChaStormScroll',18},{'ActStormScroll01','Panel_Activity/ActStormScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Mail_CN','UpperLeftBtnPanel/Text_Mail/Text_Mail_CN',20},{'Text_Mail_EN','UpperLeftBtnPanel/Text_Mail/Text_Mail_EN',20},{'Text_Name_Cn','LabelContent/Tog_Main/Normal/Text_Name_Cn',20},{'Text_Name_En','LabelContent/Tog_Main/Normal/Text_Name_En',20},{'Text_Name_Cn01','LabelContent/Tog_Main/HighLight/Text_Name_Cn',20},{'Text_Name_En01','LabelContent/Tog_Main/HighLight/Text_Name_En',20},{'Text_Name_Cn02','LabelContent/Tog_Resources/Normal/Text_Name_Cn',20},{'Text_Name_En02','LabelContent/Tog_Resources/Normal/Text_Name_En',20},{'Text_Name_Cn03','LabelContent/Tog_Resources/HighLight/Text_Name_Cn',20},{'Text_Name_En03','LabelContent/Tog_Resources/HighLight/Text_Name_En',20},{'Text_Name_Cn04','LabelContent/Btn_Challenge/Normal/Text_Name_Cn',20},{'Text_Name_En04','LabelContent/Btn_Challenge/Normal/Text_Name_En',20},{'Text_Name_Cn05','LabelContent/Btn_JointCrusade/Normal/Text_Name_Cn',20},{'Text_Name_En05','LabelContent/Btn_JointCrusade/Normal/Text_Name_En',20},{'Text_Name_Cn06','LabelContent/Btn_JointCrusade/HighLight/Text_Name_Cn',20},{'Text_Name_En06','LabelContent/Btn_JointCrusade/HighLight/Text_Name_En',20},
    }
end
-- Code Auto Create End
---卷初始化
function M:OnInit()
    ---当前卷，默认1剧情(1剧情，2资源，3挑战，4活动，5世界boss)
    StormViewModel.CurScrollType = StormViewModel.CurScrollType == nil and 1 or StormViewModel.CurScrollType
    ---如果是引导中 固定当前卷类型
    if NoviceViewModel.CurTaskId == 20802 then
        StormViewModel.CurScrollType = 1
    end
    ---当前主线索引
    self.curMainIndex = 0
    ---当前挑战索引PlotStormScroll
    self.curChaIndex = 0
    ---背景
    self.Bg = self.Img_BG()
    ---loop滑块组
    self.LoopScrollGroup = {
        [1] = self.PlotStormScroll01(),     ---剧情
        [2] = self.ResStormScroll01(),      ---资源
        [3] = self.ChaStormScroll01(),      ---挑战
    }
    ---注册loopScroll
    self:RegisterLoopScroll()
    ---初始化卷类型按钮
    self:InitScrollType()
    ---初始化杂项
    self:InitCommon()
    ---每日任务或成就任务跳转资源页面
    if ActivationTaskViewModel.TurnToTaskPage then
        StormViewModel.CurScrollType = 2
        self.Tog_Resources().isOn = true
        ActivationTaskViewModel.TurnToTaskPage = false
    else
        ---若是主线卷滑动到最靠后的解锁卷
        if StormViewModel.CurScrollType == 1 then
            local index = 0
            for i, v in ipairs(self.CurLoopList) do
                if v.id ~= nil then
                    if StormControl.CheckScrollLock(v.id) then
                        index = v.index - 1
                    else
                        break
                    end
                end
            end
            if NoviceViewModel.CurTaskId == 20802 then
                self.LoopScrollGroup[1]:RefillCells(1)
            else
                self.LoopScrollGroup[1]:ScrollToCell(index,9000) --todo
            end
        end
    end
    ---新手引导事件
    Event.Clear("CloseScroll")
    Event.Add("CloseScroll",function()
        self.PlotStormScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").horizontal = false
    end)
    Event.Clear("OpenScroll")
    Event.Add("OpenScroll",function()
        self.PlotStormScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").horizontal = true
    end)
    Event.Clear("ChaCloseScroll")
    Event.Add("ChaCloseScroll",function()
        self.ChaStormScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").horizontal = false
    end)
    Event.Clear("ChaOpenScroll")
    Event.Add("ChaOpenScroll",function()
        self.ChaStormScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").horizontal = true
    end)
end

function M:OnShowFinish()

end
---初始化卷通用接口
function M:InitCommon()
    ---主线数量
    self.maxPlotCount = #self.CurLoopList - 2
    ---返回点击事件
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self, self.OnBackClick))
    ---跳转联合讨伐
    UIEvent.LuaClick(self.Btn_JointCrusade().gameObject,function()
        if SysLockControl.CheckSysLock(1105) then
            ---进入红色巨塔ui
            MgrUI.GoHide(UID.StormTower_UI)
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1105),1},true)
        end
    end)
    ---帮助界面
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(88)
    end))

    ---主线左右切页按钮事件
    UIEvent.LuaClick(self.Btu_Zuo().gameObject,function()
        local index = self.LoopScrollGroup[1].curItemIndex
        index = (index - 1) < 0 and 0 or index - 1
        self.LoopScrollGroup[1]:ScrollToCell(index,3500)
    end)
    UIEvent.LuaClick(self.Btu_You().gameObject,function()
        local index = self.LoopScrollGroup[1].curItemIndex
        index = (index + 1) >= self.maxPlotCount - 1 and self.maxPlotCount - 1 or index + 1
        self.LoopScrollGroup[1]:ScrollToCell(index,3500)
    end)
    for i = 1, self.maxPlotCount - 2 do
        local trans = GameObject.Instantiate(self.Img_Dian().transform,self.Img_Dian().transform.parent,false)
        local tog = trans:Find("Tog_Bar"):GetComponent("Toggle")
        Tools.ToggleValueChange(tog,function(isOn)
            if isOn then
                local index = trans:GetSiblingIndex()
                self.LoopScrollGroup[1]:ScrollToCell(index,3500)
            end
        end,nil)
    end
    ---主线下方点阵更新
    Tools.ToggleValueChange(self.Img_Dian().transform:Find("Tog_Bar"):GetComponent("Toggle"),function(isOn)
        if isOn then
            local index = self.Img_Dian().transform:GetSiblingIndex()
            self.LoopScrollGroup[1]:ScrollToCell(index,3500)
        end
    end,nil)
    ---主线高亮
    self.plotMaskL = self.PlotMaskL()
    self.plotMaskR = self.PlotMaskR()
    self.plotHl = self.Plot_HL()
    self.plotContent = self.PlotStormContent().transform
    self.plotHlDiff = 0
    self.plotHlLastDiff = 0
    ---挑战高亮
    self.chaHl = self.Cha_HL()
    self.chaContent = self.ChaStormContent().transform
    self.chaHlDiff = 0
    self.chaHlLastDiff = 0
end
---卷刷新
function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---检查卷类型标签是否解锁
    if SysLockControl.CheckSysLock(1102) then
        self.Img_ResSuo().gameObject:SetActive(false)
        self.Img_Icon01().gameObject:SetActive(true)
        self.Btn_Resources().gameObject:SetActive(false)
    else
        self.Img_ResSuo().gameObject:SetActive(true)
        self.Img_Icon01().gameObject:SetActive(false)
        self.Btn_Resources().gameObject:SetActive(true)
    end
    ---战术指导是否解锁
    if SysLockControl.CheckSysLock(1109) then
        self.Btn_Challenge().transform:Find("Img_ChallengeSuo").gameObject:SetActive(false)
        self.Btn_Challenge().transform:Find("Normal/Img_Icon").gameObject:SetActive(true)
    else
        self.Btn_Challenge().transform:Find("Img_ChallengeSuo").gameObject:SetActive(true)
        self.Btn_Challenge().transform:Find("Normal/Img_Icon").gameObject:SetActive(false)
    end
    ---红色巨塔是否解锁
    if SysLockControl.CheckSysLock(1105) then
        self.Btn_JointCrusade().transform:Find("Img_Lock").gameObject:SetActive(false)
        self.Btn_JointCrusade().transform:Find("Normal/Img_Icon").gameObject:SetActive(true)
    else
        self.Btn_JointCrusade().transform:Find("Img_Lock").gameObject:SetActive(true)
        self.Btn_JointCrusade().transform:Find("Normal/Img_Icon").gameObject:SetActive(false)
    end
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113020][2],0.2)

    MgrTimer.AddRepeat("StormDian",0,function()
        if StormViewModel.CurScrollType == 1 then
            ---主线
            if self.curMainIndex ~=self.LoopScrollGroup[1].curItemIndex then
                self.curMainIndex = self.LoopScrollGroup[1].curItemIndex
                self.Img_Dangqiandian().transform:SetSiblingIndex((self.curMainIndex))
                ---更新左遮罩
                Tools.DoPFade(self.plotMaskL, self.curMainIndex == 0 and 0 or 1 ,0.2,0,1,false,0,0,nil)
                ---更新右遮罩
                Tools.DoPFade(self.plotMaskR, self.curMainIndex == self.maxPlotCount - 1 and 0 or 1 ,0.2,0,1,false,0,0,nil)
                ---更新背景
                self:UpdateBackground(1)
                MgrSound.PlayEffect("yx_ui_qiehuanzhangjie_01",1,nil,false)
            end
            local diff = math.abs(self.plotContent.anchoredPosition.x % 835)
            self.plotHlDiff = diff < 1 or diff > 834
            if self.plotHlDiff ~= self.plotHlLastDiff then
                self.plotHlLastDiff = self.plotHlDiff
                Tools.DoPFade(self.plotHl, self.plotHlLastDiff and 1 or 0 ,0.5,0,2,false,0,0,nil)
                if self.plotHlLastDiff then
                    local child = self.curMainIndex - self.LoopScrollGroup[1].itemTypeStart + 1
                    if child < 0 then
                        child = 0
                    end
                    if child >= self.plotContent.childCount then
                        child = self.plotContent.childCount - 1
                    end
                    self.plotHl.transform:SetParent(self.plotContent:GetChild(child),false)
                    self.plotHl.transform:SetSiblingIndex(0)
                    self.plotHl.transform.localPosition = Vector3.zero
                end
            end
        elseif StormViewModel.CurScrollType == 3 then
            ---挑战
            if self.curChaIndex ~=self.LoopScrollGroup[3].curItemIndex then
                self.curChaIndex = self.LoopScrollGroup[3].curItemIndex
                ---更新背景
                self:UpdateBackground(3)
                MgrSound.PlayEffect("yx_ui_qiehuanzhangjie_01",1,nil,false)
            end
            local diff = math.abs(self.chaContent.anchoredPosition.x % 537)
            self.chaHlDiff = diff < 1 or diff > 536
            if self.chaHlLastDiff ~= self.chaHlDiff then
                self.chaHlLastDiff = self.chaHlDiff
                Tools.DoPFade(self.chaHl, self.chaHlLastDiff and 1 or 0 ,0.5,0,2,false,0,0,nil)
                if self.chaHlLastDiff then
                    local child = self.curChaIndex - self.LoopScrollGroup[3].itemTypeStart + 2
                    if child < 0 then
                        child = 0
                    end
                    if child >= self.chaContent.childCount then
                        child = self.chaContent.childCount - 2
                    end
                    if self.chaHl.transform.parent.gameObject.name == "Panel" then
                        Tools.DoPosMove(self.chaHl.transform.parent, 0, 0, 0.2, 0, 5, false, 0, 0)
                        self.chaHl.transform.parent:Find("Img_Mask").gameObject:SetActive(true)
                    end
                    local childObj = self.chaContent:GetChild(child):GetChild(0)
                    self.chaHl.transform:SetParent(childObj,false)
                    self.chaHl.transform:SetSiblingIndex(0)
                    self.chaHl.transform.localPosition = Vector3.zero
                    Tools.DoPosMove(self.chaHl.transform.parent, 0, 35, 0.2, 0, 6, false, 0, 0)
                    self.chaHl.transform.parent:Find("Img_Mask").gameObject:SetActive(false)
                end
            end
        end
    end,-1,nil)
    self:ResetItem()

    --移至最大章节
    ---每日任务或成就任务跳转资源页面
    if ActivationTaskViewModel.TurnToTaskPage then
        StormViewModel.CurScrollType = 2
        self.Tog_Resources().isOn = true
        ActivationTaskViewModel.TurnToTaskPage = false
    else
        ---若是主线卷滑动到最靠后的解锁卷
        if StormViewModel.CurScrollType == 1 then
            local index = 0
            for i, v in ipairs(self.CurLoopList) do
                if v.id ~= nil then
                    if StormControl.CheckScrollLock(v.id) then
                        index = v.index - 1
                    else
                        break
                    end
                end
            end
            if NoviceViewModel.CurTaskId == 20802 then
                self.LoopScrollGroup[1]:RefillCells(1)
            else
                if StormViewModel.CurScrollData then --如果选择过关卡,返回界面时移动到选择过的关卡，否则移动到当前可通关的最大管卡
                    self.LoopScrollGroup[1]:ScrollToCell(StormViewModel.CurScrollData.index, 9000)
                else
                    self.LoopScrollGroup[1]:ScrollToCell(index + 1,9000)--todo
                end
            end
        elseif StormViewModel.CurScrollType == 3 then    --如果是挑战卷
            local index = 0
            for k,v in ipairs(self.CurLoopList) do
                if v.type2 and v.type2 == 20 and StormViewModel.CurChallenge == StormViewModel.ChallengeType.tower then  --如果是巨塔
                    index = k
                    break
                elseif v.type2 and v.type2 == 21 and StormViewModel.CurChallenge == StormViewModel.ChallengeType.guide then  --如果是战术指导
                    index = k
                    break
                end
            end
            if StormViewModel.CurChallenge then --如果选择过挑战,返回界面时移动到选择过的挑战
                if index - 3 == 0 then
                    self.LoopScrollGroup[StormViewModel.CurScrollType]:ScrollToCell(index - 3,9000)
                else
                    self.LoopScrollGroup[StormViewModel.CurScrollType]:RefillCells(index - 3)
                end
            end
        end
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self:OnBackClick()
    end
end

---初始化卷类型按钮
function M:InitScrollType()
    self.ResStormScroll01().transform.parent.gameObject:SetActive(false)
    self.ChaStormScroll01().transform.parent.gameObject:SetActive(false)
    self.ActStormScroll01().transform.parent.gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Resources().gameObject,Handle(self,function()
        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1102),1},true)
    end))
    UIEvent.LuaClick(self.Btn_Challenge().gameObject,Handle(self,function()
        if SysLockControl.CheckSysLock(1109) then
            MgrUI.GoHide(UID.GuidePoint_UI)
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1109),1},true)
        end
    end))

    local toggles = {
        self.Tog_Main(),
        self.Tog_Resources(),
    }
    self.OnceList = {}
    for type, toggle in pairs(toggles) do
        local normal = toggle.gameObject.transform:Find("Normal").gameObject
        local highLight = toggle.gameObject.transform:Find("HighLight").gameObject
        Tools.ToggleValueChange(toggle,function(isOn)
            normal:SetActive(not isOn)
            highLight:SetActive(isOn)
            StormViewModel.CurScrollType = type
            if self.LoopScrollGroup[type] then
                self.LoopScrollGroup[type].transform.parent.gameObject:SetActive(isOn)
            end
            if isOn then
                self:ResetItem(self.OnceList[StormViewModel.CurScrollType] == nil)
                self.OnceList[StormViewModel.CurScrollType] = true
                ---更新背景
                self:UpdateBackground(StormViewModel.CurScrollType)
                ---新手引导判断
                if NoviceViewModel.CurTaskId == 20103 and StormViewModel.CurScrollType == 2 then
                    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
                elseif NoviceViewModel.CurTaskId == 20213 and StormViewModel.CurScrollType == 3 then
                    NoviceViewModel.DoNext()
                elseif NoviceViewModel.CurTaskId == 21203 and StormViewModel.CurScrollType == 3 then
                    NoviceViewModel.DoNext()
                elseif NoviceViewModel.CurTaskId == 21703 and StormViewModel.CurScrollType == 3 then
                    NoviceViewModel.DoNext()
                end
            end
        end,nil)
    end

    toggles[StormViewModel.CurScrollType].isOn = false
    toggles[StormViewModel.CurScrollType].isOn = true
end
---注册滑块
function M:RegisterLoopScroll()
    for type, loopScroll in ipairs(self.LoopScrollGroup) do
        loopScroll:SetLuaCellEvent(function(...)
            self:CellItem(type,...)
        end)
    end
end
---剧情卷回调
function M:CellItem(type,trans,idx)
    if type == 1 then
        trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self})
    elseif type == 2 then
        trans:GetComponent("UITemplate"):SetData(self.CurLoopList[idx])
    elseif type == 3 then
        trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self})
    end
end

---刷新卷滑动数据
function M:ResetItem(isOnce)
    ---获取当前loop数据
    self.CurLoopList = StormViewModel.GetStormScrollData(StormViewModel.CurScrollType)
    if (StormViewModel.CurScrollType == 1 or StormViewModel.CurScrollType == 3) and self.LoopScrollGroup[StormViewModel.CurScrollType].totalCount ~= #self.CurLoopList then
        self.LoopScrollGroup[StormViewModel.CurScrollType].totalCount = #self.CurLoopList
        self.LoopScrollGroup[StormViewModel.CurScrollType].maxItemIndex = #self.CurLoopList - 2
        if isOnce then
            self.LoopScrollGroup[StormViewModel.CurScrollType]:RefillCells()
        else
            self.LoopScrollGroup[StormViewModel.CurScrollType]:RefreshCells()
        end
    else
        if self.LoopScrollGroup[StormViewModel.CurScrollType] and StormViewModel.CurScrollType ~= 3 then
            if isOnce then
                self.LoopScrollGroup[StormViewModel.CurScrollType]:RefillCells()
            else
                self.LoopScrollGroup[StormViewModel.CurScrollType]:RefreshCells()
            end
        end
    end
end

---更新背景
function M:UpdateBackground(type)
    local path = ""
    if type == 1 then
        path = self.CurLoopList[self.curMainIndex + 2].bg
    elseif type == 2 then
        path = self.CurLoopList[1].bg
    elseif type == 3 then
        path = self.CurLoopList[self.curChaIndex + 3].bg
    end
    path = MgrRes.GetLocalizedName(path)
    ---退出战斗场景会触发了更换背景函数 timer里的函数没有被执行导致背景图丢失 所以判断当前UI状态来决定是否启用timer
    if self.UState == UIState.Hide or self.UState == UIState.Close then
        MgrRes.LoadSprite(self.Bg,path)
        Tools.DoPFade(self.Bg,1,0.2,0,1,false,0,0,nil)
    else
        Tools.DoPFade(self.Bg,0,0.1,0,1,false,0,0,nil)
        MgrTimer.Cancel("SelectScrollBG")
        MgrTimer.AddDelay("SelectScrollBG",0.1,function()
            MgrRes.LoadSprite(self.Bg,path)
            Tools.DoPFade(self.Bg,1,0.2,0,1,false,0,0,nil)
        end,nil)
    end
end

---返回事件
function M:OnBackClick()
    Event.Go("ShowNewRoleFormationSelf")
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    StormViewModel.ClearData()
    MgrUI.GoBack()
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("SelectScrollBG")
    MgrTimer.Cancel("StormDian")
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("SelectScrollBG")
    MgrTimer.Cancel("StormDian")
    --Event.Go("ShowNewRoleFormationSelf")
end

return M