RECIPE.name = "Beryl-5Md"
RECIPE.description = "Fit additional armor onto a Berl-5m suit to create a more potent combat suit used by Duty."
RECIPE.model = "models/kek1ch/spec_sold_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.blueprint = "blueprint_duty"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["berill5m"] = 1,
["armorpackage"] = 1,
["ballistictape"] = 2,
}

RECIPE.results = {
	["berill5m_duty"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("berill5m")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)