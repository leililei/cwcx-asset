require("LocalData/CareerBlueprintLocalData");
require("LocalData/DriverBlueprintLocalData");
require("LocalData/BlueprintDropLocalData");
require("LocalData/CareerBlueprintSkillLocalData");

BlueprintViewModel = {}

local m_confInit = false;
local m_careerTotalPoints = {};
local m_roleTotalPoints = {};

local m_dataInit = false;
local m_careerDatas = {};
local m_roleDatas = {};
local m_curType = 1;
local m_curCareer = 11;
local m_curRoleId = 1;
local m_careerSkill = {}
---技能等级
local m_careerSkillLv = {}

function BlueprintViewModel.Init()
    if false == m_confInit then
        m_confInit = true;
        for _, info in pairs(CareerBlueprintLocalData.tab) do
            if nil == m_careerTotalPoints[info.type] then
                m_careerTotalPoints[info.type] = 0;
            end
            m_careerTotalPoints[info.type] = m_careerTotalPoints[info.type] + info.max;
        end
        for _, info in pairs(DriverBlueprintLocalData.tab) do
            if nil == m_roleTotalPoints[info.group] then
                m_roleTotalPoints[info.group] = 0;
            end
            m_roleTotalPoints[info.group] = m_roleTotalPoints[info.group] + info.max;
        end
        for i, v in pairs(CareerBlueprintSkillLocalData.tab) do
            if m_careerSkill[v.type] == nil then
                m_careerSkill[v.type] = {}
            end
            table.insert(m_careerSkill[v.type], v)
        end
        for i, v in pairs(m_careerSkill) do
            table.sort(v, function(a, b) 
                return a.id < b.id
            end)
        end
    end
    m_dataInit = false;
    m_careerDatas = {};
    m_roleDatas = {};
    BlueprintViewModel.SendGetBluePrintReq(nil);
end

function BlueprintViewModel.GetCareerTotalPoint(career)
    -- 职业总点数
    if nil == m_careerTotalPoints[career] then
        return 0;
    end
    return m_careerTotalPoints[career];
end

function BlueprintViewModel.GetRoleTotalPoint(id)
    -- 角色总点数
    if nil == RoleattributeLocalData.tab[id] then
        return 0;
    end
    local group = RoleattributeLocalData.tab[id][88];
    if nil == m_roleTotalPoints[group] then
        return 0;
    end
    return m_roleTotalPoints[group];
end

function BlueprintViewModel.SendGetBluePrintReq(callback)
    -- 数据请求
    local bytes = assert(pb.encode('PBClient.ClientGetBluePrintReq', {}))
    MgrNet.SendReq(MID.CLIENT_GET_BLUE_PRINT_REQ, bytes,0,nil,BlueprintViewModel.OnGetBluePrintAck, function(...)
        BlueprintViewModel.OnGetBluePrintNtf(...);
        if nil ~= callback then
            callback();
        end
    end)
end

function BlueprintViewModel.OnGetBluePrintAck(buffer, tag)
    local ack = assert(pb.decode('PBClient.ClientGetBluePrintAck', buffer));
    print("BlueprintViewModel.OnGetBluePrintAck. errNo: " .. ack.errNo);
end

local m_raidDamages = {};
local m_curRaidDamage = nil;
function BlueprintViewModel.OnGetBluePrintNtf(buffer, tag)
    local ntf = assert(pb.decode('PBClient.ClientGetBluePrintNtf', buffer));
    -- 职业数据
    m_careerDatas = ntf.OccupationNode;
    if nil == m_careerDatas then
        m_careerDatas = {};
    end
    -- 角色数据
    m_roleDatas = ntf.PersonalNode;
    if nil == m_roleDatas then
        m_roleDatas = {};
    end
    m_dataInit = true;
    m_raidDamages = ntf.bpWeekRaidDmg;
    if nil == m_raidDamages then
        m_raidDamages = {};
    end
    -- 技能数据
    for i, v in ipairs(m_careerDatas) do
        if v.ActivatedSkill ~= nil and next(v.ActivatedSkill) then
            m_careerSkillLv[v.ID] = v.ActivatedSkill
        end
    end
    for i, v in ipairs(m_roleDatas) do
        if v.ActivatedSkill ~= nil and next(v.ActivatedSkill) then
            m_careerSkillLv[v.ID] = v.ActivatedSkill
        end
    end
end

function BlueprintViewModel.UpdateRaidDmg(dmg)
    m_curRaidDamage = dmg;
    if nil == m_raidDamages then
        m_raidDamages = {};
    end
    for i, v in pairs(m_raidDamages) do
        if v.levelID == dmg.levelID and dmg.damage > v.damage then
            v.damage = dmg.damage;
            return;
        end
    end
    table.insert(m_raidDamages, dmg);
end

function BlueprintViewModel.GetCurRaidDmg(id)
    if nil ~= m_curRaidDamage and id == m_curRaidDamage.levelID then
        return m_curRaidDamage.damage;
    end
    return nil;
end

function BlueprintViewModel.GetRaidDmg(id)
    for i, v in pairs(m_raidDamages) do
        if v.levelID == id then
            return v.damage;
        end
    end
    return nil;
end

function BlueprintViewModel.GetRaidReward(id)
    local ret = "";
    for _, info in pairs(BlueprintDropLocalData.tab) do
        if info.group == id then
            if "" == ret then
                ret = info.aword;
            else
                ret = ret .. "," .. info.aword;
            end
        end
    end
    return ret;
end

function BlueprintViewModel.SendUpgradeBluePrintNodeReq(id, level, callback)
    -- 升级请求
    local targetID = 0;
    if 2 == m_curType then
        targetID = m_curRoleId;
    end
    local bytes = assert(pb.encode('PBClient.ClientUpgradeBluePrintNodeReq', {
        nodeID = id,
        toLevel = level;
        targetID = targetID;
    }))
    MgrNet.SendReq(MID.CLIENT_UPGRADE_BLUE_PRINT_NODE_REQ, bytes,0,nil,BlueprintViewModel.OnUpgradeBluePrintNodeAck, function(...)
        BlueprintViewModel.OnUpgradeBluePrintNodeNtf(...);
        if nil ~= callback then
            callback();
        end
    end)
end

function BlueprintViewModel.OnUpgradeBluePrintNodeAck(buffer, tag)
    local ack = assert(pb.decode('PBClient.ClientUpgradeBluePrintNodeAck', buffer));
    print("BlueprintViewModel.OnUpgradeBluePrintNodeAck. errNo: " .. ack.errNo);
end

function BlueprintViewModel.OnUpgradeBluePrintNodeNtf(buffer, tag)
    local ntf = assert(pb.decode('PBClient.ClientUpgradeBluePrintNodeNtf', buffer));
    local findFlag = false;
    if 1 == m_curType then
        for i, data in pairs(m_careerDatas) do
            if ntf.activatedNode.ID == data.ID then
                m_careerDatas[i] = ntf.activatedNode;
                findFlag = true;
                break;
            end
        end
        if false == findFlag then
            table.insert(m_careerDatas, ntf.activatedNode);
        end
    else
        for i, data in pairs(m_roleDatas) do
            if ntf.activatedNode.ID == data.ID then
                m_roleDatas[i] = ntf.activatedNode;
                findFlag = true;
                break;
            end
        end
        if false == findFlag then
            table.insert(m_roleDatas, ntf.activatedNode);
        end
    end
    ItemControl.PushGroupItemData(ntf.cost, ItemControl.PushEnum.consume);
    TaskControl.ChangeStatistics(ntf.day, ntf.week, ntf.month, ntf.glory);
    Event.Go("BlueprintChange");
end

function BlueprintViewModel.GetCareerPoint(career)
    local ret = 0;
    if nil == m_careerDatas then
        return ret;
    end
    for _, data in pairs(m_careerDatas) do
        if career == data.ID then
            for _, node in pairs(data.ActivatedNode) do
                ret = ret + node.level;
            end
            break;
        end
    end
    return ret;
end

function BlueprintViewModel.GetRolePoint(id)
    local ret = 0;
    if nil == m_roleDatas then
        return ret;
    end
    for _, data in pairs(m_roleDatas) do
        if id == data.ID then
            for _, node in pairs(data.ActivatedNode) do
                ret = ret + node.level;
            end
            break;
        end
    end
    return ret;
end

function BlueprintViewModel.SetCurType(type)
    m_curType = type;
end

function BlueprintViewModel.CurType()
    return m_curType;
end

function BlueprintViewModel.SetCurCareer(career)
    m_curCareer = career;
end

function BlueprintViewModel.CurCareer()
    return m_curCareer;
end

function BlueprintViewModel.SetCurRoleId(id)
    m_curRoleId = id;
end

function BlueprintViewModel.CurRoleId()
    return m_curRoleId;
end

function GetCareerConf(career, order)
    for _, info in pairs(CareerBlueprintLocalData.tab) do
        if career == info.type and order == info.order then
            return info;
        end
    end
    return nil;
end

function GetRoleConf(id, order)
    if nil == RoleattributeLocalData.tab[id] then
        return nil;
    end
    for _, info in pairs(DriverBlueprintLocalData.tab) do
        if RoleattributeLocalData.tab[id][88] == info.group and order == info.order then
            return info;
        end
    end
    return nil;
end

function BlueprintViewModel.GetConfByOrder(order)
    if 1 == m_curType then
        return GetCareerConf(m_curCareer, order);
    elseif 2 == m_curType then
        return GetRoleConf(m_curRoleId, order);
    end
end

function GetCareerData(career, order)
    if nil == m_careerDatas then
        return nil;
    end
    for _, data in pairs(m_careerDatas) do
        if career == data.ID then
            for _, node in pairs(data.ActivatedNode) do
                if order == node.order then
                    return node;
                end
            end
            break;
        end
    end
    return nil;
end

function GetRoleData(id, order)
    if nil == m_roleDatas then
        return nil;
    end
    for _, data in pairs(m_roleDatas) do
        if id == data.ID then
            for _, node in pairs(data.ActivatedNode) do
                if order == node.order then
                    return node;
                end
            end
            break;
        end
    end
    return nil;
end

function BlueprintViewModel.GetDataByOrder(order)
    if 1 == m_curType then
        return GetCareerData(m_curCareer, order);
    elseif 2 == m_curType then
        return GetRoleData(m_curRoleId, order);
    end
end

function BlueprintViewModel.GetDataByID(id)
    local conf = nil;
    if 1 == m_curType then
        conf = CareerBlueprintLocalData.tab[id];
    elseif 2 == m_curType then
        conf = DriverBlueprintLocalData.tab[id];
    end
    if nil == conf then
        return nil;
    end
    return BlueprintViewModel.GetDataByOrder(conf.order);
end

function BlueprintViewModel.CanActive(conf)
    if 0 == conf.front then
        return true;
    end
    local frontData = BlueprintViewModel.GetDataByID(conf.front);
    if nil ~= frontData and frontData.level >= conf.frontlevel then
        return true;
    end
    return false;
end

function BlueprintViewModel.OpenBlueprint()
    if true == m_dataInit then
        MgrUI.GoHide(UID.Blueprint_UI);
        return;
    end
    BlueprintViewModel.SendGetBluePrintReq(function()
        MgrUI.GoHide(UID.Blueprint_UI);
    end);
end

function GetTotalPropsImp(confType, datas, curID, props)
    if nil == props then
        props = {};
    end
    for _, data in pairs(datas) do
        if curID == data.ID then
            for _, node in pairs(data.ActivatedNode) do
                if node.level > 0 then
                    local conf = nil;
                    if 1 == confType then
                        conf = GetCareerConf(curID, node.order);
                    else
                        conf = GetRoleConf(curID, node.order);
                    end
                    local propConfs = string.split(conf.status, ";");
                    local info = string.split(propConfs[node.level], "_");
                    local type = tonumber(info[1]);
                    if nil == props[type] then
                        props[type] = 0;
                    end
                    props[type] = props[type] + tonumber(info[2]);
                end
            end
            break;
        end
    end
    return props;
end

function IsBaseProp(type)
    return type <= 8;
end

-- key 对应的是蓝图表配置的属性类型
local exFomats = {
    [9] = { 1, "", },
    [10] = { 0.01, "%", },
    [11] = { 0.01, "%", },
    [12] = { 0.01, "%", },
    [13] = { 0.01, "%", },
    [14] = { 0.01, "%", },
    [15] = { 0.01, "%", },
    [16] = { 0.01, "%", },
    [17] = { 0.01, "%", },
    [18] = { 0.01, "%", },
    [19] = { 0.01, "%", },
    [20] = { 0.01, "%", },
    [21] = { 0.01, "%", },
    [22] = { 0.01, "%", },
    [23] = { 0.01, "%", },
    [24] = { 0.01, "%", },
    [25] = { 0.01, "%", },
    [26] = { 0.01, "%", },
    [27] = { 0.01, "%", },
    [28] = { 0.01, "%", },
    [29] = { 0.01, "%", },
    [30] = { 0.01, "%", },
    [31] = { 0.01, "%", },
    [32] = { 0.01, "%", },
    [34] = { 0.01, "%", },
    [36] = { 0.01, "%", },
    [38] = { 0.01, "%", },
    [40] = { 0.01, "%", },
    [41] = { 0.01, "%", }, -- 真伤抵抗
}

-- key 对应的是实际战斗数据中的属性类型
local InBattle2Ex = {
    [18] = 11,
    [19] = 10,
    [20] = 13,
    [21] = 14,
    [22] = 17,
    [23] = 20,
    [24] = 24,
    [25] = 21,
    [26] = 25,
    [27] = 22,
    [28] = 26,
    [29] = 23,
    [30] = 27,
    [31] = 28,
    [32] = 29,
    [33] = 30,
    [34] = 31,
    [35] = 32,
    [36] = 34,
    [37] = 36,
    [38] = 38,
    [39] = 40,
    [40] = 41, -- 真伤抵抗
}

function BlueprintViewModel.GetTotalProps()
    local props = {};
    if 1 == m_curType then
        props = GetTotalPropsImp(1, m_careerDatas, m_curCareer);
    else
        props = GetTotalPropsImp(2, m_roleDatas, m_curRoleId);
    end
    local ret = {};
    table.insert(ret, {
        type = 1,
        name = MgrLanguageData.GetLanguageByKey("ui_character_detail_text1"),
    });
    local showBg = true;
    local baseFomats = {
        [0] = { 1, "", },
        [1] = { 0.01, "%", },
        [2] = { 1, "", },
        [3] = { 0.01, "%", },
        [4] = { 0.01, "%", },
        [5] = { 0.01, "%", },
        [6] = { 0.01, "%", },
        [7] = { 0.01, "%", },
        [8] = { 0.01, "%", },
    }
    for propType, propValue in pairs(props) do
        if IsBaseProp(propType) then
            local format = baseFomats[propType];
            local realValue = propValue .. format[2];
            if 1 ~= format[1] then
                realValue = math.floor(propValue * format[1] * 100) / 100 .. format[2];
            end
            table.insert(ret, {
                type = 2,
                propType = propType,
                propValue = realValue,
                showBg = showBg,
            });
            showBg = not showBg;
        end
    end
    table.insert(ret, {
        type = 3,
    });
    table.insert(ret, {
        type = 1,
        name = MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_13"),
    });
    showBg = true;
    for propType, propValue in pairs(props) do
        if not IsBaseProp(propType) then
            local format = exFomats[propType];
            local realValue = propValue .. format[2];
            if 1 ~= format[1] then
                realValue = math.floor(propValue * format[1] * 100) / 100 .. format[2];
            end
            table.insert(ret, {
                type = 2,
                propType = propType,
                propValue = realValue;
                showBg = showBg,
            });
            showBg = not showBg;
        end
    end
    return ret;
end

function BlueprintViewModel.AddBlueprintBaseProps(battleRole)
    local props = GetTotalPropsImp(1, m_careerDatas, tonumber(battleRole.New_Career));
    props = GetTotalPropsImp(2, m_roleDatas, tonumber(battleRole.ID), props);
    for propType, propValue in pairs(props) do
        if IsBaseProp(propType) then
            local realValue = propValue;
            if 0 == propType or 2 == propType then
            else
                realValue = realValue * 0.01;
            end
            ReadData.SetAdd_Abt(battleRole, propType, realValue);
        elseif 9 == propType then
            ReadData.SetAdd_Abt(battleRole, 9, propValue);
        elseif 18 == propType then
            ReadData.SetAdd_Abt(battleRole, 6, propValue * 0.01);
        end
    end
end

function BlueprintViewModel.CalcHeroProps(battleRole)
    local props = GetTotalPropsImp(1, m_careerDatas, tonumber(battleRole.New_Career));
    props = GetTotalPropsImp(2, m_roleDatas, tonumber(battleRole.ID), props);
    local ret = {};
    local showBg = true;
    table.insert(ret, {
        type = 2,
        propType = 2,
        propValue = math.floor(battleRole.HPmax) .. "",
        showBg = showBg,
    });
    showBg = not showBg;
    if battleRole.RealAtk > 0 then
        table.insert(ret, {
            type = 2,
            propType = 0,
            propValue = math.floor(battleRole.RealAtk) .. "",
            showBg = showBg,
        });
    else
        table.insert(ret, {
            type = 2,
            propType = 8,
            propValue = math.floor(battleRole.RealSuppart) .. "",
            showBg = showBg,
        });
    end
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 4,
        propValue = math.floor(battleRole.RealDef * 100) .. "%",
        showBg = showBg,
    });
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 5,
        propValue = math.floor(battleRole.RealCrit * 100) .. "%",
        showBg = showBg,
    });
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 6,
        propValue = math.floor(battleRole.RealCritDmg * 100) .. "%",
        showBg = showBg,
    });
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 7,
        propValue = math.floor(battleRole.RealAgile * 100) .. "%",
        showBg = showBg,
    });
    showBg = not showBg;
    for propType, propValue in pairs(props) do
        if not IsBaseProp(propType) then
            local format = exFomats[propType];
            local realValue = propValue .. format[2];
            if 1 ~= format[1] then
                realValue = math.floor(propValue * format[1] * 100) / 100 .. format[2];
            end
            table.insert(ret, {
                type = 2,
                propType = propType,
                propValue = realValue;
                showBg = showBg,
            });
            showBg = not showBg;
        end
    end
    return ret;
end

function BlueprintViewModel.CalcInBattleProps(roleBattleData)
    local ret = {};
    local showBg = true;
    table.insert(ret, {
        type = 2,
        propType = 2,
        propValue = math.floor(roleBattleData.maxHp) .. "",
        showBg = showBg,
    });
    showBg = not showBg;
    if roleBattleData.atk > 0 then
        table.insert(ret, {
            type = 2,
            propType = 0,
            propValue = math.floor(roleBattleData.atk) .. "",
            showBg = showBg,
        });
    else
        table.insert(ret, {
            type = 2,
            propType = 8,
            propValue = math.floor(roleBattleData.support) .. "",
            showBg = showBg,
        });
    end
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 4,
        propValue = math.floor(roleBattleData.def) / 100 .. "%",
        showBg = showBg,
    });
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 5,
        propValue = math.floor(roleBattleData.crit) / 100 .. "%",
        showBg = showBg,
    });
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 6,
        propValue = math.floor(roleBattleData.cDamage) / 100 .. "%",
        showBg = showBg,
    });
    showBg = not showBg;
    table.insert(ret, {
        type = 2,
        propType = 7,
        propValue = math.floor(roleBattleData.agi) / 100 .. "%",
        showBg = showBg,
    });
    for propType, propValue in pairs(roleBattleData.exProps) do
        local realType = InBattle2Ex[propType];
        if nil ~= realType then
            local format = exFomats[realType];
            local realValue = propValue .. format[2];
            if 1 ~= format[1] then
                realValue = math.floor(propValue * format[1] * 100) / 100 .. format[2];
            end
            table.insert(ret, {
                type = 2,
                propType = realType,
                propValue = realValue;
                showBg = showBg,
            });
            showBg = not showBg;
        end
    end
    return ret;
end

function BlueprintViewModel.RoleHasBlueprint(id)
    if nil == RoleattributeLocalData.tab[id] then
        return false;
    end
    for _, info in pairs(DriverBlueprintLocalData.tab) do
        if RoleattributeLocalData.tab[id][88] == info.group then
            return true;
        end
    end
    return false;
end

function BlueprintViewModel.GetRoles(filters, sort, rise)
    local roles = RoleCardViewModel.GetRoleData(filters, sort, rise);
    local ret = {};
    for _, role in pairs(roles) do
        if BlueprintViewModel.RoleHasBlueprint(role.id) then
            table.insert(ret, role);
        end
    end
    return ret;
end

local m_weekRaidNum = 0;
function BlueprintViewModel.SetWeekRaidNum(num)
    if nil ~= num then
        m_weekRaidNum = num;
    end
end

function BlueprintViewModel.WeekRaidNum()
    return m_weekRaidNum;
end

function BlueprintViewModel.WeekRaidTotal()
    return tonumber(SteamLocalData.tab[125001][2]);
end
---@return CareerBlueprintSkillLocalData[] 获取技能
function BlueprintViewModel.GetBlueSkillByType(_type)
    return m_careerSkill[_type]
end
---获取技能等级
function BlueprintViewModel.GetBlueSkillLv(_type,_order)
    local tSkillLvData = m_careerSkillLv[_type]
    if tSkillLvData then
        for i, v in ipairs(tSkillLvData) do
            if v.order == _order then
                return v.level
            end
        end
    end
    return 0
end
---蓝图技能升级
function BlueprintViewModel.SendUpgradeBluePrintSkillReq(_nodeID,_toLevel,_targetID,callback)
    -- 升级请求
    local targetID = _targetID==nil and 0 or _targetID
    local bytes = assert(pb.encode('PBClient.ClientUpgradeBluePrintSkillReq', {
        nodeID = _nodeID,
        toLevel = _toLevel;
        targetID = targetID;
    }))
    MgrNet.SendReq(MID.CLIENT_UPGRADE_BLUE_PRINT_SKILL_REQ, bytes,0,nil,function()  end, function(buffer, tag)
        local ntf = assert(pb.decode('PBClient.ClientUpgradeBluePrintSkillNtf', buffer))
        ItemControl.PushGroupItemData(ntf.cost, ItemControl.PushEnum.consume)

        -- 技能数据
        m_careerSkillLv[ntf.activatedNode.ID] = ntf.activatedNode.ActivatedSkill
       
        if nil ~= callback then
            callback(ntf.activatedNode)
        end
        ---更新数据统计
        TaskControl.ChangeStatistics(ntf.day, ntf.week, ntf.month, ntf.glory)
    end)
end

return BlueprintViewModel