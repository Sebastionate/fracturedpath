RECIPE.name = "Sawnoff TOZ-66"
RECIPE.description = "Measure and then cut down a length of an TOZ-66's twin barrels to make a concealable defense weapon."
RECIPE.model = "models/weapons/ethereal/w_sawnoff_db.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
["toz66"] = 1,
}

RECIPE.results = {
	["toz66sawed"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("toz66")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)