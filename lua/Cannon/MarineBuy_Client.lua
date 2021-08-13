local gWeaponDescription
function MarineBuy_GetWeaponDescription(techId)

    if not gWeaponDescription then
    
        gWeaponDescription = { }
        gWeaponDescription[kTechId.Axe] = "WEAPON_DESC_AXE"
        gWeaponDescription[kTechId.Pistol] = "WEAPON_DESC_PISTOL"
        gWeaponDescription[kTechId.Rifle] = "WEAPON_DESC_RIFLE"
        gWeaponDescription[kTechId.Shotgun] = "WEAPON_DESC_SHOTGUN"
        gWeaponDescription[kTechId.Flamethrower] = "WEAPON_DESC_FLAMETHROWER"
        gWeaponDescription[kTechId.GrenadeLauncher] = "WEAPON_DESC_GRENADELAUNCHER"
        gWeaponDescription[kTechId.HeavyMachineGun] = "WEAPON_DESC_HMG"
        gWeaponDescription[kTechId.Welder] = "WEAPON_DESC_WELDER"
        gWeaponDescription[kTechId.LayMines] = "WEAPON_DESC_MINE"
        gWeaponDescription[kTechId.ClusterGrenade] = "WEAPON_DESC_CLUSTER_GRENADE"
        gWeaponDescription[kTechId.GasGrenade] = "WEAPON_DESC_GAS_GRENADE"
        gWeaponDescription[kTechId.PulseGrenade] = "WEAPON_DESC_PULSE_GRENADE"
        gWeaponDescription[kTechId.Jetpack] = "WEAPON_DESC_JETPACK"
        gWeaponDescription[kTechId.DualMinigunExosuit] = "WEAPON_DESC_DUALMINIGUN_EXO"
        gWeaponDescription[kTechId.DualRailgunExosuit] = "WEAPON_DESC_CLAWRAILGUN_EXO"
        gWeaponDescription[kTechId.Cannon] = "CANNON DESCRIPTION"
        
    end
    
    local description = gWeaponDescription[techId]
    if not description then
        description = ""
    end

    description = Locale.ResolveString(description)

    local techTree = GetTechTree()
    local requieres = techTree:GetRequiresText(techId)

    if requieres ~= "" then
        description = string.format(Locale.ResolveString("WEAPON_DESC_REQUIREMENTS"), requieres:lower(), description)
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

function MarineBuy_OnItemSelect(techId)

    if techId == kTechId.Axe or techId == kTechId.Rifle or techId == kTechId.Shotgun or techId == kTechId.HeavyMachineGun or techId == kTechId.GrenadeLauncher or
       techId == kTechId.Flamethrower or techId == kTechId.Welder or techId == kTechId.LayMines or techId == kTechId.Cannon then
       
        StartSoundEffect(kMarineBuyMenuSounds.SelectWeapon)
        
    elseif techId == kTechId.Jetpack then
    
        StartSoundEffect(kMarineBuyMenuSounds.SelectJetpack)

    elseif techId == kTechId.Exosuit then
    
        StartSoundEffect(kMarineBuyMenuSounds.SelectExosuit)
        
    end

end