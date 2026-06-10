-- Code Auto Create Begin
local M = Class('PersonPlot_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PersonPlot_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PersonPlot_UI].prefab'
    self.Name = 'Form[PersonPlot_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'PiecePanel','PiecePanel',2},{'Piece_1','PiecePanel/Piece_1',2},{'BagItem','PiecePanel/Piece_1/BagItem',2},{'RewardRankImg','PiecePanel/Piece_1/BagItem/RewardRankImg',2},{'RewardIconImg','PiecePanel/Piece_1/BagItem/RewardIconImg',2},{'Mask','PiecePanel/Piece_1/BagItem/Mask',2},{'TextBg','PiecePanel/Piece_1/BagItem/Mask/TextBg',2},{'Piece_2','PiecePanel/Piece_2',2},{'BagItem01','PiecePanel/Piece_2/BagItem',2},{'RewardRankImg01','PiecePanel/Piece_2/BagItem/RewardRankImg',2},{'RewardIconImg01','PiecePanel/Piece_2/BagItem/RewardIconImg',2},{'Mask01','PiecePanel/Piece_2/BagItem/Mask',2},{'TextBg01','PiecePanel/Piece_2/BagItem/Mask/TextBg',2},{'Piece_3','PiecePanel/Piece_3',2},{'BagItem02','PiecePanel/Piece_3/BagItem',2},{'RewardRankImg02','PiecePanel/Piece_3/BagItem/RewardRankImg',2},{'RewardIconImg02','PiecePanel/Piece_3/BagItem/RewardIconImg',2},{'Mask02','PiecePanel/Piece_3/BagItem/Mask',2},{'TextBg02','PiecePanel/Piece_3/BagItem/Mask/TextBg',2},{'Piece_4','PiecePanel/Piece_4',2},{'BagItem03','PiecePanel/Piece_4/BagItem',2},{'RewardRankImg03','PiecePanel/Piece_4/BagItem/RewardRankImg',2},{'RewardIconImg03','PiecePanel/Piece_4/BagItem/RewardIconImg',2},{'Mask03','PiecePanel/Piece_4/BagItem/Mask',2},{'TextBg03','PiecePanel/Piece_4/BagItem/Mask/TextBg',2},{'Piece_5','PiecePanel/Piece_5',2},{'BagItem04','PiecePanel/Piece_5/BagItem',2},{'RewardRankImg04','PiecePanel/Piece_5/BagItem/RewardRankImg',2},{'RewardIconImg04','PiecePanel/Piece_5/BagItem/RewardIconImg',2},{'Mask04','PiecePanel/Piece_5/BagItem/Mask',2},{'TextBg04','PiecePanel/Piece_5/BagItem/Mask/TextBg',2},{'Piece_6','PiecePanel/Piece_6',2},{'BagItem05','PiecePanel/Piece_6/BagItem',2},{'RewardRankImg05','PiecePanel/Piece_6/BagItem/RewardRankImg',2},{'RewardIconImg05','PiecePanel/Piece_6/BagItem/RewardIconImg',2},{'Mask05','PiecePanel/Piece_6/BagItem/Mask',2},{'TextBg05','PiecePanel/Piece_6/BagItem/Mask/TextBg',2},{'Piece_7','PiecePanel/Piece_7',2},{'BagItem06','PiecePanel/Piece_7/BagItem',2},{'RewardRankImg06','PiecePanel/Piece_7/BagItem/RewardRankImg',2},{'RewardIconImg06','PiecePanel/Piece_7/BagItem/RewardIconImg',2},{'Mask06','PiecePanel/Piece_7/BagItem/Mask',2},{'TextBg06','PiecePanel/Piece_7/BagItem/Mask/TextBg',2},{'PlotScroll','PlotScroll',2},{'PersonPlot','PlotScroll/PersonPlot',2},{'Img_Lock','PlotScroll/PersonPlot/Img_Lock',2},{'BagItem07','PlotScroll/PersonPlot/BagItem',2},{'RewardRankImg07','PlotScroll/PersonPlot/BagItem/RewardRankImg',2},{'RewardIconImg07','PlotScroll/PersonPlot/BagItem/RewardIconImg',2},{'Mask07','PlotScroll/PersonPlot/BagItem/Mask',2},{'TextBg07','PlotScroll/PersonPlot/BagItem/Mask/TextBg',2},{'Content','PlotScroll/Content',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Btn_Help','ReturnBg/Btn_Help',2},{'PlanBg','PlanBg',2},{'PlanPanel','PlanBg/PlanPanel',2},
        -- LoopScrollRect 列表
        {'PlotScroll01','PlotScroll',18},
        -- TextMeshProUGUI 列表
        {'MaskText','PiecePanel/Piece_1/BagItem/Mask/MaskText',20},{'MaskText01','PiecePanel/Piece_2/BagItem/Mask/MaskText',20},{'MaskText02','PiecePanel/Piece_3/BagItem/Mask/MaskText',20},{'MaskText03','PiecePanel/Piece_4/BagItem/Mask/MaskText',20},{'MaskText04','PiecePanel/Piece_5/BagItem/Mask/MaskText',20},{'MaskText05','PiecePanel/Piece_6/BagItem/Mask/MaskText',20},{'MaskText06','PiecePanel/Piece_7/BagItem/Mask/MaskText',20},{'PlotTitle','PlotScroll/PersonPlot/PlotTitle',20},{'PlotTitleNum','PlotScroll/PersonPlot/PlotTitleNum',20},{'Text_PlotName','PlotScroll/PersonPlot/Text_PlotName',20},{'MaskText07','PlotScroll/PersonPlot/BagItem/Mask/MaskText',20},{'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},{'Plan_Title','PlanBg/Plan_Title',20},{'Plan_Rate','PlanBg/Plan_Title/Plan_Rate',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---@type EventRaidData
    self.PersonData = PersonStoryControl.GetPersonData()
    ---活动章节列表
    ---@type ActiveChapterData
    self.PlotChapter = PersonStoryControl.GetPlotChapter()
    ---个人剧情皮肤数据
    ---@type PersonStoryData
    self.PersonSkinData = PersonStoryControl.GetPersonSkinData()[self.PersonData.personId]
    ---当前关卡列表
    self.CurLevelList = self.PlotChapter.levels
    ---注册滑块
    self.PlotScroll01():SetLuaCellEvent(Handle(self, self.PlotCell))
    --初始化按钮
    self:InitBtn()
    --剧情
    self:ShowPolt()
    --解锁进度
    self:ShowPlan()
    --碎片
    self:ShowPiece()
end

function M:InitBtn()
    Event.Add("BackKey", self.OnBackKey)

    --返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    --返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        PersonStoryControl.InPerson = false
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    --帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.PersonData.group)
    end)
end
---剧情
function M:ShowPolt()
    self.PlotScroll01().totalCount = #self.CurLevelList
    self.PlotScroll01():RefillCells()
end
function M:PlotCell(trans,idx)
    local pointData = StormControl.GetStormPointByID(self.CurLevelList[idx])
    local tItem = self.PersonSkinData.plotItem[idx]
    if pointData == nil or tItem == nil then
        trans.gameObject:SetActive(false)
        return
    end
    local tLock = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Lock").gameObject
    local tRedDot = CJNUIMgr.GetSunUseName(trans.gameObject, "RedDotIcon").gameObject
    local tTitleNum = CJNUIMgr.GetSunUseName(trans.gameObject, "PlotTitleNum"):GetComponent("TextMeshProUGUI")
    local tPlotName = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_PlotName"):GetComponent("TextMeshProUGUI")

    --关卡锁
    if tItem ~= "0" then
        local tStr = string.split(tItem,'_')
        local BagItem = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
        if BagItem and BagItem.count > 0 then
            tLock:SetActive(false)
        elseif BagItem then
            tLock:SetActive(true)
            local tItem = CJNUIMgr.GetSunUseName(trans.gameObject, "BagItem")
            --道具展示
            self:ShowBagItem(BagItem, tItem)
        end
    else
        tLock:SetActive(false)
    end
    --红点
    tRedDot:SetActive(not pointData:CheckLock())
    --关卡序号
    tTitleNum.text = idx
    --关卡名
    tPlotName.text = pointData.name
    --进入剧情关卡
    UIEvent.LuaClick(trans.gameObject, function()
        if tLock.activeSelf then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_personalstory_tips2"),2},true)
        else
            ---当前关卡
            StormViewModel.CurPointData = pointData
            BattleManager.GameMode = BattleManager.GameModeType.Normal
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
        end
    end)
    trans.gameObject:SetActive(true)
end
---解锁进度
function M:ShowPlan()
    for i, v in ipairs(self.PersonSkinData.pieceSortOut) do
        local tPlan = GameObject.Instantiate(self.Plan_Title().gameObject, self.PlanPanel().transform, false)
        local tName = tPlan:GetComponent("TextMeshProUGUI")
        local tRate = CJNUIMgr.GetSunUseName(tPlan.gameObject,"Plan_Rate"):GetComponent("TextMeshProUGUI")
        
        tName.text = MgrLanguageData.GetLanguageByKey("ui_personalstory_text"..i)

        local tComplete = 0
        for j, strItem in ipairs(v) do
            if tonumber(strItem) == 0 then
                tComplete = tComplete + 1
            else
                local tStr = string.split(strItem, '_')
                local BagItem = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
                if BagItem and BagItem.count >= tonumber(tStr[3]) then
                    tComplete = tComplete + 1
                end
            end
        end
        tRate.text = string.format("%s/%s",tComplete,#v)
    end
    self.Plan_Title().gameObject:SetActive(false)
end
---碎片
function M:ShowPiece()
    local isHaveLock = false
    for i, v in ipairs(self.PersonSkinData.pieceItem) do
        if i > self.PiecePanel().transform.childCount then
            return
        end
        local tPiece = self.PiecePanel().transform:Find("Piece_"..i):GetComponent("Image")
        local tItem = tPiece.transform:Find("BagItem")
        local tStr = string.split(v, '_')
        local BagItem = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
        --判断碎片解锁
        if BagItem.count >= tonumber(tStr[3]) then
            --解锁
            MgrRes.LoadSprite(tPiece, "Activity/PersonStory/Img_Chip_Unlocked"..i)
            tItem.gameObject:SetActive(false)
        else
            isHaveLock = true
            --未解锁
            MgrRes.LoadSprite(tPiece, "Activity/PersonStory/Img_Chip_Locked"..i)
        end
        --道具展示
        self:ShowBagItem(BagItem, tItem)
    end
    --全解锁，替换底图
    if not isHaveLock then
        MgrRes.LoadSprite(self.PiecePanel(),"Activity/PersonStory/Img_Shining_Unlocked")
    end
end
---道具展示
function M:ShowBagItem(_ItemData, _item)
    local tItemFrame = CJNUIMgr.GetSunUseName(_item.gameObject, "RewardRankImg"):GetComponent("Image")
    local tItemIcon = CJNUIMgr.GetSunUseName(_item.gameObject, "RewardIconImg"):GetComponent("Image")
    --设置品质框
    MgrRes.LoadSprite(tItemFrame,_ItemData.iconFrame)
    --设置图标
    MgrRes.LoadSprite(tItemIcon,_ItemData.icon)
    --道具详情
    UIEvent.LuaClick(_item.gameObject,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{_ItemData, false, function() end},true)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    else
        MgrUI.CloseAllPop()
    end
end

return M
