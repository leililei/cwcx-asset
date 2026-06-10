-- Code Auto Create Begin
local M = Class('HeadKuangIconItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HeadKuangIconItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'HeadKuangIconItem','/',2},{'SelectedBG','SelectedBG',2},{'HeadIcon','HeadIcon',2},{'lmg_Suo','lmg_Suo',2},{'Img_isEquip','Img_isEquip',2},{'SelectedImg','SelectedImg',2},{'LimitTimeBg','LimitTimeBg',2},{'shijian2','LimitTimeBg/shijian2',2},
        -- UITemplate 列表
        {'HeadKuangIconItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_isEquip','Img_isEquip/Text_isEquip',20},{'LimitTime','LimitTimeBg/LimitTime',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_isEquip().gameObject:SetActive(false)
    self.SelectedBG().gameObject:SetActive(false)
    self.SelectedImg().gameObject:SetActive(false)
end
function M:OnUpdateUI(pData)
    ---@type PlayheadLocalData
    self.headKuangData = pData[1]
    self.parent =  pData[2]
    if self.headKuangData == nil then
        return
    end

    if self.parent and self.parent:GetSelelctHeadKuang() and self.parent:GetSelelctHeadKuang()[1] == self.headKuangData[1] then
        self.SelectedBG().gameObject:SetActive(true)
        self.SelectedImg().gameObject:SetActive(true)
    else
        self.SelectedBG().gameObject:SetActive(false)
        self.SelectedImg().gameObject:SetActive(false)
    end
    --加载玩家头像框
    MgrRes.LoadSprite(self.HeadIcon():GetComponent("Image"),"Playheadicon/" .. self.headKuangData[3])
    local isLock = self.parent:CheckIconKuangLock(self.headKuangData[1])
    self.lmg_Suo().gameObject:SetActive(not isLock)
    --已装备
    if PlayerAvatarViewModel.CurPlayer.headFrame == self.headKuangData[1] then
        self.Img_isEquip().gameObject:SetActive(true)
    else
        self.Img_isEquip().gameObject:SetActive(false)
    end
    --限时提示
    self.LimitTimeBg().gameObject:SetActive(false)
    local tStr = string.split(self.headKuangData[4],'_')
    if tStr[1] == "1" then
        --限时道具
        local tLimitItem = ItemControl.GetLimitItemByID(4,tonumber(tStr[2]))
        if tLimitItem then
            self.LimitTimeBg().gameObject:SetActive(true)
            --获取格式时间 剩余xx天/时/分
            self.LimitTime().text = Global.GetTimeMode(tLimitItem.ETime-Global.GetCurTime(),"eventshopitem_surplus")
        end
    end
    

    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.HeadOnClick))
end

function M:HeadOnClick()
    self.parent:HeadKuangItemOnClick(self.headKuangData)
end
return M