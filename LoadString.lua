local shared = (getgenv and getgenv()) or _G

if shared.XclusiveUI then return shared.XclusiveUI end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/Module.lua"))()

shared.XclusiveUI = Library
return Library