GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1     = PrecacheAsset("ui/buymenu_marine/button_group_frame_labelled_x2.dds")

local kExtraWeaponGroupButtonPositions = 
{	
	[GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1] = 

    {
		Vector(4, 4, 0),
    }
} 


local kExtraTechIdInfo = 
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
kExtraTechIdInfo[kTechId.Cannon].ButtonTextureIndex = 15


local kTechIdInfo = debug.getupvaluex(GUIMarineBuyMenu._GetPigPicturePixelCoordinatesForTechID, "kTechIdInfo")
kExtraTechIdInfo[kTechId.Cannon].BigPictureIndex = 12

local kTechIdInfo = debug.getupvaluex(GUIMarineBuyMenu._SetDetailsSectionTechId, "kTechIdInfo")
kExtraTechIdInfo[kTechId.Cannon].Stats =
    {
        LifeFormDamage = 1,
        StructureDamage = 1,
        Range = 1,
    }

local oldCreateArmory = GUIMarineBuyMenu.CreateArmoryUI
function GUIMarineBuyMenu:CreateArmoryUI()
	
	oldCreateArmory(self)

	local x1ButtonPositions = kExtraWeaponGroupButtonPositions[self.kButtonGroupFrame_Labeled_x1]
	
	local extraweaponGroupBottomLeft = self:CreateAnimatedGraphicItem()
    extraweaponGroupBottomLeft:SetIsScaling(false)
    extraweaponGroupBottomLeft:SetPosition(Vector(paddingX, weaponGroupBottomLeft:GetPosition().y + weaponGroupBottomLeft:GetSize().y , 0))
    extraweaponGroupBottomLeft:SetTexture(self.kButtonGroupFrame_Labeled_x1)
    extraweaponGroupBottomLeft:SetSizeFromTexture()
    extraweaponGroupBottomLeft:SetOptionFlag(GUIItem.CorrectScaling)
    self.background:AddChild(extraweaponGroupBottomLeft)
    self:_InitializeWeaponGroup(extraweaponGroupBottomLeft, x1ButtonPositions,   { kTechId.Cannon  })

	
end
