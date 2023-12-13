ITEM.name = "Antidote"
ITEM.model = "models/kek1ch/drug_antidot.mdl"
ITEM.description = "A combination drug that counter-acts poisoning and chemical weapons inhalation. Makes user experience vertigo at random points, making climbing and acrobatic stunts impossible.\n\n+1 Chem Protection\n-15 Reflex\n-Last Half an Hour."
ITEM.category = "Medical"
ITEM.price = 750
ITEM.flag = "1"

ITEM.functions.Use = {
	sound = "stalker/interface/inv_eat_pills_effect.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player

	end
}
