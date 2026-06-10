-- Code Auto Create Begin
local M = Class('BathHome_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BathHome_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BathHome_UI].prefab'
    self.Name = 'Form[BathHome_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'TransitionEffect','Ani/TransitionEffect',2},{'ChooseRolePanel','Ani/ChooseRolePanel',2},{'BG','Ani/ChooseRolePanel/BG',2},{'Word','Ani/ChooseRolePanel/BG/Word',2},{'Img_ShadowAbove','Ani/ChooseRolePanel/BG/Shadow/Img_ShadowAbove',2},{'Img_ShadowDown','Ani/ChooseRolePanel/BG/Shadow/Img_ShadowDown',2},{'Image','Ani/ChooseRolePanel/BG/Shadow/Img_ShadowTree/Image',2},{'Btn_GoMenu','Ani/ChooseRolePanel/UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','Ani/ChooseRolePanel/UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','Ani/ChooseRolePanel/UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','Ani/ChooseRolePanel/UpperLeftPanel/Btn_Help',2},{'Btn_Filter','Ani/ChooseRolePanel/Btn_Filter',2},{'ChooseMask','Ani/ChooseRolePanel/ChooseMask',2},{'RoleStagePanel','Ani/RoleStagePanel',2},{'BG01','Ani/RoleStagePanel/BG',2},{'SpineRoot','Ani/RoleStagePanel/BG/SpineRoot',2},{'BG02','Ani/RoleStagePanel/BG/BG',2},{'Word01','Ani/RoleStagePanel/BG/BG/Word',2},{'Img_shuihen','Ani/RoleStagePanel/BG/BG/Img_shuihen',2},{'Img_Bathhome2_Mask','Ani/RoleStagePanel/Img_Bathhome2_Mask',2},{'Img_Bathhome3_Mask','Ani/RoleStagePanel/Img_Bathhome3_Mask',2},{'Btn_GoMenu2','Ani/RoleStagePanel/UpperLeftPanel/Btn_GoMenu2',2},{'Btn_Back2','Ani/RoleStagePanel/UpperLeftPanel/Btn_Back2',2},{'Img_Fenggexian01','Ani/RoleStagePanel/UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help2','Ani/RoleStagePanel/UpperLeftPanel/Btn_Help2',2},{'Shoucangpin','Ani/RoleStagePanel/LiftPanel/Shoucangpin',2},{'RenwuRedDotIcon','Ani/RoleStagePanel/LiftPanel/Shoucangpin/RenwuRedDotIcon',2},{'Btn_01','Ani/RoleStagePanel/LiftPanel/Btn_01',2},{'Dian_Suo','Ani/RoleStagePanel/LiftPanel/Btn_01/Dian_Suo',2},{'Btn_g','Ani/RoleStagePanel/LiftPanel/Btn_01/Btn_g',2},{'txt_01_h','Ani/RoleStagePanel/LiftPanel/Btn_01/Btn_g/txt_01_h',2},{'Btn_h','Ani/RoleStagePanel/LiftPanel/Btn_01/Btn_h',2},{'txt_01_h01','Ani/RoleStagePanel/LiftPanel/Btn_01/Btn_h/txt_01_h',2},{'Img_hongdian','Ani/RoleStagePanel/LiftPanel/Btn_01/Img_hongdian',2},{'Btn_02','Ani/RoleStagePanel/LiftPanel/Btn_02',2},{'Dian_Suo01','Ani/RoleStagePanel/LiftPanel/Btn_02/Dian_Suo',2},{'Btn_g01','Ani/RoleStagePanel/LiftPanel/Btn_02/Btn_g',2},{'txt_01_h02','Ani/RoleStagePanel/LiftPanel/Btn_02/Btn_g/txt_01_h',2},{'Btn_h01','Ani/RoleStagePanel/LiftPanel/Btn_02/Btn_h',2},{'txt_01_h03','Ani/RoleStagePanel/LiftPanel/Btn_02/Btn_h/txt_01_h',2},{'Img_hongdian01','Ani/RoleStagePanel/LiftPanel/Btn_02/Img_hongdian',2},{'Btn_03','Ani/RoleStagePanel/LiftPanel/Btn_03',2},{'Dian_Suo02','Ani/RoleStagePanel/LiftPanel/Btn_03/Dian_Suo',2},{'Btn_g02','Ani/RoleStagePanel/LiftPanel/Btn_03/Btn_g',2},{'txt_01_h04','Ani/RoleStagePanel/LiftPanel/Btn_03/Btn_g/txt_01_h',2},{'Btn_h02','Ani/RoleStagePanel/LiftPanel/Btn_03/Btn_h',2},{'txt_01_h05','Ani/RoleStagePanel/LiftPanel/Btn_03/Btn_h/txt_01_h',2},{'Img_hongdian02','Ani/RoleStagePanel/LiftPanel/Btn_03/Img_hongdian',2},{'img_xian','Ani/RoleStagePanel/LiftPanel/img_xian',2},{'img_xian01','Ani/RoleStagePanel/LiftPanel/img_xian',2},{'StageNamePanel','Ani/RoleStagePanel/StageNamePanel',2},{'Img_0','Ani/RoleStagePanel/StageNamePanel/Img_0',2},{'Img_1','Ani/RoleStagePanel/StageNamePanel/Img_1',2},{'DianContent','Ani/RoleStagePanel/StageNamePanel/DianContent',2},{'Dian','Ani/RoleStagePanel/StageNamePanel/DianContent/Dian',2},{'Img_Dian','Ani/RoleStagePanel/StageNamePanel/DianContent/Dian/Img_Dian',2},{'Dian_Suo03','Ani/RoleStagePanel/StageNamePanel/DianContent/Dian/Dian_Suo',2},{'Rewards','Ani/RoleStagePanel/Rewards',2},{'Img_Y','Ani/RoleStagePanel/Rewards/Img_Y',2},{'Item_Rewards','Ani/RoleStagePanel/Rewards/Item_Rewards',2},{'ItemGo','Ani/RoleStagePanel/Rewards/Item_Rewards/ItemGo',2},{'WupinIcon','Ani/RoleStagePanel/Rewards/Item_Rewards/ItemGo/WupinIcon',2},{'Img_ItemCountPivot','Ani/RoleStagePanel/Rewards/Item_Rewards/ItemGo/Img_ItemCountPivot',2},{'Img_ItemCountBg_Wp','Ani/RoleStagePanel/Rewards/Item_Rewards/ItemGo/Img_ItemCountPivot/Img_ItemCountBg_Wp',2},{'RewardContent','Ani/RoleStagePanel/Rewards/RewardContent',2},{'Conditions','Ani/RoleStagePanel/Conditions',2},{'Img_Y01','Ani/RoleStagePanel/Conditions/Img_Y',2},{'Item_Conditions3','Ani/RoleStagePanel/Conditions/Item_Conditions3',2},{'Bg','Ani/RoleStagePanel/Conditions/Item_Conditions3/Bg',2},{'Item','Ani/RoleStagePanel/Conditions/Item_Conditions3/Bg/Item',2},{'WupinIcon01','Ani/RoleStagePanel/Conditions/Item_Conditions3/Bg/Item/WupinIcon',2},{'Item_Conditions2','Ani/RoleStagePanel/Conditions/Item_Conditions2',2},{'Bg01','Ani/RoleStagePanel/Conditions/Item_Conditions2/Bg',2},{'Item01','Ani/RoleStagePanel/Conditions/Item_Conditions2/Bg/Item',2},{'WupinIcon02','Ani/RoleStagePanel/Conditions/Item_Conditions2/Bg/Item/WupinIcon',2},{'Item_Conditions1','Ani/RoleStagePanel/Conditions/Item_Conditions1',2},{'Bg02','Ani/RoleStagePanel/Conditions/Item_Conditions1/Bg',2},{'Item02','Ani/RoleStagePanel/Conditions/Item_Conditions1/Bg/Item',2},{'WupinIcon03','Ani/RoleStagePanel/Conditions/Item_Conditions1/Bg/Item/WupinIcon',2},{'Btn_Qidong','Ani/RoleStagePanel/Btn_Qidong',2},{'Btn_Qidong_lock','Ani/RoleStagePanel/Btn_Qidong_lock',2},{'ShoucangpinPop','Ani/ShoucangpinPop',2},{'CollectionMask','Ani/ShoucangpinPop/CollectionMask',2},{'Img_Tanchuangdi','Ani/ShoucangpinPop/Img_Tanchuangdi',2},{'Img_Tian','Ani/ShoucangpinPop/Img_Tanchuangdi/Img_Tian',2},{'Img_Daojulingqu','Ani/ShoucangpinPop/Img_Tanchuangdi/Img_Tian/Img_Daojulingqu',2},{'ShoucangpinItem','Ani/ShoucangpinPop/Img_Tanchuangdi/bg/ShoucangpinItem',2},{'ItemGo01','Ani/ShoucangpinPop/Img_Tanchuangdi/bg/ShoucangpinItem/ItemGo',2},{'WupinIcon04','Ani/ShoucangpinPop/Img_Tanchuangdi/bg/ShoucangpinItem/ItemGo/WupinIcon',2},{'Img_ItemlockMask','Ani/ShoucangpinPop/Img_Tanchuangdi/bg/ShoucangpinItem/Img_ItemlockMask',2},{'RenwuPop','Ani/RenwuPop',2},{'TaskMask','Ani/RenwuPop/TaskMask',2},{'ClickBackArea','Ani/RenwuPop/ClickBackArea',2},{'ClickBackAreaMask','Ani/RenwuPop/ClickBackAreaMask',2},{'biaotixian','Ani/RenwuPop/PanelTitleText/biaotixian',2},{'Img_Tanchuangdi01','Ani/RenwuPop/Img_Tanchuangdi',2},{'Img_Tian01','Ani/RenwuPop/Img_Tanchuangdi/Img_Tian',2},{'Img_Daojulingqu01','Ani/RenwuPop/Img_Tanchuangdi/Img_Tian/Img_Daojulingqu',2},{'TaskContent','Ani/RenwuPop/VFXMask/TaskScroll/TaskContent',2},
        -- UITemplate 列表
        {'BathRolePrefab','Ani/ChooseRolePanel/RoleCardScroll/BathRolePrefab',10},{'BathTaskItem','Ani/RenwuPop/VFXMask/TaskScroll/BathTaskItem',10},
        -- RawImage 列表
        {'RoleCardScroll','Ani/ChooseRolePanel/RoleCardScroll',15},{'RoleCardContent','Ani/ChooseRolePanel/RoleCardScroll/RoleCardContent',15},{'CollectionContent','Ani/ShoucangpinPop/Img_Tanchuangdi/bg/CollectionContent',15},{'TaskScroll','Ani/RenwuPop/VFXMask/TaskScroll',15},
        -- LoopScrollRect 列表
        {'RoleCardScroll01','Ani/ChooseRolePanel/RoleCardScroll',18},{'TaskScroll01','Ani/RenwuPop/VFXMask/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','Ani/ChooseRolePanel/UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ChooseRolePanel/UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_Title_CN01','Ani/RoleStagePanel/UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN01','Ani/RoleStagePanel/UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_En','Ani/RoleStagePanel/StageNamePanel/Text_En',20},{'Text_Cn','Ani/RoleStagePanel/StageNamePanel/Text_Cn',20},{'Text_TitleName','Ani/RoleStagePanel/StageNamePanel/Text_TitleName',20},{'Text_Shuoming','Ani/RoleStagePanel/StageNamePanel/Text_Shuoming',20},{'Text_Rewards_CN','Ani/RoleStagePanel/Rewards/Text_Rewards_CN',20},{'Text_Rewards_EN','Ani/RoleStagePanel/Rewards/Text_Rewards_EN',20},{'ItemRemainText','Ani/RoleStagePanel/Rewards/Item_Rewards/ItemGo/Img_ItemCountPivot/Img_ItemCountBg_Wp/ItemRemainText',20},{'Text_Conditions_CN','Ani/RoleStagePanel/Conditions/Text_Conditions_CN',20},{'Text_Conditions_EN','Ani/RoleStagePanel/Conditions/Text_Conditions_EN',20},{'Text_g','Ani/RoleStagePanel/Conditions/Item_Conditions3/Text_g',20},{'Text_h','Ani/RoleStagePanel/Conditions/Item_Conditions3/Text_h',20},{'Text_g01','Ani/RoleStagePanel/Conditions/Item_Conditions2/Text_g',20},{'Text_h01','Ani/RoleStagePanel/Conditions/Item_Conditions2/Text_h',20},{'Text_g02','Ani/RoleStagePanel/Conditions/Item_Conditions1/Text_g',20},{'Text_h02','Ani/RoleStagePanel/Conditions/Item_Conditions1/Text_h',20},{'Text_RoleName','Ani/RoleStagePanel/Btn_Qidong/Text_RoleName',20},{'Text_RoleName01','Ani/RoleStagePanel/Btn_Qidong_lock/Text_RoleName',20},{'Text_En01','Ani/ShoucangpinPop/Img_Tanchuangdi/Img_Tian/Text_En',20},{'PanelTitleText','Ani/RenwuPop/PanelTitleText',20},{'Text_En02','Ani/RenwuPop/Img_Tanchuangdi/Img_Tian/Text_En',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --初始化按钮事件
    self:InitBtn()
    --初始化音频
    MgrSound.AddCue("Audio/role/showervoice.acb")
    --UI
    self.RoleStagePanel().gameObject:SetActive(false)
    self.ShoucangpinPop().gameObject:SetActive(false)
    self.RenwuPop().gameObject:SetActive(false)
    self.Btn_Help().gameObject:SetActive(false)
    self.SpineObj = nil
    --任务条件预制
    self.CostPrefab = {
        self.Item_Conditions2().gameObject,
        self.Item_Conditions3().gameObject,
    }
    --好感度预制
    self.FavorPrefab = {
        self.Item_Conditions1().gameObject,
    }

    --切换阶段按钮
    self.SwitchBtn = {
        self.Btn_01().gameObject,
        self.Btn_02().gameObject,
        self.Btn_03().gameObject,
    }

    --注册滑块
    self.RoleCardScroll01():SetLuaCellEvent(Handle(self,self.RoleCell))
    self.TaskScroll01():SetLuaCellEvent(Handle(self,self.TaskCell))
    self:ReloadRole(0)
    --隐藏模板
    self.BathRolePrefab().gameObject:SetActive(false)
    --self.BathTaskItem().gameObject:SetActive(false)
    --转场特效
    self.TransitionEffect = CJNUIMgr.GetSunUseName(self.TransitionEffect().gameObject,"baipingzhuanchang").transform:GetComponent("ParticleSystem")
    --水滴特效
    self.waterDropEffect = CJNUIMgr.GetSunUseName(self.RoleStagePanel().gameObject,"Ui_cuozao_rain")
    --遮罩
    self.ChooseMask().gameObject:SetActive(false)
end

function M:OnShow()
    --播放大厅bgm
    MgrSound.PlayBGM("BathhomeBGM",0.2)
end

---初始化按钮
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.Btn_Back2().gameObject,function()
        self.RoleStagePanel().gameObject:SetActive(false)
        self.ChooseRolePanel().gameObject:SetActive(true)
    end)
    --回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    UIEvent.LuaClick(self.Btn_GoMenu2().gameObject,function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    --点击帮助
    UIEvent.LuaClick(self.Btn_Help2().gameObject,function()
        self:RefreshLobby(self.RoleData.roleId,1)
    end)
    --关闭任务
    UIEvent.LuaClick(self.TaskMask().gameObject,function()
        self.waterDropEffect:SetActive(true)
        self.RenwuPop().gameObject:SetActive(false)
    end)
    --点击收藏品
    UIEvent.LuaClick(self.Shoucangpin().gameObject,function()
        --播放收藏品bgm
        MgrSound.PlayBGM("BathHomeGift",0.2)
        self.waterDropEffect:SetActive(false)
        self:RefreshCollection()
        self.ShoucangpinPop().gameObject:SetActive(true)
    end)
    --关闭收藏品
    UIEvent.LuaClick(self.CollectionMask().gameObject,function()
        --播放大厅bgm
        MgrSound.PlayBGM("BathhomeBGM",0.2)
        self.waterDropEffect:SetActive(true)
        self.ShoucangpinPop().gameObject:SetActive(false)
    end)
    --开始游戏
    UIEvent.LuaClick(self.Btn_Qidong().gameObject,function()
        local str = string.split(self.curLobby.type,"_")
        --如果没有可领奖励
        if self.RoleData:CheckCanReceiveReward(tonumber(str[2])) == false then
            if self.allFinish == nil or self.allFinish == false then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("arkcontrol_tips1"),1},true)
                return
            end
            BathControl.GameType = tonumber(str[1])
            BathControl.GameId = tonumber(str[2])
            BathControl.GameData = self.RoleData
            --是否是首次进入
            if self.RoleData:CheckPassGameId(BathControl.GameId) == false then
                if self.curLobby.plotBefore ~= "0" then
                    --播放当前阶段游戏前剧情
                    PlotViewModel.OpenPlotUI(self.curLobby.plotBefore,function ()
                        if self.curLobby.plotAfter ~= "0" then
                            BathControl.OpenBathGame(tonumber(str[1]),tonumber(str[2]),self.RoleData,self.curLobby.plotAfter)
                        else
                            BathControl.OpenBathGame(tonumber(str[1]),tonumber(str[2]),self.RoleData)
                        end
                    end,true)
                else
                    BathControl.OpenBathGame(tonumber(str[1]),tonumber(str[2]),self.RoleData)
                end
            else
                BathControl.OpenBathGame(tonumber(str[1]),tonumber(str[2]),self.RoleData)
            end
        else
            --领奖
            BathControl.NGameRewardREQ(self.RoleData.roleId,tonumber(str[2]),function()
                self:RefreshLobby(self.RoleData.roleId,self.curPhase)
            end)
        end
    end)
    --点击一阶段
    UIEvent.LuaClick(self.Btn_01().gameObject,function()
        --播放音效
        MgrSound.PlayEffect("BathHomeChange",1,0,false,0,0,"bathHomeChange")
        self:RefreshLobby(self.RoleData.roleId, 1)
    end)
    --点击二阶段
    UIEvent.LuaClick(self.Btn_02().gameObject,function()
        if self.RoleData.curPhase + 1 < 2 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_tongyong_text120"),2},true)
            return
        end
        --播放音效
        MgrSound.PlayEffect("BathHomeChange",1,0,false,0,0,"bathHomeChange")
        self:RefreshLobby(self.RoleData.roleId,2)
    end)
    --点击三阶段
    UIEvent.LuaClick(self.Btn_03().gameObject,function()
        if self.RoleData.curPhase + 1 < 3 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_tongyong_text120"),2},true)
            return
        end
        --播放音效
        MgrSound.PlayEffect("BathHomeChange",1,0,false,0,0,"bathHomeChange")
        self:RefreshLobby(self.RoleData.roleId,3)
    end)
end

function M:OnBackShow()
    --UI刷新到角色大厅对应阶段
    self:RefreshLobby(BathControl.GameData.roleId)
end

function M:OnUpdateUI()
    --更改特效
    self:RegisterClickEffect()
end

function M:RoleCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.RoleList[idx],self})
end

function M:TaskCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.TaskList[idx],self})
end

---重载搓澡角色
function M:ReloadRole(offset)
    self.RoleList = BathControl.GetRole(1)
    self.RoleCardScroll01().totalCount = #self.RoleList
    if offset then
        self.RoleCardScroll01():RefillCells(offset)
    else
        self.RoleCardScroll01():RefreshCells()
    end
end

---刷新大厅
function M:RefreshLobby(id,phase)
    --引导
    ActiveTutorialControl.ForcePopGuide(1003)
    --隐藏选择角色UI
    self.RoleStagePanel().gameObject:SetActive(true)
    self.ChooseRolePanel().gameObject:SetActive(false)
    --当前角色数据
    self.RoleData = BathControl.GetSingleRole(id)
    if self.RoleData == nil then
        return
    end
    --当前阶段
    self.curPhase = self.RoleData.curPhase + 1 > 3 and 3 or self.RoleData.curPhase + 1
    if phase then
        self.curPhase = phase
    end
    --切换按钮是否显示
    local highPhase = self.RoleData.curPhase + 1 > 3 and 3 or self.RoleData.curPhase + 1
    for k,v in pairs(self.SwitchBtn) do
        local h_Icon = CJNUIMgr.GetSunUseName(v,"Btn_h")
        local g_Icon = CJNUIMgr.GetSunUseName(v,"Btn_g")
        local lock = CJNUIMgr.GetSunUseName(v,"Dian_Suo")
        local redDoc = CJNUIMgr.GetSunUseName(v,"Img_hongdian")
        if k == self.curPhase then
            h_Icon:SetActive(true)
            g_Icon:SetActive(false)
            lock:SetActive(false)
        else
            if k > highPhase then
                lock:SetActive(true)
                h_Icon:SetActive(false)
                g_Icon:SetActive(false)
            else
                h_Icon:SetActive(false)
                g_Icon:SetActive(true)
                lock:SetActive(false)
            end
        end
        local id = string.split(self.RoleData.gameType[k],"_")[2]
        if self.RoleData:CheckCanReceiveReward(tonumber(id)) then
            redDoc:SetActive(true)
        else
            redDoc:SetActive(false)
        end
    end

    --当前大厅数据
    self.curLobby = self.RoleData.lobbyData[self.curPhase]
    --清理子物体
    Tools.ClearAllChild(self.DianContent().gameObject)

    --标题文本
    MgrRes.LoadSprite(self.Img_1(),"BackRub/Img_Stage_"..self.curLobby.phaseTitle[1])
    self.Text_En().text = self.curLobby.phaseTitle[3]
    self.Text_Cn().text = self.curLobby.phaseTitle[2]
    --角色名字
    self.Text_TitleName().text = self.RoleData.name
    --说明
    self.Text_Shuoming().text = self.curLobby.phaseTxt
    --按钮文本
    local btnTxt = CJNUIMgr.GetSunUseName(self.Btn_Qidong().gameObject,"Text_RoleName").transform:GetComponent("TextMeshProUGUI")
    local str = string.split(self.curLobby.type,"_")
    if self.RoleData.curPhase >= self.curPhase then
        if self.RoleData:CheckCanReceiveReward(tonumber(str[2])) then
            btnTxt.text = MgrLanguageData.GetLanguageByKey("ui_bathhome_text3")
            self.Rewards().gameObject:SetActive(true)
            self.Conditions().gameObject:SetActive(true)
        else
            btnTxt.text = MgrLanguageData.GetLanguageByKey("ui_bathhome_text2")
            self.Rewards().gameObject:SetActive(false)
            self.Conditions().gameObject:SetActive(false)
        end
    else
        btnTxt.text = MgrLanguageData.GetLanguageByKey("ui_bathhome_text1")
        self.Rewards().gameObject:SetActive(true)
        self.Conditions().gameObject:SetActive(true)
    end

    --是否满足前置条件
    self.allFinish = true
    --刷新好感度条件
    for k,v in pairs(self.FavorPrefab) do
        local bg = CJNUIMgr.GetSunUseName(v,"Bg"):GetComponent("CanvasGroup")
        local greyTxt = CJNUIMgr.GetSunUseName(v,"Text_g"):GetComponent("TextMeshProUGUI")
        local highTxt = CJNUIMgr.GetSunUseName(v,"Text_h"):GetComponent("TextMeshProUGUI")
        local icon = CJNUIMgr.GetSunUseName(v,"WupinIcon"):GetComponent("Image")
        local str = string.split(string.split(self.curLobby.phaseCondition[k],",")[2],"_")
        local heroFavor = HeroControl.GetRoleDataByID(tonumber(str[2])).favor
        --如果好感度满足
        if heroFavor >= tonumber(str[3]) then
            --显示高亮UI
            bg.alpha = 1
            highTxt.text = tonumber(str[3]).."/"..tonumber(str[3])
            highTxt.gameObject:SetActive(true)
            greyTxt.gameObject:SetActive(false)
        else
            --显示灰色黯淡UI
            bg.alpha = 0.5
            greyTxt.text = JNStrTool.numberAbbr(heroFavor).."/"..tonumber(str[3])
            highTxt.gameObject:SetActive(false)
            greyTxt.gameObject:SetActive(true)
            --未满足条件
            self.allFinish = false
        end
        --加载道具图标
        MgrRes.LoadSprite(icon,"BackRub/favor")
        --点击弹窗物品详情
        UIEvent.LuaClick(icon.gameObject,function()
            self:RefreshTask(0)
            self.waterDropEffect:SetActive(false)
            self.RenwuPop().gameObject:SetActive(true)
        end)
    end

    --刷新消耗道具条件
    for k,v in pairs(self.CostPrefab) do
        local bg = CJNUIMgr.GetSunUseName(v,"Bg"):GetComponent("CanvasGroup")
        local greyTxt = CJNUIMgr.GetSunUseName(v,"Text_g"):GetComponent("TextMeshProUGUI")
        local highTxt = CJNUIMgr.GetSunUseName(v,"Text_h"):GetComponent("TextMeshProUGUI")
        local icon = CJNUIMgr.GetSunUseName(v,"WupinIcon"):GetComponent("Image")
        if self.curLobby.phaseCost[k] == nil then
            v.gameObject:SetActive(false)
            break
        else
            v.gameObject:SetActive(true)
        end
        local str = string.split(string.split(self.curLobby.phaseCost[k],",")[2],"_")
        local item = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
        --如果数量满足
        if item.count >= tonumber(str[3]) then
            --显示高亮UI
            bg.alpha = 1
            highTxt.text = JNStrTool.numberAbbr(item.count).."/"..JNStrTool.numberAbbr(tonumber(str[3]))
            highTxt.gameObject:SetActive(true)
            greyTxt.gameObject:SetActive(false)
        else
            --显示灰色黯淡UI
            bg.alpha = 0.5
            greyTxt.text = JNStrTool.numberAbbr(item.count).."/"..JNStrTool.numberAbbr(tonumber(str[3]))
            highTxt.gameObject:SetActive(false)
            greyTxt.gameObject:SetActive(true)
            --未满足条件
            self.allFinish = false
        end
        --加载道具图标
        MgrRes.LoadSprite(icon,item.icon)
        --点击弹窗物品详情
        UIEvent.LuaClick(icon.gameObject,function()
            --MgrUI.Pop(UID.ItemDetailPop_UI,{item,false},true)
            self:RefreshTask(0)
            self.waterDropEffect:SetActive(false)
            self.RenwuPop().gameObject:SetActive(true)
        end)
    end

    ---创建角色大厅spine
    local index = self.RoleData.curPhase + 1 >= 3 and 3 or self.RoleData.curPhase + 1
    self:CreatSpine(self.SpineRoot(),self.RoleData.lobbyData[index].phaseSpine[1],self.RoleData.lobbyData[index].spinePos,self.RoleData.lobbyData[index].phaseSpine[2])

    --刷新奖励
    self:RefreshReward(self.curPhase)

    ---解锁按钮显示
    if self.RoleData:CheckPassGameId(tonumber(str[2])) then
        self.Btn_Qidong().gameObject:SetActive(true)
        self.Btn_Qidong_lock().gameObject:SetActive(false)
        self.allFinish = true
    else
        if self.allFinish then
            self.Btn_Qidong().gameObject:SetActive(true)
            self.Btn_Qidong_lock().gameObject:SetActive(false)
        else
            self.Btn_Qidong().gameObject:SetActive(false)
            self.Btn_Qidong_lock().gameObject:SetActive(true)
        end
    end
end

---刷新奖励
function M:RefreshReward(phase)
    local index = phase == 0 and 1 or phase
    self.Item_Rewards().gameObject:SetActive(false)
    --清理子物体
    Tools.ClearAllChild(self.RewardContent().gameObject)
    local str = string.split(self.RoleData.reward[index],",")
    for k,v in pairs(str) do
        if k > 1 then
            local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
            local obj = GameObject.Instantiate(self.Item_Rewards().gameObject,self.RewardContent().gameObject.transform,false)
            obj:SetActive(true)
            local count = CJNUIMgr.GetSunUseName(obj, "ItemRemainText").transform:GetComponent("TextMeshProUGUI")
            local icon = CJNUIMgr.GetSunUseName(obj, "WupinIcon").transform:GetComponent("Image")
            local frame = CJNUIMgr.GetSunUseName(obj, "ItemGo").transform:GetComponent("Image")
            --数量
            count.text = JNStrTool.numberAbbr(tonumber(string.split(v,"_")[3]))
            --物品图片
            MgrRes.LoadSprite(icon,item.icon)
            --物品边框
            MgrRes.LoadSprite(frame,item.iconFrame)
            --点击弹出详情
            UIEvent.LuaClick(obj,function()
                MgrUI.Pop(UID.ItemDetailPop_UI,{item, false, function() end},true)
            end)
        end
    end
end

function M:RefreshTask(offset)
    self.TaskList = BathControl.GetTaskList(self.curLobby.phaseTask)
    self.TaskScroll01().totalCount = #self.TaskList
    if offset then
        self.TaskScroll01():RefillCells(offset)
    else
        self.TaskScroll01():RefreshCells()
    end
end

---刷新收藏
function M:RefreshCollection()
    self.ShoucangpinItem().gameObject:SetActive(false)
    --清理子物体
    Tools.ClearAllChild(self.CollectionContent().gameObject)
    for k,v in pairs(self.RoleData.collection) do
        local obj = GameObject.Instantiate(self.ShoucangpinItem().gameObject,self.CollectionContent().gameObject.transform,false)
        obj:SetActive(true)
        ---@type ItemData
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
        local frame = CJNUIMgr.GetSunUseName(obj, "ItemGo").transform:GetComponent("Image")
        local icon = CJNUIMgr.GetSunUseName(obj, "WupinIcon").transform:GetComponent("Image")
        local lock = CJNUIMgr.GetSunUseName(obj, "Img_ItemlockMask")
        MgrRes.LoadSprite(frame,item.iconFrame)
        MgrRes.LoadSprite(icon,item.icon)
        lock:SetActive(item.count == 0)
        --点击弹出详情
        UIEvent.LuaClick(obj,function()
            if item.count > 0 then
                MgrUI.Pop(UID.ItemDetailPop_UI,{item, false, function() end},true)
            end
        end)
    end
end

---创建spine
function M:CreatSpine(root,id,posStr,ani)
    if self.SpineObj then
        return
    end
    local _tempPosTab1 = JNStrTool.strSplit(";", posStr)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatch3DSpineInUI(root, id,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), ani, function(obj)
        self.SpineObj = obj
        obj.transform.localRotation = Quaternion.Euler(0,0,tonumber(_tempPosTab1[4]))
    end)
end

---播放转场效果
function M:Transition(id)
    --屏蔽延时时的按钮点击
    self.ChooseMask().gameObject:SetActive(true)
    self.TransitionEffect:Play(true)
    --清理当前spine
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        self.SpineObj = nil
    end
    MgrTimer.AddDelayNoName(2,function()
        self.ChooseMask().gameObject:SetActive(false)
        self:RefreshLobby(id)
    end,self.ObjRoot)
end

function M:RegisterClickEffect()
    CMgrUI.Instance:CleanClickAllChild()
    MgrRes.GetPrefab('ABOriginal/VFX/UI_Model/Cuozao/perfeb/cuozao_dianji.prefab',function(clickeff)
        CMgrUI.Instance:SetClickEffect(clickeff)
    end)
end

function M:OnHide()
    ---修改点击特效
    CMgrUI.Instance:CleanClickAllChild()
    MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/llx_dianji.prefab',function(clickeff)
        CMgrUI.Instance:SetClickEffect(clickeff)
    end)
end
function M:OnBackKey()
    if self.RenwuPop().gameObject.activeSelf then
        self.RenwuPop().gameObject:SetActive(false)
        return
    end
    if self.RoleStagePanel().gameObject.activeSelf then
        self.RoleStagePanel().gameObject:SetActive(false)
        self.ChooseRolePanel().gameObject:SetActive(true)
        return
    end
    if self.ShoucangpinPop().gameObject.activeSelf then
        self.ShoucangpinPop().gameObject:SetActive(false)
        self.ChooseRolePanel().gameObject:SetActive(true)
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    BathControl.PlotAfter = nil
    ---修改点击特效
    CMgrUI.Instance:CleanClickAllChild()
    MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/llx_dianji.prefab',function(clickeff)
        CMgrUI.Instance:SetClickEffect(clickeff)
    end)
end

return M