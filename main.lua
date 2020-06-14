
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
	--player = databaseGame.Character:CreateNew("PC", "rectangle")
	--ground = databaseGame.Map:CreateNew("MAP01", 600, 400)
end


function love.draw()

	graphicsGame.DrawScreen()



	--graphicsGame.DrawCharacter(player)

end


function love.update(dt)

	inputsGame.GetInputStates()
	inputsGame.GetInputEvents()

	stateManager.ProcessState()
	screenManager.ProcessScreen()


	--physicsGame.MovePlayer(player)

end
