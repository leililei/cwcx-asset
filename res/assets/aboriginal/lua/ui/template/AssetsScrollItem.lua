-- Code Auto Create Begin
local M = Class('AssetsScrollItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/AssetsScrollItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Normal','Normal',2},{'Highlight','Highlight',2},{'Img_Icon','Img_Icon',2},{'Img_Icon2','Img_Icon2',2},{'Img_Kaifangshijiandi','Img_Kaifangshijiandi',2},
        -- UITemplate 列表
        {'AssetsScrollItem','/',10},
        -- Toggle 列表
        {'AssetsScrollItem01','/',13},
        -- RawImage 列表
        {'AssetsScrollItem02','/',15},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},{'Text_Time','Img_Kaifangshijiandi/Text_Time',20},
    }
end
-- Code Auto Create End
---资源卷初始化
function M:OnInit()
    self.toggle = self.AssetsScrollItem01()
    Tools.ToggleValueChange(self.toggle,function(isOn)
        self.Normal().gameObject:SetActive(not isOn)
        self.Highlight().gameObject:SetActive(isOn)
        if isOn then
            ---刷新资源关卡
            if StormViewModel.CurScrollData ~= self.pData and MgrLink.IsLink == false then
                StormViewModel.CurScrollData = self.pData
                StormViewModel.curChooseRes = self.pData
                StormViewModel.CurPointData = nil
            end
            if StormViewModel.CurScrollData.id == 600000 then
                NoviceViewModel.CheckFirstGuide(47)
            elseif StormViewModel.CurScrollData.id == 600001 then
                NoviceViewModel.CheckFirstGuide(46)
            elseif StormViewModel.CurScrollData.type2 == 12 then
                NoviceViewModel.CheckFirstGuide(48)
            elseif StormViewModel.CurScrollData.type2 == 13 then
                NoviceViewModel.CheckFirstGuide(49)
            end
            self.parent:ReloadResPointView(true)
            ---更新当前已选关卡属性
            self.parent:UpdateResPointInfo()
            self.parent:MapMove(StormViewModel.CurPointData.mapX,StormViewModel.CurPointData.mapY,0.5)
            self.parent:RefreshTabIndex()
        end
    end,nil)
    self.toggle.group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup")
    self.cg = self.ObjRoot:GetComponent("CanvasGroup")
    self.Normal().gameObject:SetActive(not self.toggle.isOn)
    self.Highlight().gameObject:SetActive(self.toggle.isOn)
end
---资源卷更新
function M:OnUpdateUI(pData)
    ---@type StormScrollData 关卡刷新
    self.pData = pData[1]
    self.parent = pData[2]
    ---如果当前选择的资源关是空
    if StormViewModel.curChooseRes == nil then
        --打开界面默认选怎第一个
        if self.pData.index == 1 then
            self.toggle.isOn = true
            self.Normal().gameObject:SetActive(not self.toggle.isOn)
            self.Highlight().gameObject:SetActive(self.toggle.isOn)
        else
            self.toggle.isOn = false
            self.Normal().gameObject:SetActive(not self.toggle.isOn)
            self.Highlight().gameObject:SetActive(self.toggle.isOn)
        end
    else
        ---选中最后一次选中的资源关
        if self.pData == StormViewModel.curChooseRes then
            self.toggle.isOn = true
            self.Normal().gameObject:SetActive(not self.toggle.isOn)
            self.Highlight().gameObject:SetActive(self.toggle.isOn)
        else
            self.toggle.isOn = false
            self.Normal().gameObject:SetActive(not self.toggle.isOn)
            self.Highlight().gameObject:SetActive(self.toggle.isOn)
        end
    end

  
    if StormControl.CheckScrollLock(self.pData.id) then
        self.cg.alpha = 1
        self.toggle.enabled = true
    else
        self.cg.alpha = 0.5
        self.toggle.enabled = false
        Tools.RemoveToggleListeners(self.toggle)
    end
    --self.toggle.isOn = StormViewModel.CurScrollData.id == self.pData.id
    self.Text_Name().text = self.pData.alias
    ---图标
    if self.pData.type2 == 10 then
        ---资源副本 经验、盾币、星碎
        MgrRes.LoadSprite(self.Img_Icon(),"Attribute/"..self.pData.pickIcon,nil)
        self.Img_Icon2().gameObject:SetActive(false)
    elseif self.pData.type2 == 12 then
        ---核心副本 1生命2攻击3防御4暴击5暴伤
        MgrRes.LoadSprite(self.Img_Icon(),"Attribute/"..self.pData.pickIcon,nil)
        self.Img_Icon2().gameObject:SetActive(false)
    elseif self.pData.type2 == 13 then
        ---觉醒副本
        MgrRes.LoadSprite(self.Img_Icon2(),"Attribute/"..self.pData.pickIcon,nil)
        self.Img_Icon().gameObject:SetActive(false)
    elseif self.pData.type2 == 0 then
        ---周本副本
        MgrRes.LoadSprite(self.Img_Icon2(),"Attribute/"..self.pData.pickIcon,nil)
        self.Img_Icon().gameObject:SetActive(false)
    end
    ---开放时间文本
    local lockStr = ""
    local pointData = StormControl.GetStormPointByID(self.pData.points[1])
    for type, v in pairs(pointData.unlocks) do
        if type == 0 then
            local pLevel = PlayerControl.GetPlayerLevel()
            if pLevel < v then
                self.Text_Time().text = MgrLanguageData.GetLanguageByKey("assetsscrollitem_tips1")..v.."</color>"
                break
            end
        elseif type == 1 then
            local config = TimeControl.GetTimeTable(v)
            if pointData ~= nil and config ~= nil then
                if config.timeType == 0 or config.timeType == 1 then
                    local weekStr = string.split(config.openWeek,",")
                    for i, v in pairs(weekStr) do
                        if v == "1" then
                            lockStr = lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_one")
                        elseif v == "2" then
                            lockStr = lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_tow")
                        elseif v == "3" then
                            lockStr = lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_three")
                        elseif v == "4" then
                            lockStr = lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_four")
                        elseif v == "5" then
                            lockStr = lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_five")
                        elseif v == "6" then
                            lockStr = lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_six")
                        elseif v == "7" then
                            lockStr = lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_seven")
                        end
                    end
                    self.Text_Time().text = lockStr ~= "" and MgrLanguageData.GetLanguageByKey("assetsscrollitem_week")..lockStr..MgrLanguageData.GetLanguageByKey("assetsscrollitem_open") or MgrLanguageData.GetLanguageByKey("assetsscrollitem_waitforopen")
                elseif config.timeType == 2 then
                    local timeStr = string.split(config.openTime)
                    local isBegin = tonumber(MgrNet.GetServerTime()) < tonumber(os.time({year=timeStr[1], month = timeStr[2], day = timeStr[3], hour = timeStr[4], min = timeStr[5], sec = timeStr[6]}))
                    local timeStr2 = string.split(config.endTime)
                    local isEnd = tonumber(MgrNet.GetServerTime()) > tonumber(os.time({year=timeStr2[1], month = timeStr2[2], day = timeStr2[3], hour = timeStr2[4], min = timeStr2[5], sec = timeStr2[6]}))
                    if not isBegin then
                        ---还未开始
                        self.Text_Time().text = "<color=#E94C6D>"..timeStr[3]..MgrLanguageData.GetLanguageByKey("assetsscrollitem_day")..timeStr[4]..MgrLanguageData.GetLanguageByKey("assetsscrollitem_opentip")
                    elseif isBegin and not isEnd then
                        ---开启还未结束
                        self.Text_Time().text = "<color=#E94C6D>"..timeStr2[3]..MgrLanguageData.GetLanguageByKey("assetsscrollitem_day")..timeStr2[4]..MgrLanguageData.GetLanguageByKey("assetsscrollitem_endtip")
                    else
                        ---活动已结束
                        self.Text_Time().text = MgrLanguageData.GetLanguageByKey("assetsscrollitem_tips2")
                    end
                elseif config.timeType == 999 then
                    self.Text_Time().text = MgrLanguageData.GetLanguageByKey("assetsscrollitem_tips3")
                end
            end
        end
    end
end
return M