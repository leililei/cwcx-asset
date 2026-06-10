FightEnum = {}

---战斗类型
FightEnum.Type = {
    NONE = 0,
    NORMAL = 1,         ---常规
    BOSS = 2,           ---2因为配置表中存在，保留（原为BOSS战已弃用）
    PVP = 3,            ---玩家对战
    PVP_BACK = 4,       ---PVP战斗回放
    WORLD_BOSS = 5,     ---世界boss
    NOVICE = 6,         ---引导
    PVP_READY = 7,      ---PVP预备阶段(主要区分不创建右侧)
    NORMAL_BOSS = 15,   ---常规战斗BOSS

}
---拖拽类型
FightEnum.DragType = {
    NONE = 0,   --0、无点击
    SET_CHARACTER = 1,   --1、设置角色
    CLICK_SET_ORDER = 2,   --2、问号排序模式
    SWITCH = 3,     --3、交换排序模式
    ---0、无点击，1、设置角色，2、问号排序模式，3、交换排序模式，4、战斗中
}

---战斗对应ui
FightEnum.UI = {
    [FightEnum.Type.NORMAL] = UID.Battle02_UI,
    [FightEnum.Type.BOSS] = UID.Battle02_UI,
    [FightEnum.Type.NORMAL_BOSS] = UID.Battle02_UI,

    [FightEnum.Type.NOVICE] = UID.NoviceBattle_UI,

    [FightEnum.Type.WORLD_BOSS] = UID.Battle02_UI,

    [FightEnum.Type.PVP] = UID.PVPReady_UI,
    [FightEnum.Type.PVP_READY] = UID.PVPReady_UI,
}

---战斗固定阵容id
FightEnum.TeamUID = {
    ---默认阵容
    NORMAL = 0,
    ---助战Npc阵容固定保存id
    EXIST_NPC = 666,
    ---Pvp阵容1
    PVP_1 = 10000,
    ---Pvp阵容2
    PVP_2 = 10001,
    ---其他id为常规保存阵型id
}
---战斗特效类型
FightEnum.EffectType = {
    DB = 0,
    U3D = 1,
    VIDEO = 2, ---视频播完删除
    NONE = 3, ---没有目标
    SPINE = 4,
}
---战斗特效飞行类型
FightEnum.EffectFlyType = {
    NORMAL = 0,     ---闪现到目标处
    SPIN = 1,       ---自旋前进
    CURVE = 2,      ---抛物线
    LINE = 3,       ---直线前进
    SINE = 4,       ---正弦移动
}
---战斗特效时间类型
FightEnum.EffectTimeType = {
    NORMAL = 0, ---常规特效到时间结束
    HIT = 1, ---受击特效 ,同上
    ATK = 2, ---只对主要目标使用
    BUFF = 3, ---自己不会销毁 而且要跟随目标
    FOLLOW_ACTION = 4,---跟随动作
}
---战斗特效POS类型
FightEnum.EffectPosType = {
    ATK = 0,    ---施法方
    HIT = 1,    ---作用方
}
---战斗角色状态
FightEnum.AniType = {
    NONE = 0,   ---空
    FLY_0 = 1,  ---登场1
    FLY_1 = 2,  ---登场2
    DIE = 3,    ---死亡
    PASS = 4,   ---晕眩
    HIT = 5,    ---受击
    PD_0 = 6,   ---前进0
    PD_1 = 7,   ---前进1
    PD_2 = 8,   ---前进2
    HC_0 = 9,   ---回撤0
    HC_1 = 10,  ---回撤1
    HC_2 = 11,  ---回撤2
    ATK = 12,   ---攻击
    ATK_0 = 13, ---蓄力
    ATK_1 = 14, ---攻击1
    ATK_2 = 15, ---撞击
    WAIT = 16,  ---待机
}
---角色职业
FightEnum.Occupation = {
    HEAVY = 1,      ---装甲
    NIMBLE = 2,     ---攻击
    MYSTICAL = 3,   ---法师
    HELPER = 4,     ---支援
}

---地板特效类型
FightEnum.FloorType = {
    LINE_RED = "line_red.prefab",
    BOX_RED = "box_red.prefab",
    DOT_RED = "dot_red.prefab",
    DOT_RED2 = "dot_red.prefab",
    LINE_YELLOW = "line_yellow.prefab",
    BOX_YELLOW = "box_yellow.prefab",
    DOT_YELLOW = "dot_yellow.prefab",
    DOT_YELLOW2 = "dot_yellow.prefab",
    BOX_FANGWEI = "box_fangwei.prefab", --肉盾
    BOX_GONGJI = "box_gongji.prefab",   --战士
    BOX_HUOLI = "box_huoli.prefab",   --法师
    BOX_ZHIYUAN = "box_zhiyuan.prefab", --治疗
}

FightEnum.beAtkType = {
    BE_ATK = 5,
    BE_SUPPORT = 6,
}

---战斗角色行动
FightEnum.Action = {

}

FightEnum.BattleTurnStep = {
    TURN_START = 1,     --turn开始
    BEF_NOR_EX = 2,     --普攻前EX
    BEF_NOR_ATK = 3,    --攻击方普攻前
    BEF_NOR_HIT = 4,    --受击方普攻前
    NORMAL_ATK = 5,     --普攻
    AFT_NOR_HIT = 6,    --受击方普攻后
    AFT_NOR_ATK = 7,    --攻击方普攻后
    AFT_NOR_EX = 8,     --普攻后EX
    TURN_END = 9,       --回合结束
}