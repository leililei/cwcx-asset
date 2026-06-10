-- Code Auto Create Begin
local M = Class('VoidGearDrawResult_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VoidGearDrawResult_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VoidGearDrawResult_UI].prefab'
    self.Name = 'Form[VoidGearDrawResult_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 6
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_OnClickBack','Btn_OnClickBack',2},{'TenthVoidGearPanel','TenthVoidGearPanel',2},{'TenThVoidGearRoot','TenthVoidGearPanel/TenThVoidGearRoot',2},{'jijiadi','TenthVoidGearPanel/VoidGearPrefab/jijiadi',2},{'VoidGearIconImg','TenthVoidGearPanel/VoidGearPrefab/jijiadi/VoidGearIconImg',2},{'VoidGearOwnerIconImg','TenthVoidGearPanel/VoidGearPrefab/jijiadi/VoidGearIconImg/VoidGearOwnerIconImg',2},{'BrisIconImg','TenthVoidGearPanel/VoidGearPrefab/jijiadi/BrisIconImg',2},{'VoidRankKuangImg','TenthVoidGearPanel/VoidGearPrefab/VoidRankKuangImg',2},{'VoidGearVFXPanel','TenthVoidGearPanel/VoidGearPrefab/VoidGearVFXPanel',2},{'TenthVoidGearUpRoot','TenthVoidGearPanel/TenthVoidGearUpRoot',2},{'TenthVoidGearDownRoot','TenthVoidGearPanel/TenthVoidGearDownRoot',2},{'VoidGearPanel','VoidGearPanel',2},{'jijiadi01','VoidGearPanel/VoidGearOnce/jijiadi',2},{'VoidGearIconImg01','VoidGearPanel/VoidGearOnce/jijiadi/VoidGearIconImg',2},{'VoidGearOwnerIconImg01','VoidGearPanel/VoidGearOnce/jijiadi/VoidGearIconImg/VoidGearOwnerIconImg',2},{'BrisIconImg01','VoidGearPanel/VoidGearOnce/jijiadi/BrisIconImg',2},{'VoidRankKuangImg01','VoidGearPanel/VoidGearOnce/VoidRankKuangImg',2},{'VoidGearVFXPanel01','VoidGearPanel/VoidGearOnce/VoidGearVFXPanel',2},{'Btn_OnClickSkipAni','Btn_OnClickSkipAni',2},
        -- TextMeshProUGUI 列表
        {'VoidGearNamelText','TenthVoidGearPanel/VoidGearPrefab/VoidGearNamelText',20},{'VoidOwnerNameText','TenthVoidGearPanel/VoidGearPrefab/VoidOwnerNameText',20},{'VoidGearNamelText01','VoidGearPanel/VoidGearOnce/VoidGearNamelText',20},{'VoidOwnerNameText01','VoidGearPanel/VoidGearOnce/VoidOwnerNameText',20},{'TitleText','TitleText',20},{'TouchToExit','TouchToExit',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---------------------------
    ---测试数据
    M.testTab = {}
    for i = 1,math.random(1,8) do
        table.insert(M.testTab,{math.random(300000,300002),math.random(300000,300003),5})
    end
    -----------------------------------------------------

    M.Int_CurCreatIndex=1 --当前创建下标
    M.Int_CurLoopSum=#M.testTab --当前循环创建次数
    M.bool_IsLoopCreatEnd=true --当前是否已经结束循环生成
    ------------------------初始化信息-----------------------
    --Panel父节点
    M.VoidGearPanel=self.VoidGearPanel().gameObject
    M.TenthVoidGearPanel=self.TenthVoidGearPanel().gameObject
    M.TenthVoidGearUpRoot=CJNUIMgr.GetSunUseName(M.TenthVoidGearPanel,"TenthVoidGearUpRoot")
    M.TenthVoidGearDownRoot=CJNUIMgr.GetSunUseName(M.TenthVoidGearPanel,"TenthVoidGearDownRoot")
    M.VoidGearOnce=CJNUIMgr.GetSunUseName(M.VoidGearPanel,"VoidGearOnce")  --单抽奖励父节点
    --Btn按钮
    M.Btn_OnClickBack=self.Btn_OnClickBack().gameObject
    M.Btn_OnClickSkipAni=self.Btn_OnClickSkipAni().gameObject
    --Prefab预制体
    M.VoidGearPrefab=CJNUIMgr.GetSunUseName(M.TenthVoidGearPanel,"VoidGearPrefab")
    M.VoidGearPrefab:SetActive(false)
    UIEvent.LuaClick(M.Btn_OnClickSkipAni,Handle(M,function ()
        -- 点击跳过动画
        M.OnClickSkipTenthAni()
    end))
    UIEvent.LuaClick(M.Btn_OnClickBack,Handle(M,function ()
        VoidGearDrawViewModel.BackToVoidGearDrawUI()
        --Event.Clear("GoFirstToVoidGearDraw")
        --Event.Add("GoFirstToVoidGearDraw",function ()
        --    -- statements
        --    MgrUI.GoFirst(UID.VoidGearDraw)
        --end)
        --JNPlayerData.HttpPostInitPlayerBag("GoFirstToVoidGearDraw")
    end))
    --开场关闭返回按钮
    M.Btn_OnClickSkipAni:SetActive(false)
    M.Btn_OnClickBack:SetActive(false)
    M.InitAll()
end
--初始化抽卡结果
function M.InitAll()
    if VoidGearDrawViewModel.CurDrawType == VoidGearDrawViewModel.CurDrawTypeEnum.Tenth then
        -- statements
        M.InitTenthDrawLoop()
    else
        M.InitSingleDraw()
    end
end
--初始化一次单抽
function M.InitSingleDraw()
    M.InitVoidGearObj(M.VoidGearOnce,{math.random(300000,300002),math.random(300000,300003),5}) ---测试数据
    --M.InitVoidGearObj(M.VoidGearOnce,JNVoidDrawData.CurResultVoidGear[1])
    M.VoidGearPanel:SetActive(true)
    M.TenthVoidGearPanel:SetActive(false)
    M.Btn_OnClickBack:SetActive(true)
end

--初始化一次十连(11次)逐个创建
function M.InitTenthDrawLoop()
    -- statements
    M.bool_IsLoopCreatEnd = false
    M.Int_CurCreatIndex = 1
    M.LoopCreatVoidGear()
    M.VoidGearPanel:SetActive(false)
    M.TenthVoidGearPanel:SetActive(true)
    M.Btn_OnClickSkipAni:SetActive(true)
end
--循环创建方法
function M.LoopCreatVoidGear()
    -- statements
    if M.bool_IsLoopCreatEnd == true then
        -- 已经终止循环创建
        return
    end
    M.CreatVoidGearOBJ(M.Int_CurCreatIndex)
    M.Int_CurCreatIndex=M.Int_CurCreatIndex+1
    if M.Int_CurCreatIndex >M.Int_CurLoopSum then
        -- 超出最大创建个数跳出
        M.bool_IsLoopCreatEnd=true
        M.Btn_OnClickSkipAni:SetActive(false)
        M.Btn_OnClickBack:SetActive(true)
    end
    MgrTimer.AddDelayNoName(0.09,M.LoopCreatVoidGear,nil)
end

--跳过动画直接全部创建
function M.OnClickSkipTenthAni()
    -- statements
    M.bool_IsLoopCreatEnd = true
    M.InitTenthDrawAll()
end

--初始化一次十连(11次)全部一起创建
function M.InitTenthDrawAll()
    -- statements
    Tools.ClearAllChild(M.TenthVoidGearUpRoot)
    Tools.ClearAllChild(M.TenthVoidGearDownRoot)


    for key, value in pairs(M.testTab) do
        M.CreatVoidGearOBJ(key)
    end

    --for key, value in pairs(JNVoidDrawData.CurTenthContinuousResultTab) do
    --    M.CreatVoidGearOBJ(key,value)
    --end

    M.VoidGearPanel:SetActive(false)
    M.TenthVoidGearPanel:SetActive(true)
    M.Btn_OnClickSkipAni:SetActive(false)
    M.Btn_OnClickBack:SetActive(true)
end
function M.CreatVoidGearOBJ(_Key)
    local _TempObj=nil
    if _Key <= 6 then
        _TempObj=M.CreatGo(M.VoidGearPrefab,M.TenthVoidGearUpRoot)
    else
        _TempObj=M.CreatGo(M.VoidGearPrefab,M.TenthVoidGearDownRoot)
    end
    M.InitVoidGearObj(_TempObj,M.testTab[_Key])
end
--初始化一个角色共鸣装备信息
function M.InitVoidGearObj(_TargetObj,_InfoTab)
    -- statements
    if _TargetObj.gameObject == nil then
        -- 空物体返回
        return
    end
    local _VoidGearIconImg=CJNUIMgr.GetSunUseName(_TargetObj,"VoidGearIconImg")
    local _VoidRankKuangImg=CJNUIMgr.GetSunUseName(_TargetObj,"VoidRankKuangImg")
    local _VoidGearOwnerIconImg=CJNUIMgr.GetSunUseName(_TargetObj,"VoidGearOwnerIconImg")
    local _VoidGearNamelText=CJNUIMgr.GetSunUseName(_TargetObj,"VoidGearNamelText")
    local _VoidOwnerNameText=CJNUIMgr.GetSunUseName(_TargetObj,"VoidOwnerNameText")
    local _VoidGearVFXPanel=CJNUIMgr.GetSunUseName(_TargetObj,"VoidGearVFXPanel")
    local _BrisIconImg=CJNUIMgr.GetSunUseName(_TargetObj,"BrisIconImg")
    _BrisIconImg:SetActive(false)

    local _RoleEquip = RoleequipmentLocalData.tab[_InfoTab[1]]
    MgrRes.LoadSprite(_VoidGearIconImg,"Equip/".._RoleEquip[4])
    _VoidGearNamelText:GetComponent("TextMeshProUGUI").text="".._RoleEquip[2]
    -- print("当前抽取到的装备"..value[2])
    MgrRes.LoadSprite(_VoidRankKuangImg,"Quality/RankKuang_".._RoleEquip[7])
    Tools.InstantiateVFXObjByResourcesLoad("VFX/chouka/chouka_zhuangbei_VFX_".._RoleEquip[7],_VoidGearVFXPanel)

    local _Role = RoleattributeLocalData.tab[_RoleEquip[6]]
    _VoidOwnerNameText:GetComponent("TextMeshProUGUI").text="".._Role[2]
    MgrRes.LoadCircleIcon(_VoidGearOwnerIconImg,_Role[1])

    if _InfoTab[2] ~= 0 then
        -- 碎片不为空，已拥有转化成了碎片
        _BrisIconImg:SetActive(true)

        -- print("当前需要转化的ID是".._InfoTab[2])
        local item = GoodsLocalData.tab[_InfoTab[2]]
        _VoidGearNamelText:GetComponent("TextMeshProUGUI").text=""..item.name
        -- print("当前装备已拥有转换为了"..value[3])
        MgrRes.LoadSprite(_BrisIconImg,"Item/"..item.icon)

        _VoidOwnerNameText:GetComponent("TextMeshProUGUI").text="X".._InfoTab[3]
        Tools.SetImageFadeLoop(_VoidGearIconImg,_BrisIconImg,2.5,2,2)
    else
        _BrisIconImg:SetActive(false)
    end
end
---------------------------------通用方法----------------------------------------
--创建一个物体
function M.CreatGo(_Prefab,_Root)
    local tempObj=CJNUIMgr.CreatGo(_Prefab,_Root)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end

return M