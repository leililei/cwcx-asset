-- Code Auto Create Begin
local M = Class('GonggaoMould', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GonggaoMould.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'GonggaoMould','/',2},{'Img_Banner','Img_Banner',2},{'Title','Title',2},
        -- UITemplate 列表
        {'GonggaoMould01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Title','Title/Text_Title',20},{'Text_Notice','Text_Notice',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.pData = nil
    
    self:InitButton()
end

function M:OnUpdateUI(pData)
    self.pData = pData[1]
    if self.pData == nil then
        return
    end
    if self.pData.ImgName == "0" then
        self.Img_Banner().gameObject:SetActive(false)
    else
        self.Img_Banner().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.Img_Banner(),"NoticeIcon/"..self.pData.ImgName,nil,true)
    end
    self.Text_Title().text = self.pData.name
    self.Text_Notice().text = self.pData.txt
end

function M:InitButton()
    UIEvent.LuaClick(self.Img_Banner().gameObject,function()
        if self.pData.imgLinkId == "0" then
            return
        end
        local isHave = string.find(self.pData.imgLinkId,"http")
        if isHave ~= nil then
            Tools.OpenUrl(self.pData.imgLinkId)
        else
            if MgrUI.CurShowUIName == "Login_UI" then
                return
            end
            MgrLink.LinkStart(self.pData.imgLinkId)
        end

        MgrUI.ClosePop(UID.GongGaoPop)
    end,nil,self.Img_Banner())
end

return M
