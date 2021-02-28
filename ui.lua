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
wolfysStuff.Enabled = false

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

-- Module Scripts:

local fake_module_scripts = {}

do -- wolfysStuff.LOADER
	local script = Instance.new('ModuleScript', wolfysStuff)
	script.Name = "LOADER"
	local function module_script()
		return function()
			-- syn.set_thread_identity(5)
		
			local BACKGROUND = script.Parent:FindFirstChild("_BACKGROUND_")
			local VISUALIZER = BACKGROUND:FindFirstChild("VISUALIZER")
			local Focused_Instance = VISUALIZER:FindFirstChild("Focused_Instance")
			local EditedValue = VISUALIZER:FindFirstChild("EditedValue")
			local Check = Focused_Instance:FindFirstChild("ImageLabel")
			local EditValue = VISUALIZER:FindFirstChild("EditedValue")
			local GunModuleFolder = game.ReplicatedStorage:FindFirstChild("GunModules")
			local LOADSOUND = script.Parent:FindFirstChild("LOADSOUND")
			local countOfModules = #GunModuleFolder:GetChildren()
			local Pulse = VISUALIZER:FindFirstChild("Pulse")
			local progressLoad = 0
			local canSkip = true
			local fancyLoad = true
			local thing
			local UIS = game:GetService("UserInputService")
			
			local function PulseCheck()
				spawn(function()
					Check.ImageTransparency = 0
					wait(.2)
					local Info2 = TweenInfo.new(0.25)
					local Tween2 = game:GetService("TweenService"):Create(Check,Info2,{ImageTransparency = 1})
					Tween2:Play()
				end)
			end
			
			local function PulseEditValue()
				spawn(function()
					EditValue.TextTransparency = 0
					wait(2.1)
					local Info2 = TweenInfo.new(0.25)
					local Tween2 = game:GetService("TweenService"):Create(EditValue,Info2,{TextTransparency = 1})
					Tween2:Play()			
				end)
			end
			
			local function PulseFocusInstance()
				spawn(function()
					Focused_Instance.TextTransparency = 0
					wait(.1)
					local Info2 = TweenInfo.new(0.25)
					local Tween2 = game:GetService("TweenService"):Create(Focused_Instance,Info2,{TextTransparency = 1})
					Tween2:Play()
				end)
			end
			
			local VisualSequence = {
				"(PRESS [CONTROL] TO SKIP FANCY LOAD)",
				"UNLOCKING MODULES",
				"ADJUSTING AUTOMATIC VALUES",
				"DONE"
			}
			
			local LoadSequence = {
				function()
					Focused_Instance.Text = VisualSequence[1]
					Focused_Instance.Text = VisualSequence[1]
					for i, v in pairs(GunModuleFolder:GetChildren()) do
						if v:IsA("ModuleScript") then
							spawn(function()
								if fancyLoad == true then
									wait()
								else
								end
								local SelectedModule = require(v)
								
								PulseFocusInstance()
								-- setreadonly(SelectedModule, false)
								PulseCheck()
								
								
							end)
							
						end
					end
				end,
				
				function()
					for i, v in pairs(GunModuleFolder:GetChildren()) do
						local SelectedModule = require(v)
						
						if SelectedModule.type ~= "KNIFE" or SelectedModule.type ~= "Grenade" then
							
							if fancyLoad == true then
								wait()
								progressLoad = progressLoad + 1
							else
								progressLoad = progressLoad + 1
							end
							
							
							SelectedModule.magsize = math.huge PulseEditValue()
							EditedValue.Text = "[MAG SIZE] : "..SelectedModule.magsize.." ["..progressLoad.."/"..countOfModules.."] "
							
							SelectedModule.sparerounds = math.huge PulseEditValue()
							EditedValue.Text = "[SPARE ROUNDS] : "..SelectedModule.sparerounds.." ["..progressLoad.."/"..countOfModules.."] "
							
							SelectedModule.penetrationdepth = math.huge PulseEditValue()
							EditedValue.Text = "[PENETRATION DEPTH] : "..SelectedModule.penetrationdepth.." ["..progressLoad.."/"..countOfModules.."] "
							
							SelectedModule.camkickspeed = 0 PulseEditValue()
							EditedValue.Text = "['RECOIL' SETTING] : "..SelectedModule.camkickspeed.." ["..progressLoad.."/"..countOfModules.."] "
							
						end
						
					end
				end,
				
				function()
					thing:Disconnect()
					
					for i, v in pairs(BACKGROUND:GetDescendants()) do
						if v:IsA("TextLabel") then
							v.TextTransparency = 1
						end
					end
					
					Pulse.Disabled = true
					VISUALIZER.TextTransparency = 0			
					
					-- done segment
					local Info3 = TweenInfo.new(1)
					local Tween3 = game:GetService("TweenService"):Create(BACKGROUND,Info3,{BackgroundTransparency = 1})
					Tween3:Play()
					
					local Info4 = TweenInfo.new(1)
					local Tween4 = game:GetService("TweenService"):Create(VISUALIZER,Info4,{TextTransparency = 1})
					Tween4:Play()
					
				end,
			}
			
			
			thing = UIS.InputBegan:Connect(function(input, gameProccesedEvent)
				if gameProccesedEvent then
				else
					if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
						if canSkip == true then
							fancyLoad = false
							
							VISUALIZER.Text = VisualSequence[2]
							LoadSequence[1]()
							canSkip = false
							thing:Disconnect()
						end
					end
				end
			end)
			
			VISUALIZER.Text = VisualSequence[1]
			wait(1.5)
			
			Pulse.Disabled = false
			VISUALIZER.Text = VisualSequence[2]
			LoadSequence[1]()
			
			VISUALIZER.Text = VisualSequence[3]
			LoadSequence[2]()
		
			
			VISUALIZER.Text = VisualSequence[4]
			
			wait(1.6)
			LoadSequence[3]()
			wait(2)
			
			BACKGROUND:Destroy()
			
		
			
		end
		
	end
	fake_module_scripts[script] = module_script
end


-- Scripts:

require(BACKGROUND.Parent:WaitForChild("LOADER"))()
