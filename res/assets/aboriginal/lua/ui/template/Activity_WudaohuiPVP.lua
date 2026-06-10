-- Code Auto Create Begin
local M = Class('Activity_WudaohuiPVP', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_WudaohuiPVP.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_WudaohuiPVP','/',2},{'EventName','TitleGroup/EventName',2},{'EventTime','TitleGroup/EventTime',2},{'Img_1','Paiming/Img_1',2},{'Btn_Avatar','Paiming/Img_1/Btn_Avatar',2},{'touxiangyuan','Paiming/Img_1/Btn_Avatar/touxiangyuan',2},{'PlayerIcon','Paiming/Img_1/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang','Paiming/Img_1/Btn_Avatar/touxiangkuang',2},{'Img_2','Paiming/Img_2',2},{'Btn_Avatar01','Paiming/Img_2/Btn_Avatar',2},{'touxiangyuan01','Paiming/Img_2/Btn_Avatar/touxiangyuan',2},{'PlayerIcon01','Paiming/Img_2/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang01','Paiming/Img_2/Btn_Avatar/touxiangkuang',2},{'Img_3','Paiming/Img_3',2},{'Btn_Avatar02','Paiming/Img_3/Btn_Avatar',2},{'touxiangyuan02','Paiming/Img_3/Btn_Avatar/touxiangyuan',2},{'PlayerIcon02','Paiming/Img_3/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang02','Paiming/Img_3/Btn_Avatar/touxiangkuang',2},{'Btn_Qianwanghuodong','Btn_Qianwanghuodong',2},{'Img_di','Btn_Qianwanghuodong/Img_di',2},{'Text_Raid','Btn_Qianwanghuodong/Text_Raid',2},
        -- UITemplate 列表
        {'Activity_WudaohuiPVP01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Date','TitleGroup/EventTime/Text_Date',20},{'Text_PlayerName','Paiming/Img_1/Text_PlayerName',20},{'Text_Lianshengcishu','Paiming/Img_1/Text_Lianshengcishu',20},{'Text_PlayerName01','Paiming/Img_2/Text_PlayerName',20},{'Text_Lianshengcishu01','Paiming/Img_2/Text_Lianshengcishu',20},{'Text_PlayerName02','Paiming/Img_3/Text_PlayerName',20},{'Text_Lianshengcishu02','Paiming/Img_3/Text_Lianshengcishu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TopRank = {
        [1] = { obj=self.Btn_Avatar(),headFrame=self.touxiangkuang(),headIcon=self.PlayerIcon(),name=self.Text_PlayerName(),winCount=self.Text_Lianshengcishu() },
        [2] = { obj=self.Btn_Avatar01(),headFrame=self.touxiangkuang01(),headIcon=self.PlayerIcon01(),name=self.Text_PlayerName01(),winCount=self.Text_Lianshengcishu01() },
        [3] = { obj=self.Btn_Avatar02(),headFrame=self.touxiangkuang02(),headIcon=self.PlayerIcon02(),name=self.Text_PlayerName02(),winCount=self.Text_Lianshengcishu02() }
    }
    ---进入武道会
    UIEvent.LuaClick(self.Btn_Qianwanghuodong().gameObject,function()
        BuDoukaiControl.OpenHome()
    end)
    ---活动时间
    local tActive = BuDoukaiControl.GetActivityData()
    if tActive and tActive.beginTime ~= "0" and tActive.endTime ~= "0" then
        local tBegin = string.split(tActive.beginTime,"-")
        local tEnd = string.split(tActive.endTime,"-")
        local tStr = tBegin[1].."/"..tBegin[2].."/"..tBegin[3].."~"..tEnd[1].."/"..tEnd[2].."/"..tEnd[3]
        self.Text_Date().text = tStr
    end
end

function M:OnUpdateUI(pData)
    BuDoukaiControl.RankReq(function(tab)
        for i, v in ipairs(self.TopRank) do
            if tab.info and tab.info[i] then
                ---头像
                PlayerControl.SetHeadIcon(v.headIcon, tab.info[i].head);
                ---头像框
                PlayerControl.SetHeadFrame(v.headFrame, tab.info[i].headFrame);
                v.obj.gameObject:SetActive(true)
                v.name.text = tab.info[i].nike
                v.winCount.text = string.format(MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text4"),tab.info[i].winCount)
            else
                v.obj.gameObject:SetActive(false)
                v.name.text = "--"
                v.winCount.text = "--"
            end
        end
    end)
end

return M