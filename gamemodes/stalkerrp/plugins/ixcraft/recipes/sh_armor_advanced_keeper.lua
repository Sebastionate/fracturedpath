RECIPE.name = "Keeper of Freedom"
RECIPE.description = "Assemble not only an ASD and Screen helm to a PSZ-9, but add a coating of Horizon to further enhance its anomalous protection at the cost of armor."
RECIPE.model = "models/kek1ch/scientific_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.blueprint = "blueprint_freedom"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["psz9_free"] = 1,
["sevaparts"] = 2,
["plexiglasscrap"] = 1,
["rubberscrap"] = 1,
["metalmesh"] = 2,
["clothscrap"] = 3,
["horizon"] = 1,
}

RECIPE.results = {
	["seva_free"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("psz9_free")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)