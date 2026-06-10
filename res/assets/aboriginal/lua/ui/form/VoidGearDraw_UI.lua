-- Code Auto Create Begin
local M = Class('VoidGearDraw_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VoidGearDraw_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VoidGearDraw_UI].prefab'
    self.Name = 'Form[VoidGearDraw_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'beijing','beijing',2},{'UpperBtnPanel','UpperBtnPanel',2},{'ItemPanelPrefab','UpperBtnPanel/ItemPanelPrefab',2},{'shuliangdi','UpperBtnPanel/ItemPanelPrefab/shuliangdi',2},{'ItemIcon','UpperBtnPanel/ItemPanelPrefab/ItemIcon',2},{'+','UpperBtnPanel/ItemPanelPrefab/+',2},{'ItemRoot','UpperBtnPanel/ItemRoot',2},{'i','UpperBtnPanel/i',2},{'Btn_GoBackMenu','UpperBtnPanel/Btn_GoBackMenu',2},{'Btn_Detail','Btn_Detail',2},{'UnderButtonPanel','UnderButtonPanel',2},{'ProRecruitTenthPanel','UnderButtonPanel/ProRecruitTenthPanel',2},{'Btn_ProRecruit','UnderButtonPanel/ProRecruitTenthPanel/Btn_ProRecruit',2},{'NeedIcon','UnderButtonPanel/ProRecruitTenthPanel/NeedIcon',2},{'ProRecruitPanel','UnderButtonPanel/ProRecruitPanel',2},{'Btn_ProRecruit01','UnderButtonPanel/ProRecruitPanel/Btn_ProRecruit',2},{'NeedIcon01','UnderButtonPanel/ProRecruitPanel/NeedIcon',2},{'Btn_NormalRecruit','UnderButtonPanel/NormalRecruitTenthPanel/Btn_NormalRecruit',2},{'NeedIcon02','UnderButtonPanel/NormalRecruitTenthPanel/NeedIcon',2},{'Btn_NormalRecruit01','UnderButtonPanel/NormalRecruitPanel/Btn_NormalRecruit',2},{'NeedIcon03','UnderButtonPanel/NormalRecruitPanel/NeedIcon',2},
        -- Text 列表
        {'ItemCountText','UpperBtnPanel/ItemPanelPrefab/ItemCountText',3},{'DetailText','Btn_Detail/DetailText',3},{'TitleText','TitleText',3},{'ProRecruitText','UnderButtonPanel/ProRecruitTenthPanel/ProRecruitText',3},{'Btn_Text','UnderButtonPanel/ProRecruitTenthPanel/Btn_Text',3},{'ProRecruitText01','UnderButtonPanel/ProRecruitPanel/ProRecruitText',3},{'Btn_Text01','UnderButtonPanel/ProRecruitPanel/Btn_Text',3},{'NormalRecruitText','UnderButtonPanel/NormalRecruitTenthPanel/NormalRecruitText',3},{'Btn_Text02','UnderButtonPanel/NormalRecruitTenthPanel/Btn_Text',3},{'NormalRecruitText01','UnderButtonPanel/NormalRecruitPanel/NormalRecruitText',3},{'Btn_Text03','UnderButtonPanel/NormalRecruitPanel/Btn_Text',3},
    }
end
-- Code Auto Create End
function M:OnInit()
    --清空已经添加的抽卡请求返回回调事件
    Event.Clear("GoVoidDrawTenth")
    Event.Clear("GoVoidDrawOnce")

    --当前用于给C#播放视频组件传参的参数tab
    M.Tab_CurVideoPlayerParamter={}
    ------------------初始化信息--------------------
    --Panel父节点
    M.UpperBtnPanel=self.UpperBtnPanel().gameObject
    M.UnderButtonPanel=self.UnderButtonPanel().gameObject
    M.ProRecruitTenthPanel=CJNUIMgr.GetSunUseName(M.UnderButtonPanel,"ProRecruitTenthPanel")
    M.ProRecruitPanel=CJNUIMgr.GetSunUseName(M.UnderButtonPanel,"ProRecruitPanel")
    M.NormalRecruitTenthPanel=CJNUIMgr.GetSunUseName(M.UnderButtonPanel,"NormalRecruitTenthPanel")
    M.NormalRecruitPanel=CJNUIMgr.GetSunUseName(M.UnderButtonPanel,"NormalRecruitPanel")
    M.ItemRoot=CJNUIMgr.GetSunUseName(M.UpperBtnPanel,"ItemRoot")
    --Btn按钮
    M.Btn_ProRecruitTenth=CJNUIMgr.GetSunUseName(M.ProRecruitTenthPanel,"Btn_ProRecruit")
    M.Btn_ProRecruit=CJNUIMgr.GetSunUseName(M.ProRecruitPanel,"Btn_ProRecruit")
    M.Btn_NormalRecruitTenth=CJNUIMgr.GetSunUseName(M.NormalRecruitTenthPanel,"Btn_NormalRecruit")
    M.Btn_NormalRecruit=CJNUIMgr.GetSunUseName(M.NormalRecruitPanel,"Btn_NormalRecruit")
    M.Btn_GoBackMenu=self.Btn_GoBackMenu().gameObject
    --Text文本
    M.Tenth_ProRecruitText=CJNUIMgr.GetSunUseName(M.ProRecruitTenthPanel,"ProRecruitText")
    M.Tenth_NormalRecruitText=CJNUIMgr.GetSunUseName(M.NormalRecruitTenthPanel,"NormalRecruitText")
    M.Single_ProRecruitText=CJNUIMgr.GetSunUseName(M.ProRecruitPanel,"ProRecruitText")
    M.Single_NormalRecruitText=CJNUIMgr.GetSunUseName(M.NormalRecruitPanel,"NormalRecruitText")
    --VideoPlayerObj
    M.VoidGearDraw_VideoPlayer=self.VoidGearDrawVideoPlayer().gameObject
    --RawImg
    M.VoidGearDraw_VideoRT=self.VoidGearDraw_VideoRT().gameObject
    --Prefab预制体
    M.ItemPanelPrefab=CJNUIMgr.GetSunUseName(M.UpperBtnPanel,"ItemPanelPrefab")
    --单次装备抽卡界面
    Event.Add("GoVoidDrawOnce", function ()
        -- statements
        VoidGearDrawViewModel.CurDrawType = VoidGearDrawViewModel.CurDrawTypeEnum.Once
        M.InitVideoPlayerCallParamterTab(math.random(0,2))
        UIComponentRegister.Instance:RegistComponentEvent(M.VoidGearDraw_VideoPlayer,"UIVideoRTMGR","InitVideoPlayer",M.Tab_CurVideoPlayerParamter)
        -- MgrUI.GoFirst(UID.VoidGearDrawResult)
    end)
    --十连装备抽卡界面
    Event.Add("GoVoidDrawTenth", function ()
        -- statements
        VoidGearDrawViewModel.CurDrawType = VoidGearDrawViewModel.CurDrawTypeEnum.Tenth
        M.InitVideoPlayerCallParamterTab(math.random(0,2))
        UIComponentRegister.Instance:RegistComponentEvent(M.VoidGearDraw_VideoPlayer,"UIVideoRTMGR","InitVideoPlayer",M.Tab_CurVideoPlayerParamter)
        -- MgrUI.GoFirst(UID.VoidGearDrawResult)
    end)
    UIEvent.LuaClick(M.Btn_NormalRecruit,Handle(M,M.OnClickNormalRecruit))
    UIEvent.LuaClick(M.Btn_NormalRecruitTenth,Handle(M,M.OnClickTenthNormalRecruit))
    UIEvent.LuaClick(M.Btn_ProRecruit,Handle(M,M.OnClickProRecruit))
    UIEvent.LuaClick(M.Btn_ProRecruitTenth,Handle(M,M.OnClickTenthProRecruit))
    --返回按钮
    UIEvent.LuaClick(M.Btn_GoBackMenu,Handle(M,function ()
        VoidGearDrawViewModel.Close()
    end))
    M.VoidGearDraw_VideoRT:SetActive(false)
    M.InitVoidDrawNeedPanel(500000)
    UISysTools.InitPlayerItemPanel(M.ItemRoot,M.ItemPanelPrefab,{{150003,0.9},{150012,1}},M)
end

function M.OnUpdateUI()
    M.VoidGearDraw_VideoRT:SetActive(false)
end

------------------------------------固定模块---------------------------------------------

function M.InitVoidDrawNeedPanel(_PoolId)
    local equip = EquipmentsupplyLocalData.tab[_PoolId]
    local _SingleGoldTab=JNStrTool.strSplit("_",equip.gold_1)
    local _TenthGoldTab=JNStrTool.strSplit("_",equip.gold_11)
    local _SingleStoneTab=JNStrTool.strSplit("_",equip.mineral_1)
    local _TenthStoneTab=JNStrTool.strSplit("_",equip.mineral_11)
    M.Tenth_ProRecruitText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("voidgeardraw_ui_consume").._TenthStoneTab[2]
    M.Tenth_NormalRecruitText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("voidgeardraw_ui_consume").._TenthGoldTab[2]
    M.Single_ProRecruitText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("voidgeardraw_ui_consume").._SingleStoneTab[2]
    M.Single_NormalRecruitText:GetComponent("TextMeshProUGUI").text=MgrLanguageData.GetLanguageByKey("voidgeardraw_ui_consume").._SingleGoldTab[2]
end

function M.GoFirstToVoidGearResult()
    VoidGearDrawViewModel.OpenVoidGearDrawBGUI()
end
--根据当前的抽卡最高品阶初始化视频播放传参table
function M.InitVideoPlayerCallParamterTab(type)
    M.Tab_CurVideoPlayerParamter={}
    --print("JNVoidDrawData.CurVoidDrawResultType当前初始化品阶"..JNVoidDrawData.CurVoidDrawResultType)
    if type == 0 then
        -- R
        table.insert(M.Tab_CurVideoPlayerParamter,"Video/VoidGearDrawVideoClip/VoidGearDrawClip_R")
    elseif type == 1 then
        -- SSR
        table.insert(M.Tab_CurVideoPlayerParamter,"Video/VoidGearDrawVideoClip/VoidGearDrawClip_SR")
    elseif type == 2 then
        -- SR
        table.insert(M.Tab_CurVideoPlayerParamter,"Video/VoidGearDrawVideoClip/VoidGearDrawClip_SSR")

    end
    table.insert(M.Tab_CurVideoPlayerParamter,M.VoidGearDraw_VideoRT:GetComponent("RawImage"))
    table.insert(M.Tab_CurVideoPlayerParamter,M.GoFirstToVoidGearResult)
end

--点击单次普通抽卡
function M.OnClickNormalRecruit()
    -- 先将初始化数据Flag置为False然后发起请求等待返回
    Event.Go("GoVoidDrawOnce")
    --JNVoidDrawData.bool_IsResultInfoInit = false
    --HttpCore.VoidGearDraw("500000","0","JNVoidDrawData.InitOnceCardDrawInfo",JNVoidDrawData.InitOnceCardDrawInfo,"GoVoidDrawOnce")
end

--点击单次精英抽卡
function M.OnClickProRecruit()
    -- 先将初始化数据Flag置为False然后发起请求等待返回
    Event.Go("GoVoidDrawOnce")
    --JNVoidDrawData.bool_IsResultInfoInit = false
    --HttpCore.VoidGearDraw("500000","2","JNVoidDrawData.InitOnceCardDrawInfo",JNVoidDrawData.InitOnceCardDrawInfo,"GoVoidDrawOnce")
end

--点击十连普通抽卡
function M.OnClickTenthNormalRecruit()
    -- 先将初始化数据Flag置为False然后发起请求等待返回
    Event.Go("GoVoidDrawTenth")
    --JNVoidDrawData.bool_IsResultInfoInit = false
    --HttpCore.VoidGearDraw("500000","1","JNVoidDrawData.InitTenthCardDrawInfo",JNVoidDrawData.InitTenthCardDrawInfo,"GoVoidDrawTenth")
end

--点击十连精英抽卡
function M.OnClickTenthProRecruit()
    -- 先将初始化数据Flag置为False然后发起请求等待返回
    Event.Go("GoVoidDrawTenth")
    --JNVoidDrawData.bool_IsResultInfoInit = false
    --HttpCore.VoidGearDraw("500000","3","JNVoidDrawData.InitTenthCardDrawInfo",JNVoidDrawData.InitTenthCardDrawInfo,"GoVoidDrawTenth")
end
return M