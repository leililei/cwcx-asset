-- Code Auto Create Begin
local M = Class('ShopSkin_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ShopSkin_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ShopSkin_UI].prefab'
    self.Name = 'Form[ShopSkin_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'LihuiPanel','SkinPanel/LihuiPanel',2},{'LihuiSpinePanel','SkinPanel/LihuiPanel/LihuiSpinePanel',2},{'BgSprite','SkinPanel/LihuiPanel/BgSprite',2},{'FrontSprite','SkinPanel/LihuiPanel/FrontSprite',2},{'RoleSprite','SkinPanel/LihuiPanel/RoleSpritePanel/RoleSprite',2},{'ActorSwitch','SkinPanel/LihuiPanel/RoleSpritePanel/ActorSwitch',2},{'SkinName','SkinPanel/SkinName/SkinName',2},{'RoleNameBG','SkinPanel/SkinName/RoleNameBG',2},{'Time','SkinPanel/SkinName/Time',2},{'SkinFrame','SkinPanel/SkinFrame',2},{'BiaoqianPrefab','SkinPanel/SkinFrame/BiaoqianPrefab',2},{'BG','SkinPanel/SkinFrame/BiaoqianPrefab/BG',2},{'BiaoqianContent','SkinPanel/SkinFrame/BiaoqianContent',2},{'Img_Zuanshicon','SkinPanel/SkinFrame/Panel/Img_Zuanshicon',2},{'Panel','SkinPanel/SkinFrame/Panel/Text_Original/Panel',2},{'Btn_Buy','SkinPanel/SkinFrame/Btn_Buy',2},{'BottomPanel','SkinPanel/BottomPanel',2},{'content','SkinPanel/BottomPanel/SkinTeam/content',2},{'Img_Fenggexian','TopView/UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','TopView/UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','TopView/UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','TopView/UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','TopView/UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'Btn_ZuanShi','TopView/Huobi/Btn_ZuanShi',2},{'Btn_Add','TopView/Huobi/Btn_ZuanShi/Btn_Add',2},{'Img_Zuanshicon01','TopView/Huobi/Btn_ZuanShi/Img_Zuanshicon',2},
        -- UITemplate 列表
        {'SkinPrefab','SkinPanel/BottomPanel/SkinTeam/SkinPrefab',10},
        -- LoopScrollRect 列表
        {'SkinTeam','SkinPanel/BottomPanel/SkinTeam',18},
        -- TextMeshProUGUI 列表
        {'RoleNameTxt','SkinPanel/SkinName/RoleNameBG/RoleNameTxt',20},{'Text_Shengyushijian','SkinPanel/SkinName/Time/Text_Shengyushijian',20},{'Txt','SkinPanel/SkinFrame/BiaoqianPrefab/BG/Txt',20},{'Text_PriceNow','SkinPanel/SkinFrame/Panel/Text_PriceNow',20},{'Text_Original','SkinPanel/SkinFrame/Panel/Text_Original',20},{'Text_Buy','SkinPanel/SkinFrame/Btn_Buy/Text_Buy',20},{'Text_SkinShop_CN','TopView/UpperLeftPanel/Text_SkinShop/Text_SkinShop_CN',20},{'Text_SkinShop_EN','TopView/UpperLeftPanel/Text_SkinShop/Text_SkinShop_EN',20},{'Text_ZSCount','TopView/Huobi/Btn_ZuanShi/Text_ZSCount',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---分页按钮列表
    self.ChildBtnList = {}
    ---角色SpineObj
    self.CurSpineObj = nil
    self.CurFrontSpineObj = nil
    self.CurBgSpineObj = nil
    self.CurActorList = nil
    self.CurVoice = nil
    --- 当前选中的皮肤id
    self.chosenSkinId = 0
    
    --self.ChildLoopScroll01():SetLuaCellEvent(Handle(self,self.ShopLabel))
    self.SkinTeam():SetLuaCellEvent(Handle(self,self.SkinList))
    ---注册滑动列表选中通知
    self.SkinTeam():SetChooseEvent(Handle(self,self.SkinChosen))
    self.SkinTeam():SetUnchooseEvent(Handle(self,self.SkinUnchoose))
    ---注册帮助按钮
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(84)
    end))
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.Btn_Home().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self:DestroyLittleSpine()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    UIEvent.LuaClick(self.Btn_ZuanShi().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
        MgrLink.LinkStart("tz_sc_cz_01")
    end)
    --皮肤动画切换
    UIEvent.LuaClick(self.ActorSwitch().gameObject,function()
        if self.CurSpineObj and self.CurActorList then
            --动画展示
            SkinControl.ShowAnimate(self.CurSpineObj, self.CurBgSpineObj, self.CurFrontSpineObj)
        end
    end)
    -- UIEvent.LuaClick(self.SlideRight().gameObject,function()
    --     if self.skinIndex < #self.currentSkins - 2 then
    --         self.skinIndex = self.skinIndex + 1
    --         self:ScrollTo(self.skinIndex)
    --     end
    -- end)
    -- UIEvent.LuaClick(self.SlideLeft().gameObject,function()
    --     if self.skinIndex > 1 then
    --         self.skinIndex = self.skinIndex - 1
    --         self:ScrollTo(self.skinIndex)
    --     end
    -- end)
    UIEvent.LuaClick(self.Btn_Buy().gameObject,function()
                self.pData = self.currentSkins[self.skinIndex]
                ---为0表示没有解锁条件
                if self.pData.buyLimit ~= 0 then
                    ---如果此商品未解锁
                    if SysLockControl.CheckSysLock(self.pData.buyLimit) == false then
                        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(self.pData.buyLimit)})
                        return
                    end
                end
                if self.pData.isSellGroup then
                    local price = self.pData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
                    local data = ItemControl.GetItemByIdAndType(price.goodsID,price.goodsType)      --手中持有的货币数量
                    local pMax = math.floor(data.count / price.goodsNum)                        --最大可买数量
                    local bMax = self.pData.buyMaxCount - self.pData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
                    ---如果超过最大可买数量
                    if self.pData.buyMaxCount ~= 0 and self.pData.buyCount + 1 > self.pData.buyMaxCount then
                        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1"),1},true)
                        return
                    end
                    MgrUI.Pop(UID.BuyPop_UI,{self.pData,function(count)
                        ---没有货物数据或总价超出所持有的货币数
                        if data == nil or price.goodsNum * count >  data.count then
                            if data.id == 100008 then --只有是原初结晶才跳转到充值界面
                                MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips6"),data.name),Handle(self, function()
                                    MgrUI.GoBack()
                                    MgrLink.LinkStart("tz_sc_cz_01")
                                end),nil,2,Handle(self, function()
                                end)})
                            else
                                MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("shop_ui_buyfail1"),data.name)},true)
                            end
                            return
                        end
                        if self.pData.shopType == 400000 then
                        else
                            ShopViewModel.SendBuyGoods({self.pData.id,count},function()
                                HeroControl.ChangeSkinLockState(self.pData.id,true)
                                self:RefreshUI()
                            end)
                        end
                    end,1,bMax,true,pMax,function()
                    end},true)
                else
                    local price = self.pData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
                    if self.pData.sellType == 3 and not self.pData:IsDisCounting() then
                        price = self.pData:GetOriginal()
                    end
                    local data = ItemControl.GetItemByIdAndType(price.goodsID,price.goodsType)      --手中持有的货币数量
                    local bMax = self.pData.buyMaxCount - self.pData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
                    ---如果超过最大可买数量
                    if self.pData.buyMaxCount ~= 0 and self.pData.buyCount + 1 > self.pData.buyMaxCount then
                        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1"),1},true)
                        return
                    end
                    MgrUI.Pop(UID.BuyPop_UI,{self.pData,function(count)
                        ---没有货物数据或总价超出所持有的货币数
                        if data == nil or price.goodsNum >  data.count then
                            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("need_more_diamond"),Handle(self, function()
                                MgrUI.GoBack()
                                MgrLink.LinkStart("tz_sc_cz_01")
                            end),nil,2,Handle(self, function()
                            end)})
                            return
                        end
                        if self.pData.shopType == 400000 then
                        else
                            ShopViewModel.SendBuyGoods({self.pData.id,1},function()
                                HeroControl.ChangeSkinLockState(self.pData.id,true)
                                self:RefreshUI()
                            end)
                        end
                    end,1,bMax,false,nil,function()
                    end},true)
                end
            end)
    --隐藏标签预制
    self.BiaoqianPrefab().gameObject:SetActive(false)
    local trans = self.SkinFrame().transform:Find("Watch_UI")
    if trans then
        GameObject.Destroy(trans.gameObject)
    end
end

function M:OnUpdateUI()
    self.skinIndex = nil
    ---左边商店标签
    self.shopItemsList = ShopViewModel.SortChildData(10000)
    -- self.ChildLoopScroll01().totalCount = #self.shopItemsList
    -- self.ChildLoopScroll01():RefillCells()

    ---底部皮肤
    ---@type ShopItemData[]
    self.skins = {}
    for _, v in pairs(self.shopItemsList) do
        local tab = {}
        local index = 1
        --tab[#tab + 1] = {}
        --tab[#tab + 1] = {}
        for i, value in pairs(v.shopItems) do
            if Global.isMiddleTime(value.sellSTime, value.sellETime) then
                tab[index] = value
                index = index + 1
            end
        end
        table.sort(tab,function(a,b)
            if a.sortIdx < b.sortIdx then
                return true
            else
                return false
            end
        end)
        tab[#tab + 1] = {}
        tab[#tab + 1] = {}
        self.skins[v.id] = tab
    end
    ---每个toggle都注册事件
    for i, v in pairs(self.ChildBtnList) do
        Tools.ToggleValueChange(v,Handle(self,self.OnToggleClick),i)
    end
    ---默认队列
    self.currentSkins = self.skins[1000]
    self:RefreshUI()

    ---刷新顶部货币
    local coin = ItemControl.GetItemByIdAndType(100008, 1)
    MgrRes.LoadSprite(self.Img_Zuanshicon01(),coin.icon)
    self.Text_ZSCount().text = JNStrTool.numberAbbr(coin.count)
end

function M:ShopLabel(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.shopItemsList[idx],idx,self})
end

function M:SkinList(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.currentSkins[idx],idx,self, self.chosenSkinId}) 
end
function M:SkinChosen(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({true,Handle(self,self.UpdateSkin)})
end
function M:SkinUnchoose(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({false})
end

function M:OnToggleClick(isOn,idx)
    if isOn then
        self.currentSkins = self.skins[idx]
        self:RefreshUI()
        self.skinIndex = 1
    end
end

function M:RefreshUI()
    self.SkinTeam().totalCount = #self.currentSkins
    self.SkinTeam():RefillCells()
    self.SkinTeam():ScrollToCell(0,3000,1)

    ---刷新顶部货币
    local coin = ItemControl.GetItemByIdAndType(100008, 1)
    MgrRes.LoadSprite(self.Img_Zuanshicon01(),coin.icon)
    self.Text_ZSCount().text = JNStrTool.numberAbbr(coin.count)
end

function M:ScrollTo(idx)
    if idx - 2 < 0 then
        self.SkinTeam():ScrollToCell(0,3000,1)
    else
        self.SkinTeam():ScrollToCell(idx - 2,1000,idx)
    end
end

---@param skinData RoleSkinData
function M:UpdateSkin(skinData)
    self.chosenSkinId = skinData.id
    
    if self.CurSpineObj then
        GameObject.Destroy(self.CurSpineObj)
        self.CurSpineObj = nil
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    if self.CurBgSpineObj ~= nil then
        GameObject.Destroy(self.CurBgSpineObj)
        self.CurBgSpineObj = nil
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.CurFrontSpineObj ~= nil then
        GameObject.Destroy(self.CurFrontSpineObj)
        self.CurFrontSpineObj = nil
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    ---背景更换
    -- Tools.ClearAllChild(self.BgSprite().gameObject)
    if skinData.backgroundpic ~= "0" then
        self.Img_BG().gameObject:SetActive(false)
        if string.find(skinData.backgroundpic,'Watch_3D_bg') then
            local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate8,";")
            local x = tonumber(string.split(coordinate[1],",")[1])
            local y = tonumber(string.split(coordinate[1],",")[2])
            local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
            MgrRes.LoadCgSpine(self.BgSprite(), skinData.id,skinData.backgroundpic,x,y,scale,nil,function(BG)
                self.BGPath = MgrRes.GetLocalizedPath(skinData.backgroundpic)
                self.CurBgSpineObj = BG
                BG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder-3,"Default")
            end,true)
        else
            local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate8,";")
            local x = tonumber(string.split(coordinate[1],",")[1])
            local y = tonumber(string.split(coordinate[1],",")[2])
            local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
            MgrRes.LoadCgSpine(self.BgSprite(), skinData.id,skinData.backgroundpic,x,y,scale,MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].morning,function(BG)
                self.BGPath = MgrRes.GetLocalizedPath(skinData.backgroundpic)
                self.CurBgSpineObj = BG
                BG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder-3,"Default")
            end,false)
        end
    else
        self.Img_BG().gameObject:SetActive(true)
    end

    ---前景更换
    -- Tools.ClearAllChild(self.FrontSprite().gameObject)
    local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate9,";")
    local x = tonumber(string.split(coordinate[1],",")[1])
    local y = tonumber(string.split(coordinate[1],",")[2])
    local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
    MgrRes.LoadSkinFrontBG(skinData.type,self.FrontSprite(),skinData.foregroundpic,self.FrontSprite().gameObject,x,y,scale,nil,function(frontBG)
        self.FrontPath = MgrRes.GetLocalizedPath(skinData.foregroundpic)
        self.CurFrontSpineObj = frontBG
        frontBG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder - 1,"Default")
    end)
    ---roleSpine更换
    -- Tools.ClearAllChild(self.RoleSprite().gameObject)
    self:CreatSpine(self.RoleSprite().gameObject, skinData)
    ---名字
    --self.RoleNameTxt().text = skinData.skinName
    for k,v in pairs(self.currentSkins) do
        if v.id == skinData.id then
            MgrRes.LoadSprite(self.SkinName(),v.icon)
            break
        end
    end
    self.RoleNameTxt().text = HeroControl.GetRoleDataByID(skinData.roleId).name
    ---剩余时间
    local endTime
    ---@type ShopItemData
    local skinShopItemData
    for _, v in pairs(self.currentSkins) do
        if v.id == skinData.id then
            endTime = v.sellETime
            skinShopItemData = v
        end
    end
    if skinShopItemData == nil then
        self.SkinFrame().gameObject:SetActive(false)
        return
    end
    if skinShopItemData.sellType == 1 then
        if endTime then
            local days = Global.TimeToDays(endTime - Global.GetCurTime())
            if days > 0 then
                self.Time().gameObject:SetActive(true)
                self.Text_Shengyushijian().text = string.format(MgrLanguageData.GetLanguageByKey("shop_ui_tips5"),days)
            else
                self.Time().gameObject:SetActive(false)
            end
        else
            self.Time().gameObject:SetActive(false)
        end
    else
        self.Time().gameObject:SetActive(false)
    end

    ---创建小人立绘
    self:DestroyLittleSpine()

    --GameObject.Destroy(self.SkinFrame().transform:Find("live2D").gameObject)
    self:CreatFightSpine(self.SkinFrame().gameObject, skinData.id)

    ---原价还是折扣价
    local price
    local discount = false
    if skinShopItemData:IsDisCounting() then
        price = skinShopItemData.ladderPrice[0]
        -- 现在可能出现在折扣期却同价的情况
        discount = CheckTable(skinShopItemData.ladderPrice[0]).goodsNum ~= CheckTable(skinShopItemData.ladderOriginal[0]).goodsNum
        if not discount then
            Global.LogError(string.format("皮肤%s在折扣期间，但折扣为0", self.chosenSkinId))
        end
    else
        price = skinShopItemData.ladderOriginal[0]
        discount = false
    end
    
    ---货币
    local coin = ItemControl.GetItemByIdAndType(price.goodsID, price.goodsType)
    MgrRes.LoadSprite(self.Img_Zuanshicon(),coin.icon)

    self.Text_PriceNow().text = price.goodsNum
    if discount then
        self.Text_Original().gameObject:SetActive(true)
        self.Text_Original().text = skinShopItemData.ladderOriginal[0].goodsNum
    else
        self.Text_Original().gameObject:SetActive(false)
    end

    ---皮肤标签
    Tools.ClearAllChild(self.BiaoqianContent().gameObject)
    if #skinData.shopTag > 0 then
        self.BiaoqianContent().gameObject:SetActive(true)
        for k,v in pairs(skinData.shopTag) do
            local obj = GameObject.Instantiate(self.BiaoqianPrefab().gameObject,self.BiaoqianContent().transform,false)
            obj:SetActive(true)
            local txt_Name = CJNUIMgr.GetSunUseName(obj,"Txt").transform:GetComponent("TextMeshProUGUI")
            txt_Name.text = v
        end
    else
        self.BiaoqianContent().gameObject:SetActive(false)
    end
    MgrRes.UnLoadUnusedAssets(false)
end

---创建立绘
function M:CreatSpine(_Root, skinData,x,y,scale)
    if self.CurActorList~=nil then
        --暂停语音
        MgrSound.Stop(3)
    end
    
    local _skinId = skinData.id
    -- if skinData.backgroundpic ~= "0" then
    --     if string.find(skinData.backgroundpic,'Watch_3D_bg') then
            local _PosInfoTab = CharactercoordinatesLocalData.tab[_skinId].coordinate1
            local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
            local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])

            self.CurActorList = skinData.shopAni
            --设置简易动画数据
            SkinControl.SetSkinData(self.CurActorList,1)
            MgrRes.LoadWatch3DSpineInUI(_Root, _skinId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
                self.SpinePath = MgrRes.GetWatch3DSpinePath(_skinId)
                self.CurSpineObj = obj
                obj.transform.gameObject.layer = 5
                local ske = obj.transform:GetComponent("SkeletonAnimation")
                if ske then
                    ske:SetOrderLayer(self.CavOrder-2,"Default")
                end
            end)
    --     else
    --         local _PosInfoTab = CharactercoordinatesLocalData.tab[_skinId].coordinate1
    --         local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    --         local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    --         MgrRes.LoadWatchAuto(_Root, _skinId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
    --             self.SpineObj = obj
    --         end)
    --     end
    -- else
    --     local _PosInfoTab = CharactercoordinatesLocalData.tab[_skinId].coordinate11
    --     local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    --     local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    --     MgrRes.LoadWatchAuto(_Root, _skinId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), "idle",function(spine)
    --     end)
    -- end
end

function M:CloseOrOpenSpine(tOrf)
    --self.spine:SetActive(tOrf)
end

function M:CreatFightSpine(_Root, _skinId)
    MgrRes.LoadFightSpine(_Root, _skinId,42 ,-60,25,"dj",function(go)
        go.transform.gameObject.layer = 5
        self.fightSpinePath = MgrRes.GetFightSpinePath(_skinId)
        self.spine = go
        go:GetComponent("MeshRenderer").sortingLayerID = 0
        go:GetComponent("MeshRenderer").sortingOrder = self.CavOrder + 1
    end)
end

function M:CloseBuyBtn(tOrf)
    self.Btn_Buy().gameObject:SetActive(tOrf)
end

function M:DestroyLittleSpine()
    if self.spine ~= nil then
        GameObject.Destroy(self.spine)
        self.spine = nil
        if self.fightSpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.fightSpinePath)
            self.fightSpinePath = nil
        end
    end
    MgrRes.UnLoadUnusedAssets(false)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        --暂停语音
        MgrSound.Stop(3)
        MgrUI.GoBack()
    end
end
function M:OnClose()
    if self.CurSpineObj then
        GameObject.Destroy(self.CurSpineObj)
        self.CurSpineObj = nil
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    if self.CurBgSpineObj ~= nil then
        GameObject.Destroy(self.CurBgSpineObj)
        self.CurBgSpineObj = nil
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.CurFrontSpineObj ~= nil then
        GameObject.Destroy(self.CurFrontSpineObj)
        self.CurFrontSpineObj = nil
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    if self.spine ~= nil then
        GameObject.Destroy(self.spine)
        self.spine = nil
        if self.fightSpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.fightSpinePath)
            self.fightSpinePath = nil
        end
    end
    MgrRes.UnLoadUnusedAssets(true)
end
return M