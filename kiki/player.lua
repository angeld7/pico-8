
function player_update()	
	--controls
	player.x-=update_movement(⬅️)
	player.x+=update_movement(➡️) 
	player.y+=update_movement(⬇️)
	player.y-=update_movement(⬆️) 

	--check borders
	player.x=max(0,player.x)
	player.y=max(0,player.y)
	player.x=min(120,player.x)
	player.y=min(120,player.y)
end

function update_movement(direction)
	if btn(direction) then
		return player.speed
	end
	return 0
end

function player_animate()

end