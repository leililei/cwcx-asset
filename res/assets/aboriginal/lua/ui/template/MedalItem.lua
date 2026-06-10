-- Code Auto Create Begin
local M = Class('MedalItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/MedalItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Xunzhangdi','Img_Xunzhangdi',2},{'Icon','Icon',2},{'VFXParent','VFXParent',2},{'MedalName','MedalName',2},{'Suo','Suo',2},{'lmg_Suo','Suo/lmg_Suo',2},{'Selected','Selected',2},
        -- UITemplate 列表
        {'MedalItem','/',10},
        -- TextMeshProUGUI 列表
        {'TextName','MedalName/TextName',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type HideLocalData
    self.itemdata = pData[1]
    self.parent = pData[2]

    self.ui_path =  "ABOriginal/VFX/Prefab/Badge_Prefab/UI_Prefeb/"
    self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
    self.TextName().text = self.itemdata.name

    if self.itemdata.anime and self.itemdata.anime ~= "0" then
        --加载动态模型
        Tools.ClearAllChild(self.VFXParent().gameObject)
        self.Icon().gameObject:SetActive(false)
        MgrRes.GetPrefab(self.vfx_path..self.itemdata.anime..".prefab",function(Obj)
            if Obj == nil then return end
            Obj.transform:SetParent(self.VFXParent().gameObject.transform)
            Obj.transform.localPosition = Vector3.zero
            Obj.transform.localScale = Vector3(35,35,1)
        end)
    else
        Tools.ClearAllChild(self.VFXParent().gameObject)
        self.Icon().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.Icon(),"Item/"..self.itemdata.icon)
    end

    if ItemControl.GetItemByIdAndType(self.itemdata.id,4).goods.goodsNum > 0 then
        self.Suo().gameObject:SetActive(false)
    else
        self.Suo().gameObject:SetActive(true)
    end
    ---重新绑定事件
    UIEvent.ClearFun(self.Img_Xunzhangdi().gameObject)
    UIEvent.LuaClick(self.Img_Xunzhangdi().gameObject,Handle(self,self.OnClickBtn))
    self.Selected().gameObject:SetActive(self.itemdata.isSelect)
end

function M:OnClickBtn()
    self.parent:SetMedalInfo(self.itemdata)
end
return M