ITEM.name = "Cash Stash"
ITEM.description= "A bundle of rubles bound together with a rubber band."
ITEM.longdesc = "You'll need to count it to see how much is bound together."
ITEM.model = "models/illusion/eftcontainers/roubles.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Kits"
ITEM.itemsForcedDrop = {}
ITEM.items[1] = {
	dropAmount = 1, --How many times it will roll for drop
	dropRareChance = 30, --chances for the rarer drops
	dropVeryRareChance = 15,
	itemsCommon = {
		{"bagrubles", {["quantity"] = 100}}, 
		{"bagrubles", {["quantity"] = 200}},
		{"bagrubles", {["quantity"] = 300}},
	},
	itemsRare = {
		{"bagrubles", {["quantity"] = 500}}, 
		{"bagrubles", {["quantity"] = 750}}, 

	},
	itemsVeryRare = {
		{"bagrubles", {["quantity"] = 1000}}, 
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

