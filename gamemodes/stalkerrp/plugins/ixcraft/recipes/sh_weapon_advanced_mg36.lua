RECIPE.name = "MG36"
RECIPE.description = "Install a longer, heavy barrel, flash hider, and bipod on a G36, and replace the mags with Beta C-Mags to create a weapon meant for sustained fire support."
RECIPE.model = "models/silver/stalker/weapons/w_mg36.mdl"
RECIPE.category = "Advanced Gunsmithing"
RECIPE.toolkits = {
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["g36c"] = 1,
    ["weaponpartsnatoadvanced"] = 3,
    ["screws"] = 3,
}

RECIPE.results = {
	["mg36"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("g36c")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)