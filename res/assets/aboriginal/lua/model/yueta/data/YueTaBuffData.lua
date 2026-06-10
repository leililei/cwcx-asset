require("LocalData/SkillLocalData")
---@class YueTaBuffData 活动数据
YueTaBuffData = Class("YueTaBuffData")
-------------构造方法-------------
function YueTaBuffData:ctor(data)
    self.id = data.id                   ---ID
    local tStr = string.split(data.buffid,'_')
    self.buffID = tonumber(tStr[1])           ---BUFFID
    self.buffTarget = tonumber(tStr[2]+1)           ---BUFF对象
    self.score = data.score             ---BUFF积分
    self.isUse = data.enable==1            ---是否启用该BUFF
    self.BUFFTips = ""                  ---BUFF说明
    self.BUFFName = ""                  ---BUFF名
    self.BUFFImg = "0"                   ---BUFF图名称
    local tCfg = SkillLocalData.tab[self.buffID]
    if tCfg then
        self.BUFFTips = self.ReadSkillExplain(tCfg[6], 1)
        self.BUFFName = tCfg[12]
        self.BUFFImg = tCfg[13]=="0" and "0" or "Skill/"..tCfg[13]
    end
end

function YueTaBuffData.ReadSkillExplain(str,realLv)
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

return YueTaBuffData