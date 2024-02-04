
rainbow={}
rainbow_sp=2

function player_update()	

	--set moving flags
	player.moving_y = btn(⬆️) or btn(⬇️)
	player.moving_back = btn(⬅️)

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

	rainbow_update()
end

function rainbow_update()
	local rainbow_new={}
	if not player.moving_y and not player.moving_back then
		local i=0
		local x = player.x-3
		local y = player.y
		rainbow_new[i] = { x=x, y=y }
	end

	for i in pairs(rainbow) do
		local seg = rainbow[i]
		seg.x-=1
		if seg.x>=-8 then	
			i+=1
			rainbow_new[i]=seg
		end
	end
	rainbow=rainbow_new
end

function rainbow_draw()
	palt(12,false)
	palt(0,true)
	-- printh(rainbow[0].x)
	for i in pairs(rainbow) do
		local seg = rainbow[i]
		spr(rainbow_sp,seg.x,seg.y,1,1,false)
	end
	palt(0,false)
	palt(12,true)
end

function update_movement(direction)
	if btn(direction) then
		return player.speed
	end
	return 0
end

function player_draw()
	rainbow_draw()
    spr(player.sp,player.x,player.y,1,1,false)
end

function player_animate()

end