local screenManager = require("ScreenManager")

local graphics_table = {}

graphics_table.font = love.graphics.newFont("Fonts/adam-warren-pro/adamwarrenpro.ttf", 40)


function graphics_table.DrawCharacter (character)

    love.graphics.translate(character.posX, character.posY)
    love.graphics.rotate(character.angle * (math.pi / 180))
    love.graphics.translate(-character.posX, -character.posY)

    if character.shapeType == "rectangle" then
      love.graphics.rectangle("fill", (character.posX - character.length / 2), (character.posY - character.breadth / 2), character.length, character.breadth)
    end

end


local function DrawScreen_Menu(screen)

    love.graphics.rectangle("line", (love.graphics.getWidth() / 2) - (screen.length / 2), (love.graphics.getHeight() / 2) - (screen.breadth / 2), screen.length, screen.breadth, 15, 15)

    for count = 0, table.getn(screen.options), 1 do
        if screen.options[count].mode == "selected" then
            love.graphics.setColor(0, 0, 1)
        elseif screen.options[count].mode == "notSelected" then
            love.graphics.setColor(1, 1, 1)
        elseif screen.options[count].mode == "disabledAndSelected" then
            love.graphics.setColor(0.55, 0.55, 0.55)
        elseif screen.options[count].mode == "disabledAndNotSelected" then
            love.graphics.setColor(0.4, 0.4, 0.4)
        end

        love.graphics.print(screen.options[count].name, screen.options[count].posX, screen.options[count].posY)

        love.graphics.setColor(1, 1, 1)

    end

end




local function DrawScreen_Map(screen)

    love.graphics.setColor(0, 0, 0.2)
    love.graphics.rectangle("fill", 0, 0, screen.length, screen.breadth)
    love.graphics.setColor(1, 1, 1)


    for count = 0, table.getn(screen.charactersOnMap.character), 1 do

        love.graphics.translate(screen.charactersOnMap.character[count].posX, screen.charactersOnMap.character[count].posY)
        love.graphics.rotate(screen.charactersOnMap.character[count].angle * (math.pi / 180))
        love.graphics.translate(-screen.charactersOnMap.character[count].posX, -screen.charactersOnMap.character[count].posY)

        if screen.charactersOnMap.character[count].shapeType == "rectangle" then
          love.graphics.rectangle("fill", (screen.charactersOnMap.character[count].posX - screen.charactersOnMap.character[count].length / 2), (screen.charactersOnMap.character[count].posY - screen.charactersOnMap.character[count].breadth / 2), screen.charactersOnMap.character[count].length, screen.charactersOnMap.character[count].breadth)
        end


    end





end




function graphics_table.DrawScreen ()

    love.graphics.clear()

    currScreen = screenManager.GetCurrentScreen()

    if currScreen.type == "menu" then
        DrawScreen_Menu(currScreen)
    elseif currScreen.type == "map" then
        DrawScreen_Map(currScreen)
    end

end


return graphics_table
