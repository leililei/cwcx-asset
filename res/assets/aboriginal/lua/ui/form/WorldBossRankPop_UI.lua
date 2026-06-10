-- Code Auto Create Begin
local M = Class('WorldBossRankPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WorldBossRankPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WorldBossRankPop_UI].prefab'
    self.Name = 'Form[WorldBossRankPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Mask',2},{'RankRewardPop','RankRewardPop',2},{'bg','RankRewardPop/bg',2},{'Switch','RankRewardPop/bg/Switch',2},{'Img_Fengexian','RankRewardPop/bg/Switch/Img_Fengexian',2},{'Tog_Rank','RankRewardPop/bg/Switch/Tog_Rank',2},{'Rank_h','RankRewardPop/bg/Switch/Tog_Rank/Rank_h',2},{'Img_tiao','RankRewardPop/bg/Switch/Tog_Rank/Rank_h/Img_tiao',2},{'Tog_Reward','RankRewardPop/bg/Switch/Tog_Reward',2},{'Reward_h','RankRewardPop/bg/Switch/Tog_Reward/Reward_h',2},{'Img_tiao01','RankRewardPop/bg/Switch/Tog_Reward/Reward_h/Img_tiao',2},{'Viewport1','RankRewardPop/Viewport1',2},{'Leixing','RankRewardPop/Viewport1/Leixing',2},{'Content','RankRewardPop/Viewport1/RankPanel/RankScroll/Content',2},{'NumberOneself','RankRewardPop/Viewport1/RankPanel/NumberOneself',2},{'Xian','RankRewardPop/Viewport1/RankPanel/NumberOneself/Xian',2},{'Viewport2','RankRewardPop/Viewport2',2},{'Leixing01','RankRewardPop/Viewport2/Leixing',2},{'Content01','RankRewardPop/Viewport2/RewardScroll/Content',2},
        -- Button 列表
        {'Mask01','Mask',4},
        -- UITemplate 列表
        {'WBRankItem2','RankRewardPop/Viewport1/RankPanel/RankScroll/WBRankItem2',10},{'WBRankItem201','RankRewardPop/Viewport1/RankPanel/NumberOneself/WBRankItem2',10},{'WBRewardItem2','RankRewardPop/Viewport2/RewardScroll/WBRewardItem2',10},
        -- LoopScrollRect 列表
        {'RankScroll','RankRewardPop/Viewport1/RankPanel/RankScroll',18},{'RewardScroll','RankRewardPop/Viewport2/RewardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Rank','RankRewardPop/bg/Switch/Tog_Rank/Rank_h/Text_Rank',20},{'Rank','RankRewardPop/bg/Switch/Tog_Rank/Rank',20},{'Text_Reward','RankRewardPop/bg/Switch/Tog_Reward/Reward_h/Text_Reward',20},{'Reward','RankRewardPop/bg/Switch/Tog_Reward/Reward',20},{'Text_Paiming','RankRewardPop/Viewport1/Leixing/Text_Paiming',20},{'Text_Wanjiaxinxi','RankRewardPop/Viewport1/Leixing/Text_Wanjiaxinxi',20},{'Text_Leijijifen','RankRewardPop/Viewport1/Leixing/Text_Leijijifen',20},{'Text_Weishangbang','RankRewardPop/Viewport1/RankPanel/NumberOneself/Text_Weishangbang',20},{'Text_Paiming01','RankRewardPop/Viewport2/Leixing/Text_Paiming',20},{'Text_Paimingjiangli','RankRewardPop/Viewport2/Leixing/Text_Paimingjiangli',20},
    }
end
-- Code Auto Create End
require("LocalData/JcrankrewardLocalData")
---初始化
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Mask().gameObject,Handle(self,self.ClosePop))

    self.toggles = {
        [1] = self.Tog_Rank().gameObject,
        [2] = self.Tog_Reward().gameObject,
    }
    for i,v in pairs(self.toggles) do
        UIEvent.LuaClick(self.toggles[i],function()
            self:SwitchToggle(i)
        end)
    end
    ---注册奖励滑块
    self.RewardScroll():SetLuaCellEvent(Handle(self,self.RewardCellItem))
    ---注册排名滑块
    self.RankScroll():SetLuaCellEvent(Handle(self,self.RankCellItem))
end
---排名滑块回调
function M:RankCellItem(trans,idx)
    if self.pointList ~= nil then
        ---刷新item
        trans:GetComponent("UITemplate"):SetData({self.newPointList[idx],self})
        ---不足20条不请求
        if #self.pointList < 100 then
            return
        end
        ---记录当前索引，防止反复请求
        if self.curRankIdx ~= nil and self.curRankIdx == idx then
            return
        end
        if idx % 100 == 20 then
            self.curRankIdx = idx
            ---若当前条为页内第20条则检查下一页数据完整性（含检测是否为末页）
            local page = math.floor(idx / 100) + 1
            if idx + 100 >= #self.pointList then
                ---为末页直接请求下一页数据
                StormViewModel.SendBossRank(page,function()
                    ---更新排行榜滑块
                    self:ReloadRankView()
                end)
            else
                if StormViewModel.CheckRankPage(page) then
                    ---若下一页数据完整则不做处理
                else
                    ---若不完整则请求下一页数据
                    StormViewModel.SendBossRank(page,function()
                        ---更新排行榜滑块
                        self:ReloadRankView()
                    end)
                end
            end
        elseif idx % 100 == 10 then
            self.curRankIdx = idx
            ---若当前条为页内第10条则检查上一页数据完整性（含检测是否为首页）
            local page = math.floor(idx / 100) - 1
            if page < 0 then
                ---为首页不处理
            else
                if StormViewModel.CheckRankPage(page) then
                    ---若上一页数据完整则不做处理
                else
                    ---若不完整则请求上一页数据
                    StormViewModel.SendBossRank(page,function()
                        ---更新排行榜滑块
                        self:ReloadRankView()
                    end)
                end
            end
        end
    end
end

function M:RewardCellItem(trans,idx)
    ---刷新item
    trans:GetComponent("UITemplate"):SetData({self.rewardPointList[idx],self.BossData,self})
end
function M:SwitchToggle(index)
    for i,v in pairs(self.toggles) do
        if i == index then
            v.transform:GetChild(0).gameObject:SetActive(true)
            v.transform:GetChild(1).gameObject:SetActive(false)
            self.Viewport1().gameObject:SetActive(true)
            self.Viewport2().gameObject:SetActive(false)
            ---刷新滑块
            self:ReloadRankView(true)
            self:ReloadSelfRankView()
        else
            v.transform:GetChild(0).gameObject:SetActive(false)
            v.transform:GetChild(1).gameObject:SetActive(true)
            self.Viewport1().gameObject:SetActive(false)
            self.Viewport2().gameObject:SetActive(true)
            self:ReloadRewardView()
        end
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

---更新显示
function M:OnShow(args)
    self.BossData = args[1]
    ---默认打开排名
    self:SwitchToggle(1)
end

function M:ReloadSelfRankView()
    local selfInfo = StormViewModel.SelfRankInfo
    self.wBRanOne = self.NumberOneself().transform:Find("WBRankItem2").transform:GetComponent("UITemplate")
    if selfInfo.rank == -1 then
        self.wBRanOne.gameObject:SetActive(false)
    else
        self.wBRanOne:SetData({selfInfo,self})
    end
    self.NumberOneself().transform:Find("WBRankItem2/Img_PlayerSelect").gameObject:SetActive(false)
end

---排名滑块刷新
function M:ReloadRankView(isOnce)
    ---刷新滑块
    local scroll = self.RankScroll()
    self.pointList = StormViewModel.GetWorldBossRank(1)
    ---self.pointList需要重排
    self.newPointList = {}
    for i,v in pairs(self.pointList) do
        self.newPointList[v.rank + 1] = self.pointList[i]
    end
    scroll.totalCount = #self.newPointList
    if isOnce then
        ---首次全刷新,若玩家有排名则刷新到玩家位置
        scroll:RefillCells(0)
    else
        ---之后不变位置刷新
        scroll:RefreshCells()
    end
end

function M:ReloadRewardView()
    ---刷新滑块
    local scroll = self.RewardScroll()
    self.rewardPointList = JcrankrewardLocalData.tab
    scroll.totalCount = #self.rewardPointList
    scroll:RefillCells()
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end
return M