ITEM.name = "TB-3 Heavy Armor"
ITEM.model = "models/kek1ch/exolight_outfit.mdl"
ITEM.replacements = "models/nasca/stalker/male_exo_lone.mdl"
ITEM.description = "A set of TB-3 heavy armor."
ITEM.longdesc = "The base component of many third-generation exoskeletons, this suit consists of an integrated tactical helmet, a heavy armored vest and a reinforced environmental jumpsuit. While mistakenly referred to as a radiation suit, this outfit actually eschews most environmental protection in favor of raw combat potential. It is used by many veteran stalkers in the most dangerous parts of the Zone.\n\nBallistic Protection:\nSkull: IV\nNeck & Face: IIIA\nTorso: V\nLimbs: III\nWeight: 4"
ITEM.width = 3
ITEM.height = 3
ITEM.price = 175000
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
ITEM.artifactcontainers = {"2"}
ITEM.noBusiness = true
ITEM.weight = 26
ITEM.maxArmor = 40
ITEM.res = {
	["Bullet"] = 0.8,
	["Blast"] = 0.8,
	["Fall"] = 0.8,
	["Burn"] = 0.4,
	["Radiation"] = 0.4,
	["Chemical"] = 0.4,
	["Shock"] = 0.2,
	["Psi"] = 0.0,
}

ITEM.newSkin = 0
ITEM.bodyGroups = {
	["Servomotors"] = 1,
}