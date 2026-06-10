-- Code Auto Create Begin
local M = Class('ItemDetailPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ItemDetailPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ItemDetailPop_UI].prefab'
    self.Name = 'Form[ItemDetailPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_Back','Ani/Btn_Back',2},{'ItemDetailPanel','Ani/ItemDetailPanel',2},{'Img_xian1','Ani/ItemDetailPanel/Img_xian1',2},{'Img_xian2','Ani/ItemDetailPanel/Img_xian2',2},{'LeftPanel','Ani/ItemDetailPanel/LeftPanel',2},{'ItemIconPanel','Ani/ItemDetailPanel/LeftPanel/ItemIconPanel',2},{'jiaobiao','Ani/ItemDetailPanel/LeftPanel/ItemIconPanel/jiaobiao',2},{'ItemIconImg','Ani/ItemDetailPanel/LeftPanel/ItemIconPanel/ItemIconImg',2},{'VFXItemIcon','Ani/ItemDetailPanel/LeftPanel/ItemIconPanel/VFXItemIcon',2},{'LimitTimeBg','Ani/ItemDetailPanel/LeftPanel/ItemIconPanel/LimitTimeBg',2},{'LeftTitleImgPanel','Ani/ItemDetailPanel/LeftPanel/LeftTitleImgPanel',2},{'LeftTitleBg','Ani/ItemDetailPanel/LeftPanel/LeftTitleImgPanel/LeftTitleBg',2},{'TitleTextPrefab','Ani/ItemDetailPanel/LeftPanel/TitleTextPrefab',2},{'TitleTextBlankPrefab','Ani/ItemDetailPanel/LeftPanel/TitleTextBlankPrefab',2},{'LeftTitleScrollOLD','Ani/ItemDetailPanel/LeftPanel/LeftTitleScrollOLD',2},{'LeftTitleScrollMask','Ani/ItemDetailPanel/LeftPanel/LeftTitleScrollMask',2},{'ScrollView','Ani/ItemDetailPanel/LeftPanel/LeftTitleScrollMask/Scroll View',2},{'Viewport','Ani/ItemDetailPanel/LeftPanel/LeftTitleScrollMask/Scroll View/Viewport',2},{'LeftTitleScroll','Ani/ItemDetailPanel/LeftPanel/LeftTitleScrollMask/Scroll View/Viewport/LeftTitleScroll',2},{'RightScrollPanel','Ani/ItemDetailPanel/RightScrollPanel',2},{'Viewport01','Ani/ItemDetailPanel/RightScrollPanel/Viewport',2},{'RightScrollRoot','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot',2},{'ItemInfoPanel','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot/ItemInfoPanel',2},{'OwnCountPanel','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot/ItemInfoPanel/OwnCountPanel',2},{'fengexian2','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot/ItemInfoPanel/fengexian2',2},{'ItemAccessPrefab','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessPrefab',2},{'parent','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessPrefab/parent',2},{'AccessSlider','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessPrefab/parent/AccessSlider',2},{'Image','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessPrefab/parent/Image',2},{'Btn_GoAccess','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessPrefab/Btn_GoAccess',2},{'ItemAccessDeniedPrefab','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessDeniedPrefab',2},{'AccessSlider01','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessDeniedPrefab/AccessSlider',2},{'Btn_Unlock','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessDeniedPrefab/Btn_Unlock',2},{'ItemAccessEmpty','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessEmpty',2},{'ItemUsePanel','Ani/ItemDetailPanel/ItemUsePanel',2},{'GroupPanel','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel',2},{'Btn_Max','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_Max',2},{'Btn_Add','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_Add',2},{'+(hui)','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_Add/+(hui)',2},{'Btn_AddHighLight','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_AddHighLight',2},{'+','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_AddHighLight/+',2},{'Btn_Decrease','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_Decrease',2},{'-(hui)','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_Decrease/-(hui)',2},{'Btn_DecreaseHighLight','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_DecreaseHighLight',2},{'-','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_DecreaseHighLight/-',2},{'toumingdi','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/toumingdi',2},{'Btn_UseItem','Ani/ItemDetailPanel/ItemUsePanel/Btn_UseItem',2},
        -- Text 列表
        {'TitleText','Ani/ItemDetailPanel/LeftPanel/TitleTextPrefab/TitleText',3},{'ItemDesText','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot/ItemDesText',3},{'AccessNameText','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessDeniedPrefab/AccessNameText',3},
        -- TextMeshProUGUI 列表
        {'LimitTime','Ani/ItemDetailPanel/LeftPanel/ItemIconPanel/LimitTimeBg/LimitTime',20},{'Text_XianZhi','Ani/ItemDetailPanel/LeftPanel/Text_XianZhi',20},{'Text_Jueseming','Ani/ItemDetailPanel/LeftPanel/Text_Jueseming',20},{'OwnCountNameText','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot/ItemInfoPanel/OwnCountPanel/OwnCountNameText',20},{'OwnCountText','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot/ItemInfoPanel/OwnCountPanel/OwnCountText',20},{'ItemNameText','Ani/ItemDetailPanel/RightScrollPanel/Viewport/RightScrollRoot/ItemInfoPanel/ItemNameText',20},{'TitleText01','Ani/ItemDetailPanel/RightScrollPanel/TitleText',20},{'AccessNameText01','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessPrefab/parent/AccessNameText',20},{'GoAccessBtnTxt','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessPrefab/Btn_GoAccess/GoAccessBtnTxt',20},{'UnlockBtnText','Ani/ItemDetailPanel/RightScrollPanel/ItemAccessDeniedPrefab/Btn_Unlock/UnlockBtnText',20},{'Text','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/Btn_Max/Text',20},{'ItemUseCountText','Ani/ItemDetailPanel/ItemUsePanel/GroupPanel/toumingdi/ItemUseCountText',20},{'Btn_Txt','Ani/ItemDetailPanel/ItemUsePanel/Btn_UseItem/Btn_Txt',20},
    }
end
-- Code Auto Create End
require("LocalData/InterfacefunctionLocalData")
require("LocalData/HideLocalData")
function M:OnInit()
    ---当前使用数量
    self.CurUseCount = 1
    ---初始化点击
    self:InitClick()
    ---初始化显示
    self:InitActive()
    self.fallData = self:GetFallData()
    Event.Add("BackKey", Handle(self, self.OnBackKey))

    --隐藏道具展示界面特效
    Event.Go("HideGetItemsPanelEff")
end

--获得掉落数据
function M:GetFallData()
    local t = {}
    local fData  = InterfacefunctionLocalData.tab
    for index, value in ipairs(fData) do
        t[value[2]] = value
    end
    return t
end

function M:OnBackKey()
    local tab = {"ItemDetailPop_UI","HuoDongPop_UI","ItemAchievePop_UI","ItemAchievePop_UI","StarRewardPop_UI","PVPRewardPreview","BuyPop_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
---参数1：物品id 参数2:可否使用 参数3:使用回调
function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    ---@type ItemData 设置数据
    self.CurItem =args[1]
    self.IsUse = args[2]
    self.Callback = args[3]
    self.CloseCallback = args[4]
    self.CloseCountPanel = args[5]
    ---重置面板
    self:ReChangePanel()
    ---重置使用
    self:ReChangeUse()
    ---重置掉落跳转
    self:ReChangeDropJump()
    ---重置兑换/购买跳转
    self:ReChangeBuyJump()
    ---设置默认最小值
    self:OnChangeCount(0)
end
---初始化点击事件
function M:InitClick()
    ---退出
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self, function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        --显示道具展示界面特效
        Event.Go("ShowGetItemsPanelEff")
        MgrUI.ClosePop(self.Uid)
    end))
    ---使用物品
    UIEvent.LuaClick(self.Btn_UseItem().gameObject,Handle(self, function ()
        if self.IsUse ~= true then
            return
        end
         --当演习次数大于99次时使用‘精英演习券’时应该无法补充次数
        if 110040 == self.CurItem.id and (PVPViewModel.HighCard + self.CurUseCount) > tonumber(SteamLocalData.tab[107010][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips9"),2},true)
            return
        end

        ---发送请求
        if self.CurItem.use == 1 or self.CurItem.use == 2 then
            ---@type goods 使用获取结果
            local info = {
                goodsID = self.CurItem.id,
                goodsType = self.CurItem.goodsType,
                goodsNum = self.CurUseCount,
            }
            ItemControl.UseGoods(info,function(err,msgId)
                if not err then
                    Log.Error("使用物品失败")
                    MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),err),1},true)
                end
            end,function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientUseGoodsACK',buffer))
                if tab.errNo == 0 then
                elseif tab.errNo == 579 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_tips1"),2},true)
                else
                    MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("ItemControl_network_anomaly"),tab.errNo),1},true)
                end
            end,function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientUseGoodsNTF',buffer))
                ItemControl.PushSingleItemData(tab.cost,ItemControl.PushEnum.consume)
                ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
                local tShowGoods = tab.goods
                --添加共鸣装备
                if tab.equip then
                    for i, v in ipairs(tab.equip) do
                        tShowGoods[#tShowGoods + 1] =
                        {
                            goodsID = v.equipID,
                            goodsNum = 1,
                            goodsType = 5
                        }
                    end
                   
                    EquipControl.PushGroupEquipData(tab.equip)
                end
                PlayerControl.GetPlayerData():PushVigor(tab.vigor)

                if tab.cost.goodsID == 110040 then --保存演习券使用数量
                    PVPViewModel.HighCard = PVPViewModel.HighCard + tab.cost.goodsNum
                end
                ---更新数据统计
                TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
                if tShowGoods and #tShowGoods > 0 then
                    MgrUI.Pop(UID.ItemAchievePop_UI, { tShowGoods }, true)
                else
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_tips2"),1},true)
                end
                ---通知回调
                if self.Callback ~= nil then
                    self.Callback()
                end
            end)
        elseif self.CurItem.use == 3 or self.CurItem.use == 4 or self.CurItem.use == 7 or self.CurItem.use == 9 or self.CurItem.use == 10 then
            ---可批量选择使用获取结果
            MgrUI.Pop(UID.OptionalPop_UI,{self.CurItem,self.Callback},true,1)
        else
            ---不能使用
            Log.Error( string.format("这个物品不能使用,物品:%s ,ID:%s,",self.CurItem.name,self.CurItem.id))
        end
        MgrUI.ClosePop(self.Uid)
        MgrUI.ClosePop(UID.ItemAchievePop_UI)
    end))
    local Objs = {
        self.Btn_Max().gameObject,      ---最大值
    }
    for idx, obj in ipairs(Objs) do
        UIEvent.PressClick(obj,Handle(self, function ()
            self:OnChangeCount(idx)
        end))
    end

    self.IntClicking = false  --是否在长按中
    self.EndClicking = true   --是否结束长按
    self.loopTimer = 0        --长按持续时间
    self.isAdd = true         --是否是增加
    ---点击增加
    UIEvent.LuaPressClick(self.Btn_AddHighLight().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndClicking = false
        self.loopTimer = 0
        self.isAdd = true

        ---单次点击逻辑
        local count = self.CurUseCount + 1
        self.CurUseCount = count > self.CurItem.count and self.CurUseCount or count
        self.ItemUseCountText().text = self.CurUseCount
        ---长按逻辑
        self:LoopInput()
    end)
    ---点击减少
    UIEvent.LuaPressClick(self.Btn_DecreaseHighLight().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndClicking = false
        self.loopTimer = 0
        self.isAdd = false

        ---单次点击逻辑
        local count = self.CurUseCount - 1
        self.CurUseCount = count < 2 and 1 or count
        self.ItemUseCountText().text = self.CurUseCount
        ---长按逻辑
        self:LoopInput()
    end)

end

---长按逻辑
function M:LoopInput()
    if self.EndClicking == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05, Handle(self, self.LoopInput), self.ObjRoot)
        self.IntClicking = true
        self.loopTimer = self.loopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.loopTimer > 5 then
            if self.isAdd then
                local count = self.CurUseCount + 1
                self.CurUseCount = count > self.CurItem.count and self.CurUseCount or count
                --self.Btn_AddHighLight().gameObject:SetActive(self.CurUseCount < self.CurItem.count)
                --self.Btn_DecreaseHighLight().gameObject:SetActive(self.CurUseCount > 1)
                self.ItemUseCountText().text = self.CurUseCount
            else
                local count = self.CurUseCount - 1
                self.CurUseCount = count < 2 and 1 or count
                --self.Btn_AddHighLight().gameObject:SetActive(self.CurUseCount < self.CurItem.count)
                --self.Btn_DecreaseHighLight().gameObject:SetActive(self.CurUseCount > 1)
                self.ItemUseCountText().text = self.CurUseCount
            end
        end
        ---循环结束
        if bool_IsUp == false then
            self.IntClicking = false
            self.EndClicking = true
            self.loopTimer = 0
        end
    end
end

function M:InitActive()
    self.ItemAccessPrefab().gameObject:SetActive(false)
    self.ItemAccessDeniedPrefab().gameObject:SetActive(false)
    self.ItemAccessEmpty().gameObject:SetActive(false)
    self.TitleText().gameObject:SetActive(false)
    
end
---重置道具面板
function M:ReChangePanel()

    if self.CloseCountPanel then
        self.OwnCountPanel().gameObject:SetActive(false)
    else
        self.OwnCountPanel().gameObject:SetActive(true)
    end

    ---物品数量
    local itemData = ItemControl.GetItemByType(self.CurItem.goodsType, self.CurItem.id)
    if (nil ~= itemData and nil ~= itemData.numlimt and -1 ~= itemData.numlimt and self.CurItem.count >= itemData.numlimt) then
        self.OwnCountText().text = string.format(MgrLanguageData.GetLanguageByKey("bag_ui_text7"), self.CurItem.count, itemData.numlimt);
    else
        self.OwnCountText().text = self.CurItem.count
    end
    --if self.CurItem.goodsType == 4  then
    --    self.OwnCountPanel().gameObject:SetActive(false)
    --else
    --    self.OwnCountPanel().gameObject:SetActive(true)
    --end

    ---物品图标
    if self.CurItem.goodsType == 4 and string.split(self.CurItem.icon,"/")[1] ~= "Item" then
        MgrRes.LoadSprite(self.ItemIconImg(),"Item/"..self.CurItem.icon)
    else
        --带动画勋章
        local tab = HideLocalData.tab[self.CurItem.id]
        if tab and tab.anime and tab.anime ~= "0" then
            Tools.ClearAllChild(self.VFXItemIcon().gameObject)
            self.ItemIconImg().gameObject:SetActive(false)
            self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
            MgrRes.GetPrefab(self.vfx_path..tab.anime..".prefab",function(Obj)
                if Obj == nil then return end
                Obj.transform:SetParent(self.VFXItemIcon().gameObject.transform)
                Obj.transform.localPosition = Vector3.zero
                Obj.transform.localScale = Vector3(32,32,1)
            end)
        else
            Tools.ClearAllChild(self.VFXItemIcon().gameObject)
            self.ItemIconImg().gameObject:SetActive(true)
            MgrRes.LoadSprite(self.ItemIconImg(),self.CurItem.icon)
        end
    end
    --限时道具
    self.LimitTimeBg().gameObject:SetActive(false)
    local tLimitItem = ItemControl.GetLimitItemByID(self.CurItem.goodsType,self.CurItem.id)
    if tLimitItem then
        self.LimitTimeBg().gameObject:SetActive(true)
        --获取格式时间 剩余xx天/时/分
        self.LimitTime().text = Global.GetTimeMode(tLimitItem.ETime-Global.GetCurTime(),"eventshopitem_surplus")
    end

    --共鸣装备
    if self.CurItem.goodsType == 5 and string.split(self.CurItem.icon,"/")[1] == "Equip" then
        local name = RoleequipmentLocalData.tab[self.CurItem.id][9]
        self.Text_Jueseming().text = name
    else
        self.Text_Jueseming().gameObject:SetActive(false)
        self.Text_XianZhi().gameObject:SetActive(false)
    end
    ---物品名称
    self.ItemNameText().text = self.CurItem.name
    ---物品简介
    self.ItemDesText().text = self.CurItem.txt
end
---重置使用功能
function M:ReChangeUse()
    if self.IsUse ~= true then
        ---不能使用
        self.ItemUsePanel().gameObject:SetActive(false)
        return
    end
    ---使用功能
    if self.CurItem.count < 1 then
        self.ItemUsePanel().gameObject:SetActive(false)
    else
        if self.CurItem.use == 1 then
            ---可批量使用获取结果
            self.ItemUsePanel().gameObject:SetActive(true)
            self.GroupPanel().gameObject:SetActive(true)
            self.Btn_Txt().text = MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_use")
        elseif self.CurItem.use == 2 or self.CurItem.use == 9 or self.CurItem.use == 10 then
            ---可单个使用获取结果
            self.ItemUsePanel().gameObject:SetActive(true)
            self.GroupPanel().gameObject:SetActive(false)
            self.Btn_Txt().text = MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_use")
        elseif self.CurItem.use == 3 then
            ---可批量选择使用获取结果
            self.ItemUsePanel().gameObject:SetActive(true)
            self.GroupPanel().gameObject:SetActive(true)
            self.Btn_Txt().text = MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_choice")
        elseif self.CurItem.use == 4 or self.CurItem.use == 7 then
            ---可单个选择使用获取结果
            self.ItemUsePanel().gameObject:SetActive(true)
            self.GroupPanel().gameObject:SetActive(false)
            self.Btn_Txt().text = MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_choice")
        else
            ---不能使用
            self.ItemUsePanel().gameObject:SetActive(false)
        end
    end
end
---重置掉落跳转
function M:ReChangeDropJump()
    --掉落渠道
    --local data = InterfacefunctionLocalData.tab()
    local equipChannel = RoleequipmentLocalData.tab[self.CurItem.id]
    if equipChannel ~= nil then
        if equipChannel[14] ~= "0" or equipChannel[14] ~= "" or equipChannel[14] ~= 0 then
            self.CurItem.channel = equipChannel[14]
        end
    end
    if self.CurItem.channel and self.CurItem.channel ~= "0" and MgrUI.GetCurUI().Uid ~= UID.Plot_UI and MgrUI.GetCurUI().Uid ~= UID.Shop_UI then
        ---创建掉落渠道链接
        local txt = self:CreatGo(self.TitleText01().gameObject,self.RightScrollRoot().gameObject)
        txt:SetActive(true)
        local strs = string.split(self.CurItem.channel,',')
        for index, value in ipairs(strs) do
            if "tz_wjxq_zyjs_01" == value and SysLockControl.CheckSysLock(2007) == false then
                local obj = self:CreatGo(self.ItemAccessDeniedPrefab().gameObject,self.RightScrollRoot().gameObject)--邮件附件预制件
                local title = obj.transform:Find("AccessNameText"):GetComponent("TextMeshProUGUI")
                title.text = self.fallData[value][3]
            else
                if self.fallData[value] then
                    local obj = self:CreatGo(self.ItemAccessPrefab().gameObject,self.RightScrollRoot().gameObject)               --邮件附件预制件
                    local title = obj.transform:Find("parent/AccessNameText"):GetComponent("TextMeshProUGUI")
                    local btn = obj.transform:Find("Btn_GoAccess"):GetComponent("Image")
                    title.text = self.fallData[value][3]--
                    UIEvent.LuaClick(btn.gameObject,Handle(self, function ()
                        MgrUI.CloseAllPop()
                        if value == "tz_sc_wzbc_01" and MgrUI.IsShow(UID.Shop_UI) then --商店跳转物资补给商店
                            Event.Go("JumpShopWuZi",114002)
                            return
                        end
                        if MgrUI.GetPopUI(UID.NewRoleSkill_UI) ~= nil and value == "tz_zz_zy_600001_0" then
                            Event.Go("NoviceSkillHideSelf")
                        end

                        if value == "tz_sc_wzbc_01" and  MgrUI.GetPopUI(UID.NewRoleSkill_UI) then
                            Event.Go("NoviceSkillHideSelf")
                        end

                        if MgrUI.GetPopUI(UID.NewRoleFormation_UI) ~= nil and value == "tz_zz_zy_600001_0" or value == "tz_sc_wzbc_01" or value == "tz_zz_zy_600200_0" or value == "tz_zz_zy_01" then
                            if SysLockControl.CheckSysLock(1102) then
                                Event.Go("HideNewRoleFormationSelf")
                            end
                        end

                        -- if MgrUI.GetPopUI(UID.NewRoleFormation_UI) ~= nil and value == "tz_zz_zy_600001_0" then
                        --     Event.Go("NoviceSkillHideSelf")
                        -- end
                        MgrLink.LinkStart(string.split(value,'_'))
                          --MgrLink.LinkStart(string.split("tz_zz_zyjxfb_600201_0",'_'))
                          --MgrLink.LinkStart(string.split("tz_sc_cz_01",'_'))
                          --MgrUI.ClosePop(self.Uid)
                      end))
                else
                    print("表里的数据不存在...")
                end
            end
        end
    else
        --self.TitleText01().gameObject:SetActive(false)
    end
end

---创建一个物体
function M:CreatGo(_Prefab,_Root)
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---重置兑换/购买跳转
function M:ReChangeBuyJump()
    ---兑换/购买跳转
    if self.CurItem.channel ~= "0" then
        ---创建兑换/购买渠道链接
    else

    end
end

---改变使用数量
function M:OnChangeCount(type)
    if type == 0 then
        self.CurUseCount = 1
    elseif type == 1 then
        self.CurUseCount = self.CurItem.count
    elseif type == 2 then
        local count = self.CurUseCount + 1
        self.CurUseCount = count > self.CurItem.count and self.CurUseCount or count
    elseif type == 3 then
        local count = self.CurUseCount - 1
        self.CurUseCount = count < 2 and 1 or count
    end
    --self.Btn_AddHighLight().gameObject:SetActive(self.CurUseCount < self.CurItem.count)
    --self.Btn_DecreaseHighLight().gameObject:SetActive(self.CurUseCount > 1)
    self.Btn_AddHighLight().gameObject:SetActive(true)
    self.Btn_DecreaseHighLight().gameObject:SetActive(true)
    self.ItemUseCountText().text = self.CurUseCount
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    if self.CloseCallback then
        self:CloseCallback()
    end
end

return M