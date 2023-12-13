RECIPE.name = "SKAT-9M"
RECIPE.description = "Add a modernization kit to a SKAT-9, bringing it up to a high standard across the board for any operations."
RECIPE.model = "models/kek1ch/military_outfit.mdl"
RECIPE.category = "Expert Armorsmithing"
RECIPE.blueprint = "blueprint_military"
RECIPE.toolkits = {
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["skat9"] = 1,
["skat9mparts"] = 3,
["ballistictape"] = 2,
["armorplatingscrap"] = 1,
["rubberscrap"] = 1,
["metalmesh"] = 1,
}

RECIPE.results = {
	["skat9m"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("skat9")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)