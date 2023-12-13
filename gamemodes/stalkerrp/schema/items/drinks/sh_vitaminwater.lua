ITEM.name = "Vitamin Water"
ITEM.model = "models/illusion/eftcontainers/aquamari.mdl"
ITEM.thirst = 35
ITEM.description = "A plastic bottle of sweet water."
ITEM.longdesc = "A plastic bottle of artificially sweetened water branded for pro-health effects. Unfortunately its sweeteners prove to be rather unhealthy in the long run, but at least it's low calorie and tastes good!"
ITEM.quantity = 4
ITEM.price = 300
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:addRadiation(-5)
end)
ITEM.weight = 0.1
ITEM.heal = 2
ITEM.healot = 1
ITEM:DecideFunction()