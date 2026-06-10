-- Code Auto Create Begin
local M = Class('PlayerLevelUp_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlayerLevelUp_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlayerLevelUp_UI].prefab'
    self.Name = 'Form[PlayerLevelUp_UI]'
    self.Layer = UILayerLv.Guide
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Ani/Mask',2},{'Img_Tanchuangdi','Ani/Img_Tanchuangdi',2},{'Aijisiicon','Ani/Img_Tanchuangdi/Aijisiicon',2},{'Img_Sanjiaoxian1','Ani/Img_Tanchuangdi/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','Ani/Img_Tanchuangdi/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','Ani/Img_Tanchuangdi/Img_Wangdianzuo',2},{'Img_Wangdianyou','Ani/Img_Tanchuangdi/Img_Wangdianyou',2},{'Img_Bian_zuo','Ani/LvInfo/Img_Bian_zuo',2},{'Img_Bian_you','Ani/LvInfo/Img_Bian_you',2},{'Img_Huang','Ani/LvInfo/Img_Huang',2},{'Img_Dengjidi','Ani/LvInfo/Img_Dengjidi',2},{'Img_Jingyantiao','Ani/LvInfo/Img_Jingyantiao',2},{'Img_ExpSlider','Ani/LvInfo/Img_ExpSlider',2},{'Img_Dengjitishengdi','Ani/LvInfo/Img_Dengjitishengdi',2},{'Img_bg','Ani/Content/Detail1/Img_bg',2},{'Img_>','Ani/Content/Detail1/Img_>',2},{'Img_bg01','Ani/Content/Detail2/Img_bg',2},{'Img_>2','Ani/Content/Detail2/Img_>2',2},{'Detail3','Ani/Content/Detail3',2},{'Img_bg02','Ani/Content/Detail3/Img_bg',2},{'Img_>201','Ani/Content/Detail3/Img_>2',2},
        -- TextMeshProUGUI 列表
        {'Text_TouchToExit','Ani/Text_TouchToExit',20},{'Text_LV','Ani/LvInfo/Text_LV',20},{'Text_Dengjitisheng','Ani/LvInfo/Text_Dengjitisheng',20},{'Text_Tilihuifu','Ani/Content/Detail1/Text_Tilihuifu',20},{'Text_OldTili','Ani/Content/Detail1/Text_OldTili',20},{'Text_NewTili','Ani/Content/Detail1/Text_NewTili',20},{'Text_Tilishangxiantisheng','Ani/Content/Detail2/Text_Tilishangxiantisheng',20},{'Text_OldUpperLimit','Ani/Content/Detail2/Text_OldUpperLimit',20},{'Text_NewUpperLimit','Ani/Content/Detail2/Text_NewUpperLimit',20},{'Text_Tilishangxiantisheng01','Ani/Content/Detail3/Text_Tilishangxiantisheng',20},{'Text_OldSupportCount','Ani/Content/Detail3/Text_OldSupportCount',20},{'Text_NewSupportCount','Ani/Content/Detail3/Text_NewSupportCount',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:SetLayer(3600)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Mask().gameObject,Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end))
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        MgrUI.ClosePop(self.Uid)
    end
end
function M:OnShow(data)
    local oldLv = PlayerControl.GetPlayerData().beforeLv
    local vigor = data[1]
    local newLv = data[2]
    local newExp = data[3]
    self.Text_LV().text = newLv
    self.Text_OldTili().text = vigor.vigorNum - PlayerplLocalData.tab[newLv][5]  --消耗后的旧体力
    self.Text_OldUpperLimit().text =  PlayerplLocalData.tab[oldLv][4]            --旧体力上限
    self.Text_NewUpperLimit().text =  PlayerplLocalData.tab[newLv][4]            --新体力上限
    self.Text_NewTili().text = vigor.vigorNum                                    --当前体力
    self.Img_ExpSlider().fillAmount = newExp/PlayerplLocalData.tab[newLv][3]
    self.Text_OldSupportCount().text = PlayerplLocalData.tab[oldLv][6]           --旧助战次数
    self.Text_NewSupportCount().text = PlayerplLocalData.tab[newLv][6]           --新助战次数
    if PlayerplLocalData.tab[oldLv][6] == PlayerplLocalData.tab[newLv][6] then   --判断作战次数是否有变化
        self.Detail3().gameObject:SetActive(false)
    else
        self.Detail3().gameObject:SetActive(true)
    end
    MgrSound.PlayEffect("yx_ui_shengjitankuang_01",1,0,false,0,0,"PlayerLevelUp")
end


return M