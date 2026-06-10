require("LocalData/NoticeLocalData")
require("Model/Notice/Data/NoticeData")
---公告管理器
NoticeControl = {}
NoticeControl.cNoticeData1 = {}     ---配置活动公告数据
NoticeControl.cNoticeData2 = {}     ---配置游戏公告数据
NoticeControl.sNoticeData1 = {}     ---服务器活动公告数据
NoticeControl.sNoticeData2 = {}     ---服务器游戏公告数据
NoticeControl.IsCheckVer = false
NoticeControl.sIsNewVer = false

function NoticeControl.InitNoticeData()
    NoticeControl.cNoticeData1 = {}
    NoticeControl.cNoticeData2 = {}
    for i, v in ipairs(NoticeLocalData.tab) do
        local tList = string.split(v.groupid,",")
        if v.type == 1 then
            if NoticeControl.cNoticeData1[tonumber(tList[1])] == nil then
                NoticeControl.cNoticeData1[tonumber(tList[1])] = NoticeData.New()
                NoticeControl.cNoticeData1[tonumber(tList[1])]:PushConfig(v)
            else
                NoticeControl.cNoticeData1[tonumber(tList[1])]:PushNoticeCfg(v)
            end
        elseif v.type == 2 then
            if NoticeControl.cNoticeData2[tonumber(tList[1])] == nil then
                NoticeControl.cNoticeData2[tonumber(tList[1])] = NoticeData.New()
                NoticeControl.cNoticeData2[tonumber(tList[1])]:PushConfig(v)
            else
                NoticeControl.cNoticeData2[tonumber(tList[1])]:PushNoticeCfg(v)
            end
        end
    end
end
--[[已弃用
function NoticeControl.VersionReq()
    if NoticeControl.IsCheckVer then
        return
    end
    ---公告版本的http路径
    local login_url = "&url/noticeVersion"
    MgrNet.HttpPost(string.gsub(login_url,"&url",MgrNet.GetCurLoginServer()),"notice=noticeVersion",function(buffer)
        NoticeControl.CheckVersion(tonumber(buffer))
    end)
end

---检查服务器公告版本一致性
function NoticeControl.CheckVersion(_version)
    NoticeControl.IsCheckVer = true
    local tVersion = UnityEngine.PlayerPrefs.GetInt(string.format("NoticeVersion"))
    if tVersion ~= _version then
        NoticeControl.sNoticeData1 = {}
        NoticeControl.sNoticeData2 = {}
        
        ---发送消息
        ---公告的http路径
        local login_url = "&url/notice"
        MgrNet.HttpPost(string.gsub(login_url,"&url",MgrNet.GetCurLoginServer()),"notice=noticeData",function(buffer)
            NoticeControl.LoadServerData(buffer)

            UnityEngine.PlayerPrefs.SetString("NoticeData",buffer)
            UnityEngine.PlayerPrefs.SetInt("NoticeVersion",_version)

            NoticeControl.sIsNewVer = true
        end)
    else
        local tData = UnityEngine.PlayerPrefs.GetString(string.format("NoticeData"))
        NoticeControl.LoadServerData(tData)
    end
end]]

---检查服务器公告版本一致性
function NoticeControl.GetNotice(callBack)
    NoticeControl.IsCheckVer = true
   
    NoticeControl.sNoticeData1 = {}
    NoticeControl.sNoticeData2 = {}
    
    ---发送消息
    ---公告的http路径
    local login_url = "&url/notice"
    MgrNet.HttpPost(string.gsub(login_url,"&url",MgrNet.GetCurLoginServer()),"notice=noticeData",function(buffer)
        ---解析服务器返回的buffer
        local info = RapidJson.decode(buffer)
        NoticeControl.LoadServerData(info)

        if #info.list == 0 or info.errNo ~= 0 then
            return
        end
        local tData = UnityEngine.PlayerPrefs.GetString(string.format("NoticeData"))
        if tData ~= buffer then
            NoticeControl.sIsNewVer = true
            UnityEngine.PlayerPrefs.SetString("NoticeData",buffer)
        end
        if callBack then
            callBack()
        end 
    end)
end

function NoticeControl.LoadServerData(info)
    if #info.list == 0 or info.errNo ~= 0 then
        return
    end
    ---服务器公告数据(Tag:公告类型;公告组;公告标题;开启时间 Title:公告图片名称;文本标题 Text:内容文本)
    for i, v in ipairs(info.list) do
        local tGroup = string.split(v.group,",")
        if v.type == "1" then
            if NoticeControl.sNoticeData1[tonumber(tGroup[1])] == nil then
                NoticeControl.sNoticeData1[tonumber(tGroup[1])] = NoticeData.New()
                NoticeControl.sNoticeData1[tonumber(tGroup[1])]:PushServerData(v)
            else
                NoticeControl.sNoticeData1[tonumber(tGroup[1])]:PushNoticeData(v)
            end
        elseif v.type == "2" then
            if NoticeControl.sNoticeData2[tonumber(tGroup[1])] == nil then
                NoticeControl.sNoticeData2[tonumber(tGroup[1])] = NoticeData.New()
                NoticeControl.sNoticeData2[tonumber(tGroup[1])]:PushServerData(v)
            else
                NoticeControl.sNoticeData2[tonumber(tGroup[1])]:PushNoticeData(v)
            end
        end
    end
end
---获取活动公告
function NoticeControl.GetActiveNotice()
    local tNotice = {}
    for i, v in pairs(NoticeControl.sNoticeData1) do
        table.insert(tNotice,v)
    end
    Global.Sort(tNotice,{"groupID"},true)
    ---配置数据
    local tCurTime = Global.GetCurTime()
    if tCurTime < 86400 then
        return tNotice
    end
    for i, v in ipairs(NoticeControl.cNoticeData1) do
        if Global.GetTimeByStr(v.openTime) < tCurTime and Global.GetTimeByStr(v.closeTime) > tCurTime then
            table.insert(tNotice,v)                
        end
    end
    
    return tNotice
end
---获取游戏公告
function NoticeControl.GetGameNotice()
    local tNotice = {}
    for i, v in pairs(NoticeControl.sNoticeData2) do
        table.insert(tNotice,v)
    end
    Global.Sort(tNotice,{"groupID"},true)
    ---配置数据
    local tCurTime = Global.GetCurTime()
    if tCurTime < 86400 then
        return tNotice
    end
    for i, v in ipairs(NoticeControl.cNoticeData2) do
        if Global.GetTimeByStr(v.openTime) < tCurTime and Global.GetTimeByStr(v.closeTime) > tCurTime then
            table.insert(tNotice,v)
        end
    end
    
    return tNotice
end
---检查公告红点
function NoticeControl.CheckRedDot()
    if #NoticeControl.GetActiveNotice() == 0 and #NoticeControl.GetGameNotice() == 0 then
        RedDotControl.GetDotData("Notice"):SetState(false)
        return
    end
    
    local cDot = UnityEngine.PlayerPrefs.GetString(string.format("NoticeDot"))
    if cDot ~= MgrHot.CS:GetAppVer() or NoticeControl.sIsNewVer then
        RedDotControl.GetDotData("Notice"):SetState(true)
        UnityEngine.PlayerPrefs.SetString(string.format("NoticeDot"),MgrHot.CS:GetAppVer())
        NoticeControl.sIsNewVer = false
    else
        RedDotControl.GetDotData("Notice"):SetState(false)
    end
end

function NoticeControl.Clear()
--[[    NoticeControl.cNoticeData1 = {}
    NoticeControl.cNoticeData2 = {}]]
    NoticeControl.sNoticeData1 = {}
    NoticeControl.sNoticeData2 = {}
    NoticeControl.IsCheckVer = false
end

return NoticeControl
