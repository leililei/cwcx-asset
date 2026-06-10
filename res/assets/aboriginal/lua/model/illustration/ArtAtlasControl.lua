ArtAtlasControl = {}
require("LocalData/ArtguideLocalData")
require("LocalData/GuidechapterLocalData")
require("LocalData/PlotguideLocalData")
require("LocalData/Cgdex3LocalData")
require("LocalData/Cgdex1LocalData")
require("LocalData/RoleprofileLocalData")
require("LocalData/HomecharacterLocalData")
require("LocalData/DexsortLocalData")
require("LocalData/Plotguide2LocalData")
require("LocalData/Cgdex4LocalData")
require("Model/Illustration/Data/ArtGuideData")
require("Model/Illustration/Data/RolePlotAtlasData")
require("Model/Illustration/Data/RolePlotData_New")

---@type ArtGuideData[] 所有美术鉴赏数据
local ArtGuideList = {}
---当前选中的类型
ArtAtlasControl.CurType = nil
---@type PlotguideLocalData 当前选中的章节
ArtAtlasControl.CurChapter = nil
---当前选中德剧情
ArtAtlasControl.CurPlot = nil

---@type RolePlotData_New[] 角色剧情总览
local rolePlotList = {}
---@type RolePlotData_New[][][] 单个角色剧情数据
local rolePlotData = {}
---@type RolePlotData_New[][] 角色CG数据
local roleCgData = {}
---个人剧情皮肤ID
local CurRoleSkinId = nil

local IsSkinUI = false

function ArtAtlasControl.Init()
    for k,v in pairs(ArtguideLocalData.tab) do
        ArtGuideList[v.sortid] = ArtGuideData.New(v.sortid)
    end
    
    --角色总表数据
    for i, v in pairs(GuidechapterLocalData.tab) do
        if v.typeid == 3 then
            if rolePlotList[v.chapterid] == nil then
                rolePlotList[v.chapterid] = RolePlotData_New.New()
                rolePlotList[v.chapterid]:PushChapter(v)
            end
        end
    end
    --角色剧情数据
    --local idx = 1
    for i, v in pairs(Plotguide2LocalData.tab) do
        if rolePlotData[v.chapterid] == nil then
            rolePlotData[v.chapterid] = {}
        end
        if rolePlotData[v.chapterid][v.skinid] == nil then
            rolePlotData[v.chapterid][v.skinid] = {}
            --idx = 1
        end
        --table.insert(rolePlotData[v.chapterid][v.skinid], RolePlotData_New.New())
        --rolePlotData[v.chapterid][v.skinid][idx]:PushPlot(v)
        --idx = idx + 1
        ---@type RolePlotData_New
        local newRolePlotData = RolePlotData_New.New()
        newRolePlotData:PushPlot(v)
        table.insert(rolePlotData[v.chapterid][v.skinid], newRolePlotData)
    end
    --角色剧情数据
    for i, v in pairs(Cgdex4LocalData.tab) do
        if roleCgData[v.skinid] == nil then
            roleCgData[v.skinid] = {}
            --idx = 1
        end
        --table.insert(roleCgData[v.skinid], RolePlotData_New.New())
        --roleCgData[v.skinid][idx]:PushCG(v)
        --idx = idx + 1
        ---@type RolePlotData_New
        local newRolePlotData = RolePlotData_New.New()
        newRolePlotData:PushCG(newRolePlotData)
        table.insert(roleCgData[v.skinid], newRolePlotData)
    end

    --for k,v in pairs(rolePlotList) do
    --    if roleList[v.roleId] == nil then
    --        roleList[v.roleId] = {}
    --        roleList[v.roleId][v.order] = v
    --    else
    --        roleList[v.roleId][v.order] = v
    --    end
    --end
end

---获取美术鉴赏数据
function ArtAtlasControl.GetArtGuideData()
    local arr = {}
    for k,v in pairs(ArtGuideList) do
        ---如果显示
        if v.visible == 1 then
            table.insert(arr,v)
        end
    end
    Global.Sort(arr,{"id"},false)
    return arr
end

---获取美术鉴赏单个数据
function ArtAtlasControl.GetSingleArtGuideData(type)
    for k,v in pairs(ArtGuideList) do
        if v.type == type then
            return v
        end
    end
    return nil
end

---@return GuidechapterLocalData[] 传入类型获取图鉴对应章节数据
function ArtAtlasControl.GetGuideChapter(type,isSpecial,chapterId)
    local arr = {}
    ---如果是个人剧情
    if type == 3 then
        ---@type RolePlotData_New[]
        local tRoleList = rolePlotData[chapterId]
        for k,v in pairs(tRoleList) do
            arr[#arr + 1] = v
        end

        table.sort(arr,function(a,b)
            return a[1].plot_skinId < b[1].plot_skinId
        end)
        return arr
    elseif type == 2 and chapterId ~= nil then
        for k,v in pairs(GuidechapterLocalData.tab) do
            if v.typeid == type and v.lock == 1 and v.chapterid == chapterId then
                table.insert(arr,v)
            end
        end
        table.sort(arr,function(a,b)
            return a.id < b.id
        end)
    else
        for k,v in pairs(GuidechapterLocalData.tab) do
            if v.typeid == type and v.lock == 1 then
                table.insert(arr,v)
            end
        end
        table.sort(arr,function(a,b)
            return a.id < b.id
        end)
    end
    if #arr >= 10 and isSpecial then
        table.insert(arr,{})
    end
    return arr
end

---@return boolean 检查该剧情是否解锁
function ArtAtlasControl.CheckUnlock(typeId,chapterId)
    ---如果是个人剧情
    if typeId == 3 then
        for k,v in pairs(roleList) do
            if v[1].roleId == chapterId and v[1]:GetShowState() then
                return true
            end
        end
    elseif typeId == 2 then
        for k,v in ipairs(Cgdex1LocalData.tab) do
            if v.typeid == typeId and v.chapterid == chapterId then
                if StormControl.CheckPointPass(v.checkpointid) == true  then
                   return true 
                end
            end
        end
    else
        for k,v in pairs(GuidechapterLocalData.tab) do
            if v.typeid == typeId and v.chapterid == chapterId and v.lock == 1 and StormControl.CheckPointPass(v.checkpointid) then
                return true
            end
        end
    end
    return false
end

---@return PlotguideLocalData[] 传入类型和章节获取剧情数据
function ArtAtlasControl.GetPlotGuide(typeId,chapterId,checkLock)
    local arr = {}
    for k,v in pairs(PlotguideLocalData.tab) do
        if v.typeid == typeId and v.chapterid == chapterId then
            if checkLock then
                ---检查是否解锁
                if v.checkpointid == 0 then
                    table.insert(arr,v)
                else
                    if StormControl.CheckPointPass(v.checkpointid) then
                        table.insert(arr,v)
                    end
                end
            else
                table.insert(arr,v)
            end
        end
    end
    table.sort(arr,function(a,b)
        return a.sortid < b.sortid
    end)
    ---加入空数据让滑块滑动平滑
    for i = 1, 3 do
        arr[#arr + 1] = {
            typeid = -1,
        }
    end
    return arr
end

---@return Cgdex1LocalData[] 获取CG数据
function ArtAtlasControl.GetCgData(type,chapterId)
    local arr = {}
    for k,v in pairs(Cgdex1LocalData.tab) do
        if v.typeid == type and v.chapterid == chapterId then
            if arr[v.groupid] == nil then
                arr[v.groupid] = {}
                arr[v.groupid][v.number] = v
            else
                arr[v.groupid][v.number] = v
            end
        end
    end
    return arr
end

---@param list Cgdex1LocalData[] 获取已解锁Cg数量
function ArtAtlasControl.GetUnlockCgCount(type)
    local count = 0
    local totalCount = 0
    for k,v in pairs(Cgdex1LocalData.tab) do
        if v.typeid == type then
            totalCount = totalCount + 1
            if StormControl.CheckPointPass(v.checkpointid) == true  then
                count = count + 1
            end
        end
    end
    return count,totalCount
end

---获取个人剧情数据
function ArtAtlasControl.GetRoleAtlasData()
    ---@type RolePlotData_New[]
    local arr = {}
    for k,v in pairs(rolePlotList) do
        table.insert(arr,v)
    end
    
    Global.Sort(arr,{"roleId"})
    return arr
end

---某个角色个人剧情的解锁状态
function ArtAtlasControl.CheckUnLockByRoleID(_roleId,_pointId)
    ---@type RolePlotData_New[][]
    local tList = rolePlotData[_roleId]
    if tList == nil then
        return false
    end
    for i, v in pairs(tList) do
        for k, data in pairs(v) do
            if (_pointId == nil and data:CheckUnLock()) or (_pointId and data.plot_point == _pointId and data:CheckUnLock()) then
                return true
            end
        end
    end
    
    return false
end

---@return Plotguide2LocalData[] 传入类型和章节获取剧情数据
function ArtAtlasControl.GetRolePlotGuide(_roleId,_skinId)
    if _skinId == nil then
        return
    end
    local arr = {}
    for k,v in pairs(Plotguide2LocalData.tab) do
        if v.chapterid == _roleId and v.skinid == _skinId then
            if checkLock then
                ---检查是否解锁
                if v.checkpointid == 0 then
                    table.insert(arr,v)
                else
                    if StormControl.CheckPointPass(v.checkpointid) then
                        table.insert(arr,v)
                    end
                end
            else
                table.insert(arr,v)
            end
        end
    end
    table.sort(arr,function(a,b)
        return a.sortid < b.sortid
    end)
    ---加入空数据让滑块滑动平滑
    for i = 1, 3 do
        arr[#arr + 1] = {
            typeid = -1,
        }
    end
    return arr
end

---@return RolePlotData_New
function ArtAtlasControl.GetRolePlot(_roleId)
    return rolePlotList[_roleId]
end

---@return RolePlotData_New[]
function ArtAtlasControl.GetRoleCg(_skinId)
   return roleCgData[_skinId] 
end

---@return Cgdex4LocalData[] 获取CG数据
function ArtAtlasControl.GetRoleCgData(_skinId)
    if _skinId == nil then
        return
    end
    local arr = {}
    for k,v in pairs(Cgdex4LocalData.tab) do
        if v.skinid == _skinId then
            if arr[v.groupid] == nil then
                arr[v.groupid] = {}
                arr[v.groupid][v.number] = v
            else
                arr[v.groupid][v.number] = v
            end
        end
    end
    return arr
end

---获取已解锁Cg数量
function ArtAtlasControl.GetRoleUnlockCgCount(_skinId)
    if _skinId == nil then
        return
    end
    local count = 0
    local totalCount = 0
    for k,v in pairs(Cgdex4LocalData.tab) do
        if v.skinid == _skinId then
            totalCount = totalCount + 1
            if StormControl.CheckPointPass(v.checkpointid) == true  then
                count = count + 1
            end
        end
    end
    return count,totalCount
end
---个人剧情皮肤ID
function ArtAtlasControl.SetRoleSkinId(_skinId)
    CurRoleSkinId = _skinId
end
function ArtAtlasControl.GetRoleSkinId()
    return CurRoleSkinId
end

---获取家园剧情数据
function ArtAtlasControl.GetHomePlotData()
    ---@type ItemData
    local data = nil
    local str = nil
    local arr = {}
    for k,v in pairs(HomecharacterLocalData.tab) do
        if v[17] == 0 then
            str = string.split(v[2],"_")
             data = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
            if data ~= nil and data.count >= 1 then
                table.insert(arr,v)
            end
        end
    end
    return arr
end

---获取音乐数据
function ArtAtlasControl.GetMusicData()
    return Cgdex3LocalData.tab
end

---@param music Cgdex3LocalData 获取下一首音乐
function ArtAtlasControl.GetNextMusic(music)
    local idx = music.sortid + 1 >#Cgdex3LocalData.tab and 1 or music.sortid + 1
    while true do
        if StormControl.CheckPointPass(Cgdex3LocalData.tab[idx].checkpointid) then
            return Cgdex3LocalData.tab[idx]
        else
            idx = idx + 1 >#Cgdex3LocalData.tab and 1 or idx + 1
        end
    end
    return Cgdex3LocalData.tab[1]
end

---获取已解锁音乐数量
function ArtAtlasControl.GetUnlockMusicCount()
    local count = 0
    for k,v in pairs(Cgdex3LocalData.tab) do
        if StormControl.CheckPointPass(v.checkpointid) then
            count = count + 1
        end
    end
    return count
end

---@param music Cgdex3LocalData 获取上一首音乐
function ArtAtlasControl.GetPrevMusic(music)
    local idx = music.sortid - 1 < 1 and #Cgdex3LocalData.tab or music.sortid - 1
    while true do
        if StormControl.CheckPointPass(Cgdex3LocalData.tab[idx].checkpointid) then
            return Cgdex3LocalData.tab[idx]
        else
            idx = idx - 1 < 1 and #Cgdex3LocalData.tab or idx - 1
        end
    end
    return Cgdex3LocalData.tab[1]
end

---@return DexsortLocalData[] 获取图鉴数据
function ArtAtlasControl.GetIllustrationData()
    local arr = {}
    ---列表添加空元素做居中显示
    for i = 1,2 do
        arr[#arr + 1] = {}
    end
    for k,v in ipairs(DexsortLocalData.tab) do
        if v.systemappear == 1 then  --是否显示
            table.insert(arr,v)
        end
    end
    ---列表尾加空元素
    for i = 1,3 do
        arr[#arr + 1] = {}
    end
    return arr
end

---打开剧情图鉴界面 type图鉴表内类型id，chapterId图鉴表内章节划分id(跳转角色剧情是为角色id)
function ArtAtlasControl.OpenPlotAtlasUI(type,chapterId)
    ArtAtlasControl.CurType = type
    ArtAtlasControl.CurChapter = chapterId
    ArtAtlasControl.CurPlot = nil
    MgrUI.GoHide(UID.MainPlot_UI)
end
---是否从图鉴入口进入
function ArtAtlasControl.SetSkinUI(_isIn)
    IsSkinUI = _isIn
end
---是否从图鉴入口进入
function ArtAtlasControl.GetSkinUI()
    return IsSkinUI
end

function ArtAtlasControl.Clear()
    ArtGuideList = {}
    ArtAtlasControl.CurType = nil
    ArtAtlasControl.CurChapter = nil
    ArtAtlasControl.CurPlot = nil
    rolePlotList = {}
    rolePlotData = {}
    roleCgData = {}
    CurRoleSkinId = nil
    IsSkinUI = false
end

return ArtAtlasControl
