-- Code Auto Create Begin
local M = Class('SummerFrame_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SummerFrame_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SummerFrame_UI].prefab'
    self.Name = 'Form[SummerFrame_UI]'
    self.Layer = UILayerLv.Guide
    self.Depth = 12
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ClickBg','ClickBg',2},{'Frame_shang','Frame_shang',2},{'bg','Frame_shang/bg',2},{'triangle','Frame_shang/triangle',2},{'bgMask','Frame_shang/bgMask',2},{'HeadIcon','Frame_shang/HeadIcon',2},{'Img_Icon','Frame_shang/HeadIcon/Img_Icon',2},{'Frame_xia','Frame_xia',2},{'bg01','Frame_xia/bg',2},{'triangle01','Frame_xia/triangle',2},{'bgMask01','Frame_xia/bgMask',2},{'HeadIcon01','Frame_xia/HeadIcon',2},{'Img_Icon01','Frame_xia/HeadIcon/Img_Icon',2},
        -- TextMeshProUGUI 列表
        {'Text_txt','Frame_shang/Text_txt',20},{'Text_name','Frame_shang/Text_name',20},{'Text_txt01','Frame_xia/Text_txt',20},{'Text_name01','Frame_xia/Text_name',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.FrameMgr = {self.Frame_shang().gameObject, self.Frame_xia().gameObject}
    self.FrameUI = {
        [1] = { name = self.Text_name(), talktext = self.Text_txt(), headIcon = self.Img_Icon(), mask = self.bgMask() },
        [2] = { name = self.Text_name01(), talktext = self.Text_txt01(), headIcon = self.Img_Icon01(), mask = self.bgMask01() }
    }
    self.TalkData = nil
    self.TalkId = 1
    self.LogicType = nil
    self.LogicData = nil
    self.CurMask = nil
        
    for i = 1, #self.FrameMgr do
        self.FrameMgr[i]:SetActive(false)
    end

    ---全屏点击按钮逻辑
    UIEvent.LuaClick(self.ClickBg().gameObject,function()
        self.TalkId = self.TalkId + 1
        self:UpdateFrame()

    end,nil,self.ClickBg())
end

function M:OnShow(data)
    local tGroupID = data[1]
    self.LogicType = data[2]       ---逻辑格类型
    self.LogicData = data[3]       ---逻辑格信息(根据类型 可能是关卡信息或者事件ID)

    self.TalkData = SummerControl.GetTalkData(tGroupID)
    self.TalkId = 1
    
    self:UpdateFrame()
end

function M:UpdateFrame()
    if self.TalkId > #self.TalkData then
        if self.LogicData then
            if self.LogicType ~= SummerMapControl.LogicType.dialog then
                Event.Go("MapBattle",self.LogicData)
            else
                SummerMapControl.SendEventREQ(self.LogicData)
            end
        end
        Event.Go("MapMoveTouch", 1)
        Event.Go("DailogEventOff")
        MgrUI.ClosePop(self.Uid)
        return
    end
    local tData = self.TalkData[self.TalkId]
    if not self.FrameMgr[tData.locat].activeSelf then
        self.FrameMgr[tData.locat]:SetActive(true)
    end
    ---对话窗口名称
    self.FrameUI[tData.locat].name.text = string.gsub(tData.name,'%name',PlayerControl.GetPlayerData().nickname)
    ---对话窗口内容
    self.FrameUI[tData.locat].talktext.text = string.gsub(tData.text,'%[name]',PlayerControl.GetPlayerData().nickname)
    ---头像
    MgrRes.LoadSprite(self.FrameUI[tData.locat].headIcon,tData.icon)
    ---对话框遮罩
    if self.CurMask == self.FrameUI[tData.locat].mask then
        return
    end
    if self.CurMask ~= nil then
        self.CurMask.gameObject:SetActive(true)
    end
    self.CurMask = self.FrameUI[tData.locat].mask
    self.CurMask.gameObject:SetActive(false)
end

return M