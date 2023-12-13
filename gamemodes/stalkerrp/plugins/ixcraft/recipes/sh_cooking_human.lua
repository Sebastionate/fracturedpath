RECIPE.name = "Roast Human meat"
RECIPE.description = "Cook some Human meat, you absolute sicko."
RECIPE.model = "models/kek1ch/meat_bloodsucker.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["waterclean"] = 1,
	["humanmeatraw"] = 1
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["roastedhuman"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

