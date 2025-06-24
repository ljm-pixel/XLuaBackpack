Object:subClass("BasePanel")
BasePanel.panelObj = nil
BasePanel.controls = {}
BasePanel.isInitEvent = false -- 是否初始化事件

-- 初始化面板
function BasePanel:Init(name)
    if self.panelObj == nil then
        self.panelObj = ABMgr:LoadRes("ui", name, typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas, false)
        local allControls = self.panelObj:GetComponentsInChildren(typeof(UIBehaviour))--获取所有子物体
        -- 遍历所有子物体 按名字存储所需的控件
        for i = 0, allControls.Length-1 do
            local controlName = allControls[i].name
            if string.find(controlName, "btn") ~= nil or
               string.find(controlName, "tog") ~= nil or
               string.find(controlName, "img") ~= nil or
               string.find(controlName, "sv") ~= nil or
               string.find(controlName, "txt") ~= nil then
                local typeName = allControls[i]:GetType().Name-- 获取类名
                -- 最终存储形式
                -- { btnRole = {Image = 控件, Text = 控件}, togItem = {Image = 控件, Text = 控件} }
                if self.controls[controlName] ~= nil then
                    self.controls[controlName][typeName] = allControls[i]
                else
                    self.controls[controlName] = {[typeName] = allControls[i]}
                end
            end
        end
    end
end
-- 获取控件
function BasePanel:GetControl(name, typeName)
    if self.controls[name] ~= nil then
        local sameNameControls = self.controls[name]
        if sameNameControls[typeName] ~= nil then
            return sameNameControls[typeName]
        end
    end
    return nil
end

function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObj:SetActive(true)
end


function BasePanel:HideMe()
    self.panelObj:SetActive(false)
end