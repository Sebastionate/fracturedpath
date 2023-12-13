RECIPE.name = "Purify Dirty Water with Industrial Filter"
RECIPE.description = "Boil and filter some dirty water to with an industrial filter to purify it without the need for any limited use tablets."
RECIPE.model = "models/kek1ch/drink_water.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
["waterdirty"] = 1,
}

RECIPE.tools = {"industrialfilter"}

RECIPE.results = {
["waterclean"] = 1
}


RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

