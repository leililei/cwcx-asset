require("LocalData/ActionswitchLocalData")
require("LocalData/ActorLinesLocalData")
require("LocalData/ActorVoiceLocalData")
require("Model/Skin/Data/SkinData")
require("Model/Skin/Data/AsmrData")
---管理器
SkinControl = {}
SkinControl.UIType = {
    ---主界面
    home = 1,
    ---图鉴
    roleArchive = 2
}
---皮肤切换动作数据
local ActData = {}
---角色spine
local CurSpineObj = nil
---背景spine
local CurBgSpineObj = nil
---前景spine
local CurFrontSpineObj = nil
---spine路径
local RolePath = nil
local FrontPath = nil
local BgPath = nil
---语音和文字数据
local VoiceData_Home = {}
---语音文字
local VoiceWordText = nil
---语音文字组件
local VoiceObj = nil
---主界面
local SaveKey_home = ""
---是否需要随机语音
local NeedRangeVoice = false
---是否保存本地
local NeedSave = false
---当前类型
local CurUIType = nil
---当前RoleID
local CurRoleID = nil
---是否打开播放动画界面
local IsOpen = true
---播放动画界面的RoleID
local OpenRoleID = nil
---设置动画状态 1开启 2每日一次 3关闭
local OpenState = 1
---开场动画记录本地KEY
local OpenKey = "OpenAnimeKey"
---开场动画每个角色的播放时间（天数）
local OpenAnimeKey = ""
---已播放的开场动画皮肤ID和时间
local OpenAnimeList = {}
SkinControl.OpenType = {
    On = 1,
    Daily = 2,
    Off = 3
}
---@type AsmrData
---连续动作数据
local AsmrInfo = {}
--- 简易动画数据 ---
local Esay_ActData = nil
local Esay_ActIdx = 1
---当前皮肤动作
local CurAnime = {}
local isJump = false

function SkinControl.InitData()
    SaveKey_home = PlayerControl.GetPlayerData().UID .. "HomeSpine"
    OpenAnimeKey = "OpenAnimeKey_"..PlayerControl.GetPlayerData().UID
    --初始化动画状态
    OpenState = UnityEngine.PlayerPrefs.GetInt(OpenKey,1)
    local default = false
    for i, v in ipairs(ActionswitchLocalData.tab) do
        if ActData[v.skinid] == nil then
            default = true
            ActData[v.skinid] = {}
        end
        if ActData[v.skinid][v.currentstate] == nil then
            ActData[v.skinid][v.currentstate] = {}
        end
        ---@type SkinData
        ActData[v.skinid][v.currentstate][v.ondition] = SkinData.New()
        ActData[v.skinid][v.currentstate][v.ondition]:PushConfig(v,default)
        default = false
    end
    --初始化连续动作数据
    SkinControl.InitAsmrData()
    
    local tStr = UnityEngine.PlayerPrefs.GetString(OpenAnimeKey,"{}")
    OpenAnimeList = RapidJson.decode(tStr)
end
---初始化连续动作数据
function SkinControl.InitAsmrData()
    for i, v in ipairs(ActorVoiceLocalData.tab) do
        local tList = AsmrData.New()
        tList:PushConfig(v)
        if AsmrInfo[v.characterid] == nil then
            AsmrInfo[v.characterid] = {}
        end
        if AsmrInfo[v.characterid][v.group] == nil then
            AsmrInfo[v.characterid][v.group] = {}
        end
        table.insert(AsmrInfo[v.characterid][v.group],tList)
    end
end

---@return SkinData 获取动画切换数据 
function SkinControl.GetAction(_skinId,_curState)
    local tActData = nil
    if _curState and ActData[_skinId] and ActData[_skinId][_curState] then
        tActData = ActData[_skinId][_curState]
    elseif ActData[_skinId] then
        for i, stateData in pairs(ActData[_skinId]) do
            for i, v in pairs(stateData) do
                if v.isDefault then
                    tActData = stateData
                    break
                end
            end
        end
    end
    return tActData
end

---设置台词和其背景的Obj
function SkinControl.SetRoleVoiceWordText(_lineObj,imgObj)
    VoiceWordText = _lineObj
    VoiceObj = imgObj
end
---保存当前皮肤状态
function SkinControl.SetHomeSkinData(_skinId,_curState)
    if not NeedSave then
        return
    end
    --保存格式 skinId_curStat;skinId_curStat...
    local tSkin_Str = UnityEngine.PlayerPrefs.GetString(SaveKey_home)

    if not string.find(tSkin_Str,tostring(_skinId)) then
        tSkin_Str = tSkin_Str=="" and _skinId.."_".._curState or tSkin_Str..";".._skinId.."_".._curState
    else
        local tStr = string.split(tSkin_Str,';')
        tSkin_Str = ""
        for i, v in ipairs(tStr) do
            if string.find(v,tostring(_skinId)) then
                tSkin_Str = tSkin_Str=="" and _skinId.."_".._curState or tSkin_Str..";".._skinId.."_".._curState
            else
                tSkin_Str = tSkin_Str=="" and v or tSkin_Str..";"..v
            end
        end
    end
    UnityEngine.PlayerPrefs.SetString(SaveKey_home, tSkin_Str)
end
---@return SkinData
function SkinControl.GetHomeSkinData(_skinId)
    local tCurSkin = nil
    local tSkinState = nil
    --保存格式 skinId_curStat;skinId_curStat...
    local tSkinData = UnityEngine.PlayerPrefs.GetString(SaveKey_home)
    if not SettingViewModel.GetHoldSpine() then
        tSkinData = ""
    end
    if not NeedSave then
        tSkinData = ""
    end
    if tSkinData ~= "" then
        local tStr = string.split(tSkinData,';')
        for i, v in ipairs(tStr) do
            local tData = string.split(v,'_')
            if tonumber(tData[1]) == _skinId then
                tSkinState = tData[2]
                break
            end
        end
    end
    tCurSkin = SkinControl.GetAction(_skinId,tSkinState)
    
    return tCurSkin
end
---初始化皮肤功能需求(是否需要随机语音,是否保存本地)
function SkinControl.InitSpineState(_needRangeVoice,_needSave,_type,_skinId)
    NeedRangeVoice = _needRangeVoice
    NeedSave = _needSave
    CurUIType = _type
    CurRoleID = _skinId
end
---创建皮肤
function SkinControl.CreateRoleSpine(_Root,type)    
    --local _skin = HeroControl.GetSkinDataByRoleID(CurRoleID)
    local _skin = HeroControl.GetSkinDataBySkinId(CurRoleID)
    ---@type SkinData
    local tSkinData = SkinControl.GetHomeSkinData(_skin.id)
    
    --初始化当前皮肤动作的语音
    SkinControl.InitCurSkinVoice(tSkinData)
    
    local posInfo
    if type == PosterGirlViewModel.spineType.role then  --角色spine
        if CurUIType == SkinControl.UIType.home then
            posInfo = CharactercoordinatesLocalData.tab[_skin.id].coordinate0
        elseif CurUIType == SkinControl.UIType.roleArchive then
            posInfo = CharactercoordinatesLocalData.tab[_skin.id].coordinate6
        end
        
        local _info1 = string.split(posInfo,";")
        local _info2 = string.split(_info1[1],",")
        local x = tonumber(_info2[1])
        local y = tonumber(_info2[2])
        local scale = tonumber(_info1[2])
        ---清理旧spine
        if CurSpineObj then
            GameObject.Destroy(CurSpineObj)
            CurSpineObj = nil
            if RolePath ~= nil then
                MgrRes.UnLoadAssetBundle(RolePath)
                RolePath = nil
            end
        end
        
        MgrRes.LoadWatch3DSpine(_Root,_skin.id,x,y,scale,nil,function(_ReturnObj)
            CurSpineObj = _ReturnObj
            RolePath = MgrRes.GetWatch3DSpinePath(_skin.id)
            _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(-1,"Default")
            _ReturnObj.layer = 5
            --播放该状态入场动画
            if tSkinData then
                local tData = tSkinData[0]
                CMgrSpine.Instance:SetSpineAnimation(CurSpineObj, tData.CurAniName, true)
            end
        end)
    elseif type == PosterGirlViewModel.spineType.bottom then  --背景spine
        if _skin.backgroundpic ~= "0" then
            ---清理旧背景spine
            if CurBgSpineObj then
                GameObject.Destroy(CurBgSpineObj)
                CurBgSpineObj = nil
                if BgPath ~= nil then
                    MgrRes.UnLoadAssetBundle(BgPath)
                    BgPath = nil
                end
            end
            
            if string.find(_skin.backgroundpic,'Watch_3D_bg') then
                local coordinate = string.split(CharactercoordinatesLocalData.tab[_skin.id].coordinate8,";")
                local x = tonumber(string.split(coordinate[1],",")[1])
                local y = tonumber(string.split(coordinate[1],",")[2])
                local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
                MgrRes.LoadCgSpine(_Root, _skin.id,_skin.backgroundpic,x,y,scale,_skin.morning,function(_ReturnObj)
                    CurBgSpineObj = _ReturnObj
                    BGPath = MgrRes.GetLocalizedPath(_skin.backgroundpic)
                    _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(-2,"Default")
                    _ReturnObj.layer = 5
                    --播放该状态入场动画
                    if tSkinData then
                        local tData = tSkinData[0]
                        if tData.AniPlay[1].backAni and tData.AniPlay[1].backAni ~= "0" then
                            CMgrSpine.Instance:SetSpineAnimation(CurBgSpineObj, tData.AniPlay[1].backAni, true)
                        end
                    end
                end,true)
            else
                local coordinate = string.split(CharactercoordinatesLocalData.tab[_skin.id].coordinate8,";")
                local x = tonumber(string.split(coordinate[1],",")[1])
                local y = tonumber(string.split(coordinate[1],",")[2])
                local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
                MgrRes.LoadCgSpine(_Root, _skin.id,_skin.backgroundpic,x,y,scale,nil,function(_ReturnObj)
                    CurBgSpineObj = _ReturnObj
                    BGPath = MgrRes.GetLocalizedPath(_skin.backgroundpic)
                    --播放该状态入场动画
                    if tSkinData then
                        local tData = tSkinData[0]
                        if tData.AniPlay[1].backAni and tData.AniPlay[1].backAni ~= "0" then
                            CMgrSpine.Instance:SetSpineAnimation(CurBgSpineObj, tData.AniPlay[1].backAni, true)
                        end
                    end
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
            if CurBgSpineObj then
                GameObject.Destroy(CurBgSpineObj)
                CurBgSpineObj = nil
                if BgPath ~= nil then
                    MgrRes.UnLoadAssetBundle(BgPath)
                    BgPath = nil
                end
            end
            MgrRes.LoadCgSpine(_Root, CurRoleID,path,x,y,scale,MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].morning,function(_ReturnObj)
                CurBgSpineObj = _ReturnObj
                BGPath = MgrRes.GetLocalizedPath(path)
                --播放该状态入场动画
                if tSkinData then
                    local tData = tSkinData[0]
                    if tData.AniPlay[1].backAni and tData.AniPlay[1].backAni ~= "0" then
                        CMgrSpine.Instance:SetSpineAnimation(CurBgSpineObj, tData.AniPlay[1].backAni, true)
                    end
                end
            end,true)
        end
    elseif type == PosterGirlViewModel.spineType.front then   --前景spine
        if _skin.foregroundpic ~= "0" then
            ---清理旧前景spine
            if CurFrontSpineObj then
                GameObject.Destroy(CurFrontSpineObj)
                CurFrontSpineObj = nil
                if FrontPath ~= nil then
                    MgrRes.UnLoadAssetBundle(FrontPath)
                    FrontPath = nil
                end
            end
            local img = _Root.transform:GetComponent("Image")
            img.enabled = false
            local coordinate = string.split(CharactercoordinatesLocalData.tab[_skin.id].coordinate9,";")
            local x = tonumber(string.split(coordinate[1],",")[1])
            local y = tonumber(string.split(coordinate[1],",")[2])
            local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
            MgrRes.LoadSkinFrontBG(_skin.type,img,_skin.foregroundpic,_Root,x,y,scale,nil,function(_ReturnObj)
                _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(0,"Default")
                CurFrontSpineObj = _ReturnObj
                FrontPath = MgrRes.GetLocalizedPath(_skin.foregroundpic)
                --播放该状态入场动画
                if tSkinData then
                    local tData = tSkinData[0]
                    if tData.AniPlay[1].frontAni and tData.AniPlay[1].frontAni ~= "0" then
                        CMgrSpine.Instance:SetSpineAnimation(CurFrontSpineObj, tData.AniPlay[1].frontAni, true)
                    end
                end
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
            if CurFrontSpineObj then
                GameObject.Destroy(CurFrontSpineObj)
                CurFrontSpineObj = nil
                if FrontPath ~= nil then
                    MgrRes.UnLoadAssetBundle(FrontPath)
                    FrontPath = nil
                end
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
                    MgrRes.LoadCgSpine(_Root, CurRoleID,path,x,y,scale,MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].morning,function(_ReturnObj)
                        CurFrontSpineObj = _ReturnObj
                        FrontPath = MgrRes.GetLocalizedPath(path)
                        --播放该状态入场动画
                        if tSkinData then
                            local tData = tSkinData[0]
                            if tData.AniPlay[1].frontAni and tData.AniPlay[1].frontAni ~= "0" then
                                CMgrSpine.Instance:SetSpineAnimation(CurFrontSpineObj, tData.AniPlay[1].frontAni, true)
                            end
                        end
                    end,true)
                end
            end
        end
    end
end

---初始化当前皮肤动作的语音
function SkinControl.InitCurSkinVoice(_curSkinData)
    VoiceData_Home = _curSkinData
    if NeedRangeVoice then
        PosterGirlViewModel.InitMainSceneRoleRandVoiceData()
    end
end
---设置当前皮肤动作
function SkinControl.SetCurSkinVoice(_skinId,_curState)
    local tCurSkin = SkinControl.GetAction(_skinId,_curState)
    VoiceData_Home = tCurSkin
end
---点击角色反馈
function SkinControl.OnClickRoleBack(idx)
    local tIdx = idx==nil and 0 or idx
    local CurAniData = nil
    
    --根据权重随出动画数据
    ---@type SkinData
    local tCurData = VoiceData_Home[tIdx]
    --重置权重
    tCurData:ResetTotalWeight()
    if tCurData.TotalWeight == 0 then
        return
    end
    local randWeight = math.random(1,tCurData.TotalWeight)
    local range = 0
    for i, v in ipairs(tCurData.AniPlay) do
        if randWeight > range and randWeight <= v.weight+range then
            CurAniData = v
            break
        end
        range = range+v.weight
    end
    --播放点击动画
    SkinControl.PlayAniVoice(CurAniData, tCurData.SkinId, tCurData.CurAniName)
end
---播放点击动画
function SkinControl.PlayAniVoice(_ActorLine, _SkinId, _CurAniName)
    --点击动画名
    local ClickActorName = _ActorLine.touchAni
    --切换动画名
    local SwitchActorName = _ActorLine.switchAni
    --台词
    local ActorLineWord = _ActorLine.aniWorld
    --音频文件名
    local AudioName = _ActorLine.audioName
    --音频文件名
    local FrontAni = _ActorLine.frontAni
    --音频文件名
    local BackAni = _ActorLine.backAni
    
    --显示台词
    if VoiceWordText ~= nil and PosterGirlViewModel.isRoleVoice then
        VoiceWordText.text = ActorLineWord
        VoiceObj:SetActive(true)
    end
    local tOpenAnim = SwitchActorName==nil and _CurAniName or SwitchActorName
    --前景动画
    if FrontAni and FrontAni ~= "0" then
        CMgrSpine.Instance:SetSpineAnimation(CurFrontSpineObj, FrontAni, tOpenAnim==nil, nil, tOpenAnim)
    end
    --后景动画
    if BackAni and BackAni ~= "0" then
        CMgrSpine.Instance:SetSpineAnimation(CurBgSpineObj, BackAni, tOpenAnim==nil, nil, tOpenAnim)
    end
    --动画
    CMgrSpine.Instance:SetSpineAnimation(CurSpineObj, ClickActorName, tOpenAnim==nil, nil, tOpenAnim)
    --语音
    MgrSound.PlayRole(AudioName,nil,nil,false,0,0,tostring(PlayerControl.GetPlayerData().HomeRole))
    --随机语音
    if NeedRangeVoice then
        SkinControl.ListenVoice()
    end

    if SwitchActorName then
        SkinControl.SetCurSkinVoice(_SkinId, SwitchActorName)
        SkinControl.SetHomeSkinData(_SkinId, SwitchActorName)
    end
end

---监听语音是否结束
function SkinControl.ListenVoice()
    MgrTimer.AddRepeat("RoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(CurRoleID)) then
            VoiceObj:SetActive(false)
            PosterGirlViewModel.RangeRoleVoice()
            MgrTimer.Cancel("RoleVoice")
        end
    end,-1,nil)
end
---是否允许打开播放动画界面
function SkinControl.SetOpenAni(_isOpen)
    if OpenState == SkinControl.OpenType.On then
        IsOpen = _isOpen
    end
end
---打开播放动画界面
function SkinControl.OpenPlayAnime(_roleId)
    --关闭开场动画
    if OpenState == SkinControl.OpenType.Off then
        return
    end
    local _skin = HeroControl.GetSkinDataBySkinId(_roleId)
    --每日-开场动画检测
    if OpenState == SkinControl.OpenType.Daily and SkinControl.CheckOpenAnime(_skin.id) then
        return
    end
    ---@type SkinData
    local tSkinData = SkinControl.GetHomeSkinData(_skin.id)

    if _skin.newSwitch and tSkinData then
        local tData = tSkinData[0]
        --检测是否存在开场动画
        if tData.OpenAnim and IsOpen then
            OpenRoleID = _roleId
            MgrUI.GoHide(UID.PlayAnime_UI)
        end
    end
end
---设置播放动画界面的RoleID
function SkinControl.SetOpenRoleID(_roleId)
    OpenRoleID = _roleId
end
function SkinControl.GetOpenRoleID()
    return OpenRoleID
end
---播放Spine(前景|角色|背景)
function SkinControl.PlaySpine(_spineList,callBack)
    if _spineList[1] ~= "0" and CurFrontSpineObj then
        CMgrSpine.Instance:SetSpineAnimation(CurFrontSpineObj, _spineList[1], false, function()
            if callBack then
                callBack()
            end
        end)
    end
    if _spineList[2] ~= "0" and CurSpineObj then
        CMgrSpine.Instance:SetSpineAnimation(CurSpineObj, _spineList[2], false, function()
            if callBack then
                callBack()
            end
        end)
    end
    if _spineList[3] ~= "0" and CurBgSpineObj then
        CMgrSpine.Instance:SetSpineAnimation(CurBgSpineObj, _spineList[3], false, function()
            if callBack then
                callBack()
            end
        end)
    end
end
---设置动画状态 1开启 2每日一次 3关闭
function SkinControl.SetOpenState(_type)
    OpenState = _type
    if OpenState == SkinControl.OpenType.On then
        IsOpen = true
    elseif OpenState == SkinControl.OpenType.Off then
        IsOpen = false
    end
    --记录本地
    UnityEngine.PlayerPrefs.SetInt(OpenKey, OpenState)
end
---动画状态 1开启 2每日一次 3关闭
function SkinControl.GetOpenState()
    return OpenState
end
--- 简易动画 ---
---动画展示
function SkinControl.ShowAnimate(_roleObj,_bgObj,_frontObj)
    if Esay_ActData == nil then
        return
    end
    if Esay_ActIdx > #Esay_ActData then
        Esay_ActIdx = 1
    end
    --音频文件名
    local tCurVoiceID = Esay_ActData[Esay_ActIdx].voiceId
    if tCurVoiceID then
        local AudioName = ActorLinesLocalData.tab[tCurVoiceID][13]
        local tCfg = ActorLinesLocalData.tab[tCurVoiceID]
        local tFrontBackAni = nil
        if tCfg[15] ~= "0" then
            tFrontBackAni = string.split(tCfg[15],',')
        end
        local FrontAni = tFrontBackAni~=nil and tFrontBackAni[1] or nil
        local BackAni = tFrontBackAni~=nil and tFrontBackAni[2] or nil
        --语音
        MgrSound.PlayRole(AudioName,nil,nil,false,0,0,tostring(PlayerControl.GetPlayerData().HomeRole))
        --前景动画
        if FrontAni and FrontAni ~= "0" then
            CMgrSpine.Instance:SetSpineAnimation(_frontObj, FrontAni, false)
        end
        --后景动画
        if BackAni and BackAni ~= "0" then
            CMgrSpine.Instance:SetSpineAnimation(_bgObj, BackAni, false)
        end
    end
    ---点击动画
    local tCurTouch = Esay_ActData[Esay_ActIdx].touchAni
    ---循环动画
    local tCurSwitch = Esay_ActData[Esay_ActIdx].switchAni
    if tCurTouch and tCurSwitch then
        CMgrSpine.Instance:SetSpineAnimation(_roleObj, tCurTouch, false, nil, tCurSwitch)
    elseif tCurTouch then
        for i = Esay_ActIdx, 1, -1 do
            if Esay_ActData[i].switchAni then
                tCurSwitch = Esay_ActData[i].switchAni
                break
            end
        end
        CMgrSpine.Instance:SetSpineAnimation(_roleObj, tCurTouch, false, nil, tCurSwitch)
    elseif tCurSwitch then
        CMgrSpine.Instance:SetSpineAnimation(_roleObj, tCurSwitch, true)
    end
    Esay_ActIdx = Esay_ActIdx+1
end
---设置简易动画数据
function SkinControl.SetSkinData(_Actor,_SkinIdx)
    Esay_ActData = _Actor
    Esay_ActIdx = _SkinIdx
end

---获取连续动作数据,根据皮肤ID
function SkinControl.GetAsmrDataByID(_skinId)
    return AsmrInfo[_skinId]
end
---@param asmrData AsmrData[]
---AnitxtObj 台词控件
function SkinControl.PlayAsmr(asmrData,callBack,AnitxtObj)
    local idx = 1
    local PlayNum = 0
    --播放前，记录当前状态
    if asmrData[idx].RoleAni then
        CurAnime[CurSpineObj] = CurSpineObj.transform:GetComponent("SkeletonAnimation").AnimationName
        PlayNum = PlayNum + 1
    end
    if asmrData[idx].FrontAni then
        CurAnime[CurFrontSpineObj] = CurFrontSpineObj.transform:GetComponent("SkeletonAnimation").AnimationName
        PlayNum = PlayNum + 1
    end
    if asmrData[idx].BackAni then
        CurAnime[CurBgSpineObj] = CurBgSpineObj.transform:GetComponent("SkeletonAnimation").AnimationName
        PlayNum = PlayNum + 1
    end
    isJump = false
    
    MgrSound.StopAll()
    --背景音乐
    if asmrData[idx].Bgm then
        MgrSound.PlayBGM(asmrData[idx].Bgm, 0.2,nil,true)
    end
    function PlaySpine(_id)
        if #asmrData < _id then
            if callBack then
                SkinControl.JumpAnime()
                callBack()
            end
            return
        end
        if AnitxtObj then
            AnitxtObj.text = asmrData[_id].Line
        end
        --角色语音
        MgrSound.PlayRole(asmrData[idx].Audio,nil,nil,false,0,0,"AsmrVoice")
        --角色动画
        CMgrSpine.Instance:SetSpineAnimation(CurSpineObj, asmrData[_id].RoleAni, false, function()
            if isJump then
                return
            end
            PlayNum = PlayNum - 1
            if PlayNum == 0 then
                PlaySpine(_id+1)
            end
        end)
        if CurAnime[CurFrontSpineObj] then
            CMgrSpine.Instance:SetSpineAnimation(CurFrontSpineObj, asmrData[_id].RoleAni, false, function()
                if isJump then
                    return
                end
                PlayNum = PlayNum - 1
                if PlayNum == 0 then
                    PlaySpine(_id+1)
                end
            end)
        end
        if CurAnime[CurBgSpineObj] then
            CMgrSpine.Instance:SetSpineAnimation(CurBgSpineObj, asmrData[_id].RoleAni, false, function()
                if isJump then
                    return
                end
                PlayNum = PlayNum - 1
                if PlayNum == 0 then
                    PlaySpine(_id+1)
                end
            end)
        end
    end

    PlaySpine(idx)
end
---跳过动画
function SkinControl.JumpAnime()
    isJump = true
    for obj, aniName in pairs(CurAnime) do
        CMgrSpine.Instance:SetSpineAnimation(obj, aniName, true)
    end
    --停止角色语音
    local tVoice = MgrSound.CheckStatus(3,"AsmrVoice")
    if tVoice == 1 or tVoice == 2 then
        MgrSound.Stop(3,"AsmrVoice")
    end
    local tBgm = MgrSound.CheckStatus(1,"AsmrBgm")
    if tBgm == 1 or tBgm == 2 then
        --停止背景音乐
        MgrSound.Stop(1,"AsmrBgm")
    end
    
    local tSkinId = PlayerControl.GetPlayerData().HomeRole
    MgrSound.PlayBGM(RoleuiskinLocalData.tab[tSkinId].bgm, 0.2)
end
---记录皮肤动画播放时间
function SkinControl.SaveOpenAnime(_skinID)
    local tDay = Global.GetCreateRoleDays()
    OpenAnimeList[tostring(_skinID)] = tDay
    
    UnityEngine.PlayerPrefs.SetString(OpenAnimeKey,RapidJson.encode(OpenAnimeList))
end
---检测今日是否播放过该皮肤的动画
function SkinControl.CheckOpenAnime(_skinID)
    local tDay = Global.GetCreateRoleDays()
   
    return OpenAnimeList[tostring(_skinID)] == tDay
end
---播放指定动作 _objs(角色、背景、前景)
function SkinControl.PlaySelectAction(_objs,_actionData,callback)
    local roleObj = nil
    local bgObj = nil
    local frontObj = nil
    local PlayNum = 0
    if _objs then
        roleObj = _objs[1]
        bgObj = _objs[2]
        frontObj = _objs[3]
    else
        roleObj = CurSpineObj
        bgObj = CurBgSpineObj
        frontObj = CurFrontSpineObj
    end
    --点击动画名
    local ClickActorName = _actionData.touchAni
    --切换动画名
    local SwitchActorName = _actionData.switchAni
    --台词
    local ActorLineWord = _actionData.aniWorld
    --音频文件名
    local AudioName = _actionData.audioName
    --音频文件名
    local FrontAni = _actionData.frontAni
    --音频文件名
    local BackAni = _actionData.backAni

    --显示台词
    if VoiceWordText ~= nil and PosterGirlViewModel.isRoleVoice then
        VoiceWordText.text = ActorLineWord
        VoiceObj:SetActive(true)
    end
    local tOpenAnim = SwitchActorName==nil and _CurAniName or SwitchActorName
    --前景动画
    if FrontAni and FrontAni ~= "0" then
        PlayNum = PlayNum + 1
        CMgrSpine.Instance:SetSpineAnimation(frontObj, FrontAni, tOpenAnim==nil, function()
            PlayNum = PlayNum - 1
            if PlayNum == 0 and callback then
                callback()
            end
        end, tOpenAnim)
    end
    --后景动画
    if BackAni and BackAni ~= "0" then
        PlayNum = PlayNum + 1
        CMgrSpine.Instance:SetSpineAnimation(bgObj, BackAni, tOpenAnim==nil, function()
            PlayNum = PlayNum - 1
            if PlayNum == 0 and callback then
                callback()
            end
        end, tOpenAnim)
    end
    --动画
    if ClickActorName and ClickActorName ~= "0" then
        PlayNum = PlayNum + 1
        CMgrSpine.Instance:SetSpineAnimation(roleObj, ClickActorName, tOpenAnim==nil, function()
            PlayNum = PlayNum - 1
            if PlayNum == 0 and callback then
                callback()
            end
        end, tOpenAnim)
    end
    --语音
    MgrSound.PlayRole(AudioName,nil,nil,false,0,0,tostring(PlayerControl.GetPlayerData().HomeRole))
end

---清理旧spine
function SkinControl.ClearSpine()
    if CurSpineObj then
        GameObject.Destroy(CurSpineObj)
        CurSpineObj = nil
        if RolePath ~= nil then
            MgrRes.UnLoadAssetBundle(RolePath)
            RolePath = nil
        end
    end
    if CurBgSpineObj then
        GameObject.Destroy(CurBgSpineObj)
        CurBgSpineObj = nil
        if BgPath ~= nil then
            MgrRes.UnLoadAssetBundle(BgPath)
            BgPath = nil
        end
    end
    if CurFrontSpineObj then
        GameObject.Destroy(CurFrontSpineObj)
        CurFrontSpineObj = nil
        if FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(FrontPath)
            FrontPath = nil
        end
    end
end

function SkinControl.Clear()
    ActData = {}
    CurSpineObj = nil
    CurBgSpineObj = nil
    CurFrontSpineObj = nil
    VoiceData_Home = {}
    VoiceWordText = nil
    VoiceObj = nil
    Esay_ActData = nil
    SkinId_Esay = nil
    Esay_ActIdx = 1
    NeedRangeVoice = false
    NeedSave = false
    CurUIType = nil
    CurRoleID = nil
    RolePath = nil
    FrontPath = nil
    BgPath = nil
    IsOpen = true
    OpenState = 1
    AsmrInfo = {}
    CurAnime = {}
end

return SkinControl
