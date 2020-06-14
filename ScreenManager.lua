local inputsGame = require("Inputs")
local databaseGame = require("Database")
local physicsGame = require("Physics")

local startScreen = require("Screen_StartScreen")
local pauseScreen = require("Screen_PauseScreen")
local map00 = require("Screen_Map00")

local screenManager_table = {}

local currScreen = {}

local keyPressedTime = 0

function screenManager_table.LoadScreen(screen)

    if screen == "screen_start" then
        currScreen = startScreen.contents

    elseif screen == "screen_pause" then
        currScreen = pauseScreen.contents

    elseif screen == "screen_map_00" then
        currScreen = map00.contents
        player = databaseGame.Character:CreateNew("PC", "rectangle")
        map00.AddCharacter(player)
    end

end


function screenManager_table.GetCurrentScreen()
    return currScreen
end


local function ProcessScreen_Menu(retState)

    local prevSelectedOption = 0
    local currTime = love.timer.getTime()

    local screenKeyPressedTimeDelay = 0.4
    local screenKeyEventTimeDelay = 0.1
    local timeDiff = currTime - keyPressedTime

    if inputsGame.IsUpKeyPressed() == true then
        if inputsGame.IsUpKeyEvent() == true then
            if timeDiff >= screenKeyEventTimeDelay then
                keyPressedTime = love.timer.getTime()
                prevSelectedOption = currScreen.selectedOption
                currScreen.selectedOption = currScreen.selectedOption - 1
            end
        elseif(timeDiff >= screenKeyPressedTimeDelay) then
            keyPressedTime = love.timer.getTime()
            prevSelectedOption = currScreen.selectedOption
            currScreen.selectedOption = currScreen.selectedOption - 1
        end

        if currScreen.selectedOption < 0 then
            currScreen.selectedOption = table.getn(currScreen.options)
        end
    elseif inputsGame.IsDownKeyPressed() == true then
        if inputsGame.IsDownKeyEvent() == true then
            if timeDiff >= screenKeyEventTimeDelay then
                keyPressedTime = love.timer.getTime()
                prevSelectedOption = currScreen.selectedOption
                currScreen.selectedOption = currScreen.selectedOption + 1
            end
        elseif(timeDiff >= screenKeyPressedTimeDelay) then
            keyPressedTime = love.timer.getTime()
            prevSelectedOption = currScreen.selectedOption
            currScreen.selectedOption = currScreen.selectedOption + 1
        end

        if currScreen.selectedOption > table.getn(currScreen.options) then
            currScreen.selectedOption = 0
        end
    end

    if not(currScreen.selectedOption == prevSelectedOption) then
        if currScreen.options[currScreen.selectedOption].mode == "disabledAndNotSelected" then
            currScreen.options[currScreen.selectedOption].mode = "disabledAndSelected"
        elseif currScreen.options[currScreen.selectedOption].mode == "notSelected" then
            currScreen.options[currScreen.selectedOption].mode = "selected"
        end

        if currScreen.options[prevSelectedOption].mode == "disabledAndSelected" then
            currScreen.options[prevSelectedOption].mode = "disabledAndNotSelected"
        elseif currScreen.options[prevSelectedOption].mode == "selected" then
            currScreen.options[prevSelectedOption].mode = "notSelected"
        end
    end


    if inputsGame.IsEnterKeyEvent() == true then

        if currScreen.options[currScreen.selectedOption].name == "Start Game" then
            retState = "inGame"
        elseif currScreen.options[currScreen.selectedOption].name == "Options" then

        elseif currScreen.options[currScreen.selectedOption].name == "Continue" then

        elseif currScreen.options[currScreen.selectedOption].name == "Exit" then
            love.event.quit()
        end

    end


    return retState

end


local function ProcessScreen_Map(retState)

    physicsGame.MovePlayer(player)
    if inputsGame.IsEscKeyEvent() == true then
        retState = "pause"
    end

    return retState

end




function screenManager_table.ProcessScreen(gameState)

    local retState = gameState

    if currScreen.type == "menu" then
        retState = ProcessScreen_Menu(retState)
    elseif currScreen.type == "map" then
        retState = ProcessScreen_Map(retState)
    end

    return retState

end






return screenManager_table
