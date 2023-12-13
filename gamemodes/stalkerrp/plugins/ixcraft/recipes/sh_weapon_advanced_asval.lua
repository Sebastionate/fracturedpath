RECIPE.name = "AS Val"
RECIPE.description = "Upgrade a VSS Vintorez with a faster firing speed, metal stock, and 20 round magazines."
RECIPE.model = "models/silver/stalker/weapons/w_val_item.mdl"
RECIPE.category = "Advanced Gunsmithing"
RECIPE.toolkits = {
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["vss"] = 1,
    ["weaponpartswarsawadvanced"] = 2,
    ["screws"] = 2,
}

RECIPE.results = {
	["asval"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("vss")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)