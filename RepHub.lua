local RepHub = LibStub("AceAddon-3.0"):NewAddon("RepHub")
local AceGUI = LibStub("AceGUI-3.0")
local LibDataBroker = LibStub("LibDataBroker-1.1"):NewDataObject("RepHub", {
    type = "data source",
    text = "RepHub",
    icon = "Interface\\Icons\\Achievement_Reputation_01",
    OnTooltipShow = function(tooltip)
        tooltip:AddLine("Click to show RepHub")
    end,
    OnClick = function()
        RepHub:ShowRepHubFrame()
    end,
})
local LibDBIcon = LibStub("LibDBIcon-1.0")
local RepHubFrameShown = false

function RepHub:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("RepHubDB", {
        profile = {
            minimap = {
                hide = false,
            },
        },
        global = {
            ReputationList = {},
        },
    })
    LibDBIcon:Register("RepHub", LibDataBroker, self.db.profile.minimap)
end

function RepHub:OnEnable()
    RepHub:RefreshReputationGlobalDB()
end

function RepHub:RefreshReputationGlobalDB()
    local characterName = UnitName("player")

    local currentGroup = nil

    local numFactions = C_Reputation.GetNumFactions()
    local factionIndex = 1
    while (factionIndex <= numFactions) do
        local factionData = C_Reputation.GetFactionDataByIndex(factionIndex)
        if factionData.isHeader then
            currentGroup = factionData.name

            if factionData.isCollapsed then
                C_Reputation.ExpandFactionHeader(factionIndex)
                numFactions = C_Reputation.GetNumFactions()
            end
        end
        if self.db.global.ReputationList[factionData.factionID] == nil then
            self.db.global.ReputationList[factionData.factionID] = factionData
            self.db.global.ReputationList[factionData.factionID].currentGroup = currentGroup
            self.db.global.ReputationList[factionData.factionID].highestStanding = factionData.currentStanding
            self.db.global.ReputationList[factionData.factionID].highestStandingCharacterName = characterName
        elseif self.db.global.ReputationList[factionData.factionID].highestStanding < factionData.currentStanding and not factionData.isAccountWide then
            self.db.global.ReputationList[factionData.factionID].highestStanding = factionData.currentStanding
            self.db.global.ReputationList[factionData.factionID].highestStandingCharacterName = characterName
        end
        factionIndex = factionIndex + 1
    end
end

function RepHub:ShowRepHubFrame()
    if RepHubFrameShown then
        return
    end

    local RepHubFrame = AceGUI:Create("Frame")
    RepHubFrame:SetTitle("RepHub")
    RepHubFrame:SetStatusText("RepHub is a simple account-wide reputation tracker")
    RepHubFrame:SetCallback(
        "OnClose",
        function(widget)
            AceGUI:Release(widget)
            RepHubFrameShown = false
        end
    )

    local columnsArr = {
        { ["name"] = "Rep Name", ["width"] = 205, },
        { ["name"] = "Group", ["width"] = 205, },
        { ["name"] = "Highest Standing", ["width"] = 205, },
    }
    local dataArr = {}

    local characterName = UnitName("player")

    table.foreach(
        self.db.global.ReputationList,
        function(factionID, factionData)
            if not factionData.isHeader then
                local highestStandingText = ""
                if factionData.isAccountWide then
                    highestStandingText = "Account-wide"
                else
                    highestStandingText = factionData.highestStanding .. " (" .. factionData.highestStandingCharacterName .. ")"
                end
                table.insert(dataArr, {factionData.name, factionData.currentGroup, highestStandingText })
            end
        end
    )

    local ScrollingTable = LibStub("ScrollingTable")
    local RepHubTable = ScrollingTable:CreateST(columnsArr, 27, nil, nil, RepHubFrame.frame)
    RepHubTable:SetData(dataArr, true)

    RepHubFrameShown = true
end