local kCannonEffects =

{
	draw =
    {
        marineWeaponDrawSounds =
        {
            {player_sound = "sound/NS2.fev/marine/rifle/draw", classname = "Cannon", done = true},
        },

    },
   reload_speed0 = 
    {
        gunReloadEffects =
        {

            {player_sound = "sound/Cannon.fev/combat_cannon/cannon_reload", classname = "Cannon", done = true},
		
        },
    },
	
	reload_speed1 = 
    {
        gunReloadEffects =
        {
	
            {player_sound = "sound/Cannon.fev/combat_cannon/cannon_reload1", classname = "Cannon", done = true},

        },
    },
	
    reload_cancel =
    {
        gunReloadCancelEffects =
        {

			{stop_sound = "sound/Cannon.fev/combat_cannon/cannon_reload", classname = "Cannon"},
			{stop_sound = "sound/Cannon.fev/combat_cannon/cannon_reload1", classname = "Cannon", done = true},

        },
    },
	cannon_attack = 
    {
        cannonAttackEffects = 
        {
            {viewmodel_cinematic = "cinematics/marine/cannon_muzzle_flash.cinematic", attach_point = "fxnode_hcmuzzle", empty = false},            
            //{weapon_cinematic = "cinematics/marine/pistol/muzzle_flash.cinematic", attach_point = "fxnode_hcmuzzle", empty = false},
			
			{player_sound = "sound/Cannon.fev/combat_cannon/canon_fire", done = true},
        },
    },
}
GetEffectManager():AddEffectData("kCannonEffects", kCannonEffects)