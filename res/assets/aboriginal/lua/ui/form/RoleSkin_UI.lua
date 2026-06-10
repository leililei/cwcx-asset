-- Code Auto Create Begin
local M = Class('RoleSkin_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleSkin_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleSkin_UI].prefab'
    self.Name = 'Form[RoleSkin_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 30
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NomalBg','NomalBg',2},{'Img_DragFrame','Img_DragFrame',2},{'SpinePanel','SpinePanel',2},{'BgSpine','SpinePanel/BgSpine',2},{'Img_BG','SpinePanel/BgSpine/Img_BG',2},{'Img_Shuping','SpinePanel/BgSpine/Img_Shuping',2},{'Img_ShupingZhuangshi','SpinePanel/BgSpine/Img_Shuping/Img_ShupingZhuangshi',2},{'RoleSpinePanel','SpinePanel/RoleSpinePanel',2},{'RoleSpineClickArea','SpinePanel/RoleSpinePanel/RoleSpineClickArea',2},{'Img_Frame','SpinePanel/RoleSpinePanel/RoleSpineClickArea/Img_Frame',2},{'Img_AreaTips','SpinePanel/RoleSpinePanel/RoleSpineClickArea/Img_Frame/Img_AreaTips',2},{'LihuiPanel','SpinePanel/RoleSpinePanel/LihuiPanel',2},{'RoleSpine','SpinePanel/RoleSpinePanel/LihuiPanel/RoleSpine',2},{'FrontSpine','SpinePanel/FrontSpine',2},{'ActorSwitch','SpinePanel/ActorSwitch',2},{'Img_DragBG','SpinePanel/Img_DragBG',2},{'UI_Canvas','UI_Canvas',2},{'SkinUI','UI_Canvas/SkinUI',2},{'XiaoRenDi','UI_Canvas/SkinUI/XiaoRenDi',2},{'SkinStory','UI_Canvas/SkinUI/SkinStory',2},{'SkinChoose','UI_Canvas/SkinUI/SkinChoose',2},{'SkinChooseScroll','UI_Canvas/SkinUI/SkinChoose/SkinChooseScroll',2},{'SkinItem','UI_Canvas/SkinUI/SkinChoose/SkinChooseScroll/SkinItem',2},{'Left','UI_Canvas/SkinUI/SkinChoose/Left',2},{'Right','UI_Canvas/SkinUI/SkinChoose/Right',2},{'BannerPointPanel','UI_Canvas/SkinUI/SkinChoose/BannerPointPanel',2},{'CurBanner','UI_Canvas/SkinUI/SkinChoose/BannerPointPanel/CurBanner',2},{'BannerPointN','UI_Canvas/SkinUI/SkinChoose/BannerPointPanel/BannerPointN',2},{'Btn_YiZhuangBei','UI_Canvas/SkinUI/SkinChoose/Btn_YiZhuangBei',2},{'Btn_GengHuan','UI_Canvas/SkinUI/SkinChoose/Btn_GengHuan',2},{'VoiceUI','UI_Canvas/SkinUI/VoiceUI',2},{'ScrollbarVertical','UI_Canvas/SkinUI/VoiceUI/VoiceScroll/ScrollbarVertical',2},{'Handle','UI_Canvas/SkinUI/VoiceUI/VoiceScroll/ScrollbarVertical/SlidingArea/Handle',2},{'VoiceContent','UI_Canvas/SkinUI/VoiceUI/VoiceScroll/VoiceContent',2},{'VoiceItem','UI_Canvas/SkinUI/VoiceUI/VoiceScroll/VoiceItem',2},{'Btn_VoiceClose','UI_Canvas/SkinUI/VoiceUI/Btn_VoiceClose',2},{'ActionUI','UI_Canvas/SkinUI/ActionUI',2},{'ActionItem','UI_Canvas/SkinUI/ActionUI/ActionScroll/ActionItem',2},{'ActionContent','UI_Canvas/SkinUI/ActionUI/ActionScroll/ActionContent',2},{'Btn_ActionClose','UI_Canvas/SkinUI/ActionUI/Btn_ActionClose',2},{'Skin_Btn','UI_Canvas/SkinUI/Skin_Btn',2},{'Btn_Chakan','UI_Canvas/SkinUI/Skin_Btn/Btn_Chakan',2},{'Chakan','UI_Canvas/SkinUI/Skin_Btn/Btn_Chakan/Chakan',2},{'Icon','UI_Canvas/SkinUI/Skin_Btn/Btn_Chakan/Chakan/Icon',2},{'Btn_Voice','UI_Canvas/SkinUI/Skin_Btn/Btn_Voice',2},{'Chakan01','UI_Canvas/SkinUI/Skin_Btn/Btn_Voice/Chakan',2},{'Icon01','UI_Canvas/SkinUI/Skin_Btn/Btn_Voice/Chakan/Icon',2},{'Btn_Action','UI_Canvas/SkinUI/Skin_Btn/Btn_Action',2},{'Chakan02','UI_Canvas/SkinUI/Skin_Btn/Btn_Action/Chakan',2},{'Icon02','UI_Canvas/SkinUI/Skin_Btn/Btn_Action/Chakan/Icon',2},{'ASMR','UI_Canvas/SkinUI/Skin_Btn/ASMR',2},{'ASMR_Close','UI_Canvas/SkinUI/Skin_Btn/ASMR/ASMR_Close',2},{'Btn_ASMR_Close','UI_Canvas/SkinUI/Skin_Btn/ASMR/ASMR_Close/Btn_ASMR_Close',2},{'Img_ASMR','UI_Canvas/SkinUI/Skin_Btn/ASMR/ASMR_Close/Btn_ASMR_Close/Img_ASMR',2},{'Btn_CD','UI_Canvas/SkinUI/Skin_Btn/ASMR/Btn_CD',2},{'Img_CD','UI_Canvas/SkinUI/Skin_Btn/ASMR/Btn_CD/Img_CD',2},{'Btn_ASMR_Open','UI_Canvas/SkinUI/Skin_Btn/ASMR/Btn_ASMR_Open',2},{'Img_Fenggexian','UI_Canvas/SkinUI/UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UI_Canvas/SkinUI/UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UI_Canvas/SkinUI/UpperLeftPanel/Btn_ReturnBg',2},{'Btn_ReturnInfo','UI_Canvas/SkinUI/UpperLeftPanel/Btn_ReturnBg/Btn_ReturnInfo',2},{'Btn_ReturnHome','UI_Canvas/SkinUI/UpperLeftPanel/Btn_ReturnBg/Btn_ReturnHome',2},{'Img_Badge','UI_Canvas/SkinUI/Img_Badge',2},{'ASMR_Txt','UI_Canvas/ASMR_Txt',2},{'ASMR_Panel','UI_Canvas/ASMR_Txt/ASMR_Panel',2},{'ScrollView','UI_Canvas/ASMR_Txt/ASMR_Panel/Scroll View',2},{'Viewport','UI_Canvas/ASMR_Txt/ASMR_Panel/Scroll View/Viewport',2},{'ScrollbarVertical01','UI_Canvas/ASMR_Txt/ASMR_Panel/Scroll View/ScrollbarVertical',2},{'Handle01','UI_Canvas/ASMR_Txt/ASMR_Panel/Scroll View/ScrollbarVertical/SlidingArea/Handle',2},{'Btn_AsmrClose','UI_Canvas/ASMR_Txt/Btn_AsmrClose',2},{'SpineUI','UI_Canvas/SpineUI',2},{'Btn_Hide','UI_Canvas/SpineUI/Btn_Hide',2},{'Img_Hide','UI_Canvas/SpineUI/Btn_Hide/Img_Hide',2},{'ScalePanel','UI_Canvas/SpineUI/ScalePanel',2},{'Btn_Shuping','UI_Canvas/SpineUI/ScalePanel/Btn_Shuping',2},{'Image','UI_Canvas/SpineUI/ScalePanel/Slider_Scale/Image',2},{'Fill','UI_Canvas/SpineUI/ScalePanel/Slider_Scale/Fill Area/Fill',2},{'Background','UI_Canvas/SpineUI/ScalePanel/Slider_Scale/Background',2},{'Handle02','UI_Canvas/SpineUI/ScalePanel/Slider_Scale/Handle Slide Area/Handle',2},{'Btn_Reset','UI_Canvas/SpineUI/ScalePanel/Btn_Reset',2},{'Img_Scale1','UI_Canvas/SpineUI/ScalePanel/Img_Scale1',2},{'Img_Scale2','UI_Canvas/SpineUI/ScalePanel/Img_Scale2',2},{'Img_Scale3','UI_Canvas/SpineUI/ScalePanel/Img_Scale3',2},{'Btn_ChakanHighLight','UI_Canvas/SpineUI/Btn_ChakanHighLight',2},{'ChakanHighLight','UI_Canvas/SpineUI/Btn_ChakanHighLight/ChakanHighLight',2},{'Icon03','UI_Canvas/SpineUI/Btn_ChakanHighLight/ChakanHighLight/Icon',2},{'Btn_Mask','Btn_Mask',2},
        -- Button 列表
        {'Btn_Chakan01','UI_Canvas/SkinUI/Skin_Btn/Btn_Chakan',4},{'Btn_Voice01','UI_Canvas/SkinUI/Skin_Btn/Btn_Voice',4},{'Btn_Action01','UI_Canvas/SkinUI/Skin_Btn/Btn_Action',4},{'Btn_Hide01','UI_Canvas/SpineUI/Btn_Hide',4},{'Btn_Reset01','UI_Canvas/SpineUI/ScalePanel/Btn_Reset',4},{'Btn_ChakanHighLight01','UI_Canvas/SpineUI/Btn_ChakanHighLight',4},
        -- Slider 列表
        {'Slider_Scale','UI_Canvas/SpineUI/ScalePanel/Slider_Scale',5},
        -- UITemplate 列表
        {'SkinItem01','UI_Canvas/SkinUI/SkinChoose/SkinChooseScroll/SkinItem',10},{'VoiceItem01','UI_Canvas/SkinUI/VoiceUI/VoiceScroll/VoiceItem',10},{'ActionItem01','UI_Canvas/SkinUI/ActionUI/ActionScroll/ActionItem',10},
        -- RawImage 列表
        {'VoiceScroll','UI_Canvas/SkinUI/VoiceUI/VoiceScroll',15},{'ActionScroll','UI_Canvas/SkinUI/ActionUI/ActionScroll',15},
        -- LoopScrollRect 列表
        {'SkinChooseScroll01','UI_Canvas/SkinUI/SkinChoose/SkinChooseScroll',18},{'VoiceScroll01','UI_Canvas/SkinUI/VoiceUI/VoiceScroll',18},{'ActionScroll01','UI_Canvas/SkinUI/ActionUI/ActionScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_AreaTips','SpinePanel/RoleSpinePanel/RoleSpineClickArea/Img_Frame/Img_AreaTips/Text_AreaTips',20},{'Text_SkinStory','UI_Canvas/SkinUI/SkinStory/Text_SkinStory',20},{'Text_PiFuMingZi','UI_Canvas/SkinUI/SkinChoose/Text_PiFuMingZi',20},{'Text_YiZHuangBei','UI_Canvas/SkinUI/SkinChoose/Btn_YiZhuangBei/Text_YiZHuangBei',20},{'Text_GengHuan','UI_Canvas/SkinUI/SkinChoose/Btn_GengHuan/Text_GengHuan',20},{'CNText','UI_Canvas/SkinUI/Skin_Btn/Btn_Chakan/Chakan/CNText',20},{'CNText01','UI_Canvas/SkinUI/Skin_Btn/Btn_Voice/Chakan/CNText',20},{'CNText02','UI_Canvas/SkinUI/Skin_Btn/Btn_Action/Chakan/CNText',20},{'CDName','UI_Canvas/SkinUI/Skin_Btn/ASMR/Btn_CD/CDName',20},{'Text_RoleSkin_CN','UI_Canvas/SkinUI/UpperLeftPanel/Text_RoleSkin/Text_RoleSkin_CN',20},{'Text_RoleSkin_EN','UI_Canvas/SkinUI/UpperLeftPanel/Text_RoleSkin/Text_RoleSkin_EN',20},{'ASMR_Title','UI_Canvas/ASMR_Txt/ASMR_Panel/ASMR_Title',20},{'MailContentTxt','UI_Canvas/ASMR_Txt/ASMR_Panel/Scroll View/Viewport/MailContentTxt',20},{'Text_tishi','UI_Canvas/SpineUI/ScalePanel/Text_tishi',20},{'Text_Shuping','UI_Canvas/SpineUI/ScalePanel/Btn_Shuping/Text_Shuping',20},{'Text_Zhanshi','UI_Canvas/SpineUI/ScalePanel/Btn_Shuping/Text_Zhanshi',20},{'Text_tuichusuofang','UI_Canvas/SpineUI/ScalePanel/Btn_Reset/Text_tuichusuofang',20},{'Text_Scale1','UI_Canvas/SpineUI/ScalePanel/Img_Scale1/Text_Scale1',20},{'Text_Scale2','UI_Canvas/SpineUI/ScalePanel/Img_Scale2/Text_Scale2',20},{'Text_Scale3','UI_Canvas/SpineUI/ScalePanel/Img_Scale3/Text_Scale3',20},{'CNText03','UI_Canvas/SpineUI/Btn_ChakanHighLight/ChakanHighLight/CNText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --皮肤
    self.SkinChooseScroll01():SetLuaCellEvent(Handle(self, self.RoleSkinCell))
    self.SkinChooseScroll01():SetChooseEvent(Handle(self, self.RoleSkinUpdate))
    self.SkinChooseScroll01():SetUnchooseEvent(Handle(self, self.RoleSkinUnchooseUpdate))
    self.SkinChooseScroll01().emptyCount = 2
    --语音
    self.VoiceScroll01():SetLuaCellEvent(Handle(self,self.VoiceCell))
    --动作
    self.ActionScroll01():SetLuaCellEvent(Handle(self,self.ActionCell))
    self.ActionScroll01():SetChooseEvent(Handle(self,self.ActionUpdate))
    self.ActionScroll01():SetUnchooseEvent(Handle(self,self.ActionUnchooseUpdate))
    
    self.SpineObj = nil
    self.BGSpine = nil
    self.FrontSpineObj = nil
    self.CurActorList = nil
    ---@type RoleData 当前角色数据
    self.roleData = nil
    ---当前选中皮肤
    self.currentChooseSkinData = nil
    ---当前角色音频列表
    self.CurVoiceList = {}
    ---当前角色动画列表
    self.CurActionList = {}
    ---当前播放物体
    self.CurPlayAudioItem =
    {
        id = nil,
        ChangeFunc = nil,
        StopFunc = nil,
        path = nil
    }
    --- 0无状态，1播放，2暂停，3停止
    self.VoiceState = 0
    ---点击区域
    self.ClickArea = {}
    ---是否竖屏
    self.IsPortrait = true
    --文字 竖屏
    self.Text_Shuping().text = MgrLanguageData.GetLanguageByKey("ui_qita_text178")
    ---改变滑条
    self.SliderChange = true
    self.MaxScale = 1
    self.MinScale = 1
    --拖拽边框最大最小值
    self.MinDragFrame = nil
    self.MaxDragFrame = nil
    --拖拽边框缩放比
    self.Scale_Avg = Vector2(1,1)
    --是否能够旋转
    self.IsCanRotate = false
    ---拖拽
    self.ItemDrag = self.Img_DragBG().gameObject:GetComponent("ItemDrag")
    ---ASMR按钮列表
    self.BtnCD_Panel = {}
    ---当前界面状态
    self.CurUIState = nil
    ---跳转
    self.LinkStr = nil
    --WZQ 新增跳转相关 跳转id 跳转类型
    self.LinkId = 0
    self.LinkType = 0
    
    ---当前动作状态ID
    self.CurActionStateId = 1
    
    self.ClickAreaCanvas = self.RoleSpineClickArea().transform:Find("Img_Frame"):GetComponent("CanvasGroup")
    self.ClickAreaCanvasList = {}
    self.CurPlayAction = nil
    
    self.SkinItem().gameObject:SetActive(false)
    self.VoiceUI().gameObject:SetActive(false)
    self.ASMR().gameObject:SetActive(false)
    self.Img_DragBG().gameObject:SetActive(false)
    self.Btn_Mask().gameObject:SetActive(false)
    self.ASMR_Txt().gameObject:SetActive(false)
    self.Img_Badge().gameObject:SetActive(false)
    self.ActionUI().gameObject:SetActive(false)
    self.SkinChoose().gameObject:SetActive(not ArtAtlasControl.GetSkinUI())
    self.Btn_Action().gameObject:SetActive(ArtAtlasControl.GetSkinUI())
    Tools.ClearAllChild(self.XiaoRenDi().gameObject)
    
    Event.Add("ActionState",Handle(self,self.RefreshActionItem))
    Event.Add("ActionPlay",Handle(self,self.ActionPlay))
    
    self:InitBtn()
end
--皮肤
function M:RoleSkinCell(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.currentRoleAllSkinData[idx],self,idx})
end
function M:RoleSkinUpdate(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({true,trans})
end
function M:RoleSkinUnchooseUpdate(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({false,trans})
end

--语音回调
function M:VoiceCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurVoiceList[idx],self})
end
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---左右按钮
    UIEvent.LuaClick(self.Left().gameObject,function()
        if self.tempIdx > 3 then
            self.tempIdx = self.tempIdx - 1
            self.idx = self.tempIdx
            self:ChooseSkin(self.idx)
        end
    end)
    UIEvent.LuaClick(self.Right().gameObject,function()
        if self.tempIdx < #self.currentRoleAllSkinData - 2 then
            self.tempIdx = self.tempIdx + 1
            self.idx = self.tempIdx
            self:ChooseSkin(self.idx)
        end
    end)
    ---更换按钮
    UIEvent.LuaClick(self.Btn_GengHuan().gameObject,function()
        --通过皮肤ID和类型获取 皮肤数据
        local item = ItemControl.GetItemByIdAndType(self.currentChooseSkinData.unlock.goodsID,self.currentChooseSkinData.unlock.goodsType)
        --拿到皮肤数据，且未拥有此皮肤，按self.LinkStr跳转
        if item ~= nil and item.count <= 0 then
            --MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            if self.LinkStr then
                MgrLink.LinkStart(self.LinkStr)
            end

            return
        end
        --正常更换皮肤
        HeroControl.ChangeHeroSkin(self.currentChooseSkinData,Handle(self,function()
            MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey("ui_age_text87"), 1 }, true)
            RoleCardViewModel.CurClothes = PosterGirlViewModel.ClothesType.dress
            self.currentRoleSkinData = self.currentChooseSkinData
            self.SkinChooseScroll01():RefreshCells()
            self.Btn_GengHuan().gameObject:SetActive(false)
            self.Btn_YiZhuangBei().gameObject:SetActive(true)
        end))
    end)
    ---返回
    UIEvent.LuaClick(self.Btn_ReturnInfo().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.Btn_ReturnHome().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
        Tools.ClearAllChild(self.XiaoRenDi().gameObject)
    end)
    --角色语言
    UIEvent.LuaClick(self.Btn_Voice().gameObject,function()
        if self.VoiceUI().gameObject.activeSelf then
            return
        end
        self.CurUIState = "spineActor"
        self.VoiceUI().gameObject:SetActive(true)
        self.ActionUI().gameObject:SetActive(false)
        self.ASMR_Txt().gameObject:SetActive(false)
        self.SkinChoose().gameObject:SetActive(false)
        self.SkinStory().gameObject:SetActive(true)
        self.XiaoRenDi().gameObject:SetActive(true)
        --隐藏上一个播放的动作范围
        self:HideAction()
        --刷新角色信息
        self:ReRoleInfo()
    end)
    --关闭语音界面
    UIEvent.LuaClick(self.Btn_VoiceClose().gameObject,function()
        --暂停语音
        MgrSound.Stop(3)
        self.VoiceUI().gameObject:SetActive(false)
        if not ArtAtlasControl.GetSkinUI() then
            self.SkinChoose().gameObject:SetActive(true)
        end
    end)
    ---ASMR
    UIEvent.LuaClick(self.Btn_ASMR_Open().gameObject,function()
        self.ASMR_Close().gameObject:SetActive(true)
        self.Btn_ASMR_Open().gameObject:SetActive(false)
    end)
    UIEvent.LuaClick(self.ASMR_Close().gameObject,function()
        self.ASMR_Close().gameObject:SetActive(false)
        self.Btn_ASMR_Open().gameObject:SetActive(true)
    end)
    --关闭ASMR界面
    UIEvent.LuaClick(self.Btn_AsmrClose().gameObject,function()
        self.ASMR_Txt().gameObject:SetActive(false)
        self.Btn_Mask().gameObject:SetActive(true)
    end)
    --皮肤动画切换(简易)
    UIEvent.LuaClick(self.ActorSwitch().gameObject,function()
        if self.SpineObj and self.CurActorList then
            --动画展示
            SkinControl.ShowAnimate(self.SpineObj, self.BGSpine, self.FrontSpineObj)
        end
    end)
    --点击区域spine互动
    UIEvent.LuaClick(self.RoleSpineClickArea().gameObject, Handle(self, self.GetCurFavorWords))
    ---横竖屏切换
    UIEvent.LuaClick(self.Btn_Shuping().gameObject,function()
        self:PortraitSwitch()
    end)
    ---重置比例
    UIEvent.LuaClick(self.Btn_Reset().gameObject,function()
        self:TouchExit(false)
    end)
    ---缩放滑条
    Tools.OnSliderValueChange(self.Slider_Scale(),function(float)
        if not self.SliderChange then
            return
        end
        if float < self.MinScale then
            float = self.MinScale
        elseif float > self.MaxScale then
            float = self.MaxScale
        end
        local _Scale = Vector3(float,float,float)

        self:SetScale(_Scale)
    end)
    --隐藏
    UIEvent.LuaClick(self.Btn_Hide().gameObject, Handle(self, function()
        self.Btn_Hide().gameObject:SetActive(false)
        self.Btn_ChakanHighLight().gameObject:SetActive(false)
        self.ScalePanel().gameObject:SetActive(false)
        self.Btn_Mask().gameObject:SetActive(true)
    end))
    --显示
    UIEvent.LuaClick(self.Btn_Mask().gameObject, Handle(self, function()
        if self.CurUIState == "spineActor" then
            self.Btn_Hide().gameObject:SetActive(true)
            if self.IsPortrait then
                self.Btn_ChakanHighLight().gameObject:SetActive(true)
            end
            self.ScalePanel().gameObject:SetActive(true)
            self.Btn_Mask().gameObject:SetActive(false)
        elseif self.CurUIState == "spineAsmr" then
            if self.ASMR_Txt().gameObject.activeSelf then
                MgrUI.Pop(UID.ConfirmPop_UI, { MgrLanguageData.GetLanguageByKey("ui_tongyong_text36"),function()
                    --跳过动画
                    SkinControl.JumpAnime()
                    self:OpenAsmrUI(false)
                end,nil,2 }, true)
            else
                self.ASMR_Txt().gameObject:SetActive(true)
            end
        end
    end))
    --查看立绘
    UIEvent.LuaClick(self.Btn_Chakan().gameObject, function()
        self.CurUIState = "spineActor"
        self.SkinUI().gameObject:SetActive(false)
        self.Btn_Mask().gameObject:SetActive(false)
        self.SpineUI().gameObject:SetActive(true)
        --隐藏上一个播放的动作范围
        self:HideAction()
        self:TouchUpdate()
    end)
    UIEvent.LuaClick(self.Btn_ChakanHighLight().gameObject, function()
        self.SkinUI().gameObject:SetActive(true)
        self.SpineUI().gameObject:SetActive(false)
        self.Img_DragBG().gameObject:SetActive(false)
        self:TouchExit(true)
    end)
    --角色动作
    UIEvent.LuaClick(self.Btn_Action().gameObject, function()
        if self.ActionUI().gameObject.activeSelf then
            return
        end
        self.CurUIState = nil
        self.ActionUI().gameObject:SetActive(true)
        self.Btn_Mask().gameObject:SetActive(true)
        self.VoiceUI().gameObject:SetActive(false)
        self.ASMR_Txt().gameObject:SetActive(false)
        self.SkinChoose().gameObject:SetActive(false)
        self.SkinStory().gameObject:SetActive(false)
        self.XiaoRenDi().gameObject:SetActive(false)
        self.Btn_Mask().gameObject:SetActive(false)
        --加载角色动作列表
        self:ReloadAction()
    end)
    UIEvent.LuaClick(self.Btn_ActionClose().gameObject, function()
        self.ActionUI().gameObject:SetActive(false)
        self.Btn_Mask().gameObject:SetActive(false)
        self.SkinStory().gameObject:SetActive(true)
        self.XiaoRenDi().gameObject:SetActive(true)
    end)
end

function M:OnUpdateUI()
    ---设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 6
    self.RoleSpineClickArea().transform:Find("Img_Frame"):GetComponent("Canvas").sortingOrder = self.CavOrder + 5
    
    self.roleData = RoleCardViewModel.CurrentHero
    --当前角色的皮肤数据
    ---@type RoleSkinData
    self.currentRoleSkinData = HeroControl.GetSkinDataBySkinId(self.roleData.skin)
    ---当前选中皮肤
    if self.currentChooseSkinData == nil then
        if HeroControl.GetCurArtSkinData() then
            self.currentChooseSkinData = HeroControl.GetCurArtSkinData()
        else
            self.currentChooseSkinData = self.currentRoleSkinData
        end
    end
    ---获取当前角色所有皮肤
    ---@type RoleSkinData[]
    self.currentRoleAllSkinData = HeroControl.GetAllSkinByRoleID(self.roleData.id)
    local tempList = {}
    tempList[#tempList + 1] = {}
    tempList[#tempList + 1] = {}
    for i, v in ipairs(self.currentRoleAllSkinData) do
        --if HeroControl.CheckSkinUnlocked(v.id) then
            table.insert(tempList,v)
        --end
    end
    tempList[#tempList + 1] = {}
    tempList[#tempList + 1] = {}
    self.currentRoleAllSkinData = tempList
    ---皮肤下方小点
    self.points = {}
    for i = 1, #self.currentRoleAllSkinData - 5, 1 do
        local p = GameObject.Instantiate(self.BannerPointN().gameObject,self.BannerPointPanel().transform)
        table.insert(self.points,p)
    end
    self.BannerPointN().gameObject:SetActive(false)
    ---背景更换
    self:ShowSkin(self.currentChooseSkinData)
    ---当前皮肤为已装备
    --self:SkinChangeBtn(true, self.currentChooseSkinData)
    ---wzq 新皮肤按钮设置
    self:NewSkinChangeBtn(true, self.currentChooseSkinData)
    ---故事
    self.Text_SkinStory().text = self.currentChooseSkinData.story
    ---皮肤名字
    self.Text_PiFuMingZi().text = self.currentChooseSkinData.skinName
    --如果不是从图鉴进入，走此逻辑
    if not ArtAtlasControl.GetSkinUI() then
        ---刷新所有皮肤
        self:FreshAllSkins()

        ---计时器改变显示层级
        MgrTimer.AddRepeat("cengji",0.2,function()
            self:FreshSkinItem()
        end,-1,nil)
    end
end
---@param _skinData RoleSkinData 创建立绘
function M:CreatSpine(_Root, _skinData)
    local _PosInfoTab = CharactercoordinatesLocalData.tab[_skinData.id].coordinate1
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatch3DSpineInUI(_Root, _skinData.id, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        self.SpinePath = MgrRes.GetWatch3DSpinePath(_skinData.id)
        self.SpineObj = obj
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder+2,"Default")
        end
    end)
end
---刷新皮肤列表
function M:FreshAllSkins()
    self.idx = 0
    for i,v in ipairs(self.currentRoleAllSkinData) do
        if v.id == self.currentChooseSkinData.id then
            self.idx = i
        end
    end
    self.SkinChooseScroll01().totalCount = #self.currentRoleAllSkinData
    ---移动到当前皮肤
    self.tempIdx = self.idx
    self.SkinChooseScroll01():RefillCells()
    self.SkinChooseScroll01():ScrollToCell(self.idx - 2,1000,self.idx)
    self.CurBanner().transform:SetSiblingIndex((self.idx - 2))
    ---改变下一个未选中的皮肤的显示层级
    self:FreshSkinItem()
end

function M:ChooseSkin(index)
    self.idx = index
    self.SkinChooseScroll01():ScrollToCell(self.idx - 2,1000,self.idx)
    self.CurBanner().transform:SetSiblingIndex((self.idx - 2))
end
function M:FreshSkinItem()
    ---改变一下每个未选中的皮肤的显示层级
    local a,b = tonumber(self.SkinChooseScroll01().transform:Find("Content").transform:GetChild(0).transform.name),tonumber(self.SkinChooseScroll01().transform:Find("Content").transform:GetChild(self.SkinChooseScroll01().transform:Find("Content").transform.childCount-1).transform.name)
    for i = a, b do
        if i ~= self.idx and i ~= self.idx + 1 and i ~= self.idx - 1 then
            self.SkinChooseScroll01().transform:Find("Content/"..i.."/Unchoose/Unchoose_Back").transform:GetComponent("Canvas").enabled = false
            self.SkinChooseScroll01().transform:Find("Content/"..i.."/Unchoose/UnchooseSkin").transform:GetComponent("Canvas").enabled = false
            self.SkinChooseScroll01().transform:Find("Content/"..i).transform:GetComponent("Image").raycastTarget = false
        else
            self.SkinChooseScroll01().transform:Find("Content/"..i.."/Unchoose/Unchoose_Back").transform:GetComponent("Canvas").enabled = true
            self.SkinChooseScroll01().transform:Find("Content/"..i.."/Unchoose/UnchooseSkin").transform:GetComponent("Canvas").enabled = true
            self.SkinChooseScroll01().transform:Find("Content/"..i).transform:GetComponent("Image").raycastTarget = true
        end
    end
end

---@param skinData RoleSkinData 皮肤更换按钮开关
function M:SkinChangeBtn(using,skinData)
    if using then
        --当前穿戴
        self.Btn_YiZhuangBei().gameObject:SetActive(true)
        self.Btn_GengHuan().gameObject:SetActive(false)
        --装备中
        self.Text_YiZHuangBei().text = MgrLanguageData.GetLanguageByKey("ui_skin_ui_text1")
        --已有皮肤,显示按钮
        if skinData then
            self.Skin_Btn().gameObject:SetActive(skinData.unlockState)
        else
            self.Skin_Btn().gameObject:SetActive(false)
        end
    else
        --当前未穿戴 有skinData数据
        if skinData then
            if skinData.unlockState then
                --当前已拥有
                self.Btn_YiZhuangBei().gameObject:SetActive(false)
                self.Btn_GengHuan().gameObject:SetActive(true)
                --装备
                self.Text_GengHuan().text = MgrLanguageData.GetLanguageByKey("ui_skin_ui_text2")
            else
                local isHave = false
                --当前未拥有
                --检查皮肤商城是否正在销售
                ---@type ShopItemData
                local tShopSkin = ShopControl.GetShopSkinData()
                for i, v in ipairs(tShopSkin) do
                    if v.id == skinData.id then
                        isHave = true
                        self.LinkStr = "tz_sc_zbsd_01"
                        break
                    end
                end
                --检查皮肤是否配置跳转
                --商城无此皮肤且配置跳转 isHave = true
                if not isHave and skinData.link then
                    isHave = true
                    self.LinkStr = skinData.link
                end
                
                if isHave then
                    self.Btn_YiZhuangBei().gameObject:SetActive(false)
                    self.Btn_GengHuan().gameObject:SetActive(true)
                    --前往获取
                    self.Text_GengHuan().text = MgrLanguageData.GetLanguageByKey("ui_skin_ui_text3")
                else
                    self.Btn_YiZhuangBei().gameObject:SetActive(true)
                    self.Btn_GengHuan().gameObject:SetActive(false)
                    --暂时无法获得
                    self.Text_YiZHuangBei().text = MgrLanguageData.GetLanguageByKey("ui_skin_ui_text4")
                end
                
                self.Skin_Btn().gameObject:SetActive(skinData.unlockState)
            end
        else--当前未穿戴 无skinData数据
            self.Btn_YiZhuangBei().gameObject:SetActive(true)
            self.Btn_GengHuan().gameObject:SetActive(false)
            --暂时无法获得
            self.Text_GengHuan().text = MgrLanguageData.GetLanguageByKey("ui_skin_ui_text4")
            self.Skin_Btn().gameObject:SetActive(false)
        end
    end
end

function M:NewSkinChangeBtn(using,skinData)
    if using then
        --当前穿戴
        self.Btn_YiZhuangBei().gameObject:SetActive(true)
        self.Btn_GengHuan().gameObject:SetActive(false)
        --装备中
        self.Text_YiZHuangBei().text = MgrLanguageData.GetLanguageByKey("ui_skin_ui_text1")
        --已有皮肤,显示按钮
        if skinData then
            self.Skin_Btn().gameObject:SetActive(skinData.unlockState)
        else
            self.Skin_Btn().gameObject:SetActive(false)
        end
    else
        --当前未穿戴 有skinData数据
        if skinData then
            --当前已拥有
            if skinData.unlockState then
                self.Btn_YiZhuangBei().gameObject:SetActive(false)
                self.Btn_GengHuan().gameObject:SetActive(true)
                --装备
                self.Text_GengHuan().text = MgrLanguageData.GetLanguageByKey("ui_skin_ui_text2")
            else--未拥有
                local _linkMark = string.split(skinData.link, ',')
                if _linkMark == nil or #_linkMark < 3 then
                    return
                end
                local linkType = tonumber(_linkMark[1])
                local linkId = tonumber(_linkMark[2])
                self.LinkId = linkId
                self.LinkType = linkType
                if linkType == 1 then --1类型固定跳转
                    self.LinkStr = _linkMark[3]
                    self:SetBtnText(false,true,"",MgrLanguageData.GetLanguageByKey("ui_skin_ui_text3"))
                elseif linkType == 2 then --活动
                    local isMiddle = false
                    for k, v in pairs(ActivityLocalData.tab) do
                        if tonumber(v[1]) == linkId then
                            local startTime = TimeControl.GetTimeTable(tonumber(v[5])).openTime
                            local endTime =TimeControl.GetTimeTable(tonumber(v[5])).endTime
                            isMiddle =  Global.isMiddleTime(startTime, endTime)
                            break
                        end
                    end
                    if isMiddle then --在活动期间
                        self.LinkStr = _linkMark[3]
                        self:SetBtnText(false,true,"",MgrLanguageData.GetLanguageByKey("ui_skin_ui_text3"))
                    else
                        self:SetBtnText(true,false,MgrLanguageData.GetLanguageByKey("ui_tongyong_text280"),"")
                    end
                elseif linkType == 3 then --商城普通皮肤
                    local isHave = self:GetShopSkin(skinData.id)
                    self:SetBtnText(false,true,"",MgrLanguageData.GetLanguageByKey("ui_skin_ui_text3"))
                    if isHave then
                        self.LinkStr = _linkMark[3]
                    else
                        self.LinkStr = "tz_hd_txz"--通行证
                    end
                elseif linkType == 4 then --商城限定皮肤
                    local isHave = self:GetShopSkin(skinData.id) 
                    if isHave then
                        self.LinkStr = _linkMark[3]
                        self:SetBtnText(false,true,"",MgrLanguageData.GetLanguageByKey("ui_skin_ui_text3"))
                    else
                        self:SetBtnText(true,false,MgrLanguageData.GetLanguageByKey("ui_tongyong_text280"),"")
                        --按钮置灰，显示多语言文本-活动期间获取
                    end
                elseif linkType == 5 then --签到皮肤
                    local isSame = self:IsSameSignSkin(skinData.id)
                    self:SetBtnText(false,true,"",MgrLanguageData.GetLanguageByKey("ui_skin_ui_text3"))
                    if isSame then
                        self.LinkStr = _linkMark[3]
                    else
                        self.LinkStr = "tz_hd_txz"--通行证
                    end
                end
            end
        else--当前未穿戴 无skinData数据
            self:SetBtnText(true,false,"",MgrLanguageData.GetLanguageByKey("ui_skin_ui_text4"))
            self.Skin_Btn().gameObject:SetActive(false)
        end        
    end
end

--设置 Btn_YiZhuangBei/Btn_GengHuan/Text_YiZHuangBei/Text_GengHuan 状态和文本
function M:SetBtnText(isShowEquip,isShowChange,equipStr,changeStr)
    self.Btn_YiZhuangBei().gameObject:SetActive(isShowEquip)
    self.Btn_GengHuan().gameObject:SetActive(isShowChange)
    --装备中
    if equipStr ~= nil and equipStr ~= "" then
        self.Text_YiZHuangBei().text = equipStr
    end
    if changeStr ~= nil and changeStr ~= "" then
        self.Text_GengHuan().text = changeStr
    end
end

---计算此皮肤当前是否在商店出售
function M:GetShopSkin(skinId)
    local tShopSkin = ShopControl.GetShopSkinData()
    if tShopSkin == nil then
        return false
    end
    for i, v in pairs(tShopSkin) do
        if tonumber(v.id) == skinId then
            return true
        end
    end
    return false
end

---当前月签到皮肤是否和此skinId相同
function M:IsSameSignSkin(skinId)
    --获取月份
    local monthNum = tonumber(os.date("%m",MgrNet.GetServerTime() - 18000 + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
    UnityEngine.Debug.LogError(monthNum)
    local rewardArr
    local underLineStr = "_"

     for k,v in pairs(SigninLocalData.tab) do
         if v ~= nil and monthNum == tonumber(v.type) then --对应月份数据
            rewardArr = string.split(v.reward,underLineStr)
            if #rewardArr >= 2 and tonumber(rewardArr[2]) == skinId then --查找本月签到皮肤是否和skinId相同
                return true
            end
        end
    end
    return false
end

---@param skinData RoleSkinData 皮肤显示
function M:ShowSkin(skinData)
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        self.SpineObj = nil
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    if self.BGSpine ~= nil then
        GameObject.Destroy(self.BGSpine)
        self.BGSpine = nil
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.FrontSpineObj ~= nil then
        GameObject.Destroy(self.FrontSpineObj)
        self.FrontSpineObj = nil
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    self.IsCanRotate = skinData.isRotate
    ---检测能否竖屏
    self:CheckShuPing()
    --检测ASMR
    self:CheckAsmr(skinData)
    --检测是否拥有个人剧情徽章
    self:CheckBadge(skinData)
    ---小人更换
    -- Tools.ClearAllChild(self.XiaoRenDi().gameObject)
    if self.spine ~= nil then
        GameObject.Destroy(self.spine)
        self.spine = nil
        if self.fightSpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.fightSpinePath)
            self.fightSpinePath = nil
        end
    end
    MgrRes.LoadFightSpine(self.XiaoRenDi().gameObject,skinData.id,14.3,-101,25,"dj",function(obj)
        self.fightSpinePath = MgrRes.GetFightSpinePath(skinData.id)
        self.spine = obj
        local str = obj.transform:GetComponent("MeshRenderer").material.name
        local name = string.gsub(str,"_Material %(Instance%)","_a")
        --local str1 = string.split(str,"_")
        MgrRes.SetRoleMaterial(obj, tostring(skinData.id), name, "_MainTex")
        obj.transform.gameObject.layer = 5
    end)
    ---故事
    self.Text_SkinStory().text = skinData.story
    ---皮肤名字
    self.Text_PiFuMingZi().text = skinData.skinName
    
    -- Tools.ClearAllChild(self.BgSpine().gameObject)
    if skinData.backgroundpic ~= "0" then
        self.NomalBg().gameObject:SetActive(false)
    else
        self.NomalBg().gameObject:SetActive(true)
    end
    if next(self.ClickArea) ~= nil then
        for i,v in pairs(self.ClickArea) do
            GameObject.Destroy(v)
        end
        self.ClickArea = {}
    end
    --暂停语音
    MgrSound.Stop(3)
    if not skinData.unlockState then
        --简易动画(未解锁时使用)
        --if self.CurActorList~=nil then
        --    --暂停语音
        --    MgrSound.Stop(3)
        --end
        self.CurActorList = skinData.shopAni

        self.ActorSwitch().gameObject:SetActive(true)
        self.RoleSpineClickArea().gameObject:SetActive(false)
        --设置简易动画数据
        SkinControl.SetSkinData(self.CurActorList,1)
    else
        --完整动画(解锁后使用)
        if skinData.HaveClickArea then
            self.RoleSpineClickArea().gameObject:SetActive(false)
            for i,v in pairs(skinData.ClickArea) do
                local tempGo = GameObject.Instantiate(self.RoleSpineClickArea().gameObject,self.RoleSpine().transform,false)
                tempGo:SetActive(true)
                tempGo:GetComponent("RectTransform").anchoredPosition = Vector2(tonumber(v.x),tonumber(v.y))
                tempGo:GetComponent("RectTransform").sizeDelta = Vector2(tonumber(v.width),tonumber(v.height))
                self.ClickAreaCanvasList[i] = tempGo.transform:Find("Img_Frame"):GetComponent("CanvasGroup")
                UIEvent.LuaClick(tempGo,function() self:GetCurFavorWords(i) end)
                self.ClickArea[i] = tempGo
                self.ClickAreaCanvasList[i].alpha = 0
            end
        else
            self.ClickAreaCanvas.alpha = 0
            self.RoleSpineClickArea().gameObject:SetActive(true)
        end
        self.ActorSwitch().gameObject:SetActive(false)
        --判断是否启用多状态切换
        if skinData.newSwitch then
            SkinControl.InitSpineState(true,false,SkinControl.UIType.home,skinData.id)
            --背景
            SkinControl.CreateRoleSpine(self.Img_BG().gameObject,PosterGirlViewModel.spineType.bottom)
            --前景
            SkinControl.CreateRoleSpine(self.FrontSpine().gameObject,PosterGirlViewModel.spineType.front)
            ---创建皮肤
            SkinControl.CreateRoleSpine(self.RoleSpine().gameObject,PosterGirlViewModel.spineType.role)
            
            return
        end
    end
    --清理旧spine
    SkinControl.ClearSpine()
    ---背景更换
    if string.find(skinData.backgroundpic,'Watch_3D_bg') then
        local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate8,";")
        local x = tonumber(string.split(coordinate[1],",")[1])
        local y = tonumber(string.split(coordinate[1],",")[2])
        local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
        MgrRes.LoadCgSpine(self.Img_BG(), skinData.id,skinData.backgroundpic,x,y,scale,nil,function(BG)
            self.BGPath = MgrRes.GetLocalizedPath(skinData.backgroundpic)
            self.BGSpine = BG
            BG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder+1,"Default")
        end,true)
    end
    ---前景更换
    -- Tools.ClearAllChild(self.FrontSpine().gameObject)
    if string.find(skinData.foregroundpic,'Watch_3D_front') then
        local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate9,";")
        local x = tonumber(string.split(coordinate[1],",")[1])
        local y = tonumber(string.split(coordinate[1],",")[2])
        local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
        MgrRes.LoadSkinFrontBG(skinData.type,self.FrontSpine(),skinData.foregroundpic,self.FrontSpine().gameObject,x,y,scale,nil,function(frontBG)
            self.FrontPath = MgrRes.GetLocalizedPath(skinData.foregroundpic)
            self.FrontSpineObj = frontBG
            frontBG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder+3,"Default")
        end)
    end

    ---roleSpine更换
    -- Tools.ClearAllChild(self.RoleSpine().gameObject)
    self:CreatSpine(self.RoleSpine().gameObject, skinData)
    
    MgrRes.UnLoadUnusedAssets(false)
end

---刷新角色信息
function M:ReRoleInfo()
    if self.currentChooseSkinData == nil then
        self.currentChooseSkinData = self.currentRoleSkinData                           ---当前选中皮肤
    end
    
    ---刷新滑块
    self:ReloadVoiceData(0)
end
---设置语音滑动数据
function M:ReloadVoiceData(offset)
    self.VoiceScroll().gameObject:SetActive(true)
    self.CurVoiceList = TeamAtlasControl.GetVoiceData(self.roleData,self.currentChooseSkinData)
    ---设置Loop数量
    self.VoiceScroll01().totalCount = #self.CurVoiceList
    if offset then
        self.VoiceScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.VoiceScroll01():RefreshCells()              ---只刷新数据
    end
    Tools.ReContentSizeGroup(self.VoiceContent().gameObject)   --Unity强制重新布局
end
---点击音频
function M:AudioClick(id,path,func,stopFunc)
    MgrTimer.Cancel("DocRoleVoice")
    if self.CurPlayAudioItem.id then
        if self.CurPlayAudioItem.id ~= id then
            self.CurPlayAudioItem.ChangeFunc()
        end
    end
    self.CurPlayAudioItem.id = id
    self.CurPlayAudioItem.path = path
    self.CurPlayAudioItem.ChangeFunc = func
    self.CurPlayAudioItem.StopFunc = stopFunc
    self.VoiceState = 1
    MgrSound.PlayRole(path,nil,nil,false,0,0,"DocVoice")
    self:ListenVoice()
end
--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("DocRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus("DocVoice") then
            self.CurPlayAudioItem.StopFunc()
            MgrTimer.Cancel("DocRoleVoice")
        end
    end,-1,nil)
end


---根据当前好感度等级权重随机出本次的好感度交互台词ID
function M:GetCurFavorWords(idx)
    --判断是否启用多状态切换
    if self.currentChooseSkinData.newSwitch then
        SkinControl.OnClickRoleBack(idx)
        return
    end
    if CMgrSpine.Instance:CheckCurAniIsIdle(self.SpineObj, self.CurClothes == PosterGirlViewModel.ClothesType.undress) == false then
        return
    end

    local _CurRoleFavor = self.roleData.favor --默认100好感度
    local _ActorLinesType = tonumber(self.currentChooseSkinData.interaction)   --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    if idx and type(idx) == "number" then
        local _CurTotalSumWeight=0
        local _tempActorLineIdTab={}  --临时表存储对应的文本台词ID和对应权重
        for key, value in pairs(ActorLinesLocalData.tab) do
            if value[2] == _ActorLinesType and value[4] == 5 then
                local str = string.split(value[5],"_")
                if str[1] == "15" and idx == tonumber(str[2]) then  --15为点击区域触发动作和语音
                    ---算权重
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight2(_TempVarTab,_CurRoleFavor)
                    if _ReturnVar ~= false then
                        _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                        table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                    end
                elseif tonumber(str[1]) == 14 and idx == tonumber(str[2]) then
                    ---匹配到对应的角色台词组别
                    if value[2] == _ActorLinesType then
                        local _TempVarTab= str
                        local _ReturnVar = TableToObject.GetTargetWeight2(_TempVarTab,0)
                        if _ReturnVar ~= false then
                            ---当前穿着衣服
                            if  self.CurClothes == PosterGirlViewModel.ClothesType.wear then
                                ---穿着衣服时点击角色只会播放脱衣语音或穿衣触摸
                                if value[3] == 92 or value[3] == 93 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            else
                                ---脱着衣服时点击角色只会播放穿衣语音或脱衣触摸
                                if value[3] == 95 or value[3] == 96 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            end
                        end
                    end
                end
            end
        end
        local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
        self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
        ---后面要加特效

    else
        for key, value in pairs(ActorLinesLocalData.tab) do
            ---当前是默认看板娘
            if tonumber(string.split(value[5],"_")[1]) ~= 14 then
                ---匹配到对应的角色台词组别
                if value[2] == _ActorLinesType and value[4] == 5 and tonumber(string.split(value[5],"_")[1]) == 1 then
                    ---切割对应的触发条件得到条件表
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,_CurRoleFavor)
                    if _ReturnVar ~= false then
                        ---插入 台词ID 达标的权重值*1000+表中已存的权重值
                        ---按顺序插入累加的权重值，通过分段记录的权重值来判断本次随机出来的值属于哪个区间
                        ---Etc tab[1]切割出的权值为0.8  tab[2]切割出的权值为1.5 tab[3]切割出的权值为2.8
                        ---    对应tab[1]存储的权值字段为800 tab[2]为800+1500 tab[3]为800+1500+2800
                        ---    随机一个整数在(1,max) max本轮为800+1500+2800
                        ---    遍历表中判断迭代更新大于这个随机数的字段的下标
                        ---    假设本轮随机数为1300 则tab[1]符合 tab[2]符合 最中迭代更新随机数下标为tab[2]
                        ---------------------------------------------------------------------
                        if value[3] == 91 or value[3] == 94 then
                            if self.CurClothes == PosterGirlViewModel.ClothesType.wear then
                                if value[3] == 91 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            else
                                if value[3] == 94 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            end
                        else
                            _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                            table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                        end
                    end
                end
            elseif tonumber(string.split(value[5],"_")[1]) == 14 then
                ---匹配到对应的角色台词组别
                if value[2] == _ActorLinesType then
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,0)
                    if _ReturnVar ~= false then
                        ---当前穿着衣服
                        if  self.CurClothes == PosterGirlViewModel.ClothesType.wear then
                            ---穿着衣服时点击角色只会播放脱衣语音或穿衣触摸
                            if value[3] == 92 or value[3] == 93 then
                                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                            end
                        else
                            ---脱着衣服时点击角色只会播放穿衣语音或脱衣触摸
                            if value[3] == 95 or value[3] == 96 then
                                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                            end
                        end
                    end
                end
            end
        end
        local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
        self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
    end
end
---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function M:PlayTargetRoleAniVoice(_ActorLineId)
    if _ActorLineId == nil then
        return
    end
    local _AniName = ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _AudioType = ActorLinesLocalData.tab[_ActorLineId][3]
    local _BackAniName = "idle"
    if _AudioType == 93 then  --脱衣语音
        self.CurClothes = PosterGirlViewModel.ClothesType.undress
    elseif _AudioType == 96 then  --穿衣语音
        self.CurClothes = PosterGirlViewModel.ClothesType.wear
    end
    if self.CurClothes == PosterGirlViewModel.ClothesType.undress then
        _BackAniName = "idle2"  --脱衣状态
        ---如果随机到主界面随机语音修改随机语音播放的动画
        if ActorLinesLocalData.tab[_ActorLineId][4] == 4 then
            _AniName = "idle2"
        end
    else
        _BackAniName = "idle"   --穿衣状态
    end
    --随机动作，排除待机动作
    if _AniName == "idle" or _AniName == "idle2" then
        _AniName = "0"
    end
    if self.SpineObj ~= nil and _AniName ~= "0" then
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj, _AniName, false,nil,_BackAniName)
    end
    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,self.Name..self.roleData.id)
end

---横竖屏切换
function M:PortraitSwitch()
    --检测能否竖屏
    if not self:CheckShuPing() then
        return
    end
    local scale = self.ScalePanel().transform
    if self.IsPortrait then
        --竖屏
        scale.anchorMin = Vector2(1,0.5)
        scale.anchorMax = Vector2(1,0.5)
        scale.localRotation = Quaternion.Euler(0,0,90)
        scale.anchoredPosition = Vector2(-95,0)
        scale.sizeDelta = Vector2(1080,130)
        self.Btn_Hide().transform.localRotation = Quaternion.Euler(0,0,90)
        self.LihuiPanel().transform.localRotation = Quaternion.Euler(0,0,90)
        --文字 横屏
        self.Text_Shuping().text = MgrLanguageData.GetLanguageByKey("ui_qita_text177")
        --立绘坐标
        local tSkinData = CharactercoordinatesLocalData.tab[self.currentChooseSkinData.id].coordinate16
        local tPosInfo = string.split(tSkinData,';')
        if #tPosInfo > 0 then
            local tPos = string.split(tPosInfo[1],',')
            self.LihuiPanel().transform.localPosition = Vector3(tonumber(tPos[1]),tonumber(tPos[2]),0)
        end
    else
        --横屏
        scale.anchorMin = Vector2(0.5,0)
        scale.anchorMax = Vector2(0.5,0)
        scale.localRotation = Quaternion.Euler(0,0,0)
        scale.anchoredPosition = Vector2(-10,95)
        scale.sizeDelta = Vector2(1480,130)
        self.Btn_Hide().transform.localRotation = Quaternion.Euler(0,0,0)
        self.LihuiPanel().transform.localRotation = Quaternion.Euler(0,0,0)
        --文字 竖屏
        self.Text_Shuping().text = MgrLanguageData.GetLanguageByKey("ui_qita_text178")
        --立绘坐标
        self.LihuiPanel().transform.localPosition = Vector3(0,2,0)
    end
    --显隐控制
    self.Img_Shuping().gameObject:SetActive(self.IsPortrait)
    self.Img_BG().gameObject:SetActive(not self.IsPortrait)
    self.Btn_ChakanHighLight().gameObject:SetActive(not self.IsPortrait)
    --初始坐标
    self.LihuiPanelOldPos = Vector3(self.LihuiPanel().transform.localPosition.x,self.LihuiPanel().transform.localPosition.y,self.LihuiPanel().transform.localPosition.z)
    --状态切换
    self.IsPortrait = not self.IsPortrait

    self:TouchExit(false)
end
---检测能否竖屏
function M:CheckShuPing()
    self.Btn_Shuping().gameObject:SetActive(self.IsCanRotate)

    return self.IsCanRotate
end
---缩放
function M:SetScale(_Scale)
    local CurPos = self.RoleSpinePanel().transform.localPosition
    if self.roleData.id ~= self.currentChooseSkinData.id then
        CurPos = self.SpinePanel().transform.localPosition
    end
    if _Scale.x >= self.MinScale and _Scale.y >= self.MinScale and _Scale.x <= self.MaxScale and _Scale.y <= self.MaxScale then
        if not self.Img_DragBG().gameObject.activeSelf then
            self.Img_DragBG().gameObject:SetActive(true)
        end

        if self.IsCanRotate then
            self.LihuiPanel().transform.localScale = _Scale;
        else
            self.Img_BG().transform.localScale = _Scale;
            self.LihuiPanel().transform.localScale = _Scale;
            self.FrontSpine().transform.localScale = _Scale;
        end
        --设置边界
        local tCurScale_DValue = _Scale.x-self.MinScale
        local tWidth = self.MinDragFrame.x+self.Scale_Avg.x*tCurScale_DValue
        local tHigh = self.MinDragFrame.y+self.Scale_Avg.y*tCurScale_DValue

        self.Img_DragFrame().transform.sizeDelta = Vector2(tWidth, tHigh)
        --缩放边框限制
        local tFrameRect = self.Img_DragFrame().transform.rect.size
        local x = Mathf.Clamp(CurPos.x, self.Img_DragFrame().transform.localPosition.x-tFrameRect.x*0.5, self.Img_DragFrame().transform.localPosition.x+tFrameRect.x*0.5)
        local y = Mathf.Clamp(CurPos.y, self.Img_DragFrame().transform.localPosition.y-tFrameRect.y*0.5, self.Img_DragFrame().transform.localPosition.y+tFrameRect.y*0.5)
        print("缩放边框限制\nx:"..x.."\ny:"..y)
        if self.IsCanRotate then
            self.RoleSpinePanel().transform.localPosition = Vector3(x, y, self.OldPosZ)
        else
            self.SpinePanel().transform.localPosition = Vector3(x, y, self.OldPosZ)
        end
    end
end


---触摸移动放大立绘
function M:TouchUpdate()
    Input.multiTouchEnabled = true
    local _OldTouch1,_OldTouch2 --上次触摸点(手指1,2)
    -- local High=1000 --可拖动边界高
    -- local Wide=1000 --可拖动边界宽

    local tSkinData = RoleuiskinLocalData.tab[self.currentChooseSkinData.id]
    --缩放
    local scale = tSkinData.scale
    local str = string.split(scale,',')
    self.MinScale = tonumber(str[1])
    self.MaxScale = tonumber(str[2])
    --设置滑条属性
    self.SliderChange = false
    self.Slider_Scale().minValue = self.MinScale
    self.Slider_Scale().maxValue = self.MaxScale
    self.Slider_Scale().value = self.LihuiPanel().transform.localScale.x
    self.SliderChange = true
    self.Text_Scale1().text = str[1].."x"
    self.Text_Scale3().text = str[2].."x"
    --设置边界
    if tSkinData.dragrange ~= "0" then
        local tRangeList = string.split(tSkinData.dragrange,';')
        for i, v in ipairs(tRangeList) do
            local tRange = string.split(v,',')
            if #tRange > 1 then
                if i == 1 then
                    self.MinDragFrame = Vector2(tonumber(tRange[1]), tonumber(tRange[2]))
                else
                    self.MaxDragFrame = Vector2(tonumber(tRange[1]), tonumber(tRange[2]))
                end
            end
        end
        if self.MaxScale ~= self.MinScale then
            --计算均值
            local tScale_DValue = self.MaxScale - self.MinScale
            self.Scale_Avg.x = (self.MaxDragFrame.x - self.MinDragFrame.x)/tScale_DValue
            self.Scale_Avg.y = (self.MaxDragFrame.y - self.MinDragFrame.y)/tScale_DValue
            --设置边界
            local tCurScale_DValue = self.LihuiPanel().transform.localScale.x-self.MinScale
            local tWidth = self.MinDragFrame.x+self.Scale_Avg.x*tCurScale_DValue
            local tHigh = self.MinDragFrame.y+self.Scale_Avg.y*tCurScale_DValue
            self.Img_DragFrame().transform.sizeDelta = Vector2(tWidth, tHigh)
        end

    end

    self.Child_y = self.ObjRoot.transform:GetComponent("RectTransform").rect.size.y
    self.Child_x = self.ObjRoot.transform:GetComponent("RectTransform").rect.size.x
    print("UI的缩放" .. self.Child_y .. "-" .. self.Child_x)
    --记录初始立绘位置
    self.OldPosZ = self.RoleSpinePanel().transform.localPosition.z 

    self.ImgBGOldPosScale = Vector3(self.Img_BG().transform.localScale.x,self.Img_BG().transform.localScale.y,self.Img_BG().transform.localScale.z)
    self.LihuiPanelParentOldPos = Vector3(self.RoleSpinePanel().transform.localPosition.x,self.RoleSpinePanel().transform.localPosition.y,self.RoleSpinePanel().transform.localPosition.z)
    self.LihuiPanelOldScale = self.LihuiPanel().transform.localScale
    self.LihuiPanelOldPos = Vector3(self.LihuiPanel().transform.localPosition.x,self.LihuiPanel().transform.localPosition.y,self.LihuiPanel().transform.localPosition.z)
    self.FrontSpriteOldPosScale = Vector3(self.FrontSpine().transform.localScale.x,self.FrontSpine().transform.localScale.y,self.FrontSpine().transform.localScale.z)
    --边框的原始坐标
    self.SpinePanelOldPos = Vector3(self.SpinePanel().transform.localPosition.x,self.SpinePanel().transform.localPosition.y,self.SpinePanel().transform.localPosition.z)
    --边框的宽高
    self.DragFrameOldRect = self.Img_DragFrame().transform.sizeDelta

    --设置边界节点数据
    self.ItemDrag:SetRange(self.Img_DragFrame().gameObject)
    --设置拖拽节点
    if self.IsCanRotate then
        self.ItemDrag:SetInBoxObj(self.RoleSpinePanel().gameObject)
    else
        self.ItemDrag:SetInBoxObj(self.SpinePanel().gameObject)
    end

    MgrTimer.AddRepeat("TouchUpdateRole",0,function ()
        if UIEvent.GetButton_Up() then
            --设置边界节点数据
            self.ItemDrag:SetRange(self.Img_DragFrame().gameObject)
        end
        if Input.touchCount <= 0 then
            return
        end
        
        if 2 == Input.touchCount then  --双指触摸,放大缩小
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
            local _LocalScale = self.LihuiPanel().transform.localScale;
            local _Scale = Vector3(_LocalScale.x + _ScaleFactor,
                    _LocalScale.y + _ScaleFactor,
                    _LocalScale.z + _ScaleFactor)

            --缩放
            self.Slider_Scale().value = _LocalScale.x + _ScaleFactor
            --self:SetScale(_Scale)
            --记住最新的触摸点，下次使用
            _OldTouch1 = _NewTouch1
            _OldTouch2 = _NewTouch2
        end
    end,-1,nil)
end

--触摸退出
function M:TouchExit(_isExit)
    if _isExit then
        MgrTimer.Cancel("TouchUpdateRole")
    end
    self.Slider_Scale().value = self.LihuiPanelOldScale.x
    self.Img_DragBG().gameObject:SetActive(false)
    --self.LihuiSpinePanel().transform.localPosition = self.OldPosition

    self.RoleSpinePanel().transform.localPosition = self.LihuiPanelParentOldPos
    self.LihuiPanel().transform.localScale = self.LihuiPanelOldScale

    self.FrontSpine().transform.localScale = self.FrontSpriteOldPosScale
    --有皮肤的拖拽节点
    self.SpinePanel().transform.localPosition = self.SpinePanelOldPos
    --边框
    self.Img_DragFrame().transform.sizeDelta = self.DragFrameOldRect
    --立绘坐标
    self.LihuiPanel().transform.localPosition = self.LihuiPanelOldPos
end
---@param _skin RoleSkinData 检测ASMR
function M:CheckAsmr(_skin)
    local tAsmrData = SkinControl.GetAsmrDataByID(_skin.id)
    if tAsmrData == nil then
        self.ASMR().gameObject:SetActive(false)
        return
    end

    for i, v in ipairs(self.BtnCD_Panel) do
        GameObject.Destroy(v.gameObject)
    end

    for i, v in ipairs(tAsmrData) do
        self.BtnCD_Panel[i] = GameObject.Instantiate(self.Btn_CD().gameObject,self.ASMR_Close().transform,false)
        self.BtnCD_Panel[i].gameObject:SetActive(true)
        self.BtnCD_Panel[i].transform:Find("CDName"):GetComponent("TextMeshProUGUI").text = "0"..i
        --播放ASMR
        UIEvent.LuaClick(self.BtnCD_Panel[i].gameObject,function()
            local tStr = string.split(v[1].UnlockItem,"_")
            local item = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
            --剩余大于数量
            if item.count == 0 then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_personalstory_tips3"),1},true)
                return
            end
            self.CurUIState = "spineAsmr"
            self:OpenAsmrUI(true)
            
            SkinControl.PlayAsmr(v,function()
                self:OpenAsmrUI(false)
            end,self.MailContentTxt())
        end)
    end
   
    self.ASMR().gameObject:SetActive(true)
    self.Btn_ASMR_Open().gameObject:SetActive(true)
    self.ASMR_Close().gameObject:SetActive(false)
end
---打开ASMR界面
function M:OpenAsmrUI(_isOpen)
    self.SkinUI().gameObject:SetActive(not _isOpen)
    self.ASMR_Txt().gameObject:SetActive(_isOpen)
    if not ArtAtlasControl.GetSkinUI() then
        self.SkinChoose().gameObject:SetActive(not _isOpen)
    end
    self.Btn_Mask().gameObject:SetActive(_isOpen)
    --隐藏上一个播放的动作范围
    self:HideAction()
end
---检测是否拥有个人剧情徽章
function M:CheckBadge(_skinData)
    ---个人剧情皮肤数据
    ---@type PersonStoryData
    local tPersonSkinData = PersonStoryControl.GetPersonSkinData()[_skinData.id]
    if tPersonSkinData and _skinData.unlockState then
        --检查皮肤碎片收集进度是否完成
        if not tPersonSkinData:CheckPiece() then
            MgrRes.LoadSprite(self.Img_Badge(),tPersonSkinData.badgename1)
        else
            MgrRes.LoadSprite(self.Img_Badge(),tPersonSkinData.badgename2)
        end
    end
    self.Img_Badge().gameObject:SetActive(tPersonSkinData and _skinData.unlockState)
end

function M:ActionCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({ self.CurActionList[idx], self.CurActionStateId })
end
function M:ActionUpdate(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({true})
    Tools.ReContentSizeGroup(self.ActionContent().gameObject)   --Unity强制重新布局
end
function M:ActionUnchooseUpdate(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({false})
    Tools.ReContentSizeGroup(self.ActionContent().gameObject)   --Unity强制重新布局
end
function M:RefreshActionItem(idx)
    if self.CurActionStateId == idx then
        return
    end
    self.CurActionStateId = idx
    self.ActionScroll01():ScrollToCell(idx-1,1000,idx)
end
---加载角色动作列表
function M:ReloadAction()
    self.CurActionList = HeroControl.GetActionDataBySkinID(self.currentChooseSkinData.id)
    --设置Loop数量
    Tools.ClearAllChild(self.ActionContent().gameObject)
    self.ActionScroll01().totalCount = #self.CurActionList
    self.ActionScroll01():RefillCells(0)
    
    Tools.ReContentSizeGroup(self.ActionContent().gameObject)   --Unity强制重新布局
end
---@param _actionData RoleuiskintipsLocalData 播放动画
function M:ActionPlay(_actionData)
    if _actionData == nil then
        return
    end
    local tActionData = string.split(_actionData.action, ',')
    local ActorCfg = ActorLinesLocalData.tab[tonumber(tActionData[3])]
    local FrontBackAni = nil
    if ActorCfg and ActorCfg[15] ~= "0" then
        FrontBackAni = string.split(ActorCfg[15],',')
    end
    local list = {
        --点击动画
        touchAni = tActionData[1],
        --切换动画
        switchAni = tActionData[2]~="0" and tActionData[2] or nil,
        --台词
        aniWorld = ActorCfg~=nil and ActorCfg[7] or nil,
        --音频
        audioName = ActorCfg~=nil and ActorCfg[13] or nil,
        --前景动画
        frontAni = FrontBackAni~=nil and FrontBackAni[1] or nil,
        --后景动画
        backAni = FrontBackAni~=nil and FrontBackAni[2] or nil,
        --切换状态
        switchSstate = tonumber(tActionData[5])
    }

    --隐藏上一个播放的动作范围
    self:HideAction()
    local CurClickArea = self.ClickAreaCanvas
    --显示当前正在播放的动作范围
    if self.currentChooseSkinData.HaveClickArea then
        CurClickArea = self.ClickAreaCanvasList[_actionData.range]
    end
    if _actionData.range ~= 0 and CurClickArea then
        CurClickArea.alpha = 1
    end
    self.CurPlayAction = CurClickArea
    
    local playObjs = self.currentChooseSkinData.newSwitch == false and {self.SpineObj,self.BGSpine,self.FrontSpineObj} or nil
    SkinControl.PlaySelectAction(playObjs, list, function()
        if list.switchSstate ~= 0 then
            self:RefreshActionItem(list.switchSstate)
        end
        if CurClickArea then
            CurClickArea.alpha = 0
        end
    end)
end

function M:HideAction()
    --隐藏上一个播放的动作范围
    if self.CurPlayAction then
        self.CurPlayAction.alpha = 0
    end
end

function M:OnHide()
    MgrTimer.Cancel("cengji")
    MgrTimer.Cancel("DocRoleVoice")
    if self.CurPlayAudioItem.ChangeFunc then
        self.CurPlayAudioItem.ChangeFunc()
    end
    self.currentChooseSkinData = nil
end

function M:OnBackKey()
    if not self.IsPortrait then
        self:PortraitSwitch()
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

function M:OnClose()
    MgrTimer.Cancel("cengji")
    MgrTimer.Cancel("DocRoleVoice")
    if self.CurPlayAudioItem.ChangeFunc then
        self.CurPlayAudioItem.ChangeFunc()
    end
    self.currentChooseSkinData = nil

    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    if self.BGSpine ~= nil then
        GameObject.Destroy(self.BGSpine)
        self.BGSpine = nil
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    --暂停语音
    MgrSound.Stop(3)
    ---清理旧前景spine
    if self.FrontSpineObj ~= nil then
        GameObject.Destroy(self.FrontSpineObj)
        self.FrontSpineObj = nil
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    if self.spine ~= nil then
        GameObject.Destroy(self.spine)
        self.spine = nil
        if self.fightSpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.fightSpinePath)
            self.fightSpinePath = nil
        end
    end
    MgrRes.UnLoadUnusedAssets(true)
end

return M