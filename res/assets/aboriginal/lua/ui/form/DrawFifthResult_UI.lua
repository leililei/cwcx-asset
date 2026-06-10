-- Code Auto Create Begin
local M = Class('DrawFifthResult_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DrawFifthResult_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DrawFifthResult_UI].prefab'
    self.Name = 'Form[DrawFifthResult_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 8
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_ClickBack','Btn_ClickBack',2},{'BackGroundPanel','BackGroundPanel',2},{'BottomParticle','BackGroundPanel/BottomParticle',2},{'di','BackGroundPanel/di',2},{'Img_Xian','BackGroundPanel/Img_Xian',2},{'liuguang','BackGroundPanel/liuguang',2},{'ItemCardPrefab','ItemCardPrefab',2},{'guang1','ItemCardPrefab/SRLightPanel/guang1',2},{'zi','ItemCardPrefab/SRLightPanel/zi',2},{'guang2','ItemCardPrefab/SSRLightPanel/guang2',2},{'huang','ItemCardPrefab/SSRLightPanel/huang',2},{'ItemRankBgImg','ItemCardPrefab/ItemRankBgImg',2},{'ItemIconImg','ItemCardPrefab/ItemRankBgImg/ItemIconImg',2},{'BrisIconImg','ItemCardPrefab/ItemRankBgImg/BrisIconImg',2},{'ItemRankKuangImg','ItemCardPrefab/ItemRankKuangImg',2},{'SRLight','ItemCardPrefab/SRLight',2},{'SSRLight','ItemCardPrefab/SSRLight',2},{'RoleCardPrefab','RoleCardPrefab',2},{'guang101','RoleCardPrefab/SRLightPanel/guang1',2},{'zi01','RoleCardPrefab/SRLightPanel/zi',2},{'guang201','RoleCardPrefab/SSRLightPanel/guang2',2},{'huang01','RoleCardPrefab/SSRLightPanel/huang',2},{'RoleRankBgImg','RoleCardPrefab/RoleRankBgImg',2},{'RoleLihuiImg','RoleCardPrefab/RoleRankBgImg/RoleLihuiImg',2},{'yiyongyouzhezhao','RoleCardPrefab/RoleRankBgImg/RepeatPanel/yiyongyouzhezhao',2},{'daojukuang','RoleCardPrefab/RoleRankBgImg/RepeatPanel/daojukuang',2},{'RolePuzzleIcon','RoleCardPrefab/RoleRankBgImg/RepeatPanel/RolePuzzleIcon',2},{'StarPrefab','RoleCardPrefab/StarPrefab',2},{'RoleStarPanel','RoleCardPrefab/RoleStarPanel',2},{'RoleRankKuangImg','RoleCardPrefab/RoleRankKuangImg',2},{'SRLight01','RoleCardPrefab/SRLight',2},{'SSRLight01','RoleCardPrefab/SSRLight',2},{'RoleCardPanel','RoleCardPanel',2},{'Btns','Btns',2},{'Btn_Confirm','Btns/Btn_Confirm',2},{'Btn_Cutpage(Selected)','Btns/Btn_Confirm/Btn_Cutpage(Selected)',2},{'Btn_Again','Btns/Btn_Again',2},{'Btn_Cutpage(Selected)01','Btns/Btn_Again/Btn_Cutpage(Selected)',2},{'CardDrawVideoRT','CardDrawVideoRT',2},{'Btn_Goahead','CardDrawVideoRT/Btn_Goahead',2},{'ChouKaVFXObj','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj',2},{'di01','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di',2},{'di2','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di2',2},{'locked','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/locked',2},{'Image','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/Image',2},{'quan','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan',2},{'quan2','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan2',2},{'shizi','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/shizi',2},{'UnClickBg','UnClickBg',2},{'Btn_SkipPanel','Btn_SkipPanel',2},{'Btn_Skip','Btn_SkipPanel/Btn_Skip',2},{'Img_Skip_Icon','Btn_SkipPanel/Btn_Skip/Img_Skip_Icon',2},
        -- TextMeshProUGUI 列表
        {'Text_ItemName','ItemCardPrefab/Text_ItemName',20},{'Text_ItemShuliang','ItemCardPrefab/Text_ItemShuliang',20},{'RolePuzzleCountText','RoleCardPrefab/RoleRankBgImg/RepeatPanel/RolePuzzleCountText',20},{'Text_RoleName','RoleCardPrefab/Text_RoleName',20},{'Text_title','Btns/Btn_Confirm/Text_title',20},{'Text_Againtitle','Btns/Btn_Again/Text_Againtitle',20},{'Text_Skip','Btn_SkipPanel/Btn_Skip/Text_Skip',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --初始化按钮
    self:InitBtn()
    self:BottomParticle().gameObject:SetActive(true)
    --隐藏预制
    self.RoleCardPrefab().gameObject:SetActive(false)
    self.ItemCardPrefab().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
    self.Btn_Goahead().gameObject:SetActive(false)
    self.Btn_SkipPanel().gameObject:SetActive(false)
    --刷新抽卡结果
    self:RefreshResult()
end

function M:InitBtn()
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        NormalCardDrawViewModel.BackToCardDrawUI()
    end)

    UIEvent.LuaClick(self.Btn_Again().gameObject,function()
        self:BottomParticle().gameObject:SetActive(false)  --隐藏特效
        local drawData = CardDrawControl.GetDataById(NormalCardDrawViewModel.CurRecruit)
        if 1 == NormalCardDrawViewModel.GetDrawType() then
            if NormalCardDrawViewModel.CountType == 0 then
                self:OnBtnAgainClicked(drawData.id, drawData.singleDrawPrice, 1, 1);
            elseif NormalCardDrawViewModel.CountType == 1 then
                self:OnBtnAgainClicked(drawData.id, drawData.fiveDrawPrice, 5, 1);
            end
        else
            if NormalCardDrawViewModel.CountType == 0 then
                self:OnBtnAgainClicked(drawData.id, drawData.normalDrawPrice, 1, 2);
            elseif NormalCardDrawViewModel.CountType == 1 then
                self:OnBtnAgainClicked(drawData.id, drawData.tenNormalDrawPrice, 5, 2);
            end
        end
    end)

    ---点击抽卡
    UIEvent.LuaClick(self.Btn_Goahead().gameObject,Handle(self, function()
        if self.isBeganClick  then
            local animaitor = self.ChouKaVFXObj().gameObject.transform:GetComponent("Animator")
            local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
            animaitor:SetBool("END",true)
            criUI:Pause(false)
            self.isBeganClick = false
            MgrSound.PlayEffect("draw_character_2",nil,nil,false)
        end
    end))
    ---点击跳过
    UIEvent.LuaClick(self.Btn_SkipPanel().gameObject, Handle(self, function()
        MgrTimer.Reset()
        self:StopCardDrawVideo()
        NormalCardDrawViewModel.PopAllBadges(function()
            self:ReloadForNewCards()
        end)
    end))
end

function M:OnBtnAgainClicked(id, priceStr, count, drawType)
    local priceInfo = ItemControl.ParsePriceString(priceStr);
    if priceInfo.item.count >= priceInfo.price then
        CardDrawControl.LightDarkRecruitREQ(id, count, false, Handle(self, self.LightDarkRecruitNTF), drawType);
    else
        NormalCardDrawViewModel.ActionOnLackTicket(priceInfo.item, count, function()
            CardDrawControl.LightDarkRecruitREQ(id, count,false, Handle(self, self.LightDarkRecruitNTF), drawType);
        end)
    end
end

function M:RefreshResult()
    Tools.ClearAllChild(self.RoleCardPanel().gameObject)
    --角色
    if next(NormalCardDrawViewModel.HeroList) then
        for k,v in pairs(NormalCardDrawViewModel.HeroList) do
            local _RoleId = v[1]
            local _InfoTab = RoleattributeLocalData.tab[_RoleId]
            local _RoleCardObj = GameObject.Instantiate(self.RoleCardPrefab().gameObject,self.RoleCardPanel().transform)
            _RoleCardObj:SetActive(true)
            local _SSRLightPanel = CJNUIMgr.GetSunUseName(_RoleCardObj,"SSRLightPanel")
            local _SSRLight = CJNUIMgr.GetSunUseName(_RoleCardObj,"SSRLight")
            local _SRLightPanel = CJNUIMgr.GetSunUseName(_RoleCardObj,"SRLightPanel")
            local _RoleRankBgImg = CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleRankBgImg")
            local _RoleRankKuangImg = CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleRankKuangImg")
            local _RoleLihuiImg = CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleLihuiImg")
            local _RepeatPanel = CJNUIMgr.GetSunUseName(_RoleCardObj,"RepeatPanel")
            local _RolePuzzleIcon = CJNUIMgr.GetSunUseName(_RoleCardObj,"RolePuzzleIcon")
            local _RolePuzzleCountText = CJNUIMgr.GetSunUseName(_RoleCardObj,"RolePuzzleCountText")
            local _RoleStarPanel = CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleStarPanel")
            local _StarPrefab = CJNUIMgr.GetSunUseName(_RoleCardObj,"StarPrefab")
            local name = CJNUIMgr.GetSunUseName(_RoleCardObj,"Text_RoleName").transform:GetComponent("TextMeshProUGUI")
            _StarPrefab:SetActive(false)
            if v[2] == 1 then
                -- 已经拥有
                _RepeatPanel:SetActive(true)
                local RepeatRewardTab=JNStrTool.strSplit("_", _InfoTab[53])
                ---@type ItemData
                local item = ItemControl.GetItemByType(1,tonumber(RepeatRewardTab[2]))
                MgrRes.LoadSprite(_RolePuzzleIcon:GetComponent("Image"),"Item/"..item.icon)
                _RolePuzzleCountText:GetComponent("TextMeshProUGUI").text=RepeatRewardTab[3]
            else
                _RepeatPanel:SetActive(false)
            end
            self:InitStar(_RoleStarPanel,_StarPrefab,tonumber(_InfoTab[21]))
            MgrRes.LoadLongIcon(_RoleLihuiImg:GetComponent("Image"),_RoleId)
            MgrRes.LoadSprite(_RoleRankBgImg:GetComponent("Image"),"Quality/RoleRankBg_".._InfoTab[6])
            MgrRes.LoadSprite(_RoleRankKuangImg:GetComponent("Image"),"Quality/RoleRankKuang_".._InfoTab[6])
            name.text = _InfoTab[2]
            if _InfoTab[6] == 4 then
                _SSRLightPanel:SetActive(true)
                _SSRLight:SetActive(true)
                _SRLightPanel:SetActive(false)
            elseif _InfoTab[6] == 3 then
                _SSRLightPanel:SetActive(false)
                _SSRLight:SetActive(false)
                _SRLightPanel:SetActive(true)
            else
                _SSRLightPanel:SetActive(false)
                _SSRLight:SetActive(false)
                _SRLightPanel:SetActive(false)
            end
            UIEvent.LuaClick(_RoleCardObj,function()
                IllustrationViewModel.OpenRoleXiangqing(_RoleId)
            end)
        end
    end
    --装备
    if next(NormalCardDrawViewModel.EquipList) then
        for k,v in pairs(NormalCardDrawViewModel.EquipList) do
            local obj = GameObject.Instantiate(self.ItemCardPrefab().gameObject,self.RoleCardPanel().transform)
            local equipData = RoleequipmentLocalData.tab[v[1]]
            obj:SetActive(true)
            local _SSRLightPanel = CJNUIMgr.GetSunUseName(obj,"SSRLightPanel")
            local _SSRLight = CJNUIMgr.GetSunUseName(obj,"SSRLight")
            local _SRLightPanel = CJNUIMgr.GetSunUseName(obj,"SRLightPanel")
            local _BrisIconImg=CJNUIMgr.GetSunUseName(obj,"BrisIconImg").transform:GetComponent("Image")
            local itemBg = CJNUIMgr.GetSunUseName(obj,"ItemRankBgImg").transform:GetComponent("Image")
            local icon = CJNUIMgr.GetSunUseName(obj,"ItemIconImg").transform:GetComponent("Image")
            local name = CJNUIMgr.GetSunUseName(obj,"Text_ItemName").transform:GetComponent("TextMeshProUGUI")
            local count = CJNUIMgr.GetSunUseName(obj,"Text_ItemShuliang").transform:GetComponent("TextMeshProUGUI")
            local frame = CJNUIMgr.GetSunUseName(obj,"ItemRankKuangImg").transform:GetComponent("Image")
            --图片
            MgrRes.LoadSprite(icon,"Equip/"..equipData[4])
            MgrRes.LoadSprite(itemBg,"Quality/RoleRankBg_"..equipData[6])
            MgrRes.LoadSprite(frame,"Quality/RoleRankKuang_"..equipData[6])
            if v[2] == 1 then
                --重复获得
                _BrisIconImg.gameObject:SetActive(true)
                local itemStr = RoleequipmentLocalData.tab[v[1]][10]
                local arr = JNStrTool.strSplit("_",itemStr)
                ---@type ItemData
                local itemData = ItemControl.GetItemByType(tonumber(arr[1]),tonumber(arr[2]))
                name.text = itemData.name
                count.text = "x"..arr[3]
                MgrRes.LoadSprite(_BrisIconImg,itemData.icon)
                --闪烁图片
                Tools.SetImageFadeLoop(icon.gameObject,_BrisIconImg.gameObject,2.5,2,2)
            else
                _BrisIconImg.gameObject:SetActive(false)
                name.text = equipData[2]
                count.text = ""
            end
            --品质框
            if equipData[6] == 4 then
                _SSRLightPanel:SetActive(true)
                _SSRLight:SetActive(true)
                _SRLightPanel:SetActive(false)
            elseif equipData[6] == 3 then
                _SSRLightPanel:SetActive(false)
                _SSRLight:SetActive(true)
                _SRLightPanel:SetActive(true)
            else
                _SSRLightPanel:SetActive(false)
                _SSRLight:SetActive(false)
                _SRLightPanel:SetActive(false)
            end
        end
    end
    --物品
    if next(CardDrawControl.LightDarkItemDrawResult) then
        for k,v in pairs(CardDrawControl.LightDarkItemDrawResult) do
            local obj = GameObject.Instantiate(self.ItemCardPrefab().gameObject,self.RoleCardPanel().transform)
            ---@type ItemData
            local itemData = ItemControl.GetItemByIdAndType(v.goodsID,v.goodsType)
            obj:SetActive(true)
            local _SSRLightPanel = CJNUIMgr.GetSunUseName(obj,"SSRLightPanel")
            local _SSRLight = CJNUIMgr.GetSunUseName(obj,"SSRLight")
            local _SRLightPanel = CJNUIMgr.GetSunUseName(obj,"SRLightPanel")
            local itemBg = CJNUIMgr.GetSunUseName(obj,"ItemRankBgImg").transform:GetComponent("Image")
            local icon = CJNUIMgr.GetSunUseName(obj,"ItemIconImg").transform:GetComponent("Image")
            local name = CJNUIMgr.GetSunUseName(obj,"Text_ItemName").transform:GetComponent("TextMeshProUGUI")
            local count = CJNUIMgr.GetSunUseName(obj,"Text_ItemShuliang").transform:GetComponent("TextMeshProUGUI")
            local frame = CJNUIMgr.GetSunUseName(obj,"ItemRankKuangImg").transform:GetComponent("Image")
            local _BrisIconImg=CJNUIMgr.GetSunUseName(obj,"BrisIconImg").transform:GetComponent("Image")
            _BrisIconImg.gameObject:SetActive(false)
            if itemData.quality == 4 then
                _SSRLightPanel:SetActive(true)
                _SSRLight:SetActive(true)
                _SRLightPanel:SetActive(false)
            elseif itemData.quality == 3 then
                _SSRLightPanel:SetActive(false)
                _SSRLight:SetActive(true)
                _SRLightPanel:SetActive(true)
            else
                _SSRLightPanel:SetActive(false)
                _SSRLight:SetActive(false)
                _SRLightPanel:SetActive(false)
            end
            MgrRes.LoadSprite(itemBg,"Quality/RoleRankBg_"..itemData.quality)
            MgrRes.LoadSprite(icon,itemData.icon)
            MgrRes.LoadSprite(frame,"Quality/RoleRankKuang_"..itemData.quality)
            name.text = itemData.name
            count.text = "x"..v.goodsNum
        end
    end
    self.UnClickBg().gameObject:SetActive(false)
end

---初始化星星
function M:InitStar(_Root,_Prefab,_Count)
    Tools.ClearAllChild(_Root)
    for i = 1, _Count, 1 do
        self:CreatStar(_Root,_Prefab)
    end
end

---创建星星
function M:CreatStar(_Root,_Prefab)
    local UnJuxingStar=GameObject.Instantiate(_Prefab,_Root.transform)
    UnJuxingStar.gameObject:SetActive(true)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end

function M:LightDarkRecruitNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientLightDarkRecruitNTF',buffer))
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0

    if tag ~= 0 then
        return
    end
    self.UnClickBg().gameObject:SetActive(true)
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    self.beforeTime = 3.2
    local heroarr = {}
    local equiparr = {}
    local itemarr = {}
    local goodarr = {}
    local isSSR = false
    local isSR = false
    local topPrize = false

    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(goodarr,v.goods[1])
                table.insert(arr,1)
            else
                HeroControl.PushSingleHeroData(v.hero)
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    isSSR = true
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
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
        end
        if v.goods and v.hero == nil and v.equip == nil then
            --检查是否抽到大奖
            if v.goods[1].goodsID == tonumber(SteamLocalData.tab[126103][2]) then
                topPrize = true
            end
            table.insert(itemarr,v.goods[1])
        end
    end
    RoleCardViewModel.ReloadCacheRoleData()
    self:ActiveDrawVideoSubWidgets()

    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = {}
    NormalCardDrawViewModel.HeroList = heroarr
    NormalCardDrawViewModel.EquipList = {}
    NormalCardDrawViewModel.EquipList = equiparr
    CardDrawControl.SetRecruitIndex(tab.recruitId, tab.recruitIndex);
    ItemControl.PushGroupItemData(goodarr,ItemControl.PushEnum.add)    ---物品消耗
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
    CardDrawControl.LightDarkItemDrawResult = {}
    if(#itemarr ~= 0) then
        CardDrawControl.LightDarkItemDrawResult = itemarr
        ---更新物品奖励
        ItemControl.PushGroupItemData(itemarr,ItemControl.PushEnum.add)
    end
    --推送卡池抽取次数
    CardDrawControl.PushSinglePoolData(tab.recruitId,nil,tab.LightDarkFreeTime)
    --重载卡池数据
    CardDrawControl.ReloadCacheList()
    --当前卡池id
    NormalCardDrawViewModel.CurRecruit = tab.recruitId
    criUI:Play()
    MgrSound.PlayEffect("draw_character_1",nil,nil,false)
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "Playing: 5" then
            MgrTimer.AddDelayNoName(self.beforeTime,Handle(self, function()
                criUI:Pause(true)
                self.isBeganClick = true
                self.UnClickBg().gameObject:SetActive(false)
                self.Btn_Goahead().gameObject:SetActive(true)
            end),nil)
        end
        if tostring(state) == "PlayEnd: 6" then
            --抽到了特等奖
            if topPrize then
                MgrUI.GoClose(UID.DrawItemResult_UI)
            else
                --如果抽到了角色
                if #heroarr ~= 0 then
                    --判断卡池第一个是否为SSR
                    local firstIsSSR = RoleattributeLocalData.tab[heroarr[1][1]][6] >= 4
                    --当前结果角色数量
                    CardDrawControl.HeroCount = #heroarr
                    if #heroarr == 1 then --单抽
                        if firstIsSSR then--单抽出金
                            local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                            MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
                            MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                            MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                                NormalCardDrawViewModel.OpenCardDrawResultUI()
                                criUI.player.statusChangeCallback = nil
                            end),nil)
                        else--单抽没出金
                            NormalCardDrawViewModel.OpenCardDrawResultUI()
                            criUI.player.statusChangeCallback = nil
                        end
                    else--十连
                        if firstIsSSR then
                            local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                            MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/".. badgeName})
                            MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                            MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                                NormalCardDrawViewModel.OpenCardDrawResultUI()
                                criUI.player.statusChangeCallback = nil
                            end),nil)
                        else
                            NormalCardDrawViewModel.OpenCardDrawResultUI()
                            criUI.player.statusChangeCallback = nil
                        end
                    end
                else
                    criUI.player.statusChangeCallback = nil
                    --只有物品
                    self:RefreshResult()
                end
            end
        end
    end
end

--region 控件操作
--- 激活抽卡视频相关控件
function M:ActiveDrawVideoSubWidgets()
    if self.RoleCardPanel() then
        self.RoleCardPanel().gameObject:SetActive(false)
    end
    if self.Btns() then
        self.Btns().gameObject:SetActive(false)
    end
    if self.Btn_SkipPanel() then
        self.Btn_SkipPanel().gameObject:SetActive(true)
    end
end

--- 以新的抽卡数据重新加载
function M:ReloadForNewCards()
    self:BottomParticle().gameObject:SetActive(true)
    self.RoleCardPrefab().gameObject:SetActive(false)
    self.ItemCardPrefab().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
    self.Btn_Goahead().gameObject:SetActive(false)
    self.Btn_SkipPanel().gameObject:SetActive(false)
    
    self.RoleCardPanel().gameObject:SetActive(true)
    self.Btns().gameObject:SetActive(true)

    self:RefreshResult()
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