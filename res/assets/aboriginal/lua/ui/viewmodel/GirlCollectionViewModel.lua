---妹子收藏 VM
GirlCollectionViewModel = {}

---初始化
function GirlCollectionViewModel.Init()
    GirlCollectionViewModel.OpenGirlCollectionUI()
end

---销毁
function GirlCollectionViewModel.Close()
    MgrUI.GoBack()
end

-----------跳转--------------------
---打开UI
function GirlCollectionViewModel.OpenGirlCollectionUI()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("girlcollectionviewmodel_tips1"),1},true)
    --MgrUI.Go(UID.Shop_UI)
    --JNRoleData.NextPanelID=1 ---待修改
    --MgrUI.Go(UID.GirlCollection_UI)
end

return GirlCollectionViewModel