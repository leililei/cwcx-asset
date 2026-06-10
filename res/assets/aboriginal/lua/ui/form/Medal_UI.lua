-- Code Auto Create Begin
local M = Class('Medal_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Medal_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Medal_UI].prefab'
    self.Name = 'Form[Medal_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'RoleMedal','RoleMedal',2},{'Img_Xian','RoleMedal/Img_Xian',2},{'Img_Di','RoleMedal/Img_Di',2},{'ScrollbarVertical','RoleMedal/VFXMask/MedalScroll/ScrollbarVertical',2},{'Handle','RoleMedal/VFXMask/MedalScroll/ScrollbarVertical/SlidingArea/Handle',2},{'Content','RoleMedal/VFXMask/MedalScroll/Content',2},{'Bian','MedalInfo/Bian',2},{'Img_Jiesuodi','MedalInfo/Img_Jiesuodi',2},{'MedalIcon','MedalInfo/MedalIcon',2},{'VFX','MedalInfo/VFXMask/VFX',2},{'Achive','MedalInfo/Achive',2},{'lmg_Suo','MedalInfo/lmg_Suo',2},
        -- UITemplate 列表
        {'MedalItem','RoleMedal/VFXMask/MedalScroll/MedalItem',10},
        -- RawImage 列表
        {'MedalScroll','RoleMedal/VFXMask/MedalScroll',15},
        -- LoopScrollRect 列表
        {'MedalScroll01','RoleMedal/VFXMask/MedalScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_MedalBook_CN','UpperLeftPanel/Text_MedalBook/Text_MedalBook_CN',20},{'Text_MedalBook_EN','UpperLeftPanel/Text_MedalBook/Text_MedalBook_EN',20},{'Text_Tiaojian','MedalInfo/Text_Tiaojian',20},{'Text_Jiesuo','MedalInfo/Text_Jiesuo',20},{'Text_Shuoming','MedalInfo/Text_Shuoming',20},{'Text_XunzhangName','MedalInfo/Text_XunzhangName',20},{'Text_achive','MedalInfo/Achive/Text_achive',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---@type HideLocalData
    self.CurSelectMedal = nil
    self:InitButton()
    self:InitMedalScroll()
end

function M:InitMedalScroll()
    ---初始化
    self.MedalScroll01():SetLuaCellEvent(Handle(self,self.CellMedalItem))
    self.CurSelectMedal = IllustrationViewModel.AllMedalCacheData[1]
    self.CurSelectMedal.isSelect = true
    self:UpdataMedalInfo()
    self:ResetVoidGearView(0)
end

---Role loop回调
function M:CellMedalItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.MedalList[idx],self})
end
---Role 刷新
function M:ResetVoidGearView(offset)
    ---获取数据
    self.MedalList = IllustrationViewModel.AllMedalCacheData
    ---设置总数
    self.MedalScroll01().totalCount = #self.MedalList
    ---刷新滑块
    if offset then
        ---刷新offset位置
        self.MedalScroll01():RefillCells(offset)
    else
        ---刷新数据不刷新位置
        self.MedalScroll01():RefreshCells()
    end
end

function M:SetMedalInfo(itemdata)
    self:ClearSelect()
    itemdata.isSelect = true
    self.CurSelectMedal = itemdata
    self:UpdataMedalInfo()
    self:ResetVoidGearView()
end

function M:ClearSelect()
    if self.CurSelectMedal then
        self.CurSelectMedal.isSelect = false
    end
end

function M:UpdataMedalInfo()
    self.Text_Tiaojian().text = self.CurSelectMedal.describe
    self.Text_Shuoming().text = self.CurSelectMedal.txt
    self.Text_XunzhangName().text = self.CurSelectMedal.name
    

    self.ui_path =  "ABOriginal/VFX/Prefab/Badge_Prefab/UI_Prefeb/"
    self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
    --11
    if self.CurSelectMedal.anime and self.CurSelectMedal.anime ~= "0" then
        Tools.ClearAllChild(self.VFX().gameObject)
        self.MedalIcon().gameObject:SetActive(false)
        MgrRes.GetPrefab(self.vfx_path..self.CurSelectMedal.anime..".prefab",function(Obj)
            if Obj == nil then return  end
            Obj.transform:SetParent(self.VFX().gameObject.transform)
            Obj.transform.localPosition = Vector3.zero
            Obj.transform.localScale = Vector3(79,79,1)
        end)
    else
        Tools.ClearAllChild(self.VFX().gameObject)
        self.MedalIcon().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.MedalIcon(),"Item/"..self.CurSelectMedal.icon)
    end


    if ItemControl.GetItemByIdAndType(self.CurSelectMedal.id,4).goods.goodsNum > 0 then
        self.lmg_Suo().gameObject:SetActive(false)
        self.Achive().gameObject:SetActive(true)
    else
        self.lmg_Suo().gameObject:SetActive(true)
        self.Achive().gameObject:SetActive(false)
    end
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Home().gameObject, Handle(self, function ()
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(81)
    end))
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self, function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self:ClearSelect()
        IllustrationViewModel.Close()
    end))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self:ClearSelect()
        IllustrationViewModel.Close()
    end
end

return M