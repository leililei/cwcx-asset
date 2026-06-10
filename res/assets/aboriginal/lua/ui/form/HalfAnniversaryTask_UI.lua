-- Code Auto Create Begin
local M = Class('HalfAnniversaryTask_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryTask_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryTask_UI].prefab'
    self.Name = 'Form[HalfAnniversaryTask_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Img_Taskdi','RightPanel/Img_Taskdi',2},{'Type','RightPanel/Type',2},{'Daily','RightPanel/Type/Daily',2},{'Normal','RightPanel/Type/Daily/Normal',2},{'NormalIcon','RightPanel/Type/Daily/Normal/NormalIcon',2},{'HighLight','RightPanel/Type/Daily/HighLight',2},{'NormalIcon01','RightPanel/Type/Daily/HighLight/NormalIcon',2},{'DailyRedDotIcon','RightPanel/Type/Daily/DailyRedDotIcon',2},{'Ac','RightPanel/Type/Ac',2},{'Normal01','RightPanel/Type/Ac/Normal',2},{'NormalIcon02','RightPanel/Type/Ac/Normal/NormalIcon',2},{'HighLight01','RightPanel/Type/Ac/HighLight',2},{'NormalIcon03','RightPanel/Type/Ac/HighLight/NormalIcon',2},{'AcRedDotIcon','RightPanel/Type/Ac/AcRedDotIcon',2},{'TaskContent','RightPanel/TaskScroll/TaskContent',2},{'Btn_Lingqu','RightPanel/Btn_Lingqu',2},{'Img_HuicheIcon','RightPanel/Btn_Lingqu/Img_HuicheIcon',2},{'Role','Role',2},{'SpineRole','Role/SpineRole',2},{'RoleClickArea','Role/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','Role/Img_SoundTextBG',2},{'UpperLightPanel','UpperLightPanel',2},{'Btn_GoMenu','UpperLightPanel/Btn_GoMenu',2},{'Btn_Back','UpperLightPanel/Btn_Back',2},{'Img_Fenggexian','UpperLightPanel/Img_Fenggexian',2},{'Btn_Help','UpperLightPanel/Btn_Help',2},
        -- UITemplate 列表
        {'HalfAnniversaryTaskItem','RightPanel/TaskScroll/HalfAnniversaryTaskItem',10},
        -- Toggle 列表
        {'Daily01','RightPanel/Type/Daily',13},{'Ac01','RightPanel/Type/Ac',13},
        -- RawImage 列表
        {'TaskScroll','RightPanel/TaskScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','RightPanel/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Daily','RightPanel/Type/Daily/Normal/Text_Daily',20},{'Text_Daily01','RightPanel/Type/Daily/HighLight/Text_Daily',20},{'Text_Daily02','RightPanel/Type/Ac/Normal/Text_Daily',20},{'Text_Daily03','RightPanel/Type/Ac/HighLight/Text_Daily',20},{'Text_Lingqu','RightPanel/Btn_Lingqu/Text_Lingqu',20},{'RoleVoiceWordText','Role/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_Title_CN','UpperLightPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLightPanel/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TaskGroup = nil
    self.StrType = "daily"
    self.ActiveData = HalfAnniControl.GetData()
    ---当前组id
    self.curSubType = self.ActiveData.dayTaskId
    self.CurDotState = false
    self.SpineObj = nil

    self.TaskScroll01():SetLuaCellEvent(Handle(self, self.RefreshCell))
    self:InitBtn()
    self:RefreshRedPoint()
end

function M:OnUpdateUI()
    --创建spine
    self:CreatSpine(self.SpineRole())
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
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---一键领取
    UIEvent.LuaClick(self.Btn_Lingqu().gameObject,function()
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
            ---语音
            self:GetCurWords(98)
        end)
    end)
    --点击角色播放语音
    UIEvent.LuaClick(self.RoleClickArea().gameObject,Handle(self,function()
        self:GetCurWords(97)
    end))

    local tFirstBtn = 1
    if not Global.isMiddleTime(self.ActiveData.beginTime,self.ActiveData.battleEndTime) then
        tFirstBtn = 2
    end
    local TopBtns = {
        [1] = { btn = self.Daily01(), select = self.Daily().gameObject.transform:Find("HighLight").gameObject, unSelect = self.Daily().gameObject.transform:Find("Normal").gameObject,ImgBg = "Activity/SBTM/Img_Taskdi1" },
        [2] = { btn = self.Ac01(), select = self.Ac().gameObject.transform:Find("HighLight").gameObject, unSelect = self.Ac().gameObject.transform:Find("Normal").gameObject,ImgBg = "Activity/SBTM/Img_Taskdi2" },
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

                --MgrRes.LoadSprite(self.Img_Taskdi(), TopBtns[i].ImgBg)
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

            --MgrRes.LoadSprite(self.Img_Taskdi(), TopBtns[i].ImgBg)
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
        self.TaskGroup = HalfAnniControl.GetDailyTaskData()
        self.curSubType = self.ActiveData.dayTaskId

        self.CurDotState = RedDotControl.GetDotData("HalfAnniversaryDailyTask"):GetCurDotState()
    else
        self.TaskGroup = HalfAnniControl.GetTaskData()
        self.curSubType = self.ActiveData.taskId

        self.CurDotState = RedDotControl.GetDotData("HalfAnniversaryAchievement"):GetCurDotState()
    end
    self.TaskScroll01().totalCount = #self.TaskGroup
    self.TaskScroll01():RefillCells(0)
    ---一键领取按钮状态
    self.Btn_Lingqu().gameObject:SetActive(self.CurDotState)
end

---創建spine
function M:CreatSpine(_Root)
    --销毁spine
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
    end
    local spineID = self.ActiveData.npc[EventRaidControl.NpcType.Task]
    if spineID == nil then
        return
    end
    self.groupId = spineID
    local _PosInfoTab = CharactercoordinatesLocalData.tab[self.groupId].coordinate10
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    --MgrRes.LoadWatchAuto(_Root, self.groupId,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), "idle", function(obj)
    --    self.SpineObj = obj
    --end)
    MgrRes.LoadWatch3DSpineInUI(_Root, self.groupId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        self.SpineObj = obj
        obj.transform.gameObject.layer = 5
    end)
    self:GetCurWords(97)
end

---获取当前台词
function M:GetCurWords(type)
    local _ActorLinesType = self.groupId  --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == _ActorLinesType and value[3] == type then
            if value[5] == "0" then
                _CurTotalSumWeight = _CurTotalSumWeight + 10
                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
            else
                ---切割对应的触发条件得到条件表
                local _TempVarTab = JNStrTool.strSplit("_", value[5])
                local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab, 0)
                if _ReturnVar ~= false then
                    _CurTotalSumWeight = _CurTotalSumWeight + (tonumber(_ReturnVar) * 1000)
                    table.insert(_tempActorLineIdTab, { value[1], _CurTotalSumWeight })
                end
            end
        end
    end
    local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight, _tempActorLineIdTab)
    self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
end

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function M:PlayTargetRoleAniVoice(_ActorLineId)
    if _ActorLineId == nil then
        return
    end
    local _AniName = ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _ActorLineWord = ActorLinesLocalData.tab[_ActorLineId][7]

    if self.SpineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj, _AniName, true)
    end
    ---设置文本框文本
    self.RoleVoiceWordText().text = _ActorLineWord
    self.Img_SoundTextBG().gameObject:SetActive(true)

    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,tostring(self.groupId))
    self:ListenVoice()
end

--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("TaskRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(self.groupId)) then
            self.Img_SoundTextBG().gameObject:SetActive(false)
            MgrTimer.Cancel("TaskRoleVoice")
        end
    end,-1,nil)
end
---刷新红点
function M:RefreshRedPoint()
    HalfAnniControl.CheckTaskRedPoint()
    ---每日任务
    local tCurDotState = RedDotControl.GetDotData("HalfAnniversaryDailyTask"):GetCurDotState()
    self.DailyRedDotIcon().gameObject:SetActive(tCurDotState)
    ---成就
    tCurDotState = RedDotControl.GetDotData("HalfAnniversaryAchievement"):GetCurDotState()
    self.AcRedDotIcon().gameObject:SetActive(tCurDotState)
end

function M:OnHide()
    MgrTimer.Cancel("TaskRoleVoice")
    MgrSound.Stop(3, tostring(self.groupId), false)
end
function M:OnClose()
    MgrTimer.Cancel("TaskRoleVoice")
    MgrSound.Stop(3, tostring(self.groupId), false)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M