require("LocalData/TypeenumerateLocalData")

---@alias int number @ 指示数据类型为整型
---@alias long number @ 指示数据类型为长整型

---通用方法
Global = {}

---@return string 获取千分位数字字符串
function Global.GetPointNumber(number, dep)
    local str1 =""
    local str = tostring(number)
    local strLen = string.len(str)

    if dep == nil then
        dep = ","
    end
    dep = tostring(dep)

    for i=1,strLen do
        str1 = string.char(string.byte(str,strLen+1 - i))..str1
        if  i % 3 == 0 then
            --下一个数 还有
            if strLen - i ~= 0 then
                str1 = ","..str1
            end
        end
    end
    return str1
end
-------------------------时间-----------------------------
---获取当前时间(服务器的)
function Global.GetCurTime()
    return MgrNet.GetServerTime()
end
---获取今天几号
function Global.GetToDay()
    local refreshTime = string.split(SteamLocalData.tab[112000][2],":")
    local totalSec = tonumber(refreshTime[1])*3600 + tonumber(refreshTime[2])*60 + tonumber(refreshTime[3])
    
    local time = MgrNet.GetServerTime()-totalSec
    local toDay = os.date("%d",time + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    return tonumber(toDay)
end

---获取当前属于几月
function Global.GetToMonth()
    local time = MgrNet.GetServerTime()
    local toDay = os.date("%m",time + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    return tonumber(toDay)
end

---获取当前年份
function Global.GetToYear()
    local time = MgrNet.GetServerTime()
    local toDay = os.date("%Y",time + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    return tonumber(toDay)
end

function Global.GetClientTimeZone()
    local now = os.time()
    local difftime = os.difftime(now, os.time(os.date("!*t", now)))
    return math.floor(difftime / 3600)
end

---获取当前月有多少天
function Global.GetTotalDays()
    --获取当前时间戳
    local curTimestamp = Global.GetCurTime()
    --local timeZone = Tool.GetClientTimeZone()   --玩家时区
    --curTimestamp = curTimestamp + timeZone * 3600
    --local nowDate = os.date("!*t", curTimestamp);
    local nowDate = os.date("!*t", curTimestamp + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    --for i = 1, 15 do
    --    local dangyuetianshu = tonumber(os.date("%d",os.time({year = nowDate.year,month = i ,day = 0})))
    --    dangyuetianshu = 1
    return tonumber(os.date("%d",os.time({year = nowDate.year,month = nowDate.month+1 ,day = 0}) + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
    --return tonumber(os.date("%d",os.time({year=os.date("%Y"),month=os.date("%m") + 1 > 12 and 1 ,day=0})))
end

---获取上月有多少天
function Global.GetLastMonthTotalDays()
    --获取当前时间戳
    local curTimestamp = Global.GetCurTime()
    --local timeZone = Tool.GetClientTimeZone()   --玩家时区
    --curTimestamp = curTimestamp + timeZone * 3600
    --local nowDate = os.date("!*t", curTimestamp);
    local nowDate = os.date("!*t", curTimestamp + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    
    return tonumber(os.date("%d",os.time({year = nowDate.year,month = nowDate.month,day = 0}) + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
    --return tonumber(os.date("%d",os.time({year=os.date("%Y"),month=os.date("%m"),day=0})))
end

---获取日期
function Global.GetDate()
    local time = MgrNet.GetServerTime() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
    local today = os.date("%Y-%m-%d-%H:%M:%S", time)
    return today
end

function Global.TimeToDate(time)
    if time > math.abs(tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600  then
        time = time + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
    end
    local today = os.date("%Y-%m-%d-%H-%M-%S", time)
    return today
end

---获取时间拼接
function Global.GetTimeByStr(str, time)
    if time then
        return os.date(str,time)
    else
        return os.date(str,MgrNet.GetServerTime())
    end
end
---时间戳转剩余天数
function Global.TimeToDays(time)
    local days = time / (24*60*60)
    days = math.modf(days) + 1
    return days
end

function Global.Second2Format(second)
    local day = math.floor(second / (3600 * 24));
    second = second - day * 3600 * 24;
    local hour = math.floor(second / 3600);
    second = second - hour * 3600;
    local minute = math.floor(second / 60);
    second = second - minute * 60;
    return day, hour, minute, second
end

---时间戳转剩余天数(小于1天返回小时)
function Global.GetRemainTime(remainTime)
    local str = ""
    if remainTime / (3600*24) >= 1 then
        ---剩余天数
        str = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus")..math.modf(remainTime/(3600*24)).."</color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    elseif _remainTime < 0 then
        --活动已结束
        str = MgrLanguageData.GetLanguageByKey("assetsscrollitem_tips2")
    else
        ---剩余小时数
        local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
        str = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus")..hour.."</color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
    return str
end
---时间差转换成 分钟/小时/天数
function Global.GetTimeByDifference(time)
    local str = ""
    if time / (3600*24) >= 1 then
        ---%s天数前
        str = math.modf(time/(3600*24))..MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips2")
    elseif time / 3600 >= 1 then
        ---%s小时前
        local hour = math.floor(time / 3600)
        str = hour..MgrLanguageData.GetLanguageByKey("friendavatar_ui_fewhourago")
    else
        ---%s分钟前
        local minute = math.floor(time / 60)
        str = minute.."</color>"..MgrLanguageData.GetLanguageByKey("friendavatar_ui_fewminago")
    end
    
    return str
end
---获取格式时间 剩余xx天/时/分
function Global.GetTimeMode(time,frontStr)
    local str = frontStr and MgrLanguageData.GetLanguageByKey(frontStr) or ""
    local curTime = time > 0 and time or 0
    if curTime / (3600*24) >= 1 then
        ---天数
        str = str..math.modf(curTime/(3600*24))..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    elseif curTime / 3600 >= 1 then
        ---小时
        local hour = math.floor(curTime / 3600)
        str = str..hour..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    else
        ---分钟
        local minute = math.floor(curTime / 60)
        str = str..minute..MgrLanguageData.GetLanguageByKey("backrub_ui_shower_minute")
    end
    
    return str
end

--获得界面显示时间的string
function Global.GetTimeFormat(tBeginTime,tEndTime)
    return tBeginTime[1].."/"..tBeginTime[2].."/"..tBeginTime[3].." "..tBeginTime[4]..":"..tBeginTime[5].."~"..
    tEndTime[1].."/"..tEndTime[2].."/"..tEndTime[3].." "..tEndTime[4]..":"..tEndTime[5]
end

--获得界面显示单个时间的string
function Global.GetAloneTimeFormat(_time)
    local tTime = _time
    if type(_time) == "number" then
        tTime = Global.TimeToDate(_time)
    end
    tTime = string.split(tTime,'-')
    
    return tTime[1].."/"..tTime[2].."/"..tTime[3].." "..tTime[4]..":"..tTime[5]
end
---@param str string "%Y-%m-%d-%H-%M-%S"
---@return number 时间戳转化
function Global.GetTimeByStr(str)
    local time = string.split(str,"-")
    for i = 1, 6 do
        if time[i] == nil then
            time[i] = "0"
        end
    end
    local y = tonumber(time[1])
    --lua底层在安卓端int最大32位，那么能表示的最大值是2147483647，距离1970-01-01 08:00:00这么多秒的时间正是2038-01-19 03:14:07。
    --所以超过这个时间会报错。
    if y > 2037 then
        y = 2037
    end
    local time = tonumber(os.time({ year= y, month= time[2], day= time[3], hour= tonumber(time[4]) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()), min= time[5], sec = time[6]}))
    return time
end
---时间戳差值转化
function Global.GetTimeStamp(timeStr)
    ---服务器时间
    local serverTime = MgrNet.GetServerTime()
    local c_s = os.date("%Y-%m-%d-%H-%M-%S",serverTime + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600) --服务器实际日期
    local c_st = string.split(c_s,"-")
    ---传入时间
    local st = string.split(timeStr, "-")
    local diff = #c_st - #st
    for i = 1, #st do
        c_st[i+diff] = st[i]
    end
    local time=
    {
        year = c_st[1],
        month = c_st[2],
        day = c_st[3],
        hour = c_st[4] - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()),
        minute = c_st[5],
        second = c_st[6],
    }
    return tonumber(os.time(time))
end
---当前时间戳是否在阈值内,参数number时间戳或‘年-月-日-时-分-秒’字符串
function Global.isMiddleTime(beginTime, endTime)
    local _bt = beginTime
    local _et = endTime
    if beginTime == "" or endTime == "" or beginTime == "0" or endTime == "0" then
        return false
    end
    if type(beginTime) == "string" then
        ---转换字符为时间戳
        local str = string.split(beginTime,"-")
        _bt = tonumber(os.time({year=str[1], month = str[2], day = str[3], hour = str[4], min = str[5], sec = str[6]}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    end
    if type(endTime) == "string" then
        ---转换字符为时间戳
        local str = string.split(endTime,"-")
        _et = tonumber(os.time({year=str[1], month = str[2], day = str[3], hour = str[4], min = str[5], sec = str[6]}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    end
    ---获取服务器时间
    local time = tonumber(MgrNet.GetServerTime())
    if _bt > time then
        return false
    end
    if _et < time then
        return false
    end
    return true
end
---获取创角天数(按每天早上5点，为零点)
function Global.GetCreateRoleDays(_time)
    ---服务器时间
    local serverTime = MgrNet.GetServerTime()
    if _time then
        serverTime = _time
    end
    local createTime = os.date("%H-%M-%S", PlayerControl.GetPlayerData().createTime + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    local timeStr = string.split(createTime, "-")
    local hms = tonumber(timeStr[1]) * 60 * 60 + tonumber(timeStr[2]) * 60 + tonumber(timeStr[3])
    hms = hms < 18000 and hms + 86400 or hms
    local drt = PlayerControl.GetPlayerData().createTime - hms
    local tday = math.floor((serverTime - drt - 18000) / 86400) + 1
    return tday
end

---传入两个时间戳，检查是否是同一天
function Global.CheckIsSameDay(stamp1,stamp2)
    return os.date("%Y-%m-%d",stamp1 + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600) == os.date("%Y-%m-%d",stamp2 + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
end

---获取时间状态(1.未达到 2.在时间内 3.已超过)
function Global.GetTimeState(beginTime, endTime)
    local _bt = beginTime
    local _et = endTime
    if beginTime == "" or endTime == "" then
        return
    end
    if type(beginTime) == "string" then
        ---转换字符为时间戳
        local str = string.split(beginTime,"-")
        _bt = tonumber(os.time({year=str[1], month = str[2], day = str[3], hour = str[4], min = str[5], sec = str[6]}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    end
    if type(endTime) == "string" then
        ---转换字符为时间戳
        local str = string.split(endTime,"-")
        _et = tonumber(os.time({year=str[1], month = str[2], day = str[3], hour = str[4], min = str[5], sec = str[6]}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    end
    ---获取服务器时间
    local time = MgrNet.GetServerTime()
    if _bt > time then
        return 1
    end
    if _et < time then
        return 3
    end
    return 2
end

---活动剩余时间
function Global.GetEndTime(_endTime)
    ---活动结束提醒
    local serverTime = MgrNet.GetServerTime()
    local tEndTime = Global.GetTimeByStr(_endTime)
    local remainTime = tEndTime - serverTime

    return remainTime
end

------------------------排序-----------------------------
---通用排序(数组，键组，isRise：false由小到大)
function Global.Sort(list,keys,isRise)
    table.sort(list,function(a,b)
        for i = 1, #keys do
            if a[keys[i]] ~= b[keys[i]] then
                if type(a[keys[i]]) == "number" then
                    if type(isRise) == "table" then
                        local rise = isRise[i] == nil and false or isRise[i]
                        if rise then
                            return a[keys[i]] > b[keys[i]]
                        else
                            return a[keys[i]] < b[keys[i]]
                        end
                    else
                        if isRise then
                            return a[keys[i]] > b[keys[i]]
                        else
                            return a[keys[i]] < b[keys[i]]
                        end
                    end
                elseif type(a[keys[i]]) == "boolean" then
                    if type(isRise) == "table" then
                        local rise = isRise[i] == nil and false or isRise[i]
                        if rise then
                            return (not a[keys[i]]) and b[keys[i]]
                        else
                            return a[keys[i]] and (not b[keys[i]])
                        end
                    else
                        if isRise then
                            return (not a[keys[i]]) and b[keys[i]]
                        else
                            return a[keys[i]] and (not b[keys[i]])
                        end
                    end
                elseif type(a[keys[i]]) == "string" then
                    Log.Error("字符串类型不允许排序")
                else
                    Log.Error("未知类型不允许排序")
                end
            end
        end
        return false
    end)
end
---------------------Goods---------------------------
--region Goods
---@return ItemLocalData 根据Goods获取本地数据
function Global.GetLocalDataByGoods(info)
    ---转换类型
    local goods = Global.CheckGoods(info)
    ---获取表名
    local ConfName = TypeenumerateLocalData.tab[goods.goodsType][4]
    ---匹配表名（首字母大写增加LocalData）
    local ConfName = "LocalData/"..string.lower(ConfName):gsub("^%l",string.upper).."LocalData"
    return require(ConfName).tab[goods.goodsID]
end
---@param oneGoods table|string|number
---@return goods
function Global.CheckGoods(oneGoods)
    if oneGoods == nil then
        return {}
    end
    
    ---@type goods
    local goods = nil
    if type(oneGoods) == "table" then
        goods = oneGoods
    elseif type(oneGoods) == "string" then
        if oneGoods == "" or oneGoods == "0" then
            goods = {}
        else
            local s = string.split(oneGoods,'_')
            goods = {
                goodsType = CheckNumber(s[1]),
                goodsID = CheckNumber(s[2]),
                goodsNum = CheckNumber(s[3]),
            }
        end
    elseif type(oneGoods) == "number" then
        goods = {
            goodsType = oneGoods
        }
    else
        Global.LogError("请勿使用CheckGoods解析之外的类型")
        goods = {}
    end
    
    return goods
end
--- 将字符串转换成 goods 列表
---@param str string | string[] @ 需确保格式为 goodsType_goodsID[_goodsNum],... 如 1_100000_1,1_100001_1
---@return goods[]
function Global.StrToGoods(str)
    if str == nil then
        return {}
    end
    
    ---@type string[]
    local strGoods
    if type(str) == "string" then
        if Global.IsStrNil(str) or str == "0" then
            strGoods = {}
        else
            strGoods = string.split(str, ",")
        end
    elseif type(str) == "table" then
        strGoods = str
    else
        Global.LogError("请勿使用StrToGoods解析之外的类型")
        strGoods = {}
    end

    ---@type goods[]
    local res = {}
    for _, sg in ipairs(strGoods) do
        table.insert(res, Global.CheckGoods(sg))
    end
    return res
end
--- 将 goods 列表转换成字符串
---@param goodsList goods[]
---@return string @ 格式为 goodsType_goodsID_goodsNum,...
function Global.GoodsToStr(goodsList)
    if goodsList == nil or #goodsList == 0 then
        return ""
    end

    local str = nil
    for i, g in ipairs(goodsList) do
        if i == 1 then
            str = string.format("%d_%d_%d", CheckNumber(g.goodsType), CheckNumber(g.goodsID), CheckNumber(g.goodsNum))
        else
            str = str .. string.format(",%d_%d_%d", CheckNumber(g.goodsType), CheckNumber(g.goodsID), CheckNumber(g.goodsNum))
        end
    end
    return str
end

---@class DropGoods : goods
---@field dropCount int

--- 比较是否为同一个掉落物
---@param a goods
---@param b goods
---@return boolean
function Global.CompDropGoods(a, b)
    return a.goodsType == b.goodsType and a.goodsID == b.goodsID and a.goodsNum == b.goodsNum
end

--- 返回掉落表的物品，相同的物品不会合并
--- 顺序保持配置顺序
---@param dropId int @ 掉落表 DropLocalData 的键
---@return DropGoods[] @ goods 的三个值同时作为键
function Global.DropToGoods(dropId)
    local dropConfig = DropLocalData.tab[CheckNumber(dropId)]
    if not dropConfig then
        Global.LogError(string.format("Cant find drop(%s) config", dropId))
        return {}
    end

    ---@type DropGoods[]
    local list = {}
    local poolStr = dropConfig[4]
    
    if Global.IsConfigNil(poolStr) then
        Global.LogError(string.format("Drop(%s) is no goods", dropId))
    else
        local poolSp1 = string.split(poolStr, ",")
        for _, sp1 in ipairs(poolSp1) do
            local poolSp2 = string.split(sp1, "_")
            if poolSp2[3] ~= "0" then
                ---@type DropGoods
                local newG = {
                    goodsType = CheckNumber(poolSp2[1]),
                    goodsID = CheckNumber(poolSp2[2]),
                    goodsNum = CheckNumber(poolSp2[3]),
                    dropCount = 1,
                }

                local bNewGoods = true
                for _, oldG in ipairs(list) do
                    if Global.CompDropGoods(oldG, newG) then
                        oldG.dropCount = oldG.dropCount + 1
                        bNewGoods = false
                        break
                    end
                end

                if bNewGoods then
                    table.insert(list, newG)
                end
            end
        end
    end
    
    return list
end
--endregion Goods
---------------------DoTween--------------------
---X轴移动
function Global.DoMoveX(Obj,x,speed)
    local v3 = Obj.transform.localPosition
    Tools.DoMove(Obj,v3,Vector3(x,v3.y,v3.z),speed,false,nil)
end
---Y轴移动
function Global.DoMoveY(Obj,y,speed)
    local v3 = Obj.transform.localPosition
    Tools.DoMove(Obj,v3,Vector3(v3.x,y,v3.z),speed,false,nil)
end

function Global.DoImageAlphaCall(image,pFrom,pTo, _Duration,pCallBack)
    Tools.DoImageAlphaCall(image, pFrom,  pTo, _Duration,pCallBack)
end

function Global.DoImageAlpha(image,pFrom,pTo, _Duration)
    Tools.DoImageAlpha(image, pFrom,  pTo, _Duration)
end

function math.pow(num,n)
    return num^n
end

---@param num number
---@param min number
---@param max number
---@return number
function math.clamp(num, min, max)
    assert(min <= max, "Invalid argument: min > max")
    num = math.max(num, min)
    return math.min(num, max)
end

function string.split(input, delimiter)
    input = tostring(input)
    delimiter = tostring(delimiter)
    if (delimiter=='') then return false end
    local pos,arr = 0, {}
    -- for each divider found
    for st,sp in function() return string.find(input, delimiter, pos, true) end do
        table.insert(arr, string.sub(input, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(input, pos))
    return arr
end
---获取好感等级
---@param _favor "经验值"
function Global.CheckFavorLv(_favor)
    ---根据杂项表判定每级的经验
    local tFavorData = string.split(SteamLocalData.tab[105002][2], ',')
    local tMaxV = string.split(tFavorData[#tFavorData], '_')    ---最高等级的参数
    for i = 1, #tFavorData - 1 do
        local tValue = string.split(tFavorData[i], '_')     ---当前等级的值
        local tNextValue = string.split(tFavorData[i + 1], '_')     ---下一等级的值

        if _favor >= tonumber(tValue[2]) and _favor < tonumber(tNextValue[2]) then
            local tExpRatio = (_favor - tonumber(tValue[2])) / (tonumber(tNextValue[2]) - tonumber(tValue[2]))
            ---当前等级,当前经验百分比,最大等级,当前等级经验,当前等级经验上限
            return tonumber(tValue[1]), tExpRatio, tonumber(tMaxV[1]), (_favor - tonumber(tValue[2])), (tonumber(tNextValue[2]) - tonumber(tValue[2]))
        elseif i+1 == #tFavorData then
            local tExpRatio = (_favor - tonumber(tValue[2])) / (tonumber(tNextValue[2]) - tonumber(tValue[2]))
            ---当前等级,当前经验百分比,最大等级,当前等级经验,当前等级经验上限
            return tonumber(tNextValue[1]), tExpRatio, tonumber(tMaxV[1]), (tonumber(tNextValue[2]) - tonumber(tValue[2])), (tonumber(tNextValue[2]) - tonumber(tValue[2]))
        end
    end
end

function Global.MaxFavorLv()
    ---根据杂项表判定每级的经验
    local tFavorData = string.split(SteamLocalData.tab[105002][2], ',')
    return tonumber(string.split(tFavorData[#tFavorData],'_')[2])
end

---获得缩进的数量(数量超过五位数就按K显示，例:50000 —— 50k)
function Global.GetConciseCount(num)
    if num >= 10000 and num < 10000000 then
        return math.floor(num/1000)..MgrLanguageData.GetLanguageByKey("ui_suojin_k")
    elseif num >= 10000000 and num < 1000000000 then
        return math.floor(num/10000)..MgrLanguageData.GetLanguageByKey("ui_suojin_w")
    elseif num >= 1000000000 then
        return math.floor(num/100000000)..MgrLanguageData.GetLanguageByKey("ui_suojin_e")
    else
        return num
    end
end

function Global.CopyTable(tab)
    local function _copy(obj)
        if type(obj) ~= "table" then
            return obj
        end
        local new_table = {}
        for k,v in pairs(obj) do
            new_table[_copy(k)] = _copy(v)
        end
        return setmetatable(new_table,getmetatable(obj))
    end
    return _copy(tab)
end

--- 用于Unity对象的空检查
--- 但考虑到 UIBase.CC 对象获取函数的处理，可能返回 false
--- 因此该函数特殊处理 false
---@param uobj any
---@return boolean
function Global.IsNil(uobj)
    if uobj == nil then
        return true
    end
    if type(uobj) ~= "userdata" then
        -- 特殊考虑 false
        if not uobj then
            return true
        end
        return false
    end
    return uobj:Equals(nil)
end

---@param str string | nil
---@return boolean
function Global.IsStrNil(str)
    if str == nil then
        return true
    end
    return string.len(tostring(str)) == 0
end

--- 判断配表字段是否为空
--- 不知道为什么配表导出，空字段可能处理为字符串"0"
---@param configStr string | nil
---@return boolean
function Global.IsConfigNil(configStr)
    return Global.IsStrNil(configStr) or configStr == "0"
end


function Global.Contains(list,value)
    for k,v in pairs(list) do
        if v == value then
            return true
        end
    end
    return false
end

---是否在时间内
function Global.CheckOnTime(timeData)
    if timeData == nil then
        return false
    end
    local curData = os.date("!*t",Global.GetCurTime() + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    local weekNum = tonumber(os.date("%w", Global.GetCurTime()-18000 + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))  --当前星期几
    local str = string.split(timeData.dayOpenTime,"-")
    local endStr = string.split(timeData.dayEndTime,"-")
    ---开启时间时间戳
    local openTime = os.time({year = curData.year, month = curData.month, day = curData.day, hour = tonumber(str[1]) , min = tonumber(str[2]), sec = tonumber(str[3])}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
    local stamp =  os.time({year = curData.year, month = curData.month, day = curData.day, hour = 0 , min = 0, sec = 0 }) + 86400  - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
    local tomorrowData = os.date("!*t",stamp)
    ---结束时间时间戳
    local endTime = os.time({year = tomorrowData.year, month = tomorrowData.month, day = tomorrowData.day, hour = tonumber(endStr[1]) , min = tonumber(endStr[2]), sec = tonumber(endStr[3])}) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
    local openSec =  tonumber(str[1]) * 3600 + tonumber(str[2]) * 60 + tonumber(str[3])
    local endSec = tonumber(endStr[1]) * 3600 + tonumber(endStr[2]) * 60 + tonumber(endStr[3])
    local curSec = curData.hour * 3600 + curData.min * 60 + curData.sec
    if weekNum == 0 then
        weekNum = 7
    end
    ---判断时间类型
    if timeData.timeType == 0 or timeData.timeType == 1 then
        if timeData.timeType == 0 then
            ---如果当前总秒数 < 开启时间秒数 表示还没到开启时间
            if curSec < openSec then
                if curSec < endSec then
                    return Global.Contains(string.split(timeData.openWeek,","),tostring(weekNum))
                else
                    return false
                end
            else
                if Global.GetCurTime() > openTime and Global.GetCurTime() < endTime then  --到新的一天
                    return Global.Contains(string.split(timeData.openWeek,","),tostring(weekNum))
                else
                    return false
                end
            end
        elseif timeData.timeType == 1 then
            ---判断当天是否满足开启条件
            local isCurDay = Global.Contains(string.split(timeData.openWeek,","),tostring(weekNum))   --当天是否解锁
            if isCurDay then
                if curSec > openSec and curSec < endSec then
                    return true
                else
                    return false
                end
            else
                return false
            end
        end
    else
        ---判断具体的时间
        if timeData.timeType == 999 then
            return true
        elseif timeData.timeType == 2 then
            local _str = string.split(Global.TimeToDate(timeData.openTime),"-")
            local _endStr = string.split(Global.TimeToDate(timeData.endTime),"-")
            local startStamp = os.time({year = tonumber(_str[1]), month = tonumber(_str[2]), day = tonumber(_str[3]), hour = tonumber(_str[4]) , min = tonumber(_str[5]), sec = tonumber(_str[6]) }) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
            local endStamp = os.time({year = tonumber(_endStr[1]), month = tonumber(_endStr[2]), day = tonumber(_endStr[3]), hour = tonumber(_endStr[4]) , min = tonumber(_endStr[5]), sec = tonumber(_endStr[6]) }) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600
            if Global.GetCurTime() > startStamp and Global.GetCurTime() < endStamp then
                return true
            elseif Global.GetCurTime() <= startStamp then
                return false,string.format(MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text7"),_str[2].."/".._str[3].." ".._str[4]..":".._str[5])
            else
                return false
            end
        end
    end
    return false
end

---@param num1 number 拥有的数量
---@param num1 number 消耗的数量
---@return string 根据策划表的富文本配置，返回两个数字比较后的文本
function Global.GetCompareText(num1,num2)
    if num1 == nil or num2 == nil then
        return
    end
    local x = tonumber(num1)
    local y = tonumber(num2)
    --大于被比较的数字
    if x >= y then
        return string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),JNStrTool.numberAbbr(x),y)
    else
        --小于被比较的数字
        return string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),JNStrTool.numberAbbr(x),y)
    end
end

---@param num1 number 拥有的数量
---@param num1 number 消耗的数量
---@param key string y的富文本格式
---@param isNumAbbr boolean 是否需要缩进数字
---@return string 根据策划表的富文本配置，比较xy大小最后返回x的text
function Global.GetSingleComparedText(num1,num2,key,isNumAbbr)
    if num1 == nil or num2 == nil then
        return
    end
    local x = tonumber(num1)
    local y = tonumber(num2)
    local costNum = isNumAbbr and JNStrTool.numberAbbr(y) or y
    --大于被比较的数字 满足条件
    if x >= y then
        if key then
            return string.format(MgrLanguageData.GetLanguageByKey(key),costNum)
        else
            --部分情况满足条件文本不需要变色
            return costNum
        end
    else
        return string.format(MgrLanguageData.GetLanguageByKey("ui_tongyong_text235"),costNum)
    end
end

---RGB颜色转十六进制
function Global.converColor2Hex(color)
    return Global.converRGB2Hex(color.r, color.g, color.b)
end
function Global.converRGB2Hex(r, g, b)
    local str = ""
    --十进制转到十六进制
    if string.len(string.sub(string.format("%#x",r),3)) == 1 then
        str = str .. "0" .. string.sub(string.format("%#x",r),3)
    elseif string.len(string.sub(string.format("%#x",r),3)) == 0 then
        str = str .. "00"
    else
        str = str .. string.sub(string.format("%#x",r),3)
    end

    if string.len(string.sub(string.format("%#x",g),3)) == 1 then
        str = str .. "0" .. string.sub(string.format("%#x",g),3)
    elseif string.len(string.sub(string.format("%#x",g),3)) == 0 then
        str = str .. "00"
    else
        str = str .. string.sub(string.format("%#x",g),3)
    end

    if string.len(string.sub(string.format("%#x",b),3)) == 1 then
        str = str .. "0" .. string.sub(string.format("%#x",b),3)
    elseif string.len(string.sub(string.format("%#x",b),3)) == 0 then
        str = str .. "00"
    else
        str = str .. string.sub(string.format("%#x",b),3)
    end
    return str
end

---体力校准
function Global.TiliCalibration()
    ---刷新体力
    local vigorInfo = PlayerControl.GetPlayerData():GetVigorInfo()
    if vigorInfo.vigorNum >= PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4] then --已经超出不校准
        return
    end
    ---上次恢复体力时间和当前时间插值
    local diffTime = Global.GetCurTime() - vigorInfo.vigorTime
    ---要恢复的体力次数
    local times = math.floor(diffTime / tonumber(SteamLocalData.tab[104004][2]))
    if times >= 0 then
        PlayerControl.GetPlayerData().vigor.vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + times
        PlayerControl.GetPlayerData().vigor.vigorTime = PlayerControl.GetPlayerData().vigor.vigorTime + tonumber(SteamLocalData.tab[104004][2]) * times
        if PlayerControl.GetPlayerData().vigor.vigorNum >= PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4] then   --加完之后超出，回调
            local Surplus = PlayerControl.GetPlayerData().vigor.vigorNum - PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
            PlayerControl.GetPlayerData().vigor.vigorNum = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
            PlayerControl.GetPlayerData().vigor.vigorTime = PlayerControl.GetPlayerData().vigor.vigorTime - Surplus * tonumber(SteamLocalData.tab[104004][2])
        end
    end
end

function Global.MoveToUnder(Root,GameObject)
    GameObject.transform:SetParent(Root.gameObject.transform)
    GameObject.transform.localPosition = Vector3.zero
end
---获取列表长度
function Global.GetListLenght(_list)
    local tLen = 0
    if _list then
        for i, v in pairs(_list) do
            tLen = tLen+1
        end
    end
    
    return tLen
end
---将客户端报错传到服务器
function Global.SaveError2Server(_errType, _error)
    local tList = {}
    if type(_error)=="string" then
        local tData = {
            errTyp = _errType,
            actionAt = Global.GetCurTime(),
            errInfo = _error
        }
        table.insert(tList, tData)
    elseif type(_error)=="table" then
        for i, v in ipairs(_error) do
            local tData = {
                errTyp = _errType,
                actionAt = Global.GetCurTime(),
                errInfo = v
            }
            table.insert(tList, tData)
        end
    else
        return
    end
    local BaseREQ = {
        errs = tList
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSaveErrorInfoReq',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SAVE_ERROR_INFO_REQ,bytes,0,nil,function(buffer, tag) end,nil)
end

-- 根据配置的坐标做平移旋转和缩放
function Global.SetCoordinate(gameObj, coordinate)
    local coords = JNStrTool.strSplit(";", coordinate);
    local pos = JNStrTool.strSplit(",", coords[1]);
    gameObj.transform.localPosition = Vector3(tonumber(pos[1]), tonumber(pos[2]), 0);
    gameObj.transform.localScale = Vector3(tonumber(coords[2]), tonumber(coords[2]), 1);
    if coords[3] ~= "0" then
        gameObj.transform.localRotation = Quaternion(0, 180, 0, 0);
    end
end

--- 普通的日志信息可以选择使用 Log 模块
--- 该方法用于直接的错误日志输出，无开关和过滤
function Global.LogError(msg)
    UnityEngine.DebugEx.LogError(msg)
end

--region UI

---@param strKey string @ 无多语言会直接使用该字符串
---@param duration number? @ 显示时长，内部 default 1
---@param bDirectStr boolean? @ 直接输出字符串，不做多语言处理
function Global.PopTip(strKey, duration, bDirectStr)
    if bDirectStr then
        MgrUI.Pop(UID.PopTip_UI, {
            strKey, duration,
        }, true)
    else
        MgrUI.Pop(UID.PopTip_UI, { 
            MgrLanguageData.GetLanguageByKey(strKey), duration, 
        }, true)
    end
end

---@param strKey string @ 无多语言会直接使用该字符串
---@param confirmFun fun()
---@param cancelFun fun()?
---@param style int? @ 风格，内部 default 1
---@param confirmTxt string? @ 确认按钮文本，内部 default 确认
---@param cancelTxt string? @ 取消按钮文本，内部 default 取消
function Global.PopConfirm(strKey, confirmFun, cancelFun, style, confirmTxt, cancelTxt)
    MgrUI.Pop(UID.ConfirmPop_UI, {
        MgrLanguageData.GetLanguageByKey(strKey), confirmFun, nil, style, cancelFun, cancelTxt, confirmTxt, 
    }, true)
end

--endregion UI

--region 全局便捷方法

--- 确保返回值为一个表
--- 若输入值不是表，则返回一个空表
---@param value any
---@return table
function CheckTable(value)
    if type(value) ~= "table" then
        return {}
    end
    return value
end

--- 确保返回值为一个 boolean
--- 符合 lua 判断逻辑
---@param value any
---@return boolean
function CheckBool(value)
    return value ~= nil and value ~= false
end

--- 确保返回值为一个数值
--- 若输入值无法转换为数值，则返回 0
---@param value any
---@param base int? @ 进制，默认十进制
---@return number
function CheckNumber(value, base)
    return tonumber(value, base) or 0
end

--- 确保返回值为一个整数，结果四舍五入
--- 若输入值无法转换为数值，则返回 0
---@param value any
---@return int
function CheckInt(value)
    return math.floor((tonumber(value) or 0) + 0.5)
end

--- 确保返回值为一个字符串
--- 空对象则返回空字符串
---@param value any
---@return string
function CheckString(value)
    return Global.IsStrNil(value) and "" or tostring(value)
end

--endregion 全局便捷方法

return Global