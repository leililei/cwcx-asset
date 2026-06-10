-- Code Auto Create Begin
local M = Class('GearDrawResult_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.GearDrawResult_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[GearDrawResult_UI].prefab'
    self.Name = 'Form[GearDrawResult_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 6
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'beijing','beijing',2},{'dian','BackGroundPanel/dian',2},{'sanjiao','BackGroundPanel/sanjiao',2},{'Btn_OnClickBack','Btn_OnClickBack',2},{'HundredVoidGearPanel','HundredVoidGearPanel',2},{'HundredVoidGearUpRoot','HundredVoidGearPanel/HundredVoidGearUpRoot',2},{'HundredVoidGearDownRoot','HundredVoidGearPanel/HundredVoidGearDownRoot',2},{'Btn_HundredConfirm','HundredVoidGearPanel/BtnPanel/Btn_HundredConfirm',2},{'Btn_Cutpage(Selected)','HundredVoidGearPanel/BtnPanel/Btn_HundredConfirm/Btn_Cutpage(Selected)',2},{'Btn_HundredAgain','HundredVoidGearPanel/BtnPanel/Btn_HundredAgain',2},{'Btn_Cutpage(Selected)01','HundredVoidGearPanel/BtnPanel/Btn_HundredAgain/Btn_Cutpage(Selected)',2},{'Btn_Chakan','HundredVoidGearPanel/BtnPanel/Btn_Chakan',2},{'Btn_Cutpage(Selected)02','HundredVoidGearPanel/BtnPanel/Btn_Chakan/Btn_Cutpage(Selected)',2},{'TenthVoidGearPanel','TenthVoidGearPanel',2},{'TenThVoidGearRoot','TenthVoidGearPanel/TenThVoidGearRoot',2},{'VoidGearPrefab','TenthVoidGearPanel/VoidGearPrefab',2},{'jijiadi','TenthVoidGearPanel/VoidGearPrefab/jijiadi',2},{'VoidGearIconImg','TenthVoidGearPanel/VoidGearPrefab/jijiadi/VoidGearIconImg',2},{'BrisIconImg','TenthVoidGearPanel/VoidGearPrefab/jijiadi/BrisIconImg',2},{'VoidRankKuangImg','TenthVoidGearPanel/VoidGearPrefab/VoidRankKuangImg',2},{'VoidGearVFXPanel','TenthVoidGearPanel/VoidGearPrefab/VoidGearVFXPanel',2},{'TenthVoidGearUpRoot','TenthVoidGearPanel/TenthVoidGearUpRoot',2},{'TenthVoidGearDownRoot','TenthVoidGearPanel/TenthVoidGearDownRoot',2},{'Btn_Confirm','TenthVoidGearPanel/Btn_Confirm',2},{'Btn_Cutpage(Selected)03','TenthVoidGearPanel/Btn_Confirm/Btn_Cutpage(Selected)',2},{'Btn_Again','TenthVoidGearPanel/Btn_Again',2},{'Btn_Cutpage(Selected)04','TenthVoidGearPanel/Btn_Again/Btn_Cutpage(Selected)',2},{'VoidGearPanel','VoidGearPanel',2},{'VoidGearOnce','VoidGearPanel/VoidGearOnce',2},{'jijiadi01','VoidGearPanel/VoidGearOnce/jijiadi',2},{'VoidGearIconImg01','VoidGearPanel/VoidGearOnce/jijiadi/VoidGearIconImg',2},{'BrisIconImg01','VoidGearPanel/VoidGearOnce/jijiadi/BrisIconImg',2},{'VoidRankKuangImg01','VoidGearPanel/VoidGearOnce/VoidRankKuangImg',2},{'VoidGearVFXPanel01','VoidGearPanel/VoidGearOnce/VoidGearVFXPanel',2},{'Btn_OnceConfirm','VoidGearPanel/Btn_OnceConfirm',2},{'Btn_Cutpage(Selected)05','VoidGearPanel/Btn_OnceConfirm/Btn_Cutpage(Selected)',2},{'Btn_OnClickSkipAni','Btn_OnClickSkipAni',2},{'VoidGearListPanel','VoidGearListPanel',2},{'Mask','VoidGearListPanel/Mask',2},{'Img_Xian2','VoidGearListPanel/Img_Xian2',2},{'Img_Xian1','VoidGearListPanel/Img_Xian1',2},{'Img_bg','VoidGearListPanel/Img_bg',2},{'Img_di','VoidGearListPanel/Img_bg/Img_di',2},{'Content','VoidGearListPanel/Img_bg/VoidGearScroll/Content',2},{'Img_Biaotixian','VoidGearListPanel/Img_bg/Text_Title/Img_Biaotixian',2},{'chouka_zhuangbei_VFX_2','chouka_zhuangbei_VFX_2',2},{'chouka_zhuangbei_VFX_3','chouka_zhuangbei_VFX_3',2},{'chouka_zhuangbei_VFX_4','chouka_zhuangbei_VFX_4',2},{'chouka_zhuangbei_VFX_1','chouka_zhuangbei_VFX_1',2},{'CardDrawVideoRT','CardDrawVideoRT',2},{'Btn_Goahead','CardDrawVideoRT/Btn_Goahead',2},{'ChouKaVFXObj','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj',2},{'di','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di',2},{'di2','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di2',2},{'locked','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/locked',2},{'Image','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/Image',2},{'quan','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan',2},{'quan2','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan2',2},{'shizi','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/shizi',2},{'UnClickBg','UnClickBg',2},{'Btn_SkipPanel','Btn_SkipPanel',2},{'Btn_Skip','Btn_SkipPanel/Btn_Skip',2},{'Img_Skip_Icon','Btn_SkipPanel/Btn_Skip/Img_Skip_Icon',2},
        -- RawImage 列表
        {'VoidGearScroll','VoidGearListPanel/Img_bg/VoidGearScroll',15},
        -- LoopScrollRect 列表
        {'VoidGearScroll01','VoidGearListPanel/Img_bg/VoidGearScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_title','HundredVoidGearPanel/BtnPanel/Btn_HundredConfirm/Text_title',20},{'Text_title01','HundredVoidGearPanel/BtnPanel/Btn_HundredAgain/Text_title',20},{'Text_title02','HundredVoidGearPanel/BtnPanel/Btn_Chakan/Text_title',20},{'VoidGearNamelText','TenthVoidGearPanel/VoidGearPrefab/VoidGearNamelText',20},{'VoidOwnerNameText','TenthVoidGearPanel/VoidGearPrefab/VoidOwnerNameText',20},{'Text_title03','TenthVoidGearPanel/Btn_Confirm/Text_title',20},{'Text_title04','TenthVoidGearPanel/Btn_Again/Text_title',20},{'VoidGearNamelText01','VoidGearPanel/VoidGearOnce/VoidGearNamelText',20},{'VoidOwnerNameText01','VoidGearPanel/VoidGearOnce/VoidOwnerNameText',20},{'Text_title05','VoidGearPanel/Btn_OnceConfirm/Text_title',20},{'TitleText','TitleText',20},{'TouchToExit','TouchToExit',20},{'Text_Title','VoidGearListPanel/Img_bg/Text_Title',20},{'Text_Skip','Btn_SkipPanel/Btn_Skip/Text_Skip',20},
    }
end
-- Code Auto Create End
require("LocalData/RoleattributeLocalData")
require("LocalData/RoleequipmentLocalData")
function M:OnInit()
    self.UnClickBg().gameObject:SetActive(false)
    self.ChouKaVFXObj().gameObject:SetActive(false)---隐藏点击特效
    self.Int_CurCreatIndex=1 --当前创建下标
    self.Int_CurLoopSum=#NormalCardDrawViewModel.EquipList --当前循环创建次数
    self.bool_IsLoopCreatEnd=true --当前是否已经结束循环生成
    self.Btn_OnClickSkipAni().gameObject:SetActive(false)
    self.VoidGearPrefab().gameObject:SetActive(false)
    self.Btn_Confirm().gameObject:SetActive(false)
    self.Btn_Again().gameObject:SetActive(false)
    --self.CardDrawVideoRT().gameObject:SetActive(false)
    self.CardDrawVideoRT().gameObject:SetActive(true)
    self.VoidGearListPanel().gameObject:SetActive(false)
    self.Btn_SkipPanel().gameObject:SetActive(false)

    self.chouka_zhuangbei_VFX_2().gameObject:SetActive(false)
    self.chouka_zhuangbei_VFX_3().gameObject:SetActive(false)
    self.chouka_zhuangbei_VFX_4().gameObject:SetActive(false)
    self.chouka_zhuangbei_VFX_1().gameObject:SetActive(false)

    self:InitButton()
    self:InitScroll()
    if NormalCardDrawViewModel.CountType == 1 then
        self.HundredVoidGearPanel().gameObject:SetActive(false)
        self.TenthVoidGearPanel().gameObject:SetActive(true)
        self.VoidGearPanel().gameObject:SetActive(false)
        self:InitTenthDrawLoop()
    elseif NormalCardDrawViewModel.CountType == 0 then
        self.HundredVoidGearPanel().gameObject:SetActive(false)
        self.TenthVoidGearPanel().gameObject:SetActive(false)
        self.VoidGearPanel().gameObject:SetActive(true)
        self:InitSingleDraw()
    elseif NormalCardDrawViewModel.CountType == 2 then
        --不知道为什么不根据NormalCardDrawViewModel.EquipList的长度判断当前是几抽
        self.HundredVoidGearPanel().gameObject:SetActive(true)
        self.TenthVoidGearPanel().gameObject:SetActive(false)
        self.VoidGearPanel().gameObject:SetActive(false)
        self:InitHundredDrawLoop()
        --刷新滑动列表
        self.VoidGearScroll01().totalCount = #NormalCardDrawViewModel.EquipList
        self.VoidGearScroll01():RefillCells(0)
    end
    Event.Clear("NoviceGearConfirm")
    Event.Add("NoviceGearConfirm",function ()
        NormalCardDrawViewModel.BackToCardDrawUI(function ()
            NoviceViewModel.DoNext()
        end)
    end)
    Event.Add("ReconnetSucc", Handle(self,self.ReconnetEvent))
end

function M:ReconnetEvent()
    self.UnClickBg().gameObject:SetActive(false)
end

---关闭
function M:OnClose()
    Event.Remove("ReconnetSucc", Handle(self,self.ReconnetEvent))
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_OnClickSkipAni().gameObject,Handle(self,function ()
        if NormalCardDrawViewModel.CountType == 1 then
            -- 点击跳过动画
            self:OnClickSkipTenthAni()
        elseif NormalCardDrawViewModel.CountType == 2 then
            -- 点击跳过动画
            self:OnClickSkipHundredAni()
        end
    end))

    UIEvent.LuaClick(self.Btn_Confirm().gameObject,Handle(self,function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        NormalCardDrawViewModel.BackToCardDrawUI()
    end))
    UIEvent.LuaClick(self.Btn_OnceConfirm().gameObject,Handle(self,function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        NormalCardDrawViewModel.BackToCardDrawUI()
    end))
    UIEvent.LuaClick(self.Btn_Again().gameObject,Handle(self,function ()
        if NormalCardDrawViewModel.CurCostType == 2 then
            NormalCardDrawViewModel.CountType = 1
            self:OnClickVoidCard(0,11)
        elseif NormalCardDrawViewModel.CurCostType == 3 then
            NormalCardDrawViewModel.CountType  = 1
            self:OnClickVoidCard(1,11)
        end
    end))
    UIEvent.LuaClick(self.Btn_HundredConfirm().gameObject,Handle(self,function ()
        NormalCardDrawViewModel.BackToCardDrawUI()
    end))
    UIEvent.LuaClick(self.Btn_HundredAgain().gameObject,Handle(self,function ()
        NormalCardDrawViewModel.CountType  = 2
        if NormalCardDrawViewModel.CurCostType == 2 then
            self:OnClickVoidCard(0,110)
        elseif NormalCardDrawViewModel.CurCostType == 3 then
            self:OnClickVoidCard(1,110)
        end
    end))
    UIEvent.LuaClick(self.Btn_Chakan().gameObject,Handle(self,function ()
        self.VoidGearListPanel().gameObject:SetActive(true)
        self:ResetHundredDrawVFX(false)
    end))
    UIEvent.LuaClick(self.Mask().gameObject,Handle(self,function ()
        self.VoidGearListPanel().gameObject:SetActive(false)
        self:ResetHundredDrawVFX(true)
    end))
    ---点击跳过
    UIEvent.LuaClick(self.Btn_SkipPanel().gameObject, Handle(self, function()
        MgrTimer.Reset()
        self:StopCardDrawVideo()
        self:ReloadForNewEquips()
    end))
end

---初始化百抽
function M:InitHundredDrawLoop()
    self.bool_IsLoopCreatEnd = false
    self.Int_CurCreatIndex = 100
    self:LoopCreatVoidGear()
    self.Btn_OnClickSkipAni().gameObject:SetActive(true)
end

---初始化一次十连(11次)逐个创建
function M:InitTenthDrawLoop()
    -- statements
    self.bool_IsLoopCreatEnd = false
    self.Int_CurCreatIndex = 1
    self:LoopCreatVoidGear()
    self.Btn_OnClickSkipAni().gameObject:SetActive(true)
end
---初始化一次单抽
function M:InitSingleDraw()
    self:InitVoidGearObj(self.VoidGearOnce().gameObject,NormalCardDrawViewModel.EquipList[1])
    self.VoidGearPanel().gameObject:SetActive(true)
    self.TenthVoidGearPanel().gameObject:SetActive(false)
    self.Btn_OnClickBack().gameObject:SetActive(true)
end

---跳过动画直接全部创建
function M:OnClickSkipTenthAni()
    -- statements
    self.bool_IsLoopCreatEnd = true
    self:InitTenthDrawAll()
end
---初始化一次十连(11次)全部一起创建
function M:InitTenthDrawAll()
    -- statements
    self.Btn_Confirm().gameObject:SetActive(false)
    self.Btn_Again().gameObject:SetActive(false)
    Tools.ClearAllChild(self.TenthVoidGearUpRoot().gameObject)
    Tools.ClearAllChild(self.TenthVoidGearDownRoot().gameObject)
    for key, value in pairs(NormalCardDrawViewModel.EquipList) do
        self:CreatVoidGearOBJ(key)
    end
    self.Btn_OnClickSkipAni().gameObject:SetActive(false)
    self.Btn_Confirm().gameObject:SetActive(true)
    self.Btn_Again().gameObject:SetActive(true)
    self.Btn_OnClickBack().gameObject:SetActive(true)
    if NoviceViewModel.CurTaskId == 20408 then
        NoviceViewModel.DoNext()
    end
end

function M:OnClickSkipHundredAni()
    self.bool_IsLoopCreatEnd = true
    self:InitHundredDrawAtOnce()
end
---初始化百连最后十个
function M:InitHundredDrawAtOnce()
    self.Btn_HundredConfirm().gameObject:SetActive(false)
    self.Btn_HundredAgain().gameObject:SetActive(false)
    Tools.ClearAllChild(self.HundredVoidGearUpRoot().gameObject)
    Tools.ClearAllChild(self.HundredVoidGearDownRoot().gameObject)
    for key, value in pairs(NormalCardDrawViewModel.EquipList) do
        if key >= 100 then
            self:CreatVoidGearOBJ(key)
        end
    end
    self.Btn_OnClickSkipAni().gameObject:SetActive(false)
    self.Btn_HundredConfirm().gameObject:SetActive(true)
    self.Btn_HundredAgain().gameObject:SetActive(true)
    self.Btn_OnClickBack().gameObject:SetActive(true)
end

---循环创建方法
function M:LoopCreatVoidGear()
    -- statements
    if self.bool_IsLoopCreatEnd == true then
        --- 已经终止循环创建
        return
    end
    self:CreatVoidGearOBJ(self.Int_CurCreatIndex)
    self.Int_CurCreatIndex=self.Int_CurCreatIndex+1
    if self.Int_CurCreatIndex >self.Int_CurLoopSum then
        --- 超出最大创建个数跳出
        self.bool_IsLoopCreatEnd=true
        self.Btn_OnClickSkipAni().gameObject:SetActive(false)
        self.Btn_Confirm().gameObject:SetActive(true)
        self.Btn_Again().gameObject:SetActive(true)
        self.Btn_HundredConfirm().gameObject:SetActive(true)
        self.Btn_HundredAgain().gameObject:SetActive(true)
        self.Btn_OnClickBack().gameObject:SetActive(true)
        if NoviceViewModel.CurTaskId == 20408 then
            NoviceViewModel.DoNext()
        end
    end
    MgrTimer.AddDelayNoName(0.09,Handle(self,self.LoopCreatVoidGear),nil)
end

function M:CreatVoidGearOBJ(index)
    local _TempObj=nil
    if NormalCardDrawViewModel.CountType == 1 then
        if index <= 6 then
            _TempObj=self:CreatGo(self.VoidGearPrefab().gameObject,self.TenthVoidGearUpRoot().gameObject)
        else
            _TempObj=self:CreatGo(self.VoidGearPrefab().gameObject,self.TenthVoidGearDownRoot().gameObject)
        end
    elseif NormalCardDrawViewModel.CountType == 2 then
        if index <= 105 then
            _TempObj=self:CreatGo(self.VoidGearPrefab().gameObject,self.HundredVoidGearUpRoot().gameObject)
        else
            _TempObj=self:CreatGo(self.VoidGearPrefab().gameObject,self.HundredVoidGearDownRoot().gameObject)
        end
    end
    self:InitVoidGearObj(_TempObj,NormalCardDrawViewModel.EquipList[index])
end

---初始化一个角色共鸣装备信息
function M:InitVoidGearObj(_TargetObj,_InfoTab,isScroll)
    -- statements
    if _TargetObj.gameObject == nil then
        -- 空物体返回
        return
    end
    local _VoidGearIconImg=CJNUIMgr.GetSunUseName(_TargetObj,"VoidGearIconImg")
    local _VoidRankKuangImg=CJNUIMgr.GetSunUseName(_TargetObj,"VoidRankKuangImg")
    local _VoidGearNamelText=CJNUIMgr.GetSunUseName(_TargetObj,"VoidGearNamelText")
    local _VoidOwnerNameText=CJNUIMgr.GetSunUseName(_TargetObj,"VoidOwnerNameText")
    local _VoidGearVFXPanel=CJNUIMgr.GetSunUseName(_TargetObj,"VoidGearVFXPanel")
    local _BrisIconImg=CJNUIMgr.GetSunUseName(_TargetObj,"BrisIconImg")
    local _RoleEquip = RoleequipmentLocalData.tab[_InfoTab[1]]
    _BrisIconImg:SetActive(false)
    _VoidGearNamelText:GetComponent("TextMeshProUGUI").text="".._RoleEquip[2]
    _VoidOwnerNameText:GetComponent("TextMeshProUGUI").text="".._RoleEquip[9]
    MgrRes.LoadSprite(_VoidGearIconImg:GetComponent("Image"),"Equip/".._RoleEquip[4])
    MgrRes.LoadSprite(_VoidRankKuangImg:GetComponent("Image"),"Quality/GearRankKuang_".._RoleEquip[6])
    if isScroll == false or isScroll == nil then
        if _RoleEquip[6] == 4 then
            self:CreatGo(self.chouka_zhuangbei_VFX_4().gameObject,_VoidGearVFXPanel)
        elseif _RoleEquip[6] == 3 then
            self:CreatGo(self.chouka_zhuangbei_VFX_3().gameObject,_VoidGearVFXPanel)
        elseif _RoleEquip[6] == 2 then
            self:CreatGo(self.chouka_zhuangbei_VFX_2().gameObject,_VoidGearVFXPanel)
        elseif _RoleEquip[6] == 1 then
            self:CreatGo(self.chouka_zhuangbei_VFX_1().gameObject,_VoidGearVFXPanel)
        end
    end
    local arr = JNStrTool.strSplit("_",_RoleEquip[4])
    if _InfoTab[2] == 1 then
        -- 碎片不为空，已拥有转化成了碎片
        _BrisIconImg:SetActive(true)
        local itemStr = RoleequipmentLocalData.tab[_InfoTab[1]][10]
        local arr = JNStrTool.strSplit("_",itemStr)
        ---@type ItemData
        local itemData = ItemControl.GetItemByType(1,tonumber(arr[2]))
        _VoidGearNamelText:GetComponent("TextMeshProUGUI").text=""..itemData.name
        _VoidOwnerNameText:GetComponent("TextMeshProUGUI").text="X"..arr[3]
         MgrRes.LoadSprite(_BrisIconImg:GetComponent("Image"),"Item/"..itemData.icon)
        --Global.DoImageAlpha(_VoidGearIconImg:GetComponent("Image"),1,0, 3)
        --Global.DoImageAlpha(_BrisIconImg:GetComponent("Image"),0,1, 3)
        if isScroll == nil or isScroll == false then
            _VoidGearIconImg:SetActive(true)
            Tools.SetImageFadeLoop(_VoidGearIconImg,_BrisIconImg,2.5,2,2)
        else
            _VoidGearIconImg:SetActive(false)
            _BrisIconImg.transform:GetComponent("Image").color = Color(1,1,1,1)
        end
    else
        _VoidGearIconImg:SetActive(true)
        _BrisIconImg:SetActive(false)
    end
    MgrSound.PlayEffect("yx_ui_juesechouka_01",nil,nil,false)
end

--创建一个物体
function M:CreatGo(_Prefab,_Root)
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end


---装备抽卡点击事件
function M:OnClickVoidCard(type,count)
    self.UnClickBg().gameObject:SetActive(true)
    ---@type ItemData
    local item = nil
    local str = ""
    local cost = 0
    if type==0 then  --盾币
        item = ItemControl.GetItemByID(100001)
        NormalCardDrawViewModel.CurCostType = 2
        str = item.name
        if count == 11 then
            cost = 28000
        elseif count == 110 then
            cost = 280000
        else
            cost = 3000
        end
    elseif type==1 then  --原石
        item = ItemControl.GetItemByID(110020)
        NormalCardDrawViewModel.CurCostType = 3
        str = item.name
        if count == 11 then
            cost = 100
        elseif count == 110 then
            cost = 1000
        else
            cost = 10
        end
    end
    if item.count and item.count>=cost then
        self:EquipSupplyClick(NormalCardDrawViewModel.CurRecruit,type,count)
    else
        if type==1 then
            MgrUI.Pop(UID.CardBuyPop,{MgrLanguageData.GetLanguageByKey("geardrawresult_ui_stone_exchange"),item,cost,false,Handle(self,Handle(self, function()
                self:EquipSupplyClick(NormalCardDrawViewModel.CurRecruit,type,count)
            end))},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{str..MgrLanguageData.GetLanguageByKey("geardrawresult_ui_stone_notenough"),1},true)
        end
        self.UnClickBg().gameObject:SetActive(false)
        return
    end
end
---抽卡返回ACK
function M:ReceiveEquipSupplyACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEquipSupplyACK',buffer))
    if tag ~= 1 then
        return
    end
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("geardrawresult_ui_tips1"),2},true)
        self.UnClickBg().gameObject:SetActive(false)
    end
    print(tab.errNo)
end
---抽卡返回NTF
function M:ReceiveEquipSupplyNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEquipSupplyNTF',buffer))
    if tag ~= 1 then
        return
    end
    self.Btn_Confirm().gameObject:SetActive(false)
    self.Btn_Again().gameObject:SetActive(false)
    self.Btn_HundredConfirm().gameObject:SetActive(false)
    self.Btn_HundredAgain().gameObject:SetActive(false)
    Tools.ClearAllChild(self.TenthVoidGearUpRoot().gameObject)
    Tools.ClearAllChild(self.TenthVoidGearDownRoot().gameObject)
    Tools.ClearAllChild(self.HundredVoidGearUpRoot().gameObject)
    Tools.ClearAllChild(self.HundredVoidGearDownRoot().gameObject)

    ---统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    --print(tab)
    ---共鸣id list
    local equiparr = {}
    ---重复共鸣替换的物品
    local goodarr = {}
    ---是否有ssr
    local isSSR = false
    ---是否有sr
    local isSR = false
    for i, v in pairs(tab.equips) do
        if v.equip then
            local arr = {}
            table.insert(arr,v.equip.equipID)
            if v.goods then
                table.insert(goodarr,v.goods[1])
                table.insert(arr,1)
            else
                EquipControl.PushSingleEquipData(v.equip)
                table.insert(arr,0)
            end
            table.insert(equiparr,arr)
            if not isSSR then
                if RoleequipmentLocalData.tab[v.equip.equipID][6] == 4 then
                    isSSR = true
                end
            end
            if not isSR then
                if RoleequipmentLocalData.tab[v.equip.equipID][6] ==3 then
                    isSR = true
                end
            end
        end
    end
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/CoreAward/VoidGearDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/CoreAward/VoidGearDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/CoreAward/VoidGearDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.EquipList = equiparr
    CardDrawControl.SetRecruitIndex(self.recruitID, tab.recruitIndex);
    ItemControl.PushGroupItemData(goodarr,ItemControl.PushEnum.add)
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    --self.CardDrawVideoRT().gameObject:SetActive(true)
    self.Btn_SkipPanel().gameObject:SetActive(true)
    --不再代码里控制抽卡动画播放 直接打开插件的OnEnable播放动画 防止出现闪白情况
    criUI:Play()
    MgrSound.PlayEffect("draw_equipment",nil,nil,false)
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "PlayEnd: 6" then
            self:ReloadForNewEquips()
            -- 不停止就会一直显示最后一帧的白光
            criUI:Stop()
            criUI.player.statusChangeCallback = nil
        end
    end
end
---抽卡请求
function M:EquipSupplyClick(recruitID,type,count)
    local EquipSupplyREQ  =
    {
        recruitID =recruitID,
        type = type,
        count = count,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(recruitID),
    }
    self.recruitID = recruitID;
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientEquipSupplyREQ',EquipSupplyREQ))
    ItemControl.AckError = true
    ItemControl.EquipAckError =true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EQUIP_SUPPLY_REQ,bytes,1,nil,Handle(self,self.ReceiveEquipSupplyACK),Handle(self,self.ReceiveEquipSupplyNTF))
end

function M:UpdatePanel()
    self.Int_CurLoopSum=#NormalCardDrawViewModel.EquipList --当前循环创建次数
    self.bool_IsLoopCreatEnd=true --当前是否已经结束循环生成
    -- 失活该对象，会导致 Stop 后无法再次 Play
    --self.CardDrawVideoRT().gameObject:SetActive(false)
    self.Btn_Confirm().gameObject:SetActive(false)
    self.Btn_Again().gameObject:SetActive(false)
    self.Btn_HundredConfirm().gameObject:SetActive(false)
    self.Btn_HundredAgain().gameObject:SetActive(false)
    if NormalCardDrawViewModel.CountType == 1 then
        self.Int_CurCreatIndex=1 --当前创建下标
        self:InitTenthDrawLoop()
    elseif NormalCardDrawViewModel.CountType == 2 then
        self.Int_CurCreatIndex = 100
        self:InitHundredDrawLoop()
    end
end

function M:InitScroll()
    self.VoidGearScroll01():SetLuaCellEvent(Handle(self, self.ScrollEvent))
end

function M:ScrollEvent(trans,idx)
    self:InitVoidGearObj(trans.gameObject,NormalCardDrawViewModel.EquipList[idx],true)
end

function M:ResetHundredDrawVFX(bool)
    for i = 0,self.HundredVoidGearUpRoot().transform.childCount-1 do
        self.HundredVoidGearUpRoot().gameObject.transform:GetChild(i).transform:Find("VoidGearVFXPanel").gameObject:SetActive(bool)
    end
    for i = 0,self.HundredVoidGearDownRoot().transform.childCount-1 do
        self.HundredVoidGearDownRoot().gameObject.transform:GetChild(i).transform:Find("VoidGearVFXPanel").gameObject:SetActive(bool)
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        NormalCardDrawViewModel.BackToCardDrawUI()
    end
end

--region 控件操作
--- 以新的抽卡数据重新加载
function M:ReloadForNewEquips()
    self:UpdatePanel()
    self.VoidGearScroll01():RefillCells(0)
    self.Btn_SkipPanel().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
end

--- 停止抽卡视频播放
function M:StopCardDrawVideo()
    ---@type UnityEngine.UI.Image
    local imageComp = self.CardDrawVideoRT()
    if not imageComp or Global.IsNil(imageComp) then
        return
    end
    ---@type CriWare.CriManaMovieControllerForUI
    local videoComp = imageComp.transform:GetComponent("CriManaMovieControllerForUI")
    if not videoComp or Global.IsNil(videoComp) then
        return
    end
    videoComp:Stop()
    videoComp.player.statusChangeCallback = nil
end
--endregion

return M