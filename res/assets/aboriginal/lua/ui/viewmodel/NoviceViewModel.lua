NoviceViewModel = {}
NoviceViewModel.CurNoviceData = nil
NoviceViewModel.OpenCount = 0
---是否显示详情面板
NoviceViewModel.AllowShowInfo = false
---是否允许移动角色
NoviceViewModel.AllowMove = false
---新手战斗结束
NoviceViewModel.NoviceBattleEnd = false
---@type NoviceData[] 带条件的引导
NoviceViewModel.ForceGuideData = {}
NoviceViewModel.Noviceing = false

NoviceViewModel.cloneObj = nil
NoviceViewModel.EffectObj = nil

function NoviceViewModel.Init()
    MessageEvent.Add(EID.NoviceCheck,NoviceViewModel.Check)
end

---检测是否满足强制引导条件
function NoviceViewModel.CheckForce()
    ---获取最新的指导表
    NoviceViewModel.ForceGuideData = NoviceControl.GetForceGuides()
    ---如果是多条件
    for k,v in ipairs(NoviceViewModel.ForceGuideData) do
        if #v.condition > 1 then
            local LvLimit = false
            local LevelLimit = false
            for i,data in pairs(v.condition) do
                local str = string.split(data,"_")
                if str[1] == "2" and PlayerControl.GetPlayerData().level >= tonumber(str[2]) then
                    LvLimit = true
                end
                if str[1] == "3" and StormControl.CheckPointPass(tonumber(str[2])) then
                    LevelLimit = true
                end
            end
            if LvLimit and LevelLimit then
                if v.isDone == false and v.isTrigger == false then
                    return v.id
                else
                    ---判断第一步是否带末尾标记
                    ---如果完成了 判断下一组引导是否完成
                    local data = NoviceControl.GetNoviceDataByID(NoviceControl.GetNoviceNextID(v.id))
                    if NoviceControl.GroupsIsTrigger(data.group) == false and v.endSign ==1 then
                        return NoviceControl.GetNoviceNextID(v.id)
                    end
                end
            end
        ---如果是单条件
        else
            local str = string.split(v.condition[1],"_")
            if str[1] == "2" then
                if PlayerControl.GetPlayerData().level >= tonumber(str[2]) then
                    if v.isDone == false and v.isTrigger == false then
                        return v.id
                    else
                        ---判断第一步是否带末尾标记
                        ---如果完成了 判断下一组引导是否完成
                        local data = NoviceControl.GetNoviceDataByID(NoviceControl.GetNoviceNextID(v.id))
                        if data then
                            if NoviceControl.GroupsIsTrigger(data.group) == false and v.endSign ==1 then
                                return NoviceControl.GetNoviceNextID(v.id)
                            end
                        end
                    end
                end
            end
            if str[1] == "3" then
                if StormControl.CheckPointPass(tonumber(str[2])) then
                    if v.isDone == false and v.isTrigger == false then
                        return v.id
                    else
                        ---如果完成了 判断下一组引导是否完成
                        local data = NoviceControl.GetNoviceDataByID(NoviceControl.GetNoviceNextID(v.id))
                        if data then
                            if NoviceControl.GroupsIsTrigger(data.group) == false and v.endSign ==1 then
                                return NoviceControl.GetNoviceNextID(v.id)
                            end
                        end
                    end
                end
            end
        end
    end
    return nil
end

---检查首次进入引导是否完成
function NoviceViewModel.CheckFirstGuide(groupNum)
    ---如果新手指导未完成
    if not NoviceControl.GroupsIsTrigger(tonumber(SteamLocalData.tab[120001][2])) then
        return
    end
    if groupNum == 40 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30001)
        return
    elseif groupNum == 41 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30101)
        return
    elseif groupNum == 42 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30201)
        return
    elseif groupNum == 43 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30301)
        return
    elseif groupNum == 44 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30401)
        return
    elseif groupNum == 45 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30501)
        return
    elseif groupNum == 46 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30601)
        return
    elseif groupNum == 47 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30701)
        return
    elseif groupNum == 48 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30801)
        return
    elseif groupNum == 49 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(30901)
        return
    elseif groupNum == 50 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31001)
        return
    elseif groupNum == 51 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31101)
        return
    elseif groupNum == 52 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31201)
        return
    elseif groupNum == 53 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31301)
        return
    elseif groupNum == 54 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31401)
        return
    elseif groupNum == 55 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31501)
        return
    elseif groupNum == 56 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31601)
        return
    elseif groupNum == 57 and not NoviceControl.GroupsIsTrigger(groupNum)then
        NoviceViewModel.Check(31701)
        return
    elseif groupNum == 120 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(31801)
        return
    elseif groupNum == 155 and not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(32101)
        return
    elseif groupNum == 154 and  not NoviceControl.GroupsIsTrigger(groupNum) then
        NoviceViewModel.Check(32001)
        return
    end
end

function NoviceViewModel.ForceGuide(id,cell)
    if id == nil then
        if cell then
            cell()
        end
        return
    end
    NoviceViewModel.txt = ""
    if id == 20001 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text2") --角色强化
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 20101 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text3") --"\"资源副本\"已解锁,即将返回主界面开启教程。"
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 20201 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text4") --"\"技能强化\"已解锁,即将返回主界面开启教程。"
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 20301 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text5") --图鉴
        NoviceViewModel.SetHomeSwitchState(false)
    elseif id == 20401 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text6") --共鸣装备
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 20901 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text7") --指挥室
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 20701 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text8") --机甲核心
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 20801 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text9") --困难关
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 21901 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text10") --活动
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 21001 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text11") --演习
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 21101 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text12") --联合讨伐
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 21201 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text13") --红色巨塔
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 21301 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text1") --新晋者
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 21401 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text14") --通行证
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 21501 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text15") --成就
        NoviceViewModel.SetHomeSwitchState(false)
    elseif id == 21601 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text16") --好友
        NoviceViewModel.SetHomeSwitchState(false)
    elseif id == 21701 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text17") --战术指导
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 52401 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text18")
        NoviceViewModel.SetHomeSwitchState(true)
    elseif id == 22001 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text19")
    elseif id == 22101 then
        NoviceViewModel.txt = MgrLanguageData.GetLanguageByKey("ui_xinshouyindao_text19")
    else
        NoviceViewModel.txt = ""
    end
    if NoviceViewModel.txt ~= "" and id ~= nil then
        ---正在进行引导
        NoviceViewModel.Noviceing = true
        ---关闭奖励弹窗
        MgrUI.PopHide(UID.ItemAchievePop_UI)
        MgrTimer.AddDelayNoName(0, function()
            MgrUI.Pop(UID.NoviceForce_UI,{NoviceViewModel.txt,id},true)
        end)
    else
        if cell then
            cell()
        end
    end
end

---获取物体
function NoviceViewModel.GetObj(pathName)
    local obj = nil
    if pathName ~= 0 or pathName ~= nil then
        obj = GameObject.Find(pathName)
    end
    return obj
end

---克隆需要点击的按钮及事件
function NoviceViewModel.CloneObj(obj,eventStr,isMain,effectName,root,effectScale)
    local clone = nil
    if isMain then
        clone = GameObject.Instantiate(obj,root,false)
    else
        clone = GameObject.Instantiate(obj,root,true)
    end
    local tog = clone:GetComponent("Toggle")
    if tog then
        GameObject.DestroyImmediate(tog)
    end
    local Handler = clone:GetComponent("ButtonHandler")
    if Handler then
        GameObject.DestroyImmediate(Handler)
    end
    if effectName then
        MgrRes.GetPrefab("ABOriginal/VFX/Prefab/UI_Prefab/"..effectName..".prefab",function(effectObj)
            if effectObj == nil then
                print("<color=red>此处创建预制失败请检查</color>")
                return
            end
            effectObj.transform:SetParent(clone.transform)
            if isMain then
                effectObj.transform.localPosition =Vector3.zero
                effectObj.transform:SetParent(root,true)
                effectObj.transform.localRotation = Quaternion(0,0,0,0)
                if effectScale ~= nil and effectScale ~= "0" then
                    local str = string.split(effectScale,",")
                    effectObj.transform.localScale = Vector3(tonumber(str[1]),tonumber(str[2]),tonumber(str[3]))
                else
                    effectObj.transform.localScale =Vector3.one
                end
            else
                effectObj.transform.localPosition =Vector3.zero
                effectObj.transform.localScale =Vector3.one
            end
            clone:SetActive(true)
            NoviceViewModel.EffectObj = effectObj
            NoviceViewModel.cloneObj = clone
            UIEvent.LuaClick(clone,function()
                Event.Go(eventStr)
            end)
        end)
    end
end

function NoviceViewModel.CreateEffect(effectName,root,effectScale)
    local Go = nil
    MgrRes.GetPrefab("ABOriginal/VFX/Prefab/UI_Prefab/"..effectName..".prefab",function(effectObj)
        if effectObj == nil then
            print("<color=red>此处创建预制失败请检查</color>")
            return
        end
        effectObj.transform:SetParent(root.transform)
        effectObj.transform.localPosition =Vector3.zero
        if effectScale ~= nil and effectScale ~= "0" then
            local str = string.split(effectScale,",")
            effectObj.transform.localScale = Vector3(tonumber(str[1]),tonumber(str[2]),tonumber(str[3]))
        else
            effectObj.transform.localScale =Vector3.one
        end
        Go = effectObj
    end)
    return Go
end

function NoviceViewModel.Clone(obj,root,eventStr)
    local cloneObj = GameObject.Instantiate(obj,root,true)
    UIEvent.LuaClick(cloneObj.gameObject,function()
        GameObject.Destroy(cloneObj.gameObject)
        if eventStr ~= 0 or eventStr ~= nil then
            Event.Go(eventStr)
        end
    end)
    return cloneObj
end

---设置主界面切换状态
function NoviceViewModel.SetHomeSwitchState(state)
    if state == nil then
        NoviceViewModel.SwitchState = nil
    else
        NoviceViewModel.SwitchState = state
    end
end

---获取主界面按钮是否要换页 true换到左页false换的右页
function NoviceViewModel.GetHomeSwitchState()
    return NoviceViewModel.SwitchState
end

---执行下一步引导
function NoviceViewModel.DoNext(callBack)
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
        if callBack then
            callBack()
        end
    end)
    MessageEvent.Go(EID.NoviceCheck)
end
---如果id相同，不推送id直接执行下一步
function NoviceViewModel.GoCheck(id)
    if NoviceViewModel.CurTaskId == id then
        MessageEvent.Go(EID.NoviceCheck)
    end
end
---检查当前ID是否相同
function NoviceViewModel.CheckCurID(id,callBack)
    if NoviceViewModel.CurTaskId == id then
        if  callBack then
            callBack()
        end
        return true
    end
    return false
end

---检查是否是自由活动
function NoviceViewModel.CheckWhetherFreeTime()
    if NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId).group == 127 then
        return true
    end
    return false
end

---执行最后一步
function NoviceViewModel.DoEnd()
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
        MgrUI.PopHide(UID.NoviceFrame_UI)
        UnityEngine.DebugEx.LogError("引导结束，关闭引导界面"..NoviceViewModel.CurTaskId)
    end)
end

---传入指导id和角色id获取是否当前有角色操作
function NoviceViewModel.GetWhetherCurStep(id,roleId)
    if id == 50305 and tonumber(roleId) == 10013 then
        return true
    elseif id == 50306 and tonumber(roleId) == 10013 then
        return true
    elseif id == 50523 and tonumber(roleId) == 90001 then
        return true
    elseif id == 50711 then
        return true
    elseif id == 50811 and tonumber(roleId) == 11017 then
        return true
    elseif id == 50812 and tonumber(roleId) == 11017 then
        return true
    elseif id == 50813 and tonumber(roleId) == 10013 then
        return true
    elseif id == 50814 and tonumber(roleId) == 10013 then
        return true
    end
    return false
end

---检查当前引导
---@param id number 引导id
---@param function 引导回调
function NoviceViewModel.Check(id)
    ---@type NoviceData
    local data = nil
    if id then
        data = NoviceControl.GetCurNovice(id)
    else
        data = NoviceControl.GetCurNovice()
    end
    ---当前没有引导
    if data == nil then
        MgrUI.PopHide(UID.NoviceFrame_UI)
        NoviceViewModel.Noviceing = false
        return
    end
    NoviceViewModel.Noviceing = true
    NoviceViewModel.CurNoviceData = data
    NoviceViewModel.CurTaskId = data.id
    UnityEngine.DebugEx.LogError("当前的ID是"..data.id)
    if data.type == 5 then
        MgrUI.Pop(UID.NoviceFrame_UI,{NoviceViewModel.CurTaskId},true)
    else
        print("Novice_"..data.id)
        NoviceViewModel["Novice_"..data.id](data)
    end
end

---新手引导
------------------------------------强制引导--------------------------------------
function NoviceViewModel.Novice_20001(data)
    MgrUI.PopHide(UID.NoviceForce_UI)
    ---发送请求 获取道具
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20002(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20003(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20003(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20004(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20005(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20006(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id,nil,true},true)
    Event.Go("RoleCloseScroll")
end

function NoviceViewModel.Novice_20007(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("RoleOpenScroll")
end

function NoviceViewModel.Novice_20008(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20009(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20010(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20011(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20012(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20013(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20014(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20015(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20016(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20101(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20102(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20103(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20201(data)
    MgrUI.PopHide(UID.NoviceForce_UI)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20202(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20203(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id,nil,true},true)
    Event.Go("RoleCloseScroll")
end

function NoviceViewModel.Novice_20204(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("RoleOpenScroll")
end

function NoviceViewModel.Novice_20205(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20206(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20207(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20208(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20209(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20210(data)
    Event.Go("NoviceCloseSuccessPanel")
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20211(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20212(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20213(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20214(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20215(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20301(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20302(data)
    NoviceViewModel.SetHomeSwitchState(false)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20303(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20401(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20402(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20403(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20404(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id,nil,true},true)
end

function NoviceViewModel.Novice_20405(data)
    MgrUI.PopHide(UID.NoviceFrame_UI)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20406(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20407(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20408(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20409(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20410(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20411(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20412(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20413(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20414(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20415(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20416(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20601(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20602(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20603(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20604(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20605(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20606(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20607(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20608(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20609(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20610(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20611(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20612(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20613(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20701(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20702(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20703(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20704(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20705(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20706(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20707(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20708(data)
    MgrUI.ClosePop(UID.CoreChipSynPop_UI,nil,function()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    end)
end

function NoviceViewModel.Novice_20709(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20710(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20711(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20712(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20713(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20714(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("RoleCoreCloseScroll")
end

function NoviceViewModel.Novice_20715(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("RoleCoreOpenScroll")
end

function NoviceViewModel.Novice_20716(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20717(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20718(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20719(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20720(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20721(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20722(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20723(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20724(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20725(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20801(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20802(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20803(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("CloseScroll")
end

function NoviceViewModel.Novice_20804(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("OpenScroll")
end

function NoviceViewModel.Novice_20805(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_20806(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21001(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21002(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21101(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21102(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21103(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id,nil,true},true)
end

function NoviceViewModel.Novice_21201(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21202(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21203(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("ChaCloseScroll")
end

function NoviceViewModel.Novice_21204(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("ChaOpenScroll")
end

function NoviceViewModel.Novice_21301(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21302(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21303(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21304(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21305(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21306(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21307(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21308(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21401(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21402(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21403(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21404(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21405(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21501(data)
    NoviceViewModel.SetHomeSwitchState(false)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21502(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21503(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21504(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21601(data)
    NoviceViewModel.SetHomeSwitchState(false)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21602(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21603(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21604(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21605(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21606(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21607(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21608(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21609(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21610(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21611(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21612(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21613(data)
    MgrUI.GoBackTo(UID.Home_UI, function()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    end)
end

function NoviceViewModel.Novice_21614(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21615(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21616(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21617(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21618(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21619(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21620(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21621(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21622(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21623(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21624(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21625(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21626(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21627(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21628(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21629(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21701(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21702(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21703(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21704(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21801(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21901(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21902(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21903(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21904(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_21905(data)
    MgrUI.ClosePop(UID.NoviceFrame_UI)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            NoviceViewModel.Check()
        end)
    end,false)
end

function NoviceViewModel.Novice_22001(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22002(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22003(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22004(data)
    MgrUI.ClosePop(UID.NoviceFrame_UI)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
        NoviceViewModel.Check()
        MgrUI.GoHide(UID.BackRub_UI)
    end,false)
end

function NoviceViewModel.Novice_22101(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22102(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22103(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22104(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22105(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22106(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22107(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22108(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22109(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22110(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22111(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22112(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22113(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22114(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22115(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_22116(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52401(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52402(data)
    NoviceViewModel.SetHomeSwitchState(true)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52403(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52404(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52405(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52406(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52407(data)

end

function NoviceViewModel.Novice_52408(data)

end

function NoviceViewModel.Novice_52409(data)
    MgrUI.GoBackTo(UID.Home_UI,function()
        NoviceViewModel.DoNext()
    end)
end

function NoviceViewModel.Novice_52410(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52411(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52412(data)
    MgrUI.Pop(UID.StoreReviewPop_UI,nil,true)
    NoviceViewModel.DoNext()
end

-------------------------------首次进入的引导-------------------------------

function NoviceViewModel.Novice_30001(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30002(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30003(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30004(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30101(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30102(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30103(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30104(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30105(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30106(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30201(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30202(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30203(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30204(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30205(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30206(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30301(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30302(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30303(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30304(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30305(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30401(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30402(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30403(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30404(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30405(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30406(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30407(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30501(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30502(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30503(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30504(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30505(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30506(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30507(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30601(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30602(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30603(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30604(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30605(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30701(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30702(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30703(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30704(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30705(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30706(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30707(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30801(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30802(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30803(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30804(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30805(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30901(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30902(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30903(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_30904(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31001(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31002(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31003(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31004(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31005(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31006(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31007(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31101(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31102(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31103(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31104(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31105(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31106(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31107(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31108(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31201(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31202(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31203(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31204(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31205(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31206(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31301(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31302(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31303(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31304(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31305(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31401(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31402(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31403(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31404(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31405(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31406(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31407(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31408(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31409(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31410(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31501(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31501(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31502(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31503(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31504(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31505(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31601(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31602(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31603(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31604(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31605(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31606(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31607(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31701(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31702(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31703(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31704(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31801(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31802(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31803(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31804(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31805(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31901(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31902(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31903(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31904(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31905(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31906(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_31907(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_32101(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_32001(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

--新手引导第一关
function NoviceViewModel.Novice_50001(data)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            NoviceViewModel.Check()
        end)
    end,false,false,true)
end

function NoviceViewModel.Novice_50002(data)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            NoviceViewModel.Check()
        end)
    end,false,false,true)
end

function NoviceViewModel.Novice_50101(data)
    StormViewModel.CurPointType = 4
    MgrBattle.GoFight(MgrBattle.fightType.novice, function()
        NoviceViewModel.HideBossBtn()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    end,StormViewModel.CurPointData.battleMap)
end

function NoviceViewModel.Novice_50102(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50103(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50104(data)
    ---显示角色栏
    NoviceViewModel.ShowRoleBar()
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50105(data)
    ---刷新背包
    NoviceViewModel.RefreshRole()
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    ---角色摆错位置返回上一阶段
    Event.Clear("refreshItem")
    Event.Add("refreshItem",function ()
        NoviceControl.PushSingleData(50105,false)
        NoviceViewModel.Check(50105)
    end)
    Event.Go("Novice50105")
end

function NoviceViewModel.Novice_50106(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("Novice50106")
end

function NoviceViewModel.Novice_50107(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50108(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50109(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50110(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50111(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50112(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50113(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50114(data)
    ---关闭角色栏
    NoviceViewModel.RestoreRoleBar()
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50115(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50116(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50117(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("HighlightAllRole")
end

function NoviceViewModel.Novice_50118(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("HighlightAllRole")
end

function NoviceViewModel.Novice_50119(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50120(data)
    ---取消暂停 继续战斗
    CJNBattleMgr.Instance.IsPause = false
    ---关闭引导界面
    MgrUI.ClosePop(UID.NoviceFrame_UI)
end

function NoviceViewModel.Novice_50121(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50122(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("HighlightAllRole")
end

function NoviceViewModel.Novice_50123(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("CloseAllRole")
end

function NoviceViewModel.Novice_50124(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50125(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50126(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50127(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50128(data)
    ---取消暂停 继续战斗
    CJNBattleMgr.Instance.IsPause = false
    ---关闭引导界面
    MgrUI.ClosePop(UID.NoviceFrame_UI)
end

function NoviceViewModel.Novice_50129(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50130(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50131(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50132(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50133(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50134(data)
    ---取消暂停 继续战斗
    CJNBattleMgr.Instance.IsPause = false
    ---关闭引导界面
    MgrUI.ClosePop(UID.NoviceFrame_UI)
    ---完成本引导
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
end

function NoviceViewModel.Novice_50135(data)
    ---第一关弹出结算
    MgrUI.Pop(UID.NoviceComplete_UI,{1000000},true)
end

function NoviceViewModel.Novice_50136(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end
--新手引导第一关结束

--新手引导第二关
function NoviceViewModel.Novice_50201(data)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            NoviceViewModel.Check()
        end)
    end,false,false,true)
end

function NoviceViewModel.Novice_50301(data)
    StormViewModel.CurPointType = 4
    MgrBattle.GoFight(MgrBattle.fightType.novice, function()
        NoviceViewModel.HideBossBtn()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    end,StormViewModel.CurPointData.battleMap)
end

function NoviceViewModel.Novice_50302(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50303(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50304(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50305(data)
    NoviceViewModel.AllowMove = true
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("Novice50305")
end

function NoviceViewModel.Novice_50306(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("Novice50306")
end

function NoviceViewModel.Novice_50307(data)
    NoviceViewModel.AllowMove = false
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50308(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50309(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50310(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50311(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50312(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50313(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50314(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50315(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50316(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50317(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50318(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50319(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50320(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50321(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50322(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50323(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50324(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50325(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50326(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50327(data)
    ---取消暂停 继续战斗
    CJNBattleMgr.Instance.IsPause = false
    ---关闭引导界面
    MgrUI.ClosePop(UID.NoviceFrame_UI)
end

function NoviceViewModel.Novice_50328(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50329(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50330(data)
    ---取消暂停 继续战斗
    CJNBattleMgr.Instance.IsPause = false
    ---关闭引导界面
    MgrUI.ClosePop(UID.NoviceFrame_UI)
    ---完成本引导
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
end

function NoviceViewModel.Novice_50331(data)
    ---第二关弹出结算
    MgrUI.Pop(UID.NoviceComplete_UI,{1000001},true)
end
--新手引导第二关结束


--新手引导第三关
function NoviceViewModel.Novice_50401(data)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            NoviceViewModel.Check()
        end)
    end,false,false,true)
end

function NoviceViewModel.Novice_50501(data)
    StormViewModel.CurPointType = 4
    MgrBattle.GoFight(MgrBattle.fightType.novice, function()
        NoviceViewModel.HideBossBtn()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    end,StormViewModel.CurPointData.battleMap)
end

function NoviceViewModel.Novice_50502(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50503(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50504(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50505(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50506(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50507(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50508(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50509(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50510(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50511(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50512(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50513(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50514(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50515(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50516(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50517(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50518(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50519(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("Novice50519")
end

function NoviceViewModel.Novice_50520(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50521(data)
    NoviceViewModel.HideBossBtn()
    NoviceViewModel.ShowReady()
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50522(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50523(data)
    NoviceViewModel.AllowMove = true
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("Novice50523")
end

function NoviceViewModel.Novice_50524(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50525(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50526(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50527(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50528(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50529(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50530(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50531(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50532(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50533(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50534(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50535(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50536(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50537(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50538(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50539(data)
    ---取消暂停 继续战斗
    CJNBattleMgr.Instance.IsPause = false
    ---关闭引导界面
    MgrUI.ClosePop(UID.NoviceFrame_UI)
    ---完成本引导
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
end

function NoviceViewModel.Novice_50540(data)
    ---第三关弹出结算
    MgrUI.Pop(UID.NoviceComplete_UI,{1000002},true)
end
--新手引导第三关结束


--新手引导第四关
function NoviceViewModel.Novice_50601(data)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            NoviceViewModel.Check()
        end)
    end,false,false,true)
end

function NoviceViewModel.Novice_50701(data)
    StormViewModel.CurPointType = 4
    MgrBattle.GoFight(MgrBattle.fightType.novice, function()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    end,StormViewModel.CurPointData.battleMap)
end

function NoviceViewModel.Novice_50702(data)
    NoviceViewModel.AllowMove = false
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50703(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50704(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50705(data)
    NoviceViewModel.ShowReady()
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50706(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50707(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50708(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50709(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50714(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50715(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50710(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50711(data)
    NoviceViewModel.AllowMove = true
    NoviceViewModel.NoviceBattleEnd = true
    ---关闭引导界面
    MgrUI.ClosePop(UID.NoviceFrame_UI)
    ---完成本引导
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
end

function NoviceViewModel.Novice_50712(data)
    NoviceViewModel.AllowMove = false
    ---第三关胜利弹出结算
    MgrUI.Pop(UID.NoviceComplete_UI,{1000003},true)
end

function NoviceViewModel.Novice_50713(data)
    NoviceViewModel.AllowMove = false
    ---第三关失败弹出结算
    MgrUI.Pop(UID.NoviceComplete_UI,{1000003},true)
end

function NoviceViewModel.Novice_50801(data)
    StormViewModel.CurPointType = 4
    MgrBattle.GoFight(MgrBattle.fightType.novice, function()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    end,StormViewModel.CurPointData.battleMap)
end

function NoviceViewModel.Novice_50802(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50803(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50804(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50805(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50806(data)
    NoviceViewModel.ShowReady()
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50807(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50808(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50809(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50810(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50811(data)
    NoviceViewModel.AllowMove = true
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50812(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50813(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50814(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50815(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50816(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50817(data)

    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_50818(data)
    ---第四关失败弹出结算
    MgrUI.Pop(UID.NoviceComplete_UI,{1000003},true)
end

function NoviceViewModel.Novice_50901(data)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            if NoviceControl.GetNoviceState(51001) then
                MgrBattle.CloseFight()
            else
                NoviceViewModel.Check(51001)
            end
        end)
    end,false,false,true)
end

function NoviceViewModel.Novice_51001(data)
    ---打开新手取名界面
    MgrUI.GoFirst(UID.NoviceRename_UI)
end

function NoviceViewModel.Novice_51101(data)
    PlotViewModel.OpenPlotUI(data.plotName, function()
        MgrTimer.AddDelayNoName(1,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
            if NoviceControl.GetNoviceState(51201) then
                MgrBattle.CloseFight()
            else
                NoviceViewModel.Check(51201)
            end
        end)
    end,false,false,true)
end

function NoviceViewModel.Novice_51201(data)
    MgrBattle.CloseFight(true,function()
        MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
        ---上报飞游角色数据
        HomeViewModel.ForSdkData()
        MgrUI.GoFirst(UID.Home_UI)
        ---进入聊天室
        GuildControl.JoinChat()
    end)
end

function NoviceViewModel.Novice_51202(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51203(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51204(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("CloseScroll")
end

function NoviceViewModel.Novice_51205(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
    Event.Go("OpenScroll")
end

function NoviceViewModel.Novice_51206(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51207(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51208(data)
    NoviceViewModel.NoviceBattleEnd = false
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

--教学关
function NoviceViewModel.Novice_51301(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51302(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51303(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51304(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51305(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51306(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51307(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51308(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51309(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51401(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51402(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51403(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51404(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51405(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51406(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51407(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51501(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51502(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51503(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51504(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51505(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51506(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51507(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51508(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51509(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51601(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51602(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51603(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51604(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51605(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51606(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51607(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51608(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51609(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51701(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51702(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51703(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51704(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51705(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51706(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51707(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51708(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51709(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51801(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51802(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51803(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51804(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51805(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51806(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51807(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51808(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51809(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51810(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51901(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51902(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51903(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51904(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51905(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51906(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_51907(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52001(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52002(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52003(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52004(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52005(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52006(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52007(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52101(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52102(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52103(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52104(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52105(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52106(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52107(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52108(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52201(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52202(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52203(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52204(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52205(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52206(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52207(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52208(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52209(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52301(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52302(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52303(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52304(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52305(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52306(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52307(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52308(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

function NoviceViewModel.Novice_52309(data)
    MgrUI.Pop(UID.NoviceFrame_UI,{data.id},true)
end

--教学关结束

---提交
function NoviceViewModel.SaveNoviceDrawProgress(id)
    print("更新引导节点!"..id)
    local BaseREQ  =
    {
        progress = id
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientNewRecruitGetREQ',BaseREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_NEW_RECRUIT_GET_REQ,bytes,0,nil, NoviceViewModel.SaveNoviceDrawProgressACK,NoviceViewModel.SaveNoviceDrawProgressNTF)
end
---提交新手抽奖
function NoviceViewModel.SaveNoviceDrawProgressACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientNewRecruitGetACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("noviceviewmodel_tips14"),2},true)
    end
end
function NoviceViewModel.SaveNoviceDrawProgressNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientNewRecruitGetNTF',buffer))
    print("获取了引导节点"..tab.progress)
    ---消耗
    if tab.cost then
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.consume)
    end
    ---添加英雄
    for i, v in pairs(tab.heros) do
        if v.goods then
            ItemControl.PushGroupItemData(v.goods,ItemControl.PushEnum.add)
        else
            HeroControl.PushSingleHeroData(v.hero)
        end
    end
    ---记录统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ---执行下一步
    NoviceViewModel.DoNext()
end

function NoviceViewModel.Clear()
    NoviceViewModel.CurNoviceData = nil
    NoviceViewModel.OpenCount = 0
    NoviceViewModel.AllowShowInfo = false
    NoviceViewModel.AllowMove = false
    NoviceViewModel.NoviceBattleEnd = false
    NoviceViewModel.LevelGuideData = {}
    NoviceViewModel.ProgressGuideData = {}
    NoviceViewModel.Noviceing = false
end

return NoviceViewModel