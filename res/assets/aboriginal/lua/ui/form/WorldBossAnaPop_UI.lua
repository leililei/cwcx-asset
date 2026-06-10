-- Code Auto Create Begin
local M = Class('WorldBossAnaPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WorldBossAnaPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WorldBossAnaPop_UI].prefab'
    self.Name = 'Form[WorldBossAnaPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Xian1','Img_Xian1',2},{'Img_Xian2','Img_Xian2',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Img_di','Img_Tanchuangdi/Img_di',2},{'Img_Biaotixian','Img_Tanchuangdi/Img_Biaotixian',2},{'Btu_AnaJoin1','Img_Tanchuangdi/Btu_AnaJoin/Btu_AnaJoin1',2},{'AnaWorldBossItem','Img_Tanchuangdi/BossScroll/AnaWorldBossItem',2},{'Img_Select','Img_Tanchuangdi/Img_Select',2},
        -- Button 列表
        {'Btu_AnaJoin','Img_Tanchuangdi/Btu_AnaJoin',4},
        -- UITemplate 列表
        {'AnaWorldBossItem01','Img_Tanchuangdi/BossScroll/AnaWorldBossItem',10},
        -- RawImage 列表
        {'Btu_AnaJoin01','Img_Tanchuangdi/Btu_AnaJoin',15},{'BossScroll','Img_Tanchuangdi/BossScroll',15},
        -- LoopScrollRect 列表
        {'BossScroll01','Img_Tanchuangdi/BossScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Moni','Img_Tanchuangdi/Text_Moni',20},{'Text_Tishi2','Img_Tanchuangdi/Text_Tishi2',20},{'Text_Monikaishi','Img_Tanchuangdi/Btu_AnaJoin/Btu_AnaJoin1/Text_Monikaishi',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    Event.Add("WBScroll", Handle(self, self.ScrollRefresh))
    ---注册关闭窗口
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        StormViewModel.CurStormAnaBossId_Monster = 0
        BattleManager.GameMode = 0
        self:ClosePop()
    end)
    ---注册开始模拟
    UIEvent.LuaClick(self.Btu_AnaJoin1().gameObject,function()
        ---判断活动是否还开着
        local data = ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId)
        if data == nil or not Global.isMiddleTime(data.beginTime,data.endTime) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),1},true)
            return
        end
        if BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
            StormViewModel.OpenWorldBossBattle(true)
        else
            ---获取Boss数据
            local data = ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId)
            ---检查是否在开放时间内
            if not data:CheckUnlock() then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("worldboss_ui_tips1"),1},true)
                return
            end
            ---检查是否存在剩余次数
            if data.count >= tonumber(SteamLocalData.tab[109000][2]) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("worldboss_ui_tips2"),1},true)
                return
            end
            ---进入战斗页
            StormViewModel.OpenWorldBossBattle(false)
        end
        self:ClosePop()
    end)
    ---注册滑块
    self.BossScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    ---刷新滑块
    self:ReloadBossView(true)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

---更新显示
function M:OnShow(args)
    if BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
        self.Text_Moni().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text74")
        self.Text_Monikaishi().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text76")
    else
        self.Text_Moni().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text42")
        self.Text_Monikaishi().text = MgrLanguageData.GetLanguageByKey("ui_formation_text5")
    end
end
---排名滑块回调
function M:CellItem(trans,idx)
    ---刷新item
    trans:GetComponent("UITemplate"):SetData({self.pointList[idx],self,idx})
end
---排名滑块刷新
function M:ReloadBossView(isOnce)
    ---刷新滑块
    local scroll = self.BossScroll01()
    self.pointList = EventRaidControl.GetLIANHETAOFAData().BossData
    scroll.totalCount = #self.pointList
    if BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
        ---默认选择第一个boss
        --StormViewModel.CurStormAnaBossId_Monster = self.pointList[BattleManager.CurBossLevel].id
        if isOnce then
            ---默认选择第一个boss
            BattleManager.CurBossLevel = 1
            StormViewModel.CurStormAnaBossId_Monster = self.pointList[BattleManager.CurBossLevel].id
            ---首次全刷新
            scroll:RefillCells(0)
        else
            ---之后不变位置刷新
            scroll:RefreshCells()
        end
    else
        ---默认选择第一个boss
        --StormViewModel.CurStormBossId_Monster = self.pointList[BattleManager.CurBossLevel].id
        if isOnce then
            ---默认选择第一个boss
            BattleManager.CurBossLevel = 1
            StormViewModel.CurStormBossId_Monster = self.pointList[BattleManager.CurBossLevel].id
            ---首次全刷新
            scroll:RefillCells(0)
        else
            ---之后不变位置刷新
            scroll:RefreshCells()
        end
    end

end

function M:ScrollRefresh()
    self.BossScroll01():RefreshCells()
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.CheckClear("WBScroll")
    MgrUI.ClosePop(self.Uid)
end
return M