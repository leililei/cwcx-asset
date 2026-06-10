-- Code Auto Create Begin
local M = Class('PersonalItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PersonalItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PersonalItem','/',2},{'LockPanel','LockPanel',2},{'LockIcon','LockPanel/LockIcon',2},{'DocDesBg','DocDesBg',2},{'UnLockPanel','UnLockPanel',2},{'ziliaodi_weijiesuo','UnLockPanel/ziliaodi_weijiesuo',2},{'suo2','UnLockPanel/suo2',2},
        -- UITemplate 列表
        {'PersonalItem01','/',10},
        -- TextMeshProUGUI 列表
        {'LockContentTitleText','LockPanel/LockContentTitleText',20},{'DocContentText','DocDesBg/DocContentText',20},{'UnLockText','UnLockPanel/UnLockText',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)

    local data = pData[1]
    if data.isLock then
        self.LockPanel().gameObject:SetActive(true)
        self.DocDesBg().gameObject:SetActive(true)
        self.UnLockPanel().gameObject:SetActive(false)
        self.LockContentTitleText().text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_personaldata")..data.favor
        self.DocContentText().text = RoleprofileLocalData.tab[data.id][3]
    else
        self.LockPanel().gameObject:SetActive(false)
        self.DocDesBg().gameObject:SetActive(false)
        self.UnLockPanel().gameObject:SetActive(true)
        self.UnLockText().text = string.format(MgrLanguageData.GetLanguageByKey("personalitem_unlock"),data.favor)
    end
    Tools.ReContentSizeGroup(self.ObjRoot.transform.parent.gameObject)
end

return M