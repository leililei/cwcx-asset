-- Code Auto Create Begin
local M = Class('Huiguixin_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Huiguixin_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Huiguixin_UI].prefab'
    self.Name = 'Form[Huiguixin_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'bg_xin','Ani/bg_xin',2},{'ScrollView','Ani/bg_xin/ScrollView',2},{'Viewport','Ani/bg_xin/ScrollView/Viewport',2},{'Img_Role','Ani/Img_Role',2},{'RewardBackItem','Ani/RewardBackScroll/RewardBackItem',2},{'RewardRankImg','Ani/RewardBackScroll/RewardBackItem/RewardRankImg',2},{'RewardIconImg','Ani/RewardBackScroll/RewardBackItem/RewardIconImg',2},{'Img_ItemCountBg','Ani/RewardBackScroll/RewardBackItem/Img_ItemCountBg',2},{'StarPanel','Ani/RewardBackScroll/RewardBackItem/StarPanel',2},{'EmptyStarRoot','Ani/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot',2},{'EmptyStar','Ani/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','Ani/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','Ani/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','Ani/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','Ani/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','Ani/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','Ani/RewardBackScroll/RewardBackItem/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Ani/RewardBackScroll/RewardBackItem/StarPanel/ItemStarPrefab',2},{'Img_Received','Ani/RewardBackScroll/RewardBackItem/Img_Received',2},{'content','Ani/RewardBackScroll/content',2},{'btn_lingqu','Ani/btn_lingqu',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- LoopScrollRect 列表
        {'RewardBackScroll','Ani/RewardBackScroll',18},
        -- TextMeshProUGUI 列表
        {'title','Ani/bg_xin/title',20},{'MailContentTxt','Ani/bg_xin/ScrollView/Viewport/MailContentTxt',20},{'ItemCountText','Ani/RewardBackScroll/RewardBackItem/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','Ani/RewardBackScroll/RewardBackItem/Img_Received/Text_Yilingqu2',20},{'txt_lingqu','Ani/btn_lingqu/txt_lingqu',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
require("LocalData/ReturnsystemLocalData")
function M:OnInit()
    self:InitScroll()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    --返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)

    --返回主页
    UIEvent.LuaClick(self.btn_lingqu().gameObject, function()
        self:RecieveReward()
    end)
    self:RefreshTxt()
end

function M:InitScroll()
    self.RewardBackScroll():SetLuaCellEvent(Handle(self, self.PointCell))
end

function M:OnUpdateUI(pData)
    self:GetRewardList()
    self:RefreshAwardList()
    self.btn_lingqu().gameObject:SetActive(not PlayerControl.GetPlayerData().regression.OnceStatus)
end

function M:RefreshAwardList()
    self.mRewardList = self:GetRewardList()
    self.RewardBackScroll().totalCount = #self.mRewardList
    self.RewardBackScroll():RefillCells()
end

--刷新文字多语言
function M:RefreshTxt()
    self.MailContentTxt().text = string.format(MgrLanguageData.GetLanguageByKey("ui_return_text2"),PlayerControl.GetPlayerData().regression.Interval,PlayerControl.GetPlayerData().regression.Interval)
end

--获得奖励数据列表
function M:GetRewardList()
    local tab = {}
    local array = {}
    local str = ReturnsystemLocalData.tab[1].reward
    local list = string.split(str,',')
    for i, v in ipairs(list) do
        local _item = string.split(v,'_')
        local ItemData = ItemControl.GetItemByIdAndType(tonumber(_item[2]),tonumber(_item[1]))
        table.insert(tab,ItemData)
        table.insert(array,_item)
    end
    return tab,array
end

function M:PointCell(trans,idx)
    local StarPanel = CJNUIMgr.GetSunUseName(trans.gameObject, "StarPanel")
    local ItemStarRoot = CJNUIMgr.GetSunUseName(trans.gameObject, "ItemStarRoot")
    local ItemStarPrefab = CJNUIMgr.GetSunUseName(trans.gameObject, "ItemStarPrefab")
    local RewardIconImg = CJNUIMgr.GetSunUseName(trans.gameObject, "RewardIconImg"):GetComponent("Image")
    local ItemCountText = CJNUIMgr.GetSunUseName(trans.gameObject, "ItemCountText"):GetComponent("TextMeshProUGUI")
    local RewardRankImg = CJNUIMgr.GetSunUseName(trans.gameObject, "RewardRankImg"):GetComponent("Image")
    local Img_Received = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Received")
    local tab,array =  self:GetRewardList()
    local _item =  tab[idx]

    ---设置品质
    MgrRes.LoadSprite(RewardRankImg,_item.iconFrame)
    ---获取图标
    MgrRes.LoadSprite(RewardIconImg,_item.icon)
    --道具数量
    ItemCountText.text = array[idx][3]
    --星级显示
    if _item.goodsType == 2 then
        StarPanel:SetActive(true)
        for i = 1, _item.star, 1 do
            local tempObj= GameObject.Instantiate(ItemStarPrefab,ItemStarRoot.transform,false)
        end
    else
        StarPanel:SetActive(false)
    end
    ItemStarPrefab:SetActive(false)
    Img_Received:SetActive(PlayerControl.GetPlayerData().regression.OnceStatus)

    ---设置点击事件
    UIEvent.ClearFun(RewardIconImg.gameObject)
    UIEvent.LuaClick(RewardIconImg.gameObject,function()
        if PlayerControl.GetPlayerData().regression.OnceStatus then
            return
        end
        MgrUI.Pop(UID.ItemDetailPop_UI,{_item, false, function() end},true)
    end)
 end

-- CLIENT_REGRESSION_ONCE_AWARD_REQ = 10017;
-- CLIENT_REGRESSION_ONCE_AWARD_ACK = 10018;
-- CLIENT_REGRESSION_ONCE_AWARD_NTF = 10019;

---领取奖励
function M:RecieveReward()
    -- local a = {
    --     [1] =
    --     {
    --         ["goodsID"] = 100004,
    --         ["goodsNum"] = 1,
    --         ["goodsType"] = 4
    --     },
    -- }
    -- local tab = {[1] = a}
    

    -- --将奖励推送进背包
    --          ItemControl.PushGroupItemData(a,ItemControl.PushEnum.add)
    -- MgrUI.Pop(UID.ItemAchievePop_UI,{a},true)




    local ClientRegressionOnceAwardREQ  =
    {
        rev = ""
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientRegressionOnceAwardREQ',ClientRegressionOnceAwardREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_REGRESSION_ONCE_AWARD_REQ,bytes,0,nil,
    function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientRegressionOnceAwardACK',buffer))
        if tab.errNo ~= 0 then
            --MgrUI.Pop(UID.PopTip_UI,{"不是回归用户",1},true)
        end
    end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientRegressionOnceAwardNTF',buffer))
        if tab.Goods then
            ---将奖励推送进背包
            ItemControl.PushGroupItemData(tab.Goods,ItemControl.PushEnum.add)
            ---弹出奖励弹窗
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.Goods},true)
            ---刷新背包缓存数据
            BagViewModel.ReloadCacheData()
            PlayerControl.GetPlayerData().regression.OnceStatus = true
            self.mRewardList = self:GetRewardList()
            self.RewardBackScroll().totalCount = #self.mRewardList
            self.RewardBackScroll():RefillCells()
            self.btn_lingqu().gameObject:SetActive(not PlayerControl.GetPlayerData().regression.OnceStatus)
            ActivityControl.CheckSignBackRedDot()
        else
            --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips3"),2},true)
        end
    end
    )
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

--领取奖励ACK
-- function M.ActivityRewardSendACK(buffer, tag)
--     local tab = assert(pb.decode('PBClient.ClientRegressionOnceAwardACK',buffer))
--     print(tab.errNo)
--     if tab.errNo~=0 then
--         if tab.errNo == 2003 then
--             MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips1"),2},true)
--         else
--             MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips2"),2},true)
--         end
--     end
-- end
-- ---领取奖励NTF
-- function M.ActivityRewardSendNTF(buffer, tag)
--     ---解析活动奖励
--     local tab = assert(pb.decode('PBClient.ClientRegressionOnceAwardNTF',buffer))
--     if tab.goods then
--         ---将奖励推送进背包
--         ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
--         ---弹出奖励弹窗
--         MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
--     else
--         MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips3"),2},true)
--     end
--     ---刷新背包缓存数据
--     BagViewModel.ReloadCacheData()
-- end

return M