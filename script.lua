--[[
--basic script
local lib = library:CreateMain()

lib:CreateButton(
	"Best ui lib",
	function()
		print("button clicked")
	end
)

]]

local Library = {}

function Library:CreateMain()
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("ScrollingFrame")
	local Frame2 = Instane.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	Frame2.Active = true
	Frame2.Draggable = true
	Frame2.Parent = ScreenGui
	Frame2.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	Frame2.BackgroundTransparency = 0
	Frame2.BorderSizePixel = 0
	Frame2.Position = UDim2.new(.5,0,.5,0)
	Frame2.Size = UDim2.new(0.287, 0, 	0.35, 0)

	
	Frame.Active = true
	Frame.Draggable = true
	Frame.Parent = Frame2
	Frame.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(.5,0,.5,0)
	Frame.Size = UDim2.new(1,0,1,0)

	UIListLayout.Parent = Frame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local GamerLibrary = {}

	function GamerLibrary:NewButton(Text, Func)
		local TextButton = Instance.new("TextButton")

		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
		TextButton.BackgroundTransparency = .8
		TextButton.Size = UDim2.new(1,0, 0, 50)
		TextButton.Font = Enum.Font.ArialBold
		TextButton.Text = Text
		TextButton.TextColor3 = Color3.fromRGB(255,255,255)
		TextButton.TextScaled = true
		Frame.CanvasSize = UDim2.new(0,0,Frame.CanvasSize.Y.Scale + .8,0)

		TextButton.MouseButton1Click:Connect(function()
			spawn(function() Func() end)
		end)
	end
	
	function GamerLibrary:NewLabel(Text)
		local TextButton = Instance.new("TextLabel")
		local UIStroke = Instance.new("UIStroke")

		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
		TextButton.BackgroundTransparency = .8
		TextButton.Size = UDim2.new(1,0, 0, 50)
		TextButton.Font = Enum.Font.ArialBold
		TextButton.Text = Text
		TextButton.TextColor3 = Color3.fromRGB(255,255,255)
		TextButton.TextScaled = true
		Frame.CanvasSize = UDim2.new(0,0,Frame.CanvasSize.Y.Scale + .8,0)
		
		UIStroke.Parent = TextButton
		UIStroke.Color = Color3.new(1,1,1)
		UIStroke.Thickness = .5
	end
	
	function GamerLibrary:NewToggle(Text, Value, Func)
		local TextButton = Instance.new("TextButton")

		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
		TextButton.BackgroundTransparency = .8
		TextButton.Size = UDim2.new(1,0, 0, 50)
		TextButton.Font = Enum.Font.ArialBold
		TextButton.Text = Text
		TextButton.TextColor3 = Color3.fromRGB(255, 0, 0)
		TextButton.TextScaled = true
		Frame.CanvasSize = UDim2.new(0,0,Frame.CanvasSize.Y.Scale + .8,0)

		TextButton.MouseButton1Click:Connect(function()
			Value = Func(not Value)
			if Value then
				TextButton.TextColor3 = Color3.fromRGB(0, 255, 0)
			else
				TextButton.TextColor3 = Color3.fromRGB(255, 0, 0)
			end
		end)
	end

	return GamerLibrary
end

return Library;
