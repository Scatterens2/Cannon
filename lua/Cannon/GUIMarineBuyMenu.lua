
GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1     = PrecacheAsset("ui/buymenu_marine/button_group_frame_labelled_x2.dds")


local kButtonShowState = enum({
    'Uninitialized',
    'NotHosted',
    'Occupied',
    'Equipped',
    'Unresearched',
    'InsufficientFunds',
    'Available',
    'Disabled', -- Tutorial should block 'Axe' purchasing, for example. Override 'GUIMarineBuyMenu:GetTechIDDisabled(techID)' for this.
})

local kButtonShowStateDefinitions =
{
    [kButtonShowState.Disabled] = {
        ShowError = true,
        Text = "BUYMENU_ERROR_DISABLED",
        TextColor = Color(239/255, 94/255, 80/255)
    },

    [kButtonShowState.NotHosted] = {
        ShowError = true,
        Text = "BUYMENU_ERROR_UNAVAILABLE",
        TextColor = Color(94/255, 116/255, 128/255)
    },

    [kButtonShowState.Occupied] = {
        ShowError = true,
        Text = "BUYMENU_ERROR_OCCUPIED",
        TextColor = Color(94/255, 116/255, 128/255)
    },

    [kButtonShowState.Equipped] = {
        ShowError = true,
        Text = "BUYMENU_ERROR_EQUIPPED",
        TextColor = Color(2/255, 230/255, 255/255)
    },

    [kButtonShowState.Unresearched] = {
        ShowError = true,
        Text = "BUYMENU_ERROR_NOTRESEARCHED",
        TextColor = Color(94/255, 116/255, 128/255)
    },

    [kButtonShowState.InsufficientFunds] = {
        ShowError = true,
        Text = "BUYMENU_ERROR_INSUFFICIENTFUNDS",
        TextColor = Color(239/255, 94/255, 80/255)
    },

    [kButtonShowState.Available] = {
        ShowError = false,
    },
}

local kWeaponGroupButtonPositions =
{

    [GUIMarineBuyMenu.kButtonGroupFrame_Unlabeled_x2] =
    {
        Vector(4, 4, 0),
        Vector(4, 122, 0)
    },

    [GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x3] =
    {
        Vector(4, 20, 0),
        Vector(4, 140, 0),
        Vector(4, 258, 0),
    },

    [GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x4] =
    {
        Vector(4, 25, 0),
        Vector(4, 143, 0),
        Vector(4, 262, 0),
        Vector(4, 380, 0),

    },

}

kWeaponGroupButtonPositions[GUIMarineBuyMenu.kButtonGroupFrame_Labeled_x1] = 

    {
		Vector(4, 4, 0),
    }

local kSpecial = enum(
{
    'Massive',
    'Electrify',
    'Burn'
})

local kSpecialDefinitions =
{
    [kSpecial.Massive] =
    {
        TextureCoordinates = { 0, 0, 717, 184 },
        Title = "BUYMENU_MASSIVE_TITLE",
        Specials =
        {
            "BUYMENU_MASSIVE_SPECIAL1",
            "BUYMENU_MASSIVE_SPECIAL2",
            "BUYMENU_MASSIVE_SPECIAL3",
            "BUYMENU_MASSIVE_SPECIAL4",
            "BUYMENU_MASSIVE_SPECIAL5",
        },
        SpecialsDebuffs = set
        {
            4, 5
        }
    },

    [kSpecial.Electrify] =
    {
        TextureCoordinates = { 0, 185, 717, 279 },
        Title = "BUYMENU_ELECTRIFY_TITLE",
        Specials =
        {
            "BUYMENU_ELECTRIFY_SPECIAL1",
        }
    },

    [kSpecial.Burn] =
    {
        TextureCoordinates = { 0, 370, 717, 464 },
        Title = "BUYMENU_BURN_TITLE",
        Specials =
        {
            "BUYMENU_BURN_SPECIAL1",
            "BUYMENU_BURN_SPECIAL2",
        }
    }
}

local kTechIdStats =
{
    [kTechId.Axe] =
    {
        LifeFormDamage = 0.1,
        StructureDamage = 0.7,
        Range = 0.1,
    },

    [kTechId.Welder] =
    {
        LifeFormDamage = 0.1,
        StructureDamage = 0.2,
        Range = 0.1,
    },

    [kTechId.Pistol] =
    {
        LifeFormDamage = 0.8,
        StructureDamage = 0.5,
        Range = 1,
    },

    [kTechId.Rifle] =
    {
        LifeFormDamage = 0.8,
        StructureDamage = 0.8,
        Range = 0.8,
    },

    [kTechId.Shotgun] =
    {
        LifeFormDamage = 1,
        StructureDamage = 0.8,
        Range = 0.4,
    },

    [kTechId.GrenadeLauncher] =
    {
        LifeFormDamage = 0.3,
        StructureDamage = 1,
        Range = 0.9,
    },

    [kTechId.HeavyMachineGun] =
    {
        LifeFormDamage = 1,
        StructureDamage = 0.6,
        Range = 0.7,
    },
    [kTechId.Cannon] =
	{  
		LifeFormDamage = 1,         
		StructureDamage = 0.6,
		Range = 1,
	},

    [kTechId.Flamethrower] =
    {
        LifeFormDamage = 0.6,
        StructureDamage = 1,
        Range = 0.4,
    },

    [kTechId.GasGrenade] =
    {
        LifeFormDamage = 0.4,
        StructureDamage = 0.6,
        Range = 0.7,
        RangeLabelOverride = "BUYMENU_GRENADES_RANGE_OVERRIDE",
    },

    [kTechId.ClusterGrenade] =
    {
        LifeFormDamage = 0.2,
        StructureDamage = 0.8,
        Range = 0.6,
        RangeLabelOverride = "BUYMENU_GRENADES_RANGE_OVERRIDE",
    },

    [kTechId.PulseGrenade] =
    {
        LifeFormDamage = 0.5,
        StructureDamage = 0.1,
        Range = 0.4,
        RangeLabelOverride = "BUYMENU_GRENADES_RANGE_OVERRIDE",
    },

    [kTechId.DualMinigunExosuit] =
    {
        LifeFormDamage = 0.9,
        StructureDamage = 0.8,
        Range = 0.7,
    },

    -- Prototype Lab "big" pictures are a seperate texture file.
    [kTechId.DualRailgunExosuit] =
    {
        LifeFormDamage = 1,
        StructureDamage = 0.6,
        Range = 1,
    }, 
}

												

local function GetStatsForTechId(techId)


    local stats = kTechIdStats[techId]
    if stats then
        return stats
    end

    return nil

end

local kTechIdInfo =
{
    [kTechId.Pistol] =
    {
        ButtonTextureIndex = 0,
        BigPictureIndex = 0,
        Description = "PISTOL_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.Pistol)
    },

    [kTechId.Rifle] =
    {
        ButtonTextureIndex = 1,
        BigPictureIndex = 1,
        Description = "RIFLE_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.Rifle)
    },

    [kTechId.Shotgun] =
    {
        ButtonTextureIndex = 2,
        BigPictureIndex = 2,
        Description = "SHOTGUN_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.Shotgun)
    },

    [kTechId.GrenadeLauncher] =
    {
        ButtonTextureIndex = 3,
        BigPictureIndex = 3,
        Description = "GRENADELAUNCHER_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.GrenadeLauncher)
    },

    [kTechId.Flamethrower] =
    {
        ButtonTextureIndex = 4,
        BigPictureIndex = 4,
        Description = "FLAMETHROWER_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.Flamethrower),
        Special = kSpecial.Burn
    },

    [kTechId.HeavyMachineGun] =
    {
        ButtonTextureIndex = 5,
        BigPictureIndex = 5,
        Description = "HMG_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.HeavyMachineGun)
    }, 


    [kTechId.Axe] =
    {
        ButtonTextureIndex = 6,
        BigPictureIndex = 6,
        Description = "AXE_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.Axe)
    },

    [kTechId.Welder] =
    {
        ButtonTextureIndex = 7,
        BigPictureIndex = 7,
        Description = "WELDER_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.Welder)
    },

    [kTechId.GasGrenade] =
    {
        ButtonTextureIndex = 8,
        BigPictureIndex = 8,
        Description = "GASGRENADE_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.GasGrenade)
    },

    [kTechId.ClusterGrenade] =
    {
        ButtonTextureIndex = 9,
        BigPictureIndex = 9,
        Description = "CLUSTERGRENADE_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.ClusterGrenade)
    },

    [kTechId.PulseGrenade] =
    {
        ButtonTextureIndex = 10,
        BigPictureIndex = 10,
        Description = "PULSEGRENADE_BUYDESCRIPTION",
        Special = kSpecial.Electrify,
        Stats = GetStatsForTechId(kTechId.PulseGrenade)
    },

    [kTechId.LayMines] =
    {
        ButtonTextureIndex = 11,
        BigPictureIndex = 11,
        Description = "MINES_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.LayMines)
    },

    -- Prototype Lab "big" pictures are a seperate texture file.
    [kTechId.Jetpack] =
    {
        ButtonTextureIndex = 12,
        BigPictureIndex = 2,
        Description = "JETPACK_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.Jetpack)
    },

    [kTechId.DualRailgunExosuit] =
    {
        ButtonTextureIndex = 13,
        BigPictureIndex = 1,
        Description = "DUALRAILGUN_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.DualRailgunExosuit),
        Special = kSpecial.Massive
    },

    [kTechId.DualMinigunExosuit] =
    {
        ButtonTextureIndex = 14,
        BigPictureIndex = 0,
        Description = "DUALMINIGUN_BUYDESCRIPTION",
        Stats = GetStatsForTechId(kTechId.DualMinigunExosuit),
        Special = kSpecial.Massive
    },
	[kTechId.Cannon] =  
	{ 
		ButtonTextureIndex = 15,
		BigPictureIndex = 15,
		Description = "A weapon suited to popping low armoured lifeforms",
		Stats = GetStatsForTechId(kTechId.Cannon),
	}
}







local oldCreateArmory = GUIMarineBuyMenu.CreateArmoryUI
function GUIMarineBuyMenu:CreateArmoryUI()
	
	local paddingX = 105 -- Start of content from left side of background.
    local paddingY = 36
    -- 449
    local paddingXWeaponGroups = 29
    -- 449
    local paddingYWeaponGroups = 6
    local paddingXWeaponGroupsToRightSide = 36 -- 724 after this till end. (not including end cap)

    self.defaultTechId = kTechId.Rifle

    self.background = self:CreateAnimatedGraphicItem()
    self.background:SetTexture(self.kArmoryBackgroundTexture)
    self.background:SetSizeFromTexture()
    self.background:SetIsScaling(false)
    self.background:SetAnchor(GUIItem.Middle, GUIItem.Center)
    self.background:SetHotSpot(Vector(0.5, 0.5, 0))
    self.background:SetScale(self.customScaleVector)
    self.background:SetOptionFlag(GUIItem.CorrectScaling)
    self.background:SetLayer(kGUILayerMarineBuyMenu)

    local x2ButtonPositions = kWeaponGroupButtonPositions[self.kButtonGroupFrame_Unlabeled_x2]
    local x4ButtonPositions = kWeaponGroupButtonPositions[self.kButtonGroupFrame_Labeled_x4]

    local weaponGroupTopLeft = self:CreateAnimatedGraphicItem()
    weaponGroupTopLeft:SetIsScaling(false)
    weaponGroupTopLeft:SetPosition(Vector(paddingX, paddingY, 0))
    weaponGroupTopLeft:SetTexture(self.kButtonGroupFrame_Unlabeled_x2)
    weaponGroupTopLeft:SetSizeFromTexture()
    weaponGroupTopLeft:SetOptionFlag(GUIItem.CorrectScaling)
    self.background:AddChild(weaponGroupTopLeft)
    self:_InitializeWeaponGroup(weaponGroupTopLeft, x2ButtonPositions,
    {
        kTechId.Pistol,
        kTechId.Rifle
    })

    local weaponGroupBottomLeft = self:CreateAnimatedGraphicItem()
    weaponGroupBottomLeft:SetIsScaling(false)
    weaponGroupBottomLeft:SetPosition(Vector(paddingX, weaponGroupTopLeft:GetPosition().y + weaponGroupTopLeft:GetSize().y + paddingYWeaponGroups, 0))
    weaponGroupBottomLeft:SetTexture(self.kButtonGroupFrame_Labeled_x4)
    weaponGroupBottomLeft:SetSizeFromTexture()
    weaponGroupBottomLeft:SetOptionFlag(GUIItem.CorrectScaling)
    self.background:AddChild(weaponGroupBottomLeft)
    self:_InitializeWeaponGroup(weaponGroupBottomLeft, x4ButtonPositions,
    {
        kTechId.Shotgun,
        kTechId.GrenadeLauncher,
        kTechId.Flamethrower,
        kTechId.HeavyMachineGun
    })
	local x1ButtonPositions = kWeaponGroupButtonPositions[self.kButtonGroupFrame_Labeled_x1]
	
	local extraweaponGroupBottomLeft = self:CreateAnimatedGraphicItem()
    extraweaponGroupBottomLeft:SetIsScaling(false)
    extraweaponGroupBottomLeft:SetPosition(Vector(paddingX, weaponGroupBottomLeft:GetPosition().y + weaponGroupBottomLeft:GetSize().y , 0))
    extraweaponGroupBottomLeft:SetTexture(self.kButtonGroupFrame_Labeled_x1)
    extraweaponGroupBottomLeft:SetSizeFromTexture()
    extraweaponGroupBottomLeft:SetOptionFlag(GUIItem.CorrectScaling)
    self.background:AddChild(extraweaponGroupBottomLeft)
    self:_InitializeWeaponGroup(extraweaponGroupBottomLeft, x1ButtonPositions,   { kTechId.Cannon  })
    local x4LabelStartX = 335

    local labelItemBottomLeft = self:CreateAnimatedTextItem()
    labelItemBottomLeft:SetIsScaling(false)
    labelItemBottomLeft:AddAsChildTo(weaponGroupBottomLeft)
    labelItemBottomLeft:SetPosition(Vector(x4LabelStartX, 0, 0))
    labelItemBottomLeft:SetAnchor(GUIItem.Left, GUIItem.Top)
    labelItemBottomLeft:SetTextAlignmentX(GUIItem.Align_Min)
    labelItemBottomLeft:SetTextAlignmentY(GUIItem.Align_Min)
    labelItemBottomLeft:SetFontName(Fonts.kAgencyFB_Tiny)
    labelItemBottomLeft:SetText(Locale.ResolveString("BUYMENU_GROUPLABEL_WEAPONS"))
    labelItemBottomLeft:SetOptionFlag(GUIItem.CorrectScaling)
    GUIMakeFontScale(labelItemBottomLeft, "kAgencyFB", 24)

    local weaponGroupTopRight = self:CreateAnimatedGraphicItem()
    weaponGroupTopRight:SetIsScaling(false)
    weaponGroupTopRight:AddAsChildTo(self.background)
    weaponGroupTopRight:SetPosition(Vector(weaponGroupTopLeft:GetPosition().x + weaponGroupTopLeft:GetSize().x + paddingXWeaponGroups, paddingY, 0))
    weaponGroupTopRight:SetTexture(self.kButtonGroupFrame_Unlabeled_x2)
    weaponGroupTopRight:SetSizeFromTexture()
    weaponGroupTopRight:SetOptionFlag(GUIItem.CorrectScaling)
    self:_InitializeWeaponGroup(weaponGroupTopRight, x2ButtonPositions,
    {
        kTechId.Axe,
        kTechId.Welder
    })

    local weaponGroupBottomRight = self:CreateAnimatedGraphicItem()
    weaponGroupBottomRight:SetIsScaling(false)
    weaponGroupBottomRight:AddAsChildTo(self.background)
    weaponGroupBottomRight:SetPosition(Vector(weaponGroupTopRight:GetPosition().x, weaponGroupTopRight:GetPosition().y + weaponGroupTopRight:GetSize().y + paddingYWeaponGroups, 0))
    weaponGroupBottomRight:SetTexture(self.kButtonGroupFrame_Labeled_x4)
    weaponGroupBottomRight:SetSizeFromTexture()
    weaponGroupBottomRight:SetOptionFlag(GUIItem.CorrectScaling)
    self:_InitializeWeaponGroup(weaponGroupBottomRight, x4ButtonPositions,
    {
        kTechId.GasGrenade,
        kTechId.ClusterGrenade,
        kTechId.PulseGrenade,
        kTechId.LayMines
    })

    local labelItemBottomRight = self:CreateAnimatedTextItem()
    labelItemBottomRight:SetIsScaling(false)
    labelItemBottomRight:AddAsChildTo(weaponGroupBottomRight)
    labelItemBottomRight:SetPosition(Vector(x4LabelStartX, 0, 0))
    labelItemBottomRight:SetAnchor(GUIItem.Left, GUIItem.Top)
    labelItemBottomRight:SetTextAlignmentX(GUIItem.Align_Min)
    labelItemBottomRight:SetTextAlignmentY(GUIItem.Align_Min)
    labelItemBottomRight:SetFontName(Fonts.kAgencyFB_Tiny)
    labelItemBottomRight:SetText(Locale.ResolveString("BUYMENU_GROUPLABEL_UTILITY"))
    labelItemBottomRight:SetOptionFlag(GUIItem.CorrectScaling)
    GUIMakeFontScale(labelItemBottomRight, "kAgencyFB", 24)

    local rightSideStartPos = weaponGroupTopRight:GetPosition()
    rightSideStartPos.x = rightSideStartPos.x + weaponGroupTopRight:GetSize().x
    rightSideStartPos.x = rightSideStartPos.x + paddingXWeaponGroupsToRightSide
    self:_CreateRightSide(rightSideStartPos)
	

	
end