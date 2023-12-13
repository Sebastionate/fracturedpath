RECIPE.name = "CS-3B"
RECIPE.description = "Upgrade to the CS-3B Assault Suit, a high quality dual-purpose armor made in tiny quantities for the assault on the CNPP."
RECIPE.model = "models/kek1ch/cs_heavy_outfit.mdl"
RECIPE.category = "Expert Armorsmithing"
RECIPE.blueprint = "blueprint_clearsky"
RECIPE.toolkits = {
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["cs3a"] = 1,
["cs3bparts"] = 4,
["ballistictape"] = 2,
["armorplatingscrap"] = 2,
["rubberscrap"] = 2,
["metalmesh"] = 2,
["plexiglasscrap"] = 2
}

RECIPE.results = {
	["cs3b"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("cs3a")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)