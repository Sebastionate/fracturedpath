RECIPE.name = "SSP-99m"
RECIPE.description = "Intall a kevlar vest into an SSP-99m suit, and replace its bubble helmet with a stronger, shatter-resistant glass to improve its ability against low level threats."
RECIPE.model = "models/kek1ch/ecolog_outfit_green.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["ssp99"] = 1,
["ssp99mparts"] = 2,
["ballistictape"] = 2,
}

RECIPE.results = {
	["ssp99m"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("ssp99")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)