---@class FightFloorView:FightViewBase 战斗地板
local M = Class("FightFloorView",FightViewBase)

function M:OnInit()
    ---@type FloorData
    self.data = self.args
    MgrRes.GetPrefab(self.data.path,Handle(self,self.SetPos))
    ---地板特效
    self.OccEffGo = nil
end
function M:OnReload()
end
function M:OnClose()
end

function M:SetPos(obj)
    self.obj = obj
    obj.transform:SetParent(self.objRoot.transform)
    obj.transform.localPosition = self.data.posV3
    if self.data.isLeft then
        obj.transform.name = self.data.posName .. "_" .. tostring(self.data.y) .. "_" .. tostring(self.data.x)
    else
        obj.transform.name = self.data.posName .. "_" .. tostring(self.data.y) .. "_" .. tostring(7 - self.data.x)
    end
    --if self.fightType < FightEnum.FightType.normal then
    --    Log.Error("当前战斗类型不存在，请检查")
    --    return
    --end
    --if self.fightType == FightEnum.FightType.normal then
    --    ---重置左右地板位置
    --    ---显示左右地板
    --elseif self.fightType == FightEnum.FightType.boss then
    --    ---关闭右侧地板
    --elseif self.fightType == FightEnum.FightType.pvp then
    --    ---重置左右地板位置
    --    ---显示左右地板
    --    ---关闭右侧地板
    --elseif self.fightType == FightEnum.FightType.novice then
    --    ---重置左右地板位置
    --    ---显示左右地板
    --end
end

---开启连线
function M:StartSelLine(targetGo,isRed)
    if FightGlobal.liningTarget then    --正在连线
        return
    end
    if FightGlobal.targetLined == nil then
        return
    end
    ---结束掉之前的连线
    self:EndSelLine()
    ---连线目标
    FightGlobal.targetLined = targetGo
    ---开始连线
    if self.obj.activeSelf then
        self:SelLine(targetGo,isRed)
    end

end
function M:SelLine(targetGo,isRed)
    local line
    local dot
    local dot2
    if (isRed) then
        line = MgrBattle.GetFloorEff(FightEnum.FloorType.LINE_RED)
        dot = MgrBattle.GetFloorEff(FightEnum.FloorType.DOT_RED)
        dot2 = MgrBattle.GetFloorEff(FightEnum.FloorType.DOT_RED2)
    else
        line = MgrBattle.GetFloorEff(FightEnum.FloorType.LINE_YELLOW)
        dot = MgrBattle.GetFloorEff(FightEnum.FloorType.DOT_YELLOW)
        dot2 = MgrBattle.GetFloorEff(FightEnum.FloorType.DOT_YELLOW2)
    end
    local endV3 = targetGo.transform.localPosition
    local startV3 = self.obj.transform.localPosition
    local durationPos = endV3 - startV3
    local endScale_X = durationPos.magnitude / 225
    local toV3 = Vector3(durationPos.x, 0, durationPos.z)
    local angle = Vector3.Angle(durationPos, toV3)

    dot:SetActive(true)
    dot.transform.position = Vector3(self.obj.transform.position.x, self.obj.transform.position.y, self.obj.transform.position.z - 1);
    dot.transform.localRotation = Quaternion.Euler(0, 0, angle);

    line:SetActive(true)
    line.transform.position = Vector3(self.obj.transform.position.x, self.obj.transform.position.y, self.obj.transform.position.z - 1);
    line.transform:LookAt(endV3)
    CMgrBattle.Instance:DoScaleX(line,endScale_X,FightGlobal.Line_Time,function()
        dot2:SetActive(true)
        dot2.transform.position = Vector3(self.obj.transform.position.x, self.obj.transform.position.y, self.obj.transform.position.z - 1);
        dot2.transform.localRotation = Quaternion.Euler(0, 0, angle);
        FightGlobal.liningTarget = false
    end)
end
---结束连线
function M:EndSelLine()

end

---按职业类型显示地板
function M:ShowFloorWithType(Type)
    if self.OccEffGo~=nil then
        GameObject.Destroy(self.OccEffGo)
        self.OccEffGo = nil
    end
    if Type == FightEnum.Occupation.HEAVY then        --重装
        self.OccEffGo = MgrBattle.GetFloorEff(FightEnum.FloorType.BOX_FANGWEI, true)
    elseif Type == FightEnum.Occupation.NIMBLE then   --攻击
        self.OccEffGo = MgrBattle.GetFloorEff(FightEnum.FloorType.BOX_GONGJI, true)
    elseif Type == FightEnum.Occupation.MYSTICAL then --法师
        self.OccEffGo = MgrBattle.GetFloorEff(FightEnum.FloorType.BOX_HUOLI, true)
    elseif Type == FightEnum.Occupation.HELPER then   --支援
        self.OccEffGo = MgrBattle.GetFloorEff(FightEnum.FloorType.BOX_ZHIYUAN, true)
    elseif Type == FightEnum.beAtkType.BE_ATK then
        self.OccEffGo = MgrBattle.GetFloorEff(FightEnum.FloorType.BOX_RED, true)
    elseif Type == FightEnum.beAtkType.BE_SUPPORT then
        self.OccEffGo = MgrBattle.GetFloorEff(FightEnum.FloorType.BOX_YELLOW, true)
    else                           --空地板
        self.obj:GetComponent("SpriteRenderer").color = Color(1,1,1,1)
    end
    if self.OccEffGo then
        self.OccEffGo.transform.localPosition = Vector3.zero
        self.OccEffGo.transform.localRotation = Quaternion.zero
    end
end

return M