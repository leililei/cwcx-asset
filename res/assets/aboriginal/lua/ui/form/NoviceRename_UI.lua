-- Code Auto Create Begin
local M = Class('NoviceRename_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NoviceRename_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NoviceRename_UI].prefab'
    self.Name = 'Form[NoviceRename_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'QimingBG','QimingBG',2},{'Zhezhao(hei)','Zhezhao(hei)',2},{'wangdian(xia)','wangdian(xia)',2},{'wangdian(shang)','wangdian(shang)',2},{'InputField','InputField',2},{'Btn_Confirm','Btn_Confirm',2},{'Img_Querengdi','Btn_Confirm/Img_Querengdi',2},{'Img_Shurudi','Img_Shurudi',2},{'Btn_RangeName','Btn_RangeName',2},{'Img_Biaotitiao','Img_Biaotitiao',2},
        -- TextMeshProUGUI 列表
        {'Placeholder','InputField/Text Area/Placeholder',20},{'Text','InputField/Text Area/Text',20},{'Text_Quereng','Btn_Confirm/Text_Quereng',20},{'Text_Huiyinindemingzi','Text_Huiyinindemingzi',20},
        -- TMP_InputField 列表
        {'InputField01','InputField',21},
    }
end
-- Code Auto Create End
require("LocalData/RandomnameLocalData")
function M:OnInit()
    ---初始化随机昵称表
    self:InitNameList()

    self:InitButton()
end
---初始化随机昵称表
function M:InitNameList()
    ---第一部分
    self.FirstList = {}
    ---第二部分
    self.SecondList = {}
    for i, v in pairs(RandomnameLocalData.tab) do
        if v[2] == 1 then
            table.insert(self.FirstList,v[3])
        elseif v[2] == 2 then
            table.insert(self.SecondList,v[3])
        end
    end
end
---初始化按钮
function M:InitButton()
    ---确认名字
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        local player = PlayerControl.GetPlayerData()
        local name = self.InputField01().text
        if name == player.nickname then
            self:NoviceTask()
        else
            ---如果包含特殊字符
            if Tools.ContainSpecialChar(name) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text94"),1},true)
                return
            else
                local lenInByte = #name
                local count = 0

                for i=1,lenInByte do
                    local curByte = string.byte(name, i)
                    local byteCount = 0;
                    if curByte>0 and curByte<=127 then
                        byteCount = 1
                    elseif curByte>=192 and curByte<223 then
                        byteCount = 2
                    elseif curByte>=224 and curByte<239 then
                        byteCount = 3
                    elseif curByte>=240 and curByte<=247 then
                        byteCount = 4
                    end

                    if byteCount == 3 then
                        count = count + 2
                    elseif byteCount == 1 then
                        count = count + 1
                    end
                end
                ---如果大于表里限制最大字符
                if count > tonumber(SteamLocalData.tab[104010][2]) then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("loginpop_ui_tips11"),1},true)
                    return
                end
                ---如果小于表里限制最小字符
                if count < tonumber(SteamLocalData.tab[104009][2]) then
                    MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("loginpop_ui_tips10"),tonumber(SteamLocalData.tab[104009][2])),1},true)
                    return
                end
            end
            PlayerAvatarViewModel.ChooseNickNameClick(name, Handle(self,self.GetACK),Handle(self,self.GetNTF),true)
        end

        ---获取原初结晶
        local balance = ItemControl.GetItemByIdAndType(100000,1)
        local bCount = balance == nil and 0 or balance.count
        ---上报飞游角色创建
        MgrSdk.FlyFunRoleCreate()
    end)
    ---随机名字
    UIEvent.LuaClick(self.Btn_RangeName().gameObject,function()
        math.randomseed(os.clock())
        local one = math.random(1,#self.FirstList)
        local two = math.random(1,#self.SecondList)
        local name = self.FirstList[one]..self.SecondList[two]
        self.InputField01().text = name
    end)
end

function M:GetACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientChooseNikeACK',buffer))
    if tag~=1 then
        return
    end
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("novicerename_ui_changename_fail"),2},true)
    end
end
function M:GetNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientChooseNikeNTF',buffer))
    if tag~=1 then
        return
    end
    print("修改昵称成功")
    PlayerControl.GetPlayerData().nickname = tab.nike
    self:NoviceTask()
    local player = PlayerControl.GetPlayerData()
    MgrSdk.UpdateRole(tostring(player.UID),player.nickname,"101","server")
end
function M:NoviceTask()
    if NoviceControl.GetNoviceState(51001) then
        return
    end
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
        NoviceViewModel.Check(51101)
    end)
end
return M