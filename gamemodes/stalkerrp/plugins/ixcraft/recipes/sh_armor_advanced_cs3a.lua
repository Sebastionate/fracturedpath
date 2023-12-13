RECIPE.name = "CS-3A"
RECIPE.description = "Upgrade a CS-2 with improved armor plating, then add an application of AIR-1 to protect it from anomalies."
RECIPE.model = "models/kek1ch/cs_heavy_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.blueprint = "blueprint_duty"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["cs2"] = 1,
["cs3aparts"] = 2,
["air1"] = 1,
["ballistictape"] = 2,
}

RECIPE.results = {
	["seva_duty"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("psz9_duty")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)