require("LocalData/Special_effectLocalData")
require("JNBattle/JNStrTool")

--存所有的特效

JNAllEffect={}
JNAllEffect.Id=1  --本回合第几个结算 可以插队
JNAllEffect.AktRole=nil  --攻击者  id
JNAllEffect.HitRole=nil  --受击者  id
JNAllEffect.IsMianTar=false  --是否主要目标,一般只对主要目标生成特效

JNAllEffect.Id=0        --
JNAllEffect.AniType=0 --0.龙骨动画，1.unity
JNAllEffect.Endtime=0  --unity特效使用 到时间回收
JNAllEffect.Name=""    --文件名
JNAllEffect.TimerType=0  --0.为常规特效：从第1帧计时1.为受击特效：攻击者的攻击帧开始计时
JNAllEffect.AniName=""   --动画名 0为第一个
JNAllEffect.Sound_delay=0
JNAllEffect.Sound=""
JNAllEffect.Delay=0        --帧数单位/30
JNAllEffect.StartPosType=0  --0.施法者，1.作用者
JNAllEffect.StartPos_X=0  --格式：X值，Y值，Z轴层级
JNAllEffect.StartPos_Y=0 
JNAllEffect.StartPos_Z=0 
JNAllEffect.EndPosType=0   --0.施法者，1.作用者
JNAllEffect.EndPosOffsetType=0  --终点位置偏移0.脚底，1.身体中间，2.头顶  
JNAllEffect.EndPos_X=0
JNAllEffect.EndPos_Y=0
JNAllEffect.EndPos_Z=0
JNAllEffect.FlyType=0 --0.不飞行 只在起点播放 ，1.旋转且直线飞行，2.抛物线飞行，3.不旋转且直线飞行
JNAllEffect.IsLoop=0   --0.不循环，1.循环
JNAllEffect.FlySpeed=0 
JNAllEffect.Rot_X=0
JNAllEffect.Rot_Y=0
JNAllEffect.Rot_Z=0
JNAllEffect.TimeScal=1   --动画播放速率
JNAllEffect.LocScale_X=1  --缩放
JNAllEffect.LocScale_Y=1


--外部调用创建新特效
function JNAllEffect:new(_EffectId ,_AtkId,_HidId)
    o = {}
    setmetatable(o, self)
    self.__index = self
   --
   o.Id=tonumber(_EffectId)

   local tempEffectData={}
   local tempId="".._EffectId

   o.Effects=tonumber()
   tempEffectData = Special_effectLocalData.tab[tonumber(tempId)]
    o.AniType=tempEffectData[2]
    o.Endtime=tempEffectData[3]
    o.Name=tempEffectData[4]
    o.TimerType=tempEffectData[5]
    o.AniName=tempEffectData[7]
    o.Sound_delay=tempEffectData[8]
    o.Sound=tempEffectData[9]
    o.Delay=tempEffectData[10]
    o.StartPosType=tempEffectData[11]
    --起点坐标偏移
    local tempPosArr=JNStrTool.strSplit("," ,tempEffectData[12])
    o.StartPos_X=tempPosArr[1]
    o.StartPos_Y=tempPosArr[2]
    o.StartPos_Z=tempPosArr[3]
    o.EndPosType=tempEffectData[13]
    o.EndPosOffsetType=tempEffectData[14]
    --终点坐标偏移
    tempPosArr=JNStrTool.strSplit("," ,tempEffectData[15])
    o.EndPos_X=tempPosArr[1]
    o.EndPos_Y=tempPosArr[2]
    o.EndPos_Z=tempPosArr[3]
    o.FlyType=tempEffectData[16]
    o.IsLoop=tempEffectData[17]
    o.FlySpeed=tempEffectData[18]
    --旋转
    tempPosArr=JNStrTool.strSplit("," ,tempEffectData[19])
    o.Rot_X=tempPosArr[1]
    o.Rot_Y=tempPosArr[2]
    o.Rot_Z=tempPosArr[3]

    o.TimeScal=tempEffectData[20]
    tempPosArr=JNStrTool.strSplit("," ,tempEffectData[21])
    o.LocScale_X=tempPosArr[1]
    o.LocScale_Y=tempPosArr[2]
   

    return o
 end

return JNAllEffect