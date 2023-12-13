RECIPE.name = "Roast Rat meat"
RECIPE.description = "Cook some Rat meat."
RECIPE.model = "models/kek1ch/meat_tushkano.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["waterclean"] = 1,
	["ratmeatraw"] = 1
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["roastedrat"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

