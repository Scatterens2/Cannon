local oldInitTechTree = MarineTeam.InitTechTree
function MarineTeam:InitTechTree()

    local oldSetComplete = TechTree.SetComplete
    TechTree.SetComplete = function() end
    
    oldInitTechTree(self)
    
    
	--self.techTree:AddResearchNode(kTechId.CannonTech,           kTechId.PrototypeLab, kTechId.None)   
	self.techTree:AddTargetedBuyNode(kTechId.Cannon,                    kTechId.AdvancedWeaponry, kTechId.None)    
    self.techTree:AddTargetedActivation(kTechId.DropCannon,    kTechId.AdvancedWeaponry, kTechId.None)
    
    
    TechTree.SetComplete = oldSetComplete
    self.techTree:SetComplete()
    
end
