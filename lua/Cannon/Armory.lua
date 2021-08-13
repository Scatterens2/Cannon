local oldAdvancedArmoryGetItemList = AdvancedArmory.GetItemList
function AdvancedArmory:GetItemList(forPlayer)
    
    local itemList = oldAdvancedArmoryGetItemList(self, forPlayer)
    table.insert(itemList, kTechId.Cannon)
    return itemList
    
end