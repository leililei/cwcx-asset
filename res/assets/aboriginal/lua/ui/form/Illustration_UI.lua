-- Code Auto Create Begin
local M = Class('Illustration_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Illustration_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Illustration_UI].prefab'
    self.Name = 'Form[Illustration_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Mask','Mask',2},{'Img_Fenggexian','Title/Img_Fenggexian',2},{'Btn_Return','Btn_Return',2},{'IllustrationItem','ModuleScroll/IllustrationItem',2},
        -- UITemplate 列表
        {'IllustrationItem01','ModuleScroll/IllustrationItem',10},
        -- RawImage 列表
        {'ModuleScroll','ModuleScroll',15},{'ModuleContent','ModuleScroll/ModuleContent',15},
        -- LoopScrollRect 列表
        {'ModuleScroll01','ModuleScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Tujianxitong','Title/Text_Tujianxitong',20},{'Text_IllustratedSystem','Title/Text_IllustratedSystem',20},
    }
end
-- Code Auto Create End
require("LocalData/DexsortLocalData")
function M:OnInit()
    --灌注地区数据
    TeamAtlasControl.ScreenTeamData()
    --注册滑块
    self.ModuleScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    --注册按钮
    self:InitBtn()
    --当前滑块index
    self.curIndex = 0
    --上一次滑块的index
    self.lastIndex = 0
    --当前选中的item
    self.curItem = nil
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113054][2],0.2)
end

function M:OnShow()
    --刷新滑块
    self:ReloadScroll(3)
end

function M:OnUpdateUI()
    if MgrSound.CheckStatus(1) ~= 2 then
        ---播放bgm
        MgrSound.PlayBGM(SteamLocalData.tab[113054][2],0.2)
    end
    --红点
    IllustrationViewModel.CheckRot()
    --摄像机改为正交
    MgrUI.GetUICamera().orthographic = true
    --计时器判断当前选中ItemUI
    MgrTimer.AddRepeat("IllustrationIndex",0,function()
        --如果索引没有变化
        if UIEvent.GetButton_Downing() == true then
            return
        end
        if self.curIndex ~= self.ModuleScroll01().curItemIndex then
            self.curIndex = self.ModuleScroll01().curItemIndex
        end
        local obj = self.ModuleContent().transform:Find(tostring(self.curIndex + 3))
        if self.curItem == obj then
            --修改当前选中的UI
            obj.transform:Find("ModulePrefab_xz").gameObject:SetActive(true)
            obj.transform:Find("ModulePrefab").gameObject:SetActive(false)
            obj.transform:Find("ModulePrefab_xz/Xzjiaobiao").gameObject:SetActive(true)
        else
            if self.curItem == nil or obj == nil then
                return
            end
            if self.curItem.name and self.itemList[tonumber(self.curItem.name)] and self.itemList[tonumber(self.curItem.name)].sortid then
                --上一个选中物体修改UI显示
                self.curItem.transform:Find("ModulePrefab_xz").gameObject:SetActive(false)
                self.curItem.transform:Find("ModulePrefab").gameObject:SetActive(true)
                self.curItem.transform:Find("ModulePrefab_xz/Xzjiaobiao").gameObject:SetActive(false)
            end
            --重新赋值当前选中物体
            self.curItem = obj
            self.lastIndex = self.curIndex
            --修改当前选中的UI
            obj.transform:Find("ModulePrefab_xz").gameObject:SetActive(true)
            obj.transform:Find("ModulePrefab").gameObject:SetActive(false)
            obj.transform:Find("ModulePrefab_xz/Xzjiaobiao").gameObject:SetActive(true)
        end
    end,-1,self.ObjRoot)
end

function M:OnBackShow()
    self:ReloadScroll()
    self.curItem.transform:Find("ModulePrefab_xz").gameObject:SetActive(true)
    self.curItem.transform:Find("ModulePrefab").gameObject:SetActive(false)
    self.curItem.transform:Find("ModulePrefab_xz/Xzjiaobiao").gameObject:SetActive(true)
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
end

function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.itemList[idx],self})
end

function M:ReloadScroll(offset)
    self.itemList = ArtAtlasControl.GetIllustrationData()
    self.ModuleScroll01().totalCount = #self.itemList
    if offset then
        self.ModuleScroll01():RefillCells(offset)
    else
        self.ModuleScroll01():RefreshCells()
    end
end

function M:OnClose()
    MgrTimer.Cancel("IllustrationIndex")
    MgrUI.GetUICamera().orthographic = false
end

function M:OnHide()
    MgrTimer.Cancel("IllustrationIndex")
    MgrUI.GetUICamera().orthographic = false
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M