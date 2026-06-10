-- Code Auto Create Begin
local M = Class('Activity_HalfAnniversary', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_HalfAnniversary.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_HalfAnniversary','/',2},{'Image','Image',2},{'EventName','TitleGroup/EventName',2},{'EventTime','TitleGroup/EventTime',2},{'Btn_Qianwanghuodong','Btn_Qianwanghuodong',2},{'Img_di','Btn_Qianwanghuodong/Img_di',2},{'Img_Raid_En','Btn_Qianwanghuodong/Img_Raid_En',2},{'Text_Raid','Btn_Qianwanghuodong/Text_Raid',2},
        -- UITemplate 列表
        {'Activity_HalfAnniversary01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Date','TitleGroup/EventTime/Text_Date',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Qianwanghuodong().gameObject, Handle(self, function()
        HalfAnniControl.OpenHome()
    end))
end

function M:OnUpdateUI(pData)
    ---该活动在表中只会存在一个
    local tData = HalfAnniControl.GetData()
    ---底图更换
    if tData.resource ~= "0" then
        MgrRes.LoadSprite(self.Activity_HaiYueHuanShuo(),"Activity/"..tData.resource,nil,true)
    end
    ---按钮更换
    if tData.icon ~= "0" then
        MgrRes.LoadSprite(self.Btn_Enter(),"Activity/"..tData.icon,nil,true)
    end
    ---活动时间
    local tEndTime = string.split(tData.endTime,'-')
    local tBattleEndTime = string.split(tData.battleEndTime,'-')
    local beginTime = string.split(tData.beginTime,'-')
    ---兌換時間
    --self.Text_Active().text = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text2")
    local _time = beginTime[2].."/"..beginTime[3].." "..beginTime[4]..":"..beginTime[5].."~"..
            tEndTime[2].."/"..tEndTime[3].." "..tEndTime[4]..":"..tEndTime[5]
    self.Text_Date().text = _time
    -----作戰時間
    --self.Text_Challenge().text = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text1")
    --_time = beginTime[2].."/"..beginTime[3].." "..beginTime[4]..":"..beginTime[5].."~"..
    --        tBattleEndTime[2].."/"..tBattleEndTime[3].." "..tBattleEndTime[4]..":"..tBattleEndTime[5]
    --self.Text_ChallengeTime().text = _time
end
return M