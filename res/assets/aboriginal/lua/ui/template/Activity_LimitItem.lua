-- Code Auto Create Begin
local M = Class('Activity_LimitItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_LimitItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_LimitItem','/',2},{'Img_LimitItemdi','Img_LimitItemdi',2},{'Img_LimitItemdi_H','Img_LimitItemdi_H',2},{'ItemPanel','ItemPanel',2},{'SignItemRankImg','ItemPanel/SignItemRankImg',2},{'SignItemIconImg','ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot','ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao','ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi','ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},{'Img_Gou','Img_Gou',2},{'ClickToSign','ClickToSign',2},{'Mask','Mask',2},
        -- UITemplate 列表
        {'Activity_LimitItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Num','Text_Num',20},{'Text_ItemCount','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu','ItemPanel/Img_Zhezhao/Text_Yilingqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Mask().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    self.RewardData = pData[1]
    self.parent = pData[2]
    self.index = pData[3]
    self:InitReward()
end
function M:InitReward()
    local dayNum = self.Activity_LimitItem().transform:Find("Text_Num"):GetComponent("TextMeshProUGUI")
    local Img_Gou = self.Activity_LimitItem().transform:Find("Img_Gou").gameObject
    local ClickToSign = self.Activity_LimitItem().transform:Find("ClickToSign").gameObject

    dayNum.text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text170"),self.index)

    local item = self.Activity_LimitItem().transform:Find("ItemPanel").gameObject
    local reward = string.split(self.RewardData.reward,"_")
    local data = ItemData.New()
    data:PushData({goodsType = tonumber(reward[1]),goodsID = tonumber(reward[2]),goodsNum = tonumber(reward[3])},ItemControl.PushEnum.none)
    local Text_ItemCount = item.transform:Find("Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount"):GetComponent("TextMeshProUGUI")
    --local Img_Zhezhao = item.transform:Find("Img_Zhezhao"):GetComponent("Image")
    MgrRes.LoadSprite(self.Img_Gou(),self.RewardData.resourcefolder.."/Img_Yilingqu",nil,true)
    MgrRes.LoadSprite(self.Img_LimitItemdi(),self.RewardData.resourcefolder.."/Img_LimitItemdi",nil,true)
    MgrRes.LoadSprite(self.Img_LimitItemdi_H(),self.RewardData.resourcefolder.."/Img_LimitItemdi_H",nil,true)
    MgrRes.LoadSprite(self.SignItemRankImg(),data.iconFrame)
    MgrRes.LoadSprite(self.SignItemIconImg(),data.icon)
    Text_ItemCount.text = data.count
    if self.index <= LimitSign_NewControl.GetSignDay(self.RewardData.activityid) then
        --Img_Zhezhao.gameObject:SetActive(true)
        Img_Gou:SetActive(true)
        ClickToSign:SetActive(false)
        --self.Mask().gameObject:SetActive(false)
        self.Img_LimitItemdi().gameObject:SetActive(false)
        self.Img_LimitItemdi_H().gameObject:SetActive(true)
    else
        --Img_Zhezhao.gameObject:SetActive(false)
        Img_Gou:SetActive(false)
        ClickToSign:SetActive(false)
        UIEvent.LuaClick(self.SignItemIconImg().gameObject,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{data, false,nil,nil,true},true)
        end)
        if LimitSign_NewControl.GetSignTimes(self.RewardData.activityid) >= self.index then
            --self.Mask().gameObject:SetActive(false)
            self.Img_LimitItemdi().gameObject:SetActive(false)
            self.Img_LimitItemdi_H().gameObject:SetActive(true)
        else
            --self.Mask().gameObject:SetActive(true)
            self.Img_LimitItemdi().gameObject:SetActive(true)
            self.Img_LimitItemdi_H().gameObject:SetActive(false)
        end
    end
end
return M