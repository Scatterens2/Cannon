--Really need to find another way to do this so that multiple weapon mods play nicely.

function Marine:GetPlayerStatusDesc()

    local status = kPlayerStatus.Void
    
    if (self:GetIsAlive() == false) then
        return kPlayerStatus.Dead
    end
    
    local weapon = self:GetWeaponInHUDSlot(1)
    if (weapon) then
        if (weapon:isa("GrenadeLauncher")) then
            return kPlayerStatus.GrenadeLauncher
        elseif (weapon:isa("Rifle")) then
            return kPlayerStatus.Rifle
        elseif (weapon:isa("Shotgun")) then
            return kPlayerStatus.Shotgun
        elseif (weapon:isa("Flamethrower")) then
            return kPlayerStatus.Flamethrower
        elseif (weapon:isa("HeavyMachineGun")) then
            return kPlayerStatus.HeavyMachineGun
		elseif (weapon:isa("Cannon")) then
            return kPlayerStatus.Cannon
        end
    end
    
    return status
end

