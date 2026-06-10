-- Code Auto Create Begin
local M = Class('Activity_TimeLimitSign', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_TimeLimitSign.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_TimeLimitSign','/',2},{'bg_activity_board','bg_activity_board',2},{'img_activity_jiahao','bg_activity_board/img_activity_jiahao',2},{'img_activity_jiahao01','bg_activity_board/img_activity_jiahao',2},{'img_activity_jiahao02','bg_activity_board/img_activity_jiahao',2},{'img_activity_jiahao03','bg_activity_board/img_activity_jiahao',2},{'bg_activity_xs_n','SignScroll/SignPrefab/Signitem/bg_activity_xs_n',2},{'ItemPanel','SignScroll/SignPrefab/Signitem/ItemPanel',2},{'SignItemRankImg','SignScroll/SignPrefab/Signitem/ItemPanel/SignItemRankImg',2},{'SignItemIconImg','SignScroll/SignPrefab/Signitem/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot','SignScroll/SignPrefab/Signitem/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','SignScroll/SignPrefab/Signitem/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao','SignScroll/SignPrefab/Signitem/ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi','SignScroll/SignPrefab/Signitem/ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},{'img_activity_xs_mask','SignScroll/SignPrefab/Signitem/img_activity_xs_mask',2},{'img_activity_xs_claimed','SignScroll/SignPrefab/Signitem/img_activity_xs_mask/img_activity_xs_claimed',2},{'Signitem_Light','SignScroll/SignPrefab/Signitem_Light',2},{'bg_activity_xs_h_S','SignScroll/SignPrefab/Signitem_Light/bg_activity_xs_h_S',2},{'bg_activity_xs_h_X','SignScroll/SignPrefab/Signitem_Light/bg_activity_xs_h_X',2},{'bg_activity_xs_h_02','SignScroll/SignPrefab/Signitem_Light/bg_activity_xs_h_02',2},{'bg_activity_xs_h','SignScroll/SignPrefab/Signitem_Light/bg_activity_xs_h',2},{'ItemPanel01','SignScroll/SignPrefab/Signitem_Light/ItemPanel',2},{'SignItemRankImg01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/SignItemRankImg',2},{'SignItemIconImg01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},{'content','SignScroll/content',2},{'Img_Title','Img_Title',2},{'Img_Jiantou','Time/Img_Jiantou',2},
        -- UITemplate 列表
        {'Activity_TimeLimitSign01','/',10},
        -- LoopScrollRect 列表
        {'SignScroll','SignScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Shuoming','Text_Shuoming',20},{'Text_day','SignScroll/SignPrefab/Signitem/bg_activity_xs_n/Text_day',20},{'Text_sign','SignScroll/SignPrefab/Signitem/bg_activity_xs_n/Text_sign',20},{'Text_shuzi','SignScroll/SignPrefab/Signitem/bg_activity_xs_n/Text_shuzi',20},{'Text_ItemCount','SignScroll/SignPrefab/Signitem/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu','SignScroll/SignPrefab/Signitem/ItemPanel/Img_Zhezhao/Text_Yilingqu',20},{'Text_day01','SignScroll/SignPrefab/Signitem_Light/bg_activity_xs_h/Text_day',20},{'Text_sign01','SignScroll/SignPrefab/Signitem_Light/bg_activity_xs_h/Text_sign',20},{'Text_shuzi01','SignScroll/SignPrefab/Signitem_Light/bg_activity_xs_h/Text_shuzi',20},{'Text_ItemCount01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu01','SignScroll/SignPrefab/Signitem_Light/ItemPanel/Img_Zhezhao/Text_Yilingqu',20},{'Text_Time1','Time/Text_Time1',20},{'Text_Xiaoshi1','Time/Text_Time1/Text_Xiaoshi1',20},{'Text_Time2','Time/Text_Time2',20},{'Text_Xiaoshi2','Time/Text_Time2/Text_Xiaoshi2',20},
    }
end
-- Code Auto Create End
require("LocalData/SignineventLocalData")
function M:OnInit()
    self.mActivityData = {}
    self.ActiveID = 0 --活动ID
    self.group = 1 --版本号

    self:InitScroll()
end

function M:OnUpdateUI(pData)
    self.ActiveID = pData[1]
    self.mActivityData = LimitSignControl.GetLimitSignData(self.ActiveID)
    if self.mActivityData[2].resourcefolder and self.mActivityData[2].resourcefolder ~= "0" then
        MgrRes.LoadSprite(self.bg_activity_board(),self.mActivityData[2].resourcefolder.."/Img_LimitSignBg",nil,true)
    end
    
    self:SetActivityTime(self.ActiveID)
    self:ScrollToIndex()
end

function M:InitScroll()
    self.SignScroll():SetLuaCellEvent(Handle(self, self.PointCell))
end

---刷新成就滑动数据
function M:ReloadData()
    if self.mActivityData then
        self.SignScroll().totalCount = #self.mActivityData
        self.SignScroll():RefillCells()
    end
end

---滑动到指定位置
function M:ScrollToIndex()
    if self.mActivityData then
        self.SignScroll().totalCount = #self.mActivityData
        self.SignScroll():RefillCells()

        --MgrTimer.AddDelayNoName(0.1,function ()
        --    if LimitSignControl.GetIsSignDay() then
        --        --self.SignScroll():RefillCells(LimitSignControl.GetSignDay() + 1 + 1)
        --        --self.SignScroll():RefillCells(LimitSignControl.GetSignDay())
        --        self.SignScroll():ScrollToCell(LimitSignControl.GetSignDay(),5000)
        --    else
        --        --self.SignScroll():RefillCells(LimitSignControl.GetSignDay() + 1)
        --        --self.SignScroll():RefillCells(LimitSignControl.GetSignDay() - 1)
        --        self.SignScroll():ScrollToCell(LimitSignControl.GetSignDay() - 1,5000)
        --    end
        --end)
    end
end

--设置活动时间
function M:SetActivityTime()
    local info = LimitSignControl.GetActivityInfo()
    if info then
        local bTime = string.split(info.beginTime,'-')
        local eTime = string.split(info.endTime,'-')
        self.Text_Time1().text = bTime[2].."/"..bTime[3]
        self.Text_Time2().text = eTime[2].."/"..eTime[3]
        self.Text_Xiaoshi1().text = bTime[4].."."..bTime[5]
        self.Text_Xiaoshi2().text = eTime[4].."."..eTime[5]
    end
end

---积分Item
function M:PointCell(trans,idx)
    local Signitem_Light = CJNUIMgr.GetSunUseName(trans.gameObject, "Signitem_Light")
    local Signitem = CJNUIMgr.GetSunUseName(trans.gameObject, "Signitem")
    local img_activity_xs_mask = CJNUIMgr.GetSunUseName(trans.gameObject, "img_activity_xs_mask")
    local ItemPanelNormal = CJNUIMgr.GetSunUseName(Signitem.gameObject, "ItemPanel")
    local ItemPanelLight = CJNUIMgr.GetSunUseName(Signitem_Light.gameObject, "ItemPanel")
    local Text_shuziNormal = CJNUIMgr.GetSunUseName(Signitem.gameObject, "Text_shuzi"):GetComponent("TextMeshProUGUI")
    local Text_shuziLight = CJNUIMgr.GetSunUseName(Signitem_Light.gameObject, "Text_shuzi"):GetComponent("TextMeshProUGUI")

    if self.mActivityData[idx].id == 0 then
        Signitem.gameObject:SetActive(false)
        Signitem_Light.gameObject:SetActive(false)
        return
    end

    local day = idx - 1

    if day <= LimitSignControl.GetSignDay(self.ActiveID) then--已经签到
        Signitem_Light.gameObject:SetActive(false)
        Signitem.gameObject:SetActive(true)
        img_activity_xs_mask.gameObject:SetActive(true)
        if day > 9 then
            Text_shuziNormal.text =  day
        else
            Text_shuziNormal.text = "0" .. day
        end
        self:SetAwardData(ItemPanelNormal,self.mActivityData[idx])
    else --未签到
        if LimitSignControl.GetIsSignDay(self.ActiveID) and day == LimitSignControl.GetSignDay(self.ActiveID) + 1 then
            Signitem_Light.gameObject:SetActive(true)
            Signitem.gameObject:SetActive(false)
            img_activity_xs_mask.gameObject:SetActive(false)
            if day > 9 then
                Text_shuziLight.text =  day
            else
                Text_shuziLight.text = "0" .. day
            end
            self:SetAwardData(ItemPanelLight,self.mActivityData[idx])
            UIEvent.ClearFun(Signitem_Light.gameObject)
            UIEvent.LuaClick(Signitem_Light.gameObject, function()
                self:ClientLimitSignReq(day,function ()
                    Signitem_Light.gameObject:SetActive(false)
                    Signitem.gameObject:SetActive(true)
                    img_activity_xs_mask.gameObject:SetActive(true)
                    if day > 9 then
                        Text_shuziNormal.text =  day
                    else
                        Text_shuziNormal.text = "0" .. day
                    end
                    self:SetAwardData(ItemPanelNormal,self.mActivityData[idx])
                end)
            end)
        else
            Signitem_Light.gameObject:SetActive(false)
            Signitem.gameObject:SetActive(true)
            img_activity_xs_mask.gameObject:SetActive(false)
            if day > 9 then
                Text_shuziNormal.text =  day
            else
                Text_shuziNormal.text = "0" .. day
            end
            self:SetAwardData(ItemPanelNormal,self.mActivityData[idx],true)
        end
    end
end

--设置奖励数据
function M:SetAwardData(obj,info,click)
    local Img_Zhezhao = CJNUIMgr.GetSunUseName(obj.gameObject, "Img_Zhezhao")
    local SignItemIconImg = CJNUIMgr.GetSunUseName(obj.gameObject, "SignItemIconImg"):GetComponent("Image")
    local Text_ItemCount = CJNUIMgr.GetSunUseName(obj.gameObject, "Text_ItemCount"):GetComponent("TextMeshProUGUI")
    local SignItemRankImg = CJNUIMgr.GetSunUseName(obj.gameObject, "SignItemRankImg"):GetComponent("Image")
    
    ---已领取图标
    --Img_Zhezhao.gameObject:SetActive(index < LimitSignControl.GetCurSignDay())
    ---道具图标
    --MgrRes.LoadSprite(SignItemIconImg,info.icon)

    local _item = string.split(info.reward,'_')
    local ItemData = ItemControl.GetItemByIdAndType(tonumber(_item[2]),tonumber(_item[1]))

    ---设置品质
    MgrRes.LoadSprite(SignItemRankImg,ItemData.iconFrame)
    ---获取图标
    MgrRes.LoadSprite(SignItemIconImg,"Item/"..SignViewModel.GetSignRewardIcon(info.reward))
    ---获取数量
    Text_ItemCount.text=SignViewModel.GetSignRewardCount(info.reward)

    if click then
        ---设置点击事件
        UIEvent.LuaClick(obj,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{ItemData, false, function() end},true)
        end)
    end
end

---一键领取所有
function M:ClientLimitSignReq(_id,callback)
    local ClientLimitSignReq  =
    {
        id = _id,
        activityId = self.ActiveID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLimitSignReq',ClientLimitSignReq))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LIMIT_SIGN_REQ,bytes,0,nil,
        function(...)
            self:ActivityRewardSendACK(...)
            if callback then
                callback()
            end
        end,
        function(...)
            self:ActivityRewardSendNtf(...)
        end
    )
end
---领取活动奖励ACK
function M:ActivityRewardSendACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientLimitSignAck',buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
    end
end
function M:ActivityRewardSendNtf(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientLimitSignNtf',buffer))
   
    LimitSignControl.SetInitData(MgrNet.GetServerTime(),LimitSignControl.GetSignDay() + 1, self.ActiveID)
    --self:ScrollToIndex()
    RedDotControl.GetDotData("limitSign_"..self.ActiveID):SetState(false)
    Event.Go("limitSignActivityDot")
    local goodsList = {}
    for i, v in pairs(tab.goods) do
        if v.hero ~= nil then
            Log.Error("不允许通过签到直接获取角色，请修改签到奖励配置为物品")
        end
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
end

return M