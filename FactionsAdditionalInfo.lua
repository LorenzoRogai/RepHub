local factionsAdditionalInfo = {
    {
        name = "Argent Dawn",
        side = "Neutral",
        zones = {"Eastern Plaguelands", "Western Plaguelands"},
        category = "Outdoor PvE",
        quartermaster_location = "Light's Hope Chapel, Eastern Plaguelands",
        farming_methods = {
            "Complete quests in the Plaguelands",
            "Participate in the Stratholme and Scholomance dungeons",
            "Turn in Scourgestones collected from undead mobs"
        }
    },
    {
        name = "Cenarion Circle",
        side = "Neutral",
        zones = {"Silithus"},
        category = "Outdoor PvE",
        quartermaster_location = "Cenarion Hold, Silithus",
        farming_methods = {
            "Complete quests in Silithus",
            "Participate in the Ahn'Qiraj raids",
            "Turn in Encrypted Twilight Texts"
        }
    },
    {
        name = "Thorium Brotherhood",
        side = "Neutral",
        zones = {"Searing Gorge", "Blackrock Depths"},
        category = "Dungeon PvE",
        quartermaster_location = "Thorium Point, Searing Gorge",
        farming_methods = {
            "Complete quests in Searing Gorge",
            "Turn in Dark Iron Residue and other materials",
            "Craft and turn in specific items as a Blacksmith"
        }
    },
    {
        name = "Timbermaw Hold",
        side = "Neutral",
        zones = {"Felwood", "Winterspring"},
        category = "Outdoor PvE",
        quartermaster_location = "Timbermaw Hold, between Felwood and Winterspring",
        farming_methods = {
            "Complete quests for the Timbermaw Furbolgs",
            "Kill Deadwood and Winterfall Furbolgs",
            "Turn in Deadwood Headdress Feathers and Winterfall Spirit Beads"
        }
    },
    {
        name = "Zandalar Tribe",
        side = "Neutral",
        zones = {"Zul'Gurub"},
        category = "Raid",
        quartermaster_location = "Yojamba Isle, Stranglethorn Vale",
        farming_methods = {
            "Participate in the Zul'Gurub raid",
            "Turn in coins and bijous collected from the raid"
        }
    },
    {
        name = "Brood of Nozdormu",
        side = "Neutral",
        zones = {"Silithus", "Ahn'Qiraj"},
        category = "Raid",
        quartermaster_location = "Inside the Temple of Ahn'Qiraj",
        farming_methods = {
            "Participate in the Temple of Ahn'Qiraj raid",
            "Complete quests related to the Scepter of the Shifting Sands"
        }
    },
    {
        name = "Hydraxian Waterlords",
        side = "Neutral",
        zones = {"Azshara", "Molten Core"},
        category = "Raid",
        quartermaster_location = "Azshara, Bay of Storms",
        farming_methods = {
            "Participate in the Molten Core raid",
            "Complete quests given by Duke Hydraxis"
        }
    },
    {
        name = "Darkmoon Faire",
        side = "Neutral",
        zones = {"Elwynn Forest", "Mulgore"},
        category = "Event",
        quartermaster_location = "Darkmoon Island",
        farming_methods = {
            "Participate in monthly Darkmoon Faire events"
        }
    },
    {
        name = "Bloodsail Buccaneers",
        side = "Neutral",
        zones = {"Stranglethorn Vale"},
        category = "Outdoor PvP",
        quartermaster_location = "No Quartermaster (Rewards from pirates near Booty Bay)",
        farming_methods = {
            "Defeat Steamwheedle Cartel NPCs in Booty Bay",
            "Avoid attacking Bloodsail Buccaneers"
        }
    },
    {
        name = "Steamwheedle Cartel",
        side = "Neutral",
        zones = {"Stranglethorn Vale", "Tanaris", "Winterspring", "The Barrens"},
        category = "Outdoor PvE",
        quartermaster_location = "Various Goblin towns (Booty Bay, Gadgetzan, Everlook, Ratchet)",
        farming_methods = {
            "Complete quests for the Goblin factions",
            "Defeat pirates and bandits hostile to the Steamwheedle Cartel",
            "Avoid attacking Goblin NPCs"
        }
    },
    {
        name = "The Aldor",
        side = "Neutral",
        zones = {"Shattrath City", "Shadowmoon Valley"},
        category = "Faction",
        quartermaster_location = "Terrace of Light, Shattrath City",
        farming_methods = {
            "Complete quests for the Aldor",
            "Turn in Marks of Kil'jaeden and Marks of Sargeras",
            "Turn in Fel Armaments"
        }
    },
    {
        name = "The Scryers",
        side = "Neutral",
        zones = {"Shattrath City", "Netherstorm"},
        category = "Faction",
        quartermaster_location = "Scryer's Tier, Shattrath City",
        farming_methods = {
            "Complete quests for the Scryers",
            "Turn in Firewing Signets and Sunfury Signets",
            "Turn in Arcane Tomes"
        }
    },
    {
        name = "Cenarion Expedition",
        side = "Neutral",
        zones = {"Zangarmarsh", "Blade's Edge Mountains"},
        category = "Outdoor PvE",
        quartermaster_location = "Cenarion Refuge, Zangarmarsh",
        farming_methods = {
            "Complete quests in Zangarmarsh and Blade's Edge Mountains",
            "Kill Naga mobs",
            "Turn in Unidentified Plant Parts"
        }
    },
    {
        name = "The Sha'tar",
        side = "Neutral",
        zones = {"Shattrath City", "Terokkar Forest"},
        category = "Faction",
        quartermaster_location = "Terrace of Light, Shattrath City",
        farming_methods = {
            "Complete quests in Shattrath City",
            "Run Tempest Keep dungeons"
        }
    },
    {
        name = "The Consortium",
        side = "Neutral",
        zones = {"Netherstorm", "Nagrand"},
        category = "Faction",
        quartermaster_location = "Stormspire, Netherstorm",
        farming_methods = {
            "Complete quests in Netherstorm and Nagrand",
            "Turn in Obsidian Warbeads",
            "Run Mana-Tombs dungeon"
        }
    },
    {
        name = "The Violet Eye",
        side = "Neutral",
        zones = {"Deadwind Pass"},
        category = "Raid",
        quartermaster_location = "Karazhan, Deadwind Pass",
        farming_methods = {
            "Complete Karazhan raid"
        }
    },
    {
        name = "Lower City",
        side = "Neutral",
        zones = {"Shattrath City"},
        category = "Faction",
        quartermaster_location = "Lower City, Shattrath City",
        farming_methods = {
            "Complete quests in Shattrath City",
            "Run Auchindoun dungeons"
        }
    },
    {
        name = "Keepers of Time",
        side = "Neutral",
        zones = {"Caverns of Time, Tanaris"},
        category = "Dungeon PvE",
        quartermaster_location = "Caverns of Time, Tanaris",
        farming_methods = {
            "Complete quests in Caverns of Time",
            "Run Old Hillsbrad Foothills and The Black Morass dungeons"
        }
    },
    {
        name = "Honor Hold",
        side = "Alliance",
        zones = {"Hellfire Peninsula"},
        category = "Outdoor PvE",
        quartermaster_location = "Honor Hold, Hellfire Peninsula",
        farming_methods = {
            "Complete quests for Honor Hold",
            "Run Hellfire Citadel dungeons"
        }
    },
    {
        name = "Thrallmar",
        side = "Horde",
        zones = {"Hellfire Peninsula"},
        category = "Outdoor PvE",
        quartermaster_location = "Thrallmar, Hellfire Peninsula",
        farming_methods = {
            "Complete quests for Thrallmar",
            "Run Hellfire Citadel dungeons"
        }
    },
    {
        name = "Ogri'la",
        side = "Neutral",
        zones = {"Blade's Edge Mountains"},
        category = "Outdoor PvE",
        quartermaster_location = "Ogri'la, Blade's Edge Mountains",
        farming_methods = {
            "Complete daily quests for Ogri'la",
            "Participate in Skyguard events"
        }
    },
    {
        name = "Netherwing",
        side = "Neutral",
        zones = {"Shadowmoon Valley"},
        category = "Outdoor PvE",
        quartermaster_location = "Netherwing Ledge, Shadowmoon Valley",
        farming_methods = {
            "Complete quests for Netherwing",
            "Gather Netherwing Eggs",
            "Participate in daily quests"
        }
    },
    {
        name = "Shattered Sun Offensive",
        side = "Neutral",
        zones = {"Isle of Quel'Danas"},
        category = "Faction",
        quartermaster_location = "Sun's Reach, Isle of Quel'Danas",
        farming_methods = {
            "Complete daily quests",
            "Participate in the progression of Sun's Reach"
        }
    },
    {
        name = "Ashtongue Deathsworn",
        side = "Neutral",
        zones = {"Shadowmoon Valley", "Black Temple"},
        category = "Raid",
        quartermaster_location = "Black Temple, Shadowmoon Valley",
        farming_methods = {
            "Run Black Temple raid"
        }
    },
    {
        name = "The Sons of Hodir",
        side = "Neutral",
        zones = {"The Storm Peaks"},
        category = "Quest",
        quartermaster_location = "Dun Niffelem, The Storm Peaks",
        farming_methods = {
            "Complete daily quests in Dun Niffelem",
            "Turn in Relics of Ulduar"
        }
    },
    {
        name = "Knights of the Ebon Blade",
        side = "Neutral",
        zones = {"Icecrown", "Zul'Drak"},
        category = "Quest",
        quartermaster_location = "Shadow Vault, Icecrown",
        farming_methods = {
            "Complete quests in Icecrown and Shadow Vault",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "Argent Crusade",
        side = "Neutral",
        zones = {"Icecrown", "Zul'Drak"},
        category = "Quest",
        quartermaster_location = "Argent Vanguard, Icecrown",
        farming_methods = {
            "Complete quests in Icecrown and Zul'Drak",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "The Wyrmrest Accord",
        side = "Neutral",
        zones = {"Dragonblight"},
        category = "Quest",
        quartermaster_location = "Wyrmrest Temple, Dragonblight",
        farming_methods = {
            "Complete quests in Dragonblight",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "Kirin Tor",
        side = "Neutral",
        zones = {"Dalaran"},
        category = "Dungeon",
        quartermaster_location = "Violet Citadel, Dalaran",
        farming_methods = {
            "Run dungeons wearing their tabard",
            "Complete Dalaran daily quests"
        }
    },
    {
        name = "Frenzyheart Tribe",
        side = "Neutral",
        zones = {"Sholazar Basin"},
        category = "Quest",
        quartermaster_location = "Frenzyheart Hill, Sholazar Basin",
        farming_methods = {
            "Complete Frenzyheart quests in Sholazar Basin"
        }
    },
    {
        name = "The Oracles",
        side = "Neutral",
        zones = {"Sholazar Basin"},
        category = "Quest",
        quartermaster_location = "Rainspeaker Canopy, Sholazar Basin",
        farming_methods = {
            "Complete The Oracles quests in Sholazar Basin"
        }
    },
    {
        name = "Horde Expedition",
        side = "Horde",
        zones = {"Various Northrend Zones"},
        category = "Faction Group",
        quartermaster_location = "Various",
        farming_methods = {
            "Gain reputation with The Hand of Vengeance, Warsong Offensive, The Taunka, or Sunreavers"
        }
    },
    {
        name = "Alliance Vanguard",
        side = "Alliance",
        zones = {"Various Northrend Zones"},
        category = "Faction Group",
        quartermaster_location = "Various",
        farming_methods = {
            "Gain reputation with The Silver Covenant, Explorers' League, Valiance Expedition, or Frostborn"
        }
    },
    {
        name = "Ashen Verdict",
        side = "Neutral",
        zones = {"Icecrown Citadel"},
        category = "Raid",
        quartermaster_location = "Icecrown Citadel Entrance",
        farming_methods = {
            "Run Icecrown Citadel raid"
        }
    },
    {
        name = "Guardians of Hyjal",
        side = "Neutral",
        zones = {"Mount Hyjal"},
        category = "Quest",
        quartermaster_location = "Nordrassil, Mount Hyjal",
        farming_methods = {
            "Complete quests in Mount Hyjal",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "Therazane",
        side = "Neutral",
        zones = {"Deepholm"},
        category = "Quest",
        quartermaster_location = "Therazane's Throne, Deepholm",
        farming_methods = {
            "Complete quests in Deepholm",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "The Earthen Ring",
        side = "Neutral",
        zones = {"Deepholm", "Shimmering Expanse", "Twilight Highlands"},
        category = "Quest",
        quartermaster_location = "Vast Ocean, Shimmering Expanse",
        farming_methods = {
            "Complete quests in Deepholm and Twilight Highlands",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "Ramkahen",
        side = "Neutral",
        zones = {"Uldum"},
        category = "Quest",
        quartermaster_location = "Ramkahen, Uldum",
        farming_methods = {
            "Complete quests in Uldum",
            "Turn in Relics of the Tol'vir"
        }
    },
    {
        name = "Dragonmaw Clan",
        side = "Horde",
        zones = {"Twilight Highlands"},
        category = "Quest",
        quartermaster_location = "Bloodgulch, Twilight Highlands",
        farming_methods = {
            "Complete quests in Twilight Highlands",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "Wildhammer Clan",
        side = "Alliance",
        zones = {"Twilight Highlands"},
        category = "Quest",
        quartermaster_location = "Thundermar, Twilight Highlands",
        farming_methods = {
            "Complete quests in Twilight Highlands",
            "Run dungeons wearing their tabard"
        }
    },
    {
        name = "Baradin's Wardens",
        side = "Alliance",
        zones = {"Tol Barad Peninsula"},
        category = "PvP",
        quartermaster_location = "Baradin Base Camp, Tol Barad Peninsula",
        farming_methods = {
            "Complete daily quests in Tol Barad",
            "Participate in Tol Barad battles"
        }
    },
    {
        name = "Hellscream's Reach",
        side = "Horde",
        zones = {"Tol Barad Peninsula"},
        category = "PvP",
        quartermaster_location = "Hellscream's Grasp, Tol Barad Peninsula",
        farming_methods = {
            "Complete daily quests in Tol Barad",
            "Participate in Tol Barad battles"
        }
    },
    {
        name = "Avengers of Hyjal",
        side = "Neutral",
        zones = {"Firelands"},
        category = "Raid",
        quartermaster_location = "Firelands Entrance",
        farming_methods = {
            "Run Firelands raid"
        }
    },
    {
        name = "The Tillers",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Quest",
        quartermaster_location = "Halfhill, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests in Halfhill",
            "Grow crops on your farm"
        }
    },
    {
        name = "Golden Lotus",
        side = "Neutral",
        zones = {"Vale of Eternal Blossoms"},
        category = "Quest",
        quartermaster_location = "Golden Pagoda, Vale of Eternal Blossoms",
        farming_methods = {
            "Complete daily quests in Vale of Eternal Blossoms",
            "Kill enemies in the Vale"
        }
    },
    {
        name = "The August Celestials",
        side = "Neutral",
        zones = {"Various Zones"},
        category = "Quest",
        quartermaster_location = "Various Celestial Temples",
        farming_methods = {
            "Complete daily quests at celestial temples in Pandaria"
        }
    },
    {
        name = "The Shado-Pan",
        side = "Neutral",
        zones = {"Townlong Steppes"},
        category = "Quest",
        quartermaster_location = "Shado-Pan Garrison, Townlong Steppes",
        farming_methods = {
            "Complete daily quests at Shado-Pan Garrison",
            "Complete quests in Townlong Steppes"
        }
    },
    {
        name = "The Klaxxi",
        side = "Neutral",
        zones = {"Dread Wastes"},
        category = "Quest",
        quartermaster_location = "Klaxxi'vess, Dread Wastes",
        farming_methods = {
            "Complete daily quests in the Dread Wastes",
            "Complete storyline quests for Klaxxi"
        }
    },
    {
        name = "Order of the Cloud Serpent",
        side = "Neutral",
        zones = {"The Jade Forest"},
        category = "Quest",
        quartermaster_location = "Arbor Glen, The Jade Forest",
        farming_methods = {
            "Complete daily quests in Jade Forest",
            "Collect Onyx Eggs"
        }
    },
    {
        name = "Operation: Shieldwall",
        side = "Alliance",
        zones = {"Krasarang Wilds"},
        category = "Quest",
        quartermaster_location = "Lion's Landing, Krasarang Wilds",
        farming_methods = {
            "Complete storyline quests in Krasarang Wilds",
            "Complete daily quests for Operation: Shieldwall"
        }
    },
    {
        name = "Dominance Offensive",
        side = "Horde",
        zones = {"Krasarang Wilds"},
        category = "Quest",
        quartermaster_location = "Domination Point, Krasarang Wilds",
        farming_methods = {
            "Complete storyline quests in Krasarang Wilds",
            "Complete daily quests for Dominance Offensive"
        }
    },
    {
        name = "The Anglers",
        side = "Neutral",
        zones = {"Krasarang Wilds"},
        category = "Fishing",
        quartermaster_location = "Anglers Wharf, Krasarang Wilds",
        farming_methods = {
            "Complete daily fishing quests at Anglers Wharf",
            "Fish in Pandaria zones"
        }
    },
    {
        name = "The Black Prince",
        side = "Neutral",
        zones = {"Various Zones"},
        category = "Legendary Quest",
        quartermaster_location = "No specific location",
        farming_methods = {
            "Complete Wrathion's legendary questline",
            "Farm mobs and bosses in Pandaria raids and zones"
        }
    },
    {
        name = "The Celestials",
        side = "Neutral",
        zones = {"Timeless Isle"},
        category = "Raid",
        quartermaster_location = "Timeless Isle",
        farming_methods = {
            "Defeat world bosses on the Timeless Isle"
        }
    },
    {
        name = "Emperor Shaohao",
        side = "Neutral",
        zones = {"Timeless Isle"},
        category = "Grinding",
        quartermaster_location = "Timeless Isle",
        farming_methods = {
            "Farm mobs on the Timeless Isle"
        }
    },
    {
        name = "Council of Exarchs",
        side = "Alliance",
        zones = {"Shadowmoon Valley"},
        category = "Quest",
        quartermaster_location = "Stormshield, Ashran",
        farming_methods = {
            "Complete quests in Shadowmoon Valley",
            "Farm mobs in relevant zones"
        }
    },
    {
        name = "Frostwolf Orcs",
        side = "Horde",
        zones = {"Frostfire Ridge"},
        category = "Quest",
        quartermaster_location = "Warspear, Ashran",
        farming_methods = {
            "Complete quests in Frostfire Ridge",
            "Farm mobs in relevant zones"
        }
    },
    {
        name = "Arakkoa Outcasts",
        side = "Neutral",
        zones = {"Spires of Arak"},
        category = "Quest",
        quartermaster_location = "Spires of Arak",
        farming_methods = {
            "Complete quests in Spires of Arak",
            "Run dungeons wearing their tabard",
            "Farm mobs in Spires of Arak"
        }
    },
    {
        name = "Steamwheedle Preservation Society",
        side = "Neutral",
        zones = {"Nagrand"},
        category = "Grinding",
        quartermaster_location = "Nagrand",
        farming_methods = {
            "Farm mobs in Nagrand",
            "Turn in Highmaul Relics"
        }
    },
    {
        name = "Sha'tari Defense",
        side = "Alliance",
        zones = {"Talador"},
        category = "Quest",
        quartermaster_location = "Stormshield, Ashran",
        farming_methods = {
            "Farm mobs in Talador",
            "Complete quests in relevant areas"
        }
    },
    {
        name = "Laughing Skull Orcs",
        side = "Horde",
        zones = {"Gorgrond"},
        category = "Grinding",
        quartermaster_location = "Warspear, Ashran",
        farming_methods = {
            "Farm mobs in Gorgrond",
            "Complete quests in relevant areas"
        }
    },
    {
        name = "Hand of the Prophet",
        side = "Alliance",
        zones = {"Tanaan Jungle"},
        category = "Quest",
        quartermaster_location = "Lion's Watch, Tanaan Jungle",
        farming_methods = {
            "Complete daily quests in Tanaan Jungle",
            "Farm mobs in Tanaan Jungle"
        }
    },
    {
        name = "Vol'jin's Headhunters",
        side = "Horde",
        zones = {"Tanaan Jungle"},
        category = "Quest",
        quartermaster_location = "Vol'mar, Tanaan Jungle",
        farming_methods = {
            "Complete daily quests in Tanaan Jungle",
            "Farm mobs in Tanaan Jungle"
        }
    },
    {
        name = "The Saberstalkers",
        side = "Neutral",
        zones = {"Tanaan Jungle"},
        category = "Grinding",
        quartermaster_location = "Fang'rila, Tanaan Jungle",
        farming_methods = {
            "Farm elites in Fang'rila",
            "Complete daily quests for The Saberstalkers"
        }
    },
    {
        name = "Order of the Awakened",
        side = "Neutral",
        zones = {"Tanaan Jungle"},
        category = "Quest",
        quartermaster_location = "Tanaan Jungle",
        farming_methods = {
            "Complete daily quests in Tanaan Jungle",
            "Collect and turn in Fel-Corrupted Apexis Fragments"
        }
    },
    {
        name = "Court of Farondis",
        side = "Neutral",
        zones = {"Azsuna"},
        category = "Quest",
        quartermaster_location = "Lunarwing Shallows, Azsuna",
        farming_methods = {
            "Complete world quests in Azsuna",
            "Turn in emissary quests for Court of Farondis"
        }
    },
    {
        name = "Dreamweavers",
        side = "Neutral",
        zones = {"Val'sharah"},
        category = "Quest",
        quartermaster_location = "Lorlathil, Val'sharah",
        farming_methods = {
            "Complete world quests in Val'sharah",
            "Turn in emissary quests for Dreamweavers"
        }
    },
    {
        name = "Highmountain Tribe",
        side = "Neutral",
        zones = {"Highmountain"},
        category = "Quest",
        quartermaster_location = "Thunder Totem, Highmountain",
        farming_methods = {
            "Complete world quests in Highmountain",
            "Turn in emissary quests for Highmountain Tribe"
        }
    },
    {
        name = "Valarjar",
        side = "Neutral",
        zones = {"Stormheim"},
        category = "Quest",
        quartermaster_location = "Valdisdall, Stormheim",
        farming_methods = {
            "Complete world quests in Stormheim",
            "Turn in emissary quests for Valarjar"
        }
    },
    {
        name = "The Wardens",
        side = "Neutral",
        zones = {"Broken Isles"},
        category = "Quest",
        quartermaster_location = "Wardens' Redoubt, Azsuna",
        farming_methods = {
            "Complete Warden world quests on the Broken Isles",
            "Turn in emissary quests for The Wardens"
        }
    },
    {
        name = "The Nightfallen",
        side = "Neutral",
        zones = {"Suramar"},
        category = "Quest",
        quartermaster_location = "Shal'Aran, Suramar",
        farming_methods = {
            "Complete quests and world quests in Suramar",
            "Turn in emissary quests for The Nightfallen",
            "Farm Arcane Mana for additional reputation"
        }
    },
    {
        name = "Armies of Legionfall",
        side = "Neutral",
        zones = {"Broken Shore"},
        category = "Quest",
        quartermaster_location = "Deliverance Point, Broken Shore",
        farming_methods = {
            "Complete world quests on the Broken Shore",
            "Turn in emissary quests for Legionfall"
        }
    },
    {
        name = "Army of the Light",
        side = "Neutral",
        zones = {"Argus"},
        category = "Quest",
        quartermaster_location = "Krokuun, Argus",
        farming_methods = {
            "Complete world quests on Argus",
            "Turn in emissary quests for Army of the Light"
        }
    },
    {
        name = "Argussian Reach",
        side = "Neutral",
        zones = {"Argus"},
        category = "Quest",
        quartermaster_location = "Krokul Hovel, Argus",
        farming_methods = {
            "Complete world quests on Argus",
            "Turn in emissary quests for Argussian Reach"
        }
    },
    {
        name = "Talon's Vengeance",
        side = "Neutral",
        zones = {"Broken Isles"},
        category = "PvP",
        quartermaster_location = "Sparring Arena, Highmountain",
        farming_methods = {
            "Use Ivory Talon to attack players while in PvP combat",
            "Turn in Marks of Prey for reputation"
        }
    },
    {
        name = "7th Legion",
        side = "Alliance",
        zones = {"Zandalar", "Kul Tiras", "Warfronts"},
        category = "War Campaign",
        quartermaster_location = "Boralus, Tiragarde Sound",
        farming_methods = {
            "Complete war campaign quests",
            "Complete world quests in Zandalar",
            "Participate in Warfronts"
        }
    },
    {
        name = "The Honorbound",
        side = "Horde",
        zones = {"Zandalar", "Kul Tiras", "Warfronts"},
        category = "War Campaign",
        quartermaster_location = "Dazar'alor, Zuldazar",
        farming_methods = {
            "Complete war campaign quests",
            "Complete world quests in Kul Tiras",
            "Participate in Warfronts"
        }
    },
    {
        name = "Proudmoore Admiralty",
        side = "Alliance",
        zones = {"Tiragarde Sound"},
        category = "Quest",
        quartermaster_location = "Boralus, Tiragarde Sound",
        farming_methods = {
            "Complete world quests in Tiragarde Sound",
            "Turn in emissary quests for Proudmoore Admiralty"
        }
    },
    {
        name = "Order of Embers",
        side = "Alliance",
        zones = {"Drustvar"},
        category = "Quest",
        quartermaster_location = "Fallhaven, Drustvar",
        farming_methods = {
            "Complete world quests in Drustvar",
            "Turn in emissary quests for Order of Embers"
        }
    },
    {
        name = "Storm's Wake",
        side = "Alliance",
        zones = {"Stormsong Valley"},
        category = "Quest",
        quartermaster_location = "Brennadam, Stormsong Valley",
        farming_methods = {
            "Complete world quests in Stormsong Valley",
            "Turn in emissary quests for Storm's Wake"
        }
    },
    {
        name = "Zandalari Empire",
        side = "Horde",
        zones = {"Zuldazar"},
        category = "Quest",
        quartermaster_location = "The Zocalo, Zuldazar",
        farming_methods = {
            "Complete world quests in Zuldazar",
            "Turn in emissary quests for Zandalari Empire"
        }
    },
    {
        name = "Talanji's Expedition",
        side = "Horde",
        zones = {"Nazmir"},
        category = "Quest",
        quartermaster_location = "Zul'jan, Nazmir",
        farming_methods = {
            "Complete world quests in Nazmir",
            "Turn in emissary quests for Talanji's Expedition"
        }
    },
    {
        name = "Voldunai",
        side = "Horde",
        zones = {"Vol'dun"},
        category = "Quest",
        quartermaster_location = "Vulpera Hideaway, Vol'dun",
        farming_methods = {
            "Complete world quests in Vol'dun",
            "Turn in emissary quests for Voldunai"
        }
    },
    {
        name = "Champions of Azeroth",
        side = "Neutral",
        zones = {"Zandalar", "Kul Tiras", "Silithus"},
        category = "Quest",
        quartermaster_location = "Silithus: The Wound",
        farming_methods = {
            "Complete world quests across Zandalar and Kul Tiras",
            "Turn in emissary quests for Champions of Azeroth"
        }
    },
    {
        name = "Tortollan Seekers",
        side = "Neutral",
        zones = {"Zandalar", "Kul Tiras"},
        category = "Quest",
        quartermaster_location = "Seekers' Outpost, Zuldazar",
        farming_methods = {
            "Complete Tortollan world quests in Zandalar and Kul Tiras",
            "Turn in emissary quests for Tortollan Seekers"
        }
    },
    {
        name = "Rustbolt Resistance",
        side = "Neutral",
        zones = {"Mechagon"},
        category = "Quest",
        quartermaster_location = "Rustbolt, Mechagon",
        farming_methods = {
            "Complete daily quests in Mechagon",
            "Kill rare mobs and complete special events in Mechagon"
        }
    },
    {
        name = "Waveblade Ankoan",
        side = "Alliance",
        zones = {"Nazjatar"},
        category = "Quest",
        quartermaster_location = "Mezzamere, Nazjatar",
        farming_methods = {
            "Complete world quests in Nazjatar",
            "Complete daily quests in Mezzamere"
        }
    },
    {
        name = "The Unshackled",
        side = "Horde",
        zones = {"Nazjatar"},
        category = "Quest",
        quartermaster_location = "Newhome, Nazjatar",
        farming_methods = {
            "Complete world quests in Nazjatar",
            "Complete daily quests in Newhome"
        }
    },
    {
        name = "Rajani",
        side = "Neutral",
        zones = {"Vale of Eternal Blossoms"},
        category = "Quest",
        quartermaster_location = "Mistfall Village, Vale of Eternal Blossoms",
        farming_methods = {
            "Complete assaults in Vale of Eternal Blossoms",
            "Complete Rajani world quests"
        }
    },
    {
        name = "Uldum Accord",
        side = "Neutral",
        zones = {"Uldum"},
        category = "Quest",
        quartermaster_location = "Ramkahen, Uldum",
        farming_methods = {
            "Complete assaults in Uldum",
            "Complete Uldum Accord world quests"
        }
    },
    {
        name = "The Ascended",
        side = "Neutral",
        zones = {"Bastion"},
        category = "Quest",
        quartermaster_location = "Hero's Rest, Bastion",
        farming_methods = {
            "Complete quests and world quests in Bastion",
            "Turn in Ascended Supplies and do daily quests"
        }
    },
    {
        name = "The Wild Hunt",
        side = "Neutral",
        zones = {"Ardenweald"},
        category = "Quest",
        quartermaster_location = "Heart of the Forest, Ardenweald",
        farming_methods = {
            "Complete quests and world quests in Ardenweald",
            "Participate in Covenant activities as a Night Fae"
        }
    },
    {
        name = "Court of Harvesters",
        side = "Neutral",
        zones = {"Revendreth"},
        category = "Quest",
        quartermaster_location = "Sinfall, Revendreth",
        farming_methods = {
            "Complete quests and world quests in Revendreth",
            "Participate in Covenant activities as a Venthyr"
        }
    },
    {
        name = "The Undying Army",
        side = "Neutral",
        zones = {"Maldraxxus"},
        category = "Quest",
        quartermaster_location = "Seat of the Primus, Maldraxxus",
        farming_methods = {
            "Complete quests and world quests in Maldraxxus",
            "Participate in Covenant activities as a Necrolord"
        }
    },
    {
        name = "Ve'nari",
        side = "Neutral",
        zones = {"The Maw"},
        category = "Quest",
        quartermaster_location = "Ve'nari's Refuge, The Maw",
        farming_methods = {
            "Complete dailies and weeklies in The Maw",
            "Farm Stygia by killing rares and completing objectives"
        }
    },
    {
        name = "Death's Advance",
        side = "Neutral",
        zones = {"Korthia", "The Maw"},
        category = "Quest",
        quartermaster_location = "Keeper's Respite, Korthia",
        farming_methods = {
            "Complete daily quests in Korthia",
            "Farm rares and treasures in Korthia and The Maw"
        }
    },
    {
        name = "The Archivists' Codex",
        side = "Neutral",
        zones = {"Korthia"},
        category = "Quest",
        quartermaster_location = "Keeper's Respite, Korthia",
        farming_methods = {
            "Turn in Relic Fragments found in Korthia",
            "Complete daily and weekly quests for Archivists"
        }
    },
    {
        name = "The Enlightened",
        side = "Neutral",
        zones = {"Zereth Mortis"},
        category = "Quest",
        quartermaster_location = "Haven, Zereth Mortis",
        farming_methods = {
            "Complete world quests and dailies in Zereth Mortis",
            "Farm rares and complete activities in Zereth Mortis"
        }
    },
    {
        name = "Ironforge",
        side = "Alliance",
        zones = {"Dun Morogh"},
        category = "Classic",
        quartermaster_location = "Ironforge, Dun Morogh",
        farming_methods = {
            "Complete quests in Dun Morogh",
            "Turn in cloth for reputation",
            "Run low-level dungeons as Alliance"
        }
    },
    {
        name = "Ratchet",
        side = "Neutral",
        zones = {"Northern Barrens"},
        category = "Classic",
        quartermaster_location = "Ratchet, Northern Barrens",
        farming_methods = {
            "Complete quests for the Steamwheedle Cartel",
            "Kill pirates and enemies hostile to the Cartel"
        }
    },
    {
        name = "Sporeggar",
        side = "Neutral",
        zones = {"Zangarmarsh"},
        category = "Burning Crusade",
        quartermaster_location = "Sporeggar, Zangarmarsh",
        farming_methods = {
            "Complete quests for Sporeggar",
            "Farm fungal giants for Fertile Spores and Glowcaps"
        }
    },
    {
        name = "Court of Night",
        side = "Neutral",
        zones = {"Ardenweald"},
        category = "Shadowlands",
        quartermaster_location = "Ardenweald",
        farming_methods = {
            "Complete Night Fae-specific Covenant activities"
        }
    },
    {
        name = "Valiance Expedition",
        side = "Alliance",
        zones = {"Borean Tundra", "Howling Fjord", "Dragonblight"},
        category = "Wrath of the Lich King",
        quartermaster_location = "Valiance Keep, Borean Tundra",
        farming_methods = {
            "Complete quests in Northrend",
            "Run dungeons as Alliance in Wrath of the Lich King zones"
        }
    },
    {
        name = "Pearlfin Jinyu",
        side = "Alliance",
        zones = {"The Jade Forest"},
        category = "Mists of Pandaria",
        quartermaster_location = "Pearlfin Village, The Jade Forest",
        farming_methods = {
            "Complete storyline quests in The Jade Forest",
            "Participate in faction-specific events"
        }
    },
    {
        name = "Shado-Pan Assault",
        side = "Neutral",
        zones = {"Isle of Thunder"},
        category = "Mists of Pandaria",
        quartermaster_location = "Isle of Thunder",
        farming_methods = {
            "Run Throne of Thunder raid",
            "Complete daily quests in the area"
        }
    },
    {
        name = "Kurenai",
        side = "Alliance",
        zones = {"Nagrand"},
        category = "Burning Crusade",
        quartermaster_location = "Telaar, Nagrand",
        farming_methods = {
            "Complete quests in Nagrand",
            "Farm Ogres for Obsidian Warbeads"
        }
    },
    {
        name = "The Frostborn",
        side = "Neutral",
        zones = {"The Storm Peaks"},
        category = "Wrath of the Lich King",
        quartermaster_location = "Frosthold, The Storm Peaks",
        farming_methods = {
            "Complete storyline quests in The Storm Peaks"
        }
    },
    {
        name = "Booty Bay",
        side = "Neutral",
        zones = {"Stranglethorn Vale"},
        category = "Classic",
        quartermaster_location = "Booty Bay, Stranglethorn Vale",
        farming_methods = {
            "Complete quests for the Steamwheedle Cartel",
            "Kill enemies hostile to the Cartel"
        }
    },
    {
        name = "Explorers' League",
        side = "Alliance",
        zones = {"Various Northrend Zones"},
        category = "Wrath of the Lich King",
        quartermaster_location = "Valiance Keep, Borean Tundra",
        farming_methods = {
            "Complete quests and storyline in Northrend"
        }
    },
    {
        name = "Gilneas",
        side = "Alliance",
        zones = {"Silverpine Forest"},
        category = "Faction",
        quartermaster_location = "Gilneas, Silverpine Forest",
        farming_methods = {
            "Complete storyline quests for Gilneas"
        }
    },
    {
        name = "Gnomeregan",
        side = "Alliance",
        zones = {"Dun Morogh"},
        category = "Classic",
        quartermaster_location = "Ironforge, Dun Morogh",
        farming_methods = {
            "Complete low-level quests",
            "Turn in cloth for reputation",
            "Run Gnomeregan dungeon"
        }
    },
    {
        name = "Chromie",
        side = "Neutral",
        zones = {"Various"},
        category = "Faction",
        quartermaster_location = "Wyrmrest Temple, Dragonblight",
        farming_methods = {
            "Participate in Chromie Time-related activities"
        }
    },
    {
        name = "Stormwind",
        side = "Alliance",
        zones = {"Elwynn Forest"},
        category = "Classic",
        quartermaster_location = "Stormwind City, Elwynn Forest",
        farming_methods = {
            "Complete quests in Elwynn Forest",
            "Turn in cloth for reputation",
            "Run dungeons as Alliance"
        }
    },
    {
        name = "The Kalu'ak",
        side = "Neutral",
        zones = {"Howling Fjord", "Borean Tundra", "Dragonblight"},
        category = "Wrath of the Lich King",
        quartermaster_location = "Various Kalu'ak Villages in Northrend",
        farming_methods = {
            "Complete daily quests for the Kalu'ak"
        }
    },
    {
        name = "Dark Talons",
        side = "Horde",
        zones = {"Dragon Isles"},
        category = "Dragonflight",
        quartermaster_location = "The Obsidian Throne, Dragon Isles",
        farming_methods = {
            "Complete world quests and dailies in the Dragon Isles"
        }
    },
    {
        name = "Obsidian Warders",
        side = "Alliance",
        zones = {"Dragon Isles"},
        category = "Dragonflight",
        quartermaster_location = "The Obsidian Throne, Dragon Isles",
        farming_methods = {
            "Complete world quests and dailies in the Dragon Isles"
        }
    },
    {
        name = "Shado-Pan",
        side = "Neutral",
        zones = {"Townlong Steppes"},
        category = "Mists of Pandaria",
        quartermaster_location = "Shado-Pan Garrison, Townlong Steppes",
        farming_methods = {
            "Complete quests and dailies at Shado-Pan Garrison"
        }
    },
    {
        name = "Jogu the Drunk",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Jogu items he likes, such as green vegetables"
        }
    },
    {
        name = "Ella",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Ella items she likes, such as dishes or snacks"
        }
    },
    {
        name = "Gadgetzan",
        side = "Neutral",
        zones = {"Tanaris"},
        category = "Classic",
        quartermaster_location = "Gadgetzan, Tanaris",
        farming_methods = {
            "Complete quests for the Steamwheedle Cartel",
            "Kill enemies hostile to the Cartel"
        }
    },
    {
        name = "Chee Chee",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Chee Chee items he likes, such as snacks or vegetables"
        }
    },
    {
        name = "Darnassus",
        side = "Alliance",
        zones = {"Teldrassil"},
        category = "Classic",
        quartermaster_location = "Darnassus, Teldrassil",
        farming_methods = {
            "Complete quests in Teldrassil",
            "Turn in cloth for reputation",
            "Run dungeons as Alliance"
        }
    },
    {
        name = "The Lorewalkers",
        side = "Neutral",
        zones = {"Pandaria"},
        category = "Mists of Pandaria",
        quartermaster_location = "Seat of Knowledge, Vale of Eternal Blossoms",
        farming_methods = {
            "Collect lore objects across Pandaria",
            "Complete achievements related to lore discovery"
        }
    },
    {
        name = "Gina Mudclaw",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Gina items she likes, such as vegetables or drinks"
        }
    },
    {
        name = "Fish Fellreed",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Fish items she likes, such as fish or tools"
        }
    },
    {
        name = "Farmer Fung",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Farmer Fung items he likes, such as seeds or vegetables"
        }
    },
    {
        name = "The Ashen Verdict",
        side = "Neutral",
        zones = {"Icecrown Citadel"},
        category = "Wrath of the Lich King",
        quartermaster_location = "Icecrown Citadel Entrance",
        farming_methods = {
            "Run Icecrown Citadel raid"
        }
    },
    {
        name = "The Scale of the Sands",
        side = "Neutral",
        zones = {"Mount Hyjal"},
        category = "Burning Crusade",
        quartermaster_location = "Hyjal Summit, Caverns of Time",
        farming_methods = {
            "Run Hyjal Summit raid"
        }
    },
    {
        name = "The Silver Covenant",
        side = "Alliance",
        zones = {"Icecrown", "Dalaran"},
        category = "Wrath of the Lich King",
        quartermaster_location = "Argent Tournament Grounds, Icecrown",
        farming_methods = {
            "Participate in Argent Tournament dailies",
            "Complete faction-specific activities"
        }
    },
    {
        name = "Kirin Tor Offensive",
        side = "Neutral",
        zones = {"Isle of Thunder"},
        category = "Mists of Pandaria",
        quartermaster_location = "Isle of Thunder",
        farming_methods = {
            "Complete daily quests and storyline on Isle of Thunder"
        }
    },
    {
        name = "Old Hillpaw",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Old Hillpaw items he likes, such as grains or food"
        }
    },
    {
        name = "The Avowed",
        side = "Neutral",
        zones = {"Revendreth"},
        category = "Shadowlands",
        quartermaster_location = "Halls of Atonement, Revendreth",
        farming_methods = {
            "Farm mobs in Halls of Atonement",
            "Complete daily quests for The Avowed"
        }
    },
    {
        name = "Exodar",
        side = "Alliance",
        zones = {"Azuremyst Isle"},
        category = "Classic",
        quartermaster_location = "The Exodar, Azuremyst Isle",
        farming_methods = {
            "Complete quests in Azuremyst Isle",
            "Turn in cloth for reputation",
            "Run low-level dungeons as Alliance"
        }
    },
    {
        name = "Glimmerogg Racer",
        side = "Neutral",
        zones = {"Zaralek Cavern"},
        category = "Dragonflight",
        quartermaster_location = "Glimmerogg, Zaralek Cavern",
        farming_methods = {
            "Participate in racing events in Zaralek Cavern",
            "Complete Glimmerogg quests"
        }
    },
    {
        name = "Haohan Mudclaw",
        side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily quests to increase friendship",
            "Gift Haohan items he likes, such as vegetables or drinks"
        }
    },
    {
        name = "Tushui Pandaren",
        side = "Alliance",
        zones = {"The Wandering Isle"},
        category = "Faction",
        quartermaster_location = "Stormwind City, Elwynn Forest",
        farming_methods = {
            "Complete faction-related activities",
            "Run dungeons as Alliance"
        }
    },
    {
        name = "Stormpike Guard",
        side = "Alliance",
        zones = {"Alterac Valley"},
        category = "PvP",
        quartermaster_location = "Stormpike Base, Alterac Valley",
        farming_methods = {
            "Participate in Alterac Valley battlegrounds",
            "Turn in battleground tokens for reputation"
        }
    },
    {
        name = "Bizmo's Brawlpub (Season 1)",
        faction_side = "Alliance",
        zones = {"Bizmo's Brawlpub, Deeprun Tram"},
        category = "PvP",
        quartermaster_location = "Bizmo's Brawlpub, Deeprun Tram",
        farming_methods = {
            "Participate in Brawler's Guild fights during Season 1",
            "Complete achievements and challenges for rewards"
        }
    },
    {
        name = "Wrynn's Vanguard",
        faction_side = "Alliance",
        zones = {"Ashran"},
        category = "PvP",
        quartermaster_location = "Stormshield, Ashran",
        farming_methods = {
            "Participate in Ashran battles",
            "Complete PvP quests in Ashran"
        }
    },
    {
        name = "Bizmo's Brawlpub (Season 2)",
        faction_side = "Alliance",
        zones = {"Bizmo's Brawlpub, Deeprun Tram"},
        category = "PvP",
        quartermaster_location = "Bizmo's Brawlpub, Deeprun Tram",
        farming_methods = {
            "Participate in Brawler's Guild fights during Season 2",
            "Complete achievements and challenges for rewards"
        }
    },
    {
        name = "The League of Arathor",
        faction_side = "Alliance",
        zones = {"Arathi Basin"},
        category = "PvP",
        quartermaster_location = "Refuge Pointe, Arathi Highlands",
        farming_methods = {
            "Participate in Arathi Basin battlegrounds",
            "Turn in battleground tokens for reputation"
        }
    },
    {
        name = "Silverwing Sentinels",
        faction_side = "Alliance",
        zones = {"Warsong Gulch"},
        category = "PvP",
        quartermaster_location = "Silverwing Grove, Ashenvale",
        farming_methods = {
            "Participate in Warsong Gulch battlegrounds",
            "Turn in battleground tokens for reputation"
        }
    },
    {
        name = "Wintersaber Trainers",
        faction_side = "Alliance",
        zones = {"Winterspring"},
        category = "Quest",
        quartermaster_location = "Frostsaber Rock, Winterspring",
        farming_methods = {
            "Complete repeatable quests for the Wintersaber Trainers"
        }
    },
    {
        name = "Tina Mudclaw",
        faction_side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily friendship quests for Tina Mudclaw",
            "Gift Tina items she likes, such as furniture or drinks"
        }
    },
    {
        name = "Nat Pagle",
        faction_side = "Neutral",
        zones = {"Krasarang Wilds"},
        category = "Fishing",
        quartermaster_location = "Anglers Wharf, Krasarang Wilds",
        farming_methods = {
            "Complete daily fishing quests",
            "Catch rare fish and turn them in to Nat Pagle"
        }
    },
    {
        name = "Talonpriest Ishaal",
        faction_side = "Neutral",
        zones = {"Spires of Arak"},
        category = "Quest",
        quartermaster_location = "Shadowmoon Valley or Spires of Arak",
        farming_methods = {
            "Complete Talonpriest Ishaal's quests",
            "Participate in Shadowmoon or Arak storylines"
        }
    },
    {
        name = "Everlook",
        faction_side = "Neutral",
        zones = {"Winterspring"},
        category = "Classic",
        quartermaster_location = "Everlook, Winterspring",
        farming_methods = {
            "Complete quests for the Steamwheedle Cartel",
            "Kill enemies hostile to the Cartel"
        }
    },
    {
        name = "Sho",
        faction_side = "Neutral",
        zones = {"Valley of the Four Winds"},
        category = "Mists of Pandaria",
        quartermaster_location = "Halfhill Market, Valley of the Four Winds",
        farming_methods = {
            "Complete daily friendship quests for Sho",
            "Gift Sho items she likes, such as food or drinks"
        }
    },
    {
        name = "Shang Xi's Academy",
        faction_side = "Neutral",
        zones = {"The Wandering Isle"},
        category = "Starting Zone",
        quartermaster_location = "Shang Xi's Academy, The Wandering Isle",
        farming_methods = {
            "Complete storyline quests on the Wandering Isle"
        }
    },
    {
        name = "Sha'tari Skyguard",
        faction_side = "Neutral",
        zones = {"Terokkar Forest", "Blade's Edge Mountains"},
        category = "Quest",
        quartermaster_location = "Blackwing Landing, Terokkar Forest",
        farming_methods = {
            "Complete daily quests for the Sha'tari Skyguard",
            "Farm mobs in Skettis for Apexis Shards"
        }
    },
    {
        name = "Delvar Ironfist",
        faction_side = "Neutral",
        zones = {"Shadowmoon Valley"},
        category = "Follower",
        quartermaster_location = "Lunarfall Garrison, Shadowmoon Valley",
        farming_methods = {
            "Complete quests to recruit Delvar Ironfist as a Garrison follower"
        }
    }
}

_G["RepHubFactionsAdditionalInfo"] = factionsAdditionalInfo