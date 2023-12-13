RECIPE.name = "Beryl-3M"
RECIPE.description = "Retrofit an outdated military service uniform with some armor to bring it up to a modern standard."
RECIPE.model = "models/kek1ch/spec_sold_outfit.mdl"
RECIPE.category = "Basic Armorsmithing"
RECIPE.toolkits = {
    "armorkitbasic",
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["berill1"] = 1,
["b3parts"] = 1,
["ducttape"] = 1,
["metalscrap"] = 3,
["clothscrap"] = 3,
}

RECIPE.results = {
	["berill3m"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("berill1")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)