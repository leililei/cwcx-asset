-- Code Auto Create Begin
local M = Class('Achievement_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Achievement_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Achievement_UI].prefab'
    self.Name = 'Form[Achievement_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','ani/Img_BG',2},{'Img_Fenggexian','ani/UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','ani/UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','ani/UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','ani/UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_GoMenu','ani/UpperLeftPanel/Btn_ReturnBg/Btn_GoMenu',2},{'Btn_UnAllReceive','ani/RightPanel/Btn_UnAllReceive',2},{'Img_OCReceivedi2','ani/RightPanel/Btn_UnAllReceive/Img_OCReceivedi2',2},{'Btn_AllReceive','ani/RightPanel/Btn_AllReceive',2},{'Img_OCReceivedi1','ani/RightPanel/Btn_AllReceive/Img_OCReceivedi1',2},{'bg','ani/RightPanel/AchievementProgress/bg',2},{'ProgressExp','ani/RightPanel/AchievementProgress/ProgressExp',2},{'bg01','ani/RightPanel/AchievementProgress/bg',2},{'Img_Xian','ani/RightPanel/Img_Xian',2},{'Img_Di','ani/RightPanel/Img_Di',2},{'ScrollbarVertical','ani/RightPanel/VFXMask/TaskScroll/ScrollbarVertical',2},{'Handle','ani/RightPanel/VFXMask/TaskScroll/ScrollbarVertical/SlidingArea/Handle',2},{'TaskContent','ani/RightPanel/VFXMask/TaskScroll/TaskContent',2},{'SwitchPanel','ani/SwitchPanel',2},{'Img_Qieyexian','ani/SwitchPanel/Img_Qieyexian',2},{'SwitchAll','ani/SwitchPanel/SwitchScroll/Content/SwitchAll',2},{'Btn_Switch','ani/SwitchPanel/SwitchScroll/Content/SwitchAll/Btn_Switch',2},{'Img_Qieyedian','ani/SwitchPanel/SwitchScroll/Content/SwitchAll/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','ani/SwitchPanel/SwitchScroll/Content/SwitchAll/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','ani/SwitchPanel/SwitchScroll/Content/SwitchAll/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'AllRedDotIcon','ani/SwitchPanel/SwitchScroll/Content/SwitchAll/AllRedDotIcon',2},{'SwitchCombat','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat',2},{'Btn_Switch01','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat/Btn_Switch',2},{'Img_Qieyedian01','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight01','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat/Btn_SwitchHighLight',2},{'Img_Qieyedian_H01','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'CombatRedDotIcon','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat/CombatRedDotIcon',2},{'SwitchCollect','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect',2},{'Btn_Switch02','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect/Btn_Switch',2},{'Img_Qieyedian02','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight02','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect/Btn_SwitchHighLight',2},{'Img_Qieyedian_H02','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'CollectionRedDotIcon','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect/CollectionRedDotIcon',2},{'SwitchDevelop','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop',2},{'Btn_Switch03','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop/Btn_Switch',2},{'Img_Qieyedian03','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight03','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop/Btn_SwitchHighLight',2},{'Img_Qieyedian_H03','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'DevelopRedDotIcon','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop/DevelopRedDotIcon',2},{'SwitchConsumtion','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion',2},{'Btn_Switch04','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion/Btn_Switch',2},{'Img_Qieyedian04','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight04','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion/Btn_SwitchHighLight',2},{'Img_Qieyedian_H04','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'ConsumtionRedDotIcon','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion/ConsumtionRedDotIcon',2},
        -- UITemplate 列表
        {'AchievementItem','ani/RightPanel/VFXMask/TaskScroll/AchievementItem',10},
        -- Toggle 列表
        {'SwitchAll01','ani/SwitchPanel/SwitchScroll/Content/SwitchAll',13},{'SwitchCombat01','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat',13},{'SwitchCollect01','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect',13},{'SwitchDevelop01','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop',13},{'SwitchConsumtion01','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion',13},
        -- RawImage 列表
        {'TaskScroll','ani/RightPanel/VFXMask/TaskScroll',15},{'SwitchScroll','ani/SwitchPanel/SwitchScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','ani/RightPanel/VFXMask/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Achievement_CN','ani/UpperLeftPanel/Text_Achievement/Text_Achievement_CN',20},{'Text_Achievement_EN','ani/UpperLeftPanel/Text_Achievement/Text_Achievement_EN',20},{'Text_OCReceive2','ani/RightPanel/Btn_UnAllReceive/Text_OCReceive2',20},{'Text_OCReceive1','ani/RightPanel/Btn_AllReceive/Text_OCReceive1',20},{'Text_Percentage','ani/RightPanel/AchievementProgress/Text_Percentage',20},{'Text_AchievementCount','ani/RightPanel/AchievementProgress/bg/Text_AchievementCount',20},{'CNText','ani/SwitchPanel/SwitchScroll/Content/SwitchAll/Btn_Switch/CNText',20},{'CNText01','ani/SwitchPanel/SwitchScroll/Content/SwitchAll/Btn_SwitchHighLight/CNText',20},{'CNText02','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat/Btn_Switch/CNText',20},{'CNText03','ani/SwitchPanel/SwitchScroll/Content/SwitchCombat/Btn_SwitchHighLight/CNText',20},{'CNText04','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect/Btn_Switch/CNText',20},{'CNText05','ani/SwitchPanel/SwitchScroll/Content/SwitchCollect/Btn_SwitchHighLight/CNText',20},{'CNText06','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop/Btn_Switch/CNText',20},{'CNText07','ani/SwitchPanel/SwitchScroll/Content/SwitchDevelop/Btn_SwitchHighLight/CNText',20},{'CNText08','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion/Btn_Switch/CNText',20},{'CNText09','ani/SwitchPanel/SwitchScroll/Content/SwitchConsumtion/Btn_SwitchHighLight/CNText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    AchievementViewModel.ReceivedCallBack = Handle(self,self.UpdataPanel)
    ---可领取任务数
    self.CanReceiveCount = 0
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化右侧按钮
    self:InitSwitch()
    ---初始化按钮
    self:InitButton()
    ---红点检查
    TaskControl.CheckDotReceived()
    self:CheckRedDot()
end

function M:OnBackShow()
    self:UpdataPanel()
end

function M:OnShowFinish()
    NoviceViewModel.CheckCurID(21502,function()
        NoviceViewModel.DoNext()
    end)
end

---更新页面信息
function M:UpdateInfo()
    local max = TaskControl.maxAchievement
    local curValue = TaskControl.completeAchievement
    self.ProgressExp().fillAmount = curValue/max
    self.Text_AchievementCount().text = MgrLanguageData.GetLanguageByKey("achievement_ui_achievement").."  <color=#FFDD42>"..curValue.."</color>/"..max
    self.Text_Percentage().text = math.floor(curValue/max*100).."%"
end
---初始化按钮
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --返回主界面
     UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function ()
        MgrUI.GoBackTo(UID.Home_UI)
     end)
    ---返回
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self,AchievementViewModel.Close))
    ---帮助按钮
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(77)
    end))
    ---一键领取
    UIEvent.LuaClick(self.Btn_AllReceive().gameObject, function()
        self.CanReceiveCount = 0
        AchievementViewModel.TaskPerform(0,0,nil,TaskControl.AchievementSystemType.Achieve)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end

function M:UpdataPanel()
    ---红点检查
    TaskControl.CheckDotReceived()
    self:CheckRedDot()
    self.CanReceiveCount = 0
    self:ReloadTaskData(0)
    ---更新页面信息
    self:UpdateInfo()
end

---注册滑块
function M:RegisterLoopScroll()
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
---左侧积分回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self})
end
---设置任务滑动数据
function M:ReloadTaskData(offset)
    ---获取当前loop数据
    ------@type AchievementTaskData[]
    self.CurLoopList = AchievementViewModel.GetTask(self.CurSortType,true)
    ---设置Loop数量
    self.TaskScroll01().totalCount = #self.CurLoopList
    if offset then
        self.TaskScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.TaskScroll01():RefreshCells()              ---只刷新数据
    end
end

---初始化左侧按钮
function M:InitSwitch()
    local toggles = {
        [1] = self.SwitchAll01(),
        [2] = self.SwitchCombat01(),
        [3] = self.SwitchCollect01(),
        [4] = self.SwitchDevelop01(),
        [5] = self.SwitchConsumtion01()
    }
    local ReloadInfo = {
        [1] = Handle(self, self.OnClickSwitchAll),
        [2] = Handle(self, self.OnClickSwitchCombat),
        [3] = Handle(self, self.OnClickSwitchCollect),
        [4] = Handle(self, self.OnClickSwitchDevelop),
        [5] = Handle(self, self.OnClickSwitchConsumtion)
    }
    for idx, toggle in pairs(toggles) do
        local normal,high = self.GetHighObj(toggle,"Btn_Switch","Btn_SwitchHighLight")
        high:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self:OnLeftToggleClick(...,normal,high, ReloadInfo[idx])
        end,nil)
    end
    self.SwitchAll01().isOn = false
    self.SwitchAll01().isOn = true
end

---获取高光组件
function M.GetHighObj(Obj,normalStr,highStr)
    return Obj.transform:Find(normalStr).gameObject, Obj.transform:Find(highStr).gameObject
end
---Toggle事件
function M:OnLeftToggleClick(isOn, normal, high,initFun)
    normal:SetActive(not isOn)
    high:SetActive(isOn)
    if isOn then
        initFun()
    end
end

---切换到全部
function M:OnClickSwitchAll()
    self.CurSortType = 0
    self.CanReceiveCount = 0
    self:ReloadTaskData(0)
    ---更新页面信息
    self:UpdateInfo()
end
---切换到战斗
function M:OnClickSwitchCombat()
    self.CurSortType = 1
    self.CanReceiveCount = 0
    self:ReloadTaskData(0)
    ---更新页面信息
    self:UpdateInfo()
end
---切换到搜集
function M:OnClickSwitchCollect()
    self.CurSortType = 2
    self.CanReceiveCount = 0
    self:ReloadTaskData(0)
    ---更新页面信息
    self:UpdateInfo()
end
---切换到养成
function M:OnClickSwitchDevelop()
    self.CurSortType = 4
    self.CanReceiveCount = 0
    self:ReloadTaskData(0)
    ---更新页面信息
    self:UpdateInfo()
end
---切换到消费
function M:OnClickSwitchConsumtion()
    self.CurSortType = 3
    self.CanReceiveCount = 0
    self:ReloadTaskData(0)
    ---更新页面信息
    self:UpdateInfo()
end
---红点检查
function M:CheckRedDot()
    if RedDotControl.GetDotData("AchieveTask").State then
        self.AllRedDotIcon().gameObject:SetActive(true)
    else
        self.AllRedDotIcon().gameObject:SetActive(false)
    end

    for i, v in pairs(RedDotControl.GetDotData("AchieveTask").childNodeData) do
        if v.name == "AchieveTask1" then
            if v.State then
                self.CombatRedDotIcon().gameObject:SetActive(true)
            else
                self.CombatRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "AchieveTask2" then
            if v.State then
                self.CollectionRedDotIcon().gameObject:SetActive(true)
            else
                self.CollectionRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "AchieveTask3" then
            if v.State then
                self.ConsumtionRedDotIcon().gameObject:SetActive(true)
            else
                self.ConsumtionRedDotIcon().gameObject:SetActive(false)
            end
        elseif v.name == "AchieveTask4" then
            if v.State then
                self.DevelopRedDotIcon().gameObject:SetActive(true)
            else
                self.DevelopRedDotIcon().gameObject:SetActive(false)
            end
        end
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    AchievementViewModel.ReceivedCallBack = nil
end

return M