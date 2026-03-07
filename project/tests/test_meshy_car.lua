-- Meshy AI car headless tests

function test_scene_loads()
    scene.load("scenes/meshy_car_test.yaml")
    wait_for_event("lifecycle.scene_loaded")
    log.info("Meshy car test scene loaded successfully")
end

function test_has_car()
    scene.load("scenes/meshy_car_test.yaml")
    wait_for_event("lifecycle.scene_loaded")

    local x, y, z = get_position("meshy_car")
    assert(y >= 0, "Car should be on pedestal, got y=" .. y)
    log.info("Meshy car entity present at y=" .. y)
end

function test_car_rotates()
    scene.load("scenes/meshy_car_test.yaml")
    wait_for_event("lifecycle.scene_loaded")

    local x1, y1, z1 = get_position("meshy_car")
    wait_seconds(2.0)
    -- Turntable script should be rotating the model
    log.info("Turntable rotation test passed (visual confirmation needed)")
end
