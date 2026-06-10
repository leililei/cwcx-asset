require("JNUI/JNCollection")
require("JNBattle/JNStrTool")
require("JNUI/JNRoleData")
require("ReadData/PlayerData")
MailData ={}
MailData.tab = {
            ----1----------2-----------3------------4------------5-----------6------------7----------8------------------9---------------------------10----------11------------12------------13----
            --邮件ID----邮件状态码---邮件样式---邮件类型(系统?)--邮件标题--邮件剩余时间--邮件发送日期---发送者头像--物品数据信息({ID_Sum;ID_Sum....})--邮件正文内容--第一个物品ID----第一个物品数量---发送者名字
  MailList={

  }
}
MailData.MailListCount=0
--更新邮箱列表
function MailData.InitMailAll(_LuaCallBackName)
  -- statements
  HttpCore.GetMailList("MailData.InitMailList",MailData.InitMailList,_LuaCallBackName)
end


--更新MailList数据到字典中
function MailData.InitMailList(_Str,_JsonCount,_LuaCallBackName)
  -- statements
  if _Str ~= nil and _JsonCount>0 then
    -- statements
      HttpCore.CreatAnalyisJsonData(_Str,"MailListData")
      MailData.InitMailBag("MailListData",_JsonCount)
      if _LuaCallBackName ~=nil and _LuaCallBackName ~= "" then
        -- statements
        Event.Go(_LuaCallBackName)
      end
  else
    MailData.InitMailBag("MailListData",_JsonCount)
    if _LuaCallBackName ~=nil and _LuaCallBackName ~= "" then
      -- statements
      Event.Go(_LuaCallBackName)
    end
  end
end
--根据JsonDataKey在字典中找到MailList信息并进行更新
function  MailData.InitMailBag(_JsonData,_JsonCount)
  -- statements
  MailData.tab.MailList={}
  MailData.MailListCount=0
  for i = 0, _JsonCount - 1, 1 do
    local MailDataTempTab={}
    local MailId=HttpCore.GetAnalyisDataByKey(_JsonData,"id",i)
    local MailState=HttpCore.GetAnalyisDataByKey(_JsonData,"emailState",i)
    local MailStyle=0
    local MailType=HttpCore.GetAnalyisDataByKey(_JsonData,"type",i)
    local MailTitle=HttpCore.GetAnalyisDataByKey(_JsonData,"title",i)
    local MailRestTime=HttpCore.GetAnalyisDataByKey(_JsonData,"expireTime",i)
    local MailSendTime=HttpCore.GetAnalyisDataByKey(_JsonData,"sendTime",i)
    local MailSendIcon=HttpCore.GetAnalyisDataByKey(_JsonData,"head",i)
    local MailSendName=HttpCore.GetAnalyisDataByKey(_JsonData,"name",i)
    local MainRewardId=""
    local MainRewardSum=0
    --解析到ItemList的json字符串
    local MailRewardJson=HttpCore.GetAnalyisDataByKey(_JsonData,"items",i)
    -- print("MailId"..MailId)
    -- print("MailState"..MailState)
    -- print("MailType"..MailType)
    -- print("MailTitle"..MailTitle)
    -- print("MailRestTime"..MailRestTime)
    -- print("MailSendTime"..MailSendTime)
    -- print("MailSendIcon"..MailSendIcon)
    -- print("MailRewardJson"..MailRewardJson)
    --用于存储拼接好的奖励品字符串
    local MailRewardData =""
    if MailRewardJson ~= "" then
      -- statements
      --创建解析字典
      HttpCore.CreatAnalyisJsonData(MailRewardJson,"TempMailReward"..i)
      --获取ItemList的Count
      local TempMailRewardCount = HttpRequestMGR.Instance:GetJsonListCount(MailRewardJson)
      --创建存储奖励物品信息表
      local _TempRewardTab={}
      for n = 0, TempMailRewardCount - 1, 1 do
        local _RewardId=HttpCore.GetAnalyisDataByKey("TempMailReward"..i,"goodsId",n)
        local _RewardCount=HttpCore.GetAnalyisDataByKey("TempMailReward"..i,"num",n)
        table.insert(_TempRewardTab,"".._RewardId.."_".._RewardCount)
        -- print("拼接邮件信息**************/////".."".._RewardId.."_".._RewardCount)
        if n == 0 then
          -- statements
          MainRewardId=_RewardId
          MainRewardSum=tonumber(_RewardCount)
        end
      end
      local _IsFirstKey=true
      --拼接奖励信息字符串
      for key, value in pairs(_TempRewardTab) do
        -- statements
        if _IsFirstKey == false then
          -- statements
          MailRewardData=MailRewardData..";"..value
        else
          MailRewardData=""..value
          _IsFirstKey=false
        end
      end
    else
      MailRewardData = ""
    end
    local MailContent=HttpCore.GetAnalyisDataByKey(_JsonData,"content",i)
    if MailSendIcon == "" then
      -- statements
      if MailRewardJson == "" then
        -- 普通无附件邮件
        MailStyle=3
      else
        -- 普通附件邮件
        MailStyle=4
      end
    else
      if MailRewardJson == "" then
        -- 头像无附件邮件
        MailStyle=1
      else
        -- 头像附件邮件
        MailStyle=2
      end
    end
    -- print("MailRewardData***********"..MailRewardData)
    table.insert(MailDataTempTab,MailId)
    table.insert(MailDataTempTab,MailState)
    table.insert(MailDataTempTab,MailStyle)
    table.insert(MailDataTempTab,MailType)
    table.insert(MailDataTempTab,MailTitle)
    table.insert(MailDataTempTab,MailRestTime)
    table.insert(MailDataTempTab,MailSendTime)
    table.insert(MailDataTempTab,MailSendIcon)
    table.insert(MailDataTempTab,MailRewardData)
    table.insert(MailDataTempTab,MailContent)
    table.insert(MailDataTempTab,MainRewardId)
    table.insert(MailDataTempTab,MainRewardSum)
    table.insert(MailDataTempTab,MailSendName)
    table.insert(MailData.tab.MailList,MailDataTempTab)
    MailData.MailListCount=MailData.MailListCount + 1 
  end
end
return MailData