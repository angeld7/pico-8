enemy_sprite = 129	

local enemies_x = {
    [1] = 129,
    [2] = 129,
    [3] = 129,
    [4] = 129,
    [5] = 129,
    [6] = 129,
    [7] = 129,
    [8] = 129,
    [9] = 129,
    [10] = 129,
    [11] = 129,
    [12] = 129,
    [13] = 129,
    [14] = 129,
    [15] = 129
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