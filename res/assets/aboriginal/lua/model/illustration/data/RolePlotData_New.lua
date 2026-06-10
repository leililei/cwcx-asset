---@class RolePlotData_New
RolePlotData_New = Class('RolePlotData_New')

function RolePlotData_New:ctor()
    self.id = nil                       ---id
    self.typeId = nil                   ---类型
    self.roleId = nil                   ---角色id
    self.name = nil                     ---名称
    self.isShow = false                 ---是否显示
    self.pointId = nil                  ---解锁关卡
    self.chapterBg = nil                ---背景图
    --剧情
    self.plot_skinId = nil              ---皮肤ID
    self.plot_sort = nil                ---排序
    self.plot_number = nil              ---标题序号
    self.plot_first = nil               ---战前剧情
    self.plot_last = nil                ---战后剧情
    self.plot_picture = nil             ---剧情图
    self.plot_txt = nil                 ---剧情文本
    self.plot_point = nil               ---剧情解锁关卡（关卡和道具，只需满足一个条件可解锁）
    self.plot_item = nil                ---剧情解锁道具（关卡和道具，只需满足一个条件可解锁）
    --CG
    self.cg_skinId = nil                ---皮肤ID
    self.cg_group = nil                 ---分组
    self.cg_number = nil                ---排序
    self.cg_res = nil                   ---CG资源
    self.cg_picture = nil               ---CG图
    self.cg_author = nil                ---作者
    self.cg_resType = nil               ---CG资源类型（1.图 2.视频）
end
---@param data GuidechapterLocalData 角色总表数据
function RolePlotData_New:PushChapter(data)
    self.id = data.id               
    self.typeId = data.typeid       
    self.roleId = data.chapterid    
    self.name = data.chaptername    
    self.isShow = data.lock==1      
    self.pointId = data.checkpointid
    self.chapterBg = data.chapterbg
end

---@param data Plotguide2LocalData 角色剧情数据
function RolePlotData_New:PushPlot(data)
    self.id = data.sortid
    self.roleId = data.chapterid
    self.plot_skinId = data.skinid
    self.plot_sort = data.chaptersort
    self.plot_number = data.number
    self.plot_first = data.plot_first
    self.plot_last = data.plot_last
    self.plot_picture = data.picture
    self.plot_txt = data.introduction
    self.plot_point = data.checkpointid
    self.plot_item = data.unlockitem
end

---@param data Cgdex4LocalData 角色CG数据
function RolePlotData_New:PushCG(data)
    self.id = data.id
    self.roleId = data.chapterid
    self.cg_skinId = data.skinid
    self.cg_group = data.groupid
    self.cg_number = data.number
    self.cg_res = data.picture
    self.cg_picture = data.picturecover
    self.cg_author = data.name
    self.cg_resType = data.cgoranime
end

--判断解锁状态
function RolePlotData_New:CheckUnLock()
    if self.plot_point == nil or self.plot_item == nil then
        UnityEngine.DebugEx.Log("找不到解锁数据 \n关联ID："..tostring(self.id).." RoleID："..tostring(self.roleId))
        return false
    end
    --判断关卡解锁
    if self.plot_point == 0 or self.plot_item == "0" then
        return true
    end
    if StormControl.CheckPointPass(self.plot_point) then
        return true
    end
    --判断道具解锁
    local tStr = string.split(self.plot_item,'_')
    local item = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
    if item and item.count > 0 then
        return true
    end
    return false
end

return RolePlotData_New