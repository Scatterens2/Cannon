--local kUmbraModifier = debug.getupvaluex(ModifyDamageTaken, "kUmbraModifier")
--kUmbraModifier["Cannon"] = kUmbraCannonModifier
--debug.setupvaluex( ModifyDamageTaken, "kUmbraModifier", kUmbraModifier)

local kUmbraModifier = {}
kUmbraModifier["Shotgun"] = kUmbraShotgunModifier
kUmbraModifier["Rifle"] = kUmbraBulletModifier
kUmbraModifier["HeavyMachineGun"] = kUmbraBulletModifier
kUmbraModifier["Cannon"] = kUmbraCannonModifier
kUmbraModifier["Pistol"] = kUmbraBulletModifier
kUmbraModifier["Sentry"] = kUmbraBulletModifier
kUmbraModifier["Minigun"] = kUmbraMinigunModifier
kUmbraModifier["Railgun"] = kUmbraRailgunModifier
kUmbraModifier["Grenade"] = kUmbraGrenadeModifier
kUmbraModifier["ClusterGrenade"] = kUmbraGrenadeModifier
kUmbraModifier["PulseGrenade"] = kUmbraGrenadeModifier

function UmbraMixin:ModifyDamageTaken(damageTable, attacker, doer, damageType)

    if self:GetHasUmbra() then
    
        local modifier = 1
        if doer then        
            modifier = kUmbraModifier[doer:GetClassName()] or 1        
        end
    
        damageTable.damage = damageTable.damage * modifier
        
    end
    

end
