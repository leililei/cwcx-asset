-- Code Auto Create Begin
local M = Class('Activity_Power', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Power.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Power','/',2},{'TaskPanel','TaskPanel',2},{'Renwu','TaskPanel/Renwu',2},{'Img_TaskClick','TaskPanel/TaskAwardScroll/PowerTaskItem/Img_TaskClick',2},{'Img_CanReceivebg','TaskPanel/TaskAwardScroll/PowerTaskItem/Img_CanReceivebg',2},{'Img_Jiantou','TaskPanel/TaskAwardScroll/PowerTaskItem/Text_Qianwang/Img_Jiantou',2},{'Img_TaskProgressBarBg','TaskPanel/TaskAwardScroll/PowerTaskItem/Img_TaskProgressBarBg',2},{'Img_TaskProgressBar','TaskPanel/TaskAwardScroll/PowerTaskItem/Img_TaskProgressBarBg/Img_TaskProgressBar',2},{'AwardItem1','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1',2},{'RewardRankImg','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/RewardRankImg',2},{'RewardIconImg','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/RewardIconImg',2},{'StarPanel','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel',2},{'ItemStarRoot','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel/ItemStarPrefab',2},{'HighLight','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/Img_ItemCountBg',2},{'AwardItem2','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2',2},{'RewardRankImg01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/RewardRankImg',2},{'RewardIconImg01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/RewardIconImg',2},{'StarPanel01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel',2},{'ItemStarRoot01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel/ItemStarPrefab',2},{'HighLight01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/Img_ItemCountBg',2},{'Completed','TaskPanel/TaskAwardScroll/PowerTaskItem/Completed',2},{'Img_CompletedDi','TaskPanel/TaskAwardScroll/PowerTaskItem/Completed/Img_CompletedDi',2},{'Content','TaskPanel/TaskAwardScroll/Content',2},{'Btn_UnTaskceive','TaskPanel/Btn_UnTaskceive',2},{'Btn_TaskCeive','TaskPanel/Btn_TaskCeive',2},{'EventTime','EventTime',2},
        -- UITemplate 列表
        {'Activity_Power01','/',10},
        -- LoopScrollRect 列表
        {'TaskAwardScroll','TaskPanel/TaskAwardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Jifendianshu','Jifendianshu/Text_Jifendianshu',20},{'Text_Point','Jifendianshu/Text_Point',20},{'Text_Renwu','TaskPanel/Renwu/Text_Renwu',20},{'Text_Qianwang','TaskPanel/TaskAwardScroll/PowerTaskItem/Text_Qianwang',20},{'Text_TaskTitle','TaskPanel/TaskAwardScroll/PowerTaskItem/Text_TaskTitle',20},{'Text_TaskProgress','TaskPanel/TaskAwardScroll/PowerTaskItem/Text_TaskProgress',20},{'ItemCountText','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem1/wupin/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','TaskPanel/TaskAwardScroll/PowerTaskItem/RewardItemContent/AwardItem2/wupin/Img_ItemCountBg/ItemCountText',20},{'Text_Completed','TaskPanel/TaskAwardScroll/PowerTaskItem/Completed/Img_CompletedDi/Text_Completed',20},{'Text_YiJianLingQu','TaskPanel/Btn_UnTaskceive/Text_YiJianLingQu',20},{'Text_YiJianLingQu01','TaskPanel/Btn_TaskCeive/Text_YiJianLingQu',20},{'Text_Huodongjieshushijian','EventTime/Text_Huodongjieshushijian',20},{'Text_Date','EventTime/Text_Date',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.mTaskData = nil
    self.ActData = nil
    ---任务组
    self.SubType = 0

    self:InitScroll()
    self:InitButton()
end

function M:InitScroll()
    self.TaskAwardScroll():SetLuaCellEvent(Handle(self, self.TaskCell))
end

function M:InitButton()
    ---任务一键领取
    UIEvent.LuaClick(self.Btn_TaskCeive().gameObject,function()
        if self.SubType and self.SubType ~= 0 then
            AchievementViewModel.TaskPerform(0, 0,nil,self.SubType,function()
                self:ReloadData()
                self:RefreshBtn()

                Event.Go("ActivityDot")
            end)
        end
    end)
end

function M:OnUpdateUI(pData)
    self.ActData = ActivityControl.GetActivityByID(pData[1])

    --杂项表获取的任务ID
    local tValue = TaskControl.GetGloryValue(tonumber(SteamLocalData.tab[109006][2]))
    --体力消耗
    self.Text_Point().text = tValue

    ---活动时间
    local tEndTime = string.split(self.ActData.endTime,'-')
    local beginTime = string.split(self.ActData.beginTime,'-')
    local _time = beginTime[1].."/"..beginTime[2].."/"..beginTime[3].."~"..
            tEndTime[1].."/"..tEndTime[2].."/"..tEndTime[3]
    self.Text_Date().text = _time
    
    self:ReloadData()
    self:RefreshBtn()
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
                self:ReloadData()
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
    local tStarHLObj = {}
    Tools.ClearAllChild(_ItemStarRoot.gameObject)
    for i = 1, 6 do
        local obj = GameObject.Instantiate(_ItemStarPrefab.gameObject,_ItemStarRoot.gameObject.transform,false)
        obj.gameObject:SetActive(true)
        tStarHLObj[i] = obj.transform:Find("HighLight").gameObject
    end
    ---为0不显示星级
    _Starpanel.gameObject:SetActive(BagItem.star > 0)

    if BagItem.star > 0 then
        for i = 1,#tStarHLObj do
            tStarHLObj[i]:SetActive(i <= BagItem.star)
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
function M:ReloadData()
    --任务列表
    self.mTaskData = TaskControl.GetAchievementDataByID(self.ActData.TaskList)
    if self.mTaskData and self.TaskAwardScroll().totalCount ~= #self.mTaskData then
        self.SubType = self.mTaskData[1].activeId
        self.TaskAwardScroll().totalCount = #self.mTaskData
    end

    table.sort(self.mTaskData, function(a,b)
        if a.isComplete > b.isComplete then
            return false
        elseif a.isComplete < b.isComplete then
            return true
        else
            if a.isReceive > b.isReceive then
                return true
            elseif a.isReceive < b.isReceive then
                return false
            else
                return a.id < b.id
            end
        end
    end)
    self.TaskAwardScroll():RefillCells(0)
end

---刷新按钮状态
function M:RefreshBtn()
    ActivityControl.CheckPowerRedDot()
    
    self.Btn_TaskCeive().gameObject:SetActive(RedDotControl.GetDotData("PowerCost").State)
    self.Btn_UnTaskceive().gameObject:SetActive(not RedDotControl.GetDotData("PowerCost").State)
end
return M