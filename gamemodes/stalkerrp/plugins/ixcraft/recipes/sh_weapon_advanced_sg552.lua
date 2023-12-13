RECIPE.name = "SG-552 Commando"
RECIPE.description = "Replace the barrel and stock of an SG-551 rifle to make a compact 552 Commando carbine."
RECIPE.model = "models/weapons/ethereal/sg552/w_sg552.mdl"
RECIPE.category = "Advanced Gunsmithing"
RECIPE.toolkits = {
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["sg551"] = 1,
    ["weaponpartsnatorifle"] = 3,
    ["weaponpartssynthetic"] = 1,
    ["screws"] = 3,
}

RECIPE.results = {
	["sg552"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("sg551")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)