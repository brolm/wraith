-- loader.luau
-- Wraith Hub: a keyless script browser. Lists everything in scripts/index.json and runs the one you pick.
--
-- Run with:
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/wraith-hub/main/loader.luau"))()
--
-- To add a script, put it in scripts/ and add an entry to scripts/index.json:
--   { "name": "...", "file": "my-script.luau", "game": "...", "description": "..." }
-- Scripts with no "game" (or "Universal") are listed under Universal; the rest are grouped by game.

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local REPO_URL = "https://raw.githubusercontent.com/whodunitwww/wraith-hub/main/"
local GUI_NAME = "WraithHub"
local TOGGLE_KEY = Enum.KeyCode.RightControl

local WINDOW_SIZE = Vector2.new(680, 440)
local ZOOMED_SIZE = Vector2.new(860, 560)
local RADIUS = 18
local SIDEBAR_WIDTH = 196
local TOOLBAR_HEIGHT = 60
local STATUS_HEIGHT = 34
local CARD_HEIGHT = 52

local THEME = {
	text = Color3.fromRGB(244, 244, 248),
	subText = Color3.fromRGB(166, 166, 182),
	faint = Color3.fromRGB(112, 112, 128),
	accent = Color3.fromRGB(139, 112, 255),
	accentText = Color3.fromRGB(194, 182, 255),
	success = Color3.fromRGB(72, 214, 132),
	error = Color3.fromRGB(255, 112, 104),
	white = Color3.new(1, 1, 1),
	black = Color3.new(0, 0, 0),
	-- Wraith's spectral violet-to-ice gradient, on the logo.
	brand = { Color3.fromRGB(132, 94, 255), Color3.fromRGB(80, 200, 255) },
}

-- Script icons cycle through these in list order, so neighbouring cards always differ.
local ICON_GRADIENTS = {
	THEME.brand,
	{ Color3.fromRGB(236, 72, 153), Color3.fromRGB(139, 92, 246) },
	{ Color3.fromRGB(20, 184, 166), Color3.fromRGB(59, 130, 246) },
	{ Color3.fromRGB(251, 146, 60), Color3.fromRGB(236, 72, 153) },
	{ Color3.fromRGB(99, 102, 241), Color3.fromRGB(56, 189, 248) },
}

-- Every surface and line is white laid over the glass at one of these transparencies.
local ALPHA = {
	hover = 0.95,
	control = 0.92,
	button = 0.9,
	card = 0.965,
	cardHover = 0.94,
	line = 0.92,
	selected = 0.78, -- of the accent, not white
}

local TRAFFIC_LIGHTS = {
	Close = Color3.fromRGB(255, 95, 87),
	Minimize = Color3.fromRGB(254, 188, 46),
	Zoom = Color3.fromRGB(40, 200, 64),
}

local FONT_FAMILY = "rbxasset://fonts/families/BuilderSans.json"
local FONTS = {
	regular = Font.new(FONT_FAMILY, Enum.FontWeight.Regular),
	medium = Font.new(FONT_FAMILY, Enum.FontWeight.Medium),
	bold = Font.new(FONT_FAMILY, Enum.FontWeight.Bold),
	heavy = Font.new(FONT_FAMILY, Enum.FontWeight.ExtraBold),
}

local QUICK = TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local SMOOTH = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local FULL = UDim2.fromScale(1, 1)

type Entry = {
	name: string,
	file: string,
	game: string?,
	description: string?,
}

-- Data ----------------------------------------------------------------------

-- HttpGet doesn't fail on a missing file; raw GitHub just returns this body.
local function fetch(path: string): string
	local body = game:HttpGet(REPO_URL .. path)
	if body == "404: Not Found" then
		error(path .. " isn't on GitHub (404) - has it been pushed?", 0)
	end
	return body
end

local function fetchIndex(): ({ Entry }?, string?)
	local ok, result = pcall(function()
		return HttpService:JSONDecode(fetch("scripts/index.json"))
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

local function gameOf(entry: Entry): string
	return if type(entry.game) == "string" and entry.game ~= "" then entry.game else "Universal"
end

local function matches(entry: Entry, query: string): boolean
	for _, field in ipairs({ entry.name, gameOf(entry), tostring(entry.description or "") }) do
		if string.find(string.lower(field), query, 1, true) then
			return true
		end
	end
	return false
end

-- UI helpers ----------------------------------------------------------------

local function create(className: string, props: { [string]: any }, children: { Instance }?): any
	local instance = Instance.new(className)
	for key, value in pairs(props) do
		if key ~= "Parent" then
			instance[key] = value
		end
	end
	for _, child in ipairs(children or {}) do
		child.Parent = instance
	end
	instance.Parent = props.Parent
	return instance
end

-- No radius means fully round.
local function corner(radius: number?): UICorner
	return create("UICorner", { CornerRadius = if radius then UDim.new(0, radius) else UDim.new(1, 0) })
end

local function stroke(transparency: number, color: Color3?, thickness: number?): UIStroke
	return create("UIStroke", {
		Color = color or THEME.white,
		Transparency = transparency,
		Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
end

local function text(props: { [string]: any }, children: { Instance }?): TextLabel
	props.BackgroundTransparency = 1
	props.FontFace = props.FontFace or FONTS.regular
	props.TextColor3 = props.TextColor3 or THEME.text
	props.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Left
	return create("TextLabel", props, children)
end

local function line(props: { [string]: any }): Frame
	props.BackgroundColor3 = THEME.white
	props.BackgroundTransparency = ALPHA.line
	props.BorderSizePixel = 0
	return create("Frame", props)
end

-- A rounded bar centred in its parent; glyphs are drawn from these so they don't depend on fonts.
local function bar(size: Vector2, rotation: number, color: Color3, transparency: number?): Frame
	return create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(size.X, size.Y),
		Rotation = rotation,
		BackgroundColor3 = color,
		BackgroundTransparency = transparency or 0,
		BorderSizePixel = 0,
	}, { corner() })
end

local function tween(instance: Instance, props: { [string]: any }, info: TweenInfo?)
	TweenService:Create(instance, info or QUICK, props):Play()
end

local function onHover(object: GuiObject, callback: (boolean) -> ())
	object.MouseEnter:Connect(function()
		callback(true)
	end)
	object.MouseLeave:Connect(function()
		callback(false)
	end)
end

-- A gradient tile with a letter on it and a gloss across the top, like a Mac app icon.
local function appIcon(letter: string, colors: { Color3 }, size: number): Frame
	local radius = math.floor(size * 0.29 + 0.5)
	return create("Frame", {
		Size = UDim2.fromOffset(size, size),
		BackgroundColor3 = THEME.white,
		BorderSizePixel = 0,
	}, {
		corner(radius),
		create("UIGradient", { Color = ColorSequence.new(colors[1], colors[2]), Rotation = 45 }),
		create("Frame", {
			Size = UDim2.fromScale(1, 0.6),
			BackgroundColor3 = THEME.white,
			BorderSizePixel = 0,
		}, {
			corner(radius),
			create("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(0.72, 1) }),
		}),
		text({
			Size = FULL,
			Text = letter,
			FontFace = FONTS.heavy,
			TextSize = math.floor(size * 0.55),
			TextColor3 = THEME.white,
			TextXAlignment = Enum.TextXAlignment.Center,
		}),
		stroke(0.82),
	})
end

-- Sidebar glyphs: a grid for All, a globe for Universal, a diamond for each game.
local function navIcon(kind: string): (Frame, (Color3) -> ())
	local frame = create("Frame", { Size = UDim2.fromOffset(16, 16), BackgroundTransparency = 1 })
	local fills: { Frame } = {}
	local strokes: { UIStroke } = {}
	local function ring(size: Vector2, radius: number?, rotation: number?)
		local s = stroke(0, nil, 1.5)
		create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(size.X, size.Y),
			Rotation = rotation or 0,
			BackgroundTransparency = 1,
			Parent = frame,
		}, { corner(radius), s })
		table.insert(strokes, s)
	end
	if kind == "all" then
		for i = 0, 3 do
			table.insert(
				fills,
				create("Frame", {
					Position = UDim2.fromOffset(2 + i % 2 * 7, 2 + i // 2 * 7),
					Size = UDim2.fromOffset(5, 5),
					BorderSizePixel = 0,
					Parent = frame,
				}, { corner(1.5) })
			)
		end
	elseif kind == "universal" then
		ring(Vector2.new(13, 13))
		ring(Vector2.new(6, 13))
		local equator = bar(Vector2.new(13, 1.5), 0, THEME.white)
		equator.Parent = frame
		table.insert(fills, equator)
	else
		ring(Vector2.new(9, 9), 2, 45)
	end
	return frame, function(color: Color3)
		for _, fill in ipairs(fills) do
			fill.BackgroundColor3 = color
		end
		for _, s in ipairs(strokes) do
			s.Color = color
		end
	end
end

local function pillButton(label: string, width: number): TextButton
	return create("TextButton", {
		Size = UDim2.fromOffset(width, 26),
		BackgroundColor3 = THEME.white,
		BackgroundTransparency = ALPHA.button,
		AutoButtonColor = false,
		Text = label,
		FontFace = FONTS.bold,
		TextSize = 13,
		TextColor3 = THEME.accentText,
	}, { corner() })
end

-- Pills fill with the accent under the cursor.
local function pillHover(button: TextButton, hovering: boolean)
	tween(button, {
		BackgroundColor3 = if hovering then THEME.accent else THEME.white,
		BackgroundTransparency = if hovering then 0 else ALPHA.button,
		TextColor3 = if hovering then THEME.white else THEME.accentText,
	})
end

-- Window ----------------------------------------------------------------------

-- gethui / CoreGui keep the hub out of the game's own PlayerGui; PlayerGui is the last resort.
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

local gui = create("ScreenGui", {
	Name = GUI_NAME,
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 100,
})

-- Holds the window so it can be dragged, zoomed and scaled down to fit small screens.
local holder = create("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(WINDOW_SIZE.X, WINDOW_SIZE.Y),
	BackgroundTransparency = 1,
	Parent = gui,
})
local fit = create("UIScale", { Parent = holder })

type Window = { Content: Frame, SetVisible: (any, boolean) -> () }

-- Frosted glass from lib/glass.luau. If that can't load, a plain dark window stands in.
local function makeWindow(): Window
	local ok, result = pcall(function()
		local Glass = loadstring(fetch("lib/glass.luau"))()
		return Glass.new({ Parent = holder, Size = FULL, CornerRadius = RADIUS, Theme = "Wraith" })
	end)
	if ok then
		return result
	end
	warn("[Wraith] Glass unavailable, using a plain window: " .. tostring(result))
	local frame = create("Frame", {
		Size = FULL,
		BackgroundColor3 = Color3.fromRGB(16, 15, 24),
		BackgroundTransparency = 0.03,
		Parent = holder,
	}, { corner(RADIUS), stroke(0.88) })
	return {
		Content = create("Frame", { Size = FULL, BackgroundTransparency = 1, Parent = frame }),
		SetVisible = function(_, visible: boolean)
			frame.Visible = visible
		end,
	}
end

local window = makeWindow()
local content = window.Content

-- Sidebar ---------------------------------------------------------------------

local sidebar = create("Frame", {
	Size = UDim2.new(0, SIDEBAR_WIDTH, 1, 0),
	BackgroundTransparency = 1,
	Parent = content,
})
local sidebarDrag = create("Frame", { Size = UDim2.new(1, 0, 0, 96), BackgroundTransparency = 1, Parent = sidebar })

local lights = create("Frame", {
	Position = UDim2.fromOffset(20, 20),
	Size = UDim2.fromOffset(52, 12),
	BackgroundTransparency = 1,
	Parent = sidebar,
}, {
	create("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
})

-- The glyphs show on all three lights when the cursor is over any of them, as on a Mac.
local lightGlyphs: { Frame } = {}
local function trafficLight(name: string, order: number, glyphRotations: { number }): TextButton
	local button = create("TextButton", {
		Name = name,
		Size = UDim2.fromOffset(12, 12),
		BackgroundColor3 = TRAFFIC_LIGHTS[name],
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = order,
		Parent = lights,
	}, { corner(), stroke(0.8, THEME.black) })
	for _, rotation in ipairs(glyphRotations) do
		local glyph = bar(Vector2.new(7, 1.5), rotation, THEME.black, 1)
		glyph.Parent = button
		table.insert(lightGlyphs, glyph)
	end
	return button
end

local closeButton = trafficLight("Close", 1, { 45, -45 })
local minimizeButton = trafficLight("Minimize", 2, { 0 })
local zoomButton = trafficLight("Zoom", 3, { 0, 90 })

onHover(lights, function(hovering)
	for _, glyph in ipairs(lightGlyphs) do
		tween(glyph, { BackgroundTransparency = if hovering then 0.45 else 1 })
	end
end)

create("Frame", {
	Position = UDim2.fromOffset(18, 50),
	Size = UDim2.new(1, -36, 0, 34),
	BackgroundTransparency = 1,
	Parent = sidebar,
}, {
	appIcon("W", THEME.brand, 34),
	text({
		Position = UDim2.fromOffset(46, -1),
		Size = UDim2.new(1, -46, 0, 20),
		Text = "Wraith",
		FontFace = FONTS.heavy,
		TextSize = 19,
	}),
	text({
		Position = UDim2.fromOffset(46, 19),
		Size = UDim2.new(1, -46, 0, 15),
		Text = "Script Hub",
		FontFace = FONTS.medium,
		TextSize = 12,
		TextColor3 = THEME.subText,
	}),
})

local nav = create("ScrollingFrame", {
	Position = UDim2.fromOffset(10, 96),
	Size = UDim2.new(1, -20, 1, -96 - 50),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	ScrollBarThickness = 0,
	Parent = sidebar,
}, {
	create("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }),
})

local keyName = TOGGLE_KEY.Name:gsub("Control", "Ctrl"):gsub("(%l)(%u)", "%1 %2")
create("Frame", {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.new(0, 20, 1, -16),
	Size = UDim2.new(1, -40, 0, 20),
	BackgroundTransparency = 1,
	Parent = sidebar,
}, {
	create("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
	text({
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, 20),
		BackgroundTransparency = ALPHA.control,
		Text = keyName,
		FontFace = FONTS.medium,
		TextSize = 11,
		TextColor3 = THEME.subText,
		LayoutOrder = 1,
	}, {
		corner(5),
		stroke(0.88),
		create("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6) }),
	}),
	text({
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, 20),
		Text = "to hide",
		TextSize = 11,
		TextColor3 = THEME.faint,
		LayoutOrder = 2,
	}),
})

line({ Position = UDim2.fromOffset(SIDEBAR_WIDTH, 0), Size = UDim2.new(0, 1, 1, 0), Parent = content })

-- Main area -------------------------------------------------------------------

local main = create("Frame", {
	Position = UDim2.fromOffset(SIDEBAR_WIDTH + 1, 0),
	Size = UDim2.new(1, -SIDEBAR_WIDTH - 1, 1, 0),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Parent = content,
})

-- The content side sits a shade darker than the sidebar. Only its right corners should be round,
-- so the shade starts past the left edge, where the clipping cuts its left corners off.
create("Frame", {
	Position = UDim2.fromOffset(-RADIUS, 0),
	Size = UDim2.new(1, RADIUS, 1, 0),
	BackgroundColor3 = THEME.black,
	BackgroundTransparency = 0.8,
	BorderSizePixel = 0,
	Parent = main,
}, { corner(RADIUS) })

local toolbar = create("Frame", { Size = UDim2.new(1, 0, 0, TOOLBAR_HEIGHT), BackgroundTransparency = 1, Parent = main })
local toolbarDrag = create("Frame", { Size = UDim2.new(1, -250, 1, 0), BackgroundTransparency = 1, Parent = toolbar })
local title = text({
	Position = UDim2.fromOffset(22, 12),
	Size = UDim2.new(1, -22, 0, 22),
	Text = "All Scripts",
	FontFace = FONTS.bold,
	TextSize = 18,
	TextTruncate = Enum.TextTruncate.AtEnd,
	Parent = toolbarDrag,
})
local subtitle = text({
	Position = UDim2.fromOffset(22, 33),
	Size = UDim2.new(1, -22, 0, 15),
	Text = "",
	TextSize = 12,
	TextColor3 = THEME.subText,
	Parent = toolbarDrag,
})

local searchStroke = stroke(0.9)
local searchField = create("Frame", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -18, 0.5, 0),
	Size = UDim2.fromOffset(220, 30),
	BackgroundColor3 = THEME.white,
	BackgroundTransparency = ALPHA.control,
	Parent = toolbar,
}, { corner(9), searchStroke })

create("Frame", {
	Position = UDim2.fromOffset(10, 8),
	Size = UDim2.fromOffset(14, 14),
	BackgroundTransparency = 1,
	Parent = searchField,
}, {
	create("Frame", { Size = UDim2.fromOffset(9, 9), BackgroundTransparency = 1 }, {
		corner(),
		stroke(0, THEME.subText, 1.5),
	}),
	(function()
		local handle = bar(Vector2.new(5, 1.5), 45, THEME.subText)
		handle.Position = UDim2.fromOffset(10.5, 10.5)
		return handle
	end)(),
})

local search = create("TextBox", {
	Position = UDim2.fromOffset(30, 0),
	Size = UDim2.new(1, -54, 1, 0),
	BackgroundTransparency = 1,
	ClearTextOnFocus = false,
	ClipsDescendants = true,
	PlaceholderText = "Search",
	PlaceholderColor3 = THEME.faint,
	Text = "",
	FontFace = FONTS.regular,
	TextSize = 14,
	TextColor3 = THEME.text,
	TextXAlignment = Enum.TextXAlignment.Left,
	Parent = searchField,
})

local glyphColor = Color3.fromRGB(28, 28, 34)
local clearButton = create("TextButton", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -8, 0.5, 0),
	Size = UDim2.fromOffset(14, 14),
	BackgroundColor3 = THEME.subText,
	AutoButtonColor = false,
	Text = "",
	Visible = false,
	Parent = searchField,
}, {
	corner(),
	bar(Vector2.new(7, 1.5), 45, glyphColor),
	bar(Vector2.new(7, 1.5), -45, glyphColor),
})

line({ Position = UDim2.fromOffset(0, TOOLBAR_HEIGHT), Size = UDim2.new(1, 0, 0, 1), Parent = main })
line({ Position = UDim2.new(0, 0, 1, -STATUS_HEIGHT), Size = UDim2.new(1, 0, 0, 1), Parent = main })

local list = create("ScrollingFrame", {
	Position = UDim2.fromOffset(0, TOOLBAR_HEIGHT + 1),
	Size = UDim2.new(1, 0, 1, -TOOLBAR_HEIGHT - 1 - STATUS_HEIGHT),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	ScrollBarThickness = 3,
	ScrollBarImageColor3 = THEME.white,
	ScrollBarImageTransparency = 0.75,
	Parent = main,
}, {
	-- Only vertical: a ScrollingFrame's children don't shrink for side padding, so the grid insets itself.
	create("UIPadding", { PaddingTop = UDim.new(0, 14), PaddingBottom = UDim.new(0, 14) }),
})

-- Scripts are compact cards, two to a row.
local grid = create("Frame", {
	Position = UDim2.fromOffset(16, 0),
	Size = UDim2.new(1, -32, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
	Parent = list,
}, {
	create("UIGridLayout", {
		CellSize = UDim2.new(0.5, -4, 0, CARD_HEIGHT),
		CellPadding = UDim2.fromOffset(8, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
})

-- Loading, empty and error states, centred over the list.
local overlay = create("Frame", {
	Position = list.Position,
	Size = list.Size,
	BackgroundTransparency = 1,
	Visible = false,
	Parent = main,
}, {
	create("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
})

-- A ring that fades around half its length; spinning it reads as a loading indicator.
local spinnerStroke = stroke(0, THEME.accentText, 2)
create("UIGradient", { Transparency = NumberSequence.new(0, 1), Parent = spinnerStroke })
local spinner = create("Frame", {
	Size = UDim2.fromOffset(22, 22),
	BackgroundTransparency = 1,
	LayoutOrder = 1,
	Parent = overlay,
}, { corner(), spinnerStroke })
local spin = TweenService:Create(
	spinner,
	TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1),
	{ Rotation = 360 }
)

local overlayTitle = text({
	Size = UDim2.new(1, -60, 0, 20),
	Text = "",
	FontFace = FONTS.bold,
	TextSize = 15,
	TextXAlignment = Enum.TextXAlignment.Center,
	LayoutOrder = 2,
	Parent = overlay,
})
local overlayDetail = text({
	Size = UDim2.new(1, -80, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	Text = "",
	TextSize = 12,
	TextColor3 = THEME.subText,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Center,
	LayoutOrder = 3,
	Parent = overlay,
})
local retryButton = pillButton("Try Again", 92)
retryButton.LayoutOrder = 4
retryButton.Parent = overlay
onHover(retryButton, function(hovering)
	pillHover(retryButton, hovering)
end)

local statusBar = create("Frame", {
	Position = UDim2.new(0, 0, 1, -STATUS_HEIGHT),
	Size = UDim2.new(1, 0, 0, STATUS_HEIGHT),
	BackgroundTransparency = 1,
	Parent = main,
})
local statusDot = create("Frame", {
	AnchorPoint = Vector2.new(0, 0.5),
	Position = UDim2.new(0, 22, 0.5, 0),
	Size = UDim2.fromOffset(6, 6),
	BackgroundColor3 = THEME.faint,
	Parent = statusBar,
}, { corner() })
local status = text({
	Position = UDim2.fromOffset(36, 0),
	Size = UDim2.new(1, -120, 1, 0),
	Text = "",
	TextSize = 12,
	TextColor3 = THEME.subText,
	TextTruncate = Enum.TextTruncate.AtEnd,
	Parent = statusBar,
})
local refreshButton = create("TextButton", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -14, 0.5, 0),
	Size = UDim2.fromOffset(64, 22),
	BackgroundColor3 = THEME.white,
	BackgroundTransparency = 1,
	AutoButtonColor = false,
	Text = "Refresh",
	FontFace = FONTS.medium,
	TextSize = 12,
	TextColor3 = THEME.subText,
	Parent = statusBar,
}, { corner(6) })
onHover(refreshButton, function(hovering)
	tween(refreshButton, {
		BackgroundTransparency = if hovering then ALPHA.hover else 1,
		TextColor3 = if hovering then THEME.text else THEME.subText,
	})
end)

-- State -----------------------------------------------------------------------

type NavItem = { button: TextButton, label: TextLabel, count: TextLabel, paint: (Color3) -> (), hovered: boolean }

type Card = {
	entry: Entry,
	frame: Frame,
	name: TextLabel,
	gameLabel: TextLabel,
	run: TextButton,
	state: string,
	token: number,
	hovered: boolean,
}

local STATUS_DOTS = { idle = THEME.faint, busy = THEME.accent, success = THEME.success, error = THEME.error }

local RUN_STATES = {
	idle = { text = "Run", color = THEME.accentText },
	loading = { text = "Loading", color = THEME.subText },
	done = { text = "Loaded", color = THEME.success },
	failed = { text = "Failed", color = THEME.error },
}

local navItems: { [string]: NavItem } = {}
local cards: { Card } = {}
local selected = "all" -- "all", "universal" or "game:<name>"
local loaded = false
local refreshing = false
local running = false

local function setStatus(message: string, tone: string?)
	status.Text = message
	status.TextColor3 = if tone == "error" then THEME.error else THEME.subText
	tween(statusDot, { BackgroundColor3 = STATUS_DOTS[tone or "idle"] })
end

-- kind is "loading", "empty", "error", or nil to hide the overlay.
local function showOverlay(kind: string?, heading: string?, detail: string?)
	overlay.Visible = kind ~= nil
	spinner.Visible = kind == "loading"
	retryButton.Visible = kind == "error"
	overlayTitle.Text = heading or ""
	overlayDetail.Text = detail or ""
	overlayDetail.Visible = detail ~= nil
	if kind == "loading" then
		spin:Play()
	else
		spin:Cancel()
	end
end

local function styleNav()
	for key, item in pairs(navItems) do
		local on = key == selected
		tween(item.button, {
			BackgroundColor3 = if on then THEME.accent else THEME.white,
			BackgroundTransparency = if on then ALPHA.selected elseif item.hovered then ALPHA.hover else 1,
		})
		item.label.TextColor3 = if on then THEME.text else THEME.subText
		item.count.TextColor3 = if on then THEME.accentText else THEME.faint
		item.paint(if on then THEME.accentText else THEME.subText)
	end
end

local function inSection(entry: Entry): boolean
	if selected == "all" then
		return true
	end
	local name = gameOf(entry)
	if selected == "universal" then
		return name == "Universal"
	end
	return selected == "game:" .. name
end

local function applyFilter()
	local query = string.lower(search.Text):match("^%s*(.-)%s*$")
	-- The game line only says something in the All view; elsewhere every card is from the same place.
	local showGame = selected == "all"
	local shown = 0
	for _, card in ipairs(cards) do
		local visible = inSection(card.entry) and matches(card.entry, query)
		card.frame.Visible = visible
		if visible then
			shown += 1
		end
		card.gameLabel.Visible = showGame
		card.name.Position = UDim2.fromOffset(50, if showGame then 9 else 17)
	end

	clearButton.Visible = search.Text ~= ""
	local item = navItems[selected]
	title.Text = if item then item.label.Text else "All Scripts"
	subtitle.Text = if loaded then shown .. (if shown == 1 then " script" else " scripts") else ""
	if not loaded then
		return
	elseif shown > 0 then
		showOverlay(nil)
	elseif query ~= "" then
		showOverlay("empty", 'No results for "' .. search.Text .. '"', "Try a different search.")
	else
		showOverlay("empty", "Nothing here yet")
	end
end

local function navHeader(label: string, order: number)
	text({
		Size = UDim2.new(1, 0, 0, 30),
		Text = label,
		FontFace = FONTS.bold,
		TextSize = 11,
		TextColor3 = THEME.faint,
		TextYAlignment = Enum.TextYAlignment.Bottom,
		LayoutOrder = order,
		Parent = nav,
	}, { create("UIPadding", { PaddingLeft = UDim.new(0, 10), PaddingBottom = UDim.new(0, 6) }) })
end

local function navItem(key: string, label: string, kind: string, count: number, order: number)
	local glyph, paint = navIcon(kind)
	glyph.AnchorPoint = Vector2.new(0, 0.5)
	glyph.Position = UDim2.new(0, 10, 0.5, 0)
	local labelText = text({
		Position = UDim2.fromOffset(34, 0),
		Size = UDim2.new(1, -70, 1, 0),
		Text = label,
		FontFace = FONTS.medium,
		TextSize = 14,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})
	local countText = text({
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -10, 0, 0),
		Size = UDim2.new(0, 28, 1, 0),
		Text = tostring(count),
		FontFace = FONTS.medium,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Right,
	})
	local button = create("TextButton", {
		Size = UDim2.new(1, 0, 0, 32),
		BackgroundColor3 = THEME.white,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = order,
		Parent = nav,
	}, { corner(9), glyph, labelText, countText })

	local item: NavItem = { button = button, label = labelText, count = countText, paint = paint, hovered = false }
	navItems[key] = item
	onHover(button, function(hovering)
		item.hovered = hovering
		styleNav()
	end)
	button.MouseButton1Click:Connect(function()
		selected = key
		styleNav()
		applyFilter()
		list.CanvasPosition = Vector2.zero
	end)
end

local function buildNav(entries: { Entry })
	for _, child in ipairs(nav:GetChildren()) do
		if child:IsA("GuiObject") then
			child:Destroy()
		end
	end
	table.clear(navItems)

	local universal, games, counts = 0, {}, {}
	for _, entry in ipairs(entries) do
		local name = gameOf(entry)
		if name == "Universal" then
			universal += 1
		else
			if not counts[name] then
				counts[name] = 0
				table.insert(games, name)
			end
			counts[name] += 1
		end
	end
	table.sort(games)

	navHeader("Library", 1)
	navItem("all", "All Scripts", "all", #entries, 2)
	navItem("universal", "Universal", "universal", universal, 3)
	if #games > 0 then
		navHeader("Games", 4)
		for i, name in ipairs(games) do
			navItem("game:" .. name, name, "game", counts[name], 4 + i)
		end
	end
	if not navItems[selected] then
		selected = "all"
	end
	styleNav()
end

local function setRunState(card: Card, state: string)
	card.state = state
	card.token += 1
	card.run.Text = RUN_STATES[state].text
	if state == "idle" then
		pillHover(card.run, card.hovered)
	else
		tween(card.run, {
			BackgroundColor3 = THEME.white,
			BackgroundTransparency = ALPHA.button,
			TextColor3 = RUN_STATES[state].color,
		})
	end
	if state == "done" or state == "failed" then
		local token = card.token
		task.delay(1.8, function()
			if card.token == token then
				setRunState(card, "idle")
			end
		end)
	end
end

local function makeCard(entry: Entry, order: number): Card
	local colors = ICON_GRADIENTS[(order - 1) % #ICON_GRADIENTS + 1]
	local icon = appIcon(string.upper(string.sub(entry.name, 1, 1)), colors, 30)
	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.Position = UDim2.new(0, 11, 0.5, 0)

	local name = text({
		Position = UDim2.fromOffset(50, 9),
		Size = UDim2.new(1, -118, 0, 17),
		Text = entry.name,
		FontFace = FONTS.bold,
		TextSize = 13,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})
	local gameLabel = text({
		Position = UDim2.fromOffset(50, 26),
		Size = UDim2.new(1, -118, 0, 15),
		Text = gameOf(entry),
		TextSize = 11,
		TextColor3 = THEME.subText,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})

	local run = pillButton("Run", 56)
	run.AnchorPoint = Vector2.new(1, 0.5)
	run.Position = UDim2.new(1, -11, 0.5, 0)
	run.TextSize = 12

	local outline = stroke(0.93)
	local frame = create("Frame", {
		BackgroundColor3 = THEME.white,
		BackgroundTransparency = ALPHA.card,
		LayoutOrder = order,
	}, { corner(12), outline, icon, name, gameLabel, run })

	local card: Card = {
		entry = entry,
		frame = frame,
		name = name,
		gameLabel = gameLabel,
		run = run,
		state = "idle",
		token = 0,
		hovered = false,
	}
	onHover(frame, function(hovering)
		tween(frame, { BackgroundTransparency = if hovering then ALPHA.cardHover else ALPHA.card })
		tween(outline, { Transparency = if hovering then 0.88 else 0.93 })
	end)
	onHover(run, function(hovering)
		card.hovered = hovering
		if card.state == "idle" then
			pillHover(run, hovering)
		end
	end)
	return card
end

local function runScript(card: Card)
	if running then
		return
	end
	running = true
	local entry = card.entry
	setRunState(card, "loading")
	setStatus("Loading " .. entry.name .. "...", "busy")

	local ok, source = pcall(fetch, "scripts/" .. entry.file)
	local chunk, err
	if ok then
		chunk, err = loadstring(source, "=" .. entry.name)
	end
	running = false
	if not chunk then
		local reason = if ok
			then "Couldn't compile " .. entry.name .. ": " .. tostring(err)
			else "Couldn't download " .. entry.name .. ": " .. tostring(source)
		warn("[Wraith] " .. reason)
		setStatus(reason, "error")
		setRunState(card, "failed")
		return
	end

	setStatus("Loaded " .. entry.name, "success")
	setRunState(card, "done")
	local ran, runErr = pcall(chunk)
	if not ran then
		warn("[Wraith] " .. entry.name .. " errored: " .. tostring(runErr))
		setStatus(entry.name .. " errored: " .. tostring(runErr), "error")
		setRunState(card, "failed")
	end
end

local function refresh()
	if refreshing then
		return
	end
	refreshing = true
	loaded = false
	for _, card in ipairs(cards) do
		card.frame:Destroy()
	end
	table.clear(cards)
	subtitle.Text = ""
	showOverlay("loading", "Loading scripts")
	setStatus("Syncing with GitHub...", "busy")

	local entries, err = fetchIndex()
	refreshing = false
	if not entries then
		showOverlay("error", "Couldn't load scripts", tostring(err))
		setStatus("Offline", "error")
		return
	end

	loaded = true
	buildNav(entries)
	for i, entry in ipairs(entries) do
		local card = makeCard(entry, i)
		card.run.MouseButton1Click:Connect(function()
			runScript(card)
		end)
		card.frame.Parent = grid
		table.insert(cards, card)
	end
	applyFilter()
	setStatus("Up to date · " .. #entries .. (if #entries == 1 then " script" else " scripts"), "success")
end

-- Behaviour -------------------------------------------------------------------

local connections = {}
local shown = true
local zoomed = false

local function setShown(visible: boolean)
	shown = visible
	window:SetVisible(visible)
end

-- Scales the window down when the screen is too small for it.
local function fitToScreen(size: Vector2?)
	local camera = workspace.CurrentCamera
	if not camera then
		return
	end
	local target = size or (if zoomed then ZOOMED_SIZE else WINDOW_SIZE)
	local viewport = camera.ViewportSize
	fit.Scale = math.min(1, (viewport.X - 40) / target.X, (viewport.Y - 80) / target.Y)
end

local dragStart: Vector3?
local startPosition: UDim2?

local function isPress(input: InputObject): boolean
	return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

local function beginDrag(input: InputObject)
	if isPress(input) then
		dragStart = input.Position
		startPosition = holder.Position
	end
end
sidebarDrag.InputBegan:Connect(beginDrag)
toolbarDrag.InputBegan:Connect(beginDrag)

table.insert(
	connections,
	UserInputService.InputChanged:Connect(function(input)
		local moved = input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
		if dragStart and startPosition and moved then
			local delta = input.Position - dragStart
			holder.Position = UDim2.new(
				startPosition.X.Scale,
				startPosition.X.Offset + delta.X,
				startPosition.Y.Scale,
				startPosition.Y.Offset + delta.Y
			)
		end
	end)
)

table.insert(
	connections,
	UserInputService.InputEnded:Connect(function(input)
		if isPress(input) then
			dragStart = nil
		end
	end)
)

table.insert(
	connections,
	UserInputService.InputBegan:Connect(function(input, processed)
		if not processed and input.KeyCode == TOGGLE_KEY then
			setShown(not shown)
		end
	end)
)

if workspace.CurrentCamera then
	table.insert(
		connections,
		workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			fitToScreen()
		end)
	)
end

gui.Destroying:Connect(function()
	for _, connection in ipairs(connections) do
		connection:Disconnect()
	end
end)

closeButton.MouseButton1Click:Connect(function()
	setShown(false)
	task.delay(0.35, function()
		gui:Destroy()
	end)
end)
minimizeButton.MouseButton1Click:Connect(function()
	setShown(false)
end)
zoomButton.MouseButton1Click:Connect(function()
	zoomed = not zoomed
	local size = if zoomed then ZOOMED_SIZE else WINDOW_SIZE
	tween(holder, { Size = UDim2.fromOffset(size.X, size.Y) }, SMOOTH)
	fitToScreen(size)
end)

search:GetPropertyChangedSignal("Text"):Connect(applyFilter)
search.Focused:Connect(function()
	tween(searchStroke, { Color = THEME.accent, Transparency = 0.2 })
end)
search.FocusLost:Connect(function()
	tween(searchStroke, { Color = THEME.white, Transparency = 0.9 })
end)
clearButton.MouseButton1Click:Connect(function()
	search.Text = ""
end)
refreshButton.MouseButton1Click:Connect(refresh)
retryButton.MouseButton1Click:Connect(refresh)

gui.Parent = parent
fitToScreen()
refresh()
