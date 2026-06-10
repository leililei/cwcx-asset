-- Code Auto Create Begin
local M = Class('DailySign_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DailySign_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DailySign_UI].prefab'
    self.Name = 'Form[DailySign_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_CloseSign','Btn_CloseSign',2},{'BackGroundPanel','BackGroundPanel',2},{'SignBgImg','BackGroundPanel/SignBgImg',2},{'zidi','BackGroundPanel/zidi',2},{'LeftPanel','LeftPanel',2},{'TimePanel','LeftPanel/TimePanel',2},{'SignItemShow','LeftPanel/DetailRewardPanel/SignItemShow',2},{'Img_Dian(qiandao)','LeftPanel/DetailRewardPanel/SignItemShow/Img_Dian(qiandao)',2},{'Img_Richangjianglidi','LeftPanel/DetailRewardPanel/SignItemShow/Img_Richangjianglidi',2},{'ItemPanel','LeftPanel/DetailRewardPanel/SignItemShow/ItemPanel',2},{'SignItemRankImg','LeftPanel/DetailRewardPanel/SignItemShow/ItemPanel/SignItemRankImg',2},{'SignItemIconImg','LeftPanel/DetailRewardPanel/SignItemShow/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot','LeftPanel/DetailRewardPanel/SignItemShow/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','LeftPanel/DetailRewardPanel/SignItemShow/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'SignItemShow2','LeftPanel/DetailRewardPanel/SignItemShow2',2},{'Img_Dian(qiandao)01','LeftPanel/DetailRewardPanel/SignItemShow2/Img_Dian(qiandao)',2},{'Img_Yuekajianglidi','LeftPanel/DetailRewardPanel/SignItemShow2/Img_Yuekajianglidi',2},{'ItemPanel01','LeftPanel/DetailRewardPanel/SignItemShow2/ItemPanel',2},{'SignItemRankImg01','LeftPanel/DetailRewardPanel/SignItemShow2/ItemPanel/SignItemRankImg',2},{'SignItemIconImg01','LeftPanel/DetailRewardPanel/SignItemShow2/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot01','LeftPanel/DetailRewardPanel/SignItemShow2/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg01','LeftPanel/DetailRewardPanel/SignItemShow2/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'SelectImg','LeftPanel/DetailRewardPanel/SelectImg',2},{'RewardScrollRoot','LeftPanel/RewardScrollRoot',2},{'SignBtnPanel','SignBtnPanel',2},{'leijiqiandaodi','SignBtnPanel/leijiqiandaodi',2},{'Btn_DailySign','SignBtnPanel/Btn_DailySign',2},{'Btn_DailySignHighLight','SignBtnPanel/Btn_DailySignHighLight',2},{'ClickToSign','ClickToSign',2},
        -- Button 列表
        {'Btn_CloseSign01','Btn_CloseSign',4},
        -- UITemplate 列表
        {'DailySignItem','LeftPanel/DailySignItem',10},
        -- Toggle 列表
        {'DailySignItem01','LeftPanel/DailySignItem',13},
        -- TextMeshProUGUI 列表
        {'CloseSignBtnText','Btn_CloseSign/CloseSignBtnText',20},{'SignTitleNameText','BackGroundPanel/zidi/SignTitleNameText',20},{'SignTitleMonthText','BackGroundPanel/zidi/SignTitleMonthText',20},{'TimeRemainText','LeftPanel/TimePanel/TimeRemainText',20},{'Text_Richangjiangli','LeftPanel/DetailRewardPanel/SignItemShow/Img_Richangjianglidi/Text_Richangjiangli',20},{'ItemCountText','LeftPanel/DetailRewardPanel/SignItemShow/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText',20},{'RewardNameText','LeftPanel/DetailRewardPanel/SignItemShow/RewardNameText',20},{'Text_Yuekajiangli','LeftPanel/DetailRewardPanel/SignItemShow2/Img_Yuekajianglidi/Text_Yuekajiangli',20},{'ItemCountText01','LeftPanel/DetailRewardPanel/SignItemShow2/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText',20},{'RewardNameText01','LeftPanel/DetailRewardPanel/SignItemShow2/RewardNameText',20},{'RewardRemainDayText','LeftPanel/DetailRewardPanel/SignItemShow2/RewardRemainDayText',20},{'DailyBtnText','SignBtnPanel/Btn_DailySign/DailyBtnText',20},{'DailyBtnHighLightText','SignBtnPanel/Btn_DailySignHighLight/DailyBtnHighLightText',20},{'CurTotalSignUpDateText','SignBtnPanel/CurTotalSignUpDateText',20},
    }
end
-- Code Auto Create End
---月签到
function M:OnInit()
    ---奖励组
    self.ToggleObjs = {}
    ---初始化时钟
    self:InitClock()
    ---初始化事件
    self:InitClick()
    ---自动签到
    --self.SignEvent.OnClick()
    --SignViewModel.AutoSign =  Handle(self,SignViewModel.SendSign)
    ---新的一个月
    self.newMonthComing = false
end
---刷新
function M:OnUpdateUI()
    ---重置文本
    self:ReloadText()
    ---重置签到Toggle
    self:ReloadItems()

    local time = MgrNet.GetServerTime()
    ---是否显示月卡
    if PlayerControl.GetPlayerData().monthCardRemaining + PlayerControl.GetPlayerData().monthCardBuyTime > time then
        --月卡生效
        self.SignItemShow2().gameObject:SetActive(true)
    else
        --月卡失效
        self.SignItemShow2().gameObject:SetActive(false)
    end

    local remainDay = math.modf(tonumber(PlayerControl.GetPlayerData().monthCardRemaining / 86400 + 1))
    self.RewardRemainDayText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_surplus") .. remainDay .. MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")


    self.Btn_DailySignHighLight().gameObject:SetActive(not PlayerControl.GetPlayerData().monthSignFlag)
    self.ClickToSign().gameObject:SetActive(not PlayerControl.GetPlayerData().monthSignFlag)
end
---关闭
function M:OnClose()
    MgrTimer.Cancel("DailySignClock")
    MgrUI.ClosePop(UID.ItemDetailPop_UI)
end
---初始化时钟
function M:InitClock()
    MgrTimer.AddRepeat("DailySignClock", 1, Handle(self,function()
        local leftTime = ActivationTaskViewModel.GetLastTime("TODAY")
        local hour =  math.floor(leftTime/3600)
        local min = math.floor((leftTime - hour*3600) /60)
        local sec = math.floor((leftTime - hour*3600 - min * 60))
        self.TimeRemainText().text = hour ..":".. min ..":".. sec
        if leftTime == 0 then
            self:ReloadText()
        end
    end) , -1, nil)
    -----时钟
    --self.curTime = MgrNet.GetServerTime() ---获取服务器时间
    --
    --local nowTime = os.date("!*t",self.curTime + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    ----计算今天重置后已过去的时间
    ----local passedSecond = (nowTime.hour - 5)*3600 + nowTime.min * 60 + nowTime.sec
    --local min = tonumber(59-nowTime.min) < 10 and "0"..tonumber(59-nowTime.min) or tonumber(59-nowTime.min)
    --self.TimeRemainText().text = tostring((28-nowTime.hour)%24) ..":".. min ..":".. tostring(59-nowTime.sec)
    ----self.TimeRemainText().text = os.date("%X",self.curTime)
    --self.dayNum = tonumber(os.date("%d",self.curTime)) ---获取当前天
    --if tonumber(os.date("%d",self.curTime)) ~= self.dayNum then
    --    self.dayNum = tonumber(os.date("%d",self.curTime))
    --    self:ReloadText()
    --end
    -----
    --MgrTimer.AddRepeat("DailySignClock", 1, Handle(self,function()
    --    self.curTime = self.curTime + 1
    --    local nowTime = os.date("!*t",self.curTime + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    --    local sec = (59-nowTime.sec) < 10 and "0" .. tostring(59-nowTime.sec) or tostring(59-nowTime.sec)
    --    local min = tonumber(59-nowTime.min) < 10 and "0"..tonumber(59-nowTime.min) or tonumber(59-nowTime.min)
    --    self.TimeRemainText().text = tostring((28-nowTime.hour)%24) ..":".. min ..":".. sec
    --    if tonumber(os.date("%d",self.curTime)) == 1 and tonumber(os.date("%H",self.curTime)) == 5 and tonumber(os.date("%M",self.curTime)) == 0 and tonumber(os.date("%S",self.curTime)) == 0 then ---新的一天
    --        ---重新获取当前日期
    --        self.dayNum = tonumber(os.date("%d",self.curTime))
    --        if self.dayNum == 1 then
    --            self.newMonthComing = true  ---新的一个月
    --        else
    --            self.newMonthComing = false
    --        end
    --        ---如果越过了天则重置文本
    --        self:ReloadText()
    --        ---重置签到物品
    --        self:ReloadItems()
    --    end
    --end) , -1, nil)
end
---初始化事件
function M:InitClick()
    ---返回点击
    UIEvent.LuaClick(self.Btn_CloseSign().gameObject,SignViewModel.Close)
    ---签到点击
    --UIEvent.LuaClick(self.Btn_DailySignHighLight().gameObject,Handle(self,SignViewModel.SendSign))
    UIEvent.LuaClick(self.ClickToSign().gameObject,Handle(self,SignViewModel.SendSign))
end
---重置文本
function M:ReloadText()
    self.SignTitleNameText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_month")
    self.SignTitleMonthText().text = tonumber(os.date("%m",MgrNet.GetServerTime() - 18000 + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
    self.DailyBtnText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_already")
    self.DailyBtnHighLightText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_click")
    if self.newMonthComing then
        self.newMonthComing = false
        SignViewModel.SignData = 0
        PlayerControl.GetPlayerData():PushMonthSignBool(true)
    end
    local cumulative = string.format(MgrLanguageData.GetLanguageByKey("dailysign_ui_signin_cumulative"),SignViewModel.SignData)
    self.CurTotalSignUpDateText().text = cumulative

    ---总共多少天
    local totalDays = Global.GetTotalDays()
    if SignViewModel.SignData >= totalDays then
        self.SignItemShow().gameObject:SetActive(false)
    else
        self.SignItemShow().gameObject:SetActive(true)
        ---显示下一次签到的物品
        --self:OnToggleClick(count + 1)
        ---获取配置
        local signCfg = SignViewModel.GetMonthLocalData()[SignViewModel.SignData + 1]
        ---获取背景(品质)
        local quality = SignViewModel.GetSignRewardQuality(signCfg.reward)
        MgrRes.LoadSprite(self.SignItemRankImg(),"Item/Rank/ItemRank_"..quality)
        ---获取图标
        MgrRes.LoadSprite(self.SignItemIconImg(),"Item/"..SignViewModel.GetSignRewardIcon(signCfg.reward))
        ---获取名称
        self.RewardNameText().text=SignViewModel.GetSignRewardName(signCfg.reward)
        ---获取数量
        self.ItemCountText().text=SignViewModel.GetSignRewardCount(signCfg.reward)
    end
--[[
    self.YearMonthText().text = os.date("%Y年%m月",self.curTime)
    self.DayText().text = self.dayNum < 10 and "0"..self.dayNum or self.dayNum
    self.Day().text = "日"]]
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
            Tools.ToggleValueChange(self.ToggleObjs[day]:GetComponent("Toggle"),Handle(self, function(isOn)
                if isOn then
                    self:OnToggleClick(day)
                end
            end),nil)
        end

        ---更新Item数据
        local count = SignViewModel.SignData
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
    ---获取背景(品质)
    local quality = SignViewModel.GetSignRewardQuality(signCfg.reward)
    MgrRes.LoadSprite(self.SignItemRankImg(),"Item/Rank/ItemRank_"..quality)
    ---获取图标
    MgrRes.LoadSprite(self.SignItemIconImg(),"Item/"..SignViewModel.GetSignRewardIcon(signCfg.reward))
    ---获取名称
    self.RewardNameText().text=SignViewModel.GetSignRewardName(signCfg.reward)
    ---获取数量
    self.ItemCountText().text=SignViewModel.GetSignRewardCount(signCfg.reward)
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