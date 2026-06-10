-- Code Auto Create Begin
local M = Class('ScrollCardPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/Prefab/Template/ScrollCardPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'juandi1','juandi1',2},{'jianbiandi1','jianbiandi1',2},{'juanming1','juanming1',2},{'juantu1','juantu1',2},{'guang1','guang1',2},{'01','01',2},{'ScrollCardInfoPanel','ScrollCardInfoPanel',2},{'volume','ScrollCardInfoPanel/volume',2},{'dianxian(you)','ScrollCardInfoPanel/dianxian(you)',2},{'texiaoxian','ScrollCardInfoPanel/texiaoxian',2},{'NewChapterPanel','ScrollCardInfoPanel/NewChapterPanel',2},{'Btn_GoScroll','ScrollCardInfoPanel/Btn_GoScroll',2},{'CardLockPanel','ScrollCardInfoPanel/CardLockPanel',2},{'suozhezhao1','ScrollCardInfoPanel/CardLockPanel/suozhezhao1',2},{'yuan(suo)','ScrollCardInfoPanel/CardLockPanel/yuan(suo)',2},{'dian(suo)','ScrollCardInfoPanel/CardLockPanel/dian(suo)',2},{'suo1','ScrollCardInfoPanel/CardLockPanel/suo1',2},
        -- Text 列表
        {'ScrollIdText','ScrollCardInfoPanel/ScrollIdText',3},{'ScrollNameText','ScrollCardInfoPanel/ScrollNameText',3},
        -- UITemplate 列表
        {'ScrollCardPrefab','/',10},
    }
end
-- Code Auto Create End
---@param pData StormScrollData 商品信息
function M:OnUpdateUI(pData)
    self.scrollData = pData
    self.CardLockPanel().gameObject:SetActive(pData.isLock)
    self.ScrollNameText().text=""..pData.id
    ---添加点击事件
    UIEvent.LuaClick(self.Btn_GoScroll().gameObject,Handle(self,self.OnClick))
end

function M:OnClick()
    print("点击前往关卡".. self.scrollData.id)
end
return M