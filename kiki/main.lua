function _update()
	player_update()
	player_animate()
	map_update()
end

function _draw()
	cls(12)
	palt(12,true)
	palt(0,false)
	map_background_draw()
	player_draw()
	map_foreground_draw()
end