-- Code Auto Create Begin
local M = Class('HaiYueLevelItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HaiYueLevelItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'HaiYueLevelItem','/',2},{'LevelItem','LevelItem',2},{'Ani_Levellitem_HaiYue','LevelItem/Ani_Levellitem_HaiYue',2},{'Img_LevelFrame','LevelItem/Ani_Levellitem_HaiYue/Img_LevelFrame',2},{'Checked','LevelItem/Ani_Levellitem_HaiYue/Checked',2},{'Img_LevelIcon','LevelItem/Ani_Levellitem_HaiYue/Img_LevelIcon',2},{'star','LevelItem/Ani_Levellitem_HaiYue/star',2},{'Img_Star1','LevelItem/Ani_Levellitem_HaiYue/star/Img_Star1',2},{'Img_Star2','LevelItem/Ani_Levellitem_HaiYue/star/Img_Star2',2},{'Img_Star3','LevelItem/Ani_Levellitem_HaiYue/star/Img_Star3',2},{'Img_Yitongguan','LevelItem/Ani_Levellitem_HaiYue/Img_Yitongguan',2},{'Img_Lock','LevelItem/Ani_Levellitem_HaiYue/Img_Lock',2},{'Img_Suo','LevelItem/Ani_Levellitem_HaiYue/Img_Lock/Img_Suo',2},{'LevelDetails','LevelDetails',2},{'Ani_LevelDetails_HaiYue','LevelDetails/Ani_LevelDetails_HaiYue',2},{'Battle','LevelDetails/Ani_LevelDetails_HaiYue/Battle',2},{'Img_UnStar','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star1/Img_UnStar',2},{'Img_DetailStar1','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star1/Img_DetailStar1',2},{'Img_UnStar01','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star2/Img_UnStar',2},{'Img_DetailStar2','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star2/Img_DetailStar2',2},{'Img_UnStar02','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star2/Img_UnStar',2},{'Img_UnStar03','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star3/Img_UnStar',2},{'Img_DetailStar3','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star3/Img_DetailStar3',2},{'Img_UnStar04','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star3/Img_UnStar',2},{'Story','LevelDetails/Ani_LevelDetails_HaiYue/Story',2},{'Img_Story','LevelDetails/Ani_LevelDetails_HaiYue/Story/Img_Story',2},{'Img_Bar','LevelDetails/Ani_LevelDetails_HaiYue/RewardBar/Img_Bar',2},{'Sweep','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Sweep',2},{'Btn_Sweep','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Sweep/Btn_Sweep',2},{'Img_SweepLock','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Sweep/Img_SweepLock',2},{'Img_SweepSuo','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Sweep/Img_SweepLock/Img_SweepSuo',2},{'Ready','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Ready',2},{'Btn_Ready','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Ready/Btn_Ready',2},{'CostBack','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Ready/CostBack',2},{'Img_CostIcon','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Ready/Img_CostIcon',2},
        -- UITemplate 列表
        {'HaiYueLevelItem01','/',10},{'PointRewardsItem','LevelDetails/Ani_LevelDetails_HaiYue/RewardScroll/PointRewardsItem',10},
        -- LoopScrollRect 列表
        {'RewardScroll','LevelDetails/Ani_LevelDetails_HaiYue/RewardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_LevelName','LevelItem/Ani_Levellitem_HaiYue/Text_LevelName',20},{'Text_Condition1','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star1/Text_Condition1',20},{'Text_Condition2','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star2/Text_Condition2',20},{'Text_Condition3','LevelDetails/Ani_LevelDetails_HaiYue/Battle/star3/Text_Condition3',20},{'Text_Story','LevelDetails/Ani_LevelDetails_HaiYue/Story/Text_Story',20},{'Text_Award','LevelDetails/Ani_LevelDetails_HaiYue/RewardBar/Text_Award',20},{'Text_Cost','LevelDetails/Ani_LevelDetails_HaiYue/BtnControl/Ready/Text_Cost',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.LevelDetails().gameObject:SetActive(false)
    self.Checked().gameObject:SetActive(false)
    ---item大小控制
    self.Content = self.ObjRoot.gameObject:GetComponent("SkillBound")
    ---星星组
    self.StarGroup = {[1] = { LStar = self.Img_Star1(), BStar = self.Img_DetailStar1(), Condition = self.Text_Condition1() },
                      [2] = { LStar = self.Img_Star2(), BStar = self.Img_DetailStar2(), Condition = self.Text_Condition2() },
                      [3] = { LStar = self.Img_Star3(), BStar = self.Img_DetailStar3(), Condition = self.Text_Condition3() }}
    self.pointData = nil
    self.CurRewardList = nil
    self.Cost = 0
    self.CellId = 0
    
    self.LevelItemAni = self.Ani_Levellitem_HaiYue().gameObject:GetComponent("Animator")
    
    self:InitButton()
    self.RewardScroll():SetLuaCellEvent(Handle(self, self.AwardCell))
end

function M:InitButton()
    ---战斗、剧情
    UIEvent.LuaClick(self.Btn_Ready().gameObject, function()
        if not self.pointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end
        ---当前关卡
        StormViewModel.CurPointData = self.pointData
        BattleManager.GameMode = BattleManager.GameModeType.Normal
        MgrTimer.AddDelay("GoPlot", 1, function()
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
        end, nil)
    end)
    ---扫荡
    UIEvent.LuaClick(self.Btn_Sweep().gameObject, function()
        if not self:CheckFast() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text24"), 1 }, true)
            return
        end
        ---当前关卡
        StormViewModel.CurPointData = self.pointData
        
        MgrUI.Pop(UID.SweepPop_UI, { StormViewModel.CurPointData,function()
            Event.Go("HaiYue_RefreshCost")
        end }, true)
    end)
    ---展开/关闭关卡详情
    UIEvent.LuaClick(self.LevelItem().gameObject, function()
        if not self.pointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text19"), 1 }, true)
            return
        end
        self.LevelDetails().gameObject:SetActive(not self.LevelDetails().gameObject.activeSelf)
        if not self.Checked().gameObject.activeSelf then
            self.Checked().gameObject:SetActive(true)
        end

        local tLvSel = HaiYueControl.GetCurSelect()
        local tLvDetail = HaiYueControl.GetCurLvDetail()
        local tContent = HaiYueControl.GetCurContent()
        if tLvDetail and tLvDetail ~= self.LevelDetails() and tContent then
            tLvDetail.gameObject:SetActive(false)
            tContent:UpdateSize()
        end
        if tLvSel and tLvSel ~= self.Checked() then
            tLvSel.gameObject:SetActive(false) 
        end
        HaiYueControl.SetCurSelect(self.Checked())
        HaiYueControl.SetCurLvDetail(self.LevelDetails())
        HaiYueControl.SetCurContent(self.Content)
       
        ---刷新Content大小
        self.Content:UpdateSize()

        ---当前关卡
        StormViewModel.CurPointData = self.pointData
        if self.LevelDetails().gameObject.activeSelf then
            MgrTimer.AddDelayNoName(0.05,function()
                Event.Go("HaiYue_CellMove",self.CellId)
            end,self.ObjRoot)
        end
    end)
end

function M:OnUpdateUI(pData)
    local pointID = pData[1]
    local chapterType = pData[2]
    local isSelect = pData[3]
    self.CellId = pData[4]

    ---隐藏之前界面打开的关卡
    local tLvDetail = HaiYueControl.GetCurLvDetail()
    if tLvDetail then
        tLvDetail.gameObject:SetActive(false)
        HaiYueControl.SetCurLvDetail(nil)
        ---刷新Content大小
        self.Content:UpdateSize()
    end
    self.pointData = StormControl.GetStormPointByID(pointID)
    if self.pointData == nil then
        return
    end
   
    ---判断关卡是否解锁
    self.Img_Lock().gameObject:SetActive(not self.pointData:CheckLock())
    ---打勾
    self.Img_Yitongguan().gameObject:SetActive(self.pointData:CheckLock() and self.pointData.star > 0)
    ---当前选定的关卡
    if isSelect then
        if not self.Checked().gameObject.activeSelf then
            self.Checked().gameObject:SetActive(true)
        end
        HaiYueControl.SetCurSelect(self.Checked())
    else
        self.Checked().gameObject:SetActive(false)
    end
    ---检测扫荡是否解锁
    if self:CheckFast() then
        self.Img_SweepLock().gameObject:SetActive(false)
        self.Btn_Sweep().transform:GetComponent("CanvasGroup").alpha = 1
    else
        self.Img_SweepLock().gameObject:SetActive(true)
        self.Btn_Sweep().transform:GetComponent("CanvasGroup").alpha = 0.5
    end
    ---关卡消耗
    self.Cost = self.pointData.consume and tonumber(string.split(self.pointData.consume,"_")[3]) or 0
    self.Text_Cost().text = self.Cost
    
    ---奖励道具 
    local tItem = {
        award = nil,
        victory = nil
    }   
    if self.pointData.reward and self.pointData.reward ~= "0" then
        local t = string.split(self.pointData.reward, ',')
        tItem.award = t
    end
    if self.pointData.victory and self.pointData.victory ~= "0" then
        local t = string.split(self.pointData.victory, ',')
        tItem.victory = t
    end
    self.CurRewardList = self:GetRewards(tItem, chapterType~=ActiveChapterControl.ChapterType.Plot)
    self.RewardScroll().totalCount = #self.CurRewardList
    self.RewardScroll():RefillCells()
    ---根据关卡类型和战斗类型,设定类容
    if chapterType == ActiveChapterControl.ChapterType.Plot then
        ---关卡名
        self.Text_LevelName().text = self.pointData.idxName.." "..self.pointData.name
        
        self.Story().gameObject:SetActive(true)
        self.Battle().gameObject:SetActive(false)
        self.star().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.Img_LevelIcon(),"Activity/HaiYue/juqingzhan")
        MgrRes.LoadSprite(self.Img_Story(),"Activity/HaiYue/"..self.pointData.bgpicture)
        
        self.Text_Story().text = self.pointData.introduction
        self.Sweep().gameObject:SetActive(false)
    else
        ---关卡名
        self.Text_LevelName().text = self.pointData.name
        
        self.Story().gameObject:SetActive(false)
        self.Battle().gameObject:SetActive(true)
        self.star().gameObject:SetActive(true)
        ---判定是否有连战
        if self.pointData.ContinuousCombatType == 0 then
            MgrRes.LoadSprite(self.Img_LevelIcon(),"Activity/HaiYue/putongzhan")
        else
            MgrRes.LoadSprite(self.Img_LevelIcon(),"Activity/HaiYue/lianzhan")
        end
        ---门票关开启扫荡
        if chapterType == ActiveChapterControl.ChapterType.Ticket then
            self.Sweep().gameObject:SetActive(true)
        else
            self.Sweep().gameObject:SetActive(false)
        end
        ---关卡通关评级
        self:InitStar(self.pointData)
    end

    if not Global.IsNil(self.LevelItemAni) then
        self.LevelItemAni:Play("Ani_Levellitem_HaiYue_1", 0, 0)
    end
end
---奖励展示
function M:AwardCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.CurRewardList[idx])
end

---关卡通关评级
function M:InitStar(_data)
    ---星级
    local s1, s2, s3 = _data:CheckStar()
    local tStar = {s1,s2,s3}
    local strArr = string.split(_data.condition, ",")
    if #strArr <= 1 then
        return
    end
    for i = 1,#self.StarGroup do
        self.StarGroup[i].LStar.gameObject:SetActive(tStar[i])
        self.StarGroup[i].BStar.gameObject:SetActive(tStar[i])
        self.StarGroup[i].Condition.text = TermdescLocalData.tab[tonumber(string.split(strArr[i], "_")[3])][2]
    end
end

---获取奖励物品
function M:GetRewards(_itemData, _isPlot)
    local arr = {}
    if _itemData.award ~= nil then
        ---首通奖励
        for i, v in pairs(_itemData.award) do
            local config = Global.GetLocalDataByGoods(v)
            local data = {}
            data.type = string.split(v, "_")[1]
            data.id = config.id
            data.config = config
            data.quality = config.quality
            data.isOnceAdopt = _isPlot
            data.count = tonumber(string.split(v, "_")[3])
            data.isRec = self.pointData.star >= 7
            data.idx = #arr + 1
            arr[#arr + 1] = data
        end
    end
    if _itemData.victory then
        ---固定奖励
        for i, v in pairs(_itemData.victory) do
            local config = Global.GetLocalDataByGoods(v)
            local vSelf = string.split(v, "_")
            local isGet = false
            for i3, v3 in pairs(arr) do
                if v3.type == vSelf[1] and v3.config.id == config.id and v3.isOnceAdopt == false then
                    arr[i3].count = arr[i3].count + tonumber(vSelf[3])
                    isGet = true
                    break
                end
            end
            if isGet ~= true then
                local data = {}
                data.type = vSelf[1]
                data.config = config
                data.id = config.id
                data.quality = config.quality
                data.isOnceAdopt = false
                data.count = tonumber(vSelf[3])
                data.isRec = false
                data.idx = #arr + 1
                arr[#arr + 1] = data
            end
        end
    end
    Global.Sort(arr, { "isOnceAdopt", "idx" }, { true, false })
    return arr
end

function M:CheckFast()
    if self.pointData == nil then
        return false
    end
    if not self.pointData:CheckLock() then
        return false
    end
    if self.pointData.star < 7 then
        return false
    end

    return true
end

return M