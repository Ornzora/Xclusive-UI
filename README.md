# Xclusive UI

A reimagined customizable UI library for Roblox interfaces.

---

## Table of Contents

1. [Installation](#installation)
2. [Quick Start](#quick-start)
3. [Window](#window)
4. [Tab & Section](#tab--section)
5. [Elements](#elements)
6. [HUD](#hud)
7. [Notifications](#notifications)
8. [Widgets](#widgets)
9. [Config Manager](#config-manager)
10. [Flags](#flags)
11. [Themes](#themes)
12. [UI Keybind](#ui-keybind)
13. [Mobile](#mobile)
14. [Utilities](#utilities)
15. [Templates](#templates)
16. [Common Patterns](#common-patterns)
17. [Troubleshooting](#troubleshooting)

---

## Installation

**LoadString**
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
```
Cached in `getgenv().XclusiveUI` after the first load. Safe to call multiple times.

**Loader**
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Loader/Loader.lua"))()
```
Fetches `Games/<GameId>.lua`, falls back to `Games/Universal.lua`.

---

## Quick Start

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()

local Window  = Library:CreateWindow({ WindowName = "My Script", Color = Color3.fromRGB(0, 162, 255) })
local Section = Window:CreateTab("Main"):CreateSection("Features")

Section:CreateToggle("God Mode", false, function(state)
    print("God Mode:", state)
end)

Library:Notify("Ready", "Loaded successfully!", 4)
```

---

## Window

### `Library:CreateWindow(Config) -> Window`

| Key | Type | Default |
|-----|------|---------|
| `WindowName` | `string` | `"Developer Mode"` |
| `Color` | `Color3` | `Color3.fromRGB(255, 255, 255)` |
| `Keybind` | `Enum.KeyCode` | `Enum.KeyCode.F3` |
| `InitialWidth` | `number` | `500` |
| `InitialHeight` | `number` | `400` |
| `MinWidth` | `number` | `300` |
| `MaxWidth` | `number` | `800` |
| `MinHeight` | `number` | `100` |
| `MaxHeight` | `number` | `600` |

### Methods

| Method | Description |
|--------|-------------|
| `Window:CreateTab(name)` | Creates a tab. |
| `Window:ChangeColor(color)` | Changes accent color globally. |
| `Window:Toggle(bool)` | Show or hide the window. |
| `Window:SetBackground(imageId)` | Sets background image. |
| `Window:SetBackgroundColor(color)` | Sets background tint. |
| `Window:SetBackgroundTransparency(t)` | Sets background transparency. |
| `Window:SetTileOffset(x, y)` | Sets tile offset. |
| `Window:SetTileScale(x, y)` | Sets tile scale. |
| `Window:SetFont(font)` | Changes window font. |
| `Window:CreateGlow(bool, config?)` | Toggles UIStroke glow. |
| `Window:CreateParticles(bool, config?)` | Toggles particle effects. |
| `Window:Notify(title, content, duration?)` | Sends a notification. |
| `Window:Destroy()` | Destroys the window. |

---

## Tab & Section

```lua
local Tab     = Window:CreateTab("Combat")
local Section = Tab:CreateSection("Aimbot")
```

### Section Methods

| Method | Description |
|--------|-------------|
| `Section:SetVisible(bool)` | Show or hide the section. |
| `Section:IsVisible()` | Returns visibility state. |
| `Section:ToggleVisibility()` | Flips visibility. |
| `Section:Destroy()` | Destroys the section. |

All elements also have `SetVisible`, `IsVisible`, and `ToggleVisibility`.

---

## Elements

### Button

```lua
Section:CreateButton(name, callback, wrapText?) -> Element
```

```lua
Section:CreateButton("Kill All", function()
    -- ...
end)
```

| Method | Description |
|--------|-------------|
| `Button:UpdateColors()` | Refreshes color. |
| `Button:SetWrapText(bool)` | Toggle text wrapping. |
| `Button:CreateKeybind(bind, callback)` | Attach a hotkey. |
| `Button:GetKeybind()` | Returns the keybind element. |
| `Button:Destroy()` | Removes the button. |

---

### Toggle

```lua
Section:CreateToggle(name, default?, callback, wrapText?, flag?, status?) -> Element
```

`status`: `"normal"` `"buggy"` `"dangerous"`

```lua
Section:CreateToggle("ESP", false, function(state)
    setESP(state)
end, false, "esp", "normal")
```

| Method | Description |
|--------|-------------|
| `Toggle:SetState(bool)` | Set state, fires callback. |
| `Toggle:GetState()` | Returns current state. |
| `Toggle:UpdateColors()` | Refreshes colors. |
| `Toggle:CreateKeybind(bind, callback, mode?)` | Attach hotkey. Mode: `"toggle"` or `"hold"`. |
| `Toggle:GetKeybind()` | Returns keybind element. |
| `Toggle:ClosePallete()` | Closes attached color picker. |
| `Toggle:Destroy()` | Removes the toggle. |

---

### Slider

```lua
Section:CreateSlider(name, min, max, default?, precise?, callback, wrapText?, suffix?, flag?) -> Element
```

```lua
Section:CreateSlider("FOV", 0, 360, 90, true, function(v)
    workspace.CurrentCamera.FieldOfView = v
end, false, "°", "fov")
```

| Method | Description |
|--------|-------------|
| `Slider:SetValue(value)` | Set value, fires callback. |
| `Slider:GetValue()` | Returns current value. |
| `Slider:UpdateColors()` | Refreshes colors. |

---

### Dropdown / MultiDropdown

```lua
Section:CreateDropdown(name, options, callback, initial?, multi?, wrapText?, keepRemoved?, flag?) -> Element
```

Has a built-in search bar that filters options in real time.

```lua
-- Single
Section:CreateDropdown("Hitbox", { "Head", "Torso", "HRP" }, function(v)
    setHitbox(v)
end, "Head", false, false, false, "hitbox")

-- Multi
Section:CreateDropdown("Items", { "Sword", "Shield", "Potion" }, function(selected)
    -- selected = { Sword = true, ... }
end, nil, true)
```

| Method | Description |
|--------|-------------|
| `Dropdown:SetOption(value)` | Set selection, fires callback. |
| `Dropdown:AddOption(name)` | Add an option. |
| `Dropdown:RemoveOption(name)` | Remove an option. |
| `Dropdown:ClearOptions()` | Remove all options. |
| `Dropdown:ChangeOptions(table, initial?)` | Replace all options. |

---

### ColorPicker

```lua
Section:CreateColorpicker(name, callback, isAccent?, wrapText?, attachTo?) -> Element
```

```lua
-- Standalone
local cp = Section:CreateColorpicker("Color", function(color, alpha) end)

-- Attached to a Toggle (renders as a dot on the toggle row)
local t = Section:CreateToggle("ESP", false, function(s) end)
Section:CreateColorpicker("ESP Color", function(color) end, false, false, t)
```

| Method | Description |
|--------|-------------|
| `CP:UpdateColor(color, alpha?)` | Update programmatically. Does not fire callback. |
| `CP:GetValue()` | Returns `Color3, transparency`. |
| `CP:GetColor()` | Returns `Color3`. |
| `CP:GetTransparency()` | Returns transparency `0-1`. |
| `CP:SetTransparency(t)` | Set transparency. |
| `CP:IsRainbowEnabled()` | Returns rainbow state. |
| `CP:SetRainbow(bool)` | Enable/disable rainbow mode. |
| `CP:ClosePallete()` | Closes the picker popup. |
| `CP:Destroy()` | Destroys the picker. |

---

### TextBox

```lua
Section:CreateTextBox(name, default?, placeholder?, callback, wrapText?, flag?) -> Element
```

```lua
Section:CreateTextBox("Target", "", "Enter name...", function(text)
    targetPlayer = text
end, false, "target")
```

| Method | Description |
|--------|-------------|
| `TB:SetValue(text)` | Set text. |
| `TB:GetValue()` | Returns current text. |
| `TB:ToggleInput(bool)` | Enable/disable input. |
| `TB:UpdateColors()` | Refreshes colors. |

---

### Label

```lua
Section:CreateLabel(name, wrapText?) -> Element
```

```lua
local lbl = Section:CreateLabel("Status: Idle")
lbl:UpdateText("Status: Active")
```

| Method | Description |
|--------|-------------|
| `Label:UpdateText(text)` | Change displayed text. |
| `Label:SetWrapText(bool)` | Toggle text wrap. |
| `Label:Destroy()` | Removes the label. |

---

### Keybind

```lua
-- On a Button
button:CreateKeybind(Enum.KeyCode.V, function() end)

-- On a Toggle
toggle:CreateKeybind(Enum.KeyCode.G, function(state) end, "toggle")
```

Mode: `"toggle"` flips state each press. `"hold"` is active only while held.

---

### Divider

```lua
Section:CreateDivider()
```

| Method | Description |
|--------|-------------|
| `Divider:SetColor(color)` | Change line color. |
| `Divider:Destroy()` | Removes the divider. |

---

## HUD

Floating text overlay independent of the main window.

```lua
local hud = Library:Hud()
hud:SetText("FPS: 60"):SetTextColor(Color3.fromRGB(0, 255, 128)):SetTextSize(14)
```

All methods are chainable.

| Method | Description |
|--------|-------------|
| `Hud:SetText(text)` | Set text. |
| `Hud:GetText()` | Returns text. |
| `Hud:SetVisibility(bool)` | Show/hide. |
| `Hud:IsVisible()` | Returns visibility. |
| `Hud:SetTextColor(color)` | Set text color. |
| `Hud:SetTextSize(size)` | Set text size. |
| `Hud:SetFont(font)` | Set font. |
| `Hud:SetPadding(right, bottom, left, top)` | Set edge padding. |
| `Hud:SetDraggable(bool)` | Enable/disable dragging. |
| `Hud:SetPosition(udim2)` | Move the HUD. |
| `Hud:GetPosition()` | Returns position. |

---

## Notifications

Toast popups stacked in the bottom-right corner.

```lua
Library:Notify(title, content, duration?)
Window:Notify(title, content, duration?)
```

| Parameter | Type | Default |
|-----------|------|---------|
| `title` | `string` | required |
| `content` | `string` | required |
| `duration` | `number` | `15` |

```lua
Library:Notify("Loaded", "Script ready.", 4)
Library:Notify("Warning", "Unstable feature enabled.", 8)
```

---

## Widgets

Both widgets are PC only. On mobile they return a silent no-op object.

### KeybindViewer

```lua
local kbv = Library:CreateKeybindViewer({
    Visible          = true,
    Position         = UDim2.new(0, 10, 0, 100),
    UpdateInterval   = 0,
    ShowToggleStates = true,
    ShowOnlyActive   = true,
    Draggable        = true,
})
```

| Method | Description |
|--------|-------------|
| `KBV:SetVisible(bool)` | Show/hide. |
| `KBV:Toggle()` | Flip visibility. |
| `KBV:SetPosition(udim2)` | Move. |
| `KBV:ForceUpdate()` | Force refresh. |
| `KBV:SetTitle(text)` | Change header. |
| `KBV:GetKeybindCount()` | Returns entry count. |
| `KBV:Destroy()` | Removes the widget. |

### ToggleList

```lua
local tl = Library:CreateToggleList({
    Visible         = true,
    Position        = UDim2.new(0, 220, 0, 100),
    UpdateInterval  = 0,
    ShowOnlyEnabled = true,
    ShowStatus      = true,
    Draggable       = true,
    Title           = "Enabled Features",
})
```

| Method | Description |
|--------|-------------|
| `TL:SetVisible(bool)` | Show/hide. |
| `TL:Toggle()` | Flip visibility. |
| `TL:SetPosition(udim2)` | Move. |
| `TL:ForceUpdate()` | Force refresh. |
| `TL:SetTitle(text)` | Change header. |
| `TL:GetEnabledCount()` | Returns enabled count. |
| `TL:Destroy()` | Removes the widget. |

---

## Config Manager

Separate module. Saves and loads element states via executor filesystem APIs.

```lua
local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()

ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:BuildConfigSection(ConfigTab)  -- takes a Tab, creates the section inside
```

| Method | Description |
|--------|-------------|
| `ConfigManager:SetLibrary(lib)` | Required before `BuildConfigSection`. |
| `ConfigManager:SetWindow(win)` | Required before `BuildConfigSection`. |
| `ConfigManager:BuildConfigSection(tab)` | Builds full config UI inside the tab. |
| `ConfigManager:Save(name)` | Save current state. Returns `ok, err`. |
| `ConfigManager:Load(name)` | Load a config. Returns `ok, err`. |
| `ConfigManager:DeleteConfig(name)` | Delete a config file. |
| `ConfigManager:RefreshConfigList()` | Returns list of saved configs. |
| `ConfigManager:SetIgnoreIndexes(list)` | Exclude flags from save/load. |
| `ConfigManager:LoadAutoloadConfig()` | Runs autoload: place -> game -> global. |

**Supported element types:** Toggle, Slider, Dropdown, MultiDropdown, ColorPicker, AttachedColorPicker, TextBox, Button.

Requires executor filesystem support: `readfile`, `writefile`, `isfile`.

---

## Flags

Elements with a `flag` parameter register their value in `Library.flags[flagName]`.

```lua
Section:CreateToggle("ESP", false, function(s) end, false, "esp")
Section:CreateSlider("Speed", 16, 200, 16, true, function(v) end, false, nil, "speed")

-- Read from anywhere:
if Library.flags["esp"] then renderESP() end
print(Library.flags["speed"])
```

Flags persist across re-loads via `getgenv().XclusiveUI`.

---

## Themes

```lua
Library:GetThemes()           -- returns table of built-in theme configs
Library:SetTheme("Midnight")  -- apply a named theme
Window:ChangeColor(color)     -- change accent color, propagates to all elements
```

---

## UI Keybind

Default keybind is `F3`. Press to hide/show all windows.

```lua
Library:ChangeToggleKeybind(Enum.KeyCode.Insert)  -- change at runtime
Window:Toggle(false)  -- hide
Window:Toggle(true)   -- show
```

---

## Mobile

Detected via `UserInputService.TouchEnabled`. Stored in `Library.IsMobile`.

- F3 keybind is disabled.
- `KeybindViewer` and `ToggleList` return no-op dummies.
- All touch interactions work on Sliders, Dropdowns, Buttons, and ColorPickers.
- A ReopenButton is rendered for restoring a hidden UI.

```lua
if Library.IsMobile then
    Section:CreateButton("Toggle UI", function()
        Window:Toggle(false)
    end)
end
```

---

## Utilities

```lua
Library:SetWindowName("Script v2.0")  -- update title bar text
Library:GetTextBounds(text, font, size)  -- returns Vector2 pixel size
Library:ChangeToggleKeybind(keyCode)  -- change hide/show keybind
Library:Destroy()  -- destroy all UI and clear cache
```

Safe re-execution pattern:
```lua
if getgenv().XclusiveUI then
    getgenv().XclusiveUI:Destroy()
end
local Library = loadstring(game:HttpGet("...LoadString.lua"))()
```

---

## Templates

### Minimal

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()

local Window  = Library:CreateWindow({ WindowName = "Quick Script", Color = Color3.fromRGB(0, 162, 255) })
local Section = Window:CreateTab("Main"):CreateSection("Features")

Section:CreateToggle("God Mode", false, function(on) end, false, "godmode")
Section:CreateSlider("Speed", 16, 200, 16, true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end, false, nil, "speed")
Section:CreateButton("Teleport to Spawn", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 5, 0))
end)

Library:Notify("Quick Script", "Loaded!", 3)
```

---

### Advanced

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()

local Window = Library:CreateWindow({
    WindowName = "Advanced Script",
    Color      = Color3.fromRGB(255, 85, 85),
    Keybind    = Enum.KeyCode.F4,
})

-- Combat
local CombatTab = Window:CreateTab("Combat")
local AimSec    = CombatTab:CreateSection("Aimbot")

local aimbot = AimSec:CreateToggle("Aimbot", false, function(s) end, false, "aimbot")
aimbot:CreateKeybind(Enum.KeyCode.CapsLock, function(s) end, "toggle")

AimSec:CreateSlider("Smoothness", 0, 100, 40, true, function(v) end, false, "%", "smooth")
AimSec:CreateSlider("FOV", 10, 360, 120, true, function(v) end, false, "°", "fov")
AimSec:CreateDropdown("Hitbox", { "Head", "Torso", "HRP" }, function(v) end, "Head", false, false, false, "hitbox")
CombatTab:CreateSection("Silent Aim"):CreateToggle("Silent Aim", false, function(s) end, false, "silent", "dangerous")

-- ESP
local ESPTab    = Window:CreateTab("ESP")
local PlayerSec = ESPTab:CreateSection("Players")

local espToggle = PlayerSec:CreateToggle("Player ESP", false, function(s) end, false, "esp")
PlayerSec:CreateColorpicker("Box Color",  function(c, a) end, false, false, espToggle)
PlayerSec:CreateColorpicker("Name Color", function(c) end, false, false, espToggle)
PlayerSec:CreateSlider("Max Distance", 100, 3000, 1000, true, function(v) end, false, "studs", "esp_dist")
PlayerSec:CreateDivider()
PlayerSec:CreateToggle("Show Names",    true, function(s) end, false, "esp_names")
PlayerSec:CreateToggle("Show Health",   true, function(s) end, false, "esp_health")
PlayerSec:CreateToggle("Show Skeleton", false, function(s) end, false, "esp_skel", "buggy")

-- Movement
local MovTab = Window:CreateTab("Movement")
local MovSec = MovTab:CreateSection("Speed & Fly")

local fly = MovSec:CreateToggle("Fly", false, function(s) end, false, "fly")
fly:CreateKeybind(Enum.KeyCode.G, function(s) end, "toggle")
MovSec:CreateSlider("Walk Speed", 16, 300, 16, true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end, false, nil, "walkspeed")
MovSec:CreateSlider("Jump Power", 50, 500, 50, true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end, false, nil, "jumppower")
MovTab:CreateSection("Misc"):CreateToggle("Noclip", false, function(s) end, false, "noclip", "buggy")

-- Settings
local SettingsTab = Window:CreateTab("Settings")
SettingsTab:CreateSection("Theme"):CreateColorpicker("Accent Color", function() end, true)

local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()
ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:BuildConfigSection(SettingsTab)

-- Info
local InfoTab = Window:CreateTab("Info")
local StatSec = InfoTab:CreateSection("Stats")
local fpsLbl  = StatSec:CreateLabel("FPS: --")
local pingLbl = StatSec:CreateLabel("Ping: --")

game:GetService("RunService").Heartbeat:Connect(function(dt)
    fpsLbl:UpdateText(string.format("FPS: %d", math.round(1 / dt)))
    local ok, ping = pcall(function()
        return math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    if ok then pingLbl:UpdateText("Ping: " .. ping .. " ms") end
end)

-- HUD
local hud = Library:Hud()
hud:SetTextColor(Color3.fromRGB(255, 200, 0)):SetTextSize(13):SetPadding(10, 10, 0, 0)
game:GetService("RunService").Heartbeat:Connect(function()
    local active = {}
    if Library.flags["aimbot"] then table.insert(active, "Aimbot") end
    if Library.flags["esp"]    then table.insert(active, "ESP")    end
    if Library.flags["fly"]    then table.insert(active, "Fly")    end
    hud:SetText(#active > 0 and "Active: " .. table.concat(active, " | ") or "")
end)

-- Widgets
Library:CreateKeybindViewer({ Position = UDim2.new(0, 10, 0.5, 0) })
Library:CreateToggleList({ Position = UDim2.new(0, 230, 0.5, 0), ShowOnlyEnabled = true })

Library:Notify("Advanced Script", "Loaded.", 3)
```

---

### Admin Panel

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
local Players  = game:GetService("Players")

local Window = Library:CreateWindow({
    WindowName = "Admin Panel",
    Color      = Color3.fromRGB(80, 200, 120),
    Keybind    = Enum.KeyCode.F2,
})

-- Players tab
local PlayersTab = Window:CreateTab("Players")
local ActionSec  = PlayersTab:CreateSection("Actions")

local targetDrop = ActionSec:CreateDropdown("Target", {}, function(name) end)

local function refreshPlayers()
    targetDrop:ClearOptions()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= Players.LocalPlayer then targetDrop:AddOption(p.Name) end
    end
end
refreshPlayers()

Players.PlayerAdded:Connect(function(p)
    targetDrop:AddOption(p.Name)
    Library:Notify("Joined", p.Name, 3)
end)
Players.PlayerRemoving:Connect(function(p)
    targetDrop:RemoveOption(p.Name)
    Library:Notify("Left", p.Name, 3)
end)

ActionSec:CreateButton("Refresh", refreshPlayers)
ActionSec:CreateButton("Teleport to Target", function()
    local name = Library.flags["target"]
    local p = name and Players:FindFirstChild(name)
    if p and p.Character then
        Players.LocalPlayer.Character:MoveTo(p.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0))
    end
end)

-- Server tab with hidden advanced section
local ServerTab    = Window:CreateTab("Server")
local ServerSec    = ServerTab:CreateSection("Controls")
local AdvancedSec  = ServerTab:CreateSection("Advanced")
AdvancedSec:SetVisible(false)

ServerSec:CreateToggle("Show Advanced", false, function(s) AdvancedSec:SetVisible(s) end)
ServerSec:CreateToggle("Shutdown Lock", false, function(s) end, false, "shutdown_lock", "dangerous")

AdvancedSec:CreateTextBox("Announce", "", "Enter message...", function(msg)
    if msg ~= "" then Library:Notify("Announce", msg, 5) end
end, true)

-- Logs tab
local LogsTab = Window:CreateTab("Logs")
local LogSec  = LogsTab:CreateSection("Event Log")

Players.PlayerAdded:Connect(function(p)
    LogSec:CreateLabel(string.format("[%.0fs] JOIN: %s", os.clock(), p.Name))
end)
Players.PlayerRemoving:Connect(function(p)
    LogSec:CreateLabel(string.format("[%.0fs] LEAVE: %s", os.clock(), p.Name))
end)

-- Config
local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()
ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:BuildConfigSection(Window:CreateTab("Config"))

Library:Notify("Admin Panel", #Players:GetPlayers() .. " players online.", 4)
```

---

## Common Patterns

**Read state via flags**
```lua
if Library.flags["esp"] then renderESP() end
print(Library.flags["speed"])
```

**Programmatic update**
```lua
local s = Section:CreateSlider("Speed", 16, 200, 16, true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
s:SetValue(16)
s:GetValue()
```

**Exclusive toggle group**
```lua
local group = {}
local function addExclusive(name, flag)
    group[flag] = Section:CreateToggle(name, false, function(state)
        if state then
            for k, t in pairs(group) do
                if k ~= flag then t:SetState(false) end
            end
        end
    end, false, flag)
end
addExclusive("Mode: Passive",    "mode_passive")
addExclusive("Mode: Aggressive", "mode_aggro")
addExclusive("Mode: Stealth",    "mode_stealth")
```

**Dynamic dropdown**
```lua
local drop = Section:CreateDropdown("Target", {}, function(name) setTarget(name) end)

for _, p in pairs(game.Players:GetPlayers()) do drop:AddOption(p.Name) end
game.Players.PlayerAdded:Connect(function(p) drop:AddOption(p.Name) end)
game.Players.PlayerRemoving:Connect(function(p) drop:RemoveOption(p.Name) end)
```

**Conditional section**
```lua
local adv = Tab:CreateSection("Advanced")
adv:SetVisible(false)
Section:CreateToggle("Show Advanced", false, function(s) adv:SetVisible(s) end)
```

**Live label**
```lua
local lbl = Section:CreateLabel("FPS: --")
game:GetService("RunService").Heartbeat:Connect(function(dt)
    lbl:UpdateText(string.format("FPS: %d", math.round(1 / dt)))
end)
```

---

## Troubleshooting

**UI is invisible after `CreateWindow`**
Ensure you are on the latest `Module.lua`. The window now defaults to `gethui()` or `CoreGui` when no parent is passed.

**Clicks pass through the UI**
Update to the latest `Module.lua`. Orphan UI cleanup runs automatically in `CreateWindow`.

**Dropdown closes immediately after opening**
Wrap the trigger in `task.wait()` to let the input frame settle before the outside-click listener fires.

**Config not saving**
Requires `readfile`, `writefile`, and `isfile`. If your executor lacks these, the config section will not function.

**UI keybind does nothing on mobile**
The F3 keybind is disabled on mobile by design. Use `Window:Toggle(bool)` or a UI button instead.

**`Library:Notify` shows for 15 seconds**
The default duration is `15`. Pass an explicit value: `Library:Notify("Title", "Content", 4)`.

**Duplicate UI after re-execution**
Always call `Library:Destroy()` before re-running, or use the safe re-execution pattern in [Utilities](#utilities).
