-- Code Auto Create Begin
local M = Class('SummerShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SummerShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SummerShop_UI].prefab'
    self.Name = 'Form[SummerShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'UpperLeftBtnPanel','TopView/UpperLeftBtnPanel',2},{'Btn_Back','TopView/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','TopView/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','TopView/UpperLeftBtnPanel/Btn_Help',2},{'UpperRightPanel','TopView/UpperRightPanel',2},{'Cailiao1','TopView/UpperRightPanel/Cailiao1',2},{'Img_BG01','TopView/UpperRightPanel/Cailiao1/Img_BG',2},{'Icon1','TopView/UpperRightPanel/Cailiao1/Icon1',2},{'Cailiao2','TopView/UpperRightPanel/Cailiao2',2},{'Img_BG02','TopView/UpperRightPanel/Cailiao2/Img_BG',2},{'Icon2','TopView/UpperRightPanel/Cailiao2/Icon2',2},{'Panel','Panel',2},{'Role','Panel/Role',2},{'SpineRole','Panel/Role/SpineRole',2},{'RoleClickArea','Panel/Role/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','Panel/Role/Img_SoundTextBG',2},{'Shop','Panel/Shop',2},{'TitlePanel','Panel/Shop/TitlePanel',2},{'Qieyedian','Panel/Shop/TitlePanel/Qieyedian',2},{'Tog1','Panel/Shop/TitlePanel/Tog1',2},{'Img_Icon','Panel/Shop/TitlePanel/Tog1/Normal/Img_Icon',2},{'Img_Xuanzhongguang','Panel/Shop/TitlePanel/Tog1/Highlight/Img_Xuanzhongguang',2},{'Img_Icon01','Panel/Shop/TitlePanel/Tog1/Highlight/Img_Icon',2},{'Tog2','Panel/Shop/TitlePanel/Tog2',2},{'Img_Icon02','Panel/Shop/TitlePanel/Tog2/Normal/Img_Icon',2},{'Img_Xuanzhongguang01','Panel/Shop/TitlePanel/Tog2/Highlight/Img_Xuanzhongguang',2},{'Img_Icon03','Panel/Shop/TitlePanel/Tog2/Highlight/Img_Icon',2},{'Btn_Exchange','Panel/Shop/TitlePanel/Btn_Exchange',2},{'Img_Lock','Panel/Shop/TitlePanel/Btn_Exchange/Img_Lock',2},{'Img_Shopdi','Panel/Shop/Img_Shopdi',2},{'ShopGoodsItem','Panel/Shop/ShopItemScroll/ShopGoodsItem',2},
        -- UITemplate 列表
        {'ShopGoodsItem01','Panel/Shop/ShopItemScroll/ShopGoodsItem',10},
        -- Toggle 列表
        {'Tog101','Panel/Shop/TitlePanel/Tog1',13},{'Tog201','Panel/Shop/TitlePanel/Tog2',13},
        -- RawImage 列表
        {'ShopItemScroll','Panel/Shop/ShopItemScroll',15},{'Content','Panel/Shop/ShopItemScroll/Content',15},
        -- LoopScrollRect 列表
        {'ShopItemScroll01','Panel/Shop/ShopItemScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_EN',20},{'Text_Shu','TopView/UpperRightPanel/Cailiao1/Text_Shu',20},{'Text_Shu2','TopView/UpperRightPanel/Cailiao2/Text_Shu2',20},{'RoleVoiceWordText','Panel/Role/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_En','Panel/Shop/TitlePanel/Tog1/Normal/Text_En',20},{'Text_Cn','Panel/Shop/TitlePanel/Tog1/Normal/Text_Cn',20},{'Text_En01','Panel/Shop/TitlePanel/Tog1/Highlight/Text_En',20},{'Text_Cn01','Panel/Shop/TitlePanel/Tog1/Highlight/Text_Cn',20},{'Text_En02','Panel/Shop/TitlePanel/Tog2/Normal/Text_En',20},{'Text_Cn02','Panel/Shop/TitlePanel/Tog2/Normal/Text_Cn',20},{'Text_En03','Panel/Shop/TitlePanel/Tog2/Highlight/Text_En',20},{'Text_Cn03','Panel/Shop/TitlePanel/Tog2/Highlight/Text_Cn',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.curRoleId = 0
    local tSummerData = SummerControl.GetSummerData()
    for i, v in ipairs(tSummerData.shopType) do
        if self.curRoleId ~= v then
            self.curRoleId = ShoptypeLocalData.tab[v].npcid
            --添加音效
            MgrSound.AddCue("Audio/role/".. self.curRoleId..".acb")
        end
    end
    
    ---弹出引导帮助界面
    --ActiveTutorialControl.ForcePopGuide(4)
    self:InitScroll()   --初始化滑块
    self:InitButton()   --初始化按钮事件
    self:InitShopLock()  --初始化商店锁
    
    self:CreatSpine(self.SpineRole(),SummerControl.curShopType)
    ---背景音乐
    if tSummerData and tSummerData ~= "" then
        MgrSound.PlayBGM(tSummerData.music,0.2,nil,true)
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
---初始化按钮事件
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击退出
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)

    ---帮助界面
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        ActiveTutorialControl.OpenGuide(SummerControl.GetSummerData().group)
    end))

    ---点击第一个商店
    local tog1Normal = self.Tog101().gameObject.transform:Find("Normal").gameObject
    local tog1HL = self.Tog101().gameObject.transform:Find("Highlight").gameObject
    Tools.ToggleValueChange(self.Tog101(),function(isOn)
        tog1Normal:SetActive(not isOn)
        tog1HL:SetActive(isOn)
        if isOn then
            SummerControl.curShopType = 501
            self:RefreshCurShop(0)
            --self:GetCurWords(97)
        end
    end)

    ---点击第二个商店
    local tog2Normal = self.Tog201().gameObject.transform:Find("Normal").gameObject
    local tog2HL = self.Tog201().gameObject.transform:Find("Highlight").gameObject
    Tools.ToggleValueChange(self.Tog201(),function(isOn)
        tog2Normal:SetActive(not isOn)
        tog2HL:SetActive(isOn)
        if isOn then
            SummerControl.curShopType = 502
            self:RefreshCurShop(0)
            --self:GetCurWords(97)
        end
    end)

    ---点击角色播放语音
    UIEvent.LuaClick(self.RoleClickArea().gameObject,Handle(self,function()
        self:GetCurWords(97)
    end))
    ---页签遮罩
    UIEvent.LuaClick(self.Btn_Exchange().gameObject,function()
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_summerevent_text18"),1},true)
    end)
end

---初始化滑块
function M:InitScroll()
    self.ShopItemScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end

function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.shopItemList[idx],idx,self,function()
        self:GetCurWords(98)
    end })
end

---刷新商店道具
function M:RefreshCurShop(offset)
    self.shopData = SummerControl.GetShopData()
    self.shopItemList = {}
    ---取出对应商店类型的数据
    for k,v in pairs(self.shopData[SummerControl.curShopType]) do
        if v.buyCount == v.buyMaxCount then
            v.soldOut = 1
        else
            v.soldOut = 0
        end
        table.insert(self.shopItemList,v)
    end
    ---排序
    --Global.Sort(self.shopItemList,{"sortIdx"},false)
    table.sort(self.shopItemList,function(a,b)
        if a.soldOut > b.soldOut then
            return false
        elseif a.soldOut < b.soldOut then
            return true
        else
            return a.sortIdx < b.sortIdx
        end
    end)
    self.ShopItemScroll01().totalCount = #self.shopItemList
    if offset then
        self.ShopItemScroll01():RefillCells(offset)
    else
        self.ShopItemScroll01():RefreshCells()
    end
    self:RefreshMoney()  --刷新货币
end

---刷新货币
function M:RefreshMoney()
    local item1 = ItemControl.GetItemByIdAndType(200012,4)
    local item2 = ItemControl.GetItemByIdAndType(200013,4)
    MgrRes.LoadSprite(self.Icon1(),item1.icon)
    self.Text_Shu().text = item1.count
    MgrRes.LoadSprite(self.Icon2(),item2.icon)
    self.Text_Shu2().text = item2.count
end

---初始化商店锁
function M:InitShopLock()
    local shop1UnLock = true   --商店1是否解锁
    local shop2UnLock = true   --商店2是否解锁
    if shop1UnLock and not shop2UnLock then
        ---默认显示第一个
        self.Tog101().isOn = false
        self.Tog101().isOn = true
        self.Tog201().isOn = false
        local tog2Icon = self.Tog201().gameObject.transform:Find("Normal").gameObject.transform:Find("Img_Icon").gameObject
        tog2Icon:SetActive(false)
        self.Btn_Exchange().transform.localPosition = self.Tog201().transform.localPosition
        self.Btn_Exchange().gameObject:SetActive(true)
        SummerControl.curShopType = 501
    elseif shop2UnLock and not shop1UnLock then
        ---默认显示第二个
        self.Tog201().isOn = false
        self.Tog201().isOn = true
        self.Tog101().isOn = false
        local tog1Icon = self.Tog101().gameObject.transform:Find("Normal").gameObject.transform:Find("Img_Icon").gameObject
        tog1Icon:SetActive(false)
        self.Btn_Exchange().transform.localPosition = self.Tog101().transform.localPosition
        self.Btn_Exchange().gameObject:SetActive(true)
        SummerControl.curShopType = 502
    elseif shop1UnLock and shop2UnLock then
        ---默认显示第一个
        self.Tog101().isOn = false
        self.Tog101().isOn = true
        self.Tog201().isOn = false
        self.Btn_Exchange().gameObject:SetActive(false)
        SummerControl.curShopType = 501
    end

end

---创建立绘
function M:CreatSpine(_Root, _ShopType)
    local id = ShoptypeLocalData.tab[_ShopType].npcid
    local _PosInfoTab = CharactercoordinatesLocalData.tab[id].coordinate10
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatchAuto(_Root, id,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), "idle", function(obj)
        self.SpineObj = obj
    end)
    self:GetCurWords(97)
end

---获取当前台词
function M:GetCurWords(type)
    local _ActorLinesType = ShoptypeLocalData.tab[SummerControl.curShopType].npcid   --当前台词组别
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

    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,tostring(self.curRoleId))
    self:ListenVoice()
end

--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("SummerShopRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(self.curRoleId)) then
            self.Img_SoundTextBG().gameObject:SetActive(false)
            MgrTimer.Cancel("SummerShopRoleVoice")
        end
    end,-1,nil)
end

function M:OnHide()
    MgrTimer.Cancel("SummerShopRoleVoice")
    MgrSound.Stop(3, tostring(self.curRoleId), false)
end

function M:OnClose()
    MgrTimer.Cancel("SummerShopRoleVoice")
    MgrSound.Stop(3, tostring(self.curRoleId), false)
end

return M