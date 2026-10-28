-- Visuals.lua
-- Stand-in for Haxter Felix's deleted "Legal Reasons.lua" gist (the Visuals tab module).
--
-- The hub loadstrings this, calls it, and keeps the returned table as S. Every Visuals control is
-- built as Visuals:CreateX(label, ..., S.vNNN(ctx)): the factory gets whatever the hub hands over in
-- ctx and returns the control's callback. Toggles get (state), sliders a number, dropdowns the
-- picked option. Callbacks run through fireUserCallback, which skips a call while the previous one
-- is still running, so every callback returns straight away and loops live in task.spawn.
--
--   v001-v005  The Rake: values panel, Scrap / Rake / FlareGun / SupplyDrop ESP
--   v006-v007  player distance visibility (drives the hub's HaxterPlayerDistanceVisibilityState)
--   v009-v015  player ESP icons / custom interaction settings
--   v016-v020  player hitbox expander settings (playerHitboxState)
--   v021-v023  player chams
--
-- loadstring chunks share the hub's global environment, so hub globals (setPlayerChamsEnabled,
-- playerHitboxState, ...) are read from there, with getgenv() as a fallback.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local genv = type(getgenv) == "function" and getgenv() or _G
local scope = type(getfenv) == "function" and getfenv(1) or _G

local function hubGlobal(name)
	local ok, value = pcall(function()
		return scope[name]
	end)
	if not ok or value == nil then
		value = genv[name]
	end
	return value
end

local function setHubGlobal(name, value)
	pcall(function()
		scope[name] = value
	end)
end

-- Calls a hub function by name if it exists. Returns pcall's results; never throws.
local function callHub(name, ...)
	local fn = hubGlobal(name)
	if type(fn) == "function" then
		return pcall(fn, ...)
	end
	return false
end

-- Dropdowns hand over a string, or a table on multi-select builds.
local function optionValue(value)
	if type(value) == "table" then
		value = value.Value or value[1] or next(value)
	end
	return tostring(value or "")
end

local function numberValue(value, default, min, max)
	return math.clamp(tonumber(value) or default, min, max)
end

local function readValue(object)
	if typeof(object) ~= "Instance" then
		return nil
	end
	local ok, value = pcall(function()
		return (object :: any).Value
	end)
	if ok then
		return value
	end
	return nil
end

local function find(root, ...)
	local node = root
	for _, name in ipairs({ ... }) do
		node = node and node:FindFirstChild(name)
	end
	return node
end

local function anyPart(object)
	if not object then
		return nil
	end
	if object:IsA("BasePart") then
		return object
	end
	if object:IsA("Model") and object.PrimaryPart then
		return object.PrimaryPart
	end
	return object:FindFirstChildWhichIsA("BasePart", true)
end

local function distanceTo(part, player)
	player = player or Players.LocalPlayer
	local character = player and player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	local camera = workspace.CurrentCamera
	local origin = if root then root.Position elseif camera then camera.CFrame.Position else nil
	if not (origin and part) then
		return nil
	end
	return math.floor((part.Position - origin).Magnitude + 0.5)
end

local function withDistance(text, part, player)
	local distance = distanceTo(part, player)
	if distance then
		return text .. " [" .. distance .. "]"
	end
	return text
end

local function accentColor()
	local ok, color = callHub("getThemeAccentColor")
	if ok and typeof(color) == "Color3" then
		return color
	end
	return Color3.fromRGB(150, 90, 255)
end

local function guiRoot()
	local ok, root = pcall(function()
		return if type(gethui) == "function" then gethui() else CoreGui
	end)
	if ok and root then
		return root
	end
	local player = Players.LocalPlayer
	return player and player:FindFirstChildOfClass("PlayerGui")
end

-- Everything this module builds registers a stop function here, so a re-execute of the hub (which
-- calls getgenv().HaxterVisualsCleanup) tears it all down.
local active = {}

local function stopAll()
	for key, stop in pairs(active) do
		active[key] = nil
		pcall(stop)
	end
end

if type(genv.HaxterVisualsCleanup) == "function" then
	pcall(genv.HaxterVisualsCleanup)
end
genv.HaxterVisualsCleanup = stopAll

-- Puts a GUI object on screen: inside the hub's own ScreenGui when the hub gave us its
-- haxterParentToHub helper, else in a ScreenGui of our own. Returns that ScreenGui to destroy later.
local function mountGui(instance, parentToHub)
	if type(parentToHub) == "function" and pcall(parentToHub, instance) and instance.Parent then
		return nil
	end
	local holder = Instance.new("ScreenGui")
	holder.Name = "HaxterVisuals"
	holder.ResetOnSpawn = false
	holder.IgnoreGuiInset = true
	holder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	instance.Parent = holder
	holder.Parent = guiRoot()
	return holder
end

local function newLabel(name, color)
	local billboard = Instance.new("BillboardGui")
	billboard.Name = name
	billboard.AlwaysOnTop = true
	billboard.LightInfluence = 0
	billboard.Size = UDim2.fromOffset(180, 34)
	billboard.StudsOffset = Vector3.new(0, 2.8, 0)
	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UDim2.fromScale(1, 1)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 13
	label.TextStrokeTransparency = 0.25
	label.TextColor3 = color
	label.Parent = billboard
	return billboard, label
end

-- A toggle that keeps a Highlight and a name/distance label on every object options.scan() returns.
-- scan() gives a list of { object = Instance, part = BasePart for the label, text = string }; objects
-- that drop out of the scan (picked up, despawned) lose their ESP on the next pass.
local function objectEsp(key, options)
	local generation = 0
	local entries = {}

	local function remove(object)
		local entry = entries[object]
		entries[object] = nil
		if entry then
			pcall(function()
				entry.highlight:Destroy()
			end)
			pcall(function()
				entry.billboard:Destroy()
			end)
		end
	end

	local function create(object, part)
		local highlight = Instance.new("Highlight")
		highlight.Name = options.name
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.FillColor = options.color
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.FillTransparency = 0.6
		highlight.OutlineTransparency = 0.1
		highlight.Adornee = if object:IsA("Model") or object:IsA("BasePart") then object else part

		local billboard, label = newLabel(options.name .. "Label", options.color)
		billboard.Adornee = part

		-- Hub-owned when the hub offers it, so nothing gets added to the game's own instances.
		local parentToHub = options.parentToHub
		local inHub = type(parentToHub) == "function" and pcall(parentToHub, highlight) and pcall(parentToHub, billboard)
		if not inHub then
			highlight.Parent = highlight.Adornee
			billboard.Parent = part
		end
		return { highlight = highlight, billboard = billboard, label = label }
	end

	local function step()
		local ok, found = pcall(options.scan)
		local seen = {}
		if ok and type(found) == "table" then
			for _, item in ipairs(found) do
				local object, part = item.object, item.part
				if object and part and part.Parent then
					seen[object] = true
					local entry = entries[object]
					if not (entry and entry.highlight.Parent and entry.billboard.Parent) then
						remove(object)
						local built, made = pcall(create, object, part)
						entry = if built then made else nil
						entries[object] = entry
					end
					if entry then
						entry.billboard.Adornee = part
						entry.label.Text = item.text or options.name
					end
				end
			end
		end
		for object in pairs(entries) do
			if not seen[object] then
				remove(object)
			end
		end
	end

	local function stop()
		generation += 1
		for object in pairs(entries) do
			remove(object)
		end
		if active[key] == stop then
			active[key] = nil
		end
	end

	return function(state)
		if state ~= true then
			stop()
			return
		end
		generation += 1
		local mine = generation
		active[key] = stop
		task.spawn(function()
			while generation == mine do
				step()
				task.wait(options.interval or 0.25)
			end
		end)
	end
end

local function makeDraggable(frame)
	local dragging, start, origin = false, nil, nil
	local connections = {}
	local function isPress(input)
		return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
	end
	connections[#connections + 1] = frame.InputBegan:Connect(function(input)
		if isPress(input) then
			dragging, start, origin = true, input.Position, frame.Position
		end
	end)
	connections[#connections + 1] = UserInputService.InputChanged:Connect(function(input)
		local moved = input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
		if dragging and moved then
			local delta = input.Position - start
			frame.Position = UDim2.new(origin.X.Scale, origin.X.Offset + delta.X, origin.Y.Scale, origin.Y.Offset + delta.Y)
		end
	end)
	connections[#connections + 1] = UserInputService.InputEnded:Connect(function(input)
		if isPress(input) then
			dragging = false
		end
	end)
	return connections
end

-- The Rake ---------------------------------------------------------------------------------------

local function findRake()
	local rake = workspace:FindFirstChild("Rake")
	local part = rake and (rake:FindFirstChild("Head") or rake:FindFirstChild("HumanoidRootPart") or anyPart(rake))
	if not part then
		return nil
	end
	local humanoid = rake:FindFirstChildOfClass("Humanoid")
	local bloodHour = rake:FindFirstChild("BloodHourMode")
	return {
		model = rake,
		part = part,
		health = humanoid and humanoid.Health,
		maxHealth = humanoid and humanoid.MaxHealth,
		bloodHour = bloodHour ~= nil and readValue(bloodHour) == true,
	}
end

local function formatClock(seconds)
	seconds = math.max(math.floor(tonumber(seconds) or 0), 0)
	return string.format("%d:%02d", seconds // 60, seconds % 60)
end

local function rakeValuesPanel(ctx)
	local generation = 0
	local frame, holder, connections = nil, nil, {}

	local function stop()
		generation += 1
		for _, connection in ipairs(connections) do
			pcall(function()
				connection:Disconnect()
			end)
		end
		connections = {}
		if frame then
			pcall(function()
				frame:Destroy()
			end)
			frame = nil
		end
		if holder then
			pcall(function()
				holder:Destroy()
			end)
			holder = nil
		end
		if active.RakeValues == stop then
			active.RakeValues = nil
		end
	end

	local function build()
		local accent = accentColor()
		frame = Instance.new("Frame")
		frame.Name = "HaxterRakeValues"
		frame.Position = UDim2.fromOffset(16, 80)
		frame.Size = UDim2.fromOffset(220, 0)
		frame.AutomaticSize = Enum.AutomaticSize.Y
		frame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
		frame.BackgroundTransparency = 0.2
		frame.BorderSizePixel = 0
		frame.Active = true
		Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
		local stroke = Instance.new("UIStroke", frame)
		stroke.Color = accent
		stroke.Transparency = 0.35
		local padding = Instance.new("UIPadding", frame)
		padding.PaddingTop = UDim.new(0, 8)
		padding.PaddingBottom = UDim.new(0, 8)
		padding.PaddingLeft = UDim.new(0, 10)
		padding.PaddingRight = UDim.new(0, 10)
		local layout = Instance.new("UIListLayout", frame)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Padding = UDim.new(0, 2)

		local rows = {}
		local function row(name, order, bold)
			local label = Instance.new("TextLabel")
			label.Name = name
			label.LayoutOrder = order
			label.BackgroundTransparency = 1
			label.Size = UDim2.new(1, 0, 0, if bold then 18 else 16)
			label.Font = if bold then Enum.Font.GothamBold else Enum.Font.Gotham
			label.TextSize = if bold then 14 else 13
			label.TextColor3 = if bold then accent else Color3.fromRGB(235, 235, 240)
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.TextStrokeTransparency = 0.6
			label.Parent = frame
			rows[name] = label
			return label
		end
		row("Title", 0, true).Text = "The Rake"
		row("Power", 1)
		row("Timer", 2)
		row("Rake", 3)
		row("Items", 4)

		holder = mountGui(frame, ctx.haxterParentToHub)
		connections = makeDraggable(frame)
		return rows
	end

	local function update(rows)
		local power = readValue(ctx.PowerValue or find(ReplicatedStorage, "PowerValues", "PowerLevel"))
		rows.Power.Text = "Power: " .. (if power ~= nil then tostring(math.floor(tonumber(power) or 0)) else "?")

		local timer = readValue(ctx.TimerValue or ReplicatedStorage:FindFirstChild("Timer"))
		local night = ReplicatedStorage:FindFirstChild("Night")
		local phase = if night then (if readValue(night) == true then " (night)" else " (day)") else ""
		rows.Timer.Text = "Timer: " .. (if timer ~= nil then formatClock(timer) else "?") .. phase

		local rake = findRake()
		if rake then
			local text = withDistance("Rake:", rake.part)
			if rake.health then
				text ..= string.format("  HP %d/%d", math.floor(rake.health), math.floor(rake.maxHealth or rake.health))
			end
			if rake.bloodHour then
				text ..= "  BLOOD HOUR"
			end
			rows.Rake.Text = text
			rows.Rake.TextColor3 = if rake.bloodHour then Color3.fromRGB(255, 70, 70) else Color3.fromRGB(235, 235, 240)
		else
			rows.Rake.Text = "Rake: not spawned"
			rows.Rake.TextColor3 = Color3.fromRGB(235, 235, 240)
		end

		local crates = find(workspace, "Debris", "SupplyCrates")
		local flareGun = find(workspace, "FlareGunPickUp", "FlareGun")
		rows.Items.Text = string.format(
			"Supply drops: %d   Flare gun: %s",
			crates and #crates:GetChildren() or 0,
			if flareGun then "on map" else "none"
		)
	end

	return function(state)
		stop()
		if state ~= true then
			return
		end
		local ok, rows = pcall(build)
		if not ok then
			stop()
			return
		end
		local mine = generation
		active.RakeValues = stop
		task.spawn(function()
			while generation == mine and frame and frame.Parent do
				pcall(update, rows)
				task.wait(0.25)
			end
		end)
	end
end

-- Player ESP / interaction helpers ----------------------------------------------------------------

local function chamsShowing()
	return genv.PlayerChamss == true and genv.HaxterPlayerChamsMode ~= "Realistic"
end

local function refreshChams()
	for _, player in ipairs(Players:GetPlayers()) do
		callHub("ApplyChams", player)
	end
end

local function updateHitbox(field, value)
	local state = hubGlobal("playerHitboxState")
	if type(state) ~= "table" then
		return
	end
	state[field] = value
	if state.enabled then
		callHub("refreshAllPlayerHitboxes")
	end
end

-- Factories -------------------------------------------------------------------------------------

local Visuals = {}

-- "Game Values/Timer & more" (The Rake)
Visuals.v001 = rakeValuesPanel

-- "Scrap Esp" (The Rake)
function Visuals.v002(_ctx)
	return objectEsp("RakeScrap", {
		name = "HaxterScrapESP",
		color = Color3.fromRGB(255, 205, 70),
		interval = 0.5,
		scan = function()
			local found = {}
			local spawns = find(workspace, "Filter", "ScrapSpawns")
			for _, spawnPoint in ipairs(spawns and spawns:GetChildren() or {}) do
				for _, item in ipairs(spawnPoint:GetChildren()) do
					if item.Name:match("Scrap") then
						local part = item:FindFirstChild("Scrap")
						if not (part and part:IsA("BasePart")) then
							part = anyPart(item)
						end
						if part then
							found[#found + 1] = { object = item, part = part, text = withDistance("Scrap", part) }
						end
					end
				end
			end
			return found
		end,
	})
end

-- "The Rake Esp"
function Visuals.v003(ctx)
	return objectEsp("RakeMonster", {
		name = "HaxterRakeESP",
		color = Color3.fromRGB(255, 60, 60),
		parentToHub = ctx.haxterParentToHub,
		scan = function()
			local rake = findRake()
			if not rake then
				return {}
			end
			local text = withDistance("The Rake", rake.part)
			if rake.health then
				text ..= "\nHP " .. math.floor(rake.health)
			end
			if rake.bloodHour then
				text ..= " | BLOOD HOUR"
			end
			return { { object = rake.model, part = rake.part, text = text } }
		end,
	})
end

-- "FlareGun Esp" (The Rake)
function Visuals.v004(_ctx)
	return objectEsp("RakeFlareGun", {
		name = "HaxterFlareGunESP",
		color = Color3.fromRGB(255, 130, 40),
		scan = function()
			local flareGun = find(workspace, "FlareGunPickUp", "FlareGun")
			local part = flareGun and (flareGun:FindFirstChild("GlowPart") or anyPart(flareGun))
			if not (part and part:IsA("BasePart")) then
				return {}
			end
			return { { object = flareGun, part = part, text = withDistance("Flare Gun", part) } }
		end,
	})
end

-- "SupplyDrop ESP" (The Rake)
function Visuals.v005(ctx)
	return objectEsp("RakeSupplyDrop", {
		name = "HaxterSupplyDropESP",
		color = Color3.fromRGB(80, 200, 255),
		interval = 0.4,
		scan = function()
			local found = {}
			local crates = find(workspace, "Debris", "SupplyCrates")
			for _, crate in ipairs(crates and crates:GetChildren() or {}) do
				local part = anyPart(crate)
				if part then
					local text = withDistance("Supply Drop", part, ctx.localPlayer)
					local unlock = tonumber(readValue(crate:FindFirstChild("UnlockValue")))
					if unlock then
						text ..= if unlock >= 100 then "\nUnlocked" else string.format("\nUnlock %d%%", math.floor(unlock))
					end
					found[#found + 1] = { object = crate, part = part, text = text }
				end
			end
			return found
		end,
	})
end

-- "Player Visiblitly Distance" slider: how far away players get hidden.
function Visuals.v006(ctx)
	local state = ctx.state
	return function(value)
		if type(state) ~= "table" then
			return
		end
		state.threshold = numberValue(value, 40, 0, 200)
		if state.enabled then
			pcall(state.Update, state)
		end
	end
end

-- "Enable Player Distance Visiblitly": setting state.enabled starts/stops the hub's own update loop.
function Visuals.v007(ctx)
	local state = ctx.state
	return function(enabled)
		if type(state) ~= "table" then
			return
		end
		enabled = enabled == true
		if enabled then
			state.running = true
		end
		state.enabled = enabled
		if enabled then
			pcall(state.Update, state)
			return
		end
		pcall(state.RestoreAll, state)
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer then
				pcall(state.SetPlayerIconRootAnchor, state, player, false)
			end
		end
	end
end

-- "Experience Chat Method": Icon (ESP icons with chat bubbles) or Mic (quick mic buttons).
function Visuals.v009(ctx)
	local environment = ctx.experienceChatEnvironment or genv
	return function(value)
		environment.HaxterExperienceChatMethod = if optionValue(value) == "Mic" then "Mic" else "Icon"
		callHub("HaxterApplyExperienceChatMode")
	end
end

-- "Custom Interaction": turns the whole icon / bubble / quick-mic layer on or off.
function Visuals.v010(_ctx)
	return function(enabled)
		genv.HaxterCustomInteractionEnabled = enabled == true
		callHub("HaxterApplyExperienceChatMode")
	end
end

-- "Player ESP Icon Distance"
function Visuals.v011(_ctx)
	return function(value)
		genv.PlayerESPIconMaxDistance = numberValue(value, 1000, 0, 2500)
	end
end

-- "Player ESP Voice Glare": glow around a player's icon while they talk.
function Visuals.v012(_ctx)
	return function(enabled)
		genv.PlayerESPVoiceGlare = enabled == true
		if enabled ~= true then
			callHub("haxterClearPlayerEspVoiceGlareRuntime")
		end
	end
end

-- "Player ESP Icon Lines": lines from each icon down to its player.
function Visuals.v013(_ctx)
	return function(enabled)
		genv.PlayerESPIconLines = enabled == true
		if enabled ~= true then
			callHub("haxterClearPlayerEspIconLines")
		end
	end
end

-- "Player ESP Reaction Time" (ms)
function Visuals.v014(_ctx)
	return function(value)
		genv.PlayerESPIconReactionTimeMs = numberValue(value, 25, 0, 35)
	end
end

-- "Player ESP Method": Purple, or each player's team colour. Chams follow it too.
function Visuals.v015(_ctx)
	return function(value)
		setHubGlobal("playerEspIconMethod", if optionValue(value) == "Team" then "Team" else "Purple")
		if chamsShowing() then
			refreshChams()
		end
	end
end

-- "Player Hitbox Expander"
function Visuals.v016(_ctx)
	return function(enabled)
		callHub("setPlayerHitboxEnabled", enabled == true)
	end
end

-- "Hitbox Team Check"
function Visuals.v017(_ctx)
	return function(enabled)
		updateHitbox("teamCheck", enabled == true)
	end
end

-- "Hitbox Size" (studs)
function Visuals.v018(_ctx)
	return function(value)
		updateHitbox("size", numberValue(value, 6, 2, 13))
	end
end

-- "Hitbox Type"
function Visuals.v019(_ctx)
	return function(value)
		local shape = optionValue(value)
		if shape == "Sphere" or shape == "Squared" or shape == "Cylinder" then
			updateHitbox("shape", shape)
		end
	end
end

-- "Hitbox Transparency" (slider 0-10)
function Visuals.v020(_ctx)
	return function(value)
		updateHitbox("transparency", numberValue(value, 4, 0, 10) / 10)
	end
end

-- "Player Chams"
function Visuals.v021(_ctx)
	return function(enabled)
		callHub("setPlayerChamsEnabled", enabled == true)
	end
end

-- "Player Chams Type": Highlight or Realistic. Restarts chams in the new mode if they're on.
function Visuals.v022(_ctx)
	return function(value)
		local mode = if optionValue(value) == "Realistic" then "Realistic" else "Highlight"
		local changed = genv.HaxterPlayerChamsMode ~= mode
		genv.HaxterPlayerChamsMode = mode
		if changed and genv.PlayerChamss == true then
			callHub("setPlayerChamsEnabled", true)
		end
	end
end

-- "Chams Transparency" (slider 0-10)
function Visuals.v023(_ctx)
	return function(value)
		setHubGlobal("playerChamsFillTransparency", numberValue(value, 9, 0, 10) / 10)
		if chamsShowing() then
			refreshChams()
		end
	end
end

-- Any control a newer hub build adds gets a harmless callback instead of an error.
return setmetatable(Visuals, {
	__index = function()
		return function()
			return function() end
		end
	end,
})
