-- Code Auto Create Begin
local M = Class('Activity_SignAll', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_SignAll.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        { 'Activity_SignAll', '/', 2 }, { 'SignItemShow', 'DetailRewardPanel/SignItemShow', 2 }, { 'Img_Dian(qiandao)', 'DetailRewardPanel/SignItemShow/Img_Dian(qiandao)', 2 }, { 'Img_Richangjianglidi', 'DetailRewardPanel/SignItemShow/Img_Richangjianglidi', 2 }, { 'ItemPanel', 'DetailRewardPanel/SignItemShow/ItemPanel', 2 }, { 'SignItemRankImg', 'DetailRewardPanel/SignItemShow/ItemPanel/SignItemRankImg', 2 }, { 'SignItemIconImg', 'DetailRewardPanel/SignItemShow/ItemPanel/SignItemIconImg', 2 }, { 'Img_ItemCountPivot', 'DetailRewardPanel/SignItemShow/ItemPanel/Img_ItemCountPivot', 2 }, { 'Img_ItemCountBg', 'DetailRewardPanel/SignItemShow/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg', 2 }, { 'SignItemScroll', 'SignItemScroll', 2 }, { 'Content', 'SignItemScroll/Content', 2 }, { 'SignBtnPanel', 'SignBtnPanel', 2 }, { 'LeijiShijian', 'SignBtnPanel/LeijiShijian', 2 }, { 'Btn_DailySign', 'SignBtnPanel/Btn_DailySign', 2 }, { 'Btn_DailySignHighLight', 'SignBtnPanel/Btn_DailySignHighLight', 2 },
        -- UITemplate 列表
        { 'Activity_SignAll01', '/', 10 }, { 'SignAllItem', 'SignItemScroll/SignAllItem', 10 },
        -- LoopScrollRect 列表
        { 'SignItemScroll01', 'SignItemScroll', 18 },
        -- TextMeshProUGUI 列表
        { 'Text_Richangjiangli', 'DetailRewardPanel/SignItemShow/Img_Richangjianglidi/Text_Richangjiangli', 20 }, { 'ItemCountText', 'DetailRewardPanel/SignItemShow/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText', 20 }, { 'RewardNameText', 'DetailRewardPanel/SignItemShow/RewardNameText', 20 }, { 'CurTotalSignUpDateText', 'SignBtnPanel/LeijiShijian/CurTotalSignUpDateText', 20 }, { 'DailyBtnText', 'SignBtnPanel/Btn_DailySign/DailyBtnText', 20 }, { 'DailyBtnHighLightText', 'SignBtnPanel/Btn_DailySignHighLight/DailyBtnHighLightText', 20 },
    }
end
-- Code Auto Create End
function M:OnInit()
    self.ActID = nil
    ---签到后端数据
    self.SignData = nil
    ---百日签到配置数据
    self.SignAllData = nil
    ---页签滑条
    self.SignItemScroll01():SetLuaCellEvent(Handle(self, self.SignItem))

    UIEvent.LuaClick(self.Btn_DailySignHighLight().gameObject, function()
        if self.SignData.ableDay == 1 then
            LimitSignControl.ClientLimitSignReq(self.SignData.day + 1, self.ActID, Handle(self, self.RefreshItem))
        end
    end)
end

function M:OnUpdateUI(pData)
    self.ActID = pData[1]

    self.SignData = LimitSignControl.GetSignDataByID(self.ActID)
    self.SignAllData = LimitSignControl.GetSignAllByID(self.ActID)
    self.SignItemScroll01().totalCount = #self.SignAllData
    self.SignItemScroll01():RefillCells()
    
    self.Btn_DailySign().gameObject:SetActive(not RedDotControl.GetDotData("LimitSignAll").State)
    self.Btn_DailySignHighLight().gameObject:SetActive(RedDotControl.GetDotData("LimitSignAll").State)
end

function M:SignItem(trans, idx)
    local _DateText = CJNUIMgr.GetSunUseName(trans.gameObject, "DateText"):GetComponent("TextMeshProUGUI")
    local _RewardCountText = CJNUIMgr.GetSunUseName(trans.gameObject, "RewardCountText"):GetComponent("TextMeshProUGUI")
    local _RewardIcon = CJNUIMgr.GetSunUseName(trans.gameObject, "RewardIconImg"):GetComponent("Image")
    local _TodayRewardBg = CJNUIMgr.GetSunUseName(trans.gameObject, "TodayRewardBg")
    local _OtherRewardBg = CJNUIMgr.GetSunUseName(trans.gameObject, "OtherRewardBg")
    local _TodayReceive = CJNUIMgr.GetSunUseName(trans.gameObject, "TodayReceive")
    local _Select = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Select")

    local day = idx ---哪一天的item
    local count = self.SignData.day ---累计签到数
    local signCfg = self.SignAllData[day]  ---获取配置
    --日期
    _DateText.text = day < 10 and "0" .. day or day
    --道具图标
    MgrRes.LoadSprite(_RewardIcon, "Item/" .. SignViewModel.GetSignRewardIcon(signCfg.reward))
    --获取道具数量
    _RewardCountText.text = JNStrTool.numberAbbr(SignViewModel.GetSignRewardCount(signCfg.reward))
    --是否为累计天
    local time = Global.GetCurTime()
    time = time - 18000
    local isToDay = false
    if count + 1 == day then
        isToDay = true
        self:OnClick(day, false)
    end
    _TodayRewardBg.gameObject:SetActive(isToDay)
    --非累计天
    _OtherRewardBg.gameObject:SetActive(not isToDay)
    --今天是否是已经领取奖励
    _TodayReceive.gameObject:SetActive(day <= count)
    --光标
    _Select.gameObject:SetActive(isToDay)
    --道具详情
    UIEvent.LuaClick(trans.gameObject, function()
        self:OnClick(day, true)
    end)
end

---点击奖励物品
function M:OnClick(day, isClick)
    ---获取配置
    local signCfg = self.SignAllData[day]
    ---获取背景(品质)
    local quality = SignViewModel.GetSignRewardQuality(signCfg.reward)
    MgrRes.LoadSprite(self.SignItemRankImg(), "Item/Rank/ItemRank_" .. quality)
    ---获取图标
    MgrRes.LoadSprite(self.SignItemIconImg(), "Item/" .. SignViewModel.GetSignRewardIcon(signCfg.reward))
    ---获取名称
    self.RewardNameText().text = SignViewModel.GetSignRewardName(signCfg.reward)
    ---获取数量
    self.ItemCountText().text = SignViewModel.GetSignRewardCount(signCfg.reward)
    ---获得背包数据
    if isClick then
        local rewardId = tonumber(string.split(signCfg.reward, "_")[2])
        local rewardType = tonumber(string.split(signCfg.reward, "_")[1])
        local BagItem = ItemControl.GetItemByIdAndType(rewardId, rewardType)
        MgrUI.Pop(UID.ItemDetailPop_UI, { BagItem, false, nil }, true)
    end
end

--刷新
function M:RefreshItem()
    self.SignItemScroll01().totalCount = #self.SignAllData
    self.SignItemScroll01():RefillCells()
    --红点更新
    Event.Go("ActivityDot")
    ---通知ui变更状态
    Event.Go("DailySignRec")
end

return M