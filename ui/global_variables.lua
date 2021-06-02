-----------------------------------------
-- Creates all global variables for UI --
-----------------------------------------

-- holds all info about the addon itself
MTSLUI_ADDON = {
    AUTHOR = "Thumbkin",
    NAME = "Missing TradeSkills List (TBC)",
    VERSION = "2.5.02",
    SERVER_VERSION_PHASES = {
        -- max build number from server for phase 1,
        {
            ["id"] = 1,
            ["max_tocversion"] = 20501,
        },
        {
            ["id"] = 2,
            ["max_tocversion"] = 20502,
        },
        {
            ["id"] = 3,
            ["max_tocversion"] = 20503,
        },
        {
            ["id"] = 4,
            ["max_tocversion"] = 20504,
        },
        {
            ["id"] = 5,
            ["max_tocversion"] = 20505,
        }
    }
}

-- holds the icons of the professions
MTSLUI_ICONS_PROFESSION = {
    -- Primary professions
    ["Alchemy"] = "136240",
    ["Blacksmithing"] = "136241",
    ["Enchanting"] = "136244",		-- craft
    ["Engineering"] = "136243",
    ["Herbalism"] = "136065",
    ["Jewelcrafting"] = "134071",   -- New for TBC
    ["Leatherworking"] = "133611",
    ["Mining"] = "136248",
    ["Skinning"] = "134366",
    ["Tailoring"] = "136249",
    -- Secondary professions
    ["Cooking"] = "133971",
    ["First Aid"] = "135966",
    ["Fishing"] = "136245",
    -- Rogue only
    ["Poisons"] =  "136242",
}

MTSLUI_ADDON_PATH = "Interface\\AddOns\\MissingTradeSkillsList_TBC"