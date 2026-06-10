-- Code Auto Create Begin
local M = Class('CardBuyPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CardBuyPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CardBuyPop].prefab'
    self.Name = 'Form[CardBuyPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','BlurBg',2},{'Img_bg','PopPanel/Img_bg',2},{'Img_Xian2','PopPanel/Img_Xian2',2},{'Img_Xian1','PopPanel/Img_Xian1',2},{'Btn_Confirm','PopPanel/Btn_Confirm',2},{'Img_Quedingdi','PopPanel/Btn_Confirm/Img_Quedingdi',2},{'Btu_Cancel','PopPanel/Btu_Cancel',2},{'Img_Quxiaodi','PopPanel/Btu_Cancel/Img_Quxiaodi',2},{'Img_Biaotixian','PopPanel/Img_Biaotixian',2},
        -- TextMeshProUGUI 列表
        {'Text_Queding','PopPanel/Btn_Confirm/Text_Queding',20},{'Text_Quxiao','PopPanel/Btu_Cancel/Text_Quxiao',20},{'Text_Txt','PopPanel/Text_Txt',20},{'Text_Title','PopPanel/Text_Title',20},
    }
end
-- Code Auto Create End
require("LocalData/SteamLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        if self.CancelFunc ~= nil then
            self.CancelFunc()
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(pData)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    local title = pData[1]
    ---@type ItemData
    local targetItem = pData[2]
    local totalNeed = pData[3]
    self.DrawFunc = pData[5]
    self.CancelFunc = pData[6]
    local realNeed = totalNeed - targetItem.count;

    local costs = nil;
    local exchanges = string.split(SteamLocalData.tab[113038][2], ",");
    for _, exchange in ipairs(exchanges) do
        local exchangeArr = string.split(exchange,"_");
        if targetItem.id == tonumber(exchangeArr[1]) then
            costs = {};
            for i = 2, #exchangeArr, 1 do
                local product = SteamLocalData.tab[tonumber(exchangeArr[i])];
                if nil ~= product then
                    local productArr = string.split(product[2], ";");
                    local priceInfo = ItemControl.ParsePriceString(productArr[2]);
                    table.insert(costs, {
                        productId = tonumber(productArr[1]);
                        item = priceInfo.item,
                        price = priceInfo.price,
                    });
                end
            end
            break;
        end
    end
    if nil ~= costs and #costs > 2 then
        -- 若cost多于2种，界面多语言不能容纳，报个警
        UnityEngine.DebugEx.LogError("Too many costs for id: " .. targetItem.id);
    end
    if nil ~= costs and #costs > 0 then
        if 1 == #costs or costs[1].item.count >= realNeed * costs[1].price then
            -- cost只有1种，或第1种cost就够支付了
            self.Text_Txt().text = string.format(MgrLanguageData.GetLanguageByKey("cardbuypop_tips6"),
                    realNeed, targetItem.name, costs[1].item.name, realNeed * costs[1].price);
            UIEvent.LuaClick(self.Btn_Confirm().gameObject, Handle(self,function ()
                if costs[1].item.count >= realNeed * costs[1].price then
                    ShopViewModel.CardSendBuyGoods({{ id = costs[1].productId, count = realNeed, }}, self.DrawFunc);
                elseif costs[1].item.id == 100008 then
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("need_more_diamond"), 1 }, true)
                else
                    MgrUI.Pop(UID.ExchangePop_UI,{ tonumber(SteamLocalData.tab[113042][2]), 0, "shop" });
                end
                MgrUI.ClosePop(self.Uid);
            end));
        elseif costs[1].item.count >= costs[1].price then
            -- cost有2种，需要花费若干个cost1和若干个cost2
            local need1 = math.floor(costs[1].item.count / costs[1].price);
            local need2 = realNeed - need1;
            self.Text_Txt().text = string.format(MgrLanguageData.GetLanguageByKey("cardbuypop_tips10"),
                    realNeed, targetItem.name, costs[1].item.name, need1 * costs[1].price, costs[2].item.name, need2 * costs[2].price);
            UIEvent.LuaClick(self.Btn_Confirm().gameObject, Handle(self,function ()
                if costs[2].item.count >= need2 * costs[2].price then
                    ShopViewModel.CardSendBuyGoods({{ id = costs[1].productId, count = need1, }, { id = costs[2].productId, count = need2, }}, self.DrawFunc);
                elseif costs[1].item.id == 100008 then
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("need_more_diamond"), 1 }, true)
                else
                    MgrUI.Pop(UID.ExchangePop_UI,{ tonumber(SteamLocalData.tab[113042][2]), 0, "shop" })
                end
                MgrUI.ClosePop(self.Uid)
            end));
        else
            -- 剩下情况都显示第二种
            self.Text_Txt().text = string.format(MgrLanguageData.GetLanguageByKey("cardbuypop_tips6"),
                    realNeed, targetItem.name, costs[2].item.name, realNeed * costs[2].price);
            UIEvent.LuaClick(self.Btn_Confirm().gameObject, Handle(self,function ()
                if costs[2].item.count >= realNeed * costs[2].price then
                    ShopViewModel.CardSendBuyGoods({{ id = costs[2].productId, count = realNeed, }}, self.DrawFunc);
                elseif costs[1].item.id == 100008 then
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("need_more_diamond"), 1 }, true)
                else
                    MgrUI.Pop(UID.ExchangePop_UI,{ tonumber(SteamLocalData.tab[113042][2]), 0, "shop" })
                end
                MgrUI.ClosePop(self.Uid)
            end));
        end
    elseif Global.Contains(string.split(SteamLocalData.tab[113039][2],","),tostring(targetItem.id)) then
        self.Text_Txt().text = string.format(MgrLanguageData.GetLanguageByKey("cardbuypop_tips5"), targetItem.name)
        ---确认购买
        UIEvent.LuaClick(self.Btn_Confirm().gameObject,Handle(self,function ()
            MgrUI.GoHide(UID.Shop_UI)
            MgrUI.ClosePop(self.Uid)
        end))
    end

    self.Text_Title().text = title   ---标题
    ---点背景返回
    UIEvent.LuaClick(self.BlurBg().gameObject,Handle(self,function ()
        if self.CancelFunc ~= nil then
            self.CancelFunc()
        end
        MgrUI.ClosePop(self.Uid)
    end))
    UIEvent.LuaClick(self.Btu_Cancel().gameObject,Handle(self,function ()
        if self.CancelFunc ~= nil then
            self.CancelFunc()
        end
        MgrUI.ClosePop(self.Uid)
    end))
end

return M