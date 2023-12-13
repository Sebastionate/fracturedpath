RECIPE.name = "FN FAL"
RECIPE.description = "Install a new, automatic receiver to an L1 battle rifle, enabling select fire."
RECIPE.model = "models/weapons/ethereal/w_fal.mdl"
RECIPE.category = "Advanced Gunsmithing"
RECIPE.toolkits = {
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["l1a1"] = 1,
    ["weaponpartsnatorifle"] = 4,
    ["screws"] = 3,
}

RECIPE.results = {
	["fal"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("l1a1")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)