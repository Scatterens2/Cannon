local origGetMaterialXYOffset = GetMaterialXYOffset
function GetMaterialXYOffset(techId)
   if techId == kTechId.Cannon or techId == kTechId.DropCannon or techId == kTechId.CannonTech  then
		techId = kTechId.HeavyMachineGun
   end
    return origGetMaterialXYOffset(techId)
end

--local kTechIdToMaterialOffset = debug.getupvaluex(GetMaterialXYOffset, "kTechIdToMaterialOffset")
