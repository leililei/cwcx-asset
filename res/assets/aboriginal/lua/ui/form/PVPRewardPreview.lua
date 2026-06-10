-- Code Auto Create Begin
local M = Class('PVPRewardPreview', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPRewardPreview
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPRewardPreview].prefab'
    self.Name = 'Form[PVPRewardPreview]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','Ani/BlurBg',2},{'Img_Xian1','Ani/Img_Xian1',2},{'Img_Xian2','Ani/Img_Xian2',2},{'Img_Tanchuangdi','Ani/Img_Tanchuangdi',2},{'Img_Toumingdi','Ani/Img_Tanchuangdi/Img_Toumingdi',2},{'Img_Biaotixian','Ani/Img_Tanchuangdi/Img_Biaotixian',2},{'Btn_Weekly','Ani/Img_Tanchuangdi/Btn_Weekly',2},{'Btn_Select','Ani/Img_Tanchuangdi/Btn_Weekly/Btn_Select',2},{'Btn_Fight','Ani/Img_Tanchuangdi/Btn_Fight',2},{'Btn_Select01','Ani/Img_Tanchuangdi/Btn_Fight/Btn_Select',2},{'VFXMask','Ani/Img_Tanchuangdi/VFXMask',2},
        -- UITemplate 列表
        {'PVPRewardItem','Ani/Img_Tanchuangdi/VFXMask/RewardScroll/PVPRewardItem',10},
        -- Toggle 列表
        {'Btn_Weekly01','Ani/Img_Tanchuangdi/Btn_Weekly',13},{'Btn_Fight01','Ani/Img_Tanchuangdi/Btn_Fight',13},
        -- RawImage 列表
        {'RewardScroll','Ani/Img_Tanchuangdi/VFXMask/RewardScroll',15},
        -- LoopScrollRect 列表
        {'RewardScroll01','Ani/Img_Tanchuangdi/VFXMask/RewardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Biaoti','Ani/Img_Tanchuangdi/Text_Biaoti',20},{'Text_WeeklyTips_1','Ani/Img_Tanchuangdi/Btn_Weekly/Btn_Select/Text_WeeklyTips_1',20},{'Text_WeeklyTips','Ani/Img_Tanchuangdi/Btn_Weekly/Text_WeeklyTips',20},{'Text_FightTips_1','Ani/Img_Tanchuangdi/Btn_Fight/Btn_Select/Text_FightTips_1',20},{'Text_FightTips','Ani/Img_Tanchuangdi/Btn_Fight/Text_FightTips',20},
    }
end
-- Code Auto Create End
require("LocalData/LowPVPLocalData")
require("LocalData/SeniorPVPLocalData")

function M:OnInit()
    self.RewardScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    ---记录切换
    local togObj =
    {
        [1] = self.Btn_Weekly01(),
        [2] = self.Btn_Fight01()
    }
    for i, v in pairs(togObj) do
        local Btn_Selected = v.transform:Find("Btn_Select").gameObject
        Tools.ToggleValueChange(v,function(isOn)
            Btn_Selected:SetActive(isOn)
            if isOn then
                if i == 1 then
                    self.CurLoopList = self.weeklyList
                    self.Text_WeeklyTips().gameObject:SetActive(false)
                    self.Text_FightTips().gameObject:SetActive(true)
                elseif i == 2 then
                    self.CurLoopList = self.fightList
                    self.Text_WeeklyTips().gameObject:SetActive(true)
                    self.Text_FightTips().gameObject:SetActive(false)
                end
                self:ResetItem(0)
            end
        end,nil)
    end
    self.mask = self:VFXMask().gameObject.transform:GetComponent("SpriteMask")
    ---退出
    UIEvent.LuaClick(self.BlurBg().gameObject,Handle(self, function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end))
    ---退出
    --UIEvent.LuaClick(self.Btn_Return().gameObject,Handle(self, function ()
    --    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    --    MgrUI.ClosePop(self.Uid)
    --end))
end
function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.Btn_Weekly01().isOn = false
    self.Btn_Weekly01().isOn = true
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],idx,self})
end
---设置滑动数据
function M:ResetItem(offset)

    ---设置总数
    self.RewardScroll01().totalCount = #self.CurLoopList
    if offset then
        self.RewardScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.RewardScroll01():RefreshCells()               ---只刷新数据
    end
end

function M:OnShow(data)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    local type = data[1]
    self.PlayerRank = data[2]
    local tab = {}
    self.weeklyList = {}
    self.fightList = {}
    self.RankInfo = {}
    if type == 0 then
        tab = LowPVPLocalData.tab
    elseif type == 1 then
        tab = SeniorPVPLocalData.tab
    end
    for i, v in ipairs(tab) do
        table.insert(self.weeklyList,v[7])
        table.insert(self.fightList,v[8])
        self.RankInfo[v[1]] =
        {
            score = v[4],
            txt = v[2],
            icon = v[3],
            percent = tonumber(v[20])/100
        }
    end
    ---刷新数据
    self.Btn_Weekly01().isOn = true
end

return M