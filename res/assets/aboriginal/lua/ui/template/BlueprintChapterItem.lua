-- Code Auto Create Begin
local M = Class('BlueprintChapterItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BlueprintChapterItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Normal','Normal',2},{'Highlight','Highlight',2},{'Img_Icon','Img_Icon',2},{'Img_Icon2','Img_Icon2',2},{'Img_Kaifangshijiandi','Img_Kaifangshijiandi',2},
        -- UITemplate 列表
        {'BlueprintChapterItem','/',10},
        -- Toggle 列表
        {'BlueprintChapterItem01','/',13},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},{'Text_Time','Img_Kaifangshijiandi/Text_Time',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Tools.ToggleValueChange(self.BlueprintChapterItem01(), Handle(self, self.OnToggleClicked), nil);
    self.BlueprintChapterItem01().group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup");
end
function M:OnClose()
end
function M:OnUpdateUI(pData)
    self.m_data = pData[1];
    if StormViewModel.curChooseRes == nil then
        --打开界面默认选怎第一个
        if self.m_data.index == 1 then
            self.BlueprintChapterItem01().isOn = true;
        else
            self.BlueprintChapterItem01().isOn = false;
        end
    else
        ---选中最后一次选中的资源关
        if self.m_data.id == StormViewModel.curChooseRes.id then
            self.BlueprintChapterItem01().isOn = true;
        else
            self.BlueprintChapterItem01().isOn = false;
        end
    end
    self.Normal().gameObject:SetActive(not self.BlueprintChapterItem01().isOn);
    self.Highlight().gameObject:SetActive(self.BlueprintChapterItem01().isOn);
    if StormControl.CheckScrollLock(self.m_data.id) then
        --self.cg.alpha = 1
        self.BlueprintChapterItem01().enabled = true
    else
        --self.cg.alpha = 0.5
        self.BlueprintChapterItem01().enabled = false
        Tools.RemoveToggleListeners(self.BlueprintChapterItem01());
    end
    self.Text_Name().text = self.m_data.alias
    ---图标
    if self.m_data.type2 == 14 then
        ---觉醒副本
        MgrRes.LoadSprite(self.Img_Icon2(),"Attribute/"..self.m_data.pickIcon,nil)
        self.Img_Icon().gameObject:SetActive(false)
    end
    ---开放时间文本
    local lockStr = ""
    local pointData = StormControl.GetStormPointByID(self.m_data.points[1])
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
function M:OnToggleClicked(isOn)
    self.Normal().gameObject:SetActive(not isOn)
    self.Highlight().gameObject:SetActive(isOn)
    if isOn then
        Event.Go("BlueprintChapterChange", self.m_data);
    end
end
return M