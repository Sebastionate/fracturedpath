ITEM.name = "Chocolate"
ITEM.model = "models/kek1ch/dev_chocolate.mdl"
ITEM.hunger = 5
ITEM.description = "A bar of chocolate"
ITEM.longdesc = "A standard, foil-wrapped bar of Chocolate. A rather sweet and uncommon treat in the Zone. Found most often in the packs of younger Stalkers or Tourists who have freshly arrived within the Border. Not very filling."
ITEM.quantity = 3
ITEM.price = 200
ITEM.width = 2
ITEM.height = 1
ITEM.cookable = false
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_paperwrap.mp3"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()