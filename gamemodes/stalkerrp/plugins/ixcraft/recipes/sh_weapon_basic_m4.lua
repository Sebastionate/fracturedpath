RECIPE.name = "M16"
RECIPE.description = "Replace the stock on an M4 Carbine with a fixed stock, and add a longer barrel for a weapon meant for longer ranges."
RECIPE.model = "models/weapons/ethereal/w_m16.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["m4a1"] = 1,
    ["weaponpartsnatorifle"] = 2,
    ["screws"] = 2,
}

RECIPE.results = {
	["m16a4"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("m4a1")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)