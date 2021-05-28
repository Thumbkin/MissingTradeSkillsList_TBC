
function print_combo_profession_rank()
    MTSL_DATA= {}

    PROFESSION_RANKS = {}
    require("./data/professions")
    require("./data/profession_ranks")

    for _, p in pairs(MTSL_DATA["professions"]) do
        PROFESSION_RANKS[p.name.English] = {}
        for _, r in pairs(MTSL_DATA["profession_ranks"]) do
            level = {
                ["id"] = r.id,
                ["max_skill"] = 375,
                ["min_skill"] = 275,
                ["min_xp_level"] = 45,
                ["name"] = {},
                ["phase"] = 1,
                ["rank"] = r.id,
                ["trainers"] = {
                    ["price"] = 100000,
                    ["sources"] = {
                    },
                },
            }
            -- Add name for each language
            for l, v in pairs(r["name"]) do
                level["name"][l] = p["name"][l] .. " (" .. v .. ")"
            end

            -- sort name table
            table.sort(level["name"], function(a, b) return a < b end)
            table.sort(level, function(a, b) return a < b end)

            table.insert(PROFESSION_RANKS[p.name.English], level)
            table.sort(PROFESSION_RANKS[p.name.English], function (a, b) return a.id < b.id end)
        end
    end

    -- print the table to output
    print(DEBUGGER:array_to_string('', '', PROFESSION_RANKS))
end

DEBUGGER = {
    string_starts_with = function(self, str, start)
        return str:sub(1, #start) == start
    end,

    array_to_string = function(self, current_tab, array_key, array_to_convert)
        local to_string = current_tab .. '{\n'
        if array_key ~= nil and array_key ~= "" and type(array_key) ~= "number" then
            if self:string_starts_with(array_key, "MTSL_DATA") then
                to_string = array_key .. ' = {\n'
            else
                to_string = current_tab .. '["' .. array_key .. '"] = {\n'
            end
        end

        local next_tab = current_tab .. '\t'
        -- loop all the keys in the array
        keys = {}
        for k, v in pairs(array_to_convert) do
            table.insert(keys, k)
        end
        -- sort the keys in an alphabetical order
        table.sort(keys)

        for _, k in pairs(keys) do
            v = array_to_convert[k]
            -- its an array/table of its own
            if type(v) == "table" or type(v) == "array" then
                -- sort the content by id if possible
                if v.id then
                    table.sort(v, function(a, b)
                        return a.id < b.id
                    end)
                end
                to_string = to_string .. self:array_to_string(next_tab, k, v)
                -- index is a number (so dont add it in the lua)
            else
                if type(k) == "number" then
                    if type(v) == "number" then
                        to_string = to_string .. next_tab .. v .. ', -- [' .. k .. ']\n'
                    else
                        to_string = to_string .. next_tab .. '"' .. v .. '", -- [' .. k .. ']\n'
                    end
                    -- index a string so add named index in lua
                else
                    if type(v) == "number" then
                        to_string = to_string .. next_tab .. '["' .. k .. '"] = ' .. v .. ',\n'
                    else
                        to_string = to_string .. next_tab .. '["' .. k .. '"] = "' .. string.gsub(v, "\"", "\\\"") .. '",\n'
                    end
                end
            end
        end
        -- if array key is number add the number as comment on the line
            if type(array_key) == "number" or not self:string_starts_with(array_key, "MTSL_DATA") then
                to_string = to_string .. current_tab .. '},\n'
            else
                to_string = to_string .. current_tab .. '}\n'
            end
        return to_string
    end
}

print_combo_profession_rank()