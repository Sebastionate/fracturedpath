RECIPE.name = "Makarov Pmm"
RECIPE.description = "Upgrade a Makarov PM its newer PMm variant, which has a more egonomic grip, better casing extraction, and most notably fits larger capacity magazines."
RECIPE.model = "models/silver/stalker/weapons/w_pmm.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
["pm"] = 1,
["weaponpartswarsawsmallarms"] = 1,
["screws"] = 2,
}

RECIPE.results = {
	["pmm"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("pm")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)