RECIPE.name = "AK-103"
RECIPE.description = "Modernize an old AKM with carbon fiber parts and magazines for a lighter, more comfortable shoot."
RECIPE.model = "models/silver/stalker/weapons/w_ak103.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["akm"] = 1,
    ["weaponpartssynthetic"] = 3,
    ["screws"] = 2,
}

RECIPE.results = {
	["ak103"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("akm")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)