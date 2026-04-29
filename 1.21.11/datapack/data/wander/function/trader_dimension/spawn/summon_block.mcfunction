

execute store result score random_block wander.trader_dimension run random value 1..35

$execute if score random_block wander.trader_dimension matches 1..12 run summon falling_block 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],BlockState:{Name:"oak_planks"},Time:525,DropItem:0b}
$execute if score random_block wander.trader_dimension matches 13..28 run summon falling_block 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],BlockState:{Name:"stone"},Time:525,DropItem:0b}
$execute if score random_block wander.trader_dimension matches 29..30 run summon falling_block 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],BlockState:{Name:"minecraft:dried_kelp_block"},Time:525,DropItem:0b}
$execute if predicate {"condition":"minecraft:random_chance","chance":0.5} if score random_block wander.trader_dimension matches 31..34 run summon falling_block 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],BlockState:{Name:"tnt",Properties:{unstable:"true"}},Time:525,DropItem:0b}
$execute if predicate {"condition":"minecraft:random_chance","chance":0.05} if score random_block wander.trader_dimension matches 35 run summon tnt 18 10 $(rand_z_pos) {Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],fuse:120}
