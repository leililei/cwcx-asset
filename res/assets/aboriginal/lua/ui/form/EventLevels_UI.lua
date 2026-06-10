-- Code Auto Create Begin
local M = Class('EventLevels_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EventLevels_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EventLevels_UI].prefab'
    self.Name = 'Form[EventLevels_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel_Main','Panel_Main',2},{'bg_huodongdi','Panel_Main/Background/bg_huodongdi',2},{'Btn_Click','Panel_Main/Btn_Click',2},{'MaskForClick','Panel_Main/Panel_MainPoint/Panel_Points/MaskForClick',2},{'MainUpperRightPanel','Panel_Main/Panel_MainPoint/MainUpperRightPanel',2},{'Drop_Diff','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff',2},{'Img_DiffBG','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Img_DiffBG',2},{'Arrow','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Arrow',2},{'Template','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template',2},{'Viewport','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport',2},{'ItemBackground','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport/Content/Item/Item Background',2},{'Panel_Tili2','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2',2},{'Img_PowerBG','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Img_PowerBG',2},{'Btn_Add2','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Btn_Add2',2},{'Img_Tiliicon','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Img_Tiliicon',2},{'Img_Diffdi','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Difff/Img_Diffdi',2},{'Btn_Zhankai2','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Difff/Btn_Zhankai2',2},{'Template01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template',2},{'Viewport01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport',2},{'ItemBackground01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport/Content/Item/Item Background',2},{'bg_left','Panel_Main/bg_left',2},{'bg_right','Panel_Main/bg_right',2},{'Img_line(zuo)','Panel_Main/Img_line(zuo)',2},{'Img_line(you)','Panel_Main/Img_line(you)',2},{'Panel_Info','Panel_Main/Panel_MainPoint/Panel_Info',2},{'Img_Xian2','Panel_Main/Panel_MainPoint/Panel_Info/Img_Xian2',2},{'Img_Xian1','Panel_Main/Panel_MainPoint/Panel_Info/Img_Xian1',2},{'Panel_Tili','Panel_Main/Panel_MainPoint/Panel_Info/Panel_Tili',2},{'Img_PowerBG01','Panel_Main/Panel_MainPoint/Panel_Info/Panel_Tili/Img_PowerBG',2},{'Btn_Add','Panel_Main/Panel_MainPoint/Panel_Info/Panel_Tili/Btn_Add',2},{'Img_Tiliicon01','Panel_Main/Panel_MainPoint/Panel_Info/Panel_Tili/Img_Tiliicon',2},{'PointIdxNamedi','Panel_Main/Panel_MainPoint/Panel_Info/PointIdxNamedi',2},{'Zuozhan','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan',2},{'Img_NameBg','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_NameBg',2},{'Img_Biaotixian1','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_Biaotixian1',2},{'Img_StarTask_1','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_1',2},{'Img_TaskStar_1','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_1/Img_TaskStar_1',2},{'Highlight','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_1/Img_TaskStar_1/Highlight',2},{'Img_StarTask_2','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_2',2},{'Img_TaskStar_2','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_2/Img_TaskStar_2',2},{'Highlight01','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_2/Img_TaskStar_2/Highlight',2},{'Img_StarTask_3','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_3',2},{'Img_TaskStar_3','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_3/Img_TaskStar_3',2},{'Highlight02','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_3/Img_TaskStar_3/Highlight',2},{'Img_NameBg2','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_NameBg2',2},{'Img_Biaotixian2','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_Biaotixian2',2},{'Btu_Saodangdi','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_Fast/Btu_Saodangdi',2},{'SweepSuo','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_Fast/Btn_Content/SweepSuo',2},{'Btn_InPoint','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_InPoint',2},{'Btn_Zuozhanzhunbeidi','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_InPoint/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili',2},{'Img_Tiliicon02','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili/Img_Tiliicon',2},{'Juqing','Panel_Main/Panel_MainPoint/Panel_Info/Juqing',2},{'Img_Biaotixian3','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Img_Biaotixian3',2},{'Btn_Zuozhanzhunbeidi01','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Btn_Guankanjuqing/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili01','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Btn_Guankanjuqing/Img_Xiaohaotili',2},{'Img_Tiliicon03','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Btn_Guankanjuqing/Img_Xiaohaotili/Img_Tiliicon',2},{'dikuang','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/dikuang',2},{'Img_Zhangjietudi','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Img_Zhangjietudi',2},{'MainUpperRightPanel01','Panel_Main/Panel_MainPoint/MainUpperRightPanel',2},{'Drop_Diff01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff',2},{'Img_DiffBG01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Img_DiffBG',2},{'Arrow01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Arrow',2},{'Template02','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template',2},{'Viewport02','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport',2},{'ItemBackground02','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport/Content/Item/Item Background',2},{'Panel_Tili201','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2',2},{'Img_PowerBG02','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Img_PowerBG',2},{'Btn_Add201','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Btn_Add2',2},{'Img_Tiliicon04','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Img_Tiliicon',2},{'Img_Diffdi01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Difff/Img_Diffdi',2},{'Btn_Zhankai201','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Difff/Btn_Zhankai2',2},{'Template03','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template',2},{'Viewport03','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport',2},{'ItemBackground03','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport/Content/Item/Item Background',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG03','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add202','UpperRightPanel/Btn_AddPower/Btn_Add2',2},{'Img_Tiliicon05','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'Image','Image',2},
        -- Text 列表
        {'Label','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Label',3},{'ItemLabel','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport/Content/Item/Item Label',3},{'Text_Tili2','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Text_Tili2',3},{'Text_Diff','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Difff/Text_Diff',3},{'ItemLabel01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport/Content/Item/Item Label',3},{'Text_Tili','Panel_Main/Panel_MainPoint/Panel_Info/Panel_Tili/Text_Tili',3},{'Text_PointName','Panel_Main/Panel_MainPoint/Panel_Info/Text_PointName',3},{'Text_PointIdxName','Panel_Main/Panel_MainPoint/Panel_Info/PointIdxNamedi/Text_PointIdxName',3},{'Text_TaskName','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Text_TaskName',3},{'Text_TaskDes_1','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_1/Text_TaskDes_1',3},{'Text_TaskDes_2','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_2/Text_TaskDes_2',3},{'Text_TaskDes_3','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Img_StarTask_3/Text_TaskDes_3',3},{'Text_LevelType','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Text_LevelType',3},{'Text_Saodang','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_Fast/Btn_Content/Text_Saodang',3},{'Text_InPoint','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_InPoint/Text_InPoint',3},{'Text_CNum','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili/Text_CNum',3},{'Text_Juqingjianjie','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Text_Juqingjianjie',3},{'Text_Jianjie','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Text_Jianjie',3},{'Text_InPoint01','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Btn_Guankanjuqing/Text_InPoint',3},{'Text_PCNum','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Btn_Guankanjuqing/Img_Xiaohaotili/Text_PCNum',3},{'Label01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Label',3},{'ItemLabel02','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport/Content/Item/Item Label',3},{'Text_Tili201','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Tili2/Text_Tili2',3},{'Text_Diff01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Difff/Text_Diff',3},{'ItemLabel03','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport/Content/Item/Item Label',3},{'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',3},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',3},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',3},
        -- Button 列表
        {'Btn_Fast','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/Btn_Fast',4},{'Btn_Guankanjuqing','Panel_Main/Panel_MainPoint/Panel_Info/Juqing/Btn_Guankanjuqing',4},
        -- UITemplate 列表
        {'EventLevelsItem','Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/Mask/EventLevelsScroll/EventLevelsItem',10},{'PointRewardsItem2','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/VFXMask/RewardsScroll/PointRewardsItem2',10},
        -- Toggle 列表
        {'Item','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport/Content/Item',13},{'Item01','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport/Content/Item',13},{'Item02','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff/Template/Viewport/Content/Item',13},{'Item03','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Template/Viewport/Content/Item',13},
        -- Dropdown 列表
        {'Drop_Diff02','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff',14},{'Drop_Diff03','Panel_Main/Panel_MainPoint/MainUpperRightPanel/Panel_Diff/Drop_Diff',14},
        -- RawImage 列表
        {'Panel_MainPoint','Panel_Main/Panel_MainPoint',15},{'EventLevelsScroll','Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/Mask/EventLevelsScroll',15},{'EventLevelsContent','Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/Mask/EventLevelsScroll/EventLevelsContent',15},{'Panel_MainPoint01','Panel_Main/Panel_MainPoint',15},{'RewardsScroll','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/VFXMask/RewardsScroll',15},{'RewardsContent','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/VFXMask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'EventLevelsScroll01','Panel_Main/Panel_MainPoint/Panel_Points/maskPanel/Mask/EventLevelsScroll',18},{'RewardsScroll01','Panel_Main/Panel_MainPoint/Panel_Info/Zuozhan/VFXMask/RewardsScroll',18},
    }
end
-- Code Auto Create End
require("LocalData/TermdescLocalData")
function M:OnInit()
    self.EventLevelsItem().gameObject:SetActive(false)
    self.PointRewardsItem2().gameObject:SetActive(false)
    ---重载所有关卡数据
    StormViewModel.ReloadStormData()
    ---@type EventRaidData 剧情活动数据
    self.CurEventActivityData = EventRaidControl.CreateEventRaidData()
    ---卷数据
    ---@type StormScrollData[] 所有剧情活动卷(普通关卡和Boss)
    self.ScrollData = StormViewModel.CacheEventRaidScrollData
    ---关卡数据
    ---@type StormPointData[] 所有剧情活动关卡(普通关卡和Boss)
    self.PointData = StormViewModel.CacheEventRaidPointData
    ---@type StormPointData 当前页面所有关卡数据
    self.CurPointDataList = {}
    ---初始化活动关卡滑块
    self:InitPoint()
    ---当前关卡奖励数据
    self.CurRewardList = {}
    ---初始化reward滑块
    self:InitReward()
    ---初始化体力
    self:RefreshPower()
    ---按钮初始化
    self:InitClick()

    

    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_Add().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel,{function()
            self:RefreshPower()
        end},true)
    end))
    UIEvent.LuaClick(self.Btn_Add2().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel,{function()
            self:RefreshPower()
        end},true)
    end))
end

function M:OnUpdateUI()
    ---刷新数据
    self:FreshData()
    self.EventLevelsScroll01().totalCount = #self.CurPointDataList
    self.EventLevelsScroll01():RefreshCells()
    ---找到最后一关
    if StormViewModel.curSelectData == nil then
        self:CheckLastPoint()
        StormViewModel.curSelectData = StormViewModel.CurPointData
    else
        StormViewModel.CurPointData = StormViewModel.curSelectData
    end

    if StormViewModel.CurPointData == nil then
        StormViewModel.CurPointData = self.CurPointDataList[1]
    end
    ---刷新到最新关卡
    local offset = 0
    
     if StormViewModel.curSelectData then
         for i,v in ipairs(self.CurPointDataList) do
             if v ~= nil then
                 if v.id == StormViewModel.curSelectData.id then
                     offset = i - 1
                     break
                 end
             end
         end
        
         StormViewModel.CurPointData = StormViewModel.curSelectData

     else
        for i,v in ipairs(self.CurPointDataList) do
            if v ~= nil then
                if v.id == StormViewModel.CurPointData.id then
                    offset = i - 1
                    break
                end
            end
        end
     end
    self.EventLevelsScroll01():RefillCells(offset)
    self:ShowEpisodeDetail(StormViewModel.CurPointData)
end

---拿到当前关卡
function M:CheckLastPoint()
    if self.CurPointDataList then
        for i, v in ipairs(self.CurPointDataList) do
            if v.id ~= nil and not StormControl.CheckPointLock(v.id) then
                StormViewModel.CurPointData = self.CurPointDataList[i-1]
                return
            end
        end
    end
end

function M:InitPoint()
    ---注册主线滑块
    self.EventLevelsScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurPointDataList[idx],self,idx})
end

function M:InitReward()
    ---注册奖励滑块
    self.RewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardCellItem))
end
function M:RewardCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.CurRewardList[idx])
end

---根据进入界面时的类型和难度刷新界面内容
function M:FreshData()
    self.CurPointDataList = self.PointData

    local boss = {}
    for i,v in pairs(self.ScrollData) do
        if v.raidType == StormViewModel.ChapterType.ACTIVITYBOSS then   ---活动本BOSS
        for i,value in ipairs(v.points) do
            for i,data in pairs(self.PointData) do
                if data.id == value then
                    boss[#boss + 1] = data
                end
            end
        end
        end
    end

    if StormViewModel.CurPointType == StormViewModel.PointType.activityBoss and StormViewModel.CurDifficulty == StormViewModel.ActivityDifficulty.EASY then
        StormViewModel.CurPointData = boss[1]
    elseif StormViewModel.CurDifficulty == StormViewModel.ActivityDifficulty.MIDDLE then
        StormViewModel.CurPointData = boss[2]
    elseif StormViewModel.CurDifficulty == StormViewModel.ActivityDifficulty.HARD then
        StormViewModel.CurPointData = boss[3]
    end

    for i = 1, 3 do
        self.CurPointDataList[#self.CurPointDataList + 1] = {}
    end

end

---更新关卡详情界面
---@param data StormPointData
function M:ShowEpisodeDetail(data)
    if data == nil then
        return
    end
    ---关卡名
    self.Text_PointName().text = data.name
    ---关卡章节
    self.Text_PointIdxName().text = data.idxName
    ---刷新item
    self.EventLevelsScroll01():RefreshCells()
    ---更新剧情/战斗面板
    if data.type == StormViewModel.PointBattleType.NORMAL_BATTLE  --战斗
    then
        self.Zuozhan().gameObject:SetActive(true)
        self.Juqing().gameObject:SetActive(false)
        self.Panel_Info().gameObject:SetActive(true)
        ---显示星级
        local sArr = {}
        sArr[1],sArr[2],sArr[3] = data:CheckStar()
        self.hStar = {
            [1] = self.Img_TaskStar_1().transform:Find("Highlight").gameObject,
            [2] = self.Img_TaskStar_2().transform:Find("Highlight").gameObject,
            [3] = self.Img_TaskStar_3().transform:Find("Highlight").gameObject,
        }
        for i = 1, #self.hStar do
            self.hStar[i]:SetActive(sArr[i])
        end
        ---通关条件
        local conditions = string.split(data.condition,",")
        --local con1 = conditions[1]
        --local con2 = conditions[2]
        --self.Text_TaskDes_1().text = MgrLanguageData.GetLanguageByKey("battle_ui_completelevel")
        --self.Text_TaskDes_2().text = string.split(con1,"_")[2]..MgrLanguageData.GetLanguageByKey("battle_ui_passround")
        --self.Text_TaskDes_3().text = MgrLanguageData.GetLanguageByKey("battle_ui_walkoff")..string.split(con2,"_")[2]..MgrLanguageData.GetLanguageByKey("eventbosspop_ui_tips1")
        self.Text_TaskDes_1().text = TermdescLocalData.tab[tonumber(string.split(conditions[1],"_")[3])][2]
        self.Text_TaskDes_2().text = TermdescLocalData.tab[tonumber(string.split(conditions[2],"_")[3])][2]
        self.Text_TaskDes_3().text = TermdescLocalData.tab[tonumber(string.split(conditions[3],"_")[3])][2]
        ---刷新奖励
        self.CurRewardList = data:GetRewards()
        self.RewardsScroll01().totalCount = #self.CurRewardList
        self.RewardsScroll01():RefillCells()
        ---消耗体力
        MgrRes.LoadSprite(self.Img_Tiliicon01(),"Item/Tilishuicon")
        self.Text_CNum().text = string.split(data.consume,"_")[3]
        ---扫荡按钮初始化
        local s1,s2,s3 = data:CheckStar()
        if s1 or s2 or s3 then
            self.SweepSuo().gameObject:SetActive(false)
            UIEvent.LuaClick(self.Btn_Fast().gameObject,Handle(self,self.SweepClick))
        else
            self.SweepSuo().gameObject:SetActive(true)
        end

    elseif data.type == StormViewModel.PointBattleType.STORY      --剧情
    then
        self.Zuozhan().gameObject:SetActive(false)
        self.Juqing().gameObject:SetActive(true)
        self.Panel_Info().gameObject:SetActive(true)
        ---剧情图片
        MgrRes.LoadSprite(self.Img_Zhangjietudi(),"ArtGallery/PlotCg/" .. data.picture)
        ---剧情简介
        self.Text_Jianjie().text = data.introduction
    elseif data.type == StormViewModel.PointBattleType.ACTIVITY_BOSS then
        self.Zuozhan().gameObject:SetActive(false)
        self.Juqing().gameObject:SetActive(false)
        self.Panel_Info().gameObject:SetActive(false)

        ---显示星级
        local sArr = {}
        sArr[1],sArr[2],sArr[3] = data:CheckStar()
        self.hStar = {
            [1] = self.Img_TaskStar_1().transform:Find("Highlight").gameObject,
            [2] = self.Img_TaskStar_2().transform:Find("Highlight").gameObject,
            [3] = self.Img_TaskStar_3().transform:Find("Highlight").gameObject,
        }
        for i = 1, #self.hStar do
            self.hStar[i]:SetActive(sArr[i])
        end
        ---刷新奖励
        self.CurRewardList = data:GetRewards()
        self.RewardsScroll01().totalCount = #self.CurRewardList
        self.RewardsScroll01():RefillCells()

        ---消耗数量
        self.Text_CNum().text = string.split(data.consume,"_")[3]
        local item_data = ItemControl.GetItemByID(tonumber(string.split(data.consume,"_")[2]))
        ---消耗物品
        MgrRes.LoadSprite(self.Img_Tiliicon01(),"Item/icon_goods_wanjiajingyan")
    end
end
---扫荡按钮
function M:SweepClick()

    --子活动时间是否开启（读另外的时间）
    local ctime = tonumber(SteamLocalData.tab[111010][2])
    local cStartTime = TimeLocalData.tab[ctime][6]
    local cEndTime = TimeLocalData.tab[ctime][7]
    local inMiddle = Global.isMiddleTime(cStartTime, cEndTime)

    if not inMiddle then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),2},true)
        return
    end

    if not SysLockControl.CheckSysLock(2001) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventlevels_ui_tips1"),1},true)
        return
    end
    if StormViewModel.CurPointData.star == 0 then
        return
    end
    if StormViewModel.CurPointData.battleMap == nil or StormViewModel.CurPointData.battleMap == "0" or StormViewModel.CurPointData.battleMap == "" then
        return
    end
    MgrUI.Pop(UID.SweepPop_UI,{StormViewModel.CurPointData,function()
        ---刷新体力
        self:RefreshPower()
    end},true)
end

---进入Boss关卡
function M:OnPointClick_Boss(data,index)
    ---获取Boss信息/弹出Boss面板
    EventRaidViewModel.GetBossData(data,index)
end

---点击进入关卡
function M:OnPointClick()
--子活动时间是否开启（读另外的时间）
    local ctime = tonumber(SteamLocalData.tab[111010][2])
    local cStartTime = TimeLocalData.tab[ctime][6]
    local cEndTime = TimeLocalData.tab[ctime][7]
    local inMiddle = Global.isMiddleTime(cStartTime, cEndTime)

    if not inMiddle then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),2},true)
        return
    end
    StormViewModel.OpenStormPlotUI()
    -- MgrTimer.AddDelay("GoPlot",1, function ()
    --     StormViewModel.OpenStormPlotUI()
    -- end,nil)
end

---刷新体力
function M:RefreshPower()
    ---体力校准
    Global.TiliCalibration()
    self.MaxTili = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    self.curTili = PlayerControl.GetPlayerData():GetVigor()     --获取当前体力值
    self.Text_Tili().text = string.format("%s/%s",PlayerControl.GetPlayerData().vigor.vigorNum,PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4])
    self.Text_Tili2().text = string.format("%s/%s",PlayerControl.GetPlayerData().vigor.vigorNum,PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4])
end

---按钮初始化
function M:InitClick()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回按钮
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackToFirst()
    end)
    ---点击开始作战
    UIEvent.LuaClick(self.Btn_InPoint().gameObject,Handle(self,self.OnPointClick))
    UIEvent.LuaClick(self.Btn_Guankanjuqing().gameObject,Handle(self,self.OnPointClick))
    ---点击扫荡
    UIEvent.LuaClick(self.Btn_Fast().gameObject,function()
        if not SysLockControl.CheckSysLock(2001) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventlevels_ui_tips1"),1},true)
            return
        end
        if StormViewModel.CurPointData.star == 0 then
            return
        end
        if StormViewModel.CurPointData.battleMap == nil or StormViewModel.CurPointData.battleMap == "0" or StormViewModel.CurPointData.battleMap == "" then
            return
        end
        MgrUI.Pop(UID.SweepPop_UI,{StormViewModel.CurPointData,function()
            ---刷新体力
            self:RefreshPower()
        end},true)
    end)
    ---点击边缘关闭详情面板
    UIEvent.LuaClick(self.Btn_Click().gameObject,function() self.Panel_Info().gameObject:SetActive(false) end)
    ---帮助界面
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(101)
    end))
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

return M