-- Deobfuscated by --@Zuarpdo

do
	local genv = getgenv

	if genv then
		genv = getgenv()
	end

	if (genv or _G).__SEAHUB_DISABLE_AUTOSTART ~= true then
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end

		while not game:GetService("Players").LocalPlayer do
			task.wait(0.1)
		end
	end
end

local n = 237796665
local n2 = 331165984
local n3 = 133861413

local tbl = {
	Version = "20261010-42",
	Provenance = {
		Project = "SeaHub",
		Reference = "Arya",
		AryaSnapshot = "devirtualizer_attempt/luraph_v15_2026-09-28_sea2_electro/arya_latest_stage6.deob.lua",
		AryaSha256 = "7E96E6BC974E3300DC032F55AE0E80B8B31DA62C1727095A1A32997AF2E0CA60",
	},
	Game = {
		Name = "Blox Fruits",
		QuestTask = "Auto Farm Level",
		EnemyFolder = "Enemies",
		RemoteFolder = "Remotes",
		MainRemote = "CommF_",
		BlockedSea2Action = "TravelDressrosa",
		StatAction = "AddPoint",
		ServerBrowser = "__ServerBrowser",
	},
	FarmStatus = {
		WaitingMob = "waiting mob",
		AttackingMob = "attacking mob",
		QuestProgress = "quest-progress",
		QuestRestarted = "quest-restarted",
		QuestTargetChanged = "quest-target-changed",
		QuestTargetMissing = "quest-target-missing",
		QuestUnavailable = "quest-unavailable",
		TargetAppeared = "target-appeared",
		TargetCountDecreased = "target-count-decreased",
		TargetHealthDecreased = "target-health-decreased",
		AttackStarted = "attack-started",
		UnmanagedTask = "unmanaged-task",
		NoRecoveryServer = "no-recovery-server",
	},
	UiNames = {
		Legacy = "SeaHubLegacyUI",
		ScreenGui = "SeaHubUI",
		SeaHubHud = "SeaHubHud",
		VisibilityToggle = "VisibilityToggle",
		BlackScreen = "SeaHubBlackScreen",
	},
	Interface = { BlackScreen = false, DisplayOrder = 1000 },
	Performance = { FPS = 15 },
	BossApi = { Endpoint = "" },
	Globals = {
		ApprovedRequest = "__SEAHUB_APPROVED_REQUEST",
		CoreFunctionsReady = "__SEAHUB_CORE_FUNCTIONS_READY",
		FarmWatchdog = "__SEAHUB_FARM_WATCHDOG",
		HttpFacade = "__SEAHUB_H",
		HookSentinelActive = "__SEAHUB_HOOK_SENTINEL_ACTIVE",
		LiveTimeStartedAt = "__SEAHUB_LIVE_STARTED_AT",
		NetworkBlocked = "__SEAHUB_NETWORK_BLOCKED",
		SpyDetected = "__SEAHUB_SPY_DETECTED",
		StatAllocationGuard = "__SEAHUB_STAT_ALLOCATION_GUARD",
		WhitelistPassed = "__SEAHUB_WHITELIST_PASSED",
	},
	Errors = {
		UnauthorizedHttpHook = "SEAHUB_UNAUTHORIZED_HTTP_HOOK",
		UnauthorizedNamecallHook = "SEAHUB_UNAUTHORIZED_NAMECALL_HOOK",
		UnauthorizedOtherHttpHook = "SEAHUB_UNAUTHORIZED_OTH_HTTP_HOOK",
		Poly1305UnalignedInput = "SEAHUB_POLY1305_UNALIGNED_INPUT",
	},
	ExecutorHttpAliases = {
		"request",
		"http_request",
		"syn.request",
		"fluxus.request",
		"http.request",
		"krnl.request",
		"secure_request",
	},
	Colors = {
		White = "#FFFFFF",
		Label = "#AAB6AD",
		Level = "#72E69A",
		Status = "#53D984",
		Time = "#D8C98B",
	},
}

local n4 = 285653666
local tbl2

do
	local Players = game:GetService("Players")

	local tbl3 = {
		Background = Color3.fromRGB(18, 24, 20),
		Border = Color3.fromRGB(48, 68, 55),
		Divider = Color3.fromRGB(42, 52, 45),
		Green = Color3.fromRGB(72, 214, 126),
		GreenSoft = Color3.fromRGB(142, 226, 168),
		Text = Color3.fromRGB(244, 247, 245),
		Muted = Color3.fromRGB(166, 177, 169),
		Turtle = Color3.fromRGB(187, 207, 83),
		OwnedBackground = Color3.fromRGB(25, 65, 41),
	}

	local tbl4 = {
		{ Name = "Death Step", Label = "Death Step" },
		{ Name = "Sharkman Karate", Label = "Sharkman" },
		{ Name = "Electric Claw", Label = "E. Claw" },
		{ Name = "Dragon Talon", Label = "D. Talon" },
	}

	local function getGenv()
		local genv = getgenv

		if genv then
			genv = getgenv()
		end

		return genv or _G
	end

	local function getNow()
		local genv = getGenv()
		local now = os.time()
		local liveTimeStartedAt = tbl.Globals.LiveTimeStartedAt or "__SEAHUB_LIVE_STARTED_AT"
		local now2 = tonumber(rawget(genv, liveTimeStartedAt))

		if now2 then
			if now2 <= 0 then
				now2 = now
				rawset(genv, liveTimeStartedAt, now2)
			elseif now + 300 < now2 then
				now2 = now
				rawset(genv, liveTimeStartedAt, now2)
			end
		else
			now2 = now
			rawset(genv, liveTimeStartedAt, now2)
		end

		return math.floor(now2)
	end

	local function fn(elapsed)
		local n5 = math.max(0, math.floor(tonumber(elapsed) or 0))
		return string.format("%02d:%02d:%02d", math.floor(n5 / 3600), math.floor(n5 % 3600 / 60), n5 % 60)
	end

	local function fn2(parent, arg)
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, arg)
		uiCorner.Parent = parent
	end

	local function fn3(parent, color, thickness)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Color = color
		uiStroke.Thickness = thickness
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Parent = parent
	end

	local function createTextLabel(parent, name, text, position, size, textSize, textColor3)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = name
		textLabel.Position = position
		textLabel.Size = size
		textLabel.BackgroundTransparency = 1
		textLabel.BorderSizePixel = 0
		textLabel.Font = Enum.Font.GothamBold
		textLabel.Text = text
		textLabel.TextSize = textSize
		textLabel.TextColor3 = textColor3
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextYAlignment = Enum.TextYAlignment.Center
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.Parent = parent
		return textLabel
	end

	local function fn4(seaHub, seaHub2)
		local matches = {}
		local v = tostring
		local seaHub3 = seaHub or ""

		for match in v(seaHub3):gmatch("[^|]+") do
			local match2 = match:match("^%s*(.-)%s*$")

			if match2 ~= "" then
				table.insert(matches, match2)
			end
		end

		local match = matches[1]

		if not match then
			match = seaHub2

			if match then
				match = seaHub2.lastTaskName
			end
		end

		match = match or "Waiting"

		if match == "Auto Farm Level" then
			match = "Level Farming"
		end

		local flag = #matches > 1

		if flag then
			flag = table.concat(matches, " | ", 2)
		end

		flag = flag or "n/o"
		return match, flag
	end

	local function fn5(seaHub)
		if type(seaHub) ~= "table" then
			return nil, nil
		end
		local farmClusterName = seaHub.farmClusterName
		local n5, num, n6, questData, exitTo, n7
		local v

		if farmClusterName then
			if type(farmClusterName) ~= "string" then
				return nil, nil
			end

			if farmClusterName == "" then
				return nil, nil
			end
			n5 = 54258941
			num = nil

			if farmClusterName == seaHub.levelRouteMob then
				num = tonumber(seaHub.levelRouteQuestLevel)
			end

			n6 = 1053373514

			if not num then
				questData = seaHub.questData or {}
				exitTo = nil

				for _, v2 in questData do
					v = v2
					if v2.mob_name == farmClusterName then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					num = tonumber(v.level_req)
				end
			end

			n7 = 279200367
			return farmClusterName, num
		end

		local currentFarmMobName = seaHub.currentFarmMobName

		if currentFarmMobName then
			if type(currentFarmMobName) ~= "string" then
				return nil, nil
			end

			if currentFarmMobName == "" then
				return nil, nil
			end
			n5 = 54258941
			num = nil

			if currentFarmMobName == seaHub.levelRouteMob then
				num = tonumber(seaHub.levelRouteQuestLevel)
			end

			n6 = 1053373514

			if not num then
				questData = seaHub.questData or {}
				exitTo = nil

				for _, v2 in questData do
					v = v2
					if v2.mob_name == currentFarmMobName then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					num = tonumber(v.level_req)
				end
			end

			n7 = 279200367
			return currentFarmMobName, num
		else
			currentFarmMobName = seaHub.levelRouteMob
			if type(currentFarmMobName) ~= "string" then
				return nil, nil
			end

			if currentFarmMobName == "" then
				return nil, nil
			end
			n5 = 54258941
			num = nil

			if currentFarmMobName == seaHub.levelRouteMob then
				num = tonumber(seaHub.levelRouteQuestLevel)
			end

			n6 = 1053373514

			if not num then
				questData = seaHub.questData or {}
				exitTo = nil

				for _, v2 in questData do
					v = v2
					if v2.mob_name == currentFarmMobName then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					num = tonumber(v.level_req)
				end
			end

			n7 = 279200367
			return currentFarmMobName, num
		end
	end

	local function fn6(arg, seaHub)
		if arg ~= "Level Farming" then
			return arg
		end
		local v, v2 = fn5(seaHub)

		if v then
			if v2 then
				return string.format("%s | %s [Lv. %d]", arg, v, v2)
			end
			return string.format("%s | %s", arg, v)
		end

		return arg
	end

	local function getName(tool)
		if not tool then
			return nil
		end

		if not tool:IsA("Tool") then
			return nil
		end
		local attribute = tool:GetAttribute("WeaponType")

		if type(attribute) == "string" then
			if attribute == "" then
				attribute = tool.ToolTip
			end
		else
			attribute = tool.ToolTip
		end

		local name = attribute == "Melee"

		if name then
			name = tool.Name
		end

		return name or nil
	end

	local function fn7(player)
		local player2 = player

		if player2 then
			player2 = player.Character
		end

		local player3 = player2

		if player3 then
			player3 = player2:GetChildren()
		end

		player3 = player3 or {}

		for _, instance in player3 do
			local name = getName(instance)

			if name then
				local level = instance:FindFirstChild("Level")
				local level2 = level

				if level2 then
					level2 = tonumber(level.Value)
				end

				return name, level2 or tonumber(instance:GetAttribute("Mastery")) or 0
			end
		end

		return nil, 0
	end

	local function fn8(player, name)
		local tbl5 = {}
		local player2 = player

		if player2 then
			player2 = player.Character
		end

		local player3 = player

		if player3 then
			player3 = player:FindFirstChildOfClass("Backpack")
		end

		tbl5[1] = player2
		tbl5[2] = player3

		for _, instance in tbl5 do
			local instance2 = instance

			if instance2 then
				instance2 = instance:FindFirstChild(name)
			end

			if getName(instance2) then
				return true
			end
			continue
		end

		return false
	end

	local function fn9(seaHub, localPlayer, name)
		if seaHub then
			local functions = seaHub.Functions

			if functions then
				if type(functions.Owns) == "function" then
					local ok, result = pcall(functions.Owns, "Moveset", name)

					if ok then
						if result == true then
							return true
						end
					end
				end
			end

			local meleeInventory = seaHub.MeleeInventory

			if meleeInventory then
				meleeInventory = seaHub.MeleeInventory.Melee
			end

			if meleeInventory then
				meleeInventory = seaHub.MeleeInventory.Melee[name]
			end

			if meleeInventory == true then
				return true
			end

			if type(meleeInventory) == "table" then
				if meleeInventory.Bought == true then
					return true
				end
			end

			local inventory = seaHub.Inventory

			if inventory then
				inventory = seaHub.Inventory.Moveset
			end

			if inventory then
				inventory = seaHub.Inventory.Moveset[name]
			end

			if inventory ~= true then
				if type(inventory) ~= "table" then
					return fn8(localPlayer, name)
				end
			end

			return true
		end

		return fn8(localPlayer, name)
	end

	tbl2 = {
		destroyOld = function(instance)
			if not instance then
				return
			end

			for _, name in ipairs({ tbl.UiNames.Legacy, tbl.UiNames.ScreenGui }) do
				local child = instance:FindFirstChild(name)

				if child then
					child:Destroy()
				end

				continue
			end
		end,
		install = function(arg)
			local localPlayer = Players.LocalPlayer

			if localPlayer then
				local playerGui = localPlayer:WaitForChild("PlayerGui")

				if arg then
					if arg ~= playerGui then
						tbl2.destroyOld(arg)
					end
				end

				tbl2.destroyOld(playerGui)
				local interface = tbl.Interface or {}
				local visible = interface.BlackScreen == true
				local screenGui = Instance.new("ScreenGui")
				screenGui.Name = tbl.UiNames.ScreenGui
				screenGui.ResetOnSpawn = false
				screenGui.IgnoreGuiInset = true
				screenGui.DisplayOrder = interface.DisplayOrder or 1000
				screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui.Parent = playerGui

				local frame = Instance.new("Frame")
				frame.Name = tbl.UiNames.BlackScreen or "SeaHubBlackScreen"
				frame.Position = UDim2.fromScale(0, 0)
				frame.Size = UDim2.fromScale(1, 1)
				frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				frame.BackgroundTransparency = 0
				frame.BorderSizePixel = 0
				frame.Active = true
				frame.Selectable = false
				frame.ZIndex = 1
				frame.Visible = visible
				frame.Parent = screenGui

				local seaHubRoot = Instance.new("Frame")
				seaHubRoot.Name = "SeaHubRoot"
				seaHubRoot.AnchorPoint = Vector2.new(0.5, 0.5)
				seaHubRoot.Position = UDim2.fromScale(0.5, 0.5)
				seaHubRoot.Size = UDim2.fromOffset(620, 220)
				seaHubRoot.BackgroundTransparency = 1
				seaHubRoot.ZIndex = 10
				seaHubRoot.Parent = screenGui

				local responsiveScale = Instance.new("UIScale")
				responsiveScale.Name = "ResponsiveScale"
				responsiveScale.Parent = seaHubRoot

				local taskPanel = Instance.new("Frame")
				taskPanel.Name = "TaskPanel"
				taskPanel.Size = UDim2.fromScale(1, 1)
				taskPanel.BackgroundColor3 = tbl3.Background
				taskPanel.BackgroundTransparency = 0.16
				taskPanel.BorderSizePixel = 0
				taskPanel.ClipsDescendants = true
				taskPanel.ZIndex = 10
				taskPanel.Parent = seaHubRoot
				fn2(taskPanel, 8)
				fn3(taskPanel, tbl3.Border, 1.5)
				local accent = Instance.new("Frame")
				accent.Name = "Accent"
				accent.Position = UDim2.fromOffset(0, 0)
				accent.Size = UDim2.new(0, 6, 1, 0)
				accent.BackgroundColor3 = tbl3.Green
				accent.BackgroundTransparency = 0.04
				accent.BorderSizePixel = 0
				accent.ZIndex = 11
				accent.Parent = taskPanel
				fn2(accent, 8)
				local brand = createTextLabel(taskPanel, "Brand", "SEAHUB", UDim2.fromOffset(24, 10), UDim2.fromOffset(106, 38), 20, tbl3.GreenSoft)
				brand.ZIndex = 11
				local level = createTextLabel(taskPanel, "Level", "LV --", UDim2.fromOffset(142, 10), UDim2.fromOffset(112, 38), 18, tbl3.Green)
				level.ZIndex = 11
				local currentMelee = createTextLabel(taskPanel, "CurrentMelee", "Melee --", UDim2.fromOffset(268, 10), UDim2.new(1, -314, 0, 38), 18, tbl3.Text)
				currentMelee.ZIndex = 11
				local activity = Instance.new("Frame")
				activity.Name = "Activity"
				activity.AnchorPoint = Vector2.new(1, 0.5)
				activity.Position = UDim2.new(1, -24, 0, 29)
				activity.Size = UDim2.fromOffset(10, 10)
				activity.BackgroundColor3 = tbl3.Green
				activity.BorderSizePixel = 0
				activity.ZIndex = 11
				activity.Parent = taskPanel
				fn2(activity, 10)
				local divider = Instance.new("Frame")
				divider.Name = "Divider"
				divider.Position = UDim2.fromOffset(24, 52)
				divider.Size = UDim2.new(1, -48, 0, 1)
				divider.BackgroundColor3 = tbl3.Divider
				divider.BorderSizePixel = 0
				divider.ZIndex = 11
				divider.Parent = taskPanel
				local mainTask = createTextLabel(taskPanel, "MainTask", "Waiting", UDim2.fromOffset(24, 58), UDim2.new(1, -48, 0, 34), 22, tbl3.Text)
				mainTask.ZIndex = 11
				local subTask = createTextLabel(taskPanel, "SubTask", "n/o", UDim2.fromOffset(24, 92), UDim2.new(1, -48, 0, 24), 16, tbl3.Muted)
				subTask.ZIndex = 11
				local v2Divider = Instance.new("Frame")
				v2Divider.Name = "V2Divider"
				v2Divider.Position = UDim2.fromOffset(24, 123)
				v2Divider.Size = UDim2.new(1, -48, 0, 1)
				v2Divider.BackgroundColor3 = tbl3.Divider
				v2Divider.BorderSizePixel = 0
				v2Divider.ZIndex = 11
				v2Divider.Parent = taskPanel
				createTextLabel(taskPanel, "V2Title", "V2", UDim2.fromOffset(24, 136), UDim2.fromOffset(36, 36), 16, tbl3.Green).ZIndex = 11
				local ownedV2Melees = Instance.new("Frame")
				ownedV2Melees.Name = "OwnedV2Melees"
				ownedV2Melees.Position = UDim2.fromOffset(72, 135)
				ownedV2Melees.Size = UDim2.new(1, -96, 0, 38)
				ownedV2Melees.BackgroundTransparency = 1
				ownedV2Melees.ZIndex = 11
				ownedV2Melees.Parent = taskPanel

				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.FillDirection = Enum.FillDirection.Horizontal
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
				uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				uiListLayout.Padding = UDim.new(0, 10)
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Parent = ownedV2Melees
				local tbl5 = {}

				for i, v in ipairs(tbl4) do
					local frame2 = Instance.new("Frame")
					frame2.Name = v.Name:gsub("%s+", "")
					frame2.Size = UDim2.fromOffset(119, 36)
					frame2.BackgroundColor3 = tbl3.OwnedBackground
					frame2.BackgroundTransparency = 0.28
					frame2.BorderSizePixel = 0
					frame2.LayoutOrder = i
					frame2.Visible = false
					frame2.ZIndex = 11
					frame2.Parent = ownedV2Melees
					fn2(frame2, 6)
					fn3(frame2, tbl3.Border, 1)
					local label = createTextLabel(frame2, "Label", v.Label, UDim2.fromOffset(8, 0), UDim2.new(1, -16, 1, 0), 14, tbl3.GreenSoft)
					label.TextXAlignment = Enum.TextXAlignment.Center
					label.ZIndex = 12
					tbl5[i] = frame2
				end

				local empty = createTextLabel(ownedV2Melees, "Empty", "None", UDim2.fromScale(0, 0), UDim2.fromOffset(84, 36), 14, tbl3.Muted)
				empty.LayoutOrder = #tbl4 + 1
				empty.ZIndex = 11

				local liveDivider = Instance.new("Frame")
				liveDivider.Name = "LiveDivider"
				liveDivider.Position = UDim2.fromOffset(24, 181)
				liveDivider.Size = UDim2.new(1, -48, 0, 1)
				liveDivider.BackgroundColor3 = tbl3.Divider
				liveDivider.BorderSizePixel = 0
				liveDivider.ZIndex = 11
				liveDivider.Parent = taskPanel
				local liveTime = createTextLabel(taskPanel, "LiveTime", "LIVE TIME  00:00:00", UDim2.fromOffset(24, 184), UDim2.new(1, -48, 0, 28), 15, tbl3.GreenSoft)
				liveTime.ZIndex = 11
				local seaHubOverlay = Instance.new("ImageButton")
				seaHubOverlay.Name = "SeaHubOverlay"
				seaHubOverlay.Active = true
				seaHubOverlay.AnchorPoint = Vector2.new(0, 0)
				seaHubOverlay.Position = UDim2.new(1, -66, 1, -148)
				seaHubOverlay.Size = UDim2.fromOffset(48, 48)
				seaHubOverlay.BackgroundColor3 = tbl3.Background
				seaHubOverlay.BackgroundTransparency = 0.18
				seaHubOverlay.BorderSizePixel = 0
				seaHubOverlay.AutoButtonColor = false
				seaHubOverlay.Image = "rbxassetid://91555154146294"
				seaHubOverlay.ImageColor3 = tbl3.Turtle
				seaHubOverlay.ScaleType = Enum.ScaleType.Fit
				seaHubOverlay.ZIndex = 220
				seaHubOverlay.Visible = not visible
				seaHubOverlay.Parent = screenGui
				fn2(seaHubOverlay, 999)
				fn3(seaHubOverlay, tbl3.Green, 1.25)
				local visible3 = true

				local function getSeaHub()
					local genv = getGenv()
					local seaHub = genv.SeaHub
					local seaHub2 = seaHub

					if seaHub2 then
						seaHub2 = seaHub.CleanContext
					end

					return seaHub2 or genv.__SEAHUB_CLEAN_CONTEXT
				end

				local function getSeaHub2()
					local seaHub = getSeaHub()
					local seaHub2 = seaHub

					if seaHub2 then
						seaHub2 = seaHub.State
					end

					return seaHub2
				end

				local function fn10(visible2)
					visible3 = visible2
					seaHubRoot.Visible = visible2
				end

				local function fn11(arg2)
					visible = arg2 == true
					frame.Visible = visible
					seaHubOverlay.Visible = not visible

					if visible then
						fn10(true)
					end
				end

				seaHubOverlay.MouseButton1Click:Connect(function()
					fn10(not visible3)
				end)

				local flag = true
				local currentCamera = nil
				local connection = nil

				local function fn12(connection2)
					if connection2 then
						pcall(connection2.Disconnect, connection2)
					end
				end

				local function fn13()
					if flag then
						if responsiveScale.Parent then
							local currentCamera2 = currentCamera

							if currentCamera2 then
								currentCamera2 = currentCamera.ViewportSize
							end

							currentCamera2 = currentCamera2 or Vector2.new(1280, 720)
							responsiveScale.Scale = math.clamp(math.min((currentCamera2.X - 32) / 620, (currentCamera2.Y - 32) / 220), 0.48, 1.1)
						end
					end
				end

				local function fn14()
					fn12(connection)
					connection = nil
					currentCamera = workspace.CurrentCamera

					if currentCamera then
						connection = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn13)
					end

					fn13()
				end

				fn14()
				local connection2 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(fn14)

				screenGui.Destroying:Connect(function()
					flag = false
					fn12(connection)
					fn12(connection2)
					connection = nil
					connection2 = nil
				end)

				task.spawn(function()
					local now = getNow()
					local text5 = nil
					local text6 = nil
					local seaHub3 = nil
					local seaHub4 = nil
					local text7 = nil
					local v = nil
					local text8 = nil

					while flag do
						if not screenGui.Parent then
							break
						end
						local wait = task.wait
						local visible2 = visible3

						if visible2 then
							visible2 = 0.75
						end

						wait(visible2 or 2)
						if not visible3 then
							continue
						end
						local seaHub = getSeaHub2()
						local seaHub2 = getSeaHub()
						local seaHub5 = seaHub

						if seaHub5 then
							seaHub5 = seaHub.status
						end

						local v2, text = fn4(seaHub5 or "Waiting", seaHub)
						local text2 = fn6(v2, seaHub)
						local seaHub6 = seaHub

						if seaHub6 then
							seaHub6 = not seaHub.paused
						end

						if seaHub6 then
							seaHub6 = not seaHub.stopped
						end

						seaHub6 = seaHub6 or false

						if text2 ~= text5 then
							mainTask.Text = text2
							text5 = text2
						end

						if text ~= text6 then
							subTask.Text = text
							text6 = text
						end

						if seaHub6 ~= seaHub3 then
							local seaHub7 = seaHub6

							if seaHub7 then
								seaHub7 = tbl3.Green
							end

							activity.BackgroundColor3 = seaHub7 or tbl3.Muted
							seaHub3 = seaHub6
						end

						local text3 = "LIVE TIME  " .. fn(os.time() - now)

						if text3 ~= text8 then
							liveTime.Text = text3
							text8 = text3
						end

						local data = localPlayer:FindFirstChild("Data")
						local seaHub7 = seaHub2

						if seaHub7 then
							seaHub7 = seaHub2.Level
						end

						if not seaHub7 then
							seaHub7 = data

							if seaHub7 then
								seaHub7 = data:FindFirstChild("Level")
							end
						end

						local seaHub8 = seaHub7

						if seaHub8 then
							seaHub8 = tonumber(seaHub7.Value)
						end

						seaHub8 = seaHub8 or 0

						if seaHub8 ~= seaHub4 then
							level.Text = "LV " .. tostring(seaHub8)
							seaHub4 = seaHub8
						end

						local v3, v4 = fn7(localPlayer)

						if v3 then
							local text4 = string.format("%s  |  Mastery %d", v3, v4)

							if text4 ~= text7 then
								currentMelee.Text = text4
								text7 = text4
							end
						elseif not text7 then
							currentMelee.Text = "Melee --"
						end

						local tbl6 = {}

						for i, v5 in ipairs(tbl4) do
							if fn9(seaHub2, localPlayer, v5.Name) then
								tbl6[#tbl6 + 1] = i
							end
						end

						local str = table.concat(tbl6, ",")
						if str == v then
							continue
						end
						local tbl7 = {}

						for _, v5 in ipairs(tbl6) do
							tbl7[v5] = true
						end

						for i, v5 in ipairs(tbl5) do
							v5.Visible = tbl7[i] == true
						end

						empty.Visible = #tbl6 == 0
						v = str
						continue
					end
				end)

				return {
					ScreenGui = screenGui,
					Root = seaHubRoot,
					TaskPanel = taskPanel,
					MainTaskLabel = mainTask,
					SubTaskLabel = subTask,
					LevelLabel = level,
					MeleeLabel = currentMelee,
					V2Bar = ownedV2Melees,
					V2Badges = tbl5,
					LiveTimeLabel = liveTime,
					VisibilityToggle = seaHubOverlay,
					BlackScreen = frame,
					SetBlackScreenEnabled = fn11,
					BrandLabel = brand,
				}
			end

			return nil
		end,
	}
end

tbl2.create = tbl2.install
local tbl3

do
	tbl3 = {
		Arya = {
			"Saber",
			"Tushita",
			"Yama",
			"UtillyItemsActivitation",
			"MeleeMaterials",
			"SpecialBossesTask",
			"RaidController",
			"ThirdSeaPuzzle",
			"Trevor",
			"ColosseumPuzzle",
			"Wenlocktoad",
			"SecondSeaPuzzle",
			"CollectDrops",
			"BossesTask",
			"ExpRedeem",
			"LevelFarm",
		},
		Priorities = {
			["Auto Saber"] = 160,
			["Auto Tushita"] = 150,
			["Auto Yama"] = 140,
			["Utility Items Activation"] = 130,
			["Melee Materials"] = 120,
			["Special Boss"] = 110,
			["Auto Raid"] = 100,
			["Auto Third Sea"] = 90,
			["Auto Trevor"] = 80,
			["Auto Bartilo Quest"] = 70,
			Wenlocktoad = 60,
			["Auto Second Sea"] = 50,
			["Get Fruits"] = 40,
			["Farm Boss"] = 30,
			["Exp Redeem"] = 20,
			["Auto Farm Level"] = 10,
		},
		copyPriorities = function()
			return table.clone(tbl3.Priorities)
		end,
		precedes = function(arg, arg2)
			return (tbl3.Priorities[arg] or -math.huge) > (tbl3.Priorities[arg2] or -math.huge)
		end,
	}
end

do
	local tbl4 = {
		prepare = function(arg, cacheCallback, arg2, arg3)
			if arg.cacheCallback ~= cacheCallback then
				table.clear(arg.Cache)
				arg.cacheCallback = cacheCallback
			end

			for k, v in arg.Cache do
				local n5 = arg2 - v.at

				if not (n5 < 0) then
					if not (arg3 < n5) then
						continue
					end
				end

				arg.Cache[k] = nil
			end
		end,
		put = function(arg, arg2, arg3, arg4)
			local count = 0
			local v = nil
			local at = math.huge

			for k, v2 in arg.Cache do
				count += 1

				if v2.at < at then
					at = v2.at
					v = k
				end
			end

			if arg.Cache[arg2] == nil then
				if arg.MaxCacheEntries <= count then
					if v then
						arg.Cache[v] = nil
					end
				end
			end

			arg.Cache[arg2] = { at = arg4, value = arg3 }
		end,
	}
end

local tbl4

do
	local function fn(arg)
		if type(arg) ~= "thread" then
			return
		end

		if arg == coroutine.running() then
			return
		end

		if coroutine.status(arg) ~= "dead" then
			if type(task.cancel) == "function" then
				pcall(task.cancel, arg)
			end
		end
	end

	tbl4 = {
		start = function(arg, arg2, delay, arg3, arg4)
			local state = arg.State
			state.boundedCalls = state.boundedCalls or {}
			state.boundedCallRetryAt = state.boundedCallRetryAt or {}
			local boundedCall = state.boundedCalls[arg2]
			if boundedCall then
				return boundedCall, false
			end

			if not state.stopped then
				if not (os.clock() < (state.boundedCallRetryAt[arg2] or 0)) then
					local runtimeGeneration = state.runtimeGeneration
					state.boundedCallSequence = (state.boundedCallSequence or 0) + 1
					local tbl5 = { done = false, deadline = os.clock() + delay, sequence = state.boundedCallSequence }
					state.boundedCalls[arg2] = tbl5

					local function fn2(arg5, arg6, arg7)
						if tbl5.done then
							return
						end
						tbl5.done = true
						local flag = state.boundedCalls[arg2] == tbl5

						if flag then
							flag = state.runtimeGeneration == runtimeGeneration
						end

						if flag then
							flag = not state.stopped
						end

						fn(tbl5.timer)

						if arg7 then
							if flag then
								state.boundedCallRetryAt[arg2] = os.clock() + 10
							end

							fn(tbl5.worker)
						end

						local flag2 = arg7

						if flag2 then
							flag2 = type(tbl5.worker) == "thread"
						end

						if flag2 then
							flag2 = coroutine.status(tbl5.worker) ~= "dead"
						end

						if state.boundedCalls[arg2] == tbl5 then
							if not flag2 then
								state.boundedCalls[arg2] = nil
							end
						end

						if flag then
							local ok, result = pcall(arg4, arg5, arg6, tbl5)
							local ok2 = arg5

							if ok2 then
								ok2 = ok
							end

							if ok2 then
								ok2 = result == true
							end

							tbl5.success = ok2

							if not ok then
								state.lastBoundedCallError = tostring(result)
							end
						end
					end

					tbl5.timer = task.delay(delay, function()
						fn2(false, "request-timeout", true)
					end)

					tbl5.worker = task.spawn(function()
						local ok, result = pcall(arg3)

						if tbl5.done then
							if state.boundedCalls then
								if state.boundedCalls[arg2] == tbl5 then
									state.boundedCalls[arg2] = nil
								end
							end

							return
						end

						fn2(ok, result, false)
					end)

					return tbl5, true
				end
			end

			return nil, false
		end,
		await = function(arg)
			if arg then
				while not arg.done do
					task.wait(0.05)
				end

				return arg.success == true
			end

			return false
		end,
		stop = function(arg)
			local state = arg.State
			local tbl5 = {}
			local boundedCalls = state.boundedCalls or {}
			local worker, kind, worker2
			local v

			for k, v2 in boundedCalls do
				v = v2
				v2.done = true
				fn(v2.timer)
				fn(v2.worker)
				worker = v2.worker
				kind = type(worker)

				if kind == "thread" then
					worker2 = v2.worker
					worker = coroutine.status(worker2)

					if worker ~= "dead" then
						tbl5[k] = v2
					end
				end
			end

			local boundedCalls2 = next(tbl5)

			if boundedCalls2 then
				boundedCalls2 = tbl5
			end

			state.boundedCalls = boundedCalls2 or nil
			state.boundedCallRetryAt = nil
		end,
	}
end

local tbl5

do
	local function fn(arg)
		local flag = type(arg) == "number"

		if flag then
			flag = arg == arg
		end

		if flag then
			flag = arg > -math.huge
		end

		if flag then
			flag = arg < math.huge
		end

		return flag
	end

	local function fn2(arg)
		if type(arg) ~= "number" then
			if type(arg) ~= "string" then
				return 0
			end
		end

		local num = tonumber(arg)
		local v = fn(num)

		if v then
			v = num
		end

		return v or 0
	end

	local function fn3(arg, arg2)
		return fn2(fn2(arg) + fn2(arg2))
	end

	local function fn4(arg, arg2)
		local value = rawget(arg, arg2)
		if type(value) ~= "table" then
			return 0
		end
		return fn3(rawget(value, "Melee"), rawget(value, "All"))
	end

	local function fn5(arg)
		if type(arg) ~= "table" then
			return false
		end
		local value = rawget(arg, "Name")
		local value2 = rawget(arg, "NetworkedUID")
		local value3 = rawget(arg, "Score")
		if type(value) ~= "string" then
			return false
		end

		if value == "" then
			return false
		end

		if type(value3) ~= "table" then
			return false
		end

		if value2 ~= nil then
			if type(value2) ~= "string" then
				if not fn(value2) then
					return false
				end
			end
		end

		for i = 1, 7 do
			if fn(rawget(value3, i)) then
				continue
			end
			return false
		end

		return true
	end

	local function fn6(arg, arg2)
		local value = rawget(arg, "Score")
		local value2 = rawget(arg2, "Score")

		for i = 1, 7 do
			local value3 = rawget(value, i)
			local value4 = rawget(value2, i)
			if value3 ~= value4 then
				return value3 > value4
			end
		end

		local flag = rawget(arg, "Equipped") == true
		if flag ~= (rawget(arg2, "Equipped") == true) then
			return flag
		end
		return tostring(rawget(arg, "NetworkedUID") or rawget(arg, "Name")) < tostring(rawget(arg2, "NetworkedUID") or rawget(arg2, "Name"))
	end

	tbl5 = {
		score = function(arg)
			if type(arg) ~= "table" then
				arg = {}
			end

			return {
				fn4(arg, "AllDamage"),
				fn3(rawget(arg, "MeleeCooldown"), rawget(arg, "AllCooldown")),
				fn4(arg, "PveLeech"),
				fn4(arg, "AllResist"),
				fn2(rawget(arg, "Health")),
				fn2(rawget(arg, "Energy")),
				fn2(rawget(arg, "SpeedMultiplier")),
			}
		end,
		choose = function(arg)
			local n5 = 1022058691
			if type(arg) ~= "table" then
				return nil
			end
			local v = nil
			local n6 = 262978620
			local n7 = 942280658
			local v2

			for _, v3 in next, arg do
				if not fn5(v3) then
					continue
				end

				if v then
					if not fn6(v3, v) then
						continue
					end
					v = v3
				elseif n3 == 133861413 then
					v = v3
				end
			end

			return v
		end,
	}
end

local tbl6

tbl6 = {
	MinimumLevel = 100,
	BoostValueThreshold = 1000000,
	BlockingItems = { "God's Chalice", "Sweet Chalice", "Hallow Essence" },
	moneyValue = function(arg)
		if type(arg) ~= "table" then
			return nil
		end
		local quality = arg.Quality or arg.quality
		local v = tonumber
		local price = arg.Value or arg.value or arg.Price or arg.price or arg.Cost or arg.cost

		if not price then
			price = type(quality) == "table"

			if price then
				price = quality.MoneyPrice or quality.moneyPrice
			end
		end

		return v(price)
	end,
	shouldCollect = function(arg)
		if (tonumber(arg.level) or 0) < tbl6.MinimumLevel then
			return false, "level"
		end

		if arg.blocked then
			return false, "progression-item"
		end

		if arg.duplicate then
			return false, "duplicate"
		end

		if (tonumber(arg.expBoostRemaining) or 0) > 0 then
			if not arg.hasIdentity then
				return false, "boost-unknown-fruit"
			end
			local num = tonumber(arg.value)

			if num then
				if not (num <= tbl6.BoostValueThreshold) then
					return true, "eligible"
				end
			end

			return false, "boost-low-value"
		end

		return true, "eligible"
	end,
}

local tbl7

do
	tbl7 = {
		BlockingItems = { "God's Chalice", "Sweet Chalice", "Fire Essence", "Special Microchip", "Hallow Essence" },
		Order = {
			{ name = "Awakened Ice Admiral", level = 1000, sea = 2 },
			{ name = "Cake Prince", level = 1500, sea = 3 },
			{ name = "Tide Keeper", level = 1000, sea = 2 },
		},
		VipBySea = {
			[2] = { "Darkbeard", "Core" },
			[3] = { "rip_indra True Form", "Dough King", "Tyrant of the Skies" },
		},
		Levels = {
			["Awakened Ice Admiral"] = 1000,
			["Cake Prince"] = 1500,
			["Tide Keeper"] = 1000,
			Diablo = 1500,
			Deandre = 1500,
			Urban = 1500,
		},
		isBlocked = function(arg)
			for _, v in tbl7.BlockingItems do
				if arg(v) then
					return true, v
				end
			end

			return false
		end,
		selectOrdered = function(arg, arg2, arg3, arg4, arg5)
			local n5 = arg4 or 1
			local n6 = arg5 or #tbl7.Order

			for i = n5, n6 do
				local v = tbl7.Order[i]
				if not (v.level <= arg) then
					continue
				end

				if arg2(v.sea) then
					if arg3(v.name) then
						return v.name, i
					end
				end
			end

			return nil
		end,
		selectQuest = function(arg, arg2, arg3, arg4)
			local tbl8 = arg4 or {}
			local v = nil
			local v2 = pairs
			local tbl9 = arg2 or {}

			for _, v3 in v2(tbl9) do
				local id = v3.id or v3.Id
				local bossName = v3.boss_name or v3.bossName
				local levelReq = v3.level_req or v3.LevelReq or math.huge
				local familyLevelReq = v3.family_level_req or v3.familyLevelReq or levelReq
				local nextFamilyLevelReq = v3.next_family_level_req or v3.nextFamilyLevelReq or math.huge
				if not bossName then
					continue
				end

				if not (levelReq <= arg) then
					continue
				end

				if not (familyLevelReq <= arg) then
					continue
				end

				if not (arg < nextFamilyLevelReq) then
					continue
				end

				if tbl8[id] then
					continue
				end

				if v then
					if not ((v.family_level_req or v.familyLevelReq or v.level_req or v.LevelReq or -math.huge) < familyLevelReq) then
						continue
					end
				end

				v = v3
			end

			local bossName = v

			if bossName then
				bossName = v.boss_name or v.bossName
			end

			if bossName then
				if arg3(bossName) then
					return bossName, v
				end
			end

			return nil
		end,
		selectVip = function(arg, arg2)
			local tbl8 = tbl7.VipBySea[arg] or {}

			for _, v in tbl8 do
				if arg2(v) then
					return v
				end
			end

			return nil
		end,
	}
end

local tbl8

do
	local n5 = 96
	local n6 = 96
	local str = "seahub_boss_history_"

	local function fn(arg, arg2)
		if type(appendfile) ~= "function" then
			return
		end

		pcall(function()
			local localPlayer = arg.LocalPlayer
			local v = table.clone(arg2)
			local localPlayer2 = localPlayer

			if localPlayer2 then
				localPlayer2 = localPlayer.UserId
			end

			v.userId = localPlayer2 or nil
			local localPlayer3 = localPlayer

			if localPlayer3 then
				localPlayer3 = localPlayer.Name
			end

			v.player = localPlayer3 or nil
			v.placeId = game.PlaceId
			v.jobId = game.JobId
			appendfile(str .. tostring(v.userId or "unknown") .. ".jsonl", game:GetService("HttpService"):JSONEncode(v) .. "\n")
		end)
	end

	local function fn2(arg, arg2, arg3)
		arg[#arg + 1] = arg2

		while arg3 < #arg do
			table.remove(arg, 1)
		end
	end

	local function getTaskQueue(arg)
		local taskQueue = arg.TaskQueue

		if taskQueue then
			taskQueue = arg.TaskQueue:top()
		end

		return taskQueue or nil
	end

	local function fn3(instance)
		if instance == nil then
			return false, nil, nil, nil
		end
		local humanoid = nil
		local humanoidRootPart = nil

		pcall(function()
			humanoid = instance:FindFirstChildOfClass("Humanoid")
			humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")
		end)

		local humanoid2 = nil
		local tbl9 = nil

		pcall(function()
			local humanoid3 = humanoid

			if humanoid3 then
				humanoid3 = tonumber(humanoid.Health)
			end

			humanoid2 = humanoid3 or nil
			local humanoidRootPart2 = humanoidRootPart

			if humanoidRootPart2 then
				humanoidRootPart2 = humanoidRootPart.Position
			end

			if humanoidRootPart2 then
				tbl9 = {
					x = math.round(humanoidRootPart2.X * 10) / 10,
					y = math.round(humanoidRootPart2.Y * 10) / 10,
					z = math.round(humanoidRootPart2.Z * 10) / 10,
				}
			end
		end)

		return humanoid2 == nil or humanoid2 > 0, humanoid2, tbl9, tostring(instance)
	end

	local function fn4(arg, arg2, arg3, arg4)
		return {
			event = arg3,
			boss = arg2,
			source = arg4,
			clock = os.clock(),
			unix = os.time(),
			task = getTaskQueue(arg),
			schedulerReason = arg.State.schedulerReason,
		}
	end

	tbl8 = { observe = function(arg, arg2, arg3, source)
		local state = arg.State
		state.bossPresence = state.bossPresence or {}
		state.bossSightings = state.bossSightings or {}

		local v, health, position, instanceKey = fn3(arg3)
		local v2 = state.bossPresence[arg2]
		local now = os.clock()
		local v3

		if v then
			local v4, v5

			if v2 then
				if v2.alive then
					if v2.instance ~= arg3 then
						v4 = fn4(arg, arg2, "spawned", source)
						v4.health = health
						v4.position = position
						v4.instanceKey = instanceKey
						fn2(state.bossSightings, v4, n5)
						fn(arg, v4)
					elseif not v then
						if v2 then
							if v2.alive then
								v3 = fn4(arg, arg2, "gone", source)
								v3.lastHealth = v2.health
								v3.lastPosition = v2.position
								v3.firstSeenAt = v2.firstSeenAt
								fn2(state.bossSightings, v3, n5)
								fn(arg, v3)
							end
						end
					end
				else
					v4 = fn4(arg, arg2, "spawned", source)
					v4.health = health
					v4.position = position
					v4.instanceKey = instanceKey
					fn2(state.bossSightings, v4, n5)
					fn(arg, v4)
				end
			else
				v4 = fn4(arg, arg2, "spawned", source)
				v4.health = health
				v4.position = position
				v4.instanceKey = instanceKey
				fn2(state.bossSightings, v4, n5)
				fn(arg, v4)
			end
		elseif not v then
			if v2 then
				if v2.alive then
					v3 = fn4(arg, arg2, "gone", source)
					v3.lastHealth = v2.health
					v3.lastPosition = v2.position
					v3.firstSeenAt = v2.firstSeenAt
					fn2(state.bossSightings, v3, n5)
					fn(arg, v3)
				end
			end
		end

		if v then
			local bossPresence = state.bossPresence
			local tbl9 = { alive = true, instance = arg3, instanceKey = instanceKey, health = health, position = position }
			local alive = v2

			if alive then
				alive = v2.alive
			end

			if alive then
				alive = v2.instance == arg3
			end

			if alive then
				alive = v2.firstSeenAt
			end

			tbl9.firstSeenAt = alive or now
			tbl9.lastSeenAt = now
			tbl9.source = source
			bossPresence[arg2] = tbl9
		else
			local bossPresence = state.bossPresence
			local tbl9 = { alive = false }
			local instanceKey2 = v2

			if instanceKey2 then
				instanceKey2 = v2.instanceKey
			end

			tbl9.instanceKey = instanceKey2 or nil
			local health2 = v2

			if health2 then
				health2 = v2.health
			end

			tbl9.health = health2 or nil
			local position2 = v2

			if position2 then
				position2 = v2.position
			end

			tbl9.position = position2 or nil
			local firstSeenAt = v2

			if firstSeenAt then
				firstSeenAt = v2.firstSeenAt
			end

			tbl9.firstSeenAt = firstSeenAt or nil
			local lastSeenAt = v2

			if lastSeenAt then
				lastSeenAt = v2.lastSeenAt
			end

			tbl9.lastSeenAt = lastSeenAt or nil
			local alive = v2

			if alive then
				alive = v2.alive
			end

			if alive then
				alive = now
			end

			if not alive then
				alive = v2

				if alive then
					alive = v2.goneAt
				end
			end

			tbl9.goneAt = alive or nil
			tbl9.source = source
			bossPresence[arg2] = tbl9
		end

		return v
	end }

	local function fn5(arg, arg2, arg3, arg4, arg5)
		local state = arg.State
		state.bossEngagements = state.bossEngagements or {}
		local v = fn4(arg, arg2, arg3, arg4)
		local tbl9 = arg5 or {}

		for k, v2 in tbl9 do
			v[k] = v2
		end

		fn2(state.bossEngagements, v, n6)
		fn(arg, v)
		return v
	end

	tbl8.select = function(arg, arg2, arg3, preempted)
		local state = arg.State
		local bossSelection = state.bossSelection
		local flag = preempted == "Farm Boss" or preempted == "Special Boss"

		if flag then
			flag = "selected"
		end

		flag = flag or "deferred"
		local str2 = arg2

		if str2 then
			str2 = table.concat({ tostring(arg2), tostring(arg3), tostring(preempted) }, "|")
		end

		str2 = str2 or nil

		if bossSelection then
			if bossSelection.signature ~= str2 then
				fn5(arg, bossSelection.boss, "selection-cleared", bossSelection.source, { nextBoss = arg2, nextTask = preempted })
			end
		end

		if arg2 then
			if bossSelection then
				if bossSelection.signature ~= str2 then
					fn5(arg, arg2, flag, arg3, { topTask = preempted })
				end
			else
				fn5(arg, arg2, flag, arg3, { topTask = preempted })
			end
		end

		local bossSelection2 = arg2

		if bossSelection2 then
			bossSelection2 = { boss = arg2, source = arg3, topTask = preempted, event = flag, signature = str2, at = os.clock() }
		end

		state.bossSelection = bossSelection2 or nil
		local activeBossEngagement = state.activeBossEngagement
		if not activeBossEngagement then
			return
		end

		if activeBossEngagement.taskName ~= "Farm Boss" then
			return
		end
		local finish, v, boss, preempted2

		if activeBossEngagement.boss == arg2 then
			if preempted ~= "Farm Boss" then
				finish = tbl8.finish
				v = arg
				boss = activeBossEngagement.boss
				preempted2 = preempted

				if preempted2 then
					preempted2 = "preempted:" .. preempted
				end

				preempted2 = preempted2 or "selection-cleared"
				finish(v, boss, preempted2)
			end
		else
			finish = tbl8.finish
			v = arg
			boss = activeBossEngagement.boss
			preempted2 = preempted

			if preempted2 then
				preempted2 = "preempted:" .. preempted
			end

			finish(v, boss, preempted2 or "selection-cleared")
		end
	end

	tbl8.engage = function(arg, arg2, arg3, arg4, arg5)
		local state = arg.State
		local v, v2, v3, v4 = fn3(arg3)
		local activeBossEngagement = state.activeBossEngagement
		local concat = table.concat
		local tbl9 = {}
		local str2 = tostring(arg2)
		local str3 = tostring(arg4)
		local v5 = tostring
		local str4 = arg5 or "combat"

		do
			local values = table.pack(str2, str3, v5(str4), tostring(v4))
			table.move(values, 1, values.n, 1, tbl9)
		end

		local v6 = concat(tbl9, "|")

		if activeBossEngagement then
			if activeBossEngagement.signature ~= v6 then
				if activeBossEngagement then
					tbl8.finish(arg, activeBossEngagement.boss, "engagement-changed")
				end

				fn5(arg, arg2, "engaged", arg5 or "combat", { taskName = arg4, health = v2, position = v3, instanceKey = v4 })
			end
		else
			if activeBossEngagement then
				tbl8.finish(arg, activeBossEngagement.boss, "engagement-changed")
			end

			fn5(arg, arg2, "engaged", arg5 or "combat", { taskName = arg4, health = v2, position = v3, instanceKey = v4 })
		end

		local activeBossEngagement2 = {
			boss = arg2,
			taskName = arg4,
			phase = arg5 or "combat",
			signature = v6,
			instanceKey = v4,
			health = v2,
			position = v3,
		}

		local activeBossEngagement3 = activeBossEngagement

		if activeBossEngagement3 then
			activeBossEngagement3 = activeBossEngagement.signature == v6
		end

		if activeBossEngagement3 then
			activeBossEngagement3 = activeBossEngagement.startedAt
		end

		activeBossEngagement2.startedAt = activeBossEngagement3 or os.clock()
		activeBossEngagement2.lastUpdatedAt = os.clock()
		state.activeBossEngagement = activeBossEngagement2
	end

	tbl8.finish = function(arg, arg2, arg3)
		local state = arg.State
		local activeBossEngagement = state.activeBossEngagement

		if activeBossEngagement then
			if activeBossEngagement.boss == arg2 then
				fn5(arg, arg2, "released", activeBossEngagement.phase, {
					taskName = activeBossEngagement.taskName,
					reason = arg3,
					startedAt = activeBossEngagement.startedAt,
					lastHealth = activeBossEngagement.health,
					lastPosition = activeBossEngagement.position,
				})

				state.activeBossEngagement = nil
				return true
			end
		end

		return false
	end
end

local tbl9 = { MaximumLevel = 2800 }

do
	local tbl10 = {
		["Dragon Claw"] = 1500,
		["Death Step"] = 5000,
		["Sharkman Karate"] = 5000,
		["Electric Claw"] = 5000,
		["Dragon Talon"] = 5000,
		Godhuman = 5000,
	}

	local tbl11 = {
		["Dragon Claw"] = 5000,
		Superhuman = 5000,
		["Death Step"] = 5000,
		["Sharkman Karate"] = 5000,
		["Electric Claw"] = 5000,
		["Dragon Talon"] = 5000,
	}

	tbl9.decide = function(arg)
		local tbl12 = arg or {}
		local n5 = tonumber(tbl12.level) or 0
		local n6 = tonumber(tbl12.fragments) or 0
		local maximumLevel = tonumber(tbl12.maximumLevel) or tbl9.MaximumLevel
		local n7 = nil

		if n5 >= 1300 then
			if n5 < 1500 then
				n7 = 2000
			elseif n5 < maximumLevel then
				n7 = 5000
			else
				n7 = 10000
			end
		end

		local n8 = 0
		local v, tbl13, initialReserve, canStart, styleDeficit

		if tbl12.expBoostActive ~= true then
			if tbl12.ownsGodhuman ~= true then
				if n7 then
					n8 = math.max(0, n7 - n6)
					v = nil

					if tbl12.styleTarget ~= nil then
						if tbl12.styleTargetOwned == true then
							v = tbl11[tbl12.styleTarget]
						else
							v = tbl10[tbl12.styleTarget]
						end
					end

					tbl13 = { autoTarget = n7, autoDeficit = n8 }
					initialReserve = n5 >= 1300

					if initialReserve then
						initialReserve = tbl12.ownsDragonClaw ~= true
					end

					if initialReserve then
						initialReserve = n6 < 2000
					end

					tbl13.initialReserve = initialReserve
					canStart = tbl12.inRaidSea == true

					if canStart then
						canStart = n5 >= 1300
					end

					tbl13.canStart = canStart
					styleDeficit = v

					if styleDeficit then
						styleDeficit = math.max(0, v - n6)
					end

					styleDeficit = styleDeficit or 0
					tbl13.styleDeficit = styleDeficit
					return tbl13
				else
					v = nil

					if tbl12.styleTarget ~= nil then
						if tbl12.styleTargetOwned == true then
							v = tbl11[tbl12.styleTarget]
						else
							v = tbl10[tbl12.styleTarget]
						end
					end

					tbl13 = { autoTarget = n7, autoDeficit = n8 }
					initialReserve = n5 >= 1300

					if initialReserve then
						initialReserve = tbl12.ownsDragonClaw ~= true
					end

					if initialReserve then
						initialReserve = n6 < 2000
					end

					tbl13.initialReserve = initialReserve
					canStart = tbl12.inRaidSea == true

					if canStart then
						canStart = n5 >= 1300
					end

					tbl13.canStart = canStart
					styleDeficit = v

					if styleDeficit then
						styleDeficit = math.max(0, v - n6)
					end

					styleDeficit = styleDeficit or 0
					tbl13.styleDeficit = styleDeficit
					return tbl13
				end
			else
				v = nil

				if tbl12.styleTarget ~= nil then
					if tbl12.styleTargetOwned == true then
						v = tbl11[tbl12.styleTarget]
					else
						v = tbl10[tbl12.styleTarget]
					end
				end

				tbl13 = { autoTarget = n7, autoDeficit = n8 }
				initialReserve = n5 >= 1300

				if initialReserve then
					initialReserve = tbl12.ownsDragonClaw ~= true
				end

				if initialReserve then
					initialReserve = n6 < 2000
				end

				tbl13.initialReserve = initialReserve
				canStart = tbl12.inRaidSea == true

				if canStart then
					canStart = n5 >= 1300
				end

				tbl13.canStart = canStart
				styleDeficit = v

				if styleDeficit then
					styleDeficit = math.max(0, v - n6)
				end

				styleDeficit = styleDeficit or 0
				tbl13.styleDeficit = styleDeficit
				return tbl13
			end
		else
			v = nil

			if tbl12.styleTarget ~= nil then
				if tbl12.styleTargetOwned == true then
					v = tbl11[tbl12.styleTarget]
				else
					v = tbl10[tbl12.styleTarget]
				end
			end

			tbl13 = { autoTarget = n7, autoDeficit = n8 }
			initialReserve = n5 >= 1300

			if initialReserve then
				initialReserve = tbl12.ownsDragonClaw ~= true
			end

			if initialReserve then
				initialReserve = n6 < 2000
			end

			tbl13.initialReserve = initialReserve
			canStart = tbl12.inRaidSea == true

			if canStart then
				canStart = n5 >= 1300
			end

			tbl13.canStart = canStart
			styleDeficit = v

			if styleDeficit then
				styleDeficit = math.max(0, v - n6)
			end

			tbl13.styleDeficit = styleDeficit or 0
			return tbl13
		end
	end
end

local tbl10

do
	local tbl11 = {
		[2753915549] = 1,
		[4442272183] = 2,
		[7449423635] = 3,
		[85211729168715] = 1,
		[100117331123089] = 3,
		[79091703265657] = 2,
	}

	local tbl12 = {
		BartiloQuest = true,
		CitizenQuest = true,
		Trainees = true,
		ImpelQuest = true,
		MarineQuest = true,
	}

	local tbl13 = { { 0, 699 }, { 700, 1499 }, { 1500, math.huge } }

	local function fn()
		local map = workspace

		if map then
			map = workspace:FindFirstChild("Map")
		end

		if not map then
			return nil
		end

		if map:FindFirstChild("Dressrosa") then
			if map:FindFirstChild("GreenBit") then
				return 2
			end
		end

		if not map:FindFirstChild("HauntedCastle") then
			if not map:FindFirstChild("TikiOutpost") then
				if not map:FindFirstChild("GreatTree") then
					return 1
				end
			end
		end

		return 3
	end

	local tbl14 = {
		{
			{
				mob_pos = CFrame.new(1045.962646484375, 27.002508163452148, 1560.8203125),
				level_req = 0,
				quest_name = "BanditQuest1",
				quest_num = 1,
				mob_name = "Bandit",
				quest_pos = CFrame.new(1058.9927978515625, 16.13587760925293, 1551.7337646484375),
			},
			{
				mob_pos = CFrame.new(-1448.51806640625, 67.853012084960938, 11.46579647064209),
				level_req = 10,
				quest_name = "JungleQuest",
				quest_num = 1,
				mob_name = "Monkey",
				quest_pos = CFrame.new(-1598.089111328125, 35.550117492675781, 153.37783813476562),
			},
			{
				mob_pos = CFrame.new(-1129.8836669921875, 40.463546752929688, -525.4237060546875),
				level_req = 15,
				quest_name = "JungleQuest",
				quest_num = 2,
				mob_name = "Gorilla",
				quest_pos = CFrame.new(-1598.089111328125, 35.550117492675781, 153.37783813476562),
			},
			{
				mob_pos = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125),
				level_req = 30,
				quest_name = "BuggyQuest1",
				quest_num = 1,
				mob_name = "Pirate",
				quest_pos = CFrame.new(-1141.0751953125, 4.1000127792358398, 3831.5498046875),
			},
			{
				mob_pos = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875),
				level_req = 40,
				quest_name = "BuggyQuest1",
				quest_num = 2,
				mob_name = "Brute",
				quest_pos = CFrame.new(-1141.0751953125, 4.1000127792358398, 3831.5498046875),
			},
			{
				mob_pos = CFrame.new(924.7998046875, 6.4486746788024902, 4481.5859375),
				level_req = 60,
				quest_name = "DesertQuest",
				quest_num = 1,
				mob_name = "Desert Bandit",
				quest_pos = CFrame.new(894.4886474609375, 5.1400070190429688, 4392.43359375),
			},
			{
				mob_pos = CFrame.new(1608.2822265625, 8.6142244338989258, 4371.00732421875),
				level_req = 75,
				quest_name = "DesertQuest",
				quest_num = 2,
				mob_name = "Desert Officer",
				quest_pos = CFrame.new(894.4886474609375, 5.1400070190429688, 4392.43359375),
			},
			{
				mob_pos = CFrame.new(1354.347900390625, 87.272773742675781, -1393.946533203125),
				level_req = 90,
				quest_name = "SnowQuest",
				quest_num = 1,
				mob_name = "Snow Bandit",
				quest_pos = CFrame.new(1387.1883544921875, 86.620750427246094, -1295.0445556640625),
			},
			{
				mob_pos = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625),
				level_req = 100,
				quest_name = "SnowQuest",
				quest_num = 2,
				mob_name = "Snowman",
				quest_pos = CFrame.new(1387.1883544921875, 86.620750427246094, -1295.0445556640625),
			},
			{
				mob_pos = CFrame.new(-4881.23095703125, 22.652044296264648, 4273.75244140625),
				level_req = 120,
				quest_name = "MarineQuest2",
				quest_num = 1,
				mob_name = "Chief Petty Officer",
				quest_pos = CFrame.new(-5039.58642578125, 27.350038528442383, 4324.68017578125),
			},
			{
				mob_pos = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625),
				level_req = 150,
				quest_name = "SkyQuest",
				quest_num = 1,
				mob_name = "Sky Bandit",
				quest_pos = CFrame.new(-4839.5302734375, 716.36859130859375, -2619.441650390625),
			},
			{
				mob_pos = CFrame.new(-5259.8447265625, 391.39767456054688, -2229.035400390625),
				level_req = 175,
				quest_name = "SkyQuest",
				quest_num = 2,
				mob_name = "Dark Master",
				quest_pos = CFrame.new(-4839.5302734375, 716.36859130859375, -2619.441650390625),
			},
			{
				mob_pos = CFrame.new(5098.9736328125, -0.32040581107139587, 474.23733520507812),
				level_req = 190,
				quest_name = "PrisonerQuest",
				quest_num = 1,
				mob_name = "Prisoner",
				quest_pos = CFrame.new(5310.60546875, 0.35001492500305176, 474.94659423828125),
			},
			{
				mob_pos = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375),
				level_req = 210,
				quest_name = "PrisonerQuest",
				quest_num = 2,
				mob_name = "Dangerous Prisoner",
				quest_pos = CFrame.new(5310.60546875, 0.35001492500305176, 474.94659423828125),
			},
			{
				mob_pos = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375),
				level_req = 225,
				quest_name = "ImpelQuest",
				quest_num = 1,
				mob_name = "Ruthless Prisoner",
				quest_pos = CFrame.new(5320.666015625, 18.886114120483398, 856.28118896484375),
				arya_blacklisted = true,
			},
			{
				mob_pos = CFrame.new(-1820.21484375, 51.683856964111328, -2740.6650390625),
				level_req = 250,
				quest_name = "ColosseumQuest",
				quest_num = 1,
				mob_name = "Toga Warrior",
				quest_pos = CFrame.new(-1580.046630859375, 6.3500027656555176, -2986.475341796875),
			},
			{
				mob_pos = CFrame.new(-1380, 36, -3405),
				level_req = 275,
				quest_name = "ColosseumQuest",
				quest_num = 2,
				mob_name = "Gladiator",
				quest_pos = CFrame.new(-1580.046630859375, 6.3500027656555176, -2986.475341796875),
			},
			{
				mob_pos = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875),
				level_req = 300,
				quest_name = "MagmaQuest",
				quest_num = 1,
				mob_name = "Military Soldier",
				quest_pos = CFrame.new(-5313.3701171875, 10.950008392333984, 8515.2939453125),
			},
			{
				mob_pos = CFrame.new(-5802.8681640625, 86.262413024902344, 8828.859375),
				level_req = 325,
				quest_name = "MagmaQuest",
				quest_num = 2,
				mob_name = "Military Spy",
				quest_pos = CFrame.new(-5313.3701171875, 10.950008392333984, 8515.2939453125),
			},
			{
				mob_pos = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625),
				level_req = 375,
				quest_name = "FishmanQuest",
				quest_num = 1,
				mob_name = "Fishman Warrior",
				quest_pos = CFrame.new(61121.109375, 17.953125, 1564.5263671875),
			},
			{
				mob_pos = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875),
				level_req = 400,
				quest_name = "FishmanQuest",
				quest_num = 2,
				mob_name = "Fishman Commando",
				quest_pos = CFrame.new(61121.109375, 17.953125, 1564.5263671875),
			},
			{
				mob_pos = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375),
				level_req = 450,
				quest_name = "SkyExp1Quest",
				quest_num = 1,
				mob_name = "God's Guard",
				quest_pos = CFrame.new(-4721.9521484375, 844.1746826171875, -1949.243408203125),
			},
			{
				mob_pos = CFrame.new(-7678.48974609375, 5566.40380859375, -497.21560668945312),
				level_req = 475,
				quest_name = "SkyExp1Quest",
				quest_num = 2,
				mob_name = "Shanda",
				quest_pos = CFrame.new(-7859.09814453125, 5544.1904296875, -381.4761962890625),
			},
			{
				mob_pos = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875),
				level_req = 525,
				quest_name = "SkyExp2Quest",
				quest_num = 1,
				mob_name = "Royal Squad",
				quest_pos = CFrame.new(-7904.6845703125, 5634.6611328125, -1409.96728515625),
			},
			{
				mob_pos = CFrame.new(-7806.75341796875, 5645.6640625, -1760.6236572265625),
				level_req = 550,
				quest_name = "SkyExp2Quest",
				quest_num = 2,
				mob_name = "Royal Soldier",
				quest_pos = CFrame.new(-7904.6845703125, 5634.6611328125, -1409.96728515625),
			},
			{
				mob_pos = CFrame.new(5551.02197265625, 78.901351928710938, 3930.412841796875),
				level_req = 625,
				quest_name = "FountainQuest",
				quest_num = 1,
				mob_name = "Galley Pirate",
				quest_pos = CFrame.new(5259.81982421875, 37.350017547607422, 4050.029296875),
			},
			{
				mob_pos = CFrame.new(5441.95166015625, 42.502059936523438, 4950.09375),
				level_req = 650,
				quest_name = "FountainQuest",
				quest_num = 2,
				mob_name = "Galley Captain",
				quest_pos = CFrame.new(5259.81982421875, 37.350017547607422, 4050.029296875),
			},
		},
		{
			{
				mob_pos = CFrame.new(319.15396118164062, 39.142494201660156, 2380.25830078125),
				level_req = 700,
				quest_name = "Area1Quest",
				quest_num = 1,
				mob_name = "Raider",
				quest_pos = CFrame.new(-429.54351806640625, 71.769996643066406, 1836.181884765625),
			},
			{
				mob_pos = CFrame.new(-1004.3244018554688, 80.158866882324219, 1424.619384765625),
				level_req = 725,
				quest_name = "Area1Quest",
				quest_num = 2,
				mob_name = "Mercenary",
				quest_pos = CFrame.new(-429.54351806640625, 71.769996643066406, 1836.181884765625),
			},
			{
				mob_pos = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625),
				level_req = 775,
				quest_name = "Area2Quest",
				quest_num = 1,
				mob_name = "Swan Pirate",
				quest_pos = CFrame.new(638.4381103515625, 71.769989013671875, 918.28289794921875),
			},
			{
				mob_pos = CFrame.new(73.07867431640625, 81.863441467285156, -27.470672607421875),
				level_req = 800,
				quest_name = "Area2Quest",
				quest_num = 2,
				mob_name = "Factory Staff",
				quest_pos = CFrame.new(638.4381103515625, 71.769989013671875, 918.28289794921875),
			},
			{
				mob_pos = CFrame.new(-2821.372314453125, 95.89727783203125, -3070.089111328125),
				level_req = 875,
				quest_name = "MarineQuest3",
				quest_num = 1,
				mob_name = "Marine Lieutenant",
				quest_pos = CFrame.new(-2440.79638671875, 71.714073181152344, -3216.068115234375),
			},
			{
				mob_pos = CFrame.new(-1861.2310791015625, 80.176582336425781, -3254.697509765625),
				level_req = 900,
				quest_name = "MarineQuest3",
				quest_num = 2,
				mob_name = "Marine Captain",
				quest_pos = CFrame.new(-2440.79638671875, 71.714073181152344, -3216.068115234375),
			},
			{
				mob_pos = CFrame.new(-5657.77685546875, 78.969734191894531, -928.68701171875),
				level_req = 950,
				quest_name = "ZombieQuest",
				quest_num = 1,
				mob_name = "Zombie",
				quest_pos = CFrame.new(-5497.0615234375, 47.592300415039062, -795.237060546875),
			},
			{
				mob_pos = CFrame.new(-6037.66796875, 32.184638977050781, -1340.6597900390625),
				level_req = 975,
				quest_name = "ZombieQuest",
				quest_num = 2,
				mob_name = "Vampire",
				quest_pos = CFrame.new(-5497.0615234375, 47.592300415039062, -795.237060546875),
			},
			{
				mob_pos = CFrame.new(549.1473388671875, 427.38705444335938, -5563.69873046875),
				level_req = 1000,
				quest_name = "SnowMountainQuest",
				quest_num = 1,
				mob_name = "Snow Trooper",
				quest_pos = CFrame.new(609.85882568359375, 400.11990356445312, -5372.25927734375),
			},
			{
				mob_pos = CFrame.new(1142.7451171875, 475.63980102539062, -5199.41650390625),
				level_req = 1050,
				quest_name = "SnowMountainQuest",
				quest_num = 2,
				mob_name = "Winter Warrior",
				quest_pos = CFrame.new(609.85882568359375, 400.11990356445312, -5372.25927734375),
			},
			{
				mob_pos = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375),
				level_req = 1100,
				quest_name = "IceSideQuest",
				quest_num = 1,
				mob_name = "Lab Subordinate",
				quest_pos = CFrame.new(-6231.98291015625, 81.804855346679688, -4852.8056640625),
			},
			{
				mob_pos = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375),
				level_req = 1125,
				quest_name = "IceSideQuest",
				quest_num = 2,
				mob_name = "Horned Warrior",
				quest_pos = CFrame.new(-6231.98291015625, 81.804855346679688, -4852.8056640625),
			},
			{
				mob_pos = CFrame.new(-5449.6728515625, 76.658744812011719, -5808.20068359375),
				level_req = 1175,
				quest_name = "FireSideQuest",
				quest_num = 1,
				mob_name = "Magma Ninja",
				quest_pos = CFrame.new(-5406.77783203125, 29.148797988891602, -5371.88671875),
			},
			{
				mob_pos = CFrame.new(-5213.33154296875, 49.737880706787109, -4701.451171875),
				level_req = 1200,
				quest_name = "FireSideQuest",
				quest_num = 2,
				mob_name = "Lava Pirate",
				quest_pos = CFrame.new(-5406.77783203125, 29.148797988891602, -5371.88671875),
			},
			{
				mob_pos = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375),
				level_req = 1250,
				quest_name = "ShipQuest1",
				quest_num = 1,
				mob_name = "Ship Deckhand",
				quest_pos = CFrame.new(1040.5555419921875, 124.94292449951172, 32909.10546875),
			},
			{
				mob_pos = CFrame.new(919.4786376953125, 43.544013977050781, 32779.96875),
				level_req = 1275,
				quest_name = "ShipQuest1",
				quest_num = 2,
				mob_name = "Ship Engineer",
				quest_pos = CFrame.new(1040.5555419921875, 124.94292449951172, 32909.10546875),
			},
			{
				mob_pos = CFrame.new(919.43853759765625, 129.55599975585938, 33436.03515625),
				level_req = 1300,
				quest_name = "ShipQuest2",
				quest_num = 1,
				mob_name = "Ship Steward",
				quest_pos = CFrame.new(974.075439453125, 124.93901824951172, 33253.62109375),
			},
			{
				mob_pos = CFrame.new(1036.0179443359375, 181.43904113769531, 33315.7265625),
				level_req = 1325,
				quest_name = "ShipQuest2",
				quest_num = 2,
				mob_name = "Ship Officer",
				quest_pos = CFrame.new(974.075439453125, 124.93901824951172, 33253.62109375),
			},
			{
				mob_pos = CFrame.new(5966.24609375, 62.970020294189453, -6179.3828125),
				level_req = 1350,
				quest_name = "FrostQuest",
				quest_num = 1,
				mob_name = "Arctic Warrior",
				quest_pos = CFrame.new(5667.658203125, 26.799781799316406, -6486.08984375),
			},
			{
				mob_pos = CFrame.new(5407.07373046875, 69.194374084472656, -6880.88037109375),
				level_req = 1375,
				quest_name = "FrostQuest",
				quest_num = 2,
				mob_name = "Snow Lurker",
				quest_pos = CFrame.new(5667.658203125, 26.799781799316406, -6486.08984375),
			},
			{
				mob_pos = CFrame.new(-3240.3310546875, 27.4530029296875, -9813.9658203125),
				level_req = 1425,
				quest_name = "ForgottenQuest",
				quest_num = 1,
				mob_name = "Sea Soldier",
				quest_pos = CFrame.new(-3054.444580078125, 238.34426879882812, -10142.8193359375),
			},
			{
				mob_pos = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875),
				level_req = 1450,
				quest_name = "ForgottenQuest",
				quest_num = 2,
				mob_name = "Water Fighter",
				quest_pos = CFrame.new(-3054.444580078125, 238.34426879882812, -10142.8193359375),
			},
		},
		{
			{
				mob_pos = CFrame.new(-245.99638366699219, 47.30615234375, 5584.1005859375),
				level_req = 1500,
				quest_name = "PiratePortQuest",
				quest_num = 1,
				mob_name = "Pirate Millionaire",
				quest_pos = CFrame.new(-290.07467651367188, 42.903465270996094, 5581.58984375),
			},
			{
				mob_pos = CFrame.new(-187.33015441894531, 86.239875793457031, 6013.513671875),
				level_req = 1525,
				quest_name = "PiratePortQuest",
				quest_num = 2,
				mob_name = "Pistol Billionaire",
				quest_pos = CFrame.new(-290.07467651367188, 42.903465270996094, 5581.58984375),
			},
			{
				mob_pos = CFrame.new(6778, 108.53675842285156, -1044.1842041015625),
				level_req = 1575,
				quest_name = "DragonCrewQuest",
				quest_num = 1,
				mob_name = "Dragon Crew Warrior",
				quest_pos = CFrame.new(6735.11083984375, 126.99046325683594, -711.09796142578125),
			},
			{
				mob_pos = CFrame.new(6743.814453125, 536.55706787109375, 345.12908935546875),
				level_req = 1600,
				quest_name = "DragonCrewQuest",
				quest_num = 2,
				mob_name = "Dragon Crew Archer",
				quest_pos = CFrame.new(6735.11083984375, 126.99046325683594, -711.09796142578125),
			},
			{
				mob_pos = CFrame.new(4685.25830078125, 735.80780029296875, 815.34259033203125),
				level_req = 1625,
				quest_name = "VenomCrewQuest",
				quest_num = 1,
				mob_name = "Hydra Enforcer",
				quest_pos = CFrame.new(5214.33935546875, 1003.4676513671875, 759.50732421875),
			},
			{
				mob_pos = CFrame.new(4729.09423828125, 590.436767578125, -36.976276397705078),
				level_req = 1650,
				quest_name = "VenomCrewQuest",
				quest_num = 2,
				mob_name = "Venomous Assailant",
				quest_pos = CFrame.new(5214.33935546875, 1003.4676513671875, 759.50732421875),
			},
			{
				mob_pos = CFrame.new(2286.0078125, 73.133918762207031, -7159.80908203125),
				level_req = 1700,
				quest_name = "MarineTreeIsland",
				quest_num = 1,
				mob_name = "Marine Commodore",
				quest_pos = CFrame.new(2485.7333984375, 73.345993041992188, -6788.62548828125),
			},
			{
				mob_pos = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125),
				level_req = 1725,
				quest_name = "MarineTreeIsland",
				quest_num = 2,
				mob_name = "Marine Rear Admiral",
				quest_pos = CFrame.new(2485.7333984375, 73.345993041992188, -6788.62548828125),
			},
			{
				mob_pos = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625),
				level_req = 1775,
				quest_name = "DeepForestIsland3",
				quest_num = 1,
				mob_name = "Fishman Raider",
				quest_pos = CFrame.new(-10581.65625, 330.87295532226562, -8761.1865234375),
			},
			{
				mob_pos = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625),
				level_req = 1800,
				quest_name = "DeepForestIsland3",
				quest_num = 2,
				mob_name = "Fishman Captain",
				quest_pos = CFrame.new(-10581.65625, 330.87295532226562, -8761.1865234375),
			},
			{
				mob_pos = CFrame.new(-13274.478515625, 332.37814331054688, -7769.58056640625),
				level_req = 1825,
				quest_name = "DeepForestIsland",
				quest_num = 1,
				mob_name = "Forest Pirate",
				quest_pos = CFrame.new(-13234.0400390625, 331.48849487304688, -7625.4013671875),
			},
			{
				mob_pos = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125),
				level_req = 1850,
				quest_name = "DeepForestIsland",
				quest_num = 2,
				mob_name = "Mythological Pirate",
				quest_pos = CFrame.new(-13234.0400390625, 331.48849487304688, -7625.4013671875),
			},
			{
				mob_pos = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625),
				level_req = 1900,
				quest_name = "DeepForestIsland2",
				quest_num = 1,
				mob_name = "Jungle Pirate",
				quest_pos = CFrame.new(-12680.3818359375, 389.97103881835938, -9902.01953125),
			},
			{
				mob_pos = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375),
				level_req = 1925,
				quest_name = "DeepForestIsland2",
				quest_num = 2,
				mob_name = "Musketeer Pirate",
				quest_pos = CFrame.new(-12680.3818359375, 389.97103881835938, -9902.01953125),
			},
			{
				mob_pos = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625),
				level_req = 1975,
				quest_name = "HauntedQuest1",
				quest_num = 1,
				mob_name = "Reborn Skeleton",
				quest_pos = CFrame.new(-9479.216796875, 141.215087890625, 5566.0927734375),
			},
			{
				mob_pos = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875),
				level_req = 2000,
				quest_name = "HauntedQuest1",
				quest_num = 2,
				mob_name = "Living Zombie",
				quest_pos = CFrame.new(-9479.216796875, 141.215087890625, 5566.0927734375),
			},
			{
				mob_pos = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625),
				level_req = 2025,
				quest_name = "HauntedQuest2",
				quest_num = 1,
				mob_name = "Demonic Soul",
				quest_pos = CFrame.new(-9516.9931640625, 172.01718139648438, 6078.46533203125),
			},
			{
				mob_pos = CFrame.new(-9582.0224609375, 6.2515273094177246, 6205.478515625),
				level_req = 2050,
				quest_name = "HauntedQuest2",
				quest_num = 2,
				mob_name = "Posessed Mummy",
				quest_pos = CFrame.new(-9516.9931640625, 172.01718139648438, 6078.46533203125),
			},
			{
				mob_pos = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875),
				level_req = 2075,
				quest_name = "NutsIslandQuest",
				quest_num = 1,
				mob_name = "Peanut Scout",
				quest_pos = CFrame.new(-2105.531982421875, 37.249599456787109, -10195.5087890625),
			},
			{
				mob_pos = CFrame.new(-1859.35400390625, 38.103168487548828, -10422.4296875),
				level_req = 2100,
				quest_name = "NutsIslandQuest",
				quest_num = 2,
				mob_name = "Peanut President",
				quest_pos = CFrame.new(-2105.531982421875, 37.249599456787109, -10195.5087890625),
			},
			{
				mob_pos = CFrame.new(-872.24658203125, 65.819572448730469, -10919.95703125),
				level_req = 2125,
				quest_name = "IceCreamIslandQuest",
				quest_num = 1,
				mob_name = "Ice Cream Chef",
				quest_pos = CFrame.new(-819.376708984375, 64.925979614257812, -10967.283203125),
			},
			{
				mob_pos = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625),
				level_req = 2150,
				quest_name = "IceCreamIslandQuest",
				quest_num = 2,
				mob_name = "Ice Cream Commander",
				quest_pos = CFrame.new(-819.376708984375, 64.925979614257812, -10967.283203125),
			},
			{
				mob_pos = CFrame.new(-2374.13671875, 37.798263549804688, -12125.30859375),
				level_req = 2200,
				quest_name = "CakeQuest1",
				quest_num = 1,
				mob_name = "Cookie Crafter",
				quest_pos = CFrame.new(-2022.298583984375, 36.927589416503906, -12030.9765625),
			},
			{
				mob_pos = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875),
				level_req = 2225,
				quest_name = "CakeQuest1",
				quest_num = 2,
				mob_name = "Cake Guard",
				quest_pos = CFrame.new(-2022.298583984375, 36.927589416503906, -12030.9765625),
			},
			{
				mob_pos = CFrame.new(-1887.8099365234375, 77.618507385253906, -12998.3505859375),
				level_req = 2250,
				quest_name = "CakeQuest2",
				quest_num = 1,
				mob_name = "Baking Staff",
				quest_pos = CFrame.new(-1928.317626953125, 37.729663848876953, -12840.6259765625),
			},
			{
				mob_pos = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125),
				level_req = 2275,
				quest_name = "CakeQuest2",
				quest_num = 2,
				mob_name = "Head Baker",
				quest_pos = CFrame.new(-1928.317626953125, 37.729663848876953, -12840.6259765625),
			},
			{
				mob_pos = CFrame.new(-21.55328369140625, 80.574996948242188, -12352.3876953125),
				level_req = 2300,
				quest_name = "ChocQuest1",
				quest_num = 1,
				mob_name = "Cocoa Warrior",
				quest_pos = CFrame.new(231.75, 23.900302886962891, -12200.2919921875),
			},
			{
				mob_pos = CFrame.new(582.590576171875, 77.188095092773438, -12463.162109375),
				level_req = 2325,
				quest_name = "ChocQuest1",
				quest_num = 2,
				mob_name = "Chocolate Bar Battler",
				quest_pos = CFrame.new(231.75, 23.900302886962891, -12200.2919921875),
			},
			{
				mob_pos = CFrame.new(165.1884765625, 76.058853149414062, -12600.8369140625),
				level_req = 2350,
				quest_name = "ChocQuest2",
				quest_num = 1,
				mob_name = "Sweet Thief",
				quest_pos = CFrame.new(151.1982421875, 23.890714645385742, -12774.6171875),
			},
			{
				mob_pos = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625),
				level_req = 2375,
				quest_name = "ChocQuest2",
				quest_num = 2,
				mob_name = "Candy Rebel",
				quest_pos = CFrame.new(151.1982421875, 23.890714645385742, -12774.6171875),
			},
			{
				mob_pos = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875),
				level_req = 2400,
				quest_name = "CandyQuest1",
				quest_num = 1,
				mob_name = "Candy Pirate",
				quest_pos = CFrame.new(-1164.498046875, 59.269073486328125, -14492.6181640625),
			},
			{
				mob_pos = CFrame.new(-905.52764892578125, 43.781257629394531, -14683.2177734375),
				level_req = 2425,
				quest_name = "CandyQuest1",
				quest_num = 2,
				mob_name = "Snow Demon",
				quest_pos = CFrame.new(-1164.498046875, 59.269073486328125, -14492.6181640625),
			},
			{
				mob_pos = CFrame.new(-16479.900390625, 226.61174011230469, -300.31143188476562),
				level_req = 2450,
				quest_name = "TikiQuest1",
				quest_num = 1,
				mob_name = "Isle Outlaw",
				quest_pos = CFrame.new(-16548.81640625, 55.605991363525391, -172.8125),
			},
			{
				mob_pos = CFrame.new(-16849.396484375, 192.86505126953125, -150.78532409667969),
				level_req = 2475,
				quest_name = "TikiQuest1",
				quest_num = 2,
				mob_name = "Island Boy",
				quest_pos = CFrame.new(-16548.81640625, 55.605991363525391, -172.8125),
			},
			{
				mob_pos = CFrame.new(-16347, 64, 984),
				level_req = 2500,
				quest_name = "TikiQuest2",
				quest_num = 1,
				mob_name = "Sun-kissed Warrior",
				quest_pos = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625),
			},
			{
				mob_pos = CFrame.new(-16602.1015625, 130.38734436035156, 1087.24560546875),
				level_req = 2525,
				quest_name = "TikiQuest2",
				quest_num = 2,
				mob_name = "Isle Champion",
				quest_pos = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625),
			},
			{
				mob_pos = CFrame.new(-16540.998046875, 148.70091247558594, 1524.616455078125),
				level_req = 2550,
				quest_name = "TikiQuest3",
				quest_num = 1,
				mob_name = "Serpent Hunter",
				quest_pos = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375),
			},
			{
				mob_pos = CFrame.new(-16760.80078125, 111.53847503662109, 1600.358154296875),
				level_req = 2575,
				quest_name = "TikiQuest3",
				quest_num = 2,
				mob_name = "Skull Slayer",
				quest_pos = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375),
			},
			{
				mob_pos = CFrame.new(10883.5478515625, -2160.20458984375, 9075.4833984375),
				level_req = 2601,
				quest_name = "SubmergedQuest1",
				quest_num = 1,
				mob_name = "Reef Bandit",
				quest_pos = CFrame.new(10780.6396484375, -2083.4140625, 9263.453125),
			},
			{
				mob_pos = CFrame.new(10680.076171875, -2056.6748046875, 9933.8896484375),
				level_req = 2651,
				quest_name = "SubmergedQuest2",
				quest_num = 1,
				mob_name = "Sea Chanter",
				quest_pos = CFrame.new(10883.5986328125, -2081.888916015625, 10037.01953125),
			},
			{
				mob_pos = CFrame.new(9854.435546875, -1995.0880126953125, 9963.9375),
				level_req = 2678,
				quest_name = "SubmergedQuest3",
				quest_num = 1,
				mob_name = "High Disciple",
				quest_pos = CFrame.new(9637.2939453125, -1988.1351318359375, 9619.3017578125),
			},
			{
				mob_pos = CFrame.new(9559.1943359375, -1994.3974609375, 9798.6650390625),
				level_req = 2780,
				quest_name = "SubmergedQuest3",
				quest_num = 2,
				mob_name = "Grand Devotee",
				quest_pos = CFrame.new(9637.2939453125, -1988.1351318359375, 9619.3017578125),
			},
		},
	}

	local function fn2(arg)
		local tbl15 = {}
		local tbl16 = arg or {}

		for k, v in tbl16 do
			tbl15[k] = v
		end

		return tbl15
	end

	local function fn3(arg)
		local task_ = type(arg) == "table"

		if task_ then
			task_ = arg.Task
		end

		task_ = task_ or {}

		for _, v in task_ do
			if tonumber(v) == 1 then
				return true
			end
		end

		return false
	end

	local function fn4(arg)
		local task_ = type(arg) == "table"

		if task_ then
			task_ = arg.Task
		end

		task_ = task_ or {}

		for k, v in task_ do
			return tostring(k), tonumber(v)
		end

		return nil, nil
	end

	local function fn5(arg)
		local tbl15 = {}
		local tbl16 = tbl14[arg] or {}

		for _, v in tbl16 do
			local tbl17 = tbl15[v.quest_name]

			if not tbl17 then
				tbl17 = { first = v, entries = {} }
				tbl15[v.quest_name] = tbl17
			end

			tbl17.entries[v.quest_num] = v
		end

		return tbl15
	end

	local function getOk()
		if not game then
			return nil
		end

		if type(game.GetService) ~= "function" then
			return nil
		end
		local quests = game:GetService("ReplicatedStorage"):FindFirstChild("Quests")

		if quests then
			local ok, result = pcall(require, quests)

			if ok then
				ok = type(result) == "table"
			end

			if ok then
				ok = result
			end

			return ok or nil
		end

		return nil
	end

	tbl10 = {
		mergeLive = function(arg, arg2)
			local v = tbl13[arg]

			if v then
				if type(arg2) == "table" then
					local v2 = fn5(arg)
					local tbl15 = {}

					for k, v3 in arg2 do
						local flag = type(v3) == "table"

						if flag then
							flag = v3[1]
						end

						local num = flag

						if num then
							num = tonumber(flag.LevelReq)
						end

						if not num then
							continue
						end

						if not (v[1] <= num) then
							continue
						end

						if not (num <= v[2]) then
							continue
						end

						if tbl12[k] then
							continue
						end
						local v4 = table.clone(v3)

						if fn3(v4[#v4]) then
							table.remove(v4, #v4)
						end

						local v5 = v2[k]

						for k2, v6 in v4 do
							local levelReq = tonumber(v6.LevelReq)
							local mobName, questRequired = fn4(v6)
							if not levelReq then
								continue
							end

							if not mobName then
								continue
							end

							if not (levelReq <= v[2]) then
								continue
							end
							local entry = v5

							if entry then
								entry = v5.entries[k2]
							end

							local first = v5

							if first then
								first = v5.first
							end

							local v7 = fn2(entry or first)
							v7.level_req = levelReq
							v7.quest_name = k
							v7.quest_num = k2
							v7.mob_name = mobName
							v7.quest_required = questRequired
							v7.accepted_name = v6.Name
							v7.live_quest_data = true

							if not entry then
								v7.mob_pos = nil
							end

							tbl15[#tbl15 + 1] = v7
							continue
						end
					end

					table.sort(tbl15, function(arg3, arg4)
						if arg3.level_req ~= arg4.level_req then
							return arg3.level_req < arg4.level_req
						end

						if arg3.quest_name ~= arg4.quest_name then
							return arg3.quest_name < arg4.quest_name
						end
						return arg3.quest_num < arg4.quest_num
					end)

					return tbl15
				end
			end

			return {}
		end,
		forSea = function(arg)
			return tbl14[arg] or {}
		end,
	}

	local function fn6(arg, arg2)
		if #arg2 == 0 then
			return tbl10.forSea(arg)
		end
		local tbl15 = {}
		local tbl16 = {}

		local function fn7(arg3)
			local str = tostring(arg3.quest_name) .. "\0" .. tostring(arg3.quest_num)
			if tbl16[str] then
				return
			end
			tbl16[str] = true
			tbl15[#tbl15 + 1] = arg3
		end

		for _, v in arg2 do
			fn7(v)
		end

		for _, v in tbl10.forSea(arg) do
			fn7(fn2(v))
		end

		table.sort(tbl15, function(arg3, arg4)
			if arg3.level_req ~= arg4.level_req then
				return arg3.level_req < arg4.level_req
			end

			if arg3.quest_name ~= arg4.quest_name then
				return arg3.quest_name < arg4.quest_name
			end
			return arg3.quest_num < arg4.quest_num
		end)

		return tbl15
	end

	tbl10.forPlace = function(arg)
		local v = tbl11[arg] or fn()
		local mergeLive = tbl10.mergeLive
		local v2 = v
		local v3 = table.pack(getOk())
		local v4

		if select("#", table.unpack(v3, 1, v3.n)) ~= 0 then
			v4 = mergeLive(v2, table.unpack(v3, 1, v3.n))
			return fn6(v, v4)
		else
			v4 = mergeLive(v2, table.unpack(v3, 1, v3.n))
			return fn6(v, v4)
		end
	end
end

local tbl11

do
	local str = "quest completed"
	local n5 = 2

	local function fn(acceptedQuestKey, levelQuestKey)
		if acceptedQuestKey == nil then
			return false
		end

		if levelQuestKey ~= nil then
			local str2 = tostring(acceptedQuestKey)
			local str3 = tostring(levelQuestKey)
			if str2 == str3 then
				return true
			end
			return str2:sub(-(#str3 + 1)) == "\0" .. str3
		end

		return false
	end

	local function fn2(arg)
		arg.acceptedQuestKey = nil
		arg.acceptedQuestAt = nil
		arg.acceptedQuestConfirmed = nil
		arg.acceptedQuestKills = nil
		arg.acceptedQuestRequired = nil
		arg.lastQuestSeenAt = nil
		arg.questAcquire = nil
		arg.questTarget = nil
		arg.farmTarget = nil
		arg.farmCluster = nil
		arg.farmClusterCount = 0
		arg.farmClusterName = nil
		arg.currentFarmMobName = nil
		arg.attackTarget = nil
		arg.attackTargetNames = nil
		arg.attackTask = nil
	end

	tbl11 = {
		isQuestCompleted = function(arg)
			return tostring(arg or ""):lower():find(str, 1, true) ~= nil
		end,
		record = function(arg, arg2, arg3, lastQuestCompletionSource)
			if type(arg) ~= "table" then
				return false
			end

			if tbl11.isQuestCompleted(arg2) then
				local now = tonumber(arg3) or os.clock()
				local num = tonumber(arg.lastQuestCompletionNotificationAt)

				if num then
					if now - num < n5 then
						return false
					end
				end

				local acceptedQuestKey = arg.acceptedQuestKey or arg.levelQuestKey
				arg.completedQuestSequence = (tonumber(arg.completedQuestSequence) or 0) + 1
				arg.lastCompletedQuestKey = acceptedQuestKey
				arg.lastCompletedQuestAt = now

				if fn(acceptedQuestKey, arg.levelQuestKey) then
					arg.completedLevelQuestSequence = (tonumber(arg.completedLevelQuestSequence) or 0) + 1
					arg.lastCompletedLevelQuestKey = arg.levelQuestKey
					arg.lastCompletedLevelQuestAt = now
				end

				arg.lastQuestCompletionNotificationAt = now
				arg.lastQuestCompletionSource = lastQuestCompletionSource or "notification"
				arg.lastQuestCompletionText = tostring(arg2 or "")
				arg.questCompletionPending = true
				fn2(arg)
				return true
			end

			return false
		end,
	}

	local function fn3(seahubQuestNotificationBridge, arg)
		local seahubQuestNotificationBridge2 = seahubQuestNotificationBridge

		if seahubQuestNotificationBridge2 then
			seahubQuestNotificationBridge2 = seahubQuestNotificationBridge.context
		end

		local seahubQuestNotificationBridge3 = seahubQuestNotificationBridge2

		if seahubQuestNotificationBridge3 then
			seahubQuestNotificationBridge3 = seahubQuestNotificationBridge2.State
		end

		if not seahubQuestNotificationBridge3 then
			return false
		end

		if not seahubQuestNotificationBridge3.stopped then
			if tbl11.record(seahubQuestNotificationBridge3, arg, nil, "notification") then
				local functions = seahubQuestNotificationBridge2.Functions or {}

				if type(functions.ReleaseBring) == "function" then
					pcall(functions.ReleaseBring)
				end

				if type(functions.CancelTween) == "function" then
					pcall(functions.CancelTween)
				end

				if type(functions.StopAttack) == "function" then
					pcall(functions.StopAttack)
				end

				seahubQuestNotificationBridge3.status = "Auto Farm Level | Quest completed"
				return true
			end

			return false
		end

		return false
	end

	tbl11.attach = function(context)
		if type(context) ~= "table" then
			return false, "context-unavailable"
		end
		local environment = context.Environment

		if not environment then
			environment = getgenv

			if environment then
				environment = getgenv()
			end

			environment = environment or _G
		end

		local seahubQuestNotificationBridge = environment.__SEAHUB_QUEST_NOTIFICATION_BRIDGE

		if type(seahubQuestNotificationBridge) ~= "table" then
			seahubQuestNotificationBridge = {}
			environment.__SEAHUB_QUEST_NOTIFICATION_BRIDGE = seahubQuestNotificationBridge
		end

		seahubQuestNotificationBridge.context = context

		seahubQuestNotificationBridge.callback = function(arg)
			return fn3(seahubQuestNotificationBridge, arg)
		end

		environment.NotificationCallBack = seahubQuestNotificationBridge.callback

		if seahubQuestNotificationBridge.hookInstalled then
			context.State.questNotificationBridgeReady = true
			context.State.questNotificationBridgeError = nil
			return true
		end

		local hookfunction_ = environment.hookfunction or hookfunction

		if type(hookfunction_) ~= "function" then
			context.State.questNotificationBridgeReady = false
			context.State.questNotificationBridgeError = "hookfunction-unavailable"
			return false, context.State.questNotificationBridgeError
		end

		local notification = game:GetService("ReplicatedStorage"):FindFirstChild("Notification")

		if notification then
			local ok, result = pcall(require, notification)

			if ok then
				if type(result) == "table" then
					if type(result.new) == "function" then
						local original = nil

						local function fn4(arg, ...)
							local v = nil
							local v2 = arg
							local callback = seahubQuestNotificationBridge.callback

							if type(callback) == "function" then
								pcall(callback, v2)
							end

							return original(v2, ...)
						end

						local newcclosure_ = environment.newcclosure or newcclosure

						if type(newcclosure_) == "function" then
							fn4 = newcclosure_(fn4)
						end

						local ok2, result2 = pcall(function()
							original = hookfunction_(result.new, fn4)
						end)

						if ok2 then
							if type(original) == "function" then
								seahubQuestNotificationBridge.hookInstalled = true
								seahubQuestNotificationBridge.original = original
								context.State.questNotificationBridgeReady = true
								context.State.questNotificationBridgeError = nil
								return true
							end
						end

						context.State.questNotificationBridgeReady = false
						local state = context.State
						local ok3 = ok2

						if ok3 then
							ok3 = "notification-hook-rejected"
						end

						state.questNotificationBridgeError = ok3 or tostring(result2)
						return false, context.State.questNotificationBridgeError
					end
				end
			end

			context.State.questNotificationBridgeReady = false
			context.State.questNotificationBridgeError = "notification-api-unavailable"
			return false, context.State.questNotificationBridgeError
		end

		context.State.questNotificationBridgeReady = false
		context.State.questNotificationBridgeError = "notification-module-unavailable"
		return false, context.State.questNotificationBridgeError
	end

	tbl11.detach = function(arg)
		local environment = arg

		if environment then
			environment = arg.Environment
		end

		if not environment then
			environment = getgenv

			if environment then
				environment = getgenv()
			end

			environment = environment or _G
		end

		local environment2 = environment

		if environment2 then
			environment2 = environment.__SEAHUB_QUEST_NOTIFICATION_BRIDGE
		end

		if type(environment2) == "table" then
			if environment2.context == arg then
				environment2.context = nil
			end
		end
	end
end

local tbl12

do
	local n5 = 2

	local function getMatches(arg)
		local matches = {}
		local lower = string.lower
		local v = tostring
		local str = arg or ""

		for match in lower(v(str)):gmatch("[a-z0-9]+") do
			if #match > 3 then
				if match:sub(-1) == "s" then
					match = match:sub(1, -2)
				end
			end

			matches[match] = true
		end

		return matches
	end

	local function fn(arg, arg2)
		local matches = getMatches(arg)
		local count = 0

		for k in getMatches(arg2), nil do
			if matches[k] then
				count += 1
			end
		end

		if count >= 2 then
			return true
		end
		local match2 = nil
		local lower = string.lower
		local v = tostring
		local str = arg2 or ""

		for match in lower(v(str)):gmatch("[a-z0-9]+") do
			match2 = match
		end

		if match2 then
			if #match2 > 3 then
				if match2:sub(-1) == "s" then
					match2 = match2:sub(1, -2)
				end
			end
		end

		local flag = match2 ~= nil

		if flag then
			flag = matches[match2] == true
		end

		return flag
	end

	local function fn2(arg, arg2)
		local flag = arg.level_req <= arg2

		if flag then
			flag = arg.arya_blacklisted ~= true
		end

		return flag
	end

	local function fn3(acceptedQuestKey, levelQuestKey)
		if acceptedQuestKey == nil then
			return false
		end

		if levelQuestKey ~= nil then
			local str = tostring(acceptedQuestKey)
			local str2 = tostring(levelQuestKey)
			if str == str2 then
				return true
			end
			return str:sub(-(#str2 + 1)) == "\0" .. str2
		end

		return false
	end

	local function fn4(arg, arg2)
		local v = nil

		for _, v2 in arg do
			if arg2 < v2.level_req then
				break
			end

			if fn2(v2, arg2) then
				v = v2
			end
		end

		local questName = v

		if questName then
			questName = v.quest_name
		end

		return questName or nil, v
	end

	local function fn5(arg, arg2, arg3)
		local tbl13 = {}

		for _, v in arg do
			if v.quest_name == arg2 then
				if fn2(v, arg3) then
					tbl13[#tbl13 + 1] = v
				end
			end
		end

		table.sort(tbl13, function(arg4, arg5)
			if arg4.quest_num == arg5.quest_num then
				return arg4.level_req < arg5.level_req
			end
			return arg4.quest_num < arg5.quest_num
		end)

		while n5 < #tbl13 do
			table.remove(tbl13, n5 + 1)
		end

		return tbl13
	end

	tbl12 = {
		select = function(arg, arg2, arg3, arg4)
			local tbl13 = arg3 or {}
			local n6 = tonumber(arg2) or 0
			local v, v2 = fn4(arg, n6)
			if not v then
				return nil
			end
			local levelQuestCompletionSequence = tonumber(tbl13.completedLevelQuestSequence) or 0
			local levelQuestFamily = tbl13.levelQuestFamily
			local levelQuestTurn = tonumber(tbl13.levelQuestTurn)
			local num = tonumber(tbl13.levelQuestCompletionSequence)
			local n7 = num

			if n7 then
				n7 = math.max(0, levelQuestCompletionSequence - num)
			end

			n7 = n7 or 0
			local levelQuestFamily2 = levelQuestFamily
			local levelQuestFamily3 = levelQuestFamily

			if levelQuestFamily3 then
				levelQuestFamily3 = fn5(arg, levelQuestFamily, n6)
			end

			local v3 = (levelQuestFamily3 or {})[levelQuestTurn or 1]
			local flag = fn3(tbl13.acceptedQuestKey, tbl13.levelQuestKey)

			if flag then
				if levelQuestFamily2 then
					if n7 > 0 then
						levelQuestFamily2 = v
					elseif levelQuestFamily2 ~= v then
						if not flag then
							levelQuestFamily2 = v
						end
					end
				else
					levelQuestFamily2 = v
				end
			else
				flag = v3 ~= nil

				if flag then
					flag = arg4 ~= nil
				end

				if flag then
					flag = fn(arg4, v3.mob_name)

					if levelQuestFamily2 then
						if n7 > 0 then
							levelQuestFamily2 = v
						elseif levelQuestFamily2 ~= v then
							if not flag then
								levelQuestFamily2 = v
							end
						end
					else
						levelQuestFamily2 = v
					end
				elseif levelQuestFamily2 then
					if n7 > 0 then
						levelQuestFamily2 = v
					elseif levelQuestFamily2 ~= v then
						if not flag then
							levelQuestFamily2 = v
						end
					end
				else
					levelQuestFamily2 = v
				end
			end

			local levelQuestTurns = fn5(arg, levelQuestFamily2, n6)

			if #levelQuestTurns == 0 then
				levelQuestFamily2 = v
				levelQuestTurns = fn5(arg, levelQuestFamily2, n6)
				if #levelQuestTurns == 0 then
					return nil
				end
			elseif #levelQuestTurns == 0 then
				return nil
			end

			if levelQuestFamily == nil then
				local flag2 = #levelQuestTurns > 1

				if flag2 then
					flag2 = 2
				end

				levelQuestTurn = flag2 or 1
			elseif levelQuestFamily ~= levelQuestFamily2 then
				levelQuestTurn = 1
			elseif n7 > 0 then
				if #levelQuestTurns > 1 then
					levelQuestTurn = ((levelQuestTurn or 1) - 1 + n7) % #levelQuestTurns + 1
				elseif levelQuestTurn then
					if not (levelQuestTurn < 1) then
						if #levelQuestTurns < levelQuestTurn then
							levelQuestTurn = 1
						elseif #levelQuestTurns == 1 then
							levelQuestTurn = 1
						end
					else
						levelQuestTurn = 1
					end
				else
					levelQuestTurn = 1
				end
			elseif levelQuestTurn then
				if not (levelQuestTurn < 1) then
					if #levelQuestTurns < levelQuestTurn then
						levelQuestTurn = 1
					elseif #levelQuestTurns == 1 then
						levelQuestTurn = 1
					end
				else
					levelQuestTurn = 1
				end
			else
				levelQuestTurn = 1
			end

			local levelQuestTurn2 = levelQuestTurns[levelQuestTurn]

			if not levelQuestTurn2 then
				levelQuestTurn2 = v2
				local exitTo = nil

				for _, v4 in levelQuestTurns do
					if v4.quest_num == levelQuestTurn2.quest_num then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					local v4
					levelQuestTurn = v4
				end
			end

			tbl13.levelQuestFamily = levelQuestFamily2
			tbl13.levelQuestTurn = levelQuestTurn
			tbl13.levelQuestCompletionSequence = levelQuestCompletionSequence
			tbl13.levelQuestKey = levelQuestFamily2 .. "\0" .. tostring(levelQuestTurn2.quest_num)
			tbl13.levelQuestActiveMatches = fn(arg4, levelQuestTurn2.mob_name)
			local levelQuestReason = levelQuestFamily == nil

			if levelQuestReason then
				levelQuestReason = "runtime-enter"
			end

			if not levelQuestReason then
				levelQuestReason = levelQuestFamily ~= levelQuestFamily2

				if levelQuestReason then
					levelQuestReason = "family-enter"
				end
			end

			if not levelQuestReason then
				levelQuestReason = n7 > 0

				if levelQuestReason then
					levelQuestReason = "quest-completed"
				end
			end

			tbl13.levelQuestReason = levelQuestReason or "quest-in-progress"
			tbl13.questCompletionPending = false
			return table.clone(levelQuestTurn2)
		end,
		titleMatchesMob = fn,
		unlockedFamilyEntries = fn5,
	}
end

local tbl13

do
	tbl13 = {
		decide = function(arg)
			local tbl14 = arg or {}
			local n5 = math.clamp(math.floor(tonumber(tbl14.sea) or 1), 1, 3)
			local n6 = tonumber(tbl14.level) or 0
			local n7 = math.max(0, tonumber(tbl14.bones) or 0)
			local n8 = math.max(0, tonumber(tbl14.expBoostRemaining) or 0)
			local n9 = nil

			if n5 == 1 then
				if n6 < 20 then
					n9 = 1
				elseif n6 <= 70 then
					n9 = 2
				end
			end

			local flag = n6 >= 2025
			local flag2 = n6 >= 2200

			if flag2 then
				flag2 = n6 < 2800
			end

			local tbl15 = { skipFloor = n9 }
			local farmBones = n5 == 3

			if farmBones then
				farmBones = n6 >= 1975
			end

			if farmBones then
				farmBones = n6 <= 2800
			end

			if farmBones then
				farmBones = tbl14.dragonTalonNeedsEssence == true
			end

			if farmBones then
				farmBones = n8 <= 0
			end

			if farmBones then
				farmBones = n7 < 500
			end

			if farmBones then
				farmBones = tbl14.rollCooldownReady ~= false
			end

			tbl15.farmBones = farmBones
			local farmCake = n5 == 3

			if farmCake then
				farmCake = tbl14.hasSweetChalice == true

				if not farmCake then
					farmCake = n6 == 2800

					if farmCake then
						farmCake = n7 >= 500
					end
				end
			end

			tbl15.farmCake = farmCake
			local boneQuestName = flag

			if boneQuestName then
				boneQuestName = "HauntedQuest2"
			end

			tbl15.boneQuestName = boneQuestName or nil
			local boneQuestNumber = flag

			if boneQuestNumber then
				boneQuestNumber = 1
			end

			tbl15.boneQuestNumber = boneQuestNumber or nil
			local cakeQuestName = flag2

			if cakeQuestName then
				cakeQuestName = "CakeQuest1"
			end

			tbl15.cakeQuestName = cakeQuestName or nil
			local cakeQuestNumber = flag2

			if cakeQuestNumber then
				cakeQuestNumber = 1
			end

			tbl15.cakeQuestNumber = cakeQuestNumber or nil
			return tbl15
		end,
		skipFloor = function(arg, arg2)
			return tbl13.decide({ sea = arg, level = arg2 }).skipFloor
		end,
		shouldFarmBones = function(arg)
			return tbl13.decide(arg).farmBones
		end,
		shouldFarmCake = function(arg)
			return tbl13.decide(arg).farmCake
		end,
		boneQuest = function(arg)
			local v = tbl13.decide({ sea = 3, level = arg })
			return v.boneQuestName, v.boneQuestNumber
		end,
		cakeQuest = function(arg)
			local v = tbl13.decide({ sea = 3, level = arg })
			return v.cakeQuestName, v.cakeQuestNumber
		end,
	}
end

local tbl14

do
	local tbl15 = {
		[2753915549] = 1,
		[4442272183] = 2,
		[7449423635] = 3,
		[85211729168715] = 1,
		[79091703265657] = 2,
		[100117331123089] = 3,
	}

	local tbl16 = {
		BartiloQuest = true,
		CitizenQuest = true,
		Trainees = true,
		ImpelQuest = true,
		MarineQuest = true,
	}

	local tbl17 = { { 0, 699 }, { 700, 1499 }, { 1500, math.huge } }

	local function fn()
		local map = workspace

		if map then
			map = workspace:FindFirstChild("Map")
		end

		if not map then
			return nil
		end

		if map:FindFirstChild("Dressrosa") then
			if map:FindFirstChild("GreenBit") then
				return 2
			end
		end

		if not map:FindFirstChild("HauntedCastle") then
			if not map:FindFirstChild("TikiOutpost") then
				if not map:FindFirstChild("GreatTree") then
					return 1
				end
			end
		end

		return 3
	end

	local tbl18 = {
		[2] = {
			{
				id = "MarineQuest3",
				level_req = 925,
				family_level_req = 875,
				next_family_level_req = 950,
				quest_name = "MarineQuest3",
				quest_num = 3,
				mob_name = "Orbitus",
				boss_name = "Orbitus",
				quest_pos = CFrame.new(-2440.79638671875, 71.714073181152344, -3216.068115234375),
				boss_pos = CFrame.new(-2115.612548828125, 104.06766510009766, -4352.3525390625),
			},
			{
				id = "IceSideQuest",
				level_req = 1150,
				family_level_req = 1100,
				next_family_level_req = 1175,
				quest_name = "IceSideQuest",
				quest_num = 3,
				mob_name = "Smoke Admiral",
				boss_name = "Smoke Admiral",
				quest_pos = CFrame.new(-6231.98291015625, 81.804855346679688, -4852.8056640625),
				boss_pos = CFrame.new(-4857.3583984375, 238.67784118652344, -5583.2431640625),
			},
			{
				id = "FrostQuest",
				level_req = 1400,
				family_level_req = 1350,
				next_family_level_req = 1425,
				quest_name = "FrostQuest",
				quest_num = 3,
				mob_name = "Awakened Ice Admiral",
				boss_name = "Awakened Ice Admiral",
				quest_pos = CFrame.new(5667.658203125, 26.799781799316406, -6486.08984375),
				boss_pos = CFrame.new(6407, 340, -6892),
			},
			{
				id = "ForgottenQuest",
				level_req = 1475,
				family_level_req = 1425,
				quest_name = "ForgottenQuest",
				quest_num = 3,
				mob_name = "Tide Keeper",
				boss_name = "Tide Keeper",
				quest_pos = CFrame.new(-3054.444580078125, 238.34426879882812, -10142.8193359375),
				boss_pos = CFrame.new(-3570, 123, -11555),
			},
		},
		[3] = {
			{
				id = "PiratePortQuest",
				level_req = 1550,
				family_level_req = 1500,
				next_family_level_req = 1575,
				quest_name = "PiratePortQuest",
				quest_num = 3,
				mob_name = "Stone",
				boss_name = "Stone",
				quest_pos = CFrame.new(-290.07467651367188, 42.903465270996094, 5581.58984375),
				boss_pos = CFrame.new(-1109.92626953125, 51.648460388183594, 6811.72607421875),
			},
			{
				id = "VenomCrewQuest",
				level_req = 1675,
				family_level_req = 1625,
				next_family_level_req = 1700,
				quest_name = "VenomCrewQuest",
				quest_num = 3,
				mob_name = "Hydra Leader",
				boss_name = "Hydra Leader",
				quest_pos = CFrame.new(5214.33935546875, 1003.4676513671875, 759.50732421875),
				boss_pos = CFrame.new(5836.02783203125, 1035.16357421875, 6.2133297920227051),
			},
			{
				id = "MarineTreeIsland",
				level_req = 1750,
				family_level_req = 1700,
				next_family_level_req = 1775,
				quest_name = "MarineTreeIsland",
				quest_num = 3,
				mob_name = "Kilo Admiral",
				boss_name = "Kilo Admiral",
				quest_pos = CFrame.new(2485.7333984375, 73.345993041992188, -6788.62548828125),
				boss_pos = CFrame.new(2998.294921875, 508.33074951171875, -7344.32177734375),
			},
			{
				id = "DeepForestIsland",
				level_req = 1875,
				family_level_req = 1825,
				next_family_level_req = 1900,
				quest_name = "DeepForestIsland",
				quest_num = 3,
				mob_name = "Captain Elephant",
				boss_name = "Captain Elephant",
				quest_pos = CFrame.new(-13234.0400390625, 331.48849487304688, -7625.4013671875),
				boss_pos = CFrame.new(-13365.5302734375, 318.64077758789062, -8484.98828125),
			},
			{
				id = "DeepForestIsland2",
				level_req = 1950,
				family_level_req = 1900,
				next_family_level_req = 1975,
				quest_name = "DeepForestIsland2",
				quest_num = 3,
				mob_name = "Beautiful Pirate",
				boss_name = "Beautiful Pirate",
				quest_pos = CFrame.new(-12680.3818359375, 389.97103881835938, -9902.01953125),
				boss_pos = CFrame.new(5367.31494140625, 21.144540786743164, -64.699249267578125),
			},
			{
				id = "IceCreamIslandQuest",
				level_req = 2175,
				family_level_req = 2125,
				next_family_level_req = 2200,
				quest_name = "IceCreamIslandQuest",
				quest_num = 3,
				mob_name = "Cake Queen",
				boss_name = "Cake Queen",
				quest_pos = CFrame.new(-819.376708984375, 64.925979614257812, -10967.283203125),
				boss_pos = CFrame.new(-678.47802734375, 381.85699462890625, -11114.345703125),
			},
		},
	}

	local function fn2(arg)
		local tbl19 = {}
		local tbl20 = arg or {}

		for k, v in tbl20 do
			tbl19[k] = v
		end

		return tbl19
	end

	local function fn3(arg)
		local task_ = type(arg) == "table"

		if task_ then
			task_ = arg.Task
		end

		task_ = task_ or {}

		for k, v in task_ do
			if tonumber(v) == 1 then
				return tostring(k)
			end
		end

		return nil
	end

	local function fn4(arg)
		local tbl19 = {}
		local tbl20 = tbl18[arg] or {}

		for _, v in tbl20 do
			tbl19[v.quest_name] = v
		end

		return tbl19
	end

	local function getOk()
		if not game then
			return nil
		end

		if type(game.GetService) ~= "function" then
			return nil
		end
		local quests = game:GetService("ReplicatedStorage"):FindFirstChild("Quests")

		if quests then
			local ok, result = pcall(require, quests)
			local ok2 = ok

			if ok2 then
				ok2 = type(result) == "table"
			end

			if ok2 then
				ok2 = result
			end

			return ok2 or nil
		end

		return nil
	end

	tbl14 = {
		mergeLive = function(arg, arg2)
			local v = tbl17[arg]

			if v then
				if type(arg2) == "table" then
					local tbl19 = {}

					for k, v2 in arg2 do
						local flag = type(v2) == "table"

						if flag then
							flag = v2[1]
						end

						local num = flag

						if num then
							num = tonumber(flag.LevelReq)
						end

						if not num then
							continue
						end

						if v[1] <= num then
							if num <= v[2] then
								if not tbl16[k] then
									tbl19[#tbl19 + 1] = { name = k, entries = v2, level = num }
								end
							end
						end
					end

					table.sort(tbl19, function(arg3, arg4)
						if arg3.level ~= arg4.level then
							return arg3.level < arg4.level
						end
						return arg3.name < arg4.name
					end)

					local v2 = fn4(arg)
					local tbl20 = {}

					for k, v3 in tbl19 do
						local v4 = tbl19[k + 1]
						local level = v4

						if level then
							level = v4.level
						end

						level = level or math.huge

						for k2, v5 in v3.entries do
							local mobName = fn3(v5)
							local levelReq = tonumber(v5.LevelReq)
							if not mobName then
								continue
							end

							if not levelReq then
								continue
							end

							if not (levelReq <= v[2]) then
								continue
							end
							local v6 = fn2(v2[v3.name])
							v6.id = v3.name
							v6.level_req = levelReq
							v6.family_level_req = v3.level
							v6.next_family_level_req = level
							v6.quest_name = v3.name
							v6.quest_num = k2
							v6.mob_name = mobName
							v6.boss_name = mobName
							v6.quest_required = 1
							v6.accepted_name = v5.Name
							v6.live_quest_data = true
							tbl20[#tbl20 + 1] = v6
							continue
						end
					end

					return tbl20
				end
			end

			return {}
		end,
		forSea = function(arg)
			return tbl18[arg] or {}
		end,
		forPlace = function(arg)
			local v = tbl15[arg] or fn()
			local v2 = tbl14.mergeLive(v, getOk())
			if #v2 > 0 then
				return v2
			end
			return tbl14.forSea(v)
		end,
	}
end

local tbl15 = { run = function(...)
	local v = ...
	local value = select(2, ...)
	local v2 = nil

	for _, v3 in v.State.questData do
		if value < v3.level_req then
			break
		end

		if v3.arya_blacklisted ~= true then
			v2 = v3
		end
	end

	if not v2 then
		return nil
	end
	local v3 = table.clone(v2)

	if value < 10 then
		if v.LocalPlayer.Team then
			if v.LocalPlayer.Team.Name == "Marines" then
				v3.mob_name = "Trainee"
				v3.quest_name = "MarineQuest"
				v3.quest_num = 1
			end
		end
	end

	v3.mob_pos = v.Functions.ResolveMobCFrame(v3.mob_name, v3.mob_pos)
	return v3
end }

local tbl16

do
	tbl16 = { run = function(arg, arg2)
		if type(arg2) ~= "string" then
			return ""
		end
		return arg2:gsub("%s*%[.*$", ""):match("^%s*(.-)%s*$") or ""
	end }
end

local tbl17 = { run = function(arg, arg2, arg3)
	local v = arg.Functions.NormalizeEnemyName(arg2)
	local now = os.clock()
	arg.MobCFrameCache = arg.MobCFrameCache or {}
	local v2 = arg.MobCFrameCache[v]

	if v2 then
		if now - v2.time < 5 then
			return v2.cframe
		end
	end

	local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
	local tbl17 = {}
	local fortBuilderReplicatedSpawnPositi = game:GetService("ReplicatedStorage"):FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
	local worldOrigin2 = worldOrigin

	if worldOrigin2 then
		worldOrigin2 = worldOrigin:FindFirstChild("EnemySpawns")
	end

	tbl17[1] = fortBuilderReplicatedSpawnPositi
	tbl17[2] = worldOrigin2
	local character = arg.LocalPlayer.Character
	local character2 = character

	if character2 then
		character2 = character:FindFirstChild("HumanoidRootPart")
	end

	local position = typeof(arg3) == "CFrame"

	if position then
		position = arg3.Position
	end

	if not position then
		position = character2

		if position then
			position = character2.Position
		end
	end

	local v3 = nil
	local position2 = math.huge

	for _, instance in tbl17 do
		local instance3 = instance

		if instance3 then
			instance3 = instance:GetChildren()
		end

		instance3 = instance3 or {}

		for _, instance2 in instance3 do
			if arg.Functions.NormalizeEnemyName(instance2.Name) ~= v then
				continue
			end

			local ok, result = pcall(function()
				local isBasePart = instance2:IsA("BasePart")

				if isBasePart then
					isBasePart = instance2.CFrame
				end

				return isBasePart or instance2:GetPivot()
			end)

			if not ok then
				continue
			end
			local position3 = position

			if position3 then
				position3 = (result.Position - position).Magnitude
			end

			position3 = position3 or 0

			if position3 < position2 then
				v3 = result
				position2 = position3
			end

			continue
		end
	end

	if v3 then
		local cframe = CFrame.new(v3.Position + Vector3.new(0, 30, 0))
		arg.MobCFrameCache[v] = { time = now, cframe = cframe }
		return cframe
	end

	return arg3
end }

local tbl18 = { run = function(arg, arg2, arg3)
	local v = nil

	for _, v2 in arg.State.bossQuestData do
		if not (v2.level_req <= arg2) then
			continue
		end

		if arg3 then
			if v2.boss_name ~= arg3 then
				continue
			end
		end

		if v then
			if not (v.level_req < v2.level_req) then
				continue
			end
		end

		v = v2
	end

	return v
end }

local tbl19 = { run = function(arg, arg2)
	local enemies = workspace:FindFirstChild("Enemies")
	if not enemies then
		return nil
	end

	for _, instance in enemies:GetChildren() do
		local humanoid = instance:FindFirstChildOfClass("Humanoid")
		if instance.Name ~= arg2 then
			continue
		end

		if not humanoid then
			continue
		end

		if humanoid.Health > 0 then
			if instance:FindFirstChild("HumanoidRootPart") then
				return instance
			end
		end
	end

	return nil
end }

local tbl20 = { run = function(arg, arg2)
	local liveBoss = arg.Functions.GetLiveBoss(arg2)
	if liveBoss then
		return liveBoss:GetPivot()
	end
	local mobSpawns = arg.MobSpawns

	if mobSpawns then
		mobSpawns = arg.MobSpawns[arg2]
	end

	if typeof(mobSpawns) == "CFrame" then
		return mobSpawns
	end
	return "undefined"
end }

local tbl21

do
	tbl21 = { run = function(arg)
		local state = arg.State
		local farmWatchdog = state.farmWatchdog
		if farmWatchdog then
			arg.FarmWatchdogState = farmWatchdog
			return farmWatchdog
		end

		if arg.FarmWatchdogState then
			state.farmWatchdog = arg.FarmWatchdogState
			return arg.FarmWatchdogState
		end
		local farmWatchdog2 = { LastProgressAt = os.clock(), Config = {} }
		state.farmWatchdog = farmWatchdog2
		arg.FarmWatchdogState = farmWatchdog2

		if arg.Environment then
			arg.Environment.__SEAHUB_FARM_WATCHDOG = farmWatchdog2
		end

		return farmWatchdog2
	end }
end

local tbl22

do
	local function fn(arg)
		if typeof(arg) ~= "CFrame" then
			return false
		end
		local position = arg.Position
		local flag = position.X == position.X

		if flag then
			flag = position.Y == position.Y
		end

		if flag then
			flag = position.Z == position.Z
		end

		if flag then
			flag = math.abs(position.X) <= 250000
		end

		if flag then
			flag = math.abs(position.Z) <= 250000
		end

		if flag then
			flag = position.Y >= -5000
		end

		if flag then
			flag = position.Y <= 50000
		end

		return flag
	end

	tbl22 = { run = function(arg, arg2)
		if type(arg2) ~= "table" then
			return nil, nil, "invalid-quest"
		end

		if arg.GetQuestNpcCFrame then
			local questNpcCFrame, v = arg.GetQuestNpcCFrame(arg2.level_req, arg2.quest_pos)
			if fn(questNpcCFrame) then
				return questNpcCFrame, v, "guide-module"
			end
		end

		local questNpcNames = arg.QuestNpcNames

		if questNpcNames then
			questNpcNames = arg.QuestNpcNames[arg2.quest_name]
		end

		if questNpcNames then
			if arg.GetNPCCFrame then
				local npccFrame = arg.GetNPCCFrame(questNpcNames, arg2.quest_pos)

				if fn(npccFrame) then
					if not fn(arg2.quest_pos) then
						return npccFrame, questNpcNames, "live-npc"
					end

					if (npccFrame.Position - arg2.quest_pos.Position).Magnitude <= 3000 then
						return npccFrame, questNpcNames, "live-npc"
					end

					if arg.DynamicNpcCFrames then
						arg.DynamicNpcCFrames[questNpcNames] = nil
						if fn(arg2.quest_pos) then
							return arg2.quest_pos, questNpcNames, "quest-data"
						end
						return nil, questNpcNames, "missing"
					end

					if fn(arg2.quest_pos) then
						return arg2.quest_pos, questNpcNames, "quest-data"
					end
					return nil, questNpcNames, "missing"
				end

				if fn(arg2.quest_pos) then
					return arg2.quest_pos, questNpcNames, "quest-data"
				end
				return nil, questNpcNames, "missing"
			end

			if fn(arg2.quest_pos) then
				return arg2.quest_pos, questNpcNames, "quest-data"
			end
			return nil, questNpcNames, "missing"
		end

		if fn(arg2.quest_pos) then
			return arg2.quest_pos, questNpcNames, "quest-data"
		end
		return nil, questNpcNames, "missing"
	end }
end

local tbl23

do
	local n5 = 8
	local n6 = 1.5
	local n7 = 0.5
	local n8 = 0.75
	local n9 = 300
	local n10 = 2
	local n11 = 300
	local n12 = 75

	local function fn(arg)
		local functions = arg.Functions

		if type(functions.StopAttack) == "function" then
			pcall(functions.StopAttack)
		else
			table.clear(arg.NearbyTargets)
			table.clear(arg.NearbyTargetParts)
		end

		if type(functions.ReleaseBring) == "function" then
			pcall(functions.ReleaseBring)
		end
	end

	local function getMatches(arg)
		local matches = {}
		local lower = string.lower
		local v = tostring
		local str = arg or ""

		for match in lower(v(str)):gmatch("[a-z0-9]+") do
			if #match > 3 then
				if match:sub(-1) == "s" then
					match = match:sub(1, -2)
				end
			end

			matches[match] = true
		end

		return matches
	end

	local function fn2(arg, mobName)
		local matches = getMatches(arg)
		local count = 0

		for k in getMatches(mobName), nil do
			if matches[k] then
				count += 1
			end
		end

		if count >= 2 then
			return true
		end
		local match2 = nil
		local lower = string.lower
		local v = tostring
		local mobName2 = mobName or ""

		for match in lower(v(mobName2)):gmatch("[a-z0-9]+") do
			match2 = match
		end

		if match2 then
			if #match2 > 3 then
				if match2:sub(-1) == "s" then
					match2 = match2:sub(1, -2)
				end
			end
		end

		local flag = match2 ~= nil

		if flag then
			flag = matches[match2] == true
		end

		return flag
	end

	local function fn3(questAcquire, ok, arg, arg2)
		if ok then
			questAcquire[arg2] = arg
			questAcquire.lastError = nil
		else
			questAcquire[arg2] = nil
			questAcquire.lastError = tostring(arg)
		end
	end

	tbl23 = { run = function(arg, arg2, arg3)
		local functions = arg.Functions
		local state = arg.State
		if arg.TaskQueue:top() ~= arg3 then
			return false
		end
		local quest, v = arg.ReadQuest()
		local str = tostring(v or "")
		local acceptedQuestKey = arg3 .. "\0" .. tostring(arg2.quest_name) .. "\0" .. tostring(arg2.quest_num)
		local now = os.clock()
		local num = tonumber(state.lastQuestCompletionNotificationAt)
		local questAcquire, n13, ok, result, character, character2, humanoidRootPart, questGiverCFrame, npcName, positionSource, magnitude, flag, n14, n15, ok2, result2, quest2, v2, lockedUntilLevel, acceptedQuestRequired

		if quest then
			if num then
				if now - num < n8 then
					state.status = arg3 .. " | Waiting quest completion"
					return false
				end
			end

			if fn2(str, arg2.mob_name) then
				local flag2 = state.acceptedQuestKey ~= acceptedQuestKey
				state.questAcquire = nil
				state.questTarget = arg2.mob_name
				state.acceptedQuestKey = acceptedQuestKey
				state.acceptedQuestAt = state.acceptedQuestAt or now
				state.acceptedQuestConfirmed = true

				if flag2 then
					state.acceptedQuestKills = 0
					state.acceptedQuestRequired = tonumber(arg2.quest_required) or 8
				end

				state.acceptedQuestRequired = state.acceptedQuestRequired or tonumber(arg2.quest_required) or 8
				local match, v3 = str:match("(%d+)%s*/%s*(%d+)")

				if match then
					if v3 then
						state.acceptedQuestKills = tonumber(match) or state.acceptedQuestKills
						state.acceptedQuestRequired = tonumber(v3) or state.acceptedQuestRequired
					end
				end

				state.lastQuestSeenAt = now
				return true
			end

			questAcquire = state.questAcquire

			if questAcquire then
				if questAcquire.key ~= acceptedQuestKey then
					questAcquire = {
						key = acceptedQuestKey,
						startedAt = now,
						attempts = 0,
						nextRequestAt = now + n10,
						nextAbandonAt = 0,
					}

					state.questAcquire = questAcquire
				end
			else
				questAcquire = {
					key = acceptedQuestKey,
					startedAt = now,
					attempts = 0,
					nextRequestAt = now + n10,
					nextAbandonAt = 0,
				}

				state.questAcquire = questAcquire
			end

			state.questTarget = arg2.mob_name
			n13 = 276808444

			if quest then
				state.acceptedQuestKey = nil
				state.acceptedQuestAt = nil
				state.acceptedQuestConfirmed = nil
				state.lastQuestSeenAt = nil
				questAcquire.acceptedAt = nil

				if questAcquire.nextAbandonAt <= now then
					questAcquire.nextAbandonAt = now + 3

					ok, result = pcall(function()
						return arg.QuestRemote:InvokeServer("AbandonQuest")
					end)

					fn3(questAcquire, ok, result, "lastAbandonResult")
					state.lastQuestAbandon = { At = now, Result = result, Ok = ok, Title = str }
				end

				if state.movement then
					functions.CancelTween()
				end

				fn(arg)
				state.status = arg3 .. " | Abandoning wrong quest"
				return false
			end

			character = arg.LocalPlayer.Character
			character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			if character then
				humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					if character2 then
						if not (character2.Health <= 0) then
							questGiverCFrame, npcName, positionSource = functions.GetQuestGiverCFrame(arg2)
							questAcquire.npcName = npcName
							questAcquire.positionSource = positionSource

							if typeof(questGiverCFrame) ~= "CFrame" then
								questAcquire.lastError = "quest-giver-unavailable"
								state.status = arg3 .. " | Quest giver unavailable"
								return false
							end

							magnitude = (humanoidRootPart.Position - questGiverCFrame.Position).Magnitude
							questAcquire.distance = magnitude

							if n5 < magnitude then
								state.status = arg3 .. " | Moving to quest giver"
								functions.TP(questGiverCFrame + Vector3.new(0, 3, 0), arg3, nil, nil, nil, nil, n11, n12)
								return false
							end

							if state.movement then
								functions.CancelTween()
							end

							if questAcquire.lockedUntilLevel then
								if arg.Level.Value < questAcquire.lockedUntilLevel then
									state.status = arg3 .. " | Quest locked until level " .. tostring(questAcquire.lockedUntilLevel)
									return false
								end
							end

							if questAcquire.lockedUntilLevel then
								questAcquire.lockedUntilLevel = nil
								questAcquire.nextRequestAt = 0
							end

							if questAcquire.acceptedAt then
								if now - questAcquire.acceptedAt < 4 then
									state.status = arg3 .. " | Waiting quest confirmation"
									return false
								end
							end

							if now < questAcquire.nextRequestAt then
								if magnitude <= n5 then
									flag = questAcquire.lastResult == 1

									if flag then
										flag = " | Quest request rejected"
									end

									flag = flag or " | Waiting quest confirmation"
									state.status = arg3 .. flag
								end

								return false
							end

							if arg.TaskQueue:top() ~= arg3 then
								return false
							end
							questAcquire.attempts += 1
							questAcquire.requestedAt = now
							state.lastQuestRequestAt = now
							n14 = nil
							n15 = nil

							ok2, result2 = pcall(function()
								n14 = 613203455
								n15 = 666854931
								return arg.QuestRemote:InvokeServer("StartQuest", arg2.quest_name, arg2.quest_num)
							end)

							fn3(questAcquire, ok2, result2, "lastResult")

							state.lastQuestRequest = {
								At = now,
								Quest = arg2.quest_name,
								Number = arg2.quest_num,
								Result = result2,
								Ok = ok2,
								NPC = npcName,
								Distance = magnitude,
							}

							if arg.TaskQueue:top() ~= arg3 then
								return false
							end

							if ok2 then
								quest2, v2 = arg.ReadQuest()

								if quest2 then
									if fn2(v2, arg2.mob_name) then
										state.questAcquire = nil
										state.acceptedQuestKey = acceptedQuestKey
										state.acceptedQuestAt = now
										state.acceptedQuestConfirmed = true
										state.lastQuestSeenAt = now
										return true
									end
								end

								lockedUntilLevel = tonumber(result2)

								if lockedUntilLevel then
									if arg.Level.Value < lockedUntilLevel then
										questAcquire.lockedUntilLevel = lockedUntilLevel
										questAcquire.nextRequestAt = math.huge
										state.status = arg3 .. " | Quest locked until level " .. tostring(lockedUntilLevel)
										return false
									end

									if lockedUntilLevel == 0 then
										state.acceptedQuestKey = acceptedQuestKey
										state.acceptedQuestAt = now
										state.acceptedQuestConfirmed = false
										state.acceptedQuestKills = 0
										acceptedQuestRequired = tonumber(arg2.quest_required) or 8
										state.acceptedQuestRequired = acceptedQuestRequired
										state.questAcquire = nil
										state.status = arg3 .. " | Quest accepted"
										return true
									end

									if lockedUntilLevel == 1 then
										questAcquire.nextRequestAt = now + 3
										state.status = arg3 .. " | Quest request rejected"
									elseif lockedUntilLevel == 2 then
										questAcquire.nextRequestAt = now + 30
										state.status = arg3 .. " | Quest already completed"
									else
										questAcquire.nextRequestAt = now + 3
										state.status = arg3 .. " | Waiting quest confirmation"
									end
								else
									if lockedUntilLevel == 0 then
										state.acceptedQuestKey = acceptedQuestKey
										state.acceptedQuestAt = now
										state.acceptedQuestConfirmed = false
										state.acceptedQuestKills = 0
										acceptedQuestRequired = tonumber(arg2.quest_required) or 8
										state.acceptedQuestRequired = acceptedQuestRequired
										state.questAcquire = nil
										state.status = arg3 .. " | Quest accepted"
										return true
									end

									if lockedUntilLevel == 1 then
										questAcquire.nextRequestAt = now + 3
										state.status = arg3 .. " | Quest request rejected"
									elseif lockedUntilLevel == 2 then
										questAcquire.nextRequestAt = now + 30
										state.status = arg3 .. " | Quest already completed"
									else
										questAcquire.nextRequestAt = now + 3
										state.status = arg3 .. " | Waiting quest confirmation"
									end
								end

								return false
							end

							questAcquire.nextRequestAt = now + 5
							state.status = arg3 .. " | Quest request failed"
							return false
						end
					end
				end
			end

			state.status = arg3 .. " | Waiting character"
			return false
		end

		questAcquire = state.questAcquire

		if state.acceptedQuestKey == acceptedQuestKey then
			local flag2 = now - (state.acceptedQuestAt or 0) < n6
			local flag3 = now - (state.lastQuestSeenAt or 0) < n7
			local flag4 = not state.acceptedQuestConfirmed

			if flag4 then
				flag4 = now - (state.acceptedQuestAt or 0) < n9
			end

			if flag4 then
				flag4 = (state.acceptedQuestKills or 0) < (state.acceptedQuestRequired or math.huge)
			end

			if not flag2 then
				if not flag3 then
					if not flag4 then
						local flag5 = false

						if state.acceptedQuestConfirmed then
							if (state.acceptedQuestRequired or 8) <= (state.acceptedQuestKills or 0) then
								flag5 = tbl11.record(state, "quest completed", now, "quest-ui")
							end
						end

						if state.movement then
							functions.CancelTween()
						end

						fn(arg)
						state.acceptedQuestKey = nil
						state.acceptedQuestAt = nil
						state.acceptedQuestConfirmed = nil
						state.lastQuestSeenAt = nil
						state.questAcquire = nil
						state.farmTarget = nil
						questAcquire = nil

						if flag5 then
							if type(functions.ReleaseBring) == "function" then
								pcall(functions.ReleaseBring)
							end

							state.status = arg3 .. " | Quest completed"
							return false
						end

						if questAcquire then
							if questAcquire.key ~= acceptedQuestKey then
								questAcquire = {
									key = acceptedQuestKey,
									startedAt = now,
									attempts = 0,
									nextRequestAt = now + n10,
									nextAbandonAt = 0,
								}

								state.questAcquire = questAcquire
							end
						else
							questAcquire = {
								key = acceptedQuestKey,
								startedAt = now,
								attempts = 0,
								nextRequestAt = now + n10,
								nextAbandonAt = 0,
							}

							state.questAcquire = questAcquire
						end

						state.questTarget = arg2.mob_name
						n13 = 276808444

						if quest then
							state.acceptedQuestKey = nil
							state.acceptedQuestAt = nil
							state.acceptedQuestConfirmed = nil
							state.lastQuestSeenAt = nil
							questAcquire.acceptedAt = nil

							if questAcquire.nextAbandonAt <= now then
								questAcquire.nextAbandonAt = now + 3

								ok, result = pcall(function()
									return arg.QuestRemote:InvokeServer("AbandonQuest")
								end)

								fn3(questAcquire, ok, result, "lastAbandonResult")
								state.lastQuestAbandon = { At = now, Result = result, Ok = ok, Title = str }
							end

							if state.movement then
								functions.CancelTween()
							end

							fn(arg)
							state.status = arg3 .. " | Abandoning wrong quest"
							return false
						end

						character = arg.LocalPlayer.Character
						character2 = character

						if character2 then
							character2 = character:FindFirstChildOfClass("Humanoid")
						end

						if character then
							humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart then
								if character2 then
									if not (character2.Health <= 0) then
										questGiverCFrame, npcName, positionSource = functions.GetQuestGiverCFrame(arg2)
										questAcquire.npcName = npcName
										questAcquire.positionSource = positionSource

										if typeof(questGiverCFrame) ~= "CFrame" then
											questAcquire.lastError = "quest-giver-unavailable"
											state.status = arg3 .. " | Quest giver unavailable"
											return false
										end

										magnitude = (humanoidRootPart.Position - questGiverCFrame.Position).Magnitude
										questAcquire.distance = magnitude

										if n5 < magnitude then
											state.status = arg3 .. " | Moving to quest giver"
											functions.TP(questGiverCFrame + Vector3.new(0, 3, 0), arg3, nil, nil, nil, nil, n11, n12)
											return false
										end

										if state.movement then
											functions.CancelTween()
										end

										if questAcquire.lockedUntilLevel then
											if arg.Level.Value < questAcquire.lockedUntilLevel then
												state.status = arg3 .. " | Quest locked until level " .. tostring(questAcquire.lockedUntilLevel)
												return false
											end
										end

										if questAcquire.lockedUntilLevel then
											questAcquire.lockedUntilLevel = nil
											questAcquire.nextRequestAt = 0
										end

										if questAcquire.acceptedAt then
											if now - questAcquire.acceptedAt < 4 then
												state.status = arg3 .. " | Waiting quest confirmation"
												return false
											end
										end

										if now < questAcquire.nextRequestAt then
											if magnitude <= n5 then
												flag = questAcquire.lastResult == 1

												if flag then
													flag = " | Quest request rejected"
												end

												flag = flag or " | Waiting quest confirmation"
												state.status = arg3 .. flag
											end

											return false
										end

										if arg.TaskQueue:top() ~= arg3 then
											return false
										end
										questAcquire.attempts += 1
										questAcquire.requestedAt = now
										state.lastQuestRequestAt = now
										n14 = nil
										n15 = nil

										ok2, result2 = pcall(function()
											n14 = 613203455
											n15 = 666854931
											return arg.QuestRemote:InvokeServer("StartQuest", arg2.quest_name, arg2.quest_num)
										end)

										fn3(questAcquire, ok2, result2, "lastResult")

										state.lastQuestRequest = {
											At = now,
											Quest = arg2.quest_name,
											Number = arg2.quest_num,
											Result = result2,
											Ok = ok2,
											NPC = npcName,
											Distance = magnitude,
										}

										if arg.TaskQueue:top() ~= arg3 then
											return false
										end

										if ok2 then
											quest2, v2 = arg.ReadQuest()

											if quest2 then
												if fn2(v2, arg2.mob_name) then
													state.questAcquire = nil
													state.acceptedQuestKey = acceptedQuestKey
													state.acceptedQuestAt = now
													state.acceptedQuestConfirmed = true
													state.lastQuestSeenAt = now
													return true
												end
											end

											lockedUntilLevel = tonumber(result2)

											if lockedUntilLevel then
												if arg.Level.Value < lockedUntilLevel then
													questAcquire.lockedUntilLevel = lockedUntilLevel
													questAcquire.nextRequestAt = math.huge
													state.status = arg3 .. " | Quest locked until level " .. tostring(lockedUntilLevel)
													return false
												end

												if lockedUntilLevel == 0 then
													state.acceptedQuestKey = acceptedQuestKey
													state.acceptedQuestAt = now
													state.acceptedQuestConfirmed = false
													state.acceptedQuestKills = 0
													acceptedQuestRequired = tonumber(arg2.quest_required) or 8
													state.acceptedQuestRequired = acceptedQuestRequired
													state.questAcquire = nil
													state.status = arg3 .. " | Quest accepted"
													return true
												end

												if lockedUntilLevel == 1 then
													questAcquire.nextRequestAt = now + 3
													state.status = arg3 .. " | Quest request rejected"
												elseif lockedUntilLevel == 2 then
													questAcquire.nextRequestAt = now + 30
													state.status = arg3 .. " | Quest already completed"
												else
													questAcquire.nextRequestAt = now + 3
													state.status = arg3 .. " | Waiting quest confirmation"
												end
											else
												if lockedUntilLevel == 0 then
													state.acceptedQuestKey = acceptedQuestKey
													state.acceptedQuestAt = now
													state.acceptedQuestConfirmed = false
													state.acceptedQuestKills = 0
													acceptedQuestRequired = tonumber(arg2.quest_required) or 8
													state.acceptedQuestRequired = acceptedQuestRequired
													state.questAcquire = nil
													state.status = arg3 .. " | Quest accepted"
													return true
												end

												if lockedUntilLevel == 1 then
													questAcquire.nextRequestAt = now + 3
													state.status = arg3 .. " | Quest request rejected"
												elseif lockedUntilLevel == 2 then
													questAcquire.nextRequestAt = now + 30
													state.status = arg3 .. " | Quest already completed"
												else
													questAcquire.nextRequestAt = now + 3
													state.status = arg3 .. " | Waiting quest confirmation"
												end
											end

											return false
										end

										questAcquire.nextRequestAt = now + 5
										state.status = arg3 .. " | Quest request failed"
										return false
									end
								end
							end
						end

						state.status = arg3 .. " | Waiting character"
						return false
					end
				end
			end

			state.questTarget = arg2.mob_name
			return true
		end

		if questAcquire then
			if questAcquire.key ~= acceptedQuestKey then
				questAcquire = {
					key = acceptedQuestKey,
					startedAt = now,
					attempts = 0,
					nextRequestAt = now + n10,
					nextAbandonAt = 0,
				}

				state.questAcquire = questAcquire
			end
		else
			questAcquire = { key = acceptedQuestKey, startedAt = now, attempts = 0, nextRequestAt = now + n10, nextAbandonAt = 0 }
			state.questAcquire = questAcquire
		end

		state.questTarget = arg2.mob_name
		n13 = 276808444

		if quest then
			state.acceptedQuestKey = nil
			state.acceptedQuestAt = nil
			state.acceptedQuestConfirmed = nil
			state.lastQuestSeenAt = nil
			questAcquire.acceptedAt = nil

			if questAcquire.nextAbandonAt <= now then
				questAcquire.nextAbandonAt = now + 3

				ok, result = pcall(function()
					return arg.QuestRemote:InvokeServer("AbandonQuest")
				end)

				fn3(questAcquire, ok, result, "lastAbandonResult")
				state.lastQuestAbandon = { At = now, Result = result, Ok = ok, Title = str }
			end

			if state.movement then
				functions.CancelTween()
			end

			fn(arg)
			state.status = arg3 .. " | Abandoning wrong quest"
			return false
		end

		character = arg.LocalPlayer.Character
		character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		if character then
			humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				if character2 then
					if not (character2.Health <= 0) then
						questGiverCFrame, npcName, positionSource = functions.GetQuestGiverCFrame(arg2)
						questAcquire.npcName = npcName
						questAcquire.positionSource = positionSource

						if typeof(questGiverCFrame) ~= "CFrame" then
							questAcquire.lastError = "quest-giver-unavailable"
							state.status = arg3 .. " | Quest giver unavailable"
							return false
						end

						magnitude = (humanoidRootPart.Position - questGiverCFrame.Position).Magnitude
						questAcquire.distance = magnitude

						if n5 < magnitude then
							state.status = arg3 .. " | Moving to quest giver"
							functions.TP(questGiverCFrame + Vector3.new(0, 3, 0), arg3, nil, nil, nil, nil, n11, n12)
							return false
						end

						if state.movement then
							functions.CancelTween()
						end

						if questAcquire.lockedUntilLevel then
							if arg.Level.Value < questAcquire.lockedUntilLevel then
								state.status = arg3 .. " | Quest locked until level " .. tostring(questAcquire.lockedUntilLevel)
								return false
							end
						end

						if questAcquire.lockedUntilLevel then
							questAcquire.lockedUntilLevel = nil
							questAcquire.nextRequestAt = 0
						end

						if questAcquire.acceptedAt then
							if now - questAcquire.acceptedAt < 4 then
								state.status = arg3 .. " | Waiting quest confirmation"
								return false
							end
						end

						if now < questAcquire.nextRequestAt then
							if magnitude <= n5 then
								flag = questAcquire.lastResult == 1

								if flag then
									flag = " | Quest request rejected"
								end

								state.status = arg3 .. (flag or " | Waiting quest confirmation")
							end

							return false
						end

						if arg.TaskQueue:top() ~= arg3 then
							return false
						end
						questAcquire.attempts += 1
						questAcquire.requestedAt = now
						state.lastQuestRequestAt = now
						n14 = nil
						n15 = nil

						ok2, result2 = pcall(function()
							n14 = 613203455
							n15 = 666854931
							return arg.QuestRemote:InvokeServer("StartQuest", arg2.quest_name, arg2.quest_num)
						end)

						fn3(questAcquire, ok2, result2, "lastResult")

						state.lastQuestRequest = {
							At = now,
							Quest = arg2.quest_name,
							Number = arg2.quest_num,
							Result = result2,
							Ok = ok2,
							NPC = npcName,
							Distance = magnitude,
						}

						if arg.TaskQueue:top() ~= arg3 then
							return false
						end

						if ok2 then
							quest2, v2 = arg.ReadQuest()

							if quest2 then
								if fn2(v2, arg2.mob_name) then
									state.questAcquire = nil
									state.acceptedQuestKey = acceptedQuestKey
									state.acceptedQuestAt = now
									state.acceptedQuestConfirmed = true
									state.lastQuestSeenAt = now
									return true
								end
							end

							lockedUntilLevel = tonumber(result2)

							if lockedUntilLevel then
								if arg.Level.Value < lockedUntilLevel then
									questAcquire.lockedUntilLevel = lockedUntilLevel
									questAcquire.nextRequestAt = math.huge
									state.status = arg3 .. " | Quest locked until level " .. tostring(lockedUntilLevel)
									return false
								end

								if lockedUntilLevel == 0 then
									state.acceptedQuestKey = acceptedQuestKey
									state.acceptedQuestAt = now
									state.acceptedQuestConfirmed = false
									state.acceptedQuestKills = 0
									state.acceptedQuestRequired = tonumber(arg2.quest_required) or 8
									state.questAcquire = nil
									state.status = arg3 .. " | Quest accepted"
									return true
								end

								if lockedUntilLevel == 1 then
									questAcquire.nextRequestAt = now + 3
									state.status = arg3 .. " | Quest request rejected"
								elseif lockedUntilLevel == 2 then
									questAcquire.nextRequestAt = now + 30
									state.status = arg3 .. " | Quest already completed"
								else
									questAcquire.nextRequestAt = now + 3
									state.status = arg3 .. " | Waiting quest confirmation"
								end
							else
								if lockedUntilLevel == 0 then
									state.acceptedQuestKey = acceptedQuestKey
									state.acceptedQuestAt = now
									state.acceptedQuestConfirmed = false
									state.acceptedQuestKills = 0
									state.acceptedQuestRequired = tonumber(arg2.quest_required) or 8
									state.questAcquire = nil
									state.status = arg3 .. " | Quest accepted"
									return true
								end

								if lockedUntilLevel == 1 then
									questAcquire.nextRequestAt = now + 3
									state.status = arg3 .. " | Quest request rejected"
								elseif lockedUntilLevel == 2 then
									questAcquire.nextRequestAt = now + 30
									state.status = arg3 .. " | Quest already completed"
								else
									questAcquire.nextRequestAt = now + 3
									state.status = arg3 .. " | Waiting quest confirmation"
								end
							end

							return false
						end

						questAcquire.nextRequestAt = now + 5
						state.status = arg3 .. " | Quest request failed"
						return false
					end
				end
			end
		end

		state.status = arg3 .. " | Waiting character"
		return false
	end }
end

local tbl24 = { run = function(arg)
	for k in arg.ToolsByType do
		arg.ToolsByType[k] = false
	end

	local localPlayer = arg.LocalPlayer
	local character = localPlayer.Character

	for _, instance in { localPlayer:FindFirstChildOfClass("Backpack"), character } do
		local instance2 = instance

		if instance2 then
			instance2 = instance:GetChildren()
		end

		instance2 = instance2 or {}

		for _, tool in instance2 do
			if not tool:IsA("Tool") then
				continue
			end
			local attribute = tool:GetAttribute("WeaponType")

			if type(attribute) == "string" then
				if attribute == "" then
					attribute = tool.ToolTip
				end
			else
				attribute = tool.ToolTip
			end

			if arg.ToolsByType[attribute] ~= nil then
				arg.ToolsByType[attribute] = tool
			end
		end
	end

	return arg.ToolsByType
end }

local tbl25, tbl26, tbl27, tbl28, tbl29, tbl30, tbl31, tbl32, tbl33, tbl34
local tbl35, tbl36, tbl37, tbl38, tbl39, tbl40, tbl41, tbl42, tbl43, tbl44
local tbl45, tbl46, tbl47, tbl48, tbl49, tbl50, tbl51, tbl52, tbl53, tbl54
local tbl55, tbl56, tbl57, tbl58, tbl59, tbl60, tbl61, tbl62

do
	do
		tbl25 = { run = function(arg, selectedWeaponType)
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			if not character2 then
				return false
			end

			if character2.Health <= 0 then
				return false
			end
			local instance = arg.ToolsByType[selectedWeaponType]

			if typeof(instance) == "Instance" then
				if not instance.Parent then
					arg.Functions.LoadTools()
					instance = arg.ToolsByType[selectedWeaponType]
				end
			else
				arg.Functions.LoadTools()
				instance = arg.ToolsByType[selectedWeaponType]
			end

			if typeof(instance) == "Instance" then
				if instance:IsA("Tool") then
					arg.SetCurrentWeaponType(selectedWeaponType)
					arg.State.selectedWeaponType = selectedWeaponType

					if instance.Parent == arg.LocalPlayer.Backpack then
						character2:EquipTool(instance)
					end

					return instance.Parent == character
				end
			end

			return false
		end }

		local n5 = 0.05

		tbl26 = { buildHitPayload = function(arg)
			local v = table.remove(arg, 1)
			return v, arg
		end }

		local function fn(arg, character, character2)
			local state = arg.State
			local combatUtil = state.combatUtil
			local modules, modules2, ok, result, ok2

			if combatUtil ~= nil then
				if combatUtil == false then
					if (state.nextCombatUtilLoadAt or 0) <= os.clock() then
						modules = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
						modules2 = modules

						if modules2 then
							modules2 = modules:FindFirstChild("CombatUtil")
						end

						ok = false
						result = nil

						if modules2 then
							ok, result = pcall(require, modules2)
						end

						ok2 = ok

						if ok2 then
							ok2 = result
						end

						ok2 = ok2 or false
						combatUtil = ok2
						state.combatUtil = combatUtil
						state.nextCombatUtilLoadAt = os.clock() + 5
					end
				end
			else
				modules = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
				modules2 = modules

				if modules2 then
					modules2 = modules:FindFirstChild("CombatUtil")
				end

				ok = false
				result = nil

				if modules2 then
					ok, result = pcall(require, modules2)
				end

				ok2 = ok

				if ok2 then
					ok2 = result
				end

				combatUtil = ok2 or false
				state.combatUtil = combatUtil
				state.nextCombatUtilLoadAt = os.clock() + 5
			end

			if type(combatUtil) ~= "table" then
				return
			end

			pcall(function()
				local movesetAnimCache = combatUtil:GetMovesetAnimCache(character)
				local weaponName = combatUtil:GetWeaponName(character2)
				local weaponName2 = weaponName

				if weaponName2 then
					weaponName2 = combatUtil:GetWeaponData(weaponName)
				end

				if weaponName2 then
					weaponName2.HitboxMagnitude = 60
				end

				if movesetAnimCache then
					if weaponName then
						local track = movesetAnimCache[combatUtil:GetPureWeaponName(weaponName) .. "-basic1"]

						if track then
							track:Play()
							track:AdjustSpeed(0)
						end
					end
				end
			end)
		end

		tbl26.run = function(arg)
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			local character3 = character

			if character3 then
				character3 = character:FindFirstChild("HumanoidRootPart")
			end

			local character4 = character

			if character4 then
				character4 = character:FindFirstChildOfClass("Tool")
			end

			if not character2 then
				return
			end

			if character2.Health <= 0 then
				return
			end

			if not character3 then
				return
			end

			if not character4 then
				return
			end
			local now = os.clock()
			if now - (arg.State.lastAttackAt or 0) < math.clamp(tonumber(arg.State.attackInterval) or tonumber(arg.Environment.Configs["Attack Interval"]) or n5, 0.05, 0.25) then
				return
			end
			local tbl63 = {}

			for _, v in arg.NearbyTargets do
				local instance = v[1]
				local instance2 = v[2]
				local instance3 = instance

				if instance3 then
					instance3 = instance:FindFirstChildOfClass("Humanoid")
				end

				local instance4 = instance

				if instance4 then
					instance4 = instance:FindFirstChild("HumanoidRootPart")
				end

				if not instance3 then
					continue
				end

				if not (instance3.Health > 0) then
					continue
				end

				if not instance4 then
					continue
				end

				if instance2 then
					if instance2.Parent then
						if (instance4.Position - character3.Position).Magnitude <= 60 then
							tbl63[#tbl63 + 1] = { instance, instance2 }
						end
					end
				end
			end

			if #tbl63 == 0 then
				return
			end
			fn(arg, character2, character4)
			local lastAttackTargetCount = #tbl63
			local hitPayload, v = tbl26.buildHitPayload(tbl63)

			local ok = pcall(function()
				arg.RegisterAttackRemote:FireServer(0.4)
				arg.RegisterHitRemote:FireServer(hitPayload[2], v)
			end)

			arg.State.lastAttackTargetCount = lastAttackTargetCount
			arg.State.lastAttackSecondaryCount = #v
			arg.State.lastAttackSent = ok

			if ok then
				arg.State.lastAttackAt = now
			end
		end

		tbl26.stop = function(arg)
			table.clear(arg.NearbyTargets)
			table.clear(arg.NearbyTargetParts)
			local state = arg.State
			state.attackTarget = nil
			state.attackTargetNames = nil
			state.attackTask = nil
			state.currentFarmMobName = nil
			state.attackPulseExpiresAt = 0
		end

		tbl27 = { run = function(arg, arg2, arg3)
			local v = Enum.KeyCode[tostring(arg2)]

			if v then
				local VirtualInputManager = game:GetService("VirtualInputManager")
				VirtualInputManager:SendKeyEvent(true, v, false, game)
				task.wait(tonumber(arg3) or 0.1)
				VirtualInputManager:SendKeyEvent(false, v, false, game)
				return true
			end

			return false
		end }

		tbl28 = { run = function(arg)
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChild("HumanoidRootPart")
			end

			if not character2 then
				return
			end
			local seaHubVelocity = character2:FindFirstChild("SeaHubVelocity")

			if seaHubVelocity then
				if not seaHubVelocity:IsA("BodyVelocity") then
					seaHubVelocity:Destroy()
				end
			end

			local seaHubLinearVelocity = character2:FindFirstChild("SeaHubLinearVelocity")

			if seaHubLinearVelocity then
				seaHubLinearVelocity:Destroy()
			end

			if arg.VelocityAttachment then
				arg.VelocityAttachment:Destroy()
				arg.VelocityAttachment = nil
			end

			local bananaBV = character2:FindFirstChild("BananaBV") or arg.Velocity

			if bananaBV then
				if bananaBV.Parent then
					if not bananaBV:IsA("BodyVelocity") then
						pcall(bananaBV.Destroy, bananaBV)
						bananaBV = nil
					end
				else
					pcall(bananaBV.Destroy, bananaBV)
					bananaBV = nil
				end
			end

			bananaBV = bananaBV or Instance.new("BodyVelocity")
			bananaBV.Name = "BananaBV"
			bananaBV.MaxForce = Vector3.new(0, math.huge, 0)
			bananaBV.Velocity = Vector3.zero
			bananaBV.Parent = character2
			arg.Velocity = bananaBV
			character2.AssemblyLinearVelocity = Vector3.zero
			character2.AssemblyAngularVelocity = Vector3.zero
		end }

		tbl29 = { run = function(arg)
			if arg.Velocity then
				arg.Velocity.Parent = game
			end

			if arg.VelocityAttachment then
				arg.VelocityAttachment:Destroy()
				arg.VelocityAttachment = nil
			end

			arg.Functions.NoClip("off")
		end }

		local function fn2(arg)
			if typeof(arg) ~= "CFrame" then
				return false
			end
			local position = arg.Position
			local flag = position.X == position.X

			if flag then
				flag = position.Y == position.Y
			end

			if flag then
				flag = position.Z == position.Z
			end

			if flag then
				flag = math.abs(position.X) <= 250000
			end

			if flag then
				flag = math.abs(position.Z) <= 250000
			end

			if flag then
				flag = position.Y >= -5000
			end

			if flag then
				flag = position.Y <= 50000
			end

			return flag
		end

		tbl30 = { run = function(arg, arg2, arg3, arg4, instance)
			local state = arg.State

			if not state.stopTweenRequested then
				if fn2(arg2) then
					if arg3 then
						if arg.TaskQueue:top() ~= arg3 then
							return true
						end
					end

					if arg4 then
						if arg.Functions.GetBossCFrame(arg4) == "undefined" then
							return true
						end
					end

					if typeof(instance) == "Instance" then
						if not instance:IsDescendantOf(workspace) then
							return true
						end
					end

					return false
				end
			end

			state.lastRejectedMovement = { at = os.clock(), owner = arg3, target = arg2 }
			return true
		end }

		local tbl63 = {
			"God's Chalice",
			"Sweet Chalice",
			"Special Microchip",
			"Hallow Essence",
			"Fire Essence",
		}

		local function fn3(player, name)
			local tbl64 = { player.Character, player:FindFirstChildOfClass("Backpack") }

			for _, instance in tbl64 do
				if instance then
					if instance:FindFirstChild(name) then
						return true
					end
					continue
				end

				continue
			end

			return false
		end

		tbl31 = { run = function(arg)
			local state = arg.State
			local taskQueue = arg.TaskQueue

			if taskQueue then
				taskQueue = arg.TaskQueue:top()
			end

			taskQueue = taskQueue or nil
			if os.clock() < (state.bypassBlockedUntil or 0) then
				return true
			end

			if taskQueue == "SoulGuitar" then
				return true
			end

			if taskQueue == "RaidController" then
				return true
			end

			if taskQueue == "Auto Raid" then
				return true
			end

			if arg.LocalPlayer:GetAttribute("IslandRaiding") then
				return true
			end

			for _, v in tbl63 do
				if fn3(arg.LocalPlayer, v) then
					return true
				end
				continue
			end

			return false
		end }

		local function fn4(arg, owner)
			local state = arg.State or {}
			if state.stopped then
				return false
			end

			if state.paused then
				return false
			end
			local functions = arg.Functions

			if functions then
				if type(functions.IsTaskCurrent) == "function" then
					return functions.IsTaskCurrent(owner)
				end
			end

			local flag = not state.stopped

			if flag then
				flag = not state.paused
			end

			if flag then
				flag = arg.TaskQueue:top() == owner
			end

			return flag
		end

		local tbl64 = {
			fishman = CFrame.new(61163.8515625, 11.68000793457, 1819.7840576172),
			whirlPool = CFrame.new(3864.6879882812, 5.7169952392578, -1926.2139892578),
			skyArea1 = CFrame.new(-4166.6098632812, 1093.6979980469, -347.16226196289),
			skyArea2 = CFrame.new(-6023.5766601562, 5469.7197265625, 2203.3083496094),
		}

		local tbl65 = {
			fishmanEntrance = CFrame.new(4050.31103515625, -1.6880035400390625, -1814.1240234375),
			fishmanExit = CFrame.new(61170.046875, -2, 1952.833984375),
		}

		local tbl66 = {
			cursedShip = Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125),
			surface = Vector3.new(-6508.55810546875, 89.034996032714844, -132.83953857421875),
			mansion = CFrame.new(-288.46249389648438, 306.130615234375, 597.99884033203125),
			swanRoom = CFrame.new(2284.912109375, 15.152046203613281, 905.48291015625),
		}

		local vector = Vector3.new(11256, -2138, 9888)
		local cframe = CFrame.new(-16269, 23, 1371)
		local n6 = 1
		local n7 = 6
		local n8 = 0.5
		local cframe2 = CFrame.new(tbl66.surface + Vector3.new(0, 5, 0))
		local n9 = 6
		local n10 = 5

		local function fn5(arg)
			if type(arg) ~= "thread" then
				return true
			end

			if coroutine.status(arg) ~= "dead" then
				if arg ~= coroutine.running() then
					if type(task.cancel) == "function" then
						pcall(task.cancel, arg)
					end
				end

				return coroutine.status(arg) == "dead"
			end

			return true
		end

		local function fn6(state, arg)
			local fastTravelTween = state.fastTravelTween

			if arg then
				if fastTravelTween ~= arg then
					pcall(function()
						arg:Cancel()
					end)

					return
				end
			end

			state.fastTravelTween = nil

			if fastTravelTween then
				pcall(function()
					fastTravelTween:Cancel()
				end)
			end
		end

		local function fn7(state)
			local whirlPoolTouchRestore = state.whirlPoolTouchRestore
			state.whirlPoolTouchRestore = nil

			if whirlPoolTouchRestore then
				fn5(whirlPoolTouchRestore.thread)

				pcall(function()
					if whirlPoolTouchRestore.part.Parent then
						whirlPoolTouchRestore.part.CanTouch = whirlPoolTouchRestore.canTouch
					end
				end)
			end
		end

		local function fn8(arg, owner, arg2, arg3)
			local state = arg.State
			if state.fastTravelRequest then
				return false, "travel-request-busy"
			end

			if os.clock() < (state.nextFastTravelRequestAt or 0) then
				return false, "travel-request-busy"
			end
			local character = arg.LocalPlayer.Character
			local fastTravelGeneration = state.fastTravelGeneration
			local fastTravelRequest = {}

			local function fn9()
				local flag = state.fastTravelRequest == fastTravelRequest

				if flag then
					flag = not fastTravelRequest.cancelled
				end

				if flag then
					flag = state.fastTravelGeneration == fastTravelGeneration
				end

				if flag then
					flag = arg.LocalPlayer.Character == character
				end

				if flag then
					flag = not state.stopped
				end

				if flag then
					flag = not state.paused
				end

				if flag then
					flag = fn4(arg, owner)
				end

				if flag then
					flag = not arg3 or arg3()
				end

				return flag
			end

			state.fastTravelRequest = fastTravelRequest

			if fn9() then
				local deadline = os.clock() + n9

				fastTravelRequest.thread = task.spawn(function()
					fastTravelRequest.results = table.pack(pcall(arg2, fn9))

					if fastTravelRequest.cancelled then
						if state.fastTravelRequest == fastTravelRequest then
							state.fastTravelRequest = nil
						end
					end
				end)

				while not fastTravelRequest.results do
					if fn9() then
						if os.clock() < deadline then
							task.wait(0.05)
							continue
						end
					end

					break
				end

				local v = fn9()

				if not fastTravelRequest.results then
					fastTravelRequest.cancelled = true
				end

				local v2 = fn5(fastTravelRequest.thread)

				if state.fastTravelRequest == fastTravelRequest then
					if v2 then
						state.fastTravelRequest = nil
					elseif fastTravelRequest.results then
						state.fastTravelRequest = nil
					end
				end

				if v then
					if fastTravelRequest.results then
						return table.unpack(fastTravelRequest.results, 1, fastTravelRequest.results.n)
					end
					state.nextFastTravelRequestAt = os.clock() + 3
					return false, "travel-request-timeout"
				end

				return false, "travel-request-cancelled"
			end

			state.fastTravelRequest = nil
			return false, "travel-request-cancelled"
		end

		local function fn9(arg, ...)
			local state = arg.State
			local fastTravelResolving = state.fastTravelResolving
			state.fastTravelResolving = true
			local v = table.pack(pcall(arg.Functions.TP, ...))
			state.fastTravelResolving = fastTravelResolving

			if not v[1] then
				error(v[2], 0)
			end

			return table.unpack(v, 2, v.n)
		end

		local function getMap()
			local map = workspace:FindFirstChild("Map")
			local map2 = map

			if map2 then
				map2 = map:FindFirstChild("GhostShipInterior")
			end

			local map3 = map2

			if map3 then
				map3 = map2:FindFirstChild("Teleport")
			end

			local map4 = map3

			if map4 then
				map4 = map3:IsA("BasePart")
			end

			if map4 then
				map4 = map3
			end

			return map4 or nil
		end

		local function getMap2()
			local map = workspace:FindFirstChild("Map")
			local map2 = map

			if map2 then
				map2 = map:FindFirstChild("GhostShip")
			end

			local map3 = map2

			if map3 then
				map3 = map2:FindFirstChild("Teleport")
			end

			local map4 = map3

			if map4 then
				map4 = map3:IsA("BasePart")
			end

			if map4 then
				map4 = map3
			end

			return map4 or nil
		end

		local function fn10(position)
			return position.Z > 30000
		end

		local function fn11(position)
			local flag = position.Y < -500

			if flag then
				flag = (position - vector).Magnitude <= 4200
			end

			return flag
		end

		local function getNpCs(name, arg)
			local npCs = workspace:FindFirstChild("NPCs")
			local npCs2 = npCs

			if npCs2 then
				npCs2 = npCs:FindFirstChild(name)
			end

			local npCs3 = npCs2

			if npCs3 then
				npCs3 = npCs2:FindFirstChild("HumanoidRootPart") or npCs2.PrimaryPart
			end

			local npCs4 = npCs3

			if npCs4 then
				npCs4 = npCs3.CFrame
			end

			return npCs4 or arg
		end

		local function getOk(arg)
			local modules = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
			local modules2 = modules

			if modules2 then
				modules2 = modules:FindFirstChild("Net")
			end

			if not modules2 then
				return nil
			end
			local ok, result = pcall(require, modules2)

			if ok then
				if type(result) == "table" then
					if type(result.RemoteFunction) == "function" then
						if arg then
							if not arg() then
								return nil
							end
						end

						local ok2, result2 = pcall(function()
							return result:RemoteFunction("SubmarineWorkerSpeak")
						end)

						local ok3 = ok2

						if ok3 then
							ok3 = result2
						end

						return ok3 or nil
					end
				end
			end

			return nil
		end

		local function fn12(arg, humanoidRootPart, arg2, owner)
			if not arg.IsSea(3) then
				return false
			end
			local state = arg.State
			local now = os.clock()
			local v = fn11(arg2.Position)
			local flag = fn11(humanoidRootPart.Position) or arg.LocalPlayer:GetAttribute("ExactLocation") == "Submerged Island"

			if now < (state.submergedSettleUntil or 0) then
				local status = (state.submergedSettleDirection or "transition") == "enter"

				if status then
					status = "Auto Farm Level | Stabilizing Submerged Island"
				end

				state.status = status or "Auto Farm Level | Stabilizing surface return"
				arg.Functions.AddVelocity()
				arg.Functions.NoClip("on")
				return true
			end

			if state.submergedSettleUntil then
				state.submergedSettleUntil = nil
				state.submergedSettleDirection = nil
			end

			if v == flag then
				return false
			end

			if now < (state.nextSubmergedTransitionAt or 0) then
				return true
			end

			if v then
				local submarineWorker = getNpCs("Submarine Worker", cframe)

				if (humanoidRootPart.Position - submarineWorker.Position).Magnitude > 60 then
					state.status = "Auto Farm Level | Entering Submerged Island"
					fn9(arg, submarineWorker + Vector3.new(0, 5, 3), owner, true)
					return true
				end

				state.nextSubmergedTransitionAt = os.clock() + 4

				local v2, v3 = fn8(arg, owner, function(arg3)
					local ok = getOk(arg3)

					if arg3() then
						local ok2 = ok

						if ok2 then
							ok2 = ok:InvokeServer("TravelToSubmergedIsland")
						end

						return ok2 or false
					end

					return false
				end)

				if v3 == "travel-request-cancelled" then
					return true
				end

				if not fn4(arg, owner) then
					return true
				end
				local lastSubmergedTransition = { direction = "enter" }
				local success = v2

				if success then
					success = v3 ~= false
				end

				lastSubmergedTransition.success = success
				lastSubmergedTransition.result = tostring(v3)
				lastSubmergedTransition.at = os.clock()
				state.lastSubmergedTransition = lastSubmergedTransition

				if v2 then
					if v3 then
						state.submergedSettleDirection = "enter"
						state.submergedSettleUntil = os.clock() + n6
					end
				end

				state.status = "Auto Farm Level | Entering Submerged Island"
				return true
			end

			if arg.LocalPlayer:GetAttribute("InCombat") == true then
				state.status = "Auto Farm Level | Waiting for combat before leaving Submerged Island"
				state.nextSubmergedTransitionAt = os.clock() + 1
				return true
			end

			if arg.LocalPlayer:GetAttribute("ExactLocation") == "Submerged Island" then
				state.nextSubmergedTransitionAt = os.clock() + 6

				local v2, v3 = fn8(arg, owner, function()
					return arg.CommandRemote:InvokeServer("TeleportToSpawn")
				end)

				if v3 == "travel-request-cancelled" then
					return true
				end

				if not fn4(arg, owner) then
					return true
				end
				local lastSubmergedTransition = { direction = "leave" }
				local success = v2

				if success then
					success = v3 ~= false
				end

				lastSubmergedTransition.success = success
				lastSubmergedTransition.result = tostring(v3)
				lastSubmergedTransition.at = os.clock()
				state.lastSubmergedTransition = lastSubmergedTransition

				if v2 then
					if v3 ~= false then
						state.submergedSettleDirection = "leave"
						state.submergedSettleUntil = os.clock() + n7
					end
				end

				state.status = "Auto Farm Level | Leaving Submerged Island"
				return true
			end

			local submarineWorker2 = getNpCs("Submarine Worker2")

			if submarineWorker2 then
				if (humanoidRootPart.Position - submarineWorker2.Position).Magnitude > 60 then
					fn9(arg, submarineWorker2 + Vector3.new(0, 5, 3), owner, true)
					return true
				end
				state.nextSubmergedTransitionAt = os.clock() + 4

				local v2, v3 = fn8(arg, owner, function(arg3)
					local ok = getOk(arg3)

					if arg3() then
						local ok2 = ok

						if ok2 then
							ok2 = ok:InvokeServer("TravelToSurface")
						end

						return ok2 or false
					end

					return false
				end)

				if v3 == "travel-request-cancelled" then
					return true
				end

				if not fn4(arg, owner) then
					return true
				end
				local lastSubmergedTransition = { direction = "leave" }
				local success = v2

				if success then
					success = v3 ~= false
				end

				lastSubmergedTransition.success = success
				lastSubmergedTransition.result = tostring(v3)
				lastSubmergedTransition.at = os.clock()
				state.lastSubmergedTransition = lastSubmergedTransition

				if v2 then
					if v3 then
						state.submergedSettleDirection = "leave"
						state.submergedSettleUntil = os.clock() + n8
					end
				end

				state.status = "Auto Farm Level | Leaving Submerged Island"
				return true
			end

			state.status = "Auto Farm Level | Locating Submarine Worker"
			return true
		end

		local function getParent(arg, part, position, arg2, arg3, arg4)
			local clock = os.clock
			local exitTo

			while true do
				clock = clock() + 45
				exitTo = nil

				while part.Parent do
					if arg4 then
						if not arg4() then
							break
						end
					end

					if not ((position - part.Position).Magnitude > 8) then
						break
					end

					if not (os.clock() < clock) then
						break
					end
					arg.Functions.AddVelocity()
					arg.Functions.NoClip("on")
					local position2 = position - part.Position
					local n11 = math.min(position2.Magnitude, arg3)
					local position3 = part.Position + position2.Unit * n11
					local tween = arg.TweenService:Create(part, TweenInfo.new(n11 / arg2, Enum.EasingStyle.Linear), { CFrame = CFrame.lookAt(position3, position) })
					arg.State.fastTravelTween = tween
					tween:Play()
					local n12 = math.min(clock, os.clock() + n11 / arg2 + 2)

					while part.Parent do
						if arg4 then
							if not arg4() then
								break
							end
						end

						if tween.PlaybackState == Enum.PlaybackState.Completed then
							break
						end

						if tween.PlaybackState ~= Enum.PlaybackState.Cancelled then
							if os.clock() < n12 then
								task.wait(0.05)
								continue
							end
						end

						break
					end

					local flag = tween.PlaybackState == Enum.PlaybackState.Completed
					fn6(arg.State, tween)
					if not flag then
						exitTo = 2
						break
					end

					if not part.Parent then
						exitTo = 2
						break
					end

					if arg4 then
						if not arg4() then
							exitTo = 2
							break
						end
					end

					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
					task.wait(0.1)
				end

				break
			end

			if exitTo == 2 then
				return false
			end
			local parent = part.Parent

			if parent then
				parent = not arg4 or arg4()
			end

			if parent then
				parent = (position - part.Position).Magnitude <= 15
			end

			return parent
		end

		local function fn13(arg, instance, map, arg2, arg3)
			local lookVector = map.CFrame.LookVector
			local flag = (instance.Position - map.Position):Dot(lookVector) >= 0

			if flag then
				flag = 1
			end

			flag = flag or -1
			local z = map.Size.Z
			if not getParent(arg, instance, map.Position + lookVector * flag * (z / 2 + 5), 200, 240, arg3) then
				return false
			end
			task.wait(0.3)

			if arg3 then
				if not arg3() then
					return false
				end
			end

			local position = map.Position - lookVector * flag * (z / 2 + 7)
			local tween = arg.TweenService:Create(instance, TweenInfo.new(math.max((position - instance.Position).Magnitude / 18, 0.8), Enum.EasingStyle.Linear), { CFrame = CFrame.lookAt(position, position - lookVector * flag) })
			arg.State.fastTravelTween = tween
			tween:Play()
			local deadline = os.clock() + 7
			local exitTo = nil
			local flag2

			while true do
				task.wait(0.05)
				flag2 = fn10(instance.Position) == arg2
				if flag2 then
					exitTo = 1
					break
				end

				if deadline <= os.clock() then
					exitTo = 1
					break
				end

				if not instance.Parent then
					exitTo = 1
					break
				end

				if arg3 then
					if not arg3() then
						exitTo = 1
						break
					end
				end
			end

			fn6(arg.State, tween)
			local flag3 = flag2

			if flag3 then
				flag3 = not arg3 or arg3()
			end

			return flag3
		end

		local function fn14(arg, arg2, arg3, arg4, owner)
			local state = arg.State
			if state.cursedShipTransitionActive then
				return true
			end

			if os.clock() < (state.nextCursedShipTransitionAt or 0) then
				return true
			end
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			local character3 = character

			if character3 then
				character3 = character:FindFirstChild("HumanoidRootPart")
			end

			if not character2 then
				return true
			end

			if not character3 then
				return true
			end

			if not (character2.Health <= 0) then
				state.cursedShipTransitionActive = true
				local cursedShipTransitionToken = {}
				state.cursedShipTransitionToken = cursedShipTransitionToken
				state.cursedShipTransitionDeadline = os.clock() + 60
				state.nextCursedShipTransitionAt = os.clock() + 8

				state.lastTravelDecision = {
					mode = "cursed-ship-transition",
					reason = arg2,
					destination = arg3,
					owner = owner,
					at = os.clock(),
					goal = arg4.Position,
					phase = "starting",
				}

				local lastTravelDecision = state.lastTravelDecision

				local function fn15()
					local flag = state.cursedShipTransitionToken == cursedShipTransitionToken

					if flag then
						flag = not state.stopped
					end

					if flag then
						flag = not state.paused
					end

					if flag then
						flag = os.clock() < (state.cursedShipTransitionDeadline or 0)
					end

					if flag then
						flag = arg.LocalPlayer.Character == character
					end

					if flag then
						flag = character3.Parent ~= nil
					end

					if flag then
						flag = character2.Health > 0
					end

					if flag then
						flag = fn4(arg, owner)
					end

					return flag
				end

				local thread = task.spawn(function()
					local parent = false

					local ok, result = pcall(function()
						if not fn15() then
							return
						end
						arg.Functions.CancelTween()
						arg.Functions.NoClip("on")
						character3.AssemblyLinearVelocity = Vector3.zero
						character3.AssemblyAngularVelocity = Vector3.zero

						if arg2 == "cursed-ship" then
							lastTravelDecision.phase = "requesting-entry"

							local v, v2 = fn8(arg, owner, function()
								return arg.CommandRemote:InvokeServer("requestEntrance", arg3)
							end, fn15)

							local result = v

							if result then
								result = v2
							end

							lastTravelDecision.result = result or tostring(v2)
							if not v then
								return
							end

							if not fn15() then
								return
							end
							character3.CFrame += Vector3.new(0, 50, 0)
							local deadline = os.clock() + 6

							while true do
								task.wait(0.05)
								local parent2 = character3.Parent

								if parent2 then
									parent2 = fn10(character3.Position)
								end

								parent = parent2 or false

								if not parent then
									if not (deadline <= os.clock()) then
										if fn15() then
											continue
										end
									end
								end

								break
							end

							local parent2 = parent

							if parent2 then
								parent2 = fn15()
							end

							parent = parent2
							return
						end

						local map = getMap()
						lastTravelDecision.phase = "crossing-exit"

						if map then
							parent = fn13(arg, character3, map, false, fn15)
						end
					end)

					if state.cursedShipTransitionToken == cursedShipTransitionToken then
						state.cursedShipTransitionThread = nil
						state.cursedShipTransitionToken = nil
						state.cursedShipTransitionActive = nil
						state.cursedShipTransitionDeadline = nil
						local now = os.clock()
						local parent2 = parent

						if parent2 then
							parent2 = 2
						end

						state.nextCursedShipTransitionAt = now + (parent2 or 8)
						fn6(state)
						local parent3 = parent

						if parent3 then
							parent3 = "verified"
						end

						lastTravelDecision.phase = parent3 or "failed"
						lastTravelDecision.success = parent
						lastTravelDecision.completedAt = os.clock()

						if not ok then
							lastTravelDecision.error = tostring(result)
						end

						state.lastCursedShipTransition = lastTravelDecision
						pcall(arg.Functions.NoClip, "off")
					end
				end)

				if state.cursedShipTransitionToken == cursedShipTransitionToken then
					state.cursedShipTransitionThread = thread
				end

				return true
			end

			return true
		end

		local function getInstance(instance, arg)
			local instance2 = instance

			if instance2 then
				instance2 = instance:IsA("BasePart")
			end

			if instance2 then
				instance2 = instance.CFrame
			end

			return instance2 or arg
		end

		local function fn15()
			local map = workspace:FindFirstChild("Map")
			local map2 = map

			if map2 then
				map2 = map:FindFirstChild("TeleportSpawn")
			end

			local getInstance2 = getInstance
			local map3 = map2

			if map3 then
				map3 = map2:FindFirstChild("Entrance")
			end

			local instance = getInstance2(map3, tbl65.fishmanEntrance)
			local getInstance3 = getInstance
			local map4 = map2

			if map4 then
				map4 = map2:FindFirstChild("Exit")
			end

			local instance2 = getInstance3(map4, tbl65.fishmanExit)
			local map5 = map

			if map5 then
				map5 = map:FindFirstChild("Sky")
			end

			local getInstance4 = getInstance
			local map6 = map5

			if map6 then
				map6 = map5:FindFirstChild("Entrance")
			end

			local instance3 = getInstance4(map6)

			local tbl67 = {
				{ From = instance, To = tbl64.fishman, Name = "Fish Man" },
				{ From = instance2, To = tbl64.whirlPool, Name = "Whirl Pool" },
			}

			if instance3 then
				table.insert(tbl67, { From = instance3, To = tbl64.skyArea2, Name = "Sky Area 2" })
			end

			table.insert(tbl67, { From = tbl64.skyArea2, To = tbl64.skyArea1, Name = "Sky Area 1" })
			return tbl67
		end

		local function fn16(position, position2)
			local magnitude = (position2 - position).Magnitude
			if magnitude < 1000 then
				return nil
			end
			local v = nil
			local savings = 1500

			for _, v2 in ipairs(fn15()) do
				local magnitude2 = (v2.To.Position - position2).Magnitude
				local n11 = magnitude - ((v2.From.Position - position).Magnitude + magnitude2)

				if savings < n11 then
					if magnitude2 < magnitude then
						v = v2
						savings = n11
					end
				end
			end

			if v then
				v.Savings = savings
			end

			return v
		end

		local function fn17(arg)
			local map = workspace:FindFirstChild("Map")
			local map2 = map

			if map2 then
				map2 = map:FindFirstChild("TeleportSpawn")
			end

			local map3 = map2

			if map3 then
				map3 = map2:FindFirstChild("Entrance")
			end

			if not map3 then
				return
			end

			if map3:IsA("BasePart") then
				local state = arg.State
				local whirlPoolTouchRestore = state.whirlPoolTouchRestore

				if whirlPoolTouchRestore then
					if whirlPoolTouchRestore.part ~= map3 then
						fn7(state)
						whirlPoolTouchRestore = nil
					end
				end

				if not whirlPoolTouchRestore then
					whirlPoolTouchRestore = { part = map3, canTouch = map3.CanTouch }
					state.whirlPoolTouchRestore = whirlPoolTouchRestore
				end

				fn5(whirlPoolTouchRestore.thread)
				local timerToken = {}
				whirlPoolTouchRestore.timerToken = timerToken
				map3.CanTouch = false

				whirlPoolTouchRestore.thread = task.delay(8, function()
					if state.whirlPoolTouchRestore == whirlPoolTouchRestore then
						if whirlPoolTouchRestore.timerToken == timerToken then
							fn7(state)
						end
					end
				end)

				return
			end
		end

		local function getCharacter(arg, name)
			local character = arg.LocalPlayer.Character
			local backpack = arg.LocalPlayer:FindFirstChildOfClass("Backpack")
			local character2 = character

			if character2 then
				character2 = character:FindFirstChild(name)
			end

			if not character2 then
				character2 = backpack

				if character2 then
					character2 = backpack:FindFirstChild(name)
				end
			end

			return character2
		end

		local function getCannon(arg, owner)
			local state = arg.State
			local cannon = getCharacter(arg, "Cannon")
			if cannon then
				return cannon
			end

			local v, v2 = fn8(arg, owner, function()
				arg.CommandRemote:InvokeServer("LoadItem", "Cannon")
			end)

			local cannon2, n11, n12, v3, v4, v5, v6

			if v then
				task.wait(0.15)
				if not fn4(arg, owner) then
					return nil
				end
				cannon2 = getCharacter(arg, "Cannon")
				if cannon2 then
					return cannon2
				end

				if not (arg.Beli.Value < 100000) then
					if not (os.clock() < (state.nextSkyCannonBuyAt or 0)) then
						state.nextSkyCannonBuyAt = os.clock() + 5
						n11 = nil
						n12 = nil

						v3, v4 = fn8(arg, owner, function()
							n11 = 667796393
							n12 = 561344150
							return arg.CommandRemote:InvokeServer("BuyItem", "Cannon")
						end)

						state.lastSkyCannonBuy = { success = v3, result = tostring(v4), at = os.clock() }
						if not v3 then
							return nil
						end

						if fn4(arg, owner) then
							v5, v6 = fn8(arg, owner, function()
								arg.CommandRemote:InvokeServer("LoadItem", "Cannon")
							end)

							if not v5 then
								if v6 == "travel-request-cancelled" then
									return nil
								end
							end

							task.wait(0.2)
							if not fn4(arg, owner) then
								return nil
							end
							return getCharacter(arg, "Cannon")
						end

						return nil
					end
				end

				return nil
			end

			if v2 == "travel-request-cancelled" then
				return nil
			end

			if v2 == "travel-request-timeout" then
				return nil
			end

			if v2 == "travel-request-busy" then
				return nil
			end
			task.wait(0.15)

			if fn4(arg, owner) then
				cannon2 = getCharacter(arg, "Cannon")
				if cannon2 then
					return cannon2
				end

				if arg.Beli.Value < 100000 then
					return nil
				end

				if os.clock() < (state.nextSkyCannonBuyAt or 0) then
					return nil
				end
				state.nextSkyCannonBuyAt = os.clock() + 5
				n11 = nil
				n12 = nil

				v3, v4 = fn8(arg, owner, function()
					n11 = 667796393
					n12 = 561344150
					return arg.CommandRemote:InvokeServer("BuyItem", "Cannon")
				end)

				state.lastSkyCannonBuy = { success = v3, result = tostring(v4), at = os.clock() }

				if v3 then
					if not fn4(arg, owner) then
						return nil
					end

					v5, v6 = fn8(arg, owner, function()
						arg.CommandRemote:InvokeServer("LoadItem", "Cannon")
					end)

					if not v5 then
						if v6 == "travel-request-cancelled" then
							return nil
						end
					end

					task.wait(0.2)
					if fn4(arg, owner) then
						return getCharacter(arg, "Cannon")
					end
					return nil
				end

				return nil
			end

			return nil
		end

		local function fn18(from)
			local map = workspace:FindFirstChild("Map")
			local map2 = map

			if map2 then
				map2 = map:FindFirstChild("Sky")
			end

			if not map2 then
				return nil
			end
			local instance2 = nil
			local magnitude2 = nil

			for _, instance in map2:GetDescendants() do
				if not instance:IsA("BasePart") then
					continue
				end

				if instance.Name ~= "cloud" then
					continue
				end

				if not (instance.Transparency < 1) then
					continue
				end
				local magnitude = (instance.Position - from.Position).Magnitude
				if not (magnitude < 50) then
					continue
				end

				if magnitude2 then
					if not (magnitude < magnitude2) then
						continue
					end
				end

				instance2 = instance
				magnitude2 = magnitude
				continue
			end

			return instance2, magnitude2
		end

		local function fn19(arg)
			if type(arg) ~= "function" then
				return ""
			end

			if type(debug) == "table" then
				if type(debug.info) == "function" then
					local ok, result = pcall(debug.info, arg, "s")
					local ok2 = ok

					if ok2 then
						ok2 = tostring(result)
					end

					return ok2 or ""
				end
			end

			return ""
		end

		local function fn20(state)
			local skyCombatController = state.skyCombatController

			if type(skyCombatController) == "table" then
				if type(skyCombatController.Attack) == "function" then
					return skyCombatController
				end
			end

			if os.clock() < (state.nextSkyCombatDiscoveryAt or 0) then
				return nil
			end
			state.nextSkyCombatDiscoveryAt = os.clock() + n10
			if type(getgc) ~= "function" then
				return nil
			end
			local ok, result = pcall(getgc, true)
			if not ok then
				return nil
			end

			if type(result) ~= "table" then
				return nil
			end

			for _, v in ipairs(result) do
				if type(v) ~= "table" then
					continue
				end

				if type(rawget(v, "Attack")) == "function" then
					if fn19(rawget(v, "Attack")):find("CombatController", 1, true) then
						state.skyCombatController = v
						return v
					end
				end
			end

			return nil
		end

		local function fn21(function_, arg, arg2)
			if type(function_) ~= "function" then
				return nil
			end

			if arg < 0 then
				return nil
			end

			if type(getupvalues) == "function" then
				local functions = arg2 or {}
				if functions[function_] then
					return nil
				end
				functions[function_] = true
				local ok, result = pcall(getupvalues, function_)

				if ok then
					if type(result) == "table" then
						local v, v2, v3 = pairs(result)
					end
				end

				return nil
			end

			return nil
		end

		local function getSkyCannonMouseState(state, skyCannonMouseTool)
			if state.skyCannonMouseTool == skyCannonMouseTool then
				if type(state.skyCannonMouseState) == "table" then
					return state.skyCannonMouseState
				end
			end

			if os.clock() < (state.nextSkyMouseDiscoveryAt or 0) then
				return nil
			end
			state.nextSkyMouseDiscoveryAt = os.clock() + n10
			if type(getconnections) ~= "function" then
				return nil
			end
			local ok, result = pcall(getconnections, skyCannonMouseTool.Activated)
			if not ok then
				return nil
			end

			if type(result) == "table" then
				for _, v in ipairs(result) do
					local skyCannonMouseState = fn21(v.Function, 3)

					if skyCannonMouseState then
						state.skyCannonMouseTool = skyCannonMouseTool
						state.skyCannonMouseState = skyCannonMouseState
						return skyCannonMouseState
					end
				end

				return nil
			end

			return nil
		end

		local function fn22(arg, instance, target, owner)
			local state = arg.State
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			if not character2 then
				return false
			end

			if not instance then
				return false
			end

			if not target then
				return false
			end

			if not target.Parent then
				return false
			end

			if instance.Parent ~= character then
				character2:EquipTool(instance)
				task.wait(0.1)
				if not fn4(arg, owner) then
					return false
				end
			end

			if instance.Parent == character then
				if instance.Enabled then
					if not instance:GetAttribute("IsReloading_Client") then
						if not (os.clock() < (state.nextSkyCannonShotAt or 0)) then
							local v = fn20(state)
							local skyCannonMouseState = getSkyCannonMouseState(state, instance)

							if v then
								if skyCannonMouseState then
									state.nextSkyCannonShotAt = os.clock() + 0.35
									skyCannonMouseState.Hit = target.CFrame
									skyCannonMouseState.Target = target
									local v2 = nil

									if type(getthreadidentity) == "function" then
										local ok, result = pcall(getthreadidentity)

										if ok then
											v2 = result
										end
									end

									if type(setthreadidentity) == "function" then
										pcall(setthreadidentity, 2)
									end

									local ok, result = pcall(function()
										return v:Attack(instance, { UserInputType = Enum.UserInputType.MouseButton1 })
									end)

									if v2 then
										if type(setthreadidentity) == "function" then
											pcall(setthreadidentity, v2)
										end
									end

									state.lastSkyCannonShot = {
										success = ok,
										result = tostring(result),
										cloud = target:GetFullName(),
										at = os.clock(),
									}

									return true
								end
							end

							local lastSkyCannonShot = { success = false }
							local result = not v

							if result then
								result = "combat-controller-unavailable"
							end

							lastSkyCannonShot.result = result or "mouse-state-unavailable"
							lastSkyCannonShot.cloud = target:GetFullName()
							lastSkyCannonShot.at = os.clock()
							state.lastSkyCannonShot = lastSkyCannonShot
							return true
						end
					end
				end
			end

			return true
		end

		local function fn23(arg, part, arg2, owner)
			local state = arg.State
			local cannon = getCannon(arg, owner)
			if not fn4(arg, owner) then
				return true
			end

			if cannon then
				local instance, cloudDistance = fn18(arg2.From)

				if instance then
					local n11 = arg2.From * CFrame.new(0, -5, 30)
					state.lastTravelDecision.mode = "sky-cloud"
					state.lastTravelDecision.cloud = instance:GetFullName()
					state.lastTravelDecision.cloudDistance = cloudDistance
					state.status = "Auto Farm Level | Breaking Sky clouds"
					if (part.Position - n11.Position).Magnitude > 3 then
						fn9(arg, n11, owner, true)
						return true
					end
					arg.Functions.CancelTween()
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
					fn22(arg, cannon, instance, owner)
					return true
				end

				return false
			end

			local status = arg.Beli.Value >= 100000

			if status then
				status = "Auto Farm Level | Loading Cannon"
			end

			state.status = status or "Auto Farm Level | Need 100000 Beli for Cannon"
			state.lastTravelDecision.mode = "sky-cannon-required"
			return true
		end

		local function fn24(arg, part, arg2, owner, arg3, arg4)
			local state = arg.State
			local v = fn16(part.Position, arg2.Position)

			if v then
				local now = os.clock()
				local magnitude = (v.From.Position - part.Position).Magnitude
				local lastTravelDecision = {}
				local mode = magnitude > 50

				if mode then
					mode = "portal-approach"
				end

				lastTravelDecision.mode = mode or "portal-request"
				lastTravelDecision.reason = v.Name
				lastTravelDecision.destination = v.To.Position
				lastTravelDecision.portalFrom = v.From.Position
				lastTravelDecision.owner = owner
				lastTravelDecision.at = now
				lastTravelDecision.distance = magnitude
				lastTravelDecision.savings = v.Savings
				lastTravelDecision.goal = arg2.Position
				state.lastTravelDecision = lastTravelDecision

				if v.Name == "Sky Area 2" then
					if fn23(arg, part, v, owner) then
						return true
					end
				end

				if magnitude > 50 then
					state.status = "Auto Farm Level | Moving to " .. v.Name .. " portal"
					fn9(arg, v.From + Vector3.new(0, 5, 0), owner, true, arg3, arg4, nil, 350, 220)
					return true
				end

				arg.Functions.CancelTween()
				part.CFrame = v.From + Vector3.new(0, 2, 0)
				part.AssemblyLinearVelocity = Vector3.zero
				part.AssemblyAngularVelocity = Vector3.zero
				state.status = "Auto Farm Level | Entering " .. v.Name
				if now < (state.nextEntranceRequestAt or 0) then
					state.lastTravelDecision.mode = "portal-cooldown"
					return true
				end
				state.nextEntranceRequestAt = now + 2

				local success, result = fn8(arg, owner, function()
					return arg.CommandRemote:InvokeServer("requestEntrance", v.To.Position)
				end)

				if result == "travel-request-cancelled" then
					return true
				end
				state.lastTravelDecision.success = success
				state.lastTravelDecision.result = result

				if v.Name == "Whirl Pool" then
					fn17(arg)
				end

				return true
			end

			return false
		end

		local function fn25(position, position2)
			local flag = position.Z > 30000
			local flag2 = position2.Z > 30000

			if flag2 then
				if not flag then
					return tbl66.cursedShip, "cursed-ship"
				end
			end

			if flag then
				if not flag2 then
					return tbl66.surface, "cursed-ship-to-surface"
				end
			end

			return nil, nil
		end

		local function fn26(position, position2)
			local swanRoom = tbl66.swanRoom
			local flag = (position2 - swanRoom.Position).Magnitude <= 300
			if (position - swanRoom.Position).Magnitude <= 300 == flag then
				return nil
			end

			if flag then
				return { from = tbl66.mansion, to = swanRoom, name = "Swan's room" }
			end
			return { from = swanRoom, to = tbl66.mansion, name = "Mansion" }
		end

		local function fn27(arg, part, arg2, owner, arg3, arg4)
			local v = fn26(part.Position, arg2.Position)

			if v then
				local state = arg.State
				local now = os.clock()
				local magnitude = (part.Position - v.from.Position).Magnitude
				local lastTravelDecision = {}
				local mode = magnitude > 50

				if mode then
					mode = "swan-portal-approach"
				end

				lastTravelDecision.mode = mode or "swan-portal"
				lastTravelDecision.reason = v.name
				lastTravelDecision.destination = v.to.Position
				lastTravelDecision.owner = owner
				lastTravelDecision.at = now
				lastTravelDecision.distance = magnitude
				lastTravelDecision.goal = arg2.Position
				state.lastTravelDecision = lastTravelDecision
				state.status = "Auto Farm Level | Entering " .. v.name
				if magnitude > 50 then
					fn9(arg, v.from + Vector3.new(0, 5, 0), owner, true, arg3, arg4, nil, 350, 220)
					return true
				end
				arg.Functions.CancelTween()
				part.CFrame = v.from + Vector3.new(0, 2, 0)
				part.AssemblyLinearVelocity = Vector3.zero
				part.AssemblyAngularVelocity = Vector3.zero
				if now < (state.nextEntranceRequestAt or 0) then
					return true
				end
				state.nextEntranceRequestAt = now + 2

				local success, result = fn8(arg, owner, function()
					return arg.CommandRemote:InvokeServer("requestEntrance", v.to.Position)
				end)

				if result == "travel-request-cancelled" then
					return true
				end
				state.lastTravelDecision.success = success
				state.lastTravelDecision.result = result
				return true
			end

			return false
		end

		tbl32 = {
			stop = function(arg)
				local state = arg.State
				local fastTravelRequest = state.fastTravelRequest
				state.fastTravelGeneration = (state.fastTravelGeneration or 0) + 1
				state.cursedShipTransitionToken = nil
				state.cursedShipTransitionActive = nil
				state.cursedShipTransitionDeadline = nil

				if fastTravelRequest then
					fastTravelRequest.cancelled = true

					if fn5(fastTravelRequest.thread) then
						state.fastTravelRequest = nil
					end
				end

				fn5(state.cursedShipTransitionThread)
				state.cursedShipTransitionThread = nil
				fn6(state)
				fn7(state)
				state.submergedSettleUntil = nil
				state.submergedSettleDirection = nil
				state.skyCombatController = nil
				state.skyCannonMouseTool = nil
				state.skyCannonMouseState = nil
			end,
			run = function(arg, arg2, owner, arg3, arg4)
				local state = arg.State
				local humanoidRootPart = state.humanoidRootPart
				if state.travel then
					return false
				end

				if not humanoidRootPart then
					return false
				end

				if arg.Functions.ShouldCancelTP(arg2, owner) then
					return false
				end

				if state.cursedShipTransitionActive then
					return true
				end

				if arg.Functions.ShouldNotBypassTP then
					if arg.Functions.ShouldNotBypassTP() then
						state.lastTravelDecision = {
							mode = "tween",
							reason = "bypass-blocked",
							owner = owner,
							at = os.clock(),
							goal = arg2.Position,
						}

						return false
					end
				end

				if fn12(arg, humanoidRootPart, arg2, owner) then
					return true
				end

				if arg.IsSea(2) then
					if fn27(arg, humanoidRootPart, arg2, owner, arg3, arg4) then
						return true
					end
				end

				local magnitude = (arg2.Position - humanoidRootPart.Position).Magnitude

				if arg.IsSea(1) then
					if fn24(arg, humanoidRootPart, arg2, owner, arg3, arg4) then
						return true
					end
				end

				local v = nil
				local v2 = nil

				if arg.IsSea(2) then
					if magnitude > 4000 then
						v, v2 = fn25(humanoidRootPart.Position, arg2.Position)
					end
				end

				local now = os.clock()

				if v then
					if v2 == "cursed-ship-to-surface" then
						local map = getMap()

						if map then
							local magnitude2 = (map.Position - humanoidRootPart.Position).Magnitude

							state.lastTravelDecision = {
								mode = "physical-exit",
								reason = v2,
								destination = map.Position,
								owner = owner,
								at = now,
								distance = magnitude2,
								goal = arg2.Position,
							}

							if not (magnitude2 > 12) then
								fn14(arg, v2, v, arg2, owner)
								return true
							end
							fn9(arg, map.CFrame, owner, true, arg3, arg4)
							return true
						end
					end

					if v2 == "cursed-ship" then
						local magnitude2 = (cframe2.Position - humanoidRootPart.Position).Magnitude

						if magnitude2 > 12 then
							state.lastTravelDecision = {
								mode = "cursed-ship-entry-approach",
								reason = v2,
								destination = cframe2.Position,
								owner = owner,
								at = now,
								distance = magnitude2,
								goal = arg2.Position,
							}

							fn9(arg, cframe2, owner, nil, arg3, arg4, nil, 350, 220)
							return true
						end

						return fn14(arg, v2, v, arg2, owner)
					end

					if now < (state.nextEntranceRequestAt or 0) then
						state.lastTravelDecision = {
							mode = "entrance-cooldown",
							reason = v2,
							destination = v,
							owner = owner,
							at = now,
							distance = magnitude,
							goal = arg2.Position,
						}

						return true
					end

					state.nextEntranceRequestAt = now + 3

					local v3, v4 = fn8(arg, owner, function()
						return arg.CommandRemote:InvokeServer("requestEntrance", v)
					end)

					if v4 == "travel-request-cancelled" then
						return true
					end

					if v3 then
						if v2 ~= "cursed-ship-to-surface" then
							humanoidRootPart.CFrame += Vector3.new(0, 50, 0)
						end
					end

					state.lastTravelDecision = {
						mode = "entrance",
						reason = v2,
						destination = v,
						owner = owner,
						at = now,
						distance = magnitude,
						goal = arg2.Position,
						success = v3,
						result = v4,
					}

					return true
				end

				local lastTravelDecision = { mode = "tween" }
				local reason = magnitude <= 4000

				if reason then
					reason = "distance-at-most-4000"
				end

				lastTravelDecision.reason = reason or "no-clean-entrance-route"
				lastTravelDecision.destination = nil
				lastTravelDecision.owner = owner
				lastTravelDecision.at = os.clock()
				lastTravelDecision.distance = magnitude
				lastTravelDecision.goal = arg2.Position
				state.lastTravelDecision = lastTravelDecision
				return false
			end,
		}
	end

	tbl33 = { run = function(arg)
		local state = arg.State
		local movement = state.movement
		state.movement = nil
		state.movementPhase = "stopped"
		local movement2 = movement

		if movement2 then
			movement2 = movement.tween
		end

		movement2 = movement2 or state.activeTween2 or state.activeTween
		state.activeTween = nil
		state.activeTween2 = nil
		state.activeTweenGoal = nil
		state.activeTweenRoot = nil
		state.tpWaypoint = nil

		if movement2 then
			local playbackState = movement2.PlaybackState
			if playbackState == Enum.PlaybackState.Playing then
				movement2:Cancel()
				return
			end

			if playbackState == Enum.PlaybackState.Paused then
				movement2:Cancel()
			end
		end
	end }

	local function fn(state)
		local noclip = state.noclip
		state.noclip = nil
		state.noClipActive = false

		if noclip then
			for _, connection in noclip.connections do
				connection:Disconnect()
			end

			for k, v in noclip.parts do
				if k.Parent then
					k.CanCollide = v
				end
			end

			table.clear(noclip.parts)
			return
		end
	end

	tbl34 = { run = function(arg, arg2)
		local state = arg.State
		if arg2 ~= "on" then
			fn(state)
			return
		end
		local character = arg.LocalPlayer.Character
		if not character then
			return
		end

		if state.paused then
			return
		end

		if not state.stopped then
			if state.noclip then
				if state.noclip.character == character then
					return
				end
			end

			fn(state)
			local noclip = { character = character, parts = {}, connections = {} }
			state.noclip = noclip
			state.noClipActive = true

			local function onDescendantAdded(descendant)
				if descendant:IsA("BasePart") then
					if noclip.parts[descendant] == nil then
						noclip.parts[descendant] = descendant.CanCollide
					end

					descendant.CanCollide = false
				end
			end

			for _, v in character:GetDescendants() do
				onDescendantAdded(v)
			end

			local v, v2
			noclip.connections[1] = character.DescendantAdded:Connect(onDescendantAdded)
			local connections = noclip.connections

			local connection = character.DescendantRemoving:Connect(function(descendant)
				local part = noclip.parts[descendant]

				if part ~= nil then
					descendant.CanCollide = part
					noclip.parts[descendant] = nil
				end
			end)

			connections[2] = connection

			noclip.connections[3] = arg.RunService.PreSimulation:Connect(function()
				if state.noclip ~= noclip then
					return
				end
				local humanoid = character:FindFirstChildOfClass("Humanoid")

				if arg.LocalPlayer.Character == character then
					if state.paused then
						fn(state)
					elseif state.stopped then
						fn(state)
					elseif humanoid then
						if humanoid.Health > 0 then
							for k in noclip.parts do
								if k.Parent then
									if k.CanCollide then
										k.CanCollide = false
									end
								end
							end
						else
							fn(state)
						end
					else
						fn(state)
					end
				else
					fn(state)
				end
			end)

			return
		end
	end }

	do
		local function fn2(arg, arg2)
			return math.max(100 + (arg.speed or 350) * math.min(arg2 or 0.05, 0.05), arg.minimumDistance or 7)
		end

		local function fn3(arg, goal)
			if arg.IsSea(3) then
				if not (goal.Position.Y > -1000) then
					pcall(function()
						arg.RunService:UnbindFromRenderStep("GlitchCheck")
					end)

					arg.State.submergedGlitchCheckDisabled = true
				end
			end
		end

		tbl35 = { run = function(arg, arg2)
			local state = arg.State
			local functions = arg.Functions

			local function getGoal()
				if state.movement ~= arg2 then
					return nil
				end

				if state.paused then
					return nil
				end

				if state.stopped then
					return nil
				end

				if state.stopTweenRequested then
					return nil
				end

				if arg.LocalPlayer.Character ~= arg2.character then
					return nil
				end

				if not arg2.root.Parent then
					return nil
				end

				if arg2.humanoid.Health <= 0 then
					return nil
				end

				if arg.TaskQueue:top() ~= arg2.owner then
					return nil
				end
				local goal = arg2.goal

				if arg2.target then
					local parent = arg2.target.Parent

					if parent then
						parent = arg2.target:FindFirstChild("HumanoidRootPart")
					end

					local humanoid = arg2.target:FindFirstChildOfClass("Humanoid")
					if not parent then
						return nil
					end

					if humanoid then
						if humanoid.Health <= 0 then
							return nil
						end
					end

					goal = parent.CFrame + Vector3.new(0, 30, 0)
					if functions.ShouldCancelTP(goal, arg2.taskName, arg2.boss, arg2.fruit) then
						return nil
					end
					return goal
				end

				if functions.ShouldCancelTP(goal, arg2.taskName, arg2.boss, arg2.fruit) then
					return nil
				end
				return goal
			end

			local ok, result = xpcall(function()
				while true do
					local result = arg.RunService.Heartbeat:Wait()
					local goal = state.movement == arg2

					if goal then
						goal = getGoal()
					end

					if goal then
						fn3(arg, goal)
						local cframe = arg2.root.CFrame
						local magnitude = (goal.Position - cframe.Position).Magnitude
						arg2.arrival = fn2(arg2, result)

						if not (magnitude <= arg2.arrival) then
							functions.AddVelocity()
							functions.NoClip("on")
							local cframe2 = CFrame.new(cframe.Position + (goal.Position - cframe.Position).Unit * math.min(magnitude, (arg2.speed or 350) * math.min(result, 0.05)), goal.Position)
							arg2.tween = nil
							arg2.phase = "direct"
							arg2.phaseStartedAt = os.clock()

							state.movementPhase = "direct"
							state.activeTween = nil
							state.activeTween2 = nil
							state.activeTweenGoal = cframe2
							state.activeTweenRoot = arg2.root
							arg2.root.CFrame = cframe2
							arg2.pulses += 1
							continue
						end

						arg2.root.CFrame = goal
						arg2.arrived = true
						return
					end

					break
				end
			end, debug.traceback)

			if state.movement == arg2 then
				local ok2 = ok

				if ok2 then
					ok2 = arg2.arrived
				end

				functions.CancelTween()
				local ok3 = ok2

				if ok3 then
					ok3 = "arrived"
				end

				state.movementPhase = ok3 or "stopped"

				if ok2 then
					functions.AddVelocity()
					functions.NoClip("on")
				else
					functions.RemoveVelocity()
					functions.NoClip("off")
				end

				if not ok2 then
					if functions.ReleaseBring then
						functions.ReleaseBring()
					end
				end
			end

			if not ok then
				state.lastError = tostring(result)
				warn("[SeaHub][Movement] " .. tostring(result))
			end
		end }
	end

	do
		local function fn2(movement)
			return math.max(100 + (movement.speed or 350) * 0.05, movement.minimumDistance or 7)
		end

		local function fn3(state, goal, character, target)
			local magnitude = (goal.Position - character.Position).Magnitude
			local target2 = target or state.farmTarget
			local target3 = target2

			if target3 then
				target3 = target2.Parent
			end

			if target3 then
				target3 = target2:FindFirstChild("HumanoidRootPart")
			end

			local target4 = target3

			if target4 then
				target4 = (goal.Position - target3.Position).Magnitude <= 45
			end

			if target4 then
				return 350, 300, "combat-chase"
			end

			if magnitude > 1500 then
				return 350, 220, "long-route"
			end
			return 350, 300, "farm-route"
		end

		tbl36 = { run = function(arg, goal, taskName, arg2, boss, fruit, target, arg3, arg4)
			local state = arg.State
			local functions = arg.Functions
			if state.travel then
				return false
			end
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			local character3 = character

			if character3 then
				character3 = character:FindFirstChild("HumanoidRootPart")
			end

			if character2 then
				if character3 then
					if not (character2.Health <= 0) then
						if not state.paused then
							if not state.stopped then
								local environment = arg.Environment or {}
								local performanceFps = math.clamp(math.floor(tonumber((environment.Configs or {}).FPS) or 15), 5, 60)
								local value = rawget(environment, "setfpscap")

								if type(value) == "function" then
									pcall(value, performanceFps)
								end

								state.performanceFps = performanceFps

								if target then
									local parent = target.Parent

									if parent then
										parent = target:FindFirstChild("HumanoidRootPart")
									end

									if not parent then
										functions.StopTween()
										return false
									end
									goal = parent.CFrame + Vector3.new(0, 30, 0)
								end

								if functions.ShouldCancelTP(goal, taskName, boss, fruit) then
									return false
								end
								state.humanoid = character2
								state.humanoidRootPart = character3
								local taskName2 = taskName or arg.TaskQueue:top()
								local fruit2 = fruit

								if fruit2 then
									fruit2 = 3
								end

								fruit2 = fruit2 or 7

								if not arg2 then
									if state.bring then
										if type(functions.ReleaseBring) == "function" then
											pcall(functions.ReleaseBring)
										end
									end
								end

								if not state.fastTravelResolving then
									if functions.TryFastTravel(goal, taskName2, boss, fruit) then
										return false
									end
								end

								local movement = state.movement

								if movement then
									if movement.root == character3 then
										if movement.owner == taskName2 then
											local v, v2, profile = fn3(state, goal, character3, target)
											local speed = tonumber(arg3) or v
											local stepDistance = tonumber(arg4) or v2

											movement.goal = goal
											movement.taskName = taskName
											movement.boss = boss
											movement.fruit = fruit
											movement.target = target
											movement.minimumDistance = fruit2
											movement.speed = speed
											movement.arrival = fn2(movement)
											movement.stepDistance = stepDistance
											movement.profile = profile
											state.movementProfile = profile
											state.movementSpeed = speed
											return false
										end
									end
								end

								local value2 = select(1, fn3(state, goal, character3, target))
								local distance = math.max(100 + (tonumber(arg3) or value2) * 0.05, fruit2)

								if not ((goal.Position - character3.Position).Magnitude <= distance) then
									functions.CancelTween()
									functions.AddVelocity()
									functions.NoClip("on")

									if character2.Sit then
										character2.Sit = false
										character2.Jump = true
									end

									local v, v2, movementProfile = fn3(state, goal, character3, target)
									local movementSpeed = tonumber(arg3) or v

									local movement2 = {
										root = character3,
										humanoid = character2,
										character = character,
										owner = taskName2,
										goal = goal,
										taskName = taskName,
										boss = boss,
										fruit = fruit,
										target = target,
										arrival = distance,
										minimumDistance = fruit2,
										speed = movementSpeed,
										stepDistance = tonumber(arg4) or v2,
										profile = movementProfile,
										pulses = 0,
										phase = "starting",
										phaseStartedAt = os.clock(),
									}

									state.movement = movement2
									state.movementPhase = "starting"
									state.movementProfile = movementProfile
									state.movementSpeed = movementSpeed
									movement2.thread = task.spawn(functions.RunMovement, movement2)
									return false
								end

								character3.CFrame = goal
								local movementSpeed, v, movementProfile = fn3(state, goal, character3, target)
								functions.CancelTween()
								functions.AddVelocity()
								functions.NoClip("on")
								state.movementPhase = "arrived"
								state.movementProfile = movementProfile
								state.movementSpeed = movementSpeed
								return true
							end
						end
					end
				end
			end

			functions.StopTween()
			return false
		end }
	end

	tbl37 = { run = function(arg, arg2)
		local state = arg.State
		local functions = arg.Functions
		state.stopTweenRequested = true
		state.teleportInProgress = false
		state.travel = nil

		if type(functions.StopFastTravel) == "function" then
			functions.StopFastTravel()
		end

		state.cursedShipTransitionToken = nil

		if type(state.cursedShipTransitionThread) == "thread" then
			if type(task.cancel) == "function" then
				pcall(task.cancel, state.cursedShipTransitionThread)
			end
		end

		state.cursedShipTransitionThread = nil
		state.cursedShipTransitionActive = nil
		functions.CancelTween()
		local flag = type(arg2) == "table"

		if flag then
			flag = arg2.preserveAltitude == true
		end

		if flag then
			flag = not state.paused
		end

		if flag then
			flag = not state.stopped
		end

		if flag then
			flag = arg.TaskQueue:top() ~= nil
		end

		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		if flag then
			if character2 then
				if character2.Health > 0 then
					functions.AddVelocity()
					functions.NoClip("on")
				else
					functions.RemoveVelocity()
				end
			else
				functions.RemoveVelocity()
			end
		else
			functions.RemoveVelocity()
		end

		if functions.ReleaseBring then
			functions.ReleaseBring()
		end

		if functions.ReleaseBossCombat then
			functions.ReleaseBossCombat()
		end

		state.namecallTarget = nil
		state.stopTweenRequested = false
	end }

	do
		local n5 = 60
		local delay = 0.35
		local n6 = 0.35
		local n7 = 10
		local n8 = 5

		local function fn2(state, arg, now)
			local bringRecoveryUntil = state.bringRecoveryUntil
			local bringRecoveryUntil2 = bringRecoveryUntil

			if bringRecoveryUntil2 then
				bringRecoveryUntil2 = bringRecoveryUntil[arg]
			end

			if bringRecoveryUntil2 then
				if now < bringRecoveryUntil2 then
					return false
				end
				bringRecoveryUntil[arg] = nil
				return true
			end

			return true
		end

		local function fn3(arg)
			local tbl63 = {}

			if type(arg) == "table" then
				for _, v in arg do
					if type(v) == "string" then
						if v ~= "" then
							tbl63[v] = true
						end
					end
				end
			elseif type(arg) == "string" then
				if arg ~= "" then
					tbl63[arg] = true
				end
			end

			return tbl63
		end

		local function fn4(names)
			local tbl63 = {}

			for k in names do
				tbl63[#tbl63 + 1] = k
			end

			table.sort(tbl63)
			return table.concat(tbl63, "\0")
		end

		local function fn5(names)
			local tbl63 = {}

			for k in names do
				tbl63[#tbl63 + 1] = k
			end

			table.sort(tbl63)
			return tbl63
		end

		local function fn6(bring)
			local tbl63 = {}

			for k in bring.members do
				local attribute = k:GetAttribute("BringSlot")

				if type(attribute) == "number" then
					tbl63[attribute] = true
				end
			end

			local n9 = 1

			while tbl63[n9] do
				n9 += 1
			end

			return n9
		end

		local function fn7(instance, arg, raidIsland)
			if raidIsland then
				if arg then
					local attribute = instance:GetAttribute("OldPosition")

					if typeof(attribute) ~= "Vector3" then
						attribute = arg.Position
					end

					local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
					local worldOrigin2 = worldOrigin

					if worldOrigin2 then
						worldOrigin2 = worldOrigin:FindFirstChild("Locations")
					end

					local instance3 = nil
					local magnitude2 = math.huge
					local worldOrigin3 = worldOrigin2

					if worldOrigin3 then
						worldOrigin3 = worldOrigin2:GetChildren()
					end

					worldOrigin3 = worldOrigin3 or {}

					for _, instance2 in worldOrigin3 do
						if not instance2:IsA("BasePart") then
							continue
						end

						if not instance2.Name:match("^Island %d+$") then
							continue
						end

						if instance2.Position.Magnitude > 7000 then
							local offset = attribute - instance2.Position
							local magnitude = Vector3.new(offset.X, 0, offset.Z).Magnitude

							if magnitude < magnitude2 then
								magnitude2 = magnitude
								instance3 = instance2
							end
						end
					end

					local flag = instance3 == raidIsland

					if flag then
						flag = magnitude2 <= 650
					end

					if flag then
						flag = math.abs(attribute.Y - raidIsland.Position.Y) <= 500
					end

					return flag
				end
			end

			return raidIsland == nil
		end

		local function getPlayer(instance, player)
			local player2 = instance:GetAttribute("IsBoss") == true

			if not player2 then
				player2 = player

				if player2 then
					player2 = string.find(string.lower(tostring(player.DisplayName or "")), "boss", 1, true) ~= nil
				end
			end

			return player2
		end

		local function fn8(bring, instance, humanoid, parent, allowActions)
			local tbl63 = {
				root = parent,
				humanoid = humanoid,
				walkSpeed = humanoid.WalkSpeed,
				autoRotate = humanoid.AutoRotate,
				anchored = parent.Anchored,
				collisions = {},
				lastOwnedAt = os.clock(),
				reacquires = 0,
			}

			if instance:GetAttribute("OldPosition") == nil then
				instance:SetAttribute("OldPosition", parent.Position)
			end

			instance:SetAttribute("IsGrabbed", true)
			instance:SetAttribute("BringSlot", fn6(bring))

			if not allowActions then
				tbl63.collisions[parent] = parent.CanCollide
				humanoid.WalkSpeed = 0
				humanoid.AutoRotate = false
				parent.Anchored = false
				parent.CanCollide = false
				local freezeVelocity = parent:FindFirstChild("FreezeVelocity") or Instance.new("BodyVelocity")
				freezeVelocity.Name = "FreezeVelocity"
				freezeVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				freezeVelocity.Velocity = Vector3.zero
				freezeVelocity.Parent = parent
				tbl63.freezeVelocity = freezeVelocity
			end

			return tbl63
		end

		local function fn9(arg, allowActions)
			local humanoid = arg.humanoid

			if humanoid then
				if humanoid.Parent then
					if not allowActions then
						humanoid.WalkSpeed = arg.walkSpeed
						humanoid.AutoRotate = arg.autoRotate
					end
				end
			end

			for k, v in arg.collisions do
				if k.Parent then
					k.CanCollide = v
				end
			end

			if arg.freezeVelocity then
				if arg.freezeVelocity.Parent then
					arg.freezeVelocity:Destroy()
				end
			end

			if arg.root then
				if arg.root.Parent then
					arg.root.Anchored = arg.anchored
				end
			end

			local humanoid2 = humanoid

			if humanoid2 then
				humanoid2 = humanoid.Parent
			end

			if humanoid2 then
				humanoid2:SetAttribute("IsGrabbed", nil)
				humanoid2:SetAttribute("BringSlot", nil)
			end
		end

		tbl38 = {
			release = function(arg)
				local state = arg.State
				local bring = state.bring
				state.bring = nil
				state.bringReacquireToken = nil
				state.bringOwnedCount = 0
				state.bringPendingOwnershipCount = 0

				if bring then
					if bring.connection then
						bring.connection:Disconnect()
					end

					for _, v in bring.members do
						fn9(v, bring.allowActions)
					end
				end
			end,
			run = function(arg, arg2, arg3, arg4, target)
				local state = arg.State
				local functions = arg.Functions
				if typeof(arg2) ~= "CFrame" then
					return nil
				end

				if state.paused then
					return nil
				end

				if state.stopped then
					return nil
				end
				local character = arg.LocalPlayer.Character
				local character4 = character

				if character4 then
					character4 = character:FindFirstChild("HumanoidRootPart")
				end

				local character5 = character

				if character5 then
					character5 = character:FindFirstChildOfClass("Humanoid")
				end

				if character4 then
					if character5 then
						if not (character5.Health <= 0) then
							local v = arg.TaskQueue:top()
							local now = os.clock()
							local bring = state.bring
							local allowActions = type(arg4) == "table"

							if allowActions then
								allowActions = arg4.allowActions == true
							end

							local scanRadius = type(arg4) == "table"

							if scanRadius then
								scanRadius = tonumber(arg4.scanRadius)
							end

							scanRadius = scanRadius or 320
							local maxMembers = type(arg4) == "table"

							if maxMembers then
								maxMembers = tonumber(arg4.maxMembers)
							end

							maxMembers = maxMembers or 10
							local raidIsland = type(arg4) == "table"

							if raidIsland then
								raidIsland = arg4.raidIsland
							end

							raidIsland = raidIsland or nil
							local names = fn3(arg3)
							local nameKey = fn4(names)

							if nameKey == "" then
								if bring then
									functions.ReleaseBring()
								end

								return nil
							end

							if now < (state.bringPausedUntil or 0) then
								local bring2 = bring

								if bring2 then
									bring2 = bring.anchor
								end

								return bring2 or nil
							end

							if target then
								if names[target.Name] then
									if not functions.IsActiveEnemyModel(target, target.Name) then
										target = nil
									end
								else
									target = nil
								end
							end

							functions.RefreshSimulationRadius()

							if bring then
								if bring.task == v then
									if raidIsland then
										if bring.allowActions == allowActions then
											if bring.scanRadius == scanRadius then
												if bring.maxMembers == maxMembers then
													if bring.raidIsland ~= raidIsland then
														functions.ReleaseBring()
														bring = nil
													end
												else
													functions.ReleaseBring()
													bring = nil
												end
											else
												functions.ReleaseBring()
												bring = nil
											end
										else
											functions.ReleaseBring()
											bring = nil
										end
									elseif bring.nameKey == nameKey then
										if bring.allowActions == allowActions then
											if bring.scanRadius == scanRadius then
												if bring.maxMembers == maxMembers then
													if bring.raidIsland ~= raidIsland then
														functions.ReleaseBring()
														bring = nil
													end
												else
													functions.ReleaseBring()
													bring = nil
												end
											else
												functions.ReleaseBring()
												bring = nil
											end
										else
											functions.ReleaseBring()
											bring = nil
										end
									else
										functions.ReleaseBring()
										bring = nil
									end
								else
									functions.ReleaseBring()
									bring = nil
								end
							end

							if not bring then
								if (character4.Position - arg2.Position).Magnitude > 80 then
									return nil
								end
								local anchor = CFrame.new(arg2.Position) * arg2.Rotation
								state.bringReacquireToken = nil
								local tbl63 = { task = v }
								local target2 = target

								if target2 then
									target2 = target.Name
								end

								tbl63.name = target2 or arg3
								tbl63.names = names
								tbl63.nameKey = nameKey
								tbl63.target = target
								tbl63.anchor = anchor
								tbl63.members = {}
								tbl63.candidates = {}
								tbl63.updatedAt = now
								tbl63.scannedAt = -1
								tbl63.allowActions = allowActions
								tbl63.scanRadius = scanRadius
								tbl63.maxMembers = maxMembers
								tbl63.raidIsland = raidIsland
								tbl63.heldSince = now
								tbl63.lastCleanupAt = now
								bring = tbl63
								state.bring = bring

								bring.connection = arg.RunService.Heartbeat:Connect(function()
									if state.bring ~= bring then
										return
									end
									local character2 = arg.LocalPlayer.Character

									if character2 then
										character2 = arg.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
									end

									if not state.paused then
										if not state.stopped then
											if arg.TaskQueue:top() == bring.task then
												if character2 then
													if not (character2.Health <= 0) then
														if not bring.raidIsland then
															if not bring.allowActions then
																if n5 <= os.clock() - bring.heldSince then
																	local anchor2 = bring.anchor
																	local v2 = fn5(bring.names)
																	local task_ = bring.task

																	local tbl64 = {
																		allowActions = bring.allowActions,
																		scanRadius = bring.scanRadius,
																		maxMembers = bring.maxMembers,
																		raidIsland = bring.raidIsland,
																	}

																	state.bringPausedUntil = os.clock() + delay
																	state.lastBringReacquireAt = os.clock()
																	state.bringReacquireCycles = (state.bringReacquireCycles or 0) + 1
																	functions.ReleaseBring()
																	local bringReacquireToken = {}
																	state.bringReacquireToken = bringReacquireToken

																	task.delay(delay, function()
																		if state.bringReacquireToken ~= bringReacquireToken then
																			return
																		end
																		state.bringReacquireToken = nil

																		if not state.stopped then
																			if not state.paused then
																				if arg.TaskQueue:top() == task_ then
																					if not state.bring then
																						functions.BringMob(anchor2, v2, tbl64, nil)
																					end
																				end
																			end
																		end
																	end)

																	return
																end
															end
														end

														local bringOwnedCount = 0
														local bringPendingOwnershipCount = 0
														local flag = os.clock() - bring.lastCleanupAt >= 3

														if flag then
															bring.lastCleanupAt = os.clock()
														end

														for k, v2 in bring.members do
															local root = v2.root
															local humanoid = v2.humanoid

															if bring.names[k.Name] then
																if functions.IsActiveEnemyModel(k, k.Name) then
																	if root.Parent then
																		if humanoid.Parent then
																			if humanoid.Health > 0 then
																				if not bring.raidIsland then
																					if (k:GetAttribute("FailureCount") or 0) > 5 then
																						fn9(v2, bring.allowActions)
																						bring.members[k] = nil
																						continue
																					end
																				end

																				local character3 = arg.LocalPlayer.Character

																				if character3 then
																					character3 = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
																				end

																				if flag then
																					if character3 then
																						if bring.scanRadius + 250 < (root.Position - character3.Position).Magnitude then
																							fn9(v2, bring.allowActions)
																							bring.members[k] = nil
																							continue
																						end
																					end
																				end

																				local character6 = character3

																				if character6 then
																					character6 = root.Position - character3.Position
																				end

																				local character7 = character6

																				if character7 then
																					character7 = Vector3.new(character6.X, 0, character6.Z).Magnitude <= 30
																				end

																				local v3 = functions.IsNetworkOwner(root)
																				local character8 = not bring.raidIsland

																				if character8 then
																					character8 = not bring.allowActions
																				end

																				if character8 then
																					character8 = not arg.LocalPlayer:GetAttribute("IslandRaiding")
																				end

																				if character8 then
																					character8 = k.Name ~= "Core"
																				end

																				if character8 then
																					character8 = character7
																				end

																				if character8 then
																					character8 = v3
																				end

																				if character8 then
																					character8 = state.lastAttackSent == true
																				end

																				if character8 then
																					character8 = os.clock() - (state.lastAttackAt or -math.huge) <= 1
																				end

																				if character8 then
																					if v2.ghostHealth ~= humanoid.Health then
																						v2.ghostHealth = humanoid.Health
																						v2.ghostSince = os.clock()
																					elseif n7 <= os.clock() - (v2.ghostSince or os.clock()) then
																						fn9(v2, bring.allowActions)
																						bring.members[k] = nil
																						state.bringRecoveryUntil = state.bringRecoveryUntil or setmetatable({}, { __mode = "k" })
																						state.bringRecoveryUntil[k] = os.clock() + n8
																						state.lastBringRecovery = "stalled-member-released"
																						continue
																					end
																				else
																					v2.ghostHealth = nil
																					v2.ghostSince = nil
																				end

																				if v3 then
																					if v2.waitingForOwnership then
																						v2.reacquires += 1
																						state.bringReacquireCount = (state.bringReacquireCount or 0) + 1
																					end

																					v2.waitingForOwnership = nil
																					v2.lastOwnedAt = os.clock()
																					bringOwnedCount += 1
																				else
																					v2.waitingForOwnership = true
																					bringPendingOwnershipCount += 1
																				end

																				if not bring.allowActions then
																					humanoid.WalkSpeed = 0
																					humanoid.AutoRotate = false
																					root.Anchored = false
																					root.CanCollide = false
																					root.AssemblyLinearVelocity = Vector3.zero
																					root.AssemblyAngularVelocity = Vector3.zero
																				end

																				local magnitude = (root.Position - bring.anchor.Position).Magnitude
																				local raidIsland2, raidIsland3, raidIsland4

																				if bring.raidIsland then
																					if magnitude > 20 then
																						state.lastBringReacquireDistance = magnitude
																					end

																					raidIsland2 = bring.raidIsland

																					if raidIsland2 then
																						raidIsland2 = arg.LocalPlayer.Character
																					end

																					if raidIsland2 then
																						raidIsland2 = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
																					end

																					raidIsland3 = raidIsland2

																					if raidIsland3 then
																						raidIsland3 = CFrame.new(raidIsland2.Position - Vector3.new(0, 30, 0))
																					end

																					raidIsland3 = raidIsland3 or bring.anchor
																					raidIsland4 = raidIsland3

																					pcall(function()
																						root.CFrame = raidIsland4
																						root.AssemblyLinearVelocity = Vector3.zero
																						root.AssemblyAngularVelocity = Vector3.zero
																					end)
																				elseif magnitude > 0.05 then
																					if magnitude > 20 then
																						state.lastBringReacquireDistance = magnitude
																					end

																					raidIsland2 = bring.raidIsland

																					if raidIsland2 then
																						raidIsland2 = arg.LocalPlayer.Character
																					end

																					if raidIsland2 then
																						raidIsland2 = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
																					end

																					raidIsland3 = raidIsland2

																					if raidIsland3 then
																						raidIsland3 = CFrame.new(raidIsland2.Position - Vector3.new(0, 30, 0))
																					end

																					raidIsland3 = raidIsland3 or bring.anchor
																					raidIsland4 = raidIsland3

																					pcall(function()
																						root.CFrame = raidIsland4
																						root.AssemblyLinearVelocity = Vector3.zero
																						root.AssemblyAngularVelocity = Vector3.zero
																					end)
																				end
																			else
																				fn9(v2, bring.allowActions)
																				bring.members[k] = nil
																			end

																			continue
																		end
																	end
																end
															end

															fn9(v2, bring.allowActions)
															bring.members[k] = nil
														end

														state.bringOwnedCount = bringOwnedCount
														state.bringPendingOwnershipCount = bringPendingOwnershipCount
														return
													end
												end
											end
										end
									end

									functions.ReleaseBring()
								end)

								if target then
									local v2, v3, v4 = functions.IsActiveEnemyModel(target, target.Name)
									local raidIsland2 = raidIsland

									if not raidIsland2 then
										raidIsland2 = not getPlayer(target, v3)

										if raidIsland2 then
											raidIsland2 = not target:GetAttribute("IgnoreGrab")
										end

										if raidIsland2 then
											raidIsland2 = (target:GetAttribute("FailureCount") or 0) <= 7
										end
									end

									if v2 then
										if raidIsland2 then
											if raidIsland then
												if raidIsland then
													bring.members[target] = fn8(bring, target, v3, v4, allowActions)
												elseif functions.IsNetworkOwner(v4) then
													bring.members[target] = fn8(bring, target, v3, v4, allowActions)
												end
											elseif fn2(state, target, now) then
												if raidIsland then
													bring.members[target] = fn8(bring, target, v3, v4, allowActions)
												elseif functions.IsNetworkOwner(v4) then
													bring.members[target] = fn8(bring, target, v3, v4, allowActions)
												end
											end
										end
									end
								end
							end

							if raidIsland then
								for k in names do
									bring.names[k] = true
								end

								bring.nameKey = fn4(bring.names)
							end

							bring.updatedAt = now

							if n6 <= now - bring.scannedAt then
								bring.scannedAt = now
								local count = 0

								for k in bring.members do
									count += 1
								end

								for _, instance in workspace.Enemies:GetChildren() do
									if bring.maxMembers <= count then
										break
									end
									local v2, v3, v4 = functions.IsActiveEnemyModel(instance, instance.Name)
									local flag = not raidIsland or fn7(instance, v4, raidIsland)
									local raidIsland2 = raidIsland

									if not raidIsland2 then
										raidIsland2 = not getPlayer(instance, v3)

										if raidIsland2 then
											raidIsland2 = not instance:GetAttribute("IgnoreGrab")
										end

										if raidIsland2 then
											raidIsland2 = (instance:GetAttribute("FailureCount") or 0) <= 7
										end
									end

									if bring.names[instance.Name] then
										if v2 then
											if raidIsland2 then
												if bring.members[instance] then
													if not bring.members[instance] then
														bring.candidates[instance] = nil
													end

													continue
												end

												local v5

												if raidIsland then
													if raidIsland then
														if flag then
															if not raidIsland then
																if not ((v4.Position - bring.anchor.Position).Magnitude <= bring.scanRadius) then
																	if bring.members[instance] then
																		continue
																	end
																	bring.candidates[instance] = nil
																	continue
																end
															end

															v5 = fn8(bring, instance, v3, v4, bring.allowActions)
															bring.members[instance] = v5
															bring.candidates[instance] = nil
															count += 1
															continue
														end

														if not bring.members[instance] then
															bring.candidates[instance] = nil
														end

														continue
													end

													if functions.IsNetworkOwner(v4) then
														if flag then
															if not raidIsland then
																if not ((v4.Position - bring.anchor.Position).Magnitude <= bring.scanRadius) then
																	if bring.members[instance] then
																		continue
																	end
																	bring.candidates[instance] = nil
																	continue
																end
															end

															v5 = fn8(bring, instance, v3, v4, bring.allowActions)
															bring.members[instance] = v5
															bring.candidates[instance] = nil
															count += 1
															continue
														end

														if not bring.members[instance] then
															bring.candidates[instance] = nil
														end

														continue
													end

													if not bring.members[instance] then
														bring.candidates[instance] = nil
													end

													continue
												end

												if fn2(state, instance, now) then
													if raidIsland then
														if flag then
															if not raidIsland then
																if not ((v4.Position - bring.anchor.Position).Magnitude <= bring.scanRadius) then
																	if bring.members[instance] then
																		continue
																	end
																	bring.candidates[instance] = nil
																	continue
																end
															end

															v5 = fn8(bring, instance, v3, v4, bring.allowActions)
															bring.members[instance] = v5
															bring.candidates[instance] = nil
															count += 1
															continue
														end

														if not bring.members[instance] then
															bring.candidates[instance] = nil
														end

														continue
													end

													if functions.IsNetworkOwner(v4) then
														if flag then
															if not raidIsland then
																if not ((v4.Position - bring.anchor.Position).Magnitude <= bring.scanRadius) then
																	if bring.members[instance] then
																		continue
																	end
																	bring.candidates[instance] = nil
																	continue
																end
															end

															v5 = fn8(bring, instance, v3, v4, bring.allowActions)
															bring.members[instance] = v5
															bring.candidates[instance] = nil
															count += 1
															continue
														end

														if not bring.members[instance] then
															bring.candidates[instance] = nil
														end

														continue
													end

													if not bring.members[instance] then
														bring.candidates[instance] = nil
													end

													continue
												end

												if not bring.members[instance] then
													bring.candidates[instance] = nil
												end

												continue
											end

											if not bring.members[instance] then
												bring.candidates[instance] = nil
											end

											continue
										end

										if not bring.members[instance] then
											bring.candidates[instance] = nil
										end

										continue
									end

									if not bring.members[instance] then
										bring.candidates[instance] = nil
									end
								end
							end

							local anchor = next(bring.members)

							if anchor then
								anchor = bring.anchor
							end

							return anchor or nil
						end
					end
				end

				return nil
			end,
		}
	end

	tbl39 = { run = function(arg)
		local state = arg.State
		if state.paused then
			return false
		end

		if state.stopped then
			return false
		end
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		if character2 then
			if not (character2.Health <= 0) then
				if character:FindFirstChild("HasBuso") then
					state.busoEnabled = true
					state.busoState = "enabled"
					return true
				end

				state.busoEnabled = false
				local now = os.clock()
				if now - (state.lastBusoAt or -2) < 2 then
					return false
				end
				state.lastBusoAt = now
				state.busoState = "requested"
				arg.CommandRemote:InvokeServer("Buso")
				return character:FindFirstChild("HasBuso") ~= nil
			end
		end

		return false
	end }

	local function fn2(arg)
		local parent = arg

		while parent do
			if parent:IsA("GuiObject") then
				if parent.Visible then
					parent = parent.Parent
					continue
				end
				return false
			end

			break
		end

		return true
	end

	local function fn3(instance, name)
		local playerGui = instance:FindFirstChildOfClass("PlayerGui")
		if not playerGui then
			return nil
		end
		local str = tostring(name):lower()
		local flag = str == "pirates"

		if flag then
			flag = { "pirates", "pirate" }
		end

		if not flag then
			flag = str == "marines"

			if flag then
				flag = { "marines", "marine" }
			end
		end

		flag = flag or { str }
		local mainMinimal = type(playerGui.FindFirstChild) == "function"

		if mainMinimal then
			mainMinimal = playerGui:FindFirstChild("Main (minimal)")
		end

		mainMinimal = mainMinimal or nil
		local mainMinimal2 = mainMinimal

		if mainMinimal2 then
			mainMinimal2 = mainMinimal:FindFirstChild("ChooseTeam")
		end

		local mainMinimal3 = mainMinimal2

		if mainMinimal3 then
			mainMinimal3 = mainMinimal2:FindFirstChild("Container")
		end

		local mainMinimal4 = mainMinimal3

		if mainMinimal4 then
			mainMinimal4 = mainMinimal3:FindFirstChild(name)
		end

		local mainMinimal5 = mainMinimal4

		if mainMinimal5 then
			mainMinimal5 = mainMinimal4:FindFirstChild("Frame")
		end

		local mainMinimal6 = mainMinimal5

		if mainMinimal6 then
			mainMinimal6 = mainMinimal5:FindFirstChild("TextButton")
		end

		if mainMinimal6 then
			if mainMinimal6:IsA("GuiButton") then
				if fn2(mainMinimal6) then
					return mainMinimal6
				end
			end
		end

		local instance3 = nil
		local v = nil

		for _, instance2 in playerGui:GetDescendants() do
			if not instance2:IsA("GuiButton") then
				continue
			end

			if not fn2(instance2) then
				continue
			end
			local isTextButton = instance2:IsA("TextButton")

			if isTextButton then
				isTextButton = instance2.Text:lower()
			end

			isTextButton = isTextButton or ""
			local name2 = instance2.Name:lower()
			local fullName = instance2:GetFullName():lower()
			local n5 = 0

			for _, v2 in flag do
				if isTextButton ~= v2 then
					if name2 == v2 then
						n5 = math.max(n5, 100)
					end
				else
					n5 = math.max(n5, 100)
				end

				if isTextButton:find(v2, 1, true) then
					n5 = math.max(n5, 40)
				end

				if name2:find(v2, 1, true) then
					n5 = math.max(n5, 30)
				end
			end

			if fullName:find("chooseteam", 1, true) then
				n5 += 20
			elseif fullName:find("choose team", 1, true) then
				n5 += 20
			elseif fullName:find("teamselection", 1, true) then
				n5 += 20
			elseif fullName:find("pick", 1, true) then
				n5 += 20
			end

			if not (n5 > 0) then
				continue
			end

			if v then
				if not (v < n5) then
					continue
				end
			end

			instance3 = instance2
			v = n5
		end

		return instance3
	end

	local function fn4(button)
		local tbl63 = {
			{ name = "MouseButton1Down", signal = button.MouseButton1Down },
			{ name = "Activated", signal = button.Activated },
			{ name = "MouseButton1Click", signal = button.MouseButton1Click },
		}

		if type(firesignal) == "function" then
			local names = {}

			for _, v in tbl63 do
				if pcall(firesignal, v.signal) then
					names[#names + 1] = v.name
				end
			end

			if #names > 0 then
				return true, "firesignal:" .. table.concat(names, "+")
			end
		end

		if type(getconnections) == "function" then
			local names = {}

			if pcall(function()
				for _, v in tbl63 do
					for _, v2 in getconnections(v.signal) do
						if type(v2.Fire) == "function" then
							v2:Fire()
							names[#names + 1] = v.name
						end
					end
				end
			end) then
				if #names > 0 then
					return true, "connections:" .. table.concat(names, "+")
				end
			end
		end

		local absolutePosition = button.AbsolutePosition
		local absoluteSize = button.AbsoluteSize
		local VirtualInputManager = game:GetService("VirtualInputManager")
		local n5 = absolutePosition.X + absoluteSize.X / 2
		local n6 = absolutePosition.Y + absoluteSize.Y / 2

		local ok, result = pcall(function()
			VirtualInputManager:SendMouseButtonEvent(n5, n6, 0, true, game, 0)
			task.wait(0.05)
			VirtualInputManager:SendMouseButtonEvent(n5, n6, 0, false, game, 0)
		end)

		local ok2 = ok
		local ok3 = ok

		if ok3 then
			ok3 = "virtual-input"
		end

		return ok2, ok3 or tostring(result)
	end

	local function fn5(instance)
		if instance:GetAttribute("DataLoaded") == false then
			return false
		end
		local data = instance:FindFirstChild("Data")
		local flag = data ~= nil

		if flag then
			flag = data:FindFirstChild("Level") ~= nil
		end

		return flag
	end

	tbl40 = {
		run = function(arg)
			local localPlayer = arg.LocalPlayer
			if localPlayer.Team then
				arg.State.teamState = "ready"
				return true
			end
			local now = os.clock()

			if fn5(localPlayer) then
				if now - (arg.State.lastTeamRequestAt or -1) < 1 then
					return false
				end
				arg.State.lastTeamRequestAt = now
				local desiredTeam = arg.DesiredTeam or "Pirates"
				local tbl63 = {}
				local ok = false
				local v = nil
				local exitTo = nil

				for _, v2 in { "SetTeam2", "SetTeam" } do
					local ok2, result = pcall(function()
						return arg.CommandRemote:InvokeServer(v2, desiredTeam)
					end)

					tbl63[#tbl63 + 1] = { Command = v2, Ok = ok2, Result = result }
					ok = ok or ok2
					v = result
					if localPlayer.Team then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
				end

				arg.State.lastTeamRequest = { At = now, Team = desiredTeam, Ok = ok, Result = v, Attempts = tbl63 }
				local state = arg.State
				local ok2 = ok

				if ok2 then
					ok2 = "requested"
				end

				state.teamState = ok2 or "failed"
				local state2 = arg.State

				if ok then
				end

				state2.lastTeamError = tostring(v)

				if not localPlayer.Team then
					if (arg.State.nextTeamGuiAttemptAt or 0) <= now then
						arg.State.nextTeamGuiAttemptAt = now + 2.5
						local instance = fn3(localPlayer, desiredTeam)

						if instance then
							local v2, v3 = fn4(instance)
							arg.State.lastTeamGuiAttempt = { At = now, Team = desiredTeam, Button = instance:GetFullName(), Ok = v2, Method = v3 }

							if v2 then
								arg.State.teamState = "gui-requested"
							end
						else
							arg.State.lastTeamGuiAttempt = { At = now, Team = desiredTeam, Ok = false, Method = "button-not-found" }
						end
					end
				end

				return localPlayer.Team ~= nil
			end

			arg.State.teamState = "waiting-player-data"
			return false
		end,
		findTeamButton = fn3,
		playerDataReady = fn5,
	}

	tbl41 = { run = function(arg)
		local state = arg.State
		if state.paused then
			return false
		end

		if state.stopped then
			return false
		end
		local exitTo = nil
		local n5, n6, data2, now, melee2, defense2, sword2

		while true do
			if state.autoStatsEnabled == false then
				exitTo = 1
				break
			end
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			n5 = 341068871
			if not character2 then
				break
			end

			if character2.Health <= 0 then
				break
			end
			n6 = 1065292196
			local data = arg.LocalPlayer:FindFirstChild("Data")
			data2 = data

			if data2 then
				data2 = data:FindFirstChild("Points")
			end

			local data3 = data

			if data3 then
				data3 = data:FindFirstChild("Stats")
			end

			local data4 = data2

			if data4 then
				data4 = math.max(0, math.floor(tonumber(data2.Value) or 0))
			end

			if (data4 or 0) == 0 then
				exitTo = 2
				break
			end

			if not data3 then
				exitTo = 3
				break
			end
			now = os.clock()
			if now - (state.lastStatAllocationAt or 0) < 0.5 then
				exitTo = 4
				break
			end
			state.lastStatAllocationAt = now
			local melee = data3:FindFirstChild("Melee")
			local defense = data3:FindFirstChild("Defense")
			local sword = data3:FindFirstChild("Sword")
			melee2 = melee

			if melee2 then
				melee2 = melee:FindFirstChild("Level")
			end

			defense2 = defense

			if defense2 then
				defense2 = defense:FindFirstChild("Level")
			end

			sword2 = sword

			if sword2 then
				sword2 = sword:FindFirstChild("Level")
			end

			if not melee2 then
				exitTo = 5
				break
			end

			if not defense2 then
				exitTo = 5
				break
			end

			if not sword2 then
				exitTo = 5
				break
			end
			local n7 = tonumber(arg.Environment.Configs["Stat Cap"]) or 2800
			local v = tonumber
			local level = arg.Level

			if level then
				level = arg.Level.Value
			end

			local n8 = v(level) or 0

			if defense2.Value < n7 then
				if defense2.Value < n8 / 80 then
					exitTo = 6
					break
				end

				if n7 - melee2.Value < 100 then
					exitTo = 6
					break
				end
			end

			if melee2.Value < n7 then
				exitTo = 7
				break
			end
			exitTo = 8
			break
		end

		if exitTo == 1 then
			return false
		end

		if exitTo == 2 then
			state.lastStatError = nil
			return false
		end

		if exitTo == 3 then
			return false
		end

		if exitTo == 4 then
			return false
		end

		if exitTo == 5 then
			state.lastStatError = "stat-values-unavailable"
			return false
		end
		local str

		if exitTo == 6 then
			str = "Defense"
		elseif exitTo == 7 then
			str = "Melee"
		else
			if exitTo ~= 8 then
				return false
			end
			str = "Sword"
		end

		local n7 = 999
		local value = data2.Value
		local flag = str == "Melee"

		if flag then
			flag = melee2.Value
		end

		if not flag then
			flag = str == "Defense"

			if flag then
				flag = defense2.Value
			end
		end

		flag = flag or sword2.Value

		local ok, result = pcall(function()
			return arg.CommandRemote:InvokeServer("AddPoint", str, n7)
		end)

		task.wait()
		local flag2 = str == "Melee"

		if flag2 then
			flag2 = melee2.Value
		end

		if not flag2 then
			flag2 = str == "Defense"

			if flag2 then
				flag2 = defense2.Value
			end
		end

		flag2 = flag2 or sword2.Value
		local ok2 = ok

		if ok2 then
			ok2 = data2.Value < value or flag2 > flag
		end

		state.lastStatAllocation = {
			At = now,
			Stat = str,
			Amount = n7,
			Ok = ok,
			Accepted = ok2,
			Result = result,
			PointsBefore = value,
			PointsAfter = data2.Value,
			LevelBefore = flag,
			LevelAfter = flag2,
		}

		if ok2 then
		end

		local ok3 = ok

		if ok3 then
			ok3 = "stat-allocation-rejected"
		end

		state.lastStatError = ok3 or tostring(result)
		return ok2
	end }

	tbl42 = { run = function(arg, part)
		if typeof(part) ~= "Instance" then
			return false
		end

		if not part:IsA("BasePart") then
			return false
		end

		if not part.Anchored then
			if type(isnetworkowner) == "function" then
				local ok, result = pcall(isnetworkowner, part)
				if ok then
					return result == true
				end
			end

			return part.ReceiveAge == 0
		end

		return false
	end }

	tbl43 = { run = function(arg)
		local state = arg.State
		local now = os.clock()
		if now < (state.nextSimulationRadiusRefreshAt or 0) then
			return
		end
		state.nextSimulationRadiusRefreshAt = now + 1

		if type(setsimulationradius) == "function" then
			pcall(setsimulationradius, 9e9, math.huge)
		end

		if type(setscriptable) == "function" then
			pcall(setscriptable, arg.LocalPlayer, "SimulationRadius", true)
		end

		local setHiddenProperty = arg.SetHiddenProperty or sethiddenproperty

		if type(setHiddenProperty) == "function" then
			pcall(setHiddenProperty, arg.LocalPlayer, "MaximumSimulationRadius", math.huge)
			pcall(setHiddenProperty, arg.LocalPlayer, "SimulationRadius", 9e9)
		end
	end }

	local n5 = 15
	local n6 = 3
	local n7 = 5
	local distance = 350

	local function fn6(arg, arg2, position)
		local v = arg.Functions.NormalizeEnemyName(arg2)
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
		local tbl63 = {}
		local fortBuilderReplicatedSpawnPositi = ReplicatedStorage:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
		local worldOrigin2 = worldOrigin

		if worldOrigin2 then
			worldOrigin2 = worldOrigin:FindFirstChild("EnemySpawns")
		end

		tbl63[1] = fortBuilderReplicatedSpawnPositi
		tbl63[2] = worldOrigin2
		local tbl64 = {}
		local oks = {}

		for _, instance in tbl63 do
			local instance3 = instance

			if instance3 then
				instance3 = instance:GetChildren()
			end

			instance3 = instance3 or {}

			for _, instance2 in instance3 do
				if arg.Functions.NormalizeEnemyName(instance2.Name) ~= v then
					continue
				end

				local ok, result = pcall(function()
					local isBasePart = instance2:IsA("BasePart")

					if isBasePart then
						isBasePart = instance2.CFrame
					end

					return isBasePart or instance2:GetPivot()
				end)

				if ok then
					ok = tostring(result)
				end

				ok = ok or nil
				if not ok then
					continue
				end

				if typeof(result) ~= "CFrame" then
					continue
				end

				if oks[ok] then
					continue
				end
				oks[ok] = true
				local n8 = #tbl64 + 1
				local tbl65 = { cframe = CFrame.new(result.Position + Vector3.new(0, 30, 0)) }
				local position2 = position

				if position2 then
					position2 = (result.Position - position).Magnitude
				end

				tbl65.distance = position2 or 0
				tbl64[n8] = tbl65
			end
		end

		table.sort(tbl64, function(arg3, arg4)
			return arg3.distance < arg4.distance
		end)

		return tbl64
	end

	local function fn7(arg, position)
		local tbl63 = {}
		local tbl64 = {}

		for k in arg do
			if tbl64[k] then
				continue
			end
			local tbl65 = { k }
			local tbl66 = {}
			tbl64[k] = true

			while #tbl65 > 0 do
				local v = arg[table.remove(tbl65)]
				tbl66[#tbl66 + 1] = v

				for k2, v2 in arg do
					if not tbl64[k2] then
						if (v.cframe.Position - v2.cframe.Position).Magnitude <= distance then
							tbl64[k2] = true
							tbl65[#tbl65 + 1] = k2
						end
					end
				end

				continue
			end

			local vector = Vector3.zero

			for _, v in tbl66 do
				vector += v.cframe.Position
			end

			local n8 = vector / #tbl66
			local v = tbl66[1]
			local magnitude2 = math.huge

			for _, v2 in tbl66 do
				local magnitude = (v2.cframe.Position - n8).Magnitude

				if magnitude < magnitude2 then
					v = v2
					magnitude2 = magnitude
				end
			end

			local n9 = #tbl63 + 1
			local tbl67 = { cframe = v.cframe, center = n8, count = #tbl66 }
			local position2 = position

			if position2 then
				position2 = (n8 - position).Magnitude
			end

			tbl67.distance = position2 or 0
			tbl63[n9] = tbl67
		end

		table.sort(tbl63, function(arg2, arg3)
			return arg2.distance < arg3.distance
		end)

		return tbl63
	end

	tbl44 = { run = function(arg, arg2, arg3, arg4)
		local state = arg.State
		local farmAnchors = state.farmAnchors

		if farmAnchors then
			farmAnchors = state.farmAnchors[arg3]
		end

		if farmAnchors then
			if farmAnchors.task == arg2 then
				if os.clock() - farmAnchors.at <= n5 then
					if typeof(farmAnchors.cframe) == "CFrame" then
						state.lastFarmWaitSource = "last-target"
						return farmAnchors.cframe
					end
				end
			end
		end

		local missingMobState = state.missingMobState
		local missingMobState2 = missingMobState

		if missingMobState2 then
			missingMobState2 = missingMobState.task == arg2
		end

		if missingMobState2 then
			missingMobState2 = missingMobState.mob == arg3
		end

		if missingMobState2 then
			missingMobState2 = math.max(0, os.clock() - missingMobState.since)
		end

		missingMobState2 = missingMobState2 or 0

		if n6 <= missingMobState2 then
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChild("HumanoidRootPart")
			end

			local position = typeof(arg4) == "CFrame"

			if position then
				position = arg4.Position
			end

			if not position then
				position = character2

				if position then
					position = character2.Position
				end
			end

			local v = fn6(arg, arg3, position)
			local lastFarmWaitSpawnIndexes = fn7(v, position)

			if #lastFarmWaitSpawnIndexes > 1 then
				local lastFarmWaitSpawnIndex = math.floor((missingMobState2 - n6) / n7) % #lastFarmWaitSpawnIndexes + 1
				state.lastFarmWaitSource = "rotating-enemy-cluster"
				state.lastFarmWaitSpawnIndex = lastFarmWaitSpawnIndex
				state.lastFarmWaitSpawnCount = #v
				state.lastFarmWaitClusterCount = #lastFarmWaitSpawnIndexes
				state.lastFarmWaitClusterSize = lastFarmWaitSpawnIndexes[lastFarmWaitSpawnIndex].count
				return lastFarmWaitSpawnIndexes[lastFarmWaitSpawnIndex].cframe
			end
		end

		state.lastFarmWaitClusterCount = nil
		state.lastFarmWaitClusterSize = nil
		state.lastFarmWaitSource = "enemy-spawn"
		return arg.Functions.ResolveMobCFrame(arg3, arg4)
	end }

	tbl45 = { run = function(arg, instance, arg2)
		local enemies = workspace:FindFirstChild("Enemies")
		if typeof(instance) ~= "Instance" then
			return false
		end

		if not enemies then
			return false
		end

		if instance.Parent ~= enemies then
			return false
		end

		if arg2 then
			if instance.Name ~= arg2 then
				return false
			end
		end

		local humanoid = instance:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")

		if humanoid then
			if humanoidRootPart then
				if humanoid.Health > 0 then
					if humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
						return true, humanoid, humanoidRootPart
					end
				end
			end
		end

		return false
	end }

	tbl46 = { run = function(arg, arg2, currentFarmMobName, arg3)
		local state = arg.State
		local now = os.clock()
		local missingMobState = state.missingMobState

		if missingMobState then
			if missingMobState.task == arg2 then
				if missingMobState.mob == currentFarmMobName then
					if arg3 then
						missingMobState.since = now
					end
				else
					missingMobState = { task = arg2, mob = currentFarmMobName, since = now }
					state.missingMobState = missingMobState
				end
			else
				missingMobState = { task = arg2, mob = currentFarmMobName, since = now }
				state.missingMobState = missingMobState
			end
		else
			missingMobState = { task = arg2, mob = currentFarmMobName, since = now }
			state.missingMobState = missingMobState
		end

		state.currentFarmMobName = currentFarmMobName
		return now - missingMobState.since
	end }

	tbl47 = { run = function(arg, arg2, arg3)
		local farmWatchdogState = arg.FarmWatchdogState
		farmWatchdogState.LastAction = tostring(arg2 or "none")
		farmWatchdogState.LastActionAt = os.clock()
		local lastError = arg3

		if lastError then
			lastError = tostring(arg3)
		end

		farmWatchdogState.LastError = lastError or "none"

		if arg2 == "hop" then
			farmWatchdogState.Hops += 1
		end
	end }

	tbl48 = { run = function(arg, task_, mode)
		local farmWatchdogState = arg.FarmWatchdogState
		local now = os.clock()
		farmWatchdogState.Mode = mode or "active"
		farmWatchdogState.Task = task_
		farmWatchdogState.Status = arg.State.status or ""
		farmWatchdogState.Target = nil
		farmWatchdogState.QuestText = ""
		farmWatchdogState.QuestCurrent = nil
		farmWatchdogState.QuestTotal = nil
		farmWatchdogState.TargetCount = 0
		farmWatchdogState.TargetHealth = 0
		farmWatchdogState.LastProgressAt = now
		farmWatchdogState.LastProgressKind = mode or "task-changed"
		farmWatchdogState.MissingSince = 0
		farmWatchdogState.MissingSeconds = 0
		farmWatchdogState.StalledSeconds = 0
		farmWatchdogState.ObservedIssue = "none"
		farmWatchdogState.LastCheckAt = now
		farmWatchdogState.nextPollAt = now
		return farmWatchdogState
	end }

	tbl49 = { run = function(arg, task_, mode, target)
		local farmWatchdogState = arg.FarmWatchdogState
		local now = os.clock()
		if farmWatchdogState.Enabled == false then
			return farmWatchdogState
		end

		if farmWatchdogState.Task ~= task_ then
			arg.Functions.ResetFarmWatchdog(task_, mode)
		end

		if now < (farmWatchdogState.nextPollAt or 0) then
			if farmWatchdogState.Mode == mode then
				if farmWatchdogState.Target == target then
					return farmWatchdogState
				end
			end
		end

		farmWatchdogState.nextPollAt = now + ((farmWatchdogState.Config or {}).PollSeconds or 2)
		farmWatchdogState.LastCheckAt = now
		farmWatchdogState.Status = arg.State.status or ""

		local quest, questText = arg.ReadQuest()
		local questCurrent = nil
		local questTotal = nil

		if quest then
			if type(questText) == "string" then
				local match, v = questText:match("%((%d+)%s*/%s*(%d+)%)")

				if not match then
					match, v = questText:match("(%d+)%s*/%s*(%d+)")
				end

				questCurrent = tonumber(match)
				questTotal = tonumber(v)
			else
				questText = ""
			end
		else
			questText = ""
		end

		local targetCount = 0
		local targetHealth = 0
		local enemies = workspace:FindFirstChild("Enemies")
		local enemies2 = enemies

		if enemies2 then
			enemies2 = enemies:GetChildren()
		end

		enemies2 = enemies2 or {}

		for _, instance in enemies2 do
			if instance.Name ~= target then
				continue
			end
			local humanoid = instance:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")
			if not humanoid then
				continue
			end

			if humanoid.Health > 0 then
				if humanoidRootPart then
					targetCount += 1
					targetHealth += humanoid.Health
				end
			end
		end

		local lastProgressKind = nil

		if farmWatchdogState.Target == target then
			if farmWatchdogState.QuestTotal ~= questTotal then
				lastProgressKind = "quest-target-changed"
			elseif questCurrent then
				if farmWatchdogState.QuestCurrent then
					if farmWatchdogState.QuestCurrent < questCurrent then
						lastProgressKind = "quest-progress"
					elseif questCurrent then
						if farmWatchdogState.QuestCurrent then
							if questCurrent < farmWatchdogState.QuestCurrent then
								lastProgressKind = "quest-restarted"
							elseif targetCount > 0 then
								if farmWatchdogState.TargetCount == 0 then
									lastProgressKind = "target-appeared"
								elseif targetCount < farmWatchdogState.TargetCount then
									lastProgressKind = "target-count-decreased"
								elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
									lastProgressKind = "target-health-decreased"
								elseif farmWatchdogState.Mode == "waiting" then
									if mode == "attacking" then
										lastProgressKind = "attack-started"
									end
								end
							elseif targetCount < farmWatchdogState.TargetCount then
								lastProgressKind = "target-count-decreased"
							elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
								lastProgressKind = "target-health-decreased"
							elseif farmWatchdogState.Mode == "waiting" then
								if mode == "attacking" then
									lastProgressKind = "attack-started"
								end
							end
						elseif targetCount > 0 then
							if farmWatchdogState.TargetCount == 0 then
								lastProgressKind = "target-appeared"
							elseif targetCount < farmWatchdogState.TargetCount then
								lastProgressKind = "target-count-decreased"
							elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
								lastProgressKind = "target-health-decreased"
							elseif farmWatchdogState.Mode == "waiting" then
								if mode == "attacking" then
									lastProgressKind = "attack-started"
								end
							end
						elseif targetCount < farmWatchdogState.TargetCount then
							lastProgressKind = "target-count-decreased"
						elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
							lastProgressKind = "target-health-decreased"
						elseif farmWatchdogState.Mode == "waiting" then
							if mode == "attacking" then
								lastProgressKind = "attack-started"
							end
						end
					elseif targetCount > 0 then
						if farmWatchdogState.TargetCount == 0 then
							lastProgressKind = "target-appeared"
						elseif targetCount < farmWatchdogState.TargetCount then
							lastProgressKind = "target-count-decreased"
						elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
							lastProgressKind = "target-health-decreased"
						elseif farmWatchdogState.Mode == "waiting" then
							if mode == "attacking" then
								lastProgressKind = "attack-started"
							end
						end
					elseif targetCount < farmWatchdogState.TargetCount then
						lastProgressKind = "target-count-decreased"
					elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
						lastProgressKind = "target-health-decreased"
					elseif farmWatchdogState.Mode == "waiting" then
						if mode == "attacking" then
							lastProgressKind = "attack-started"
						end
					end
				elseif questCurrent then
					if farmWatchdogState.QuestCurrent then
						if questCurrent < farmWatchdogState.QuestCurrent then
							lastProgressKind = "quest-restarted"
						elseif targetCount > 0 then
							if farmWatchdogState.TargetCount == 0 then
								lastProgressKind = "target-appeared"
							elseif targetCount < farmWatchdogState.TargetCount then
								lastProgressKind = "target-count-decreased"
							elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
								lastProgressKind = "target-health-decreased"
							elseif farmWatchdogState.Mode == "waiting" then
								if mode == "attacking" then
									lastProgressKind = "attack-started"
								end
							end
						elseif targetCount < farmWatchdogState.TargetCount then
							lastProgressKind = "target-count-decreased"
						elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
							lastProgressKind = "target-health-decreased"
						elseif farmWatchdogState.Mode == "waiting" then
							if mode == "attacking" then
								lastProgressKind = "attack-started"
							end
						end
					elseif targetCount > 0 then
						if farmWatchdogState.TargetCount == 0 then
							lastProgressKind = "target-appeared"
						elseif targetCount < farmWatchdogState.TargetCount then
							lastProgressKind = "target-count-decreased"
						elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
							lastProgressKind = "target-health-decreased"
						elseif farmWatchdogState.Mode == "waiting" then
							if mode == "attacking" then
								lastProgressKind = "attack-started"
							end
						end
					elseif targetCount < farmWatchdogState.TargetCount then
						lastProgressKind = "target-count-decreased"
					elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
						lastProgressKind = "target-health-decreased"
					elseif farmWatchdogState.Mode == "waiting" then
						if mode == "attacking" then
							lastProgressKind = "attack-started"
						end
					end
				elseif targetCount > 0 then
					if farmWatchdogState.TargetCount == 0 then
						lastProgressKind = "target-appeared"
					elseif targetCount < farmWatchdogState.TargetCount then
						lastProgressKind = "target-count-decreased"
					elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
						lastProgressKind = "target-health-decreased"
					elseif farmWatchdogState.Mode == "waiting" then
						if mode == "attacking" then
							lastProgressKind = "attack-started"
						end
					end
				elseif targetCount < farmWatchdogState.TargetCount then
					lastProgressKind = "target-count-decreased"
				elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
					lastProgressKind = "target-health-decreased"
				elseif farmWatchdogState.Mode == "waiting" then
					if mode == "attacking" then
						lastProgressKind = "attack-started"
					end
				end
			elseif questCurrent then
				if farmWatchdogState.QuestCurrent then
					if questCurrent < farmWatchdogState.QuestCurrent then
						lastProgressKind = "quest-restarted"
					elseif targetCount > 0 then
						if farmWatchdogState.TargetCount == 0 then
							lastProgressKind = "target-appeared"
						elseif targetCount < farmWatchdogState.TargetCount then
							lastProgressKind = "target-count-decreased"
						elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
							lastProgressKind = "target-health-decreased"
						elseif farmWatchdogState.Mode == "waiting" then
							if mode == "attacking" then
								lastProgressKind = "attack-started"
							end
						end
					elseif targetCount < farmWatchdogState.TargetCount then
						lastProgressKind = "target-count-decreased"
					elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
						lastProgressKind = "target-health-decreased"
					elseif farmWatchdogState.Mode == "waiting" then
						if mode == "attacking" then
							lastProgressKind = "attack-started"
						end
					end
				elseif targetCount > 0 then
					if farmWatchdogState.TargetCount == 0 then
						lastProgressKind = "target-appeared"
					elseif targetCount < farmWatchdogState.TargetCount then
						lastProgressKind = "target-count-decreased"
					elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
						lastProgressKind = "target-health-decreased"
					elseif farmWatchdogState.Mode == "waiting" then
						if mode == "attacking" then
							lastProgressKind = "attack-started"
						end
					end
				elseif targetCount < farmWatchdogState.TargetCount then
					lastProgressKind = "target-count-decreased"
				elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
					lastProgressKind = "target-health-decreased"
				elseif farmWatchdogState.Mode == "waiting" then
					if mode == "attacking" then
						lastProgressKind = "attack-started"
					end
				end
			elseif targetCount > 0 then
				if farmWatchdogState.TargetCount == 0 then
					lastProgressKind = "target-appeared"
				elseif targetCount < farmWatchdogState.TargetCount then
					lastProgressKind = "target-count-decreased"
				elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
					lastProgressKind = "target-health-decreased"
				elseif farmWatchdogState.Mode == "waiting" then
					if mode == "attacking" then
						lastProgressKind = "attack-started"
					end
				end
			elseif targetCount < farmWatchdogState.TargetCount then
				lastProgressKind = "target-count-decreased"
			elseif targetHealth + 0.5 < farmWatchdogState.TargetHealth then
				lastProgressKind = "target-health-decreased"
			elseif farmWatchdogState.Mode == "waiting" then
				if mode == "attacking" then
					lastProgressKind = "attack-started"
				end
			end
		else
			lastProgressKind = "quest-target-changed"
		end

		if lastProgressKind then
			farmWatchdogState.LastProgressAt = now
			farmWatchdogState.LastProgressKind = lastProgressKind

			if targetCount > 0 then
				farmWatchdogState.MissingSince = 0
			end
		end

		farmWatchdogState.Mode = mode
		farmWatchdogState.Task = task_
		farmWatchdogState.Target = target
		farmWatchdogState.QuestText = questText
		farmWatchdogState.QuestCurrent = questCurrent
		farmWatchdogState.QuestTotal = questTotal
		farmWatchdogState.TargetCount = targetCount
		farmWatchdogState.TargetHealth = targetHealth
		farmWatchdogState.StalledSeconds = math.max(0, now - farmWatchdogState.LastProgressAt)
		farmWatchdogState.ObservedIssue = "none"

		if mode == "waiting" then
			if targetCount == 0 then
				if farmWatchdogState.MissingSince == 0 then
					farmWatchdogState.MissingSince = now
				end

				farmWatchdogState.MissingSeconds = math.max(0, now - farmWatchdogState.MissingSince)
				farmWatchdogState.ObservedIssue = "quest-target-missing"
				return farmWatchdogState
			end
		end

		farmWatchdogState.MissingSince = 0
		farmWatchdogState.MissingSeconds = 0

		if mode == "attacking" then
			if farmWatchdogState.StalledSeconds >= 30 then
				farmWatchdogState.ObservedIssue = "attacking-without-progress"
				return farmWatchdogState
			end

			if mode == "waiting" then
				if targetCount > 0 then
					if farmWatchdogState.StalledSeconds >= 30 then
						farmWatchdogState.ObservedIssue = "waiting-while-target-exists"
					end
				end
			end
		elseif mode == "waiting" then
			if targetCount > 0 then
				if farmWatchdogState.StalledSeconds >= 30 then
					farmWatchdogState.ObservedIssue = "waiting-while-target-exists"
				end
			end
		end

		return farmWatchdogState
	end }

	tbl50 = { run = function(arg, arg2)
		local flag = not arg.State.stopped

		if flag then
			flag = not arg.State.paused
		end

		if flag then
			flag = arg.TaskQueue:top() == arg2
		end

		return flag
	end }

	tbl51 = { run = function(arg, arg2, arg3, arg4, ...)
		local functions = arg.Functions
		local state = arg.State

		if functions.IsTaskCurrent(arg2) then
			state.taskProgressCache = state.taskProgressCache or {}
			local v = state.taskProgressCache[arg3]
			local now = os.clock()

			if v then
				if now - v.checkedAt < arg4 then
					return v.value
				end
			end

			local response = arg.CommandRemote:InvokeServer(...)
			state.taskProgressCache[arg3] = { value = response, checkedAt = now }

			if response ~= nil then
				state[arg3] = response
			end

			local response2 = functions.IsTaskCurrent(arg2)

			if response2 then
				response2 = response
			end

			return response2 or nil
		end

		return nil
	end }

	tbl52 = { run = function(arg, arg2, arg3, arg4, ...)
		if arg.Functions.IsTaskCurrent(arg2) then
			local state = arg.State
			state.taskRequestTimes = state.taskRequestTimes or {}
			local now = os.clock()
			local str = arg2 .. "/" .. arg3
			local taskRequestTime = state.taskRequestTimes[str]

			if taskRequestTime then
				if now - taskRequestTime < arg4 then
					return false
				end
			end

			state.taskRequestTimes[str] = now
			return true, arg.CommandRemote:InvokeServer(...)
		end

		return false
	end }

	local n8 = 30

	local function fn8(arg)
		if arg.IsSea(1) then
			return { { key = "proQuestProgress", args = { "ProQuestProgress" } } }
		end

		if arg.IsSea(2) then
			return {
				{ key = "secondSeaProgress", args = { "DressrosaQuestProgress" } },
				{ key = "alchemistProgress", args = { "Alchemist", "1" } },
				{ key = "raceEvolutionProgress", args = { "Wenlocktoad", "1" } },
			}
		end

		if arg.IsSea(3) then
			return {
				{ key = "zQuestProgress", args = { "ZQuestProgress" } },
				{ key = "eliteProgress", args = { "EliteHunter", "Progress" } },
			}
		end

		return {}
	end

	tbl53 = { run = function(arg)
		local state = arg.State
		local now = os.clock()
		if now < (state.nextProgressProbeAt or 0) then
			return false
		end
		local progressProbeIndexes = fn8(arg)
		if #progressProbeIndexes == 0 then
			state.nextProgressProbeAt = now + n8
			return false
		end
		local progressProbeIndex = (state.progressProbeIndex or 0) % #progressProbeIndexes + 1
		state.progressProbeIndex = progressProbeIndex
		state.nextProgressProbeAt = now + n8 / #progressProbeIndexes
		local progressProbeIndex2 = progressProbeIndexes[progressProbeIndex]

		local v, v2 = tbl4.start(arg, "progression", 8, function()
			return arg.CommandRemote:InvokeServer(table.unpack(progressProbeIndex2.args))
		end, function(arg2, arg3)
			state.lastProgressProbe = { key = progressProbeIndex2.key, success = arg2, result = arg3, at = os.clock() }

			if arg2 then
				if arg3 ~= nil then
					state[progressProbeIndex2.key] = arg3
					state[progressProbeIndex2.key .. "At"] = os.clock()
					state.lastProgressProbeError = nil
				elseif not arg2 then
					state.lastProgressProbeError = tostring(arg3)
				end
			elseif not arg2 then
				state.lastProgressProbeError = tostring(arg3)
			end

			return arg2
		end)

		return v2
	end }

	do
		local n9 = 3

		local tbl63 = {
			["Dark Step"] = "Black Leg",
			Electric = "Electro",
			["Water Kung Fu"] = "Fishman Karate",
			["Dragon Breath"] = "Dragon Claw",
		}

		local function fn9(arg)
			return tonumber(arg.Count or arg.count or arg.Amount or arg.amount or arg.Value or arg.value) or 1
		end

		local function getStorageKey(arg)
			return arg.StorageKey or arg.storageKey or arg.Name or arg.name or arg.ItemId or arg.itemId
		end

		local function fn10(arg)
			local type_ = arg.Type or arg.type or arg.IdType or arg.idType or "Other"
			if type_ == "Sword" then
				return "Moveset"
			end

			if type_ == "Gun" then
				return "Moveset"
			end

			if type_ ~= "Melee" then
				if type_ ~= "Fighting Style" then
					return type_
				end
			end

			return "Moveset"
		end

		local function fn11(arg)
			return tonumber(arg.Mastery or arg.mastery or arg.Level or arg.level) or 0
		end

		local function getOk()
			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local ok, result = pcall(function()
				local itemReplicationService = ReplicatedStorage:FindFirstChild("ItemReplicationService")
				if not itemReplicationService then
					return nil
				end
				local keys = itemReplicationService:FindFirstChild("KEYS")
				local itemConfig = ReplicatedStorage:FindFirstChild("ItemConfig")

				if keys then
					if itemConfig then
						local module = require(itemReplicationService)
						local module2 = require(keys)
						local module3 = require(itemConfig)
						if module.IsInitialized ~= true then
							return nil
						end
						local tbl64 = {}
						local items = module:GetItems(module2.MASTERY) or {}

						for _, v in items do
							tbl64[tostring(v.ItemId) .. ":" .. tostring(v.NetworkedUID or "")] = tonumber(v.Value) or 0
						end

						local tbl65 = {}
						local items2 = module:GetItems(module2.QUANTITY) or {}

						for _, v in items2 do
							local n10 = tonumber(v.Value) or 0
							if not (n10 > 0) then
								continue
							end
							local v2 = module3.match(v.ItemId):unwrap()
							local index = v2.Index or {}
							local display = v2.Display or {}
							local match, v3 = tostring(index.DebugLabel or ""):match("^(.-) %[(.-)%-%d+%]$")
							local name = display.Name or match or index.StorageKey
							local category = display.Category or v3

							if category == "Blox Fruit" then
								category = "PhysicalMoveset"
							end

							if name then
								if category then
									tbl65[#tbl65 + 1] = {
										StorageKey = index.StorageKey or name,
										Name = name,
										Type = category,
										Count = n10,
										Mastery = tbl64[tostring(v.ItemId) .. ":" .. tostring(v.NetworkedUID or "")] or 0,
										ItemId = v.ItemId,
										NetworkedUID = v.NetworkedUID,
										Value = tbl6.moneyValue(v2),
									}
								end
							end
						end

						return tbl65
					end
				end

				return nil
			end)

			local ok2 = ok

			if ok2 then
				ok2 = type(result) == "table"
			end

			if ok2 then
				ok2 = result
			end

			return ok2 or nil
		end

		local function fn12(arg, arg2)
			local inventory = {}

			for _, v in arg2 do
				if type(v) ~= "table" then
					continue
				end

				if not (fn9(v) > 0) then
					continue
				end
				local storageKey = getStorageKey(v)
				local v2 = fn10(v)
				if type(storageKey) ~= "string" then
					continue
				end

				if storageKey == "" then
					continue
				end
				v.Count = fn9(v)
				v.Mastery = fn11(v)
				inventory[v2] = inventory[v2] or {}
				inventory[v2][storageKey] = v
				local name = v.Name or v.name

				if type(name) == "string" then
					if name ~= "" then
						inventory[v2][name] = v
					end
				end
			end

			arg.Inventory = inventory
		end

		local function fn13(arg)
			arg.MeleeProgress = arg.MeleeProgress or {}
			arg.MeleeInventory = arg.MeleeInventory or {}
			arg.MeleeInventory.Melee = arg.MeleeInventory.Melee or {}
			local moveset = arg.Inventory.Moveset or {}

			for k, v in moveset do
				if type(k) == "string" then
					if type(v) == "table" then
						local name = v.Name or v.name or k
						local name2 = tbl63[name] or tbl63[k] or name
						local v2 = fn11(v)

						arg.MeleeProgress[name2] = arg.MeleeProgress[name2] or {}
						arg.MeleeProgress[name2].Level = math.max(tonumber(arg.MeleeProgress[name2].Level) or 0, v2)
						arg.MeleeProgress[name2].Done = true
						arg.MeleeInventory.Melee[name2] = { Bought = true, Level = v2 }
					end
				end
			end

			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Tool")
			end

			if not character2 then
				return
			end
			local attribute = character2:GetAttribute("WeaponType") or character2.ToolTip

			return (function()
				if attribute == "Melee" then
					local name = tbl63[character2.Name] or character2.Name
					local level = character2:FindFirstChild("Level")
					local level2 = level

					if level2 then
						level2 = tonumber(level.Value)
					end

					level2 = level2 or 0
					arg.MeleeProgress[name] = arg.MeleeProgress[name] or {}
					arg.MeleeProgress[name].Level = math.max(tonumber(arg.MeleeProgress[name].Level) or 0, level2)
					arg.MeleeProgress[name].Done = true
					arg.MeleeInventory.Melee[name] = { Bought = true, Level = level2 }
				end
			end)()
		end

		tbl54 = {
			run = function(arg, arg2)
				local state = arg.State
				local now = os.clock()
				local boundedCalls = state.boundedCalls

				if boundedCalls then
					boundedCalls = state.boundedCalls.inventory
				end

				local n10, n11, n12, lastInventoryRefreshSource, n13, n14, v, flag

				if boundedCalls then
					if not arg2 then
						return false
					end
					local runtimeGeneration = state.runtimeGeneration

					if tbl4.await(boundedCalls) then
						if not state.stopped then
							if state.runtimeGeneration == runtimeGeneration then
								local boundedCalls2 = state.boundedCalls

								if boundedCalls2 then
									boundedCalls2 = state.boundedCalls.inventory
								end

								if boundedCalls2 then
									return tbl4.await(boundedCalls2)
								end

								if boundedCalls.sequence < (state.inventoryRefreshSequence or 0) then
									return state.lastInventoryRefreshError == nil
								end
								now = os.clock()
								n10 = 961265186

								if not arg2 then
									if now < (state.nextInventoryRefreshAt or 0) then
										return false
									end
								end

								n11 = 878376788
								n12 = 913592755
								state.nextInventoryRefreshAt = now + n9
								lastInventoryRefreshSource = "replication"
								n13 = nil
								n14 = nil

								v = tbl4.start(arg, "inventory", 8, function()
									n13 = 49451407
									n14 = 664360367
									local ok = getOk()
									if type(ok) ~= "table" then
										lastInventoryRefreshSource = "remote-fallback"
										return arg.CommandRemote:InvokeServer("getInventory")
									end
									return ok
								end, function(arg3, arg4, arg5)
									state.inventoryRefreshSequence = arg5.sequence
									state.lastInventoryRefreshAt = os.clock()
									state.lastInventoryRefreshSource = lastInventoryRefreshSource

									if arg3 then
										if type(arg4) == "table" then
											fn12(arg, arg4)
											fn13(arg)
											state.lastInventoryRefreshError = nil
											state.inventoryReady = true
											state.inventoryItemCount = #arg4
											return true
										end
									end

									local lastInventoryRefreshError = arg3

									if lastInventoryRefreshError then
										lastInventoryRefreshError = "invalid-result"
									end

									state.lastInventoryRefreshError = lastInventoryRefreshError or tostring(arg4)
									state.nextInventoryRefreshAt = os.clock() + 10
									return false
								end)

								if arg2 then
									return tbl4.await(v)
								end
								flag = v ~= nil

								if flag then
									flag = v.success == true
								end

								return flag
							end
						end
					end

					return false
				end

				n10 = 961265186

				if not arg2 then
					if now < (state.nextInventoryRefreshAt or 0) then
						return false
					end
				end

				n11 = 878376788
				n12 = 913592755
				state.nextInventoryRefreshAt = now + n9
				lastInventoryRefreshSource = "replication"
				n13 = nil
				n14 = nil

				v = tbl4.start(arg, "inventory", 8, function()
					n13 = 49451407
					n14 = 664360367
					local ok = getOk()
					if type(ok) ~= "table" then
						lastInventoryRefreshSource = "remote-fallback"
						return arg.CommandRemote:InvokeServer("getInventory")
					end
					return ok
				end, function(arg3, arg4, arg5)
					state.inventoryRefreshSequence = arg5.sequence
					state.lastInventoryRefreshAt = os.clock()
					state.lastInventoryRefreshSource = lastInventoryRefreshSource

					if arg3 then
						if type(arg4) == "table" then
							fn12(arg, arg4)
							fn13(arg)
							state.lastInventoryRefreshError = nil
							state.inventoryReady = true
							state.inventoryItemCount = #arg4
							return true
						end
					end

					local lastInventoryRefreshError = arg3

					if lastInventoryRefreshError then
						lastInventoryRefreshError = "invalid-result"
					end

					state.lastInventoryRefreshError = lastInventoryRefreshError or tostring(arg4)
					state.nextInventoryRefreshAt = os.clock() + 10
					return false
				end)

				if arg2 then
					return tbl4.await(v)
				end
				flag = v ~= nil

				if flag then
					flag = v.success == true
				end

				return flag
			end,
			owns = function(arg, arg2, arg3)
				if arg2 ~= "Sword" then
					if arg2 ~= "Gun" then
						if arg2 == "Melee" then
							arg2 = "Moveset"
						end
					else
						arg2 = "Moveset"
					end
				else
					arg2 = "Moveset"
				end

				local v = arg.Inventory[arg2]

				if v then
					v = arg.Inventory[arg2][arg3]
				end

				local flag = type(v) == "table"

				if flag then
					flag = fn9(v) > 0
				end

				return flag or v == true
			end,
			carries = function(arg, name)
				local localPlayer = arg.LocalPlayer
				local character = localPlayer.Character

				if character then
					character = localPlayer.Character:FindFirstChild(name)
				end

				if not character then
					character = localPlayer:FindFirstChildOfClass("Backpack")

					if character then
						character = localPlayer.Backpack:FindFirstChild(name)
					end
				end

				return character or false
			end,
			findPhysicalMoveset = function(arg, arg2)
				local physicalMoveset = arg.Inventory.PhysicalMoveset or {}

				if arg2 then
					if physicalMoveset[arg2] then
						return physicalMoveset[arg2]
					end
				end

				for _, v in physicalMoveset do
					if type(v) == "table" then
						if fn9(v) > 0 then
							return v
						end
					end
				end

				return nil
			end,
		}
	end

	local n9 = 5
	local n10 = 8
	local n11 = 30
	local n12 = 2048

	local function fn9(arg, instance)
		local state = arg.State
		local environment = arg.Environment or {}
		local configs = environment.Configs or {}
		if state.stopped then
			return false
		end

		if state.paused then
			return false
		end

		if state.inventoryStartupPending then
			return false
		end

		if configs["Auto Equip Accessory"] == false then
			return false
		end

		if environment.Stop then
			return false
		end

		if _G.Stop then
			return false
		end

		if state.resetting then
			return false
		end

		if state.hopBusy then
			return false
		end

		if state.fastTravelRequest then
			return false
		end

		if state.cursedShipTransitionActive then
			return false
		end

		if state.fruitStoreInFlight then
			return false
		end

		if os.clock() < (state.raidChipPurchasePendingUntil or 0) then
			return false
		end

		if state.worldTravelIssuedAt then
			if os.clock() - state.worldTravelIssuedAt < 15 then
				return false
			end
		end

		if instance then
			if arg.LocalPlayer.Character == instance then
				local humanoid = instance:FindFirstChildOfClass("Humanoid")
				local flag = humanoid ~= nil

				if flag then
					flag = humanoid.Health > 0
				end

				return flag
			end
		end

		return false
	end

	local function fn10(arg, getBoundedCalls)
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local itemReplicationService = ReplicatedStorage:FindFirstChild("ItemReplicationService")
		local itemReplicationService2 = itemReplicationService

		if itemReplicationService2 then
			itemReplicationService2 = itemReplicationService:FindFirstChild("KEYS")
		end

		local itemConfig = ReplicatedStorage:FindFirstChild("ItemConfig")
		local modules = ReplicatedStorage:FindFirstChild("Modules")
		local modules2 = modules

		if modules2 then
			modules2 = modules:FindFirstChild("Asset")
		end

		local modules3 = modules2

		if modules3 then
			modules3 = modules2:FindFirstChild("ItemData")
		end

		local modules4 = modules3

		if modules4 then
			modules4 = modules3:FindFirstChild("ItemStats")
		end

		if not itemReplicationService then
			return nil
		end

		if not itemReplicationService2 then
			return nil
		end

		if not itemConfig then
			return nil
		end

		if not modules4 then
			return nil
		end
		local tbl63 = { itemReplicationService, itemReplicationService2, itemConfig, modules4 }
		local accessoryDependencies = arg.State.accessoryDependencies

		if accessoryDependencies then
			local flag = true

			for k, v in tbl63 do
				if accessoryDependencies.handles[k] ~= v then
					flag = false
					break
				end
			end

			if flag then
				return accessoryDependencies.values
			end
		end

		local tbl64 = {}

		for k, v in tbl63 do
			if getBoundedCalls() then
				tbl64[k] = require(v)
				continue
			end
			return nil
		end

		if getBoundedCalls() then
			arg.State.accessoryDependencies = { handles = tbl63, values = tbl64 }
			return tbl64
		end
		return nil
	end

	local function fn11(arg)
		local flag = type(arg) == "string"

		if flag then
			flag = arg ~= ""
		end

		if not flag then
			flag = type(arg) == "number"

			if flag then
				flag = arg == arg
			end

			if flag then
				flag = arg > -math.huge
			end

			if flag then
				flag = arg < math.huge
			end
		end

		return flag
	end

	local function fn12(arg, getBoundedCalls)
		local value, v, v2, storageKeys = table.unpack(arg)
		if type(value) ~= "table" then
			return nil, "replication-unavailable"
		end

		if value.IsInitialized ~= true then
			return nil, "replication-unavailable"
		end

		if type(v) ~= "table" then
			return nil, "replication-unavailable"
		end

		if v.QUANTITY == nil then
			return nil, "replication-unavailable"
		end

		if v.IS_EQUIPPED == nil then
			return nil, "replication-unavailable"
		end

		if v.UPGRADE_COUNT == nil then
			return nil, "replication-unavailable"
		end

		if type(v2) ~= "table" then
			return nil, "replication-unavailable"
		end

		if type(storageKeys) ~= "table" then
			return nil, "replication-unavailable"
		end
		local items = value:GetItems(v.QUANTITY)
		if type(items) ~= "table" then
			return nil, "inventory-unavailable"
		end
		local tbl63 = {}
		local count = 0
		local count2 = 0

		for _, v3 in items do
			count += 1
			if n12 < count then
				return nil, "inventory-scan-limit"
			end

			if not getBoundedCalls() then
				return nil, "deferred"
			end

			local ok, result = pcall(function()
				if type(v3) ~= "table" then
					return nil
				end
				local n13 = tonumber(v3.Value) or 0
				if n13 ~= n13 then
					return nil
				end

				if n13 <= 0 then
					return nil
				end

				if n13 == math.huge then
					return nil
				end

				if not fn11(v3.ItemId) then
					return nil
				end

				if v3.NetworkedUID ~= nil then
					if not fn11(v3.NetworkedUID) then
						return nil
					end
				end

				local v4 = v2.match(v3.ItemId):unwrap()
				if v4.Display.Category ~= "Accessory" then
					return nil
				end
				local storageKey = v4.Index.StorageKey

				if type(storageKey) == "string" then
					if storageKey ~= "" then
						local storageKey2 = storageKeys[storageKey]
						if type(storageKey2) ~= "table" then
							return nil
						end

						if not storageKey2.Accessory then
							return nil
						end
						local n14 = tonumber(value:ReadItem(v.UPGRADE_COUNT, v3.ItemId, v3.NetworkedUID)) or 0
						local v5 = storageKey2[n14] or storageKey2[0]

						if type(v5) == "table" then
							if type(v5[2]) == "table" then
								local item = value:ReadItem(v.IS_EQUIPPED, v3.ItemId, v3.NetworkedUID)

								if item ~= nil then
									if type(item) ~= "boolean" then
										return nil
									end
								end

								return {
									Name = storageKey,
									ItemId = v3.ItemId,
									NetworkedUID = v3.NetworkedUID,
									Score = tbl5.score(v5[2]),
									Equipped = item == true,
								}
							end
						end

						return nil
					end
				end

				return nil
			end)

			if ok then
				if result then
					tbl63[#tbl63 + 1] = result
				elseif not ok then
					count2 += 1
				end
			elseif not ok then
				count2 += 1
			end
		end

		return tbl5.choose(tbl63), nil, count2
	end

	tbl55 = { run = function(arg)
		local state = arg.State
		local now = os.clock()
		if now < (state.nextAccessoryCheckAt or 0) then
			return false
		end

		if state.boundedCalls then
			if state.boundedCalls.accessory then
				return false
			end
		end

		local character = arg.LocalPlayer.Character

		if fn9(arg, character) then
			state.nextAccessoryCheckAt = now + n9
			local runtimeGeneration = state.runtimeGeneration

			local v, v2 = tbl4.start(arg, "accessory", n10, function()
				local accessory = state.boundedCalls.accessory

				local function getBoundedCalls()
					local boundedCalls = state.boundedCalls

					if boundedCalls then
						boundedCalls = state.boundedCalls.accessory == accessory
					end

					if boundedCalls then
						boundedCalls = not accessory.done
					end

					if boundedCalls then
						boundedCalls = os.clock() < accessory.deadline
					end

					if boundedCalls then
						boundedCalls = state.runtimeGeneration == runtimeGeneration
					end

					if boundedCalls then
						boundedCalls = fn9(arg, character)
					end

					return boundedCalls
				end

				if getBoundedCalls() then
					local v = fn10(arg, getBoundedCalls)

					if v then
						local tool, v2, invalid = fn12(v, getBoundedCalls)

						if getBoundedCalls() then
							if tool then
								if tool.Equipped then
									state.accessoryLastRequestedId = nil
									return { status = "equipped", name = tool.Name, invalid = invalid }
								end
								local networkedUID = tool.NetworkedUID or tool.ItemId

								if fn11(networkedUID) then
									if networkedUID == state.accessoryLastRequestedId then
										if os.clock() < (state.accessoryRetryAt or 0) then
											return { status = "awaiting-replication", name = tool.Name, invalid = invalid }
										end
									end

									if getBoundedCalls() then
										state.accessoryLastRequestedId = networkedUID
										state.accessoryRetryAt = os.clock() + n11
										state.lastAccessoryRequestAt = os.clock()
										local tbl63 = {}
										local status = arg.CommandRemote:InvokeServer("LoadItem", networkedUID) == false

										if status then
											status = "load-rejected"
										end

										tbl63.status = status or "equip-requested"
										tbl63.name = tool.Name
										tbl63.invalid = invalid
										return tbl63
									end

									return { status = "deferred" }
								end

								return { status = "invalid-item-id" }
							end

							return { status = v2 or "no-accessory", invalid = invalid }
						end

						return { status = "deferred" }
					end

					return { status = "dependencies-unavailable" }
				end

				return { status = "deferred" }
			end, function(arg2, arg3)
				state.lastAccessoryCheckAt = os.clock()

				if arg2 then
					if type(arg3) == "table" then
						state.lastAccessoryError = nil
						state.accessoryStatus = arg3.status
						state.accessoryCandidate = arg3.name
						state.accessoryInvalidItems = arg3.invalid or 0
						if arg3.status == "dependencies-unavailable" then
							state.nextAccessoryCheckAt = os.clock() + 10
							return true
						end

						if arg3.status == "replication-unavailable" then
							state.nextAccessoryCheckAt = os.clock() + 10
							return true
						end

						if arg3.status == "inventory-unavailable" then
							state.nextAccessoryCheckAt = os.clock() + 10
							return true
						end

						if arg3.status == "inventory-scan-limit" then
							state.nextAccessoryCheckAt = os.clock() + 10
						end

						return true
					end
				end

				local lastAccessoryError = arg2

				if lastAccessoryError then
					lastAccessoryError = "invalid-result"
				end

				state.lastAccessoryError = lastAccessoryError or tostring(arg3)
				state.nextAccessoryCheckAt = os.clock() + 10
				return false
			end)

			local flag = v ~= nil

			if flag then
				flag = v2 == true
			end

			return flag
		end

		return false
	end }

	local function getMaterial(arg, arg2)
		local material = arg.Inventory.Material

		if material then
			material = arg.Inventory.Material[arg2]
		end

		local material2 = material

		if material2 then
			material2 = tonumber(material.Count or material.Value)
		end

		return material2 or 0
	end

	tbl56 = { run = function(arg)
		local state = arg.State
		local value = arg.Level.Value
		local progressionPhase = "level-farm"
		local meleeMissingMaterial = "level-progress"

		if not (value >= 1500) then
			local n13, n14

			if not (value >= 700) then
				if state.meleeMissingMaterial then
					progressionPhase = "godhuman-material"
					meleeMissingMaterial = state.meleeMissingMaterial
				elseif state.needFragments then
					progressionPhase = "fragment-farm"
					meleeMissingMaterial = "required-purchase"
				elseif state.meleeTarget then
					if state.meleeTarget ~= "Godhuman" then
						n13 = tonumber(state.meleeCurrentMastery) or 0
						n14 = tonumber(state.meleeTargetMastery) or 400

						if n13 < n14 then
							progressionPhase = "melee-mastery"
							meleeMissingMaterial = state.meleeTarget
						elseif state.meleeTarget == "Godhuman" then
							if not state.godhumanOwned then
								progressionPhase = "godhuman-purchase"

								for _, v in {
									{ "Fish Tail", 20 },
									{ "Dragon Scale", 10 },
									{ "Mystic Droplet", 10 },
									{ "Magma Ore", 20 },
								} do
									if getMaterial(arg, v[1]) < v[2] then
										progressionPhase = "godhuman-material"
										meleeMissingMaterial = v[1]
										break
									end
								end
							end
						end
					elseif state.meleeTarget == "Godhuman" then
						if not state.godhumanOwned then
							progressionPhase = "godhuman-purchase"

							for _, v in {
								{ "Fish Tail", 20 },
								{ "Dragon Scale", 10 },
								{ "Mystic Droplet", 10 },
								{ "Magma Ore", 20 },
							} do
								if getMaterial(arg, v[1]) < v[2] then
									progressionPhase = "godhuman-material"
									meleeMissingMaterial = v[1]
									break
								end
							end
						end
					end
				elseif state.meleeTarget == "Godhuman" then
					if not state.godhumanOwned then
						progressionPhase = "godhuman-purchase"

						for _, v in {
							{ "Fish Tail", 20 },
							{ "Dragon Scale", 10 },
							{ "Mystic Droplet", 10 },
							{ "Magma Ore", 20 },
						} do
							if getMaterial(arg, v[1]) < v[2] then
								progressionPhase = "godhuman-material"
								meleeMissingMaterial = v[1]
								break
							end
						end
					end
				end
			elseif arg.IsSea(1) then
				progressionPhase = "transition-second-sea"
				meleeMissingMaterial = "second-sea-unlocked"
			elseif state.meleeMissingMaterial then
				progressionPhase = "godhuman-material"
				meleeMissingMaterial = state.meleeMissingMaterial
			elseif state.needFragments then
				progressionPhase = "fragment-farm"
				meleeMissingMaterial = "required-purchase"
			elseif state.meleeTarget then
				if state.meleeTarget ~= "Godhuman" then
					n13 = tonumber(state.meleeCurrentMastery) or 0
					n14 = tonumber(state.meleeTargetMastery) or 400

					if n13 < n14 then
						progressionPhase = "melee-mastery"
						meleeMissingMaterial = state.meleeTarget
					elseif state.meleeTarget == "Godhuman" then
						if not state.godhumanOwned then
							progressionPhase = "godhuman-purchase"

							for _, v in {
								{ "Fish Tail", 20 },
								{ "Dragon Scale", 10 },
								{ "Mystic Droplet", 10 },
								{ "Magma Ore", 20 },
							} do
								if getMaterial(arg, v[1]) < v[2] then
									progressionPhase = "godhuman-material"
									meleeMissingMaterial = v[1]
									break
								end
							end
						end
					end
				elseif state.meleeTarget == "Godhuman" then
					if not state.godhumanOwned then
						progressionPhase = "godhuman-purchase"

						for _, v in {
							{ "Fish Tail", 20 },
							{ "Dragon Scale", 10 },
							{ "Mystic Droplet", 10 },
							{ "Magma Ore", 20 },
						} do
							if getMaterial(arg, v[1]) < v[2] then
								progressionPhase = "godhuman-material"
								meleeMissingMaterial = v[1]
								break
							end
						end
					end
				end
			elseif state.meleeTarget == "Godhuman" then
				if not state.godhumanOwned then
					progressionPhase = "godhuman-purchase"

					for _, v in {
						{ "Fish Tail", 20 },
						{ "Dragon Scale", 10 },
						{ "Mystic Droplet", 10 },
						{ "Magma Ore", 20 },
					} do
						if getMaterial(arg, v[1]) < v[2] then
							progressionPhase = "godhuman-material"
							meleeMissingMaterial = v[1]
							break
						end
					end
				end
			end
		elseif arg.IsSea(2) then
			progressionPhase = "transition-third-sea"
			meleeMissingMaterial = "third-sea-unlocked"
		elseif not (value >= 700) then
			if state.meleeMissingMaterial then
				progressionPhase = "godhuman-material"
				meleeMissingMaterial = state.meleeMissingMaterial
			elseif state.needFragments then
				progressionPhase = "fragment-farm"
				meleeMissingMaterial = "required-purchase"
			elseif state.meleeTarget then
				if state.meleeTarget ~= "Godhuman" then
					if (tonumber(state.meleeCurrentMastery) or 0) < (tonumber(state.meleeTargetMastery) or 400) then
						progressionPhase = "melee-mastery"
						meleeMissingMaterial = state.meleeTarget
					elseif state.meleeTarget == "Godhuman" then
						if not state.godhumanOwned then
							progressionPhase = "godhuman-purchase"

							for _, v in {
								{ "Fish Tail", 20 },
								{ "Dragon Scale", 10 },
								{ "Mystic Droplet", 10 },
								{ "Magma Ore", 20 },
							} do
								if getMaterial(arg, v[1]) < v[2] then
									progressionPhase = "godhuman-material"
									meleeMissingMaterial = v[1]
									break
								end
							end
						end
					end
				elseif state.meleeTarget == "Godhuman" then
					if not state.godhumanOwned then
						progressionPhase = "godhuman-purchase"

						for _, v in {
							{ "Fish Tail", 20 },
							{ "Dragon Scale", 10 },
							{ "Mystic Droplet", 10 },
							{ "Magma Ore", 20 },
						} do
							if getMaterial(arg, v[1]) < v[2] then
								progressionPhase = "godhuman-material"
								meleeMissingMaterial = v[1]
								break
							end
						end
					end
				end
			elseif state.meleeTarget == "Godhuman" then
				if not state.godhumanOwned then
					progressionPhase = "godhuman-purchase"

					for _, v in {
						{ "Fish Tail", 20 },
						{ "Dragon Scale", 10 },
						{ "Mystic Droplet", 10 },
						{ "Magma Ore", 20 },
					} do
						if getMaterial(arg, v[1]) < v[2] then
							progressionPhase = "godhuman-material"
							meleeMissingMaterial = v[1]
							break
						end
					end
				end
			end
		elseif arg.IsSea(1) then
			progressionPhase = "transition-second-sea"
			meleeMissingMaterial = "second-sea-unlocked"
		elseif state.meleeMissingMaterial then
			progressionPhase = "godhuman-material"
			meleeMissingMaterial = state.meleeMissingMaterial
		elseif state.needFragments then
			progressionPhase = "fragment-farm"
			meleeMissingMaterial = "required-purchase"
		elseif state.meleeTarget then
			if state.meleeTarget ~= "Godhuman" then
				if (tonumber(state.meleeCurrentMastery) or 0) < (tonumber(state.meleeTargetMastery) or 400) then
					progressionPhase = "melee-mastery"
					meleeMissingMaterial = state.meleeTarget
				elseif state.meleeTarget == "Godhuman" then
					if not state.godhumanOwned then
						progressionPhase = "godhuman-purchase"

						for _, v in {
							{ "Fish Tail", 20 },
							{ "Dragon Scale", 10 },
							{ "Mystic Droplet", 10 },
							{ "Magma Ore", 20 },
						} do
							if getMaterial(arg, v[1]) < v[2] then
								progressionPhase = "godhuman-material"
								meleeMissingMaterial = v[1]
								break
							end
						end
					end
				end
			elseif state.meleeTarget == "Godhuman" then
				if not state.godhumanOwned then
					progressionPhase = "godhuman-purchase"

					for _, v in {
						{ "Fish Tail", 20 },
						{ "Dragon Scale", 10 },
						{ "Mystic Droplet", 10 },
						{ "Magma Ore", 20 },
					} do
						if getMaterial(arg, v[1]) < v[2] then
							progressionPhase = "godhuman-material"
							meleeMissingMaterial = v[1]
							break
						end
					end
				end
			end
		elseif state.meleeTarget == "Godhuman" then
			if not state.godhumanOwned then
				progressionPhase = "godhuman-purchase"

				for _, v in {
					{ "Fish Tail", 20 },
					{ "Dragon Scale", 10 },
					{ "Mystic Droplet", 10 },
					{ "Magma Ore", 20 },
				} do
					if getMaterial(arg, v[1]) < v[2] then
						progressionPhase = "godhuman-material"
						meleeMissingMaterial = v[1]
						break
					end
				end
			end
		end

		state.progressionPhase = progressionPhase
		state.progressionReason = meleeMissingMaterial
		state.progressionPlanAt = os.clock()
		return progressionPhase
	end }

	tbl57 = { run = function(arg)
		arg.State.rejoinPersistenceMode = "external-autoexec"
		arg.State.rejoinPersistenceRegistered = false
		return false
	end }

	tbl58 = {}
	local HttpService = game:GetService("HttpService")
	local TeleportService = game:GetService("TeleportService")

	local function fn13(arg)
		local num = tonumber(arg)
		local flag = num

		if flag then
			flag = num > 0
		end

		if flag then
			flag = num
		end

		return flag or nil
	end

	local function fn14(arg)
		local state = arg.State
		if state.teleportFailureConnection then
			return
		end

		state.teleportFailureConnection = TeleportService.TeleportInitFailed:Connect(function(arg2, arg3, arg4, place, arg5)
			if arg2 ~= arg.LocalPlayer then
				return
			end
			state.hopBusy = false
			state.hopRetryAt = 0
			state.lastHopError = string.format("%s: %s", tostring(arg3), tostring(arg4))
			local lastHopFailure = {}
			local serverInstanceId = arg5

			if serverInstanceId then
				serverInstanceId = arg5.ServerInstanceId
			end

			lastHopFailure.job = serverInstanceId
			lastHopFailure.place = place
			lastHopFailure.at = os.time()
			state.lastHopFailure = lastHopFailure
			state.status = "Server hop failed | Trying another"

			task.delay(1.5, function()
				if not state.stopped then
					tbl58.run(arg, state.lastHopMaximumPlayers, state.lastHopReason)
				end
			end)
		end)
	end

	local function fn15(arg)
		local str = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true", tostring(game.PlaceId))
		local response = game:HttpGet(str)
		local data = HttpService:JSONDecode(response)
		local tbl63 = {}
		local v = ipairs
		local data2 = type(data.data) == "table"

		if data2 then
			data2 = data.data
		end

		data2 = data2 or {}

		for _, v2 in v(data2) do
			local num = tonumber(v2.playing)
			local num2 = tonumber(v2.maxPlayers)
			if type(v2.id) ~= "string" then
				continue
			end

			if v2.id == game.JobId then
				continue
			end

			if not num then
				continue
			end

			if not num2 then
				continue
			end

			if num > 0 then
				if not (num < num2) then
					continue
				end

				if arg then
					if not (num < arg) then
						continue
					end
				end

				tbl63[#tbl63 + 1] = { id = v2.id, count = num, source = "public" }
				continue
			end
		end

		return tbl63
	end

	local function fn16(remote, arg, arg2)
		local tbl63 = {}
		if not remote then
			return tbl63
		end

		if not remote:IsA("RemoteFunction") then
			return tbl63
		end
		local now = os.time()
		local cachedServerBrowser = arg.cachedServerBrowser
		local response

		if cachedServerBrowser then
			if now - (arg.cachedServerBrowserAt or 0) >= 60 then
				cachedServerBrowser = nil

				for i = 1, 100 do
					response = remote:InvokeServer(i)

					if type(response) == "table" then
						if next(response) ~= nil then
							cachedServerBrowser = response
							arg.cachedServerBrowser = response
							arg.cachedServerBrowserAt = now
							break
						end
					end
				end
			end
		else
			cachedServerBrowser = nil

			for i = 1, 100 do
				response = remote:InvokeServer(i)

				if type(response) == "table" then
					if next(response) ~= nil then
						cachedServerBrowser = response
						arg.cachedServerBrowser = response
						arg.cachedServerBrowserAt = now
						break
					end
				end
			end
		end

		local cachedServerBrowser2 = type(cachedServerBrowser) == "table"

		if cachedServerBrowser2 then
			cachedServerBrowser2 = cachedServerBrowser
		end

		cachedServerBrowser2 = cachedServerBrowser2 or {}

		for k, v in cachedServerBrowser2 do
			local flag = type(v) == "table"

			if flag then
				flag = tonumber(v.Count)
			end

			if type(k) ~= "string" then
				continue
			end

			if k == game.JobId then
				continue
			end

			if not flag then
				continue
			end

			if arg2 then
				if not (flag < arg2) then
					continue
				end
			end

			tbl63[#tbl63 + 1] = { id = k, count = flag, source = "browser" }
		end

		return tbl63
	end

	tbl58.run = function(arg, arg2, arg3)
		local state = arg.State
		local lastHopMaximumPlayers = fn13(arg2)
		local flag = type(arg3) == "string"

		if flag then
			flag = arg3
		end

		local lastHopReason = flag or nil
		fn14(arg)
		local now = os.clock()
		if state.hopBusy then
			return false
		end

		if not (now < (state.hopRetryAt or 0)) then
			local serverBrowser = game:GetService("ReplicatedStorage"):FindFirstChild("__ServerBrowser")
			state.hopBusy = true
			state.hopRetryAt = now + 5
			state.lastHopMaximumPlayers = lastHopMaximumPlayers
			state.lastHopReason = lastHopReason

			local ok, result = xpcall(function()
				local tbl63 = {}
				local ok, result = pcall(fn15, lastHopMaximumPlayers)
				local ok2, result2

				if ok then
					tbl63 = result

					if #tbl63 == 0 then
						ok2, result2 = pcall(fn16, serverBrowser, state, lastHopMaximumPlayers)

						if ok2 then
							tbl63 = result2
							if #tbl63 == 0 then
								state.lastHopError = "no-low-player-server"
								return false
							end
						else
							state.lastServerBrowserError = tostring(result2)
							if #tbl63 == 0 then
								state.lastHopError = "no-low-player-server"
								return false
							end
						end
					elseif #tbl63 == 0 then
						state.lastHopError = "no-low-player-server"
						return false
					end
				else
					state.lastPublicServerError = tostring(result)

					if #tbl63 == 0 then
						ok2, result2 = pcall(fn16, serverBrowser, state, lastHopMaximumPlayers)

						if ok2 then
							tbl63 = result2
							if #tbl63 == 0 then
								state.lastHopError = "no-low-player-server"
								return false
							end
						else
							state.lastServerBrowserError = tostring(result2)
							if #tbl63 == 0 then
								state.lastHopError = "no-low-player-server"
								return false
							end
						end
					elseif #tbl63 == 0 then
						state.lastHopError = "no-low-player-server"
						return false
					end
				end

				local v = tbl63[math.random(1, #tbl63)]

				state.lastHop = {
					job = v.id,
					count = v.count,
					source = v.source,
					maximumPlayers = lastHopMaximumPlayers,
					reason = lastHopReason,
					at = os.time(),
				}

				arg.Functions.StopTween()

				if serverBrowser then
					if serverBrowser:IsA("RemoteFunction") then
						serverBrowser:InvokeServer("teleport", v.id)
					else
						TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, arg.LocalPlayer)
					end
				else
					TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, arg.LocalPlayer)
				end

				return true
			end, debug.traceback)

			state.hopBusy = false
			if ok then
				return result == true
			end
			state.lastHopError = tostring(result)
			return false
		end

		return false
	end

	local n13 = 0.5
	local distance2 = 50
	local distance3 = 20
	local n14 = 10
	local distance4 = 2
	local n15 = 120

	local function fn17(arg, arg2)
		local configs = arg.Environment.Configs or {}
		local configuration = configs.Configuration

		if type(configuration) == "table" then
			if configuration[arg2] ~= nil then
				return configuration[arg2] == true
			end
		end

		if configs[arg2] ~= nil then
			return configs[arg2] == true
		end
		return true
	end

	local function fn18(arg)
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		local character3 = character

		if character3 then
			character3 = character:FindFirstChild("HumanoidRootPart")
		end

		if not character then
			return nil, nil
		end

		if not character2 then
			return nil, nil
		end

		if not (character2.Health <= 0) then
			if character3 then
				return character, character3
			end
		end

		return nil, nil
	end

	local function fn19(state, idleCharacter, arg, lastIdleMovementCheck)
		if state.idleCharacter ~= idleCharacter then
			state.idleCharacter = idleCharacter
			state.idleOldPosition = arg.Position
			state.lastIdleMovementCheck = lastIdleMovementCheck
			state.lastIdlingAt = os.time()
			return
		end

		if lastIdleMovementCheck < (state.lastIdleMovementCheck or 0) + 1 then
			return
		end
		state.lastIdleMovementCheck = lastIdleMovementCheck
		local idleOldPosition = state.idleOldPosition

		if idleOldPosition then
			if (arg.Position - idleOldPosition).Magnitude < distance4 then
				return
			end
		end

		state.idleOldPosition = arg.Position
		state.lastIdlingAt = os.time()
		state.lastIdleProgressKind = "movement"
	end

	local function fn20(state)
		if state.questAcquire then
			return true
		end
		local str = tostring(state.status or "")
		return str:find("Claiming Quest", 1, true) ~= nil or str:find("Moving to quest giver", 1, true) ~= nil or str:find("Waiting quest confirmation", 1, true) ~= nil
	end

	local function fn21(part)
		return part.AssemblyLinearVelocity == Vector3.zero
	end

	local function fn22(arg, arg2, arg3, now)
		local state = arg.State
		if not fn17(arg, "HopNear") then
			return false
		end

		if arg.TaskQueue:top() ~= "Auto Farm Level" then
			return false
		end

		if state.factoryActive then
			return false
		end

		if fn20(state) then
			return false
		end

		if state.isResetting then
			return false
		end

		if state.resetting then
			return false
		end

		if state.hopBusy then
			return false
		end

		if now < (state.nearbyHopRetryAt or 0) then
			return false
		end
		local characters = workspace:FindFirstChild("Characters")
		state.nearbyPlayerSamples = state.nearbyPlayerSamples or {}
		local characters2 = characters

		if characters2 then
			characters2 = characters:GetChildren()
		end

		characters2 = characters2 or {}

		for _, instance in characters2 do
			if instance == arg2 then
				continue
			end
			local humanoid = instance:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")
			if not humanoid then
				continue
			end

			if not (humanoid.Health > 0) then
				continue
			end

			if not humanoidRootPart then
				continue
			end

			if fn21(humanoidRootPart) then
				if not ((humanoidRootPart.Position - arg3.Position).Magnitude <= distance2) then
					continue
				end
				local name = instance.Name
				local nearbyPlayerSample = state.nearbyPlayerSamples[name]

				if nearbyPlayerSample then
					if distance3 < (humanoidRootPart.Position - nearbyPlayerSample).Magnitude then
						state.nearbyHopRetryAt = now + n14
						state.nearbyPlayerSamples = {}
						state.status = "Auto Farm Level | Hopping from nearby player"
						arg.Functions.StopTween()
						local v = arg.Functions.HopServer(5, "Nearby player: " .. instance.Name)
						state.lastNearbyPlayerHop = { name = instance.Name, success = v, at = os.time() }
						return v == true
					end

					state.nearbyPlayerSamples[name] = nil
					continue
				end

				state.nearbyPlayerSamples[name] = humanoidRootPart.Position
				continue
			end
		end

		return false
	end

	local function fn23(arg, now)
		local state = arg.State

		if arg.TaskQueue:top() ~= "Auto Farm Level" then
			state.lastIdlingAt = os.time()
			state.idleSeconds = 0
			state.lastIdleProgressKind = "protected-task"
			return false
		end

		if not fn17(arg, "HopWhenIdle") then
			return false
		end

		if state.factoryActive then
			return false
		end

		if state.hopBusy then
			return false
		end

		if not (now < (state.idleHopRetryAt or 0)) then
			state.lastIdlingAt = state.lastIdlingAt or os.time()
			local elapsed = os.time() - state.lastIdlingAt
			state.idleSeconds = elapsed

			if not (elapsed <= n15) then
				state.idleHopRetryAt = now + n14
				state.status = "Recovery | Hopping after 120 seconds idle"
				arg.Functions.StopTween()
				local v = arg.Functions.HopServer(nil, "idle-120-seconds")
				state.lastIdleHop = { success = v, idleSeconds = elapsed, at = os.time() }
				return v == true
			end

			return false
		end

		return false
	end

	tbl59 = { run = function(arg)
		local state = arg.State
		local now = os.clock()
		if now < (state.nextRecoveryWatchdogAt or 0) then
			return false
		end
		state.nextRecoveryWatchdogAt = now + n13
		local v, v2 = fn18(arg)
		if state.paused then
			return false
		end

		if not state.stopped then
			if v then
				fn19(state, v, v2, now)
				if fn22(arg, v, v2, now) then
					return true
				end
				return fn23(arg, now)
			end
		end

		return false
	end }

	local n16 = 5
	local delay = 2
	local n17 = 10

	tbl60 = {
		startFruitStoreBackground = function(arg)
			local state = arg.State
			if state.stopped then
				return false
			end

			if state.paused then
				return false
			end

			if state.inventoryStartupPending then
				return false
			end

			if state.fruitStoreBackgroundToken then
				return false
			end

			if type(arg.Functions.StoreCarriedFruits) == "function" then
				local fruitStoreBackgroundToken = {}
				state.fruitStoreBackgroundToken = fruitStoreBackgroundToken

				local thread = task.spawn(function()
					local exitTo = nil

					while true do
						if state.fruitStoreBackgroundToken ~= fruitStoreBackgroundToken then
							exitTo = 1
							break
						end

						if state.stopped then
							exitTo = 1
							break
						end

						if not state.paused then
							state.lastFruitStorePulseAt = os.clock()
							local ok, result = pcall(arg.Functions.StoreCarriedFruits)
							if state.fruitStoreBackgroundToken ~= fruitStoreBackgroundToken then
								break
							end
							local lastFruitStoreBackgroundError = not ok

							if lastFruitStoreBackgroundError then
								lastFruitStoreBackgroundError = tostring(result)
							end

							state.lastFruitStoreBackgroundError = lastFruitStoreBackgroundError or nil
						end

						task.wait(delay)
					end

					if exitTo == 1 then
						if state.fruitStoreBackgroundToken == fruitStoreBackgroundToken then
							state.fruitStoreBackgroundToken = nil
							state.fruitStoreBackgroundThread = nil
						end
					end
				end)

				if state.fruitStoreBackgroundToken == fruitStoreBackgroundToken then
					state.fruitStoreBackgroundThread = thread
				end

				return true
			end

			return false
		end,
		ensureQuestNotification = function(arg)
			local state = arg.State
			local now = os.clock()
			if state.stopped then
				return false
			end

			if state.questNotificationBridgeReady == true then
				return false
			end

			if type(arg.AttachQuestNotification) ~= "function" then
				return false
			end

			if not (now < (state.nextQuestNotificationAttachAt or 0)) then
				state.nextQuestNotificationAttachAt = now + n17
				local ok, result, result2 = pcall(arg.AttachQuestNotification)

				if ok then
					if result ~= true then
						state.questNotificationBridgeReady = false
						state.questNotificationBridgeError = state.questNotificationBridgeError or tostring(result2 or "notification-hook-unavailable")
						return false
					end

					state.questNotificationBridgeReady = true
					state.questNotificationBridgeError = nil
					return true
				end

				state.questNotificationBridgeReady = false
				state.questNotificationBridgeError = tostring(result)
				return false
			end

			return false
		end,
		startMeleeBackground = function(arg)
			local state = arg.State
			local runMeleeBackground = arg.Functions.RunMeleeBackground
			if state.stopped then
				return false
			end

			if state.inventoryStartupPending then
				return false
			end

			if type(runMeleeBackground) ~= "function" then
				return false
			end

			if not state.meleeBackgroundRunning then
				local meleeBackgroundToken = {}
				state.meleeBackgroundToken = meleeBackgroundToken
				state.meleeBackgroundRunning = true
				state.meleeBackgroundStartedAt = os.clock()

				local thread = task.spawn(function()
					local now = os.clock()
					local ok, result = pcall(runMeleeBackground)
					if state.meleeBackgroundToken ~= meleeBackgroundToken then
						return
					end
					state.lastMeleeBackgroundDuration = os.clock() - now
					state.lastMeleeBackgroundCompletedAt = os.clock()
					state.meleeBackgroundThread = nil
					state.meleeBackgroundToken = nil
					state.meleeBackgroundRunning = false

					if ok then
						state.lastMeleeBackgroundError = nil
					else
						state.lastMeleeBackgroundError = tostring(result)
					end
				end)

				if state.meleeBackgroundToken == meleeBackgroundToken then
					state.meleeBackgroundThread = thread
				end

				return true
			end

			return false
		end,
		startFruitGachaBackground = function(arg)
			local state = arg.State
			local autoFruitGacha = arg.Functions.AutoFruitGacha
			local now = os.clock()

			if not state.stopped then
				if not state.inventoryStartupPending then
					if type(autoFruitGacha) == "function" then
						if not state.fruitGachaBackgroundRunning then
							if not (now < (state.nextFruitGachaAt or 0)) then
								if not (now < (state.nextFruitGachaBackgroundPulseAt or 0)) then
									local fruitGachaBackgroundToken = {}
									state.fruitGachaBackgroundToken = fruitGachaBackgroundToken
									state.nextFruitGachaBackgroundPulseAt = now + n16
									state.fruitGachaBackgroundRunning = true
									state.fruitGachaBackgroundStartedAt = now

									local thread = task.spawn(function()
										local now2 = os.clock()
										local ok, result = pcall(autoFruitGacha)
										if state.fruitGachaBackgroundToken ~= fruitGachaBackgroundToken then
											return
										end
										state.lastFruitGachaBackgroundDuration = os.clock() - now2
										state.lastFruitGachaBackgroundCompletedAt = os.clock()
										local ok2 = ok

										if ok2 then
											ok2 = tostring(result)
										end

										state.lastFruitGachaBackgroundResult = ok2 or nil
										state.fruitGachaBackgroundThread = nil
										state.fruitGachaBackgroundToken = nil
										state.fruitGachaBackgroundRunning = false

										if ok then
											state.lastFruitGachaBackgroundError = nil
										else
											state.lastFruitGachaBackgroundError = tostring(result)
											state.nextFruitGachaBackgroundPulseAt = os.clock() + 60
										end
									end)

									if state.fruitGachaBackgroundToken == fruitGachaBackgroundToken then
										state.fruitGachaBackgroundThread = thread
									end

									return true
								end
							end
						end
					end
				end
			end

			return false
		end,
		run = function(arg, arg2)
			local state = arg.State
			local functions = arg.Functions

			local function fn24()
				local flag = not state.stopped

				if flag then
					flag = type(arg2) ~= "function" or arg2()
				end

				return flag
			end

			if not fn24() then
				return
			end
			state.taskErrors = {}
			local lastTaskName

			while fn24() do
				local exitTo = nil

				while fn24() do
					task.wait(0.15)
					if state.paused then
						continue
					end

					if not fn24() then
						exitTo = 1
						break
					end
					local ok4 = true

					if type(functions.EnsureTeam) == "function" then
						local ok, result = pcall(functions.EnsureTeam)
						if not fn24() then
							exitTo = 2
							break
						end
						local ok2 = ok

						if ok2 then
							ok2 = result == true
						end

						ok4 = ok2

						if not ok then
							state.lastTeamError = tostring(result)
						end
					end

					if not ok4 then
						state.runtimeReady = false
						local status = state.teamState == "waiting-player-data"

						if status then
							status = "Starting SeaHub | Waiting player data"
						end

						state.status = status or "Starting SeaHub | Selecting " .. tostring(arg.DesiredTeam or "Pirates")
						task.wait(0.25)
						continue
					end

					local localPlayer = arg.LocalPlayer
					local now, nextQuestDataRefreshAt, ok, result, ok5, ok2, result2, ok3, result3, flag, character, character3, lastFruitMovementHandoff, character4, droppedFruitTarget

					if localPlayer then
						local character2 = localPlayer.Character
						local character5 = character2

						if character5 then
							character5 = character2:FindFirstChildOfClass("Humanoid")
						end

						local character6 = character2

						if character6 then
							character6 = character2:FindFirstChild("HumanoidRootPart")
						end

						if character5 then
							if not (character5.Health <= 0) then
								if character6 then
									state.runtimeReady = true

									if not state.postTeamQuestDataRefreshed then
										if type(arg.RefreshQuestData) == "function" then
											now = os.clock()
											nextQuestDataRefreshAt = state.nextQuestDataRefreshAt or 0

											if nextQuestDataRefreshAt <= now then
												ok, result = pcall(arg.RefreshQuestData, arg)

												if ok then
													if tonumber(result) then
														if result > 0 then
															state.postTeamQuestDataRefreshed = true
															state.lastQuestDataRefreshAt = os.clock()
														else
															ok5 = ok

															if ok5 then
																ok5 = "empty quest route table"
															end

															ok5 = ok5 or tostring(result)
															state.lastQuestDataRefreshError = ok5
															state.nextQuestDataRefreshAt = os.clock() + 2
														end
													else
														ok5 = ok

														if ok5 then
															ok5 = "empty quest route table"
														end

														ok5 = ok5 or tostring(result)
														state.lastQuestDataRefreshError = ok5
														state.nextQuestDataRefreshAt = os.clock() + 2
													end
												else
													ok5 = ok

													if ok5 then
														ok5 = "empty quest route table"
													end

													ok5 = ok5 or tostring(result)
													state.lastQuestDataRefreshError = ok5
													state.nextQuestDataRefreshAt = os.clock() + 2
												end
											end
										end
									end

									if state.inventoryStartupPending then
										ok2, result2 = pcall(functions.RefreshInventory)
										if not fn24() then
											exitTo = 3
											break
										end

										if not ok2 then
											state.lastInventoryRefreshError = tostring(result2)
										end

										if state.inventoryReady ~= true then
											state.status = "Waiting initial inventory | Retrying read"
											if type(functions.RecoveryWatchdog) ~= "function" then
												continue
											end
											ok3, result3 = pcall(functions.RecoveryWatchdog)

											if fn24() then
												if ok3 then
													continue
												end
												state.lastRecoveryError = tostring(result3)
												continue
											end

											exitTo = 4
											break
										end

										state.inventoryStartupPending = false
										state.inventoryStartupReadyAt = os.clock()
										tbl60.startFruitStoreBackground(arg)
										if not fn24() then
											exitTo = 5
											break
										end
									end

									lastTaskName = arg.TaskQueue:top()

									if lastTaskName ~= state.lastTaskName then
										flag = state.lastTaskName == "Get Fruits"

										if flag then
											flag = lastTaskName ~= nil
										end

										functions.StopTween({ preserveAltitude = flag })
										if not fn24() then
											exitTo = 6
											break
										end

										if flag then
											character = arg.LocalPlayer.Character
											character3 = character

											if character3 then
												character3 = character:FindFirstChild("HumanoidRootPart")
											end

											lastFruitMovementHandoff = { at = os.clock(), nextTask = lastTaskName }
											character4 = character3

											if character4 then
												character4 = tostring(character3.Position)
											end

											lastFruitMovementHandoff.position = character4
											droppedFruitTarget = state.droppedFruitTarget

											if droppedFruitTarget then
												droppedFruitTarget = state.droppedFruitTarget.Name
											end

											lastFruitMovementHandoff.fruit = droppedFruitTarget
											state.lastFruitMovementHandoff = lastFruitMovementHandoff
										end

										if type(functions.StopAttack) == "function" then
											functions.StopAttack()
											if not fn24() then
												exitTo = 7
												break
											end
										end

										table.clear(arg.NearbyTargets)
										table.clear(arg.NearbyTargetParts)
										state.farmTarget = nil
										state.attackTarget = nil
										state.attackTargetNames = nil
										state.attackTask = nil
										state.missingMobState = nil
										state.lastTaskName = lastTaskName

										if lastTaskName then
											state.status = lastTaskName
											functions.ResetFarmWatchdog(lastTaskName, "active")
										else
											functions.ResetFarmWatchdog(nil, "idle")
										end

										if not fn24() then
											exitTo = 8
											break
										end
									end

									if state.travel then
										if os.clock() - state.travel.startedAt > 45 then
											exitTo = 10
											break
										end
										continue
									end

									exitTo = 9
									break
								end
							end
						end

						state.runtimeReady = false
						state.status = "Starting SeaHub | Waiting character"
						task.wait(0.25)
					else
						state.runtimeReady = true

						if not state.postTeamQuestDataRefreshed then
							if type(arg.RefreshQuestData) == "function" then
								now = os.clock()
								nextQuestDataRefreshAt = state.nextQuestDataRefreshAt or 0

								if nextQuestDataRefreshAt <= now then
									ok, result = pcall(arg.RefreshQuestData, arg)

									if ok then
										if tonumber(result) then
											if result > 0 then
												state.postTeamQuestDataRefreshed = true
												state.lastQuestDataRefreshAt = os.clock()
											else
												ok5 = ok

												if ok5 then
													ok5 = "empty quest route table"
												end

												ok5 = ok5 or tostring(result)
												state.lastQuestDataRefreshError = ok5
												state.nextQuestDataRefreshAt = os.clock() + 2
											end
										else
											ok5 = ok

											if ok5 then
												ok5 = "empty quest route table"
											end

											ok5 = ok5 or tostring(result)
											state.lastQuestDataRefreshError = ok5
											state.nextQuestDataRefreshAt = os.clock() + 2
										end
									else
										ok5 = ok

										if ok5 then
											ok5 = "empty quest route table"
										end

										ok5 = ok5 or tostring(result)
										state.lastQuestDataRefreshError = ok5
										state.nextQuestDataRefreshAt = os.clock() + 2
									end
								end
							end
						end

						if state.inventoryStartupPending then
							ok2, result2 = pcall(functions.RefreshInventory)
							if not fn24() then
								exitTo = 3
								break
							end

							if not ok2 then
								state.lastInventoryRefreshError = tostring(result2)
							end

							if state.inventoryReady ~= true then
								state.status = "Waiting initial inventory | Retrying read"
								if type(functions.RecoveryWatchdog) ~= "function" then
									continue
								end
								ok3, result3 = pcall(functions.RecoveryWatchdog)

								if fn24() then
									if ok3 then
										continue
									end
									state.lastRecoveryError = tostring(result3)
									continue
								end

								exitTo = 4
								break
							end

							state.inventoryStartupPending = false
							state.inventoryStartupReadyAt = os.clock()
							tbl60.startFruitStoreBackground(arg)
							if not fn24() then
								exitTo = 5
								break
							end
						end

						lastTaskName = arg.TaskQueue:top()

						if lastTaskName ~= state.lastTaskName then
							flag = state.lastTaskName == "Get Fruits"

							if flag then
								flag = lastTaskName ~= nil
							end

							functions.StopTween({ preserveAltitude = flag })
							if not fn24() then
								exitTo = 6
								break
							end

							if flag then
								character = arg.LocalPlayer.Character
								character3 = character

								if character3 then
									character3 = character:FindFirstChild("HumanoidRootPart")
								end

								lastFruitMovementHandoff = { at = os.clock(), nextTask = lastTaskName }
								character4 = character3

								if character4 then
									character4 = tostring(character3.Position)
								end

								lastFruitMovementHandoff.position = character4
								droppedFruitTarget = state.droppedFruitTarget

								if droppedFruitTarget then
									droppedFruitTarget = state.droppedFruitTarget.Name
								end

								lastFruitMovementHandoff.fruit = droppedFruitTarget
								state.lastFruitMovementHandoff = lastFruitMovementHandoff
							end

							if type(functions.StopAttack) == "function" then
								functions.StopAttack()
								if not fn24() then
									exitTo = 7
									break
								end
							end

							table.clear(arg.NearbyTargets)
							table.clear(arg.NearbyTargetParts)
							state.farmTarget = nil
							state.attackTarget = nil
							state.attackTargetNames = nil
							state.attackTask = nil
							state.missingMobState = nil
							state.lastTaskName = lastTaskName

							if lastTaskName then
								state.status = lastTaskName
								functions.ResetFarmWatchdog(lastTaskName, "active")
							else
								functions.ResetFarmWatchdog(nil, "idle")
							end

							if not fn24() then
								exitTo = 8
								break
							end
						end

						if not state.travel then
							exitTo = 9
							break
						end

						if os.clock() - state.travel.startedAt > 45 then
							exitTo = 10
							break
						end
					end
				end

				if exitTo == 1 then
					return
				end

				if exitTo == 2 then
					return
				end

				if exitTo == 3 then
					return
				end

				if exitTo == 4 then
					return
				end

				if exitTo == 5 then
					return
				end

				if exitTo == 6 then
					return
				end

				if exitTo == 7 then
					return
				end

				if exitTo == 8 then
					return
				end

				if exitTo ~= 9 then
					if exitTo ~= 10 then
						return
					end
					state.lastTravelError = "Travel deadline exceeded"
					state.travelCooldownUntil = os.clock() + 60
					functions.StopTween()
					if not fn24() then
						return
					end
				end

				local lastTaskName2 = lastTaskName

				if lastTaskName2 then
					lastTaskName2 = arg.TaskDefinitions[lastTaskName]
				end

				local lastTaskName3 = lastTaskName

				if lastTaskName3 then
					lastTaskName3 = state.taskErrors[lastTaskName]
				end

				tbl60.ensureQuestNotification(arg)
				if not fn24() then
					return
				end

				if type(functions.UpStats) == "function" then
					local ok, result = pcall(functions.UpStats)
					if not fn24() then
						return
					end

					if not ok then
						state.lastStatError = tostring(result)
					end
				end

				if type(functions.RejoinPersistence) == "function" then
					functions.RejoinPersistence()
					if not fn24() then
						return
					end
				end

				if type(functions.ProgressionProbe) == "function" then
					local ok, result = pcall(functions.ProgressionProbe)
					if not fn24() then
						return
					end

					if not ok then
						state.lastProgressProbeError = tostring(result)
					end
				end

				if type(functions.RefreshInventory) == "function" then
					local ok, result = pcall(functions.RefreshInventory)
					if not fn24() then
						return
					end

					if not ok then
						state.lastInventoryRefreshError = tostring(result)
					end
				end

				tbl60.startMeleeBackground(arg)

				if fn24() then
					tbl60.startFruitGachaBackground(arg)
					if not fn24() then
						return
					end

					if type(functions.ProgressionPlanner) == "function" then
						local ok, result = pcall(functions.ProgressionPlanner)
						if not fn24() then
							return
						end

						if not ok then
							state.lastProgressionPlanError = tostring(result)
						end
					end

					if type(functions.RecoveryWatchdog) == "function" then
						local ok, result = pcall(functions.RecoveryWatchdog)
						if not fn24() then
							return
						end

						if not ok then
							state.lastRecoveryError = tostring(result)
						end
					end

					if lastTaskName2 then
						if arg.TaskQueue:top() == lastTaskName then
							local ok, result, lastTaskName4

							if lastTaskName3 then
								if not (lastTaskName3.retryAt <= os.clock()) then
									if fn24() then
										task.wait(0.1)
									end

									continue
								end

								ok, result = xpcall(function()
									lastTaskName2.func(table.unpack(lastTaskName2.args or {}))
								end, debug.traceback)

								if not fn24() then
									return
								end

								if ok then
									state.taskErrors[lastTaskName] = nil

									if fn24() then
										task.wait(0.1)
									end

									continue
								end

								functions.StopTween()

								if fn24() then
									lastTaskName4 = lastTaskName3

									if lastTaskName4 then
										lastTaskName4 = lastTaskName3.count + 1
									end

									lastTaskName4 = lastTaskName4 or 1

									state.taskErrors[lastTaskName] = {
										count = lastTaskName4,
										message = tostring(result),
										retryAt = os.clock() + math.min(10, lastTaskName4),
									}

									state.lastError = tostring(result)
									functions.RecordFarmRecovery("task-error", result)
									warn("[SeaHub][" .. lastTaskName .. "] " .. tostring(result))

									if fn24() then
										task.wait(0.1)
									end

									continue
								end

								return
							end

							ok, result = xpcall(function()
								lastTaskName2.func(table.unpack(lastTaskName2.args or {}))
							end, debug.traceback)

							if not fn24() then
								return
							end

							if ok then
								state.taskErrors[lastTaskName] = nil

								if fn24() then
									task.wait(0.1)
								end

								continue
							end

							functions.StopTween()

							if fn24() then
								lastTaskName4 = lastTaskName3

								if lastTaskName4 then
									lastTaskName4 = lastTaskName3.count + 1
								end

								lastTaskName4 = lastTaskName4 or 1

								state.taskErrors[lastTaskName] = {
									count = lastTaskName4,
									message = tostring(result),
									retryAt = os.clock() + math.min(10, lastTaskName4),
								}

								state.lastError = tostring(result)
								functions.RecordFarmRecovery("task-error", result)
								warn("[SeaHub][" .. lastTaskName .. "] " .. tostring(result))

								if fn24() then
									task.wait(0.1)
								end

								continue
							end

							return
						end

						if fn24() then
							task.wait(0.1)
						end

						continue
					end

					if fn24() then
						task.wait(0.1)
					end

					continue
				end

				return
			end
		end,
	}

	local function fn24(arg)
		for i = 1, 3 do
			if arg.IsSea(i) then
				return i
			end
		end

		return 0
	end

	tbl61 = { run = function(arg)
		local state = arg.State
		local functions = arg.Functions
		local value = arg.Level.Value
		local v = fn24(arg)

		local function fn25(arg2, arg3, arg4)
			if arg3 then
				arg.TaskQueue:push(arg2, arg4 or arg.TaskPriorities[arg2] or tbl3.Priorities[arg2])
			else
				arg.TaskQueue:pop(arg2)
			end
		end

		fn25("Auto Farm Level", true)
		local isRaidActive = state.raidActive == true or state.raidStartRequestedAt ~= nil or os.clock() < (state.raidStartPendingUntil or 0)

		if not isRaidActive then
			isRaidActive = functions.IsRaidActive

			if isRaidActive then
				isRaidActive = functions.IsRaidActive()
			end
		end

		local isRaidActive2 = isRaidActive

		if not isRaidActive2 then
			isRaidActive2 = functions.ShouldAutoRaid

			if isRaidActive2 then
				isRaidActive2 = functions.ShouldAutoRaid()
			end
		end

		arg.TaskDefinitions["Auto Raid"].args = {}
		fn25("Auto Raid", isRaidActive2)
		local v2 = fn25
		local str = "Melee Materials"
		local needsMeleeMaterialTask = functions.NeedsMeleeMaterialTask

		if needsMeleeMaterialTask then
			needsMeleeMaterialTask = functions.NeedsMeleeMaterialTask()
		end

		v2(str, needsMeleeMaterialTask)
		local v3 = fn25
		local str2 = "Auto Trevor"
		local shouldAutoTrevor = v == 2

		if shouldAutoTrevor then
			shouldAutoTrevor = value >= 1100
		end

		if shouldAutoTrevor then
			shouldAutoTrevor = functions.ShouldAutoTrevor
		end

		if shouldAutoTrevor then
			shouldAutoTrevor = functions.ShouldAutoTrevor()
		end

		v3(str2, shouldAutoTrevor)
		local v4 = fn25
		local str3 = "Auto Third Sea"
		local canAutoThirdSea = v == 2

		if canAutoThirdSea then
			canAutoThirdSea = value >= 1500
		end

		if canAutoThirdSea then
			canAutoThirdSea = functions.CanAutoThirdSea
		end

		if canAutoThirdSea then
			canAutoThirdSea = functions.CanAutoThirdSea()
		end

		v4(str3, canAutoThirdSea)
		local v5 = fn25
		local str4 = "Auto Second Sea"
		local flag = v == 1

		if flag then
			flag = value >= 700
		end

		v5(str4, flag)
		local environment = arg.Environment
		local exitTo = nil
		local Darkbeard, v6, v7

		while true do
			local hasDroppedFruit

			if environment.Configs["Get Fruits"] ~= false then
				hasDroppedFruit = functions.HasDroppedFruit
				hasDroppedFruit = hasDroppedFruit()

				if hasDroppedFruit then
					hasDroppedFruit = "Get Fruits"
					fn25(hasDroppedFruit, true)
				else
					hasDroppedFruit = "Get Fruits"
					fn25(hasDroppedFruit, false)
				end
			else
				hasDroppedFruit = "Get Fruits"
				fn25(hasDroppedFruit, false)
			end

			environment = {}
			hasDroppedFruit = tbl7.Order

			for _, v8 in hasDroppedFruit do
				if arg.IsSea(v8.sea) then
					local liveBoss = functions.GetLiveBoss(v8.name)
					environment[v8.name] = liveBoss or false
					tbl8.observe(arg, v8.name, liveBoss, "ordered-scan")
				end
			end

			hasDroppedFruit = nil

			local function fn26(arg2)
				hasDroppedFruit = 898797515

				if functions.ShouldTargetOrderedBoss then
					if not functions.ShouldTargetOrderedBoss(arg2) then
						return false
					end
				end

				local liveBoss = environment[arg2]

				if liveBoss == nil then
					liveBoss = functions.GetLiveBoss(arg2)
					environment[arg2] = liveBoss or false
					tbl8.observe(arg, arg2, liveBoss, "scheduler-scan")
				elseif liveBoss == false then
					liveBoss = nil
				end

				local flag2 = liveBoss ~= nil

				if arg2 == "Cake Prince" then
					if flag2 then
						if os.clock() < (state.cakePrincePortalBlockedUntil or 0) then
							return false
						end
					else
						state.cakePrincePortalStartedAt = nil
						state.cakePrincePortalBlockedUntil = nil
					end
				end

				return flag2
			end

			local flag2 = v == 2

			if flag2 then
				flag2 = value >= 850
			end

			if flag2 then
				flag2 = state.bartiloCompleted ~= true
			end

			if flag2 then
				flag2 = not functions.Owns("Accessory", "Warrior Helmet")
			end

			if flag2 then
				fn25("Auto Bartilo Quest", true)
			else
				fn25("Auto Bartilo Quest", false)
			end

			local flag3 = functions.GetLiveBoss("Saber Expert") ~= nil

			if flag3 then
				state.saberAwaitingFinalBoss = nil
			end

			local v8 = fn25
			local str5 = "Auto Saber"
			local flag4 = arg.Environment.Configs.Saber ~= false

			if flag4 then
				flag4 = v == 1
			end

			if flag4 then
				flag4 = value >= 200
			end

			if flag4 then
				flag4 = not functions.Owns("Moveset", "Saber")
			end

			if flag4 then
				flag4 = not state.saberAwaitingFinalBoss or flag3
			end

			v8(str5, flag4)
			local n18 = tonumber(state.eliteProgress) or 0
			local v9 = fn25
			local str6 = "Auto Yama"
			local shouldAutoYama = functions.ShouldAutoYama

			if shouldAutoYama then
				shouldAutoYama = functions.ShouldAutoYama()
			end

			if not shouldAutoYama then
				shouldAutoYama = v == 3

				if shouldAutoYama then
					shouldAutoYama = value >= 2800
				end

				if shouldAutoYama then
					shouldAutoYama = n18 >= 30
				end

				if shouldAutoYama then
					shouldAutoYama = not functions.Owns("Moveset", "Yama")
				end
			end

			v9(str6, shouldAutoYama)
			local flag5 = v == 3

			if flag5 then
				flag5 = functions.GetLiveBoss("rip_indra True Form") ~= nil
			end

			local flag6 = v == 3

			if flag6 then
				flag6 = functions.GetLiveBoss("Longma") ~= nil
			end

			local v10 = fn25
			local str7 = "Auto Tushita"
			local shouldAutoTushita = functions.ShouldAutoTushita

			if shouldAutoTushita then
				shouldAutoTushita = functions.ShouldAutoTushita()
			end

			if not shouldAutoTushita then
				shouldAutoTushita = v == 3

				if shouldAutoTushita then
					shouldAutoTushita = value >= 2000
				end

				if shouldAutoTushita then
					shouldAutoTushita = not functions.Owns("Moveset", "Tushita")
				end

				if shouldAutoTushita then
					shouldAutoTushita = flag5

					if not shouldAutoTushita then
						shouldAutoTushita = state.tushitaDoorOpened

						if shouldAutoTushita then
							shouldAutoTushita = flag6
						end
					end
				end
			end

			v10(str7, shouldAutoTushita)
			local v11 = fn25
			local str8 = "Utility Items Activation"
			local shouldActivateUtilityItem = functions.ShouldActivateUtilityItem

			if shouldActivateUtilityItem then
				shouldActivateUtilityItem = functions.ShouldActivateUtilityItem()
			end

			v11(str8, shouldActivateUtilityItem)

			for _, v12 in { "Pirate Raid", "Tyrant Boss", "Auto Soul Guitar" } do
				arg.TaskQueue:pop(v12)
			end

			Darkbeard = not (functions.Carries("God's Chalice") or functions.Carries("Sweet Chalice") or functions.Carries("Hallow Essence"))

			if Darkbeard then
				Darkbeard = value >= 700
			end

			if Darkbeard then
				Darkbeard = value < 2600
			end

			if Darkbeard then
				Darkbeard = functions.GetLiveBoss("Darkbeard")
			end

			Darkbeard = Darkbeard or nil

			if Darkbeard then
				arg.TaskDefinitions["Special Boss"].args = { "Darkbeard", "Special Boss", false }
			end

			fn25("Special Boss", Darkbeard ~= nil)
			v6 = nil
			v7 = nil

			if not tbl7.isBlocked(functions.Carries) then
				v6 = tbl7.selectOrdered(value, arg.IsSea, fn26)

				if not v6 then
					if value > 900 then
						v6, v7 = tbl7.selectQuest(value, state.bossQuestData, fn26, state.blacklistedBossQuestIds)
					end
				end
			end

			if not v6 then
				break
			end
			arg.TaskDefinitions["Farm Boss"].args = { v6, "Farm Boss", v7 ~= nil, v7 }
			fn25("Farm Boss", true)
			exitTo = 1
			break
		end

		if exitTo == 1 then
			local schedulerReason = v7

			if schedulerReason then
				schedulerReason = "boss-quest:" .. v6
			end

			state.schedulerReason = schedulerReason or "boss-order:" .. v6
		else
			fn25("Farm Boss", false)
		end

		local v8 = fn25
		local str5 = "Exp Redeem"
		local shouldRedeemExpCode = functions.ShouldRedeemExpCode

		if shouldRedeemExpCode then
			shouldRedeemExpCode = functions.ShouldRedeemExpCode()
		end

		v8(str5, shouldRedeemExpCode)

		if not v6 then
			if state.schedulerReason then
				if state.schedulerReason:find("boss-", 1, true) == 1 then
					state.schedulerReason = "level-progress"
				end
			end
		end

		if isRaidActive then
			state.schedulerReason = "raid-active"
		elseif Darkbeard then
			state.schedulerReason = "special-boss:Darkbeard"
		end

		local v9 = arg.TaskQueue:top()
		local select_ = tbl8.select
		local v10 = arg
		local v11 = v6
		local str6 = v7

		if str6 then
			str6 = "boss-quest"
		end

		if not str6 then
			str6 = v6

			if str6 then
				str6 = "boss-order"
			end
		end

		select_(v10, v11, str6 or nil, v9)
		return v9
	end }

	local taskName = "Get Fruits"
	local timeoutSeconds = 10
	local n18 = 15
	local n19 = 8
	local ItemConfig = nil
	local fruitConfigIndex = nil

	local function fn25(arg)
		if type(arg) ~= "table" then
			return nil
		end

		return {
			storageKey = arg.storageKey,
			itemId = arg.itemId,
			value = arg.value,
			name = arg.name,
			raw = arg.raw,
		}
	end

	local function buildFruitConfigIndex(arg)
		local tbl63 = { byItemId = {}, byStorageKey = {}, byName = {} }
		local tbl64 = arg or {}

		for _, v in tbl64 do
			local index = type(v) == "table"

			if index then
				index = v.Index
			end

			index = index or nil
			local display = type(v) == "table"

			if display then
				display = v.Display
			end

			display = display or nil
			if type(index) ~= "table" then
				continue
			end

			if type(display) ~= "table" then
				continue
			end

			if type(index.StorageKey) ~= "string" then
				continue
			end

			if index.IdType ~= "PhysicalMoveset" then
				continue
			end

			if display.Category == "Blox Fruit" then
				local name = display.Name or index.StorageKey
				local match = name:match("%sFruit$")

				if match then
					match = name
				end

				match = match or name .. " Fruit"

				local tbl65 = {
					storageKey = index.StorageKey,
					itemId = index.ItemId,
					value = tbl6.moneyValue(v),
					name = match,
					raw = v,
				}

				tbl63.byStorageKey[index.StorageKey] = tbl65
				tbl63.byName[name] = tbl65
				tbl63.byName[match] = tbl65

				if index.ItemId ~= nil then
					tbl63.byItemId[tostring(index.ItemId)] = tbl65
				end
			end
		end

		return tbl63
	end

	local function resolveIndexedMetadata(arg, arg2)
		local tbl63 = arg2 or {}
		if tbl63.itemId ~= nil then
			return fn25(arg.byItemId[tostring(tbl63.itemId)]) or { itemId = tbl63.itemId }
		end
		local v = arg.byStorageKey[tbl63.originalName] or arg.byStorageKey[tbl63.storageKey] or arg.byName[tbl63.name] or arg.byStorageKey[tbl63.name]
		return fn25(v)
	end

	local function getIsTool(instance)
		local isTool = typeof(instance) == "Instance"

		if isTool then
			isTool = instance:IsA("Tool")
		end

		if isTool then
			isTool = instance.Name:find("Fruit", 1, true) ~= nil
		end

		if isTool then
			isTool = instance.Parent == workspace
		end

		return isTool
	end

	local function getHandle(instance)
		return instance:FindFirstChild("Handle") or instance:FindFirstChildWhichIsA("BasePart", true)
	end

	local function getFailedDroppedFruits(state, arg)
		local failedDroppedFruits = state.failedDroppedFruits

		if failedDroppedFruits then
			failedDroppedFruits = state.failedDroppedFruits[arg]
		end

		local failedDroppedFruits2 = failedDroppedFruits

		if failedDroppedFruits2 then
			failedDroppedFruits2 = os.clock() < failedDroppedFruits
		end

		return failedDroppedFruits2
	end

	local function appendTrace(arg, arg2)
		local environment = arg.Environment or {}
		local genv = type(getgenv) == "function"

		if genv then
			genv = getgenv()
		end

		genv = genv or nil
		local value = rawget(environment, "appendfile")
		local value2 = rawget(environment, "writefile")
		local value3 = rawget(environment, "isfile")

		if type(genv) == "table" then
			if type(value) ~= "function" then
				value = rawget(genv, "appendfile")
			end

			if type(value2) ~= "function" then
				value2 = rawget(genv, "writefile")
			end

			if type(value3) ~= "function" then
				value3 = rawget(genv, "isfile")
			end
		end

		local state = arg.State
		local str = "seahub_fruit_trace_" .. tostring(arg.LocalPlayer.UserId) .. ".jsonl"

		local function fn26(arg3, arg4, arg5)
			local str2 = nil

			if not arg3 then
				if arg5 ~= nil then
					str2 = tostring(arg5)
				end
			end

			state.lastDroppedFruitTrace = { kind = arg2.kind, success = arg3, method = arg4, error = str2, path = str, at = os.clock() }
			return arg3
		end

		if type(value) ~= "function" then
			if type(value2) ~= "function" then
				return fn26(false, "unavailable", "file writer unavailable")
			end
		end

		local str2 = nil

		local ok, result = pcall(function()
			local v = table.clone(arg2)
			v.unix = os.time()
			v.clock = os.clock()
			v.placeId = game.PlaceId
			v.jobId = game.JobId
			v.userId = arg.LocalPlayer.UserId
			v.level = arg.Level.Value
			str2 = game:GetService("HttpService"):JSONEncode(v) .. "\n"
		end)

		if ok then
			local flag = nil

			if type(value3) == "function" then
				local ok2, result2 = pcall(value3, str)

				if ok2 then
					flag = result2 == true
				end
			end

			local v = nil
			local str3, v2

			if flag == false then
				local exitTo = nil

				while type(value2) == "function" do
					str3 = "writefile"
					exitTo = 1
					break
				end

				if exitTo == 1 then
					v2 = value2
				elseif type(value) == "function" then
					str3 = "appendfile"
					v2 = value
				else
					if type(value2) ~= "function" then
						return fn26(false, "unavailable", "file writer unavailable")
					end
					str3 = "writefile"
					v2 = value2
				end
			elseif type(value) == "function" then
				str3 = "appendfile"
				v2 = value
			else
				if type(value2) ~= "function" then
					return fn26(false, "unavailable", "file writer unavailable")
				end
				str3 = "writefile"
				v2 = value2
			end

			local ok2, result2 = pcall(v2, str, str2)

			if not ok2 then
				if str3 == "appendfile" then
					if flag ~= true then
						if type(value2) == "function" then
							str3 = "writefile"
							ok2, result2 = pcall(value2, str, str2)
						end
					end
				end
			end

			if ok2 then
				return fn26(true, str3)
			end
			return fn26(false, str3, result2)
		end

		return fn26(false, "encode", result)
	end

	local function fn26(instance)
		local ok, result = pcall(function()
			ItemConfig = ItemConfig or require(game:GetService("ReplicatedStorage"):WaitForChild("ItemConfig"))
			fruitConfigIndex = fruitConfigIndex or buildFruitConfigIndex(ItemConfig.dumpItems())

			return resolveIndexedMetadata(fruitConfigIndex, {
				itemId = instance:GetAttribute("ItemId"),
				originalName = instance:GetAttribute("OriginalName"),
				storageKey = instance:GetAttribute("StorageKey") or instance:GetAttribute("FruitId"),
				name = instance.Name,
			})
		end)

		if ok then
			if type(result) == "table" then
				return result
			end
		end

		return nil
	end

	local function fn27(arg, instance)
		local physicalMoveset = arg.Inventory.PhysicalMoveset or {}
		local attribute = instance:GetAttribute("ItemId")
		local attribute2 = instance:GetAttribute("OriginalName")
		local attribute3 = instance:GetAttribute("StorageKey") or instance:GetAttribute("FruitId")
		local match = instance.Name:match("^%s*(%S+)%s+Fruit$")
		local attribute4 = attribute3

		if not attribute4 then
			attribute4 = match

			if attribute4 then
				attribute4 = match .. "-" .. match
			end
		end

		local attribute5 = attribute4
		local attribute6 = attribute5

		if attribute6 then
			attribute6 = physicalMoveset[attribute5]
		end

		if type(attribute6) == "table" then
			return {
				storageKey = attribute5,
				itemId = attribute6.ItemId or attribute,
				value = tbl6.moneyValue(attribute6),
				stored = attribute6,
			}
		end

		for k, v in pairs(physicalMoveset) do
			if type(v) ~= "table" then
				continue
			end
			local attribute7 = attribute

			if attribute7 then
				attribute7 = v.ItemId
			end

			if attribute7 then
				attribute7 = tostring(v.ItemId) == tostring(attribute)
			end

			if not attribute7 then
				attribute7 = attribute2

				if attribute7 then
					attribute7 = v.StorageKey == attribute2 or v.Name == attribute2
				end
			end

			if not attribute7 then
				attribute7 = attribute5

				if attribute7 then
					attribute7 = v.StorageKey == attribute5 or v.Name == attribute5
				end
			end

			if attribute7 then
				return {
					storageKey = v.StorageKey or v.Name or k,
					itemId = v.ItemId or attribute,
					value = tbl6.moneyValue(v),
					stored = v,
				}
			end

			continue
		end

		local v = fn26(instance)

		if v then
			v.storageKey = v.storageKey or attribute5
			v.itemId = v.itemId or attribute
			local storageKey = v.storageKey

			if storageKey then
				storageKey = physicalMoveset[v.storageKey]
			end

			if type(storageKey) ~= "table" then
				if v.itemId then
					for _, v2 in pairs(physicalMoveset) do
						if type(v2) ~= "table" then
							continue
						end

						if v2.ItemId then
							if tostring(v2.ItemId) == tostring(v.itemId) then
								storageKey = v2
								break
							end
						end
					end
				end
			end

			v.stored = storageKey
			return v
		end

		return { storageKey = attribute5, itemId = attribute, value = nil }
	end

	local function fn28(arg)
		local n20 = tonumber(arg.LocalPlayer:GetAttribute("ExpBoostTick")) or 0
		local num = tonumber(arg.LocalPlayer:GetAttribute("ExpBoost"))

		if num then
			if num > 0 then
				if n20 > 0 then
					return math.max(0, num - math.max(0, tick() - n20))
				end
			end
		end

		return math.max(tonumber(arg.State.expBoostRemaining) or 0, n20 - tick(), 0)
	end

	local function fn29(arg)
		for _, v in tbl6.BlockingItems do
			if arg.Functions.Carries(v) then
				return true, v
			end
		end

		return false
	end

	local function fn30(arg, arg2, arg3)
		local stored = arg3.stored

		if type(stored) == "table" then
			if (tonumber(stored.Count) or 0) > 0 then
				return true
			end
		end

		for _, instance in { arg.LocalPlayer.Character, arg.LocalPlayer:FindFirstChildOfClass("Backpack") } do
			local instance3 = instance

			if instance3 then
				instance3 = instance:GetChildren()
			end

			instance3 = instance3 or {}

			for _, instance2 in instance3 do
				if not instance2:IsA("Tool") then
					continue
				end

				if instance2 == arg2 then
					continue
				end
				local v = fn27(arg, instance2)

				if arg3.storageKey then
					if v.storageKey == arg3.storageKey then
						return true
					end
				end

				if not arg3.itemId then
					continue
				end

				if v.itemId then
					if tostring(v.itemId) == tostring(arg3.itemId) then
						return true
					end
					continue
				end
			end
		end

		return false
	end

	local function fn31(arg, arg2)
		local v = fn27(arg, arg2)
		local v2, v3 = fn29(arg)

		local v4, v5 = tbl6.shouldCollect({
			level = arg.Level.Value,
			blocked = v2,
			hasIdentity = v.storageKey ~= nil or v.itemId ~= nil,
			duplicate = fn30(arg, arg2, v),
			expBoostRemaining = fn28(arg),
			value = v.value,
		})

		local v6 = v3 or v5

		arg.State.lastFruitEligibility = {
			name = arg2.Name,
			storageKey = v.storageKey,
			itemId = v.itemId,
			value = v.value,
			eligible = v4,
			reason = v6,
			at = os.clock(),
		}

		local state = arg.State
		state.seenDroppedFruits = state.seenDroppedFruits or setmetatable({}, { __mode = "k" })

		if not state.seenDroppedFruits[arg2] then
			state.seenDroppedFruits[arg2] = true
			state.droppedFruitSightings = state.droppedFruitSightings or {}

			local tbl63 = {
				kind = "sighting",
				name = arg2.Name,
				storageKey = v.storageKey,
				itemId = v.itemId,
				value = v.value,
				eligible = v4,
				reason = v6,
				at = os.clock(),
			}

			table.insert(state.droppedFruitSightings, tbl63)
			appendTrace(arg, tbl63)

			while #state.droppedFruitSightings > 20 do
				table.remove(state.droppedFruitSightings, 1)
			end
		end

		return v4
	end

	tbl62 = {
		findNearest = function(arg)
			local state = arg.State
			local now = os.clock()
			state.lastDroppedFruitScanAt = now
			state.droppedFruitScanCount = (state.droppedFruitScanCount or 0) + 1

			if (state.nextDroppedFruitTraceHeartbeatAt or 0) <= now then
				state.nextDroppedFruitTraceHeartbeatAt = now + 900

				appendTrace(arg, {
					kind = "scan-heartbeat",
					scans = state.droppedFruitScanCount,
					task = arg.TaskQueue:top(),
					status = state.status,
				})
			end

			if arg.Level.Value < tbl6.MinimumLevel then
				return nil
			end

			if type(arg.Functions.RefreshInventory) == "function" then
				local ok, result = pcall(arg.Functions.RefreshInventory, false)

				if ok then
					state.lastDroppedFruitInventoryError = nil
				else
					state.lastDroppedFruitInventoryError = tostring(result)
				end
			end

			if fn29(arg) then
				return nil
			end
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChild("HumanoidRootPart")
			end

			if not character2 then
				return nil
			end
			local v = nil
			local handle2 = nil
			local magnitude2 = nil

			for _, v2 in workspace:GetChildren() do
				if not getIsTool(v2) then
					continue
				end

				if game:GetService("Players"):FindFirstChild(v2.Name) then
					continue
				end

				if getFailedDroppedFruits(arg.State, v2) then
					continue
				end

				if not fn31(arg, v2) then
					continue
				end
				local handle = getHandle(v2)
				if not handle then
					continue
				end
				local magnitude = (handle.Position - character2.Position).Magnitude

				if magnitude2 then
					if not (magnitude < magnitude2) then
						continue
					end
				end

				v = v2
				handle2 = handle
				magnitude2 = magnitude
			end

			return v, handle2, magnitude2
		end,
		hasTarget = function(arg)
			local state = arg.State
			local droppedFruitTarget = state.droppedFruitTarget

			if droppedFruitTarget then
				if droppedFruitTarget.Parent == workspace then
					if getIsTool(droppedFruitTarget) then
						if not getFailedDroppedFruits(state, droppedFruitTarget) then
							if fn31(arg, droppedFruitTarget) then
								return true
							end
						end
					end
				end

				local character = arg.LocalPlayer.Character
				local backpack = arg.LocalPlayer:FindFirstChildOfClass("Backpack")
				if droppedFruitTarget.Parent == character then
					return true
				end

				if droppedFruitTarget.Parent == backpack then
					return true
				end
				local lastCursedShipTransition = state.lastCursedShipTransition
				local lastCursedShipTransition2 = state.cursedShipTransitionActive == true

				if not lastCursedShipTransition2 then
					lastCursedShipTransition2 = lastCursedShipTransition

					if lastCursedShipTransition2 then
						lastCursedShipTransition2 = lastCursedShipTransition.owner == taskName
					end

					if lastCursedShipTransition2 then
						lastCursedShipTransition2 = lastCursedShipTransition.completedAt
					end

					if lastCursedShipTransition2 then
						lastCursedShipTransition2 = os.clock() - lastCursedShipTransition.completedAt <= n19
					end
				end

				local droppedFruitMissingSince = state.droppedFruitMissingSince

				if droppedFruitMissingSince then
					droppedFruitMissingSince = os.clock() - state.droppedFruitMissingSince <= n19
				end

				if not lastCursedShipTransition2 then
					if not droppedFruitMissingSince then
						return tbl62.findNearest(arg) ~= nil
					end
				end

				return true
			end

			return tbl62.findNearest(arg) ~= nil
		end,
	}

	local function fn32(arg, arg2, arg3)
		local state = arg.State
		local flag = arg.TaskQueue:top() == taskName
		arg.TaskQueue:pop(taskName)

		if flag then
			arg.Functions.StopTween({ preserveAltitude = true })
		end

		state.droppedFruitStartedAt = nil
		state.droppedFruitNearAt = nil
		state.droppedFruitLastSeenAt = nil
		state.droppedFruitMissingSince = nil
		state.nextDroppedFruitTouchAt = nil
		state.droppedFruitTarget = nil
		local lastDroppedFruitResult = { reason = arg2 }
		local name = arg3

		if name then
			name = arg3.Name
		end

		lastDroppedFruitResult.name = name or nil
		lastDroppedFruitResult.at = os.clock()
		state.lastDroppedFruitResult = lastDroppedFruitResult
		local appendTrace2 = appendTrace
		local v = arg
		local tbl63 = { kind = "result", reason = arg2 }
		local name2 = arg3

		if name2 then
			name2 = arg3.Name
		end

		tbl63.name = name2 or nil
		appendTrace2(v, tbl63)
	end

	tbl62.run = function(arg)
		if arg.TaskQueue:top() ~= taskName then
			return false
		end
		local state = arg.State
		local droppedFruitTarget = state.droppedFruitTarget

		if droppedFruitTarget then
			if droppedFruitTarget.Parent ~= workspace then
				local backpack = arg.LocalPlayer:FindFirstChildOfClass("Backpack")
				local flag = droppedFruitTarget.Parent == arg.LocalPlayer.Character or droppedFruitTarget.Parent == backpack
				local v, v2, str

				if flag then
					if arg.Functions.StoreFruit(droppedFruitTarget) then
						arg.Functions.RefreshInventory(true)
						v = fn32
						v2 = arg
						str = flag

						if str then
							str = "collected"
						end

						str = str or "target-gone"
						v(v2, str, droppedFruitTarget)
						return flag
					end

					v = fn32
					v2 = arg
					str = flag

					if str then
						str = "collected"
					end

					str = str or "target-gone"
					v(v2, str, droppedFruitTarget)
					return flag
				end

				local now = os.clock()
				state.droppedFruitMissingSince = state.droppedFruitMissingSince or now
				local lastCursedShipTransition = state.lastCursedShipTransition
				local lastCursedShipTransition2 = state.cursedShipTransitionActive == true

				if not lastCursedShipTransition2 then
					lastCursedShipTransition2 = lastCursedShipTransition

					if lastCursedShipTransition2 then
						lastCursedShipTransition2 = lastCursedShipTransition.owner == taskName
					end

					if lastCursedShipTransition2 then
						lastCursedShipTransition2 = lastCursedShipTransition.completedAt
					end

					if lastCursedShipTransition2 then
						lastCursedShipTransition2 = now - lastCursedShipTransition.completedAt <= n19
					end
				end

				if not lastCursedShipTransition2 then
					if not (now - state.droppedFruitMissingSince <= n19) then
						v = fn32
						v2 = arg
						str = flag

						if str then
							str = "collected"
						end

						v(v2, str or "target-gone", droppedFruitTarget)
						return flag
					end
				end

				state.status = taskName .. " | Waiting target after ship portal"
				return true
			end
		end

		local handle, magnitude, now, character, character3, proximityPrompt, character4, n20

		if droppedFruitTarget then
			if getIsTool(droppedFruitTarget) then
				if not getFailedDroppedFruits(state, droppedFruitTarget) then
					if fn31(arg, droppedFruitTarget) then
						handle = getHandle(droppedFruitTarget)
						local character2 = arg.LocalPlayer.Character
						local character5 = character2

						if character5 then
							character5 = character2:FindFirstChild("HumanoidRootPart")
						end

						if handle then
							if character5 then
								magnitude = (handle.Position - character5.Position).Magnitude

								if droppedFruitTarget then
									state.droppedFruitTarget = droppedFruitTarget
									state.droppedFruitStartedAt = state.droppedFruitStartedAt or os.clock()
									state.droppedFruitLastSeenAt = os.clock()
									state.droppedFruitMissingSince = nil
									state.status = taskName .. " | " .. droppedFruitTarget.Name
									if n18 < magnitude then
										arg.Functions.TP(handle.CFrame, taskName, false, nil, droppedFruitTarget)
										return true
									end

									if type(arg.Functions.CancelTween) == "function" then
										arg.Functions.CancelTween()
									else
										arg.Functions.StopTween()
									end

									now = os.clock()
									state.droppedFruitNearAt = state.droppedFruitNearAt or now
									character = arg.LocalPlayer.Character
									character3 = character

									if character3 then
										character3 = character:FindFirstChildOfClass("Humanoid")
									end

									if character3 then
										character3.Jump = true
										pcall(character3.ChangeState, character3, Enum.HumanoidStateType.Jumping)
									end

									if (state.nextDroppedFruitTouchAt or 0) <= now then
										state.nextDroppedFruitTouchAt = now + 0.15
										proximityPrompt = droppedFruitTarget:FindFirstChildWhichIsA("ProximityPrompt", true)

										if proximityPrompt then
											if type(fireproximityprompt) == "function" then
												pcall(fireproximityprompt, proximityPrompt)
											elseif type(firetouchinterest) == "function" then
												character4 = character

												if character4 then
													character4 = character:FindFirstChild("HumanoidRootPart")
												end

												if character4 then
													pcall(firetouchinterest, character4, handle, 0)
													pcall(firetouchinterest, character4, handle, 1)
												end
											end
										elseif type(firetouchinterest) == "function" then
											character4 = character

											if character4 then
												character4 = character:FindFirstChild("HumanoidRootPart")
											end

											if character4 then
												pcall(firetouchinterest, character4, handle, 0)
												pcall(firetouchinterest, character4, handle, 1)
											end
										end
									end

									if droppedFruitTarget.Parent ~= workspace then
										if droppedFruitTarget.Parent ~= arg.LocalPlayer.Character then
											if droppedFruitTarget.Parent == arg.LocalPlayer:FindFirstChildOfClass("Backpack") then
												if arg.Functions.StoreFruit(droppedFruitTarget) then
													arg.Functions.RefreshInventory(true)
												end
											end
										elseif arg.Functions.StoreFruit(droppedFruitTarget) then
											arg.Functions.RefreshInventory(true)
										end

										fn32(arg, "collected", droppedFruitTarget)
									elseif timeoutSeconds <= now - state.droppedFruitNearAt then
										state.failedDroppedFruits = state.failedDroppedFruits or setmetatable({}, { __mode = "k" })
										state.failedDroppedFruits[droppedFruitTarget] = now + 60
										pcall(droppedFruitTarget.Destroy, droppedFruitTarget)
										fn32(arg, "pickup-timeout", droppedFruitTarget)
										return false
									end

									n20 = 275016746
									return true
								end

								fn32(arg, "no-target")
								return false
							end
						end

						fn32(arg, "target-invalid", droppedFruitTarget)
						return false
					end
				end
			end

			fn32(arg, "target-ineligible", droppedFruitTarget)
			return false
		end

		droppedFruitTarget, handle, magnitude = tbl62.findNearest(arg)

		if droppedFruitTarget then
			state.droppedFruitTarget = droppedFruitTarget
			state.droppedFruitStartedAt = state.droppedFruitStartedAt or os.clock()
			state.droppedFruitLastSeenAt = os.clock()
			state.droppedFruitMissingSince = nil
			state.status = taskName .. " | " .. droppedFruitTarget.Name
			if n18 < magnitude then
				arg.Functions.TP(handle.CFrame, taskName, false, nil, droppedFruitTarget)
				return true
			end

			if type(arg.Functions.CancelTween) == "function" then
				arg.Functions.CancelTween()
			else
				arg.Functions.StopTween()
			end

			now = os.clock()
			state.droppedFruitNearAt = state.droppedFruitNearAt or now
			character = arg.LocalPlayer.Character
			character3 = character

			if character3 then
				character3 = character:FindFirstChildOfClass("Humanoid")
			end

			if character3 then
				character3.Jump = true
				pcall(character3.ChangeState, character3, Enum.HumanoidStateType.Jumping)
			end

			if (state.nextDroppedFruitTouchAt or 0) <= now then
				state.nextDroppedFruitTouchAt = now + 0.15
				proximityPrompt = droppedFruitTarget:FindFirstChildWhichIsA("ProximityPrompt", true)

				if proximityPrompt then
					if type(fireproximityprompt) == "function" then
						pcall(fireproximityprompt, proximityPrompt)
					elseif type(firetouchinterest) == "function" then
						character4 = character

						if character4 then
							character4 = character:FindFirstChild("HumanoidRootPart")
						end

						if character4 then
							pcall(firetouchinterest, character4, handle, 0)
							pcall(firetouchinterest, character4, handle, 1)
						end
					end
				elseif type(firetouchinterest) == "function" then
					character4 = character

					if character4 then
						character4 = character:FindFirstChild("HumanoidRootPart")
					end

					if character4 then
						pcall(firetouchinterest, character4, handle, 0)
						pcall(firetouchinterest, character4, handle, 1)
					end
				end
			end

			if droppedFruitTarget.Parent ~= workspace then
				if droppedFruitTarget.Parent ~= arg.LocalPlayer.Character then
					if droppedFruitTarget.Parent == arg.LocalPlayer:FindFirstChildOfClass("Backpack") then
						if arg.Functions.StoreFruit(droppedFruitTarget) then
							arg.Functions.RefreshInventory(true)
						end
					end
				elseif arg.Functions.StoreFruit(droppedFruitTarget) then
					arg.Functions.RefreshInventory(true)
				end

				fn32(arg, "collected", droppedFruitTarget)
			elseif timeoutSeconds <= now - state.droppedFruitNearAt then
				state.failedDroppedFruits = state.failedDroppedFruits or setmetatable({}, { __mode = "k" })
				state.failedDroppedFruits[droppedFruitTarget] = now + 60
				pcall(droppedFruitTarget.Destroy, droppedFruitTarget)
				fn32(arg, "pickup-timeout", droppedFruitTarget)
				return false
			end

			n20 = 275016746
			return true
		end

		fn32(arg, "no-target")
		return false
	end

	tbl62.TASK_NAME = taskName
	tbl62.TIMEOUT_SECONDS = timeoutSeconds
	tbl62.MINIMUM_LEVEL = tbl6.MinimumLevel
	tbl62.BOOST_VALUE_THRESHOLD = tbl6.BoostValueThreshold
	tbl62.buildFruitConfigIndex = buildFruitConfigIndex
	tbl62.resolveIndexedMetadata = resolveIndexedMetadata
	tbl62.appendTrace = appendTrace
end

local tbl63

do
	local delay = 5
	local n5 = 10
	local n6 = 8
	local vector = Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)

	local tbl64 = {
		[4442272183] = { { slug = "darkbeard", names = { darkbeard = true } } },
		[7449423635] = {
			{ slug = "rip_indra", names = { ["rip_indra true form"] = true } },
			{ slug = "soul_reaper", names = { ["soul reaper"] = true } },
			{ slug = "cake_queen", names = { ["cake queen"] = true } },
			{ slug = "pirate_raid", event = true },
		},
	}

	local tbl65 = { ["rip_indra true form"] = true, rip_indra = true }

	local function fn(name)
		if type(name) ~= "string" then
			return ""
		end
		return (name:gsub("%s*%[.*$", ""):match("^%s*(.-)%s*$") or ""):lower()
	end

	local function fn2(endpoint, allowHttpLocal)
		if type(endpoint) ~= "string" then
			return false
		end

		if #endpoint == 0 then
			return false
		end

		if not (#endpoint > 512) then
			if not endpoint:find("[?#@%s]") then
				if endpoint:match("^https://[%w][%w%.%-]*[:%d]*/?[%w%._/%-]*$") then
					return true
				end
				local flag = allowHttpLocal == true

				if flag then
					flag = endpoint:match("^http://localhost:%d+/?[%w%._/%-]*$") ~= nil or endpoint:match("^http://127%.0%.0%.1:%d+/?[%w%._/%-]*$") ~= nil
				end

				return flag
			end
		end

		return false
	end

	local function getRequest(environment)
		local request_ = environment.request or environment.http_request

		if not request_ then
			request_ = environment.syn

			if request_ then
				request_ = environment.syn.request
			end
		end

		return request_ or request or http_request
	end

	local function fn3(instance)
		local instance2 = instance

		if instance2 then
			instance2 = instance:FindFirstChildOfClass("Humanoid")
		end

		local instance3 = instance

		if instance3 then
			instance3 = instance:FindFirstChild("HumanoidRootPart")
		end

		if not instance2 then
			return nil
		end

		if instance3 then
			local tbl66 = { model = instance, humanoid = instance2 }
			local state = instance2.Health > 0

			if state then
				state = "alive"
			end

			tbl66.state = state or "dead"
			tbl66.health = math.max(0, instance2.Health)
			tbl66.maxHealth = math.max(1, instance2.MaxHealth)
			return tbl66
		end

		return nil
	end

	local function fn4(instance, arg, bossApiObservation)
		local enemies = instance:FindFirstChild("Enemies")
		local enemies2 = enemies

		if enemies2 then
			enemies2 = enemies:GetChildren()
		end

		enemies2 = enemies2 or {}

		for _, v in enemies2 do
			if not arg.names[fn(v.Name)] then
				continue
			end
			local v2 = fn3(v)
			if v2 then
				return v2
			end
			continue
		end

		if bossApiObservation then
			if bossApiObservation.humanoid then
				local ok, result = pcall(function()
					return bossApiObservation.humanoid.Health
				end)

				if ok then
					if result <= 0 then
						return { state = "dead", health = 0, maxHealth = bossApiObservation.maxHealth }
					end
				end
			end
		end

		return { state = "unknown" }
	end

	local function fn5(instance)
		local enemies = instance:FindFirstChild("Enemies")
		local enemies2 = enemies

		if enemies2 then
			enemies2 = enemies:GetChildren()
		end

		enemies2 = enemies2 or {}

		for _, instance2 in enemies2 do
			local v = fn3(instance2)
			local humanoidRootPart = v

			if humanoidRootPart then
				humanoidRootPart = instance2:FindFirstChild("HumanoidRootPart")
			end

			if not v then
				continue
			end

			if v.state ~= "alive" then
				continue
			end

			if humanoidRootPart then
				if tbl65[fn(instance2.Name)] then
					continue
				end

				if (humanoidRootPart.Position - vector).Magnitude < 500 then
					return { state = "alive" }
				end
			end
		end

		return { state = "unknown" }
	end

	local function fn6(bossApiReporterThread)
		if type(bossApiReporterThread) == "thread" then
			if type(task.cancel) == "function" then
				pcall(task.cancel, bossApiReporterThread)
			end
		end
	end

	tbl63 = {
		start = function(arg)
			local state = arg.State
			if state.bossApiReporterRunning then
				return true
			end
			local environment = arg.Environment

			if not environment then
				environment = getgenv

				if environment then
					environment = getgenv()
				end

				environment = environment or _G
			end

			local seahubBossApi = environment.__SEAHUB_BOSS_API
			local v = tbl64[game.PlaceId]
			local request_ = getRequest(environment)

			if type(seahubBossApi) == "table" then
				if seahubBossApi.Enabled ~= false then
					if v then
						if fn2(seahubBossApi.Endpoint, seahubBossApi.AllowHttpLocal) then
							local n7, str, token, expiresAt, HttpService, bossApiReporterGeneration, getBossApiReporterRunning, n8, fn7

							if seahubBossApi.Token ~= nil then
								if type(seahubBossApi.Token) == "string" then
									if not (#seahubBossApi.Token > 4096) then
										if type(request_) == "function" then
											n7 = 443600349
											str = seahubBossApi.Endpoint:gsub("/+$", "")
											token = seahubBossApi.Token or ""
											expiresAt = token ~= ""

											if expiresAt then
												expiresAt = math.huge
											end

											expiresAt = expiresAt or 0
											HttpService = game:GetService("HttpService")
											bossApiReporterGeneration = (tonumber(state.bossApiReporterGeneration) or 0) + 1
											state.bossApiReporterGeneration = bossApiReporterGeneration
											state.bossApiReporterRunning = true
											state.bossApiReporterStatus = "starting"
											state.bossApiObservations = state.bossApiObservations or {}
											state.bossApiSequence = math.max(tonumber(state.bossApiSequence) or 0, DateTime.now().UnixTimestampMillis)

											getBossApiReporterRunning = function()
												local bossApiReporterRunning = state.bossApiReporterRunning

												if bossApiReporterRunning then
													bossApiReporterRunning = state.bossApiReporterGeneration == bossApiReporterGeneration
												end

												if bossApiReporterRunning then
													bossApiReporterRunning = not state.stopped
												end

												return bossApiReporterRunning
											end

											n8 = nil

											fn7 = function()
												n8 = 962839834
												state.bossApiClientNonce = state.bossApiClientNonce or HttpService:GenerateGUID(false):gsub("[^%w_-]", "")

												local ok, result = pcall(request_, {
													Url = str .. "/v1/finder/session",
													Method = "POST",
													Headers = { ["Content-Type"] = "application/json" },
													Body = HttpService:JSONEncode({ clientNonce = state.bossApiClientNonce }),
													Timeout = n6,
												})

												if ok then
													ok = type(result) == "table"
												end

												if ok then
													ok = tonumber(result.StatusCode or result.status_code)
												end

												ok = ok or nil

												if ok then
													if not (ok < 200) then
														if not (ok >= 300) then
															local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result.Body or result.body or "")

															if ok2 then
																if type(result2) == "table" then
																	if type(result2.token) == "string" then
																		if #result2.token ~= 0 then
																			if not (#result2.token > 1024) then
																				if type(result2.expiresAt) == "number" then
																					token = result2.token
																					expiresAt = result2.expiresAt
																					state.bossApiReporterStatus = "session-ready"
																					return true
																				end
																			end
																		end
																	end
																end
															end

															state.bossApiReporterStatus = "invalid-session"
															return false
														end
													end
												end

												local bossApiReporterStatus = ok == 429

												if bossApiReporterStatus then
													bossApiReporterStatus = "rate-limited"
												end

												state.bossApiReporterStatus = bossApiReporterStatus or "session-unavailable"
												state.lastBossApiError = tostring(ok or result):sub(1, 160)
												return false
											end

											state.bossApiReporterThread = task.spawn(function()
												while getBossApiReporterRunning() do
													if token ~= "" then
														if expiresAt <= DateTime.now().UnixTimestampMillis + 30000 then
															if not fn7() then
																task.wait(10)
																continue
															end
														end
													elseif not fn7() then
														task.wait(10)
														continue
													end

													local now = os.clock()
													local n9 = nil
													local maxPlayers = nil

													pcall(function()
														local Players = game:GetService("Players")
														n9 = #Players:GetPlayers()
														maxPlayers = Players.MaxPlayers
													end)

													for _, v2 in v do
														if not getBossApiReporterRunning() then
															return
														end
														local bossApiObservation = state.bossApiObservations[v2.slug]
														local event = v2.event

														if event then
															event = fn5(workspace)
														end

														event = event or fn4(workspace, v2, bossApiObservation)
														local flag = not bossApiObservation or bossApiObservation.state ~= event.state

														if not flag then
															flag = event.state == "alive"

															if flag then
																flag = now >= (bossApiObservation.nextRefreshAt or 0)
															end
														end

														local deadline = event.state == "alive"

														if deadline then
															deadline = flag

															if deadline then
																deadline = now + n5
															end

															deadline = deadline or bossApiObservation.nextRefreshAt
														end

														event.nextRefreshAt = deadline or math.huge
														state.bossApiObservations[v2.slug] = event

														if flag then
															state.bossApiSequence = math.max(state.bossApiSequence + 1, DateTime.now().UnixTimestampMillis)

															local ok, result = pcall(request_, {
																Url = str .. "/v1/finder/reports",
																Method = "POST",
																Headers = { ["Content-Type"] = "application/json", Authorization = "Bearer " .. token },
																Body = HttpService:JSONEncode({
																	boss = v2.slug,
																	placeId = game.PlaceId,
																	jobId = game.JobId,
																	state = event.state,
																	sequence = state.bossApiSequence,
																	health = event.health,
																	maxHealth = event.maxHealth,
																	players = n9,
																	capacity = maxPlayers,
																}),
																Timeout = n6,
															})

															if ok then
																ok = type(result) == "table"
															end

															if ok then
																ok = tonumber(result.StatusCode or result.status_code)
															end

															ok = ok or nil

															if ok then
																if ok >= 200 then
																	if ok < 300 then
																		state.bossApiReporterStatus = "reporting"
																		state.lastBossApiReport = { boss = v2.slug, state = event.state, at = now }
																		continue
																	end
																end
															end

															local bossApiReporterStatus = ok == 401 or ok == 403

															if bossApiReporterStatus then
																bossApiReporterStatus = "session-expired"
															end

															if not bossApiReporterStatus then
																bossApiReporterStatus = ok == 429

																if bossApiReporterStatus then
																	bossApiReporterStatus = "rate-limited"
																end
															end

															state.bossApiReporterStatus = bossApiReporterStatus or "service-unavailable"

															if ok ~= 401 then
																if ok == 403 then
																	token = ""
																	expiresAt = 0
																end
															else
																token = ""
																expiresAt = 0
															end

															state.lastBossApiError = tostring(ok or result):sub(1, 160)
															local wait = task.wait
															local flag2 = ok == 429

															if flag2 then
																flag2 = 10
															end

															wait(flag2 or 2)
															continue
														end
													end

													task.wait(delay)
												end
											end)

											return true
										end
									end
								end
							elseif type(request_) == "function" then
								n7 = 443600349
								str = seahubBossApi.Endpoint:gsub("/+$", "")
								token = seahubBossApi.Token or ""
								expiresAt = token ~= ""

								if expiresAt then
									expiresAt = math.huge
								end

								expiresAt = expiresAt or 0
								HttpService = game:GetService("HttpService")
								bossApiReporterGeneration = (tonumber(state.bossApiReporterGeneration) or 0) + 1
								state.bossApiReporterGeneration = bossApiReporterGeneration
								state.bossApiReporterRunning = true
								state.bossApiReporterStatus = "starting"
								state.bossApiObservations = state.bossApiObservations or {}
								state.bossApiSequence = math.max(tonumber(state.bossApiSequence) or 0, DateTime.now().UnixTimestampMillis)

								getBossApiReporterRunning = function()
									local bossApiReporterRunning = state.bossApiReporterRunning

									if bossApiReporterRunning then
										bossApiReporterRunning = state.bossApiReporterGeneration == bossApiReporterGeneration
									end

									if bossApiReporterRunning then
										bossApiReporterRunning = not state.stopped
									end

									return bossApiReporterRunning
								end

								n8 = nil

								fn7 = function()
									n8 = 962839834
									state.bossApiClientNonce = state.bossApiClientNonce or HttpService:GenerateGUID(false):gsub("[^%w_-]", "")

									local ok, result = pcall(request_, {
										Url = str .. "/v1/finder/session",
										Method = "POST",
										Headers = { ["Content-Type"] = "application/json" },
										Body = HttpService:JSONEncode({ clientNonce = state.bossApiClientNonce }),
										Timeout = n6,
									})

									if ok then
										ok = type(result) == "table"
									end

									if ok then
										ok = tonumber(result.StatusCode or result.status_code)
									end

									ok = ok or nil

									if ok then
										if not (ok < 200) then
											if not (ok >= 300) then
												local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result.Body or result.body or "")

												if ok2 then
													if type(result2) == "table" then
														if type(result2.token) == "string" then
															if #result2.token ~= 0 then
																if not (#result2.token > 1024) then
																	if type(result2.expiresAt) == "number" then
																		token = result2.token
																		expiresAt = result2.expiresAt
																		state.bossApiReporterStatus = "session-ready"
																		return true
																	end
																end
															end
														end
													end
												end

												state.bossApiReporterStatus = "invalid-session"
												return false
											end
										end
									end

									local bossApiReporterStatus = ok == 429

									if bossApiReporterStatus then
										bossApiReporterStatus = "rate-limited"
									end

									state.bossApiReporterStatus = bossApiReporterStatus or "session-unavailable"
									state.lastBossApiError = tostring(ok or result):sub(1, 160)
									return false
								end

								state.bossApiReporterThread = task.spawn(function()
									while getBossApiReporterRunning() do
										if token ~= "" then
											if expiresAt <= DateTime.now().UnixTimestampMillis + 30000 then
												if not fn7() then
													task.wait(10)
													continue
												end
											end
										elseif not fn7() then
											task.wait(10)
											continue
										end

										local now = os.clock()
										local n9 = nil
										local maxPlayers = nil

										pcall(function()
											local Players = game:GetService("Players")
											n9 = #Players:GetPlayers()
											maxPlayers = Players.MaxPlayers
										end)

										for _, v2 in v do
											if not getBossApiReporterRunning() then
												return
											end
											local bossApiObservation = state.bossApiObservations[v2.slug]
											local event = v2.event

											if event then
												event = fn5(workspace)
											end

											event = event or fn4(workspace, v2, bossApiObservation)
											local flag = not bossApiObservation or bossApiObservation.state ~= event.state

											if not flag then
												flag = event.state == "alive"

												if flag then
													flag = now >= (bossApiObservation.nextRefreshAt or 0)
												end
											end

											local deadline = event.state == "alive"

											if deadline then
												deadline = flag

												if deadline then
													deadline = now + n5
												end

												deadline = deadline or bossApiObservation.nextRefreshAt
											end

											event.nextRefreshAt = deadline or math.huge
											state.bossApiObservations[v2.slug] = event

											if flag then
												state.bossApiSequence = math.max(state.bossApiSequence + 1, DateTime.now().UnixTimestampMillis)

												local ok, result = pcall(request_, {
													Url = str .. "/v1/finder/reports",
													Method = "POST",
													Headers = { ["Content-Type"] = "application/json", Authorization = "Bearer " .. token },
													Body = HttpService:JSONEncode({
														boss = v2.slug,
														placeId = game.PlaceId,
														jobId = game.JobId,
														state = event.state,
														sequence = state.bossApiSequence,
														health = event.health,
														maxHealth = event.maxHealth,
														players = n9,
														capacity = maxPlayers,
													}),
													Timeout = n6,
												})

												if ok then
													ok = type(result) == "table"
												end

												if ok then
													ok = tonumber(result.StatusCode or result.status_code)
												end

												ok = ok or nil

												if ok then
													if ok >= 200 then
														if ok < 300 then
															state.bossApiReporterStatus = "reporting"
															state.lastBossApiReport = { boss = v2.slug, state = event.state, at = now }
															continue
														end
													end
												end

												local bossApiReporterStatus = ok == 401 or ok == 403

												if bossApiReporterStatus then
													bossApiReporterStatus = "session-expired"
												end

												if not bossApiReporterStatus then
													bossApiReporterStatus = ok == 429

													if bossApiReporterStatus then
														bossApiReporterStatus = "rate-limited"
													end
												end

												state.bossApiReporterStatus = bossApiReporterStatus or "service-unavailable"

												if ok ~= 401 then
													if ok == 403 then
														token = ""
														expiresAt = 0
													end
												else
													token = ""
													expiresAt = 0
												end

												state.lastBossApiError = tostring(ok or result):sub(1, 160)
												local wait = task.wait
												local flag2 = ok == 429

												if flag2 then
													flag2 = 10
												end

												wait(flag2 or 2)
												continue
											end
										end

										task.wait(delay)
									end
								end)

								return true
							end
						end

						state.bossApiReporterStatus = "invalid-config"
						return false
					end
				end
			end

			local bossApiReporterStatus = v

			if bossApiReporterStatus then
				bossApiReporterStatus = "not-configured"
			end

			state.bossApiReporterStatus = bossApiReporterStatus or "unsupported-place"
			return false
		end,
		stop = function(arg)
			local state = arg.State
			state.bossApiReporterRunning = false
			state.bossApiReporterGeneration = (tonumber(state.bossApiReporterGeneration) or 0) + 1
			fn6(state.bossApiReporterThread)
			state.bossApiReporterThread = nil
			state.bossApiReporterStatus = "stopped"
			return true
		end,
	}
end

local tbl64

do
	local tbl65 = {
		[2753915549] = 1,
		[4442272183] = 2,
		[7449423635] = 3,
		[85211729168715] = 1,
		[79091703265657] = 2,
		[100117331123089] = 3,
	}

	local function fn()
		local v = tbl65[game.PlaceId]
		if v then
			return v
		end
		local map = workspace:FindFirstChild("Map")
		if not map then
			return nil
		end

		if map:FindFirstChild("Dressrosa") then
			if map:FindFirstChild("GreenBit") then
				return 2
			end
		end

		if not map:FindFirstChild("HauntedCastle") then
			if not map:FindFirstChild("TikiOutpost") then
				if not map:FindFirstChild("GreatTree") then
					return 1
				end
			end
		end

		return 3
	end

	local function fn2(environment)
		environment.Configs = environment.Configs or {}
		environment.Configs.Configuration = environment.Configs.Configuration or {}
		local configuration = environment.Configs.Configuration

		if configuration.HopNear == nil then
			configuration.HopNear = true
		end

		if configuration.HopWhenIdle == nil then
			configuration.HopWhenIdle = true
		end
	end

	local function getFps(environment)
		environment.Configs = environment.Configs or {}
		local fps = math.clamp(math.floor(tonumber(environment.Configs.FPS) or 15), 5, 60)
		environment.Configs.FPS = fps
		local value = rawget(environment, "setfpscap")

		if type(value) == "function" then
			pcall(value, fps)
		end

		return fps
	end

	local function fn3(remote, arg)
		if remote then
			return setmetatable({}, { __index = function(arg2, arg3)
				if arg3 == "BindState" then
					return function(arg4, arg5)
						assert(type(arg5) == "table", "world travel state is required")
						return fn3(remote, arg5)
					end
				end

				if arg3 == "InvokeServer" then
					return function(arg4, blockedStaleWorldTravel, ...)
						local n5, v
						if fn() ~= 3 then
							n5 = 723542415
							return remote:InvokeServer(blockedStaleWorldTravel, ...)
						end
						local flag, num, flag2

						if blockedStaleWorldTravel ~= "TravelMain" then
							local remote2, invokeServer, blockedStaleWorldTravel2

							if blockedStaleWorldTravel ~= "TravelDressrosa" then
								n5 = 723542415
								remote2 = remote
								invokeServer = remote.InvokeServer
								blockedStaleWorldTravel2 = blockedStaleWorldTravel
								return invokeServer(remote2, blockedStaleWorldTravel2, ...)
							end

							flag = blockedStaleWorldTravel == "TravelMain"

							if flag then
								flag = 1
							end

							flag = flag or 2
							num = tonumber(arg.worldTravelIssuedAt)
							flag2 = arg.worldTravelDestination == flag

							if flag2 then
								flag2 = num ~= nil
							end

							if flag2 then
								flag2 = os.clock() - num <= 8
							end

							if not flag2 then
								arg.blockedWorldDowngrades = (arg.blockedWorldDowngrades or 0) + 1
								arg.lastBlockedWorldAction = blockedStaleWorldTravel
								arg.status = "Blocked stale world travel: " .. blockedStaleWorldTravel
								warn("[SEAHUB_WORLD_GUARD] blocked " .. blockedStaleWorldTravel .. " from Third Sea")
								return nil
							end

							n5 = 723542415
							remote2 = remote
							invokeServer = remote.InvokeServer
							blockedStaleWorldTravel2 = blockedStaleWorldTravel
							return invokeServer(remote2, blockedStaleWorldTravel2, ...)
						else
							flag = blockedStaleWorldTravel == "TravelMain"

							if flag then
								flag = 1
							end

							flag = flag or 2
							num = tonumber(arg.worldTravelIssuedAt)
							flag2 = arg.worldTravelDestination == flag

							if flag2 then
								flag2 = num ~= nil
							end

							if flag2 then
								flag2 = os.clock() - num <= 8
							end

							if not flag2 then
								arg.blockedWorldDowngrades = (arg.blockedWorldDowngrades or 0) + 1
								arg.lastBlockedWorldAction = blockedStaleWorldTravel
								arg.status = "Blocked stale world travel: " .. blockedStaleWorldTravel
								warn("[SEAHUB_WORLD_GUARD] blocked " .. blockedStaleWorldTravel .. " from Third Sea")
								return nil
							end

							n5 = 723542415
							return remote:InvokeServer(blockedStaleWorldTravel, ...)
						end
					end
				end

				return remote[arg3]
			end })
		end

		return nil
	end

	local tbl66 = {
		ImpelQuest = "Head Jailer",
		SkyExp1Quest = "Mole",
		SkyExp2Quest = "Sky Quest Giver 2",
		Area1Quest = "Area 1 Quest Giver",
		Area2Quest = "Area 2 Quest Giver",
		SnowMountainQuest = "Snow Quest Giver",
		IceSideQuest = "Ice Quest Giver",
		ShipQuest1 = "Rear Crew Quest Giver",
		ShipQuest2 = "Front Crew Quest Giver",
		FrostQuest = "Frost Quest Giver",
		ForgottenQuest = "Forgotten Quest Giver",
		HauntedQuest1 = "Haunted Castle Quest Giver 1",
		HauntedQuest2 = "Haunted Castle Quest Giver 2",
		CakeQuest1 = "Cake Quest Giver 1",
		CakeQuest2 = "Cake Quest Giver 2",
	}

	local function fn4(arg, arg2)
		local pivot2 = nil
		local magnitude2 = math.huge

		for _, instance in { workspace:FindFirstChild("NPCs"), game:GetService("ReplicatedStorage"):FindFirstChild("NPCs") } do
			local instance3 = instance

			if instance3 then
				instance3 = instance:GetChildren()
			end

			instance3 = instance3 or {}

			for _, instance2 in instance3 do
				if instance2.Name ~= arg then
					continue
				end

				if not instance2:IsA("PVInstance") then
					continue
				end
				local pivot = instance2:GetPivot()
				local magnitude = typeof(arg2) == "CFrame"

				if magnitude then
					magnitude = (pivot.Position - arg2.Position).Magnitude
				end

				magnitude = magnitude or 0

				if magnitude < magnitude2 then
					pivot2 = pivot
					magnitude2 = magnitude
				end
			end
		end

		local npcManager = game:GetService("ReplicatedStorage"):FindFirstChild("NPCManager")

		if npcManager then
			local ok, result = pcall(require, npcManager)

			if ok then
				if type(result) == "table" then
					if type(result.getNPCsByName) == "function" then
						local ok2, result2 = pcall(result.getNPCsByName, arg)

						if ok2 then
							if type(result2) == "table" then
								for _, v in result2 do
									local modelState = type(v) == "table"

									if modelState then
										modelState = v._modelState
									end

									local rootPart = type(modelState) == "table"

									if rootPart then
										rootPart = modelState._rootPart
									end

									local targetLocation = type(modelState) == "table"

									if targetLocation then
										targetLocation = modelState._targetLocation
									end

									if typeof(rootPart) == "Instance" then
										if rootPart:IsA("BasePart") then
											return rootPart.CFrame
										end
									end

									if typeof(targetLocation) == "CFrame" then
										return targetLocation
									end
								end
							end
						end
					end
				end
			end
		end

		if pivot2 then
			if typeof(arg2) ~= "CFrame" then
				return pivot2
			end

			if not (magnitude2 <= 3000) then
				return arg2
			end
			return pivot2
		end

		return arg2
	end

	local function fn5(arg, arg2)
		local guideModule = game:GetService("ReplicatedStorage"):FindFirstChild("GuideModule")
		if not guideModule then
			return arg2, nil
		end
		local ok, result = pcall(require, guideModule)

		if ok then
			ok = type(result) == "table"
		end

		if ok then
			ok = type(result.Data) == "table"
		end

		if ok then
			ok = result.Data.NPCList
		end

		if type(ok) ~= "table" then
			return arg2, nil
		end

		for k, v in ok do
			local levels = type(v) == "table"

			if levels then
				levels = v.Levels
			end

			if type(levels) ~= "table" then
				continue
			end

			for _, v2 in levels do
				if tonumber(v2) ~= tonumber(arg) then
					continue
				end

				local ok2, result2 = pcall(function()
					if typeof(k) == "Instance" then
						if k:IsA("BasePart") then
							return k.CFrame
						end

						if k:IsA("PVInstance") then
							return k:GetPivot()
						end
					elseif type(k) == "table" then
						return k.CFrame
					end
				end)

				if not ok2 then
					continue
				end

				if typeof(result2) == "CFrame" then
					local v3 = result2
					local name = typeof(k) == "Instance"

					if name then
						name = k.Name
					end

					return v3, name or nil
				end
			end
		end

		return arg2, nil
	end

	local function fn6(instance)
		local instance2 = instance

		if instance2 then
			instance2 = instance:FindFirstChildOfClass("PlayerGui")
		end

		local instance3 = instance2

		if instance3 then
			instance3 = instance2:FindFirstChild("TrackedQuestFrame")
		end

		local instance4 = instance3

		if instance4 then
			instance4 = instance3:FindFirstChild("Frame")
		end

		local enabled = not instance3 or not instance3:IsA("LayerCollector") or instance3.Enabled
		local visible = not instance4 or not instance4:IsA("GuiObject") or instance4.Visible
		local instance5 = instance4

		if instance5 then
			instance5 = instance4:FindFirstChild("description")
		end

		if enabled then
			if visible then
				if instance5 then
					if instance5:IsA("TextLabel") then
						if instance5.Text ~= "" then
							local header = instance4:FindFirstChild("header")
							local header2 = header

							if header2 then
								header2 = header:FindFirstChild("textLabel", true)
							end

							local progress = instance4:FindFirstChild("progress")
							local header3 = header2

							if header3 then
								header3 = header2:IsA("TextLabel")
							end

							if header3 then
								header3 = tostring(header2.Text)
							end

							header3 = header3 or ""
							local str = tostring(instance5.Text)
							local progress2 = progress

							if progress2 then
								progress2 = progress:IsA("TextLabel")
							end

							if progress2 then
								progress2 = tostring(progress.Text)
							end

							progress2 = progress2 or ""
							return true, table.concat({ header3, str, progress2 }, " "):gsub("^%s+", ""):gsub("%s+$", ""), { source = "TrackedQuestFrame", title = header3, description = str, progress = progress2 }
						end
					end
				end
			end
		end

		local instance6 = instance2

		if instance6 then
			instance6 = instance2:FindFirstChild("Main")
		end

		local instance7 = instance6

		if instance7 then
			instance7 = instance6:FindFirstChild("Quest")
		end

		if instance7 then
			if instance7.Visible then
				local container = instance7:FindFirstChild("Container")
				local container2 = container

				if container2 then
					container2 = container:FindFirstChild("QuestTitle")
				end

				local container3 = container2

				if container3 then
					container3 = container2:FindFirstChild("Title")
				end

				local container4 = container3

				if container4 then
					container4 = tostring(container3.Text)
				end

				container4 = container4 or ""
				return true, container4, { source = "Main.Quest", title = container4, description = "", progress = "" }
			end
		end

		return false, ""
	end

	local function getModules(modules, arg)
		local modules2 = modules

		for _, name in arg do
			local modules3 = modules2

			if modules3 then
				modules3 = modules2:FindFirstChild(name)
			end

			modules2 = modules3
		end

		return modules2
	end

	local function fn7(arg)
		if type(getupvalues) == "function" then
			if type(arg) == "function" then
				local ok, result = pcall(getupvalues, arg)
				local ok2 = ok

				if ok2 then
					ok2 = result
				end

				return ok2 or {}
			end
		end

		return {}
	end

	tbl64 = {
		fromCapturedRuntime = function(arg)
			local tbl67 = arg or {}
			local environment = tbl67.Environment

			if not environment then
				environment = getgenv

				if environment then
					environment = getgenv()
				end

				environment = environment or _G
			end

			fn2(environment)
			local fps = getFps(environment)
			local capturedFunctions = tbl67.CapturedFunctions or environment.__SEAHUB_FUNCTIONS
			local state = tbl67.State or environment.__SEAHUB_SCRIPT_STATE
			assert(type(capturedFunctions) == "table", "captured SeaHub functions are unavailable")
			assert(type(state) == "table", "captured SeaHub state is unavailable")
			state.performanceFps = fps

			if type(state.bossQuestData) == "table" then
				if #state.bossQuestData == 0 then
					state.bossQuestData = tbl14.forPlace(game.PlaceId)
				end
			else
				state.bossQuestData = tbl14.forPlace(game.PlaceId)
			end

			local Players = game:GetService("Players")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local localPlayer = Players.LocalPlayer
			local data = localPlayer:FindFirstChild("Data") or localPlayer:WaitForChild("Data")
			local v = fn7(capturedFunctions.ScheduleGameplay)
			local v2 = fn7(capturedFunctions.IsTaskCurrent)
			local v3 = fn7(capturedFunctions.Attack)
			local v4 = fn7(capturedFunctions.EquipWeapon)
			local remotes = ReplicatedStorage:FindFirstChild("Remotes")
			local modules = ReplicatedStorage:FindFirstChild("Modules")
			local modules2 = modules

			if modules2 then
				modules2 = modules:FindFirstChild("Net")
			end

			local tbl68 = {
				Environment = environment,
				State = state,
				CapturedFunctions = capturedFunctions,
				Functions = setmetatable({}, { __index = capturedFunctions }),
				LocalPlayer = localPlayer,
				Level = data:FindFirstChild("Level"),
				Beli = data:FindFirstChild("Beli"),
				Fragments = data:FindFirstChild("Fragments"),
				Race = data:FindFirstChild("Race"),
				TweenService = game:GetService("TweenService"),
				RunService = game:GetService("RunService"),
				TaskQueue = tbl67.TaskQueue or v2[2] or v[6],
				TaskDefinitions = tbl67.TaskDefinitions or v[5] or {},
				FruitTracker = tbl67.FruitTracker or v[10] or { objects = {}, count = 0 },
				Inventory = tbl67.Inventory or v[13] or {},
				ConfiguredFruitName = tbl67.ConfiguredFruitName or v[12] or "",
				Islands = tbl67.Islands or v[16] or {},
				Crafting = tbl67.Crafting or v[17] or {},
				CraftingCosts = tbl67.CraftingCosts or v[18] or {},
				MeleeProgress = tbl67.MeleeProgress or v[20] or {},
				MeleeInventory = tbl67.MeleeInventory or v[21] or {},
				FruitAwakening = tbl67.FruitAwakening or v[22],
				SkullGuitar = tbl67.SkullGuitar or v[23] or {},
				DropCatalog = tbl67.DropCatalog or v[24] or {},
				TaskPriorities = tbl67.TaskPriorities or v[7] or {},
				MobSpawns = tbl67.MobSpawns or {},
				ToolsByType = tbl67.ToolsByType or v4[2] or {},
				NearbyTargets = tbl67.NearbyTargets or v3[3] or {},
				NearbyTargetParts = tbl67.NearbyTargetParts or {},
			}

			local commandRemote = tbl67.CommandRemote

			if not commandRemote then
				commandRemote = remotes

				if commandRemote then
					commandRemote = remotes:FindFirstChild("CommF_")
				end
			end

			tbl68.CommandRemote = commandRemote
			local questRemote = tbl67.QuestRemote

			if not questRemote then
				questRemote = remotes

				if questRemote then
					questRemote = remotes:FindFirstChild("CommF_")
				end
			end

			tbl68.QuestRemote = questRemote
			tbl68.RegisterAttackRemote = tbl67.RegisterAttackRemote or v3[4] or getModules(modules2, { "RE", "RegisterAttack" })
			tbl68.RegisterHitRemote = tbl67.RegisterHitRemote or v3[5] or getModules(modules2, { "RE", "RegisterHit" })
			tbl68.SeaName = tbl67.SeaName
			tbl68.QuestNpcNames = tbl67.QuestNpcNames or tbl66
			tbl68.DynamicNpcCFrames = tbl67.DynamicNpcCFrames or state.dynamicNpcCFrames or {}
			tbl68.GetNPCCFrame = tbl67.GetNPCCFrame or fn4
			tbl68.GetQuestNpcCFrame = tbl67.GetQuestNpcCFrame or fn5
			tbl68.SetHiddenProperty = tbl67.SetHiddenProperty

			tbl68.FarmWatchdogState = tbl67.FarmWatchdogState or {
				Enabled = true,
				Config = { PollSeconds = 2 },
				Hops = 0,
				MissingSince = 0,
				LastProgressAt = os.clock(),
				TargetCount = 0,
				TargetHealth = 0,
			}

			tbl68.IsSea = tbl67.IsSea or function(arg2)
				return fn() == arg2
			end

			tbl68.CommandRemote = fn3(tbl68.CommandRemote, state)

			tbl68.ReadQuest = tbl67.ReadQuest or function()
				return fn6(localPlayer)
			end

			tbl68.SetCurrentWeaponType = tbl67.SetCurrentWeaponType or function(currentWeaponType)
				state.currentWeaponType = currentWeaponType
			end

			tbl68.SetNeedsMasteryFragments = tbl67.SetNeedsMasteryFragments or function(needMasteryFragments)
				state.needMasteryFragments = needMasteryFragments
			end

			tbl68.UsePreviousQuest = tbl67.UsePreviousQuest == true
			tbl68.FarmMasteryActive = tbl67.FarmMasteryActive == true
			tbl68.MasteryWeaponType = tbl67.MasteryWeaponType
			return tbl68
		end,
		fromStandalone = function(arg)
			local tbl67 = arg or {}
			local environment = tbl67.Environment

			if not environment then
				environment = getgenv

				if environment then
					environment = getgenv()
				end

				environment = environment or _G
			end

			local fps = getFps(environment)
			local Players = game:GetService("Players")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local localPlayer = Players.LocalPlayer
			local data = localPlayer:FindFirstChild("Data") or localPlayer:WaitForChild("Data")
			local remotes = ReplicatedStorage:WaitForChild("Remotes")
			local net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
			local module = require(net)
			local v = tbl10.forPlace(game.PlaceId)
			local v2 = tbl14.forPlace(game.PlaceId)
			assert(#v > 0, "standalone quest data is unavailable for this place")
			fn2(environment)
			environment.Configs.Team = environment.Configs.Team or "Pirates"

			environment.Configs["Farm Config"] = environment.Configs["Farm Config"] or {
				["First Farm At Sky"] = true,
				["Skip Mode Hop"] = true,
				["Skip Mode Hop Seconds"] = 35,
				["Farm Bone Get x2 Exp"] = { Enable = true, Level = 1975 },
			}

			environment.Configs["Farm Config"]["First Farm At Sky"] = true

			if environment.Configs["Farm Config"]["Skip Mode Hop"] == nil then
				environment.Configs["Farm Config"]["Skip Mode Hop"] = true
			end

			environment.Configs["Farm Config"]["Skip Mode Hop Seconds"] = environment.Configs["Farm Config"]["Skip Mode Hop Seconds"] or 35
			environment.Configs["Farm Config"]["Farm Bone Get x2 Exp"] = environment.Configs["Farm Config"]["Farm Bone Get x2 Exp"] or { Enable = true, Level = 1975 }
			local farmBoneGetX2Exp = environment.Configs["Farm Config"]["Farm Bone Get x2 Exp"]

			if farmBoneGetX2Exp.Enable == nil then
				farmBoneGetX2Exp.Enable = true
			end

			farmBoneGetX2Exp.Level = math.max(1975, tonumber(farmBoneGetX2Exp.Level) or 1975)
			environment.Configs["Farm Mastery"] = environment.Configs["Farm Mastery"] or { Enable = false, ["Mastery Health (%)"] = 40 }

			if environment.Configs["Switch Melee"] == nil then
				environment.Configs["Switch Melee"] = true
			end

			if environment.Configs["Buy Stuffs"] == nil then
				environment.Configs["Buy Stuffs"] = true
			end

			if environment.Configs["Auto Random Fruit"] == nil then
				environment.Configs["Auto Random Fruit"] = true
			end

			if environment.Configs["Auto 2x Exp Codes"] == nil then
				environment.Configs["Auto 2x Exp Codes"] = true
			end

			if environment.Configs["Auto Use Grinding Fruit"] == nil then
				environment.Configs["Auto Use Grinding Fruit"] = true
			end

			if environment.Configs["Attack Interval"] == nil then
				environment.Configs["Attack Interval"] = 0.05
			end

			if environment.Configs["Auto Set Spawn"] == nil then
				environment.Configs["Auto Set Spawn"] = true
			end

			if environment.Configs.Saber == nil then
				environment.Configs.Saber = true
			end

			environment.Configs["Raid Test"] = environment.Configs["Raid Test"] or { Enable = environment.SEAHUB_RAID_TEST == true, FragmentDeficit = 1000, MaxFruits = 1 }

			local state = tbl67.State or {
				paused = true,
				stopped = false,
				status = "Standalone runtime ready",
				autoStatsEnabled = true,
				questData = v,
				bossQuestData = v2,
				expBoostRemaining = 0,
				dynamicNpcCFrames = {},
				farmAnchors = {},
			}

			state.performanceFps = fps
			state.questData = state.questData or v
			state.bossQuestData = state.bossQuestData or v2
			local mobSpawns = {}

			for _, v3 in v do
				mobSpawns[v3.mob_name] = v3.mob_pos
			end

			local tbl68 = {
				Environment = environment,
				State = state,
				CapturedFunctions = nil,
				Functions = {},
				LocalPlayer = localPlayer,
				Level = data:WaitForChild("Level"),
				Beli = data:WaitForChild("Beli"),
				Fragments = data:WaitForChild("Fragments"),
				Race = data:WaitForChild("Race"),
				TweenService = game:GetService("TweenService"),
				RunService = game:GetService("RunService"),
				TaskQueue = tbl67.TaskQueue,
				TaskDefinitions = tbl67.TaskDefinitions or {},
				FruitTracker = { objects = {}, count = 0 },
				Inventory = tbl67.Inventory or { Material = {}, Moveset = {} },
				ConfiguredFruitName = "",
				Islands = {},
				Crafting = {},
				CraftingCosts = {},
				MeleeProgress = tbl67.MeleeProgress or {},
				MeleeInventory = { Melee = {} },
				SkullGuitar = {},
				DropCatalog = {},
			}

			tbl68.TaskPriorities = tbl3.copyPriorities()
			tbl68.MobSpawns = mobSpawns
			tbl68.ToolsByType = { Melee = false, Sword = false, Gun = false, ["Blox Fruit"] = false, Wear = false }
			tbl68.NearbyTargets = {}
			tbl68.NearbyTargetParts = {}
			tbl68.CommandRemote = remotes:WaitForChild("CommF_")
			tbl68.QuestRemote = remotes:WaitForChild("CommF_")
			tbl68.RegisterAttackRemote = module:RemoteEvent("RegisterAttack", true)
			tbl68.RegisterHitRemote = module:RemoteEvent("RegisterHit", true)
			tbl68.DynamicNpcCFrames = state.dynamicNpcCFrames
			tbl68.QuestNpcNames = tbl67.QuestNpcNames or tbl66
			tbl68.GetNPCCFrame = tbl67.GetNPCCFrame or fn4
			tbl68.GetQuestNpcCFrame = tbl67.GetQuestNpcCFrame or fn5
			tbl68.DesiredTeam = environment.Configs.Team
			tbl68.SetHiddenProperty = tbl67.SetHiddenProperty or rawget(environment, "sethiddenproperty")

			tbl68.FarmWatchdogState = tbl67.FarmWatchdogState or {
				Enabled = true,
				Config = { PollSeconds = 2, MissingMobHopSeconds = 200, HopRetrySeconds = 120 },
				Hops = 0,
				MissingSince = 0,
				LastProgressAt = os.clock(),
				TargetCount = 0,
				TargetHealth = 0,
			}

			tbl68.RefreshQuestData = function(arg2)
				local v3 = arg2 or tbl68
				local questData = tbl10.forPlace(game.PlaceId)
				if type(questData) ~= "table" then
					return 0
				end

				if #questData == 0 then
					return 0
				end
				v3.State.questData = questData
				table.clear(v3.MobSpawns)

				for _, v4 in questData do
					if v4.mob_pos ~= nil then
						v3.MobSpawns[v4.mob_name] = v4.mob_pos
					end

					continue
				end

				return #questData
			end

			tbl68.IsSea = function(arg2)
				return fn() == arg2
			end

			tbl68.CommandRemote = fn3(tbl68.CommandRemote, state)

			tbl68.ReadQuest = function()
				return fn6(localPlayer)
			end

			tbl68.SetCurrentWeaponType = function(currentWeaponType)
				state.currentWeaponType = currentWeaponType
			end

			tbl68.SetNeedsMasteryFragments = function(needMasteryFragments)
				state.needMasteryFragments = needMasteryFragments
			end

			tbl68.UsePreviousQuest = tbl67.UsePreviousQuest == true
			tbl68.FarmMasteryActive = false
			return tbl68
		end,
		bindCleanFunctions = function(arg, arg2)
			for k, v in arg2 do
				if type(v) == "table" then
					if type(v.run) == "function" then
						arg.Functions[k] = function(...)
							return v.run(arg, ...)
						end
					end
				end
			end

			if arg2.BossApiReporter then
				arg.Functions.StartBossApiReporter = function()
					return arg2.BossApiReporter.start(arg)
				end

				arg.Functions.StopBossApiReporter = function()
					return arg2.BossApiReporter.stop(arg)
				end
			end

			if arg2.BringMob then
				if type(arg2.BringMob.release) == "function" then
					arg.Functions.ReleaseBring = function()
						return arg2.BringMob.release(arg)
					end
				end
			end

			if arg2.Attack then
				if type(arg2.Attack.stop) == "function" then
					arg.Functions.StopAttack = function()
						return arg2.Attack.stop(arg)
					end
				end
			end

			if arg2.AutoFruitGacha then
				if type(arg2.AutoFruitGacha.storeFruit) == "function" then
					arg.Functions.StoreFruit = function(arg3, arg4)
						return arg2.AutoFruitGacha.storeFruit(arg, arg3, arg4)
					end
				end
			end

			if arg2.AutoFruitPolicy then
				if type(arg2.AutoFruitPolicy.reservedFruit) == "function" then
					arg.Functions.ReservedGrindingFruit = function()
						return arg2.AutoFruitPolicy.reservedFruit(arg)
					end
				end
			end

			if arg2.AutoFruitGacha then
				if type(arg2.AutoFruitGacha.storeCarriedFruits) == "function" then
					arg.Functions.StoreCarriedFruits = function()
						return arg2.AutoFruitGacha.storeCarriedFruits(arg)
					end
				end
			end

			if arg2.AutoRaid then
				if type(arg2.AutoRaid.isActive) == "function" then
					arg.Functions.IsRaidActive = function()
						return arg2.AutoRaid.isActive(arg)
					end

					arg.Functions.ShouldAutoRaid = function()
						return arg2.AutoRaid.shouldSchedule(arg)
					end
				end
			end

			if arg2.AutoUtilityItems then
				if type(arg2.AutoUtilityItems.shouldSchedule) == "function" then
					arg.Functions.ShouldActivateUtilityItem = function()
						return arg2.AutoUtilityItems.shouldSchedule(arg)
					end
				end
			end

			if arg2.AutoTushita then
				if type(arg2.AutoTushita.shouldSchedule) == "function" then
					arg.Functions.ShouldAutoTushita = function()
						return arg2.AutoTushita.shouldSchedule(arg)
					end
				end
			end

			if arg2.AutoYama then
				if type(arg2.AutoYama.shouldSchedule) == "function" then
					arg.Functions.ShouldAutoYama = function()
						return arg2.AutoYama.shouldSchedule(arg)
					end
				end
			end

			if arg2.AutoExpCodes then
				if type(arg2.AutoExpCodes.shouldSchedule) == "function" then
					arg.Functions.ShouldRedeemExpCode = function()
						return arg2.AutoExpCodes.shouldSchedule(arg)
					end
				end
			end

			if arg2.AutoThirdSea then
				if type(arg2.AutoThirdSea.shouldTrevor) == "function" then
					arg.Functions.ShouldAutoTrevor = function()
						return arg2.AutoThirdSea.shouldTrevor(arg)
					end
				end

				if type(arg2.AutoThirdSea.runTrevor) == "function" then
					arg.Functions.AutoTrevor = function(...)
						return arg2.AutoThirdSea.runTrevor(arg, ...)
					end
				end

				if type(arg2.AutoThirdSea.canSchedule) == "function" then
					arg.Functions.CanAutoThirdSea = function()
						return arg2.AutoThirdSea.canSchedule(arg)
					end
				end
			end

			if arg2.AutoMeleeProgress then
				if type(arg2.AutoMeleeProgress.runBackground) == "function" then
					arg.Functions.RunMeleeBackground = function()
						return arg2.AutoMeleeProgress.runBackground(arg)
					end
				end

				if type(arg2.AutoMeleeProgress.runPurchaseMovement) == "function" then
					arg.Functions.AutoMeleePurchaseMovement = function()
						return arg2.AutoMeleeProgress.runPurchaseMovement(arg)
					end
				end

				if type(arg2.AutoMeleeProgress.shouldTargetOrderedBoss) == "function" then
					arg.Functions.ShouldTargetOrderedBoss = function(arg3)
						return arg2.AutoMeleeProgress.shouldTargetOrderedBoss(arg, arg3)
					end
				end

				if type(arg2.AutoMeleeProgress.needsDragonTalonEssence) == "function" then
					arg.Functions.NeedsDragonTalonEssence = function()
						return arg2.AutoMeleeProgress.needsDragonTalonEssence(arg)
					end
				end

				if type(arg2.AutoMeleeProgress.needsMaterialTask) == "function" then
					arg.Functions.NeedsMeleeMaterialTask = function()
						return arg2.AutoMeleeProgress.needsMaterialTask(arg)
					end
				end

				if type(arg2.AutoMeleeProgress.runMaterial) == "function" then
					arg.Functions.AutoMeleeMaterial = function()
						return arg2.AutoMeleeProgress.runMaterial(arg)
					end
				end
			end

			if arg2.AutoElectricUnlock then
				if type(arg2.AutoElectricUnlock.shouldPrefetch) == "function" then
					arg.Functions.ShouldPrefetchElectric = function()
						return arg2.AutoElectricUnlock.shouldPrefetch(arg)
					end
				end

				if type(arg2.AutoElectricUnlock.runPrefetch) == "function" then
					arg.Functions.AutoElectricPrefetch = function(...)
						return arg2.AutoElectricUnlock.runPrefetch(arg, ...)
					end
				end
			end

			if arg2.RefreshInventory then
				arg.Functions.CancelPendingReads = function()
					tbl4.stop(arg)
				end

				arg.Functions.Owns = function(arg3, arg4)
					return arg2.RefreshInventory.owns(arg, arg3, arg4)
				end

				arg.Functions.Carries = function(arg3)
					return arg2.RefreshInventory.carries(arg, arg3)
				end

				arg.Functions.FindPhysicalMoveset = function(arg3)
					return arg2.RefreshInventory.findPhysicalMoveset(arg, arg3)
				end
			end

			if arg2.CollectDroppedFruit then
				arg.Functions.HasDroppedFruit = function()
					return arg2.CollectDroppedFruit.hasTarget(arg)
				end
			end

			if arg2.TryFastTravel then
				if type(arg2.TryFastTravel.stop) == "function" then
					arg.Functions.StopFastTravel = function()
						arg2.TryFastTravel.stop(arg)
					end
				end
			end

			if arg2.QuestNotificationBridge then
				local questNotificationBridge = arg2.QuestNotificationBridge

				arg.AttachQuestNotification = function()
					return questNotificationBridge.attach(arg)
				end

				arg.DetachQuestNotification = function()
					return questNotificationBridge.detach(arg)
				end

				questNotificationBridge.attach(arg)
			end

			return arg.Functions
		end,
	}
end

local tbl65

do
	local n5 = 60
	local n6 = 10

	local function fn(state, idleObservedTarget, idleObservedTargetHealth)
		if state.idleObservedTarget == idleObservedTarget then
			if type(state.idleObservedTargetHealth) == "number" then
				if idleObservedTargetHealth < state.idleObservedTargetHealth then
					state.lastIdlingAt = os.time()
					state.lastIdleProgressKind = "target-damage"
				end
			end
		end

		state.idleObservedTarget = idleObservedTarget
		state.idleObservedTargetHealth = idleObservedTargetHealth
	end

	local function fn2(state)
		state.fullHealthStuckTarget = nil
		state.fullHealthStuckSince = nil
		state.fullHealthStuckSeconds = 0
	end

	local function fn3(arg, fullHealthStuckTarget, arg2, attackPulseTask, arg3, arg4)
		local state = arg.State
		local now = os.clock()
		local flag = state.lastAttackSent == true

		if flag then
			flag = now - (state.lastAttackAt or -math.huge) <= 1
		end

		local flag2 = arg3.raidIsland ~= nil or arg.LocalPlayer:GetAttribute("IslandRaiding") == true or attackPulseTask == "Auto Raid"
		local flag3 = attackPulseTask == "Auto Farm Level"

		if flag3 then
			flag3 = arg.Level.Value > 100
		end

		if flag3 then
			flag3 = fullHealthStuckTarget.Name ~= "Core"
		end

		if flag3 then
			flag3 = not flag2
		end

		if flag3 then
			flag3 = arg4
		end

		if flag3 then
			flag3 = flag
		end

		if flag3 then
			flag3 = arg2.Health == arg2.MaxHealth
		end

		if flag3 then
			if state.fullHealthStuckTarget ~= fullHealthStuckTarget then
				state.fullHealthStuckTarget = fullHealthStuckTarget
				state.fullHealthStuckSince = now
				state.fullHealthStuckSeconds = 0
				return false
			end

			state.fullHealthStuckSince = state.fullHealthStuckSince or now
			state.fullHealthStuckSeconds = now - state.fullHealthStuckSince
			if state.fullHealthStuckSeconds <= n5 then
				return false
			end

			if not (now < (state.nextFullHealthHopAt or 0)) then
				state.nextFullHealthHopAt = now + n6
				state.status = "Auto Farm Level | Hopping from invulnerable mob"
				arg.Functions.StopTween()
				local v = arg.Functions.HopServer(nil, "mob-health-unchanged")
				state.lastFullHealthHop = { target = fullHealthStuckTarget.Name, success = v, seconds = state.fullHealthStuckSeconds, at = os.time() }

				if not v then
					state.fullHealthStuckSince = now - (n5 - n6)
				end

				return v == true
			end

			return false
		end

		fn2(state)
		return false
	end

	tbl65 = { run = function(arg, farmTarget, attackPulseTask, arg2)
		local tbl66 = arg2 or {}
		local functions = arg.Functions
		local state = arg.State
		if arg.TaskQueue:top() ~= attackPulseTask then
			return false
		end
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChild("HumanoidRootPart")
		end

		local character3 = character

		if character3 then
			character3 = character:FindFirstChildOfClass("Humanoid")
		end

		local v, v2, v3 = functions.IsActiveEnemyModel(farmTarget)

		if character2 then
			if character3 then
				if not (character3.Health <= 0) then
					if v then
						fn(state, farmTarget, v2.Health)
						state.farmTarget = farmTarget
						state.status = tbl66.status or attackPulseTask .. " | Attacking mob"
						functions.UpdateFarmWatchdog(attackPulseTask, "attacking", farmTarget.Name)
						local targetNames = tbl66.targetNames or farmTarget.Name

						local tbl67 = {
							raidIsland = tbl66.raidIsland,
							scanRadius = tbl66.bringRadius,
							maxMembers = tbl66.maxBringMembers,
						}

						local bringAnchor = tbl66.bringAnchor or v3.CFrame
						local flag = not tbl66.boss

						if flag then
							flag = functions.BringMob(bringAnchor, targetNames, tbl67, farmTarget)
						end

						local destination = tbl66.destination or (flag or v3.CFrame) + Vector3.new(0, 30, 0)
						local preserveBring = tbl66.preserveBring

						if preserveBring == nil then
							preserveBring = tbl66.noRespawn
						end

						if preserveBring == nil then
							preserveBring = true
						end

						functions.TP(destination, attackPulseTask, preserveBring)
						local n7 = tonumber(tbl66.attackRadius) or 60
						local magnitude = (destination.Position - character2.Position).Magnitude
						if n7 < magnitude then
							fn2(state)
							return true
						end
						functions.AutoBuso()
						table.clear(arg.NearbyTargets)
						table.clear(arg.NearbyTargetParts)

						for _, instance in workspace.Enemies:GetChildren() do
							local humanoid = instance:FindFirstChildOfClass("Humanoid")
							local humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")
							local head = instance:FindFirstChild("Head") or humanoidRootPart
							if not humanoid then
								continue
							end

							if not (humanoid.Health > 0) then
								continue
							end

							if not humanoidRootPart then
								continue
							end

							if head then
								if (humanoidRootPart.Position - character2.Position).Magnitude <= 60 then
									arg.NearbyTargets[#arg.NearbyTargets + 1] = { instance, head }
									arg.NearbyTargetParts[#arg.NearbyTargetParts + 1] = head
								end
							end
						end

						local weaponType = tbl66.weaponType or state.selectedWeaponType or "Melee"
						local farmMastery = arg.Environment.Configs["Farm Mastery"]
						state.namecallTarget = nil

						if arg.FarmMasteryActive then
							if v2.Health / math.max(1, v2.MaxHealth) * 100 <= farmMastery["Mastery Health (%)"] then
								weaponType = arg.MasteryWeaponType or "Sword"
							end
						end

						return (function()
							if functions.EquipWeapon(weaponType) then
								local v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
								local v14, v15, v16, v17, v18, v19, v20, v21, v22, v23
								local v24, v25, v26, v27, v28, v29, v30, v31, v32, v33
								local v34, v35, v36, v37, v38, v39, v40, v41, v42, v43
								local v44, v45, v46, v47, v48, v49, v50, v51, v52, v53
								local v54, v55, v56, v57, v58, v59, v60, v61, v62, v63
								local v64, v65, v66, v67, v68, v69, v70, v71, v72, v73
								local v74, v75, v76, v77, v78, v79, v80, v81, v82, v83
								local v84, v85, v86, v87, v88, v89, v90, v91, v92, v93
								local v94, v95, v96, v97, v98, v99, v100, v101, v102, v103
								local v104, v105, v106, v107, v108, v109, v110, v111, v112, v113
								local v114, v115, v116, v117, v118, v119, v120, v121, v122, v123
								local v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v262

								if arg.FarmMasteryActive then
									if weaponType == arg.MasteryWeaponType then
										functions.FarmMastery(farmTarget, v3.CFrame, weaponType)
									elseif weaponType == "Gun" then
										functions.ShootGun(farmTarget, weaponType)
									else
										state.attackPulseTask = attackPulseTask
										state.attackPulseExpiresAt = os.clock() + 0.35
										functions.Attack()

										if not state.attackPulseRunning then
											state.attackPulseRunning = true

											task.spawn(function()
												while not state.stopped do
													if state.paused then
														break
													end

													if arg.TaskQueue:top() == state.attackPulseTask then
														if os.clock() <= (state.attackPulseExpiresAt or 0) then
															functions.Attack()
															task.wait(0.05)
															continue
														end
													end

													break
												end

												state.attackPulseRunning = false
											end)
										end
									end
								elseif weaponType == "Gun" then
									functions.ShootGun(farmTarget, weaponType)
								else
									state.attackPulseTask = attackPulseTask
									state.attackPulseExpiresAt = os.clock() + 0.35
									functions.Attack()

									if not state.attackPulseRunning then
										state.attackPulseRunning = true

										task.spawn(function()
											while not state.stopped do
												if state.paused then
													break
												end

												if arg.TaskQueue:top() == state.attackPulseTask then
													if os.clock() <= (state.attackPulseExpiresAt or 0) then
														functions.Attack()
														task.wait(0.05)
														continue
													end
												end

												break
											end

											state.attackPulseRunning = false
										end)
									end
								end
							end

							fn3(arg, farmTarget, v2, attackPulseTask, tbl66, magnitude <= 15)
							return true
						end)()
					end
				end
			end
		end

		if state.farmTarget == farmTarget then
			state.farmTarget = nil
		end

		if state.idleObservedTarget == farmTarget then
			state.idleObservedTarget = nil
			state.idleObservedTargetHealth = nil
		end

		fn2(state)
		return false
	end }
end

local tbl66

do
	local str = "Cake Prince"
	local cframe = CFrame.new(-2154.778564453125, 70.295204162597656, -12405.072265625)
	local n5 = 3000
	local n6 = 176
	local n7 = 300

	local function fn(arg, character)
		local map = workspace:FindFirstChild("Map")
		local map2 = map

		if map2 then
			map2 = map:FindFirstChild("CakeLoaf")
		end

		local map3 = map2

		if map3 then
			map3 = map2:FindFirstChild("BigMirror")
		end

		if not map3 then
			return false
		end
		local clickDetector = map3:FindFirstChildWhichIsA("ClickDetector", true)

		if clickDetector then
			if type(fireclickdetector) == "function" then
				pcall(fireclickdetector, clickDetector)
			end
		end

		local basePart = map3:FindFirstChildWhichIsA("BasePart", true)

		if basePart then
			if type(firetouchinterest) == "function" then
				pcall(firetouchinterest, character, basePart, 0)
				task.wait()
				pcall(firetouchinterest, character, basePart, 1)
			end
		end

		arg.State.lastMirrorPortalActivationAt = os.clock()
		return clickDetector ~= nil or basePart ~= nil
	end

	local function fn2(arg, arg2, arg3)
		if arg2 ~= str then
			return false
		end
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		local character3 = character

		if character3 then
			character3 = character:FindFirstChild("HumanoidRootPart")
		end

		if not character2 then
			return true
		end

		if not character3 then
			return true
		end

		if character2.Health <= 0 then
			return true
		end

		if not (n5 <= character3.Position.Y) then
			local now = os.clock()
			arg.State.cakePrincePortalStartedAt = arg.State.cakePrincePortalStartedAt or now

			if not (n6 <= now - arg.State.cakePrincePortalStartedAt) then
				arg.State.status = "Auto Farm Boss - Entering Mirror Portal"

				if (character3.Position - cframe.Position).Magnitude > 30 then
					arg.Functions.TP(cframe, arg3, true, arg2)
				elseif (arg.State.nextMirrorPortalActivationAt or 0) <= now then
					arg.State.nextMirrorPortalActivationAt = now + 0.4
					arg.Functions.CancelTween()
					fn(arg, character3)
				end

				return true
			end

			arg.State.cakePrincePortalStartedAt = nil
			arg.State.cakePrincePortalBlockedUntil = now + n7
			arg.State.status = "Auto Farm Level | Cake Prince portal timeout"

			if arg.Functions.ReleaseBossCombat then
				arg.Functions.ReleaseBossCombat()
			end

			if arg.Functions.StopTween then
				arg.Functions.StopTween(arg3)
			end

			arg.TaskQueue:pop(arg3)
			return true
		end

		arg.State.cakePrincePortalStartedAt = nil
		return false
	end

	tbl66 = { run = function(arg, arg2, arg3, arg4, arg5)
		local str2 = arg3 or "Auto Farm Level"
		if arg.TaskQueue:top() ~= str2 then
			return false
		end
		local functions = arg.Functions

		if str2 == "Special Boss" then
			if functions.IsRaidActive then
				if functions.IsRaidActive() then
					arg.State.status = "Special Boss | Leaving active raid"
					local character = arg.LocalPlayer.Character
					local character2 = character

					if character2 then
						character2 = character:FindFirstChildOfClass("Humanoid")
					end

					if not character2 then
						return true
					end

					if not (character2.Health > 0) then
						return true
					end

					pcall(function()
						character2.Health = 0
					end)

					return true
				end
			end
		end

		local liveBoss = functions.GetLiveBoss(arg2)
		tbl8.observe(arg, arg2, liveBoss, "farm-boss")

		if liveBoss then
			if fn2(arg, arg2, str2) then
				tbl8.engage(arg, arg2, liveBoss, str2, "portal")
				return true
			end
			arg.State.status = str2 .. " | " .. arg2

			if arg4 ~= false then
				local bossQuest = arg5 or functions.GetBossQuest(arg.Level.Value, arg2)

				if bossQuest then
					if bossQuest.boss_name == arg2 then
						if functions.EnsureQuest(bossQuest, str2) then
							tbl8.engage(arg, arg2, liveBoss, str2, "combat")

							return functions.CombatTarget(liveBoss, str2, {
								boss = true,
								preserveBring = true,
								destination = liveBoss.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0),
							})
						end

						tbl8.engage(arg, arg2, liveBoss, str2, "quest")
						return true
					end
				end

				tbl8.finish(arg, arg2, "quest-unavailable")
				return false
			end

			tbl8.engage(arg, arg2, liveBoss, str2, "combat")

			return functions.CombatTarget(liveBoss, str2, {
				boss = true,
				preserveBring = true,
				destination = liveBoss.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0),
			})
		end

		if arg2 == str then
			arg.State.cakePrincePortalStartedAt = nil
		end

		arg.State.farmTarget = nil
		arg.State.status = str2 .. " | Boss unavailable"

		if functions.ReleaseBossCombat then
			functions.ReleaseBossCombat()
		end

		if functions.StopTween then
			functions.StopTween(str2)
		end

		tbl8.finish(arg, arg2, "unavailable")
		return false
	end }
end

local tbl67

do
	local distance = 320
	local n5 = 5
	local n6 = 5
	local n7 = 45
	local n8 = 10
	local n9 = 15
	local distance2 = 10
	local n10 = 8

	local function fn(arg)
		local tbl68 = {}

		for k in arg do
			tbl68[#tbl68 + 1] = k
		end

		table.sort(tbl68)
		return tbl68
	end

	local function fn2(arg)
		return table.concat(fn(arg), "\0")
	end

	local function fn3(arg, farmTargetRecovery)
		arg.farmTarget = nil
		arg.farmTargetHealth = nil
		arg.farmTargetProgressAt = nil
		arg.farmTargetLastPosition = nil
		arg.farmTargetOldPosition = nil
		arg.farmApproachDistance = nil
		arg.farmApproachProgressAt = nil
		arg.farmTargetRecovery = farmTargetRecovery
	end

	local function fn4(arg, arg2)
		local state = arg.State
		fn3(state, arg2)
		state.farmCluster = nil
		state.farmClusterCount = 0
		state.farmClusterName = nil
		table.clear(arg.NearbyTargets)
		table.clear(arg.NearbyTargetParts)

		if arg.Functions.ReleaseBring then
			pcall(arg.Functions.ReleaseBring)
		end
	end

	local function fn5(state, instance)
		if instance:IsA("Model") then
			local humanoid = instance:FindFirstChildOfClass("Humanoid")

			if humanoid then
				if humanoid.Health <= 0 then
					return
				end
			end

			state.farmMobCache[instance.Name] = state.farmMobCache[instance.Name] or {}
			state.farmMobCache[instance.Name][instance] = true
		end
	end

	local function fn6(state, child)
		local child2 = child

		if child2 then
			child2 = state.farmMobCache[child.Name]
		end

		if child2 then
			child2[child] = nil

			if not next(child2) then
				state.farmMobCache[child.Name] = nil
			end

			return
		end
	end

	local function fn7(arg)
		local state = arg.State
		local enemies = workspace:FindFirstChild("Enemies")
		state.farmMobCache = state.farmMobCache or {}
		local farmEnemyAddedConnection = state.farmMobCacheFolder == enemies

		if farmEnemyAddedConnection then
			farmEnemyAddedConnection = state.farmEnemyAddedConnection
		end

		if farmEnemyAddedConnection then
			farmEnemyAddedConnection = state.farmEnemyRemovedConnection
		end

		if farmEnemyAddedConnection then
			if (state.nextFarmMobCacheResyncAt or 0) <= os.clock() then
				state.farmMobCache = {}

				for _, v in enemies:GetChildren() do
					fn5(state, v)
				end

				state.nextFarmMobCacheResyncAt = os.clock() + n5
			end

			return
		end

		if state.farmEnemyAddedConnection then
			state.farmEnemyAddedConnection:Disconnect()
		end

		if state.farmEnemyRemovedConnection then
			state.farmEnemyRemovedConnection:Disconnect()
		end

		state.farmEnemyAddedConnection = nil
		state.farmEnemyRemovedConnection = nil
		state.farmMobCache = {}
		state.farmMobCacheFolder = enemies
		state.farmDeadRegions = state.farmDeadRegions or {}
		local farmMobCacheToken = {}
		state.farmMobCacheToken = farmMobCacheToken

		if enemies then
			for _, v in enemies:GetChildren() do
				fn5(state, v)
			end

			state.nextFarmMobCacheResyncAt = os.clock() + n5

			state.farmEnemyAddedConnection = enemies.ChildAdded:Connect(function(child)
				if state.stopped then
					return
				end

				if state.farmMobCacheToken ~= farmMobCacheToken then
					return
				end

				if state.farmMobCacheFolder == enemies then
					if child.Parent == enemies then
						fn5(state, child)

						task.spawn(function()
							if not child:WaitForChild("HumanoidRootPart", 5) then
								return
							end

							if state.stopped then
								return
							end

							if state.farmMobCacheToken ~= farmMobCacheToken then
								return
							end

							if state.farmMobCacheFolder ~= enemies then
								return
							end

							if child.Parent == enemies then
								state.farmDeadRegions[child.Name] = nil
								local farmRegionState = state.farmRegionState

								if farmRegionState then
									if farmRegionState.acceptedNames[child.Name] then
										table.clear(farmRegionState.scanned)
										farmRegionState.spawnCandidate = child
										farmRegionState.lastSpawnAt = os.clock()
									end
								end
							end
						end)
					end
				end
			end)

			state.farmEnemyRemovedConnection = enemies.ChildRemoved:Connect(function(child)
				if state.stopped then
					return
				end

				if state.farmMobCacheToken == farmMobCacheToken then
					if state.farmMobCacheFolder == enemies then
						fn6(state, child)
					end
				end
			end)

			return
		end
	end

	tbl67 = { mergeTargetCandidates = function(arg, arg2)
		local tbl68 = {}
		local tbl69 = {}
		local count = 0

		for _, v in arg do
			if v.enemy then
				if not tbl69[v.enemy] then
					tbl69[v.enemy] = true
					tbl68[#tbl68 + 1] = v
				end
			end
		end

		for _, v in arg2 do
			if v.enemy then
				if not tbl69[v.enemy] then
					tbl69[v.enemy] = true
					tbl68[#tbl68 + 1] = v
					count += 1
				end
			end
		end

		return tbl68, count
	end }

	local function fn8(arg, instance)
		local instance2 = instance

		if instance2 then
			instance2 = instance:FindFirstChildOfClass("Humanoid")
		end

		local isActiveEnemyModel = arg.Functions.IsActiveEnemyModel
		local instance3 = instance
		local instance4 = instance

		if instance4 then
			instance4 = instance.Name
		end

		local v, v2, v3 = isActiveEnemyModel(instance3, instance4)

		if v then
			if not ((instance:GetAttribute("FailureCount") or 0) >= 3) then
				return { enemy = instance, humanoid = v2, root = v3, grabbed = instance:GetAttribute("IsGrabbed") == true }, v2
			end
		end

		return nil, v2 or instance2
	end

	local function fn9(arg, arg2)
		local state = arg.State
		local tbl68 = {}
		local tbl69 = {}
		local enemies = workspace:FindFirstChild("Enemies")

		for k in arg2 do
			local v = state.farmMobCache[k]
			local tbl70 = v or {}

			for k2 in tbl70 do
				local v2, v3 = fn8(arg, k2)
				if v2 then
					tbl68[#tbl68 + 1] = v2
					continue
				end

				if k2.Parent == enemies then
					if not v3 then
						continue
					end

					if not (v3.Health <= 0) then
						continue
					end
				end

				v[k2] = nil
			end
		end

		local bring = state.bring
		local bring2 = bring

		if bring2 then
			bring2 = bring.members
		end

		bring2 = bring2 or {}

		for k in bring2 do
			if not arg2[k.Name] then
				continue
			end
			local v = fn8(arg, k)

			if v then
				tbl69[#tbl69 + 1] = v
			end

			continue
		end

		return tbl67.mergeTargetCandidates(tbl68, tbl69)
	end

	local function getCount(arg, arg2)
		local bring = arg.State.bring
		local count = 0
		if not bring then
			return count
		end

		if not bring.members then
			return count
		end

		for k in bring.members do
			if arg2[k.Name] then
				if k:GetAttribute("IsGrabbed") then
					if arg.Functions.IsActiveEnemyModel(k, k.Name) then
						count += 1
					end
				end
			end
		end

		return count
	end

	local function fn10()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
		local tbl68 = {}
		local fortBuilderReplicatedSpawnPositi = ReplicatedStorage:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
		local worldOrigin2 = worldOrigin

		if worldOrigin2 then
			worldOrigin2 = worldOrigin:FindFirstChild("EnemySpawns")
		end

		tbl68[1] = fortBuilderReplicatedSpawnPositi
		tbl68[2] = worldOrigin2
		return tbl68
	end

	local function fn11(arg)
		local tbl68 = {}
		local tbl69 = {}

		for k, v in arg do
			if tbl69[k] then
				continue
			end
			local tbl70 = { k }
			local tbl71 = {}
			tbl69[k] = true

			while #tbl70 > 0 do
				local v2 = arg[table.remove(tbl70)]
				tbl71[#tbl71 + 1] = v2

				for k2, v3 in arg do
					if tbl69[k2] then
						continue
					end

					if v3.name == v.name then
						if (v2.cframe.Position - v3.cframe.Position).Magnitude <= distance then
							tbl69[k2] = true
							tbl70[#tbl70 + 1] = k2
						end
					end
				end
			end

			local vector = Vector3.zero

			for _, v2 in tbl71 do
				vector += v2.cframe.Position
			end

			local n11 = vector / #tbl71
			local v2 = tbl71[1]
			local magnitude2 = math.huge

			for _, v3 in tbl71 do
				local magnitude = (v3.cframe.Position - n11).Magnitude

				if magnitude < magnitude2 then
					v2 = v3
					magnitude2 = magnitude
				end
			end

			tbl68[#tbl68 + 1] = {
				name = v.name,
				cframe = v2.cframe,
				key = v.name .. "\0" .. tostring(v2.cframe),
				count = #tbl71,
			}
		end

		return tbl68
	end

	local function fn12(arg, arg2)
		local v = fn10()
		local v2 = fn2(arg2)
		local farmSpawnRegionsCache = arg.State.farmSpawnRegionsCache
		local now = os.clock()

		if farmSpawnRegionsCache then
			if farmSpawnRegionsCache.key == v2 then
				if now < farmSpawnRegionsCache.expiresAt then
					if farmSpawnRegionsCache.firstFolder == v[1] then
						if farmSpawnRegionsCache.secondFolder == v[2] then
							return farmSpawnRegionsCache.regions
						end
					end
				end
			end
		end

		local tbl68 = {}
		local oks = {}
		local tbl69 = {}

		for k in arg2 do
			tbl69[arg.Functions.NormalizeEnemyName(k)] = k
		end

		for _, instance in v do
			local instance3 = instance

			if instance3 then
				instance3 = instance:GetChildren()
			end

			instance3 = instance3 or {}

			for _, instance2 in instance3 do
				local v3 = tbl69[arg.Functions.NormalizeEnemyName(instance2.Name)]
				if not v3 then
					continue
				end

				local ok, result = pcall(function()
					local isBasePart = instance2:IsA("BasePart")

					if isBasePart then
						isBasePart = instance2.CFrame
					end

					return isBasePart or instance2:GetPivot()
				end)

				if ok then
					ok = v3 .. "\0" .. tostring(result)
				end

				ok = ok or nil
				if not ok then
					continue
				end

				if typeof(result) == "CFrame" then
					if not oks[ok] then
						oks[ok] = true
						tbl68[#tbl68 + 1] = { name = v3, cframe = result }
					end
				end
			end

			continue
		end

		local v3 = fn11(tbl68)
		arg.State.farmSpawnRegionsCache = { key = v2, firstFolder = v[1], secondFolder = v[2], expiresAt = now + n6, regions = v3 }
		return v3
	end

	local function fn13(arg, arg2, arg3)
		local v = nil
		local magnitude2 = math.huge

		for _, v2 in arg do
			if v2.name ~= arg2 then
				continue
			end
			local magnitude = (v2.cframe.Position - arg3).Magnitude

			if magnitude < magnitude2 then
				v = v2
				magnitude2 = magnitude
				continue
			end
		end

		return v
	end

	local function fn14(arg, name, attribute, arg2)
		if type(name) ~= "string" then
			return
		end

		if typeof(attribute) == "Vector3" then
			local v = fn13(arg2, name, attribute)

			if v then
				local farmDeadRegions = arg.State.farmDeadRegions
				farmDeadRegions[name] = farmDeadRegions[name] or {}
				farmDeadRegions[name][v.key] = true
				return
			end

			return
		end
	end

	local function fn15(arg, farmRegionState, arg2, arg3)
		local bring = arg.State.bring
		local bring2 = bring

		if bring2 then
			bring2 = bring.anchor
		end

		if bring2 then
			farmRegionState.lastAnchor = bring2
			local farmAnchors = arg.State.farmAnchors or {}
			arg.State.farmAnchors = farmAnchors

			for k in arg2 do
				farmAnchors[k] = { task = farmRegionState.task, cframe = bring2 + Vector3.new(0, 30, 0), at = os.clock() }
				local v = fn13(arg3, k, bring2.Position)

				if v then
					farmRegionState.scanned[v.key] = true
				end
			end
		end

		farmRegionState.currentIndex = 1
		arg.State.farmCluster = nil
		arg.State.farmClusterCount = 0
		arg.State.farmClusterName = nil

		if arg.Functions.ReleaseBring then
			pcall(arg.Functions.ReleaseBring)
		end
	end

	tbl67.shouldPreemptTarget = function(arg, arg2, arg3)
		local flag = arg3 == true

		if flag then
			flag = arg2 ~= nil
		end

		if flag then
			flag = arg ~= arg2
		end

		return flag
	end

	tbl67.chooseCandidate = function(arg, arg2, arg3)
		local v = nil
		local grabbed2 = math.huge
		local n11 = math.huge
		local distance4 = math.huge

		for _, v2 in arg do
			local grabbed = arg2

			if grabbed then
				grabbed = v2.grabbed

				if grabbed then
					grabbed = 0
				end

				grabbed = grabbed or 1
			end

			grabbed = grabbed or 0
			local flag = not arg2

			if flag then
				flag = arg3
			end

			if flag then
				flag = v2.enemy.Name == arg3

				if flag then
					flag = 0
				end

				flag = flag or 1
			end

			flag = flag or 0
			local distance3 = v2.distance or 0

			if not (grabbed < grabbed2) then
				if grabbed == grabbed2 then
					if not (flag < n11) then
						if grabbed ~= grabbed2 then
							continue
						end

						if flag ~= n11 then
							continue
						end

						if not (distance3 < distance4) then
							continue
						end
					end
				else
					if grabbed ~= grabbed2 then
						continue
					end

					if flag ~= n11 then
						continue
					end

					if not (distance3 < distance4) then
						continue
					end
				end
			end

			v = v2
			grabbed2 = grabbed
			n11 = flag
			distance4 = distance3
		end

		local enemy = v

		if enemy then
			enemy = v.enemy
		end

		return enemy or nil
	end

	local function fn16(arg, instance, arg2, arg3)
		local state = arg.State
		local now = os.clock()
		local health = arg2.Health
		local character = arg.LocalPlayer.Character

		if character then
			character = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		end

		state.farmTargetLastPosition = arg3.Position
		state.farmTargetOldPosition = instance:GetAttribute("OldPosition") or state.farmTargetOldPosition

		if state.farmTarget == instance then
			if state.farmTargetHealth ~= nil then
				if health < state.farmTargetHealth - 0.5 then
					state.farmTargetHealth = health
					state.farmTargetProgressAt = now
				end
			else
				state.farmTargetHealth = health
				state.farmTargetProgressAt = now
			end
		else
			state.farmTargetHealth = health
			state.farmTargetProgressAt = now
		end

		if not character then
			return true
		end
		local magnitude = (arg3.Position - character.Position).Magnitude

		if not (magnitude <= 150) then
			if state.farmApproachDistance ~= nil then
				if magnitude + n8 < state.farmApproachDistance then
					state.farmApproachDistance = magnitude
					state.farmApproachProgressAt = now
				elseif n7 <= now - (state.farmApproachProgressAt or now) then
					instance:SetAttribute("FailureCount", (instance:GetAttribute("FailureCount") or 0) + 1)
					fn4(arg, "approach-timeout")
					return false
				end

				return true
			end
		end

		state.farmApproachDistance = magnitude
		state.farmApproachProgressAt = now
		return true
	end

	local function getFarmRegionState(arg, arg2, acceptedNames)
		local state = arg.State
		local farmPackKey = fn2(acceptedNames)
		local farmRegionState = state.farmRegionState

		if not farmRegionState then
			fn4(arg, "pack-changed")
			farmRegionState = { task = arg2, key = farmPackKey, acceptedNames = acceptedNames, scanned = {}, currentIndex = 1 }
			state.farmRegionState = farmRegionState
			state.farmPackKey = farmPackKey
			return farmRegionState
		end

		if farmRegionState.task ~= arg2 then
			fn4(arg, "pack-changed")
			farmRegionState = { task = arg2, key = farmPackKey, acceptedNames = acceptedNames, scanned = {}, currentIndex = 1 }
			state.farmRegionState = farmRegionState
			state.farmPackKey = farmPackKey
			return farmRegionState
		end

		if farmRegionState.key ~= farmPackKey then
			fn4(arg, "pack-changed")
			farmRegionState = { task = arg2, key = farmPackKey, acceptedNames = acceptedNames, scanned = {}, currentIndex = 1 }
			state.farmRegionState = farmRegionState
			state.farmPackKey = farmPackKey
		else
			farmRegionState.acceptedNames = acceptedNames
		end

		return farmRegionState
	end

	tbl67.run = function(arg, arg2, arg3, arg4, arg5, arg6, arg7, farmPreferredName)
		local functions = arg.Functions
		local state = arg.State

		if arg.TaskQueue:top() == arg3 then
			if type(arg6) == "function" then
				if arg6() then
					functions.StopTween()
					return
				end
			end

			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			local character3 = character

			if character3 then
				character3 = character:FindFirstChild("HumanoidRootPart")
			end

			if not character3 then
				return
			end

			if not character2 then
				return
			end

			if character2.Health <= 0 then
				return
			end

			if #arg2 == 0 then
				return
			end
			local tbl68 = {}

			for _, v in arg2 do
				tbl68[v] = true
			end

			if arg4 then
				local n11 = math.min(arg.Level.Value, arg5 or arg.Level.Value)
				local quest = functions.GetQuest(n11)

				if quest then
					if tbl68[quest.mob_name] then
						if not functions.EnsureQuest(quest, arg3) then
							return
						end
						farmPreferredName = quest.mob_name

						if not arg7 then
							tbl68 = { [quest.mob_name] = true }
						end
					end
				end
			end

			fn7(arg)
			local farmRegionState = getFarmRegionState(arg, arg3, tbl68)
			local v = fn12(arg, tbl68)
			local v2, farmRecoveredTargetCount = fn9(arg, tbl68)
			state.farmRecoveredTargetCount = farmRecoveredTargetCount

			if farmRecoveredTargetCount > 0 then
				state.lastFarmTargetReacquireAt = os.clock()
			end

			local count = getCount(arg, tbl68)
			local flag = count > 0
			local flag2 = false

			for _, v3 in v2 do
				v3.distance = (v3.root.Position - character3.Position).Magnitude

				if v3.enemy.Name == farmPreferredName then
					flag2 = true
				end
			end

			state.farmPreferredName = farmPreferredName
			local farmTarget = state.farmTarget
			local v3 = nil
			local v4 = nil
			local v5 = nil

			if farmTarget then
				v3, v4, v5 = functions.IsActiveEnemyModel(farmTarget, farmTarget.Name)
			end

			local flag3

			if farmTarget then
				if v3 then
					if v3 then
						flag3 = farmTarget:GetAttribute("IsGrabbed") == true

						if flag then
							if flag3 then
								if flag then
									if not fn16(arg, farmTarget, v4, v5) then
										farmTarget = nil
									end
								elseif tbl67.shouldPreemptTarget(farmTarget.Name, farmPreferredName, flag2) then
									fn4(arg, "preferred-target-available")
									farmTarget = nil
									flag = false
								elseif not fn16(arg, farmTarget, v4, v5) then
									farmTarget = nil
								end
							else
								fn3(state, "finish-grabbed-pack")
								farmTarget = nil
							end
						elseif flag then
							if not fn16(arg, farmTarget, v4, v5) then
								farmTarget = nil
							end
						elseif tbl67.shouldPreemptTarget(farmTarget.Name, farmPreferredName, flag2) then
							fn4(arg, "preferred-target-available")
							farmTarget = nil
							flag = false
						elseif not fn16(arg, farmTarget, v4, v5) then
							farmTarget = nil
						end
					end
				else
					local enemies = workspace:FindFirstChild("Enemies")
					local humanoid = farmTarget:FindFirstChildOfClass("Humanoid")
					local humanoid2 = farmTarget.Parent == enemies

					if humanoid2 then
						humanoid2 = humanoid
					end

					if humanoid2 then
						humanoid2 = humanoid.Health > 0
					end

					if not humanoid2 then
						fn14(arg, farmTarget.Name, farmTarget:GetAttribute("OldPosition") or state.farmTargetOldPosition or state.farmTargetLastPosition, v)
					end

					local v6 = fn3
					local state2 = state
					local humanoid3 = humanoid2

					if humanoid3 then
						humanoid3 = "target-root-refresh"
					end

					v6(state2, humanoid3 or "target-finished")
					farmTarget = nil
				end
			elseif v3 then
				flag3 = farmTarget:GetAttribute("IsGrabbed") == true

				if flag then
					if flag3 then
						if flag then
							if not fn16(arg, farmTarget, v4, v5) then
								farmTarget = nil
							end
						elseif tbl67.shouldPreemptTarget(farmTarget.Name, farmPreferredName, flag2) then
							fn4(arg, "preferred-target-available")
							farmTarget = nil
							flag = false
						elseif not fn16(arg, farmTarget, v4, v5) then
							farmTarget = nil
						end
					else
						fn3(state, "finish-grabbed-pack")
						farmTarget = nil
					end
				elseif flag then
					if not fn16(arg, farmTarget, v4, v5) then
						farmTarget = nil
					end
				elseif tbl67.shouldPreemptTarget(farmTarget.Name, farmPreferredName, flag2) then
					fn4(arg, "preferred-target-available")
					farmTarget = nil
					flag = false
				elseif not fn16(arg, farmTarget, v4, v5) then
					farmTarget = nil
				end
			end

			if not farmTarget then
				local spawnCandidate = not flag

				if spawnCandidate then
					spawnCandidate = farmRegionState.spawnCandidate
				end

				if spawnCandidate then
					if tbl68[spawnCandidate.Name] then
						if functions.IsActiveEnemyModel(spawnCandidate, spawnCandidate.Name) then
							farmTarget = spawnCandidate
						else
							farmTarget = tbl67.chooseCandidate(v2, flag, farmPreferredName)
						end
					else
						farmTarget = tbl67.chooseCandidate(v2, flag, farmPreferredName)
					end
				else
					farmTarget = tbl67.chooseCandidate(v2, flag, farmPreferredName)
				end

				local bring = state.bring

				if farmTarget then
					local humanoidRootPart = farmTarget:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						if bring then
							if count == 0 then
								local v6 = fn13(v, farmTarget.Name, bring.anchor.Position)
								local v7 = fn13(v, farmTarget.Name, farmTarget:GetAttribute("OldPosition") or humanoidRootPart.Position)
								local flag4 = v6

								if flag4 then
									flag4 = v7
								end

								if flag4 then
									flag4 = v6.key ~= v7.key
								end

								local flag5 = (humanoidRootPart.Position - bring.anchor.Position).Magnitude > distance

								if not flag4 then
									if not flag5 then
										local bringStuckKey = farmRegionState.key .. tostring(bring.anchor)

										if farmRegionState.bringStuckKey ~= bringStuckKey then
											farmRegionState.bringStuckKey = bringStuckKey
											farmRegionState.bringStuckAt = os.clock()
										elseif n10 <= os.clock() - farmRegionState.bringStuckAt then
											fn15(arg, farmRegionState, tbl68, v)
											farmRegionState.bringStuckKey = nil
											farmRegionState.bringStuckAt = nil
											return
										end

										farmRegionState.waitingSince = farmRegionState.waitingSince or os.clock()
										state.status = arg3 .. " | Waiting for gathered mob"
										return
									end
								end

								fn15(arg, farmRegionState, tbl68, v)
								state.status = arg3 .. " | Moving to next mob region"
								functions.TP(humanoidRootPart.CFrame + Vector3.new(0, 30, 0), arg3)
								return
							end
						end
					end
				end
			end

			if farmTarget then
				local humanoid = farmTarget:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = farmTarget:FindFirstChild("HumanoidRootPart")

				if state.farmTarget ~= farmTarget then
					state.farmTarget = farmTarget
					local humanoid2 = humanoid

					if humanoid2 then
						humanoid2 = humanoid.Health
					end

					state.farmTargetHealth = humanoid2 or nil
					state.farmTargetProgressAt = os.clock()
					local humanoidRootPart2 = humanoidRootPart

					if humanoidRootPart2 then
						humanoidRootPart2 = humanoidRootPart.Position
					end

					state.farmTargetLastPosition = humanoidRootPart2 or nil
					state.farmTargetOldPosition = farmTarget:GetAttribute("OldPosition") or state.farmTargetLastPosition
					local humanoidRootPart3 = humanoidRootPart

					if humanoidRootPart3 then
						humanoidRootPart3 = (humanoidRootPart.Position - character3.Position).Magnitude
					end

					state.farmApproachDistance = humanoidRootPart3 or nil
					state.farmApproachProgressAt = os.clock()
				end

				farmRegionState.waitingSince = nil
				farmRegionState.spawnCandidate = nil
				state.missingMobState = nil
				functions.ObserveFarmTarget(arg3, farmTarget.Name, true)
				functions.CombatTarget(farmTarget, arg3, { targetNames = fn(tbl68), bringRadius = distance, maxBringMembers = 10 })
				local bring = state.bring

				if bring then
					if bring.anchor then
						local count2 = getCount(arg, tbl68)

						state.farmCluster = {
							task = arg3,
							key = farmRegionState.key,
							position = bring.anchor.Position,
							count = count2,
							selectedAt = os.clock(),
						}

						state.farmClusterCount = count2
						state.farmClusterName = farmTarget.Name
					end
				end

				return
			end

			fn3(state, state.farmTargetRecovery or "searching")
			table.clear(arg.NearbyTargets)
			table.clear(arg.NearbyTargetParts)

			if type(functions.StopAttack) == "function" then
				functions.StopAttack()
			end

			if state.bring then
				if getCount(arg, tbl68) > 0 then
					functions.BringMob(state.bring.anchor, fn(tbl68), { scanRadius = distance, maxMembers = 10 }, nil)
					farmRegionState.waitingSince = farmRegionState.waitingSince or os.clock()
					state.status = arg3 .. " | Holding gathered pack"
					return
				end

				fn15(arg, farmRegionState, tbl68, v)
			end

			local v6 = fn(tbl68)[1]
			local v7 = functions.ObserveFarmTarget(arg3, v6, false)
			local flag4 = arg.IsSea(3)

			if flag4 then
				flag4 = arg.Level.Value >= 2600
			end

			if not flag4 then
				if v7 >= 200 then
					if os.clock() - (state.lastMissingHopAt or -120) >= 120 then
						state.lastMissingHopAt = os.clock()
						functions.RecordFarmRecovery("hop")
						functions.HopServer(nil, true)
						return
					end
				end
			end

			local tbl69 = {}

			for _, v8 in v do
				local farmDeadRegion = state.farmDeadRegions[v8.name]
				if farmRegionState.scanned[v8.key] then
					continue
				end

				if farmDeadRegion then
					if farmDeadRegion[v8.key] then
						continue
					end
				end

				tbl69[#tbl69 + 1] = v8
			end

			if #tbl69 > 0 then
				farmRegionState.waitingSince = nil
				farmRegionState.spawnCandidate = nil

				if not tbl69[farmRegionState.currentIndex] then
					farmRegionState.currentIndex = 1
				end

				local v8 = tbl69[farmRegionState.currentIndex]
				local cframe = v8.cframe + Vector3.new(0, 30, 30)
				state.status = arg3 .. " | Scanning mob region"
				state.lastFarmWaitSource = "arya-region-scan"
				state.lastFarmWaitSpawnIndex = farmRegionState.currentIndex
				state.lastFarmWaitSpawnCount = #tbl69
				functions.UpdateFarmWatchdog(arg3, "scanning", v8.name)
				functions.TP(cframe, arg3)

				if (cframe.Position - character3.Position).Magnitude <= distance2 then
					farmRegionState.scanned[v8.key] = true
					farmRegionState.currentIndex += 1
				end

				return
			end

			if #v == 0 then
				local v8 = fn(tbl68)[1]
				local v9 = v8

				if v9 then
					v9 = functions.SelectFarmWaitCFrame(arg3, v8, arg.MobSpawns[v8])
				end

				if typeof(v9) == "CFrame" then
					state.status = arg3 .. " | Waiting mob data"
					functions.TP(v9, arg3)
				else
					state.status = arg3 .. " | Spawn unavailable"
				end
			else
				farmRegionState.waitingSince = farmRegionState.waitingSince or os.clock()
				state.status = arg3 .. " | Waiting mob spawn"
				state.lastFarmWaitSource = "arya-spawn-wait"

				if n9 <= os.clock() - farmRegionState.waitingSince then
					table.clear(farmRegionState.scanned)
					farmRegionState.currentIndex = 1
					farmRegionState.waitingSince = os.clock()
				end
			end

			functions.UpdateFarmWatchdog(arg3, "waiting", v6)
			return
		end

		functions.StopTween()
	end
end

local tbl68

do
	local str = "Auto Farm Level"
	local beliTarget = 150000
	local n5 = 35

	local skipFloors = {
		{ maximumLevel = 19, targets = { "Sky Bandit", "Dark Master" } },
		{ maximumLevel = math.huge, targets = { "God's Guard" } },
	}

	local function fn(arg, arg2)
		local v = tbl13.decide({ sea = arg, level = arg2 })
		local skipFloor = v

		if skipFloor then
			skipFloor = v.skipFloor
		end

		skipFloor = skipFloor or nil
		local skipFloor2 = skipFloor
		local skipFloor3 = skipFloor

		if skipFloor3 then
			skipFloor3 = skipFloors[skipFloor]
		end

		return skipFloor2, skipFloor3 or nil
	end

	local function fn2(arg, targets)
		local tbl69 = {}

		for _, v in targets do
			tbl69[v] = true
		end

		local workspace_ = arg.Workspace or workspace
		local enemies = workspace_:FindFirstChild("Enemies")
		local enemies2 = enemies

		if enemies2 then
			enemies2 = enemies:GetChildren()
		end

		enemies2 = enemies2 or {}

		for _, v in enemies2 do
			if not tbl69[v.Name] then
				continue
			end

			if not arg.Functions.IsActiveEnemyModel(v, v.Name) then
				continue
			end
			return true, v.Name
		end

		return false, nil
	end

	local function fn3(arg)
		local configs = arg.Environment.Configs or {}
		local farmConfig = configs["Farm Config"] or {}
		if farmConfig["Skip Mode Hop"] ~= nil then
			return farmConfig["Skip Mode Hop"] == true
		end

		if configs.HopWhenIdle ~= nil then
			return configs.HopWhenIdle == true
		end
		return true
	end

	tbl68 = {
		shouldRun = function(arg)
			if ((arg.Environment.Configs or {})["Farm Config"] or {})["First Farm At Sky"] == true then
				if arg.IsSea(1) then
					local v = fn(1, tonumber(arg.Level.Value) or 0)
					return v ~= nil
				end
			end

			return false
		end,
		run = function(arg)
			if tbl68.shouldRun(arg) then
				local state = arg.State
				local now = os.clock()
				local levelRouteLevel = tonumber(arg.Level.Value) or 0
				local floor, v = fn(1, levelRouteLevel)

				if v then
					state.levelRouteMode = "skip-" .. tostring(floor)
					state.levelRouteLevel = levelRouteLevel
					state.levelRouteQuestKey = nil
					state.levelRouteMob = table.concat(v.targets, " | ")
					local v2, target = fn2(arg, v.targets)
					local skipMode = state.skipMode

					if not skipMode then
						local tbl69 = { floor = floor, startedAt = now }
						local now2 = v2

						if now2 then
							now2 = now
						end

						tbl69.lastTargetAt = now2 or nil

						if v2 then
						end

						tbl69.noTargetSince = now
						tbl69.hops = 0
						skipMode = tbl69
						state.skipMode = skipMode
					end

					if skipMode.floor ~= floor then
						skipMode.floor = floor
						local now2 = v2

						if now2 then
							now2 = now
						end

						skipMode.lastTargetAt = now2 or nil

						if v2 then
						end

						skipMode.noTargetSince = now
					end

					local beli = arg.Beli

					if beli then
						beli = tonumber(arg.Beli.Value)
					end

					skipMode.beli = beli or 0
					skipMode.beliTarget = beliTarget
					skipMode.target = target

					if v2 then
						skipMode.lastTargetAt = now
						skipMode.noTargetSince = nil
					else
						skipMode.noTargetSince = skipMode.noTargetSince or now
					end

					arg.Functions.FarmMob(v.targets, str)
					if v2 then
						state.status = string.format("Level Farming | Skip Mode | Floor %d | %s | Beli %d/%d", floor, target, skipMode.beli, beliTarget)
						return true
					end
					local num = tonumber((arg.Environment.Configs["Farm Config"] or {})["Skip Mode Hop Seconds"]) or n5
					local n6 = math.max(20, num)
					local elapsed = now - skipMode.noTargetSince
					state.status = string.format("Level Farming | Skip Mode | Floor %d | Waiting %.0fs/%ds", floor, elapsed, n6)
					if not (n6 <= elapsed) then
						return true
					end

					if not fn3(arg) then
						return true
					end

					if now - (skipMode.lastHopAt or -120) >= 30 then
						skipMode.lastHopAt = now
						skipMode.hops += 1
						skipMode.noTargetSince = now
						state.status = string.format("Level Farming | Skip Mode | Floor %d | Hopping for mobs", floor)
						arg.Functions.StopTween()
						arg.Functions.HopServer()
					end

					return true
				end

				state.skipMode = nil
				return false
			end

			arg.State.skipMode = nil
			return false
		end,
	}
end

local tbl69

do
	local tbl70 = {
		{
			["Fish Tail"] = { "Fishman Warrior", "Fishman Commando" },
			["Magma Ore"] = { "Military Soldier", "Military Spy" },
		},
		{
			["Magma Ore"] = { "Magma Ninja" },
			["Mystic Droplet"] = { "Water Fighter", "Sea Soldier" },
		},
		{
			["Fish Tail"] = { "Fishman Raider", "Fishman Captain" },
			["Dragon Scale"] = { "Dragon Crew Warrior", "Dragon Crew Archer" },
		},
	}

	local tbl71 = {
		[2] = {
			["Magma Ore"] = { name = "FireSideQuest", slot = 1 },
			["Mystic Droplet"] = { name = "ForgottenQuest", slot = 2 },
		},
		[3] = {
			["Fish Tail"] = { name = "DeepForestIsland3", slot = 1 },
			["Dragon Scale"] = { name = "DragonCrewQuest", slot = 1 },
		},
	}

	local tbl72 = { 0, 700, 1500 }

	local function fn(arg)
		for i = 1, 3 do
			if arg.IsSea(i) then
				return i
			end
		end
	end

	local function fn2(arg, arg2)
		local tbl73 = {}
		local v = fn(arg)

		for i = 1, 3 do
			if tbl70[i][arg2] then
				tbl73[#tbl73 + 1] = i
			end
		end

		table.sort(tbl73, function(arg3, arg4)
			local n5 = math.abs(arg3 - (v or arg3))
			local n6 = math.abs(arg4 - (v or arg4))
			if n5 == n6 then
				return arg3 > arg4
			end
			return n5 < n6
		end)

		return tbl73
	end

	local function fn3(arg, arg2)
		if arg == arg2 then
			return nil
		end

		if arg == 3 then
			return "TravelDressrosa"
		end

		if arg == 2 then
			local flag = arg2 == 1

			if flag then
				flag = "TravelMain"
			end

			return flag or "TravelZou"
		end

		return "TravelDressrosa"
	end

	local function fn4(arg, arg2, arg3)
		local tbl73 = {}

		for _, v in arg2 do
			tbl73[v] = true
		end

		local value = arg.Level.Value

		if arg3 then
			local questData = arg.State.questData or {}

			for _, v in questData do
				if v.quest_name ~= arg3.name then
					continue
				end

				if tonumber(v.quest_num) ~= arg3.slot then
					continue
				end

				if tonumber(v.level_req) then
					if not (v.level_req <= value) then
						continue
					end
					return v
				end
			end
		end

		local tbl74 = {}
		local enemies = workspace:FindFirstChild("Enemies")
		local enemies2 = enemies

		if enemies2 then
			enemies2 = enemies:GetChildren()
		end

		enemies2 = enemies2 or {}

		for _, v in enemies2 do
			if tbl73[v.Name] then
				if arg.Functions.IsActiveEnemyModel(v, v.Name) then
					tbl74[v.Name] = (tbl74[v.Name] or 0) + 1
				end
			end
		end

		local v = nil
		local n5 = -1
		local questData = arg.State.questData or {}

		for _, v2 in questData do
			if not tbl73[v2.mob_name] then
				continue
			end

			if not tonumber(v2.level_req) then
				continue
			end

			if not (v2.level_req <= value) then
				continue
			end
			local n6 = tbl74[v2.mob_name] or 0
			local flag = arg.State.materialQuestMob == v2.mob_name
			local flag2 = v

			if flag2 then
				flag2 = arg.State.materialQuestMob == v.mob_name
			end

			if v then
				if flag then
					if flag2 then
						if flag == flag2 then
							if n5 < n6 then
								v = v2
								n5 = n6
								continue
							end

							if flag ~= flag2 then
								continue
							end

							if n6 == n5 then
								if not (v.level_req < v2.level_req) then
									continue
								end
								v = v2
								n5 = n6
								continue
							end

							continue
						end

						if flag ~= flag2 then
							continue
						end

						if n6 == n5 then
							if not (v.level_req < v2.level_req) then
								continue
							end
							v = v2
							n5 = n6
							continue
						end

						continue
					end

					v = v2
					n5 = n6
					continue
				end

				if flag == flag2 then
					if n5 < n6 then
						v = v2
						n5 = n6
						continue
					end

					if flag ~= flag2 then
						continue
					end

					if n6 == n5 then
						if not (v.level_req < v2.level_req) then
							continue
						end
						v = v2
						n5 = n6
						continue
					end

					continue
				end

				if flag ~= flag2 then
					continue
				end

				if n6 == n5 then
					if not (v.level_req < v2.level_req) then
						continue
					end
					v = v2
					n5 = n6
					continue
				end

				continue
			end

			v = v2
			n5 = n6
			continue
		end

		return v
	end

	tbl69 = {
		run = function(arg, farmMaterial, arg2, arg3, arg4)
			local state = arg.State
			local str = arg2 or "Auto Farm Level"
			local taskQueue = arg.TaskQueue

			if taskQueue then
				taskQueue = arg.TaskQueue:top()
			end

			taskQueue = taskQueue or str
			local tbl73 = arg4

			if tbl73 then
				tbl73 = tbl70[arg4]
			end

			if tbl73 then
				tbl73 = tbl70[arg4][farmMaterial]
			end

			if tbl73 then
				tbl73 = { arg4 }
			end

			tbl73 = tbl73 or fn2(arg, farmMaterial)

			for _, v in tbl73 do
				local v2 = tbl70[v][farmMaterial]
				if not v2 then
					continue
				end

				if arg.IsSea(v) then
					local v3 = fn4
					local v4 = arg
					local v5 = v2
					local v6 = tbl71[v]

					if v6 then
						v6 = tbl71[v][farmMaterial]
					end

					local v7 = v3(v4, v5, v6)

					if not v7 then
						state.materialQuestName = nil
						state.materialQuestLevel = nil
						state.materialQuestMob = nil
						state.status = str .. " | " .. farmMaterial .. " | No matching quest"
						arg.Functions.FarmMob(v2, taskQueue, false, nil, arg3)
						return true
					end

					state.materialQuestName = v7.quest_name
					state.materialQuestLevel = v7.level_req
					state.materialQuestMob = v7.mob_name
					state.status = string.format("%s | %s | Quest %s", str, farmMaterial, v7.mob_name)
					if not arg.Functions.EnsureQuest(v7, taskQueue) then
						return true
					end
					arg.Functions.FarmMob(v2, taskQueue, false, nil, arg3)
					return true
				end

				if not (tbl72[v] <= arg.Level.Value) then
					continue
				end
				state.status = str .. " | Traveling for " .. farmMaterial

				if (state.nextMaterialTravelAt or 0) <= os.clock() then
					state.nextMaterialTravelAt = os.clock() + 5
					state.worldTravelOwner = "FarmMaterial:" .. farmMaterial
					state.worldTravelDestination = v
					state.worldTravelIssuedAt = os.clock()
					local v3 = fn3(fn(arg), v)

					if v3 then
						arg.CommandRemote:InvokeServer(v3)
					end
				end

				return true
			end

			state.status = str .. " | Unknown material: " .. tostring(farmMaterial)
			return false
		end,
		Mobs = tbl70,
		Quests = tbl71,
		selectQuest = fn4,
		materialSeaOrder = fn2,
		travelCommand = fn3,
	}
end

local tbl70

do
	local n5 = 500
	local n6 = 50
	local n7 = 10

	local function fn(arg)
		local match, v = tostring(arg or ""):match("^(%d+):(%d+)$")
		if match then
			return tonumber(match) * 60 + tonumber(v)
		end
		return 60
	end

	local function fn2(arg, dragonTalonBoneReserve)
		local v = table.pack(pcall(function()
			return arg.CommandRemote:InvokeServer("Bones", "Check")
		end))

		if v[1] then
			return {
				availableBones = tonumber(dragonTalonBoneReserve) or 0,
				checkValue = v[2],
				rewards = v[3],
				rollsRemaining = tonumber(v[4]) or 0,
				cooldown = tostring(v[5] or ""),
				maxRolls = tonumber(v[6]) or n7,
			}
		end

		return nil
	end

	local function fn3(arg)
		local material = arg.Inventory.Material

		if material then
			material = arg.Inventory.Material.Bones
		end

		local v = tonumber
		local material2 = material

		if material2 then
			material2 = material.Count or material.count or material.Amount or material.amount
		end

		return v(material2) or 0
	end

	local function fn4(arg)
		local n8 = tonumber(arg.LocalPlayer:GetAttribute("ExpBoostTick")) or 0
		local num = tonumber(arg.LocalPlayer:GetAttribute("ExpBoost"))

		if num then
			if num > 0 then
				if n8 > 0 then
					return math.max(0, num - math.max(0, tick() - n8))
				end
			end
		end

		return math.max(0, n8 - tick())
	end

	tbl70 = {
		run = function(arg)
			local state = arg.State
			state.expBoostRemaining = fn4(arg)

			if arg.IsSea(3) then
				local functions = arg.Functions or {}
				local carries = functions.Carries

				if state.fireEssenceDelivered ~= true then
					if type(carries) == "function" then
						if carries("Fire Essence") then
							state.boneRollBatchActive = false
							state.boneRollArmed = false
							state.boneRollSuppressedReason = "fire-essence-carried"
							state.dragonTalonBoneCyclePhase = "complete"
							return false
						end
					end

					local owns = functions.Owns
					local dragonTalonBoneReserve, lastDeathKingCheck, n8, availableBones, ok, result, ok2, n9, dragonTalonBoneCyclePhase

					if type(owns) == "function" then
						if not owns("Melee", "Dragon Talon") then
							if not owns("Moveset", "Dragon Talon") then
								state.boneRollSuppressedReason = nil
								dragonTalonBoneReserve = fn3(arg)
								state.dragonTalonBoneReserve = dragonTalonBoneReserve

								if not (n5 <= dragonTalonBoneReserve) then
									if dragonTalonBoneReserve < n6 then
										state.boneRollArmed = false
									end
								else
									if not state.boneRollArmed then
										state.boneRollBatchAttempts = 0
									end

									state.boneRollArmed = true
								end

								state.boneRollBatchActive = state.boneRollArmed == true

								if state.boneRollArmed then
									if not (dragonTalonBoneReserve < n6) then
										if os.clock() < (state.nextBoneRollAt or 0) then
											state.dragonTalonBoneCyclePhase = "rolling"
											return false
										end

										if os.clock() < (state.nextBoneBatchProbeAt or 0) then
											state.dragonTalonBoneCyclePhase = "level-cooldown"
											return false
										end
										lastDeathKingCheck = fn2(arg, dragonTalonBoneReserve)
										n8 = 260282146
										state.lastDeathKingCheck = lastDeathKingCheck

										if lastDeathKingCheck then
											if not (lastDeathKingCheck.rollsRemaining <= 0) then
												state.boneRollCooldownUntil = nil

												if not (lastDeathKingCheck.availableBones < n6) then
													if not (lastDeathKingCheck.rollsRemaining <= 0) then
														if os.clock() < (state.nextBoneRollAt or 0) then
															return false
														end
														state.nextBoneRollAt = os.clock() + 0.7
														availableBones = lastDeathKingCheck.availableBones

														ok, result = pcall(function()
															return arg.CommandRemote:InvokeServer("Bones", "Buy", 1, 1)
														end)

														ok2 = ok

														if ok2 then
															ok2 = tonumber(result) == 1
														end

														state.lastBoneRoll = {
															success = ok,
															result = tostring(result),
															before = availableBones,
															rollsBefore = lastDeathKingCheck.rollsRemaining,
															cooldown = lastDeathKingCheck.cooldown,
															accepted = ok2,
															at = os.clock(),
														}

														if ok2 then
															state.boneRollBatchAttempts = (state.boneRollBatchAttempts or 0) + 1
															state.status = string.format("Auto Farm Level | Bones roll %d/%d", state.boneRollBatchAttempts, n7)
															state.nextBoneRollAt = os.clock() + 0.7
															state.dragonTalonBoneCyclePhase = "rolling"
															return false
														end

														state.boneRollCooldownObserved = tostring(result)
														state.boneRollCooldownUntil = os.clock() + 60
														state.nextBoneBatchProbeAt = state.boneRollCooldownUntil
														state.dragonTalonBoneCyclePhase = "level-cooldown"
														return false
													end
												end

												state.nextBoneBatchProbeAt = os.clock() + 30
												state.dragonTalonBoneCyclePhase = "gather"
												return false
											end

											state.boneRollBatchAttempts = 0
											state.boneRollCooldownObserved = lastDeathKingCheck.cooldown
											n9 = math.max(5, fn(lastDeathKingCheck.cooldown) + 2)
											state.boneRollCooldownUntil = os.clock() + n9
											state.nextBoneBatchProbeAt = state.boneRollCooldownUntil
											state.dragonTalonBoneCyclePhase = "level-cooldown"
											return false
										end

										state.nextBoneBatchProbeAt = os.clock() + 10
										state.dragonTalonBoneCyclePhase = "probe-retry"
										return false
									end
								end

								dragonTalonBoneCyclePhase = os.clock() < (state.boneRollCooldownUntil or 0)

								if dragonTalonBoneCyclePhase then
									dragonTalonBoneCyclePhase = "level-cooldown"
								end

								dragonTalonBoneCyclePhase = dragonTalonBoneCyclePhase or "gather"
								state.dragonTalonBoneCyclePhase = dragonTalonBoneCyclePhase
								return false
							end
						end

						state.boneRollBatchActive = false
						state.boneRollArmed = false
						state.boneRollSuppressedReason = "dragon-talon-owned"
						state.dragonTalonBoneCyclePhase = "complete"
						return false
					end

					state.boneRollSuppressedReason = nil
					dragonTalonBoneReserve = fn3(arg)
					state.dragonTalonBoneReserve = dragonTalonBoneReserve

					if not (n5 <= dragonTalonBoneReserve) then
						if dragonTalonBoneReserve < n6 then
							state.boneRollArmed = false
						end
					else
						if not state.boneRollArmed then
							state.boneRollBatchAttempts = 0
						end

						state.boneRollArmed = true
					end

					state.boneRollBatchActive = state.boneRollArmed == true

					if state.boneRollArmed then
						if not (dragonTalonBoneReserve < n6) then
							if os.clock() < (state.nextBoneRollAt or 0) then
								state.dragonTalonBoneCyclePhase = "rolling"
								return false
							end

							if os.clock() < (state.nextBoneBatchProbeAt or 0) then
								state.dragonTalonBoneCyclePhase = "level-cooldown"
								return false
							end
							lastDeathKingCheck = fn2(arg, dragonTalonBoneReserve)
							n8 = 260282146
							state.lastDeathKingCheck = lastDeathKingCheck

							if lastDeathKingCheck then
								if not (lastDeathKingCheck.rollsRemaining <= 0) then
									state.boneRollCooldownUntil = nil

									if not (lastDeathKingCheck.availableBones < n6) then
										if not (lastDeathKingCheck.rollsRemaining <= 0) then
											if os.clock() < (state.nextBoneRollAt or 0) then
												return false
											end
											state.nextBoneRollAt = os.clock() + 0.7
											availableBones = lastDeathKingCheck.availableBones

											ok, result = pcall(function()
												return arg.CommandRemote:InvokeServer("Bones", "Buy", 1, 1)
											end)

											ok2 = ok

											if ok2 then
												ok2 = tonumber(result) == 1
											end

											state.lastBoneRoll = {
												success = ok,
												result = tostring(result),
												before = availableBones,
												rollsBefore = lastDeathKingCheck.rollsRemaining,
												cooldown = lastDeathKingCheck.cooldown,
												accepted = ok2,
												at = os.clock(),
											}

											if ok2 then
												state.boneRollBatchAttempts = (state.boneRollBatchAttempts or 0) + 1
												state.status = string.format("Auto Farm Level | Bones roll %d/%d", state.boneRollBatchAttempts, n7)
												state.nextBoneRollAt = os.clock() + 0.7
												state.dragonTalonBoneCyclePhase = "rolling"
												return false
											end

											state.boneRollCooldownObserved = tostring(result)
											state.boneRollCooldownUntil = os.clock() + 60
											state.nextBoneBatchProbeAt = state.boneRollCooldownUntil
											state.dragonTalonBoneCyclePhase = "level-cooldown"
											return false
										end
									end

									state.nextBoneBatchProbeAt = os.clock() + 30
									state.dragonTalonBoneCyclePhase = "gather"
									return false
								end

								state.boneRollBatchAttempts = 0
								state.boneRollCooldownObserved = lastDeathKingCheck.cooldown
								n9 = math.max(5, fn(lastDeathKingCheck.cooldown) + 2)
								state.boneRollCooldownUntil = os.clock() + n9
								state.nextBoneBatchProbeAt = state.boneRollCooldownUntil
								state.dragonTalonBoneCyclePhase = "level-cooldown"
								return false
							end

							state.nextBoneBatchProbeAt = os.clock() + 10
							state.dragonTalonBoneCyclePhase = "probe-retry"
							return false
						end
					end

					dragonTalonBoneCyclePhase = os.clock() < (state.boneRollCooldownUntil or 0)

					if dragonTalonBoneCyclePhase then
						dragonTalonBoneCyclePhase = "level-cooldown"
					end

					state.dragonTalonBoneCyclePhase = dragonTalonBoneCyclePhase or "gather"
					return false
				end

				state.boneRollBatchActive = false
				state.boneRollArmed = false
				state.boneRollSuppressedReason = "fire-essence-carried"
				state.dragonTalonBoneCyclePhase = "complete"
				return false
			end

			state.boneRollBatchActive = false
			state.boneRollArmed = false
			state.dragonTalonBoneCyclePhase = nil
			return false
		end,
		cooldownSeconds = fn,
	}
end

local tbl71

do
	local function fn(arg)
		local v = nil
		local v2 = arg
		local state = v2.State
		if os.clock() < (state.nextCakePrinceSpawnerAt or 0) then
			return
		end
		state.nextCakePrinceSpawnerAt = os.clock() + 5

		pcall(function()
			v2.CommandRemote:InvokeServer("CakePrinceSpawner")
		end)
	end

	local function fn2(arg, arg2)
		local material = arg.Inventory.Material

		if material then
			material = arg.Inventory.Material[arg2]
		end

		local v = tonumber
		local material2 = material

		if material2 then
			material2 = material.Count or material.count or material.Amount or material.amount
		end

		return v(material2) or 0
	end

	local function fn3(arg, arg2, arg3)
		local questData = arg.State.questData or {}

		for _, v in questData do
			if v.quest_name == arg2 then
				if v.quest_num == arg3 then
					local v2 = table.clone(v)
					v2.mob_pos = arg.Functions.ResolveMobCFrame(v2.mob_name, v2.mob_pos)
					return v2
				end
			end
		end

		return nil
	end

	local function fn4(arg, arg2, arg3, arg4)
		local functions = arg.Functions
		local state = arg.State
		local mobName = nil

		if arg3 then
			local v = fn3(arg, arg3, arg4)
			if not v then
				arg.State.status = "Auto Farm Level | Resource quest unavailable"
				return false
			end
			mobName = v.mob_name
			state.levelRouteMob = v.mob_name
			state.levelRouteQuestLevel = v.level_req
			if not functions.EnsureQuest(v, "Auto Farm Level") then
				return false
			end
		else
			state.levelRouteMob = arg2[1]
			state.levelRouteQuestLevel = nil
		end

		functions.FarmMob(arg2, "Auto Farm Level", false, nil, nil, true, mobName)
		return true
	end

	local function fn5(arg)
		local meleeTarget = arg.State.meleeTarget

		if meleeTarget then
			local Melee = arg.Functions.Owns("Melee", meleeTarget) or arg.Functions.Owns("Moveset", meleeTarget)

			local v = tbl9.decide({
				level = arg.Level.Value,
				fragments = arg.Fragments.Value,
				maximumLevel = tbl9.MaximumLevel,
				inRaidSea = arg.IsSea(2) or arg.IsSea(3),
				styleTarget = meleeTarget,
				styleTargetOwned = Melee == true,
			})

			local flag = v ~= nil

			if flag then
				flag = v.styleDeficit > 0
			end

			return flag
		end

		return false
	end

	local function fn6(arg, appliedLevelQuestKey)
		local state = arg.State
		if state.appliedLevelQuestKey == appliedLevelQuestKey then
			return
		end

		if type(arg.Functions.StopAttack) == "function" then
			pcall(arg.Functions.StopAttack)
		end

		if type(arg.Functions.ReleaseBring) == "function" then
			pcall(arg.Functions.ReleaseBring)
		end

		if type(arg.Functions.CancelTween) == "function" then
			pcall(arg.Functions.CancelTween)
		end

		state.farmTarget = nil
		state.farmTargetHealth = nil
		state.farmTargetProgressAt = nil
		state.farmCluster = nil
		state.farmClusterCount = 0
		state.farmClusterName = nil
		state.currentFarmMobName = nil
		state.attackTarget = nil
		state.attackTargetNames = nil
		state.attackTask = nil
		state.appliedLevelQuestKey = appliedLevelQuestKey
		state.levelRouteTargetResetReason = "quest-route-changed"
	end

	tbl71 = { run = function(arg)
		local functions = arg.Functions
		local state = arg.State
		local levelRouteLevel = arg.Level.Value
		if arg.TaskQueue:top() ~= "Auto Farm Level" then
			return
		end

		if functions.AutoFruitSniper() then
			return
		end

		if functions.AutoBoneBoost() then
			return
		end
		functions.AutoFruitPolicy()
		functions.AutoSetSpawn()
		if functions.AutoProgressionItems() then
			return
		end

		if functions.AutoFactory() then
			return
		end

		if type(functions.AutoMeleePurchaseMovement) == "function" then
			if functions.AutoMeleePurchaseMovement() == "busy" then
				return
			end
		end

		functions.AutoAbilities()
		local v = arg.IsSea(3)
		local levelRouteSea = v

		if levelRouteSea then
			levelRouteSea = 3
		end

		if not levelRouteSea then
			levelRouteSea = arg.IsSea(2)

			if levelRouteSea then
				levelRouteSea = 2
			end
		end

		state.levelRouteSea = levelRouteSea or 1
		if functions.SkipMode() then
			return
		end
		local bones = fn2(arg, "Bones")
		local hasSweetChalice = not not functions.Carries("Sweet Chalice")
		local flag = not not functions.Carries("God's Chalice")
		local flag2 = functions.Owns("Material", "Mirror Fractal") == true
		local conjuredCocoa = fn2(arg, "Conjured Cocoa")
		local decide = tbl13.decide
		local tbl72 = { sea = state.levelRouteSea, level = levelRouteLevel, bones = bones }
		local needsDragonTalonEssence = functions.NeedsDragonTalonEssence

		if needsDragonTalonEssence then
			needsDragonTalonEssence = functions.NeedsDragonTalonEssence()
		end

		tbl72.dragonTalonNeedsEssence = needsDragonTalonEssence
		tbl72.expBoostRemaining = state.expBoostRemaining
		tbl72.rollCooldownReady = os.clock() >= (state.boneRollCooldownUntil or 0)
		tbl72.hasSweetChalice = hasSweetChalice
		local v2 = decide(tbl72)

		if v2 then
			if v then
				if flag then
					if not flag2 then
						if conjuredCocoa < 10 then
							state.levelRouteMode = "cocoa"
							state.levelRouteMob = "Cocoa Warrior"
							state.levelRouteQuestLevel = 2300
							state.status = "Material Farming | Conjured Cocoa | Need 10x"
							functions.FarmMob({ "Cocoa Warrior", "Chocolate Bar Battler" }, "Auto Farm Level", false)
							return
						end
					end
				end
			end

			if v then
				if flag then
					if not flag2 then
						state.levelRouteMode = "sweet-chalice"
						state.status = "Material Farming | Sweet Chalice | Waiting for craft"
						return
					end
				end
			end

			if v2.farmCake == true then
				state.levelRouteMode = "cake-special"

				if hasSweetChalice then
					fn(arg)
				end

				fn4(arg, { "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker" }, v2.cakeQuestName, v2.cakeQuestNumber)
				return
			end

			if v2.farmBones == true then
				arg.SetNeedsMasteryFragments(fn5(arg))
				state.shouldFarmBones = true
				state.boneFarmReason = "arya-exp-expired"
				state.levelRouteMode = "bones-special"
				fn4(arg, { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy" }, v2.boneQuestName, v2.boneQuestNumber)
				return
			end

			arg.SetNeedsMasteryFragments(false)
			state.shouldFarmBones = false
			state.boneFarmReason = nil
			local quest, v3 = arg.ReadQuest()
			local select_ = tbl12.select
			local questData = state.questData
			local levelRouteLevel2 = levelRouteLevel
			local state2 = state
			local quest2 = quest

			if quest2 then
				quest2 = v3
			end

			local value = select_(questData, levelRouteLevel2, state2, quest2 or nil)

			if value then
				if levelRouteLevel < 10 then
					if arg.LocalPlayer.Team then
						if arg.LocalPlayer.Team.Name == "Marines" then
							value.mob_name = "Trainee"
							value.quest_name = "MarineQuest"
							value.quest_num = 1
						end
					end
				end

				value.mob_pos = functions.ResolveMobCFrame(value.mob_name, value.mob_pos)
				local levelRouteQuestKey = value.quest_name .. "\0" .. tostring(value.quest_num)
				fn6(arg, levelRouteQuestKey)
				state.levelRouteMode = "ordinary"
				state.levelRouteLevel = levelRouteLevel
				state.levelRouteQuestKey = levelRouteQuestKey
				state.levelRouteMob = value.mob_name
				state.levelRouteQuestLevel = value.level_req

				if functions.EnsureQuest(value, "Auto Farm Level") then
					functions.FarmMob({ value.mob_name }, "Auto Farm Level", false)
				end

				return
			end

			state.levelRouteMode = "ordinary-unavailable"
			state.levelRouteMob = nil
			state.levelRouteQuestLevel = nil
			state.status = "Auto Farm Level | Quest unavailable"
			return
		end

		state.status = "Auto Farm Level | Security route unavailable"
	end }
end

local tbl72

do
	local cframe = CFrame.new(1266.08923, 56.8099976, -1399.58081)

	local function fn(arg, arg2)
		local functions = arg.Functions

		if functions then
			if type(functions.IsTaskCurrent) == "function" then
				return functions.IsTaskCurrent(arg2)
			end
		end

		local state = arg.State or {}
		local flag = not state.stopped

		if flag then
			flag = not state.paused
		end

		if flag then
			flag = arg.TaskQueue:top() == arg2
		end

		return flag
	end

	local function getOk(arg, ...)
		local v = table.pack(...)

		return pcall(function()
			return arg.CommandRemote:InvokeServer(table.unpack(v, 1, v.n))
		end)
	end

	local function getSecondSeaProgress(arg, secondSeaProgressAt, arg2)
		local state = arg.State

		if not arg2 then
			if state.secondSeaProgress ~= nil then
				if secondSeaProgressAt - (state.secondSeaProgressAt or 0) < 1 then
					return state.secondSeaProgress
				end
			end
		end

		local dressrosaQuestProgress, secondSeaProgress = getOk(arg, "DressrosaQuestProgress")
		state.secondSeaProgressAt = secondSeaProgressAt

		if dressrosaQuestProgress then
			state.secondSeaProgress = secondSeaProgress
			state.lastSecondSeaProgressType = type(secondSeaProgress)
			state.lastSecondSeaError = nil
		else
			state.lastSecondSeaError = tostring(secondSeaProgress)
		end

		return state.secondSeaProgress
	end

	local function fn2(arg, arg2, arg3, arg4)
		local state = arg.State
		if arg2 < (state.nextSecondSeaHandshakeAt or 0) then
			return false
		end
		state.nextSecondSeaHandshakeAt = arg2 + 3
		local dressrosaQuestProgress, v = getOk(arg, "DressrosaQuestProgress", "Detective")
		local dressrosaQuestProgress2, v2 = getOk(arg, "DressrosaQuestProgress", "Detective")
		task.wait(1)

		if fn(arg, arg4) then
			local dressrosaQuestProgress3, v3 = getOk(arg, "DressrosaQuestProgress", "UseKey")
			state.secondSeaProgressAt = 0

			state.lastSecondSeaHandshake = {
				At = arg2,
				Phase = arg3,
				Detective1Ok = dressrosaQuestProgress,
				Detective1 = tostring(v),
				Detective2Ok = dressrosaQuestProgress2,
				Detective2 = tostring(v2),
				UseKeyOk = dressrosaQuestProgress3,
				UseKey = tostring(v3),
			}

			return true
		end

		state.lastSecondSeaHandshake = {
			At = arg2,
			Phase = arg3,
			Detective1Ok = dressrosaQuestProgress,
			Detective1 = tostring(v),
			Detective2Ok = dressrosaQuestProgress2,
			Detective2 = tostring(v2),
			Interrupted = true,
		}

		return false
	end

	tbl72 = {
		run = function(arg, arg2)
			local state = arg.State
			local functions = arg.Functions
			local str = arg2 or "Auto Second Sea"
			if arg.TaskQueue:top() ~= str then
				return false
			end
			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChildOfClass("Humanoid")
			end

			if not character2 then
				return true
			end

			if character2.Health <= 0 then
				return true
			end
			local now = os.clock()
			local secondSeaProgress = getSecondSeaProgress(arg, now)

			if fn(arg, str) then
				if type(secondSeaProgress) ~= "table" then
					state.status = "Auto Second Sea | Reading quest progress"
					return true
				end

				if secondSeaProgress.TalkedDetective then
					if secondSeaProgress.KilledIceBoss then
						state.secondSeaBossDefeated = true
						state.status = "Auto Second Sea | Travelling"
						if not ((state.nextSecondSeaTravelAt or 0) <= now) then
							return true
						end
						state.nextSecondSeaTravelAt = now + 8
						local travelDressrosa, v = getOk(arg, "TravelDressrosa")
						state.lastSecondSeaTravel = { At = now, Ok = travelDressrosa, Result = tostring(v) }

						if not travelDressrosa then
							state.lastSecondSeaError = tostring(v)
						end

						return true
					end

					state.status = "Auto Second Sea | Defeating Ice Admiral"
					fn2(arg, now, "ice-admiral", str)
					if not fn(arg, str) then
						return false
					end
					local liveBoss = functions.GetLiveBoss("Ice Admiral")

					if liveBoss then
						state.secondSeaSawBoss = true

						return functions.CombatTarget(liveBoss, str, {
							boss = true,
							preserveBring = true,
							destination = liveBoss.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0),
						})
					end

					functions.TP(cframe, str, true)
					return true
				end

				state.status = "Auto Second Sea | Talk To Detective"
				fn2(arg, now, "detective", str)
				return true
			end

			return false
		end,
		detectiveHandshake = fn2,
	}
end

local tbl73

do
	local str = "Auto Bartilo Quest"
	local cframe = CFrame.new(-456.28952, 73.0200958, 299.895966)
	local cframe2 = CFrame.new(2099.88159, 448.931, 648.997375)
	local cframe3 = CFrame.new(970.369446, 142.653198, 1217.3667)
	local cframe4 = CFrame.new(-1837.46155, 44.2921753, 1656.1987)
	local cframe5 = CFrame.new(-1836, 11, 1714)

	local tbl74 = {
		CFrame.new(-1850.49329, 13.1789551, 1750.89685),
		CFrame.new(-1858.87305, 19.3777466, 1712.01807),
		CFrame.new(-1803.94324, 16.5789185, 1750.89685),
		CFrame.new(-1858.55835, 16.8604317, 1724.79541),
		CFrame.new(-1869.54224, 15.987854, 1681.00659),
		CFrame.new(-1800.0979, 16.4978027, 1684.52368),
		CFrame.new(-1819.26343, 14.795166, 1717.90625),
		CFrame.new(-1813.51843, 14.8604736, 1724.79541),
	}

	local tbl75 = {
		level_req = 850,
		quest_name = "BartiloQuest",
		quest_num = 1,
		mob_name = "Swan Pirate",
		quest_pos = cframe,
		mob_pos = cframe3,
	}

	local function fn(arg)
		if type(arg) == "number" then
			return arg
		end

		if type(arg) ~= "table" then
			return nil
		end

		if arg.KilledBandits ~= true then
			return 0
		end

		if arg.KilledSpring ~= true then
			return 1
		end

		if arg.DidPlates ~= true then
			return 2
		end
		return 3
	end

	local function getBartiloProgress(arg, arg2)
		local state = arg.State
		local now = os.clock()

		if not arg2 then
			if now < (state.nextBartiloProgressAt or 0) then
				return state.bartiloProgress
			end
		end

		state.nextBartiloProgressAt = now + 2

		local ok, result = pcall(function()
			return arg.CommandRemote:InvokeServer("BartiloQuestProgress")
		end)

		if ok then
			state.bartiloProgress = tonumber(result) or result
			state.lastBartiloError = nil
		else
			state.lastBartiloError = tostring(result)
		end

		return state.bartiloProgress
	end

	local function getCharacter(arg)
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		local character3 = character

		if character3 then
			character3 = character:FindFirstChild("HumanoidRootPart")
		end

		local character4 = character2

		if character4 then
			character4 = character2.Health > 0
		end

		if character4 then
			character4 = character3
		end

		return character4 or nil
	end

	local function fn2(arg)
		local state = arg.State
		local character = getCharacter(arg)

		if character then
			if (state.bartiloPuzzlePhase or "approach") == "approach" then
				state.status = str .. " | Moving to puzzle"
				if (character.Position - cframe4.Position).Magnitude > 10 then
					arg.Functions.TP(cframe4, str, true)
					return true
				end
				arg.Functions.StopTween()
				character.CFrame = cframe5
				character.AssemblyLinearVelocity = Vector3.zero
				character.AssemblyAngularVelocity = Vector3.zero

				state.bartiloPuzzlePhase = "entry"
				state.bartiloPuzzleIndex = 1
				state.nextBartiloPuzzleStepAt = os.clock() + 0.5
				return true
			end

			if os.clock() < (state.nextBartiloPuzzleStepAt or 0) then
				return true
			end
			local n5 = math.clamp(tonumber(state.bartiloPuzzleIndex) or 1, 1, #tbl74)
			local cFrame = tbl74[n5]
			state.status = string.format("%s | Puzzle %d/%d", str, n5, #tbl74)
			arg.Functions.StopTween()
			character.CFrame = cFrame
			character.AssemblyLinearVelocity = Vector3.zero
			character.AssemblyAngularVelocity = Vector3.zero
			state.bartiloPuzzlePhase = "points"
			state.nextBartiloPuzzleStepAt = os.clock() + 1

			if n5 < #tbl74 then
				state.bartiloPuzzleIndex = n5 + 1
			else
				state.bartiloPuzzleIndex = 1
				state.bartiloPuzzlePhase = "approach"
				state.nextBartiloProgressAt = 0
				getBartiloProgress(arg, true)
			end

			return true
		end

		state.status = str .. " | Waiting character"
		return true
	end

	tbl73 = {
		run = function(arg)
			local state = arg.State
			if arg.TaskQueue:top() ~= str then
				return false
			end

			if arg.IsSea(2) then
				if not (arg.Level.Value < 850) then
					local bartiloProgress = getBartiloProgress(arg, false)
					if arg.TaskQueue:top() ~= str then
						return false
					end
					local bartiloStage = fn(bartiloProgress)
					state.bartiloStage = bartiloStage

					if bartiloStage == 3 then
						state.bartiloCompleted = true
						state.bartiloPuzzlePhase = nil
						state.status = str .. " | Complete"
						arg.TaskQueue:pop(str)
						return false
					end

					if bartiloStage == 0 then
						state.bartiloPuzzleIndex = 1
						state.bartiloPuzzlePhase = "approach"
						state.status = str .. " | Swan Pirates"

						if arg.Functions.EnsureQuest(tbl75, str) then
							if arg.TaskQueue:top() == str then
								arg.Functions.FarmMob({ "Swan Pirate" }, str)
							end
						end

						return true
					end

					if bartiloStage == 1 then
						state.bartiloPuzzleIndex = 1
						state.bartiloPuzzlePhase = "approach"
						local Jeremy = arg.Functions.GetLiveBoss("Jeremy")

						if Jeremy then
							state.bartiloJeremyMissingSince = nil
							state.status = str .. " | Jeremy"
							arg.Functions.CombatTarget(Jeremy, str, { boss = true, preserveBring = true })
							return true
						end

						local character = getCharacter(arg)
						state.bartiloJeremyMissingSince = state.bartiloJeremyMissingSince or os.clock()
						state.status = str .. " | Waiting Jeremy"

						if character then
							if (character.Position - cframe2.Position).Magnitude > 80 then
								arg.Functions.TP(cframe2, str, true)
							elseif os.clock() - state.bartiloJeremyMissingSince >= 60 then
								if (state.nextBartiloHopAt or 0) <= os.clock() then
									state.nextBartiloHopAt = os.clock() + 120
									arg.Functions.HopServer(nil, true)
								end
							end
						elseif os.clock() - state.bartiloJeremyMissingSince >= 60 then
							if (state.nextBartiloHopAt or 0) <= os.clock() then
								state.nextBartiloHopAt = os.clock() + 120
								arg.Functions.HopServer(nil, true)
							end
						end

						return true
					end

					if bartiloStage == 2 then
						return fn2(arg)
					end
					state.status = str .. " | Checking progress"
					state.nextBartiloProgressAt = 0
					return true
				end
			end

			arg.TaskQueue:pop(str)
			return false
		end,
		progressStage = fn,
	}
end

local tbl74

do
	local str = "Auto Saber"
	local distance = 20
	local n5 = 1
	local n6 = 5
	local distance2 = 90
	local n7 = 5
	local tbl75 = { X = -1612.55884, Y = 36.9774132, Z = 148.719543 }

	local function fn(arg)
		local functions = arg.Functions

		if functions then
			if type(functions.IsTaskCurrent) == "function" then
				return functions.IsTaskCurrent(str)
			end
		end

		local state = arg.State or {}
		local flag = not state.stopped

		if flag then
			flag = not state.paused
		end

		if flag then
			flag = arg.TaskQueue:top() == str
		end

		return flag
	end

	local function fn2(state)
		if state.taskProgressCache then
			state.taskProgressCache.proQuestProgress = nil
		end
	end

	local function fn3(arg, instance)
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		if not character2 then
			return false
		end

		if character2.Health <= 0 then
			return false
		end

		if instance then
			if instance:IsA("Tool") then
				if instance.Parent ~= character then
					character2:EquipTool(instance)
				end

				return instance.Parent == character
			end
		end

		return false
	end

	local function getInstance(instance)
		local instance2 = instance

		if instance2 then
			instance2 = instance:FindFirstChild("Button", true)
		end

		if instance2 then
			if instance2:IsA("BasePart") then
				return instance2
			end
		end

		return nil
	end

	local function fn4(arg)
		return tonumber(string.match(arg.Name, "%d+")) or math.huge
	end

	local function getSaberQuestPlates(arg)
		local map = workspace:FindFirstChild("Map")
		local map2 = map

		if map2 then
			map2 = map:FindFirstChild("Jungle")
		end

		local map3 = map2

		if map3 then
			map3 = map2:FindFirstChild("QuestPlates", true)
		end

		map3 = map3 or workspace:FindFirstChild("QuestPlates", true)

		if map3 then
			if arg.saberQuestPlatesRoot == map3 then
				if arg.saberQuestPlates then
					if #arg.saberQuestPlates == n6 then
						return arg.saberQuestPlates
					end
				end
			end

			local saberQuestPlates = {}

			for _, v in map3:GetChildren() do
				if getInstance(v) then
					saberQuestPlates[#saberQuestPlates + 1] = v
				end
			end

			table.sort(saberQuestPlates, function(arg2, arg3)
				local v = fn4(arg2)
				local v2 = fn4(arg3)
				if v == v2 then
					return arg2.Name < arg3.Name
				end
				return v < v2
			end)

			if #saberQuestPlates ~= n6 then
				arg.saberQuestPlatesRoot = nil
				arg.saberQuestPlates = nil
				return nil
			end

			arg.saberQuestPlatesRoot = map3
			arg.saberQuestPlates = saberQuestPlates
			arg.saberPlateIndex = 1
			arg.saberPlateSettledAt = nil
			return saberQuestPlates
		end

		arg.saberQuestPlatesRoot = nil
		arg.saberQuestPlates = nil
		return nil
	end

	local function getCframe()
		return CFrame.new(tbl75.X, tbl75.Y, tbl75.Z)
	end

	local function fn5(arg, state, cframe)
		local now = os.clock()

		if state.saberPlateStreamRequestedAt then
			if now - state.saberPlateStreamRequestedAt < n7 then
				return
			end
		end

		state.saberPlateStreamRequestedAt = now
		local localPlayer = arg.LocalPlayer

		if localPlayer then
			if type(localPlayer.RequestStreamAroundAsync) == "function" then
				task.spawn(function()
					pcall(function()
						localPlayer:RequestStreamAroundAsync(cframe.Position, n7)
					end)
				end)
			end
		end
	end

	local function fn6(arg)
		local state = arg.State
		local saberQuestPlates = getSaberQuestPlates(state)

		if saberQuestPlates then
			if #saberQuestPlates ~= 0 then
				state.saberPlateLoadAttempts = nil
				state.saberPlateStreamRequestedAt = nil
				local n8 = math.clamp(tonumber(state.saberPlateIndex) or 1, 1, #saberQuestPlates + 1)

				if #saberQuestPlates < n8 then
					state.saberPlateIndex = 1
					state.saberPlateSettledAt = nil
					fn2(state)
					return true
				end

				local instance = getInstance(saberQuestPlates[n8])
				local character = arg.LocalPlayer.Character
				local character2 = character

				if character2 then
					character2 = character:FindFirstChild("HumanoidRootPart")
				end

				if instance then
					if character2 then
						local v = nil
						local v2 = nil
						local v3 = nil
						local v4 = nil
						local v5 = nil
						state.status = ("Saber Quest | Quest Plates | Touching %d/%d"):format(n8, #saberQuestPlates)

						if distance < (character2.Position - instance.Position).Magnitude then
							state.saberPlateSettledAt = nil
							arg.Functions.TP(instance.CFrame, str, true)
							return true
						end

						local now = os.clock()
						state.saberPlateSettledAt = state.saberPlateSettledAt or now
						local v6 = n5
						if not (v6 <= now - state.saberPlateSettledAt) then
							return true
						end
						state.saberPlateIndex = n8 + 1
						state.saberPlateSettledAt = nil

						if #saberQuestPlates < state.saberPlateIndex then
							fn2(state)
						end

						return true
					end
				end

				state.saberQuestPlates = nil
				return true
			end
		end

		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChild("HumanoidRootPart")
		end

		if character2 then
			local cframe = getCframe()

			if distance2 < (character2.Position - cframe.Position).Magnitude then
				state.status = "Saber Quest | Moving to Jungle plates"
				state.saberPlateStreamRequestedAt = nil
				arg.Functions.TP(cframe, str, true)
				return true
			end

			fn5(arg, state, cframe)
			state.saberPlateLoadAttempts = (tonumber(state.saberPlateLoadAttempts) or 0) + 1
			state.status = ("Saber Quest | Loading quest plates | Retry %d"):format(state.saberPlateLoadAttempts)

			if state.saberPlateLoadAttempts % 10 == 0 then
				arg.Functions.TP(cframe, str, true)
			end

			return true
		end

		state.status = "Saber Quest | Waiting character"
		return true
	end

	local function fn7(arg, saberWaitingBoss)
		local functions = arg.Functions

		if functions.GetLiveBoss(saberWaitingBoss) then
			arg.State.saberWaitingBoss = nil
			functions.FarmBoss(saberWaitingBoss, str, false)
			return true
		end

		arg.State.saberWaitingBoss = saberWaitingBoss
		arg.State.status = str .. " | Waiting " .. saberWaitingBoss
		functions.FarmMob({ saberWaitingBoss }, str, false)
		return true
	end

	local function fn8(arg, arg2)
		local plates = arg2.Plates or {}

		for _, v in plates do
			if v == false then
				return 1
			end
		end

		if not arg2.UsedTorch then
			return 2
		end

		if arg2.UsedCup then
			if not arg2.TalkedSon then
				return 4
			end

			if arg2.KilledMob then
				if not arg2.UsedRelic then
					return 6
				end

				if not arg2.KilledShanks then
					if arg.Functions.GetLiveBoss("Saber Expert") then
						return 7
					end
				end

				return nil
			end

			return 5
		end

		return 3
	end

	tbl74 = {
		run = function(arg)
			if not fn(arg) then
				return false
			end
			local functions = arg.Functions
			local state = arg.State
			local taskProgress = functions.ReadTaskProgress(str, "proQuestProgress", 1, "ProQuestProgress")
			if type(taskProgress) ~= "table" then
				return false
			end

			if taskProgress.KilledShanks then
				state.saberAwaitingFinalBoss = nil

				if not state.saberProgressLoaded then
					if type(functions.LoadProgress) == "function" then
						functions.LoadProgress()
					else
						functions.RefreshInventory(true)
					end

					state.saberProgressLoaded = true
				end

				arg.TaskQueue:pop(str)
				return true
			end

			local v = fn8(arg, taskProgress)

			if v ~= 7 then
				state.saberAwaitingFinalBoss = nil
			end

			if v == 1 then
				return fn6(arg)
			end

			if v == 2 then
				state.status = "Saber Quest | Torch Puzzle | Using Torch"
				functions.TaskRequest(str, "get-torch", 1, "ProQuestProgress", "GetTorch")
				task.wait(1)

				if fn(arg) then
					functions.TaskRequest(str, "use-torch", 1, "ProQuestProgress", "DestroyTorch")
					fn2(state)
					return true
				end

				return false
			end

			if v == 3 then
				state.status = "Saber Quest | Sick Man | Helping with Cup"
				local Cup = functions.Carries("Cup")

				if not Cup then
					functions.TaskRequest(str, "get-cup", 1, "ProQuestProgress", "GetCup")
					task.wait(0.2)
					if not fn(arg) then
						return false
					end
					Cup = functions.Carries("Cup")
				end

				if Cup then
					if fn3(arg, Cup) then
						task.wait(1)
						if not fn(arg) then
							return false
						end
						functions.TaskRequest(str, "fill-cup", 1, "ProQuestProgress", "FillCup", Cup)
					end
				end

				functions.TaskRequest(str, "sick-man", 1, "ProQuestProgress", "SickMan")
				fn2(state)
				return true
			end

			if v == 4 then
				state.status = "Saber Quest | Rich Son | Getting Information"
				functions.TaskRequest(str, "rich-son", 1, "ProQuestProgress", "RichSon")
				fn2(state)
				return true
			end

			if v == 5 then
				state.status = "Saber Quest | Mob Leader | Defeating Boss"
				return fn7(arg, "Mob Leader")
			end

			if v == 6 then
				state.status = "Saber Quest | Relic | Placing at Location"
				functions.TaskRequest(str, "relic-reward", 1, "ProQuestProgress", "RichSon")
				functions.TaskRequest(str, "place-relic", 1, "ProQuestProgress", "PlaceRelic")
				fn2(state)
				return true
			end

			if v == 7 then
				state.status = "Saber Quest | Saber Expert | Final Battle"
				return fn7(arg, "Saber Expert")
			end
			state.saberAwaitingFinalBoss = true
			state.status = "Saber Quest | Waiting Saber Expert spawn"
			arg.TaskQueue:pop(str)
			return false
		end,
		farmBossIfAlive = fn7,
		stageFor = fn8,
		getQuestPlates = getSaberQuestPlates,
	}
end

local tbl75

do
	tbl75 = {
		MinimumFruitValue = 1000000,
		MaximumFruitValue = 2500000,
		FallbackOrder = {
			"Quake-Quake",
			"Buddha-Buddha",
			"Love-Love",
			"Spider-Spider",
			"Sound-Sound",
			"Phoenix-Phoenix",
			"Portal-Portal",
			"Rumble-Rumble",
			"Pain-Pain",
			"Blizzard-Blizzard",
			"Gravity-Gravity",
			"T-Rex-T-Rex",
			"Mammoth-Mammoth",
			"Dough-Dough",
			"Shadow-Shadow",
			"Venom-Venom",
			"Gas-Gas",
			"Spirit-Spirit",
			"Yeti-Yeti",
			"Tiger-Tiger",
			"Magnet-Magnet",
			"Kitsune-Kitsune",
			"Control-Control",
			"Dragon-Dragon",
		},
	}

	local function getStorageKey(arg, arg2)
		if type(arg2) ~= "table" then
			return nil
		end
		local storageKey = arg2.StorageKey or arg2.Name

		if not storageKey then
			storageKey = type(arg) == "string"

			if storageKey then
				storageKey = arg
			end

			storageKey = storageKey or nil
		end

		return storageKey
	end

	local function fn(arg)
		local flag = type(arg) == "table"

		if flag then
			flag = tonumber(arg.Count) or 0
		end

		return flag or 0
	end

	local function fn2(arg)
		if type(arg) ~= "table" then
			return nil
		end
		return tonumber(arg.Value) or tonumber(arg.Price) or tonumber(arg.Cost)
	end

	local function fn3(arg, arg2)
		local v = arg[arg2]
		if fn(v) > 0 then
			return arg2, v
		end

		for k, v2 in pairs(arg) do
			if getStorageKey(k, v2) == arg2 then
				if fn(v2) > 0 then
					return arg2, v2
				end
			end
		end
	end

	local function isEligible(...)
		local v = ...
		local v2 = fn2(v)
		local flag = v2 ~= nil

		if flag then
			flag = v2 >= tbl75.MinimumFruitValue
		end

		if flag then
			flag = v2 < tbl75.MaximumFruitValue
		end

		return flag
	end

	tbl75.selectFruit = function(arg, arg2)
		local tbl76 = arg or {}
		local v = ipairs
		local tbl77 = arg2 or {}

		for _, v2 in v(tbl77) do
			local v3, v4 = fn3(tbl76, v2)

			if v3 then
				if isEligible(v4) then
					return v3, "configured"
				end
			end
		end

		local tbl78 = {}

		for k, v2 in pairs(tbl76) do
			local storageKey = getStorageKey(k, v2)
			local v3 = fn2(v2)

			if storageKey then
				if fn(v2) > 0 then
					if isEligible(v2) then
						tbl78[#tbl78 + 1] = { id = storageKey, value = v3 }
					end
				end
			end
		end

		table.sort(tbl78, function(arg3, arg4)
			if arg3.value == arg4.value then
				return arg3.id < arg4.id
			end
			return arg3.value < arg4.value
		end)

		if tbl78[1] then
			return tbl78[1].id, "lowest-value"
		end

		for _, v2 in ipairs(tbl75.FallbackOrder) do
			local v3, v4 = fn3(tbl76, v2)

			if v3 then
				if isEligible(v4) then
					return v3, "fallback-order"
				end
			end
		end

		return nil
	end

	tbl75.isEligible = isEligible
end

local n5, n6, n7, n8, tbl76, cframe, distance, n9, n10, n11
local n12, n13, n14, fn, getOk, fn2, fn3, getInstance, fn4, getThirdSeaSharkmanProbeResult
local fn5

do
	n5 = nil
	n6 = nil
	n7 = nil
	n8 = nil
	tbl76 = {}
	cframe = CFrame.new(2293.7, 24.5, 663.1)
	distance = 90
	n9 = 10
	n10 = 10
	n11 = 30
	n12 = 2
	n13 = 60
	n14 = 10

	fn = function(arg, arg2)
		local functions = arg.Functions

		if functions then
			if type(functions.IsTaskCurrent) == "function" then
				return functions.IsTaskCurrent(arg2)
			end
		end

		local state = arg.State or {}
		local flag = not state.stopped

		if flag then
			flag = not state.paused
		end

		if flag then
			flag = arg.TaskQueue:top() == arg2
		end

		return flag
	end

	local tbl77 = {}

	for _, v in tbl75.FallbackOrder do
		tbl77[v] = true
	end

	getOk = function(arg, ...)
		local v = table.pack(...)

		return pcall(function()
			return arg.CommandRemote:InvokeServer(table.unpack(v, 1, v.n))
		end)
	end

	fn2 = function(arg)
		local fruitToUseForAutoThirdSea = arg.Environment.Configs["Fruit to use for auto third sea"] or {}
		local physicalMoveset = arg.Inventory.PhysicalMoveset or {}
		return tbl75.selectFruit(physicalMoveset, fruitToUseForAutoThirdSea)
	end

	fn3 = function(arg, arg2)
		local state = arg.State
		if state.flamingoAccess == true then
			return true
		end

		if not arg2 then
			if os.clock() < (state.nextUnlockablesAt or 0) then
				return false
			end
		end

		state.nextUnlockablesAt = os.clock() + 5
		local getUnlockables, v = getOk(arg, "GetUnlockables")

		if getUnlockables then
			if type(v) == "table" then
				state.flamingoAccess = v.FlamingoAccess == true
			end
		end

		return state.flamingoAccess == true
	end

	local function fn6(trevorLoadedFruit)
		local str = tostring(trevorLoadedFruit or "")

		for i = 1, #str do
			if str:sub(i, i) == "-" then
				local str2 = str:sub(1, i - 1)
				if str2 == str:sub(i + 1) then
					return str2 .. " Fruit"
				end
			end
		end

		return str .. " Fruit"
	end

	getInstance = function(arg, trevorLoadedFruit)
		local v = fn6(trevorLoadedFruit)

		for _, instance in { arg.LocalPlayer.Character, arg.LocalPlayer:FindFirstChildOfClass("Backpack") } do
			local instance3 = instance

			if instance3 then
				instance3 = instance:GetChildren()
			end

			instance3 = instance3 or {}

			for _, instance2 in instance3 do
				if not instance2:IsA("Tool") then
					continue
				end
				local flag = instance2.Name == v

				for _, attribute in { "StorageKey", "ItemId", "FruitId" } do
					flag = flag or instance2:GetAttribute(attribute) == trevorLoadedFruit
				end

				if not flag then
					continue
				end
				return instance2
			end
		end
	end

	fn4 = function(arg, trevorLoadedFruit)
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		local instance = getInstance(arg, trevorLoadedFruit)
		if not character2 then
			return false
		end

		if not (character2.Health <= 0) then
			if instance then
				if instance.Parent ~= character then
					character2:EquipTool(instance)
					task.wait(0.05)
				end

				return instance.Parent == character
			end
		end

		return false
	end

	getThirdSeaSharkmanProbeResult = function(arg, arg2)
		local state = arg.State
		local now = os.clock()

		if not arg2 then
			if now < (state.nextThirdSeaSharkmanProbeAt or 0) then
				return state.thirdSeaSharkmanProbeResult
			end
		end

		state.nextThirdSeaSharkmanProbeAt = now + 2
		local buySharkmanKarate, thirdSeaSharkmanProbeResult = getOk(arg, "BuySharkmanKarate", true)
		state.lastThirdSeaSharkmanProbe = { success = buySharkmanKarate, result = tostring(thirdSeaSharkmanProbeResult), at = now }

		if buySharkmanKarate then
			state.thirdSeaSharkmanProbeResult = thirdSeaSharkmanProbeResult

			if type(thirdSeaSharkmanProbeResult) == "number" then
				state.thirdSeaBlockedBySharkman = nil
			else
				state.thirdSeaBlockedBySharkman = true
				state.meleePrerequisite = "Sharkman Karate"
			end

			return thirdSeaSharkmanProbeResult
		end

		return nil
	end

	fn5 = function(instance)
		for _, attribute in { "StorageKey", "ItemId", "FruitId" } do
			local attribute2 = instance:GetAttribute(attribute)

			if type(attribute2) == "string" then
				if tbl77[attribute2] then
					return attribute2
				end
			end
		end

		local match = instance.Name:match("^%s*([^%s%-]+)")
		local match2 = match

		if match2 then
			match2 = match .. "-" .. match
		end

		match2 = match2 or nil
		local match3 = match2

		if match3 then
			match3 = tbl77[match2]
		end

		if match3 then
			match3 = match2
		end

		return match3 or nil
	end
end

local tbl77, tbl78, tbl79, tbl80, tbl81, tbl82, tbl83, tbl84, tbl85

do
	local n15, n16, n17, n18, n19, n20, n21, n22, styles, n23
	local tbl86, n24, delay, tbl87, godhumanMaterials, fn6, fn7, getInstance2, fn8, fn9
	local fn10, fn11, fn12, fn13, getResponse, getResponse2, getMoveset, getMoveset2, getPurchaseCFrames, fn14
	local fn15, fn16, fn17, fn18, getCharacter, fn19, getSharkmanUnlockProbeResult, fn20, fn21, fn22
	local fn23, fn24, fn25, fn26, fn27, fn28

	do
		local n25, n26, n27, n28
		local n29, n30, distance2, n31
		local fn29

		do
			do
				local function fn30(instance)
					if typeof(instance) ~= "Instance" then
						return nil, nil
					end

					if instance:IsA("Tool") then
						local handle = instance:FindFirstChild("Handle") or instance:FindFirstChildWhichIsA("BasePart")

						if handle then
							local v = fn5(instance)
							local handle2 = v

							if handle2 then
								handle2 = handle
							end

							return handle2 or nil, v
						end

						return nil, nil
					end

					return nil, nil
				end

				local function fn31(state)
					if state.trevorFruitAddedConnection then
						return
					end

					state.trevorFruitAddedConnection = workspace.ChildAdded:Connect(function(child)
						local trevorWorldFruitHandle, trevorWorldFruitStorageId = fn30(child)

						if trevorWorldFruitHandle then
							state.trevorWorldFruit = child
							state.trevorWorldFruitHandle = trevorWorldFruitHandle
							state.trevorWorldFruitStorageId = trevorWorldFruitStorageId
							state.trevorFruitDetectedAt = os.clock()
						end
					end)
				end

				local function fn32(character, state)
					n5 = 894614050
					n6 = 268831807
					local v = nil
					local v2 = nil
					local v3 = nil
					local magnitude2 = math.huge

					for _, v4 in workspace:GetChildren() do
						local v5, v6 = fn30(v4)
						local state2 = state

						if state2 then
							state2 = state.trevorFruitBlacklist
						end

						if state2 then
							state2 = state.trevorFruitBlacklist[v4]
						end

						state2 = state2 or 0
						if not v5 then
							continue
						end

						if state2 <= os.clock() then
							local magnitude = (v5.Position - character.Position).Magnitude

							if magnitude < magnitude2 then
								v = v4
								v2 = v5
								v3 = v6
								magnitude2 = magnitude
							end
						end
					end

					return v, v2, magnitude2, v3
				end

				local function getInstance3(arg, storageId)
					local character = arg.LocalPlayer.Character

					for _, instance in { arg.LocalPlayer:FindFirstChildOfClass("Backpack"), character } do
						local instance3 = instance

						if instance3 then
							instance3 = instance:GetChildren()
						end

						instance3 = instance3 or {}

						for _, instance2 in instance3 do
							if instance2:IsA("Tool") then
								if fn5(instance2) == storageId then
									return instance2
								end
							end
						end
					end
				end

				local function fn33(character, arg)
					if type(firetouchinterest) == "function" then
						firetouchinterest(character, arg, 0)
						task.wait(0.05)
						firetouchinterest(character, arg, 1)
					else
						character.CFrame = arg.CFrame
					end
				end

				local function fn34(arg, arg2)
					local state = arg.State
					fn31(state)
					local character = arg.LocalPlayer.Character
					local character2 = character

					if character2 then
						character2 = character:FindFirstChildOfClass("Humanoid")
					end

					local character3 = character

					if character3 then
						character3 = character:FindFirstChild("HumanoidRootPart")
					end

					if not character2 then
						return true
					end

					if character2.Health <= 0 then
						return true
					end

					if not character3 then
						return true
					end
					local now = os.clock()
					local trevorFruitCollection = state.trevorFruitCollection

					if trevorFruitCollection then
						local instance = getInstance3(arg, trevorFruitCollection.storageId)

						if instance then
							state.status = "Auto Trevor | Storing " .. trevorFruitCollection.storageId
							if not ((trevorFruitCollection.nextStoreAt or 0) <= now) then
								return true
							end
							trevorFruitCollection.nextStoreAt = now + 1
							trevorFruitCollection.storeAttempts = (trevorFruitCollection.storeAttempts or 0) + 1

							if arg.Functions.StoreFruit(instance) then
								state.lastTrevorFruitCollection = { id = trevorFruitCollection.storageId, success = true, attempts = trevorFruitCollection.touchAttempts, at = now }
								state.trevorFruitCollection = nil
								state.trevorFruitSearchStartedAt = nil
							elseif trevorFruitCollection.storeAttempts >= 3 then
								state.lastTrevorFruitCollection = { id = trevorFruitCollection.storageId, success = false, error = "store-retries-exhausted", at = now }
								state.trevorFruitCollection = nil
							end

							return true
						end

						local tool = trevorFruitCollection.tool
						local tool2 = tool

						if tool2 then
							tool2 = tool.Parent == workspace
						end

						if tool2 then
							tool2 = fn30(tool)
						end

						tool2 = tool2 or nil

						if tool2 then
							if (trevorFruitCollection.nextTouchAt or 0) <= now then
								if trevorFruitCollection.touchAttempts < 3 then
									trevorFruitCollection.touchAttempts += 1
									trevorFruitCollection.nextTouchAt = now + 0.75
									fn33(character3, tool2)
									return true
								end
							end
						end

						if not tool2 then
							if now - trevorFruitCollection.startedAt < 3 then
								return true
							end
						end

						if tool2 then
							if trevorFruitCollection.touchAttempts >= 3 then
								state.trevorFruitBlacklist = state.trevorFruitBlacklist or {}

								if tool then
									state.trevorFruitBlacklist[tool] = now + 30
								end

								state.lastTrevorFruitCollection = { id = trevorFruitCollection.storageId, success = false, error = "pickup-retries-exhausted", at = now }
								state.trevorFruitCollection = nil
							end
						else
							state.trevorFruitBlacklist = state.trevorFruitBlacklist or {}

							if tool then
								state.trevorFruitBlacklist[tool] = now + 30
							end

							state.lastTrevorFruitCollection = { id = trevorFruitCollection.storageId, success = false, error = "pickup-retries-exhausted", at = now }
							state.trevorFruitCollection = nil
						end
					end

					if (state.nextTrevorFruitScanAt or 0) <= now then
						state.nextTrevorFruitScanAt = now + 0.5
						local trevorWorldFruit, trevorWorldFruitHandle, trevorWorldFruitDistance, trevorWorldFruitStorageId = fn32(character3, state)
						state.trevorWorldFruit = trevorWorldFruit
						state.trevorWorldFruitHandle = trevorWorldFruitHandle
						state.trevorWorldFruitDistance = trevorWorldFruitDistance
						state.trevorWorldFruitStorageId = trevorWorldFruitStorageId
					end

					local trevorWorldFruit = state.trevorWorldFruit
					local trevorWorldFruitHandle = state.trevorWorldFruitHandle
					local trevorWorldFruitStorageId = state.trevorWorldFruitStorageId

					if trevorWorldFruit then
						if trevorWorldFruit.Parent == workspace then
							if trevorWorldFruitHandle then
								if trevorWorldFruitHandle.Parent then
									state.trevorFruitSearchStartedAt = now
									state.status = "Auto Trevor | Collecting " .. trevorWorldFruit.Name

									if (trevorWorldFruitHandle.Position - character3.Position).Magnitude > 6 then
										arg.Functions.TP(trevorWorldFruitHandle.CFrame, arg2, true, nil, true)
									else
										arg.Functions.CancelTween()

										state.trevorFruitCollection = {
											tool = trevorWorldFruit,
											storageId = trevorWorldFruitStorageId,
											touchAttempts = 1,
											nextTouchAt = now + 0.75,
											startedAt = now,
										}

										fn33(character3, trevorWorldFruitHandle)
									end

									return true
								end
							end
						end
					end

					state.trevorWorldFruit = nil
					state.trevorWorldFruitHandle = nil
					state.trevorWorldFruitStorageId = nil
					state.trevorFruitSearchStartedAt = state.trevorFruitSearchStartedAt or now
					state.trevorFruitSearchSeconds = now - state.trevorFruitSearchStartedAt
					state.trevorFruitHuntMode = "passive"
					return false
				end
			end

			do
				local function fn30(state)
					state.indraBranchStartedAt = nil
					state.nextZQuestBeginAt = nil
					state.nextIndraBranchHopAt = nil
				end

				local function fn31(arg)
					local state = arg.State
					local now = os.clock()
					state.indraBranchStartedAt = state.indraBranchStartedAt or now
					local elapsed = now - state.indraBranchStartedAt
					state.indraBranchSeconds = elapsed

					if not (n13 <= elapsed) then
						state.status = "Auto Third Sea | Starting quest"

						if (state.nextZQuestBeginAt or 0) <= now then
							state.nextZQuestBeginAt = now + n12
							arg.Functions.CancelTween()
							getOk(arg, "ZQuestProgress", "Begin")
						end

						return true
					end

					if (state.nextIndraBranchHopAt or 0) <= now then
						state.nextIndraBranchHopAt = now + n14
						state.status = "Auto Third Sea | Hopping for rip_indra"
						arg.Functions.StopTween()
						local v = arg.Functions.HopServer(nil, "third-sea-indra-timeout")
						state.lastIndraBranchHop = { success = v, seconds = elapsed, at = os.time() }

						if not v then
							state.indraBranchStartedAt = now - (n13 - n14)
						end
					end

					return true
				end

				tbl76.shouldTrevor = function(arg)
					if arg.IsSea(2) then
						if not (arg.Level.Value < 1100) then
							if fn3(arg, false) then
								arg.State.trevorSubmitted = nil
								arg.State.trevorLoadedFruit = nil
								return false
							end

							if arg.State.trevorSubmitted == true then
								return false
							end
							return arg.State.trevorLoadedFruit ~= nil or fn2(arg) ~= nil
						end
					end

					return false
				end

				tbl76.canSchedule = function(arg)
					if not arg.IsSea(2) then
						return false
					end

					if arg.Level.Value < 1500 then
						return false
					end

					if fn3(arg, false) then
						if arg.Functions.Carries then
							if arg.Functions.Carries("Water Key") then
								return false
							end
						end

						local thirdSeaSharkmanProbeResult = getThirdSeaSharkmanProbeResult(arg, false)
						return type(thirdSeaSharkmanProbeResult) == "number"
					end

					return false
				end

				tbl76.runTrevor = function(arg, arg2)
					n8 = 853322861
					local state = arg.State
					local str = arg2 or "Auto Trevor"
					if arg.TaskQueue:top() ~= str then
						return false
					end

					if fn3(arg, false) then
						state.trevorSubmitted = nil
						state.trevorLoadedFruit = nil
						arg.TaskQueue:pop(str)
						state.status = "Auto Trevor | Complete"
						return false
					end

					if not fn(arg, str) then
						return false
					end

					if state.trevorSubmitted == true then
						arg.TaskQueue:pop(str)
						state.status = "Auto Trevor | Waiting for Flamingo access"
						return false
					end

					local trevorLoadedFruit = state.trevorLoadedFruit or fn2(arg)

					if trevorLoadedFruit then
						if os.clock() < (state.nextTrevorAt or 0) then
							return true
						end

						if state.fruitStoreInFlight then
							if state.fruitStoreInFlight.id == trevorLoadedFruit then
								state.status = "Auto Trevor | Waiting for fruit storage handoff"
								state.nextTrevorAt = os.clock() + 0.5
								return true
							end
						end

						state.nextTrevorAt = os.clock() + 5
						state.status = "Auto Trevor | Loading " .. trevorLoadedFruit
						state.trevorFruitLocks = state.trevorFruitLocks or {}
						state.trevorFruitLocks[trevorLoadedFruit] = os.clock() + 30
						local loadFruit2 = true
						local str2 = "already-loaded"

						if getInstance(arg, trevorLoadedFruit) == nil then
							local loadFruit, v = getOk(arg, "LoadFruit", trevorLoadedFruit)
							loadFruit2 = loadFruit
							str2 = v
						end

						state.lastTrevorFruit = { name = trevorLoadedFruit, success = loadFruit2, result = tostring(str2), at = os.clock() }

						if loadFruit2 then
							state.trevorLoadedFruit = trevorLoadedFruit
							task.wait(0.2)
							if not fn(arg, str) then
								return true
							end

							if fn4(arg, trevorLoadedFruit) then
								if fn(arg, str) then
									state.status = "Auto Trevor | Talking"
									local flag = true

									for i = 1, 3 do
										if not fn(arg, str) then
											return true
										end

										if pcall(function()
											arg.CommandRemote:InvokeServer("TalkTrevor", tostring(i))
										end) then
											continue
										end
										flag = false
										break
									end

									if flag then
										task.wait(1)
										state.trevorSubmitted = true
										state.nextUnlockablesAt = 0
										if not fn(arg, str) then
											return true
										end
										fn3(arg, true)
									end

									local status

									if state.flamingoAccess ~= true then
										if state.trevorSubmitted ~= true then
											return true
										end
										state.trevorFruitLocks[trevorLoadedFruit] = nil
										state.trevorLoadedFruit = nil
										arg.TaskQueue:pop(str)
										status = state.flamingoAccess == true

										if status then
											status = "Auto Trevor | Complete"
										end

										status = status or "Auto Trevor | Submitted; waiting for access"
										state.status = status
									else
										state.trevorFruitLocks[trevorLoadedFruit] = nil
										state.trevorLoadedFruit = nil
										arg.TaskQueue:pop(str)
										status = state.flamingoAccess == true

										if status then
											status = "Auto Trevor | Complete"
										end

										state.status = status or "Auto Trevor | Submitted; waiting for access"
									end

									return true
								end

								return true
							end

							state.status = "Auto Trevor | Waiting to equip fruit"
							return true
						end

						state.trevorFruitLocks[trevorLoadedFruit] = nil
						state.trevorLoadedFruit = nil
						state.status = "Auto Trevor | Fruit load failed"
						return true
					end

					arg.TaskQueue:pop(str)
					return false
				end

				tbl76.run = function(arg, arg2)
					n7 = 1066291694
					local state = arg.State
					local str = arg2 or "Auto Third Sea"
					if arg.TaskQueue:top() ~= str then
						return false
					end

					if fn3(arg, false) then
						if not fn(arg, str) then
							return false
						end

						if arg.Functions.Carries then
							if arg.Functions.Carries("Water Key") then
								state.status = "Auto Third Sea | Handing off Water Key"
								arg.TaskQueue:pop(str)
								return false
							end
						end

						local thirdSeaSharkmanProbeResult = getThirdSeaSharkmanProbeResult(arg, false)

						if fn(arg, str) then
							if type(thirdSeaSharkmanProbeResult) ~= "number" then
								state.status = "Auto Third Sea | Waiting for Sharkman Karate"
								arg.TaskQueue:pop(str)
								return false
							end

							state.lockSpawnCheckpoint = nil
							local zQuestProgress, zQuestProgress2 = getOk(arg, "ZQuestProgress")
							if not fn(arg, str) then
								return false
							end

							if zQuestProgress then
								if type(zQuestProgress2) ~= "table" then
									if tonumber(zQuestProgress2) ~= nil then
										state.zQuestProgress = zQuestProgress2
									end
								else
									state.zQuestProgress = zQuestProgress2
								end
							end

							local zQuestProgress3 = state.zQuestProgress

							if tonumber(zQuestProgress3) == 1 then
								fn30(state)
								state.thirdSeaTravelReady = true
								state.status = "Auto Third Sea | Travelling"

								if (state.nextThirdSeaTravelAt or 0) <= os.clock() then
									state.nextThirdSeaTravelAt = os.clock() + n11
									arg.Functions.StopTween()
									getOk(arg, "TravelZou")
								end

								return true
							end

							if type(zQuestProgress3) == "table" then
								if zQuestProgress3.KilledIndraBoss then
									fn30(state)
									state.thirdSeaTravelReady = true
									state.status = "Auto Third Sea | Travelling"

									if (state.nextThirdSeaTravelAt or 0) <= os.clock() then
										state.nextThirdSeaTravelAt = os.clock() + n11
										arg.Functions.StopTween()
										getOk(arg, "TravelZou")
									end

									return true
								end
							end

							local ripIndra = arg.Functions.GetLiveBoss("rip_indra")

							if ripIndra then
								fn30(state)
								state.status = "Auto Third Sea | rip_indra"
								arg.Functions.CombatTarget(ripIndra, str, { boss = true, preserveBring = true })
								return true
							end

							local zQuestProgress4, v = getOk(arg, "ZQuestProgress", "Check")

							if fn(arg, str) then
								if zQuestProgress4 then
									if v == nil then
										fn30(state)
										local liveBoss = arg.Functions.GetLiveBoss("Don Swan")

										if not liveBoss then
											local character = arg.LocalPlayer.Character
											local character2 = character

											if character2 then
												character2 = character:FindFirstChildOfClass("Humanoid")
											end

											local character3 = character

											if character3 then
												character3 = character:FindFirstChild("HumanoidRootPart")
											end

											if character3 then
												if character2 then
													if not (character2.Health <= 0) then
														if distance < (character3.Position - cframe.Position).Magnitude then
															state.donSwanMissingSince = nil
															state.status = "Auto Third Sea | Moving to Don Swan"
															arg.Functions.TP(cframe, str, true)
															return true
														end

														state.donSwanMissingSince = state.donSwanMissingSince or os.clock()
														local elapsed = os.clock() - state.donSwanMissingSince

														if elapsed < n9 then
															state.status = string.format("Auto Third Sea | Streaming Don Swan (%.0fs/%ds)", elapsed, n9)
															arg.Functions.StopTween()
															return true
														end

														if not ((state.nextDonSwanHopAt or 0) <= os.clock()) then
															state.status = "Auto Third Sea | Waiting Don Swan hop"
															return true
														end
														state.nextDonSwanHopAt = os.clock() + n10
														state.status = "Auto Third Sea | Hopping for Don Swan"
														arg.Functions.StopTween()
														local v2 = arg.Functions.HopServer(nil, "third-sea-don-swan-missing")
														state.lastDonSwanHop = { success = v2, at = os.clock() }

														if not v2 then
															state.donSwanMissingSince = os.clock()
														end

														return true
													end
												end
											end

											state.status = "Auto Third Sea | Respawning for Don Swan"
											return true
										end

										state.donSwanMissingSince = nil
										state.status = "Auto Third Sea | Don Swan"
										arg.Functions.CombatTarget(liveBoss, str, { boss = true, preserveBring = true })
										return true
									end
								end

								return fn31(arg)
							end

							return false
						end

						return false
					end

					state.lockSpawnCheckpoint = nil
					arg.TaskQueue:pop(str)
					return false
				end
			end

			do
				local str = "Auto Yama"
				local n32 = 30
				local n33 = 2800

				local function getEliteProgress(arg)
					local state = arg.State
					local eliteProgress = tonumber(state.eliteProgress)

					if eliteProgress == nil then
						if (state.nextYamaProgressAt or 0) <= os.clock() then
							state.nextYamaProgressAt = os.clock() + 10

							local ok, result = pcall(function()
								return arg.CommandRemote:InvokeServer("EliteHunter", "Progress")
							end)

							if ok then
								eliteProgress = tonumber(result)
								state.eliteProgress = eliteProgress or state.eliteProgress
							end
						end
					end

					return tonumber(state.eliteProgress) or eliteProgress or 0
				end

				tbl77 = {
					shouldSchedule = function(arg)
						if not arg.IsSea(3) then
							return false
						end

						if not (arg.Level.Value < n33) then
							if not arg.Functions.Owns("Moveset", "Yama") then
								return getEliteProgress(arg) >= n32
							end
						end

						return false
					end,
					run = function(arg)
						local state = arg.State
						if arg.TaskQueue:top() ~= str then
							return false
						end

						if tbl77.shouldSchedule(arg) then
							if arg.TaskQueue:top() ~= str then
								return false
							end
							local map = workspace:FindFirstChild("Map")
							local map2 = map

							if map2 then
								map2 = map:FindFirstChild("Waterfall")
							end

							local map3 = map2

							if map3 then
								map3 = map2:FindFirstChild("SealedKatana")
							end

							local map4 = map3

							if map4 then
								map4 = map3:FindFirstChild("Hitbox")
							end

							local map5 = map4

							if map5 then
								map5 = map4:FindFirstChildOfClass("ClickDetector")
							end

							if map5 then
								state.status = "Auto Yama | Pulling sword"
								local character = arg.LocalPlayer.Character

								if character then
									character = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
								end

								if character then
									if (character.Position - map4.Position).Magnitude > 15 then
										arg.Functions.TP(map4.CFrame, str, true)
									elseif type(fireclickdetector) == "function" then
										fireclickdetector(map5)
									end
								elseif type(fireclickdetector) == "function" then
									fireclickdetector(map5)
								end

								return true
							end

							if map2 then
								state.status = "Auto Yama | Loading waterfall"
								arg.Functions.TP(map2:GetPivot(), str, true)
							end

							return true
						end

						arg.TaskQueue:pop(str)
						return false
					end,
					MAX_LEVEL = n33,
					REQUIRED_ELITES = n32,
				}
			end

			do
				local str = "Auto Tushita"
				local cframe2 = CFrame.new(5714, 20, 256)

				local function getOk2(arg, ...)
					local v = table.pack(...)

					return pcall(function()
						return arg.CommandRemote:InvokeServer(table.unpack(v, 1, v.n))
					end)
				end

				local function getTushitaProgress(arg, arg2)
					local state = arg.State
					local now = os.clock()

					if not arg2 then
						if now < (state.nextTushitaProgressAt or 0) then
							return state.tushitaProgress
						end
					end

					state.nextTushitaProgressAt = now + 3
					local tushitaProgress, tushitaProgress2 = getOk2(arg, "TushitaProgress")

					if tushitaProgress then
						if type(tushitaProgress2) == "table" then
							state.tushitaProgress = tushitaProgress2
							state.tushitaDoorOpened = tushitaProgress2.OpenedDoor == true
						end
					end

					return state.tushitaProgress
				end

				tbl78 = {
					shouldSchedule = function(arg)
						if not arg.IsSea(3) then
							return false
						end

						if arg.Level.Value < 2000 then
							return false
						end

						if not arg.Functions.Owns("Moveset", "Tushita") then
							if (getTushitaProgress(arg, false) or {}).OpenedDoor then
								return arg.Functions.GetLiveBoss("Longma") ~= nil
							end
							return arg.Functions.GetLiveBoss("rip_indra True Form") ~= nil
						end

						return false
					end,
					run = function(arg)
						local state = arg.State
						if arg.TaskQueue:top() ~= str then
							return false
						end

						if arg.IsSea(3) then
							if not (arg.Level.Value < 2000) then
								if not arg.Functions.Owns("Moveset", "Tushita") then
									local tushitaProgress = getTushitaProgress(arg, false) or {}
									if arg.TaskQueue:top() ~= str then
										return false
									end
									local liveBoss = arg.Functions.GetLiveBoss("rip_indra True Form")

									if not tushitaProgress.OpenedDoor then
										if liveBoss then
											state.status = "Auto Tushita | Lighting torches"
											local character = arg.LocalPlayer.Character

											if character then
												character = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
											end

											if character then
												if (character.Position - cframe2.Position).Magnitude > 15 then
													arg.Functions.TP(cframe2, str, true)
													return true
												end
											end

											if not arg.Functions.Carries("Holy Torch") then
												return true
											end

											for i = 1, 5 do
												if arg.TaskQueue:top() ~= str then
													return true
												end
												getOk2(arg, "TushitaProgress", "Torch", i)
											end

											state.nextTushitaProgressAt = 0
											state.tushitaProgress = nil
											return true
										end
									end

									local Longma = arg.Functions.GetLiveBoss("Longma")

									if tushitaProgress.OpenedDoor then
										if Longma then
											state.status = "Auto Tushita | Defeating Longma"
											return arg.Functions.CombatTarget(Longma, str, { boss = true, preserveBring = true })
										end
									end

									arg.TaskQueue:pop(str)
									return false
								end
							end
						end

						arg.TaskQueue:pop(str)
						return false
					end,
				}
			end

			do
				local str = "Pirate Raid"
				local vector = Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)

				local function getInstance3(character)
					local instance2 = nil
					local magnitude2 = nil
					local enemies = workspace:FindFirstChild("Enemies")
					local enemies2 = enemies

					if enemies2 then
						enemies2 = enemies:GetChildren()
					end

					enemies2 = enemies2 or {}

					for _, instance in enemies2 do
						local humanoid = instance:FindFirstChildOfClass("Humanoid")
						local humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")
						if not humanoid then
							continue
						end

						if not (humanoid.Health > 0) then
							continue
						end

						if not humanoidRootPart then
							continue
						end
						local magnitude = (humanoidRootPart.Position - character.Position).Magnitude
						if not ((humanoidRootPart.Position - vector).Magnitude < 500) then
							continue
						end

						if magnitude2 then
							if not (magnitude < magnitude2) then
								continue
							end
						end

						instance2 = instance
						magnitude2 = magnitude
					end

					return instance2
				end

				tbl79 = { run = function(arg)
					if arg.TaskQueue:top() ~= str then
						return false
					end
					local state = arg.State
					local character = arg.LocalPlayer.Character

					if character then
						character = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					end

					if character then
						local instance = getInstance3(character)
						if instance then
							state.status = "Pirate Raid | Defeating " .. instance.Name
							return arg.Functions.CombatTarget(instance, str, { preserveBring = true, bringRadius = 500 })
						end
						state.status = "Pirate Raid | Moving to Castle"
						arg.Functions.TP(CFrame.new(vector), str, true)
						return true
					end

					return true
				end }
			end

			do
				local str, tbl88, tbl89, fn30, getOk2

				do
					do
						str = "Tyrant Boss"

						tbl88 = {
							CFrame.new(-16335.1, 158.1, 1465.6),
							CFrame.new(-16288.6, 158.1, 1470.3),
							CFrame.new(-16258, 156.7, 1461.4),
							CFrame.new(-16212.4, 158.1, 1466.3),
							CFrame.new(-16335, 159.3, 1324.8),
							CFrame.new(-16286, 155.9, 1323.8),
							CFrame.new(-16250.3, 159.3, 1316.3),
						}

						tbl89 = {
							"Isle Outlaw",
							"Island Boy",
							"Isle Champion",
							"Sun-kissed Warrior",
							"Serpent Hunter",
							"Skull Slayer",
						}

						fn30 = function()
							local map = workspace:FindFirstChild("Map")
							local map2 = map

							if map2 then
								map2 = map:FindFirstChild("TikiOutpost")
							end

							local map3 = map2

							if map3 then
								map3 = map2:FindFirstChild("IslandModel")
							end

							if not map3 then
								return 0
							end
							local islandChunks = map3:FindFirstChild("IslandChunks")
							local islandChunks2 = islandChunks

							if islandChunks2 then
								islandChunks2 = islandChunks:FindFirstChild("E")
							end

							local tbl90 = {}
							local eye1 = map3:FindFirstChild("Eye1")
							local eye2 = map3:FindFirstChild("Eye2")
							local islandChunks3 = islandChunks2

							if islandChunks3 then
								islandChunks3 = islandChunks2:FindFirstChild("Eye3")
							end

							local islandChunks4 = islandChunks2

							if islandChunks4 then
								islandChunks4 = islandChunks2:FindFirstChild("Eye4")
							end

							tbl90[1] = eye1
							tbl90[2] = eye2
							tbl90[3] = islandChunks3
							tbl90[4] = islandChunks4
							local count = 0

							for _, v in tbl90 do
								if not v then
									continue
								end

								if v.Transparency == 0 then
									count += 1
									continue
								end
							end

							return count
						end
					end

					getOk2 = function(arg)
						local ok, result = pcall(function()
							return arg.CommandRemote:InvokeServer("BuyDeathStep", true)
						end)

						local ok2 = ok

						if ok2 then
							ok2 = result
						end

						return ok2 or nil
					end
				end

				tbl80 = { run = function(arg)
					if arg.TaskQueue:top() ~= str then
						return false
					end
					local state = arg.State

					if arg.IsSea(3) then
						if not (arg.Level.Value < 2400) then
							if not arg.Functions.Owns("Material", "Fire Feather") then
								if not arg.Functions.Owns("Moveset", "Death Step") then
									if type(getOk2(arg)) == "number" then
										state.status = "Tyrant Boss | Buying Death Step"

										pcall(function()
											arg.CommandRemote:InvokeServer("BuyDeathStep")
										end)

										return true
									end
								end

								local v = fn30()

								if v == 4 then
									local v2 = tbl88[1]
									local character = arg.LocalPlayer.Character

									if character then
										character = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
									end

									state.status = "Tyrant Boss | Collecting eyes"

									if character then
										if (character.Position - v2.Position).Magnitude > 15 then
											arg.Functions.TP(v2, str, true)
										elseif type(arg.Functions.SendKey) == "function" then
											arg.Functions.SendKey(({ "Z", "X", "C" })[math.random(1, 3)], 0.31)
										end
									elseif type(arg.Functions.SendKey) == "function" then
										arg.Functions.SendKey(({ "Z", "X", "C" })[math.random(1, 3)], 0.31)
									end

									return true
								end

								local liveBoss = arg.Functions.GetLiveBoss("Tyrant of the Skies")
								if liveBoss then
									state.status = "Tyrant Boss | Defeating boss"
									return arg.Functions.CombatTarget(liveBoss, str, { boss = true, preserveBring = true })
								end
								state.status = "Tyrant Boss | Defeating minions"
								return arg.Functions.FarmMob(tbl89, str, true, 2400)
							end
						end
					end

					arg.TaskQueue:pop(str)
					return false
				end }
			end

			do
				local n32, str
				local cframe2, cframe3, tbl88, getOk2, fn30, getCharacter2, fn31, fn32, fn33, fn34
				local fn35

				do
					local tbl89, fn36

					do
						local tbl90, tbl91

						do
							local tbl92

							do
								local n33, fn37

								do
									n33 = nil

									do
										n32 = nil
										str = "Auto Soul Guitar"
										cframe2 = CFrame.new(-8654, 140, 6167)
										cframe3 = CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)

										tbl88 = {
											"Ship Deckhand",
											"Ship Engineer",
											"Ship Steward",
											"Ship Officer",
										}

										tbl92 = {
											Placard1 = "Right",
											Placard2 = "Right",
											Placard3 = "Left",
											Placard4 = "Right",
											Placard5 = "Left",
											Placard6 = "Left",
											Placard7 = "Left",
										}

										tbl90 = {
											"Segment6",
											"Segment2",
											"Segment8",
											"Segment9",
											"Segment5",
										}

										tbl91 = {
											Segment1 = "Trophy1",
											Segment3 = "Trophy2",
											Segment4 = "Trophy3",
											Segment7 = "Trophy4",
											Segment10 = "Trophy5",
										}

										tbl89 = {
											Part1 = "Really black",
											Part2 = "Really black",
											Part3 = "Dusty Rose",
											Part4 = "Storm blue",
											Part5 = "Really black",
											Part6 = "Parsley green",
											Part7 = "Really black",
											Part8 = "Dusty Rose",
											Part9 = "Really black",
											Part10 = "Storm blue",
										}

										getOk2 = function(arg, ...)
											local v = table.pack(...)

											return pcall(function()
												return arg.CommandRemote:InvokeServer(table.unpack(v, 1, v.n))
											end)
										end

										fn37 = function(arg, arg2)
											local material = arg.Inventory.Material

											if material then
												material = arg.Inventory.Material[arg2]
											end

											local flag = type(material) == "table"

											if flag then
												flag = tonumber(material.Count)
											end

											if not flag then
												flag = material == true

												if flag then
													flag = 1
												end
											end

											return flag or 0
										end
									end

									fn30 = function()
										local Lighting = game:GetService("Lighting")
										local sky = Lighting:FindFirstChildOfClass("Sky")

										if sky then
											if sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
												return Lighting.ClockTime > 18 or Lighting.ClockTime < 5
											end
										end

										return false
									end

									fn36 = function(arg)
										if arg then
											if type(fireclickdetector) == "function" then
												fireclickdetector(arg)
												return true
											end
										end

										return false
									end
								end

								getCharacter2 = function(arg)
									local character = arg.LocalPlayer.Character
									local character2 = character

									if character2 then
										character2 = character:FindFirstChild("HumanoidRootPart")
									end

									return character2
								end

								fn31 = function(arg)
									local character = getCharacter2(arg)
									if not character then
										return true
									end
									local tbl93 = {}

									for _, part in game:GetService("CollectionService"):GetTagged("_ChestTagged"), nil do
										if part:IsA("BasePart") then
											if part.Name:find("Chest") then
												if part.CanTouch then
													table.insert(tbl93, { object = part, distance = (part.Position - character.Position).Magnitude })
												end
											end
										end
									end

									table.sort(tbl93, function(arg2, arg3)
										return arg2.distance < arg3.distance
									end)

									local state = arg.State
									state.soulGuitarChestCount = state.soulGuitarChestCount or 0

									if #tbl93 ~= 0 then
										if not (state.soulGuitarChestCount >= 20) then
											local object = tbl93[1].object
											state.status = ("Soul Guitar | Chest %d/20"):format(state.soulGuitarChestCount)

											if (character.Position - object.Position).Magnitude > 12 then
												arg.Functions.TP(object.CFrame, str, true)
											elseif type(firetouchinterest) == "function" then
												firetouchinterest(character, object, 0)
												firetouchinterest(character, object, 1)
												state.soulGuitarChestCount += 1
											end

											return true
										end
									end

									state.status = "Soul Guitar | Hopping for chests"
									arg.Functions.HopServer(nil, true)
									return true
								end

								fn32 = function(arg)
									n33 = 939675964
									if arg.Functions.Owns("Moveset", "Skull Guitar") then
										return nil
									end

									if not arg.Functions.Owns("Material", "Dark Fragment") then
										return 10
									end

									if fn37(arg, "Ectoplasm") < 250 then
										return 2
									end

									if arg.IsSea(3) then
										local guitarPuzzleProgress, soulGuitarProgress = getOk2(arg, "GuitarPuzzleProgress", "Check")
										if not guitarPuzzleProgress then
											return nil
										end
										arg.State.soulGuitarProgress = soulGuitarProgress
										if type(soulGuitarProgress) ~= "table" then
											return 8
										end

										if soulGuitarProgress.Swamp then
											if not soulGuitarProgress.Gravestones then
												return 4
											end

											if soulGuitarProgress.Ghost then
												if not soulGuitarProgress.Trophies then
													return 6
												end

												if soulGuitarProgress.Pipes then
													if not (fn37(arg, "Bones") >= 500) then
														return nil
													end
													return 9
												end

												return 7
											end

											return 5
										end

										return 3
									end

									return nil
								end
							end

							fn33 = function()
								local map = workspace:FindFirstChild("Map")
								local map2 = map

								if map2 then
									map2 = map:FindFirstChild("Haunted Castle")
								end

								if map2 then
									for k, name in tbl92 do
										local child = map2:FindFirstChild(k)
										local child2 = child

										if child2 then
											child2 = child:FindFirstChild(name)
										end

										local v = fn36
										local child3 = child2

										if child3 then
											child3 = child2:FindFirstChildOfClass("ClickDetector")
										end

										v(child3)
									end

									return true
								end

								return false
							end
						end

						fn34 = function()
							local map = workspace:FindFirstChild("Map")
							local map2 = map

							if map2 then
								map2 = map:FindFirstChild("Haunted Castle")
							end

							local map3 = map2

							if map3 then
								map3 = map2:FindFirstChild("Tablet")
							end

							local map4 = map2

							if map4 then
								map4 = map2:FindFirstChild("Trophies")
							end

							local map5 = map4

							if map5 then
								map5 = map4:FindFirstChild("Quest")
							end

							local map6 = map5

							if map3 then
								if map6 then
									for _, name in tbl90 do
										local child = map3:FindFirstChild(name)
										local child2 = child

										if child2 then
											child2 = child:FindFirstChild("Line")
										end

										local child3 = child

										if child3 then
											child3 = child:FindFirstChildOfClass("ClickDetector")
										end

										local count = 0

										while child2 do
											if math.abs(child2.Rotation.Z) > 0.1 then
												if count < 6 then
													fn36(child3)
													count += 1
													task.wait(0.1)
													continue
												end
											end

											break
										end
									end

									for k, name in tbl91 do
										local child = map3:FindFirstChild(k)
										local child2 = map6:FindFirstChild(name)
										local child3 = child2

										if child3 then
											child3 = child2:FindFirstChild("Handle")
										end

										local child4 = child

										if child4 then
											child4 = child:FindFirstChild("Line")
										end

										local child5 = child

										if child5 then
											child5 = child:FindFirstChildOfClass("ClickDetector")
										end

										if not child3 then
											continue
										end

										if not child4 then
											continue
										end

										if not child5 then
											continue
										end
										local part = tostring(child3.CFrame):split(", ")[4]
										local flag = part == "1" or part == "-1"

										if flag then
											flag = 90
										end

										flag = flag or 180
										local count = 0

										while math.abs(math.abs(child4.Rotation.Z) - flag) > 0.1 do
											if not (count < 6) then
												break
											end
											fn36(child5)
											count += 1
											task.wait(0.1)
										end
									end

									return true
								end
							end

							return false
						end
					end

					fn35 = function()
						n32 = 321550204
						local map = workspace:FindFirstChild("Map")
						local map2 = map

						if map2 then
							map2 = map:FindFirstChild("Haunted Castle")
						end

						local map3 = map2

						if map3 then
							map3 = map2:FindFirstChild("Lab Puzzle")
						end

						local map4 = map3

						if map4 then
							map4 = map3:FindFirstChild("ColorFloor")
						end

						local map5 = map4

						if map5 then
							map5 = map4:FindFirstChild("Model")
						end

						if not map5 then
							return false
						end

						for k, v in tbl89 do
							local child = map5:FindFirstChild(k)
							local child2 = child

							if child2 then
								child2 = child:FindFirstChildOfClass("ClickDetector")
							end

							local count = 0

							while child do
								if child.BrickColor.Name ~= v then
									if count < 8 then
										fn36(child2)
										count += 1
										task.wait(0.1)
										continue
									end
								end

								break
							end

							continue
						end

						return true
					end
				end

				tbl81 = { run = function(arg)
					if arg.TaskQueue:top() ~= str then
						return false
					end
					local state = arg.State
					local soulGuitarStage = fn32(arg)
					state.soulGuitarStage = soulGuitarStage

					if soulGuitarStage then
						if soulGuitarStage == 10 then
							if arg.IsSea(2) then
								local Darkbeard = arg.Functions.GetLiveBoss("Darkbeard")
								if Darkbeard then
									state.status = "Soul Guitar | Defeating Darkbeard"
									return arg.Functions.CombatTarget(Darkbeard, str, { boss = true, preserveBring = true })
								end

								if arg.Functions.Carries("Fist of Darkness") then
									local map = workspace:FindFirstChild("Map")
									local map2 = map

									if map2 then
										map2 = map:FindFirstChild("DarkbeardArena")
									end

									local map3 = map2

									if map3 then
										map3 = map2:FindFirstChild("Summoner")
									end

									local map4 = map3

									if map4 then
										map4 = map3:FindFirstChild("Detection")
									end

									state.status = "Soul Guitar | Summoning Darkbeard"
									local character = getCharacter2(arg)

									if map4 then
										if character then
											if (character.Position - map4.Position).Magnitude > 12 then
												arg.Functions.TP(map4.CFrame, str, true)
											else
												if not map4 then
													return true
												end

												if character then
													if type(firetouchinterest) == "function" then
														firetouchinterest(map4, character, 0)
														task.wait(0.2)
														firetouchinterest(map4, character, 1)
													end
												end
											end
										else
											if not map4 then
												return true
											end

											if character then
												if type(firetouchinterest) == "function" then
													firetouchinterest(map4, character, 0)
													task.wait(0.2)
													firetouchinterest(map4, character, 1)
												end
											end
										end
									else
										if not map4 then
											return true
										end

										if character then
											if type(firetouchinterest) == "function" then
												firetouchinterest(map4, character, 0)
												task.wait(0.2)
												firetouchinterest(map4, character, 1)
											end
										end
									end

									return true
								end

								return fn31(arg)
							end

							state.status = "Soul Guitar | Traveling for Dark Fragment"
							getOk2(arg, "TravelDressrosa")
							return true
						end

						if soulGuitarStage == 2 then
							if arg.IsSea(2) then
								state.status = "Soul Guitar | Farming Ectoplasm"
								return arg.Functions.FarmMob(tbl88, str, true)
							end
							state.status = "Soul Guitar | Traveling for Ectoplasm"
							getOk2(arg, "TravelDressrosa")
							return true
						end

						if soulGuitarStage == 8 then
							if fn30() then
								local character = arg.LocalPlayer.Character

								if character then
									character = arg.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
								end

								if not character then
									getOk2(arg, "gravestoneEvent", 2, true)
									return true
								end

								if (character.Position - cframe2.Position).Magnitude > 5 then
									arg.Functions.TP(cframe2, str, true)
								else
									getOk2(arg, "gravestoneEvent", 2, true)
								end

								return true
							end

							state.status = "Soul Guitar | Waiting full moon"
							return true
						end

						if soulGuitarStage == 3 then
							state.status = "Soul Guitar | Swamp zombies"
							return arg.Functions.FarmMob({ "Living Zombie" }, str, true)
						end

						if soulGuitarStage == 4 then
							state.status = "Soul Guitar | Gravestones"
							local cframe4 = CFrame.new(-8800, 178, 6033)
							local character = getCharacter2(arg)

							if not character then
								fn33()
								state.nextSoulGuitarRefreshAt = os.clock() + 1
								return true
							end

							if (character.Position - cframe4.Position).Magnitude > 10 then
								arg.Functions.TP(cframe4, str, true)
							else
								fn33()
							end
						elseif soulGuitarStage == 5 then
							state.status = "Soul Guitar | Ghost"
							getOk2(arg, "GuitarPuzzleProgress", "Ghost")
						elseif soulGuitarStage == 6 then
							state.status = "Soul Guitar | Trophies"
							local character = getCharacter2(arg)

							if not character then
								fn34()
								state.nextSoulGuitarRefreshAt = os.clock() + 1
								return true
							end

							if (character.Position - cframe3.Position).Magnitude > 10 then
								arg.Functions.TP(cframe3, str, true)
							else
								fn34()
							end
						elseif soulGuitarStage == 7 then
							state.status = "Soul Guitar | Pipes"
							fn35()
							getOk2(arg, "soulGuitarBuy")
						elseif soulGuitarStage == 9 then
							state.status = "Soul Guitar | Buying"
							getOk2(arg, "soulGuitarBuy")
						end

						state.nextSoulGuitarRefreshAt = os.clock() + 1
						return true
					end

					arg.TaskQueue:pop(str)
					return false
				end }
			end

			do
				local n32, n33, n34, n35, n36, n37, n38, cframe2, n39
				local n40, n41, n42, fn30, fn31

				do
					local fn32, fn33

					do
						local fn34

						do
							do
								do
									local n43

									do
										n32 = nil
										n33 = nil
										n34 = nil
										n35 = nil
										n36 = nil
										n37 = nil
										n38 = nil
										cframe2 = CFrame.new(428.35, 208.86, -429.03)
										n39 = 480
										n43 = 75
										n40 = 4
										n41 = 12
										n42 = 20

										fn32 = function(text)
											local str = tostring(text or ""):lower()
											if str:find("factory", 1, true) then
												return str:find("30", 1, true) ~= nil or str:find("breach", 1, true) ~= nil
											end
											local str2 = "máy"
											local flag = str:find("30", 1, true) ~= nil

											if flag then
												flag = str:find(str2, 1, true) ~= nil
											end

											return flag
										end
									end

									tbl82 = { markWarning = function(arg, factorySignal, arg2)
										local now = os.clock()
										arg.factoryWarningAt = now
										arg.factoryWarningUntil = now + n43
										arg.factorySignal = factorySignal
										arg.factorySignalText = tostring(arg2 or "")
										arg.factoryActive = true
										arg.nearbyPlayerSamples = {}
									end }
								end

								fn34 = function(connection)
									if connection then
										pcall(connection.Disconnect, connection)
									end
								end
							end

							fn33 = function(factoryWatcherSession, arg)
								fn34(factoryWatcherSession.textConnections[arg])
								fn34(factoryWatcherSession.destroyConnections[arg])
								factoryWatcherSession.textConnections[arg] = nil
								factoryWatcherSession.destroyConnections[arg] = nil
							end
						end

						fn30 = function(state)
							local factoryWatcherSession = state.factoryWatcherSession
							state.factoryWatcherSession = nil
							state.factoryWatchersReady = nil
							state.factoryWatcherCleanup = nil

							if factoryWatcherSession then
								fn34(factoryWatcherSession.added)
								fn34(factoryWatcherSession.removing)
								fn34(factoryWatcherSession.enemyAdded)

								for k in factoryWatcherSession.textConnections do
									fn33(factoryWatcherSession, k)
								end

								state.factoryNotificationConnection = nil
								state.factoryEnemyConnection = nil
								state.factoryTextConnections = nil
								return
							end

							fn34(state.factoryNotificationConnection)
							fn34(state.factoryEnemyConnection)
							local factoryTextConnections = state.factoryTextConnections or {}

							for _, v in factoryTextConnections do
								fn34(v)
							end

							state.factoryNotificationConnection = nil
							state.factoryEnemyConnection = nil
							state.factoryTextConnections = nil
						end
					end

					local function fn34(state, factoryWatcherSession)
						n32 = 823890284
						local flag = not state.stopped

						if flag then
							flag = state.factoryWatcherSession == factoryWatcherSession
						end

						return flag
					end

					local function fn35(state, factoryWatcherSession, instance)
						if not instance:IsA("TextLabel") then
							if not instance:IsA("TextButton") then
								return
							end
						end

						if not fn34(state, factoryWatcherSession) then
							return
						end

						if not factoryWatcherSession.textConnections[instance] then
							if instance:IsDescendantOf(factoryWatcherSession.stack) then
								local function fn36()
									if not fn34(state, factoryWatcherSession) then
										return
									end

									if instance:IsDescendantOf(factoryWatcherSession.stack) then
										if fn32(instance.Text) then
											tbl82.markWarning(state, "notification", instance.Text)
										end
									end
								end

								fn36()
								factoryWatcherSession.textConnections[instance] = instance:GetPropertyChangedSignal("Text"):Connect(fn36)

								factoryWatcherSession.destroyConnections[instance] = instance.Destroying:Connect(function()
									fn33(factoryWatcherSession, instance)
								end)
							end
						end
					end

					fn31 = function(arg)
						local state = arg.State
						local playerGui = arg.LocalPlayer:FindFirstChildOfClass("PlayerGui")
						local playerGui2 = playerGui

						if playerGui2 then
							playerGui2 = playerGui:FindFirstChild("Notifications")
						end

						local playerGui3 = playerGui2

						if playerGui3 then
							playerGui3 = playerGui2:FindFirstChild("NotificationStack")
						end

						local enemies = workspace:FindFirstChild("Enemies")
						local factoryWatcherSession = state.factoryWatcherSession

						if factoryWatcherSession then
							if factoryWatcherSession.stack == playerGui3 then
								if factoryWatcherSession.enemies == enemies then
									return
								end
							end
						end

						fn30(state)
						local factoryWatcherSession2 = { stack = playerGui3, enemies = enemies, textConnections = {}, destroyConnections = {} }
						state.factoryWatcherSession = factoryWatcherSession2
						state.factoryTextConnections = factoryWatcherSession2.textConnections
						local factoryWatchersReady = playerGui3 ~= nil

						if factoryWatchersReady then
							factoryWatchersReady = enemies ~= nil
						end

						state.factoryWatchersReady = factoryWatchersReady

						state.factoryWatcherCleanup = function()
							fn30(state)
						end

						if playerGui3 then
							for _, v in playerGui3:GetDescendants() do
								fn35(state, factoryWatcherSession2, v)
								continue
							end

							factoryWatcherSession2.added = playerGui3.DescendantAdded:Connect(function(descendant)
								fn35(state, factoryWatcherSession2, descendant)
							end)

							factoryWatcherSession2.removing = playerGui3.DescendantRemoving:Connect(function(descendant)
								fn33(factoryWatcherSession2, descendant)
							end)

							state.factoryNotificationConnection = factoryWatcherSession2.added
						end

						if enemies then
							factoryWatcherSession2.enemyAdded = enemies.ChildAdded:Connect(function(child)
								if fn34(state, factoryWatcherSession2) then
									if child.Name ~= "Core" then
										if child.Name:match("^Core%s") then
											tbl82.markWarning(state, "core-added", child.Name)
										end
									else
										tbl82.markWarning(state, "core-added", child.Name)
									end
								end
							end)

							state.factoryEnemyConnection = factoryWatcherSession2.enemyAdded
						end
					end
				end

				local function getInstance3()
					n36 = 234826974
					local enemies = workspace:FindFirstChild("Enemies")
					if not enemies then
						return nil
					end

					for _, instance in enemies:GetChildren() do
						if instance.Name ~= "Core" then
							if not instance.Name:match("^Core%s") then
								continue
							end
						end

						local humanoid = instance:FindFirstChildOfClass("Humanoid")
						local humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")
						if not humanoid then
							continue
						end

						if humanoid.Health > 0 then
							if humanoidRootPart then
								return instance
							end
							continue
						end

						continue
					end
				end

				local function getMap()
					local map = workspace:FindFirstChild("Map")
					local map2 = map

					if map2 then
						map2 = map:FindFirstChild("Dressrosa")
					end

					local map3 = map2

					if map3 then
						map3 = map2:FindFirstChild("SmileFactory")
					end

					local map4 = map3

					if map4 then
						map4 = map3:FindFirstChild("Door")
					end

					local map5 = map4

					if map5 then
						map5 = not map4.CanCollide or map4.Transparency >= 0.95
					end

					return map5
				end

				local function getInstances(arg)
					n37 = 30646336
					n38 = 159306366
					local instances = {}
					local localPlayer = arg.LocalPlayer
					local character = localPlayer.Character

					for _, instance in { localPlayer:FindFirstChildOfClass("Backpack"), character } do
						local instance3 = instance

						if instance3 then
							instance3 = instance:GetChildren()
						end

						instance3 = instance3 or {}

						for _, instance2 in instance3 do
							if instance2:IsA("Tool") then
								if instance2.Name:match("Fruit$") then
									instances[instance2] = true
								end
							end
						end
					end

					return instances
				end

				local function getInstance4(arg, instances)
					n35 = 158836972
					local localPlayer = arg.LocalPlayer
					local character = localPlayer.Character
					local instance3

					for _, instance in { localPlayer:FindFirstChildOfClass("Backpack"), character } do
						local instance4 = instance

						if instance4 then
							instance4 = instance:GetChildren()
						end

						instance4 = instance4 or {}
						local exitTo = nil

						for _, instance2 in instance4 do
							instance3 = instance2
							if not instance2:IsA("Tool") then
								continue
							end

							if not instance2.Name:match("Fruit$") then
								continue
							end

							if not instances then
								exitTo = 1
								break
							end

							if not instances[instance2] then
								exitTo = 1
								break
							end
						end

						if exitTo == 1 then
							return instance3
						end
					end

					return nil
				end

				local function fn32(arg)
					n33 = 476705625
					n34 = 503219697
					local state = arg.State
					state.factoryRewardUntil = nil
					state.factoryFruitSnapshot = nil
					state.factoryWarningUntil = nil
					state.factorySignal = nil
					state.factoryActive = false
					state.factoryCoreLastSeenAt = nil
					arg.Functions.StopTween()
				end

				tbl82.run = function(arg)
					local state = arg.State

					if not state.stopped then
						if arg.IsSea(2) then
							fn31(arg)
							local now = os.clock()
							local instance = getInstance3()

							if instance then
								if not state.factoryCoreAlive then
									state.factoryFruitSnapshot = getInstances(arg)
								end

								state.factoryCoreAlive = true
								state.factoryRewardUntil = nil
								state.factoryActive = true
								state.factoryCoreLastSeenAt = now
								state.status = "Auto Farm Level | Factory: attacking Core"
								return arg.Functions.CombatTarget(instance, "Auto Farm Level", { boss = true, preserveBring = true })
							end

							if state.factoryCoreAlive then
								state.factoryCoreAlive = false
								state.factoryCompletedAt = now
								state.factoryRewardUntil = now + n41
								state.factoryWarningUntil = nil
							end

							if state.factoryRewardUntil then
								if state.factoryRewardUntil <= now then
									state.factoryRewardHandledAt = now
									fn32(arg)
									return true
								end

								local instance2 = getInstance4(arg, state.factoryFruitSnapshot)

								if instance2 then
									state.status = "Auto Farm Level | Factory: storing " .. instance2.Name
									local v = arg.Functions.StoreFruit(instance2)
									state.factoryRewardFruit = instance2.Name
									state.factoryRewardStored = v == true

									if v then
										state.factoryRewardHandledAt = now
										fn32(arg)
									else
										state.factoryActive = true
										state.nearbyPlayerSamples = {}
										state.lastIdlingAt = os.time()
										state.lastIdleProgressKind = "factory-reward"
									end

									return true
								end

								if now < state.factoryRewardUntil then
									state.factoryActive = true
									state.nearbyPlayerSamples = {}
									state.lastIdlingAt = os.time()
									state.lastIdleProgressKind = "factory-reward"
									state.status = "Auto Farm Level | Factory: checking reward"
									return true
								end

								state.factoryRewardHandledAt = now
								fn32(arg)
							end

							if not (now - (state.factoryCompletedAt or -math.huge) < n42) then
								if getMap() then
									if (state.nextFactoryDoorSignalAt or 0) <= now then
										state.nextFactoryDoorSignalAt = now + 5
										tbl82.markWarning(state, "door-open", "")
									end
								end
							end

							local flag = now < (state.factoryWarningUntil or 0)
							local flag2 = now - (state.factoryCoreLastSeenAt or -math.huge) < n40

							if not flag then
								if not flag2 then
									if state.factoryActive then
										state.factoryActive = false
										state.factoryWarningUntil = nil
										state.factorySignal = nil
										arg.Functions.StopTween()
									end

									return false
								end
							end

							state.factoryActive = true
							state.nearbyPlayerSamples = {}
							state.lastIdlingAt = os.time()
							state.lastIdleProgressKind = "factory-wait"
							state.status = "Auto Farm Level | Factory: pre-positioning"
							arg.Functions.TP(cframe2, "Auto Farm Level", true, nil, nil, nil, n39)
							return true
						end
					end

					fn30(state)
					state.factoryActive = false
					return false
				end
			end

			local n32, n33, n34, n35, n36, n37, n38, cframe2, distance3, distance4
			local fn30, fn31, fn32, fn33, fn34, fn35, fn36, fn37, getElectroQuestState, fn38
			local getElectricCloudInstance

			do
				do
					local n39 = 100
					local n40 = 6

					tbl83 = {
						shouldPrefetch = function(arg, arg2, arg3, arg4, arg5)
							local flag = tonumber(arg) > 100

							if flag then
								flag = tonumber(arg2) == 1
							end

							if flag then
								flag = arg3 ~= true
							end

							if flag then
								flag = arg4 ~= true
							end

							if flag then
								flag = arg5 == true
							end

							return flag
						end,
						route = function(arg, arg2, arg3)
							local num = tonumber(arg)
							local num2 = tonumber(arg3)
							if num == 2 then
								return "complete"
							end

							if num == 6 then
								return "purchase"
							end

							if not arg2 then
								if num ~= 0 then
									if num ~= 3 then
										if num ~= 4 then
											if num == 1 then
												local flag = num2 == 1

												if flag then
													flag = "cloud"
												end

												return flag or "travel-sea-1"
											end

											return "idle"
										end
									end
								end
							end

							local flag = num2 == 2

							if flag then
								flag = "quest"
							end

							return flag or "travel-sea-2"
						end,
						cloudAction = function(arg, arg2)
							local n41 = tonumber(arg) or math.huge
							local n42 = tonumber(arg2) or 0
							if n39 < n41 then
								return "travel"
							end

							if not (n40 <= n42) then
								return "wait"
							end
							return "hop"
						end,
					}
				end

				n32 = nil

				do
					n33 = nil
					n34 = nil
					n35 = nil
					n36 = nil
					n37 = nil
					n38 = nil
					local CollectionService
					local n39

					do
						local ReplicatedStorage, tbl88

						do
							CollectionService = game:GetService("CollectionService")
							ReplicatedStorage = game:GetService("ReplicatedStorage")

							tbl88 = {
								CFrame.new(-4628.8877, 15.5, -350.8),
								(CFrame.new(-4866.150390625, 33.929847717285, -4767.1025390625)),
							}

							cframe2 = CFrame.new(-4166.6098632812, 1093.6979980469, -347.16226196289)
							distance3 = 10
							distance4 = 12
							n39 = 6

							fn30 = function(arg, arg2)
								local functions = arg.Functions

								if functions then
									if type(functions.IsTaskCurrent) == "function" then
										return functions.IsTaskCurrent(arg2)
									end
								end

								local state = arg.State or {}
								local flag = not state.stopped

								if flag then
									flag = not state.paused
								end

								if flag then
									flag = arg.TaskQueue:top() == arg2
								end

								return flag
							end

							fn31 = function(arg)
								for i = 1, 3 do
									if arg.IsSea(i) then
										return i
									end
								end

								return 0
							end

							fn32 = function(arg)
								local character = arg.LocalPlayer.Character
								local character2 = character

								if character2 then
									character2 = character:FindFirstChildOfClass("Humanoid")
								end

								local character3 = character

								if character3 then
									character3 = character:FindFirstChild("HumanoidRootPart")
								end

								if not character2 then
									return nil
								end

								if character3 then
									if not (character2.Health <= 0) then
										return character, character2, character3
									end
								end

								return nil
							end

							fn33 = function(arg, name)
								local localPlayer = arg.LocalPlayer
								local backpack = localPlayer:FindFirstChildOfClass("Backpack")

								if localPlayer.Character then
									if localPlayer.Character:FindFirstChild(name) then
										return true, "character"
									end
								end

								if backpack then
									if backpack:FindFirstChild(name) then
										return true, "backpack"
									end
								end

								local inventory = arg.Inventory or {}

								for k, v in inventory do
									local flag = type(v) == "table"

									if flag then
										flag = v[name]
									end

									if flag == true then
										return true, "inventory:" .. tostring(k)
									end

									if type(flag) ~= "table" then
										continue
									end
									local num = tonumber(flag.Count or flag.count or flag.Amount or flag.amount or flag.Value or flag.value)

									if num ~= nil then
										if num > 0 then
											return true, "inventory:" .. tostring(k)
										end
										continue
									end

									return true, "inventory:" .. tostring(k)
								end

								return false, "missing"
							end

							fn34 = function(arg)
								local state = arg.State
								if state.inventoryReady then
									return true
								end
								local now = os.clock()

								if (state.nextElectricInventoryRefreshAt or 0) <= now then
									state.nextElectricInventoryRefreshAt = now + 2
									local ok, result = pcall(arg.Functions.RefreshInventory, true)
									state.lastElectricInventoryGate = { at = now, ok = ok, result = tostring(result), ready = state.inventoryReady == true }
								end

								if state.inventoryReady then
									return true
								end
								state.electricUnlockPhase = "waiting-inventory"
								state.status = "Material Farming | Electro | Waiting inventory"
								arg.Functions.CancelTween()
								return false
							end

							fn35 = function(state, electroQuestState, arg, lightningBolt, arg2, electricUnlockRoute)
								local lastElectricUnlockDecision = state.lastElectricUnlockDecision

								if lastElectricUnlockDecision then
									if lastElectricUnlockDecision.questState == electroQuestState then
										if lastElectricUnlockDecision.sea == arg then
											if lastElectricUnlockDecision.hasLightningBolt == lightningBolt then
												if lastElectricUnlockDecision.route == electricUnlockRoute then
													return
												end
											end
										end
									end
								end

								local lastElectricUnlockDecision2 = {
									at = os.clock(),
									questState = electroQuestState,
									sea = arg,
									hasLightningBolt = lightningBolt,
									lightningBoltSource = arg2,
									route = electricUnlockRoute,
								}

								state.lastElectricUnlockDecision = lastElectricUnlockDecision2
								state.electricUnlockHistory = state.electricUnlockHistory or {}
								table.insert(state.electricUnlockHistory, lastElectricUnlockDecision2)

								while #state.electricUnlockHistory > 32 do
									table.remove(state.electricUnlockHistory, 1)
								end
							end
						end

						fn36 = function(arg)
							local npcManager = ReplicatedStorage:FindFirstChild("NPCManager")

							if npcManager then
								local ok, result = pcall(require, npcManager)

								if ok then
									if type(result) == "table" then
										if type(result.getNPCsByName) == "function" then
											local ok2, result2 = pcall(result.getNPCsByName, "Mad Scientist")

											if ok2 then
												ok2 = type(result2) == "table"
											end

											if ok2 then
												ok2 = result2[1]
											end

											local ok3 = ok2

											if ok3 then
												ok3 = ok2._modelState
											end

											if ok3 then
												if typeof(ok3._targetLocation) == "CFrame" then
													return ok3._targetLocation
												end
											end

											local ok4 = ok3

											if ok4 then
												ok4 = ok3._rootPart
											end

											if typeof(ok4) == "Instance" then
												if ok4:IsA("BasePart") then
													return ok4.CFrame
												end
											end
										end
									end
								end
							end

							for _, instance in { workspace:FindFirstChild("NPCs"), ReplicatedStorage:FindFirstChild("NPCs") } do
								local instance2 = instance

								if instance2 then
									instance2 = instance:FindFirstChild("Mad Scientist")
								end

								if instance2 then
									if instance2:IsA("PVInstance") then
										return instance2:GetPivot()
									end
								end
							end

							return tbl88[fn31(arg)]
						end
					end

					fn37 = function(arg, arg2, arg3)
						local v = fn36(arg)

						if arg2 then
							if typeof(v) == "CFrame" then
								local magnitude = (arg2.Position - v.Position).Magnitude
								arg.State.electricPurchaseNpcDistance = magnitude
								if magnitude < distance3 then
									return false
								end
								arg.State.status = "Material Farming | Electro | Moving to Mad Scientist"
								arg.Functions.TP(v + Vector3.new(0, 5, 3), arg3 or "Auto Farm Level", true)
								return true
							end
						end

						return false
					end

					getElectroQuestState = function(arg, arg2)
						local state = arg.State
						local now = os.clock()

						if not arg2 then
							if now < (state.nextElectroQuestStateAt or 0) then
								return state.electroQuestState
							end
						end

						state.nextElectroQuestStateAt = now + 2

						local function getResponse3()
							return arg.CommandRemote:InvokeServer("ElectroQuestState")
						end

						local ok, result = pcall(getResponse3)

						if ok then
							if tonumber(result) ~= nil then
								state.electroQuestState = tonumber(result)
							end
						end

						return state.electroQuestState
					end

					fn38 = function(arg, arg2)
						local state = arg.State
						local now = os.clock()
						local v = fn31(arg)
						local worldTravelDestination = v == 3

						if worldTravelDestination then
							worldTravelDestination = 2
						end

						worldTravelDestination = worldTravelDestination or arg2
						local flag = worldTravelDestination == 1

						if flag then
							flag = "TravelMain"
						end

						flag = flag or "TravelDressrosa"
						state.status = "Sea Travel | Melee Material | Lightning Bolt"
						state.electricUnlockPhase = "travel-sea-" .. tostring(arg2)
						arg.Functions.CancelTween()
						if now < (state.nextElectricTravelAt or 0) then
							return
						end
						state.nextElectricTravelAt = now + 8
						state.worldTravelOwner = "AutoElectricUnlock"
						state.worldTravelDestination = worldTravelDestination
						state.worldTravelIssuedAt = now

						local ok, result = pcall(function()
							return arg.CommandRemote:InvokeServer(flag)
						end)

						state.lastElectricTravel = {
							ok = ok,
							result = tostring(result),
							sea = worldTravelDestination,
							destinationSea = arg2,
							fromSea = v,
							command = flag,
							at = now,
						}
					end

					getElectricCloudInstance = function(arg)
						local state = arg.State
						local now = os.clock()
						local map = workspace:FindFirstChild("Map")
						local map2 = map

						if map2 then
							map2 = map:FindFirstChild("Sky")
						end

						local cloudPieces = workspace:FindFirstChild("CloudPieces")
						local instance2 = nil
						local v = nil

						for _, instance in CollectionService:GetTagged("M1HitRegistry") do
							local isBasePart = instance:IsA("BasePart")

							if isBasePart then
								isBasePart = instance:IsDescendantOf(workspace)
							end

							if isBasePart then
								isBasePart = string.find(string.lower(instance.Name), "cloud", 1, true) ~= nil
							end

							if isBasePart then
								isBasePart = map2

								if isBasePart then
									isBasePart = instance:IsDescendantOf(map2)
								end

								if not isBasePart then
									isBasePart = cloudPieces

									if isBasePart then
										isBasePart = instance:IsDescendantOf(cloudPieces)
									end
								end
							end

							if not isBasePart then
								continue
							end
							local n40 = instance.Color.R + instance.Color.G + instance.Color.B
							if not (n40 < 2.88) then
								continue
							end

							if v ~= nil then
								if not (n40 < v) then
									continue
								end
							end

							instance2 = instance
							v = n40
						end

						if instance2 then
							state.electricCloudInstance = instance2
							state.electricCloudSeenAt = now
						else
							local electricCloudInstance = state.electricCloudInstance

							if not electricCloudInstance then
								state.electricCloudInstance = nil
								state.electricCloudSeenAt = nil
								return state.electricCloudInstance
							end

							if not electricCloudInstance.Parent then
								state.electricCloudInstance = nil
								state.electricCloudSeenAt = nil
								return state.electricCloudInstance
							end

							if n39 < now - (state.electricCloudSeenAt or 0) then
								state.electricCloudInstance = nil
								state.electricCloudSeenAt = nil
							end
						end

						return state.electricCloudInstance
					end
				end

				local function getMoveset3(arg)
					return arg.Functions.Owns("Moveset", "Electro") or arg.Functions.Owns("Moveset", "Electric")
				end

				tbl84 = { shouldPrefetch = function(arg)
					local state = arg.State
					local level = arg.Level

					if level then
						level = arg.Level.Value
					end

					local v = fn31(arg)
					local lightningBolt = fn33(arg, "Lightning Bolt")
					local moveset = getMoveset3(arg)

					if tonumber(level) ~= nil then
						if not (tonumber(level) <= 100) then
							if v == 1 then
								if not moveset then
									if not lightningBolt then
										if tbl83.shouldPrefetch(level, v, moveset, lightningBolt, getElectricCloudInstance(arg) ~= nil) then
											return true
										end
										state.electricPrefetchPending = nil
										return false
									end
								end
							end
						end
					end

					state.electricPrefetchPending = nil
					return false
				end }
			end

			do
				local fn39, fn40, fn41, fn42

				do
					local fn43

					do
						local function fn44(arg)
							local character = arg.LocalPlayer.Character
							local character2 = character

							if character2 then
								character2 = character:FindFirstChildOfClass("Humanoid")
							end

							local backpack = arg.LocalPlayer:FindFirstChildOfClass("Backpack")
							local character3 = character

							if character3 then
								character3 = character:FindFirstChild("Electro") or character:FindFirstChild("Electric")
							end

							if not character3 then
								character3 = backpack

								if character3 then
									character3 = backpack:FindFirstChild("Electro") or backpack:FindFirstChild("Electric")
								end
							end

							if character3 then
								if character2 then
									if character3.Parent ~= character then
										character2:EquipTool(character3)
										task.wait(0.05)
									end
								end
							end

							return character3 ~= nil
						end

						fn43 = function(arg, electricCloudInstance)
							local state = arg.State
							if os.clock() < (state.nextElectricCloudAttackAt or 0) then
								return
							end
							state.nextElectricCloudAttackAt = os.clock() + 0.35
							arg.SetCurrentWeaponType("Melee")
							arg.Functions.LoadTools()
							arg.Functions.EquipWeapon("Melee")
							arg.Functions.AutoBuso()
							arg.RegisterAttackRemote:FireServer(0.4)
							arg.RegisterHitRemote:FireServer(electricCloudInstance, {})
						end

						fn39 = function(arg, arg2)
							local state = arg.State
							state.electricUnlockNeeded = nil
							state.electricUnlockActive = nil
							state.electricUnlockPhase = "complete"
							state.meleeMastery = state.meleeMastery or {}
							state.meleeMastery.Electro = math.max(state.meleeMastery.Electro or 0, 1)
							arg.Functions.CancelTween()
							if fn44(arg) then
								state.electricEquipPending = nil
								return "busy"
							end

							if arg.Beli.Value < 500000 then
								state.electricEquipPending = nil
								return false
							end
							local v, v2, v3 = fn32(arg)
							if fn37(arg, v3, arg2) then
								return "busy"
							end

							if (state.nextElectricPurchaseAt or 0) <= os.clock() then
								state.nextElectricPurchaseAt = os.clock() + 2

								local ok, result = pcall(function()
									return arg.CommandRemote:InvokeServer("BuyElectro")
								end)

								state.lastElectricPurchase = { ok = ok, result = tostring(result), at = os.clock() }
								task.wait(0.2)
								if not fn30(arg, arg2) then
									return "busy"
								end
								arg.Functions.LoadTools()

								if fn44(arg) then
									state.electricEquipPending = nil
								end
							end

							return "busy"
						end

						fn40 = function(arg, arg2, arg3)
							n37 = 622296550
							n38 = 821915415
							local state = arg.State
							state.electricUnlockPhase = "purchase"
							state.status = "Material Farming | Electro | Buying Electric"
							arg.Functions.CancelTween()
							if arg.Beli.Value < 500000 then
								state.status = string.format("Auto Farm Level | Saving for Electric (%d/500000 Beli)", arg.Beli.Value)
								return false
							end

							if fn37(arg, arg2, arg3) then
								return "busy"
							end
							local now = os.clock()
							if now < (state.nextElectricPurchaseAt or 0) then
								return "busy"
							end
							state.nextElectricPurchaseAt = now + 4

							local ok, result = pcall(function()
								return arg.CommandRemote:InvokeServer("BuyElectro", true)
							end)

							if not fn30(arg, arg3) then
								return "busy"
							end

							local ok2, result2 = pcall(function()
								return arg.CommandRemote:InvokeServer("BuyElectro")
							end)

							local ok3 = ok2

							if ok3 then
								ok3 = tonumber(result2)
							end

							ok3 = ok3 or nil
							state.lastElectricPurchase = { probeOk = ok, probeResult = tostring(result), ok = ok2, result = tostring(result2), at = now }

							if fn30(arg, arg3) then
								if ok3 ~= 1 then
									if ok3 ~= 2 then
										state.nextElectroQuestStateAt = 0
										local electroQuestState = getElectroQuestState(arg, true)
										if not fn30(arg, arg3) then
											return "busy"
										end

										if electroQuestState == 2 then
											return fn39(arg)
										end

										if ok3 == 3 then
											state.status = "Auto Farm Level | Saving for Electric (purchase rejected)"
											return false
										end

										if ok3 == 4 then
											state.status = "Material Farming | Electro | Waiting for combat to end"
											return "busy"
										end

										if ok3 == 0 then
											state.status = "Material Farming | Electro | Lightning Bolt required"
											return "busy"
										end

										if not ok then
											state.status = "Material Farming | Electro | Purchase request failed"
											return "busy"
										end

										if ok2 then
											state.status = "Material Farming | Electro | Purchase pending"
										else
											state.status = "Material Farming | Electro | Purchase request failed"
										end

										return "busy"
									end
								end

								task.wait(0.2)
								if not fn30(arg, arg3) then
									return "busy"
								end
								arg.Functions.LoadTools()
								state.nextElectroQuestStateAt = 0
								local electroQuestState = getElectroQuestState(arg, true)
								if not fn30(arg, arg3) then
									return "busy"
								end

								if electroQuestState ~= 2 then
									if not fn44(arg) then
										state.status = "Material Farming | Electro | Waiting for Electric tool"
										return "busy"
									end
								end

								return fn39(arg, arg3)
							end

							return "busy"
						end
					end

					fn41 = function(arg, arg2, arg3)
						n33 = 808195433
						n34 = 706422121
						local state = arg.State
						local v = fn36(arg)
						state.electricUnlockPhase = "electro-quest"
						state.status = "Material Farming | Electro | Lightning Bolt Quest"

						if not (distance3 <= (arg2.Position - v.Position).Magnitude) then
							arg.Functions.CancelTween()
							if os.clock() < (state.nextElectricQuestActionAt or 0) then
								return "busy"
							end
							state.nextElectricQuestActionAt = os.clock() + 2
							local electroQuestState = getElectroQuestState(arg, true)
							if not fn30(arg, arg3) then
								return "busy"
							end

							if electroQuestState == 0 then
								pcall(function()
									arg.CommandRemote:InvokeServer("AcceptElectroQuest")
								end)

								task.wait(0.5)
								if not fn30(arg, arg3) then
									return "busy"
								end
								electroQuestState = getElectroQuestState(arg, true)
							end

							if electroQuestState == 3 then
								pcall(function()
									arg.CommandRemote:InvokeServer("DeliverLightningBolt")
								end)

								state.nextElectroQuestStateAt = 0
								state.nextMeleeElectroQuestProbeAt = 0
								return "busy"
							end

							if electroQuestState == 4 then
								pcall(function()
									arg.CommandRemote:InvokeServer("DeliverLightningBolt")
								end)

								state.nextElectroQuestStateAt = 0
								state.nextMeleeElectroQuestProbeAt = 0
								return "busy"
							end

							if fn33(arg, "Lightning Bolt") then
								pcall(function()
									arg.CommandRemote:InvokeServer("DeliverLightningBolt")
								end)

								state.nextElectroQuestStateAt = 0
								state.nextMeleeElectroQuestProbeAt = 0
								return "busy"
							end

							return "busy"
						end

						arg.Functions.TP(v + Vector3.new(0, 5, 3), arg3, true)
						return "busy"
					end

					fn42 = function(arg, part, arg2)
						n32 = 1002092399
						local state = arg.State
						local electricCloudInstance = getElectricCloudInstance(arg)

						if electricCloudInstance then
							if electricCloudInstance.Parent then
								state.electricUnlockPhase = "attack-cloud"
								state.electricCloudMissingSince = nil
								state.status = "Material Farming | Electro | Lightning Bolt"
								local cframe3 = electricCloudInstance.CFrame + Vector3.new(0, math.min(electricCloudInstance.Size.Y / 2 + 5, 90), 0)

								if not (distance4 <= (part.Position - cframe3.Position).Magnitude) then
									arg.Functions.CancelTween()
									fn43(arg, electricCloudInstance)
									return "busy"
								end

								arg.Functions.TP(cframe3, arg2, true)
								return "busy"
							end
						end

						local now = os.clock()
						local cframe3 = cframe2 + Vector3.new(0, 20, 0)
						local magnitude = (part.Position - cframe3.Position).Magnitude
						local electricCloudMissingSince = state.electricCloudMissingSince

						if electricCloudMissingSince then
							electricCloudMissingSince = now - state.electricCloudMissingSince
						end

						if tbl83.cloudAction(magnitude, electricCloudMissingSince or 0) == "travel" then
							state.electricUnlockPhase = "travel-cloud-area"
							state.electricCloudMissingSince = nil
							state.status = "Material Farming | Electro | Moving to charged cloud area"
							arg.Functions.TP(cframe3, arg2, true)
							return "busy"
						end

						state.electricUnlockPhase = "scan-cloud"
						state.electricCloudMissingSince = state.electricCloudMissingSince or now
						state.status = "Material Farming | Electro | Waiting charged cloud"
						arg.Functions.CancelTween()
						part.AssemblyLinearVelocity = Vector3.zero
						part.AssemblyAngularVelocity = Vector3.zero

						if tbl83.cloudAction(magnitude, now - state.electricCloudMissingSince) == "hop" then
							if (state.nextElectricCloudHopAt or 0) <= now then
								state.nextElectricCloudHopAt = os.clock() + 30
								arg.Functions.HopServer(5, "electro-cloud-missing")
							end
						end

						return "busy"
					end
				end

				tbl84.runPrefetch = function(arg, arg2)
					n35 = 868462566
					n36 = 813669373
					local state = arg.State
					local str = arg2 or arg.TaskQueue:top() or "Melee Materials"
					if not fn30(arg, str) then
						return false
					end

					if tbl84.shouldPrefetch(arg) then
						local v, v2, v3 = fn32(arg)

						if v3 then
							if not fn34(arg) then
								return "busy"
							end
							state.electricUnlockPhase = "prefetch-lightning-bolt"
							return fn42(arg, v3, str)
						end

						state.status = "Material Farming | Electro | Waiting character"
						return "busy"
					end

					return false
				end

				tbl84.run = function(arg, arg2)
					local state = arg.State
					local str = arg2 or arg.TaskQueue:top() or "Auto Farm Level"
					if not fn30(arg, str) then
						return false
					end

					if not state.electricUnlockNeeded then
						if not state.electricEquipPending then
							return false
						end
					end

					local v, v2, v3 = fn32(arg)

					if v3 then
						if not fn34(arg) then
							return "busy"
						end
						local electroQuestState = getElectroQuestState(arg)

						if fn30(arg, str) then
							local lightningBolt, v4 = fn33(arg, "Lightning Bolt")
							local v5 = fn31(arg)
							local electricUnlockRoute = tbl83.route(electroQuestState, lightningBolt, v5)
							state.electricUnlockRoute = electricUnlockRoute
							fn35(state, electroQuestState, v5, lightningBolt, v4, electricUnlockRoute)
							if electricUnlockRoute == "complete" then
								return fn39(arg, str)
							end

							if electricUnlockRoute == "purchase" then
								return fn40(arg, v3, str)
							end

							if electricUnlockRoute == "travel-sea-2" then
								fn38(arg, 2)
								return "busy"
							end

							if electricUnlockRoute == "travel-sea-1" then
								fn38(arg, 1)
								return "busy"
							end

							if electricUnlockRoute == "quest" then
								return fn41(arg, v3, str)
							end

							if electricUnlockRoute == "cloud" then
								return fn42(arg, v3, str)
							end
							state.status = "Material Farming | Electro | Waiting quest state"
							return false
						end

						return false
					end

					state.status = "Material Farming | Electro | Waiting character"
					return "busy"
				end
			end

			do
				do
					do
						local n39, meleeProgressVersion, HttpService, fn39

						do
							n15 = nil
							n16 = nil
							n17 = nil
							n18 = nil
							n39 = nil

							do
								n19 = nil
								n20 = nil
								n25 = nil
								n26 = nil
								n21 = nil
								n22 = nil
								local str = "seahub_melee_progress_"
								meleeProgressVersion = 5
								HttpService = game:GetService("HttpService")

								styles = {
									{
										name = "Black Leg",
										display = "Dark Step",
										goal = 400,
										command = "BuyBlackLeg",
										npc = "Dark Step Teacher",
										minSea = 1,
										price = 150000,
										purchaseSeas = { true, true },
										preferredPurchaseSea = 1,
										purchaseCFrames = {
											[2] = CFrame.new(-4752.4321289062, 33.929847717285, -4848.0390625),
											[3] = CFrame.new(-5045.60205078125, 370.010986328125, -3182.304931640625),
										},
									},
									{
										name = "Electro",
										display = "Electric",
										goal = 400,
										command = "BuyElectro",
										npc = "Mad Scientist",
										minSea = 1,
										price = 500000,
										purchaseSeas = { true },
										preferredPurchaseSea = 1,
										purchaseCFrames = {
											[2] = CFrame.new(-4866.150390625, 33.929847717285, -4767.1025390625),
											[3] = CFrame.new(-4996.0517578125, 313.21395874023438, -3201.82373046875),
										},
									},
									{
										name = "Fishman Karate",
										display = "Water Kung Fu",
										goal = 400,
										command = "BuyFishmanKarate",
										npc = "Water Kung-fu Teacher",
										minSea = 1,
										price = 750000,
										purchaseSeas = { true, true },
										preferredPurchaseSea = 2,
										purchaseCFrames = {
											[2] = CFrame.new(-4957.6704101562, 35.949836730957, -4665.599609375),
											[3] = CFrame.new(-5023.9091796875, 371.02999877929688, -3191.45751953125),
										},
									},
									{
										name = "Dragon Claw",
										display = "Dragon Breath",
										goal = 400,
										command = "BlackbeardReward",
										args = { "DragonClaw", "2" },
										npc = "Sabi",
										minSea = 2,
										fragments = 1500,
										purchaseSeas = { [2] = true, [3] = true },
										preferredPurchaseSea = 2,
										purchaseCFrames = {
											[2] = CFrame.new(699.02899169922, 185.6609954834, 654.89501953125),
											[3] = CFrame.new(-4981.162109375, 370.010986328125, -3208.3388671875),
										},
									},
									{
										name = "Superhuman",
										goal = 400,
										command = "BuySuperhuman",
										npc = "Martial Arts Master",
										minSea = 2,
										price = 3000000,
										purchaseSeas = { [2] = true, [3] = true },
										preferredPurchaseSea = 2,
										purchaseCFrames = {
											[2] = CFrame.new(1377.125, 246.54200744629, -5189.951171875),
											[3] = CFrame.new(-5004.72119140625, 370.42333984375, -3198.915283203125),
										},
									},
									{
										name = "Death Step",
										goal = 400,
										command = "BuyDeathStep",
										npc = "Phoeyu, the Reformed",
										minSea = 2,
										price = 2500000,
										fragments = 5000,
										key = "Library Key",
										boss = "Awakened Ice Admiral",
										bossCFrame = CFrame.new(6407, 340, -6892),
										purchaseSeas = { [2] = true, [3] = true },
										preferredPurchaseSea = 2,
										purchaseCFrames = {
											[2] = CFrame.new(6356.4721679688, 296.10000610352, -6762.7709960938),
											[3] = CFrame.new(-4999.23046875, 314.01449584961, -3221.572265625),
										},
									},
									{
										name = "Sharkman Karate",
										goal = 400,
										command = "BuySharkmanKarate",
										npc = "Sharkman Teacher",
										minSea = 2,
										price = 2500000,
										fragments = 5000,
										key = "Water Key",
										boss = "Tide Keeper",
										bossCFrame = CFrame.new(-3570, 123, -11555),
										purchaseSeas = { [2] = true, [3] = true },
										preferredPurchaseSea = 2,
										purchaseCFrames = {
											[2] = CFrame.new(-2599.6218261719, 238.19833374023, -10315.998046875),
											[3] = CFrame.new(-4971.2060546875, 313.88693237304688, -3223.0791015625),
										},
									},
									{
										name = "Electric Claw",
										goal = 400,
										command = "BuyElectricClaw",
										npc = "Previous Hero",
										minSea = 3,
										price = 3000000,
										fragments = 5000,
										purchaseSeas = { [3] = true },
										preferredPurchaseSea = 3,
										purchaseCFrames = {
											[3] = CFrame.new(-10371.4716796875, 330.76400756836, -10131.419921875),
										},
									},
									{
										name = "Dragon Talon",
										goal = 400,
										command = "BuyDragonTalon",
										npc = "Uzoth",
										minSea = 3,
										price = 3000000,
										fragments = 5000,
										purchaseSeas = { [3] = true },
										preferredPurchaseSea = 3,
										purchaseCFrames = {
											[3] = CFrame.new(5661.89794921875, 1210.876953125, 863.176025390625),
										},
									},
								}

								n23 = 350
								tbl86 = { "Yama", "Tushita" }
								n27 = 450
								n28 = 5
								n29 = 90
								n30 = 120
								n24 = 2
								delay = 0.5
								distance2 = 15
								n31 = 5

								tbl87 = {
									name = "Godhuman",
									display = "Godhuman",
									npc = "Ancient Monk",
									purchaseCFrames = {
										[3] = CFrame.new(-13774.0908203125, 333.73300170898, -9879.9072265625),
									},
								}

								godhumanMaterials = {
									{ name = "Fish Tail", count = 20, sea = 3 },
									{ name = "Dragon Scale", count = 10, sea = 3 },
									{ name = "Mystic Droplet", count = 10, sea = 2 },
									{ name = "Magma Ore", count = 20, sea = 2 },
								}

								fn39 = function(arg)
									return str .. tostring(arg.LocalPlayer.UserId) .. ".json"
								end
							end

							local function fn40(arg)
								if type(writefile) ~= "function" then
									return
								end

								pcall(function()
									local v = writefile
									local v2 = fn39(arg)
									local HttpService2 = HttpService
									local jsonEncode = HttpService.JSONEncode
									local tbl88 = { version = meleeProgressVersion, userId = arg.LocalPlayer.UserId }
									tbl88.mastery = arg.State.meleeMastery or {}
									v(v2, jsonEncode(HttpService2, tbl88))
								end)
							end

							fn6 = function(arg)
								for i = 1, 3 do
									if arg.IsSea(i) then
										return i
									end
								end

								return 0
							end

							do
								local function fn41(arg)
									arg.Functions.LoadTools()
									local melee = arg.ToolsByType.Melee
									if typeof(melee) ~= "Instance" then
										return nil, 0
									end
									local level = melee:FindFirstChild("Level")
									local name = melee.Name
									local level2 = level

									if level2 then
										level2 = tonumber(level.Value)
									end

									return name, level2 or 0
								end

								fn7 = function(arg, arg2)
									local flag = type(arg) == "string"
									if not flag then
										return flag
									end
									flag = arg == arg2.name

									if not flag then
										flag = arg2.display ~= nil

										if flag then
											flag = arg == arg2.display
										end
									end

									return flag
								end

								getInstance2 = function(arg, arg2)
									local localPlayer = arg.LocalPlayer

									for _, instance in { localPlayer.Character, localPlayer:FindFirstChildOfClass("Backpack") } do
										local instance3 = instance

										if instance3 then
											instance3 = instance:GetChildren()
										end

										instance3 = instance3 or {}

										for _, instance2 in instance3 do
											if instance2:IsA("Tool") then
												if fn7(instance2.Name, arg2) then
													return instance2
												end
											end
										end

										continue
									end

									return nil
								end

								fn8 = function(arg, arg2)
									local instance = getInstance2(arg, arg2)
									local character = arg.LocalPlayer.Character
									local character2 = character

									if character2 then
										character2 = character:FindFirstChildOfClass("Humanoid")
									end

									if not instance then
										return false
									end

									if character2 then
										if not (character2.Health <= 0) then
											if instance.Parent ~= character then
												character2:EquipTool(instance)
												task.wait(0.05)
											end

											arg.Functions.LoadTools()
											return instance.Parent == character
										end
									end

									return false
								end

								fn9 = function(arg)
									local state = arg.State
									state.meleeMastery = state.meleeMastery or {}
									local v, v2 = fn41(arg)

									if v then
										for _, v3 in styles do
											if fn7(v, v3) then
												state.meleeMastery[v3.name] = math.max(state.meleeMastery[v3.name] or 0, v2)
												fn40(arg)
												return v3.name, v2
											end
										end

										if v == "Godhuman" then
											state.godhumanOwned = true
										end

										return v, v2
									end

									return nil, 0
								end
							end

							fn10 = function(arg, arg2, meleeCurrentMastery)
								if arg2 ~= "Godhuman" then
									return false
								end
								local state = arg.State
								state.godhumanOwned = true
								state.meleeTarget = "Godhuman"
								state.meleeTargetDisplay = "Godhuman"
								state.meleeCurrentMastery = meleeCurrentMastery
								state.meleeMastery = state.meleeMastery or {}

								for _, v in styles do
									state.meleeMastery[v.name] = math.max(state.meleeMastery[v.name] or 0, v.goal)
								end

								arg.MeleeInventory = arg.MeleeInventory or {}
								arg.MeleeInventory.Melee = arg.MeleeInventory.Melee or {}
								arg.MeleeInventory.Melee.Godhuman = { Bought = true, Level = meleeCurrentMastery }
								fn40(arg)
								return true
							end
						end

						fn11 = function(arg)
							n39 = 938773847
							local state = arg.State
							if state.meleeProgressVersion == meleeProgressVersion then
								return
							end
							state.meleeProgressLoaded = true
							state.meleeProgressVersion = meleeProgressVersion
							local path = fn39(arg)
							if type(readfile) ~= "function" then
								return
							end

							if type(isfile) ~= "function" then
								return
							end

							if not isfile(path) then
								return
							end

							local ok, result = pcall(function()
								return HttpService:JSONDecode(readfile(path))
							end)

							if not ok then
								return
							end

							if type(result) ~= "table" then
								return
							end

							if tonumber(result.userId) ~= arg.LocalPlayer.UserId then
								return
							end

							if tonumber(result.version) ~= meleeProgressVersion then
								return
							end

							if type(result.mastery) ~= "table" then
								return
							end
							state.meleeMastery = state.meleeMastery or {}

							for k, v in pairs(result.mastery) do
								if tonumber(v) then
									state.meleeMastery[k] = math.max(state.meleeMastery[k] or 0, tonumber(v))
								end

								continue
							end
						end
					end

					fn12 = function(arg)
						local meleeMastery = arg.State.meleeMastery
						local meleeProgress = arg.MeleeProgress or {}
						local meleeInventory = arg.MeleeInventory

						if meleeInventory then
							meleeInventory = arg.MeleeInventory.Melee
						end

						meleeInventory = meleeInventory or {}

						for _, v in styles do
							local v2 = tonumber
							local level = meleeProgress[v.name]

							if level then
								level = meleeProgress[v.name].Level
							end

							local v3 = v2(level)

							if not v3 then
								local v4 = tonumber
								local level2 = meleeInventory[v.name]

								if level2 then
									level2 = meleeInventory[v.name].Level
								end

								v3 = v4(level2)
							end

							if v3 then
								meleeMastery[v.name] = math.max(meleeMastery[v.name] or 0, v3)
							end
						end

						if meleeInventory.Godhuman then
							if meleeInventory.Godhuman.Bought then
								arg.State.godhumanOwned = true
							end
						end
					end

					fn13 = function(meleeMastery)
						for _, v in styles do
							if (meleeMastery[v.name] or 0) < v.goal then
								return v
							end
						end
					end
				end

				fn29 = nil

				getResponse = function(arg, arg2)
					if arg2.args then
						return arg.CommandRemote:InvokeServer(arg2.command, table.unpack(arg2.args))
					end
					return arg.CommandRemote:InvokeServer(arg2.command)
				end
			end

			getResponse2 = function(arg, arg2)
				if arg2.name == "Dragon Claw" then
					return arg.CommandRemote:InvokeServer("BlackbeardReward", "DragonClaw", "1")
				end
				return arg.CommandRemote:InvokeServer(arg2.command, true)
			end
		end

		getMoveset = function(arg, arg2)
			return arg.Functions.Owns("Moveset", arg2.name) or arg.Functions.Owns("Moveset", arg2.display or arg2.name)
		end

		getMoveset2 = function(arg, arg2)
			if type(arg.Functions.RefreshInventory) == "function" then
				pcall(arg.Functions.RefreshInventory, true)
			end

			arg.Functions.LoadTools()
			local instance = getInstance2(arg, arg2)
			return instance ~= nil or getMoveset(arg, arg2)
		end

		getPurchaseCFrames = function(arg, arg2)
			local purchaseCFrames = fn29(arg2.npc)

			if not purchaseCFrames then
				purchaseCFrames = arg2.purchaseCFrames

				if purchaseCFrames then
					purchaseCFrames = arg2.purchaseCFrames[fn6(arg)]
				end
			end

			return purchaseCFrames
		end

		fn14 = function(arg, arg2, character)
			local purchaseCFrames = getPurchaseCFrames(arg, arg2)
			if typeof(purchaseCFrames) ~= "CFrame" then
				return false
			end

			if not ((character.Position - purchaseCFrames.Position).Magnitude <= distance2) then
				arg.State.status = "Auto Farm Level | Moving to " .. arg2.npc
				arg.Functions.TP(purchaseCFrames + Vector3.new(0, 5, 3), "Auto Farm Level", false)
				return true
			end

			return false
		end

		fn15 = function(arg, arg2, character)
			local purchaseCFrames = getPurchaseCFrames(arg, arg2)
			local flag = typeof(purchaseCFrames) == "CFrame"
			local magnitude = nil

			if character then
				if flag then
					magnitude = (character.Position - purchaseCFrames.Position).Magnitude
				end
			end

			local v = flag
			local magnitude2 = magnitude
			local flag2 = magnitude ~= nil

			if flag2 then
				flag2 = magnitude <= distance2
			end

			return v, magnitude2, flag2
		end

		fn16 = function(arg, arg2, arg3)
			local state = arg.State
			state.nextMeleeOwnedLoadAt = state.nextMeleeOwnedLoadAt or {}

			if arg3 == nil then
				arg3 = true
			end

			local character = arg.LocalPlayer.Character
			local character2 = character

			if character2 then
				character2 = character:FindFirstChild("HumanoidRootPart")
			end

			if arg3 then
				if arg2.name == "Dragon Claw" then
					if character2 then
						if fn14(arg, arg2, character2) then
							return "busy"
						end
					end
				end
			end

			local now = os.clock()
			if now < (state.nextMeleeOwnedLoadAt[arg2.name] or 0) then
				state.status = "Auto Farm Level | Loading " .. (arg2.display or arg2.name)
				return "busy"
			end
			state.nextMeleeOwnedLoadAt[arg2.name] = now + n24
			local ok, result = pcall(getResponse, arg, arg2)

			if ok then
				task.wait(0.2)
				getMoveset2(arg, arg2)
				fn8(arg, arg2)
			end

			local v, meleeCurrentMastery = fn9(arg)
			local v2 = fn7(v, arg2)
			state.lastMeleeOwnedLoad = { name = arg2.name, success = ok, result = tostring(result), equipped = v2, at = now }

			if v2 then
				state.meleeCurrentMastery = meleeCurrentMastery
				state.meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
				state.meleePurchaseNeedsNpc[arg2.name] = nil
				state.status = string.format("Auto Farm Level | %s equipped (%d/%d)", arg2.display or arg2.name, meleeCurrentMastery, arg2.goal)
			else
				state.status = "Auto Farm Level | Loading " .. (arg2.display or arg2.name)
			end

			return "busy"
		end

		fn17 = function(arg, arg2)
			local state = arg.State
			if state.electroQuestState == 2 then
				return true, 2
			end
			local now = os.clock()

			if not arg2 then
				if now < (state.nextMeleeElectroQuestProbeAt or 0) then
					return state.electroQuestState ~= nil, state.electroQuestState
				end
			end

			state.nextMeleeElectroQuestProbeAt = now + 5

			local ok, result = pcall(function()
				return arg.CommandRemote:InvokeServer("ElectroQuestState")
			end)

			if ok then
				state.electroQuestState = tonumber(result)
			end

			return ok, state.electroQuestState
		end

		fn18 = function(arg, arg2)
			local state = arg.State
			local now = os.clock()

			if not arg2 then
				if now < (state.nextDragonTalonUnlockProbeAt or 0) then
					return state.dragonTalonUnlockProbeSuccess == true, state.dragonTalonUnlockProbeResult
				end
			end

			state.nextDragonTalonUnlockProbeAt = now + n31

			local ok, dragonTalonUnlockProbeResult = pcall(function()
				return arg.CommandRemote:InvokeServer("BuyDragonTalon", true)
			end)

			state.dragonTalonUnlockProbeSuccess = ok

			if ok then
				state.dragonTalonUnlockProbeResult = dragonTalonUnlockProbeResult

				if type(dragonTalonUnlockProbeResult) ~= "string" then
					state.fireEssenceDelivered = true
				elseif string.find(string.lower(dragonTalonUnlockProbeResult), "heart ablaze", 1, true) then
					state.fireEssenceDelivered = nil
				end
			end

			state.lastDragonTalonUnlockProbe = { success = ok, result = tostring(dragonTalonUnlockProbeResult), at = now }
			return ok, dragonTalonUnlockProbeResult
		end

		fn29 = function(name)
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local npcManager = ReplicatedStorage:FindFirstChild("NPCManager")

			if npcManager then
				local ok, result = pcall(require, npcManager)

				if ok then
					if type(result) == "table" then
						if type(result.getNPCsByName) == "function" then
							local ok2, result2 = pcall(result.getNPCsByName, name)

							if ok2 then
								if type(result2) == "table" then
									for _, v in result2 do
										local modelState = v

										if modelState then
											modelState = v._modelState
										end

										local modelState2 = modelState

										if modelState2 then
											modelState2 = modelState._targetLocation
										end

										if typeof(modelState2) == "CFrame" then
											return modelState2
										end
										local modelState3 = modelState

										if modelState3 then
											modelState3 = modelState._rootPart
										end

										if typeof(modelState3) == "Instance" then
											if modelState3:IsA("BasePart") then
												return modelState3.CFrame
											end
										end
									end
								end
							end
						end
					end
				end
			end

			for _, instance in { workspace:FindFirstChild("NPCs"), ReplicatedStorage:FindFirstChild("NPCs") } do
				local instance2 = instance

				if instance2 then
					instance2 = instance:FindFirstChild(name)
				end

				if instance2 then
					if instance2:IsA("PVInstance") then
						return instance2:GetPivot()
					end
				end
			end

			if type(getnilinstances) ~= "function" then
				return nil
			end

			for _, instance in getnilinstances() do
				if instance.Name ~= name then
					continue
				end

				if not instance:IsA("PVInstance") then
					if not instance:IsA("BasePart") then
						continue
					end
				end

				local ok, result = pcall(function()
					local isPVInstance = instance:IsA("PVInstance")

					if isPVInstance then
						isPVInstance = instance:GetPivot()
					end

					return isPVInstance or instance.CFrame
				end)

				if ok then
					if typeof(result) == "CFrame" then
						return result
					end
					continue
				end

				continue
			end

			return nil
		end

		getCharacter = function(arg, name)
			local localPlayer = arg.LocalPlayer
			local character = localPlayer.Character

			if character then
				character = localPlayer.Character:FindFirstChild(name)
			end

			if not character then
				character = localPlayer:FindFirstChildOfClass("Backpack")

				if character then
					character = localPlayer.Backpack:FindFirstChild(name)
				end
			end

			return character
		end

		fn19 = function(sharkmanUnlockProbeResult)
			local flag = type(sharkmanUnlockProbeResult) == "string"

			if flag then
				flag = string.find(sharkmanUnlockProbeResult, "house keys", 1, true) ~= nil
			end

			return flag
		end

		do
			local function getInstance3(boss)
				local enemies = workspace:FindFirstChild("Enemies")
				local enemies2 = enemies

				if enemies2 then
					enemies2 = enemies:GetChildren()
				end

				enemies2 = enemies2 or {}

				for _, instance in enemies2 do
					local humanoid = instance:FindFirstChildOfClass("Humanoid")

					if instance.Name:find(boss, 1, true) then
						if humanoid then
							if humanoid.Health > 0 then
								return instance
							end
						end
					end
				end

				return nil
			end

			local function fn30(arg, instance)
				local state = arg.State
				if os.clock() < (state.nextLibraryKeyActivationAt or 0) then
					return false
				end
				local character = arg.LocalPlayer.Character
				local character2 = character

				if character2 then
					character2 = character:FindFirstChildOfClass("Humanoid")
				end

				local character3 = character

				if character3 then
					character3 = character:FindFirstChild("HumanoidRootPart")
				end

				local iceCastle = workspace:FindFirstChild("IceCastle", true)
				local iceCastle2 = iceCastle

				if iceCastle2 then
					iceCastle2 = iceCastle:FindFirstChild("LibraryDoor", true)
				end

				local iceCastle3 = iceCastle2

				if iceCastle3 then
					iceCastle3 = iceCastle2:FindFirstChild("Keyhole")
				end

				local iceCastle4 = iceCastle3

				if iceCastle4 then
					iceCastle4 = iceCastle3:FindFirstChild("Detect")
				end

				if character2 then
					if character3 then
						if iceCastle4 then
							if iceCastle4:IsA("BasePart") then
								state.nextLibraryKeyActivationAt = os.clock() + 2

								local ok, result = pcall(function()
									return arg.CommandRemote:InvokeServer("OpenLibrary")
								end)

								local v, ok2, result2, ok3, lastLibraryKeyActivation

								if ok then
									if result ~= true then
										if getCharacter(arg, "Library Key") then
											if instance.Parent ~= character then
												character2:EquipTool(instance)
												task.wait(0.05)
											end

											v = firetouchinterest
											if type(v) ~= "function" then
												state.libraryKeyActivationState = "touch-api-missing"
												return false
											end

											ok2, result2 = pcall(function()
												v(character3, iceCastle4, 0)
												task.wait(0.05)
												v(character3, iceCastle4, 1)
											end)

											ok3 = ok2

											if ok3 then
												ok3 = "touch-sent"
											end

											ok3 = ok3 or "touch-failed"
											state.libraryKeyActivationState = ok3
											lastLibraryKeyActivation = { success = ok2 }

											if ok2 then
											end

											lastLibraryKeyActivation.error = tostring(result2)
											lastLibraryKeyActivation.remoteResult = tostring(result)
											lastLibraryKeyActivation.source = "touch-fallback"
											lastLibraryKeyActivation.at = os.clock()
											state.lastLibraryKeyActivation = lastLibraryKeyActivation
											return ok2
										end
									end

									state.deathStepUnlockConfirmed = true
									state.libraryKeyActivationState = "complete"
									state.lastLibraryKeyActivation = { success = true, result = tostring(result), source = "remote", at = os.clock() }
									return true
								end

								if instance.Parent ~= character then
									character2:EquipTool(instance)
									task.wait(0.05)
								end

								v = firetouchinterest
								if type(v) ~= "function" then
									state.libraryKeyActivationState = "touch-api-missing"
									return false
								end

								ok2, result2 = pcall(function()
									v(character3, iceCastle4, 0)
									task.wait(0.05)
									v(character3, iceCastle4, 1)
								end)

								ok3 = ok2

								if ok3 then
									ok3 = "touch-sent"
								end

								state.libraryKeyActivationState = ok3 or "touch-failed"
								lastLibraryKeyActivation = { success = ok2 }

								if ok2 then
								end

								lastLibraryKeyActivation.error = tostring(result2)
								lastLibraryKeyActivation.remoteResult = tostring(result)
								lastLibraryKeyActivation.source = "touch-fallback"
								lastLibraryKeyActivation.at = os.clock()
								state.lastLibraryKeyActivation = lastLibraryKeyActivation
								return ok2
							end
						end
					end
				end

				state.libraryKeyActivationState = "detector-missing"
				return false
			end

			getSharkmanUnlockProbeResult = function(arg, arg2)
				local state = arg.State
				local now = os.clock()

				if not arg2 then
					if now < (state.nextSharkmanUnlockProbeAt or 0) then
						return state.sharkmanUnlockProbeResult
					end
				end

				state.nextSharkmanUnlockProbeAt = now + 2
				local flag = getCharacter(arg, "Water Key") ~= nil

				local ok, sharkmanUnlockProbeResult = pcall(function()
					return arg.CommandRemote:InvokeServer("BuySharkmanKarate", true)
				end)

				local flag2 = getCharacter(arg, "Water Key") ~= nil
				state.lastSharkmanUnlockProbe = { success = ok, result = tostring(sharkmanUnlockProbeResult), keyBefore = flag, keyAfter = flag2, at = now }
				if not ok then
					return nil
				end
				state.sharkmanUnlockProbeResult = sharkmanUnlockProbeResult
				local sharkmanUnlockConfirmed, sharkmanUnlockConfirmed2

				if flag then
					if flag2 then
						if tonumber(sharkmanUnlockProbeResult) == 1 then
							state.sharkmanKeyDelivered = true
							state.sharkmanUnlockConfirmed = true
							state.thirdSeaBlockedBySharkman = nil
							state.meleePrerequisite = nil
						elseif fn19(sharkmanUnlockProbeResult) then
							state.sharkmanUnlockConfirmed = nil
							state.thirdSeaBlockedBySharkman = true
							state.meleePrerequisite = "Sharkman Karate"
						elseif tonumber(sharkmanUnlockProbeResult) == 3 then
							sharkmanUnlockConfirmed = state.sharkmanKeyDelivered == true

							if sharkmanUnlockConfirmed then
								sharkmanUnlockConfirmed = true
							end

							sharkmanUnlockConfirmed = sharkmanUnlockConfirmed or nil
							state.sharkmanUnlockConfirmed = sharkmanUnlockConfirmed
							state.thirdSeaBlockedBySharkman = nil

							if state.meleePrerequisite == "Sharkman Karate" then
								state.meleePrerequisite = nil
							end
						else
							sharkmanUnlockConfirmed2 = state.sharkmanKeyDelivered == true

							if sharkmanUnlockConfirmed2 then
								sharkmanUnlockConfirmed2 = true
							end

							sharkmanUnlockConfirmed2 = sharkmanUnlockConfirmed2 or nil
							state.sharkmanUnlockConfirmed = sharkmanUnlockConfirmed2
							state.thirdSeaBlockedBySharkman = nil

							if state.meleePrerequisite == "Sharkman Karate" then
								state.meleePrerequisite = nil
							end
						end
					else
						state.sharkmanKeyDelivered = true
						state.sharkmanUnlockConfirmed = true
						state.thirdSeaBlockedBySharkman = nil
						state.meleePrerequisite = nil
					end
				elseif tonumber(sharkmanUnlockProbeResult) == 1 then
					state.sharkmanKeyDelivered = true
					state.sharkmanUnlockConfirmed = true
					state.thirdSeaBlockedBySharkman = nil
					state.meleePrerequisite = nil
				elseif fn19(sharkmanUnlockProbeResult) then
					state.sharkmanUnlockConfirmed = nil
					state.thirdSeaBlockedBySharkman = true
					state.meleePrerequisite = "Sharkman Karate"
				elseif tonumber(sharkmanUnlockProbeResult) == 3 then
					sharkmanUnlockConfirmed = state.sharkmanKeyDelivered == true

					if sharkmanUnlockConfirmed then
						sharkmanUnlockConfirmed = true
					end

					state.sharkmanUnlockConfirmed = sharkmanUnlockConfirmed or nil
					state.thirdSeaBlockedBySharkman = nil

					if state.meleePrerequisite == "Sharkman Karate" then
						state.meleePrerequisite = nil
					end
				else
					sharkmanUnlockConfirmed2 = state.sharkmanKeyDelivered == true

					if sharkmanUnlockConfirmed2 then
						sharkmanUnlockConfirmed2 = true
					end

					state.sharkmanUnlockConfirmed = sharkmanUnlockConfirmed2 or nil
					state.thirdSeaBlockedBySharkman = nil

					if state.meleePrerequisite == "Sharkman Karate" then
						state.meleePrerequisite = nil
					end
				end

				return sharkmanUnlockProbeResult
			end

			fn20 = function(arg, arg2)
				local state = arg.State
				if state.deathStepUnlockConfirmed == true then
					return true
				end
				local iceCastle = workspace:FindFirstChild("IceCastle", true)
				local iceCastle2 = iceCastle

				if iceCastle2 then
					iceCastle2 = iceCastle:FindFirstChild("Hall")
				end

				local iceCastle3 = iceCastle2

				if iceCastle3 then
					iceCastle3 = iceCastle2:FindFirstChild("LibraryDoor")
				end

				if iceCastle3 then
					if not iceCastle3:FindFirstChild("PhoeyuDoor", true) then
						if not iceCastle3:FindFirstChild("Keyhole", true) then
							state.deathStepUnlockConfirmed = true
							return true
						end
					end
				end

				local now = os.clock()

				if not arg2 then
					if now < (state.nextDeathStepUnlockProbeAt or 0) then
						return state.deathStepUnlockConfirmed == true
					end
				end

				state.nextDeathStepUnlockProbeAt = now + 2

				local ok, result = pcall(function()
					return arg.CommandRemote:InvokeServer("OpenLibrary")
				end)

				state.lastDeathStepUnlockProbe = { success = ok, result = tostring(result), at = now }

				if ok then
					if result == true then
						state.deathStepUnlockConfirmed = true
					end
				end

				return state.deathStepUnlockConfirmed == true
			end

			fn21 = function(arg)
				local state = arg.State
				local fireEssence = getCharacter(arg, "Fire Essence")
				local character = arg.LocalPlayer.Character
				local character2 = character

				if character2 then
					character2 = character:FindFirstChildOfClass("Humanoid")
				end

				local character3 = character2

				if character3 then
					character3 = character2.Health > 0
				end

				if fireEssence then
					if fn6(arg) ~= 3 then
						return
					end

					if os.clock() < (state.nextFireEssenceDeliveryAt or 0) then
						return
					end
					state.nextFireEssenceDeliveryAt = os.clock() + 2
					local now = os.clock()

					local ok, result = pcall(function()
						return arg.CommandRemote:InvokeServer("BuyDragonTalon", true)
					end)

					state.lastFireEssenceDelivery = { success = ok, result = tostring(result), confirmed = false, at = now }

					if ok then
						if type(result) ~= "string" then
							state.fireEssenceDelivered = true
							state.fireEssenceDeliveryPending = { at = now }

							if not getCharacter(arg, "Fire Essence") then
								state.fireEssenceDelivered = true
								state.fireEssenceDeliveryPending = nil
								state.lastFireEssenceDelivery.confirmed = true
							end

							return
						end
					end

					return
				end

				local fireEssenceDeliveryPending = state.fireEssenceDeliveryPending

				if fireEssenceDeliveryPending then
					if character3 then
						if os.clock() - fireEssenceDeliveryPending.at <= 10 then
							state.fireEssenceDelivered = true
							state.lastFireEssenceDelivery.confirmed = true
						end
					end
				end

				state.fireEssenceDeliveryPending = nil
			end

			fn22 = function(arg, arg2, arg3)
				n26 = 129081665
				local state = arg.State
				local str = arg3 or "Auto Farm Level"
				local flag = str == "Melee Materials"

				if flag then
					flag = "Material Farming"
				end

				flag = flag or str

				if arg2.name == "Sharkman Karate" then
					if state.sharkmanUnlockConfirmed then
						state.meleePrerequisite = nil
						return false
					end
				end

				if not arg2.key then
					return false
				end

				if state.meleePrerequisite ~= arg2.name then
					return false
				end
				local character = getCharacter(arg, arg2.key)

				if character then
					if arg2.key == "Library Key" then
						state.status = flag .. " | Activating Library Key"
						fn30(arg, character)

						if state.deathStepUnlockConfirmed == true then
							character = nil
						else
							if getCharacter(arg, arg2.key) then
								return true
							end
							character = nil
						end
					end
				end

				if character then
					if arg2.key == "Water Key" then
						state.status = flag .. " | Delivering Water Key"
						getSharkmanUnlockProbeResult(arg, false)

						if getCharacter(arg, arg2.key) then
							if not state.sharkmanUnlockConfirmed then
								return true
							end
						end

						state.sharkmanUnlockConfirmed = true
						state.meleePrerequisite = nil
						state.prerequisiteBossName = nil
						state.prerequisiteBossSeen = nil
						state.prerequisiteBossMissingSince = nil
						state.prerequisiteBossDefeatedAt = nil
						return false
					end
				end

				if character then
					state.meleePrerequisite = nil
					state.prerequisiteBossName = nil
					state.prerequisiteBossSeen = nil
					state.prerequisiteBossMissingSince = nil
					state.prerequisiteBossDefeatedAt = nil
					return false
				end

				if arg2.key == "Library Key" then
					if state.libraryKeyActivationState == "touch-sent" then
						state.meleePrerequisite = nil
						state.prerequisiteBossName = nil
						state.prerequisiteBossSeen = nil
						state.prerequisiteBossMissingSince = nil
						state.prerequisiteBossDefeatedAt = nil
						state.libraryKeyActivationState = "complete"
						return false
					end
				end

				local instance = getInstance3(arg2.boss)
				state.status = flag .. " | " .. arg2.boss .. " for " .. arg2.key

				if instance then
					state.prerequisiteBossName = arg2.boss
					state.prerequisiteBossSeen = true
					state.prerequisiteBossMissingSince = nil
					state.prerequisiteBossDefeatedAt = nil
					arg.Functions.CombatTarget(instance, str, { boss = true, preserveBring = true, weaponType = "Melee" })
				else
					local character2 = arg.LocalPlayer.Character
					local character3 = character2

					if character3 then
						character3 = character2:FindFirstChild("HumanoidRootPart")
					end

					local character4 = character3

					if character4 then
						character4 = (character3.Position - arg2.bossCFrame.Position).Magnitude
					end

					character4 = character4 or math.huge
					local now = os.clock()

					if state.prerequisiteBossName ~= arg2.boss then
						state.prerequisiteBossName = arg2.boss
						state.prerequisiteBossSeen = nil
						state.prerequisiteBossMissingSince = nil
						state.prerequisiteBossDefeatedAt = nil
					end

					if state.prerequisiteBossSeen then
						if not state.prerequisiteBossDefeatedAt then
							state.prerequisiteBossDefeatedAt = now
						end
					end

					if not (character4 <= n27) then
						state.prerequisiteBossMissingSince = nil
					else
						state.prerequisiteBossMissingSince = state.prerequisiteBossMissingSince or now
						local elapsed = now - state.prerequisiteBossMissingSince
						local n32 = math.max(0, n28 - (now - (state.prerequisiteBossDefeatedAt or 0)))

						if state.prerequisiteBossDefeatedAt then
							if n32 > 0 then
								state.status = string.format(flag .. " | Checking %s drop (%.0fs)", arg2.key, n32)
							else
								if state.prerequisiteBossDefeatedAt then
									if n30 <= now - (state.lastPrerequisiteHopAt or -n30) then
										state.status = flag .. " | No " .. arg2.key .. "; hopping now"
										state.lastPrerequisiteHopAt = now
										state.prerequisiteBossMissingSince = now
										arg.Functions.HopServer(nil, true)
										return true
									end
								end

								if n29 <= elapsed then
									if n30 <= now - (state.lastPrerequisiteHopAt or -n30) then
										state.status = flag .. " | Hopping for " .. arg2.boss
										state.lastPrerequisiteHopAt = now
										state.prerequisiteBossMissingSince = now
										arg.Functions.HopServer(nil, true)
										return true
									end
								end

								state.status = string.format(flag .. " | Waiting %s (%.0fs)", arg2.boss, elapsed)
							end
						else
							if state.prerequisiteBossDefeatedAt then
								if n30 <= now - (state.lastPrerequisiteHopAt or -n30) then
									state.status = flag .. " | No " .. arg2.key .. "; hopping now"
									state.lastPrerequisiteHopAt = now
									state.prerequisiteBossMissingSince = now
									arg.Functions.HopServer(nil, true)
									return true
								end
							end

							if n29 <= elapsed then
								if n30 <= now - (state.lastPrerequisiteHopAt or -n30) then
									state.status = flag .. " | Hopping for " .. arg2.boss
									state.lastPrerequisiteHopAt = now
									state.prerequisiteBossMissingSince = now
									arg.Functions.HopServer(nil, true)
									return true
								end
							end

							state.status = string.format(flag .. " | Waiting %s (%.0fs)", arg2.boss, elapsed)
						end
					end

					arg.Functions.TP(arg2.bossCFrame, str, true)
				end

				return true
			end
		end

		fn23 = function(arg, arg2)
			n25 = 63938638
			local flag = arg.Beli.Value >= (arg2.price or 0)

			if flag then
				flag = arg.Fragments.Value >= (arg2.fragments or 0)
			end

			return flag
		end

		fn24 = function(arg, arg2)
			if arg2 then
				local state = arg.State
				local meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc

				if type(meleePurchaseNeedsNpc) == "table" then
					meleePurchaseNeedsNpc[arg2] = nil
				end

				if state.meleeTarget == arg2 then
					state.meleePurchaseNpcDistance = nil
					state.meleePurchaseNpcUnavailable = nil
				end
			end
		end

		local function getMaterial(arg, name)
			local material = arg.Inventory.Material

			if material then
				material = arg.Inventory.Material[name]
			end

			local material2 = material

			if material2 then
				material2 = tonumber(material.Count or material.Value)
			end

			return material2 or 0
		end

		fn25 = function(arg)
			local state = arg.State
			local v = fn13(state.meleeMastery or {})

			if v then
				if v.name == "Dragon Talon" then
					if getCharacter(arg, "Fire Essence") then
						state.dragonTalonNeedsEssence = false
						state.dragonTalonMaterialMode = nil
						state.dragonTalonLevelCycleActive = nil
						return nil
					end

					local dragonTalonNeedsEssence, v2 = fn18(arg, false)

					if dragonTalonNeedsEssence then
						dragonTalonNeedsEssence = type(v2) == "string"
					end

					if dragonTalonNeedsEssence then
						dragonTalonNeedsEssence = string.find(string.lower(v2), "heart ablaze", 1, true) ~= nil
					end

					state.dragonTalonNeedsEssence = dragonTalonNeedsEssence

					if dragonTalonNeedsEssence then
						if fn6(arg) ~= 3 then
							state.dragonTalonLevelCycleActive = nil
							state.dragonTalonMaterialMode = "Travel"
							return "Travel"
						end

						state.dragonTalonMaterialMode = nil
						state.dragonTalonLevelCycleActive = true
						state.dragonTalonLevelCycleDeferredAt = os.clock()
						return nil
					end

					state.dragonTalonMaterialMode = nil
					state.dragonTalonLevelCycleActive = nil
					return nil
				end
			end

			state.dragonTalonMaterialMode = nil
			state.dragonTalonLevelCycleActive = nil
			return nil
		end

		fn26 = function(arg, worldTravelOwner, arg2)
			local state = arg.State
			if arg2 ~= "Travel" then
				return false
			end
			state.status = "Sea Travel | Melee Material | Fire Essence"

			if (state.nextDragonTalonMaterialTravelAt or 0) <= os.clock() then
				state.nextDragonTalonMaterialTravelAt = os.clock() + 5
				state.worldTravelOwner = worldTravelOwner
				state.worldTravelDestination = 3
				state.worldTravelIssuedAt = os.clock()

				local ok, result = pcall(function()
					return arg.CommandRemote:InvokeServer("TravelZou")
				end)

				state.lastDragonTalonMaterialTravel = { ok = ok, result = tostring(result), at = os.clock() }
			end

			return true
		end

		fn27 = function(arg)
			if arg.State.godhumanOwned == true then
				return nil
			end

			if arg.Functions.Owns("Moveset", "Godhuman") then
				return nil
			end
			local v = fn6(arg)
			local v2 = nil

			for _, v3 in godhumanMaterials do
				if not (getMaterial(arg, v3.name) < v3.count) then
					continue
				end
				v2 = v2 or v3
				if v3.sea == v then
					return v3
				end
				continue
			end

			return v2
		end

		fn28 = function(arg, arg2)
			local flag = arg2 ~= false
			local state = arg.State
			state.meleeTarget = "Godhuman"
			state.meleeTargetDisplay = "Godhuman"
			state.meleeTargetMastery = 400
			state.meleeReadyForGodhuman = true

			if state.godhumanOwned then
				fn24(arg, "Godhuman")
				state.status = "Godhuman acquired"
				return false
			end

			local v = fn27(arg)

			if v then
				fn24(arg, "Godhuman")
				local material = getMaterial(arg, v.name)
				state.status = string.format("Godhuman | %s: %d/%d", v.name, material, v.count)

				if flag then
					if type(arg.Functions.FarmMaterial) == "function" then
						arg.Functions.FarmMaterial(v.name, "Godhuman", v.count, v.sea)
					else
						state.meleeMissingMaterial = v.name
						state.meleeMissingMaterialCount = v.count - material
					end
				else
					state.meleeMissingMaterial = v.name
					state.meleeMissingMaterialCount = v.count - material
				end

				local str = flag

				if str then
					str = "busy"
				end

				return str or false
			end

			state.meleeMissingMaterial = nil
			state.meleeMissingMaterialCount = nil

			if not (arg.Beli.Value < 5000000) then
				if not (arg.Fragments.Value < 5000) then
					state.meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
					state.meleePurchaseNeedsNpc.Godhuman = true
					local character = arg.LocalPlayer.Character
					local character2 = character

					if character2 then
						character2 = character:FindFirstChild("HumanoidRootPart")
					end

					local v2, meleePurchaseNpcDistance, v3 = fn15(arg, tbl87, character2)
					state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

					if not flag then
						if not v3 then
							return false
						end
					end

					if flag then
						if character2 then
							if v2 then
								if not v3 then
									if fn14(arg, tbl87, character2) then
										state.status = "Godhuman | Moving to Ancient Monk"
										return "busy"
									end
								end
							end
						end
					end

					if os.clock() < (state.nextGodhumanPurchaseAt or 0) then
						return "busy"
					end
					state.nextGodhumanPurchaseAt = os.clock() + 5

					local ok, result = pcall(function()
						return arg.CommandRemote:InvokeServer("BuyGodhuman", true)
					end)

					local ok2, result2 = pcall(function()
						return arg.CommandRemote:InvokeServer("BuyGodhuman")
					end)

					state.lastGodhumanPurchase = {
						probeSuccess = ok,
						probeResult = tostring(result),
						success = ok2,
						result = tostring(result2),
						at = os.clock(),
					}

					if not ok2 then
						return "busy"
					end
					task.wait(0.25)
					getMoveset2(arg, tbl87)
					fn8(arg, tbl87)

					if fn9(arg) == "Godhuman" then
						state.godhumanOwned = true
						state.needFragments = false
						state.meleePurchaseNeedsNpc.Godhuman = nil
						return "busy"
					end

					if getMoveset(arg, tbl87) then
						state.godhumanOwned = true
						state.needFragments = false
						state.meleePurchaseNeedsNpc.Godhuman = nil
					end

					return "busy"
				end
			end

			fn24(arg, "Godhuman")
			state.needFragments = arg.Fragments.Value < 5000
			state.status = string.format("Godhuman | Money %d/5000000 | Fragments %d/5000", arg.Beli.Value, arg.Fragments.Value)
			return false
		end
	end

	local function fn29(arg, arg2)
		if arg2.name ~= "Dragon Talon" then
			return false
		end

		if not getCharacter(arg, "Fire Essence") then
			local state = arg.State
			if state.fireEssenceDelivered == true then
				return false
			end
			local v, v2 = fn18(arg, false)
			local flag = v

			if flag then
				flag = type(v2) == "string"
			end

			if flag then
				flag = string.find(string.lower(v2), "heart ablaze", 1, true) ~= nil
			end

			if v then
				if type(v2) ~= "string" then
					state.fireEssenceDelivered = true
					return false
				end
			end

			if flag then
				state.dragonTalonNeedsEssence = true
				state.dragonTalonLevelCycleActive = fn6(arg) == 3
				state.status = "Auto Farm Level | Dragon Talon Bones cycle"
				return "defer"
			end

			return false
		end

		return false
	end

	local function fn30(arg)
		local state = arg.State
		local moveset = arg.Inventory.Moveset or {}
		local forceSwordMasteryTarget = nil
		local v = nil

		for _, v2 in tbl86 do
			local v3 = moveset[v2]

			if type(v3) == "table" then
				if (tonumber(v3.Mastery or v3.Level) or 0) < n23 then
					forceSwordMasteryTarget = v2
					v = v3
					break
				end
			end
		end

		if forceSwordMasteryTarget then
			local n25 = tonumber(v.Mastery or v.Level) or 0
			state.forceSwordMasteryTarget = forceSwordMasteryTarget
			state.selectedWeaponType = "Sword"
			state.status = string.format("Farming mastery for %s (%d/%d)", forceSwordMasteryTarget, n25, n23)
			local character = getCharacter(arg, forceSwordMasteryTarget)

			if not character then
				if (state.nextLegendarySwordLoadAt or 0) <= os.clock() then
					state.nextLegendarySwordLoadAt = os.clock() + 3

					pcall(function()
						arg.CommandRemote:InvokeServer("LoadItem", forceSwordMasteryTarget)
					end)

					arg.Functions.LoadTools()
					character = getCharacter(arg, forceSwordMasteryTarget)
				end
			end

			local character2 = arg.LocalPlayer.Character
			local character3 = character2

			if character3 then
				character3 = character2:FindFirstChildOfClass("Humanoid")
			end

			if character then
				if character3 then
					if character3.Health > 0 then
						if character.Parent ~= character2 then
							character3:EquipTool(character)
							arg.Functions.LoadTools()
						end
					end
				end
			end

			return true
		end

		if state.forceSwordMasteryTarget then
			state.forceSwordMasteryTarget = nil

			if state.selectedWeaponType == "Sword" then
				state.selectedWeaponType = nil
			end
		end

		return false
	end

	tbl85 = {
		run = function(arg, arg2)
			local tbl88 = arg2 or {}
			local flag = tbl88.allowMovement ~= false
			local flag2 = tbl88.background == true
			if arg.Environment.Configs["Switch Melee"] == false then
				return false
			end
			local state = arg.State

			if arg.LocalPlayer.Character then
				state.meleeMastery = state.meleeMastery or {}
				fn11(arg)
				local meleeMastery = state.meleeMastery
				fn12(arg)
				fn21(arg)
				local v, meleeCurrentMastery = fn9(arg)

				if not fn10(arg, v, meleeCurrentMastery) then
					if state.godhumanOwned ~= true then
						if not arg.Functions.Owns("Moveset", "Godhuman") then
							local v2 = fn13(meleeMastery)

							if v2 then
								if state.meleeTarget then
									if state.meleeTarget ~= v2.name then
										fn24(arg, state.meleeTarget)
									end
								end

								state.meleeTarget = v2.name
								state.meleeTargetDisplay = v2.display or v2.name
								state.meleeTargetMastery = v2.goal
								state.meleeCurrentMastery = meleeMastery[v2.name] or 0
								local moveset = getMoveset(arg, v2)
								local n25, v3, meleeCurrentMastery2, sharkmanUnlockProbeResult, n26, v4, v5, flag3, flag4, character, character2, v6, meleePurchaseNpcDistance, v7, str, ok, result, now, count, ok3, result2, v8, meleeCurrentMastery3, format, v9, v10, str2

								if v2.name == "Electro" then
									local display, v11, meleePurchaseNeedsNpc, now2, nextMeleePurchaseAt, ok2, result3, str3, display2, format2, str4, display3, value, price

									if moveset then
										n25 = 899373327

										if fn7(v, v2) then
											fn24(arg, v2.name)

											if v2.name == "Electro" then
												state.electricEquipPending = nil
											end

											state.meleeCurrentMastery = meleeCurrentMastery

											if v2.goal <= meleeCurrentMastery then
												meleeMastery[v2.name] = meleeCurrentMastery
											end

											return true
										end

										if getInstance2(arg, v2) then
											fn24(arg, v2.name)
											display = v2.display or v2.name
											state.status = "Auto Farm Level | Equipping " .. display
											if not fn8(arg, v2) then
												return "busy"
											end
											v3, meleeCurrentMastery2 = fn9(arg)

											if fn7(v3, v2) then
												if v2.name == "Electro" then
													state.electricEquipPending = nil
												end

												state.meleeCurrentMastery = meleeCurrentMastery2
												return "busy"
											end

											return "busy"
										end

										if moveset then
											fn24(arg, v2.name)
											return fn16(arg, v2, flag)
										end

										if fn6(arg) < v2.minSea then
											fn24(arg, v2.name)
											state.meleeWaitingForSea = v2.minSea
											return false
										end

										state.meleeWaitingForSea = nil

										if v2.name == "Death Step" then
											if getCharacter(arg, "Library Key") then
												state.meleePrerequisite = v2.name
											elseif fn20(arg, false) then
												if state.meleePrerequisite == v2.name then
													state.meleePrerequisite = nil
												end
											else
												state.meleePrerequisite = v2.name
											end
										elseif v2.name == "Sharkman Karate" then
											sharkmanUnlockProbeResult = nil

											if getCharacter(arg, "Water Key") then
												state.meleePrerequisite = v2.name
											else
												sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
											end

											if tonumber(sharkmanUnlockProbeResult) == 1 then
												state.sharkmanUnlockConfirmed = true

												if state.meleePrerequisite == v2.name then
													state.meleePrerequisite = nil
												end
											elseif fn19(sharkmanUnlockProbeResult) then
												state.meleePrerequisite = v2.name
											end
										end

										if not flag then
											if state.meleePrerequisite == v2.name then
												fn24(arg, v2.name)
												return false
											end
										end

										n26 = 121813377

										if flag then
											if fn6(arg) == 2 then
												if fn22(arg, v2) then
													fn24(arg, v2.name)
													return "busy"
												end
											end
										end

										if v2.name == "Dragon Talon" then
											v4 = flag

											if v4 then
												v4 = fn29(arg, v2)
											end

											if v4 == "defer" then
												fn24(arg, v2.name)
												return false
											end

											if v4 then
												fn24(arg, v2.name)
												return "busy"
											end

											if not flag then
												if not getCharacter(arg, "Fire Essence") then
													if state.fireEssenceDelivered ~= true then
														v11, v5 = fn18(arg, false)
														flag3 = v11

														if flag3 then
															flag3 = type(v5) == "string"
														end

														if flag3 then
															flag3 = string.find(string.lower(v5), "heart ablaze", 1, true) ~= nil
														end

														if flag3 then
															state.dragonTalonNeedsEssence = true
															fn24(arg, v2.name)
															return false
														end
													end
												end
											end
										end

										if v2.name == "Electric Claw" then
											if not state.electricClawUtilityActive then
												if tonumber(state.utilityElectricClawProbeResult) ~= 4 then
													if fn23(arg, v2) then
														meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
														state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
														flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

														if not flag4 then
															state.meleePurchaseNeedsNpc[v2.name] = true
															state.nextMeleePurchaseAt = 0
															flag4 = true
														end

														character = arg.LocalPlayer.Character
														character2 = character

														if character2 then
															character2 = character:FindFirstChild("HumanoidRootPart")
														end

														v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
														state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

														if v7 then
															now2 = os.clock()
															nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

															if now2 < nextMeleePurchaseAt then
																str = v6

																if str then
																	str = "busy"
																end

																str = str or false
																return str
															end

															state.nextMeleePurchaseAt = os.clock() + n24
															ok, result = pcall(getResponse2, arg, v2)

															state.lastMeleeProbe = {
																name = v2.name,
																success = ok,
																result = tostring(result),
																at = os.clock(),
															}

															if v2.name == "Electric Claw" then
																if tonumber(result) == 4 then
																	state.meleePurchaseNeedsNpc[v2.name] = nil
																	state.utilityElectricClawProbeResult = 4
																	state.nextUtilityElectricClawProbeAt = 0
																	state.status = "Auto Farm Level | Electric Claw trial pending"
																	return "busy"
																end
															end

															now = os.clock()
															count = 0

															repeat
																count += 1
																ok2, result3 = pcall(getResponse, arg, v2)
																ok3 = ok2
																result2 = result3

																if ok3 then
																	task.wait(0.1)
																	getMoveset2(arg, v2)
																end

																fn8(arg, v2)
																v8, meleeCurrentMastery3 = fn9(arg)

																if fn7(v8, v2) then
																	state.meleePurchaseNeedsNpc[v2.name] = nil

																	if v2.name == "Electro" then
																		state.electricUnlockNeeded = nil
																		state.electricEquipPending = nil
																		state.nextElectricUnlockAttemptAt = nil
																		state.electroQuestState = 2
																	end

																	state.meleeCurrentMastery = meleeCurrentMastery3
																	format = string.format
																	str3 = "Auto Farm Level | %s equipped (%d/%d)"
																	display2 = v2.display or v2.name
																	state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

																	state.lastMeleePurchase = {
																		name = v2.name,
																		success = ok3,
																		result = tostring(result2),
																		probeResult = tostring(result),
																		attempts = count,
																		acquired = true,
																		at = os.clock(),
																	}

																	return "busy"
																end

																if not flag2 then
																	if os.clock() - now < n24 then
																		task.wait(delay)
																	end
																end

																if flag2 then
																	break
																end
															until n24 <= os.clock() - now

															state.lastMeleePurchase = {
																name = v2.name,
																success = ok3,
																result = tostring(result2),
																probeResult = tostring(result),
																attempts = count,
																requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
																at = os.clock(),
															}

															if v2.name ~= "Electro" then
																return false
															end

															if tostring(result2) ~= "0" then
																return false
															end
															v9, v10 = fn17(arg, true)

															if v9 then
																if tonumber(v10) == 2 then
																	fn24(arg, v2.name)
																	state.electricUnlockNeeded = nil
																	state.electricUnlockActive = nil
																	state.electricUnlockPhase = "complete"
																	state.electricEquipPending = true
																	state.status = "Auto Farm Level | Electric owned; waiting to equip"
																	return "busy"
																end
															end

															state.meleePurchaseNeedsNpc[v2.name] = nil
															state.electricUnlockNeeded = true
															state.nextElectricUnlockAttemptAt = nil
															state.status = "Auto Farm Level | Electric requires Lightning Bolt"
															return "busy"
														end

														if flag then
															if character2 then
																if v6 then
																	fn14(arg, v2, character2)
																end
															end
														end

														str2 = flag

														if str2 then
															str2 = "busy"
														end

														str2 = str2 or false
														return str2
													end

													fn24(arg, v2.name)
													format2 = string.format
													str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
													display3 = v2.display or v2.name
													value = arg.Beli.Value
													price = v2.price or 0
													state.status = format2(str4, display3, value, price)
													return false
												end
											end

											fn24(arg, v2.name)
											state.status = "Auto Farm Level | Electric Claw trial"
											return "busy"
										end

										if fn23(arg, v2) then
											meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
											state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
											flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

											if not flag4 then
												state.meleePurchaseNeedsNpc[v2.name] = true
												state.nextMeleePurchaseAt = 0
												flag4 = true
											end

											character = arg.LocalPlayer.Character
											character2 = character

											if character2 then
												character2 = character:FindFirstChild("HumanoidRootPart")
											end

											v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
											state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

											if v7 then
												now2 = os.clock()
												nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

												if now2 < nextMeleePurchaseAt then
													str = v6

													if str then
														str = "busy"
													end

													str = str or false
													return str
												end

												state.nextMeleePurchaseAt = os.clock() + n24
												ok, result = pcall(getResponse2, arg, v2)

												state.lastMeleeProbe = {
													name = v2.name,
													success = ok,
													result = tostring(result),
													at = os.clock(),
												}

												if v2.name == "Electric Claw" then
													if tonumber(result) == 4 then
														state.meleePurchaseNeedsNpc[v2.name] = nil
														state.utilityElectricClawProbeResult = 4
														state.nextUtilityElectricClawProbeAt = 0
														state.status = "Auto Farm Level | Electric Claw trial pending"
														return "busy"
													end
												end

												now = os.clock()
												count = 0

												repeat
													count += 1
													ok2, result3 = pcall(getResponse, arg, v2)
													ok3 = ok2
													result2 = result3

													if ok3 then
														task.wait(0.1)
														getMoveset2(arg, v2)
													end

													fn8(arg, v2)
													v8, meleeCurrentMastery3 = fn9(arg)

													if fn7(v8, v2) then
														state.meleePurchaseNeedsNpc[v2.name] = nil

														if v2.name == "Electro" then
															state.electricUnlockNeeded = nil
															state.electricEquipPending = nil
															state.nextElectricUnlockAttemptAt = nil
															state.electroQuestState = 2
														end

														state.meleeCurrentMastery = meleeCurrentMastery3
														format = string.format
														str3 = "Auto Farm Level | %s equipped (%d/%d)"
														display2 = v2.display or v2.name
														state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

														state.lastMeleePurchase = {
															name = v2.name,
															success = ok3,
															result = tostring(result2),
															probeResult = tostring(result),
															attempts = count,
															acquired = true,
															at = os.clock(),
														}

														return "busy"
													end

													if not flag2 then
														if os.clock() - now < n24 then
															task.wait(delay)
														end
													end

													if flag2 then
														break
													end
												until n24 <= os.clock() - now

												state.lastMeleePurchase = {
													name = v2.name,
													success = ok3,
													result = tostring(result2),
													probeResult = tostring(result),
													attempts = count,
													requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
													at = os.clock(),
												}

												if v2.name ~= "Electro" then
													return false
												end

												if tostring(result2) ~= "0" then
													return false
												end
												v9, v10 = fn17(arg, true)

												if v9 then
													if tonumber(v10) == 2 then
														fn24(arg, v2.name)
														state.electricUnlockNeeded = nil
														state.electricUnlockActive = nil
														state.electricUnlockPhase = "complete"
														state.electricEquipPending = true
														state.status = "Auto Farm Level | Electric owned; waiting to equip"
														return "busy"
													end
												end

												state.meleePurchaseNeedsNpc[v2.name] = nil
												state.electricUnlockNeeded = true
												state.nextElectricUnlockAttemptAt = nil
												state.status = "Auto Farm Level | Electric requires Lightning Bolt"
												return "busy"
											end

											if flag then
												if character2 then
													if v6 then
														fn14(arg, v2, character2)
													end
												end
											end

											str2 = flag

											if str2 then
												str2 = "busy"
											end

											str2 = str2 or false
											return str2
										end

										fn24(arg, v2.name)
										format2 = string.format
										str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
										display3 = v2.display or v2.name
										value = arg.Beli.Value
										price = v2.price or 0
										state.status = format2(str4, display3, value, price)
										return false
									end

									local v12, v13 = fn17(arg)

									if v12 then
										if tonumber(v13) == 2 then
											fn24(arg, v2.name)
											state.electricUnlockNeeded = nil
											state.electricUnlockActive = nil
											state.electricUnlockPhase = "complete"

											if fn7(v, v2) then
												n25 = 899373327

												if fn7(v, v2) then
													fn24(arg, v2.name)

													if v2.name == "Electro" then
														state.electricEquipPending = nil
													end

													state.meleeCurrentMastery = meleeCurrentMastery

													if v2.goal <= meleeCurrentMastery then
														meleeMastery[v2.name] = meleeCurrentMastery
													end

													return true
												end

												if getInstance2(arg, v2) then
													fn24(arg, v2.name)
													display = v2.display or v2.name
													state.status = "Auto Farm Level | Equipping " .. display
													if not fn8(arg, v2) then
														return "busy"
													end
													v3, meleeCurrentMastery2 = fn9(arg)

													if fn7(v3, v2) then
														if v2.name == "Electro" then
															state.electricEquipPending = nil
														end

														state.meleeCurrentMastery = meleeCurrentMastery2
														return "busy"
													end

													return "busy"
												end

												if moveset then
													fn24(arg, v2.name)
													return fn16(arg, v2, flag)
												end

												if fn6(arg) < v2.minSea then
													fn24(arg, v2.name)
													state.meleeWaitingForSea = v2.minSea
													return false
												end

												state.meleeWaitingForSea = nil

												if v2.name == "Death Step" then
													if getCharacter(arg, "Library Key") then
														state.meleePrerequisite = v2.name
													elseif fn20(arg, false) then
														if state.meleePrerequisite == v2.name then
															state.meleePrerequisite = nil
														end
													else
														state.meleePrerequisite = v2.name
													end
												elseif v2.name == "Sharkman Karate" then
													sharkmanUnlockProbeResult = nil

													if getCharacter(arg, "Water Key") then
														state.meleePrerequisite = v2.name
													else
														sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
													end

													if tonumber(sharkmanUnlockProbeResult) == 1 then
														state.sharkmanUnlockConfirmed = true

														if state.meleePrerequisite == v2.name then
															state.meleePrerequisite = nil
														end
													elseif fn19(sharkmanUnlockProbeResult) then
														state.meleePrerequisite = v2.name
													end
												end

												if not flag then
													if state.meleePrerequisite == v2.name then
														fn24(arg, v2.name)
														return false
													end
												end

												n26 = 121813377

												if flag then
													if fn6(arg) == 2 then
														if fn22(arg, v2) then
															fn24(arg, v2.name)
															return "busy"
														end
													end
												end

												if v2.name == "Dragon Talon" then
													v4 = flag

													if v4 then
														v4 = fn29(arg, v2)
													end

													if v4 == "defer" then
														fn24(arg, v2.name)
														return false
													end

													if v4 then
														fn24(arg, v2.name)
														return "busy"
													end

													if not flag then
														if not getCharacter(arg, "Fire Essence") then
															if state.fireEssenceDelivered ~= true then
																v11, v5 = fn18(arg, false)
																flag3 = v11

																if flag3 then
																	flag3 = type(v5) == "string"
																end

																if flag3 then
																	flag3 = string.find(string.lower(v5), "heart ablaze", 1, true) ~= nil
																end

																if flag3 then
																	state.dragonTalonNeedsEssence = true
																	fn24(arg, v2.name)
																	return false
																end
															end
														end
													end
												end

												if v2.name == "Electric Claw" then
													if not state.electricClawUtilityActive then
														if tonumber(state.utilityElectricClawProbeResult) ~= 4 then
															if fn23(arg, v2) then
																meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
																state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
																flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

																if not flag4 then
																	state.meleePurchaseNeedsNpc[v2.name] = true
																	state.nextMeleePurchaseAt = 0
																	flag4 = true
																end

																character = arg.LocalPlayer.Character
																character2 = character

																if character2 then
																	character2 = character:FindFirstChild("HumanoidRootPart")
																end

																v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
																state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

																if v7 then
																	now2 = os.clock()
																	nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

																	if now2 < nextMeleePurchaseAt then
																		str = v6

																		if str then
																			str = "busy"
																		end

																		str = str or false
																		return str
																	end

																	state.nextMeleePurchaseAt = os.clock() + n24
																	ok, result = pcall(getResponse2, arg, v2)

																	state.lastMeleeProbe = {
																		name = v2.name,
																		success = ok,
																		result = tostring(result),
																		at = os.clock(),
																	}

																	if v2.name == "Electric Claw" then
																		if tonumber(result) == 4 then
																			state.meleePurchaseNeedsNpc[v2.name] = nil
																			state.utilityElectricClawProbeResult = 4
																			state.nextUtilityElectricClawProbeAt = 0
																			state.status = "Auto Farm Level | Electric Claw trial pending"
																			return "busy"
																		end
																	end

																	now = os.clock()
																	count = 0

																	repeat
																		count += 1
																		ok2, result3 = pcall(getResponse, arg, v2)
																		ok3 = ok2
																		result2 = result3

																		if ok3 then
																			task.wait(0.1)
																			getMoveset2(arg, v2)
																		end

																		fn8(arg, v2)
																		v8, meleeCurrentMastery3 = fn9(arg)

																		if fn7(v8, v2) then
																			state.meleePurchaseNeedsNpc[v2.name] = nil

																			if v2.name == "Electro" then
																				state.electricUnlockNeeded = nil
																				state.electricEquipPending = nil
																				state.nextElectricUnlockAttemptAt = nil
																				state.electroQuestState = 2
																			end

																			state.meleeCurrentMastery = meleeCurrentMastery3
																			format = string.format
																			str3 = "Auto Farm Level | %s equipped (%d/%d)"
																			display2 = v2.display or v2.name
																			state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

																			state.lastMeleePurchase = {
																				name = v2.name,
																				success = ok3,
																				result = tostring(result2),
																				probeResult = tostring(result),
																				attempts = count,
																				acquired = true,
																				at = os.clock(),
																			}

																			return "busy"
																		end

																		if not flag2 then
																			if os.clock() - now < n24 then
																				task.wait(delay)
																			end
																		end

																		if flag2 then
																			break
																		end
																	until n24 <= os.clock() - now

																	state.lastMeleePurchase = {
																		name = v2.name,
																		success = ok3,
																		result = tostring(result2),
																		probeResult = tostring(result),
																		attempts = count,
																		requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
																		at = os.clock(),
																	}

																	if v2.name ~= "Electro" then
																		return false
																	end

																	if tostring(result2) ~= "0" then
																		return false
																	end
																	v9, v10 = fn17(arg, true)

																	if v9 then
																		if tonumber(v10) == 2 then
																			fn24(arg, v2.name)
																			state.electricUnlockNeeded = nil
																			state.electricUnlockActive = nil
																			state.electricUnlockPhase = "complete"
																			state.electricEquipPending = true
																			state.status = "Auto Farm Level | Electric owned; waiting to equip"
																			return "busy"
																		end
																	end

																	state.meleePurchaseNeedsNpc[v2.name] = nil
																	state.electricUnlockNeeded = true
																	state.nextElectricUnlockAttemptAt = nil
																	state.status = "Auto Farm Level | Electric requires Lightning Bolt"
																	return "busy"
																end

																if flag then
																	if character2 then
																		if v6 then
																			fn14(arg, v2, character2)
																		end
																	end
																end

																str2 = flag

																if str2 then
																	str2 = "busy"
																end

																str2 = str2 or false
																return str2
															end

															fn24(arg, v2.name)
															format2 = string.format
															str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
															display3 = v2.display or v2.name
															value = arg.Beli.Value
															price = v2.price or 0
															state.status = format2(str4, display3, value, price)
															return false
														end
													end

													fn24(arg, v2.name)
													state.status = "Auto Farm Level | Electric Claw trial"
													return "busy"
												end

												if fn23(arg, v2) then
													meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
													state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
													flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

													if not flag4 then
														state.meleePurchaseNeedsNpc[v2.name] = true
														state.nextMeleePurchaseAt = 0
														flag4 = true
													end

													character = arg.LocalPlayer.Character
													character2 = character

													if character2 then
														character2 = character:FindFirstChild("HumanoidRootPart")
													end

													v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
													state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

													if v7 then
														now2 = os.clock()
														nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

														if now2 < nextMeleePurchaseAt then
															str = v6

															if str then
																str = "busy"
															end

															str = str or false
															return str
														end

														state.nextMeleePurchaseAt = os.clock() + n24
														ok, result = pcall(getResponse2, arg, v2)

														state.lastMeleeProbe = {
															name = v2.name,
															success = ok,
															result = tostring(result),
															at = os.clock(),
														}

														if v2.name == "Electric Claw" then
															if tonumber(result) == 4 then
																state.meleePurchaseNeedsNpc[v2.name] = nil
																state.utilityElectricClawProbeResult = 4
																state.nextUtilityElectricClawProbeAt = 0
																state.status = "Auto Farm Level | Electric Claw trial pending"
																return "busy"
															end
														end

														now = os.clock()
														count = 0

														repeat
															count += 1
															ok2, result3 = pcall(getResponse, arg, v2)
															ok3 = ok2
															result2 = result3

															if ok3 then
																task.wait(0.1)
																getMoveset2(arg, v2)
															end

															fn8(arg, v2)
															v8, meleeCurrentMastery3 = fn9(arg)

															if fn7(v8, v2) then
																state.meleePurchaseNeedsNpc[v2.name] = nil

																if v2.name == "Electro" then
																	state.electricUnlockNeeded = nil
																	state.electricEquipPending = nil
																	state.nextElectricUnlockAttemptAt = nil
																	state.electroQuestState = 2
																end

																state.meleeCurrentMastery = meleeCurrentMastery3
																format = string.format
																str3 = "Auto Farm Level | %s equipped (%d/%d)"
																display2 = v2.display or v2.name
																state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

																state.lastMeleePurchase = {
																	name = v2.name,
																	success = ok3,
																	result = tostring(result2),
																	probeResult = tostring(result),
																	attempts = count,
																	acquired = true,
																	at = os.clock(),
																}

																return "busy"
															end

															if not flag2 then
																if os.clock() - now < n24 then
																	task.wait(delay)
																end
															end

															if flag2 then
																break
															end
														until n24 <= os.clock() - now

														state.lastMeleePurchase = {
															name = v2.name,
															success = ok3,
															result = tostring(result2),
															probeResult = tostring(result),
															attempts = count,
															requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
															at = os.clock(),
														}

														if v2.name ~= "Electro" then
															return false
														end

														if tostring(result2) ~= "0" then
															return false
														end
														v9, v10 = fn17(arg, true)

														if v9 then
															if tonumber(v10) == 2 then
																fn24(arg, v2.name)
																state.electricUnlockNeeded = nil
																state.electricUnlockActive = nil
																state.electricUnlockPhase = "complete"
																state.electricEquipPending = true
																state.status = "Auto Farm Level | Electric owned; waiting to equip"
																return "busy"
															end
														end

														state.meleePurchaseNeedsNpc[v2.name] = nil
														state.electricUnlockNeeded = true
														state.nextElectricUnlockAttemptAt = nil
														state.status = "Auto Farm Level | Electric requires Lightning Bolt"
														return "busy"
													end

													if flag then
														if character2 then
															if v6 then
																fn14(arg, v2, character2)
															end
														end
													end

													str2 = flag

													if str2 then
														str2 = "busy"
													end

													str2 = str2 or false
													return str2
												end

												fn24(arg, v2.name)
												format2 = string.format
												str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
												display3 = v2.display or v2.name
												value = arg.Beli.Value
												price = v2.price or 0
												state.status = format2(str4, display3, value, price)
												return false
											end

											state.electricEquipPending = true
											if flag then
												return arg.Functions.AutoElectricUnlock("Auto Farm Level")
											end
											n25 = 899373327

											if fn7(v, v2) then
												fn24(arg, v2.name)

												if v2.name == "Electro" then
													state.electricEquipPending = nil
												end

												state.meleeCurrentMastery = meleeCurrentMastery

												if v2.goal <= meleeCurrentMastery then
													meleeMastery[v2.name] = meleeCurrentMastery
												end

												return true
											end

											if getInstance2(arg, v2) then
												fn24(arg, v2.name)
												display = v2.display or v2.name
												state.status = "Auto Farm Level | Equipping " .. display
												if not fn8(arg, v2) then
													return "busy"
												end
												v3, meleeCurrentMastery2 = fn9(arg)

												if fn7(v3, v2) then
													if v2.name == "Electro" then
														state.electricEquipPending = nil
													end

													state.meleeCurrentMastery = meleeCurrentMastery2
													return "busy"
												end

												return "busy"
											end

											if moveset then
												fn24(arg, v2.name)
												return fn16(arg, v2, flag)
											end

											if fn6(arg) < v2.minSea then
												fn24(arg, v2.name)
												state.meleeWaitingForSea = v2.minSea
												return false
											end

											state.meleeWaitingForSea = nil

											if v2.name == "Death Step" then
												if getCharacter(arg, "Library Key") then
													state.meleePrerequisite = v2.name
												elseif fn20(arg, false) then
													if state.meleePrerequisite == v2.name then
														state.meleePrerequisite = nil
													end
												else
													state.meleePrerequisite = v2.name
												end
											elseif v2.name == "Sharkman Karate" then
												sharkmanUnlockProbeResult = nil

												if getCharacter(arg, "Water Key") then
													state.meleePrerequisite = v2.name
												else
													sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
												end

												if tonumber(sharkmanUnlockProbeResult) == 1 then
													state.sharkmanUnlockConfirmed = true

													if state.meleePrerequisite == v2.name then
														state.meleePrerequisite = nil
													end
												elseif fn19(sharkmanUnlockProbeResult) then
													state.meleePrerequisite = v2.name
												end
											end

											if not flag then
												if state.meleePrerequisite == v2.name then
													fn24(arg, v2.name)
													return false
												end
											end

											n26 = 121813377

											if flag then
												if fn6(arg) == 2 then
													if fn22(arg, v2) then
														fn24(arg, v2.name)
														return "busy"
													end
												end
											end

											if v2.name == "Dragon Talon" then
												v4 = flag

												if v4 then
													v4 = fn29(arg, v2)
												end

												if v4 == "defer" then
													fn24(arg, v2.name)
													return false
												end

												if v4 then
													fn24(arg, v2.name)
													return "busy"
												end

												if not flag then
													if not getCharacter(arg, "Fire Essence") then
														if state.fireEssenceDelivered ~= true then
															v11, v5 = fn18(arg, false)
															flag3 = v11

															if flag3 then
																flag3 = type(v5) == "string"
															end

															if flag3 then
																flag3 = string.find(string.lower(v5), "heart ablaze", 1, true) ~= nil
															end

															if flag3 then
																state.dragonTalonNeedsEssence = true
																fn24(arg, v2.name)
																return false
															end
														end
													end
												end
											end

											if v2.name == "Electric Claw" then
												if not state.electricClawUtilityActive then
													if tonumber(state.utilityElectricClawProbeResult) ~= 4 then
														if fn23(arg, v2) then
															meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
															state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
															flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

															if not flag4 then
																state.meleePurchaseNeedsNpc[v2.name] = true
																state.nextMeleePurchaseAt = 0
																flag4 = true
															end

															character = arg.LocalPlayer.Character
															character2 = character

															if character2 then
																character2 = character:FindFirstChild("HumanoidRootPart")
															end

															v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
															state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

															if v7 then
																now2 = os.clock()
																nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

																if now2 < nextMeleePurchaseAt then
																	str = v6

																	if str then
																		str = "busy"
																	end

																	str = str or false
																	return str
																end

																state.nextMeleePurchaseAt = os.clock() + n24
																ok, result = pcall(getResponse2, arg, v2)

																state.lastMeleeProbe = {
																	name = v2.name,
																	success = ok,
																	result = tostring(result),
																	at = os.clock(),
																}

																if v2.name == "Electric Claw" then
																	if tonumber(result) == 4 then
																		state.meleePurchaseNeedsNpc[v2.name] = nil
																		state.utilityElectricClawProbeResult = 4
																		state.nextUtilityElectricClawProbeAt = 0
																		state.status = "Auto Farm Level | Electric Claw trial pending"
																		return "busy"
																	end
																end

																now = os.clock()
																count = 0

																repeat
																	count += 1
																	ok2, result3 = pcall(getResponse, arg, v2)
																	ok3 = ok2
																	result2 = result3

																	if ok3 then
																		task.wait(0.1)
																		getMoveset2(arg, v2)
																	end

																	fn8(arg, v2)
																	v8, meleeCurrentMastery3 = fn9(arg)

																	if fn7(v8, v2) then
																		state.meleePurchaseNeedsNpc[v2.name] = nil

																		if v2.name == "Electro" then
																			state.electricUnlockNeeded = nil
																			state.electricEquipPending = nil
																			state.nextElectricUnlockAttemptAt = nil
																			state.electroQuestState = 2
																		end

																		state.meleeCurrentMastery = meleeCurrentMastery3
																		format = string.format
																		str3 = "Auto Farm Level | %s equipped (%d/%d)"
																		display2 = v2.display or v2.name
																		state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

																		state.lastMeleePurchase = {
																			name = v2.name,
																			success = ok3,
																			result = tostring(result2),
																			probeResult = tostring(result),
																			attempts = count,
																			acquired = true,
																			at = os.clock(),
																		}

																		return "busy"
																	end

																	if not flag2 then
																		if os.clock() - now < n24 then
																			task.wait(delay)
																		end
																	end

																	if flag2 then
																		break
																	end
																until n24 <= os.clock() - now

																state.lastMeleePurchase = {
																	name = v2.name,
																	success = ok3,
																	result = tostring(result2),
																	probeResult = tostring(result),
																	attempts = count,
																	requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
																	at = os.clock(),
																}

																if v2.name ~= "Electro" then
																	return false
																end

																if tostring(result2) ~= "0" then
																	return false
																end
																v9, v10 = fn17(arg, true)

																if v9 then
																	if tonumber(v10) == 2 then
																		fn24(arg, v2.name)
																		state.electricUnlockNeeded = nil
																		state.electricUnlockActive = nil
																		state.electricUnlockPhase = "complete"
																		state.electricEquipPending = true
																		state.status = "Auto Farm Level | Electric owned; waiting to equip"
																		return "busy"
																	end
																end

																state.meleePurchaseNeedsNpc[v2.name] = nil
																state.electricUnlockNeeded = true
																state.nextElectricUnlockAttemptAt = nil
																state.status = "Auto Farm Level | Electric requires Lightning Bolt"
																return "busy"
															end

															if flag then
																if character2 then
																	if v6 then
																		fn14(arg, v2, character2)
																	end
																end
															end

															str2 = flag

															if str2 then
																str2 = "busy"
															end

															str2 = str2 or false
															return str2
														end

														fn24(arg, v2.name)
														format2 = string.format
														str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
														display3 = v2.display or v2.name
														value = arg.Beli.Value
														price = v2.price or 0
														state.status = format2(str4, display3, value, price)
														return false
													end
												end

												fn24(arg, v2.name)
												state.status = "Auto Farm Level | Electric Claw trial"
												return "busy"
											end

											if fn23(arg, v2) then
												meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
												state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
												flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

												if not flag4 then
													state.meleePurchaseNeedsNpc[v2.name] = true
													state.nextMeleePurchaseAt = 0
													flag4 = true
												end

												character = arg.LocalPlayer.Character
												character2 = character

												if character2 then
													character2 = character:FindFirstChild("HumanoidRootPart")
												end

												v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
												state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

												if v7 then
													now2 = os.clock()
													nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

													if now2 < nextMeleePurchaseAt then
														str = v6

														if str then
															str = "busy"
														end

														str = str or false
														return str
													end

													state.nextMeleePurchaseAt = os.clock() + n24
													ok, result = pcall(getResponse2, arg, v2)

													state.lastMeleeProbe = {
														name = v2.name,
														success = ok,
														result = tostring(result),
														at = os.clock(),
													}

													if v2.name == "Electric Claw" then
														if tonumber(result) == 4 then
															state.meleePurchaseNeedsNpc[v2.name] = nil
															state.utilityElectricClawProbeResult = 4
															state.nextUtilityElectricClawProbeAt = 0
															state.status = "Auto Farm Level | Electric Claw trial pending"
															return "busy"
														end
													end

													now = os.clock()
													count = 0

													repeat
														count += 1
														ok2, result3 = pcall(getResponse, arg, v2)
														ok3 = ok2
														result2 = result3

														if ok3 then
															task.wait(0.1)
															getMoveset2(arg, v2)
														end

														fn8(arg, v2)
														v8, meleeCurrentMastery3 = fn9(arg)

														if fn7(v8, v2) then
															state.meleePurchaseNeedsNpc[v2.name] = nil

															if v2.name == "Electro" then
																state.electricUnlockNeeded = nil
																state.electricEquipPending = nil
																state.nextElectricUnlockAttemptAt = nil
																state.electroQuestState = 2
															end

															state.meleeCurrentMastery = meleeCurrentMastery3
															format = string.format
															str3 = "Auto Farm Level | %s equipped (%d/%d)"
															display2 = v2.display or v2.name
															state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

															state.lastMeleePurchase = {
																name = v2.name,
																success = ok3,
																result = tostring(result2),
																probeResult = tostring(result),
																attempts = count,
																acquired = true,
																at = os.clock(),
															}

															return "busy"
														end

														if not flag2 then
															if os.clock() - now < n24 then
																task.wait(delay)
															end
														end

														if flag2 then
															break
														end
													until n24 <= os.clock() - now

													state.lastMeleePurchase = {
														name = v2.name,
														success = ok3,
														result = tostring(result2),
														probeResult = tostring(result),
														attempts = count,
														requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
														at = os.clock(),
													}

													if v2.name ~= "Electro" then
														return false
													end

													if tostring(result2) ~= "0" then
														return false
													end
													v9, v10 = fn17(arg, true)

													if v9 then
														if tonumber(v10) == 2 then
															fn24(arg, v2.name)
															state.electricUnlockNeeded = nil
															state.electricUnlockActive = nil
															state.electricUnlockPhase = "complete"
															state.electricEquipPending = true
															state.status = "Auto Farm Level | Electric owned; waiting to equip"
															return "busy"
														end
													end

													state.meleePurchaseNeedsNpc[v2.name] = nil
													state.electricUnlockNeeded = true
													state.nextElectricUnlockAttemptAt = nil
													state.status = "Auto Farm Level | Electric requires Lightning Bolt"
													return "busy"
												end

												if flag then
													if character2 then
														if v6 then
															fn14(arg, v2, character2)
														end
													end
												end

												str2 = flag

												if str2 then
													str2 = "busy"
												end

												str2 = str2 or false
												return str2
											end

											fn24(arg, v2.name)
											format2 = string.format
											str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
											display3 = v2.display or v2.name
											value = arg.Beli.Value
											price = v2.price or 0
											state.status = format2(str4, display3, value, price)
											return false
										end

										if v12 then
											if v13 ~= nil then
												fn24(arg, v2.name)
												state.electricUnlockNeeded = true
												state.electricUnlockPhase = "quest-state-" .. tostring(v13)
												state.status = "Material Farming | Electro | Lightning Bolt Quest"
												if flag then
													return arg.Functions.AutoElectricUnlock("Auto Farm Level")
												end
												return false
											end
										end

										if state.electricUnlockNeeded then
											fn24(arg, v2.name)
											if flag then
												return arg.Functions.AutoElectricUnlock("Auto Farm Level")
											end
											return false
										end

										n25 = 899373327

										if fn7(v, v2) then
											fn24(arg, v2.name)

											if v2.name == "Electro" then
												state.electricEquipPending = nil
											end

											state.meleeCurrentMastery = meleeCurrentMastery

											if v2.goal <= meleeCurrentMastery then
												meleeMastery[v2.name] = meleeCurrentMastery
											end

											return true
										end

										if getInstance2(arg, v2) then
											fn24(arg, v2.name)
											display = v2.display or v2.name
											state.status = "Auto Farm Level | Equipping " .. display
											if not fn8(arg, v2) then
												return "busy"
											end
											v3, meleeCurrentMastery2 = fn9(arg)

											if fn7(v3, v2) then
												if v2.name == "Electro" then
													state.electricEquipPending = nil
												end

												state.meleeCurrentMastery = meleeCurrentMastery2
												return "busy"
											end

											return "busy"
										end

										if moveset then
											fn24(arg, v2.name)
											return fn16(arg, v2, flag)
										end

										if fn6(arg) < v2.minSea then
											fn24(arg, v2.name)
											state.meleeWaitingForSea = v2.minSea
											return false
										end

										state.meleeWaitingForSea = nil

										if v2.name == "Death Step" then
											if getCharacter(arg, "Library Key") then
												state.meleePrerequisite = v2.name
											elseif fn20(arg, false) then
												if state.meleePrerequisite == v2.name then
													state.meleePrerequisite = nil
												end
											else
												state.meleePrerequisite = v2.name
											end
										elseif v2.name == "Sharkman Karate" then
											sharkmanUnlockProbeResult = nil

											if getCharacter(arg, "Water Key") then
												state.meleePrerequisite = v2.name
											else
												sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
											end

											if tonumber(sharkmanUnlockProbeResult) == 1 then
												state.sharkmanUnlockConfirmed = true

												if state.meleePrerequisite == v2.name then
													state.meleePrerequisite = nil
												end
											elseif fn19(sharkmanUnlockProbeResult) then
												state.meleePrerequisite = v2.name
											end
										end

										if not flag then
											if state.meleePrerequisite == v2.name then
												fn24(arg, v2.name)
												return false
											end
										end

										n26 = 121813377

										if flag then
											if fn6(arg) == 2 then
												if fn22(arg, v2) then
													fn24(arg, v2.name)
													return "busy"
												end
											end
										end

										if v2.name == "Dragon Talon" then
											v4 = flag

											if v4 then
												v4 = fn29(arg, v2)
											end

											if v4 == "defer" then
												fn24(arg, v2.name)
												return false
											end

											if v4 then
												fn24(arg, v2.name)
												return "busy"
											end

											if not flag then
												if not getCharacter(arg, "Fire Essence") then
													if state.fireEssenceDelivered ~= true then
														v11, v5 = fn18(arg, false)
														flag3 = v11

														if flag3 then
															flag3 = type(v5) == "string"
														end

														if flag3 then
															flag3 = string.find(string.lower(v5), "heart ablaze", 1, true) ~= nil
														end

														if flag3 then
															state.dragonTalonNeedsEssence = true
															fn24(arg, v2.name)
															return false
														end
													end
												end
											end
										end

										if v2.name == "Electric Claw" then
											if not state.electricClawUtilityActive then
												if tonumber(state.utilityElectricClawProbeResult) ~= 4 then
													if fn23(arg, v2) then
														meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
														state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
														flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

														if not flag4 then
															state.meleePurchaseNeedsNpc[v2.name] = true
															state.nextMeleePurchaseAt = 0
															flag4 = true
														end

														character = arg.LocalPlayer.Character
														character2 = character

														if character2 then
															character2 = character:FindFirstChild("HumanoidRootPart")
														end

														v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
														state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

														if v7 then
															now2 = os.clock()
															nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

															if now2 < nextMeleePurchaseAt then
																str = v6

																if str then
																	str = "busy"
																end

																str = str or false
																return str
															end

															state.nextMeleePurchaseAt = os.clock() + n24
															ok, result = pcall(getResponse2, arg, v2)

															state.lastMeleeProbe = {
																name = v2.name,
																success = ok,
																result = tostring(result),
																at = os.clock(),
															}

															if v2.name == "Electric Claw" then
																if tonumber(result) == 4 then
																	state.meleePurchaseNeedsNpc[v2.name] = nil
																	state.utilityElectricClawProbeResult = 4
																	state.nextUtilityElectricClawProbeAt = 0
																	state.status = "Auto Farm Level | Electric Claw trial pending"
																	return "busy"
																end
															end

															now = os.clock()
															count = 0

															repeat
																count += 1
																ok2, result3 = pcall(getResponse, arg, v2)
																ok3 = ok2
																result2 = result3

																if ok3 then
																	task.wait(0.1)
																	getMoveset2(arg, v2)
																end

																fn8(arg, v2)
																v8, meleeCurrentMastery3 = fn9(arg)

																if fn7(v8, v2) then
																	state.meleePurchaseNeedsNpc[v2.name] = nil

																	if v2.name == "Electro" then
																		state.electricUnlockNeeded = nil
																		state.electricEquipPending = nil
																		state.nextElectricUnlockAttemptAt = nil
																		state.electroQuestState = 2
																	end

																	state.meleeCurrentMastery = meleeCurrentMastery3
																	format = string.format
																	str3 = "Auto Farm Level | %s equipped (%d/%d)"
																	display2 = v2.display or v2.name
																	state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

																	state.lastMeleePurchase = {
																		name = v2.name,
																		success = ok3,
																		result = tostring(result2),
																		probeResult = tostring(result),
																		attempts = count,
																		acquired = true,
																		at = os.clock(),
																	}

																	return "busy"
																end

																if not flag2 then
																	if os.clock() - now < n24 then
																		task.wait(delay)
																	end
																end

																if flag2 then
																	break
																end
															until n24 <= os.clock() - now

															state.lastMeleePurchase = {
																name = v2.name,
																success = ok3,
																result = tostring(result2),
																probeResult = tostring(result),
																attempts = count,
																requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
																at = os.clock(),
															}

															if v2.name ~= "Electro" then
																return false
															end

															if tostring(result2) ~= "0" then
																return false
															end
															v9, v10 = fn17(arg, true)

															if v9 then
																if tonumber(v10) == 2 then
																	fn24(arg, v2.name)
																	state.electricUnlockNeeded = nil
																	state.electricUnlockActive = nil
																	state.electricUnlockPhase = "complete"
																	state.electricEquipPending = true
																	state.status = "Auto Farm Level | Electric owned; waiting to equip"
																	return "busy"
																end
															end

															state.meleePurchaseNeedsNpc[v2.name] = nil
															state.electricUnlockNeeded = true
															state.nextElectricUnlockAttemptAt = nil
															state.status = "Auto Farm Level | Electric requires Lightning Bolt"
															return "busy"
														end

														if flag then
															if character2 then
																if v6 then
																	fn14(arg, v2, character2)
																end
															end
														end

														str2 = flag

														if str2 then
															str2 = "busy"
														end

														str2 = str2 or false
														return str2
													end

													fn24(arg, v2.name)
													format2 = string.format
													str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
													display3 = v2.display or v2.name
													value = arg.Beli.Value
													price = v2.price or 0
													state.status = format2(str4, display3, value, price)
													return false
												end
											end

											fn24(arg, v2.name)
											state.status = "Auto Farm Level | Electric Claw trial"
											return "busy"
										end

										if fn23(arg, v2) then
											meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
											state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
											flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

											if not flag4 then
												state.meleePurchaseNeedsNpc[v2.name] = true
												state.nextMeleePurchaseAt = 0
												flag4 = true
											end

											character = arg.LocalPlayer.Character
											character2 = character

											if character2 then
												character2 = character:FindFirstChild("HumanoidRootPart")
											end

											v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
											state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

											if v7 then
												now2 = os.clock()
												nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

												if now2 < nextMeleePurchaseAt then
													str = v6

													if str then
														str = "busy"
													end

													str = str or false
													return str
												end

												state.nextMeleePurchaseAt = os.clock() + n24
												ok, result = pcall(getResponse2, arg, v2)

												state.lastMeleeProbe = {
													name = v2.name,
													success = ok,
													result = tostring(result),
													at = os.clock(),
												}

												if v2.name == "Electric Claw" then
													if tonumber(result) == 4 then
														state.meleePurchaseNeedsNpc[v2.name] = nil
														state.utilityElectricClawProbeResult = 4
														state.nextUtilityElectricClawProbeAt = 0
														state.status = "Auto Farm Level | Electric Claw trial pending"
														return "busy"
													end
												end

												now = os.clock()
												count = 0

												repeat
													count += 1
													ok2, result3 = pcall(getResponse, arg, v2)
													ok3 = ok2
													result2 = result3

													if ok3 then
														task.wait(0.1)
														getMoveset2(arg, v2)
													end

													fn8(arg, v2)
													v8, meleeCurrentMastery3 = fn9(arg)

													if fn7(v8, v2) then
														state.meleePurchaseNeedsNpc[v2.name] = nil

														if v2.name == "Electro" then
															state.electricUnlockNeeded = nil
															state.electricEquipPending = nil
															state.nextElectricUnlockAttemptAt = nil
															state.electroQuestState = 2
														end

														state.meleeCurrentMastery = meleeCurrentMastery3
														format = string.format
														str3 = "Auto Farm Level | %s equipped (%d/%d)"
														display2 = v2.display or v2.name
														state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

														state.lastMeleePurchase = {
															name = v2.name,
															success = ok3,
															result = tostring(result2),
															probeResult = tostring(result),
															attempts = count,
															acquired = true,
															at = os.clock(),
														}

														return "busy"
													end

													if not flag2 then
														if os.clock() - now < n24 then
															task.wait(delay)
														end
													end

													if flag2 then
														break
													end
												until n24 <= os.clock() - now

												state.lastMeleePurchase = {
													name = v2.name,
													success = ok3,
													result = tostring(result2),
													probeResult = tostring(result),
													attempts = count,
													requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
													at = os.clock(),
												}

												if v2.name ~= "Electro" then
													return false
												end

												if tostring(result2) ~= "0" then
													return false
												end
												v9, v10 = fn17(arg, true)

												if v9 then
													if tonumber(v10) == 2 then
														fn24(arg, v2.name)
														state.electricUnlockNeeded = nil
														state.electricUnlockActive = nil
														state.electricUnlockPhase = "complete"
														state.electricEquipPending = true
														state.status = "Auto Farm Level | Electric owned; waiting to equip"
														return "busy"
													end
												end

												state.meleePurchaseNeedsNpc[v2.name] = nil
												state.electricUnlockNeeded = true
												state.nextElectricUnlockAttemptAt = nil
												state.status = "Auto Farm Level | Electric requires Lightning Bolt"
												return "busy"
											end

											if flag then
												if character2 then
													if v6 then
														fn14(arg, v2, character2)
													end
												end
											end

											str2 = flag

											if str2 then
												str2 = "busy"
											end

											str2 = str2 or false
											return str2
										end

										fn24(arg, v2.name)
										format2 = string.format
										str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
										display3 = v2.display or v2.name
										value = arg.Beli.Value
										price = v2.price or 0
										state.status = format2(str4, display3, value, price)
										return false
									end

									if v12 then
										if v13 ~= nil then
											fn24(arg, v2.name)
											state.electricUnlockNeeded = true
											state.electricUnlockPhase = "quest-state-" .. tostring(v13)
											state.status = "Material Farming | Electro | Lightning Bolt Quest"
											if flag then
												return arg.Functions.AutoElectricUnlock("Auto Farm Level")
											end
											return false
										end
									end

									if state.electricUnlockNeeded then
										fn24(arg, v2.name)
										if flag then
											return arg.Functions.AutoElectricUnlock("Auto Farm Level")
										end
										return false
									end

									n25 = 899373327

									if fn7(v, v2) then
										fn24(arg, v2.name)

										if v2.name == "Electro" then
											state.electricEquipPending = nil
										end

										state.meleeCurrentMastery = meleeCurrentMastery

										if v2.goal <= meleeCurrentMastery then
											meleeMastery[v2.name] = meleeCurrentMastery
										end

										return true
									end

									if getInstance2(arg, v2) then
										fn24(arg, v2.name)
										state.status = "Auto Farm Level | Equipping " .. (v2.display or v2.name)
										if not fn8(arg, v2) then
											return "busy"
										end
										v3, meleeCurrentMastery2 = fn9(arg)

										if fn7(v3, v2) then
											if v2.name == "Electro" then
												state.electricEquipPending = nil
											end

											state.meleeCurrentMastery = meleeCurrentMastery2
											return "busy"
										end

										return "busy"
									end

									if moveset then
										fn24(arg, v2.name)
										return fn16(arg, v2, flag)
									end

									if fn6(arg) < v2.minSea then
										fn24(arg, v2.name)
										state.meleeWaitingForSea = v2.minSea
										return false
									end

									state.meleeWaitingForSea = nil

									if v2.name == "Death Step" then
										if getCharacter(arg, "Library Key") then
											state.meleePrerequisite = v2.name
										elseif fn20(arg, false) then
											if state.meleePrerequisite == v2.name then
												state.meleePrerequisite = nil
											end
										else
											state.meleePrerequisite = v2.name
										end
									elseif v2.name == "Sharkman Karate" then
										sharkmanUnlockProbeResult = nil

										if getCharacter(arg, "Water Key") then
											state.meleePrerequisite = v2.name
										else
											sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
										end

										if tonumber(sharkmanUnlockProbeResult) == 1 then
											state.sharkmanUnlockConfirmed = true

											if state.meleePrerequisite == v2.name then
												state.meleePrerequisite = nil
											end
										elseif fn19(sharkmanUnlockProbeResult) then
											state.meleePrerequisite = v2.name
										end
									end

									if not flag then
										if state.meleePrerequisite == v2.name then
											fn24(arg, v2.name)
											return false
										end
									end

									n26 = 121813377

									if flag then
										if fn6(arg) == 2 then
											if fn22(arg, v2) then
												fn24(arg, v2.name)
												return "busy"
											end
										end
									end

									if v2.name == "Dragon Talon" then
										v4 = flag

										if v4 then
											v4 = fn29(arg, v2)
										end

										if v4 == "defer" then
											fn24(arg, v2.name)
											return false
										end

										if v4 then
											fn24(arg, v2.name)
											return "busy"
										end

										if not flag then
											if not getCharacter(arg, "Fire Essence") then
												if state.fireEssenceDelivered ~= true then
													flag3, v5 = fn18(arg, false)

													if flag3 then
														flag3 = type(v5) == "string"
													end

													if flag3 then
														flag3 = string.find(string.lower(v5), "heart ablaze", 1, true) ~= nil
													end

													if flag3 then
														state.dragonTalonNeedsEssence = true
														fn24(arg, v2.name)
														return false
													end
												end
											end
										end
									end

									if v2.name == "Electric Claw" then
										if not state.electricClawUtilityActive then
											if tonumber(state.utilityElectricClawProbeResult) ~= 4 then
												if fn23(arg, v2) then
													meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
													state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
													flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

													if not flag4 then
														state.meleePurchaseNeedsNpc[v2.name] = true
														state.nextMeleePurchaseAt = 0
														flag4 = true
													end

													character = arg.LocalPlayer.Character
													character2 = character

													if character2 then
														character2 = character:FindFirstChild("HumanoidRootPart")
													end

													v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
													state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

													if v7 then
														now2 = os.clock()
														nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

														if now2 < nextMeleePurchaseAt then
															str = v6

															if str then
																str = "busy"
															end

															str = str or false
															return str
														end

														state.nextMeleePurchaseAt = os.clock() + n24
														ok, result = pcall(getResponse2, arg, v2)

														state.lastMeleeProbe = {
															name = v2.name,
															success = ok,
															result = tostring(result),
															at = os.clock(),
														}

														if v2.name == "Electric Claw" then
															if tonumber(result) == 4 then
																state.meleePurchaseNeedsNpc[v2.name] = nil
																state.utilityElectricClawProbeResult = 4
																state.nextUtilityElectricClawProbeAt = 0
																state.status = "Auto Farm Level | Electric Claw trial pending"
																return "busy"
															end
														end

														now = os.clock()
														count = 0

														repeat
															count += 1
															ok2, result3 = pcall(getResponse, arg, v2)
															ok3 = ok2
															result2 = result3

															if ok3 then
																task.wait(0.1)
																getMoveset2(arg, v2)
															end

															fn8(arg, v2)
															v8, meleeCurrentMastery3 = fn9(arg)

															if fn7(v8, v2) then
																state.meleePurchaseNeedsNpc[v2.name] = nil

																if v2.name == "Electro" then
																	state.electricUnlockNeeded = nil
																	state.electricEquipPending = nil
																	state.nextElectricUnlockAttemptAt = nil
																	state.electroQuestState = 2
																end

																state.meleeCurrentMastery = meleeCurrentMastery3
																format = string.format
																str3 = "Auto Farm Level | %s equipped (%d/%d)"
																display2 = v2.display or v2.name
																state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

																state.lastMeleePurchase = {
																	name = v2.name,
																	success = ok3,
																	result = tostring(result2),
																	probeResult = tostring(result),
																	attempts = count,
																	acquired = true,
																	at = os.clock(),
																}

																return "busy"
															end

															if not flag2 then
																if os.clock() - now < n24 then
																	task.wait(delay)
																end
															end

															if flag2 then
																break
															end
														until n24 <= os.clock() - now

														state.lastMeleePurchase = {
															name = v2.name,
															success = ok3,
															result = tostring(result2),
															probeResult = tostring(result),
															attempts = count,
															requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
															at = os.clock(),
														}

														if v2.name ~= "Electro" then
															return false
														end

														if tostring(result2) ~= "0" then
															return false
														end
														v9, v10 = fn17(arg, true)

														if v9 then
															if tonumber(v10) == 2 then
																fn24(arg, v2.name)
																state.electricUnlockNeeded = nil
																state.electricUnlockActive = nil
																state.electricUnlockPhase = "complete"
																state.electricEquipPending = true
																state.status = "Auto Farm Level | Electric owned; waiting to equip"
																return "busy"
															end
														end

														state.meleePurchaseNeedsNpc[v2.name] = nil
														state.electricUnlockNeeded = true
														state.nextElectricUnlockAttemptAt = nil
														state.status = "Auto Farm Level | Electric requires Lightning Bolt"
														return "busy"
													end

													if flag then
														if character2 then
															if v6 then
																fn14(arg, v2, character2)
															end
														end
													end

													str2 = flag

													if str2 then
														str2 = "busy"
													end

													str2 = str2 or false
													return str2
												end

												fn24(arg, v2.name)
												format2 = string.format
												str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
												display3 = v2.display or v2.name
												value = arg.Beli.Value
												price = v2.price or 0
												state.status = format2(str4, display3, value, price)
												return false
											end
										end

										fn24(arg, v2.name)
										state.status = "Auto Farm Level | Electric Claw trial"
										return "busy"
									end

									if fn23(arg, v2) then
										meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}
										state.meleePurchaseNeedsNpc = meleePurchaseNeedsNpc
										flag4 = state.meleePurchaseNeedsNpc[v2.name] == true

										if not flag4 then
											state.meleePurchaseNeedsNpc[v2.name] = true
											state.nextMeleePurchaseAt = 0
											flag4 = true
										end

										character = arg.LocalPlayer.Character
										character2 = character

										if character2 then
											character2 = character:FindFirstChild("HumanoidRootPart")
										end

										v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
										state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

										if v7 then
											now2 = os.clock()
											nextMeleePurchaseAt = state.nextMeleePurchaseAt or 0

											if now2 < nextMeleePurchaseAt then
												str = v6

												if str then
													str = "busy"
												end

												str = str or false
												return str
											end

											state.nextMeleePurchaseAt = os.clock() + n24
											ok, result = pcall(getResponse2, arg, v2)

											state.lastMeleeProbe = {
												name = v2.name,
												success = ok,
												result = tostring(result),
												at = os.clock(),
											}

											if v2.name == "Electric Claw" then
												if tonumber(result) == 4 then
													state.meleePurchaseNeedsNpc[v2.name] = nil
													state.utilityElectricClawProbeResult = 4
													state.nextUtilityElectricClawProbeAt = 0
													state.status = "Auto Farm Level | Electric Claw trial pending"
													return "busy"
												end
											end

											now = os.clock()
											count = 0

											repeat
												count += 1
												ok2, result3 = pcall(getResponse, arg, v2)
												ok3 = ok2
												result2 = result3

												if ok3 then
													task.wait(0.1)
													getMoveset2(arg, v2)
												end

												fn8(arg, v2)
												v8, meleeCurrentMastery3 = fn9(arg)

												if fn7(v8, v2) then
													state.meleePurchaseNeedsNpc[v2.name] = nil

													if v2.name == "Electro" then
														state.electricUnlockNeeded = nil
														state.electricEquipPending = nil
														state.nextElectricUnlockAttemptAt = nil
														state.electroQuestState = 2
													end

													state.meleeCurrentMastery = meleeCurrentMastery3
													format = string.format
													str3 = "Auto Farm Level | %s equipped (%d/%d)"
													display2 = v2.display or v2.name
													state.status = format(str3, display2, meleeCurrentMastery3, v2.goal)

													state.lastMeleePurchase = {
														name = v2.name,
														success = ok3,
														result = tostring(result2),
														probeResult = tostring(result),
														attempts = count,
														acquired = true,
														at = os.clock(),
													}

													return "busy"
												end

												if not flag2 then
													if os.clock() - now < n24 then
														task.wait(delay)
													end
												end

												if flag2 then
													break
												end
											until n24 <= os.clock() - now

											state.lastMeleePurchase = {
												name = v2.name,
												success = ok3,
												result = tostring(result2),
												probeResult = tostring(result),
												attempts = count,
												requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
												at = os.clock(),
											}

											if v2.name ~= "Electro" then
												return false
											end

											if tostring(result2) ~= "0" then
												return false
											end
											v9, v10 = fn17(arg, true)

											if v9 then
												if tonumber(v10) == 2 then
													fn24(arg, v2.name)
													state.electricUnlockNeeded = nil
													state.electricUnlockActive = nil
													state.electricUnlockPhase = "complete"
													state.electricEquipPending = true
													state.status = "Auto Farm Level | Electric owned; waiting to equip"
													return "busy"
												end
											end

											state.meleePurchaseNeedsNpc[v2.name] = nil
											state.electricUnlockNeeded = true
											state.nextElectricUnlockAttemptAt = nil
											state.status = "Auto Farm Level | Electric requires Lightning Bolt"
											return "busy"
										end

										if flag then
											if character2 then
												if v6 then
													fn14(arg, v2, character2)
												end
											end
										end

										str2 = flag

										if str2 then
											str2 = "busy"
										end

										str2 = str2 or false
										return str2
									end

									fn24(arg, v2.name)
									format2 = string.format
									str4 = "Auto Farm Level | Saving for %s (%d/%d Beli)"
									display3 = v2.display or v2.name
									value = arg.Beli.Value
									price = v2.price or 0
									state.status = format2(str4, display3, value, price)
									return false
								end

								n25 = 899373327

								if fn7(v, v2) then
									fn24(arg, v2.name)

									if v2.name == "Electro" then
										state.electricEquipPending = nil
									end

									state.meleeCurrentMastery = meleeCurrentMastery

									if v2.goal <= meleeCurrentMastery then
										meleeMastery[v2.name] = meleeCurrentMastery
									end

									return true
								end

								if getInstance2(arg, v2) then
									fn24(arg, v2.name)
									state.status = "Auto Farm Level | Equipping " .. (v2.display or v2.name)
									if not fn8(arg, v2) then
										return "busy"
									end
									v3, meleeCurrentMastery2 = fn9(arg)

									if fn7(v3, v2) then
										if v2.name == "Electro" then
											state.electricEquipPending = nil
										end

										state.meleeCurrentMastery = meleeCurrentMastery2
										return "busy"
									end

									return "busy"
								end

								if moveset then
									fn24(arg, v2.name)
									return fn16(arg, v2, flag)
								end

								if fn6(arg) < v2.minSea then
									fn24(arg, v2.name)
									state.meleeWaitingForSea = v2.minSea
									return false
								end

								state.meleeWaitingForSea = nil

								if v2.name == "Death Step" then
									if getCharacter(arg, "Library Key") then
										state.meleePrerequisite = v2.name
									elseif fn20(arg, false) then
										if state.meleePrerequisite == v2.name then
											state.meleePrerequisite = nil
										end
									else
										state.meleePrerequisite = v2.name
									end
								elseif v2.name == "Sharkman Karate" then
									sharkmanUnlockProbeResult = nil

									if getCharacter(arg, "Water Key") then
										state.meleePrerequisite = v2.name
									else
										sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
									end

									if tonumber(sharkmanUnlockProbeResult) == 1 then
										state.sharkmanUnlockConfirmed = true

										if state.meleePrerequisite == v2.name then
											state.meleePrerequisite = nil
										end
									elseif fn19(sharkmanUnlockProbeResult) then
										state.meleePrerequisite = v2.name
									end
								end

								if not flag then
									if state.meleePrerequisite == v2.name then
										fn24(arg, v2.name)
										return false
									end
								end

								n26 = 121813377

								if flag then
									if fn6(arg) == 2 then
										if fn22(arg, v2) then
											fn24(arg, v2.name)
											return "busy"
										end
									end
								end

								if v2.name == "Dragon Talon" then
									v4 = flag

									if v4 then
										v4 = fn29(arg, v2)
									end

									if v4 == "defer" then
										fn24(arg, v2.name)
										return false
									end

									if v4 then
										fn24(arg, v2.name)
										return "busy"
									end

									if not flag then
										if not getCharacter(arg, "Fire Essence") then
											if state.fireEssenceDelivered ~= true then
												flag3, v5 = fn18(arg, false)

												if flag3 then
													flag3 = type(v5) == "string"
												end

												if flag3 then
													flag3 = string.find(string.lower(v5), "heart ablaze", 1, true) ~= nil
												end

												if flag3 then
													state.dragonTalonNeedsEssence = true
													fn24(arg, v2.name)
													return false
												end
											end
										end
									end
								end

								if v2.name == "Electric Claw" then
									if not state.electricClawUtilityActive then
										if tonumber(state.utilityElectricClawProbeResult) ~= 4 then
											if fn23(arg, v2) then
												state.meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}

												if state.meleePurchaseNeedsNpc[v2.name] ~= true then
													state.meleePurchaseNeedsNpc[v2.name] = true
													state.nextMeleePurchaseAt = 0
													flag4 = true
												end

												character = arg.LocalPlayer.Character
												character2 = character

												if character2 then
													character2 = character:FindFirstChild("HumanoidRootPart")
												end

												v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
												state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

												if v7 then
													if os.clock() < (state.nextMeleePurchaseAt or 0) then
														str = v6

														if str then
															str = "busy"
														end

														str = str or false
														return str
													end

													state.nextMeleePurchaseAt = os.clock() + n24
													ok, result = pcall(getResponse2, arg, v2)

													state.lastMeleeProbe = {
														name = v2.name,
														success = ok,
														result = tostring(result),
														at = os.clock(),
													}

													if v2.name == "Electric Claw" then
														if tonumber(result) == 4 then
															state.meleePurchaseNeedsNpc[v2.name] = nil
															state.utilityElectricClawProbeResult = 4
															state.nextUtilityElectricClawProbeAt = 0
															state.status = "Auto Farm Level | Electric Claw trial pending"
															return "busy"
														end
													end

													now = os.clock()
													count = 0

													repeat
														count += 1
														ok3, result2 = pcall(getResponse, arg, v2)

														if ok3 then
															task.wait(0.1)
															getMoveset2(arg, v2)
														end

														fn8(arg, v2)
														v8, meleeCurrentMastery3 = fn9(arg)

														if fn7(v8, v2) then
															state.meleePurchaseNeedsNpc[v2.name] = nil

															if v2.name == "Electro" then
																state.electricUnlockNeeded = nil
																state.electricEquipPending = nil
																state.nextElectricUnlockAttemptAt = nil
																state.electroQuestState = 2
															end

															state.meleeCurrentMastery = meleeCurrentMastery3
															format = string.format
															state.status = format("Auto Farm Level | %s equipped (%d/%d)", v2.display or v2.name, meleeCurrentMastery3, v2.goal)

															state.lastMeleePurchase = {
																name = v2.name,
																success = ok3,
																result = tostring(result2),
																probeResult = tostring(result),
																attempts = count,
																acquired = true,
																at = os.clock(),
															}

															return "busy"
														end

														if not flag2 then
															if os.clock() - now < n24 then
																task.wait(delay)
															end
														end

														if flag2 then
															break
														end
													until n24 <= os.clock() - now

													state.lastMeleePurchase = {
														name = v2.name,
														success = ok3,
														result = tostring(result2),
														probeResult = tostring(result),
														attempts = count,
														requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
														at = os.clock(),
													}

													if v2.name ~= "Electro" then
														return false
													end

													if tostring(result2) ~= "0" then
														return false
													end
													v9, v10 = fn17(arg, true)

													if v9 then
														if tonumber(v10) == 2 then
															fn24(arg, v2.name)
															state.electricUnlockNeeded = nil
															state.electricUnlockActive = nil
															state.electricUnlockPhase = "complete"
															state.electricEquipPending = true
															state.status = "Auto Farm Level | Electric owned; waiting to equip"
															return "busy"
														end
													end

													state.meleePurchaseNeedsNpc[v2.name] = nil
													state.electricUnlockNeeded = true
													state.nextElectricUnlockAttemptAt = nil
													state.status = "Auto Farm Level | Electric requires Lightning Bolt"
													return "busy"
												end

												if flag then
													if character2 then
														if v6 then
															fn14(arg, v2, character2)
														end
													end
												end

												str2 = flag

												if str2 then
													str2 = "busy"
												end

												str2 = str2 or false
												return str2
											end

											fn24(arg, v2.name)
											state.status = string.format("Auto Farm Level | Saving for %s (%d/%d Beli)", v2.display or v2.name, arg.Beli.Value, v2.price or 0)
											return false
										end
									end

									fn24(arg, v2.name)
									state.status = "Auto Farm Level | Electric Claw trial"
									return "busy"
								end

								if fn23(arg, v2) then
									state.meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc or {}

									if state.meleePurchaseNeedsNpc[v2.name] ~= true then
										state.meleePurchaseNeedsNpc[v2.name] = true
										state.nextMeleePurchaseAt = 0
										flag4 = true
									end

									character = arg.LocalPlayer.Character
									character2 = character

									if character2 then
										character2 = character:FindFirstChild("HumanoidRootPart")
									end

									v6, meleePurchaseNpcDistance, v7 = fn15(arg, v2, character2)
									state.meleePurchaseNpcDistance = meleePurchaseNpcDistance

									if v7 then
										if os.clock() < (state.nextMeleePurchaseAt or 0) then
											str = v6

											if str then
												str = "busy"
											end

											return str or false
										end

										state.nextMeleePurchaseAt = os.clock() + n24
										ok, result = pcall(getResponse2, arg, v2)

										state.lastMeleeProbe = {
											name = v2.name,
											success = ok,
											result = tostring(result),
											at = os.clock(),
										}

										if v2.name == "Electric Claw" then
											if tonumber(result) == 4 then
												state.meleePurchaseNeedsNpc[v2.name] = nil
												state.utilityElectricClawProbeResult = 4
												state.nextUtilityElectricClawProbeAt = 0
												state.status = "Auto Farm Level | Electric Claw trial pending"
												return "busy"
											end
										end

										now = os.clock()
										count = 0

										repeat
											count += 1
											ok3, result2 = pcall(getResponse, arg, v2)

											if ok3 then
												task.wait(0.1)
												getMoveset2(arg, v2)
											end

											fn8(arg, v2)
											v8, meleeCurrentMastery3 = fn9(arg)

											if fn7(v8, v2) then
												state.meleePurchaseNeedsNpc[v2.name] = nil

												if v2.name == "Electro" then
													state.electricUnlockNeeded = nil
													state.electricEquipPending = nil
													state.nextElectricUnlockAttemptAt = nil
													state.electroQuestState = 2
												end

												state.meleeCurrentMastery = meleeCurrentMastery3
												state.status = string.format("Auto Farm Level | %s equipped (%d/%d)", v2.display or v2.name, meleeCurrentMastery3, v2.goal)

												state.lastMeleePurchase = {
													name = v2.name,
													success = ok3,
													result = tostring(result2),
													probeResult = tostring(result),
													attempts = count,
													acquired = true,
													at = os.clock(),
												}

												return "busy"
											end

											if not flag2 then
												if os.clock() - now < n24 then
													task.wait(delay)
												end
											end

											if flag2 then
												break
											end
										until n24 <= os.clock() - now

										state.lastMeleePurchase = {
											name = v2.name,
											success = ok3,
											result = tostring(result2),
											probeResult = tostring(result),
											attempts = count,
											requiresNpc = state.meleePurchaseNeedsNpc[v2.name] == true,
											at = os.clock(),
										}

										if v2.name ~= "Electro" then
											return false
										end

										if tostring(result2) ~= "0" then
											return false
										end
										v9, v10 = fn17(arg, true)

										if v9 then
											if tonumber(v10) == 2 then
												fn24(arg, v2.name)
												state.electricUnlockNeeded = nil
												state.electricUnlockActive = nil
												state.electricUnlockPhase = "complete"
												state.electricEquipPending = true
												state.status = "Auto Farm Level | Electric owned; waiting to equip"
												return "busy"
											end
										end

										state.meleePurchaseNeedsNpc[v2.name] = nil
										state.electricUnlockNeeded = true
										state.nextElectricUnlockAttemptAt = nil
										state.status = "Auto Farm Level | Electric requires Lightning Bolt"
										return "busy"
									end

									if flag then
										if character2 then
											if v6 then
												fn14(arg, v2, character2)
											end
										end
									end

									str2 = flag

									if str2 then
										str2 = "busy"
									end

									return str2 or false
								end

								fn24(arg, v2.name)
								state.status = string.format("Auto Farm Level | Saving for %s (%d/%d Beli)", v2.display or v2.name, arg.Beli.Value, v2.price or 0)
								return false
							end

							return fn28(arg, flag)
						end
					end
				end

				state.godhumanOwned = true
				fn30(arg)
				return false
			end

			state.status = "Auto Farm Level | Waiting for player data"
			return "busy"
		end,
		runBackground = function(arg)
			local state = arg.State
			local status = state.status
			local v = tbl85.run(arg, { allowMovement = false, background = true })

			state.lastMeleeBackgroundAt = os.clock()
			state.lastMeleeBackgroundResult = tostring(v)
			state.meleeBackgroundStatus = state.status

			if arg.TaskQueue then
				if arg.TaskQueue:top() ~= "Auto Farm Level" then
					state.status = status
				end
			end

			return v
		end,
		runPurchaseMovement = function(arg)
			n15 = 508726002
			n16 = 100301053
			local state = arg.State
			local meleePurchaseNeedsNpc = state.meleePurchaseNeedsNpc
			local meleeTarget = state.meleeTarget
			if type(meleePurchaseNeedsNpc) ~= "table" then
				return false
			end

			if meleePurchaseNeedsNpc[meleeTarget] ~= true then
				return false
			end
			local v = nil

			if meleeTarget == tbl87.name then
				v = tbl87
			else
				for _, v2 in styles do
					if v2.name == meleeTarget then
						v = v2
						break
					end
				end
			end

			if v then
				local v2 = fn13(state.meleeMastery or {})
				local flag = meleeTarget ~= tbl87.name

				if flag then
					flag = not v2 or v2.name ~= meleeTarget
				end

				local flag2 = false

				if meleeTarget == "Dragon Talon" then
					if not getCharacter(arg, "Fire Essence") then
						if state.fireEssenceDelivered ~= true then
							flag2 = state.dragonTalonNeedsEssence == true

							if not flag2 then
								local flag3, v3 = fn18(arg, false)

								if flag3 then
									flag3 = type(v3) == "string"

									if flag3 then
										flag2 = string.find(string.lower(v3), "heart ablaze", 1, true) ~= nil

										if flag2 then
											state.dragonTalonNeedsEssence = true
										end
									else
										flag2 = flag3
									end
								else
									flag2 = flag3
								end
							end
						end
					end
				end

				local moveset

				if meleeTarget == tbl87.name then
					moveset = state.godhumanOwned == true or fn27(arg) ~= nil or arg.Beli.Value < 5000000 or arg.Fragments.Value < 5000
				else
					local moveset2 = flag or getMoveset(arg, v) or fn6(arg) < v.minSea or not fn23(arg, v) or state.meleePrerequisite == meleeTarget

					if not moveset2 then
						moveset2 = meleeTarget == "Electric Claw"

						if moveset2 then
							moveset2 = state.electricClawUtilityActive or tonumber(state.utilityElectricClawProbeResult) == 4
						end
					end

					moveset = moveset2 or flag2
				end

				if moveset then
					fn24(arg, meleeTarget)
					return false
				end
				local character = arg.LocalPlayer.Character
				local character2 = character

				if character2 then
					character2 = character:FindFirstChild("HumanoidRootPart")
				end

				if character2 then
					local purchaseCFrames = getPurchaseCFrames(arg, v)
					if typeof(purchaseCFrames) ~= "CFrame" then
						state.meleePurchaseNpcUnavailable = v.name
						return false
					end
					state.meleePurchaseNpcUnavailable = nil
					if fn14(arg, v, character2) then
						return "busy"
					end
					state.status = "Auto Farm Level | Waiting for " .. (v.display or v.name) .. " purchase"
					return "busy"
				end

				state.status = "Auto Farm Level | Waiting for melee teacher route"
				return "busy"
			end

			fn24(arg, meleeTarget)
			return false
		end,
	}

	local function fn31(state)
		n19 = 975480618
		n20 = 890193617
		local meleePrerequisite = state.meleePrerequisite
		if not meleePrerequisite then
			return nil
		end

		for _, v in styles do
			if v.name == meleePrerequisite then
				if v.key then
					return v
				end
			end
		end
	end

	tbl85.needsMaterialTask = function(arg)
		n17 = 516860443
		if arg.Environment.Configs["Switch Melee"] == false then
			return false
		end
		local state = arg.State
		state.meleeMastery = state.meleeMastery or {}
		fn11(arg)
		fn12(arg)

		if state.godhumanOwned ~= true then
			if not arg.Functions.Owns("Moveset", "Godhuman") then
				if type(arg.Functions.ShouldPrefetchElectric) == "function" then
					if arg.Functions.ShouldPrefetchElectric() then
						state.electricPrefetchPending = true
						return true
					end
				end

				state.electricPrefetchPending = nil
				local v = fn13(state.meleeMastery)
				local v2, sharkmanUnlockProbeResult, godhumanMaterialRequirement

				if v then
					if v.name == "Electro" then
						if getMoveset(arg, v) then
							if state.electricUnlockNeeded then
								state.electricUnlockNeeded = nil
								state.electricUnlockActive = nil
								if fn25(arg) then
									state.godhumanMaterialRequirement = nil
									return true
								end
								v2 = fn31(state)

								if v2 then
									if v2.name == "Death Step" then
										state.godhumanMaterialRequirement = nil
										if getCharacter(arg, "Library Key") then
											return true
										end

										if fn20(arg, false) then
											state.meleePrerequisite = nil
											return false
										end
										return true
									end
								end

								if v2 then
									if v2.name == "Sharkman Karate" then
										state.godhumanMaterialRequirement = nil
										if getCharacter(arg, "Water Key") then
											return true
										end
										sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
										if fn19(sharkmanUnlockProbeResult) then
											return true
										end
										state.meleePrerequisite = nil
										return false
									end
								end

								if v then
									state.godhumanMaterialRequirement = nil
									return false
								end
								godhumanMaterialRequirement = fn27(arg)
								state.godhumanMaterialRequirement = godhumanMaterialRequirement
								return godhumanMaterialRequirement ~= nil
							end

							if fn25(arg) then
								state.godhumanMaterialRequirement = nil
								return true
							end
							v2 = fn31(state)

							if v2 then
								if v2.name == "Death Step" then
									state.godhumanMaterialRequirement = nil
									if getCharacter(arg, "Library Key") then
										return true
									end

									if fn20(arg, false) then
										state.meleePrerequisite = nil
										return false
									end
									return true
								end
							end

							if v2 then
								if v2.name == "Sharkman Karate" then
									state.godhumanMaterialRequirement = nil
									if getCharacter(arg, "Water Key") then
										return true
									end
									sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
									if fn19(sharkmanUnlockProbeResult) then
										return true
									end
									state.meleePrerequisite = nil
									return false
								end
							end

							if v then
								state.godhumanMaterialRequirement = nil
								return false
							end
							godhumanMaterialRequirement = fn27(arg)
							state.godhumanMaterialRequirement = godhumanMaterialRequirement
							return godhumanMaterialRequirement ~= nil
						end

						local v3, v4 = fn17(arg)

						if v3 then
							if tonumber(v4) == 2 then
								state.electricUnlockNeeded = nil
								state.electricUnlockActive = nil
								state.electricUnlockPhase = "complete"
								if fn25(arg) then
									state.godhumanMaterialRequirement = nil
									return true
								end
								v2 = fn31(state)

								if v2 then
									if v2.name == "Death Step" then
										state.godhumanMaterialRequirement = nil
										if getCharacter(arg, "Library Key") then
											return true
										end

										if fn20(arg, false) then
											state.meleePrerequisite = nil
											return false
										end
										return true
									end
								end

								if v2 then
									if v2.name == "Sharkman Karate" then
										state.godhumanMaterialRequirement = nil
										if getCharacter(arg, "Water Key") then
											return true
										end
										sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
										if fn19(sharkmanUnlockProbeResult) then
											return true
										end
										state.meleePrerequisite = nil
										return false
									end
								end

								if v then
									state.godhumanMaterialRequirement = nil
									return false
								end
								godhumanMaterialRequirement = fn27(arg)
								state.godhumanMaterialRequirement = godhumanMaterialRequirement
								return godhumanMaterialRequirement ~= nil
							end
						end

						state.electricUnlockNeeded = true
						local electricUnlockPhase = v4 ~= nil

						if electricUnlockPhase then
							electricUnlockPhase = "quest-state-" .. tostring(v4)
						end

						state.electricUnlockPhase = electricUnlockPhase or "quest-state-pending"
						return true
					end

					if state.electricUnlockNeeded then
						state.electricUnlockNeeded = nil
						state.electricUnlockActive = nil
						if fn25(arg) then
							state.godhumanMaterialRequirement = nil
							return true
						end
						v2 = fn31(state)

						if v2 then
							if v2.name == "Death Step" then
								state.godhumanMaterialRequirement = nil
								if getCharacter(arg, "Library Key") then
									return true
								end

								if fn20(arg, false) then
									state.meleePrerequisite = nil
									return false
								end
								return true
							end
						end

						if v2 then
							if v2.name == "Sharkman Karate" then
								state.godhumanMaterialRequirement = nil
								if getCharacter(arg, "Water Key") then
									return true
								end
								sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
								if fn19(sharkmanUnlockProbeResult) then
									return true
								end
								state.meleePrerequisite = nil
								return false
							end
						end

						if v then
							state.godhumanMaterialRequirement = nil
							return false
						end
						godhumanMaterialRequirement = fn27(arg)
						state.godhumanMaterialRequirement = godhumanMaterialRequirement
						return godhumanMaterialRequirement ~= nil
					end

					if fn25(arg) then
						state.godhumanMaterialRequirement = nil
						return true
					end
					v2 = fn31(state)

					if v2 then
						if v2.name == "Death Step" then
							state.godhumanMaterialRequirement = nil
							if getCharacter(arg, "Library Key") then
								return true
							end

							if fn20(arg, false) then
								state.meleePrerequisite = nil
								return false
							end
							return true
						end
					end

					if v2 then
						if v2.name == "Sharkman Karate" then
							state.godhumanMaterialRequirement = nil
							if getCharacter(arg, "Water Key") then
								return true
							end
							sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
							if fn19(sharkmanUnlockProbeResult) then
								return true
							end
							state.meleePrerequisite = nil
							return false
						end
					end

					if v then
						state.godhumanMaterialRequirement = nil
						return false
					end
					godhumanMaterialRequirement = fn27(arg)
					state.godhumanMaterialRequirement = godhumanMaterialRequirement
					return godhumanMaterialRequirement ~= nil
				end

				if state.electricUnlockNeeded then
					state.electricUnlockNeeded = nil
					state.electricUnlockActive = nil
					if fn25(arg) then
						state.godhumanMaterialRequirement = nil
						return true
					end
					v2 = fn31(state)

					if v2 then
						if v2.name == "Death Step" then
							state.godhumanMaterialRequirement = nil
							if getCharacter(arg, "Library Key") then
								return true
							end

							if fn20(arg, false) then
								state.meleePrerequisite = nil
								return false
							end
							return true
						end
					end

					if v2 then
						if v2.name == "Sharkman Karate" then
							state.godhumanMaterialRequirement = nil
							if getCharacter(arg, "Water Key") then
								return true
							end
							sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
							if fn19(sharkmanUnlockProbeResult) then
								return true
							end
							state.meleePrerequisite = nil
							return false
						end
					end

					if v then
						state.godhumanMaterialRequirement = nil
						return false
					end
					godhumanMaterialRequirement = fn27(arg)
					state.godhumanMaterialRequirement = godhumanMaterialRequirement
					return godhumanMaterialRequirement ~= nil
				end

				if fn25(arg) then
					state.godhumanMaterialRequirement = nil
					return true
				end
				v2 = fn31(state)

				if v2 then
					if v2.name == "Death Step" then
						state.godhumanMaterialRequirement = nil
						if getCharacter(arg, "Library Key") then
							return true
						end

						if fn20(arg, false) then
							state.meleePrerequisite = nil
							return false
						end
						return true
					end
				end

				if v2 then
					if v2.name == "Sharkman Karate" then
						state.godhumanMaterialRequirement = nil
						if getCharacter(arg, "Water Key") then
							return true
						end
						sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
						if fn19(sharkmanUnlockProbeResult) then
							return true
						end
						state.meleePrerequisite = nil
						return false
					end
				end

				if v then
					state.godhumanMaterialRequirement = nil
					return false
				end
				godhumanMaterialRequirement = fn27(arg)
				state.godhumanMaterialRequirement = godhumanMaterialRequirement
				return godhumanMaterialRequirement ~= nil
			end
		end

		state.electricPrefetchPending = nil
		state.electricUnlockNeeded = nil
		state.godhumanMaterialRequirement = nil
		return false
	end

	tbl85.runMaterial = function(arg)
		local worldTravelOwner = "Melee Materials"
		if arg.TaskQueue:top() ~= worldTravelOwner then
			return false
		end
		local state = arg.State

		if state.electricPrefetchPending then
			local v = arg.Functions.AutoElectricPrefetch(worldTravelOwner)

			if v == false then
				state.electricPrefetchPending = nil
				arg.TaskQueue:pop(worldTravelOwner)
			end

			return v
		end

		if tbl85.needsMaterialTask(arg) then
			if state.electricUnlockNeeded then
				return arg.Functions.AutoElectricUnlock(worldTravelOwner)
			end
		end

		local v = fn25(arg)
		if v then
			return fn26(arg, worldTravelOwner, v)
		end
		local godhumanMaterialRequirement = state.godhumanMaterialRequirement
		if godhumanMaterialRequirement then
			state.status = "Material Farming | Godhuman | " .. godhumanMaterialRequirement.name
			return arg.Functions.FarmMaterial(godhumanMaterialRequirement.name, "Godhuman", godhumanMaterialRequirement.count, godhumanMaterialRequirement.sea)
		end
		local v2 = fn31(state)

		if v2 then
			if fn6(arg) ~= 2 then
				state.status = "Sea Travel | Melee Material | " .. v2.key
				local now = os.clock()

				if (state.nextMeleeMaterialTravelAt or 0) <= now then
					state.nextMeleeMaterialTravelAt = now + 5
					state.worldTravelOwner = worldTravelOwner
					state.worldTravelDestination = 2
					state.worldTravelIssuedAt = now

					local ok, result = pcall(function()
						return arg.CommandRemote:InvokeServer("TravelDressrosa")
					end)

					state.lastMeleeMaterialTravel = { ok = ok, result = tostring(result), sea = 2, at = now }
				end

				return true
			end

			local v3 = fn22(arg, v2, worldTravelOwner)

			if not v3 then
				arg.TaskQueue:pop(worldTravelOwner)
			end

			return v3
		end

		arg.TaskQueue:pop(worldTravelOwner)
		return false
	end

	tbl85.needsDragonTalonEssence = function(arg)
		n18 = 719910957
		local state = arg.State

		if fn6(arg) == 3 then
			if not getCharacter(arg, "Fire Essence") then
				if state.fireEssenceDelivered ~= true then
					if state.godhumanOwned ~= true then
						if not arg.Functions.Owns("Moveset", "Dragon Talon") then
							if not arg.Functions.Owns("Moveset", "Godhuman") then
								local dragonTalonNeedsEssence, v = fn18(arg, false)

								if dragonTalonNeedsEssence then
									dragonTalonNeedsEssence = type(v) == "string"
								end

								if dragonTalonNeedsEssence then
									dragonTalonNeedsEssence = string.find(string.lower(v), "heart ablaze", 1, true) ~= nil
								end

								state.dragonTalonNeedsEssence = dragonTalonNeedsEssence
								return dragonTalonNeedsEssence
							end
						end
					end
				end
			end
		end

		state.dragonTalonNeedsEssence = false
		return false
	end

	tbl85.shouldTargetOrderedBoss = function(arg, arg2)
		n21 = 247503192
		n22 = 495827461

		if arg2 == "Awakened Ice Admiral" then
			if fn6(arg) == 2 then
				if not getCharacter(arg, "Library Key") then
					if not arg.Functions.Owns("Moveset", "Death Step") then
						return not fn20(arg, false)
					end
				end
			end

			return false
		end

		if arg2 == "Tide Keeper" then
			if fn6(arg) ~= 2 then
				return false
			end

			if getCharacter(arg, "Water Key") then
				return false
			end

			if not arg.Functions.Owns("Moveset", "Sharkman Karate") then
				local sharkmanUnlockProbeResult = getSharkmanUnlockProbeResult(arg, false)
				local flag = type(sharkmanUnlockProbeResult) == "string"

				if flag then
					flag = string.find(sharkmanUnlockProbeResult, "house keys", 1, true) ~= nil
				end

				return flag
			end

			return false
		end

		return true
	end

	tbl85.Styles = styles
	tbl85.GodhumanMaterials = godhumanMaterials
end

local tbl86

do
	local n15 = 1000000
	local n16 = 12
	local n17 = 12

	local function fn6(arg, arg2)
		local functions = arg.Functions

		if functions then
			if type(functions.IsTaskCurrent) == "function" then
				return functions.IsTaskCurrent(arg2)
			end
		end

		local state = arg.State or {}
		local flag = not state.stopped

		if flag then
			flag = not state.paused
		end

		if flag then
			flag = arg.TaskQueue:top() == arg2
		end

		return flag
	end

	local function fn7(arg)
		arg.raidChipPurchasePendingAt = nil
		arg.raidChipPurchasePendingUntil = nil
		arg.raidChipPurchasePendingFruit = nil
	end

	local function fn8(arg, arg2)
		local flag = arg == true

		if flag then
			flag = arg2 == true or arg2 == 1 or arg2 == "1"
		end

		return flag
	end

	local function fn9(arg, raidChipPurchasePendingFruit, arg2, arg3, arg4)
		local now = arg4 or os.clock()
		local lastRaidPurchase = { success = arg2, result = tostring(arg3), fruit = raidChipPurchasePendingFruit, at = now }
		arg.lastRaidPurchase = lastRaidPurchase
		arg.raidPurchaseHistory = arg.raidPurchaseHistory or {}
		table.insert(arg.raidPurchaseHistory, lastRaidPurchase)

		while n17 < #arg.raidPurchaseHistory do
			table.remove(arg.raidPurchaseHistory, 1)
		end

		if fn8(arg2, arg3) then
			arg.raidChipPurchasePendingAt = now
			arg.raidChipPurchasePendingUntil = now + n16
			arg.raidChipPurchasePendingFruit = raidChipPurchasePendingFruit
			return true
		end

		return false
	end

	local function fn10(arg, arg2, arg3)
		if arg2 then
			fn7(arg)
			return false
		end
		local num = tonumber(arg.raidChipPurchasePendingUntil)

		if num then
			if (arg3 or os.clock()) < num then
				return true
			end
			fn7(arg)
			return false
		end

		return false
	end

	local function getRaidTest(arg)
		local raidTest = (arg.Environment.Configs or {})["Raid Test"]
		local raidTest2 = type(raidTest) == "table"

		if raidTest2 then
			raidTest2 = raidTest
		end

		return raidTest2 or nil
	end

	local function getRaidTest2(arg, arg2)
		local raidTest = getRaidTest(arg)
		local raidTest2 = raidTest

		if raidTest2 then
			raidTest2 = raidTest.Enable == true
		end

		if raidTest2 then
			raidTest2 = type(raidTest.ForcedFruit) == "string"
		end

		if raidTest2 then
			raidTest2 = raidTest.ForcedFruit == arg2
		end

		return raidTest2
	end

	local function getCharacter(arg, name)
		local localPlayer = arg.LocalPlayer
		local character = localPlayer.Character

		if character then
			character = localPlayer.Character:FindFirstChild(name)
		end

		if not character then
			character = localPlayer:FindFirstChildOfClass("Backpack")

			if character then
				character = localPlayer.Backpack:FindFirstChild(name)
			end
		end

		return character
	end

	local function fn11(arg)
		if arg.LocalPlayer:GetAttribute("IslandRaiding") == true then
			return true
		end
		local playerGui = arg.LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local playerGui2 = playerGui

		if playerGui2 then
			playerGui2 = playerGui:FindFirstChild("Main")
		end

		local playerGui3 = playerGui2

		if playerGui3 then
			playerGui3 = playerGui2:FindFirstChild("TopHUDList")
		end

		local playerGui4 = playerGui3

		if playerGui4 then
			playerGui4 = playerGui3:FindFirstChild("RaidTimer")
		end

		if playerGui4 then
			if playerGui4.Visible == true then
				return true
			end
		end

		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChild("HumanoidRootPart")
		end

		local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
		local worldOrigin2 = worldOrigin

		if worldOrigin2 then
			worldOrigin2 = worldOrigin:FindFirstChild("Locations")
		end

		local worldOrigin3 = worldOrigin2

		if worldOrigin3 then
			worldOrigin3 = worldOrigin2:GetChildren()
		end

		worldOrigin3 = worldOrigin3 or {}

		for _, instance in worldOrigin3 do
			if not character2 then
				continue
			end

			if not instance:IsA("BasePart") then
				continue
			end

			if not instance.Name:match("^Island [1-5]$") then
				continue
			end

			if instance.Position.Magnitude > 7000 then
				if (instance.Position - character2.Position).Magnitude < 2000 then
					return true
				end
				continue
			end
		end

		return false
	end

	local function fn12(arg)
		local raidTest = getRaidTest(arg)

		if raidTest then
			if raidTest.Enable == true then
				if arg.State.raidTestComplete ~= true then
					return math.max(1, tonumber(raidTest.FragmentDeficit) or 1000), { canStart = arg.IsSea(2) or arg.IsSea(3) }
				end
			end
		end

		local localPlayer = arg.LocalPlayer
		local n18 = tonumber(localPlayer:GetAttribute("ExpBoostTick")) or 0
		local num = tonumber(localPlayer:GetAttribute("ExpBoost"))
		local flag = num

		if flag then
			flag = num > 0
		end

		if flag then
			flag = n18 > 0
		end

		if flag then
			flag = math.max(0, num - math.max(0, tick() - n18))
		end

		flag = flag or math.max(tonumber(arg.State.expBoostRemaining) or 0, n18 - tick(), 0)
		local Melee = arg.Functions.Owns("Melee", "Godhuman") or arg.Functions.Owns("Moveset", "Godhuman")

		local v = tbl9.decide({
			level = arg.Level.Value,
			fragments = arg.Fragments.Value,
			maximumLevel = tbl9.MaximumLevel,
			ownsDragonClaw = (arg.Functions.Owns("Melee", "Dragon Claw") or arg.Functions.Owns("Moveset", "Dragon Claw")) == true,
			expBoostActive = flag > 0,
			ownsGodhuman = Melee == true,
			inRaidSea = arg.IsSea(2) or arg.IsSea(3),
		})

		if v then
			return v.autoDeficit, v
		end
		arg.State.status = "Auto Raid | Security decision unavailable"
		return 0, nil
	end

	local function fn13(instance)
		if not instance then
			return nil
		end

		if not instance:IsA("Tool") then
			return nil
		end

		for _, attribute in { "StorageKey", "ItemId", "FruitId" } do
			local attribute2 = instance:GetAttribute(attribute)

			if type(attribute2) == "string" then
				if attribute2 ~= "" then
					return attribute2
				end
			end
		end

		local match = instance.Name:match("^%s*(%S+)%s+Fruit$")
		local match2 = match

		if match2 then
			match2 = match .. "-" .. match
		end

		return match2 or nil
	end

	local function fn14(arg, arg2)
		local physicalMoveset = arg.Inventory.PhysicalMoveset or {}
		local v = physicalMoveset[arg2]
		if type(v) == "table" then
			return v
		end

		for _, v2 in physicalMoveset do
			if type(v2) == "table" then
				if (v2.StorageKey or v2.Name) == arg2 then
					return v2
				end
			end
		end
	end

	local function fn15(arg)
		if type(arg) ~= "table" then
			return nil
		end
		return tonumber(arg.Value) or tonumber(arg.Price) or tonumber(arg.Cost)
	end

	local function fn16(arg, arg2)
		local state = arg.State
		if getRaidTest2(arg, arg2) then
			return false
		end
		local preferredFruit = state.preferredFruit ~= state.currentFruit

		if preferredFruit then
			preferredFruit = state.preferredFruit
		end

		preferredFruit = preferredFruit or nil

		if type(arg.Functions.ReservedGrindingFruit) == "function" then
			preferredFruit = arg.Functions.ReservedGrindingFruit()
		end

		if arg2 == preferredFruit then
			return true
		end
		local config = arg.Environment.Config or arg.Environment.Configs
		local config2 = config

		if config2 then
			config2 = config.Fruit or config.Fruit
		end

		local config3 = config2

		if config3 then
			config3 = config2.Fruit
		end

		config3 = config3 or {}

		for _, v in config3 do
			if v == arg2 then
				return true
			end
		end

		return false
	end

	local function fn17(arg)
		local localPlayer = arg.LocalPlayer
		local character = localPlayer.Character

		for _, instance in { localPlayer:FindFirstChildOfClass("Backpack"), character } do
			local instance2 = instance

			if instance2 then
				instance2 = instance:GetChildren()
			end

			instance2 = instance2 or {}

			for _, v in instance2 do
				local v2 = fn13(v)
				if not v2 then
					continue
				end

				if fn16(arg, v2) then
					continue
				end
				local v3 = fn15(fn14(arg, v2))
				if getRaidTest2(arg, v2) then
					return v, v2
				end

				if v3 then
					if v3 < n15 then
						return v, v2
					end
				end
			end
		end
	end

	local function fn18(arg)
		local physicalMoveset = arg.Inventory.PhysicalMoveset or {}
		local raidTest = getRaidTest(arg)
		local raidTest2 = raidTest

		if raidTest2 then
			raidTest2 = raidTest.Enable == true
		end

		if raidTest2 then
			raidTest2 = raidTest.ForcedFruit
		end

		raidTest2 = raidTest2 or nil

		if type(raidTest2) == "string" then
			if raidTest2 ~= "" then
				local v = physicalMoveset[raidTest2]

				if type(v) == "table" then
					if (tonumber(v.Count) or 0) > 0 then
						if not fn16(arg, raidTest2) then
							return raidTest2
						end
					end
				end

				for _, v2 in physicalMoveset do
					if type(v2) ~= "table" then
						continue
					end

					if (v2.StorageKey or v2.Name) ~= raidTest2 then
						continue
					end

					if (tonumber(v2.Count) or 0) > 0 then
						if fn16(arg, raidTest2) then
							continue
						end
						return raidTest2
					end
				end

				return nil
			end
		end

		local tbl87 = {}

		for k, v in pairs(physicalMoveset) do
			if type(v) ~= "table" then
				continue
			end

			if not ((tonumber(v.Count) or 0) > 0) then
				continue
			end
			local storageKey = v.StorageKey or v.Name

			if type(storageKey) ~= "string" then
				if type(k) == "string" then
					storageKey = k
				end
			end

			local v2 = fn15(v)
			if not storageKey then
				continue
			end

			if not v2 then
				continue
			end

			if not getRaidTest2(arg, storageKey) then
				if not (v2 < n15) then
					continue
				end
			end

			if not fn16(arg, storageKey) then
				tbl87[#tbl87 + 1] = { id = storageKey, value = v2 }
			end

			continue
		end

		table.sort(tbl87, function(arg2, arg3)
			return arg2.value < arg3.value
		end)

		if tbl87[1] then
			return tbl87[1].id
		end
	end

	local function getInstance2(character)
		local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
		local worldOrigin2 = worldOrigin

		if worldOrigin2 then
			worldOrigin2 = worldOrigin:FindFirstChild("Locations")
		end

		local n18 = 0
		local instance2 = nil
		local worldOrigin3 = worldOrigin2

		if worldOrigin3 then
			worldOrigin3 = worldOrigin2:GetChildren()
		end

		worldOrigin3 = worldOrigin3 or {}

		for _, instance in worldOrigin3 do
			local num = tonumber(instance.Name:match("^Island (%d+)$"))
			if not num then
				continue
			end

			if not (n18 < num) then
				continue
			end

			if not instance:IsA("BasePart") then
				continue
			end

			if instance.Position.Magnitude > 7000 then
				if (instance.Position - character.Position).Magnitude < 2000 then
					n18 = num
					instance2 = instance
				end
			end
		end

		return instance2
	end

	local function fn19(attribute)
		local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
		local worldOrigin2 = worldOrigin

		if worldOrigin2 then
			worldOrigin2 = worldOrigin:FindFirstChild("Locations")
		end

		local instance2 = nil
		local magnitude2 = math.huge
		local worldOrigin3 = worldOrigin2

		if worldOrigin3 then
			worldOrigin3 = worldOrigin2:GetChildren()
		end

		worldOrigin3 = worldOrigin3 or {}

		for _, instance in worldOrigin3 do
			if not instance:IsA("BasePart") then
				continue
			end

			if not instance.Name:match("^Island %d+$") then
				continue
			end

			if instance.Position.Magnitude > 7000 then
				local offset = attribute - instance.Position
				local magnitude = Vector3.new(offset.X, 0, offset.Z).Magnitude

				if magnitude < magnitude2 then
					magnitude2 = magnitude
					instance2 = instance
				end
			end
		end

		return instance2, magnitude2
	end

	local function fn20(instance, humanoidRootPart, instance2)
		if instance2 then
			if humanoidRootPart then
				local attribute = instance:GetAttribute("OldPosition")

				if typeof(attribute) ~= "Vector3" then
					attribute = humanoidRootPart.Position
				end

				local v, v2 = fn19(attribute)
				local flag = v == instance2

				if flag then
					flag = v2 <= 650
				end

				if flag then
					flag = math.abs(attribute.Y - instance2.Position.Y) <= 500
				end

				return flag
			end
		end

		return instance2 == nil
	end

	local function getNames(character, instance)
		local names = {}
		local tbl87 = {}
		local enemies = workspace:FindFirstChild("Enemies")
		local enemies2 = enemies

		if enemies2 then
			enemies2 = enemies:GetChildren()
		end

		enemies2 = enemies2 or {}

		for _, instance2 in enemies2 do
			local humanoid = instance2:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = instance2:FindFirstChild("HumanoidRootPart")
			local flag = not instance or fn20(instance2, humanoidRootPart, instance)
			if not humanoid then
				continue
			end

			if not (humanoid.Health > 0) then
				continue
			end

			if not humanoidRootPart then
				continue
			end

			if not flag then
				continue
			end

			if not ((humanoidRootPart.Position - character.Position).Magnitude <= 3000) then
				continue
			end

			if instance2.Name == "PirateGrandBrigade" then
				continue
			end

			if instance2.Name == "PirateBrigade" then
				continue
			end

			if instance2.Name ~= "FishBoat" then
				if not tbl87[instance2.Name] then
					tbl87[instance2.Name] = true
					names[#names + 1] = instance2.Name
				end
			end
		end

		return names
	end

	local function fn21()
		return "Ice"
	end

	local function getInstance3(character, instance)
		local enemies = workspace:FindFirstChild("Enemies")
		local magnitude2 = math.huge
		local instance3 = nil
		local enemies2 = enemies

		if enemies2 then
			enemies2 = enemies:GetChildren()
		end

		enemies2 = enemies2 or {}

		for _, instance2 in enemies2 do
			local humanoid = instance2:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = instance2:FindFirstChild("HumanoidRootPart")
			local flag = not instance or fn20(instance2, humanoidRootPart, instance)
			if not humanoid then
				continue
			end

			if not (humanoid.Health > 0) then
				continue
			end

			if not humanoidRootPart then
				continue
			end

			if not flag then
				continue
			end

			if instance2.Name == "PirateGrandBrigade" then
				continue
			end

			if instance2.Name == "PirateBrigade" then
				continue
			end

			if instance2.Name == "FishBoat" then
				continue
			end
			local magnitude = (humanoidRootPart.Position - character.Position).Magnitude

			if magnitude <= 3000 then
				if magnitude < magnitude2 then
					magnitude2 = magnitude
					instance3 = instance2
				end
			end
		end

		return instance3
	end

	local function fn22(arg)
		local map = workspace:FindFirstChild("Map")
		local map2 = map

		if map2 then
			local map3 = map
			local findFirstChild = map.FindFirstChild
			local str = arg.IsSea(3)

			if str then
				str = "Boat Castle"
			end

			map2 = findFirstChild(map3, str or "CircleIsland")
		end

		local map3 = map2

		if map3 then
			map3 = map2:FindFirstChild("RaidSummon2")
		end

		local map4 = map3

		if map4 then
			map4 = map3:FindFirstChild("Button")
		end

		local map5 = map4

		if map5 then
			map5 = map4:FindFirstChild("Main")
		end

		local map6 = map5

		if map6 then
			map6 = map5:IsA("BasePart")
		end

		if map6 then
			map6 = map5.CFrame
		end

		if not map6 then
			map6 = map4

			if map6 then
				map6 = map4:IsA("PVInstance")
			end

			if map6 then
				map6 = map4:GetPivot()
			end
		end

		return map5, map6 or arg.GetNPCCFrame("Mysterious Scientist")
	end

	local function fn23(arg)
		local value = rawget(arg.Environment, "getinstances") or rawget(_G, "getinstances")
		if type(value) ~= "function" then
			return {}
		end
		local instances = {}
		local ok, result = pcall(value)
		if not ok then
			return instances
		end

		if type(result) ~= "table" then
			return instances
		end

		for _, instance in result do
			if typeof(instance) ~= "Instance" then
				continue
			end

			if instance:IsA("ClickDetector") then
				if instance.Parent == nil then
					if instance.MaxActivationDistance == 32 then
						instances[#instances + 1] = instance
					end
				end
			end
		end

		table.sort(instances, function(arg2, arg3)
			return (tonumber(arg2:GetDebugId():match("(%d+)$")) or math.huge) < (tonumber(arg3:GetDebugId():match("(%d+)$")) or math.huge)
		end)

		return instances
	end

	local function fn24(arg, instance, arg2)
		local state = arg.State
		local instances = {}
		local instance2 = instance

		if instance2 then
			instance2 = instance:FindFirstChildOfClass("ClickDetector")
		end

		if instance2 then
			instances[#instances + 1] = instance2
		end

		if state.raidSummonDetector then
			if state.raidSummonDetector.Parent == nil then
				instances[#instances + 1] = state.raidSummonDetector
			end
		end

		for _, v in fn23(arg) do
			if v ~= state.raidSummonDetector then
				instances[#instances + 1] = v
			end
		end

		for _, v in instances do
			if fn6(arg, arg2) then
				if not pcall(fireclickdetector, v) then
					continue
				end
				state.lastRaidDetectorCandidate = v
				task.wait(0.12)

				if fn11(arg) then
					state.raidSummonDetector = v
					state.lastRaidRemoteStartAt = os.clock()
					return true
				end

				if fn6(arg, arg2) then
					continue
				end
				return false
			end

			return false
		end

		return false
	end

	local function fn25(arg, arg2)
		local physicalMoveset = arg.Inventory.PhysicalMoveset

		if physicalMoveset then
			physicalMoveset = arg.Inventory.PhysicalMoveset[arg2]
		end

		if type(physicalMoveset) == "table" then
			physicalMoveset.Count = math.max(0, (tonumber(physicalMoveset.Count) or 1) - 1)
		end
	end

	local function fn26(arg, arg2)
		local state = arg.State

		if arg2 then
			if type(arg.Functions.StopTween) == "function" then
				arg.Functions.StopTween()
			end

			if type(arg.Functions.ReleaseBring) == "function" then
				arg.Functions.ReleaseBring()
			end
		end

		state.raidActive = false
		state.raidIslandKey = nil
		state.raidCombatAnchor = nil
		state.raidSawIsland = nil
		state.raidEndCandidateAt = nil
		state.raidStartRequestedAt = nil
		state.raidStartPendingUntil = nil
		state.lastRaidDetectorCandidate = nil
		state.raidFruitLocks = {}
		state.raidChainReadyAt = nil
		fn7(state)
	end

	tbl86 = {
		run = function(arg, arg2)
			local state = arg.State
			local raidTest = getRaidTest(arg)
			local v = arg.TaskQueue:top()
			if not v then
				return false
			end

			if not fn6(arg, v) then
				return false
			end
			local v2 = fn11(arg)

			if arg2 then
				if not v2 then
					if state.raidActive then
						fn26(arg, true)
					else
						if state.raidSawIsland then
							fn26(arg, true)
							return false
						end

						if state.raidIslandKey then
							fn26(arg, true)
							return false
						end
					end

					return false
				end
			end

			local v3, v4 = fn12(arg)

			if not v2 then
				if v3 <= 0 then
					if state.raidActive == true or state.raidSawIsland ~= nil or state.raidIslandKey ~= nil then
						fn26(arg, true)
						state.raidUnavailableUntil = os.clock() + 3
						state.status = "Godhuman | Raid target reached"
					end

					return false
				end
			end

			if v4 then
				if v4.canStart == true then
					if not v2 then
						if os.clock() < (state.raidChainReadyAt or 0) then
							state.status = "Auto Raid | Preparing next raid"
							return true
						end
					end

					state.raidChainReadyAt = nil
					local character = arg.LocalPlayer.Character
					local character2 = character

					if character2 then
						character2 = character:FindFirstChildOfClass("Humanoid")
					end

					local character3 = character

					if character3 then
						character3 = character:FindFirstChild("HumanoidRootPart")
					end

					if not character2 then
						return true
					end

					if character2.Health <= 0 then
						return true
					end

					if not character3 then
						return true
					end

					if v2 then
						fn7(state)

						if raidTest then
							if raidTest.Enable == true then
								if state.raidTestStartedAt == nil then
									state.raidTestStartedAt = os.clock()
									state.raidTestStartFragments = arg.Fragments.Value
								end
							end
						end

						if state.lastRaidDetectorCandidate then
							state.raidSummonDetector = state.lastRaidDetectorCandidate
							state.lastRaidDetectorCandidate = nil
						end

						local instance = getInstance2(character3)
						state.raidActive = true
						state.raidEndCandidateAt = nil

						if instance then
							state.raidSawIsland = true
							state.raidStartPendingUntil = nil
							state.raidStartRequestedAt = nil
						end

						local instance3 = instance

						if instance3 then
							instance3 = instance.Name
						end

						instance3 = instance3 or "Raid Combat"

						if state.raidIslandKey ~= instance3 then
							arg.Functions.ReleaseBring()
							state.raidIslandKey = instance3
							local instance2 = instance

							if instance2 then
								instance2 = CFrame.new(instance.Position)
							end

							state.raidCombatAnchor = instance2 or nil
						end

						local instance2 = getInstance3(character3, instance)

						if instance2 then
							local names = getNames(character3, instance)
							local humanoidRootPart = instance2:FindFirstChild("HumanoidRootPart")

							if not state.raidCombatAnchor then
								if humanoidRootPart then
									state.raidCombatAnchor = humanoidRootPart.CFrame
								end
							end

							state.status = "Godhuman | Raid combat"
							local combatTarget = arg.Functions.CombatTarget
							local instance4 = instance2
							local v5 = v

							local tbl87 = {
								boss = false,
								preserveBring = true,
								weaponType = "Melee",
								targetNames = names,
								bringRadius = 650,
								maxBringMembers = math.huge,
								bringAnchor = state.raidCombatAnchor,
								raidIsland = instance,
								attackRadius = 120,
							}

							local raidCombatAnchor = state.raidCombatAnchor

							if raidCombatAnchor then
								raidCombatAnchor = state.raidCombatAnchor + Vector3.new(0, 30, 0)
							end

							tbl87.destination = raidCombatAnchor
							local instance5 = instance

							if instance5 then
								instance5 = instance.Name
							end

							tbl87.status = "Auto Raid | " .. (instance5 or "Combat")
							combatTarget(instance4, v5, tbl87)
						elseif instance then
							if state.raidCombatAnchor then
								state.status = "Auto Raid | " .. instance.Name .. " | Waiting wave"
								arg.Functions.TP(state.raidCombatAnchor + Vector3.new(0, 30, 0), v, true)
							else
								state.status = "Godhuman | Moving to " .. instance.Name
								arg.Functions.TP(instance.CFrame + Vector3.new(0, 80, 0), v, true)
							end
						else
							state.status = "Godhuman | Waiting for raid island"
						end

						return true
					end

					if state.raidActive then
						if not state.raidSawIsland then
							local raidStartRequestedAt = state.raidStartRequestedAt or state.raidTestStartedAt or os.clock()
							if os.clock() - raidStartRequestedAt < 30 then
								state.status = "Raid Test | Waiting for first island"
								return true
							end

							if raidTest then
								if raidTest.Enable == true then
									state.raidTestComplete = true

									state.raidTestResult = {
										success = false,
										reason = "raid-island-timeout",
										fruitsUsed = state.raidTestFruitsUsed or 0,
									}

									raidTest.Enable = false
									fn26(arg, true)
									state.status = "Raid Test | Island did not load"
									return false
								end
							end
						end
					end

					if state.raidActive then
						if state.raidSawIsland then
							state.raidEndCandidateAt = state.raidEndCandidateAt or os.clock()
							if os.clock() - state.raidEndCandidateAt < 2 then
								state.status = "Auto Raid | Confirming completion"
								return true
							end
							fn26(arg, true)
							state.raidUnavailableUntil = nil
							state.raidChainReadyAt = os.clock() + 3
							state.status = "Godhuman | Raid complete"
							if not raidTest then
								return true
							end

							if raidTest.Enable ~= true then
								return true
							end
							state.raidTestComplete = true

							local raidTestResult = {
								success = true,
								fruitsUsed = state.raidTestFruitsUsed or 0,
								fragmentsGained = arg.Fragments.Value - (state.raidTestStartFragments or arg.Fragments.Value),
							}

							local raidTestStartedAt = state.raidTestStartedAt

							if raidTestStartedAt then
								raidTestStartedAt = os.clock() - state.raidTestStartedAt
							end

							raidTestResult.elapsed = raidTestStartedAt or 0
							state.raidTestResult = raidTestResult
							raidTest.Enable = false
							state.status = "Raid Test | Complete"
							return true
						end
					end

					if os.clock() < (state.raidUnavailableUntil or 0) then
						return false
					end

					if state.raidStartRequestedAt then
						if os.clock() - state.raidStartRequestedAt >= 30 then
							if raidTest then
								if raidTest.Enable == true then
									state.raidTestComplete = true

									state.raidTestResult = {
										success = false,
										reason = "raid-start-timeout",
										fruitsUsed = state.raidTestFruitsUsed or 0,
									}

									raidTest.Enable = false
									state.raidStartRequestedAt = nil
									state.raidStartPendingUntil = nil
									state.status = "Raid Test | Start timed out"
									return false
								end
							end

							state.status = "Godhuman | Raid start timed out; changing server"
							state.raidStartRequestedAt = nil
							state.raidStartPendingUntil = nil
							state.raidUnavailableUntil = os.clock() + 30
							arg.Functions.HopServer(nil, true)
							return true
						end
					end

					if os.clock() < (state.raidStartPendingUntil or 0) then
						arg.Functions.CancelTween()
						state.status = "Godhuman | Waiting for raid start"
						return true
					end

					local specialMicrochip = getCharacter(arg, "Special Microchip")

					if specialMicrochip then
						fn7(state)
						local v5 = fn22(arg)
						arg.Functions.CancelTween()
						state.raidFruitLocks = {}

						if specialMicrochip.Parent ~= character then
							character2:EquipTool(specialMicrochip)
							state.status = "Godhuman | Equipping raid chip"
							state.nextRaidStartAt = math.max(state.nextRaidStartAt or 0, os.clock() + 0.2)
							return true
						end

						if type(fireclickdetector) ~= "function" then
							return true
						end

						if not ((state.nextRaidStartAt or 0) <= os.clock()) then
							return true
						end
						state.status = "Godhuman | Starting " .. (state.currentRaidType or "Ice") .. " raid"

						if fn24(arg, v5, v) then
							state.nextRaidStartAt = os.clock() + 15
							state.raidStartPendingUntil = os.clock() + 30
							state.raidStartRequestedAt = os.clock()
							return true
						end

						if not fn6(arg, v) then
							return true
						end
						state.nextRaidStartAt = os.clock() + 1
						state.raidStartPendingUntil = nil
						state.raidStartRequestedAt = nil
						state.status = "Godhuman | Retrying remote raid start"
						return true
					end

					if fn10(state, false) then
						arg.Functions.CancelTween()
						state.status = "Godhuman | Waiting for raid chip"
						return true
					end

					if os.clock() < (state.nextRaidPurchaseAt or 0) then
						return true
					end

					if raidTest then
						if raidTest.Enable == true then
							local raidTestFruitsUsed = state.raidTestFruitsUsed or 0

							if (tonumber(raidTest.MaxFruits) or 1) <= raidTestFruitsUsed then
								state.raidTestComplete = true

								state.raidTestResult = {
									success = false,
									reason = "fruit-limit",
									fruitsUsed = state.raidTestFruitsUsed or 0,
								}

								raidTest.Enable = false
								state.status = "Raid Test | Stopped at one fruit"
								return false
							end
						end
					end

					local raidTestCountedCarriedFruit, v5 = fn17(arg)

					if raidTestCountedCarriedFruit then
						if state.fruitStoreInFlight then
							if state.fruitStoreInFlight.id == v5 then
								state.status = "Godhuman | Waiting for fruit storage handoff"
								state.nextRaidPurchaseAt = os.clock() + 0.5
								return true
							end
						end

						state.raidFruitLocks = state.raidFruitLocks or {}
						state.raidFruitLocks[v5] = os.clock() + 30
					end

					if raidTestCountedCarriedFruit then
						if raidTestCountedCarriedFruit.Parent ~= character then
							character2:EquipTool(raidTestCountedCarriedFruit)
							state.status = "Godhuman | Equipping raid fruit"
							state.nextRaidPurchaseAt = os.clock() + 1
							return true
						end
					end

					state.nextRaidPurchaseAt = os.clock() + 5
					local currentRaidType = fn21(arg)
					state.currentRaidType = currentRaidType

					if raidTestCountedCarriedFruit then
						state.status = "Godhuman | Buying " .. currentRaidType .. " raid chip"

						local ok, result = pcall(function()
							return arg.CommandRemote:InvokeServer("RaidsNpc", "Select", currentRaidType)
						end)

						fn9(state, v5, ok, result)

						if raidTest then
							if raidTest.Enable == true then
								if ok then
									if result ~= nil then
										if result ~= false then
											if state.raidTestCountedCarriedFruit ~= raidTestCountedCarriedFruit then
												state.raidTestCountedCarriedFruit = raidTestCountedCarriedFruit
												state.raidTestFruitsUsed = (state.raidTestFruitsUsed or 0) + 1
											end
										end
									end
								end
							end
						end

						state.nextRaidPurchaseAt = os.clock() + 2
						return true
					end

					local v6 = fn18(arg)

					if v6 then
						state.status = "Godhuman | Loading raid fruit"
						state.raidFruitLocks = state.raidFruitLocks or {}
						state.raidFruitLocks[v6] = os.clock() + 30

						local ok, result = pcall(function()
							return arg.CommandRemote:InvokeServer("LoadFruit", v6)
						end)

						state.lastRaidFruitLoad = { fruit = v6, success = ok, result = tostring(result), at = os.clock() }

						if ok then
							fn25(arg, v6)

							if raidTest then
								if raidTest.Enable == true then
									state.raidTestFruitsUsed = (state.raidTestFruitsUsed or 0) + 1
								end
							end

							task.wait(2)
							if not fn6(arg, v) then
								return true
							end

							local ok2, result2 = pcall(function()
								return arg.CommandRemote:InvokeServer("RaidsNpc", "Select", currentRaidType)
							end)

							fn9(state, v6, ok2, result2)
							state.nextRaidPurchaseAt = os.clock() + 2

							if type(arg.Functions.RefreshInventory) == "function" then
								arg.Functions.RefreshInventory(true)
							end

							return true
						end

						state.raidFruitLocks[v6] = nil
						state.nextRaidPurchaseAt = os.clock() + 30
						return true
					end

					state.status = "Godhuman | Waiting for a cheap raid fruit"
					state.raidUnavailableUntil = os.clock() + 60
					return false
				end
			end

			return false
		end,
		isActive = fn11,
		shouldSchedule = function(arg)
			local state = arg.State
			if fn11(arg) then
				return true
			end

			if state.raidActive == true then
				return true
			end

			if state.raidStartRequestedAt ~= nil then
				return true
			end

			if os.clock() < (state.raidStartPendingUntil or 0) then
				return true
			end
			local v, v2 = fn12(arg)
			local num = tonumber(state.raidChainReadyAt)

			if num then
				if not (v <= 0) then
					if os.clock() < num then
						return true
					end
					state.raidChainReadyAt = nil
				else
					state.raidChainReadyAt = nil
				end
			end

			if os.clock() < (state.raidUnavailableUntil or 0) then
				return false
			end

			if not v2 then
				return false
			end

			if v2.canStart ~= true then
				return false
			end

			if not (v <= 0) then
				local flag = getCharacter(arg, "Special Microchip") ~= nil
				if fn10(state, flag) then
					return true
				end
				return flag or fn17(arg) ~= nil or fn18(arg) ~= nil
			end

			return false
		end,
		requiredFragments = fn12,
		resetSession = fn26,
		isChipPurchasePending = fn10,
		recordRaidPurchase = fn9,
	}
end

local tbl87

do
	local str = "Exp Redeem"
	local n15 = 2800
	local n16 = 3
	local n17 = 1
	local n18 = 1
	local str2 = "seahub_exp_codes_"

	local expCodeIndexes = {
		"BANEXPLOIT",
		"NOMOREHACK",
		"WildDares",
		"BossBuild",
		"GetPranked",
		"EARN_FRUITS",
		"Sub2UncleKizaru",
		"FIGHT4FRUIT",
		"kittgaming",
		"TRIPLEABUSE",
		"Sub2CaptainMaui",
		"Sub2Fer999",
		"Enyu_is_Pro",
		"Magicbus",
		"JCWK",
		"Starcodeheo",
		"Bluxxy",
		"SUB2GAMERROBOT_EXP1",
		"Sub2NoobMaster123",
		"Sub2Daigrock",
		"Axiore",
		"TantaiGaming",
		"StrawHatMaine",
		"Sub2OfficialNoobie",
		"TheGreatAce",
		"SEATROLLING",
		"24NOADMIN",
		"ADMIN_TROLL",
		"NEWTROLL",
		"SECRET_ADMIN",
		"staffbattle",
		"NOEXPLOIT",
		"NOOB2ADMIN",
		"CODESLIDE",
		"EASTEREXP",
		"LIGHTNINGABUSE",
	}

	local str3 = table.concat(expCodeIndexes, "\31")

	local function fn6(arg)
		local functions = arg.Functions

		if functions then
			if type(functions.IsTaskCurrent) == "function" then
				return functions.IsTaskCurrent(str)
			end
		end

		local state = arg.State or {}
		local flag = not state.stopped

		if flag then
			flag = not state.paused
		end

		if flag then
			flag = arg.TaskQueue ~= nil
		end

		if flag then
			flag = arg.TaskQueue:top() == str
		end

		return flag
	end

	local function fn7(arg)
		local localPlayer = arg.LocalPlayer

		if localPlayer then
			localPlayer = arg.LocalPlayer.UserId
		end

		if localPlayer == nil then
			return nil
		end
		return str2 .. tostring(localPlayer) .. ".json"
	end

	local function fn8(arg)
		local state = arg.State
		if state.expCodePersistenceLoaded then
			return
		end
		state.expCodePersistenceLoaded = true
		local path = fn7(arg)

		if path then
			if type(readfile) == "function" then
				if type(isfile) == "function" then
					if isfile(path) then
						local ok, result = pcall(function()
							return game:GetService("HttpService"):JSONDecode(readfile(path))
						end)

						if not ok then
							return
						end

						if type(result) ~= "table" then
							return
						end

						if tonumber(result.version) ~= n18 then
							return
						end

						if tostring(result.userId) ~= tostring(arg.LocalPlayer.UserId) then
							return
						end

						if result.signature == str3 then
							local n19 = math.max(1, math.floor(tonumber(result.index) or 1))
							state.expCodeIndex = math.max(tonumber(state.expCodeIndex) or 1, n19)
							state.expCodesExhausted = result.exhausted == true

							state.lastExpCodePersistence = {
								action = "load",
								path = path,
								index = state.expCodeIndex,
								exhausted = state.expCodesExhausted,
								at = os.clock(),
							}

							return
						end

						return
					end
				end
			end
		end
	end

	local function getOk2(arg)
		local state = arg.State
		local path = fn7(arg)

		if path then
			if type(writefile) == "function" then
				local ok, result = pcall(function()
					writefile(path, game:GetService("HttpService"):JSONEncode({
						version = n18,
						userId = arg.LocalPlayer.UserId,
						signature = str3,
						index = state.expCodeIndex or 1,
						exhausted = state.expCodesExhausted == true,
						unix = os.time(),
					}))
				end)

				local lastExpCodePersistence = {
					action = "save",
					path = path,
					index = state.expCodeIndex or 1,
					exhausted = state.expCodesExhausted == true,
					success = ok,
				}

				local error_ = not ok

				if error_ then
					error_ = tostring(result)
				end

				lastExpCodePersistence.error = error_ or nil
				lastExpCodePersistence.at = os.clock()
				state.lastExpCodePersistence = lastExpCodePersistence
				return ok
			end
		end

		return false
	end

	local function fn9(instance)
		local n19 = tonumber(instance:GetAttribute("ExpBoostTick")) or 0
		local num = tonumber(instance:GetAttribute("ExpBoost"))

		if num then
			if num > 0 then
				if n19 > 0 then
					return math.max(0, num - math.max(0, tick() - n19)), n19 + num
				end
			end
		end

		return math.max(0, n19 - tick()), n19
	end

	local function fn10(state, expCodeObservedLevel)
		if state.expCodeObservedLevel == nil then
			state.expCodeObservedLevel = expCodeObservedLevel
		elseif state.expCodeObservedLevel ~= expCodeObservedLevel then
			state.expCodeObservedLevel = expCodeObservedLevel
			state.expCodeObservedProgress = true
		end

		return state.expCodeObservedProgress == true
	end

	local function fn11(arg)
		local flag = type(arg) == "string"

		if flag then
			flag = string.find(arg, "SUCC", 1, true) ~= nil
		end

		return flag
	end

	tbl87 = {
		shouldSchedule = function(arg)
			fn8(arg)
			local value = arg.Level.Value
			local v = fn10(arg.State, value)
			if arg.Environment.Configs["Auto 2x Exp Codes"] == false then
				return false
			end

			if n15 <= value then
				return false
			end

			if arg.State.expCodesExhausted == true then
				return false
			end

			if v then
				local expBoostRemaining = fn9(arg.LocalPlayer)
				arg.State.expBoostRemaining = expBoostRemaining
				local flag = expBoostRemaining <= 0

				if flag then
					flag = os.clock() >= (arg.State.nextExpCodeAttemptAt or 0)
				end

				return flag
			end

			return false
		end,
		run = function(arg)
			if not fn6(arg) then
				return false
			end
			fn8(arg)
			local state = arg.State
			local value = arg.Level.Value
			local v = fn10(state, value)
			local expBoostRemaining, expBoostExpiresAt2 = fn9(arg.LocalPlayer)
			state.expBoostRemaining = expBoostRemaining
			state.expBoostExpiresAt = expBoostExpiresAt2

			if arg.Environment.Configs["Auto 2x Exp Codes"] ~= false then
				if not (n15 <= value) then
					if v then
						if not (expBoostRemaining > 0) then
							if not (os.clock() < (state.nextExpCodeAttemptAt or 0)) then
								local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
								local remotes2 = remotes

								if remotes2 then
									remotes2 = remotes:FindFirstChild("Redeem")
								end

								if remotes2 then
									local expCodeIndex = state.expCodeIndex or 1
									local flag = false

									while fn6(arg) do
										local expCodeIndex2 = expCodeIndexes[expCodeIndex]

										if expCodeIndex2 then
											flag = true
											state.status = "Code Redemption | " .. expCodeIndex2 .. " | Redeeming"
											local expBoostExpiresAt3 = expBoostExpiresAt2

											local ok, result = pcall(function()
												return remotes2:InvokeServer(expCodeIndex2)
											end)

											task.wait()
											local expBoostRemaining2, expBoostExpiresAt = fn9(arg.LocalPlayer)
											local str4 = tostring(result)
											local flag2 = expBoostRemaining2 > 0 or expBoostExpiresAt > expBoostExpiresAt3 or fn11(result)
											state.expBoostRemaining = expBoostRemaining2
											state.expBoostExpiresAt = expBoostExpiresAt

											state.lastExpCode = {
												code = expCodeIndex2,
												success = ok,
												result = str4,
												addedSeconds = math.max(0, expBoostExpiresAt - expBoostExpiresAt3),
												at = os.clock(),
											}

											if ok then
												expCodeIndex += 1
												state.expCodeIndex = expCodeIndex
												getOk2(arg)
												state.status = "Code Redemption | " .. expCodeIndex2 .. " | " .. str4

												if flag2 then
													state.status = "Code Redemption | X2 Exp Boost Activated!"
													if not (expBoostRemaining2 <= 0) then
														return true
													end
													state.nextExpCodeAttemptAt = os.clock() + n17
													return true
												end

												if fn6(arg) then
													expBoostExpiresAt2 = expBoostExpiresAt
													continue
												end
												return flag
											end

											state.nextExpCodeAttemptAt = os.clock() + n16
											return false
										end

										state.expCodesExhausted = true
										state.nextExpCodeAttemptAt = math.huge
										getOk2(arg)
										return flag
									end

									return flag
								end

								state.nextExpCodeAttemptAt = os.clock() + 30
								return false
							end
						end
					end
				end
			end

			return false
		end,
		Codes = expCodeIndexes,
		CodeSignature = str3,
		PersistenceVersion = n18,
		persistenceFile = fn7,
	}
end

local tbl88

do
	local datas = {
		[""] = true,
		["Rocket-Rocket"] = true,
		["Spin-Spin"] = true,
		["Blade-Blade"] = true,
		["Spring-Spring"] = true,
		["Bomb-Bomb"] = true,
		["Spike-Spike"] = true,
	}

	local function getData(arg)
		local data = arg.LocalPlayer:FindFirstChild("Data")
		local data2 = data

		if data2 then
			data2 = data:FindFirstChild("DevilFruit")
		end

		local data3 = data2

		if data3 then
			data3 = tostring(data2.Value)
		end

		return data3 or ""
	end

	local function getInstance2(player, arg)
		for _, instance in { player.Character, player:FindFirstChildOfClass("Backpack") } do
			local instance3 = instance

			if instance3 then
				instance3 = instance:GetChildren()
			end

			instance3 = instance3 or {}

			for _, instance2 in instance3 do
				if instance2:IsA("Tool") then
					if instance2.Name:lower():find(arg:lower(), 1, true) then
						return instance2
					end
				end
			end
		end
	end

	local function fn6(arg, instance, arg2)
		local state = arg.State
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		if character2 then
			if instance.Parent ~= character then
				character2:EquipTool(instance)
				state.nextFruitPolicyAt = os.clock() + 1
				return true
			end

			local eatRemote = instance:FindFirstChild("EatRemote", true)

			if eatRemote then
				state.nextFruitPolicyAt = os.clock() + 10

				local ok, result = pcall(function()
					return eatRemote:InvokeServer()
				end)

				state.lastFruitPolicyAction = { action = "eat", fruit = arg2, success = ok, result = tostring(result), at = os.clock() }
				return ok
			end

			state.nextFruitPolicyAt = os.clock() + 3
			return false
		end

		return false
	end

	local function fn7(arg, arg2, arg3)
		local instance = getInstance2(arg.LocalPlayer, arg2)
		if instance then
			return fn6(arg, instance, arg3)
		end
		local state = arg.State
		local physicalMoveset = arg.Inventory.PhysicalMoveset

		if physicalMoveset then
			physicalMoveset = arg.Inventory.PhysicalMoveset[arg3]
		end

		if not physicalMoveset then
			local physicalMoveset2 = arg.Inventory.PhysicalMoveset or {}

			for _, v in physicalMoveset2 do
				if (v.StorageKey or v.Name) == arg3 then
					physicalMoveset = v
					break
				end
			end
		end

		if type(physicalMoveset) == "table" then
			if not ((tonumber(physicalMoveset.Count) or 0) <= 0) then
				state.nextFruitPolicyAt = os.clock() + 20

				local ok, result = pcall(function()
					return arg.CommandRemote:InvokeServer("LoadFruit", arg3)
				end)

				state.lastFruitPolicyAction = { action = "load", fruit = arg3, success = ok, result = tostring(result), at = os.clock() }
				local ok2 = ok

				if ok2 then
					ok2 = result ~= false
				end

				return ok2
			end
		end

		state.nextFruitPolicyAt = os.clock() + 60
		state.lastFruitPolicyAction = { action = "waiting-for-stored-fruit", fruit = arg3, at = os.clock() }
		return false
	end

	tbl88 = {
		reservedFruit = function(arg)
			if arg.Environment.Configs["Auto Use Grinding Fruit"] == false then
				return nil
			end
			local data = getData(arg)
			local pos = data:lower():find("buddha", 1, true)

			if pos then
				pos = "Buddha-Buddha"
			end

			if not pos then
				pos = arg.IsSea(1)

				if pos then
					pos = "Light-Light"
				end
			end

			pos = pos or "Buddha-Buddha"
			local pos2 = pos ~= data

			if pos2 then
				pos2 = pos
			end

			return pos2 or nil
		end,
		run = function(arg)
			local state = arg.State
			local data = getData(arg)
			state.currentFruit = data
			if arg.Environment.Configs["Auto Use Grinding Fruit"] == false then
				return false
			end

			if data:lower():find("buddha", 1, true) then
				state.preferredFruit = "Buddha-Buddha"
				state.fruitPolicyLocked = true
				return false
			end

			if os.clock() < (state.nextFruitPolicyAt or 0) then
				return false
			end
			state.fruitPolicyLocked = false

			if arg.IsSea(1) then
				state.preferredFruit = "Light-Light"

				if not data:lower():find("light", 1, true) then
					if datas[data] then
						return fn7(arg, "Light", "Light-Light")
					end
				end

				return false
			end

			state.preferredFruit = "Buddha-Buddha"
			return fn7(arg, "Buddha", "Buddha-Buddha")
		end,
	}
end

local function getConfig(arg)
	local environment = arg.Environment
	local config = type(environment.Config) == "table"

	if config then
		config = environment.Config
	end

	config = config or nil
	local configs = type(environment.Configs) == "table"

	if configs then
		configs = environment.Configs
	end

	configs = configs or nil
	local config2 = config

	if config2 then
		config2 = config.Fruit or config.Fruit
	end

	if not config2 then
		config2 = configs

		if config2 then
			config2 = configs.Fruit or configs.Fruit
		end
	end

	return config2
end

local tbl89 = { run = function(arg)
	local config = getConfig(arg)
	if type(config) ~= "table" then
		return false
	end

	if config.Sniper ~= true then
		return false
	end

	if type(config.Fruit) ~= "table" then
		return false
	end

	if #config.Fruit == 0 then
		return false
	end
	local data = arg.LocalPlayer:FindFirstChild("Data")
	local data2 = data

	if data2 then
		data2 = data:FindFirstChild("DevilFruit")
	end

	local v = tostring
	local data3 = data2

	if data3 then
		data3 = data2.Value
	end

	local v2 = v(data3 or "")
	if table.find(config.Fruit, v2) then
		return false
	end
	local state = arg.State
	if os.clock() < (state.nextFruitSniperAt or 0) then
		return false
	end
	state.nextFruitSniperAt = os.clock() + 10

	local ok, result = pcall(function()
		return arg.CommandRemote:InvokeServer("GetFruits", true)
	end)

	if ok then
		if type(result) == "table" then
			for _, v3 in pairs(result) do
				local name = type(v3) == "table"

				if name then
					name = v3.Name
				end

				local flag = type(v3) == "table"

				if flag then
					flag = tonumber(v3.Price)
				end

				if not v3.OnSale then
					continue
				end

				if type(name) ~= "string" then
					continue
				end

				if not table.find(config.Fruit, name) then
					continue
				end

				if not flag then
					continue
				end

				if arg.Beli then
					if not (flag < arg.Beli.Value) then
						continue
					end

					local ok2, result2 = pcall(function()
						return arg.CommandRemote:InvokeServer("PurchaseRawFruit", name)
					end)

					local ok3, result3 = pcall(function()
						return arg.CommandRemote:InvokeServer("PurchaseRawFruit", true, name)
					end)

					local lastFruitSniper = { fruit = name }
					local ok4 = ok2

					if ok4 then
						ok4 = ok3
					end

					lastFruitSniper.success = ok4
					lastFruitSniper.selectResult = tostring(result2)
					lastFruitSniper.purchaseResult = tostring(result3)
					lastFruitSniper.at = os.clock()
					state.lastFruitSniper = lastFruitSniper
					state.nextFruitSniperAt = os.clock() + 30
					local ok5 = ok2

					if ok5 then
						ok5 = ok3
					end

					return ok5
				end
			end

			state.lastFruitSniper = { success = false, stage = "not-on-sale", at = os.clock() }
			return false
		end
	end

	state.lastFruitSniper = { success = false, stage = "GetFruits", at = os.clock() }
	return false
end }

local n15, str, n16, fn6, getCharacter, getOk2, fn7, fn8, fn9, fn10
local fn11, fn12

do
	n15 = nil
	str = "Utility Items Activation"
	local cframe2 = CFrame.new(-12548, 332.378, -7617)
	local cframe3 = CFrame.new(-10371.4716796875, 330.76400756836, -10131.419921875)
	local n17 = 45
	local n18 = 30
	n16 = 2

	fn6 = function(arg)
		local functions = arg.Functions

		if functions then
			if type(functions.IsTaskCurrent) == "function" then
				return functions.IsTaskCurrent(str)
			end
		end

		local state = arg.State or {}
		local flag = not state.stopped

		if flag then
			flag = not state.paused
		end

		if flag then
			flag = arg.TaskQueue:top() == str
		end

		return flag
	end

	getCharacter = function(arg, name)
		local localPlayer = arg.LocalPlayer
		local character = localPlayer.Character

		if character then
			character = localPlayer.Character:FindFirstChild(name)
		end

		if not character then
			character = localPlayer:FindFirstChildOfClass("Backpack")

			if character then
				character = localPlayer.Backpack:FindFirstChild(name)
			end
		end

		return character
	end

	local function fn13(arg, arg2, arg3)
		return arg.Functions.Owns(arg2, arg3) == true
	end

	getOk2 = function(arg, ...)
		local v = table.pack(...)

		return pcall(function()
			return arg.CommandRemote:InvokeServer(table.unpack(v, 1, v.n))
		end)
	end

	local function fn14(arg, instance)
		local character = arg.LocalPlayer.Character
		if not character then
			return false
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not instance then
			return false
		end

		if humanoid then
			if not (humanoid.Health <= 0) then
				if instance.Parent ~= character then
					humanoid:EquipTool(instance)
					task.wait(0.05)
				end

				return instance.Parent == character
			end
		end

		return false
	end

	local function fn15(arg, arg2)
		local state = arg.State
		local now = os.clock()

		if not arg2 then
			if now < (state.nextUtilityElectricClawProbeAt or 0) then
				return state.utilityElectricClawProbeResult
			end
		end

		state.nextUtilityElectricClawProbeAt = now + n16
		local buyElectricClaw, utilityElectricClawProbeResult = getOk2(arg, "BuyElectricClaw", true)
		state.lastUtilityElectricClawProbe = { success = buyElectricClaw, result = tostring(utilityElectricClawProbeResult), at = now }

		if buyElectricClaw then
			state.utilityElectricClawProbeResult = utilityElectricClawProbeResult
		end

		local buyElectricClaw2 = buyElectricClaw

		if buyElectricClaw2 then
			buyElectricClaw2 = utilityElectricClawProbeResult
		end

		return buyElectricClaw2 or state.utilityElectricClawProbeResult
	end

	fn7 = function(arg)
		local state = arg.State
		if getCharacter(arg, "Hidden Key") then
			return "Hidden Key"
		end

		if getCharacter(arg, "Library Key") then
			if state.deathStepUnlockConfirmed ~= true then
				return "Library Key"
			end
		end

		if getCharacter(arg, "Water Key") then
			if not fn13(arg, "Moveset", "Sharkman Karate") then
				if (state.utilityWaterKeyBlockedUntil or 0) <= os.clock() then
					return "Water Key"
				end
			end
		end

		if state.electricClawUtilityActive then
			return "Previous Hero"
		end

		if arg.IsSea(3) then
			if not fn13(arg, "Moveset", "Electric Claw") then
				if (state.utilityElectricClawBlockedUntil or 0) <= os.clock() then
					if fn15(arg, false) == 4 then
						return "Previous Hero"
					end
				end
			end
		end

		if getCharacter(arg, "Red Key") then
			return "Red Key"
		end

		if getCharacter(arg, "Hallow Essence") then
			if arg.Functions.GetLiveBoss("Soul Reaper") == nil then
				return "Soul Reaper Spawner"
			end
		end

		if getCharacter(arg, "Fire Essence") then
			return "Uzoth"
		end
		return nil
	end

	fn8 = function(arg, arg2)
		local state = arg.State

		if arg2 == "Previous Hero" then
			state.electricClawUtilityActive = nil
			state.electricClawUtilityStartedAt = nil
			state.electricClawUtilityReadyAt = nil
			state.electricClawUtilityMoveStartedAt = nil
			state.electricClawUtilityPhase = nil
			state.electricClawMansionPrepared = nil
			state.electricClawMansionPreparedAt = nil
		end

		state.utilityItemAction = nil
		state.lastUtilityItemAction = { action = arg2, at = os.clock() }
		arg.TaskQueue:pop(str)
	end

	local function fn16(arg, arg2, arg3, arg4)
		local state = arg.State

		if arg2 == "Previous Hero" then
			state.electricClawUtilityActive = nil
			state.electricClawUtilityStartedAt = nil
			state.electricClawUtilityReadyAt = nil
			state.electricClawUtilityMoveStartedAt = nil
			state.electricClawUtilityPhase = nil
		end

		state.utilityItemAction = nil
		state.lastUtilityItemAttempt = { action = arg2, result = tostring(arg4), at = os.clock() }

		if arg2 == "Water Key" then
			state.utilityWaterKeyBlockedUntil = os.clock() + (arg3 or n16)
		elseif arg2 == "Previous Hero" then
			state.utilityElectricClawBlockedUntil = os.clock() + (arg3 or n16)
		end

		arg.TaskQueue:pop(str)
	end

	fn9 = function(arg)
		local state = arg.State
		if os.clock() < (state.nextUtilityLibraryKeyAt or 0) then
			return true
		end
		state.nextUtilityLibraryKeyAt = os.clock() + n16
		local openLibrary, v = getOk2(arg, "OpenLibrary")
		state.lastLibraryKeyActivation = { success = openLibrary, result = tostring(v), source = "utility-remote", at = os.clock() }
		if not fn6(arg) then
			return false
		end

		if openLibrary then
			if v ~= true then
				if not getCharacter(arg, "Library Key") then
					state.deathStepUnlockConfirmed = true
					state.libraryKeyActivationState = "complete"
					fn8(arg, "Library Key")
				end
			else
				state.deathStepUnlockConfirmed = true
				state.libraryKeyActivationState = "complete"
				fn8(arg, "Library Key")
			end
		end

		return true
	end

	fn10 = function(arg)
		local state = arg.State
		if os.clock() < (state.nextUtilityWaterKeyAt or 0) then
			return true
		end
		state.nextUtilityWaterKeyAt = os.clock() + n16
		local waterKey = getCharacter(arg, "Water Key")
		fn14(arg, waterKey)
		if not fn6(arg) then
			return false
		end
		local buySharkmanKarate, v = getOk2(arg, "BuySharkmanKarate", true)
		local waterKey2 = getCharacter(arg, "Water Key")

		state.lastWaterKeyActivation = {
			probeSuccess = buySharkmanKarate,
			probeResult = tostring(v),
			keyBefore = waterKey ~= nil,
			keyAfter = waterKey2 ~= nil,
			at = os.clock(),
		}

		if fn13(arg, "Moveset", "Sharkman Karate") then
			state.sharkmanKeyDelivered = true
			state.sharkmanUnlockConfirmed = true
			state.meleePrerequisite = nil
			fn8(arg, "Water Key")
		else
			if waterKey2 then
				if buySharkmanKarate then
					if v ~= 1 then
						fn16(arg, "Water Key", 2, v)
						return true
					end
					state.sharkmanKeyDelivered = true
					state.sharkmanUnlockConfirmed = true
					state.meleePrerequisite = nil
					fn8(arg, "Water Key")
					return true
				end

				fn16(arg, "Water Key", 2, v)
				return true
			end

			state.sharkmanKeyDelivered = true
			state.sharkmanUnlockConfirmed = true
			state.meleePrerequisite = nil
			fn8(arg, "Water Key")
		end

		return true
	end

	fn11 = function(arg)
		local state = arg.State
		local now = os.clock()
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChild("HumanoidRootPart")
		end

		if character2 then
			if state.electricClawMansionPrepared then
				if state.electricClawUtilityActive then
					if now < (state.electricClawUtilityReadyAt or 0) then
						state.electricClawUtilityPhase = "trial-warmup"
						state.status = "Utility Items | Waiting Electric Claw trial"
						return true
					end

					state.electricClawUtilityPhase = "trial-to-mansion"
					state.electricClawUtilityMoveStartedAt = state.electricClawUtilityMoveStartedAt or now
					local magnitude = (character2.Position - cframe2.Position).Magnitude

					if n18 <= magnitude then
						if n17 <= now - state.electricClawUtilityMoveStartedAt then
							state.lastElectricClawTrialTimeout = { distance = magnitude, elapsed = now - state.electricClawUtilityMoveStartedAt, at = now }
							fn16(arg, "Previous Hero", 5, "movement-timeout")
							return true
						end
					end

					if not (n18 <= magnitude) then
						if now < (state.nextUtilityElectricClawCompleteAt or 0) then
							return true
						end
						state.nextUtilityElectricClawCompleteAt = now + n16
						local v = fn15(arg, true)

						if type(v) == "number" then
							if v ~= 3 then
								if v ~= 4 then
									state.electricClawUtilityActive = nil
									state.electricClawTrialComplete = true
									fn8(arg, "Previous Hero")
								elseif v == 3 then
									state.electricClawUtilityActive = nil
									fn16(arg, "Previous Hero", 5, v)
								end
							elseif v == 3 then
								state.electricClawUtilityActive = nil
								fn16(arg, "Previous Hero", 5, v)
							end
						elseif v == 3 then
							state.electricClawUtilityActive = nil
							fn16(arg, "Previous Hero", 5, v)
						end

						return true
					end

					state.status = "Utility Items | Electric Claw trial to Mansion"
					arg.Functions.TP(CFrame.new(cframe2.Position.X, cframe2.Position.Y + math.random(-2, 2), cframe2.Position.Z), str, true)
					return true
				end

				state.electricClawUtilityPhase = "move-previous-hero"
				local magnitude = (character2.Position - cframe3.Position).Magnitude
				state.electricClawHeroDistance = magnitude

				if not (n18 <= magnitude) then
					arg.Functions.CancelTween()
					local buyElectricClaw, v = getOk2(arg, "BuyElectricClaw", "Start")
					state.lastElectricClawTrialStart = { success = buyElectricClaw, result = tostring(v), at = now }

					if buyElectricClaw then
						state.electricClawUtilityActive = true
						state.electricClawUtilityStartedAt = now
						state.electricClawUtilityReadyAt = now + 3
						state.electricClawUtilityMoveStartedAt = nil
						state.electricClawUtilityPhase = "trial-warmup"
						state.status = "Utility Items | Starting Electric Claw trial"
						return true
					end

					fn16(arg, "Previous Hero", 2, v)
					return true
				end

				state.status = "Utility Items | Moving to Previous Hero"
				arg.Functions.TP(cframe3, str, true)
				return true
			end

			state.electricClawUtilityPhase = "prepare-mansion"
			local magnitude = (character2.Position - cframe2.Position).Magnitude
			state.electricClawMansionDistance = magnitude

			if not (n18 <= magnitude) then
				arg.Functions.CancelTween()
				if now < (state.nextElectricClawSpawnAt or 0) then
					state.status = "Utility Items | Confirming Mansion checkpoint"
					return true
				end
				state.nextElectricClawSpawnAt = now + n16
				local setLastSpawnPoint, v = getOk2(arg, "SetLastSpawnPoint")
				state.lastElectricClawSpawnSet = { success = setLastSpawnPoint, result = tostring(v), at = now }
				if not fn6(arg) then
					return false
				end

				if setLastSpawnPoint then
					state.electricClawMansionPrepared = true
					state.electricClawMansionPreparedAt = now
					state.status = "Utility Items | Mansion checkpoint ready"
					return true
				end

				state.status = "Utility Items | Mansion checkpoint retry"
				return true
			end

			state.status = "Utility Items | Moving to Mansion checkpoint"
			arg.Functions.TP(cframe2, str, true)
			return true
		end

		state.status = "Utility Items | Waiting character"
		return true
	end

	fn12 = function(arg)
		local state = arg.State
		local map = workspace:FindFirstChild("Map")
		local map2 = map

		if map2 then
			map2 = map:FindFirstChild("Haunted Castle")
		end

		local map3 = map2

		if map3 then
			map3 = map2:FindFirstChild("Summoner")
		end

		local map4 = map3

		if map4 then
			map4 = map3:FindFirstChild("Detection")
		end

		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChild("HumanoidRootPart")
		end

		if map4 then
			if character2 then
				fn14(arg, getCharacter(arg, "Hallow Essence"))
				if not fn6(arg) then
					return false
				end
				state.status = "Utility Items | Using Hallow Essence"

				if not ((character2.Position - map4.Position).Magnitude >= 100) then
					if not getCharacter(arg, "Hallow Essence") then
						fn8(arg, "Soul Reaper Spawner")
						return true
					end

					if arg.Functions.GetLiveBoss("Soul Reaper") ~= nil then
						fn8(arg, "Soul Reaper Spawner")
					end

					return true
				end

				arg.Functions.TP(map4.CFrame, str, true)
				return true
			end
		end

		state.status = "Utility Items | Waiting Soul Reaper summoner"
		return true
	end
end

local tbl90 = {
	shouldSchedule = function(arg)
		n15 = 340232360
		return fn7(arg) ~= nil
	end,
	run = function(arg)
		if not fn6(arg) then
			return false
		end
		local state = arg.State
		local utilityItemAction = fn7(arg)

		if fn6(arg) then
			state.utilityItemAction = utilityItemAction

			if utilityItemAction then
				if utilityItemAction == "Hidden Key" then
					state.status = "Utility Items | Opening Rengoku"

					if (state.nextUtilityHiddenKeyAt or 0) <= os.clock() then
						state.nextUtilityHiddenKeyAt = os.clock() + n16
						getOk2(arg, "OpenRengoku")
					end

					if not getCharacter(arg, "Hidden Key") then
						fn8(arg, utilityItemAction)
					end

					return true
				end

				if utilityItemAction == "Library Key" then
					state.status = "Utility Items | Opening Library"
					return fn9(arg)
				end

				if utilityItemAction == "Water Key" then
					state.status = "Utility Items | Unlocking Sharkman Karate"
					return fn10(arg)
				end

				if utilityItemAction == "Previous Hero" then
					return fn11(arg)
				end

				if utilityItemAction == "Red Key" then
					state.status = "Utility Items | Delivering Red Key"

					if (state.nextUtilityRedKeyAt or 0) <= os.clock() then
						state.nextUtilityRedKeyAt = os.clock() + n16
						local redKey = getCharacter(arg, "Red Key")
						local cakeScientist, v = getOk2(arg, "CakeScientist", "Check")
						state.lastRedKeyDelivery = { success = cakeScientist, result = tostring(v), at = os.clock() }

						if cakeScientist then
							if redKey then
								if redKey.Parent then
									pcall(redKey.Destroy, redKey)
								end
							end
						end
					end

					if not getCharacter(arg, "Red Key") then
						fn8(arg, utilityItemAction)
					end

					return true
				end

				if utilityItemAction == "Soul Reaper Spawner" then
					return fn12(arg)
				end

				if utilityItemAction ~= "Uzoth" then
					return false
				end
				state.status = "Utility Items | Using Fire Essence"

				if (state.nextUtilityFireEssenceAt or 0) <= os.clock() then
					state.nextUtilityFireEssenceAt = os.clock() + n16
					local buyDragonTalon, v = getOk2(arg, "BuyDragonTalon", true)
					state.lastFireEssenceDelivery = { success = buyDragonTalon, result = tostring(v), at = os.clock() }
				end

				if not getCharacter(arg, "Fire Essence") then
					state.fireEssenceDelivered = true
					fn8(arg, utilityItemAction)
				end

				return true
			end

			arg.TaskQueue:pop(str)
			return false
		end

		return false
	end,
	TASK_NAME = str,
}

local function fn13(arg, arg2)
	local material = arg.Inventory.Material

	if material then
		material = arg.Inventory.Material[arg2]
	end

	local flag = type(material) == "table"

	if flag then
		flag = tonumber(material.Count) or 0
	end

	return flag or 0
end

local tbl91 = { run = function(arg)
	local state = arg.State
	local now = os.clock()
	if not arg.IsSea(3) then
		return false
	end

	if not arg.Functions.Carries("God's Chalice") then
		return false
	end

	if arg.Functions.Carries("Sweet Chalice") then
		return false
	end

	if arg.Functions.Owns("Material", "Mirror Fractal") then
		return false
	end

	if fn13(arg, "Conjured Cocoa") >= 10 then
		if (state.nextSweetChaliceAt or 0) <= now then
			state.nextSweetChaliceAt = now + 5
			state.status = "Progression | Crafting Sweet Chalice"

			local ok, result = pcall(function()
				return arg.CommandRemote:InvokeServer("SweetChaliceNpc")
			end)

			state.lastSweetChaliceCraft = { success = ok, result = tostring(result), at = now }
			return true
		end
	end

	return false
end }

local tbl92

do
	local n17 = 500
	local n18 = 10

	local function getData(instance)
		local data = instance:FindFirstChild("Data")
		local data2 = data

		if data2 then
			data2 = data:FindFirstChild("LastSpawnPoint")
		end

		return data2
	end

	local function fn14(arg, character, lockSpawnCheckpoint)
		local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
		local worldOrigin2 = worldOrigin

		if worldOrigin2 then
			worldOrigin2 = worldOrigin:FindFirstChild("PlayerSpawns")
		end

		local team = arg.LocalPlayer.Team
		local team2 = team

		if team2 then
			team2 = worldOrigin2
		end

		if team2 then
			team2 = worldOrigin2:FindFirstChild(team.Name)
		end

		if team2 then
			local instance2 = nil
			local magnitude2 = math.huge

			for _, instance in team2:GetChildren() do
				if lockSpawnCheckpoint then
					if instance.Name ~= lockSpawnCheckpoint then
						continue
					end
				end

				if not instance:IsA("Model") then
					if not instance:IsA("BasePart") then
						continue
					end
				end

				local ok, result = pcall(function()
					return instance:GetPivot()
				end)

				if ok then
					local magnitude = (character.Position - result.Position).Magnitude

					if magnitude < magnitude2 then
						instance2 = instance
						magnitude2 = magnitude
					end
				end
			end

			return instance2, magnitude2
		end

		return nil, math.huge
	end

	tbl92 = { run = function(arg)
		if arg.Environment.Configs["Auto Set Spawn"] == false then
			return false
		end
		local state = arg.State
		local character = arg.LocalPlayer.Character
		local character2 = character

		if character2 then
			character2 = character:FindFirstChildOfClass("Humanoid")
		end

		local character3 = character

		if character3 then
			character3 = character:FindFirstChild("HumanoidRootPart")
		end

		if not character3 then
			return false
		end

		if not character2 then
			return false
		end

		if character2.Health <= 0 then
			return false
		end
		local data = getData(arg.LocalPlayer)

		if data then
			if data.Value ~= "" then
				state.lastSpawnCheckpoint = data.Value
				state.lastSpawnVerified = true
			end
		end

		local lockSpawnCheckpoint = state.lockSpawnCheckpoint

		if lockSpawnCheckpoint then
			if data then
				if data.Value == lockSpawnCheckpoint then
					state.lastSpawnCheckpoint = lockSpawnCheckpoint
					state.lastSpawnVerified = true
					return false
				end
			end
		end

		local v, v2 = fn14(arg, character3, lockSpawnCheckpoint)

		if v then
			if not (n17 < v2) then
				if data then
					if data.Value == v.Name then
						state.lastSpawnCheckpoint = v.Name
						state.lastSpawnVerified = true
						return false
					end
				end

				if os.clock() < (state.nextSetSpawnAt or 0) then
					return false
				end
				state.nextSetSpawnAt = os.clock() + n18

				local ok, result = pcall(function()
					return arg.CommandRemote:InvokeServer("SetLastSpawnPoint", v.Name)
				end)

				state.lastSetSpawn = {
					checkpoint = v.Name,
					distance = v2,
					success = ok,
					result = tostring(result),
					at = os.clock(),
				}

				state.lastSpawnCheckpoint = v.Name
				local ok2 = ok

				if ok2 then
					ok2 = data
				end

				if ok2 then
					ok2 = data.Value == v.Name
				end

				state.lastSpawnVerified = ok2 or false
				return ok
			end
		end

		return false
	end }
end

local tbl93

do
	local tbl94 = {
		{ name = "AirJump", args = { "BuyHaki", "Geppo" } },
		{ name = "Aura", args = { "BuyHaki", "Buso" } },
		{ name = "FlashStep", args = { "BuyHaki", "Soru" } },
		{ name = "Instinct", args = { "KenTalk", "Buy" } },
	}

	local function fn14(arg)
		local meleeInventory = arg.MeleeInventory

		if meleeInventory then
			meleeInventory = arg.MeleeInventory.Melee
		end

		if meleeInventory then
			meleeInventory = arg.MeleeInventory.Melee["Black Leg"]
		end

		if type(meleeInventory) == "table" then
			if meleeInventory.Bought == true then
				return true
			end
		end

		if arg.Functions then
			if type(arg.Functions.Owns) == "function" then
				local ok, result = pcall(arg.Functions.Owns, "Moveset", "Black Leg")

				if ok then
					if result then
						return true
					end
				end
			end
		end

		local localPlayer = arg.LocalPlayer
		local tbl95 = {}
		local localPlayer2 = localPlayer

		if localPlayer2 then
			localPlayer2 = localPlayer.Character
		end

		local localPlayer3 = localPlayer

		if localPlayer3 then
			localPlayer3 = localPlayer.Backpack
		end

		tbl95[1] = localPlayer2
		tbl95[2] = localPlayer3

		for _, instance in tbl95 do
			if instance then
				if instance:FindFirstChild("Black Leg") then
					return true
				end

				if instance:FindFirstChild("Dark Step") then
					return true
				end
			end
		end

		return false
	end

	tbl93 = {
		canAttemptPurchases = function(arg)
			return not arg.IsSea(1) or fn14(arg)
		end,
		run = function(arg)
			if arg.Environment.Configs["Buy Stuffs"] == false then
				return false
			end
			local state = arg.State

			if tbl93.canAttemptPurchases(arg) then
				if os.clock() < (state.nextAbilityCheckAt or 0) then
					return false
				end
				state.nextAbilityCheckAt = os.clock() + 30
				state.abilityGate = nil
				state.lastAbilityPurchases = {}

				for _, v in tbl94 do
					local ok, result = pcall(function()
						return arg.CommandRemote:InvokeServer(table.unpack(v.args))
					end)

					local lastAbilityPurchase = { name = v.name, result = tostring(result), success = ok, at = os.clock() }
					state.lastAbilityPurchases[#state.lastAbilityPurchases + 1] = lastAbilityPurchase
					state.lastAbilityPurchase = lastAbilityPurchase

					if not ok then
						state.lastAbilityError = tostring(result)
					end
				end

				return true
			end

			state.abilityGate = "waiting-black-leg"
			return false
		end,
	}
end

local tbl94, str2, n17, n18, n19, n20, n21, fn14, tbl95

do
	local ItemConfig = nil
	tbl94 = { "MagnetEventGacha26", "ZiolesGacha" }
	str2 = "Blox Fruit Gacha"
	n17 = 300
	n18 = 60
	n19 = 30
	n20 = 5
	n21 = 3
	local n22 = 30
	local n23 = 10

	fn14 = function(arg)
		local state = arg.State
		local runtimeGeneration = state.runtimeGeneration
		local runtimeLifecycleRevision = state.runtimeLifecycleRevision

		return function()
			local flag = not state.stopped

			if flag then
				flag = not state.paused
			end

			if flag then
				flag = state.runtimeGeneration == runtimeGeneration
			end

			if flag then
				flag = state.runtimeLifecycleRevision == runtimeLifecycleRevision
			end

			return flag
		end
	end

	local function fn15(state)
		local fruitStoreRequestThread = state.fruitStoreRequestThread

		if type(fruitStoreRequestThread) == "thread" then
			if coroutine.status(fruitStoreRequestThread) ~= "dead" then
				return true
			end
		end

		state.fruitStoreRequestThread = nil
		return false
	end

	local function fn16(arg, instance)
		local parent = instance.Parent
		local localPlayer = arg.LocalPlayer
		local flag = parent ~= nil

		if flag then
			flag = parent == localPlayer.Character or parent == localPlayer:FindFirstChildOfClass("Backpack")
		end

		return flag
	end

	local function fn17(arg, arg2)
		local physicalMoveset = arg.Inventory.PhysicalMoveset or {}
		local v = physicalMoveset[arg2]

		if type(v) ~= "table" then
			for _, v2 in physicalMoveset do
				if type(v2) == "table" then
					if (v2.StorageKey or v2.Name) == arg2 then
						v = v2
						break
					end
				end
			end
		end

		local flag = type(v) == "table"

		if flag then
			flag = tonumber(v.Count) or 0
		end

		return flag or 0
	end

	local function fn18(arg, arg2, arg3)
		if arg3 then
			if not fn16(arg, arg2) then
				if not (fn17(arg, arg3.id) <= arg3.before) then
					local state = arg.State
					state.lastFruitStore = { id = arg3.id, success = true, confirmed = true, result = arg3.result, at = os.clock() }
					state.fruitStorePending[arg2] = nil
					state.fruitStoreFailures[arg2] = nil
					state.fruitStoreAttempts[arg2] = nil
					return true
				end
			end
		end

		return false
	end

	local function getOk3(instance)
		local ok, result = pcall(function()
			ItemConfig = ItemConfig or require(game:GetService("ReplicatedStorage"):WaitForChild("ItemConfig"))
			local v = ItemConfig.match(instance)
			local unwrap = v

			if unwrap then
				unwrap = v.unwrap
			end

			if unwrap then
				unwrap = v:unwrap()
			end

			return unwrap or v
		end)

		local ok2 = ok

		if ok2 then
			ok2 = type(result) == "table"
		end

		if ok2 then
			ok2 = result
		end

		return ok2 or nil
	end

	local function getOk4()
		local controllers = game:GetService("ReplicatedStorage"):FindFirstChild("Controllers")
		local controllers2 = controllers

		if controllers2 then
			controllers2 = controllers:FindFirstChild("GachaClient")
		end

		if controllers2 then
			local ok, result = pcall(require, controllers2)

			if ok then
				ok = type(result) == "table"
			end

			if ok then
				ok = result
			end

			return ok or nil
		end

		return nil
	end

	local function fn19(arg)
		if arg.GachaNetworkRF then
			return arg.GachaNetworkRF
		end

		local ok, result = pcall(function()
			local modules = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
			local modules2 = modules

			if modules2 then
				modules2 = modules:FindFirstChild("Net")
			end

			if modules2 then
				return require(modules2):RemoteFunction("GachaNetworkRF")
			end
			return nil
		end)

		local ok2 = ok

		if ok2 then
			ok2 = result
		end

		return ok2 or nil
	end

	local function fn20(arg, arg2)
		local v = arg2 or fn14(arg)
		if not v() then
			return false
		end

		pcall(function()
			local Locks = require(game:GetService("ReplicatedStorage").Controllers.Locks)
			if not v() then
				return
			end

			if Locks then
				if Locks.SpinnerLock then
					Locks.SpinnerLock:Unlock()
				end
			end
		end)

		if v() then
			pcall(function()
				local Spinner = require(game:GetService("ReplicatedStorage").Controllers.UI.Spinner)

				if v() then
					if Spinner then
						if Spinner.Close then
							Spinner:Close()
						end
					end
				end
			end)

			if not v() then
				return false
			end

			for _, attribute in {
				"NPC_INTERACTION_LOCKClient",
				"HOT_BAR_LOCKClient",
				"TOUCH_GUI_LOCKClient",
				"NOTIFICATIONS_SCREEN_LOCKClient",
				"MenuHiddenClient",
			} do
				if (tonumber(arg.LocalPlayer:GetAttribute(attribute)) or 0) > 0 then
					arg.LocalPlayer:SetAttribute(attribute, 0)
				end
			end

			return true
		end

		return false
	end

	local function fn21(arg)
		local state = arg.State
		if state.stopped then
			return
		end
		local runtimeGeneration = state.runtimeGeneration

		if type(state.gachaCloseThread) == "thread" then
			if type(task.cancel) == "function" then
				pcall(task.cancel, state.gachaCloseThread)
			end
		end

		local gachaCloseToken = {}
		state.gachaCloseToken = gachaCloseToken

		local function fn22()
			local flag = not state.stopped

			if flag then
				flag = state.runtimeGeneration == runtimeGeneration
			end

			if flag then
				flag = state.gachaCloseToken == gachaCloseToken
			end

			return flag
		end

		local function fn23()
			local flag = fn22()

			if flag then
				flag = not state.paused
			end

			return flag
		end

		local function fn24()
			if state.gachaCloseToken == gachaCloseToken then
				state.gachaCloseThread = nil
				state.gachaCloseToken = nil
			end
		end

		local thread = task.spawn(function()
			local deadline = os.clock() + 15

			while fn22() do
				if state.paused then
					deadline = os.clock() + 15
					task.wait(0.25)
					if state.paused then
						continue
					end

					if not (deadline <= os.clock()) then
						continue
					end

					if fn20(arg, fn23) then
						state.lastGachaWindowClose = { success = false, error = "close-button-timeout", at = os.clock() }
						fn24()
						return
					end

					fn24()
					return
				end

				if fn20(arg, fn23) then
					local playerGui = arg.LocalPlayer:FindFirstChildOfClass("PlayerGui")
					local playerGui2 = playerGui

					if playerGui2 then
						playerGui2 = playerGui:FindFirstChild("SpinnerWindow")
					end

					local playerGui3 = playerGui2

					if playerGui3 then
						playerGui3 = playerGui2:FindFirstChild("CloseButton", true)
					end

					if playerGui2 then
						if playerGui2.Enabled then
							if playerGui3 then
								if type(firesignal) == "function" then
									local ok, result = pcall(firesignal, playerGui3.Activated)

									if fn23() then
										local state2 = arg.State
										local lastGachaWindowClose = { success = ok }
										local error_ = not ok

										if error_ then
											error_ = tostring(result)
										end

										lastGachaWindowClose.error = error_ or nil
										lastGachaWindowClose.at = os.clock()
										state2.lastGachaWindowClose = lastGachaWindowClose
										if ok then
											fn24()
											return
										end
										task.wait(0.25)
										if state.paused then
											continue
										end

										if not (deadline <= os.clock()) then
											continue
										end

										if fn20(arg, fn23) then
											state.lastGachaWindowClose = {
												success = false,
												error = "close-button-timeout",
												at = os.clock(),
											}

											fn24()
											return
										end

										fn24()
										return
									end

									if fn22() then
										task.wait(0.25)
										if state.paused then
											continue
										end

										if not (deadline <= os.clock()) then
											continue
										end

										if fn20(arg, fn23) then
											state.lastGachaWindowClose = {
												success = false,
												error = "close-button-timeout",
												at = os.clock(),
											}

											fn24()
											return
										end

										fn24()
										return
									end

									fn24()
									return
								end

								task.wait(0.25)
								if state.paused then
									continue
								end

								if not (deadline <= os.clock()) then
									continue
								end

								if fn20(arg, fn23) then
									state.lastGachaWindowClose = { success = false, error = "close-button-timeout", at = os.clock() }
									fn24()
									return
								end

								fn24()
								return
							end

							task.wait(0.25)
							if state.paused then
								continue
							end

							if not (deadline <= os.clock()) then
								continue
							end

							if fn20(arg, fn23) then
								state.lastGachaWindowClose = { success = false, error = "close-button-timeout", at = os.clock() }
								fn24()
								return
							end

							fn24()
							return
						end

						task.wait(0.25)
						if state.paused then
							continue
						end

						if not (deadline <= os.clock()) then
							continue
						end

						if fn20(arg, fn23) then
							state.lastGachaWindowClose = { success = false, error = "close-button-timeout", at = os.clock() }
							fn24()
							return
						end

						fn24()
						return
					end

					task.wait(0.25)
					if state.paused then
						continue
					end

					if not (deadline <= os.clock()) then
						continue
					end

					if fn20(arg, fn23) then
						state.lastGachaWindowClose = { success = false, error = "close-button-timeout", at = os.clock() }
						fn24()
						return
					end

					fn24()
					return
				end

				if fn22() then
					task.wait(0.25)
					if state.paused then
						continue
					end

					if not (deadline <= os.clock()) then
						continue
					end

					if fn20(arg, fn23) then
						state.lastGachaWindowClose = { success = false, error = "close-button-timeout", at = os.clock() }
						fn24()
						return
					end

					fn24()
					return
				end

				fn24()
				return
			end

			fn24()
		end)

		if state.gachaCloseToken == gachaCloseToken then
			state.gachaCloseThread = thread
		end
	end

	local function fn22(arg)
		if type(arg) ~= "table" then
			return false
		end
		local flag = type(arg.PaidRandomItemsRestricted) == "table"

		if flag then
			flag = arg.PaidRandomItemsRestricted.Value == true
		end

		local flag2 = type(arg.Level) == "table"

		if flag2 then
			flag2 = arg.Level.RequirementMet == false
		end

		local flag3 = type(arg.Cooldown) == "table"

		if flag3 then
			flag3 = arg.Cooldown.RequirementMet == true
		end

		if flag3 then
			flag3 = type(arg.Price) == "table"
		end

		if flag3 then
			flag3 = arg.Price.RequirementMet == true
		end

		local flag4 = type(arg.Keys) == "table"

		if flag4 then
			flag4 = type(arg.Keys.Silver) == "table"
		end

		if flag4 then
			flag4 = arg.Keys.Silver.RequirementMet == true
		end

		local flag5 = not flag

		if flag5 then
			flag5 = not flag2
		end

		if flag5 then
			flag5 = flag3 or flag4
		end

		return flag5
	end

	local function fn23(arg)
		if type(arg) ~= "table" then
			return n18
		end

		if type(arg.Cooldown) == "table" then
			if arg.Cooldown.RequirementMet == false then
				return math.max(n20, (tonumber(arg.Cooldown.TimeEnds) or 0) - os.time())
			end
		end

		return n19
	end

	local function fn24(instance)
		if typeof(instance) ~= "Instance" then
			return nil
		end

		if not instance:IsA("Tool") then
			return nil
		end

		for _, attribute in { "StorageKey", "FruitId" } do
			local attribute2 = instance:GetAttribute(attribute)

			if type(attribute2) == "string" then
				if attribute2 ~= "" then
					return attribute2
				end
			end
		end

		local ok = getOk3(instance)
		local ok2 = ok

		if ok2 then
			ok2 = ok.Index
		end

		ok2 = ok2 or {}
		local ok3 = ok

		if ok3 then
			ok3 = ok.FruitId or ok.StorageKey
		end

		ok3 = ok3 or ok2.StorageKey

		if type(ok3) == "string" then
			if ok3 ~= "" then
				return ok3
			end
		end

		if instance.Name:match("Fruit$") then
			local match = instance.Name:match("^%s*(%S+)")
			local match2 = match

			if match2 then
				match2 = match .. "-" .. match
			end

			return match2 or nil
		end

		return nil
	end

	local function fn25(arg, arg2, arg3)
		local tbl96 = arg3 or {}
		local state = arg.State
		local v = fn14(arg)
		if not v() then
			return false
		end

		if state.fruitStoreInFlight then
			return false
		end

		if fn15(state) then
			return false
		end
		local v2 = fn24(arg2)

		if v2 then
			if v() then
				if not state.fruitStoreInFlight then
					if not fn15(state) then
						state.fruitStoreAttempts = state.fruitStoreAttempts or setmetatable({}, { __mode = "k" })
						state.fruitStoreFailures = state.fruitStoreFailures or setmetatable({}, { __mode = "k" })
						state.fruitStorePending = state.fruitStorePending or setmetatable({}, { __mode = "k" })
						if fn18(arg, arg2, state.fruitStorePending[arg2]) then
							return true
						end

						if not fn16(arg, arg2) then
							return false
						end
						local preferredFruit = state.preferredFruit ~= state.currentFruit

						if preferredFruit then
							preferredFruit = state.preferredFruit
						end

						preferredFruit = preferredFruit or nil

						if type(arg.Functions.ReservedGrindingFruit) == "function" then
							preferredFruit = arg.Functions.ReservedGrindingFruit()
						end

						if v() then
							if not state.fruitStoreInFlight then
								if not fn15(state) then
									if not tbl96.ignoreReservations then
										if v2 == preferredFruit then
											return false
										end
									end

									for _, v3 in { state.raidFruitLocks, state.trevorFruitLocks } do
										local v4 = v3

										if v4 then
											v4 = v3[v2]
										end

										if not tbl96.ignoreReservations then
											if v4 then
												if os.clock() < v4 then
													return false
												end
											end
										end

										if v4 then
											if v4 <= os.clock() then
												v3[v2] = nil
											end
										end
									end

									if os.clock() < (state.fruitStoreAttempts[arg2] or 0) then
										return false
									end
									local fruitStoreInFlight = { id = v2, before = fn17(arg, v2), at = os.clock() }
									state.fruitStorePending[arg2] = fruitStoreInFlight
									state.fruitStoreInFlight = fruitStoreInFlight
									state.fruitStoreStartedAt = os.clock()
									state.fruitStoreAttempts[arg2] = os.clock() + n23

									local flag = false
									local ok2 = false
									local str3 = nil
									local flag2 = false
									local deadline = os.clock() + n23

									local thread = task.spawn(function()
										local ok, result = pcall(function()
											return arg.CommandRemote:InvokeServer("StoreFruit", v2, arg2)
										end)

										ok2 = ok
										str3 = result

										if not flag2 then
											if os.clock() < deadline then
												if v() then
													if state.fruitStoreInFlight == fruitStoreInFlight then
														if type(arg.Functions.RefreshInventory) == "function" then
															pcall(arg.Functions.RefreshInventory, true)
														end
													end
												end
											end
										end

										flag = true

										if state.fruitStoreRequestThread == coroutine.running() then
											state.fruitStoreRequestThread = nil
										end
									end)

									if not flag then
										state.fruitStoreRequestThread = thread
										local exitTo = nil

										while os.clock() < deadline do
											if state.fruitStoreInFlight ~= fruitStoreInFlight then
												break
											end

											if v() then
												task.wait(0.1)

												if flag then
													exitTo = 1
													break
												else
													continue
												end
											end

											break
										end

										if exitTo ~= 1 then
											if not flag then
												flag2 = true

												if type(thread) == "thread" then
													if type(task.cancel) == "function" then
														pcall(task.cancel, thread)
													end
												end

												ok2 = false
												str3 = "store-request-timeout-or-cancelled"
											end
										end
									end

									if state.fruitStoreRequestThread == thread then
										if type(thread) == "thread" then
											if coroutine.status(thread) == "dead" then
												state.fruitStoreRequestThread = nil
											end
										else
											state.fruitStoreRequestThread = nil
										end
									end

									if state.fruitStoreInFlight ~= fruitStoreInFlight then
										return false
									end
									fruitStoreInFlight.result = tostring(str3)
									state.fruitStoreInFlight = nil
									if not v() then
										return false
									end

									if fn18(arg, arg2, fruitStoreInFlight) then
										return true
									end
									local n24 = math.min(5, (state.fruitStoreFailures[arg2] or 0) + 1)
									state.fruitStoreFailures[arg2] = n24
									local fruitStoreAttempts = state.fruitStoreAttempts
									local now = os.clock()
									local flag3 = not flag

									if flag3 then
										flag3 = n22
									end

									fruitStoreAttempts[arg2] = now + (flag3 or math.min(n22, n21 * 2 ^ (n24 - 1)))

									local lastFruitStore = {
										id = v2,
										success = false,
										confirmed = false,
										requestOk = ok2,
										result = tostring(str3),
									}

									local reason = not ok2

									if reason then
										reason = "request-error"
									end

									if not reason then
										reason = str3 == false

										if reason then
											reason = "rejected"
										end
									end

									lastFruitStore.reason = reason or "awaiting-replication"
									lastFruitStore.retryAt = state.fruitStoreAttempts[arg2]
									lastFruitStore.at = os.clock()
									state.lastFruitStore = lastFruitStore
									return false
								end
							end
						end

						return false
					end
				end
			end
		end

		return false
	end

	local function fn26(arg)
		local state = arg.State
		local v = fn14(arg)
		if not v() then
			return false
		end

		if state.fruitStoreInFlight then
			return false
		end

		if fn15(state) then
			return false
		end
		local localPlayer = arg.LocalPlayer
		local instances = {}
		local character = localPlayer.Character

		for _, instance in { localPlayer:FindFirstChildOfClass("Backpack"), character } do
			local instance3 = instance

			if instance3 then
				instance3 = instance:GetChildren()
			end

			instance3 = instance3 or {}

			for _, instance2 in instance3 do
				if instance2:IsA("Tool") then
					if instance2.Name:match("Fruit$") then
						table.insert(instances, instance2)
					end
				end
			end
		end

		if #instances == 0 then
			if not next(state.fruitStorePending or {}) then
				return false
			end
		end

		if type(arg.Functions.RefreshInventory) == "function" then
			pcall(arg.Functions.RefreshInventory)
		end

		if v() then
			local fruitStorePending = state.fruitStorePending or {}

			for k, v2 in fruitStorePending do
				if fn18(arg, k, v2) then
					continue
				end

				if not fn16(arg, k) then
					if os.clock() - v2.at > 30 then
						state.fruitStorePending[k] = nil
						state.fruitStoreFailures[k] = nil
						state.fruitStoreAttempts[k] = nil
					end
				end
			end

			for _, v2 in instances do
				if v() then
					fn25(arg, v2)
					continue
				end
				return false
			end

			return true
		end

		return false
	end

	local function fn27(arg, remote, arg2, arg3)
		local state = arg.State
		local lastFruitGachaChecks = {}
		local n24 = n17

		for _, v in tbl94 do
			if not arg2() then
				return false
			end

			local ok, result = pcall(function()
				return remote:InvokeServer({ Context = "Check", BoxName = v, SpokeNPC = str2 })
			end)

			if arg2() then
				local tbl96 = { box = v, success = ok }
				local ok3 = ok

				if ok3 then
					ok3 = fn22(result)
				end

				tbl96.ready = ok3 or false
				tbl96.at = os.clock()

				if ok then
					if type(result) == "table" then
						local timeEnds = type(result.Cooldown) == "table"

						if timeEnds then
							timeEnds = result.Cooldown.TimeEnds
						end

						tbl96.cooldownEnds = timeEnds or nil
						local requirementMet = type(result.Cooldown) == "table"

						if requirementMet then
							requirementMet = result.Cooldown.RequirementMet
						end

						tbl96.cooldownReady = requirementMet or nil
						local requirementMet2 = type(result.Price) == "table"

						if requirementMet2 then
							requirementMet2 = result.Price.RequirementMet
						end

						tbl96.priceReady = requirementMet2 or nil
						n24 = math.min(n24, fn23(result))

						if tbl96.ready then
							local ok2, result2 = pcall(function()
								return remote:InvokeServer({ Context = "Purchase", BoxName = v })
							end)

							if not arg2() then
								arg3(ok2, result2)
								return false
							end
							tbl96.purchaseSuccess = ok2
							tbl96.purchaseResult = tostring(result2)
							local lastFruitGacha = { path = "GachaNetworkRF", box = v }
							local ok4 = ok2

							if ok4 then
								ok4 = result2 ~= nil
							end

							if ok4 then
								ok4 = result2 ~= false
							end

							lastFruitGacha.success = ok4
							lastFruitGacha.result = tostring(result2)
							lastFruitGacha.at = os.clock()
							state.lastFruitGacha = lastFruitGacha
							table.insert(lastFruitGachaChecks, tbl96)
							state.lastFruitGachaChecks = lastFruitGachaChecks

							if ok2 then
								if result2 ~= nil then
									if result2 ~= false then
										task.wait(1)
										if not fn20(arg, arg2) then
											return false
										end
										fn21(arg)

										if arg2() then
											if type(arg.Functions.RefreshInventory) == "function" then
												pcall(arg.Functions.RefreshInventory, true)
											end

											if arg2() then
												fn26(arg)
												if arg2() then
													state.nextFruitGachaAt = os.clock() + n20
													return true
												end
												return false
											end

											return false
										end

										return false
									end
								end
							end

							n24 = math.min(n24, n20)
						end
					else
						tbl96.error = tostring(result)
						n24 = math.min(n24, n18)
					end

					table.insert(lastFruitGachaChecks, tbl96)
					continue
				end

				tbl96.error = tostring(result)
				n24 = math.min(n24, n18)
				table.insert(lastFruitGachaChecks, tbl96)
				continue
			end

			return false
		end

		if fn20(arg, arg2) then
			state.lastFruitGachaChecks = lastFruitGachaChecks
			state.lastFruitGacha = { path = "GachaNetworkRF", success = false, stage = "not-ready", at = os.clock() }
			state.nextFruitGachaAt = os.clock() + math.max(n20, n24)
			return false
		end

		return false
	end

	tbl95 = {
		run = function(arg)
			local state = arg.State
			local v = fn14(arg)
			local runtimeGeneration = state.runtimeGeneration
			local fruitGachaBackgroundToken = state.fruitGachaBackgroundToken

			local function fn28()
				local flag = v()

				if flag then
					flag = state.fruitGachaBackgroundToken == fruitGachaBackgroundToken
				end

				if flag then
					flag = arg.Environment.Configs["Auto Random Fruit"] ~= false
				end

				return flag
			end

			local function fn29(arg2, arg3)
				if not arg2 then
					return
				end

				if arg3 == nil then
					return
				end

				if arg3 == false then
					return
				end

				if state.stopped then
					return
				end

				if state.runtimeGeneration == runtimeGeneration then
					if state.fruitGachaBackgroundToken == fruitGachaBackgroundToken then
						fn21(arg)
					end
				end
			end

			if not fn28() then
				return false
			end
			fn26(arg)

			if fn28() then
				local value = arg.Level.Value
				if value < 50 then
					return false
				end

				if os.clock() < (state.nextFruitGachaAt or 0) then
					return false
				end
				local v2 = fn19(arg)
				if not fn28() then
					return false
				end

				if v2 then
					state.fruitGachaPath = "GachaNetworkRF"
					return fn27(arg, v2, fn28, fn29)
				end
				state.fruitGachaPath = "legacy-fallback"
				local fruitGachaWaitingForMoney = (value - 1) * 150 + 25000
				local ok = getOk4()

				if fn28() then
					if ok then
						if type(ok.CheckGachaAsync) == "function" then
							local ok2, result = pcall(ok.CheckGachaAsync, tbl94[2], str2)
							if not fn28() then
								return false
							end

							if ok2 then
								if type(result) == "table" then
									if type(result.Price) == "table" then
										fruitGachaWaitingForMoney = tonumber(result.Price.Value) or fruitGachaWaitingForMoney
									end

									local lastFruitGachaCheck = { requirementsMet = result.RequirementsMet == true, price = fruitGachaWaitingForMoney }
									local timeEnds = type(result.Cooldown) == "table"

									if timeEnds then
										timeEnds = result.Cooldown.TimeEnds
									end

									lastFruitGachaCheck.cooldownEnds = timeEnds or nil
									lastFruitGachaCheck.at = os.clock()
									state.lastFruitGachaCheck = lastFruitGachaCheck

									if result.RequirementsMet ~= true then
										local flag = type(result.Cooldown) == "table"

										if flag then
											flag = tonumber(result.Cooldown.TimeEnds)
										end

										flag = flag or nil
										local n24 = flag

										if n24 then
											n24 = math.max(5, flag - os.time())
										end

										n24 = n24 or 120
										state.nextFruitGachaAt = os.clock() + math.min(n24, 120)
										return false
									end
								end
							end
						end
					end

					if arg.Beli.Value < fruitGachaWaitingForMoney then
						state.fruitGachaWaitingForMoney = fruitGachaWaitingForMoney
						return false
					end
					state.fruitGachaWaitingForMoney = nil
					state.nextFruitGachaAt = os.clock() + 120
					local value2 = arg.Beli.Value
					local ok2, result

					if ok then
						if type(ok.PurchaseGachaAsync) == "function" then
							ok2, result = pcall(ok.PurchaseGachaAsync, tbl94[2])
						else
							ok2, result = pcall(function()
								return arg.CommandRemote:InvokeServer("Cousin", "Buy")
							end)
						end
					else
						ok2, result = pcall(function()
							return arg.CommandRemote:InvokeServer("Cousin", "Buy")
						end)
					end

					if fn28() then
						state.lastFruitGacha = {
							success = ok2,
							result = tostring(result),
							expectedPrice = fruitGachaWaitingForMoney,
							spent = math.max(0, value2 - arg.Beli.Value),
							at = os.clock(),
						}

						local ok3 = ok2

						if ok3 then
							ok3 = result ~= nil
						end

						if ok3 then
							ok3 = result ~= false
						end

						if not ok3 then
							return ok2
						end
						state.nextFruitGachaAt = os.clock() + 7200
						fn21(arg)
						task.wait(0.25)
						if not fn28() then
							return false
						end
						fn26(arg)
						return ok2
					end

					fn29(ok2, result)
					return false
				end

				return false
			end

			return false
		end,
		storeFruit = fn25,
		storeCarriedFruits = fn26,
		networkRequirementsMet = fn22,
		networkRetrySeconds = fn23,
		GachaBoxes = tbl94,
	}
end

local index = {}
index.__index = index

index.new = function()
	return setmetatable({ entries = {}, sequence = 0 }, index)
end

index.push = function(arg, arg2, arg3)
	local entry = arg.entries[arg2]
	if entry then
		entry.priority = tonumber(arg3) or entry.priority
		return
	end
	arg.sequence += 1
	arg.entries[arg2] = { name = arg2, priority = tonumber(arg3) or 0, sequence = arg.sequence }
end

index.pop = function(arg, arg2)
	arg.entries[arg2] = nil
end

index.top = function(arg)
	local v = nil

	for _, v2 in arg.entries do
		if v then
			if not (v.priority < v2.priority) then
				if v2.priority ~= v.priority then
					continue
				end

				if not (v2.sequence < v.sequence) then
					continue
				end
			end
		end

		v = v2
	end

	local name = v

	if name then
		name = v.name
	end

	return name or nil
end

index.clear = function(arg)
	table.clear(arg.entries)
end

local index2

do
	index2 = {}
	index2.__index = index2

	local function fn15(arg)
		if type(arg) == "thread" then
			if type(task.cancel) == "function" then
				pcall(task.cancel, arg)
			end
		end
	end

	local function fn16(baseContext)
		local tbl96 = {}

		for k, v in baseContext do
			tbl96[k] = v
		end

		return tbl96
	end

	local function fn17(state)
		local tbl96 = {}

		for k, v in state do
			tbl96[k] = v
		end

		return tbl96
	end

	local function fn18(arg, arg2, arg3)
		return function(...)
			arg:record(arg2, ...)
			return arg3
		end
	end

	index2.create = function(baseContext, arg, arg2)
		local tbl96 = arg2 or {}
		local obj = setmetatable({}, index2)
		local context = fn16(baseContext)
		context.State = fn17(baseContext.State)
		context.State.paused = tbl96.paused ~= false
		context.State.stopped = false
		context.State.status = "Clean runtime ready"
		context.TaskQueue = index.new()
		context.TaskPriorities = tbl3.copyPriorities()

		context.TaskDefinitions = setmetatable({}, { __index = function(arg3, arg4)
			local tbl97 = { args = {} }
			rawset(arg3, arg4, tbl97)
			return tbl97
		end })

		context.NearbyTargets = {}
		context.NearbyTargetParts = {}
		context.MobCFrameCache = {}

		obj.FallbackCalls = {}
		obj.FallbackFirstSeen = {}
		obj.InvokeFallbacks = tbl96.invokeFallbacks == true
		local tbl97 = {}

		context.Functions = setmetatable({}, { __index = function(arg3, arg4)
			local v = baseContext.Functions[arg4]
			if type(v) ~= "function" then
				return v
			end

			if not tbl97[arg4] then
				tbl97[arg4] = function(...)
					obj.FallbackCalls[arg4] = (obj.FallbackCalls[arg4] or 0) + 1
					obj.FallbackFirstSeen[arg4] = obj.FallbackFirstSeen[arg4] or os.clock()
					obj:record("CapturedFallback", arg4)
					if obj.InvokeFallbacks then
						return v(...)
					end
					return nil
				end
			end

			return tbl97[arg4]
		end })

		context.FarmWatchdogState = {
			Enabled = true,
			Config = { PollSeconds = 0.5, MissingMobHopSeconds = 60, HopRetrySeconds = 120 },
			Hops = 0,
			MissingSince = 0,
			MissingSeconds = 0,
			LastProgressAt = os.clock(),
			LastProgressKind = "initial",
			TargetCount = 0,
			TargetHealth = 0,
		}

		obj.Context = context
		obj.BaseContext = baseContext
		obj.DryRun = tbl96.dryRun ~= false
		local actionPolicy = {}
		local actions = tbl96.actions

		if actions then
			actions = tbl96.actions.quest == true
		end

		actionPolicy.quest = actions
		local actions2 = tbl96.actions

		if actions2 then
			actions2 = tbl96.actions.movement == true
		end

		actionPolicy.movement = actions2
		local actions3 = tbl96.actions

		if actions3 then
			actions3 = tbl96.actions.equip == true
		end

		actionPolicy.equip = actions3
		local actions4 = tbl96.actions

		if actions4 then
			actions4 = tbl96.actions.combat == true
		end

		actionPolicy.combat = actions4
		local actions5 = tbl96.actions

		if actions5 then
			actions5 = tbl96.actions.remote == true
		end

		actionPolicy.remote = actions5
		local actions6 = tbl96.actions

		if actions6 then
			actions6 = tbl96.actions.stats == true
		end

		actionPolicy.stats = actions6
		local actions7 = tbl96.actions

		if actions7 then
			actions7 = tbl96.actions.serverHop == true
		end

		actionPolicy.serverHop = actions7
		obj.ActionPolicy = actionPolicy
		obj.Events = {}
		obj.MaxEvents = tbl96.maxEvents or 300
		obj.Generation = 0
		obj.LifecycleRevision = 0
		tbl64.bindCleanFunctions(context, arg)
		context.TaskDefinitions["Auto Farm Level"].func = context.Functions.AutoFarmLevel

		context.TaskDefinitions["Auto Raid"].func = function()
			return context.Functions.AutoRaid(false)
		end

		context.TaskDefinitions["Farm Boss"].func = context.Functions.FarmBoss
		context.TaskDefinitions["Special Boss"].func = context.Functions.FarmBoss
		context.TaskDefinitions["Auto Bartilo Quest"].func = context.Functions.AutoBartiloQuest
		context.TaskDefinitions["Melee Materials"].func = context.Functions.AutoMeleeMaterial

		context.TaskDefinitions["Auto Second Sea"].func = function()
			return context.Functions.AutoSecondSea("Auto Second Sea")
		end

		context.TaskDefinitions["Auto Third Sea"].func = function()
			return context.Functions.AutoThirdSea("Auto Third Sea")
		end

		context.TaskDefinitions["Auto Trevor"].func = function()
			return context.Functions.AutoTrevor("Auto Trevor")
		end

		context.TaskDefinitions["Get Fruits"].func = context.Functions.CollectDroppedFruit
		context.TaskDefinitions["Auto Saber"].func = context.Functions.AutoSaber
		context.TaskDefinitions["Auto Yama"].func = context.Functions.AutoYama
		context.TaskDefinitions["Auto Tushita"].func = context.Functions.AutoTushita
		context.TaskDefinitions["Utility Items Activation"].func = context.Functions.AutoUtilityItems
		context.TaskDefinitions["Pirate Raid"].func = context.Functions.AutoPirateRaid
		context.TaskDefinitions["Tyrant Boss"].func = context.Functions.AutoTyrantBoss
		context.TaskDefinitions["Auto Soul Guitar"].func = context.Functions.AutoSoulGuitar
		context.TaskDefinitions["Exp Redeem"].func = context.Functions.AutoExpCodes
		context.TaskQueue:push("Auto Farm Level", context.TaskPriorities["Auto Farm Level"])
		context.Functions.ReleaseBossCombat = fn18(obj, "ReleaseBossCombat")

		if obj.DryRun then
			context.Functions.TP = fn18(obj, "TP", true)
		elseif not obj.ActionPolicy.movement then
			context.Functions.TP = fn18(obj, "TP", true)
		end

		if obj.DryRun then
			context.Functions.Attack = fn18(obj, "Attack")
			context.Functions.AutoBuso = fn18(obj, "AutoBuso", true)
			context.Functions.BringMob = fn18(obj, "BringMob")
		elseif not obj.ActionPolicy.combat then
			context.Functions.Attack = fn18(obj, "Attack")
			context.Functions.AutoBuso = fn18(obj, "AutoBuso", true)
			context.Functions.BringMob = fn18(obj, "BringMob")
		end

		if obj.DryRun then
			context.Functions.StopTween = fn18(obj, "StopTween")
		elseif not obj.ActionPolicy.movement then
			context.Functions.StopTween = fn18(obj, "StopTween")
		end

		if obj.DryRun then
			context.Functions.HopServer = fn18(obj, "HopServer", false)
		elseif not obj.ActionPolicy.serverHop then
			context.Functions.HopServer = fn18(obj, "HopServer", false)
		end

		if obj.DryRun then
			context.Functions.EquipWeapon = fn18(obj, "EquipWeapon", true)
			context.Functions.AutoAccessory = fn18(obj, "AutoAccessory", false)
		elseif not obj.ActionPolicy.equip then
			context.Functions.EquipWeapon = fn18(obj, "EquipWeapon", true)
			context.Functions.AutoAccessory = fn18(obj, "AutoAccessory", false)
		end

		if obj.DryRun then
			context.CommandRemote = {
				InvokeServer = function(arg3, ...)
					arg3.Controller:record("Remote", ...)
					return nil
				end,
				Controller = obj,
			}
		else
			local commandRemote

			if obj.ActionPolicy.remote then
				commandRemote = baseContext.CommandRemote

				if type(commandRemote) == "table" then
					if type(commandRemote.BindState) == "function" then
						commandRemote = commandRemote:BindState(context.State)
					end
				end

				context.CommandRemote = {
					Controller = obj,
					InvokeServer = function(arg3, arg4, ...)
						local controller = arg3.Controller
						local remote = controller.ActionPolicy.remote

						if not remote then
							remote = controller.ActionPolicy.stats

							if remote then
								remote = arg4 == "AddPoint"
							end
						end

						if remote then
							controller:record("RemoteCall", arg4, ...)
							local v = table.pack(commandRemote:InvokeServer(arg4, ...))
							controller:record("RemoteResult", arg4, v[1])
							return table.unpack(v, 1, v.n)
						end

						controller:record("RemoteBlocked", arg4, ...)
						return nil
					end,
				}
			elseif obj.ActionPolicy.stats then
				commandRemote = baseContext.CommandRemote

				if type(commandRemote) == "table" then
					if type(commandRemote.BindState) == "function" then
						commandRemote = commandRemote:BindState(context.State)
					end
				end

				context.CommandRemote = {
					Controller = obj,
					InvokeServer = function(arg3, arg4, ...)
						local controller = arg3.Controller
						local remote = controller.ActionPolicy.remote

						if not remote then
							remote = controller.ActionPolicy.stats

							if remote then
								remote = arg4 == "AddPoint"
							end
						end

						if remote then
							controller:record("RemoteCall", arg4, ...)
							local v = table.pack(commandRemote:InvokeServer(arg4, ...))
							controller:record("RemoteResult", arg4, v[1])
							return table.unpack(v, 1, v.n)
						end

						controller:record("RemoteBlocked", arg4, ...)
						return nil
					end,
				}
			else
				context.CommandRemote = {
					InvokeServer = function(arg3, ...)
						arg3.Controller:record("Remote", ...)
						return nil
					end,
					Controller = obj,
				}
			end
		end

		if not obj.ActionPolicy.quest then
			context.QuestRemote = {
				Controller = obj,
				InvokeServer = function(arg3, ...)
					arg3.Controller:record("QuestRemote", ...)
					return nil
				end,
			}

			return obj
		end

		if obj.DryRun then
			context.QuestRemote = {
				Controller = obj,
				InvokeServer = function(arg3, ...)
					arg3.Controller:record("QuestRemote", ...)
					return nil
				end,
			}
		else
			local questRemote = baseContext.QuestRemote

			context.QuestRemote = {
				Controller = obj,
				InvokeServer = function(arg3, arg4, ...)
					local controller = arg3.Controller
					local questAcquire = controller.Context.State.questAcquire
					local v

					if arg4 == "StartQuest" then
						if questAcquire then
							if not ((questAcquire.distance or math.huge) > 25) then
								controller:record("QuestRemoteForwarded", arg4, ...)
								v = table.pack(questRemote:InvokeServer(arg4, ...))
								controller:record("QuestRemoteResult", arg4, v[1])
								return table.unpack(v, 1, v.n)
							end
						end

						controller:record("QuestRemoteBlockedDistance", arg4, ...)
						return nil
					end

					controller:record("QuestRemoteForwarded", arg4, ...)
					v = table.pack(questRemote:InvokeServer(arg4, ...))
					controller:record("QuestRemoteResult", arg4, v[1])
					return table.unpack(v, 1, v.n)
				end,
			}
		end

		return obj
	end

	index2.record = function(arg, lastDryRunAction, ...)
		local tbl96 = { at = os.clock(), action = lastDryRunAction, args = table.pack(...) }
		arg.Events[#arg.Events + 1] = tbl96

		if arg.MaxEvents < #arg.Events then
			table.remove(arg.Events, 1)
		end

		arg.Context.State.lastDryRunAction = lastDryRunAction
		return tbl96
	end

	index2.start = function(arg)
		arg.LifecycleRevision = (tonumber(arg.LifecycleRevision) or 0) + 1
		if arg.Running then
			return false, "already-running"
		end
		arg.Generation += 1
		local generation = arg.Generation
		local state = arg.Context.State
		state.runtimeGeneration = generation
		state.runtimeLifecycleRevision = arg.LifecycleRevision
		local inventoryStartupPending = arg.DryRun == false

		if inventoryStartupPending then
			inventoryStartupPending = type(arg.Context.Functions.RefreshInventory) == "function"
		end

		if inventoryStartupPending then
			inventoryStartupPending = state.inventoryReady ~= true
		end

		state.inventoryStartupPending = inventoryStartupPending
		state.stopped = false
		state.paused = false
		state.runtimeReady = false
		arg.Running = true

		local function fn19()
			local flag = generation == arg.Generation

			if flag then
				flag = not state.stopped
			end

			return flag
		end

		state.lastTaskName = nil
		arg.Context.TaskQueue:clear()
		arg.Context.TaskQueue:push("Auto Farm Level", arg.Context.TaskPriorities["Auto Farm Level"])

		if type(arg.Context.AttachQuestNotification) == "function" then
			pcall(arg.Context.AttachQuestNotification)
		end

		if not fn19() then
			return false, "start-cancelled"
		end
		arg:record("ControllerStart", arg.DryRun)

		if type(arg.Context.Functions.RejoinPersistence) == "function" then
			pcall(arg.Context.Functions.RejoinPersistence)
		end

		if fn19() then
			if not arg.DryRun then
				if type(arg.Context.Functions.StartBossApiReporter) == "function" then
					pcall(arg.Context.Functions.StartBossApiReporter)
				end
			end

			if not fn19() then
				return false, "start-cancelled"
			end

			if type(arg.Context.Functions.RefreshInventory) == "function" then
				local ok, result = pcall(arg.Context.Functions.RefreshInventory, true)
				if not fn19() then
					return false, "start-cancelled"
				end
				state.initialInventoryRefresh = { at = os.clock(), ok = ok, result = tostring(result), ready = state.inventoryReady == true }
			end

			if state.inventoryStartupPending then
				state.inventoryStartupPending = state.inventoryReady ~= true

				if state.inventoryStartupPending then
					state.status = "Waiting initial inventory | Retrying read"
				end
			end

			tbl60.startFruitStoreBackground(arg.Context)

			if fn19() then
				local thread = task.spawn(function()
					local ok, result = xpcall(function()
						tbl60.run(arg.Context, fn19)
					end, debug.traceback)

					if generation == arg.Generation then
						arg.ExecutorThread = nil
						arg:stop()

						if not ok then
							state.lastError = tostring(result)
							state.status = "Runtime error | " .. (tostring(result):match("^[^\r\n]+") or tostring(result))
							arg:record("ControllerError", tostring(result))
						end
					end
				end)

				if fn19() then
					arg.ExecutorThread = thread

					local thread2 = task.spawn(function()
						while fn19() do
							if not state.paused then
								if state.runtimeReady then
									if not state.inventoryStartupPending then
										if type(arg.Context.Functions.AutoAccessory) == "function" then
											local ok, result = pcall(arg.Context.Functions.AutoAccessory)
											if not fn19() then
												return
											end

											if not ok then
												state.lastAccessoryError = tostring(result)
											end
										end

										local ok, result = xpcall(function()
											arg.Context.Functions.ScheduleGoalTasks()
										end, debug.traceback)

										if not fn19() then
											return
										end

										if not ok then
											state.lastSchedulerError = tostring(result)
											arg:record("SchedulerError", tostring(result))
										end
									end
								end
							end

							task.wait(0.5)
						end

						if generation == arg.Generation then
							arg.SchedulerThread = nil
						end
					end)

					if fn19() then
						arg.SchedulerThread = thread2
						return true
					end
					fn15(thread2)
					return false, "start-cancelled"
				end

				fn15(thread)
				return false, "start-cancelled"
			end

			return false, "start-cancelled"
		end

		return false, "start-cancelled"
	end

	index2.pause = function(arg)
		arg.LifecycleRevision = (tonumber(arg.LifecycleRevision) or 0) + 1
		arg.Context.State.runtimeLifecycleRevision = arg.LifecycleRevision
		arg.Context.State.paused = true
		pcall(arg.Context.Functions.StopTween)

		if type(arg.Context.Functions.StopAttack) == "function" then
			pcall(arg.Context.Functions.StopAttack)
		end

		arg:record("ControllerPause")
	end

	index2.resume = function(arg)
		arg.LifecycleRevision = (tonumber(arg.LifecycleRevision) or 0) + 1
		arg.Context.State.runtimeLifecycleRevision = arg.LifecycleRevision
		arg.Context.State.paused = false

		if arg.Running then
			if not arg.Context.State.stopped then
				tbl60.startFruitStoreBackground(arg.Context)
			end
		end

		arg:record("ControllerResume")
	end

	index2.stop = function(arg)
		arg.LifecycleRevision = (tonumber(arg.LifecycleRevision) or 0) + 1
		arg.Generation += 1
		local state = arg.Context.State
		state.runtimeGeneration = arg.Generation
		state.runtimeLifecycleRevision = arg.LifecycleRevision
		state.stopped = true
		state.paused = true

		if type(arg.Context.Functions.CancelPendingReads) == "function" then
			pcall(arg.Context.Functions.CancelPendingReads)
		end

		if type(arg.Context.Functions.StopFastTravel) == "function" then
			pcall(arg.Context.Functions.StopFastTravel)
		end

		if type(arg.Context.Functions.StopBossApiReporter) == "function" then
			pcall(arg.Context.Functions.StopBossApiReporter)
		end

		fn15(arg.ExecutorThread)
		fn15(arg.SchedulerThread)
		arg.ExecutorThread = nil
		arg.SchedulerThread = nil

		for _, v in {
			"meleeBackgroundThread",
			"fruitGachaBackgroundThread",
			"fruitStoreBackgroundThread",
			"gachaCloseThread",
			"cursedShipTransitionThread",
		} do
			fn15(state[v])
			state[v] = nil
		end

		local fruitStoreRequestThread = state.fruitStoreRequestThread
		fn15(fruitStoreRequestThread)

		if type(fruitStoreRequestThread) == "thread" then
			if coroutine.status(fruitStoreRequestThread) == "dead" then
				state.fruitStoreRequestThread = nil
			end
		else
			state.fruitStoreRequestThread = nil
		end

		state.meleeBackgroundToken = nil
		state.fruitGachaBackgroundToken = nil
		state.fruitStoreBackgroundToken = nil
		state.fruitStoreInFlight = nil
		state.gachaCloseToken = nil
		state.cursedShipTransitionToken = nil
		state.meleeBackgroundRunning = false
		state.fruitGachaBackgroundRunning = false
		state.cursedShipTransitionActive = nil
		state.factoryWatchersReady = nil
		state.factoryCoreAlive = nil
		state.factoryFruitSnapshot = nil
		state.factoryRewardUntil = nil
		state.accessoryDependencies = nil
		state.farmMobCacheToken = nil
		state.farmSpawnRegionsCache = nil

		if type(state.factoryWatcherCleanup) == "function" then
			pcall(state.factoryWatcherCleanup)
		end

		for _, v in {
			"teleportFailureConnection",
			"trevorFruitAddedConnection",
			"factoryNotificationConnection",
			"factoryEnemyConnection",
			"farmEnemyAddedConnection",
			"farmEnemyRemovedConnection",
		} do
			local connection = state[v]

			if connection then
				pcall(connection.Disconnect, connection)
				state[v] = nil
			end
		end

		local factoryTextConnections = state.factoryTextConnections or {}

		for k, connection in factoryTextConnections do
			pcall(connection.Disconnect, connection)
			state.factoryTextConnections[k] = nil
		end

		pcall(arg.Context.Functions.StopTween)

		if type(arg.Context.Functions.StopAttack) == "function" then
			pcall(arg.Context.Functions.StopAttack)
		end

		if type(arg.Context.DetachQuestNotification) == "function" then
			pcall(arg.Context.DetachQuestNotification)
		end

		arg.Running = false
		arg:record("ControllerStop")
		return true
	end
end

index2.snapshot = function(arg)
	return {
		running = arg.Running == true,
		dryRun = arg.DryRun,
		actionPolicy = arg.ActionPolicy,
		paused = arg.Context.State.paused == true,
		stopped = arg.Context.State.stopped == true,
		task = arg.Context.TaskQueue:top(),
		status = arg.Context.State.status,
		eventCount = #arg.Events,
		lastAction = arg.Context.State.lastDryRunAction,
		lastError = arg.Context.State.lastError,
		fallbackKinds = (function()
			local count = 0

			for k in arg.FallbackCalls do
				count += 1
			end

			return count
		end)(),
	}
end

index2.fallbackSummary = function(arg)
	local tbl96 = {}
	local n22 = 0

	for k, v in arg.FallbackCalls do
		n22 += v
		tbl96[#tbl96 + 1] = { name = k, count = v }
	end

	table.sort(tbl96, function(arg2, arg3)
		local flag = arg2.count > arg3.count

		if not flag then
			flag = arg2.count == arg3.count

			if flag then
				flag = arg2.name < arg3.name
			end
		end

		return flag
	end)

	return { total = n22, kinds = #tbl96, rows = tbl96 }
end

local index3

do
	index3 = {}
	index3.__index = index3

	local function getName(farmTarget)
		local name = typeof(farmTarget) == "Instance"

		if name then
			name = farmTarget.Name
		end

		return name or nil
	end

	local function getMatch(status)
		local str3 = tostring(status or "")
		return str3:match("|%s*(.-)%s*$") or str3
	end

	local function fn15(arg)
		if typeof(arg) == "CFrame" then
			return arg.Position
		end

		if typeof(arg) == "Vector3" then
			return arg
		end

		if type(arg) == "table" then
			return fn15(arg.goal or arg.destination or arg.cframe)
		end
		return nil
	end

	local function fn16(travel)
		local v = fn15(travel)
		if v then
			return { x = math.round(v.X), y = math.round(v.Y), z = math.round(v.Z) }
		end
		return nil
	end

	local function fn17(destination, destination2, positionTolerance)
		if destination then
			if destination2 then
				local n22 = destination.x - destination2.x
				local n23 = destination.y - destination2.y
				local n24 = destination.z - destination2.z
				return math.sqrt(n22 * n22 + n23 * n23 + n24 * n24) <= positionTolerance
			end
		end

		return destination == destination2
	end

	local function fn18(arg)
		local state = arg.State
		local quest, v = arg.ReadQuest()
		local tbl96 = {}
		local taskQueue = arg.TaskQueue

		if taskQueue then
			taskQueue = arg.TaskQueue:top()
		end

		tbl96.task = taskQueue or nil
		tbl96.status = tostring(state.status or "")
		tbl96.phase = getMatch(state.status)
		tbl96.target = getName(state.farmTarget) or state.currentFarmMobName
		tbl96.waitSource = state.lastFarmWaitSource
		tbl96.destination = fn16(state.travel or state.movement)
		tbl96.runtimePaused = state.paused == true
		tbl96.questVisible = quest == true
		tbl96.questText = tostring(v or "")
		return tbl96
	end

	index3.create = function(arg, arg2, arg3)
		local tbl96 = arg3 or {}

		return setmetatable({
			CleanController = arg,
			CapturedContext = arg2,
			Samples = {},
			MaxSamples = tbl96.maxSamples or 240,
			PositionTolerance = tbl96.positionTolerance or 15,
			Running = false,
			Generation = 0,
		}, index3)
	end

	index3.sample = function(arg)
		local v = fn18(arg.CleanController.Context)
		local v2 = fn18(arg.CapturedContext)

		local tbl96 = {
			at = os.clock(),
			clean = v,
			captured = v2,
			taskMatch = v.task == v2.task,
			phaseMatch = v.phase == v2.phase,
			targetMatch = v.target == v2.target,
			destinationMatch = fn17(v.destination, v2.destination, arg.PositionTolerance),
		}

		local questMatch = v.questVisible == v2.questVisible

		if questMatch then
			questMatch = v.questText == v2.questText
		end

		tbl96.questMatch = questMatch
		arg.Samples[#arg.Samples + 1] = tbl96

		if arg.MaxSamples < #arg.Samples then
			table.remove(arg.Samples, 1)
		end

		return tbl96
	end

	index3.start = function(arg, arg2)
		if arg.Running then
			return false, "already-running"
		end
		arg.Generation += 1
		local generation = arg.Generation
		arg.Running = true

		task.spawn(function()
			while arg.Running do
				if generation ~= arg.Generation then
					break
				end
				arg:sample()
				task.wait(arg2 or 0.5)
			end
		end)

		return true
	end

	index3.stop = function(arg)
		arg.Generation += 1
		arg.Running = false
	end
end

index3.summary = function(arg)
	local tbl96 = {
		samples = #arg.Samples,
		taskMatches = 0,
		phaseMatches = 0,
		targetMatches = 0,
		destinationMatches = 0,
		questMatches = 0,
		capturedPausedSamples = 0,
		comparablePhaseSamples = 0,
		comparablePhaseMatches = 0,
	}

	for _, v in arg.Samples do
		local taskMatches = tbl96.taskMatches
		local taskMatch = v.taskMatch

		if taskMatch then
			taskMatch = 1
		end

		tbl96.taskMatches = taskMatches + (taskMatch or 0)
		local phaseMatches = tbl96.phaseMatches
		local phaseMatch = v.phaseMatch

		if phaseMatch then
			phaseMatch = 1
		end

		tbl96.phaseMatches = phaseMatches + (phaseMatch or 0)
		local targetMatches = tbl96.targetMatches
		local targetMatch = v.targetMatch

		if targetMatch then
			targetMatch = 1
		end

		tbl96.targetMatches = targetMatches + (targetMatch or 0)
		local destinationMatches = tbl96.destinationMatches
		local destinationMatch = v.destinationMatch

		if destinationMatch then
			destinationMatch = 1
		end

		tbl96.destinationMatches = destinationMatches + (destinationMatch or 0)
		local questMatches = tbl96.questMatches
		local questMatch = v.questMatch

		if questMatch then
			questMatch = 1
		end

		tbl96.questMatches = questMatches + (questMatch or 0)

		if v.captured.runtimePaused then
			tbl96.capturedPausedSamples += 1
		else
			tbl96.comparablePhaseSamples += 1
			local comparablePhaseMatches = tbl96.comparablePhaseMatches
			local phaseMatch2 = v.phaseMatch

			if phaseMatch2 then
				phaseMatch2 = 1
			end

			tbl96.comparablePhaseMatches = comparablePhaseMatches + (phaseMatch2 or 0)
		end
	end

	local sample = arg.Samples[#arg.Samples]
	local sample2 = sample

	if sample2 then
		sample2 = sample.clean
	end

	tbl96.lastClean = sample2 or nil
	local sample3 = sample

	if sample3 then
		sample3 = sample.captured
	end

	tbl96.lastCaptured = sample3 or nil
	return tbl96
end

local seaHub = {
	BuildMode = "standalone",
	Config = tbl,
	QuestData = tbl10,
	BossQuestData = tbl14,
	UIState = tbl2,
	RuntimeFunctions = {
		LevelFarmRoutePolicy = tbl13,
		RaidTaskPolicy = tbl9,
		AccessoryPolicy = tbl5,
		ElectricUnlockPolicy = tbl83,
		TrevorPolicy = tbl75,
		ControllerOrder = tbl3,
		FruitCollectionPolicy = tbl6,
		BossTaskPolicy = tbl7,
		BossTelemetry = tbl8,
		QuestNotificationBridge = tbl11,
		QuestRoutePolicy = tbl12,
		GetQuest = tbl15,
		NormalizeEnemyName = tbl16,
		ResolveMobCFrame = tbl17,
		GetBossQuest = tbl18,
		GetLiveBoss = tbl19,
		GetBossCFrame = tbl20,
		GetFarmWatchdog = tbl21,
		GetQuestGiverCFrame = tbl22,
		EnsureQuest = tbl23,
		LoadTools = tbl24,
		EquipWeapon = tbl25,
		Attack = tbl26,
		SendKey = tbl27,
		AddVelocity = tbl28,
		RemoveVelocity = tbl29,
		ShouldCancelTP = tbl30,
		ShouldNotBypassTP = tbl31,
		TryFastTravel = tbl32,
		CancelTween = tbl33,
		NoClip = tbl34,
		RunMovement = tbl35,
		TP = tbl36,
		StopTween = tbl37,
		BringMob = tbl38,
		ReleaseBring = tbl38.release,
		AutoBuso = tbl39,
		EnsureTeam = tbl40,
		UpStats = tbl41,
		IsNetworkOwner = tbl42,
		RefreshSimulationRadius = tbl43,
		SelectFarmWaitCFrame = tbl44,
		IsActiveEnemyModel = tbl45,
		ObserveFarmTarget = tbl46,
		RecordFarmRecovery = tbl47,
		ResetFarmWatchdog = tbl48,
		UpdateFarmWatchdog = tbl49,
		IsTaskCurrent = tbl50,
		ReadTaskProgress = tbl51,
		TaskRequest = tbl52,
		ProgressionProbe = tbl53,
		RefreshInventory = tbl54,
		AutoAccessory = tbl55,
		ProgressionPlanner = tbl56,
		RejoinPersistence = tbl57,
		HopServer = tbl58,
		RecoveryWatchdog = tbl59,
		TaskExecutorLoop = tbl60,
		ScheduleGoalTasks = tbl61,
		CollectDroppedFruit = tbl62,
		BossApiReporter = tbl63,
		RuntimeContext = tbl64,
		CombatTarget = tbl65,
		FarmBoss = tbl66,
		FarmMob = tbl67,
		SkipMode = tbl68,
		FarmMaterial = tbl69,
		AutoBoneBoost = tbl70,
		AutoFarmLevel = tbl71,
		AutoSecondSea = tbl72,
		AutoBartiloQuest = tbl73,
		AutoSaber = tbl74,
		AutoThirdSea = tbl76,
		AutoYama = tbl77,
		AutoTushita = tbl78,
		AutoPirateRaid = tbl79,
		AutoTyrantBoss = tbl80,
		AutoSoulGuitar = tbl81,
		AutoFactory = tbl82,
		AutoElectricUnlock = tbl84,
		AutoMeleeProgress = tbl85,
		AutoRaid = tbl86,
		AutoExpCodes = tbl87,
		AutoFruitPolicy = tbl88,
		AutoFruitSniper = tbl89,
		AutoUtilityItems = tbl90,
		AutoProgressionItems = tbl91,
		AutoSetSpawn = tbl92,
		AutoAbilities = tbl93,
		AutoFruitGacha = tbl95,
		TaskQueue = index,
		CleanRuntimeController = index2,
		ShadowComparator = index3,
	},
}

local genv = getgenv

if genv then
	genv = getgenv()
end

genv = genv or _G

if type(genv.__SEAHUB_BOSS_API) ~= "table" then
	genv.__SEAHUB_BOSS_API = { Enabled = false }
end

seaHub.bootstrap = function(arg)
	local tbl96 = arg or {}
	local tbl97 = { config = tbl, ui = tbl2 }

	if tbl96.installUi ~= false then
		tbl97.interface = tbl2.install(tbl96.uiParent)
	end

	return tbl97
end

seaHub.attachCapturedRuntime = function(arg)
	local cleanContext = tbl64.fromCapturedRuntime(arg or {})
	tbl64.bindCleanFunctions(cleanContext, seaHub.RuntimeFunctions)
	seaHub.CleanContext = cleanContext
	return cleanContext
end

seaHub.attachStandaloneRuntime = function(arg)
	local cleanContext = tbl64.fromStandalone(arg or {})
	tbl64.bindCleanFunctions(cleanContext, seaHub.RuntimeFunctions)
	cleanContext.Functions.LoadTools()
	seaHub.CleanContext = cleanContext
	return cleanContext
end

seaHub.createCleanRuntime = function(arg)
	local tbl96 = arg or {}
	local cleanRuntime = index2.create(tbl96.BaseContext or seaHub.CleanContext or seaHub.attachStandaloneRuntime(tbl96), seaHub.RuntimeFunctions, tbl96)
	seaHub.CleanRuntime = cleanRuntime
	seaHub.CleanContext = cleanRuntime.Context
	local genv2 = getgenv

	if genv2 then
		genv2 = getgenv()
	end
	;(genv2 or _G).__SEAHUB_CLEAN_CONTEXT = cleanRuntime.Context
	return cleanRuntime
end

seaHub.startCleanRuntime = function(arg)
	return (seaHub.CleanRuntime or seaHub.createCleanRuntime(arg)):start()
end

seaHub.stopCleanRuntime = function()
	local cleanRuntime = seaHub.CleanRuntime

	if cleanRuntime then
		cleanRuntime = seaHub.CleanRuntime:stop()
	end

	return cleanRuntime or false
end

seaHub.createShadowComparator = function(arg)
	local tbl96 = arg or {}
	local controller = tbl96.Controller or seaHub.CleanRuntime
	assert(controller, "clean runtime controller is unavailable")
	local capturedContext = tbl96.CapturedContext or controller.BaseContext
	assert(capturedContext, "captured comparison context is unavailable")
	local shadowComparator = index3.create(controller, capturedContext, tbl96)
	seaHub.ShadowComparator = shadowComparator
	return shadowComparator
end

local genv2 = getgenv

if genv2 then
	genv2 = getgenv()
end

genv2 = genv2 or _G
genv2.Configs = genv2.Configs or {}

if genv2.Configs.FPS == nil then
	genv2.Configs.FPS = tbl.Performance.FPS
end

genv2.SeaHub = seaHub

if genv2.__SEAHUB_DISABLE_AUTOSTART == true then
	return seaHub
end

local flag = genv2.__SEAHUB_UI_ENABLED ~= false
tbl.Interface.BlackScreen = genv2.__SEAHUB_BLACK_SCREEN_ENABLED == true
local seaHubCleanController = genv2.SeaHubCleanController

if seaHubCleanController then
	if type(seaHubCleanController.stop) == "function" then
		pcall(seaHubCleanController.stop, seaHubCleanController)
	end
end

genv2.SeaHubCleanController = nil
genv2.__SEAHUB_CLEAN_CONTEXT = nil
seaHub.Runtime = seaHub.bootstrap({ installUi = flag })
local ok, result = pcall(seaHub.attachStandaloneRuntime)
seaHub.Runtime.standaloneAttached = ok
local runtime = seaHub.Runtime
local standaloneError = not ok

if standaloneError then
	standaloneError = tostring(result)
end

runtime.standaloneError = standaloneError or nil

if ok then
	local cleanRuntime = seaHub.createCleanRuntime({
		BaseContext = result,
		dryRun = false,
		paused = true,
		maxEvents = 600,
		invokeFallbacks = false,
		actions = {
			quest = true,
			movement = true,
			equip = true,
			combat = true,
			remote = true,
			stats = true,
			serverHop = true,
		},
	})

	genv2.SeaHubCleanController = cleanRuntime
	local cleanStarted, cleanStartError = cleanRuntime:start()
	seaHub.Runtime.cleanStarted = cleanStarted
	seaHub.Runtime.cleanStartError = cleanStartError
end

return seaHub