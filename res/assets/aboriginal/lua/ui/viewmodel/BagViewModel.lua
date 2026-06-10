require("LocalData/HxpositionLocalData")
------------背包VM------------
---待优化及业务逻辑整合
BagViewModel = {}
---@type ItemData[] 物品缓存
BagViewModel.CacheItemDataArray = {}
---@type CoreData[] 核心缓存
BagViewModel.CacheCoreDataArray = {}
---@type CoreChipData[] 核心碎片缓存
BagViewModel.CacheCoreChipDataArray = {}
---@type HideItemData[] 隐藏背包缓存
BagViewModel.HideDataArray = {}
---@type RoleData[] 所有角色缓存
BagViewModel.CacheHeroDataArray = {}
---@type CoreData 当前选中的核心
BagViewModel.CurrentCore = nil
---各个背包数据
BagViewModel.CacheArray = {}
---跳转索引
BagViewModel.CorePage = nil

BagViewModel.BagPageEnum = {
    ---道具
    PageItem = 1,
    ---共鸣装备
    PageEquip = 2,
    ---机甲核心
    PageCore = 3,
    ---核心碎片
    PageCacheCore = 4
}
BagViewModel.BagPageID = BagViewModel.BagPageEnum.PageItem
BagViewModel.curSelectSwitch = 0 --页签红点清除标记

---------------------初始化-----------------------
function BagViewModel.Init(callback,pageType)
    ---获取缓存数据
    BagViewModel.ReloadCacheData()
    if pageType ~= nil then
        BagViewModel.BagPageID = pageType
    end
    ---背包视图
    BagViewModel.OpenBagUI(callback)
end

function BagViewModel.Close()
    MgrUI.GoBack()
end
---------------------UI跳转------------------------
function BagViewModel.OpenBagUI(callback)
    MgrUI.GoHide(UID.Bag_UI, function ()
        if callback then
            callback()
        end
    end)
end

---------------------物品业务逻辑------------------------
---刷新缓存数据
function BagViewModel.ReloadCacheData()
    ---重新获取物品缓存
    BagViewModel.CacheItemDataArray = ItemControl.GetNotZeroItems()
    ---重新获取核心缓存
    BagViewModel.CacheCoreDataArray = CoreControl.GetCores()
    ---重新获取核心碎片缓存
    BagViewModel.CacheCoreChipDataArray = ItemControl.GetCoreChips()
    ---重新获取隐藏背包数据
    BagViewModel.HideDataArray = ItemControl.GetHideData()
    ---重新获取共鸣装备缓存
    BagViewModel.CacheHeroDataArray = HeroControl.GetAllHero()

    BagViewModel.CacheArray = {
        [1] = { BagViewModel.CacheItemDataArray },
        [2] = { BagViewModel.CacheCoreChipDataArray },
        [3] = { BagViewModel.CacheCoreDataArray },
        [4] = { BagViewModel.HideDataArray },
        [5] = { BagViewModel.GetHaveEquipData() },
        [99] = { BagViewModel.CacheHeroDataArray }
    }
end
---获取道具数据
function BagViewModel.GetItemData(type)
    local array = {}
    for i, v in pairs(BagViewModel.CacheItemDataArray) do
        local tLimitItem = ItemControl.GetLimitItemByID(v.goodsType,v.id)
        if tLimitItem==nil or tLimitItem.ETime > Global.GetCurTime() then
            if v.count > 0 then
                array[#array + 1] = v
            end
        end
    end
    ---物品筛选
    if type ~= 0 then
        local filterGroup = {itemType = type}
        array = BagViewModel.ItemFilter(array,filterGroup)
    --else
    --    ---追加碎片
    --    for i, v in pairs(BagViewModel.CacheCoreChipDataArray) do
    --        array[#array + 1] = v
    --    end
    end
    ---物品排序
    local sortGroup = {"group","quality"}
    Global.Sort(array,sortGroup,true)
    return array
end

---道具筛选
function BagViewModel.ItemFilter(list, kvs)
    local t = {}
    for _, data in pairs(list) do
        local isSame = true
        for k, v in pairs(kvs) do
            if data[k] ~= v then
                ---类型不同时跳出
                isSame = false
                break
            end
        end
        if isSame then
            ---所有定义类型相同添加到表
            table.insert(t,data)
        end
    end
    return t
end
---根据道具类型获取各个背包数据
function BagViewModel.GetCacheArrayByType(_type)
    return BagViewModel.CacheArray[_type] and BagViewModel.CacheArray[_type][1] or nil
end
---------------------核心业务逻辑------------------------
---获取核心数据
function BagViewModel.GetCoreData(filterIdx, sortIdx, isRise)
    local array = BagViewModel.CacheCoreDataArray
    ---筛除类型
    if filterIdx and filterIdx ~= 0 then
        local filter_Str = string.split(SteamLocalData.tab[filterIdx][2],",")
        local filter_Num = {}
        for i, v in pairs(filter_Str) do
            filter_Num[i] = tonumber(v)
        end
        local filterGroup = {type = filter_Num}
        array = BagViewModel.CoreFilter(array,filterGroup)
    end
    ---核心排序
    local sortGroup = {
        [1] = {"level","star","quality","properties","id"},
        [2] = {"star","level","quality","properties","id"},
        [3] = {"uid"},
    }
    local rise = isRise == nil and true or isRise
    Global.Sort(array,sortGroup[sortIdx or 1],rise)
    return array
end



---核心筛选
function BagViewModel.CoreFilter(list,kvs)
    local t = {}
    if not kvs then
        return list
    end
    for _, data in pairs(list) do
        local isSame = false
        for k, v in pairs(kvs) do
            if type(v) == "table" then
                for _, v_type in pairs(v) do
                    if data[k] == v_type then
                        ---类型相同时添加
                        isSame = true
                        break
                    end
                end
            else
                if data[k] == v then
                    ---类型相同时添加
                    isSame = true
                    break
                end
            end
        end
        if isSame then
            ---所有定义类型相同添加到表
            table.insert(t,data)
        end
    end
    return t
end
---获取核心最高星级
function BagViewModel.GetCoreStarMax()
    return tonumber(SteamLocalData.tab[106013][2])
end
---核心最大基础属性词条数量缓存
BagViewModel.CacheCoreAttrMax = 0
---获取核心最大基础属性词条数量
function BagViewModel.GetCoreAttrMax()
    return 2
    --if CoreControl.CacheCoreAttrMax < 1 then
    --    return CoreControl.CacheCoreAttrMax
    --end
    --for i, v in pairs(ArmoredcoreLocalData.tab) do
    --    local attrNum = string.split(v[11],"_")
    --    if attrNum > CoreControl.CacheCoreAttrMax then
    --        CoreControl.CacheCoreAttrMax = attrNum
    --    end
    --end
    --return CoreControl.CacheCoreAttrMax
end
---@return table 获取核心仓库配置
function BagViewModel.GetCoreBoxConf()
    for i, v in pairs(HxpositionLocalData.tab) do
        if v[2] == PlayerControl.GetPlayerData().expand then
            return v
        end
    end
    return nil
end
---@return number 获取当前核心数量
function BagViewModel.GetCoreListCount()
    local count = 0
    for i, v in pairs(BagViewModel.CacheCoreDataArray) do
        count = count + 1
    end
    return count
end
---@type CoreData[] 已选择核心缓存
BagViewModel.CacheCoreSelects = {}
---@param data CoreData 被批量选取的核心，true添加false去掉
function BagViewModel.SetCoreSelects(data, isDiff)
    if isDiff then
        BagViewModel.CacheCoreSelects[data.uid] = data
    else
        BagViewModel.CacheCoreSelects[data.uid] = nil
    end
end
---@return CoreData 获取核心批选中的数据
function BagViewModel.GetCoreSelects(uid)
    return BagViewModel.CacheCoreSelects[uid]
end
---获取核心批选分解奖励总数
function BagViewModel.GetCoreSelectAllCount()
    ---获取总数量
    local count = 0
    for i, v in pairs(BagViewModel.CacheCoreSelects) do
        count = count + v.decompose.goods.goodsNum
    end
    return count
end
---获取核心分解奖励图标
function BagViewModel.GetCoreSelectIcon()
    return ItemLocalData.tab[100001].icon
end
---清空核心批量选择器
function BagViewModel.ClearCoreSelects()
    BagViewModel.CacheCoreSelects = {}
end
---@type CoreData[] 计算核心自动分解数据
function BagViewModel.ReckonAutoCore(starArr,qualityArr)        --删除几星/最高删除品质
    local coreArray = BagViewModel.CacheCoreDataArray
    local coreList = {}
    for idx, isSelect in pairs(starArr) do
        if isSelect then
            ---筛选星级与未强化
            local filterGroup = {star = idx}
            ---@type CoreData[]
            local starArr = BagViewModel.CoreFilter(coreArray,filterGroup)
            ---筛选品质
            for i, core in pairs(starArr) do
                ---品质等于或低于目标添加到队列，并且未被上锁
                if core.quality <= qualityArr[idx] and CoreControl.GetCoreLock(core.uid) ~= 1 then
                    table.insert(coreList,core)
                end
            end
        end
    end
    return coreList
end
---@type CoreData[] 精确计算核心自动分解数据
function BagViewModel.ExactReckonAutoCore(starArr,qualityArr)
    local coreArray = BagViewModel.CacheCoreDataArray
    local coreList = {}
    local arr = {}
    for idx, isSelect in pairs(starArr) do
        if isSelect then
            ---筛选星级与未强化
            local filterGroup = {star = idx}
            ---@type CoreData[]
            local starArray = BagViewModel.CoreFilter(coreArray,filterGroup)
            ---添加满足星级条件的核心
            for i, core in pairs(starArray) do
                ---如果未被上锁
                if CoreControl.GetCoreLock(core.uid) ~= 1 then
                    table.insert(coreList,core)
                end
            end
        end
    end
    ---筛选品质
    for k,core in pairs(coreList) do
        for i,quality in pairs(qualityArr) do
            ---如果品质满足
            if core.quality == quality then
                table.insert(arr,core)
            end
        end
    end
    return arr
end

---计算核心自动分解已选奖励总数
function BagViewModel.ReckonAutoCoreAllCount(...)
    ---@type CoreData[]
    local coreArray = BagViewModel.ReckonAutoCore(...)
    ---获取总数量
    local count = 0
    for i, v in pairs(coreArray) do
        count = count + v.decompose.goods.goodsNum
    end
    return count
end
---核心自动分解请求(星表,品质表)
function BagViewModel.SendAutoCoreDecompose(state,idx,cell)
    local coreArray = BagViewModel.ReckonAutoCore(state,idx)
    if #coreArray == 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("arkviewmodel_tips1"),1},true)
    end
    BagViewModel.SendCoreDecompose(coreArray,cell)
end
---------------------核心碎片业务逻辑------------------------
---获取核心碎片缓存
function BagViewModel.GetCorePuzzleData()
    ---获取核心碎片
    local array = {}
    for k,v in pairs(BagViewModel.CacheCoreChipDataArray) do
        if v.count ~= 0 then
            table.insert(array,v)
        end
    end
    ---排序
    local sortGroup = {"quality"}
    Global.Sort(array,sortGroup,true)
    if NoviceViewModel.CurTaskId == 20705 then
        local t = {
            [1] =  ItemControl.GetItemByIdAndType(100001,2)
        }
        for i, v in pairs(array) do
            if v.id ~= 100001 then
                table.insert(t,v)
            end
        end
        array = t
    end
    return array
end
-----------------------共鸣装备业务逻辑----------------------------
---@return EquipData[] 获取所有角色装备
function BagViewModel.GetEquipData(filter,sort,isRise)
    local array = BagViewModel.CacheHeroDataArray
    local eqArr = {}
    ---有类型时筛选
    if filter ~= 0 then
        ---筛选
        array = BagViewModel.CareerFilter(array, "New_Career", {filter})
    end
    ---默认排序
    local sortGroup = {"awaken","star","rank","id"}
    Global.Sort(array,sortGroup,false)
    for i, v in ipairs(array) do
        for i, id in ipairs(v.equipArr) do
            eqArr[#eqArr + 1] = EquipControl.GetSingleEquips(id)
        end
    end
    ---指定排序
    sortGroup = sort == 1 and {"level","quality","id"} or {"lockState","level","quality","id"}
    local rise = isRise
    if sort == 2 then
        rise = not isRise
    end
    Global.Sort(eqArr,sortGroup,rise)
    return eqArr
end

---共鸣装备职业筛选
function BagViewModel.CareerFilter(list, key, values)
    local t = {}
    for _, data in pairs(list) do
        for _, v in pairs(values) do
            if data[key] == v then
                ---任一类型相同时添加
                table.insert(t,data)
                break
            end
        end
    end
    return t
end

---获取已拥有的共鸣装备
function BagViewModel.GetHaveEquipData()
    local tArr = {}
    local tAllEquipSort = BagViewModel.GetEquipData(0,1,true)
    for i = 1, #tAllEquipSort do
        if tAllEquipSort[i].level > 0 then
            table.insert(tArr,tAllEquipSort[i])
        else
            break
        end
    end
    
    return tArr
end

----------------------------------背包通信方法---------------------------------------
---@param coreDataArr CoreData[] 发送核心批量分解
function BagViewModel.SendCoreDecompose(coreDataArr,callback)
    local len = 0
    local count = 0
    local name = ""
    ---@type goods[]
    local goodsList = {}
    local wearGoods = false
    for i, v in pairs(coreDataArr) do
        if v.RoleId == 0 then
            ---只添加未装备的核心
            len = len + 1
            table.insert(goodsList,v.goods)
        else
            wearGoods = true
        end
    end
    if len < 1 then
        print("未选择物品不发送")
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("arkviewmodel_tips1"),1},true)
        return
    end
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientDecomposeREQ',{target = goodsList}))
    ItemControl.AckError = true
    TaskControl.AckError = true
    local str = MgrLanguageData.GetLanguageByKey("bagviewmodel_tips2")
    ---确认窗口
    MgrUI.Pop(UID.ConfirmPop_UI,{str,function()
        ---发送数据（发送成功后更新显示，发送不成功不更新)
        MgrNet.SendReq(MID.CLIENT_DECOMPOSE_REQ,bytes,0,nil,function(...)
            BagViewModel.ReceiveDecomposeACK(...,callback)
        end,function(...)
            BagViewModel.ReceiveDecomposeNTF(...)
            if callback then
                callback()
            end
            if wearGoods then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("bagviewmodel_tips1"),1},true)
            end
        end)
    end,nil,2},true)
end

--新版核心回收发送
function BagViewModel.SendCoreRecycle(list,callback)
    local goodsList = list
    if #goodsList < 1 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("arkviewmodel_tips1"),1},true)
        return
    end
    ---确认窗口
    MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("bagviewmodel_tips2"),function()
        --发送数据（发送成功后更新显示，发送不成功不更新)
        local bytes = assert(pb.encode('PBClient.ClientDecomposeREQ',{target = goodsList}))
        MgrNet.SendReq(MID.CLIENT_DECOMPOSE_REQ,bytes,0,nil,function(...)
            BagViewModel.ReceiveDecomposeACK(...,callback)
        end,function(...)
            BagViewModel.ReceiveDecomposeNTF(...)
            if callback then callback() end
        end)
    end,nil,2},true)
end

---核心分解ACK回调
function BagViewModel.ReceiveDecomposeACK(buffer, tag ,callback)
    local tab = assert(pb.decode('PBClient.ClientDecomposeACK',buffer))
    print("核心分解ACK:"..serpent.block(tab)) ---查看table内容
    if tab.errNo ~= 0 then
        if callback then
            callback()
        end
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
    end
end
---核心分解NTF回调
function BagViewModel.ReceiveDecomposeNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientDecomposeNTF',buffer))
    print("核心分解NTF:"..serpent.block(tab)) ---查看table内容
    ---移除核心
    CoreControl.DeleteCore(tab.cost)
    ---添加到物品
    ItemControl.PushGroupItemData(tab.obtain,ItemControl.PushEnum.add)
    ---刷新vm缓存
    BagViewModel.ReloadCacheData()
    ---弹出奖励窗口
    MgrUI.Pop(UID.ItemAchievePop_UI,{tab.obtain},true)
    ---统计
    TaskControl.ChangeStatistics(nil,nil,nil,tab.glory)
end

---修改核心锁状态
function BagViewModel.ChangeLockReq(coreUid,targetState,callback)
    local goods = {
        [1] = {
            goodsType = 3,
            goodsID = coreUid,
            goodsNum = 1,
        }
    }
    --发送数据（发送成功后更新显示，发送不成功不更新)
    local bytes = assert(pb.encode('PBClient.ClientChangeLockREQ',{
        target = goods,
        status = targetState,
    }))
    MgrNet.SendReq(MID.CLIENT_CHANGE_LOCK_REQ,bytes,0,nil,function(...)
        BagViewModel.ChangeLockACK(... )
    end,function(...)
        BagViewModel.ChangeLockNTF(...)
        if callback then callback() end
    end)
end

function BagViewModel.ChangeLockACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChangeLockACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips2"..tab.errNo),1},true)
    end
end

function BagViewModel.ChangeLockNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientChangeLockNTF',buffer))
    if tab.target then
        for k,v in pairs(tab.target) do
            CoreControl.PushSingleCoreData(v)
        end
    end
end

----------------------------------背包红点---------------------------------------

function BagViewModel:CheckBagRot()
    local count = 0
    local PZ = false
    local GB = false
    local ITM = false --道具
    local CR = false  --核心
    if SysLockControl.CheckSysLock(1902) then
        for i, v in pairs(ItemControl.GetCoreChips()) do
            local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "CorePuzzle%s",v.id))
            if isNew == nil or isNew == "" and v.count ~= 0 then
                count = count + 1
                RedDotControl.GetDotData("CorePz"):SetState(true)
                PZ = true
                break
            end
        end
    end

    if SysLockControl.CheckSysLock(1904) then
        local flag = 0
        for i, v in pairs(HeroControl.GetHaveHero()) do
            local voidArr = v:GetHeroVoidEquip()
            for m, n in pairs(voidArr) do
                if n.lockState then
                    local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "GearBag%s",n.equipID))
                    if isNew == nil or isNew == "" then
                        count = count + 1
                        RedDotControl.GetDotData("GearBag"):SetState(true)
                        GB = true
                        flag = 1
                        break
                    end
                end
            end
            if flag == 1 then
                break
            end
        end
    end
    --道具
    if SysLockControl.CheckSysLock(1901) then
        for i, v in pairs(ItemControl.GetNotZeroItems(true)) do
            local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "BagItem%s",v.id))
            if isNew == nil or isNew == "" then
                count = count + 1
                RedDotControl.GetDotData("BagItem"):SetState(true)
                ITM = true
                break
            end
        end
    end
    --核心
    if SysLockControl.CheckSysLock(1903) then
        for i, v in pairs(CoreControl.GetCores(true)) do
            local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "MechaCore%s",v.id))
            if isNew == nil or isNew == "" then
                count = count + 1
                RedDotControl.GetDotData("MechaCore"):SetState(true)
                CR = true
                break
            end
        end
    end

    if count > 0 then
        RedDotControl.GetDotData("Bag"):SetState(true)
    else
        RedDotControl.GetDotData("Bag"):SetState(false)
    end

    if not PZ then
        RedDotControl.GetDotData("CorePz"):SetState(false)
    end
    if not GB then
        RedDotControl.GetDotData("GearBag"):SetState(false)
    end
    if not ITM then
        RedDotControl.GetDotData("BagItem"):SetState(false)
    end

    if not CR then
        RedDotControl.GetDotData("MechaCore"):SetState(false)
    end
end

function BagViewModel.Clear()
    BagViewModel.CacheItemDataArray = {}
    BagViewModel.CacheCoreDataArray = {}
    BagViewModel.CacheCoreChipDataArray = {}
    BagViewModel.CacheHeroDataArray = {}
    BagViewModel.CurrentCore = nil
    BagViewModel.CacheArray = {}
    BagViewModel.CorePage = nil
    BagViewModel.HideDataArray = {}
end

return BagViewModel