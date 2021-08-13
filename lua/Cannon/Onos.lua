
Onos.kBlockDoers["Cannon"] = true 

local oldHitsBoneShield = Onos.GetHitsBoneShield
function Onos:GetHitsBoneShield(doer, hitPoint)
	oldHitsBoneShield(self, doer, hitPoint)
end