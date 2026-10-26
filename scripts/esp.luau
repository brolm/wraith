-- esp.luau
-- Highlights other players' characters through walls, in their team colour.

local Players = game:GetService("Players")

local NAME = "WraithESP"
local LocalPlayer = Players.LocalPlayer

local function highlight(player: Player, character: Model)
	-- Named so running the script twice doesn't stack highlights.
	if character:FindFirstChild(NAME) then
		return
	end
	local h = Instance.new("Highlight")
	h.Name = NAME
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.FillColor = player.TeamColor.Color
	h.FillTransparency = 0.6
	h.OutlineTransparency = 0
	h.Parent = character
end

local function track(player: Player)
	if player == LocalPlayer then
		return
	end
	if player.Character then
		highlight(player, player.Character)
	end
	player.CharacterAdded:Connect(function(character)
		highlight(player, character)
	end)
end

for _, player in ipairs(Players:GetPlayers()) do
	track(player)
end
Players.PlayerAdded:Connect(track)
