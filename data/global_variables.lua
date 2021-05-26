-------------------------------------------
-- Creates all global variables for DATA --
-------------------------------------------

-- Holds all the data filled by the data luas
MTSL_DATA = {
    -- Extra rank in TBC 300 - 375
    -- Each profession has 5 ranks to learn (1-75, 75-150, 150-225, 225-300, 300-375), except poisons (only 1)
    ["AMOUNT_RANKS"] = {
        ["Alchemy"] = 4,
        ["Blacksmithing"] = 4,
        ["Cooking"] = 4,
        ["Enchanting"] = 4,
        ["Engineering"] = 4,
        ["First Aid"] = 5,
        ["Fishing"] = 5,
        ["Herbalism"] = 4,
        ["Leatherworking"] = 4,
        ["Mining"] = 4,
        ["Poisons"] = 1,
        ["Skinning"] = 5,
        ["Tailoring"] = 4,
    },
    -- Counters keeping track of total amount of skill (this includes AMOUNT_RANKS)
    ["AMOUNT_SKILLS"] = {},
    MIN_PATCH_LEVEL = 1,
    MAX_PATCH_LEVEL = 5,
    CURRENT_PATCH_LEVEL = 1,
    -- Phases by id: Karazhan, Tempest Keep, Black Temple, Zul'Aman, Sunwell Plateau
    PHASE_IDS = { 3457, 3845, 3959 ,3805, 4075 }
}