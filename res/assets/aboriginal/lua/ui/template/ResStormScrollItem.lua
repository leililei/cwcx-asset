-- Code Auto Create Begin
local M = Class('ResStormScrollItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ResStormScrollItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Bottom','Img_Bottom',2},{'Img_Icon','Img_Icon',2},{'Img_Xian2','Img_Xian2',2},{'Img_Xian1','Img_Xian1',2},{'Img_Jianbiandi','Img_Jianbiandi',2},{'Img_Zhezhao(bai)','Panel_Lock/Img_Zhezhao(bai)',2},{'Img_Weikaifangdi','Panel_Lock/Img_Weikaifangdi',2},{'IconPanel','IconPanel',2},{'PointIcon','IconPanel/PointIcon',2},{'PointIcon1','IconPanel/PointIcon1',2},{'PointIcon2','IconPanel/PointIcon2',2},{'PointIcon3','IconPanel/PointIcon3',2},{'PointIcon4','IconPanel/PointIcon4',2},
        -- UITemplate 列表
        {'ResStormScrollItem','/',10},
        -- RawImage 列表
        {'ResStormScrollItem01','/',15},{'Panel_Lock','Panel_Lock',15},
        -- TextMeshProUGUI 列表
        {'Text_Time','Text_Time',20},{'Text_Time2','Text_Time2',20},{'Text_Content','Text_Content',20},{'Text_Name','Text_Name',20},{'Text','Panel_Lock/Img_Weikaifangdi/Text',20},
    }
end
-- Code Auto Create End
require("LocalData/ChapterLocalData")
---剧情卷初始化
function M:OnInit()
    self.IconGroup = {
        self.IconPanel().transform:Find("PointIcon").gameObject,
        self.IconPanel().transform:Find("PointIcon1").gameObject,
        self.IconPanel().transform:Find("PointIcon2").gameObject,
        self.IconPanel().transform:Find("PointIcon3").gameObject,
        self.IconPanel().transform:Find("PointIcon4").gameObject
    }
end
---@param pData StormScrollData 剧情卷刷新
function M:OnUpdateUI(pData)
    self.pData = pData
    ---检查是否解锁
    local isLock = StormViewModel.CheckAssetsScroll(self.pData.type2)
    ---设置锁
    self.Panel_Lock().gameObject:SetActive(not isLock)
    --Text_Time

    self.IconPanel().gameObject:SetActive(isLock)
    self.Text_Time().gameObject:SetActive(isLock)
    self.Text_Time2().gameObject:SetActive(false)
    ---设置卷名、开放时间文本      10 原罪清剿 12 核心制造 13 队员特训 0 周本
    if self.pData.type2 == 10 then
        self.Text_Name().text = MgrLanguageData.GetLanguageByKey("resstormscrollitem_resources_normal")
        local pointData = StormControl.GetStormPointByID(self.pData.points[1])
        for type, v in pairs(pointData.unlocks) do
            if type == 0 then
                local pLevel = PlayerControl.GetPlayerLevel()
                if pLevel < v then
                    self.Text_Time2().text = MgrLanguageData.GetLanguageByKey("ui_combatcopy_text1")..v.."</color>"
                    break
                end
            elseif type == 1 then
                local lockStr = ""
                for i, data in pairs(StormViewModel.CacheAssetScrollData) do
                    if data.type2 == self.pData.type2 then
                        for i, pointId in pairs(data.points) do
                            if StormControl.CheckPointLock(pointId) then
                                local str = tostring(data.index).."_"
                                if string.find(lockStr,str) == nil then
                                    lockStr = lockStr..str
                                end
                                break
                            end
                        end
                    end
                end
                lockStr = string.sub(lockStr,1,string.len(lockStr)-1)
                local curLockStr = string.split(lockStr,"_")
                for k, v in pairs(self.IconGroup) do
                    if #curLockStr >= k then
                        v:SetActive(true)
                        MgrRes.LoadSprite(v:GetComponent("Image"),"Attribute/PointRes_"..curLockStr[k])
                    else
                        self.IconGroup[k]:SetActive(false)
                    end
                end
            end
        end
        --[[local lockStr = ""
        --local pointData = StormControl.GetStormPointByID(self.pData.points[1])
        --for type, v in pairs(pointData.unlocks) do
        --    if type == 0 then
        --        local pLevel = PlayerControl.GetPlayerLevel()
        --        if pLevel < v then
        --            self.Text_Time().text = "需要等级达到<color=#E94C6D>"..v.."</color>"
        --            break
        --        end
        --    elseif type == 1 then
        --        local config = TimeLocalData.tab[v]
        --        if pointData ~= nil and config ~= nil then
        --            local weekStr = string.split(config[3],",")
        --            for i, v in pairs(weekStr) do
        --                if v == "1" then
        --                    lockStr = lockStr.."一"
        --                elseif v == "2" then
        --                    lockStr = lockStr.."二"
        --                elseif v == "3" then
        --                    lockStr = lockStr.."三"
        --                elseif v == "4" then
        --                    lockStr = lockStr.."四"
        --                elseif v == "5" then
        --                    lockStr = lockStr.."五"
        --                elseif v == "6" then
        --                    lockStr = lockStr.."六"
        --                elseif v == "7" then
        --                    lockStr = lockStr.."七"
        --                end
        --            end
        --        end
        --        self.Text_Time().text = lockStr ~= "" and "周<color=#E94C6D>"..lockStr.."</color>开放" or "等待开放"
        --    end
        --end
    --elseif self.pData.type2 == 11 then
    --    self.Text_Name().text = "资料回收"
    --    local pointData = StormControl.GetStormPointByID(self.pData.points[1])
    --    for type, v in pairs(pointData.unlocks) do
    --        if type == 0 then
    --            local pLevel = PlayerControl.GetPlayerLevel()
    --            if pLevel < v then
    --                self.Text_Time().text = "需要等级达到<color=#E94C6D>"..v.."</color>"
    --                break
    --            end
    --        elseif type == 1 then
    --            self.Text_Time().text = "<color=#E94C6D>常驻</color>开放"
    --        end
    --    end]]
    elseif self.pData.type2 == 12 then
        self.Text_Name().text = MgrLanguageData.GetLanguageByKey("stormppoint_ui_makecore")
        local pointData = StormControl.GetStormPointByID(self.pData.points[1])
        for type, v in pairs(pointData.unlocks) do
            if type == 0 then
                local pLevel = PlayerControl.GetPlayerLevel()
                if pLevel < v then
                    self.Text_Time2().text = MgrLanguageData.GetLanguageByKey("ui_combatcopy_text1")..v.."</color>"
                    break
                end
            elseif type == 1 then
                local lockStr = ""
                for i, data in pairs(StormViewModel.CacheAssetScrollData) do
                    if data.type2 == self.pData.type2 then
                        for i, pointId in pairs(data.points) do
                            if StormControl.CheckPointLock(pointId) then
                                local str = tostring(data.index).."_"
                                if string.find(lockStr,str) == nil then
                                    lockStr = lockStr..str
                                end
                                break
                            end
                        end
                    end
                end
                lockStr = string.sub(lockStr,1,string.len(lockStr)-1)
                local curLockStr = string.split(lockStr,"_")
                for k, v in pairs(self.IconGroup) do
                    if #curLockStr >= k then
                        v:SetActive(true)
                        MgrRes.LoadSprite(v:GetComponent("Image"),"Attribute/PointCoreSmall_"..curLockStr[k])
                    else
                        self.IconGroup[k]:SetActive(false)
                    end
                end
            end
        end
    elseif self.pData.type2 == 13 then
        self.Text_Name().text = MgrLanguageData.GetLanguageByKey("stormppoint_ui_drivertrain")
        local pointData = StormControl.GetStormPointByID(self.pData.points[1])
        for type, v in pairs(pointData.unlocks) do
            if type == 0 then
                local pLevel = PlayerControl.GetPlayerLevel()
                if pLevel < v then
                  ---  self.Text_Time().text = "需要等级达到<color=#E94C6D>"..v.."</color>"
                    self.Text_Time2().text = MgrLanguageData.GetLanguageByKey("ui_combatcopy_text1")
                    break
                end
            elseif type == 1 then
                local lockStr = ""
                for i, data in pairs(StormViewModel.CacheAssetScrollData) do
                    if data.type2 == self.pData.type2 --[[and data.id == self.pData.id]] then
                        for i, pointId in pairs(data.points) do
                            if StormControl.CheckPointLock(pointId) then
                                local str = tostring(data.index).."_"
                                if string.find(lockStr,str) == nil then
                                    lockStr = lockStr..str
                                end
                                break
                            end
                        end
                    end
                end
                lockStr = string.sub(lockStr,1,string.len(lockStr)-1)
                local curLockStr = string.split(lockStr,"_")
                for i,v in pairs(self.IconGroup) do
                    v:SetActive(false)
                end
                for k, v in pairs(self.IconGroup) do
                    for i,value in pairs(curLockStr) do
                        if tonumber(value) == k then
                            v:SetActive(true)
                            MgrRes.LoadSprite(v:GetComponent("Image"),"Attribute/PointRank_"..(tonumber(curLockStr[i]) + 1))
                        end
                    end
                end
            end
        end
    elseif self.pData.type2 == 0 then
        self.Text_Name().text = MgrLanguageData.GetLanguageByKey("ui_meizhoufuben_text3")
        local pointData = StormControl.GetStormPointByID(self.pData.points[1])
        for type, v in pairs(pointData.unlocks) do
            if type == 0 then
                local pLevel = PlayerControl.GetPlayerLevel()
                if pLevel < v then
                    ---  self.Text_Time().text = "需要等级达到<color=#E94C6D>"..v.."</color>"
                    self.Text_Time2().text = MgrLanguageData.GetLanguageByKey("ui_combatcopy_text1")
                    break
                end
            elseif type == 1 then
                local lockStr = ""
                for i, data in pairs(StormViewModel.CacheAssetScrollData) do
                    if data.type2 == self.pData.type2 --[[and data.id == self.pData.id]] then
                        for i, pointId in pairs(data.points) do
                            if StormControl.CheckPointLock(pointId) then
                                local str = tostring(data.index).."_"
                                if string.find(lockStr,str) == nil then
                                    lockStr = lockStr..str
                                end
                                break
                            end
                        end
                    end
                end
                lockStr = string.sub(lockStr,1,string.len(lockStr)-1)
                local curLockStr = string.split(lockStr,"_")
                for i,v in pairs(self.IconGroup) do
                    v:SetActive(false)
                end
                for k, v in pairs(self.IconGroup) do
                    for i,value in pairs(curLockStr) do
                        if tonumber(value) == k then
                            v:SetActive(true)
                            MgrRes.LoadSprite(v:GetComponent("Image"),"Attribute/PointBoss_"..(tonumber(curLockStr[i])))
                        end
                    end
                end
            end
        end
    elseif self.pData.type2 == 14 then
        self.Text_Name().text = MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_31")
        local pointData = StormControl.GetStormPointByID(self.pData.points[1])
        for type, v in pairs(pointData.unlocks) do
            if type == 0 then
                local pLevel = PlayerControl.GetPlayerLevel()
                if pLevel < v then
                    ---  self.Text_Time().text = "需要等级达到<color=#E94C6D>"..v.."</color>"
                    self.Text_Time2().text = MgrLanguageData.GetLanguageByKey("ui_combatcopy_text1")
                    break
                end
            elseif type == 1 then
                local lockStr = ""
                for i, data in pairs(StormViewModel.CacheAssetScrollData) do
                    if data.type2 == self.pData.type2 --[[and data.id == self.pData.id]] then
                        for i, pointId in pairs(data.points) do
                            if StormControl.CheckPointLock(pointId) then
                                local str = tostring(data.index).."_"
                                if string.find(lockStr,str) == nil then
                                    lockStr = lockStr..str
                                end
                                break
                            end
                        end
                    end
                end
                lockStr = string.sub(lockStr,1,string.len(lockStr)-1)
                local curLockStr = string.split(lockStr,"_")
                for i,v in pairs(self.IconGroup) do
                    v:SetActive(false)
                end
                for k, v in pairs(self.IconGroup) do
                    for i,value in pairs(curLockStr) do
                        if tonumber(value) == k then
                            v:SetActive(true)
                            MgrRes.LoadSprite(v:GetComponent("Image"),"Attribute/PointRank_"..(tonumber(curLockStr[i]) + 1))
                        end
                    end
                end
            end
        end
    end
    ---设置插画
    MgrRes.LoadSprite(self.Img_Icon(),self.pData.icon)
    ---设置简介
    self.Text_Content().text = self.pData.description
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnClick))
end
---点击事件
function M:OnClick()
    local stormPointData = StormControl.GetStormPointByID(StormControl.GetStormScrollById(self.pData.id).points[1])
    for index = 1, #stormPointData.fronts do
        if not StormControl.CheckPointPass(stormPointData.fronts[index]) then
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("stormviewmodel_tips6"),StormControl.GetStormPointByID(stormPointData.fronts[index]).idxName), 1 }, true)
            return
        end
    end
    --[[if not StormViewModel.CheckAssetsScroll(self.pData.type2) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips2"),1},true)
        return
    end]]
    ---资源ui创建

    --获得资源本关卡掉落数据
    local resType = stormPointData.scrollType
    if resType == 10 or resType == 11 or resType == 12 or resType == 13 then
        local levelIds = self:GetResIDs(resType)
        StormViewModel.RequestLevelDropInfo(levelIds, function()
            StormViewModel.OpenStormPointUI(self.pData,StormViewModel.PointType.res)
        end)
    elseif resType == 14 then
        StormViewModel.CurScrollData = self.pData;
        StormViewModel.CurPointType = StormViewModel.PointType.res;
        MgrUI.GoHide(UID.BlueprintRes_UI);
    else
        StormViewModel.OpenStormPointUIAfterRequestDrop(self.pData,StormViewModel.PointType.res)
    end
end

--根据类型获得资源本对应ID
function M:GetResIDs(type)
    local tab = {}
    for key, value in pairs(ChapterLocalData.tab) do
        if type ==  value.type then
            local ids = string.split(value.simple,',')
            for j, k in pairs(ids) do
                table.insert(tab,tonumber(k))
            end
        end
    end
    return tab
end
return M