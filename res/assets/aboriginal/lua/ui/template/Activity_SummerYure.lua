-- Code Auto Create Begin
local M = Class('Activity_SummerYure', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_SummerYure.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_SummerYure','/',2},{'Lihui1','Yure/Img_SignBg/Lihui1',2},{'Img_Lihui1','Yure/Img_SignBg/Lihui1/Img_Lihui1',2},{'Img_SoundTextBG1','Yure/Img_SignBg/Lihui1/Img_SoundTextBG1',2},{'Lihui2','Yure/Img_SignBg/Lihui2',2},{'Img_Lihui2','Yure/Img_SignBg/Lihui2/Img_Lihui2',2},{'Img_SoundTextBG2','Yure/Img_SignBg/Lihui2/Img_SoundTextBG2',2},{'Shijian','Yure/Shijian',2},{'Xuanxiang','Yure/Xuanxiang',2},{'Img_Xuanxiangdi','Yure/Xuanxiang/Img_Xuanxiangdi',2},{'SelectItem','Yure/Xuanxiang/SelectItem',2},{'ItemContent','Yure/Xuanxiang/ItemContent',2},{'Yicanyu','Yure/Yicanyu',2},{'Img_Xuanxiangdi01','Yure/Yicanyu/Img_Xuanxiangdi',2},{'Img_Yicanyu','Yure/Yicanyu/Img_Yicanyu',2},{'Donghua','Donghua',2},{'Img_Mask2','Donghua/Img_Mask2',2},{'Img_Donghuadi','Donghua/Img_Donghuadi',2},{'Donghua01','Donghua/Img_Donghuadi/Donghua',2},{'UI_TX_xigua','UI_TX_xigua',2},
        -- UITemplate 列表
        {'Activity_SummerYure01','/',10},
        -- TextMeshProUGUI 列表
        {'RoleVoiceText1','Yure/Img_SignBg/Lihui1/Img_SoundTextBG1/RoleVoiceText1',20},{'RoleVoiceText2','Yure/Img_SignBg/Lihui2/Img_SoundTextBG2/RoleVoiceText2',20},{'Text_Time','Yure/Shijian/Text_Time',20},{'Text_Shijian','Yure/Shijian/Text_Shijian',20},{'Text_Tips','Yure/Xuanxiang/Text_Tips',20},{'Text_Tips01','Yure/Yicanyu/Text_Tips',20},{'Text_Pigua','Donghua/Text_Pigua',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Donghua().gameObject:SetActive(false)
    self.UI_TX_xigua().gameObject:SetActive(false)
    self.Yicanyu().gameObject:SetActive(false)

    ---添加音频
    MgrSound.AddCue("Audio/common/BGM.acb")

    self.mPreheaData = nil
    self.previewCfg = nil
    self.DialogData = ActivityControl.GetDialogData()
    
    self:InitUI()
end

function M:InitUI()
    local tActive = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.PREHEAT)
    if tActive and tActive.beginTime ~= "0" and tActive.endTime ~= "0" then
        local tBegin = string.split(tActive.beginTime,"-")
        local tEnd = string.split(tActive.endTime,"-")
        local tStr = tBegin[1].."/"..tBegin[2].."/"..tBegin[3].."~"..tEnd[1].."/"..tEnd[2].."/"..tEnd[3]
        --local tActiveTime = string.format(MgrLanguageData.GetLanguageByKey("ui_summerpreview_text3"), tStr)
        self.Text_Shijian().text = tStr
    end
    self.Text_Pigua().text = string.format(MgrLanguageData.GetLanguageByKey("ui_summerpreview_text2"), PlayerControl.GetPlayerData().nickname)
end

function M:OnUpdateUI(pArg)
    self.mPreheaData = SummerControl.GetPreheaData()
    for k,v in pairs(Activitypreview2LocalData.tab) do
        if v[2] == pArg[1] then
            self.previewCfg = v
            break
        end
    end
    
    ---底图更换
    if self.previewCfg ~= nil and self.previewCfg[4] ~= "0" then
        MgrRes.LoadSprite(self.Activity_SummerYure(),self.previewCfg[4])
    end
    if self.mPreheaData == nil then
        return
    end
    self:InitButton()
    ---背景音乐
    MgrTimer.AddDelayNoName(0.2,function()
        MgrSound.PlayBGM(self.mPreheaData.music,1,nil,true)
        MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().curRoleID), false)
    end)
    ---立绘
    if self.mPreheaData.picIdA ~= "0" then
        MgrRes.LoadSprite(self.Img_Lihui1(), self.mPreheaData.picIdA, nil, true)
        self.Img_Lihui1().transform.anchoredPosition = Vector2(tonumber(self.mPreheaData.positionAx),tonumber(self.mPreheaData.positionAy))
    else
        self.Img_Lihui1().gameObject:SetActive(false)
    end
    if self.mPreheaData.picIdB ~= "0" then
        MgrRes.LoadSprite(self.Img_Lihui2(), self.mPreheaData.picIdB, nil, true)
        self.Img_Lihui2().transform.anchoredPosition = Vector2(tonumber(self.mPreheaData.positionBx),tonumber(self.mPreheaData.positionBy))
    else
        self.Img_Lihui2().gameObject:SetActive(false)
        self.Lihui1().transform.anchoredPosition = Vector2.zero
    end
    ---对话
    local tDialogData = self.DialogData[self.mPreheaData.dialogId]
    if tDialogData == nil then
        return
    end
    if tDialogData.dialogueA ~= "0" then
        self.RoleVoiceText1().text = tDialogData.dialogueA
    elseif tDialogData.talkRoleA then
        --添加音效
        MgrSound.AddCue("Audio/role/".. tDialogData.talkRoleA..".acb")

        self.RoleVoiceText1().text = tDialogData.talkDataA[7]
        ---角色语音
        MgrSound.PlayRole(tDialogData.talkDataA[13], nil, nil, false, 0, 0,nil)
    else
        self.Img_SoundTextBG1().gameObject:SetActive(false)
    end

    if self.mPreheaData.dialogueB ~= "0" then
        self.RoleVoiceText2().text = self.mPreheaData.dialogueB
    elseif tDialogData.talkRoleB then
        --添加音效
        MgrSound.AddCue("Audio/role/".. tDialogData.talkRoleB..".acb")

        self.RoleVoiceText2().text = tDialogData.talkDataB[7]
        ---角色语音
        MgrSound.PlayRole(tDialogData.talkDataB[13], nil, nil, false, 0, 0,nil)
    else
        self.Img_SoundTextBG2().gameObject:SetActive(false)
    end
    ---判断奖励是否领取
    if self.mPreheaData.awards then
        self.Yicanyu().gameObject:SetActive(true)
        self.SelectItem().gameObject:SetActive(false)
        self.ItemContent().gameObject:SetActive(false)
        self.Xuanxiang().gameObject:SetActive(false)
        return
    end
end

function M:InitButton()
    ---选项图
    local tSelectImg = {}
    if self.previewCfg ~= nil and self.previewCfg[5] ~= "0" then
        tSelectImg = string.split(self.previewCfg[5],';')
    end
    ---选项按钮
    for i = 1, #tSelectImg do
        MgrRes.LoadSprite(self.SelectItem(), tSelectImg[i])
        local tSel = GameObject.Instantiate(self.SelectItem().gameObject, self.ItemContent().transform, false)
        UIEvent.LuaClick(tSel.gameObject, Handle(self, function()
            ---选择音效
            if self.previewCfg[10] ~= "0" then
                MgrSound.PlayEffect(self.previewCfg[10],1,0,false,0,0,"summer")
            end
            ---签到奖励
            SummerControl.SummerAwardREQ(Handle(self,self.SignAward))            
        end))
    end
    self.SelectItem().gameObject:SetActive(false)
end

function M:SignAward(_goods)
    ---检测是否需要动画
    if self.previewCfg[9] ~= "0" then
        self.Donghua().gameObject:SetActive(true)
        MgrRes.LoadWatchAuto(self.Donghua().gameObject, tonumber(self.previewCfg[9]), -100, -130, 0.1, "attack", function(obj)
            self.LingHangObj = obj
            ---挥刀动作音效
            if self.previewCfg[11] ~= "0" then
                MgrSound.PlayEffect(self.previewCfg[11],1,0,false,0,0,"summer")
            end
            CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"attack",false,function(eventName)
                if eventName == "Hit" then
                    ---击中动作音效
                    if self.previewCfg[12] ~= "0" then
                        MgrSound.PlayEffect(self.previewCfg[12],1,0,false,0,0,"summer")
                    end
                    self.UI_TX_xigua().gameObject:SetActive(true)
                    MgrTimer.AddDelayNoName(0.5,function()
                        self.UI_TX_xigua().gameObject:SetActive(false)
                        self.Donghua().gameObject:SetActive(false)
                        self:ShowAward(_goods)
                    end)
                end
            end)
        end)
    else
        self:ShowAward(_goods)
    end
end

function M:ShowAward(_goods)
    local goodsList = _goods.summerAward
    if goodsList ~= nil then
        ---更新物品奖励
        --ItemControl.PushGroupItemData(goodsList,ItemControl.PushEnum.add)
        ItemControl.RequireBagItem()
        ---弹出奖励窗口
        if #goodsList > 0 then
            MgrUI.Pop(UID.ItemAchievePop_UI,{goodsList},true)
        end
        ---刷新主界面货币数目
        HomeViewModel.RefreshCoinCount()
    end
    ---判断奖励是否领取
    self.Yicanyu().gameObject:SetActive(true)
    self.SelectItem().gameObject:SetActive(false)
    self.ItemContent().gameObject:SetActive(false)
    self.Xuanxiang().gameObject:SetActive(false)

    Event.Go("ActivityDot")
end

function M:OnClose()
    MgrSound.PlayBGM(SteamLocalData.tab[113014][2],0.2)
end
return M