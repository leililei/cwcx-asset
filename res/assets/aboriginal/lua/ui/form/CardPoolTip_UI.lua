-- Code Auto Create Begin
local M = Class('CardPoolTip_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CardPoolTip_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CardPoolTip_UI].prefab'
    self.Name = 'Form[CardPoolTip_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Mask',2},{'bg','bg',2},{'Switch','bg/Switch',2},{'Img_Fengexian','bg/Switch/Img_Fengexian',2},{'Tog_Xiangqing','bg/Switch/Tog_Xiangqing',2},{'Xiangqing_h','bg/Switch/Tog_Xiangqing/Xiangqing_h',2},{'Img_tiao','bg/Switch/Tog_Xiangqing/Xiangqing_h/Img_tiao',2},{'Tog_Jilu','bg/Switch/Tog_Jilu',2},{'Jilu_h','bg/Switch/Tog_Jilu/Jilu_h',2},{'Img_tiao01','bg/Switch/Tog_Jilu/Jilu_h/Img_tiao',2},{'Viewport1','bg/Viewport1',2},{'Content','bg/Viewport1/loop/Content',2},{'Content01','bg/Viewport1/loop2/Content',2},{'Viewport2','bg/Viewport2',2},{'Leixing','bg/Viewport2/Content1/Leixing',2},{'Content2','bg/Viewport2/Content1/Content2',2},{'Content201','bg/Viewport2/Content1/Content2',2},{'JiluPrefab','bg/Viewport2/Content1/Content2/JiluPrefab',2},{'Img_xian','bg/Viewport2/Content1/Content2/JiluPrefab/Img_xian',2},{'Btn_You','bg/Viewport2/Content1/Qieye/Btn_You',2},{'Btn_Zuo','bg/Viewport2/Content1/Qieye/Btn_Zuo',2},
        -- UITemplate 列表
        {'CardPoolDetailPanel','bg/Viewport1/loop/CardPoolDetailPanel',10},{'PrizeDrawDetailPanel','bg/Viewport1/loop2/PrizeDrawDetailPanel',10},
        -- LoopScrollRect 列表
        {'loop','bg/Viewport1/loop',18},{'loop2','bg/Viewport1/loop2',18},
        -- TextMeshProUGUI 列表
        {'Text_Xiangqing','bg/Switch/Tog_Xiangqing/Xiangqing_h/Text_Xiangqing',20},{'Xiangqing','bg/Switch/Tog_Xiangqing/Xiangqing',20},{'Text_Jilu','bg/Switch/Tog_Jilu/Jilu_h/Text_Jilu',20},{'Jilu','bg/Switch/Tog_Jilu/Jilu',20},{'Text_Shuoming','bg/Viewport2/Text_Shuoming',20},{'Text_Leixing','bg/Viewport2/Content1/Leixing/Text_Leixing',20},{'Text_MingchengTitle','bg/Viewport2/Content1/Leixing/Text_MingchengTitle',20},{'Text_Shijian','bg/Viewport2/Content1/Leixing/Text_Shijian',20},{'Text_Zanwushuju','bg/Viewport2/Content1/Content2/JiluPrefab/Text_Zanwushuju',20},{'Text_Leixing01','bg/Viewport2/Content1/Content2/JiluPrefab/Text_Leixing',20},{'Text_Mingcheng','bg/Viewport2/Content1/Content2/JiluPrefab/Text_Mingcheng',20},{'Text_Shijian01','bg/Viewport2/Content1/Content2/JiluPrefab/Text_Shijian',20},{'Text_Ye','bg/Viewport2/Content1/Qieye/Text_Ye',20},
    }
end
-- Code Auto Create End
require("LocalData/DropLocalData")
require("LocalData/RoleattributeLocalData")
require("LocalData/RoleequipmentLocalData")
require("LocalData/RolerecruitLocalData")

function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Mask().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)

    UIEvent.LuaClick(self.Tog_Xiangqing().gameObject, function()
        self.toggleState = 0
        self:UpdateToggleState()
    end)

    UIEvent.LuaClick(self.Tog_Jilu().gameObject, function()
        self.toggleState = 1
        self:UpdateToggleState()

        --if self.lotteryLogList[self.lotteryLogPage] then
            --self:UpdateToggleState()
        --else
            self:SendLotteryLog()
        --end
        --self:UpdateLotteryPageTxt()
    end)
    -- self.currPoolID = 0
    self.cardInfo = {}
    self.toggleState = 0 --0:查看详情 1：当前卡池记录
    self.config_Role = RolerecruitLocalData.tab
    self.config_Equip = EquipmentsupplyLocalData.tab
    self.loop():SetLuaCellEvent(Handle(self,self.CellItem))
    self.loop2():SetLuaCellEvent(Handle(self,self.SpecialCellItem))
    --------------------------------抽卡记录--------------------------------
    UIEvent.LuaClick(self.Btn_Zuo().gameObject, function()
        if self.lotteryLogPage > 1 then
            self.lotteryLogPage = self.lotteryLogPage - 1
            --self:UpdateLotteryItemInfo()
            self:SendLotteryLog()
            --self:UpdateLotteryPageTxt()
        else
            --已达到最小页数
        end
    end)
    UIEvent.LuaClick(self.Btn_You().gameObject, function()
        if self.lotteryLogPage < self.lotteryLogTotalPage then
            self.lotteryLogPage = self.lotteryLogPage + 1
            --删除缓存
            -- if self.lotteryLogList[self.lotteryLogPage] then
            --     self:UpdateLotteryItemInfo()
            -- else
            --     self:SendLotteryLog()
            -- end
            self:SendLotteryLog()
            --self:UpdateLotteryPageTxt()
        else
            --已达到最大页数
        end
    end)

    self.lotteryLogPage = 1 --当前抽卡记录的页数
    self.lotteryLogTotalPage = 1 --抽卡记录的总页数
    self.lotteryLogTotalCount = 1 --抽卡记录的总数量
    self.lotteryLogPageSize = 5 --抽卡记录每一页的最大数量

    self.lotteryLogList = {} --抽卡记录列表
    self.lotteryLogPrefebList = {} --抽卡记录预制体列表

    self:CreateRecordPrefeb()
end

--更新toggle按钮状态
function M:UpdateToggleState()
    self.Viewport1().gameObject:SetActive(self.toggleState == 0)
    self.Xiangqing_h().gameObject:SetActive(self.toggleState == 0)

    self.Viewport2().gameObject:SetActive(self.toggleState ~= 0)
    self.Jilu_h().gameObject:SetActive(self.toggleState ~= 0)
end

function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.roleList[idx],self})
end

function M:SpecialCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.roleList[idx],idx,self})
    --刷新自适应组件
    Tools.ReSize(self.loop2().gameObject.transform:Find("Content").gameObject)
end

function M:OnUpdateUI()

end

function M:RefillCells(offset)
    if self.cardInfo.cardType == 4 then
        self.loop().gameObject:SetActive(false)
        self.loop2().gameObject:SetActive(true)
        self.loop2().totalCount =#self.roleList
        if offset then
            self.loop2():RefillCells(offset)
        else
            self.loop2():RefreshCells()
        end
    else
        self.loop().gameObject:SetActive(true)
        self.loop2().gameObject:SetActive(false)
        self.loop().totalCount =#self.roleList
        if offset then
            self.loop():RefillCells(offset)
        else
            self.loop():RefreshCells()
        end
    end
    self.CardPoolDetailPanel().gameObject:SetActive(false)
    self.PrizeDrawDetailPanel().gameObject:SetActive(false)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    self.cardInfo = args[1]
    if self.cardInfo.cardType == 4 then
        self.roleList = CardDrawControl.GetLightDarkDropList(self.cardInfo.id);
    elseif self.cardInfo.cardType == 5 then
        self.roleList = {};
        for key, val in pairs(self.cardInfo.rank) do
            table.insert(self.roleList, val)
        end
        table.insert(self.roleList,0)
    else
        self.roleList = self:GetItemList()
    end
    self:RefillCells()
    self:UpdateToggleState()
    self:UpdateRoleInfoTxt()
end

--获得当前卡池的列表
function M:GetItemList()
    local str
    if self.cardInfo.cardType == 1 or self.cardInfo.cardType == 3 then
        str = self.config_Role[self.cardInfo.id][3]
    else
        str = self.config_Equip[self.cardInfo.id][3]
    end
    local list = {}
    local dropList = string.split(str,',')
    for i, v in ipairs(dropList) do
        local tab = {}
        local t = string.split(v,'_')
        tab.star = tonumber(t[1])
        tab.id = tonumber(t[2])
        tab.weight = tonumber(t[3])
        tab.list = self:GetItemDataList(tab.id)
        tab.isExplain = false
        table.insert(list, tab)
    end
    --最后将说明面板数据添加
    table.insert(list, {isExplain = true})
    return list
end

--获得卡池角色数据列表4:ssr 3:sr 2
function M:GetItemDataList(id)
    local t = NormalCardDrawViewModel.CardDropList[id]
    return string.split(t,',')
end
-------------------抽卡记录-------------------
--创建抽卡记录预制体
function M:CreateRecordPrefeb()
    self.JiluPrefab().gameObject:SetActive(false)
    for i = 1, 5, 1 do
        local item = GameObject.Instantiate(self.JiluPrefab().gameObject, self.Content2().gameObject.transform, false)
        table.insert(self.lotteryLogPrefebList,item)
    end
end

---申请当前页的抽卡记录
function M:SendLotteryLog()
    local Filter = {
        iD = self.cardInfo.id
    }
    local ClientGetLotteryLogREQ = {
        filter = Filter,
        page = self.lotteryLogPage,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(self.cardInfo.id),
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetLotteryLogREQ',ClientGetLotteryLogREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_LOTTERY_LOG_REQ,bytes,0,nil,Handle(self,self.ClientGetLotteryLogACK),Handle(self,self.ClientGetLotteryLogNTF))
end
---申请当前页的抽卡记录返回
function M:ClientGetLotteryLogACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetLotteryLogACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        --抽卡记录申请失败
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
    end
    if 10021 == tab.extraErrNo then
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            --重启游戏
            MgrSdk.BackToLogin()
        end},true);
    end
end
function M:ClientGetLotteryLogNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetLotteryLogNTF',buffer))

    self.lotteryLogTotalPage = tab.total_page
    self.lotteryLogTotalCount = tab.total_count
    self.lotteryLogPageSize = tab.page_size
    if tab.log then
        --self.lotteryLogList[tab.page_num] = tab.log
        self:UpdateLotteryPageTxt()
    end
    self:UpdateLotteryItemInfo(tab.log)
end

--更新抽卡记录信息
function M:UpdateLotteryItemInfo(log)
    if log == nil then
        self.JiluPrefab().gameObject:SetActive(true)
        self.Text_Ye().gameObject:SetActive(false)
        self.Btn_You().gameObject:SetActive(false)
        self.Btn_Zuo().gameObject:SetActive(false)
        return
    end
    local list = log
    for i, v in ipairs(self.lotteryLogPrefebList) do
        local role
        if #list >= i then
            if list[i].goodsType == 30 then  --角色
                role = RoleattributeLocalData.tab[list[i].goodsID]
            elseif list[i].goodsType == 5 then
                role = RoleequipmentLocalData.tab[list[i].goodsID]  --装备
            else
                role = ItemControl.GetItemByIdAndType(list[i].goodsID,list[i].goodsType)  --物品
            end
            
            local Text_Leixing = v.transform:Find("Text_Leixing").transform:GetComponent("TextMeshProUGUI")
            Text_Leixing.gameObject:SetActive(true)

            local Text_Mingcheng = v.transform:Find("Text_Mingcheng").transform:GetComponent("TextMeshProUGUI")
            Text_Mingcheng.gameObject:SetActive(true)

            if self.cardInfo.cardType == 1 or self.cardInfo.cardType == 3 or self.cardInfo.cardType == 5 then
                Text_Leixing.text = self:GetLanguageType(role[5])
                Text_Mingcheng.text = role[2]
            elseif self.cardInfo.cardType == 2 then
                Text_Leixing.text = role[9]
                Text_Mingcheng.text = role[2]
            elseif self.cardInfo.cardType == 4 then
                if list[i].goodsType == 30 then
                    Text_Leixing.text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text61")
                    Text_Mingcheng.text = role[2]
                elseif list[i].goodsType == 5 then
                    Text_Leixing.text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text1")
                    Text_Mingcheng.text = role[2]
                else
                    Text_Leixing.text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text23")
                    Text_Mingcheng.text = role.name
                end
            end


            if list[i].goodsType == 30 or list[i].goodsType == 5 then
                if role[6] == 4 then
                    Text_Mingcheng.color = Color(0.8313726,0.3764706,0.2470588,1)
                elseif role[6] == 3 then
                    Text_Mingcheng.color = Color(0.4078431,0.2470588,0.8313726,1)
                else
                    Text_Mingcheng.color = Color(0,0,0,1)
                end
            else
                if role.quality == 4 then
                    Text_Mingcheng.color = Color(0.8313726,0.3764706,0.2470588,1)
                elseif role.quality == 3 then
                    Text_Mingcheng.color = Color(0.4078431,0.2470588,0.8313726,1)
                else
                    Text_Mingcheng.color = Color(0,0,0,1)
                end
            end

            local Text_Shijian = v.transform:Find("Text_Shijian").transform:GetComponent("TextMeshProUGUI")
            Text_Shijian.gameObject:SetActive(true)
            Text_Shijian.text = os.date("%Y-%m-%d %H:%M:%S",list[i].time + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
            v.transform:Find("Text_Zanwushuju").gameObject:SetActive(false)
            v.gameObject:SetActive(true)
        else
            v.gameObject:SetActive(false)
        end
    end
end

--根据类型获得多语言
function M:GetLanguageType(type)
    local str
    if type == 1 then
        str = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_armour")
    elseif type == 2 then
        str = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_slugger")
    elseif type == 3 then
        str = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_firepower")
    elseif type == 4 then
        str = MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_supporter")
    end
    return str
end

--更新当前页数文本
function M:UpdateLotteryPageTxt()
    self.Text_Ye().text = self.lotteryLogPage
end

--更新驾驶员类型文本（角色记录显示驾驶员类型，装备记录显示所属驾驶员）
function M:UpdateRoleInfoTxt()
    if self.cardInfo.cardType == 1 or self.cardInfo.cardType == 3 or self.cardInfo.cardType == 5 then
        self.Text_Leixing().text = MgrLanguageData.GetLanguageByKey("ui_gachahistory_4")
        self.Text_MingchengTitle().text = MgrLanguageData.GetLanguageByKey("ui_gachahistory_5")
    elseif self.cardInfo.cardType == 2 then
        self.Text_Leixing().text = MgrLanguageData.GetLanguageByKey("ui_gachahistory_14")
        self.Text_MingchengTitle().text = MgrLanguageData.GetLanguageByKey("ui_gachahistory_15")
    else
        --self.Text_Leixing().text = MgrLanguageData.GetLanguageByKey("ui_guangan7")
        --self.Text_MingchengTitle().text = MgrLanguageData.GetLanguageByKey("ui_guangan8")
        self.Text_Leixing().text = MgrLanguageData.GetLanguageByKey("ui_gachahistory_4")
        self.Text_MingchengTitle().text = MgrLanguageData.GetLanguageByKey("ui_gachahistory_5")
    end
end

return M