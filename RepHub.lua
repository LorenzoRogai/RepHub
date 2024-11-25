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
local RepHubFrameShown,
        RepHubFrame,
        RepHubFactionDetailFrameShown,
        RepHubTable,
        filterValue,
        SORT_ASC,
        SORT_DESC,
        pendingUpdateFactionEvent,
        updateFactionEventInterval,
        reputationListCollapsedState = false, nil, nil, nil, nil, 1, 2, false, 10, nil

local reputationLabels = {
    [-42000] = "Hated",
    [-6000] = "Hostile",
    [-3000] = "Unfriendly",
    [0] = "Neutral",
    [3000] = "Friendly",
    [9000] = "Honored",
    [21000] = "Revered",
    [42000] = "Exalted",
}

local reputationLabelsColors = {
    ["Hated"] = { r = 0.67, g = 0.11, b = 0.11 },
    ["Hostile"] = { r = 0.67, g = 0, b = 0 },
    ["Unfriendly"] = { r = 0.67, g = 0.29, b = 0.09 },
    ["Neutral"] = { r = 0.67, g = 0.67, b = 0 },
    ["Friendly"] = { r = 0, g = 0.67, b = 0 },
    ["Honored"] = { r = 0, g = 0.67, b = 0.36 },
    ["Revered"] = { r = 0, g = 0.67, b = 0.54 },
    ["Exalted"] = { r = 0, g = 0.67, b = 0.67 },
}

local classesColor = {
    ["DEATHKNIGHT"] = { r = 0.77, g = 0.12, b = 0.23 },
    ["DEMONHUNTER"] = { r = 0.64, g = 0.19, b = 0.79 },
    ["DRUID"] = { r = 1.00, g = 0.49, b = 0.04 },
    ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45 },
    ["MAGE"] = { r = 0.41, g = 0.80, b = 0.94 },
    ["MONK"] = { r = 0.00, g = 1.00, b = 0.59 },
    ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73 },
    ["PRIEST"] = { r = 1.00, g = 1.00, b = 1.00 },
    ["ROGUE"] = { r = 1.00, g = 0.96, b = 0.41 },
    ["SHAMAN"] = { r = 0.00, g = 0.44, b = 0.87 },
    ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79 },
    ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43 },
    ["EVOKER"] = { r = 0.20, g = 0.58, b = 0.50 },
}

local groupsIcons = {
    ["Classic"] = "Interface\\Addons\\RepHub\\Icons\\Classic",
    ["The Burning Crusade"] = "Interface\\Addons\\RepHub\\Icons\\TheBurningCrusade",
    ["Wrath of the Lich King"] = "Interface\\Addons\\RepHub\\Icons\\WrathOfTheLichKing",
    ["Cataclysm"] = "Interface\\Addons\\RepHub\\Icons\\Cataclysm",
    ["Mists of Pandaria"] = "Interface\\Addons\\RepHub\\Icons\\MistsOfPandaria",
    ["Warlords of Draenor"] = "Interface\\Addons\\RepHub\\Icons\\WarlordsOfDraenor",
    ["Legion"] = "Interface\\Addons\\RepHub\\Icons\\Legion",
    ["Battle for Azeroth"] = "Interface\\Addons\\RepHub\\Icons\\BattleForAzeroth",
    ["Shadowlands"] = "Interface\\Addons\\RepHub\\Icons\\Shadowlands",
    ["Dragonflight"] = "Interface\\Addons\\RepHub\\Icons\\Dragonflight",
    ["The War Within"] = "Interface\\Addons\\RepHub\\Icons\\TheWarWithin"
}

function RepHub:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("RepHubDB", {
        profile = {
            minimap = {
                hide = false,
            },
        },
        global = {
            characterNames = {},
            characterClasses = {},
            reputationList = {},
        },
    })
    LibDBIcon:Register("RepHub", LibDataBroker, self.db.profile.minimap)
    RepHub:RegisterChatCommand("rephub", "HandleCommand")
end

function RepHub:OnEnable()
    RepHub:CheckDB()
    RepHub:RefreshReputationGlobalDB()

    if RepHubFrame == nil then
        RepHub:CreateRepHubFrame()
    end
end

-- Database

function RepHub:CheckDB()
    local needReset = false
    local needResetReasons = {}

    if tContains(self.db.global.characterNames, UnitName("player")) then
        needReset = true
        table.insert(needResetReasons, "Realm name should be considered")
    end

    if needReset then
        local needResetFrame = AceGUI:Create("Frame")
        needResetFrame:SetTitle("RepHub")
        needResetFrame:SetStatusText("RepHub is a simple account-wide reputation tracker")
        needResetFrame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
        needResetFrame:SetWidth(250)
        needResetFrame:SetHeight(175)
        needResetFrame:EnableResize(false) -- We also need this to remove the resize icon in the bottom right corner
        needResetFrame.frame:SetMovable(false)
        needResetFrame.frame:SetResizable(false)

        local needResetLabel = AceGUI:Create("Label")
        needResetLabel:SetFullWidth(true)
        needResetLabel:SetText("Your RepHub database needs to be reset for these reasons:\n\n- " .. table.concat(needResetReasons, "\n- ") .. "\n\nClick the button below to reset it\nSorry for the inconvenience\n\n")
        needResetFrame:AddChild(needResetLabel)

        local needResetButton = AceGUI:Create("Button")
        needResetButton:SetFullWidth(true)
        needResetButton:SetText("Reset DB")
        needResetButton:SetCallback("OnClick", function() RepHub:ResetDB() end)
        needResetFrame:AddChild(needResetButton)

        needResetFrame:Show()
    end
end

function RepHub:RefreshReputationGlobalDB()
    local characterName = UnitName("player") .. " - " .. GetRealmName()

    if not tContains(self.db.global.characterNames, characterName) then
        table.insert(self.db.global.characterNames, characterName)
    end

    local characterClass = select(2, UnitClass("player"))
    self.db.global.characterClasses[characterName] = characterClass

    RepHub:HandleReputationListCollapsedState()

    local currentGroup = nil

    local numFactions = C_Reputation.GetNumFactions()
    local factionIndex = 1
    while (factionIndex <= numFactions) do
        local factionData = C_Reputation.GetFactionDataByIndex(factionIndex)
        if factionData.isHeader then
            if not factionData.isHeaderWithRep then
                currentGroup = factionData.name
            end

            if factionData.isCollapsed then -- C_Reputation.ExpandAllFactionHeaders() doesn't work correctly, use this workaround instead
                C_Reputation.ExpandFactionHeader(factionIndex)
                numFactions = C_Reputation.GetNumFactions()
            end
        end

        if not self.db.global.reputationList[factionData.factionID] then
            self.db.global.reputationList[factionData.factionID] = {
                ["name"] = factionData.name,
                ["currentGroup"] = currentGroup,
                ["isHeader"] = factionData.isHeader,
                ["isHeaderWithRep"] = factionData.isHeaderWithRep,
                ["isAccountWide"] = factionData.isAccountWide,
                ["standings"] = {}
            }
        end

        self.db.global.reputationList[factionData.factionID].standings[characterName] = factionData.currentStanding

        factionIndex = factionIndex + 1
    end

    RepHub:HandleReputationListCollapsedState(true)
end

function RepHub:ResetDB()
    self.db:ResetDB()
    ReloadUI()
end

-- Commands

function RepHub:HandleCommand(input)
    if input == "resetdb" then
        RepHub:ResetDB()
    end
end

-- Utils

function RepHub:GetTableLength(table)
    local count = 0
    for _, __ in pairs(table) do count = count + 1 end
    return count
end

function RepHub:FindHighestStanding(standingsTable)
    local highestStanding = nil
    local highestStandingCharacterName = nil
    for characterName, standing in pairs(standingsTable) do
        if highestStanding == nil or standing > highestStanding then
            highestStanding = standing
            highestStandingCharacterName = characterName
        end
    end
    return highestStanding, highestStandingCharacterName
end

function RepHub:FilterFunction(row)
    local showRow = false
    for _, columnValue in pairs(row.cols) do
        if string.find(string.lower(columnValue.value), string.lower(filterValue)) then
            showRow = true
            break
        end
    end
    return showRow
end

function RepHub:GetFactionDataByName(factionName)
    local factionDataResult = nil
    table.foreach(
        self.db.global.reputationList,
        function(factionID, factionData)
            if factionData.name == factionName then
                factionDataResult = factionData
            end
        end
    )
    return factionDataResult
end

function RepHub:HighestStandingSort(libSt, rowa, rowb, column)
    local cellaValue, cellbValue = libSt:GetCell(rowa, column).value, libSt:GetCell(rowb, column).value

    local cellaBracketPosition = cellaValue:find("(", 1, true)
    if cellaBracketPosition then
        cellaValue = tonumber(cellaValue:sub(1, cellaBracketPosition - 2))
    else
        cellaValue = -50000
    end

    local cellbBracketPosition = cellbValue:find("(", 1, true)
    if cellbBracketPosition then
        cellbValue = tonumber(cellbValue:sub(1, cellbBracketPosition - 2))
    else
        cellbValue = -50000
    end

    if libSt.cols[column].sort == SORT_ASC then
        return cellaValue < cellbValue
    else
        return cellaValue > cellbValue
    end
end

function RepHub:GetReputationLabel(standing)
    local reputationLabelResult = nil
    local sortedKeys = {}
    
    for reputationValue, _ in pairs(reputationLabels) do
        table.insert(sortedKeys, reputationValue)
    end
    
    table.sort(sortedKeys)

    for _, reputationValue in ipairs(sortedKeys) do
        if standing >= reputationValue then
            reputationLabelResult = reputationLabels[reputationValue]
        end
    end
    
    return reputationLabelResult
end

function RepHub:GetRepHubTableData()
    local dataArr = {}

    table.foreach(
        self.db.global.reputationList,
        function(factionID, factionData)
            if not factionData.isHeader or (factionData.isHeader and factionData.isHeaderWithRep) then
                local highestStandingText,
                    highestStandingTextColor,
                    highestStandingCharacterNameText,
                    highestStandingCharacterNameTextColor,
                    charCountText = "", nil, "", nil, ""
                if factionData.isAccountWide then
                    highestStandingText, charCountText = "--", "--"
                    highestStandingCharacterNameText = "Account-wide"
                    highestStandingTextColor = { r = 1.0, g = 1.0, b = 1.0 }
                    highestStandingCharacterNameTextColor = { r = 1.0, g = 1.0, b = 1.0 }
                else
                    highestStandingText, highestStandingCharacterNameText = RepHub:FindHighestStanding(factionData.standings)
                    local reputationLabel = RepHub:GetReputationLabel(highestStandingText)
                    highestStandingText = highestStandingText .. " (" .. reputationLabel .. ")"
                    charCountText = RepHub:GetTableLength(factionData.standings)
                    highestStandingTextColor = reputationLabelsColors[reputationLabel]
                    highestStandingCharacterNameTextColor = classesColor[self.db.global.characterClasses[highestStandingCharacterNameText]]
                end

                local currentGroupText = factionData.currentGroup
                local currentGroupIcon = groupsIcons[currentGroupText] or nil

                if currentGroupIcon then
                    local currentGroupIcon = string.format("\124T%s:%d\124t", currentGroupIcon, 25)
                    currentGroupText = currentGroupIcon .. " " .. currentGroupText
                end

                table.insert(dataArr, {
                    ["cols"] = {
                        { ["value"] = factionData.name },
                        { ["value"] = currentGroupText },
                        { ["value"] = highestStandingText, ["color"] = highestStandingTextColor },
                        { ["value"] = highestStandingCharacterNameText, ["color"] = highestStandingCharacterNameTextColor },
                        { ["value"] = charCountText }
                    }
                })
            end
        end
    )

    return dataArr
end

function RepHub:HandleReputationListCollapsedState(restoreState)
    if not restoreState then
        reputationListCollapsedState = {}
    end

    local numFactions = C_Reputation.GetNumFactions()
    local factionIndex = 1
    while (factionIndex <= numFactions) do
        local factionData = C_Reputation.GetFactionDataByIndex(factionIndex)
        if factionData.isHeader then
            if not restoreState and factionData.isCollapsed then
                reputationListCollapsedState[factionData.factionID] = true
            elseif restoreState and reputationListCollapsedState[factionData.factionID] then
                C_Reputation.CollapseFactionHeader(factionIndex)
            end
        end

        factionIndex = factionIndex + 1
    end
end

-- GUI

function RepHub:CreateRepHubFrame()
    RepHubFrame = AceGUI:Create("Frame")
    RepHubFrame:SetTitle("RepHub")
    RepHubFrame:SetStatusText("RepHub is a simple account-wide reputation tracker")
    RepHubFrame:EnableResize(false) -- We also need this to remove the resize icon in the bottom right corner
    RepHubFrame.frame:SetMovable(true)
    RepHubFrame.frame:SetResizable(false)
    RepHubFrame.frame:RegisterEvent("UPDATE_FACTION")
    RepHubFrame.frame:RegisterEvent("CVAR_UPDATE")
    RepHubFrame.frame:SetScript(
        "OnEvent",
        function(self, event, ...)
            if event == "UPDATE_FACTION" then
                pendingUpdateFactionEvent = true
            elseif event == "CVAR_UPDATE" then
                local cvarName = select(1, ...)
                if cvarName == "reputationsCollapsed" then -- Prevent UPDATE_FACTION event from triggering on reputation list manual collapse/expand
                    pendingUpdateFactionEvent = false
                end
            end
        end
    )
    C_Timer.NewTicker(
        updateFactionEventInterval,
        function()
            if pendingUpdateFactionEvent then
                RepHub:RefreshReputationGlobalDB()
                RepHubTable:SetData(RepHub:GetRepHubTableData())
                pendingUpdateFactionEvent = false
            end
        end
    )
    RepHubFrame:SetCallback(
        "OnClose",
        function(widget)
            RepHub:HideRepHubFrame()
        end
    )
    
    local StatsLabel = AceGUI:Create("Label")
    StatsLabel:SetFullWidth(true)
    StatsLabel:SetText("Total reputations: " .. RepHub:GetTableLength(self.db.global.reputationList)  .. " | Total characters: " .. #self.db.global.characterNames)
    RepHubFrame:AddChild(StatsLabel)

    local SearchBox = AceGUI:Create("EditBox")
    SearchBox:SetFullWidth(true)
    SearchBox:SetLabel("Search:")
    SearchBox:SetCallback(
        "OnEnterPressed",
        function(widget, event, text)
            filterValue = text
            RepHubTable:SetFilter(RepHub.FilterFunction)
        end
    )
    RepHubFrame:AddChild(SearchBox)

    local columnsArr = {
        { ["name"] = "Reputation Name", ["width"] = 155, },
        { ["name"] = "Group", ["width"] = 140, },
        {
            ["name"] = "Highest Standing", ["width"] = 105, ["sort"] = "asc", ["comparesort"] = function (libSt, rowa, rowb, column)
                return RepHub:HighestStandingSort(libSt, rowa, rowb, column)
            end
        },
        { ["name"] = "H. S. Char Name", ["width"] = 155, },
        { ["name"] = "Char Count", ["width"] = 65, },
    }

    local RepHubTableGroup = AceGUI:Create("SimpleGroup")
    RepHubTableGroup:SetFullWidth(true)
    RepHubTableGroup:SetHeight(390)
    RepHubTableGroup:SetLayout("Fill")

    local ScrollingTable = LibStub("ScrollingTable")
    RepHubTable = ScrollingTable:CreateST(columnsArr, 23, nil, nil, RepHubTableGroup.frame)
    RepHubTable:SetData(RepHub:GetRepHubTableData())
    RepHubTable:RegisterEvents({
        ["OnClick"] = function (rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            if realrow then
                local rowdata = RepHubTable:GetRow(realrow)
                local factionName = RepHubTable:GetCell(rowdata, 1).value
                RepHub:ShowFactionDetailFrame(factionName)
            end
        end,
    })

    RepHubFrame:AddChild(RepHubTableGroup)

    RepHubFrame.frame:Hide()
end

function RepHub:ShowFactionDetailFrame(factionName)
    if RepHubFactionDetailFrameShown then
        print("RepHub: Close the current faction detail first")
        return
    end

    local factionData = RepHub:GetFactionDataByName(factionName)

    if factionData.isAccountWide then
        return
    end

    local factionDetailFrame = AceGUI:Create("Frame")
    factionDetailFrame:SetTitle(factionName)
    factionDetailFrame:SetStatusText("Char Count: " .. RepHub:GetTableLength(factionData.standings))
    factionDetailFrame:SetCallback(
        "OnClose",
        function(widget)
            AceGUI:Release(widget)
            RepHubFactionDetailFrameShown = false
        end
    )
    factionDetailFrame:SetWidth(250)
    factionDetailFrame:SetHeight(175)
    factionDetailFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 100, -100)
    factionDetailFrame:EnableResize(false) -- We also need this to remove the resize icon in the bottom right corner
    factionDetailFrame.frame:SetMovable(false)
    factionDetailFrame.frame:SetResizable(false)

    local factionDetailText = ""

    local sortedStandings = {}
    table.foreach(
        factionData.standings,
        function(characterName, standing)
            table.insert(sortedStandings, { ["characterName"] = characterName, ["standing"] = standing })
        end
    )

    table.sort(sortedStandings, function(a, b) return a.standing > b.standing end)

    table.foreach(
        sortedStandings,
        function(_, sortedStanding)
            factionDetailText = factionDetailText .. sortedStanding.characterName .. ": " .. sortedStanding.standing .. " (" .. RepHub:GetReputationLabel(sortedStanding.standing) .. ")\n"
        end
    )
    
    local factionDetailScrollFrame = AceGUI:Create("ScrollFrame")
    factionDetailScrollFrame:SetFullWidth(true)
    factionDetailScrollFrame:SetFullHeight(true)

    local factionDetailLabel = AceGUI:Create("Label")
    factionDetailLabel:SetFullWidth(true)
    factionDetailLabel:SetText(factionDetailText)
    factionDetailScrollFrame:AddChild(factionDetailLabel)
    
    factionDetailFrame:AddChild(factionDetailScrollFrame)

    factionDetailFrame:Show()
    RepHubFactionDetailFrameShown = true
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
