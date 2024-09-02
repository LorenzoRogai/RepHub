local RepHub = LibStub("AceAddon-3.0"):NewAddon("RepHub", "AceConsole-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local LibDataBroker = LibStub("LibDataBroker-1.1"):NewDataObject("RepHub", {
    type = "data source",
    text = "RepHub",
    icon = "Interface\\Icons\\Achievement_Reputation_01",
    OnTooltipShow = function(tooltip)
        tooltip:AddLine("Click to show RepHub")
    end,
    OnClick = function()
        RepHub:ToggleRepHubFrame()
    end,
})
local LibDBIcon = LibStub("LibDBIcon-1.0")
local RepHubFrame = nil
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
    RepHub:RegisterChatCommand("rephub", "HandleCommand")
end

function RepHub:OnEnable()
    RepHub:RefreshReputationGlobalDB()

    if RepHubFrame == nil then
        RepHub:CreateRepHubFrame()
    end
end

function RepHub:HandleCommand(input)
    if input == "resetdb" then
        self.db.global.ReputationList = {}
        ReloadUI()
    end
end

function RepHub:RefreshReputationGlobalDB()
    local characterName = UnitName("player")

    local currentGroup = nil

    C_Reputation.ExpandAllFactionHeaders()
    local numFactions = C_Reputation.GetNumFactions()
    local factionIndex = 1
    while (factionIndex <= numFactions) do
        local factionData = C_Reputation.GetFactionDataByIndex(factionIndex)
        if factionData.isHeader then
            if not factionData.isHeaderWithRep then
                currentGroup = factionData.name
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

function RepHub:CreateRepHubFrame()
    RepHubFrame = AceGUI:Create("Frame")
    RepHubFrame:SetTitle("RepHub")
    RepHubFrame:SetStatusText("RepHub is a simple account-wide reputation tracker")
    RepHubFrame:SetCallback(
        "OnClose",
        function(widget)
            RepHub:HideRepHubFrame()
        end
    )

    local columnsArr = {
        { ["name"] = "Reputation Name", ["width"] = 155, },
        { ["name"] = "Group", ["width"] = 155, },
        { ["name"] = "Highest Standing", ["width"] = 155, },
        { ["name"] = "Highest Standing Char Name", ["width"] = 155, },
    }
    local dataArr = {}

    local characterName = UnitName("player")

    table.foreach(
        self.db.global.ReputationList,
        function(factionID, factionData)
            if not factionData.isHeader or (factionData.isHeader and factionData.isHeaderWithRep) then
                local highestStandingCharacterNameText = ""
                if factionData.isAccountWide then
                    highestStandingCharacterNameText = "Account-wide"
                else
                    highestStandingCharacterNameText = factionData.highestStandingCharacterName
                end
                table.insert(dataArr, {factionData.name, factionData.currentGroup, factionData.highestStanding, highestStandingCharacterNameText})
            end
        end
    )

    local ScrollingTable = LibStub("ScrollingTable")
    local RepHubTable = ScrollingTable:CreateST(columnsArr, 27, nil, nil, RepHubFrame.frame)
    RepHubTable:SetData(dataArr, true)

    RepHubFrame.frame:Hide()
end

function RepHub:ShowRepHubFrame()
    RepHubFrame.frame:Show()
    RepHubFrameShown = true
end

function RepHub:HideRepHubFrame()
    RepHubFrame.frame:Hide()
    RepHubFrameShown = false
end

function RepHub:ToggleRepHubFrame()
    if not RepHubFrameShown then
        RepHub:ShowRepHubFrame()
    else
        RepHub:HideRepHubFrame()
    end
end