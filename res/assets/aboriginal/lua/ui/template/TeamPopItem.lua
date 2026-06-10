-- Code Auto Create Begin
local M = Class('TeamPopItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/TeamPopItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Juesedi','Panel/Img_Juesedi',2},{'LoopScrollRole','Panel/LoopScrollRole',2},{'Img_Nodata','Panel/LoopScrollRole/Img_Nodata',2},{'Img_Bianjidi','Panel/Input_Info/IconInput/Img_Bianjidi',2},{'Bianjiicon','Panel/Input_Info/IconInput/Img_Bianjidi/Bianjiicon',2},{'Img_InputIcon','Panel/Img_InputIcon',2},{'Btn_RS','Panel/Btn_RS',2},{'Btn_Clear','Panel/Btn_Clear',2},
        -- Button 列表
        {'IconInput','Panel/Input_Info/IconInput',4},
        -- UITemplate 列表
        {'TeamPopItem','/',10},{'TeamRoleItem','Panel/LoopScrollRole/TeamRoleItem',10},
        -- RawImage 列表
        {'Content','Panel/LoopScrollRole/Content',15},{'Input_Info','Panel/Input_Info',15},{'IconInput01','Panel/Input_Info/IconInput',15},
        -- LoopScrollRect 列表
        {'LoopScrollRole01','Panel/LoopScrollRole',18},
        -- TextMeshProUGUI 列表
        {'Text_Empty','Panel/LoopScrollRole/Text_Empty',20},{'Placeholder','Panel/Input_Info/Input_Name/Text Area/Placeholder',20},{'Text','Panel/Input_Info/Input_Name/Text Area/Text',20},{'Text_RS','Panel/Btn_RS/Text_RS',20},{'Text_Qingkong','Panel/Btn_Clear/Text_Qingkong',20},
        -- TMP_InputField 列表
        {'Input_Name','Panel/Input_Info/Input_Name',21},
    }
end
-- Code Auto Create End
---阵型初始化
function M:OnInit()
    self.Input_Name().characterLimit = 8
    ---注册开启输入事件
    UIEvent.LuaClick(self.IconInput().gameObject,function()
        self.Input_Name():ActivateInputField()
    end)
    ---注册输入事件
    self.Input_Name().onEndEdit:AddListener(function(name)
        --判断队名长度
        if string.len(name) > 18 then
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("teampopitem_tips1"),6,18),2},true)
            self.Input_Name():ActivateInputField()
        else
            ---保存本地名称
            TeamControl.ChangeTeamName(self.pData.index,name)
            ---保存服务器名称
            TeamControl.SendSaveTeamData({self.pData.index},false)
        end
    end)

    ---存储/读取阵型按钮
    UIEvent.LuaClick(self.Btn_RS().gameObject,function()
        if self.parent.curType == 1 then
            ---读取阵型
            ---指定阵型设为默认
            if self.isPVP then
                self.parent:ReadTeam(self.pData.index)
            else
                if self.pData.info == nil or #self.pData.info == 0 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("teampopitem_tips2"),2},true)
                    return
                end
                TeamControl.ChangeTeamName(0,self.pData.name)
                TeamControl.ChangeTeamInfo(0,self.pData.info)
                ---保存默认阵型并退出
                self.parent:ReadTeam(self.pData.index)
                --TeamControl.SendSaveTeamData({0},true,function() end)
            end
        else
            if self.parent.pData == nil or #self.parent.pData == 0 then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("teampopitem_tips3"),2},true)
                return
            end
            ---保存阵型
            ---拷贝阵容到默认阵型
            TeamControl.ChangeTeamInfo(0, self.parent.pData)
            ---拷贝阵容到选中阵型
            TeamControl.ChangeTeamInfo(self.pData.index, self.parent.pData)
            ---发送默认及当前阵型
            TeamControl.SendSaveTeamData({0, self.pData.index},true,function()
                ---刷新滑块
                self.parent:ResetView()
            end)
        end
    end)
    ---重置阵型按钮
    UIEvent.LuaClick(self.Btn_Clear().gameObject,function()
        -----清空选中阵型
        --TeamControl.ChangeTeamInfo(self.pData.index, {})
        -----发送选中的阵型
        --TeamControl.SendSaveTeamData({self.pData.index},true,function()
        --    ---刷新滑块
        --    self.parent:ResetView()
        --end)
        ---重置选中阵型
        --TeamControl.ChangeTeamInfo(self.pData.index, TeamControl.GetTeamData(10001).info)
        TeamControl.ChangeTeamInfo(self.pData.index, TeamControl.faultPVPTeam)
        ---发送选中的阵型
        TeamControl.SendSaveTeamData({self.pData.index},true,function()
            ---刷新滑块
            self.parent:ResetView()
        end)
    end)
    ---注册阵型中角色滑块
    self.LoopScrollRole01():SetLuaCellEvent(Handle(self,self.CellItem))
end
---阵型刷新
function M:OnUpdateUI(pData)
    ---@type TeamData
    self.pData = pData[1]
    self.parent = pData[2]
    self.isPVP = pData[3]
    ---设置阵型名称
    self.Input_Name().text = self.pData.name
    ---根据模式类型设置按钮
    self.Text_RS().text = self.parent.curType == 1 and MgrLanguageData.GetLanguageByKey("teampopitem_load") or MgrLanguageData.GetLanguageByKey("teampopitem_save")
    self.Btn_Clear().gameObject:SetActive(self.parent.curType == 2)
    self:ResetView()
end

---Role loop回调
function M:CellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.roleList[idx],self})
end

---Role 刷新
function M:ResetView()
    self.roleList = {}
    if self.pData.info ~= nil then
        for i, v in pairs(self.pData.info) do
            self.roleList[#self.roleList + 1] = HeroControl.GetRoleDataByID(v.roleID)
        end
    end
    ---把数据填充满九个
    local sub = 9 - #self.roleList
    if #self.roleList < 9 then
        for i = 1,sub do
            self.roleList[#self.roleList + 1] = {}
        end
    end
    self.LoopScrollRole01().totalCount = #self.roleList
    self.LoopScrollRole01():RefillCells(0)
    --self.Text_Empty().gameObject:SetActive(#self.roleList == 0)
    self.Text_Empty().gameObject:SetActive(false)
end

return M