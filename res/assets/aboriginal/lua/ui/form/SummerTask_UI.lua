-- Code Auto Create Begin
local M = Class('SummerTask_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SummerTask_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SummerTask_UI].prefab'
    self.Name = 'Form[SummerTask_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Mask','Ani/Img_Mask',2},{'Bg','Ani/Bg',2},{'Btn_Close','Ani/Bg/Btn_Close',2},{'Img_Close','Ani/Bg/Btn_Close/Img_Close',2},{'VFXMask','Ani/VFXMask',2},{'Scrollbar','Ani/VFXMask/Scrollbar',2},{'Handle','Ani/VFXMask/Scrollbar/Sliding Area/Handle',2},{'Slider','Ani/VFXMask/Slider',2},{'TaskContent','Ani/VFXMask/TaskScroll/TaskContent',2},{'Img_JieshuIcon','Ani/VFXMask/TaskScroll/Img_JieshuIcon',2},{'Type','Ani/Type',2},{'Daily','Ani/Type/Daily',2},{'Normal','Ani/Type/Daily/Normal',2},{'NormalIcon','Ani/Type/Daily/Normal/NormalIcon',2},{'HighLight','Ani/Type/Daily/HighLight',2},{'HighLightIcon','Ani/Type/Daily/HighLight/HighLightIcon',2},{'DailyRedDotIcon','Ani/Type/Daily/DailyRedDotIcon',2},{'Ac','Ani/Type/Ac',2},{'Normal01','Ani/Type/Ac/Normal',2},{'NormalIcon01','Ani/Type/Ac/Normal/NormalIcon',2},{'HighLight01','Ani/Type/Ac/HighLight',2},{'HighLightIcon01','Ani/Type/Ac/HighLight/HighLightIcon',2},{'AcRedDotIcon','Ani/Type/Ac/AcRedDotIcon',2},{'Tuya','Ani/Tuya',2},{'Img_Tuya','Ani/Tuya/Img_Tuya',2},{'Img_Tuya2','Ani/Tuya/Img_Tuya2',2},{'Img_Jiaodai','Ani/Tuya/Img_Jiaodai',2},{'Btn_Receive','Ani/Btn_Receive',2},{'Img_Receivedi','Ani/Btn_Receive/Img_Receivedi',2},{'Btn_UnReceive','Ani/Btn_UnReceive',2},{'Img_Receivedi01','Ani/Btn_UnReceive/Img_Receivedi',2},
        -- UITemplate 列表
        {'SummerEventTaskItem','Ani/VFXMask/TaskScroll/SummerEventTaskItem',10},
        -- Toggle 列表
        {'Daily01','Ani/Type/Daily',13},{'Ac01','Ani/Type/Ac',13},
        -- RawImage 列表
        {'TaskScroll','Ani/VFXMask/TaskScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','Ani/VFXMask/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Yijieshu','Ani/VFXMask/TaskScroll/Img_JieshuIcon/Text_Yijieshu',20},{'Text_Daily','Ani/Type/Daily/Normal/Text_Daily',20},{'Text_Daily01','Ani/Type/Daily/HighLight/Text_Daily',20},{'Text_Ac','Ani/Type/Ac/Normal/Text_Ac',20},{'Text_Ac01','Ani/Type/Ac/HighLight/Text_Ac',20},{'Text_Receive','Ani/Btn_Receive/Text_Receive',20},{'Text_Receive01','Ani/Btn_UnReceive/Text_Receive',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_JieshuIcon().gameObject:SetActive(false)
    
    self.CanReceiveCount = 0
    self.IsLevelOpen = SummerControl.CheckChapterTimeOpen(ActiveChapterControl.ChapterType.Logic)
    self:InitScroll()
    self:InitBtn()
    self:RefreshRedPoint()
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击背后空白区域
    UIEvent.LuaClick(self.Img_Mask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)

    ---点击关闭按钮
    UIEvent.LuaClick(self.Btn_Close().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)

    ---左侧图片默认关闭
    self.Img_Tuya().gameObject:SetActive(false)
    self.Img_Tuya2().gameObject:SetActive(false)
    ---点击每日
    local tog1Normal = self.Daily01().gameObject.transform:Find("Normal").gameObject
    local tog1HL = self.Daily01().gameObject.transform:Find("HighLight").gameObject
    Tools.ToggleValueChange(self.Daily01(),function(isOn)
        tog1Normal:SetActive(not isOn)
        tog1HL:SetActive(isOn)
        if isOn then
            ---翻页音效
            MgrSound.PlayEffect("yx_xh_4",1,0,false,0,0,"summer")
            
            SummerControl.curTaskType = SummerControl.TaskType.daily
            self.Img_Tuya().gameObject:SetActive(true)
            self.Img_Tuya2().gameObject:SetActive(false)
            self.Tuya().gameObject.transform:GetComponent("Animation"):Play()
            self.VFXMask().gameObject.transform:GetComponent("Animation"):Play()
            
            if not self.IsLevelOpen then
                self.Img_JieshuIcon().gameObject:SetActive(true)
                self.Btn_UnReceive().gameObject:SetActive(false)
                self.Btn_Receive().gameObject:SetActive(false)

                self.TaskScroll01().totalCount = 0
                self.TaskScroll01():RefillCells()
                return
            end
            self:ReloadTaskData(0)
            
            if self.CanReceiveCount <= 0 then
                self.Btn_UnReceive().gameObject:SetActive(true)
                self.Btn_Receive().gameObject:SetActive(false)
            else
                self.Btn_UnReceive().gameObject:SetActive(false)
                self.Btn_Receive().gameObject:SetActive(true)
            end
        end
    end)

    ---点击成就
    local tog2Normal = self.Ac01().gameObject.transform:Find("Normal").gameObject
    local tog2HL = self.Ac01().gameObject.transform:Find("HighLight").gameObject
    Tools.ToggleValueChange(self.Ac01(),function(isOn)
        tog2Normal:SetActive(not isOn)
        tog2HL:SetActive(isOn)
        if isOn then
            ---翻页音效
            MgrSound.PlayEffect("yx_xh_4",1,0,false,0,0,"summer")
            
            SummerControl.curTaskType = SummerControl.TaskType.achievement
            self.Img_JieshuIcon().gameObject:SetActive(false)
            
            self:ReloadAcheData(0)
            self.Img_Tuya2().gameObject:SetActive(true)
            self.Img_Tuya().gameObject:SetActive(false)
            self.Tuya().gameObject.transform:GetComponent("Animation"):Play()
            self.VFXMask().gameObject.transform:GetComponent("Animation"):Play()
            
            if self.CanAcheReceiveCount <= 0 then
                self.Btn_UnReceive().gameObject:SetActive(true)
                self.Btn_Receive().gameObject:SetActive(false)
            else
                self.Btn_UnReceive().gameObject:SetActive(false)
                self.Btn_Receive().gameObject:SetActive(true)
            end
        end
    end)
    ---默认显示每日
    if SummerControl.curTaskType == nil then
        self.Daily01().isOn = false
        self.Daily01().isOn = true
        self.Ac01().isOn = false
    else
        if SummerControl.curTaskType == SummerControl.TaskType.daily then
            self.Daily01().isOn = false
            self.Daily01().isOn = true
            self.Ac01().isOn = false
        elseif SummerControl.curTaskType == SummerControl.TaskType.achievement then
            self.Daily01().isOn = true
            self.Ac01().isOn = false
            self.Ac01().isOn = true
        end
    end

    ---一键领取
    UIEvent.LuaClick(self.Btn_Receive().gameObject,function()
        ---如果是任务
        if self.isAchievement == false then
            if self.CanReceiveCount > 0 then
                ActivationTaskViewModel.TaskPerform(self.curTaskType,0,nil,self.curSubType,function()
                    self:ReloadTaskData()
                    self:RefreshRedPoint()
                    self.Btn_UnReceive().gameObject:SetActive(true)
                    self.Btn_Receive().gameObject:SetActive(false)
                end)
            end
        else
            if self.CanAcheReceiveCount > 0 then
                ---成就
                ActivationTaskViewModel.TaskPerform(0,0,nil,self.curSubType,function()
                    self:ReloadAcheData()
                    self:RefreshRedPoint()
                    self.Btn_UnReceive().gameObject:SetActive(true)
                    self.Btn_Receive().gameObject:SetActive(false)
                end)
            end
        end
    end)

    if SummerControl.curTaskType == SummerControl.TaskType.daily and self.CanReceiveCount <= 0 then
        self.Btn_UnReceive().gameObject:SetActive(true)
        self.Btn_Receive().gameObject:SetActive(false)
    elseif SummerControl.curTaskType == SummerControl.TaskType.achievement and self.CanAcheReceiveCount <= 0 then
        self.Btn_UnReceive().gameObject:SetActive(true)
        self.Btn_Receive().gameObject:SetActive(false)
    else
        self.Btn_UnReceive().gameObject:SetActive(false)
        self.Btn_Receive().gameObject:SetActive(true)
    end
end

function M:InitScroll()
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end

function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurTaskLoopList[idx],self})
end

---刷新任务滑动数据
function M:ReloadTaskData(offset)
    self.isAchievement = false
    self.CanReceiveCount = 0
    local tSummerData = SummerControl.GetSummerData()
    ---获取当前loop数据
    self.CurTaskLoopList = SummerControl.GetDailyTaskData()
    ---当前任务类型
    self.curTaskType = self.CurTaskLoopList[1].type
    ---当前组id
    self.curSubType = tSummerData.dayTaskId
    ---设置Loop数量
    self.TaskScroll01().totalCount = #self.CurTaskLoopList
    if offset then
        self.TaskScroll01():RefillCells(offset)
    else
        self.TaskScroll01():RefreshCells()
    end

end

---刷新成就滑动数据
function M:ReloadAcheData(offset)
    self.isAchievement = true
    self.CanAcheReceiveCount = 0
    local tSummerData = SummerControl.GetSummerData()
    ---获取当前loop数据
    self.CurTaskLoopList = SummerControl.GetTaskData()
    ---当前组id
    self.curSubType = tSummerData.taskId
    ---设置Loop数量
    self.TaskScroll01().totalCount = #self.CurTaskLoopList
    if offset then
        self.TaskScroll01():RefillCells(offset)
    else
        self.TaskScroll01():RefreshCells()
    end
end

---刷新红点
function M:RefreshRedPoint()
    SummerControl.CheckTaskRedPoint()
    for i, v in pairs(RedDotControl.GetDotData("SummerTask").childNodeData) do
        if v.name == "SummerDailyTask" then
            self.DailyRedDotIcon().gameObject:SetActive(v.State)
        elseif v.name == "SummerAchievement" then
            self.AcRedDotIcon().gameObject:SetActive(v.State)
        end
    end
end


function M:OnClose()
    Event.Go("SummerHome_UI_RefreshRedDoc")
    Event.Go("SummerLevels_UI_RefreshRedDoc")
end

return M