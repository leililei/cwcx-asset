require("UI/ViewModel/StormViewModel")---战斗相关
---公告管理器
SysNoticeControl = {}

SysNoticeControl.SysNoticeData = {}
SysNoticeControl.SysNoticeObj = nil
---开启跑马灯
function SysNoticeControl.CheckNotice(data)
    if data ~= nil then
        for i, v in ipairs(data) do
            if SysNoticeControl.CheckMsg(v) then
                local isChange = false
                for n = 1, #SysNoticeControl.SysNoticeData do
                    if SysNoticeControl.SysNoticeData[n].id == v.id then
                        SysNoticeControl.SysNoticeData[n] = v
                        isChange = true
                    end
                end
                if not isChange then
                    table.insert(SysNoticeControl.SysNoticeData,v)
                end
            end
        end
    else
        SysNoticeControl.SysNoticeData = {}
    end
    
    ---播放走马灯
    SysNoticeControl.PlayMsg()
end
---注册跑马灯推送监听
function SysNoticeControl.RegisterMarqueeNtf()
    MgrNet.RegisterNTF(MID.CLIENT_MARQUEE_NTF,function(buffer,tag)
        ---收到商品推送
        local info = assert(pb.decode('PBClient.ClientMarqueeNTF',buffer))
       
        SysNoticeControl.CheckNotice(info.marquee)
    end)
end
---播放走马灯
function SysNoticeControl.PlayMsg()
    ---剧情模式不给公告
    if StormViewModel == nil or not StormViewModel.IsPlotStarting then
        MgrUI.Pop(UID.SystemNotice_UI,{ SysNoticeControl.SysNoticeData },true)
    end
end

function SysNoticeControl.CheckMsg(_msg)
    ---检查是否存在时间区间内,需要播放的公告
    if _msg ~= nil then
        if Global.GetCurTime() >= _msg.startTime and Global.GetCurTime() < _msg.stopTime then
            return true
        end
    end
    
    return false
end

function SysNoticeControl.CloseSysNoticeUI()
    MgrUI.ClosePop(UID.SystemNotice_UI)
end

function SysNoticeControl.SetSysNoticeObj(obj)
    SysNoticeControl.SysNoticeObj = obj
end

function SysNoticeControl.SetSysNoticeOffsetY(posY)
    --if SysNoticeControl.SysNoticeObj then
    --    SysNoticeControl.SysNoticeObj:SetOffsetY(posY)
    --end
end

function SysNoticeControl.Clear()
    SysNoticeControl.SysNoticeData = {}
    SysNoticeControl.SysNoticeObj = nil
end

function SysNoticeControl.Hide()
    if SysNoticeControl.SysNoticeObj then
        SysNoticeControl.SysNoticeObj:HideUI()
    end
end
function SysNoticeControl.Show()
    if SysNoticeControl.SysNoticeObj then
        SysNoticeControl.SysNoticeObj:ShowUI()
    end
end

return SysNoticeControl
