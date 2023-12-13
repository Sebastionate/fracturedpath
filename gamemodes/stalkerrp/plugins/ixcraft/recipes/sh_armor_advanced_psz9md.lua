RECIPE.name = "PSZ-9md"
RECIPE.description = "Assemble an anomaly-trawling suit with a focus on combat, as used by certain Duty soldiers."
RECIPE.model = "models/kek1ch/scientific_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.blueprint = "blueprint_duty"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["psz9_duty"] = 1,
["sevaparts"] = 2,
["armorplatingscrap"] = 1,
["ballistictape"] = 1,
["armorpackage"] = 1,
}

RECIPE.results = {
	["seva_duty"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("psz9_duty")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)