local G2L = {};

G2L["1"] = Instance.new("Folder");
G2L["1"]["Name"] = [[XclusiveUI]];

G2L["2"] = Instance.new("UIGradient", G2L["1"]);
G2L["2"]["Rotation"] = 90;
G2L["2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["3"] = Instance.new("ScreenGui", G2L["1"]);
G2L["3"]["IgnoreGuiInset"] = true;
G2L["3"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["3"]["Name"] = [[XclusiveUI]];
G2L["3"]["ResetOnSpawn"] = false;

G2L["4"] = Instance.new("Frame", G2L["3"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4"]["Size"] = UDim2.new(0, 500, 0, 500);
G2L["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4"]["Name"] = [[Main]];

G2L["5"] = Instance.new("Frame", G2L["4"]);
G2L["5"]["ZIndex"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5"]["Size"] = UDim2.new(1, 2, 1, 2);
G2L["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Name"] = [[Border]];

G2L["6"] = Instance.new("Frame", G2L["4"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["6"]["Size"] = UDim2.new(1, -10, 0, 15);
G2L["6"]["Position"] = UDim2.new(0.5, 0, 0, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["6"]["Name"] = [[Topbar]];
G2L["6"]["BackgroundTransparency"] = 1;

G2L["7"] = Instance.new("TextLabel", G2L["6"]);
G2L["7"]["TextStrokeTransparency"] = 0.75;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["7"]["TextSize"] = 15;
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["7"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["7"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["7"]["Text"] = [[Window Name]];
G2L["7"]["Name"] = [[WindowName]];
G2L["7"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

G2L["8"] = Instance.new("TextLabel", G2L["6"]);
G2L["8"]["TextStrokeTransparency"] = 0.75;
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["8"]["TextSize"] = 15;
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"]["TextColor3"] = Color3.fromRGB(102, 102, 102);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["8"]["Visible"] = false;
G2L["8"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["8"]["Text"] = [[XclusiveUI]];
G2L["8"]["Name"] = [[LibraryName]];
G2L["8"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

G2L["9"] = Instance.new("TextBox", G2L["6"]);
G2L["9"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
G2L["9"]["PlaceholderColor3"] = Color3.fromRGB(101, 101, 101);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["9"]["TextWrapped"] = true;
G2L["9"]["TextSize"] = 14;
G2L["9"]["Name"] = [[SearchBar]];
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["9"]["ClearTextOnFocus"] = false;
G2L["9"]["ClipsDescendants"] = true;
G2L["9"]["PlaceholderText"] = [[Search]];
G2L["9"]["Size"] = UDim2.new(0, 90, 0, 20);
G2L["9"]["Position"] = UDim2.new(0.95, -10, 0.6, 0);
G2L["9"]["Text"] = [[]];
G2L["9"]["BackgroundTransparency"] = 1;

G2L["a"] = Instance.new("TextButton", G2L["9"]);
G2L["a"]["TextSize"] = 16;
G2L["a"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["a"]["Size"] = UDim2.new(0, 20, 0, 20);
G2L["a"]["BackgroundTransparency"] = 1;
G2L["a"]["Name"] = [[ClearButton]];
G2L["a"]["Text"] = [[✕]];
G2L["a"]["Visible"] = false;
G2L["a"]["Position"] = UDim2.new(1, -5, 0.5, 0);

G2L["b"] = Instance.new("TextButton", G2L["6"]);
G2L["b"]["TextSize"] = 20;
G2L["b"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["b"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["b"]["Size"] = UDim2.new(0, 20, 0, 20);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["Name"] = [[Close]];
G2L["b"]["Text"] = [[×]];
G2L["b"]["Position"] = UDim2.new(1, 5, 0, 0);

G2L["c"] = Instance.new("ImageLabel", G2L["4"]);
G2L["c"]["ZIndex"] = 2;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["c"]["ScaleType"] = Enum.ScaleType.Tile;
G2L["c"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["c"]["TileSize"] = UDim2.new(0, 500, 0, 500);
G2L["c"]["Size"] = UDim2.new(1, -10, 1, -25);
G2L["c"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["c"]["Name"] = [[Holder]];
G2L["c"]["Position"] = UDim2.new(0.5, 0, 0, 20);

G2L["d"] = Instance.new("Frame", G2L["c"]);
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["d"]["Size"] = UDim2.new(1, 2, 1, 2);
G2L["d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Name"] = [[Border]];

G2L["e"] = Instance.new("Frame", G2L["c"]);
G2L["e"]["ZIndex"] = 3;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["e"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["e"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["e"]["Position"] = UDim2.new(0.5, 0, 0, 5);
G2L["e"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["e"]["Name"] = [[TBContainer]];

G2L["f"] = Instance.new("Frame", G2L["e"]);
G2L["f"]["ZIndex"] = 2;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["f"]["Size"] = UDim2.new(1, 2, 1, 2);
G2L["f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Name"] = [[Border]];

G2L["10"] = Instance.new("Frame", G2L["e"]);
G2L["10"]["ZIndex"] = 3;
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["10"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["10"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["10"]["Name"] = [[Holder]];
G2L["10"]["BackgroundTransparency"] = 1;

G2L["11"] = Instance.new("UIListLayout", G2L["10"]);
G2L["11"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["11"]["Name"] = [[ListLayout]];
G2L["11"]["FillDirection"] = Enum.FillDirection.Horizontal;

G2L["12"] = Instance.new("UIGradient", G2L["10"]);
G2L["12"]["Rotation"] = 90;
G2L["12"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["13"] = Instance.new("Frame", G2L["c"]);
G2L["13"]["ZIndex"] = 2;
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["13"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["13"]["Size"] = UDim2.new(1, 0, 1, -25);
G2L["13"]["Position"] = UDim2.new(0.5, 0, 0, 25);
G2L["13"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["13"]["Name"] = [[TContainer]];
G2L["13"]["BackgroundTransparency"] = 1;

G2L["14"] = Instance.new("UIGradient", G2L["c"]);
G2L["14"]["Rotation"] = 90;
G2L["14"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["15"] = Instance.new("TextLabel", G2L["3"]);
G2L["15"]["TextStrokeTransparency"] = 0.75;
G2L["15"]["ZIndex"] = 5;
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["TextSize"] = 15;
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["15"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["15"]["BackgroundTransparency"] = 0.5;
G2L["15"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["15"]["Size"] = UDim2.new(0, 45, 0, 20);
G2L["15"]["Visible"] = false;
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[ToolTip]];
G2L["15"]["Name"] = [[ToolTip]];

G2L["16"] = Instance.new("UICorner", G2L["15"]);
G2L["16"]["CornerRadius"] = UDim.new(0, 4);

G2L["17"] = Instance.new("Frame", G2L["1"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Size"] = UDim2.new(0, 388, 0, 35);
G2L["17"]["Position"] = UDim2.new(1, -398, 0, 10);
G2L["17"]["Name"] = [[Hud]];

G2L["18"] = Instance.new("Frame", G2L["17"]);
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["18"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["18"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["18"]["Name"] = [[BorderFrame1]];

G2L["19"] = Instance.new("Frame", G2L["18"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29);
G2L["19"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["19"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["19"]["Name"] = [[BorderFrame2]];

G2L["1a"] = Instance.new("Frame", G2L["19"]);
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["1a"]["Size"] = UDim2.new(1, -6, 1, -6);
G2L["1a"]["Position"] = UDim2.new(0, 3, 0, 3);
G2L["1a"]["Name"] = [[BorderFrame3]];

G2L["1b"] = Instance.new("Frame", G2L["1a"]);
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(6, 6, 5);
G2L["1b"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["1b"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["1b"]["Name"] = [[InnerFrame]];

G2L["1c"] = Instance.new("Frame", G2L["1b"]);
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(101, 151, 201);
G2L["1c"]["Size"] = UDim2.new(1, 0, 0, 1);
G2L["1c"]["Name"] = [[GradientFrame]];

G2L["1d"] = Instance.new("Frame", G2L["1b"]);
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Size"] = UDim2.new(1, 0, 0, 1);
G2L["1d"]["Position"] = UDim2.new(0, 0, 0, 1);
G2L["1d"]["Name"] = [[ShadowLine]];
G2L["1d"]["BackgroundTransparency"] = 0.2;

G2L["1e"] = Instance.new("TextLabel", G2L["1b"]);
G2L["1e"]["TextSize"] = 14;
G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["BackgroundTransparency"] = 1;
G2L["1e"]["RichText"] = true;
G2L["1e"]["Size"] = UDim2.new(1, -12, 1, -4);
G2L["1e"]["Text"] = [[<font color="rgb(255,255,255)">game</font><font color="rgb(163,200,79)">sense</font><font color="rgb(255,255,255)"> | </font><font color="rgb(255,255,255)">PerfectoExternal</font><font color="rgb(255,255,255)"> | </font><font color="rgb(255,255,255)">144fps</font><font color="rgb(255,255,255)"> | </font><font color="rgb(255,255,255)">72ms</font><font color="rgb(255,255,255)"> | </font><font color="rgb(255,255,255)">17:20</font>]];
G2L["1e"]["Name"] = [[InfoText]];
G2L["1e"]["Position"] = UDim2.new(0, 6, 0, 2);

G2L["1f"] = Instance.new("Frame", G2L["1"]);
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
G2L["1f"]["Size"] = UDim2.new(0, 200, 0, 27);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Name"] = [[KeybindViewer]];

G2L["20"] = Instance.new("Frame", G2L["1f"]);
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["20"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["20"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["20"]["Name"] = [[BorderFrame1]];

G2L["21"] = Instance.new("Frame", G2L["20"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29);
G2L["21"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["21"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["21"]["Name"] = [[BorderFrame2]];

G2L["22"] = Instance.new("Frame", G2L["21"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["22"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["22"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["22"]["Name"] = [[BorderFrame3]];

G2L["23"] = Instance.new("Frame", G2L["22"]);
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
G2L["23"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["23"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["23"]["Name"] = [[InnerFrame]];

G2L["24"] = Instance.new("TextLabel", G2L["23"]);
G2L["24"]["TextSize"] = 14;
G2L["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["24"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
G2L["24"]["BackgroundTransparency"] = 1;
G2L["24"]["Size"] = UDim2.new(1, 0, 0, 16);
G2L["24"]["Text"] = [[Keybinds]];
G2L["24"]["Name"] = [[Title]];

G2L["25"] = Instance.new("ScrollingFrame", G2L["23"]);
G2L["25"]["Name"] = [[Container]];
G2L["25"]["Size"] = UDim2.new(1, 0, 1, -20);
G2L["25"]["Position"] = UDim2.new(0, 0, 0, 15);
G2L["25"]["ScrollBarThickness"] = 2;
G2L["25"]["BackgroundTransparency"] = 1;

G2L["26"] = Instance.new("UIPadding", G2L["25"]);
G2L["26"]["PaddingTop"] = UDim.new(0, 5);
G2L["26"]["PaddingRight"] = UDim.new(0, 5);
G2L["26"]["PaddingLeft"] = UDim.new(0, 5);
G2L["26"]["PaddingBottom"] = UDim.new(0, 5);

G2L["27"] = Instance.new("UIListLayout", G2L["25"]);
G2L["27"]["Padding"] = UDim.new(0, 1);
G2L["27"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["27"]["Name"] = [[ListLayout]];

G2L["28"] = Instance.new("Frame", G2L["23"]);
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["Size"] = UDim2.new(1, 0, 0, 1);
G2L["28"]["BorderColor3"] = Color3.fromRGB(60, 60, 60);
G2L["28"]["Name"] = [[GradientFrame]];

G2L["29"] = Instance.new("UIGradient", G2L["23"]);
G2L["29"]["Rotation"] = 90;
G2L["29"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["2a"] = Instance.new("Frame", G2L["1"]);
G2L["2a"]["Visible"] = false;
G2L["2a"]["ZIndex"] = 5;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["2a"]["Size"] = UDim2.new(0, 150, 0, 240);
G2L["2a"]["Position"] = UDim2.new(0, 100, 0, 100);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Name"] = [[Palette]];

G2L["2b"] = Instance.new("ImageButton", G2L["2a"]);
G2L["2b"]["AutoButtonColor"] = false;
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["2b"]["ZIndex"] = 5;
G2L["2b"]["Size"] = UDim2.new(1, -10, 0, 150);
G2L["2b"]["Name"] = [[GradientPalette]];
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Position"] = UDim2.new(0, 5, 0, 5);

G2L["2c"] = Instance.new("Frame", G2L["2b"]);
G2L["2c"]["ZIndex"] = 6;
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["2c"]["Name"] = [[SaturationOverlay]];

G2L["2d"] = Instance.new("UIGradient", G2L["2c"]);
G2L["2d"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1)};

G2L["2e"] = Instance.new("Frame", G2L["2b"]);
G2L["2e"]["ZIndex"] = 7;
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["2e"]["Name"] = [[BrightnessOverlay]];

G2L["2f"] = Instance.new("UIGradient", G2L["2e"]);
G2L["2f"]["Rotation"] = 90;
G2L["2f"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};

G2L["30"] = Instance.new("Frame", G2L["2b"]);
G2L["30"]["ZIndex"] = 8;
G2L["30"]["BorderSizePixel"] = 2;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["30"]["Size"] = UDim2.new(0, 3, 0, 3);
G2L["30"]["Position"] = UDim2.new(1, 0, 0, 0);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Name"] = [[Dot]];
G2L["30"]["Rotation"] = 45;

G2L["31"] = Instance.new("TextButton", G2L["2a"]);
G2L["31"]["AutoButtonColor"] = false;
G2L["31"]["TextSize"] = 14;
G2L["31"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["31"]["ZIndex"] = 5;
G2L["31"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["31"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["31"]["Name"] = [[ColorSlider]];
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Text"] = [[]];
G2L["31"]["Position"] = UDim2.new(1, -5, 0, 160);

G2L["32"] = Instance.new("UIGradient", G2L["31"]);
G2L["32"]["Name"] = [[Gradient]];
G2L["32"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 6)),ColorSequenceKeypoint.new(0.200, Color3.fromRGB(255, 0, 253)),ColorSequenceKeypoint.new(0.400, Color3.fromRGB(0, 19, 255)),ColorSequenceKeypoint.new(0.600, Color3.fromRGB(0, 255, 255)),ColorSequenceKeypoint.new(0.800, Color3.fromRGB(23, 255, 0)),ColorSequenceKeypoint.new(0.900, Color3.fromRGB(236, 255, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 0, 6))};

G2L["33"] = Instance.new("TextButton", G2L["2a"]);
G2L["33"]["AutoButtonColor"] = false;
G2L["33"]["TextSize"] = 14;
G2L["33"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["33"]["ZIndex"] = 5;
G2L["33"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["33"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["33"]["Name"] = [[TransparencySlider]];
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[]];
G2L["33"]["Position"] = UDim2.new(1, -5, 0, 175);

G2L["34"] = Instance.new("UIGradient", G2L["33"]);
G2L["34"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1)};
G2L["34"]["Name"] = [[Gradient]];

G2L["35"] = Instance.new("Frame", G2L["2a"]);
G2L["35"]["ZIndex"] = 5;
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["35"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["35"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["35"]["Position"] = UDim2.new(0.5, 0, 0, 190);
G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["Name"] = [[ColorPreview]];

G2L["36"] = Instance.new("Frame", G2L["2a"]);
G2L["36"]["ZIndex"] = 5;
G2L["36"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["36"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["36"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["36"]["Position"] = UDim2.new(0.5, 0, 0, 215);
G2L["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["Name"] = [[InputFrame]];

G2L["37"] = Instance.new("TextBox", G2L["36"]);
G2L["37"]["TextStrokeTransparency"] = 0.75;
G2L["37"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["37"]["PlaceholderColor3"] = Color3.fromRGB(202, 202, 202);
G2L["37"]["ZIndex"] = 5;
G2L["37"]["BorderSizePixel"] = 0;
G2L["37"]["TextWrapped"] = true;
G2L["37"]["TextSize"] = 12;
G2L["37"]["Name"] = [[InputBox]];
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["37"]["PlaceholderText"] = [[RGBA: 255, 0, 0, 255]];
G2L["37"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["37"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["37"]["Text"] = [[]];
G2L["37"]["BackgroundTransparency"] = 1;

G2L["38"] = Instance.new("UIGradient", G2L["2a"]);
G2L["38"]["Rotation"] = 90;
G2L["38"]["Name"] = [[Gradient]];
G2L["38"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["39"] = Instance.new("Frame", G2L["1"]);
G2L["39"]["ZIndex"] = 3;
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["39"]["Size"] = UDim2.new(1, 0, 0, 235);
G2L["39"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["39"]["Name"] = [[Section]];

G2L["3a"] = Instance.new("Frame", G2L["39"]);
G2L["3a"]["ZIndex"] = 2;
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["3a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3a"]["Size"] = UDim2.new(1, 2, 1, 2);
G2L["3a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Name"] = [[Border]];

G2L["3b"] = Instance.new("TextLabel", G2L["39"]);
G2L["3b"]["TextStrokeTransparency"] = 0.75;
G2L["3b"]["ZIndex"] = 3;
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["3b"]["TextSize"] = 15;
G2L["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3b"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["3b"]["Size"] = UDim2.new(0, 45, 0, 2);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["3b"]["Text"] = [[Section]];
G2L["3b"]["Name"] = [[Title]];
G2L["3b"]["Position"] = UDim2.new(0, 5, 0, -2);

G2L["3c"] = Instance.new("Frame", G2L["39"]);
G2L["3c"]["ZIndex"] = 3;
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["3c"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["3c"]["Size"] = UDim2.new(1, 0, 1, -10);
G2L["3c"]["Position"] = UDim2.new(0.5, 0, 0, 10);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["3c"]["Name"] = [[Container]];
G2L["3c"]["BackgroundTransparency"] = 1;

G2L["3d"] = Instance.new("UIListLayout", G2L["3c"]);
G2L["3d"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["3d"]["Padding"] = UDim.new(0, 5);
G2L["3d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["3d"]["Name"] = [[ListLayout]];

G2L["3e"] = Instance.new("UIGradient", G2L["39"]);
G2L["3e"]["Rotation"] = 90;
G2L["3e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["3f"] = Instance.new("ScrollingFrame", G2L["1"]);
G2L["3f"]["Active"] = true;
G2L["3f"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
G2L["3f"]["ZIndex"] = 2;
G2L["3f"]["BorderSizePixel"] = 0;
G2L["3f"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["3f"]["ElasticBehavior"] = Enum.ElasticBehavior.Never;
G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["3f"]["Name"] = [[Tab]];
G2L["3f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3f"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["3f"]["ScrollBarImageColor3"] = Color3.fromRGB(52, 52, 52);
G2L["3f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["3f"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["3f"]["ScrollBarThickness"] = 0;
G2L["3f"]["BackgroundTransparency"] = 1;

G2L["40"] = Instance.new("Frame", G2L["3f"]);
G2L["40"]["ZIndex"] = 2;
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["40"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["40"]["Size"] = UDim2.new(0.5, -5, 1, 0);
G2L["40"]["Position"] = UDim2.new(1, -5, 0, 0);
G2L["40"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["40"]["Name"] = [[RightSide]];
G2L["40"]["BackgroundTransparency"] = 1;

G2L["41"] = Instance.new("UIPadding", G2L["40"]);
G2L["41"]["PaddingTop"] = UDim.new(0, 10);
G2L["41"]["Name"] = [[Padding]];
G2L["41"]["PaddingLeft"] = UDim.new(0, 3);

G2L["42"] = Instance.new("UIListLayout", G2L["40"]);
G2L["42"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["42"]["Padding"] = UDim.new(0, 10);
G2L["42"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["42"]["Name"] = [[ListLayout]];

G2L["43"] = Instance.new("Frame", G2L["3f"]);
G2L["43"]["ZIndex"] = 2;
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["43"]["Size"] = UDim2.new(0.5, -5, 1, 0);
G2L["43"]["Position"] = UDim2.new(0, 5, 0, 0);
G2L["43"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["43"]["Name"] = [[LeftSide]];
G2L["43"]["BackgroundTransparency"] = 1;

G2L["44"] = Instance.new("UIPadding", G2L["43"]);
G2L["44"]["PaddingTop"] = UDim.new(0, 10);
G2L["44"]["PaddingRight"] = UDim.new(0, 3);
G2L["44"]["Name"] = [[Padding]];

G2L["45"] = Instance.new("UIListLayout", G2L["43"]);
G2L["45"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["45"]["Padding"] = UDim.new(0, 10);
G2L["45"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["45"]["Name"] = [[ListLayout]];

G2L["46"] = Instance.new("TextButton", G2L["1"]);
G2L["46"]["TextStrokeTransparency"] = 0.75;
G2L["46"]["AutoButtonColor"] = false;
G2L["46"]["TextSize"] = 15;
G2L["46"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["46"]["ZIndex"] = 3;
G2L["46"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["46"]["Name"] = [[Button]];
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["Text"] = [[]];

G2L["47"] = Instance.new("TextLabel", G2L["46"]);
G2L["47"]["TextStrokeTransparency"] = 0.75;
G2L["47"]["ZIndex"] = 3;
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["47"]["TextSize"] = 15;
G2L["47"]["RichText"] = true;
G2L["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["47"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["47"]["BackgroundTransparency"] = 1;
G2L["47"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["47"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["47"]["Text"] = [[Button]];
G2L["47"]["Name"] = [[Title]];

G2L["48"] = Instance.new("UIGradient", G2L["46"]);
G2L["48"]["Rotation"] = 90;
G2L["48"]["Name"] = [[Gradient]];
G2L["48"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(182, 182, 182))};

G2L["49"] = Instance.new("TextButton", G2L["46"]);
G2L["49"]["TextStrokeTransparency"] = 0.75;
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["49"]["TextSize"] = 15;
G2L["49"]["TextColor3"] = Color3.fromRGB(102, 102, 102);
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["49"]["ZIndex"] = 3;
G2L["49"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["49"]["Size"] = UDim2.new(0, 51, 1, 0);
G2L["49"]["BackgroundTransparency"] = 1;
G2L["49"]["Name"] = [[Keybind]];
G2L["49"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["49"]["Text"] = [[ NONE ]];
G2L["49"]["Visible"] = false;
G2L["49"]["Position"] = UDim2.new(1, 0, 0.5, 0);

G2L["4a"] = Instance.new("TextButton", G2L["1"]);
G2L["4a"]["TextStrokeTransparency"] = 0.75;
G2L["4a"]["BorderSizePixel"] = 0;
G2L["4a"]["AutoButtonColor"] = false;
G2L["4a"]["TextSize"] = 15;
G2L["4a"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4a"]["ZIndex"] = 3;
G2L["4a"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["4a"]["BackgroundTransparency"] = 1;
G2L["4a"]["Name"] = [[Colorpicker]];
G2L["4a"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4a"]["Text"] = [[]];

G2L["4b"] = Instance.new("TextLabel", G2L["4a"]);
G2L["4b"]["TextStrokeTransparency"] = 0.75;
G2L["4b"]["ZIndex"] = 3;
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4b"]["TextSize"] = 15;
G2L["4b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4b"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["4b"]["BackgroundTransparency"] = 1;
G2L["4b"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["4b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["4b"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4b"]["Text"] = [[Colorpicker]];
G2L["4b"]["Name"] = [[Title]];
G2L["4b"]["Position"] = UDim2.new(0, 0, 0.5, 0);

G2L["4c"] = Instance.new("Frame", G2L["4a"]);
G2L["4c"]["ZIndex"] = 3;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["4c"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["4c"]["Size"] = UDim2.new(0, 20, 0, 10);
G2L["4c"]["Position"] = UDim2.new(1, 0, 0.5, 0);
G2L["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4c"]["Name"] = [[Color]];

G2L["4d"] = Instance.new("UIGradient", G2L["4c"]);
G2L["4d"]["Rotation"] = 90;
G2L["4d"]["Name"] = [[Gradient]];
G2L["4d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(182, 182, 182))};

G2L["4e"] = Instance.new("TextButton", G2L["1"]);
G2L["4e"]["TextStrokeTransparency"] = 0.75;
G2L["4e"]["BorderSizePixel"] = 0;
G2L["4e"]["AutoButtonColor"] = false;
G2L["4e"]["TextSize"] = 15;
G2L["4e"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["4e"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4e"]["ZIndex"] = 3;
G2L["4e"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["4e"]["BackgroundTransparency"] = 1;
G2L["4e"]["Name"] = [[Dropdown]];
G2L["4e"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4e"]["Text"] = [[]];

G2L["4f"] = Instance.new("TextLabel", G2L["4e"]);
G2L["4f"]["TextStrokeTransparency"] = 0.75;
G2L["4f"]["ZIndex"] = 3;
G2L["4f"]["BorderSizePixel"] = 0;
G2L["4f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["4f"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4f"]["TextSize"] = 15;
G2L["4f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4f"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["4f"]["BackgroundTransparency"] = 1;
G2L["4f"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["4f"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["4f"]["Text"] = [[Dropdown]];
G2L["4f"]["Name"] = [[Title]];

G2L["50"] = Instance.new("Frame", G2L["4e"]);
G2L["50"]["ZIndex"] = 3;
G2L["50"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["50"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["50"]["Position"] = UDim2.new(0, 0, 0, 20);
G2L["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["50"]["Name"] = [[Container]];

G2L["51"] = Instance.new("TextLabel", G2L["50"]);
G2L["51"]["TextStrokeTransparency"] = 0.75;
G2L["51"]["ZIndex"] = 3;
G2L["51"]["BorderSizePixel"] = 0;
G2L["51"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["51"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["51"]["TextSize"] = 15;
G2L["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["51"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["51"]["BackgroundTransparency"] = 1;
G2L["51"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["51"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["51"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["51"]["Text"] = [[...]];
G2L["51"]["Name"] = [[Value]];
G2L["51"]["Position"] = UDim2.new(0.5, 0, 0, 0);

G2L["52"] = Instance.new("Frame", G2L["50"]);
G2L["52"]["Visible"] = false;
G2L["52"]["ZIndex"] = 3;
G2L["52"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["52"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["52"]["Size"] = UDim2.new(1, 0, 0, 0);
G2L["52"]["Position"] = UDim2.new(0.5, 0, 0, 25);
G2L["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["52"]["Name"] = [[Holder]];

G2L["53"] = Instance.new("Frame", G2L["52"]);
G2L["53"]["ZIndex"] = 3;
G2L["53"]["BorderSizePixel"] = 0;
G2L["53"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["53"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["53"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["53"]["Name"] = [[Container]];
G2L["53"]["BackgroundTransparency"] = 1;

G2L["54"] = Instance.new("UIListLayout", G2L["53"]);
G2L["54"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["54"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["54"]["Name"] = [[ListLayout]];

G2L["55"] = Instance.new("UIGradient", G2L["53"]);
G2L["55"]["Rotation"] = 90;
G2L["55"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["56"] = Instance.new("UIGradient", G2L["52"]);
G2L["56"]["Rotation"] = 90;
G2L["56"]["Name"] = [[Gradient]];
G2L["56"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(182, 182, 182))};

G2L["57"] = Instance.new("UIGradient", G2L["50"]);
G2L["57"]["Rotation"] = 90;
G2L["57"]["Name"] = [[Gradient]];
G2L["57"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(182, 182, 182))};

G2L["58"] = Instance.new("TextButton", G2L["1"]);
G2L["58"]["TextStrokeTransparency"] = 0.75;
G2L["58"]["BorderSizePixel"] = 0;
G2L["58"]["AutoButtonColor"] = false;
G2L["58"]["TextSize"] = 15;
G2L["58"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["58"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["58"]["ZIndex"] = 4;
G2L["58"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["58"]["BackgroundTransparency"] = 1;
G2L["58"]["Name"] = [[Option]];
G2L["58"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["58"]["Text"] = [[]];

G2L["59"] = Instance.new("TextLabel", G2L["58"]);
G2L["59"]["TextStrokeTransparency"] = 0.75;
G2L["59"]["ZIndex"] = 4;
G2L["59"]["BorderSizePixel"] = 0;
G2L["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["59"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["59"]["TextSize"] = 15;
G2L["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["59"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["59"]["BackgroundTransparency"] = 1;
G2L["59"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["59"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["59"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["59"]["Text"] = [[Option]];
G2L["59"]["Name"] = [[Title]];
G2L["59"]["Position"] = UDim2.new(0.5, 0, 0, 0);

G2L["5a"] = Instance.new("TextBox", G2L["1"]);
G2L["5a"]["TextStrokeTransparency"] = 0.75;
G2L["5a"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["5a"]["ZIndex"] = 4;
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["TextSize"] = 15;
G2L["5a"]["Name"] = [[SearchOption]];
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5a"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["5a"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["5a"]["Text"] = [[]];
G2L["5a"]["BackgroundTransparency"] = 1;

G2L["5b"] = Instance.new("TextButton", G2L["1"]);
G2L["5b"]["TextStrokeTransparency"] = 0.75;
G2L["5b"]["BorderSizePixel"] = 0;
G2L["5b"]["AutoButtonColor"] = false;
G2L["5b"]["TextSize"] = 15;
G2L["5b"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["5b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["5b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5b"]["ZIndex"] = 4;
G2L["5b"]["Size"] = UDim2.new(1, -10, 0, 30);
G2L["5b"]["BackgroundTransparency"] = 1;
G2L["5b"]["Name"] = [[Slider]];
G2L["5b"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["5b"]["Text"] = [[]];

G2L["5c"] = Instance.new("TextLabel", G2L["5b"]);
G2L["5c"]["TextStrokeTransparency"] = 0.75;
G2L["5c"]["ZIndex"] = 3;
G2L["5c"]["BorderSizePixel"] = 0;
G2L["5c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["5c"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["5c"]["TextSize"] = 15;
G2L["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5c"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["5c"]["BackgroundTransparency"] = 1;
G2L["5c"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["5c"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["5c"]["Text"] = [[Slider]];
G2L["5c"]["Name"] = [[Title]];

G2L["5d"] = Instance.new("Frame", G2L["5b"]);
G2L["5d"]["ZIndex"] = 3;
G2L["5d"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["5d"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["5d"]["Size"] = UDim2.new(1, 0, 0, 10);
G2L["5d"]["Position"] = UDim2.new(0, 0, 1, 0);
G2L["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["Name"] = [[Slider]];

G2L["5e"] = Instance.new("Frame", G2L["5d"]);
G2L["5e"]["ZIndex"] = 3;
G2L["5e"]["BorderSizePixel"] = 0;
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["5e"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["5e"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["5e"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["5e"]["Name"] = [[Bar]];

G2L["5f"] = Instance.new("Frame", G2L["5e"]);
G2L["5f"]["ZIndex"] = 4;
G2L["5f"]["BorderSizePixel"] = 0;
G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 129, 64);
G2L["5f"]["Size"] = UDim2.new(1, 6, 1, 6);
G2L["5f"]["Position"] = UDim2.new(0, -3, 0, -3);
G2L["5f"]["Name"] = [[GlowEffect]];
G2L["5f"]["BackgroundTransparency"] = 1;

G2L["60"] = Instance.new("UIGradient", G2L["5f"]);
G2L["60"]["Rotation"] = 90;
G2L["60"]["Name"] = [[Gradient]];
G2L["60"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.932, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["61"] = Instance.new("UIGradient", G2L["5e"]);
G2L["61"]["Rotation"] = 90;
G2L["61"]["Name"] = [[Gradient]];
G2L["61"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.932, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["62"] = Instance.new("UIGradient", G2L["5d"]);
G2L["62"]["Rotation"] = 90;
G2L["62"]["Name"] = [[Gradient]];
G2L["62"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.932, Color3.fromRGB(62, 62, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

G2L["63"] = Instance.new("TextBox", G2L["5b"]);
G2L["63"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["63"]["PlaceholderColor3"] = Color3.fromRGB(152, 152, 152);
G2L["63"]["ZIndex"] = 3;
G2L["63"]["BorderSizePixel"] = 0;
G2L["63"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["63"]["TextWrapped"] = true;
G2L["63"]["TextSize"] = 15;
G2L["63"]["Name"] = [[Value]];
G2L["63"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["63"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["63"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["63"]["PlaceholderText"] = [[50]];
G2L["63"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["63"]["Position"] = UDim2.new(0, 0, 1, -10);
G2L["63"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["63"]["Text"] = [[]];
G2L["63"]["BackgroundTransparency"] = 1;

G2L["64"] = Instance.new("TextButton", G2L["1"]);
G2L["64"]["TextWrapped"] = true;
G2L["64"]["TextStrokeTransparency"] = 0.75;
G2L["64"]["BorderSizePixel"] = 0;
G2L["64"]["AutoButtonColor"] = false;
G2L["64"]["TextSize"] = 15;
G2L["64"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["64"]["BackgroundColor3"] = Color3.fromRGB(202, 202, 202);
G2L["64"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["64"]["ZIndex"] = 3;
G2L["64"]["Size"] = UDim2.new(0, 240, 1, 0);
G2L["64"]["Name"] = [[TabButton]];
G2L["64"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["64"]["Text"] = [[]];

G2L["65"] = Instance.new("TextLabel", G2L["64"]);
G2L["65"]["TextWrapped"] = true;
G2L["65"]["TextStrokeTransparency"] = 0.75;
G2L["65"]["ZIndex"] = 3;
G2L["65"]["BorderSizePixel"] = 0;
G2L["65"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["65"]["TextSize"] = 15;
G2L["65"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["65"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["65"]["BackgroundTransparency"] = 1;
G2L["65"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["65"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["65"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["65"]["Text"] = [[Tab Button]];
G2L["65"]["Name"] = [[Title]];
G2L["65"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

G2L["66"] = Instance.new("UIGradient", G2L["64"]);
G2L["66"]["Rotation"] = 90;
G2L["66"]["Name"] = [[Gradient]];
G2L["66"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(122, 122, 122))};

G2L["67"] = Instance.new("Frame", G2L["64"]);
G2L["67"]["ZIndex"] = 10;
G2L["67"]["BorderSizePixel"] = 0;
G2L["67"]["BackgroundColor3"] = Color3.fromRGB(255, 129, 64);
G2L["67"]["Size"] = UDim2.new(1, 0, 0, 2);
G2L["67"]["Position"] = UDim2.new(0, 0, 1, -2);
G2L["67"]["Name"] = [[Underline]];

G2L["68"] = Instance.new("UIGradient", G2L["67"]);
G2L["68"]["Rotation"] = 90;
G2L["68"]["Name"] = [[Gradient]];
G2L["68"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(122, 122, 122))};

G2L["69"] = Instance.new("TextButton", G2L["1"]);
G2L["69"]["TextStrokeTransparency"] = 0.75;
G2L["69"]["BorderSizePixel"] = 0;
G2L["69"]["AutoButtonColor"] = false;
G2L["69"]["TextSize"] = 15;
G2L["69"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["69"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["69"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["69"]["ZIndex"] = 4;
G2L["69"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["69"]["BackgroundTransparency"] = 1;
G2L["69"]["Name"] = [[TextBox]];
G2L["69"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["69"]["Text"] = [[]];

G2L["6a"] = Instance.new("TextLabel", G2L["69"]);
G2L["6a"]["TextStrokeTransparency"] = 0.75;
G2L["6a"]["ZIndex"] = 3;
G2L["6a"]["BorderSizePixel"] = 0;
G2L["6a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["6a"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["6a"]["TextSize"] = 15;
G2L["6a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6a"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["6a"]["BackgroundTransparency"] = 1;
G2L["6a"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["6a"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["6a"]["Text"] = [[TextBox]];
G2L["6a"]["Name"] = [[Title]];

G2L["6b"] = Instance.new("Frame", G2L["69"]);
G2L["6b"]["ZIndex"] = 3;
G2L["6b"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["6b"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["6b"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["6b"]["Position"] = UDim2.new(0, 0, 1, 0);
G2L["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6b"]["Name"] = [[Background]];

G2L["6c"] = Instance.new("TextBox", G2L["6b"]);
G2L["6c"]["TextStrokeTransparency"] = 0.75;
G2L["6c"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["6c"]["PlaceholderColor3"] = Color3.fromRGB(152, 152, 152);
G2L["6c"]["ZIndex"] = 4;
G2L["6c"]["TextWrapped"] = true;
G2L["6c"]["TextSize"] = 15;
G2L["6c"]["Name"] = [[Input]];
G2L["6c"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["6c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6c"]["ClearTextOnFocus"] = false;
G2L["6c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6c"]["Text"] = [[]];
G2L["6c"]["BackgroundTransparency"] = 1;

G2L["6d"] = Instance.new("UIGradient", G2L["6b"]);
G2L["6d"]["Rotation"] = 90;
G2L["6d"]["Name"] = [[Gradient]];
G2L["6d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(182, 182, 182))};

G2L["6e"] = Instance.new("TextButton", G2L["1"]);
G2L["6e"]["TextStrokeTransparency"] = 0.75;
G2L["6e"]["BorderSizePixel"] = 0;
G2L["6e"]["AutoButtonColor"] = false;
G2L["6e"]["TextSize"] = 15;
G2L["6e"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["6e"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["6e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6e"]["ZIndex"] = 3;
G2L["6e"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["6e"]["BackgroundTransparency"] = 1;
G2L["6e"]["Name"] = [[Toggle]];
G2L["6e"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["6e"]["Text"] = [[]];

G2L["6f"] = Instance.new("Frame", G2L["6e"]);
G2L["6f"]["ZIndex"] = 3;
G2L["6f"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["6f"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["6f"]["Size"] = UDim2.new(0, 10, 0, 10);
G2L["6f"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6f"]["Name"] = [[Toggle]];

G2L["70"] = Instance.new("UIGradient", G2L["6f"]);
G2L["70"]["Rotation"] = 90;
G2L["70"]["Name"] = [[Gradient]];
G2L["70"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(57, 57, 57))};

G2L["71"] = Instance.new("Frame", G2L["6f"]);
G2L["71"]["ZIndex"] = 4;
G2L["71"]["BorderSizePixel"] = 0;
G2L["71"]["BackgroundColor3"] = Color3.fromRGB(255, 86, 86);
G2L["71"]["Size"] = UDim2.new(1, 4, 1, 4);
G2L["71"]["Position"] = UDim2.new(0, -2, 0, -2);
G2L["71"]["Name"] = [[GlowEffect]];
G2L["71"]["BackgroundTransparency"] = 1;

G2L["72"] = Instance.new("UIGradient", G2L["71"]);
G2L["72"]["Rotation"] = 90;
G2L["72"]["Name"] = [[Gradient]];
G2L["72"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(57, 57, 57))};

G2L["73"] = Instance.new("TextLabel", G2L["6e"]);
G2L["73"]["TextStrokeTransparency"] = 0.75;
G2L["73"]["ZIndex"] = 3;
G2L["73"]["BorderSizePixel"] = 0;
G2L["73"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["73"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["73"]["TextSize"] = 15;
G2L["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["73"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["73"]["BackgroundTransparency"] = 1;
G2L["73"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["73"]["Size"] = UDim2.new(1, -66, 1, 0);
G2L["73"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["73"]["Text"] = [[Toggle]];
G2L["73"]["Name"] = [[Title]];
G2L["73"]["Position"] = UDim2.new(0, 15, 0.5, 0);

G2L["74"] = Instance.new("TextButton", G2L["6e"]);
G2L["74"]["TextStrokeTransparency"] = 0.75;
G2L["74"]["BorderSizePixel"] = 0;
G2L["74"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["74"]["TextSize"] = 15;
G2L["74"]["TextColor3"] = Color3.fromRGB(102, 102, 102);
G2L["74"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["74"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["74"]["ZIndex"] = 3;
G2L["74"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["74"]["Size"] = UDim2.new(0, 51, 1, 0);
G2L["74"]["BackgroundTransparency"] = 1;
G2L["74"]["Name"] = [[Keybind]];
G2L["74"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["74"]["Text"] = [[ NONE ]];
G2L["74"]["Visible"] = false;
G2L["74"]["Position"] = UDim2.new(1, 0, 0.5, 0);

G2L["75"] = Instance.new("Frame", G2L["6e"]);
G2L["75"]["Visible"] = false;
G2L["75"]["ZIndex"] = 23;
G2L["75"]["BorderSizePixel"] = 0;
G2L["75"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["75"]["Size"] = UDim2.new(0, 120, 0, 80);
G2L["75"]["Position"] = UDim2.new(0, 205, 1, 5);
G2L["75"]["Name"] = [[ModePopup]];

G2L["76"] = Instance.new("Frame", G2L["75"]);
G2L["76"]["ZIndex"] = 24;
G2L["76"]["BorderSizePixel"] = 0;
G2L["76"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["76"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["76"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["76"]["Name"] = [[BorderFrame1]];

G2L["77"] = Instance.new("Frame", G2L["76"]);
G2L["77"]["ZIndex"] = 25;
G2L["77"]["BorderSizePixel"] = 0;
G2L["77"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29);
G2L["77"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["77"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["77"]["Name"] = [[BorderFrame2]];

G2L["78"] = Instance.new("Frame", G2L["77"]);
G2L["78"]["ZIndex"] = 26;
G2L["78"]["BorderSizePixel"] = 0;
G2L["78"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["78"]["Size"] = UDim2.new(1, -6, 1, -6);
G2L["78"]["Position"] = UDim2.new(0, 3, 0, 3);
G2L["78"]["Name"] = [[BorderFrame3]];

G2L["79"] = Instance.new("Frame", G2L["78"]);
G2L["79"]["ZIndex"] = 27;
G2L["79"]["BorderSizePixel"] = 0;
G2L["79"]["BackgroundColor3"] = Color3.fromRGB(6, 6, 5);
G2L["79"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["79"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["79"]["Name"] = [[InnerFrame]];

G2L["7a"] = Instance.new("Frame", G2L["79"]);
G2L["7a"]["ZIndex"] = 28;
G2L["7a"]["BorderSizePixel"] = 0;
G2L["7a"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["7a"]["Size"] = UDim2.new(1, 0, 0, 1);
G2L["7a"]["Name"] = [[GradientFrame]];

G2L["7b"] = Instance.new("Frame", G2L["79"]);
G2L["7b"]["ZIndex"] = 28;
G2L["7b"]["BorderSizePixel"] = 0;
G2L["7b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7b"]["Size"] = UDim2.new(1, 0, 0, 1);
G2L["7b"]["Position"] = UDim2.new(0, 0, 0, 1);
G2L["7b"]["Name"] = [[ShadowLine]];
G2L["7b"]["BackgroundTransparency"] = 0.2;

G2L["7c"] = Instance.new("TextLabel", G2L["79"]);
G2L["7c"]["ZIndex"] = 28;
G2L["7c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["7c"]["TextSize"] = 14;
G2L["7c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7c"]["BackgroundTransparency"] = 1;
G2L["7c"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["7c"]["Text"] = [[Keybind Mode]];
G2L["7c"]["Name"] = [[Title]];
G2L["7c"]["Position"] = UDim2.new(0, 5, 0, 5);

G2L["7d"] = Instance.new("TextButton", G2L["79"]);
G2L["7d"]["BorderSizePixel"] = 0;
G2L["7d"]["TextSize"] = 14;
G2L["7d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["7d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7d"]["ZIndex"] = 28;
G2L["7d"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["7d"]["BackgroundTransparency"] = 1;
G2L["7d"]["Name"] = [[ToggleMode]];
G2L["7d"]["BorderColor3"] = Color3.fromRGB(255, 129, 65);
G2L["7d"]["Text"] = [[Toggle]];
G2L["7d"]["Position"] = UDim2.new(0, 5, 0, 25);

G2L["7e"] = Instance.new("TextButton", G2L["79"]);
G2L["7e"]["BorderSizePixel"] = 0;
G2L["7e"]["TextSize"] = 14;
G2L["7e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7e"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["7e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7e"]["ZIndex"] = 28;
G2L["7e"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["7e"]["BackgroundTransparency"] = 1;
G2L["7e"]["Name"] = [[HoldMode]];
G2L["7e"]["BorderColor3"] = Color3.fromRGB(255, 129, 65);
G2L["7e"]["Text"] = [[Hold]];
G2L["7e"]["Position"] = UDim2.new(0, 5, 0, 40);

G2L["7f"] = Instance.new("TextButton", G2L["79"]);
G2L["7f"]["BorderSizePixel"] = 0;
G2L["7f"]["TextSize"] = 14;
G2L["7f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7f"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["7f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7f"]["ZIndex"] = 28;
G2L["7f"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["7f"]["BackgroundTransparency"] = 1;
G2L["7f"]["Name"] = [[RemoveKeybind]];
G2L["7f"]["BorderColor3"] = Color3.fromRGB(255, 129, 65);
G2L["7f"]["Text"] = [[Remove]];
G2L["7f"]["Position"] = UDim2.new(0, 5, 0, 55);

G2L["80"] = Instance.new("TextButton", G2L["6e"]);
G2L["80"]["BorderSizePixel"] = 0;
G2L["80"]["TextSize"] = 15;
G2L["80"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["80"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
G2L["80"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["80"]["ZIndex"] = 4;
G2L["80"]["Size"] = UDim2.new(0, 14, 0, 14);
G2L["80"]["BackgroundTransparency"] = 0.3;
G2L["80"]["Name"] = [[InfoIndicator]];
G2L["80"]["Text"] = [[?]];
G2L["80"]["Position"] = UDim2.new(1, -19, 0.5, -7);

G2L["81"] = Instance.new("UICorner", G2L["80"]);
G2L["81"]["CornerRadius"] = UDim.new(0.5, 0);

G2L["82"] = Instance.new("TextLabel", G2L["6e"]);
G2L["82"]["ZIndex"] = 4;
G2L["82"]["TextTransparency"] = 0.3;
G2L["82"]["TextSize"] = 15;
G2L["82"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["82"]["TextColor3"] = Color3.fromRGB(255, 86, 86);
G2L["82"]["BackgroundTransparency"] = 1;
G2L["82"]["Size"] = UDim2.new(0, 16, 1, 0);
G2L["82"]["Text"] = [[(!)]];
G2L["82"]["Name"] = [[StatusIndicator]];
G2L["82"]["Position"] = UDim2.new(1, -40, 0, 0);

G2L["83"] = Instance.new("TextButton", G2L["1"]);
G2L["83"]["TextStrokeTransparency"] = 0.75;
G2L["83"]["BorderSizePixel"] = 0;
G2L["83"]["AutoButtonColor"] = false;
G2L["83"]["TextSize"] = 15;
G2L["83"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["83"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["83"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["83"]["ZIndex"] = 3;
G2L["83"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["83"]["BackgroundTransparency"] = 1;
G2L["83"]["Name"] = [[ToggleWColorpicker]];
G2L["83"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["83"]["Text"] = [[]];

G2L["84"] = Instance.new("Frame", G2L["83"]);
G2L["84"]["ZIndex"] = 3;
G2L["84"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
G2L["84"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["84"]["Size"] = UDim2.new(0, 10, 0, 10);
G2L["84"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["84"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["84"]["Name"] = [[Toggle]];

G2L["85"] = Instance.new("UIGradient", G2L["84"]);
G2L["85"]["Rotation"] = 90;
G2L["85"]["Name"] = [[Gradient]];
G2L["85"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(182, 182, 182))};

G2L["86"] = Instance.new("TextLabel", G2L["83"]);
G2L["86"]["TextStrokeTransparency"] = 0.75;
G2L["86"]["ZIndex"] = 3;
G2L["86"]["BorderSizePixel"] = 0;
G2L["86"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["86"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["86"]["TextSize"] = 15;
G2L["86"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["86"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["86"]["BackgroundTransparency"] = 1;
G2L["86"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["86"]["Size"] = UDim2.new(1, -66, 1, 0);
G2L["86"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["86"]["Text"] = [[Toggle]];
G2L["86"]["Name"] = [[Title]];
G2L["86"]["Position"] = UDim2.new(0, 15, 0.5, 0);

G2L["87"] = Instance.new("TextButton", G2L["83"]);
G2L["87"]["TextStrokeTransparency"] = 0.75;
G2L["87"]["BorderSizePixel"] = 0;
G2L["87"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["87"]["TextSize"] = 15;
G2L["87"]["TextColor3"] = Color3.fromRGB(102, 102, 102);
G2L["87"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["87"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["87"]["ZIndex"] = 3;
G2L["87"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["87"]["Size"] = UDim2.new(0, 51, 1, 0);
G2L["87"]["BackgroundTransparency"] = 1;
G2L["87"]["Name"] = [[Keybind]];
G2L["87"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["87"]["Text"] = [[ NONE ]];
G2L["87"]["Visible"] = false;
G2L["87"]["Position"] = UDim2.new(1, 0, 0.5, 0);

G2L["88"] = Instance.new("Frame", G2L["83"]);
G2L["88"]["Visible"] = false;
G2L["88"]["ZIndex"] = 23;
G2L["88"]["BorderSizePixel"] = 0;
G2L["88"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["88"]["Size"] = UDim2.new(0, 120, 0, 80);
G2L["88"]["Position"] = UDim2.new(0, 205, 1, 5);
G2L["88"]["Name"] = [[ModePopup]];

G2L["89"] = Instance.new("Frame", G2L["88"]);
G2L["89"]["ZIndex"] = 24;
G2L["89"]["BorderSizePixel"] = 0;
G2L["89"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["89"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["89"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["89"]["Name"] = [[BorderFrame1]];

G2L["8a"] = Instance.new("Frame", G2L["89"]);
G2L["8a"]["ZIndex"] = 25;
G2L["8a"]["BorderSizePixel"] = 0;
G2L["8a"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29);
G2L["8a"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["8a"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["8a"]["Name"] = [[BorderFrame2]];

G2L["8b"] = Instance.new("Frame", G2L["8a"]);
G2L["8b"]["ZIndex"] = 26;
G2L["8b"]["BorderSizePixel"] = 0;
G2L["8b"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 53);
G2L["8b"]["Size"] = UDim2.new(1, -6, 1, -6);
G2L["8b"]["Position"] = UDim2.new(0, 3, 0, 3);
G2L["8b"]["Name"] = [[BorderFrame3]];

G2L["8c"] = Instance.new("Frame", G2L["8b"]);
G2L["8c"]["ZIndex"] = 27;
G2L["8c"]["BorderSizePixel"] = 0;
G2L["8c"]["BackgroundColor3"] = Color3.fromRGB(6, 6, 5);
G2L["8c"]["Size"] = UDim2.new(1, -2, 1, -2);
G2L["8c"]["Position"] = UDim2.new(0, 1, 0, 1);
G2L["8c"]["Name"] = [[InnerFrame]];

G2L["8d"] = Instance.new("Frame", G2L["8c"]);
G2L["8d"]["ZIndex"] = 28;
G2L["8d"]["BorderSizePixel"] = 0;
G2L["8d"]["BackgroundColor3"] = Color3.fromRGB(101, 151, 201);
G2L["8d"]["Size"] = UDim2.new(1, 0, 0, 1);
G2L["8d"]["Name"] = [[GradientFrame]];

G2L["8e"] = Instance.new("Frame", G2L["8c"]);
G2L["8e"]["ZIndex"] = 28;
G2L["8e"]["BorderSizePixel"] = 0;
G2L["8e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8e"]["Size"] = UDim2.new(1, 0, 0, 1);
G2L["8e"]["Position"] = UDim2.new(0, 0, 0, 1);
G2L["8e"]["Name"] = [[ShadowLine]];
G2L["8e"]["BackgroundTransparency"] = 0.2;

G2L["8f"] = Instance.new("TextLabel", G2L["8c"]);
G2L["8f"]["ZIndex"] = 28;
G2L["8f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["8f"]["TextSize"] = 14;
G2L["8f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8f"]["BackgroundTransparency"] = 1;
G2L["8f"]["Size"] = UDim2.new(1, -10, 0, 20);
G2L["8f"]["Text"] = [[Keybind Mode]];
G2L["8f"]["Name"] = [[Title]];
G2L["8f"]["Position"] = UDim2.new(0, 5, 0, 5);

G2L["90"] = Instance.new("TextButton", G2L["8c"]);
G2L["90"]["BorderSizePixel"] = 0;
G2L["90"]["TextSize"] = 14;
G2L["90"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["90"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["90"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["90"]["ZIndex"] = 28;
G2L["90"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["90"]["BackgroundTransparency"] = 1;
G2L["90"]["Name"] = [[ToggleMode]];
G2L["90"]["BorderColor3"] = Color3.fromRGB(255, 129, 65);
G2L["90"]["Text"] = [[Toggle]];
G2L["90"]["Position"] = UDim2.new(0, 5, 0, 25);

G2L["91"] = Instance.new("TextButton", G2L["8c"]);
G2L["91"]["BorderSizePixel"] = 0;
G2L["91"]["TextSize"] = 14;
G2L["91"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["91"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["91"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["91"]["ZIndex"] = 28;
G2L["91"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["91"]["BackgroundTransparency"] = 1;
G2L["91"]["Name"] = [[HoldMode]];
G2L["91"]["BorderColor3"] = Color3.fromRGB(255, 129, 65);
G2L["91"]["Text"] = [[Hold]];
G2L["91"]["Position"] = UDim2.new(0, 5, 0, 40);

G2L["92"] = Instance.new("TextButton", G2L["8c"]);
G2L["92"]["BorderSizePixel"] = 0;
G2L["92"]["TextSize"] = 14;
G2L["92"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["92"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["92"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["92"]["ZIndex"] = 28;
G2L["92"]["Size"] = UDim2.new(1, -10, 0, 10);
G2L["92"]["BackgroundTransparency"] = 1;
G2L["92"]["Name"] = [[RemoveKeybind]];
G2L["92"]["BorderColor3"] = Color3.fromRGB(255, 129, 65);
G2L["92"]["Text"] = [[Remove]];
G2L["92"]["Position"] = UDim2.new(0, 5, 0, 55);

G2L["93"] = Instance.new("Frame", G2L["83"]);
G2L["93"]["ZIndex"] = 3;
G2L["93"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["93"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["93"]["Size"] = UDim2.new(0, 20, 0, 10);
G2L["93"]["Position"] = UDim2.new(1, 0, 0.5, 0);
G2L["93"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["93"]["Name"] = [[Color]];

G2L["94"] = Instance.new("UIGradient", G2L["93"]);
G2L["94"]["Rotation"] = 90;
G2L["94"]["Name"] = [[Gradient]];
G2L["94"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(182, 182, 182))};

G2L["95"] = Instance.new("TextLabel", G2L["83"]);
G2L["95"]["ZIndex"] = 4;
G2L["95"]["TextTransparency"] = 0.3;
G2L["95"]["TextSize"] = 15;
G2L["95"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["95"]["TextColor3"] = Color3.fromRGB(255, 86, 86);
G2L["95"]["BackgroundTransparency"] = 1;
G2L["95"]["Size"] = UDim2.new(0, 16, 1, 0);
G2L["95"]["Text"] = [[(!)]];
G2L["95"]["Name"] = [[StatusIndicator]];
G2L["95"]["Position"] = UDim2.new(1, -40, 0, 0);

G2L["96"] = Instance.new("TextButton", G2L["83"]);
G2L["96"]["BorderSizePixel"] = 0;
G2L["96"]["TextSize"] = 15;
G2L["96"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["96"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
G2L["96"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["96"]["ZIndex"] = 4;
G2L["96"]["Size"] = UDim2.new(0, 14, 0, 14);
G2L["96"]["BackgroundTransparency"] = 0.3;
G2L["96"]["Name"] = [[InfoIndicator]];
G2L["96"]["Text"] = [[?]];
G2L["96"]["Position"] = UDim2.new(1, -19, 0.5, -7);

G2L["97"] = Instance.new("UICorner", G2L["96"]);
G2L["97"]["CornerRadius"] = UDim.new(0.5, 0);

G2L["98"] = Instance.new("TextLabel", G2L["1"]);
G2L["98"]["TextStrokeTransparency"] = 0.75;
G2L["98"]["ZIndex"] = 3;
G2L["98"]["BorderSizePixel"] = 0;
G2L["98"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["98"]["TextSize"] = 15;
G2L["98"]["RichText"] = true;
G2L["98"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["98"]["TextColor3"] = Color3.fromRGB(202, 202, 202);
G2L["98"]["BackgroundTransparency"] = 1;
G2L["98"]["Size"] = UDim2.new(1, -10, 0, 15);
G2L["98"]["BorderColor3"] = Color3.fromRGB(27, 27, 27);
G2L["98"]["Text"] = [[Text Label]];
G2L["98"]["Name"] = [[Label]];


return G2L["1"];
