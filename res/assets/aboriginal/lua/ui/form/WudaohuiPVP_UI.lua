-- Code Auto Create Begin
local M = Class('WudaohuiPVP_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WudaohuiPVP_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WudaohuiPVP_UI].prefab'
    self.Name = 'Form[WudaohuiPVP_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Ani/Img_BG',2},{'Img_Bg','Ani/Panel_Left/Img_Bg',2},{'Img_Title','Ani/Panel_Left/Img_Title',2},{'Btn_Renwu','Ani/Panel_Left/Btn/Btn_Renwu',2},{'RedDotIcon','Ani/Panel_Left/Btn/Btn_Renwu/RedDotIcon',2},{'Btn_Paihangbang','Ani/Panel_Left/Btn/Btn_Paihangbang',2},{'RedDotIcon01','Ani/Panel_Left/Btn/Btn_Paihangbang/RedDotIcon',2},{'Btn_Jiangliyulan','Ani/Panel_Left/Btn/Btn_Jiangliyulan',2},{'RedDotIcon02','Ani/Panel_Left/Btn/Btn_Jiangliyulan/RedDotIcon',2},{'Img_1','Ani/Panel_Left/Paiming/Img_1',2},{'Btn_Avatar','Ani/Panel_Left/Paiming/Img_1/Btn_Avatar',2},{'touxiangyuan','Ani/Panel_Left/Paiming/Img_1/Btn_Avatar/touxiangyuan',2},{'PlayerIcon','Ani/Panel_Left/Paiming/Img_1/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang','Ani/Panel_Left/Paiming/Img_1/Btn_Avatar/touxiangkuang',2},{'Img_2','Ani/Panel_Left/Paiming/Img_2',2},{'Btn_Avatar01','Ani/Panel_Left/Paiming/Img_2/Btn_Avatar',2},{'touxiangyuan01','Ani/Panel_Left/Paiming/Img_2/Btn_Avatar/touxiangyuan',2},{'PlayerIcon01','Ani/Panel_Left/Paiming/Img_2/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang01','Ani/Panel_Left/Paiming/Img_2/Btn_Avatar/touxiangkuang',2},{'Img_3','Ani/Panel_Left/Paiming/Img_3',2},{'Btn_Avatar02','Ani/Panel_Left/Paiming/Img_3/Btn_Avatar',2},{'touxiangyuan02','Ani/Panel_Left/Paiming/Img_3/Btn_Avatar/touxiangyuan',2},{'PlayerIcon02','Ani/Panel_Left/Paiming/Img_3/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang02','Ani/Panel_Left/Paiming/Img_3/Btn_Avatar/touxiangkuang',2},{'BattleGroup','Ani/Panel_Right/BattleGroup',2},{'Img_Buzhendi','Ani/Panel_Right/BattleGroup/Btn_Saodang/Img_Buzhendi',2},{'Btn_Pipei','Ani/Panel_Right/BattleGroup/Btn_Pipei',2},{'Img_Pipeidi','Ani/Panel_Right/BattleGroup/Btn_Pipei/Img_Pipeidi',2},{'Btn_Pipei2','Ani/Panel_Right/BattleGroup/Btn_Pipei2',2},{'Img_Pipeidi2','Ani/Panel_Right/BattleGroup/Btn_Pipei2/Img_Pipeidi2',2},{'BtnGorup','Ani/Panel_Right/BtnGorup',2},{'Btn_Buzhen','Ani/Panel_Right/BtnGorup/Btn_Buzhen',2},{'Img_Buzhendi01','Ani/Panel_Right/BtnGorup/Btn_Buzhen/Img_Buzhendi',2},{'Btn_Zhanbao','Ani/Panel_Right/BtnGorup/Btn_Zhanbao',2},{'Img_ZhanbaoIcon','Ani/Panel_Right/BtnGorup/Btn_Zhanbao/Img_ZhanbaoIcon',2},{'RedDotIcon03','Ani/Panel_Right/BtnGorup/Btn_Zhanbao/RedDotIcon',2},{'Dangqianlianshengcishu','Ani/Panel_Right/Dangqianlianshengcishu',2},{'Wudaohuishuju','Ani/Panel_Right/Wudaohuishuju',2},{'Btn_EventOver','Ani/Panel_Right/Btn_EventOver',2},{'ReturnBg','Ani/UpperLeftPanel/ReturnBg',2},{'Btn_GoMenu','Ani/UpperLeftPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/UpperLeftPanel/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','Ani/UpperLeftPanel/Btn_I',2},{'RenwuPop','Ani/RenwuPop',2},{'Btn_TaskMask','Ani/RenwuPop/Btn_TaskMask',2},{'bg','Ani/RenwuPop/bg',2},{'di','Ani/RenwuPop/bg/di',2},{'Switch','Ani/RenwuPop/bg/Switch',2},{'Tog_Meiri','Ani/RenwuPop/bg/Switch/Tog_Meiri',2},{'HighLight','Ani/RenwuPop/bg/Switch/Tog_Meiri/HighLight',2},{'Img_guang','Ani/RenwuPop/bg/Switch/Tog_Meiri/HighLight/Img_guang',2},{'Img_tiao','Ani/RenwuPop/bg/Switch/Tog_Meiri/HighLight/Img_tiao',2},{'MeiriRedDotIcon','Ani/RenwuPop/bg/Switch/Tog_Meiri/MeiriRedDotIcon',2},{'Tog_Saiji','Ani/RenwuPop/bg/Switch/Tog_Saiji',2},{'HighLight01','Ani/RenwuPop/bg/Switch/Tog_Saiji/HighLight',2},{'Img_guang01','Ani/RenwuPop/bg/Switch/Tog_Saiji/HighLight/Img_guang',2},{'Img_tiao01','Ani/RenwuPop/bg/Switch/Tog_Saiji/HighLight/Img_tiao',2},{'SaijiRedDotIcon','Ani/RenwuPop/bg/Switch/Tog_Saiji/SaijiRedDotIcon',2},{'TaskContent','Ani/RenwuPop/TaskScroll/TaskContent',2},{'Btn_Lingqu','Ani/RenwuPop/Btn_Lingqu/Btn_Lingqu',2},{'Btn_Lingqu01','Ani/RenwuPop/Btn_Lingqu_hui/Btn_Lingqu',2},{'JiangliyulanPop','Ani/JiangliyulanPop',2},{'Btn_RewardMask','Ani/JiangliyulanPop/Btn_RewardMask',2},{'Img_Tanchuangdi','Ani/JiangliyulanPop/Img_Tanchuangdi',2},{'di01','Ani/JiangliyulanPop/di',2},{'Img_Biaotixian','Ani/JiangliyulanPop/Text_Title/Img_Biaotixian',2},{'Img_Xian2','Ani/JiangliyulanPop/Img_Xian2',2},{'Img_Xian1','Ani/JiangliyulanPop/Img_Xian1',2},{'ZhanbaoPop','Ani/ZhanbaoPop',2},{'Btn_ZhanbaoMask','Ani/ZhanbaoPop/Btn_ZhanbaoMask',2},{'bg01','Ani/ZhanbaoPop/bg',2},{'di02','Ani/ZhanbaoPop/bg/di',2},{'Img_Biaotixian01','Ani/ZhanbaoPop/bg/Text_Title/Img_Biaotixian',2},{'Img_Xian201','Ani/ZhanbaoPop/Img_Xian2',2},{'Img_Xian101','Ani/ZhanbaoPop/Img_Xian1',2},{'PaihangbangPop','Ani/PaihangbangPop',2},{'Btn_RankMask','Ani/PaihangbangPop/Btn_RankMask',2},{'bg02','Ani/PaihangbangPop/bg',2},{'di03','Ani/PaihangbangPop/bg/di',2},{'Img_Biaotixian02','Ani/PaihangbangPop/bg/Text_Title/Img_Biaotixian',2},{'Img_Xian202','Ani/PaihangbangPop/bg/Img_Xian2',2},{'Img_Xian102','Ani/PaihangbangPop/bg/Img_Xian1',2},
        -- Button 列表
        {'Btn_Saodang','Ani/Panel_Right/BattleGroup/Btn_Saodang',4},{'Btn_Lingqu02','Ani/RenwuPop/Btn_Lingqu',4},{'Btn_Lingqu_hui','Ani/RenwuPop/Btn_Lingqu_hui',4},
        -- UITemplate 列表
        {'WudaohuiTaskItem','Ani/RenwuPop/TaskScroll/WudaohuiTaskItem',10},{'WudaohuiRewardItem','Ani/JiangliyulanPop/RewardScroll/WudaohuiRewardItem',10},{'WudaohuiRecordItem','Ani/ZhanbaoPop/bg/ZhanBaoScroll/WudaohuiRecordItem',10},{'WudaohuiRankItem','Ani/PaihangbangPop/bg/RankScroll/WudaohuiRankItem',10},
        -- Toggle 列表
        {'Tog_Meiri01','Ani/RenwuPop/bg/Switch/Tog_Meiri',13},{'Tog_Saiji01','Ani/RenwuPop/bg/Switch/Tog_Saiji',13},
        -- RawImage 列表
        {'Btn_Saodang01','Ani/Panel_Right/BattleGroup/Btn_Saodang',15},{'TaskScroll','Ani/RenwuPop/TaskScroll',15},{'Btn_Lingqu03','Ani/RenwuPop/Btn_Lingqu',15},{'Btn_Lingqu_hui01','Ani/RenwuPop/Btn_Lingqu_hui',15},{'RewardScroll','Ani/JiangliyulanPop/RewardScroll',15},{'ZhanBaoScroll','Ani/ZhanbaoPop/bg/ZhanBaoScroll',15},{'RankScroll','Ani/PaihangbangPop/bg/RankScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','Ani/RenwuPop/TaskScroll',18},{'RewardScroll01','Ani/JiangliyulanPop/RewardScroll',18},{'ZhanBaoScroll01','Ani/ZhanbaoPop/bg/ZhanBaoScroll',18},{'RankScroll01','Ani/PaihangbangPop/bg/RankScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Time','Ani/Panel_Left/Img_Title/Text_Time',20},{'Text_Renwu','Ani/Panel_Left/Btn/Btn_Renwu/Text_Renwu',20},{'Text_Paihangbang','Ani/Panel_Left/Btn/Btn_Paihangbang/Text_Paihangbang',20},{'Text_Jiangliyulan','Ani/Panel_Left/Btn/Btn_Jiangliyulan/Text_Jiangliyulan',20},{'Text_PlayerName','Ani/Panel_Left/Paiming/Img_1/Text_PlayerName',20},{'Text_Lianshengcishu','Ani/Panel_Left/Paiming/Img_1/Text_Lianshengcishu',20},{'Text_PlayerName01','Ani/Panel_Left/Paiming/Img_2/Text_PlayerName',20},{'Text_Lianshengcishu01','Ani/Panel_Left/Paiming/Img_2/Text_Lianshengcishu',20},{'Text_PlayerName02','Ani/Panel_Left/Paiming/Img_3/Text_PlayerName',20},{'Text_Lianshengcishu02','Ani/Panel_Left/Paiming/Img_3/Text_Lianshengcishu',20},{'Text_Buzhen','Ani/Panel_Right/BattleGroup/Btn_Saodang/Text_Buzhen',20},{'Text_Pipei','Ani/Panel_Right/BattleGroup/Btn_Pipei/Text_Pipei',20},{'Text_Pipei2','Ani/Panel_Right/BattleGroup/Btn_Pipei2/Text_Pipei2',20},{'Text_Pipeicishu','Ani/Panel_Right/BattleGroup/Text_Pipeicishu',20},{'Text_Buzhen01','Ani/Panel_Right/BtnGorup/Btn_Buzhen/Text_Buzhen',20},{'Text_Zhanbao','Ani/Panel_Right/BtnGorup/Btn_Zhanbao/Text_Zhanbao',20},{'Text_CurLiansheng','Ani/Panel_Right/Text_CurLiansheng',20},{'Text_CurWinning','Ani/Panel_Right/Text_CurLiansheng/Text_CurWinning',20},{'Text_Lianshengjilu','Ani/Panel_Right/Text_Lianshengjilu',20},{'Text_Winning','Ani/Panel_Right/Text_Lianshengjilu/Text_Winning',20},{'Text_Leijijilu','Ani/Panel_Right/Text_Leijijilu',20},{'Text_LeiSheng','Ani/Panel_Right/Text_Leijijilu/Text_LeiSheng',20},{'Text_Dangqianlianshengcishu','Ani/Panel_Right/Dangqianlianshengcishu/Text_Dangqianlianshengcishu',20},{'Text_CurRank','Ani/Panel_Right/Dangqianlianshengcishu/Text_CurRank',20},{'Text_Wudaohuishuju','Ani/Panel_Right/Wudaohuishuju/Text_Wudaohuishuju',20},{'Text_EventOver','Ani/Panel_Right/Btn_EventOver/Text_EventOver',20},{'Text_Title','Ani/UpperLeftPanel/Text_Title',20},{'Text_TitleEn','Ani/UpperLeftPanel/Text_TitleEn',20},{'Text_Meiri','Ani/RenwuPop/bg/Switch/Tog_Meiri/HighLight/Text_Meiri',20},{'Normal','Ani/RenwuPop/bg/Switch/Tog_Meiri/Normal',20},{'Text_Saiji','Ani/RenwuPop/bg/Switch/Tog_Saiji/HighLight/Text_Saiji',20},{'Normal01','Ani/RenwuPop/bg/Switch/Tog_Saiji/Normal',20},{'Text_Lingqu','Ani/RenwuPop/Btn_Lingqu/Btn_Lingqu/Text_Lingqu',20},{'Text_Lingqu01','Ani/RenwuPop/Btn_Lingqu_hui/Btn_Lingqu/Text_Lingqu',20},{'Text_Title01','Ani/JiangliyulanPop/Text_Title',20},{'Text_Title02','Ani/ZhanbaoPop/bg/Text_Title',20},{'Text_Leijishengli','Ani/ZhanbaoPop/bg/Text_Leijishengli',20},{'Text_RankTips','Ani/PaihangbangPop/bg/di/Text_RankTips',20},{'Text_Title03','Ani/PaihangbangPop/bg/Text_Title',20},{'Text_Paiming','Ani/PaihangbangPop/bg/Text_Paiming',20},{'Text_Wanjiaxinxi','Ani/PaihangbangPop/bg/Text_Wanjiaxinxi',20},{'Text_Lianshengchangci','Ani/PaihangbangPop/bg/Text_Lianshengchangci',20},{'Text_tishi','Ani/PaihangbangPop/bg/Text_tishi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TopRank = {
        [1] = { obj=self.Btn_Avatar(),headFrame=self.touxiangkuang(),headIcon=self.PlayerIcon(),name=self.Text_PlayerName(),winCount=self.Text_Lianshengcishu() },
        [2] = { obj=self.Btn_Avatar01(),headFrame=self.touxiangkuang01(),headIcon=self.PlayerIcon01(),name=self.Text_PlayerName01(),winCount=self.Text_Lianshengcishu01() },
        [3] = { obj=self.Btn_Avatar02(),headFrame=self.touxiangkuang02(),headIcon=self.PlayerIcon02(),name=self.Text_PlayerName02(),winCount=self.Text_Lianshengcishu02() }
    }
    ---匹配按钮
    self.Btn_Pipei2().gameObject:SetActive(false)
    ---排行奖励
    self.RankRewardList = BuDoukaiControl.GetRankAward()
    ---排行数据（前100名）
    self.RankData = nil
    ---自身排行数据
    self.MyRankData = nil
    ---自身排行
    self.MyRank = -1
    ---本日已使用免费挑战的次数
    self.useFree = 0
    ---免费挑战总次数
    self.TotleFree = 0
    ---武道会活动数据
    self.BuDouKaiInfo = BuDoukaiControl.GetData()
    ---武道会活动总览
    self.BuDouKaiActivity = BuDoukaiControl.GetActivityData()
    self.CurDotState = false
    self.StrType = "daily"
    self.TaskGroup = nil---当前组id
    self.curSubType = self.BuDouKaiInfo.dayTaskId
    ---战报
    self.ZhanBaoData = nil
    ---门票
    local tStr = string.split(SteamLocalData.tab[111017][2],'_')
    local tItem = ItemControl.GetItemByID(tonumber(tStr[2]))
    self.ticketName = tItem.name
    self.ticketCount = tonumber(tStr[3])
    ---首次进入强制弹出帮助界面
    ActiveTutorialControl.ForcePopGuide(self.BuDouKaiInfo.group)
    
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self:InitTime()
    self:InitButton()
    self:RegisterScroll()
end

---注册滑块
function M:RegisterScroll()
    ---注册任务滑块
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.TaskCellItem))
    ---注册排行榜滑块
    self.RankScroll01():SetLuaCellEvent(Handle(self,self.RankCellItem))
    ---注册奖励滑块
    self.RewardScroll01():SetLuaCellEvent(Handle(self,self.RewardCellItem))
    ---注册战报滑块
    self.ZhanBaoScroll01():SetLuaCellEvent(Handle(self,self.ZhanBaoCellItem))
end

function M:InitButton()
    ---点击返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        MgrUI.GoBack()
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_I().gameObject,function()
        ActiveTutorialControl.OpenGuide(self.BuDouKaiInfo.group)
    end)
    ---任务
    UIEvent.LuaClick(self.Btn_Renwu().gameObject,function()
        self.RenwuPop().gameObject:SetActive(true)
    end)
    UIEvent.LuaClick(self.Btn_TaskMask().gameObject,function()
        self.RenwuPop().gameObject:SetActive(false)
    end)
    ---排行榜
    UIEvent.LuaClick(self.Btn_Paihangbang().gameObject,function()
        self:RankShow()
        self.PaihangbangPop().gameObject:SetActive(true)
    end)
    UIEvent.LuaClick(self.Btn_RankMask().gameObject,function()
        self.PaihangbangPop().gameObject:SetActive(false)
    end)
    ---奖励预览
    UIEvent.LuaClick(self.Btn_Jiangliyulan().gameObject,function()
        self.RewardScroll01():RefreshCells()
        self.JiangliyulanPop().gameObject:SetActive(true)
    end)
    UIEvent.LuaClick(self.Btn_RewardMask().gameObject,function()
        self.JiangliyulanPop().gameObject:SetActive(false)
    end)
    ---战报
    UIEvent.LuaClick(self.Btn_Zhanbao().gameObject,function()
        BuDoukaiControl.ZhanBaoReq(function(tab)
            if tab then
                self.ZhanBaoData = tab
                self.ZhanBaoScroll01().totalCount = #self.ZhanBaoData
                self.ZhanBaoScroll01():RefillCells()
            end
            
            self.ZhanbaoPop().gameObject:SetActive(true)
        end)
    end)
    UIEvent.LuaClick(self.Btn_ZhanbaoMask().gameObject,function()
        self.ZhanbaoPop().gameObject:SetActive(false)
    end)
    ---布阵
    UIEvent.LuaClick(self.Btn_Buzhen().gameObject,function()
        BuDoukaiControl.OpenBuZhen()
    end)
    ---匹配
    UIEvent.LuaClick(self.Btn_Pipei().gameObject,function()
        if self.useFree < self.TotleFree then
            ---匹配
            BuDoukaiControl.OpenFight()
        else
            local str = string.format(MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text10"),self.ticketCount..self.ticketName)
            MgrUI.Pop(UID.ConfirmPop_UI,{ str,function()
                ---匹配
                BuDoukaiControl.OpenFight()
            end,nil,2 },true)
        end
    end)
    ---任务按钮
    local tFirstBtn = 1
    --if not Global.isMiddleTime(self.BuDouKaiActivity.beginTime, self.BuDouKaiActivity.endTime) then
    --    tFirstBtn = 2
    --end
    local TopBtns = {
        [1] = { btn = self.Tog_Meiri01(), select = self.Tog_Meiri().gameObject.transform:Find("HighLight").gameObject, unSelect = self.Tog_Meiri().gameObject.transform:Find("Normal").gameObject },
        [2] = { btn = self.Tog_Saiji01(), select = self.Tog_Saiji().gameObject.transform:Find("HighLight").gameObject, unSelect = self.Tog_Saiji().gameObject.transform:Find("Normal").gameObject },
    }
    for i = 1, #TopBtns do
        Tools.ToggleValueChange(TopBtns[i].btn,function(isOn)
            --if tFirstBtn == 2 then
            --    if isOn and i == 1 then
            --        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text4"), 1 }, true)
            --    end
            --    return
            --end
            if isOn then
                TopBtns[i].select:SetActive(true)
                TopBtns[i].unSelect:SetActive(false)

                if i == 1 then
                    self:TaskShow("daily")
                else
                    self:TaskShow("achieve")
                end
            else
                TopBtns[i].select:SetActive(false)
                TopBtns[i].unSelect:SetActive(true)
            end
        end)
        if i == tFirstBtn then
            TopBtns[i].select:SetActive(true)
            TopBtns[i].unSelect:SetActive(false)

            if i == 1 then
                self:TaskShow("daily")
            else
                self:TaskShow("achieve")
            end
        else
            TopBtns[i].select:SetActive(false)
            TopBtns[i].unSelect:SetActive(true)
        end
    end
    ---一键领取
    UIEvent.LuaClick(self.Btn_Lingqu().gameObject,function()
        if not self.CurDotState then
            return
        end
        local taskType = 0
        if self.StrType == "daily" then
            taskType = self.TaskGroup[1].type
        end
        ActivationTaskViewModel.TaskPerform(taskType,0,nil,self.curSubType,function()
            self:RefreshRedPoint()
            self:TaskShow()
        end)
    end)
end

function M:OnUpdateUI()
    ---展示排行榜前三数据
    self:ShowRank()
    ---排行奖励
    self:RankReward()
    ---任务
    self:TaskShow("daily")
    ---刷新红点
    self:RefreshRedPoint()
end
---展示排行榜前三数据
function M:ShowRank()
    BuDoukaiControl.RankReq(function(tab)
        self.RankData = tab.info
        --自身排行数据
        self.MyRankData = tab.ownInfo
        --自身排行
        if tab.ownInfo then
            self.MyRank = tab.ownInfo.rank+1
        end
        --本日已使用免费挑战的次数
        self.useFree = tab.usedFree
        --免费挑战总次数
        self.TotleFree = tab.totalFree
        --今日免费匹配次数
        self.Text_Pipeicishu().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips13"), self.TotleFree-self.useFree)
        --匹配按钮
        --self.Btn_Pipei().gameObject:SetActive(self.useFree < self.TotleFree)
        --self.Btn_Pipei2().gameObject:SetActive(self.useFree >= self.TotleFree)
        --当前排名
        self.Text_CurRank().text = self.MyRank==-1 and "--" or self.MyRank
        --当前连胜次数(%s(連勝保護))
        if tab.winCoverLeft > 0 then
            self.Text_CurWinning().text = string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_tips28"), tostring(tab.curWinContinue))
        else
            self.Text_CurWinning().text = tab.curWinContinue
        end
        --最大连胜场数
        self.Text_Winning().text = tab.maxWinContinue
        --累计胜利总场数
        self.Text_Leijishengli().text = string.format(MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text11"),tab.selfTotalWinCount)
        self.Text_LeiSheng().text = tab.selfTotalWinCount
        ---前三名玩家信息
        for i, v in ipairs(self.TopRank) do
            if tab.info and tab.info[i] then
                ---头像
                PlayerControl.SetHeadIcon(v.headIcon, tab.info[i].head)
                ---头像框
                PlayerControl.SetHeadFrame(v.headFrame, tab.info[i].headFrame)
                v.obj.gameObject:SetActive(true)
                v.name.text = tab.info[i].nike
                v.winCount.text = string.format(MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text4"),tab.info[i].winCount)
            else
                v.obj.gameObject:SetActive(false)
                v.name.text = "--"
                v.winCount.text = "--"
            end
        end
    end)
end
                                                            -------------------------------------------- 战报 --------------------------------------------
---战报滑块控件
function M:ZhanBaoCellItem(trans,idx)
    ---刷新item
    trans:GetComponent("UITemplate"):SetData({ self.ZhanBaoData[idx] })
end
                                                            -------------------------------------------- 任务 --------------------------------------------
---任务滑块控件
function M:TaskCellItem(trans,idx)
    ---刷新item
    trans:GetComponent("UITemplate"):SetData({ self.TaskGroup[idx],self })
end
function M:TaskShow(_strType)
    self.CurDotState = false
    if _strType then
        self.StrType = _strType
    end
    if self.StrType == "daily" then
        self.TaskGroup = BuDoukaiControl.GetDailyTaskData()
        self.curSubType = self.BuDouKaiInfo.dayTaskId

        self.CurDotState = RedDotControl.GetDotData("BuDoukaiDailyTask"):GetCurDotState()
    else
        self.TaskGroup = BuDoukaiControl.GetTaskData()
        self.curSubType = self.BuDouKaiInfo.activeid

        self.CurDotState = RedDotControl.GetDotData("BuDoukaiAch"):GetCurDotState()
    end
    self.TaskScroll01().totalCount = #self.TaskGroup
    self.TaskScroll01():RefillCells(0)
    ---一键领取按钮状态
    self.Btn_Lingqu().gameObject:SetActive(self.CurDotState)
    self.Btn_Lingqu_hui().gameObject:SetActive(not self.CurDotState)
end
---刷新红点
function M:RefreshRedPoint()
    BuDoukaiControl.CheckTaskRedPoint()
    ---每日任务
    local tCurDot_Dayliy = RedDotControl.GetDotData("BuDoukaiDailyTask"):GetCurDotState()
    self.MeiriRedDotIcon().gameObject:SetActive(tCurDot_Dayliy)
    ---成就
    local tCurDot_Ach = RedDotControl.GetDotData("BuDoukaiAch"):GetCurDotState()
    self.SaijiRedDotIcon().gameObject:SetActive(tCurDot_Ach)
    ---任务按钮
    self.RedDotIcon().gameObject:SetActive(tCurDot_Dayliy or tCurDot_Ach)
end
                                                            -------------------------------------------- 排行榜 --------------------------------------------
---排行榜滑块控件
function M:RankCellItem(trans,idx)
    ---刷新item
    trans:GetComponent("UITemplate"):SetData(self.RankData[idx])
end
---排行榜
function M:RankShow()
    if self.RankData then
        self.Text_RankTips().gameObject:SetActive(#self.RankData==0)
        self.RankScroll01().totalCount = #self.RankData
        self.RankScroll01():RefillCells()
    else
        self.Text_RankTips().gameObject:SetActive(false)
    end
end
                                                            -------------------------------------------- 排行奖励 --------------------------------------------
---排行奖励滑块控件
function M:RewardCellItem(trans,idx)
    ---刷新item
    trans:GetComponent("UITemplate"):SetData({self.RankRewardList[idx],self.MyRank})
end
---排行奖励
function M:RankReward()
    self.RewardScroll01().totalCount = #self.RankRewardList
    self.RewardScroll01():RefillCells()
end

---活动时间
function M:InitTime()
    local tActive = BuDoukaiControl.GetActivityData()
    local curTime = Global.GetCurTime()

    if tActive then
        --赛季时间
        if curTime < tActive.battleEnd_Stamp then
            local time = tActive.battleEnd_Stamp - curTime
            ---剩余时间大于一天
            if time >= 86400 then
                local day = math.floor(time/86400)
                local hour = math.floor(time%86400/3600)
                self.Text_Time().text =string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_rankendtime_hour"),day,hour)
            else
                local hour = math.floor(time / 3600)
                local min = math.floor((time % 3600) / 60)
                self.Text_Time().text =string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_rankendtime_min"),hour,min)
            end

            --按钮状态
            self.Btn_Buzhen().gameObject:SetActive(true)
            self.BattleGroup().gameObject:SetActive(true)
            self.Btn_EventOver().gameObject:SetActive(false)
        else
            local time = tActive.endTime_Stamp - curTime
            ---剩余时间大于一天
            if time >= 86400 then
                local day = math.floor(time/86400)
                local hour = math.floor(time%86400/3600)
                self.Text_Time().text =string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_rewardendtime_hour"),day,hour)
            else
                local hour = math.floor(time / 3600)
                local min = math.floor((time % 3600) / 60)
                self.Text_Time().text =string.format(MgrLanguageData.GetLanguageByKey("pvpready_ui_rewardendtime_min"),hour,min)
            end
            
            self.Btn_Buzhen().gameObject:SetActive(false)
            self.BattleGroup().gameObject:SetActive(false)
            self.Btn_EventOver().gameObject:SetActive(true)
        end
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        ---如果在选择界面返回上一级
        if self.RenwuPop().gameObject.activeSelf then
            self.RenwuPop().gameObject:SetActive(false)
        elseif self.JiangliyulanPop().gameObject.activeSelf then
            self.JiangliyulanPop().gameObject:SetActive(false)
        elseif self.ZhanbaoPop().gameObject.activeSelf then
            self.ZhanbaoPop().gameObject:SetActive(false)
        elseif self.PaihangbangPop().gameObject.activeSelf then
            self.PaihangbangPop().gameObject:SetActive(false)
        else
            MgrUI.GoBack()
        end
    end
end

return M