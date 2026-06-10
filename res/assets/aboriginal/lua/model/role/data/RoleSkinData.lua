---@class RoleSkinData 角色数据
RoleSkinData = Class("RoleSkinData")

function RoleSkinData:ctor(id)
    local config = RoleuiskinLocalData.tab[id]
    local config2 = UiskinlockLocalData.tab[id]
    local backGroundConfig = MainuiskinLocalData.tab[id]
    local roleCfg = RoleattributeLocalData.tab[config2.roleid]
    self.id = config.id                             ---皮肤ID
    self.type = config.type                         ---前景类型
    self.skinName = config.name                     ---皮肤名称
    self.story = config.story                       ---皮肤故事
    self.backgroundpic = config.backgroundpic       ---皮肤背景
    self.foregroundpic = config.foregroundpic       ---皮肤前景
    self.cv = config.voiceexcellence                ---CV
    if backGroundConfig then
        self.morning = backGroundConfig.morning
        self.evening = backGroundConfig.evening
    else
        self.morning = nil
        self.evening = nil
    end
    self.roleId = config2.roleid
    self.unlockState = false
    self.interaction = config.interaction
    self.unlock = self:SplitLadder_One(config2.unlock)
    self.ClickArea = {}
    self.HaveClickArea = false
    if CharactercoordinatesLocalData.tab[id] ~= nil and CharactercoordinatesLocalData.tab[id].coordinate12 ~= "0" and CharactercoordinatesLocalData.tab[id].coordinate12 ~= nil then
        self.HaveClickArea = true
        local area = string.split(CharactercoordinatesLocalData.tab[id].coordinate12,";")
        for i,v in pairs(area) do
            local idx,c = string.split(v,"_")[1],string.split(v,"_")[2]
            self.ClickArea[tonumber(idx)] = {
                x = string.split(c,",")[1],
                y = string.split(c,",")[2],
                width = string.split(c,",")[3],
                height = string.split(c,",")[4]
            }
        end
    end
    self.shopTag = config.shoptag == "0" and {} or string.split(config.shoptag,";")
    ---是否启用多状态切换
    self.newSwitch = config.ismorestate == 1
    self.shopAni = nil
    if config.shopanim ~= "0" then
        self.shopAni = {}
        local tStr = string.split(config.shopanim,';')
        for i, v in ipairs(tStr) do
            local tAniList = string.split(v,',')
            table.insert(self.shopAni,{ 
                touchAni = tAniList[1]~="0" and tAniList[1] or nil,
                switchAni = tAniList[2]~="0" and tAniList[2] or nil,
                voiceId = tonumber(tAniList[3])
            })
        end
    end
    self.isRotate = config.isdrag==1
    --跳转获取
    self.link = config.jumpto ~= "0" and config.jumpto or nil
    self.bgm = config.bgm~="0" and config.bgm or nil
    self.skinType = config2.type
    self.oldSwitch = config.switch
    if roleCfg then
        self.roleName = roleCfg[2]
        self.iconFrame = "Quality/RoleRank_"..roleCfg[6]
        self.New_Career = tonumber(roleCfg[3])                                         ---暂时只用来判断觉醒消耗
    end
end

function RoleSkinData:SplitLadder_One(str)
    if str == nil or str == "" then
        return {}
    end
    if str == "0" then
        self:SetLockState(true)
        return {}
    end
    local gs = string.split(str, "_")
    ---@type goods
    local goods = {}
    goods.goodsType = tonumber(gs[1])
    goods.goodsID = tonumber(gs[2])
    goods.goodsNum = tonumber(gs[3])
    return goods
end

function RoleSkinData:SetLockState(state)
    self.unlockState = state
end


return RoleSkinData