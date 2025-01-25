execute store result score dimension_players trader_dimension.temp if entity @a[nbt={Dimension:"trader_dimension:pocket"}]
execute if score dimension_players wander.data matches 0 run return 0

execute store result score random trader_dimension.temp run random value 1..4
execute if score hard_mode wander.data matches 1 store result score random trader_dimension.temp run random value 1..6

execute store result storage trader_dimension:temp rand_z_pos float 0.1 run random value 40..110
execute store result storage trader_dimension:temp rand_x_motion float 0.05 run random value -23..-15
execute store result storage trader_dimension:temp rand_y_motion float 0.1 run random value 5..10

execute if score random trader_dimension.temp matches 2..4 store result storage trader_dimension:temp rand_x_motion float 0.05 run random value -10..-5


execute if score random trader_dimension.temp matches 1 in trader_dimension:pocket run function trader_dimension:spawn/summon_entity with storage trader_dimension:temp
execute if score random trader_dimension.temp matches 2..6 in trader_dimension:pocket run function trader_dimension:spawn/summon_block with storage trader_dimension:temp

