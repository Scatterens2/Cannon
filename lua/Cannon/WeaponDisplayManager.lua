
-- Mods that add extra weapons can extend this method to add extra weapon classes to the table.
function WeaponDisplayManager:GetWeaponClassesToPreload()

    local classList = {}
    
    assert(Flamethrower)        table.insert(classList, Flamethrower)
    assert(GrenadeLauncher)     table.insert(classList, GrenadeLauncher)
    assert(HeavyMachineGun)     table.insert(classList, HeavyMachineGun)
    assert(LayMines)            table.insert(classList, LayMines)
    assert(Pistol)              table.insert(classList, Pistol)
    assert(Rifle)               table.insert(classList, Rifle)
    assert(Shotgun)             table.insert(classList, Shotgun)
    assert(Welder)              table.insert(classList, Welder)
    assert(Cannon)              table.insert(classList, Cannon)
    
    return classList

end
