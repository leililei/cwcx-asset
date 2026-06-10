-- Code Auto Create Begin
local M = Class('FreePoolOptional_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.FreePoolOptional_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[FreePoolOptional_UI].prefab'
    self.Name = 'Form[FreePoolOptional_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackGroundImg','BackGroundImg',2},{'SSRPanel1','BackGroundImg/SSRPanel1',2},{'Img_Zixuandi1_ssr','BackGroundImg/SSRPanel1/Img_Zixuandi1_ssr',2},{'Img_Jia','BackGroundImg/SSRPanel1/Img_Zixuandi1_ssr/Img_Jia',2},{'RoleLihuiImg','BackGroundImg/SSRPanel1/Img_Zixuandi1_ssr/RoleLihuiImg',2},{'NamePanel','BackGroundImg/SSRPanel1/Img_Zixuandi1_ssr/RoleLihuiImg/NamePanel',2},{'ProTypeImg','BackGroundImg/SSRPanel1/Img_Zixuandi1_ssr/RoleLihuiImg/NamePanel/ProTypeImg',2},{'Img_Jiaobiao_ssr','BackGroundImg/SSRPanel1/Img_Jiaobiao_ssr',2},{'Img_SSR','BackGroundImg/SSRPanel1/Img_SSR',2},{'SSRPanel2','BackGroundImg/SSRPanel2',2},{'Img_Zixuandi1_ssr01','BackGroundImg/SSRPanel2/Img_Zixuandi1_ssr',2},{'Img_Jia01','BackGroundImg/SSRPanel2/Img_Zixuandi1_ssr/Img_Jia',2},{'RoleLihuiImg01','BackGroundImg/SSRPanel2/Img_Zixuandi1_ssr/RoleLihuiImg',2},{'NamePanel01','BackGroundImg/SSRPanel2/Img_Zixuandi1_ssr/RoleLihuiImg/NamePanel',2},{'ProTypeImg01','BackGroundImg/SSRPanel2/Img_Zixuandi1_ssr/RoleLihuiImg/NamePanel/ProTypeImg',2},{'Img_Jiaobiao_ssr01','BackGroundImg/SSRPanel2/Img_Jiaobiao_ssr',2},{'Img_SSR01','BackGroundImg/SSRPanel2/Img_SSR',2},{'SRPanel1','BackGroundImg/SRPanel1',2},{'Img_Zixuandi1_sr','BackGroundImg/SRPanel1/Img_Zixuandi1_sr',2},{'Img_Jia02','BackGroundImg/SRPanel1/Img_Zixuandi1_sr/Img_Jia',2},{'RoleLihuiImg02','BackGroundImg/SRPanel1/Img_Zixuandi1_sr/RoleLihuiImg',2},{'NamePanel02','BackGroundImg/SRPanel1/Img_Zixuandi1_sr/RoleLihuiImg/NamePanel',2},{'ProTypeImg02','BackGroundImg/SRPanel1/Img_Zixuandi1_sr/RoleLihuiImg/NamePanel/ProTypeImg',2},{'Img_Jiaobiao_sr','BackGroundImg/SRPanel1/Img_Jiaobiao_sr',2},{'Img_SR','BackGroundImg/SRPanel1/Img_SR',2},{'SRPanel2','BackGroundImg/SRPanel2',2},{'Img_Zixuandi1_sr01','BackGroundImg/SRPanel2/Img_Zixuandi1_sr',2},{'Img_Jia03','BackGroundImg/SRPanel2/Img_Zixuandi1_sr/Img_Jia',2},{'RoleLihuiImg03','BackGroundImg/SRPanel2/Img_Zixuandi1_sr/RoleLihuiImg',2},{'NamePanel03','BackGroundImg/SRPanel2/Img_Zixuandi1_sr/RoleLihuiImg/NamePanel',2},{'ProTypeImg03','BackGroundImg/SRPanel2/Img_Zixuandi1_sr/RoleLihuiImg/NamePanel/ProTypeImg',2},{'Img_Jiaobiao_sr01','BackGroundImg/SRPanel2/Img_Jiaobiao_sr',2},{'Img_SR01','BackGroundImg/SRPanel2/Img_SR',2},{'Img_SRxian','BackGroundImg/Img_SRxian',2},{'Img_SSRxian','BackGroundImg/Img_SSRxian',2},{'Btn_Cancel','BackGroundImg/Btn_Cancel',2},{'Btn_Cutpage','BackGroundImg/Btn_Cancel/Btn_Cutpage',2},{'Btn_Confirm','BackGroundImg/Btn_Confirm',2},{'Btn_Cutpage01','BackGroundImg/Btn_Confirm/Btn_Cutpage',2},{'Content','loop/Content',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Btn_Back','UpperBtnPanel/Btn_Back',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'i','UpperBtnPanel/i',2},
        -- UITemplate 列表
        {'CardPoolDetailPanel2','loop/CardPoolDetailPanel2',10},
        -- LoopScrollRect 列表
        {'loop','loop',18},
        -- TextMeshProUGUI 列表
        {'Text_Name','BackGroundImg/SSRPanel1/Img_Zixuandi1_ssr/RoleLihuiImg/NamePanel/Text_Name',20},{'Text_Name01','BackGroundImg/SSRPanel2/Img_Zixuandi1_ssr/RoleLihuiImg/NamePanel/Text_Name',20},{'Text_Name02','BackGroundImg/SRPanel1/Img_Zixuandi1_sr/RoleLihuiImg/NamePanel/Text_Name',20},{'Text_Name03','BackGroundImg/SRPanel2/Img_Zixuandi1_sr/RoleLihuiImg/NamePanel/Text_Name',20},{'Text_SR','BackGroundImg/Img_SRxian/Text_SR',20},{'Text_SSR','BackGroundImg/Img_SSRxian/Text_SSR',20},{'Text_Cancel','BackGroundImg/Btn_Cancel/Text_Cancel',20},{'Text_Confirm','BackGroundImg/Btn_Confirm/Text_Confirm',20},{'Text_Title_CN','UpperBtnPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperBtnPanel/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.CurLoopList = {}
    self.SelectRole = {
        [1] = { btn = self.SSRPanel1().gameObject, Img = self.RoleLihuiImg(), Job = self.ProTypeImg(), Name = self.Text_Name(), roleData = nil, rank = 4 },
        [2] = { btn = self.SSRPanel2().gameObject, Img = self.RoleLihuiImg01(), Job = self.ProTypeImg01(), Name = self.Text_Name01(), roleData = nil, rank = 4 },
        [3] = { btn = self.SRPanel1().gameObject, Img = self.RoleLihuiImg02(), Job = self.ProTypeImg02(), Name = self.Text_Name02(), roleData = nil, rank = 3 },
        [4] = { btn = self.SRPanel2().gameObject, Img = self.RoleLihuiImg03(), Job = self.ProTypeImg03(), Name = self.Text_Name03(), roleData = nil, rank = 3 },
    }
    
    Event.Add("FreePoolSelRole",Handle(self,self.UpdataSelRole))
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化按钮
    self:InitButton()
end
---初始化按钮
function M:InitButton()
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        MgrUI.ClosePop(self.Uid)
    end))
    ---取消
    UIEvent.LuaClick(self.Btn_Cancel().gameObject, Handle(self, function()
        MgrUI.ClosePop(self.Uid)
    end))
    ---确定
    UIEvent.LuaClick(self.Btn_Confirm().gameObject, Handle(self, function()
        local tRoleList = {}
        for i, v in ipairs(self.SelectRole) do
            if v.roleData then
                table.insert(tRoleList,v.roleData.id)
            else
                ---部分自選駕駛員未選擇，無法進行確認
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text174"),1},true)
                return
            end
        end
        ---确认弹窗
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text175"),function()
            CardDrawControl.SendSelectRole(self.CurLoopList.id,tRoleList,function()
                Event.Go("NormalDraw_FreePool", self.CurLoopList.id)
                MgrUI.ClosePop(self.Uid)
            end)
        end,nil,2,nil})
    end))
    ---
    for i, v in ipairs(self.SelectRole) do
        UIEvent.LuaClick(v.btn,function()
            CardDrawControl.SetSelectRole(v.roleData)
            self:UpdataSelRole(v.roleData, true)
        end)
    end
end

function M:OnShow(pArg)
    self.CurLoopList = pArg

    self.loop().totalCount = #self.CurLoopList.rank
    self.loop():RefillCells()
    for i, v in ipairs(self.SelectRole) do
        v.Img.gameObject:SetActive(false)
    end
end

---注册滑块
function M:RegisterLoopScroll()
    self.loop():SetLuaCellEvent(Handle(self,self.CellItem))
end
---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({ self.CurLoopList.rank[idx],self.CurLoopList })
    Tools.ReContentSizeGroup(self.Content().gameObject)
end
---更新选中角色
function M:UpdataSelRole(_roleData,_refresh)
    if _roleData == nil then
        return
    end
    local isAdd = true
    for i, v in ipairs(self.SelectRole) do
        if v.roleData and v.roleData.id == _roleData.id then
            v.roleData = nil
            v.Img.gameObject:SetActive(false)

            if _refresh then
                self.loop():RefreshCells()
            end
            isAdd = false
            break
        end
    end
    if isAdd then
        for i, v in ipairs(self.SelectRole) do
            if _roleData.rank == v.rank and v.roleData == nil then
                MgrRes.LoadQIcon(v.Img,_roleData.id)
                MgrRes.LoadSprite(v.Job,_roleData.iconCareer)
                v.Name.text = _roleData.name

                v.roleData = _roleData
                v.Img.gameObject:SetActive(true)
                break
            end
        end
    end
end

function M:OnClose()
    Event.Clear("FreePoolSelRole")
    CardDrawControl.ClearSelectRole()
end

return M