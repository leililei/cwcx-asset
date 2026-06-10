-- Code Auto Create Begin
local M = Class('CoreChipGroupPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CoreChipGroupPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CoreChipGroupPop_UI].prefab'
    self.Name = 'Form[CoreChipGroupPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Panel','Panel',2},{'Img_Xian4','Img_Xian4',2},{'Img_Xian3','Img_Xian3',2},{'Img_Biaotixian1','Img_Biaotixian1',2},{'Btn_Min','hechengshuliang/Btn_Min',2},{'Btn_Sub','hechengshuliang/Btn_Sub',2},{'Img_-','hechengshuliang/Btn_Sub/Img_-',2},{'Btn_Max','hechengshuliang/Btn_Max',2},{'Btn_Add','hechengshuliang/Btn_Add',2},{'Img_+','hechengshuliang/Btn_Add/Img_+',2},{'Img_Hechengshuliaodi','hechengshuliang/Img_Hechengshuliaodi',2},{'Img_Biaotixian2','hechengshuliang/Img_Biaotixian2',2},{'Img_Suipianshudi2','hechengxiaohao/Img_Suipianshudi2',2},{'Img_Suipianshudi1','hechengxiaohao/Img_Suipianshudi1',2},{'Img_Biaotixian3','hechengxiaohao/Img_Biaotixian3',2},{'Btn_Synthesis','Btn_Synthesis',2},
        -- UITemplate 列表
        {'BagItem','hechengxiaohao/BagItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Title','Text_Title',20},{'Text_Min','hechengshuliang/Btn_Min/Text_Min',20},{'Txet_Max','hechengshuliang/Btn_Max/Txet_Max',20},{'Text_Count','hechengshuliang/Img_Hechengshuliaodi/Text_Count',20},{'Txet_Hechengshuliang','hechengshuliang/Txet_Hechengshuliang',20},{'Txet_Yiyousuipian','hechengxiaohao/Img_Suipianshudi2/Txet_Yiyousuipian',20},{'Text_CuChipCount','hechengxiaohao/Img_Suipianshudi2/Text_CuChipCount',20},{'Txet_Xiaohaosuipian','hechengxiaohao/Img_Suipianshudi1/Txet_Xiaohaosuipian',20},{'Text_CsChipCount','hechengxiaohao/Img_Suipianshudi1/Text_CsChipCount',20},{'Text_CoreChipName','hechengxiaohao/Text_CoreChipName',20},{'Txet_Hechengxiaohao','hechengxiaohao/Txet_Hechengxiaohao',20},{'Txet_Hecheng2','Btn_Synthesis/Txet_Hecheng2',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---取消/关闭
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    ---确认回调
    UIEvent.LuaClick(self.Btn_Synthesis().gameObject,function()
        self:ClosePop()
        if self.callback and self.curNum > 0 then
            self.callback(self.curNum)
        end
    end)
    ---最小数
    UIEvent.LuaClick(self.Btn_Min().gameObject,function()
        self:SetNumber(1)
    end)
    ---减少
    UIEvent.AlwaysLongClick(self.Btn_Sub().gameObject,function()
        if self.curNum > 1 then
            self:SetNumber(self.curNum - 1)
        end
    end)
    ---最大数
    UIEvent.LuaClick(self.Btn_Max().gameObject,function()
        self:SetNumber(self.maxChipCount > self.maxNum and self.maxNum or self.maxChipCount)
    end)
    ---增加
    UIEvent.AlwaysLongClick(self.Btn_Add().gameObject,function()
        local curNum = self.maxChipCount > self.maxNum and self.maxNum or self.maxChipCount
        if self.curNum + 1 > curNum then
            return
        end
        self:SetNumber(self.curNum + 1)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        self:ClosePop()
    end
end

---更新显示 参数1：碎片数据，参数2：背包剩余空间，参数3：回调（数量）
function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    ---@type CoreChipData
    self.pData = args[1]
    self.maxNum = args[2]
    self.callback = args[3]
    self.maxChipCount = math.floor(self.pData.count / self.pData.consumeCount)
    self:SetNumber(self.maxChipCount > self.maxNum and self.maxNum or self.maxChipCount)
    ---更新碎片信息
    self.Text_CoreChipName().text = self.pData.name
    self.BagItem():SetData({self.pData,self})
    --self.RedDot().gameObject:SetActive(false)
end

---设置数量
function M:SetNumber(num)
    self.curNum = num
    --self.Text_Count().text = self.curNum
    local count = JNStrTool.numberAbbr(self.pData.count) --self.pData.count >= 10000 and math.floor(self.pData.count/1000).."K" or self.pData.count
    self.Text_CuChipCount().text = count
    local csNum = self.curNum * self.pData.consumeCount
    local strNum = csNum >= 10000 and math.floor(csNum/1000).."K" or csNum
    self.Text_Count().text = string.format("<color=%s>%s</color>",(csNum <= self.pData.count and self.curNum <= self.maxNum) and "#FFFFFF" or "#FF3552" ,self.curNum)
    --strNum = string.format("<color=%s>%s</color>",(csNum <= self.pData.count and self.curNum <= self.maxNum) and "#FFCB62" or "#FF3552" ,strNum)
    self.Text_CsChipCount().text = strNum
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end
return M