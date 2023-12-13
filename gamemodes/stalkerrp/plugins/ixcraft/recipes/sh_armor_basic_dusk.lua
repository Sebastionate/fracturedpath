RECIPE.name = "Dusk Suit"
RECIPE.description = "Reinforce the armor of a Sunrise to make it more fit for the Zone's mutant and human dangers."
RECIPE.model = "models/kek1ch/stalker_outfit.mdl"
RECIPE.category = "Basic Armorsmithing"
RECIPE.toolkits = {
    "armorkitbasic",
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["sunrise"] = 1,
["duskparts"] = 1,
["ducttape"] = 1,
["metalscrap"] = 2,
}

RECIPE.results = {
	["dusk"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("sunrise")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)