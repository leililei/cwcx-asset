---@class FightEffectView:FightViewBase 战斗特效
local M = Class("FightEffectView",FightViewBase)
function M:OnInit()
    ---@type EffectFightData
    self.info = self.args
    ---@type FightRoleView 攻击方
    self.atkRole = MgrBattle.GetRoleByUid(self.info.AktRoleUid)
    ---@type FightRoleView 受击方
    self.hitRole = MgrBattle.GetRoleByUid(self.info.HitRoleUid)
    ---飞行开关
    self.isFlying = false
    ---当前面向
    self.faceTo = nil
    ---起点数值
    self.startPos = Vector3.zero
    ---终点数值
    self.endPos = Vector3.zero
    ---角度
    self.rot = Vector3.zero
    ---飞行剩余时间,时间到后停止飞行
    self.flyTime = 0
    self.flyTime_half = 0
    self.flySpeedZ_timeReal = 0
    ---实际飞行速度
    self.flySpeed_real = 0
    ---飞行速度x
    self.flySpeed_x = 0
    ---飞行速度y
    self.flySpeed_y = 0
    ---飞行速度z
    self.flySpeed_z = 0
    ---创建特效实例
    self:CreateEffect()
end
function M:OnReload()
end
function M:OnPause()
    MgrTimer.Pause(TID.FIGHT_EFFECT_UPDATE..self.info.uid)
    MgrTimer.Pause(TID.FIGHT_EFFECT_AUTO_DEL..self.info.uid)
end
function M:OnResume()
    MgrTimer.Resume(TID.FIGHT_EFFECT_UPDATE..self.info.uid)
    MgrTimer.Resume(TID.FIGHT_EFFECT_AUTO_DEL..self.info.uid)
end
function M:OnClose()
    MgrTimer.Cancel(TID.FIGHT_EFFECT_UPDATE..self.info.uid)
    MgrTimer.Cancel(TID.FIGHT_EFFECT_AUTO_DEL..self.info.uid)
end
---初始化特效
function M:CreateEffect()
    if self.info.HitRoleUid == nil then
        return
    end

    local recordEffect = false
    ---判断是否buff特效 如果是buff 判断有无同类型的  删除的时候按照类型去删除
    if self.info.TimerType == FightEnum.EffectTimeType.BUFF then
        ---判断类型2 ,然后去受击者身上找同类型 如果有则次数+1 如果没有 生成特效文件, 保存类型
        if self.hitRole.info.isWorldBoss then
            return
        end
        ---@type FightEffectView 获取目标buff
        local buffGo = self.hitRole.buffEffectGoList[self.info.BuffType]
        if buffGo ~= nil then
            ---若不为空则创建过，只增加次数并移除本特效
            buffGo.info.CreateCount = buffGo.info.CreateCount + 1
            MgrBattle.DelEffect(self.info.uid)
            return
        end
        recordEffect = true
    end
    ---创建特效,目前只右两种在用
    if self.info.EffectType == FightEnum.EffectType.U3D then
    elseif self.info.EffectType == FightEnum.EffectType.VIDEO then
        MgrRes.GetPrefab(self.info.pName,function(obj)
            if obj == nil then
                Log.Error("目标："..self.info.pName..",特效不存在")
                return
            end
            self.effectGo = obj
            if recordEffect then
                ---如果是buff类型，挂到目标角色身上
                obj.transform:SetParent(self.hitRole.roleGo.transform)
                ---添加到目标角色数据里
                self.hitRole.buffEffectGoList[self.info.BuffType] = self
            else
                ---挂到默认特效节点上
                obj.transform:SetParent(self.objRoot.transform)
            end
            ---设置大小
            obj.transform.localScale = self.info.LocScale
            ---隐藏,播放时打开
            obj:SetActive(false)
            self:SetLayer(9)
        end)
    end
end

---设置登场特效 ,死亡特效播放等跟随
function M:SetFollowAni(action)
    ---设置跟随
    self.effectGo.transform:SetParent(self.atkRole.roleGo.transform)
    self.effectGo.transform.localPosition = Vector3.zero
    ---添加到角色对应特效对象缓存
    if action == FightEnum.AniType.FLY_0 then
        table.insert(self.atkRole.flyInEffectGoList,self)
    elseif action == FightEnum.AniType.DIE then
        table.insert(self.atkRole.dieEffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    elseif action == FightEnum.AniType.PASS then
        table.insert(self.atkRole.passEffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    elseif action == FightEnum.AniType.HIT then
        table.insert(self.atkRole.hitEffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    elseif action == FightEnum.AniType.ATK_0 then
        table.insert(self.atkRole.atk0EffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    elseif action == FightEnum.AniType.PD_0 then
        table.insert(self.atkRole.PD0EffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    elseif action == FightEnum.AniType.PD_1 then
        table.insert(self.atkRole.PD1EffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    elseif action == FightEnum.AniType.HC_1 then
        table.insert(self.atkRole.HC1EffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    elseif action == FightEnum.AniType.HC_2 then
        table.insert(self.atkRole.HC2EffectGoList,self)
        self.info.TimerType = FightEnum.EffectTimeType.FOLLOW_ACTION
    end
end
---获取播放时长
function M:GetEffectLife()
    local delay = self.info.Delay
    if self.info.FlyType == FightEnum.EffectFlyType.NORMAL then
        delay = delay + self.info.endTime
    else
        self:AnalysisPos()
        delay = delay + self.flyTime
    end
    return delay
end
---播放特效
function M:Play()
    ---这里的预处理没用什么用，逻辑完整不会出现泄露特效的情况，逻辑完整后可以删除
    if self.effectGo == nil then
        ---若特效已被销毁删除
        MgrBattle.DelEffect(self.info.uid)
        return
    elseif self.atkRole == nil then
        ---若无使用者删除
        MgrBattle.DelEffect(self.info.uid)
    end

    ---若与此特效相关者为boss调整特效层级防挡
    if self.atkRole.info.isWorldBoss or self.hitRole.info.isWorldBoss then
        Tools.SetParticleLayer(self.effectGo,10)
    end
    ---延迟小于0.001 Cri的延迟播放会失效
    if self.info.Sound_delay > 0.001 or self.info.Delay > 0.001 then
        ---开启延迟播放
        self.effectGo:SetActive(false)
        ---延迟播放音效
        if self.info.Sound ~= "0" then
            local soundDelay = (self.info.Sound_delay + self.info.Delay) * 1000
            MgrSound.PlayFightLap(self.info.Sound,1,soundDelay)
        end
        ---延迟播放特效
        MgrTimer.AddDelay(TID.FIGHT_EFFECT_PLAY..self.info.uid,self.info.Delay,function()
            self:PlayEffect()
        end,nil)
    else
        ---直接播放
        if self.info.Sound ~= "0" then
            ---播放音效
            MgrSound.PlayFightLap(self.info.Sound)
        end
        ---播放特效
        self:PlayEffect()
    end
    ---部分特效无法通过active开关来重新播放，故直接删掉特效重新创建，后面的xd有空可以改改
end
---显示特效
function M:Show()
    if self.info.EffectType == FightEnum.EffectType.DB then
        ---DB特效废弃
    elseif self.info.EffectType == FightEnum.EffectType.SPINE then
        ---Spine特效废弃
    elseif self.info.EffectType == FightEnum.EffectType.U3D then
        self.effectGo:SetActive(false)
        self.effectGo:SetActive(true)
    end
    if self.info.FlyType == FightEnum.EffectFlyType.NORMAL then
        self.isFlying = false
    else
        self.isFlying = true
    end
end
---隐藏特效
function M:Hide()
    self.effectGo:SetActive(false)
end
---播放特效
function M:PlayEffect()
    ---让受击者变黑(当前版本没使用)
    self:HitBlack()
    ---开启自动销毁
    self:AutoDestroy()
    ---分析pos
    self:AnalysisPos()
    ---设置位置
    self:SetBeginPos()
    ---设置方向
    self:SetFaceTo()
    ---根据摄像机设置面向
    self:SetLookAtCamera()
    ---显示特效
    self:Show()
    ---开启循环
    MgrTimer.AddUpdate(TID.FIGHT_EFFECT_UPDATE..self.info.uid,0,function(deltaTime)
        if self.isFlying then
            self:Flying(deltaTime)
        end
    end,-1,nil)
end
---自动销毁
function M:AutoDestroy()
    ---只启动默认、攻击、受击特效的自动销毁
    if self.info.TimerType == FightEnum.EffectTimeType.ATK or self.info.TimerType == FightEnum.EffectTimeType.HIT or self.info.TimerType == FightEnum.EffectTimeType.NORMAL then
        if self.info.FlyType == FightEnum.EffectFlyType.NORMAL then
            MgrTimer.AddDelay(TID.FIGHT_EFFECT_AUTO_DEL..self.info.uid,self.info.endTime,function()
                ---移除特效
                MgrBattle.DelEffect(self.info.uid)
            end)
        end
    end
end

---分析位置
function M:AnalysisPos()
    if self.info.EffectType == FightEnum.EffectType.VIDEO then
        ---视频不计算位置
        return
    end
    ---获取面向
    self.faceTo = self.atkRole:GetFaceTo()
    ---获取角度
    self.rot = Vector3(
            self.info.Rot.x,
            self.info.Rot.y,
            self.info.Rot.z
    )
    ---当前位置
    local v3 = self.atkRole.roleGo.transform.position
    local sv3 = self.info.StartPos
    ---计算起点 byCJNEffectShow.cs : 1092
    if self.info.StartBone ~= nil then
        ---若是BONE节点位置为起点
        self.startPos = self.atkRole:GetBone(self.info.StartBone).transform.position
    else
        ---计算配置起点
        self.startPos = Vector3(
                v3.x + sv3.x * self.faceTo,
                v3.y + sv3.y,
                v3.z + sv3.z
        )
    end
    ---计算配置终点 byCJNEffectShow.cs : 1151 此处并未使用配置中BONE作为终点，请自行查看并修正
    sv3 = self.info.EndPos
    ---在CJNEffectShow.cs : 1155码中对这里V3乘了8 ，问题是C#那边初始化时已*8过，此处请验证是否还需*8
    ---lua未对数据里的StartPos及EndPos再乘8，而是还原到按照配置数值走的，请与策划商量写死还是读配置后修改
    self.endPos = Vector3(
            v3.x + sv3.x * self.faceTo * FightGlobal.EffectScale,
            v3.y + sv3.y * FightGlobal.EffectScale,
            v3.z + sv3.z
    )

    ---根据距离/速度=时间 byCJNEffectShow.cs :1206 此处计算看着有点问题，请自行查看并修正
    if self.flyTime < 0.1 then
        self.flyTime = 0.1
    end
    local range = self.endPos.x - self.startPos.x
    self.flySpeed_real = math.abs(range/self.flyTime)
    self.flySpeed_x = range/self.flyTime
    self.flySpeed_y = (self.endPos.y - self.startPos.y) / self.flyTime
    self.flySpeed_z = (self.endPos.z - self.startPos.z) / self.flyTime
    if self.info.FlyType == FightEnum.EffectFlyType.CURVE then
        ---路程/时间=速度
        self.flySpeed_real = self.flySpeed_y * FightGlobal.EffectScale / self.flyTime
        self.flyTime_half = self.flyTime / 2
    elseif self.info.FlyType == FightEnum.EffectFlyType.SINE then
        ---完成一个波长需要的时间 路程/波长
        self.flySpeedZ_timeReal = range / (self.flySpeed_z * FightGlobal.EffectScale)
        self.flyTime_half = self.flySpeedZ_timeReal * FightGlobal.EffectScale / 2
    end
end
---设置起始位置
function M:SetBeginPos()
    if self.info.EffectType == FightEnum.EffectType.VIDEO then
        ---视频不设置位置
        return
    end
    if self.info.StartBone ~= nil then
        ---BONE起点,将特效绑定到对应节点(主要是BOSS在用)
        self.effectGo.transform:SetParent(self.atkRole:GetBone(self.info.StartBone).transform)
        self.effectGo.transform.localPosition = Vector3.zero
    else
        ---将位置设到起点
        self.effectGo.transform.position = self.startPos
    end
end
---设置面向
function M:SetFaceTo()
    local size = 1
    ---根据目标配置大小缩放特效
    --if self.atkRole.roleGo.transform.localScale.x > self.hitRole.roleGo.transform.localScale.x then
    --    size = "byCJNEffectShow.cs : 191"
    --else
    --    size = "byCJNEffectShow.cs : 195"
    --end
    if self.info.TimeScal > 0.9 then
        self:SetScale(self.info.LocScale.x * size,self.info.LocScale.y * size,self.info.LocScale.z * size)
        if self.faceTo < 0 then
            self.rot.y = self.info.Rot.y + 180
        else
            self.rot.y = self.info.Rot.y
        end
        self:SetRot(self.rot.x,self.rot.y,self.rot.z)
    else
        if self.faceTo < 0 and self.atkRole.info.isWorldBoss == false then
            self:SetScale(self.info.LocScale.x * size * -1,self.info.LocScale.y * size,self.info.LocScale.z * size)
        else
            self:SetScale(self.info.LocScale.x * size,self.info.LocScale.y * size,self.info.LocScale.z * size)
        end
        self:SetRot(self.rot.x,self.rot.y,self.rot.z)
    end
end
---根据摄像机距离设置面向
function M:SetLookAtCamera()

end
---设置缩放
function M:SetScale(x ,y ,z)
    if self.info.EffectType == FightEnum.EffectType.VIDEO then
        ---视频不设置位置
        return
    end
    if self.info.StartBone ~= nil then
        ---若是绑定骨骼的，额外缩放
        self.effectGo.transform.localScale = Vector3(x / FightGlobal.EffectScale, y / FightGlobal.EffectScale, z / FightGlobal.EffectScale)
    else
        ---正常缩放
        self.effectGo.transform.localScale = Vector3(x,y,z)
    end
end
---设置角度
function M:SetRot(x ,y ,z)
    self.effectGo.transform.localRotation = Quaternion(x,y,z)
end
---受击者变黑
function M:HitBlack()
    ---启用后自行填充逻辑 byCJNEffectShow.cs : 1003
    ---检查变黑时间
    ---调用受击者变黑函数
end
---飞行
function M:Flying(deltaTime)
    local _pos = self.effectGo.transform.position
    if self.info.FlyType == FightEnum.EffectFlyType.NORMAL then
    elseif self.info.FlyType == FightEnum.EffectFlyType.SPIN then
        self.effectGo.transform.position = Vector3(
                _pos.x + self.flySpeed_x * deltaTime,
                _pos.y + self.flySpeed_y * deltaTime,
                _pos.z + self.flySpeed_z * deltaTime
        )
        --self.effectGo.transform:Rotate(0,0,self.info.FlySpeed * 360 * deltaTime)
    elseif self.info.FlyType == FightEnum.EffectFlyType.CURVE then
        local _speedY
        if self.flyTime > self.flyTime_half then
            _speedY = self.flySpeed_real * (self.flyTime - self.flyTime_half) / self.flyTime_half
        else
            _speedY = -self.flySpeed_real * (self.flyTime_half - self.flyTime) / self.flyTime_half
        end
        self.effectGo.transform.position = Vector3(
                _pos.x + self.flySpeed_x * deltaTime,
                _pos.y + self.flySpeed_y * deltaTime,
                _pos.z + self.flySpeed_z * deltaTime
        )
        _pos = self.effectGo.transform.position
        self.effectGo.transform.position = Vector3(
                _pos.x,
                _pos.y + _speedY * deltaTime,
                _pos.z
        )
    elseif self.info.FlyType == FightEnum.EffectFlyType.LINE then
        self.effectGo.transform.position = Vector3(
                _pos.x + self.flySpeed_x * deltaTime,
                _pos.y + self.flySpeed_y * deltaTime,
                _pos.z + self.flySpeed_z * deltaTime
        )
    elseif self.info.FlyType == FightEnum.EffectFlyType.SINE then
        self.effectGo.transform.position = Vector3(
                _pos.x + self.flySpeed_x * deltaTime,
                _pos.y + self.flySpeed_y * deltaTime,
                _pos.z + self.flySpeed_z * deltaTime
        )
        _pos = self.effectGo.transform.position
        self.effectGo.transform.position = Vector3(
                _pos.x,
                _pos.y * FightGlobal.EffectScale * math.sin(_pos.x - self.startPos.x) / FightGlobal.EffectScale * (2 * math.pi / 0), ---最后的0之前该是self.info.FlySpeed.z]]
                _pos.z
        )
    end
    self.flyTime = self.flyTime - deltaTime
    if self.flyTime < 0 then
        self.isFlying = false
        ---移除特效
        MgrBattle.DelEffect(self.info.uid)
        return
    end
end
return M