RECIPE.name = "Makarov PB6"
RECIPE.description = "Modify the barrel of a Makarov to accept, and then install, an integrated suppressor - as well as a return spring in the grip because the slide is too short to house it."
RECIPE.model = "models/silver/stalker/weapons/w_pb6p9.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
["pm"] = 1,
["weaponpartswarsawsmallarms"] = 1,
["screws"] = 2,
["rubberscrap"] = 1,
}

RECIPE.results = {
	["pb6p9"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("pm")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)