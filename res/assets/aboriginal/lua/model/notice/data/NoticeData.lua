---@class NoticeData 技能描述信息

NoticeData = Class('NoticeData')
---构造方法
function NoticeData:ctor()
    self.id = 0                 ---ID
    self.type = 0               ---公告类型(1.活动公告,2.游戏公告)
    self.groupID = 0            ---公告组
    self.sortID = 0             ---公告组()
    self.title = ""             ---公告标题(左侧页签)
    self.notice = {}            ---公告内容
    self.openTime = ""          ---开启时间
    self.closeTime = ""         ---结束时间
    
    self.strSub = {
        [1] = { "\\n","\n" },
        [2] = { "\\t","\t" },
        [3] = { "\\r","\r" },
        [4] = { "\\v","\v" },
        [5] = { "\\a","\a" },
        [6] = { "\\f","\f" },
        [7] = { "\\b","\b" },
        [8] = { "\\0","\0" },
    }
end
---配置公告数据
function NoticeData:PushConfig(_config)
    self.id = _config.id
    self.type = _config.type
    local tNoticeID = string.split(_config.groupid, ",")
    self.groupID = tonumber(tNoticeID[1])
    self.sortID = tonumber(tNoticeID[2])
    self.title = _config.title
    self.openTime = _config.opentime
    self.closeTime = _config.closetime

    self:PushNoticeCfg(_config)
end

function NoticeData:PushNoticeCfg(_config)
    local tNoticeID = string.split(_config.groupid, ",")
    self.notice[tonumber(tNoticeID[2])] = {
        ---公告图片名称
        ImgName = _config.picture,
        ---文本标题
        name = _config.name,
        ---内容文本
        txt = _config.txt,
        ---图片跳转ID
        imgLinkId = _config.picturegotoid,
    }
end

---服务器公告数据(Tag:公告类型;公告组;公告标题;开启时间 Title:公告图片名称;文本标题 Text:内容文本)
function NoticeData:PushServerData(data)
    self.type = tonumber(data.type)
    local tNoticeID = string.split(data.group, ",")
    self.groupID = tonumber(tNoticeID[1])
    self.sortID = tonumber(tNoticeID[2])
    self.title = data.title
    self.openTime = data.openTime
    self.closeTime = data.closeTime
    
    self:PushNoticeData(data)
end

function NoticeData:PushNoticeData(data)
    local tGroup = string.split(data.group, ",")
    for i = 1, #self.strSub do
        data.context = string.gsub(data.context,self.strSub[i][1],self.strSub[i][2])
    end
    self.notice[tonumber(tGroup[2])] = {
        ---公告图片名称
        ImgName = data.img,
        ---文本标题
        name = data.contextTitle and data.contextTitle or "",
        ---内容文本
        txt = data.context,
        ---图片跳转ID
        imgLinkId = data.imgTo
    }
end

return NoticeData