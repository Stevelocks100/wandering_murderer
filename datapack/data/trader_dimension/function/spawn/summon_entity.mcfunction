
execute store result score random_mob trader_dimension.temp run random value 1..8

$execute if score random_mob trader_dimension.temp matches 1..3 run summon zombie 18 10 $(rand_z_pos) {attributes:[{id:"minecraft:generic.fall_damage_multiplier",base:0.0d}],Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"]}
$execute if score random_mob trader_dimension.temp matches 4..6 run summon skeleton 18 10 $(rand_z_pos) {attributes:[{id:"minecraft:generic.fall_damage_multiplier",base:0.0d}],Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],HandItems:[{count: 1, id: "minecraft:bow"}, {}]}
$execute if score random_mob trader_dimension.temp matches 7 run summon villager 18 10 $(rand_z_pos) {attributes:[{id:"minecraft:generic.fall_damage_multiplier",base:0.0d}],Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"]}
$execute if score random_mob trader_dimension.temp matches 8 run summon creeper 18 10 $(rand_z_pos) {attributes:[{id:"minecraft:generic.fall_damage_multiplier",base:0.0d}],Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"]}
