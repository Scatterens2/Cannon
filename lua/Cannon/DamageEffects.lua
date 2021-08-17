-- combined all effects into a single file.

kCannonDamageEffects =
{
 damage_decal =
    {
        damageDecals = 
        {
                  

			{decal = "cinematics/vfx_materials/decals/blast_01.material", scale = 0.5, doer = "Cannon", done = true},


		}
	},
	
}

GetEffectManager():AddEffectData("CannonDamageEffects", kCannonDamageEffects)