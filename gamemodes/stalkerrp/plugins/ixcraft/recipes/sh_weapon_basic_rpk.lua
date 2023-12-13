RECIPE.name = "RPK"
RECIPE.description = "Refit a newer RPK-74 into one based off the AKM, firing 7.62 and fitting a drum mag, making a tougher but heavier weapon."
RECIPE.model = "models/weapons/w_rpk.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["rpk74"] = 1,
    ["weaponpartswarsawrifle"] = 3,
    ["screws"] = 3,
}

RECIPE.results = {
	["rpk"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("rpk74")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)