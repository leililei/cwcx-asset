-- Code Auto Create Begin
local M = Class('ViewRecord_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ViewRecord_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ViewRecord_UI].prefab'
    self.Name = 'Form[ViewRecord_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','BlurBg',2},{'DetailPanel','DetailPanel',2},{'Img_Tanchuangdi3','DetailPanel/Img_Tanchuangdi3',2},{'Img_Wangdianyou','DetailPanel/Img_Tanchuangdi3/Img_Wangdianyou',2},{'Img_Wangdianzuo','DetailPanel/Img_Tanchuangdi3/Img_Wangdianzuo',2},{'aijisilogo','DetailPanel/Img_Tanchuangdi3/aijisilogo',2},{'Img_Sanjiaoxian2','DetailPanel/Img_Tanchuangdi3/Img_Sanjiaoxian2',2},{'Img_Sanjiaoxian1','DetailPanel/Img_Tanchuangdi3/Img_Sanjiaoxian1',2},{'Img_VS','DetailPanel/Img_VS',2},{'Img_Zhenrongdi','DetailPanel/LeftRoot/Img_Zhenrongdi',2},{'Img_gezidi','DetailPanel/LeftRoot/Img_gezidi',2},{'Left_18','DetailPanel/LeftRoot/LeftRootLayout/Left_18',2},{'Left_15','DetailPanel/LeftRoot/LeftRootLayout/Left_15',2},{'Left_12','DetailPanel/LeftRoot/LeftRootLayout/Left_12',2},{'Left_9','DetailPanel/LeftRoot/LeftRootLayout/Left_9',2},{'Left_6','DetailPanel/LeftRoot/LeftRootLayout/Left_6',2},{'Left_3','DetailPanel/LeftRoot/LeftRootLayout/Left_3',2},{'Left_17','DetailPanel/LeftRoot/LeftRootLayout/Left_17',2},{'Left_14','DetailPanel/LeftRoot/LeftRootLayout/Left_14',2},{'Left_11','DetailPanel/LeftRoot/LeftRootLayout/Left_11',2},{'Left_8','DetailPanel/LeftRoot/LeftRootLayout/Left_8',2},{'Left_5','DetailPanel/LeftRoot/LeftRootLayout/Left_5',2},{'Left_2','DetailPanel/LeftRoot/LeftRootLayout/Left_2',2},{'Left_16','DetailPanel/LeftRoot/LeftRootLayout/Left_16',2},{'Left_13','DetailPanel/LeftRoot/LeftRootLayout/Left_13',2},{'Left_10','DetailPanel/LeftRoot/LeftRootLayout/Left_10',2},{'Left_7','DetailPanel/LeftRoot/LeftRootLayout/Left_7',2},{'Left_4','DetailPanel/LeftRoot/LeftRootLayout/Left_4',2},{'Left_1','DetailPanel/LeftRoot/LeftRootLayout/Left_1',2},{'Img_Zhenrongdi(1)','DetailPanel/RightRoot/Img_Zhenrongdi (1)',2},{'Img_gezidi(1)','DetailPanel/RightRoot/Img_gezidi (1)',2},{'Right_3','DetailPanel/RightRoot/RightRootLayout/Right_3',2},{'Right_6','DetailPanel/RightRoot/RightRootLayout/Right_6',2},{'Right_9','DetailPanel/RightRoot/RightRootLayout/Right_9',2},{'Right_12','DetailPanel/RightRoot/RightRootLayout/Right_12',2},{'Right_15','DetailPanel/RightRoot/RightRootLayout/Right_15',2},{'Right_18','DetailPanel/RightRoot/RightRootLayout/Right_18',2},{'Right_2','DetailPanel/RightRoot/RightRootLayout/Right_2',2},{'Right_5','DetailPanel/RightRoot/RightRootLayout/Right_5',2},{'Right_8','DetailPanel/RightRoot/RightRootLayout/Right_8',2},{'Right_11','DetailPanel/RightRoot/RightRootLayout/Right_11',2},{'Right_14','DetailPanel/RightRoot/RightRootLayout/Right_14',2},{'Right_17','DetailPanel/RightRoot/RightRootLayout/Right_17',2},{'Right_1','DetailPanel/RightRoot/RightRootLayout/Right_1',2},{'Right_4','DetailPanel/RightRoot/RightRootLayout/Right_4',2},{'Right_7','DetailPanel/RightRoot/RightRootLayout/Right_7',2},{'Right_10','DetailPanel/RightRoot/RightRootLayout/Right_10',2},{'Right_13','DetailPanel/RightRoot/RightRootLayout/Right_13',2},{'Right_16','DetailPanel/RightRoot/RightRootLayout/Right_16',2},{'Img_Fangshoudi','DetailPanel/DefPlayerNameBg/Img_Fangshoudi',2},{'DefIcon','DetailPanel/DefPlayerNameBg/DefIcon',2},{'Img_Jinggongdi','DetailPanel/AtkPlayerNameBg/Img_Jinggongdi',2},{'AtkIcon','DetailPanel/AtkPlayerNameBg/AtkIcon',2},{'BtnLeft','DetailPanel/BtnLeft',2},{'BtnRight','DetailPanel/BtnRight',2},{'Btn_Confirm','Btn_Confirm',2},{'Img_Quedingdi','Btn_Confirm/Img_Quedingdi',2},{'Btn_ViewRecord','Btn_ViewRecord',2},{'Img_Guankanzuozhandi','Btn_ViewRecord/Img_Guankanzuozhandi',2},{'Img_Shunxudi','Tog_ShowOrder/Img_Shunxudi',2},{'Img_Jiao(hui)','Tog_ShowOrder/Img_Jiao(hui)',2},{'Img_Jiao(cheng)','Tog_ShowOrder/Img_Jiao(cheng)',2},{'Img_Shengfudi','ResultPanel/Img_Shengfudi',2},
        -- UITemplate 列表
        {'ViewRecordRoleItem','DetailPanel/ViewRecordRoleItem',10},
        -- Toggle 列表
        {'Tog_ShowOrder','Tog_ShowOrder',13},
        -- RawImage 列表
        {'Tog_ShowOrder01','Tog_ShowOrder',15},
        -- TextMeshProUGUI 列表
        {'Text_DefScore','DetailPanel/DefPlayerNameBg/Text_DefScore',20},{'Text_DefName','DetailPanel/DefPlayerNameBg/Text_DefName',20},{'Text_Fangshoufang','DetailPanel/DefPlayerNameBg/Text_Fangshoufang',20},{'Text_AtkScore','DetailPanel/AtkPlayerNameBg/Text_AtkScore',20},{'Text_AtkName','DetailPanel/AtkPlayerNameBg/Text_AtkName',20},{'Text_Jinggongfang','DetailPanel/AtkPlayerNameBg/Text_Jinggongfang',20},{'Text_Queding','Btn_Confirm/Text_Queding',20},{'Text_Guankanzuozhan','Btn_ViewRecord/Text_Guankanzuozhan',20},{'Text_Shunxu','Tog_ShowOrder/Text_Shunxu',20},{'Text_Result','ResultPanel/Node/Text_Result',20},{'Text_Time','ResultPanel/Node/Text_Time',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---注册遮罩点击
    UIEvent.LuaClick(self.BlurBg().gameObject,function()
        ---关闭界面
        self:OnCloseSelf()
        BattleViewModel.isLeftWin = false
        PVPViewModel.ClearViewRecords();
    end)
    ---注册顺序显隐点击
    Tools.ToggleValueChange(self.Tog_ShowOrder(),function(isOn)
        for i, item in pairs(self.RoleList) do
            local order = item.transform:Find("Order").gameObject
            order:SetActive(isOn)
        end
    end,nil)
    --- 开始回放
    UIEvent.LuaClick(self.Btn_ViewRecord().gameObject,function()
        ---补全角色信息
        for i, role in pairs(BattleManager.AllRole) do
            if role.IsLeft == true then
                CAnimation.SetRoleData(role.myAni,role.GameID,role.PosX,role.PosY,role.IsLeft,0,role.HPmax)
            end
        end
        BattleManager.GameStart_LuatoC(function()
            ---video整理进FightVideo
            BattleViewModel.GeneVideo(self.m_data.video)
        end)
        ---关闭界面
        BattleManager.ClearLuaData()
        self:OnCloseSelf()
        PVPViewModel.IsViewRecord = true

        MgrTimer.AddDelayNoName(0.1,function()
            BattleManager.GameMode = BattleManager.GameModeType.PVP
            PVPViewModel.OpenBattleUI()
        end,nil)
    end)
    --- 确认
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        ---关闭界面
        self:OnCloseSelf()
        BattleViewModel.isLeftWin = false
        PVPViewModel.ClearViewRecords();
    end)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    -- 大师赛有两场的逻辑
    UIEvent.LuaClick(self.BtnLeft().gameObject, Handle(self, self.OnBtnLeftClicked));
    UIEvent.LuaClick(self.BtnRight().gameObject, Handle(self, self.OnBtnRightClicked));
    if PVPViewModel.GetViewRecordsCount() > 1 then
        self.BtnLeft().gameObject:SetActive(true);
        self.BtnRight().gameObject:SetActive(true);
    else
        self.BtnLeft().gameObject:SetActive(false);
        self.BtnRight().gameObject:SetActive(false);
    end
end
function M:OnShow(pData)
    self:Refresh(pData);
end
function M:Refresh(pData)
    self.m_data = pData;
    ---@type RoleData[]
    local atkList = {}
    ---@type RoleData[]
    local defList = {}
    self.Text_Time().text = PVPViewModel.CuRecordTime
    if PVPViewModel.GetViewRecordsCount() > 1 then
        self.AtkIcon().gameObject:SetActive(false);
        self.DefIcon().gameObject:SetActive(false);
    else
        self.AtkIcon().gameObject:SetActive(true);
        self.DefIcon().gameObject:SetActive(true);
    end
    if PVPViewModel.PlayerIsAtk then
        self.Text_AtkName().text = PVPViewModel.OwnInfo.name
        self.Text_DefName().text = PVPViewModel.TargetInfo.name
        if PVPViewModel.GetViewRecordsCount() > 1 then
            self.Text_AtkScore().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.OwnInfo.score;
            self.Text_DefScore().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.TargetInfo.score;
            if self.m_data.result == 2 then
                self.Text_Result().text = PVPViewModel.OwnInfo.name .. MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")
            else
                self.Text_Result().text = PVPViewModel.TargetInfo.name .. MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")
            end
        else
            self.Text_AtkScore().text =MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.OwnInfo.score
            local name = self:IconName(PVPViewModel.OwnInfo.rankLevel)
            MgrRes.LoadSprite(self.AtkIcon(),"Level/" .. name)
            self.Text_DefScore().text =MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.TargetInfo.score
            local defName = self:IconName(PVPViewModel.TargetInfo.rankLevel)
            MgrRes.LoadSprite(self.DefIcon(),"Level/" .. defName)
            if self.m_data.result == 2 then   --胜利
                self.Text_Result().text = MgrLanguageData.GetLanguageByKey("viewrecord_ui_victory") .. PVPViewModel.RecordResult.winScore
            else
                self.Text_Result().text = MgrLanguageData.GetLanguageByKey("pvprecorditem_fail") .. "<color=#FE295D>" .. PVPViewModel.RecordResult.winScore .. "</color>"
            end
        end
        atkList = PVPViewModel.OwnTeam
        defList = PVPViewModel.TargetTeam
        if self.m_data.result == 2 then   --胜利
            BattleViewModel.isLeftWin = true
        else
            BattleViewModel.isLeftWin = false
        end
    else
        self.Text_AtkName().text = PVPViewModel.TargetInfo.name
        self.Text_DefName().text = PVPViewModel.OwnInfo.name
        if PVPViewModel.GetViewRecordsCount() > 1 then
            self.Text_AtkScore().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.TargetInfo.score;
            self.Text_DefScore().text = MgrLanguageData.GetLanguageByKey("masterpvp_ui13_text1") .. PVPViewModel.OwnInfo.score;
            if self.m_data.result == 2 then
                self.Text_Result().text = PVPViewModel.TargetInfo.name .. MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")
            else
                self.Text_Result().text = PVPViewModel.OwnInfo.name .. MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")
            end
        else
            self.Text_AtkScore().text =MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.TargetInfo.score
            local name = self:IconName(PVPViewModel.TargetInfo.rankLevel)
            MgrRes.LoadSprite(self.AtkIcon(),"Level/" .. name)
            self.Text_DefScore().text =MgrLanguageData.GetLanguageByKey("pvppause_ui_score")..PVPViewModel.OwnInfo.score
            local name = self:IconName(PVPViewModel.OwnInfo.rankLevel)
            MgrRes.LoadSprite(self.DefIcon(),"Level/" .. name)
            if self.m_data.result == 2 then
                self.Text_Result().text = MgrLanguageData.GetLanguageByKey("pvprecorditem_fail") .. "<color=#FE295D>" .. PVPViewModel.RecordResult.losScore .. "</color>"
            else
                self.Text_Result().text = MgrLanguageData.GetLanguageByKey("viewrecord_ui_victory") .. PVPViewModel.RecordResult.losScore
            end
        end
        atkList = PVPViewModel.TargetTeam
        defList = PVPViewModel.OwnTeam
        if self.m_data.result == 2 then
            BattleViewModel.isLeftWin = false
        else
            BattleViewModel.isLeftWin = true
        end
    end
    ---清空实例列表
    self.RoleList = {}
    for i = 1, 18 do
        Tools.ClearAllChild(self["Left_" .. i]().gameObject);
        Tools.ClearAllChild(self["Right_" .. i]().gameObject);
    end
    for i, v in ipairs(atkList) do
        local x = math.floor((v.index - 1) / 3)
        local y = (v.index - 1) % 3
        ---拼接节点名
        local parentName = "Left_"..(x * 3 + (3 - y))
        ---创建角色头像
        local item = GameObject.Instantiate(self.ViewRecordRoleItem().gameObject,self[parentName]().transform,false)
        ---设置0坐标
        item.transform.localPosition = Vector3.zero
        ---设置参数
        if PVPViewModel.PlayerIsAtk then
            --我方    判断技能等级要看自己的装备背包
            item:GetComponent("UITemplate"):SetData({v,i,true})
        else
            --敌方
            item:GetComponent("UITemplate"):SetData({v,i})
        end
        ---保存实例
        self.RoleList[#self.RoleList + 1] = item
    end
    for i, v in ipairs(defList) do
        local x = math.floor((v.index - 1) / 3)
        local y = (v.index - 1) % 3
        ---拼接节点名
        local parentName = "Right_"..(x * 3 + (3 - y))
        ---创建角色头像
        local item = GameObject.Instantiate(self.ViewRecordRoleItem().gameObject,self[parentName]().transform,false)
        ---设置0坐标
        item.transform.localPosition = Vector3.zero
        ---设置参数
        if PVPViewModel.PlayerIsAtk then
            --敌方
            item:GetComponent("UITemplate"):SetData({v,i})
        else
            --我方    判断技能等级要看自己的装备背包
            item:GetComponent("UITemplate"):SetData({v,i,true})
        end
        ---保存实例
        self.RoleList[#self.RoleList + 1] = item
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        self:OnCloseSelf()
        PVPViewModel.ClearViewRecords();
    end
end
---关闭界面
function M:OnCloseSelf()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

function M:IconName(rankLevel)
    local rank = PVPViewModel.GetPvPRank(rankLevel)
    return rank[3]
end

function M:OnBtnLeftClicked()
    PVPViewModel.ViewNextRecord(Handle(self, self.Refresh));
end

function M:OnBtnRightClicked()
    PVPViewModel.ViewNextRecord(Handle(self, self.Refresh));
end

return M