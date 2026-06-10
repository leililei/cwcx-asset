---@class RoleFightData
RoleFightData = Class("RoleFightData")

-------------构造方法-------------
function RoleFightData:ctor(uid, id, lv, starLv, skillLv, isAwaken, type, order, index ,isLeft ,isMonster, isWorldBoss)
    ---------------角色参数-----------------
    self.uid = uid
    ---配置id
    self.id = id
    ---出手顺序（自己所在队列的）
    self.atkOrder = order
    ---总出手顺序(左右两侧的)
    self.anyAtkOrder = 0
    ---是否觉醒
    self.isAwaken =isAwaken
    ---角色是否是左侧
    self.isLeft = isLeft
    ---是否是怪物
    self.isMonster = isMonster
    ---是否是世界boss
    self.isWorldBoss = isWorldBoss
    ---是否是Npc助战:1玩家角色 2助战Npc
    if type then
        self.roleType = type
    else
        self.roleType = 1
    end
    ---星级
    self.starLv = starLv
    ---等级
    self.level = lv
    ---技能等级
    self.skillLv = skillLv
    ---当前所属棋盘标记
    if isLeft then
        local ChessboardNum = index - 1
        self.ChessboardX = (5 - math.floor(ChessboardNum / 3)) + 1
        self.ChessboardY = (ChessboardNum % 3) + 1
    else
        local ChessboardNum = index - 1
        self.ChessboardX = math.floor(ChessboardNum / 3) + 1
        self.ChessboardY = (ChessboardNum % 3) + 1
    end
    ---地板实际位置索引
    self.floorIdx = self.ChessboardY * 6 + self.ChessboardX - 6 --index
    ---------------角色状态-----------------
    ---是否死亡
    self.isDead = false
    ---是否眩晕
    self.isVertigo = false
    ---是否在蓄力
    self.isCharged = false

    self.allNumber_Out = 0
    self.allNumber_In = 0
    self.allHPNumber_Out = 0
    self.allHPNumber_In = 0

    --------------角色配置------------------
    ---名字
    self.name = ""
    ---登场音效
    self.inFlyAudio = ""
    ---死亡音效
    self.deadAudio = ""
    ---职业
    self.occupation = 0
    ---品阶
    self.rank = 0
    ---图标
    self.icon = ""
    ---Spine
    self.rolePictureSpine = ""
    ---Spine坐标偏移
    self.rolePictureSpine_X = 0
    self.rolePictureSpine_Y = 0
    ---动画名
    self.aniName = ""
    ---攻击轮次
    self.generalAttack = {}
    self.atkNumber = 0
    ---中心点坐标
    self.midPos_X = 0
    self.midPos_Y = 0
    ---头顶坐标
    self.topPos_X = 0
    self.topPos_Y = 0
    ---底部坐标
    self.downPos_X = 0
    self.downPos_Y = 0
    ---普攻特效ID
    self.atkEffectId_str = ""
    self.atkEffectId = {}
    ---登场特效id
    self.debutEffectId_str = ""
    self.debutEffectId = {}
    ---死亡动作特效
    self.deathEffectId_str = ""
    self.deathEffectId = {}
    ---眩晕
    self.vertigoEffectId_str = ""
    self.vertigoEffectId = {}
    ---受击
    self.hitEffectId_str = ""
    self.hitEffectId = {}
    ---跑动
    self.PD0EffectId_str = ""
    self.PD1EffectId_str = ""
    self.HC1EffectId_str = ""
    self.HC2EffectId_str = ""

    self.qZoom = 0

    self.minStart = 0

    self.maxStart = 0
    --- 飞行入场的数据print(config[tempIndex].."飞行入场下标"..tempIndex)
    self.flyIn_X = 0
    self.flyIn_Y = 0
    self.flyIn_Time = 0
    self.flyIn_Line = 1
    ---攻击模式
    self.attackMode = 0
    ---投掷动画
    self.casterAnimation = 0
    ---攻击名
    self.atkName = ""
    ---攻击简介
    self.attackDescription = ""
    ---分析觉醒属性
    self.awakenFormula = {}
    ---血量
    self.hpMaxFormula = {}
    self.hpMax = 0
    self.hp = 0
    ---攻击力
    self.atkFormula = {}
    self.supPart = 0
    self.realSupPart = 0
    self.atk = 0
    self.realAtk = 0
    ---防御力
    self.def = 0
    self.realDef = 0
    ---暴击率
    self.crit = 0
    self.realCrit = 0
    ---闪避率
    self.agile = 0
    self.realAgile = 0
    ---暴击伤害
    self.critDmg = 0
    self.realCritDmg = 0
    ---攻击目标
    self.attackTarget = 0
    ---攻击范围
    self.attackRangeTex = ""
    self.atkRange = {}
    self.atkRangeArr = {} --所有等级的攻击范围
    self.atkRangeIsNew=true  -- print("------------范围测试 tempRole.AtkRangeIsNew=true")
    ---技能
    self.skill_1_IsSLv=false
    self.skill_2_IsSLv=false
    self.skill_3_IsSLv=false
    self.skill_4_IsSLv=false
    self.skill_5_IsSLv=false
    self.skill_1Fml= {}
    self.skill_2Fml= {}
    self.skill_3Fml= {}
    self.skill_4Fml= {}
    self.skill_5Fml= {}
    self.skill_1={}
    self.skill_2={}
    self.skill_3={}
    self.skill_4={}
    self.skill_5={}
    self.skills = {}
    self.skill_1_example={}
    self.skill_2_example={}
    self.skill_3_example={}
    self.skill_4_example={}
    self.skill_5_example={}
    ---清空被赋予的技能
    self.aftTurnAbtChangeSkills ={}
    self.aftTurnDotSkills ={}
    self.gotBefAtkSkills ={}
    self.gotBefHitSkills ={}  --受到攻击前
    self.gotAftHitSkills ={}  --受到攻击后
    self.gotAftAtkSkills ={}  --攻击后
    self.gotOnDeathSkills ={}       --自身死亡的时候立即触发,选目标释放技能,然后继续执行技能链
    self.gotOnSupportSkills ={}       --支援时
    self.aftTurnBackSkills ={}
    --ex技能
    ---进攻距离参数
    self.attackDistance = 0
    self.forwardType = 0
    self.backType = 0
    self.timeNext = 0
    ---Q版头像
    self.icon_q = ""
    ---攻前动作
    self.nameBefor = 0
    self.nameAfter = 0
    ---EX位置信息
    --self.EXPos_x = 0
    --self.EXPos_y = 0
    --self.EXPos_Size = 0
    --self.EXPos_rx = 0
    --self.EXPos_ry = 0
    --self.EXPos_rz = 0
    ---子弹飞行速度
    self.bulletVelocity = ""
    ---蓄力特效
    self.readyEffectId_str = ""
    --- 64震动
    self.shake = ""
    ---命中延迟
    self.show_Delay = {}
    ---分段比例
    self.show_Number = {}
    self.show_Delay = {}

    --------------生成配置------------------
    if isMonster then
        ---初始化怪物配置
        self:SetConfigMonster()
    else
        ---初始化角色配置
        self:SetConfigRole()
    end
end
---初始化角色数据
function RoleFightData:SetConfigRole()
    local config = RoleattributeLocalData.tab[self.id]
    ---名字
    self.name = config[2]
    ---解析音效配置
    self:SubAudio(config[3])
    ---职业
    self.occupation = tonumber(config[5])
    ---品阶
    self.rank =tonumber(config[6])--品阶
    ---图标
    self.icon = config[7]
    ---Spine
    self.rolePictureSpine = config[8]
    ---Spine坐标偏移
    local arr_spineXYZ = string.split(config[9],",")
    self.rolePictureSpine_X = tonumber(arr_spineXYZ[1])
    self.rolePictureSpine_Y = tonumber(arr_spineXYZ[2])
    ---动画名
    self.aniName = config[10]
    ---重置攻击统计
    self:SetGeneralAttack(config[11])
    ---中心点坐标
    local tempBodyPos = string.split(config[12],",")
    self.midPos_X = tempBodyPos[1]
    self.midPos_Y = tempBodyPos[2]
    ---头顶坐标
    tempBodyPos = string.split(config[13],",")
    self.topPos_X = tempBodyPos[1]
    self.topPos_Y = tempBodyPos[2]
    ---底部坐标
    tempBodyPos = string.split(config[14],",")
    self.downPos_X = tempBodyPos[1]
    self.downPos_Y = tempBodyPos[2]
    ---普攻特效ID
    self.atkEffectId_str = config[15]
    self.atkEffectId = self.SubAtkEffectId(config[15])
    ---登场特效id
    self.debutEffectId_str = config[16]
    self.debutEffectId = self.SubAtkEffectId(config[16])
    ---死亡动作特效
    self.deathEffectId_str = config[17]
    self.deathEffectId = self.SubAtkEffectId(config[17])
    ---眩晕
    self.vertigoEffectId_str = config[18]
    self.vertigoEffectId = self.SubAtkEffectId(config[18])
    ---受击
    self.hitEffectId_str = config[19]
    self.hitEffectId=self.SubAtkEffectId(config[19])
    ---跑动
    self.PD0EffectId_str = config[74]
    self.PD1EffectId_str = config[75]
    self.HC1EffectId_str = config[76]
    self.HC2EffectId_str = config[77]

    self.qZoom = config[20]

    self.minStart = tonumber(config[21])

    self.maxStart = tonumber(config[22])
    --- 飞行入场的数据print(config[tempIndex].."飞行入场下标"..tempIndex)
    self:SubFlyIn(config[23])
    ---攻击模式
    self.attackMode = tonumber(config[24])
    ---投掷动画
    self.casterAnimation = tonumber(config[25])
    ---攻击名
    self.atkName = config[26]
    ---攻击简介
    self.attackDescription = config[27]
    ---分析觉醒属性
    self:StSAwaken(config[28])
    ---血量
    self:StSHP(config[29])
    ---攻击力
    self:StSAtk(config[30])
    ---防御力
    self:StSDef(config[31])
    ---暴击率
    self:SetCrit(tonumber(config[32]))
    ---闪避率
    self:StSAgile(config[33])
    ---暴击伤害
    self:SetCritDMG(tonumber(config[34]))
    ---攻击目标
    self.attackTarget=tonumber(config[35])
    ---攻击范围
    self:StSAtkRange(config[36])
    ---技能
    self:StSSkillLvReal(config[37],config[38],config[39],config[40],config[41])
    ---计算觉醒
    self:SubAwaken()
    ---清空被赋予的技能
    self.aftTurnAbtChangeSkills ={}
    self.aftTurnDotSkills ={}
    self.gotBefAtkSkills ={}
    self.gotBefHitSkills ={}  --受到攻击前
    self.gotAftHitSkills ={}  --受到攻击后
    self.gotAftAtkSkills ={}  --攻击后
    self.gotOnDeathSkills ={}       --自身死亡的时候立即触发,选目标释放技能,然后继续执行技能链
    self.gotOnSupportSkills ={}       --支援时
    self.aftTurnBackSkills ={}
    --ex技能
    ---进攻距离参数
    self.attackDistance =tonumber(config[45])

    self.forwardType =tonumber(config[46])

    self.backType =tonumber(config[47])

    self.timeNext =tonumber(config[48])
    ---Q版头像
    self.icon_q = config[49]
    ---攻前动作
    self.nameBefor = tonumber(config[50])

    self.nameAfter = tonumber(config[51])
    ---EX位置信息
    --local tempstr = config[55]
    --local tempArr = string.split(tempstr,",")
    --self.EXPos_x= tonumber(tempArr[1])
    --self.EXPos_y= tonumber(tempArr[2])
    --self.EXPos_Size= tonumber(tempArr[3])
    --self.EXPos_rx= tonumber(tempArr[4])
    --self.EXPos_ry= tonumber(tempArr[5])
    --self.EXPos_rz= tonumber(tempArr[6])
    ---设置核心共鸣装备属性
    self:SetAllFw_attr()
    ---子弹飞行速度
    self.bulletVelocity =config[62]
    ---蓄力特效
    self.readyEffectId_str = config[61]
    --- 64震动
    self.shake = config[64]
    ---命中延迟
    self.show_Delay ={}
    ---分段比例
    self.show_Number ={}
    local tempShake=tostring(config[65],"0")
    if tempShake=="0" then
        self.show_Delay[0]=0
        self.show_Number[0]=0
    else
        local tempArr= string.split(tempShake,",")
        for key_A1, value_A1 in pairs(tempArr) do
            local tempArr_2 = string.split(value_A1,"_")
            self.show_Delay[key_A1] = tonumber(tempArr_2[1])
            self.show_Number[key_A1] = tonumber(tempArr_2[2])
        end
    end
    ---计算经验值 Rank
    self:SetExp()

    ---解析羁绊-未启用
    self:CreatFetters()
end
---初始化怪物数据
function RoleFightData:SetConfigMonster()
    local config = MonsterLocalData.tab[self.id]
    ---名字
    self.name = config[2]
    -----解析音效配置
    --self:SubAudio(config[3])
    ---职业
    self.occupation = tonumber(config[3])
    ---图标
    self.icon = config[4]
    ---Spine
    self.rolePictureSpine = config[5]
    -----品阶
    --self.rank =tonumber(config[6])--品阶
    ---Spine坐标偏移
    local arr_spineXYZ = string.split(config[6],",")
    self.rolePictureSpine_X = tonumber(arr_spineXYZ[1])
    self.rolePictureSpine_Y = tonumber(arr_spineXYZ[2])
    ---动画名
    self.aniName = config[7]
    ---重置攻击统计
    self:SetGeneralAttack(config[8])
    ---中心点坐标
    local tempBodyPos = string.split(config[9],",")
    self.midPos_X = tempBodyPos[1]
    self.midPos_Y = tempBodyPos[2]
    ---头顶坐标
    tempBodyPos = string.split(config[10],",")
    self.topPos_X = tempBodyPos[1]
    self.topPos_Y = tempBodyPos[2]
    ---底部坐标
    tempBodyPos = string.split(config[11],",")
    self.downPos_X = tempBodyPos[1]
    self.downPos_Y = tempBodyPos[2]
    ---普攻特效ID
    self.atkEffectId_str = config[12]
    self.atkEffectId = self.SubAtkEffectId(config[12])
    ---登场特效id
    self.debutEffectId_str = config[13]
    self.debutEffectId = self.SubAtkEffectId(config[13])
    ---死亡动作特效
    self.deathEffectId_str = config[14]
    self.deathEffectId = self.SubAtkEffectId(config[14])
    ---眩晕
    self.vertigoEffectId_str = config[15]
    self.vertigoEffectId = self.SubAtkEffectId(config[15])
    ---受击
    self.hitEffectId_str = config[16]
    self.hitEffectId=self.SubAtkEffectId(config[16])
    ---跑动
    self.PD0EffectId_str = config[48]
    self.PD1EffectId_str = config[49]
    self.HC1EffectId_str = config[50]
    self.HC2EffectId_str = config[51]

    self.qZoom = config[17]

    self.minStart = tonumber(config[18])
    --self.maxStart = tonumber(config[19])
    ---攻击模式
    self.attackMode = tonumber(config[19])
    ---投掷动画
    self.casterAnimation = tonumber(config[20])
    ---攻击名
    self.atkName = config[21]
    ---攻击简介
    self.attackDescription = config[22]
    ----- 飞行入场的数据print(config[tempIndex].."飞行入场下标"..tempIndex)
    --self:SubFlyIn(config[23])

    ---分析觉醒属性
    self:StSAwaken(config[23])
    ---血量
    self:StSHP(config[24])
    ---攻击力
    self:StSAtk(config[25])
    ---防御力
    self:StSDef(config[26])
    ---暴击率
    self:SetCrit(tonumber(config[27]))
    ---闪避率
    self:StSAgile(config[28])
    ---暴击伤害
    self:SetCritDMG(tonumber(config[29]))
    ---攻击目标
    self.attackTarget=tonumber(config[30])
    ---攻击范围
    self:StSAtkRange(config[31])
    ---技能
    self:StSSkillLvReal(config[32],config[33],config[34],config[35],config[36])
    ---计算觉醒
    self:SubAwaken()
    ---清空被赋予的技能
    self.aftTurnAbtChangeSkills ={}
    self.aftTurnDotSkills ={}
    self.gotBefAtkSkills ={}
    self.gotBefHitSkills ={}  --受到攻击前
    self.gotAftHitSkills ={}  --受到攻击后
    self.gotAftAtkSkills ={}  --攻击后
    self.gotOnDeathSkills ={}       --自身死亡的时候立即触发,选目标释放技能,然后继续执行技能链
    self.gotOnSupportSkills ={}       --支援时
    self.aftTurnBackSkills ={}
    --ex技能
    ---进攻距离参数
    self.attackDistance =tonumber(config[37])

    self.forwardType =tonumber(config[38])

    self.backType =tonumber(config[39])

    self.timeNext =tonumber(config[40])
    ---Q版头像
    self.icon_q = config[41]
    ---攻前动作
    self.nameBefor = tonumber(config[42])

    self.nameAfter = tonumber(config[43])
    ---EX位置信息
    --local tempstr = config[44]
    --local tempArr = string.split(tempstr,",")
    --self.EXPos_x= tonumber(tempArr[1])
    --self.EXPos_y= tonumber(tempArr[2])
    --self.EXPos_Size= tonumber(tempArr[3])
    --self.EXPos_rx= tonumber(tempArr[4])
    --self.EXPos_ry= tonumber(tempArr[5])
    --self.EXPos_rz= tonumber(tempArr[6])
    ---设置核心共鸣装备属性
    self:SetAllFw_attr()
    ---子弹飞行速度
    self.bulletVelocity =config[47]
    ---蓄力特效
    self.readyEffectId_str = config[46]
    --- 64震动
    self.shake = config[54]
    ---命中延迟
    self.show_Delay ={}
    ---分段比例
    self.show_Number ={}
    local tempShake=tostring(config[55],"0")
    if tempShake=="0" then
        self.show_Delay[0]=0
        self.show_Number[0]=0
    else
        local tempArr= string.split(tempShake,",")
        for key_A1, value_A1 in pairs(tempArr) do
            local tempArr_2 = string.split(value_A1,"_")
            self.show_Delay[key_A1] = tonumber(tempArr_2[1])
            self.show_Number[key_A1] = tonumber(tempArr_2[2])
        end
    end
    -----计算经验值 Rank
    --self:SetExp()
    --
    -----解析羁绊-未启用
    --self:CreatFetters()
end

---设置g攻击次数
function RoleFightData:SetGeneralAttack(str)
    self.generalAttack ={}
    local tempStArr = string.split(str,",")
    self.atkNumber = 0
    for k, v in pairs(tempStArr) do
        self.atkNumber = self.atkNumber + 1
        table.insert(self.generalAttack, tonumber(tempStArr[k])/30 )
    end
    -- print(  tempRole.AtkNumber.."g攻击次数"..tempRole.Generalattack[tempRole.AtkNumber])
end

---解析出本回合特效表 {{{a1,延迟},{a2,延迟}}, {b1,b2}} a和b同步 a2延迟a1的时间播放
function RoleFightData.SubAtkEffectId(_str)
    local returnAtkEff = {}
    --按照分号切割,
    local fenStr = string.split(_str,";")
    --按照逗号切割
    for key, value in pairs(fenStr) do
        --     print("分号切割后" ..FenStr[key])
        local douStr = string.split(fenStr[key],",")
        --用下划线分割
        local xiaStr ={}
        for a, b in pairs(douStr) do
            local tempXiaStr = string.split(douStr[a],"_")
            table.insert(xiaStr, tempXiaStr)
        end
        table.insert(returnAtkEff, xiaStr)
    end
    return returnAtkEff
end
---解析飞行入场下标
function RoleFightData:SubFlyIn(_strData)
    if _strData == nil or _strData == "0" then
        self.flyIn_X = 0
        self.flyIn_Y = 0
        self.flyIn_Time = 0
        self.flyIn_Line = 1
    else
        local str = string.split(_strData,",")
        self.flyIn_X = tonumber(str[1])
        self.flyIn_Y = tonumber(str[2])
        self.flyIn_Time = tonumber(str[3])
        self.flyIn_Line = tonumber(str[4])
    end
end
---解析飞行入场音效
function RoleFightData:SubAudio(s)
    if s ~= nil and s ~= "0" and s == 1 then
        local audioGroup = tonumber(s)
        for key, value in pairs(ActorLinesLocalData.tab) do
            if value[2] == audioGroup then
                if value[3] == 16 then
                    ---登场音效
                    self.inFlyAudio = value[13]
                elseif value[3] == 26 then
                    ---死亡音效
                    self.deadAudio = value[13]
                end
            end
        end
    end
end
---解析觉醒属性
function RoleFightData:StSAwaken(s)
    local strArr = string.split(s,",")
    for k, v in pairs(strArr) do
        --在用 _ 切割
        strArr[k]= string.split(strArr[k],"_")
    end
    self.awakenFormula = strArr
end
---解析血量
function RoleFightData:StSHP(str)
    --1 解析出公式
    self.hpMaxFormula = FightGlobal.StrToScript(str)
    --2 调用计算函数
    self:SubHP()
end
function RoleFightData:SubHP()
    local tempHP_str = self:SubFormula(self.hpMaxFormula)
    local f = load(tempHP_str)()
    self.hpMax = math.floor(f/10000)
    self.hp = self.hpMax
end
---攻击力或支援力
function RoleFightData:StSAtk(str)
    --1 解析出公式
    self.atkFormula = FightGlobal.StrToScript(str)
    --2 调用计算函数
    self:SubAtk()
end
function RoleFightData:SubAtk()
    local f = load(self:SubFormula(self.atkFormula))()
    if self.occupation == 4 then
        self.supPart = f/10000
        self.realSupPart = self.supPart
    else
        self.atk = f/10000
        self.realAtk = self.atk
        --  print("攻击力".. tempRole.Atk)
    end
end
---防御力
function RoleFightData:StSDef(s)
    self.def = tonumber(s)/10000
    self.realDef = self.def
end
---暴击率
function RoleFightData:SetCrit(_number)
    self.crit = _number
    self.realCrit = _number
end
---闪避率
function RoleFightData:StSAgile(s)
    self.agile = tonumber(s)/10000
    self.realAgile = self.agile
end
---暴击伤害
function RoleFightData:SetCritDMG(_number)
    self.critDmg = _number
    self.realCritDmg = _number
end

--攻击范围
function RoleFightData:StSAtkRange(s)
    --   print("====================攻击范围计算====================")
    --1 解析为表
    --先用;
    --print(  tempRole.AniName ..Str)
    local TempStrRangeLv = string.split(s,";")
    local lvToRangeTab={}
    for key, value in pairs(TempStrRangeLv) do
        local tempDataTab = string.split(value,",")
        lvToRangeTab[tempDataTab[1]]=tempDataTab[2]
    end
    local _CurHighestLv=0 --当前用于匹配的最高等级
    -- print("当前阅览等级为"..tempRole.SkillLV)
    for key, value in pairs(lvToRangeTab) do
        -- statements
        -- print("当前阅览等级为"..tempRole.SkillLV.."对比Key"..key)
        if tonumber(self.skillLv) >= tonumber(key) then
            -- 只会被更高等级的信息覆盖
            if tonumber(key) >= _CurHighestLv then
                -- print("tempRole.SkillLV"..tempRole.SkillLV.."当前最高等级为_CurHighestLv".._CurHighestLv.."即将要覆盖更高等级"..key.."value"..value)
                _CurHighestLv = tonumber(key)
                for i, n in pairs(RangeLocalData.tab) do
                    if n[2] == value then
                        self.attackRangeTex = n[3]
                        break
                    end
                end
            end
        end
    end
    local StrArr = FightGlobal.StrArrArr(";", s,{ "[" , "]" , ":" , "," , "@"})
    local tempArr = {}   --{{ {lv8,0},{1,1} } ,}
    local tempArrindex = 1
    self.atkRange = {}
    local temptabRange = {}
    self.atkRangeArr = {} --所有等级的攻击范围
    local tempIndex = 1
    local CantAdd =false
    for k,v in pairs(StrArr)  do
        tempArr[k] = {}
        temptabRange = {}
        --然后添加
        for o,p in pairs(StrArr[k]) do
            local temp = o%2
            if o==1 then
                temp=1
                tempArr[k][o]={StrArr[k][o],0}
                StrArr[k][o]={StrArr[k][o],0}
                --    print( StrArr[k][o][1].."下标为"..k..o )
                --当前等级大于等于 StrArr[k][o][1] 新建范围表
                tempIndex=tonumber(StrArr[k][o][1])
                --  print(  k..tempRole.SkillLV.."技能等级-------范围"..tonumber(StrArr[k][o][1]) )
                if(tonumber( self.skillLv ) >= tonumber(StrArr[k][o][1]) ) then
                    --如果小于技能等级,不能添加
                    --  CantAdd=true
                end
            end
            if temp == 0 then
                tempArr[k][o]={StrArr[k][o] , StrArr[k][o+1] }
                StrArr[k][o]={StrArr[k][o] , StrArr[k][o+1] }
                table.insert(self.atkRange,{ StrArr[k][o][1], StrArr[k][o][2]}) --添加到实际范围表
                table.insert(temptabRange,{StrArr[k][o][1],StrArr[k][o][2]})
                --  print( StrArr[k][o][1].."下标为"..k..o.."第二个元素".. StrArr[k][o][2])
                tempArr[k][tempArrindex]={StrArr[k][o][1] , StrArr[k][o][2] }
                tempArrindex=tempArrindex+1
            end
        end-- for op
        self.atkRangeArr[tempIndex] = temptabRange
    end
    for key, value in pairs(self.atkRangeArr) do
        if key< self.skillLv then
            self.atkRange=value
        elseif key== self.skillLv then
            self.atkRangeIsNew=true  -- print("------------范围测试 tempRole.AtkRangeIsNew=true")
            self.atkRange=value
        end
    end
    -- for q,w in pairs(   tempRole.AtkRangeArr)  do
    --    for e,r in pairs(   tempRole.AtkRangeArr[q])  do
    --      print( q ..","..e..";"..tempRole.AtkRangeArr[q][e][1]..","..tempRole.AtkRangeArr[q][e][2])
    --    end
    -- end
end
---解析技能
--4个技能 {skillid ,skilllvreal 实际等级 ,skilltrun 持续回合数 -1表示无限持续, ,opportunity 发动时间点 攻击前后}
--按照时间点加入 回合结束的时候遍历所有技能 ,持续回合数减1
--解析出9个等级 ,根据当前技能等级使用
function RoleFightData:StSSkillLvReal(Str1, Str2, Str3, Str4, Str5)
    --先用;切割 ,判断当前技能在哪个区间 ,
    self.skill_1_IsSLv=false
    self.skill_2_IsSLv=false
    self.skill_3_IsSLv=false
    self.skill_4_IsSLv=false
    self.skill_5_IsSLv=false
    local realStr1=self:RealSkillStr(Str1, self.skillLv,1)
    local realStr2=self:RealSkillStr(Str2, self.skillLv,2)
    local realStr3=self:RealSkillStr(Str3, self.skillLv,3)
    local realStr4=self:RealSkillStr(Str4, self.skillLv,4)
    local realStr5=self:RealSkillStr(Str5, self.skillLv,5)
    -- 用 ; { }  , 切割
    self.skill_1Fml= FightGlobal.StrArrArr("@",realStr1,{ "{" , "}" , "," })
    self.skill_2Fml= FightGlobal.StrArrArr("@",realStr2,{ "{" , "}" , "," })
    self.skill_3Fml= FightGlobal.StrArrArr("@",realStr3,{ "{" , "}" , "," })
    self.skill_4Fml= FightGlobal.StrArrArr("@",realStr4,{ "{" , "}" , "," })
    self.skill_5Fml= FightGlobal.StrArrArr("@",realStr5,{ "{" , "}" , "," })
    self:SubSkillLvReal1()
end
function RoleFightData:RealSkillStr(_str, _skillLv, _index)
    if _str =="0" then
        return "0"
    end
    --  print("_index".._index)
    local _IsSlv = false
    local tempArr = string.split(_str,";")
    local tempChar=nil
    local realStr1=""
    --判断使用哪一个  只有第一个才解锁
    local tempIsfist=true
    for key, value in pairs(tempArr) do
        tempChar = string.sub(tempArr[key] ,8,8)  --20404{0,6,7} 第七个字符是解锁等级  判断第八个是不是逗号,不是也加入
        local  tempChar_2 = string.sub(tempArr[key] ,9,9)
        -- print(tempChar.."技能id" ..tempArr[key] )
        if tempChar_2=="," or tempChar_2=="}"  then
            -- print(tempChar_2.."|||1")
        else
            -- print(tempChar_2.."|||2")
            tempChar=tempChar..tempChar_2
            -- print(tempChar.."|||2")
        end
        tempChar=tonumber(tempChar)
        -- 解锁 判定
        --  print(" --判断使用哪一个-----------|".._SkillLv.."||"..tempChar)
        if _skillLv == tempChar then
            if tempIsfist then
                if _index==1 then
                    self.skill_1_IsSLv=true
                elseif _index==2 then
                    self.skill_2_IsSLv=true
                elseif _index==3 then
                    self.skill_3_IsSLv=true
                elseif _index==4 then
                    self.skill_4_IsSLv=true
                elseif _index==5 then
                    self.skill_5_IsSLv=true
                end
            end
            realStr1=tempArr[key]
            -- print("跳出1")
            break
        elseif tempChar> _skillLv then
            --技能需求等级大于实际等级停止
            -- print("跳出2")
            break
        end
        tempIsfist=false
        --否则加入到自己等级
        realStr1=tempArr[key]
    end
    if realStr1==nil or realStr1=="" then
        realStr1="0"
    end
    return realStr1
end
--分两步解析技能id
function RoleFightData:SubSkillLvReal1()
    self.skill_1=self.SubSkillLvReal2(self.skill_1Fml, self.skillLv)
    self.skill_2=self.SubSkillLvReal2(self.skill_2Fml, self.skillLv)
    self.skill_3=self.SubSkillLvReal2(self.skill_3Fml, self.skillLv)
    self.skill_4=self.SubSkillLvReal2(self.skill_4Fml, self.skillLv)
    self.skill_5=self.SubSkillLvReal2(self.skill_5Fml, self.skillLv)
    self:CreatAllSkill()
end
--传入二维数组{{id,lv1,lv2,lv3}{id,lv1,lv2} } ,返回技能{ {id,realLv },{id,realLv },{id,realLv } }的二维数组
function RoleFightData.SubSkillLvReal2(strArr, skillLv)
    if strArr[1][2]== nil then
        return {{0,0,false}}
    end
    skillLv = tonumber(skillLv)
    local tempArrArr = {}
    local tempArr = {}  --只有两个元素 id和lv  新增一个参数 是否强化等级
    local tempIsSLv = false
    for k,v in pairs(strArr)  do
        local tempLv = 0
        tempArr={}
        for o,p in pairs(strArr[k])  do
            --如果是第一个元素则记为技能id 然后判断当前技能强化等级 决定技能的真实等级
            -- print(StrArr[k][o])
            if o==1 then
                table.insert(tempArr, strArr[k][o])--1
                -- print("StrArr[k][o]"..StrArr[k][o])
            else
                --不是第一个元素判断当前技能强化等级,每超过一个
                local tempN = tonumber( strArr[k][o])
                --  print("StrArr[k][o]"..StrArr[k][o])
                -- print("SkillLV"..SkillLV.."||"..tempN)
                if skillLv >=tempN then  --直到技能等级小于的时候跳出
                    if skillLv ==tempN then
                        tempIsSLv=true
                    else
                        tempIsSLv=false
                    end
                    tempLv=tempLv+1
                else
                    break
                end
            end
        end --for op
        table.insert(tempArr, tempLv) --2
        table.insert(tempArr, tempIsSLv)--3
        --print("i=0----id".. tempArr[1].."lv"..tempArr[2])
        table.insert(tempArrArr,tempArr)
    end --for k v  StrArr
    return tempArrArr
end
--创建一个角色的所有技能 ,然后根据使用结点分类
function RoleFightData:CreatAllSkill()
    ---@type SkillFightData[] 清空角色拥有的所有技能列表
    self.skills = {}
    --按照栏位分四个  新增ex栏位
    self.skill_1_example={}
    self.skill_2_example={}
    self.skill_3_example={}
    self.skill_4_example={}
    self.skill_5_example={}
    if self.skill_1~=nil then
        self:SwithSkill(self.skill_1,1)
    end-- if tempRole.Skill_1~=nil
    if self.skill_2~=nil then
        self:SwithSkill(self.skill_2,2)
    end-- if tempRole.Skill_1~=nil
    if self.skill_3~=nil then
        self:SwithSkill(self.skill_3,3)
    end-- if tempRole.Skill_1~=nil
    if self.skill_4~=nil then
        self:SwithSkill(self.skill_4,4)
    end-- if tempRole.Skill_1~=nil
    if self.skill_5~=nil then
        self:SwithSkill(self.skill_5,5)
    end-- if tempRole.Skill_1~=nil
end
--子方法用于分类
function RoleFightData:SwithSkill(skill_n, _ExampleIndex)
    if skill_n[1][1]==0 then
        return
    end
    for k, v in pairs(skill_n) do
        local tempSkill = SkillFightData.New(skill_n[k][1], skill_n[k][2], self.isAwaken, skill_n[k][3])
        -- print("添加技能".. tempSkill.Opportunity)
        --每个技能都会加到 Skills
        if _ExampleIndex==4 then
            if self.isAwaken==true  then
                table.insert(self.skills,tempSkill)
            end
        else
            table.insert(self.skills,tempSkill)
        end
        if tempSkill.display then
            --按照第几个技能分类
            if _ExampleIndex==1 then
                table.insert(self.skill_1_example,tempSkill)
            elseif _ExampleIndex==2 then
                table.insert(self.skill_2_example,tempSkill)
            elseif _ExampleIndex==3 then
                table.insert(self.skill_3_example,tempSkill)
            elseif _ExampleIndex==4 then
                table.insert(self.skill_4_example,tempSkill)
            elseif _ExampleIndex==5 then
                table.insert(self.skill_5_example,tempSkill)
            end
        end
    end --for k v
end

--解析公式  formulaStr 公式 ,要改变属性的角色 仅仅用于角色基础属性 ,技能属性使用另一个
function RoleFightData:SubFormula(formulaStr)
    --如果没有一个分割符则不需要
    local tempReturnStr = "return "
    --遍历所有的变量型字符
    local tempVariable = ""
    for k, v in pairs(formulaStr) do
        tempVariable = formulaStr[k]
        --    print(formulaStr[k] .. "--重新组成字符串" .. tempVariable)
        if tempVariable == "lv" then
            tempReturnStr = tempReturnStr..self.level
            -- 替换对应的参数
            --  formulaStr[k]=tempRole.LV
        elseif tempVariable == "dqstar" then
            tempReturnStr = tempReturnStr..self.starLv
            -- 当前星级
            --  formulaStr[k] =tempRole.StartLV
        else
            tempReturnStr= tempReturnStr..formulaStr[k]
        end
        --  BattleManager.LeftTeam[k].SleTarget(BattleManager)
    end
    --重新组成字符串
    --  tempReturnStr = "return "
    --  for k, v in pairs(formulaStr) do
    --      tempReturnStr=tempReturnStr..formulaStr[k]
    --      BattleManager.LeftTeam[k].SleTarget(BattleManager)
    --  end
    tempReturnStr = tempReturnStr
    return tempReturnStr
end

--计算觉醒属性
function RoleFightData:SubAwaken()
    --没有觉醒直接返回
    if self.isAwaken==false  then
        return
    end
    --   print(tempRole.HPmax.."------------------计算觉醒属性------------")
    for k,v in pairs(self.awakenFormula) do
        --每一个元素都是 { 1-3属性类型, 属性变化率}
        if  self.awakenFormula[k][1]=="1" then
            self.hpMax = self.hpMax + self.awakenFormula[k][2]
            self.hp = self.hpMax
        elseif  self.awakenFormula[k][1]=="2" then
            self.atk = self.atk + self.awakenFormula[k][2]
            self.realAtk= self.atk
        elseif  self.awakenFormula[k][1]=="3" then
            self.supPart = self.supPart + self.awakenFormula[k][2]/10000
            self.realSupPart = self.supPart
        end
    end--for
    -- print("------------------计算觉醒属性------------"..tempRole.HPmax)
end

--添加所有的装备属性
function RoleFightData:SetAllFw_attr()
    --if BattleManager.IsTest_pve~=nil then
    --    return
    --else
    --
    --end
    print("--添加所有的装备属性".. self.id)
    self:SetMaBt()
    ---@type RoleData 获取角色属性
    local data = nil
    if self.isMonster then
        ---怪物
        if FightGlobal.CurType == FightEnum.Type.WORLD_BOSS then
            ---世界boss
            data = EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData
        else
            ---常规战斗
            data = StormViewModel.CurPointData:GetMonsterById(tonumber(self.id), self.atkOrder)
        end
    else
        ---人物
        data = HeroControl.GetRoleDataByID(tonumber(self.id))
    end
    if data == nil then
        print("--跳出1")
        return
    end
    ---获取角色核心1
    --local core1 = data:GetCore(1)
    local core1 = data:GetHeroCore(1)
    if core1 ~= nil then
        ---添加核心技能
        if core1.skill ~= nil and core1.skill ~= 0 and core1.skill ~= "0" then
            self:AddFwSkill(core1.skill)
        end
        ---添加核心属性
        self:AddRoleGear(core1.attrs,true)
    end
    ---获取角色核心2
    --local core2 = data:GetCore(2)
    local core2 = data:GetHeroCore(2)
    if core2 ~= nil then
        ---添加核心技能
        if core2.skill ~= nil and core2.skill ~= 0 and core2.skill ~= "0" then
            self:AddFwSkill(core2.skill)
        end
        ---添加核心属性
        self:AddRoleGear(core2.attrs,true)
    end
    if not self.isMonster then
        ---获取角色共鸣装备1
        local equip1 = data:GetHeroEquip(1)
        if equip1 ~= nil then
            self:AddRoleGear(equip1.attrs,true)
        end
        ---获取角色共鸣装备2
        local equip2 = data:GetHeroEquip(2)
        if equip2 ~= nil then
            self:AddRoleGear(equip2.attrs,true)
        end
        ---获取角色共鸣装备3
        local equip3 = data:GetHeroEquip(3)
        if equip3 ~= nil then
            self:AddRoleGear(equip3.attrs,true)
        end
    end
end

---设置基础属性
function RoleFightData:SetMaBt()
    self.skills_fw ={}
    self.basisAtk= self.realAtk
    self.basisDef= self.realDef
    self.basisSuppart= self.realSupPart
    self.basisCrit= self.realCrit
    self.basisCritDmg= self.realCritDmg
    self.basisAgile= self.realAgile
    self.basisHP= self.hp
    ------固定加成----
    self.basisAtk_Fixed=0
    self.extraAtk_Fixed = 0;
    self.basisHP_Fixed=0
    --百分比
    self.basisAtk_Percent=0
    self.basisDef_Percent=0
    self.basisSuppart_Percent=0
    self.basisCrit_Percent=0
    self.basisCritDmg_Percent=0
    self.basisAgile_Percent=0
    self.basisHP_Percent=0
    self.basisAgile_Percent=0
    self.basisSuppart_Percent=0
end

---添加符文技能
function RoleFightData:AddFwSkill(intId)
    local tempSkill = SkillFightData.New(intId,1,self.isAwaken,false)
    table.insert(self.skills_fw, tempSkill)
end

---人物,核心属性,是否装备or卸下 第一次穿装备的时候调用 ReadData.SetMabt(_Role)
---@param attr CoreAttrData[]
function RoleFightData:AddRoleGear(attr, isAdd)
    for i, v in pairs(attr) do
        if isAdd then
            self:SetAdd_Abt(v.attrID,v.attribute)
        else
            self:SetAdd_Abt(v.attrID,-1*v.attribute)
        end
    end
end

--设置装备属性,并作为基础属性   移除的时候要  传入属性值的负数
function RoleFightData:SetAdd_Abt(_str_type, _number)
    if _str_type==0 then  --固定攻击
        self.basisAtk_Fixed= self.basisAtk_Fixed+_number
        --实际攻击为  (basisAtk+basisAtk_Fixed)*basisAtk_Percent
        --然后给基础属性赋值
        self.atk= (self.basisAtk+ self.basisAtk_Fixed)*(1+ self.basisAtk_Percent)
        self.realAtk= self.atk
        --print(_number.."装备属性--固定攻击".. self.RealAtk)
    elseif _str_type==1 then --百分比攻击力
        _number=_number*0.01
        self.basisAtk_Percent= self.basisAtk_Percent+_number
        self.atk = (self.basisAtk+ self.basisAtk_Fixed)*(1+ self.basisAtk_Percent)
        self.realAtk=  self.atk
        --print(_number.."装备属性--百分比攻击力".. self.RealAtk)
    elseif _str_type==2 then  --固定生命
        self.basisHP_Fixed= self.basisHP_Fixed+_number
        self.hp= (self.basisHP+ self.basisHP_Fixed)*(1+ self.basisHP_Percent)
        self.hpMax= self.hp
        --print(_number.."装备属性--固定生命".. self.HPmax)
    elseif _str_type==3 then --百分比生命
        _number=_number*0.01
        self.basisHP_Percent= self.basisHP_Percent+_number
        self.hp= (self.basisHP+ self.basisHP_Fixed)*(1+ self.basisHP_Percent)
        self.hpMax= self.hp
        --print(_number.."装备属性--百分比生命".. self.HPmax)
    elseif _str_type==4 then  --防御
        _number=_number*0.01
        self.basisDef_Percent= self.basisDef_Percent+_number
        self.def= self.basisDef+ self.basisDef_Percent
        self.realDef= self.def
        --print(_number.."装备属性--防御".. self.RealDef)
    elseif _str_type==5 then  --暴击
        _number=_number*0.01
        self.basisCrit_Percent= self.basisCrit_Percent+_number
        self.crit= self.basisCrit+ self.basisCrit_Percent
        self.realCrit= self.crit
        --print(_number.."装备属性--暴击".. self.RealCrit)
    elseif _str_type==6 then  --爆伤
        _number=_number*0.01
        self.basisCritDmg_Percent= self.basisCritDmg_Percent+_number
        self.critDmg= self.basisCritDmg+ self.basisCritDmg_Percent
        self.realCritDmg= self.critDmg
        --print(_number.."装备属性--爆伤".. self.RealCritDmg)
    elseif _str_type==7 then  --闪避
        _number=_number*0.01
        self.basisAgile_Percent= self.basisAgile_Percent+_number
        self.agile= self.basisAgile+ self.basisAgile_Percent
        self.realAgile= self.agile
        --print(_number.."装备属性--闪避".. self.RealAgile)
    elseif _str_type==8 then  --支援力
        _number=_number*0.01
        self.basisSuppart_Percent= self.basisSuppart_Percent+_number
        self.supPart= self.basisSuppart+ self.basisSuppart_Percent
        self.realSupPart= self.supPart
        --print(_number.."装备属性--支援力".. self.RealSuppart)
    end
end
---获取等级
function RoleFightData:SetExp()
    if self.rank==1 then
        self.lvMax =RoleattrilevelLocalData.tab[self.starLv][4]
        self.expFormula = FightGlobal.Exp_R1[tonumber(self.starLv) ]
    elseif self.rank==2 then
        self.lvMax =RoleattrilevelLocalData.tab[self.starLv+6][4]
        self.expFormula = FightGlobal.Exp_R2[tonumber(self.starLv)]
    elseif  self.rank==3 then
        self.lvMax =RoleattrilevelLocalData.tab[self.starLv+12][4]
        self.expFormula = FightGlobal.Exp_R3[tonumber(self.starLv)]
    elseif  self.rank==4 then
        self.lvMax =RoleattrilevelLocalData.tab[self.starLv+18][4]
        self.expFormula = FightGlobal.Exp_R4[tonumber(self.starLv)]
    end
    --print(Str)
    ---1 解析出公式
    self.expFormula = FightGlobal.StrToScript(self.expFormula)

    ---2 调用计算函数
    -- 等级上限不计算
    if self.lvMax== self.level then
        self.experience = 0
        return 0
    else
        --  print(BattleRole.SubFormula(tempRole.ExpFormula,tempRole))
        local f = load(self:SubFormula(self.expFormula))()
        self.experience = f
        self.experience = math.floor(self.experience)
    end
end

---解析羁绊
function RoleFightData:CreatFetters()
    ---解析羁绊
    -- ReadData.Tab_Tab_fetters={}
    -- for k, v in pairs(GameData.tab.fetters) do
    --     --保存所有的组合
    --     local temptab={}
    --     temptab.id=tonumber(v[1])
    --     temptab.type=tonumber(v[4])
    --     temptab.number=tonumber(v[5])
    --     temptab.overflow=tonumber(v[6])
    --     temptab.skill={}
    --     --解析技能效果
    --     local tempArr=JNStrTool.strSplit(";", v[7])
    --     for key, value in pairs(tempArr) do
    --         if value=="" then
    --         else

    --             --  print(value)
    --             --按照 ,
    --             local tempLvAndValue=JNStrTool.strSplit(",", value)
    --             local tempSkillTab={}
    --             tempSkillTab.lv=tonumber(tempLvAndValue[1])
    --             -- print( tempLvAndValue[2])
    --             local skilltype_value=JNStrTool.strSplit("_",  tempLvAndValue[2])
    --             tempSkillTab.skilltype=tonumber(skilltype_value[1])
    --             tempSkillTab.skillvlaue=tonumber(skilltype_value[2])
    --             --是否还有后续

    --             table.insert(temptab.skill, tempSkillTab)
    --             --  print(  " --是否还有后续")
    --         end
    --     end
    --     --  print(  " --解析所有人的id")
    --     --解析所有人的id
    --     temptab.Zid= JNStrTool.strSplit(",",  v[9])
    --     -- print( v[9].. " --解析所有人的id")
    --     table.insert(ReadData.Tab_Tab_fetters, temptab)

    --end
end

---更新攻击顺序
function RoleFightData:SetOrder(order)
    --BattleManager.LeftSetOrder(role)
    self.atkOrder = order

end

return RoleFightData