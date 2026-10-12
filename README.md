# Xclusive UI

A reimagined customizable UI library for Roblox interfaces.

---

## Features

- Smooth tween animations on all elements
- Modular element API: Button, Toggle, Slider, Dropdown, ColorPicker, TextBox, Label, Keybind, Divider
- Built-in config save/load system via ConfigManager
- Toast notifications and draggable HUD overlay
- Rainbow cycling mode on ColorPickers
- Mobile-aware via `UserInputService.TouchEnabled`
- Resizable and draggable window
- Floating widget overlays: KeybindViewer and ToggleList
- Shared flags table for cross-script state access
- Theme system with instant accent color propagation

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
18. [License](#license)

---

## Installation

**LoadString**
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
```
Cached in `getgenv().XclusiveUI` on first load. Safe to call multiple times in the same session.

**Loader**
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Loader/Loader.lua"))()
```
Fetches `Games/<GameId>.lua`. Falls back to `Games/Universal.lua` when no game-specific script exists.

---

## Quick Start

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()

local Window  = Library:CreateWindow({
    WindowName = "My Script",
    Color      = Color3.fromRGB(0, 162, 255),
    Keybind    = Enum.KeyCode.F3,
})

local Tab     = Window:CreateTab("Main")
local Section = Tab:CreateSection("Features")

Section:CreateToggle("God Mode", false, function(state)
    -- state = true/false
end, nil, nil, nil, "godmode")

Section:CreateSlider("Walk Speed", 16, 200, 16, true, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end, false, nil, "walkspeed")

Section:CreateButton("Teleport to Spawn", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 5, 0))
end)

Library:Notify("My Script", "Loaded successfully!", 4)
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

All unspecified keys use their defaults. The window is draggable and resizable by default.

### Window Methods

| Method | Description |
|--------|-------------|
| `Window:CreateTab(name)` | Creates and returns a Tab. |
| `Window:ChangeColor(color)` | Changes accent color. Propagates to all elements immediately. |
| `Window:Toggle(bool)` | Show (`true`) or hide (`false`) the window. |
| `Window:SetBackground(imageId)` | Sets a background image via asset ID string. |
| `Window:SetBackgroundColor(color)` | Sets background tint color. |
| `Window:SetBackgroundTransparency(t)` | Sets background transparency (`0` to `1`). |
| `Window:SetTileOffset(offset)` | Sets tile offset for tiled backgrounds. |
| `Window:SetTileScale(scale)` | Sets tile scale for tiled backgrounds. |
| `Window:SetFont(font)` | Changes font for all window text. |
| `Window:CreateGlow(bool, config?)` | Toggles a UIStroke glow effect on the window border. |
| `Window:CreateParticles(bool, config?)` | Toggles floating particle decorations. |
| `Window:Notify(title, content, duration?)` | Sends a toast notification. |
| `Window:Destroy()` | Destroys the window and all its children. |

---

## Tab & Section

```lua
local Tab     = Window:CreateTab("Combat")
local Section = Tab:CreateSection("Aimbot")
```

Tabs appear as clickable buttons at the top of the window. Sections are labeled groups inside a tab. Sections can be hidden or shown at runtime.

### Section Methods

| Method | Description |
|--------|-------------|
| `Section:SetVisible(bool)` | Show or hide the entire section. |
| `Section:IsVisible()` | Returns current visibility state. |
| `Section:ToggleVisibility()` | Flips visibility. |
| `Section:Destroy()` | Destroys the section and all its elements. |

All elements also expose `SetVisible`, `IsVisible`, and `ToggleVisibility`.

---

## Elements

### Button

```lua
Section:CreateButton(name, callback, wrapText?) -> Element
```

A clickable button. `callback` fires on press.

```lua
Section:CreateButton("Kill All", function()
    for _, player in pairs(game.Players:GetPlayers()) do
        -- handle kill
    end
end)

-- With hotkey
local btn = Section:CreateButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
btn:CreateKeybind(Enum.KeyCode.R, function() end)
```

| Method | Description |
|--------|-------------|
| `Button:UpdateColors()` | Refreshes color to match current accent. |
| `Button:SetWrapText(bool)` | Toggle label text wrapping. |
| `Button:CreateKeybind(bind, callback)` | Attach a keyboard hotkey. |
| `Button:GetKeybind()` | Returns the keybind element. |
| `Button:Destroy()` | Removes the button. |

---

### Toggle

```lua
Section:CreateToggle(name, default?, callback, status?, info?, wrapText?, flag?) -> Element
```

An on/off switch. `status` adds a colored badge to the label as a visual warning.

| `status` | Badge | Use case |
|----------|-------|----------|
| `"normal"` | None | Default, no badge |
| `"buggy"` | Yellow | Feature may be unstable |
| `"dangerous"` | Red | Feature may cause detection or bans |

```lua
-- Normal toggle with flag
Section:CreateToggle("ESP", false, function(state)
    setESP(state)
end, nil, nil, nil, "esp")

-- With status badge
Section:CreateToggle("Speed Hack", false, function(state) end, "buggy",     nil, nil, "speed")
Section:CreateToggle("Auto Farm",  false, function(state) end, "dangerous", nil, nil, "af")

-- With hold keybind
local fly = Section:CreateToggle("Fly", false, function(state) end, nil, nil, nil, "fly")
fly:CreateKeybind(Enum.KeyCode.G, function(state) end, "toggle")
```

| Method | Description |
|--------|-------------|
| `Toggle:SetState(bool)` | Set state programmatically. Fires callback. |
| `Toggle:GetState()` | Returns current state (`true`/`false`). |
| `Toggle:SetStatus(status)` | Set status badge (`"normal"`, `"buggy"`, `"dangerous"`). |
| `Toggle:GetStatus()` | Returns current status string. |
| `Toggle:SetInfo(text)` | Update the info tooltip text. |
| `Toggle:GetInfo()` | Returns current info text. |
| `Toggle:UpdateColors()` | Refreshes colors. |
| `Toggle:CreateKeybind(bind, callback, mode?)` | Attach hotkey. Mode: `"toggle"` (default) or `"hold"`. |
| `Toggle:GetKeybind()` | Returns the keybind element. |
| `Toggle:ClosePallete()` | Closes any attached color picker. |
| `Toggle:Destroy()` | Removes the toggle. |

---

### Slider

```lua
Section:CreateSlider(name, min, max, default?, precise?, callback, wrapText?, suffix?, flag?) -> Element
```

A draggable value slider. Set `precise = true` for integers, `precise = false` for decimals (2 decimal places).

```lua
-- Integer slider
Section:CreateSlider("Walk Speed", 16, 500, 16, true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end, false, nil, "walkspeed")

-- Decimal slider with suffix
Section:CreateSlider("FOV", 10, 130, 70, false, function(v)
    workspace.CurrentCamera.FieldOfView = v
end, false, "°", "fov")

-- Transparency
Section:CreateSlider("Opacity", 0, 1, 0.5, false, function(v)
    part.Transparency = v
end, false, nil, "opacity")
```

| Method | Description |
|--------|-------------|
| `Slider:SetValue(value)` | Set value programmatically. Fires callback. |
| `Slider:GetValue()` | Returns current value. |
| `Slider:UpdateColors()` | Refreshes colors. |

---

### Dropdown / MultiDropdown

```lua
Section:CreateDropdown(name, options, callback, initial?, multi?, wrapText?, keepRemoved?, flag?) -> Element
```

Has a built-in search bar that filters options in real time. Set `multi = true` for multi-select.

In multi-select mode, `callback` receives an array of selected option names:
```lua
{ "Sword", "Potion" }
```

```lua
-- Single select with default
Section:CreateDropdown("Hitbox", { "Head", "Torso", "HRP" }, function(v)
    setHitbox(v)
end, "Head", false, false, false, "hitbox")

-- Multi-select
Section:CreateDropdown("Enabled Items", { "Sword", "Shield", "Potion" }, function(selected)
    for _, item in ipairs(selected) do
        setItemEnabled(item, true)
    end
end, nil, true)

-- Dynamic options (e.g. player list)
local drop = Section:CreateDropdown("Target", {}, function(name) end)
for _, p in pairs(game.Players:GetPlayers()) do drop:AddOption(p.Name) end
game.Players.PlayerAdded:Connect(function(p) drop:AddOption(p.Name) end)
game.Players.PlayerRemoving:Connect(function(p) drop:RemoveOption(p.Name) end)
```

| Method | Description |
|--------|-------------|
| `Dropdown:SetOption(value)` | Set selection. Fires callback. |
| `Dropdown:AddOption(name)` | Appends an option. |
| `Dropdown:RemoveOption(name)` | Removes an option by name. |
| `Dropdown:ClearOptions()` | Removes all options. |
| `Dropdown:ChangeOptions(table, initial?)` | Replaces the full option list. |

---

### ColorPicker

```lua
Section:CreateColorpicker(name, callback, isAccent?, wrapText?, attachTo?) -> Element
```

Full HSV color picker with transparency slider and rainbow mode. Rainbow mode cycles through all hues every frame using `RunService.PreRender`.

Pass a toggle or button element to `attachTo` to render the picker as a small inline dot on that element's row.

```lua
-- Standalone picker
local cp = Section:CreateColorpicker("Highlight Color", function(color, alpha)
    setHighlight(color, alpha)
end)

-- Attached to a toggle (renders as inline dot)
local espToggle = Section:CreateToggle("ESP", false, function(s) end)
Section:CreateColorpicker("ESP Color", function(color, alpha)
    setESPColor(color, alpha)
end, false, false, espToggle)

-- Accent color picker (changes window accent on pick)
Section:CreateColorpicker("Accent", function(color) end, true)

-- Enable rainbow programmatically
cp:SetRainbow(true)
print(cp:IsRainbowEnabled())  -- true
```

| Method | Description |
|--------|-------------|
| `CP:UpdateColor(color, alpha?)` | Update color without firing callback. |
| `CP:GetValue()` | Returns `Color3, transparency`. |
| `CP:GetColor()` | Returns `Color3`. |
| `CP:GetTransparency()` | Returns transparency (`0` to `1`). |
| `CP:SetTransparency(t)` | Set transparency programmatically. |
| `CP:IsRainbowEnabled()` | Returns rainbow state. |
| `CP:SetRainbow(bool)` | Enable or disable rainbow mode. |
| `CP:ClosePallete()` | Closes the picker popup. |
| `CP:Destroy()` | Destroys the picker. |

---

### TextBox

```lua
Section:CreateTextBox(name, placeholder, numbersOnly, callback, wrapText?) -> Element
```

`callback` fires when the user presses Enter or unfocuses the field. The keybind system automatically blocks keybinds while a TextBox is focused.

```lua
Section:CreateTextBox("Target Player", "Enter username...", false, function(text)
    if text ~= "" then
        targetPlayer = game.Players:FindFirstChild(text)
    end
end)
```

| Method | Description |
|--------|-------------|
| `TB:SetValue(text)` | Set text programmatically. |
| `TB:GetValue()` | Returns current text. |
| `TB:ToggleInput()` | Toggle user input on/off. Returns new state (`true`/`false`). |
| `TB:UpdateColors()` | Refreshes colors. |

---

### Label

```lua
Section:CreateLabel(name, wrapText?) -> Element
```

Static text display. Useful for showing dynamic runtime values like FPS or ping.

```lua
local fpsLabel  = Section:CreateLabel("FPS: --")
local pingLabel = Section:CreateLabel("Ping: -- ms")

game:GetService("RunService").Heartbeat:Connect(function(dt)
    fpsLabel:UpdateText(string.format("FPS: %d", math.round(1 / dt)))
    local ok, ping = pcall(function()
        return math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    if ok then pingLabel:UpdateText("Ping: " .. ping .. " ms") end
end)
```

| Method | Description |
|--------|-------------|
| `Label:UpdateText(text)` | Changes the displayed text. |
| `Label:SetWrapText(bool)` | Toggle text wrapping. |
| `Label:Destroy()` | Removes the label. |

---

### Keybind

Hotkeys attached to Buttons or Toggles. Automatically blocked when a TextBox is focused.

```lua
-- Button hotkey
local btn = Section:CreateButton("Kill Aura", function() end)
btn:CreateKeybind(Enum.KeyCode.V, function() end)

-- Toggle: toggle mode (flips state on each press)
local aimbot = Section:CreateToggle("Aimbot", false, function(s) end)
aimbot:CreateKeybind(Enum.KeyCode.CapsLock, function(state) end, "toggle")

-- Toggle: hold mode (on while held, off on release)
local sprint = Section:CreateToggle("Sprint", false, function(s) end)
sprint:CreateKeybind(Enum.KeyCode.LeftShift, function(state) end, "hold")
```

| Mode | Behavior |
|------|----------|
| `"toggle"` | Flips state on each key press (default). |
| `"hold"` | Activates on press, deactivates on release. |

---

### Divider

```lua
Section:CreateDivider()
```

A horizontal separator line for grouping related elements visually.

```lua
Section:CreateToggle("Show Names",  true,  function(s) end)
Section:CreateToggle("Show Health", true,  function(s) end)
Section:CreateDivider()
Section:CreateToggle("Show Skeleton", false, function(s) end, "buggy")
```

| Method | Description |
|--------|-------------|
| `Divider:SetColor(color)` | Change the line color. |
| `Divider:Destroy()` | Removes the divider. |

---

## HUD

A floating text overlay rendered independently of the main window. Persists when the window is hidden. All methods are chainable.

```lua
local hud = Library:Hud()

hud:SetTextColor(Color3.fromRGB(0, 255, 128))
   :SetTextSize(14)
   :SetPadding(10, 10, 0, 0)
   :SetDraggable(true)

-- Live update showing active features
game:GetService("RunService").Heartbeat:Connect(function()
    local active = {}
    if Library.flags["aimbot"] then table.insert(active, "Aimbot") end
    if Library.flags["esp"]    then table.insert(active, "ESP")    end
    if Library.flags["fly"]    then table.insert(active, "Fly")    end
    hud:SetText(#active > 0 and "Active: " .. table.concat(active, " | ") or "")
end)
```

| Method | Description |
|--------|-------------|
| `Hud:SetText(text)` | Set display text. |
| `Hud:GetText()` | Returns current text. |
| `Hud:SetVisibility(bool)` | Show or hide. |
| `Hud:IsVisible()` | Returns visibility. |
| `Hud:SetTextColor(color)` | Set text color. |
| `Hud:SetTextSize(size)` | Set text size in pixels. |
| `Hud:SetFont(font)` | Set `Enum.Font`. |
| `Hud:SetPadding(right, bottom, left, top)` | Set edge padding in pixels. |
| `Hud:SetDraggable(bool)` | Enable or disable dragging. |
| `Hud:SetPosition(udim2)` | Move the HUD to a position. |
| `Hud:GetPosition()` | Returns current `UDim2` position. |

---

## Notifications

Toast popups that appear in the bottom-right corner and auto-dismiss after `duration` seconds.

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
Library:Notify("Loaded",   "Script is ready.",             4)
Library:Notify("Warning",  "Unstable feature enabled.",     8)
Library:Notify("Error",    "Target player not found.",      5)
Library:Notify("Joined",   player.Name .. " joined.",       3)
```

---

## Widgets

Floating overlays rendered outside the main window. **PC only.** On mobile they return a silent no-op object.

### KeybindViewer

Displays registered keybinds and their current toggle states.

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
| `KBV:SetVisible(bool)` | Show or hide. |
| `KBV:Toggle()` | Flip visibility. |
| `KBV:SetPosition(udim2)` | Move. |
| `KBV:ForceUpdate()` | Force a refresh. |
| `KBV:SetTitle(text)` | Change the header text. |
| `KBV:GetKeybindCount()` | Returns count of listed entries. |
| `KBV:Destroy()` | Removes the widget. |

### ToggleList

Displays all flagged toggles. Can be filtered to show only enabled ones.

```lua
local tl = Library:CreateToggleList({
    Visible         = true,
    Position        = UDim2.new(0, 220, 0, 100),
    UpdateInterval  = 0,
    ShowOnlyEnabled = true,
    ShowStatus      = true,
    Draggable       = true,
    Title           = "Active Features",
})
```

| Method | Description |
|--------|-------------|
| `TL:SetVisible(bool)` | Show or hide. |
| `TL:Toggle()` | Flip visibility. |
| `TL:SetPosition(udim2)` | Move. |
| `TL:ForceUpdate()` | Force a refresh. |
| `TL:SetTitle(text)` | Change the header text. |
| `TL:GetEnabledCount()` | Returns count of enabled toggles. |
| `TL:Destroy()` | Removes the widget. |

---

## Config Manager

A separate module that saves and loads element states to the executor filesystem.

```lua
local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()

ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:BuildConfigSection(ConfigTab)  -- takes a Tab, creates the config UI inside it
```

`BuildConfigSection` creates a full UI section with save, load, delete, and autoload controls.

Autoload resolution order: place-specific → game-specific → global.

**Supported elements:** Toggle, Slider, Dropdown, MultiDropdown, ColorPicker, AttachedColorPicker, TextBox, Button.

Requires executor filesystem support: `readfile`, `writefile`, `isfile`.

| Method | Description |
|--------|-------------|
| `ConfigManager:SetLibrary(lib)` | Required before `BuildConfigSection`. |
| `ConfigManager:SetWindow(win)` | Required before `BuildConfigSection`. |
| `ConfigManager:BuildConfigSection(tab)` | Builds config UI inside a Tab. |
| `ConfigManager:Save(name)` | Save current state. Returns `ok, err`. |
| `ConfigManager:Load(name)` | Load a config by name. Returns `ok, err`. |
| `ConfigManager:DeleteConfig(name)` | Delete a saved config file. |
| `ConfigManager:RefreshConfigList()` | Returns a list of saved config names. |
| `ConfigManager:SetIgnoreIndexes(list)` | Exclude specific flags from save/load. |
| `ConfigManager:LoadAutoloadConfig()` | Runs autoload: place → game → global. |

---

## Flags

Elements with a `flag` parameter write their value to `Library.flags[flagName]` on every change. Flags persist across re-executions via `getgenv().XclusiveUI`.

```lua
Section:CreateToggle("ESP",   false, function(s) end, nil, nil, nil, "esp")
Section:CreateSlider("Speed", 16, 200, 16, true, function(v) end, false, nil, "speed")
Section:CreateDropdown("Hitbox", { "Head", "Torso" }, function(v) end, "Head", false, false, false, "hitbox")

-- Read from anywhere:
if Library.flags["esp"] then renderESP() end
print("Speed:",  Library.flags["speed"])
print("Hitbox:", Library.flags["hitbox"])
```

---

## Themes

Built-in themes change the full color scheme. `ChangeColor` only changes the accent.

```lua
Library:GetThemes()          -- returns array of theme name strings
Library:SetTheme("Dark")     -- apply a named theme (e.g. Default, Dark, Red, Blue, Green, Purple, Orange, Pink, Cyan, Yellow)
Window:ChangeColor(Color3.fromRGB(255, 85, 85))  -- change accent, propagates instantly to all elements
```

---

## UI Keybind

Default keybind is `F3`. Press to hide or show all windows. Blocked when a TextBox is focused.

```lua
Library:ChangeToggleKeybind(Enum.KeyCode.Insert)  -- change keybind at runtime
Window:Toggle(false)  -- hide
Window:Toggle(true)   -- show
```

---

## Mobile

Mobile is detected via `UserInputService.TouchEnabled` at module load time and stored in `Library.IsMobile`.

- F3 keybind is disabled.
- `KeybindViewer` and `ToggleList` return silent no-op objects.
- All touch interactions work on Sliders, Dropdowns, Buttons, and ColorPickers.
- A ReopenButton is rendered automatically when the window is hidden.

```lua
if Library.IsMobile then
    Section:CreateButton("Hide UI", function()
        Window:Toggle(false)
    end)
end
```

---

## Utilities

```lua
Library:SetWindowName("Script v2.0")          -- update title bar text at runtime
Library:GetTextBounds(text, font, size)        -- returns Vector2 pixel dimensions of text
Library:ChangeToggleKeybind(keyCode)           -- change hide/show keybind at runtime
Library:Destroy()                              -- destroy all UI and clear getgenv cache
```

**Safe re-execution:**
```lua
if getgenv().XclusiveUI then
    getgenv().XclusiveUI:Destroy()
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
```

---

## Templates

### Minimal

A clean starter script covering the most common elements.

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()

local Window  = Library:CreateWindow({
    WindowName = "My Script",
    Color      = Color3.fromRGB(0, 162, 255),
})

local Tab     = Window:CreateTab("Main")
local Section = Tab:CreateSection("Features")

-- Toggle
Section:CreateToggle("God Mode", false, function(state)
    -- your logic
end, nil, nil, nil, "godmode")

-- Slider with suffix
Section:CreateSlider("Walk Speed", 16, 300, 16, true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end, false, nil, "walkspeed")

-- Dropdown
Section:CreateDropdown("Team", { "Blue", "Red", "Spectator" }, function(team)
    -- your logic
end, "Blue", false, false, false, "team")

-- Divider
Section:CreateDivider()

-- Button
Section:CreateButton("Teleport to Spawn", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 5, 0))
end)

-- Info tab with live labels
local InfoSection = Window:CreateTab("Info"):CreateSection("Stats")
local fpsLabel = InfoSection:CreateLabel("FPS: --")

game:GetService("RunService").Heartbeat:Connect(function(dt)
    fpsLabel:UpdateText(string.format("FPS: %d", math.round(1 / dt)))
end)

Library:Notify("My Script", "Loaded!", 3)
```

---

### Advanced

A full-featured script with combat, ESP, movement, HUD, widgets, and config.

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()

local Window = Library:CreateWindow({
    WindowName = "Advanced Script",
    Color      = Color3.fromRGB(255, 85, 85),
    Keybind    = Enum.KeyCode.F4,
})

-- Combat tab
local CombatTab = Window:CreateTab("Combat")
local AimSec    = CombatTab:CreateSection("Aimbot")

local aimbot = AimSec:CreateToggle("Aimbot", false, function(s) end, nil, nil, nil, "aimbot")
aimbot:CreateKeybind(Enum.KeyCode.CapsLock, function(s) end, "toggle")

AimSec:CreateSlider("Smoothness", 0, 100, 40, true, function(v) end, false, "%",  "smooth")
AimSec:CreateSlider("FOV",        10, 360, 120, true, function(v) end, false, "°", "fov")
AimSec:CreateDropdown("Hitbox", { "Head", "Torso", "HRP" }, function(v) end, "Head", false, false, false, "hitbox")

local SilentSec = CombatTab:CreateSection("Silent Aim")
SilentSec:CreateToggle("Silent Aim", false, function(s) end, "dangerous", nil, nil, "silent")

-- ESP tab
local ESPTab    = Window:CreateTab("ESP")
local PlayerSec = ESPTab:CreateSection("Players")

local espToggle = PlayerSec:CreateToggle("Player ESP", false, function(s) end, nil, nil, nil, "esp")
PlayerSec:CreateColorpicker("Box Color",  function(c, a) end, false, false, espToggle)
PlayerSec:CreateColorpicker("Name Color", function(c)    end, false, false, espToggle)
PlayerSec:CreateSlider("Max Distance", 100, 3000, 1000, true, function(v) end, false, " studs", "esp_dist")
PlayerSec:CreateDivider()
PlayerSec:CreateToggle("Show Names",    true,  function(s) end, nil, nil, nil, "esp_names")
PlayerSec:CreateToggle("Show Health",   true,  function(s) end, nil, nil, nil, "esp_health")
PlayerSec:CreateToggle("Show Skeleton", false, function(s) end, "buggy", nil, nil, "esp_skel")

-- Movement tab
local MovTab = Window:CreateTab("Movement")
local MovSec = MovTab:CreateSection("Speed & Fly")

local fly = MovSec:CreateToggle("Fly", false, function(s) end, nil, nil, nil, "fly")
fly:CreateKeybind(Enum.KeyCode.G, function(s) end, "toggle")

MovSec:CreateSlider("Walk Speed",  16, 300, 16,  true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end, false, nil, "walkspeed")
MovSec:CreateSlider("Jump Power",  50, 500, 50,  true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end, false, nil, "jumppower")

local MiscSec = MovTab:CreateSection("Misc")
MiscSec:CreateToggle("Noclip",        false, function(s) end, "buggy", nil, nil, "noclip")
MiscSec:CreateToggle("Infinite Jump", false, function(s) end, nil, nil, nil, "ijump")

-- Settings tab
local SettingsTab = Window:CreateTab("Settings")
local ThemeSec    = SettingsTab:CreateSection("Appearance")

ThemeSec:CreateColorpicker("Accent Color", function(c)
    Window:ChangeColor(c)
end, true)
ThemeSec:CreateDropdown("Theme", Library:GetThemes() or {}, function(theme)
    Library:SetTheme(theme)
end)

local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()
ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:BuildConfigSection(SettingsTab)

-- Info tab with live stats
local InfoTab  = Window:CreateTab("Info")
local StatSec  = InfoTab:CreateSection("Stats")
local fpsLabel = StatSec:CreateLabel("FPS: --")
local pingLabel = StatSec:CreateLabel("Ping: --")

game:GetService("RunService").Heartbeat:Connect(function(dt)
    fpsLabel:UpdateText(string.format("FPS: %d", math.round(1 / dt)))
    local ok, ping = pcall(function()
        return math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    if ok then pingLabel:UpdateText("Ping: " .. ping .. " ms") end
end)

-- HUD overlay
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
Library:CreateKeybindViewer({ Position = UDim2.new(0, 10, 0.5, 0), ShowOnlyActive = true })
Library:CreateToggleList({ Position = UDim2.new(0, 230, 0.5, 0), ShowOnlyEnabled = true, Title = "Active" })

Library:Notify("Advanced Script", "Loaded.", 3)
```

---

### Admin Panel

A player management panel with dynamic dropdowns, event logging, and a conditional advanced section.

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

-- Dynamic dropdown that tracks joins and leaves
local targetDrop = ActionSec:CreateDropdown("Target", {}, function(name) end, nil, false, false, false, "target")

local function refreshPlayers()
    targetDrop:ClearOptions()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= Players.LocalPlayer then
            targetDrop:AddOption(p.Name)
        end
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

ActionSec:CreateButton("Refresh List", refreshPlayers)
ActionSec:CreateButton("Teleport to Target", function()
    local name = Library.flags["target"]
    local p = name and Players:FindFirstChild(name)
    if p and p.Character then
        Players.LocalPlayer.Character:MoveTo(
            p.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0)
        )
    end
end)

-- Server tab with hidden advanced section
local ServerTab   = Window:CreateTab("Server")
local ServerSec   = ServerTab:CreateSection("Controls")
local AdvancedSec = ServerTab:CreateSection("Advanced")
AdvancedSec:SetVisible(false)

ServerSec:CreateToggle("Show Advanced", false, function(s)
    AdvancedSec:SetVisible(s)
end)
ServerSec:CreateToggle("Shutdown Lock", false, function(s) end, "dangerous", nil, nil, "shutdown_lock")

AdvancedSec:CreateTextBox("Broadcast Message", "Enter message...", false, function(msg)
    if msg ~= "" then Library:Notify("Broadcast", msg, 6) end
end, true)
AdvancedSec:CreateSlider("Message Duration", 1, 30, 5, true, function(v) end, false, "s", "msg_dur")

-- Live event log tab
local LogsTab = Window:CreateTab("Logs")
local LogSec  = LogsTab:CreateSection("Event Log")

Players.PlayerAdded:Connect(function(p)
    LogSec:CreateLabel(string.format("[%.0fs] JOIN:  %s", os.clock(), p.Name))
end)
Players.PlayerRemoving:Connect(function(p)
    LogSec:CreateLabel(string.format("[%.0fs] LEAVE: %s", os.clock(), p.Name))
end)

-- HUD showing player count
local hud = Library:Hud()
hud:SetTextColor(Color3.fromRGB(80, 200, 120)):SetTextSize(13):SetPadding(10, 10, 0, 0)

game:GetService("RunService").Heartbeat:Connect(function()
    hud:SetText("Players: " .. #Players:GetPlayers())
end)

-- Config tab
local ConfigTab     = Window:CreateTab("Config")
local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()
ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:BuildConfigSection(ConfigTab)

Library:Notify("Admin Panel", #Players:GetPlayers() .. " players online.", 4)
```

---

## Common Patterns

**Read flag state anywhere**
```lua
if Library.flags["esp"] then renderESP() end
print(Library.flags["speed"])
```

**Programmatic element update**
```lua
local slider = Section:CreateSlider("Speed", 16, 200, 16, true, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

slider:SetValue(50)   -- updates UI and fires callback
slider:GetValue()     -- returns 50
```

**Exclusive toggle group (radio buttons)**
```lua
local group = {}
local function addExclusive(name, flag)
    group[flag] = Section:CreateToggle(name, false, function(state)
        if state then
            for k, t in pairs(group) do
                if k ~= flag then t:SetState(false) end
            end
        end
    end, nil, nil, nil, flag)
end

addExclusive("Mode: Passive",    "mode_passive")
addExclusive("Mode: Aggressive", "mode_aggro")
addExclusive("Mode: Stealth",    "mode_stealth")
```

**Conditional section**
```lua
local advSec = Tab:CreateSection("Advanced Settings")
advSec:SetVisible(false)

Section:CreateToggle("Show Advanced", false, function(s)
    advSec:SetVisible(s)
end)
```

**Dynamic dropdown (player list)**
```lua
local drop = Section:CreateDropdown("Target", {}, function(name)
    setTarget(name)
end)

for _, p in pairs(game.Players:GetPlayers()) do drop:AddOption(p.Name) end
game.Players.PlayerAdded:Connect(function(p) drop:AddOption(p.Name) end)
game.Players.PlayerRemoving:Connect(function(p) drop:RemoveOption(p.Name) end)
```

**Rainbow color on a toggle**
```lua
local espToggle = Section:CreateToggle("ESP", false, function(s) end)
local cp = Section:CreateColorpicker("ESP Color", function(c, a) end, false, false, espToggle)
cp:SetRainbow(true)
```

**Hold keybind (active while held)**
```lua
local boost = Section:CreateToggle("Speed Boost", false, function(state)
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.WalkSpeed = state and 100 or 16
end, nil, nil, nil, "boost")

boost:CreateKeybind(Enum.KeyCode.LeftShift, function(state) end, "hold")
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
Ensure you are on the latest `Module.lua`. The window defaults to `gethui()` or `CoreGui` when no parent is passed.

**Clicks pass through the UI**
Update to the latest `Module.lua`. Orphan UI cleanup runs automatically inside `CreateWindow`.

**Dropdown closes immediately after opening**
Wrap the open trigger in `task.wait()` to let the input frame settle before the outside-click listener fires.

**Config not saving**
ConfigManager requires `readfile`, `writefile`, and `isfile`. If your executor does not support these, the config section will not function.

**UI keybind does nothing on mobile**
The F3 keybind is disabled on mobile by design. Use `Window:Toggle(bool)` or a dedicated UI button instead.

**Notifications show for 15 seconds**
The default duration is `15`. Pass an explicit value: `Library:Notify("Title", "Content", 4)`.

**Duplicate UI after re-execution**
Always call `Library:Destroy()` before re-running, or use the safe re-execution pattern in [Utilities](#utilities).

**Keybind fires while typing**
Keybinds are blocked automatically when a TextBox is focused. If you are using a custom input setup, check that `UserInputService:GetFocusedTextBox() == nil` before acting on input.

---

## License

MIT License - see [LICENSE](LICENSE)
