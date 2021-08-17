local oldArmoryGetItemList = Armory.GetItemList
function Armory:GetItemList(forPlayer)
        

    local itemList = oldArmoryGetItemList(self, forPlayer)
	if self:GetTechId() == kTechId.AdvancedArmory then
		table.insert(itemList, kTechId.Cannon)
    end
	return itemList
    
end