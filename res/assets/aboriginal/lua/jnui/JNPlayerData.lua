require("ReadData/SignItemData")
require("JNUI/JNStatusBitCodeMGR")
require("JNUI/JNVoidGear")
require("JNUI/JNGearPuzzle")
JNPlayerData={}

JNPlayerData.UID=0
JNPlayerData.nickname="???"
JNPlayerData.allianceName="???"
JNPlayerData.LV=1
JNPlayerData.EXP=1
JNPlayerData.Coin="1"
JNPlayerData.Rmb="1"
JNPlayerData.StatusBit=1
JNPlayerData.Power="1"
JNPlayerData.RenameChance=1
JNPlayerData.MenuRoleID=1
JNPlayerData.CurTimeStamp=0
JNPlayerData.IsDailySign="0" --是否已经每日签到
JNPlayerData.CurDailySignItemID="" --当前每日签到ID
JNPlayerData.CurMonthDays=28 --当月总共天数
JNPlayerData.WeekSignInfo="" --七日签到信息 ID_时间戳
JNPlayerData.DailySignInfo="" --每日签到信息 ID_时间戳
----UID----ID-----数量-------类型-------到期时间-
JNPlayerData.ItemBag={
    --范例物品信息table
    {"150109","150109","999999999","3","0"},
}
--共鸣装备背包表(嵌套JNVoidGear类型表)
JNPlayerData.VoidGearBag={}

--机甲核心背包表(嵌套JNGear类型)
JNPlayerData.GearCoreBag={}

--机甲碎片属性表(嵌套JNGearPuzzle)
JNPlayerData.GearPuzzleBag={}

function JNPlayerData.RequestInitVoidGearBag(_LuaCallBackName)
    -- statements
    HttpCore.GetVoidGearBag("JNPlayerData.InitVoidGearBag",JNPlayerData.InitVoidGearBag,_LuaCallBackName)
end
--刷新当前共鸣装备信息表
function JNPlayerData.InitVoidGearBag(_Str,_LuaCallBackName)
    JNPlayerData.VoidGearBag={}
    local _TempVoidGearTab={}  --当前的临时共鸣装备表
    if _Str == "" or _Str == nil then
        -- statements
        --空字符串
    else
        --根据当前返回字符串得到jsonlist长度
        HttpCore.CreatAnalyisJsonData(_Str,"VoidGearBagInfo")
        local _TempJsonListCount = HttpRequestMGR.Instance:GetJsonListCount(_Str)
        for i = 0, _TempJsonListCount - 1, 1 do
            -- 根据返回的信息切割获得具体共鸣装备信息表
            local _VoidGearId=HttpCore.GetAnalyisDataByKey("VoidGearBagInfo","equipmentId",i)
            local _VoidGearheroId=HttpCore.GetAnalyisDataByKey("VoidGearBagInfo","heroId",i)
            local _VoidGearexp=HttpCore.GetAnalyisDataByKey("VoidGearBagInfo","exp",i)
            local _VoidGearlv=HttpCore.GetAnalyisDataByKey("VoidGearBagInfo","lv",i)
            local _tempVoidGear=nil
            for key, value in pairs(GameData.tab.roleequipment) do
                -- statements
                if value[1] == _VoidGearId then
                    -- statements
                    _tempVoidGear=JNVoidGear:new(_VoidGearId,_VoidGearexp,_VoidGearlv,_VoidGearheroId,value)
                end
            end
            table.insert(_TempVoidGearTab, _tempVoidGear)
        end
    end
    JNPlayerData.Tab_CurCreatedRoleData={} --清空当前存储的临时角色RoleData表
    for key, value in pairs(CollectionData.tab.RoleCollect) do
        -- statements
        local _TempVoidGearRole=JNVoidGear:RoleVoidGearNew(value[1],value[3],value[17],value[7],value[5],value[9],value[2],"1")
        local _IsVoidGearSlot1Empty=false --用于判断该人物的3个槽位共鸣装备拥有情况
        local _IsVoidGearSlot2Empty=false
        local _IsVoidGearSlot3Empty=false
        --遍历当前拥有的共鸣装备背包
        for i, n in pairs(_TempVoidGearTab) do
            -- 根据对应单个共鸣装备信息表中持有者的Id进行匹配
            if value[1]==n.HeroId then
                -- 匹配到了则将已拥有置为true
                n.IsOwn=true
                _TempVoidGearRole.VoidOwnSum=_TempVoidGearRole.VoidOwnSum+1
                -- print("找到了拥有者id"..n.ID.."角色为"..n.HeroId)
                --根据槽位将VoidGear对象表赋值给对应的RoleData表中的槽位存储
                if n.slot == "1" then
                    -- statements
                    _TempVoidGearRole.VoidGear1=n
                    _IsVoidGearSlot1Empty=true
                elseif n.slot == "2" then
                    -- statements
                    _TempVoidGearRole.VoidGear2=n
                    _IsVoidGearSlot2Empty=true
                elseif n.slot == "3" then
                    -- statements
                    _TempVoidGearRole.VoidGear3=n
                    _IsVoidGearSlot3Empty=true
                end
            end
        end
        -- 根据三个槽位的拥有情况如果有空的槽位则读表生成一个默认属性的对应共鸣装备VoidGear并将IsOwn置为false
        if _IsVoidGearSlot1Empty == false then
            -- 1号槽位空了
            _TempVoidGearRole.VoidGear1 = JNVoidGear.CreatVoidGearDefault(value[1],"1")
        end
        if _IsVoidGearSlot2Empty == false then
            -- 2号槽位空了
            _TempVoidGearRole.VoidGear2 = JNVoidGear.CreatVoidGearDefault(value[1],"2")
        end
        if _IsVoidGearSlot3Empty == false then
            -- 3号槽位空了
            _TempVoidGearRole.VoidGear3 = JNVoidGear.CreatVoidGearDefault(value[1],"3")
        end
        --最终插入一个玩家拥有机娘的共鸣装备信息表RoleData
        table.insert(JNPlayerData.VoidGearBag, _TempVoidGearRole)
    end
    --遍历当前的共鸣装备背包，如果有IsOwn为false的VoidGear共鸣装备则为玩家未拥有该机娘角色但是有她的共鸣装备
    for key, value in pairs(_TempVoidGearTab) do
        if value.IsOwn == false then
            -- 还未找到拥有者ID，则代表玩家未持有该共鸣装备对应角色，生成一个临时的读表默认角色RoleData插入
            JNPlayerData.CreatUnOwnRoleData(value)
        end
    end
    --遍历当前存储的临时表中的RoleData信息插入到当前玩家共鸣背包信息表汇总
    for key, value in pairs(JNPlayerData.Tab_CurCreatedRoleData) do
        if value.VoidGear1 == nil then
            -- 1号槽位空了
            value.VoidGear1 = JNVoidGear.CreatVoidGearDefault(value.ID,"1")
        end
        if value.VoidGear2 == nil then
            -- 2号槽位空了
            value.VoidGear2 = JNVoidGear.CreatVoidGearDefault(value.ID,"2")
        end
        if value.VoidGear3 == nil then
            -- 3号槽位空了
            value.VoidGear3 = JNVoidGear.CreatVoidGearDefault(value.ID,"3")
        end
        table.insert(JNPlayerData.VoidGearBag, value)
    end
    if _LuaCallBackName ~=nil and _LuaCallBackName ~= "" then
        Event.Go(_LuaCallBackName)
        -- Event.Clear(_LuaCallBackName)
    end
end
--用于存储当前已经创建的已获取共鸣装备未拥有机娘RoleData表
JNPlayerData.Tab_CurCreatedRoleData={}



-- @function 创建一个不重复的机娘RoleData（根据上面的已存储的机娘信息表）
function JNPlayerData.CreatUnOwnRoleData(_VoidGear)
    -- 是否已经创建
    local _IsCreated=false
    for key, value in pairs(JNPlayerData.Tab_CurCreatedRoleData) do
        -- statements
        if value.ID == _VoidGear.HeroId then
            -- statements
            -- print("当前有已经存储的RoleData拉"..value.ID)
            _IsCreated = true
        end
    end
    if _IsCreated == false then
        -- print("没有找到存储的RoleData新建一个".._VoidGear.HeroId)
        for key, value in pairs(GameData.tab.roleattribute) do
            -- 遍历角色基础表创立一个默认角色信息
            if value[1] == "".._VoidGear.HeroId then
                local _TempVoidGearRole=JNVoidGear:RoleVoidGearNew(value[1],value[21],value[6],value[5],"0",value[7],value[2],"0")
                JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId]=_TempVoidGearRole
            end
        end
    end
    _VoidGear.IsOwn=true
    JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId].VoidOwnSum=JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId].VoidOwnSum+1
    -- print(" JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId]".. JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId].ID)
    --根据当前传入的共鸣装备信息中的具体槽位，给临时生成的机娘共鸣信息表RoleData中对应槽位赋值VoidGear
    if _VoidGear.slot == "1" then
        -- statements
        JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId].VoidGear1=_VoidGear
    elseif _VoidGear.slot == "2" then
        -- statements
        JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId].VoidGear2=_VoidGear
    elseif _VoidGear.slot == "3" then
        -- statements
        JNPlayerData.Tab_CurCreatedRoleData[_VoidGear.HeroId].VoidGear3=_VoidGear
    end
end



--当前浏览对战信息表
------1---------2--------3-----------4----------5---------6-----------7----------8------------9-----------10----------11------------12----------13-------------14---------15
---是否获胜--分数变动--玩家名称----玩家分数----玩家段位----对手名称----对手分数----对手段位-------玩家排名-----对手排名---对局时间戳-----对局简略详情---玩家段位图标--对手段位图标--对局ID
JNPlayerData.CurBattleRecordTab= {"1","3","INori","2333","307001","Chelly","2900","307001","123","132","1604306967000","10000#50#5#0#1#2_1#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"}

--玩家当前段位信息
--段位分数
JNPlayerData.PlayerCurRankGoal=2799
--具体排名
JNPlayerData.PlayerCurRank=3
--PVP表中第一列段位唯一ID
JNPlayerData.PlayerMainRankID="307001"
--玩家本周进攻战绩记录信息
--胜率
JNPlayerData.PlayerPvpWeekWinRate_Atk=0.5
--本周胜利次数
JNPlayerData.PlayerPvpWeekWinCount_Atk=5
--本周失败次数
JNPlayerData.PlayerPvpWeekDefeatCount_Atk=10
-----------------------------------------------------------------------已舍弃----------------------------------------------------------------------------
--|---1---------2--------3-----------4----------5---------6-----------7----------8------------9-----------10--------11----------------12----------13----
--|是否获胜--分数变动--玩家名称----玩家分数----玩家段位----对手名称----对手分数----对手段位-----对局时间戳-----对局简略详情---玩家段位图标--对手段位图标--对局ID---
---------------------------------------------------------------------------------------------------------------------------------------------------------


------1---------2--------3-----------4----------5---------6-----------7----------8------------9-----------10----------11------------12----------13-------------14---------15
---是否获胜--分数变动--玩家名称----玩家分数----玩家段位----对手名称----对手分数----对手段位-------玩家排名-----对手排名---对局时间戳-----对局简略详情---玩家段位图标--对手段位图标--对局ID

JNPlayerData.PlayerPvPWeekRecord_Atk={
    {"0","-5","INori","2800","1","FastNail","2900","1","1604317882000","10000#50#5#0#1#2_1#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"1","6","INori","2345","1","EGOIST","2900","1","1604317800000","10000#50#5#0#1#2_1#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"1","3","INori","2333","1","Chelly","2900","1","1604306967000","10000#50#5#0#1#2_1#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"0","-4","INori","2800","1","Aimer","2900","1","1604292567000","10000#50#5#0#1#2_1#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"1","7","INori","2800","1","LiSA","2900","1","1602503339000","10000#50#5#0#1#2_1#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
}

--玩家本周防御战绩记录信息
--同上
JNPlayerData.PlayerPvpWeekWinRate_Def=0.9
JNPlayerData.PlayerPvpWeekWinCount_Def=90
JNPlayerData.PlayerPvpWeekDefeatCount_Def=100
------1---------2--------3-----------4----------5---------6-----------7----------8------------9-----------10----------11------------12----------13-------------14---------15
---是否获胜--分数变动--玩家名称----玩家分数----玩家段位----对手名称----对手分数----对手段位-------玩家排名-----对手排名---对局时间戳-----对局简略详情---玩家段位图标--对手段位图标--对局ID
JNPlayerData.PlayerPvPWeekRecord_Def={
    {"0","-5","INori","2755","1","FastNail","2900","1","1604317882000","10000#50#5#0#1#2_2#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"1","6","INori","2431","1","EGOIST_Official","2900","1","1604317800000","10000#50#5#0#1#3_2#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"1","3","INori","2888","1","Chelly_Official","2900","1","1604306967000","10000#50#5#0#1#2_1#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"0","-4","INori","2757","1","Aimer_Official","2900","1","1604292567000","10000#50#5#0#1#2_2#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
    {"1","7","INori","2800","1","LiSA_Official","2900","1","1602503339000","10000#50#5#0#1#2_2#1#juese_icon_lulula(q)$11001#70#5#0#3#1_4#1#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#1#juese_icon_xinzhi(q)$10000#50#5#0#1#3_1#0#juese_icon_lulula(q)$11001#70#5#0#3#1_4#0#juese_icon_luyisi(q)$11002#80#6#1#2#1_1#0#juese_icon_xinzhi(q)","PVP_large_tiaozhan1","PVP_large_tiaozhan1"},
}

--登录推送人物数据
function JNPlayerData.PushPlayerInfo(buffer,tag)
    local table = assert(pb.decode('PBClient.ClientVerifyNTF',buffer))
    --查看table内容
    print(serpent.block(table))
    JNPlayerData.InitPlayerInfo(table, tag)
end

--初始化玩家信息
function JNPlayerData.InitPlayerInfo(info, tag)
    -- statements
    JNPlayerData.UID=info.userID
    JNPlayerData.nickname=info.nike
    JNPlayerData.allianceName=info.alliance
    JNPlayerData.LV=info.level
    JNPlayerData.EXP=info.exp
    JNPlayerData.StatusBit=info.status
    JNPlayerData.RenameChance=info.reNameNum
    JNPlayerData.MenuRoleID=info.menuRoleID
    JNPlayerData.CurTimeStamp=info.nTime
    --JNPlayerData.IsDailySign=_TempJsonTab["IsDailySign"]没给
    JNPlayerData.WeekSignInfo=info.wSign
    JNPlayerData.DailySignInfo=info.mSign

    -- 更新当前日期和时间
    SignItemData.InitClientDate(JNPlayerData.CurTimeStamp)
    SignItemData.InitClientTime(JNPlayerData.CurTimeStamp)


    -- 注册请求背包回调
    print("发送背包请求")
    MessageEvent.Add(MID.CLIENT_GOODS_NTF, JNPlayerData.ReceivePlayerBag)
    -- 发送请求背包数据
    local table = {
    }
    local buffer = assert(pb.encode('PBClient.ClientGoodsREQ',table))
    MgrNet.SendReq(MID.CLIENT_GOODS_REQ,buffer,-1,nil,nil,nil)

    --更新当前月份天数(自己算)
    --HttpCore.GetCurMonthDays("JNPlayerData.InitCurMonDays",JNPlayerData.InitCurMonDays)

    ---原玩家初始化
    --function JNPlayerData.InitPlayerInfo(_TempJsonTab)
    --    -- statements
    --    JNPlayerData.UID=_TempJsonTab["UID"]
    --    JNPlayerData.nickname=_TempJsonTab["nickname"]
    --    JNPlayerData.allianceName=_TempJsonTab["allianceName"]
    --    JNPlayerData.LV=_TempJsonTab["LV"]
    --    JNPlayerData.EXP=_TempJsonTab["EXP"]
    --    -- JNPlayerData.Coin=_TempJsonTab["Coin"]
    --    -- JNPlayerData.Rmb=_TempJsonTab["Rmb"]
    --    JNPlayerData.StatusBit=_TempJsonTab["StatusBit"]
    --    -- JNPlayerData.Power=_TempJsonTab["Power"]
    --    JNPlayerData.RenameChance=_TempJsonTab["RenameChance"]
    --    JNPlayerData.MenuRoleID=_TempJsonTab["MenuRoleID"]
    --    JNPlayerData.CurTimeStamp=_TempJsonTab["Timestamp"]
    --    JNPlayerData.IsDailySign=_TempJsonTab["IsDailySign"]
    --    JNPlayerData.WeekSignInfo=_TempJsonTab["WeekSignInfo"]
    --    JNPlayerData.DailySignInfo=_TempJsonTab["DailySignInfo"]
    --    if JNPlayerData.StatusBit ~= "" then
    --        -- 状态码表
    --        JNStatusBitCodeMGR.InitPlayerStatusTab(tonumber(JNPlayerData.StatusBit))
    --    end
    --    --更新当前玩家每日签到ID
    --    if _TempJsonTab["CurDailySignItemID"] ~= "" and _TempJsonTab["CurDailySignItemID"] ~= nil then
    --        local _tempDailySignIDTab=JNStrTool.strSplit("_", _TempJsonTab["CurDailySignItemID"])
    --        JNPlayerData.CurDailySignItemID=_tempDailySignIDTab[1]
    --    end
    --    -- 更新当前日期和时间
    --    SignItemData.InitClientDate(JNPlayerData.CurTimeStamp)
    --    SignItemData.InitClientTime(JNPlayerData.CurTimeStamp)
    --    --更新当前月份天数
    --    HttpCore.GetCurMonthDays("JNPlayerData.InitCurMonDays",JNPlayerData.InitCurMonDays)
    --end
end

function JNPlayerData.ReceivePlayerBag(buffer, tag)
    local table = assert(pb.decode('PBClient.ClientGoodsNTF',buffer))
    --查看table内容
    print("接收背包数据初始化" .. serpent.block(table))
    JNPlayerData.InitPlayerBag(table, tag)
end

--新初始化背包
function JNPlayerData.InitPlayerBag(bag, tag)
    JNPlayerData.ItemBag={}
    JNPlayerData.GearPuzzleBag={}

    for _,item in ipairs(bag) do
        local BagDataTab = {
            item.goodsID,
            0, --暂无id
            item.goodsNum,
            item.goodsType,
            MgrLanguageData.GetLanguageByKey("jnplayerdata_tips1"),
        }

        for _, value in pairs(GameData.tab.goods) do
            -- statements
            if value[1] == BagDataTab[2] then
                -- statements
                BagDataTab[4]=value[2]
                if value[2] == "4" then
                    -- statements
                    local _JNGearPuzzlData=JNGearPuzzle:new(BagDataTab[2],BagDataTab[1],tonumber(BagDataTab[3]),value)
                    table.insert(JNPlayerData.GearPuzzleBag,_JNGearPuzzlData)
                end
            end
        end
        table.insert(JNPlayerData.ItemBag,BagDataTab)
    end
end

--更新当前月份天数
function JNPlayerData.InitCurMonDays(_DayCount)
    -- statements
    JNPlayerData.CurMonthDays=tonumber(_DayCount)
end
--根据JsonKey更新玩家信息
function JNPlayerData.GetPlayerInfoTab(_JsonDataKey)
    -- statements
    local _TempJsonTab ={}
    local Uid=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"uid")
    local nickname=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"nickname")
    local allianceName=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"allianceName")
    local LV=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"lv")
    local EXP=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"experience")
    -- local Coin=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"coin")
    -- local Rmb=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"rmb")
    local StatusBit=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"statusBit")
    -- local Power=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"power")
    local RenameChance=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"renameNumber")
    local MenuRoleID=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"inUseHeroId")
    local CurTimeStamp=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"timestamp")
    local IsDailySign=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"isSign")
    local CurDailySignItemID=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"monthlySign")
    local WeekSignInfo=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"sevenDaysSign")
    local DailySignInfo=HttpCore.GetAnalyisDataByKey(_JsonDataKey,"monthlySign")
    _TempJsonTab["UID"]=Uid
    _TempJsonTab["nickname"]=nickname
    _TempJsonTab["allianceName"]=allianceName
    _TempJsonTab["LV"]=LV
    _TempJsonTab["EXP"]=EXP
    -- _TempJsonTab["Coin"]=Coin
    -- _TempJsonTab["Rmb"]=Rmb
    _TempJsonTab["StatusBit"]=StatusBit
    -- _TempJsonTab["Power"]=Power
    _TempJsonTab["RenameChance"]=RenameChance
    _TempJsonTab["MenuRoleID"]=MenuRoleID
    _TempJsonTab["Timestamp"]=CurTimeStamp
    _TempJsonTab["IsDailySign"]=IsDailySign
    _TempJsonTab["CurDailySignItemID"]=CurDailySignItemID
    _TempJsonTab["WeekSignInfo"]=WeekSignInfo
    _TempJsonTab["DailySignInfo"]=DailySignInfo
    -- table.insert(_TempJsonTab,"UID",Uid)
    -- table.insert(_TempJsonTab,"nickname",nickname)
    -- table.insert(_TempJsonTab,"allianceName",allianceName)
    -- table.insert(_TempJsonTab,"LV",LV)
    -- table.insert(_TempJsonTab,"EXP",EXP)
    -- table.insert(_TempJsonTab,"Coin",Coin)
    -- table.insert(_TempJsonTab,"Rmb",Rmb)
    -- table.insert(_TempJsonTab,"StatusBit",StatusBit)
    -- table.insert(_TempJsonTab,"Power",Power)
    -- table.insert(_TempJsonTab,"RenameChance",RenameChance)
    -- table.insert(_TempJsonTab,"MenuRoleID",MenuRoleID)
    return _TempJsonTab
end
--Http请求获取所有背包物品列表
function JNPlayerData.HttpPostInitPlayerBag(_LuaCallBackName)
    -- statements
    HttpCore.GetBagItemList("JNPlayerData.InitPlayerBagList",JNPlayerData.InitPlayerBagList,_LuaCallBackName)
end

--C#回调事件更新玩家背包List数据
function JNPlayerData.InitPlayerBagList(_Str,_JsonCount,_LuaCallBackName)
    -- statements
    if _Str ~= nil and _JsonCount>0 then
        -- statements
        HttpCore.CreatAnalyisJsonData(_Str,"PlayerBagData")
        JNPlayerData.InitPlayerBag("PlayerBagData",_JsonCount,_LuaCallBackName)
    end
end

--原根据JsonDataKey取得背包数据更新背包
--function JNPlayerData.InitPlayerBag(_JsonData,_JsonCount,_LuaCallBackName)
--    -- statements
--    JNPlayerData.ItemBag={}
--    JNPlayerData.GearPuzzleBag={}
--    for i = 0, _JsonCount - 1, 1 do
--        -- statements
--        local BagDataTab={}
--        local ItemUId=HttpCore.GetAnalyisDataByKey(_JsonData,"id",i)
--        local ItemId=HttpCore.GetAnalyisDataByKey(_JsonData,"goodsId",i)
--        local ItemSum=HttpCore.GetAnalyisDataByKey(_JsonData,"num",i)
--        local ItemType=HttpCore.GetAnalyisDataByKey(_JsonData,"type",i)
--        local ItemGetTimeStamp=HttpCore.GetAnalyisDataByKey(_JsonData,"getTime",i)
--        table.insert(BagDataTab,ItemUId)
--        table.insert(BagDataTab,ItemId)
--        table.insert(BagDataTab,ItemSum)
--        for key, value in pairs(GameData.tab.goods) do
--            -- statements
--            if value[1] == ItemId then
--                -- statements
--                ItemType=value[2]
--                if value[2] == "4" then
--                    -- statements
--                    local _JNGearPuzzlData=JNGearPuzzle:new(ItemId,ItemUId,tonumber(ItemSum),value)
--                    table.insert(JNPlayerData.GearPuzzleBag,_JNGearPuzzlData)
--                end
--            end
--        end
--        table.insert(BagDataTab,ItemType)
--        table.insert(BagDataTab,ItemGetTimeStamp)
--        table.insert(JNPlayerData.ItemBag,BagDataTab)
--    end
--    --更新主菜单信息
--    -- print("_LuaCallBackName".._LuaCallBackName)
--    JNPlayerData.InitMainInfo(_LuaCallBackName)
--end

--原更新主界面人物相关信息
--function JNPlayerData.InitMainInfo(_LuaCallBackName)
--    -- statements
--    HttpCore.GetMenuInfoList("JNPlayerData.InitMainInfoList",JNPlayerData.InitMainInfoList,_LuaCallBackName)
--end
----原C#回调更新主菜单信息
--function JNPlayerData.InitMainInfoList(_Str,_LuaCallBackName)
--    -- statements
--    HttpCore.CreatAnalyisJsonData(_Str,"LoginJson")
--    local PlayerInfoTab =JNPlayerData.GetPlayerInfoTab("LoginJson")
--    JNPlayerData.InitPlayerInfo(PlayerInfoTab)
--    if _LuaCallBackName ~=nil and _LuaCallBackName ~= "" then
--        -- statements
--        Event.Go(_LuaCallBackName)
--        -- Event.Clear(_LuaCallBackName)
--    end
--end
return JNPlayerData

