
local module_folder = "K:/GameDevs/Love_Games/Flatland"
package.path = module_folder .. "?.lua;" .. package.path

local databaseGame = require("Database")
local graphicsGame = require("Graphics")
local physicsGame = require("Physics")
local screenManager = require("ScreenManager")
local stateManager = require("StateManager")
local inputsGame = require("Inputs")


function love.load()

	love.graphics.setFont(graphicsGame.font)

	stateManager.SetGameState("init")

end


function love.draw()


	graphicsGame.DrawScreen()



end


function love.update(dt)

	inputsGame.GetInputStates()
	inputsGame.GetInputEvents()

	stateManager.ProcessState()



	--physicsGame.MovePlayer(player)

end
