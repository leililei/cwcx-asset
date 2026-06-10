-- Code Auto Create Begin
local M = Class('HalfAnniversaryLevelItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HalfAnniversaryLevelItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'LevelItem_Light','LevelItem_Light',2},{'Img_Leveldi_Light','LevelItem_Light/Img_Leveldi_Light',2},{'Btn_EnterLevel','LevelItem_Light/Img_Leveldi_Light/Btn_EnterLevel',2},{'Img_LevelCost','LevelItem_Light/Img_Leveldi_Light/Btn_EnterLevel/Img_Xiaohaotili/Img_LevelCost',2},{'Img_Dian','LevelItem_Light/Img_Dian',2},{'LevelItem_Black','LevelItem_Black',2},{'Img_Leveldi_Black','LevelItem_Black/Img_Leveldi_Black',2},{'Img_suo','LevelItem_Black/Img_Leveldi_Black/Img_suo',2},{'Img_Dian01','LevelItem_Black/Img_Dian',2},
        -- UITemplate 列表
        {'HalfAnniversaryLevelItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_PointName_Light','LevelItem_Light/Img_Leveldi_Light/Text_PointName_Light',20},{'Text_InPoint','LevelItem_Light/Img_Leveldi_Light/Btn_EnterLevel/Text_InPoint',20},{'Text_LevelNum','LevelItem_Light/Img_Leveldi_Light/Btn_EnterLevel/Img_Xiaohaotili/Text_LevelNum',20},{'Text_Time_Light','LevelItem_Light/Text_Time_Light',20},{'Text_Place_Light','LevelItem_Light/Text_Place_Light',20},{'Text_PointName_Black','LevelItem_Black/Img_Leveldi_Black/Text_PointName_Black',20},{'Text_Time_Black','LevelItem_Black/Text_Time_Black',20},{'Text_Place_Black','LevelItem_Black/Text_Place_Black',20},{'Text_Wenhao_Black','LevelItem_Black/Text_Wenhao_Black',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.pointData = nil
    ---item大小控制
    self.Content = self.ObjRoot.gameObject:GetComponent("SkillBound")
    
    self:InitButton()
end

function M:InitButton()
    UIEvent.LuaClick(self.Btn_EnterLevel().gameObject, Handle(self, function()
        if self.pointData then
            ---当前关卡
            StormViewModel.CurPointData = self.pointData
            BattleManager.GameMode = BattleManager.GameModeType.Normal
            MgrTimer.AddDelay("GoPlot", 1, function()
                StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
            end, nil)
        end
    end))
    UIEvent.LuaClick(self.Img_Leveldi_Black().gameObject, Handle(self, function()
        if self.pointData and not self.pointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text19"), 1 }, true)
            return
        end

        self.LevelItem_Light().gameObject:SetActive(true)
        self.LevelItem_Black().gameObject:SetActive(false)
        
        local tLvSel = HalfAnniControl.GetCurSelect()
        local tContent = HalfAnniControl.GetCurContent()
        
        if tLvSel and tLvSel ~= self.ObjRoot and tContent then
            local tLight = CJNUIMgr.GetSunUseName(tLvSel.gameObject, "LevelItem_Light")
            local tBlack = CJNUIMgr.GetSunUseName(tLvSel.gameObject, "LevelItem_Black")
            tLight.gameObject:SetActive(false)
            tBlack.gameObject:SetActive(true)

            tContent:UpdateSize()
        end
        HalfAnniControl.SetCurSelect(self.ObjRoot)
        HalfAnniControl.SetCurContent(self.Content)
        ---刷新Content大小
        self.Content:UpdateSize()
        ---关卡掉落
        Event.Go("HalfAnni", self.pointData)
    end))
end

function M:OnUpdateUI(pData)
    local tCurLevelId = pData[1]
    local isSelect = pData[2]

    self.pointData = StormControl.GetStormPointByID(tCurLevelId)
    if self.pointData and self.pointData:CheckLock() then
        self.Text_PointName_Light().text = self.pointData.idxName.." "..self.pointData.name
        self.Text_PointName_Black().text = self.pointData.idxName.." "..self.pointData.name
        self.Text_Time_Light().text = self.pointData.timelocal[1]
        self.Text_Time_Black().text = self.pointData.timelocal[1]
        self.Text_Place_Light().text = self.pointData.timelocal[2]
        self.Text_Place_Black().text = self.pointData.timelocal[2]
        self.Text_LevelNum().text = self.pointData.consume and tonumber(string.split(self.pointData.consume,"_")[3]) or 0
       
        self.Img_suo().gameObject:SetActive(false)
        self.Text_Wenhao_Black().gameObject:SetActive(false)
        self.Text_Time_Black().gameObject:SetActive(true)
        self.Text_Place_Black().gameObject:SetActive(true)
    else
        self.Img_suo().gameObject:SetActive(true)
        self.Text_Wenhao_Black().gameObject:SetActive(false)
        self.Text_Time_Black().gameObject:SetActive(false)
        self.Text_Place_Black().gameObject:SetActive(false)
        
        self.Text_PointName_Light().text = "？？？"
        self.Text_PointName_Black().text = "？？？"
    end
    
    if isSelect then
        self.LevelItem_Light().gameObject:SetActive(true)
        self.LevelItem_Black().gameObject:SetActive(false)
        HalfAnniControl.SetCurSelect(self.ObjRoot)
        HalfAnniControl.SetCurContent(self.Content)

        ---关卡掉落
        Event.Go("HalfAnni", self.pointData)
    else
        self.LevelItem_Light().gameObject:SetActive(false)
        self.LevelItem_Black().gameObject:SetActive(true)
        
        Tools.ReSize(self.Img_Leveldi_Black().gameObject)
    end
end

return M