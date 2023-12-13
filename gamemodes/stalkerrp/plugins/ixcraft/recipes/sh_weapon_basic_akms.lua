RECIPE.name = "AKMS"
RECIPE.description = "Replace the fixed wooden stock of an AKM with an underfolding metal one."
RECIPE.model = "models/silver/stalker/weapons/w_akms.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["akm"] = 1,
    ["weaponpartswarsawrifle"] = 2,
    ["screws"] = 2,
}

RECIPE.results = {
	["akms"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("akm")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)