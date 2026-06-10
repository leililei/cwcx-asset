-- Code Auto Create Begin
local M = Class('RoleCamp_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleCamp_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleCamp_UI].prefab'
    self.Name = 'Form[RoleCamp_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG(mh)','Img_BG(mh)',2},{'RoleCamp','RoleCamp',2},{'Btn_ReturnBg','RoleCamp/Btn_ReturnBg',2},{'Btn_Home','RoleCamp/Btn_ReturnBg/Btn_Home',2},{'Btn_Return','RoleCamp/Btn_ReturnBg/Btn_Return',2},{'Btn_I','RoleCamp/Btn_ReturnBg/Btn_I',2},{'Img_Fenggexian','RoleCamp/Img_Fenggexian',2},{'Mask','RoleCamp/RoleCampScroll/Mask',2},{'RoleCampItem','RoleCamp/RoleCampScroll/RoleCampItem',2},{'Content','RoleCamp/RoleCampScroll/Content',2},{'TeamInfo','TeamInfo',2},{'SpineRole','TeamInfo/SpineRole',2},{'LihuiSpinePanel','TeamInfo/SpineRole/LihuiSpinePanel',2},{'group_1','TeamInfo/SpineRole/LihuiSpinePanel/Ui_TX_0018/group_1',2},{'group_2','TeamInfo/SpineRole/LihuiSpinePanel/Ui_TX_0018/group_2',2},{'group_3','TeamInfo/SpineRole/LihuiSpinePanel/Ui_TX_0018/group_3',2},{'group_4','TeamInfo/SpineRole/LihuiSpinePanel/Ui_TX_0018/group_4',2},{'Btn_Click','TeamInfo/SpineRole/LihuiSpinePanel/Btn_Click',2},{'StarPrefab','TeamInfo/SpineRole/RoleInfo/StarPrefab',2},{'StarPrefabJueXing','TeamInfo/SpineRole/RoleInfo/StarPrefabJueXing',2},{'StarPanel','TeamInfo/SpineRole/RoleInfo/StarPanel',2},{'ProTypeImg','TeamInfo/SpineRole/RoleInfo/ProTypeImg',2},{'pilot','TeamInfo/SpineRole/RoleInfo/ProTypeImg/pilot',2},{'RoleNameBG','TeamInfo/SpineRole/RoleInfo/RoleNameBG',2},{'SpineRoot','TeamInfo/SpineRoot',2},{'zhezhao','TeamInfo/zhezhao',2},{'di(huang)','TeamInfo/Duiming/di(huang)',2},{'Btn_PrevTeam','TeamInfo/Btn_PrevTeam',2},{'Img_Prev','TeamInfo/Btn_PrevTeam/Img_Prev',2},{'Btn_NextTeam','TeamInfo/Btn_NextTeam',2},{'Img_Next','TeamInfo/Btn_NextTeam/Img_Next',2},{'Btn_ReturnBg01','TeamInfo/Btn_ReturnBg',2},{'Img_Fenggexian01','TeamInfo/Btn_ReturnBg/Img_Fenggexian',2},{'Btn_TeamHome','TeamInfo/Btn_ReturnBg/Btn_TeamHome',2},{'Btn_TeamReturn','TeamInfo/Btn_ReturnBg/Btn_TeamReturn',2},{'Btn_I01','TeamInfo/Btn_ReturnBg/Btn_I01',2},
        -- Text 列表
        {'Text_Duiming','TeamInfo/Duiming/Text_Duiming',3},
        -- UITemplate 列表
        {'RoleCampItem01','RoleCamp/RoleCampScroll/RoleCampItem',10},
        -- RawImage 列表
        {'RoleCampScroll','RoleCamp/RoleCampScroll',15},
        -- LoopScrollRect 列表
        {'RoleCampScroll01','RoleCamp/RoleCampScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_CharacterCamps_CN','RoleCamp/Text_CharacterCamps/Text_CharacterCamps_CN',20},{'Text_CharacterCamps_EN','RoleCamp/Text_CharacterCamps/Text_CharacterCamps_EN',20},{'RoleNameTxt','TeamInfo/SpineRole/RoleInfo/RoleNameBG/RoleNameTxt',20},{'Text_TeamJieshao','TeamInfo/Text_TeamJieshao',20},{'Text_Xiaoduijieshao','TeamInfo/Text_Xiaoduijieshao',20},{'Text_SquadDetails_CN','TeamInfo/Btn_ReturnBg/Text_SquadDetails/Text_SquadDetails_CN',20},{'Text_SquadDetails_EN','TeamInfo/Btn_ReturnBg/Text_SquadDetails/Text_SquadDetails_EN',20},
    }
end
-- Code Auto Create End
require("LocalData/RoleattributeLocalData")
require("LocalData/CharactercoordinatesLocalData")
function M:OnInit()
    ---@type RoleData[]
    self.CurTeam = nil
    self.CurTeamIndex = nil
    self.TeamInfo().gameObject:SetActive(false)
    self:InitButton()
    self:InitRoleCampScroll()
end

function M:InitRoleCampScroll()
    ---初始化
    self.RoleCampScroll01():SetLuaCellEvent(Handle(self,self.CellRoleItem))
    self:ResetVoidGearView()
end

---Role loop回调
function M:CellRoleItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.RoleList[idx],self,idx})
end
---Role 刷新
function M:ResetVoidGearView(offset)
    ---获取角色数据
    self.RoleList = IllustrationViewModel.GetCamp()
    ---设置总数
    self.RoleCampScroll01().totalCount = #self.RoleList
    ---刷新滑块
    if offset then
        ---刷新offset位置
        self.RoleCampScroll01():RefillCells(offset)
    else
        ---刷新数据不刷新位置
        self.RoleCampScroll01():RefillCells(0)
    end
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Home().gameObject, Handle(self, function ()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    UIEvent.LuaClick(self.Btn_I().gameObject, Handle(self, function ()
        HelpViewModel.Go(79)
    end))
    UIEvent.LuaClick(self.Btn_I01().gameObject, Handle(self, function ()
        HelpViewModel.Go(79)
    end))
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self, function ()
        IllustrationViewModel.Close()
    end))

    UIEvent.LuaClick(self.Btn_TeamHome().gameObject, Handle(self, function ()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    UIEvent.LuaClick(self.Btn_TeamReturn().gameObject, Handle(self, function ()
        if self.CurTeamIndex ~= nil then
            ---最后一个就移动到滑块底部
            if self.CurTeamIndex == #self.RoleList then
                self.RoleCampScroll01():RefillCellsFromEnd()
            else
                self:ResetVoidGearView(self.CurTeamIndex - 1)
            end
        end
        self.RoleCamp().gameObject:SetActive(true)
        self.TeamInfo().gameObject:SetActive(false)
    end))
    UIEvent.LuaClick(self.Btn_NextTeam().gameObject,function()
        if self.CurTeamIndex == nil then
            return
        end
        ---如果下一个索引超出长度则索引为1
        if self.CurTeamIndex + 1 > #self.RoleList then
            self.CurTeamIndex = 1
        else
            self.CurTeamIndex = self.CurTeamIndex + 1
        end
        local heroPictureList = JNStrTool.strSplit(",",self.RoleList[self.CurTeamIndex][10])
        local data = {}
        for i, v in pairs(heroPictureList) do
            table.insert(data,HeroControl.GetRoleDataByID(tonumber(v)))
        end
        local teamNmae = self.RoleList[self.CurTeamIndex][3]
        local teamDes = self.RoleList[self.CurTeamIndex][9]

        self:UpdataTeamInfo(data,teamNmae,teamDes)
    end)
    UIEvent.LuaClick(self.Btn_PrevTeam().gameObject,function()
        if self.CurTeamIndex == nil then
            return
        end
        ---如果上一个索引超出长度则索引为最后一个
        if self.CurTeamIndex - 1 < 1 then
            self.CurTeamIndex = #self.RoleList
        else
            self.CurTeamIndex = self.CurTeamIndex - 1
        end
        local heroPictureList = JNStrTool.strSplit(",",self.RoleList[self.CurTeamIndex][10])
        local data = {}
        for i, v in pairs(heroPictureList) do
            table.insert(data,HeroControl.GetRoleDataByID(tonumber(v)))
        end
        local teamNmae = self.RoleList[self.CurTeamIndex][3]
        local teamDes = self.RoleList[self.CurTeamIndex][9]

        self:UpdataTeamInfo(data,teamNmae,teamDes)
    end)
end

function M:OnBackKey()
    local isTeamInfo = self.TeamInfo().gameObject.activeSelf
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if isTeamInfo then --小队详情
            if self.CurTeamIndex ~= nil then
                ---最后一个就移动到滑块底部
                if self.CurTeamIndex == #self.RoleList then
                    self.RoleCampScroll01():RefillCellsFromEnd()
                else
                    self:ResetVoidGearView(self.CurTeamIndex - 1)
                end
            end
            self.RoleCamp().gameObject:SetActive(true)
            self.TeamInfo().gameObject:SetActive(false)
            return
        end

        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        IllustrationViewModel.Close()
    end
end


---@param heroData RoleData[]
function M:UpdataTeamInfo(heroData,teamName,teamDes)

    self.RoleCamp().gameObject:SetActive(false)
    self.TeamInfo().gameObject:SetActive(true)
    self.SpineRole().gameObject:SetActive(false)
    self.Text_Duiming().text = teamName
    self.Text_TeamJieshao().text = teamDes
    Tools.ClearAllChild(self.SpineRoot().gameObject)

    ---获取小组英雄信息
    for i, v in ipairs(heroData) do
        local Obj = GameObject.Instantiate(self.SpineRole().gameObject,self.SpineRoot().gameObject.transform,false)
        Obj:SetActive(true)
        Obj:GetComponent("Image").enabled = false

        ---找五个子物体
        local roleInfo = Obj.transform:Find("RoleInfo")
        local ProTypeImg = roleInfo:Find("ProTypeImg"):GetComponent("Image")
        local StarPrefab = roleInfo:Find("StarPrefab").gameObject
        local StarPrefabJueXing = roleInfo:Find("StarPrefabJueXing").gameObject
        local StarPanel = roleInfo:Find("StarPanel").gameObject
        local RoleNameTxt = roleInfo:Find("RoleNameBG/RoleNameTxt"):GetComponent("TextMeshProUGUI")

        ---获取坐标赋给SpineRole
        local corAndScale = string.split(CharactercoordinatesLocalData.tab[v.id].coordinate6,";")     --读取角色图片坐标
        local cordinates = string.split(corAndScale[1],",")     --分离坐标数据
        roleInfo.transform.localPosition = Vector3(tonumber(cordinates[1]),roleInfo.transform.localPosition.y,roleInfo.transform.localPosition.z)

        StarPanel:SetActive(false)
        ---设置立绘的panel
        local LihuiSpinePanel = Obj.transform:Find("LihuiSpinePanel").gameObject
        local TX_Obj = LihuiSpinePanel.transform:Find("Ui_TX_0018").gameObject
        StarPrefab:SetActive(false)
        StarPrefabJueXing:SetActive(false)
        --根据初始星数创建星星
        for k = 1, HeroControl.GetRoleDataByID(v.id).star do
            if HeroControl.GetRoleDataByID(v.id).awaken then
                local starobj = GameObject.Instantiate(StarPrefabJueXing,StarPanel.transform,false)
                starobj:SetActive(true)
            else
                local starobj = GameObject.Instantiate(StarPrefab,StarPanel.transform,false)
                starobj:SetActive(true)
            end
        end
        --创建星星
        --[[
        for k = 1, v.star do
            if v.awaken then
                local starobj = GameObject.Instantiate(StarPrefabJueXing,StarPanel.transform,false)
                starobj:SetActive(true)
            else
                local starobj = GameObject.Instantiate(StarPrefab,StarPanel.transform,false)
                starobj:SetActive(true)
            end
        end]]
        RoleNameTxt.text = v.name
        MgrRes.LoadSprite(ProTypeImg,v.iconCareer)
        --self:CreatSpine(LihuiSpinePanel,v.id)    ---设置spine动画
        ---创建立绘 + 立绘特效
        self:CreateImage(LihuiSpinePanel,v.characterLihui,v.id,i,TX_Obj,roleInfo)
        self:ChangeRoleInfoPosition(roleInfo,v.id)
    end
end

---改变小队姓名面板位置
function M:ChangeRoleInfoPosition(RoleInfo,_RoleId)
    ---读取角色图片坐标
    local corAndScale = string.split(CharactercoordinatesLocalData.tab[_RoleId].coordinate6,";")
    ---分离坐标数据
    local cordinates = string.split(corAndScale[1],",")
    RoleInfo.transform.localPosition = Vector3(RoleInfo.transform.localPosition.x,-110,RoleInfo.transform.localPosition.z)
end

---为小队界面添加立绘
function M:CreateImage(_Root,_RoleLihui,_RoleId,index,TX_Obj,_Info)
    ---读取角色图片坐标
    local corAndScale = string.split(CharactercoordinatesLocalData.tab[_RoleId].coordinate6,";")
    ---分离坐标数据
    local cordinates = string.split(corAndScale[1],",")
    ----放置立绘
    MgrRes.LoadHDIcon(_Root.transform:GetComponent("Image"),_RoleId)
    _Root.transform:GetComponent("Image").preserveAspect = true
    ---激活对应特效组
    --找到对应组
    local group = TX_Obj.transform:Find("group_" .. tostring(index))
    --关掉无关组
    for i = 1, 4, 1 do
        if i ~= index then
            local obj = TX_Obj.transform:Find("group_" .. tostring(i))
            if obj ~= nil then
                obj.gameObject:SetActive(false)
            end
        end
    end
    group.gameObject:SetActive(false)
    ---将位置赋给图片
    _Root.transform.localPosition = Vector3(tonumber(cordinates[1]),tonumber(cordinates[2]),_Root.transform.localPosition.z)
    ---根据坐标内的缩放，对图片进行缩放和旋转
    if tonumber(corAndScale[3]) == 1 then
        _Root.transform.localScale = Vector3(tonumber(-corAndScale[2])*10,tonumber(corAndScale[2])*10,1)
    else
        _Root.transform.localScale = Vector3(tonumber(corAndScale[2])*10,tonumber(corAndScale[2])*10,1)
    end
    --记录初始图片大小
    local originalSize_X = _Root.transform:GetComponent("RectTransform").sizeDelta.x
    local originalSize_Y = _Root.transform:GetComponent("RectTransform").sizeDelta.y
    --按下之后图片的大小
    local pressSize_X = originalSize_X * 0.95
    local pressSize_Y = originalSize_Y * 0.95

    UIEvent.OnPointDown(_Root.transform:Find("Btn_Click").gameObject, Handle(self, function()
        --按下使自身缩小
        _Root.transform:GetComponent("RectTransform").sizeDelta = Vector2(pressSize_X,pressSize_Y)
        --_Info.transform:GetComponent("RectTransform").sizeDelta = Vector2(pressSize_X,pressSize_Y)
    end))
    UIEvent.OnPointUpOrExit(_Root.transform:Find("Btn_Click").gameObject, Handle(self, function()
        --放开鼠标使自身回弹
        _Root.transform:GetComponent("RectTransform").sizeDelta = Vector2(originalSize_X,originalSize_Y)
        --_Info.transform:GetComponent("RectTransform").sizeDelta = Vector2(originalSize_X,originalSize_Y)
    end))

    UIEvent.LuaClick(_Root.transform:Find("Btn_Click").gameObject, Handle(self, function()
        --变回原来大小
        _Root.transform:GetComponent("RectTransform").sizeDelta = Vector2(originalSize_X,originalSize_Y)
        IllustrationViewModel.OpenRoleXiangqing(_RoleId)
    end))
end

function M:CreatSpine(_Root,_RoleId)
    local _LihuiName = RoleattributeLocalData.tab[_RoleId][8]
    MgrRes.LoadWatchAuto(_Root,_RoleId,0,0,0,nil,function(obj)
        obj.transform.localScale = Vector3(0.4, 0.4, 0.4)
    end)
end

function M:ReceiveAchieveManualACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientWriteManualACK',buffer))
    print(tab.errNo)
end

function M:ReceiveAchieveManualNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientWriteManualNTF',buffer))
    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)    ---物品消耗
    ---弹出奖励窗口
    MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
    if tab.medal then
        ItemControl.PushGroupItemData(tab.medal,ItemControl.PushEnum.add)    ---物品消耗
    end
    for i, v in pairs(tab.manualID) do
        if not IllustrationViewModel.RewardList then
            IllustrationViewModel.RewardList = {}
        end
        IllustrationViewModel.RewardList[v] = v
       -- table.insert(IllustrationViewModel.RewardList,v)
    end
    self.RoleCampScroll01():RefreshCells()
    IllustrationViewModel.GetManual()
end

function M:AchieveManual(id)
    local GetManualREQ =
    {
        manualID = id
    }
    print(id)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientWriteManualREQ',GetManualREQ))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_WRITE_MANUAL_REQ,bytes,0,nil,Handle(self,self.ReceiveAchieveManualACK),Handle(self,self.ReceiveAchieveManualNTF))
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end

return M