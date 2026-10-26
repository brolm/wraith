-- loader.luau
-- Keyless script browser: lists everything in scripts/index.json and loads the one you pick.
--
-- Run with:
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/wraith-hub/main/loader.luau"))()
--
-- To add a script, put it in scripts/ and add an entry to scripts/index.json:
--   { "name": "...", "file": "my-script.luau", "game": "...", "description": "..." }

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local BASE_URL = "https://raw.githubusercontent.com/whodunitwww/wraith-hub/main/scripts/"
local GUI_NAME = "WraithHub"
local TOGGLE_KEY = Enum.KeyCode.RightControl

local COLORS = {
	background = Color3.fromRGB(22, 22, 28),
	card = Color3.fromRGB(31, 31, 39),
	stroke = Color3.fromRGB(48, 48, 60),
	text = Color3.fromRGB(235, 235, 240),
	dim = Color3.fromRGB(150, 150, 165),
	accent = Color3.fromRGB(140, 110, 255),
	error = Color3.fromRGB(255, 105, 105),
}

type Entry = {
	name: string,
	file: string,
	game: string?,
	description: string?,
}

-- HttpGet doesn't fail on a missing file; raw GitHub just returns this body.
local function fetch(path: string): string
	local body = game:HttpGet(BASE_URL .. path)
	if body == "404: Not Found" then
		error(path .. " isn't on GitHub (404) - has it been pushed?", 0)
	end
	return body
end

local function fetchIndex(): ({ Entry }?, string?)
	local ok, result = pcall(function()
		return HttpService:JSONDecode(fetch("index.json"))
	end)
	if not ok then
		return nil, tostring(result)
	end
	if type(result) ~= "table" then
		return nil, "index.json should be a list of scripts"
	end
	local entries = {}
	for _, entry in ipairs(result) do
		if type(entry) == "table" and type(entry.name) == "string" and type(entry.file) == "string" then
			table.insert(entries, entry)
		end
	end
	return entries
end

-- UI ------------------------------------------------------------------------

local function create(className: string, props: { [string]: any }, children: { Instance }?): any
	local instance = Instance.new(className)
	for key, value in pairs(props) do
		instance[key] = value
	end
	for _, child in ipairs(children or {}) do
		child.Parent = instance
	end
	return instance
end

local function corner(radius: number): UICorner
	return create("UICorner", { CornerRadius = UDim.new(0, radius) })
end

local function padding(pixels: number): UIPadding
	local p = UDim.new(0, pixels)
	return create("UIPadding", { PaddingTop = p, PaddingBottom = p, PaddingLeft = p, PaddingRight = p })
end

local function label(text: string, font: Enum.Font, size: number, color: Color3, order: number): TextLabel
	return create("TextLabel", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Text = text,
		Font = font,
		TextSize = size,
		TextColor3 = color,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = order,
	})
end

local function titleButton(text: string, width: number, rightOffset: number): TextButton
	return create("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -rightOffset, 0.5, 0),
		Size = UDim2.fromOffset(width, 26),
		BackgroundColor3 = COLORS.card,
		BorderSizePixel = 0,
		Text = text,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = COLORS.dim,
	}, { corner(6) })
end

local function card(entry: Entry, order: number): (Frame, TextButton)
	local loadButton = create("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.fromScale(1, 0.5),
		Size = UDim2.fromOffset(64, 28),
		BackgroundColor3 = COLORS.accent,
		BorderSizePixel = 0,
		Text = "Load",
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextColor3 = Color3.new(1, 1, 1),
	}, { corner(6) })

	local text = {
		create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }),
		label(entry.name, Enum.Font.GothamBold, 15, COLORS.text, 1),
		label(entry.game or "Universal", Enum.Font.GothamMedium, 12, COLORS.accent, 2),
	}
	if entry.description then
		table.insert(text, label(entry.description, Enum.Font.Gotham, 13, COLORS.dim, 3))
	end

	local frame = create("Frame", {
		Size = UDim2.new(1, -8, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = COLORS.card,
		BorderSizePixel = 0,
		LayoutOrder = order,
	}, {
		corner(6),
		padding(10),
		create("Frame", {
			Size = UDim2.new(1, -76, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
		}, text),
		loadButton,
	})
	return frame, loadButton
end

-- gethui / CoreGui keep the browser out of the game's own PlayerGui; PlayerGui is the last resort.
local function guiParent(): Instance
	local ok, parent = pcall(function()
		return if gethui then gethui() else game:GetService("CoreGui")
	end)
	return if ok and parent then parent else Players.LocalPlayer:WaitForChild("PlayerGui")
end

local parent = guiParent()
local existing = parent:FindFirstChild(GUI_NAME)
if existing then
	existing:Destroy()
end

local closeButton = titleButton("X", 26, 8)
local refreshButton = titleButton("Refresh", 64, 40)

local titleBar = create("TextLabel", {
	Size = UDim2.new(1, 0, 0, 40),
	BackgroundTransparency = 1,
	Text = "Wraith Hub",
	Font = Enum.Font.GothamBold,
	TextSize = 16,
	TextColor3 = COLORS.text,
	TextXAlignment = Enum.TextXAlignment.Left,
}, {
	create("UIPadding", { PaddingLeft = UDim.new(0, 14) }),
	refreshButton,
	closeButton,
})

local search = create("TextBox", {
	Position = UDim2.fromOffset(12, 44),
	Size = UDim2.new(1, -24, 0, 32),
	BackgroundColor3 = COLORS.card,
	BorderSizePixel = 0,
	ClearTextOnFocus = false,
	PlaceholderText = "Search scripts or games...",
	PlaceholderColor3 = COLORS.dim,
	Text = "",
	Font = Enum.Font.Gotham,
	TextSize = 14,
	TextColor3 = COLORS.text,
	TextXAlignment = Enum.TextXAlignment.Left,
}, {
	corner(6),
	create("UIPadding", { PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) }),
})

local list = create("ScrollingFrame", {
	Position = UDim2.fromOffset(12, 86),
	Size = UDim2.new(1, -24, 1, -122),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	ScrollBarThickness = 4,
	ScrollBarImageColor3 = COLORS.stroke,
}, {
	create("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }),
})

local status = create("TextLabel", {
	Position = UDim2.new(0, 14, 1, -30),
	Size = UDim2.new(1, -28, 0, 20),
	BackgroundTransparency = 1,
	Text = "",
	Font = Enum.Font.Gotham,
	TextSize = 12,
	TextColor3 = COLORS.dim,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextTruncate = Enum.TextTruncate.AtEnd,
})

local main = create("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	-- Fills most of a small (mobile) screen, capped at 440x380 on desktop.
	Size = UDim2.fromScale(0.9, 0.8),
	BackgroundColor3 = COLORS.background,
	BorderSizePixel = 0,
}, {
	corner(8),
	create("UIStroke", { Color = COLORS.stroke, Thickness = 1 }),
	create("UISizeConstraint", { MaxSize = Vector2.new(440, 380) }),
	titleBar,
	search,
	list,
	status,
})

local gui = create("ScreenGui", {
	Name = GUI_NAME,
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 100,
}, { main })
gui.Parent = parent

-- Behaviour -----------------------------------------------------------------

local cards: { { entry: Entry, frame: Frame } } = {}
local refreshing = false
local loading = false

local function setStatus(text: string, isError: boolean?)
	status.Text = text
	status.TextColor3 = if isError then COLORS.error else COLORS.dim
end

local function matches(entry: Entry, query: string): boolean
	for _, field in ipairs({ entry.name, entry.game or "", entry.description or "" }) do
		if string.find(string.lower(field), query, 1, true) then
			return true
		end
	end
	return false
end

local function applySearch()
	local query = string.lower(search.Text):match("^%s*(.-)%s*$")
	for _, item in ipairs(cards) do
		item.frame.Visible = matches(item.entry, query)
	end
end

local function runScript(entry: Entry)
	if loading then
		return
	end
	loading = true
	setStatus("Loading " .. entry.name .. "...")

	local ok, source = pcall(function()
		return fetch(entry.file)
	end)
	if not ok then
		loading = false
		setStatus("Failed to download " .. entry.name .. ": " .. tostring(source), true)
		return
	end

	local chunk, err = loadstring(source, "=" .. entry.name)
	loading = false
	if not chunk then
		setStatus("Failed to compile " .. entry.name .. ": " .. tostring(err), true)
		return
	end

	setStatus("Loaded " .. entry.name)
	local ran, runErr = pcall(chunk)
	if not ran then
		warn("[Wraith] " .. entry.name .. " errored: " .. tostring(runErr))
		setStatus(entry.name .. " errored: " .. tostring(runErr), true)
	end
end

local function refresh()
	if refreshing then
		return
	end
	refreshing = true
	for _, item in ipairs(cards) do
		item.frame:Destroy()
	end
	table.clear(cards)
	setStatus("Fetching scripts...")

	local entries, err = fetchIndex()
	refreshing = false
	if not entries then
		setStatus("Couldn't load the script list: " .. tostring(err), true)
		return
	end

	for i, entry in ipairs(entries) do
		local frame, loadButton = card(entry, i)
		loadButton.MouseButton1Click:Connect(function()
			runScript(entry)
		end)
		frame.Parent = list
		table.insert(cards, { entry = entry, frame = frame })
	end
	applySearch()
	setStatus(#entries .. " scripts · " .. TOGGLE_KEY.Name .. " to hide")
end

-- Dragging and the toggle key listen on UserInputService, so they're disconnected when the GUI goes.
local connections = {}
local dragStart: Vector3?
local startPosition: UDim2?

local function isPress(input: InputObject): boolean
	return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

titleBar.InputBegan:Connect(function(input)
	if isPress(input) then
		dragStart = input.Position
		startPosition = main.Position
	end
end)

table.insert(connections, UserInputService.InputChanged:Connect(function(input)
	if dragStart and startPosition and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
	end
end))

table.insert(connections, UserInputService.InputEnded:Connect(function(input)
	if isPress(input) then
		dragStart = nil
	end
end))

table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
	if not processed and input.KeyCode == TOGGLE_KEY then
		main.Visible = not main.Visible
	end
end))

gui.Destroying:Connect(function()
	for _, connection in ipairs(connections) do
		connection:Disconnect()
	end
end)

closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
refreshButton.MouseButton1Click:Connect(refresh)
search:GetPropertyChangedSignal("Text"):Connect(applySearch)

refresh()
