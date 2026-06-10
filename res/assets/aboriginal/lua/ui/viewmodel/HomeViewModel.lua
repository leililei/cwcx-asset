---大厅VM
HomeViewModel = {}
HomeViewModel.isRoleVoice = false

HomeViewModel.PackageRefreshTime = {}
HomeViewModel.packageList = {}
HomeViewModel.Btn_libao_Open = false
HomeViewModel.Need_A_Package_Pop = false
---初始化
function HomeViewModel.Init()
    ---加载与大厅相关的ViewModel
    require ("UI/ViewModel/BusinessCardViewModel")---切换角色
    require("UI/ViewModel/NormalCardDrawViewModel")---角色补给
    require("UI/ViewModel/PlayerAchievementViewModel")---社群
    require("UI/ViewModel/ActivationTaskViewModel")---任务
    require("UI/ViewModel/BagViewModel")---背包
    require("UI/ViewModel/WorldBossViewModel")---世界BOSS
    require("UI/ViewModel/StormViewModel")---战斗相关
    require("UI/ViewModel/PVPViewModel")---PVP演习
    require("UI/ViewModel/ShopViewModel")---商店
    require("UI/ViewModel/SignViewModel")---签到
    require("UI/ViewModel/RoleCardViewModel")---佣兵
    require("UI/ViewModel/PlayerAvatarViewModel")  ---个人信息
    require("UI/ViewModel/FriendViewModel") ---好友
    require("UI/ViewModel/AchievementViewModel")  ---成就
    require("UI/ViewModel/NoviceViewModel")  ---新手教程
    require("UI/ViewModel/HelpViewModel")  ---帮助
    require("UI/ViewModel/PosterGirlViewModel") ---看板娘
    require("UI/ViewModel/FightVideoViewModel") ---回放
    require("UI/ViewModel/BattleViewModel") ---回放
    require("UI/ViewModel/ArkViewModel")  ---方舟
    require("UI/ViewModel/PassportViewModel")   ---通行证
    require("UI/ViewModel/EventRaidViewModel")  ---剧情活动
    require("UI/ViewModel/SettingViewModel")
    require("UI/ViewModel/ActivityViewModel")
    require("UI/ViewModel/YueTaViewModel")
    require("UI/ViewModel/BlueprintViewModel")
    require("UI/ViewModel/CumulativeSalesViewModel")
    require("UI/ViewModel/BingoViewModel")
    require("UI/ViewModel/CommonViewModel")
    
    ---初始化引导
    NoviceViewModel.Init()
    ---任务红点监听
    TaskControl.CheckDotReceived()
    ---注册新邮件监听
    HomeViewModel.RegisterMail()
    ---初始化活动数据
    ActivityControl.InitActivityData()
    ---初始化维护池数据
    ArkViewModel.GetGameInfoREQ()
    ---加载设定(新手引导)
    SettingViewModel.Init()
    ---打开HomeUI
    HomeViewModel.OpenHome()
    ---关闭登录模块
    LoginViewModel.Close()
    ---注册商品推送监听
    ShopViewModel.RegisterGoodsNtf()
    ---注册新礼包监听
    HomeViewModel.RegisterPackagesPop()
    ---注册跑马灯推送监听
    SysNoticeControl.RegisterMarqueeNtf()
    ---注册好友推送监听
    FriendViewModel.RegisterFriend()
    ---初始化PVE红点
    StormControl.WhetherUnReceiveBox()
    ---注册月塔积分奖励信息监听
    YueTaViewModel.RegisterNtf()
    ---获取生日活动送礼和回礼数据
    CakeControl.GetGiftInfo()
    ---战斗播放
    BattleViewModel.Init()
    BlueprintViewModel.Init();
end
--------------------------跳转UI----------------------------------
function HomeViewModel.RegisterMail()
    MgrNet.RegisterNTF(MID.CLIENT_NEW_EMAIL_NTF, function()
        print("接收到新邮件")
        MailControl.EmailDataClick(function()
            RedDotControl.GetDotData("Mail"):SetState(true)
        end)
    end)
end

function HomeViewModel.RegisterPackagesPop()
    MgrNet.RegisterNTF(MID.CLIENT_PAY_PACK_INFO_NTF, function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientPayPackInfoNTF',buffer))
        HomeViewModel.CollationPackages(tab.PayPackInfoS)
    end)
end

function HomeViewModel.CollationPackages(PayPackInfoS)
    HomeViewModel.Btn_libao_Open = false
    HomeViewModel.Need_A_Package_Pop = false
    HomeViewModel.packageList = {}
    if PayPackInfoS then
        for i,v in pairs(PayPackInfoS) do
            local args = {
                ID = v.ID,
                endTime = v.CreateAt + v.Duration,
                Group = v.Group,
                NextID = v.NextID,
                Status = v.Status,
                Duration = v.Duration   -- -1为不限时间，不显示在主界面
            }
            HomeViewModel.packageList[#HomeViewModel.packageList + 1] = args
            HomeViewModel.PackageRefreshTime[i] = {args.endTime,args.Duration}
            if v.Duration ~= -1 and UnityEngine.PlayerPrefs.GetInt(v.ID.."PayPackInfoS"..PlayerControl.GetPlayerData().UID) ~= 1 and not v.Status and args.endTime > Global.GetCurTime() then
                print("接收到新限时礼包")
                UnityEngine.PlayerPrefs.SetInt(v.ID.."PayPackInfoS"..PlayerControl.GetPlayerData().UID,1)       --正式上线 0 改 1
                HomeViewModel.Need_A_Package_Pop = true
            end
        end
    end
    Event.Go("ShopHome_UI_ReloadScroll")    ---刷新ShopHome_UI
    HomeViewModel.HomeUIPackagesBTNControl()
end
function HomeViewModel.HomeUIPackagesBTNControl()
    for i,v in ipairs(HomeViewModel.packageList) do
        if v.Duration ~= -1 and v.endTime > Global.GetCurTime() and not v.Status then
            Event.Go("Btn_libao_Open")
            HomeViewModel.Btn_libao_Open = true
            break
        end
        if i == #HomeViewModel.packageList then
            Event.Go("Btn_libao_Close")
        end
    end
end
function HomeViewModel.OpenPackagesPop()
    if HomeViewModel.Need_A_Package_Pop and next(HomeViewModel.packageList) ~= nil and not NoviceViewModel.Noviceing then
        MgrUI.Pop(UID.PackagesPop_UI,HomeViewModel.packageList,true)
        HomeViewModel.Need_A_Package_Pop = false
    end
end
function HomeViewModel.CheckPackagesPop()
    if next(HomeViewModel.PackageRefreshTime) == nil then
        ---重新请求限时礼包数据 ClientUPPayPackREQ
        local req = {
            rev = "1",
        }
        local bytes = assert(pb.encode('PBClient.ClientUPPayPackREQ',req))
        MgrNet.SendReq(MID.CLIENT_UPDATE_PAY_PACK_REQ,bytes,0,nil,function(buffer, tag)
            local tab = assert(pb.decode('PBClient.ClientUPPayPackACK',buffer))
            print(tab.errNo)
            if tab.errNo~=0 then
                print(tab.errNo)
            end
        end)
    else
        for i,v in pairs(HomeViewModel.PackageRefreshTime) do
            if v[2] ~= -1 and v[1] < Global.GetCurTime() then
                ---重新请求限时礼包数据 ClientUPPayPackREQ
                local req = {
                    rev = "1",
                }
                local bytes = assert(pb.encode('PBClient.ClientUPPayPackREQ',req))
                MgrNet.SendReq(MID.CLIENT_UPDATE_PAY_PACK_REQ,bytes,0,nil,function(buffer, tag)
                    local tab = assert(pb.decode('PBClient.ClientUPPayPackACK',buffer))
                    print(tab.errNo)
                    if tab.errNo~=0 then
                        print(tab.errNo)
                    end
                end)
                break
            end
        end
    end
end

function HomeViewModel.OpenHome()
    if NoviceControl.CheckGuideFinish() then
        ---打开大厅UI
        MgrUI.GoFirst(UID.Home_UI);
        ---上报飞游角色数据
        HomeViewModel.ForSdkData()
        ---进入聊天室
        GuildControl.JoinChat()
    else
        MgrUI.PopHide(UID.ChargeLoading_UI);
        NoviceControl.GoGuide()
    end
end
---上报飞游角色数据
function HomeViewModel.ForSdkData()
    ---上报飞游角色进入
    MgrSdk.FlyFunRoleLauncher()
    ---埋点
    if PlayerControl == nil then
        return
    end
    local tCurDay = Global.GetCreateRoleDays()
    if tCurDay == 2 or tCurDay == 3 or tCurDay == 7 then
        ---获取最后一次登录是创角的第几天
        local tDay = Global.GetCreateRoleDays(PlayerControl.GetPlayerData().lastLoginTime)
        if tDay ~= tCurDay then
            ---第2 3 7天首次登录游戏关卡
            local tKey = {
                [2] = "m8lww7",
                [3] = "j9azi0",
                [7] = "q6rtcf"
            }
            local tName = string.format("day%d_level_up_%d",tCurDay,PlayerControl.GetPlayerData().level)
            MgrSdk.FlyFunTrackEvent(tKey[tCurDay],tName)
        end
    end
end
---新手引导
function HomeViewModel.FirstNovice()
    PlotViewModel.OpenPlotUI("kaichangdonghua", function()
        MgrTimer.AddDelayNoName(1,function()
            PlotViewModel.OpenPlotUI("yd_1", function()
                NoviceViewModel.CurTaskId = 10002
                StormViewModel.CurPointData = StormControl.GetStormPointByID(1000000)
                StormViewModel.CurPointType = 4
                MgrBattle.GoFight(MgrBattle.fightType.novice)
            end,nil)
        end)
    end,false,false,true)
end
--- 跳转角色切换※待优化及调试接口
function HomeViewModel.OpenSwitchRole()
    BusinessCardViewModel.Init()
end
--- 跳转佣兵抽卡※待优化及调试接口
function HomeViewModel.OpenRoleCardDraw(callback,LinkPage)
    if LinkPage == "cgzm" then
        if not SysLockControl.CheckSysLock(1301) then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1301),1},true)
            return
        end
        ---角色补给
        NormalCardDrawViewModel.LinkType = NormalCardDrawViewModel.PageType.normal
    elseif LinkPage == "gmzb" then
        if not SysLockControl.CheckSysLock(1005) then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1005),1},true)
            return
        end
        ---装备补给
        NormalCardDrawViewModel.LinkType = NormalCardDrawViewModel.PageType.equip
    else
        NormalCardDrawViewModel.LinkType = NormalCardDrawViewModel.PageType.timeLimit
    end
    --检查红点
    CardDrawControl.CheckRedDot()
    NormalCardDrawViewModel.Init(callback)
end
--- 跳转装备补给※待优化及调试接口
function HomeViewModel.OpenEquipGearDraw()
    VoidGearDrawViewModel.Init()
end
---跳转社群※待修复及调试接口
function HomeViewModel.OpenAssoc()
    PlayerAchievementViewModel.Init()
end
---跳转任务※待修复及调试接口
function HomeViewModel.OpenTask()
    ActivationTaskViewModel.Init()
end
---跳转任务※待修复及调试接口
function HomeViewModel.OpenAchievement()
    AchievementViewModel.Init()
end
---跳转背包※待修复及调试接口
function HomeViewModel.OpenPlayerBag(callback,_pageType)
    if _pageType == BagViewModel.BagPageEnum.PageItem then
    elseif _pageType == BagViewModel.BagPageEnum.PageEquip then
        if not SysLockControl.CheckSysLock(1904) then
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1902), 1 }, true)
            return
        end
    elseif _pageType == BagViewModel.BagPageEnum.PageCore then
        if not SysLockControl.CheckSysLock(1902) then
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1902), 1 }, true)
            return
        end
    elseif _pageType == BagViewModel.BagPageEnum.PageCacheCore then
        if not SysLockControl.CheckSysLock(1903) then
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1903), 1 }, true)
            return
        end
    end
    BagViewModel.Init(callback,_pageType)
end
---跳转设置※待修复
function HomeViewModel.OpenSetting()
    SettingViewModel.Init()
end
---跳转邮件※待修复
function HomeViewModel.OpenMail()
    MailControl.EmailDataClick(function()
        PostMailViewModel.Init()
    end)
end
--- 跳转战役（PVE）※待修复
function HomeViewModel.OpenChoose(usm, callback)
    StormViewModel.Init(usm, callback)
end
---跳转演习（PvP）※待修复
function HomeViewModel.OpenExercise(callback)
    if SysLockControl.CheckSysLock(1200) then
        if callback then
            callback()
        end
        PVPViewModel.Init()
    else
        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1200),1},true)
    end
end
---跳转商店
function HomeViewModel.OpenShop()
    ShopViewModel.OpenShopUI()
end
---跳转佣兵※待修复
function HomeViewModel.OpenCollection(callback)
    RoleCardViewModel.Init(callback)
end
---跳转图鉴
function HomeViewModel.OpenIllustration(callback)
    IllustrationViewModel.Init(callback)
end
---跳转玩家头像
function HomeViewModel.OpenPlayerAvatar(callback)
    PlayerAvatarViewModel.GetSupportData(function()
        PlayerAvatarViewModel.Init()
        Event.Clear("OpenPlayerAvatar")
        Event.Add("OpenPlayerAvatar",callback)
    end)
end
---跳转好友
function HomeViewModel.OpenFriend(callback)
    FriendViewModel.OpenFriendUI(callback)
end
---跳转方舟
function HomeViewModel.OpenArk(GoType)
    if SysLockControl.CheckSysLock(1600) then
        if GoType == "yuanzheng" then
            ---远征
            ArkViewModel.JumpToYzts = true
        elseif GoType == "gongchang" then
            ArkViewModel.CurType = 1
            MgrUI.GoHide(UID.EnergyFactory_UI)
            return
        end
        ArkViewModel.OpenUI()
    else
        MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1600), 1 }, true)
    end
end
---跳转联合讨伐(世界BOSS)
function HomeViewModel.OpenCrusade(activityType)
    if SysLockControl.CheckSysLock(1107)  then
        if NoviceViewModel.CurTaskId == 21103 then
            NoviceViewModel.DoNext()
        end
        ---更新联合讨伐(世界boss)数据
        StormViewModel.SendStormBossData2(function()
            if UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "LHTF"..activityType) ~= "1" then
                --ActivityControl.IsOpenLianHeTaoFa = true
                ActivityControl.PageType = ActivityControl.activityTypeEnum.LIANHETAOFA
                PlotViewModel.OpenPlotUI(EventRaidControl.GetLIANHETAOFAData().plot,function()
                       MgrUI.GoHide(UID.WorldBoss_UI)
                end,true,nil)
                UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "LHTF"..activityType,"1")
            else
                MgrUI.GoHide(UID.WorldBoss_UI)
            end
            --MgrUI.ClosePop(UID.HuoDongPop_UI)
            --MgrUI.GoHide(UID.WorldBoss_UI)
        end)
    else
        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1107),1},true)
    end
end
---跳转搓背
function HomeViewModel.OpenBackRub()
    if SysLockControl.CheckSysLock(1600) then
        MgrUI.GoHide(UID.BackRub_UI)
    else
        MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(1600), 1 }, true)
    end
end
---打开困难FB
function HomeViewModel.TurnToHardMode()
    if SysLockControl.CheckSysLock(1108) then
        StormViewModel.ReloadStormData()
        StormViewModel.CurLevelType = StormViewModel.LevelType.Hard
        local pData = StormViewModel.GetStormScrollData(1)
        local pHardData = StormViewModel.CacheHardScrollData
        local index = 0
        ---
        for i, v in ipairs(pHardData) do
            if v.id ~= nil then
                if StormControl.CheckScrollLock(v.id) then
                    index = v.index
                else
                    break
                end
            end
        end
        for i, v in ipairs(pData) do
            if v.index == index then
                index = i
                break
            end
        end
        StormViewModel.OpenStormPointUIAfterRequestDrop(pData[index], StormViewModel.PointType.main)
    else
        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1108),1},true)
    end
end
---剧情活动开启
function HomeViewModel.OpenEventActivity()
    local tEventData = EventRaidControl.GetEventData()
    local inMiddle = Global.isMiddleTime(tEventData.beginTime, tEventData.endTime)

    if inMiddle then
        if not SysLockControl.CheckSysLock(1106) then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1106),1},true)
            return
        end
    else
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("homeviewmodel_tips1"), 2 }, true)
        return
    end
    IllustrationViewModel.ReloadCacheData()
    ---判断剧情活动有无数据
    if EventRaidViewModel.GetEventRaidData() == nil then
        ActivityControl.PushData(function()
            MgrUI.GoHide(UID.EventRaid_UI)
        end)
    else
        MgrUI.GoHide(UID.EventRaid_UI)
    end
end
--[[
--------------------------------业务逻辑---------------------------------
---
-------------------------------角色立绘系统-------------------------------
HomeViewModel.CurSpineObj=nil ---立绘对象
--- 向一个立绘展示框中初始化一个人物立绘信息
function HomeViewModel.GetRoleSpineToBox(_Root)
    local _RoleId = PlayerControl.GetPlayerData().curRoleID
    local name
    local posInfo
    if _RoleId >= 90000 then
        name = PosterGirlControl.PosterGirlDataByID(_RoleId).name
        posInfo = PosterGirlControl.PosterGirlDataByID(_RoleId).coordinate0
    else
        name = RoleattributeLocalData.tab[_RoleId][8]
        posInfo = CharactercoordinatesLocalData.tab[_RoleId].coordinate0
    end
    local _info1 = string.split(posInfo,";")
    local _info2 = string.split(_info1[1],",")
    local x = tonumber(_info2[1])
    local y = tonumber(_info2[2])
    local scale = tonumber(_info1[2])
    MgrRes.LoadWatchAuto(_Root, _RoleId,x,y,scale,nil,function(_ReturnObj)
        HomeViewModel.CurSpineObj = _ReturnObj
        HomeViewModel.InitMainSceneRoleRandVoiceData()

    end)
end

-----------------------------角色语音系统----------------------------------
HomeViewModel.Tab_MainSceneRoleVoiceData={}  ---存储主界面角色随机语音信息表
HomeViewModel.RoleVoiceWordText={} ---当前角色台词文本Obj
HomeViewModel.IsVoiceEnd = true
HomeViewModel.VoiceObj = nil
HomeViewModel.VoiceIcon = nil
--- 设置台词Obj
function HomeViewModel.SetRoleVoiceWordText(_lineObj,imgObj,iconObj)
    HomeViewModel.RoleVoiceWordText = _lineObj
    HomeViewModel.VoiceObj = imgObj
    HomeViewModel.VoiceIcon = iconObj
    --Tools.SetVoiceFadeLoop(HomeViewModel.VoiceIcon,1.5)
end
---根据id播放语音
function HomeViewModel.PlayRoleVoice(type)

    local _CurRoleID = PlayerControl.GetPlayerData().curRoleID
    local _ActorLinesType=tonumber(RoleattributeLocalData.tab[_CurRoleID][3]) ---当前台词组别
    local _FinalActorLineID=0
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == _ActorLinesType and value[4] == type then
            _FinalActorLineID=value[1]
        end
    end
    print(_FinalActorLineID.."播放的声音类型"..type)
    HomeViewModel.PlayTargetRoleAniVoice(_FinalActorLineID)
end
---播放主界面角色进入语音
function HomeViewModel.PlayMainSceneRoleVoice()
    local _CurRoleID = PlayerControl.GetPlayerData().curRoleID
    local _ActorLinesType
    if _CurRoleID >= 90000 and _CurRoleID < 200000 then     ---看板娘
    _ActorLinesType = tonumber(Live2dLocalData.tab[_CurRoleID][3])
    else
        _ActorLinesType = tonumber(RoleattributeLocalData.tab[_CurRoleID][3])  ---当前台词组别
    end
    local _FinalActorLineID=0
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == _ActorLinesType and value[4] == 26 then
            _FinalActorLineID=value[1]
        end
    end
    HomeViewModel.PlayTargetRoleAniVoice(_FinalActorLineID)
end
--- 根据当前展示看板娘ID随机播放语音
function HomeViewModel.InitMainSceneRoleRandVoiceData()
    HomeViewModel.Tab_MainSceneRoleVoiceData={}
    local _CurRoleID = PlayerControl.GetPlayerData().curRoleID
    local _ActorLinesType
    if _CurRoleID >= 90000 and _CurRoleID < 200000 then     ---看板娘
        _ActorLinesType = tonumber(Live2dLocalData.tab[_CurRoleID][3])
    else
        _ActorLinesType = tonumber(RoleattributeLocalData.tab[_CurRoleID][3])  ---当前台词组别
    end
    HomeViewModel._TotalWeight = 0 --当前随机总权重
    for id, value in pairs(ActorLinesLocalData.tab) do
        -- statements
        if value[2] == _ActorLinesType and value[4] == 4 then
            -- 匹配到对应的角色台词组别并且交互类型为 4
            HomeViewModel._TotalWeight = HomeViewModel._TotalWeight+10
            table.insert(HomeViewModel.Tab_MainSceneRoleVoiceData,{id,HomeViewModel._TotalWeight})
        end
    end
    --local _RandId = HomeViewModel.GetRandIndexByHashTab(_TotalWeight,HomeViewModel.Tab_MainSceneRoleVoiceData)
    -- print("播放了闲置随机语音")
    --HomeViewModel.PlayTargetRoleAniVoice(_RandId,HomeViewModel.RandDelayPlayRoleVoice)
end
--- 根据权重表随机出一个下标
function HomeViewModel.GetRandIndexByHashTab(_MaxWeight,_WeightHashTab)
    local _randNum=math.random(_MaxWeight)
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
---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放 
function HomeViewModel.PlayTargetRoleAniVoice(_ActorLineId)
    if NoviceViewModel.CompleteTutorial[#NoviceViewModel.CompleteTutorial] < 14008 or NoviceViewModel.Noviceing == true then
        HomeViewModel.VoiceObj:SetActive(false)
        return
    end
    MgrTimer.Cancel("RoleVoice")
    MgrTimer.Cancel("RangeVoice")
    local _AniName=ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _ActorLineWord=ActorLinesLocalData.tab[_ActorLineId][7]
    local _AudioName=ActorLinesLocalData.tab[_ActorLineId][13]

    if HomeViewModel.CurSpineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(HomeViewModel.CurSpineObj,_AniName,false)
    end
    if  HomeViewModel.RoleVoiceWordText.gameObject ~= nil then
       -- HomeViewModel.TextEffect:TxtInit(_ActorLineWord)
        HomeViewModel.RoleVoiceWordText.text=_ActorLineWord
    end
    HomeViewModel.VoiceObj:SetActive(true)
    if HomeViewModel.isRoleVoice == false then
        return
    end
    MgrSound.PlayRole(_AudioName,nil,nil,false,0,0,tostring(PlayerControl.GetPlayerData().curRoleID))
    HomeViewModel.ListenVoice()
end


---根据当前好感度等级权重随机出本次的好感度交互台词ID
function HomeViewModel.GetCurFavorWords()
    local _CurRoleID = PlayerControl.GetPlayerData().curRoleID
    local _CurRoleFavor=30 --默认100好感度
    local _ActorLinesType=tonumber(RoleattributeLocalData.tab[_CurRoleID][3])  --当前台词组别
    local _tempActorLineIdTab={}  --临时表存储对应的文本台词ID和对应权重

    local _CurTotalSumWeight=0 --当前总权重值
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == _ActorLinesType and value[4] == 5 then
            ---切割对应的触发条件得到条件表
            local _TempVarTab= string.split(value[5],"_")
            local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,_CurRoleFavor)
            if _ReturnVar ~= false then
                ---插入 台词ID 达标的权重值*1000+表中已存的权重值
                ---按顺序插入累加的权重值，通过分段记录的权重值来判断本次随机出来的值属于哪个区间
                ---Etc tab[1]切割出的权值为0.8  tab[2]切割出的权值为1.5 tab[3]切割出的权值为2.8
                ---    对应tab[1]存储的权值字段为800 tab[2]为800+1500 tab[3]为800+1500+2800
                ---    随机一个整数在(1,max) max本轮为800+1500+2800
                ---    遍历表中判断迭代更新大于这个随机数的字段的下标
                ---    假设本轮随机数为1300 则tab[1]符合 tab[2]符合 最中迭代更新随机数下标为tab[2]
                ---------------------------------------------------------------------
                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
            end
        end
    end
    local _FinalVoiceLineId = HomeViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
    HomeViewModel.PlayTargetRoleAniVoice(_FinalVoiceLineId,HomeViewModel.RandDelayPlayRoleVoice)
end

--- 监听语音是否结束
function HomeViewModel.ListenVoice()
    MgrTimer.AddRepeat("RoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(PlayerControl.GetPlayerData().curRoleID)) then
            HomeViewModel.VoiceObj:SetActive(false)
            HomeViewModel.RangeRoleVoice()
            MgrTimer.Cancel("RoleVoice")
        end
    end,-1,nil)
end
function HomeViewModel.GetPlayId(int_roleid , int_type)
    for id, value in pairs(ActorLinesLocalData.tab) do
        -- statements
        if value[2] == int_roleid and value[4] == int_type then
           return value[1]
        end
    end
end
HomeViewModel.LastBatteryTime=-100  --最后一次提示电量的时间,间隔为5分钟0.08
function HomeViewModel.RangeRoleVoice()
    MgrTimer.AddRepeat("RangeVoice",15,function()
        --先判断时间,如果时间为准点,播放时间,如果电量为准点,播放电量语音
        if  PlayerControl.GetPlayerData().curRoleID == 19000 then

            local timefloat=   Tools.GetTime_float()
            if timefloat- HomeViewModel.LastBatteryTime>0.08 then
                local Battery= MgrSdk.GetBattery()
                if Battery<11 then
                    HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 57))
                    MgrTimer.Cancel("RangeVoice")
                    return
                elseif Battery<31 then
                    HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 56))
                    MgrTimer.Cancel("RangeVoice")
                    return
                elseif Battery<51 then
                    HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 55))
                    MgrTimer.Cancel("RangeVoice")
                    return
                end

            end
            HomeViewModel.LastBatteryTime=timefloat
            print(timefloat) --0.02误差内都可以播放准时语音
            if  timefloat >8.98 and timefloat<9.02 then
                HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 58))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >11.98 and timefloat<12.02 then
                HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 59))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >14.98 and timefloat<15.02 then
                HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 60))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >17.98 and timefloat<18.02 then
                HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 61))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >21.98 and timefloat<22.02 then
                HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 62))
                MgrTimer.Cancel("RangeVoice")
                return
            elseif timefloat >23.98 and timefloat<0.02 then
                HomeViewModel.PlayTargetRoleAniVoice(HomeViewModel.GetPlayId(PlayerControl.GetPlayerData().curRoleID , 63))
                MgrTimer.Cancel("RangeVoice")
                return
            end



        end

        local _RandId = HomeViewModel.GetRandIndexByHashTab(HomeViewModel._TotalWeight,HomeViewModel.Tab_MainSceneRoleVoiceData)
         print("播放了闲置随机语音".._RandId)
        HomeViewModel.PlayTargetRoleAniVoice(_RandId)
        MgrTimer.Cancel("RangeVoice")
    end,-1,nil)
end

function HomeViewModel.ResetSingleVoiceAudio()
    MgrSound.Stop(3,tostring(PlayerControl.GetPlayerData().curRoleID),false)
    MgrTimer.Cancel("RoleVoice")
    MgrTimer.Cancel("RangeVoice")
end
]]
return HomeViewModel