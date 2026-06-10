require("JNBattle/JNSkill")
require("JNBattle/BattleRole")

JNTrun={}
JNTrun.Id=1  --本回合第几个结算 可以插队
JNTrun.JnSkill=nil   --技能引用
JNTrun.AktRole=nil  --攻击者引用
JNTrun.HitRole=nil  --受击者引用
JNTrun.IsMianTar=false  --是否主要目标

--外部调用创建新角色
function JNTrun:new()
    o = {}
    setmetatable(o, self)
    self.__index = self
   
    return o
 
 end

return JNTrun