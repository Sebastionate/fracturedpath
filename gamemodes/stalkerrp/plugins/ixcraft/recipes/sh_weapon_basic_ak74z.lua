RECIPE.name = "AK-74 Zenith"
RECIPE.description = "Modernize an AK-74 with high quality custom parts from Zenitco."
RECIPE.model = "models/silver/stalker/weapons/w_ak74z.mdl"
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
    ["screws"] = 3,
}

RECIPE.results = {
	["ak74z"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("ak74")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)