RECIPE.name = "Sentinel of Freedom"
RECIPE.description = "Apply some Horizon coating as well as a little extra protective layers to a PSZ-9 to make it a lightweight, versatile Sentinel of Freedom model."
RECIPE.model = "models/kek1ch/stalker_outfit.mdl"
RECIPE.category = "Basic Armorsmithing"
RECIPE.blueprint = "blueprint_freedom"
RECIPE.toolkits = {
    "armorkitbasic",
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["psz9"] = 1,
["horizon"] = 1,
["ducttape"] = 1,
["plexiglasscrap"]= 1,
["rubberscrap"] = 1,
}

RECIPE.results = {
	["psz9_free"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("psz9")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)