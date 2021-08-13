if Server then
	local oldHitSound_IsEnabledForWeapon = HitSound_IsEnabledForWeapon
    function HitSound_IsEnabledForWeapon( techId )
        return oldHitSound_IsEnabledForWeapon or techId == kTechId.Cannon
    end
end