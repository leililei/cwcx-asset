-- Code Auto Create Begin
local M = Class('HeadIconItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HeadIconItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'HeadIconItem','/',2},{'SelectedBG','SelectedBG',2},{'HeadMask','HeadMask',2},{'HeadIcon','HeadMask/HeadIcon',2},{'lmg_Suo','lmg_Suo',2},{'Image','lmg_Suo/Image',2},{'Img_isEquip','Img_isEquip',2},{'SelectedImg','SelectedImg',2},
        -- UITemplate 列表
        {'HeadIconItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_isEquip','Img_isEquip/Text_isEquip',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.lockState = false
    self.Img_isEquip().gameObject:SetActive(false)
    self.SelectedBG().gameObject:SetActive(false)
    self.SelectedImg().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    ---@type PlayheadLocalData
    self.headData = pData[1]
    self.parent =  pData[2]
    if self.headData == nil then
        return
    end
    local typeStr = JNStrTool.strSplit("_",self.headData.type)
    local UnlockConditions = nil
    if typeStr[1] == "0" then
        if tonumber(typeStr[2]) ~= 19000 then
            UnlockConditions = HeroControl.GetRoleDataByID(tonumber(typeStr[2]))
            self.lockState = UnlockConditions.lockState
            if UnlockConditions == nil then
                return
            end
            if UnlockConditions.lockState then
                self.lmg_Suo().gameObject:SetActive(false)
            else
                self.lmg_Suo().gameObject:SetActive(true)
            end
            MgrRes.LoadNormalIcon(self.HeadIcon(),UnlockConditions.id)

        else
            self.lmg_Suo().gameObject:SetActive(false)
            MgrRes.LoadNormalIcon(self.HeadIcon(),90000)
        end
    elseif typeStr[1] == "1" then
        self.lockState = true
        self.lmg_Suo().gameObject:SetActive(false)
        MgrRes.LoadNormalIcon(self.HeadIcon(),tonumber(typeStr[3]))
    else
        return
    end

    if self.headData.isSelect then
        self.SelectedBG().gameObject:SetActive(true)
        self.SelectedImg().gameObject:SetActive(true)
        --MgrFx.SelectFrameFlash(self.SelectedImg(),self.headData.id .. 2)
    else
        self.SelectedBG().gameObject:SetActive(false)
        self.SelectedImg().gameObject:SetActive(false)
        --MgrFx.CancelSelectFrameFlash(self.headData.id .. 2)
    end
    if PlayerAvatarViewModel.CurPlayer.headUrl == self.headData.id then
        self.Img_isEquip().gameObject:SetActive(true)
    else
        self.Img_isEquip().gameObject:SetActive(false)
    end
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.HeadOnClick))
end

function M:HeadOnClick()
    self.parent:HeadItemOnClick(self.headData,self.lockState)
end
return M