RECIPE.name = "LR-300"
RECIPE.description = "Fit an M4 Carbine with a skeletionized folding stock and more refined parts to create an LR-300 Carbine Rifle."
RECIPE.model = "models/weapons/ethereal/w_lr300.mdl"
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
    ["weaponpartssynthetic"] = 1,
    ["screws"] = 2,
}

RECIPE.results = {
	["lr300"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("m4a1")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)