
local upgrade = CombatMarineUpgrade()

upgrade:Initialize(kCombatUpgrades.Cannon, "cannon", "Cannon", kTechId.Cannon, nil, kCombatUpgrades.Shotgun, 1, kCombatUpgradeTypes.Weapon, false, 0, { kCombatUpgrades.Exosuit, kCombatUpgrades.RailGunExosuit, kCombatUpgrades.DualMinigunExosuit })

table.insert(UpsList, upgrade)