require("LocalData/RoleattriskillupLocalData")
require("LocalData/RoleattriawakeningLocalData")
require("LocalData/RoleattristarupLocalData")
require("LocalData/SteamLocalData")
---板娘卡池 VM
RoleCardViewModel = {}
---角色好感度上限
RoleCardViewModel.MaxFavor = tonumber(SteamLocalData.tab[105001][2])
---角色好感度等级划分
RoleCardViewModel.FavorLevel = string.split(SteamLocalData.tab[105002][2],",")  --{1_0,2_25,3_50,4_75,5_100}
---角色缓存数据
RoleCardViewModel.CacheRoleDataArr = nil
---角色排序缓存数据
RoleCardViewModel.CacheRoleDataArr_Sort = nil
---当前选择角色
---@type RoleData
RoleCardViewModel.CurrentHero = nil
---当前选择好友角色
RoleCardViewModel.CurrentFriendHero = nil
---当前选择角色属性
RoleCardViewModel.CurrentAttr = nil
---当前选择共鸣
RoleCardViewModel.CurrentEquip= nil
---当前选择核心
RoleCardViewModel.CurrentCore= nil
---当前选择核心槽位
RoleCardViewModel.CurCoreIndex= 1
---当前页面ID
RoleCardViewModel.PanelID = nil
---页面类型  Normal表示是自己的页面，除此之外都是别人的角色页面
RoleCardViewModel.CurType = "Normal"
---当前玩家角色的索引数据
RoleCardViewModel.CurRoleIndex = nil
--是否是从装备升级界面返回驾驶员界面
RoleCardViewModel.isBackEquipToRole = false
---当前角色详情界面，选择的攻防类型0攻击 1防守
RoleCardViewModel.CurArmorType = 0
---筛选角色
RoleCardViewModel.FilterType = {
    ---所有角色
    Role = 1,
    ---拥有超限装备的角色
    Special = 2
}

---初始化
function RoleCardViewModel.Init(callback)
    RoleCardViewModel.ReloadCacheRoleData()     ---获取数据缓存
    RoleCardViewModel.OpenRoleCardUI(callback)          ---打开UI
end

---销毁
function RoleCardViewModel.Close()
    MgrUI.GoBack()
end

-----------------------跳转-----------------------
---打开佣兵卡池UI
function RoleCardViewModel.OpenRoleCardUI(callback)
    MgrUI.GoHide(UID.RoleCard_UI, function ()
        if callback then
            callback()
        end
    end)
end
---打开养成UI
function RoleCardViewModel.OpenCultivateRoleUI()
   -- MgrUI.GoHide(UID.RoleUpgrade_UI)
    RoleCardViewModel.CurType = "Normal"
    MgrUI.GoHide(UID.NewRoleDetail2_UI)
end

---打开好友的角色详情UI
function RoleCardViewModel.OpenFriendRoleUI()
    RoleCardViewModel.CurType = "Friend"
    --MgrUI.GoHide(UID.NewRoleDetail2_UI)
    MgrUI.Pop(UID.RoleXiangqing_UI,{RoleCardViewModel.CurrentHero,"FriendRole",{},RoleCardViewModel.CurrentFriendHero},true)   --RoleCardViewModel.GetRole()
end

---------------------业务逻辑---------------------
---重载角色数据缓存
function RoleCardViewModel.ReloadCacheRoleData()
    RoleCardViewModel.CacheRoleDataArr = HeroControl.GetHaveHero()
end
---获取角色数据缓存
function RoleCardViewModel.GetRoleData(filters,sort,rise,filterType)
    if RoleCardViewModel.CacheRoleDataArr == nil then
        RoleCardViewModel.ReloadCacheRoleData()
    end
    local array = RoleCardViewModel.CacheRoleDataArr
    if filterType == RoleCardViewModel.FilterType.Special then
        local filterGroup = {}
        for i, v in pairs(array) do
            if v.SpecialEquip then
                table.insert(filterGroup, v)
            end
        end
        array = filterGroup
    end
    ---有类型时筛选
    if filters and not filters[0] then
        ---筛选
        local filterGroup = {}
        for i, v in pairs(filters) do
            if v then
                table.insert(filterGroup,i)
            end
        end
        array = RoleCardViewModel.RoleFilter(array, "New_Career", filterGroup)
    end
    ---排序(1等级,2星级,3稀有度,4好感度,5取得时间,6超限等级)
    local sortGroupArr = {
        [1] = {"level","star","rank","awaken","id"},
        [2] = {"star","level","rank","awaken","id"},
        [3] = {"rank","star","level","id"},
        [4] = {"favor","rank","level","id"},
        [5] = {"cTime","level","id"}
    }
    local isRise = {
        [1] = {rise,rise,rise,not rise,rise},
        [2] = {rise,rise,rise,not rise,rise},
        [3] = {rise,rise,rise,rise},
        [4] = {rise,rise,rise,rise},
        [5] = {rise,rise},
    }
   
    if filterType == RoleCardViewModel.FilterType.Special then
        sortGroupArr = {
            [1] = {"SpecialEquipUnlock","sEquipOff","SpecialLevel","star","rank","awaken","id"},
            [2] = {"SpecialEquipUnlock","sEquipOff","star","SpecialLevel","rank","awaken","id"},
            [3] = {"SpecialEquipUnlock","sEquipOff","rank","star","SpecialLevel","id"},
            [4] = {"SpecialEquipUnlock","sEquipOff","favor","rank","SpecialLevel","id"},
            [5] = {"SpecialEquipUnlock","sEquipOff","cTime","SpecialLevel","id"}
        }
        isRise = {
            [1] = { false, false, rise, rise, rise, rise, rise },
            [2] = { false, false, rise, rise, rise, rise, rise },
            [3] = { false, false, rise, rise, rise, rise },
            [4] = { false, false, rise, rise, rise, rise },
            [5] = { false, false, rise, rise, rise },
        }
    end
    Global.Sort(array,sortGroupArr[sort],isRise[sort]) --原来的角色等级排序 需要重写TODOL
    --筛选角色是否为偏爱
    --if sort == 1 or sort == 2 or sort == 3 or sort == 4 then
        local t = {}
        for i, v in pairs(array) do
            local isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",v.id))
            if isLove ~= nil and  isLove ~= "" then
                table.insert(t,v)
            end
        end
        for i, v in pairs(array) do
            local isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",v.id))
            if isLove == nil or isLove == "" then
                table.insert(t,v)
            end
        end
        array = t
    --end

    if NoviceViewModel.CurTaskId == 20003 or NoviceViewModel.CurTaskId == 20202 then
        local t = {
            [1] =  RoleCardViewModel.GetHeroByID(tonumber(SteamLocalData.tab[120003][2]))
        }
        for i, v in pairs(array) do
            if v.id ~= tonumber(SteamLocalData.tab[120003][2]) then
                table.insert(t,v)
            end
        end
        array = t
    end

    RoleCardViewModel.CacheRoleDataArr_Sort = array

    return array
end
---通过ID获取角色
function RoleCardViewModel.GetRoleByID(ID)
    if RoleCardViewModel.CacheRoleDataArr == nil then
        RoleCardViewModel.ReloadCacheRoleData()
    end
    for i, v in pairs(RoleCardViewModel.CacheRoleDataArr) do
        if ID==v.id then
            RoleCardViewModel.CurrentHero = v
            RoleCardViewModel.CurRoleIndex = i
        end
    end
end
---通过ID获取角色
function RoleCardViewModel.GetHeroByID(ID)
    if RoleCardViewModel.CacheRoleDataArr == nil then
        RoleCardViewModel.ReloadCacheRoleData()
    end
    for i, v in pairs(RoleCardViewModel.CacheRoleDataArr) do
        if ID==v.id then
            return v
        end
    end
    return nil
end

---通过ID获取好友角色
function RoleCardViewModel.GetRole(ID,Data)
    --RoleCardViewModel.CurrentHero = HeroControl.GetRoleDataByID(ID)
    RoleCardViewModel.CurrentFriendHero = Data
    RoleCardViewModel.CurrentHero = RoleData.New(ID)
    RoleCardViewModel.CurrentHero:PushSingleFriendHeroData2(Data)
end
---角色筛选
function RoleCardViewModel.RoleFilter(list, key, values)
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
---获取加入游戏的角色最大数量
function RoleCardViewModel.GetRoleMax()
    return HeroControl.GetRoleMax()
end
---根据id播放语音
function RoleCardViewModel.PlayRoleVoice(type)
    local _CurRoleID = RoleCardViewModel.CurrentHero.id
    --local _ActorLinesType=tonumber(RoleattributeLocalData.tab[_CurRoleID][3]) ---当前台词组别
    local curRoleSkin = HeroControl.GetRoleDataByID(PlayerControl.GetPlayerData().curRoleID).skin
    local _ActorLinesType = tonumber(RoleuiskinLocalData.tab[curRoleSkin].interaction)
    local _FinalActorLineID=0
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == _ActorLinesType and value[4] == type then
            _FinalActorLineID=value[1]
        end
    end
    local _AudioName=ActorLinesLocalData.tab[_FinalActorLineID][13]
    MgrSound.PlayRole(_AudioName,nil,nil,false,0,0,tostring(_CurRoleID))
end
---检查驾驶员红点
function RoleCardViewModel.CheckRot()
    RedDotControl.GetDotData("Role"):SetState(false)
    for i, v in pairs(HeroControl.GetHaveHero()) do
        if SysLockControl.CheckSysLock(1002) then
            if v:GetHeroAttr().SkillLV < v:GetHeroAttr().SkillMaxLV then
                local mCostNeed = 0     --主材料消耗数量
                local coinNeed = 0      --货币消耗数量
                local coinItem = 0      --消耗货币材料
                local str = string.split(v.CostIcon,"_")
                local mainCost = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))    --主要消耗材料
                ---材料赋值
                local tSkillUpData = SkillUpControl.GetSkillUpData(v:GetHeroAttr().Rank, v.skillLevel,v.New_Career)
                if tSkillUpData == nil then
                    break
                end
                mCostNeed = tonumber(tSkillUpData.cost[3])
                coinItem = ItemControl.GetItemByIdAndType(tonumber(tSkillUpData.ortherCost[2]),tonumber(tSkillUpData.ortherCost[1]))
                coinNeed = tonumber(tSkillUpData.ortherCost[3])
               
                if mainCost.count >= mCostNeed and coinItem.count >= coinNeed then
                    RedDotControl.GetDotData("Role"):SetState(true)
                    return
                end
            end
        end
        ---检查是否能够升星或者觉醒
        local attr = v:GetHeroAttr()
        if SysLockControl.CheckSysLock(1003) then
            if attr.LV >= attr.LvMax then
                if RoleCardViewModel.CheckStarUp(v) then

                    --玩家当前等级是否支持此次突破
                    local tab = {}
                    local t = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][7]
                    local a = string.split(t,',')
                    for i, v in ipairs(a) do
                        local d = string.split(v,'_')
                        tab[tonumber(d[1])] = tonumber(d[2])
                    end
                    local t_start = tab[attr.Rank]
                    if attr.StartLV < t_start then
                        RedDotControl.GetDotData("Role"):SetState(true)
                        return
                    end
                end
            end
        end
        if SysLockControl.CheckSysLock(1004) then
            if attr.StartLV >= attr.awakenStar  then
                if RoleCardViewModel.CheckAwake(v) then
                    RedDotControl.GetDotData("Role"):SetState(true)
                    return
                end
            end
        end
        ---检查驾驶员特殊共鸣装备
        ---检查特殊共鸣装备是否能合成(等级达到最大/为拥有/系统打开)
        if EquipControl.GetSingleSpecialEquip(v.id) and v:HeroAllEquipLevelMax() and not EquipControl.GetSingleSpecialEquip(v.id).lockState and EquipControl.SpecialEquipOnOrOff() then
            local SpecialGear = EquipControl.GetSingleSpecialEquip(v.id)
            if SpecialGear then
                ---@type ItemData[]
                local materials = SpecialGear:GetMixMaterial()
                local enough = true
                for i,m in pairs(materials) do
                    local bagItem = ItemControl.GetItemByIdAndType(m.id,m.goodsType)
                    if bagItem.count < m.count then
                        enough = false
                        break
                    end
                end
                if enough then
                    RedDotControl.GetDotData("Role"):SetState(true)
                    return
                end
            end
        end

        if EquipControl.GetSingleSpecialEquip(v.id) and EquipControl.GetSingleSpecialEquip(v.id).lockState and EquipControl.SpecialEquipOnOrOff() then
            local SpecialGear = EquipControl.GetSingleSpecialEquip(v.id)
            if SpecialGear then
                ---检查特殊共鸣装备是否能升级
                ---@type ItemData[]
                local materials = SpecialGear:GetLevelUpMaterial()
                local enough = true
                for i,m in pairs(materials) do
                    local bagItem = ItemControl.GetItemByIdAndType(m.id,m.goodsType)
                    if bagItem.count < m.count then
                        enough = false
                        break
                    end
                end
                if enough then
                    if SpecialGear.evolutionLevel < SpecialGear:GetMaxLevel() then
                        RedDotControl.GetDotData("Role"):SetState(true)
                        return
                    end
                end
                ---检查特殊共鸣装备是否能突破
                local materials_Advance = SpecialGear:GetAdvanceMaterial()
                local enough_Advance = true
                for i,m in pairs(materials_Advance) do
                    local bagItem = ItemControl.GetItemByIdAndType(m.id,m.goodsType)
                    if bagItem.count < m.count then
                        enough_Advance = false
                        break
                    end
                end
                if enough_Advance then
                    if SpecialGear.evolutionLevel == SpecialGear:GetMaxLevel() and SpecialGear.evolutionLevel ~= SpecialGear:MaxLevel() then
                        RedDotControl.GetDotData("Role"):SetState(true)
                        return
                    end
                end
            end
        end
    end
end
---@param hero RoleData
function RoleCardViewModel.CheckStarUp(hero)
    if hero.star >= 6  then
        return false
    end
    for i, v in pairs(RoleattristarupLocalData.tab) do
        if hero.rank == v[2] and hero.star == v[3] then
            local  StarCostTab1 =JNStrTool.strSplit(",",v[4])
            for m, n in pairs(StarCostTab1) do
                local StarCostTab2 = JNStrTool.strSplit("_", n )
                local item = ItemControl.GetItemByType(1,tonumber(StarCostTab2[2]))
                local BagItem = ItemControl.GetItemByID(tonumber(StarCostTab2[2]))
                if tonumber(StarCostTab2[3]) > BagItem.count then
                    return false
                end
            end
        end
    end
    return true
end
---@param hero RoleData
function RoleCardViewModel.CheckAwake(hero)
    if hero.awaken  then
        return false
    end
    for i, v in pairs(RoleattriawakeningLocalData.tab) do
        if hero.New_Career == v[2] and hero.rank == v[3] then
            local StarCostTab1 =JNStrTool.strSplit(",",v[4])
            for m, n in pairs(StarCostTab1) do
                local StarCostTab2 = JNStrTool.strSplit("_", n)
                local item = ItemControl.GetItemByType(1,tonumber(StarCostTab2[2]))
                local BagItem = ItemControl.GetItemByID(tonumber(StarCostTab2[2]))
                if tonumber(StarCostTab2[3]) > BagItem.count then
                    return false
                end
            end
        end
    end
    return true
end

---获取角色当前升级一本经验书的金币消耗
function RoleCardViewModel.GetRoleLvUpCoinCost(roleId)
    local roleData = HeroControl.GetRoleDataByID(roleId)
    for k,v in pairs(RoleattrilevelLocalData.tab) do
        if roleData.rank == v[2] and roleData.star == v[3] then  --如果稀有度和星级相同
            return v[8]/10000  --万分比除以一万
        end
    end
    return nil
end
---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function RoleCardViewModel.PlayTargetRoleAniVoice(_ActorLineId,_SpineObj)
    if _ActorLineId == nil then
        return
    end
    --引导中不播放相关角色语音
    if NoviceViewModel.Noviceing then
        return
    end
    local _AniName = ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _AudioType = ActorLinesLocalData.tab[_ActorLineId][3]
    local _BackAniName = "idle"
    if _AudioType == 93 then  --脱衣语音
        RoleCardViewModel.CurClothes = PosterGirlViewModel.ClothesType.undress
    elseif _AudioType == 96 then  --穿衣语音
        RoleCardViewModel.CurClothes = PosterGirlViewModel.ClothesType.wear
    end
    if RoleCardViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress then
        _BackAniName = "idle2"  --脱衣状态
        ---如果随机到主界面随机语音修改随机语音播放的动画
        if ActorLinesLocalData.tab[_ActorLineId][4] == 4 then
            _AniName = "idle2"
        end
    else
        _BackAniName = "idle"   --穿衣状态
    end
    if _SpineObj ~= nil and _AniName ~= "0" then
        CMgrSpine.Instance:SetSpineAnimation(_SpineObj, _AniName, false,nil,_BackAniName)
    end
    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,"RoleDetails_"..RoleCardViewModel.CurrentHero.id)
end

function RoleCardViewModel.Clear()
    RoleCardViewModel.CacheRoleDataArr = nil
    RoleCardViewModel.CurrentHero = nil
    RoleCardViewModel.CurrentFriendHero = nil
    RoleCardViewModel.CurrentAttr = nil
    RoleCardViewModel.CurrentEquip= nil
    RoleCardViewModel.CurrentCore= nil
    RoleCardViewModel.CurCoreIndex= 1
    RoleCardViewModel.PanelID = nil
    RoleCardViewModel.CurType = "Normal"
    RoleCardViewModel.CurRoleIndex = nil
end

return RoleCardViewModel