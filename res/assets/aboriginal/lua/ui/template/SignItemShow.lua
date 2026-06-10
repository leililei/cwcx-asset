-- Code Auto Create Begin
local M = Class('SignItemShow', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SignItemShow.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SignItemShow','/',2},{'Img_Dian(qiandao)','Img_Dian(qiandao)',2},{'Img_Yuekajianglidi','Img_Yuekajianglidi',2},{'ItemPanel','ItemPanel',2},{'SignItemRankImg2','ItemPanel/SignItemRankImg2',2},{'SignItemIconImg2','ItemPanel/SignItemIconImg2',2},{'Img_ItemCountPivot','ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},
        -- UITemplate 列表
        {'SignItemShow01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Yuekajiangli','Img_Yuekajianglidi/Text_Yuekajiangli',20},{'ItemCountText2','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText2',20},{'RewardNameText2','RewardNameText2',20},{'RewardRemainDayText','RewardRemainDayText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
end

function M:OnUpdateUI(pData)
    local type = pData[1].type;
    local reward = pData[1].reward;
    local rewardStr = string.split(reward,"_")
    local cardReward = ItemControl.GetItemByIdAndType(tonumber(rewardStr[2]),tonumber(rewardStr[1]))
    ---获取背景(品质)
    MgrRes.LoadSprite(self.SignItemRankImg2(),cardReward.iconFrame)
    ---获取图标
    MgrRes.LoadSprite(self.SignItemIconImg2(),cardReward.icon)
    ---获取名称
    self.RewardNameText2().text = cardReward.name
    ---获取数量
    self.ItemCountText2().text = tonumber(rewardStr[3])
    if 1 == type then
        self.Img_Yuekajianglidi().color = Color(1, 1, 1, 1);
        self.Text_Yuekajiangli().text = MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips6");
        self.RewardRemainDayText().gameObject:SetActive(false);
    else
        self.Img_Yuekajianglidi().color = Color(0, 1, 1, 1);
        self.RewardRemainDayText().gameObject:SetActive(true);
        self.RewardRemainDayText().text = MgrLanguageData.GetLanguageByKey("dailysign_ui_surplus") .. pData[1].remainDay .. MgrLanguageData.GetLanguageByKey("dailysign_ui_sky");
        if 2 == type then
            self.Text_Yuekajiangli().text = MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips1");
        else
            self.Text_Yuekajiangli().text = MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips5");
        end
    end
end
return M