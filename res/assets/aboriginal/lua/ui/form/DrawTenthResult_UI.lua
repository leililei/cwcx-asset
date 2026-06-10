-- Code Auto Create Begin
local M = Class('DrawTenthResult_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DrawTenthResult_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DrawTenthResult_UI].prefab'
    self.Name = 'Form[DrawTenthResult_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 8
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_ClickBack','Btn_ClickBack',2},{'BackGroundPanel','BackGroundPanel',2},{'BottomParticle','BackGroundPanel/BottomParticle',2},{'di','BackGroundPanel/di',2},{'dian(1)','BackGroundPanel/dian (1)',2},{'wangge(1)','BackGroundPanel/wangge (1)',2},{'Img_Xian','BackGroundPanel/Img_Xian',2},{'sanjiao','BackGroundPanel/sanjiao',2},{'liuguang','BackGroundPanel/liuguang',2},{'liuguang(1)','BackGroundPanel/liuguang (1)',2},{'RoleCardPrefab','RoleCardPrefab',2},{'guang1','RoleCardPrefab/SRLightPanel/guang1',2},{'zi','RoleCardPrefab/SRLightPanel/zi',2},{'guang2','RoleCardPrefab/SSRLightPanel/guang2',2},{'huang','RoleCardPrefab/SSRLightPanel/huang',2},{'guang2(1)','RoleCardPrefab/SSRLightPanel/guang2 (1)',2},{'RoleRankBgImg','RoleCardPrefab/RoleRankBgImg',2},{'RoleLihuiImg','RoleCardPrefab/RoleLihuiImg',2},{'xiazhezhao','RoleCardPrefab/xiazhezhao',2},{'yiyongyouzhezhao','RoleCardPrefab/RepeatPanel/yiyongyouzhezhao',2},{'daojukuang','RoleCardPrefab/RepeatPanel/daojukuang',2},{'RolePuzzleIcon','RoleCardPrefab/RepeatPanel/RolePuzzleIcon',2},{'1','RoleCardPrefab/RepeatPanel/1',2},{'RoleStarPanel','RoleCardPrefab/RoleStarPanel',2},{'RoleRankKuangImg','RoleCardPrefab/RoleRankKuangImg',2},{'StarPrefab','RoleCardPrefab/StarPrefab',2},{'SSRLight','RoleCardPrefab/SSRLight',2},{'SRLight','RoleCardPrefab/SRLight',2},{'RoleCardPanel','RoleCardPanel',2},{'Btns','Btns',2},{'Btn_Confirm','Btns/Btn_Confirm',2},{'Btn_Cutpage(Selected)','Btns/Btn_Confirm/Btn_Cutpage(Selected)',2},{'Btn_Again','Btns/Btn_Again',2},{'Btn_Cutpage(Selected)01','Btns/Btn_Again/Btn_Cutpage(Selected)',2},{'CardDrawVideoRT','CardDrawVideoRT',2},{'Btn_Goahead','CardDrawVideoRT/Btn_Goahead',2},{'ChouKaVFXObj','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj',2},{'di01','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di',2},{'di2','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di2',2},{'locked','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/locked',2},{'Image','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/Image',2},{'quan','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan',2},{'quan2','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan2',2},{'shizi','CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/shizi',2},{'UnClickBg','UnClickBg',2},{'Btn_SkipPanel','Btn_SkipPanel',2},{'Btn_Skip','Btn_SkipPanel/Btn_Skip',2},{'Img_Skip_Icon','Btn_SkipPanel/Btn_Skip/Img_Skip_Icon',2},
        -- TextMeshProUGUI 列表
        {'RolePuzzleCountText','RoleCardPrefab/RepeatPanel/RolePuzzleCountText',20},{'Text_title','Btns/Btn_Confirm/Text_title',20},{'Text_Againtitle','Btns/Btn_Again/Text_Againtitle',20},{'Text_Skip','Btn_SkipPanel/Btn_Skip/Text_Skip',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.RepeatCount = 0 -- 请求抽奖通知补发次数
    self.SSRLight().gameObject:SetActive(false)
    self:BottomParticle().gameObject:SetActive(true)
    self.RoleCardPrefab().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
    self.Btn_Goahead().gameObject:SetActive(false)---隐藏点击特效
    self.Btn_SkipPanel().gameObject:SetActive(false)
    self:InitButton()  ---初始化按钮
    self:InitTenthCardPanel()
    if NoviceViewModel.CurTaskId == 52407 then
        self.Text_Againtitle().text = MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips1")
    else
        self.Text_Againtitle().text = MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips2")
    end
    Event.Add("ReconnetSucc", Handle(self,self.ReconnetEvent))
    ---卡池数据
    self.poolData = CardDrawControl.GetDataById(NormalCardDrawViewModel.CurRecruit)
    if self.poolData then
        ---如果当前卡池抽取次数大于抽取次数
        if self.poolData.limit ~= 0 and self.poolData.count >= self.poolData.limit then
            self.Btn_Again().gameObject:SetActive(false)
        end
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() then
        if NoviceViewModel.CurTaskId == 52407 then
            self:NoviceTask()
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips3"),function()
                ---提交抽取数据
                NoviceViewModel.SaveNoviceDrawProgress(NoviceViewModel.CurTaskId)
                print("确认首抽结果!")
            end,nil,2,function()
                NoviceControl.PushSingleData(52408,false)
                MessageEvent.Go(EID.NoviceCheck,52407)
            end,nil,nil,true },true)
        else
            NormalCardDrawViewModel.BackToCardDrawUI()
        end
        return
    end
end


function M:ReconnetEvent()
    self.UnClickBg().gameObject:SetActive(false)
    -- if MgrNet.DrawRepeat then
    --     if self.RepeatCount >= 3 then
    --         MgrNet.DrawRepeat = false
    --         MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
    --             MgrSdk.BackToLogin()
    --         end},true)
    --         return
    --     end
    --     self.RepeatCount = self.RepeatCount + 1
    --     local table = {}
    --     local buffer = assert(pb.encode('PBClient.ClientRecruitRepeatREQ',table))
    --     MgrNet.SendReq(MID.CLIENT_RECRUIT_REPEAT_REQ, buffer, 1, nil, Handle(self, self.RecruitRepeatACK), nil)
    -- end
end

---关闭
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Remove("ReconnetSucc", Handle(self,self.ReconnetEvent))
end

function M:InitButton()
    UIEvent.LuaClick(self.Btn_ClickBack().gameObject,Handle(self,function ()
        if NoviceViewModel.CurTaskId == 52407 then
            return
        end
        NormalCardDrawViewModel.BackToCardDrawUI()
    end))
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,Handle(self,function ()
        if NoviceViewModel.CurTaskId == 52407 then
            self:NoviceTask()
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips3"),function()
                ---提交抽取数据
                NoviceViewModel.SaveNoviceDrawProgress(NoviceViewModel.CurTaskId)
                print("确认首抽结果!")
            end,nil,2,function()
                NoviceControl.PushSingleData(52408,false)
                MessageEvent.Go(EID.NoviceCheck,52407)
            end,nil,nil,true },true)
        else
            NormalCardDrawViewModel.BackToCardDrawUI()
        end
    end))
    UIEvent.LuaClick(self.Btn_Again().gameObject,Handle(self,function ()
        if NoviceViewModel.CurTaskId == 52407 then
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips4"),function()
                self:RecruitNoviceClick()
                self:BottomParticle().gameObject:SetActive(false)
            end,nil,2},true)
        else
            if NormalCardDrawViewModel.CurCostType == 0 then
                if self:CheckCount(10) then
                    NormalCardDrawViewModel.CountType = 1
                    self:OnClickDrawalCard(NormalCardDrawViewModel.CurRecruit,0,10,NormalCardDrawViewModel.CurPoolRoleUpList[NormalCardDrawViewModel.CurRecruit])
                end
            elseif NormalCardDrawViewModel.CurCostType == 1 then
                if self:CheckCount(10) then
                    NormalCardDrawViewModel.CountType = 1
                    if self.poolData.cardType == 3 then
                        self:OnClickDrawalCard(NormalCardDrawViewModel.CurRecruit,1,10,0)
                    else
                        self:OnClickDrawalCard(NormalCardDrawViewModel.CurRecruit,1,10,NormalCardDrawViewModel.CurPoolRoleUpList[NormalCardDrawViewModel.CurRecruit])
                    end
                end
            end
            --self.Btns().gameObject:SetActive(false)
        end
    end))

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

function M:NoviceTask()
    NoviceViewModel.DoNext()
end

function M:CheckCount(count)
    if NormalCardDrawViewModel.limitCount ~=0 then
        if self.CurRecruitID == 999999 then
            return true
        end
        local lotteryInfo = NormalCardDrawViewModel.GetLotteryInfo(NormalCardDrawViewModel.CurRecruit)
        local CanCount =  NormalCardDrawViewModel.limitCount - lotteryInfo.lotteryCount
        if count > CanCount then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips5")..CanCount,1},true)
            return false
        end
    end
    return true
end

function M:InitTenthCardPanel()
    for key, value in pairs(NormalCardDrawViewModel.HeroList) do
        self:CreatRoleCard(self.RoleCardPrefab().gameObject,value)
    end
end

--创建一个人物卡牌
function M:CreatRoleCard(_Prefab,value)
    -- statements
    local _RoleId = value[1]
    local _InfoTab = RoleattributeLocalData.tab[_RoleId]
    local _RoleCardObj=self:CreatGo(_Prefab,self.RoleCardPanel().gameObject)
    local _SSRLightPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"SSRLightPanel")
    local _SSRLight=CJNUIMgr.GetSunUseName(_RoleCardObj,"SSRLight")
    local _SRLightPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"SRLightPanel")
    local _RoleRankBgImg=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleRankBgImg")
    local _RoleRankKuangImg=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleRankKuangImg")
    local _RoleLihuiImg=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleLihuiImg")
    local _RepeatPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"RepeatPanel")
    local _RolePuzzleIcon=CJNUIMgr.GetSunUseName(_RoleCardObj,"RolePuzzleIcon")
    local _RolePuzzleCountText=CJNUIMgr.GetSunUseName(_RoleCardObj,"RolePuzzleCountText")
    local _RoleStarPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleStarPanel")
    local _StarPrefab=CJNUIMgr.GetSunUseName(_RoleCardObj,"StarPrefab")
    _StarPrefab:SetActive(false)
    if   value[2] == 1 then
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
    if _InfoTab[6] == 4 then
        -- statements
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

function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
--创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=GameObject.Instantiate(_Prefab,_Root.transform)
    UnJuxingStar.gameObject:SetActive(true)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
--初始化星星
function M:InitStar(_Root,_Prefab,_Count)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _Count, 1 do
        self:CreatStar(_Root,_Prefab)
    end
end

---角色抽卡
function M:OnClickDrawalCard(recruitID,type,count,upRole)
    self.UnClickBg().gameObject:SetActive(true)
    self:BottomParticle().gameObject:SetActive(false)
    ---@type ItemData
    local item = nil
    local mtenCost = 0
    local drawData = CardDrawControl.GetDataById(recruitID)
    if type==0 then
        item = ItemControl.GetItemByID(tonumber(string.split(drawData.singleDrawPrice,"_")[2]))
        mtenCost = tonumber(string.split(drawData.singleDrawPrice,"_")[3])
    elseif type==1 then
        if drawData.cardType == 3 then
            --解析阶段奖励
            local awards = {}
            local s = string.split(drawData.stepupuse,';')
            for i, v in ipairs(s) do
                local str = string.split(v,',')
                awards[tonumber(str[1])] = str[2]
            end

            local currentLv = math.ceil(drawData.count / 10) + 1 --当前阶段

            if currentLv > #awards then
                currentLv = #awards
            end

            local currentAward = awards[currentLv]
            local costItem = ItemControl.GetItemByIdAndType(tonumber(string.split(currentAward,"_")[2]),tonumber(string.split(currentAward,"_")[1])) --抽卡消耗的物品
            local tenCost = tonumber(string.split(currentAward,"_")[3])        --石头十连抽价格
            item = ItemControl.GetItemByID(costItem.id)
            mtenCost = tenCost
        else
            if 1 == NormalCardDrawViewModel.GetDrawType() then
                local costItem = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.singleDrawPrice,"_")[2]),tonumber(string.split(drawData.singleDrawPrice,"_")[1])) --抽卡消耗的物品
                item = ItemControl.GetItemByID(costItem.id)
                mtenCost = tonumber(string.split(drawData.tenDrawPrice,"_")[3])
            else
                local priceInfo = ItemControl.ParsePriceString(drawData.tenNormalDrawPrice);
                item = priceInfo.item;
                mtenCost = priceInfo.price;
            end
        end
    end
    self.recruitID = recruitID
    self.recruitCount = count
    if self.recruitID == 999999 then
        self:RecruitClick(recruitID,1,count,upRole)
    else
        if item.count and item.count>=mtenCost then
            MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("cardbuypop_tips7"),item.name,mtenCost),function()
                if drawData.cardType == 5 then
                    self:FreeRecruitClick(recruitID,count)
                else
                    self:RecruitClick(recruitID,NormalCardDrawViewModel.GetDrawType(),count,upRole)
                end
            end,nil,2,Handle(self,function ()
                NormalCardDrawViewModel.BackToCardDrawUI()
            end),nil,nil,true},true)
        else
            self.UnClickBg().gameObject:SetActive(false)
            NormalCardDrawViewModel.ActionOnLackTicket(item, mtenCost, 
                function()
                    if drawData.cardType == 5 then
                        self:FreeRecruitClick(recruitID,count)
                    else
                        self:RecruitClick(recruitID,NormalCardDrawViewModel.GetDrawType(),count,upRole)
                    end
                end)
        end
    end
end
---抽卡返回ACK
function M:ReceiveRecruitACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientRecruitACK',buffer))
    if tag ~= 1 then
        return
    end
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        self.UnClickBg().gameObject:SetActive(false)
    end
end
---抽卡返回NTF
function M:ReceiveRecruitNTF(buffer, tag)
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0
    local tab = assert(pb.decode('PBClient.ClientRecruitNTF',buffer))
    if tag ~= 1 then
        return
    end
    --异常检测
    local success, err = pcall(function()
        self:ReceiveShow(tab)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            --重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
---抽卡请求
function M:RecruitClick(recruitID,type,count,target)
    local RecruitREQ  =
    {
        recruitID =recruitID,
        type = type,
        count = count,
        target = target,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(recruitID),
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientRecruitREQ',RecruitREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_RECRUIT_REQ,bytes,1,nil,Handle(self,self.ReceiveRecruitACK),Handle(self,self.ReceiveRecruitNTF))
end

function M:RecruitRepeatACK(buffer, tag)
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0
    local info = assert(pb.decode('PBClient.ClientRecruitRepeatACK',buffer))
    print("DrawTenthResult_UI RecruitRepeatACK:", serpent.block(info))
    if tag ~= 1 then
        return
    end
    if info.errNo ~= 0 then
        return
    end
    
    --异常检测
    local success, err = pcall(function()
        self:RecruitRepeat(info)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            --重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
function M:RecruitRepeat(info)
    local tab = info.ntf
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    local ssrCount = 0
    self.beforeTime = 3.2
    local heroarr = {}
    self.costGood = tab.cost
    self.goodarr = {}
    local isSSR = false
    local isSR = false
    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(self.goodarr,v.goods[1])
                table.insert(arr,1)
            else
                HeroControl.PushSingleHeroData(v.hero)
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    isSSR = true
                    ssrCount = self.recruitCount - i
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
    end
    print("isSSR",isSSR)
    print("isSR",isSR)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = heroarr
    ItemControl.PushGroupItemData(self.goodarr,ItemControl.PushEnum.add)    ---物品消耗
    ItemControl.PushGroupItemData(self.costGood,ItemControl.PushEnum.consume)    ---物品消耗
    NormalCardDrawViewModel.UpdataLotteryInfo(self.recruitID,tab.count,tab.up)
    self.RoleCardPanel().gameObject:SetActive(false)
    self.Btns().gameObject:SetActive(false)
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
            NormalCardDrawViewModel.OpenCardDrawResultUI()
            criUI.player.statusChangeCallback = nil
        end
    end
end

---抽卡返回ACK
function M:ReceiveNoviceACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientNewRecruitACK',buffer))
    if tag ~= 1 then
        return
    end
    print(tab.errNo)
end
---抽卡返回NTF
function M:ReceiveNoviceNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientNewRecruitNTF',buffer))
    if tag ~= 1 then
        return
    end
    
    --异常检测
    local success, err = pcall(function()
        self:NewRecruit(tab)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            ---重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
function M:NewRecruit(tab)
    local ssrCount = 0
    self.beforeTime = 3.2
    local heroarr = {}
    local isSSR = false
    local isSR = false
    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(arr,1)
            else
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    print("role???????",v.hero.heroID)
                    isSSR = true
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
    end
    print("isSSR",isSSR)
    print("isSR",isSR)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = heroarr
    self.RoleCardPanel().gameObject:SetActive(false)
    self.Btns().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(true)
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
            local firstIsSSR = RoleattributeLocalData.tab[heroarr[1][1]][6] >= 4
            local isNew =  NormalCardDrawViewModel.GetIsNewSSR(heroarr[1][1])
            local isGoods = heroarr[1][2] --是否为商品

            if firstIsSSR then
                local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                --self.beijing().gameObject:SetActive(false)
                MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/".. badgeName})
                MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                    NormalCardDrawViewModel.OpenCardDrawResultUI()
                    criUI.player.statusChangeCallback = nil
                end),nil)
            else
                NormalCardDrawViewModel.OpenCardDrawResultUI()
                criUI.player.statusChangeCallback = nil
            end
        end
    end
end
---抽卡请求
function M:RecruitNoviceClick()
    local RecruitREQ  =
    {
        recruitID = 999999,
        type = 1,
        count = 10,
        target = 0,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientNewRecruitREQ',RecruitREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_NEW_RECRUIT_REQ,bytes,1,nil,Handle(self,self.ReceiveNoviceACK),Handle(self,self.ReceiveNoviceNTF))
end
---自选抽卡请求
function M:FreeRecruitClick(recruitID,count)
    local RecruitREQ  =
    {
        lotteryID =recruitID,
        count = count,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(recruitID),
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSelectUpGachaReq',RecruitREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SELECT_UP_GACHA_REQ,bytes,0,nil,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSelectUpGachaAck',buffer))
        if tab.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
            self.UnClickBg().gameObject:SetActive(false)
        end
    end,Handle(self,self.FreeRecruitNTF))
end
function M:FreeRecruitNTF(buffer, tag)
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0
    local tab = assert(pb.decode('PBClient.ClientSelectUpGachaNtf',buffer))
    if tag ~= 0 then
        return
    end
    --异常检测
    local success, err = pcall(function()
        self:ReceiveShow(tab)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            --重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
---抽卡展示
function M:ReceiveShow(tab)
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    local ssrCount = 0
    self.beforeTime = 3.2
    local heroarr = {}
    self.costGood = tab.cost
    self.goodarr = {}
    local isSSR = false
    local isSR = false
    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(self.goodarr,v.goods[1])
                table.insert(arr,1)
            else
                HeroControl.PushSingleHeroData(v.hero)
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    isSSR = true
                    ssrCount = self.recruitCount - i
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
    end
    print("isSSR",isSSR)
    print("isSR",isSR)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = heroarr
    CardDrawControl.HeroCount = #heroarr
    ItemControl.PushGroupItemData(self.goodarr,ItemControl.PushEnum.add)    ---物品消耗
    ItemControl.PushGroupItemData(self.costGood,ItemControl.PushEnum.consume)    ---物品消耗
    NormalCardDrawViewModel.UpdataLotteryInfo(self.recruitID,tab.count,tab.up)
    CardDrawControl.PushSinglePoolData(tab.recruitId,tab.count)   ---推送卡池抽取次数
    --重载卡池数据
    CardDrawControl.ReloadCacheList()
    CardDrawControl.SetRecruitIndex(tab.recruitId, tab.recruitIndex);
    if(tab.goods) then
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    end

    self:ActiveDrawVideoSubWidgets()
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
            NormalCardDrawViewModel.OpenCardDrawResultUI()
            criUI.player.statusChangeCallback = nil
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
    if self.recruitID ~= 999999 then
        if self.Btn_SkipPanel() then
            self.Btn_SkipPanel().gameObject:SetActive(true)
        end
    end
end

--- 以新的抽卡数据重新加载
function M:ReloadForNewCards()
    self.SSRLight().gameObject:SetActive(false)
    self:BottomParticle().gameObject:SetActive(true)
    self.RoleCardPrefab().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
    self.Btn_Goahead().gameObject:SetActive(false)
    self.Btn_SkipPanel().gameObject:SetActive(false)

    self:RefreshPoolDataForNewCards()
    
    self.RoleCardPanel().gameObject:SetActive(true)
    self.Btns().gameObject:SetActive(true)
    
    Tools.ClearAllChild(self.RoleCardPanel().gameObject)
    self:InitTenthCardPanel()
end

--- 刷新池子数据
function M:RefreshPoolDataForNewCards()
    self.poolData = CardDrawControl.GetDataById(NormalCardDrawViewModel.CurRecruit)
    local bShowAgain = false
    if self.poolData then
        if self.poolData.limit == 0 or self.poolData.count < self.poolData.limit then
            bShowAgain = true
        end
    end
    self.Btn_Again().gameObject:SetActive(bShowAgain)
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