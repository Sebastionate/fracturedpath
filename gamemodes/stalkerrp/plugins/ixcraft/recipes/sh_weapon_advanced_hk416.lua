RECIPE.name = "HK-416"
RECIPE.description = "Refit an M4 Carbine with improved, high quality parts and a proprietary gas-stroke system from HK."
RECIPE.model = "models/weapons/ethereal/w_hk416.mdl"
RECIPE.category = "Advanced Gunsmithing"
RECIPE.toolkits = {
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["m4a1"] = 1,
    ["weaponpartsnatorifle"] = 3,
    ["weaponpartssynthetic"] = 1,
    ["screws"] = 3,
}

RECIPE.results = {
	["hk416"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("m4a1")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)