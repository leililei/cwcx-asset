-- Code Auto Create Begin
local M = Class('XiahuoyurePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.XiahuoyurePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[XiahuoyurePop_UI].prefab'
    self.Name = 'Form[XiahuoyurePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Xiaoyouxi','Xiaoyouxi',2},{'Img_Mask1','Xiaoyouxi/Img_Mask1',2},{'Img_SummerSign','Xiaoyouxi/Img_SummerSign',2},{'Img_SignBg','Xiaoyouxi/Img_SummerSign/Img_SignBg',2},{'Lihui1','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui1',2},{'Img_Lihui1','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui1/Img_Lihui1',2},{'Img_SoundTextBG1','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui1/Img_SoundTextBG1',2},{'Lihui2','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui2',2},{'Img_Lihui2','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui2/Img_Lihui2',2},{'Img_SoundTextBG2','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui2/Img_SoundTextBG2',2},{'Title','Xiaoyouxi/Img_SummerSign/Title',2},{'Img_Xuanxiangdi','Xiaoyouxi/Img_SummerSign/Xuanxiang/Img_Xuanxiangdi',2},{'SelectItem','Xiaoyouxi/Img_SummerSign/Xuanxiang/SelectItem',2},{'SelectBg','Xiaoyouxi/Img_SummerSign/Xuanxiang/SelectItem/SelectBg',2},{'ItemContent','Xiaoyouxi/Img_SummerSign/Xuanxiang/ItemContent',2},{'Btn_Help','Xiaoyouxi/Img_SummerSign/Btn_Help',2},{'HelpPop','Xiaoyouxi/HelpPop',2},{'Img_Mask3','Xiaoyouxi/HelpPop/Img_Mask3',2},{'Img_bg','Xiaoyouxi/HelpPop/PopPanel/Img_bg',2},{'Img_Xian2','Xiaoyouxi/HelpPop/PopPanel/Img_Xian2',2},{'Img_Xian1','Xiaoyouxi/HelpPop/PopPanel/Img_Xian1',2},{'Img_Fenggexian','Xiaoyouxi/HelpPop/PopPanel/Img_Fenggexian',2},{'Img_Biaotixian','Xiaoyouxi/HelpPop/PopPanel/Img_Biaotixian',2},{'Donghua','Donghua',2},{'Img_Mask2','Donghua/Img_Mask2',2},{'Img_Donghuadi','Donghua/Img_Donghuadi',2},{'Donghua01','Donghua/Img_Donghuadi/Donghua',2},{'UI_TX_xigua','UI_TX_xigua',2},
        -- TextMeshProUGUI 列表
        {'RoleVoiceText1','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui1/Img_SoundTextBG1/RoleVoiceText1',20},{'RoleVoiceText2','Xiaoyouxi/Img_SummerSign/Img_SignBg/Lihui2/Img_SoundTextBG2/RoleVoiceText2',20},{'Text_Title','Xiaoyouxi/Img_SummerSign/Title/Text_Title',20},{'Text_Shijian','Xiaoyouxi/Img_SummerSign/Title/Text_Shijian',20},{'Text_Select','Xiaoyouxi/Img_SummerSign/Xuanxiang/SelectItem/SelectBg/Text_Select',20},{'Text_Txt','Xiaoyouxi/HelpPop/PopPanel/Text_Txt',20},{'Text_Title01','Xiaoyouxi/HelpPop/PopPanel/Text_Title',20},{'Text_Pigua','Donghua/Text_Pigua',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Donghua().gameObject:SetActive(false)
    self.HelpPop().gameObject:SetActive(false)
    self.UI_TX_xigua().gameObject:SetActive(false)

    ---添加音频
    MgrSound.AddCue("Audio/common/BGM.acb")
    
    self.mPreheaData = nil
    
    self:InitUI()
    self:InitButton()
end

function M:InitUI()
    local tActive = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.PREHEAT)
    if tActive and tActive.beginTime ~= "0" and tActive.endTime ~= "0" then
        local tBegin = string.split(tActive.beginTime,"-")
        local tEnd = string.split(tActive.endTime,"-")
        local tStr = tBegin[1].."/"..tBegin[2].."/"..tBegin[3].."~"..tEnd[1].."/"..tEnd[2].."/"..tEnd[3]
        local tActiveTime = string.format(MgrLanguageData.GetLanguageByKey("ui_summerpreview_text3"), tStr)
        self.Text_Shijian().text = tActiveTime
    end
    self.Text_Pigua().text = string.format(MgrLanguageData.GetLanguageByKey("ui_summerpreview_text2"), PlayerControl.GetPlayerData().nickname)
end

function M:OnShow(pArg)
    self.mPreheaData = pArg[1]
    
    if self.mPreheaData == nil then
        return
    end
    MgrTimer.AddDelayNoName(0.2,function()
        MgrSound.PlayBGM(self.mPreheaData.music,1,nil,true)
        MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().curRoleID), false)
    end)
    ---立绘与对话
    if self.mPreheaData.picIdA ~= "0" then
        MgrRes.LoadSprite(self.Img_Lihui1(), self.mPreheaData.picIdA, nil, true)
        self.Img_Lihui1().transform.anchoredPosition = Vector2(tonumber(self.mPreheaData.positionAx),tonumber(self.mPreheaData.positionAy))
    else
        self.Img_Lihui1().gameObject:SetActive(false)
    end
    if self.mPreheaData.dialogueA ~= "0" then
        self.RoleVoiceText1().text = self.mPreheaData.dialogueA
    else
        self.Img_SoundTextBG1().gameObject:SetActive(false)
    end

    if self.mPreheaData.picIdB ~= "0" then
        MgrRes.LoadSprite(self.Img_Lihui2(), self.mPreheaData.picIdB, nil, true)
        self.Img_Lihui2().transform.anchoredPosition = Vector2(tonumber(self.mPreheaData.positionBx),tonumber(self.mPreheaData.positionBy))
    else
        self.Img_Lihui2().gameObject:SetActive(false)
        self.Lihui1().transform.anchoredPosition = Vector2.zero
    end
    if self.mPreheaData.dialogueB ~= "0" then
        self.RoleVoiceText2().text = self.mPreheaData.dialogueB
    else
        self.Img_SoundTextBG2().gameObject:SetActive(false)
    end
end

function M:InitButton()
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject,function()
        self.HelpPop().gameObject:SetActive(true)
    end)
    UIEvent.LuaClick(self.Img_Mask3().gameObject,function()
        self.HelpPop().gameObject:SetActive(false)
    end)
    ---选项按钮
    for i = 1, 3 do
        local tSel = GameObject.Instantiate(self.SelectItem().gameObject, self.ItemContent().transform, false)
        local _SelctText = CJNUIMgr.GetSunUseName(tSel, "Text_Select"):GetComponent("TextMeshProUGUI")
        _SelctText.text = string.char(64+i)
        UIEvent.LuaClick(tSel.gameObject, Handle(self, function()
            ---选择音效
            MgrSound.PlayEffect("yx_xh_1",1,0,false,0,0,"summer")
            self.Donghua().gameObject:SetActive(true)
            MgrRes.LoadWatchAuto(self.Donghua().gameObject, 1000012, -100, -130, 0.1, "attack", function(obj)
                self.LingHangObj = obj
                ---挥刀动作音效
                MgrSound.PlayEffect("yx_xh_2",1,0,false,0,0,"summer")
                CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"attack",false,function(eventName)
                    if eventName == "Hit" then
                        ---击中动作音效
                        MgrSound.PlayEffect("yx_xh_3",1,0,false,0,0,"summer")
                        self.UI_TX_xigua().gameObject:SetActive(true)
                        MgrTimer.AddDelayNoName(0.5,function()
                            self.Donghua().gameObject:SetActive(false)
                            self:ShowAward()
                        end)
                    end
                end)
            end)
        end))
    end
    self.SelectItem().gameObject:SetActive(false)
end

function M:ShowAward()
    local goodsList = self.mPreheaData.awards
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
    MgrUI.ClosePop(self.Uid)
end

function M:OnClose()
    MgrSound.PlayBGM(SteamLocalData.tab[113014][2],0.2)
end

return M