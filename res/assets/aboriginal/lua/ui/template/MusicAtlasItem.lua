-- Code Auto Create Begin
local M = Class('MusicAtlasItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/MusicAtlasItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'MusicAtlasItem','/',2},{'AlbumPanel','AlbumPanel',2},{'ZhuanjiIcon','AlbumPanel/Zhuanji/ZhuanjiIcon',2},{'MusicPanel','MusicPanel',2},{'Music_Playing','MusicPanel/Music_Playing',2},{'Img_Musicdi_H','MusicPanel/Music_Playing/Img_Musicdi_H',2},{'TotalTime','MusicPanel/Music_Playing/TotalTime',2},{'Music_NotPlaying','MusicPanel/Music_NotPlaying',2},{'Img_Musicdi','MusicPanel/Music_NotPlaying/Img_Musicdi',2},{'TotalTime01','MusicPanel/Music_NotPlaying/TotalTime',2},{'Music_Suo','MusicPanel/Music_Suo',2},{'Img_Musicdi01','MusicPanel/Music_Suo/Img_Musicdi',2},{'TotalTime02','MusicPanel/Music_Suo/TotalTime',2},{'Img_Suo','MusicPanel/Music_Suo/Img_Suo',2},
        -- UITemplate 列表
        {'MusicAtlasItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_ZhuanjiName','AlbumPanel/Zhuanji/Text_ZhuanjiName',20},{'Text_Time','MusicPanel/Music_Playing/TotalTime/Text_Time',20},{'Text_TotalTime','MusicPanel/Music_Playing/TotalTime/Text_TotalTime',20},{'Text_MusicName','MusicPanel/Music_Playing/Text_MusicName',20},{'Text_Time01','MusicPanel/Music_NotPlaying/TotalTime/Text_Time',20},{'Text_TotalTime2','MusicPanel/Music_NotPlaying/TotalTime/Text_TotalTime2',20},{'Text_MusicName2','MusicPanel/Music_NotPlaying/Text_MusicName2',20},{'Text_LockTips','MusicPanel/Music_Suo/TotalTime/Text_LockTips',20},{'Text_Time02','MusicPanel/Music_Suo/TotalTime/Text_LockTips/Text_Time',20},{'Text_LockName','MusicPanel/Music_Suo/Text_LockName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.MusicPanel().gameObject,function()
        if StormControl.CheckPointPass(self.data.checkpointid) == false then
            return
        end
        if self.parent.CurMusicObj == self.ObjRoot then
            return
        end
        self.parent:PlayMusic(self.data)
        self.parent:ChangeMusicUI(self.parent.CurMusicObj,false)
        self.parent:ChangeMusicUI(self.ObjRoot,true)
    end)
end

function M:OnUpdateUI(Args)
    ---@type Cgdex3LocalData
    self.data = Args[1]
    self.parent = Args[2]
    ---专辑标题
    self.AlbumPanel().gameObject:SetActive(self.data.chaptersort == 1)
    ---专辑名
    self.Text_ZhuanjiName().text = self.data.chaptername
    ---乐曲名
    self.Text_MusicName().text = self.data.chaptersort.."."..self.data.name
    self.Text_MusicName2().text = self.data.chaptersort.."."..self.data.name
    ---时长
    self.timeStr = string.split(self.data.time,",")
    self.Text_TotalTime().text = self.timeStr[1]..":"..self.timeStr[2]
    self.Text_TotalTime2().text = self.timeStr[1]..":"..self.timeStr[2]
    ---解锁关卡是否为0
    if self.data.checkpointid == 0 then
        ---默认解锁
        self.Music_Playing().gameObject:SetActive(false)
        self.Music_NotPlaying().gameObject:SetActive(true)
        self.Music_Suo().gameObject:SetActive(false)
    else
        ---判断该关卡是否解锁
        if StormControl.CheckPointPass(self.data.checkpointid) == false then
            self.Music_Suo().gameObject:SetActive(true)
            self.Music_Playing().gameObject:SetActive(false)
            self.Music_NotPlaying().gameObject:SetActive(false)
            self.Text_LockName().text = self.data.chaptersort..". ???"
            self.Text_LockTips().text = StormControl.GetStormPointByID(self.data.checkpointid).idxName
            ---刷新自适应
            Tools.ReContentSizeGroup(self.Text_LockTips().gameObject)
        else
            self.Music_Playing().gameObject:SetActive(false)
            self.Music_NotPlaying().gameObject:SetActive(true)
            self.Music_Suo().gameObject:SetActive(false)
        end
    end
end

return M