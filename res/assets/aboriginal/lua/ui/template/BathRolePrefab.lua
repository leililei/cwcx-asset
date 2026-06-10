-- Code Auto Create Begin
local M = Class('BathRolePrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BathRolePrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Role','Img_Role',2},{'BtnPanel','BtnPanel',2},{'Btn_maintenance','BtnPanel/Btn_maintenance',2},{'Img_maintenance','BtnPanel/Btn_maintenance/Img_maintenance',2},{'Img_VoiceIcon','BtnPanel/Btn_maintenance/Img_maintenance/Btn_Content/Img_VoiceIcon',2},{'Img_Zhuangshi','BtnPanel/Btn_maintenance/Img_Zhuangshi',2},{'Content','BtnPanel/Btn_maintenance/Content',2},{'Img_love_n','BtnPanel/Btn_maintenance/Content/LovePrefab/Img_love_n',2},{'Img_love_d','BtnPanel/Btn_maintenance/Content/LovePrefab/Img_love_d',2},{'Img_love_n01','BtnPanel/Btn_maintenance/Content/LovePrefab (1)/Img_love_n',2},{'Img_love_d01','BtnPanel/Btn_maintenance/Content/LovePrefab (1)/Img_love_d',2},{'Img_love_n02','BtnPanel/Btn_maintenance/Content/LovePrefab (2)/Img_love_n',2},{'Img_love_d02','BtnPanel/Btn_maintenance/Content/LovePrefab (2)/Img_love_d',2},{'Btn_maintenance_lock','BtnPanel/Btn_maintenance_lock',2},{'Img_maintenance01','BtnPanel/Btn_maintenance_lock/Img_maintenance',2},{'Img_Duck','BtnPanel/Btn_maintenance_lock/Img_Duck',2},{'Img_Qipao','BtnPanel/Btn_maintenance_lock/Img_Qipao',2},{'Btn_maintenance_notopen','BtnPanel/Btn_maintenance_notopen',2},{'Img_maintenance02','BtnPanel/Btn_maintenance_notopen/Img_maintenance',2},
        -- UITemplate 列表
        {'BathRolePrefab','/',10},
        -- TextMeshProUGUI 列表
        {'Text_RoleName','BtnPanel/Btn_maintenance/Img_maintenance/Btn_Content/Text_RoleName',20},{'Text_RoleName01','BtnPanel/Btn_maintenance_lock/Img_maintenance/Text_RoleName',20},{'Text_weihuoqu','BtnPanel/Btn_maintenance_lock/Img_Qipao/Text_weihuoqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --选择角色
    UIEvent.LuaClick(self.Img_Role().gameObject,function()
        if HeroControl.GetRoleDataByID(self.pData.roleId).lockState and self.pData:GetRoleUnlockState() == false then
            self.parent:Transition(self.pData.roleId)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_zhihuishi_tips1"),1},true)
        end
    end)
end

function M:OnUpdateUI(data)
    ---@type BathRoleData
    self.pData = data[1]
    self.parent = data[2]
    --角色spine
    local _tempPosTab1 = JNStrTool.strSplit(";", self.pData.chooseSpinePos)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatch3DSpineInUI(self.Img_Role().gameObject, self.pData.chooseSpine,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), "idle", function(obj)
        obj.transform.localRotation = Quaternion.Euler(0,0,tonumber(_tempPosTab1[4]))
    end)
    --标签位置
    local _tempBtnPosTab1 = JNStrTool.strSplit(";", self.pData.TagPos)
    local _tempBtnPosTab2 = JNStrTool.strSplit(",", _tempBtnPosTab1[1])
    self.BtnPanel().gameObject.transform.localPosition = Vector3(tonumber(_tempBtnPosTab2[1]),tonumber(_tempBtnPosTab2[2]),tonumber(_tempBtnPosTab2[3]))
    self.BtnPanel().gameObject.transform.localScale = Vector3.one * tonumber(_tempBtnPosTab1[2])
    self.BtnPanel().gameObject.transform.localRotation = Quaternion.Euler(0,0,tonumber(_tempBtnPosTab1[4]))
    --角色名
    self.Text_RoleName().text = self.pData.name
    self.Text_RoleName01().text = self.pData.name
    --是否有语音
    self.Img_VoiceIcon().gameObject:SetActive(self.pData.hasVoice)
    --是否开放
    if self.pData:GetRoleUnlockState() == false then
        --是否拥有角色
        if HeroControl.GetRoleDataByID(self.pData.roleId).lockState then
            self.Btn_maintenance().gameObject:SetActive(true)
            self.Btn_maintenance_lock().gameObject:SetActive(false)
            self.Btn_maintenance_notopen().gameObject:SetActive(false)
        else
            self.Btn_maintenance().gameObject:SetActive(false)
            self.Btn_maintenance_lock().gameObject:SetActive(true)
            self.Btn_maintenance_notopen().gameObject:SetActive(false)
        end
    else
        self.Btn_maintenance().gameObject:SetActive(false)
        self.Btn_maintenance_lock().gameObject:SetActive(false)
        self.Btn_maintenance_notopen().gameObject:SetActive(true)
    end
    --当前阶段
    for i = 0,self.Content().transform.childCount - 1 do
        local obj = self.Content().transform:GetChild(i).gameObject
        local h_Img = CJNUIMgr.GetSunUseName(obj,"Img_love_d")
        local n_Img = CJNUIMgr.GetSunUseName(obj,"Img_love_n")
        h_Img.gameObject:SetActive(false)
        n_Img.gameObject:SetActive(true)
        if self.pData.curPhase >= i then
            h_Img.gameObject:SetActive(true)
            n_Img.gameObject:SetActive(false)
        end
    end
end



return M