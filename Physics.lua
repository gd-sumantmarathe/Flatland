local physics_table = {}

function physics_table.MovePlayer(player)

	mouseX, mouseY = love.mouse.getPosition()


	if (love.keyboard.isDown("up")) or (love.keyboard.isDown("w")) then
		player.posY = player.posY - player.translationalSpeed
	end

	if (love.keyboard.isDown("down")) or (love.keyboard.isDown("s")) then
		player.posY = player.posY + player.translationalSpeed
	end

	if (love.keyboard.isDown("left")) or (love.keyboard.isDown("a")) then
		player.posX = player.posX - player.translationalSpeed

	end

	if (love.keyboard.isDown("right")) or (love.keyboard.isDown("d")) then
		player.posX = player.posX + player.translationalSpeed

	end

	player.angle = math.atan2(mouseY - player.posY, mouseX - player.posX) * (180 / math.pi)



end

return physics_table
