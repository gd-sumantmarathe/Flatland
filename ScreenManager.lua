local inputsGame = require("Inputs")

local startScreen = require("Screen_StartScreen")

local screenManager_table = {}

local currScreen =
{
    length,
    breadth,
    name,
    selectedOption,
    type,

    options = {}
}

local keyPressedTime = 0

function screenManager_table.LoadScreen(screen)

    if screen == "screen_start" then
        currScreen = startScreen.contents

    elseif screen == "screen_pause" then

    end

end


function screenManager_table.GetCurrentScreen()
    return currScreen
end


local function ProcessScreen_Menu()

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






end



function screenManager_table.ProcessScreen()

    if currScreen.type == "menu" then

        ProcessScreen_Menu()

    end

end






return screenManager_table
