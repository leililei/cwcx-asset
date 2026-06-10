-- Code Auto Create Begin
local M = Class('PackagesPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PackagesPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PackagesPop_UI].prefab'
    self.Name = 'Form[PackagesPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'bg_Tanchuangdi','bg_Tanchuangdi',2},{'title','bg_Tanchuangdi/title',2},{'Btn_goumai','bg_Tanchuangdi/Btn_goumai',2},{'Img_Quedingdi','bg_Tanchuangdi/Btn_goumai/Img_Quedingdi',2},{'Xiaohao','bg_Tanchuangdi/Btn_goumai/Xiaohao',2},{'currencyIcon','bg_Tanchuangdi/Btn_goumai/Xiaohao/currencyIcon',2},{'shanchuxian','bg_Tanchuangdi/Btn_goumai/shanchuxian',2},{'Btn_gengduo','bg_Tanchuangdi/Btn_gengduo',2},{'Img_Quxiaodi','bg_Tanchuangdi/Btn_gengduo/Img_Quxiaodi',2},{'btn_guanbi','bg_Tanchuangdi/btn_guanbi',2},{'ContentScroll','bg_Tanchuangdi/ContentScroll',2},{'LibaoScrollItem2','bg_Tanchuangdi/ContentScroll/LibaoScrollItem2',2},{'content','bg_Tanchuangdi/ContentScroll/content',2},{'libao','libao',2},{'icon_libao','libao/icon_libao',2},{'title_libao','libao/title_libao',2},{'bg_qipao','libao/title_libao/bg_qipao',2},{'arrow_right','arrow_right',2},{'arrow_queer','arrow_queer',2},{'dian_parent','dian_parent',2},{'BottomPoint','BottomPoint',2},{'Image_dian_1','BottomPoint/Image_dian_1',2},{'Image_dian_2','BottomPoint/Image_dian_2',2},
        -- UITemplate 列表
        {'LibaoScrollItem201','bg_Tanchuangdi/ContentScroll/LibaoScrollItem2',10},
        -- LoopScrollRect 列表
        {'ContentScroll01','bg_Tanchuangdi/ContentScroll',18},
        -- TextMeshProUGUI 列表
        {'txt_libaoxiangqing','bg_Tanchuangdi/title/txt_libaoxiangqing',20},{'Text_zhekou','bg_Tanchuangdi/Btn_goumai/Text_zhekou',20},{'Text_Price','bg_Tanchuangdi/Btn_goumai/Xiaohao/Text_Price',20},{'Text_cancel','bg_Tanchuangdi/Btn_gengduo/Text_cancel',20},{'txt_mingzi','libao/title_libao/txt_mingzi',20},{'txt_shijian','libao/title_libao/txt_shijian',20},{'txt_zhekou2','libao/title_libao/bg_qipao/txt_zhekou2',20},{'txt_chaozhi','libao/title_libao/bg_qipao/txt_chaozhi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:InitScroll()
    self:InitButton()
    self:InitFreshClock()
end
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.arrow_queer().gameObject,function()   --左按钮
        if self.packageIndex > 1 then
            self.packageIndex = self.packageIndex - 1
            self:InitPackage(self.allPackageList[self.packageIndex])
            self:LightThePoint(self.packageIndex)
            self.arrow_right().gameObject:SetActive(true)
            if self.packageIndex == 1 then
                self.arrow_queer().gameObject:SetActive(false)
            end
        end
    end)
    UIEvent.LuaClick(self.arrow_right().gameObject,function()   --右按钮
        if self.packageIndex < #self.allPackageList then
            self.packageIndex = self.packageIndex + 1
            self:InitPackage(self.allPackageList[self.packageIndex])
            self:LightThePoint(self.packageIndex)
            self.arrow_queer().gameObject:SetActive(true)
            if self.packageIndex == #self.allPackageList then
                self.arrow_right().gameObject:SetActive(false)
            end
        end
    end)
    UIEvent.LuaClick(self.Btn_goumai().gameObject,function()
        ShopViewModel.FlyFunBuyGoods(self.allPackageList[self.packageIndex].ID,function()
            HomeViewModel.CheckPackagesPop()
        end)
    end)
    UIEvent.LuaClick(self.Btn_gengduo().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
        HomeViewModel.OpenShop()
    end)
    UIEvent.LuaClick(self.btn_guanbi().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
end
function M:InitScroll()
    self.ContentScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
function M:CellItem(trans,idx)
    local good = {
        goodsType = self.contentList[idx].goodsType,
        goodsID = self.contentList[idx].id,
        goodsNum = self.contentList[idx].count,
    }
    trans:GetComponent("UITemplate"):SetData({good,idx,self})
end
function M:OnUpdateUI()
    self.allPackageList = self:SortPackageList(clone(HomeViewModel.packageList))
    if #self.allPackageList == 0 then
        return
    end
    self.packageIndex = 1
    self.arrow_queer().gameObject:SetActive(false)
    self:InitPackage(self.allPackageList[self.packageIndex])
    self:InitBottomPoint()
end
function M:SortPackageList(list)
    local newList = {}
    for i,v in ipairs(list) do
        if v.Duration ~= -1 and not v.Status and v.endTime > Global.GetCurTime() then
            table.insert(newList,v)
        end
    end
    return newList
end
function M:InitPackage(Data)
    --播放动效
    self.ObjRoot.transform:GetComponent("Animator"):Play("Base Layer.Ani_PackagesPop_UI",0,0.25)

    self.packageID = Data.ID
    self.endTime = Data.endTime    --礼包结束时间
    self.Group = Data.Group
    self.NextID = Data.NextID
    self.Status = Data.Status
    self.duration = Data.Duration
    if #self.allPackageList <= 1 then   --一个礼包不显示左右按钮
        self.arrow_right().gameObject:SetActive(false)
        self.arrow_queer().gameObject:SetActive(false)
    end
    local shopData = ShopControl.GetSingleShopData(ShopLocalData.tab[self.packageID].type_1)
    local shop = nil
    self.package = nil
    self.nextPackage = nil
    if shopData ~= nil then
        for i, v in pairs(shopData.childShop) do
            if v.id == ShopLocalData.tab[self.packageID].type_2 then
                shop = v
            end
        end
    end
    for i,v in pairs(shop.shopItems) do
        if v.id == self.packageID then
            self.package = v
        end
        if v.id == self.NextID then
            self.nextPackage = v
        end
    end
    ---原价
    self.Text_zhekou().text = ShopViewModel.FindDollerPrice(self.nextPackage.id)
    ---折扣价
    self.Text_Price().text = ShopViewModel.FindDollerPrice(self.package.id)
    ---货币
    local currencyIcon = ItemControl.GetItemByIdAndType(self.package.ladderPrice[0].goodsID,self.package.ladderPrice[0].goodsType).icon
    MgrRes.LoadSprite(self.currencyIcon(),currencyIcon)
    ---礼包内容
    self.contentList = {}
    for i,v in pairs(self.package.ladderItems[0]) do
        local item = ItemData.New()
        local good = {
            goodsType = v.goodsType,
            goodsID = v.goodsID,
            goodsNum = v.goodsNum,
        }
        item:PushData(good, ItemControl.PushEnum.none)
        table.insert(self.contentList,item)
    end
    self.ContentScroll01().totalCount = #self.contentList
    self.ContentScroll01():RefillCells()
    ---礼包图片
    MgrRes.LoadSprite(self.icon_libao(),self.package.icon)
    MgrRes.LoadSprite(self.libao(),"Quality/bg_libao_"..self.package.rank)
    MgrRes.LoadSprite(self.bg_qipao(),"Quality/img_qipao_"..self.package.rank)
    ---字体颜色
    if self.package.rank == 2 then
        self.txt_zhekou2().color = Color(57, 57, 215, 1)
        self.txt_chaozhi().color = Color(57, 57, 215, 1)
    elseif self.package.rank == 3 then
        self.txt_zhekou2().color = Color(107, 46, 183, 1)
        self.txt_chaozhi().color = Color(107, 46, 183, 1)
    elseif self.package.rank == 4 then
        self.txt_zhekou2().color = Color(255, 72, 20, 1)
        self.txt_chaozhi().color = Color(255, 72, 20, 1)
    end
    ---礼包名字
    self.txt_mingzi().text = self.package.name
    ---倒计时
    if self.duration == -1 then
        self.txt_shijian().gameObject:SetActive(false)
    else
        self.leftTime = self.endTime - MgrNet.GetServerTime()
        if self.leftTime <= 0 then
            self.txt_shijian().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text49").."  00:00:00"
        else
            local hour = math.floor(self.leftTime / 3600)
            local min = math.floor(self.leftTime % 3600 / 60)
            local second = math.floor(self.leftTime % 3600 % 60)
            if hour < 10 then
                hour = "0"..hour
            end
            if min < 10 then
                min = "0"..min
            end
            if second < 10 then
                second = "0"..second
            end
            self.txt_shijian().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text49").."  "..hour..":"..min..":"..second
        end
        MgrTimer.Cancel("packageTime")
        MgrTimer.AddRepeat("packageTime",1,function()
            if self.leftTime > 0 then
                self.leftTime = self.leftTime - 1
                local hour = math.floor(self.leftTime / 3600)
                local min = math.floor(self.leftTime % 3600 / 60)
                local second = math.floor(self.leftTime % 3600 % 60)
                if hour < 10 then
                    hour = "0"..hour
                end
                if min < 10 then
                    min = "0"..min
                end
                if second < 10 then
                    second = "0"..second
                end
                self.txt_shijian().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text49").."  "..hour..":"..min..":"..second
            end
        end,-1,nil)
    end
end
function M:InitBottomPoint()
    Tools.ClearAllChild(self.dian_parent().gameObject)
    self.bottomPointList = {}
    self.BottomPoint().gameObject:SetActive(false)
    for i = 1,#self.allPackageList do
        local point = GameObject.Instantiate(self.BottomPoint().gameObject,self.dian_parent().gameObject.transform,false)
        self.bottomPointList[#self.bottomPointList + 1] = point
        point.transform.name = "BottomPoint"..i
        point:SetActive(true)
        if i == 1 then
            point.transform:Find("Image_dian_1").gameObject:SetActive(true)
            point.transform:Find("Image_dian_2").gameObject:SetActive(false)
        else
            point.transform:Find("Image_dian_1").gameObject:SetActive(false)
            point.transform:Find("Image_dian_2").gameObject:SetActive(true)
        end
    end
end
function M:LightThePoint(index)
    for i = 1,#self.bottomPointList do
        if i == index then
            self.bottomPointList[i].transform:Find("Image_dian_1").gameObject:SetActive(true)
            self.bottomPointList[i].transform:Find("Image_dian_2").gameObject:SetActive(false)
        else
            self.bottomPointList[i].transform:Find("Image_dian_1").gameObject:SetActive(false)
            self.bottomPointList[i].transform:Find("Image_dian_2").gameObject:SetActive(true)
        end
    end
end
function M:InitFreshClock()
    self.ShowTable = {}     ---打开界面时正在显示的礼包列表
    for i,v in pairs(HomeViewModel.packageList) do
        if v.Duration ~= -1 and v.endTime >= Global.GetCurTime() and not v.Status then
            self.ShowTable[#self.ShowTable + 1] = v
        end
    end
    MgrTimer.AddRepeat("FreshWholeUI",1,function()
        local newTable = {}
        local long1 = #self.ShowTable
        for i,v in pairs(HomeViewModel.packageList) do
            if v.Duration ~= -1 and v.endTime >= Global.GetCurTime() and not v.Status then
                newTable[#newTable + 1] = v
            end
        end
        local long2 = #newTable
        if long2 ~= long1 then
            self.allPackageList = newTable
            self.ShowTable = newTable
            self.packageIndex = 1
            if self.allPackageList[self.packageIndex] == nil then
                MgrUI.ClosePop(self.Uid)
            else
                self:InitPackage(self.allPackageList[self.packageIndex])
                self:InitBottomPoint()
            end
        end
    end,-1,nil)
end
function M:OnClose()
    MgrTimer.Cancel("packageTime")
    MgrTimer.Cancel("FreshWholeUI")
end
function M:OnBackKey()
    local tab = {"BattlePause_UI","SettingPop_UI"}
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
return M