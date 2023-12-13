ITEM.name = "Duty TB-3 Battlesuit"
ITEM.model ="models/kek1ch/exolight_outfit.mdl"
ITEM.replacements ="models/nasca/stalker/male_exo_duty.mdl"
ITEM.description= "A set of TB-3 heavy armor."
ITEM.longdesc = "This suit of armor was originally created for military use but never entered mass production due to prohibitive costs and design problems. Nonetheless, Duty makes use of it due to its excellent protective qualities in combat. Faction technicians have modified the suit, sacrificing space for artifacts in favor of even heavier armor.\n\nBallistic Protection:\nSkull: IV\nNeck & Face: III\nTorso: V\nLimbs: III+\nWeight: 4"
ITEM.width = 2
ITEM.height = 4
ITEM.price = 230
ITEM.flag = "A"
ITEM.br = 0.6
ITEM.fbr = 11
ITEM.ar = 0.2
ITEM.far = 3
ITEM.isGasmask = true
ITEM.isHelmet = false
ITEM.isArmor = true
ITEM.artifactcontainers = {"0"}
ITEM.overlayPath = "vgui/overlays/hud_merc"
ITEM.img = Material("vgui/hud/xm40.png")
ITEM.noBusiness = true
ITEM.weight = 30
ITEM.maxArmor = 50
ITEM.res = {
	["Bullet"] = 0.9,
	["Blast"] = 0.9,
	["Fall"] = 0.9,
	["Burn"] = 0.4,
	["Radiation"] = 0.5,
	["Chemical"] = 0.2,
	["Shock"] = 0.1,
	["Psi"] = 0.2,
}

ITEM.newSkin = 0
ITEM.bodyGroups = {
	["servomotors"] = 1,
}