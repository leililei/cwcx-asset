-- Code Auto Create Begin
local M = Class('Original_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Original_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Original_UI].prefab'
    self.Name = 'Form[Original_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'SwitchPanel','SwitchPanel',2},{'Img_Qieyexian','SwitchPanel/Img_Qieyexian',2},{'OriginalSwitchItem','SwitchPanel/SwitchScroll/OriginalSwitchItem',2},{'Btn_Switch','SwitchPanel/SwitchScroll/OriginalSwitchItem/Btn_Switch',2},{'Img_Qieyedian','SwitchPanel/SwitchScroll/OriginalSwitchItem/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchScroll/OriginalSwitchItem/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','SwitchPanel/SwitchScroll/OriginalSwitchItem/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'RedDotIcon','SwitchPanel/SwitchScroll/OriginalSwitchItem/RedDotIcon',2},{'OriginalPanel','OriginalPanel',2},{'OriginalItem','OriginalPanel/OriginalScroll/OriginalItem',2},{'Content','OriginalPanel/OriginalScroll/Content',2},{'PopPanel','PopPanel',2},{'Img_BG01','PopPanel/Img_BG',2},{'SwitchPopPanel','PopPanel/SwitchPopPanel',2},{'Img_Qieyexian01','PopPanel/SwitchPopPanel/Img_Qieyexian',2},{'SwitchMonster','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster',2},{'Switch','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch',2},{'Btn_Switch01','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch/Btn_Switch',2},{'Img_Qieyedian01','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight01','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch/Btn_SwitchHighLight',2},{'Img_Qieyedian_H01','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'RedDotIcon01','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch/RedDotIcon',2},{'OriginalSecItem','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll/OriginalSecItem',2},{'Btn_Switch02','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll/OriginalSecItem/Btn_Switch',2},{'Btn_SwitchHighLight02','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll/OriginalSecItem/Btn_SwitchHighLight',2},{'Img_Qieyekuang','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll/OriginalSecItem/Btn_SwitchHighLight/Img_Qieyekuang',2},{'RedDotIcon02','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll/OriginalSecItem/RedDotIcon',2},{'lihui','PopPanel/lihui',2},{'zhezhao','PopPanel/zhezhao',2},{'chakanxian','PopPanel/Btn_Chakan/chakanxian',2},{'Btn_chakan','PopPanel/Btn_Chakan/Btn_chakan',2},{'ZoomIn','PopPanel/Btn_Chakan/ZoomIn',2},{'zommin','PopPanel/Btn_Chakan/ZoomIn/zommin',2},{'ZoomOut','PopPanel/Btn_Chakan/ZoomOut',2},{'zoomout','PopPanel/Btn_Chakan/ZoomOut/zoomout',2},{'OriginalInfo','PopPanel/OriginalInfo',2},{'guang','PopPanel/OriginalInfo/guang',2},{'UpperLeftPopPanel','PopPanel/UpperLeftPopPanel',2},{'Img_Fenggexian01','PopPanel/UpperLeftPopPanel/Img_Fenggexian',2},{'Btn_I_Pop','PopPanel/UpperLeftPopPanel/Btn_I_Pop',2},{'InfoReturn','PopPanel/UpperLeftPopPanel/InfoReturn',2},{'Btn_InfoReturn','PopPanel/UpperLeftPopPanel/InfoReturn/Btn_InfoReturn',2},{'Btn_InfoHome','PopPanel/UpperLeftPopPanel/InfoReturn/Btn_InfoHome',2},
        -- UITemplate 列表
        {'OriginalItem01','OriginalPanel/OriginalScroll/OriginalItem',10},
        -- Toggle 列表
        {'OriginalSwitchItem01','SwitchPanel/SwitchScroll/OriginalSwitchItem',13},
        -- RawImage 列表
        {'SwitchScroll','SwitchPanel/SwitchScroll',15},{'OriginalScroll','OriginalPanel/OriginalScroll',15},{'SwitchPopScroll','PopPanel/SwitchPopPanel/SwitchPopScroll',15},{'ItemScroll','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchPanel/SwitchScroll',18},{'OriginalScroll01','OriginalPanel/OriginalScroll',18},{'SwitchPopScroll01','PopPanel/SwitchPopPanel/SwitchPopScroll',18},{'ItemScroll01','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Origina_CN','UpperLeftPanel/Text_Original/Text_Origina_CN',20},{'Text_Origina_EN','UpperLeftPanel/Text_Original/Text_Origina_EN',20},{'CNText','SwitchPanel/SwitchScroll/OriginalSwitchItem/Btn_Switch/CNText',20},{'CNText01','SwitchPanel/SwitchScroll/OriginalSwitchItem/Btn_SwitchHighLight/CNText',20},{'CNText02','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch/Btn_Switch/CNText',20},{'CNText03','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/Switch/Btn_SwitchHighLight/CNText',20},{'Text_Qieyeming','PopPanel/SwitchPopPanel/SwitchPopScroll/SwitchMonster/ItemScroll/OriginalSecItem/Text_Qieyeming',20},{'Text_Shuoming','PopPanel/zhezhao/Text_Shuoming',20},{'Text_Yuanzuijieshao','PopPanel/zhezhao/Text_Yuanzuijieshao',20},{'Text_OriginalName','PopPanel/OriginalInfo/Text_OriginalName',20},{'Text_Voicer','PopPanel/OriginalInfo/Text_Voicer',20},{'Text_Origina_CN01','PopPanel/UpperLeftPopPanel/Text_Original/Text_Origina_CN',20},{'Text_Origina_EN01','PopPanel/UpperLeftPopPanel/Text_Original/Text_Origina_EN',20},
    }
end
-- Code Auto Create End
--require("LocalData/MonsterdexLocalData")
function M:OnInit()
    ---初始化按钮
    self:InitBtn()
    ---注册滑块
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.PageCell))
    self.SwitchPopScroll01():SetLuaCellEvent(Handle(self, self.CellData))
    self.OriginalScroll01():SetLuaCellEvent(Handle(self, self.CellOri))
    ---获取页签数据
    self.SwitchData = OriginalControl.GetSwitchData()
    ---当前选中类型
    self.CurType = nil
    ---当前选择的原罪
    self.CurOriginal = nil
    ---当前选中页签物品
    self.CurSwitch = nil
    ---当前子页签选中的物体
    self.CurSonSwitch = nil
    ---是否可滑动
    self.canScroll = false
    ---子页签是否可滑动
    self.sonCanScroll = false
    ---刷新解锁数据
    OriginalControl.RefreshUnlock()
end

function M:OnShow()
    self.SwitchScroll01().totalCount = #self.SwitchData
    self.SwitchScroll01():RefillCells(0)
    self.PopPanel().gameObject:SetActive(false)
end

---初始化按钮事件
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回上一级
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.Btn_InfoReturn().gameObject,function()
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopPanel().gameObject:SetActive(false)
        self.canScroll = false
        self.sonCanScroll = false
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_InfoHome().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_Home().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---点击帮助
    UIEvent.LuaClick(self.Btn_I_Pop().gameObject,function()

    end)
    ---点击放大立绘
    UIEvent.LuaClick(self.ZoomIn().gameObject,function()
        self.ZoomIn().gameObject:SetActive(false)
        self.ZoomOut().gameObject:SetActive(true)
        self.SwitchPopPanel().gameObject:SetActive(false)
        self.zhezhao().gameObject:SetActive(false)
        self.OriginalInfo().gameObject:SetActive(false)
        self.UpperLeftPopPanel().gameObject:SetActive(false)
        self:TouchUpdate()
    end)
    ---点击缩小立绘
    UIEvent.LuaClick(self.ZoomOut().gameObject,function()
        self:TouchExit()
        self.ZoomIn().gameObject:SetActive(true)
        self.ZoomOut().gameObject:SetActive(false)
        self.SwitchPopPanel().gameObject:SetActive(true)
        self.zhezhao().gameObject:SetActive(true)
        self.OriginalInfo().gameObject:SetActive(true)
        self.UpperLeftPopPanel().gameObject:SetActive(true)
    end)
    self.ZoomIn().gameObject:SetActive(true)
    self.ZoomOut().gameObject:SetActive(false)
end

---主页签回调
function M:PageCell(trans, idx)
    self:RefreshPage(trans.gameObject, idx)
end
---标签页回调事件
function M:CellData(trans, idx)
    self:RefreshSwitch(trans.gameObject, idx)
end

function M:CellOri(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.OriginalData[idx],self})
end

---刷新原罪列表
function M:ReOriginalScroll(type,offset)
    self.OriginalData = OriginalControl.GetOriginalDataByType(type)
    self.OriginalScroll01().totalCount = #self.OriginalData
    if offset then
        self.OriginalScroll01():RefillCells(offset)
    else
        self.OriginalScroll01():RefreshCells()
    end
end

---刷新主页签
function M:RefreshPage(obj,idx)
    ---获取物体和组件
    local tog = obj.transform:GetComponent("Toggle")
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local normalText = CJNUIMgr.GetSunUseName(normal, "CNText"):GetComponent("TextMeshProUGUI")
    local highText = CJNUIMgr.GetSunUseName(highLight, "CNText"):GetComponent("TextMeshProUGUI")
    local redDot = CJNUIMgr.GetSunUseName(obj, "RedDotIcon").gameObject
    local data = self.SwitchData[idx]
    ---文本赋值
    normalText.text = data.typeName
    highText.text = data.typeName
    ---toggle组赋值
    tog.group = self.SwitchScroll01().content.gameObject:GetComponent("ToggleGroup")
    ---注册tog点击事件
    Tools.ToggleValueChange(tog,function(isOn)
        if isOn then
            normal:SetActive(false)
            highLight:SetActive(true)
            ---刷新右侧原罪头像
            self:ReOriginalScroll(data.type,0)
        else
            normal:SetActive(true)
            highLight:SetActive(false)
        end
    end,nil)

    ---默认显示
    normal:SetActive(true)
    highLight:SetActive(false)
    if idx == 1 then
        tog.isOn = true
    else
        tog.isOn = false
    end
    ---红点
    redDot:SetActive(OriginalControl.GetTypeState(data.type))
end

---刷新页签
function M:RefreshSwitch(obj,idx)
    ---获取物体和组件
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local normalText = CJNUIMgr.GetSunUseName(normal, "CNText"):GetComponent("TextMeshProUGUI")
    local highText = CJNUIMgr.GetSunUseName(highLight, "CNText"):GetComponent("TextMeshProUGUI")
    local scroll = CJNUIMgr.GetSunUseName(obj, "ItemScroll"):GetComponent("LoopScrollRect")
    local redDot = CJNUIMgr.GetSunUseName(obj, "RedDotIcon").gameObject
    local data = self.SwitchData[idx]
    ---文本赋值
    normalText.text = data.typeName
    highText.text = data.typeName
    ---注册滑块
    scroll:SetLuaCellEvent(function(trans,_idx)
        self:RefreshSonSwitch(trans.gameObject,_idx)
    end)

    UIEvent.LuaClick(obj,function()
        self:OnClickSwitch(normal,highLight,data,scroll,idx,obj)
    end)

    ---索引为1则默认高亮
    normal:SetActive(true)
    highLight:SetActive(false)
    scroll.gameObject:SetActive(false)
    if self.CurType == nil then
        if idx == 1 then
            self:OnClickSwitch(normal,highLight,data,scroll,idx,obj)
        end
    else
        if data.type == self.CurType then
            self:OnClickSwitch(normal,highLight,data,scroll,idx,obj)
        end
    end
    ---红点
    redDot:SetActive(OriginalControl.GetTypeState(data.type))
end

---刷新子页签
function M:RefreshSonSwitch(obj,idx)
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local name = CJNUIMgr.GetSunUseName(obj, "Text_Qieyeming"):GetComponent("TextMeshProUGUI")
    local redDot = CJNUIMgr.GetSunUseName(obj, "RedDotIcon").gameObject
    local data = self.SonSwitchData[idx]

    ---文本赋值
    if StormControl.CheckPointPass(data.unlockId) == false then
        name.text = MgrLanguageData.GetLanguageByKey("ui_dex_text9")
    else
        name.text = data.name
    end


    UIEvent.LuaClick(obj,function()
        self:OnClickSonSwitch(obj)
        self:ReOriginal(data)
    end)

    normal:SetActive(true)
    highLight:SetActive(false)
    ---存入的原罪不为空
    if self.CurOriginal ~= nil then
        if data.monsterId == self.CurOriginal.monsterId then
            self:OnClickSonSwitch(obj)
            self:ReOriginal(data)
        end
    else
        ---当前无选中子签时默认选中为1的子签
        if idx == 1 and self.CurOriginal == nil then
            self:OnClickSonSwitch(obj)
            self:ReOriginal(data)
        end
    end

    ---红点
    redDot:SetActive(data.showRedDot)
end

---@param data OriginalAtlasData
---刷新详情面板
function M:RePopPanel(data)
    self.CurOriginal = data   --当前原罪
    self.CurType = data.type
    self.SwitchPanel().gameObject:SetActive(false)
    self.PopPanel().gameObject:SetActive(true)
    self.SwitchPopScroll01().totalCount = #self.SwitchData
    self.SwitchPopScroll01():RefreshCells()
end

---按钮变化状态
function M:SwitchOnOrOff(obj,check)
    if obj == nil then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local scroll = CJNUIMgr.GetSunUseName(obj, "ItemScroll")
    normal:SetActive(not check)
    highLight:SetActive(check)
    if scroll then
        scroll.gameObject:SetActive(check)
        ---刷新自适应组件
        Tools.ReContentSizeGroup(self.SwitchPopScroll01().content.gameObject)
    end
end

---点击类型
function M:OnClickSwitch(normal,highLight,data,scroll,idx,obj)
    normal:SetActive(false)
    highLight:SetActive(true)
    scroll.gameObject:SetActive(true)
    ---当选择了新类型标签时
    if self.CurType ~= data.type then
        ---重置当前选择原罪
        self.CurOriginal = nil
        ---重置当前类型
        self.CurType = data.type
    end
    -----当前类型和子页签为空
    --if self.CurType == nil and self.CurSonSwitch == nil then
    --    ---当前选中置空
    --    self.CurSonSwitch = nil
    --end
    ---刷新子页签
    self.SonSwitchData = OriginalControl.GetUnlockOriginalDataByType(data.type)
    scroll.totalCount = #self.SonSwitchData
    ---列表长度大于0才去刷新滑块
    if #self.SonSwitchData > 0 then
        ---子页签滑块滑动
        if self.CurOriginal ~= nil then
            ---滑动
            scroll:RefillCells(self.CurOriginal.sort - 1 < 0 and 1 or self.CurOriginal.sort - 1)
        else
            scroll:RefillCells(0)
        end
    end

    ---页签滑动
    if self.canScroll == false then
        self.canScroll = true
    else
        ---滑动
        self.SwitchPopScroll01():ScrollToCell(idx - 1 < 0 and 1 or idx - 1,3500)
    end
    ---刷新自适应组件
    Tools.ReContentSizeGroup(self.SwitchPopScroll01().content.gameObject)
    ---上一个按钮改变状态
    if self.CurSwitch then
        self:SwitchOnOrOff(self.CurSwitch,false)
        self:SwitchOnOrOff(obj,true)
        self.CurSwitch = obj
    else
        self.CurSwitch = obj
    end
end

---点击类型子标签
function M:OnClickSonSwitch(obj)
    ---上一个按钮改变状态
    if self.CurSonSwitch then
        self:SwitchOnOrOff(self.CurSonSwitch,false)
    end
    self:SwitchOnOrOff(obj,true)
    self.CurSonSwitch = obj
end

---@param data OriginalAtlasData 刷新原罪
function M:ReOriginal(data)
    if StormControl.CheckPointPass(data.unlockId) then
        ---刷新立绘
        MgrRes.LoadHDIcon(self.lihui(),data.monsterId)
        ---详情
        self.Text_Shuoming().text = data.details
        self.Text_Shuoming().gameObject:SetActive(true)
        self.Text_Yuanzuijieshao().gameObject:SetActive(true)
        ---原罪名
        self.Text_OriginalName().text = data.name
        self.OriginalInfo().gameObject:SetActive(true)
        ---CV
        self.Text_Voicer().text = string.format(MgrLanguageData.GetLanguageByKey("ui_dex_text8"),data.cv)
        self.Text_Voicer().gameObject:SetActive(true)
        ---按钮
        self.ZoomIn().gameObject.transform.parent.gameObject:SetActive(true)
    else
        ---黑底
        MgrRes.LoadSprite(self.lihui(),SteamLocalData.tab[118002][2])
        ---详情
        self.Text_Shuoming().gameObject:SetActive(false)
        self.Text_Yuanzuijieshao().gameObject:SetActive(false)
        ---原罪名
        self.OriginalInfo().gameObject:SetActive(false)
        ---CV
        self.Text_Voicer().gameObject:SetActive(false)
        ---按钮
        self.ZoomIn().gameObject.transform.parent.gameObject:SetActive(false)
    end

end

--触摸移动放大立绘
function M:TouchUpdate()
    local _OldTouch1,_OldTouch2 --上次触摸点(手指1,2)
    local High = 1000 --可拖动边界高
    local Wide = 1000 --可拖动边界宽
    local MaxScale=1.5
    local MinScale=0.5

    self.OldPosition= Vector3(self.lihui().gameObject.transform.localPosition.x,self.lihui().gameObject.transform.localPosition.y,self.lihui().gameObject.transform.localPosition.z) --记录初始立绘位置
    self.OldPositionScale = Vector3(self.lihui().gameObject.transform.localScale.x,self.lihui().gameObject.transform.localScale.y,self.lihui().gameObject.transform.localScale.z)
    MgrTimer.AddRepeat("TouchUpdate",0,function ()
        if Input.touchCount <= 0 then
            return
        end

        if 1 == Input.touchCount then   --单指触摸
            if Input.touches[0].phase == TouchPhase.Moved then
                local x,y
                x=Mathf.Clamp(self.lihui().gameObject.transform.localPosition.x+Input.touches[0].deltaPosition.x,self.OldPosition.x-Wide,self.OldPosition.x+Wide)
                y=Mathf.Clamp(self.lihui().gameObject.transform.localPosition.y+Input.touches[0].deltaPosition.y,self.OldPosition.y-High,self.OldPosition.y+High)

                self.lihui().gameObject.transform.localPosition=Vector3(x,y,self.OldPosition.z)
            end
        elseif 2 == Input.touchCount then  --双指触摸,放大缩小
            local _NewTouch1 = Input.GetTouch(0);
            local _NewTouch2 = Input.GetTouch(1);

            if _NewTouch2.phase == TouchPhase.Began then
                _OldTouch2 = _NewTouch2
                _OldTouch1 = _NewTouch1
                return
            end

            --计算老的两点距离和新的两点间距离，变大要放大模型，变小要缩放模型
            local _OldDistance = Vector2.Distance(_OldTouch1.position, _OldTouch2.position)
            local _NewDistance = Vector2.Distance(_NewTouch1.position, _NewTouch2.position)
            --两个距离之差，为正表示放大手势， 为负表示缩小手势
            local _Offset = _NewDistance - _OldDistance
            --放大因子， 一个像素按 0.001倍来算(1000可调整)
            local _ScaleFactor = _Offset / 1000;
            local _LocalScale = self.lihui().gameObject.transform.localScale;
            local _Scale = Vector3(_LocalScale.x + _ScaleFactor,
                    _LocalScale.y + _ScaleFactor,
                    _LocalScale.z + _ScaleFactor)

            if _Scale.x > MinScale and _Scale.y > MinScale and _Scale.z > MinScale and _Scale.x < MaxScale and _Scale.y < MaxScale and _Scale.y < MaxScale then
                self.lihui().gameObject.transform.localScale = _Scale;
            end

            --记住最新的触摸点，下次使用
            _OldTouch1 = _NewTouch1
            _OldTouch2 = _NewTouch2
        end
    end,-1,nil)
end

--触摸退出
function M:TouchExit()
    MgrTimer.Cancel("TouchUpdate")
    self.lihui().gameObject.transform.localPosition = self.OldPosition
    self.lihui().gameObject.transform.localScale = self.OldPositionScale
end

function M:OnBackKey()
    if self.touchState == 1 then
        self:TouchExit()
        self.ZoomIn().gameObject:SetActive(true)
        self.ZoomOut().gameObject:SetActive(false)
        self.SwitchPopPanel().gameObject:SetActive(true)
        self.zhezhao().gameObject:SetActive(true)
        self.OriginalInfo().gameObject:SetActive(true)
        self.UpperLeftPopPanel().gameObject:SetActive(true)
        return
    end
    if self.PopPanel().gameObject.activeSelf then
        self.SwitchPanel().gameObject:SetActive(true)
        self.PopPanel().gameObject:SetActive(false)
        self.canScroll = false
        self.sonCanScroll = false
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M