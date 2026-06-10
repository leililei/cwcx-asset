-- Code Auto Create Begin
local M = Class('PvPStartPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PvPStartPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PvPStartPop_UI].prefab'
    self.Name = 'Form[PvPStartPop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'beijing','PvPRoot/beijing',2},{'LihuiPanel','PvPRoot/LihuiPanel',2},{'AtkMask','PvPRoot/LihuiPanel/AtkMask',2},{'AtkLihuiRoot','PvPRoot/LihuiPanel/AtkMask/AtkLihuiRoot',2},{'DefMask','PvPRoot/LihuiPanel/DefMask',2},{'DefLihuiRoot','PvPRoot/LihuiPanel/DefMask/DefLihuiRoot',2},{'UI_Canvas','PvPRoot/UI_Canvas',2},{'zhezhao2','PvPRoot/UI_Canvas/zhezhao2',2},{'zhezhao','PvPRoot/UI_Canvas/zhezhao',2},{'Btn_ClickClose','PvPRoot/UI_Canvas/Btn_ClickClose',2},{'dian2','PvPRoot/UI_Canvas/vs/dian2',2},{'yuan3','PvPRoot/UI_Canvas/vs/yuan3',2},{'yuan2','PvPRoot/UI_Canvas/vs/yuan3/yuan2',2},{'yuan1','PvPRoot/UI_Canvas/vs/yuan3/yuan1',2},{'dian1','PvPRoot/UI_Canvas/vs/yuan3/dian1',2},{'guang','PvPRoot/UI_Canvas/vs/guang',2},{'vs','PvPRoot/UI_Canvas/vs/vs',2},{'AtkPlayerInfoPanel','PvPRoot/UI_Canvas/AtkPlayerInfoPanel',2},{'di','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/di',2},{'hong','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/di/hong',2},{'sanjiao1','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/di/sanjiao1',2},{'AtkPlayerRankIconImg','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/di/AtkPlayerRankIconImg',2},{'iddi(zuo)','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/name/iddi(zuo)',2},{'DefPlayerInfoPanel','PvPRoot/UI_Canvas/DefPlayerInfoPanel',2},{'di01','PvPRoot/UI_Canvas/DefPlayerInfoPanel/di',2},{'lan','PvPRoot/UI_Canvas/DefPlayerInfoPanel/di/lan',2},{'sanjiao2','PvPRoot/UI_Canvas/DefPlayerInfoPanel/di/sanjiao2',2},{'DefPlayerRankIconImg','PvPRoot/UI_Canvas/DefPlayerInfoPanel/di/DefPlayerRankIconImg',2},{'iddi(you)','PvPRoot/UI_Canvas/DefPlayerInfoPanel/name/iddi(you)',2},
        -- TextMeshProUGUI 列表
        {'AtkPlayerRankGoalText','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/di/AtkPlayerRankGoalText',20},{'PlayerRankGoalTip','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/di/PlayerRankGoalTip',20},{'AtkPlayerNameText','PvPRoot/UI_Canvas/AtkPlayerInfoPanel/name/AtkPlayerNameText',20},{'PlayerRankGoalTip01','PvPRoot/UI_Canvas/DefPlayerInfoPanel/di/PlayerRankGoalTip',20},{'DefPlayerRankGoalText','PvPRoot/UI_Canvas/DefPlayerInfoPanel/di/DefPlayerRankGoalText',20},{'DefPlayerNameText','PvPRoot/UI_Canvas/DefPlayerInfoPanel/name/DefPlayerNameText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---------------------初始化信息------------------------------
    -- UIEvent.LuaClick(self.Btn_ClickClose().gameObject, Handle(self, function ()
    --     MgrUI.ClosePop(UID.PvPStartPop)
    -- end))
    Event.Clear("ClosePVPStartPop")
    Event.Add("ClosePVPStartPop",function ()
        Tools.SetAnimatorTrigger(self.ObjRoot,"EndLoadPVP")
    end)
end

function M:OnUpdateUI()
    MgrCamera.BackToDefaultPosition()
    ---设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 5
    self:InitPvPStartPanel()
end

function M:InitPvPStartPanel()
    if PVPViewModel.GetViewRecordsCount() > 1 then
        self.di().gameObject:SetActive(false);
        self.di01().gameObject:SetActive(false);
    else
        self.di().gameObject:SetActive(true);
        self.di01().gameObject:SetActive(true);
    end
    --- 更新玩家昵称
    if PVPViewModel.PlayerIsAtk then
        self.AtkPlayerNameText().text=PVPViewModel.OwnInfo.name
        self.DefPlayerNameText().text=PVPViewModel.TargetInfo.name
        if BattleManager.GameMode == BattleManager.GameModeType.PVP then
            self.AtkPlayerRankGoalText().text = PVPViewModel.OwnInfo.score
            self.DefPlayerRankGoalText().text = PVPViewModel.TargetInfo.score
            if PVPViewModel.GetViewRecordsCount() <= 1 then
                self.DefPlayerRankIconImg().gameObject:SetActive(true)
                self.AtkPlayerRankIconImg().gameObject:SetActive(true)
                MgrRes.LoadSprite(self.DefPlayerRankIconImg(),self:GetRankIcon(PVPViewModel.TargetInfo.rankLevel))
                MgrRes.LoadSprite(self.AtkPlayerRankIconImg(),self:GetRankIcon(PVPViewModel.OwnInfo.rankLevel))
            else
                self.DefPlayerRankIconImg().gameObject:SetActive(false)
                self.AtkPlayerRankIconImg().gameObject:SetActive(false)
            end
            self.PlayerRankGoalTip().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text62")
            self.PlayerRankGoalTip01().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text62")
        else
            self.AtkPlayerRankGoalText().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text35")
            self.DefPlayerRankGoalText().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text34")
            self.PlayerRankGoalTip().text = ""
            self.PlayerRankGoalTip01().text = ""
            self.DefPlayerRankIconImg().gameObject:SetActive(false)
            self.AtkPlayerRankIconImg().gameObject:SetActive(false)
        end
    else
        if BattleManager.GameMode == BattleManager.GameModeType.PVP then
            self.AtkPlayerNameText().text = PVPViewModel.TargetInfo.name
            self.DefPlayerNameText().text = PVPViewModel.OwnInfo.name
            self.AtkPlayerRankGoalText().text = PVPViewModel.OwnInfo.score
            self.DefPlayerRankGoalText().text = PVPViewModel.TargetInfo.score
            if PVPViewModel.GetViewRecordsCount() <= 1 then
                self.DefPlayerRankIconImg().gameObject:SetActive(true)
                self.AtkPlayerRankIconImg().gameObject:SetActive(true)
                MgrRes.LoadSprite(self.DefPlayerRankIconImg(),self:GetRankIcon(PVPViewModel.TargetInfo.rankLevel))
                MgrRes.LoadSprite(self.AtkPlayerRankIconImg(),self:GetRankIcon(PVPViewModel.OwnInfo.rankLevel))
            else
                self.DefPlayerRankIconImg().gameObject:SetActive(false)
                self.AtkPlayerRankIconImg().gameObject:SetActive(false)
            end
            self.PlayerRankGoalTip().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text62")
            self.PlayerRankGoalTip01().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text62")
        else
            self.AtkPlayerNameText().text = PVPViewModel.OwnInfo.name
            self.DefPlayerNameText().text = PVPViewModel.TargetInfo.name
            self.AtkPlayerRankGoalText().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text35")
            self.DefPlayerRankGoalText().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text34")
            self.PlayerRankGoalTip().text = ""
            self.PlayerRankGoalTip01().text = ""
            self.DefPlayerRankIconImg().gameObject:SetActive(false)
            self.AtkPlayerRankIconImg().gameObject:SetActive(false)
        end
    end
    --更新玩家立绘信息
    MgrTimer.AddDelayNoName(0,Handle(self,self.InitPVPBattleInfo),nil)
end

function M:GetRankIcon(rankLevel)
    local PVPData = PVPViewModel.GetPvPRank(rankLevel)
    return "Level/".. PVPData[3]
end
--更新Spine信息
function M:CreatSpine(_RoleId,_Root,_IsAtk)
    local _tempSpineInfo={}
    local _tempSpineInfo2={}
    local posData = CharactercoordinatesLocalData.tab[_RoleId]
    if _IsAtk == true then
        -- 攻击方左侧
        _tempSpineInfo=JNStrTool.strSplit(";",posData.coordinate3)
    else
        _tempSpineInfo=JNStrTool.strSplit(";",posData.coordinate4)
    end
    _tempSpineInfo2=JNStrTool.strSplit(",",_tempSpineInfo[1])
    local _SpinePosX=_tempSpineInfo2[1]
    local _SpinePosY=_tempSpineInfo2[2]
    local _SpineScale=_tempSpineInfo[2]
    local _SpineFlip=_tempSpineInfo[3]
    MgrRes.LoadWatch3DSpineInUI(_Root, _RoleId, _SpinePosX, _SpinePosY, _SpineScale, nil, function(obj)
        self.SpineObj = obj
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder + 1,"Default")

        end
        if _SpineFlip ~= "0" then
            obj.transform.localRotation = Quaternion(0,180,0,0)
        end
    end)
end

---更新双方PVP信息
function M:InitPVPBattleInfo()
    if PVPViewModel.PlayerIsAtk then
        MgrRes.LoadHDIcon_OriginalSize(self.AtkLihuiRoot(), PVPViewModel.OwnTeam[1].skin);
        Global.SetCoordinate(self.AtkLihuiRoot(), CharactercoordinatesLocalData.tab[PVPViewModel.OwnTeam[1].skin].coordinate3);
        MgrRes.LoadHDIcon_OriginalSize(self.DefLihuiRoot(), PVPViewModel.TargetTeam[1].skin);
        Global.SetCoordinate(self.DefLihuiRoot(), CharactercoordinatesLocalData.tab[PVPViewModel.TargetTeam[1].skin].coordinate4);
    else
        MgrRes.LoadHDIcon_OriginalSize(self.AtkLihuiRoot(), PVPViewModel.TargetTeam[1].skin);
        Global.SetCoordinate(self.AtkLihuiRoot(), CharactercoordinatesLocalData.tab[PVPViewModel.TargetTeam[1].skin].coordinate3);
        MgrRes.LoadHDIcon_OriginalSize(self.DefLihuiRoot(), PVPViewModel.OwnTeam[1].skin);
        Global.SetCoordinate(self.DefLihuiRoot(), CharactercoordinatesLocalData.tab[PVPViewModel.OwnTeam[1].skin].coordinate4);
    end
    MgrTimer.AddDelayNoName(2.2,Handle(self,self.StartBattle),nil)
end

---前往PVP战斗界面（开战）
function M:StartBattle()
    --MgrUI.GoFirst(UID.PVPBattle_UI)
    MgrUI.GoFirst(UID.Battle02_UI)
end

return M