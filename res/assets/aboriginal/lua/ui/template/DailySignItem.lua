-- Code Auto Create Begin
local M = Class('DailySignItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/DailySignItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'TodayRewardBg','TodayRewardBg',2},{'OtherRewardBg','OtherRewardBg',2},{'RewardIconImg','RewardIconImg',2},{'TodayReceive','TodayReceive',2},{'Img_Receivedi','TodayReceive/Img_Receivedi',2},{'OtherReceive','OtherReceive',2},{'Img_Receivedi01','OtherReceive/Img_Receivedi',2},{'Img_Select','Img_Select',2},{'RewardCountBgPrefab','RewardCountBgPrefab',2},
        -- UITemplate 列表
        {'DailySignItem','/',10},
        -- Toggle 列表
        {'DailySignItem01','/',13},
        -- TextMeshProUGUI 列表
        {'DateText','DateText',20},{'ReceiveText','TodayReceive/ReceiveText',20},{'ReceiveText01','OtherReceive/ReceiveText',20},{'RewardCountText','RewardCountBgPrefab/RewardCountText',20},
    }
end
-- Code Auto Create End
---月签到Item
function M:OnUpdateUI(pData)
    ---更新数据
    local day = pData[1] ---哪一天的item
    local count = pData[2] ---累计签到数
    local signNum = SignViewModel.GetCumulativeSign() ---当前签到天数
    local signCfg = SignViewModel.GetMonthLocalData()[day]  ---获取配置
    ---日期
    self.DateText().text = day < 10 and "0"..day or day
    ---道具图标
    MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..SignViewModel.GetSignRewardIcon(signCfg.reward))
    ---获取道具数量
    self.RewardCountText().text = JNStrTool.numberAbbr(SignViewModel.GetSignRewardCount(signCfg.reward))
    ---是否为累计天
    local time = MgrNet.GetServerTime()
    time = time - 18000
    --local tSignCount = SignViewModel.SignData[tonumber(os.date("%d",time))] == 0 and count + 1 or count
    local isToDay = false
    if count + 1 == day then
        isToDay = true
    end
    self.TodayRewardBg().gameObject:SetActive(isToDay)
    ---非累计天
    self.OtherRewardBg().gameObject:SetActive(not isToDay)
    ---今天是否是已经领取奖励
    self.TodayReceive().gameObject:SetActive(day <= count)
    ---其他天是否已领取奖励
    --self.OtherReceive().gameObject:SetActive(day <= count)
    ---光标
    self.Img_Select().gameObject:SetActive(false)
    self.Img_Select().gameObject:SetActive(isToDay)
end
return M