-- Code Auto Create Begin
local M = Class('CoreSkillItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CoreSkillItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'bg','bg',2},{'Img_Bianhaodi','Img_Bianhaodi',2},{'Img_Feng','Img_Feng',2},{'Img_Feng01','Img_Feng',2},{'rightbg','rightbg',2},
        -- Text 列表
        {'Title_Cooling','Title_Cooling',3},{'Title_Time','Title_Time',3},{'Title_Target','Title_Target',3},{'Title_Trigger','Title_Trigger',3},{'Text_Target','Text_Target',3},{'Text_Time','Text_Time',3},{'Text_Trigger','Text_Trigger',3},{'Text_Cooling','Text_Cooling',3},{'Text_SkillDes','Text_SkillDes',3},{'Text_SkillName','Text_SkillName',3},{'Text_Number','Text_Number',3},
        -- UITemplate 列表
        {'CoreSkillItem','/',10},
    }
end
-- Code Auto Create End
require("LocalData/TxtLocalData")

function M:OnUpdateUI(pData)
    local skillData = pData[1]
    local object,trgger = self:GetTxt(skillData[15],skillData[14])
    self.Text_Target().text = object
    self.Text_Trigger().text = trgger

    local txtLocalData_Time = TxtLocalData.tab[180003]  --文本表持续时间
    if skillData[16] == "-1" then
        self.Text_Time().text = string.split(txtLocalData_Time[4],"_")[2]
    elseif skillData[16] == "0" then
        self.Text_Time().text = string.split(txtLocalData_Time[5],"_")[2]
    elseif skillData[16] == "1" then
        self.Text_Time().text = string.split(txtLocalData_Time[6],"_")[2]
    end

    --self.Text_Time().text = skillData[16]
    if skillData[7] == 0 then
        self.Text_Cooling().text = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_none")
    else
        self.Text_Cooling().text = skillData[7]
    end
    --self.Text_Cooling().text = skillData[7]
    local txt = (string.gsub(skillData[6], "(%b[])", function (x)
        x = "return " .. string.sub(x, 2, -2)*100
        local f = load(x)
        return f()
    end))
    if txt then
        self.Text_SkillDes().text = txt
    else
        self.Text_SkillDes().text = skillData[6]
    end
    self.Text_SkillName().text = skillData[12]
    self.Text_Number().text = pData[2]
end

function M:GetTxt(object,Trigger)
    local objtxt = nil
    local triggertxt = nil

    ---获取技能对象
    for i, v in pairs(TxtLocalData.tab[180002]) do
        if i ~= 1 and i ~= 2 and i ~= 3 then
            local arr = JNStrTool.strSplit("_",v)
            if tonumber(arr[1])== object then
                objtxt = arr[2]
                break
            end
        end
    end
    ---获取技能触发条件
    for i, v in pairs(TxtLocalData.tab[180001]) do
        if i ~= 1 and i ~= 2 and i ~= 3 then
            local arr = JNStrTool.strSplit("_",v)
            if tonumber(arr[1])== Trigger then
                triggertxt = arr[2]
                break
            end
        end
    end
    return objtxt,triggertxt
end

return M