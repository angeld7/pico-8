distant_x=0
background_x=0
foreground_x=0 
map_width=128
distant_tile_x=0
background_tile_x=16
foreground_tile_x=32

function map_background_draw()
    draw_layer(distant_tile_x, distant_x)
    draw_layer(background_tile_x, background_x)
end

function map_foreground_draw()
    draw_layer(foreground_tile_x, foreground_x)
end

function map_update()
    distant_x=layer_position(distant_x, 1)
    background_x=layer_position(background_x,2)
    foreground_x=layer_position(foreground_x,4)
end

function draw_layer(layer_tile_x, layer_x)
	map(layer_tile_x,0,layer_x,0,16,16)
	map(layer_tile_x,0,layer_x+map_width,0,16,16)
end

function layer_position(current_x, speed)
    new_x=current_x-speed
    if new_x < -map_width then
        new_x=0
    end
    return new_x
end