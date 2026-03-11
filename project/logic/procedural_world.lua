-- Procedural World Generator
-- Builds an entire world from code: terrain, trees, houses, towers, lake, bridge
-- Uses: spawn_ex, mesh.create, all 6 procedural shapes, real textures

local generated = false
local entity_count = 0
local phase = 0
local phase_timer = 0
local phases_done = {}
local GRID = 16        -- terrain grid size (GRID x GRID)
local CELL = 2.5       -- cell spacing
local time = 0

-- Simple 2D noise using sine harmonics (no external libs needed)
function noise2d(x, z)
    return math.sin(x * 0.3) * math.cos(z * 0.25) * 3.0
         + math.sin(x * 0.7 + 2.1) * math.cos(z * 0.6 + 1.3) * 1.5
         + math.cos(x * 0.15 + z * 0.12) * 5.0
end

function spawn_id(base)
    entity_count = entity_count + 1
    return base .. "_" .. entity_count
end

-- =========================================================================
-- PHASE 1: Terrain — grid of cubes with textured materials by height
-- =========================================================================
function generate_terrain()
    for gx = -GRID, GRID do
        for gz = -GRID, GRID do
            local wx = gx * CELL
            local wz = gz * CELL
            local h = noise2d(gx, gz)

            -- Textured materials by height band
            local mat = "assets/materials/grass_tex.yaml"
            if h < -2 then
                mat = "assets/materials/stone_tex.yaml"     -- deep = dark stone
            elseif h < 1 then
                mat = "assets/materials/grass_tex.yaml"     -- low = grass
            elseif h < 4 then
                mat = "assets/materials/stone_tex.yaml"     -- mid = rock
            else
                mat = "assets/materials/snow_tex.yaml"      -- high = snow
            end

            local col_h = math.max(0.5, math.abs(h) + 0.5)
            entity.spawn_ex({
                id = spawn_id("terrain"),
                mesh = "procedural:cube",
                material = mat,
                position = {wx, h / 2 - 0.25, wz},
                scale = {CELL * 0.5, col_h, CELL * 0.5},
                collider = {
                    shape = "box",
                    half_extents = {CELL * 0.5, col_h * 0.5, CELL * 0.5},
                    friction = 0.7,
                },
            })
        end
    end
end

-- =========================================================================
-- PHASE 2: Trees — cylinder trunk (wood) + cone canopy (grass)
-- =========================================================================
function generate_trees()
    math.randomseed(42)
    for i = 1, 80 do
        local gx = math.random(-GRID + 2, GRID - 2)
        local gz = math.random(-GRID + 2, GRID - 2)
        local h = noise2d(gx, gz)

        -- Only place trees on grassy terrain
        if h >= -1 and h < 3 then
            local wx = gx * CELL + (math.random() - 0.5) * CELL
            local wz = gz * CELL + (math.random() - 0.5) * CELL
            local trunk_h = 1.5 + math.random() * 1.5
            local canopy_h = 1.2 + math.random() * 1.0
            local canopy_r = 0.8 + math.random() * 0.6

            -- Trunk (cylinder, wood texture)
            entity.spawn_ex({
                id = spawn_id("trunk"),
                mesh = "procedural:cylinder",
                material = "assets/materials/wood_tex.yaml",
                position = {wx, h + trunk_h / 2, wz},
                scale = {0.2, trunk_h, 0.2},
            })

            -- Canopy (cone, grass texture)
            entity.spawn_ex({
                id = spawn_id("canopy"),
                mesh = "procedural:cone",
                material = "assets/materials/grass_tex.yaml",
                position = {wx, h + trunk_h + canopy_h * 0.4, wz},
                scale = {canopy_r, canopy_h, canopy_r},
            })
        end
    end
end

-- =========================================================================
-- PHASE 3: Village — houses (stone walls) + roofs (wood)
-- =========================================================================
function generate_village()
    local village_spots = {
        {3, 2}, {5, 3}, {4, 5}, {6, 5}, {2, 4}, {7, 2}, {5, 7},
    }
    for _, spot in ipairs(village_spots) do
        local gx, gz = spot[1], spot[2]
        local h = noise2d(gx, gz)
        local wx = gx * CELL
        local wz = gz * CELL
        local bw = 1.5 + math.random() * 1.0
        local bh = 1.5 + math.random() * 1.5
        local bd = 1.5 + math.random() * 1.0

        -- House body (cube, stone texture)
        entity.spawn_ex({
            id = spawn_id("house"),
            mesh = "procedural:cube",
            material = "assets/materials/stone_tex.yaml",
            position = {wx, h + bh / 2, wz},
            scale = {bw, bh, bd},
            collider = {
                shape = "box",
                half_extents = {bw * 0.5, bh * 0.5, bd * 0.5},
            },
        })

        -- Roof (cone, wood texture)
        entity.spawn_ex({
            id = spawn_id("roof"),
            mesh = "procedural:cone",
            material = "assets/materials/wood_tex.yaml",
            position = {wx, h + bh + 0.6, wz},
            scale = {bw * 0.8, 1.2, bd * 0.8},
        })
    end
end

-- =========================================================================
-- PHASE 4: Towers — stone cylinders with torus rings
-- =========================================================================
function generate_towers()
    local tower_spots = {{-8, -6}, {10, -8}, {-10, 8}}
    for _, spot in ipairs(tower_spots) do
        local gx, gz = spot[1], spot[2]
        local h = noise2d(gx, gz)
        local wx = gx * CELL
        local wz = gz * CELL
        local tower_h = 8 + math.random() * 4

        -- Tower body (cylinder, stone texture)
        entity.spawn_ex({
            id = spawn_id("tower"),
            mesh = "procedural:cylinder",
            material = "assets/materials/stone_tex.yaml",
            position = {wx, h + tower_h / 2, wz},
            scale = {1.2, tower_h, 1.2},
            collider = {
                shape = "box",
                half_extents = {1.2, tower_h * 0.5, 1.2},
            },
        })

        -- Decorative rings (torus)
        for ring = 1, 3 do
            local ry = h + tower_h * ring / 4
            entity.spawn_ex({
                id = spawn_id("ring"),
                mesh = "procedural:torus",
                material = "assets/materials/pbr_M4_R0.yaml",
                position = {wx, ry, wz},
                scale = {1.6, 0.3, 1.6},
            })
        end

        -- Sphere beacon on top (snow/ice look)
        entity.spawn_ex({
            id = spawn_id("beacon"),
            mesh = "procedural:sphere",
            material = "assets/materials/snow_tex.yaml",
            position = {wx, h + tower_h + 0.8, wz},
            scale = {0.6, 0.6, 0.6},
        })
    end
end

-- =========================================================================
-- PHASE 5: Lake — flat plane with water texture
-- =========================================================================
function generate_lake()
    entity.spawn_ex({
        id = spawn_id("lake"),
        mesh = "procedural:plane",
        material = "assets/materials/water_tex.yaml",
        position = {-8 * CELL, -1.5, -3 * CELL},
        scale = {12, 1, 10},
    })
end

-- =========================================================================
-- PHASE 6: Custom mesh — arched bridge (wood texture + mesh.create)
-- =========================================================================
function generate_bridge()
    local verts = {}
    local indices = {}
    local uvs = {}
    local segments = 12
    local width = 1.5
    local span = 8
    local arch_height = 2.0

    for i = 0, segments do
        local t = i / segments
        local x = (t - 0.5) * span
        local y = math.sin(t * math.pi) * arch_height
        local u = t

        verts[#verts + 1] = {x, y, -width / 2}
        uvs[#uvs + 1] = {u, 0}
        verts[#verts + 1] = {x, y, width / 2}
        uvs[#uvs + 1] = {u, 1}
    end

    for i = 0, segments - 1 do
        local bl = i * 2
        local br = i * 2 + 1
        local tl = (i + 1) * 2
        local tr = (i + 1) * 2 + 1
        indices[#indices + 1] = bl
        indices[#indices + 1] = tl
        indices[#indices + 1] = br
        indices[#indices + 1] = br
        indices[#indices + 1] = tl
        indices[#indices + 1] = tr
    end

    mesh.create("bridge", verts, indices, uvs)

    -- Place bridge over the lake (wood texture)
    entity.spawn_ex({
        id = spawn_id("bridge"),
        mesh = "runtime:bridge",
        material = "assets/materials/wood_tex.yaml",
        position = {-8 * CELL, -0.5, -3 * CELL},
        scale = {2, 1.5, 2},
        collider = {
            shape = "box",
            half_extents = {8, 0.3, 1.5},
        },
    })
end

-- =========================================================================
-- Phased generation — build world gradually for visual effect
-- =========================================================================
function init()
    phase = 1
    phase_timer = 0
end

function update(dt)
    time = time + dt
    phase_timer = phase_timer + dt

    -- Generate one phase per frame-ish to avoid a massive stutter
    if phase == 1 and not phases_done[1] then
        generate_terrain()
        phases_done[1] = true
        phase = 2
    elseif phase == 2 and phase_timer > 0.1 and not phases_done[2] then
        generate_trees()
        phases_done[2] = true
        phase = 3
    elseif phase == 3 and phase_timer > 0.2 and not phases_done[3] then
        generate_village()
        phases_done[3] = true
        phase = 4
    elseif phase == 4 and phase_timer > 0.3 and not phases_done[4] then
        generate_towers()
        phases_done[4] = true
        phase = 5
    elseif phase == 5 and phase_timer > 0.4 and not phases_done[5] then
        generate_lake()
        phases_done[5] = true
        phase = 6
    elseif phase == 6 and phase_timer > 0.5 and not phases_done[6] then
        generate_bridge()
        phases_done[6] = true
        phase = 7
    end

    -- === UI ===
    if ui then
        ui.text(20, 20, "Procedural World", 28, 1, 1, 1, 1)
        ui.text(20, 54, "Textured world generated entirely from Lua", 14, 0.7, 0.8, 1.0, 1)
        ui.text(20, 74, "WASD to fly | Space up | E down | Shift sprint", 14, 0.5, 0.5, 0.5, 1)

        local status = ""
        if phase <= 6 then
            local names = {"Terrain", "Trees", "Village", "Towers", "Lake", "Bridge"}
            status = "Generating: " .. (names[phase] or "...")
        else
            status = "World complete! " .. entity_count .. " entities"
        end
        ui.text(20, 100, status, 16, 0.6, 1.0, 0.6, 1)

        -- Phase checklist
        local checks = {
            "Terrain — grass/stone/snow textures",
            "Trees — wood trunks + grass canopy",
            "Village — stone walls + wood roofs",
            "Towers — stone + metallic rings",
            "Lake — water texture",
            "Bridge — wood texture + mesh.create",
        }
        for i, name in ipairs(checks) do
            local done = phases_done[i] or false
            local mark = done and "[x]" or "[ ]"
            local r = done and 0.5 or 0.3
            local g = done and 1.0 or 0.3
            local b = done and 0.5 or 0.3
            ui.text(20, 120 + i * 18, mark .. " " .. name, 13, r, g, b, 1)
        end
    end
end
