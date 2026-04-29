


execute store result score random wander.trader_dimension run random value 1..4
execute if score bad_omen wander.data matches 1 store result score random wander.trader_dimension run random value 1..50

execute store result storage wander:temp trader_dimension.rand_z_pos float 0.1 run random value 40..110
execute store result storage wander:temp trader_dimension.rand_x_motion float 0.05 run random value -23..-15
execute store result storage wander:temp trader_dimension.rand_y_motion float 0.1 run random value 5..10

execute if score random wander.trader_dimension matches 3.. store result storage wander:temp trader_dimension.rand_x_motion float 0.05 run random value -10..-5


execute if score random wander.trader_dimension matches ..2 in wander:pocket run function wander:trader_dimension/spawn/summon_entity with storage wander:temp trader_dimension
execute if score random wander.trader_dimension matches 3.. in wander:pocket run function wander:trader_dimension/spawn/summon_block with storage wander:temp trader_dimension

