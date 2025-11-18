

execute store result score random_block trader_dimension.temp run random value 1..18

$execute if score random_block trader_dimension.temp matches 1..6 run summon falling_block 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],BlockState:{Name:"oak_planks"}}
$execute if score random_block trader_dimension.temp matches 7..15 run summon falling_block 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],BlockState:{Name:"stone"}}
$execute if score random_block trader_dimension.temp matches 16..17 run summon falling_block 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],BlockState:{Name:"tnt",Properties:{unstable:"true"}}}
$execute if score random_block trader_dimension.temp matches 18 run summon tnt 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],fuse:120}
