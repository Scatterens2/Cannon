local origUpdateModel = EquipmentOutline_UpdateModel()
function EquipmentOutline_UpdateModel(forEntity)
	if weaponclass == 'Cannon' then
		weaponclass = 'HeavyMachineGun'
	end
	return origUpdateModel(forEntity)
end
