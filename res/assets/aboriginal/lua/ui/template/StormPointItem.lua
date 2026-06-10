-- Code Auto Create Begin
local M = Class('StormPointItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/StormPointItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_Panel','UI_Panel',2},{'nHard','UI_Panel/Normal/nHard',2},{'nOrd','UI_Panel/Normal/nOrd',2},{'tiao(huang)','UI_Panel/Normal/nPointInfo/tiao(huang)',2},{'Img_Tiaojiand2i','UI_Panel/Normal/nPointInfo/Img_Tiaojiand2i',2},{'Panel_nUnLock','UI_Panel/Normal/nPointInfo/Panel_nUnLock',2},{'Img_Jiaobiao','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Img_Jiaobiao',2},{'Img_nStar_1','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_1',2},{'Highlight','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_1/Highlight',2},{'Img_nStar_2','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_2',2},{'Highlight01','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_2/Highlight',2},{'Img_nStar_3','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_3',2},{'Highlight02','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_3/Highlight',2},{'Panel_nLock','UI_Panel/Normal/nPointInfo/Panel_nLock',2},{'hHard','UI_Panel/Highlight/hHard',2},{'hOrd','UI_Panel/Highlight/hOrd',2},{'tiao(huang)01','UI_Panel/Highlight/hPointInfo/tiao(huang)',2},{'Img_Tiaojiand2i01','UI_Panel/Highlight/hPointInfo/Img_Tiaojiand2i',2},{'Img_hStar_1','UI_Panel/Highlight/hPointInfo/Panel_hStars/Img_hStar_1',2},{'Highlight03','UI_Panel/Highlight/hPointInfo/Panel_hStars/Img_hStar_1/Highlight',2},{'Img_hStar_2','UI_Panel/Highlight/hPointInfo/Panel_hStars/Img_hStar_2',2},{'Highlight04','UI_Panel/Highlight/hPointInfo/Panel_hStars/Img_hStar_2/Highlight',2},{'Img_hStar_3','UI_Panel/Highlight/hPointInfo/Panel_hStars/Img_hStar_3',2},{'Highlight05','UI_Panel/Highlight/hPointInfo/Panel_hStars/Img_hStar_3/Highlight',2},{'Img_Jiaobiao01','UI_Panel/Highlight/hPointInfo/Img_Jiaobiao',2},{'Btn_Lock','UI_Panel/Btn_Lock',2},
        -- UITemplate 列表
        {'StormPointItem','/',10},
        -- Toggle 列表
        {'StormPointItem01','/',13},
        -- RawImage 列表
        {'StormPointItem02','/',15},{'Panel_nStars','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Panel_nStars',15},{'Panel_hStars','UI_Panel/Highlight/hPointInfo/Panel_hStars',15},
        -- TextMeshProUGUI 列表
        {'Text_nhName','UI_Panel/Normal/nHard/Text_nhName',20},{'Text_noName','UI_Panel/Normal/nOrd/Text_noName',20},{'Text_nIndex','UI_Panel/Normal/nPointInfo/Text_nIndex',20},{'Text','UI_Panel/Normal/nPointInfo/Panel_nUnLock/Img_Jiaobiao/Text',20},{'Text_hhName','UI_Panel/Highlight/hHard/Text_hhName',20},{'Text_hoName','UI_Panel/Highlight/hOrd/Text_hoName',20},{'Text_hIndex','UI_Panel/Highlight/hPointInfo/Text_hIndex',20},{'Text01','UI_Panel/Highlight/hPointInfo/Img_Jiaobiao/Text',20},
    }
end
-- Code Auto Create End
---关卡初始化
function M:OnInit()
    self.nm = self.UI_Panel().transform:Find("Normal").gameObject
    self.nmHard = self.nHard().gameObject
    self.nmOrd = self.nOrd().gameObject

    self.hl = self.UI_Panel().transform:Find("Highlight").gameObject
    self.hlHard = self.hHard().gameObject
    self.hlOrd = self.hOrd().gameObject

    self.nStars = {
        [1] = self.Img_nStar_1().transform:Find("Highlight").gameObject,
        [2] = self.Img_nStar_2().transform:Find("Highlight").gameObject,
        [3] = self.Img_nStar_3().transform:Find("Highlight").gameObject,
    }
    self.hStars = {
        [1] = self.Img_hStar_1().transform:Find("Highlight").gameObject,
        [2] = self.Img_hStar_2().transform:Find("Highlight").gameObject,
        [3] = self.Img_hStar_3().transform:Find("Highlight").gameObject,
    }

    self.nmHard:SetActive(false)
    self.hlHard:SetActive(false)
end

function M:OnUpdateUI(pData)
    ---@type StormPointData 关卡刷新
    self.pData = pData[1]
    self.parent = pData[2]
    if self.pData.id == nil then
        self.ObjRoot:SetActive(false)
        return
    end
    self.ObjRoot:SetActive(true)

    ---检查状态
    --print("当前关卡"..StormViewModel.CurPointData.id)
    --UnityEngine.Debug.LogError("当前Update"..self.pData.id)

    local isSelect = StormViewModel.CurPointData.id == self.pData.id
    --if StormControl.CheckPointLock(self.pData.id) then
    --    StormViewModel.CurPointData = self.pData
    --    isSelect = true
    --else
    --    isSelect = false
    --end
    local tog = self.StormPointItem01()
    self.nm:SetActive(not isSelect)
    self.hl:SetActive(isSelect)
    if isSelect then
        tog.isOn = true
    end
    ---解锁功能
    self.pointLock = StormControl.CheckPointLock(self.pData.id)
    self.Panel_nUnLock().gameObject:SetActive(self.pointLock)
    self.Panel_nLock().gameObject:SetActive(not self.pointLock)
    --self.isPlot().gameObject:SetActive(self.pData:CheckIsPlot())
    self.Text_nIndex().text = self.pData.index < 10 and "0"..self.pData.index or self.pData.index
    if self.pointLock then
        local isBattle = self.pData:CheckIsBattle()
        self.Img_Jiaobiao().gameObject:SetActive(not isBattle)
        self.Panel_nStars().gameObject:SetActive(isBattle)

        self.Img_Jiaobiao01().gameObject:SetActive(not isBattle)
        self.Panel_hStars().gameObject:SetActive(isBattle)
        if isBattle then
            local s1,s2,s3 = self.pData:CheckStar()
            local csArr = {
                [1] = s1,
                [2] = s2,
                [3] = s3,
            }
            for i = 1, #self.nStars do
                self.nStars[i]:SetActive(csArr[i])
                self.hStars[i]:SetActive(csArr[i])
            end
        end

        self.Text_noName().text = self.pData.idxName.." "..self.pData.name

        self.Text_hoName().text = self.pData.idxName.." "..self.pData.name
        self.Text_hIndex().text = self.pData.index < 10 and "0"..self.pData.index or self.pData.index
        tog.group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup")
        Tools.ToggleValueChange(tog,function(isOn)
            if not self.UI_Panel().gameObject.activeInHierarchy then
                return
            end
            self.isOn = isOn
            self.nm:SetActive(not isOn)
            self.hl:SetActive(isOn)
            if isOn then
                StormViewModel.CurPointData = self.pData
                self.parent:UpdateResPointInfo()
            end
        end,nil)
        self.Btn_Lock().gameObject:SetActive(false)
    else
        self.Text_noName().text = self.pData.idxName..MgrLanguageData.GetLanguageByKey("skillbookitem_lock")
        self.Text_hoName().text = self.pData.idxName..MgrLanguageData.GetLanguageByKey("skillbookitem_lock")
        Tools.RemoveToggleListeners(tog)
        tog.group = nil
        self.Btn_Lock().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Btn_Lock().gameObject,function()
            ---如果等级满足
            if PlayerControl.GetPlayerData().level < tonumber(self.pData.unlocks[0]) then
                if self.pData.unlocks[0] then
                    MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("stormviewmodel_tips5"),tonumber(self.pData.unlocks[0]) ), 1 }, true)
                end
            else
                for index = 1, #self.pData.fronts do
                    if not StormControl.CheckPointPass(self.pData.fronts[index]) then
                        if StormControl.GetStormPointByID(self.pData.fronts[index]).scrollType == 0 then
                            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("syslockcontrol_tips3"),"",StormControl.GetStormPointByID(self.pData.fronts[index]).idxName), 1 }, true)
                        else
                            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("stormviewmodel_tips6"),StormControl.GetStormPointByID(self.pData.fronts[index]).idxName), 1 }, true)
                        end
                        break
                    end
                end
            end
        end)
    end
end

return M