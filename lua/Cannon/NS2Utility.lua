
local oldBuildClassToGrid = BuildClassToGrid
function BuildClassToGrid()

    local ClassToGrid = oldBuildClassToGrid()
    
    ClassToGrid["Cannon"] = { 3, 2 }
    
    return ClassToGrid
    
end

local loadCannon = true
local oldGetTexCoordsForTechId = GetTexCoordsForTechId
function GetTexCoordsForTechId(techId)
	if loadCannon and gTechIdPosition then
		gTechIdPosition[kTechId.Cannon] = kDeathMessageIcon.Cannon
		loadCannon = false
	end
	return oldGetTexCoordsForTechId(techId)
end
