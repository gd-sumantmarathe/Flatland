local inputs_table = {}


local keyEvents =
{
    eventUpKey = false,
    eventDownKey = false,
    eventLeftKey = false,
    eventRightKey = false,
    eventEnterKey = false
}

local keyStates =
{
    stateUpKey = false,
    stateDownKey = false,
    stateLeftKey = false,
    stateRightKey = false,
    stateEnterKey = false
}

local keyPrevStates =
{
    prevStateUpKey = false,
    prevStateDownKey = false,
    prevStateLeftKey = false,
    prevStateRightKey = false,
    prevStateEnterKey = false
}


function inputs_table.IsUpKeyPressed()
    return keyStates.stateUpKey
end

function inputs_table.IsDownKeyPressed()
    return keyStates.stateDownKey
end

function inputs_table.IsLeftKeyPressed()
    return keyStates.stateLeftKey
end

function inputs_table.IsRightKeyPressed()
    return keyStates.stateRightKey
end

function inputs_table.IsEnterKeyPressed()
    return keyStates.stateEnterKey
end



function inputs_table.IsUpKeyEvent()
    return keyEvents.eventUpKey
end

function inputs_table.IsDownKeyEvent()
    return keyEvents.eventDownKey
end

function inputs_table.IsLeftKeyEvent()
    return keyEvents.eventLeftKey
end

function inputs_table.IsRightKeyEvent()
    return keyEvents.eventRightKey
end

function inputs_table.IsEnterKeyEvent()
    return keyEvents.eventEnterKey
end


function inputs_table.GetInputStates()

    keyStates.stateUpKey = love.keyboard.isDown("up")
    keyStates.stateDownKey = love.keyboard.isDown("down")
    keyStates.stateLeftKey = love.keyboard.isDown("left")
    keyStates.stateRightKey = love.keyboard.isDown("right")
    keyStates.stateEnterKey = love.keyboard.isDown("return")

end



function inputs_table.GetInputEvents()

    if keyStates.stateUpKey == true then
        if keyPrevStates.prevStateUpKey == false then
            keyEvents.eventUpKey = true
            keyPrevStates.prevStateUpKey = true
        elseif keyPrevStates.prevStateUpKey == true then
            keyEvents.eventUpKey = false
            keyPrevStates.prevStateUpKey = true
        end
    elseif not(keyStates.stateUpKey == true) then
        if keyPrevStates.prevStateUpKey == true then
            keyEvents.eventUpKey = false
            keyPrevStates.prevStateUpKey = false
        end
    end

    if keyStates.stateDownKey == true then
        if keyPrevStates.prevStateDownKey == false then
            keyEvents.eventDownKey = true
            keyPrevStates.prevStateDownKey = true
        elseif keyPrevStates.prevStateDownKey == true then
            keyEvents.eventDownKey = false
            keyPrevStates.prevStateDownKey = true
        end
    elseif not(keyStates.stateDownKey == true) then
        if keyPrevStates.prevStateDownKey == true then
            keyEvents.eventDownKey = false
            keyPrevStates.prevStateDownKey = false
        end
    end

    if keyStates.stateLeftKey == true then
        if keyPrevStates.prevStateLeftKey == false then
            keyEvents.eventLeftKey = true
            keyPrevStates.prevStateLeftKey = true
        elseif keyPrevStates.prevStateLeftKey == true then
            keyEvents.eventLeftKey = false
            keyPrevStates.prevStateLeftKey = true
        end
    elseif not(keyStates.stateLeftKey == true) then
        if keyPrevStates.prevStateLeftKey == true then
            keyEvents.eventLeftKey = false
            keyPrevStates.prevStateLeftKey = false
        end
    end

    if keyStates.stateRightKey == true then
        if keyPrevStates.prevStateRightKey == false then
            keyEvents.eventRightKey = true
            keyPrevStates.prevStateRightKey = true
        elseif keyPrevStates.prevStateRightKey == true then
            keyEvents.eventRightKey = false
            keyPrevStates.prevStateRightKey = true
        end
    elseif not(keyStates.stateRightKey == true) then
        if keyPrevStates.prevStateRightKey == true then
            keyEvents.eventRightKey = false
            keyPrevStates.prevStateRightKey = false
        end
    end


    if keyStates.stateEnterKey == true then
        if keyPrevStates.prevStateEnterKey == false then
            keyEvents.eventEnterKey = true
            keyPrevStates.prevStateEnterKey = true
        elseif keyPrevStates.prevStateEnterKey == true then
            keyEvents.eventEnterKey = false
            keyPrevStates.prevStateEnterKey = true
        end
    elseif not(keyStates.stateEnterKey == true) then
        if keyPrevStates.prevStateEnterKey == true then
            keyEvents.eventEnterKey = false
            keyPrevStates.prevStateEnterKey = false
        end
    end



end


return inputs_table
