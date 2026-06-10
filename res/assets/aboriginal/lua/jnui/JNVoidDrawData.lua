JNVoidDrawData={}
--当前信息初始化是否成功TAG
JNVoidDrawData.bool_IsResultInfoInit = false
--当前单抽共鸣装备信息
JNVoidDrawData.CurResultVoidGear={}
--当前十连抽共鸣信息
JNVoidDrawData.CurTenthContinuousResultTab={}
--当前抽卡方式  1.单抽2.十连
JNVoidDrawData.CurResultType = 1
--本次是否有重复获得碎片
JNVoidDrawData.bool_IsGetRepeatVoid=false
--本次重复碎片信息表
JNVoidDrawData.CurRepeatDebrisInfoTab={}
--本次获得物品中的最高品阶
JNVoidDrawData.CurVoidDrawResultType = 0
--单抽通信回调方法
function JNVoidDrawData.InitOnceCardDrawInfo(_Str,_LuaCallBackName)
    -- statements
    JNVoidDrawData.CurVoidDrawResultType = 0
    JNVoidDrawData.CurResultType = 1
    JNVoidDrawData.CurResultVoidGear={}
    JNVoidDrawData.AnalyisVoidDrawResult(JNVoidDrawData.CurResultVoidGear,0,_Str)
    JNVoidDrawData.bool_IsResultInfoInit = true
    if _LuaCallBackName ~= nil and _LuaCallBackName ~= "" then
        -- 回调执行下一步Lua方法
        Event.Go(_LuaCallBackName)
    end
end

--十连抽通信回调方法
function JNVoidDrawData.InitTenthCardDrawInfo(_Str,_LuaCallBackName)
    -- statements
    JNVoidDrawData.CurVoidDrawResultType = 0
    JNVoidDrawData.CurResultType = 2
    JNVoidDrawData.CurResultVoidGear={}

    --初始化单抽十连抽数据表
    JNVoidDrawData.CurResultVoidGear={}
    JNVoidDrawData.CurTenthContinuousResultTab={}

    --总共11抽
    JNVoidDrawData.AnalyisVoidDrawResult(JNVoidDrawData.CurTenthContinuousResultTab,10,_Str)
    JNVoidDrawData.bool_IsResultInfoInit = true
    if _LuaCallBackName ~= nil and _LuaCallBackName ~= "" then
        -- 回调执行下一步Lua方法
        Event.Go(_LuaCallBackName)
    end
end 

--根据抽卡次数循环解析具体信息
function JNVoidDrawData.AnalyisVoidDrawResult(_Tab,_Count,_Str)
    -- statements
    if _Str == "" then
        -- statements
        return
    end
    HttpCore.CreatAnalyisJsonData(_Str,"VoidDrawData")
    for i = 0, _Count, 1 do
        local _TempDrawInfoTab ={}
        local _CurItemType=HttpCore.GetAnalyisDataByKey("VoidDrawData","type",i)
        local _CurItemId=HttpCore.GetAnalyisDataByKey("VoidDrawData","goodsId",i)
        local _CurItem2Id=HttpCore.GetAnalyisDataByKey("VoidDrawData","id",i)
        local _CurItemSum=HttpCore.GetAnalyisDataByKey("VoidDrawData","num",i)
        if _CurItemType ~= "2" then
            for key, value in pairs(GameData.tab.roleequipment) do
                -- statements
                if value[1] == _CurItemId then
                    -- statements
                    if value[7] =="3" and JNVoidDrawData.CurVoidDrawResultType ~= 2  then
                        -- statements
                        JNVoidDrawData.CurVoidDrawResultType = 1
                    end
                    if value[7] =="4" then
                        -- statements
                        JNVoidDrawData.CurVoidDrawResultType = 2
                    end
                end
            end
            --此处为没有重复则将goodsId作为共鸣装备ID解析
            table.insert(_TempDrawInfoTab,_CurItemId)
            --填入0作为碎片ID占位
            table.insert(_TempDrawInfoTab,"0")
            --填入共鸣装备数量sum
            table.insert(_TempDrawInfoTab,_CurItemSum)
            table.insert(_Tab,_TempDrawInfoTab)
        else
            for key, value in pairs(GameData.tab.roleequipment) do
                -- statements
                if value[1] == _CurItem2Id then
                    -- statements
                    if value[7] =="3" and JNVoidDrawData.CurVoidDrawResultType ~= 2  then
                        -- statements
                        JNVoidDrawData.CurVoidDrawResultType = 1
                    end
                    if value[7] =="4" then
                        -- statements
                        JNVoidDrawData.CurVoidDrawResultType = 2
                    end
                end
            end
            --出现了重复转化成碎片的装备，则将id作为共鸣装备id解析
            table.insert(_TempDrawInfoTab,_CurItem2Id)
            --将goodsId解析为碎片id
            table.insert(_TempDrawInfoTab,_CurItemId)
            --转化成的碎片数量
            table.insert(_TempDrawInfoTab,_CurItemSum)
            table.insert(_Tab,_TempDrawInfoTab)
        end
    end
    print("JNVoidDrawData.CurVoidDrawResultType本次最高品阶"..JNVoidDrawData.CurVoidDrawResultType)
end

return JNVoidDrawData