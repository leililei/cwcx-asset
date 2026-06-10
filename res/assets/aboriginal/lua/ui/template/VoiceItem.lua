-- Code Auto Create Begin
local M = Class('VoiceItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/VoiceItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'VoiceItem','/',2},{'LockPanel','LockPanel',2},{'yuyindi','LockPanel/yuyindi',2},{'Btn_PlayAudio','LockPanel/Btn_PlayAudio',2},{'Btn_Pause','LockPanel/Btn_Pause',2},{'yuyinicon','LockPanel/yuyinicon',2},{'DocDesBg','DocDesBg',2},{'UnLockPanel','UnLockPanel',2},{'ziliaodi_weijiesuo','UnLockPanel/ziliaodi_weijiesuo',2},{'suo2','UnLockPanel/suo2',2},
        -- UITemplate 列表
        {'VoiceItem01','/',10},
        -- TextMeshProUGUI 列表
        {'VoiceClipNameText','LockPanel/VoiceClipNameText',20},{'DocContentText','DocDesBg/DocContentText',20},{'UnLockText','UnLockPanel/UnLockText',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---语音数据
    local data = pData[1]
    self.parent = pData[2]
    --local _VoiceType = TxtLocalData.tab[180005][3+data.type]
    --local name = JNStrTool.strSplit("_", _VoiceType)[2]
    self.id = data.id
    self.txt = ActorLinesLocalData.tab[self.id][7]
    ---语音名字
    self.VoiceClipNameText().text = MgrLanguageData.GetLanguageByKey("character_cv_type"..data.type)
    local _AudioPath = data.jpPath
    ---是否解锁
    if data.isLock then
        self.LockPanel().gameObject:SetActive(true)
        self.DocDesBg().gameObject:SetActive(false)
        self.UnLockPanel().gameObject:SetActive(false)
        self.Btn_PlayAudio().gameObject:SetActive(true)
        self.Btn_Pause().gameObject:SetActive(false)
        --self.SliderBg().gameObject:SetActive(false)
        --self.SliderEffect().transform:Find("Ui_TX_032").gameObject:SetActive(false)
        self.yuyinicon().transform:Find("Ui_TX_027").gameObject:SetActive(false)
    else
        self.LockPanel().gameObject:SetActive(false)
        self.DocDesBg().gameObject:SetActive(false)
        self.UnLockPanel().gameObject:SetActive(true)
        self.Btn_PlayAudio().gameObject:SetActive(false)
        self.Btn_Pause().gameObject:SetActive(false)
        self.UnLockText().text = string.format(MgrLanguageData.GetLanguageByKey("voiceitem_tips"),data.favor)
    end
    self:RebuildUI()
    UIEvent.LuaClick(self.Btn_PlayAudio().gameObject,Handle(self, function ()    --为开始按钮添加事件
        self.Btn_PlayAudio().gameObject:SetActive(false)
        self.yuyinicon().transform:Find("Ui_TX_027").gameObject:SetActive(true)
        --self.SliderEffect().transform:Find("Ui_TX_032").gameObject:SetActive(true)
        --self.SliderEffect().transform:Find("Ui_TX_032").transform:GetChild(0):GetComponent("Renderer").material:SetFloat("_Final",0)
        self.Btn_Pause().gameObject:SetActive(true)
        self.DocDesBg().gameObject:SetActive(true)
        self.DocContentText().text = self.txt
        self:RebuildUI()
        if self.parent.VoiceState == 2 then
            if self.id == self.parent.CurPlayAudioItem.id then
                MgrSound.Pause(3,"DocVoice")
                self.parent.VoiceState = 1
            else
                MgrSound.Pause(3,"DocVoice")
                self.parent:AudioClick(self.id,data.jpPath,Handle(self,self.ChangeClick),Handle(self,self.StopClick))
            end
        else
            self.parent:AudioClick(self.id,data.jpPath,Handle(self,self.ChangeClick),Handle(self,self.StopClick))
        end
    end))
    --- 点击暂停播放音频
    UIEvent.LuaClick(self.Btn_Pause().gameObject,Handle(self, self.PauseClick))
end

function M:StopClick()
    -- 停止播放音频
    self.parent.VoiceState = 3
    self.Btn_Pause().gameObject:SetActive(false)
    self.Btn_PlayAudio().gameObject:SetActive(true)
    self.yuyinicon().transform:Find("Ui_TX_027").gameObject:SetActive(false)
    --self.SliderEffect().transform:Find("Ui_TX_032").gameObject:SetActive(false)
    MgrSound.Stop(3,"DocVoice",false)
end

function M:ChangeClick()
    -- 点击停止播放音频
    MgrSound.Stop(3,"DocVoice",false)
    self.parent.VoiceState = 3
    self.Btn_Pause().gameObject:SetActive(false)
    self.Btn_PlayAudio().gameObject:SetActive(true)
    self.yuyinicon().transform:Find("Ui_TX_027").gameObject:SetActive(false)
    --self.SliderEffect().transform:Find("Ui_TX_032").gameObject:SetActive(false)
    self.DocDesBg().gameObject:SetActive(false)
    self:RebuildUI()
    Tools.ForceRebuildLayout(self.parent.VoiceContent().gameObject)      --Unity强制重新布局
end

function M:PauseClick()
    -- 点击暂停播放音频
    self.parent.VoiceState = 2
    self.Btn_Pause().gameObject:SetActive(false)
    self.Btn_PlayAudio().gameObject:SetActive(true)
    self.yuyinicon().transform:Find("Ui_TX_027").gameObject:SetActive(false)
    --self.SliderEffect().transform:Find("Ui_TX_032").gameObject:SetActive(false)
    MgrSound.Pause(3,"DocVoice")
end

function M:RebuildUI()
    Tools.ForceRebuildLayout(self.DocDesBg().gameObject)      --Unity强制重新布局
    Tools.ForceRebuildLayout(self.VoiceItem().gameObject)      --Unity强制重新布局
end
return M