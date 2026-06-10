-- Code Auto Create Begin
local M = Class('AgePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.AgePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[AgePop_UI].prefab'
    self.Name = 'Form[AgePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'AgePanel','AgePanel',2},{'Title','AgePanel/Title',2},{'tiao','AgePanel/Title/tiao',2},{'ChooseBirthdayPanel','AgePanel/ChooseBirthdayPanel',2},{'Select_Years','AgePanel/ChooseBirthdayPanel/Select_Years',2},{'BirthdayItem','AgePanel/ChooseBirthdayPanel/Select_Years/BirthdayItem',2},{'Select_Month','AgePanel/ChooseBirthdayPanel/Select_Month',2},{'BirthdayItem01','AgePanel/ChooseBirthdayPanel/Select_Month/BirthdayItem',2},{'Img_xian','AgePanel/Img_xian',2},{'Btn_Close','AgePanel/Btn_Close',2},{'Image','AgePanel/Btn_Close/Image',2},{'Btn_Queren','AgePanel/Btn_Queren',2},{'VerifyPanel','VerifyPanel',2},{'Title01','VerifyPanel/Title',2},{'tiao01','VerifyPanel/Title/tiao',2},{'Image01','VerifyPanel/Image',2},{'Btn_Close01','VerifyPanel/Btn_Close',2},{'Image02','VerifyPanel/Btn_Close/Image',2},{'Btn_Queding','VerifyPanel/Btn_Queding',2},{'Btn_Quxiao','VerifyPanel/Btn_Quxiao',2},
        -- Text 列表
        {'Text_Yue','AgePanel/ChooseBirthdayPanel/Text_Yue',3},{'Text_Nian','AgePanel/ChooseBirthdayPanel/Text_Nian',3},
        -- TextMeshProUGUI 列表
        {'Text_Title','AgePanel/Title/Text_Title',20},{'Text_Shuoming1','AgePanel/Text_Shuoming1',20},{'Text_Years','AgePanel/ChooseBirthdayPanel/Select_Years/BirthdayItem/Text_Years',20},{'Text_Month','AgePanel/ChooseBirthdayPanel/Select_Month/BirthdayItem/Text_Month',20},{'Text_Shuoming_1','AgePanel/Text_Shuoming_1',20},{'Text_Shuoming_2','AgePanel/Text_Shuoming_2',20},{'Text_Shuoming_3','AgePanel/Text_Shuoming_3',20},{'Text_Shuoming_4','AgePanel/Text_Shuoming_4',20},{'Text_Shuoming_5','AgePanel/Text_Shuoming_5',20},{'Text_Shuoming_6','AgePanel/Text_Shuoming_6',20},{'Text','AgePanel/Btn_Queren/Text',20},{'Text_Title01','VerifyPanel/Title/Text_Title',20},{'Text_Shuoming101','VerifyPanel/Text_Shuoming1',20},{'Text_Shuoming2','VerifyPanel/Text_Shuoming2',20},{'Text_Shuoming3','VerifyPanel/Text_Shuoming3',20},{'Text01','VerifyPanel/Btn_Queding/Text',20},{'Text02','VerifyPanel/Btn_Quxiao/Text',20},
        -- TMP_InputField 列表
        {'Select_Years01','AgePanel/ChooseBirthdayPanel/Select_Years',21},{'Select_Month01','AgePanel/ChooseBirthdayPanel/Select_Month',21},
    }
end
-- Code Auto Create End
require("LocalData/AgetestLocalData")
function M:OnInit()
    self.VerifyPanel().gameObject:SetActive(false)
    self:InitButton()
    self:UpdateAgePanelText()
end

function M:OnShow(args)

end

function M:InitButton()
    UIEvent.LuaClick(self.Btn_Close().gameObject,function()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    UIEvent.LuaClick(self.Btn_Close01().gameObject,function()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    UIEvent.LuaClick(self.Btn_Queren().gameObject,function()
        ---将C#字符串转换为Lua字符串
        local year1,year2,year3,year4 = string.byte(self.Text_Years():GetParsedText(),1,4)
        self.year = string.char(year1)..string.char(year2)..string.char(year3)..string.char(year4)
        local month1,month2 = string.byte(self.Text_Month():GetParsedText(),1,2)
        if month2 >= 59 then
            self.month = string.char(month1)
        else
            self.month = string.char(month1)..string.char(month2)
        end
        --计算年龄
        if self:CalculateAge(self.year,self.month) then
            self:UpdateVerifyPanelText()
            self.AgePanel().gameObject:SetActive(false)
            self.VerifyPanel().gameObject:SetActive(true)
        end
    end)
    UIEvent.LuaClick(self.Btn_Queding().gameObject,function()
        local age = self.diffYear
        UnityEngine.PlayerPrefs.SetInt(PlayerControl.GetPlayerData().UID .. "Age",age)
        MgrUI.ClosePop(self.Uid)
    end)
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject,function()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI)
    end)
end

function M:CalculateAge(y,m)
    local date = string.split(Global.TimeToDate(MgrNet.GetServerTime()),"-")
    if tonumber(m) > 12 or (tonumber(y) == tonumber(date[1]) and tonumber(m) > tonumber(date[2])) or tonumber(y) > tonumber(date[1]) then
        print("日期异常错误")
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips3"),1},true)
        return false
    end
    self.diffYear = tonumber(date[1]) - y
    self.diffMonth = tonumber(date[2]) - m
    if self.diffMonth < 0 then
        self.diffYear = self.diffYear - 1
    end
    return true
end

function M:UpdateAgePanelText()

end

function M:UpdateVerifyPanelText()
    local content = nil
    for i,v in pairs(AgetestLocalData.tab) do
        local range = string.split(v.age,"_")
        if  tonumber(range[1]) <= self.diffYear and tonumber(range[2]) > self.diffYear then
            content = v
            break
        end
    end
    local txt = string.format(MgrLanguageData.GetLanguageByKey("ui_age_text7"),self.year,self.month,content.title,content.desc1)
    local txt2 = content.desc2
    self.Text_Shuoming2().text = txt
    self.Text_Shuoming3().text = txt2
end

return M