-- Code Auto Create Begin
local M = Class('FriendItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/FriendItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Haoyoudi','Img_Haoyoudi',2},{'IconMask','IconMask',2},{'HeadIcon','IconMask/HeadIcon',2},{'HeadFrame','HeadFrame',2},{'Zhiyuanjuese','Zhiyuanjuese',2},{'Img_Bianhaodi3','Zhiyuanjuese/Img_Bianhaodi3',2},{'Img_Bianhaodi2','Zhiyuanjuese/Img_Bianhaodi2',2},{'Img_Bianhaodi1','Zhiyuanjuese/Img_Bianhaodi1',2},{'Img_NoData1','Zhiyuanjuese/Img_NoData1',2},{'TeamRolePrefab','Zhiyuanjuese/Img_NoData1/TeamRolePrefab',2},{'Img_Touxiangdi','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/RoleIcon',2},{'Img_Kuang','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/Img_Kuang',2},{'Text_Lv','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/Text_Lv',2},{'zhiyeicon','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/JxStarPanel',2},{'JxStarPrefab','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/StarPanel',2},{'StaPrefab','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_NoData2','Zhiyuanjuese/Img_NoData2',2},{'TeamRolePrefab01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab',2},{'Img_Touxiangdi01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/RoleIcon',2},{'Img_Kuang01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/Img_Kuang',2},{'Text_Lv01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/Text_Lv',2},{'zhiyeicon01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/JxStarPanel',2},{'JxStarPrefab01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/StarPanel',2},{'StaPrefab01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_NoData3','Zhiyuanjuese/Img_NoData3',2},{'TeamRolePrefab02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab',2},{'Img_Touxiangdi02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/RoleIcon',2},{'Img_Kuang02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/Img_Kuang',2},{'Text_Lv02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/Text_Lv',2},{'zhiyeicon02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/JxStarPanel',2},{'JxStarPrefab02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/StarPanel',2},{'StaPrefab02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/StarPanel/StaPrefab (5)',2},{'Img_ListPanel','Img_ListPanel',2},{'Btn_Remark','Img_ListPanel/Btn_Remark',2},{'Img_Mingpiandi','Img_ListPanel/Btn_Remark/Img_Mingpiandi',2},{'Img_Mingpianicon','Img_ListPanel/Btn_Remark/Img_Mingpianicon',2},{'Btn_PlayerCard','Img_ListPanel/Btn_PlayerCard',2},{'Img_Mingpiandi1','Img_ListPanel/Btn_PlayerCard/Img_Mingpiandi1',2},{'Img_Mingpianicon1','Img_ListPanel/Btn_PlayerCard/Img_Mingpianicon1',2},{'Btn_Like','Img_ListPanel/Btn_Like',2},{'Img_Dianzandi(liang)','Img_ListPanel/Btn_Like/Highlight/Img_Dianzandi(liang)',2},{'Img_Mingpianicon01','Img_ListPanel/Btn_Like/Highlight/Img_Mingpianicon',2},{'Img_Dianzanquan(liang)','Img_ListPanel/Btn_Like/Highlight/Img_Dianzanquan(liang)',2},{'Img_Dianzandi(hui)','Img_ListPanel/Btn_Like/Normal/Img_Dianzandi(hui)',2},{'Img_Mingpianicon02','Img_ListPanel/Btn_Like/Normal/Img_Mingpianicon',2},{'Img_Mask','Img_ListPanel/Btn_Like/Normal/Img_Mask',2},{'Img_Dianzanquan','Img_ListPanel/Btn_Like/Normal/Img_Dianzanquan',2},{'Btn_SimulateBattle','Img_ListPanel/Btn_SimulateBattle',2},{'Img_SimulateBattledi','Img_ListPanel/Btn_SimulateBattle/Img_SimulateBattledi',2},{'Img_SimulateBattleIcon','Img_ListPanel/Btn_SimulateBattle/Img_SimulateBattleIcon',2},{'Btn_Delete','Img_ListPanel/Btn_Delete',2},{'Img_Delete','Img_ListPanel/Btn_Delete/Img_Delete',2},{'Img_DeleteIcon','Img_ListPanel/Btn_Delete/Img_DeleteIcon',2},{'Tog_BatchDelete','Img_ListPanel/Tog_BatchDelete',2},{'BDelete_Normal','Img_ListPanel/Tog_BatchDelete/BDelete_Normal',2},{'BDelete_Highlight','Img_ListPanel/Tog_BatchDelete/BDelete_Highlight',2},{'Img_ApplyPanel','Img_ApplyPanel',2},{'Btn_PlayerCard2','Img_ApplyPanel/Btn_PlayerCard2',2},{'Img_Mingpiandi2','Img_ApplyPanel/Btn_PlayerCard2/Img_Mingpiandi2',2},{'Img_Mingpianicon2','Img_ApplyPanel/Btn_PlayerCard2/Img_Mingpianicon2',2},{'Btn_Agree','Img_ApplyPanel/Btn_Agree',2},{'Btn_Reject','Img_ApplyPanel/Btn_Reject',2},{'Img_AddPanel','Img_AddPanel',2},{'Btn_Apply','Img_AddPanel/Btn_Apply',2},{'Img_Shenqingdi','Img_AddPanel/Btn_Apply/Img_Shenqingdi',2},{'Img_Shenqingicon','Img_AddPanel/Btn_Apply/Img_Shenqingicon',2},{'Btn_PlayerCard3','Img_AddPanel/Btn_PlayerCard3',2},{'Img_Mingpiandi201','Img_AddPanel/Btn_PlayerCard3/Img_Mingpiandi2',2},{'Img_Mingpianicon201','Img_AddPanel/Btn_PlayerCard3/Img_Mingpianicon2',2},{'Btn_Applied','Img_AddPanel/Btn_Applied',2},{'Img_Shenqingdi01','Img_AddPanel/Btn_Applied/Img_Shenqingdi',2},{'Img_Shenqingicon01','Img_AddPanel/Btn_Applied/Img_Shenqingicon',2},{'Img_PlayerLevel','Img_PlayerLevel',2},
        -- Text 列表
        {'Text_Mingpian2','Img_ApplyPanel/Btn_PlayerCard2/Text_Mingpian2',3},
        -- UITemplate 列表
        {'FriendItem','/',10},
        -- Toggle 列表
        {'Tog_BatchDelete01','Img_ListPanel/Tog_BatchDelete',13},
        -- TextMeshProUGUI 列表
        {'Text_Bianhao3','Zhiyuanjuese/Text_Bianhao3',20},{'Text_Bianhao2','Zhiyuanjuese/Text_Bianhao2',20},{'Text_Bianhao1','Zhiyuanjuese/Text_Bianhao1',20},{'Text_Grade','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/Text_Grade',20},{'Text_Rank','Zhiyuanjuese/Img_NoData1/TeamRolePrefab/Text_Rank',20},{'Text_Grade01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/Text_Grade',20},{'Text_Rank01','Zhiyuanjuese/Img_NoData2/TeamRolePrefab/Text_Rank',20},{'Text_Grade02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/Text_Grade',20},{'Text_Rank02','Zhiyuanjuese/Img_NoData3/TeamRolePrefab/Text_Rank',20},{'Text_Mingpian','Img_ListPanel/Btn_Remark/Text_Mingpian',20},{'Text_Mingpian1','Img_ListPanel/Btn_PlayerCard/Text_Mingpian1',20},{'Text_SimulateBattle','Img_ListPanel/Btn_SimulateBattle/Text_SimulateBattle',20},{'Text_DeleteFriend','Img_ListPanel/Btn_Delete/Text_DeleteFriend',20},{'Text_Shenqing','Img_AddPanel/Btn_Apply/Text_Shenqing',20},{'Text_Mingpian201','Img_AddPanel/Btn_PlayerCard3/Text_Mingpian2',20},{'Text_Shenqing01','Img_AddPanel/Btn_Applied/Text_Shenqing',20},{'Text_PlayerName','Text_PlayerName',20},{'Text_LV','Img_PlayerLevel/Text_LV',20},{'Text_LastLogin','Text_LastLogin',20},{'Text_LastLoginTime','Text_LastLoginTime',20},
    }
end
-- Code Auto Create End
require("LocalData/PlayheadframeLocalData")
function M:OnInit()
    self.TeamRolePrefab().gameObject:SetActive(false)
    self:SetBatchDeleteToggleWidgets(false)
end

function M:OnUpdateUI(pData)
    ---@type FriendServerData
    self.FriendData = pData[1]
    self.Parent = pData[2]
    -- 在删除好友模式下
    local bInDeleteType = self.Parent.CurDeleteType

    ---根据类型显示不同UI
    self.Img_ListPanel().gameObject:SetActive(self.FriendData.status == 1)  ---显示好友列表UI
    self.Img_ApplyPanel().gameObject:SetActive(self.FriendData.status == 0) ---显示好友申请UI
    self.Img_AddPanel().gameObject:SetActive(self.FriendData.status ~= 0 and self.FriendData.status ~= 1) ---显示好友添加UI
    --self.Btn_SimulateBattle().gameObject:SetActive(self.FriendData.status == 1)

    ---如果点击了删除按钮并且是好友，就显示删除按钮
    if(bInDeleteType and self.FriendData.status == 1) then
        self:SetBatchDeleteToggleStatesWithoutNotify(FriendViewModel.ContainsBatchSelectFriend(self.FriendData.userID))
        self.Tog_BatchDelete().gameObject:SetActive(true)
        self.Btn_Delete().gameObject:SetActive(true)
        self.Btn_SimulateBattle().gameObject:SetActive(false)
        self.Btn_Remark().gameObject:SetActive(false)
        self.Btn_PlayerCard().gameObject:SetActive(false)
    else
        self.Tog_BatchDelete().gameObject:SetActive(false)
        self.Btn_Delete().gameObject:SetActive(false)
        self.Btn_SimulateBattle().gameObject:SetActive(true)
        self.Btn_Remark().gameObject:SetActive(true)
        self.Btn_PlayerCard().gameObject:SetActive(true)
    end

    ---如果有备注显示备注
    if(self.FriendData.remark ~= "") then
        self.Text_PlayerName().text = self.FriendData.nike.."<color=#72A6FF>（"..self.FriendData.remark.."）</color>"
    else
        self.Text_PlayerName().text = self.FriendData.nike
    end

    local curTime = MgrNet.GetServerTime() ---获取服务器时间
    local dayNum = tonumber(os.date("%d",curTime + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)) ---获取当前天

    ---好友等级
    self.Text_LV().text = MgrLanguageData.GetLanguageByKey("ui_tips_1") .. "."..self.FriendData.friendLv
    ---好友最近登录
    --local LoginTime = tonumber(os.date("%d",self.FriendData.loginTime)) ---好友最后登录时间
    local SubDay = FriendViewModel.TimeDiff(self.FriendData.loginTime,curTime) ---上次登录和今天相差几天
    --UnityEngine.Debug.LogError("当前时间是  "..curTime)
    --UnityEngine.Debug.LogError(self.FriendData.loginTime)
    if(SubDay == 0) then
        self.Text_LastLoginTime().text = MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips1")
    else
        self.Text_LastLoginTime().text = tostring(SubDay) .. MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips2")
    end

    if self.FriendData.online == 1 then
        self.Text_LastLoginTime().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_online")
    end

    local UnlockConditions = nil
    if PlayheadLocalData.tab[self.FriendData.head] then
        ---好友头像
        local typeStr = JNStrTool.strSplit("_",PlayheadLocalData.tab[self.FriendData.head].type)
        if typeStr[1] == "0" then
            if tonumber(typeStr[2]) ~= 19000 and tonumber(typeStr[2]) ~= 90000 then
                UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
                MgrRes.LoadNormalIcon(self.HeadIcon(),UnlockConditions.id)
            else
                MgrRes.LoadNormalIcon(self.HeadIcon(),90000)
            end
        elseif typeStr[1] == "1" then
            MgrRes.LoadNormalIcon(self.HeadIcon(),tonumber(typeStr[3]))
        end
    else
        ---如果表里没有头像数据显示默认头像
        MgrRes.LoadNormalIcon(self.HeadIcon(),tonumber(string.split(PlayheadLocalData.tab[tonumber(SteamLocalData.tab[104015][2])].type,"_")[2]))
    end

    ---头像框
    if self.FriendData.headFrame == 0 then
        self.FriendData.headFrame = 1
    end
    --Img_HeadFrame
    local frameName = PlayheadframeLocalData.tab[self.FriendData.headFrame][3]
    MgrRes.LoadSprite(self.HeadFrame():GetComponent("Image"),"Playheadicon/" .. frameName)

    ---申请状态
    self:RefreshApplyState()

    ---好友头像框
    --TODO 头像框系统暂未实现

    ---支援角色Prefab
    self.RoleList = {
        self:Zhiyuanjuese().transform:Find("Img_NoData1").gameObject.transform:Find("TeamRolePrefab").gameObject,
        self:Zhiyuanjuese().transform:Find("Img_NoData2").gameObject.transform:Find("TeamRolePrefab").gameObject,
        self:Zhiyuanjuese().transform:Find("Img_NoData3").gameObject.transform:Find("TeamRolePrefab").gameObject,
    }
    for k,v in pairs(self.RoleList) do
        v:SetActive(false)
    end
    if(self.FriendData.support) then
        ---支援角色
        for k, v in pairs(self.FriendData.support) do
            local obj = self.RoleList[v.slot]
            obj:SetActive(true)
            obj.transform.localPosition = Vector3.zero
            local RoleIcon = obj.transform:Find("RoleIcon"):GetComponent("Image")
            local Text_Grade = obj.transform:Find("Text_Grade"):GetComponent("TextMeshProUGUI")
            local Img_Kuang = obj.transform:Find("Img_Kuang"):GetComponent("Image")
            local zhiyeicon = obj.transform:Find("zhiyeicon"):GetComponent("Image")
            local Text_Rank = obj.transform:Find("Text_Rank"):GetComponent("TextMeshProUGUI")
            local StarPanel = obj.transform:Find("StarPanel").gameObject
            local JxStarPanel = obj.transform:Find("JxStarPanel").gameObject
            ---@type RoleData
            local heroData = v
            local CurrencyData = HeroControl.GetRoleDataByID(v.heroID)
            MgrRes.LoadQIcon(RoleIcon,v.skin == nil and heroData.heroID or v.skin)
            MgrRes.LoadSprite(Img_Kuang,CurrencyData.iconBattleFrame)
            MgrRes.LoadSprite(zhiyeicon,CurrencyData.iconCareer)
            Text_Grade.text = heroData.heroLevel
            ---技能等级
            local tSkillLvUp = 1
            for i, equiplv in pairs(heroData.equip) do
                if equiplv < tonumber(SteamLocalData.tab[105009][2]) then
                    tSkillLvUp = 0
                    break
                end
            end
            if tSkillLvUp == 1 then
                Text_Rank.color = Color(1,0.772549,0.2235294,1)
            end
            if heroData.heroFlag == true then
                Text_Rank.text = heroData.heroCurSkill
            else
                Text_Rank.text = heroData.heroSkillLevel + tSkillLvUp
            end

            for i = 1,6 do
                JxStarPanel.transform:GetChild(i-1).gameObject:SetActive(false)
                StarPanel.transform:GetChild(i-1).gameObject:SetActive(false)
            end
            for i = 1, heroData.heroStar do
                if i > JxStarPanel.transform.childCount then
                    break
                end
                if heroData.heroAwaken == 1 then
                    JxStarPanel.transform:GetChild(i-1).gameObject:SetActive(true)
                else
                    StarPanel.transform:GetChild(i-1).gameObject:SetActive(true)
                end
            end
            ---点击支援角色区域
            UIEvent.LuaClick(obj,function ()
                RoleCardViewModel.GetRole(v.heroID,v)
                ---弹出支援角色详情面板
                RoleCardViewModel.OpenFriendRoleUI()
            end)
        end
    end

    ---点赞好友
    self.BtnLikeNH = {
        self.Btn_Like().transform:Find("Normal").gameObject,
        self.Btn_Like().transform:Find("Highlight").gameObject,
    }
    self.CanLike = FriendViewModel.LikeData[self.FriendData.userID]

    ---变化UI
    self.BtnLikeNH[1].gameObject:SetActive(not self.CanLike)
    self.BtnLikeNH[2].gameObject:SetActive(self.CanLike)

    UIEvent.LuaClick(self.Btn_Like().gameObject,function ()
        if self.CanLike == false then
            return
        end
        FriendViewModel.FriendLikeREQ(self.FriendData.userID,Handle(self,self.FriendLikeACK),Handle(self,self.FriendLikeNTF))
    end)

    ---点击名片
    UIEvent.LuaClick(self.Btn_PlayerCard().gameObject, Handle(self,self.OpenBusinessCard))
    UIEvent.LuaClick(self.Btn_PlayerCard2().gameObject, Handle(self,self.OpenBusinessCard))
    UIEvent.LuaClick(self.Btn_PlayerCard3().gameObject, Handle(self,self.OpenBusinessCard))

    ---点击备注
    UIEvent.LuaClick(self.Btn_Remark().gameObject,function ()
        self.Parent:OpenRemarkUI(self.FriendData.userID)
    end)

    ---点击删除好友
    UIEvent.LuaClick(self.Btn_Delete().gameObject,function ()
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips1"),function()
            FriendViewModel.FriendDelREQ(self.FriendData.userID)
        end,nil,2},true)
    end)

    --- 标记好友批量删除
    Tools.ToggleValueChange(self.Tog_BatchDelete01(), function(isOn)
        self:SetBatchDeleteToggleWidgets(isOn)
        self.Parent:OnFriendItemBatchDeleteToggle(isOn, self.FriendData)
    end)

    ---点击接受好友申请
    UIEvent.LuaClick(self.Btn_Agree().gameObject,function ()
        if self.Parent.curFriendCount == tonumber(SteamLocalData.tab[117007][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips2"),1},true)
            return
        end
        FriendViewModel.GetFriendApprovalREQ(self.FriendData.userID,1)
    end)
    ---点击拒绝好友申请
    UIEvent.LuaClick(self.Btn_Reject().gameObject,function ()
        FriendViewModel.GetFriendApprovalREQ(self.FriendData.userID,0)
    end)
    ---点击申请加好友
    UIEvent.LuaClick(self.Btn_Apply().gameObject,function ()
        ---如果要申请的好友是自己
        if self.FriendData.userID == PlayerControl.GetPlayerData().UID then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips3"),2},true)
            return
        end
        if self.Parent.curFriendCount == tonumber(SteamLocalData.tab[117007][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips2"),1},true)
            return
        end
        local BaseREQ =
        {
            userID = self.FriendData.userID
        }
        UnityEngine.Debug.LogError(self.FriendData.status)
        local bytes = assert(pb.encode('PBClient.ClientFriendApplyREQ',BaseREQ))
        TaskControl.AckError = true
        MgrNet.SendReq(MID.CLIENT_FRIEND_APPLY_REQ,bytes,0,nil, Handle(self,self.FriendApplyACK),Handle(self,self.FriendApplyNTF))
    end)

    ---模拟好友对战
    UIEvent.LuaClick(self.Btn_SimulateBattle().gameObject,function()
        StormViewModel.CurPointData = nil
        StormViewModel.CurPointType = nil
        PVPViewModel.FriendPvP(self.FriendData.userID,Handle(self,self.FriendPVPACK),Handle(self,self.FriendPVPNTF))
    end)
end

--region 控件操作
--- 修改普通和高亮的 UI 显示
---@param bIsOn boolean
function M:SetBatchDeleteToggleWidgets(bIsOn)
    self.BDelete_Normal().gameObject:SetActive(not bIsOn)
    self.BDelete_Highlight().gameObject:SetActive(bIsOn)
end

--- 修改 Toggle 状态和 UI 显示，不触发回调
---@param bIsOn boolean
function M:SetBatchDeleteToggleStatesWithoutNotify(bIsOn)
    self.Tog_BatchDelete01():SetIsOnWithoutNotify(bIsOn)
    self:SetBatchDeleteToggleWidgets(bIsOn)
end
--endregion 控件操作

---查看好友名片请求
function M:OpenBusinessCard()
    FriendViewModel.CurFriendID = self.FriendData.userID
    FriendViewModel.FriendInfoREQ(FriendViewModel.CurFriendID)
end
---好友点赞回调
function M:FriendLikeACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendLikeACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips4"),2},true)
    end
end
function M:FriendLikeNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendLikeNTF',buffer))
    if(tab.Goods) then
        ItemControl.PushGroupItemData(tab.Goods,ItemControl.PushEnum.add)
        local vigorinfo =
        {
            vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + math.floor(SteamLocalData.tab[117000][2]),
            vigorTime = Global.GetCurTime()
        }
        PlayerControl.GetPlayerData():PushVigor(vigorinfo)
        ---弹出奖励窗口
        MgrUI.Pop(UID.PopTip_UI,{"likeTips",1,nil,tab.Goods[1].goodsNum},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips5"),2},true)
    end
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    self.Parent:RefreshPowerText(tab.count)
    for k,v in pairs(tab.friendInfos) do
        FriendViewModel.InitLikeData(v.friendID,v.tags)
    end
    self.Parent:ReloadListData()
end
function M:FriendApplyACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendApplyACK',buffer))
    print(tab.errNo)
    if tab.errNo==0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_applysuccess"),2},true)
        self.FriendData.status = 4
        self.Btn_Applied().gameObject:SetActive(true)
        self.Btn_Apply().gameObject:SetActive(false)
        self:RefreshApplyState()
    else
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
    end
end
function M:FriendApplyNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendApplyNTF',buffer))
    --self.Parent:SendSearchFriendRREQ(self.FriendData.userID)
    TaskControl.ChangeStatistics(nil,nil,nil,tab.glory)
    self.Parent:UpdataAddPanel(true)
    UnityEngine.Debug.LogError(self.FriendData.status)
end
---刷新申请状态
function M:RefreshApplyState()
    ---申请状态 0 对方申请中(需要审批) 1 好友,2非好友 ,4已申请对方对方还未操作
    if self.FriendData.status == 4 then
        self.Btn_Applied().gameObject:SetActive(true)
        self.Btn_Apply().gameObject:SetActive(false)
    elseif self.FriendData.status == 2 then
        self.Btn_Applied().gameObject:SetActive(false)
        self.Btn_Apply().gameObject:SetActive(true)
    end
end

function M:FriendPVPACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendFightAck',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        if tab.errNo == 519 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips5"),1},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1"),1},true)
        end
    end
end
function M:FriendPVPNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendFightNtf',buffer))
    ---队伍数据整理
    PVPViewModel.PlayerIsAtk = true
    PVPViewModel.TargetTeam = PVPViewModel.GetPvPRole(tab.defTeam,tab.dSkin)
    PVPViewModel.OwnTeam =PVPViewModel.GetPvPRole(tab.selfTeam,tab.aSkin)
    PVPViewModel.TargetTeamSkin = tab.dSkin
    PVPViewModel.OwnTeamSkin = tab.aSkin
    --PVPViewModel.TargetInfo.name = tab.defName
    --PVPViewModel.OwnInfo.name = tab.selfName
    BattleManager.ClearLuaData()
    ---整理PVP队伍
    for i = 1, #PVPViewModel.OwnTeam do
        table.insert(PVPViewModel.AllRole,i,PVPViewModel.OwnTeam[i])
    end
    for i = 1 + #PVPViewModel.OwnTeam, #PVPViewModel.TargetTeam + #PVPViewModel.OwnTeam do
        table.insert(PVPViewModel.AllRole,i,PVPViewModel.TargetTeam[i - #PVPViewModel.OwnTeam])
    end
    ---video整理进FightVideo
    BattleViewModel.GeneVideo(tab.video)
    ---结果
    BattleViewModel.isLeftWin = tab.leftWin
    ---开始战斗
    MgrTimer.AddDelayNoName(0,function()
        BattleManager.GameMode = BattleManager.GameModeType.FriendPVP
        MgrBattle.GoFight(MgrBattle.fightType.friendPVPBattle,nil,SteamLocalData.tab[117025][2])
    end,nil)
end
return M