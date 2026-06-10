---作战演习(Pvp) VM
ExerciseViewModel = {}

---初始化
function ExerciseViewModel.Init()
    require("JNUI/JNPVPData")
    ExerciseViewModel.OpenBattleUI()
end

---销毁
function ExerciseViewModel.Close()
    MgrUI.GoBack()
end

-----------跳转--------------------
---打开UI
function ExerciseViewModel.OpenBattleUI()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("exerciseviewmodel_tips1"),1},true)

    ---※※※※※※※※※※※※※待修改※※※※※※※※※※※※※※※※※※
    --MgrUI.Go(UID.Shop_UI, pData, true)
    --MgrUI.Pop(UID.FullLoading_UI,nil,true)
    --MgrTimer.AddDelayNoName(1,function ()
    --    JNPVPData.IsGoTowardsPVPMainForm = true
    --    BattleManager.FightType=1
    --    CJNBattleMgr.FightState=1
    --    BattleManager.IdRight={}
    --    CMgrCamera.Instance.FightCamera.gameObject:SetActive(true)
    --    CJNBattleMgr.Instance:SetBG("map_1_3",false)
    --    JNStrTool.CurBattleUIType=2
    --
    --    MgrUI.Go(UID.Battle02_UI)
    --end,nil)
end

return ExerciseViewModel