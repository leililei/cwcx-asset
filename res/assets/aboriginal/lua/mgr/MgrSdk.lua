require("LocalData/PaidgoodsLocalData")

MgrSdk = {}
MgrSdk.CS = CMgrSdk.Instance

MgrSdk.platform = {
    Guest = 0,
    Password = 9000,
    Qoo = 10000,
    Apple = 20000,
}

---飞游用户缓存
MgrSdk.flyUserInfo = {
    user_id = "null",
    timestamp = "null",
    cp_sign = "null",
    token = "null",
}

MgrSdk.sdkUserInfo = {
    platform = 0,
    openid = "",
    token = "",
}

MgrSdk.bindkey = "zBdZzcAFA4t"

MgrSdk.isSwitchAccount = false;
MgrSdk.isPopWindow = false

function MgrSdk.Init()
    ---初始化sdk管理
    MgrSdk.CS:Init()
    local list = {}
    for i,v in pairs(PaidgoodsLocalData.tab) do
        ---找到价格
        table.insert(list, v[4])
    end
    MgrSdk.CS:InitProduct(list)
end

---获取电池电量0-100
function MgrSdk.GetBattery()
    return MgrSdk.CS:GetBattery()
end

---重启应用
function MgrSdk.ReloadApp()
    MgrSdk.CS:ReloadApp()
end

---退出应用
function MgrSdk.QuitApp()
    MgrSdk.CS:QuitApp()
end

--跳转商店
function MgrSdk.JumpToMarket()
    MgrSdk.CS:JumpToMarket()
end

---是否开启飞游sdk
function MgrSdk.IsFlyFun()
    if CMgrHot.Instance:IsOpenFlyFun() then
        return true
    else
        return false
    end
end

function MgrSdk.IsFlyFunQoo()
    if MgrSdk.CS:IsFlyFunQoo() then
        return true
    else
        return false
    end
end

---默认登录类型：true开启默认登录,false关闭默认登录
---采用逻辑为登录失败一次后改为false
-- MgrSdk.FlyFunLoginType = true
---飞游登录
function MgrSdk.FlyFunLogin(isAuto, callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunLogin(isAuto,function(code,request)
        ---关闭默认登录
        -- MgrSdk.FlyFunLoginType = false
        if callback then
            ---code=0登录成功，request为json账户信息
            ---code~=0登录失败，request为error异常信息
            callback(code,request)
        end
        -- if code == 0 then
        --     ---SDK完成登录环节
        --     if MgrSdk.IsFlyFunQoo() then
        --         MgrSdk.FlyFunTrackEvent("vyfe7i","ce_sdk_login")
        --     else
        --         MgrSdk.FlyFunTrackEvent("nfeww1","ce_sdk_login")
        --     end
        -- end
    end)
    -- if not MgrSdk.isPopWindow then
    --     MgrSdk.isPopWindow = true
    --     ---弹出sdk登录界面
    --     if MgrSdk.IsFlyFunQoo() then
    --         MgrSdk.FlyFunTrackEvent("92tvj2","pop_sdk")
    --     else
    --         MgrSdk.FlyFunTrackEvent("cworfu","pop_sdk")
    --     end
    -- end
end

---飞游登出(此Api没用处，需要登出或重登调用login传false)
function MgrSdk.FlyFunLogout(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunLogout(function(code,request)
        if callback then
            ---code=0登录成功
            ---code~=0登录失败
            callback(code,request)
        end
    end)
end

---飞游用户上报(新建账号)
function MgrSdk.FlyFunRoleCreate()
    if not MgrSdk.IsFlyFun() then
        return
    end
    if PlayerControl == nil or ItemControl == nil then
        print("上报飞游用户创建必须在获取服务器推送数据之后")
        return
    end
    print("飞游新建用户上报")
    ---获取角色
    local player = PlayerControl.GetPlayerData()
    ---获取原初结晶
    local balance = ItemControl.GetItemByIdAndType(100000,1)
    local bCount = balance == nil and 0 or balance.count
    MgrSdk.CS:FlyFunRoleCreate(tostring(player.UID),player.nickname,tostring(player.level),"101","server","",tostring(bCount))
end

---飞游用户上报(进入游戏时)
function MgrSdk.FlyFunRoleLauncher()
    if not MgrSdk.IsFlyFun() then
        return
    end
    if PlayerControl == nil or ItemControl == nil then
        print("上报飞游用户进入必须在获取服务器推送数据之后")
        return
    end
    print("飞游进入游戏上报")
    ---获取角色
    local player = PlayerControl.GetPlayerData()
    ---获取原初结晶
    local balance = ItemControl.GetItemByIdAndType(100000,1)
    local bCount = balance == nil and 0 or balance.count
    MgrSdk.CS:FlyFunRoleLauncher(tostring(player.UID),player.nickname,tostring(player.level),"101","server","",tostring(bCount))
end

---飞游用户上报(变更时)
function MgrSdk.FlyFunRoleUpgrade()
    if not MgrSdk.IsFlyFun() then
        return
    end
    if PlayerControl == nil or ItemControl == nil then
        print("上报飞游用户变更必须在获取服务器推送数据之后")
        return
    end
    ---获取用户
    local player = PlayerControl.GetPlayerData()
    ---获取原初结晶
    local balance = ItemControl.GetItemByIdAndType(100000,1)
    local bCount = balance == nil and 0 or balance.count
    MgrSdk.CS:FlyFunRoleUpgrade(tostring(player.UID),player.nickname,tostring(player.level),"101","server","",tostring(bCount))
end

---飞游账号支付
---@param roleId string 用户id
---@param roleName string 用户名
---@param roleLevel string 用户等级
---@param serverId string 服务器id
---@param serverName string 服务器名
---@param orderId string 订单号
---@param notifyUrl string 支付回调地址（服务器的）
---@param cpCallInfo string 透传字段
---@param price string 金额（美金）
---@param productId string 商品id
---@param productName string 商品名称
---@param productDesc string 商品简介
---@param callback function 操作回调(request) request == "0"为支付完成
function MgrSdk.FlyFunCharge(roleId,roleName,roleLevel,
                             serverId,serverName,
                            orderId,notifyUrl,cpCallInfo,
                            price,productId,productName,productDesc,price_jp,
                            callback)
    if not MgrSdk.IsFlyFun() then
        MgrUI.PopHide(UID.ChargeLoading_UI)
        return
    end

    print(string.format("roleId:%s",roleId))
    print(string.format("roleName:%s",roleName))
    print(string.format("roleLevel:%s",roleLevel))
    print(string.format("serverId:%s",serverId))
    print(string.format("serverName:%s",serverName))
    print(string.format("orderId:%s",orderId))
    print(string.format("notifyUrl:%s",notifyUrl))
    print(string.format("cpCallInfo:%s",cpCallInfo))
    print(string.format("price:%s",price))
    print(string.format("productId:%s",productId))
    print(string.format("productName:%s",productName))
    print(string.format("productDesc:%s",productDesc))
    print(string.format("price_jp:%s",price_jp))

    ---飞游要求商品描述不能超过32位
    local desc = string.sub(productDesc , 1, 32)

    ---获取当前平台
    local platform = MgrSdk.GetPlatform() --cpCallInfo
    ---判断支付渠道1为谷歌android支付，2为谷歌ios支付，3为飞游支付
    ---根据依赖的飞游sdk判断，1.2.5为飞游支付
    ---1.2.8为google支付
    ---判断逻辑待完善，暂时默认只有google支付，后续完善
    --- if sdk == 1.2.5 then platform = "3" end --大致这样写


    ---临时修改IOS和Android支付接口参数未同步
    if platform == "1" then
        MgrSdk.CS:FlyFunCharge(roleId,roleName,roleLevel,
                serverId,serverName,
                orderId,notifyUrl,platform,
                price,productId,productName,desc,
                function(request)
                    if callback then
                        callback(request)
                    end
                    ---订单成功后，通知服务器
                    local errCode = "0"
                    if platform == "2" then
                        local data = string.split(request,"|")
                        errCode = data[1]
                    elseif platform == "1" then
                        errCode = request
                    else
                        return
                    end
                    local from = {
                        "userID="..roleId,
                        "orderID="..orderId,
                        "payResult="..(errCode=="0" and 0 or 1),
                        "payResultCommit="..errCode,
                    }
                    local login_url = "&url/UpdateOrder"
                    MgrNet.HttpPost(string.gsub(login_url,"&url",MgrNet.GetCurPayServer()),table.concat(from,','))
                end)
    else
        MgrSdk.CS:FlyFunCharge(roleId,roleName,roleLevel,
                serverId,serverName,
                orderId,notifyUrl,platform,
                price,productId,productName,desc,price_jp,
                function(request)
                    if callback then
                        callback(request)
                    end
                    ---订单成功后，通知服务器
                    local errCode = "0"
                    if platform == "2" then
                        local data = string.split(request,"|")
                        errCode = data[1]
                    elseif platform == "1" then
                        errCode = request
                    else
                        return
                    end
                    local from = {
                        "userID="..roleId,
                        "orderID="..orderId,
                        "payResult="..(errCode=="0" and 0 or 1),
                        "payResultCommit="..errCode,
                    }
                    local login_url = "&url/UpdateOrder"
                    MgrNet.HttpPost(string.gsub(login_url,"&url",MgrNet.GetCurPayServer()),table.concat(from,','))
                end)
    end
end

---飞游判断是否已绑定平台账户
function MgrSdk.FlyFunHasBind(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunHasBind(function(request)
        ---request == "0"为已绑定
        if callback then
            callback(request)
        end
    end)
end

---打开飞游绑定平台
function MgrSdk.FlyFunOpenBind(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunOpenBind(function(request)
        if callback then
            ---request == "0"为绑定成功
            callback(request)
        end
    end)
end

---判断飞游是否已开启客服中心
function MgrSdk.FlyFunIsGm(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunIsGm(function(request)
        if callback then
            ---request == "0"为已开启
            callback(request)
        end
    end)
end

---跳转到飞游客服中心
function MgrSdk.FlyFunOpenGm()
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunOpenGm()
end

---飞游facebook分享链接(链接，标题，内容，回调)
function MgrSdk.FlyFunFBSharingUrl(url,title,content,callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunFBSharingUrl(url,title,content,function(request)
        if callback then
            ---request == "0"为分享成功
            callback(request)
        end
    end)
end

---飞游facebook分享快照(链接，标题，内容，回调)
function MgrSdk.FlyFunFBSharingBit(title,callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunFBSharingBit(title,function(request)
        if callback then
            ---request == "0"为分享成功
            callback(request)
        end
    end)
end

---飞游Line分享链接
function MgrSdk.FlyFunLineSharingUrl(url,title,content)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunLineSharingUrl(url,title,content)
end

---飞游Line分享快照
function MgrSdk.FlyFunLineSharingBit(title)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunLineSharingBit(title)
end

---飞游打点
function MgrSdk.FlyFunTrackEvent(adjustEventCode,fireBaseEventName)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunTrackEvent(adjustEventCode,fireBaseEventName)
end

--删除账号
function MgrSdk.FlyFunDelAcc(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:FlyFunDelAcc(function(request)
        if callback then
            callback(request)
        end
    end)
end

---获取当前平台（与服务器约定协议：1为android，2为ios）
function MgrSdk.GetPlatform()
    local p = MgrSdk.CS:GetPlatform()
    print("当前平台为："..p)
    return p
end

function MgrSdk.BackToLogin()
    MgrNet.IsSocket = false
    MgrNet.CacheMsg = {}
    if MgrUI.CurShowUIName == "Login_UI" then
        return
    end
    MgrUI.UnLock("battle_start")
    MgrUI.UnLock("Novice_LastStep")
    MgrUI.UnLock("OpenMail")
    MgrNet.hasReConnect = false
    MgrNet.IsLogin = false
    MgrNet.CacheMsg = {}
    SysNoticeControl.CloseSysNoticeUI()
    MgrNet.CS:CloseSocket()
    MgrUI.ClosePop(UID.NoviceFrame_UI)
    MgrUI.ClosePop(UID.SummerFrame_UI)
    MgrUI.ClosePop(UID.NewRoleFormation_UI)
    MgrTimer.ResetAll()
    MgrModel.ClearAll()
    HeroControl.ClearSkin()
    MgrSce.SetClearSceneImagePath()
    MgrSce.Load(MgrSce.Scenes.Home, function ()
        MgrUI.GoFirst(UID.Login_UI)
    end)
end

function MgrSdk.AppleLogin(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:AppleLogin(function(code,request)
        if callback then
            ---code=0登录成功，request为json账户信息
            ---code~=0登录失败，request为error异常信息
            callback(code,request)
        end
    end)
end

function MgrSdk.GoogleLogin(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:GoogleLogin(function(code,request)
        if callback then
            ---code=0登录成功，request为json账户信息
            ---code~=0登录失败，request为error异常信息
            callback(code,request)
        end
    end)
end

function MgrSdk.AccountLogin(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:AccountLogin(function(code,request)
        if callback then
            ---code=0登录成功，request为json账户信息
            ---code~=0登录失败，request为error异常信息
            callback(code,request)
        end
    end)
end

function MgrSdk.GuestLogin(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:GuestLogin(function(code,request)
        if callback then
            ---code=0登录成功，request为json账户信息
            ---code~=0登录失败，request为error异常信息
            callback(code,request)
        end
    end)
end

function MgrSdk.MigrationLogin(id, pwd, callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:MigrationLogin(id, pwd, function(code,request)
        if callback then
            ---code=0登录成功，request为json账户信息
            ---code~=0登录失败，request为error异常信息
            callback(code,request)
        end
    end)
end

function MgrSdk.GoogleBind(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:OpenBindGoogle(function(request)
        if callback then
            ---request == "0"为绑定成功
            callback(request)
        end
    end)
end

function MgrSdk.AppleBind(callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:OpenBindApple(function(request)
        if callback then
            ---request == "0"为绑定成功
            callback(request)
        end
    end)
end

function MgrSdk.GetSdkUserAccountType()
    if not MgrSdk.IsFlyFun() then
        return 0
    end
    return MgrSdk.CS:GetSdkUserAccountType()
end

function MgrSdk.IsSetMigrationPassword()
    if not MgrSdk.IsFlyFun() then
        return false
    end
    return MgrSdk.CS:IsSetMigrationPassword()
end

function MgrSdk.GetSdkUserMigrationId()
    if not MgrSdk.IsFlyFun() then
        return ""
    end
    return MgrSdk.CS:GetSdkUserMigrationId()
end

function MgrSdk.SetMigrationPassword(pwd1, pwd2, callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:SetMigrationPassword(pwd1, pwd2, function(request)
        if callback then
            ---request == "0"为绑定成功
            callback(request)
        end
    end)
end

function MgrSdk.GetSdkAccessToken()
    if not MgrSdk.IsFlyFun() then
        return ""
    end
    return MgrSdk.CS:GetSdkAccessToken()
end

function MgrSdk.UpdateRole(roleId, roleName, serverId, serverName)
    if not MgrSdk.IsFlyFun() then
        return
    end
    MgrSdk.CS:UpdateRole(roleId, roleName, serverId, serverName)
end

function MgrSdk.ThirdPartyLogin(tpUserId, tpUserName, callback)
    if not MgrSdk.IsFlyFun() then
        return
    end
    ---快速登录 第一个参数，默认为3
    MgrSdk.CS:ThirdPartyLogin("3", tpUserId, tpUserName, function(code,request)
        if callback then
            ---code=0登录成功，request为json账户信息
            ---code~=0登录失败，request为error异常信息
            callback(code,request)
        end
    end)
end

function MgrSdk.GetSdkDeviceUDID()
    if not MgrSdk.IsFlyFun() then
        return ""
    end
    return MgrSdk.CS:GetSdkDeviceUDID()
end

return MgrSdk