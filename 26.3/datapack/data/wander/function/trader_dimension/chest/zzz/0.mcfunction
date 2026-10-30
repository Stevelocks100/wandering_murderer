# Generated with MC-Build

execute store result score random_event wander.trader_dimension run random value 0..40
execute if score random_event wander.trader_dimension matches 1..19 run return run function wander:trader_dimension/chest/mob
execute if score random_event wander.trader_dimension matches 20..29 run return run function wander:trader_dimension/chest/nothing
execute if score random_event wander.trader_dimension matches 30..31 run return run function wander:trader_dimension/scan/init
execute if score random_event wander.trader_dimension matches 32..40 run return run function wander:trader_dimension/chest/escape