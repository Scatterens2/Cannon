GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1     = PrecacheAsset("ui/buymenu_marine/button_group_frame_labelled_x2.dds")

local kExtraWeaponGroupButtonPositions = 
{	
	[GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1] = 

    {
		Vector(4, 4, 0),
    }
} 


local kTechIdInfo = 
{ 
		[kTechId.Cannon] = {
			
			ButtonTextureIndex = 15, 
			BigPictureIndex = 12,
			Description = "Sniper Rifle", 
			Stats =
					{
						LifeFormDamage = 1,
						StructureDamage = 1,
						Range = 1,
					}
							}
}


local kTechIdInfo = debug.getupvaluex(GUIMarineBuyMenu._GetButtonPixelCoordinatesForTechID, "kTechIdInfo")
kTechIdInfo[kTechId.Cannon].ButtonTextureIndex = 14

--local _GetButtonPixelCoordinatesForTechID = debug.getupvaluex(GUIMarineBuyMenu._CreateButton, "_GetButtonPixelCoordinatesForTechID")
local kTechIdInfo = debug.getupvaluex(GUIMarineBuyMenu._GetPigPicturePixelCoordinatesForTechID, "kTechIdInfo")
kTechIdInfo[kTechId.Cannon].BigPictureIndex =12


local kTechIdInfo = debug.getupvaluex(GUIMarineBuyMenu._SetDetailsSectionTechId, "kTechIdInfo")
kTechIdInfo[kTechId.Cannon].Stats = {
						LifeFormDamage = 1,
						StructureDamage = 1,
						Range = 1,
					}

function GUIMarineBuyMenu:CreateExtendedArmoryUI()
	
	local x1ButtonPositions = kExtraWeaponGroupButtonPositions[self.kButtonGroupFrame_Labeled_x1]
	
	local extraweaponGroupBottomLeft = self:CreateAnimatedGraphicItem()
    extraweaponGroupBottomLeft:SetIsScaling(false)
    extraweaponGroupBottomLeft:SetPosition(Vector(105, 900 , 0))
    extraweaponGroupBottomLeft:SetTexture(self.kButtonGroupFrame_Labeled_x1)
    extraweaponGroupBottomLeft:SetSizeFromTexture()
    extraweaponGroupBottomLeft:SetOptionFlag(GUIItem.CorrectScaling)
    self.background:AddChild(extraweaponGroupBottomLeft)
    self:_InitializeWeaponGroup(extraweaponGroupBottomLeft, x1ButtonPositions,   { kTechId.Cannon  })

end

function GUIMarineBuyMenu:SetHostStructure(hostStructure)

    assert(hostStructure)

    self.hostStructure = hostStructure

    if self.hostStructure:isa("Armory") then
        self:CreateArmoryUI()
        self:CreateExtendedArmoryUI()
    elseif self.hostStructure:isa("PrototypeLab") then
        self:CreatePrototypeLabUI()
    else
        Log(string.format("ERROR: No generator found for class: %s", self.hostStructure:GetClassName()))
    end
    
end