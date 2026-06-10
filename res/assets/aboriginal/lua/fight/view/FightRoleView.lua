---@class FightRoleView:FightViewBase 战斗角色
local M = Class("FightRoleView",FightViewBase)

---默认spine大小
local normal_spine_scale = 20
---阴影路径
local foot_path = "ABOriginal/Prefab/Fight/RoleFoot.prefab"
---攻击顺序图标路径
local atkOrder_path = "ABOriginal/Prefab/Fight/AtkOrder.prefab"
local orderIcon_blue = "Role/Style/TeamBlue_B"
local orderIcon_red = "Role/Style/TeamRed_B"
local orderIcon_yellow = "Role/Style/TeamYellow_B"

function M:OnInit()
    ---@type RoleFightData
    self.info = self.args
    ---spine对象
    self.roleGo = nil
    ---spineSkeleton组件
    self.roleSke = nil
    ---阴影对象
    self.footGo = nil
    ---顺序图标对象
    self.orderGo = nil
    ---死亡特效
    self.deadGo = nil
    ---蓄力特效
    self.atk0Go = nil
    ---上次状态
    self.lastAction = FightEnum.AniType.NONE
    ---当前目标
    self.selRole = nil

    ---@type FightEffectView[] buff特效<buff类型,buff对象>
    self.buffEffectGoList = {}
    ---@type FightEffectView[]登场特效池
    self.flyInEffectGoList = {}
    ---@type FightEffectView[]死亡特效池
    self.dieEffectGoList = {}
    ---@type FightEffectView[]眩晕特效池
    self.passEffectGoList = {}
    ---@type FightEffectView[]受击特效池
    self.hitEffectGoList = {}
    ---@type FightEffectView[]蓄力特效池
    self.atk0EffectGoList = {}
    ---@type FightEffectView[]PD_0特效池
    self.PD0EffectGoList = {}
    ---@type FightEffectView[]PD_1特效池
    self.PD1EffectGoList = {}
    ---@type FightEffectView[]HC_1特效池
    self.HC1EffectGoList = {}
    ---@type FightEffectView[]HC_2特效池
    self.HC2EffectGoList = {}
    ---@type number[] 所有攻击动画时间<string,float> 动画名，时间
    self.SpineAniTimeList = {}
    ---Spine攻击动画时间
    self.SpineAtkAniTime = nil
    ---Spine受击动画时间
    self.SpineHitAniTime = nil

    ---创建角色实例
    self:CreateSelf()
end
function M:OnReload()
end
---暂停
function M:OnPause()
    MgrTimer.Pause(TID.FIGHT_BOSS_DEAD ..self.info.uid)
    MgrTimer.Pause(TID.FIGHT_DEAD_BOOM ..self.info.uid)
    MgrTimer.Pause(TID.FIGHT_DEAD ..self.info.uid)
    MgrTimer.Pause(TID.FIGHT_ROLE_FLY_IN..self.info.uid)
    MgrTimer.Pause(TID.FIGHT_ROLE_FLY_End..self.info.uid)
end
function M:OnResume()
    MgrTimer.Resume(TID.FIGHT_BOSS_DEAD ..self.info.uid)
    MgrTimer.Resume(TID.FIGHT_DEAD_BOOM ..self.info.uid)
    MgrTimer.Resume(TID.FIGHT_DEAD ..self.info.uid)
    MgrTimer.Resume(TID.FIGHT_ROLE_FLY_IN..self.info.uid)
    MgrTimer.Resume(TID.FIGHT_ROLE_FLY_End..self.info.uid)
end
function M:OnClose()
    MgrTimer.Cancel(TID.FIGHT_BOSS_DEAD ..self.info.uid)
    MgrTimer.Cancel(TID.FIGHT_DEAD_BOOM ..self.info.uid)
    MgrTimer.Cancel(TID.FIGHT_DEAD ..self.info.uid)
    MgrTimer.Cancel(TID.FIGHT_ROLE_FLY_IN..self.info.uid)
    MgrTimer.Cancel(TID.FIGHT_ROLE_FLY_End..self.info.uid)
end
---创建角色
function M:CreateSelf()
    ---创建Spine
    MgrRes.LoadFightSpine(self.objRoot,self.info.id,Vector3(0,0,0),normal_spine_scale * self.info.qZoom,function(go)
        self.roleGo = go
        self.roleSke = go.transform:GetComponent("SkeletonAnimation")
        ---生成阴影
        MgrRes.GetPrefab(foot_path,function(foot)
            foot.transform:SetParent(go.transform)
            foot.transform.localPosition = Vector3.zero
            self.footGo = foot
        end)
        ---生成顺序图标
        MgrRes.GetPrefab(atkOrder_path,function(order)
            order.transform:SetParent(go.transform)
            order.transform.localPosition = Vector3.zero
            self.orderGo = order
            self.orderBg = order.transform:GetChild(0)
            self.orderTxt = self.orderBg.transform:GetChild(0):GetComponent("TextMeshProUGUI")
            self.orderLine = self.orderTxt.transform:GetComponent("Outline")
        end)
        ---获取Spine所有动画时间
        self:GetSpineAniTime()
        ---设置层级
        self:SetLayer(9)
        ---创建登场特效
        self:CreateEffect()
        ---设置登场动画参数
        self:BeginInFly()
        ---给role赋值攻击顺序
        self.info:SetOrder(FightGlobal.GetAtkOrder(self.info.isLeft))
        ---还原role透明度
        --self:SetAlpha(1)
        ---设置位置
        self:SetRolePos()
        -----添加到左侧队列(不需要了，左右队列在棋盘里去找，获取所有角色到MgrBattle角色缓存池去找)
        --BattleManager.LeftTeamAdd(role)
        -----飞行进场
        self:FlyIn() --    --role.myAni:UIFlayIn(0.55)
    end)
end

---设置攻击顺序图标
function M:SetOrder(order)
    if self.info.isWorldBoss then
        return
    end
    if order < 0 then
        MgrRes.LoadSprite(self.orderBg,orderIcon_yellow)
        self.orderLine.effectColor = Color(255,201,0,1)
        self.orderTxt.text = "?"
    elseif order == 1 then
        MgrRes.LoadSprite(self.orderBg,orderIcon_red)
        self.orderLine.effectColor = Color(219,67,67,1)
        self.orderTxt.text = order
    else
        MgrRes.LoadSprite(self.orderBg,orderIcon_blue)
        self.orderLine.effectColor = Color(0,65,255,1)
        self.orderTxt.text = order
    end
end
---设置攻击顺序图标位置
function M:SetAtkOrderPos(isLeft, isBottom)
    if isBottom then
        self.orderGo.transform.localPosition = Vector3(0,30,0)
    else
        self.orderGo.transform.localPosition = isLeft and Vector3(-10, 60, 0) or Vector3(10, 60, 0)
    end
end
---显示/隐藏攻击顺序
function M:SetOrderActive(active)
    self.orderGo:SetActive(active)
end
---更新角色状态
function M:ChangeState(action, loop)
    if self.info.isDead == true then
        ---已死亡的角色不再触发动画
        return
    end

    if self.lastAction == FightEnum.AniType.WAIT and action == FightEnum.AniType.WAIT then
        ---重复播放待机时不再触发动画
        return
    end

    ---关闭上次行为       byCAnimation:827
    if self.lastAction == FightEnum.AniType.DIE then
        ---隐藏上个死亡特效
        self.HideEffect(self.dieEffectGoList)
    elseif self.lastAction == FightEnum.AniType.HIT then
        ---隐藏上个受击特效
        self.HideEffect(self.hitEffectGoList)
    elseif self.lastAction == FightEnum.AniType.PASS then
        ---隐藏上个眩晕特效
        self.HideEffect(self.passEffectGoList)
    elseif self.lastAction == FightEnum.AniType.PD_0 then
        ---隐藏上个前进0特效
        self.HideEffect(self.PD0EffectGoList)
    elseif self.lastAction == FightEnum.AniType.PD_1 then
        ---隐藏上个前进1特效
        self.HideEffect(self.PD1EffectGoList)
    elseif self.lastAction == FightEnum.AniType.HC_1 then
        ---隐藏上个回撤1特效
        self.HideEffect(self.HC1EffectGoList)
    elseif self.lastAction == FightEnum.AniType.HC_2 then
        ---隐藏上个回撤2特效
        self.HideEffect(self.HC2EffectGoList)
    end

    ---更新本次行为     byCAnimation:884
    if action == FightEnum.AniType.DIE then
        ---更新死亡
        self:Dead()
    elseif action == FightEnum.AniType.HIT then
        ---播放受击特效
        self.PlayEffect(self.hitEffectGoList)
    elseif action == FightEnum.AniType.WAIT then
        ---待机时若是眩晕状态播放眩晕特效
        if self.info.isVertigo == true then
            action = FightEnum.AniType.PASS
            loop = true
            self.PlayEffect(self.passEffectGoList)
        end
    elseif action == FightEnum.AniType.PASS then
        ---播放眩晕，似乎眩晕只会走待机，这里无效
        self.PlayEffect(self.passEffectGoList)
    elseif action == FightEnum.AniType.PD_0 then
        ---前进0
        self.PlayEffect(self.PD0EffectGoList)
    elseif action == FightEnum.AniType.PD_1 then
        ---前进1
        self.PlayEffect(self.PD1EffectGoList)
    elseif action == FightEnum.AniType.HC_1 then
        ---回撤1
        self.PlayEffect(self.PD1EffectGoList)
    elseif action == FightEnum.AniType.HC_2 then
        ---回撤2
        self.PlayEffect(self.PD1EffectGoList)
    end
    ---播放对应动画
    local name = FightGlobal.AniName[action]
    if self.info.isWorldBoss then
        ---BOSS要播放所有对应节点
        Tools.PlaySpineRootAni(self.roleGo,name,loop)
    else
        ---暂无死亡动画不博
        if action ~= FightEnum.AniType.DIE then
            Tools.PlaySpineRootAni(self.roleGo,name,loop)
        end
    end
    ---记录本次行为
    self.lastAction = action
end
---字典保存了所有的动画名和时长，获取攻击时长和受击时长
function M:GetSpineAniTime()
    ---获取所有动画时间
    self.SpineAniTimeList = {}
    local item
    for i = 0, self.roleSke.skeleton.Data.Animations.Items.Length - 1 do
        item = self.roleSke.skeleton.Data.Animations.Items[i]
        self.SpineAniTimeList[item.Name] = item.Duration
    end
    ---获取攻击动画时间
    local aniName = FightGlobal.AniName[FightEnum.AniType.ATK]
    self.SpineAtkAniTime = self.SpineAniTimeList[aniName]
    if self.SpineAtkAniTime == nil then
        ---没获取到再到攻击1获取
        aniName = FightGlobal.AniName[FightEnum.AniType.ATK_1]
        self.SpineAtkAniTime = self.SpineAniTimeList[aniName]
    end
    ---获取受击时间
    aniName = FightGlobal.AniName[FightEnum.AniType.HIT]
    self.SpineHitAniTime = self.SpineAniTimeList[aniName]
end
---创建登场特效
function M:CreateEffect()
    for i, tab in pairs(self.info.debutEffectId) do
        MgrBattle.NewEffect(0,false,self.info.uid,self.info.uid,true ,tab,1,0,FightEnum.AniType.FLY_0)
    end
end
---@param effectList FightEffectView[] 隐藏特效
function M.HideEffect(effectList)
    for i, effect in pairs(effectList) do
        effect:Hide()
    end
end
---@param effectList FightEffectView[] 播放特效
function M.PlayEffect(effectList)
    for i, effect in pairs(effectList) do
        effect:Play()
    end
end
---设置登场飞行参数
function M:BeginInFly()
    --BattleRole.SetFlyIn(battleRole,_delay)
end
---设置Spine透明度
function M:SetAlpha(alpha)
    self.roleSke.skeleton.A = alpha
end
---设置角色位置
function M:SetRolePos()
    ---更新棋盘位置
    if self.info.isLeft then
        ---左侧设置
        FightGlobal.ChessboardLeft[self.info.ChessboardY][self.info.ChessboardX] = self
        ---更新角色实际坐标
        print("位置"..self.info.floorIdx)
        self.roleGo.transform.localPosition = FightGlobal.floorPosLeft[self.info.ChessboardY][self.info.ChessboardX]
        ---通知地板当前所属的角色及职业更新职业图标(后面改为地板自己找)
        --role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
    else
        ---常规右侧设置
        FightGlobal.ChessboardRight[self.info.ChessboardY][7-self.info.ChessboardX] = self
        ---BOSS类型需要单独指定坐标
        if FightGlobal.CurType == FightEnum.Type.BOSS
                or FightGlobal.CurType == FightEnum.Type.NORMAL_BOSS
                or FightGlobal.CurType == FightEnum.Type.WORLD_BOSS
        then
            if self.info.id == 900000 or self.info.id == 600000 then
                ---BOSS实际坐标
                self.roleGo.transform.localPosition = Vector3(155,-200,0)
                self.roleGo.transform.localScale = Vector3(23,23,23)
                self.roleGo.transform:GetChild(0).localScale = Vector3(1,1,1)
            elseif self.info.id == 900001 or self.info.id == 600001 then
                self.roleGo.transform.localPosition = Vector3(288,-136,38)
                self.roleGo.transform.localScale = Vector3(13,13,13)
                self.roleGo.transform:GetChild(0).localScale = Vector3(1,-1,1)
                self.roleGo.transform:GetChild(1).localScale = Vector3(1,1,1)
            elseif self.info.id == 900002 or self.info.id == 600002 then
                self.roleGo.transform.localPosition = Vector3(130,-48,-48)
                self.roleGo.transform.localScale = Vector3(1,1,1)
            end
        else
            print("怪物位置"..self.info.floorIdx)
            ---常规实际坐标
            self.roleGo.transform.localPosition = FightGlobal.floorPosRight[self.info.ChessboardY][self.info.ChessboardX]
        end
        ---通知地板当前所属的角色及职业更新职业图标(后面改为地板自己找)
        --role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
    end

end
---角色死亡
function M:Dead()
    ---退出蓄力
    ---隐藏蓄力特效
    if self.atk0Go and self.info.isWorldBoss == false then
        self.atk0Go:SetActive(false)
    end
    ---隐藏蓄力表特效
    self.HideEffect(self.atk0EffectGoList)
    ---播放死亡音效
    MgrSound.PlayRole(self.info.deadAudio)
    ---还原位置
    if self.info.isLeft then
        self.roleGo.transform.localPosition = FightGlobal.floorPosLeft[self.info.ChessboardY][self.info.ChessboardX]
    else
        self.roleGo.transform.localPosition = FightGlobal.floorPosRight[self.info.ChessboardY][self.info.ChessboardX]
    end
    if self.info.isWorldBoss == true then
        ---世界boss死亡
        ---恢复Spine显示
        self.roleSke.gameObject:SetActive(true)
        ---1.7秒后
        MgrTimer.AddDelay(TID.FIGHT_BOSS_DEAD ..self.info.uid,1.7,function()
            ---隐藏ui

            ---隐藏阴影
            self.footGo:SetActive(false)
            ---隐藏spine
            self.roleGo:SetActive(false)
            ---隐藏血条
        end,nil)
    else
        ---常规死亡
        ---加入死亡对应的root（好像不需要就不需要写对应的死亡节点了byCAnimation:1083）
        ---隐藏Spine
        self.roleGo:SetActive(false)
        ---显示爆炸特效
        MgrBattle.ShowBoom(self.roleGo.transform)
        ---3秒后
        MgrTimer.AddDelay(TID.FIGHT_DEAD_BOOM ..self.info.uid,3,function()
            ---隐藏阴影
            self.footGo:SetActive(false)
            ---隐藏血条
            ---隐藏BuffRoot
            ---2秒后
            MgrTimer.AddDelay(TID.FIGHT_DEAD ..self.info.uid,3,function()
                ---创建死亡特效
                if self.deadGo == nil then
                    MgrRes.GetPrefab(FightGlobal.DeadEffectPath,function(go)
                        go.transform:SetParent(self.roleGo.transform)
                        go.transform.localPosition = Vector3.zero
                        local scale = go.transform.localScale
                        go.transform.localScale = Vector3(scale.x * 3,scale.y * 3,scale.z * 3)
                        Tools.SetLayer(go,9)
                        self.deadGo = go
                    end)
                else
                    self.deadGo:SetActive(true)
                end
                ---隐藏ui

            end)
        end,nil)
    end
    ---设置为死亡
    self.info.isDead = true
    ---更新血量显示

    ---播放死亡特效
    self.PlayEffect(self.dieEffectGoList)
end
---获取角色面向
function M:GetFaceTo()
    if self.info.isLeft then
        return 1
    else
        return -1
    end
end
---获取角色骨骼
function M:GetBone(boneName)
    if self.roleBone == nil then
        ---没有时创建骨骼
        self.roleBone = self.roleGo:AddComponent("SkeletonUtility")
        self.roleBone:SpawnHierarchy(0,true,true,true)
    end
    if boneName then
        ---返回指定名称对象
        return Tools.GetChildByName(self.roleGo, boneName)
    end
    ---返回BONE组件
    return self.roleBone
end
---角色登场
function M:FlyIn(_d)
    local delay = _d or 0
    local flyName = FightGlobal.AniName[FightEnum.AniType.FLY_0]
    MgrTimer.AddDelay(TID.FIGHT_ROLE_FLY_IN..self.info.uid,delay,function()
        MgrSound.PlayRole(self.info.inFlyAudio)
        if self.SpineAniTimeList[flyName] ~= nil then
            ---有dc先播dc
            self:ChangeState(FightEnum.AniType.FLY_0,false)
            local _pos = self.roleGo.transform.localPosition
            local _x = self.info.isLeft and self.info.flyIn_X or -self.info.flyIn_X
            self.roleGo.transform.localPosition = Vector3(
                    _pos.x + _x,
                    _pos.y + self.info.flyIn_Y,
                    _pos.z
            )
            MgrBattle.DoLocalMove(self.roleGo,_pos,self.info.flyIn_Time,self.info.flyIn_Line,function()
                self:ChangeState(FightEnum.AniType.FLY_1,false)
                flyName = FightGlobal.AniName[FightEnum.AniType.FLY_1]
                local _delay = self.SpineAniTimeList[flyName]
                MgrTimer.AddDelay(TID.FIGHT_ROLE_FLY_End..self.info.uid,_delay,function()
                    self:ChangeState(FightEnum.AniType.WAIT,true)
                end,nil)
            end)
        else
            ---无dc直接播dc1
            flyName = FightGlobal.AniName[FightEnum.AniType.FLY_1]
            if self.SpineAniTimeList[flyName] ~= nil then
                self:ChangeState(FightEnum.AniType.FLY_1,false)
                MgrTimer.AddDelay(TID.FIGHT_ROLE_FLY_End..self.info.uid,self.SpineAniTimeList[flyName],function()
                    self:ChangeState(FightEnum.AniType.WAIT,true)
                end,nil)
            else
                ---无dc1直接待机
                self:ChangeState(FightEnum.AniType.WAIT,true)
            end
        end
    end,nil)
end
---结束特效
function M:EndStroke() end
---寻找目标
function M:SelTarget(_tempRolePosY)
    if _tempRolePosY < 1 then
        return
    end
    local tempRolePosY
    if _tempRolePosY ~= nil then
        tempRolePosY = _tempRolePosY
    else
        tempRolePosY = self.info.ChessboardY
    end
    local tempTeam
    local tempChessboard
    if( self.info.attackTarget == 1)--类型为普通,攻击最近的目标
    then
        tempTeam = MgrBattle.ReturnTeam(self.info.isLeft)
        tempChessboard = FightGlobal.ReturnChessboard(not self.info.isLeft)
        --找同一条线的第一个敌人
        --先从棋盘找,然后用对应id找
        local FindTarget = 0 --  0是开始状态 ,1是第二次找目标,2是第三次找目标 -1为找到了
        local TempPosY = tempRolePosY
        for f = 3, 1, -1 do
            for i = 6, 1, -1 do
                --找到敌人跳出循环
                if tempChessboard[TempPosY][i]~=nil and tempChessboard[TempPosY][i]~=0 and tempChessboard[TempPosY][i].info.isDead~=true then
                    self.selRole=tempChessboard[TempPosY][i]
                    FindTarget=-1
                    break
                end
            end
            if FindTarget==-1 then
                break
            end
            FindTarget=FindTarget+1
            ---换行的方法
            TempPosY = self:ChangeLine(tempRolePosY,FindTarget)
        end
    elseif(self.info.attackTarget == 2)--跳过
    then
        tempTeam = MgrBattle.ReturnTeam(self.info.isLeft)
        tempChessboard = FightGlobal.ReturnChessboard(not self.info.isLeft)
        --找同一条线的第一个敌人
        --先从棋盘找,然后用对应id找
        local FindTarget = 0 --  1是开始状态 ,2是第二次找目标,3是第三次找目标 -1为找到了
        local TempPosY = tempRolePosY
        for f = 3, 1, -1 do
            local tempIsFind = false
            for i = 6, 1, -1 do
                --有敌人则直接加入并跳出循环,没有换行
                if tempChessboard[TempPosY][i]~=nil and tempChessboard[TempPosY][i]~=0 and tempChessboard[TempPosY][i].info.isDead~=true then
                    self.selRole=tempChessboard[TempPosY][i]
                    FindTarget=-1  --跳出
                    if tempIsFind then
                        break
                    else
                        tempIsFind=true
                    end
                end
            end
            if FindTarget==-1 then
                break
            end
            FindTarget=FindTarget+1
            ---换行的方法
            TempPosY = self:ChangeLine(tempRolePosY,FindTarget)
        end

    elseif(self.info.attackTarget == 3)--类型为最后面
    then
        tempTeam = MgrBattle.ReturnTeam(self.info.isLeft)
        tempChessboard = FightGlobal.ReturnChessboard(not self.info.isLeft)
        --找同一条线的第一个敌人
        --先从棋盘找,然后用对应id找
        local FindTarget = 0 --  1是开始状态 ,2是第二次找目标,3是第三次找目标 -1为找到了
        local TempPosY = tempRolePosY
        for f = 3, 1, -1 do
            for i = 6, 1, -1 do
                --有敌人则直接加入并跳出循环,没有换行
                if tempChessboard[TempPosY][i]~=nil and tempChessboard[TempPosY][i]~=0 and tempChessboard[TempPosY][i].info.isDead~=true then
                    self.selRole=tempChessboard[TempPosY][i]
                    FindTarget=-1
                end
            end
            if FindTarget==-1 then
                break
            end
            FindTarget=FindTarget+1
            ---换行的方法
            TempPosY = self:ChangeLine(tempRolePosY,FindTarget)
        end
    elseif(self.info.attackTarget == 4)--类型为我方下一个顺序 支援型
    then
        tempTeam = MgrBattle.ReturnTeam(self.info.isLeft)
        tempChessboard = FightGlobal.ReturnChessboard(not self.info.isLeft)
        --遍历寻找下一个攻击顺位
        local tempNextRole = false
        local tempNextOrder = self.info.atkOrder + 1
        --排序
        local  tempLen = 0
        local tempSortArr = {}
        for key, value in pairs(tempTeam) do
            if value~=nil then
                tempLen=tempLen+1
                tempSortArr[tempLen]=value
            end
        end
        local tempExcRole=nil  --用来交换的角色
        for k = 1, tempLen-2, 1 do
            for i = 1, tempLen-1, 1 do
                if tempSortArr[i].info.atkOrder> tempSortArr[i+1].info.atkOrder  then
                    tempExcRole= tempSortArr[i]
                    tempSortArr[i]=tempSortArr[i+1]
                    tempSortArr[i+1]=tempExcRole
                end
            end
        end
        for i = 1, tempLen, 1 do
            --找出下一个
            if tempSortArr[i].info.atkOrder>=tempNextOrder then
                if  tempSortArr[i].info.isDead or tempNextRole==true then
                    --移除死亡的角色
                else
                    self.selRole=tempSortArr[i]
                    tempNextRole=true
                    break
                end
            end
        end
        if tempNextRole==false then
            for i = 1, tempLen, 1 do
                --找出下一个
                if  tempSortArr[i].info.isDead then

                else
                    self.selRole=tempSortArr[i]
                    tempNextRole=true
                    break
                end
            end
        end
    else    --随机

    end
    -- 找到目标后,如果是范围攻击则依次添加其他目标到次要目标 Secondary 里
    if self.selRole==nil then
        return --主目标找不到返回空
    end
    self.Secondary={}
    local tempfirst = true  --第一个目标是自己,不再添加
    if (self.info.atkRange[2] ~= nil) then
        for m, n in pairs(self.info.atkRange) do
            if tempfirst then
                tempfirst=false
            else--在对应棋盘中查找下标
                --如果越界了也不行
                if  self.selRole.info.ChessboardY- self.info.atkRange[m][2]>=1 and  self.selRole.info.ChessboardY- self.info.atkRange[m][2]<=3 then
                    local tempSecondRole =  tempChessboard[self.selRole.info.ChessboardY- self.info.atkRange[m][2] ]  [ self.selRole.info.ChessboardY- self.info.atkRange[m][1]    ]
                    if tempSecondRole~=nil and tempSecondRole~=0 then
                        --id不为空则加入到次要目标表
                        table.insert( self.Secondary, tempSecondRole)
                    end
                end
            end
        end
    end
end  --寻找目标结束

---换行
function M:ChangeLine(_posY,FindTarget)
    local TempPosY
    --三条线三种换行的方法
    if _posY==1 then --在第二排寻找顺序1-3-2
        if FindTarget==1 then
            TempPosY=3
        else
            TempPosY=2
        end
    elseif _posY==2 then --在第二排寻找顺序2-3-1
        if FindTarget==1 then
            TempPosY=3
        else
            TempPosY=1
        end
    elseif _posY==3 then --在第三排,寻找顺序3-2-1
        if FindTarget==1 then
            TempPosY=1
        else
            TempPosY=2
        end
    end
    return TempPosY
end
return M