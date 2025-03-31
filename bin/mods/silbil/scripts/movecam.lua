-- basic Camera Follow script

local enabled = true

-- sing animations are done with offset
-- loop animations are half of the offset
local offset = {
    x = 50,
    y = 50,
}

local charAnimations = {
    ["singLEFT"]  = {-offset.x, "x"},
    ["singRIGHT"] = { offset.x, "x"},
    ["singUP"]    = {-offset.y, "y"},
    ["singDOWN"]  = { offset.y, "y"},

    ["singLEFT-loop"]  = {-offset.x * 0.5, "x"},
    ["singRIGHT-loop"] = { offset.x * 0.5, "x"},
    ["singUP-loop"]    = {-offset.y * 0.5, "y"},
    ["singDOWN-loop"]  = { offset.y * 0.5, "y"},
}

if not enabled then return end

local focused_on = "boyfriend"
function onMoveCamera(character)
    focused_on = character
end

function onUpdatePost(dt)
    local animation_name = getProperty(focused_on .. ".animation.curAnim.name")
    local animation = charAnimations[animation_name]
    if not animation then return end

    local camera_position = getProperty("camGame.scroll." .. animation[2])

    setProperty(
        "camGame.scroll." .. animation[2],
        lerp(
            camera_position,
            camera_position + (animation[1] * (1 / getProperty('camGame.zoom'))),
            dt * getProperty('cameraSpeed') * playbackRate
        )
    )
end

function lerp(a, b, c)
    return a + (b - a) * c
end