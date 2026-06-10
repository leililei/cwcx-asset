-- Code Auto Create Begin
local M = Class('Activity_Fund', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Fund.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Fund','/',2},{'Btn_Point','SwitchPanel/Btn_Point',2},{'Jifenmubiao_H','SwitchPanel/Btn_Point/Jifenmubiao_H',2},{'Jifenmubiao','SwitchPanel/Btn_Point/Jifenmubiao',2},{'PointRedDotIcon','SwitchPanel/Btn_Point/PointRedDotIcon',2},{'Btn_Task','SwitchPanel/Btn_Task',2},{'Renwumubiao_H','SwitchPanel/Btn_Task/Renwumubiao_H',2},{'Renwumubiao','SwitchPanel/Btn_Task/Renwumubiao',2},{'TaskRedDotIcon','SwitchPanel/Btn_Task/TaskRedDotIcon',2},{'PointPanel','PointPanel',2},{'Gaojijiangli','PointPanel/Gaojijiangli',2},{'Chujijiangli','PointPanel/Chujijiangli',2},{'Img_PointClick','PointPanel/PointAwardScroll/PointItem/Img_PointClick',2},{'Img_CanReceive','PointPanel/PointAwardScroll/PointItem/Img_CanReceive',2},{'AwardItem','PointPanel/PointAwardScroll/PointItem/AwardItem',2},{'RewardRankImg','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/RewardRankImg',2},{'RewardIconImg','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/RewardIconImg',2},{'StarPanel','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/StarPanel',2},{'ItemStarRoot','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/StarPanel/ItemStarPrefab',2},{'HighLight','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/Img_ItemCountBg',2},{'Img_Received','PointPanel/PointAwardScroll/PointItem/AwardItem/Img_Received',2},{'Img_Gou','PointPanel/PointAwardScroll/PointItem/AwardItem/Img_Received/Img_Gou',2},{'PayAwardItem','PointPanel/PointAwardScroll/PointItem/PayAwardItem',2},{'RewardRankImg01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/RewardRankImg',2},{'RewardIconImg01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/RewardIconImg',2},{'StarPanel01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/StarPanel',2},{'ItemStarRoot01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/StarPanel/ItemStarPrefab',2},{'HighLight01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/Img_ItemCountBg',2},{'Img_Suo2','PointPanel/PointAwardScroll/PointItem/PayAwardItem/Img_Suo2',2},{'Suo','PointPanel/PointAwardScroll/PointItem/PayAwardItem/Img_Suo2/Suo',2},{'Img_PayReceived','PointPanel/PointAwardScroll/PointItem/PayAwardItem/Img_PayReceived',2},{'Img_Gou01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/Img_PayReceived/Img_Gou',2},{'Content','PointPanel/PointAwardScroll/Content',2},{'Btn_CeiveState','PointPanel/BtnPanel/Btn_CeiveState',2},{'Btn_UnPointCeive','PointPanel/BtnPanel/Btn_CeiveState/Btn_UnPointCeive',2},{'Btn_PointCeive','PointPanel/BtnPanel/Btn_CeiveState/Btn_PointCeive',2},{'Btn_Jiesuo','PointPanel/BtnPanel/Btn_Jiesuo',2},{'Img_di','PointPanel/BtnPanel/Btn_Jiesuo/Img_di',2},{'Img_Coin','PointPanel/BtnPanel/Btn_Jiesuo/Img_di/Img_Coin',2},{'TaskPanel','TaskPanel',2},{'Renwu','TaskPanel/Renwu',2},{'Img_TaskClick','TaskPanel/TaskAwardScroll/FundTaskItem/Img_TaskClick',2},{'Img_CanReceivebg','TaskPanel/TaskAwardScroll/FundTaskItem/Img_CanReceivebg',2},{'Img_Jiantou','TaskPanel/TaskAwardScroll/FundTaskItem/Text_Qianwang/Img_Jiantou',2},{'Img_TaskProgressBarBg','TaskPanel/TaskAwardScroll/FundTaskItem/Img_TaskProgressBarBg',2},{'Img_TaskProgressBar','TaskPanel/TaskAwardScroll/FundTaskItem/Img_TaskProgressBarBg/Img_TaskProgressBar',2},{'AwardItem1','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1',2},{'RewardRankImg02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/RewardRankImg',2},{'RewardIconImg02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/RewardIconImg',2},{'StarPanel02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel',2},{'ItemStarRoot02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel/ItemStarPrefab',2},{'HighLight02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/Img_ItemCountBg',2},{'AwardItem2','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2',2},{'RewardRankImg03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/RewardRankImg',2},{'RewardIconImg03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/RewardIconImg',2},{'StarPanel03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel',2},{'ItemStarRoot03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel/ItemStarPrefab',2},{'HighLight03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/Img_ItemCountBg',2},{'Completed','TaskPanel/TaskAwardScroll/FundTaskItem/Completed',2},{'Img_CompletedDi','TaskPanel/TaskAwardScroll/FundTaskItem/Completed/Img_CompletedDi',2},{'Content01','TaskPanel/TaskAwardScroll/Content',2},{'Btn_UnTaskceive','TaskPanel/Btn_UnTaskceive',2},{'Btn_TaskCeive','TaskPanel/Btn_TaskCeive',2},
        -- UITemplate 列表
        {'Activity_Fund01','/',10},
        -- Toggle 列表
        {'Btn_Point01','SwitchPanel/Btn_Point',13},{'Btn_Task01','SwitchPanel/Btn_Task',13},
        -- LoopScrollRect 列表
        {'PointAwardScroll','PointPanel/PointAwardScroll',18},{'TaskAwardScroll','TaskPanel/TaskAwardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_LIjihuode','Text_LIjihuode',20},{'Text_AwardNum','Text_LIjihuode/Text_AwardNum',20},{'Text_Jifendianshu','Jifendianshu/Text_Jifendianshu',20},{'Text_Point','Jifendianshu/Text_Point',20},{'Text_Jifenmubiao','SwitchPanel/Btn_Point/Jifenmubiao_H/Text_Jifenmubiao',20},{'Text_Jifenmubiao01','SwitchPanel/Btn_Point/Jifenmubiao/Text_Jifenmubiao',20},{'Text_Renwumubiao','SwitchPanel/Btn_Task/Renwumubiao_H/Text_Renwumubiao',20},{'Text_Renwumubiao01','SwitchPanel/Btn_Task/Renwumubiao/Text_Renwumubiao',20},{'Text_Gaojijiangli','PointPanel/Gaojijiangli/Text_Gaojijiangli',20},{'Text_Chujijiangli','PointPanel/Chujijiangli/Text_Chujijiangli',20},{'Text_Tiaojian','PointPanel/PointAwardScroll/PointItem/Text_Tiaojian',20},{'ItemCountText','PointPanel/PointAwardScroll/PointItem/AwardItem/wupin/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','PointPanel/PointAwardScroll/PointItem/PayAwardItem/wupin/Img_ItemCountBg/ItemCountText',20},{'Text_YiJianLingQu','PointPanel/BtnPanel/Btn_CeiveState/Btn_UnPointCeive/Text_YiJianLingQu',20},{'Text_YiJianLingQu01','PointPanel/BtnPanel/Btn_CeiveState/Btn_PointCeive/Text_YiJianLingQu',20},{'Text_Jiesuo','PointPanel/BtnPanel/Btn_Jiesuo/Text_Jiesuo',20},{'Text_Jine','PointPanel/BtnPanel/Btn_Jiesuo/Img_di/Text_Jine',20},{'Text_Renwu','TaskPanel/Renwu/Text_Renwu',20},{'Text_Qianwang','TaskPanel/TaskAwardScroll/FundTaskItem/Text_Qianwang',20},{'Text_TaskTitle','TaskPanel/TaskAwardScroll/FundTaskItem/Text_TaskTitle',20},{'Text_TaskProgress','TaskPanel/TaskAwardScroll/FundTaskItem/Text_TaskProgress',20},{'ItemCountText02','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem1/wupin/Img_ItemCountBg/ItemCountText',20},{'ItemCountText03','TaskPanel/TaskAwardScroll/FundTaskItem/RewardItemContent/AwardItem2/wupin/Img_ItemCountBg/ItemCountText',20},{'Text_Completed','TaskPanel/TaskAwardScroll/FundTaskItem/Completed/Img_CompletedDi/Text_Completed',20},{'Text_YiJianLingQu02','TaskPanel/Btn_UnTaskceive/Text_YiJianLingQu',20},{'Text_YiJianLingQu03','TaskPanel/Btn_TaskCeive/Text_YiJianLingQu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.PointPanel().gameObject:SetActive(false)
    self.TaskPanel().gameObject:SetActive(false)

    self.ActiveID = 0
    self.CurPanel = nil
    self.mPointData = nil
    self.mTaskData = nil
    self.FundData = 0
    self.BuyGoods = { tonumber(SteamLocalData.tab[113044][2]),1 }
    
    self.BtnAllTask = false         ---任务一键按钮锁
    self.BtnAllPoint = false        ---积分一键按钮锁
    self.Price = nil

    self:InitCoin()
    self:InitScroll()
    self:InitButton()
end

function M:InitScroll()
    self.PointAwardScroll():SetLuaCellEvent(Handle(self, self.PointCell))
    self.TaskAwardScroll():SetLuaCellEvent(Handle(self, self.TaskCell))
end


function M:InitButton()
    ---积分和任务界面切换
    Tools.ToggleValueChange(self.Btn_Point01(), function(isOn)
        self.Jifenmubiao_H().gameObject:SetActive(isOn)
        self.Jifenmubiao().gameObject:SetActive(not isOn)
        if isOn then
            self:SwitchUI(self.PointPanel())
        end
    end)
    Tools.ToggleValueChange(self.Btn_Task01(), function(isOn)
        self.Renwumubiao_H().gameObject:SetActive(isOn)
        self.Renwumubiao().gameObject:SetActive(not isOn)
        if isOn then
            self:SwitchUI(self.TaskPanel())
        end
    end)
    self.Btn_Point01().isOn = false
    self.Btn_Point01().isOn = true
    ---积分一键领取
    UIEvent.LuaClick(self.Btn_PointCeive().gameObject,function()
        FundControl.AcceptAll(self.FundData.activityID, 0, function()
            self:ReloadData("point")
            
            self:RefreshBtn()
            
            Event.Go("ActivityDot")
        end)
    end)
    ---任务一键领取
    UIEvent.LuaClick(self.Btn_TaskCeive().gameObject,function()
        if self.FundData.taskID and self.FundData.taskID ~= 0 then
            AchievementViewModel.TaskPerform(0, 0,nil,self.FundData.taskID,function()
                self:ReloadData("task")
                self:ReloadData("point")
                
                self:RefreshBtn()
                
                Event.Go("ActivityDot")
            end)
        end
    end)
    ---解锁高级奖励
    UIEvent.LuaClick(self.Btn_Jiesuo().gameObject,function()
        local BagItemData = ItemControl.GetItemByIdAndType(self.Price.goodsID,self.Price.goodsType)
        if BagItemData.count < self.Price.goodsNum then
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("need_more_diamond"),Handle(self, function()
                MgrLink.LinkStart("tz_sc_cz_01")
            end),nil,2})
            return
        end
        local str = string.format(MgrLanguageData.GetLanguageByKey("ui_fund_text2"), self.Price.goodsNum)
        MgrUI.Pop(UID.ConfirmPop_UI,{ str,function()
            ShopViewModel.SendBuyGoods(self.BuyGoods,function()
                self:ReloadData("point")
                self.Btn_Jiesuo().gameObject:SetActive(false)
                
                self:RefreshBtn()
            end)
        end,nil,2 })
    end)
end
---初始化高级解锁价格
function M:InitCoin()
    if FundControl.CheckSeniorLock() then
        self.Btn_Jiesuo().gameObject:SetActive(false)
    else
        local tShopData = ShopControl.GetSingLeShopItemData(self.BuyGoods[1])
        local tItemData = Global.GetLocalDataByGoods(tShopData.ladderPrice[0])

        self.Price = tShopData.ladderPrice[0]
        self.Text_Jine().text = tostring(self.Price.goodsNum)
        MgrRes.LoadSprite(self.Img_Coin(),"Item/"..tItemData.icon)
        self.Btn_Jiesuo().gameObject:SetActive(true)
    end
end

function M:OnUpdateUI(pData)
    self.ActiveID = pData[1]
    self.FundData = FundControl.GetFundByActivityId(self.ActiveID)
    
    self:ReloadData("point")
    self:ReloadData("task")
    self:RefreshBtn()
end
---积分Item
function M:PointCell(trans,idx)
    local _PointClick = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_PointClick")
    local _Tips = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_Tiaojian"):GetComponent("TextMeshProUGUI")
    local _Item = CJNUIMgr.GetSunUseName(trans.gameObject, "AwardItem")
    local _PayItem = CJNUIMgr.GetSunUseName(trans.gameObject, "PayAwardItem")
    --local _CanReceive = CJNUIMgr.GetSunUseName(trans.gameObject, "CanReceive")
    --local _PayCanReceive = CJNUIMgr.GetSunUseName(trans.gameObject, "PayCanReceive")
    local _CanReceive = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_CanReceive")
    local _Received = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Received")
    local _PayReceived = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_PayReceived")
    local _Suo = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Suo2")
    
    _Tips.text = string.format(MgrLanguageData.GetLanguageByKey("ui_fund_text1"),self.mPointData[idx].factor[3])
    UIEvent.LuaClick(_PointClick.gameObject, function()
        FundControl.AcceptAll(self.FundData.activityID, 0, function()
            self:ReloadData("point")
            
            self:RefreshBtn()
            
            Event.Go("ActivityDot")
        end)
    end)
    ---领取状态(0.未完成 1.未领取 2.已领取)
    if self.mPointData[idx].canReceive ~= 1 and self.mPointData[idx].highCanReceive ~= 1 then
        _CanReceive.gameObject:SetActive(false)
        
        _Received.gameObject:SetActive(self.mPointData[idx].canReceive == 2)
        _PayReceived.gameObject:SetActive(self.mPointData[idx].highCanReceive == 2)
    else
        _CanReceive.gameObject:SetActive(true)
        
        ---判断普通奖励是否领取
        if self.mPointData[idx].canReceive == 2 then
            _Received.gameObject:SetActive(true)
        else
            _Received.gameObject:SetActive(false)
        end
        ---判断高级奖励是否领取
        if self.mPointData[idx].highCanReceive == 2 then
            _PayReceived.gameObject:SetActive(true)
        else
            _PayReceived.gameObject:SetActive(false)
        end
    end
    _Suo.gameObject:SetActive(not FundControl.CheckSeniorLock())
    
    local BagItemData = ItemControl.GetItemByIdAndType(tonumber(self.mPointData[idx].normalAward[2]),tonumber(self.mPointData[idx].normalAward[1]))
    self:SetAward(_Item, BagItemData, self.mPointData[idx].normalAward[3])
    BagItemData = ItemControl.GetItemByIdAndType(tonumber(self.mPointData[idx].highAward[2]),tonumber(self.mPointData[idx].highAward[1]))
    self:SetAward(_PayItem, BagItemData, self.mPointData[idx].highAward[3])
end
---任务Item
function M:TaskCell(trans,idx)
    local _TaskClick = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_TaskClick")
    local _Tips = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_TaskTitle"):GetComponent("TextMeshProUGUI")
    local _TipProgress = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_TaskProgress"):GetComponent("TextMeshProUGUI")
    local _TipProgressBar = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_TaskProgressBar"):GetComponent("Image")
    local _Completed = CJNUIMgr.GetSunUseName(trans.gameObject, "Completed")
    local _CanReceivebg = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_CanReceivebg")
    local _Qianwang = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_Qianwang")
    local _AwardItem1 = CJNUIMgr.GetSunUseName(trans.gameObject, "AwardItem1")
    local _AwardItem2 = CJNUIMgr.GetSunUseName(trans.gameObject, "AwardItem2")

    local taskData = self.mTaskData[idx]
    _Tips.text = taskData.txt
    ---设置进度条
    local progressStr = JNStrTool.strSplit("_", taskData.complete)
    local value = ActivationTaskViewModel.GetStatisticValue(taskData.type, tonumber(progressStr[1]))
    if value > tonumber(progressStr[3]) then
        value = tonumber(progressStr[3])
    end
    _TipProgressBar.fillAmount = value / tonumber(progressStr[3])
    ---进度文本
    _TipProgress.text = Global.GetConciseCount(value) .. "<color=#7A7A7A>/" .. Global.GetConciseCount(tonumber(progressStr[3])).. "</color>"

    ---是否已完成
    local tCanRec = false
    if taskData.isComplete == 1 then
        _Completed.gameObject:SetActive(true)
        _CanReceivebg.gameObject:SetActive(false)
        _Qianwang.gameObject:SetActive(false)
        trans.transform:GetComponent("CanvasGroup").alpha = 0.5
    else
        _CanReceivebg.gameObject:SetActive(false)
        _Completed.gameObject:SetActive(false)
        _Qianwang.gameObject:SetActive(true)
        ---是否可领取
        if value >= tonumber(progressStr[3]) then
            _CanReceivebg.gameObject:SetActive(true)
            _Qianwang.gameObject:SetActive(false)
            tCanRec = true
        end
        trans.transform:GetComponent("CanvasGroup").alpha = 1
    end
    
    UIEvent.LuaClick(_TaskClick.gameObject, function()
        if not tCanRec then
            MgrLink.LinkStart(taskData.gotoID)
        else
            AchievementViewModel.TaskPerform(0, taskData.id,nil,nil,function()
                self:ReloadData("task")
                self:ReloadData("point")
                
                self:RefreshBtn()
                
                Event.Go("ActivityDot")
            end)
        end
    end)

    local BagItemData = ItemControl.GetItemByIdAndType(taskData.reward[1].goodsID,taskData.reward[1].goodsType)
    self:SetAward(_AwardItem1, BagItemData, taskData.reward[1].goodsNum)
    if taskData.reward[2] then
        BagItemData = ItemControl.GetItemByIdAndType(taskData.reward[2].goodsID,taskData.reward[2].goodsType)
        self:SetAward(_AwardItem2, BagItemData, taskData.reward[2].goodsNum)
    else
        _AwardItem2.gameObject:SetActive(false)
    end
end

function M:SetAward(_item, BagItem, itemCount)
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
    _ItemCountText.text = JNStrTool.numberAbbr(itemCount)
    ---设置点击事件
    UIEvent.LuaClick(_item,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem, false, function() end},true)
    end)
end

---刷新成就滑动数据
function M:ReloadData(_strType)
    if _strType == "point" then
        self.mPointData = FundControl.GetPointGroup(self.ActiveID)
        if self.mPointData then
            self.PointAwardScroll().totalCount = #self.mPointData
            self.PointAwardScroll():RefillCells(0)
        end
    elseif _strType == "task" then
        self.mTaskData = FundControl.GetTaskGroup(self.ActiveID)
        if self.mTaskData then
            self.TaskAwardScroll().totalCount = #self.mTaskData
            self.TaskAwardScroll():RefillCells(0)
        end
    end
    ---刷新积分
    self.Text_Point().text = FundControl.GetPointCount(self.ActiveID)
end

---切换界面
function M:SwitchUI(_panel)
    if self.CurPanel == _panel then
        return
    end
    if self.CurPanel ~= nil then
        self.CurPanel.gameObject:SetActive(false)
    end
    self.CurPanel = _panel
    self.CurPanel.gameObject:SetActive(true)
end

---刷新按钮状态
function M:RefreshBtn()
    FundControl.RefreshRedPoint()
    for i, v in pairs(RedDotControl.GetDotData("Fund").childNodeData) do
        if v.name == "FundPoint" then
            self.Btn_PointCeive().gameObject:SetActive(v.State)
            self.Btn_UnPointCeive().gameObject:SetActive(not v.State)
            
            self.BtnAllTask = v.State
            self.PointRedDotIcon().gameObject:SetActive(v.State)
        elseif v.name == "FundTask" then
            self.Btn_TaskCeive().gameObject:SetActive(v.State)
            self.Btn_UnTaskceive().gameObject:SetActive(not v.State)
            
            self.BtnAllPoint = v.State
            self.TaskRedDotIcon().gameObject:SetActive(v.State)
        end
    end
    
end

return M