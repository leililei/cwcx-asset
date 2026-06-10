---
------------任务VM------------
---待优化及业务逻辑整合
PlayerAvatarViewModel = {}

---@type RoleData[] 所有角色
PlayerAvatarViewModel.AllHeroCacheData = {}
---@type RoleData[] 已有角色
PlayerAvatarViewModel.HasHeroCacheData = {}
---@type PlayerData 当前玩家
PlayerAvatarViewModel.CurPlayer = nil
---当前玩家勋章
PlayerAvatarViewModel.PlayerBadgeList = {}
---所有勋章
PlayerAvatarViewModel.AllBadgeCacheData = {}
---小天梯数据
PlayerAvatarViewModel.SmallHighLadderData = {}
---大天梯数据
PlayerAvatarViewModel.BigHighLadderData = {}
---小天梯阵容数据
PlayerAvatarViewModel.SmallTeamData = {}
---大天梯阵容数据
PlayerAvatarViewModel.BigTeamData = {}
---当前玩家的支援角色数据
PlayerAvatarViewModel.PlayerSupportData = {}
---------------------初始化-----------------------
function PlayerAvatarViewModel.Init()
    PlayerAvatarViewModel.ReloadCacheData()
end
---获取缓存
function PlayerAvatarViewModel.ReloadCacheData()
    PlayerAvatarViewModel.AllHeroCacheData = HeroControl.GetAllHero()
    PlayerAvatarViewModel.HasHeroCacheData = HeroControl.GetHaveHero()
    PlayerAvatarViewModel.CurPlayer = PlayerControl.GetPlayerData()
    PlayerAvatarViewModel.PlayerBadgeList = PlayerAvatarViewModel.GetBadgeList()
    PlayerAvatarViewModel.AllBadgeCacheData = ItemControl.GetHideDataList()
    PlayerAvatarViewModel.GetTeamData()
    PlayerAvatarViewModel.GetHighLadder(function ()
        PlayerAvatarViewModel.OpenUI()
    end)
end

---获取角色数据缓存
function PlayerAvatarViewModel.GetRoleData(sort,rise)
    local array = table.DeepCopy(PlayerAvatarViewModel.HasHeroCacheData)
    ---获取看板娘数据
    local PosterGirlArray = PosterGirlControl.GetAllPosterGirl()
    ---看板娘加入队列
    for i,v in pairs(PosterGirlArray) do
        table.insert(array,v)
    end
    --local jiyadata=  RoleData.New(19000)
    --jiyadata.rank=5
    --jiyadata.cTime=-1
    --table.insert(array,jiyadata)
    ---排序(1稀有度,2取得时间)
    --local sortGroupArr = {
    --    [1] = {"rank","cTime"},
    --    [2] = {"cTime","rank"}
    --}
    ---排序(1稀有度,2取得时间)
    local sortGroupArr = {
        [1] = {"rank","cTime"},
        [2] = {"cTime","rank"}
    }
    Global.Sort(array,sortGroupArr[sort],rise)
    return array
end
---获取玩家身上勋章
function PlayerAvatarViewModel.GetBadgeList()
    local array = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0
    }
    local badgeStr = PlayerAvatarViewModel.CurPlayer.title
    if badgeStr == "" then
        return array
    else
        local t = JNStrTool.strSplit(",",badgeStr)
        for i, v in ipairs(t) do
            array[i] = tonumber(v)
        end
    end
    return array
end

--获得勋章数据通过id
function PlayerAvatarViewModel.GetBadgeDataById(_id)
    local datas = PlayerAvatarViewModel.AllBadgeCacheData
    for index, value in ipairs(datas) do
        if value.id == _id then
            return value
        end
    end
    return nil
end

---判断勋章是否装备
function PlayerAvatarViewModel.CheckBadgeEquip(id)
    for i, v in ipairs(PlayerAvatarViewModel.PlayerBadgeList) do
        if v == id then
            return true,i
        end
    end
    return false
end
---修改昵称请求
function PlayerAvatarViewModel.ChooseNickNameClick(nickname,funcACK,funcNTF,isNovice)
    local NickNameREQ  =
    {
        nike = nickname
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientChooseNikeREQ',NickNameREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_CHOOSE_NIKE_REQ,bytes,isNovice and 1 or 0,nil,funcACK,funcNTF)
end

---修改面板娘请求
function PlayerAvatarViewModel.ChooseMenuRoleClick(roleID,funcACK,funcNTF)
    local MenuRoleREQ  =
    {
        roleID = roleID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientChooseMenuRoleREQ',MenuRoleREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_CHOOSE_MENU_ROLE_REQ,bytes,0,nil,funcACK,funcNTF)
end

---修改签名请求
function PlayerAvatarViewModel.ChooseSignClick(signature,funcACK,funcNTF)
    local SignREQ  =
    {
        signature = signature
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSetSignatureREQ',SignREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SET_SIGNATURE_REQ,bytes,0,nil,funcACK,funcNTF)
end

---修改生日请求
function PlayerAvatarViewModel.ChooseBirthdayClick(Birthday,funcACK,funcNTF)
    local BirthdayREQ  =
    {
        Birthday = Birthday
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientChangeBirthdayREQ',BirthdayREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_CHANGE_BIRTHDAY_REQ,bytes,0,nil,funcACK,funcNTF)
end

---修改头像请求
function PlayerAvatarViewModel.ChooseHeadClick(headID,funcACK,funcNTF)
    local HeadREQ  =
    {
        headID = headID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSetHeadREQ',HeadREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SET_HEAD_REQ,bytes,0,nil,funcACK,funcNTF)
end

---修改头像框请求
function PlayerAvatarViewModel.ChooseHeadFrameClick(headFrameID,funcACK,funcNTF)
    local HeadFrameREQ  =
    {
        headFrameID = headFrameID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSetHeadFrameREQ',HeadFrameREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SET_HEAD_FRAME_REQ,bytes,0,nil,funcACK,funcNTF)
end


---修改头像请求
function PlayerAvatarViewModel.ChooseBadgeClick(strBadge,funcACK,funcNTF)
    local BadgeREQ  =
    {
        titleID = strBadge
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSetTitleREQ',BadgeREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SET_TITLE_REQ,bytes,0,nil,funcACK,funcNTF)
end


---获取天梯数据返回
function PlayerAvatarViewModel.GetHighLadderACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetHighLadderBaseACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatarviewmodel_tips1"),2},true)
    end
end
function PlayerAvatarViewModel.GetHighLadderNTF(buffer, tag,callBack)
    local tab = assert(pb.decode('PBClient.ClientGetHighLadderBaseNTF',buffer))
    PlayerAvatarViewModel.SmallHighLadderData = tab.small
    PlayerAvatarViewModel.BigHighLadderData = tab.big
    if callBack then
        callBack()
    end
    print("??????")
end
---获取天梯数据请求
function PlayerAvatarViewModel.GetHighLadder(callBack)
    local BaseREQ  =
    {
        titleID = "1"
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetHighLadderBaseREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_HIGH_LADDER_BASE_REQ,bytes,0,nil, PlayerAvatarViewModel.GetHighLadderACK,function (...)
        PlayerAvatarViewModel.GetHighLadderNTF(...,nil,callBack)
    end)
end

---获取阵容数据请求
function PlayerAvatarViewModel.GetTeamData()
    ---小天梯阵容数据
    if next(TeamControl.GetTeamData(10000).info) ~= nil then
        PlayerAvatarViewModel.SmallTeamData = TeamControl.GetTeamData(10000)
    end
    ---大天梯阵容数据
    if next(TeamControl.GetTeamData(10001).info) ~= nil then
        PlayerAvatarViewModel.BigTeamData = TeamControl.GetTeamData(10001)
    end
end
---获取玩家支援角色数据返回
function PlayerAvatarViewModel.GetSupportDataACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportGetACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips1"),2},true)
    end
end
function PlayerAvatarViewModel.GetSupportDataNTF(buffer, tag,callBack)
    local tab = assert(pb.decode('PBClient.ClientFriendSupportGetNTF',buffer))
    if tab.supports then
        PlayerAvatarViewModel.PlayerSupportData = tab.supports
    end
    if callBack then
        callBack()
    end
end
---获取玩家支援角色数据请求
function PlayerAvatarViewModel.GetSupportData(callBack)
    local BaseREQ = {
        rev = "1"
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendSupportGetREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_SUPPORT_GET_REQ,bytes,0,nil, PlayerAvatarViewModel.GetSupportDataACK,function(...)
        PlayerAvatarViewModel.GetSupportDataNTF(...,nil,callBack)
    end)
end
function PlayerAvatarViewModel.GetSupportDataOnUpdate(funcACK,funcNTF)
    local BaseREQ = {
        rev = "1"
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendSupportGetREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_SUPPORT_GET_REQ,bytes,0,nil,funcACK,funcNTF)
end

---更换支援角色阵容请求
function PlayerAvatarViewModel.ChangeSupportData(RoleID,RoleSlot,funcACK,funcNTF)
    local BaseREQ =
    {
        supports = {
            {
                roleID = RoleID,
                slot = RoleSlot,
            },
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendSupportChangeREQ',BaseREQ))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_SUPPORT_CHANGE_REQ,bytes,0,nil, funcACK,funcNTF)
end

---收取友情币请求
function PlayerAvatarViewModel.ReapCoin(RoleSlot,funcACK,funcNTF)
    local BaseREQ = {
        slot = RoleSlot,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendSupportReapREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_SUPPORT_REAP_REQ,bytes,0,nil, funcACK,funcNTF)
end

---------------------UI跳转------------------------
function PlayerAvatarViewModel.OpenUI()
    MgrUI.GoHide(UID.PlayerAvatar_UI)
end

function PlayerAvatarViewModel.Clear()
    PlayerAvatarViewModel.AllHeroCacheData = {}
    PlayerAvatarViewModel.HasHeroCacheData = {}
    PlayerAvatarViewModel.CurPlayer = nil
    PlayerAvatarViewModel.PlayerBadgeList = {}
    PlayerAvatarViewModel.AllBadgeCacheData = {}
    PlayerAvatarViewModel.SmallHighLadderData = {}
    PlayerAvatarViewModel.BigHighLadderData = {}
    PlayerAvatarViewModel.SmallTeamData = {}
    PlayerAvatarViewModel.BigTeamData = {}
    PlayerAvatarViewModel.PlayerSupportData = {}
end

return PlayerAvatarViewModel