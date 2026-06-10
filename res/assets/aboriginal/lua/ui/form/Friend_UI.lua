-- Code Auto Create Begin
local M = Class('Friend_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Friend_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Friend_UI].prefab'
    self.Name = 'Form[Friend_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'UpperLeftBtnPanel','UpperLeftBtnPanel',2},{'Btn_GoBack','UpperLeftBtnPanel/Btn_GoBack',2},{'Img_Fenggexian','UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftBtnPanel/Btn_Help',2},{'Tog_List','Content/Tog_List',2},{'Normal','Content/Tog_List/Normal',2},{'weixuanzhongdi','Content/Tog_List/Normal/weixuanzhongdi',2},{'Highlight','Content/Tog_List/Highlight',2},{'xuanzhongdi','Content/Tog_List/Highlight/xuanzhongdi',2},{'Tog_Apply','Content/Tog_Apply',2},{'Normal01','Content/Tog_Apply/Normal',2},{'weixuanzhongdi01','Content/Tog_Apply/Normal/weixuanzhongdi',2},{'ApplyNRedDotIcon','Content/Tog_Apply/Normal/ApplyNRedDotIcon',2},{'Highlight01','Content/Tog_Apply/Highlight',2},{'xuanzhongdi01','Content/Tog_Apply/Highlight/xuanzhongdi',2},{'ApplyRedDotIcon','Content/Tog_Apply/Highlight/ApplyRedDotIcon',2},{'Tog_Add','Content/Tog_Add',2},{'Normal02','Content/Tog_Add/Normal',2},{'weixuanzhongdi02','Content/Tog_Add/Normal/weixuanzhongdi',2},{'Highlight02','Content/Tog_Add/Highlight',2},{'xuanzhongdi02','Content/Tog_Add/Highlight/xuanzhongdi',2},{'Btn_Battlelineup','Btn_Battlelineup',2},{'Img_BattlelineupIcon','Btn_Battlelineup/Img_BattlelineupIcon',2},{'Btn_OneClick','Btn_OneClick',2},{'Icon','Btn_OneClick/Icon',2},{'Img_ScrollBG','ScrollPanel/Img_ScrollBG',2},{'Img_Line','ScrollPanel/Img_Line',2},{'Img_Xiantou2','ScrollPanel/Img_Line/Img_Xiantou2',2},{'Img_Xiantou1','ScrollPanel/Img_Line/Img_Xiantou1',2},{'ListScrollPanel','ScrollPanel/ListScrollPanel',2},{'ListContent','ScrollPanel/ListScrollPanel/ListScroll/ListContent',2},{'Scrollbar','ScrollPanel/ListScrollPanel/ListScroll/Scrollbar',2},{'Handle','ScrollPanel/ListScrollPanel/ListScroll/Scrollbar/Sliding Area/Handle',2},{'Img_ListNoData','ScrollPanel/ListScrollPanel/ListScroll/Img_ListNoData',2},{'Img_Zanwuhaoyouicon','ScrollPanel/ListScrollPanel/ListScroll/Img_ListNoData/Img_Zanwuhaoyouicon',2},{'Img_Haoyoushudi','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Img_Haoyoushudi',2},{'Tog_Delete','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Tog_Delete',2},{'Normal03','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Tog_Delete/Normal',2},{'Img_Shanchuicon1','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Tog_Delete/Normal/Img_Shanchuicon1',2},{'Highlight03','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Tog_Delete/Highlight',2},{'Img_CancelIcon','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Tog_Delete/Highlight/Img_CancelIcon',2},{'Img_NoDelete','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Img_NoDelete',2},{'Img_Shanchuicon','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Img_NoDelete/Img_Shanchuicon',2},{'Img_FriendCoin','ScrollPanel/ListScrollPanel/ListButtons/FriendCoin/Img_FriendCoin',2},{'CoinIcon','ScrollPanel/ListScrollPanel/ListButtons/FriendCoin/CoinIcon',2},{'Btn_AddShieldCoin','ScrollPanel/ListScrollPanel/ListButtons/FriendCoin/Btn_AddShieldCoin',2},{'Img_AddShieldCoin','ScrollPanel/ListScrollPanel/ListButtons/FriendCoin/Btn_AddShieldCoin/Img_AddShieldCoin',2},{'Btn_FriendBatchDelete','ScrollPanel/ListScrollPanel/ListButtons/Btn_FriendBatchDelete',2},{'Img_FriBDel_Bg','ScrollPanel/ListScrollPanel/ListButtons/Btn_FriendBatchDelete/Img_FriBDel_Bg',2},{'Img_FriBDel_Icon','ScrollPanel/ListScrollPanel/ListButtons/Btn_FriendBatchDelete/Img_FriBDel_Icon',2},{'ApplyScrollPanel','ScrollPanel/ApplyScrollPanel',2},{'Btn_RejectAll','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_RejectAll',2},{'Img_Quanbujujuedi','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_RejectAll/Img_Quanbujujuedi',2},{'Img_Chaicon','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_RejectAll/Img_Chaicon',2},{'Btn_AgreeAll','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_AgreeAll',2},{'Img_Quanbutongyidi','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_AgreeAll/Img_Quanbutongyidi',2},{'Img_Gouicon','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_AgreeAll/Img_Gouicon',2},{'Btn_BlockApply','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_BlockApply',2},{'Img_BlockApply_Bg','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_BlockApply/Img_BlockApply_Bg',2},{'Img_BlockNormal_Icon','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_BlockApply/BlockApply_Normal/Img_BlockNormal_Icon',2},{'Img_BlockHighlight_Icon','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_BlockApply/BlockApply_Highlight/Img_BlockHighlight_Icon',2},{'ApplyContent','ScrollPanel/ApplyScrollPanel/ApplyScroll/ApplyContent',2},{'Scrollbar01','ScrollPanel/ApplyScrollPanel/ApplyScroll/Scrollbar',2},{'Handle01','ScrollPanel/ApplyScrollPanel/ApplyScroll/Scrollbar/Sliding Area/Handle',2},{'Img_ApplyNoData','ScrollPanel/ApplyScrollPanel/ApplyScroll/Img_ApplyNoData',2},{'Img_Zanwuhaoyouicon01','ScrollPanel/ApplyScrollPanel/ApplyScroll/Img_ApplyNoData/Img_Zanwuhaoyouicon',2},{'AddScrollPanel','ScrollPanel/AddScrollPanel',2},{'ListContent01','ScrollPanel/AddScrollPanel/AddScroll/ListContent',2},{'Scrollbar02','ScrollPanel/AddScrollPanel/AddScroll/Scrollbar',2},{'Handle02','ScrollPanel/AddScrollPanel/AddScroll/Scrollbar/Sliding Area/Handle',2},{'Img_AddNoData','ScrollPanel/AddScrollPanel/AddScroll/Img_AddNoData',2},{'Img_Zanwuhaoyouicon02','ScrollPanel/AddScrollPanel/AddScroll/Img_AddNoData/Img_Zanwuhaoyouicon',2},{'Btn_Refresh','ScrollPanel/AddScrollPanel/AddButtons/Btn_Refresh',2},{'Img_Shuaxindi','ScrollPanel/AddScrollPanel/AddButtons/Btn_Refresh/Img_Shuaxindi',2},{'Img_Shuaxinicon','ScrollPanel/AddScrollPanel/AddButtons/Btn_Refresh/Img_Shuaxinicon',2},{'Img_ShuaxinCD','ScrollPanel/AddScrollPanel/AddButtons/Img_ShuaxinCD',2},{'Img_Shuaxinicon1','ScrollPanel/AddScrollPanel/AddButtons/Img_ShuaxinCD/Img_Shuaxinicon1',2},{'Img_Chazhaodi','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/Img_Chazhaodi',2},{'Btn_Find','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/Btn_Find',2},{'Img_Chachaodi','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/Btn_Find/Img_Chachaodi',2},{'Img_Chazhaoicon','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/Btn_Find/Img_Chazhaoicon',2},{'InputField','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/InputField',2},{'Img_Wodedi','ScrollPanel/AddScrollPanel/AddButtons/MyUid/Img_Wodedi',2},{'Btn_CopyUID','ScrollPanel/AddScrollPanel/AddButtons/MyUid/Btn_CopyUID',2},{'Img_Fuzhidi','ScrollPanel/AddScrollPanel/AddButtons/MyUid/Btn_CopyUID/Img_Fuzhidi',2},{'Img_Fuzhiicon','ScrollPanel/AddScrollPanel/AddButtons/MyUid/Btn_CopyUID/Img_Fuzhiicon',2},{'RemarkPanel','RemarkPanel',2},{'zhezhao','RemarkPanel/zhezhao',2},{'Btn_Back','RemarkPanel/Btn_Back',2},{'Img_Xian1','RemarkPanel/Img_Xian1',2},{'Img_Xian2','RemarkPanel/Img_Xian2',2},{'Img_PopUpsDi','RemarkPanel/Img_PopUpsDi',2},{'Btn_Confirm','RemarkPanel/Btn_Confirm',2},{'Btn_Confirm01','RemarkPanel/Btn_Confirm/Btn_Confirm',2},{'Btn_Cancel','RemarkPanel/Btn_Cancel',2},{'Btn_Cancel01','RemarkPanel/Btn_Cancel/Btn_Cancel',2},{'ChooseNickNamePanel','RemarkPanel/ChooseNickNamePanel',2},{'Img_Xian','RemarkPanel/ChooseNickNamePanel/Text_Biaoti/Img_Xian',2},{'Nichengdi','RemarkPanel/Nichengdi',2},
        -- Text 列表
        {'Text_CoinCount','ScrollPanel/ListScrollPanel/ListButtons/FriendCoin/Text_CoinCount',3},
        -- UITemplate 列表
        {'FriendItem','ScrollPanel/ListScrollPanel/ListScroll/FriendItem',10},{'FriendItem01','ScrollPanel/ApplyScrollPanel/ApplyScroll/FriendItem',10},{'FriendItem02','ScrollPanel/AddScrollPanel/AddScroll/FriendItem',10},
        -- Toggle 列表
        {'Tog_List01','Content/Tog_List',13},{'Tog_Apply01','Content/Tog_Apply',13},{'Tog_Add01','Content/Tog_Add',13},{'Tog_Delete01','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Tog_Delete',13},
        -- RawImage 列表
        {'ListScroll','ScrollPanel/ListScrollPanel/ListScroll',15},{'ApplyScroll','ScrollPanel/ApplyScrollPanel/ApplyScroll',15},{'AddScroll','ScrollPanel/AddScrollPanel/AddScroll',15},
        -- LoopScrollRect 列表
        {'ListScroll01','ScrollPanel/ListScrollPanel/ListScroll',18},{'ApplyScroll01','ScrollPanel/ApplyScrollPanel/ApplyScroll',18},{'AddScroll01','ScrollPanel/AddScrollPanel/AddScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Friend_CN','UpperLeftBtnPanel/Text_Friend/Text_Friend_CN',20},{'Text_Friend_EN','UpperLeftBtnPanel/Text_Friend/Text_Friend_EN',20},{'EnText','Content/Tog_List/Normal/EnText',20},{'CNText','Content/Tog_List/Normal/CNText',20},{'EnText01','Content/Tog_List/Highlight/EnText',20},{'CNText01','Content/Tog_List/Highlight/CNText',20},{'EnText02','Content/Tog_Apply/Normal/EnText',20},{'CNText02','Content/Tog_Apply/Normal/CNText',20},{'EnText03','Content/Tog_Apply/Highlight/EnText',20},{'CNText03','Content/Tog_Apply/Highlight/CNText',20},{'EnText04','Content/Tog_Add/Normal/EnText',20},{'CNText04','Content/Tog_Add/Normal/CNText',20},{'EnText05','Content/Tog_Add/Highlight/EnText',20},{'CNText05','Content/Tog_Add/Highlight/CNText',20},{'Text_Battlelineup','Btn_Battlelineup/Text_Battlelineup',20},{'Text_Jiangliyulan','Btn_OneClick/Text_Jiangliyulan',20},{'Text_Zanwuhaoyou','ScrollPanel/ListScrollPanel/ListScroll/Img_ListNoData/Text_Zanwuhaoyou',20},{'Text_Haoyoushu','ScrollPanel/ListScrollPanel/ListButtons/FriendCount/Text_Haoyoushu',20},{'Text_Power','ScrollPanel/ListScrollPanel/ListButtons/Text_Power',20},{'Text_FriBDel','ScrollPanel/ListScrollPanel/ListButtons/Btn_FriendBatchDelete/Text_FriBDel',20},{'Text_Quanbujujue','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_RejectAll/Text_Quanbujujue',20},{'Text_Quanbutongyi','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_AgreeAll/Text_Quanbutongyi',20},{'Text_BlockNormal','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_BlockApply/BlockApply_Normal/Text_BlockNormal',20},{'Text_BlockHighlight','ScrollPanel/ApplyScrollPanel/ApplyButtons/Btn_BlockApply/BlockApply_Highlight/Text_BlockHighlight',20},{'Text_Zanwuhaoyou01','ScrollPanel/ApplyScrollPanel/ApplyScroll/Img_ApplyNoData/Text_Zanwuhaoyou',20},{'Text_Zanwuhaoyou02','ScrollPanel/AddScrollPanel/AddScroll/Img_AddNoData/Text_Zanwuhaoyou',20},{'Placeholder','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/InputField/Placeholder',20},{'Text_Shuru','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/InputField/Text_Shuru',20},{'Text_Wode','ScrollPanel/AddScrollPanel/AddButtons/MyUid/Text_Wode',20},{'Text_Confirm','RemarkPanel/Btn_Confirm/Text_Confirm',20},{'Text_Cancel','RemarkPanel/Btn_Cancel/Text_Cancel',20},{'Text_Biaoti','RemarkPanel/ChooseNickNamePanel/Text_Biaoti',20},{'Text_Zishu','RemarkPanel/ChooseNickNamePanel/Text_Zishu',20},{'Text_ChooseNickName','RemarkPanel/Input_ChooseNickName/Text_ChooseNickName',20},
        -- TMP_InputField 列表
        {'InputField01','ScrollPanel/AddScrollPanel/AddButtons/FindFriendByUID/InputField',21},{'Input_ChooseNickName','RemarkPanel/Input_ChooseNickName',21},
    }
end
-- Code Auto Create End
require("LocalData/SteamLocalData")
function M:OnInit()
    self.Input_ChooseNickName().characterLimit = tonumber(SteamLocalData.tab[104021][2])
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    Event.Add(EID.FriendApplyBlockStateChanged, Handle(self, self.SetBlockApplyToggleWidgets))
    ---刷新好友列表数据
    --FriendViewModel.FriendListCallBack = Handle(self,self.UpdataListPanel)
    FriendViewModel.FriendListCallBack = Handle(self, self.UpdateDataAndPanelAfterDelete)
    ---刷新审批列表数据
    FriendViewModel.ApprovalListCallBack = Handle(self,self.UpdataApprovalPanel)
    ---是否是第一次点击申请
    self.ApplyFirst = true
    ---是否是第一次点击好友列表
    self.FriendFirst = true

    ---当前好友列表的页数
    self.CurListPage = 0

    ---当前申请好友列表的页数
    self.CurApplyPage = 0

    ---当前好友列表数据
    ---该数组在之后逻辑上变成了和 FriendViewModel 同一个表，因此这里不需要再维护该表了
    --self.FriendList = {}

    ---当前好友申请列表数据
    self.FriendApplyList = {}

    ---随机好友列表数据
    self.SearchFriendList = {}
    ---随机好友缓存列表数据
    self.CacheSearchFriendList = {}

    ---当前好友列表的索引
    self.CurIndex = nil

    ---当前好友申请列表的索引
    self.CurApplyIndex = nil

    ---是否点击了删除按钮 true是删除 false是取消删除
    self.CurDeleteType = false

    ---注册点击事件
    self:InitClick()

    ---隐藏好友修改面板
    self.RemarkPanel().gameObject:SetActive(false)

    ---注册滑块
    self:RegisterListScroll()
    self:RegisterApplyScroll()
    self:RegisterAddScroll()
    ---默认选中好友列表toggle
    self.Tog_List01().isOn = false
    self.Tog_List01().isOn = true

---跳转初始化
    if FriendViewModel.JumpToAddFriends then
        FriendViewModel.JumpToAddFriends = false
        self.Tog_Add01().isOn = false
        self.Tog_Add01().isOn = true
    end

    ---清空点赞数据
    FriendViewModel.LikeData = {}

    ---红点默认关闭
    self.ApplyRedDotIcon().gameObject:SetActive(false)
    self.ApplyNRedDotIcon().gameObject:SetActive(false)
end

function M:OnBackKey()
    local isRemarkPanel = self.RemarkPanel().gameObject.activeSelf
    if not MgrUI.IsPopOpen() then
        if isRemarkPanel then
            self.RemarkPanel().gameObject:SetActive(false)
            return
        end
        FriendViewModel.Close()
    end
end

---刷新好友列表页面数据
function M:UpdataListPanel()
    --self.FriendList = FriendViewModel.FriendCache
    self.CurListPage = 0
    self.CurIndex = nil
    FriendViewModel.GetFriendInfoREQ(self.CurListPage,1,Handle(self,self.GetFriendInfoACK),Handle(self,self.GetFriendInfoNTF))  ---好友
    MgrTimer.AddRepeat("CheckFriendList", 0, Handle(self,function()
        self:ReloadListData(0)
        MgrTimer.Cancel("CheckFriendList")
    end) , -1, nil)
end
---刷新好友申请列表页面数据
function M:UpdataApprovalPanel()
    self.FriendApplyList = {}
    self.CurApplyPage = 0
    self.CurApplyIndex = nil
    self:SetBlockApplyToggleWidgets(FriendViewModel.IsFriendApplyBlocked())
    FriendViewModel.GetFriendInfoREQ(self.CurApplyPage,0,Handle(self,self.GetFriendInfoACK),Handle(self,self.GetFriendInfoNTF))   ---待审批的好友
    MgrTimer.AddRepeat("CheckApplyList", 0, Handle(self,function()
        self:ReloadApplyData(0)
        MgrTimer.Cancel("CheckApplyList")
    end) , -1, nil)
end
---刷新添加好友列表页面数据
---该方法会被 FriendItem 通过 self.Parent 外部调用
---@param bKeepPos boolean @ 保留列表滚动位置
function M:UpdataAddPanel(bKeepPos)
    ---清空数据
    self.SearchFriendList = {}
    ---如果搜索缓存数据为空 重新发请求拉数据
    if #self.CacheSearchFriendList == 0 then
        FriendViewModel.GetFriendSearchREQ(0,Handle(self,self.GetFriendSearchNTF))
        MgrTimer.AddRepeat("CheckSearchList", 0, Handle(self,function()
            self:ReloadAddData(0)
            MgrTimer.Cancel("CheckSearchList")
        end) , -1, nil)
    else
        ---缓存数据不为空直接刷新列表
        if bKeepPos then
            -- 不给 offset 的情况下，内部调用的函数，不会刷新 Cell 数量
            -- 会导致搜索完再切回来只显示一个推荐好友的问题，除非拖动列表刷新
            self:ReloadAddData()
        else
            self:ReloadAddData(0)
        end
    end
end

---打开修改备注面板
function M:OpenRemarkUI(ID)
    self.RemarkPanel().gameObject:SetActive(true)
    self.Input_ChooseNickName().text = ""
    self.CurRemarkID = ID
end

---注册按钮点击事件
function M:InitClick()
    ---注册toggle好友列表
    self.ListNH = {
        self.Tog_List01().transform:Find("Normal").gameObject,
        self.Tog_List01().transform:Find("Highlight").gameObject,
    }
    self.ListNH[1]:SetActive(false)
    self.Tog_List01().isOn = true
    Tools.ToggleValueChange(self.Tog_List01(),function(isOn)
        self.ListNH[1]:SetActive(not isOn)
        self.ListNH[2]:SetActive(isOn)
        self.ListScrollPanel().gameObject:SetActive(isOn)
        self.Btn_OneClick().gameObject:SetActive(isOn)
        self.Btn_Battlelineup().gameObject:SetActive(isOn)
        if(FriendViewModel.FriendListChanged == true or self.FriendFirst == true) then
            self.FriendFirst = false
            self:UpdataListPanel()
            FriendViewModel.FriendListChanged = false
        end
        self:FriendListScrollFirstShow(self.ListContent())
        if isOn then
            self.Tog_Delete01().isOn = false
        end
    end,nil)

    ---注册toggle好友申请
    self.ApplyNH = {
        self.Tog_Apply01().transform:Find("Normal").gameObject,
        self.Tog_Apply01().transform:Find("Highlight").gameObject,
    }
    self.ApplyNH[2]:SetActive(false)
    self.ApplyScrollPanel().gameObject:SetActive(false)
    Tools.ToggleValueChange(self.Tog_Apply01(),function(isOn)
        self.ApplyNH[1]:SetActive(not isOn)
        self.ApplyNH[2]:SetActive(isOn)
        self.ApplyScrollPanel().gameObject:SetActive(isOn)
        if self.ApplyFirst == true then  --好友申请数据只申请一次
            ---请求好友数据   CurPage 页数,CurStatus 获取特定类型的好友 0等待审批的  1好友
            --FriendViewModel.GetFriendInfoREQ(self.CurApplyPage,0,Handle(self,self.GetFriendInfoACK),Handle(self,self.GetFriendInfoNTF))   ---待审批的好友
            self.ApplyFirst = false
            self:UpdataApprovalPanel()
        end
        self:FriendListScrollFirstShow(self.ApplyContent())
    end,nil)

    ---注册toggle添加好友
    self.AddNH = {
        self.Tog_Add01().transform:Find("Normal").gameObject,
        self.Tog_Add01().transform:Find("Highlight").gameObject,
    }
    self.AddNH[2]:SetActive(false)
    self.AddScrollPanel().gameObject:SetActive(false)
    Tools.ToggleValueChange(self.Tog_Add01(),function(isOn)
        self.AddNH[1]:SetActive(not isOn)
        self.AddNH[2]:SetActive(isOn)
        self.AddScrollPanel().gameObject:SetActive(isOn)
        ---好友搜索里请求随机好友数据
        if( isOn == true) then
            ---默认是随机搜索用户
            FriendViewModel.RandomFriend = true
            self:UpdataAddPanel()
            ---刷新按钮置灰
            self.RefreshNH[1]:SetActive(false)
            self.RefreshNH[2]:SetActive(true)
            ---6sCD后恢复正常
            MgrTimer.AddRepeat("RefreshCD", tonumber(SteamLocalData.tab[117006][2]), Handle(self,function()
                self.RefreshNH[1]:SetActive(true)
                self.RefreshNH[2]:SetActive(false)
                MgrTimer.Cancel("RefreshCD")
            end) , -1, nil)
        end
        self:FriendListScrollFirstShow(self.ListContent01())
    end,nil)

    ---点击返回按钮
    UIEvent.LuaClick(self.Btn_GoBack().gameObject, Handle(self,FriendViewModel.Close))

    ---好友删除Toggle
    self.DeleteNH = {
        self.Tog_Delete01().transform:Find("Normal").gameObject,
        self.Tog_Delete01().transform:Find("Highlight").gameObject,
    }
    self.DeleteNH[2]:SetActive(false)
    self.Btn_FriendBatchDelete().gameObject:SetActive(false)
    ---如果当前删除模式是True，则好友Item需要显示删除按钮
    Tools.ToggleValueChange(self.Tog_Delete01(),function(isOn)
        self.DeleteNH[1]:SetActive(not isOn)
        self.DeleteNH[2]:SetActive(isOn)
        self:SwitchFriendDeletePanel(isOn)
    end,nil)

    --- 好友批量删除
    UIEvent.LuaClick(self.Btn_FriendBatchDelete().gameObject, Handle(self, self.OnBtnFriendBatchDeleteClick))

    ---好友申请全部拒绝
    UIEvent.LuaClick(self.Btn_RejectAll().gameObject,function ()
        ---ID 要审批的用户 0 全部 非0 特定用户 Result 0 拒绝 1 同意
        ---没有数据就不操作
        if #self.FriendApplyList == 0 then
            return
        end
        FriendViewModel.GetFriendApprovalREQ(0,0)
    end)
    ---好友申请全部接受
    UIEvent.LuaClick(self.Btn_AgreeAll().gameObject,function ()
        ---没有数据就不操作
        if #self.FriendApplyList == 0 then
            return
        end
        FriendViewModel.GetFriendApprovalREQ(0,1)
    end)

    ---好友申请屏蔽
    self:SetBlockApplyToggleWidgets(FriendViewModel.IsFriendApplyBlocked())
    UIEvent.LuaClick(self.Btn_BlockApply().gameObject, Handle(self, self.OnBtnBlockApplyClick))

    ---我的UID
    self.Text_Wode().text = MgrLanguageData.GetLanguageByKey("friend_ui_myuid")..PlayerControl.GetPlayerData().UID
    ---点击复制UID按钮
    UIEvent.LuaClick(self.Btn_CopyUID().gameObject,function ()
        --GUIUtility.systemCopyBuffer = PlayerControl.GetPlayerData().UID
        Tools.CopyToClipboard(PlayerControl.GetPlayerData().UID)
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_copy"),1},true)
    end)

    ---点击通过UID查找指定好友
    UIEvent.LuaClick(self.Btn_Find().gameObject,function ()
        local SearchUID = self.InputField01().text
        if(SearchUID == "" or SearchUID == nil) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_inputuid"),1},true)
            return
        end
        if not tonumber(SearchUID) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_wronguid"),1},true)
            self.InputField01().text = ""
            return
        end
        self:SendSearchFriendRREQ(SearchUID)
        self.InputField01().text = ""
    end)

    ---点击刷新另外一批推荐好友
    self.RefreshNH = {
        self.Btn_Refresh().gameObject,
        self.Img_ShuaxinCD().gameObject,
    }
    self.RefreshNH[2]:SetActive(false)
    UIEvent.LuaClick(self.Btn_Refresh().gameObject,function ()
        FriendViewModel.GetFriendSearchREQ(0,Handle(self,self.GetFriendSearchNTF))
        ---刷新按钮置灰
        self.RefreshNH[1]:SetActive(false)
        self.RefreshNH[2]:SetActive(true)
        ---6sCD后恢复正常
        MgrTimer.AddRepeat("RefreshCD", tonumber(SteamLocalData.tab[117006][2]), Handle(self,function()
            self.RefreshNH[1]:SetActive(true)
            self.RefreshNH[2]:SetActive(false)
            MgrTimer.Cancel("RefreshCD")
        end) , -1, nil)
    end)

    ---好友备注面板
    ---确认按钮
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function ()
        local RemarkName = self.Input_ChooseNickName().text
        if(self.CurRemarkID) then
            FriendViewModel.FriendSetRemarkREQ(self.CurRemarkID,RemarkName,Handle(self,self.FriendSetRemarkACK),Handle(self,self.FriendSetRemarkNTF))
        end
    end)
    ---取消按钮
    UIEvent.LuaClick(self.Btn_Cancel().gameObject,function ()
        self.RemarkPanel().gameObject:SetActive(false)
    end)
    ---点击备注面板空白区域
    UIEvent.LuaClick(self.Btn_Back().gameObject,function ()
        self.RemarkPanel().gameObject:SetActive(false)
    end)
    ---初始化帮助按钮
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(99)
    end))
    ---一键点赞
    UIEvent.LuaClick(self.Btn_OneClick().gameObject,function()
        FriendViewModel.OneClickLikeREQ(function()
            self:RefreshPowerText(FriendViewModel.likeCount)
            self:ReloadListData()
        end)
    end)
    ---PVP阵型调整
    UIEvent.LuaClick(self.Btn_Battlelineup().gameObject,function()
        MgrBattle.GoFight(MgrBattle.fightType.friendPVP,nil,SteamLocalData.tab[117025][2])
    end)
end

---------------------------------------------------好友列表------------------------------------------------------
---注册滑块
function M:RegisterListScroll()
    self.ListScroll01():SetLuaCellEvent(Handle(self,self.ListCellItem))
end

---任务回调
function M:ListCellItem(trans,idx)
    local friendList = FriendViewModel.FriendCache
    trans:GetComponent("UITemplate"):SetData({friendList[idx],self})
    --if(#self.FriendList < 5) then
    --    return
    --end
    --if(self.CurIndex ~= nil and idx <= self.CurIndex) then
    --    return
    --end
    --
    --if(idx == #self.FriendList) then
    --    self.CurIndex = idx
    --    self.CurListPage = math.floor(idx / 5)
    --    FriendViewModel.GetFriendInfoREQ(self.CurListPage,1,Handle(self,self.GetFriendInfoACK),Handle(self,self.GetFriendInfoNTF))  ---CurPage 页数,CurStatus 获取特定类型的好友 0等待审批的  1好友
    --end

end

---设置好友列表滑动数据
function M:ReloadListData(offset)
    local friendList = FriendViewModel.FriendCache
    local friendCount = #friendList
    
    ---设置Loop数量
    self.ListScroll01().totalCount = friendCount
    if offset then
        self.ListScroll01():RefillCells(offset)
    else
        self.ListScroll01():RefreshCells()
    end

    ---判断有无数据，无数据显示无数据图片
    self.Img_ListNoData().gameObject:SetActive(friendCount == 0)
    ---有好友数据就展示删除好友按钮
    self.Tog_Delete01().gameObject:SetActive(friendCount ~= 0)
    self.Img_NoDelete().gameObject:SetActive(friendCount == 0)
    ---刷新好友币
    local bag = ItemControl.GetAllItems()
    self.Text_CoinCount().text = JNStrTool.numberAbbr(bag[100007] and bag[100007].count or 0)
end

---获取好友数据回调
function M:GetFriendInfoACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientGetFriendInfoACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),2},true)
    end
end
function M:GetFriendInfoNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientGetFriendInfoNTF',buffer))
    print(tab)
    ---好友
    if(tab.friends and tab.status == 1 and tab.page == self.CurListPage) then
        --for k,v in pairs(tab.friends) do
        --    ---防止ID重复加入
        --    if(not FriendViewModel.Contains(self.FriendList,v.userID)) then
        --        self.FriendList[#self.FriendList + 1] = v
        --        FriendViewModel.InitLikeData(v.userID,v.tags)
        --    end
        --end
        --FriendViewModel.FriendCache = self.FriendList
        local friendList = FriendViewModel.FriendCache
        for k,v in pairs(tab.friends) do
            ---防止ID重复加入
            if(not FriendViewModel.Contains(friendList, v.userID)) then
                table.insert(friendList, v)
                FriendViewModel.InitLikeData(v.userID, v.tags)
            end
        end

        if(self.CurListPage == 0) then
            self:ReloadListData(0)  ---如果是首次刷新，刷新到指定位置
        else
            self:ReloadListData()           ---否則只刷新數據
        end
        if(tab.clientGold) then
            ---如果不超过每日获取友情币上限且点赞次数大于0显示被点赞次数
            if(tab.gold <= tonumber(SteamLocalData.tab[117003][2]) and tab.clientGold > 0) then
                local good =
                {
                    [1] = {
                        goodsType = 1,
                        goodsID = 100007,
                        goodsNum = tonumber(SteamLocalData.tab[117002][2]) * tab.clientGold
                    }
                }
                ---更新物品奖励
                ItemControl.PushGroupItemData(good,ItemControl.PushEnum.add)
                ---弹出提示
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_got")..tab.clientGold..MgrLanguageData.GetLanguageByKey("friend_ui_gotpraise")..math.floor(SteamLocalData.tab[117002][2]*tab.clientGold),2,nil,"FriendshipCoinTips"},true)
                ---刷新好友币
                local bag = ItemControl.GetAllItems()
                self.Text_CoinCount().text = JNStrTool.numberAbbr(bag[100007] and bag[100007].count or 0)
            end
        end
    ---待审批的好友
    elseif(tab.friends and tab.status == 0 and tab.page == self.CurApplyPage) then
        for k,v in pairs(tab.friends) do
            if(v.status == 0 and not FriendViewModel.Contains(self.FriendApplyList,v.userID)) then
                self.FriendApplyList[#self.FriendApplyList + 1] = v
                print("申请列表当前的UserId是---------- "..v.userID)
            end
        end
        if(self.CurApplyPage == 0) then
            self:ReloadApplyData(0)   ---首次刷新就刷新到指定位置
        else
            self:ReloadApplyData()            ---否则只刷新位置
        end
    end
    ---刷新体力文本
    self:RefreshPowerText(tab.vigor)
    ---刷新好友数
    self.Text_Haoyoushu().text = MgrLanguageData.GetLanguageByKey("friend_ui_friends").."<color=#febf2c>"..tab.friendCount.."</color>".."/"..SteamLocalData.tab[117007][2]
    ---当前已有的好友数
    self.curFriendCount = tab.friendCount
    ---刷新红点
    self:CheckRedDot(tab.friendApplyCount)
    ---屏蔽申请状态
    if tab.block ~= nil then
        FriendViewModel.SetFriendApplyBlocked(tab.block == 1)
    end
end
---修改好友备注回调
function M:FriendSetRemarkACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSetRemarkACK',buffer))
    print(tab.errNo)
    if tab.errNo==0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_tips1"),2},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friend_ui_tips2"),2},true)
    end
end

function M:FriendSetRemarkNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSetRemarkNTF',buffer))
    print(tab)
    self.RemarkPanel().gameObject:SetActive(false)
    ---更新数据
    local friendList = FriendViewModel.FriendCache
    for i,friend in pairs(friendList) do
        if friend.userID == tab.friendID then
            friend.remark = tab.remark
        end
    end
    ---刷新滑块
    self:UpdataListPanel()
end

---------------------------------------------------好友申请------------------------------------------------------
---注册滑块
function M:RegisterApplyScroll()
    self.ApplyScroll01():SetLuaCellEvent(Handle(self,self.ApplyCellItem))
end

---任务回调
function M:ApplyCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.FriendApplyList[idx],self})
    --if(idx < 5) then
    --    return
    --end
    --if(self.CurApplyIndex ~= nil and idx <= self.CurApplyIndex) then
    --    return
    --end
    --
    --if(idx == #self.FriendApplyList) then
    --    self.CurApplyIndex = idx
    --    self.CurApplyPage = math.floor(idx / 5)
    --    FriendViewModel.GetFriendInfoREQ(self.CurApplyPage,0,Handle(self,self.GetFriendInfoACK),Handle(self,self.GetFriendInfoNTF))  ---CurPage 页数,CurStatus 获取特定类型的好友 0等待审批的  1好友
    --end
end

---设置好友申请列表滑动数据
function M:ReloadApplyData(offset)
    ---设置Loop数量
    self.ApplyScroll01().totalCount = #self.FriendApplyList
    if offset then
        self.ApplyScroll01():RefillCells(offset)
    else
        self.ApplyScroll01():RefreshCells()
    end

    self.Img_ApplyNoData().gameObject:SetActive(#self.FriendApplyList == 0)
end

---------------------------------------------------添加好友------------------------------------------------------
---注册滑块
function M:RegisterAddScroll()
    self.AddScroll01():SetLuaCellEvent(Handle(self,self.AddCellItem))
end

---任务回调
function M:AddCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.SearchFriendList[idx],self})
end

---设置任务滑动数据
function M:ReloadAddData(offset)
    ---获取数据
    if FriendViewModel.RandomFriend then
        ---数据是随机用户
        self.SearchFriendList = {}
        for k,v in ipairs(self.CacheSearchFriendList) do
            table.insert(self.SearchFriendList,v)
        end
    end
    ---设置Loop数量
    self.AddScroll01().totalCount = #self.SearchFriendList
    if offset then
        self.AddScroll01():RefillCells(offset)
    else
        self.AddScroll01():RefreshCells()
    end

    self.Img_AddNoData().gameObject:SetActive(#self.SearchFriendList == 0)
end

---搜索好友回调
function M:GetFriendSearchNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSearchNTF',buffer))
    if(tab.friends) then
        local arr = {}
        ---过滤掉已经是好友和申请我的对象
        for k,v in pairs(tab.friends) do
            if v.status ~= 1 and v.status ~= 0 then
                table.insert(arr,v)
            end
        end
        if FriendViewModel.RandomFriend then
            ---如果数据是随机好友
            self.CacheSearchFriendList = arr
        else
            ---是指定用户数据
            self.SearchFriendList = tab.friends
        end
        self:ReloadAddData(0)
    end
end

---点赞获得体力文本刷新
function M:RefreshPowerText(likeCount)   ---likeCount 点赞次数
    self.Text_Power().text = MgrLanguageData.GetLanguageByKey("friend_ui_tips3").."<color=#43ffe2>"..math.floor(likeCount *SteamLocalData.tab[117000][2]).."</color>/"..math.floor(SteamLocalData.tab[117000][2] * SteamLocalData.tab[117001][2])
end

---好友列表动效
function M:FriendListScrollFirstShow(content)
    MgrTimer.Cancel("ListContent")
    content.fillAmount = 0
    MgrTimer.AddRepeat("ListContent",0.005,function()
        content.fillAmount = content.fillAmount + 0.05
    end,20,nil)
end
---发送搜索好友请求
function M:SendSearchFriendRREQ(id)
    FriendViewModel.GetFriendSearchREQ(id,Handle(self,self.GetFriendSearchNTF))
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("ListContent")
    MgrTimer.Cancel("RefreshCD")

end

---红点开关
function M:CheckRedDot(count)
    if count > 0 then
        self.ApplyRedDotIcon().gameObject:SetActive(true)
        self.ApplyNRedDotIcon().gameObject:SetActive(true)
    else
        self.ApplyRedDotIcon().gameObject:SetActive(false)
        self.ApplyNRedDotIcon().gameObject:SetActive(false)
        RedDotControl.GetDotData("Friend"):SetState(false)
    end
end

--region 界面切换
--- 切换好友删除界面显示
---@param bIsOn boolean @ 开启/退出好友删除界面
function M:SwitchFriendDeletePanel(bIsOn)
    self.CurDeleteType = bIsOn
    self.Img_FriendCoin().transform.parent.gameObject:SetActive(not bIsOn)
    self.Btn_FriendBatchDelete().gameObject:SetActive(bIsOn)
    FriendViewModel.ClearBatchSelectFriendList()
    self:ReloadListData()
end
--endregion 界面切换

--region 控件操作
---@param bIsOn boolean
function M:SetBlockApplyToggleWidgets(bIsOn)
    self.Img_BlockNormal_Icon().transform.parent.gameObject:SetActive(not bIsOn)
    self.Img_BlockHighlight_Icon().transform.parent.gameObject:SetActive(bIsOn)
end

---@param deletedFriendIds long[]
function M:UpdateDataAndPanelAfterDelete(deletedFriendIds)
    if not deletedFriendIds then
        return
    end
    -- 当前好友数量
    self.curFriendCount = self.curFriendCount - #deletedFriendIds
    -- 显示好友数量
    self.Text_Haoyoushu().text = string.format("%s<color=#febf2c>%d</color>/%d", 
            MgrLanguageData.GetLanguageByKey("friend_ui_friends"), self.curFriendCount, SteamLocalData.tab[117007][2])
    -- 刷新列表
    self:ReloadListData(0)
end
--endregion 控件操作

--region 事件回调
---@param bIsOn boolean
---@param friendData FriendServerData
function M:OnFriendItemBatchDeleteToggle(bIsOn, friendData)
    if not friendData then
        return
    end
    if bIsOn then
        FriendViewModel.AddBatchSelectFriend(friendData)
    else
        FriendViewModel.RemoveBatchSelectFriend(friendData.userID)
    end
end

---@protected
function M:OnBtnFriendBatchDeleteClick()
    if FriendViewModel.CountBatchSelectFriendList() == 0 then
        Global.PopTip("frienditem_deletetips2")
    else
        Global.PopConfirm("frienditem_deletetips1", function()
            -- REQ 会处理 FriendViewModel 内部数据
            FriendViewModel.BatchDeleteFriendsREQ(FriendViewModel.BatchSelectFriendList, 
                function(tab)
                    -- 该回调要处理界面内部数据，避免发送 GetFriendInfoREQ
                    self:UpdateDataAndPanelAfterDelete(tab.friendID)
                end)
        end)
    end
end

---@protected
function M:OnBtnBlockApplyClick()
    if FriendViewModel.IsFriendApplyBlocked() then
        FriendViewModel.FriendApplyBlockREQ(false)
    else
        Global.PopConfirm("frienditem_applytips1", function()
            FriendViewModel.FriendApplyBlockREQ(true)
        end)
    end
end
--endregion 事件回调

return M