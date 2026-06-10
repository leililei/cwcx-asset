---@class EnergyeffectLocalData
EnergyeffectLocalData = {
id = 0,
group = 0,
range = "0",
name = "0",
effect = "0",
txt = "0",
icon = "0",
background = "0",
}
---@type EnergyeffectLocalData[]
EnergyeffectLocalData.tab = {
[1] = {id = 1, group = 1, range = "51,100", name = "能源滿載", effect = "50000_0", txt = "能源滿載：我方除生命值外的全能力值增加30%", icon = "Activity/SBTM/Img_Nengyuan1", background = "Activity/SBTM/Img_Nengyuan1di"},
[2] = {id = 2, group = 1, range = "21,50", name = "能源充沛", effect = "50001_0", txt = "能源充沛：我方除生命值外的全能力值增加20%", icon = "Activity/SBTM/Img_Nengyuan2", background = "Activity/SBTM/Img_Nengyuan2di"},
[3] = {id = 3, group = 1, range = "-20,20", name = "能源平衡", effect = "50002_0", txt = "能源平衡：我方除生命值外的全能力值增加5%", icon = "Activity/SBTM/Img_Nengyuan3", background = "Activity/SBTM/Img_Nengyuan3di"},
[4] = {id = 4, group = 1, range = "-50,-21", name = "能源不足", effect = "50003_0", txt = "能源不足：我方除生命值外的全能力值減少20%", icon = "Activity/SBTM/Img_Nengyuan4", background = "Activity/SBTM/Img_Nengyuan4di"},
[5] = {id = 5, group = 1, range = "-100,-51", name = "能源臨界", effect = "50004_0", txt = "能源臨界：我方除生命值外的全能力值減少30%", icon = "Activity/SBTM/Img_Nengyuan5", background = "Activity/SBTM/Img_Nengyuan5di"},
}
return EnergyeffectLocalData
