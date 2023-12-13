RECIPE.name = "MP5SD"
RECIPE.description = "Modify the barrel of an MP5 to accept an integrated suppressor."
RECIPE.model = "models/silver/stalker/weapons/w_mp5sd.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
["mp5a4"] = 1,
["weaponpartsnatosmallarms"] = 1,
["screws"] = 2,
["rubberscrap"] = 1,
}

RECIPE.results = {
	["mp5sd"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("mp5")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)