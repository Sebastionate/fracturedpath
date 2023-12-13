ITEM.name = "Heavy Armor Scraps"
ITEM.description= "A piece salvaged from a heavy armor suit."
ITEM.longdesc = "A chunk from a high-spec assault or anomalous exploration suit that can be salvaged by an Armor Tech for use in their own projects."
ITEM.useflag = "6"
ITEM.model = "models/kek1ch/armor_repair_pro.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Kits"
ITEM.itemsForcedDrop = {}
ITEM.items[1] = {
	dropAmount = 4, --How many times it will roll for drop
	dropRareChance = 30, --chances for the rarer drops
	dropVeryRareChance = 20,
	itemsCommon = {
		{"clothscrap"},
		{"canvasscrap"},
		{"kevlarscrap"},
		{"rubberscrap"},
		{"armorplatingscrap"},
		{"fibreglasscrap"},
		{"metalmesh"},
		{"metalscrap"},
		{"plexiglassscrap"},
	},
	itemsRare = {
		{"ceramicscrap"},
		{"armorplatingscrap"},
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

