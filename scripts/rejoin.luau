-- rejoin.luau
-- Rejoins the current server.

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer

if #Players:GetPlayers() <= 1 then
	-- Alone, the server shuts down as we leave, so join any server instead.
	TeleportService:Teleport(game.PlaceId, player)
else
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end
