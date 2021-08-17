
local oldGetIsPrimary = GetIsPrimaryWeapon
function GetIsPrimaryWeapon(kMapName)
    
	local isPrimary = false
    if kMapName == Cannon.kMapName then
		isPrimary = true
		return isPrimary 
	else 
		return oldGetIsPrimary()
	end
	
   
end