-- Code Auto Create Begin
local M = Class('HaiYueTask_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HaiYueTask_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HaiYueTask_UI].prefab'
    self.Name = 'Form[HaiYueTask_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'Role','Ani/Role',2},{'SpineRole','Ani/Role/SpineRole',2},{'RoleClickArea','Ani/Role/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','Ani/Role/Img_SoundTextBG',2},{'TopGroup','Ani/RIghtGroup/TopGroup',2},{'Mission1','Ani/RIghtGroup/TopGroup/Mission1',2},{'Img_Plot2','Ani/RIghtGroup/TopGroup/Mission1/Unchecked/Img_Plot2',2},{'Img_Plot1','Ani/RIghtGroup/TopGroup/Mission1/Checked/Img_Plot1',2},{'RedDotIcon1','Ani/RIghtGroup/TopGroup/Mission1/RedDotIcon1',2},{'Mission2','Ani/RIghtGroup/TopGroup/Mission2',2},{'Img_Plot201','Ani/RIghtGroup/TopGroup/Mission2/Unchecked/Img_Plot2',2},{'Img_Plot101','Ani/RIghtGroup/TopGroup/Mission2/Checked/Img_Plot1',2},{'RedDotIcon2','Ani/RIghtGroup/TopGroup/Mission2/RedDotIcon2',2},{'black','Ani/RIghtGroup/black',2},{'btn_AllRec','Ani/RIghtGroup/btn_AllRec',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- UITemplate 列表
        {'HYMissionItem','Ani/RIghtGroup/MissionScroll/HYMissionItem',10},
        -- Toggle 列表
        {'Mission101','Ani/RIghtGroup/TopGroup/Mission1',13},{'Mission201','Ani/RIghtGroup/TopGroup/Mission2',13},
        -- RawImage 列表
        {'MissionScroll','Ani/RIghtGroup/MissionScroll',15},
        -- LoopScrollRect 列表
        {'MissionScroll01','Ani/RIghtGroup/MissionScroll',18},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','Ani/Role/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TaskGroup = nil
    self.StrType = "daily"
    self.HaiyueData = HaiYueControl.GetHaiYueInfo()
    ---当前组id
    self.curSubType = self.HaiyueData.dayTaskId

    self.MissionScroll01():SetLuaCellEvent(Handle(self, self.RefreshCell))
    self:InitBtn()
    self:RefreshRedPoint()

    --- 支持日常/成就任务不配置
    local bHideTaskTog = false
    if CheckNumber(self.HaiyueData.dayTaskId) == 0 then
        bHideTaskTog = true
        self:ReloaData("achieve")
    elseif CheckNumber(self.HaiyueData.taskId) == 0 then
        bHideTaskTog = true
        self:ReloaData("daily")
    end

    if bHideTaskTog then
        local togGroup = self.Mission1().transform.parent
        if not Global.IsNil(togGroup) then
            togGroup.gameObject:SetActive(false)
        end
    end
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击背后空白区域
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)

    ---点击关闭按钮
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        MgrUI.GetUICamera().orthographic = false
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---一键领取
    UIEvent.LuaClick(self.btn_AllRec().gameObject,function()
        if not self.CurDotState then
            return
        end
        local taskType = 0
        if self.StrType == "daily" then
            taskType = self.TaskGroup[1].type
        end
        ActivationTaskViewModel.TaskPerform(taskType,0,nil,self.curSubType,function()
            self:RefreshRedPoint()
            self:ReloaData()
        end)
    end)

    local tFirstBtn = 1
    if not Global.isMiddleTime(self.HaiyueData.beginTime,self.HaiyueData.battleEndTime) then
        tFirstBtn = 2
    end
    local TopBtns = {
        [1] = { btn = self.Mission101(), select = self.Mission1().gameObject.transform:Find("Checked").gameObject, unSelect = self.Mission1().gameObject.transform:Find("Unchecked").gameObject },
        [2] = { btn = self.Mission201(), select = self.Mission2().gameObject.transform:Find("Checked").gameObject, unSelect = self.Mission2().gameObject.transform:Find("Unchecked").gameObject },
    }
    for i = 1, #TopBtns do
        Tools.ToggleValueChange(TopBtns[i].btn,function(isOn)
            if tFirstBtn == 2 then
                if isOn and i == 1 then
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text4"), 1 }, true)
                end
                return
            end
            if isOn then
                TopBtns[i].select:SetActive(true)
                TopBtns[i].unSelect:SetActive(false)

                if i == 1 then
                    self:ReloaData("daily")
                else
                    self:ReloaData("achieve")
                end
            else
                TopBtns[i].select:SetActive(false)
                TopBtns[i].unSelect:SetActive(true)
            end
        end)
        if i == tFirstBtn then
            TopBtns[i].select:SetActive(true)
            TopBtns[i].unSelect:SetActive(false)
            if i == 1 then
                self:ReloaData("daily")
            else
                self:ReloaData("achieve")
            end
        else
            TopBtns[i].select:SetActive(false)
            TopBtns[i].unSelect:SetActive(true)
        end
    end
end

function M:RefreshCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({ self.TaskGroup[idx], self, })
end

---刷新成就滑动数据
function M:ReloaData(_strType)
    self.CurDotState = false
    if _strType then
        self.StrType = _strType
    end
    if self.StrType == "daily" then
        self.TaskGroup = HaiYueControl.GetDailyTaskData()
        self.curSubType = self.HaiyueData.dayTaskId

        self.CurDotState = RedDotControl.GetDotData("HaiYueDailyTask"):GetCurDotState()
    else
        self.TaskGroup = HaiYueControl.GetTaskData()
        self.curSubType = self.HaiyueData.taskId

        self.CurDotState = RedDotControl.GetDotData("HaiYueAchievement"):GetCurDotState()
    end
    self.MissionScroll01().totalCount = #self.TaskGroup
    self.MissionScroll01():RefillCells(0)
    ---一键领取按钮状态
    if self.CurDotState then
        MgrRes.LoadSprite(self.btn_AllRec(),"Activity/HaiYue/yijianlingqu")
    else
        MgrRes.LoadSprite(self.btn_AllRec(),"Activity/HaiYue/yijianlingqu2")
    end
end

---刷新红点
function M:RefreshRedPoint()
    HaiYueControl.CheckTaskRedPoint()
    for i, v in pairs(RedDotControl.GetDotData("HaiYue").childNodeData) do
        if v.name == "HaiYueDailyTask" then
            self.RedDotIcon1().gameObject:SetActive(v.State)
        elseif v.name == "HaiYueAchievement" then
            self.RedDotIcon2().gameObject:SetActive(v.State)
        end
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M