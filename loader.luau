-- loader.luau
-- Picks the script for the current game by universe ID, or falls back to universal.

local HttpService = game:GetService("HttpService")

local BASE_URL = "https://raw.githubusercontent.com/whodunitwww/wraith-hub/main/scripts/"
local CACHE_FOLDER = "wraith-hub"
local CACHE_FILE = CACHE_FOLDER .. "/universes.json"
local FALLBACK = "universal"

-- Place ID (from the game's URL) -> script in scripts/. Matching is by universe,
-- so every place in that game (lobby, sub-places) loads the same script.
local GAMES = {
	[8248164019] = "clover", -- Clover RPG
}

local function fetchUniverseId(placeId: number): number?
	local url = "https://apis.roblox.com/universes/v1/places/" .. tostring(placeId) .. "/universe"
	local ok, data = pcall(function()
		return HttpService:JSONDecode(game:HttpGet(url))
	end)
	return ok and type(data) == "table" and tonumber(data.universeId) or nil
end

-- A place never changes universe, so resolved IDs are cached across runs.
local function loadCache(): { [string]: number }
	local ok, data = pcall(function()
		return isfile(CACHE_FILE) and HttpService:JSONDecode(readfile(CACHE_FILE))
	end)
	return ok and type(data) == "table" and data or {}
end

local function saveCache(cache: { [string]: number })
	pcall(function()
		if not isfolder(CACHE_FOLDER) then
			makefolder(CACHE_FOLDER)
		end
		writefile(CACHE_FILE, HttpService:JSONEncode(cache))
	end)
end

local function scriptForCurrentGame(): string
	local direct = GAMES[game.PlaceId]
	if direct then
		return direct
	end

	local cache = loadCache()
	local dirty = false
	local found
	for placeId, name in pairs(GAMES) do
		local key = tostring(placeId)
		if cache[key] == nil then
			cache[key] = fetchUniverseId(placeId)
			dirty = dirty or cache[key] ~= nil
		end
		if cache[key] == game.GameId then
			found = name
			break
		end
	end
	if dirty then
		saveCache(cache)
	end
	return found or FALLBACK
end

local name = scriptForCurrentGame()
print("[Wraith] Loading " .. name .. " (place " .. tostring(game.PlaceId) .. ", universe " .. tostring(game.GameId) .. ")")

local ok, source = pcall(function()
	return game:HttpGet(BASE_URL .. name .. ".luau")
end)
if not ok then
	warn("[Wraith] Failed to download " .. name .. ": " .. tostring(source))
	return
end

local chunk, err = loadstring(source, "=" .. name)
if not chunk then
	warn("[Wraith] Failed to compile " .. name .. ": " .. tostring(err))
	return
end
chunk()
