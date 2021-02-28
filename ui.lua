-- Gui to Lua
-- Version: 3.2

-- Instances:

local wolfysStuff = Instance.new("ScreenGui")
local _BACKGROUND_ = Instance.new("Frame")
local VISUALIZER = Instance.new("TextLabel")
local Focused_Instance = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local EditedValue = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

--Properties:

wolfysStuff.Name = "wolfysStuff"
wolfysStuff.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

_BACKGROUND_.Name = "_BACKGROUND_"
_BACKGROUND_.Parent = wolfysStuff
_BACKGROUND_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_BACKGROUND_.Size = UDim2.new(2.14748365e+09, 2147483647, 2.14748365e+09, 2147483647)
_BACKGROUND_.ZIndex = 999

VISUALIZER.Name = "VISUALIZER"
VISUALIZER.Parent = _BACKGROUND_
VISUALIZER.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VISUALIZER.BackgroundTransparency = 1.000
VISUALIZER.Position = UDim2.new(0, 706, 0, 376)
VISUALIZER.Size = UDim2.new(0, 592, 0, 257)
VISUALIZER.SizeConstraint = Enum.SizeConstraint.RelativeYY
VISUALIZER.ZIndex = 999
VISUALIZER.Font = Enum.Font.GothamBold
VISUALIZER.Text = "..."
VISUALIZER.TextColor3 = Color3.fromRGB(255, 255, 255)
VISUALIZER.TextSize = 50.000

Focused_Instance.Name = "Focused_Instance"
Focused_Instance.Parent = VISUALIZER
Focused_Instance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Focused_Instance.BackgroundTransparency = 1.000
Focused_Instance.Position = UDim2.new(0, 277, 0, 222)
Focused_Instance.Size = UDim2.new(0, 38, 0, 50)
Focused_Instance.ZIndex = 999
Focused_Instance.Font = Enum.Font.Code
Focused_Instance.Text = "[]"
Focused_Instance.TextColor3 = Color3.fromRGB(255, 246, 176)
Focused_Instance.TextSize = 25.000
Focused_Instance.TextTransparency = 1.000

ImageLabel.Parent = Focused_Instance
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.LayoutOrder = 2
ImageLabel.NextSelectionUp = _BACKGROUND_
ImageLabel.Position = UDim2.new(0, 6, 0, 68)
ImageLabel.Size = UDim2.new(0, 31, 0, 31)
ImageLabel.ZIndex = 999
ImageLabel.Image = "rbxassetid://6455591154"
ImageLabel.ImageTransparency = 1.000

UIAspectRatioConstraint.Parent = Focused_Instance
UIAspectRatioConstraint.AspectRatio = 0.760

EditedValue.Name = "EditedValue"
EditedValue.Parent = VISUALIZER
EditedValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EditedValue.BackgroundTransparency = 1.000
EditedValue.Position = UDim2.new(0, 276, 0, 321)
EditedValue.Size = UDim2.new(0, 38, 0, 50)
EditedValue.ZIndex = 999
EditedValue.Font = Enum.Font.Code
EditedValue.Text = "[]"
EditedValue.TextColor3 = Color3.fromRGB(157, 239, 255)
EditedValue.TextSize = 25.000
EditedValue.TextTransparency = 1.000

UIAspectRatioConstraint_2.Parent = EditedValue
UIAspectRatioConstraint_2.AspectRatio = 0.760
