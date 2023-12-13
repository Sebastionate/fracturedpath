ITEM.name = "Bottled Water"
ITEM.model = "models/kek1ch/dev_mineral_water.mdl"
ITEM.thirst = 30
ITEM.description = "A bottle containing water."
ITEM.longdesc = "A sealed, commerically packaged bottle of water."
ITEM.quantity = 3
ITEM.price = 200
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_drink_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:addRadiation(-5)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()