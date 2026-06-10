-- Code Auto Create Begin
local M = Class('ChaStormScrollItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ChaStormScrollItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Bottom','Panel/Img_Bottom',2},{'Img_Bottom2','Panel/Img_Bottom2',2},{'Img_Gaonandudi','Panel/Img_Gaonandudi',2},{'Img_Mask','Panel/Img_Mask',2},{'Panel_Lock','Panel/Panel_Lock',2},{'Img_Zhezhao(bai)','Panel/Panel_Lock/Img_Zhezhao(bai)',2},{'Img_Xian','Panel/Panel_Lock/Img_Xian',2},{'Img_Suo','Panel/Panel_Lock/Img_Suo',2},
        -- UITemplate 列表
        {'ChaStormScrollItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Name','Panel/Text_Name',20},{'Text_Rate','Panel/Text_Rate',20},{'Text_RateName','Panel/Text_RateName',20},{'Text_RateName2','Panel/Text_RateName2',20},{'Text_Cur','Panel/Text_Cur',20},{'Text_Lock','Panel/Panel_Lock/Text_Lock',20},
    }
end
-- Code Auto Create End
---挑战卷初始化
function M:OnInit()
    self.Panel_Lock().gameObject:SetActive(false)
    self.PanelObj = self.Panel().gameObject
    ---更新点击
    UIEvent.LuaClick(self.PanelObj,function()
        if self.isEmpty then
            return
        end
        local index = tonumber(self.ObjRoot.name) - 1
        if self.parent.curChaIndex + 2 == index then
            if self.pData.type2 == 20 then
                if not SysLockControl.CheckSysLock(1105) then
                    MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("chastormscrollitem_tips1"),SysLockControl.GetUnlockPoint(1105)),1},true)
                    return
                end
                ---强制引导
                if NoviceViewModel.CurTaskId == 21204 then
                    NoviceViewModel.DoNext(function()
                        ---进入红色巨塔ui
                        MgrUI.GoHide(UID.StormTower_UI)
                    end)
                else
                    ---进入红色巨塔ui
                    MgrUI.GoHide(UID.StormTower_UI)
                    StormViewModel.CurChallenge = StormViewModel.ChallengeType.tower
                end
            elseif self.pData.type2 == 21 then
                if not SysLockControl.CheckSysLock(1109) then
                    MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1109),1},true)
                    return
                end
                ---进入战术指导ui
                MgrUI.GoHide(UID.GuidePoint_UI)
                StormViewModel.CurChallenge = StormViewModel.ChallengeType.guide
            end
        else
            self.parent.LoopScrollGroup[3]:ScrollToCell(index - 2,3500)
        end
    end)
    --self.Img_Bottom = self.Img_Bottom()
    --self.Img_Bottom2 = self.Img_Bottom2()
    --self.Text_RateName = self.Text_RateName()
    --self.Text_RateName2 = self.Text_RateName2()
    --self.Text_Rate = self.Text_Rate()
end
---挑战卷刷新
function M:OnUpdateUI(pData)
    ---@type StormScrollData
    self.pData = pData[1]
    self.parent = pData[2]
    self.isEmpty = self.pData.id == nil
    self.PanelObj:SetActive(not self.isEmpty)
    if self.isEmpty then
        return
    end
    self.Img_Bottom().gameObject:SetActive(self.pData.type2 == 20)
    self.Img_Bottom2().gameObject:SetActive(self.pData.type2 == 21)
    self.Text_RateName().gameObject:SetActive(self.pData.type2 == 20)
    self.Text_RateName2().gameObject:SetActive(self.pData.type2 == 21)
    ---获取当前进度
    local curCom,maxCom = self.pData:GetChaCompletion()
    if self.pData.type2 == 20 then
        ---红巨
        local floor = curCom + 1
        if floor > maxCom  then floor = maxCom end
        self.Text_RateName().text = string.format(MgrLanguageData.GetLanguageByKey("chastormscrollitem_floor"),floor)
        if SysLockControl.CheckSysLock(1105) then
            self.Panel_Lock().gameObject:SetActive(false)
        else
            self.Panel_Lock().gameObject:SetActive(true)
        end
    elseif self.pData.type2 == 21 then
        ---战术指导
        if SysLockControl.CheckSysLock(1109) then
            self.Panel_Lock().gameObject:SetActive(false)
        else
            self.Panel_Lock().gameObject:SetActive(true)
        end
        self.Text_RateName2().text = string.format("TUTORIAL <size=35><color=#FF6E0E>%s</color></size>",curCom)
    end
    ---当前层达成进度
    self.Text_Rate().text = string.format("%.0f",(curCom/maxCom) * 100).."%"
end
return M