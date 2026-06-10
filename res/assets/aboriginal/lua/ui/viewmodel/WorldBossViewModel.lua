require("LocalData/JcscorerewardLocalData")
---物资筹备-世界BOSS VM
WorldBossViewModel = {}
---初始化
function WorldBossViewModel.Init()
    WorldBossViewModel.OpenWorldBossMainFormUI()
end

---销毁
function WorldBossViewModel.Close()
    MgrUI.GoBack()
end

-----------跳转--------------------
---打开UI
function WorldBossViewModel.OpenWorldBossMainFormUI()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("stormviewmodel_tips4"),1},true)
end

---检查红点
function WorldBossViewModel.CheckRedPoint()
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.LIANHETAOFA) then
        return false
    end

    local key = PlayerControl.GetPlayerData().UID .. "WorldBoss_UI"
    local count = TaskControl.CheckLHTFVigor()  ---今天获得的挑战次数
    if UnityEngine.PlayerPrefs.HasKey(key) then
        local arr = string.split(UnityEngine.PlayerPrefs.GetString(key),"_")  ---1时间戳 2当天获得的挑战次数
        if Global.CheckIsSameDay(tonumber(arr[1]),Global.GetCurTime()) then
            ---如果是同一天则判断获得的挑战次数是否有变化
            if count ~= tonumber(arr[2]) then
                local tData = EventRaidControl.GetLIANHETAOFAData()
                ---判断是不是在战斗时间内
                if tData then
                    if Global.isMiddleTime(tData.beginTime,tData.battleEndTime) then
                        ---战斗时间内当天次数有变化 显示红点
                        return true
                    end
                end
            else
                if WorldBossViewModel.CheckLHTFReward() then
                    return WorldBossViewModel.CheckLHTFReward()
                else
                    ---当天次数无变化 不显示红点
                    return false
                end
            end
        else
            ---不是同一天红点
            local tData = EventRaidControl.GetLIANHETAOFAData()
            ---判断是不是在战斗时间内
            if tData then
                if Global.isMiddleTime(tData.beginTime,tData.battleEndTime) then
                    return true
                end
            end
        end
    else
        ---本地无记录显示红点
        UnityEngine.PlayerPrefs.SetString(key,tostring(Global.GetCurTime()).."_"..count)
        return true
    end
end

function WorldBossViewModel.CheckLHTFReward()
    ---联合讨伐积分奖励检查
    local GotReward = RapidJson.decode(ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.LIANHETAOFA).reward)
    local rewardList = JcscorerewardLocalData.tab
    if GotReward ~= nil then
        for i,v in pairs(rewardList) do
            if StormViewModel.SelfRankInfo.totalScore >= v.score and GotReward[tostring(i)] == nil then
                return true
            end
        end
        return false
    else
        if rewardList[1].score > StormViewModel.SelfRankInfo.totalScore then
            return false
        end
        return true
    end
end

---刷新红点
function WorldBossViewModel.RefreshRedPoint(_changeCount)
    local key = PlayerControl.GetPlayerData().UID .. "WorldBoss_UI"
    local arr = string.split(UnityEngine.PlayerPrefs.GetString(key),"_")  ---1时间戳 2当天获得的挑战次数
    local count = TaskControl.CheckLHTFVigor()  ---今天获得的挑战次数
    if Global.CheckIsSameDay(tonumber(arr[1]),Global.GetCurTime()) == false then
        ---如果本地记录的时间和当前服务器时间不为同一天则记录当前时间
        UnityEngine.PlayerPrefs.SetString(key,tostring(Global.GetCurTime()).."_"..count)
    elseif _changeCount and _changeCount ~= tonumber(arr[2]) then
        UnityEngine.PlayerPrefs.SetString(key,arr[1].."_".._changeCount)
    end
end

return WorldBossViewModel