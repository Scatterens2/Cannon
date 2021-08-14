GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1     = PrecacheAsset("ui/buymenu_marine/button_group_frame_labeled_x2.dds")
GUIMarineBuyMenu.kButtonsTexture                  = PrecacheAsset("ui/buymenu_marine/buttons_16_slots.dds")
GUIMarineBuyMenu.kArmoryBigPicturesTexture        = PrecacheAsset("ui/buymenu_marine/armory_bigicons_1.dds")

local kExtraWeaponGroupButtonPositions = 
{	
	[GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1] = 

    {
		Vector(4, 4, 0),
    }
} 

local kTechIdInfo = debug.getupvaluex(GUIMarineBuyMenu._GetButtonPixelCoordinatesForTechID, "kTechIdInfo")

table.insert(kTechIdInfo,	
	kTechId.Cannon, 
	{	
		ButtonTextureIndex = 15,
		BigPictureIndex = 12, 
		Description = "A long range weapon excelling at killing lightly armoured lifeforms.",    
		Stats = {   LifeFormDamage = 0.8,
					StructureDamage = 0.5,
					Range = 1,	
				}
	}
 )


function GUIMarineBuyMenu:CreateExtendedArmoryUI()
	
	local x1ButtonPositions = kExtraWeaponGroupButtonPositions[self.kButtonGroupFrame_Labeled_x1]
	
	local extraweaponGroupBottomLeft = self:CreateAnimatedGraphicItem()
    extraweaponGroupBottomLeft:SetIsScaling(false)
    extraweaponGroupBottomLeft:SetPosition(Vector(105, 780 , 0))
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