if not IsAddOnLoaded("ElvUI") then return end
if not IsAddOnLoaded("BigWigs") then return end
local SkinBigWigs = CreateFrame("Frame")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	SkinBigWigs:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinBigWigs:SetScript("OnEvent", function(self)
	if (UISkinOptions.BigWigsSkin == "Disabled") then return end

local buttonsize = 19

-- init some tables to store backgrounds
local freebg = {}

-- styling functions
local createbg = function()
	local bg = CreateFrame("Frame")
	bg:SetTemplate("Transparent")
	return bg
end

local function freestyle(bar)
	-- reparent and hide bar background
	local bg = bar:Get("bigwigs:elvui:barbg")
	if bg then
		bg:ClearAllPoints()
		bg:SetParent(c.UIParent)
		bg:Hide()
		freebg[#freebg + 1] = bg
	end

	-- reparent and hide icon background
	local ibg = bar:Get("bigwigs:elvui:iconbg")
	if ibg then
		ibg:ClearAllPoints()
		ibg:SetParent(c.UIParent)
		ibg:Hide()
		freebg[#freebg + 1] = ibg
	end

	-- replace dummies with original method functions
	bar.candyBarBar.SetPoint=bar.candyBarBar.OldSetPoint
	bar.candyBarIconFrame.SetWidth=bar.candyBarIconFrame.OldSetWidth
	bar.SetScale=bar.OldSetScale
	
	--Reset Positions
	--Icon
	bar.candyBarIconFrame:ClearAllPoints()
	bar.candyBarIconFrame:SetPoint("TOPLEFT")
	bar.candyBarIconFrame:SetPoint("BOTTOMLEFT")
	bar.candyBarIconFrame:SetTexCoord(0.07, 0.93, 0.07, 0.93)
	
	--Status Bar
	bar.candyBarBar:ClearAllPoints()
	bar.candyBarBar:SetPoint("TOPRIGHT")
	bar.candyBarBar:SetPoint("BOTTOMRIGHT")
	
	--BG
	bar.candyBarBackground:SetAllPoints()
	
	--Duration
	bar.candyBarDuration:ClearAllPoints()
	bar.candyBarDuration:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 0)
	
	--Name
	bar.candyBarLabel:ClearAllPoints()
	bar.candyBarLabel:SetPoint("LEFT", bar.candyBarBar, "LEFT", 2, 0)
	bar.candyBarLabel:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 0)	
end

local applystyle = function(bar)

	-- general bar settings
	bar.OldHeight = bar:GetHeight()
	bar.OldScale = bar:GetScale()
	bar.OldSetScale=bar.SetScale
	bar.SetScale=c.noop
	bar:Height(buttonsize)
	bar:SetScale(1)
	
	-- create or reparent and use bar background
	local bg = nil
	if #freebg > 0 then
		bg = table.remove(freebg)
	else
		bg = createbg()
	end

	bg:SetParent(bar)
	bg:ClearAllPoints()
	bg:Point("TOPLEFT", bar, "TOPLEFT", -2, 2)
	bg:Point("BOTTOMRIGHT", bar, "BOTTOMRIGHT", 2, -2)
	bg:SetFrameStrata("BACKGROUND")
	bg:Show()
	bar:Set("bigwigs:elvui:barbg", bg)

	-- create or reparent and use icon background
	local ibg = nil
	if bar.candyBarIconFrame:GetTexture() then
		if #freebg > 0 then
			ibg = table.remove(freebg)
		else
			ibg = createbg()
		end
		ibg:SetParent(bar)
		ibg:ClearAllPoints()
		ibg:Point("TOPLEFT", bar.candyBarIconFrame, "TOPLEFT", -2, 2)
		ibg:Point("BOTTOMRIGHT", bar.candyBarIconFrame, "BOTTOMRIGHT", 2, -2)
		ibg:SetFrameStrata("BACKGROUND")
		ibg:Show()
		bar:Set("bigwigs:elvui:iconbg", ibg)
	end

	-- setup timer and bar name fonts and positions
	bar.candyBarLabel:FontTemplate(nil, nil, 'OUTLINE')
	bar.candyBarLabel:SetJustifyH("LEFT")
	bar.candyBarLabel:ClearAllPoints()
	bar.candyBarLabel:Point("LEFT", bar, "LEFT", 4, 0)

	bar.candyBarDuration:FontTemplate(nil, nil, 'OUTLINE')
	bar.candyBarDuration:SetJustifyH("RIGHT")
	bar.candyBarDuration:ClearAllPoints()
	bar.candyBarDuration:Point("RIGHT", bar, "RIGHT", -4, 0)

	-- setup bar positions and look
	bar.candyBarBar.OldPoint, bar.candyBarBar.Anchor, bar.candyBarBar.OldPoint2, bar.candyBarBar.XPoint, bar.candyBarBar.YPoint  = bar.candyBarBar:GetPoint()
	bar.candyBarBar:ClearAllPoints()
	bar.candyBarBar:SetAllPoints(bar)
	bar.candyBarBar.OldSetPoint = bar.candyBarBar.SetPoint
	bar.candyBarBar.SetPoint=c.noop
	bar.candyBarBar:SetStatusBarTexture(c["media"].normTex)
	bar.candyBarBackground:SetTexture(unpack(c.media.backdropcolor))

	-- setup icon positions and other things
	bar.candyBarIconFrame.OldPoint, bar.candyBarIconFrame.Anchor, bar.candyBarIconFrame.OldPoint2, bar.candyBarIconFrame.XPoint, bar.candyBarIconFrame.YPoint  = bar.candyBarIconFrame:GetPoint()
	bar.candyBarIconFrame.OldWidth = bar.candyBarIconFrame:GetWidth()
	bar.candyBarIconFrame.OldHeight = bar.candyBarIconFrame:GetHeight()
	bar.candyBarIconFrame.OldSetWidth = bar.candyBarIconFrame.SetWidth
	bar.candyBarIconFrame.SetWidth=c.noop
	bar.candyBarIconFrame:ClearAllPoints()
	bar.candyBarIconFrame:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -5, 0)	
	bar.candyBarIconFrame:SetSize(buttonsize, buttonsize)
	bar.candyBarIconFrame:SetTexCoord(0.08, 0.92, 0.08, 0.92)
end

--[[
	BigWigs load process
	-BigWigs
	-BigWigs_Core (Global 'BigWigs' is set here)
	-BigWigs_Plugins
	
	Note to self: BigWigs_Core as an OptionalDep breaks ElvUI saved variables if BigWigs isn't loaded.
]]
local function RegisterStyle()
	if not BigWigs then return end
	local bars = BigWigs:GetPlugin("Bars", true)
	local prox = BigWigs:GetPlugin("Proximity", true)
	if bars then
	bars:RegisterBarStyle("ElvUI", {
		apiVersion = 1,
		version = 1,
		GetSpacing = function(bar) return buttonsize end,
		ApplyStyle = applystyle,
		BarStopped = freestyle,
		GetStyleName = function() return "ElvUI" end,
	})
	end
	hooksecurefunc(BigWigs.pluginCore.modules.Proximity, "RestyleWindow", function() BigWigsProximityAnchor:SetTemplate("Transparent") end)
end

s:RegisterSkin('BigWigs_Plugins', RegisterStyle, nil, true)
end)