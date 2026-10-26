-- glass-demo.luau
-- A draggable glass panel to try lib/glass.luau. Enter unloads it.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Glass = loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/wraith-hub/main/lib/glass.luau"))()

local TIER_TEXT = {
	Acrylic = "Real blur (graphics 8+)",
	Hybrid = "Graphics on Automatic: real + painted blur",
	Fallback = "Painted blur (graphics below 8)",
}

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local existing = playerGui:FindFirstChild("GlassDemo")
if existing then
	existing:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "GlassDemo"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local panel = Glass.new({ Parent = gui, Size = UDim2.fromOffset(380, 210) })

local labels: { [TextLabel]: string } = {} -- label -> "Text" or "SubText", recoloured on theme change

local function label(text: string, font: Enum.Font, size: number, position: UDim2, role: string): TextLabel
	local l = Instance.new("TextLabel")
	l.Position = position
	l.Size = UDim2.new(1, -48, 0, size + 4)
	l.AutomaticSize = Enum.AutomaticSize.Y
	l.BackgroundTransparency = 1
	l.Text = text
	l.Font = font
	l.TextSize = size
	l.TextWrapped = true
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.TextColor3 = panel.Theme[role]
	l.Parent = panel.Content
	labels[l] = role
	return l
end

label("Glass", Enum.Font.GothamBold, 22, UDim2.fromOffset(24, 22), "Text")
label(
	"Frosted panel that blurs the world behind it, and paints its own blur when graphics are too low for the real one.",
	Enum.Font.Gotham,
	14,
	UDim2.fromOffset(24, 58),
	"SubText"
)
local tier = label("", Enum.Font.GothamMedium, 12, UDim2.new(0, 24, 1, -58), "SubText")
label("Drag to move · Enter to unload", Enum.Font.Gotham, 12, UDim2.new(0, 24, 1, -38), "SubText")

local themeButton = Instance.new("TextButton")
themeButton.AnchorPoint = Vector2.new(1, 1)
themeButton.Position = UDim2.new(1, -20, 1, -20)
themeButton.Size = UDim2.fromOffset(72, 30)
themeButton.BackgroundColor3 = Color3.new(1, 1, 1)
themeButton.BackgroundTransparency = 0.85
themeButton.Text = "Light"
themeButton.Font = Enum.Font.GothamBold
themeButton.TextSize = 13
themeButton.TextColor3 = panel.Theme.Text
themeButton.AutoButtonColor = false
themeButton.Parent = panel.Content
Instance.new("UICorner", themeButton).CornerRadius = UDim.new(1, 0)
local buttonStroke = Instance.new("UIStroke", themeButton)
buttonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
buttonStroke.Color = Color3.new(1, 1, 1)
buttonStroke.Transparency = 0.7

themeButton.MouseButton1Click:Connect(function()
	local name = if themeButton.Text == "Light" then "Light" else "Dark"
	panel:SetTheme(name)
	themeButton.Text = if name == "Light" then "Dark" else "Light"
	themeButton.TextColor3 = panel.Theme.Text
	for l, role in pairs(labels) do
		l.TextColor3 = panel.Theme[role]
	end
end)

-- Behaviour -----------------------------------------------------------------

local connections = {}
local dragStart: Vector3?
local startPosition: UDim2?

local function isPress(input: InputObject): boolean
	return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

panel.Frame.InputBegan:Connect(function(input)
	if isPress(input) then
		dragStart = input.Position
		startPosition = panel.Frame.Position
	end
end)

table.insert(connections, UserInputService.InputChanged:Connect(function(input)
	if dragStart and startPosition and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		panel.Frame.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
	end
end))

table.insert(connections, UserInputService.InputEnded:Connect(function(input)
	if isPress(input) then
		dragStart = nil
	end
end))

table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
	if processed then
		return
	end
	if input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
		panel:SetVisible(false)
		task.wait(0.35)
		gui:Destroy() -- takes the panel with it
	end
end))

gui.Destroying:Connect(function()
	for _, connection in ipairs(connections) do
		connection:Disconnect()
	end
end)

task.spawn(function()
	while gui.Parent do
		tier.Text = TIER_TEXT[panel:GetTier()]
		task.wait(0.5)
	end
end)
