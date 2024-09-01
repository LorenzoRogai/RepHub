local RepHub = LibStub("AceAddon-3.0"):NewAddon("RepHub")  
local RepHubLDB = LibStub("LibDataBroker-1.1"):NewDataObject("RepHub", {  
	type = "data source",  
	text = "RepHub",  
	icon = "Interface\\Icons\\Achievement_Reputation_01",  
    OnTooltipShow = function(tooltip)  
        tooltip:AddLine("RepHub")

        local numFactions = C_Reputation.GetNumFactions()
        local factionIndex = 1
        while (factionIndex <= numFactions) do
            local factionData = C_Reputation.GetFactionDataByIndex(factionIndex)
            if factionData.isHeader then
                tooltip:AddLine(factionData.name)
            else
                tooltip:AddLine("-- " .. factionData.name .. " - " .. factionData.currentStanding)
            end
            factionIndex = factionIndex + 1
        end
    end,
})  
local icon = LibStub("LibDBIcon-1.0")  

function RepHub:OnInitialize()
    -- Assuming you have a ## SavedVariables: RepHubDB line in your TOC
	self.db = LibStub("AceDB-3.0"):New("RepHubDB", {
		profile = {
			minimap = {
				hide = false,
			},
		},
	})
	icon:Register("RepHub", RepHubLDB, self.db.profile.minimap)
end