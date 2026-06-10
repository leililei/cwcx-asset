-- Code Auto Create Begin
local M = Class('FriendAvatar_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.FriendAvatar_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[FriendAvatar_UI].prefab'
    self.Name = 'Form[FriendAvatar_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'background','background',2},{'Haoyoumingpiandi','Haoyoumingpiandi',2},{'Img_Bianxianzuo1','Haoyoumingpiandi/Img_Bianxianzuo1',2},{'Img_Bianxianzuo2','Haoyoumingpiandi/Img_Bianxianzuo2',2},{'Img_Bianxianzuo3','Haoyoumingpiandi/Img_Bianxianzuo3',2},{'LihuiPanel','Haoyoumingpiandi/UIPanel/LihuiPanel',2},{'LihuiSpinePanel','Haoyoumingpiandi/UIPanel/LihuiPanel/LihuiSpinePanel',2},{'HDImage','Haoyoumingpiandi/UIPanel/LihuiPanel/LihuiSpinePanel/HDImage',2},{'Img_Biaotidi1','Haoyoumingpiandi/UIPanel/Bianruduiyuanshu/Img_Biaotidi1',2},{'Img_Chengguang','Haoyoumingpiandi/UIPanel/Qinxin/Img_Chengguang',2},{'Img_Biaotidi2','Haoyoumingpiandi/UIPanel/Qinxin/Img_Biaotidi2',2},{'Img_Chengguang01','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/Img_Chengguang',2},{'Img_Biaotidi201','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/Img_Biaotidi2',2},{'RoleFavorabilityPanel','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/RoleFavorabilityPanel',2},{'CenterFavorSlider','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/RoleFavorabilityPanel/CenterFavorSlider',2},{'Img_Biaotidi3','Haoyoumingpiandi/UIPanel/Zuozhanjindu/Img_Biaotidi3',2},{'Img_Zuozhan','Haoyoumingpiandi/UIPanel/Zuozhanjindu/Img_Zuozhan',2},{'Img_Biaotidi4','Haoyoumingpiandi/UIPanel/Yanxiduanwei/Img_Biaotidi4',2},{'Btn_Chakanicon','Haoyoumingpiandi/UIPanel/Yanxiduanwei/Btn_Chakanicon',2},{'Img_Rank','Haoyoumingpiandi/UIPanel/Yanxiduanwei/Img_Rank',2},{'Img_Rankicon','Haoyoumingpiandi/UIPanel/Yanxiduanwei/Img_Rankicon',2},{'Img_Master','Haoyoumingpiandi/UIPanel/Yanxiduanwei/Img_Master',2},{'Img_Mingpiandi','Haoyoumingpiandi/UIPanel/Mingpian/Img_Mingpiandi',2},{'Img_Mingpiankuang','Haoyoumingpiandi/UIPanel/Mingpian/Img_Mingpiankuang',2},{'Img_Qianmingdi','Haoyoumingpiandi/UIPanel/Mingpian/Signature/Img_Qianmingdi',2},{'Img_Biaotidi5','Haoyoumingpiandi/UIPanel/Mingpian/Img_Biaotidi5',2},{'Img_Nichengdi','Haoyoumingpiandi/UIPanel/Mingpian/Nickname/Img_Nichengdi',2},{'Btn_Copy','Haoyoumingpiandi/UIPanel/Mingpian/ID/Btn_Copy',2},{'Img_Copy','Haoyoumingpiandi/UIPanel/Mingpian/ID/Btn_Copy/Img_Copy',2},{'touxiangyuan2','Haoyoumingpiandi/UIPanel/Mingpian/Btn_Avatar/touxiangyuan2',2},{'touxiangyuan','Haoyoumingpiandi/UIPanel/Mingpian/Btn_Avatar/touxiangyuan',2},{'PlayerIcon','Haoyoumingpiandi/UIPanel/Mingpian/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang','Haoyoumingpiandi/UIPanel/Mingpian/Btn_Avatar/touxiangkuang',2},{'Img_Biaotidi6','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Img_Biaotidi6',2},{'Zhiyuanjuese','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese',2},{'Img_Zhiyuandi','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Img_Zhiyuandi',2},{'Img_Bianhaodi3','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Img_Bianhaodi3',2},{'Img_Bianhaodi2','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Img_Bianhaodi2',2},{'Img_Bianhaodi1','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Img_Bianhaodi1',2},{'Img_NoData1','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Img_NoData1',2},{'Img_NoData2','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Img_NoData2',2},{'Img_NoData3','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Img_NoData3',2},{'TeamRolePrefab','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab',2},{'Img_Touxiangdi','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/Img_Touxiangdi',2},{'RoleIcon','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/RoleIcon',2},{'Img_Kuang','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/Img_Kuang',2},{'Text_Lv','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/Text_Lv',2},{'zhiyeicon','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/zhiyeicon',2},{'Img_Rankdi','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/Img_Rankdi',2},{'EmptyStar','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'StarPanel','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/StarPanel',2},{'JxStarPrefab','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/JxStarPrefab',2},{'StaPrefab','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/StaPrefab',2},{'Xunzhangzhanshi','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi',2},{'Img_Biaotidi7','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Img_Biaotidi7',2},{'Xunzhang','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang',2},{'MainSlot1','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot1',2},{'Img_Icon','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot1/Img_Icon',2},{'VFXParent','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot1/VFXParent',2},{'Img_Bianhaodi201','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot1/Img_Bianhaodi2',2},{'MainSlot2','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot2',2},{'Img_Icon01','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot2/Img_Icon',2},{'VFXParent01','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot2/VFXParent',2},{'Img_Bianhaodi202','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot2/Img_Bianhaodi2',2},{'MainSlot3','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot3',2},{'Img_Icon02','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot3/Img_Icon',2},{'VFXParent02','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot3/VFXParent',2},{'Img_Bianhaodi203','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot3/Img_Bianhaodi2',2},{'MainSlot4','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot4',2},{'Img_Icon03','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot4/Img_Icon',2},{'VFXParent03','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot4/VFXParent',2},{'Img_Bianhaodi204','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot4/Img_Bianhaodi2',2},{'Btn_Guanbi','Haoyoumingpiandi/Btn_Guanbi',2},{'BadgePanel','BadgePanel',2},{'Mask','BadgePanel/Mask',2},{'BadgeDetails','BadgePanel/BadgeDetails',2},{'Img_BadgeIcon','BadgePanel/BadgeDetails/Img_BadgeIcon',2},{'VFXBadge','BadgePanel/BadgeDetails/VFXBadge',2},{'Img_Xian2','BadgePanel/BadgeDetails/Img_Xian2',2},{'Img_Xian1','BadgePanel/BadgeDetails/Img_Xian1',2},{'Line','BadgePanel/BadgeDetails/Line',2},{'Img_Biaotixian1','BadgePanel/BadgeDetails/Img_Biaotixian1',2},
        -- TextMeshProUGUI 列表
        {'Text_Number','Haoyoumingpiandi/UIPanel/Bianruduiyuanshu/Text_Number',20},{'Text_Duiyuanshu','Haoyoumingpiandi/UIPanel/Bianruduiyuanshu/Text_Duiyuanshu',20},{'Text_RoleCount','Haoyoumingpiandi/UIPanel/Bianruduiyuanshu/Text_RoleCount',20},{'Text_RoleSlider','Haoyoumingpiandi/UIPanel/Bianruduiyuanshu/Text_RoleSlider',20},{'Text_Jueseid','Haoyoumingpiandi/UIPanel/Qinxin/Text_Jueseid',20},{'Text_Cronies','Haoyoumingpiandi/UIPanel/Qinxin/Text_Cronies',20},{'Text_Qinxin','Haoyoumingpiandi/UIPanel/Qinxin/Text_Qinxin',20},{'Text_Favorability','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/Text_Favorability',20},{'Text_Qinxin01','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/Text_Qinxin',20},{'Text_Jueseid01','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/Text_Jueseid',20},{'CurRoleFavorabilityText','Haoyoumingpiandi/UIPanel/Qinxinhaogandu/RoleFavorabilityPanel/CurRoleFavorabilityText',20},{'Text_Duanwei','Haoyoumingpiandi/UIPanel/Zuozhanjindu/Text_Duanwei',20},{'Text_Progress','Haoyoumingpiandi/UIPanel/Zuozhanjindu/Text_Progress',20},{'Text_Guanka','Haoyoumingpiandi/UIPanel/Zuozhanjindu/Text_Guanka',20},{'Text_DrillRank','Haoyoumingpiandi/UIPanel/Yanxiduanwei/Text_DrillRank',20},{'Text_Duanwei01','Haoyoumingpiandi/UIPanel/Yanxiduanwei/Text_Duanwei',20},{'Text_BusinessCard','Haoyoumingpiandi/UIPanel/Mingpian/Text_BusinessCard',20},{'Text_Sign','Haoyoumingpiandi/UIPanel/Mingpian/Signature/Text_Sign',20},{'Text_LV','Haoyoumingpiandi/UIPanel/Mingpian/Text_LV',20},{'Text_Dengji','Haoyoumingpiandi/UIPanel/Mingpian/Text_Dengji',20},{'Text_Shangxianshijian','Haoyoumingpiandi/UIPanel/Mingpian/Text_Shangxianshijian',20},{'Text_Nicheng','Haoyoumingpiandi/UIPanel/Mingpian/Nickname/Text_Nicheng',20},{'Text_Fuzhi','Haoyoumingpiandi/UIPanel/Mingpian/ID/Btn_Copy/Text_Fuzhi',20},{'Text_ID','Haoyoumingpiandi/UIPanel/Mingpian/ID/Text_ID',20},{'Text_SupportRole','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Text_SupportRole',20},{'Text_Zhiyuan','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Text_Zhiyuan',20},{'Text_Bianhao3','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Text_Bianhao3',20},{'Text_Bianhao2','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Text_Bianhao2',20},{'Text_Bianhao1','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/Text_Bianhao1',20},{'Text_Grade','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/Text_Grade',20},{'Text_Rank','Haoyoumingpiandi/UIPanel/ZhiyuanjuesePanel/Zhiyuanjuese/TeamRolePrefab/Text_Rank',20},{'Text_MedalDisplay','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Text_MedalDisplay',20},{'Text_Xunzhang','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Text_Xunzhang',20},{'Text_Slot','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot1/Img_Bianhaodi2/Text_Slot',20},{'Text_Slot01','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot2/Img_Bianhaodi2/Text_Slot',20},{'Text_Slot02','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot3/Img_Bianhaodi2/Text_Slot',20},{'Text_Slot03','Haoyoumingpiandi/UIPanel/Xunzhangzhanshi/Xunzhang/MainSlot4/Img_Bianhaodi2/Text_Slot',20},{'Text_MainBadgeName','BadgePanel/BadgeDetails/Text_MainBadgeName',20},{'Text_BadgeDes','BadgePanel/BadgeDetails/Text_BadgeDes',20},{'Text_Title','BadgePanel/BadgeDetails/Text_Title',20},
    }
end
-- Code Auto Create End
require("LocalData/SeniorPVPLocalData")
require("LocalData/PlayheadframeLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    Event.Add("HideBadgeShowPanel", Handle(self, self.HideBadgeShowPanel))
    Event.Add("ShowBadgeShowPanel", Handle(self, self.ShowBadgeShowPanel))
    ---主界面勋章槽位
    self.MainBadgeObj =
    {
        [1] = self.MainSlot1(),
        [2] = self.MainSlot2(),
        [3] = self.MainSlot3(),
        [4] = self.MainSlot4()
    }
    ---隐藏勋章详情面板
    self.BadgePanel().gameObject:SetActive(false)
    ---隐藏
    self.TeamRolePrefab().gameObject:SetActive(false)
end

--打开角色支援界面隐藏勋章展示防止穿透
function M:HideBadgeShowPanel()
    self.Xunzhang().gameObject:SetActive(false)
end

function M:ShowBadgeShowPanel()
    self.Xunzhang().gameObject:SetActive(true)
end

function M:OnBackKey()
    local isBadgePanel = self.BadgePanel().gameObject.activeSelf
    local tab = {"WorldBossRankPop_UI","FriendAvatar_UI","FriendAvatar_UI","WorldBossRankPop_UI","PVPRankPop"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        if isBadgePanel then
            self.BadgePanel().gameObject:SetActive(false)
            return
        end
        --MgrUI.PopHide(self.Uid)
        MgrUI.ClosePop(self.Uid)
        ---清空当前好友名片数据
        FriendViewModel.CurFriendCard = nil
    end
end

function M:OnShow(data)
    self.FriendData = data[1]
    ---当前好友名片数据
    FriendViewModel.CurFriendCard = self.FriendData
    self:InitPlayerInfo()
    self:InitClick()
end

---初始化玩家信息
function M:InitPlayerInfo()
    self.Text_Dengji().text = self.FriendData.friendLv              ---玩家等级
    ---玩家头像
    if PlayheadLocalData.tab[self.FriendData.head] then
        ---如果有头像数据
        local typeStr = JNStrTool.strSplit("_",PlayheadLocalData.tab[self.FriendData.head].type)
        local UnlockConditions = nil
        if typeStr[1] == "0" then
            if tonumber(typeStr[2]) ~= 19000 and tonumber(typeStr[2]) ~= 90000 then
                UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
                MgrRes.LoadNormalIcon(self.PlayerIcon(),UnlockConditions.id)
            else
                MgrRes.LoadNormalIcon(self.PlayerIcon(),90000)
            end
        elseif typeStr[1] == "1" then
            MgrRes.LoadNormalIcon(self.PlayerIcon(),tonumber(typeStr[3]))
        end
    else
        MgrRes.LoadNormalIcon(self.PlayerIcon(),tonumber(string.split(PlayheadLocalData.tab[tonumber(SteamLocalData.tab[104015][2])].type,"_")[2]))
    end

    --加载玩家头像框
    if self.FriendData.headFrame == 0 then
        MgrRes.LoadSprite(self.touxiangkuang(),"Playheadicon/Img_Touxiangkuang0")
    else
        local frameName = PlayheadframeLocalData.tab[self.FriendData.headFrame][3]
        MgrRes.LoadSprite(self.touxiangkuang(),"Playheadicon/" .. frameName)
    end

    self.Text_ID().text = MgrLanguageData.GetLanguageByKey("ui_mingpian_idtext1").. "："..self.FriendData.friendID          ---玩家id
    ---好友昵称 如果有昵称 拼接在名字的后面
    if(self.FriendData.friendRemark ~= "") then
        self.Text_Nicheng().text = self.FriendData.friendNick.."<color=#72A6FF>("..self.FriendData.friendRemark..")</color>"
    else
        self.Text_Nicheng().text = self.FriendData.friendNick           ---玩家名称
    end
    ---好友最后上线时间文本赋值
    local curTime = MgrNet.GetServerTime() ---获取服务器时间
    local t1 = os.date("%Y%m%d",self.FriendData.lastTime)
    local t2 = os.date("%Y%m%d",curTime)
    local day1 = {}
    local day2 = {}
    day1.year,day1.month,day1.day = string.match(t1,"(%d%d%d%d)(%d%d)(%d%d)")
    day2.year,day2.month,day2.day = string.match(t2,"(%d%d%d%d)(%d%d)(%d%d)")
    local numDay1 = os.time(day1)
    local numDay2 = os.time(day2)

    local subTime = 0
    local dayTime = 0
    ---相差了多少天
    dayTime = math.floor((numDay2 - numDay1)/(3600*24))
    if self.FriendData.online == 1 then
        ---好友在线
        self.Text_Shangxianshijian().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_online")
    else
        ---如果是离线，计算距上一次登录过了多久
        if self.FriendData.online == 0 then
            ---如果是同一天就精确到分钟
            if(dayTime == 0) then
                if(numDay2 - numDay1 > 3600) then
                    subTime = math.floor((numDay2 - numDay1)/3600)
                    self.Text_Shangxianshijian().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_lastonlinetime")..subTime..MgrLanguageData.GetLanguageByKey("friendavatar_ui_fewhourago")
                else
                    if(numDay1 - numDay2 > 60) then
                        subTime = math.floor((numDay2 - numDay1)/60)
                        self.Text_Shangxianshijian().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_lastonlinetime")..subTime..MgrLanguageData.GetLanguageByKey("friendavatar_ui_fewminago")
                    else
                        self.Text_Shangxianshijian().text = string.format(MgrLanguageData.GetLanguageByKey("friendavatar_ui_tips"),1)
                    end
                end
            else
                self.Text_Shangxianshijian().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_lastonlinetime")..dayTime..MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips2")
            end
        end
    end

    self.Text_Sign().text = self.FriendData.signature               ---玩家签名
    self.Text_RoleCount().text = self.FriendData.roleNum           ---队员数量
    ---玩家队员数量和队员数量百分比
    local allhero = HeroControl.GetAllHero()
    local totleHero = 0
    for key, value in pairs(allhero) do
        if RoleattributeLocalData.tab[value.id][7] == 1 then
            totleHero = totleHero + 1
        end
    end
    local value = self.FriendData.roleNum / totleHero
    self.Text_RoleSlider().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_database")..math.floor(value * 100).."%</color>"
    ---作战进度
    if(self.FriendData.careerID) then
        local array ={}
        for k,v in pairs(self.FriendData.careerID) do
            ---如果有数据
            if StormControl.GetStormPointByID(v) then
                ---如果是主线关卡
                if StormControl.GetStormScrollById(StormControl.GetStormPointByID(v).scrollID).raidType == 0 then
                    array[#array+1] = StormControl.GetStormPointByID(v)
                end
            end
        end
        table.sort(array,function (a,b)
            if(a.id>b.id) then
                return true
            end
        end)
        ---如果有数据就显示数据，如果没有就显示1-1
        self.Text_Guanka().text = array[1] and array[1].idxName or "1-1"
    else
        self.Text_Guanka().text = "1-1"
    end

    ---演习段位
    if self.FriendData.bRankLevel ~= 0 then
        local rank = PVPViewModel.GetPvPRank(self.FriendData.bRankLevel)
        MgrRes.LoadSprite(self.Img_Rankicon(),"Level/"..rank[3])
        MgrRes.LoadSprite(self.Img_Rank(),"Level/"..rank[17])
    else
        MgrRes.LoadSprite(self.Img_Rankicon(),"Level/liebingicon")
        MgrRes.LoadSprite(self.Img_Rank(),"Level/liebing")
    end
    if nil == self.FriendData.championTop or 0 == self.FriendData.championTop then
        self.Img_Rank().gameObject:SetActive(true);
        self.Img_Master().gameObject:SetActive(false);
    else
        self.Img_Rank().gameObject:SetActive(false);
        self.Img_Master().gameObject:SetActive(true);
        MgrRes.LoadSprite(self.Img_Master(),string.format("Level/master%02d", self.FriendData.championTop));
    end

    --local score = self.FriendData.bscore
    --local rank = self.FriendData.bRank
    --for i, v in ipairs(SeniorPVPLocalData.tab) do
    --    if score < 1000 then
    --        MgrRes.LoadSprite(self.Img_Rankicon(),"Level/liebingicon")
    --        MgrRes.LoadSprite(self.Img_Rank(),"Level/liebing")
    --        break
    --    end
    --    if score >= tonumber(v[4]) then
    --        if score < 2500 then
    --            MgrRes.LoadSprite(self.Img_Rankicon(),"Level/"..v[3])
    --            MgrRes.LoadSprite(self.Img_Rank(),"Level/"..v[17])
    --            break
    --        else
    --            if rank >= v[5] and rank<=v[6] then
    --                MgrRes.LoadSprite(self.Img_Rankicon(),"Level/"..v[3])
    --                MgrRes.LoadSprite(self.Img_Rank(),"Level/"..v[17])
    --                break
    --            end
    --        end
    --    end
    --end
    ---支援角色
    self.RoleList = {
        self:Zhiyuanjuese().transform:Find("Img_NoData1").gameObject,
        self:Zhiyuanjuese().transform:Find("Img_NoData2").gameObject,
        self:Zhiyuanjuese().transform:Find("Img_NoData3").gameObject,
    }
    if(self.FriendData.supports) then
        self.equipPassLv = tonumber(SteamLocalData.tab[105009][2])   --装备技能加成等级
        for k, v in pairs(self.FriendData.supports) do
            local obj = GameObject.Instantiate(self.TeamRolePrefab().gameObject,self.RoleList[v.slot].transform,false)
            obj:SetActive(true)
            obj.transform.localPosition = Vector3.zero
            local RoleIcon = obj.transform:Find("RoleIcon"):GetComponent("Image")
            local Text_Grade = obj.transform:Find("Text_Grade"):GetComponent("TextMeshProUGUI")
            local Img_Kuang = obj.transform:Find("Img_Kuang"):GetComponent("Image")
            local zhiyeicon = obj.transform:Find("zhiyeicon"):GetComponent("Image")
            local Text_Rank = obj.transform:Find("Text_Rank"):GetComponent("TextMeshProUGUI")
            local StarPanel = obj.transform:Find("StarPanel").gameObject
            local StaPrefab = obj.transform:Find("StaPrefab").gameObject
            local JxStarPrefab = obj.transform:Find("JxStarPrefab").gameObject
            ---@type RoleData
            local heroData = HeroControl.GetRoleDataByID(v.heroID)
            MgrRes.LoadQIcon(RoleIcon,v.skin ~= nil and v.skin or v.heroID)
            MgrRes.LoadSprite(Img_Kuang,heroData.iconBattleFrame)
            MgrRes.LoadSprite(zhiyeicon,heroData.iconCareer)
            Text_Grade.text = v.heroLevel
            local equipPass = true   --是否满足装备加成等级
            for index,level in pairs(v.equip) do
                ---如果所有装备等级满足加成等级 角色技能等级+1
                if level < self.equipPassLv then
                    equipPass = false
                    break
                end
            end
            if v.heroFlag then
                Text_Rank.text = v.heroCurSkill
            else
                Text_Rank.text = equipPass and v.heroSkillLevel + 1 or v.heroSkillLevel
            end

            Text_Rank.color = equipPass and Color(1,0.772549,0.2235294,1) or Color(1,1,1,1)
            for i = 1, v.heroStar do
                local star = nil
                if v.heroAwaken ~= 0 then
                    star  = GameObject.Instantiate(JxStarPrefab,StarPanel.transform,false)
                else
                    star  = GameObject.Instantiate(StaPrefab,StarPanel.transform,false)
                end
                star:SetActive(true)
            end
            StaPrefab:SetActive(false)
            JxStarPrefab:SetActive(false)

            ---点击支援角色区域
            UIEvent.LuaClick(obj,function ()
                RoleCardViewModel.GetRole(v.heroID,v)
                ---弹出详情面板逻辑
                RoleCardViewModel.OpenFriendRoleUI()
                ---关闭自己
                --MgrUI.ClosePop(self.Uid)
                ---关闭排名弹窗 避免在详情界面弹窗盖住UI
                MgrUI.ClosePop(UID.PVPRankPop)
            end)
        end
    end

    ---勋章展示
    if(self.FriendData.manualID) then
        local badge = nil
        for i, v in pairs(self.FriendData.manualID) do
            local icon =  self.MainBadgeObj[i].transform:Find("Img_Icon"):GetComponent("Image")
            local VFXParent =  self.MainBadgeObj[i].transform:Find("VFXParent"):GetComponent("Image")
            if v>0 then
                 badge = HideLocalData.tab[v]
                 if badge.anime and badge.anime ~= "0" then
                    Tools.ClearAllChild(VFXParent.gameObject)
                    icon.color = Color(icon.color.r,icon.color.g,icon.color.b,0)
                    self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
                    MgrRes.GetPrefab(self.vfx_path..badge.anime..".prefab",function(Obj)
                        if Obj == nil then return end
                        Obj.transform:SetParent(VFXParent.gameObject.transform)
                        Obj.transform.localPosition = Vector3.zero
                        Obj.transform.localScale = Vector3(19,19,1)
                    end)
                else
                    Tools.ClearAllChild(VFXParent.gameObject)
                    MgrRes.LoadSprite(icon,"Item/"..badge.icon)
                end
            else
                Tools.ClearAllChild(VFXParent.gameObject)
                MgrRes.LoadSprite(icon,"Item/Img_Wu")
            end
            ---点击查看勋章详情
            UIEvent.LuaClick(icon.gameObject,function ()
                self.CurSelectBadge = HideLocalData.tab[v]
                if(self.CurSelectBadge == nil) then
                    return
                end
                self.BadgePanel().gameObject:SetActive(true)

                if self.CurSelectBadge.anime and self.CurSelectBadge.anime ~= "0" then
                    Tools.ClearAllChild(self.VFXBadge().gameObject)
                    self.Img_BadgeIcon().gameObject:SetActive(false)
                    self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
                    MgrRes.GetPrefab(self.vfx_path..self.CurSelectBadge.anime..".prefab",function(Obj)
                        if Obj == nil then return end
                        Obj.transform:SetParent(self.VFXBadge().gameObject.transform)
                        Obj.transform.localPosition = Vector3.zero
                        Obj.transform.localScale = Vector3(65,65,1)
                    end)
                else
                    Tools.ClearAllChild(self.VFXBadge().gameObject)
                    self.Img_BadgeIcon().gameObject:SetActive(true)
                    MgrRes.LoadSprite(self.Img_BadgeIcon(),"Item/"..self.CurSelectBadge.icon)
                end

                self.Text_BadgeDes().text = self.CurSelectBadge.txt
                self.Text_MainBadgeName().text = self.CurSelectBadge.name
            end)
        end
    end

    ---设置看板娘立绘
    self.SpineObj = self:CreatSpine(self.LihuiSpinePanel().gameObject,self.FriendData.skin ~= nil and self.FriendData.skin or self.FriendData.menuRoleID)
    ---设置看板娘名字
    if self.FriendData.menuRoleID == 19000 or self.FriendData.menuRoleID == 90000 then
        self.Text_Jueseid().text = MgrLanguageData.GetLanguageByKey("friendavatar_ui_jiya")
    else
        self.Text_Jueseid().text = RoleattributeLocalData.tab[self.FriendData.menuRoleID][2]
    end
end

function M:InitClick()
    ---点击关闭
    UIEvent.LuaClick(self.Btn_Guanbi().gameObject,function ()
        --MgrUI.PopHide(self.Uid)
        MgrUI.ClosePop(self.Uid)
        ---清空当前好友名片数据
        FriendViewModel.CurFriendCard = nil
    end)
    ---点击背景
    UIEvent.LuaClick(self.background().gameObject,function ()
        --MgrUI.PopHide(self.Uid)
        MgrUI.ClosePop(self.Uid)
        ---清空当前好友名片数据
        FriendViewModel.CurFriendCard = nil
    end)
    ---点击复制ID
    UIEvent.LuaClick(self.Btn_Copy().gameObject,function ()
        --GUIUtility.systemCopyBuffer = self.FriendData.friendID
        Tools.CopyToClipboard(self.FriendData.friendID)
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendavatar_ui_copyid"),1},true)
    end)
    ---点击徽章空白区域隐藏徽章详情
    UIEvent.LuaClick(self.Mask().gameObject,function ()
        self.BadgePanel().gameObject:SetActive(false)
    end)
end
---创建立绘
function M:CreatSpine(_Root,_RoleId)
    MgrRes.LoadHDIcon_OriginalSize(self.HDImage(),_RoleId)
    if nil == CharactercoordinatesLocalData.tab[_RoleId] then
        return;
    end
    local _PosInfoTab = CharactercoordinatesLocalData.tab[_RoleId].coordinate14
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    self.HDImage().transform.localPosition = Vector3(tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),0)
    self.HDImage().transform.localScale = Vector3(tonumber(_tempPosTab1[2]),tonumber(_tempPosTab1[2]),1)
    --if(_RoleId == 19000 or _RoleId == 90000) then
    --    _RoleId = 90000
    --    local _PosInfoTab=Live2dLocalData.tab[_RoleId][6]
    --    local _tempPosTab1 =JNStrTool.strSplit(";", _PosInfoTab)
    --    local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])
    --    MgrRes.LoadWatchAuto(_Root,_RoleId,tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),tonumber(_tempPosTab1[2]),nil,function(obj)
    --        self.CurSpineObj = obj
    --    end)
    --else
    --    --local _LihuiName=RoleattributeLocalData.tab[_RoleId].coordinate6
    --    --local _PosInfoTab=CharactercoordinatesLocalData.tab[_RoleId].coordinate11
    --    --local _tempPosTab1 =JNStrTool.strSplit(";", _PosInfoTab)
    --    --local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])
    --    --MgrRes.LoadWatchAuto(_Root,_RoleId,tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),tonumber(_tempPosTab1[2]),nil,function(obj)
    --    --    self.CurSpineObj = obj
    --    --end)
    --    local _PosInfoTab = CharactercoordinatesLocalData.tab[_RoleId].coordinate11
    --    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    --    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    --    MgrRes.LoadWatch3DSpineInUI(_Root, _RoleId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
    --        self.SpineObj = obj
    --        obj.transform.gameObject.layer = 5
    --        local ske = obj.transform:GetComponent("SkeletonAnimation")
    --        if ske then
    --            ske:SetOrderLayer(self.CavOrder-2,"Default")
    --        end
    --    end)
    --end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Remove("HideBadgeShowPanel", Handle(self, self.HideBadgeShowPanel))
    Event.Remove("ShowBadgeShowPanel", Handle(self, self.ShowBadgeShowPanel))
end

return M