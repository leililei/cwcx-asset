-- Code Auto Create Begin
local M = Class('Activity_Zhanshuzhidao', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Zhanshuzhidao.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Zhanshuzhidao','/',2},{'Uncomplete','Right/ProgressBar/Uncomplete',2},{'Complete','Right/ProgressBar/Complete',2},{'Item4','Right/Item4',2},{'RewardRankImg','Right/Item4/RewardRankImg',2},{'RewardIconImg','Right/Item4/RewardIconImg',2},{'StarPanel','Right/Item4/StarPanel',2},{'ItemStarRoot','Right/Item4/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Right/Item4/StarPanel/ItemStarPrefab',2},{'HighLight','Right/Item4/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','Right/Item4/Img_ItemCountBg',2},{'TimeCountDownPanel','Right/Item4/TimeCountDownPanel',2},{'shijian2','Right/Item4/TimeCountDownPanel/shijian2',2},{'AlreadyReceived','Right/Item4/AlreadyReceived',2},{'kuosan','Right/Item4/kuosan',2},{'Item3','Right/Item3',2},{'RewardRankImg01','Right/Item3/RewardRankImg',2},{'RewardIconImg01','Right/Item3/RewardIconImg',2},{'StarPanel01','Right/Item3/StarPanel',2},{'ItemStarRoot01','Right/Item3/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','Right/Item3/StarPanel/ItemStarPrefab',2},{'HighLight01','Right/Item3/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg01','Right/Item3/Img_ItemCountBg',2},{'TimeCountDownPanel01','Right/Item3/TimeCountDownPanel',2},{'shijian201','Right/Item3/TimeCountDownPanel/shijian2',2},{'AlreadyReceived01','Right/Item3/AlreadyReceived',2},{'kuosan01','Right/Item3/kuosan',2},{'Item2','Right/Item2',2},{'RewardRankImg02','Right/Item2/RewardRankImg',2},{'RewardIconImg02','Right/Item2/RewardIconImg',2},{'StarPanel02','Right/Item2/StarPanel',2},{'ItemStarRoot02','Right/Item2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab02','Right/Item2/StarPanel/ItemStarPrefab',2},{'HighLight02','Right/Item2/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg02','Right/Item2/Img_ItemCountBg',2},{'TimeCountDownPanel02','Right/Item2/TimeCountDownPanel',2},{'shijian202','Right/Item2/TimeCountDownPanel/shijian2',2},{'AlreadyReceived02','Right/Item2/AlreadyReceived',2},{'kuosan02','Right/Item2/kuosan',2},{'Item1','Right/Item1',2},{'RewardRankImg03','Right/Item1/RewardRankImg',2},{'RewardIconImg03','Right/Item1/RewardIconImg',2},{'StarPanel03','Right/Item1/StarPanel',2},{'ItemStarRoot03','Right/Item1/StarPanel/ItemStarRoot',2},{'ItemStarPrefab03','Right/Item1/StarPanel/ItemStarPrefab',2},{'HighLight03','Right/Item1/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg03','Right/Item1/Img_ItemCountBg',2},{'TimeCountDownPanel03','Right/Item1/TimeCountDownPanel',2},{'shijian203','Right/Item1/TimeCountDownPanel/shijian2',2},{'AlreadyReceived03','Right/Item1/AlreadyReceived',2},{'kuosan03','Right/Item1/kuosan',2},{'Btn_Qianwang','Btn_Qianwang',2},{'Btn_UnAllReceive','Btn_UnAllReceive',2},{'Btn_Lingqu','Btn_Lingqu',2},
        -- UITemplate 列表
        {'Activity_Zhanshuzhidao01','/',10},{'MissionItem','MissionTeam/MissionItem',10},
        -- LoopScrollRect 列表
        {'MissionTeam','MissionTeam',18},
        -- TextMeshProUGUI 列表
        {'ItemCountText','Right/Item4/Img_ItemCountBg/ItemCountText',20},{'CountDownText','Right/Item4/TimeCountDownPanel/CountDownText',20},{'Text(TMP)','Right/Item4/AlreadyReceived/Text (TMP)',20},{'Text_Index','Right/Item4/Text_Index',20},{'ItemCountText01','Right/Item3/Img_ItemCountBg/ItemCountText',20},{'CountDownText01','Right/Item3/TimeCountDownPanel/CountDownText',20},{'Text(TMP)01','Right/Item3/AlreadyReceived/Text (TMP)',20},{'Text_Index01','Right/Item3/Text_Index',20},{'ItemCountText02','Right/Item2/Img_ItemCountBg/ItemCountText',20},{'CountDownText02','Right/Item2/TimeCountDownPanel/CountDownText',20},{'Text(TMP)02','Right/Item2/AlreadyReceived/Text (TMP)',20},{'Text_Index02','Right/Item2/Text_Index',20},{'ItemCountText03','Right/Item1/Img_ItemCountBg/ItemCountText',20},{'CountDownText03','Right/Item1/TimeCountDownPanel/CountDownText',20},{'Text(TMP)03','Right/Item1/AlreadyReceived/Text (TMP)',20},{'Text_Index03','Right/Item1/Text_Index',20},{'Text_YiJianLingQu','Btn_UnAllReceive/Text_YiJianLingQu',20},{'Text_YiJianLingQu01','Btn_Lingqu/Text_YiJianLingQu',20},
    }
end
-- Code Auto Create End
require("LocalData/TacticsguideactivityLocalData")

function M:OnInit()
    ---所有积分奖励
    self.rewardObjs = {
        self.Item1().gameObject,
        self.Item2().gameObject,
        self.Item3().gameObject,
        self.Item4().gameObject,
    }
    ---积分索引
    self.IndexList = {
        self.Item1().gameObject.transform:Find("Text_Index").gameObject,
        self.Item2().gameObject.transform:Find("Text_Index").gameObject,
        self.Item3().gameObject.transform:Find("Text_Index").gameObject,
        self.Item4().gameObject.transform:Find("Text_Index").gameObject,
    }

    self.progress = {
        1/7,
        3/7,
        5/7,
        7/7,
    }


    self.MissionTeam():SetLuaCellEvent(Handle(self,self.CellItem))
    ---跳转战术引导
    UIEvent.LuaClick(self.Btn_Qianwang().gameObject,function()
        if SysLockControl.CheckSysLock(1109) then
            ---缓存作战所需数据
            StormViewModel.ReloadStormData()
            --MgrUI.ClosePop(UID.HuoDongPop_UI)
            MgrUI.GoHide(UID.GuidePoint_UI)
        else
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1109),1},true)
        end
    end)
    ---一键领取
    UIEvent.LuaClick(self.Btn_Lingqu().gameObject,function()
        if self.CanReceiveCount > 0 then
            ---领取任务
            ActivationTaskViewModel.TaskPerform(0,0,nil,10,function()
                self.CanReceiveCount = 0
                self:Refresh()
                TaskControl.CheckGuide()
                Event.Go("ActivityDot")
            end)
        else
            ---领取奖励
            ActivityControl.RewardSendReq(self.pData,0,0,function()
                self:Refresh()
                TaskControl.CheckGuide()
                Event.Go("ActivityDot")
            end)
        end
    end)
end

function M:OnUpdateUI(pData)
    self.pData = pData[1]
    self:Refresh()
    --self:RefreshReward()
end

function M:Refresh()
    self:ReloadScroll(0)
    self:RefreshReward()
    ---领取按钮是否显示
    local isReceive = false


    for k,v in pairs(TaskControl.GuideDataList) do
        if TaskControl.CheckTaskLock(v) then
            if not TaskControl.CheckComplete(v.id) then
                if TaskControl.CheckTaskReceived(v) then
                    isReceive = true
                    break
                end
            end
        end
    end

    local ActivityReward = RapidJson.decode(ActivityControl.GetActivityInfo(994).reward)

    for i = 1, #TacticsguideactivityLocalData.tab do
        local needItemStr = string.split(TacticsguideactivityLocalData.tab[i][7],"_")
        local needItem = ItemControl.GetItemByIdAndType(tonumber(needItemStr[2]),tonumber(needItemStr[1]))

        local rewardData = nil
        if ActivityReward == nil then
            rewardData = nil
        else
            rewardData = ActivityReward[tostring(i)]
        end

        if needItem.count >= tonumber(needItemStr[3])  and rewardData == nil then
            isReceive = true
        end
    end

    self.Btn_UnAllReceive().gameObject:SetActive(not isReceive)
    self.Btn_Lingqu().gameObject:SetActive(isReceive)


    -- self.Btn_UnAllReceive().gameObject:SetActive(self.CanReceiveCount == 0 and self.rewardCount <= self.receivedRewardCount)
    -- self.Btn_Lingqu().gameObject:SetActive(self.CanReceiveCount > 0 or self.rewardCount > self.receivedRewardCount)
end

function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.missionList[idx],self})
end

---刷新任务滑块
function M:ReloadScroll(offset)
    self.valueList = {}
    self.CanReceiveCount = 0   --可领取
    self.rewardCount = 0
    self.receivedRewardCount = 0
    self.ActivityReward = RapidJson.decode(ActivityControl.GetActivityInfo(994).reward)
    if self.ActivityReward then
        for i = 1, #self.rewardObjs do
            if self.ActivityReward[tostring(i)] ~= nil then
                self.receivedRewardCount = self.receivedRewardCount + 1
            end
        end
    end

    self.missionList = TaskControl.GetGuideTask()  --获取战术指导任务
    table.sort(self.missionList, function(a,b)     --按照是否已完成和已领取排序
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

    self.MissionTeam().totalCount = #self.missionList
    if offset then
        self.MissionTeam():RefillCells(offset)
    else
        self.MissionTeam():RefreshCells()
    end
end

function M:RefreshReward()
    ---总积分
    self.score = 0
    ---所需道具
    self.needCount = {}
    --self.ActivityReward = RapidJson.decode(ActivityControl.GetActivityInfo(994).reward)
    for i = 1, #self.rewardObjs do
        local needItemStr = string.split(TacticsguideactivityLocalData.tab[i][7],"_")
        local rewardStr = string.split(TacticsguideactivityLocalData.tab[i][8],"_")
        self.needItem = ItemControl.GetItemByIdAndType(tonumber(needItemStr[2]),tonumber(needItemStr[1]))
        local reward = ItemControl.GetItemByIdAndType(tonumber(rewardStr[2]),tonumber(rewardStr[1]))
        local rewardData = nil
        if self.ActivityReward == nil then
            rewardData = nil
        else
            rewardData = self.ActivityReward[tostring(i)]
        end
        if tonumber(needItemStr[3]) > self.score then
            self.score = tonumber(needItemStr[3])
        end
        table.insert(self.needCount,tonumber(needItemStr[3]))
        ---UI
        local Icon = self.rewardObjs[i].transform:Find("RewardIconImg").transform:GetComponent("Image")
        local Frame = self.rewardObjs[i].transform:Find("RewardRankImg").transform:GetComponent("Image")
        local count = self.rewardObjs[i].transform:Find("Img_ItemCountBg").transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
        local Received = self.rewardObjs[i].transform:Find("AlreadyReceived").gameObject
        local index = self.rewardObjs[i].transform:Find("Text_Index").transform:GetComponent("TextMeshProUGUI")
        local kuosan = self.rewardObjs[i].transform:Find("kuosan").gameObject
        ---设置品质
        MgrRes.LoadSprite(Frame, "Item/Rank/ItemRank_" .. reward.quality)
        ---设置图标
        MgrRes.LoadSprite(Icon,reward.icon)
        ---设置数量
        count.text = tonumber(rewardStr[3])
        ---设置索引
        index.text = tonumber(needItemStr[3])
        table.insert(self.valueList,tonumber(needItemStr[3]))
        ---已领取是否显示
        Received:SetActive(rewardData ~= nil)
        if self.needItem.count >= tonumber(needItemStr[3]) and rewardData == nil then
            kuosan:SetActive(true)
        else
            kuosan:SetActive(false)
        end
        ---点击逻辑
        UIEvent.LuaClick(self.rewardObjs[i],function()
            if self.needItem.count < tonumber(needItemStr[3]) then
                MgrUI.Pop(UID.ItemDetailPop_UI, { reward, false, nil}, true)
            else
                ---如果数量满足条件
                if self.needItem.count >= tonumber(needItemStr[3]) then
                    ActivityControl.RewardSendReq(self.pData,i,0,function()
                        --self:RefreshReward()
                        Received:SetActive(true)
                        kuosan:SetActive(false)
                        self:Refresh()
                    end)
                end
            end

        end)
    end

    ---刷新进度条
    self:RefreshProgress()
end

function M:RefreshProgress()
    local nextIndex = 0
    for i = 1,#self.valueList do
        nextIndex = i + 1 > #self.valueList and #self.valueList or i + 1
        ---如果大于最大数量
        if self.needItem.count >= self.valueList[#self.valueList] then
            self.Complete().fillAmount = 1
            self.rewardCount = #self.valueList  ---最大奖励数
        else
            ---小于第一个并且数量不等于0
            if self.needItem.count < self.valueList[1] and self.needItem.count ~= 0 then
                self.Complete().fillAmount = 0.07
                self.rewardCount = 0 ---奖励数0
            elseif self.needItem.count == 0 then
                self.Complete().fillAmount = 0
                self.rewardCount = 0 ---奖励数0
            else
                ---如果相等
                if self.needItem.count == self.valueList[i] then
                    self.Complete().fillAmount = self.progress[i]
                    self.rewardCount = self.rewardCount + 1 ---奖励数+1
                elseif self.needItem.count > self.valueList[i] and self.needItem.count < self.valueList[#self.valueList] then
                    self.Complete().fillAmount = self.progress[i] + 0.14
                    self.rewardCount = self.rewardCount + 1 ---奖励数+1
                end
            end
        end
    end
end

return M