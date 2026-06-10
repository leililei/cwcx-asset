---角色切换VM
BusinessCardViewModel = {}

---初始化
function BusinessCardViewModel.Init()
    --require("JNUI/JNPVPData")
    --require("ReadData/ReadData")
    BusinessCardViewModel.OpenBusinessCardUI()
end

---销毁
function BusinessCardViewModel.Close()
    MgrUI.GoBack()
end

-----------跳转--------------------
---打开UI
function BusinessCardViewModel.OpenBusinessCardUI()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("businesscardviewmodel_tips1"),1},true)
    --MgrUI.Go(UID.BusinessCard_UI)
end

return BusinessCardViewModel