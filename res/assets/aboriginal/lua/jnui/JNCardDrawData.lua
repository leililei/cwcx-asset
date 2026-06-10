JNCardDrawData={}
--当前信息初始化是否成功TAG
JNCardDrawData.bool_IsResultInfoInit = false
--当前单抽角色信息
JNCardDrawData.CurResultRole={}
--当前十连抽角色信息
JNCardDrawData.CurTenthContinuousResultTab={}
--当前抽卡方式  1.单抽2.十连
JNCardDrawData.CurResultType = 1

JNCardDrawData.CurCardDrawResultType = 0

--单抽通信回调方法
function JNCardDrawData.InitOnceCardDrawInfo(_Str,_LuaCallBackName)
    -- statements
    JNCardDrawData.CurCardDrawResultType = 0
    JNCardDrawData.CurResultRole={}
    HttpCore.CreatAnalyisJsonData(_Str,"OnceCardDrawData")
    local _CurRoleId=HttpCore.GetAnalyisDataByKey("OnceCardDrawData","heroId")
    local _CurRoleIsOwn=HttpCore.GetAnalyisDataByKey("OnceCardDrawData","isOwned")
    for key, value in pairs(GameData.tab.roleattribute) do
        -- statements
        if value[1] == _CurRoleId then
            -- statements
            if value[6] =="3" and JNCardDrawData.CurCardDrawResultType ~= 1  then
                -- statements
                JNCardDrawData.CurCardDrawResultType = 2
            end
            if value[6] =="4" then
                -- statements
                JNCardDrawData.CurCardDrawResultType = 1
            end
        end
    end
    table.insert(JNCardDrawData.CurResultRole,_CurRoleId)
    table.insert(JNCardDrawData.CurResultRole,_CurRoleIsOwn)
    JNCardDrawData.bool_IsResultInfoInit = true
    if _LuaCallBackName ~= nil and _LuaCallBackName ~= "" then
        -- 回调执行下一步Lua方法
        Event.Go(_LuaCallBackName)
    end
end

--十连抽通信回调方法
function JNCardDrawData.InitTenthCardDrawInfo(_Str,_JsonCount,_LuaCallBackName)
    -- statements
    JNCardDrawData.CurCardDrawResultType = 0
    JNCardDrawData.CurResultRole={}
    HttpCore.CreatAnalyisJsonData(_Str,"TenthCardDrawData")

    --初始化单抽十连抽数据表
    JNCardDrawData.CurResultRole={}
    JNCardDrawData.CurTenthContinuousResultTab={}

    for i = 0, _JsonCount - 1, 1 do
        local _TempDrawInfoTab ={}
        local _CurRoleId=HttpCore.GetAnalyisDataByKey("TenthCardDrawData","heroId",i)
        local _CurRoleIsOwn=HttpCore.GetAnalyisDataByKey("TenthCardDrawData","isOwned",i)
        for key, value in pairs(GameData.tab.roleattribute) do
            -- statements
            if value[1] == _CurRoleId then
                -- statements
                if value[6] =="3" and JNCardDrawData.CurCardDrawResultType ~= 1  then
                    -- statements
                    JNCardDrawData.CurCardDrawResultType = 2
                end
                if value[6] =="4" then
                    -- statements
                    JNCardDrawData.CurCardDrawResultType = 1
                end
            end
        end
        table.insert(_TempDrawInfoTab,_CurRoleId)
        table.insert(_TempDrawInfoTab,_CurRoleIsOwn)
        table.insert(JNCardDrawData.CurTenthContinuousResultTab,_TempDrawInfoTab)
    end
    JNCardDrawData.bool_IsResultInfoInit = true
    if _LuaCallBackName ~= nil and _LuaCallBackName ~= "" then
        -- 回调执行下一步Lua方法
        Event.Go(_LuaCallBackName)
    end
end 
return JNCardDrawData