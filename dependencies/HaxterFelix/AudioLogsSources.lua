-- AudioLogsSources.lua
-- Stand-in for Haxter Felix's deleted "ZOO Trend.lua" gist (protected remote catalog "AudioLogsSources").
--
-- Shape: { ["<Built In animation name>"] = { PlaybackSpeed = 1, Volume = 1, PitchShiftOctave = nil } }
--   or, for multi-part audio, a list of those tables, one per part.
-- Read by HaxterLoadR15BuiltInAudioAsync and the R6 player to set per-track speed/volume/pitch.
--
-- Ships empty alongside AudioSources.lua. Any name listed here switches audio on for that animation,
-- so only add one once AudioSources.lua has a matching file for it.

return {}
