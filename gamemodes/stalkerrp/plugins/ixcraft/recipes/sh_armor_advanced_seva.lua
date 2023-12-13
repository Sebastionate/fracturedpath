RECIPE.name = "SEVA"
RECIPE.description = "Attach an ASD, screen helmet, and plate carrier to a PSZ-9 to make an excellent dual-purpose suit."
RECIPE.model = "models/kek1ch/scientific_outfit.mdl"
RECIPE.category = "Advanced Armorsmithing"
RECIPE.toolkits = {
    "armorkitadvanced",
    "armorkitexpert"
}
RECIPE.flag = "6"

RECIPE.requirements = {
["psz9"] = 1,
["sevaparts"] = 2,
["plexiglasscrap"]= 1,
["rubberscrap"] = 1,
["metalmesh"] = 2,
["clothscrap"] = 3,
}

RECIPE.results = {
	["seva"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local suit = client:GetCharacter():GetInventory():HasItem("psz9")
    if (suit) then
        if (suit:GetData("durability") < 80) then
            return false, "Base suit must be at least 80 percent condition"
        end
    end
		
end)