-- Code Auto Create Begin
local M = Class('Activity_ChapterTask', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_ChapterTask.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_ChapterTask','/',2},{'Img_BG','Img_BG',2},{'Img_BGMask','Img_BGMask',2},{'Img_Xian','Img_Xian',2},{'MainPlotSiwtchItem','SwitchScroll/MainPlotSiwtchItem',2},{'Img_Qieyedi','SwitchScroll/MainPlotSiwtchItem/Img_Qieyedi',2},{'Img_Qieyedi_H','SwitchScroll/MainPlotSiwtchItem/Img_Qieyedi_H',2},{'Img_Qieyekuang','SwitchScroll/MainPlotSiwtchItem/Img_Qieyedi_H/Img_Qieyekuang',2},{'QieyePanel','SwitchScroll/MainPlotSiwtchItem/QieyePanel',2},{'Btn_Suo','SwitchScroll/MainPlotSiwtchItem/QieyePanel/Btn_Suo',2},{'Img_Suo','SwitchScroll/MainPlotSiwtchItem/QieyePanel/Btn_Suo/Img_Suo',2},{'Content','SwitchScroll/Content',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Img_Chapter','Img_Tanchuangdi/Img_Chapter',2},{'Img_ChapterProgressBarBg','Img_ChapterProgressBarBg',2},{'Img_ChapterProgressBar','Img_ChapterProgressBarBg/Img_ChapterProgressBar',2},{'ChapterRewardScroll','ChapterRewardScroll',2},{'ChapterRewardItem','ChapterRewardScroll/ChapterRewardItem',2},{'RewardRankImg','ChapterRewardScroll/ChapterRewardItem/RewardRankImg',2},{'RewardIconImg','ChapterRewardScroll/ChapterRewardItem/RewardIconImg',2},{'Img_ItemCountBg','ChapterRewardScroll/ChapterRewardItem/Img_ItemCountBg',2},{'StarPanel','ChapterRewardScroll/ChapterRewardItem/StarPanel',2},{'EmptyStarRoot','ChapterRewardScroll/ChapterRewardItem/StarPanel/EmptyStarRoot',2},{'EmptyStar','ChapterRewardScroll/ChapterRewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','ChapterRewardScroll/ChapterRewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','ChapterRewardScroll/ChapterRewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','ChapterRewardScroll/ChapterRewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','ChapterRewardScroll/ChapterRewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','ChapterRewardScroll/ChapterRewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','ChapterRewardScroll/ChapterRewardItem/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','ChapterRewardScroll/ChapterRewardItem/StarPanel/ItemStarPrefab',2},{'Img_Received','ChapterRewardScroll/ChapterRewardItem/Img_Received',2},{'AwardContent','ChapterRewardScroll/AwardContent',2},{'CompletedPanel','CompletedPanel',2},{'Img_Completeddi','CompletedPanel/Img_Completeddi',2},{'CanReceivePanel','CanReceivePanel',2},{'Img_CanReceivedi','CanReceivePanel/Img_CanReceivedi',2},{'TaskContent','ChapterTaskScroll/TaskContent',2},{'Btn_UnTaskceive','Btn_UnTaskceive',2},{'Btn_TaskCeive','Btn_TaskCeive',2},
        -- UITemplate 列表
        {'Activity_ChapterTask01','/',10},{'ChapterTaskItem','ChapterTaskScroll/ChapterTaskItem',10},
        -- RawImage 列表
        {'SwitchScroll','SwitchScroll',15},{'ChapterTaskScroll','ChapterTaskScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchScroll',18},{'ChapterRewardScroll01','ChapterRewardScroll',18},{'ChapterTaskScroll01','ChapterTaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Qieyeming','SwitchScroll/MainPlotSiwtchItem/QieyePanel/Text_Qieyeming',20},{'Text_ChapterTitle','Text_ChapterTitle',20},{'Text_ChapterProgress','Text_ChapterProgress',20},{'Text_ItemCount','ChapterRewardScroll/ChapterRewardItem/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu2','ChapterRewardScroll/ChapterRewardItem/Img_Received/Text_Yilingqu2',20},{'Text_Yilingqu','CompletedPanel/Text_Yilingqu',20},{'Text_Yilingqu01','CanReceivePanel/Text_Yilingqu',20},{'Text_YiJianLingQu','Btn_UnTaskceive/Text_YiJianLingQu',20},{'Text_YiJianLingQu01','Btn_TaskCeive/Text_YiJianLingQu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---完成的任务数量
    self.FinishTaskNum = 0
    ---当前章节按钮
    self.CurItem = nil
    self.CurIdx = 0
    ---成就任务组
    self.taskID = nil
    ---奖励ID
    self.RewardIdx = nil
    
    ---注册滑条
    self:InitScroll()
    ---按钮初始化
    self:InitButton()
    ---添加监听
    self:AddEvent()
end

---注册滑条
function M:InitScroll()
    ---章节滑条
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.ChapterCell))
    ---章节奖励
    self.ChapterRewardScroll01():SetLuaCellEvent(Handle(self, self.AwardCell))
    ---章节任务
    self.ChapterTaskScroll01():SetLuaCellEvent(Handle(self, self.TaskCell))
end

function M:InitButton()
    ---一键领取
    UIEvent.LuaClick(self.Btn_TaskCeive().gameObject,function()
        ActivationTaskViewModel.TaskPerform(0,0,nil,self.taskID,function()
            self:EventCurChapter()
        end)
    end)
    ---领取章节奖励
    UIEvent.LuaClick(self.CanReceivePanel().gameObject,function()
        TaskControl.GetNoviceReward(self,self.RewardIdx,self.ActivityID)
    end)
end

function M:AddEvent()
    Event.Add("Act_ChapterTask",Handle(self,self.EventCurChapter))
end

function M:InitUI()
    ---@type ChapterTaskData[] 章节任务组
    self.ChapterData = ActivityControl.GetChapterTask(self.ActivityID)
    --检查第几阶段(检查阶段奖励有没有领取，领取完才能显示下一阶段)
    self.stageNumber = ActivityControl.TaskStage(self.ActivityID)
    local tStageNumber = self.stageNumber
    if tStageNumber > #self.ChapterData then
        tStageNumber = #self.ChapterData
    end
    self.CurIdx = tStageNumber
    self.SwitchScroll01().totalCount = #self.ChapterData
    if tStageNumber > 4 then
        self.SwitchScroll01():RefillCells(tStageNumber-1,true)
        MgrTimer.AddDelayNoName(0.05,function()
            self.Content().transform.anchoredPosition = Vector2(-172-323*(tStageNumber-5),0)
        end)
    else
        self.SwitchScroll01():RefillCells(0)
    end
end

---奖励状态及完成数量
function M:ChangeAwardState()
    ---任务完成的数量
    self.Text_ChapterProgress().text = self.FinishTaskNum.."/"..#self.allTasks
    self.Img_ChapterProgressBar().fillAmount = self.FinishTaskNum/#self.allTasks
   
    ---奖励领取状态
    if self.FinishTaskNum < #self.allTasks then
        ---不可领取
        self.CompletedPanel().gameObject:SetActive(false)
        self.CanReceivePanel().gameObject:SetActive(false)
    else
        if self.stageNumber > self.CurIdx then
            ---已领取
            self.CompletedPanel().gameObject:SetActive(true)
            self.CanReceivePanel().gameObject:SetActive(false)
        else
            ---可领取
            self.CompletedPanel().gameObject:SetActive(false)
            self.CanReceivePanel().gameObject:SetActive(true)
        end
    end
end

function M:OnUpdateUI(pData)
    self.ActivityID = pData[1]
    self.CurItem = nil
    self.taskID = nil

    self:InitUI()
end
---章节组件
function M:ChapterCell(trans,idx)
    local HighLight = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Qieyedi_H")
    local ChapterName = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_Qieyeming"):GetComponent("TextMeshProUGUI")
    local Btn_Suo = CJNUIMgr.GetSunUseName(trans.gameObject, "Btn_Suo")
    
    ---章节任务名
    ChapterName.text = self.ChapterData[idx].chapterName
    ---章节锁状态
    local tChapterLock = false
    if self.stageNumber >= idx then
        Btn_Suo.gameObject:SetActive(false)
    else
        tChapterLock = true
        Btn_Suo.gameObject:SetActive(true)
    end
    
    UIEvent.LuaClick(trans.gameObject, function()
        if self.CurItem == HighLight then
            return
        end
        ---未解锁
        if tChapterLock then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("artgallery_ui_lock"), 1 }, true)
            return
        end
        self.CurItem.gameObject:SetActive(false)
        self.CurItem = HighLight
        self.CurItem.gameObject:SetActive(true)
        ---成就任务组
        self.taskID = self.ChapterData[idx].taskId
        self.RewardIdx = self.ChapterData[idx].id
        self.CurIdx = idx
        
        ---刷新当前章节数据
        self:RefreshCurChapter(self.ChapterData[idx])
    end)
    ---初始化按钮状态
    if self.CurIdx == idx then
        self.CurItem = HighLight
        self.CurItem.gameObject:SetActive(true)
        ---成就任务组
        self.taskID = self.ChapterData[idx].taskId
        self.RewardIdx = self.ChapterData[idx].id
        self.CurIdx = idx
        
        ---刷新当前章节数据
        self:RefreshCurChapter(self.ChapterData[idx])
    else
        HighLight.gameObject:SetActive(false)
    end
end
---刷新当前章节数据
function M:RefreshCurChapter(_chapterData)
    ---章节背景图
    MgrRes.LoadSprite(self.Img_Chapter(),_chapterData.chapterBg)
    ---@type AchievementTaskData[]  当前章节任务
    self.allTasks = EventRaidViewModel.GetNoviceActivityDataByID(_chapterData.achievementId)
    table.sort(self.allTasks, function(a,b)     --按照是否已完成和已领取排序
        if a.isComplete > b.isComplete then
            return false
        elseif a.isComplete < b.isComplete then
            return true
        else
            if a.isReceive > b.isReceive then
                return true
            elseif a.isReceive < b.isReceive then
                return false
            else
                return a.id < b.id
            end
        end
    end)
    self.ChapterTaskScroll01().totalCount = #self.allTasks
    self.ChapterTaskScroll01():RefillCells(0)
    ---当前章节任务最终奖励
    self.CurReward = _chapterData.chapterReward
    self.ChapterRewardScroll01().totalCount = #self.CurReward
    self.ChapterRewardScroll01():RefillCells(0)
    ---计算任务完成的数量
    self.FinishTaskNum = 0
    local IsCanRec = false
    for i,v in pairs(self.allTasks) do
        if TaskControl.CheckComplete(v.id) then
            self.FinishTaskNum = self.FinishTaskNum+1
        elseif TaskControl.CheckTaskReceived(v) then
            IsCanRec = true
        end
    end
    ---一键领取按钮显隐
    self.Btn_TaskCeive().gameObject:SetActive(IsCanRec)
    self:ChangeAwardState()
end

---任务组件
function M:TaskCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({ self.allTasks[idx] })
end
---奖励道具组件
function M:AwardCell(trans,idx)
    local str = string.split(self.CurReward[idx],"_")
    local goods = {
        goodsType = tonumber(str[1]),
        goodsID = tonumber(str[2]),
        goodsNum = tonumber(str[3])
    }
    local rewardItem = ItemData.New()
    rewardItem:PushData(goods, ItemControl.PushEnum.none)
    local go = trans.gameObject
    local RewardRankImg = CJNUIMgr.GetSunUseName(go, "RewardRankImg"):GetComponent("Image")
    local effect = CJNUIMgr.GetSunUseName(go, "Ui_TX_028").transform
    local RewardIconImg = CJNUIMgr.GetSunUseName(go, "RewardIconImg"):GetComponent("Image")
    local ItemCountText = CJNUIMgr.GetSunUseName(go, "Text_ItemCount"):GetComponent("TextMeshProUGUI")
    local StarPanel = CJNUIMgr.GetSunUseName(go, "StarPanel").gameObject
    local ItemStarRoot = CJNUIMgr.GetSunUseName(go, "ItemStarRoot")
    local ItemStarPrefab = CJNUIMgr.GetSunUseName(go, "ItemStarPrefab").gameObject
    --品质框
    MgrRes.LoadSprite(RewardRankImg,"Quality/ItemRank_"..rewardItem.quality)
    if rewardItem.quality == 2 then
        effect:Find("biankuanglan").gameObject:SetActive(true)
    elseif rewardItem.quality == 3 then
        effect:Find("biankuangzi").gameObject:SetActive(true)
    elseif rewardItem.quality == 4 then
        effect:Find("biankuangcheng").gameObject:SetActive(true)
    end
    --物品图片
    MgrRes.LoadSprite(RewardIconImg,rewardItem.icon)
    --数量
    ItemCountText.text = rewardItem.count
    --星数
    if rewardItem.star == 0 then
        StarPanel:SetActive(false)
    else
        StarPanel:SetActive(true)
        for i = 1, rewardItem.star do
            GameObject.Instantiate(ItemStarPrefab,ItemStarRoot)
        end
    end
    ItemStarPrefab:SetActive(false)
    go:SetActive(true)
    UIEvent.LuaClick(go, Handle(self, function()
        MgrUI.Pop(UID.ItemDetailPop_UI, {rewardItem, false, function()
        end,nil,true }, true)
    end))
end

function M:EventCurChapter()
    self:RefreshCurChapter(self.ChapterData[self.CurIdx])
end

return M