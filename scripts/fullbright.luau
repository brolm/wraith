-- fullbright.luau
-- Removes darkness, fog and shadows, and re-applies them if the game changes them back.

local Lighting = game:GetService("Lighting")

local SETTINGS = {
	Brightness = 2,
	ClockTime = 14,
	FogEnd = 100000,
	GlobalShadows = false,
	Ambient = Color3.fromRGB(178, 178, 178),
	OutdoorAmbient = Color3.fromRGB(178, 178, 178),
}

for property, value in pairs(SETTINGS) do
	Lighting[property] = value
	Lighting:GetPropertyChangedSignal(property):Connect(function()
		if Lighting[property] ~= value then
			Lighting[property] = value
		end
	end)
end
