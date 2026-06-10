---@class AsmrData

AsmrData = Class('AsmrData')
---构造方法
function AsmrData:ctor()
    self.Id = 0                                     ---ID
    self.SkinId = 0                                 ---皮肤ID
    self.GroupId = 0                                ---动作组
    self.Line = ""                                 ---台词
    self.RoleAni = nil                              ---角色动画
    self.FrontAni = nil                             ---前景动画
    self.BackAni = nil                             ---后景动画
    self.Audio = nil                                ---语音
    self.UnlockItem = nil                           ---解锁道具
    self.Bgm = nil                                  ---背景音乐
end

function AsmrData:PushConfig(_config)
    self.Id = _config.id
    self.SkinId = _config.characterID
    self.GroupId = _config.group
    self.Line = _config.chinese~="0" and _config.chinese or _config.chinese
    self.RoleAni = _config.spine~="0" and _config.spine or nil
    self.SceneAni = _config.frontbackanim~="0" and _config.frontbackanim or nil
    if _config.frontbackanim ~= "0" then
        local tStr = string.split(_config.frontbackanim,',')
        self.FrontAni = tStr[1]~="0" and tStr[1] or nil
        self.BackAni = tStr[2]~="0" and tStr[2] or nil
    end
    self.Audio = _config.japaneseaudio~="0" and _config.japaneseaudio or nil
    self.UnlockItem = _config.unlock~="0" and _config.unlock or nil
    self.Bgm = _config.bgm~="0" and _config.bgm or nil
end

return AsmrData