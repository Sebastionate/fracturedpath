RECIPE.name = "Brew Coffee"
RECIPE.description = "Brew up some instant coffee. Makes four servings."
RECIPE.model = "models/kek1ch/drink_crow.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["waterclean"] = 1,
	["instantcoffee"] = 1
}

RECIPE.tools = {"kettle"}

RECIPE.results = {
["cupcoffee"] = 4
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

