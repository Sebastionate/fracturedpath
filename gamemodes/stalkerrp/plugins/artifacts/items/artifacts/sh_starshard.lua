ITEM.name = "Star Shard"
ITEM.model ="models/srp/items/spezzy/art_trystal.mdl"
ITEM.description = "A misshapen piece of broken crystal glowing with power."
ITEM.longdesc = "A broken shard said to have fallen from the sky in recent times, stories tell of how the Zone shook for hours and as it did, a thousand crystals fell from the sky waiting to be collected. Their value is highly subjective in the stalking community, but plenty of collectors will pay a fine sum for them.\n\n+3 Psi\n-2 Rad\n-20 Observation"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 4500
ITEM.flag = "A"
ITEM.isArtefact = true
ITEM.res = {
	["Fall"] = 0.00,
	["Blast"] = 0.00,
	["Bullet"] = 0.00,
	["Shock"] = -0.20,
	["Burn"] = 0.00,
	["Radiation"] = -0.20,
	["Chemical"] = 0.00,
	["Psi"] = 0.30,
}
ITEM.weight = 1.5
ITEM.buffs = {
	["observation"] = -20,
}