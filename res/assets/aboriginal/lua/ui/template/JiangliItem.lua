-- Code Auto Create Begin
local M = Class('JiangliItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/JiangliItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'JiangliItem','/',2},{'Img_TXZJianglidi','Img_TXZJianglidi',2},{'RewardItemPreFab1','Img_TXZJianglidi/RewardItemPreFab1',2},{'RewardRankImg','Img_TXZJianglidi/RewardItemPreFab1/RewardRankImg',2},{'RewardIconImg','Img_TXZJianglidi/RewardItemPreFab1/RewardIconImg',2},{'Img_ItemCountBg','Img_TXZJianglidi/RewardItemPreFab1/Img_ItemCountBg',2},{'StarPanel','Img_TXZJianglidi/RewardItemPreFab1/StarPanel',2},{'EmptyStarRoot','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot',2},{'EmptyStar','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot',2},{'ItemStarPrefab0','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab0',2},{'ItemStarPrefab1','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'ItemStarPrefab2','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'ItemStarPrefab3','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'ItemStarPrefab4','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'ItemStarPrefab5','Img_TXZJianglidi/RewardItemPreFab1/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'Img_guang','Img_TXZJianglidi/RewardItemPreFab1/Img_guang',2},{'Img_Received','Img_TXZJianglidi/RewardItemPreFab1/Img_Received',2},{'Img_Gou','Img_TXZJianglidi/RewardItemPreFab1/Img_Received/Img_Gou',2},{'Img_Suo1','Img_TXZJianglidi/RewardItemPreFab1/Img_Suo1',2},{'Suo','Img_TXZJianglidi/RewardItemPreFab1/Img_Suo1/Suo',2},{'HighLevelReward','Img_TXZJianglidi/HighLevelReward',2},{'RewardItemPreFab2','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2',2},{'RewardRankImg01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/RewardRankImg',2},{'RewardIconImg01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/RewardIconImg',2},{'Img_ItemCountBg01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_ItemCountBg',2},{'StarPanel01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel',2},{'EmptyStarRoot01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot',2},{'EmptyStar06','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar07','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar08','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar09','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar10','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar11','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab_0','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_0',2},{'ItemStarPrefab_1','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_1',2},{'ItemStarPrefab_2','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_2',2},{'ItemStarPrefab_3','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_3',2},{'ItemStarPrefab_4','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_4',2},{'ItemStarPrefab_5','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/StarPanel/ItemStarRoot/ItemStarPrefab_5',2},{'Img_guang01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_guang',2},{'Img_Received01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Received',2},{'Img_Gou01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Received/Img_Gou',2},{'Img_Suo2','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Suo2',2},{'Suo01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_Suo2/Suo',2},{'RewardItemPreFab3','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3',2},{'RewardRankImg02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/RewardRankImg',2},{'RewardIconImg02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/RewardIconImg',2},{'Img_ItemCountBg02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_ItemCountBg',2},{'StarPanel02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel',2},{'EmptyStarRoot02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot',2},{'EmptyStar12','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar13','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar14','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar15','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar16','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar17','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot',2},{'ItemStarPrefab_01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_01',2},{'ItemStarPrefab_11','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_11',2},{'ItemStarPrefab_21','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_21',2},{'ItemStarPrefab_31','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_31',2},{'ItemStarPrefab_41','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_41',2},{'ItemStarPrefab_51','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/StarPanel/ItemStarRoot/ItemStarPrefab_51',2},{'Img_guang02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_guang',2},{'Img_Received02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Received',2},{'Img_Gou02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Received/Img_Gou',2},{'Img_Suo3','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Suo3',2},{'Suo02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_Suo3/Suo',2},{'Btn_Click','Btn_Click',2},{'Img_TXZDengjidi','Img_TXZDengjidi',2},{'Kelingqu','Kelingqu',2},{'Img_YiLengqudi','Kelingqu/Img_YiLengqudi',2},{'Img_Lengqudi','Kelingqu/Img_Lengqudi',2},{'Img_Lengqukuang','Kelingqu/Img_Lengqukuang',2},
        -- UITemplate 列表
        {'JiangliItem01','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','Img_TXZJianglidi/RewardItemPreFab1/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab2/Img_ItemCountBg/ItemCountText',20},{'ItemCountText02','Img_TXZJianglidi/HighLevelReward/RewardItemPreFab3/Img_ItemCountBg/ItemCountText',20},{'Text_TXZDengji','Img_TXZDengjidi/Text_TXZDengji',20},{'Text_YiLingqu','Kelingqu/Img_YiLengqudi/Text_YiLingqu',20},{'Text_Lengqu','Kelingqu/Img_Lengqudi/Text_Lengqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.starHl1 = {
        [1] = self.ItemStarPrefab0().gameObject,
        [2] = self.ItemStarPrefab1().gameObject,
        [3] = self.ItemStarPrefab2().gameObject,
        [4] = self.ItemStarPrefab3().gameObject,
        [5] = self.ItemStarPrefab4().gameObject,
        [6] = self.ItemStarPrefab5().gameObject,
    }
    self.starHl2 = {
        [1] = self.ItemStarPrefab_0().gameObject,
        [2] = self.ItemStarPrefab_1().gameObject,
        [3] = self.ItemStarPrefab_2().gameObject,
        [4] = self.ItemStarPrefab_3().gameObject,
        [5] = self.ItemStarPrefab_4().gameObject,
        [6] = self.ItemStarPrefab_5().gameObject,
    }
    self.starHl3 = {
        [1] = self.ItemStarPrefab_01().gameObject,
        [2] = self.ItemStarPrefab_11().gameObject,
        [3] = self.ItemStarPrefab_21().gameObject,
        [4] = self.ItemStarPrefab_31().gameObject,
        [5] = self.ItemStarPrefab_41().gameObject,
        [6] = self.ItemStarPrefab_51().gameObject,
    }
end
function M:OnUpdateUI(pData)
    ---@type ItemData
    self.normalReward = pData[1][1]
    self.seniorReward = pData[1][2]
    self.seniorReward2 = pData[1][3]
    if self.seniorReward2 == nil then
        self.RewardItemPreFab3().gameObject:SetActive(false)
    else
        self.RewardItemPreFab3().gameObject:SetActive(true)
    end
    self.parent = pData[2]
    self.idx = pData[3]
    --图片/数字
    self:InitImage()
    --是否解锁了高级通行证
    -- local passportInfo = PassportControl.GetPassportData()
    -- local score = passportInfo.score
    -- local localScore = MonthpassawardLocalData.tab[self.idx][4]
    --and score >= localScore
    if self.parent.seniorIsUnlock  then
        self.Img_Suo2().gameObject:SetActive(false)
        self.Img_Suo3().gameObject:SetActive(false)
    else
        self.Img_Suo2().gameObject:SetActive(true)
        self.Img_Suo3().gameObject:SetActive(true)
    end
end
--初始化按钮
function M:InitButton()

end
--初始化图片
function M:InitImage()
    --物品图标
    MgrRes.LoadSprite(self.RewardIconImg(),self.normalReward.icon)
    MgrRes.LoadSprite(self.RewardIconImg01(),self.seniorReward.icon)
    --物品等级图标
    MgrRes.LoadSprite(self.RewardRankImg(),self.normalReward.iconFrame)
    MgrRes.LoadSprite(self.RewardRankImg01(),self.seniorReward.iconFrame)
    --数量
    self.ItemCountText().text = JNStrTool.numberAbbr(self.normalReward.count)
    self.ItemCountText01().text = JNStrTool.numberAbbr(self.seniorReward.count)
    if self.seniorReward2 ~= nil then
        MgrRes.LoadSprite(self.RewardIconImg02(),self.seniorReward2.icon)
        MgrRes.LoadSprite(self.RewardRankImg02(),self.seniorReward2.iconFrame)
        self.ItemCountText02().text = JNStrTool.numberAbbr(self.seniorReward2.count)
    end
    --物品星级
    for i = 1, 6 do
        if self.normalReward.star==0 then
            self.StarPanel().gameObject:SetActive(false)
        end
        if self.seniorReward.star==0 then
            self.StarPanel01().gameObject:SetActive(false)
        end
        if self.seniorReward2 ~= nil then
            if self.seniorReward2.star==0 then
                self.StarPanel02().gameObject:SetActive(false)
            end
        end
        if i <= self.normalReward.star then
            self.starHl1[i]:SetActive(true)
        else
            self.starHl1[i]:SetActive(false)
        end
        if i <= self.seniorReward.star then
            self.starHl2[i]:SetActive(true)
        else
            self.starHl2[i]:SetActive(false)
        end
        if self.seniorReward2 ~= nil then
            if i <= self.seniorReward2.star then
                self.starHl3[i]:SetActive(true)
            else
                self.starHl3[i]:SetActive(false)
            end
        end
    end

    self.Img_Received().gameObject:SetActive(false)
    self.Img_Received01().gameObject:SetActive(false)
    self.Img_Received02().gameObject:SetActive(false)
    self.Img_YiLengqudi().gameObject:SetActive(false)
    local receive = true
    ---是否可领取     积分够   并且    还未被领取
    local receivedReward = PassportControl.GetReceivedReward()
    if self.parent.lv >= self.idx then
        self.Kelingqu().gameObject:SetActive(true)
        self.Img_guang().gameObject:SetActive(true)
        self.Img_guang01().gameObject:SetActive(true)
        self.Img_guang02().gameObject:SetActive(true)
        self.Img_Lengqudi().gameObject:SetActive(true)
        if receivedReward ~= nil then
            local reward = self:PassesRewardID(self.idx)
            if receivedReward[tostring(reward.id)] == 0 then ---领了低级
                self.Img_Received().gameObject:SetActive(true)
                self.Img_TXZDengjidi().gameObject:SetActive(false)
                if not self.parent.seniorIsUnlock then
                    self.Img_TXZDengjidi().gameObject:SetActive(true)
                    self.Kelingqu().gameObject:SetActive(false)
                    self.Img_guang().gameObject:SetActive(false)
                    self.Img_guang01().gameObject:SetActive(false)
                    self.Img_guang02().gameObject:SetActive(false)
                else
                    self.Kelingqu().gameObject:SetActive(true)
                    self.Img_guang().gameObject:SetActive(true)
                    self.Img_guang01().gameObject:SetActive(true)
                    self.Img_guang02().gameObject:SetActive(true)
                end
            elseif receivedReward[tostring(reward.id)] == 2 then ---领了高级
                self.Kelingqu().gameObject:SetActive(false)
                self.Img_guang().gameObject:SetActive(false)
                self.Img_guang01().gameObject:SetActive(false)
                self.Img_guang02().gameObject:SetActive(false)
                self.Img_Received().gameObject:SetActive(true)
                self.Img_Received01().gameObject:SetActive(true)
                self.Img_Received02().gameObject:SetActive(true)
                self.Img_TXZDengjidi().gameObject:SetActive(true)
                self.Img_Lengqudi().gameObject:SetActive(false)
            else    ---低级也没有领
                self.Kelingqu().gameObject:SetActive(true)
                self.Img_guang().gameObject:SetActive(true)
                self.Img_Received().gameObject:SetActive(false)
                if self.parent.seniorIsUnlock then
                    self.Img_guang01().gameObject:SetActive(true)
                    self.Img_guang02().gameObject:SetActive(true)
                    self.Img_Received01().gameObject:SetActive(false)
                    self.Img_Received02().gameObject:SetActive(false)
                else
                    self.Img_guang01().gameObject:SetActive(false)
                    self.Img_guang02().gameObject:SetActive(false)
                    self.Img_Received01().gameObject:SetActive(false)
                    self.Img_Received02().gameObject:SetActive(false)
                end
            end
        end
    else                                                    ---未完成任务
        self.Img_Received().gameObject:SetActive(false)
        self.Img_Received01().gameObject:SetActive(false)
        self.Img_Received02().gameObject:SetActive(false)
        self.Kelingqu().gameObject:SetActive(false)
        self.Img_guang().gameObject:SetActive(false)
        self.Img_guang01().gameObject:SetActive(false)
        self.Img_guang02().gameObject:SetActive(false)
        self.Img_TXZDengjidi().gameObject:SetActive(true)
        self.Img_Lengqudi().gameObject:SetActive(false)
        receive = false
    end

    ---是否已领取

    --获得已被领取奖励
    --if receivedReward ~= nil then
    --    for i,v in pairs(receivedReward) do
    --        if self.idx == tonumber(i) then             ---已经领取
    --            self.Img_Received().gameObject:SetActive(true)
    --            if self.parent.seniorIsUnlock then  ---若高级通行证已解锁
    --                if receivedReward[tostring(self.idx)] == 0 then ---领了低级
    --                    self.Kelingqu().gameObject:SetActive(true)
    --                    self.Img_Received01().gameObject:SetActive(false)
    --                    self.Img_Received02().gameObject:SetActive(false)
    --                    self.Img_guang01().gameObject:SetActive(true)
    --                    self.Img_guang02().gameObject:SetActive(true)
    --                elseif receivedReward[tostring(self.idx)] == 2 then ---领了高级
    --                    self.Kelingqu().gameObject:SetActive(false)
    --                    self.Img_Received01().gameObject:SetActive(true)
    --                    self.Img_Received02().gameObject:SetActive(true)
    --                    self.Img_guang01().gameObject:SetActive(false)
    --                    self.Img_guang02().gameObject:SetActive(false)
    --                    self.Img_YiLengqudi().gameObject:SetActive(true)
    --                    self.Text_YiLingqu().text = self.idx
    --                end
    --            else
    --                if receivedReward[tostring(self.idx)] == 0 then ---领了低级
    --                    self.Kelingqu().gameObject:SetActive(false)
    --                    self.Img_Received01().gameObject:SetActive(false)
    --                    self.Img_Received02().gameObject:SetActive(false)
    --                    self.Img_guang01().gameObject:SetActive(false)
    --                    self.Img_guang02().gameObject:SetActive(false)
    --                elseif receivedReward[tostring(self.idx)] == 2 then ---领了高级
    --                    self.Kelingqu().gameObject:SetActive(false)
    --                    self.Img_Received01().gameObject:SetActive(true)
    --                    self.Img_Received02().gameObject:SetActive(true)
    --                    self.Img_guang01().gameObject:SetActive(false)
    --                    self.Img_guang02().gameObject:SetActive(false)
    --                    self.Img_YiLengqudi().gameObject:SetActive(true)
    --                    self.Text_YiLingqu().text = self.idx
    --                end
    --            end
    --            receive = false
    --            break
    --        end
    --    end
    --end
    self.Btn_Click().gameObject:SetActive(receive)
    UIEvent.LuaClick(self.Btn_Click().gameObject,function()
        if self.parent.seniorIsUnlock and receivedReward ~= nil and receivedReward[tostring(self.idx)] == 2 then
            ---奖励已领完
        elseif not self.parent.seniorIsUnlock and receivedReward ~= nil and receivedReward[tostring(self.idx)] == 0 then
            ---未解锁高级通行证
        else
            if self.parent.lv >= self.idx then
                PassportControl.AcceptAll(self.parent)
            end
        end
    end)
    UIEvent.LuaClick(self.RewardIconImg().gameObject,function()
        local item =  ItemControl.GetItemByIdAndType(self.normalReward.id,self.normalReward.goodsType)
        self:OnItemClick(item)
    end)
    UIEvent.LuaClick(self.RewardIconImg01().gameObject,function()
        local item = ItemControl.GetItemByIdAndType(self.seniorReward.id,self.seniorReward.goodsType)
        self:OnItemClick(item)
    end)
    UIEvent.LuaClick(self.RewardIconImg02().gameObject,function()
        local item = ItemControl.GetItemByIdAndType(self.seniorReward2.id,self.seniorReward2.goodsType)
        self:OnItemClick(item)
    end)

    --编号
    self.Text_TXZDengji().text = self.idx
    self.Text_Lengqu().text = self.idx

end
--展示奖励细节
function M:OnItemClick(reward)
    MgrUI.Pop(UID.ItemDetailPop_UI,{ reward, true, function()
        ---刷新物品缓存
        BagViewModel.ReloadCacheData()
    end},true)
end

--领取奖励
function M:ActivityRewardSendReq(actId,rewId,rewType,parentUI)
    local activityRewardReq = {
        activityId = actId,
        rewardId = 0,
        rewardType = 2,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientActivityGetRewardREQ',activityRewardReq))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ACTIVITY_GET_REWARD_REQ,bytes,0,nil,PassportControl.ActivityRewardSendACK,
            function (...)
                PassportControl.ActivityRewardSendNTF(...)
                parentUI:InitPassport()
            end)
end

function M:PassesRewardID(sortID)
    local allPassportReward = PassportControl.GetAllPassportReward(PassportControl.GetPassportData().activityId)
    for i,v in pairs(allPassportReward) do
        if v.version == PassportControl.GetPassportData().version and sortID == v.sort then
            return v
        end
    end
    return nil
end


return M