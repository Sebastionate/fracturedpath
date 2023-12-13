RECIPE.name = "Roast Boar meat"
RECIPE.description = "Cook some boar meat."
RECIPE.model = "models/kek1ch/meat_boar.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["waterclean"] = 1,
	["boarmeatraw"] = 1
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["roastedboar"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

