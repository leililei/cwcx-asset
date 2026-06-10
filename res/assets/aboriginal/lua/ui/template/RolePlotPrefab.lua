-- Code Auto Create Begin
local M = Class('RolePlotPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RolePlotPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RolePlotPrefab','/',2},{'Img_Illustrationdi','Img_Illustrationdi',2},{'Img_LockedIllustration','Img_LockedIllustration',2},{'Img_IllustrationNamedi','Img_IllustrationNamedi',2},{'Img_Illustrationkuang','Img_Illustrationkuang',2},{'Img_Bofang','Img_Bofang',2},{'Img_Locked','Img_Locked',2},{'new','new',2},{'Img_Newdi','new/Img_Newdi',2},{'Img_New','new/Img_New',2},
        -- UITemplate 列表
        {'RolePlotPrefab01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_IllustrationName','Text_IllustrationName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot,function()
        if self.data:GetUnlockState() == false then
            return
        end
        PlotViewModel.OpenPlotUI(self.data.plot,function()
            --播放完毕回调
        end,false)
    end)
end

function M:OnUpdateUI(Args)
    ---@type RolePlotAtlasData
    self.data = Args[1]
    self.parent = Args[2]
    self.role = self.data:GetRoleData()
    ---封面图片
    MgrRes.LoadSprite(self.Img_Illustrationdi(),self.data.roleCover)
    ---名字
    local index = self.data.order >= 10 and self.data.order or "0"..self.data.order
    self.Text_IllustrationName().text = index.." "..self.data.plotName
    self.new().gameObject:SetActive(false)
    ---是否锁住
    if self.data:GetUnlockState() then
        self.Img_Bofang().gameObject:SetActive(true)
        self.Img_Locked().gameObject:SetActive(false)
    else
        self.Img_Bofang().gameObject:SetActive(false)
        self.Img_Locked().gameObject:SetActive(true)
    end
end

return M