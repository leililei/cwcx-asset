-- Code Auto Create Begin
local M = Class('CheckPointItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CheckPointItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Nomal','Nomal',2},{'Img_Guankadi','Nomal/Img_Guankadi',2},{'Img_Suo','Nomal/Img_Suo',2},{'tiao(zi)','Nomal/tiao(zi)',2},{'Selected','Selected',2},{'Img_Guankadi(xuanzhong)','Selected/Img_Guankadi(xuanzhong)',2},{'tiao(huang)','Selected/tiao/tiao(huang)',2},{'tiao(cheng)','Selected/tiao/tiao(cheng)',2},{'tiao(zi)01','Selected/tiao/tiao(zi)',2},
        -- Text 列表
        {'Text_Weijiesuo','Nomal/Img_Suo/Text_Weijiesuo',3},{'Text_PlotName','Nomal/Text_PlotName',3},{'Text_Number','Nomal/Text_Number',3},{'Text_PlotName01','Selected/Text_PlotName',3},{'Text_Number01','Selected/Text_Number',3},
        -- UITemplate 列表
        {'CheckPointItem','/',10},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type  StormPointData
    self.StormPoint = pData[1]
    self.parent = pData[2]
    local num = pData[3]
    --if self.StormPoint.id == 991 or self.StormPoint.id == 992 or self.StormPoint.id== 993 then
    local data = string.split(self.StormPoint[2],",")
    if data[1] == "NovicePlot" then
        self.Nomal().raycastTarget = true
        self.Img_Suo().gameObject:SetActive(false)
        self.Text_PlotName().gameObject:SetActive(true)
        self.Text_Number().gameObject:SetActive(true)

        self.Text_PlotName().text = data[2]
        self.Text_PlotName01().text = data[2]

        if tonumber(num) > 9 then
            self.Text_Number().text = num
            self.Text_Number01().text = num
        else
            self.Text_Number().text ="0".. num
            self.Text_Number01().text = "0".. num
        end
        if self.StormPoint.isSelect  then
            self.Selected().gameObject:SetActive(true)
            self.Nomal().gameObject:SetActive(false)
        else
            self.Selected().gameObject:SetActive(false)
            self.Nomal().gameObject:SetActive(true)
        end
        UIEvent.LuaClick(self.Nomal().gameObject, Handle(self, function ()
            IllustrationViewModel.CurTouchID = num
            self.parent:PointItemClick(self.StormPoint,nil,num)
        end))
    else
        local isLock = StormControl.CheckPointLock(self.StormPoint.id)
        --local isLock = true
        if isLock then
            self.Nomal().raycastTarget = true
            self.Img_Suo().gameObject:SetActive(false)
            self.Text_PlotName().gameObject:SetActive(true)
            self.Text_Number().gameObject:SetActive(true)
        else
            self.Nomal().raycastTarget = false
            self.Img_Suo().gameObject:SetActive(true)
            self.Text_PlotName().gameObject:SetActive(false)
            self.Text_Number().gameObject:SetActive(false)
        end
        local name =  self.StormPoint.idxName.." "..self.StormPoint.name
        if tonumber(num) > 9 then
            self.Text_Number().text = num
            self.Text_Number01().text = num
        else
            self.Text_Number().text ="0".. num
            self.Text_Number01().text = "0".. num
        end

        if self.StormPoint.isSelect and isLock then
            self.Selected().gameObject:SetActive(true)
            self.Nomal().gameObject:SetActive(false)
        else
            self.Selected().gameObject:SetActive(false)
            self.Nomal().gameObject:SetActive(true)
        end
        self.Text_PlotName().text = name
        self.Text_PlotName01().text = name
        UIEvent.LuaClick(self.Nomal().gameObject, Handle(self, function ()
            if isLock then
                self.parent:PointItemClick(self.StormPoint,Handle(self,self.CancelSelect),num)
            else
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
            end
        end))
    end
end

function M:CancelSelect()
    self.Selected().gameObject:SetActive(false)
    self.Nomal().gameObject:SetActive(true)
    self.StormPoint.isSelect = false
end

return M