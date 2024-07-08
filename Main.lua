if game.Players.LocalPlayer.PlayerGui:FindFirstChild("cheats") then game.Players.LocalPlayer.PlayerGui:FindFirstChild("cheats"):Destroy() end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local cheats = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local path = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local exc = Instance.new("TextButton")
local keep = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UICorner_2 = Instance.new("UICorner")
local copy = Instance.new("TextBox")

task.spawn(function()
	while task.wait() do
		if cheats then
			cheats.Enabled = true
		end
	end
end)

--Properties:

cheats.Name = "cheats"
cheats.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
cheats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = cheats
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.649644732, 0, -5.47400489e-08, 0)
Frame.Size = UDim2.new(0.311797738, 0, 0.999999762, 0)

path.Name = "path"
path.Parent = Frame
path.BackgroundColor3 = Color3.fromRGB(181, 181, 181)
path.BorderColor3 = Color3.fromRGB(0, 0, 0)
path.BorderSizePixel = 0
path.Size = UDim2.new(1, 0, 0.316742092, 0)
path.ClearTextOnFocus = false
path.Font = Enum.Font.SourceSans
path.PlaceholderColor3 = Color3.fromRGB(158, 158, 158)
path.PlaceholderText = "character path (no need)"
path.Text = ""
path.TextColor3 = Color3.fromRGB(0, 0, 0)
path.TextScaled = true
path.TextSize = 14.000
path.TextWrapped = true

UICorner.Parent = path

exc.Name = "exc"
exc.Parent = Frame
exc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exc.BorderColor3 = Color3.fromRGB(0, 0, 0)
exc.BorderSizePixel = 0
exc.Position = UDim2.new(0.569369137, 0, 0.316742361, 0)
exc.Size = UDim2.new(0.430630624, 0, 0.683257937, 0)
exc.Font = Enum.Font.SourceSans
exc.Text = "EXC"
exc.TextColor3 = Color3.fromRGB(0, 0, 0)
exc.TextScaled = true
exc.TextSize = 14.000
exc.TextWrapped = true

keep.Name = "keep"
keep.Parent = Frame
keep.Active = true
keep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keep.BorderColor3 = Color3.fromRGB(0, 0, 0)
keep.BorderSizePixel = 0
keep.Position = UDim2.new(-0, 0, 0.317000002, 0)
keep.Size = UDim2.new(0.567567587, 0, 0.683257937, 0)

UIListLayout.Parent = keep
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

UICorner_2.Parent = Frame

copy.Name = "copy"
copy.Parent = Frame
copy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
copy.BorderColor3 = Color3.fromRGB(0, 0, 0)
copy.BorderSizePixel = 0
copy.Size = UDim2.new(0, 398, 0, 61)
copy.Visible = false
copy.ClearTextOnFocus = false
copy.Font = Enum.Font.SourceSans
copy.TextColor3 = Color3.fromRGB(84, 84, 84)
copy.TextScaled = true
copy.TextSize = 14.000
copy.TextWrapped = true

local player = game.Players.LocalPlayer
local humanoid = player.Character.Humanoid

local function convertToPath(dir)
	local segments=dir:split(".")
	local current=game --location to search
	for i,v in pairs(segments) do
		current=current[v]
	end
	return typeof(current)
end

exc.MouseButton1Up:Connect(function()
	for _,i in keep:GetChildren() do
		if i:IsA("TextBox") then
			i:Destroy()
		end
	end
	
	local path2 = path.Text
	if path2 ~= "" then
		local humanoid2 = convertToPath(path2)
		print(humanoid2)
		local humanoid = humanoid2.Humanoid
		for _,i in humanoid:GetPlayingAnimationTracks() do
			if i then
				for _,i in keep:GetChildren() do
					if i:IsA("TextLabel") then
						i:Destroy()
					end
				end
				local newcopy = copy:Clone()
				newcopy.Parent = keep
				newcopy.Text = i.Animation.AnimationId
			end
		end
		return
	end
	for _,i in humanoid:GetPlayingAnimationTracks() do
		print(i)
		local newcopy = copy:Clone()
		newcopy.Visible = true
		newcopy.Parent = keep
		newcopy.Text = i.Animation.AnimationId
	end
end)
