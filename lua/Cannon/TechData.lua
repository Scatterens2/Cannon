local oldBuildTechData = BuildTechData
function BuildTechData()
    
    local techData = oldBuildTechData()
							
	table.insert(techData,{ 
	
            [kTechDataId] = kTechId.Cannon,
            [kTechDataMaxHealth] = kMarineWeaponHealth,
            [kTechDataTooltipInfo] = "CANNON_TOOLTIP",
            [kTechDataPointValue] = kCannonPointValue,
            [kTechDataMapName] = Cannon.kMapName,
            [kTechDataDisplayName] = "CANNON",
            [kTechDataModel] = Cannon.kModelName,
            [kTechDataDamageType] = kCannonDamageType,
            [kTechDataCostKey] = kCannonCost,} )
	
	
	table.insert(techData,{

            [kTechDataId] = kTechId.CannonTech,
            [kTechDataCostKey] = kCannonTechResearchCost,
            [kTechDataResearchTimeKey] = kCannonTechResearchTime,
            [kTechDataDisplayName] = "RESEARCH_CANNON",
            [kTechDataTooltipInfo] = "CANNON_TOOLTIP", } )
   
	table.insert(techData,{ 
	
            [kTechDataId] = kTechId.DropCannon,
            [kTechDataMapName] = Cannon.kMapName,
            [kTechDataDisplayName] = "CANNON_DROP",
            [kTechIDShowEnables] = false,
            [kTechDataTooltipInfo] = "CANNON_TOOLTIP",
            [kTechDataModel] = Cannon.kModelName,
            [kTechDataCostKey] = kCannonCost,
            [kStructureAttachId] = { kTechId.AdvancedArmory },
            [kStructureAttachRange] = kArmoryWeaponAttachRange,
            [kStructureAttachRequiresPower] = true, } )

	
   
    return techData

end


local function TechDataChanges(techData)

    for techIndex, record in ipairs(techData) do
     /*   local techDataId = record[kTechDataId]
		if techDataId == kTechId.Observatory then
            record[kTechDataSupply] = kObservatorySupply
        elseif techDataId == kTechId.SentryBattery then
            record[kTechDataSupply] = kSentryBatterySupply
		end*/
    end
	
end

local oldBuildTechData = BuildTechData
function BuildTechData()
    local techData = oldBuildTechData()
    TechDataChanges(techData)
    return techData
end
