
local module_folder = "K:/GameDevs/Love_Games/Flatland"
package.path = module_folder .. "?.lua;" .. package.path

local databaseGame = require("Database")
local graphicsGame = require("Graphics")
local physicsGame = require("Physics")
local screensGame = require("Screens")
local inputsGame = require("Inputs")

gameState = ""

function love.load()

	love.graphics.setFont(graphicsGame.font)

	gameState = "start"
	--player = databaseGame.Character:CreateNew("PC", "rectangle")
	--ground = databaseGame.Map:CreateNew("MAP01", 600, 400)
end


function love.draw()

	if gameState == "start" then
		screen = screensGame.LoadScreen("startScreen")
		graphicsGame.DrawScreen(screen)
		screensGame.ProcessScreen("startScreen", screen)

	elseif gameState == "inGame" then

	elseif gameState == "pause" then

	else

	end



	--graphicsGame.DrawCharacter(player)

end


function love.update(dt)
	
	inputsGame.GetInputStates()
	inputsGame.GetInputEvents()


	--physicsGame.MovePlayer(player)

end
