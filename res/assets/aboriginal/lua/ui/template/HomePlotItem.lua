-- Code Auto Create Begin
local M = Class('HomePlotItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HomePlotItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'HomePlotItem','/',2},{'Img_Illustrationdi','Img_Illustrationdi',2},{'Img_LockedIllustration','Img_LockedIllustration',2},{'Img_IllustrationNamedi','Img_IllustrationNamedi',2},{'Img_Illustrationkuang','Img_Illustrationkuang',2},{'Img_Bofang','Img_Bofang',2},{'Img_Locked','Img_Locked',2},{'new','new',2},{'Img_Newdi','new/Img_Newdi',2},{'Img_New','new/Img_New',2},
        -- UITemplate 列表
        {'HomePlotItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_IllustrationName','Text_IllustrationName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ObjRoot,function()
        if self.lock then
            return
        end
        PlotViewModel.OpenPlotUI(self.data[14],function()
            --播放完毕回调
        end,false)
    end)
end

function M:OnUpdateUI(Args)
    self.data = Args[1]
    self.parent = Args[2]
    local str = string.split(self.data[2],"_")
    ---@type ItemData
    self.Item = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
    ---封面图片
    MgrRes.LoadSprite(self.Img_Illustrationdi(),self.data[18])
    ---名字
    self.Text_IllustrationName().text = self.data[19]
    self.new().gameObject:SetActive(false)
    ---是否锁住
    self.lock = false
    if self.Item.count >= 1 then
        self.Img_Bofang().gameObject:SetActive(true)
        self.Img_Locked().gameObject:SetActive(false)
        self.Img_LockedIllustration().gameObject:SetActive(false)
        self.lock = false
    else
        self.Img_Bofang().gameObject:SetActive(false)
        self.Img_Locked().gameObject:SetActive(true)
        self.Img_LockedIllustration().gameObject:SetActive(true)
        self.lock = true
    end

end
return M