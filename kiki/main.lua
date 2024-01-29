function _update()
	player_update()
	player_animate()
end

function _draw()
	cls()
	palt(0,false)
	palt(13,true)
	map(0,0)
	spr(player.sp,player.x,player.y,1,1,player.flp)
end