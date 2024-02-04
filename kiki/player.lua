
rainbow={}
rainbow_sp=2

function player_update()	

	--controls
	local dx=0
	dx-=update_movement(⬅️)
	dx+=update_movement(➡️) 
	local dy=0
	dy+=update_movement(⬇️)
	dy-=update_movement(⬆️)

	--check borders
	if player.x+dx > 120 or player.x+dx < 0 then
		dx=0
	end
	if player.y+dy > 120 or player.y+dy < 0 then
		dy=0
	end

	rainbow_update(player.x+4, player.y, dx, dy)
	player.x += dx
	player.y += dy
end

function rainbow_update(x,y,dx,dy)
	local rainbow_new={}
	local cur_dx=dx
	local cur_dy=dy
	for i=1, max(abs(dx),abs(dy))+1 do
		rainbow_new[i] = { x=x+cur_dx, y=y+cur_dy }
		cur_dx = move_toward_zero(cur_dx)
		cur_dy = move_toward_zero(cur_dy)
	end
	local i=#rainbow_new
	for n in pairs(rainbow) do
		local seg = rainbow[n]
		seg.x-=1
		if seg.x>=-8 then	
			i+=1
			rainbow_new[i]=seg
		end
	end
	rainbow=rainbow_new
end

function move_toward_zero(val)
	if val < 0 then 
		return val + 1
	elseif val > 0 then 
		return val - 1 
	end
	return 0
end

function rainbow_draw()
	palt(12,false)
	palt(0,true)
	-- printh(rainbow[0].x)
	for i in pairs(rainbow) do
		local seg = rainbow[i]
		spr(rainbow_sp,seg.x,seg.y,1/8,1,false)
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