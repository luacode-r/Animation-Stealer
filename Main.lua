if game.Players.LocalPlayer.PlayerGui:FindFirstChild("cheat") then game.Players.LocalPlayer.PlayerGui:FindFirstChild("cheat"):Destroy() end

-- Gui to Lua
-- Version: 3.2

-- Instances:

print("run")

local cheat = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local drag = Instance.new("Frame")
local main = Instance.new("Frame")
local store = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local template = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local path = Instance.new("TextBox")
local darkdex = Instance.new("TextButton")
local exc = Instance.new("TextButton")

cheat.Enabled = true
--Properties:

drag.Name = "drag"
drag.Parent = cheat
drag.BackgroundColor3 = Color3.fromRGB(113, 113, 113)
drag.BorderColor3 = Color3.fromRGB(0, 0, 0)
drag.BorderSizePixel = 0
drag.Position = UDim2.new(0.300177634, 0, 0.321076274, 0)
drag.Size = UDim2.new(0.355239779, 0, 0.0448430479, 0)
drag.ZIndex = 2

main.Name = "main"
main.Parent = drag
main.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
main.BorderColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0
main.Position = UDim2.new(0, 0, 0.779999971, 0)
main.Size = UDim2.new(1, 0, 11.7799997, 0)
main.ZIndex = 2

store.Name = "store"
store.Parent = main
store.Active = true
store.BackgroundColor3 = Color3.fromRGB(152, 152, 152)
store.BorderColor3 = Color3.fromRGB(0, 0, 0)
store.BorderSizePixel = 0
store.Position = UDim2.new(0, 0, 0.150999993, 0)
store.Size = UDim2.new(0.625, 0, 0.848896444, 0)

UIListLayout.Parent = store
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

template.Name = "template"
template.Parent = main
template.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
template.BorderColor3 = Color3.fromRGB(0, 0, 0)
template.BorderSizePixel = 0
template.Size = UDim2.new(0, 423, 0, 50)
template.Visible = false
template.ZIndex = 12
template.ClearTextOnFocus = false
template.Font = Enum.Font.SourceSans
template.Text = "template"
template.TextColor3 = Color3.fromRGB(255, 255, 255)
template.TextScaled = true
template.TextSize = 14.000
template.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
template.TextWrapped = true

UICorner.Parent = template

UICorner_2.Parent = drag

path.Name = "path"
path.Parent = drag
path.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
path.BorderColor3 = Color3.fromRGB(0, 0, 0)
path.BorderSizePixel = 0
path.Position = UDim2.new(0, 0, 0.779999971, 0)
path.Size = UDim2.new(1, 0, 1.75999999, 0)
path.ZIndex = 4
path.Font = Enum.Font.SourceSans
path.PlaceholderColor3 = Color3.fromRGB(94, 94, 94)
path.PlaceholderText = "Other Paths (no need)"
path.Text = ""
path.TextColor3 = Color3.fromRGB(0, 0, 0)
path.TextScaled = true
path.TextSize = 14.000
path.TextWrapped = true

darkdex.Name = "darkdex"
darkdex.Parent = drag
darkdex.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
darkdex.BorderColor3 = Color3.fromRGB(0, 0, 0)
darkdex.BorderSizePixel = 0
darkdex.Position = UDim2.new(0.625, 0, 2.53999996, 0)
darkdex.Size = UDim2.new(0.375, 0, 1, 0)
darkdex.ZIndex = 5
darkdex.Font = Enum.Font.SourceSans
darkdex.Text = "dark dex"
darkdex.TextColor3 = Color3.fromRGB(255, 255, 255)
darkdex.TextScaled = true
darkdex.TextSize = 14.000
darkdex.TextWrapped = true

exc.Name = "exc"
exc.Parent = drag
exc.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
exc.BorderColor3 = Color3.fromRGB(0, 0, 0)
exc.BorderSizePixel = 0
exc.Position = UDim2.new(0.625, 0, 6.53999996, 0)
exc.Size = UDim2.new(0.375, 0, 6, 0)
exc.ZIndex = 5
exc.Font = Enum.Font.FredokaOne
exc.Text = "EXECUTE"
exc.TextColor3 = Color3.fromRGB(144, 144, 144)
exc.TextScaled = true
exc.TextSize = 61.000
exc.TextWrapped = true


--[[ task.spawn(function()
	local function makeDragable(frame)
		local UserInputService = game:GetService('UserInputService')

		local leadFrame = Instance.new('Frame') do
			leadFrame.AnchorPoint = frame.AnchorPoint
			leadFrame.Position = frame.Position
			leadFrame.Size = frame.Size
			leadFrame.Name = `Lead {frame.Name}`
			leadFrame.Visible = false
			leadFrame.Parent = frame.Parent
		end

		local screenGui = frame.Parent

		local inputChanged = nil
		local inputEnded = nil

		local function getBoundsRelations(guiObject : GuiObject)
			local bounds = screenGui.AbsoluteSize
			local topLeft = screenGui.IgnoreGuiInset and guiObject.AbsolutePosition + Vector2.new(0, 36) or guiObject.AbsolutePosition
			local bottomRight = topLeft + guiObject.AbsoluteSize

			local boundRelations = {
				Top = topLeft.Y < 0 and math.abs(topLeft.Y) or nil,
				Left = topLeft.X < 0 and math.abs(topLeft.X) or nil,
				Right = bottomRight.X > bounds.X and math.abs(bottomRight.X - bounds.X) or nil,
				Bottom = bottomRight.Y > bounds.Y and math.abs(bottomRight.Y - bounds.Y) or nil,
			}

			return (not boundRelations.Top
				and not boundRelations.Bottom
				and not boundRelations.Left
				and not boundRelations.Right), boundRelations
		end

		frame.InputBegan:Connect(function(inputObject : InputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then

				local lastMousePosition = UserInputService:GetMouseLocation()
				local goalPosition = frame.Position

				inputChanged = UserInputService.InputChanged:Connect(function(input : InputObject, event : boolean)
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						local currentMousePosition = UserInputService:GetMouseLocation()
						local mouseDelta = currentMousePosition - lastMousePosition

						goalPosition += UDim2.fromOffset(mouseDelta.X, mouseDelta.Y)

						leadFrame.Position = goalPosition

						local isInBounds, relations = getBoundsRelations(leadFrame)

						if not isInBounds then
							local x = (relations.Left or 0) - (relations.Right or 0)
							local y = (relations.Top or 0) - (relations.Bottom or 0)

							goalPosition += UDim2.fromOffset(x, y)
						end

						frame.Position = goalPosition
						lastMousePosition = currentMousePosition
					end
				end)

				inputEnded = frame.InputEnded:Connect(function(input : InputObject)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						inputChanged:Disconnect()
						inputChanged = nil

						inputEnded:Disconnect()
						inputEnded = nil
					end
				end)
			end
		end)

		frame.Destroying:Once(function()

			leadFrame = leadFrame:Destroy()

			if inputChanged  then
				inputChanged:Disconnect()
				inputChanged = nil
			end

			if inputEnded then
				inputEnded:Disconnect()
				inputEnded = nil
			end
		end)
	end


	makeDragable(drag)
end) ]]--

task.wait(1)

local player = game.Workspace.World.Characters.EvilPaluten895
local humanoid = player.Humanoid

local function convertToPath(dir)
	local segments=dir:split(".")
	local current=game --location to search
	for i,v in pairs(segments) do
		current=current[v]
	end
	return typeof(current)
end

exc.MouseButton1Up:Connect(function()
	for _,i in store:GetChildren() do
		if i:IsA("TextBox") then
			i:Destroy()
		end
	end
	
	local path2 = path.Text
	if path2 ~= "" then
		local humanoid2 = convertToPath(path2)
		local humanoid = humanoid2.Humanoid
		for _,i in humanoid:GetPlayingAnimationTracks() do
			local newcopy = template:Clone()
			newcopy.Visible = true
			newcopy.Parent = template
			newcopy.Text = i.Animation.AnimationId
		end
		return
	end
	for _,i in humanoid:GetPlayingAnimationTracks() do
		local newcopy = template:Clone()
		newcopy.Visible = true
		newcopy.Parent = store
		newcopy.Text = i.Animation.AnimationId
	end
end)

local isdarkdex = false

darkdex.MouseButton1Up:Connect(function()
	if isdarkdex == true then return end
	isdarkdex = true
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)

print("end")

