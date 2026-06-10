-- Code Auto Create Begin
local M = Class('LoginPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.LoginPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[LoginPop_UI].prefab'
    self.Name = 'Form[LoginPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Login','Img_Login',2},{'Btn_LBack','Img_Login/Btn_LBack',2},{'Image','Img_Login/Btn_LBack/Image',2},{'Btn_LClose','Img_Login/Btn_LClose',2},{'Image01','Img_Login/Btn_LClose/Image',2},{'Image02','Img_Login/Image',2},{'Image03','Img_Login/Text_LTitle/Image',2},{'Drop_User','Img_Login/Drop_User',2},{'Image04','Img_Login/Drop_User/Image',2},{'Image05','Img_Login/Drop_User/Image',2},{'Arrow','Img_Login/Drop_User/Arrow',2},{'Btn_LGo','Img_Login/Btn_LGo',2},{'Btn_Switch','Img_Login/Btn_Switch',2},{'Img_UnLogin','Img_UnLogin',2},{'Btn_uLBack','Img_UnLogin/Btn_uLBack',2},{'Image06','Img_UnLogin/Btn_uLBack/Image',2},{'Btn_uLClose','Img_UnLogin/Btn_uLClose',2},{'Image07','Img_UnLogin/Btn_uLClose/Image',2},{'Image08','Img_UnLogin/Image',2},{'Image09','Img_UnLogin/Text_uLTitle/Image',2},{'Input_User','Img_UnLogin/Input_User',2},{'Input_Possword','Img_UnLogin/Input_Possword',2},{'Btn_GoRegister','Img_UnLogin/Btn_GoRegister',2},{'Btn_uLGo','Img_UnLogin/Btn_uLGo',2},{'Img_Register','Img_Register',2},{'Btn_rBack','Img_Register/Btn_rBack',2},{'Image10','Img_Register/Btn_rBack/Image',2},{'Btn_rClose','Img_Register/Btn_rClose',2},{'Image11','Img_Register/Btn_rClose/Image',2},{'Image12','Img_Register/Image',2},{'Image13','Img_Register/Text_rTitle/Image',2},{'Input_rUser','Img_Register/Input_rUser',2},{'Input_rPossword','Img_Register/Input_rPossword',2},{'Input_rcPossword','Img_Register/Input_rcPossword',2},{'Input_ActiveCode','Img_Register/Input_ActiveCode',2},{'Btn_Register','Img_Register/Btn_Register',2},{'Drop_Net','Drop_Net',2},{'Arrow01','Drop_Net/Arrow',2},
        -- TextMeshProUGUI 列表
        {'Text_LTitle','Img_Login/Text_LTitle',20},{'Text_CurUser','Img_Login/Drop_User/Text_CurUser',20},{'Text_LoginTime','Img_Login/Drop_User/Text_LoginTime',20},{'Text','Img_Login/Btn_LGo/Text',20},{'Text01','Img_Login/Btn_Switch/Text',20},{'Text_uLTitle','Img_UnLogin/Text_uLTitle',20},{'Placeholder','Img_UnLogin/Input_User/Placeholder',20},{'Text02','Img_UnLogin/Input_User/Text',20},{'Placeholder01','Img_UnLogin/Input_Possword/Placeholder',20},{'Text03','Img_UnLogin/Input_Possword/Text',20},{'Text04','Img_UnLogin/Btn_GoRegister/Text',20},{'Text05','Img_UnLogin/Btn_uLGo/Text',20},{'Text_rTitle','Img_Register/Text_rTitle',20},{'Placeholder02','Img_Register/Input_rUser/Placeholder',20},{'Text06','Img_Register/Input_rUser/Text',20},{'Placeholder03','Img_Register/Input_rPossword/Placeholder',20},{'Text07','Img_Register/Input_rPossword/Text',20},{'Placeholder04','Img_Register/Input_rcPossword/Placeholder',20},{'Text08','Img_Register/Input_rcPossword/Text',20},{'Placeholder05','Img_Register/Input_ActiveCode/Placeholder',20},{'Text09','Img_Register/Input_ActiveCode/Text',20},{'Text10','Img_Register/Btn_Register/Text',20},{'Text_Net','Drop_Net/Text_Net',20},
        -- TMP_InputField 列表
        {'Input_User01','Img_UnLogin/Input_User',21},{'Input_Possword01','Img_UnLogin/Input_Possword',21},{'Input_rUser01','Img_Register/Input_rUser',21},{'Input_rPossword01','Img_Register/Input_rPossword',21},{'Input_rcPossword01','Img_Register/Input_rcPossword',21},{'Input_ActiveCode01','Img_Register/Input_ActiveCode',21},
        -- TMP_Dropdown 列表
        {'Drop_User01','Img_Login/Drop_User',22},{'Drop_Net01','Drop_Net',22},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---协议
    --self.isAgree = true
    ---透明遮罩点击事件
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    ---进入游戏界面返回点击事件
    UIEvent.LuaClick(self.Btn_LBack().gameObject,Handle(self,self.ClosePop))
    ---进入游戏界面关闭点击事件
    UIEvent.LuaClick(self.Btn_LClose().gameObject,Handle(self,self.ClosePop))

    ---进入游戏点击事件
    UIEvent.LuaClick(self.Btn_LGo().gameObject,function()
        if MgrNet.IsSocket then
            return
        end
        local user = LoginViewModel.GetUserList()[self.Drop_User01().value + 1]
        if user == nil then
            LoginViewModel.ClearUser()
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips1"),1},true)
            self:ShowWindow(2)
            return
        end
        ---保存账户
        LoginViewModel.SaveUser(user)
        ---发起连接
        MgrNet.verifyInfo = user
        MgrUI.Pop(UID.ChargeLoading_UI,nil,true)
        if not MgrNet.ConnectServer(Handle(self,self.LauncherGameReq),Handle(self,self.LauncherGameAck),Handle(self,self.LauncherGameNtf)) then
            ---验证失败（网络异常或未保存token）
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips14"),1},true)
            ---移除保存的账户
            LoginViewModel.TryUser(user)
            ---跳转到登录
            self:ShowWindow(2)
        end
    end)

    ---进入游戏界面切换账户按钮事件
    UIEvent.LuaClick(self.Btn_Switch().gameObject,function()
        self:ShowWindow(2)
    end)

    ---登录界面返回点击事件
    UIEvent.LuaClick(self.Btn_uLBack().gameObject,function()
        ---若存在账号返回1否则返回
        if #LoginViewModel.GetUserList() > 0 then
            self:ShowWindow(1)
        else
            self:ClosePop()
        end
    end)

    ---登陆界面关闭点击事件
    UIEvent.LuaClick(self.Btn_uLClose().gameObject,Handle(self,self.ClosePop))
    ---登陆界面切换到注册事件
    UIEvent.LuaClick(self.Btn_GoRegister().gameObject,function()
        self:ShowWindow(3)
    end)

    ---登录按钮事件
    UIEvent.LuaClick(self.Btn_uLGo().gameObject,function()
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
        ---发起登录请求
        ---是否为开发模式
        if MgrNet.CS:GetIsDevelopment() == 1 then
            ---开发模式，
            ---无需等待开服时间
            MgrNet.HttpLogin("Text",userName,password,Handle(self,self.LoginReq))
        else
            ---正式模式，需要等到开服时间才能登录
            MgrNet.HttpLogin("Password",userName,password,Handle(self,self.LoginReq))
        end

    end)

    ---注册界面返回点击事件
    UIEvent.LuaClick(self.Btn_rBack().gameObject,function()
        self:ShowWindow(2)
    end)
    ---注册界面关闭点击事件
    UIEvent.LuaClick(self.Btn_rClose().gameObject,Handle(self,self.ClosePop))
    ---注册界面协议点击事件
    --Tools.ToggleValueChange(self.Tog_Agree01(),function(isOn)
    --    self.isAgree = isOn
    --end,nil)

    ---注册按钮事件
    UIEvent.LuaClick(self.Btn_Register().gameObject,function()
        ---获取输入框账户
        local userName = self.Input_rUser01().text
        ---获取输入框密码
        local password = self.Input_rPossword01().text
        ---获取确认密码
        local rPassword = self.Input_rcPossword01().text
        ---获取激活码
        local activeCode = self.Input_ActiveCode01().text
        --local activeCode = 0
        if userName == "" then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips2"),1},true)
            return
        end
        if password == "" then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips3"),1},true)
            return
        end
        if rPassword == "" then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips7"),1},true)
            return
        end
        if activeCode == "" and MgrNet.CS:GetIsDevelopment() == 0 then
            MgrUI.Pop(UID.PopTip_UI,{"请输入激活码",1},true)
            return
        end
        if password ~= rPassword then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips9"),1},true)
            return
        end
        if string.len(userName) < 6 then
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("loginpop_ui_tips10"), 6),1},true)
            return
        end
        if string.len(userName) > 18 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips11"),1},true)
            return
        end
        if string.len(password) < 6 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips12"),1},true)
            return
        end
        if string.len(password) > 18 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips13"),1},true)
            return
        end
        ---发起注册请求
         --MgrNet.HttpRegister(userName,password,activeCode,Handle(self,self.RegisterReq))
        ---是否为开发模式
        if MgrNet.CS:GetIsDevelopment() == 1 then
            ---开发模式，
            ---无需等待开服时间
            MgrNet.HttpRegister(userName,password,activeCode,Handle(self,self.RegisterReq),"Text")
        else
            ---正式模式，需要等到开服时间才能登录
            MgrNet.HttpRegister(userName,password,activeCode,Handle(self,self.RegisterReq),"ActCode")
        end
    end)

    ---添加服务器选项
    Tools.SetDropdown(self.Drop_Net01().gameObject,MgrNet.GetServerNameList())
    self.Drop_Net01().value = MgrNet.CS:GetIpIndex()
    ---设置服务器选项点击事件
    Tools.SetDropdownSelect(self.Drop_Net01().gameObject,function(value)
        MgrNet.CS:SetIpIndex(value)
    end)
end
---@param args table 组1：打开类型（1登录已有账户、2登录新账户、3注册账户）
function M:OnShow(args)
    self.type = args[1]
    ---若是飞游登录默认必须走登录窗口
    if MgrSdk.IsFlyFun() then
        self.type = 2
    end
    self:ShowWindow(self.type)

    ---是否为开发模式
    if MgrNet.CS:GetIsDevelopment() == 1 then
        ---开启选服按钮
        self.Drop_Net().gameObject:SetActive(true)
    else
        ---关闭选服按钮
        self.Drop_Net().gameObject:SetActive(false)
    end
end

function M:ShowWindow(type)
    if MgrUI.GetPopUI(self.Uid) == nil then
        Log.Error("登录失败依旧关闭了LoginPop,请检查")
        return
    end
    ---持久化进入游戏界面
    self.Img_Login().gameObject:SetActive(type == 1)
    if type == 1 then
        ---刷新
        self.Img_UnLogin().gameObject:SetActive(false)
        self.Img_Register().gameObject:SetActive(false)
        self:ReloadLoginPanel()
    elseif MgrSdk.IsFlyFun() then
        ---第三方飞游登录界面
        self.Img_UnLogin().gameObject:SetActive(false)
        self.Img_Register().gameObject:SetActive(false)
        if type == 2 or type == 3 then
            MgrSdk.FlyFunLogin(function(code,request)
                if code == 0 then
                    ---飞游登录成功，打印用户信息
                    print(request)
                    MgrSdk.flyUserInfo = RapidJson.decode(request)
                    --[[
                        flyUserInfo.user_id,
                        flyUserInfo.timestamp,
                        flyUserInfo.cp_sign,
                        flyUserInfo.token,
                    ]]
                    ---使用飞游账号登录服务器
                    ---发起飞游账户登录请求
                    MgrNet.HttpLoginFly(MgrSdk.flyUserInfo.user_id,MgrSdk.flyUserInfo.timestamp,MgrSdk.flyUserInfo.cp_sign,Handle(self,self.LoginReq))
                else
                    ---飞游登录失败, 打印code及异常信息并关闭登录窗
                    print(code..":"..request)
                    self:ClosePop()
                end
            end)
        end
    else
        ---开发登录界面
        self.Img_UnLogin().gameObject:SetActive(type == 2)
        if type == 2 then
            ---刷新
            self:ReloadUnLoginPanel()
        end
        ---开发注册界面
        self.Img_Register().gameObject:SetActive(type == 3)
        if type == 3 then
            ---刷新(本地注册暂时无需刷新)
        end
    end
end

---刷新登录已有账户界面
function M:ReloadLoginPanel()
    local names = {}
    local userList = LoginViewModel.GetUserList()
    for i, v in ipairs(userList) do
        names[i] = v.name
    end
    if #names > 0 then
        ---清空列表
        Tools.ClearDropdown(self.Drop_User01().gameObject)
        ---重新添加
        Tools.SetDropdown(self.Drop_User01().gameObject,names)
        ---更新默认显示
        self.Drop_User01().value = 0
    else
        self:ShowWindow(2)
    end
end

---刷新登录未有账户界面
function M:ReloadUnLoginPanel()
    local list = LoginViewModel.GetUserList()
    if #list > 0 then
        self.Input_User01().text = list[1].name
        self.Input_Possword01().text = list[1].password
    end
end

---进入游戏Req
function M:LauncherGameReq(err,msgId)
    if err == false then
        ---网络异常处理
        MgrNet.IsSocket = false
        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),err),1},true)
        MgrUI.PopHide(UID.ChargeLoading_UI)
    end
end
---进入游戏Ack
function M:LauncherGameAck(buffer, tag)
    local info = assert(pb.decode('PBClient.ClientVerifyACK',buffer))
    if info.errNo ~= 0 then
        ---失败
        MgrNet.IsSocket = false
        Log.Error(ServerError[info.errNo])
        if info.errNo >= 20000 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips29"),1},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips14"),1},true)
        end
        if MgrUI.GetCurUI().Uid == UID.Login_UI then
            ---移除保存的账户
            LoginViewModel.TryUser(MgrNet.verifyInfo)
            ---跳转到登录
            self:ShowWindow(2)
        else
            ---不在登录界面不要使用此接口重连，请删除
            print("请勿使用登录接口进行重连")
        end
        MgrUI.PopHide(UID.ChargeLoading_UI)
    end
end
---进入游戏Ntf
function M:LauncherGameNtf(buffer, tag)
    local info = assert(pb.decode('PBClient.ClientVerifyNTF',buffer))
    print("登录推送："..serpent.block(info)) ---查看table内容
    if info.errNo == 0 then
        MgrNet.IsLogin = true
        ---更新网关推送数据
        MgrModel.PushData(info, false)
        if MgrUI.GetCurUI().Uid == UID.Login_UI then
            ---发起公告版本请求
            --NoticeControl.VersionReq()
            ---跳转到大厅
            LoginViewModel.EnterHome()
            ---关闭登录窗口
            self:ClosePop()
        end
    else
        MgrNet.IsSocket = false
        ---验证失败（服务器未通过）
        Log.Error(ServerError[info.errNo])
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips14"),1},true)
        ---移除保存的账户
        LoginViewModel.TryUser(MgrNet.verifyInfo)
        ---跳转到登录
        self:ShowWindow(2)
        MgrUI.PopHide(UID.ChargeLoading_UI)
    end
end

---登录回调
function M:LoginReq(info)
    if info.errNo == 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips16"),1},true)
        local userName = self.Input_User01().text
        ---获取输入框密码
        local password = self.Input_Possword01().text
        if MgrSdk.IsFlyFun() then
            userName = "FlyFunGame"
        end
        ---@type UserInfo 保存输入
        local user = {
            name = userName,
            password = password,
            userId = info.userID,
            token = info.token,
            gate = info.addrGate
        }
        LoginViewModel.SaveUser(user)
        ---切换到界面1
        self:ShowWindow(1)
        ---检查服务器公告版本一致性
        --NoticeControl.CheckVersion(info.noticeVersion)
        MgrNet.IsSocket = false
    else
        if info.errNo == 20000 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips29"),1},true)
        elseif info.errNo == 20001 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips17"),1},true)
        elseif info.errNo == 215 then --账号被封
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips15"),1},true)
        elseif info.errNo == 23002 then
            MgrUI.Pop(UID.NoticePop_UI, {info.errMsg, function ()
                MgrSdk.QuitApp()
            end}, true)
        else
            ---登录失败
            local str = MgrLanguageData.GetLanguageByKey("loginpop_ui_tips18")..string.format(":(%d)",info.errNo)
            MgrUI.Pop(UID.PopTip_UI,{str,1},true)
        end
        if MgrSdk.IsFlyFun() then
            ---重新登录飞游
            self:ClosePop()
        end
        MgrUI.PopHide(UID.ChargeLoading_UI)
    end
end
---注册回调
function M:RegisterReq(info)
    if info.errNo == 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips19"),1},true)
        ---切换到界面2
        self:ShowWindow(2)
        self.Input_User01().text = self.Input_rUser01().text
        self.Input_Possword01().text = self.Input_rPossword01().text
    elseif info.errNo == 3 or info.errNo == 200 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips20"),3},true)
    elseif info.errNo == 201 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips201"),3},true)
    elseif info.errNo == 203 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips22"),3},true)
    elseif info.errNo == 204 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips204"),3},true)
    elseif info.errNo == 205 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips205"),3},true)
    elseif info.errNo == 206 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips25"),3},true)
    elseif info.errNo == 208 or info.errNo == 209 or info.errNo == 210 or info.errNo == 212 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips26"),3},true)
    elseif info.errNo >= 2000 and info.errNo < 2100 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips27"),3},true)
    elseif info.errNo == 213 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips28"),3},true)
    elseif info.errNo == 20001 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips17"),3},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips29"),1},true)
    end
    Log.Error(info.errNo)
end

function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end

return M