RECIPE.name = "AK-74"
RECIPE.description = "Take an AKS-74u Carbine, add a longer barrel and handguard, then add a fixed wooden stock to make a full size AK-74 rifle."
RECIPE.model = "models/silver/stalker/weapons/w_ak74.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["aks74u"] = 1,
    ["weaponpartswarsawrifle"] = 2,
    ["screws"] = 3,
}

RECIPE.results = {
	["ak74"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("aks74u")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)