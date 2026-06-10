-- Code Auto Create Begin
local M = Class('StormBookItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/StormBookItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Juandi','Img_Juandi',2},{'jianbiandi(hui)','jianbiandi(hui)',2},{'StormBg','StormBg',2},{'lmg_Suo','lmg_Suo',2},{'Img_Juandi01','Img_Juandi',2},{'guangtiao(hui)','guangtiao(hui)',2},{'guangtiao(zi)','guangtiao(zi)',2},
        -- Text 列表
        {'Text_EnStormName','Text_EnStormName',3},{'Text_StormName','Text_StormName',3},{'Text_Weijiesuo','lmg_Suo/Text_Weijiesuo',3},{'Text_Stormtype','Img_Juandi/Text_Stormtype',3},{'Text_StormNumber','Text_StormNumber',3},
        -- UITemplate 列表
        {'StormBookItem','/',10},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type StormScrollData
    self.StormData = pData[1]
    self.parent = pData[2]
    local num = pData[3] - 1
    if self.StormData.type == 999 then
        self.lmg_Suo().gameObject:SetActive(false)
        self.Text_EnStormName().gameObject:SetActive(true)
        self.Text_StormName().gameObject:SetActive(true)
        self.Text_Stormtype().gameObject:SetActive(true)
        if num > 9 then
            self.Text_StormNumber().text = num
        else
            self.Text_StormNumber().text ="0"..num
        end
        self.Text_StormName().text = MgrLanguageData.GetLanguageByKey("plotreplay_ui_introduction")
        self.Text_Stormtype().text = MgrLanguageData.GetLanguageByKey("plotreplay_ui_introduction")
        UIEvent.LuaClick(self.ObjRoot, Handle(self, function ()
            IllustrationViewModel.CurScrollData = self.StormData
            self.parent:ItemClick()
        end))
    else
        local isLock = StormControl.CheckScrollLock(self.StormData.id)
        --local isLock = true
        if isLock then
            self.lmg_Suo().gameObject:SetActive(false)
            self.Text_EnStormName().gameObject:SetActive(true)
            self.Text_StormName().gameObject:SetActive(true)
            self.Text_Stormtype().transform.parent.gameObject:SetActive(true)
        else
            self.lmg_Suo().gameObject:SetActive(true)
            self.Text_EnStormName().gameObject:SetActive(false)
            self.Text_StormName().gameObject:SetActive(false)
            self.Text_Stormtype().transform.parent.gameObject:SetActive(false)
        end
        if num > 9 then
            self.Text_StormNumber().text = num
        else
            self.Text_StormNumber().text ="0"..num
        end
        self.Text_StormName().text = self.StormData.name
        self.Text_Stormtype().text = self.StormData.alias
        --self.Text_EnStormName().text =
        UIEvent.LuaClick(self.ObjRoot, Handle(self, function ()
            if isLock then
                IllustrationViewModel.CurScrollData = self.StormData
                self.parent:ItemClick()
            else
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
            end
        end))

    end
end

return M