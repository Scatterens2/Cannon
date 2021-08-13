if Client then
	local origGetCrosshairY = PlayerUI_GetCrosshairY
	function PlayerUI_GetCrosshairY()
		if mapname == Cannon.kMapName then
			mapname = Rifle.kMapName
		end
		return origGetCrosshairY(self)
	end
end
	