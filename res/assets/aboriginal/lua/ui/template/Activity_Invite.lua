-- Code Auto Create Begin
local M = Class('Activity_Invite', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Invite.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Invite','/',2},{'Img_Invite','Img_Invite',2},{'Img_Title','Img_Invite/Img_Title',2},{'Btn_NewComers','Btn_NewComers',2},{'Img_Invite_L','Btn_NewComers/Img_Invite_L',2},{'Img_Title01','Btn_NewComers/Img_Invite_L/Img_Title',2},{'Img_Title_New','Btn_NewComers/Img_Invite_L/Img_Title_New',2},{'Btn_InviteTask','Btn_InviteTask',2},{'Img_Invite_R','Btn_InviteTask/Img_Invite_R',2},{'Img_Title02','Btn_InviteTask/Img_Invite_R/Img_Title',2},{'Img_Title_Task','Btn_InviteTask/Img_Invite_R/Img_Title_Task',2},{'NewComersPage','NewComersPage',2},{'Img_Line','NewComersPage/Text_InviteTitle/Img_Line',2},{'InputInviteCode','NewComersPage/Text_InviteTitle/InputInviteCode',2},{'Img_Line01','NewComersPage/Text_Reward/Img_Line',2},{'Comers_RewardBg','NewComersPage/Text_Reward/Comers_RewardBg',2},{'Comers_BagItem','NewComersPage/Text_Reward/Comers_BagItem',2},{'Img_frame','NewComersPage/Text_Reward/Comers_BagItem/Img_frame',2},{'RewardRankImg','NewComersPage/Text_Reward/Comers_BagItem/wupin/RewardRankImg',2},{'RewardIconImg','NewComersPage/Text_Reward/Comers_BagItem/wupin/RewardIconImg',2},{'StarPanel','NewComersPage/Text_Reward/Comers_BagItem/wupin/StarPanel',2},{'ItemStarRoot','NewComersPage/Text_Reward/Comers_BagItem/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','NewComersPage/Text_Reward/Comers_BagItem/wupin/StarPanel/ItemStarPrefab',2},{'HighLight','NewComersPage/Text_Reward/Comers_BagItem/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','NewComersPage/Text_Reward/Comers_BagItem/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel','NewComersPage/Text_Reward/Comers_BagItem/wupin/TimeCountDownPanel',2},{'shijian2','NewComersPage/Text_Reward/Comers_BagItem/wupin/TimeCountDownPanel/shijian2',2},{'Img_Mask','NewComersPage/Text_Reward/Comers_BagItem/Img_Mask',2},{'Btn_Receive','NewComersPage/Btn_Receive',2},{'InviteTaskPage','InviteTaskPage',2},{'Img_Line02','InviteTaskPage/Text_InviteTitle/Img_Line',2},{'InputInviteCode01','InviteTaskPage/Text_InviteTitle/InputInviteCode',2},{'Btn_Copy','InviteTaskPage/Text_InviteTitle/Btn_Copy',2},{'Img_Line03','InviteTaskPage/Text_RewardTitle/Img_Line',2},{'Task_RewardBg','InviteTaskPage/Text_RewardTitle/Task_RewardBg',2},{'Task_BagItem','InviteTaskPage/Text_RewardTitle/Task_BagItem',2},{'Img_itembg','InviteTaskPage/Text_RewardTitle/Task_BagItem/Img_itembg',2},{'Img_Exp_h','InviteTaskPage/Text_RewardTitle/Task_BagItem/Img_Exp_h',2},{'Img_Exp_n','InviteTaskPage/Text_RewardTitle/Task_BagItem/Img_Exp_n',2},{'Img_frame01','InviteTaskPage/Text_RewardTitle/Task_BagItem/Img_frame',2},{'RewardRankImg01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/RewardRankImg',2},{'RewardIconImg01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/RewardIconImg',2},{'StarPanel01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/StarPanel',2},{'ItemStarRoot01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/StarPanel/ItemStarPrefab',2},{'HighLight01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/TimeCountDownPanel',2},{'shijian201','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/TimeCountDownPanel/shijian2',2},{'Img_Mask01','InviteTaskPage/Text_RewardTitle/Task_BagItem/Img_Mask',2},{'Btn_Lingqu','InviteTaskPage/Text_RewardTitle/Task_BagItem/Btn_Lingqu',2},{'Img_Yilingqudi','InviteTaskPage/Text_RewardTitle/Task_BagItem/Btn_Lingqu/Img_Yilingqudi',2},{'img_title','img_title',2},
        -- UITemplate 列表
        {'Activity_Invite01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Invite','Btn_NewComers/Img_Invite_L/Text_Invite',20},{'Text_NewComers','Btn_InviteTask/Img_Invite_R/Text_NewComers',20},{'Text_InviteTitle','NewComersPage/Text_InviteTitle',20},{'Placeholder','NewComersPage/Text_InviteTitle/InputInviteCode/Text Area/Placeholder',20},{'Text','NewComersPage/Text_InviteTitle/InputInviteCode/Text Area/Text',20},{'Text_Recieved','NewComersPage/Text_InviteTitle/Text_Recieved',20},{'Text_Reward','NewComersPage/Text_Reward',20},{'ItemCountText','NewComersPage/Text_Reward/Comers_BagItem/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText','NewComersPage/Text_Reward/Comers_BagItem/wupin/TimeCountDownPanel/CountDownText',20},{'Text_Receive','NewComersPage/Btn_Receive/Text_Receive',20},{'Text_InviteTitle01','InviteTaskPage/Text_InviteTitle',20},{'Text_InviteCode','InviteTaskPage/Text_InviteTitle/InputInviteCode/Text_InviteCode',20},{'Text(TMP)','InviteTaskPage/Text_InviteTitle/Btn_Copy/Text (TMP)',20},{'Text_RewardTitle','InviteTaskPage/Text_RewardTitle',20},{'ItemCountText01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText01','InviteTaskPage/Text_RewardTitle/Task_BagItem/wupin/TimeCountDownPanel/CountDownText',20},{'Text_Yilingqu','InviteTaskPage/Text_RewardTitle/Task_BagItem/Btn_Lingqu/Img_Yilingqudi/Text_Yilingqu',20},{'Text_Tips','InviteTaskPage/Text_Tips',20},
        -- TMP_InputField 列表
        {'InputInviteCode02','NewComersPage/Text_InviteTitle/InputInviteCode',21},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_Invite_R().gameObject:SetActive(false)
    self.InviteTaskPage().gameObject:SetActive(false)
    self.Text_Recieved().gameObject:SetActive(false)
    self.NewComersItem = {}
    self.InviteItem = {}
    ---新人专属数据
    self.CurNewComers = InviteControl.GetNewComers()
    ---邀请任务数据
    self.CurInviteTask = InviteControl.GetInviteTask()
    
    self:InitBtn()
end

function M:InitBtn()
    --领取
    UIEvent.LuaClick(self.Btn_Receive().gameObject, Handle(self, function()
        local tInviteCode = self.InputInviteCode02().text
        InviteControl.InCodeReq(tInviteCode,function()
            --更新新人专属领取状态
            self:UpdateComersItem()
        end)
    end))
    --复制
    UIEvent.LuaClick(self.Btn_Copy().gameObject, Handle(self, function()
        Tools.CopyToClipboard(InviteControl.GetInvCode())
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_copy"),1},true)
    end))
    --切换新人专属
    UIEvent.LuaClick(self.Btn_NewComers().gameObject, Handle(self, function()
        self:SwitchPage(true)
    end))
    --切换邀请任务
    UIEvent.LuaClick(self.Btn_InviteTask().gameObject, Handle(self, function()
        self:SwitchPage(false)
    end))
end

function M:OnUpdateUI(pData)
    self:NewComers()
    self:InviteTask()
end

---新人专属
function M:NewComers()
    for i, cfg in ipairs(self.CurNewComers) do
        --展示奖励
        if #self.NewComersItem < i then
            self.NewComersItem[i] = GameObject.Instantiate(self.Comers_BagItem().gameObject, self.Comers_RewardBg().transform)
        end

        local BagItemData = ItemControl.GetItemByIdAndType(cfg.reward.goodsID, cfg.reward.goodsType)

        local ItemPrefab = CJNUIMgr.GetSunUseName(self.NewComersItem[i], "wupin").gameObject
        self:InitItem(ItemPrefab, BagItemData, cfg.reward.goodsNum)
    end
    self.Comers_BagItem().gameObject:SetActive(false)
    --更新新人专属领取状态
    self:UpdateComersItem()
end
---更新新人专属领取状态
function M:UpdateComersItem()
    local num = 0
    for i, v in ipairs(self.NewComersItem) do
        local ItemFrame = CJNUIMgr.GetSunUseName(v, "Img_frame").gameObject
        local ItemMask = CJNUIMgr.GetSunUseName(v, "Img_Mask").gameObject

        ItemFrame:SetActive(self.CurNewComers[i].state)
        ItemMask:SetActive(self.CurNewComers[i].state)
        if self.CurNewComers[i].state then
            num = num + 1
        end
    end

    --self.Text_Recieved().gameObject:SetActive(#self.NewComersItem == num)
    --self.InputInviteCode().gameObject:SetActive(num < #self.NewComersItem)
    if #self.NewComersItem == num then
        self:SwitchPage(false)
    else
        self:SwitchPage(true)
    end
end

function M:SwitchPage(_isNewPage)
    self.NewComersPage().gameObject:SetActive(_isNewPage)
    self.Img_Invite_L().gameObject:SetActive(_isNewPage)
    self.InviteTaskPage().gameObject:SetActive(not _isNewPage)
    self.Img_Invite_R().gameObject:SetActive(not _isNewPage)
end

---邀请任务
function M:InviteTask()
    --自己的邀请码
    self.Text_InviteCode().text = InviteControl.GetInvCode()
    local tInviteNum = InviteControl.GetInviteNum()
    for i, cfg in ipairs(self.CurInviteTask) do
        --展示奖励
        if #self.InviteItem < i then
            self.InviteItem[i] = GameObject.Instantiate(self.Task_BagItem().gameObject, self.Task_RewardBg().transform)
        end

        local BagItemData = ItemControl.GetItemByIdAndType(cfg.reward.goodsID, cfg.reward.goodsType)

        local ItemPrefab = CJNUIMgr.GetSunUseName(self.InviteItem[i], "wupin").gameObject
        self:InitItem(ItemPrefab, BagItemData, cfg.reward.goodsNum)
        --领取状态
        local ExpLight = CJNUIMgr.GetSunUseName(self.InviteItem[i], "Img_Exp_h").gameObject
        local ExpNormal = CJNUIMgr.GetSunUseName(self.InviteItem[i], "Img_Exp_n").gameObject
        local ItemFrame = CJNUIMgr.GetSunUseName(self.InviteItem[i], "Img_frame").gameObject
        if cfg.state or tInviteNum >= cfg.number then
            ExpLight:SetActive(true)
            ExpNormal:SetActive(false)
            ItemFrame:SetActive(true)
        else
            ExpLight:SetActive(false)
            ExpNormal:SetActive(true)
            ItemFrame:SetActive(false)
        end
        if i == #self.CurInviteTask then
            ExpLight:SetActive(false)
            ExpNormal:SetActive(false)
        end
    end
    self.Task_BagItem().gameObject:SetActive(false)
    
    self:UpdateInviteItem()
end
---更新邀请任务领取状态
function M:UpdateInviteItem()
    local tInviteNum = InviteControl.GetInviteNum()
    for i, v in ipairs(self.InviteItem) do
        local ItemMask = CJNUIMgr.GetSunUseName(v, "Img_Mask").gameObject
        local BtnLingqu = CJNUIMgr.GetSunUseName(v, "Btn_Lingqu").gameObject
        
        local cfg = self.CurInviteTask[i]
        if cfg.state then
            ItemMask:SetActive(true)
            BtnLingqu:SetActive(false)
        elseif tInviteNum >= cfg.number then
            ItemMask:SetActive(false)
            BtnLingqu:SetActive(true)
        else
            ItemMask:SetActive(false)
            BtnLingqu:SetActive(false)
        end
        --领取任务奖励
        UIEvent.LuaClick(BtnLingqu,function()
            InviteControl.ClaimRewardReq(function()
                self:UpdateInviteItem()
            end)
        end)
    end
end

function M:InitItem(_item, BagItem, itemCount)
    local _ItemStarPrefab = CJNUIMgr.GetSunUseName(_item, "ItemStarPrefab")
    local _ItemStarRoot = CJNUIMgr.GetSunUseName(_item, "ItemStarRoot")
    local _ItemCountText = CJNUIMgr.GetSunUseName(_item, "ItemCountText"):GetComponent("TextMeshProUGUI")
    local _RewardRankImg = CJNUIMgr.GetSunUseName(_item, "RewardRankImg"):GetComponent("Image")
    local _RewardIconImg = CJNUIMgr.GetSunUseName(_item, "RewardIconImg"):GetComponent("Image")
    local _Starpanel = CJNUIMgr.GetSunUseName(_item, "StarPanel")
    self.starHLObj = {}
    for i = 1, 6 do
        local obj = GameObject.Instantiate(_ItemStarPrefab.gameObject,_ItemStarRoot.gameObject.transform,false)
        self.starHLObj[i] = obj.transform:Find("HighLight").gameObject
    end
    ---为0不显示星级
    _Starpanel.gameObject:SetActive(BagItem.star > 0)
    ---大于0更新星级显示
    --if BagItem.goodsType == 2 then
    if BagItem.star > 0 then
        for i = 1,#self.starHLObj do
            self.starHLObj[i]:SetActive(i <= BagItem.star)
        end
    end

    ---设置品质
    MgrRes.LoadSprite(_RewardRankImg,BagItem.iconFrame)
    ---设置图标
    MgrRes.LoadSprite(_RewardIconImg,BagItem.icon)
    ---设置数量
    _ItemCountText.text = JNStrTool.numberAbbr(itemCount) --itemCount >= 10000 and math.floor(tonumber(itemCount)/1000).."K" or itemCount
    ---设置点击事件
    UIEvent.LuaClick(_item,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem, false, function() end},true)
    end)
end

return M