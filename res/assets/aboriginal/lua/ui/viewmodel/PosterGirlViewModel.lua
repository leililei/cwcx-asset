require("LocalData/ActorLinesLocalData")
require("LocalData/VoiceChoseLocalData")
---看板娘VM
PosterGirlViewModel = {}

------------------------------角色立绘---------------------------------
PosterGirlViewModel.CurSpineObj=nil          ---立绘对象
PosterGirlViewModel.CurFrontSpineObj = nil   ---前景spine
PosterGirlViewModel.CurBgSpineObj = nil      ---背景spine

-----------------------------角色语音----------------------------------
PosterGirlViewModel.Tab_MainSceneRoleVoiceData={}  ---存储主界面角色随机语音信息表
PosterGirlViewModel.RoleVoiceWordText={} ---当前角色台词文本Obj
PosterGirlViewModel.IsVoiceEnd = true
PosterGirlViewModel.VoiceObj = nil
PosterGirlViewModel.VoiceIcon = nil
PosterGirlViewModel.isRoleVoice = true
---语音是否可以停止
PosterGirlViewModel.CanStop = true
---台词类型
PosterGirlViewModel.WordsType = {
    LvUp = 1,       --等级提升
    StarUp = 2,     --星级提升
    Awaken = 3,     --觉醒
    SkillUp = 4,    --技能提升
}
---spine类型
PosterGirlViewModel.spineType = {
    front = 1,   --前景
    role = 2,    --角色
    bottom = 3,  --后景
}

PosterGirlViewModel.ClothesType = {
    wear = 1,       --穿上
    undress = 2,    --脱下
}

---当前衣服状态
PosterGirlViewModel.CurClothes = nil

PosterGirlViewModel.VoiceCache = {}

--------------------------立绘------------------------------

--- 向一个立绘展示框中初始化一个人物立绘信息
function PosterGirlViewModel.GetRoleSpineToBox(_Root,type)
    local _RoleId = PlayerControl.GetPlayerData().HomeRole
    local _skin = HeroControl.GetSkinDataBySkinId(_RoleId)
    --判断是否启用多状态切换
    if _skin and _skin.newSwitch then
        --初始化皮肤功能需求
        SkinControl.InitSpineState(true,true,SkinControl.UIType.home,_skin.id)
        ---创建皮肤
        SkinControl.CreateRoleSpine(_Root,type)
        PosterGirlViewModel.ClearSpine()
        return
    end
    --清理旧spine
    SkinControl.ClearSpine()
    local posInfo
    if type == PosterGirlViewModel.spineType.role then  --角色spine
        --if _RoleId >= 90000 then
        --    posInfo = PosterGirlControl.PosterGirlDataByID(_RoleId).coordinate0
        --else
            posInfo = CharactercoordinatesLocalData.tab[_RoleId].coordinate0
        --end
        local _info1 = string.split(posInfo,";")
        local _info2 = string.split(_info1[1],",")
        local x = tonumber(_info2[1])
        local y = tonumber(_info2[2])
        local scale = tonumber(_info1[2])
        ---清理旧spine
        if PosterGirlViewModel.CurSpineObj then
            GameObject.Destroy(PosterGirlViewModel.CurSpineObj)
        end
        --重置看板娘衣服状态
        if SettingViewModel.GetHoldSpine() then
            PosterGirlViewModel.CurClothes = UnityEngine.PlayerPrefs.GetInt(PlayerControl.GetPlayerData().UID.."_CurClothes_".._skin.id,1)
            if PosterGirlViewModel.CurClothes == 2 and _skin.oldSwitch == 0 then
                PosterGirlViewModel.CurClothes = 1
            end
        else
            PosterGirlViewModel.CurClothes = PosterGirlViewModel.ClothesType.wear
        end
        MgrRes.LoadWatch3DSpine(_Root,_RoleId,x,y,scale,nil,function(_ReturnObj)
            PosterGirlViewModel.CurSpineObj = _ReturnObj
            _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(-1,"Default")
            _ReturnObj.layer = 5
            local _CurRoleID = PlayerControl.GetPlayerData().HomeRole
            local _ActorLinesType
            --if _CurRoleID >= 90000 and _CurRoleID < 200000 then     ---看板娘
            --    _ActorLinesType = tonumber(Live2dLocalData.tab[_CurRoleID][3])
            --else
            local curRoleSkin = PlayerControl.GetPlayerData().HomeRole
            _ActorLinesType = tonumber(RoleuiskinLocalData.tab[curRoleSkin].interaction)
            --end
            local _FinalActorLineID = PosterGirlViewModel.GetPlayId(_ActorLinesType, 2)
            if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress then
                CMgrSpine.Instance:SetSpineAnimation(PosterGirlViewModel.CurSpineObj,"idle2",true)
                ---如果随机到主界面随机语音修改随机语音播放的动画
                if ActorLinesLocalData.tab[_FinalActorLineID][4] == 4 then
                    CMgrSpine.Instance:SetSpineAnimation(PosterGirlViewModel.CurSpineObj,"idle2",true)
                end
            else
                CMgrSpine.Instance:SetSpineAnimation(PosterGirlViewModel.CurSpineObj,"idle",true)
            end
            PosterGirlViewModel.InitMainSceneRoleRandVoiceData()
        end)
    elseif type == PosterGirlViewModel.spineType.bottom then  --背景spine
        if _skin.backgroundpic ~= "0" then
            ---清理旧背景spine
            if PosterGirlViewModel.CurBgSpineObj then
                GameObject.Destroy(PosterGirlViewModel.CurBgSpineObj)
            end
            --MgrRes.LoadSkinBG(_skin.backgroundpic,_Root,0,-1000)
            if string.find(_skin.backgroundpic,'Watch_3D_bg') then
                local coordinate = string.split(CharactercoordinatesLocalData.tab[_RoleId].coordinate8,";")
                local x = tonumber(string.split(coordinate[1],",")[1])
                local y = tonumber(string.split(coordinate[1],",")[2])
                local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
                MgrRes.LoadCgSpine(_Root, _RoleId,_skin.backgroundpic,x,y,scale,_skin.morning,function(_ReturnObj)
                    PosterGirlViewModel.CurBgSpineObj = _ReturnObj
                    _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(-2,"Default")
                    _ReturnObj.layer = 5
                end,true)
            else
                local coordinate = string.split(CharactercoordinatesLocalData.tab[_RoleId].coordinate8,";")
                local x = tonumber(string.split(coordinate[1],",")[1])
                local y = tonumber(string.split(coordinate[1],",")[2])
                local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
                MgrRes.LoadCgSpine(_Root, _RoleId,_skin.backgroundpic,x,y,scale,nil,function(_ReturnObj)
                    PosterGirlViewModel.CurBgSpineObj = _ReturnObj
                end,true)
            end
        else
            local posInfo = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].bgcoordinate
            local _info1 = string.split(posInfo,";")
            local _info2 = string.split(_info1[1],",")
            local path = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].backgroundpic
            local x = tonumber(_info2[1])
            local y = tonumber(_info2[2])
            local scale = tonumber(_info1[2])
            ---清理旧背景spine
            if PosterGirlViewModel.CurBgSpineObj then
                GameObject.Destroy(PosterGirlViewModel.CurBgSpineObj)
            end
            MgrRes.LoadCgSpine(_Root, _RoleId,path,x,y,scale,MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].morning,function(_ReturnObj)
                PosterGirlViewModel.CurBgSpineObj = _ReturnObj
            end,true)
        end
    elseif type == PosterGirlViewModel.spineType.front then   --前景spine
        if _skin.foregroundpic ~= "0" then
            ---清理旧前景spine
            if PosterGirlViewModel.CurFrontSpineObj then
                GameObject.Destroy(PosterGirlViewModel.CurFrontSpineObj)
            end
            local img = _Root.transform:GetComponent("Image")
            img.enabled = false
            local coordinate = string.split(CharactercoordinatesLocalData.tab[_RoleId].coordinate9,";")
            local x = tonumber(string.split(coordinate[1],",")[1])
            local y = tonumber(string.split(coordinate[1],",")[2])
            local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
            MgrRes.LoadSkinFrontBG(_skin.type,img,_skin.foregroundpic,_Root,x,y,scale,nil,function(_ReturnObj)
                _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(0,"Default")
                PosterGirlViewModel.CurFrontSpineObj = _ReturnObj
            end)
        else
            local posInfo = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].fgcoordinate
            local _info1 = string.split(posInfo,";")
            local _info2 = string.split(_info1[1],",")
            local path = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].foregroundpic
            local x = tonumber(_info2[1])
            local y = tonumber(_info2[2])
            local scale = tonumber(_info1[2])
            local Img = _Root.transform:GetComponent("Image")
            Img.enabled = false
            ---清理旧前景spine
            if PosterGirlViewModel.CurFrontSpineObj then
                GameObject.Destroy(PosterGirlViewModel.CurFrontSpineObj)
            end
            ---如果是图片
            if MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].type == 0 then
                if path ~= "0" and _skin.backgroundpic == "0" then
                    Img.enabled = true
                    MgrRes.LoadSprite(Img,path)
                else
                    Img.enabled = false
                end
            else
                Img.enabled = false
                if path ~= "0" then
                    MgrRes.LoadCgSpine(_Root, _RoleId,path,x,y,scale,MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].morning,function(_ReturnObj)
                        PosterGirlViewModel.CurFrontSpineObj = _ReturnObj
                    end,true)
                end
            end
        end
    end
end

function PosterGirlViewModel.CreatSpecialSpineToBox(root,type)
    local roleID = PlayerControl.GetPlayerData().curRoleID
    local _skin = HeroControl.GetSkinDataByRoleID(roleID)
    --local key = PlayerControl.GetPlayerData().UID.."LobbySpine"
    -----设置状态
    --UnityEngine.PlayerPrefs.SetInt(key,1)  --value为0是默认spine,为1是特殊spine
    if type == PosterGirlViewModel.spineType.role then
        local posInfo = CharactercoordinatesLocalData.tab[_skin.id].coordinate7
        local _info1 = string.split(posInfo,";")
        local _info2 = string.split(_info1[1],",")
        local x = tonumber(_info2[1])
        local y = tonumber(_info2[2])
        local scale = tonumber(_info1[2])
        ---清理旧spine
        if PosterGirlViewModel.CurSpineObj then
            GameObject.Destroy(PosterGirlViewModel.CurSpineObj)
        end
        MgrRes.LoadCgSpine(root, _skin.id,"ABOriginal/Role/".._skin.id.."/BgSpine/Watch_3D_role.prefab",x,y,scale,nil,function(_ReturnObj)
            PosterGirlViewModel.CurSpineObj = _ReturnObj
            PosterGirlViewModel.InitMainSceneRoleRandVoiceData()
        end)
    elseif type == PosterGirlViewModel.spineType.bottom then
        local posInfo = CharactercoordinatesLocalData.tab[_skin.id].coordinate8
        local _info1 = string.split(posInfo,";")
        local _info2 = string.split(_info1[1],",")
        local x = tonumber(_info2[1])
        local y = tonumber(_info2[2])
        local scale = tonumber(_info1[2])
        ---清理旧背景spine
        if PosterGirlViewModel.CurBgSpineObj then
            GameObject.Destroy(PosterGirlViewModel.CurBgSpineObj)
        end
        MgrRes.LoadCgSpine(root, _skin.id,"ABOriginal/Role/".._skin.id.."/BgSpine/Watch_3D_bg.prefab",x,y,scale,nil,function(_ReturnObj)
            PosterGirlViewModel.CurBgSpineObj = _ReturnObj
        end)
    elseif type == PosterGirlViewModel.spineType.front then
        local posInfo = CharactercoordinatesLocalData.tab[_skin.id].coordinate9
        local _info1 = string.split(posInfo,";")
        local _info2 = string.split(_info1[1],",")
        local x = tonumber(_info2[1])
        local y = tonumber(_info2[2])
        local scale = tonumber(_info1[2])
        local Img = root.transform:GetComponent("Image")
        ---清理旧前景spine
        if PosterGirlViewModel.CurFrontSpineObj then
            GameObject.Destroy(PosterGirlViewModel.CurFrontSpineObj)
        end
        Img.enabled = false
        MgrRes.LoadCgSpine(root, _skin.id,"ABOriginal/Role/".._skin.id.."/BgSpine/Watch_3D_front.prefab",x,y,scale,nil,function(_ReturnObj)
            PosterGirlViewModel.CurFrontSpineObj = _ReturnObj
        end)
    end
end

function PosterGirlViewModel.ClearSpine()
    if PosterGirlViewModel.CurSpineObj then
        GameObject.Destroy(PosterGirlViewModel.CurSpineObj)
        PosterGirlViewModel.CurSpineObj = nil
    end
    if PosterGirlViewModel.CurBgSpineObj then
        GameObject.Destroy(PosterGirlViewModel.CurBgSpineObj)
        PosterGirlViewModel.CurBgSpineObj = nil
    end
    if PosterGirlViewModel.CurFrontSpineObj then
        GameObject.Destroy(PosterGirlViewModel.CurFrontSpineObj)
        PosterGirlViewModel.CurFrontSpineObj = nil
    end
end

--- 根据当前展示看板娘ID随机播放语音
function PosterGirlViewModel.InitMainSceneRoleRandVoiceData(isSpecial)
    PosterGirlViewModel.Tab_MainSceneRoleVoiceData={}
    --local _CurRoleID = PlayerControl.GetPlayerData().HomeRole
    local _ActorLinesType
    --if _CurRoleID >= 90000 and _CurRoleID < 200000 then     ---看板娘
    --    _ActorLinesType = tonumber(Live2dLocalData.tab[_CurRoleID][3])
    --else
        --_ActorLinesType = tonumber(RoleattributeLocalData.tab[_CurRoleID][3])  ---当前台词组别
        local curRoleSkin = PlayerControl.GetPlayerData().HomeRole
        _ActorLinesType = tonumber(RoleuiskinLocalData.tab[curRoleSkin].interaction)
    --end
    PosterGirlViewModel._TotalWeight = 0 --当前随机总权重
    local roleActorLines = CommonViewModel.GetActorLinesByGroup(_ActorLinesType)
    for _, data in pairs(roleActorLines) do
        if isSpecial then
            if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.wear then
                if data[3] == 91 then
                    PosterGirlViewModel._TotalWeight = PosterGirlViewModel._TotalWeight+10
                    table.insert(PosterGirlViewModel.Tab_MainSceneRoleVoiceData,{data[1], PosterGirlViewModel._TotalWeight})
                end
            else
                if data[3] == 94 then
                    PosterGirlViewModel._TotalWeight = PosterGirlViewModel._TotalWeight+10
                    table.insert(PosterGirlViewModel.Tab_MainSceneRoleVoiceData,{data[1], PosterGirlViewModel._TotalWeight})
                end
            end
        else
            if data[4] == 4 then
                PosterGirlViewModel._TotalWeight = PosterGirlViewModel._TotalWeight+10
                table.insert(PosterGirlViewModel.Tab_MainSceneRoleVoiceData,{data[1], PosterGirlViewModel._TotalWeight})
            end
        end
    end
end

--------------------------语音------------------------------
--- 设置台词Obj
function PosterGirlViewModel.SetRoleVoiceWordText(_lineObj,imgObj,iconObj)
    PosterGirlViewModel.RoleVoiceWordText = _lineObj
    PosterGirlViewModel.VoiceObj = imgObj
    PosterGirlViewModel.VoiceIcon = iconObj
end

---根据id播放语音
function PosterGirlViewModel.PlayRoleVoice(type)
    ---主动通过ID播放的语音让它播放完
    PosterGirlViewModel.CanStop = false
    --local _CurRoleID = PlayerControl.GetPlayerData().HomeRole
    local _ActorLinesType
    --if _CurRoleID >= 90000 and _CurRoleID < 200000 then     ---看板娘
    --    _ActorLinesType = tonumber(Live2dLocalData.tab[_CurRoleID][3])
    --else
        --_ActorLinesType = tonumber(RoleattributeLocalData.tab[_CurRoleID][3])  ---当前台词组别
        local curRoleSkin = PlayerControl.GetPlayerData().HomeRole
        _ActorLinesType = tonumber(RoleuiskinLocalData.tab[curRoleSkin].interaction)
    --end
    local _FinalActorLineID = PosterGirlViewModel.GetPlayId(_ActorLinesType, type)
    print(_FinalActorLineID.."播放的声音类型"..type)
    PosterGirlViewModel.PlayTargetRoleAniVoice(_FinalActorLineID)
end

---播放主界面角色进入语音
function PosterGirlViewModel.PlayMainSceneRoleVoice()
    local a = SettingViewModel.GetMainRoleSound()
    local uid = PlayerControl.GetPlayerData().UID
    local s = UnityEngine.PlayerPrefs.GetInt("St_MainRoleTime"..uid)
    if s == nil or s == 0 then
        s = 0
    end
    if a == 2 or (a == 3 and Global.CheckIsSameDay(s,Global.GetCurTime())) then
        return
    end
    UnityEngine.PlayerPrefs.SetInt("St_MainRoleTime"..uid, Global.GetCurTime())
    --local _CurRoleID = PlayerControl.GetPlayerData().HomeRole
    local _ActorLinesType
    --if _CurRoleID >= 90000 and _CurRoleID < 200000 then     ---看板娘
    --    _ActorLinesType = tonumber(Live2dLocalData.tab[_CurRoleID][3])
    --else
        --_ActorLinesType = tonumber(RoleattributeLocalData.tab[_CurRoleID][3])  ---当前台词组别
        local curRoleSkin = PlayerControl.GetPlayerData().HomeRole
        _ActorLinesType = tonumber(RoleuiskinLocalData.tab[curRoleSkin].interaction)
    --end
    local _FinalActorLineID = 0
    _FinalActorLineID = PosterGirlViewModel.RandomBackHomeVoice(_ActorLinesType)
    PosterGirlViewModel.PlayTargetRoleAniVoice(_FinalActorLineID)
end

--- 根据权重表随机出一个下标
function PosterGirlViewModel.GetRandIndexByHashTab(_MaxWeight,_WeightHashTab)
    if _MaxWeight == 0 then
        return
    end
    local _randNum=math.random(_MaxWeight)
    print("随机权重".._randNum)
    local _FinalVoiceLineId="" --最终台词下标
    -- print("本次随机数为".._randNum.."总权重为".._MaxWeight)
    local _IsFound=false --是否找到比第一个元素权重大的权重下标(没有找到则默认返回第一个元素的下标)
    local _CurMaxWeightInSearch=0 --当前本次遍历中小于随机数的最大的权重
    for key, value in pairs(_WeightHashTab) do
        --判断当前随机数是否大于当前阶段上限阈值以及是否小于权重表最大阈值，否则不更新
        if value[2] < _randNum and value[2] <= _MaxWeight then

            -- 符合条件迭代更新
            if value[2] >= _CurMaxWeightInSearch then
                -- 判断当前比较的权重是否大于已经对比过的权重各种最大权重值，小于则不更新
                _FinalVoiceLineId=_WeightHashTab[key+1][1]   --高于当前阶段的最大阈值，返回下一阶段的台词ID
                _IsFound=true
                _CurMaxWeightInSearch=value[2]
            end
        end
    end
    if _IsFound == false then
        -- 设置为默认最低等级权重台词
        _FinalVoiceLineId=_WeightHashTab[1][1]
    end
    return _FinalVoiceLineId
end

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放 LTODO
function PosterGirlViewModel.PlayTargetRoleAniVoice(_ActorLineId)
    Tool.print("PlayTargetRoleAniVoice _ActorLineId:",_ActorLineId)
    if not NoviceControl.GroupsIsTrigger(tonumber(SteamLocalData.tab[120001][2])) or NoviceViewModel.Noviceing then
        PosterGirlViewModel.VoiceObj:SetActive(false)
        return
    end
    MgrTimer.Cancel("RoleVoice")
    MgrTimer.Cancel("RangeVoice")
    if _ActorLineId == nil then
        return
    end
    local _ActorLinesTab = ActorLinesLocalData.tab[_ActorLineId]
    local _AniName = _ActorLinesTab[6] --动画文件名
    local _ActorLineWord = _ActorLinesTab[7]
    local _AudioName = _ActorLinesTab[13]
    local _AudioType = _ActorLinesTab[3]
    local _BackAniName = "idle"

    --UnityEngine.Debug.LogError("当前状态: ".. ((PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress) and "脱衣状态" or "穿衣状态"))
    if _AudioType == 93 then  --脱衣语音
        PosterGirlViewModel.CurClothes = PosterGirlViewModel.ClothesType.undress
    elseif _AudioType == 96 then  --穿衣语音
        PosterGirlViewModel.CurClothes = PosterGirlViewModel.ClothesType.wear
    end

    --如果设置界面开启保持状态，记录当前状态
    local _skin = HeroControl.GetSkinDataByRoleID(PlayerControl.GetPlayerData().HomeRole)
    if SettingViewModel.GetHoldSpine() then
        UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID.."_CurClothes_".._skin.id,PosterGirlViewModel.CurClothes)
    end
    if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress then
        _BackAniName = "idle2"  --脱衣状态
        ---如果随机到主界面随机语音修改随机语音播放的动画
        if _ActorLinesTab[4] == 4 then
            _AniName = "idle2"
        end
    else
        _BackAniName = "idle"   --穿衣状态
    end
    --随机动作，排除待机动作
    if _AniName == "idle" or _AniName == "idle2" then
        _AniName = "0"
    end
    
    if PosterGirlViewModel.CurSpineObj ~= nil and _AniName ~= "0" then
        --UnityEngine.Debug.LogError("状态转变为 ".. ((PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress) and "脱衣状态" or "穿衣状态") .." 要播放的动画: ".._AniName.." 后面衔接的动画: ".. _BackAniName)
        CMgrSpine.Instance:SetSpineAnimation(PosterGirlViewModel.CurSpineObj,_AniName,false,nil,_BackAniName)
    end
    --UnityEngine.DebugEx.LogError(_AniName.." ".._BackAniName.." ".._AudioType)
    if  PosterGirlViewModel.RoleVoiceWordText.gameObject ~= nil then
        PosterGirlViewModel.RoleVoiceWordText.text=_ActorLineWord
    end

    --强制引导结束关闭引导语音
    if not NoviceViewModel.Noviceing then
        MgrSound.Stop(5)
    end
    MgrSound.PlayRole(_AudioName,nil,nil,false,0,0,tostring(PlayerControl.GetPlayerData().HomeRole))
    
    if PosterGirlViewModel.isRoleVoice == false then
        return
    end

    PosterGirlViewModel.VoiceObj:SetActive(true)
    PosterGirlViewModel.ListenVoice()
end

---根据当前好感度等级权重随机出本次的好感度交互台词ID
function PosterGirlViewModel.GetCurFavorWords(idx)
    local playerData = PlayerControl.GetPlayerData()
    local skinId = playerData.HomeRole
    local skinData = HeroControl.GetSkinDataBySkinId(skinId)
    
    --判断是否启用多状态切换
    if skinData.newSwitch then
        SkinControl.OnClickRoleBack(idx)
        return
    end
    ---检测当前spine是否是idle状态
    if CMgrSpine.Instance:CheckCurAniIsIdle(PosterGirlViewModel.CurSpineObj, PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress) == false then
        return
    end

    -- 存在 skinRoleData 则 HomeRole 是有角色配置的，否则就是皮肤 id
    local roleId = HeroControl.GetRoleDataByID(skinId) and skinId or skinData.roleId
    local roleData = HeroControl.GetRoleDataByID(roleId)
    -- 部分皮肤没有角色属性配置，要获取角色本身的数据
    local roleFavor = roleData.favor --默认100好感度
    local lobbySpine = UnityEngine.PlayerPrefs.GetInt(playerData.UID .. "LobbySpine")
    local actorLinesType = CheckNumber(RoleuiskinLocalData.tab[skinId].interaction)   --台词组别
    local actorLinesAll = CommonViewModel.GetActorLinesByGroup(actorLinesType)
    
    ---@type CommonWeightData[]
    local actorLinesIdAndWeight = {}
    local totalWeight = 0
    local TryCollectActorLines = function(pData, pCondSpl) 
        local condReturn = TableToObject.GetTargetWeight2(pCondSpl, roleFavor)
        if condReturn ~= false then
            -- 为什么权重要配小数？
            local weight = (CheckNumber(condReturn) * 1000)
            totalWeight = totalWeight + weight
            table.insert(actorLinesIdAndWeight, {
                weight = weight,
                data = pData[1],
            })
        end
    end

    if idx then
        for _, data in pairs(actorLinesAll) do
            local acType = data[4]
            local acReadType = data[3]
            if acType == CommonViewModel.ActorLinesType.TOUCH then
                local condSpl = string.split(data[5], "_")
                local condType = CheckNumber(condSpl[1])
                local condValue = CheckNumber(condSpl[2])
                if condType == CommonViewModel.ActorLinesCondition.TOUCH_AREA and idx == condValue then
                    TryCollectActorLines(data, condSpl)
                elseif condType == CommonViewModel.ActorLinesCondition.CG_STATUS and idx == condValue then
                    --- 穿着衣服时，只播放脱衣或穿衣触摸
                    if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.wear then
                        if acReadType == CommonViewModel.ActorLinesReadType.DRESSED_TOUCH
                                or acReadType == CommonViewModel.ActorLinesReadType.UNDRESSING then
                            TryCollectActorLines(data, condSpl)
                        end
                    --- 没穿衣服时，只播放穿衣或脱衣触摸
                    else
                        if acReadType == CommonViewModel.ActorLinesReadType.UNDRESSED_TOUCH
                                or acReadType == CommonViewModel.ActorLinesReadType.DRESSING then
                            TryCollectActorLines(data, condSpl)
                        end
                    end
                end
            end
        end
    elseif lobbySpine == 0 then
        --- 没有点击区域就必须是默认看板娘？(不理解，但原逻辑如此)
        for _, data in pairs(actorLinesAll) do
            local acType = data[4]
            local acReadType = data[3]
            local condSpl = string.split(data[5], "_")
            local condType = CheckNumber(condSpl[1])
            --- 对于默认看板娘，只要是 CG_STATUS 台词，则没有任何类型要求？
            if condType == CommonViewModel.ActorLinesCondition.CG_STATUS then
                --- 穿着衣服时，只播放脱衣或穿衣触摸
                if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.wear then
                    if acReadType == CommonViewModel.ActorLinesReadType.DRESSED_TOUCH
                            or acReadType == CommonViewModel.ActorLinesReadType.UNDRESSING then
                        TryCollectActorLines(data, condSpl)
                    end
                --- 没穿衣服时，只播放穿衣或脱衣触摸
                else
                    if acReadType == CommonViewModel.ActorLinesReadType.UNDRESSED_TOUCH
                            or acReadType == CommonViewModel.ActorLinesReadType.DRESSING then
                        TryCollectActorLines(data, condSpl)
                    end
                end
            --- 对于默认看板娘，不是 CG_STATUS 台词，就只要触摸类型，且条件只能是好感度？
            elseif acType == CommonViewModel.ActorLinesType.TOUCH and condType == CommonViewModel.ActorLinesCondition.ROLE_FAVOR then
                if acReadType == CommonViewModel.ActorLinesReadType.DRESSED_IDLE then
                    if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.wear then
                        TryCollectActorLines(data, condSpl)
                    end
                elseif acReadType == CommonViewModel.ActorLinesReadType.UNDRESSED_IDLE then
                    if PosterGirlViewModel.CurClothes == PosterGirlViewModel.ClothesType.undress then
                        TryCollectActorLines(data, condSpl)
                    end
                else
                    TryCollectActorLines(data, condSpl)
                end
            end
        end
    end
    
    local voiceLineId = CommonViewModel.GetRandomWeightData(actorLinesIdAndWeight, totalWeight)
    PosterGirlViewModel.PlayTargetRoleAniVoice(voiceLineId)
    --- 后面要加特效？
end

--- 监听语音是否结束
function PosterGirlViewModel.ListenVoice()
    MgrTimer.AddRepeat("RoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(PlayerControl.GetPlayerData().HomeRole)) then
            PosterGirlViewModel.VoiceObj:SetActive(false)
            PosterGirlViewModel.RangeRoleVoice()
            MgrTimer.Cancel("RoleVoice")
        end
    end,-1,nil)
end

function PosterGirlViewModel.GetPlayId(int_roleid , int_type)
    --for id, value in pairs(ActorLinesLocalData.tab) do
    --    -- statements
    --    if value[2] == int_roleid and value[4] == int_type then
    --        return value[1]
    --    end
    --end
    local roleActorLines = CommonViewModel.GetActorLinesByGroup(int_roleid)
    for _, data in pairs(roleActorLines) do
        if data[4] == int_type then
            return data[1]
        end
    end
    return nil
end

---随机播放语音/60秒一次
function PosterGirlViewModel.RangeRoleVoice()
    MgrTimer.AddRepeat("RangeVoice",40,function()
        if PosterGirlViewModel.CanStop then
            return
        end
        --先判断时间,如果时间为准点,播放时间,如果电量为准点,播放电量语音
        if  PlayerControl.GetPlayerData().curRoleID == 90000 then
            local timefloat=   Tools.GetTime_float()
            -- if timefloat- HomeViewModel.LastBatteryTime>0.08 then
            --     local Battery= MgrSdk.GetBattery()
            --     if Battery<11 then
            --         PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 57))
            --         MgrTimer.Cancel("RangeVoice")
            --         return
            --     elseif Battery<31 then
            --         PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 56))
            --         MgrTimer.Cancel("RangeVoice")
            --         return
            --     elseif Battery<51 then
            --         PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 55))
            --         MgrTimer.Cancel("RangeVoice")
            --         return
            --     end
            -- end
            HomeViewModel.LastBatteryTime = timefloat
            print(timefloat) --0.02误差内都可以播放准时语音
            if  timefloat >8.98 and timefloat<9.02 then
                PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 58))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >11.98 and timefloat<12.02 then
                PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 59))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >14.98 and timefloat<15.02 then
                PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 60))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >17.98 and timefloat<18.02 then
                PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 61))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >21.98 and timefloat<22.02 then
                PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 62))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >23.98 and timefloat<0.02 then
                PosterGirlViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 63))
                MgrTimer.Cancel("RangeVoice")
                return
            end
        end
        local _RandId = PosterGirlViewModel.GetRandIndexByHashTab(PosterGirlViewModel._TotalWeight,PosterGirlViewModel.Tab_MainSceneRoleVoiceData)
        print("播放了闲置随机语音".._RandId)
        PosterGirlViewModel.PlayTargetRoleAniVoice(_RandId)
        MgrTimer.Cancel("RangeVoice")
    end,-1,nil)
end

function PosterGirlViewModel.ResetSingleVoiceAudio()
    ---如果可以停止语音
    if PosterGirlViewModel.CanStop then
        MgrSound.Stop(3,tostring(PlayerControl.GetPlayerData().HomeRole),false)
    else
        ---如果不能停止语音就重置条件
        PosterGirlViewModel.CanStop = true
    end

    MgrTimer.Cancel("RoleVoice")
    MgrTimer.Cancel("RangeVoice")
end

function PosterGirlViewModel.GetRoleWords(roleId,type)
    local ActorLinesType = tonumber(RoleuiskinLocalData.tab[roleId].interaction)  --当前台词组别
    local _type = nil
    if type == PosterGirlViewModel.WordsType.LvUp then --升级台词
        _type = 6
    elseif type == PosterGirlViewModel.WordsType.StarUp then  --升星台词
        _type = 7
    elseif type == PosterGirlViewModel.WordsType.Awaken then  --觉醒台词
        _type = 8
    elseif type == PosterGirlViewModel.WordsType.SkillUp then  --技能升级台词
        _type = 9
    end
    if _type == nil then
        _type = 6
    end
    return PosterGirlViewModel.GetPlayId(ActorLinesType, _type)
end

function PosterGirlViewModel.Clear()
    PosterGirlViewModel.CurSpineObj=nil
    PosterGirlViewModel.Tab_MainSceneRoleVoiceData={}
    PosterGirlViewModel.RoleVoiceWordText={}
    PosterGirlViewModel.IsVoiceEnd = true
    PosterGirlViewModel.VoiceObj = nil
    PosterGirlViewModel.VoiceIcon = nil
    PosterGirlViewModel.CanStop = true
    PosterGirlViewModel.CurBgSpineObj = nil
    PosterGirlViewModel.CurFrontSpineObj = nil
    PosterGirlViewModel.CurClothes = nil
    PosterGirlViewModel.isRoleVoice = true
end

function PosterGirlViewModel.RandomBackHomeVoice(_ActorLinesType)
    local typeStr = VoiceChoseLocalData.tab[1].typeid
    local types = string.split(typeStr, ";")
    local list = {}
    local allActorLines = CommonViewModel.GetActorLinesByGroup(_ActorLinesType) 
    -- print("RandomBackHomeVoice types"..serpent.block(types))
    for key, value in pairs(types) do
        local t = tonumber(value)
        for _, data in pairs(allActorLines) do
            if data[4] == t then
                table.insert(list, data)
            end
        end
    end
    -- print("RandomBackHomeVoice"..serpent.block(list))
    local index = math.random(#list)
    return list[index][1]
end

return PosterGirlViewModel