---@class AgetestLocalData
AgetestLocalData = {
id = 0,
age = "0",
title = "0",
desc = "0",
desc1 = "0",
desc2 = "0",
}
---@type AgetestLocalData[]
AgetestLocalData.tab = {
[1] = {id = 1, age = "0_16", title = "16歳未満", desc = "1ヶ月5,000円まで", desc1 = "1ヶ月は5,000円まで課金できます", desc2 = "18歳未満のお客様が課金するにあたり、保護者（親権者）の同意が必要です。課金について、保護者の同意を得ていますか？"},
[2] = {id = 2, age = "16_18", title = "16歳以上18歳未満", desc = "1ヶ月30,000円まで", desc1 = "1ヶ月は30,000円まで課金できます", desc2 = "18歳未満のお客様が課金するにあたり、保護者（親権者）の同意が必要です。課金について、保護者の同意を得ていますか？"},
[3] = {id = 3, age = "18_9999", title = "18歳以上", desc = "制限なし", desc1 = "課金の制限はありません", desc2 = "相違ありませんか？"},
}
return AgetestLocalData
