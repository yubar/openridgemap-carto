-- For documentation of Lua tag transformations, see:
-- https://github.com/openstreetmap/osm2pgsql/blob/master/docs/lua.md

-- Objects with any of the following keys will be treated as polygon
local polygon_keys = {
    'abandoned:aeroway',
    'abandoned:amenity',
    'abandoned:building',
    'abandoned:landuse',
    'abandoned:power',
    'aeroway',
    'amenity',
    'area:highway',
    'building',
    'building:part',
    'harbour',
    'historic',
    'landuse',
    'leisure',
    'man_made',
    'military',
    'natural',
    'office',
    'place',
    'power',
    'public_transport',
    'shop',
    'tourism',
    'water',
    'waterway',
    'wetland'
}

-- Objects with any of the following key/value combinations will be treated as linestring
local linestring_values = {
    historic = {citywalls = true},
    leisure = {track = true, slipway = true},
    man_made = {embankment = true, breakwater = true, groyne = true},
    natural = {cliff = true, tree_row = true, ridge = true, arete = true},
    power = {line = true, minor_line = true},
    waterway = {canal = true, derelict_canal = true, ditch = true, drain = true, river = true, stream = true, wadi = true, weir = true}
}

-- Objects with any of the following key/value combinations will be treated as polygon
local polygon_values = {
    highway = {services = true, rest_area = true},
    junction = {yes = true}
}

local keep_tags = {
    landuse = {'reservoir', 'basin'},
    natural = {'ridge', 'arete', 'saddle', 'peak', 'volcano', 'water', 'glacier'},
    waterway = {'river','canal', 'stream', 'drain', 'ditch', 'wadi'},
    int_intermittent = '*',
    mountain_pass = '*',
    rtsa_scale = '*',
    ele = '*',
    ref = '*',
    name = '*',
    type = '*'
}

function contains(table, key, value)
    if table[key] == nil then return false 
        elseif table[key] == '*' then return true
    end

    for _, v in ipairs(table[key]) do
        if value == v then return true end
    end

    return false
end

function tprintf(t, filename, params)
    file = io.open(filename, params)
    for k, v in pairs(t) do
         --print(k, v) 
         file:write(k, '\t', v, '\n')
    end
    file:close()
end

--- Generic filtering of OSM tags
-- @param tags Raw OSM tags
-- @return Filtered OSM tags
function filter_tags_generic(tags)
    -- Short-circuit for untagged objects
    if next(tags) == nil then
        return 1, {}
    end

    -- Delete all tags except listed in keep_tags
    for k, v in pairs(tags) do
        if not contains(keep_tags, k, v) then tags[k] = nil end
    end

    if tags["type"] == "ridge" then tags["type"] = "route" end

   -- Filter out objects that have no tags after deleting
    if next(tags) == nil then
        return 1, {}
    end

    return 0, tags
end

-- Filtering on nodes
function filter_tags_node (keyvalues, numberofkeys)
    return filter_tags_generic(keyvalues)
end

-- Filtering on relations
function filter_basic_tags_rel (keyvalues, numberofkeys)
    -- Filter out objects that are filtered out by filter_tags_generic
    local filter, keyvalues = filter_tags_generic(keyvalues)
    if filter == 1 then
        return 1, keyvalues
    end

    return 0, keyvalues
end

-- Filtering on ways
function filter_tags_way (keyvalues, numberofkeys)
    local filter = 0  -- Will object be filtered out?
    local polygon = 0 -- Will object be treated as polygon?

    -- Filter out objects that are filtered out by filter_tags_generic
    filter, keyvalues = filter_tags_generic(keyvalues)
    if filter == 1 then
        return filter, keyvalues, polygon, roads
    end

    polygon = isarea(keyvalues)

    return filter, keyvalues, polygon, 0
end

--- Handling for relation members and multipolygon generation
-- @param keyvalues OSM tags, after processing by relation transform
-- @param keyvaluemembers OSM tags of relation members, after processing by way transform
-- @param roles OSM roles of relation members
-- @param membercount number of members
-- @return filter, cols, member_superseded, boundary, polygon, roads
function filter_tags_relation_member (keyvalues, keyvaluemembers, roles, membercount)
    local members_superseded = {}

    -- Start by assuming that this not an old-style MP
    for i = 1, membercount do
        members_superseded[i] = 0
    end

    local type = keyvalues["type"]
    local name = keyvalues["name"]
    if not name then name = '' end
    if type ~= 'multipolygon' then
        file = io.open('/home/yb/src/tmp/out.txt', 'a')
      --  for k, v in pairs(keyvalues) do
             --print(k, v) 
             file:write(type, '\t', name, '\n')
        --end
        file:close()
    end

    -- Remove type key
    keyvalues["type"] = nil

    if type == 'ridge' then tprintf(keyvalues, '/home/yb/src/tmp/out.txt', 'a') end

    -- Filter out relations with just a type tag or no tags
    if next(keyvalues) == nil then
        return 1, keyvalues, members_superseded, 0, 0, 0
    end

    if type == "boundary" or (type == "multipolygon" and keyvalues["boundary"]) then
        return 0, keyvalues, members_superseded, 1, 0, 0
    -- For multipolygons...
    elseif (type == "multipolygon") then
        -- Multipolygons by definition are polygons, so we know roads = linestring = 0, polygon = 1
        return 0, keyvalues, members_superseded, 0, 1, 0
    elseif type == "route" then
        return 0, keyvalues, members_superseded, 1, 0, 0
    elseif type == "ridge" then
        return 0, keyvalues, members_superseded, 1, 0, 0
    end

    -- Unknown type of relation or no type tag
    return 0, keyvalues, members_superseded, 0, 0, 0
end

--- Check if an object with given tags should be treated as polygon
-- @param tags OSM tags
-- @return 1 if area, 0 if linear
function isarea (tags)
    -- Treat objects tagged as area=yes polygon, other area as no
    if tags["area"] then
        return tags["area"] == "yes" and 1 or 0
    end

   -- Search through object's tags
    for k, v in pairs(tags) do
        -- Check if it has a polygon key and not a linestring override, or a polygon k=v
        for _, ptag in ipairs(polygon_keys) do
            if k == ptag and not (linestring_values[k] and linestring_values[k][v]) then
                return 1
            end
        end

        if (polygon_values[k] and polygon_values[k][v]) then
            return 1
        end
    end
    return 0
end

