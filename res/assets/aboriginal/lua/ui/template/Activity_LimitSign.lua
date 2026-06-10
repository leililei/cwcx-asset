-- Code Auto Create Begin
local M = Class('Activity_LimitSign', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_LimitSign.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_LimitSign','/',2},{'Btn_DailySign','Btn_DailySign',2},{'Activity_LimitItem','SignPanel/SignScroll/Activity_LimitItem',2},{'Content','SignPanel/SignScroll/Content',2},{'Last','SignPanel/Last',2},{'Activity_LimitItem2','SignPanel/Last/Activity_LimitItem2',2},{'Img_LimitItemdi','SignPanel/Last/Activity_LimitItem2/Img_LimitItemdi',2},{'Img_LimitItemdi_H','SignPanel/Last/Activity_LimitItem2/Img_LimitItemdi_H',2},{'ItemPanel','SignPanel/Last/Activity_LimitItem2/ItemPanel',2},{'SignItemRankImg','SignPanel/Last/Activity_LimitItem2/ItemPanel/SignItemRankImg',2},{'SignItemIconImg','SignPanel/Last/Activity_LimitItem2/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot','SignPanel/Last/Activity_LimitItem2/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','SignPanel/Last/Activity_LimitItem2/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao','SignPanel/Last/Activity_LimitItem2/ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi','SignPanel/Last/Activity_LimitItem2/ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},{'Img_Gou','SignPanel/Last/Activity_LimitItem2/Img_Gou',2},{'ClickToSign','SignPanel/Last/Activity_LimitItem2/ClickToSign',2},{'Mask','SignPanel/Last/Activity_LimitItem2/Mask',2},
        -- UITemplate 列表
        {'Activity_LimitSign01','/',10},{'Activity_LimitItem01','SignPanel/SignScroll/Activity_LimitItem',10},
        -- LoopScrollRect 列表
        {'SignScroll','SignPanel/SignScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Shuoming','Text_Shuoming',20},{'Text_Shijian','Text_Shijian',20},{'Text_Xianshiqiandao','Text_Xianshiqiandao',20},{'Text_LingQu','Btn_DailySign/Text_LingQu',20},{'Text_Num','SignPanel/Last/Activity_LimitItem2/Text_Num',20},{'Text_ItemCount','SignPanel/Last/Activity_LimitItem2/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu','SignPanel/Last/Activity_LimitItem2/ItemPanel/Img_Zhezhao/Text_Yilingqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Mask().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    self.ActiveID = pData[1]
    if LimitSign_NewControl.GetInitData(self.ActiveID) == nil then
        LimitSign_NewControl.SendLimitSign2InfoReq(function()
            self:InitData()
        end)
    else
        self:InitData()
    end
end

function M:InitData()
    self:SetActivityTime(self.ActiveID)
    self:InitRewardScroll()
    self:InitReward()
    Event.Add("FreshLimitSign_New",Handle(self,self.InitReward))
    UIEvent.LuaClick(self.Btn_DailySign().gameObject,function()
        self:ClickReq()
    end)
end
--设置活动时间
function M:SetActivityTime(_actId)
    local info = LimitSign_NewControl.GetActivityInfo(_actId)
    if info then
        local bTime = string.split(info.beginTime,'-')
        local eTime = string.split(info.endTime,'-')
        local bTimeText = bTime[1].."/".. bTime[2].."/"..bTime[3] .. " " .. bTime[4]..":"..bTime[5]
        local eTimeText = eTime[1].."/".. eTime[2].."/"..eTime[3] .. " " .. eTime[4]..":"..eTime[5]
        self.Text_Shijian().text = bTimeText .. " - " .. eTimeText
    end
end
function M:Cell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.RewardData[idx],self,idx})
end
function M:InitRewardScroll()
    self.SignScroll():SetLuaCellEvent(Handle(self, self.Cell))
end
function M:InitReward()
    self.RewardData = LimitSign_NewControl.GetLimitSignData(self.ActiveID)
    if LimitSign_NewControl.GetSignTimes(self.ActiveID) - LimitSign_NewControl.GetSignDay(self.ActiveID) == 0 then
        self.Btn_DailySign().gameObject:SetActive(false)
    else
        self.Btn_DailySign().gameObject:SetActive(true)
    end
    self.lastDay = #self.RewardData
    self.LastReward = clone(self.RewardData[#self.RewardData])
    table.remove(self.RewardData,#self.RewardData)
    self.SignScroll().totalCount = #self.RewardData
    self.SignScroll():RefillCells()
    self:InitLastReward()
end
function M:InitLastReward()
    local dayNum = self.Activity_LimitItem2().transform:Find("Text_Num"):GetComponent("TextMeshProUGUI")
    local Img_Gou = self.Activity_LimitItem2().transform:Find("Img_Gou"):GetComponent("Image")
    local ClickToSign = self.Activity_LimitItem2().transform:Find("ClickToSign").gameObject

    dayNum.text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text170"),self.lastDay)

    local item = self.Activity_LimitItem2().transform:Find("ItemPanel").gameObject
    local lastReward = string.split(self.LastReward.reward,"_")
    local data = ItemData.New()
    data:PushData({goodsType = tonumber(lastReward[1]),goodsID = tonumber(lastReward[2]),goodsNum = tonumber(lastReward[3])},ItemControl.PushEnum.none)
    local SignItemRankImg = item.transform:Find("SignItemRankImg"):GetComponent("Image")
    local SignItemIconImg = item.transform:Find("SignItemIconImg"):GetComponent("Image")
    local Text_ItemCount = item.transform:Find("Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount"):GetComponent("TextMeshProUGUI")
    --local Img_Zhezhao = item.transform:Find("Img_Zhezhao"):GetComponent("Image")
    MgrRes.LoadSprite(self.Activity_LimitSign(),self.LastReward.resourcefolder.."/Img_LimitSignBg",nil,true)
    MgrRes.LoadSprite(Img_Gou,self.LastReward.resourcefolder.."/Img_Yilingqu",nil,true)
    MgrRes.LoadSprite(self.Btn_DailySign(),self.LastReward.resourcefolder.."/btn_lingqu",nil,true)
    MgrRes.LoadSprite(self.Img_LimitItemdi(),self.LastReward.resourcefolder.."/Img_LimitItemdi_B",nil,true)
    MgrRes.LoadSprite(self.Img_LimitItemdi_H(),self.LastReward.resourcefolder.."/Img_LimitItemdi_B_H",nil,true)
    MgrRes.LoadSprite(SignItemRankImg,data.iconFrame)
    MgrRes.LoadSprite(SignItemIconImg,data.icon)
    Text_ItemCount.text = data.count
    if self.lastDay <= LimitSign_NewControl.GetSignDay(self.ActiveID) then
        --Img_Zhezhao.gameObject:SetActive(true)
        Img_Gou.gameObject:SetActive(true)
        ClickToSign:SetActive(false)
        --self.Mask().gameObject:SetActive(false)
        self.Img_LimitItemdi().gameObject:SetActive(false)
        self.Img_LimitItemdi_H().gameObject:SetActive(true)
    else
        --Img_Zhezhao.gameObject:SetActive(false)
        Img_Gou.gameObject:SetActive(false)
        ClickToSign:SetActive(false)
        UIEvent.LuaClick(SignItemIconImg.gameObject,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{data, false,nil,nil,true},true)
        end)
        if LimitSign_NewControl.GetSignTimes(self.ActiveID) >= self.lastDay then
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
function M:OnClose()
    Event.Remove("FreshLimitSign_New",Handle(self,self.InitReward))
end
function M:OnHide()
end

function M:ClickReq()
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLimitSign2Req',{activityID = self.ActiveID}))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LIMIT_SIGN2_REQ,bytes,0,nil,
            function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientLimitSign2Ack',buffer))
                if tab.errNo~=0 then
                    if tab.errNo == 4000 then
                        print("重复签到")
                    end
                end
            end,
            function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientLimitSign2Ntf',buffer))
                RedDotControl.GetDotData("limitSign_New_"..self.ActiveID):SetState(false)
                local goodsList = {}
                for i, v in pairs(tab.goods) do
                    for _, v1 in pairs(v.goods) do
                        goodsList[#goodsList + 1] = v1
                    end
                end
                ---更新物品奖励
                ItemControl.PushGroupItemData(goodsList,ItemControl.PushEnum.add)
                ---弹出奖励窗口
                if #goodsList > 0 then
                    MgrUI.Pop(UID.ItemAchievePop_UI,{goodsList},true)
                end
                LimitSign_NewControl.SetInitData(tab.info.time,tab.info.day,tab.info.ableDay,tab.info.activityId)
                self:InitReward()
                Event.Go("ActivityDot")
            end)
end

return M