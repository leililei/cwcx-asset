-- Code Auto Create Begin
local M = Class('Activity_Huigui', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Huigui.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Huigui','/',2},{'bg_lihui','bg_lihui ',2},{'img_lihui','img_lihui',2},{'btn','btn',2},{'btn_ercipeixun','btn/btn_ercipeixun ',2},{'btn_biexuwanqian','btn/btn_biexuwanqian',2},{'btn_jiarendeai','btn/btn_jiarendeai ',2},{'title','title',2},{'title_erduqicheng','title/title_erduqicheng',2},{'time','title/time',2},
        -- UITemplate 列表
        {'Activity_Huigui01','/',10},
        -- TextMeshProUGUI 列表
        {'txt_jiarendeai','btn/btn_ercipeixun /txt_jiarendeai',20},{'txt_jiarendeai01','btn/btn_biexuwanqian/txt_jiarendeai',20},{'txt_jiarendeai02','btn/btn_jiarendeai /txt_jiarendeai',20},{'txt_time','title/time/txt_time',20},{'txt_time1','title/time/txt_time1',20},
    }
end
-- Code Auto Create End
require("LocalData/SignineventLocalData")
function M:OnInit()
    UIEvent.LuaClick(self.btn_ercipeixun ().gameObject,Handle(self,function ()

    end))

    UIEvent.LuaClick(self.btn_biexuwanqian().gameObject,Handle(self,function ()
     --打开信界面
       MgrUI.GoHide(UID.Huiguixin_UI)
    end))

    UIEvent.LuaClick(self.btn_jiarendeai ().gameObject,Handle(self,function ()
        --签到
       MgrUI.GoHide(UID.Huiguiqiandao_UI)
    end))
end

function M:OnUpdateUI(pData)
    MgrTimer.Cancel("SignBackTimeUpdata")
    self:ShowTime()
end

function M:OnHide()
    MgrTimer.Cancel("SignBackTimeUpdata")
end

function M:ShowTime()
    ---活动时间
    if PlayerControl.GetPlayerData().regression then
        MgrTimer.AddRepeat("SignBackTimeUpdata",0,function ()
            local time = PlayerControl.GetPlayerData().regression
            local serverTime = MgrNet.GetServerTime()
            local tEndTime = time.CloseDAt
            local remainTime = tEndTime - serverTime
            if remainTime <= 0 then
                self.txt_time1().text = "0" .. MgrLanguageData.GetLanguageByKey("dailysign_ui_sky") .. "0" .. MgrLanguageData.GetLanguageByKey("passes_ui_pass_hour")
                return
            end
            local day = math.floor(remainTime/86400)
            local hour = math.floor(remainTime%86400/3600)
            self.txt_time1().text = day .. MgrLanguageData.GetLanguageByKey("dailysign_ui_sky") .. hour .. MgrLanguageData.GetLanguageByKey("passes_ui_pass_hour")
        end)
    end
end

function M:OnClose()
    MgrTimer.Cancel("SignBackTimeUpdata")
end

return M