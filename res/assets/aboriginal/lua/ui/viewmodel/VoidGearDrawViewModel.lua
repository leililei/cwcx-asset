---装备补给VM
---此模块需优化,业务逻辑，数据逻辑等还没迁入
VoidGearDrawViewModel = {}

---当前抽奖类型
VoidGearDrawViewModel.CountType = 0

VoidGearDrawViewModel.EquipList = {}
---初始化
function VoidGearDrawViewModel.Init()
    VoidGearDrawViewModel.OpenVoidGearDrawUI()
end
---卸载共鸣装备抽奖
function VoidGearDrawViewModel.Close()
    MgrUI.GoBack()
end
-------------------------跳转UI------------------------------
---打开装备补给界面UI
function VoidGearDrawViewModel.OpenVoidGearDrawUI()
  --  MgrUI.Pop(UID.PopTip_UI,{"装备补给维护中",1},true)
    MgrUI.GoHide(UID.GearDraw_UI)
end
---打开装备补给奖励UI
function VoidGearDrawViewModel.OpenVoidGearDrawResultUI()
    MgrUI.GoClose(UID.GearDrawResult_UI)
end
---返回装备补给界面UI
function VoidGearDrawViewModel.BackToVoidGearDrawUI()
    MgrUI.GoClose(UID.GearDraw_UI)
end
-------------------------业务逻辑-----------------------------


return VoidGearDrawViewModel