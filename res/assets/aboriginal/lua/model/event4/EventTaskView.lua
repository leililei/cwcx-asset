---外传活动主界面
EventTaskView = {}
local V_BaseUI = nil
local V_TaskScroll = nil
local V_DailyRedDotIcon = nil
local V_AcRedDotIcon = nil
local V_SpineRole = nil
local V_Btn_Lingqu = nil
local V_RoleVoiceWordText = nil
local V_Img_SoundTextBG = nil
local V_Img_Taskdi = nil

local CurActID = nil
local Event4Data = nil
local TaskGroup = nil
local StrType = "daily"
local curSubType = nil
local CurDotState = false
local SpineObj = nil
local GroupId = nil

function EventTaskView.Init(BaseUI, TaskScroll, DailyRedDotIcon, AcRedDotIcon, SpineRole, Btn_Lingqu, RoleVoiceWordText, Img_SoundTextBG, Img_Taskdi)
    V_BaseUI = BaseUI
    V_TaskScroll = TaskScroll
    V_DailyRedDotIcon = DailyRedDotIcon
    V_AcRedDotIcon = AcRedDotIcon
    V_SpineRole = SpineRole
    V_Btn_Lingqu = Btn_Lingqu
    V_RoleVoiceWordText = RoleVoiceWordText
    V_Img_SoundTextBG = Img_SoundTextBG
    V_Img_Taskdi = Img_Taskdi

    CurActID = Event4Control.GetCurActID()
    Event4Data = Event4Control.GetEvent4Data()[CurActID]
    curSubType = Event4Data.dayTaskId

    V_TaskScroll:SetLuaCellEvent(Handle(EventTaskView, EventTaskView.RefreshCell))
end

function EventTaskView.OnUpdateUI()
    --创建spine
    EventTaskView:CreatSpine(V_SpineRole)
end

function EventTaskView:RefreshCell(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ TaskGroup[idx], EventTaskView })
end

---刷新成就滑动数据
function EventTaskView:ReloaData(_strType)
    CurDotState = false
    if _strType then
        StrType = _strType
    end
    if StrType == "daily" then
        TaskGroup = Event4Control.GetDailyTaskData(CurActID)
        curSubType = Event4Data.dayTaskId

        CurDotState = RedDotControl.GetDotData("Event4DailyTask_" .. CurActID):GetCurDotState()
    else
        TaskGroup = Event4Control.GetTaskData(CurActID)
        curSubType = Event4Data.taskId

        CurDotState = RedDotControl.GetDotData("Event4Achievement_" .. CurActID):GetCurDotState()
    end
    V_TaskScroll.totalCount = #TaskGroup
    V_TaskScroll:RefillCells(0)
    ---一键领取按钮状态
    V_Btn_Lingqu.gameObject:SetActive(CurDotState)
end

---創建spine
function EventTaskView:CreatSpine(_Root)
    --销毁spine
    if SpineObj then
        GameObject.Destroy(SpineObj)
    end
    local spineID = Event4Data.npc[EventRaidControl.NpcType.Task]
    if spineID == nil then
        return
    end
    GroupId = spineID
    local _PosInfoTab = CharactercoordinatesLocalData.tab[GroupId].coordinate10
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])

    MgrRes.LoadWatch3DSpineInUI(_Root, GroupId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        SpineObj = obj
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(V_BaseUI.CavOrder + 1, "Default")
        end
    end)
    EventTaskView:GetCurWords(97)
end

---获取当前台词
function EventTaskView:GetCurWords(type)
    local _ActorLinesType = GroupId  --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == _ActorLinesType and value[3] == type then
            if value[5] == "0" then
                _CurTotalSumWeight = _CurTotalSumWeight + 10
                table.insert(_tempActorLineIdTab, { value[1], _CurTotalSumWeight })
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
    EventTaskView:PlayTargetRoleAniVoice(_FinalVoiceLineId)
end

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function EventTaskView:PlayTargetRoleAniVoice(_ActorLineId)
    if _ActorLineId == nil then
        return
    end
    local _AniName = ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _ActorLineWord = ActorLinesLocalData.tab[_ActorLineId][7]

    if SpineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(SpineObj, _AniName, true)
    end
    ---设置文本框文本
    V_RoleVoiceWordText.text = _ActorLineWord
    V_Img_SoundTextBG.gameObject:SetActive(true)

    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0, nil)
    EventTaskView:ListenVoice()
end

--- 监听语音是否结束
function EventTaskView:ListenVoice()
    MgrTimer.AddRepeat("Event4TaskRoleVoice", 0.2, function()
        if MgrSound.CheckRoleStatus(nil) then
            V_Img_SoundTextBG.gameObject:SetActive(false)
            MgrTimer.Cancel("Event4TaskRoleVoice")
        end
    end, -1, nil)
end
---刷新红点
function EventTaskView:RefreshRedPoint()
    Event4Control.CheckTaskRedPoint()
    ---每日任务
    local tCurDotState = RedDotControl.GetDotData("Event4DailyTask_" .. CurActID):GetCurDotState()
    V_DailyRedDotIcon.gameObject:SetActive(tCurDotState)
    ---成就
    tCurDotState = RedDotControl.GetDotData("Event4Achievement_" .. CurActID):GetCurDotState()
    V_AcRedDotIcon.gameObject:SetActive(tCurDotState)
end
---一键领取
function EventTaskView:AllReceive()
    if not CurDotState then
        return
    end
    local taskType = 0
    if StrType == "daily" then
        taskType = TaskGroup[1].type
    end
    ActivationTaskViewModel.TaskPerform(taskType, 0, nil, curSubType, function()
        EventTaskView:RefreshRedPoint()
        EventTaskView:ReloaData()
        ---语音
        EventTaskView:GetCurWords(98)
    end)
end
---界面切换
function EventTaskView:SwitchBtn(btn_daily, daily, btn_ac, ac)
    local tFirstBtn = 1
    if not Global.isMiddleTime(Event4Data.beginTime, Event4Data.battleEndTime) then
        tFirstBtn = 2
    end
    local TopBtns = {
        [1] = { btn = btn_daily, select = daily.gameObject.transform:Find("HighLight").gameObject, unSelect = daily.gameObject.transform:Find("Normal").gameObject, ImgBg = "Activity/SBTM/"..Event4Data.actType.."/Img_Taskdi1" },
        [2] = { btn = btn_ac, select = ac.gameObject.transform:Find("HighLight").gameObject, unSelect = ac.gameObject.transform:Find("Normal").gameObject, ImgBg = "Activity/SBTM/"..Event4Data.actType.."/Img_Taskdi2" },
    }
    for i = 1, #TopBtns do
        Tools.ToggleValueChange(TopBtns[i].btn, function(isOn)
            if tFirstBtn == 2 then
                if isOn and i == 1 then
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text4"), 1 }, true)
                end
                return
            end
            if isOn then
                TopBtns[i].select:SetActive(true)
                TopBtns[i].unSelect:SetActive(false)

                MgrRes.LoadSprite(V_Img_Taskdi, TopBtns[i].ImgBg)
                if i == 1 then
                    EventTaskView:ReloaData("daily")
                else
                    EventTaskView:ReloaData("achieve")
                end
            else
                TopBtns[i].select:SetActive(false)
                TopBtns[i].unSelect:SetActive(true)
            end
        end)
        if i == tFirstBtn then
            TopBtns[i].select:SetActive(true)
            TopBtns[i].unSelect:SetActive(false)

            MgrRes.LoadSprite(V_Img_Taskdi, TopBtns[i].ImgBg)
            if i == 1 then
                EventTaskView:ReloaData("daily")
            else
                EventTaskView:ReloaData("achieve")
            end
        else
            TopBtns[i].select:SetActive(false)
            TopBtns[i].unSelect:SetActive(true)
        end
    end
end
return EventTaskView