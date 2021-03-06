local screenManager = require("ScreenManager")


local stateManager_table = {}

local gameState = "none"


function stateManager_table.GetGameState()
    return gameState
end

function stateManager_table.SetGameState(state)
    gameState = state
end

local function ProcessState_Init()
    screenManager.LoadScreen("screen_start")
    stateManager_table.SetGameState("start")
end


local function ProcessState_Start()
    nextState = screenManager.ProcessScreen(gameState)

    if nextState == "inGame" then
        screenManager.LoadScreen("screen_map_00")
        stateManager_table.SetGameState("inGame")
    end


end


local function ProcessState_InGame()
    nextState = screenManager.ProcessScreen()

    if nextState == "pause" then
        screenManager.LoadScreen("screen_pause")
        stateManager_table.SetGameState("pause")
    end

end


local function ProcessState_Pause()
    nextState = screenManager.ProcessScreen()

end



function stateManager_table.ProcessState()

    currState = stateManager_table.GetGameState()

    if currState == "init" then
        ProcessState_Init()
    elseif currState == "start" then
        ProcessState_Start()
    elseif currState == "inGame" then
        ProcessState_InGame()
    elseif currState == "pause" then
        ProcessState_Pause()
    end

end






return stateManager_table
