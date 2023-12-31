ITEM.name = "Slime"
ITEM.model ="models/nasca/etherealsrp_artifacts/slime.mdl"
ITEM.description = "Slimey."
ITEM.longdesc = "This artifact forms in various chemical anomalies. While rendering its user susceptible to burns both chemical and thermal in nature, it serves to mitigate the bleeding in open wounds.\n\n+2 Bleed\n-1 Thermal\n-1 Chemical"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 5200
ITEM.flag = "A"
ITEM.isArtefact = true
ITEM.weight = 0.9
ITEM.res = {
	["Fall"] = 0.00,
	["Blast"] = 0.00,
	["Bullet"] = 0.00,
	["Shock"] = 0.00,
	["Burn"] = -0.10,
	["Radiation"] = 0.00,
	["Chemical"] = -0.10,
	["Psi"] = 0.00,
}