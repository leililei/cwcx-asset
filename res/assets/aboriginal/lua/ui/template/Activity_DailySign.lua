-- Code Auto Create Begin
local M = Class('Activity_DailySign', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_DailySign.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_DailySign','/',2},{'SignItemShow','DetailRewardPanel/item/SignItemShow',2},{'LeftPanel','LeftPanel',2},{'RewardScrollRoot','LeftPanel/RewardScrollRoot',2},{'SignBtnPanel','SignBtnPanel',2},{'Time','SignBtnPanel/Time',2},{'LeijiShijian','SignBtnPanel/LeijiShijian',2},{'Btn_DailySign','SignBtnPanel/Btn_DailySign',2},{'Btn_DailySignHighLight','SignBtnPanel/Btn_DailySignHighLight',2},{'ClickToSign','ClickToSign',2},
        -- UITemplate 列表
        {'Activity_DailySign01','/',10},{'SignItemShow01','DetailRewardPanel/item/SignItemShow',10},{'DailySignItem','LeftPanel/DailySignItem',10},
        -- Toggle 列表
        {'DailySignItem01','LeftPanel/DailySignItem',13},
        -- LoopScrollRect 列表
        {'DetailRewardPanel','DetailRewardPanel',18},
        -- TextMeshProUGUI 列表
        {'SignTitleNameText','SignBtnPanel/Yue/SignTitleNameText',20},{'SignTitleMonthText','SignBtnPanel/Yue/SignTitleMonthText',20},{'TimeRemainText','SignBtnPanel/Time/TimeRemainText',20},{'CurTotalSignUpDateText','SignBtnPanel/LeijiShijian/CurTotalSignUpDateText',20},{'DailyBtnText','SignBtnPanel/Btn_DailySign/DailyBtnText',20},{'DailyBtnHighLightText','SignBtnPanel/Btn_DailySignHighLight/DailyBtnHighLightText',20},
    }
end
-- Code Auto Create End
---月签到
function M:OnInit()
    self.ClickToSign().gameObject:SetActive(false)
    ---奖励组
    self.ToggleObjs = {}
    ---初始化时钟
    self:InitClock()
    ---初始化事件
    self:InitClick()
    ---新的一个月
    self.newMonthComing = false
    
    Event.Add("DailySignRec",Handle(self,self.ReceiveChange))
    self.DetailRewardPanel():SetLuaCellEvent(Handle(self, self.OnDetailRewardRender));
end
---刷新
function M:OnUpdateUI()
    ---重置文本
    self:ReloadText()
    ---重置签到Toggle
    self:ReloadItems()
end

---初始化时钟
function M:InitClock()
    local leftTime = ActivationTaskViewModel.GetLastTime("TODAY")
    local hour =  math.floor(leftTime/3600)
    local min = math.floor((leftTime - hour*3600) /60)
    local sec = math.floor((leftTime - hour*3600 - min * 60))
    self.TimeRemainText().text = (hour < 10 and "0".. hour or hour) ..":".. (min < 10 and "0".. min or min) ..":".. (sec < 10 and "0".. sec or sec)
    MgrTimer.AddRepeat("DailySignClock", 1, Handle(self,function()
        local leftTime = ActivationTaskViewModel.GetLastTime("TODAY")
        local hour =  math.floor(leftTime/3600)
        local min = math.floor((leftTime - hour*3600) /60)
        local sec = math.floor((leftTime - hour*3600 - min * 60))
        self.TimeRemainText().text = (hour < 10 and "0".. hour or hour) ..":".. (min < 10 and "0".. min or min) ..":".. (sec < 10 and "0".. sec or sec)
        print("daojishi ".. leftTime)
        if leftTime == 0 or leftTime == 86400 then
            self:ReloadText()
        end
    end) , -1, nil)
end
---初始化事件
function M:InitClick()
    ---签到点击
    UIEvent.LuaClick(self.Btn_DailySignHighLight().gameObject,Handle(self,SignViewModel.SendSign))
end
---重置文本
function M:ReloadText(day)
    self.SignTitleNameText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_month")
    self.SignTitleMonthText().text = tonumber(os.date("%m",MgrNet.GetServerTime() - 18000 + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
    self.DailyBtnText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_already")
    self.DailyBtnHighLightText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_click")
    if self.newMonthComing then
        self.newMonthComing = false
        SignViewModel.SignData = 0
        PlayerControl.GetPlayerData():PushMonthSignBool(true)
    end
    SignViewModel.SignData = PlayerControl.GetMonthSignData()
    local cumulative = string.format(MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_cumulative"),SignViewModel.SignData)
    self.CurTotalSignUpDateText().text = cumulative

    self.Btn_DailySignHighLight().gameObject:SetActive(PlayerControl.GetPlayerData().monthSignFlag)
    self.allRewards = {};
    ---总共多少天
    local totalDays = Global.GetTotalDays()
    if SignViewModel.SignData < totalDays then
        local signCfg = SignViewModel.GetMonthLocalData()[SignViewModel.SignData + 1]
        if nil ~= day then
            signCfg = SignViewModel.GetMonthLocalData()[day];
        end
        table.insert(self.allRewards, {
            type = 1,
            reward = signCfg.reward,
        });
    end
    ---月卡
    if PlayerControl.GetPlayerData().monthCardRemaining > 0 then
        local rewards = string.split(SteamLocalData.tab[111004][2],",")
        for _, reward in pairs(rewards) do
            table.insert(self.allRewards, {
                type = 2,
                remainDay = PlayerControl.GetPlayerData().monthCardRemaining;    -- 剩余时间
                reward = reward,
            });
        end
    end
    -- 体力月卡
    if PlayerControl.GetPlayerData():GetNewMonthCardRemaining(110003) > 0 then
        local rewards = string.split(SteamLocalData.tab[111025][2],",")
        for _, reward in pairs(rewards) do
            table.insert(self.allRewards, {
                type = 3,
                remainDay = PlayerControl.GetPlayerData():GetNewMonthCardRemaining(110003);    -- 剩余时间
                reward = reward,
            });
        end
    end
    self.DetailRewardPanel().totalCount = #self.allRewards;
    self.DetailRewardPanel():RefillCells();
end
function M:OnDetailRewardRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.allRewards[idx], self});
end
---重置签到物品
function M:ReloadItems()
    self.DailySignItem().gameObject:SetActive(true)
    for day = 1, Global.GetTotalDays() do
        if not self.ToggleObjs[day] then
            ---不存在则创建Obj
            self.ToggleObjs[day] = GameObject.Instantiate(self.DailySignItem().gameObject,self.RewardScrollRoot().gameObject.transform,false)
            --self.ToggleObjs[day].transform:GetComponent("Toggle").isOn = false
            ---添加事件
            Tools.ToggleValueChange(self.ToggleObjs[day]:GetComponent("Toggle"),function(isOn)
                if isOn then
                    self:OnToggleClick(day)
                end
            end,nil)
        end

        ---更新Item数据
        local count = PlayerControl.GetMonthSignData()
        self.ToggleObjs[day]:GetComponent("UITemplate"):SetData({day,count})
    end
    ---选择累计天的图标
    --self.ToggleObjs[SignViewModel.GetCumulativeSign() + 1]:GetComponent("Toggle").isOn = true
    self.DailySignItem().gameObject:SetActive(false)
end
---点击奖励物品
function M:OnToggleClick(day)
    ---获取配置
    local signCfg = SignViewModel.GetMonthLocalData()[day]
    self:ReloadText(day);
    ---获得背包数据
    local rewardId = tonumber(string.split(signCfg.reward,"_")[2])
    local rewardType = tonumber(string.split(signCfg.reward,"_")[1])
    local BagItem = ItemControl.GetItemByIdAndType(rewardId,rewardType)
    MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem, false, function() end},true)
end
---签到完成
function M:ReceiveChange()
    self.Btn_DailySignHighLight().gameObject:SetActive(false)
    ---重置文本
    self:ReloadText()
    ---重置签到Toggle
    self:ReloadItems()
end

return M