ITEM.name = "Medium Armor Scraps"
ITEM.description= "A piece salvaged from a medium armor suit."
ITEM.longdesc = "A chunk from a more specialized anomaly or combat suit that can be salvaged by an Armor Tech for use in their own projects."
ITEM.useflag = "6"
ITEM.model = "models/kek1ch/armor_repair_pro.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Kits"
ITEM.itemsForcedDrop = {}
ITEM.items[1] = {
	dropAmount = 3, --How many times it will roll for drop
	dropRareChance = 30, --chances for the rarer drops
	dropVeryRareChance = 20,
	itemsCommon = {
		{"clothscrap"},
		{"canvasscrap"},
		{"kevlarscrap"},
		{"rubberscrap"},
	},
	itemsRare = {
		{"armorplatingscrap"},
		{"fibreglasscrap"},
		{"metalmesh"},
		{"metalscrap"},
		{"plexiglassscrap"},


	},
	itemsVeryRare = {
		{"ceramicscrap"},
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

