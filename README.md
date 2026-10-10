# Xclusive UI

A reimagined customizable UI library for Roblox interfaces.

---

## Table of Contents

- [Loading the Library](#loading-the-library)
- [Library](#library)
  - [CreateWindow](#createwindow)
  - [Hud](#hud)
  - [CreateKeybindViewer](#createkeybindviewer)
  - [CreateToggleList](#createtogglelist)
  - [SetWindowName](#setwindowname)
  - [SetTheme](#settheme)
  - [GetThemes](#getthemes)
  - [Notify](#notify)
  - [Destroy](#destroy)
- [Window](#window)
  - [CreateTab](#createtab)
  - [ChangeColor](#changecolor)
  - [Toggle](#toggle)
  - [SetBackground](#setbackground)
  - [SetFont](#setfont)
  - [CreateGlow](#createglow)
  - [CreateParticles](#createparticles)
  - [Destroy (Window)](#destroy-window)
- [Tab](#tab)
  - [CreateSection](#createsection)
- [Section](#section)
  - [CreateLabel](#createlabel)
  - [CreateButton](#createbutton)
  - [CreateTextBox](#createtextbox)
  - [CreateToggle](#createtoggle)
  - [CreateSlider](#createslider)
  - [CreateDropdown](#createdropdown)
  - [CreateColorpicker](#createcolorpicker)
  - [CreateDivider](#createdivider)
- [Toggle Element](#toggle-element)
  - [SetState](#setstate)
  - [GetState](#getstate)
  - [SetStatus](#setstatus)
  - [SetInfo](#setinfo)
  - [SetVisible](#setvisible)
  - [CreateKeybind](#createkeybind)
  - [GetKeybind](#getkeybind)
- [Keybind Element](#keybind-element)
- [Slider Element](#slider-element)
- [Dropdown Element](#dropdown-element)
- [ColorPicker Element](#colorpicker-element)
- [Hud Element](#hud-element)
- [Flags](#flags)
- [ConfigManager](#configmanager)
  - [Setup](#configmanager-setup)
  - [Methods](#configmanager-methods)
  - [Auto Config UI](#auto-config-ui)
- [Full Example](#full-example)

---

## Loading the Library

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
```

To also load ConfigManager:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
local ConfigManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"))()
```

---

## Library

### CreateWindow

Creates the main UI window.

```lua
local Window = Library:CreateWindow(Config, Parent)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Config` | table | Window configuration (see below) |
| `Parent` | Instance | The Roblox instance to parent the UI to |

**Config fields:**

| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `WindowName` | string | required | Title displayed in the window header |
| `Color` | Color3 | required | Accent color of the window |
| `MinHeight` | number | optional | Minimum window height in pixels |
| `MaxHeight` | number | optional | Maximum window height in pixels |
| `InitialHeight` | number | optional | Starting height in pixels |
| `MinWidth` | number | optional | Minimum window width in pixels |
| `MaxWidth` | number | optional | Maximum window width in pixels |
| `InitialWidth` | number | optional | Starting width in pixels |
| `Keybind` | Enum.KeyCode | optional | Key to toggle window visibility |

**Example:**

```lua
local Window = Library:CreateWindow({
	WindowName = "Xclusive Hub",
	Color = Color3.fromRGB(100, 60, 220),
	MinHeight = 300,
	MaxHeight = 700,
	InitialHeight = 500,
	MinWidth = 400,
	MaxWidth = 800,
	InitialWidth = 550,
	Keybind = Enum.KeyCode.RightShift
}, game.CoreGui)
```

---

### Hud

Creates a HUD overlay — a single draggable text block that renders above the game world.

```lua
local Hud = Library:Hud()
```

Use `\n` to separate multiple lines of information:

```lua
Hud:SetText("Speed: " .. speed .. "\nHealth: " .. health)
```

See [Hud Element](#hud-element) for all available methods.

---

### CreateKeybindViewer

Creates a floating keybind reference panel.

```lua
local KeybindViewer = Library:CreateKeybindViewer(Config)
```

---

### CreateToggleList

Creates a floating toggle list panel.

```lua
local ToggleList = Library:CreateToggleList(Config)
```

---

### SetWindowName

Updates the window title text at runtime.

```lua
Library:SetWindowName("New Title")
```

---

### SetTheme

Applies a built-in color theme by name.

```lua
Library:SetTheme(ThemeName)
```

---

### GetThemes

Returns a table of available theme names.

```lua
local themes = Library:GetThemes()
```

---

### Notify

Sends a toast notification.

```lua
Library:Notify(title, content, duration)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | string | Notification title |
| `content` | string | Notification body text |
| `duration` | number | Seconds before the notification disappears |

**Example:**

```lua
Library:Notify("Success", "Config saved!", 5)
```

---

### Destroy

Destroys the entire UI and cleans up all connections.

```lua
Library:Destroy()
```

---

## Window

Returned by `Library:CreateWindow()`.

### CreateTab

Creates a new tab in the window.

```lua
local Tab = Window:CreateTab(Name)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Label shown on the tab button |

**Example:**

```lua
local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")
```

---

### ChangeColor

Changes the window accent color at runtime.

```lua
Window:ChangeColor(Color)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Color` | Color3 | New accent color |

---

### Toggle

Shows or hides the window.

```lua
Window:Toggle(State)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `State` | boolean | `true` to show, `false` to hide |

---

### SetBackground

Sets the window background image.

```lua
Window:SetBackground(ImageId)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `ImageId` | string | Roblox asset ID (e.g. `"rbxassetid://12345678"`) |

---

### SetFont

Changes the font used throughout the window.

```lua
Window:SetFont(Font)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Font` | Enum.Font | Roblox font enum value |

---

### CreateGlow

Enables or disables a glow effect around the window.

```lua
Window:CreateGlow(enableGlow, glowConfig)
```

---

### CreateParticles

Enables or disables decorative particles on the window.

```lua
Window:CreateParticles(enableParticles)
```

---

### Destroy (Window)

Destroys this window instance and cleans up its connections.

```lua
Window:Destroy()
```

---

## Tab

Returned by `Window:CreateTab()`.

### CreateSection

Creates a content section within the tab.

```lua
local Section = Tab:CreateSection(Name, Side)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Section header label |
| `Side` | string? | Optional. `"Left"` or `"Right"` for two-column layouts |

**Example:**

```lua
local MainSection = Tab:CreateSection("Main")
local LeftSection  = Tab:CreateSection("Left Panel",  "Left")
local RightSection = Tab:CreateSection("Right Panel", "Right")
```

---

## Section

Returned by `Tab:CreateSection()`. All element creators use **positional arguments** (not config tables).

### CreateLabel

Creates a static text label.

```lua
local Label = Section:CreateLabel(Name, WrapText)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Label text |
| `WrapText` | boolean? | Whether text wraps to multiple lines |

**Label methods:**

```lua
Label:UpdateText(NewText)
```

---

### CreateButton

Creates a clickable button.

```lua
local Button = Section:CreateButton(Name, Callback, WrapText)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Button label |
| `Callback` | function | Called when the button is clicked |
| `WrapText` | boolean? | Whether text wraps |

**Example:**

```lua
Section:CreateButton("Reset Values", function()
	print("Reset clicked")
end)
```

---

### CreateTextBox

Creates an input text field.

```lua
local TextBox = Section:CreateTextBox(Name, PlaceHolder, NumbersOnly, Callback, WrapText)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Label above the input |
| `PlaceHolder` | string | Placeholder text inside the field |
| `NumbersOnly` | boolean | When `true`, only numeric input is accepted |
| `Callback` | function(Value: string) | Called when the user submits input |
| `WrapText` | boolean? | Whether the label text wraps |

**TextBox methods:**

```lua
TextBox:GetValue()         -- returns current string value
TextBox:SetValue(Value)    -- sets the text programmatically
```

**Example:**

```lua
local NameBox = Section:CreateTextBox("Player Name", "Enter name...", false, function(Value)
	print("Submitted:", Value)
end)
```

---

### CreateToggle

Creates an on/off toggle switch.

```lua
local Toggle = Section:CreateToggle(Name, Default, Callback, Status, Info, WrapText, Flag)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Toggle label |
| `Default` | boolean? | Initial state (`true` = on) |
| `Callback` | function(State: boolean) | Called when the toggle changes |
| `Status` | string? | Optional status text displayed next to the toggle |
| `Info` | string? | Optional tooltip / info text |
| `WrapText` | boolean? | Whether the label wraps |
| `Flag` | string? | Unique key for config saving (see [Flags](#flags)) |

See [Toggle Element](#toggle-element) for all available methods.

**Example:**

```lua
local SpeedToggle = Section:CreateToggle("Speed Hack", false, function(State)
	print("Speed hack:", State)
end, nil, "Modifies walk speed", false, "SpeedHack")
```

---

### CreateSlider

Creates a value slider.

```lua
local Slider = Section:CreateSlider(Name, Min, Max, Default, Precise, Callback, WrapText, Suffix, Flag)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Slider label |
| `Min` | number | Minimum value |
| `Max` | number | Maximum value |
| `Default` | number? | Initial value |
| `Precise` | boolean? | When `false`, values are integer steps; when `true`, allows decimals |
| `Callback` | function(Value: number) | Called when the value changes |
| `WrapText` | boolean? | Whether the label wraps |
| `Suffix` | string? | Unit suffix displayed after the value (e.g. `"x"`, `"%"`) |
| `Flag` | string? | Unique key for config saving (see [Flags](#flags)) |

See [Slider Element](#slider-element) for all available methods.

**Example:**

```lua
local SpeedSlider = Section:CreateSlider("Walk Speed", 0, 100, 16, false, function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end, false, " studs/s", "WalkSpeed")
```

---

### CreateDropdown

Creates a selection dropdown.

```lua
local Dropdown = Section:CreateDropdown(Name, OptionTable, Callback, InitialValue, Multi, WrapText, KeepRemoved, Flag)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Dropdown label |
| `OptionTable` | {string} | List of selectable options |
| `Callback` | function(Value: any) | Called when selection changes |
| `InitialValue` | any? | Pre-selected value on creation |
| `Multi` | boolean? | When `true`, allows selecting multiple options |
| `WrapText` | boolean? | Whether the label wraps |
| `KeepRemoved` | boolean? | When `true`, removed options are remembered |
| `Flag` | string? | Unique key for config saving (see [Flags](#flags)) |

See [Dropdown Element](#dropdown-element) for all available methods.

**Example:**

```lua
local TeamDropdown = Section:CreateDropdown("Select Team", {"Red", "Blue", "Green"}, function(Value)
	print("Selected:", Value)
end, "Red")
```

---

### CreateColorpicker

Creates a color picker, optionally attached to a toggle element.

```lua
local ColorPicker = Section:CreateColorpicker(Name, Callback, IsAccentColorpicker, WrapText, AttachToToggle)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Name` | string | Label for the color picker |
| `Callback` | function(Color: Color3, Transparency: number?) | Called when color or transparency changes |
| `IsAccentColorpicker` | boolean? | When `true`, changing this color updates the window accent |
| `WrapText` | boolean? | Whether the label wraps |
| `AttachToToggle` | Element? | A toggle element to attach this picker to |

To attach a color picker to a toggle, pass the toggle as the last argument:

```lua
local MyToggle = Section:CreateToggle("Enable Effect", false, function(State) end)
local MyColor  = Section:CreateColorpicker("Effect Color", function(Color, Transparency)
	print(Color, Transparency)
end, nil, nil, MyToggle)
```

See [ColorPicker Element](#colorpicker-element) for all available methods.

---

### CreateDivider

Inserts a horizontal divider line between elements.

```lua
Section:CreateDivider()
```

---

## Toggle Element

Returned by `Section:CreateToggle()`.

### SetState

Sets the toggle on or off programmatically.

```lua
Toggle:SetState(State)
```

### GetState

Returns the current state of the toggle.

```lua
local state = Toggle:GetState()  -- returns boolean
```

### SetStatus

Updates the status text displayed alongside the toggle.

```lua
Toggle:SetStatus(NewStatus)
```

### SetInfo

Updates the info/tooltip text.

```lua
Toggle:SetInfo(NewInfo)
```

### SetVisible

Shows or hides the toggle element.

```lua
Toggle:SetVisible(Visible)
```

### CreateKeybind

Attaches a keybind to this toggle. Returns a [Keybind Element](#keybind-element).

```lua
local Keybind = Toggle:CreateKeybind(Bind, KeybindCallback, DefaultMode)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `Bind` | Enum.KeyCode | Default key |
| `KeybindCallback` | function? | Optional extra callback when the key is pressed |
| `DefaultMode` | string? | `"Toggle"` or `"Hold"` |

**Example:**

```lua
local SpeedToggle = Section:CreateToggle("Speed Hack", false, function(State)
	-- enable/disable speed
end)

SpeedToggle:CreateKeybind(Enum.KeyCode.X, nil, "Toggle")
```

### GetKeybind

Returns the attached [Keybind Element](#keybind-element), or `nil` if none.

```lua
local Keybind = Toggle:GetKeybind()
```

---

## Keybind Element

Returned by `Toggle:CreateKeybind()`.

```lua
Keybind:SetBind(Key)    -- Enum.KeyCode
Keybind:GetBind()       -- returns Enum.KeyCode
Keybind:SetMode(Mode)   -- "Toggle" or "Hold"
Keybind:GetMode()       -- returns current mode string
```

---

## Slider Element

Returned by `Section:CreateSlider()`.

```lua
Slider:SetValue(Value)  -- sets the slider to a number
Slider:GetValue()       -- returns the current number
```

---

## Dropdown Element

Returned by `Section:CreateDropdown()`.

```lua
Dropdown:GetOption()                              -- returns selected value (or table if Multi)
Dropdown:SetOption(Value)                         -- selects a value programmatically
Dropdown:ChangeOptions(NewOptionTable, InitialValue?)  -- replaces the entire options list
Dropdown:AddOption(OptionName, SelectImmediately?)     -- adds a single option
Dropdown:RemoveOption(OptionName)                      -- removes a single option
Dropdown:ClearOptions()                                -- removes all options
```

---

## ColorPicker Element

Returned by `Section:CreateColorpicker()`.

```lua
ColorPicker:GetValue()           -- returns Color3, transparency
ColorPicker:GetColor()           -- returns Color3
ColorPicker:GetTransparency()    -- returns number (0–1)
ColorPicker:SetTransparency(t)   -- sets transparency
ColorPicker:SetRainbow(State)    -- enables/disables rainbow cycling
ColorPicker:ClosePallete()       -- closes the color palette UI
ColorPicker:SetVisible(Visible)  -- shows/hides the picker
```

---

## Hud Element

Returned by `Library:Hud()`. The HUD is a single draggable text block — use `\n` to display multiple values.

```lua
Hud:SetText(text)           -- sets the full HUD text
Hud:GetText()               -- returns current text
Hud:SetVisibility(bool)     -- shows or hides the HUD
Hud:IsVisible()             -- returns boolean
Hud:SetTextColor(Color3)    -- changes the text color
Hud:SetTextSize(size)       -- changes the text size
Hud:SetFont(Enum.Font)      -- changes the font
Hud:SetPadding(right, bottom, left, top)  -- sets padding in pixels
Hud:SetDraggable(bool)      -- enables/disables drag
Hud:SetPosition(UDim2)      -- moves the HUD
Hud:GetPosition()           -- returns current UDim2 position
```

**Example:**

```lua
local Hud = Library:Hud()
Hud:SetText("Speed: 50\nHealth: 100\nCoins: 250")
Hud:SetTextColor(Color3.fromRGB(255, 255, 255))
Hud:SetTextSize(14)
Hud:SetVisibility(true)
```

---

## Flags

Flags are string keys that let ConfigManager track element values for save/load. Assign a unique flag to each element you want persisted:

```lua
local Toggle = Section:CreateToggle("My Feature", false, function(State) end,
	nil, nil, false, "MyFeatureFlag")

local Slider = Section:CreateSlider("Speed", 0, 100, 16, false, function(Value) end,
	false, nil, "SpeedFlag")

local Dropdown = Section:CreateDropdown("Team", {"Red", "Blue"}, function(Value) end,
	nil, false, false, false, "TeamFlag")
```

Elements without a flag are still functional but will not be saved or loaded by ConfigManager.

---

## ConfigManager

ConfigManager saves and loads element states to the executor's file system. Elements must have a [Flag](#flags) assigned to participate in save/load.

### ConfigManager Setup

```lua
local ConfigManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"))()

ConfigManager:SetLibrary(Library)   -- required
ConfigManager:SetWindow(Window)     -- required for notifications
ConfigManager:SetFolder("MyScript") -- optional, default is "XclusiveUI"
```

### ConfigManager Methods

```lua
-- Save current element states to a named config file
ConfigManager:Save(Name: string)

-- Load a named config file and restore element states
ConfigManager:Load(Name: string)

-- Delete a saved config file
ConfigManager:DeleteConfig(Name: string)

-- Returns a list of saved config names
ConfigManager:RefreshConfigList()

-- Exclude specific element flags from save/load
ConfigManager:SetIgnoreIndexes(List: {string})

-- Autoload methods — set which config loads automatically
ConfigManager:SetPlaceAutoloadConfig(ConfigName)    -- for current Place ID
ConfigManager:SetGameAutoloadConfig(ConfigName)     -- for current Game ID
ConfigManager:SetGlobalAutoloadConfig(ConfigName)   -- global fallback

-- Get the current autoload config name for each scope
ConfigManager:GetPlaceAutoloadConfig()
ConfigManager:GetGameAutoloadConfig()
ConfigManager:GetGlobalAutoloadConfig()

-- Load whichever autoload applies (place > game > global priority)
ConfigManager:LoadAutoloadConfig()
```

### Auto Config UI

`BuildConfigSection` automatically creates a full config management UI inside any tab section:

```lua
ConfigManager:BuildConfigSection(Tab)
```

This adds buttons for: Create, Load, Overwrite, Delete, Refresh, Set Place Autoload, Set Game Autoload, and Set Global Autoload — plus labels showing the current autoload status.

**Example:**

```lua
local SettingsTab = Window:CreateTab("Settings")
ConfigManager:BuildConfigSection(SettingsTab)
ConfigManager:LoadAutoloadConfig()
```

---

## Full Example

```lua
-- Load library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/LoadString.lua"))()
local ConfigManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Library/ConfigManager.lua"))()

-- Create window
local Window = Library:CreateWindow({
	WindowName = "Xclusive Hub",
	Color = Color3.fromRGB(100, 60, 220),
	MinHeight = 300,
	MaxHeight = 700,
	InitialHeight = 500,
	MinWidth = 400,
	MaxWidth = 800,
	InitialWidth = 550,
	Keybind = Enum.KeyCode.RightShift
}, game.CoreGui)

-- Create tabs
local MainTab     = Window:CreateTab("Main")
local VisualTab   = Window:CreateTab("Visuals")
local SettingsTab = Window:CreateTab("Settings")

-- Main tab
local PlayerSection = MainTab:CreateSection("Player")

local SpeedToggle = PlayerSection:CreateToggle("Speed Hack", false, function(State)
	local char = game.Players.LocalPlayer.Character
	if char then
		char.Humanoid.WalkSpeed = State and 50 or 16
	end
end, nil, "Increases walk speed", false, "SpeedHack")

SpeedToggle:CreateKeybind(Enum.KeyCode.X, nil, "Toggle")

local SpeedSlider = PlayerSection:CreateSlider("Walk Speed", 0, 200, 16, false, function(Value)
	local char = game.Players.LocalPlayer.Character
	if char then
		char.Humanoid.WalkSpeed = Value
	end
end, false, " studs/s", "WalkSpeed")

PlayerSection:CreateDivider()

local TeamDropdown = PlayerSection:CreateDropdown("Select Team", {"Red", "Blue", "Green"}, function(Value)
	print("Team selected:", Value)
end, "Red", false, false, false, "TeamSelection")

local NameBox = PlayerSection:CreateTextBox("Player Name", "Enter name...", false, function(Value)
	print("Name set to:", Value)
end)

PlayerSection:CreateButton("Reset Character", function()
	game.Players.LocalPlayer.Character:BreakJoints()
end)

-- Visuals tab
local EffectsSection = VisualTab:CreateSection("Effects")

local EffectToggle = EffectsSection:CreateToggle("Enable Glow", false, function(State)
	print("Glow:", State)
end, nil, nil, false, "GlowEffect")

local GlowColor = EffectsSection:CreateColorpicker("Glow Color", function(Color, Transparency)
	print("Color:", Color, "Alpha:", Transparency)
end, nil, nil, EffectToggle)

-- HUD
local Hud = Library:Hud()
Hud:SetText("Speed: 16\nHealth: 100")
Hud:SetTextColor(Color3.fromRGB(255, 255, 255))
Hud:SetTextSize(14)
Hud:SetVisibility(true)

-- Settings tab — config management
ConfigManager:SetLibrary(Library)
ConfigManager:SetWindow(Window)
ConfigManager:SetFolder("XclusiveHub")
ConfigManager:BuildConfigSection(SettingsTab)
ConfigManager:LoadAutoloadConfig()
```
