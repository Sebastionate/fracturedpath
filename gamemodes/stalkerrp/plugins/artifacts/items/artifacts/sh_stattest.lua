ITEM.name = "Stat Test"
ITEM.model = "models/tnb/stalker/artifacts/sponge.mdl"
ITEM.description = "A flat fungus-like organism."
ITEM.longdesc = "Often found in bodies of water predominantly in the Lost Highway. It uses some form of bio-electric process to purify the water and in this way is able to absorb considerable electricity, but those wearing it will find their body more fragile and subject to bleeding more easily.\n\nBleeding +2\nElectrical +4\nImpact -1"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 12000
ITEM.flag = "A"
ITEM.isArtefact = true
ITEM.weight = 1
ITEM.res = {
	["Fall"] = 0.00,
	["Blast"] = 0.00,
	["Bullet"] = 0.00,
	["Shock"] = 0.40,
	["Burn"] = 0.00,
	["Radiation"] = 0.00,
	["Chemical"] = 0.00,
	["Psi"] = 0.00,
}


-- Array of buffs to provide. Valid attribs are strength, reflex, fortune, observation, and fortitude. Negative number to debuff.
ITEM.buffs = {
	["reflex"] = 10,
	["strength"] = 10
}
