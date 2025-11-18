
execute store result score random_mob trader_dimension.temp run random value 1..8
$execute if score random_mob trader_dimension.temp matches 1..4 run summon zombie 18 10 $(rand_z_pos) {attributes:[{id:"minecraft:fall_damage_multiplier",base:0.0d}],Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],DeathLootTable:"minecraft:empty"}
$execute if score random_mob trader_dimension.temp matches 5..6 run summon skeleton 18 10 $(rand_z_pos) {attributes:[{id:"minecraft:fall_damage_multiplier",base:0.0d}],Motion:[$(rand_x_motion)d,$(rand_y_motion)d,0.0d],Tags:["trader_dimension.chest_mob"],equipment:{mainhand:{count: 1, id: "minecraft:bow"}},DeathLootTable:"minecraft:empty"}
