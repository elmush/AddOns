-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka

local addon = select(1,...)
local E, L, V, P, G,_ = unpack(ElvUI)
local XS = E:NewModule('ExtraSkins','AceTimer-3.0','AceEvent-3.0')
local S = E:GetModule('Skins')
local LSM = LibStub("LibSharedMedia-3.0");

XS.LSM = LSM
XS.skins = {}
XS.embeds = {}
XS.events = {}
XS.register = {}
XS.ccolor = E.myclass

XS.sle = IsAddOnLoaded("ElvUI_SLE")

XS.Version = GetAddOnMetadata(addon,"Version")

E.PopupDialogs["OLD_SKIN_PACKAGE"] = {
	text = "You have one of the old skin addons installed.  This addon replaces and will conflict with it.  Press accept to disable the old addon and reload your UI.",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() DisableAddOn("Tukui_UIPackages_Skins"); ReloadUI() end,
	timeout = 0,
	whileDead = 1,
}

local function GenerateEventFunction(event)
	local eventHandler = function(self,event)
		for skin,funcs in pairs(self.skins) do
			if XS:CheckOption(skin) and self.events[event][skin] then
				for func,_ in pairs(funcs) do
					func(f,event)
				end
			end
		end
	end
	return eventHandler
end

function XS:Initialize()
	if self.frame then return end -- In case this gets called twice as can sometimes happen with ElvUI

	if (E.myname == 'Sortokk' or E.myname == 'Sagome' or E.myname == 'Norinael' or E.myname == 'Pornix' or E.myname == 'Hioxy' or E.myname == 'Gorbilix') and E.myrealm == 'Emerald Dream' then
		E.db.skins['SortSettings'] = true
	end
	if IsAddOnLoaded("Tukui_UIPackages_Skins") or IsAddOnLoaded("Tukui_ElvUI_Skins") then E:StaticPopup_Show("OLD_SKIN_PACKAGE") end
	self.font = E["media"].normFont
	self.pixelFont = LSM:Fetch("font","ElvUI Pixel")
	self.datatext_font = LSM:Fetch("font",E.db.datatexts.font)

	self:GenerateOptions()

	self:RegisterEvent("PET_BATTLE_CLOSE", 'AddNonPetBattleFrames')
	self:RegisterEvent('PET_BATTLE_OPENING_START', "RemoveNonPetBattleFrames")
	self:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
	self:RegisterEvent('PLAYER_ENTER_COMBAT','EmbedEnterCombat')
	self:RegisterEvent('PLAYER_REGEN_ENABLED','EmbedExitComat')
	
	for skin,alldata in pairs(self.register) do
		for _,data in pairs(alldata) do
			self:RegisterSkin(skin,data.func,data.events)
		end
	end

	for skin,funcs in pairs(XS.skins) do
		if XS:CheckOption(skin) then
			for func,_ in pairs(funcs) do
				func(f,"PLAYER_ENTERING_WORLD")
			end
		end
	end
end

function XS:RegisterSkin(skinName,func,events)
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][func] = true
	for event,_ in pairs(events) do
    	if not self.events[event] then
			self[event] = GenerateEventFunction(event)
			self:RegisterEvent(event); 
			self.events[event] = {} 
		end
		self.events[event][skinName] = true
	end
end

function XS:UnregisterEvent(skinName,event)
	if not self.events[event] then return end
	if not self.events[event][skinName] then return end

	self.events[event][skinName] = nil
	local found = false
	for skin,_ in pairs(self.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		self:UnregisterEvent(event)
	end
end

function XS:SkinButton(button,strip)
	S:HandleButton(button,strip)
end

function XS:SkinScrollBar(bar)
	S:HandleScrollBar(bar)
end

function XS:SkinTab(tab)
	S:HandleTab(tab)
end

function XS:SkinNextPrevButton(button,horizontal)
	S:HandleNextPrevButton(button,horizontal)
end

function XS:SkinRotateButton(button)
	S:HandleRotateButton(button)
end

function XS:SkinEditBox(editBox)
	S:HandleEditBox(editBox)
end

function XS:SkinDropDownBox(box, width)
	S:HandleDropDownBox(box, width)
end

function XS:SkinCheckBox(checkBox)
	S:HandleCheckBox(checkBox)
end

function XS:SkinCloseButton(button)
	S:HandleCloseButton(button)
end

function XS:SkinSliderFrame(frame, height)
	S:HandleSliderFrame(frame, height)
end

function XS:RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		XS.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function XS:SkinFrame(frame)
	frame:StripTextures(true)
	frame:SetTemplate("Transparent")
	self:RegisterForPetBattleHide(frame)
end

function XS:SkinBackdropFrame(frame)
	frame:StripTextures(true)
	frame:CreateBackdrop("Transparent")
	self:RegisterForPetBattleHide(frame)
end

function XS:SkinFrameD(frame)
	frame:StripTextures(true)
	frame:SetTemplate("Default")
	self:RegisterForPetBattleHide(frame)
end

function XS:SkinStatusBar(bar)
	frame:StripTextures(true)
	frame:CreateBackdrop()
	frame:SetStatusBarTexture(E["media"].normTex)
end

function XS:SkinCCStatusBar(bar)
	frame:StripTextures(true)
	frame:CreateBackdrop("ClassColor")
	frame:SetStatusBarTexture(E["media"].normTex)
	local color = RAID_CLASS_COLORS[XS.ccolor]
	frame:SetStatusBarColor(color.r, color.g, color.b)
end

function XS:Desaturate(f, point)
	for i=1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)

			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end

	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

function XS:CheckOption(optionName,...)
	for i = 1,select('#',...) do
		local addon = select(i,...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	
	return E.db.skins[optionName]
end

function XS:DisableOption(optionName)
	E.db.skins[optionName] = false
end

function XS:EnableOption(optionName)
	E.db.skins[optionName] = true
end

function XS:ToggleOption(optionName)
	E.db.skins[optionName] = not E.db.skins[optionName]
end

function XS:RegisterSkin(skinName,skinFunc,...)
	local events = {}
	for i = 1,select('#',...) do
		local event = select(i,...)
		if not event then break end
		events[event] = true
	end
	local registerMe = { func = skinFunc, events = events }
	if not self.register[skinName] then self.register[skinName] = {} end
	self.register[skinName][skinFunc] = registerMe
end

function XS:AddNonPetBattleFrames()
	for frame,data in pairs(U.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function XS:RemoveNonPetBattleFrames()
	for frame,data in pairs(U.FrameLocks) do
		if(_G[frame]:IsVisible()) then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

E:RegisterModule(XS:GetName())
