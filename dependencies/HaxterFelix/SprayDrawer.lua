-- SprayDrawer.lua
-- Stand-in for Haxter Felix's deleted "Zombies.lua" gist (remote data module "SprayDrawer").
--
-- Nothing in the current Haxter Felix build loads this module: HaxterRemoteDataModuleUrls still lists it,
-- but the Neighbors tools only clear the old HaxterSprayDraw* globals. It exists so the URL resolves
-- and HaxterLoadRemoteDataModule("SprayDrawer") returns a table instead of warning.

return {
	Version = "wraith-1",
	Settings = {
		Size = 1,
		PlaceUnderPlayer = false,
	},
}
