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
        filterValue = false, nil, nil, nil, nil

function RepHub:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("RepHubDB", {
        profile = {
            minimap = {
                hide = false,
            },
        },
        global = {
            characterNames = {},
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

function RepHub:ResetDB()
    self.db:ResetDB()
    ReloadUI()
end

function RepHub:HandleCommand(input)
    if input == "resetdb" then
        RepHub:ResetDB()
    end
end

function RepHub:GetStandingsCount(standingsTable)
    local count = 0
    for _ in pairs(standingsTable) do count = count + 1 end
    return count
end

function RepHub:FindHighestStanding(standingsTable)
    local highestStanding = nil
    local highestStandingCharacterName = nil
    for key, value in pairs(standingsTable) do
        if highestStanding == nil or value > highestStanding then
            highestStanding = value
            highestStandingCharacterName = key
        end
    end
    return highestStanding, highestStandingCharacterName
end

function RepHub:FilterFunction(row)
    local showRow = false
    for rowKey, rowValue in pairs(row) do
        if string.find(string.lower(rowValue), string.lower(filterValue)) then
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

function RepHub:RefreshReputationGlobalDB()
    local characterName = UnitName("player") .. " - " .. GetRealmName()

    if not tContains(self.db.global.characterNames, characterName) then
        table.insert(self.db.global.characterNames, characterName)
    end

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
end

function RepHub:CreateRepHubFrame()
    RepHubFrame = AceGUI:Create("Frame")
    RepHubFrame:SetTitle("RepHub")
    RepHubFrame:SetStatusText("RepHub is a simple account-wide reputation tracker")
    RepHubFrame.frame:SetMovable(true)
    RepHubFrame.frame:SetResizable(false)
    RepHubFrame:SetCallback(
        "OnClose",
        function(widget)
            RepHub:HideRepHubFrame()
        end
    )
    
    local StatsLabel = AceGUI:Create("Label")
    StatsLabel:SetFullWidth(true)
    StatsLabel:SetText("Total reputations: " .. RepHub:GetStandingsCount(self.db.global.reputationList)  .. " | Total characters: " .. #self.db.global.characterNames)
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
        { ["name"] = "Highest Standing", ["width"] = 105, ["sort"] = "asc", },
        { ["name"] = "H. S. Char Name", ["width"] = 155, },
        { ["name"] = "Char Count", ["width"] = 65, },
    }
    local dataArr = {}

    table.foreach(
        self.db.global.reputationList,
        function(factionID, factionData)
            if not factionData.isHeader or (factionData.isHeader and factionData.isHeaderWithRep) then
                local highestStandingText, highestStandingCharacterNameText, charCountText = ""
                if factionData.isAccountWide then
                    highestStandingText, charCountText = "--", "--"
                    highestStandingCharacterNameText = "Account-wide"
                else
                    highestStandingText, highestStandingCharacterNameText = RepHub:FindHighestStanding(factionData.standings)
                    charCountText = RepHub:GetStandingsCount(factionData.standings)
                end
                table.insert(dataArr, {factionData.name, factionData.currentGroup, highestStandingText, highestStandingCharacterNameText, charCountText})
            end
        end
    )

    local RepHubTableGroup = AceGUI:Create("SimpleGroup")
    RepHubTableGroup:SetFullWidth(true)
    RepHubTableGroup:SetHeight(390)
    RepHubTableGroup:SetLayout("Fill")

    local ScrollingTable = LibStub("ScrollingTable")
    RepHubTable = ScrollingTable:CreateST(columnsArr, 23, nil, nil, RepHubTableGroup.frame)
    RepHubTable:SetData(dataArr, true)
    RepHubTable:RegisterEvents({
        ["OnClick"] = function (rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            if realrow then
                local rowdata = RepHubTable:GetRow(realrow)
                local factionName = RepHubTable:GetCell(rowdata, 1)
                RepHub:ShowFactionDetailFrame(factionName)
            end
        end,
    });

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
    factionDetailFrame:SetStatusText("Char Count: " .. RepHub:GetStandingsCount(factionData.standings))
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
        function(k, v)
            factionDetailText = factionDetailText .. v.characterName .. ": " .. v.standing .. "\n"
        end
    )

    local factionDetailLabel = AceGUI:Create("Label")
    factionDetailLabel:SetFullWidth(true)
    factionDetailLabel:SetText(factionDetailText)
    factionDetailFrame:AddChild(factionDetailLabel)

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
