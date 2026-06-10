---战斗全局数据
FightGlobal = {}
---拖拽模式
FightGlobal.DragModel = FightEnum.DragType.NONE
---游戏是否暂停
FightGlobal.IsPause = false
---当前战斗类型byFightEnum
FightGlobal.CurType = 0
---特效整体缩放，看是要配置里的还是程序写死，与策划商量后修改
FightGlobal.EffectScale = 8
---是否左侧先行动，目前机制为一定是自己侧先行动
FightGlobal.IsLeftFirst = true
---战斗唯一id
local UID = 0
---当前左侧攻击顺序
local leftAtkOrderCount = 0
---当前右侧攻击顺序
local rightAtkOrderCount = 0
---左地板坐标 新
FightGlobal.floorPosLeft={ {Vector3(-373, -70, -10),Vector3(-309, -70, -10),Vector3(-245, -70, -10),Vector3(-181, -70, -10),Vector3(-117, -70, -10),Vector3(-53, -70, -10)},
                             {Vector3(-373, -70, -104),Vector3(-309, -70, -104),Vector3(-245, -70, -104),Vector3(-181, -70, -104),Vector3(-117, -70, -104),Vector3(-53, -70, -104)},
                             {Vector3(-373, -70, -220),Vector3(-309, -70, -220),Vector3(-245, -70, -220),Vector3(-181, -70, -220),Vector3(-117, -70, -220),Vector3(-53, -70, -220)},
}
---右地板坐标 新
FightGlobal.floorPosRight={ {[6] = Vector3(377, -70, -10), [5] = Vector3(313, -70, -10), [4] = Vector3(249, -70, -10), [3] = Vector3(185, -70, -10), [2] = Vector3(121, -70, -10), [1] = Vector3(57, -70, -10)},
                               {[6] = Vector3(377, -70, -104), [5] = Vector3(313, -70, -104), [4] = Vector3(249, -70, -104), [3] = Vector3(185, -70, -104), [2] = Vector3(121, -70, -104), [1] = Vector3(57, -70, -104)},
                                {[6] = Vector3(377, -70, -220), [5] = Vector3(313, -70, -220), [4] = Vector3(249, -70, -220), [3] = Vector3(185, -70, -220), [2] = Vector3(121, -70, -220), [1] = Vector3(57, -70, -220)}
}
---爆炸特效路径
FightGlobal.BoomEffectPath = "VFX/Prefab/JueSe_Prefab/deathvfx.prefab"
---死亡特效路径
FightGlobal.DeadEffectPath = "VFX/Prefab/JueSe_Prefab/deathvfx_ball.prefab"
---上一次相同id特效延迟记录
FightGlobal.lastEffectDelayList = {}
---@type FightRoleView[][] 左棋盘可通过下标找到对应的角色
FightGlobal.ChessboardLeft={ {0,0,0,0,0,0},
                             {0,0,0,0,0,0},
                             {0,0,0,0,0,0}
}
---@type FightRoleView[][] 右棋盘可通过下标找到对应的角色
FightGlobal.ChessboardRight={ {0,0,0,0,0,0},
                              {0,0,0,0,0,0},
                              {0,0,0,0,0,0}
}
--------------------连线相关------------------
---地板特效路径
FightGlobal.line_path = "ABOriginal/VFX/Prefab/UI_Prefab/"
---正在连线
FightGlobal.liningTarget = false
---正在连线的目标
FightGlobal.targetLined = nil
---连线时间
FightGlobal.Line_Time = 0.25
---------------------------------------------
---返回棋盘
function FightGlobal.ReturnChessboard(isLeft)
    if isLeft then
        return FightGlobal.ChessboardLeft
    else
        return FightGlobal.ChessboardRight
    end
end
---战斗程序中写死的动画名
FightGlobal.AniName = {
    [FightEnum.AniType.FLY_0] = "dc",
    [FightEnum.AniType.FLY_1] = "dc1",
    [FightEnum.AniType.DIE] = "sw",
    [FightEnum.AniType.PASS] = "xy",
    [FightEnum.AniType.HIT] = "sj",
    [FightEnum.AniType.PD_0] = "pd-0",
    [FightEnum.AniType.PD_1] = "pd-1",
    [FightEnum.AniType.PD_1] = "pd-2",
    [FightEnum.AniType.HC_0] = "hc-0",
    [FightEnum.AniType.HC_1] = "hc-1",
    [FightEnum.AniType.HC_2] = "hc-2",
    [FightEnum.AniType.ATK] = "gj",
    [FightEnum.AniType.ATK_0] = "gj-0",
    [FightEnum.AniType.ATK_1] = "gj-1",
    [FightEnum.AniType.ATK_2] = "zj",
    [FightEnum.AniType.WAIT] = "dj",
}
---重置数据
function FightGlobal.Reset()
    FightGlobal.CurType = FightEnum.Type.NORMAL
    leftAtkOrderCount = 0
    rightAtkOrderCount = 0
    UID = 0
    FightGlobal.lastEffectDelayList = {}
    FightGlobal.ChessboardLeft={ {0,0,0,0,0,0},
                                 {0,0,0,0,0,0},
                                 {0,0,0,0,0,0}
    }
    FightGlobal.ChessboardRight={ {0,0,0,0,0,0},
                                  {0,0,0,0,0,0},
                                  {0,0,0,0,0,0}
    }
    FightGlobal.ResetGlobalValue()
end
---获取战斗唯一id
function FightGlobal.GetUID()
    UID = UID + 1
    return UID
end
---获取攻击顺序
function FightGlobal.GetAtkOrder(isLeft)
    if isLeft then
        leftAtkOrderCount = leftAtkOrderCount + 1
        return leftAtkOrderCount
    else
        rightAtkOrderCount = rightAtkOrderCount + 1
        return rightAtkOrderCount
    end
end
---重置全局参数
function FightGlobal.ResetGlobalValue()
    FightGlobal.HPMax= SteamLocalData.tab[103015][2]--生命值 取值最大值
    FightGlobal.m_AgileDMG=SteamLocalData.tab[103010][2]  --闪避减伤
    FightGlobal.m_MaxSkillDef=SteamLocalData.tab[103012][2]*10000  --技能减伤最大值
    FightGlobal.m_MinSkillDef=SteamLocalData.tab[103013][2]*10000  --技能减伤最小值/伤害加深
    FightGlobal.m_AgileDebuff=SteamLocalData.tab[103011][2]
    FightGlobal.m_MaxAtkUp=SteamLocalData.tab[103003][2]*10000--攻击力上下限
    FightGlobal.m_MinAtkUp=SteamLocalData.tab[103004][2]*10000
    FightGlobal.m_MaxDef=SteamLocalData.tab[103001][2]--装甲上下限
    FightGlobal.m_MinDef=SteamLocalData.tab[103002][2]
    FightGlobal.m_MaxAgi=SteamLocalData.tab[103008][2] --闪避上下限
    FightGlobal.m_MinAgi=SteamLocalData.tab[103009][2]
    FightGlobal.m_MaxCrit=SteamLocalData.tab[103005][2] --暴击率上下限
    FightGlobal.m_MinCrit=SteamLocalData.tab[103006][2]
    FightGlobal.m_MinCritDMG=SteamLocalData.tab[103007][2] --最小暴击伤害
    FightGlobal.m_MinSkillHPMax=SteamLocalData.tab[103000][2]*10000 --最大生命值最小值
    FightGlobal.m_Skilldef_k=tonumber(SteamLocalData.tab[103014][2]) --技能减伤系数
end

---解析金币消耗率
FightGlobal.ExpCCoin = {}
FightGlobal.ExpCCoin=tonumber(RoleattrilevelLocalData.tab[1][8])
---解析Exp消耗
FightGlobal.Exp_R1 = {}
FightGlobal.Exp_R1[1]=RoleattrilevelLocalData.tab[1][5]
FightGlobal.Exp_R1[2]=RoleattrilevelLocalData.tab[2][5]
FightGlobal.Exp_R1[3]=RoleattrilevelLocalData.tab[3][5]
FightGlobal.Exp_R1[4]=RoleattrilevelLocalData.tab[4][5]
FightGlobal.Exp_R1[5]=RoleattrilevelLocalData.tab[5][5]
FightGlobal.Exp_R1[6]=RoleattrilevelLocalData.tab[6][5]

FightGlobal.Exp_R2 = {}
FightGlobal.Exp_R2[1]= RoleattrilevelLocalData.tab[7][5]
FightGlobal.Exp_R2[2]= RoleattrilevelLocalData.tab[8][5]
FightGlobal.Exp_R2[3]= RoleattrilevelLocalData.tab[9][5]
FightGlobal.Exp_R2[4]= RoleattrilevelLocalData.tab[10][5]
FightGlobal.Exp_R2[5]= RoleattrilevelLocalData.tab[11][5]
FightGlobal.Exp_R2[6]= RoleattrilevelLocalData.tab[12][5]

FightGlobal.Exp_R3 = {}
FightGlobal.Exp_R3[1]= RoleattrilevelLocalData.tab[13][5]
FightGlobal.Exp_R3[2]= RoleattrilevelLocalData.tab[14][5]
FightGlobal.Exp_R3[3]= RoleattrilevelLocalData.tab[15][5]
FightGlobal.Exp_R3[4]= RoleattrilevelLocalData.tab[16][5]
FightGlobal.Exp_R3[5]= RoleattrilevelLocalData.tab[17][5]
FightGlobal.Exp_R3[6]= RoleattrilevelLocalData.tab[18][5]

FightGlobal.Exp_R4 = {}
FightGlobal.Exp_R4[1]= RoleattrilevelLocalData.tab[19][5]
FightGlobal.Exp_R4[2]= RoleattrilevelLocalData.tab[20][5]
FightGlobal.Exp_R4[3]= RoleattrilevelLocalData.tab[21][5]
FightGlobal.Exp_R4[4]= RoleattrilevelLocalData.tab[22][5]
FightGlobal.Exp_R4[5]= RoleattrilevelLocalData.tab[23][5]
FightGlobal.Exp_R4[6]= RoleattrilevelLocalData.tab[24][5]

--角色基础属性里的分割 ,没有[] 有lv和start ,等级上限
--读字符串 按照{}切割添加到一个表 ,  新建数组记录{}之间的元素下标 ,依次替换  替换完毕后把表的元素依次组合
--然后按照[]切割 替换为对应技能等级的系数
--参数 ,公式 ,施法者引用
--字符串拼接成公式 ,返回 tempTabStr{  "1.5*" ,"lv" }
function FightGlobal.StrToScript(Str, _c1, _c2  )
    if _c1==nil then
        _c1="{"
        _c2="}"
    end
    --切割出等级上限 第一个逗号之前的
    -- print(Str)
    --临时存储当前切割出来的字符串
    local tempTabStr = {}
    --纪录分隔符标记的下标
    local tempCutIndex = {}
    --分隔符标记的下标最大值
    local tempCutMax = 0

    local tempStr =""
    local tempChar = nil
    --是否切割状态
    local tempIsCut = false
    --如果一个切割符都没有
    local tempNullCut = true
    --遍历字符串 直到遇到分隔符
    local stringLen = string.len(Str)

    for i=1,stringLen do
        tempChar=string.sub(Str ,i,i)
        --如果是最后一位直接添加 如果最后一位是 } 移除
        if i==stringLen then
            if tempChar~=_c2 then
                tempStr=tempStr..tempChar
            end
            table.insert(tempTabStr ,tempStr)
            tempStr=""
        elseif tempChar== _c1 then
            if tempStr~="" then
                table.insert(tempTabStr ,tempStr)
                tempStr=""
            end
            tempIsCut=true
            tempNullCut=false
            -- 分割符记录下标
        elseif tempChar== _c2 then
            --切割结束 纪录下标
            table.insert(tempCutIndex,i)
            tempCutMax=tempCutMax+1
            tempIsCut=false
            if tempStr~="" then
                table.insert(tempTabStr ,tempStr)
                tempStr=""
            end
        else
            -- 添加到临时字符串
            tempStr=tempStr..tempChar
        end
    end--遍历字符串 直到遇到分隔符
    --记录公式
    return tempTabStr
end

--字符串切割2  根据传入的多个切割符号切割 ,返回多维数组 字符串 多维切割符号,次要切割符
function FightGlobal.StrArrArr(arrDlm , str  , dlm )
    local tempArrArrReturn = {}--用于返回的最终效果
    --先切割成多维
    local tempTab = string.split(str, arrDlm)
    local tempStr = ""
    local tempTabStr = {}
    --遍历,遇到切割符号就加入新的,否则字符继续往下加
    for k,v in pairs(tempTab) do
        tempTabStr={} --值为空
        local stringLen = string.len(tempTab[k])
        for i=1,stringLen do
            local tempChar=string.sub(tempTab[k] ,i,i)
            local isdlm = false
            --如果是最后一位直接添加
            if i==stringLen then
                -- 判断最后一位是不是切割符
                for a,b in pairs(dlm) do
                    if dlm[a]==tempChar then
                        if tempStr~="" then
                            table.insert(tempTabStr ,tempStr)
                            tempStr=""
                        end
                        isdlm=true
                        break
                    end
                end
                if isdlm == false then
                    tempStr=tempStr..tempChar
                end
                if tempStr~="" then
                    table.insert(tempTabStr ,tempStr)
                    tempStr=""
                    break
                end
            end
            --遇到任意切割符
            for a,b in pairs(dlm) do
                if dlm[a]==tempChar then
                    if tempStr~="" then
                        table.insert(tempTabStr ,tempStr)
                        tempStr=""
                    end
                    isdlm=true
                    break
                end
            end--for ab
            --没有和任意切割符匹配则添加到临时字符串
            if isdlm==false then
                tempStr=tempStr..tempChar
            end
        end--for stringLen
        tempArrArrReturn[k]=tempTabStr
    end
    return tempArrArrReturn
end

return FightGlobal