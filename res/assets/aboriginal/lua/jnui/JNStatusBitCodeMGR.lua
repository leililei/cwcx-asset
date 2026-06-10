require("JNUI/JNActivationTaskData")
JNStatusBitCodeMGR={}

--当前玩家主界面信息状态位信息表
JNStatusBitCodeMGR.PlayerStatusInfoTab={}

--请求更新玩家主菜单状态信息表
function JNStatusBitCodeMGR.RequestInitPlayerStatusCode(_LuaCallBackName)
    -- statements
    JNPlayerData.InitMainInfo(_LuaCallBackName)
end


--根据当前传入的状态位码更新玩家主菜单状态位信息表
function JNStatusBitCodeMGR.InitPlayerStatusTab(_Num)
    -- statements
    JNStatusBitCodeMGR.PlayerStatusInfoTab=JNStatusBitCodeMGR.GetBin(_Num,30)
    for key, value in pairs(JNStatusBitCodeMGR.PlayerStatusInfoTab) do
        -- statements
        if key == 1 then
            -- 1.新手签到状态位
            elseif key == 2 then
                -- 2.活跃积分奖励状态位
            elseif key == 3 then
                -- 3.成就奖励状态位
            elseif key == 4 then
                -- 4.主线奖励状态位
            elseif key == 5 then
                -- 5.世界BOSS奖励状态位
            elseif key == 6 then
                -- 6.每日活跃任务奖励状态位
                JNActivationTaskData.bool_IsShowDailyTaskStatusPoint=JNStatusBitCodeMGR.SetFlagByStatusCode(value)
            elseif key == 7 then
                -- 7.每周活跃任务奖励状态位
                JNActivationTaskData.bool_IsShowWeekTaskStatusPoint=JNStatusBitCodeMGR.SetFlagByStatusCode(value)
            elseif key == 8 then
                -- 8.每月活跃任务奖励状态位
                JNActivationTaskData.bool_IsShowMonthTaskStatusPoint=JNStatusBitCodeMGR.SetFlagByStatusCode(value)
        end
    end
    -- local  _TempStr = ""
    -- local _IsFirst =false
    -- for key, value in pairs(JNStatusBitCodeMGR.PlayerStatusInfoTab) do
    --     -- statements
    --     if _IsFirst == false then
    --         -- statements
    --         _TempStr=""..value
    --         _IsFirst=true
    --     else
    --         _TempStr=_TempStr.."_"..value
    --     end
    -- end
    -- print("最终打印表".._TempStr)
end
--根据当前状态位是1还是0，更新对应BoolFlag信息
function JNStatusBitCodeMGR.SetFlagByStatusCode(_StatusCod)
    -- statements
    local _BoolFlag=false
    if tonumber(_StatusCod) == 1 then
        -- statements
        _BoolFlag = true
    else
        _BoolFlag = false
    end
    return _BoolFlag
end
--十进制转二进制Tab
function JNStatusBitCodeMGR.GetBin(_Num,_MaxIndex)
    local t = {}
    for i=_MaxIndex,0,-1 do
        t[#t+1] = math.floor(_Num / 2^i)
        _Num = _Num % 2^i
    end
    local _ReturnTab={}
    for i = #t+1, 3, -1 do
        -- 获得倒序的上表，并且返回
        _ReturnTab[#_ReturnTab+1]=t[i-2]
    end
    return _ReturnTab
end
--二进制Tab转十进制数
function JNStatusBitCodeMGR.GetByte(_Tab)
    local _TempByte=0
    local _TabCount=0
    for key, value in pairs(_Tab) do
        -- statements
        _TabCount=_TabCount+1
    end
    local j =_TabCount
    for i = 1, _TabCount, 1 do
        _TempByte=_TempByte+tonumber(_Tab[i])*(2^(j-1))
        j=j-1
    end
    return _TempByte
end


return JNStatusBitCodeMGR