-- Code Auto Create Begin
local M = Class('NoviceFrame_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NoviceFrame_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NoviceFrame_UI].prefab'
    self.Name = 'Form[NoviceFrame_UI]'
    self.Layer = UILayerLv.Guide
    self.Depth = 12
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'FormNoviceFrame_UI','/',2},{'ClickBg2','ClickBg2',2},{'Img_QCg','Img_QCg',2},{'Img_Guide','Img_Guide',2},{'Img_MaskItem','Img_MaskItem',2},{'Img_maskJT','Img_MaskItem/Img_maskJT',2},{'Img_OrderItem','Img_OrderItem',2},{'Img_Jt','Img_OrderItem/Img_Jt',2},{'finger','Img_OrderItem/finger',2},{'Img_RoleItem','Img_RoleItem',2},{'Img_maskJT01','Img_RoleItem/Img_maskJT',2},{'Image','Img_RoleItem/Image',2},{'Img_AllOrderItem','Img_AllOrderItem',2},{'Img_AllRoleItem','Img_AllRoleItem',2},{'Faceplate','Faceplate',2},{'Frame','Frame',2},{'bg','Frame/bg',2},{'triangle','Frame/triangle',2},{'Img_IDxian','Frame/Text_name/Img_IDxian',2},{'HeadIcon','Frame/HeadIcon',2},{'Touxiangkuang','Frame/HeadIcon/Touxiangkuang',2},{'Img_Icon','Frame/HeadIcon/Img_Icon',2},{'GuideAni','GuideAni',2},{'arrow','GuideAni/arrow',2},{'finger01','GuideAni/finger',2},
        -- Button 列表
        {'ClickBg','ClickBg',4},
        -- TextMeshProUGUI 列表
        {'Text_touchtoexit','Img_Guide/Text_touchtoexit',20},{'Text_txt','Frame/Text_txt',20},{'Text_name','Frame/Text_name',20},
    }
end
-- Code Auto Create End
require("LocalData/TutorialLocalData")
function M:OnInit()
    self:SetLayer(3500)
    self.LocalEffectObj = nil
    self.Img_MaskItem().gameObject:SetActive(false)
    self.Img_OrderItem().gameObject:SetActive(false)
    self.Img_RoleItem().gameObject:SetActive(false)
    self.Img_AllRoleItem().gameObject:SetActive(false)
    self.GuideAni().gameObject:SetActive(false)
    ---遮罩点击
    self.ClickBg = self.FormNoviceFrame_UI().transform:Find("ClickBg").gameObject
    ---遮罩
    self.NoviceMask = self.ClickBg:GetComponent("NoviceMask")
    ---默认是不镂空
    self.NoviceMask.inner_trans = nil
    ---获取战斗摄像机
    self.battleCamera = CMgrCamera.Instance.FightCamera
    ---获取ui摄像机
    self.uiCamera = GameObject.Find("UI_Camera"):GetComponent("Camera")
    self.targetTrans = self.FormNoviceFrame_UI().transform:GetComponent("RectTransform")
    ---置空文本
    self.txt = ""
    ---头像
    self.icon = self.Img_Icon()
    ---隐藏图片
    self.Img_AllOrderItem().gameObject:SetActive(false)
    ---默认隐藏全屏点击按钮
    self.ClickBg2().gameObject:SetActive(false)

    self.first = true
    UIEvent.LuaClick(self.ClickBg, function()
        self:ClickBG()
    end)

    ---全屏点击按钮逻辑
    UIEvent.LuaClick(self.ClickBg2().gameObject,function()
        self:ClickBG()
    end)

    self:AddEvent()
end

function M:OnShow(data)
    ---清除特效
    if self.LocalEffectObj then
        GameObject.Destroy(self.LocalEffectObj)
        self.LocalEffectObj = nil
    end
    self.CurId = data[1]    --当前新手引导ID
    self.Callback = data[2] --关闭界面时回调
    self:UpdateTxt(self.CurId)
end

function M:UpdateTxt(id)
    if NoviceViewModel.EffectObj then
        GameObject.Destroy(NoviceViewModel.EffectObj)
        NoviceViewModel.EffectObj = nil
    end
    if NoviceViewModel.cloneObj then
        GameObject.Destroy(NoviceViewModel.cloneObj)
        NoviceViewModel.cloneObj = nil
    end

    local tutorData = TutorialLocalData.tab[id]
    ---音频名字
    local _AudioName = tutorData[7]
    ---Q版漫画
    local QCGName = tutorData[8]
    local QCGNamePos = JNStrTool.strSplit(",",tutorData[9])
    ---对话框坐标
    local framePos =JNStrTool.strSplit(",",tutorData[5])
    ---遮罩位置物体名字
    local controlName =  tutorData[11]
    ---Bgm
    local BgmName = tutorData[21]

    self.control_coordinate = tutorData[12]

    if BgmName ~= "0" then
        MgrSound.PlayBGM(BgmName,0.2)
    end

    ---是否开启全屏点击区域(无视黑布裁剪区域)
    if self.control_coordinate == nil or self.control_coordinate == "0" then
        self.ClickBg2().gameObject:SetActive(true)
    else
        self.ClickBg2().gameObject:SetActive(false)
    end

    ---说话人
    if  tutorData[18] == "0" then
        self.Text_name().gameObject:SetActive(false)
    else
        self.Text_name().gameObject:SetActive(true)
        self.Text_name().text = tutorData[18]
    end

    if self.txt and self.txt~= tutorData[6] then
        ---说话文本
        self.txt = tutorData[6]
        self.Text_txt().text = ""
        ---文本
        if self.txt ~= "0"  then
            self.Frame().gameObject:SetActive(true)
            --Tools.DoPText(self.Text_txt(),self.txt,20,1,0)
            self.Text_txt().text = self.txt
        else
            self.Frame().gameObject:SetActive(false)
        end
    end
    ---播放音频
    if _AudioName ~= "0" then
        MgrSound.Stop(3,tostring(PlayerControl.GetPlayerData().curRoleID),false)
        MgrSound.PlayPlot(_AudioName,nil,nil,false,0,0,"SDFN")
    end

    ---播放cg
    if QCGName ~= "0" then
        self.Img_QCg().gameObject:SetActive(true)
        if QCGNamePos[1] == "0" then
            self.Img_QCg().gameObject:GetComponent("RectTransform").anchoredPosition =  Vector2(0,0)
        else
            self.Img_QCg().gameObject:GetComponent("RectTransform").anchoredPosition =  Vector2(tonumber(QCGNamePos[1]),tonumber(QCGNamePos[2]))
        end
        MgrRes.LoadSprite( self.Img_QCg(),"Preview/"..QCGName)
    else
        self.Img_QCg().gameObject:SetActive(false)
    end

    ---加载示意图
    if tutorData[29] ~= "0" then
        self.Img_Guide().gameObject:SetActive(true)
        MgrRes.LoadSprite( self.Img_Guide(),"Preview/"..tutorData[29])
    else
        self.Img_Guide().gameObject:SetActive(false)
    end

    ---高亮控件
    self:ShowGuideEffect(id)

    ---对话框坐标
    local x = tonumber(framePos[1])
    local y = tonumber(framePos[2])
    if x ~= nil and y ~= nil then
        self.Frame().gameObject:GetComponent("RectTransform").anchoredPosition = Vector2(x,y)
    end
    ---切换头像
    if tutorData[4] ~= "0" and tutorData[4] ~= nil then
        MgrRes.LoadSprite(self.icon,tutorData[4],nil)
    end
    ---是否显示头像
    if tutorData[4] == "0" then
        self.HeadIcon().gameObject:SetActive(false)
    else
        self.HeadIcon().gameObject:SetActive(true)
    end
    NoviceViewModel.CurTaskId = self.CurId
end

function M:OnHide()
    if self.LocalEffectObj then
        GameObject.Destroy(self.LocalEffectObj)
        self.LocalEffectObj = nil
    end
    if self.Callback then
        self.Callback()
    end
    if NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId).type == 5 then
        Event.Go("CloseTactical")
    end
end

function M:OnClose()
    ---界面关闭时关闭语音
    MgrSound.Stop(5)
end

function M:ClickBG()
    if self.first then
        self.ClickBg:GetComponent("CanvasGroup").enabled = false
        self.first = false
    end
    ---如果点击区域有限制
    if self.control_coordinate ~= "0" then
        return
    end
    local curData = NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId)
    ---如果末尾标记为0 直接进行下一步
    if curData.endSign == 0 then
        ---点击关闭自己
        if curData.type == 0 or curData.type == 8 then
            MgrUI.PopHide(self.Uid)
        end
        ---更改当前教程状态
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
        MessageEvent.Go(EID.NoviceCheck)
    else
        ---末尾标记不为0 等回调回来了才进行下一步
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
            if curData.type == 0 or curData.type == 8 or curData.type == 7 then
                MgrUI.PopHide(self.Uid)
                ---更改当前教程状态
                MessageEvent.Go(EID.NoviceCheck)
                MgrUI.UnLock("Novice_LastStep")
            end
        end)
    end
end

function M:ShowGuideEffect(id)
    local data = TutorialLocalData.tab[id]
    ---是否显示箭头
    if data[22] ~= "0" and data[22] ~= nil then
        if self.Img_MaskItem().name == data[22] then
            self.Img_MaskItem().gameObject:SetActive(true)
            self.Img_OrderItem().gameObject:SetActive(false)
            self.Img_RoleItem().gameObject:SetActive(false)
            self.ArrowItem = self.Img_MaskItem()
        elseif self.Img_OrderItem().name == data[22] then
            self.Img_OrderItem().gameObject:SetActive(true)
            self.Img_MaskItem().gameObject:SetActive(false)
            self.Img_RoleItem().gameObject:SetActive(false)
            self.ArrowItem = self.Img_OrderItem()
        elseif self.Img_RoleItem().name == data[22] then
            self.Img_OrderItem().gameObject:SetActive(false)
            self.Img_MaskItem().gameObject:SetActive(false)
            self.Img_RoleItem().gameObject:SetActive(true)
            self.ArrowItem = self.Img_RoleItem()
        end

        ---地板格子名字都是一样无法通过路径精确获取 于是获取格子的parent去GetChild
        local str = string.split(data[11],",")
        if #str >1 then
            self.ArrowItem.transform.localPosition = Tools.GetUIPos(NoviceViewModel.GetObj(str[1]).transform:GetChild(tonumber(str[2])).gameObject,self.battleCamera,self.uiCamera,self.targetTrans)
            if self.ArrowItem == self.Img_OrderItem() then
                --Tools.TweenDoLocalMoveX(self.ArrowItem.gameObject,-480,0,-1)
            end
        end
    else
        self.Img_OrderItem().gameObject:SetActive(false)
        self.Img_MaskItem().gameObject:SetActive(false)
        self.Img_RoleItem().gameObject:SetActive(false)
        self.Img_AllOrderItem().gameObject:SetActive(false)
        self.ArrowItem = nil
    end

    ---克隆按钮
    if data[24] ~= "0" and data[24] ~= nil then
        MgrTimer.AddDelay(id,data[25], function()
            ---特效
            if data[10] ~= "0" and data[10] ~= nil then
                NoviceViewModel.CloneObj(NoviceViewModel.GetObj(data[24]),data[19],false,data[10],self.targetTrans,data[23])
            else
                NoviceViewModel.Clone(NoviceViewModel.GetObj(data[11]),self.targetTrans,data[19])
            end
            ---如果是点击任意位置进行下一步 关闭克隆物体的image
            if NoviceViewModel.cloneObj and data[12] == "0" then
                local Img = NoviceViewModel.cloneObj.transform:GetComponent("Image")
                if Img then
                    Img.raycastTarget = false
                end
            end
        end)
    elseif data[10] ~= "0" and data[10] ~= nil then
        ---如果特效和镂空区域不为空
        self.LocalEffectObj = NoviceViewModel.CreateEffect(data[10],NoviceViewModel.GetObj(data[11]),data[23])
    end

    ---镂空区域
    if data[11] ~= "0" and data[11] ~= nil then
        local str = string.split(data[11],",")
        if #str >1 then
            self.NoviceMask.inner_trans = NoviceViewModel.GetObj(str[1]).transform:GetChild(tonumber(str[2])):GetComponent("RectTransform")
        else
            self.NoviceMask.inner_trans = NoviceViewModel.GetObj(data[11]):GetComponent("RectTransform")
        end

        ---由于地板是名字都是一样无法通过路径去获取准确的格子 于是获取格子的parent再通过GetChild去获取格子
        if self.ArrowItem ~= nil then
            ---如果是角色框 上移以显示整个角色
            if self.ArrowItem == self.Img_RoleItem() then
                Global.DoMoveY(self.ArrowItem.gameObject,self.Img_RoleItem().transform.localPosition.y + 40,0)
                self.ArrowItem = self.ArrowItem.transform:Find("Image").gameObject
            end
            self.NoviceMask.inner_trans = self.ArrowItem:GetComponent("RectTransform")
        end
    else
        self.NoviceMask.inner_trans = nil
    end
end

function M:AddEvent()

    Event.Clear("Novice50105")
    Event.Add("Novice50105",function()
        local obj = NoviceViewModel.Clone(NoviceViewModel.GetObj("Mgr_UI/UI_Root/UI_Full/Form[NoviceBattle_UI]/Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole/Content/1"),self.targetTrans,nil)
        self.GuideAni().transform:SetParent(obj.gameObject.transform)
        self.GuideAni().transform.localPosition = Vector3.zero
        self.GuideAni().transform:SetParent(self.targetTrans.gameObject.transform)
        self.GuideAni().gameObject:SetActive(true)
        self.GuideAni().gameObject:GetComponent("Animation"):Play()
        obj.gameObject:SetActive(false)
    end)

    Event.Clear("Novice50106")
    Event.Add("Novice50106",function()
        self.GuideAni().gameObject:SetActive(false)
    end)

    Event.Clear("HighlightAllRole")
    Event.Add("HighlightAllRole",function()
        self.Img_AllRoleItem().gameObject:SetActive(true)
        self.NoviceMask.inner_trans = self.Img_AllRoleItem().gameObject:GetComponent("RectTransform")
    end)

    Event.Clear("CloseAllRole")
    Event.Add("CloseAllRole",function()
        self.Img_AllRoleItem().gameObject:SetActive(false)
        self.NoviceMask.inner_trans = nil
    end)

    Event.Clear("Novice50305")
    Event.Add("Novice50305",function()
        self.GuideAni().gameObject:SetActive(true)
        self.GuideAni().transform.localPosition = Vector3(-400,38,0)
        self.GuideAni().transform.localRotation = Quaternion.Euler(0,0,-90)
    end)

    Event.Clear("Novice50306")
    Event.Add("Novice50306",function()
        self.GuideAni().gameObject:SetActive(false)
    end)

    Event.Clear("Novice50519")
    Event.Add("Novice50519",function()
        local go = NoviceViewModel.GetObj("JNMgr/LeftRoot").transform:GetChild(0).transform:Find("AtkOrder(Clone)").gameObject
        self.Img_AllOrderItem().transform.localPosition = Tools.GetUIPos(go,self.battleCamera,self.uiCamera,self.targetTrans)
        Global.DoMoveX(self.Img_AllOrderItem().gameObject,-512,0)
        self.Img_AllOrderItem().gameObject:SetActive(true)
        self.NoviceMask.inner_trans = self.Img_AllOrderItem().gameObject:GetComponent("RectTransform")
    end)

    Event.Clear("Novice50523")
    Event.Add("Novice50523",function()
        self.ArrowItem.transform.sizeDelta = Vector2(462,200)
    end)
end

return M