-- wendigo_demo.lua
-- Thunderwalker MVP Demo — Wendigo boss behavior
--
-- AI loop:
--   patrol  → detect player (dist < 30) → convergence (chase + attack)
--   convergence → phase2 trigger at 50% HP
--   phase2  → faster, bigger, more aggressive
--
-- Uses only the APIs confirmed in CLAUDE.md / existing scripts:
--   entity.get_position, entity.set_position, entity.get_health,
--   entity.damage, entity.destroy, events.emit, log, ui.text, ui.rect,
--   camera.world_to_screen, input.just_pressed

-- ─────────────────────────────────────────────────────────────────────────
-- Constants
-- ─────────────────────────────────────────────────────────────────────────
local DETECT_RANGE     = 30.0
local ATTACK_RANGE     = 3.5
local PHASE2_RANGE     = 5.0   -- slightly longer reach in phase 2
local PATROL_SPEED     = 1.4
local CONVERGE_SPEED   = 2.5
local PHASE2_SPEED     = 3.5
local ATTACK_INTERVAL  = 1.8
local PHASE2_INTERVAL  = 1.2
local ATTACK_DAMAGE    = 18
local PHASE2_DAMAGE    = 28
local PATROL_HALF      = 8.0   -- patrol half-width (side to side)
local PHASE2_THRESHOLD = 0.50  -- 50 % health triggers phase 2

-- ─────────────────────────────────────────────────────────────────────────
-- init()  — called once when the entity is spawned
-- ─────────────────────────────────────────────────────────────────────────
function init()
    self.state           = "patrol"
    self.phase           = 1
    self.attack_cooldown = 0
    self.patrol_timer    = 0
    self.patrol_dir      = 1
    self.phase2_entered  = false
    log("[Wendigo] Spawned — patrol state, 200 HP")
    log("[Wendigo] Stalking the frozen creek...")
end

-- ─────────────────────────────────────────────────────────────────────────
-- update(dt)  — called every frame
-- ─────────────────────────────────────────────────────────────────────────
function update(dt)
    -- Fetch positions
    local wx, wy, wz = entity.get_position(_entity_string_id)
    local px, py, pz = entity.get_position("player")

    -- Distance (XZ plane)
    local dx = px - wx
    local dz = pz - wz
    local dist = math.sqrt(dx * dx + dz * dz)

    -- Cooldown tick
    if self.attack_cooldown > 0 then
        self.attack_cooldown = self.attack_cooldown - dt
    end

    -- ── HP check for phase 2 transition ──────────────────────────────────
    local hp, max_hp = entity.get_health(_entity_string_id)
    if hp ~= nil and max_hp ~= nil and max_hp > 0 then
        local hp_ratio = hp / max_hp
        if hp_ratio <= PHASE2_THRESHOLD and not self.phase2_entered then
            self.phase2_entered = true
            self.phase          = 2
            self.state          = "phase2"
            log("[Wendigo] PHASE 2 — The Wendigo grows. It remembers what it was.")
            events.emit("wendigo.phase2", {entity_id = _entity_string_id, hp = hp})
        end
    end

    -- ── State machine ─────────────────────────────────────────────────────
    if self.state == "patrol" then
        -- Side-to-side patrol until player detected
        self.patrol_timer = self.patrol_timer + dt
        if self.patrol_timer > 3.5 then
            self.patrol_timer = 0
            self.patrol_dir   = -self.patrol_dir
        end

        local step = PATROL_SPEED * dt * self.patrol_dir
        -- Clamp patrol to half-width from spawn X (approx 0)
        local new_x = wx + step
        if new_x >  PATROL_HALF then new_x =  PATROL_HALF; self.patrol_dir = -1 end
        if new_x < -PATROL_HALF then new_x = -PATROL_HALF; self.patrol_dir =  1 end
        entity.set_position(_entity_string_id, new_x, wy, wz)

        -- Detection
        if dist < DETECT_RANGE then
            self.state = "convergence"
            log("[Wendigo] It stops. It has decided.")
            events.emit("wendigo.detected_player", {dist = dist})
        end

    elseif self.state == "convergence" then
        -- Move toward player
        if dist > 0.5 then
            local nx = dx / dist
            local nz = dz / dist
            local spd = CONVERGE_SPEED * dt
            entity.set_position(_entity_string_id,
                wx + nx * spd, wy, wz + nz * spd)
        end

        -- Melee attack
        if dist < ATTACK_RANGE and self.attack_cooldown <= 0 then
            self.attack_cooldown = ATTACK_INTERVAL
            entity.damage("player", ATTACK_DAMAGE)
            log("[Wendigo] Freeze-grab! Player takes " .. ATTACK_DAMAGE .. " damage.")
            events.emit("wendigo.attack", {damage = ATTACK_DAMAGE, type = "freeze_grab"})
        end

    elseif self.state == "phase2" then
        -- Brief pause — announce, then switch to phase2_combat
        log("[Wendigo] (growing, bones cracking, frost thickening...)")
        self.state = "phase2_combat"

    elseif self.state == "phase2_combat" then
        -- Faster chase
        if dist > 0.5 then
            local nx = dx / dist
            local nz = dz / dist
            local spd = PHASE2_SPEED * dt
            entity.set_position(_entity_string_id,
                wx + nx * spd, wy, wz + nz * spd)
        end

        -- Harder hits, wider reach
        if dist < PHASE2_RANGE and self.attack_cooldown <= 0 then
            self.attack_cooldown = PHASE2_INTERVAL
            entity.damage("player", PHASE2_DAMAGE)
            log("[Wendigo] Howl of Winter! Player takes " .. PHASE2_DAMAGE .. " damage.")
            events.emit("wendigo.attack", {damage = PHASE2_DAMAGE, type = "howl_strike"})
        end

    elseif self.state == "dead" then
        -- Nothing — entity pending removal
        return
    end

    -- ── HUD: health bar above Wendigo ─────────────────────────────────────
    local sx, sy, visible = camera.world_to_screen(wx, wy + 5.0, wz)
    if visible then
        local hp2, max_hp2 = entity.get_health(_entity_string_id)
        if hp2 ~= nil and max_hp2 ~= nil and hp2 < max_hp2 then
            local bar_w = 90
            local fill  = (hp2 / max_hp2) * bar_w
            ui.rect(sx - bar_w / 2, sy - 14, bar_w, 8, 0.1, 0.1, 0.1, 0.8)
            -- Phase 2 bar turns icy blue
            if self.phase == 2 then
                ui.rect(sx - bar_w / 2, sy - 14, fill, 8, 0.3, 0.6, 1.0, 0.95)
            else
                ui.rect(sx - bar_w / 2, sy - 14, fill, 8, 0.8, 0.2, 0.2, 0.95)
            end
            ui.text(sx - bar_w / 2, sy - 28, "WENDIGO", 11, 0.85, 0.85, 1.0, 1.0)
        end
    end

    -- ── Demo HUD overlay ──────────────────────────────────────────────────
    ui.text(20, 20, "THUNDERWALKER — First Hunt", 22, 0.7, 0.85, 1.0, 1.0)
    if self.phase == 2 then
        ui.text(20, 50, "PHASE 2 — Blizzard rises. Use fire.", 14, 0.4, 0.7, 1.0, 1.0)
    else
        local status = self.state
        ui.text(20, 50, "Wendigo: " .. status, 13, 0.6, 0.6, 0.8, 1.0)
    end
    ui.text(20, 70, "WASD: move  |  Mouse: look  |  LMB: attack  |  E: projectile", 12, 0.5, 0.5, 0.5, 1.0)
end

-- ─────────────────────────────────────────────────────────────────────────
-- on_damage / on_death  — Wendigo damage callbacks (not used here;
-- damage is polled via entity.get_health in update, which is the
-- pattern used by existing scripts in this codebase)
-- ─────────────────────────────────────────────────────────────────────────

function on_damage(amount, source_id)
    local hp, max_hp = entity.get_health(_entity_string_id)
    log("[Wendigo] Hit for " .. amount .. " by " .. source_id ..
        " — HP " .. (hp or "?") .. "/" .. (max_hp or "?"))

    -- Wake up from patrol immediately when hit
    if self.state == "patrol" then
        self.state = "convergence"
        log("[Wendigo] Hit triggers convergence.")
    end
end

function on_death()
    self.state = "dead"
    log("[Wendigo] Falls. The frost lifts.")
    events.emit("wendigo.died", {entity_id = _entity_string_id})
    entity.destroy(_entity_string_id)
end
