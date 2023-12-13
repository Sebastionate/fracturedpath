ITEM.name = "Brannigan Ranch Craft Brew"
ITEM.model = "models/kek1ch/dev_beer.mdl"
ITEM.thirst = 35
ITEM.description = "A bottle of locally brewed craft beer."
ITEM.longdesc = "The label indicates it's brewed, bottled, and labeled right here in the Zone, at the Brannigan Ranch on the south end."
ITEM.quantity = 3
ITEM.price = 115
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:addRadiation(-10)
end)
ITEM.weight = 0.1
ITEM.heal = 2
ITEM.healot = 1
ITEM:DecideFunction()