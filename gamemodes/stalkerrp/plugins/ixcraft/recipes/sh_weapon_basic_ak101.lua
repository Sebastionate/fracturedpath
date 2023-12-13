RECIPE.name = "AK-101"
RECIPE.description = "Prepare an AK74 meant for foreign expert - made with synthetic parts and additionally chambered in the potent 5.56 NATO round instead."
RECIPE.model = "models/silver/stalker/weapons/w_ak101.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["ak74"] = 1,
    ["weaponpartssynthetic"] = 3,
    ["screws"] = 2,
}

RECIPE.results = {
	["ak101"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("ak74")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)