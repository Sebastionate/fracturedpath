ITEM.name = "Cup Of Coffee"
ITEM.model = "models/kek1ch/drink_crow.mdl"
ITEM.thirst = 25
ITEM.description = "A nice hot cup of chocolaty hot coco."
ITEM.longdesc = "Might be made using water... maybe powdered milk if you're lucky... maybe."
ITEM.quantity = 1
ITEM.price = 65
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 2
ITEM.healot = 1
ITEM:DecideFunction()