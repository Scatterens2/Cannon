
local oldCombatMarineBuy_GUISortUps = CombatMarineBuy_GUISortUps
function CombatMarineBuy_GUISortUps(upgradeList)

	local cannonUpgrade
	for _, upgrade in ipairs(upgradeList) do
		if upgrade:GetTechId() == kTechId.Cannon then
			cannonUpgrade = upgrade
			break
		end
	end

	local oldList = oldCombatMarineBuy_GUISortUps(upgradeList)
	
	if cannonUpgrade then
		for index, entry in ipairs(oldList) do
			if entry.GetTechId and entry:GetTechId() == kTechId.Shotgun  then
				table.insert(oldList, index+1, cannonUpgrade)
				break
			end
		end
	end
	
	return oldList
	
end

local oldDescFunc = CombatMarineBuy_GetWeaponDescription
function CombatMarineBuy_GetWeaponDescription(techId)
	if techId == kTechId.Cannon then
		return "BLABLABLAS"
	end
	return oldDescFunc(techId)
end