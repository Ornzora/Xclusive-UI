# Xclusive UI

A reimagined customizable UI library for Roblox interfaces.

---

## Loading

### LoadString.lua

The standard entry point. Fetches `Library/Module.lua` from GitHub, caches the result in `getgenv().XclusiveUI` (or `_G.XclusiveUI` where `getgenv` is unavailable), and returns it. Subsequent calls return the cached instance.

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
```

### Loader/Loader.lua

A game-specific script loader. Attempts to fetch and execute `Games/{GameId}.lua` from the repository. Falls back to `Games/Universal.lua` if no game-specific script exists.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Loader/Loader.lua"))()
```

---

## Library

### `Library:CreateWindow(Config, Parent)` → `Window`

Creates the main UI window and returns a `Window` object. `Parent` is the `Instance` to parent the `ScreenGui` to (typically `game.CoreGui` or `gethui()`).

```lua
local Window = Library:CreateWindow({
    WindowName    = "My Script",      -- string  (default: "Developer Mode")
    Color         = Color3.fromRGB(255, 128, 64), -- accent Color3 (required)
    Keybind       = Enum.KeyCode.RightShift, -- show/hide keybind (default: RightShift)
    MinHeight     = 100,   -- number? (default: 100)
    MaxHeight     = 600,   -- number? (default: 600)
    InitialHeight = 400,   -- number? (default: 400)
    MinWidth      = 300,   -- number? (default: 300)
    MaxWidth      = 800,   -- number? (default: 800)
    InitialWidth  = 500,   -- number? (default: 500)
}, game.CoreGui)
```

### `Library:Notify(title, content, duration)`

Shows a notification using the internal `NotificationSystem`. Equivalent to `Window:Notify(...)`.

### `Library:Hud()` → `Hud`

Creates a small draggable overlay for displaying text. Returns a `Hud` object (see [Hud](#hud)).

### `Library:CreateKeybindViewer(Config)` → `KeybindViewer`

Creates a floating panel that lists all registered keybinds. On mobile, returns a no-op dummy object.

```lua
local KBViewer = Library:CreateKeybindViewer({
    Visible          = true,                        -- bool?  (default: true)
    Position         = UDim2.new(0, 10, 0, 100),   -- UDim2? (default: shown)
    UpdateInterval   = 0,                           -- number? seconds between refreshes (default: 0, every frame)
    ShowToggleStates = true,                        -- bool?  show on/off state (default: true)
    ShowOnlyActive   = true,                        -- bool?  hide unbound elements (default: true)
    Draggable        = true,                        -- bool?  (default: true)
})
```

### `Library:CreateToggleList(Config)` → `ToggleList`

Creates a floating panel that lists all toggles and their current state. On mobile, returns a no-op dummy object.

```lua
local TList = Library:CreateToggleList({
    Visible         = true,                         -- bool?  (default: true)
    Position        = UDim2.new(0, 220, 0, 100),   -- UDim2? (default: shown)
    UpdateInterval  = 0,                            -- number? (default: 0)
    ShowOnlyEnabled = true,                         -- bool?  hide disabled toggles (default: true)
    ShowStatus      = true,                         -- bool?  show status badges (default: true)
    Draggable       = true,                         -- bool?  (default: true)
    Title           = "Enabled Toggles",            -- string? (default: "Enabled Toggles")
})
```

### `Library:ChangeToggleKeybind(newKeybind)`

Changes the keybind used to show/hide the UI at runtime.

```lua
Library:ChangeToggleKeybind(Enum.KeyCode.Insert)
```

### `Library:Destroy()`

Destroys all windows, connections, notifications, and elements created by the library.

---

## Window

Returned by `Library:CreateWindow(...)`.

### `Window:CreateTab(Name)` → `Tab`

Creates a tab and its button in the tab bar.

```lua
local Tab = Window:CreateTab("Main")
```

### `Window:ChangeColor(Color)`

Changes the accent color of the entire UI.

```lua
Window:ChangeColor(Color3.fromRGB(0, 162, 255))
```

### `Window:Toggle(State)`

Shows (`true`) or hides (`false`) the window.

### `Window:SetBackground(ImageId)`

Sets a background image on the window. `ImageId` is a Roblox asset ID string (`"rbxassetid://..."`).

### `Window:Notify(title, content, duration)`

Shows a timed notification in the bottom-right corner.

```lua
Window:Notify("Success", "Config loaded.", 5)
```

### `Window:SetBackgroundColor(Color)`

Sets the background `Color3` of the window.

### `Window:SetBackgroundTransparency(Transparency)`

Sets the background transparency (`0`–`1`).

### `Window:SetTileOffset(Offset)`

Sets the `Offset` of the background image tile.

### `Window:SetTileScale(Scale)`

Sets the `Scale` of the background image tile.

### `Window:SetFont(Font)`

Sets the font for all UI text (`Enum.Font`).

### `Window:CreateParticles(enableParticles)`

Enables (`true`) or disables (`false`) a decorative particle effect on the window background.

### `Window:CreateGlow(enableGlow, glowConfig)`

Adds or removes a `UIStroke` glow around the window border. Passing `false` removes any existing glow.

```lua
Window:CreateGlow(true, {
    color             = Color3.fromRGB(255, 128, 64), -- Color3? defaults to accent color
    thickness         = 2,      -- number? UIStroke thickness (default: 2)
    transparency      = 0.5,    -- number? base transparency (default: 0.5)
    pulse             = true,   -- bool?   animate transparency (default: true)
    pulseSpeed        = 2,      -- number? oscillations per second (default: 2)
    minTransparency   = 0.2,    -- number? pulse lower bound (default: 0.2)
    maxTransparency   = 0.8,    -- number? pulse upper bound (default: 0.8)
    enhanced          = false,  -- bool?   also draw a blurred frame behind window (default: false)
    glowSize          = 8,      -- number? enhanced: pixel spread (default: 8)
    frameTransparency = 0.9,    -- number? enhanced: frame transparency (default: 0.9)
    cornerRadius      = 8,      -- number? enhanced: corner radius in pixels (default: 8)
})
```

### `Window:Destroy()`

Destroys this window and all of its contents.

### `Library:SetWindowName(str)`

Updates the window title text. Available after `CreateWindow` is called.

---

## Tab

Returned by `Window:CreateTab(Name)`.

### `Tab:CreateSection(Name, Side)` → `Section`

Creates a section inside the tab. `Side` is an optional string `"left"` or `"right"`. If omitted, the library balances sections automatically between the two columns.

```lua
local Section = Tab:CreateSection("Combat", "left")
```

---

## Section

Returned by `Tab:CreateSection(Name, Side)`.

All `Section:Create*` methods register the created element in `shared.XclusiveUI.Elements` under a unique ID, making it available to `ConfigManager`.

### `Section:CreateLabel(Name, WrapText)` → `Label`

Creates a static text label.

```lua
local Label = Section:CreateLabel("Version: 1.0", true)
```

**Label methods:**
- `Label:UpdateText(text)` — updates the displayed text
- `Label:SetVisible(bool)`, `Label:IsVisible()`, `Label:ToggleVisibility()`
- `Label:Destroy()`

---

### `Section:CreateButton(Name, Callback, WrapText)` → `Button`

Creates a clickable button.

```lua
local Button = Section:CreateButton("Teleport", function()
    -- fired on click or keybind
end)
```

**Button methods:**
- `Button:UpdateText(text)`
- `Button:CreateKeybind(Bind, Callback)` → `Keybind`
- `Button:GetKeybind()` → `Keybind | nil`
- `Button:SetVisible(bool)`, `Button:IsVisible()`, `Button:ToggleVisibility()`
- `Button:Destroy()`

---

### `Section:CreateTextBox(Name, PlaceHolder, NumbersOnly, Callback, WrapText)` → `TextBox`

Creates a text input field. When `NumbersOnly` is `true`, the callback is only fired if the entered value parses as a valid number.

```lua
local TextBox = Section:CreateTextBox("Player Name", "Enter name...", false, function(value)
    print(value)
end)
```

**TextBox methods:**
- `TextBox:SetValue(String)` — sets the input text programmatically
- `TextBox:GetValue()` → `string`
- `TextBox:ToggleInput()` → `boolean` — toggles whether the input is editable
- `TextBox:SetVisible(bool)`, `TextBox:IsVisible()`, `TextBox:ToggleVisibility()`

---

### `Section:CreateToggle(Name, Default, Callback, Status, Info, WrapText, Flag)` → `Toggle`

Creates an on/off toggle. `Status` controls a colored badge shown next to the name. Valid status values are `"normal"` (default), `"dangerous"`, and `"buggy"`. `Info` is optional tooltip text shown on hover. `Flag` is a string key used to expose the value via `Library.flags[Flag]`.

```lua
local Toggle = Section:CreateToggle("Speed Hack", false, function(state)
    -- state is true/false
end, "dangerous", "May cause kicks.", false, "speedhack")
```

**Toggle methods:**
- `Toggle:SetState(State)` — sets the toggle state without firing the callback
- `Toggle:GetState()` → `boolean`
- `Toggle:SetStatus(NewStatus)` — `"normal"`, `"dangerous"`, or `"buggy"`
- `Toggle:GetStatus()` → `string`
- `Toggle:SetInfo(NewInfo)` — updates the tooltip text
- `Toggle:GetInfo()` → `string | nil`
- `Toggle:CreateKeybind(Bind, KeybindCallback, DefaultMode)` → `Keybind`
- `Toggle:GetKeybind()` → `Keybind | nil`
- `Toggle:SetVisible(bool)`, `Toggle:IsVisible()`, `Toggle:ToggleVisibility()`
- `Toggle:UpdateColors()`

---

### `Section:CreateSlider(Name, Min, Max, Default, Precise, Callback, WrapText, Suffix, Flag)` → `Slider`

Creates a draggable value slider. When `Precise` is `true`, the value is floored to the nearest integer. When `false`, the value is rounded to two decimal places. `Suffix` is an optional string appended to the displayed value (e.g. `"%"` or `" ms"`). `Flag` exposes the value via `Library.flags[Flag]`.

```lua
local Slider = Section:CreateSlider("Walk Speed", 0, 100, 16, true, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end, false, " studs/s", "walkspeed")
```

**Slider methods:**
- `Slider:SetValue(Value)` — sets the slider value
- `Slider:GetValue()` → `number`
- `Slider:SetVisible(bool)`, `Slider:IsVisible()`, `Slider:ToggleVisibility()`
- `Slider:UpdateColors()`

---

### `Section:CreateDropdown(Name, OptionTable, Callback, InitialValue, Multi, WrapText, KeepRemoved, Flag)` → `Dropdown`

Creates a dropdown selector. Set `Multi` to `true` for multi-select mode. `KeepRemoved` controls whether removed options are retained internally. `Flag` exposes the value via `Library.flags[Flag]`.

```lua
-- Single select
local Dropdown = Section:CreateDropdown("Team", {"Red", "Blue", "Green"}, function(value)
    print("Selected:", value)
end, "Red")

-- Multi-select
local MultiDrop = Section:CreateDropdown("Items", {"Sword", "Shield", "Bow"}, function(values)
    -- values is a table of selected option names
end, nil, true)
```

**Dropdown methods:**
- `Dropdown:GetOption()` → `string` (single) or `{ string }` (multi)
- `Dropdown:SetOption(value)` — `string` (single) or `{ string }` (multi)
- `Dropdown:AddOption(OptionName, SelectImmediately)` — adds an option; `SelectImmediately` selects it on add
- `Dropdown:RemoveOption(OptionName)` — removes an option by name
- `Dropdown:ClearOptions()` — removes all options
- `Dropdown:ChangeOptions(NewOptionTable, NewInitialValue)` — replaces the full option list
- `Dropdown:SetVisible(bool)`, `Dropdown:IsVisible()`, `Dropdown:ToggleVisibility()`
- `Dropdown:UpdateColors()`

---

### `Section:CreateColorpicker(Name, Callback, IsAccentColorpicker, WrapText, AttachToToggle)` → `Colorpicker`

Creates a color picker with an optional transparency slider and a rainbow mode toggle. When `IsAccentColorpicker` is `true`, changing the color updates the entire UI accent color. Pass an existing `Toggle` element to `AttachToToggle` to embed the color indicator inside the toggle row rather than creating a standalone row.

```lua
-- Standalone
local CP = Section:CreateColorpicker("Trail Color", function(color, transparency)
    -- color: Color3, transparency: number (0-1)
end)

-- Attached to a toggle
local CP = Section:CreateColorpicker("Trail Color", function(color, transparency)
end, false, false, MyToggle)
```

**Colorpicker methods:**
- `Colorpicker:UpdateColor(Color, Transparency)` — sets color and transparency (`0`–`1`)
- `Colorpicker:GetValue()` → `Color3, number` (color and transparency)
- `Colorpicker:GetColor()` → `Color3`
- `Colorpicker:GetTransparency()` → `number`
- `Colorpicker:SetTransparency(transparency)`
- `Colorpicker:IsRainbowEnabled()` → `boolean`
- `Colorpicker:SetRainbow(state)` — enables or disables rainbow cycling
- `Colorpicker:ClosePallete()` — closes the color palette popup
- `Colorpicker:SetVisible(bool)`, `Colorpicker:IsVisible()`, `Colorpicker:ToggleVisibility()`
- `Colorpicker:UpdateColors()` *(attached colorpicker only)*
- `Colorpicker:Destroy()` *(attached colorpicker only)*

---

### `Section:CreateDivider()` → `Divider`

Creates a horizontal rule for visual separation between elements.

```lua
local Divider = Section:CreateDivider()
```

**Divider methods:**
- `Divider:SetColor(Color)` — sets the divider `Color3`
- `Divider:SetVisible(bool)`, `Divider:IsVisible()`, `Divider:ToggleVisibility()`
- `Divider:Destroy()`

---

### Section visibility methods

All sections expose:
- `Section:SetVisible(bool)`, `Section:IsVisible()`, `Section:ToggleVisibility()`
- `Section:Destroy()`

---

## Hud

Returned by `Library:Hud()`. All setter methods return `self` for chaining.

```lua
local Hud = Library:Hud()
Hud:SetText("Speed: 16")
   :SetTextColor(Color3.fromRGB(200, 200, 200))
   :SetTextSize(14)
   :SetPadding(10, 10, 10, 10)
   :SetDraggable(true)
```

**Hud methods:**
- `Hud:SetText(text)` → `self`
- `Hud:GetText()` → `string`
- `Hud:SetVisibility(bool)` → `self`
- `Hud:IsVisible()` → `boolean`
- `Hud:SetTextColor(color)` → `self`
- `Hud:SetTextSize(size)` → `self`
- `Hud:SetFont(font)` → `self`
- `Hud:SetPadding(right, bottom, left, top)` → `self`
- `Hud:SetDraggable(draggable)` → `self`
- `Hud:SetPosition(position)` → `self`
- `Hud:GetPosition()` → `UDim2`

---

## KeybindViewer

Returned by `Library:CreateKeybindViewer(Config)`. On mobile devices all methods are no-ops.

- `KeybindViewer:SetVisible(visible)`
- `KeybindViewer:IsVisible()` → `boolean`
- `KeybindViewer:Toggle()` → `boolean`
- `KeybindViewer:SetPosition(position)`
- `KeybindViewer:GetPosition()` → `UDim2`
- `KeybindViewer:SetSize(size)`
- `KeybindViewer:SetTitle(title)`
- `KeybindViewer:UpdateConfig(newConfig)`
- `KeybindViewer:SetParent(parent)`
- `KeybindViewer:ForceUpdate()`
- `KeybindViewer:GetKeybindCount()` → `number`

---

## ToggleList

Returned by `Library:CreateToggleList(Config)`. On mobile devices all methods are no-ops.

- `ToggleList:SetVisible(visible)`
- `ToggleList:IsVisible()` → `boolean`
- `ToggleList:Toggle()` → `boolean`
- `ToggleList:SetPosition(position)`
- `ToggleList:GetPosition()` → `UDim2`
- `ToggleList:SetTitle(title)`
- `ToggleList:ForceUpdate()`
- `ToggleList:GetEnabledCount()` → `number`
- `ToggleList:Destroy()`


---

## NotificationModule

`Library/NotificationModule.lua` exports a `NotificationSystem` class used internally by the library. It can also be used standalone.

```lua
local NotificationSystem = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/NotificationModule.lua"
))()

local NS = NotificationSystem.New(screenGuiInstance)
NS:CreateNotification("Title", "Message body.", 5)
```

**Class properties** (set before calling `New` or on the returned instance):

| Property | Type | Default |
|---|---|---|
| `NotificationSize` | `UDim2` | `UDim2.new(0, 300, 0, 70)` |
| `Spacing` | `number` | `5` |
| `AnimationSpeed` | `number` | `0.3` |
| `Font` | `Enum.Font` | `Enum.Font.Gotham` |
| `TextSize` | `number` | `14` |
| `TextColor` | `Color3` | `Color3.fromRGB(234, 234, 234)` |
| `BackgroundColor` | `Color3` | `Color3.fromRGB(35, 35, 35)` |
| `AccentColor` | `Color3` | `Color3.fromRGB(85, 85, 85)` |
| `BottomOffset` | `number` | `10` |
| `ShowTimer` | `boolean` | `true` |
| `TimerColor` | `Color3` | `Color3.fromRGB(150, 150, 150)` |

**Methods:**
- `NotificationSystem.New(parent)` → `self` — creates a container frame inside `parent`
- `self:CreateNotification(title, content, duration)` — shows a notification for `duration` seconds (default `3`)
- `self:Destroy()` — disconnects all connections and destroys all notification frames

---

## ConfigManager

`Library/ConfigManager.lua` saves and loads element states to the executor's file system. Configs are stored as Lua table files under `{Folder}/settings/{Name}.lua`.

```lua
local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()

ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:SetFolder("MyScript") -- optional; default is "XclusiveUI"

-- Build the full config UI inside a tab section
ConfigManager:BuildConfigSection(Tab)

-- Or manage configs manually
ConfigManager:Save("default")
ConfigManager:Load("default")
```

### Supported element types

`Toggle`, `Slider`, `Dropdown`, `MultiDropdown`, `ColorPicker`, `AttachedColorPicker`, `TextBox`, `Button`. Keybinds attached to `Toggle` and `Button` elements are saved and restored automatically.

### Methods

| Method | Returns | Description |
|---|---|---|
| `ConfigManager:SetLibrary(Library)` | — | Required before `BuildConfigSection` |
| `ConfigManager:SetWindow(Window)` | — | Required before `BuildConfigSection` |
| `ConfigManager:SetFolder(Folder)` | — | Changes the root save folder and rebuilds the folder tree |
| `ConfigManager:Save(Name)` | `boolean, any` | Saves all registered elements to `{Folder}/settings/{Name}.lua` |
| `ConfigManager:Load(Name)` | `boolean, any` | Loads and applies a saved config |
| `ConfigManager:DeleteConfig(Name)` | `boolean, any` | Deletes a saved config file |
| `ConfigManager:RefreshConfigList()` | `{ string }` | Returns the names of all saved configs |
| `ConfigManager:SetIgnoreIndexes(List)` | — | Excludes the given element unique IDs from save/load |
| `ConfigManager:BuildConfigSection(Tab)` | — | Creates a full config management UI section inside `Tab` |
| `ConfigManager:BuildFolderTree()` | — | Creates `{Folder}`, `{Folder}/settings`, `{Folder}/autoload`, `{Folder}/gameautoload` |
| `ConfigManager:SetPlaceAutoloadConfig(ConfigName)` | — | Sets a config to auto-load for the current Place ID |
| `ConfigManager:GetPlaceAutoloadConfig()` | `string?` | Returns the autoload config name for the current Place ID |
| `ConfigManager:SetGameAutoloadConfig(ConfigName)` | — | Sets a config to auto-load for the current Game ID |
| `ConfigManager:GetGameAutoloadConfig()` | `string?` | Returns the autoload config name for the current Game ID |
| `ConfigManager:SetGlobalAutoloadConfig(ConfigName)` | — | Sets a config to auto-load globally |
| `ConfigManager:GetGlobalAutoloadConfig()` | `string?` | Returns the global autoload config name |
| `ConfigManager:LoadAutoloadConfig()` | — | Loads the highest-priority autoload config (place → game → global) and notifies the window |

---

## Flags

Toggles and Sliders created with a non-nil `Flag` string expose their current value through `Library.flags`:

```lua
Section:CreateToggle("Speed Hack", false, callback, nil, nil, false, "speedhack")
Section:CreateSlider("Walk Speed", 0, 100, 16, true, callback, false, nil, "walkspeed")

-- Elsewhere:
print(Library.flags["speedhack"]) -- true / false
print(Library.flags["walkspeed"]) -- number
```

---

## Full Example

```lua
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"
))()

local Window = Library:CreateWindow({
    WindowName = "My Script",
    Color      = Color3.fromRGB(255, 128, 64),
}, game.CoreGui)

local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Settings")

Section:CreateToggle("God Mode", false, function(state)
    print("God mode:", state)
end)

Section:CreateSlider("Walk Speed", 0, 100, 16, true, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end, false, " studs/s")

Section:CreateDropdown("Team", {"Red", "Blue", "Green"}, function(value)
    print("Team:", value)
end, "Red")

Section:CreateColorpicker("Color", function(color, transparency)
    print("Color:", color, "Transparency:", transparency)
end)

Window:Notify("Ready", "Script loaded successfully.", 5)
```
