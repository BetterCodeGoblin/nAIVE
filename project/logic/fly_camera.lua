-- Free-fly camera: WASD move, Space up, Ctrl down, Shift sprint, right-click look
function init()
    self.yaw = 0
    self.pitch = -15
    self.speed = 15
    self.sensitivity = 0.15
end

function update(dt)
    -- Mouse look (always active — no right-click gate needed with character_controller gone)
    local dx, dy = input.mouse_delta()
    self.yaw = self.yaw - dx * self.sensitivity
    self.pitch = math.max(-89, math.min(89, self.pitch - dy * self.sensitivity))
    entity.set_rotation(_entity_string_id, self.pitch, self.yaw, 0)

    -- Movement
    local speed = self.speed
    if input.pressed("sprint") then speed = speed * 3 end

    local rad = math.rad(self.yaw)
    local fx = -math.sin(rad)
    local fz = -math.cos(rad)
    local rx = math.cos(rad)
    local rz = -math.sin(rad)

    local mx, my, mz = 0, 0, 0
    if input.pressed("move_forward")  then mx = mx + fx; mz = mz + fz end
    if input.pressed("move_backward") then mx = mx - fx; mz = mz - fz end
    if input.pressed("move_left")     then mx = mx - rx; mz = mz - rz end
    if input.pressed("move_right")    then mx = mx + rx; mz = mz + rz end
    if input.pressed("jump")          then my = my + 1 end
    if input.pressed("interact")      then my = my - 1 end

    -- Normalize horizontal
    local len = math.sqrt(mx * mx + mz * mz)
    if len > 0 then mx = mx / len; mz = mz / len end

    local px, py, pz = entity.get_position(_entity_string_id)
    px = px + mx * speed * dt
    py = py + my * speed * dt
    pz = pz + mz * speed * dt
    entity.set_position(_entity_string_id, px, py, pz)
end
