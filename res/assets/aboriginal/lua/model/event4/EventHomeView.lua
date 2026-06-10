---外传活动主界面
EventHomeView = {}
local V_BaseUI = nil

local CurActID = nil
local Event4Data = nil

function EventHomeView.Init(BaseUI)
    V_BaseUI = BaseUI

    CurActID = Event4Control.GetCurActID()
    Event4Data = Event4Control.GetEvent4Data()[CurActID]

    ---活动时间
    EventHomeView:ActivityTime()
    ---动态背景
    EventHomeView:ShowBackground()
end

function EventHomeView.OnUpdateUI()
    ---背景音乐
    if Event4Data and Event4Data.music ~= "" then
        MgrSound.PlayBGM(Event4Data.music,0.2,nil,true)
    end

    ---检测所有红点
    Event4Control.CheckAllRedDot()
    ---任务红点
    local taskState = RedDotControl.GetDotData("Event4DailyTask_"..CurActID).State or RedDotControl.GetDotData("Event4Achievement_"..CurActID).State
    V_BaseUI.MissionRedDotIcon().gameObject:SetActive(taskState)
    ---扭蛋红点
    local AwardState = RedDotControl.GetDotData("Event4Award_"..CurActID).State
    V_BaseUI.ShopRedDotIcon().gameObject:SetActive(AwardState)
    ---星变红点
    local XingbianState = RedDotControl.GetDotData("Event4Xingbian_"..CurActID).State
    V_BaseUI.Xinbian_RedDotIcon().gameObject:SetActive(XingbianState)

    ---当前关卡进度
    EventHomeView:CheckCurLevel()
    ---扭蛋币
    local data = Event4Control.GetCurShop():GetCurrencyData()
    MgrRes.LoadSprite(V_BaseUI.Shuliang_Img_Icon(),data.icon)
    V_BaseUI.Shuliang_Text().text = data.count
end
---活动时间
function EventHomeView:ActivityTime()
    local tUTC = SteamLocalData.tab[112011][2]
    ---探索结束时间
    V_BaseUI.Text_Huodongjieshushijian1().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text26")
    ---时间
    local tEndTime = string.split(Event4Data.battleEndTime,'-')
    V_BaseUI.Text_Date1().text = string.format("%s %d/%d/%d %s:%s",tUTC,tEndTime[1],tEndTime[2],tEndTime[3],tEndTime[4],tEndTime[5])
    ---剩余天数
    local remainTime = Event4Control.GetBattleEndTime() - 1
    V_BaseUI.Remainder1().text = EventHomeView:ShowTime(remainTime)
    
    ---兑换结束时间
    V_BaseUI.Text_Huodongjieshushijian2().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text27")
    ---时间
    tEndTime = string.split(Event4Data.endTime,'-')
    V_BaseUI.Text_Date2().text = string.format("%s %d/%d/%d %s:%s",tUTC,tEndTime[1],tEndTime[2],tEndTime[3],tEndTime[4],tEndTime[5])
    ---剩余天数
    remainTime = Event4Control.GetEndTime() - 1
    V_BaseUI.Remainder2().text = EventHomeView:ShowTime(remainTime)

    local tBossData = Event4Control.GetBossChapterData()
    local tState = Global.GetTimeState(tBossData.beginTime, tBossData.endTime)
    if tState == 1 then
        ---Boss开启剩余天数
        local tOpenTime = Event4Control.GetBossOpenTime()
        if tOpenTime > 0 then
            V_BaseUI.Text_BossLock().text = Global.GetRemainTime(tOpenTime)
        end
    elseif tState ==2 then
        V_BaseUI.BossRaid_BossLock().gameObject:SetActive(false)
    elseif tState == 3 then
        V_BaseUI.Text_BossLock().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text50")
    end
end

---当前关卡进度
function EventHomeView:CheckCurLevel()
    local TouchLevel = Event4Control.GetToutchLevel()
    if TouchLevel then
        local pointData = StormControl.GetStormPointByID(TouchLevel.level)

        V_BaseUI.Raid_Text_Guanka().text = pointData.name
    else
        V_BaseUI.Raid_Text_Guanka().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text50")
    end
end

function EventHomeView:ShowBackground()
    local tSpineCfg = MainuiskinLocalData.tab[Event4Data.bgspine]
    if tSpineCfg then
        local coordinate = string.split(tSpineCfg.bgcoordinate,";")
        local x = tonumber(string.split(coordinate[1],",")[1])
        local y = tonumber(string.split(coordinate[1],",")[2])
        local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
        MgrRes.LoadCgSpine(V_BaseUI.Background(), tSpineCfg.id,tSpineCfg.backgroundpic,x,y,scale,tSpineCfg.morning,function(BG)
            Tools.SetLayer(BG,5)
        end,true)
    end
end
--剩余天数(小于1天返回小时)
function EventHomeView:ShowTime(_remainTime)
    local tStr = ""
    if _remainTime / (3600*24) >= 1 then
        ---剩余天数
        tStr = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..math.modf(_remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    elseif _remainTime < 0 then
        --活动已结束
        tStr = MgrLanguageData.GetLanguageByKey("assetsscrollitem_tips2")
    else
        ---剩余小时数
        local hour = math.floor(_remainTime / 3600) < 1 and 1 or math.floor(_remainTime / 3600)
        tStr = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
    
    return tStr
end

return EventHomeView