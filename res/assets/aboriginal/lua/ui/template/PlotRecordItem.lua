-- Code Auto Create Begin
local M = Class('PlotRecordItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlotRecordItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_IDtiao2','Text_Name/Img_IDtiao2',2},{'Img_Stop','Text_Name/Img_Stop',2},{'Img_Play','Text_Name/Img_Play',2},{'Tog_Play','Text_Name/Tog_Play',2},
        -- UITemplate 列表
        {'PlotRecordItem','/',10},
        -- Toggle 列表
        {'Tog_Play01','Text_Name/Tog_Play',13},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},{'Text_Content','Text_Content',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    self.tog = self.Tog_Play01()
    self.tog.group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup")
    Tools.ToggleValueChange(self.tog,function(isOn)
        self.Img_Play().gameObject:SetActive(not isOn)
        self.Img_Stop().gameObject:SetActive(isOn)
        if isOn then
            local v = self.pData.musics[6]
            if self.LastIsOn == true then
                MgrSound.Stop(5,"PlotRecord",true)
                self.Img_Play().gameObject:SetActive(true)
                self.Img_Stop().gameObject:SetActive(false)
                self.LastIsOn = false
            else
                --如果当前剧情正在播放音频 停止音频
                if MgrSound.CheckStatus(5,"5") == 2 then
                    MgrSound.Stop(5,"5",false)
                end
                MgrSound.PlayPlot(string.gsub(Tools.GetFileName(v.path)," ","_"),v.volume/100,0,false,0,0,"PlotRecord")
                self:ListenVoice()
                self.LastIsOn = true
            end
        end
    end,nil)
end
---更新
function M:OnUpdateUI(args)
    self.pData = args[1]
    self.parent = args[2]
    local name = string.gsub(self.pData.drama.name,'%[name]',string.format("<color=#ffc332>%s</color>",PlayerControl.GetPlayerData().nickname))
    self.Text_Name().text = name
    local _text = string.gsub(self.pData.drama.content,'%[wait]',"")
    self.Text_Content().text = string.gsub(_text,'%[name]',string.format("<color=#ffc332>%s</color>",PlayerControl.GetPlayerData().nickname))
    local audio = self.pData.musics[6].path
    self.Tog_Play().gameObject:SetActive(audio ~= "")
    --self.Img_Play().gameObject:SetActive(audio ~= "" and not self.tog.isOn)
    --self.Img_Stop().gameObject:SetActive(audio ~= "" and self.tog.isOn)
    self.Img_Play().gameObject:SetActive(true)
    self.Img_Stop().gameObject:SetActive(false)
    if name == "" and audio == "" then
        self.Text_Name().gameObject:SetActive(false)
    end
end

---监听语音是否结束
function M:ListenVoice()
    MgrTimer.Cancel("PlotRecordRoleVoice")
    MgrTimer.AddRepeat("PlotRecordRoleVoice",0.2,function()
        if  MgrSound.CheckStatus(5,"PlotRecord") == 3 then
            self.tog.isOn = false
            MgrTimer.Cancel("PlotRecordRoleVoice")
        end
    end,-1,self.ObjRoot)
end

return M