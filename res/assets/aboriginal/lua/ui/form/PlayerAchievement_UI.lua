-- Code Auto Create Begin
local M = Class('PlayerAchievement_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlayerAchievement_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlayerAchievement_UI].prefab'
    self.Name = 'Form[PlayerAchievement_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'LeftPanel','LeftPanel',2},{'LeftSwitchBtnRoot','LeftPanel/LeftSwitchBtnRoot',2},{'Panel_Btn_All','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_All',2},{'Btn_Cutpage','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_All/Btn_Normal/Btn_Cutpage',2},{'Btn_Cutpage(Selected)','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_All/Btn_HighLight/Btn_Cutpage(Selected)',2},{'Panel_Btn_Battle','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Battle',2},{'Btn_Cutpage01','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Battle/Btn_Normal/Btn_Cutpage',2},{'Btn_Cutpage(Selected)01','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Battle/Btn_HighLight/Btn_Cutpage(Selected)',2},{'Panel_Btn_Collect','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Collect',2},{'Btn_Cutpage02','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Collect/Btn_Normal/Btn_Cutpage',2},{'Btn_Cutpage(Selected)02','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Collect/Btn_HighLight/Btn_Cutpage(Selected)',2},{'Panel_Btn_Develop','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Develop',2},{'Btn_Cutpage03','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Develop/Btn_Normal/Btn_Cutpage',2},{'Btn_Cutpage(Selected)03','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Develop/Btn_HighLight/Btn_Cutpage(Selected)',2},{'Panel_Btn_Cost','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Cost',2},{'Btn_Cutpage04','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Cost/Btn_Normal/Btn_Cutpage',2},{'Btn_Cutpage(Selected)04','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Cost/Btn_HighLight/Btn_Cutpage(Selected)',2},{'RightPanel','RightPanel',2},{'Img_Bottom','RightPanel/Img_Bottom',2},{'Img_Xian2','RightPanel/Img_Xian2',2},{'Img_Xian','RightPanel/Img_Xian',2},{'Btn_ReceiveAllHighLight','RightPanel/Btn_ReceiveAllHighLight',2},{'Btn_ReceiveAllNormal','RightPanel/Btn_ReceiveAllNormal',2},{'AchievementProgress','RightPanel/AchievementProgress',2},{'heitiao','RightPanel/AchievementProgress/heitiao',2},{'Img_AchieveProgressSlider','RightPanel/AchievementProgress/Img_AchieveProgressSlider',2},{'chengjiushu','RightPanel/AchievementProgress/chengjiushu',2},{'Prefab_AchievementTask','RightPanel/Prefab_AchievementTask',2},{'AchievementDi','RightPanel/Prefab_AchievementTask/AchievementDi',2},{'Btn_Receive','RightPanel/Prefab_AchievementTask/Btn_Receive',2},{'Btn_Proceed','RightPanel/Prefab_AchievementTask/Btn_Proceed',2},{'Img_Triangle','RightPanel/Prefab_AchievementTask/Btn_Proceed/Img_Triangle',2},{'Img_Heitiao','RightPanel/Prefab_AchievementTask/Img_Heitiao',2},{'Img_TaskProgressSlider','RightPanel/Prefab_AchievementTask/Img_TaskProgressSlider',2},{'RewardRoot','RightPanel/Prefab_AchievementTask/RewardPanel/RewardRoot',2},{'Img_Kuang3','RightPanel/Prefab_AchievementTask/RewardPanel/Img_Kuang3',2},{'Img_Kuang2','RightPanel/Prefab_AchievementTask/RewardPanel/Img_Kuang2',2},{'Img_Kuang1','RightPanel/Prefab_AchievementTask/RewardPanel/Img_Kuang1',2},{'ReceivedKuang','RightPanel/Prefab_AchievementTask/Panel_Received/ReceivedKuang',2},{'baizhezhao','RightPanel/Prefab_AchievementTask/Panel_Received/baizhezhao',2},{'Img_Received1','RightPanel/Prefab_AchievementTask/Panel_Received/Img_Received1',2},{'Img_Received2','RightPanel/Prefab_AchievementTask/Panel_Received/Img_Received2',2},{'Img_Received3','RightPanel/Prefab_AchievementTask/Panel_Received/Img_Received3',2},{'Img_TaskIcon','RightPanel/Prefab_AchievementTask/Img_TaskIcon',2},{'RewardPrefab','RightPanel/Prefab_AchievementTask/RewardPrefab',2},{'RewardRankImg','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/RewardRankImg',2},{'RewardIconImg','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/RewardIconImg',2},{'StarPanel','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel',2},{'ItemStarPrefab','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/ItemStarPrefab',2},{'EmptyStarRoot','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/EmptyStarRoot',2},{'EmptyStar','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/StarPanel/ItemStarRoot',2},{'Img_ItemCountPivot','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/Img_ItemCountPivot',2},{'Img_ItemCountBg','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/Img_ItemCountPivot/Img_ItemCountBg',2},{'AchievementTaskScroll','RightPanel/AchievementTaskScroll',2},{'Viewport','RightPanel/AchievementTaskScroll/Viewport',2},{'AchievementTaskRoot','RightPanel/AchievementTaskScroll/Viewport/AchievementTaskRoot',2},{'ScrollbarVertical','RightPanel/AchievementTaskScroll/Scrollbar Vertical',2},{'Handle','RightPanel/AchievementTaskScroll/Scrollbar Vertical/Sliding Area/Handle',2},{'UpperLeftBtnPanel','UpperLeftBtnPanel',2},{'i','UpperLeftBtnPanel/i',2},{'Btn_GoBack','UpperLeftBtnPanel/Btn_GoBack',2},
        -- Text 列表
        {'Text_CN','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_All/Btn_Normal/Text_CN',3},{'Text_EN','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_All/Btn_Normal/Text_EN',3},{'Text_CN01','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_All/Btn_HighLight/Text_CN',3},{'Text_EN01','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_All/Btn_HighLight/Text_EN',3},{'Text_CN02','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Battle/Btn_Normal/Text_CN',3},{'Text_EN02','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Battle/Btn_Normal/Text_EN',3},{'Text_CN03','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Battle/Btn_HighLight/Text_CN',3},{'Text_EN03','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Battle/Btn_HighLight/Text_EN',3},{'Text_CN04','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Collect/Btn_Normal/Text_CN',3},{'Text_EN04','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Collect/Btn_Normal/Text_EN',3},{'Text_CN05','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Collect/Btn_HighLight/Text_CN',3},{'Text_EN05','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Collect/Btn_HighLight/Text_EN',3},{'Text_CN06','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Develop/Btn_Normal/Text_CN',3},{'Text_EN06','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Develop/Btn_Normal/Text_EN',3},{'Text_CN07','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Develop/Btn_HighLight/Text_CN',3},{'Text_EN07','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Develop/Btn_HighLight/Text_EN',3},{'Text_CN08','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Cost/Btn_Normal/Text_CN',3},{'Text_EN08','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Cost/Btn_Normal/Text_EN',3},{'Text_CN09','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Cost/Btn_HighLight/Text_CN',3},{'Text_EN09','LeftPanel/LeftSwitchBtnRoot/Panel_Btn_Cost/Btn_HighLight/Text_EN',3},{'Text_Btn_Txt','RightPanel/Btn_ReceiveAllHighLight/Text_Btn_Txt',3},{'Text_Btn_Txt01','RightPanel/Btn_ReceiveAllNormal/Text_Btn_Txt',3},{'Text_AchieveProgressRate','RightPanel/AchievementProgress/Text_AchieveProgressRate',3},{'Text_AchieveTitle','RightPanel/AchievementProgress/Text_AchieveTitle',3},{'Text_AchieveCount','RightPanel/AchievementProgress/Text_AchieveCount',3},{'Text_Receive','RightPanel/Prefab_AchievementTask/Btn_Receive/Text_Receive',3},{'Text_Proceed','RightPanel/Prefab_AchievementTask/Btn_Proceed/Text_Proceed',3},{'Text_Aim','RightPanel/Prefab_AchievementTask/Text_Aim',3},{'Text_AimCount','RightPanel/Prefab_AchievementTask/Text_AimCount',3},{'Text_TaskName','RightPanel/Prefab_AchievementTask/Text_TaskName',3},{'Text_Received','RightPanel/Prefab_AchievementTask/Panel_Received/ReceivedKuang/Text_Received',3},{'Text_Received01','RightPanel/Prefab_AchievementTask/Panel_Received/Img_Received1/Text_Received',3},{'Text_Received02','RightPanel/Prefab_AchievementTask/Panel_Received/Img_Received2/Text_Received',3},{'Text_Received03','RightPanel/Prefab_AchievementTask/Panel_Received/Img_Received3/Text_Received',3},{'ItemCountText','RightPanel/Prefab_AchievementTask/RewardPrefab/wupin/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText',3},
    }
end
-- Code Auto Create End
function M:OnInit()

    --------------------------------初始化信息-------------------------------------

    --------------------------------左侧切换按钮------------------------------------
    --初始化信息
    M.Int_CurBagType = 0  --0.全部1.战斗2.搜集3.消费4.养成   默认0.全部
    M.Tab_CurTaskInitBag = {}  --当前的任务刷新信息表
    --Panel父节点
    M.LeftPanel=self.LeftPanel().gameObject
    M.RightPanel=self.RightPanel().gameObject
    M.LeftSwitchBtnRoot=self.LeftSwitchBtnRoot().gameObject
    M.Panel_Btn_All=self.Panel_Btn_All().gameObject
    M.Panel_Btn_Battle=self.Panel_Btn_Battle().gameObject
    M.Panel_Btn_Collect=self.Panel_Btn_Collect().gameObject
    M.Panel_Btn_Develop=self.Panel_Btn_Develop().gameObject
    M.Panel_Btn_Cost=self.Panel_Btn_Cost().gameObject
    --Btn按钮
    M.Btn_GoBack=self.Btn_GoBack().gameObject
    M.Btn_Normal_All=CJNUIMgr.GetSunUseName(M.Panel_Btn_All,"Btn_Normal")
    M.Btn_HighLight_All=CJNUIMgr.GetSunUseName(M.Panel_Btn_All,"Btn_HighLight")
    M.Btn_Normal_Battle=CJNUIMgr.GetSunUseName(M.Panel_Btn_Battle,"Btn_Normal")
    M.Btn_HighLight_Battle=CJNUIMgr.GetSunUseName(M.Panel_Btn_Battle,"Btn_HighLight")
    M.Btn_Normal_Collect=CJNUIMgr.GetSunUseName(M.Panel_Btn_Collect,"Btn_Normal")
    M.Btn_HighLight_Collect=CJNUIMgr.GetSunUseName(M.Panel_Btn_Collect,"Btn_HighLight")
    M.Btn_Normal_Develop=CJNUIMgr.GetSunUseName(M.Panel_Btn_Develop,"Btn_Normal")
    M.Btn_HighLight_Develop=CJNUIMgr.GetSunUseName(M.Panel_Btn_Develop,"Btn_HighLight")
    M.Btn_Normal_Cost=CJNUIMgr.GetSunUseName(M.Panel_Btn_Cost,"Btn_Normal")
    M.Btn_HighLight_Cost=CJNUIMgr.GetSunUseName(M.Panel_Btn_Cost,"Btn_HighLight")
    --------------------------------左侧切换按钮------------------------------------

    --------------------------------右侧成就任务列表------------------------------------
    --Panel父节点
    M.Panel_AchievementProgress=self.AchievementProgress().gameObject
    M.Panel_AchievementTaskScroll=self.AchievementTaskScroll().gameObject
    M.AchievementTaskRoot=self.AchievementTaskRoot().gameObject
    --Img图片
    M.Img_AchieveProgressSlider=self.Img_AchieveProgressSlider().gameObject

    --Text文本
    M.Text_AchieveCount=self.Text_AchieveCount().gameObject
    M.Text_AchieveProgressRate=self.Text_AchieveProgressRate().gameObject

    --Btn按钮
    M.Btn_ReceiveAllNormal=self.Btn_ReceiveAllNormal().gameObject
    M.Btn_ReceiveAllHighLight=self.Btn_ReceiveAllHighLight().gameObject
    --Prefab预制体
    M.Prefab_AchievementTask=self.Prefab_AchievementTask().gameObject
    --------------------------------右侧成就任务列表------------------------------------
    M.Prefab_AchievementTask:SetActive(false)
    -- JNAchievementTaskData.RequestPlayerAchieveTask()
    M.InitLeftSwitchBtn()
    -- M.SwitchCurBagPanelByType(1)
    Event.Clear("InitAchieveTaskUI")
    Event.Add("InitAchieveTaskUI",function ()
        -- statements
        UISysTools.StopAllAsyncCreatGo()
        M.SwitchCurBagPanelByType(M.Int_CurBagType)
    end)
    Event.Clear("FlushAfterRequestTaskReward")
    Event.Add("FlushAfterRequestTaskReward",function ()
        JNAchievementTaskData.RequestPlayerAchieveTask("InitAchieveTaskUI")
        MgrUI.Pop(UID.ItemAchievePop_UI,{},true)
    end)
    UIEvent.LuaClick(M.Btn_GoBack,Handle(M,function ()
        UISysTools.StopAllAsyncCreatGo()
        PlayerAchievementViewModel.Close()
        --HttpPostFormSwitch.GoManinterface()
    end))
    UIEvent.LuaClick(M.Btn_ReceiveAllHighLight,Handle(M,function ()
        UISysTools.StopAllAsyncCreatGo()
        M.RequestGetTaskReward("-1",1)
    end))
    JNAchievementTaskData.RequestPlayerAchieveTask("InitAchieveTaskUI")
end

--------------------------------左侧切换按钮------------------------------------
--初始化左侧切换背包类型按钮事件
function M.InitLeftSwitchBtn()
    -- 全部成就任务按钮
    UIEvent.LuaClick(M.Btn_Normal_All,Handle(M,function ()
        M.SwitchCurBagPanelByType(0)
    end))
    -- 战斗成就任务按钮
    UIEvent.LuaClick(M.Btn_Normal_Battle,Handle(M,function ()
        M.SwitchCurBagPanelByType(1)
    end))
    -- 搜集成就任务按钮
    UIEvent.LuaClick(M.Btn_Normal_Collect,Handle(M,function ()
        M.SwitchCurBagPanelByType(2)
    end))
    -- 养成成就任务按钮
    UIEvent.LuaClick(M.Btn_Normal_Develop,Handle(M,function ()
        M.SwitchCurBagPanelByType(4)
    end))
    -- 消费成就任务按钮
    UIEvent.LuaClick(M.Btn_Normal_Cost,Handle(M,function ()
        M.SwitchCurBagPanelByType(3)
    end))
    M.SwitchLeftBtnType()
end
--根据当前选择的背包类型切换背包并刷新页面
function M.SwitchCurBagPanelByType(_Type)
    UISysTools.StopAllAsyncCreatGo()
    M.Int_CurBagType=_Type
    M.InitAchieveTaskScroll()
    M.SwitchLeftBtnType()
    -- if _Type == 0 then
    --     -- 全部
    --     M.InitAchieveTaskScroll()
    --     elseif _Type == 1 then
    --         -- 战斗
    --     elseif _Type == 2 then
    --         -- 搜集
    --     elseif _Type == 3 then
    --         -- 消费
    --     elseif _Type == 4 then
    --         -- 养成
    -- end
end
--根据当前选择的背包类型切换按钮状态
function M.SwitchLeftBtnType()
    if M.Int_CurBagType == 0 then
        -- 全部
        M.Btn_Normal_All:SetActive(false)
        M.Btn_HighLight_All:SetActive(true)
        M.Btn_Normal_Battle:SetActive(true)
        M.Btn_HighLight_Battle:SetActive(false)
        M.Btn_Normal_Collect:SetActive(true)
        M.Btn_HighLight_Collect:SetActive(false)
        M.Btn_Normal_Develop:SetActive(true)
        M.Btn_HighLight_Develop:SetActive(false)
        M.Btn_Normal_Cost:SetActive(true)
        M.Btn_HighLight_Cost:SetActive(false)
    elseif M.Int_CurBagType == 1 then
        -- 战斗
        M.Btn_Normal_All:SetActive(true)
        M.Btn_HighLight_All:SetActive(false)
        M.Btn_Normal_Battle:SetActive(false)
        M.Btn_HighLight_Battle:SetActive(true)
        M.Btn_Normal_Collect:SetActive(true)
        M.Btn_HighLight_Collect:SetActive(false)
        M.Btn_Normal_Develop:SetActive(true)
        M.Btn_HighLight_Develop:SetActive(false)
        M.Btn_Normal_Cost:SetActive(true)
        M.Btn_HighLight_Cost:SetActive(false)
    elseif M.Int_CurBagType == 2 then
        -- 搜集
        M.Btn_Normal_All:SetActive(true)
        M.Btn_HighLight_All:SetActive(false)
        M.Btn_Normal_Battle:SetActive(true)
        M.Btn_HighLight_Battle:SetActive(false)
        M.Btn_Normal_Collect:SetActive(false)
        M.Btn_HighLight_Collect:SetActive(true)
        M.Btn_Normal_Develop:SetActive(true)
        M.Btn_HighLight_Develop:SetActive(false)
        M.Btn_Normal_Cost:SetActive(true)
        M.Btn_HighLight_Cost:SetActive(false)

    elseif M.Int_CurBagType == 3 then
        -- 消费
        M.Btn_Normal_All:SetActive(true)
        M.Btn_HighLight_All:SetActive(false)
        M.Btn_Normal_Battle:SetActive(true)
        M.Btn_HighLight_Battle:SetActive(false)
        M.Btn_Normal_Collect:SetActive(true)
        M.Btn_HighLight_Collect:SetActive(false)
        M.Btn_Normal_Develop:SetActive(true)
        M.Btn_HighLight_Develop:SetActive(false)
        M.Btn_Normal_Cost:SetActive(false)
        M.Btn_HighLight_Cost:SetActive(true)
    elseif M.Int_CurBagType == 4 then
        -- 养成
        M.Btn_Normal_All:SetActive(true)
        M.Btn_HighLight_All:SetActive(false)
        M.Btn_Normal_Battle:SetActive(true)
        M.Btn_HighLight_Battle:SetActive(false)
        M.Btn_Normal_Collect:SetActive(true)
        M.Btn_HighLight_Collect:SetActive(false)
        M.Btn_Normal_Develop:SetActive(false)
        M.Btn_HighLight_Develop:SetActive(true)
        M.Btn_Normal_Cost:SetActive(true)
        M.Btn_HighLight_Cost:SetActive(false)
    end
end
--------------------------------左侧切换按钮------------------------------------
--------------------------------右侧成就任务列表------------------------------------
--刷新底部成就进度
function M.InitAchieveTaskProgress()
    local _RecievedTaskCount = 0
    local _TotalTaskCount = #TaskLocalData.tab
    --遍历当前的玩家成就信息表获取当前已领取的任务数量以及总量
    for key, value in pairs(JNAchievementTaskData.PlayerAchievementTaskTab) do
        if value.CurTaskProgress == JNAchievementTaskData.Enum_TaskProgress.Recieved then
            -- 已领取的任务
            _RecievedTaskCount = _RecievedTaskCount + 1
        end
    end
    local _Int_ProgressRate = 0
    if _TotalTaskCount ~= nil and _TotalTaskCount ~= 0 then
        _Int_ProgressRate = TableToObject.GetCorrectRate(_RecievedTaskCount,_TotalTaskCount)
    end
    Tools.SetImgFillRate(M.Img_AchieveProgressSlider,_Int_ProgressRate)
    M.Text_AchieveCount:GetComponent("TextMeshProUGUI").text=string.format("%d/%d",_RecievedTaskCount,_TotalTaskCount)
    M.Text_AchieveProgressRate:GetComponent("TextMeshProUGUI").text=""..(_Int_ProgressRate*100).."%"
    --筛选出当前可领取的任务总数判断一键领取是否可以点击
    local _TempEqualTab={JNAchievementTaskData.Enum_TaskProgress.Accessable}  --临时筛选参数表
    local _TempFilterTab =TableToObject.FillterMTabByVar(JNAchievementTaskData.PlayerAchievementTaskTab,"CurTaskProgress",_TempEqualTab,false)
    local _Int_AccessTaskCount = TableToObject.GetTableLength(_TempFilterTab)
    if tonumber(_Int_AccessTaskCount) == nil or tonumber(_Int_AccessTaskCount) <=0 then
        M.Btn_ReceiveAllNormal:SetActive(true)
        M.Btn_ReceiveAllHighLight:SetActive(false)
    else
        M.Btn_ReceiveAllNormal:SetActive(false)
        M.Btn_ReceiveAllHighLight:SetActive(true)
    end
end
--根据当前的玩家成就任务信息表刷新UI
function M.InitAchieveTaskScroll()
    M.InitAchieveTaskProgress()
    --根据当前选择的类型筛选成就信息表
    if M.Int_CurBagType ~= 0 then
        --如果当前筛选类型不为0（全部）具体类型筛选
        local _Tab_EqualVar={(""..M.Int_CurBagType)}
        M.Tab_CurTaskInitBag=TableToObject.FillterMTabByVar(JNAchievementTaskData.PlayerAchievementTaskTab,"TaskType",_Tab_EqualVar,false)
    else
        M.Tab_CurTaskInitBag=JNAchievementTaskData.PlayerAchievementTaskTab
    end
    UISysTools.StopAllAsyncCreatGo()
    Tools.ClearAllChild(M.AchievementTaskRoot)
    UISysTools.AsyncCreatGo(M.CreatAchievementTask,M.Tab_CurTaskInitBag,1,0.015)
end

--创建一个成就任务词条
function M.CreatAchievementTask(_AchieveTaskData)
    --获取当前词条的各个部件GameObj
    local _TaskObj = UISysTools.CreatGo(M.Prefab_AchievementTask,M.AchievementTaskRoot)
    -- print("_AchieveTaskData.ID".._AchieveTaskData.ID.."_AchieveTaskData.ProgressCount".._AchieveTaskData.ProgressCount)
    local _Img_TaskIcon=CJNUIMgr.GetSunUseName(_TaskObj,"Img_TaskIcon")
    local _Img_TaskProgressSlider=CJNUIMgr.GetSunUseName(_TaskObj,"Img_TaskProgressSlider")
    local _Img_Received1=CJNUIMgr.GetSunUseName(_TaskObj,"Img_Received1")
    local _Img_Received2=CJNUIMgr.GetSunUseName(_TaskObj,"Img_Received2")
    local _Img_Received3=CJNUIMgr.GetSunUseName(_TaskObj,"Img_Received3")
    local _Panel_Received=CJNUIMgr.GetSunUseName(_TaskObj,"Panel_Received")
    local _Panel_RewardRoot=CJNUIMgr.GetSunUseName(_TaskObj,"RewardRoot")
    local _Prefab_RewardPrefab=CJNUIMgr.GetSunUseName(_TaskObj,"RewardPrefab")
    local _Btn_Receive=CJNUIMgr.GetSunUseName(_TaskObj,"Btn_Receive")
    local _Btn_Proceed=CJNUIMgr.GetSunUseName(_TaskObj,"Btn_Proceed")
    local _Text_Aim=CJNUIMgr.GetSunUseName(_TaskObj,"Text_Aim")
    local _Text_AimCount=CJNUIMgr.GetSunUseName(_TaskObj,"Text_AimCount")
    local _Text_TaskName=CJNUIMgr.GetSunUseName(_TaskObj,"Text_TaskName")
    local _Tab_ReceivedImg = {}
    table.insert(_Tab_ReceivedImg,_Img_Received1)
    table.insert(_Tab_ReceivedImg,_Img_Received2)
    table.insert(_Tab_ReceivedImg,_Img_Received3)
    --隐藏预制体
    _Prefab_RewardPrefab:SetActive(false)
    --隐藏奖励槽的三个已领取tag
    _Img_Received1:SetActive(false)
    _Img_Received2:SetActive(false)
    _Img_Received3:SetActive(false)
    --根据当前成就任务进行状态判断
    if _AchieveTaskData.CurTaskProgress == JNAchievementTaskData.Enum_TaskProgress.Progressing then
        -- 进行中
        _Btn_Proceed:SetActive(true)
        _Btn_Receive:SetActive(false)
        _Panel_Received:SetActive(false)
    elseif _AchieveTaskData.CurTaskProgress == JNAchievementTaskData.Enum_TaskProgress.Accessable then
        --可领取
        _Btn_Receive:SetActive(true)
        _Btn_Proceed:SetActive(false)
        _Panel_Received:SetActive(false)
        --显示对应奖励品数量的已领取Tag
        for i = 1, #_AchieveTaskData.RewardTab, 1 do
            _Tab_ReceivedImg[i]:SetActive(true)
        end
    elseif _AchieveTaskData.CurTaskProgress == JNAchievementTaskData.Enum_TaskProgress.Recieved then
        --已领取
        _Btn_Receive:SetActive(false)
        _Btn_Proceed:SetActive(false)
        _Panel_Received:SetActive(true)
    end
    --刷新具体任务条UI
    local item = GoodsLocalData.tab[tonumber(_AchieveTaskData.InfoTab[9])]
    MgrRes.LoadSprite(_Img_TaskIcon,"Item/"..item.icon)

    --刷新奖励Panel
    Tools.ClearAllChild(_Panel_RewardRoot)
    for key, value in pairs(_AchieveTaskData.RewardTab) do
        local _RewardObj = UISysTools.CreatGo(_Prefab_RewardPrefab,_Panel_RewardRoot)
        UISysTools.InitItemPrefabWithOutVfx(_RewardObj,value[1],value[2],0.85)
    end
    --如果当前的任务没有指定达成数量则默认不显示完成进度文本进度条也默认为0(达成则直接置为1)
    if _AchieveTaskData.InfoTab[11] ~= "0" then
        -- 刷新具体进度数量UI
        local _TaskProgressRate = TableToObject.GetCorrectRate(tonumber(_AchieveTaskData.ProgressCount),tonumber(_AchieveTaskData.InfoTab[11]))
        Tools.SetImgFillRate(_Img_TaskProgressSlider,_TaskProgressRate)
        _Text_AimCount:GetComponent("TextMeshProUGUI").text=string.format("%d/%d",tonumber(_AchieveTaskData.ProgressCount),tonumber(_AchieveTaskData.InfoTab[11]))
        _Text_AimCount:SetActive(true)
    else
        -- 无指定数量
        if tonumber(_AchieveTaskData.ProgressCount) == 1 then
            --已达成
            Tools.SetImgFillRate(_Img_TaskProgressSlider,1)
        else
            --未达成
            Tools.SetImgFillRate(_Img_TaskProgressSlider,0)
        end
        _Text_AimCount:SetActive(false)
    end
    _Text_Aim:GetComponent("TextMeshProUGUI").text="".._AchieveTaskData.InfoTab[7]
    _Text_TaskName:GetComponent("TextMeshProUGUI").text="".._AchieveTaskData.InfoTab[12]
    UIEvent.LuaClick(_Btn_Receive,Handle(M,function ()
        -- 点击领取
        if _AchieveTaskData.CurTaskProgress ~= JNAchievementTaskData.Enum_TaskProgress.Accessable then
            --当前不可领取
            print("不可领取")
            return
        end
        M.RequestGetTaskReward(_AchieveTaskData.ID,1)
    end))
end
--领取一个任务奖励
function M.RequestGetTaskReward(_Id,_Type)
    -- statements
    JNActivationTaskData.RequestGetTaskReward(_Id,_Type,"FlushAfterRequestTaskReward")
end
--------------------------------右侧成就任务列表------------------------------------
return M