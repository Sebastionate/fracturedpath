RECIPE.name = "AK-74M"
RECIPE.description = "Modernize an AK-74 with new synthetic parts with folding stock."
RECIPE.model = "models/silver/stalker/weapons/w_ak74m.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["ak74"] = 1,
    ["weaponpartssynthetic"] = 2,
    ["screws"] = 2,
}

RECIPE.results = {
	["ak74m"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("ak74")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)