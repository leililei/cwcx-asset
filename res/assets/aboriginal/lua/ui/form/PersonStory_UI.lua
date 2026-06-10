-- Code Auto Create Begin
local M = Class('PersonStory_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PersonStory_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PersonStory_UI].prefab'
    self.Name = 'Form[PersonStory_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'PointScroll','PointScroll',2},{'LevelPanel','PointScroll/LevelPanel',2},{'LevelItem2','PointScroll/LevelPanel/LevelItem2',2},{'Img_Lock','PointScroll/LevelPanel/LevelItem2/Img_Lock',2},{'Img_Level','PointScroll/LevelPanel/LevelItem2/Img_Level',2},{'Panel_Start','PointScroll/LevelPanel/LevelItem2/Img_Level/Panel_Start',2},{'Img_TaskStar_1','PointScroll/LevelPanel/LevelItem2/Img_Level/Panel_Start/Img_TaskStar_1',2},{'Highlight','PointScroll/LevelPanel/LevelItem2/Img_Level/Panel_Start/Img_TaskStar_1/Highlight',2},{'Img_TaskStar_2','PointScroll/LevelPanel/LevelItem2/Img_Level/Panel_Start/Img_TaskStar_2',2},{'Highlight01','PointScroll/LevelPanel/LevelItem2/Img_Level/Panel_Start/Img_TaskStar_2/Highlight',2},{'Img_TaskStar_3','PointScroll/LevelPanel/LevelItem2/Img_Level/Panel_Start/Img_TaskStar_3',2},{'Highlight02','PointScroll/LevelPanel/LevelItem2/Img_Level/Panel_Start/Img_TaskStar_3/Highlight',2},{'LevelItem1','PointScroll/LevelPanel/LevelItem1',2},{'Img_Lock01','PointScroll/LevelPanel/LevelItem1/Img_Lock',2},{'Img_Level01','PointScroll/LevelPanel/LevelItem1/Img_Level',2},{'Panel_Start01','PointScroll/LevelPanel/LevelItem1/Img_Level/Panel_Start',2},{'Img_TaskStar_101','PointScroll/LevelPanel/LevelItem1/Img_Level/Panel_Start/Img_TaskStar_1',2},{'Highlight03','PointScroll/LevelPanel/LevelItem1/Img_Level/Panel_Start/Img_TaskStar_1/Highlight',2},{'Img_TaskStar_201','PointScroll/LevelPanel/LevelItem1/Img_Level/Panel_Start/Img_TaskStar_2',2},{'Highlight04','PointScroll/LevelPanel/LevelItem1/Img_Level/Panel_Start/Img_TaskStar_2/Highlight',2},{'Img_TaskStar_301','PointScroll/LevelPanel/LevelItem1/Img_Level/Panel_Start/Img_TaskStar_3',2},{'Highlight05','PointScroll/LevelPanel/LevelItem1/Img_Level/Panel_Start/Img_TaskStar_3/Highlight',2},{'Content','PointScroll/Content',2},{'EventTime','EventTime',2},{'RewardTime','RewardTime',2},{'Btn_Draw','Btn_Draw',2},{'Btn_Plot','Btn_Plot',2},{'RightPanel','RightPanel',2},{'Img_AddUpBG','RightPanel/Img_AddUpBG',2},{'Img_RoleFrame','RightPanel/Img_AddUpBG/Img_RoleFrame',2},{'Img_Role','RightPanel/Img_AddUpBG/Img_RoleFrame/Img_Role',2},{'RoleUpPanel','RightPanel/Img_AddUpBG/RoleUpPanel',2},{'BtnChapter','RightPanel/BtnChapter',2},{'Btn_Lock','RightPanel/BtnChapter/Btn_Lock',2},{'ChapterPanel','RightPanel/ChapterPanel',2},{'di','SelectPoint/Panel_Info/di',2},{'Img_Xian2','SelectPoint/Panel_Info/Img_Xian2',2},{'Img_Xian1','SelectPoint/Panel_Info/Img_Xian1',2},{'Img_Biaotixian1','SelectPoint/Panel_Info/Img_Biaotixian1',2},{'Img_Biaotixian2','SelectPoint/Panel_Info/Img_Biaotixian2',2},{'PointIdxNamedi','SelectPoint/Panel_Info/PointIdxNamedi',2},{'Zuozhan','SelectPoint/Panel_Info/Zuozhan',2},{'Img_StarTask_1','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1',2},{'Img_LevelStar_1','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1/Img_LevelStar_1',2},{'Highlight06','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1/Img_LevelStar_1/Highlight',2},{'Img_StarTask_2','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2',2},{'Img_LevelStar_2','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2/Img_LevelStar_2',2},{'Highlight07','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2/Img_LevelStar_2/Highlight',2},{'Img_StarTask_3','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3',2},{'Img_LevelStar_3','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3/Img_LevelStar_3',2},{'Highlight08','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3/Img_LevelStar_3/Highlight',2},{'Btn_Fast','SelectPoint/Panel_Info/Zuozhan/Btn_Fast',2},{'Btu_Saodangdi','SelectPoint/Panel_Info/Zuozhan/Btn_Fast/Btu_Saodangdi',2},{'SweepSuo','SelectPoint/Panel_Info/Zuozhan/Btn_Fast/Btn_Content/SweepSuo',2},{'Btn_InPoint','SelectPoint/Panel_Info/Zuozhan/Btn_InPoint',2},{'Btn_Zuozhanzhunbeidi','SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili','SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili',2},{'Img_LevelCost','SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili/Img_LevelCost',2},{'JuQing','SelectPoint/Panel_Info/JuQing',2},{'Panel_Tili','SelectPoint/Panel_Info/Panel_Tili',2},{'Img_PowerBG','SelectPoint/Panel_Info/Panel_Tili/Img_PowerBG',2},{'Btn_Add','SelectPoint/Panel_Info/Panel_Tili/Btn_Add',2},{'Img_Tiliicon','SelectPoint/Panel_Info/Panel_Tili/Img_Tiliicon',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Btn_Help','ReturnBg/Btn_Help',2},{'RoleUp_Pop','RoleUp_Pop',2},{'Bg','RoleUp_Pop/Bg',2},{'RoleUpScroll','RoleUp_Pop/Bg/RoleUpScroll',2},{'RoleUpItem','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem',2},{'RoleItem','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/RoleItem',2},{'RoleIcon','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/RoleItem/RoleIcon',2},{'Img_Kuang','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/RoleItem/Img_Kuang',2},{'JobIcon','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/RoleItem/JobIcon',2},{'ItemPreFab','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/ItemPreFab',2},{'ItenRankImg','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/ItemPreFab/ItenRankImg',2},{'ItemIconImg','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/ItemPreFab/ItemIconImg',2},{'Content01','RoleUp_Pop/Bg/RoleUpScroll/Content',2},{'ImgXian','RoleUp_Pop/ImgXian',2},{'ImgXian2','RoleUp_Pop/ImgXian2',2},{'ImgXian1','RoleUp_Pop/RoleUpTitle/ImgXian1',2},{'Img_ActivityEnd','Img_ActivityEnd',2},
        -- Button 列表
        {'Panel_Tili01','SelectPoint/Panel_Info/Panel_Tili',4},{'ItemIconImg01','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/ItemPreFab/ItemIconImg',4},
        -- UITemplate 列表
        {'PointRewardsItem','SelectPoint/Panel_Info/VFXMask/RewardsScroll/PointRewardsItem',10},
        -- RawImage 列表
        {'SelectPoint','SelectPoint',15},{'RewardsScroll','SelectPoint/Panel_Info/VFXMask/RewardsScroll',15},{'RewardsContent','SelectPoint/Panel_Info/VFXMask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'PointScroll01','PointScroll',18},{'RewardsScroll01','SelectPoint/Panel_Info/VFXMask/RewardsScroll',18},{'RoleUpScroll01','RoleUp_Pop/Bg/RoleUpScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Name','PointScroll/LevelPanel/LevelItem2/Text_Name',20},{'Text_Name01','PointScroll/LevelPanel/LevelItem1/Text_Name',20},{'Text_Huodongjieshushijian','EventTime/Text_Huodongjieshushijian',20},{'Text_EventDate','EventTime/Text_EventDate',20},{'Text_Huodongjieshushijian01','RewardTime/Text_Huodongjieshushijian',20},{'Text_RewardDate','RewardTime/Text_RewardDate',20},{'Text_RoleUp','RightPanel/Img_AddUpBG/Text_RoleUp',20},{'ChapterName','RightPanel/BtnChapter/ChapterName',20},{'Text_PointName','SelectPoint/Panel_Info/Text_PointName',20},{'Text_PointIdxName','SelectPoint/Panel_Info/PointIdxNamedi/Text_PointIdxName',20},{'Text_TaskName','SelectPoint/Panel_Info/Zuozhan/Text_TaskName',20},{'Text_LevelTask_1','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1/Text_LevelTask_1',20},{'Text_LevelTask_2','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2/Text_LevelTask_2',20},{'Text_LevelTask_3','SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3/Text_LevelTask_3',20},{'Text_Drop','SelectPoint/Panel_Info/Zuozhan/Text_Drop',20},{'Text_Saodang','SelectPoint/Panel_Info/Zuozhan/Btn_Fast/Btn_Content/Text_Saodang',20},{'Text_InPoint','SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Text_InPoint',20},{'Text_LevelNum','SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili/Text_LevelNum',20},{'Text_PlotTitle','SelectPoint/Panel_Info/JuQing/Text_PlotTitle',20},{'Text_PlotTips','SelectPoint/Panel_Info/JuQing/Text_PlotTips',20},{'Text_Drop01','SelectPoint/Panel_Info/JuQing/Text_Drop',20},{'Text_Tili','SelectPoint/Panel_Info/Panel_Tili/Text_Tili',20},{'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},{'ItemName','RoleUp_Pop/Bg/RoleUpScroll/RoleUpItem/ItemName',20},{'RoleUpTitle','RoleUp_Pop/RoleUpTitle',20},{'Tips','RoleUp_Pop/Tips',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---@type EventRaidData
    self.PersonData = PersonStoryControl.GetPersonData()
    ---活动章节列表
    ---@type ActiveChapterData
    self.ChapterList = PersonStoryControl.GetBattleChapter()
    ---当前关卡列表
    self.CurLevelList = nil
    ---当前角色加成数据
    self.CurRoleUpItem = {}
    ---当前选中的关卡
    self.SelectItem = nil
    self.levelPath = nil
    self.levelColor = nil
    --注册滑块
    self.PointScroll01():SetLuaCellEvent(Handle(self, self.LevelCell))
    self.RoleUpScroll01():SetLuaCellEvent(Handle(self, self.RoleUpCell))
    self.RewardsScroll01():SetLuaCellEvent(Handle(self, self.RewardCellItem))

    self:InitBtn()
    --活动时间
    self:ActivityTime()
    --刷新体力
    self:RefreshPower()
    --播放随机语音
    if PersonStoryControl.InPerson then
        self.PersonData:PlayRangeVoice()
        --PersonStoryControl.InPerson = false
    end
end

function M:InitBtn()
    Event.Add("BackKey", self.OnBackKey)

    --返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        self:OnBackKey()
        --MgrUI.GoBack()
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
    --扭蛋
    UIEvent.LuaClick(self.Btn_Draw().gameObject, function()
        PersonStoryControl.OpenShopUI()
    end)
    --剧情、皮肤碎片
    UIEvent.LuaClick(self.Btn_Plot().gameObject, function()
        PersonStoryControl.OpenPlotUI()
    end)
    --角色加成详情关闭
    UIEvent.LuaClick(self.RoleUp_Pop().gameObject, function()
        self.RoleUp_Pop().gameObject:SetActive(false)
    end,nil,self.RoleUp_Pop())
    --点击隐藏关卡信息
    UIEvent.LuaClick(self.Background().gameObject, function()
        if self.SelectItem then
            self.SelectItem.color = self.levelColor
            MgrRes.LoadSprite(self.SelectItem, self.levelPath,nil,true)
            self.SelectItem = nil
        end
        if self.SelectPoint().gameObject.activeSelf then
            self.SelectPoint().gameObject:SetActive(false)
        end
    end, nil, self.Background())

    ---跳转体力信息面板
    UIEvent.LuaClick(self.Panel_Tili().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshPower()
        end}, true)
    end))
    --关卡扫荡
    UIEvent.LuaClick(self.Btn_Fast().gameObject, function()
        if not self:CheckFast() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text24"), 1 }, true)
            return
        end

        MgrUI.Pop(UID.SweepPop_UI, { StormViewModel.CurPointData,function()
            self:RefreshPower()
        end }, true)
    end)
    --关卡挑战
    UIEvent.LuaClick(self.Btn_InPoint().gameObject,function()
        if not StormViewModel.CurPointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"), 2 }, true)
        else
            ---当前关卡
            BattleManager.GameMode = BattleManager.GameModeType.Normal
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
        end
    end)
    --UP角色道具展示
    UIEvent.LuaClick(self.RoleUpPanel().gameObject,function()
        self.RoleUp_Pop().gameObject:SetActive(true)
    end)
    --加成角色
    self:ShowRoleUp()
    --章节
    self:ShowChapter()
end
---加成角色
function M:ShowRoleUp()
    local role = PersonStoryControl.GetRoleUpData()

    for i, v in pairs(role.RoleUp) do
        local tRoleUpUI = GameObject.Instantiate(self.Img_RoleFrame().gameObject, self.RoleUpPanel().transform, false)
        local tImg_Role = tRoleUpUI.transform:Find("Img_Role"):GetComponent("Image")
        --头像
        MgrRes.LoadCircleIcon(tImg_Role, v)
    end
    --加成角色详情
    self.CurRoleUpItem = role.RoleUpItem
    self.RoleUpScroll01().totalCount = #self.CurRoleUpItem
    self.RoleUpScroll01():RefillCells(0)
    
    self.Img_RoleFrame().gameObject:SetActive(false)
end

function M:OnShowFinish()
    ---背景音乐
    if self.PersonData and self.PersonData.music ~= "" then
        MgrSound.PlayBGM(self.PersonData.music,0.2,nil,true)
    end
   self:PointTo()
end

function M:PointTo()
    if self.CurLevelList == nil then
        return
    end
    local idx = 0
    for i, v in ipairs(self.CurLevelList) do
        --关卡数据显示
        local pointData = StormControl.GetStormPointByID(v)
        if pointData and pointData:CheckLock() then
            idx = math.ceil(i*0.5)-1
        end
    end
    self.PointScroll01():ScrollToCell(idx,3000)
end
---章节
function M:ShowChapter()
    local tCurBtn = nil
    local tCurLevels = nil
    for i, v in ipairs(self.ChapterList) do
        local tChapterBtn = GameObject.Instantiate(self.BtnChapter().gameObject, self.ChapterPanel().transform, false)
        local tChapterName = tChapterBtn.transform:Find("ChapterName"):GetComponent("TextMeshProUGUI")
        local tLock = tChapterBtn.transform:Find("Btn_Lock")
        local ImgBtn = tChapterBtn.transform:GetComponent("Image")
        MgrRes.LoadSprite(ImgBtn, "Activity/PersonStory/Img_LuckyStone_Difficulty2")
        --关卡锁
        local pointData = StormControl.GetStormPointByID(v.levels[1])
        if pointData and pointData:CheckLock() then
            tLock.gameObject:SetActive(false)
            tCurBtn = ImgBtn
            tCurLevels = v.levels
            --章节名
            tChapterName.text = v.chaptername
        else
            tLock.gameObject:SetActive(true)
            tChapterName.text = ""
        end
        --按钮
        UIEvent.LuaClick(tChapterBtn.gameObject, function()
            if pointData == nil or not pointData:CheckLock() then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_personalstory_tips1"), 1 }, true)
                return
            end
            if tCurBtn == ImgBtn then
                return
            end
            MgrRes.LoadSprite(tCurBtn, "Activity/PersonStory/Img_LuckyStone_Difficulty2")
            tCurBtn = ImgBtn
            MgrRes.LoadSprite(tCurBtn, "Activity/PersonStory/Img_LuckyStone_Difficulty3")
            --更新关卡信息
            self:UpdataLeve(v.levels)
            --关卡定位
            self:PointTo()
        end)
    end
    self.BtnChapter().gameObject:SetActive(false)

    if tCurBtn then
        --按钮选中状态
        MgrRes.LoadSprite(tCurBtn, "Activity/PersonStory/Img_LuckyStone_Difficulty3")
    end
    --更新关卡信息
    self:UpdataLeve(tCurLevels)
end

---更新关卡信息
function M:UpdataLeve(_levels)
    self.PointScroll().gameObject:SetActive(_levels ~= nil)
    self.RightPanel().gameObject:SetActive(_levels ~= nil)
    self.Img_ActivityEnd().gameObject:SetActive(_levels == nil)
    self.CurLevelList = _levels
    if _levels == nil then
        return
    end
    self.PointScroll01().totalCount = math.ceil(#self.CurLevelList * 0.5)
    self.PointScroll01():RefillCells()
end
---关卡列表
function M:LevelCell(trans, idx)
    self:LevelItem(trans, idx)
end
function M:LevelItem(_obj, _idx)
    local tIdx = _idx * 2
    local tLevelPath = {}
    local tLevelColor = {}
    for i = tIdx - 1, tIdx do
        local num = i % 2 == 1 and 1 or 2
        local tLevelItem = CJNUIMgr.GetSunUseName(_obj.gameObject, "LevelItem" .. num):GetComponent("Image")
        ---锁
        local tLock = CJNUIMgr.GetSunUseName(tLevelItem.gameObject, "Img_Lock")
        ---关卡Logo
        local tImgLevel = CJNUIMgr.GetSunUseName(tLevelItem.gameObject, "Img_Level"):GetComponent("Image")
        ---名称
        local tName = CJNUIMgr.GetSunUseName(tLevelItem.gameObject, "Text_Name"):GetComponent("TextMeshProUGUI")

        --关卡数据显示
        local pointData = StormControl.GetStormPointByID(self.CurLevelList[i])
        if pointData then
            tName.text = pointData.name
            if pointData:CheckLock() then
                tLock.gameObject:SetActive(false)
                tImgLevel.gameObject:SetActive(true)
                MgrRes.LoadSprite(tImgLevel, pointData.picture)
                --通关星级
                self:InitStar(tLevelItem.gameObject, pointData)
                if i < #self.CurLevelList then
                    if pointData.star >= 7 then
                        --普通三星通关
                        tLevelColor[i] = Color(1, 1, 1, 1)
                        tLevelPath[i] = "Activity/PersonStory/Btn_LuckyStone_Clear"
                    else
                        --普通未三星通关
                        tLevelColor[i] = Color(1, 1, 1, 0.4)
                        tLevelPath[i] = "Activity/PersonStory/Btn_LuckyStone_Locked"
                    end
                else
                    if pointData.star >= 7 then
                        --boss关
                        tLevelColor[i] = Color(1, 1, 1, 1)
                        tLevelPath[i] = "Activity/PersonStory/Btn_LuckyStone_EpilogueClear"
                    else
                        --boss未三星通关
                        tLevelColor[i] = Color(1, 1, 1, 0.4)
                        tLevelPath[i] = "Activity/PersonStory/Btn_LuckyStone_Epilogue"
                    end
                end
            else
                tLock.gameObject:SetActive(true)
                tImgLevel.gameObject:SetActive(false)
                tLevelColor[i] = Color(1, 1, 1, 0.6)
                tLevelPath[i] = "Activity/PersonStory/Btn_LuckyStone_Locked"
            end
            tLevelItem.color = tLevelColor[i]
            MgrRes.LoadSprite(tLevelItem, tLevelPath[i],nil,true)

            --战斗关
            UIEvent.LuaClick(tLevelItem.gameObject, function()
                if not pointData:CheckLock() then
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"), 1 }, true)
                    return
                end
                if self.SelectItem == tLevelItem then
                    return
                end
                if self.SelectItem then
                    self.SelectItem.color = self.levelColor
                    MgrRes.LoadSprite(self.SelectItem, self.levelPath,nil,true)
                end
                self.levelColor = tLevelColor[i]
                self.levelPath = tLevelPath[i]
                self.SelectItem = tLevelItem
                self.SelectItem.color = Color(1, 1, 1, 0.6)
                MgrRes.LoadSprite(self.SelectItem, "Activity/PersonStory/Btn_LuckyStone_Current",nil,true)

                self:UpdataSelect("level", pointData)
            end)
            tLevelItem.gameObject:SetActive(true)
        else
            tLevelItem.gameObject:SetActive(false)
        end
    end
end

---活动时间
function M:ActivityTime()
    ---探索结束时间
    local tEndTime = string.split(self.PersonData.battleEndTime, '-')
    ---剩余天数
    local remainTime = Global.GetEndTime(self.PersonData.battleEndTime)
    self.Text_EventDate().text = string.format("%d/%d/%d %s:%s ", tEndTime[1], tEndTime[2], tEndTime[3], tEndTime[4], tEndTime[5]) .. EventHomeView:ShowTime(remainTime)

    ---兑换结束时间
    tEndTime = string.split(self.PersonData.endTime, '-')
    ---剩余天数
    remainTime = Global.GetEndTime(self.PersonData.endTime) - 1
    self.Text_RewardDate().text = string.format("%d/%d/%d %s:%s ", tEndTime[1], tEndTime[2], tEndTime[3], tEndTime[4], tEndTime[5]) .. EventHomeView:ShowTime(remainTime)
end
---角色加成单个详情
function M:RoleUpCell(trans, idx)
    local tData = self.CurRoleUpItem[idx]
    local tRoleIcon = CJNUIMgr.GetSunUseName(trans.gameObject, "RoleIcon"):GetComponent("Image")
    local tItemFrame = CJNUIMgr.GetSunUseName(trans.gameObject, "ItenRankImg"):GetComponent("Image")
    local tItemIcon = CJNUIMgr.GetSunUseName(trans.gameObject, "ItemIconImg"):GetComponent("Image")
    local tItemName = CJNUIMgr.GetSunUseName(trans.gameObject, "ItemName"):GetComponent("TextMeshProUGUI")
    local tRoleName = CJNUIMgr.GetSunUseName(trans.gameObject, "RoleName"):GetComponent("TextMeshProUGUI")
    --头像
    MgrRes.LoadQIconNotAni(tRoleIcon, tData.roleID)
    --道具加成
    local tStr = string.split(tData.item,'_')
    local BagItem = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
    --设置品质框
    MgrRes.LoadSprite(tItemFrame,BagItem.iconFrame)
    --设置图标
    MgrRes.LoadSprite(tItemIcon,BagItem.icon)
    --道具详情
    UIEvent.LuaClick(tItemFrame.gameObject,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem, false, function() end},true)
    end,tItemFrame)
    --道具加成说明
    tItemName.text = string.format("%s +%d",BagItem.name, tData.BonusPer).."%"
    --角色名
    local tRoleData = HeroControl.GetRoleDataByID(tData.roleID)
    if tRoleData then
        tRoleName.text = tRoleData.name
    end
end
--展示奖励细节
function M:OnItemClick(reward)
    MgrUI.Pop(UID.ItemDetailPop_UI, { reward, true, function()
    end }, true)
end

function M:InitStar(_item, _data)
    ---星级
    local s1, s2, s3 = _data:CheckStar()
    local tStar = { s1, s2, s3 }
    for i = 1, 3 do
        CJNUIMgr.GetSunUseName(_item, "Img_TaskStar_" .. i).transform:Find("Highlight").gameObject:SetActive(tStar[i])
    end
end

function M:RewardCellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData(self.CurRewardList[idx])
end
---更新选中界面
function M:UpdataSelect(_type, _data)
    ---更新选中Item位置
    --self:MoveItem()
    ---更新选中界面资料
    self.SelectPoint().gameObject:SetActive(true)
    local tItem = {
        award = nil,
        victory = nil
    }
    if _type == "level" then
        self.Zuozhan().gameObject:SetActive(true)
        self.JuQing().gameObject:SetActive(false)
        ---标题
        self.Text_PointName().text = _data.name
        ---章节顺序
        self.Text_PointIdxName().text = _data.idxName
        ---通过描述
        local s1, s2, s3 = _data:CheckStar()
        self.Img_LevelStar_1().transform:Find("Highlight").gameObject:SetActive(s1)
        self.Img_LevelStar_2().transform:Find("Highlight").gameObject:SetActive(s2)
        self.Img_LevelStar_3().transform:Find("Highlight").gameObject:SetActive(s3)
        local strArr = string.split(_data.condition, ",")
        self.Text_LevelTask_1().text = TermdescLocalData.tab[tonumber(string.split(strArr[1], "_")[3])][2]
        self.Text_LevelTask_2().text = TermdescLocalData.tab[tonumber(string.split(strArr[2], "_")[3])][2]
        self.Text_LevelTask_3().text = TermdescLocalData.tab[tonumber(string.split(strArr[3], "_")[3])][2]
        ---奖励道具
        if _data.reward then
            local t = string.split(_data.reward, ',')
            tItem.award = t
        end
        if _data.victory then
            local t = string.split(_data.victory, ',')
            tItem.victory = t
        end
        self.CurRewardList = self:GetRewards(tItem,_data)
        ---消耗
        local tCost = string.split(_data.consume, "_")
        local tIcon = Global.GetLocalDataByGoods(_data.consume).icon
        MgrRes.LoadSprite(self.Img_LevelCost(), "Item/" .. tIcon)
        self.Text_LevelNum().text = tCost[3]
        ---当前关卡
        StormViewModel.CurPointData = _data
        ---扫荡锁
        self:SweepSuo().gameObject:SetActive(not self:CheckFast())
    end
    self.RewardsScroll01().totalCount = #self.CurRewardList
    self.RewardsScroll01():RefillCells()
end

---获取奖励物品
function M:GetRewards(_itemData,pointData)
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
            data.isOnceAdopt = true
            data.count = tonumber(string.split(v, "_")[3])
            data.isRec = pointData.star >= 7
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
    Global.Sort(arr, { "isOnceAdopt", "idx" }, { false, false })
    return arr
end

function M:CheckFast()
    if StormViewModel.CurPointData == nil then
        return false
    end
    if not StormViewModel.CurPointData:CheckLock() then
        --MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
        return false
    end
    if StormViewModel.CurPointData.star < 7 then
        return false
    end
    if StormViewModel.CurPointData.type == StormViewModel.PointBattleType.ACTIVITY_BLOODBOSS then
        if BattleManager.CurActivityBossPointInfo == nil or BattleManager.CurActivityBossPointInfo.levelPerfectCount < 5 then
            --MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("activityCcontrol_tips2"),5),1},true)
            return false
        end
    end

    return true
end
---刷新体力
function M:RefreshPower()
    ---体力校准
    Global.TiliCalibration()
    self.Text_Tili().text = string.format("%s/%s",PlayerControl.GetPlayerData().vigor.vigorNum,PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4])
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() then
        PersonStoryControl.InPerson = false
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    else
        MgrUI.CloseAllPop()
    end
end

function M:OnClose()
    self.PersonData:RemoveCue()
end
return M