-- Code Auto Create Begin
local M = Class('IllustrationPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/IllustrationPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'IllustrationPrefab','/',2},{'Img_Illustrationdi','Img_Illustrationdi',2},{'Img_LockedIllustration','Img_LockedIllustration',2},{'Img_IllustrationNamedi','Img_IllustrationNamedi',2},{'Img_Illustrationkuang','Img_Illustrationkuang',2},{'Img_Locked','Img_Locked',2},{'Img_Bofang','Img_Bofang',2},{'new','new',2},{'Img_Newdi','new/Img_Newdi',2},{'Img_New','new/Img_New',2},{'Btn','Btn',2},
        -- UITemplate 列表
        {'IllustrationPrefab01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_IllustrationName','Text_IllustrationName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn().gameObject,function()
        if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid)  then
            self.parent:InitCG(self.list)
        end
    end)
end

function M:OnUpdateUI(Args)
    ---@type Cgdex1LocalData
    self.data = Args[1][1]
    ---@type Cgdex1LocalData[]
    self.list = Args[1]
    self.parent = Args[2]
    self.new().gameObject:SetActive(false)
    ---是否解锁
    if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid) then
        self.Img_Locked().gameObject:SetActive(false)
        self.Img_LockedIllustration().gameObject:SetActive(false)
        self.Img_IllustrationNamedi().gameObject:SetActive(true)
        self.Text_IllustrationName().gameObject:SetActive(true)
    else
        self.Img_Locked().gameObject:SetActive(true)
        self.Img_LockedIllustration().gameObject:SetActive(true)
        self.Img_IllustrationNamedi().gameObject:SetActive(false)
        self.Text_IllustrationName().gameObject:SetActive(false)
    end
    ---是否是动画
    self.Img_Bofang().gameObject:SetActive(self.data.cgoranime == 2)
    ---名字
    local index = self.data.groupid < 10 and "0"..self.data.groupid or self.data.groupid
    self.Text_IllustrationName().text = index.."  "..self.data.name
    ---预览图
    MgrRes.LoadSprite(self.Img_Illustrationdi(),self.data.picturecover)
end

return M