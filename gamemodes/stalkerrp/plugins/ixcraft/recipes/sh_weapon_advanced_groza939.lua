RECIPE.name = "Groza 9x39"
RECIPE.description = "Rechamber a Groza chambered in 7.62x39 to fire the subsonic 9x39 round for which it is well known."
RECIPE.model = "models/weapons/ethereal/item_groza1.mdl"
RECIPE.category = "Advanced Gunsmithing"
RECIPE.toolkits = {
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["groza"] = 1,
    ["weaponpartswarsawadvanced"] = 2,
    ["screws"] = 3,
}

RECIPE.results = {
	["groza9x39"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("groza")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)