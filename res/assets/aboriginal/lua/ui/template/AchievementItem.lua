-- Code Auto Create Begin
local M = Class('AchievementItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/AchievementItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'AchievementDi','AchievementDi',2},{'Img_ExpBg','Img_ExpBg',2},{'Img_Exp','Img_Exp',2},{'Img_Titlexian','Img_Titlexian',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'RewardItemVFX','RewardItemPreFab/RewardItemVFX',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItemPreFab/Img_Received',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'AchievementIcon','AchievementIcon',2},{'VFXIcon','VFXIcon',2},{'Btn_Receive','Btn_Receive',2},{'Img_Lingqudi','Btn_Receive/Img_Lingqudi',2},{'Btn_Proceed','Btn_Proceed',2},{'Img_Qianwangdi','Btn_Proceed/Img_Qianwangdi',2},{'Img_Jiantou(huang)','Btn_Proceed/Img_Jiantou(huang)',2},{'CompletedPanel','CompletedPanel',2},{'ReceivedKuang','CompletedPanel/ReceivedKuang',2},{'zhezhao','CompletedPanel/zhezhao',2},
        -- UITemplate 列表
        {'AchievementItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Title','Img_Titlexian/Text_Title',20},{'Text_TaskTitle','Text_TaskTitle',20},{'Text_TaskProgress','Text_TaskProgress',20},{'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_Lingqu','Btn_Receive/Text_Lingqu',20},{'Text_Qianwang','Btn_Proceed/Text_Qianwang',20},{'Text_Received','CompletedPanel/Text_Received',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItemPreFab().gameObject:SetActive(false)

    self.RewardObj =
    {
        [1] = self.item1().gameObject,
        [2] = self.item2().gameObject,
        [3] = self.item3().gameObject
    }
end

function M:OnUpdateUI(pData)
    ---@type AchievementTaskData
    local taskData = pData[1]   ---任务数据
    self.Parent = pData[2]
    self.taskId = taskData.id   ---任务id
    ---完成进度
    local progressStr = 0
    local value = 0
    if taskData.UINum == 0 then
        progressStr = JNStrTool.strSplit("_",taskData.complete)
        value = AchievementViewModel.GetStatisticValue(tonumber(progressStr[1]))
        local complete = string.split(taskData.complete,"_")
        if complete[2] == ">=" then
            if value > tonumber(progressStr[3]) then
                value = tonumber(progressStr[3])
            end
        else
            if taskData.isReceive == 1 then
                value = tonumber(progressStr[3])
            else
                value = 0
            end
        end
        ---任务进度
        self.Text_TaskProgress().text = Global.GetConciseCount(value).."/"..Global.GetConciseCount(tonumber(progressStr[3]))
        ---任务进度
        self.Img_Exp().fillAmount = value/tonumber(progressStr[3])
    else
        progressStr = taskData.UINum
        value = AchievementViewModel.GetStatisticValue(tonumber(JNStrTool.strSplit("_",taskData.complete)[1]))
        ---任务进度
        self.Text_TaskProgress().text = Global.GetConciseCount(value).."/"..Global.GetConciseCount(progressStr)
        ---任务进度
        self.Img_Exp().fillAmount = value/progressStr
    end

    --判断icon是否为勋章
    if taskData.medal ~= "0" then
        local good =  string.split(taskData.medal,'_')
        local dat = HideLocalData.tab[tonumber(good[2])]

        if dat.anime and dat.anime ~= "" and dat.anime ~= "0" then
            Tools.ClearAllChild(self.VFXIcon().gameObject)
            self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
            MgrRes.GetPrefab(self.vfx_path..dat.anime..".prefab",function(Obj)
                if Obj == nil then return end
                Obj.transform:SetParent(self.VFXIcon().gameObject.transform)
                Obj.transform.localPosition = Vector3.zero
                Obj.transform.localScale = Vector3(42,42,1)
            end)
        else
            Tools.ClearAllChild(self.VFXIcon().gameObject)
            self.AchievementIcon().gameObject:SetActive(true)
            MgrRes.LoadSprite(self.AchievementIcon(),"Item/"..dat.icon)
        end
    else
        Tools.ClearAllChild(self.VFXIcon().gameObject)
        self.AchievementIcon().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.AchievementIcon(),"Item/"..taskData.icon)
    end
    
    ---成就名
    self.Text_Title().text = taskData.name
    ---任务说明
    self.Text_TaskTitle().text = taskData.txt
    ---判断任务是否完成do
    if taskData.isComplete == 1 then
        ---已完成
        self.CompletedPanel().gameObject:SetActive(true)
        self.Btn_Receive().gameObject:SetActive(false)
        self.Btn_Proceed().gameObject:SetActive(false)
        self.AchievementItem().transform:GetComponent("CanvasGroup").alpha = 0.5
    else
        ---未完成
        self.CompletedPanel().gameObject:SetActive(false)
        if taskData.isReceive == 1 then
            self.Btn_Proceed().gameObject:SetActive(false)
            self.Btn_Receive().gameObject:SetActive(true)
            self.Parent.CanReceiveCount = self.Parent.CanReceiveCount + 1
        else
            self.Btn_Proceed().gameObject:SetActive(true)
            ---注册跳转事件
            UIEvent.LuaClick(self.Btn_Proceed().gameObject,Handle(self,function()
                self:AchievementJump(taskData)
            end))
            self.Btn_Receive().gameObject:SetActive(false)
            end
        self.AchievementItem().transform:GetComponent("CanvasGroup").alpha = 1
    end
    for i, v in pairs(self.RewardObj) do
        Tools.ClearAllChild(v)
    end
    for i, v in pairs(taskData.reward) do
        local obj = GameObject.Instantiate(self.RewardItemPreFab().gameObject,self.RewardObj[i].transform,false)
        obj.transform.localPosition = Vector3.zero;
        obj.transform.localScale = Vector3.one;
        obj:SetActive(true)
        local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
        local RewardItemVFX = obj.transform:Find("RewardItemVFX"):GetComponent("Image")
        local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
        local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        local Img_Received = obj.transform:Find("Img_Received").gameObject
        local ItemStarPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
        local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
        local StarPanel = obj.transform:Find("StarPanel").gameObject
        ---@type ItemData
        local itemData = ItemControl.GetItemByType(v.goodsType,v.goodsID)
        ---设置品质
        MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
        ---边框闪烁
        if itemData.quality == 1 or itemData.quality == 2 then
            RewardRankImg.transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
        elseif itemData.quality == 3 then
            RewardRankImg.transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
        elseif itemData.quality == 4 then
            RewardRankImg.transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
        end
        ---设置图标
        if itemData.anime and itemData.anime ~= "0" then
            Tools.ClearAllChild(RewardItemVFX.gameObject)
            self.RewardIconImg().gameObject:SetActive(false)

            MgrRes.LoadSprite(RewardIconImg,"Item/"..itemData.icon)

            self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
            MgrRes.GetPrefab(self.vfx_path..itemData.anime..".prefab",function(Obj)
                if Obj == nil then return end
                Obj.transform:SetParent(RewardItemVFX.gameObject.transform)
                Obj.transform.localPosition = Vector3.zero
                Obj.transform.localScale = Vector3(20,20,1)
            end)
        else
            Tools.ClearAllChild(RewardItemVFX.gameObject)
            self.RewardIconImg().gameObject:SetActive(true)
            MgrRes.LoadSprite(RewardIconImg,"Item/"..itemData.icon)
        end
       
        ---设置数量
        ItemCountText.text = JNStrTool.numberAbbr(v.goodsNum) --v.goodsNum >= 10000 and math.floor(tonumber(v.goodsNum)/1000).."K" or v.goodsNum
        ---是否已领取
        if taskData.isComplete == 1 then
            Img_Received:SetActive(true)
        else
            Img_Received:SetActive(false)
        end
        ---设置星级
        if itemData.itemstar > 0 then
            StarPanel:SetActive(true)
            self:InitStarPanel(itemData.itemstar,ItemStarRoot,ItemStarPrefab)
        else
            StarPanel:SetActive(false)
        end
        ItemStarPrefab:SetActive(false)
        UIEvent.LuaClick(obj, Handle(self, function()
            local item = ItemControl.GetItemByIdAndType(v.goodsID,v.goodsType)
            MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
        end))
    end

    if self.Parent.CanReceiveCount > 0 then
        self.Parent.Btn_AllReceive().gameObject:SetActive(true)
        self.Parent.Btn_UnAllReceive().gameObject:SetActive(false)
    else
        self.Parent.Btn_AllReceive().gameObject:SetActive(false)
        self.Parent.Btn_UnAllReceive().gameObject:SetActive(true)
    end
    UIEvent.LuaClick(self.Btn_Receive().gameObject, Handle(self,self.ReceiveClick))
end

function M:GetRounding(value)
    return JNStrTool.numberAbbr(value)
end

function M:ReceiveClick()
    AchievementViewModel.TaskPerform(0,self.taskId)
end
---创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    if _StarLV ==nil or _StarLV <= 0 then
        return
    end
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        self:CreatStar(_Root,_Prefab)
    end
end
---成就跳转
function M:AchievementJump(achievementData)
    if TaskControl.AchievementDataList[achievementData.id].gotoID == "0" then
        self.Btn_Proceed().gameObject:SetActive(false)
    end
    local transformInfo = {}
    transformInfo = string.split(TaskControl.AchievementDataList[achievementData.id].gotoID,"_")

    --判断跳转关卡是否为简单
    local id = tonumber(transformInfo[4])
    local tab = ChapterLocalData.tab[id]
    local isNormal = nil
    if tab then
        isNormal =  tab.type
    end

    if isNormal and isNormal == 0 then
        StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
    elseif isNormal and isNormal == 1 then
        StormViewModel.CurLevelType = StormViewModel.LevelType.Hard
    else
        StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
    end

    ---跳转到对应界面
    MgrLink.LinkStart(transformInfo)
end
-----跳转副本界面
--function M:TurnToStormPointPage(plotIndex,stormIndex)   --参数：章节,关卡
--    local pData = StormControl.GetStormScrollById(tonumber(plotIndex))
--    local isLock = StormControl.CheckScrollLock(tonumber(plotIndex))
--    local pointData = StormControl.GetStormPointByID(tonumber(stormIndex))
--    StormViewModel.ReloadStormData()
--    if isLock then
--        --StormViewModel.OpenStormPointUI(pData,StormViewModel.PointType.main)
--        StormViewModel.TurnStormPointUI(pData,StormViewModel.PointType.main,pointData)
--    else
--        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
--    end
--end
---跳转对应资源界面
function M:TurnToResourcesPointPage(plotIndex,stormIndex)   --参数：章节,关卡
    ---@type StormScrollData
    local pData = nil
    StormViewModel.ReloadStormData()
    for i,v in ipairs(StormViewModel.CacheAssetScrollData) do
        if v.id == tonumber(plotIndex) then
            if stormIndex == "610000" and SysLockControl.CheckSysLock(1006) then
                if StormControl.CheckPointLock(tonumber(stormIndex)) == false then
                    pData = StormViewModel.CacheAssetScrollData[9]      ---周二三五七开攻击核心
                elseif StormControl.CheckPointLock(tonumber(stormIndex+1)) == false then
                    pData = StormViewModel.CacheAssetScrollData[i]      ---周一三四六开生命核心
                end
            elseif stormIndex == "620100" and SysLockControl.CheckSysLock(1004) then
                if StormControl.CheckPointLock(tonumber(stormIndex)) == false then
                    pData = StormViewModel.CacheAssetScrollData[8]      ---周二四六七开攻击觉醒
                elseif StormControl.CheckPointLock(tonumber(stormIndex+1)) == false then
                    pData = StormViewModel.CacheAssetScrollData[12]     ---周一三五七开防卫觉醒
                end
            else
                if StormControl.CheckPointLock(tonumber(stormIndex)) then
                    pData = StormViewModel.CacheAssetScrollData[i]      ---开对应副本
                end
            end
        end
    end
    if not pData then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips2"),1},true)
        return
    end
    --[[
    if not StormViewModel.CheckAssetsScroll(pData.type2) then
        MgrUI.Pop(UID.PopTip_UI,{"未达到开启条件",1},true)
        return
    end]]
    ---资源ui创建
    StormViewModel.OpenStormPointUIAfterRequestDrop(pData,StormViewModel.PointType.res)
end
return M