-- Code Auto Create Begin
local M = Class('SweepPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SweepPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SweepPop_UI].prefab'
    self.Name = 'Form[SweepPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Panel','Panel',2},{'Img_Xian1','Img_Xian1',2},{'Img_Xian2','Img_Xian2',2},{'Btn_Enter','Btn_Enter',2},{'Img_Sycs','Img_Sycs',2},{'Img_Sytl','Img_Sytl',2},{'icon','Img_Sytl/icon',2},{'Img_you','Img_Sytl/Text_SytlTargetNum/Img_you',2},{'Img_Biaotixian3','Img_Biaotixian3',2},{'Btn_Max','Btn_Max',2},{'Img_Maxdi','Btn_Max/Img_Maxdi',2},{'Btn_Min','Btn_Min',2},{'Img_Mindi','Btn_Min/Img_Mindi',2},{'Btn_Add','Btn_Add',2},{'Img_AddD','Btn_Add/Img_AddD',2},{'Img_Add','Btn_Add/Img_Add',2},{'Btn_Sub','Btn_Sub',2},{'Img_SubD','Btn_Sub/Img_SubD',2},{'Img_Sub','Btn_Sub/Img_Sub',2},{'Img_Cishudi','Img_Cishudi',2},{'Img_Biaotixian2','Img_Biaotixian2',2},{'Img_Biaotixian1','Img_Biaotixian1',2},
        -- TextMeshProUGUI 列表
        {'Text_Kaishisaodang','Btn_Enter/Text_Kaishisaodang',20},{'Text_Sycs','Img_Sycs/Text_Sycs',20},{'Text_SycsNum','Img_Sycs/Text_SycsNum',20},{'Text_Sytl','Img_Sytl/Text_Sytl',20},{'Text_SytlTargetNum','Img_Sytl/Text_SytlTargetNum',20},{'Text_SytlNum','Img_Sytl/Text_SytlTargetNum/Img_you/Text_SytlNum',20},{'Text_Saodangxiaohao','Text_Saodangxiaohao',20},{'Text_Max','Btn_Max/Text_Max',20},{'Text_Min','Btn_Min/Text_Min',20},{'Text_Count','Img_Cishudi/Text_Count',20},{'Text_Saodangcishu','Text_Saodangcishu',20},{'Text_Name','Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    Event.Add("PlayerLevelUp_Pop", StormViewModel.PlayerLevelUp_Pop)
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
        if self.maxCount < 1 then
            self:SetNumber(1)
        else
            self:SetNumber(self.maxCount)
        end
    end)
    ---增加
    UIEvent.AlwaysLongClick(self.Btn_Add().gameObject,function()
        self:SetNumber(self.curCount + 1)
    end)
    ---点击开始扫荡
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        if self.vigor * self.curCount > self.pVigor then
            if self.consumeNum == 200000 then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("sweeppoppvp_ui_tips1"),1},true)
                MgrUI.ClosePop(self.Uid)
                return
            else
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("sweeppoppvp_ui_tips3"),1},true)
                MgrUI.ClosePop(self.Uid)
                return
            end
        end
        if self.curCount == 0 and (self.pData.scrollType == 13 or self.pData.scrollType == 14) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_meizhoufuben_text1"),2},true)
            MgrUI.ClosePop(self.Uid)
            return
        end
        local tab = {
            levelID = self.pData.id,
            frequency = self.curCount
        }
        ---序列化
        local bytes = assert(pb.encode('PBClient.ClientSweepLevelStarREQ',tab))
        ItemControl.AckError = true
        TaskControl.AckError = true
        ---发送结算请求
        MgrNet.SendReq(MID.CLIENT_SWEEP_LEVEL_STAR_REQ,bytes,0,nil, function(buffer,tag)
            local recAck = assert(pb.decode('PBClient.ClientSweepLevelStarACK',buffer))
            if recAck.errNo ~= 0 then
                if recAck.errNo == 575 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("sweeppoppvp_ui_tips4"),2},true)
                end
                Log.Error("扫荡失败:"..recAck.errNo)
            end
        end, function(buffer,tag)
            local recNtf = assert(pb.decode('PBClient.ClientSweepLevelStarNTF',buffer))
            BlueprintViewModel.SetWeekRaidNum(recNtf.bpWeekRaidNum);
            ---更新数据统计
            TaskControl.ChangeStatistics(recNtf.day,recNtf.week,recNtf.month,recNtf.glory)
            ---获取玩家数据
            local player = PlayerControl.GetPlayerData()
            if recNtf.weekCopyNum then
                StormControl.SaveWeekBossTime(recNtf.weekCopyNum, recNtf.weekCopyNumTotal)
            end
            ---检查是否升级
            PlayerControl.CheckLevelUp(recNtf.userLevel)
            ---更新体力
            player:PushVigor(recNtf.vigor)
            ---结算扣除
            ItemControl.PushGroupItemData(recNtf.cost,ItemControl.PushEnum.consume)
            ---更新物品奖励
            ItemControl.PushGroupItemData(recNtf.reward,ItemControl.PushEnum.add)
            ---获取经验差
            local offsetExp = recNtf.userExp - player.exp
            ---更新玩家经验
            player:PushExp(recNtf.userExp)
            ---更新玩家等级
            player:PushLevel(recNtf.userLevel)
            ---如果升级
            --if player.isLevelUp then
            --    --MgrUI.Pop(UID.PlayerLevelUp_UI,{player.vigor,player.level,player.exp},true)
            --    Event.Go("PlayerLevelUp_Pop",{player.vigor,player.level,player.exp})
            --    PlayerControl.PushLevelUpState(false)
            --end
            ---打开扫荡结算窗口 扫荡结果分批显示
            --查询是否存在非固定数量材料
            local id_avg_Remainder_pairs = {}
            for i = 1, #recNtf.reward do
                local num1,num2 = math.modf(recNtf.reward[i].goodsNum / self.curCount)
                table.insert(id_avg_Remainder_pairs,{recNtf.reward[i].goodsID, num1, num2})
            end
            --PVE按照战斗次数分多份
            local rest = {}
            for j = 1, #recNtf.reward do
                rest[j] = 0
            end
            local ntfReward = {}
            for i = 1, self.curCount do
                local tab = {}
                if i ~= self.curCount then
                    for j = 1, #recNtf.reward do
                        rest[j] = rest[j] + id_avg_Remainder_pairs[j][3]
                        tab[j] = {goodsID = id_avg_Remainder_pairs[j][1], goodsNum = id_avg_Remainder_pairs[j][2] + math.modf(rest[j]), goodsType = recNtf.reward[j].goodsType}
                        if rest[j] >= 1 then
                            rest[j] = rest[j] - 1
                        end
                    end
                else
                    for j = 1, #recNtf.reward do
                        if id_avg_Remainder_pairs[j][3] > 0 and rest[j] > 0 then
                            tab[j] = {goodsID = recNtf.reward[j].goodsID, goodsNum = id_avg_Remainder_pairs[j][2] + 1, goodsType = recNtf.reward[j].goodsType}
                        else
                            tab[j] = {goodsID = recNtf.reward[j].goodsID, goodsNum = id_avg_Remainder_pairs[j][2], goodsType = recNtf.reward[j].goodsType}
                        end
                    end
                end
                ntfReward[i] = {clone(tab),true}
            end
            MgrUI.Pop(UID.SweepCompletePop_UI,{"Sweeping",clone(ntfReward),offsetExp,self,"PVE",recNtf.reward},true)

            ---通知回调
            if self.callback then
                self.callback()
            end
            ---判断当前扫荡的关卡类型然后记住此次选择
            if StormControl.GetStormScrollById(self.pData.scrollID).type == 0 then  --普通
                StormViewModel.CurChooseNormal = self.pData
            elseif StormControl.GetStormScrollById(self.pData.scrollID).type == 1 then  --资源
                StormViewModel.CurChooseResPoint = self.pData
            elseif StormControl.GetStormScrollById(self.pData.scrollID).type == 2 then  --困难
                StormViewModel.CurChooseHard = self.pData
            elseif StormControl.GetStormScrollById(self.pData.scrollID).type == 3 then  --剧情活动
                StormViewModel.curSelectData = self.pData
            end
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
    ---@type StormPointData
    self.pData = args[1]
    self.callback = args[2]
    if self.pData.type == StormViewModel.PointBattleType.ACTIVITY_BLOODBOSS or self.pData.type == StormViewModel.PointBattleType.ACTIVITY_NEWBOSS then
        self:ActivityBossSweep()
    else
        self:TiliSweep()
    end
    if self.pData.scrollType == 13 then
        self.Text_SycsNum().text = StormControl.GetWeekBossTime()
    elseif self.pData.scrollType == 14 then
        self.Text_SycsNum().text = BlueprintViewModel.WeekRaidNum();
    else
        self.Text_SycsNum().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text104")
    end
end
---活动Boss券扫荡
function M:ActivityBossSweep()
    ---最大选择次数
    self.maxCount = 0
    ---获取关卡消耗
    local tConsume = string.split(self.pData.consume,"_")
    self.consumeNum = tonumber(tConsume[2])
    self.vigor = tonumber(tConsume[3])
    ---获取玩家扫荡道具
    self.pVigor = tonumber(tConsume[2]) == 100001 and PlayerControl.GetVigor() or ItemControl.GetItemByIdAndType(tonumber(tConsume[2]),tonumber(tConsume[1])).count
    if self.pVigor ~= 0 then
        local max = tonumber(SteamLocalData.tab[113008][2])  --单次扫荡最大次数
        self.maxCount = math.floor(self.pVigor/self.vigor)  --实际最大可扫荡次数
        if self.maxCount >= max then
            self.maxCount = max
        end
        if self.maxCount == 0 then
            self.maxCount = 1
        end
    else
        Log.Error("关卡道具消耗为0,请检查配置表")
        self.maxCount = 999
    end
    ---设置当前选择次数
    self:SetNumber(1)
    ---扫荡道具名称
    local tItemData = ItemControl.GetItemByIdAndType(tonumber(string.split(self.pData.consume,"_")[2]),tonumber(string.split(self.pData.consume,"_")[1]))
    --self.Text_Sytl().text = tItemData.name
    MgrRes.LoadSprite(self.icon(), tItemData.icon)
end

---体力扫荡
function M:TiliSweep()
    ---最大选择次数
    self.maxCount = 1
    ---获取关卡消耗
    self.vigor = self.pData.consume and tonumber(string.split(self.pData.consume,"_")[3]) or 0
    ---获取玩家体力
    self.pVigor = PlayerControl.GetVigor()
    if self.vigor ~= 0 then
        local max = tonumber(SteamLocalData.tab[113008][2])  --单次扫荡最大次数
        self.maxCount = math.floor(self.pVigor/self.vigor)  --体力最大可扫荡次数
        local BossLeftTime = StormControl.GetWeekBossTime()
        local BossTotalTime = StormControl.GetWeekBossTotalTime()
        if self.pData.scrollType == 13 then
            if self.maxCount >= BossTotalTime then
                self.maxCount = BossTotalTime
                if BossLeftTime < self.maxCount then
                    self.maxCount = BossLeftTime
                end
            end
            if self.maxCount == 0 then
                self.maxCount = 1
            end
        elseif self.pData.scrollType == 14 then
            if self.maxCount >= BlueprintViewModel.WeekRaidTotal() then
                self.maxCount = BlueprintViewModel.WeekRaidTotal();
                if BlueprintViewModel.WeekRaidNum() < self.maxCount then
                    self.maxCount = BlueprintViewModel.WeekRaidNum();
                end
            end
            if self.maxCount == 0 then
                self.maxCount = 1
            end
        else
            if self.maxCount >= max then
                self.maxCount = max
            end
            if self.maxCount == 0 then
                self.maxCount = 1
            end
        end
    else
        Log.Error("关卡体力消耗为0,请检查配置表")
        self.maxCount = 999
    end
    ---设置当前选择次数
    self:SetNumber(1)
    ---扫荡道具名称
    local tItemData = ItemControl.GetItemByIdAndType(tonumber(string.split(self.pData.consume,"_")[2]),tonumber(string.split(self.pData.consume,"_")[1]))
    --self.Text_Sytl().text = tItemData.name
    MgrRes.LoadSprite(self.icon(), tItemData.icon)
end

---设置数量
function M:SetNumber(num)
    if self.vigor * num > self.pVigor and num ~= 1 then
        return
    end
    local BossLeftTime = StormControl.GetWeekBossTime()
    if self.pData.scrollType == 13 then
        if self.maxCount > BossLeftTime then
            self.maxCount = BossLeftTime
        end
    elseif self.pData.scrollType == 14 then
        if self.maxCount > BlueprintViewModel.WeekRaidNum() then
            self.maxCount = BlueprintViewModel.WeekRaidNum();
        end
    end
    self.curCount = num
    if self.curCount > self.maxCount then
        self.curCount = self.maxCount
    end
    if self.curCount < 0 then
        self.curCount = 1
    end

    self.Text_Count().text = self.curCount
    if (self.pVigor - self.vigor * self.curCount) >= 0 then
        self.Text_SytlTargetNum().text = string.format("<color=#FFD341>%s</color>",self.pVigor - self.vigor * self.curCount)
    else
        self.Text_SytlTargetNum().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips11"),self.pVigor)
    end
    self.Text_SytlNum().text = self.pVigor
end

return M