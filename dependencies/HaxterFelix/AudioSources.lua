-- AudioSources.lua
-- Stand-in for Haxter Felix's deleted "Zutter.lua" gist (protected remote catalog "AudioSources").
--
-- Shape: { ["<Built In animation name>"] = "<url of an .ogg, raw or base64>",
--          ["<name> 2"] = "<part 2 url>", ... up to "<name> 20" }
-- cacheBuiltinAudioPartsIfNeeded downloads each part into HaxterHubAudios/<key>.ogg.
--
-- The original pointed at hosted song files that are gone with the gist, so this ships empty.
-- Built In animations still play, just without music. Keep this in step with AudioLogsSources.lua:
-- an entry there without a matching source here makes the player try to play a missing file.

return {}
