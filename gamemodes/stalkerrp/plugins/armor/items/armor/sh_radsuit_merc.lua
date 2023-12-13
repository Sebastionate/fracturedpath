ITEM.name = "Mercenary TB-3 Exosuit"
ITEM.model ="models/kek1ch/exolight_outfit.mdl"
ITEM.replacements ="models/nasca/stalker/male_exo_merc.mdl"
ITEM.description= "A set of TB-3 heavy armor."
ITEM.longdesc = "An experimental military suit that was never mass-produced due to extraordinary cost and some design flaws. Despite this, it is in demand due to its excellent protective qualities, and therefore small batches are made in underground facilities outside Ukraine on commission of the Mercenaries. This armor is given primarily to Mercenary commandos and coordinators.\n\nBallistic Protection:\nSkull: IV\nNeck & Face: IIIA\nTorso: V\nLimbs: III+\nWeight: 4"
ITEM.width = 3
ITEM.height = 3
ITEM.price = 215000
ITEM.flag = "A"
ITEM.br = 0.6
ITEM.fbr = 11
ITEM.ar = 0.2
ITEM.far = 3
ITEM.isGasmask = true
ITEM.isHelmet = false
ITEM.isArmor = true
ITEM.overlayPath = "vgui/overlays/hud_merc"
ITEM.img = Material("vgui/hud/xm40.png")
ITEM.noBusiness = true
ITEM.artifactcontainers = {"2"}
ITEM.weight = 28
ITEM.maxArmor = 40
ITEM.res = {
	["Bullet"] = 0.8,
	["Blast"] = 0.8,
	["Fall"] = 0.8,
	["Burn"] = 0.4,
	["Radiation"] = 0.6,
	["Chemical"] = 0.3,
	["Shock"] = 0.3,
	["Psi"] = 0.0,
}

ITEM.newSkin = 0
ITEM.bodyGroups = {
	["Servomotors"] = 1,
}