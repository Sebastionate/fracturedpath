RECIPE.name = "PSZ-12d"
RECIPE.description = "Refit a Stingray-9m into its older, but more protective counterpart by stripping out the compensation suit and adding in heavier armoring."
RECIPE.model = "models/kek1ch/spec_sold_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.blueprint = "blueprint_duty"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["skat9"] = 1,
["armorpackage"] = 1,
["ballistictape"] = 2,
["armorplatingscrap"] = 2,
}

RECIPE.results = {
	["psz12d_duty"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("skat9")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)