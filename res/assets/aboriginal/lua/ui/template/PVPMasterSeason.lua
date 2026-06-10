-- Code Auto Create Begin
local M = Class('PVPMasterSeason', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPMasterSeason.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img1','Img1',2},{'Img2','Img2',2},{'Img3','Img3',2},{'Img4','Img4',2},{'Img5','Img5',2},{'Img6','Img6',2},{'Img7','Img7',2},{'Img8','Img8',2},{'Img9','Img9',2},{'Img0','Img0',2},{'ImgHead','ImgHead',2},{'ImgTail','ImgTail',2},
        -- UITemplate 列表
        {'PVPMasterSeason','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.m_numberImgs = {};
    self.m_numberImgs[1] = self.Img1().gameObject;
    self.m_numberImgs[2] = self.Img2().gameObject;
    self.m_numberImgs[3] = self.Img3().gameObject;
    self.m_numberImgs[4] = self.Img4().gameObject;
    self.m_numberImgs[5] = self.Img5().gameObject;
    self.m_numberImgs[6] = self.Img6().gameObject;
    self.m_numberImgs[7] = self.Img7().gameObject;
    self.m_numberImgs[8] = self.Img8().gameObject;
    self.m_numberImgs[9] = self.Img9().gameObject;
    self.m_numberImgs[0] = self.Img0().gameObject;
end
function M:OnUpdateUI(pData)
    local number = pData[1];
    local numbers = {};
    while (true) do
        local shang = math.floor(number / 10);
        local yushu = number - shang * 10;
        table.insert(numbers, 1, yushu);
        if 0 == shang then
            break;
        end
        number = shang;
    end
    for _, num in ipairs(numbers) do
        local item = GameObject.Instantiate(self.m_numberImgs[num], self.PVPMasterSeason().transform);
        item.gameObject:SetActive(true);
    end
    self.ImgTail().transform:SetAsLastSibling();
end
return M