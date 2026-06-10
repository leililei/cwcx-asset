-- Code Auto Create Begin
local M = Class('Activity_ItemSign', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_ItemSign.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_ItemSign','/',2},{'Img_di','Img_di',2},{'Img_Light','Img_Light',2},{'Img_Dian','Img_Dian',2},{'Img_Tiao','Img_Tiao',2},{'ItemPanel','DetailRewardPanel/ItemPanel',2},{'SignItemRankImg','DetailRewardPanel/ItemPanel/SignItemRankImg',2},{'SignItemIconImg','DetailRewardPanel/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot','DetailRewardPanel/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','DetailRewardPanel/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao','DetailRewardPanel/ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi','DetailRewardPanel/ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},{'Img_Gou','Img_Gou',2},{'ClickToSign','ClickToSign',2},{'Btn_DailySign','Btn_DailySign',2},{'Img_dark','Img_dark',2},
        -- UITemplate 列表
        {'Activity_ItemSign01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Num','Text_Num',20},{'Text_Day','Text_Day',20},{'Text_SignInBonus','Text_SignInBonus',20},{'Text_ItemCount','DetailRewardPanel/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu','DetailRewardPanel/ItemPanel/Img_Zhezhao/Text_Yilingqu',20},{'Text_RewardName','DetailRewardPanel/Text_RewardName',20},{'Text_RewardNum','DetailRewardPanel/Text_RewardNum',20},{'Text_LingQu','Btn_DailySign/Text_LingQu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_dark().gameObject:SetActive(false)
    self.Img_Light().gameObject:SetActive(false)
    self.ClickToSign().gameObject:SetActive(false)
end

function M:OnUpdateUI(pData)
    self.day = pData[1] ---天数
    self.CurSignState = pData[2] ---所对应的当天签到状态
    isToDay = pData[3] ---是否为签到当天

    ---天数
    self.Text_Num().text = "0"..self.day
    if isToDay then
        if self.CurSignState == true then
            self.Btn_DailySign().gameObject:SetActive(false)
            self.ClickToSign().gameObject:SetActive(false)
            --已签到图标
            self.Img_Gou().gameObject:SetActive(true)
            --道具遮罩
            self.Img_Zhezhao().gameObject:SetActive(true)
            self.Img_dark().gameObject:SetActive(true)
        else
            self.Img_Gou().gameObject:SetActive(false)
            self.Img_Zhezhao().gameObject:SetActive(false)
            self.Img_dark().gameObject:SetActive(false)
            
            self.Img_Light().gameObject:SetActive(true)
            self.ClickToSign().gameObject:SetActive(true)
            self.Btn_DailySign().gameObject:SetActive(true)
            ---签到
            UIEvent.LuaClick(self.ClickToSign().gameObject,Handle(self,function()
                SignViewModel.SendWeekSign(self)
            end))
        end
    elseif self.CurSignState == true then
        self.Img_Light().gameObject:SetActive(false)
        self.Btn_DailySign().gameObject:SetActive(false)
        self.ClickToSign().gameObject:SetActive(false)
        --已签到图标
        self.Img_Gou().gameObject:SetActive(true)
        self.Img_Zhezhao().gameObject:SetActive(true)
        self.Img_dark().gameObject:SetActive(true)
    else
        --背景高亮
        self.Img_Light().gameObject:SetActive(false)
        --已签到图标
        self.Img_Gou().gameObject:SetActive(false)
        --领取按钮
        self.Btn_DailySign().gameObject:SetActive(false)
        --道具遮罩
        self.Img_Zhezhao().gameObject:SetActive(false)
        self.Img_dark().gameObject:SetActive(false)
        --签到按钮
        self.ClickToSign().gameObject:SetActive(false)
    end
    ---展示道具数据
    self.mSignCfg = SignViewModel.GetWeekLocalData()[self.day]
    ---获取背景(品质)
    local quality = SignViewModel.GetSignRewardQuality(self.mSignCfg.reward)
    MgrRes.LoadSprite(self.SignItemRankImg(),"Item/Rank/ItemRank_"..quality)
    ---获取图标
    MgrRes.LoadSprite(self.SignItemIconImg(),"Item/"..SignViewModel.GetSignRewardIcon(self.mSignCfg.reward))
    ---获取名称
    self.Text_RewardName().text = SignViewModel.GetSignRewardName(self.mSignCfg.reward)
    ---获取数量
    self.Text_ItemCount().text = SignViewModel.GetSignRewardCount(self.mSignCfg.reward)
    self.Text_RewardNum().text = "x"..SignViewModel.GetSignRewardCount(self.mSignCfg.reward)

    ---点击道具展示
    UIEvent.LuaClick(self.ItemPanel().gameObject,Handle(self,self.ItemDataClick))
end

---签到完成
function M:ReceiveChange()
    self.Btn_DailySign().gameObject:SetActive(false)
    self.Img_Light().gameObject:SetActive(false)
    self.Img_Zhezhao().gameObject:SetActive(true)
    self.Img_dark().gameObject:SetActive(true)
    self.Img_Gou().gameObject:SetActive(true)
    
    self.ClickToSign().gameObject:SetActive(false)
end

---点击道具展示
function M:ItemDataClick()
    ---获得背包数据
    local rewardId = tonumber(string.split(self.mSignCfg.reward,"_")[2])
    local rewardType = tonumber(string.split(self.mSignCfg.reward,"_")[1])
    local BagItem = ItemControl.GetItemByIdAndType(rewardId,rewardType)
    MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem, false, function() end},true)
end

return M