-- Code Auto Create Begin
local M = Class('NewcomeActivities_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewcomeActivities_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewcomeActivities_UI].prefab'
    self.Name = 'Form[NewcomeActivities_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Chalisha','Chalisha',2},{'UpperLeftBtnPanel','TopView/UpperLeftBtnPanel',2},{'Btn_Back','TopView/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','TopView/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','TopView/UpperLeftBtnPanel/Btn_Help',2},{'Btn_ZuanShi','TopView/Huobi/Btn_ZuanShi',2},{'Btn_Add','TopView/Huobi/Btn_ZuanShi/Btn_Add',2},{'Img_Zuanshicon','TopView/Huobi/Btn_ZuanShi/Img_Zuanshicon',2},{'Btn_Dunbi','TopView/Huobi/Btn_Dunbi',2},{'Img_Taofaicon','TopView/Huobi/Btn_Dunbi/Img_Taofaicon',2},{'Img_Jieduandi','Jieduanjiangli/Img_Jieduandi',2},{'RewardItemPreFab','Jieduanjiangli/RewardItemPreFab',2},{'RewardRankImg','Jieduanjiangli/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','Jieduanjiangli/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','Jieduanjiangli/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','Jieduanjiangli/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'ItemStarPrefab1','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'ItemStarPrefab2','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'ItemStarPrefab3','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'ItemStarPrefab4','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'ItemStarPrefab5','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'Img_Received','Jieduanjiangli/RewardItemPreFab/Img_Received',2},{'Img_Suo1','Jieduanjiangli/RewardItemPreFab/Img_Suo1',2},{'NoviceMissionScrollFirst','RenwuPanel/NoviceMissionScrollFirst',2},{'NoviceMissionItem','RenwuPanel/NoviceMissionScrollFirst/NoviceMissionItem',2},{'Content','RenwuPanel/NoviceMissionScrollFirst/Content',2},{'NoviceMissionScrollSecond','RenwuPanel/NoviceMissionScrollSecond',2},{'Content01','RenwuPanel/NoviceMissionScrollSecond/Content',2},
        -- Text 列表
        {'Text_Title_CN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_CN',3},{'Text_Title_EN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_EN',3},{'Text_ZSCount','TopView/Huobi/Btn_ZuanShi/Text_ZSCount',3},{'Text_TFCount','TopView/Huobi/Btn_Dunbi/Text_TFCount',3},{'Text_Jieduan1','Jieduanjiangli/Text_Jieduan1',3},{'Text_Xinjinzhehuodong','Jieduanjiangli/Text_Xinjinzhehuodong',3},{'ItemCountText','Jieduanjiangli/RewardItemPreFab/Img_ItemCountBg/ItemCountText',3},{'Text_Yilingqu2','Jieduanjiangli/RewardItemPreFab/Img_Received/Text_Yilingqu2',3},{'Text_Daojuming','Jieduanjiangli/RewardItemPreFab/Text_Daojuming',3},{'Text_Shuoming','Jieduanjiangli/Text_Shuoming',3},{'Text_Wanchengshu','Jieduanjiangli/Text_Wanchengshu',3},
        -- UITemplate 列表
        {'NoviceMissionItem01','RenwuPanel/NoviceMissionScrollFirst/NoviceMissionItem',10},
        -- LoopScrollRect 列表
        {'NoviceMissionScrollFirst01','RenwuPanel/NoviceMissionScrollFirst',18},{'NoviceMissionScrollSecond01','RenwuPanel/NoviceMissionScrollSecond',18},
    }
end
-- Code Auto Create End
require("LocalData/ItemLocalData")

function M:OnInit()
    self.starsPrefabs = {
        self.ItemStarPrefab().gameObject,
        self.ItemStarPrefab1().gameObject,
        self.ItemStarPrefab2().gameObject,
        self.ItemStarPrefab3().gameObject,
        self.ItemStarPrefab4().gameObject,
        self.ItemStarPrefab5().gameObject
    }
    --初始化界面
    self:InitUI()

end
function M:OnUpdateUI()

end

function M:OnShowFinish()
    NoviceViewModel.CheckCurID(21302,function()
        NoviceViewModel.DoNext()
    end)
end

function M:OnBackShow()
    --初始化界面
    self:InitUI()

end
function M:InitUI()
    ---盾币/钻石数量
    self.Text_TFCount().text = ItemControl.GetItemByID(100001).count
    self.Text_ZSCount().text = ItemControl.GetItemByID(100000).count
    ---阶段奖励显示
    local stageNumber
    --检查第几阶段(检查阶段奖励有没有领取，领取完才能显示下一阶段)
    if TaskControl.NoviceStage() then
        stageNumber = TaskControl.NoviceStage()
    end
    local isTaskComplete = false
    if stageNumber > #RecruitactivityLocalData.tab then
        --所有新手任务都完成都完成再打开
        self.Img_Received().gameObject:SetActive(true)
        stageNumber = #RecruitactivityLocalData.tab
        isTaskComplete = true
    end
    --阶段
    self.Text_Jieduan1().text = MgrLanguageData.GetLanguageByKey("newcomeactivities_ui_stage")..stageNumber
    --奖励
    local reward = TaskControl.GetNoviceActivityStageInfo(stageNumber).reward
    --刷新阶段奖励图标、星级等
    self:ShowReward(reward,stageNumber)
    ---阶段任务显示
    --任务组id
    local taskGroupID = TaskControl.GetNoviceActivityStageInfo(stageNumber).taskId
    --现阶段9个任务
    ---@type AchievementTaskData[]  本阶段所有新手任务
    self.allTasks =  EventRaidViewModel.GetNoviceActivityDataByID(taskGroupID)
    self:RegisterRewardLoopScroll()
    self.NoviceMissionScrollFirst01().totalCount = 4
    self.NoviceMissionScrollSecond01().totalCount = 3
    self.NoviceMissionScrollFirst01():RefillCells(0)
    self.NoviceMissionScrollSecond01():RefillCells(0)
    --self.NoviceMissionScrollFirst01():RefreshCells()
    --self.NoviceMissionScrollSecond01():RefreshCells()
    ---检查是否所有本阶段任务都已完成(阶段任务能否领取)
    local allTaskComplete = true
    for i,v in pairs(self.allTasks) do
        if not TaskControl.CheckComplete(v.id) then
            allTaskComplete = false
        end
    end
    if not isTaskComplete then
        if allTaskComplete then
            self.Img_Suo1().gameObject:SetActive(false)
            self.Img_Received().gameObject:SetActive(false)
            self.Img_Suo1().raycastTarget = true
        else
            self.Img_Suo1().gameObject:SetActive(true)
            self.Img_Received().gameObject:SetActive(false)
            self.Img_Suo1().raycastTarget = false
        end
    end
    --初始化按钮
    self:InitButton(stageNumber)
end
function M:RegisterRewardLoopScroll()
    self.NoviceMissionScrollFirst01():SetLuaCellEvent(Handle(self,self.UpperCellItem))
    self.NoviceMissionScrollSecond01():SetLuaCellEvent(Handle(self,self.DownCellItem))
end
function M:UpperCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.allTasks[idx],self})
end
function M:DownCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.allTasks[idx + 4],self})
end
function M:InitButton(taskID)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.ClosePop))
    local couldGetReward = true
    for i,v in pairs(self.allTasks) do
        if v.isComplete ~= 1 then
            couldGetReward = false
            break
        end
    end
    if couldGetReward then
        UIEvent.LuaClick(self.RewardIconImg().gameObject,Handle(self,function () self:GetReward(self,taskID) end))
    else
        UIEvent.LuaClick(self.RewardIconImg().gameObject,Handle(self,function ()
            local item = TaskControl.GetNoviceActivityStageInfo(TaskControl.NoviceStage()).reward
            local BagItem = ItemControl.GetItemByIdAndType(item.goodsID,item.goodsType)
            MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem,false,function() end},true)
        end))
    end


    ---帮助界面
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(101)
    end))
end
---显示奖励图标
function M:ShowReward(reward,stageNumber)
    ---品质边框
    MgrRes.LoadSprite(self.RewardRankImg(), "Item/Rank/ItemRank_".. ItemLocalData.tab[reward.goodsID].quality)
    ---物品图标
    MgrRes.LoadSprite(self.RewardIconImg(),"Item/".. ItemLocalData.tab[reward.goodsID].icon)
    ---奖励数量
    self.ItemCountText().text = reward.goodsNum
    ---奖励星级
    for i = 1, 6 do
        if ItemLocalData.tab[reward.goodsID].itemstar > i then
            self.starsPrefabs[i]:SetActive(false)
        else
            self.starsPrefabs[i]:SetActive(true)
        end
    end
    ---Img_Suo1

    ---道具名称
    self.Text_Daojuming().text = ItemLocalData.tab[reward.goodsID].name
    self.Text_Wanchengshu().text = "(<color=#FFBE02>"..stageNumber.."</color>/"..#RecruitactivityLocalData.tab..")"
end
--[[---点击任务跳转
function M:JumpToMission(taskData)
    local transformInfo = {}
    if self.taskType == 4 then
        transformInfo = string.split(TaskControl.ActivityDayTaskDataList[taskData.id].gotoID,"_")
    elseif self.taskType == 5 then
        transformInfo = string.split(TaskControl.ActivityWeekTaskDataList[taskData.id].gotoID,"_")
    end

    if transformInfo[2] == "zz" then    ---跳转作战
    if transformInfo[3] == "zy" then
        ActivationTaskViewModel.TurnToTaskPage = true
        HomeViewModel.OpenChoose()
    elseif transformInfo[3] == "lhtf" then
        MgrUI.GoHide(UID.WorldBoss_UI)
    elseif transformInfo[3] == "0" then
        HomeViewModel.OpenChoose()
    end
    elseif transformInfo[2] == "bj" then    ---跳转补给
    HomeViewModel.OpenRoleCardDraw()
    elseif transformInfo[2] == "bb" then    ---跳转背包
    ActivationTaskViewModel.TurnToTaskPage = true
        HomeViewModel.OpenPlayerBag()
    elseif transformInfo[2] == "yx" then    ---跳转演习
    HomeViewModel.OpenExercise()
    end
end]]
---获得本阶段奖励
function M:GetReward(UI,taskID)
    TaskControl.GetNoviceReward(UI,taskID)
end
---关闭界面
function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBack()
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M