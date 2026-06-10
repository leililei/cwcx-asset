-- Code Auto Create Begin
local M = Class('Activity_discountshop', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_discountshop.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_discountshop','/',2},{'Btn_Shop','Btn_Shop',2},{'TaskPanel','TaskPanel',2},{'Jiangli','TaskPanel/Jiangli',2},{'Content','TaskPanel/TaskAwardScroll/Content',2},{'Btn_UnTaskceive','TaskPanel/Btn_UnTaskceive',2},{'Btn_TaskCeive','TaskPanel/Btn_TaskCeive',2},{'ImgFund2TimeBg','ImgFund2TimeBg',2},
        -- UITemplate 列表
        {'Activity_discountshop01','/',10},{'Fund2TaskItem','TaskPanel/TaskAwardScroll/Fund2TaskItem',10},
        -- LoopScrollRect 列表
        {'TaskAwardScroll','TaskPanel/TaskAwardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Jifendianshu','Jifendianshu/Text_Jifendianshu',20},{'Text_Point','Jifendianshu/Text_Point',20},{'Text_Jiangli','TaskPanel/Jiangli/Text_Jiangli',20},{'Text_YiJianLingQu','TaskPanel/Btn_UnTaskceive/Text_YiJianLingQu',20},{'Text_YiJianLingQu01','TaskPanel/Btn_TaskCeive/Text_YiJianLingQu',20},{'TextFund2Time','ImgFund2TimeBg/TextFund2Time',20},
    }
end
-- Code Auto Create End
require("LocalData/DiscountactivityLocalData")
function M:OnInit()
    self:InitBtn()
    self.TaskAwardScroll():SetLuaCellEvent(Handle(self, self.MissionCell))
    self.Fund2TaskItem().gameObject:SetActive(false)
end

function M:InitBtn()
    UIEvent.LuaClick(self.Btn_Shop().gameObject,function()
        MgrUI.GoHide(UID.DiscountShop_UI)
    end)
    --一键领取
    UIEvent.LuaClick(self.Btn_TaskCeive().gameObject,function()
        ActivityControl.RewardSendReq(self.id,0,0,function()
            self:ReloadMission(0)
            --Event.Go("ActivityDot")
        end)
    end)
end

function M:OnUpdateUI(pData)
    self.id = pData[1]
    self:ReloadMission(0)
    if self.pData then
        local bTime = string.split(self.pData.beginTime,'-')
        local eTime = string.split(self.pData.endTime,'-')
        local bTimeText = bTime[1].."/".. bTime[2].."/"..bTime[3] .. " " .. bTime[4]..":"..bTime[5]
        local eTimeText = eTime[1].."/".. eTime[2].."/"..eTime[3] .. " " .. eTime[4]..":"..eTime[5]
        self.TextFund2Time().text = bTimeText .. " - " .. eTimeText
    end
end

function M:GetMissionList()
    self.missionList = {}
    self.pData = ActivityControl.GetCurActivityByID(self.id)
    local tPoint = string.format("%.2f",self.pData.recharge / 10000)
    self.Text_Point().text = string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips9"),tPoint)
    local str = {}
    if self.pData.reward and #self.pData.reward ~= 0 then
        str = string.split(self.pData.reward,",")
    end
    local array = RapidJson.decode(self.pData.reward)
    for k,v in pairs(DiscountactivityLocalData.tab) do
        local arr = {
            id = v[1],
            activityId = v[2],
            money = v[3],
            award = v[4],
            isComplete = ActivityControl.Contains(k,array) == true and 1 or 0,
            isReceive = self.pData.recharge >= v[3] and 1 or 0,
        }
        table.insert(self.missionList,arr)
    end
end

function M:MissionCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.missionList[idx],self})
end

function M:ReloadMission(offset)
    self:GetMissionList()
    table.sort(self.missionList, function(a,b)     --按照是否已完成和已领取排序
        if a.isComplete > b.isComplete then
            return false
        elseif a.isComplete < b.isComplete then
            return true
        else
            if a.isReceive > b.isReceive then
                return true
            elseif a.isReceive < b.isReceive then
                return false
            else
                return a.id < b.id
            end
        end
    end)
    self.TaskAwardScroll().totalCount = #self.missionList
    if offset then
        self.TaskAwardScroll():RefillCells(offset)
    else
        self.TaskAwardScroll():RefreshCells()
    end
    --检查按钮状态
    local state = false
    for i, v in pairs(self.missionList) do
        if v.isComplete == 0 and v.isReceive == 1 then
            state = true
        end
    end
    if state == true then
        self.Btn_UnTaskceive().gameObject:SetActive(false)
        self.Btn_TaskCeive().gameObject:SetActive(true)
    else
        self.Btn_UnTaskceive().gameObject:SetActive(true)
        self.Btn_TaskCeive().gameObject:SetActive(false)
    end
end
return M