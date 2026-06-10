---------社群VM
---待修复接口功能及整合业务逻辑
PlayerAchievementViewModel = {}
--------------初始化---------------------
function PlayerAchievementViewModel.Init()
    require("JNUI/JNAchievementTaskData") --------此脚本待整合后删除
    PlayerAchievementViewModel.OpenPlayerAchievementUI()
end

function PlayerAchievementViewModel.Close()
    MgrUI.GoBack()
    package.loaded["JNUI/JNAchievementTaskData"] = nil
end

------------------UI跳转--------------------
function PlayerAchievementViewModel.OpenPlayerAchievementUI()
    MgrUI.Pop(UID.PopTip_UI,{"playerachievementviewmodel_tips1",1},true)
    --MgrUI.Go(UID.PlayerAchievement_UI)
end

------------------业务逻辑--------------------
return PlayerAchievementViewModel