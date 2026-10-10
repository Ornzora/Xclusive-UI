# Xclusive UI

A reimagined customizable UI library for Roblox interfaces.

---

## Table of Contents

1. [Load](#1-load)
2. [Library](#2-library)
3. [Window](#3-window)
4. [Themes](#4-themes)
5. [Tab](#5-tab)
6. [Section](#6-section)
7. [Toggle](#7-toggle)
8. [Slider](#8-slider)
9. [Dropdown](#9-dropdown)
10. [TextBox](#10-textbox)
11. [Button](#11-button)
12. [ColorPicker](#12-colorpicker)
13. [Keybind](#13-keybind)
14. [Flags](#14-flags)
15. [HUD](#15-hud)
16. [KeybindViewer](#16-keybindviewer)
17. [ToggleList](#17-togglelist)
18. [ConfigManager](#18-configmanager)
19. [NotificationModule](#19-notificationmodule)
20. [Loader](#20-loader)
21. [Full Example](#21-full-example)

---

## 1. Load

Execute one line from your script to pull in the library:

```lua
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"
))()
```

The module is cached in `getgenv()` after the first load.
Subsequent calls return the same instance — safe to call from multiple scripts.

---

## 2. Library

The root object returned by LoadString. Holds global state and utility functions.

### Properties

| Property      | Type    | Description                                      |
|---------------|---------|--------------------------------------------------|
| `Toggle`      | boolean | Whether the UI is currently visible              |
| `flags`       | table   | Shared flag table — all flagged elements write here |
| `Connections` | table   | All RBXScriptConnections — disconnected on Destroy |
| `Windows`     | table   | All active Window objects                        |
| `Themes`      | table   | Built-in theme presets (name -> Color3)          |
| `ColorTable`  | table   | All accent-colored instances for bulk recolor    |

### Methods

```lua
Library:SetTheme(ThemeName: string)
Library:GetThemes(): table
Library:Destroy()
```

| Method          | Returns | Description                                             |
|-----------------|---------|---------------------------------------------------------|
| `SetTheme(name)` | void   | Applies a built-in theme preset to all open windows     |
| `GetThemes()`   | table   | Returns a list of all built-in theme preset names       |
| `Destroy()`     | void    | Destroys all UI, disconnects all connections, clears flags |

---

## 3. Window

The main container. Draggable, resizable, toggleable with a keybind.
Includes a minimize button (`-`/`+`) on the topbar that collapses the window to just the title bar.

### Create

```lua
local Window = Library:MakeWindow(Config: table, Parent: Instance): Window
```

### Config Parameters

| Parameter       | Type          | Default              | Description                                |
|-----------------|---------------|----------------------|--------------------------------------------|
| `WindowName`    | string        | `"Developer Mode"`   | Text shown in the title bar                |
| `Keybind`       | Enum.KeyCode  | `RightShift`         | Key that shows/hides the window            |
| `Color`         | Color3        | `RGB(255,255,255)`   | Accent color for highlighted elements      |
| `InitialWidth`  | number        | `500`                | Starting width in pixels                   |
| `InitialHeight` | number        | `400`                | Starting height in pixels                  |
| `MinWidth`      | number        | `300`                | Minimum resize width                       |
| `MaxWidth`      | number        | `800`                | Maximum resize width                       |
| `MinHeight`     | number        | `100`                | Minimum resize height                      |
| `MaxHeight`     | number        | `600`                | Maximum resize height                      |

`Parent` is the ScreenGui parent — use `game.CoreGui` in exploits.

### Methods

| Method                      | Returns | Description                                          |
|-----------------------------|---------|------------------------------------------------------|
| `Window:ChangeColor(color)` | void    | Updates the accent color across all elements         |
| `Window:Toggle(state)`      | void    | `true` = show, `false` = hide                        |
| `Window:SetWindowName(str)` | void    | Updates the title bar text at runtime                |
| `Window:SetBackground(id)`  | void    | Sets a background image (`rbxassetid://...`)         |
| `Window:ChangeFont(font)`   | void    | Applies an `Enum.Font` to all text in the window     |
| `Window:Destroy()`          | void    | Removes the window and all its elements              |

### Example

```lua
local Window = Library:MakeWindow({
    WindowName    = "My Script",
    Keybind       = Enum.KeyCode.RightShift,
    Color         = Color3.fromRGB(255, 255, 255),
    InitialWidth  = 520,
    InitialHeight = 420,
    MinWidth      = 300,
    MaxWidth      = 800,
    MinHeight     = 100,
    MaxHeight     = 600,
}, game.CoreGui)

Window:ChangeColor(Color3.fromRGB(80, 160, 255))
Window:Toggle(false)
Window:Toggle(true)
```

---

## 4. Themes

Ten built-in color presets. Each preset maps a name to a `Color3` accent value.

| Preset Name | Color (RGB)        |
|-------------|--------------------|
| `Default`   | 255, 255, 255      |
| `Dark`      | 180, 180, 180      |
| `Red`       | 220, 55, 55        |
| `Blue`      | 55, 120, 220       |
| `Green`     | 55, 200, 100       |
| `Purple`    | 150, 55, 220       |
| `Orange`    | 255, 128, 64       |
| `Pink`      | 220, 80, 150       |
| `Cyan`      | 55, 200, 220       |
| `Yellow`    | 220, 200, 55       |

### Usage

```lua
-- Apply a preset
Library:SetTheme("Blue")

-- Get all names (useful for a Dropdown element)
local themes = Library:GetThemes()
-- returns: { "Default", "Dark", "Red", "Blue", ... }

-- Set a fully custom color (bypasses presets)
Window:ChangeColor(Color3.fromRGB(255, 80, 120))
```

### Feeding themes into a Dropdown

```lua
Section:AddDropdown({
    Name     = "Theme",
    Options  = Library:GetThemes(),
    Default  = "Default",
    Flag     = "ActiveTheme",
    Callback = function(Value)
        Library:SetTheme(Value)
    end,
})
```

---

## 5. Tab

A top-level page inside the window. Click the tab button in the topbar to switch.
Tab content is animated in and out with a slide transition.

### Create

```lua
local Tab = Window:MakeTab(Config: table): Tab
```

### Config Parameters

| Parameter | Type   | Default | Description                         |
|-----------|--------|---------|-------------------------------------|
| `Name`    | string | —       | Tab button label                    |
| `Icon`    | string | `""`    | Optional asset ID for a tab icon    |

### Example

```lua
local CombatTab  = Window:MakeTab({ Name = "Combat" })
local VisualsTab = Window:MakeTab({ Name = "Visuals" })
local MiscTab    = Window:MakeTab({ Name = "Misc" })
local ConfigTab  = Window:MakeTab({ Name = "Config" })
```

---

## 6. Section

A labeled group inside a tab. Sections stack vertically.
Each section has a collapsible body and a highlight bar.

### Create

```lua
local Section = Tab:MakeSection(Config: table): Section
```

### Config Parameters

| Parameter | Type   | Default | Description           |
|-----------|--------|---------|-----------------------|
| `Name`    | string | —       | Section header label  |

### Example

```lua
local AimbotSection = CombatTab:MakeSection({ Name = "Aimbot" })
local EspSection    = CombatTab:MakeSection({ Name = "ESP"    })
local WorldSection  = VisualsTab:MakeSection({ Name = "World" })
```

---

## 7. Toggle

An on/off switch. Supports an optional inline keybind attachment.
Writes a `boolean` to `Library.flags[Flag]` on change.

### Create

```lua
local Toggle = Section:AddToggle(Config: table): Toggle
```

### Config Parameters

| Parameter  | Type     | Default | Description                                              |
|------------|----------|---------|----------------------------------------------------------|
| `Name`     | string   | —       | Display label                                            |
| `Default`  | boolean  | `false` | Initial state                                            |
| `Flag`     | string   | `nil`   | Key in `Library.flags` to write the state to            |
| `Keybind`  | table    | `nil`   | Inline keybind config (see below)                        |
| `Callback` | function | `nil`   | Called with `(State: boolean)` whenever the state changes |

### Keybind sub-table

| Field      | Type          | Default              | Description                         |
|------------|---------------|----------------------|-------------------------------------|
| `Default`  | Enum.KeyCode  | `Enum.KeyCode.Unknown` | Initial keybind key               |
| `Mode`     | string        | `"Toggle"`           | `"Toggle"` or `"Hold"`              |
| `Callback` | function      | `nil`                | Called with `(State: boolean)`      |

### Methods

| Method                   | Returns | Description                               |
|--------------------------|---------|-------------------------------------------|
| `Toggle:SetValue(state)` | void    | Programmatically set the toggle state     |
| `Toggle:GetState()`      | boolean | Returns the current state                 |
| `Toggle:GetKeybind()`    | Keybind | Returns the attached Keybind object (if any) |
| `Toggle:AddColorPicker(config)` | ColorPicker | Attaches an inline color picker |

### Example

```lua
local InfJump = AimbotSection:AddToggle({
    Name     = "Infinite Jump",
    Default  = false,
    Flag     = "InfJump",
    Keybind  = {
        Default  = Enum.KeyCode.X,
        Mode     = "Toggle",
        Callback = function(State) end,
    },
    Callback = function(State)
        -- State is true when enabled, false when disabled
        _G.InfJumpEnabled = State
    end,
})

-- Programmatic control
InfJump:SetValue(true)
print(InfJump:GetState())  --> true

-- Change the keybind at runtime
InfJump:GetKeybind():SetBind(Enum.KeyCode.F)
print(InfJump:GetKeybind():GetBind())   --> Enum.KeyCode.F
print(InfJump:GetKeybind():GetMode())   --> "Toggle"
```

---

## 8. Slider

A draggable range input. Supports integer or float precision.
Writes a `number` to `Library.flags[Flag]` on change.

### Create

```lua
local Slider = Section:AddSlider(Config: table): Slider
```

### Config Parameters

| Parameter  | Type     | Default | Description                                                 |
|------------|----------|---------|-------------------------------------------------------------|
| `Name`     | string   | —       | Display label                                               |
| `Min`      | number   | —       | Minimum value (inclusive)                                   |
| `Max`      | number   | —       | Maximum value (inclusive)                                   |
| `Default`  | number   | —       | Initial value — must be within `[Min, Max]`                 |
| `Precise`  | boolean  | `false` | `true` = integer steps, `false` = 2 decimal places         |
| `Suffix`   | string   | `""`    | Text appended to the displayed value (e.g. `" studs"`)      |
| `Flag`     | string   | `nil`   | Key in `Library.flags`                                      |
| `Callback` | function | `nil`   | Called with `(Value: number)` on every change               |

### Methods

| Method                   | Returns | Description                          |
|--------------------------|---------|--------------------------------------|
| `Slider:SetValue(value)` | void    | Programmatically set the slider value |
| `Slider:GetValue()`      | number  | Returns the current value             |

### Example

```lua
local WalkSpeed = WorldSection:AddSlider({
    Name     = "Walk Speed",
    Min      = 16,
    Max      = 500,
    Default  = 16,
    Precise  = true,     -- integer only
    Suffix   = " st/s",
    Flag     = "WalkSpeed",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end,
})

local GravScale = WorldSection:AddSlider({
    Name     = "Gravity",
    Min      = 0,
    Max      = 200,
    Default  = 100,
    Precise  = false,    -- 2 decimal places
    Suffix   = "%",
    Flag     = "Gravity",
    Callback = function(Value)
        workspace.Gravity = 196.2 * (Value / 100)
    end,
})

-- Read and write programmatically
WalkSpeed:SetValue(100)
print(WalkSpeed:GetValue())  --> 100
```

---

## 9. Dropdown

A single-select list. Clicking the element opens a scrollable options menu.
Writes the selected `string` to `Library.flags[Flag]` on change.

### Create

```lua
local Dropdown = Section:AddDropdown(Config: table): Dropdown
```

### Config Parameters

| Parameter  | Type     | Default | Description                                          |
|------------|----------|---------|------------------------------------------------------|
| `Name`     | string   | —       | Display label                                        |
| `Options`  | table    | —       | Array of option strings: `{ "A", "B", "C" }`         |
| `Default`  | string   | `""`    | Initially selected option (must exist in `Options`)  |
| `Flag`     | string   | `nil`   | Key in `Library.flags`                               |
| `Callback` | function | `nil`   | Called with `(Value: string)` when selection changes |

### Methods

| Method                         | Returns | Description                                                |
|--------------------------------|---------|------------------------------------------------------------|
| `Dropdown:SetValue(value)`     | void    | Programmatically select an option                          |
| `Dropdown:GetValue()`          | string  | Returns the currently selected option                      |
| `Dropdown:Refresh(options, default)` | void | Replaces the option list and resets to `default`      |

### Example

```lua
local HitPart = AimbotSection:AddDropdown({
    Name     = "Hit Part",
    Options  = { "Head", "Torso", "Left Arm", "Right Arm", "Random" },
    Default  = "Head",
    Flag     = "AimbotPart",
    Callback = function(Value)
        _G.AimbotTarget = Value
    end,
})

-- Change options at runtime (e.g. after gathering player names)
local playerNames = {}
for _, p in ipairs(game.Players:GetPlayers()) do
    if p ~= game.Players.LocalPlayer then
        table.insert(playerNames, p.Name)
    end
end
HitPart:Refresh(playerNames, playerNames[1] or "")

-- Read / write programmatically
HitPart:SetValue("Torso")
print(HitPart:GetValue())  --> "Torso"
```

---

## 10. TextBox

A free-form input field. Supports numeric-only mode.
Fires the callback when focus is lost (on Enter or click-away).

### Create

```lua
local TextBox = Section:AddTextBox(Config: table): TextBox
```

### Config Parameters

| Parameter     | Type     | Default | Description                                            |
|---------------|----------|---------|--------------------------------------------------------|
| `Name`        | string   | —       | Display label                                          |
| `Default`     | string   | `""`    | Placeholder or initial text shown in the box           |
| `NumbersOnly` | boolean  | `false` | When `true`, only numeric input fires the callback     |
| `Flag`        | string   | `nil`   | Key in `Library.flags` (written on every callback)     |
| `Callback`    | function | `nil`   | Called with `(Value: string)` or `(Value: number)` on focus lost |

> When `NumbersOnly = true`, the callback receives a `number`.
> When `NumbersOnly = false`, the callback receives a `string`.

### Example

```lua
-- String input
Section:AddTextBox({
    Name        = "Target Player",
    Default     = "Enter name...",
    NumbersOnly = false,
    Flag        = "TargetName",
    Callback    = function(Value)
        print("Targeting:", Value)
    end,
})

-- Numeric input
Section:AddTextBox({
    Name        = "Custom FOV",
    Default     = "90",
    NumbersOnly = true,
    Flag        = "CustomFOV",
    Callback    = function(Value)
        -- Value is a number here
        workspace.CurrentCamera.FieldOfView = Value
    end,
})
```

---

## 11. Button

A clickable action. Supports an optional confirmation sub-button that appears
directly below the main button — useful for destructive actions.

### Create

```lua
-- Simple button
local Button = Section:AddButton(Config: table): Button

-- Button with sub-button (confirmation)
local Button = Section:AddButton(MainConfig: table, SubConfig: table): Button
```

### Config Parameters

| Parameter  | Type     | Default | Description                                    |
|------------|----------|---------|------------------------------------------------|
| `Name`     | string   | —       | Button label text                              |
| `Callback` | function | `nil`   | Called with no arguments when the button is clicked |

Both `MainConfig` and `SubConfig` use the same shape.

### Example

```lua
-- Simple
Section:AddButton({
    Name     = "Teleport to Spawn",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then char:MoveTo(Vector3.new(0, 5, 0)) end
    end,
})

-- With confirmation sub-button
Section:AddButton({
    Name     = "Kill All Players",
    Callback = function()
        -- does nothing alone; waits for confirmation
    end,
}, {
    Name     = "Confirm Kill All",
    Callback = function()
        -- actual kill logic here
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer then
                -- execute kill
            end
        end
    end,
})
```

---

## 12. ColorPicker

A full HSV color picker with a gradient palette, hue bar, and transparency slider.
Supports rainbow mode. Can be standalone (opens in a floating palette) or attached
inline to a Toggle.

### Create (standalone)

```lua
local ColorPicker = Section:AddColorPicker(Config: table): ColorPicker
```

### Create (attached to a Toggle)

```lua
Toggle:AddColorPicker(Config: table): ColorPicker
```

An attached picker appears as a small color swatch directly next to the toggle label.
Clicking it opens the same floating palette.

### Config Parameters

| Parameter   | Type     | Default             | Description                                                        |
|-------------|----------|---------------------|--------------------------------------------------------------------|
| `Name`      | string   | —                   | Label shown on the picker element                                  |
| `Default`   | Color3   | `RGB(255, 255, 255)` | Initial color                                                     |
| `Flag`      | string   | `nil`               | Key in `Library.flags` (written as `Color3`)                       |
| `Callback`  | function | `nil`               | Called with `(Color: Color3, Transparency: number)` on change      |

### Methods

| Method                      | Returns | Description                               |
|-----------------------------|---------|-------------------------------------------|
| `ColorPicker:SetValue(color)` | void  | Programmatically set the color            |
| `ColorPicker:GetValue()`    | Color3  | Returns the current Color3                |
| `ColorPicker:ClosePallete()` | void   | Closes the floating palette if open       |

### Example

```lua
-- Standalone picker
local EspColor = EspSection:AddColorPicker({
    Name     = "ESP Color",
    Default  = Color3.fromRGB(255, 50, 50),
    Flag     = "EspColor",
    Callback = function(Color, Transparency)
        -- Color is Color3, Transparency is 0-1
        _G.EspColor         = Color
        _G.EspTransparency  = Transparency
    end,
})

-- Attached to a toggle (inline swatch)
local ChamToggle = Section:AddToggle({
    Name     = "Chams",
    Default  = false,
    Flag     = "Chams",
    Callback = function(State) end,
})

ChamToggle:AddColorPicker({
    Name     = "Chams Color",
    Default  = Color3.fromRGB(255, 255, 255),
    Flag     = "ChamsColor",
    Callback = function(Color, Transparency)
        _G.ChamsColor = Color
    end,
})

-- Programmatic control
EspColor:SetValue(Color3.fromRGB(0, 200, 255))
print(EspColor:GetValue())  --> Color3 [0, 0.784, 1]
```

---

## 13. Keybind

A standalone keybind element. Separate from the keybind that can be attached to a Toggle.
Clicking the label lets the user press a new key.
Writes the bind state to `Library.flags[Flag]` on activation.

### Create

```lua
local Keybind = Section:AddKeybind(Config: table): Keybind
```

### Config Parameters

| Parameter  | Type          | Default                 | Description                                                   |
|------------|---------------|-------------------------|---------------------------------------------------------------|
| `Name`     | string        | —                       | Display label                                                 |
| `Default`  | Enum.KeyCode  | `Enum.KeyCode.Unknown`  | Initial bound key                                             |
| `Mode`     | string        | `"Toggle"`              | `"Toggle"` — fires once per press; `"Hold"` — true while held |
| `Flag`     | string        | `nil`                   | Key in `Library.flags`                                        |
| `Callback` | function      | `nil`                   | Called with `(State: boolean)` on activation                  |

### Methods

| Method                  | Returns      | Description                             |
|-------------------------|--------------|-----------------------------------------|
| `Keybind:SetBind(key)`  | void         | Programmatically set the bound key      |
| `Keybind:GetBind()`     | Enum.KeyCode | Returns the currently bound key         |
| `Keybind:GetMode()`     | string       | Returns `"Toggle"` or `"Hold"`          |

### Example

```lua
local EspBind = MiscSection:AddKeybind({
    Name     = "Toggle ESP",
    Default  = Enum.KeyCode.Z,
    Mode     = "Toggle",
    Flag     = "EspKey",
    Callback = function(State)
        -- State toggles true/false on each press
        Library.flags["Esp"] = State
    end,
})

local SprintBind = MiscSection:AddKeybind({
    Name     = "Sprint",
    Default  = Enum.KeyCode.LeftShift,
    Mode     = "Hold",   -- true while held, false on release
    Flag     = "Sprinting",
    Callback = function(State)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = State and 50 or 16
        end
    end,
})

-- Runtime rebind
EspBind:SetBind(Enum.KeyCode.F2)
print(EspBind:GetBind())   --> Enum.KeyCode.F2
print(EspBind:GetMode())   --> "Toggle"
```

---

## 14. Flags

All elements with a `Flag` field write their current value into a shared table:

```lua
Library.flags  -- { [flagName] = currentValue }
```

The value type depends on the element:

| Element      | Value type |
|--------------|------------|
| Toggle       | boolean    |
| Slider       | number     |
| Dropdown     | string     |
| TextBox      | string or number |
| ColorPicker  | Color3     |
| Keybind      | boolean (activation state) |

### Usage

```lua
-- Read a value anywhere in the script
local speed = Library.flags["WalkSpeed"]
local aimOn = Library.flags["Aimbot"]
local color = Library.flags["EspColor"]

-- Flags update instantly — safe to read inside a loop
game:GetService("RunService").Heartbeat:Connect(function()
    if Library.flags["Aimbot"] then
        -- run aimbot logic
    end
end)
```

---

## 15. HUD

A floating overlay outside the main window. Displays a vertical list of labeled text lines.
Stays visible even when the main window is hidden.
Each line is updated manually via `SetText`.

### Create

```lua
local Hud = Window:MakeHud(Config: table): Hud
```

### Config Parameters

| Parameter | Type   | Default | Description            |
|-----------|--------|---------|------------------------|
| `Name`    | string | —       | HUD panel title label  |

### Add a Label

```lua
local Label = Hud:AddLabel(Config: table): HudLabel
```

| Parameter | Type   | Default | Description                                              |
|-----------|--------|---------|----------------------------------------------------------|
| `Name`    | string | —       | Static prefix shown before the value                     |
| `Flag`    | string | `nil`   | Key in `Library.flags` (not used for automatic updates)  |

### HudLabel Methods

| Method                  | Returns | Description                        |
|-------------------------|---------|------------------------------------|
| `Label:SetText(text)`   | void    | Updates the displayed text         |

### Example

```lua
local Hud     = Window:MakeHud({ Name = "Stats" })
local FpsLabel  = Hud:AddLabel({ Name = "FPS",    Flag = "HudFPS"   })
local PingLabel = Hud:AddLabel({ Name = "Ping",   Flag = "HudPing"  })
local SpeedLabel = Hud:AddLabel({ Name = "Speed", Flag = "HudSpeed" })

local RunService = game:GetService("RunService")
local Stats      = game:GetService("Stats")

RunService.Heartbeat:Connect(function()
    local fps   = math.floor(1 / Stats.HeartbeatTimeMs * 1000)
    local ping  = math.floor(game.Players.LocalPlayer:GetNetworkPing() * 1000)
    local char  = game.Players.LocalPlayer.Character
    local speed = 0
    if char and char:FindFirstChild("HumanoidRootPart") then
        local vel = char.HumanoidRootPart.AssemblyLinearVelocity
        speed = math.floor(Vector2.new(vel.X, vel.Z).Magnitude)
    end

    FpsLabel:SetText(string.format("FPS:   %d", fps))
    PingLabel:SetText(string.format("Ping:  %d ms", ping))
    SpeedLabel:SetText(string.format("Speed: %d st/s", speed))
end)
```

---

## 16. KeybindViewer

A floating panel that lists all currently bound keybinds registered through the library.
Auto-populates from any Toggle or Keybind element that has a bound key.

### Create

```lua
local KV = Window:MakeKeybindViewer(Config: table): KeybindViewer
```

### Config Parameters

| Parameter | Type   | Default | Description              |
|-----------|--------|---------|--------------------------|
| `Name`    | string | —       | Panel header label       |

### Example

```lua
local KV = Window:MakeKeybindViewer({ Name = "Binds" })
```

---

## 17. ToggleList

A floating checklist panel that mirrors the on/off state of all flagged Toggles.
Useful as a quick overview of what features are active.

### Create

```lua
local TL = Window:MakeToggleList(Config: table): ToggleList
```

### Config Parameters

| Parameter | Type   | Default | Description              |
|-----------|--------|---------|--------------------------|
| `Name`    | string | —       | Panel header label       |

### Example

```lua
local TL = Window:MakeToggleList({ Name = "Active Features" })
```

---

## 18. ConfigManager

Saves and loads all element states to and from the executor filesystem.
Files are stored in a folder named `XclusiveUI` under the executor's workspace directory.
Each config is saved as a serialized Lua table in a `.txt` file.

### Load

```lua
local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()
```

### Setup

```lua
ConfigManager:SetLibrary(Library)
ConfigManager:BuildFolderTree()
```

Both calls are required before saving or loading. Call them after all elements have been created.

### Methods

| Method                           | Returns       | Description                                                   |
|----------------------------------|---------------|---------------------------------------------------------------|
| `ConfigManager:SetLibrary(lib)`  | void          | Connects ConfigManager to the Library element registry        |
| `ConfigManager:BuildFolderTree()`| void          | Creates the `XclusiveUI` folder in the executor workspace     |
| `ConfigManager:Save(name)`       | void          | Saves all current element states to `<name>.txt`              |
| `ConfigManager:Load(name)`       | void          | Loads and applies element states from `<name>.txt`            |
| `ConfigManager:GetConfigs()`     | table         | Returns a list of all saved config names                      |
| `ConfigManager:Delete(name)`     | void          | Deletes a saved config file                                   |

### Supported Element Types

`Toggle`, `Slider`, `Dropdown`, `ColorPicker`, `Keybind` (bound key + mode), `TextBox`

### Example

```lua
local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()

-- Setup (call after all elements are created)
ConfigManager:SetLibrary(Library)
ConfigManager:BuildFolderTree()

-- Save current state
ConfigManager:Save("my_config")

-- Load a saved state
ConfigManager:Load("my_config")

-- List all saved configs
local configs = ConfigManager:GetConfigs()
-- returns: { "my_config", "pvp", "silent_aim", ... }

-- Dropdown to select and load a config
Section:AddDropdown({
    Name     = "Load Config",
    Options  = ConfigManager:GetConfigs(),
    Default  = "",
    Flag     = "SelectedConfig",
    Callback = function(Value)
        if Value ~= "" then
            ConfigManager:Load(Value)
        end
    end,
})
```

---

## 19. NotificationModule

Displays toast-style notification popups in the corner of the screen.
Fully independent of the main window — works even when the UI is hidden.

### Load

```lua
local Notifications = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/NotificationModule.lua"
))()
```

### Methods

```lua
Notifications:Send(Config: table)
```

### Config Parameters

| Parameter | Type   | Default | Description                                      |
|-----------|--------|---------|--------------------------------------------------|
| `Title`   | string | —       | Bold title line of the notification              |
| `Content` | string | —       | Body text below the title                        |
| `Duration`| number | `3`     | How many seconds before the notification fades   |

### Example

```lua
local Notifications = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/NotificationModule.lua"
))()

Notifications:Send({
    Title    = "Xclusive UI",
    Content  = "Script loaded successfully.",
    Duration = 4,
})

Notifications:Send({
    Title    = "Config",
    Content  = "Saved: pvp_config",
    Duration = 3,
})

Notifications:Send({
    Title    = "Warning",
    Content  = "Target player not found.",
    Duration = 5,
})
```

---

## 20. Loader

Fetches and executes a game-specific script from the repository's `Games/` folder.
Falls back to `Games/Universal.lua` if no file for the current game ID exists.

### Repository Structure

```
Games/
    Universal.lua          <- runs in any game
    12345678.lua           <- runs only in game ID 12345678
    87654321.lua           <- runs only in game ID 87654321
```

### Load

```lua
loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Loader/Loader.lua"
))()
```

### How It Works

1. Constructs a URL: `Games/<game.GameId>.lua`
2. Attempts `HttpGet` on that URL
3. If the request fails or returns nothing, falls back to `Games/Universal.lua`
4. Executes the fetched body with `loadstring`

---

## 21. Full Example

A complete, ready-to-use combat script template with all element types,
a live HUD update loop, ConfigManager, theme switching, and notifications.

```lua
-- ============================================================
--  XCLUSIVE UI - FULL EXAMPLE TEMPLATE
-- ============================================================

local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"
))()

local ConfigManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"
))()

local Notifications = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/NotificationModule.lua"
))()

local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats      = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

-- ──────────────────────────────────────────────────────────────
--  WINDOW
-- ──────────────────────────────────────────────────────────────

local Window = Library:MakeWindow({
    WindowName    = "Xclusive Hub",
    Keybind       = Enum.KeyCode.RightShift,
    Color         = Color3.fromRGB(255, 255, 255),
    InitialWidth  = 520,
    InitialHeight = 430,
    MinWidth      = 300,
    MaxWidth      = 800,
    MinHeight     = 100,
    MaxHeight     = 600,
}, game.CoreGui)

-- ──────────────────────────────────────────────────────────────
--  HUD
-- ──────────────────────────────────────────────────────────────

local Hud        = Window:MakeHud({ Name = "Info" })
local HudFPS     = Hud:AddLabel({ Name = "FPS",   Flag = "HudFPS"   })
local HudPing    = Hud:AddLabel({ Name = "Ping",  Flag = "HudPing"  })
local HudSpeed   = Hud:AddLabel({ Name = "Speed", Flag = "HudSpeed" })

RunService.Heartbeat:Connect(function()
    local fps   = math.floor(1 / Stats.HeartbeatTimeMs * 1000)
    local ping  = math.floor(LocalPlayer:GetNetworkPing() * 1000)
    local char  = LocalPlayer.Character
    local speed = 0
    if char and char:FindFirstChild("HumanoidRootPart") then
        local v = char.HumanoidRootPart.AssemblyLinearVelocity
        speed = math.floor(Vector2.new(v.X, v.Z).Magnitude)
    end
    HudFPS:SetText(string.format("FPS:   %d", fps))
    HudPing:SetText(string.format("Ping:  %d ms", ping))
    HudSpeed:SetText(string.format("Speed: %d st/s", speed))
end)

-- ──────────────────────────────────────────────────────────────
--  KEYBIND VIEWER + TOGGLE LIST
-- ──────────────────────────────────────────────────────────────

Window:MakeKeybindViewer({ Name = "Keybinds" })
Window:MakeToggleList({ Name = "Active Features" })

-- ──────────────────────────────────────────────────────────────
--  COMBAT TAB
-- ──────────────────────────────────────────────────────────────

local CombatTab = Window:MakeTab({ Name = "Combat" })

local AimbotSection = CombatTab:MakeSection({ Name = "Aimbot" })

local AimbotToggle = AimbotSection:AddToggle({
    Name     = "Aimbot",
    Default  = false,
    Flag     = "Aimbot",
    Keybind  = { Default = Enum.KeyCode.Q, Mode = "Hold", Callback = function(s) end },
    Callback = function(State)
        -- toggle aimbot on/off
    end,
})

AimbotSection:AddSlider({
    Name     = "FOV",
    Min      = 1,
    Max      = 500,
    Default  = 120,
    Precise  = true,
    Suffix   = " px",
    Flag     = "AimbotFOV",
    Callback = function(Value)
        -- update FOV circle radius
    end,
})

AimbotSection:AddSlider({
    Name     = "Smoothness",
    Min      = 1,
    Max      = 100,
    Default  = 15,
    Precise  = true,
    Flag     = "AimbotSmooth",
    Callback = function(Value) end,
})

AimbotSection:AddDropdown({
    Name     = "Hit Part",
    Options  = { "Head", "Torso", "Left Arm", "Right Arm", "Random" },
    Default  = "Head",
    Flag     = "AimbotPart",
    Callback = function(Value) end,
})

AimbotSection:AddToggle({
    Name     = "Visible Only",
    Default  = true,
    Flag     = "AimbotVisible",
    Callback = function(State) end,
})

local EspSection = CombatTab:MakeSection({ Name = "ESP" })

local EspToggle = EspSection:AddToggle({
    Name     = "ESP",
    Default  = false,
    Flag     = "Esp",
    Keybind  = { Default = Enum.KeyCode.Z, Mode = "Toggle", Callback = function(s) end },
    Callback = function(State) end,
})

EspToggle:AddColorPicker({
    Name     = "ESP Color",
    Default  = Color3.fromRGB(255, 50, 50),
    Flag     = "EspColor",
    Callback = function(Color, Transparency) end,
})

EspSection:AddToggle({
    Name     = "Show Name",
    Default  = true,
    Flag     = "EspName",
    Callback = function(State) end,
})

EspSection:AddToggle({
    Name     = "Show Health",
    Default  = true,
    Flag     = "EspHealth",
    Callback = function(State) end,
})

EspSection:AddToggle({
    Name     = "Show Distance",
    Default  = true,
    Flag     = "EspDist",
    Callback = function(State) end,
})

EspSection:AddSlider({
    Name     = "Max Distance",
    Min      = 10,
    Max      = 2000,
    Default  = 500,
    Precise  = true,
    Suffix   = " studs",
    Flag     = "EspMaxDist",
    Callback = function(Value) end,
})

local ChamSection = CombatTab:MakeSection({ Name = "Chams" })

local ChamToggle = ChamSection:AddToggle({
    Name     = "Chams",
    Default  = false,
    Flag     = "Chams",
    Callback = function(State) end,
})

ChamToggle:AddColorPicker({
    Name     = "Chams Color",
    Default  = Color3.fromRGB(255, 200, 100),
    Flag     = "ChamsColor",
    Callback = function(Color, Transparency) end,
})

ChamSection:AddDropdown({
    Name     = "Cham Style",
    Options  = { "Flat", "Shaded", "Wireframe" },
    Default  = "Flat",
    Flag     = "ChamStyle",
    Callback = function(Value) end,
})

-- ──────────────────────────────────────────────────────────────
--  VISUALS TAB
-- ──────────────────────────────────────────────────────────────

local VisualsTab = Window:MakeTab({ Name = "Visuals" })

local WorldSection = VisualsTab:MakeSection({ Name = "World" })

WorldSection:AddToggle({
    Name     = "Fullbright",
    Default  = false,
    Flag     = "Fullbright",
    Callback = function(State)
        local Lighting = game:GetService("Lighting")
        Lighting.Brightness     = State and 10 or 1
        Lighting.GlobalShadows  = not State
        Lighting.FogEnd         = State and 1e9 or 100000
    end,
})

WorldSection:AddSlider({
    Name     = "Time of Day",
    Min      = 0,
    Max      = 24,
    Default  = 14,
    Precise  = false,
    Suffix   = ":00",
    Flag     = "TimeOfDay",
    Callback = function(Value)
        game:GetService("Lighting"):SetMinutesAfterMidnight(Value * 60)
    end,
})

local CharSection = VisualsTab:MakeSection({ Name = "Character" })

CharSection:AddSlider({
    Name     = "Walk Speed",
    Min      = 16,
    Max      = 500,
    Default  = 16,
    Precise  = true,
    Suffix   = " st/s",
    Flag     = "WalkSpeed",
    Callback = function(Value)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end,
})

CharSection:AddSlider({
    Name     = "Jump Power",
    Min      = 50,
    Max      = 500,
    Default  = 50,
    Precise  = true,
    Flag     = "JumpPower",
    Callback = function(Value)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end,
})

CharSection:AddToggle({
    Name     = "Infinite Jump",
    Default  = false,
    Flag     = "InfJump",
    Keybind  = { Default = Enum.KeyCode.X, Mode = "Toggle", Callback = function(s) end },
    Callback = function(State)
        -- hook jump logic here
    end,
})

CharSection:AddToggle({
    Name     = "No Clip",
    Default  = false,
    Flag     = "NoClip",
    Keybind  = { Default = Enum.KeyCode.V, Mode = "Toggle", Callback = function(s) end },
    Callback = function(State) end,
})

-- ──────────────────────────────────────────────────────────────
--  MISC TAB
-- ──────────────────────────────────────────────────────────────

local MiscTab = Window:MakeTab({ Name = "Misc" })

local ThemeSection = MiscTab:MakeSection({ Name = "Theme" })

ThemeSection:AddDropdown({
    Name     = "Preset",
    Options  = Library:GetThemes(),
    Default  = "Default",
    Flag     = "ThemePreset",
    Callback = function(Value)
        Library:SetTheme(Value)
    end,
})

ThemeSection:AddColorPicker({
    Name     = "Custom Accent",
    Default  = Color3.fromRGB(255, 255, 255),
    Flag     = "CustomAccent",
    Callback = function(Color, Transparency)
        Window:ChangeColor(Color)
    end,
})

local UtilSection = MiscTab:MakeSection({ Name = "Utility" })

UtilSection:AddKeybind({
    Name     = "Toggle UI",
    Default  = Enum.KeyCode.RightShift,
    Mode     = "Toggle",
    Flag     = "UIToggle",
    Callback = function(State)
        Window:Toggle(State)
    end,
})

UtilSection:AddTextBox({
    Name        = "Target Player",
    Default     = "Enter name...",
    NumbersOnly = false,
    Flag        = "TargetName",
    Callback    = function(Value)
        -- find and store target reference
    end,
})

UtilSection:AddButton({
    Name     = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end,
})

UtilSection:AddButton({
    Name     = "Reset Character",
    Callback = function() end,
}, {
    Name     = "Confirm Reset",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0
        end
    end,
})

-- ──────────────────────────────────────────────────────────────
--  CONFIG TAB
-- ──────────────────────────────────────────────────────────────

local ConfigTab     = Window:MakeTab({ Name = "Config" })
local ConfigSection = ConfigTab:MakeSection({ Name = "Configuration" })

-- Setup ConfigManager (must be after all elements are created)
ConfigManager:SetLibrary(Library)
ConfigManager:BuildFolderTree()

local ConfigInput = ConfigSection:AddTextBox({
    Name        = "Config Name",
    Default     = "default",
    NumbersOnly = false,
    Flag        = "ConfigName",
    Callback    = function(Value) end,
})

ConfigSection:AddButton({
    Name     = "Save Config",
    Callback = function()
        local name = Library.flags["ConfigName"] or "default"
        ConfigManager:Save(name)
        Notifications:Send({
            Title    = "Config",
            Content  = "Saved: " .. name,
            Duration = 3,
        })
    end,
})

ConfigSection:AddButton({
    Name     = "Load Config",
    Callback = function()
        local name = Library.flags["ConfigName"] or "default"
        ConfigManager:Load(name)
        Notifications:Send({
            Title    = "Config",
            Content  = "Loaded: " .. name,
            Duration = 3,
        })
    end,
})

ConfigSection:AddDropdown({
    Name     = "Saved Configs",
    Options  = ConfigManager:GetConfigs(),
    Default  = "",
    Flag     = "SelectedConfig",
    Callback = function(Value)
        if Value ~= "" then
            ConfigManager:Load(Value)
            Notifications:Send({
                Title    = "Config",
                Content  = "Loaded: " .. Value,
                Duration = 3,
            })
        end
    end,
})

-- ──────────────────────────────────────────────────────────────
--  DONE
-- ──────────────────────────────────────────────────────────────

Notifications:Send({
    Title    = "Xclusive Hub",
    Content  = "Loaded successfully.",
    Duration = 4,
})
```

---

## License

MIT License - see [LICENSE](LICENSE)
