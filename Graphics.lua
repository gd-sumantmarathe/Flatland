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



function graphics_table.DrawScreen (screen)

    love.graphics.clear()

    if screen.type == "startScreen" then
        love.graphics.rectangle("line", (love.graphics.getWidth() / 2) - (screen.length / 2), (love.graphics.getHeight() / 2) - (screen.breadth / 2), screen.length, screen.breadth, 15, 15)

        for count = 0, table.getn(screen.contents), 1 do
            if screen.contents[count].mode == "selected" then
                love.graphics.setColor(0, 0, 1)
            elseif screen.contents[count].mode == "notSelected" then
                love.graphics.setColor(1, 1, 1)
            elseif screen.contents[count].mode == "disabledAndSelected" then
                love.graphics.setColor(0.55, 0.55, 0.55)
            elseif screen.contents[count].mode == "disabledAndNotSelected" then
                love.graphics.setColor(0.4, 0.4, 0.4)
            end

            love.graphics.print(screen.contents[count].name, screen.contents[count].posX, screen.contents[count].posY)

            love.graphics.setColor(255, 255, 255)

        end

    end

end


return graphics_table
