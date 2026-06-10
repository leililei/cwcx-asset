---战斗特效数据
---@class EffectFightData
EffectFightData = Class("EffectFightData")
-------------构造方法-------------
function EffectFightData:ctor(uid, id, _aktRoleUid, _hitRoleUid, _isMainTar, _delay)
    self.uid = uid  --唯一id
    self.EffectId=id  --特效id
    self.JnSkill=nil   -- 触发的技能id 同一个技能的飞行时间 普攻是-1
    self.AktRoleUid = _aktRoleUid  --攻击者id
    self.HitRoleUid = _hitRoleUid  --受击者id
    self.IsMianTar=_isMainTar  --是否主要目标
    self.NeedTime=0  --播放这个特效需要的时间,包括飞行时间
    self.DealyTime=0  --延迟时间
    --攻击者是否近战 近战的受击特效根据攻击帧判定  远程根据子弹飞行时间
    self.AtkRoleIsCombat=false
    ---被创建次数
    self.CreateCount = 1
    ---获取本地配置
    local config = Special_effectLocalData.tab[id]

    self.GameId=1  --本回合第几个结算 可以插队
    self.IsMianTar=false  --是否主要目标,一般只对主要目标生成特效

    self.Id=0
    self.EffectType = tonumber(config[2]) --0.龙骨动画，1.unity 2视频
    self.endTime =config[3]  --unity特效使用 到时间回收
    self.Name=config[4]    --文件名
    self.pName = "ABOriginal/VFX/Prefab/UI_Prefab/".. config[4]..".prefab" --文件路径
    self.TimerType=config[5]  --0.为常规特效：从第1帧计时1.为受击特效：攻击者的攻击帧开始计时  2.攻击特效: 只对主要受击者发动 3.buff循环: 挂在受击者身上,buff移除的时候才消失
    self.BuffType = config[6]   --buff类型
    self.AniName=config[7]   -- 特效动画名称/EX用于 后续特效名;旋转摄像机;攻击位置;受击位置
    self.Sound_delay=config[8]
    self.Sound=config[9]
    self.Delay= tonumber(config[10]) + _delay       --单位秒 0.3f
    self.Delay_Initial=0   --初始延迟时间  如果要改变基础延迟
    self.StartPosType=config[11]  --特效起点类型 0.施法者，1.作用者   EX视频特效用来填延迟
    self.StartPos = nil  ---起点坐标 v3
    self.StartBone = nil ---起点BONE名称
    local stSPos = string.split(config[12],",")
    ---与策划口头协定，若只能分割出1位，则为BONE名称，反之则为起点坐标
    if #stSPos == 1 then
        self.StartBone = stSPos[1]
    else
        self.StartPos = Vector3(
                tonumber(stSPos[1]) * FightGlobal.EffectScale,
                tonumber(stSPos[2]) * FightGlobal.EffectScale,
                tonumber(stSPos[3]) * FightGlobal.EffectScale)
    end
    self.EndPosType=config[13]   --0.施法者，1.作用者                                             Ex用于受击角色出现延迟
    self.EndPosOffsetType=config[14]  --终点位置偏移0.脚底，1.身体中间，2.头顶                     EX用于受击角色隐藏时间
    self.EndPos = nil   ---终点坐标
    self.EndBone = nil  ---终点BONE名称
    local enSPos = string.split(config[15],",")
    ---与策划口头协定，若只能分割出1位，则为BONE名称，反之则为终点坐标
    if #enSPos == 1 then
        self.EndBone = enSPos[1]
    else
        self.EndPos = Vector3(
                tonumber(enSPos[1]) * FightGlobal.EffectScale,
                tonumber(enSPos[2]) * FightGlobal.EffectScale,
                tonumber(enSPos[3]))
    end

    self.FlyType=config[16] --0.不飞行 只在起点播放 ，1.旋转且直线飞行，2.抛物线飞行，3.不旋转且直线飞行
    self.IsLoop=config[17]   --0.不循环，1.循环
    self.FlySpeed= tonumber(config[18])
    local strRot = string.split(config[19],",")
    if strRot[1] == nil then strRot[1] = 0 end
    if strRot[2] == nil then strRot[2] = 0 end
    if strRot[3] == nil then strRot[3] = 0 end
    self.Rot=Vector3(
            tonumber(strRot[1]) * FightGlobal.EffectScale,
            tonumber(strRot[2]) * FightGlobal.EffectScale,
            tonumber(strRot[3]) * FightGlobal.EffectScale
    )

    self.TimeScal=config[20]   --动画播放速率
    local strScale = string.split(config[21],",")
    self.LocScale=Vector3(
            tonumber(strScale[1]) * FightGlobal.EffectScale,
            tonumber(strScale[2]) * FightGlobal.EffectScale,
            1)   --缩放

    self.exposure=0  -- 1曝光,0不曝光

    self.CEffect=nil   --c#脚本 ,1计算时间,2开始播放
    --每次加入队列的时候判断自己后面是否有带 ";" 需要同步播放的特效组,如果有,加入到这个表

    --需要同步播放的特效id  { {同步技能b1,同步技能b1} ,{同步技能c1,同步技能c1} }
    self.SynchroEffectId={ }
    end

return EffectFightData