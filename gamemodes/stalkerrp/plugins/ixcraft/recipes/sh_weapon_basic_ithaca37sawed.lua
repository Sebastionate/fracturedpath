RECIPE.name = "Sawnoff Ithaca 37"
RECIPE.description = "Measure and then cut down a length of the stock and barrel of an Ithaca 37 hunting shotgun to make it more comfortable in tight quarters."
RECIPE.model = "models/weapons/ethereal/w_sawedithaca37.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
["ithaca37"] = 1,
}

RECIPE.results = {
	["sawedithaca37"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("ithaca37")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)