-- Code Auto Create Begin
local M = Class('Activity_Plot3', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Plot3.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Plot3','/',2},{'Activity1','Activity1',2},{'01','Activity1/01',2},{'Unlocked','Activity1/Unlocked',2},{'Img_color1','Activity1/Unlocked/Img_color1',2},{'Unlock','Activity1/Unlock',2},{'Img_color','Activity1/Unlock/Img_color',2},{'CoffeeIcon','Activity1/Unlock/CoffeeIcon',2},{'Img_lock','Activity1/Unlock/Img_lock',2},{'Lock','Activity1/Lock',2},{'Img_color01','Activity1/Lock/Img_color',2},{'Img_lock01','Activity1/Lock/Img_lock',2},{'RedDotIcon','Activity1/RedDotIcon',2},{'Activity2','Activity2',2},{'02','Activity2/02',2},{'Unlocked01','Activity2/Unlocked',2},{'Img_color101','Activity2/Unlocked/Img_color1',2},{'Unlock01','Activity2/Unlock',2},{'Img_color02','Activity2/Unlock/Img_color',2},{'CoffeeIcon01','Activity2/Unlock/CoffeeIcon',2},{'Img_lock02','Activity2/Unlock/Img_lock',2},{'Lock01','Activity2/Lock',2},{'Img_color03','Activity2/Lock/Img_color',2},{'Img_lock03','Activity2/Lock/Img_lock',2},{'RedDotIcon01','Activity2/RedDotIcon',2},{'Activity3','Activity3',2},{'03','Activity3/03',2},{'Unlocked02','Activity3/Unlocked',2},{'Img_color102','Activity3/Unlocked/Img_color1',2},{'Unlock02','Activity3/Unlock',2},{'Img_color04','Activity3/Unlock/Img_color',2},{'CoffeeIcon02','Activity3/Unlock/CoffeeIcon',2},{'Img_lock04','Activity3/Unlock/Img_lock',2},{'Lock02','Activity3/Lock',2},{'Img_color05','Activity3/Lock/Img_color',2},{'Img_lock05','Activity3/Lock/Img_lock',2},{'RedDotIcon02','Activity3/RedDotIcon',2},{'Activity4','Activity4',2},{'04','Activity4/04',2},{'Unlocked03','Activity4/Unlocked',2},{'Img_color103','Activity4/Unlocked/Img_color1',2},{'Unlock03','Activity4/Unlock',2},{'Img_color06','Activity4/Unlock/Img_color',2},{'CoffeeIcon03','Activity4/Unlock/CoffeeIcon',2},{'Img_lock06','Activity4/Unlock/Img_lock',2},{'Lock03','Activity4/Lock',2},{'Img_color07','Activity4/Lock/Img_color',2},{'Img_lock07','Activity4/Lock/Img_lock',2},{'RedDotIcon03','Activity4/RedDotIcon',2},{'Activity5','Activity5',2},{'05','Activity5/05',2},{'Unlocked04','Activity5/Unlocked',2},{'Img_color104','Activity5/Unlocked/Img_color1',2},{'Unlock04','Activity5/Unlock',2},{'Img_color08','Activity5/Unlock/Img_color',2},{'CoffeeIcon04','Activity5/Unlock/CoffeeIcon',2},{'Img_lock08','Activity5/Unlock/Img_lock',2},{'Lock04','Activity5/Lock',2},{'Img_color09','Activity5/Lock/Img_color',2},{'Img_lock09','Activity5/Lock/Img_lock',2},{'RedDotIcon04','Activity5/RedDotIcon',2},{'Activity6','Activity6',2},{'06','Activity6/06',2},{'Unlocked05','Activity6/Unlocked',2},{'Img_color105','Activity6/Unlocked/Img_color1',2},{'Unlock05','Activity6/Unlock',2},{'Img_color10','Activity6/Unlock/Img_color',2},{'CoffeeIcon05','Activity6/Unlock/CoffeeIcon',2},{'Img_lock10','Activity6/Unlock/Img_lock',2},{'Lock05','Activity6/Lock',2},{'Img_color11','Activity6/Lock/Img_color',2},{'Img_lock11','Activity6/Lock/Img_lock',2},{'RedDotIcon05','Activity6/RedDotIcon',2},{'Img_ShengYuTian','ActivityTime/Img_ShengYuTian',2},{'Btn_AddPower','Btn_AddPower',2},{'Img_PowerBG','Btn_AddPower/Img_PowerBG',2},{'Img_Tiliicon','Btn_AddPower/Img_Tiliicon',2},
        -- Text 列表
        {'Text_ResTili','Btn_AddPower/Text_ResTili',3},
        -- UITemplate 列表
        {'Activity_Plot301','/',10},
        -- TextMeshProUGUI 列表
        {'Text_EnTitle','Activity1/Unlocked/Text_EnTitle',20},{'Text_Title','Activity1/Unlocked/Text_Title',20},{'Text_num','Activity1/Unlock/Text_num',20},{'Text_CanUnlock','Activity1/Unlock/Text_CanUnlock',20},{'Text_CountDown','Activity1/Lock/Text_CountDown',20},{'Text_EnTitle01','Activity2/Unlocked/Text_EnTitle',20},{'Text_Title01','Activity2/Unlocked/Text_Title',20},{'Text_num01','Activity2/Unlock/Text_num',20},{'Text_CanUnlock01','Activity2/Unlock/Text_CanUnlock',20},{'Text_CountDown01','Activity2/Lock/Text_CountDown',20},{'Text_EnTitle02','Activity3/Unlocked/Text_EnTitle',20},{'Text_Title02','Activity3/Unlocked/Text_Title',20},{'Text_num02','Activity3/Unlock/Text_num',20},{'Text_CanUnlock02','Activity3/Unlock/Text_CanUnlock',20},{'Text_CountDown02','Activity3/Lock/Text_CountDown',20},{'Text_EnTitle03','Activity4/Unlocked/Text_EnTitle',20},{'Text_Title03','Activity4/Unlocked/Text_Title',20},{'Text_num03','Activity4/Unlock/Text_num',20},{'Text_CanUnlock03','Activity4/Unlock/Text_CanUnlock',20},{'Text_CountDown03','Activity4/Lock/Text_CountDown',20},{'Text_EnTitle04','Activity5/Unlocked/Text_EnTitle',20},{'Text_Title04','Activity5/Unlocked/Text_Title',20},{'Text_num04','Activity5/Unlock/Text_num',20},{'Text_CanUnlock04','Activity5/Unlock/Text_CanUnlock',20},{'Text_CountDown04','Activity5/Lock/Text_CountDown',20},{'Text_EnTitle05','Activity6/Unlocked/Text_EnTitle',20},{'Text_Title05','Activity6/Unlocked/Text_Title',20},{'Text_num05','Activity6/Unlock/Text_num',20},{'Text_CanUnlock05','Activity6/Unlock/Text_CanUnlock',20},{'Text_CountDown05','Activity6/Lock/Text_CountDown',20},{'Text_ShiJian','ActivityTime/Text_ShiJian',20},{'Text_ShengYuTian','ActivityTime/Img_ShengYuTian/Text_ShengYuTian',20},{'Text_XiaoShi','ActivityTime/Text_XiaoShi',20},
    }
end
-- Code Auto Create End
require("LocalData/Activitypreview2LocalData")

function M:OnInit()
    self.objectList = {
        self.Activity1().gameObject,
        self.Activity2().gameObject,
        self.Activity3().gameObject,
        self.Activity4().gameObject,
        self.Activity5().gameObject,
        self.Activity6().gameObject,
    }

    self.unlockData = {
        ActivityPlot1 = 0,
        ActivityPlot2 = 0,
        ActivityPlot3 = 0,
        ActivityPlot4 = 0,
        ActivityPlot5 = 0,
        ActivityPlot6 = 0,
    }

    for k,v in pairs(self.unlockData) do
        self:GetLocalUnlockData(k)
    end

end

function M:OnUpdateUI(pData)
    self.pData = pData
    self:RefreshItem()
    self:RefreshRemainTime()
end

function M:RefreshItem()
    ---@type StormPointData[] 关卡信息
    self.activityData = {}
    local scroll = nil
    for k,v in pairs(Activitypreview2LocalData.tab) do
        if tonumber(v[2]) == self.pData[1] then
            scroll = StormControl.GetStormScrollById(tonumber(v[6]))
        end
    end

    for k,v in pairs(scroll.points) do
        table.insert(self.activityData,StormControl.GetStormPointByID(tonumber(v)))
    end
    Global.Sort(self.activityData,{"id"},false)
    for i = 1,#self.objectList do
        ---UI
        local icon = self.objectList[i].transform:Find("Unlocked").transform:GetComponent("Image")
        local title = self.objectList[i].transform:Find("Unlocked").transform:Find("Text_Title").transform:GetComponent("TextMeshProUGUI")
        local Entitle = self.objectList[i].transform:Find("Unlocked").transform:Find("Text_EnTitle").transform:GetComponent("TextMeshProUGUI")
        local Unlock = self.objectList[i].transform:Find("Unlock")
        local costIcon = Unlock.transform:Find("CoffeeIcon").transform:GetComponent("Image")
        local costNum = Unlock.transform:Find("Text_num").transform:GetComponent("TextMeshProUGUI")
        local canUnlockTitle = Unlock.transform:Find("Text_CanUnlock").transform:GetComponent("TextMeshProUGUI")
        local Lock =  self.objectList[i].transform:Find("Lock")
        local countDown = Lock.transform:Find("Text_CountDown").transform:GetComponent("TextMeshProUGUI")
        local RedDotIcon = self.objectList[i].transform:Find("RedDotIcon").transform:GetComponent("Image")

        local data = self.activityData[i]
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(data.activitypreview2,"_")[2]),tonumber(string.split(data.activitypreview2,"_")[1]))  --判断是否解锁的道具
        local needNum = tonumber(string.split(data.activitypreview2,"_")[3])  --解锁所需数量


        local unlocking = true  --是否满足关卡解锁条件
        ---判断是否满足解锁条件
        for type,v in pairs(data.unlocks) do
            if type == 0 then
                if PlayerControl.GetPlayerData().level < v then
                    unlocking = false
                end
            elseif type == 1 then
                unlocking = Global.CheckOnTime(TimeControl.GetTimeTable(v))
                self.PointTimeData = TimeControl.GetTimeTable(v)
            elseif type == 2 then
                unlocking = StormControl.CheckPointPass(v)
            end
        end
        MgrRes.LoadSprite(icon,"ArtGallery/PlotCg/"..data.picture)
        ---如果已通关改变本地数据
        if StormControl.CheckPointPass(data.id) then
            self:PushLocalUnlockData("ActivityPlot"..i,1)
        end
        local frontIndex = i - 1 <= 0 and 1 or i - 1
        local frontData = self.unlockData["ActivityPlot"..frontIndex]  --上个剧情是否解锁
        ---已解锁
        if item.count >= needNum and self.unlockData["ActivityPlot"..i] == 1 then
            Lock.gameObject:SetActive(false)
            Unlock.gameObject:SetActive(false)
            title.gameObject:SetActive(true)
            Entitle.gameObject:SetActive(true)
        else
            ---可解锁
            if unlocking and data:CheckLock() then
                Lock.gameObject:SetActive(false)
                Unlock.gameObject:SetActive(true)
                title.gameObject:SetActive(false)
                Entitle.gameObject:SetActive(false)
                MgrRes.LoadSprite(costIcon,item.icon)
                costNum.text = " ×"..needNum
            else
                ---锁住中
                Lock.gameObject:SetActive(true)
                Unlock.gameObject:SetActive(false)
                title.gameObject:SetActive(false)
                Entitle.gameObject:SetActive(false)
                --local endStr = string.split(self.PointTimeData[7],"-")
                --local endStamp = os.time({year = tonumber(endStr[1]), month = tonumber(endStr[2]), day = tonumber(endStr[3]), hour = tonumber(endStr[4]) , min = tonumber(endStr[5]), sec = tonumber(endStr[6]) })
                --if endStamp - Global.GetCurTime() <= 3600 then  --剩余一个小时
                --    countDown.text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text111"),1)
                --else
                --    local remainTime = math.floor((endStamp - Global.GetCurTime())/3600)
                --    countDown.text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text111"),remainTime)
                --end
                countDown.text = MgrLanguageData.GetLanguageByKey("ui_missionunlock_tips1")
            end
        end

        --红点显示
        if item.count >= needNum and frontData and not StormControl.CheckPointPass(data.id) then
            RedDotIcon.gameObject:SetActive(true)
        else
            RedDotIcon.gameObject:SetActive(false)
        end
        ---点击关卡
        UIEvent.LuaClick(self.objectList[i].gameObject,function()
            if item.count >= needNum and data:CheckLock() and self.unlockData["ActivityPlot"..i] == 1 then
                StormViewModel.CurPointData = data
                ActivityControl.PageType = ActivityControl.activityTypeEnum.WarmUP2
                StormViewModel.OpenStormPlotUI()
            else
                ---解锁材料不够弹出提示
                if item.count < needNum then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text113"),1},true)
                else
                    ---解锁材料足够 且当前为第一个剧情并且未解锁
                    if i == 1 and self.unlockData["ActivityPlot"..i] == 0 and unlocking and data:CheckLock() then
                        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_unlock_tips1"),function()
                            UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID.."ActivityPlot"..i,1)
                            self.unlockData["ActivityPlot"..i] = 1
                            self:RefreshItem()
                        end ,nil,2})
                        ---解锁材料足够 且当前不为第一个剧情并且当前未解锁，上一个剧情已解锁
                    elseif i ~= 1 and self.unlockData["ActivityPlot"..i] == 0 and frontData == 1 and unlocking and data:CheckLock() then
                        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_unlock_tips1"),function()
                            UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID.."ActivityPlot"..i,1)
                            self.unlockData["ActivityPlot"..i] = 1
                            self:RefreshItem()
                        end ,nil,2})
                    else
                        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_missionunlock_tips1"),1},true)
                    end
                end
            end
        end)
    end
end

function M:RefreshRemainTime()
    local timeData = TimeControl.GetTimeTable(ActivityLocalData.tab[self.pData[1]][5])
    local openStr = string.split(Global.TimeToDate(timeData[6]),"-")
    local endStr = string.split(Global.TimeToDate(timeData[7]),"-")
    local endStamp = os.time({year = tonumber(endStr[1]), month = tonumber(endStr[2]), day = tonumber(endStr[3]), hour = tonumber(endStr[4]) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) , min = tonumber(endStr[5]), sec = tonumber(endStr[6]) })

    self.Text_XiaoShi().text =  Global.GetTimeFormat(openStr,endStr)
    --string.format("%s/%s <size=24>%s:%s</size>~%s/%s <size=24>%s:%s</size>",openStr[2],openStr[3],openStr[4],openStr[5],endStr[2],endStr[3],endStr[4],endStr[5])
    --self.Text_ShengYuTian().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text110"),"<color=#ffd451>"..math.floor((endStamp - Global.GetCurTime() < 0 and 0 or endStamp - Global.GetCurTime()) / 86400).."</color>")
    self.Text_ShengYuTian().text = Global.GetRemainTime(endStamp - Global.GetCurTime())
end

---获取本地解锁数据
function M:GetLocalUnlockData(name)
    local v = UnityEngine.PlayerPrefs.GetInt(PlayerControl.GetPlayerData().UID..name)
    if v == nil then
        v = 0
        UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID..name,v)
        self.unlockData[name] = v
    else
        UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID..name,v)
        self.unlockData[name] = v
    end
end

function M:PushLocalUnlockData(name,data)
    UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID..name,data)
    self.unlockData[name] = data
end

return M