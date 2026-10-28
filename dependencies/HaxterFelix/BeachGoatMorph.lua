-- BeachGoatMorph.lua
-- Stand-in for Haxter Felix's deleted "Zom-Beam.lua" gist (protected remote catalog "BeachGoatMorph").
--
-- Shape: {
--   Data = { ["<slot 1-7>"] = { ["<option name>"] = { <exact mesh/part spec> } } },
--   UnionAssetFallbacks = { ["<union key>"] = "rbxassetid://<id>" },
-- }
-- The original held exact per-part asset data captured from another game, which can't be rebuilt.
-- With Data empty, HaxterApplyBeachGoatMorphSelection returns 0 and HaxterBuildR6MorphOnCharacter
-- falls back to its own generated ellipsoid/primitive morph, so the Morph Studio still works.

return {
	Data = {},
	UnionAssetFallbacks = {},
}
