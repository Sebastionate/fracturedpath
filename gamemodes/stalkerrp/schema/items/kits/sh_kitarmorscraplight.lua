ITEM.name = "Light Armor Scraps"
ITEM.description= "A piece salvaged from a light armor suit."
ITEM.longdesc = "A chunk from a more common lightweight suit that can be picked apart by an Armor Tech to get a few pieces useful for their own projects, possibly including rubber, canvas, cloth, and kevlar."
ITEM.useflag = "6"
ITEM.model = "models/kek1ch/armor_repair_pro.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Kits"
ITEM.itemsForcedDrop = {}
ITEM.items[1] = {
	dropAmount = 2, --How many times it will roll for drop
	dropRareChance = 30, --chances for the rarer drops
	dropVeryRareChance = 20,
	itemsCommon = {
		{"clothscrap"},
		{"canvasscrap"},
	},
	itemsRare = {
		{"kevlarscrap"},
		{"rubberscrap"},

	},
	itemsVeryRare = {
		{"metalscrap"},
	}


}







--[[ Example format
ITEM.items[1] = {
	dropAmount = 5, --How many times it will roll for drop
	dropRareChance = 40, --chances for the rarer drops
	dropVeryRareChance = 20,
	itemsCommon = {
		{"9x18"},
		{"9x19"},
		{"12gauge"},
	},
	itemsRare = {
		{"57x28"},
		{"380acp"},
		{"762x25"},
	},
	itemsVeryRare = {
		{"22lr"},
		{"mp5", {["durability"] = 30}}, --Data can also be passed
		{"45acp"},
	},
}
]]--

