--引用
require("ReadData/GameData")
require("JNBattle/JNStrTool")
require("UI/Base/TableToObject")
-- 文件名为 ReadData.lua
-- 定义一个名为 ReadData 的模块
CheckpointData = {}
 
--章节信息表 ,当前章节

CheckpointData.DownChoose_Y=10
CheckpointData.DownChoose_Time=0.3
CheckpointData.DownChoose_Ease=1
--三个任务栏的坐标
CheckpointData.LinePos_X1=1260.8
CheckpointData.LinePos_Y1=958.1
CheckpointData.LinePos_X2=599.8
CheckpointData.LinePos_Y2=926.6
CheckpointData.LinePos_X3=915.4
CheckpointData.LinePos_Y3=543.6
--1260.8, 958.1
--599.8, 926.6
--915.4, 543.6
CheckpointData.SetGlobe_Z_Dt_Time=0.3  --松开地球仪的缓动
CheckpointData.RotX_Time=0.3   --地球仪父节点x轴旋转时间
CheckpointData.RotX_1=0       --旋转的角度
CheckpointData.RotX_0=30    
CheckpointData.RotX_2=-30    
CheckpointData.RotX_3=-40
CheckpointData.RotX_4=60
--选中哪个章节进入的下一关
CheckpointData.SleId=0
CheckpointData.Schedule=100001  --进度
--第一个线的坐标点

CheckpointData.LineWidth=3    --连线的宽度
CheckpointData.ChapterName_index=8
CheckpointData.ChapterIntroduce_index=9

--章节信息坐标 1 -805  间隔185
CheckpointData.point0_X=-805
CheckpointData.point1_X=185

--当前剧情路径
CheckpointData.str_PlotJsonPath=""
--
CheckpointData.SleScrollData=nil
CheckpointData.MainStoryScrollDataTab={}
--生成章节信息
function CheckpointData.CreatRole(GameDataID,lv,startLV,skillLV,isAwaken)
    --根据 GameDataID读表 
local TempId = ""..GameDataID
    
          for k, v in pairs(GameData.tab.roleattribute) do
        --遍历找对应的id
            if GameData.tab.roleattribute[k][1]==TempId then
                -- statements
                RoleRData= GameData.tab.roleattribute[k]
                break
            end
          end
  return tempRole
end
function CheckpointData.GetId(_rank,_scroll,_chapter)
  
   for key, value in pairs(GameData.tab.chapter) do
      if GameData.tab.chapter[key][2]=="".._rank then
        if GameData.tab.chapter[key][3]=="".._scroll then
            if GameData.tab.chapter[key][4]=="".._chapter then
                return GameData.tab.chapter[key][1]
            end
        end 
      end
   end 
   return 0
end

function CheckpointData.GetChapterName(_id)
  for key, value in pairs(GameData.tab.chapter) do
    if GameData.tab.chapter[key][1]==_id then
      return  GameData.tab.chapter[key][CheckpointData.ChapterName_index]
    end
  end
end
function CheckpointData.GetChapterIntroduce(_id)
  for key, value in pairs(GameData.tab.chapter) do
    if GameData.tab.chapter[key][1]==_id then
      return  GameData.tab.chapter[key][CheckpointData.ChapterIntroduce_index]
    end
  end
end

-- @function 创建了一个关卡数据类
function CheckpointData:NewCheckPoint(_CheckPointId,_InfoTab)
  -- statements
  local CheckPoint={}
  setmetatable(CheckPoint, self)
  self.__index=self
  CheckPoint.CheckPointId=_CheckPointId
  CheckPoint.InfoTab=_InfoTab
  CheckPoint.ParentChapterId=_InfoTab[16]
  CheckPoint.ParentScrollId=_InfoTab[15]
  CheckPoint.BattleMode = 0  --0.默认普通 1.困难 2.噩梦
  CheckPoint.IsLock=true
  CheckPoint.IsPlotBefore=false --当前是不是战前剧情关卡
  CheckPoint.IsPlotAfter=false --当前是不是战后剧情关卡
  CheckPoint.ReachTaskCount=0 --最高获得星数
  CheckPoint.IsBossPoint=false
  if _InfoTab[2] == "3" then
    -- 世界BOSS
    CheckPoint.IsBossPoint=true
  else
    CheckPoint.IsBossPoint=false
  end
  return CheckPoint
end

-- @function 创建了一个章节数据类
function CheckpointData:NewChapter(_ChapterId,_InfoTab)
  -- statements
  local Chapter={}
  setmetatable(Chapter, self)
  self.__index=self
  Chapter.ChapterId=_ChapterId
  Chapter.InfoTab=_InfoTab

  Chapter.CheckPointInfoTab={}

  Chapter.Normal_CheckPointIdList=JNStrTool.strSplit(",",_InfoTab[12]) --当前章节中的各种难度子关卡ID的集合list
  Chapter.Hard_CheckPointIdList=JNStrTool.strSplit(",",_InfoTab[13]) --当前章节中的各种难度子关卡ID的集合list
  Chapter.NightMare_CheckPointIdList=JNStrTool.strSplit(",",_InfoTab[14]) --当前章节中的各种难度子关卡ID的集合list
  for key, value in pairs(Chapter.Normal_CheckPointIdList) do
      if value == "0" then
        -- statements
        value=nil
      end
  end
  for key, value in pairs(Chapter.Hard_CheckPointIdList) do
      if value == "0" then
        -- statements
        value=nil
      end
  end
  for key, value in pairs(Chapter.NightMare_CheckPointIdList) do
      if value == "0" then
        -- statements
        value=nil
      end
  end
  Chapter.CurSelectCheckPoint=nil --当前选中的关卡信息
  Chapter.ParentScrollId=_InfoTab[3]
  Chapter.IsLock=true
  Chapter.CurSelectModeType=0 --默认0普通  1.困难  2.噩梦

  Chapter.Normal_ReachTaskCount=30 --各种模式下最高获得星数
  Chapter.Hard_ReachTaskCount=0
  Chapter.NightMare_ReachTaskCount=0

  Chapter.TotalCheckPointCount=0 --当前章节中包含的所有难度关卡总数

  Chapter.Normal_CheckPointCount=TableToObject.GetTableLength(Chapter.Normal_CheckPointIdList) --当前章节中包含的各种难度关卡总数
  Chapter.Hard_CheckPointCount=0
  Chapter.NightMare_CheckPointCount=0
  -- Chapter.Hard_CheckPointCount=TableToObject.GetTableLength(Chapter.Hard_CheckPointIdList) 
  -- Chapter.NightMare_CheckPointCount=TableToObject.GetTableLength(Chapter.NightMare_CheckPointIdList) 

  Chapter.Normal_TotalTaskCount=Chapter.Normal_CheckPointCount*3 --各种模式下总共星数
  Chapter.Hard_TotalTaskCount=Chapter.Hard_CheckPointCount*3
  Chapter.NightMare_TotalTaskCount=Chapter.NightMare_CheckPointCount*3

  for key, value in pairs(GameData.tab.checkpoint) do
      -- statements
      if value[16] == ""..Chapter.ChapterId then
          -- statements
          local _CheckPointData=CheckpointData:NewCheckPoint(value[1],value)
          _CheckPointData.BattleMode=Chapter.CurSelectModeType
          table.insert(Chapter.CheckPointInfoTab, _CheckPointData)
      end
  end
  return Chapter
end


-- @function 创建了一个卷数据类
function CheckpointData:NewScroll(_ScrollId,_ScrollType)
  -- statements
  local Scroll={}
  setmetatable(Scroll, self)
  self.__index=self
  Scroll.ScrollId=_ScrollId
  Scroll.Type=tonumber(_ScrollType)
  Scroll.IsLock=true --当前是否上锁状态
  Scroll.IsNew=false --当前是否为新解锁
  Scroll.Int_MaxChallengeCount=0--当前可最大挑战次数默认0不设置
  Scroll.Int_HasChallengeCount=0--已挑战最大次数
  Scroll.ChapterDataTab={}
  for key, value in pairs(GameData.tab.chapter) do
    -- statements
    if value[2] == _ScrollType then
      if value[3] == "".._ScrollId then
        -- statements
        Scroll.Int_MaxChallengeCount=tonumber(value[18])
        local _ChapterData = CheckpointData:NewChapter(value[1],value)
        table.insert(Scroll.ChapterDataTab,_ChapterData)
        -- print("插入对应章节数据"..value[4])
      end
    end
  end
  Scroll.CurSleChapterIndex = 1 --默认选中卷下的第一个章节
  -- Scroll.CurSleChapterData=Scroll.GetCurChapterData
  -- Scroll.GetCurChapterData = function()
  --   return Scroll.ChapterDataTab[Scroll.CurSleChapterIndex]
  -- end
  return Scroll
end

function CheckpointData.GetNextCheckPointData(_LuaCallName)
  -- 获取当前下一个关卡的信息返回
  if CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex] == nil or
    CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CurSelectCheckPoint ==nil then
    -- 如果当前选择的卷或章节或者关卡为空则默认返回第一章节第一关卡
    -- print("下一关空关卡返回默认第一关")
    return CheckpointData.SleScrollData.ChapterDataTab[1].CheckPointInfoTab[1]
  end
  local _CurCheckPointData=CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CurSelectCheckPoint
  local _OriginCheckPointDataId=_CurCheckPointData.CheckPointId
  local _NextCheckPointInfoTab=JNStrTool.strSplit("_",_CurCheckPointData.InfoTab[20])
  -- print("当前关卡是".._CurCheckPointData.CheckPointId.."解锁了下一关的信息是".._CurCheckPointData.InfoTab[20])
  --根据表中填的主线关卡解锁信息返回
  for key, value in pairs(CheckpointData.MainStoryScrollDataTab) do
    -- statements
    if ""..value.ScrollId==_NextCheckPointInfoTab[3] then
      --匹配到对应的卷id，设置当前选择卷
      CheckpointData.SleScrollData=value
      -- print("下一关卷为第"..value.ScrollId)
      for chapterK, chapterDataV in pairs(value.ChapterDataTab) do
        -- statements
        if ""..chapterDataV.ChapterId==_NextCheckPointInfoTab[2] then
          -- 匹配到对应的章节id，设置当前选择遍历卷的选择章节
          -- print("下一关章节为第"..chapterDataV.ChapterId)
          CheckpointData.SleScrollData.CurSleChapterIndex=tonumber(chapterDataV.InfoTab[4])
        end
      end
    end
  end
  Event.Clear("AwaitCheckPointDataFlushGetNextCheckPointData")
  Event.Add("AwaitCheckPointDataFlushGetNextCheckPointData",function ()
    -- statements
    for checkPointK, checkPointV in pairs(CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CheckPointInfoTab) do
      -- statements
      if ""..checkPointV.CheckPointId==_NextCheckPointInfoTab[1] then
        -- 匹配到对应的关卡id，设置当前选择遍历章节的选择关卡
        print("下一关关卡为第"..checkPointV.CheckPointId)
        CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CurSelectCheckPoint=checkPointV
        if _LuaCallName ~= nil and _LuaCallName ~= "" then
          Event.Go(_LuaCallName)
        end
      end
    end
  end)
  CheckpointData.InitPlayerTargetScroll_ChapterData(CheckpointData.SleScrollData.ScrollId,CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].ChapterId,"AwaitCheckPointDataFlushGetNextCheckPointData")



  -------------------------------------根据当前关卡ID判断下一个关卡信息(是否需要跨章节/卷等)暂时不用此套逻辑-----------------------------------------------
      -- local _IsLastCheckPoint=true
      -- local _CurCheckPointDataIndex=1 --当前关卡的在当前章节数据表中的下标
      -- for key, value in pairs(CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CheckPointInfoTab) do
      --   -- statements
      --   if value.CheckPointId == _CurCheckPointData.CheckPointId then
      --     -- statements
      --     _CurCheckPointDataIndex=key
      --   end
      --   if tonumber(value.CheckPointId) > tonumber(_CurCheckPointData.CheckPointId) then
      --     -- statements
      --     _IsLastCheckPoint=false
      --   end
      -- end
      -- local _CurNextCheckPointData = nil  --当前返回的下个关卡信息
      -- if _IsLastCheckPoint == true then
      --   -- 如果是最后一个关卡则返回下个章节的第一个关卡
      --   local _CurScrollChapterCount = TableToObject.GetTableLength(CheckpointData.SleScrollData.ChapterDataTab)
      --   if CheckpointData.SleScrollData.CurSleChapterIndex >= _CurScrollChapterCount then
      --     -- 本卷最后一章跳转到下一卷第一章第一个关卡
      --   else
      --     CheckpointData.SleScrollData.CurSleChapterIndex=CheckpointData.SleScrollData.CurSleChapterIndex+1
      --     _CurNextCheckPointData=CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CheckPointInfoTab[1]
      --   end
      -- else
      --   _CurNextCheckPointData = CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CheckPointInfoTab[_CurCheckPointDataIndex + 1]
      -- end
      -- CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CurSelectCheckPoint=_CurNextCheckPointData
      -- return _CurNextCheckPointData
  -------------------------------------根据当前关卡ID判断下一个关卡信息(是否需要跨章节/卷等)暂时不用此套逻辑-----------------------------------------------
end
----------------------------请求服务器并更新对应卷/章节/关卡信息-------------------------------------------
  --请求服务器更新指定卷中的指定章节信息
  function CheckpointData.InitPlayerTargetScroll_ChapterData(_ScrollId,_ChapterId,_LuaCallName)
    -- statements
    Event.Clear("AwaitScrollDataFlush")
    Event.Clear("AwaitChapterDataFlush")
    Event.Add("AwaitScrollDataFlush",function ()
      -- statements
      CheckpointData.InitPlayerChapterData(_ScrollId,"AwaitChapterDataFlush")
    end)
    Event.Add("AwaitChapterDataFlush",function ()
      -- statements
      CheckpointData.InitPlayerCheckPointData(_ChapterId,_LuaCallName)
    end)
    CheckpointData.InitPlayerScrollData("AwaitScrollDataFlush")
  end
  --请求玩家的卷信息并执行后续Lua回调
  function CheckpointData.InitPlayerScrollData(_LuaCallName)
    -- statements
    HttpCore.RequestGetPlayerScrollData("CheckpointData.RequestInitPlayerScrollData",CheckpointData.RequestInitPlayerScrollData,_LuaCallName)
  end

  -- @function 请求服务器信息更新玩家当前卷信息表
  function CheckpointData.RequestInitPlayerScrollData(_Str,_LuaCallName)
    -- 请求更新玩家卷信息
    local _JsonCount=HttpRequestMGR.Instance:GetJsonListCount(_Str)
    HttpCore.CreatAnalyisJsonData(_Str,"RequestScrollData")
    CheckpointData.MainStoryScrollDataTab={}
    CheckpointData.ResourceScrollDataTab={}
    local _Func_InitScrollDataTab = function (_ScrollType)
      local _Tab_CurCreatedScrollId={}  --当前已经创建的卷ID表
      local _Tab_ReturnScrollData={}  --返回的卷信息表
      for key, value in pairs(GameData.tab.chapter) do
        if value[2] == "".._ScrollType then
          --筛选出主线类型关卡
          local _Bool_IsCreated = false --是否已经创建了当前卷ID
          for i, n in pairs(_Tab_CurCreatedScrollId) do
            -- 遍历暂存的已经创建的卷IDTab
            if n == value[3] then
              _Bool_IsCreated = true
            end
          end
          if not _Bool_IsCreated then
            --当前还没有创建过该ID的卷信息类
            local _ScrollData = CheckpointData:NewScroll(tonumber(value[3]),value[2])
            table.insert(_Tab_ReturnScrollData,_ScrollData)
          end
          table.insert(_Tab_CurCreatedScrollId,value[3])
        end
      end
      return _Tab_ReturnScrollData
    end
    CheckpointData.MainStoryScrollDataTab = _Func_InitScrollDataTab(0)
    CheckpointData.ResourceScrollDataTab = _Func_InitScrollDataTab(1)
    --根据服务器返回信息更新主线卷解锁状态
    for i = 0, _JsonCount - 1, 1 do
      -- statements
      local _ScrollId=HttpCore.GetAnalyisDataByKey("RequestScrollData","",i)
      local _ScrollIdInfoTab=JNStrTool.strSplit("_", _ScrollId)
      for key, value in pairs(CheckpointData.MainStoryScrollDataTab) do
        -- statements
          if ""..value.ScrollId == _ScrollIdInfoTab[1] then
            -- statements
            value.IsLock=false
            if _ScrollIdInfoTab[2] ~= nil then
              -- statements
              value.Int_HasChallengeCount=tonumber(_ScrollIdInfoTab[2])
            end
          end
      end
      for key, value in pairs(CheckpointData.ResourceScrollDataTab) do
        -- statements
          if ""..value.ScrollId == _ScrollIdInfoTab[1] then
            -- statements
            value.IsLock=false
            if _ScrollIdInfoTab[2] ~= nil then
              -- statements
              value.Int_HasChallengeCount=tonumber(_ScrollIdInfoTab[2])
            end
          end
      end
    end
    if _LuaCallName ~=nil and _LuaCallName ~= "" then
      -- statements
      print("Event go ".._LuaCallName)
      Event.Go(_LuaCallName)
    end
  end



  --请求玩家的章节信息并执行后续Lua回调
  function CheckpointData.InitPlayerChapterData(_ScrollId,_LuaCallName)
    -- statements
    HttpCore.RequestGetPlayerChapterData(_ScrollId,"CheckpointData.RequestInitPlayerChapterData",CheckpointData.RequestInitPlayerChapterData,_LuaCallName)
  end

  -- @function 请求服务器信息更新玩家当前章节信息表
  function CheckpointData.RequestInitPlayerChapterData(_Str,_LuaCallName)
    -- 请求更新玩家卷信息
    if CheckpointData.SleScrollData == nil then
      -- statements
      Event.Go("FullLoading_Refresh")
      UISysTools.PopWarn(MgrLanguageData.GetLanguageByKey("checkpointdata_tips1"))
      HttpPostFormSwitch.GoScrollChoose()
      return
    end
    local _JsonCount=HttpRequestMGR.Instance:GetJsonListCount(_Str)
    HttpCore.CreatAnalyisJsonData(_Str,"RequestChapterData")
    local _UnlockChapterIdTab={}
    for i = 0, _JsonCount - 1, 1 do
      -- statements
      local _ChapterId=HttpCore.GetAnalyisDataByKey("RequestChapterData","",i)
      print("解锁_ChapterId".._ChapterId)
      table.insert(_UnlockChapterIdTab,_ChapterId)
    end
    for key, value in pairs(CheckpointData.SleScrollData.ChapterDataTab) do
      -- statements
        for i, n in pairs(_UnlockChapterIdTab) do
          --匹配已经解锁的章节ID
          if ""..n == ""..value.ChapterId then
            -- statements
            value.IsLock=false
          end
        end
    end
    if _LuaCallName ~=nil and _LuaCallName ~= "" then
      -- statements
      print("Event go ".._LuaCallName)
      Event.Go(_LuaCallName)
    end
  end


  --请求玩家的关卡信息并执行后续Lua回调
  function CheckpointData.InitPlayerCheckPointData(_ChapterId,_LuaCallName)
    -- statements
    HttpCore.RequestGetPlayerCheckPointData(_ChapterId,"CheckpointData.RequestInitPlayerCheckPointData",CheckpointData.RequestInitPlayerCheckPointData,_LuaCallName)
  end

  -- @function 请求服务器信息更新玩家当前关卡信息表
  function CheckpointData.RequestInitPlayerCheckPointData(_Str,_LuaCallName)
    -- 请求更新玩家卷信息
    if CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex] == nil then
      -- statements
      Event.Go("FullLoading_Refresh")
      UISysTools.PopWarn(MgrLanguageData.GetLanguageByKey("checkpointdata_tips2"))
      HttpPostFormSwitch.GoScrollChoose()
      return
    end
    HttpCore.CreatAnalyisJsonData(_Str,"RequestCheckPointData")
    local _UnlockCheckPointInfoTab={}
    local _checkpointInfo=HttpCore.GetAnalyisDataByKey("RequestCheckPointData","checkpointInfo")
    local _UnlockCheckPointidTab=JNStrTool.strSplit(",",_checkpointInfo)
    for key, value in pairs(_UnlockCheckPointidTab) do
        -- statements
        local _tempInfoTab=JNStrTool.strSplit("_",value)
        table.insert(_UnlockCheckPointInfoTab,_tempInfoTab)
    end
    for key, value in pairs(CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CheckPointInfoTab) do
      -- statements
        for i, n in pairs(_UnlockCheckPointInfoTab) do
          --匹配已经解锁的章节ID
          if ""..n[1] == ""..value.CheckPointId then
            -- statements
            value.IsLock=false
            value.ReachTaskCount=tonumber(n[2])
          end
        end
    end
    if _LuaCallName ~=nil and _LuaCallName ~= "" then
      -- statements
      print("Event go ".._LuaCallName)
      Event.Go(_LuaCallName)
    end
  end
----------------------------请求服务器并更新对应卷/章节/关卡信息-------------------------------------------


-- ----------------------------点击初始化关卡信息以及跳转-------------------------------------
  function CheckpointData.OnClickInitCurData(_CheckPointData)
    -- statements
    local mTab={} --存id
    local mLv = {}  --等级           
    local mStarLv = {}  --星级   
    local mAwake={} --觉醒 1觉醒 0不觉醒
    local mSkillLv = {}  --技能等级
    local mPos={} --位置 1-18
    local mQoom={}  --额外缩放
    local mIsBoss  ={}  --是否boss 
    local tempMData={}  --读取到的属性
    BattleManager.bgm=_CheckPointData.InfoTab[21]
    -- print( "#############################ChapterId..".._CheckPointData.CheckPointId)
    print( BattleManager.bgm)
    CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CurSelectCheckPoint=_CheckPointData
      --修改关卡信息
      if _CheckPointData.InfoTab[2] ~= "2"  then
        -- statements
            tempMData=_CheckPointData.InfoTab[12]
          
            --先用, 在用 _
            local   temp_data1=  JNStrTool.strSplit(",",tempMData)
                for key, value in pairs(temp_data1) do
                    local temp_data2=JNStrTool.strSplit("_",value)
                    table.insert( mTab, temp_data2[1])  
                    table.insert( mStarLv, temp_data2[2])  
                    table.insert( mLv, temp_data2[3])  
                    table.insert( mAwake, temp_data2[4])  
                    table.insert( mSkillLv, temp_data2[5])  
                    table.insert( mPos, temp_data2[6]) 
                    table.insert( mQoom, temp_data2[7]) 
                    table.insert( mIsBoss, temp_data2[8]) 
                    --table.insert( mTab, temp_data2[1])    
                
                end
                for key, value in pairs(mTab) do
                    print(value)
                    local   tempNum=mPos[key]-1
                    local tempPos_X = math.floor(tempNum/3) 
                    local tempPos_Y =    tempNum%3
                    
                    print(mPos[key].."tempPos_X"..tempPos_X.."tempPos_Y"..tempPos_Y)
                end
                -----赋值
                BattleManager.IdRight=mTab
                -- BattleManager.IdRight={}
                BattleManager.Right_Lv=mLv
                BattleManager.Right_StarLv=mStarLv
                BattleManager.Right_Awake=mAwake
                BattleManager.Right_SkillLv=mSkillLv
                BattleManager.Right_Pos=mPos 
                BattleManager.Right_Qoom=mQoom
                BattleManager.Right_IsBoss=mIsBoss
                JNPlotData.SleMap=_CheckPointData.InfoTab[13]
            
    end
    if  _CheckPointData.InfoTab[2]=="0" then
        BattleManager.FightType=BattleManager.MonsterStandType.MONSTER
        JNPlotData.CurBattleType = 0
        --设置背景

    elseif  _CheckPointData.InfoTab[2]=="1" then
        --BattleManager.FightType=2
        JNPlotData.CurBattleType = 1
    elseif  _CheckPointData.InfoTab[2]=="3" then
        --BattleManager.FightType=2
        JNPlotData.CurBattleType = 1
    else
        --BattleManager.FightType=2
    end

  end
  --跳转
  function CheckpointData.OnNextClick()
    local _CurSleCheckPoint = CheckpointData.SleScrollData.ChapterDataTab[CheckpointData.SleScrollData.CurSleChapterIndex].CurSelectCheckPoint
    if _CurSleCheckPoint.IsLock == true then
        -- statements
        UISysTools.PopWarn(MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"))
        Event.Go("FullLoading_Refresh")
        return
    end
    local _BattleNeedTab=JNStrTool.strSplit("_",_CurSleCheckPoint.InfoTab[5])
    local _NeedIcon=""
    for key, value in pairs(GameData.tab.goods) do
      -- statements
      if value[1] == _BattleNeedTab[1] then
        -- statements
        _NeedIcon=value[4]
      end
    end
    BattleRoleData.CurBattleNeedInfoTab={_BattleNeedTab[2],_NeedIcon}
    JNStrTool.CurBattleUIType=0
    --LuaAudioPlayer.StopFormBGM()
    local PlotDatatab=_CurSleCheckPoint.InfoTab
    BattleRoleData.Int_BattleID=PlotDatatab[1]
    BattleRoleData.Str_BattleLv=_CurSleCheckPoint.BattleMode
    if _CurSleCheckPoint.InfoTab[2] ~= "2" then
        -- 当前为剧情混合关卡
        if PlotDatatab[18] ~="0" and PlotDatatab[18] ~="" then
            -- statements
            JNPlotData.str_BeforePlotJsonPath=PlotDatatab[18]
            JNPlotData.HasBeforePlot=true
            JNPlotData.CurCheckPointPlotType=1
        else
            JNPlotData.HasBeforePlot=false
        end
        if PlotDatatab[19] ~="0" and PlotDatatab[19] ~="" then
            -- statements
            JNPlotData.str_EndPlotJsonPath=PlotDatatab[19]
            JNPlotData.HasEndPlot=true
            JNPlotData.CurCheckPointPlotType=1
        else
            JNPlotData.HasEndPlot=false
        end
        if  JNPlotData.HasEndPlot==false and JNPlotData.HasBeforePlot==false then
            -- 非剧情普通关卡
            JNPlotData.CurCheckPointPlotType=2
        else
            JNPlotData.CurCheckPointPlotType=1
        end
    else
        JNPlotData.CurCheckPointPlotType=0
    end

    if JNPlotData.CurCheckPointPlotType == 1 and JNPlotData.HasBeforePlot==true then
        --如果混合剧情战斗关卡有前置剧情则进入剧情播放
        JNPlotData.CurPlotPlayerType=1
        CheckpointData.str_PlotJsonPath=PlotDatatab[18]
        CheckpointData.PlotInit()
        -- if JNPlotData.HasBeforePlot==true then
        --     -- 如果混合剧情战斗关卡有前置剧情则进入剧情播放
        --     JNPlotData.CurPlotPlayerType=1
        --     M.str_PlotJsonPath=PlotDatatab[18]
        --     M.PlotInit()
        -- end
        elseif JNPlotData.CurCheckPointPlotType == 0 then
            -- statements
            JNPlotData.CurPlotPlayerType=0
            CheckpointData.str_PlotJsonPath=PlotDatatab[18]
            CheckpointData.PlotInit()
    else
        if _CurSleCheckPoint.InfoTab[2]=="0" then
            JNPlotData.CurBattleType = 0
            CMgrCamera.Instance.FightCamera.gameObject:SetActive(true)
            Event.Go("FullLoading_Refresh")
            MgrUI.GoFirst(UID.Battle02_UI)
            CJNBattleMgr.Instance:SetBG(_CurSleCheckPoint.InfoTab[13],false)
            return
        elseif _CurSleCheckPoint.InfoTab[2]=="1" or   _CurSleCheckPoint.InfoTab[2]=="3"then
                JNPlotData.CurBattleType = 1
                CMgrCamera.Instance.FightCamera.gameObject:SetActive(true)
                Event.Go("FullLoading_Refresh")
                MgrUI.GoFirst(UID.Battle02_UI)
                CJNBattleMgr.Instance:SetBG(_CurSleCheckPoint.InfoTab[13],true)
                return
        end
    end

        --  M.str_PlotJsonPath="x-1"
        --     M.PlotInit()
  end
  -- function M.GoNext()
  --     MgrUI.GoFirst(UID.Battle_Choose1)
  -- end
  function CheckpointData.PlotInit()
    CMgrCamera.Instance.FightCamera.gameObject:SetActive(false)
    PlotTabPanel.Instance:PlotInit(CheckpointData.str_PlotJsonPath)
    print("*****************当前剧情的路径"..CheckpointData.str_PlotJsonPath)
    -- MgrUI.Pop(UID.FullLoading)
    MgrTimer.AddDelayNoName(1.5,CheckpointData.CloseAllPOP,nil)
    MgrTimer.AddDelayNoName(0.1,CheckpointData.GOPLOTForm,nil)
  end

  function CheckpointData.CloseAllPOP()
    -- statements
    -- Event.Go("FullLoading_Refresh")
    -- MgrUI.ClosePop(UID.PopLoad)
  end

  function CheckpointData.GOPLOTForm()
    -- statements
    MgrUI.GoFirst(UID.PlotPlayer)
  end


----------------------------点击初始化关卡信息以及跳转-------------------------------------
return CheckpointData