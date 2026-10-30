# Generated with MC-Build

execute if score bad_omen wander.data matches 1 run return run function wander:trader_dimension/chest/zzz/0
execute store result score random_event wander.trader_dimension run random value 0..20
execute if score random_event wander.trader_dimension matches 1..12 run return run function wander:trader_dimension/chest/mob
execute if entity @p[distance=0..20] if score random_event wander.trader_dimension matches 13 run return run function wander:trader_dimension/scan/init
execute if score random_event wander.trader_dimension matches 14..18 run return run function wander:trader_dimension/chest/nothing
execute if score random_event wander.trader_dimension matches 19..20 run return run function wander:trader_dimension/chest/escape