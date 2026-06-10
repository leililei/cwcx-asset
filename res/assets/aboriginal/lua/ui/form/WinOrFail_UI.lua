-- Code Auto Create Begin
local M = Class('WinOrFail_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WinOrFail_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WinOrFail_UI].prefab'
    self.Name = 'Form[WinOrFail_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'yuan1','WinOrFailRoot/yuan1',2},{'zhezhao','WinOrFailRoot/zhezhao',2},{'dian2','WinOrFailRoot/dian2',2},{'yuan3','WinOrFailRoot/yuanroot/yuan3',2},{'yuan2','WinOrFailRoot/yuanroot/yuan3/yuan2',2},{'yuan101','WinOrFailRoot/yuanroot/yuan3/yuan1',2},{'guang','WinOrFailRoot/yuanroot/guang',2},{'yuan','WinOrFailRoot/yuan',2},{'DEFECT','WinOrFailRoot/DEFECT',2},{'VICTORY','WinOrFailRoot/VICTORY',2},
    }
end
-- Code Auto Create End
function M:OnInit()
    CJNBattleMgr.SetGameSpeed(1)
    self.Ani = self.ObjRoot:GetComponent("Animator")
end
---1胜利/失败，2回调，3延时通知（不传为3能完整播完动画）
function M:OnShow(pData)
    local isWin = pData[1]
    local callback = pData[2]
    local delay = pData[3] or 3
    if BattleManager.GameMode == BattleManager.GameModeType.PVP and not PVPViewModel.PlayerIsAtk then
        isWin = not isWin
    end
    ---显示特效
    if isWin then
        --- 胜利
        self.Ani:SetTrigger("WIN")
        MgrSound.PlayEffect("yx_ui_win",1,1000,false,0,0,"yx_ui_win")
    else
        --- 失败
        self.Ani:SetTrigger("LOSE")
        MgrSound.PlayEffect("yx_ui_lose",1,1000,false,0,0,"yx_ui_lose")
    end
    ---检查界面
    local uiFrom = MgrUI.GetCurUI()
    if uiFrom.Uid == UID.Battle02_UI or uiFrom.Uid == UID.WorldBossBattle_UI then
        ---若在战斗界面则关闭人物信息
        uiFrom:ShowRoleInfo()
    end
    ---通知回调
    MgrTimer.AddDelayNoName(delay,function()
        if callback then
            callback()
        end
        CJNBattleMgr.SetGameSpeed(1)
        ---关闭特效
        MgrUI.ClosePop(UID.WinOrFail_UI)
    end)
end
return M