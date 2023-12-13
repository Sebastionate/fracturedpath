RECIPE.name = "NBC Suit"
RECIPE.description = "Remove some armoring from a Sunrise suit and use some salvaged hazmat gear to make an anomalous exploration suit."
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
["nbcparts"] = 1,
["ducttape"] = 1,
["clothscrap"] = 1,
}

RECIPE.results = {
	["nbc"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("sunrise")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)