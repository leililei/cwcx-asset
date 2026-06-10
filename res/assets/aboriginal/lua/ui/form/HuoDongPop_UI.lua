-- Code Auto Create Begin
local M = Class('HuoDongPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HuoDongPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HuoDongPop_UI].prefab'
    self.Name = 'Form[HuoDongPop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 0
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'zuo','zuo',2},{'you','you',2},{'ClickMaskImg','ClickMaskImg',2},{'Activity_SevenDaySign','Activity_SevenDaySign',2},{'Activity_Newcome','Activity_Newcome',2},{'Activity_Boss','Activity_Boss',2},{'Activity_Summer','Activity_Summer',2},{'Activity_Plot3','Activity_Plot3',2},{'Activity_Zhanshuzhidao','Activity_Zhanshuzhidao',2},{'Activity_Fund2','Activity_Fund2',2},{'Activity_Fund3','Activity_Fund3',2},{'Activity_SummerYure','Activity_SummerYure',2},{'Activity_HaiYueHuanShuo','Activity_HaiYueHuanShuo',2},{'Activity_Yueta','Activity_Yueta',2},{'Activity_Event4Preheat','Activity_Event4Preheat',2},{'Activity_Huigui','Activity_Huigui',2},{'Activity_DailySign','Activity_DailySign',2},{'Activity_TimeLimitSign','Activity_TimeLimitSign',2},{'Activity_Cake','Activity_Cake',2},{'Activity_Fund','Activity_Fund',2},{'Activity_Event4','Activity_Event4',2},{'Activity_ChapterTask','Activity_ChapterTask',2},{'Activity_WudaohuiPVP','Activity_WudaohuiPVP',2},{'Activity_PersonStory','Activity_PersonStory',2},{'Activity_LimitSign','Activity_LimitSign',2},{'Activity_HalfAnniversary','Activity_HalfAnniversary',2},{'Activity_SignAll','Activity_SignAll',2},{'Activity_Gift','Activity_Gift',2},{'Activity_Power','Activity_Power',2},{'Activity_discountshop','Activity_discountshop',2},{'Activity_FirstCharge','Activity_FirstCharge',2},{'Activity_Invite','Activity_Invite',2},{'SwitchPanel','SwitchPanel',2},{'HuoDongToggle','SwitchPanel/VFXMask/SwitchScroll/HuoDongToggle',2},{'SelectImg','SwitchPanel/VFXMask/SwitchScroll/HuoDongToggle/SelectImg',2},{'RedDotIcon','SwitchPanel/VFXMask/SwitchScroll/HuoDongToggle/RedDotIcon',2},{'Btn_suo','SwitchPanel/VFXMask/SwitchScroll/HuoDongToggle/Btn_suo',2},{'Img_suo','SwitchPanel/VFXMask/SwitchScroll/HuoDongToggle/Btn_suo/Img_suo',2},{'SwitchContent','SwitchPanel/VFXMask/SwitchScroll/SwitchContent',2},{'Btn_Return','UpperLeftPanel/Btn_Return',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'NewcomeItemPop','NewcomeItemPop',2},{'BlurMask','NewcomeItemPop/BlurMask',2},{'ClickBackArea','NewcomeItemPop/ClickBackArea',2},{'ClickBackAreaMask','NewcomeItemPop/ClickBackAreaMask',2},{'Img_Xian1','NewcomeItemPop/Img_Xian1',2},{'Img_Xian2','NewcomeItemPop/Img_Xian2',2},{'Img_Tanchuangdi','NewcomeItemPop/Img_Tanchuangdi',2},{'HuoDongPopItem','NewcomeItemPop/Img_Tanchuangdi/bg/HuoDongPopItem',2},{'biaotixian','NewcomeItemPop/Img_Tanchuangdi/PanelTitleText/biaotixian',2},{'AllMask','AllMask',2},
        -- UITemplate 列表
        {'Activity_SevenDaySign01','Activity_SevenDaySign',10},{'Activity_Newcome01','Activity_Newcome',10},{'Activity_Boss01','Activity_Boss',10},{'Activity_Summer01','Activity_Summer',10},{'Activity_Plot301','Activity_Plot3',10},{'Activity_Zhanshuzhidao01','Activity_Zhanshuzhidao',10},{'Activity_Fund201','Activity_Fund2',10},{'Activity_Fund301','Activity_Fund3',10},{'Activity_SummerYure01','Activity_SummerYure',10},{'Activity_HaiYueHuanShuo01','Activity_HaiYueHuanShuo',10},{'Activity_Yueta01','Activity_Yueta',10},{'Activity_Event4Preheat01','Activity_Event4Preheat',10},{'Activity_Huigui01','Activity_Huigui',10},{'Activity_DailySign01','Activity_DailySign',10},{'Activity_TimeLimitSign01','Activity_TimeLimitSign',10},{'Activity_Cake01','Activity_Cake',10},{'Activity_Fund01','Activity_Fund',10},{'Activity_Event401','Activity_Event4',10},{'Activity_ChapterTask01','Activity_ChapterTask',10},{'Activity_WudaohuiPVP01','Activity_WudaohuiPVP',10},{'Activity_PersonStory01','Activity_PersonStory',10},{'Activity_LimitSign01','Activity_LimitSign',10},{'Activity_HalfAnniversary01','Activity_HalfAnniversary',10},{'Activity_SignAll01','Activity_SignAll',10},{'Activity_Gift01','Activity_Gift',10},{'Activity_Power01','Activity_Power',10},{'Activity_discountshop01','Activity_discountshop',10},{'Activity_FirstCharge01','Activity_FirstCharge',10},{'Activity_CumulativeSales','Activity_CumulativeSales',10},{'Activity_CumulativeSales2','Activity_CumulativeSales2',10},{'Activity_Invite01','Activity_Invite',10},{'Activity_Bingo','Activity_Bingo',10},{'HuoDongPopItem01','NewcomeItemPop/Img_Tanchuangdi/bg/HuoDongPopItem',10},
        -- Toggle 列表
        {'HuoDongToggle01','SwitchPanel/VFXMask/SwitchScroll/HuoDongToggle',13},
        -- RawImage 列表
        {'bg','NewcomeItemPop/Img_Tanchuangdi/bg',15},{'AwardContent','NewcomeItemPop/Img_Tanchuangdi/bg/AwardContent',15},
        -- LoopScrollRect 列表
        {'SwitchScroll','SwitchPanel/VFXMask/SwitchScroll',18},{'bg01','NewcomeItemPop/Img_Tanchuangdi/bg',18},
        -- TextMeshProUGUI 列表
        {'Text_Switch','SwitchPanel/VFXMask/SwitchScroll/HuoDongToggle/Text_Switch',20},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'PanelTitleText','NewcomeItemPop/Img_Tanchuangdi/PanelTitleText',20},
    }
end
-- Code Auto Create End
require("LocalData/ReturnsystemLocalData")
function M:OnInit()
    self.Activity_SevenDaySign().gameObject:SetActive(false)
    self.Activity_FirstCharge().gameObject:SetActive(false)
    self.Activity_Newcome().gameObject:SetActive(false)
    self.Activity_Plot3().gameObject:SetActive(false)
    self.Activity_DailySign().gameObject:SetActive(false)
    self.Activity_Boss().gameObject:SetActive(false)
    self.Activity_Summer().gameObject:SetActive(false)
    self.Activity_SummerYure().gameObject:SetActive(false)
    self.Activity_Zhanshuzhidao01().gameObject:SetActive(false)
    self.Activity_Fund().gameObject:SetActive(false)
    self.Activity_HaiYueHuanShuo().gameObject:SetActive(false)
    self.Activity_Yueta().gameObject:SetActive(false)
    self.NewcomeItemPop().gameObject:SetActive(false)
    self.AllMask().gameObject:SetActive(false)
    self.Activity_Fund2().gameObject:SetActive(false)
    self.Activity_Fund3().gameObject:SetActive(false)
    self.Activity_Event4Preheat().gameObject:SetActive(false)
    self.Activity_Event4().gameObject:SetActive(false)
    self.Activity_LimitSign().gameObject:SetActive(false)
    self.Activity_discountshop().gameObject:SetActive(false)
    self.Activity_CumulativeSales().gameObject:SetActive(false)
    self.Activity_CumulativeSales2().gameObject:SetActive(false)
    self.Activity_Bingo().gameObject:SetActive(false)

    ---@type ActivityData[]
    self.ActivityData = nil
    self.CurPanel = nil
    self.RedDotList = {}  ---红点
    self.toggles = {}
    self.CurPageID = nil
    ---注册滑条
    self:InitScroll()
    ---添加监听
    self:AddEvent()
    
    self:InitUI()
    self:InitButton()
    self:CheckRedDot()
   
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---页签跳转
    self:ChangePage()
end

function M:OnBackKey()
    local isNewcomeItemPop = self.NewcomeItemPop().gameObject.activeSelf

    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        if isNewcomeItemPop then
            self.NewcomeItemPop().gameObject:SetActive(false)
            return
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("RedDotFunc")
        MgrUI.GoBack()
    end
end

---注册滑条
function M:InitScroll()
    ---页签滑条
    self.SwitchScroll():SetLuaCellEvent(Handle(self, self.ToggleEvent))
end

function M:OnShowFinish()
    if NoviceViewModel.CurTaskId == 21305 then
        for k,v in pairs(self.toggles) do
            if self.ActivityData[k].activityType ==  ActivityControl.activityTypeEnum.NOVICE_TRAIN then
                v.isOn = true
                break
            else
                v.isOn = false
            end
        end
        NoviceViewModel.DoNext()
    elseif NoviceViewModel.CurTaskId == 21702 then
        for k,v in pairs(self.toggles) do
            if self.ActivityData[k].activityType ==  ActivityControl.activityTypeEnum.GUIDE then
                v.isOn = true
            else
                v.isOn = false
            end
        end
        NoviceViewModel.DoNext()
    end
end

---页签切换按钮监听
function M:ToggleEvent(trans,idx)
    local toggle = trans:GetComponent("Toggle")
    self.toggles[idx] = toggle
    toggle.group = self.SwitchContent().gameObject:GetComponent("ToggleGroup")
    Tools.ToggleValueChange(toggle,function(isOn,curTog)
        if isOn then
            CMgrCamera.Instance.UIMainCamera.allowHDR = true
            MgrUI.GetUICamera().orthographic = false
            self.CurPageID = idx
            if self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SIGNDAY then
                ---七日签到
                self.Activity_SevenDaySign01():SetData({self.ActivityData[idx].activityId})

                self:SwitchUI(self.Activity_SevenDaySign())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SIGN then
                local tSignData = PlayerControl.GetPlayerData().monthSignFlag
                ---当前未签到并且首次新手引导已完成才弹出签到
                if tSignData then
                    self.AllMask().gameObject:SetActive(true)
                    UIEvent.LuaClick(self.AllMask().gameObject, function()
                        SignViewModel.SendSign()
                        self.AllMask().gameObject:SetActive(false)
                    end)
                end
                ---月签到
                self.Activity_DailySign01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_DailySign())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.FIRSTCHARGE then
                ---首充
                self.Activity_FirstCharge01():SetData({self.ActivityData[idx]})

                self:SwitchUI(self.Activity_FirstCharge())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.NOVICE_TRAIN then
                ---新晋者
                self.Activity_Newcome01():SetData({self.ActivityData[idx].activityId,self})

                self:SwitchUI(self.Activity_Newcome())
                NoviceControl.UpdateNoviceActivityUI = Handle(self,self.InitUI)
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.WarmUP2 then
                ---预热2
                self.Activity_Plot301():SetData({self.ActivityData[idx].activityId})

                self:SwitchUI(self.Activity_Plot3())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.LIANHETAOFA then
                ---联合讨伐
                self.Activity_Boss01():SetData({self.ActivityData[idx].activityType})
                self:SwitchUI(self.Activity_Boss01())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PREHEAT then
                ---夏活预热
                self:SwitchUI(self.Activity_SummerYure())
                self.Activity_SummerYure01():SetData({self.ActivityData[idx].activityId})
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SUMMER then
                ---夏活
                self.Activity_Summer01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_Summer())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.GUIDE then
                ---战术指导
                self.Activity_Zhanshuzhidao01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_Zhanshuzhidao01())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.FUND then
                ---基金
                self.Activity_Fund01():SetData( {self.ActivityData[idx].activityId} )

                self:SwitchUI(self.Activity_Fund())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.EVENT then
                ---月冕
                self.Activity_HaiYueHuanShuo01():SetData( {self.ActivityData[idx].activityId} )

                self:SwitchUI(self.Activity_HaiYueHuanShuo())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.MONTH_EVENT then
                --月塔
                self.Activity_Yueta01():SetData({self.ActivityData[idx]})
                self:SwitchUI(self.Activity_Yueta())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.MonthlyRecharge then
                ---限时充值
                if ActivityControl.GetCurActivityByID(self.ActivityData[idx].activityId) ~= nil then
                    self.Activity_Fund201():SetData({self.ActivityData[idx].activityId})
                    self:SwitchUI(self.Activity_Fund201())
                else
                    Event.Remove("BackKey", Handle(self, self.OnBackKey))
                    Event.Go("RedDotFunc")
                    MgrUI.GoBack()
                end
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.TotalRecharge then
                ---累计充值
                if ActivityControl.GetCurActivityByID(self.ActivityData[idx].activityId) ~= nil then
                    self.Activity_Fund301():SetData({self.ActivityData[idx].activityId})
                    self:SwitchUI(self.Activity_Fund301())
                else
                    Event.Remove("BackKey", Handle(self, self.OnBackKey))
                    Event.Go("RedDotFunc")
                    MgrUI.GoBack()
                end
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PREHEAT3 then
                ---气球预热活动
                self.Activity_Event4Preheat01():SetData({self.ActivityData[idx]})
                
                self:SwitchUI(self.Activity_Event4Preheat())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.EVENT4 then
                ---7月活动
                self.Activity_Event401():SetData({self.ActivityData[idx].activityId})
                
                self:SwitchUI(self.Activity_Event4())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.LIMITSIGN then
                ---限时签到
                local LimitSignActivityInfo = ActivityControl.GetCurActivityByID(self.ActivityData[idx].activityId)
                LimitSignControl.SetActivityInfo(LimitSignActivityInfo)

                self.Activity_TimeLimitSign01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_TimeLimitSign01())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.LIMITSIGN_NEW then
                ---新7日限时签到
                local NewSevenDay_LimitSignActivityInfo = ActivityControl.GetCurActivityByID(self.ActivityData[idx].activityId)
                LimitSign_NewControl.SetActivityInfo(NewSevenDay_LimitSignActivityInfo)
                self.Activity_LimitSign01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_LimitSign01())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.HUIGUI then
                ---回归活动
                self.Activity_Huigui01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_Huigui())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.HALF_ANNI then
                ---半周年
                self.Activity_HalfAnniversary01():SetData({self.ActivityData[idx]})
                CMgrCamera.Instance.UIMainCamera.allowHDR = false
                MgrUI.GetUICamera().orthographic = true

                self:SwitchUI(self.Activity_HalfAnniversary())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.CAKESIGN then
                ---生日签到
                self.Activity_Cake01():SetData({self.ActivityData[idx]})
                self:SwitchUI(self.Activity_Cake())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.CHAPTER_TASK then
                ---章节任务
                self.Activity_ChapterTask01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_ChapterTask())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PVP_WuDaoHui then
                ---武道会
                self.Activity_WudaohuiPVP01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_WudaohuiPVP())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SIGNALL then
                --百日签到
                local tId = self.ActivityData[idx].activityId
                local tSignData = LimitSignControl.GetSignDataByID(tId)
                ---当前未签到并且首次新手引导已完成才弹出签到
                if tSignData.ableDay == 1 then
                    self.AllMask().gameObject:SetActive(true)
                    UIEvent.LuaClick(self.AllMask().gameObject, function()
                        LimitSignControl.ClientLimitSignReq(tSignData.day + 1, tId)
                        self.AllMask().gameObject:SetActive(false)
                    end)
                end
                
                self.Activity_SignAll01():SetData({tId})
                self:SwitchUI(self.Activity_SignAll())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.GIFT_BUY then
                --礼包直购
                self.Activity_Gift01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_Gift())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PERSON_STORY then
                --个人剧情
                self.Activity_PersonStory01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_PersonStory())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.ACTIVE_TILI then
                --体力消耗活动
                self.Activity_Power01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_Power())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.DISCOUNT_SHOP then
                --折扣商店
                self.Activity_discountshop01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_discountshop())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.CUMULATIVE_SALES then
                local activityData = self.ActivityData[idx]
                ---@type UITemplate
                local activityPanel
                -- 固定活动id和界面预制体的对应。本身每个活动界面就是要改活动预制体
                -- 目前是第二个活动(主线任务商店)用第二个预制体
                if activityData.activityId == ActivityControl.activityTypeEnum.CUMULATIVE_SALES * 100 + 1 then
                    activityPanel = self.Activity_CumulativeSales2()
                else
                    activityPanel = self.Activity_CumulativeSales()
                end
                -- 保持与返回界面时的参数结构一致
                activityPanel:SetData({activityData.activityId, self})
                self:SwitchUI(activityPanel)
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.INVITE then
                --拉新活动
                self.Activity_Invite01():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_Invite())
            elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.BINGO then
                self.Activity_Bingo():SetData({self.ActivityData[idx].activityId})
                self:SwitchUI(self.Activity_Bingo())
            end
            curTog.transform:Find("Text_Switch").gameObject:GetComponent("TextMeshProUGUI").color = Color(0.1372549,0.1568628,0.1882353)
        else
            curTog.transform:Find("Text_Switch").gameObject:GetComponent("TextMeshProUGUI").color = Color(0.5686275,0.5764706,0.5921569)
        end
    end,toggle)
    
    if idx == 1 then
        toggle.isOn = true
    else
        toggle.transform:Find("Text_Switch").gameObject:GetComponent("TextMeshProUGUI").color = Color(0.5686275,0.5764706,0.5921569)
        toggle.isOn = false
    end
    trans.transform:Find("Text_Switch").gameObject:GetComponent("TextMeshProUGUI").text = self.ActivityData[idx].name
    
    ---添加红点,将红点的name作为key
    if self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SIGNDAY then
        ---七日签到
        self.RedDotList["WeekSign"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.FIRSTCHARGE then
        ---首充奖励
        self.RedDotList["FirstCharge"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.NOVICE_TRAIN then
        ---新竞者活动
        if self.RedDotList["NoviceTask"] == nil then
            self.RedDotList["NoviceTask"] = {}
        end
        self.RedDotList["NoviceTask"][self.ActivityData[idx].activityId] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.WarmUP2 then
        ---虚与梦
        self.RedDotList["ActivityPlot"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SUMMER then
        ---夏活
        self.RedDotList["Summer"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.LIANHETAOFA then
        ---联合讨伐
        self.RedDotList["WorldBoss"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SIGN then
        ---签到
        self.RedDotList["Sign"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.GUIDE then
        ---战术指导
        self.RedDotList["TacticalGuidance"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PREHEAT then
        ---夏活预热
        --trans.transform:Find("RedDotIcon").gameObject:SetActive(false)
        self.RedDotList["PreheatXiGua"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.FUND then
        ---基金
        self.RedDotList["Fund"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.EVENT then
        ---月冕
        self.RedDotList["HaiYue"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.MONTH_EVENT then
        ---月塔
        self.RedDotList["Yueta"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.MonthlyRecharge then
        ---限时充值
        self.RedDotList["MonthlyRecharge"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.TotalRecharge then
        ---累计充值
        self.RedDotList["TotalRecharge"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PREHEAT3 then
        ---气球预热活动
        self.RedDotList["Event4Preheat"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.EVENT4 then
        ---7月活动
        self.RedDotList["Event4"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.LIMITSIGN then
        ---限时签到
        self.RedDotList["limitSign_"..self.ActivityData[idx].activityId] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.LIMITSIGN_NEW then
        ---新限时签到
        self.RedDotList["limitSign_New_"..self.ActivityData[idx].activityId] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.HALF_ANNI then
        ---半周年
        self.RedDotList["HalfAnniversary"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.HUIGUI then
        ---回归活动
        self.RedDotList["SignBack"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.CAKESIGN then
        ---生日活动
        self.RedDotList["Cake"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.CHAPTER_TASK then
        ---章节任务
        self.RedDotList["ChapterTask"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PVP_WuDaoHui then
        ---武道会
        self.RedDotList["BuDouKai"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.SIGNALL then
        ---百日签到
        self.RedDotList["LimitSignAll"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.GIFT_BUY then
        --礼包直购
        trans.transform:Find("RedDotIcon").gameObject:SetActive(false)
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.PERSON_STORY then
        --个人剧情
        trans.transform:Find("RedDotIcon").gameObject:SetActive(false)
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.ACTIVE_TILI then
        --体力消耗
        self.RedDotList["PowerCost"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.DISCOUNT_SHOP then
        --折扣商店
        trans.transform:Find("RedDotIcon").gameObject:SetActive(false)
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.CUMULATIVE_SALES then
        -- 累销活动
        local activityData = self.ActivityData[idx]
        if activityData.activityId == ActivityControl.activityTypeEnum.CUMULATIVE_SALES * 100 + 1 then
            self.RedDotList["CumulativeSales2"] = trans.transform:Find("RedDotIcon").gameObject
        else
            self.RedDotList["CumulativeSales"] = trans.transform:Find("RedDotIcon").gameObject
        end
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.INVITE then
        --拉新活动
        self.RedDotList["Invite"] = trans.transform:Find("RedDotIcon").gameObject
    elseif self.ActivityData[idx].activityType == ActivityControl.activityTypeEnum.BINGO then
        --Bingo活动
        self.RedDotList["Bingo"] = trans.transform:Find("RedDotIcon").gameObject
    end
    
    ---系统解锁判定
    local tLockBtn = trans.transform:Find("Btn_suo").gameObject
    if self.ActivityData[idx].systemopen ~= 0 and not SysLockControl.CheckSysLock(self.ActivityData[idx].systemopen) then
        tLockBtn:SetActive(true)
        UIEvent.LuaClick(tLockBtn,function()
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(self.ActivityData[idx].systemopen),1},true)
        end)
    else
        tLockBtn:SetActive(false)
    end
end

function M:InitUI()
    local activityData = ActivityControl.GetAllActivityData()
    self.ActivityData = {}
    ---是否已经解锁
    for i, v in pairs(activityData) do
        if v.systemopen == 0 or SysLockControl.CheckSysLock(v.systemopen) and StormControl.CheckPointPass(tonumber(v.front)) then
            if  v.activityType == ActivityControl.activityTypeEnum.HUIGUI then
                if PlayerControl.GetPlayerData().regression and PlayerControl.GetPlayerData().regression.Status and Global.isMiddleTime(PlayerControl.GetPlayerData().regression.CreateAt, PlayerControl.GetPlayerData().regression.CloseDAt) 
                and PlayerControl.GetPlayerData().level >= ReturnsystemLocalData.tab[1].level  then
                    table.insert(self.ActivityData,v)
                end
            else
                table.insert(self.ActivityData,v)
            end
        end
    end
    self.SwitchScroll().totalCount = #self.ActivityData
    self.SwitchScroll():RefillCells(0)
end

function M:InitButton()
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("RedDotFunc")
        Event.Go("OpenPackagesPop")
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.ClickBackArea().gameObject,function()
        self.NewcomeItemPop().gameObject:SetActive(false)
    end)
    --UIEvent.LuaClick(self.Activity_SummerYure().gameObject,function()
    --    MgrUI.GoHide(UID.SummerHome_UI)
    --    
    --    MgrUI.ClosePop(self.Uid)
    --end)
end

---切换界面
function M:SwitchUI(_panel)
    if self.CurPanel == _panel then
        return
    end
    if self.CurPanel ~= nil then
        self.CurPanel.gameObject:SetActive(false)
    end
    self.CurPanel = _panel
    self.CurPanel.gameObject:SetActive(true)
    ---清空注册
    NoviceControl.UpdateNoviceActivityUI = nil
    -- 注意，很有可能出现 UITemplate.OnUpdateUI 比该事件更快执行
    Event.Go(EID.HuoDongPopSwitch, self.CurPanel.gameObject.name)
end

function M:CheckRedDot()
    ActivityViewModel.CheckRedDot()
    if self.ObjRoot == nil then
        return
    end
    for i, v in pairs(RedDotControl.GetDotData("Activity").childNodeData) do
        if self.RedDotList[v.name] ~= nil then
            if v.name == "NoviceTask" then
                for id, obj in pairs(self.RedDotList[v.name]) do
                    if TaskControl.CheckNewcomeDot(id) then
                        obj:SetActive(true)
                    else
                        obj:SetActive(false)
                    end
                end
            elseif v.name == "Summer" then
                local isRed = false
                for i, v in pairs(RedDotControl.GetDotData("SummerTask").childNodeData) do
                    if v.name == "SummerDailyTask" or v.name == "SummerAchievement" then
                        if v.State == true then
                            isRed = v.State
                        end
                    end
                end
                self.RedDotList[v.name]:SetActive(isRed)
            else
                self.RedDotList[v.name]:SetActive(v.State)
            end
        end
    end
end

function M:AddEvent()
    Event.Add("ActivityDot",Handle(self,self.CheckRedDot))
    Event.Add("ChangePage",Handle(self,self.ChangePage))
end

function M:ShowNewComePop(_activityID)
    self.NewcomeItemPop().gameObject:SetActive(true)
    ---新手阶段
    self.stageNumber = TaskControl.NoviceStage(_activityID)
    ---奖励
    self.listOfItems = {}
    local tNoviceStageData = TaskControl.GetNoviceStageData(_activityID)
    for i = 1,#tNoviceStageData do
        local reward = ItemData.New()
        reward:PushData(tNoviceStageData[i].reward, ItemControl.PushEnum.none)
        table.insert(self.listOfItems,reward)
        if i < self.stageNumber then
            reward.isReceive = 1
        else
            reward.isReceive = 0
        end
        reward.rankId = i
    end
    Global.Sort(self.listOfItems,{"isReceive","rankId"},false)
    --table.sort(self.listOfItems,function(a,b)
    --    if a.isReceive < b.isReceive then
    --        return true
    --    else
    --        return false
    --    end
    --    if a.quality > b.quality then
    --        return true
    --    else
    --        return false
    --    end
    --end)
    self.bg01():SetLuaCellEvent(Handle(self,self.ShowItems))
    self.bg01().totalCount = #self.listOfItems
    self.bg01():RefillCells()
end

function M:ShowItems(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.listOfItems[idx],self,self.stageNumber,idx})
end
---刷新当前界面
function M:OnBackShow()
    self:CheckRedDot()
    if self.CurPanel == nil then
        return
    end
    if self.CurPanel == self.Activity_FirstCharge() or self.CurPanel == self.Activity_Yueta() then
        self.CurPanel.gameObject:GetComponent("UITemplate"):SetData({ self.ActivityData[self.CurPageID] })
    else
        self.CurPanel.gameObject:GetComponent("UITemplate"):SetData({ self.ActivityData[self.CurPageID].activityId,self })
    end
    ---页签跳转
    self:ChangePage()
end
---页签跳转
function M:ChangePage()
    if ActivityControl.PageType then
        for k,v in pairs(self.toggles) do
            if self.ActivityData[k].activityType == ActivityControl.PageType then
                v.isOn = true
                self.SwitchScroll():ScrollToCell(k-1,1000)
                break
            end
        end
        ActivityControl.PageType = nil
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.CheckClear("ActivityDot")
    Event.CheckClear("limitSignActivityDot")
    Event.CheckClear("DailySignRec")
    Event.CheckClear("Act_ChapterTask")
    Event.CheckClear("ChangePage")
    Event.CheckClear(EID.HuoDongPopSwitch)
    
    Event.Go(EID.HuoDongPopClose)
    Event.CheckClear(EID.HuoDongPopClose)
    
    MgrTimer.Cancel("DailySignClock")
    NoviceControl.UpdateNoviceActivityUI = nil
end

return M