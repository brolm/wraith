-- anti-afk.luau
-- Stops the 20-minute idle kick by sending a fake click whenever Roblox reports you idle.

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

Players.LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
