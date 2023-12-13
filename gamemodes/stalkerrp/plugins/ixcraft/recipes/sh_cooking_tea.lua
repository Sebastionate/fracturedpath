RECIPE.name = "Brew Tea"
RECIPE.description = "Brew some delightful tea. Makes four servings."
RECIPE.model = "models/kek1ch/drink_crow.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["waterclean"] = 1,
	["teabags"] = 1
}

RECIPE.tools = {"kettle"}

RECIPE.results = {
["cuptea"] = 4
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

