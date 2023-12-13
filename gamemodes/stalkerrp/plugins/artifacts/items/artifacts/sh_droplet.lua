ITEM.name = "Droplet"
ITEM.model = "models/nasca/etherealsrp_artifacts/droplet.mdl"
ITEM.description = "Looks like tears."
ITEM.longdesc = "This artifact forms in thermal anomalies under very high temperatures. Its body is made of a compound with a glassy surface covered in cracks, formed into the shape of a tear. It neutralizes radiation absorbed by the wearer.\n\n-+1 Radiation Protection\n-20 Fortitude"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 6200
ITEM.flag = "A"
ITEM.isArtefact = true
ITEM.weight = 0.5
ITEM.res = {
	["Fall"] = 0.00,
	["Blast"] = 0.00,
	["Bullet"] = 0.00,
	["Shock"] = 0.00,
	["Burn"] = 0.00,
	["Radiation"] = 0.10,
	["Chemical"] = 0.00,
	["Psi"] = 0.00,
}
ITEM.buffs = {
	["fortitude"] = -20,
}