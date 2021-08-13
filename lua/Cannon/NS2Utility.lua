
local oldBuildClassToGrid = BuildClassToGrid
function BuildClassToGrid()

    local ClassToGrid = oldBuildClassToGrid()
    
    ClassToGrid["Cannon"] = { 3, 2 }
    
    return ClassToGrid
    
end

local loadChangelingBite = true
local oldGetTexCoordsForTechId = GetTexCoordsForTechId
function GetTexCoordsForTechId(techId)
	if loadChangelingBite and gTechIdPosition then
		gTechIdPosition[kTechId.Cannon] = kDeathMessageIcon.Cannon
		loadChangelingBite = false
	end
	return oldGetTexCoordsForTechId(techId)
end
