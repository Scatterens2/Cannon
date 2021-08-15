local oldMarineBuy_GetWeaponDescription = MarineBuy_GetWeaponDescription
function MarineBuy_GetWeaponDescription(techId)
    if techId ~= kTechId.Cannon then
        return oldMarineBuy_GetWeaponDescription(techId)
    end
    
    local description = "The AI sentry gun targets and fires automatically upon any aliens in its line of sight. Requires a welder to build! Only one can be deployed at a time!"

    local techTree = GetTechTree()
    local requires = techTree:GetRequiresText(techId)

    if requires ~= "" then
        description = string.format(Locale.ResolveString("WEAPON_DESC_REQUIREMENTS"), requires:lower(), description)
    end

    
    return description
    
end

local gDisplayTechs
local function GetDisplayTechId(techId)

    if not gDisplayTechs then
    
        gDisplayTechs = {}
        gDisplayTechs[kTechId.Axe] = true
        gDisplayTechs[kTechId.Pistol] = true
        gDisplayTechs[kTechId.Rifle] = true
        gDisplayTechs[kTechId.Shotgun] = true
        gDisplayTechs[kTechId.Flamethrower] = true
        gDisplayTechs[kTechId.GrenadeLauncher] = true
        gDisplayTechs[kTechId.Welder] = true
        gDisplayTechs[kTechId.ClusterGrenade] = true
        gDisplayTechs[kTechId.GasGrenade] = true
        gDisplayTechs[kTechId.PulseGrenade] = true
        gDisplayTechs[kTechId.LayMines] = true
        gDisplayTechs[kTechId.Jetpack] = true
        gDisplayTechs[kTechId.Exosuit] = true
        gDisplayTechs[kTechId.Cannon] = true
    
    end

    return gDisplayTechs[techId]

end

function MarineBuy_GetEquipped()

    local equipped = unique_set()
    
    local player = Client.GetLocalPlayer()
    local items = GetChildEntities(player, "ScriptActor")

    for _, item in ipairs(items) do
    
        local techId = item:GetTechId()
        if GetDisplayTechId(techId) then
            equipped:Insert(techId)
        end
        
    end
    
    if player and player:isa("JetpackMarine") then
        equipped:Insert(kTechId.Jetpack)
    end    
    
    return equipped:GetList()

end
local oldOnItemSelect = MarineBuy_OnItemSelect
function MarineBuy_OnItemSelect(techId)
	
	if techId == kTechId.Cannon then
		StartSoundEffect(kMarineBuyMenuSounds.SelectWeapon)
	end
	
    oldOnItemSelect(self, techId)

end

