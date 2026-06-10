-- Code Auto Create Begin
local M = Class('AddFriendPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.AddFriendPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[AddFriendPop_UI].prefab'
    self.Name = 'Form[AddFriendPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'background','background',2},{'Img_Haoyoudi','background/FriendItem/Img_Haoyoudi',2},{'IconMask','background/FriendItem/IconMask',2},{'HeadIcon','background/FriendItem/IconMask/HeadIcon',2},{'HeadFrame','background/FriendItem/HeadFrame',2},{'Zhiyuanjuese','background/FriendItem/Zhiyuanjuese',2},{'Img_AddPanel','background/FriendItem/Img_AddPanel',2},{'Btn_Apply','background/FriendItem/Img_AddPanel/Btn_Apply',2},{'Img_Shenqingdi','background/FriendItem/Img_AddPanel/Btn_Apply/Img_Shenqingdi',2},{'Img_Shenqingicon','background/FriendItem/Img_AddPanel/Btn_Apply/Img_Shenqingicon',2},{'Btn_PlayerCard','background/FriendItem/Img_AddPanel/Btn_PlayerCard',2},{'Img_Mingpiandi2','background/FriendItem/Img_AddPanel/Btn_PlayerCard/Img_Mingpiandi2',2},{'Img_Mingpianicon2','background/FriendItem/Img_AddPanel/Btn_PlayerCard/Img_Mingpianicon2',2},{'Img_PlayerLevel','background/FriendItem/Img_PlayerLevel',2},
        -- TextMeshProUGUI 列表
        {'Text_Shenqing','background/FriendItem/Img_AddPanel/Btn_Apply/Text_Shenqing',20},{'Text_Mingpian2','background/FriendItem/Img_AddPanel/Btn_PlayerCard/Text_Mingpian2',20},{'Text_PlayerName','background/FriendItem/Text_PlayerName',20},{'Text_LV','background/FriendItem/Img_PlayerLevel/Text_LV',20},{'Text_LastLogin','background/FriendItem/Text_LastLogin',20},{'Text_LastLoginTime','background/FriendItem/Text_LastLoginTime',20},{'Text','background/FriendItem/Text',20},{'Text01','background/FriendItem/Text',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Btn_PlayerCard().gameObject:SetActive(false)
end

function M:OnShow(data)
    self.pData = data[1][1]
    self:InitButton()
    self:RefreshUI()
end

---初始化按钮点击事件
function M:InitButton()
    ---点击背景板
    UIEvent.LuaClick(self.background().gameObject,Handle(self,self.ClosePop))
    ---点击名片
    UIEvent.LuaClick(self.Btn_PlayerCard().gameObject,function()
        FriendViewModel.FriendInfoREQ(self.pData.userID)
    end)
    ---点击申请好友
    UIEvent.LuaClick(self.Btn_Apply().gameObject,function()
        FriendViewModel.FriendApply(self.pData.userID,self)
    end)
end

---刷新UI
function M:RefreshUI()
    self.Text_PlayerName().text = self.pData.nike
    ---好友等级
    self.Text_LV().text =  "LV."..self.pData.friendLv
    ---好友最近登录
    local curTime = MgrNet.GetServerTime() ---获取服务器时间
    local dayNum = tonumber(os.date("%d",curTime + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)) ---获取当前天
    local SubDay = FriendViewModel.TimeDiff(self.pData.loginTime,curTime) ---上次登录和今天相差几天
    if(SubDay == 0) then
        self.Text_LastLoginTime().text = MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips1")
    else
        self.Text_LastLoginTime().text = SubDay..MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips2")
    end
    ---好友头像
    if PlayheadLocalData.tab[self.pData.head] then
        local typeStr = JNStrTool.strSplit("_",PlayheadLocalData.tab[self.pData.head].type)
        local UnlockConditions = nil
        if typeStr[1] == "0" then
            if tonumber(typeStr[2]) ~= 19000 and tonumber(typeStr[2]) ~= 90000 then
                UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
                MgrRes.LoadNormalIcon(self.HeadIcon(),UnlockConditions.id)
            else
                MgrRes.LoadNormalIcon(self.HeadIcon(),90000)
            end
        end
    else
        ---如果表里没有头像数据显示默认头像
        MgrRes.LoadNormalIcon(self.HeadIcon(),tonumber(string.split(PlayheadLocalData.tab[tonumber(SteamLocalData.tab[104015][2])].type,"_")[2]))
    end
    ---好友头像框
    -- 头像框系统暂未实现
end

function M:RefreshFriendState()
    self.Text_Shenqing().text = MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips3")
end

function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end

return M