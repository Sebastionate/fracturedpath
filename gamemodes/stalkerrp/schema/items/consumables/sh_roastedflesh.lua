ITEM.name = "Roasted Flesh Meat"
ITEM.model = "models/kek1ch/meat_flesh.mdl"
ITEM.hunger = 30
ITEM.description = "Roasted mutant meat."
ITEM.longdesc = "Remains of a flesh, cleaned and roasted on a campfire. Could almost call it a kebab. Not very healthy."
ITEM.quantity = 3
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_mutant_food.mp3"
ITEM:Hook("use", function(item)
	item.player:addRadiation(15)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
	item.player:addRadiation(10)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()