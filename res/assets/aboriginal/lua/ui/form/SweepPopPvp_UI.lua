-- Code Auto Create Begin
local M = Class('SweepPopPvp_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SweepPopPvp_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SweepPopPvp_UI].prefab'
    self.Name = 'Form[SweepPopPvp_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Panel','Panel',2},{'Btn_Enter','Btn_Enter',2},{'Img_Sytl','Img_Sytl',2},{'Image','Img_Sytl/Image',2},{'Img_Sycs','Img_Sycs',2},{'Img_Biaotixian3','Img_Biaotixian3',2},{'Btn_Max','Btn_Max',2},{'Img_Maxdi','Btn_Max/Img_Maxdi',2},{'Btn_Min','Btn_Min',2},{'Img_Mindi','Btn_Min/Img_Mindi',2},{'Btn_Add','Btn_Add',2},{'Img_AddD','Btn_Add/Img_AddD',2},{'Img_Add','Btn_Add/Img_Add',2},{'Btn_Sub','Btn_Sub',2},{'Img_SubD','Btn_Sub/Img_SubD',2},{'Img_Sub','Btn_Sub/Img_Sub',2},{'Img_Cishudi','Img_Cishudi',2},{'Img_Biaotixian2','Img_Biaotixian2',2},{'Img_Biaotixian1','Img_Biaotixian1',2},{'Img_Xian2','Img_Xian2',2},{'Img_Xian1','Img_Xian1',2},
        -- Text 列表
        {'Text_Sytl','Img_Sytl/Text_Sytl',3},
        -- TextMeshProUGUI 列表
        {'Text_Kaishisaodang','Btn_Enter/Text_Kaishisaodang',20},{'Text_SytlTargetNum','Img_Sytl/Text_SytlTargetNum',20},{'Text_Sycs','Img_Sycs/Text_Sycs',20},{'Text_SycsNum','Img_Sycs/Text_SycsNum',20},{'Text_Saodangxiaohao','Text_Saodangxiaohao',20},{'Text_Max','Btn_Max/Text_Max',20},{'Text_Min','Btn_Min/Text_Min',20},{'Text_Count','Img_Cishudi/Text_Count',20},{'Text_Saodangcishu','Text_Saodangcishu',20},{'Text_Name','Text_Name',20},
    }
end
-- Code Auto Create End
require("LocalData/SteamLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击周边
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
    ---最小数
    UIEvent.LuaClick(self.Btn_Min().gameObject,function()
        self:SetNumber(1)
    end)
    ---减少
    UIEvent.AlwaysLongClick(self.Btn_Sub().gameObject,function()
        if self.curCount > 1 then
            self:SetNumber(self.curCount - 1)
        end
    end)
    ---最大数
    UIEvent.LuaClick(self.Btn_Max().gameObject,function()
        self:SetNumber(self.maxCount)
    end)
    ---增加
    UIEvent.AlwaysLongClick(self.Btn_Add().gameObject,function()
        self:SetNumber(self.curCount + 1)
    end)
    ---点击开始连续战斗
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        if self.curCount > self.maxCount then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("sweeppoppvp_ui_tips1"),1},true)
            return
        end

        if self.curCount == 0 then
            MgrUI.ClosePop(self.Uid)
            return
        end
        ---连续战斗(新)
        ---向服务器发送挂机次数
        PVPViewModel.ContinuePVP(self.curCount,function()
            --PVPViewModel.PVPPreviousScore = PVPViewModel.CurRankData.score  --记录开战前PVP分数
            --PVPViewModel.PVPPreviousRank = PVPViewModel.CurRankData.rank    --记录开战前PVP段位
            PVPViewModel.PVPPreviousRank = PVPViewModel.RankLevel
            self.parent:ChangeSweepButtonTxt("ui_quickbattle_text10")
            --self.parent:ChangeStartButton(true)
            self.parent:CalculatePVPTime()
            self.parent:OnOffCalculatePVPTime(true)
            self.parent:UpdataFightCount()
            self.parent.Lock().gameObject:SetActive(true)
        end)
        MgrUI.ClosePop(self.Uid)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(args)
    ---PVP Data
    self.ack = args[1]
    self.ntf = args[2]
    self.parent = args[3]
    ---最大选择次数
    self.maxCount = PVPViewModel.HighCard
    ---设置当前选择次数
    self:SetNumber(1)
end

---设置数量
function M:SetNumber(num)
    ---设置挂机次数
    self.curCount = num
    if self.curCount > self.maxCount then
        self.curCount = self.maxCount
    end
    if self.curCount < 0 then
        self.curCount = 0
    end
    self.Text_Count().text = self.curCount
    self.Text_SytlTargetNum().text = self.curCount .. "/" .. self.maxCount
    ---设置挂机消耗的时长
    local totalTime = PVPViewModel.Continue_PVP_Separate * self.curCount
    local hour = math.modf(totalTime / 3600)
    local min = math.modf(totalTime % 3600 / 60)
    local sec = totalTime % 3600 % 60
    self.Text_SycsNum().text = ((hour>9) and "" or "0") .. hour .. ":" .. ((min>9) and "" or "0") .. min .. ":" .. ((sec>9) and "" or "0") .. sec
end

return M