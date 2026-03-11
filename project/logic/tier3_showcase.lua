-- Tier 3: Visual & Interaction Showcase
-- Demonstrates: procedural meshes, spawn_ex, mouse picking, mesh.create

local spawned_count = 0
local pick_timer = 0
local shapes = { "procedural:cube", "procedural:sphere", "procedural:cylinder", "procedural:cone", "procedural:torus" }
local shape_names = { "Cube", "Sphere", "Cylinder", "Cone", "Torus" }
local picked_name = "none"
local picked_dist = 0
local custom_mesh_created = false
local spawn_cooldown = 0

function init()
    -- Create a custom diamond mesh via mesh.create
    local verts = {
        {0, 1.2, 0},     -- top
        {-0.6, 0, 0.6},  -- front-left
        {0.6, 0, 0.6},   -- front-right
        {0.6, 0, -0.6},  -- back-right
        {-0.6, 0, -0.6}, -- back-left
        {0, -1.2, 0},    -- bottom
    }

    local indices = {
        -- top pyramid
        0, 1, 2,
        0, 2, 3,
        0, 3, 4,
        0, 4, 1,
        -- bottom pyramid
        5, 2, 1,
        5, 3, 2,
        5, 4, 3,
        5, 1, 4,
    }

    local uvs = {
        {0.5, 0.0},
        {0.0, 0.5},
        {1.0, 0.5},
        {1.0, 0.5},
        {0.0, 0.5},
        {0.5, 1.0},
    }

    mesh.create("diamond", verts, indices, uvs)
    custom_mesh_created = true

    -- Spawn a row of rotating diamonds behind the gallery using spawn_ex
    for i = 1, 5 do
        local x = -8 + (i - 1) * 4
        entity.spawn_ex({
            id = "diamond_" .. i,
            mesh = "runtime:diamond",
            material = "procedural:default",
            position = {x, 3.5, -6},
            scale = {0.6, 0.6, 0.6},
        })
    end
end

function update(dt)
    spawn_cooldown = math.max(0, spawn_cooldown - dt)

    -- Rotate the diamonds
    for i = 1, 5 do
        local id = "diamond_" .. i
        local angle = (self.time or 0) * 60 + i * 72
        entity.set_rotation(id, 0, angle, 15)
    end
    self.time = (self.time or 0) + dt

    -- === Mouse picking: cast ray on left-click ===
    if input.just_pressed("fire") then
        local sx, sy = input.mouse_position()
        local ox, oy, oz, dx, dy, dz = camera.screen_to_ray(sx, sy)

        -- Raycast: check distance to gallery shapes
        local gallery = {
            {id = "shape_cube",     pos = {-10, 2, 0},   name = "Cube"},
            {id = "shape_sphere",   pos = {-6, 2.2, 0},  name = "Sphere"},
            {id = "shape_plane",    pos = {-2, 2, 0},     name = "Plane"},
            {id = "shape_cylinder", pos = {2, 2.2, 0},    name = "Cylinder"},
            {id = "shape_cone",     pos = {6, 2.2, 0},    name = "Cone"},
            {id = "shape_torus",    pos = {10, 2.2, 0},   name = "Torus"},
        }

        local best = nil
        local best_dist = 999

        for _, obj in ipairs(gallery) do
            -- Simple sphere intersection test (radius 1.0)
            local px, py, pz = obj.pos[1], obj.pos[2], obj.pos[3]
            local ex, ey, ez = px - ox, py - oy, pz - oz
            local a = dx * dx + dy * dy + dz * dz
            local b = 2 * (ex * dx + ey * dy + ez * dz)
            local c = ex * ex + ey * ey + ez * ez - 1.5 * 1.5
            local disc = b * b - 4 * a * c
            if disc >= 0 then
                local t = (-b - math.sqrt(disc)) / (2 * a)
                if t > 0 and t < best_dist then
                    best = obj
                    best_dist = t
                end
            end
        end

        if best then
            picked_name = best.name
            picked_dist = best_dist
            pick_timer = 2.0

            -- Spawn a bouncy ball at the picked location using spawn_ex with physics
            if spawn_cooldown <= 0 then
                spawned_count = spawned_count + 1
                entity.spawn_ex({
                    id = "picked_ball_" .. spawned_count,
                    mesh = "procedural:sphere",
                    material = "procedural:default",
                    position = {best.pos[1], best.pos[2] + 3, best.pos[3]},
                    scale = {0.3, 0.3, 0.3},
                    rigid_body = "dynamic",
                    collider = {
                        shape = "sphere",
                        radius = 0.15,
                        restitution = 0.8,
                        friction = 0.3,
                    },
                })
                spawn_cooldown = 0.3
            end
        else
            -- Click on empty space: spawn a random shape with physics
            if spawn_cooldown <= 0 then
                spawned_count = spawned_count + 1
                local t = 8  -- spawn 8 units along ray
                local sx2 = ox + dx * t
                local sy2 = math.max(oy + dy * t, 5)
                local sz2 = oz + dz * t
                local shape_idx = (spawned_count % #shapes) + 1

                entity.spawn_ex({
                    id = "freefall_" .. spawned_count,
                    mesh = shapes[shape_idx],
                    material = "procedural:default",
                    position = {sx2, sy2, sz2},
                    scale = {0.4, 0.4, 0.4},
                    rigid_body = "dynamic",
                    collider = {
                        shape = "sphere",
                        radius = 0.2,
                        restitution = 0.6,
                        friction = 0.4,
                    },
                })
                spawn_cooldown = 0.15
            end
        end
    end

    -- Fade pick timer
    if pick_timer > 0 then
        pick_timer = pick_timer - dt
    end

    -- === UI overlay ===
    if ui then
        ui.text(20, 20, "Tier 3: Visual & Interaction", 24, 1, 1, 1, 1)
        ui.text(20, 50, "6 Procedural Meshes + Custom Diamond (mesh.create)", 14, 0.7, 0.8, 1.0, 1)
        ui.text(20, 70, "Left-click to pick shapes (camera.screen_to_ray)", 14, 0.7, 0.8, 1.0, 1)
        ui.text(20, 90, "Clicking spawns physics objects (entity.spawn_ex)", 14, 0.7, 0.8, 1.0, 1)
        ui.text(20, 110, "WASD to move | Left-click to interact", 14, 0.5, 0.5, 0.5, 1)

        ui.text(20, 140, "Spawned: " .. spawned_count, 14, 0.6, 1.0, 0.6, 1)

        if pick_timer > 0 then
            local alpha = math.min(1.0, pick_timer)
            ui.text(20, 160, "Picked: " .. picked_name .. string.format(" (%.1fm)", picked_dist), 18, 1.0, 0.9, 0.3, alpha)
        end

        if custom_mesh_created then
            ui.text(20, 185, "Custom diamond mesh active (5 spinning behind gallery)", 12, 0.5, 0.7, 0.5, 1)
        end
    end
end
