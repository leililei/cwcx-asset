JNVoidGear={}

JNVoidGear.CurPreviewVoidGear=nil --当前查看的共鸣装备
JNVoidGear.bool_IsExpInit=false
JNVoidGear.GoStraightVoidGearUpgrade=false --是否为直接进入升级界面
--对应品阶的升级需要经验值
JNVoidGear.Exp_R=""
JNVoidGear.Exp_SR=""
JNVoidGear.Exp_SSR=""
JNVoidGear.Coin_R=""
JNVoidGear.Coin_SR=""
JNVoidGear.Coin_SSR=""
JNVoidGear.ExpItemId_R=""
JNVoidGear.ExpItemId_SR=""
JNVoidGear.ExpItemId_SSR=""
JNVoidGear.CoinItemId_R=""
JNVoidGear.CoinItemId_SR=""
JNVoidGear.CoinItemId_SSR=""
JNVoidGear.Exp_ItemId=""
--返回金币
function JNVoidGear.ReturnCoin(_TempVoidGear,_lv)

    local t = load( JNVoidGear.SubFormula_2(_TempVoidGear.CoinFormula,_lv))
    local  returnCoin =t()
    returnCoin=math.floor(returnCoin)
    return  returnCoin
 end
--返回经验值
function JNVoidGear.ReturnExp(_TempVoidGear,_lv)

    local t = load( JNVoidGear.SubFormula_2(_TempVoidGear.ExpFormula,_lv))
    local  returnExp  =t()
    returnExp=math.floor(returnExp)
    return  returnExp
 end
--根据传入JNVoidGear输出替换完的经验计算表达式
function JNVoidGear.SubFormula_2(formulaStr,_Lv)
    --如果没有一个分割符则不需要
    local tempReturnStr="return "
   --遍历所有的变量型字符
   local tempVariable=""
   for k, v in pairs(formulaStr) do
      tempVariable=  formulaStr[k]
    --  print(formulaStr[k] .. "--重新组成字符串" .. tempVariable)
      if tempVariable=="lv" then
         tempReturnStr= tempReturnStr.._Lv
      else
         tempReturnStr= tempReturnStr..formulaStr[k]
      end
   end
 return tempReturnStr
end
--初始化当前系统杂项表中各品阶对应升级经验公式
function JNVoidGear.CreatVoidGearNeedExp()
    -- statements
    -- 切割系统杂项表中对应的品阶共鸣装备升级需要物品表
    local _Str_Rtab=JNStrTool.strSplit(";" ,GameData.tab.steam[24][2])
    local _Str_SRtab=JNStrTool.strSplit(";" ,GameData.tab.steam[24][3])
    local _Str_SSRtab=JNStrTool.strSplit(";" ,GameData.tab.steam[24][4])

    --根据物品表切割出具体消耗信息表
    local _Str_ExpRtab=JNStrTool.strSplit("_" ,_Str_Rtab[1])
    local _Str_ExpSRtab=JNStrTool.strSplit("_" ,_Str_SRtab[1])
    local _Str_ExpSSRtab=JNStrTool.strSplit("_" ,_Str_SSRtab[1])
    local _Str_CoinRtab=JNStrTool.strSplit("_" ,_Str_Rtab[2])
    local _Str_CoinSRtab=JNStrTool.strSplit("_" ,_Str_SRtab[2])
    local _Str_CoinSSRtab=JNStrTool.strSplit("_" ,_Str_SSRtab[2])
    JNVoidGear.ExpItemId_R=_Str_ExpRtab[1]
    JNVoidGear.ExpItemId_SR=_Str_ExpSRtab[1]
    JNVoidGear.ExpItemId_SSR=_Str_ExpSSRtab[1]
    JNVoidGear.CoinItemId_R=_Str_CoinRtab[1]
    JNVoidGear.CoinItemId_SR=_Str_CoinSRtab[1]
    JNVoidGear.CoinItemId_SSR=_Str_CoinSSRtab[1]
    JNVoidGear.Exp_R=JNStrTool.StrToScript(_Str_ExpRtab[2])
    JNVoidGear.Exp_SR=JNStrTool.StrToScript(_Str_ExpSRtab[2])
    JNVoidGear.Exp_SSR=JNStrTool.StrToScript(_Str_ExpSSRtab[2])
    JNVoidGear.Coin_R=JNStrTool.StrToScript(_Str_CoinRtab[2])
    JNVoidGear.Coin_SR=JNStrTool.StrToScript(_Str_CoinSRtab[2])
    JNVoidGear.Coin_SSR=JNStrTool.StrToScript(_Str_CoinSSRtab[2])
end

-- @param _ID 共鸣装备ID
-- @param _Exp 共鸣装备当前经验值
-- @param _Lv 共鸣装备当前等级
-- @param _HeroId 共鸣装备对应使用者机娘ID
-- @param _InfoTab 共鸣装备表中对应该ID的数据表
-- @function 共鸣装备类表
function JNVoidGear:new(_ID,_Exp,_Lv,_HeroId,_InfoTab)
    -- statements
    local VoidGear = {}
    setmetatable(VoidGear, self)
    self.__index = self
    VoidGear.Rank=_InfoTab[7]
    VoidGear.ID=_ID
    VoidGear.Exp=_Exp
    VoidGear.Lv=_Lv
    VoidGear.HeroId=_HeroId
    VoidGear.InfoTab=_InfoTab
    VoidGear.slot=_InfoTab[8]
    --默认未拥有
    VoidGear.IsOwn=false
    VoidGear.ExpFormula=""
    VoidGear.CoinFormula=""
    VoidGear.ExpNeedItemId=""
    VoidGear.CoinNeedItemId=""
    if JNVoidGear.bool_IsExpInit == false then
        -- statements
        JNVoidGear.CreatVoidGearNeedExp()
        JNVoidGear.bool_IsExpInit = true
    end
    if VoidGear.Rank == "2" then
        -- statements
        VoidGear.ExpFormula=JNVoidGear.Exp_R
        VoidGear.CoinFormula=JNVoidGear.Coin_R
        VoidGear.ExpNeedItemId=JNVoidGear.ExpItemId_R
        VoidGear.CoinNeedItemId=JNVoidGear.CoinItemId_R
        elseif VoidGear.Rank == "3" then
            -- statements
            VoidGear.ExpFormula=JNVoidGear.Exp_SR
            VoidGear.CoinFormula=JNVoidGear.Coin_SR
            VoidGear.ExpNeedItemId=JNVoidGear.ExpItemId_SR
            VoidGear.CoinNeedItemId=JNVoidGear.CoinItemId_SR
        elseif VoidGear.Rank == "4" then
            VoidGear.ExpFormula=JNVoidGear.Exp_SSR
            VoidGear.CoinFormula=JNVoidGear.Coin_SSR
            VoidGear.ExpNeedItemId=JNVoidGear.ExpItemId_SSR
            VoidGear.CoinNeedItemId=JNVoidGear.CoinItemId_SSR
    else
        VoidGear.ExpFormula=JNVoidGear.Exp_R
        VoidGear.CoinFormula=JNVoidGear.Coin_R
        VoidGear.ExpNeedItemId=JNVoidGear.ExpItemId_R
        VoidGear.CoinNeedItemId=JNVoidGear.CoinItemId_R
    end
    return VoidGear
end

-- @function 根据共鸣装备ID创建一个默认的共鸣装备类表(不需要服务器数据)
function JNVoidGear.CreatVoidGearDefault(_ID,_Slot)
    -- statements
    -- print("开始创建默认共鸣装备，角色ID是".._ID.."槽位是".._Slot)
    local _VoidGear={}
    for key, value in pairs(GameData.tab.roleequipment) do
        -- statements
        if _ID == value[6] and _Slot == value[8] then
            -- statements
            _VoidGear=JNVoidGear:new(value[1],"0","1",value[6],value)
        end
    end
    return _VoidGear
end

-- @function 机娘共鸣背包信息表
function JNVoidGear:RoleVoidGearNew(_ID,_Star,_Rank,_ProType,_IsAwaken,_IconImgName,_RoleName,_IsOwn)
    -- 建立一个机娘共鸣装备信息表
    local RoleData = {}
    setmetatable(RoleData, self)
    self.__index = self
    RoleData.ID=_ID
    RoleData.Star=_Star
    RoleData.Rank=_Rank
    RoleData.ProType=_ProType
    RoleData.IsAwaken=_IsAwaken
    RoleData.IconImgName=_IconImgName
    RoleData.RoleName=_RoleName
    RoleData.IsOwn=_IsOwn
    --存储一个VoidGear对象表
    RoleData.VoidGear1=nil
    RoleData.VoidGear2=nil
    RoleData.VoidGear3=nil
    RoleData.VoidOwnSum=0
    return RoleData
end
return JNVoidGear