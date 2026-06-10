-- Code Auto Create Begin
local M = Class('Activity_SevenDaySign', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_SevenDaySign.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_SevenDaySign','/',2},{'Activity_ItemSign','SignScroll/Activity_ItemSign',2},{'content','SignScroll/content',2},{'LastDayPanel','LastDayPanel',2},{'Img_Title','Img_Title',2},
        -- UITemplate 列表
        {'Activity_SevenDaySign01','/',10},{'Activity_ItemSign01','SignScroll/Activity_ItemSign',10},
        -- LoopScrollRect 列表
        {'SignScroll','SignScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Shuoming','Text_Shuoming',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.mLastSign = nil
    self.mCreateRoleDays = Global.GetCreateRoleDays()
    self.mSignDay = 0
    self.mSignData = nil
    self.mIsSignFull = nil
    ---注册滑条
    self:InitScroll()
    ---界面初始化
    self:InitUI()
end
---注册滑条
function M:InitScroll()
    ---页签滑条
    self.SignScroll():SetLuaCellEvent(Handle(self, self.ItemSingEvent))
end
function M:ItemSingEvent(trans,idx)
    trans:GetComponent("UITemplate"):SetData({idx,self.mSignData[idx],self.day == idx})
end
---界面初始化
function M:InitUI()
    self.mSignData,self.mIsSignFull = PlayerControl.GetWeekSignData()
    local tSignCount = PlayerControl.GetWeekSignCount()
    self.day = PlayerControl.GetWeekSignState() == true and tSignCount or tSignCount + 1

    ---签到按钮(除最后一个)
    self.SignScroll().totalCount = #self.mSignData - 1
    self.SignScroll():RefillCells()
    ---最后的签到按钮
    self.mLastSign = GameObject.Instantiate(self.Activity_ItemSign().gameObject, self.LastDayPanel().gameObject.transform, false)
    self.mLastSign:GetComponent("UITemplate"):SetData({#self.mSignData,self.mSignData[#self.mSignData],self.day == #self.mSignData})

    self.Activity_ItemSign().gameObject:SetActive(false)
    local remainingDays = (tonumber(SteamLocalData.tab[111009][2])+Global.GetCreateRoleDays()) > 0 and (tonumber(SteamLocalData.tab[111009][2])-Global.GetCreateRoleDays()) or 0
    self.Text_Shuoming().text = MgrLanguageData.GetLanguageByKey("ui_qita_text85")-- .. string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text98"),remainingDays)
end

function M:OnUpdateUI()
    if self.day >= 6 then
        MgrTimer.AddDelayNoName(0,function()
            self.SignScroll():ScrollToCell(5,2000)
        end)
    end
end

return M