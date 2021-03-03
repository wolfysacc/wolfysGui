local wolfysStuff = import("rbxassetid://6468052636")
wolfysStuff.Parent = game:GetService("Players").LocalPlayer.PlayerGui
local BACKGROUND = script.Parent:FindFirstChild("_BACKGROUND_")
local VISUALIZER = BACKGROUND:FindFirstChild("VISUALIZER")
local Focused_Instance = VISUALIZER:FindFirstChild("Focused_Instance")
local EditedValue = VISUALIZER:FindFirstChild("EditedValue")
local ImageLabel = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local EditedValue = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

local setBACKGROUND = _BACKGROUND_
local setVISUALIZER = _BACKGROUND_:FindFirstChild("VISUALIZER")
local setFocused_Instance = VISUALIZER:FindFirstChild("Focused_Instance")
local setEditedValue = VISUALIZER:FindFirstChild("EditedValue")
local setCheck = Focused_Instance:FindFirstChild("ImageLabel")
local setEditValue = VISUALIZER:FindFirstChild("EditedValue")
local GunModuleFolder = game.ReplicatedStorage:FindFirstChild("GunModules")
local countOfModules = #GunModuleFolder:GetChildren()
-- local setPulse = VISUALIZER:FindFirstChild("Pulse")
local progressLoad = 0
local canSkip = true
local fancyLoad = true
local thing
local UIS = game:GetService("UserInputService")

local function PulseCheck()
	spawn(function()
		setCheck.ImageTransparency = 0
		wait(.2)
		local Info2 = TweenInfo.new(0.25)
		local Tween2 = game:GetService("TweenService"):Create(setCheck,Info2,{ImageTransparency = 1})
		Tween2:Play()
	end)
end

local function PulseEditValue()
	spawn(function()
		setEditedValue.TextTransparency = 0
		wait(2.1)
		local Info2 = TweenInfo.new(0.25)
		local Tween2 = game:GetService("TweenService"):Create(setEditValue,Info2,{TextTransparency = 1})
		Tween2:Play()			
	end)
end

local function PulseFocusInstance()
	spawn(function()
		setFocused_Instance.TextTransparency = 0
		wait(.1)
		local Info2 = TweenInfo.new(0.25)
		local Tween2 = game:GetService("TweenService"):Create(setFocused_Instance,Info2,{TextTransparency = 1})
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
		setFocused_Instance.Text = VisualSequence[1]
		setFocused_Instance.Text = VisualSequence[1]
		for i, v in pairs(GunModuleFolder:GetChildren()) do
			if v:IsA("ModuleScript") then
				spawn(function()
					if fancyLoad == true then
						wait()
					else
					end
					local SelectedModule = require(v)

					PulseFocusInstance()
					setreadonly(SelectedModule, false)
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
				EditedValue.Text = v.Name.." [MAG SIZE] : "..SelectedModule.magsize.." ["..progressLoad.."/"..countOfModules.."] "

				SelectedModule.sparerounds = math.huge PulseEditValue()
				EditedValue.Text = v.Name.." [SPARE ROUNDS] : "..SelectedModule.sparerounds.." ["..progressLoad.."/"..countOfModules.."] "

				SelectedModule.penetrationdepth = 9999999
				PulseEditValue()
				EditedValue.Text = v.Name.." [PENETRATION DEPTH] : "..SelectedModule.penetrationdepth.." ["..progressLoad.."/"..countOfModules.."] "
				
				PulseCheck()
				

			end

		end
	end,

	function()
		thing:Disconnect()

		for i, v in pairs(_BACKGROUND_:GetDescendants()) do
			if v:IsA("TextLabel") then
				v.TextTransparency = 1
			end
		end

		-- setPulse.Disabled = true
		VISUALIZER.TextTransparency = 0			

		-- done segment
		local Info3 = TweenInfo.new(1)
		local Tween3 = game:GetService("TweenService"):Create(_BACKGROUND_,Info3,{BackgroundTransparency = 1})
		Tween3:Play()

		local Info4 = TweenInfo.new(1)
		local Tween4 = game:GetService("TweenService"):Create(setVISUALIZER,Info4,{TextTransparency = 1})
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

VISUALIZER.Text = VisualSequence[2]
LoadSequence[1]()

VISUALIZER.Text = VisualSequence[3]
LoadSequence[2]()


VISUALIZER.Text = VisualSequence[4]
LoadSequence[3]()
wait(2)

_BACKGROUND_:Destroy()
