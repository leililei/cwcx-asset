-- Code Auto Create Begin
local M = Class('AgreementPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.AgreementPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[AgreementPop_UI].prefab'
    self.Name = 'Form[AgreementPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'bg','AgreementPop/bg',2},{'Switch','AgreementPop/bg/Switch',2},{'Img_Fengexian','AgreementPop/bg/Switch/Img_Fengexian',2},{'Tog_Rank','AgreementPop/bg/Switch/Tog_Rank',2},{'Rank_h','AgreementPop/bg/Switch/Tog_Rank/Rank_h',2},{'Img_tiao','AgreementPop/bg/Switch/Tog_Rank/Rank_h/Text_Rank/Img_tiao',2},{'Tog_Reward','AgreementPop/bg/Switch/Tog_Reward',2},{'Reward_h','AgreementPop/bg/Switch/Tog_Reward/Reward_h',2},{'Img_tiao01','AgreementPop/bg/Switch/Tog_Reward/Reward_h/Text_Reward/Img_tiao',2},{'Viewport','AgreementPop/Viewport',2},{'Shuoming','AgreementPop/Viewport/Shuoming',2},{'Viewport01','AgreementPop/Viewport/Shuoming/Viewport',2},{'Xian','AgreementPop/Viewport/Xian',2},{'Tog_Agree','AgreementPop/Viewport/Text_Agree/Tog_Agree',2},{'Img','AgreementPop/Viewport/Text_Agree/Tog_Agree/Img',2},{'Image','AgreementPop/Viewport/Text_Agree/Tog_Agree/Img/Image',2},{'Img_Hl','AgreementPop/Viewport/Text_Agree/Tog_Agree/Img/Img_Hl',2},{'Btn_Queding','AgreementPop/Viewport/Btn_Queding',2},
        -- Toggle 列表
        {'Tog_Agree01','AgreementPop/Viewport/Text_Agree/Tog_Agree',13},
        -- TextMeshProUGUI 列表
        {'Text_Rank','AgreementPop/bg/Switch/Tog_Rank/Rank_h/Text_Rank',20},{'Rank','AgreementPop/bg/Switch/Tog_Rank/Rank',20},{'Text_Reward','AgreementPop/bg/Switch/Tog_Reward/Reward_h/Text_Reward',20},{'Reward','AgreementPop/bg/Switch/Tog_Reward/Reward',20},{'Text_Shuoming','AgreementPop/Viewport/Shuoming/Viewport/Content/Text_Shuoming',20},{'Text_Agree','AgreementPop/Viewport/Text_Agree',20},{'Text__Queding','AgreementPop/Viewport/Btn_Queding/Text__Queding',20},
    }
end
-- Code Auto Create End
require("LocalData/AgreeLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.toggles = {
        [1] = self.Tog_Rank().gameObject,
        [2] = self.Tog_Reward().gameObject,
    }
    for i,v in pairs(self.toggles) do
        UIEvent.LuaClick(self.toggles[i],function()
            self:SwitchToggle(i)
        end)
    end
end
function M:SwitchToggle(index)
    for i,v in pairs(self.toggles) do
        if i == index then
            v.transform:GetChild(0).gameObject:SetActive(true)
            v.transform:GetChild(1).gameObject:SetActive(false)
            self.Text_Shuoming().text = AgreeLocalData.tab[index].data
        else
            v.transform:GetChild(0).gameObject:SetActive(false)
            v.transform:GetChild(1).gameObject:SetActive(true)
        end
    end
end
function M:OnShow(args)
    self:SwitchToggle(args[1])
    self.parent = args[2]
    self:InitButton()

    self.Text_Rank().text = AgreeLocalData.tab[args[1]].title
    self.Rank().text = AgreeLocalData.tab[args[1]].title
    self.Text_Reward().text = AgreeLocalData.tab[args[1]+1].title
    self.Reward().text = AgreeLocalData.tab[args[1]+1].title
end

function M:InitButton()
    if self.parent ~= nil then
        self.Text_Agree().gameObject:SetActive(true)
        ---协议
        self.parent.isAgree = UnityEngine.PlayerPrefs.GetInt("Agree") == 1
        self.Tog_Agree01().isOn = UnityEngine.PlayerPrefs.GetInt("Agree") == 1
        Tools.ToggleValueChange(self.Tog_Agree01(),function(isOn)
            if self.parent ~= nil then
                self.parent.isAgree = isOn
                self.parent.Tog_Agree01().isOn = isOn
                if isOn then
                    UnityEngine.PlayerPrefs.SetInt("Agree",1)
                else
                    UnityEngine.PlayerPrefs.SetInt("Agree",0)
                end
            end
        end,nil)
    else
        self.Text_Agree().gameObject:SetActive(false)
    end
    ---关闭
    --UIEvent.LuaClick(self.BlurMask().gameObject,function()
    --    MgrUI.ClosePop(UID.AgreementPop_UI)
    --end)
    UIEvent.LuaClick(self.Btn_Queding().gameObject,function()
        MgrUI.ClosePop(UID.AgreementPop_UI)
    end)
end
function M:OnBackKey()
    MgrUI.ClosePop(UID.AgreementPop_UI)
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end
return M