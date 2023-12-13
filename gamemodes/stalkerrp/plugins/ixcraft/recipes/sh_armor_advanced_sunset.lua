RECIPE.name = "Sunset Suit"
RECIPE.description = "Further improve on the armor of a Dusk and make a capable assault suit with plate carrier."
RECIPE.model = "models/kek1ch/exolight_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["dusk"] = 1,
["sunsetparts"] = 1,
["ballistictape"] = 2,
["armorplatingscrap"] = 2,
["clothscrap"] = 2,
}

RECIPE.results = {
	["sunset"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("sunset")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)