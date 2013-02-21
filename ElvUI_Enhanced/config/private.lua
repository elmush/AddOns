local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore

--Locked Settings, These settings are stored for your character only regardless of profile options.

V.general.pvpautorelease = true
V.general.autorepchange = true

V.general.minimap.skinButtons = true
V.general.minimap.skinStyle = 'HORIZONTAL'
V.general.minimap.buttonSize = 28
V.general.minimap.mouseover = false

V.equipment = {
	['specialization'] = {
		['enable'] = false,
	},
	['battleground'] = {
		['enable'] = false,
	},
	['primary'] = 'none',
	['secondary'] = 'none',
	['equipmentset'] = 'none',
	['durability'] = {
		enable = true,
		onlydamaged = false,
	}
}

V.farmer = {
	['enabled'] = true,
	['farmbars'] = {
		['enable'] = true,
		['onlyactive'] = true,
		['droptools'] = true,
		['seedbardirection'] = 'VERTICAL',
	}
}
