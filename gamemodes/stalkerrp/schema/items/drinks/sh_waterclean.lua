ITEM.name = "Clean Water"
ITEM.model = "models/kek1ch/drink_water.mdl"
ITEM.thirst = 10
ITEM.description = "A flask of clean water."
ITEM.longdesc = "A flask of a about a cup of locally acquired water, clean from radiation but with a sour taste. For drinking on its own or in brewed beverages."
ITEM.quantity = 1
ITEM.price = 10
ITEM.width = 1
ITEM.height = 1
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