RECIPE.name = "PKP"
RECIPE.description = "Upgrade an aging PKM machine gun with new synthetic parts and a receiver that allows quicker shots."
RECIPE.model = "models/weapons/ethereal/w_pkp.mdl"
RECIPE.category = "Expert Gunsmithing"
RECIPE.toolkits = {
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["pkm"] = 1,
    ["weaponpartswarsawadvanced"] = 5,
    ["weaponpartssynthetic"] = 5,
    ["screws"] = 3,
}

RECIPE.results = {
	["pkp"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("pkp")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)