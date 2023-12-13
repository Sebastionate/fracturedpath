RECIPE.name = "SVU"
RECIPE.description = "Upgrade an SVD with new polymer parts forming a bullpup design, integrated bipod, and suppressor - an ideal marksman's weapon."
RECIPE.model = "models/weapons/ethereal/w_svu.mdl"
RECIPE.category = "Expert Gunsmithing"
RECIPE.toolkits = {
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["svd"] = 1,
    ["weaponpartswarsawadvanced"] = 5,
    ["weaponpartssynthetic"] = 5,
    ["screws"] = 3,
}

RECIPE.results = {
	["svu"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("svd")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)