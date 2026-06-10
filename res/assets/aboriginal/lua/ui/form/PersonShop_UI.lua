-- Code Auto Create Begin
local M = Class('PersonShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PersonShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PersonShop_UI].prefab'
    self.Name = 'Form[PersonShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Role','Role',2},{'SpineRole','Role/SpineRole',2},{'RoleClickArea','Role/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','Role/Img_SoundTextBG',2},{'UI_Canvas','UI_Canvas',2},{'SpecialPanel','UI_Canvas/SpecialPanel',2},{'SpecialScroll','UI_Canvas/SpecialPanel/SpecialScroll',2},{'SpecialItem','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem',2},{'Img_Star_L','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/Img_Star_L',2},{'Img_Star_R','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/Img_Star_R',2},{'Img_Line','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/Img_Line',2},{'BagItem','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/BagItem',2},{'RewardRankImg','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/BagItem/RewardRankImg',2},{'RewardIconImg','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/BagItem/RewardIconImg',2},{'Mask','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/BagItem/Mask',2},{'TextBg','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/BagItem/Mask/TextBg',2},{'Content','UI_Canvas/SpecialPanel/SpecialScroll/Content',2},{'UpperRightPanel','UI_Canvas/RightPanel/UpperRightPanel',2},{'Huobi','UI_Canvas/RightPanel/UpperRightPanel/Huobi',2},{'Img_BG','UI_Canvas/RightPanel/UpperRightPanel/Huobi/Img_BG',2},{'CurrencyIcon','UI_Canvas/RightPanel/UpperRightPanel/Huobi/CurrencyIcon',2},{'Niudanji','UI_Canvas/RightPanel/Niudanji',2},{'Img_Niudanji','UI_Canvas/RightPanel/Niudanji/Img_Niudanji',2},{'NiudanjiBianhao','UI_Canvas/RightPanel/Niudanji/Img_Niudanji/NiudanjiBianhao',2},{'Btn_Chou1ci','UI_Canvas/RightPanel/Niudanji/Btn_Chou1ci',2},{'Btn_Chou10ci','UI_Canvas/RightPanel/Niudanji/Btn_Chou10ci',2},{'Btn_SellOut','UI_Canvas/RightPanel/Niudanji/Btn_SellOut',2},{'Btn_Xiayige','UI_Canvas/RightPanel/Niudanji/Btn_Xiayige',2},{'Btn_GashaponDetails','UI_Canvas/RightPanel/Niudanji/Btn_GashaponDetails',2},{'NiudanjiXiangqing','UI_Canvas/RightPanel/NiudanjiXiangqing',2},{'Img_Niudanji_hei','UI_Canvas/RightPanel/NiudanjiXiangqing/Img_Niudanji_hei',2},{'NiudanjiTab','UI_Canvas/RightPanel/NiudanjiXiangqing/Img_Niudanji_hei/NiudanjiTab',2},{'Img_Mask','UI_Canvas/RightPanel/NiudanjiXiangqing/Img_Mask',2},{'NiudanReward','UI_Canvas/RightPanel/NiudanjiXiangqing/ShopItemScroll/NiudanReward',2},{'Btn_Close','UI_Canvas/RightPanel/NiudanjiXiangqing/Btn_Close',2},{'Img_Close','UI_Canvas/RightPanel/NiudanjiXiangqing/Btn_Close/Img_Close',2},{'ReturnBg','UI_Canvas/ReturnBg',2},{'Btn_GoMenu','UI_Canvas/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UI_Canvas/ReturnBg/Btn_Back',2},{'Btn_Help','UI_Canvas/ReturnBg/Btn_Help',2},{'Img_Fenggexian','UI_Canvas/ReturnBg/Img_Fenggexian',2},{'Ball','UI_Canvas/Ball',2},{'UnClickBg','UI_Canvas/UnClickBg',2},{'neon','UI_Canvas/neon',2},{'white','UI_Canvas/white',2},
        -- Text 列表
        {'Text_CurrencyCount','UI_Canvas/RightPanel/UpperRightPanel/Huobi/Text_CurrencyCount',3},
        -- UITemplate 列表
        {'NiudanReward01','UI_Canvas/RightPanel/NiudanjiXiangqing/ShopItemScroll/NiudanReward',10},
        -- RawImage 列表
        {'ShopItemScroll','UI_Canvas/RightPanel/NiudanjiXiangqing/ShopItemScroll',15},{'Content01','UI_Canvas/RightPanel/NiudanjiXiangqing/ShopItemScroll/Content',15},
        -- LoopScrollRect 列表
        {'SpecialScroll01','UI_Canvas/SpecialPanel/SpecialScroll',18},{'ShopItemScroll01','UI_Canvas/RightPanel/NiudanjiXiangqing/ShopItemScroll',18},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','Role/Img_SoundTextBG/RoleVoiceWordText',20},{'ItemText','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/ItemText',20},{'MaskText','UI_Canvas/SpecialPanel/SpecialScroll/SpecialItem/BagItem/Mask/MaskText',20},{'Text_shuliang','UI_Canvas/RightPanel/Niudanji/Btn_Chou1ci/Text_shuliang',20},{'Text_xiaohao','UI_Canvas/RightPanel/Niudanji/Btn_Chou1ci/Text_xiaohao',20},{'Text_TenDraw','UI_Canvas/RightPanel/Niudanji/Btn_Chou10ci/Text_TenDraw',20},{'Text_TebDrawPrice','UI_Canvas/RightPanel/Niudanji/Btn_Chou10ci/Text_TebDrawPrice',20},{'Text_Title_CN','UI_Canvas/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UI_Canvas/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --初始化按钮
    self:InitBtn()
    --注册滑动
    self.ShopItemScroll01():SetLuaCellEvent(Handle(self, self.ItemCell))
    self.SpecialScroll01():SetLuaCellEvent(Handle(self, self.ShowSpecail))
    --UI
    self.NiudanjiXiangqing().gameObject:SetActive(false)
    self.NiudanReward().gameObject:SetActive(false)
    self.Btn_Help().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
    self.neon().gameObject:SetActive(false)
    self.white().gameObject:SetActive(false)
    
    self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt3")
    self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt16")
    self.SpecialItems = PersonStoryControl.GetSpecialItemList()
    
    --红点
    self:CheckRedPoint()
    --活动数据
    self.PersonData = PersonStoryControl.GetPersonData()
    --所有扭蛋池数据
    self.PoolList = PersonStoryControl.GetShopList()
    --默认显示商店
    self:RefreshShop()

    MgrSound.Stop(3)
end

---注册按钮事件
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --点击返回上一级
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    --点击返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        PersonStoryControl.InPerson = false
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.PersonData.group)
    end)
    --点击详情
    UIEvent.LuaClick(self.Btn_GashaponDetails().gameObject,function()
        self.Niudanji().gameObject:SetActive(false)
        self.NiudanjiXiangqing().gameObject:SetActive(true)
        self:ReloadDetail(0)
    end)
    --关闭详情
    UIEvent.LuaClick(self.Btn_Close().gameObject,function()
        self.Niudanji().gameObject:SetActive(true)
        self.NiudanjiXiangqing().gameObject:SetActive(false)
    end)
    --单抽一次
    UIEvent.LuaClick(self.Btn_Chou1ci().gameObject,function()
        local curPool = PersonStoryControl.GetCurShop()
        local money = curPool:GetCurrencyData()
        local price = tonumber(string.split(curPool.price,"_")[3])
        if money.count >= price then  --如果货币足够
            PersonStoryControl.Lottery(curPool.actId,curPool.id,1,function()
                self:ShowEffect()
                self:RefreshShop()
                self:GetCurWords(98)
                self:CheckRedPoint()
            end)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
        end
    end)
    --抽多次
    UIEvent.LuaClick(self.Btn_Chou10ci().gameObject,function()
        local curPool = PersonStoryControl.GetCurShop()
        local money = curPool:GetCurrencyData()
        local price = tonumber(string.split(curPool.price,"_")[3])
        local remainingCount = PersonStoryControl.GetPoolItemsCount()      --卡池剩余物品数量
        local count = curPool.type == 1 and 50 or 100   --类型是1的 抽50次，类型是2的抽100次
        local coin = ItemControl.GetItemByIdAndType(tonumber(string.split(curPool.price,"_")[2]),tonumber(string.split(curPool.price,"_")[1]))    --货币数据
        local canBuyCount = math.floor(coin.count / price)   --可购买的数量
        --池子里还有足够的物品
        if remainingCount >= count then
            --如果货币足够
            if money.count >= price * count then
                PersonStoryControl.Lottery(curPool.actId,curPool.id,count,function()
                    self:ShowEffect()
                    self:RefreshShop()
                    self:GetCurWords(98)
                    self:CheckRedPoint()
                end)
            else
                --抽取可抽取的次数
                if canBuyCount < 1 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
                else
                    --抽可抽的次数
                    PersonStoryControl.Lottery(curPool.actId,curPool.id,canBuyCount,function()
                        self:ShowEffect()
                        self:RefreshShop()
                        self:GetCurWords(98)
                        self:CheckRedPoint()
                    end)
                end
            end
        else
            --如果货币足够
            if money.count >= price * remainingCount then
                --抽完卡池剩余物品
                PersonStoryControl.Lottery(curPool.actId,curPool.id,remainingCount,function()
                    self:ShowEffect()
                    self:RefreshShop()
                    self:GetCurWords(98)
                    self:CheckRedPoint()
                end)
            else
                if canBuyCount < 1 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
                else
                    --抽可抽的次数
                    PersonStoryControl.Lottery(curPool.actId,curPool.id,canBuyCount,function()
                        self:ShowEffect()
                        self:RefreshShop()
                        self:GetCurWords(98)
                        self:CheckRedPoint()
                    end)
                end
            end
        end
    end)
    --下一个卡池
    UIEvent.LuaClick(self.Btn_Xiayige().gameObject,function()
        local curPool = PersonStoryControl.GetCurShop()
        if curPool.type == 1 then  --普通池
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_externalevent_txt18"),function()
                --特殊物品是否抽出
                if PersonStoryControl.CheckSpecialItemSellOut() then
                    PersonStoryControl.GameUp(curPool.actId,curPool.nextId,function()
                        self:RefreshShop()
                    end)
                else
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey(""),1},true)
                end
            end,nil,2 },true)
        else
            --特殊池
            if PersonStoryControl.GetPoolItemsCount() > 0 then  --池子还有物品
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey(""),1},true)
                return
            end
            PersonStoryControl.PoolReset(curPool.actId,curPool.id,function()
                self:RefreshShop()
            end)
        end
    end)
   
    --点击角色播放语音
    UIEvent.LuaClick(self.RoleClickArea().gameObject,Handle(self,function()
        self:GetCurWords(97)
    end))
end

---刷新商店
function M:RefreshShop()
    local curPool = PersonStoryControl.GetCurShop()
    if curPool == nil then
        return
    end
    MgrRes.LoadSprite(self.NiudanjiBianhao(),curPool.labelPic)  --蛋机标签图
    local remainingCount = PersonStoryControl.GetPoolItemsCount()      --卡池剩余物品数量
    if remainingCount <= 0 then
        --当前卡池已售罄
        self.Btn_Chou1ci().gameObject:SetActive(false)
        self.Btn_Chou10ci().gameObject:SetActive(false)
        --self.Btn_SellOut().gameObject:SetActive(true)
    else
        self.Btn_Chou1ci().gameObject:SetActive(true)
        self.Btn_Chou10ci().gameObject:SetActive(true)
        --self.Btn_SellOut().gameObject:SetActive(false)
    end
    --多次抽取根据卡池数量显示文本
    local count = curPool.type == 1 and 50 or 100
    local price = tonumber(string.split(curPool.price,"_")[3])
    local item = ItemControl.GetItemByIdAndType(tonumber(string.split(curPool.price,"_")[2]),tonumber(string.split(curPool.price,"_")[1]))
    --剩余大于数量
    if remainingCount >= count then
        if item.count >= count * price then
            self.Text_TenDraw().text = count
            self.Text_TebDrawPrice().text = price * count
        else
            --显示可购买的数量
            local canBuyCount = math.floor(item.count / price)
            if canBuyCount < 1 then
                self.Text_TenDraw().text = 1
                self.Text_TebDrawPrice().text = 1 * price
            else
                self.Text_TenDraw().text = canBuyCount
                self.Text_TebDrawPrice().text = canBuyCount * price
            end
        end
    else
        --判断货币是否充足
        if item.count >= remainingCount * price then
            self.Text_TenDraw().text = remainingCount
            self.Text_TebDrawPrice().text = remainingCount * price
        else
            --显示可购买的数量
            local canBuyCount = math.floor(item.count / price)
            if canBuyCount < 1 then
                self.Text_TenDraw().text = 1
                self.Text_TebDrawPrice().text = 1 * price
            else
                self.Text_TenDraw().text = canBuyCount
                self.Text_TebDrawPrice().text = canBuyCount * price
            end
        end
    end
    --下一个蛋池按钮出现条件
    if curPool.type == 1 then
        local isSellOut = PersonStoryControl.CheckSpecialItemSellOut()
        self.Btn_Xiayige().gameObject:SetActive(isSellOut)
        --if isSellOut then
            self.SpecialScroll01():RefreshCells()
            self:RefreshSpecial(curPool)
        --end
    else
        self.Btn_Xiayige().gameObject:SetActive(remainingCount <= 0)
    end
    --刷新货币
    self:RefreshCurrency()
end

function M:ItemCell(trans,idx)
    local isSpecial = false
    for k,v in pairs(PersonStoryControl.GetSpecialItemList()) do
        if v.id == self.PoolList[idx].item.id then
            isSpecial = true
            break
        end
    end
    trans:GetComponent("UITemplate"):SetData({self.PoolList[idx], self, isSpecial})
end

---加载商店详情
function M:ReloadDetail(offset)
    self.PoolList = PersonStoryControl.GetClientPoolItems()
    MgrRes.LoadSprite(self.NiudanjiTab(),PersonStoryControl.GetCurShop().tabPic)  --蛋机预览底图
    self.ShopItemScroll01().totalCount = #self.PoolList
    if offset then
        self.ShopItemScroll01():RefillCells(offset)
    else
        self.ShopItemScroll01():RefreshCells()
    end
end

function M:OnShowFinish()
    local curPool = PersonStoryControl.GetCurShop()
    --刷新特殊奖品
    self:RefreshSpecial(curPool)    
end
---刷新特殊奖品
function M:RefreshSpecial(curPool)
    local idx = 0
    for i, v in ipairs(self.PoolList) do
        if curPool.id == v.id then
            idx = i - 1
            break
        end
    end
    self.SpecialScroll01():ScrollToCell(idx,3000)
end

---刷新货币
function M:RefreshCurrency()
    ---@type ItemData
    local data = PersonStoryControl.GetCurShop():GetCurrencyData()
    MgrRes.LoadSprite(self.CurrencyIcon(),data.icon)
    self.Text_CurrencyCount().text = data.count
end

---检查红点
function M:CheckRedPoint()
    --self.CollectionRedPoint().gameObject:SetActive(RedDotControl.GetDotData("Event4Award"):GetCurDotState())
end

---創建spine 类型1扭蛋机类型2收藏品
function M:CreatSpine(_Root,_type)
    --销毁spine
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
    end
    if #self.PersonData.npc == 0 then
        UnityEngine.DebugEx.Log("个人剧情商店未配置NPC")
    end
    self.groupId = self.PersonData.npc[_type]
    local _PosInfoTab = CharactercoordinatesLocalData.tab[self.groupId].coordinate10
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatch3DSpineInUI(_Root, self.groupId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        self.SpineObj = obj
        obj.transform.gameObject.layer = 5
    end)
    self:GetCurWords(97)
end

---获取当前台词
function M:GetCurWords(type)
    local _ActorLinesType = self.groupId  --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == _ActorLinesType and value[3] == type then
            if value[5] == "0" then
                _CurTotalSumWeight = _CurTotalSumWeight + 10
                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
            else
                ---切割对应的触发条件得到条件表
                local _TempVarTab = JNStrTool.strSplit("_", value[5])
                local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab, 0)
                if _ReturnVar ~= false then
                    _CurTotalSumWeight = _CurTotalSumWeight + (tonumber(_ReturnVar) * 1000)
                    table.insert(_tempActorLineIdTab, { value[1], _CurTotalSumWeight })
                end
            end
        end
    end
    local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight, _tempActorLineIdTab)
    self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
end

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function M:PlayTargetRoleAniVoice(_ActorLineId)
    if _ActorLineId == nil then
        return
    end
    local _AniName = ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _ActorLineWord = ActorLinesLocalData.tab[_ActorLineId][7]

    if self.SpineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj, _AniName, true)
    end
    ---设置文本框文本
    self.RoleVoiceWordText().text = _ActorLineWord
    self.Img_SoundTextBG().gameObject:SetActive(true)

    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,tostring(self.groupId))
    self:ListenVoice()
end

--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("Event4ShopRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(self.groupId)) then
            self.Img_SoundTextBG().gameObject:SetActive(false)
            MgrTimer.Cancel("Event4ShopRoleVoice")
        end
    end,-1,nil)
end

function M:ShowEffect()
    local count = 0
    self.UnClickBg().gameObject:SetActive(true)
    MgrTimer.AddRepeat("loop",0.1,function()
        count = count + 0.1
        if count >= 0.7 and count < 0.8 then
            if PersonStoryControl.GetContainsSpecial() then
                self.neon().gameObject:SetActive(true)
            else
                self.white().gameObject:SetActive(true)
            end
        end
        if count >= 0.8 then
            --ani:SetBool("Show",false)
            self.neon().gameObject:SetActive(false)
            self.white().gameObject:SetActive(false)
            MgrTimer.AddDelayNoName(0.1,function()
                Event.Go("Event4ShopAwardPop")
            end,self.ObjRoot)
            self.UnClickBg().gameObject:SetActive(false)
            MgrTimer.Cancel("loop")
        end
    end,-1,self.ObjRoot)
end

---翻页特性
function M:PageTurn(callBack)
    Tools.DoGroupFade(self.Food().gameObject.transform:GetComponent("CanvasGroup"),0,0,0,2,false,0,0)
    Tools.DoGroupFade(self.Food().gameObject.transform:GetComponent("CanvasGroup"),1,1,1,2,false,0,0)
    self.Jindu().gameObject:SetActive(false)
    self.CaiDan_All().gameObject:SetActive(true)
    if callBack then
        callBack()
    end
    MgrTimer.AddDelayNoName(1.3,function()
        self.Jindu().gameObject:SetActive(true)
    end,self.ObjRoot)
end

function M:OnUpdateUI()
    --摄像机改为正交
    MgrUI.GetUICamera().orthographic = true
    --设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 2
    --创建spine
    self:CreatSpine(self.SpineRole(),EventRaidControl.NpcType.EggToys)
    --更新特殊道具
    self.SpecialScroll01().totalCount = #self.SpecialItems
    self.SpecialScroll01():RefillCells()
end
---特殊道具列表
function M:ShowSpecail(trans, idx)
    local tLine = trans:Find("Img_Line")
    local tItem = trans:Find("BagItem")
    local tItemText = CJNUIMgr.GetSunUseName(trans.gameObject, "ItemText"):GetComponent("TextMeshProUGUI")
    local tItemFrame = CJNUIMgr.GetSunUseName(tItem.gameObject, "RewardRankImg"):GetComponent("Image")
    local tItemIcon = CJNUIMgr.GetSunUseName(tItem.gameObject, "RewardIconImg"):GetComponent("Image")
    local tMask = CJNUIMgr.GetSunUseName(tItem.gameObject, "Mask")

    if idx >= #self.SpecialItems then
        tLine.gameObject:SetActive(false)
    else
        tLine.gameObject:SetActive(true)
    end
    local tItemData = self.SpecialItems[idx]
    --设置品质框
    MgrRes.LoadSprite(tItemFrame,tItemData.iconFrame)
    --设置图标
    MgrRes.LoadSprite(tItemIcon,tItemData.icon)
    --遮罩-以获得
    tMask.gameObject:SetActive(tItemData.count > 0)
    
    tItemText.text = string.format(MgrLanguageData.GetLanguageByKey("newcomeactivities_ui_stage"),idx)
    --道具详情
    UIEvent.LuaClick(tItem.gameObject,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{tItemData, false, function() end},true)
    end)
end

function M:OnHide()
    MgrTimer.Cancel("Event4ShopRoleVoice")
    MgrTimer.Cancel("loop")
    MgrSound.Stop(3, tostring(self.groupId), false)

    MgrUI.GetUICamera().orthographic = false
end

function M:OnClose()
    MgrTimer.Cancel("Event4ShopRoleVoice")
    MgrTimer.Cancel("loop")
    MgrSound.Stop(3, tostring(self.groupId), false)

    MgrUI.GetUICamera().orthographic = false
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M