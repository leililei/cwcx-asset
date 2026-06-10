-- Code Auto Create Begin
local M = Class('LoginPop02_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.LoginPop02_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[LoginPop02_UI].prefab'
    self.Name = 'Form[LoginPop02_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Menu','Img_Menu',2},{'Title','Img_Menu/Title',2},{'tiao','Img_Menu/Title/tiao',2},{'Btn_Close','Img_Menu/Btn_Close',2},{'Image','Img_Menu/Btn_Close/Image',2},{'Btn_Yanzheng','Img_Menu/Content/Btn_Yanzheng',2},{'Btn_Chushihua','Img_Menu/Content/Btn_Chushihua',2},{'Img_LoginOptions','Img_LoginOptions',2},{'Title01','Img_LoginOptions/Title',2},{'tiao01','Img_LoginOptions/Title/tiao',2},{'Btn_Close01','Img_LoginOptions/Btn_Close',2},{'Image01','Img_LoginOptions/Btn_Close/Image',2},{'Btn_Apple','Img_LoginOptions/Content/Btn_Apple',2},{'Image02','Img_LoginOptions/Content/Btn_Apple/Image',2},{'Btn_Google','Img_LoginOptions/Content/Btn_Google',2},{'Btn_Youke','Img_LoginOptions/Content/Btn_Youke',2},{'Btn_Yinjima','Img_LoginOptions/Content/Btn_Yinjima',2},{'Img_Login','Img_Login',2},{'Title02','Img_Login/Title',2},{'tiao02','Img_Login/Title/tiao',2},{'Btn_Close02','Img_Login/Btn_Close',2},{'Image03','Img_Login/Btn_Close/Image',2},{'Input_User','Img_Login/Input_User',2},{'Input_Possword','Img_Login/Input_Possword',2},{'Btn_Denglu','Img_Login/Btn_Denglu',2},{'Btn_Quxiao','Img_Login/Btn_Quxiao',2},{'Img_Email','Img_Email',2},{'Title03','Img_Email/Title',2},{'tiao03','Img_Email/Title/tiao',2},{'Btn_Close03','Img_Email/Btn_Close',2},{'Image04','Img_Email/Btn_Close/Image',2},{'Input_Email','Img_Email/Input_Email',2},{'Btn_Send','Img_Email/Btn_Send',2},{'Input_Yanzhengma','Img_Email/Input_Yanzhengma',2},{'Btn_Queren','Img_Email/Btn_Queren',2},
        -- Button 列表
        {'Btn_Google01','Img_LoginOptions/Content/Btn_Google',4},
        -- TextMeshProUGUI 列表
        {'Text_Title','Img_Menu/Title/Text_Title',20},{'Text_rTitle','Img_Menu/Text_rTitle',20},{'Text','Img_Menu/Content/Btn_Yanzheng/Text',20},{'Text01','Img_Menu/Content/Btn_Chushihua/Text',20},{'Text_Title01','Img_LoginOptions/Title/Text_Title',20},{'Text02','Img_LoginOptions/Content/Btn_Apple/Text',20},{'Text03','Img_LoginOptions/Content/Btn_Google/Text',20},{'Text04','Img_LoginOptions/Content/Btn_Youke/Text',20},{'Text05','Img_LoginOptions/Content/Btn_Yinjima/Text',20},{'Text_Title02','Img_Login/Title/Text_Title',20},{'Text_ID','Img_Login/Text_ID',20},{'Placeholder','Img_Login/Input_User/Placeholder',20},{'Text06','Img_Login/Input_User/Text',20},{'Text_Possword','Img_Login/Text_Possword',20},{'Placeholder01','Img_Login/Input_Possword/Placeholder',20},{'Text07','Img_Login/Input_Possword/Text',20},{'Text08','Img_Login/Btn_Denglu/Text',20},{'Text09','Img_Login/Btn_Quxiao/Text',20},{'Text_Title03','Img_Email/Title/Text_Title',20},{'Text_Email','Img_Email/Text_Email',20},{'Placeholder02','Img_Email/Input_Email/Placeholder',20},{'Text10','Img_Email/Input_Email/Text',20},{'Text11','Img_Email/Btn_Send/Text',20},{'Text_Yanzhengma','Img_Email/Text_Yanzhengma',20},{'Placeholder03','Img_Email/Input_Yanzhengma/Placeholder',20},{'Text12','Img_Email/Input_Yanzhengma/Text',20},{'Text13','Img_Email/Btn_Queren/Text',20},
        -- TMP_InputField 列表
        {'Input_User01','Img_Login/Input_User',21},{'Input_Possword01','Img_Login/Input_Possword',21},{'Input_Email01','Img_Email/Input_Email',21},{'Input_Yanzhengma01','Img_Email/Input_Yanzhengma',21},
    }
end
-- Code Auto Create End
require("LocalData/LanguageerrorLocalData")
function M:OnInit()
    ---透明遮罩点击事件
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    ---进入游戏界面关闭点击事件
    UIEvent.LuaClick(self.Btn_Close01().gameObject,Handle(self,self.ClosePop))

    ---继承码界面返回点击事件
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject,Handle(self,self.CloseMigration))
    ---继承码界面关闭点击事件
    UIEvent.LuaClick(self.Btn_Close02().gameObject,Handle(self,self.CloseMigration))

    UIEvent.LuaClick(self.Btn_Apple().gameObject, function ()
        MgrUI.Pop(UID.ChargeLoading_UI,nil,true)
        MgrSdk.AppleLogin(Handle(self, self.JpLogin))
    end)

    UIEvent.LuaClick(self.Btn_Google().gameObject, function ()
        MgrUI.Pop(UID.ChargeLoading_UI,nil,true)
        MgrSdk.GoogleLogin(Handle(self, self.JpLogin))
    end)

    UIEvent.LuaClick(self.Btn_Youke().gameObject, function ()
        MgrUI.Pop(UID.ChargeLoading_UI,nil,true)
        MgrSdk.GuestLogin(Handle(self, self.JpLogin))
    end)

    UIEvent.LuaClick(self.Btn_Yinjima().gameObject, function ()
        self.Img_LoginOptions().gameObject:SetActive(false)
        self.Img_Login().gameObject:SetActive(true)
    end)

    ---登录点击事件
    UIEvent.LuaClick(self.Btn_Denglu().gameObject,function()
        ---获取输入框账户
        local userName = self.Input_User01().text
        ---获取输入框密码
        local password = self.Input_Possword01().text
        if userName == "" then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips2"),1},true)
            return
        end
        if password == "" then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips3"),1},true)
            return
        end
        if string.len(userName) < 6 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips4"),1},true)
            return
        end
        if string.len(userName) > 18 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips5"),1},true)
            return
        end
        if string.len(password) < 6 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips200"),1},true)
            return
        end
        if string.len(password) > 18 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips200"),1},true)
            return
        end
        MgrNet.HttpSdkLogin(MgrSdk.platform.Password,userName,password,Handle(self,self.SdkLogin))
        MgrUI.Pop(UID.ChargeLoading_UI,nil,true)
        --MgrSdk.MigrationLogin(userName, password, Handle(self, self.JpLogin))
    end)
end

function M:SdkLogin(info)
    if info.errNo == 0 then
        MgrSdk.ThirdPartyLogin(info.userID, "", function(code, request)
            if code == 0 then
                UnityEngine.DebugEx.LogError("JpLogin succ:"..request)

                --self:LoginReq(info)
                self:JpLogin(code, request)
            else
                --UnityEngine.DebugEx.LogError("JpLogin failed:"..code..":"..request)
                ---添加错误码弹窗
                MgrUI.PopHide(UID.ChargeLoading_UI)
                --MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey(LanguageerrorLocalData.tab[code][2]), 1}, true)
                local tStr = MgrLanguageData.GetLanguageByKey("loginpop_ui_tips20").." ("..code..")"
                MgrUI.Pop(UID.PopTip_UI, {tStr, 1}, true)
            end
        end)
    else
        MgrUI.PopHide(UID.ChargeLoading_UI)
        local tStr = MgrLanguageData.GetLanguageByKey("loginpop_ui_tips20").." ("..info.errNo..")"
        MgrUI.Pop(UID.PopTip_UI, {tStr, 1}, true)
    end
end

function M:JpLogin(code, request)
    if code == 0 then
        UnityEngine.DebugEx.LogError("JpLogin succ:"..request)
        local info = string.split(request, "&")
        MgrNet.IosLogin(info[1], info[2], Handle(self, self.LoginReq))
    else
        --UnityEngine.DebugEx.LogError("JpLogin failed:"..code..":"..request)
        ---添加错误码弹窗
        MgrUI.PopHide(UID.ChargeLoading_UI)
        MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey(LanguageerrorLocalData.tab[code][2]), 1}, true)
    end
end

function M:LoginReq(info)
    print("zqx LoginReq:"..serpent.block(info))
    if info.errNo == 0 then
        ---@type UserInfo 保存输入
        local user = {
            name = info.account,
            userId = info.userID,
            token = info.token,
            gate = info.addrGate
        }
        MgrNet.verifyInfo = user
        ---储存本地账号信息
        LoginViewModel.SaveLocalAccount(info)
        ---检查服务器公告版本一致性
        --NoticeControl.CheckVersion(info.noticeVersion)
        ---跳公告界面
        -- LoginViewModel.FirstLoginNotice(info.userID)
        ---登录成功
        Event.Go("LoginSuccess")
        self:ClosePop()
    else
        if info.errNo == 20000 then
            MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips20000"), function ()
                -- self:LoginError()
                -- self:ShowSdkLogin(false)
            end},true)
        elseif info.errNo == 20001 then
            MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips17"), function ()
                -- self:LoginError()
                -- self:ShowSdkLogin(false)
            end},true)
        elseif info.errNo == 23002 then
            MgrUI.Pop(UID.NoticePop_UI, {info.errMsg, function ()
                MgrSdk.QuitApp()
            end}, true)
        else
            ---登录失败
            local str = MgrLanguageData.GetLanguageByKey("loginpop_ui_tips18")..string.format(":(%d)",info.errNo)
            MgrUI.Pop(UID.ClosePop_UI,{str, function ()
                -- self:LoginError()
                -- self:ShowSdkLogin(false)
            end},true)
        end
        MgrUI.PopHide(UID.ChargeLoading_UI)
    end
end

function M:CloseMigration()
    self.Img_LoginOptions().gameObject:SetActive(true)
    self.Img_Login().gameObject:SetActive(false)
end

function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end
return M