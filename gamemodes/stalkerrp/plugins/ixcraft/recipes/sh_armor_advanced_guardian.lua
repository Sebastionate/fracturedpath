RECIPE.name = "Guardian of Freedom"
RECIPE.description = "Apply a bit of Horizon coating to a B-5 suit to lighten its weight and improve its anomaly protection."
RECIPE.model = "models/kek1ch/spec_sold_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.blueprint = "blueprint_freedom"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["berill5m"] = 1,
["horizon"] = 1,
["ballistictape"] = 2,
}

RECIPE.results = {
	["berill5m_free"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("berill5m")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)