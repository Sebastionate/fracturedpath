ITEM.name = "Snowflake"
ITEM.model ="models/nasca/etherealsrp_artifacts/snowflake.mdl"
ITEM.description = "This artifact features blue spikes."
ITEM.longdesc = "Bearing a similar structure to the Kolobok, this artifact forms in electrical anomalies. It is known to have an electrostimulative effect which significantly improves the user's vitality and muscle tone.\n\nT3 Rad\n-4 Electric\n+30 Reflex"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 47000
ITEM.flag = "A"
ITEM.isArtefact = true
ITEM.weight = 3.2
ITEM.res = {
	["Fall"] = 0.00,
	["Blast"] = 0.00,
	["Bullet"] = 0.00,
	["Shock"] = -0.40,
	["Burn"] = 0.00,
	["Radiation"] = -0.30,
	["Chemical"] = 0.00,
	["Psi"] = 0.00,
}

ITEM.buffs = {
	["reflex"] = 30,
}