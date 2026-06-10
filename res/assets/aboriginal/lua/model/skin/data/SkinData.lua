---@class SkinData
require("LocalData/ActorLinesLocalData")

SkinData = Class('SkinData')
---构造方法
function SkinData:ctor()
    self.Id = 0                                 ---ID
    self.SkinId = 0                             ---皮肤ID
    self.CurAniName = "0"                       ---当前皮肤名称
    self.Ondition = 0                           ---点击区域 0为不需要点击区域，自动播放
    self.AniPlay = {}                           ---动画 （点击动画,切换动画,台词,音频,前景动画,后景动画,权重,解锁道具）
    self.OpenAnim = "0"                         ---入场动画 0.spine(前景|角色|背景) 1.视频
    self.isDefault = false                      ---默认动作
    self.TotalWeight = 0                        ---该区域的总权重
end

function SkinData:PushConfig(_config,_default)
    self.Id = _config.id
    self.SkinId = _config.skinid
    self.CurAniName = _config.currentstate
    self.Ondition = _config.ondition
    self.OpenAnim = _config.openinganim~="0" and _config.openinganim or nil
    self.isDefault = _default
    
    local tStr = string.split(_config.animplay,';')
    for i, v in ipairs(tStr) do
        local tData = string.split(v,',')
        local ActorCfg = ActorLinesLocalData.tab[tonumber(tData[3])]
        local FrontBackAni = nil
        if ActorCfg and ActorCfg[15] ~= "0" then
            FrontBackAni = string.split(ActorCfg[15],',')
        end
        local list = {
            ---点击动画
            touchAni = tData[1],
            ---切换动画
            switchAni = tData[2]~="0" and tData[2] or nil,
            ---台词
            aniWorld = ActorCfg~=nil and ActorCfg[7] or nil,
            ---音频
            audioName = ActorCfg~=nil and ActorCfg[13] or nil,
            ---前景动画
            frontAni = FrontBackAni~=nil and FrontBackAni[1] or nil,
            ---后景动画
            backAni = FrontBackAni~=nil and FrontBackAni[2] or nil,
            ---权重
            weight = tonumber(tData[4]),
            ---解锁道具
            lockItem = tData[5]~="0" and string.split(tData[5],'_') or nil,
        }
        table.insert(self.AniPlay,list)

        self.TotalWeight = self.TotalWeight+tonumber(tData[4])
    end
end
---重置权重
function SkinData:ResetTotalWeight()
    self.TotalWeight = 0
    local BagItemData = nil
    for i, v in ipairs(self.AniPlay) do
        if v.lockItem then
            local itemData = v.lockItem
            BagItemData = ItemControl.GetItemByIdAndType(tonumber(itemData[2]),tonumber(itemData[1]))
        else
            self.TotalWeight = self.TotalWeight+v.weight
        end
        if BagItemData and BagItemData.count > 0 then
            self.TotalWeight = self.TotalWeight+v.weight
        end
    end
end

return SkinData