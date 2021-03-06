-- Required files to be visible from anywhere
require( 'libraries/timers' )
require( 'ffrenzy' )
require( 'upgrades' )
require( 'utilities' )
require( 'orders' )
require( 'physics' )
require( 'popups' )
require( 'mechanics/require' )
require( 'statcollection/init' )
require( 'buildings/rally_point' )

function Precache( context )
	print("[ffrenzy] Performing pre-load precache")

	-- Particles can be precached individually or by folder
	-- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed
	PrecacheResource("particle", "particles/econ/generic/generic_aoe_explosion_sphere_1/generic_aoe_explosion_sphere_1.vpcf", context)
	PrecacheResource("particle_folder", "particles/test_particle", context)

	-- Models can also be precached by folder or individually
	-- PrecacheModel should generally used over PrecacheResource for individual models
	PrecacheResource("model_folder", "models/items/juggernaut/", context)
	PrecacheResource("model", "particles/heroes/viper/viper.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_troll_skeleton/n_creep_troll_skeleton_fx.vmdl", context)
	PrecacheModel("models/heroes/pedestal/effigy_pedestal_ti5_dire.vmdl", context)

	-- Sounds can precached here like anything else
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)

	-- Entire items can be precached by name
	-- Abilities can also be precached in this way despite the name
	PrecacheItemByNameSync("item_rally", context)

	-- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
	-- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
	PrecacheUnitByNameSync("npc_dota_hero_luna", context)
	PrecacheUnitByNameSync("npc_dota_hero_juggernaut", context)

	----------------------
	PrecacheUnitByNameSync("human_barracks", context)
	PrecacheUnitByNameSync("human_footman", context)
	PrecacheUnitByNameSync("human_scout_tower", context)
	
end

-- Create the game mode when we activate
function Activate()
	GameRules.GameMode = GameMode()
	GameRules.GameMode:InitGameMode()
end
