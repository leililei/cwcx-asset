---帮助VM
HelpViewModel = {}

require("LocalData/HelpLocalData")
HelpViewModel.CloseFunc = nil  --帮助界面执行回调

---跳转对应帮助框
function HelpViewModel.Go(SysNumber,CloseFunc)
    if CloseFunc then
        HelpViewModel.CloseFunc = CloseFunc
    end
    for i,v in pairs(HelpLocalData.tab) do
        if SysNumber == v[7] then
            MgrUI.Pop(UID.HelpPop_UI,{v[2],v[1]},true)
        end
    end
end

function HelpViewModel.Clear()
    HelpViewModel.CloseFunc = nil
end

return HelpViewModel