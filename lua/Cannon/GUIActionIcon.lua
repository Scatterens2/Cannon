local old_GUIActionIcon_ShowIcon = GUIActionIcon.ShowIcon
function GUIActionIcon:ShowIcon(buttonText, weaponType, hintText, holdFraction)
    if weaponType == 'Cannon' then
		weaponType = 'HeavyMachineGun'   end
    return old_GUIActionIcon_ShowIcon(self, buttonText, weaponType, hintText, holdFraction)
end
