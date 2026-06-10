-- Code Auto Create Begin
local M = Class('PVPRankPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPRankPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPRankPop].prefab'
    self.Name = 'Form[PVPRankPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','Ani/BlurBg',2},{'Img_bg1','Ani/Img_bg1',2},{'Img_Xian1','Ani/Img_Xian1',2},{'Img_Xian2','Ani/Img_Xian2',2},{'Img_di','Ani/Img_di',2},{'Btn_Season','Ani/Rank/Btn_Season',2},{'Img_Fg','Ani/Rank/Btn_Season/Img_Fg',2},{'Btn_Percent','Ani/Rank/Btn_Percent',2},{'Img_Fg01','Ani/Rank/Btn_Percent/Img_Fg',2},{'NumberOne','Ani/RankPanel/NumberOne',2},{'Xian','Ani/RankPanel/NumberOne/Xian',2},{'Img_Xian101','Ani/Img_Xian1',2},{'Btn_Return','Ani/Btn_Return',2},{'Btn_Back','Ani/Btn_Back',2},
        -- UITemplate 列表
        {'PVPRankItem','Ani/RankPanel/NumberOne/PVPRankItem',10},
        -- Toggle 列表
        {'Btn_Season01','Ani/Rank/Btn_Season',13},{'Btn_Percent01','Ani/Rank/Btn_Percent',13},
        -- LoopScrollRect 列表
        {'RankScroll','Ani/RankPanel/RankScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_CurRank','Ani/Rank/Btn_Season/Text_CurRank',20},{'Text_CurRank01','Ani/Rank/Btn_Percent/Text_CurRank',20},{'Text_Tips','Ani/Text_Tips',20},{'Text_Title','Ani/Text_Title',20},{'Text_Fanhui','Ani/Btn_Back/Text_Fanhui',20},
    }
end
-- Code Auto Create End
--- 533  643
---初始化
function M:OnInit()
    self.CurLoopList = {}
    self.isFirst = true
    self.CurPack = 0
    self.MaxPack = 0
    self.contentRect = self.RankScroll().gameObject:GetComponent("RectTransform")
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurBg().gameObject,Handle(self,self.ClosePop))
    UIEvent.LuaClick(self.Btn_Return().gameObject,Handle(self,self.ClosePop))

    self.Btn_Season01().isOn = true;
    self.showSeasonRank = true;
    Tools.ToggleValueChange(self.Btn_Season01(), function(isOn)
        if isOn then
            self.showSeasonRank = true;
            self:ReloadRankView(true);
        end
    end);
    Tools.ToggleValueChange(self.Btn_Percent01(), function(isOn)
        if isOn then
            self.showSeasonRank = false;
            self:ReloadRankView(true);
        end
    end);
    ---注册排名滑块
    self.RankScroll():SetLuaCellEvent(Handle(self,self.CellItem))
    self.CurLoopList = {};
    self.championRank = {};
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        MgrUI.ClosePop(self.Uid)
    end
end

---更新显示
function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    ---刷新滑块
    PVPViewModel.GetRankData(PVPViewModel.type,0,0,Handle(self,self.GetRankACK),Handle(self,self.GetRankNTF))
    PVPViewModel.SendGetChampionScoreRankReq(Handle(self, self.OnChampionRank));
end
function M:UpdataPlayerData()
    if self.showSeasonRank and self.lastRankFirst then
        self.NumberOne().gameObject:SetActive(true)
        self.PVPRankItem():SetData({self.lastRankFirst,1,true})
        self.contentRect.sizeDelta = Vector2(995, 533)

    else
        self.NumberOne().gameObject:SetActive(false)
        self.contentRect.sizeDelta = Vector2(995, 643)
    end
end
---排名滑块回调
function M:CellItem(trans,idx)
    if self.showSeasonRank then
        trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],1})
    else
        trans:GetComponent("UITemplate"):SetData({self.championRank[idx],2})
    end
end

---排名滑块刷新
function M:ReloadRankView()
    self:UpdataPlayerData()
    ---刷新滑块
    if self.showSeasonRank then
        self.RankScroll().totalCount = #self.CurLoopList
    else
        self.RankScroll().totalCount = #self.championRank;
    end
    self.RankScroll():RefillCells();
end
function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

---获取排行数据
function M:GetRankACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetHighLadderRankACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvprankpop_tips1"),2},true)
        self:ClosePop()
    end
end
---获取排行数据
function M:GetRankNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetHighLadderRankNTF',buffer))
    self.CurLoopList = {};
    if tab.info then
        for i, v in pairs(tab.info) do
            ---多出来的一条数据不算进去
            if v.rank ~= 101 then
                self.CurLoopList[v.rank + 1] = v
            end
        end
    end
    self.CurPack = tab.pack
    self.MaxPack = tab.maxPack
    if self.CurPack == 0 then
        if tab.lastRankFirst then
            self.lastRankFirst = tab.lastRankFirst
        else
            self.lastRankFirst = nil
        end
    end
    if self.showSeasonRank then
        self:ReloadRankView()
    end
end

function M:OnChampionRank()
    self.championRank = {};
    if nil ~= PVPViewModel.championRank then
        for i, v in pairs(PVPViewModel.championRank) do
            self.championRank[v.rank + 1] = v
        end
    end
    if not self.showSeasonRank then
        self:ReloadRankView()
    end
end

return M