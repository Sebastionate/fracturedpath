RECIPE.name = "SKAT-9"
RECIPE.description = "Upgrade an outdated PSZ-12 suit to a newer Stingray, sacrificing some armor but making it much more versatile for Zone operations."
RECIPE.model = "models/kek1ch/military_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.blueprint = "blueprint_military"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["psz12d_duty"] = 1,
["skat9parts"] = 2,
["ballistictape"] = 2,
}

RECIPE.results = {
	["skat9"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("psz12d_duty")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)