RECIPE.name = "PSZ-9d"
RECIPE.description = "Install an Armoring Package and a plate carrier vest onto a PSZ-9 suit to remove some environmental protection but add armor, creating the surprisingly mighty PSZ-9d suit used by members of Duty."
RECIPE.model = "models/kek1ch/stalker_outfit.mdl"
RECIPE.category = "Basic Armorsmithing"
RECIPE.blueprint = "blueprint_duty"
RECIPE.toolkits = {
    "armorkitbasic",
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["psz9"] = 1,
["ducttape"] = 1,
["platecarrier"] = 1,
}

RECIPE.results = {
	["psz9_duty"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("psz9")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)