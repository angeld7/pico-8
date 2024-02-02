enemy_sprite = 129	
local enemies_x = {
    [1] = rnd(129),
    [2] = rnd(129),
    [3] = rnd(129),
    [4] = rnd(129),
    [5] = rnd(129),
    [6] = rnd(129),
    [7] = rnd(129),
    [8] = rnd(129),
    [9] = rnd(129),
    [10] = rnd(129),
    [11] = rnd(129),
    [12] = rnd(129),
    [13] = rnd(129),
    [14] = rnd(129),
    [15] = rnd(129)
}

function enemies_update()
    for i,_ in pairs(enemies_x) do     
        enemies_x[i] = enemies_x[i] - rnd(5), 0
        if enemies_x[i] <= 0 then
            enemies_x[i] = 129
        end
    end
end

function enemies_draw()
    for i, enemy_x in ipairs(enemies_x) do     
        spr(enemy_sprite,enemy_x,i*16,1,1,false)
    end
end