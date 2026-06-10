-- Code Auto Create Begin
local M = Class('SystemNotice_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SystemNotice_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SystemNotice_UI].prefab'
    self.Name = 'Form[SystemNotice_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NoticeBg','NoticeBg',2},{'NoticeIcon','NoticeBg/NoticeIcon',2},
        -- TextMeshProUGUI 列表
        {'SysMsg','NoticeBg/Mask/SysMsg',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.mTimes = 1     ---播放的第几条消息
    self.mIsNeedOffset = true
    self.mCurNoticeText = ""    ---当前跑马灯消息
    self.NoticeBg().gameObject:SetActive(false)
    SysNoticeControl.SetSysNoticeObj(self)
    
    self.NoticeBg().gameObject:GetComponent("NoticeMove"):BindFinish(Handle(self,self.ResetMsg))
--[[    ---Boss关卡调整显示位置
    if StormViewModel ~= nil then
        if StormViewModel.CurPointData ~= nil and (StormViewModel.CurPointData.type == 15 or StormViewModel.CurPointData.type == 16 or StormViewModel.CurPointData.type == 998) then
            self:SetOffsetY(-274)
            self.mIsNeedOffset = false
        elseif StormViewModel.CurStormBossId ~= 0 or StormViewModel.CurStormAnaBossId ~= 0  then
            self:SetOffsetY(-274)
            self.mIsNeedOffset = false
        end
    end]]
end

function M:OnShow(args)
    self.mMsgData = args[1]     ---消息列表
    self:CheckMsg()
end
---播放消息结束后的回调,检查是否播放下一条消息
function M:ResetMsg()
    if #self.mMsgData == 0 or (#self.mMsgData ~= 0 and self.mMsgData[self.mTimes] ~= nil and self.mMsgData[self.mTimes].text ~= self.mNoticeText) then
        self:CheckMsg()
        return
    end
    if Global.GetCurTime() >= self.mMsgData[self.mTimes].startTime and Global.GetCurTime() < self.mMsgData[self.mTimes].stopTime then
        self.SysMsg().text = self.mMsgData[self.mTimes].text
    else
        self:CheckMsg()
    end
end
---根据消息列表的结束时间,播放消息
function M:CheckMsg()
    for i = self.mTimes, #self.mMsgData do
        if Global.GetCurTime() >= self.mMsgData[i].startTime and Global.GetCurTime() < self.mMsgData[i].stopTime then
            self.SysMsg().text = self.mMsgData[i].text
            self.mTimes = i
            self.mNoticeText = self.mMsgData[i].text

            self.NoticeBg().gameObject:SetActive(true)
            break
        end
    end

    if self.SysMsg().text == "" then
        MgrTimer.AddDelayNoName(0.1,function()
            MgrUI.ClosePop(UID.SystemNotice_UI)
        end)
    end
end

function M:SetOffsetY(posY)
    if self.mIsNeedOffset or posY > 0 then
        self.NoticeBg().transform.localPosition = Vector3(self.NoticeBg().transform.localPosition.x,self.NoticeBg().transform.localPosition.y+posY,0)
    end
    self.mIsNeedOffset = true
end

function M:HideUI()
    self.NoticeBg().gameObject:SetActive(false)
end
function M:ShowUI()
    self.NoticeBg().gameObject:SetActive(true)
end

function M:OnClose()
    SysNoticeControl.SetSysNoticeObj(nil)
end

return M