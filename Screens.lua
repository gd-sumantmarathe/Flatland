local inputsGame = require("Inputs")

local screens_table = {}
local keyPressedTime = 0

screens_table.startScreen =
{
    length = 500,
    breadth = 500,
    type = "startScreen",
    selectedOption = 0,

    contents =
    {
        [0] = {["name"] = "Start Game", ["posX"] = 250, ["posY"] = 100, ["mode"] = "selected"},
        [1] = {["name"] = "Load Game",  ["posX"] = 250, ["posY"] = 210, ["mode"] = "disabledAndNotSelected"},
        [2] = {["name"] = "Options",    ["posX"] = 250, ["posY"] = 320, ["mode"] = "notSelected"},
        [3] = {["name"] = "Exit",       ["posX"] = 250, ["posY"] = 430, ["mode"] = "notSelected"}
    }

}


function screens_table.LoadScreen(screenName)

    if screenName == "startScreen" then
        return screens_table.startScreen
    else
        return nil
    end

end


function screens_table.ProcessScreen(screenName, screen)

    local prevSelectedOption = 0
    local currTime = love.timer.getTime()

    local screenKeyPressedTimeDelay = 0.4
    local screenKeyEventTimeDelay = 0.1
    local timeDiff = currTime - keyPressedTime

    if inputsGame.IsUpKeyPressed() == true then
        if inputsGame.IsUpKeyEvent() == true then
            if timeDiff >= screenKeyEventTimeDelay then
                keyPressedTime = love.timer.getTime()
                prevSelectedOption = screen.selectedOption
                screen.selectedOption = screen.selectedOption - 1
            end
        elseif(timeDiff >= screenKeyPressedTimeDelay) then
            keyPressedTime = love.timer.getTime()
            prevSelectedOption = screen.selectedOption
            screen.selectedOption = screen.selectedOption - 1
        end

        if screen.selectedOption < 0 then
            screen.selectedOption = table.getn(screen.contents)
        end
    elseif inputsGame.IsDownKeyPressed() == true then
        if inputsGame.IsDownKeyEvent() == true then
            if timeDiff >= screenKeyEventTimeDelay then
                keyPressedTime = love.timer.getTime()
                prevSelectedOption = screen.selectedOption
                screen.selectedOption = screen.selectedOption + 1
            end
        elseif(timeDiff >= screenKeyPressedTimeDelay) then
            keyPressedTime = love.timer.getTime()
            prevSelectedOption = screen.selectedOption
            screen.selectedOption = screen.selectedOption + 1
        end

        if screen.selectedOption > table.getn(screen.contents) then
            screen.selectedOption = 0
        end
    end

    if not(screen.selectedOption == prevSelectedOption) then
        if screen.contents[screen.selectedOption].mode == "disabledAndNotSelected" then
            screen.contents[screen.selectedOption].mode = "disabledAndSelected"
        elseif screen.contents[screen.selectedOption].mode == "notSelected" then
            screen.contents[screen.selectedOption].mode = "selected"
        end

        if screen.contents[prevSelectedOption].mode == "disabledAndSelected" then
            screen.contents[prevSelectedOption].mode = "disabledAndNotSelected"
        elseif screen.contents[prevSelectedOption].mode == "selected" then
            screen.contents[prevSelectedOption].mode = "notSelected"
        end
    end

    if (inputsGame.IsEnterKeyEvent() == true) and (screen.contents[screen.selectedOption].mode == "selected") then
        if screen.selectedOption == 0 then

        elseif screen.selectedOption == 1 then

        elseif screen.selectedOption == 2 then

        elseif screen.selectedOption == 3 then
            love.event.quit(0)
        end
    end


end




return screens_table
