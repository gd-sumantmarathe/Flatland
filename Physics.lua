local physics_table = {}

function physics_table.MovePlayer(player)

	if(love.keyboard.isDown("up")) then
		player.posX = player.posX + player.translationalSpeed * math.cos(player.angle * (math.pi / 180))
		player.posY = player.posY + player.translationalSpeed * math.sin(player.angle * (math.pi / 180))
	end

	if(love.keyboard.isDown("down")) then
		player.posX = player.posX - player.translationalSpeed * math.cos(player.angle * (math.pi / 180))
		player.posY = player.posY - player.translationalSpeed * math.sin(player.angle * (math.pi / 180))
	end

	if(love.keyboard.isDown("left")) then
		player.angle = player.angle - player.rotationalSpeed
	end

	if(love.keyboard.isDown("right")) then
		player.angle = player.angle + player.rotationalSpeed
	end

end

return physics_table
