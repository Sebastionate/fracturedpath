ITEM.name = "Brannigan Ranch Flesh Steak"
ITEM.model = "models/kek1ch/meat_flesh.mdl"
ITEM.hunger = 40
ITEM.description = "A roasted, seasoned, and sauced chunk of Flesh steak."
ITEM.longdesc = "A fine meat from the Domestic subspecies of Flesh raised at Brannigan Ranch right here in the Zone. It's professionally prepared in the Zone, being both more palatable with its array of sauces and spices and almost entirely radiation free."
ITEM.quantity = 3
ITEM.price = 500
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_mutant_food.mp3"
ITEM:Hook("use", function(item)
	item.player:addRadiation(15)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
	item.player:addRadiation(2)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()