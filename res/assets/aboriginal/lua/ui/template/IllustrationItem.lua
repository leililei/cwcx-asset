-- Code Auto Create Begin
local M = Class('IllustrationItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/IllustrationItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'IllustrationItem','/',2},{'ModulePrefab_xz','ModulePrefab_xz',2},{'Img_di','ModulePrefab_xz/Img_di',2},{'effect','ModulePrefab_xz/Text_Cn/effect',2},{'Jindutiao','ModulePrefab_xz/Jindutiao',2},{'Jindu','ModulePrefab_xz/Jindutiao/Jindu',2},{'Jindu_wu','ModulePrefab_xz/Jindu_wu',2},{'Xzjiaobiao','ModulePrefab_xz/Xzjiaobiao',2},{'NoticeRedDotIcon','ModulePrefab_xz/NoticeRedDotIcon',2},{'Ani_Root','ModulePrefab_xz/Ani_Root',2},{'ModulePrefab','ModulePrefab',2},{'Img_di01','ModulePrefab/Img_di',2},{'Jindutiao01','ModulePrefab/Jindutiao',2},{'Jindu01','ModulePrefab/Jindutiao/Jindu',2},{'Jindu_wu01','ModulePrefab/Jindu_wu',2},{'NoticeRedDotIcon01','ModulePrefab/NoticeRedDotIcon',2},{'NoAni_Root','ModulePrefab/NoAni_Root',2},{'Btn','Btn',2},
        -- UITemplate 列表
        {'IllustrationItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Shuzi','ModulePrefab_xz/Text_Shuzi',20},{'Text_Module','ModulePrefab_xz/Text_Shuzi/Text_Module',20},{'Text_Cn','ModulePrefab_xz/Text_Cn',20},{'Text_En','ModulePrefab_xz/Text_En',20},{'Text_Baifenbi','ModulePrefab_xz/Jindutiao/Text_Baifenbi',20},{'Text_Shuzi01','ModulePrefab/Text_Shuzi',20},{'Text_Module01','ModulePrefab/Text_Shuzi/Text_Module',20},{'Text_Cn01','ModulePrefab/Text_Cn',20},{'Text_En01','ModulePrefab/Text_En',20},{'Text_Baifenbi01','ModulePrefab/Jindutiao/Text_Baifenbi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn().gameObject,function()
        self:OnClick()
    end)
end

function M:OnUpdateUI(Args)
    ---@type DexsortLocalData
    self.data = Args[1]
    self.parent = Args[2]
    --如果是空元素隐藏UI
    if self.data.sortid == nil then
        self.ModulePrefab_xz().gameObject:SetActive(false)
        self.ModulePrefab().gameObject:SetActive(false)
        return
    end
    --刷新UI
    local choose_TextCN = CJNUIMgr.GetSunUseName(self.ModulePrefab_xz().gameObject,"Text_Cn").transform:GetComponent("TextMeshProUGUI")
    local choose_TextEN = CJNUIMgr.GetSunUseName(self.ModulePrefab_xz().gameObject,"Text_En").transform:GetComponent("TextMeshProUGUI")
    local ratio_H = CJNUIMgr.GetSunUseName(self.ModulePrefab_xz().gameObject,"Jindutiao")
    local ratio_Null = CJNUIMgr.GetSunUseName(self.ModulePrefab_xz().gameObject,"Jindu_wu")

    local unChoose_TextCN = CJNUIMgr.GetSunUseName(self.ModulePrefab().gameObject,"Text_Cn").transform:GetComponent("TextMeshProUGUI")
    local unChoose_TextEN = CJNUIMgr.GetSunUseName(self.ModulePrefab().gameObject,"Text_En").transform:GetComponent("TextMeshProUGUI")
    local ratio = CJNUIMgr.GetSunUseName(self.ModulePrefab().gameObject,"Jindutiao")
    local ratio_Null2 = CJNUIMgr.GetSunUseName(self.ModulePrefab().gameObject,"Jindu_wu")

    local num = CJNUIMgr.GetSunUseName(self.ModulePrefab_xz().gameObject,"Text_Shuzi").transform:GetComponent("TextMeshProUGUI")
    local num2 = CJNUIMgr.GetSunUseName(self.ModulePrefab().gameObject,"Text_Shuzi").transform:GetComponent("TextMeshProUGUI")
    --文本赋值
    choose_TextCN.text = self.data.namecn
    choose_TextEN.text = self.data.nameen
    unChoose_TextCN.text = self.data.namecn
    unChoose_TextEN.text = self.data.nameen
    num.text = self.data.sortid
    num2.text = self.data.sortid
    --默认UI显示
    self.ModulePrefab_xz().gameObject:SetActive(false)
    self.ModulePrefab().gameObject:SetActive(true)
    self.Xzjiaobiao().gameObject:SetActive(true)
    --是否显示比率
    ratio_H:SetActive(self.data.displayper == 1)
    ratio:SetActive(self.data.displayper == 1)
    ratio_Null:SetActive(self.data.displayper == 0)
    ratio_Null2:SetActive(self.data.displayper == 0)
    --刷新动画模型
    Tools.ClearAllChild(self.Ani_Root().gameObject)
    Tools.ClearAllChild(self.NoAni_Root().gameObject)
    --加载动态模型
    MgrRes.GetPrefab("ABOriginal/VFX/Prefab/UI_Prefab/"..self.data.runmodel..".prefab",function(Obj)
        if Obj == nil then
            return
        end
        Obj.transform:SetParent(self.Ani_Root().gameObject.transform)
        Obj.transform.localPosition = Vector3.zero
        Obj.transform.localScale = Vector3.one
    end)
    --加载静态模型
    MgrRes.GetPrefab("ABOriginal/VFX/Prefab/UI_Prefab/"..self.data.restmodel..".prefab",function(Obj)
        if Obj == nil then
            return
        end
        Obj.transform:SetParent(self.NoAni_Root().gameObject.transform)
        Obj.transform.localPosition = Vector3.zero
        Obj.transform.localScale = Vector3.one
    end)
    --刷新百分比UI
    self:RefreshRatio()
    --如果刚进入此界面
    if self.parent.curItem == nil then
        if self.data.sortid == 1 + 3 then
            self.ModulePrefab_xz().gameObject:SetActive(true)
            self.ModulePrefab().gameObject:SetActive(false)
            self.Xzjiaobiao().gameObject:SetActive(true)
            self.parent.curItem = self.ObjRoot
            self.parent.lastIndex = self.parent.curIndex
        end
    end
    --红点
    self:CheckRedDot()
end

function M:OnClick()
    --空数据直接返回
    if self.data.sortid == nil then
        return
    end
    local index = tonumber(self.ObjRoot.name) - 1
    if self.parent.curIndex  + 2 == index then
        self.parent.curItem = self.ObjRoot
        if self.data.type == 1 then        --美术鉴赏
            MgrUI.GoHide(UID.ArtAppreciation_UI)
        elseif self.data.type == 2 then    --角色阵营
            MgrUI.GoHide(UID.RoleTeam_UI)
        elseif self.data.type == 3 then   --技能图鉴
            MgrUI.GoHide(UID.Skillook_UI)
        elseif self.data.type == 4 then   --原罪图鉴
            MgrUI.GoHide(UID.Original_UI)
        elseif self.data.type == 5 then   --成就图鉴
            if SysLockControl.CheckSysLock(1401) == false then
                MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1401)},true)
                return
            end
            MgrUI.GoHide(UID.Achievement_UI)
        elseif self.data.type == 6 then  --勋章图鉴
            MgrUI.GoHide(UID.Medal_UI)
        elseif self.data.type == 7 then  --帮助
            self.parent.ModuleScroll01().gameObject:SetActive(false)
            HelpViewModel.Go(77,function()
                if self.parent.ObjRoot then
                    self.parent.ModuleScroll01().gameObject:SetActive(true)
                end
            end)
        elseif self.data.type == 8 then     --皮肤图鉴
            MgrUI.GoHide(UID.ArtRoleSkin_UI)
        end
    else
        --滑动并吸附当前item
        self.parent.ModuleScroll01():ScrollToCell(index - 2,3500)
    end
end

---刷新百分比
function M:RefreshRatio()
    --判断是否显示百分比
    if self.data.displayper == 1 then
        --获取UI
        local slider = CJNUIMgr.GetSunUseName(self.ModulePrefab().gameObject,"Jindu").transform:GetComponent("Image")
        local text_ratio = CJNUIMgr.GetSunUseName(self.ModulePrefab().gameObject,"Text_Baifenbi").transform:GetComponent("TextMeshProUGUI")
        local slider_H = CJNUIMgr.GetSunUseName(self.ModulePrefab_xz().gameObject,"Jindu").transform:GetComponent("Image")
        local text_ratio_H = CJNUIMgr.GetSunUseName(self.ModulePrefab_xz().gameObject,"Text_Baifenbi").transform:GetComponent("TextMeshProUGUI")

        local has = 0  --已解锁的
        local all = 0  --总数
        if self.data.type == 4 then  --原罪图鉴
             has,all = IllustrationViewModel.GetOriginalRatio()
        elseif self.data.type == 5 then  --成就图鉴
            has,all = IllustrationViewModel.GetAchievementRatio()
        elseif self.data.type == 6 then  --勋章图鉴
            has,all = IllustrationViewModel.GetMetalRatio()
        end
        --收集百分比文本
        local value = has/all
        text_ratio.text = math.floor(value * 100).."%"
        text_ratio_H.text = math.floor(value * 100).."%"
        --滑条
        slider_H.fillAmount = value
        slider.fillAmount = value
    end
end

function M:CheckRedDot()
    self.NoticeRedDotIcon().gameObject:SetActive(false)
    self.NoticeRedDotIcon01().gameObject:SetActive(false)
    if self.data.type == 5 then   --成就图鉴
        self.NoticeRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("AchieveTask").State)
        self.NoticeRedDotIcon01().gameObject:SetActive(RedDotControl.GetDotData("AchieveTask").State)
    end
end

return M