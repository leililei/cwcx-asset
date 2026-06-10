-- Code Auto Create Begin
local M = Class('EventBossPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EventBossPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EventBossPop_UI].prefab'
    self.Name = 'Form[EventBossPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_Back','Btn_Back',2},{'Btn_Mask','Btn_Mask',2},{'ItemDetailPanel','ItemDetailPanel',2},{'Leftpattern','ItemDetailPanel/Leftpattern',2},{'Rightpattern','ItemDetailPanel/Rightpattern',2},{'UpPanel','ItemDetailPanel/UpPanel',2},{'Img_sikadi','ItemDetailPanel/UpPanel/Img_sikadi',2},{'Img_Butterfly','ItemDetailPanel/UpPanel/Img_Butterfly',2},{'Img_sikadiTXT','ItemDetailPanel/UpPanel/Img_Butterfly/Img_sikadiTXT',2},{'Bg_Blood','ItemDetailPanel/UpPanel/BloodLinePanel/Bg_Blood',2},{'Img_BloodLine','ItemDetailPanel/UpPanel/BloodLinePanel/Bg_Blood/Img_BloodLine',2},{'Img_Namebg','ItemDetailPanel/ConditionPanel/Img_Namebg',2},{'Bg_Condition1','ItemDetailPanel/ConditionPanel/Bg_Condition1',2},{'Bg_Condition_hui1','ItemDetailPanel/ConditionPanel/Bg_Condition1/Bg_Condition_hui1',2},{'Bg_Condition2','ItemDetailPanel/ConditionPanel/Bg_Condition2',2},{'Bg_Condition_hui2','ItemDetailPanel/ConditionPanel/Bg_Condition2/Bg_Condition_hui2',2},{'Bg_Condition3','ItemDetailPanel/ConditionPanel/Bg_Condition3',2},{'Bg_Condition_hui3','ItemDetailPanel/ConditionPanel/Bg_Condition3/Bg_Condition_hui3',2},{'RightScrollPanel','ItemDetailPanel/RightScrollPanel',2},{'Viewport','ItemDetailPanel/RightScrollPanel/Viewport',2},{'ItemInfoPanel','ItemDetailPanel/RightScrollPanel/Viewport/ItemInfoPanel',2},{'Img_Namebg01','ItemDetailPanel/RightScrollPanel/Viewport/ItemInfoPanel/Img_Namebg',2},{'ActivityBossRewardScroll','ItemDetailPanel/RightScrollPanel/ActivityBossRewardScroll',2},{'Content','ItemDetailPanel/RightScrollPanel/ActivityBossRewardScroll/Content',2},{'ChallengeButtonPanel','ChallengeButtonPanel',2},{'Img_Tilixiaohaodi','ChallengeButtonPanel/Text_challenge/Img_Tilixiaohaodi',2},{'Img_Ticket','ChallengeButtonPanel/Text_challenge/Img_Ticket',2},{'SweepButtonPanel','SweepButtonPanel',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back01','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},
        -- Text 列表
        {'sikadiTXT','ItemDetailPanel/UpPanel/Img_Butterfly/sikadiTXT',3},{'Text_Level','ItemDetailPanel/UpPanel/Img_Butterfly/Text_Level',3},{'Text_HP','ItemDetailPanel/UpPanel/BloodLinePanel/Text_HP',3},{'Text_Blood_Percent','ItemDetailPanel/UpPanel/BloodLinePanel/Text_HP/Text_Blood_Percent',3},{'Text_Blood','ItemDetailPanel/UpPanel/BloodLinePanel/Text_HP/Text_Blood',3},{'Text_Condition','ItemDetailPanel/ConditionPanel/Img_Namebg/Text_Condition',3},{'Text_Condition1','ItemDetailPanel/ConditionPanel/Bg_Condition1/Text_Condition1',3},{'Text_Condition2','ItemDetailPanel/ConditionPanel/Bg_Condition2/Text_Condition2',3},{'Text_Condition3','ItemDetailPanel/ConditionPanel/Bg_Condition3/Text_Condition3',3},{'Text_Condition01','ItemDetailPanel/RightScrollPanel/Viewport/ItemInfoPanel/Img_Namebg/Text_Condition',3},{'Text_challenge','ChallengeButtonPanel/Text_challenge',3},{'Text_UseTicket','ChallengeButtonPanel/Text_challenge/Img_Ticket/Text_UseTicket',3},{'Text_Ticket','ChallengeButtonPanel/Text_challenge/Img_Ticket/Text_Ticket',3},{'Text_Raid','SweepButtonPanel/Text_Raid',3},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',3},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',3},
        -- Button 列表
        {'ChallengeButtonPanel01','ChallengeButtonPanel',4},{'SweepButtonPanel01','SweepButtonPanel',4},
        -- UITemplate 列表
        {'BossItem','ItemDetailPanel/RightScrollPanel/ActivityBossRewardScroll/BossItem',10},
        -- LoopScrollRect 列表
        {'ActivityBossRewardScroll01','ItemDetailPanel/RightScrollPanel/ActivityBossRewardScroll',18},
    }
end
-- Code Auto Create End
function M:OnShow(pData)
    self.BossItem().gameObject:SetActive(false)
    ---@type StormPointData
    self.pointData = pData[1]
    self.Id = pData[1].id
    self.name = pData[1].name                  --关卡名称
    self.recom_lv = pData[1].recommendLevel    --推荐等级
    self.condition = pData[1].condition
    self.consume = string.split(pData[1].consume,"_")             --战斗消耗
    self.reward = {}
    local data = self.pointData:GetMonsterById(self.pointData.monsters[1].id)
    self.bData = ReadData.GetBossAttr(data.id,data.star,data.level,data.skillLevel,data.awaken)
    ---添加上觉醒属性
    if self.bData.IsAwaken == true then
        for k,v in pairs(self.bData.AwkenFormula) do
            ---HP
            if v[1] == "1" then
                self.bData.HPmax = self.bData.HPmax + tonumber(v[2])
                self.bData.HP = self.bData.HP + tonumber(v[2])
            end
            if v[1] == "2" and self.bData.Occupation ~= 4 then
                self.bData.Atk = self.bData.Atk + tonumber(v[2])
            end
            if v[1] == "3" and self.bData.Occupation == 4  then
                self.bData.Atk = self.bData.Atk + tonumber(v[2])
            end
        end
    end
    for i,v in ipairs(string.split(pData[1].reward,","))  do
        table.insert(self.reward,v)
    end
    for i,v in ipairs(string.split(pData[1].victory,","))  do
        table.insert(self.reward,v)
    end
    if pData[1].drop then
        for i,v in ipairs(string.split(pData[1].drop,","))  do
            table.insert(self.reward,v)
        end
    end
    self.index = pData[2]   --第几个BOSS 1 简单 2 中等 3 困难
    self.info = pData[3]    --从服务器获得的血量数据等信息    ClientLevelInfoNTF

    ---关卡名称
    self.sikadiTXT().text = self.name
    ---推荐等级
    self.Text_Level().text = MgrLanguageData.GetLanguageByKey("bag_ui_core_level") .. self.recom_lv
    ---Boss血量
    if self.info == nil or self.info.hp == nil
    then
        self.Img_BloodLine().fillAmount = 1
        self.Text_Blood().text = self.bData.HPmax .. "/".. self.bData.HPmax
        BattleManager.CurActivityBossHp = self.bData.HPmax
    else
        for i,v in pairs(self.info.hp) do
            if v.levelId == self.Id then
                self.bossBloodData = v
                BattleManager.CurActivityBossHp = v.nowHp;
                break
            end
        end
        if self.bossBloodData == nil then
            self.Img_BloodLine().fillAmount = 1
            self.Text_Blood().text = self.bData.HPmax .. "/".. self.bData.HPmax
            BattleManager.CurActivityBossHp = self.bData.HPmax
        else
            ---如果是0则显示满血
            if self.bossBloodData.nowHp == 0 then
                self.Img_BloodLine().fillAmount = 1
                self.Text_Blood().text = self.bData.HPmax .. "/".. self.bData.HPmax
                BattleManager.CurActivityBossHp = self.bData.HPmax
            else
                self.Img_BloodLine().fillAmount = self.bossBloodData.nowHp / self.bossBloodData.totalHp
                self.Text_Blood().text = self.bossBloodData.nowHp .. "/" .. self.bossBloodData.totalHp
            end
        end
    end

    ---通关条件
    local conditions = string.split(self.condition,",")
    --self.Text_Condition1().text = MgrLanguageData.GetLanguageByKey("battle_ui_completelevel")
    --self.Text_Condition2().text = string.split(con1,"_")[2]..MgrLanguageData.GetLanguageByKey("battle_ui_passround")
    --self.Text_Condition3().text = MgrLanguageData.GetLanguageByKey("battle_ui_walkoff")..string.split(con2,"_")[2]..MgrLanguageData.GetLanguageByKey("eventbosspop_ui_tips1")
    self.Text_Condition1().text = TermdescLocalData.tab[tonumber(string.split(conditions[1],"_")[3])][2]
    self.Text_Condition2().text = TermdescLocalData.tab[tonumber(string.split(conditions[2],"_")[3])][2]
    self.Text_Condition3().text = TermdescLocalData.tab[tonumber(string.split(conditions[3],"_")[3])][2]
    local s1,s2,s3 = self.pointData:CheckStar()
    self.Bg_Condition_hui1().gameObject:SetActive(not s1)
    self.Bg_Condition_hui2().gameObject:SetActive(not s2)
    self.Bg_Condition_hui3().gameObject:SetActive(not s3)
    ---掉落素材
    self.rewardList = {}
    for i,v in pairs(self.reward) do
        local item = string.split(v,"_")
        local itemData = ItemControl.GetItemByIdAndType(tonumber(item[2]),tonumber(item[1]))
        local itemCount = item[3]
        table.insert(self.rewardList,{itemData,itemCount})
    end
    self:RegisterRewardScroll()
    self.ActivityBossRewardScroll01().totalCount = #self.rewardList
    self.ActivityBossRewardScroll01():RefillCells()
    ---消耗券显示
    MgrRes.LoadSprite(self.Img_Ticket(),"Item/".. ItemControl.GetItemByIdAndType(tonumber(self.consume[2]),tonumber(self.consume[1])).icon)
    self.Text_Ticket().text = ItemControl.GetItemByIdAndType(tonumber(self.consume[2]),tonumber(self.consume[1])).count .. string.format("<color=#FFFFFF>%s</color>","/"..tonumber(self.consume[3]))
    --self.Text_UseTicket().text = tonumber(self.consume[3])
    ---按钮初始化
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.ClickBack))
    UIEvent.LuaClick(self.Btn_Back01().gameObject,Handle(self,self.ClickBack))
    UIEvent.LuaClick(self.ChallengeButtonPanel().gameObject,Handle(self,self.Fight))
    UIEvent.LuaClick(self.SweepButtonPanel().gameObject,Handle(self,self.Sweep))
    self.Btn_GoMenu().gameObject:SetActive(false)
end

function M:RegisterRewardScroll()
    ---注册主线滑块
    self.ActivityBossRewardScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.rewardList[idx],self,idx})
end

function M:Fight()
    MgrTimer.AddDelay("GoPlot",1, function ()
        BattleManager.GameMode = BattleManager.GameModeType.ActivityBoss
        StormViewModel.OpenStormPlotUI()
    end,nil)
end
function M:Sweep()
    if self.info.hp == nil then
        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("activityCcontrol_tips2"),5),1},true)
        return
    end
    for i ,v in pairs(self.info.level) do
        if self.info.hp ~= nil and v.levelID == self.Id then
            if v.levelPerfectCount < 5 then
                MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("activityCcontrol_tips2"),5),1},true)
                return
            end
        end
    end
    if self.pointData:CheckLock() then
        MgrUI.Pop(UID.SweepPop_UI,{self.pointData,function()
            self:RefreshTicket()
        end},true)
    end
end

function M:ClickBack()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

---刷新票
function M:RefreshTicket()
    self.Text_Ticket().text = ItemControl.GetItemByIdAndType(tonumber(self.consume[2]),tonumber(self.consume[1])).count .. string.format("<color=#FFFFFF>%s</color>","/"..tonumber(self.consume[3]))
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
function M:OnClose()
    ---消除原先设置的战斗模式
    --BattleManager.GameMode = 0
    --BattleManager.CurActivityBossHp = nil
end

return M