RECIPE.name = "AKS-74"
RECIPE.description = "Replace the fixed wooden stock on an AK-74 with a metal folding one to adapt to closer quarters better as required."
RECIPE.model = "models/silver/stalker/weapons/w_aks74n.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["ak74"] = 1,
    ["weaponpartswarsawrifle"] = 1,
    ["screws"] = 2,
}

RECIPE.results = {
	["aks74"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("ak74")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)