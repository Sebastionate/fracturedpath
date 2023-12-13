ITEM.name = "Psi-Block"
ITEM.model = "models/stalker/item/medical/psy_pills.mdl"
ITEM.description = "Drug designed to protect the body from nervous overload by means of strong emotions or psy-attacks. Makes the user incredibly sluggish and slow-thinking."
ITEM.category = "Medical"
ITEM.price = 2500
ITEM.flag = "1"

ITEM.functions.Use = {
	sound = "stalker/interface/inv_eat_pills_effect.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player

	end
}
