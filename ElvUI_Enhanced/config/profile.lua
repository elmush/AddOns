﻿local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

--For some reason datatext settings refuses to work if there is no general setting block here O_o
--Core

--Unitframes
P['unitframe']['units']['target']['gps'] = {
	['enable'] = true,
	['position'] = 'BOTTOMRIGHT'
}

P['unitframe']['units']['focus']['gps']= {
	['enable'] = true,
	['position'] = 'LEFT'
}

-- Nameplates
P['nameplate'].showthreat = true

-- DataTexts
P['datatexts']['Actionbar1DataPanel'] = false
P['datatexts']['Actionbar3DataPanel'] = false
P['datatexts']['Actionbar5DataPanel'] = false

P['datatexts']['panels']['Actionbar1DataPanel'] = {
	['left'] = 'Crit Chance',
	['middle'] = 'Target Range',
	['right'] = 'Armor',
}

P['datatexts']['panels']['Actionbar3DataPanel'] = 'Spec Switch'

P['datatexts']['panels']['Actionbar5DataPanel'] = 'Call to Arms'
