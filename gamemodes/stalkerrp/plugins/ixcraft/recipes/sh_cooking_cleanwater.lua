RECIPE.name = "Purify Dirty Water"
RECIPE.description = "Boil and filter some dirty water and apply purification tablets to make it safe to drink and cook with."
RECIPE.model = "models/kek1ch/drink_water.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
["waterdirty"] = 1,
["waterpurificationtablets"] = 1,
}

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

