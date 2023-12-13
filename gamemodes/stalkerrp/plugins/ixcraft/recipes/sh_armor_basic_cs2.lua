RECIPE.name = "CS-2"
RECIPE.description = "Add some old soviet surplus gear onto the light Clear Sky uniform to enhance its durability for light combat."
RECIPE.model = "models/kek1ch/cs_heavy_outfit.mdl"
RECIPE.category = "Basic Armorsmithing"
RECIPE.toolkits = {
    "armorkitbasic",
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["cs1a"] = 1,
["cs2parts"] = 1,
["ducttape"] = 1,
["plexiglasscrap"] = 3,
["clothscrap"] = 3,
["rubberscrap"] = 3,
}

RECIPE.results = {
	["cs2"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("cs1a")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)