-- Code Auto Create Begin
local M = Class('CakeSignItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CakeSignItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'CakeSignItem','/',2},{'Img_LimitItemdi','Img_LimitItemdi',2},{'ItemPanel','ItemPanel',2},{'SignItemRankImg','ItemPanel/SignItemRankImg',2},{'SignItemIconImg','ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot','ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao','ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi','ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},{'ClickToSign','ClickToSign',2},{'Img_kelingqu','Img_kelingqu',2},{'Mask','Mask',2},{'Img_Gou','Mask/Img_Gou',2},
        -- UITemplate 列表
        {'CakeSignItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Num','Text_Num',20},{'Text_ItemCount','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu','ItemPanel/Img_Zhezhao/Text_Yilingqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.ClickToSign().gameObject:SetActive(false)

    UIEvent.LuaClick(self.SignItemIconImg().gameObject,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{self.ItemData, false,nil,nil,true},true)
    end)
end
function M:OnUpdateUI(pData)
    self.RewardData = pData[1]
    self.index = pData[2]
    self:InitReward()
end
function M:InitReward()
    self.Text_Num().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text170"),self.index)
    
    local reward = string.split(self.RewardData.reward,"_")
    self.ItemData = ItemData.New()
    self.ItemData:PushData({goodsType = tonumber(reward[1]),goodsID = tonumber(reward[2]),goodsNum = tonumber(reward[3])},ItemControl.PushEnum.none)

    MgrRes.LoadSprite(self.SignItemRankImg(),self.ItemData.iconFrame)
    MgrRes.LoadSprite(self.SignItemIconImg(),self.ItemData.icon)
    self.Text_ItemCount().text = self.ItemData.count
    if self.index <= CakeControl.GetSeverSignDay() then
        self.Img_Zhezhao().gameObject:SetActive(true)
        self.Mask().gameObject:SetActive(true)
        self.Img_kelingqu().gameObject:SetActive(false)
    else
        self.Img_Zhezhao().gameObject:SetActive(false)
        self.Mask().gameObject:SetActive(false)
        self.Img_kelingqu().gameObject:SetActive(CakeControl.GetSeverSignTimes() >= self.index)
    end
end
return M