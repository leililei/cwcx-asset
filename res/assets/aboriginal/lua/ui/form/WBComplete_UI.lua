-- Code Auto Create Begin
local M = Class('WBComplete_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WBComplete_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WBComplete_UI].prefab'
    self.Name = 'Form[WBComplete_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgMask','ImgMask',2},{'Img_Role','Img_Role',2},{'img_battle_settlement_r_3','RightPanel/img_battle_settlement_r_3',2},{'img_battle_settlement_r_2','RightPanel/img_battle_settlement_r_2',2},{'img_battle_settlement_r','RightPanel/img_battle_settlement_r',2},{'img_battle_star_3','RightPanel/new/img_battle_star_3',2},{'img_battle_star_2','RightPanel/new/img_battle_star_2',2},{'img_battle_star','RightPanel/new/img_battle_star',2},{'img_battle_newrecord','RightPanel/new/img_battle_newrecord',2},{'img_battle_settlement_l_2','LeftPanel/img_battle_settlement_l_2',2},{'img_battle_settlement_l','LeftPanel/img_battle_settlement_l',2},{'Btn_ShowInfo','btns/Btn_ShowInfo',2},{'Img_Xiangqingicon','btns/Btn_ShowInfo/Img_Xiangqingicon',2},{'Btn_BackHome','btns/Btn_BackHome',2},{'Btn_Enter','btns/Btn_Enter',2},
        -- TextMeshProUGUI 列表
        {'Text_Title1','RightPanel/img_battle_settlement_r/Text_Title1',20},{'Text_En','RightPanel/img_battle_settlement_r/Text_Title1/Text_En',20},{'Text_Figure5','RightPanel/img_battle_settlement_r/Text_Title1/Text_Figure5',20},{'Text_Title2','RightPanel/Text_Title2',20},{'Text_En01','RightPanel/Text_Title2/Text_En',20},{'Text_Figure1','RightPanel/Text_Title2/Text_Figure1',20},{'Text_Title3','RightPanel/Text_Title3',20},{'Text_En02','RightPanel/Text_Title3/Text_En',20},{'Text_Figure2','RightPanel/Text_Title3/Text_Figure2',20},{'Text_Title4','RightPanel/Text_Title4',20},{'Text_En03','RightPanel/Text_Title4/Text_En',20},{'Text_Figure3','RightPanel/Text_Title4/Text_Figure3',20},{'Text_Title5','RightPanel/Text_Title5',20},{'Text_En04','RightPanel/Text_Title5/Text_En',20},{'Text_Figure4','RightPanel/Text_Title5/Text_Figure4',20},{'Text_Chakanxiangqing','btns/Btn_ShowInfo/Text_Chakanxiangqing',20},{'Text_Fanhuizhuye','btns/Btn_BackHome/Text_Fanhuizhuye',20},{'Text_Queding','btns/Btn_Enter/Text_Queding',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    self.BossData = EventRaidControl.GetLIANHETAOFAData().BossData[BattleManager.CurBossLevel].BossData
    ---伤害整理
    self:ResortDamage()
    StormViewModel.HideRoleUI()
    MgrSound.PlayBGM("Battle-win",1,nil,true)
    ---边缘点击
    UIEvent.LuaClick(self.ImgMask().gameObject,function()
        StormViewModel.SendStormBossData2(function()
            ---销毁战斗数据
            BattleManager.ClearLuaData()
            StormViewModel.CloseWorldBossBattle()
            MgrUI.ClosePop(self.Uid)
        end)
    end)
    ---详情点击
    UIEvent.LuaClick(self.Btn_ShowInfo().gameObject,function()
        ---待完善
        MgrUI.Pop(UID.DamageTotalPop2_UI,{self.newLeftTeamDamage,self.newleftTeam,self.newLeftTeamDamageTotalPercent},true)
    end)
    ---返回主页点击
    UIEvent.LuaClick(self.Btn_BackHome().gameObject,function()
        ---销毁战斗数据
        BattleManager.ClearLuaData()
        StormViewModel.CloseWorldBossBattle(true)
        MgrUI.ClosePop(self.Uid)
    end)
    ---确认点击
    UIEvent.LuaClick(self.Btn_Enter().gameObject,function()
        ---更新联合讨伐(世界boss)数据
        StormViewModel.SendStormBossData2(function()
            ---弹出loading界面并销毁战斗数据
            StormViewModel.CloseWorldBossBattle()
        end)
    end)
end
---更新显示
function M:OnShow(args)
    if args[1] ~= nil then  ---正常Boss战
        ---@type ActivityData
        self.bossData = args[1]
        self.Callback = args[2]
        ---总成绩
        self.Text_Figure5().text = self.bossData.score
        ---击杀分数
        self.Text_Figure2().text = self.bossData.killScore
        ---目标
        self.Text_Figure1().text = self.BossData.name
        ---回合分数
        self.Text_Figure3().text = self.bossData.roundScore
        ---伤害分数
        self.Text_Figure4().text = self.bossData.damageScore
        ---伤害最高的作为封面
        ---@type BattleRole
        local topDamageSkin = self.newleftTeam[1].SkinID
        self:CreatSpine(topDamageSkin)
        ---关闭新纪录图片
        self.img_battle_newrecord().gameObject:SetActive(false)
        self.img_battle_star().gameObject:SetActive(false)
        self.img_battle_star_2().gameObject:SetActive(false)
        self.img_battle_star_3().gameObject:SetActive(false)
        if ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).damageScore == 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_taofazhan_text9"),5},true)
        end
    else
        ---模拟Boss战
        ---总成绩
        self.Text_Figure5().text = BattleViewModel.AniBossScore
        ---击杀分数
        self.Text_Figure2().text = BattleViewModel.AniBossKillScore
        ---目标
        self.Text_Figure1().text = self.BossData.name
        ---回合分数
        self.Text_Figure3().text = BattleViewModel.AniBossRoundScore
        ---伤害分数
        self.Text_Figure4().text = BattleViewModel.AniBossDamageScore
        ---伤害最高的作为封面
        ---@type BattleRole
        local topDamageSkin = self.newleftTeam[1].SkinID
        self:CreatSpine(topDamageSkin)
        ---关闭新纪录图片
        self.img_battle_newrecord().gameObject:SetActive(false)
        self.img_battle_star().gameObject:SetActive(false)
        self.img_battle_star_2().gameObject:SetActive(false)
        self.img_battle_star_3().gameObject:SetActive(false)
    end
end

function M:GetBossName(bossID)
    local bossId = 0
    for i,v in pairs(JcbossLocalData.tab) do
        if v[2] == bossID then
            bossId = string.split(v[3],"_")[1]
            break
        end
    end
    local name = MonsterLocalData.tab[tonumber(bossId)][2]
    return name
end

function M:ResortDamage()
    self.TotalDamage = BattleViewModel.DamageTotal
    self.LeftTeam = BattleManager.LeftTeam
    self.resortDamage = {}
    self.LeftTeamDamage = {}
    self.LeftTeamDamageTotal = 0
    self.LeftTeamDamageTotalPercent = {}
    self.newLeftTeamDamage = {}
    self.newleftTeam = {}
    self.newLeftTeamDamageTotalPercent = {}
    ---筛选出左边队伍的伤害数字
    for i ,v in pairs(self.TotalDamage) do
        self.resortDamage[i] = v
    end
    for i ,v in pairs(self.LeftTeam) do
        self.LeftTeamDamage[v.GameID] = self.resortDamage[v.GameID]
    end
    ---伤害百分比
    for i ,v in pairs(self.LeftTeamDamage) do
        self.LeftTeamDamageTotal = self.LeftTeamDamageTotal + self.LeftTeamDamage[i]
    end
    for i ,v in pairs(self.LeftTeam) do
        if self.LeftTeamDamage[v.GameID] ~= nil then
            if self.LeftTeamDamageTotal ~= 0 then
                self.LeftTeamDamageTotalPercent[v.GameID] = math.abs(self.LeftTeamDamage[v.GameID]) / math.abs(self.LeftTeamDamageTotal) * 100
            else
                self.LeftTeamDamageTotalPercent[v.GameID] = 0
            end
        else
            self.LeftTeamDamageTotalPercent[v.GameID] = 0
        end
    end
    for i,v in pairs(self.LeftTeam) do
        table.insert(self.newLeftTeamDamage,{ id = v.GameID, dmg = 0 })
    end
    for i,v in pairs(self.LeftTeamDamage) do
        for idx,val in pairs(self.newLeftTeamDamage) do
            if val.id == i then
                val.dmg = v
                break
            end
        end
    end
    Global.Sort(self.newLeftTeamDamage,{"dmg"},true)
    for i,v in ipairs(self.newLeftTeamDamage) do
        for idx,val in pairs(self.LeftTeam) do
            if v.id == val.GameID then
                table.insert(self.newleftTeam,val)
                break
            end
        end
    end
    for i,v in ipairs(self.newLeftTeamDamage) do
        for idx,val in pairs(self.LeftTeamDamageTotalPercent) do
            if idx == v.id then
                table.insert(self.newLeftTeamDamageTotalPercent,val)
                break
            end
        end
    end
end

function M:CreatSpine(skinID)
    MgrRes.LoadHDIcon_OriginalSize(self.Img_Role(),skinID)
    local _PosInfoTab = CharactercoordinatesLocalData.tab[skinID].coordinate15
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    self.Img_Role().transform.localPosition = Vector3(tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),0)
    self.Img_Role().transform.localScale = Vector3(tonumber(_tempPosTab1[2]),tonumber(_tempPosTab1[2]),1)
end

return M