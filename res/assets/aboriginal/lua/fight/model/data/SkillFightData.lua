---@class SkillFightData
SkillFightData = Class("SkillFightData")
-------------构造方法-------------
--外部调用创建新技能 传入 id和等级 等级用来代入数据 ,角色是否已经觉醒
function SkillFightData:ctor(skillId , realLv, isAwake, _isSLv)
    self.id =tonumber(skillId)
    self.realLv=realLv
    ---解析技能属性
    self.effects ={}
    local config = SkillLocalData.tab[tonumber(skillId)]
    --解析属性
    --print( " --解析属性   ----------" ..skillId)
    ---解析能否添加技能
    self.target_condition_str = config[2]
    --  JNSkill.ReadSkillCanUse(tempSkillData[2],o)
    self.action = config[3]
    ---特效id,延迟
    --print(skillId .."id" )
    --print(tempSkillData[5])   JNStrTool.SubAtkEffectId(tempSkillData[5])
    self.delay_str = config[4]  --延迟字符串
    self.beHitTrans_str = config[35]
    -- print(tempSkillData[6] )
    self.showEffects_str = config[5]
    ---获取技能特效id和延迟
    self.showEffects = self.SubAtkEffectId(config[5])  --JNSkill.ReadShowEffect(tempSkillData[5])
    ---说明文本
    local configIdx = 6
    self.explain = self.ReadSkillExplain(config[configIdx],realLv)
    ---cd 所有人攻击一次是一轮 按轮
    self.cdRound =tonumber(config[7])
    self.cdRound_count = -1 * self.cdRound
    ---是否觉醒
    if config[8]=="0" then
        self.awaken = false
    else
        self.awaken = true
    end
    ---觉醒技能要判断自己是否已经觉醒否则上锁
    if isAwake == false  then
        if self.awaken then
            self.isLock = true
        end
    end
    ---0级显示1级效果,加上锁表示不能使用
    self.subtitle = config[33]
    if realLv<1 then
        realLv=1
        self.isLock = true
    end
    self.isSLv = _isSLv
    self.exSkill = tonumber(config[9])
    self.skillType1 = tonumber(config[10])
    self.skillType2 = tonumber(config[11])
    self.name = config[12]
    self.icon = config[13]
    self.opportunity = tonumber(config[14])
    self.object = tonumber(config[15])
    self.time = self.ReadSkillTime(config[16],realLv) --tonumber(tempSkillData[tempEffect])   --持续时间
    self.exception = config[17]
    ---读取禁用技能列表
    self:ReadException()
    local tempEffectIndex = 18
    local templ = 1
    ---解析所有技能效果
    self:SubEffectAttr(config,tempEffectIndex,templ,realLv)
end

--解析出本回合特效表 {{{a1,延迟},{a2,延迟}}, {b1,b2}} a和b同步 a2延迟a1的时间播放
function SkillFightData.SubAtkEffectId(_str)
    --print( "特效表===================================="  .._Str)
    local ReturnAtkEff={}
    --按照分号切割,
    local FenStr= string.split(_str,";")
    --按照逗号切割
    for key, value in pairs(FenStr) do
        --     print("分号切割后" ..FenStr[key])
        local DouStr= string.split(FenStr[key],",")
        --用下划线分割
        local XiaStr={}
        for a, b in pairs(DouStr) do
            --   print("dou号切割后" ..DouStr[a])
            local  TempXiaStr= string.split(DouStr[a],"_")
            for x, y in pairs(TempXiaStr) do
                --print(TempXiaStr[x])
            end
            table.insert(XiaStr,TempXiaStr)
        end
        table.insert(ReturnAtkEff,XiaStr)
    end
    return ReturnAtkEff
end
--解析技能说明 然后乘以100

function SkillFightData.ReadSkillExplain(str,realLv)
    --第一次遇到[开始  把所有的加入临时字符串 ,然后用 & 切割  ]
    local tempIsSubF = false
    local tempChar=""
    local tempStr =""
    local tempTab ={}
    local tempLvStr = "" --等级相关的属性
    --最后一位 ,[  , ]  三种情况都会生成一个字符串
    local stringLen = string.len(str)
    for i = 1, stringLen do
        tempChar=string.sub(str,i,i)
        --已经在isSub的
        if tempIsSubF then
            -- 都加入到 tempLvStr ,直到遇到 ]
            if tempChar=="]" then
                tempIsSubF=false
                --切割tempLvTab
                local tempLvArr = JNStrTool.strSplit("&", tempLvStr)
                --找到对应等级的属性
                -- tempStr=tempLvStr
                for k, v in pairs(tempLvArr) do
                    if realLv>=k then
                        -- 等级大于下标
                        tempStr=tonumber(tempLvArr[k]) *100
                    end
                end-- for kv
                --然后加入到总函数里
                table.insert(tempTab, tempStr)
                tempStr=""
            else
                tempLvStr=tempLvStr..tempChar
            end
        else
            if i==stringLen then
                tempStr=tempStr..tempChar
                if tempStr~="" then
                    table.insert(tempTab, tempStr)
                end
                tempStr=""
            elseif tempChar=="[" then
                tempLvStr=""
                tempIsSubF=true
                if tempStr~="" then
                    table.insert(tempTab, tempStr)
                end
                tempStr=""
            else
                tempStr=tempStr..tempChar
            end --i==stringLen
        end-- if tempIsSubF
    end -- for i = 1,
    --拼接成字符串添加给tempEffect.EffectExactFml
    local returnStr = ""
    for k, v in pairs(tempTab) do
        returnStr=returnStr..tempTab[k]
    end
    return  returnStr
end

--解析技能时间
function SkillFightData.ReadSkillTime(str,realLv)
    local  temptime = tonumber(str)
    --第一次遇到[开始  把所有的加入临时字符串 ,然后用 & 切割  ]
    local tempIsSubF = false
    local tempChar=""
    local tempStr =""
    local tempTab ={}
    local tempLvStr = "" --等级相关的属性
    --最后一位 ,[  , ]  三种情况都会生成一个字符串
    local stringLen = string.len(str)
    for i = 1, stringLen do
        tempChar=string.sub(str,i,i)
        --已经在isSub的
        if tempIsSubF then
            -- 都加入到 tempLvStr ,直到遇到 ]
            if tempChar=="]" then
                tempIsSubF=false
                --切割tempLvTab
                local tempLvArr = JNStrTool.strSplit("&", tempLvStr)
                --找到对应等级的属性
                for k, v in pairs(tempLvArr) do
                    if realLv>=k then
                        -- 等级大于下标
                        tempStr=tempLvArr[k]
                        temptime=tempLvArr[k]
                    end
                end-- for kv
                --然后加入到总函数里
                table.insert(tempTab, tempStr)
                tempStr=""
            else
                tempLvStr=tempLvStr..tempChar
            end
        else
            if i==stringLen then
                tempStr=tempStr..tempChar
                if tempStr~="" then
                    table.insert(tempTab, tempStr)
                end
                tempStr=""
            elseif tempChar=="[" then
                tempIsSubF=true
                if tempStr~="" then
                    table.insert(tempTab, tempStr)
                end
                tempStr=""
            else
                tempStr=tempStr..tempChar
            end --i==stringLen
        end-- if tempIsSubF
    end -- for i = 1,
    temptime=tonumber(temptime)
    return  temptime
end

--解析例外事项
function SkillFightData.ReadException(_tempSkill)
    local  _str=_tempSkill.Exception   -- 用@
    local tempArr = string.split(_str,"@")
    for key, value in pairs(tempArr) do
        if value=="1" then
            self.contRemove =false  --不可解除
        elseif value=="2" then
            -- statements
        elseif value=="3" then
            self.contImmune =true   --无视免疫
        elseif value=="4" then
            self.contBan =true     --不可禁止
        elseif value=="5" then
            self.contCirt =true   --不能暴击
        elseif value=="6" then
            self.canSuperposition = true  --叠加  一般都不可叠加
        elseif value=="7" then
            self.contResurrection = true  --禁止复活
        end
    end
end

---解析所有技能效果
function SkillFightData:SubEffectAttr(config,tempEffectIndex,templ,realLv)
    for i = 1, 3, 1 do
        ---循环判断是否有下一个条件  为0就没有了
        if config[tempEffectIndex+3]==nil or config[tempEffectIndex+2]=="0" then
            -- print( i.."--循环判断是否有下一个条件  为0就没有了" )
            break
        else
            ---解析具体效果 ,第一个效果必有
            local tempEffect = {}
            local Str = config[tempEffectIndex]
            --- tempEffect.target_condition=tempSkillData[tempEffectIndex]
            --- 解析数据
            tempEffect.target_condition_str=Str
            ---先判断是和还是或者
            tempEffect.target_condition={}


            tempEffect.EffectObj= config[tempEffectIndex+1]
            ---解析分出效果,参数
            --  print(skillId)
            tempEffect = self:ReadEffect(config[tempEffectIndex+2], realLv, tempEffect)

            tempEffect.trunTimes =tonumber(config[tempEffectIndex+3])
            tempEffect.maxTimes = config[tempEffectIndex+4]
            tempEffectIndex=tempEffectIndex+5
            table.insert(self.effects,tempEffect)
            templ=templ+1
        end
    end--for i = 1, 10
    --  print( "技能效果长度"..templ)
    if config[34]=="1" then
        self.display=false
    else
        self.display=true  --默认显示
    end
end
--解析技能效果字符串
function SkillFightData:ReadEffect(str, realLv , tempEffect)
    --用@切割 得到效果组
    local tempEffArr= string.split(str,"@")
    tempEffect.EffectType={}
    tempEffect.EffectExactFml={}
    --遍历所有效果
    for a, b in pairs(tempEffArr) do
        --按照 _ 切割
        local tempStrArr= string.split(tempEffArr[a],"_")
        local _ShowTime=false
        if tonumber(tempStrArr[1])==2  then
            _ShowTime=true
        end
        table.insert( tempEffect.EffectType,tonumber(tempStrArr[1]))  -- tempEffect.EffectType=tonumber(tempStrArr[1])
        tempEffArr[a]=tempStrArr[2]
        --第一次遇到[开始  把所有的加入临时字符串 ,然后用 & 切割  ]
        local tempIsSubF = false
        local tempChar=""
        local tempStr =""
        local tempTab ={}
        local tempLvStr = "" --等级相关的属性
        local name = b
        --最后一位 ,[  , ]  三种情况都会生成一个字符串
        local stringLen = string.len(tempEffArr[a])
        for i = 1, stringLen do
            tempChar=string.sub(tempEffArr[a],i,i)
            --已经在isSub的
            if tempIsSubF then
                -- 都加入到 tempLvStr ,直到遇到 ]
                if tempChar=="]" then
                    tempIsSubF=false
                    --切割tempLvTab
                    local tempLvArr = string.split(tempLvStr,"&")
                    --找到对应等级的属性
                    for k, v in pairs(tempLvArr) do
                        if realLv>=k then
                            -- 等级大于下标
                            tempStr=tempLvArr[k]
                        end
                    end-- for kv
                    --然后加入到总函数里
                    if _ShowTime  then
                        self.showTime =tonumber(tempStr)
                    end
                    table.insert(tempTab, tempStr)
                    tempStr=""
                else
                    tempLvStr=tempLvStr..tempChar
                end
            else
                if i==stringLen then
                    tempStr=tempStr..tempChar
                    if tempStr~="" then
                        table.insert(tempTab, tempStr)
                    end
                    tempStr=""
                elseif tempChar=="[" then
                    tempLvStr=""
                    tempIsSubF=true
                    if tempStr~="" then
                        table.insert(tempTab, tempStr)
                    end
                    tempStr=""
                else
                    tempStr=tempStr..tempChar
                end --i==stringLen
            end-- if tempIsSubF
        end -- for i = 1,
        --拼接成字符串添加给tempEffect.EffectExactFml
        local returnStr = ""
        for k, v in pairs(tempTab) do
            returnStr=returnStr..tempTab[k]
        end
        --去掉{} 并且形成技能参数
        local tempFormula = FightGlobal.StrToScript(returnStr)
        -- print( "技能效果公式".. returnStr)
        table.insert(tempEffect.EffectExactFml, tempFormula)
    end--遍历所有效果
    return tempEffect
end


return SkillFightData