BattleLogger = {}

BattleLogger.logFlag = false;
BattleLogger.logAllFlag = false;
BattleLogger.allContent = "";
BattleLogger.turns = {};

function BattleLogger.log(record)
    if false == BattleLogger.logFlag then
        return; 
    end
    BattleLogger.allContent = "";
    BattleLogger.turns = {};
    BattleLogger.logOverall(record);
    if false == BattleLogger.check(record.videos) then
        BattleLogger.close();
        return;
    end
    BattleLogger.logBattleStart();
    for round, roundData in ipairs(BattleLogger.turns) do
        BattleLogger.logRound(roundData);
    end
    BattleLogger.close();
end

function BattleLogger.close()
    BattleLogger.logPart("--------End")
    BattleLogger.logAll();
    BattleLogger.allContent = "";
    BattleLogger.turns = {};
end

function BattleLogger.logOverall(record)
    local content = "--------Start. Winner: ";
    --- 胜负
    if true == record.leftWin then
        content = content .. "left.\n";
    else
        content = content .. "right.\n";
    end
    --- 角色
    local left = "Left fighters: ";
    local right = "Right fighters: ";
    for i, fighter in ipairs(record.fighters) do
        if true == fighter.isLeft then
            left = left .. fighter.uID .. "," .. fighter.cfgID .. "; ";
        else
            right = right .. fighter.uID .. "," .. fighter.cfgID .. "; ";
        end
    end
    content = content .. left .. "\n" .. right .. "\n";
    --- 行动顺序
    if nil ~= record.atkOrders then
        content = content .. "Totally " .. #record.atkOrders .. " rounds.\n";
        for i, roundOrder in pairs(record.atkOrders) do
            local order = "Round " .. roundOrder.round .. " order: ";
            for j, orderNum in pairs(roundOrder.atkOrder) do
                order = order .. orderNum .. ", ";
            end
            content = content .. order .. "\n";
        end
    end
    BattleLogger.logPart(content);
end

function BattleLogger.check(videos)
    ---打印round和turn
    local curRound = -1;
    local roundTxt = "";
    for i, video in ipairs(videos) do
        if BattleLogger.turns[video.round] == nil then
            BattleLogger.turns[video.round] = {}
        end
        if curRound ~= video.round then
            if -1 ~= curRound then
                roundTxt = roundTxt .. "\n";
            end
            curRound = video.round;
            roundTxt = roundTxt .. "Round " .. video.round .. " turns: ";
        end
        BattleLogger.turns[video.round][video.turn] = video;
        roundTxt = roundTxt .. video.turn .. ",";
    end
    BattleLogger.logPart(roundTxt .. "\n");
    ---检查round和turn是否连续
    curRound = 1;
    for round, roundData in pairs(BattleLogger.turns) do
        if 0 ~= round and curRound ~= round then
            BattleLogger.logPart("Round not continuous at round: " .. round);
            return false;
        end
        local curTurn = 1;
        for turn, turnData in pairs(roundData) do
            if 0 ~= turn and curTurn ~= turn then
                BattleLogger.logPart("Turn not continuous at round: " .. round .. ", turn: " .. turn);
                return false;
            end
            curTurn = curTurn + 1;
        end
        curRound = curRound + 1;
    end
    return true;
end

function BattleLogger.logBattleStart()
    if nil == BattleLogger.turns[0] or nil == BattleLogger.turns[0][0] then
        return;
    end
    ---[0][0]是整场战斗开始的特殊部分
    BattleLogger.logTurn(BattleLogger.turns[0][0]);
end

function BattleLogger.logRound(roundData)
    if nil ~= roundData[0] then
        ---[0]是round开始的特殊部分
        BattleLogger.logTurn(roundData[0]);
    end
    for turn, turnData in ipairs(roundData) do
        BattleLogger.logTurn(turnData);
    end
end

function BattleLogger.logTurn(turnData)
    local content = "------Round: " .. turnData.round .. ", Turn: " .. turnData.turn .. "\n";
    if nil == turnData.actions then
        content = content .. "No actions.\n";
    else
        --- actions
        for i, action in ipairs(turnData.actions) do
            content = content .. i .. ". Action type: " .. action.checkPt .. "\n";
            if nil == action.skills then
                content = content .. i .. ".0. No skills.\n";
            else
                --- skills
                for j, skill in ipairs(action.skills) do
                    content = content .. i .. "." .. j .. ". Skill: " .. skill.atk .. " -> " .. skill.def .. ", id: " .. skill.skillID .. "\n";
                    if nil == skill.changes then
                        content = content .. i .. "." .. j .. ".0. No changes.\n";
                    else
                        --- changes
                        for k, change in ipairs(skill.changes) do
                            content = content .. i .. "." .. j .. "." .. k .. ". Change uID: " .. change.uID .. "\n";
                            --- buffs
                            if nil ~= change.buffs then
                                for l, buff in ipairs(change.buffs) do
                                    content = content .. i .. "." .. j .. "." .. k .. "." .. l .. ". Buff id: " .. buff.buffID .. ", skill: " .. buff.skillID .. "\n";
                                end
                            end
                            --- damage
                            if nil ~= change.damage then
                                for l, damage in ipairs(change.damage) do
                                    content = content .. i .. "." .. j .. "." .. k .. "." .. l .. ". Damage: " .. damage .. "\n";
                                end
                            end
                        end
                        --- changes end
                    end
                end
                --- skills end
            end
        end
        --- actions end
    end
    BattleLogger.logPart(content);
end

function BattleLogger.logPart(content)
    print("BattleLog: " .. content);
    BattleLogger.allContent = BattleLogger.allContent .. content;
end

function BattleLogger.logAll()
    if true == BattleLogger.logAllFlag then
        print("BattleLog: " .. BattleLogger.allContent);
    end
end

return BattleLogger