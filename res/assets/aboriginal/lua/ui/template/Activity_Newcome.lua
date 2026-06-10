-- Code Auto Create Begin
local M = Class('Activity_Newcome', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Newcome.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Newcome','/',2},{'Img_Tilte','Jieduanjiangli/Img_Tilte',2},{'Img_Jieduandi','Jieduanjiangli/Img_Jieduandi',2},{'Img_Chakan','Jieduanjiangli/Img_Chakan',2},{'Btn_Chakan','Jieduanjiangli/Img_Chakan/Btn_Chakan',2},{'RewardItemPreFab','Jieduanjiangli/RewardItemPreFab',2},{'RewardRankImg','Jieduanjiangli/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','Jieduanjiangli/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','Jieduanjiangli/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','Jieduanjiangli/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','Jieduanjiangli/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab',2},{'ItemStarPrefab1','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'ItemStarPrefab2','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'ItemStarPrefab3','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'ItemStarPrefab4','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'ItemStarPrefab5','Jieduanjiangli/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'Img_Received','Jieduanjiangli/RewardItemPreFab/Img_Received',2},{'Img_Suo1','Jieduanjiangli/RewardItemPreFab/Img_Suo1',2},{'kuosan','Jieduanjiangli/RewardItemPreFab/kuosan',2},{'TaskFirstScroll','RenwuPanel/TaskFirstScroll',2},{'Activity_NoviceItem','RenwuPanel/TaskFirstScroll/Activity_NoviceItem',2},{'Content','RenwuPanel/TaskFirstScroll/Content',2},{'TaskSecendScroll','RenwuPanel/TaskSecendScroll',2},{'Content01','RenwuPanel/TaskSecendScroll/Content',2},
        -- UITemplate 列表
        {'Activity_Newcome01','/',10},{'Activity_NoviceItem01','RenwuPanel/TaskFirstScroll/Activity_NoviceItem',10},
        -- LoopScrollRect 列表
        {'TaskFirstScroll01','RenwuPanel/TaskFirstScroll',18},{'TaskSecendScroll01','RenwuPanel/TaskSecendScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Jieduan1','Jieduanjiangli/Text_Jieduan1',20},{'Text_Xinjinzhehuodong','Jieduanjiangli/Text_Xinjinzhehuodong',20},{'ItemCountText','Jieduanjiangli/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','Jieduanjiangli/RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Daojuming','Jieduanjiangli/Text_Daojuming',20},{'Text_Shuoming','Jieduanjiangli/Shuoming/Text_Shuoming',20},{'Text_Wanchengshu','Jieduanjiangli/Shuoming/Text_Wanchengshu',20},
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

    self:RegisterRewardLoopScroll()
--[[    --初始化界面
    self:InitUI()]]
end
function M:OnUpdateUI(pData)
    self.ActivityID = pData[1]
    self.parent = pData[2]
    --当前活动所有阶段数据
    self.CurNoviceStageData = TaskControl.GetNoviceStageData(self.ActivityID)
    self:InitUI()
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
    ---阶段奖励显示
    local stageNumber
    --检查第几阶段(检查阶段奖励有没有领取，领取完才能显示下一阶段)
    if TaskControl.NoviceStage(self.ActivityID) then
        stageNumber = TaskControl.NoviceStage(self.ActivityID)
    end
    local isTaskComplete = false
    
    if stageNumber > #self.CurNoviceStageData then
        --所有新手任务都完成都完成再打开
        self.Img_Received().gameObject:SetActive(true)
        self.kuosan().gameObject:SetActive(false)
        stageNumber = #self.CurNoviceStageData
        isTaskComplete = true
    end
    --阶段
    self.Text_Xinjinzhehuodong().text = string.format(MgrLanguageData.GetLanguageByKey("ui_dangqianjieduan_qiyi"),stageNumber)
    self.CurCfg = TaskControl.GetNoviceActivityStageInfo(stageNumber,self.ActivityID)
    --奖励
    local reward = self.CurCfg.reward

    ---阶段任务显示
    --任务组id
    local taskGroupID = self.CurCfg.taskId
    ---背景替换
    if self.CurCfg.resource ~= "0" then
        MgrRes.LoadSprite(self.Activity_Newcome(),self.CurCfg.resource)
    end
    ---标题
    if self.CurCfg.icon ~= "0" then
        MgrRes.LoadSprite(self.Img_Tilte(),self.CurCfg.icon)
    end
    --现阶段9个任务
    ---@type AchievementTaskData[]  本阶段所有新手任务
    self.allTasks = EventRaidViewModel.GetNoviceActivityDataByID(taskGroupID)
    self.TaskFirstScroll01().totalCount = 4
    self.TaskSecendScroll01().totalCount = 3
    self.TaskFirstScroll01():RefillCells()
    self.TaskSecendScroll01():RefillCells()
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
            self.kuosan().gameObject:SetActive(true)
            self.Img_Suo1().raycastTarget = true
        else
            self.Img_Suo1().gameObject:SetActive(true)
            self.Img_Received().gameObject:SetActive(false)
            self.kuosan().gameObject:SetActive(false)
            self.Img_Suo1().raycastTarget = false
        end
    end
    --初始化按钮
    self:InitButton(self.CurNoviceStageData[stageNumber].id)
    --刷新阶段奖励图标、星级等
    self:ShowReward(reward,stageNumber)
end
function M:RegisterRewardLoopScroll()
    self.TaskFirstScroll01():SetLuaCellEvent(Handle(self,self.UpperCellItem))
    self.TaskSecendScroll01():SetLuaCellEvent(Handle(self,self.DownCellItem))
end
function M:UpperCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.allTasks[idx],self})
end
function M:DownCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.allTasks[idx + 4],self})
end
function M:InitButton(taskID)
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
            local item = TaskControl.GetNoviceActivityStageInfo(TaskControl.NoviceStage(self.ActivityID),self.ActivityID).reward
            local BagItem = ItemControl.GetItemByIdAndType(item.goodsID,item.goodsType)
            MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem,false,function() end},true)
        end))
    end
    UIEvent.LuaClick(self.Btn_Chakan().gameObject,function()
        self.parent:ShowNewComePop(self.ActivityID)
    end)
end
---显示奖励图标
function M:ShowReward(reward,stageNumber)
    ---品质边框
    MgrRes.LoadSprite(self.RewardRankImg(), "Item/Rank/ItemRank_".. ItemControl.GetItemByType(reward.goodsType, reward.goodsID).quality)
    ---物品图标
    MgrRes.LoadSprite(self.RewardIconImg(),"Item/".. ItemControl.GetItemByType(reward.goodsType, reward.goodsID).icon)
    ---奖励数量
    self.ItemCountText().text = reward.goodsNum
    ---奖励星级
    self.EmptyStarRoot().gameObject:SetActive(false)
    self.ItemStarRoot().gameObject:SetActive(false)
    --for i = 1, 6 do
        --if ItemControl.GetItemByType(reward.goodsType, reward.goodsID).itemstar > i then
        --    self.starsPrefabs[i]:SetActive(false)
        --else
        --    self.starsPrefabs[i]:SetActive(true)
        --end
    --end
    ---Img_Suo1

    ---道具名称
    --self.Text_Daojuming().text = ItemControl.GetItemByType(reward.goodsType, reward.goodsID).name
    local num = 0 --self.allTasks
    for index, value in ipairs(self.allTasks) do
        if value.isComplete == 1 then
            num = num + 1
        end
    end

    --stageNumber
    self.Text_Wanchengshu().text = "(<color=#FFBE02>"..num.."</color>/"..#self.CurNoviceStageData..")"
end

---获得本阶段奖励
function M:GetReward(UI,taskID)
    TaskControl.GetNoviceReward(UI,taskID,self.ActivityID)
end

return M