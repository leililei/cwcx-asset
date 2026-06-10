-- Code Auto Create Begin
local M = Class('SweepCompletePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SweepCompletePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SweepCompletePop_UI].prefab'
    self.Name = 'Form[SweepCompletePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','Ani/BlurMask',2},{'SweepingPanel','Ani/SweepingPanel',2},{'Sweeping','Ani/SweepingPanel/Sweeping',2},{'Img_Sweepdi','Ani/SweepingPanel/Sweeping/Img_Sweepdi',2},{'LeftPosition','Ani/SweepingPanel/Sweeping/LeftPosition',2},{'RightPosition','Ani/SweepingPanel/Sweeping/RightPosition',2},{'RightPosition2','Ani/SweepingPanel/Sweeping/RightPosition2',2},{'SweepPrefab','Ani/SweepingPanel/SweepScroll/SweepPrefab',2},{'ScrollbarVertical','Ani/SweepingPanel/SweepScroll/Scrollbar Vertical',2},{'Handle','Ani/SweepingPanel/SweepScroll/Scrollbar Vertical/Sliding Area/Handle',2},{'Btn_Skip','Ani/SweepingPanel/Btn_Skip',2},{'SweepCompletePanel','Ani/SweepCompletePanel',2},{'Img_Sweepdi01','Ani/SweepCompletePanel/SweepComplete/Img_Sweepdi',2},{'Img_Chalisha','Ani/SweepCompletePanel/SweepComplete/Img_Chalisha',2},{'Img_guang','Ani/SweepCompletePanel/SweepComplete/Img_guang',2},{'Text_Saodangwancheng_En','Ani/SweepCompletePanel/SweepComplete/Text_Saodangwancheng_En',2},{'SweepPrefab01','Ani/SweepCompletePanel/SweepScroll/SweepPrefab',2},{'ScrollbarVertical01','Ani/SweepCompletePanel/SweepScroll/Scrollbar Vertical',2},{'Handle01','Ani/SweepCompletePanel/SweepScroll/Scrollbar Vertical/Sliding Area/Handle',2},{'Img_SliderDi','Ani/SweepCompletePanel/Img_SliderDi',2},{'Img_SliderAdd','Ani/SweepCompletePanel/Img_SliderDi/Img_SliderAdd',2},{'Img_Slider','Ani/SweepCompletePanel/Img_SliderDi/Img_Slider',2},{'Img_AddExp','Ani/SweepCompletePanel/Text_AddExp/Img_AddExp',2},{'Img_LVdi','Ani/SweepCompletePanel/Img_LVdi',2},{'Btn_Enter','Ani/SweepCompletePanel/Btn_Enter',2},{'Img_Xian2','Ani/Img_Xian2',2},{'Img_Xian1','Ani/Img_Xian1',2},{'Img_Biaotixian','Ani/Img_Biaotixian',2},
        -- UITemplate 列表
        {'SweepPrefab02','Ani/SweepingPanel/SweepScroll/SweepPrefab',10},{'SweepRewardItem','Ani/SweepCompletePanel/SweepRewardItem',10},{'SweepPrefab03','Ani/SweepCompletePanel/SweepScroll/SweepPrefab',10},
        -- RawImage 列表
        {'SweepScroll','Ani/SweepingPanel/SweepScroll',15},{'SweepScroll01','Ani/SweepCompletePanel/SweepScroll',15},
        -- LoopScrollRect 列表
        {'SweepScroll02','Ani/SweepingPanel/SweepScroll',18},{'SweepScroll03','Ani/SweepCompletePanel/SweepScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Skip','Ani/SweepingPanel/Btn_Skip/Text_Skip',20},{'Text_Saodangwancheng_Cn','Ani/SweepCompletePanel/SweepComplete/Text_Saodangwancheng_Cn',20},{'Text_AddExp','Ani/SweepCompletePanel/Text_AddExp',20},{'Text_Exp','Ani/SweepCompletePanel/Text_Exp',20},{'Text_Lv','Ani/SweepCompletePanel/Img_LVdi/Text_Lv',20},{'Text_Queding','Ani/SweepCompletePanel/Btn_Enter/Text_Queding',20},{'Text_Name','Ani/Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:InitSweepScroll_PVE()
    self:InitSweepScroll_PVP()
    Event.Add("FreshPVPSweepResult",Handle(self,self.FreshPVPSweepResult))
    Event.Add("FreshPVESweepResult",Handle(self,self.FreshPVESweepResult))
    Event.Add("OpenSkip",Handle(self,self.OpenSkip))
    Event.Add("LeftAtk",Handle(self,self.LeftAtk))
    Event.Add("RightAtk",Handle(self,self.RightAtk))
    Event.Add("AllRest",Handle(self,self.AllRest))
    Event.Add("CompleteSweep",Handle(self,self.CompleteSweep))
    self:InitButton()
    CMgrBattle.Instance:RegisterSpineUI(Handle(self,self.handleSpineEvent))
    self.LeftOrRight = false    ---左边胜利为true
    self.firstShow = false
    self.PVEReward = {}
    self.index = 0
    self.RightPosition2().gameObject:SetActive(false)
end

function M:OnShow(args)
    self.Sweeping = args[1]     ---扫荡中还是扫荡结束
    self.Result = args[2]       ---PVP结果不从这里传入
    self.pOffsetExp = args[3]   ---获得经验值
    self.parent = args[4]
    self.PVEOrPVP = args[5]
    self.PVETotal = args[6]     ---PVE全部奖励
    self.LeftSpine = nil
    self.RightSpine = nil
    ---传入结果
    if self.PVEOrPVP == "PVE"  then
        MgrRes.LoadSprite(self.Img_Sweepdi(),"Preview/Img_SaodangBg_PVE")
        self.Text_Saodangwancheng_Cn = MgrLanguageData.GetLanguageByKey("ui_quickbattle_text4")
        ---打开跳过按钮
        self.Btn_Skip().gameObject:SetActive(true)
        self.Text_Skip().text =  MgrLanguageData.GetLanguageByKey("ui_tongyong_text36")
        ---逐条加入
        MgrTimer.AddRepeat("ShowSweepingResult",1,function()
            self.index = self.index + 1
            if self.index > #self.Result then
                self:CompleteSweep()
                return
            end
            if self.index % 5 == 0 then
                self.RightPosition().gameObject:SetActive(false)
                self.RightPosition2().gameObject:SetActive(true)
                Event.Go("LeftAtk")
                MgrSound.PlayEffect("xh1_1-4_sikadi_7",1,0,false,0,0)
            else
                self.RightPosition().gameObject:SetActive(true)
                self.RightPosition2().gameObject:SetActive(false)
                Event.Go("LeftAtk")
                MgrSound.PlayEffect("yx_xh_2",1,0,false,0,0)
            end
            table.insert(self.PVEReward,self.Result[self.index])
            Event.Go("FreshPVESweepResult")
        end,#self.Result + 1,nil)
    else
        MgrRes.LoadSprite(self.Img_Sweepdi(),"Preview/Img_SaodangBg_PVP")
        self.Text_Saodangwancheng_Cn = MgrLanguageData.GetLanguageByKey("ui_quickbattle_text5")
        self.Img_SliderDi().gameObject:SetActive(false)
        self.Text_AddExp().gameObject:SetActive(false)
        self.Text_Exp().gameObject:SetActive(false)
        self.Img_LVdi().gameObject:SetActive(false)
        self.Text_Skip().text = MgrLanguageData.GetLanguageByKey("ui_quickbattle_text10")
        self.Btn_Skip().gameObject:SetActive(true)
    end
    ---先关闭扫荡最终结果，逐条显示扫荡结果
    self.SweepCompletePanel().gameObject:SetActive(false)

end

function M:OnShowFinish()
    if not self.firstShow then
        self.firstShow = true
        ---spine左右加载
        MgrRes.LoadUISpine(self.LeftPosition().gameObject,11000,0,0,self:GetLayer(),"dj",function(obj)
            obj.transform.localScale = Vector3(20,20,1)
            Tools.SetLayer(obj,5)
            self.LeftSpine = obj
            Tools.SetObjSpineEvent(obj)
        end)
        if self.PVEOrPVP == "PVP" then
            MgrRes.LoadUISpine(self.RightPosition().gameObject,10001,0,0,self:GetLayer(),"dj",function(obj)
                obj.transform.localScale = Vector3(-20,20,1)
                Tools.SetLayer(obj,5)
                self.RightSpine = obj
                Tools.SetObjSpineEvent(obj)
            end)
        else
            MgrRes.LoadUISpine(self.RightPosition().gameObject,210001,0,0,self:GetLayer(),"dj",function(obj)
                obj.transform.localScale = Vector3(20,20,1)
                Tools.SetLayer(obj,5)
                self.RightSpine = obj
                Tools.SetObjSpineEvent(obj)
            end)
            MgrRes.LoadUISpine(self.RightPosition2().gameObject,11021,0,0,self:GetLayer(),"dj",function(obj)
                obj.transform.localScale = Vector3(-20,20,1)
                Tools.SetLayer(obj,5)
                self.RightSpine2 = obj
                Tools.SetObjSpineEvent(obj)
            end)
        end
    end
end

function M:InitSweepScroll_PVE()
    self.SweepScroll03():SetLuaCellEvent(Handle(self,self.CellItem))
end

function M:InitSweepScroll_PVP()
    self.SweepScroll02():SetLuaCellEvent(Handle(self,self.CellItem))
end

function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.Result[idx],idx,self,self.Sweeping})
end

function M:FreshPVPSweepResult(result)
    self.Result = result
    local count = #self.Result
    self.SweepScroll02().totalCount = count
    self.SweepScroll02():RefillCellsFromEnd()
end

function M:FreshPVESweepResult()
    local count = #self.PVEReward
    self.SweepScroll02().totalCount = count
    self.SweepScroll02():RefillCellsFromEnd()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---跳过
    UIEvent.LuaClick(self.Btn_Skip().gameObject,function()
        self:CompleteSweep()
    end)
    ---点击确认
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        local player = PlayerControl.GetPlayerData()
        if player.isLevelUp then
            --MgrUI.Pop(UID.PlayerLevelUp_UI,{player.vigor,player.level,player.exp},true)
            Event.Go("PlayerLevelUp_Pop",{player.vigor,player.level,player.exp})
            PlayerControl.PushLevelUpState(false)
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
        NoviceViewModel.ForceGuide(NoviceViewModel.CheckForce(),function()
            local data = EventRaidControl.GetLIANHETAOFAData()
            Event.Go("LHTFPOP",StormViewModel.CurStormBossId,{TaskControl.CheckTodayVigorExpend(),data.activityType})
        end)
    end)
end

function M:OpenSkip()
    self.Btn_Skip().gameObject:SetActive(true)
end
function M:OnBackKey()
    if self.SweepingPanel().gameObject.activeSelf then
        self:CompleteSweep()
        return
    end
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self:ClosePop()
    end
end
function M:CompleteSweep()
    MgrTimer.Cancel("ShowSweepingResult")
    self.SweepCompletePanel().gameObject:SetActive(true)
    self.SweepingPanel().gameObject:SetActive(false)
    self.Sweeping = "SweepComplete"
    ---统计所有结果并显示
    if self.PVEOrPVP == "PVE" then
        ---增加的经验滑动条
        local player = PlayerControl.GetPlayerData()
        self.Img_Slider().fillAmount = (player.exp - self.pOffsetExp)/PlayerControl.GetMaxExpByLevel(player.level)
        ---刷新经验
        local str = ""
        if self.pOffsetExp < 0 then
            ---经验滑动条显示
            Tools.SetImgFillRate(self.Img_Slider().gameObject,0.99)
            str = MgrLanguageData.GetLanguageByKey("ui_tips_3")
        else
            str = "+".. JNStrTool.numberAbbr(self.pOffsetExp)--(self.pOffsetExp >= 10000 and math.floor(self.pOffsetExp/1000).."K" or self.pOffsetExp)
        end

        MgrTimer.AddDelay("SweepExpAdd",0.5,function()
            if self.Img_Slider() then
                if self.pOffsetExp < 0 then
                    self.Img_Slider().fillAmount = 0
                end
            end

            if self.Img_SliderAdd() then
                Tools.SetImgFillRate(self.Img_SliderAdd().gameObject,player.exp/PlayerControl.GetMaxExpByLevel(player.level))
            end
        end,nil)

        self.Text_AddExp().text = str
        self.Text_Exp().text = string.format(MgrLanguageData.GetLanguageByKey("ui_tips_2").."%s/%s",player.exp,PlayerControl.GetMaxExpByLevel(player.level))
        self.Text_Lv().text = string.format("<color=#FFC24C>" .. MgrLanguageData.GetLanguageByKey("ui_tips_1").. "</color>" .." %s",player.level)
        ---最终结果
        self.Result = {}
        table.insert(self.Result,{self.PVETotal,true})
    elseif self.PVEOrPVP == "PVP" then
        self.parent.sendNextReq = false
        ---统合PVP结果
        local rewards = {}
        if self.Result ~= nil then
            for i,v in ipairs(self.Result) do
                for j,val in pairs(v[1]) do
                    if rewards[val.goodsID] == nil then
                        rewards[val.goodsID] = val
                    else
                        rewards[val.goodsID].goodsNum = rewards[val.goodsID].goodsNum + val.goodsNum
                    end
                end
            end
            self.Result = {}
            table.insert(self.Result,{rewards,true})
        end
    end
    ---显示所有奖励
    if self.Result ~= nil then
        local count = #self.Result
        self.SweepScroll03().totalCount = count
        self.SweepScroll03():RefillCells(count)
    end
    self.Text_Saodangwancheng_Cn = MgrLanguageData.GetLanguageByKey("ui_quickbattle_text5")
    if self.PVEOrPVP == "PVP" then
        self.parent:PVPSweepEnd()   ---PVP主界面重拉PVP段位信息
    end
end

function M:handleSpineEvent(aniName, eName)    ---Left == PVP胜利

    local atkRole = nil
    local beHitRole  = nil
    local beHitRole2  = nil
    if self.LeftOrRight then
        atkRole = self.LeftSpine
        beHitRole = self.RightSpine
        beHitRole2 = self.RightSpine2
    else
        atkRole = self.RightSpine
        beHitRole = self.LeftSpine
    end
    local atkRoleSkl = atkRole.gameObject:GetComponent("SkeletonAnimation")
    local beHitRoleSkl = beHitRole.gameObject:GetComponent("SkeletonAnimation")
    local beHitRoleSkl2 = nil
    if beHitRole2 ~= nil then
        beHitRoleSkl2 = beHitRole2.gameObject:GetComponent("SkeletonAnimation")
    end

    if eName == "Start" then
        if aniName == "sd-gj" then
        end
    elseif eName == "Complete" then
        if aniName == "sd-gj" then
            atkRoleSkl.state:SetAnimation(0,"dj",true)
        elseif aniName == "sd-sj" then
            beHitRoleSkl.state:SetAnimation(0,"dj",true)
            if beHitRoleSkl2 ~= nil then
                beHitRoleSkl2.state:SetAnimation(0,"dj",true)
            end
        end
    elseif eName == "Interrupt" then
        if aniName == "sd-gj" then
            if beHitRole2 ~= nil then
                beHitRole2.transform.localPosition = Vector3(0,0,0)
            end
            beHitRole.transform.localPosition = Vector3(0,0,0)
            atkRole.transform.localPosition = Vector3(0,0,0)
        end
    elseif eName == "Hit" then
        if aniName == "sd-gj" then
            beHitRoleSkl.state:SetAnimation(0,"sd-sj",false)
            if beHitRoleSkl2 ~= nil then
                beHitRoleSkl2.state:SetAnimation(0,"sd-sj",true)
            end
        end
    end
end

function M:LeftAtk()
    if self.LeftSpine ~= nil then
        self.LeftOrRight = true
        self.LeftSpine:GetComponent("SkeletonAnimation").state:SetAnimation(0,"sd-gj",false)
    end
end

function M:RightAtk()
    if self.RightSpine ~= nil then
        self.LeftOrRight = false
        self.RightSpine:GetComponent("SkeletonAnimation").state:SetAnimation(0,"sd-gj",false)
    end
end

function M:AllRest()
    self.LeftSpine:GetComponent("SkeletonAnimation").state:SetAnimation(0,"dj",true)
    self.RightSpine:GetComponent("SkeletonAnimation").state:SetAnimation(0,"dj",true)
end

function M:OnClose()
    PVPViewModel.Continue_PVP_Result = {}
    Event.Remove("FreshPVPSweepResult",Handle(self,self.FreshPVPSweepResult))
    Event.Remove("OpenSkip",Handle(self,self.OpenSkip))
    Event.Remove("LeftAtk",Handle(self,self.LeftAtk))
    Event.Remove("RightAtk",Handle(self,self.RightAtk))
    Event.Remove("AllRest",Handle(self,self.AllRest))
    MgrTimer.Cancel("ShowSweepingResult")
    Event.Remove("FreshPVESweepResult",Handle(self,self.FreshPVESweepResult))
    Event.Remove("CompleteSweep",Handle(self,self.CompleteSweep))
    self.firstShow = false
end

return M