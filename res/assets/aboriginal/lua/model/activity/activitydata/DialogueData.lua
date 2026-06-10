---@class DialogueData 物品数据
DialogueData = Class("DialogueData")
-------------构造方法-------------
function DialogueData:ctor(data)
    self.picIdA = "0"                       ---角色A图片
    self.dialogueA = "0"                    ---角色A对话
    self.positionAx = "0"                   ---角色A坐标x
    self.positionAy = "0"                   ---角色A坐标y
    self.picIdB = "0"                       ---角色B图片
    self.dialogueB = "0"                    ---角色B对话
    self.positionBx = "0"                   ---角色B坐标x
    self.positionBy = "0"                   ---角色B标y
    self.music = "0"                        ---背景音乐
    self.nameA = "0"                        ---角色A名称
    self.nameB = "0"                        ---角色B名称
    self.talkDataA = nil                    ---角色A文本表数据
    self.talkDataB = nil                    ---角色B文本表数据
    self.talkRoleA = nil                    ---角色A的roleId
    self.talkRoleB = nil                    ---角色B的roleId
    if data then
        self.picIdA = data.picida
        local str = string.split(data.dialoguea,'_')
        if str[1] == "talk" then
            self.talkDataA = ActorLinesLocalData.tab[tonumber(str[2])]
            self.talkRoleA = tonumber(str[3])
        else
            self.dialogueA = data.dialoguea
        end
        self.positionAx = data.positionax
        self.positionAy = data.positionay
        self.picIdB = data.picidb
        str = string.split(data.dialogueb,'_')
        if str[1] == "talk" then
            self.talkDataB = ActorLinesLocalData.tab[tonumber(str[2])]
            self.talkRoleB = tonumber(str[3])
        else
            self.dialogueB = data.dialogueb
        end
        self.positionBx = data.positionbx
        self.positionBy = data.positionby
        self.music = data.bgm
        self.nameA = data.namea
        self.nameB = data.nameb
    end
end

return DialogueData