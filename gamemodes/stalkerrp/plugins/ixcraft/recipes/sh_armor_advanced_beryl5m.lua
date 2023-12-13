RECIPE.name = "Beryl-5M"
RECIPE.description = "Add an improved plate vest to a Beryl-3, bodysuit with beryillium stutter, and improved combat helmet to make a potent Spetsnaz assault armor."
RECIPE.model = "models/kek1ch/spec_sold_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["berill3m"] = 1,
["b5parts"] = 1,
["ballistictape"] = 2,
["armorplatingscrap"] = 2,
["clothscrap"] = 3,
["metalmesh"] = 1,
}

RECIPE.results = {
	["berill5m"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("berill3m")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)