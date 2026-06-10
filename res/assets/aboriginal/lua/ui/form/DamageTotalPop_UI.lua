-- Code Auto Create Begin
local M = Class('DamageTotalPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DamageTotalPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DamageTotalPop_UI].prefab'
    self.Name = 'Form[DamageTotalPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Img_xian1','Img_Tanchuangdi/Img_xian1',2},{'Img_xian2','Img_Tanchuangdi/Img_xian2',2},{'Btn_Back','Img_Tanchuangdi/Btn_Back',2},{'Img_Biaotixian','Img_Tanchuangdi/Img_Biaotixian',2},{'Img_di1','Img_Tanchuangdi/JifangPanel/Img_di1',2},{'RoleDamageScroll_Left','Img_Tanchuangdi/JifangPanel/RoleDamageScroll_Left',2},{'Img_di2','Img_Tanchuangdi/DifangPanel/Img_di2',2},{'RoleDamageScroll_Right','Img_Tanchuangdi/DifangPanel/RoleDamageScroll_Right',2},
        -- UITemplate 列表
        {'RoleDamageItem','Img_Tanchuangdi/JifangPanel/RoleDamageScroll_Left/RoleDamageItem',10},{'RoleDamageItem01','Img_Tanchuangdi/DifangPanel/RoleDamageScroll_Right/RoleDamageItem',10},
        -- LoopScrollRect 列表
        {'RoleDamageScroll_Left01','Img_Tanchuangdi/JifangPanel/RoleDamageScroll_Left',18},{'RoleDamageScroll_Right01','Img_Tanchuangdi/DifangPanel/RoleDamageScroll_Right',18},
        -- TextMeshProUGUI 列表
        {'Text_Fanhui','Img_Tanchuangdi/Btn_Back/Text_Fanhui',20},{'Text_Biaoti1','Img_Tanchuangdi/Text_Biaoti1',20},{'Text_Paiming_Left','Img_Tanchuangdi/JifangPanel/Text_Paiming_Left',20},{'Text_Paiming_Right','Img_Tanchuangdi/DifangPanel/Text_Paiming_Right',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
end

function M:OnShow(pData)
    self.ImOnTheLeft = pData[1]
    self.TotalDamage = BattleViewModel.DamageTotal
    self.LeftTeam = BattleManager.LeftTeam
    self.RightTeam = {}
    if BattleManager.FirstRightTeam ~= nil and #BattleManager.FirstRightTeam ~= nil then
        for i,v in pairs(BattleManager.FirstRightTeam) do
            self.RightTeam[i] = v
        end
        if BattleManager.hasSecondBattle then
            local len = #BattleManager.FirstRightTeam
            local idx = 1
            for i,v in pairs(BattleManager.RightTeam) do
                self.RightTeam[idx+len] = v
                idx = idx + 1
            end
        end
    else
        self.RightTeam = BattleManager.RightTeam
    end
    self:ResortInfo()
    self:InitUIText()
    self:InitScroll()
end

function M:ResortInfo()
    self.resortDamage = {}
    self.RightTeamDamage = {}
    self.LeftTeamDamage = {}
    self.RightTeamDamageTotal = 0
    self.LeftTeamDamageTotal = 0
    self.RightTeamDamageTotalPercent = {}
    self.LeftTeamDamageTotalPercent = {}
    ---伤害分为两组
    for i ,v in pairs(self.TotalDamage) do
        self.resortDamage[i] = v
    end
    for i ,v in pairs(self.RightTeam) do
        self.RightTeamDamage[v.GameID] = self.resortDamage[v.GameID]
    end
    for i ,v in pairs(self.LeftTeam) do
        self.LeftTeamDamage[v.GameID] = self.resortDamage[v.GameID]
    end
    ---伤害百分比
    for i ,v in pairs(self.RightTeamDamage) do
        self.RightTeamDamageTotal = self.RightTeamDamageTotal + self.RightTeamDamage[i]
    end
    for i ,v in pairs(self.RightTeam) do
        if self.RightTeamDamage[v.GameID] ~= nil and self.RightTeamDamageTotal ~= 0 then
            self.RightTeamDamageTotalPercent[v.GameID] = math.abs(self.RightTeamDamage[v.GameID]) / math.abs(self.RightTeamDamageTotal) * 100
        else
            self.RightTeamDamageTotalPercent[v.GameID] = 0
        end
    end
    for i ,v in pairs(self.LeftTeamDamage) do
        self.LeftTeamDamageTotal = self.LeftTeamDamageTotal + self.LeftTeamDamage[i]
    end
    for i ,v in pairs(self.LeftTeam) do
        if self.LeftTeamDamage[v.GameID] ~= nil and self.LeftTeamDamageTotal ~= 0 then
            self.LeftTeamDamageTotalPercent[v.GameID] = math.abs(self.LeftTeamDamage[v.GameID]) / math.abs(self.LeftTeamDamageTotal) * 100
        else
            self.LeftTeamDamageTotalPercent[v.GameID] = 0
        end
    end
end

function M:InitUIText()
    if BattleManager.GameMode ~= BattleManager.GameModeType.PVP then --非PVP
        ---左边队伍名
        self.Text_Paiming_Left().text = PlayerControl.GetPlayerData().nickname .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")..")"
        ---右边队伍名
        self.Text_Paiming_Right().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text83") .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")..")"
    else
        if not PVPViewModel.IsViewRecord then    --PVP战斗
            if BattleManager.PvPModelWinOrLose then
                ---左边队伍名
                self.Text_Paiming_Left().text = PVPViewModel.OwnInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")..")"
                ---右边队伍名
                self.Text_Paiming_Right().text = PVPViewModel.TargetInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")..")"
            else
                ---左边队伍名
                self.Text_Paiming_Left().text = PVPViewModel.OwnInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")..")"
                ---右边队伍名
                self.Text_Paiming_Right().text = PVPViewModel.TargetInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")..")"
            end
        else    --PVP回放
            if PVPViewModel.PlayerIsAtk
            then
                if PVPViewModel.RecordResult.result == 2 then
                    ---左边队伍名
                    self.Text_Paiming_Left().text = PVPViewModel.OwnInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")..")"
                    ---右边队伍名
                    self.Text_Paiming_Right().text = PVPViewModel.TargetInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")..")"
                else
                    ---左边队伍名
                    self.Text_Paiming_Left().text = PVPViewModel.OwnInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")..")"
                    ---右边队伍名
                    self.Text_Paiming_Right().text = PVPViewModel.TargetInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")..")"
                end
            else
                if PVPViewModel.RecordResult.result == 2 then
                    ---左边队伍名
                    self.Text_Paiming_Left().text = PVPViewModel.TargetInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")..")"
                    ---右边队伍名
                    self.Text_Paiming_Right().text = PVPViewModel.OwnInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")..")"
                else
                    ---左边队伍名
                    self.Text_Paiming_Left().text = PVPViewModel.TargetInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")..")"
                    ---右边队伍名
                    self.Text_Paiming_Right().text = PVPViewModel.OwnInfo.name .. "("..MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")..")"
                end
            end
        end
    end
end

function M:InitScroll()
    ---左边队伍
    self.RoleDamageScroll_Left01().totalCount = #self.LeftTeam
    self.newLeftTeamDamage = {}
    for i,v in pairs(self.LeftTeam) do
        table.insert(self.newLeftTeamDamage,{ id = v.GameID, dmg = 0 })
    end
    for i,v in pairs(self.LeftTeamDamage) do
        for idx,val in pairs(self.newLeftTeamDamage) do
            if val.id == i then
                val.dmg = v
                break
            end
        end
    end
    table.sort(self.newLeftTeamDamage, self.SortDamage)
    self.newleftTeam = {}
    for i,v in pairs(self.newLeftTeamDamage) do
        for idx,val in pairs(self.LeftTeam) do
            if v.id == val.GameID then
                table.insert(self.newleftTeam,val)
                break
            end
        end
    end
    self.newLeftTeamDamageTotalPercent = {}
    for i,v in ipairs(self.newLeftTeamDamage) do
        for idx,val in pairs(self.LeftTeamDamageTotalPercent) do
            if idx == v.id then
                table.insert(self.newLeftTeamDamageTotalPercent,val)
                break
            end
        end
    end


    self.RoleDamageScroll_Left01():SetLuaCellEvent(Handle(self,self.RoleDamageScroll_LeftCellItem))
    self.RoleDamageScroll_Left01():RefillCells(0)
    ---右边队伍
    self.RoleDamageScroll_Right01().totalCount = #self.RightTeam

    self.newRightTeamDamage = {}
    for i,v in pairs(self.RightTeam) do
        table.insert(self.newRightTeamDamage,{ id = v.GameID, dmg = 0 })
    end
    for i,v in pairs(self.RightTeamDamage) do
        for idx,val in pairs(self.newRightTeamDamage) do
            if val.id == i then
                val.dmg = v
                break
            end
        end
    end
    table.sort(self.newRightTeamDamage, self.SortDamage)
    self.newRightTeam = {}
    for i,v in pairs(self.newRightTeamDamage) do
        for idx,val in pairs(self.RightTeam) do
            if v.id == val.GameID then
                table.insert(self.newRightTeam,val)
                break
            end
        end
    end
    self.newRightTeamDamageTotalPercent = {}
    for i,v in ipairs(self.newRightTeamDamage) do
        for idx,val in pairs(self.RightTeamDamageTotalPercent) do
            if idx == v.id then
                table.insert(self.newRightTeamDamageTotalPercent,val)
                break
            end
        end
    end

    self.RoleDamageScroll_Right01():SetLuaCellEvent(Handle(self,self.RoleDamageScroll_RightCellItem))
    self.RoleDamageScroll_Right01():RefillCells(0)
end

function M.SortDamage(a, b)
    return a.dmg > b.dmg;
end

function M:RoleDamageScroll_LeftCellItem(trans,idx)
    --trans:GetComponent("UITemplate"):SetData({self.LeftTeam[idx],self.LeftTeamDamage[self.LeftTeam[idx].GameID],self.LeftTeamDamageTotalPercent[self.LeftTeam[idx].GameID], idx,self.ImOnTheLeft})
    trans:GetComponent("UITemplate"):SetData({self.newleftTeam[idx],self.newLeftTeamDamage[idx],self.newLeftTeamDamageTotalPercent[idx], idx,self.ImOnTheLeft})
end
function M:RoleDamageScroll_RightCellItem(trans,idx)
    --trans:GetComponent("UITemplate"):SetData({self.RightTeam[idx],self.RightTeamDamage[self.RightTeam[idx].GameID],self.RightTeamDamageTotalPercent[self.RightTeam[idx].GameID], idx,not self.ImOnTheLeft})
    trans:GetComponent("UITemplate"):SetData({self.newRightTeam[idx],self.newRightTeamDamage[idx],self.newRightTeamDamageTotalPercent[idx], idx,not self.ImOnTheLeft})
end
function M:OnBackKey()
    local tab = {"BattlePause_UI","PVPPause_UI","PVPComplete_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
function M:OnClose()
    self.TotalDamage = nil
    self.LeftTeam = nil
    self.RightTeam = nil
end

return M